org $098000

; spawning sprites routine
; checks all sprites for being within spawning range
; of new row & new column both
; if so, submits new entry into newly spawned table
; parameters:
; r1: camera X new column: cam X + offset (288 right or 48 left)
; r2: camera Y boundary top: cam Y - 32
; r3: camera Y new row: cam Y + offset (272 down or 32 up)
; r4: camera X boundary left side: cam X - 48
gsu_check_new_sprites:
  cache                                     ; $098000 |
  from r1                                   ; $098001 |\
  asr                                       ; $098002 | |
  asr                                       ; $098003 | |
  asr                                       ; $098004 | |
  to r1                                     ; $098005 | | [spawn_X_new_column]
  asr                                       ; $098006 | |
  from r2                                   ; $098007 | |
  asr                                       ; $098008 | |
  asr                                       ; $098009 | |
  asr                                       ; $09800A | |
  to r2                                     ; $09800B | | [spawn_Y_top_bound]
  asr                                       ; $09800C | |
  from r3                                   ; $09800D | | divide camera positions by 16
  asr                                       ; $09800E | | giving tile region
  asr                                       ; $09800F | |
  asr                                       ; $098010 | |
  to r3                                     ; $098011 | | [spawn_Y_new_row]
  asr                                       ; $098012 | |
  from r4                                   ; $098013 | |
  asr                                       ; $098014 | |
  asr                                       ; $098015 | |
  asr                                       ; $098016 | |
  to r4                                     ; $098017 | | [spawn_X_left_bound]
  asr                                       ; $098018 |/
  ibt   r5,#$FFFF                           ; $098019 | sprite data end marker
  iwt   r6,#$01FF                           ; $09801B | sprite ID mask
  ibt   r7,#$0016                           ; $09801E | number of columns for spawn check
  ibt   r13,#$0014                          ; $098020 | number of rows for spawn check
  ibt   r8,#$0000                           ; $098022 | stage ID index
  iwt   r9,#$28CA                           ; $098024 | stage sprites spawning flags table
  iwt   r10,#$27CE                          ; $098027 | newly spawned sprites table
  lm    r0,($2602)                          ; $09802A |\
  romb                                      ; $09802E | | long sprite data ROM pointer for current level
  lm    r14,($2600)                         ; $098030 |/

.spawn_loop
  ldb   (r9)                                ; $098034 |\
  dec   r0                                  ; $098036 | | loop through all stage sprites
  bmi .check_sprite_ROM_done                ; $098037 | |
  getb                                      ; $098039 | | if spawning flag is > 0
  with r14                                  ; $09803A | | go to next
  add   #3                                  ; $09803B | |
  inc   r8                                  ; $09803D | | this checks the flag for $0000
  bra .spawn_loop                           ; $09803E | | if $00FF, value will be positive
  inc   r9                                  ; $098040 |/  hence do not spawn and skip

.check_sprite_ROM_done
  inc   r14                                 ; $098041 |\
  to r12                                    ; $098042 | |
  getbh                                     ; $098043 | | if first word of current level sprite
  from r12                                  ; $098045 | | == $FFFF
  sub   r5                                  ; $098046 | | break out of loop
  beq .ret                                  ; $098047 |/
  inc   r14                                 ; $098049 |
  from r12                                  ; $09804A |\  first word of current level sprite
  and   r6                                  ; $09804B | | & sprite ID mask gives sprite ID
  stw   (r10)                               ; $09804C |/  sprite ID -> $7027CE,x
  to r11                                    ; $09804D |\ [stage_sprite_X_tile]
  getb                                      ; $09804E |/ r11 = third byte of current level sprite
  inc   r14                                 ; $09804F |\
  from r12                                  ; $098050 | | [stage_sprite_Y_tile]
  hib                                       ; $098051 | | r12 = second byte of current level sprite
  lsr                                       ; $098052 | | >> 1 (to get rid of high ID)
  move  r12,r0                              ; $098053 |/
  sub   r3                                  ; $098055 |\ if stage_sprite_Y_tile
  bne .check_new_column                     ; $098056 |/ != spawn_Y_new_row
  from r11                                  ; $098058 |\  if sprite is on the new row, check
  sub   r4                                  ; $098059 | | if sprite column > spawn_X_left_bound
  bmi .check_new_column_from                ; $09805A | | and sprite column < spawn_X_left_bound + 22
  sub   r7                                  ; $09805C | | this means sprite is within spawning range
  bmi .spawn_sprite                         ; $09805D |/  so, spawn! else check new column

.check_new_column_from
  from r11                                  ; $09805F |

.check_new_column
  sub   r1                                  ; $098060 |\ if stage_sprite_X_tile
  bne .spawn_continue                       ; $098061 |/ != spawn_X_new_column
  from r12                                  ; $098063 |\
  sub   r2                                  ; $098064 | | if sprite is on the new column, check
  bmi .spawn_continue                       ; $098065 | | if sprite row > spawn_Y_top_bound
  sub   r13                                 ; $098067 | | and sprite row < spawn_Y_top_bound + 20
  bpl .spawn_continue                       ; $098068 | | this means sprite is within spawning range
  nop                                       ; $09806A |/  so, spawn! else go to next in loop

; this doesn't truly "spawn" the sprite
; but just submits a new entry into newly spawned table
; SCPU will then read through this table checking for entries
.spawn_sprite
  inc   r10                                 ; $09806B |\
  inc   r10                                 ; $09806C | | x tile position -> $7027D0,x
  from r11                                  ; $09806D | |
  stw   (r10)                               ; $09806E |/
  inc   r10                                 ; $09806F |\
  inc   r10                                 ; $098070 | | y tile position -> $7027D2,x
  from r12                                  ; $098071 | |
  stw   (r10)                               ; $098072 |/
  inc   r10                                 ; $098073 |\
  inc   r10                                 ; $098074 | | stage ID -> $7027D4,x
  from r8                                   ; $098075 | |
  stw   (r10)                               ; $098076 |/
  inc   r10                                 ; $098077 |\
  inc   r10                                 ; $098078 | | $00FF -> $7028CA + stage ID
  from r5                                   ; $098079 | | this marks stage ID as "spawned in"
  stb   (r9)                                ; $09807A |/  so, don't spawn again

.spawn_continue
  inc   r8                                  ; $09807C | increment stage ID
  bra .spawn_loop                           ; $09807D |\ loop back up
  inc   r9                                  ; $09807F |/ end spawn_loop

.ret
  from r5                                   ; $098080 |\ store end marker $FFFF
  stw   (r10)                               ; $098081 |/
  stop                                      ; $098082 |
  nop                                       ; $098083 |

  iwt   r1,#$10E2                           ; $098084 |
  iwt   r2,#$1182                           ; $098087 |
  iwt   r3,#$1B56                           ; $09808A |
  iwt   r4,#$0F00                           ; $09808D |
  iwt   r5,#$1CD6                           ; $098090 |
  cache                                     ; $098093 |
  ibt   r12,#$0018                          ; $098094 |
  move  r13,r15                             ; $098096 |
  ldb   (r4)                                ; $098098 |
  with r4                                   ; $09809A |
  add   #4                                  ; $09809B |
  dec   r0                                  ; $09809D |
  bpl CODE_0980B4                           ; $09809E |
  inc   r0                                  ; $0980A0 |
  move  r6,r12                              ; $0980A1 |
  stb   (r6)                                ; $0980A3 |
  ibt   r0,#$0004                           ; $0980A5 |
  with r1                                   ; $0980A7 |
  add   r0                                  ; $0980A8 |
  with r2                                   ; $0980A9 |
  add   r0                                  ; $0980AA |
  with r3                                   ; $0980AB |
  add   r0                                  ; $0980AC |
  with r5                                   ; $0980AD |
  add   r0                                  ; $0980AE |
  loop                                      ; $0980AF |
  nop                                       ; $0980B0 |
  bra CODE_0980D7                           ; $0980B1 |
  nop                                       ; $0980B3 |

CODE_0980B4:
  sub   #14                                 ; $0980B4 |
  bcs CODE_0980BA                           ; $0980B6 |
  inc   r0                                  ; $0980B8 |
  sub   r0                                  ; $0980B9 |

CODE_0980BA:
  move  r6,r12                              ; $0980BA |
  stb   (r6)                                ; $0980BC |
  to r6                                     ; $0980BE |
  ldw   (r1)                                ; $0980BF |
  with r1                                   ; $0980C0 |
  add   #4                                  ; $0980C1 |
  ldw   (r3)                                ; $0980C3 |
  inc   r3                                  ; $0980C4 |
  inc   r3                                  ; $0980C5 |
  add   r6                                  ; $0980C6 |
  stw   (r5)                                ; $0980C7 |
  inc   r5                                  ; $0980C8 |
  inc   r5                                  ; $0980C9 |
  to r6                                     ; $0980CA |
  ldw   (r2)                                ; $0980CB |
  with r2                                   ; $0980CC |
  add   #4                                  ; $0980CD |
  ldw   (r3)                                ; $0980CF |
  inc   r3                                  ; $0980D0 |
  inc   r3                                  ; $0980D1 |
  add   r6                                  ; $0980D2 |
  stw   (r5)                                ; $0980D3 |
  inc   r5                                  ; $0980D4 |
  loop                                      ; $0980D5 |
  inc   r5                                  ; $0980D6 |

CODE_0980D7:
  lms   r14,($011C)                         ; $0980D7 |
  lms   r2,($011E)                          ; $0980DA |
  lms   r3,($0120)                          ; $0980DD |
  lms   r4,($0122)                          ; $0980E0 |
  iwt   r5,#$1CD6                           ; $0980E3 |
  iwt   r6,#$1BB6                           ; $0980E6 |
  iwt   r7,#$1C16                           ; $0980E9 |
  iwt   r8,#$17C2                           ; $0980EC |
  iwt   r0,#$1D36                           ; $0980EF |
  sms   ($003E),r0                          ; $0980F2 |
  ibt   r12,#$0018                          ; $0980F5 |
  move  r13,r15                             ; $0980F7 |
  move  r0,r12                              ; $0980F9 |
  ldb   (r0)                                ; $0980FB |
  sub   #3                                  ; $0980FD |
  bcs CODE_09810E                           ; $0980FF |
  nop                                       ; $098101 |
  ibt   r0,#$0004                           ; $098102 |
  with r5                                   ; $098104 |
  add   r0                                  ; $098105 |
  with r6                                   ; $098106 |
  add   r0                                  ; $098107 |
  with r7                                   ; $098108 |
  add   r0                                  ; $098109 |
  inc   r8                                  ; $09810A |
  bra CODE_09815B                           ; $09810B |

  inc   r8                                  ; $09810D |

CODE_09810E:
  to r9                                     ; $09810E |
  ldw   (r6)                                ; $09810F |
  inc   r6                                  ; $098110 |
  inc   r6                                  ; $098111 |
  to r10                                    ; $098112 |
  ldw   (r6)                                ; $098113 |
  inc   r6                                  ; $098114 |
  inc   r6                                  ; $098115 |
  ldw   (r5)                                ; $098116 |
  inc   r5                                  ; $098117 |
  inc   r5                                  ; $098118 |
  sub   r14                                 ; $098119 |
  stw   (r7)                                ; $09811A |
  inc   r7                                  ; $09811B |
  inc   r7                                  ; $09811C |
  moves r11,r0                              ; $09811D |
  bpl CODE_098124                           ; $09811F |
  sub   r0                                  ; $098121 |
  inc   r0                                  ; $098122 |
  inc   r0                                  ; $098123 |

CODE_098124:
  stb   (r8)                                ; $098124 |
  inc   r8                                  ; $098126 |
  ldw   (r5)                                ; $098127 |
  inc   r5                                  ; $098128 |
  inc   r5                                  ; $098129 |
  sub   r2                                  ; $09812A |
  stw   (r7)                                ; $09812B |
  inc   r7                                  ; $09812C |
  inc   r7                                  ; $09812D |
  moves r1,r0                               ; $09812E |
  bpl CODE_098135                           ; $098130 |
  sub   r0                                  ; $098132 |
  inc   r0                                  ; $098133 |
  inc   r0                                  ; $098134 |

CODE_098135:
  stb   (r8)                                ; $098135 |
  from r1                                   ; $098137 |
  add   r10                                 ; $098138 |
  add   r4                                  ; $098139 |
  bmi CODE_09815B                           ; $09813A |
  inc   r8                                  ; $09813C |
  sub   r10                                 ; $09813D |
  sub   r10                                 ; $09813E |
  sub   r4                                  ; $09813F |
  sub   r4                                  ; $098140 |
  bpl CODE_09815C                           ; $098141 |
  sub   r0                                  ; $098143 |
  from r11                                  ; $098144 |
  add   r9                                  ; $098145 |
  add   r3                                  ; $098146 |
  bmi CODE_09815B                           ; $098147 |
  sub   r9                                  ; $098149 |
  sub   r9                                  ; $09814A |
  sub   r3                                  ; $09814B |
  sub   r3                                  ; $09814C |
  bpl CODE_09815C                           ; $09814D |
  sub   r0                                  ; $09814F |
  lms   r0,($00AC)                          ; $098150 |
  sub   #6                                  ; $098153 |
  bcs CODE_09815C                           ; $098155 |
  sub   r0                                  ; $098157 |
  bra CODE_09815C                           ; $098158 |
  dec   r0                                  ; $09815A |

CODE_09815B:
  sub   r0                                  ; $09815B |

CODE_09815C:
  lms   r1,($003E)                          ; $09815C |
  stb   (r1)                                ; $09815F |
  inc   r8                                  ; $098161 |
  with r1                                   ; $098162 |
  add   #4                                  ; $098163 |
  sms   ($003E),r1                          ; $098165 |
  loop                                      ; $098168 |
  inc   r8                                  ; $098169 |
  iwt   r1,#$0FA1                           ; $09816A |
  iwt   r5,#$1CD6                           ; $09816D |
  iwt   r6,#$1BB6                           ; $098170 |
  iwt   r7,#$1C76                           ; $098173 |
  iwt   r9,#$1D36                           ; $098176 |
  iwt   r10,#$1D37                          ; $098179 |
  ibt   r12,#$0018                          ; $09817C |
  move  r0,r12                              ; $09817E |
  ldb   (r0)                                ; $098180 |
  dec   r0                                  ; $098182 |
  bmi CODE_098193                           ; $098183 |
  nop                                       ; $098185 |
  ldb   (r9)                                ; $098186 |
  sub   #0                                  ; $098188 |
  bne CODE_098193                           ; $09818A |
  nop                                       ; $09818C |
  ldw   (r1)                                ; $09818D |
  and   #4                                  ; $09818E |
  bne CODE_09819F                           ; $098190 |
  nop                                       ; $098192 |

CODE_098193:
  ibt   r0,#$0004                           ; $098193 |
  with r5                                   ; $098195 |
  add   r0                                  ; $098196 |
  with r6                                   ; $098197 |
  add   r0                                  ; $098198 |
  with r7                                   ; $098199 |
  add   r0                                  ; $09819A |
  iwt   r15,#$8263                          ; $09819B |
  nop                                       ; $09819E |

CODE_09819F:
  to r14                                    ; $09819F |
  ldw   (r5)                                ; $0981A0 |
  inc   r5                                  ; $0981A1 |
  inc   r5                                  ; $0981A2 |
  to r2                                     ; $0981A3 |
  ldw   (r5)                                ; $0981A4 |
  inc   r5                                  ; $0981A5 |
  inc   r5                                  ; $0981A6 |
  to r3                                     ; $0981A7 |
  ldw   (r6)                                ; $0981A8 |
  inc   r6                                  ; $0981A9 |
  inc   r6                                  ; $0981AA |
  to r4                                     ; $0981AB |
  ldw   (r6)                                ; $0981AC |
  inc   r6                                  ; $0981AD |
  inc   r6                                  ; $0981AE |
  sms   ($0042),r1                          ; $0981AF |
  sms   ($004A),r5                          ; $0981B2 |
  sms   ($004C),r6                          ; $0981B5 |
  sms   ($004E),r7                          ; $0981B8 |
  sms   ($0052),r9                          ; $0981BB |
  sms   ($0054),r10                         ; $0981BE |
  sms   ($0058),r12                         ; $0981C1 |
  iwt   r1,#$0FA1                           ; $0981C4 |
  to r11                                    ; $0981C7 |
  ldb   (r10)                               ; $0981C8 |
  inc   r11                                 ; $0981CA |
  move  r10,r12                             ; $0981CB |
  ibt   r12,#$0018                          ; $0981CD |
  iwt   r13,#$81D3                          ; $0981CF |
  from r10                                  ; $0981D2 |
  sub   r11                                 ; $0981D3 |
  beq CODE_098241                           ; $0981D4 |
  nop                                       ; $0981D6 |
  ldb   (r11)                               ; $0981D7 |
  dec   r0                                  ; $0981D9 |
  bmi CODE_098241                           ; $0981DA |
  nop                                       ; $0981DC |
  ibt   r0,#$0018                           ; $0981DD |
  sub   r11                                 ; $0981DF |
  add   r0                                  ; $0981E0 |
  add   r0                                  ; $0981E1 |
  move  r8,r0                               ; $0981E2 |
  add   r1                                  ; $0981E4 |
  ldw   (r0)                                ; $0981E5 |
  and   #2                                  ; $0981E6 |
  beq CODE_098241                           ; $0981E8 |
  nop                                       ; $0981EA |
  iwt   r0,#$1CD6                           ; $0981EB |
  to r5                                     ; $0981EE |
  add   r8                                  ; $0981EF |
  iwt   r0,#$1BB6                           ; $0981F0 |
  to r6                                     ; $0981F3 |
  add   r8                                  ; $0981F4 |
  to r9                                     ; $0981F5 |
  ldw   (r6)                                ; $0981F6 |
  ldw   (r5)                                ; $0981F7 |
  sub   r14                                 ; $0981F8 |
  move  r7,r0                               ; $0981F9 |
  add   r3                                  ; $0981FB |
  add   r9                                  ; $0981FC |
  bmi CODE_098241                           ; $0981FD |
  sub   r9                                  ; $0981FF |
  sub   r9                                  ; $098200 |
  sub   r3                                  ; $098201 |
  sub   r3                                  ; $098202 |
  dec   r0                                  ; $098203 |
  bpl CODE_098241                           ; $098204 |
  inc   r5                                  ; $098206 |
  inc   r5                                  ; $098207 |
  inc   r6                                  ; $098208 |
  inc   r6                                  ; $098209 |
  to r9                                     ; $09820A |
  ldw   (r6)                                ; $09820B |
  ldw   (r5)                                ; $09820C |
  sub   r2                                  ; $09820D |
  move  r5,r0                               ; $09820E |
  add   r4                                  ; $098210 |
  add   r9                                  ; $098211 |
  bmi CODE_098241                           ; $098212 |
  sub   r9                                  ; $098214 |
  sub   r9                                  ; $098215 |
  sub   r4                                  ; $098216 |
  sub   r4                                  ; $098217 |
  dec   r0                                  ; $098218 |
  bpl CODE_098241                           ; $098219 |
  nop                                       ; $09821B |
  lms   r0,($004E)                          ; $09821C |
  from r7                                   ; $09821F |
  stw   (r0)                                ; $098220 |
  inc   r0                                  ; $098221 |
  inc   r0                                  ; $098222 |
  from r5                                   ; $098223 |
  stw   (r0)                                ; $098224 |
  to r7                                     ; $098225 |
  add   #2                                  ; $098226 |
  lms   r9,($0052)                          ; $098228 |
  inc   r8                                  ; $09822B |
  from r8                                   ; $09822C |
  stb   (r9)                                ; $09822D |
  dec   r11                                 ; $09822F |
  bne CODE_098235                           ; $098230 |
  dec   r11                                 ; $098232 |
  ibt   r11,#$0017                          ; $098233 |

CODE_098235:
  lms   r10,($0054)                         ; $098235 |
  move  r0,r11                              ; $098238 |
  stb   (r10)                               ; $09823A |
  bra CODE_098255+1                         ; $09823C |

  lms   r1,($0042)                          ; $09823E |

CODE_098241:
  dec   r11                                 ; $098241 |
  bne CODE_098247                           ; $098242 |
  nop                                       ; $098244 |
  ibt   r11,#$0018                          ; $098245 |

CODE_098247:
  loop                                      ; $098247 |
  from r10                                  ; $098248 |
  lms   r0,($004E)                          ; $098249 |
  to r7                                     ; $09824C |
  add   #4                                  ; $09824D |
  lms   r9,($0052)                          ; $09824F |
  lms   r10,($0054)                         ; $098252 |

CODE_098255:
  lms   r1,($0042)                          ; $098255 |
  lms   r5,($004A)                          ; $098258 |
  lms   r6,($004C)                          ; $09825B |
  lms   r12,($0058)                         ; $09825E |
  ibt   r0,#$0004                           ; $098261 |
  with r1                                   ; $098263 |
  add   r0                                  ; $098264 |
  with r9                                   ; $098265 |
  add   r0                                  ; $098266 |
  with r10                                  ; $098267 |
  add   r0                                  ; $098268 |
  iwt   r13,#$817F                          ; $098269 |
  loop                                      ; $09826C |
  move  r0,r12                              ; $09826D |
  lms   r0,($01AE)                          ; $09826F |
  sub   #0                                  ; $098272 |
  bne CODE_0982D9                           ; $098274 |
  cache                                     ; $098276 |
  lms   r1,($015A)                          ; $098277 |
  lms   r2,($015C)                          ; $09827A |
  iwt   r5,#$1CD6                           ; $09827D |
  iwt   r6,#$1BB6                           ; $098280 |
  iwt   r7,#$0FA0                           ; $098283 |
  iwt   r8,#$1040                           ; $098286 |
  iwt   r11,#$1D38                          ; $098289 |
  ibt   r14,#$0040                          ; $09828C |
  ibt   r12,#$0018                          ; $09828E |
  iwt   r13,#$8294                          ; $098290 |
  move  r0,r12                              ; $098293 |
  ldb   (r0)                                ; $098295 |
  sub   #3                                  ; $098297 |
  bcc CODE_0982A1                           ; $098299 |
  nop                                       ; $09829B |
  ldw   (r7)                                ; $09829C |
  and   r14                                 ; $09829D |
  beq CODE_0982A9                           ; $09829E |
  nop                                       ; $0982A0 |

CODE_0982A1:
  ibt   r0,#$0004                           ; $0982A1 |
  with r5                                   ; $0982A3 |
  add   r0                                  ; $0982A4 |
  with r6                                   ; $0982A5 |
  bra CODE_0982D0                           ; $0982A6 |

  add   r0                                  ; $0982A8 |

CODE_0982A9:
  ldw   (r11)                               ; $0982A9 |
  lsr                                       ; $0982AA |
  bne CODE_0982A1                           ; $0982AB |
  to r9                                     ; $0982AD |
  ldw   (r6)                                ; $0982AE |
  inc   r6                                  ; $0982AF |
  inc   r6                                  ; $0982B0 |
  to r10                                    ; $0982B1 |
  ldw   (r6)                                ; $0982B2 |
  inc   r6                                  ; $0982B3 |
  inc   r6                                  ; $0982B4 |
  ldw   (r5)                                ; $0982B5 |
  inc   r5                                  ; $0982B6 |
  inc   r5                                  ; $0982B7 |
  to r3                                     ; $0982B8 |
  sub   r1                                  ; $0982B9 |
  ldw   (r5)                                ; $0982BA |
  inc   r5                                  ; $0982BB |
  inc   r5                                  ; $0982BC |
  to r4                                     ; $0982BD |
  sub   r2                                  ; $0982BE |
  from r4                                   ; $0982BF |
  add   r10                                 ; $0982C0 |
  add   #12                                 ; $0982C1 |
  bmi CODE_0982CE                           ; $0982C3 |
  sub   r10                                 ; $0982C5 |
  sub   r10                                 ; $0982C6 |
  sub   #12                                 ; $0982C7 |
  sub   #12                                 ; $0982C9 |
  bmi CODE_0982DB                           ; $0982CB |
  from r3                                   ; $0982CD |

CODE_0982CE:
  ibt   r0,#$0004                           ; $0982CE |

CODE_0982D0:
  with r7                                   ; $0982D0 |
  add   r0                                  ; $0982D1 |
  with r8                                   ; $0982D2 |
  add   r0                                  ; $0982D3 |
  with r11                                  ; $0982D4 |
  add   r0                                  ; $0982D5 |
  loop                                      ; $0982D6 |
  move  r0,r12                              ; $0982D7 |

CODE_0982D9:
  stop                                      ; $0982D9 |
  nop                                       ; $0982DA |

CODE_0982DB:
  add   r9                                  ; $0982DB |
  add   #12                                 ; $0982DC |
  bmi CODE_0982CE                           ; $0982DE |
  sub   r9                                  ; $0982E0 |
  sub   r9                                  ; $0982E1 |
  sub   #12                                 ; $0982E2 |
  sub   #12                                 ; $0982E4 |
  bpl CODE_0982CE+1                         ; $0982E6 |
  ibt   r0,#$0018                           ; $0982E8 |
  sub   r12                                 ; $0982EA |
  add   r0                                  ; $0982EB |
  to r1                                     ; $0982EC |
  add   r0                                  ; $0982ED |
  inc   r1                                  ; $0982EE |
  lms   r0,($0162)                          ; $0982EF |
  lms   r5,($0168)                          ; $0982F2 |
  or    r5                                  ; $0982F5 |
  bne CODE_0982D9                           ; $0982F6 |
  nop                                       ; $0982F8 |
  lms   r6,($0150)                          ; $0982F9 |
  dec   r6                                  ; $0982FC |
  bmi CODE_0982D9                           ; $0982FD |
  inc   r6                                  ; $0982FF |
  lms   r0,($015E)                          ; $098300 |
  dec   r0                                  ; $098303 |
  bpl CODE_09835D                           ; $098304 |
  nop                                       ; $098306 |
  iwt   r0,#$0EFF                           ; $098307 |
  to r5                                     ; $09830A |
  add   r1                                  ; $09830B |
  lms   r0,($0152)                          ; $09830C |
  lms   r2,($0154)                          ; $09830F |
  or    r2                                  ; $098312 |
  beq CODE_09835D                           ; $098313 |
  nop                                       ; $098315 |
  from r6                                   ; $098316 |
  lsr                                       ; $098317 |
  bcc CODE_09831E                           ; $098318 |
  inc   r6                                  ; $09831A |
  sms   ($0150),r6                          ; $09831B |

CODE_09831E:
  sms   ($0162),r1                          ; $09831E |
  ldw   (r7)                                ; $098321 |
  sex                                       ; $098322 |
  bpl CODE_098336                           ; $098323 |
  sub   r0                                  ; $098325 |
  inc   r0                                  ; $098326 |
  sms   ($015E),r0                          ; $098327 |
  ibt   r0,#$0014                           ; $09832A |
  sms   ($0160),r0                          ; $09832C |
  ibt   r0,#$003C                           ; $09832F |
  sms   ($007A),r0                          ; $098331 |
  stop                                      ; $098334 |
  nop                                       ; $098335 |

CODE_098336:
  sms   ($0164),r3                          ; $098336 |
  sms   ($0166),r4                          ; $098339 |
  ibt   r0,#$0008                           ; $09833C |
  stw   (r5)                                ; $09833E |
  inc   r7                                  ; $09833F |
  inc   r7                                  ; $098340 |
  ldw   (r7)                                ; $098341 |
  add   r0                                  ; $098342 |
  bcs CODE_09835D                           ; $098343 |
  add   r0                                  ; $098345 |
  add   r0                                  ; $098346 |
  iwt   r2,#$8000                           ; $098347 |
  and   r2                                  ; $09834A |
  or    r1                                  ; $09834B |
  sms   ($0168),r0                          ; $09834C |
  ldw   (r8)                                ; $09834F |
  bic   #12                                 ; $098350 |
  sbk                                       ; $098352 |
  swap                                      ; $098353 |
  bmi CODE_09835A                           ; $098354 |
  sub   r0                                  ; $098356 |
  iwt   r0,#$04B0                           ; $098357 |

CODE_09835A:
  sms   ($01EE),r0                          ; $09835A |

CODE_09835D:
  stop                                      ; $09835D |
  nop                                       ; $09835E |

; copy Yoshi to OAM buffer
; parameters:
; r1: [cam_rel_player_X]
; r2: [cam_rel_player_Y]
; r3: [player_facing]
; r12: # of OAM entries for this Yoshi frame
; r14: address of start of OAM ROM block $4Cxxxx
gsu_draw_player:
  ibt   r0,#$004C                           ; $09835F |\
  romb                                      ; $098361 |/ banks 18 & 19
  move  r14,r14                             ; $098363 |
  lms   r4,($0126)                          ; $098365 | --pp---- (OAM priority)
  lms   r5,($0118)                          ; $098368 | above layer OAM pointer
  ibt   r0,#$0060                           ; $09836B |\  reserve $60 bytes for tongue
  to r5                                     ; $09836D | | r5 = $60 + above layer OAM
  add   r5                                  ; $09836E |/  start of yoshi OAM
  iwt   r9,#$0128                           ; $09836F | Yoshi graphics DMA queue
  ibt   r7,#$0000                           ; $098372 | tile #
  cache                                     ; $098374 |
  move  r13,r15                             ; $098375 | loop through OAM & graphics entries

.yoshi_OAM_loop
  to r6                                     ; $098377 |\  [yoshi_OAM_byte_1]
  getb                                      ; $098378 | | r6 = first byte of OAM data
  inc   r14                                 ; $098379 |/
  from r6                                   ; $09837A |\
  lsr                                       ; $09837B | | [yoshi_size_bit]
  lsr                                       ; $09837C | | r11 = 00x00000 bit
  lsr                                       ; $09837D | | shifted to 000000x0
  lsr                                       ; $09837E | | for OAM size bit
  to r11                                    ; $09837F | |
  and   #2                                  ; $098380 |/
  getb                                      ; $098382 |\  [yoshi_draw_offset_X]
  inc   r14                                 ; $098383 | | r0 = second byte of OAM data
  sex                                       ; $098384 |/  X drawing offset
  ibt   r8,#$0000                           ; $098385 |\
  dec   r3                                  ; $098387 | | [yoshi_x_flip_mask]
  bpl .store_yoshi_OAM                      ; $098388 | | if Yoshi is facing right,
  inc   r3                                  ; $09838A | | negate yoshi_draw_offset_X
  not                                       ; $09838B | | and r8 = $40 instead of $00
  inc   r0                                  ; $09838C | | meaning flip x bit
  ibt   r8,#$0040                           ; $09838D |/
  dec   r11                                 ; $09838F |\
  bpl .store_yoshi_OAM                      ; $098390 | | if yoshi_size_bit is off,
  inc   r11                                 ; $098392 | | add 8 to yoshi_draw_offset_X
  add   #8                                  ; $098393 |/

.store_yoshi_OAM
  add   r1                                  ; $098395 |\  cam_rel_player_X
  stw   (r5)                                ; $098396 | | + yoshi_draw_offset_X
  inc   r5                                  ; $098397 | | -> word 1 in OAM buffer entry
  inc   r5                                  ; $098398 |/
  getb                                      ; $098399 |\
  inc   r14                                 ; $09839A | | cam_rel_player_Y
  sex                                       ; $09839B | | + third byte of OAM data
  add   r2                                  ; $09839C | | (Y drawing offset)
  stw   (r5)                                ; $09839D | | -> word 2 in OAM buffer entry
  inc   r5                                  ; $09839E | |
  inc   r5                                  ; $09839F |/
  iwt   r0,#$00C0                           ; $0983A0 |\
  and   r6                                  ; $0983A3 | | build up yxppccct tttttttt
  xor   r8                                  ; $0983A4 | | yx from yoshi_OAM_byte_1
  or    r4                                  ; $0983A6 | | flip x if facing right
  lms   r10,($0124)                         ; $0983A7 | | pp from $0126 (priority)
  or    r10                                 ; $0983AA | | ccc from $0124
  swap                                      ; $0983AB | | (palette)
  or    r7                                  ; $0983AC | | swap cause tttttttt comes "first"
  inc   r7                                  ; $0983AD | | t tttttttt comes simply from
  inc   r7                                  ; $0983AE | | adding 2 each loop, because
  stw   (r5)                                ; $0983AF | | tiles get written fresh
  inc   r5                                  ; $0983B0 | | -> word 3 in OAM buffer entry
  inc   r5                                  ; $0983B1 |/
  from r11                                  ; $0983B2 |\
  stw   (r5)                                ; $0983B3 | | -------s- : size bit
  inc   r5                                  ; $0983B4 | | -> word 4 in OAM buffer entry
  inc   r5                                  ; $0983B5 |/
  from r6                                   ; $0983B6 |\  build yoshi gfx queue entry:
  and   #15                                 ; $0983B7 | | [yoshi_gfx_source_addr]
  swap                                      ; $0983B9 | | r0 = low 3 from yoshi_OAM_byte_1
  getbl                                     ; $0983BA | | and fourth byte of OAM data:
  inc   r14                                 ; $0983BC |/  00000aaa aaaaaaaa
  with r11                                  ; $0983BD |\
  and   #2                                  ; $0983BE | | if size bit on
  beq .source_bank                          ; $0983C0 | |
  nop                                       ; $0983C2 |/
  iwt   r10,#$0090                          ; $0983C3 |\
  cmp   r10                                 ; $0983C6 | | and yoshi_gfx_source_addr
  bcs .source_bank                          ; $0983C8 | | < $90 (or $1200 post-shift)
  nop                                       ; $0983CA |/
  lms   r10,($0168)                         ; $0983CB |\
  lms   r11,($0162)                         ; $0983CE | |
  with r10                                  ; $0983D1 | | and nothing in Yoshi's mouth
  or    r11                                 ; $0983D2 | | / tonguing
  bne .source_bank                          ; $0983D3 | |
  nop                                       ; $0983D5 |/
  iwt   r10,#$0100                          ; $0983D6 |\ then add $100 ($2000 post-shift) to
  add   r10                                 ; $0983D9 |/ yoshi_gfx_source_addr for mouth gfx

.source_bank
  iwt   r10,#$07FF                          ; $0983DA |\ mask off high 5 bits
  and   r10                                 ; $0983DD |/ of yoshi_gfx_source_addr
  with r6                                   ; $0983DE |\
  and   #8                                  ; $0983DF | | if ----b--- source bank selector
  ibt   r6,#$0052                           ; $0983E1 | | bit of yoshi_OAM_byte_1 is off,
  beq .store_graphics_queue                 ; $0983E3 | | choose $52 as source bank
  nop                                       ; $0983E5 | | if on, choose $70 and also
  iwt   r6,#$8300                           ; $0983E6 | | add $8300 to yoshi_gfx_source_addr
  add   r6                                  ; $0983E9 | | (or $6000 post-shift) to line up
  ibt   r6,#$0070                           ; $0983EA |/  with $706000, part of gfx buffer

.store_graphics_queue
  add   r0                                  ; $0983EC |\
  add   r0                                  ; $0983ED | | yoshi_gfx_source_addr << 5
  add   r0                                  ; $0983EE | | which is aaaaaaaaaaa00000
  add   r0                                  ; $0983EF | | 3 bits from yoshi_OAM_byte_1
  add   r0                                  ; $0983F0 | | 8 bits from byte 4
  stw   (r9)                                ; $0983F1 | | then any additions ($2000 or
  inc   r9                                  ; $0983F2 | | $6000)
  inc   r9                                  ; $0983F3 |/  -> bytes 1 & 2 of queue entry
  to r10                                    ; $0983F4 |\ r10 = high byte of source addr
  hib                                       ; $0983F5 |/
  from r6                                   ; $0983F6 |\  source bank ($52 or $70)
  stb   (r9)                                ; $0983F7 | | -> byte 3 of queue entry
  inc   r9                                  ; $0983F9 |/
  from r10                                  ; $0983FA |\  bottom row address
  add   #2                                  ; $0983FB | | high byte of source addr + 2
  stb   (r9)                                ; $0983FD |/  -> byte 4 of queue entry
  loop                                      ; $0983FF |
  inc   r9                                  ; $098400 | end yoshi_OAM_loop
  lms   r0,($00AE)                          ; $098401 |\
  add   r0                                  ; $098404 | | index into yoshi_form_draw_ptr
  inc   r0                                  ; $098405 | | table with yoshi form
  to r15                                    ; $098406 | | * 2 + 1
  add   r15                                 ; $098407 |/  since each entry is 4 bytes

; GSU style pointer table
; each player form's extra drawing routine
; places/adjusts any extra OAM like legs, wheels, tongue, etc.
yoshi_form_draw_ptr:
  iwt   r15,#draw_tongue                    ; $098408 | $0000: Yoshi
  nop                                       ; $09840B |
  nop                                       ; $09840C |
  dw draw_car_wheels                        ; $09840D | $0002: Car Yoshi
  nop                                       ; $09840F |
  nop                                       ; $098410 |
  dw adjust_mole_arms                       ; $098411 | $0004: Mole Yoshi
  nop                                       ; $098413 |
  nop                                       ; $098414 |
  dw ret_helicopter                         ; $098415 | $0006: Helicopter Yoshi
  nop                                       ; $098417 |
  nop                                       ; $098418 |
  dw adjust_train                           ; $098419 | $0008: Train Yoshi
  nop                                       ; $09841B |
  nop                                       ; $09841C |
  dw ret_mushroom                           ; $09841D | $000A: Mushroom Yoshi (Beta)
  nop                                       ; $09841F |
  nop                                       ; $098420 |
  dw ret_submarine                          ; $098421 | $000C: Sub Yoshi
  nop                                       ; $098423 |
  nop                                       ; $098424 |
  dw ret_ski_plane                          ; $098425 | $000E: Ski Yoshi
  nop                                       ; $098427 |
  nop                                       ; $098428 |
  dw adjust_mario                           ; $098429 | $0010: Super Baby Mario
  nop                                       ; $09842B |
  nop                                       ; $09842C |
  dw ret_ski_plane                          ; $09842D | $0012: Plane Yoshi (Beta)
  nop                                       ; $09842F |
  nop                                       ; $098430 |

; form $0000: Regular Yoshi, so draw tongue
draw_tongue:
  iwt   r0,#$0009                           ; $098431 |
  romb                                      ; $098434 |
  lms   r0,($015E)                          ; $098436 |\
  iwt   r14,#tongue_anim_indices            ; $098439 | | [tongue_anim_index]
  to r14                                    ; $09843C | | tongue animation frame
  add   r14                                 ; $09843D | | index into ROM table
  to r10                                    ; $09843E | | r10 = grab index
  getb                                      ; $09843F |/
  lms   r5,($0118)                          ; $098440 | r5 = reserved tongue OAM ptr
  with r4                                   ; $098443 |\ [yoshi_OAM_priority]
  swap                                      ; $098444 |/ --pp---- --------
  lms   r11,($0150)                         ; $098445 |\
  dec   r11                                 ; $098448 | | r11 = [mouth_state]
  bmi .ret_no_tongue                        ; $098449 | | if mouth_state
  nop                                       ; $09844B | | == $00 (doing nothing)
  from r11                                  ; $09844C | | or >= $06 (swallowing states)
  sub   #7                                  ; $09844D | | return immediately
  bcs .ret_no_tongue                        ; $09844F | |
  nop                                       ; $098451 |/
  lms   r0,($0154)                          ; $098452 |\
  sub   #0                                  ; $098455 | |
  bpl .tongue_length                        ; $098457 | | r0 = absolute value of
  nop                                       ; $098459 | | tongue Y height
  not                                       ; $09845A | |
  inc   r0                                  ; $09845B |/

.tongue_length
  lsr                                       ; $09845C |\
  lsr                                       ; $09845D | | r7 = abs(tongue height)
  to r7                                     ; $09845E | | >> 3 (at least a tile)
  lsr                                       ; $09845F |/
  lms   r0,($0152)                          ; $098460 |\
  sub   #0                                  ; $098463 | |
  bpl .check_tongue_out                     ; $098465 | | r0 = absolute value of
  nop                                       ; $098467 | | tongue X length
  not                                       ; $098468 | |
  inc   r0                                  ; $098469 |/

.check_tongue_out
  lsr                                       ; $09846A |\
  lsr                                       ; $09846B | | r6 = abs(tongue length)
  to r6                                     ; $09846C | | >> 3 (at least a tile)
  lsr                                       ; $09846D |/
  from r6                                   ; $09846E |\  is tongue out in either axis
  or    r7                                  ; $09846F | | by at least a tile?
  bne .check_horizontal                     ; $098470 | | if not, return
  nop                                       ; $098472 |/

.ret_no_tongue
  stop                                      ; $098473 |
  nop                                       ; $098474 |

.check_horizontal
  lms   r1,($0156)                          ; $098475 | [cam_rel_tongue_X]
  lms   r2,($0158)                          ; $098478 | [cam_rel_tongue_Y]
  from r11                                  ; $09847B |\  if (mouth_state - 1) / 2
  lsr                                       ; $09847C | | == 0, so == 01 or 02
  beq .horizontal                           ; $09847D | | this means horizontally
  nop                                       ; $09847F |/  growing or retracting
  iwt   r15,#.vertical_tongue               ; $098480 |\ else skip down
  nop                                       ; $098483 |/ to vertical processing

.horizontal
  ibt   r9,#$0008                           ; $098484 |\
  ibt   r8,#$0000                           ; $098486 | | if player_facing
  ibt   r7,#$0000                           ; $098488 | | left, these values
  dec   r3                                  ; $09848A | | (r9 = loop direction,
  bpl .draw_horizontal                      ; $09848B | | r8 = X flip,
  inc   r3                                  ; $09848D | | r7 = draw X facing adjust)
  ibt   r7,#$0008                           ; $09848E | | player_facing right,
  ibt   r9,#$FFF8                           ; $098490 | | these instead
  iwt   r8,#$4000                           ; $098492 |/

; in OAM buffer, after Yoshi himself
; begin tongue drawing continuing r5
; for horizontal
; start with tongue end piece,
; then loop after for rest of tongue
.draw_horizontal
  from r1                                   ; $098495 |\
  add   r7                                  ; $098496 | | adjust cam_rel_tongue_X for
  stw   (r5)                                ; $098497 | | facing (+0 left, +8 right)
  inc   r5                                  ; $098498 | | -> word 1 in OAM buffer entry
  inc   r5                                  ; $098499 |/
  from r2                                   ; $09849A |\
  stw   (r5)                                ; $09849B | | cam_rel_tongue_Y
  inc   r5                                  ; $09849C | | -> word 2 in OAM buffer entry
  inc   r5                                  ; $09849D |/
  iwt   r0,#$0A20                           ; $09849E |\  ----101- palette
  or    r4                                  ; $0984A1 | | 000100000 tile #: hardcoded
  or    r8                                  ; $0984A2 | | for horiz tongue end piece
  stw   (r5)                                ; $0984A3 | | --pp---- priority from $0126
  inc   r5                                  ; $0984A4 | | and x flip from facing
  inc   r5                                  ; $0984A5 |/  -> word 3 in OAM buffer entry
  sub   r0                                  ; $0984A6 |\
  stw   (r5)                                ; $0984A7 | | $00 (size and priority 0)
  inc   r5                                  ; $0984A8 | | -> word 4 in OAM buffer entry
  inc   r5                                  ; $0984A9 |/
  cache                                     ; $0984AA | prepare tongue loop
  iwt   r0,#tongue_OAM_ptrs_horiz           ; $0984AB |\
  to r14                                    ; $0984AE | | [tongue_OAM_ptr_horiz]
  add   r10                                 ; $0984AF | | r14 = grab tongue OAM pointer
  getb                                      ; $0984B0 | | for current tongue index
  inc   r14                                 ; $0984B1 | | this is starting point
  getbh                                     ; $0984B2 | | of OAM data in ROM
  move  r14,r0                              ; $0984B4 |/
  dec   r6                                  ; $0984B6 |\  if tongue length is only 1,
  beq .ret_horizontal                       ; $0984B7 | | get out (end piece enough)
  nop                                       ; $0984B9 |/
  move  r12,r6                              ; $0984BA | loop size: # of non-end pieces
  move  r13,r15                             ; $0984BC | loop through them

.horizontal_loop
  with r1                                   ; $0984BE |\ X: add or subtract 8 each
  add   r9                                  ; $0984BF |/ loop based on facing
  from r1                                   ; $0984C0 |\
  add   r7                                  ; $0984C1 | | adjust cam_rel_tongue_X for
  stw   (r5)                                ; $0984C2 | | facing (+0 left, +8 right)
  inc   r5                                  ; $0984C3 | | -> word 1 in OAM buffer entry
  inc   r5                                  ; $0984C4 |/
  getbs                                     ; $0984C5 |\
  inc   r14                                 ; $0984C7 | | cam_rel_tongue_Y +
  add   r2                                  ; $0984C8 | | Y draw offset pulled from
  stw   (r5)                                ; $0984C9 | | current tongue_OAM_ptr_horiz
  inc   r5                                  ; $0984CA | | -> word 2 in OAM buffer entry
  inc   r5                                  ; $0984CB |/
  getb                                      ; $0984CC |\
  inc   r14                                 ; $0984CD | | bytes 3 & 4 from
  getbh                                     ; $0984CE | | current tongue_OAM_ptr_horiz:
  inc   r14                                 ; $0984D0 | | y---ccct tttttttt
  or    r4                                  ; $0984D1 | | (palette & tile)
  xor   r8                                  ; $0984D2 | | --pp---- priority from $0126
  stw   (r5)                                ; $0984D4 | | x flip from facing
  inc   r5                                  ; $0984D5 | | -> word 3 in OAM buffer entry
  inc   r5                                  ; $0984D6 |/
  sub   r0                                  ; $0984D7 |\  $0000: size & prio bits off
  stw   (r5)                                ; $0984D8 | | -> word 4 in OAM buffer entry
  inc   r5                                  ; $0984D9 |/
  loop                                      ; $0984DA | next tongue OAM buffer entry
  inc   r5                                  ; $0984DB | end horizontal_loop

.ret_horizontal
  stop                                      ; $0984DC |
  nop                                       ; $0984DD |

.vertical_tongue
  move  r6,r7                               ; $0984DE |
  ibt   r8,#$0000                           ; $0984E0 |\
  ibt   r7,#$0008                           ; $0984E2 | | if player_facing left,
  dec   r3                                  ; $0984E4 | | use these values
  bpl .draw_vertical                        ; $0984E5 | | (r8 = X flip,
  inc   r3                                  ; $0984E7 | | r7 = draw X facing adjust)
  ibt   r7,#$0000                           ; $0984E8 | | right, these instead
  iwt   r8,#$4000                           ; $0984EA |/

; once again, start with end piece for vertical
; then loop for vertical
.draw_vertical
  from r1                                   ; $0984ED |\
  add   r7                                  ; $0984EE | | adjust cam_rel_tongue_X for
  stw   (r5)                                ; $0984EF | | facing (+0 left, +8 right)
  inc   r5                                  ; $0984F0 | | -> word 1 in OAM buffer entry
  inc   r5                                  ; $0984F1 |/
  from r2                                   ; $0984F2 |\
  stw   (r5)                                ; $0984F3 | | cam_rel_tongue_Y
  inc   r5                                  ; $0984F4 | | -> word 2 in OAM buffer entry
  inc   r5                                  ; $0984F5 |/
  iwt   r0,#$0A22                           ; $0984F6 |\  ----101- palette
  or    r4                                  ; $0984F9 | | 000100010 tile #: hardcoded
  or    r8                                  ; $0984FA | | for vertical tongue end piece
  stw   (r5)                                ; $0984FB | | --pp---- priority from $0126
  inc   r5                                  ; $0984FC | | and x flip from facing
  inc   r5                                  ; $0984FD |/  -> word 3 in OAM buffer entry
  sub   r0                                  ; $0984FE |\
  stw   (r5)                                ; $0984FF | | $00 (size and priority 0)
  inc   r5                                  ; $098500 | | -> word 4 in OAM buffer entry
  inc   r5                                  ; $098501 |/
  cache                                     ; $098502 | prepare tongue loop
  iwt   r0,#tongue_OAM_ptrs_vert            ; $098503 |\
  to r14                                    ; $098506 | | [tongue_OAM_ptr_vert]
  add   r10                                 ; $098507 | | r14 = grab tongue OAM pointer
  getb                                      ; $098508 | | for current tongue index
  inc   r14                                 ; $098509 | | this is starting point
  getbh                                     ; $09850A | | of OAM data in ROM
  move  r14,r0                              ; $09850C |/
  dec   r6                                  ; $09850E |\  if tongue length is only 1,
  beq .ret_vertical                         ; $09850F | | get out (end piece enough)
  nop                                       ; $098511 |/
  move  r12,r6                              ; $098512 | loop size: # of non-end pieces
  move  r13,r15                             ; $098514 | loop through them

.vertical_loop
  with r2                                   ; $098516 |\ each loop, always go top
  add   #8                                  ; $098517 |/ to bottom so 8 down
  getbs                                     ; $098519 |\
  inc   r14                                 ; $09851B | | read drawing X offset
  dec   r3                                  ; $09851C | | from current entry in
  bpl .store_vertical                       ; $09851D | | tongue_OAM_data_vert
  inc   r3                                  ; $09851F | | if player_facing left,
  not                                       ; $098520 | | negate the X offset
  inc   r0                                  ; $098521 |/

.store_vertical
  add   r1                                  ; $098522 |\  cam_rel_tongue_X +
  add   r7                                  ; $098523 | | drawing offset X just read +
  stw   (r5)                                ; $098524 | | facing adjust (+0 left, +8 right)
  inc   r5                                  ; $098525 | | -> word 1 in OAM buffer entry
  inc   r5                                  ; $098526 |/
  from r2                                   ; $098527 |\
  stw   (r5)                                ; $098528 | | cam_rel_tongue_Y
  inc   r5                                  ; $098529 | | -> word 2 in OAM buffer entry
  inc   r5                                  ; $09852A |/
  getb                                      ; $09852B |\
  inc   r14                                 ; $09852C | | bytes 3 & 4 from
  getbh                                     ; $09852D | | current tongue_OAM_ptr_vert:
  inc   r14                                 ; $09852F | | -x---ccct tttttttt
  or    r4                                  ; $098530 | | (palette & tile)
  xor   r8                                  ; $098531 | | --pp---- priority from $0126
  stw   (r5)                                ; $098533 | | x flip from facing
  inc   r5                                  ; $098534 | | -> word 3 in OAM buffer entry
  inc   r5                                  ; $098535 |/
  sub   r0                                  ; $098536 |\  $0000: size & prio bits off
  stw   (r5)                                ; $098537 | | -> word 4 in OAM buffer entry
  inc   r5                                  ; $098538 |/
  loop                                      ; $098539 | next tongue OAM buffer entry
  inc   r5                                  ; $09853A | end vertical_loop

.ret_vertical
  stop                                      ; $09853B |
  nop                                       ; $09853C |

; indexes into either tongue_OAM_ptrs_horiz
; or tongue_OAM_ptrs_vert (if horizontal or vertical)
; using the current tongue animation frame
tongue_anim_indices:
  db $00, $02, $02, $02, $04, $04, $04, $06 ; $09853D |
  db $06, $06, $04, $04, $04, $02, $02, $02 ; $098545 |

; pointers within tongue_OAM_data_horiz
; to serve as starting point of tongue OAM
; using the tongue animation index above
tongue_OAM_ptrs_horiz:
  dw $8555, $856D, $8585, $859D             ; $09854D |

; holds OAM information about each tongue
; OAM entry for horizontal, 3 bytes per entry:
; byte 1: drawing Y offset, signed
; bytes 2 & 3: corresponds to OAM buffer word 3:
; tttttttt y---ccct (y flip, palette, tile)
tongue_OAM_data_horiz:
  db $00, $21, $0A                          ; $098555 |
  db $00, $21, $0A                          ; $098558 |
  db $00, $21, $0A                          ; $09855B |
  db $00, $21, $0A                          ; $09855E |
  db $00, $21, $0A                          ; $098561 |
  db $00, $21, $0A                          ; $098564 |
  db $00, $21, $0A                          ; $098567 |
  db $00, $21, $0A                          ; $09856A |
  db $00, $30, $0A                          ; $09856D |
  db $FF, $30, $8A                          ; $098570 |
  db $00, $30, $0A                          ; $098573 |
  db $FF, $30, $8A                          ; $098576 |
  db $00, $30, $0A                          ; $098579 |
  db $FF, $30, $8A                          ; $09857C |
  db $00, $30, $0A                          ; $09857F |
  db $FF, $30, $8A                          ; $098582 |
  db $00, $31, $0A                          ; $098585 |
  db $FF, $31, $8A                          ; $098588 |
  db $00, $31, $0A                          ; $09858B |
  db $FF, $31, $8A                          ; $09858E |
  db $00, $31, $0A                          ; $098591 |
  db $FF, $31, $8A                          ; $098594 |
  db $00, $31, $0A                          ; $098597 |
  db $FF, $31, $8A                          ; $09859A |
  db $00, $31, $8A                          ; $09859D |
  db $01, $31, $0A                          ; $0985A0 |
  db $00, $31, $8A                          ; $0985A3 |
  db $01, $31, $0A                          ; $0985A6 |
  db $00, $31, $8A                          ; $0985A9 |
  db $01, $31, $0A                          ; $0985AC |
  db $00, $31, $8A                          ; $0985AF |
  db $01, $31, $0A                          ; $0985B2 |

; pointers within tongue_OAM_data_vert
; to serve as starting point of tongue OAM
; using the tongue animation index above
tongue_OAM_ptrs_vert:
  dw $85BD, $85D5, $85ED, $8605             ; $0985B5 |

; holds OAM information about each tongue
; OAM entry for vertical, 3 bytes per entry:
; byte 1: drawing X offset, signed
; bytes 2 & 3: corresponds to OAM buffer word 3:
; tttttttt -x--ccct (x flip, palette, tile)
tongue_OAM_data_vert:
  db $00, $32, $0A                          ; $0985BD |
  db $00, $32, $0A                          ; $0985C0 |
  db $00, $32, $0A                          ; $0985C3 |
  db $00, $32, $0A                          ; $0985C6 |
  db $00, $32, $0A                          ; $0985C9 |
  db $00, $32, $0A                          ; $0985CC |
  db $00, $32, $0A                          ; $0985CF |
  db $00, $32, $0A                          ; $0985D2 |
  db $FF, $23, $0A                          ; $0985D5 |
  db $00, $23, $4A                          ; $0985D8 |
  db $FF, $23, $0A                          ; $0985DB |
  db $00, $23, $4A                          ; $0985DE |
  db $FF, $23, $0A                          ; $0985E1 |
  db $00, $23, $4A                          ; $0985E4 |
  db $FF, $23, $0A                          ; $0985E7 |
  db $00, $23, $4A                          ; $0985EA |
  db $FF, $33, $0A                          ; $0985ED |
  db $00, $33, $4A                          ; $0985F0 |
  db $FF, $33, $0A                          ; $0985F3 |
  db $00, $33, $4A                          ; $0985F6 |
  db $FF, $33, $0A                          ; $0985F9 |
  db $00, $33, $4A                          ; $0985FC |
  db $FF, $33, $0A                          ; $0985FF |
  db $00, $33, $4A                          ; $098602 |
  db $00, $33, $4A                          ; $098605 |
  db $FF, $33, $0A                          ; $098608 |
  db $00, $33, $4A                          ; $09860B |
  db $FF, $33, $0A                          ; $09860E |
  db $00, $33, $4A                          ; $098611 |
  db $FF, $33, $0A                          ; $098614 |
  db $00, $33, $4A                          ; $098617 |
  db $FF, $33, $0A                          ; $09861A |

; draw Car Yoshi's wheels if they exist
draw_car_wheels:
  lms   r0,($0112)                          ; $09861D |\
  lob                                       ; $098620 | | is wheel height
  bne .wheel_OAM                            ; $098621 | | nonzero?
  nop                                       ; $098623 | |
  stop                                      ; $098624 | | return if zero
  nop                                       ; $098625 |/

.wheel_OAM
  lms   r6,($0118)                          ; $098626 |\  [source_car_body]
  ibt   r0,#$0060                           ; $098629 | | r5 = OAM pointer for
  to r5                                     ; $09862B | | player body (car)
  add   r6                                  ; $09862C |/
  ibt   r0,#$0010                           ; $09862D |\  [dest_car_body]
  with r6                                   ; $09862F | | move car body to here
  add   r0                                  ; $098630 |/
  iwt   r2,#$8000                           ; $098631 | clear Y coordinate == free OAM
  ibt   r12,#$0004                          ; $098634 |\  loop 4 times, shift car
  cache                                     ; $098636 | | body down $50 bytes
  move  r13,r15                             ; $098637 |/  or 10 entries

.car_copy_loop
  ldw   (r5)                                ; $098639 |\
  from r2                                   ; $09863A | | copy source to dest
  sbk                                       ; $09863B | | & clear source Y coord
  stw   (r6)                                ; $09863C |/  (frees OAM entry)
  inc   r5                                  ; $09863D |\
  inc   r5                                  ; $09863E | |
  inc   r6                                  ; $09863F | |
  inc   r6                                  ; $098640 | |
  ldw   (r5)                                ; $098641 | |
  stw   (r6)                                ; $098642 | |
  inc   r5                                  ; $098643 | |
  inc   r5                                  ; $098644 | |
  inc   r6                                  ; $098645 | |
  inc   r6                                  ; $098646 | |
  ldw   (r5)                                ; $098647 | |
  stw   (r6)                                ; $098648 | | copy one OAM entry
  inc   r5                                  ; $098649 | | from source to dest
  inc   r5                                  ; $09864A | | to push car down
  inc   r6                                  ; $09864B | | 10 entries
  inc   r6                                  ; $09864C | |
  ldw   (r5)                                ; $09864D | |
  stw   (r6)                                ; $09864E | |
  inc   r5                                  ; $09864F | |
  inc   r5                                  ; $098650 | |
  inc   r6                                  ; $098651 | |
  loop                                      ; $098652 | |
  inc   r6                                  ; $098653 |/  end car_copy_loop
  from r2                                   ; $098654 |\ free body + 1 OAM entry
  stw   (r5)                                ; $098655 |/
  with r5                                   ; $098656 |\  [car_OAM_3_4]
  add   #4                                  ; $098657 | | r0 = word 3 of OAM entry
  ldw   (r5)                                ; $098659 |/  (bytes 3 & 4 of low table)
  with r5                                   ; $09865A |\
  add   #4                                  ; $09865B | | free body + 2
  from r2                                   ; $09865D | | OAM entry
  stw   (r5)                                ; $09865E |/
  iwt   r9,#$01FF                           ; $09865F |\  [wheel_OAM_3_4]
  bic   r9                                  ; $098662 | | same as car except tile #
  ibt   r9,#$0008                           ; $098664 | | set tile to $08
  to r9                                     ; $098666 | | -> r9
  or    r9                                  ; $098667 |/
  lms   r0,($00C4)                          ; $098668 |\
  add   r0                                  ; $09866B | | [player_facing_calc]
  add   r0                                  ; $09866C | | r14 = player facing * 4
  to r14                                    ; $09866D | | - 4
  sub   #4                                  ; $09866E |/ (right = -4, left = 4)
  iwt   r1,#$017E                           ; $098670 | wheel X
  iwt   r2,#$0184                           ; $098673 | wheel Y
  lms   r3,($0094)                          ; $098676 | r3 = [camera_X]
  lms   r4,($009C)                          ; $098679 | r4 = [camera_Y]
  ibt   r5,#$0010                           ; $09867C |\
  lms   r0,($0112)                          ; $09867E | | [wheel_Y_offset]
  sub   r5                                  ; $098681 | | r4 = wheel height
  lms   r5,($0090)                          ; $098682 | | - $10
  add   r5                                  ; $098685 | | + yoshi Y
  lms   r5,($0198)                          ; $098686 | | - car Y
  sub   r5                                  ; $098689 | | - camera_Y
  to r4                                     ; $09868A | |
  sub   r4                                  ; $09868B |/
  lms   r5,($0118)                          ; $09868C |\  r5 = [OAM_front_wheels]
  ibt   r0,#$0030                           ; $09868F | |
  to r6                                     ; $098691 | | r6 = [OAM_back_wheels]
  add   r5                                  ; $098692 |/  6 entries past front
  iwt   r10,#$4002                          ; $098693 |\
  ibt   r12,#$0002                          ; $098696 | | loop through
  cache                                     ; $098698 | | both sides (4 wheels)
  move  r13,r15                             ; $098699 |/

.wheel_OAM_loop
  ldw   (r1)                                ; $09869B |\
  sub   #8                                  ; $09869C | | wheel X
  sub   r3                                  ; $09869E | | - 8
  stw   (r5)                                ; $09869F | | - camera_X
  sub   r14                                 ; $0986A0 | | -> word 1 in OAM_front_wheels
  stw   (r6)                                ; $0986A1 | | (OAM X)
  inc   r5                                  ; $0986A2 | | +/- 4 (based on facing)
  inc   r5                                  ; $0986A3 | | -> word 1 in OAM_back_wheels
  inc   r6                                  ; $0986A4 | |
  inc   r6                                  ; $0986A5 |/
  ldw   (r2)                                ; $0986A6 |\
  add   r4                                  ; $0986A7 | |
  stw   (r5)                                ; $0986A8 | | wheel Y
  stw   (r6)                                ; $0986A9 | | + wheel_Y_offset
  inc   r5                                  ; $0986AA | | -> word 2 in both
  inc   r5                                  ; $0986AB | | OAM_front_wheels and
  inc   r6                                  ; $0986AC | | OAM_back_wheels
  inc   r6                                  ; $0986AD |/
  from r9                                   ; $0986AE |\
  stw   (r5)                                ; $0986AF | |
  from r9                                   ; $0986B0 | | wheel_OAM_3_4
  stw   (r6)                                ; $0986B1 | | -> word 3 in both
  inc   r5                                  ; $0986B2 | | OAM_front_wheels and
  inc   r5                                  ; $0986B3 | | OAM_back_wheels
  inc   r6                                  ; $0986B4 | |
  inc   r6                                  ; $0986B5 |/
  from r10                                  ; $0986B6 |\
  lob                                       ; $0986B7 | |
  stw   (r5)                                ; $0986B8 | | size bit on
  from r10                                  ; $0986B9 | | and forward index
  stw   (r6)                                ; $0986BA | | -> word 4 in OAM_front_wheels
  inc   r5                                  ; $0986BB | | size bit on and reverse index
  inc   r5                                  ; $0986BC | | -> word 4 in OAM_back_wheels
  inc   r6                                  ; $0986BD |/
  with r1                                   ; $0986BE |\
  add   #4                                  ; $0986BF | |
  with r2                                   ; $0986C1 | | next wheel side
  add   #4                                  ; $0986C2 | | for x and y
  loop                                      ; $0986C4 | |
  inc   r6                                  ; $0986C5 |/  end wheel_OAM_loop
  lms   r11,($0112)                         ; $0986C6 |\
  with r11                                  ; $0986C9 | | [wheel_height]
  sub   #8                                  ; $0986CA | | if wheel height >= 8
  bpl .prep_wheel_legs                      ; $0986CC | | continue on
  nop                                       ; $0986CE | | else return now
  stop                                      ; $0986CF | |
  nop                                       ; $0986D0 |/

.prep_wheel_legs
  ibt   r7,#$001F                           ; $0986D1 |\  [leg_OAM_3_4]
  from r9                                   ; $0986D3 | | r9 = wheel_OAM_3_4
  bic   r7                                  ; $0986D4 | | except set tile number to
  to r9                                     ; $0986D6 | | $0A (for legs)
  or    #10                                 ; $0986D7 |/
  with r10                                  ; $0986D9 |\ r10 = $4000
  bic   #2                                  ; $0986DA |/ [wheel_legs_OAM_word_4]
  lms   r0,($00C4)                          ; $0986DC |\
  dec   r0                                  ; $0986DF | | [cam_X_facing_adjust]
  with r3                                   ; $0986E0 | | r3 = camera_X - 1 (right)
  add   r0                                  ; $0986E1 |/  or + 1 (left)
  move  r5,r6                               ; $0986E2 |\
  ibt   r0,#$0030                           ; $0986E4 | | r5 = [OAM_front_legs]
  with r6                                   ; $0986E6 | | r6 = [OAM_back_legs]
  add   r0                                  ; $0986E7 |/  6 entries past front
  with r4                                   ; $0986E8 |\  [leg_Y_offset]
  add   #4                                  ; $0986E9 | | adjust Y +4 to align
  with r4                                   ; $0986EB |/  with -8 each loop

.wheel_legs_loop
  sub   #8                                  ; $0986EC | leg_Y_offset -= 8
  iwt   r1,#$017E                           ; $0986EE | wheel X
  iwt   r2,#$0184                           ; $0986F1 | wheel Y
  ibt   r12,#$0002                          ; $0986F4 |\ nested loop twice
  move  r13,r15                             ; $0986F6 |/ left and right

..sides_loop
  ldw   (r1)                                ; $0986F8 |\
  sub   #4                                  ; $0986F9 | |
  sub   r3                                  ; $0986FB | | wheel X
  stw   (r5)                                ; $0986FC | | - 4
  sub   r14                                 ; $0986FD | | - cam_X_facing_adjust
  stw   (r6)                                ; $0986FE | | -> word 1 in OAM_front_legs
  inc   r5                                  ; $0986FF | | +/- 4 based on facing
  inc   r5                                  ; $098700 | | -> word 1 in OAM_back_legs
  inc   r6                                  ; $098701 | |
  inc   r6                                  ; $098702 |/
  ldw   (r2)                                ; $098703 |\
  add   r4                                  ; $098704 | | wheel Y
  stw   (r5)                                ; $098705 | | + leg_Y_offset
  stw   (r6)                                ; $098706 | | -> word 2 in both
  inc   r5                                  ; $098707 | | OAM_front_legs and
  inc   r5                                  ; $098708 | | OAM_back_legs
  inc   r6                                  ; $098709 | |
  inc   r6                                  ; $09870A |/
  move  r0,r9                               ; $09870B |\
  stw   (r5)                                ; $09870D | |
  stw   (r6)                                ; $09870E | | leg_OAM_3_4
  inc   r5                                  ; $09870F | | -> word 3 in both
  inc   r5                                  ; $098710 | | OAM_front_legs and
  inc   r6                                  ; $098711 | | OAM_back_legs
  inc   r6                                  ; $098712 |/
  sub   r0                                  ; $098713 |\
  stw   (r5)                                ; $098714 | | size bit off
  from r10                                  ; $098715 | | & forward index
  stw   (r6)                                ; $098716 | | -> word 4 in OAM_front_legs
  inc   r5                                  ; $098717 | | size bit off
  inc   r5                                  ; $098718 | | & reverse index
  inc   r6                                  ; $098719 |/  -> word 4 in OAM_back_legs
  with r1                                   ; $09871A |\
  add   #4                                  ; $09871B | |
  with r2                                   ; $09871D | | next wheel side
  add   #4                                  ; $09871E | | for x and y
  loop                                      ; $098720 | |
  inc   r6                                  ; $098721 |/  end nested sides_loop
  with r11                                  ; $098722 |\ wheel_height -= 8
  sub   #8                                  ; $098723 |/ next leg pair (both sides)
  from r11                                  ; $098725 |\
  sub   #1                                  ; $098726 | | if we've reached
  bpl .wheel_legs_loop                      ; $098728 | | zero wheel_height,
  with r4                                   ; $09872A |/  end wheel_legs_loop
  stop                                      ; $09872B |
  nop                                       ; $09872C |

; this is a radial adjustment of both
; mole arms, they've already been
; "drawn" elsewhere
adjust_mole_arms:
  lms   r0,($00BE)                          ; $09872D |\
  iwt   r1,#$0198                           ; $098730 | | is Yoshi anim frame
  sub   r1                                  ; $098733 | | exactly $0198?
  beq .ret                                  ; $098734 | | idle so no arm adjust
  add   r1                                  ; $098736 |/
  ibt   r0,#$0008                           ; $098737 |\
  romb                                      ; $098739 | | [mole_cos]
  lms   r0,($017E)                          ; $09873B | | data bank $08 for
  hib                                       ; $09873E | | 8-bit cosine lookup
  iwt   r14,#cosine_8                       ; $09873F | | r6 = cos(mole angle)
  to r14                                    ; $098742 | |
  add   r14                                 ; $098743 | |
  to r6                                     ; $098744 | |
  getbs                                     ; $098745 |/
  iwt   r1,#$F400                           ; $098747 |\  [mole_arm1_X_adj]
  from r1                                   ; $09874A | | r8 = mole_cos * $F400
  to r8                                     ; $09874B | | arm 1 radius value
  fmult                                     ; $09874C |/
  iwt   r2,#$DC00                           ; $09874D |\  [mole_arm2_X_adj]
  from r2                                   ; $098750 | | r10 = mole_cos * $DC00
  to r10                                    ; $098751 | | arm 2 radius value
  fmult                                     ; $098752 |/
  moves r3,r3                               ; $098753 |\
  bne .sine                                 ; $098755 | |
  with r8                                   ; $098757 | |
  not                                       ; $098758 | | if player_facing left,
  inc   r8                                  ; $098759 | | negate both r8 and r10
  with r10                                  ; $09875A | |
  not                                       ; $09875B | |
  inc   r10                                 ; $09875C |/

.sine
  ibt   r0,#$0040                           ; $09875D |\
  to r14                                    ; $09875F | | [mole_sin]
  add   r14                                 ; $098760 | | r6 = sin(mole angle)
  to r6                                     ; $098761 | | ($40 past cos = sin)
  getbs                                     ; $098762 |/
  from r1                                   ; $098764 |\  [mole_arm1_Y_adj]
  to r7                                     ; $098765 | | r7 = mole_sin * $F400
  fmult                                     ; $098766 |/  r * sin
  from r2                                   ; $098767 |\  [mole_arm2_Y_adj]
  to r9                                     ; $098768 | | r9 = mole_sin * $DC00
  fmult                                     ; $098769 |/  r * sin
  lms   r5,($0118)                          ; $09876A |\
  ibt   r0,#$0060                           ; $09876D | | move $60 (12 entries)
  to r5                                     ; $09876F | | past Yoshi body in OAM
  add   r5                                  ; $098770 |/  to get to arm 1
  ldw   (r5)                                ; $098771 |\
  add   r8                                  ; $098772 | | adjust arm 1's X
  sbk                                       ; $098773 | | + mole_arm1_X_adj
  inc   r5                                  ; $098774 | |
  inc   r5                                  ; $098775 |/
  ldw   (r5)                                ; $098776 |\
  add   r7                                  ; $098777 | | arm 1 Y += mole_arm1_Y_adj
  sbk                                       ; $098778 |/
  ibt   r0,#$0026                           ; $098779 |\
  to r5                                     ; $09877B | | move 5 entries up
  add   r5                                  ; $09877C |/  to get to arm 2
  ldw   (r5)                                ; $09877D |\
  add   r10                                 ; $09877E | |
  sbk                                       ; $09877F | | arm 2 X += mole_arm2_X_adj
  inc   r5                                  ; $098780 | |
  inc   r5                                  ; $098781 |/
  ldw   (r5)                                ; $098782 |\
  add   r9                                  ; $098783 | | arm2 Y += mole_arm2_Y_adj
  sbk                                       ; $098784 |/

.ret
  stop                                      ; $098785 |
  nop                                       ; $098786 |

; helicopter Yoshi draws nothing further
ret_helicopter:
  stop                                      ; $098787 |
  nop                                       ; $098788 |

; this is a radial adjustment of the
; train body, it's already been
; "drawn" elsewhere
adjust_train:
  lms   r0,($00BE)                          ; $098789 |\
  iwt   r1,#$0186                           ; $09878C | | if Yoshi anim frame
  sub   r1                                  ; $09878F | | is NOT $0186, return
  bne .ret                                  ; $098790 | | this frame is regular train
  nop                                       ; $098792 |/
  ibt   r0,#$0008                           ; $098793 |\ data bank for cosine lookup
  romb                                      ; $098795 |/
  lms   r0,($017E)                          ; $098797 |\  [train_angle]
  hib                                       ; $09879A | | r6 = angle of train
  move  r6,r0                               ; $09879B |/  (high byte)
  ibt   r7,#$0040                           ; $09879D |\
  add   r7                                  ; $09879F | | attempts to do a "modulus"
  sex                                       ; $0987A0 | | to get $00-$40 range
  bpl .cos                                  ; $0987A1 | | angles from $40-$BF will
  nop                                       ; $0987A3 | | not branch because $40 + angle
  ibt   r0,#$007F                           ; $0987A4 | | will have sign bit on
  xor   r6                                  ; $0987A6 | | train_angle = 7-bit negate
  inc   r0                                  ; $0987A8 | | if needed, wrapping around to
  to r6                                     ; $0987A9 | | $00-$40
  lob                                       ; $0987AA |/

.cos
  iwt   r0,#cosine_8                        ; $0987AB |\
  to r14                                    ; $0987AE | | [train_cos]
  add   r6                                  ; $0987AF | | r0 = cos(train_angle)
  getbs                                     ; $0987B0 |/
  iwt   r6,#$F000                           ; $0987B2 |\  [train_Y_adj]
  to r7                                     ; $0987B5 | | r7 = train_cos * $F000 (radius)
  fmult                                     ; $0987B6 |/
  ibt   r0,#$0040                           ; $0987B7 |\
  to r14                                    ; $0987B9 | | [train_sin]
  add   r14                                 ; $0987BA | | r0 = sin(train_angle)
  getbs                                     ; $0987BB |/  ($40 past cos = sin)
  to r8                                     ; $0987BD |\ [train_X_adj]
  fmult                                     ; $0987BE |/ r8 = train_sin * $F000 (radius)
  moves r3,r3                               ; $0987BF |\
  beq .adjust_OAM                           ; $0987C1 | | if player_facing left,
  with r8                                   ; $0987C3 | | negate train_X_adj
  not                                       ; $0987C4 | |
  inc   r8                                  ; $0987C5 |/

.adjust_OAM
  lms   r5,($0118)                          ; $0987C6 |\
  ibt   r0,#$0060                           ; $0987C9 | | 12 entries past Yoshi body
  to r5                                     ; $0987CB | | = train body
  add   r5                                  ; $0987CC |/
  ibt   r6,#$0006                           ; $0987CD |\
  cache                                     ; $0987CF | | prepare OAM_loop
  ibt   r12,#$0004                          ; $0987D0 | | 4 pieces of train body
  move  r13,r15                             ; $0987D2 |/

.OAM_loop
  ldw   (r5)                                ; $0987D4 |\
  add   r8                                  ; $0987D5 | | train body X +=
  sbk                                       ; $0987D6 | | train_X_adj
  inc   r5                                  ; $0987D7 | |
  inc   r5                                  ; $0987D8 |/
  ldw   (r5)                                ; $0987D9 |\ train body Y +=
  add   r7                                  ; $0987DA |/ train_Y_adj
  with r5                                   ; $0987DB |\
  add   r6                                  ; $0987DC |/ next OAM entry
  loop                                      ; $0987DD |
  sbk                                       ; $0987DE | end OAM_loop

.ret
  stop                                      ; $0987DF |
  nop                                       ; $0987E0 |

; this is the routine to draw
; or adjust the Mushroom Yoshi
; form which never came to be
; it does nothing
ret_mushroom:
  stop                                      ; $0987E1 |
  nop                                       ; $0987E2 |

; submarine Yoshi draws nothing further
ret_submarine:
  stop                                      ; $0987E3 |
  nop                                       ; $0987E4 |

; this is both Ski Yoshi and Plane Yoshi,
; another form that never came to be
; neither do anything
ret_ski_plane:
  stop                                      ; $0987E5 |
  nop                                       ; $0987E6 |

; adjusts Super Baby Mario's body OAM
; angular/radially based on
; cape / running
adjust_mario:
  ibt   r0,#$0008                           ; $0987E7 |\ data bank for cosine lookup
  romb                                      ; $0987E9 |/
  lms   r0,($00BE)                          ; $0987EB |\
  iwt   r14,#$0124                          ; $0987EE | | if Yoshi anim frame
  sub   r14                                 ; $0987F1 | | is $0124
  beq .caping                               ; $0987F2 | | this means Mario is caping
  nop                                       ; $0987F4 |/
  lms   r0,($0180)                          ; $0987F5 |\
  dec   r0                                  ; $0987F8 | | if mario not running
  bmi .ret                                  ; $0987F9 | | or caping, return
  nop                                       ; $0987FB |/
  lms   r0,($017E)                          ; $0987FC |\
  iwt   r14,#cosine_8                       ; $0987FF | |
  to r14                                    ; $098802 | | [mario_Y_adj]
  add   r14                                 ; $098803 | | r7 = cos(mario angle)
  getbs                                     ; $098804 | | * radius $D000
  iwt   r6,#$D000                           ; $098806 | | + 14
  fmult                                     ; $098809 | |
  ibt   r7,#$000E                           ; $09880A | | [mario_radius] = $D000
  to r7                                     ; $09880C | |
  add   r7                                  ; $09880D |/

.sine
  ibt   r0,#$0040                           ; $09880E |\
  to r14                                    ; $098810 | | [mario_X_adj]
  add   r14                                 ; $098811 | | r8 = sin(mario angle)
  getbs                                     ; $098812 | | * mario_radius
  to r8                                     ; $098814 | |
  fmult                                     ; $098815 |/
  moves r3,r3                               ; $098816 |\
  beq .adjust_OAM                           ; $098818 | | if player_facing left,
  with r8                                   ; $09881A | | negate mario_X_adj
  not                                       ; $09881B | |
  inc   r8                                  ; $09881C |/

.adjust_OAM
  lms   r5,($0118)                          ; $09881D |\
  ibt   r0,#$0060                           ; $098820 | | 12 entries past Yoshi body
  to r5                                     ; $098822 | | = mario body
  add   r5                                  ; $098823 |/
  ibt   r6,#$0006                           ; $098824 |\
  cache                                     ; $098826 | | prepare OAM_loop
  ibt   r12,#$0004                          ; $098827 | | 4 pieces of mario body
  move  r13,r15                             ; $098829 |/

.OAM_loop
  ldw   (r5)                                ; $09882B |\
  add   r8                                  ; $09882C | | mario body X +=
  sbk                                       ; $09882D | | mario_X_adj
  inc   r5                                  ; $09882E | |
  inc   r5                                  ; $09882F |/
  ldw   (r5)                                ; $098830 |\ mario body Y +=
  add   r7                                  ; $098831 |/ mario_Y_adj
  with r5                                   ; $098832 |\
  add   r6                                  ; $098833 |/ next OAM entry
  loop                                      ; $098834 |
  sbk                                       ; $098835 | end OAM_loop

.ret
  stop                                      ; $098836 |
  nop                                       ; $098837 |

.caping
  lms   r0,($017E)                          ; $098838 |\
  iwt   r14,#cosine_8                       ; $09883B | |
  to r14                                    ; $09883E | | [mario_Y_adj]
  add   r14                                 ; $09883F | | r7 = cos(mario angle)
  getbs                                     ; $098840 | | * radius $3000
  iwt   r6,#$3000                           ; $098842 | | + 10
  fmult                                     ; $098845 | | [mario_radius] = $3000
  ibt   r7,#$000A                           ; $098846 | | spaghetti code! use a diff.
  to r7                                     ; $098848 | | radius & offset for caping
  bra .sine                                 ; $098849 | | then branch back up to sine
  sub   r7                                  ; $09884B |/

  ibt   r0,#$0008                           ; $09884C |
  romb                                      ; $09884E |
  iwt   r1,#$11E0                           ; $098850 |
  iwt   r2,#$1280                           ; $098853 |
  iwt   r3,#$10A0                           ; $098856 |
  iwt   r9,#$1140                           ; $098859 |
  iwt   r7,#$0EC0                           ; $09885C |
  iwt   r8,#$15A0                           ; $09885F |
  iwt   r10,#$1500                          ; $098862 |
  iwt   r5,#$1822                           ; $098865 |
  cache                                     ; $098868 |
  ibt   r12,#$0028                          ; $098869 |
  move  r13,r15                             ; $09886B |
  ldb   (r7)                                ; $09886D |
  inc   r7                                  ; $09886F |
  inc   r7                                  ; $098870 |
  sub   #12                                 ; $098871 |
  bcs CODE_09888A                           ; $098873 |
  to r6                                     ; $098875 |
  ibt   r0,#$0004                           ; $098876 |
  to r1                                     ; $098878 |
  add   r1                                  ; $098879 |
  to r2                                     ; $09887A |
  add   r2                                  ; $09887B |
  to r3                                     ; $09887C |
  add   r3                                  ; $09887D |
  to r9                                     ; $09887E |
  add   r9                                  ; $09887F |
  to r8                                     ; $098880 |
  add   r8                                  ; $098881 |
  to r5                                     ; $098882 |
  add   r5                                  ; $098883 |
  to r10                                    ; $098884 |
  add   r10                                 ; $098885 |
  iwt   r15,#$8921                          ; $098886 |
  inc   r7                                  ; $098889 |

CODE_09888A:
  ldw   (r1)                                ; $09888A |
  ldw   (r7)                                ; $09888B |
  move  r4,r0                               ; $09888C |
  hib                                       ; $09888E |
  mult  #8                                  ; $09888F |
  to r11                                    ; $098891 |
  add   r0                                  ; $098892 |
  from r4                                   ; $098893 |
  lob                                       ; $098894 |
  iwt   r14,#$AE58                          ; $098895 |
  to r14                                    ; $098898 |
  add   r14                                 ; $098899 |
  ldw   (r8)                                ; $09889A |
  sub   r6                                  ; $09889B |
  bpl CODE_0988A1                           ; $09889C |
  ldw   (r10)                               ; $09889E |
  not                                       ; $09889F |
  inc   r0                                  ; $0988A0 |

CODE_0988A1:
  add   r6                                  ; $0988A1 |
  stw   (r1)                                ; $0988A2 |
  add   r11                                 ; $0988A3 |
  add   r0                                  ; $0988A4 |
  to r6                                     ; $0988A5 |
  add   r0                                  ; $0988A6 |
  getb                                      ; $0988A7 |
  ibt   r4,#$0040                           ; $0988A8 |
  with r14                                  ; $0988AA |
  sub   r4                                  ; $0988AB |
  swap                                      ; $0988AC |
  to r11                                    ; $0988AD |
  fmult                                     ; $0988AE |
  getb                                      ; $0988AF |
  swap                                      ; $0988B0 |
  to r6                                     ; $0988B1 |
  fmult                                     ; $0988B2 |
  iwt   r14,#$0100                          ; $0988B3 |
  ldw   (r5)                                ; $0988B6 |
  dec   r0                                  ; $0988B7 |
  swap                                      ; $0988B8 |
  bmi CODE_0988C0                           ; $0988B9 |
  swap                                      ; $0988BB |
  inc   r0                                  ; $0988BC |
  to r14                                    ; $0988BD |
  hib                                       ; $0988BE |
  inc   r14                                 ; $0988BF |

CODE_0988C0:
  from r14                                  ; $0988C0 |
  lmult                                     ; $0988C1 |
  with r4                                   ; $0988C3 |
  hib                                       ; $0988C4 |
  lob                                       ; $0988C5 |
  swap                                      ; $0988C6 |
  or    r4                                  ; $0988C7 |
  move  r6,r0                               ; $0988C8 |
  beq CODE_0988D7                           ; $0988CA |
  lob                                       ; $0988CC |
  to r4                                     ; $0988CD |
  swap                                      ; $0988CE |
  ldw   (r3)                                ; $0988CF |
  add   r4                                  ; $0988D0 |
  sbk                                       ; $0988D1 |
  from r6                                   ; $0988D2 |
  hib                                       ; $0988D3 |
  sex                                       ; $0988D4 |
  adc   #0                                  ; $0988D5 |

CODE_0988D7:
  stw   (r2)                                ; $0988D7 |
  inc   r3                                  ; $0988D8 |
  inc   r3                                  ; $0988D9 |
  to r6                                     ; $0988DA |
  ldw   (r3)                                ; $0988DB |
  add   r6                                  ; $0988DC |
  sbk                                       ; $0988DD |
  inc   r1                                  ; $0988DE |
  inc   r1                                  ; $0988DF |
  inc   r2                                  ; $0988E0 |
  inc   r2                                  ; $0988E1 |
  inc   r8                                  ; $0988E2 |
  inc   r8                                  ; $0988E3 |
  inc   r10                                 ; $0988E4 |
  inc   r10                                 ; $0988E5 |
  ldw   (r8)                                ; $0988E6 |
  to r6                                     ; $0988E7 |
  ldw   (r1)                                ; $0988E8 |
  sub   r6                                  ; $0988E9 |
  bpl CODE_0988EF                           ; $0988EA |
  ldw   (r10)                               ; $0988EC |
  not                                       ; $0988ED |
  inc   r0                                  ; $0988EE |

CODE_0988EF:
  add   r6                                  ; $0988EF |
  stw   (r1)                                ; $0988F0 |
  to r6                                     ; $0988F1 |
  add   r11                                 ; $0988F2 |
  from r14                                  ; $0988F3 |
  lmult                                     ; $0988F4 |
  with r4                                   ; $0988F6 |
  hib                                       ; $0988F7 |
  lob                                       ; $0988F8 |
  swap                                      ; $0988F9 |
  or    r4                                  ; $0988FA |
  move  r6,r0                               ; $0988FB |
  beq CODE_09890A                           ; $0988FD |
  lob                                       ; $0988FF |
  to r4                                     ; $098900 |
  swap                                      ; $098901 |
  ldw   (r9)                                ; $098902 |
  add   r4                                  ; $098903 |
  sbk                                       ; $098904 |
  from r6                                   ; $098905 |
  hib                                       ; $098906 |
  sex                                       ; $098907 |
  adc   #0                                  ; $098908 |

CODE_09890A:
  stw   (r2)                                ; $09890A |
  inc   r9                                  ; $09890B |
  inc   r9                                  ; $09890C |
  to r6                                     ; $09890D |
  ldw   (r9)                                ; $09890E |
  add   r6                                  ; $09890F |
  sbk                                       ; $098910 |
  inc   r1                                  ; $098911 |
  inc   r1                                  ; $098912 |
  inc   r2                                  ; $098913 |
  inc   r2                                  ; $098914 |
  inc   r8                                  ; $098915 |
  inc   r8                                  ; $098916 |
  inc   r3                                  ; $098917 |
  inc   r3                                  ; $098918 |
  inc   r9                                  ; $098919 |
  inc   r9                                  ; $09891A |
  inc   r10                                 ; $09891B |
  inc   r10                                 ; $09891C |
  with r5                                   ; $09891D |
  add   #4                                  ; $09891E |
  inc   r7                                  ; $098920 |
  loop                                      ; $098921 |
  inc   r7                                  ; $098922 |
  stop                                      ; $098923 |
  nop                                       ; $098924 |

; this routine handles:
; screen edge autoscroll death
; screen edge warp
; sprite despawning from camera OOB
; sprite OAM buffer computations & stores ("drawing")
; parameters:
; r3: screen edge warp flag ($0000 don't warp)
; returns:
; r0: $16 for screen edge warp, $12 for screen edge death, else $00
gsu_edge_despawn_draw:
  lms   r0,($00AC)                          ; $098925 |\
  lm    r1,($1E2A)                          ; $098928 | | if either camera event
  or    r1                                  ; $09892C | | or nonzero yoshi state
  beq .check_edges                          ; $09892D | | skip edge warp & death
  nop                                       ; $09892F | |
  iwt   r15,#.despawn_sprites               ; $098930 | |
  nop                                       ; $098933 |/

.check_edges
  lms   r0,($008C)                          ; $098934 | yoshi x
  lms   r1,($0094)                          ; $098937 | camera x
  sub   r1                                  ; $09893A | yoshi - camera x
  ibt   r2,#$0060                           ; $09893B | MAP16 terrain right side bits
  ibt   r4,#$0008                           ; $09893D |\  [yoshi_edge_delta]
  to r6                                     ; $09893F | | r6 = yoshi x - camera x - 8
  sub   r4                                  ; $098940 | | if yoshi is within 8 pixels
  bmi .check_autoscroll_edge_death          ; $098941 | | of left edge of screen
  nop                                       ; $098943 |/  don't warp
  iwt   r2,#$0180                           ; $098944 | MAP16 terrain left side bits
  iwt   r4,#$00E8                           ; $098947 |\  [yoshi_edge_delta]
  to r6                                     ; $09894A | | r6 = yoshi x - camera x - $E8
  sub   r4                                  ; $09894B | | if yoshi is at least 24 pixels left
  dec   r6                                  ; $09894C | | of right edge of screen
  bmi .despawn_sprites                      ; $09894D | | skip warp & edge death
  inc   r6                                  ; $09894F |/
  moves r3,r3                               ; $098950 |\  check screen edge flag
  beq .check_autoscroll_edge_death          ; $098952 | | if $0000, skip warp
  nop                                       ; $098954 |/
  iwt   r4,#$00F8                           ; $098955 |\
  sub   r4                                  ; $098958 | | if yoshi x - camera x < $F8
  bmi .despawn_sprites                      ; $098959 | | at least 8 pixels away from right edge
  nop                                       ; $09895B |/  skip warp & edge death
  ibt   r0,#$0016                           ; $09895C | if not, return $16
  stop                                      ; $09895E | meaning screen edge warp!
  nop                                       ; $09895F |

; dead code
  bra .despawn_sprites                      ; $098960 |
  nop                                       ; $098962 |

.check_autoscroll_edge_death
  lm    r5,($1E28)                          ; $098963 |\  is autoscroll scrolling in
  from r6                                   ; $098967 | | same direction as
  xor   r5                                  ; $098968 | | yoshi_edge_delta?
  bpl .autoscroll_edge_push                 ; $09896A | | if not, we're at the "bad" edge
  nop                                       ; $09896C |/
  lms   r0,($00FC)                          ; $09896D |\  so check opposite side (left / right)
  and   r2                                  ; $098970 | | head & body terrain collision
  beq .autoscroll_edge_push                 ; $098971 | | if neither, don't squish to DEATH
  nop                                       ; $098973 |/
  moves r0,r6                               ; $098974 |\
  bpl .yoshi_squish_death                   ; $098976 | | r0 = absolute value
  nop                                       ; $098978 | | of yoshi_edge_delta
  not                                       ; $098979 | |
  inc   r0                                  ; $09897A |/

.yoshi_squish_death
  sub   #15                                 ; $09897B |\  if abs(yoshi_edge_delta) < 15
  bcc .despawn_sprites                      ; $09897D | | means 15 & over outside screen
  nop                                       ; $09897F |/  edge on either side = death
  ibt   r0,#$0012                           ; $098980 | return $12
  stop                                      ; $098982 | which means DIE YOSHI, DIE!!!
  nop                                       ; $098983 | get squished, NUB!

; dead code
  bra .despawn_sprites                      ; $098984 |
  nop                                       ; $098986 |

.autoscroll_edge_push
  lms   r7,($00A8)                          ; $098987 |\
  from r7                                   ; $09898A | | is autoscroll scrolling in the same
  sub   r5                                  ; $09898B | | direction as yoshi prev velocity
  xor   r7                                  ; $09898C | | AND autoscroll velocity is a larger
  bmi .clamp_edge_delta                     ; $09898E | | absolute value?
  nop                                       ; $098990 |/
  from r5                                   ; $098991 |\  if not, this means we must correct
  sbk                                       ; $098992 | | Yoshi's velocity to stay in bounds
  sms   ($00B4),r5                          ; $098993 |/  match it to autoscroll's velocity
  lm    r0,($1E26)                          ; $098996 |\ also match subpixel positions
  sms   ($008A),r0                          ; $09899A |/ autoscroll -> yoshi

.clamp_edge_delta
  from r6                                   ; $09899D |\
  add   #4                                  ; $09899E | |
  bmi .clamp_edge_delta_math                ; $0989A0 | | if yoshi_edge_delta
  nop                                       ; $0989A2 | | < -4 or > 4,
  sub   #8                                  ; $0989A3 | | clamp to +/- 4
  bcc .push_yoshi                           ; $0989A5 | |
  nop                                       ; $0989A7 |/

.clamp_edge_delta_math
  not                                       ; $0989A8 |\  [yoshi_edge_clamped]
  inc   r0                                  ; $0989A9 | | performs clamp math if needed
  to r6                                     ; $0989AA | | r6 = -yoshi_edge_delta +/- 4
  add   r6                                  ; $0989AB |/  + yoshi_edge_delta, meaning result +/- 4

.push_yoshi
  lms   r0,($008C)                          ; $0989AC |\  push yoshi away from edge
  sub   r6                                  ; $0989AF | | by at most 4 pixels
  sbk                                       ; $0989B0 |/
  lm    r5,($1E48)                          ; $0989B1 |\
  moves r5,r5                               ; $0989B5 | | if baby mario is not on
  bmi .despawn_sprites                      ; $0989B7 | | yoshi's back
  nop                                       ; $0989B9 |/
  iwt   r0,#$10E2                           ; $0989BA |\
  add   r5                                  ; $0989BD | | if he is,
  ldw   (r0)                                ; $0989BE | | push him as well the same
  sub   r6                                  ; $0989BF | | amount
  sbk                                       ; $0989C0 |/

; move on to despawning sprites
; checking offscreen basically kills them
; this also goes through ambient sprites
.despawn_sprites
  ibt   r0,#$0009                           ; $0989C1 |
  romb                                      ; $0989C3 |
  iwt   r1,#$1461                           ; $0989C5 | background layer
  iwt   r2,#$10A2                           ; $0989C8 | x coord
  iwt   r3,#$1142                           ; $0989CB | y coord
  iwt   r4,#$1640                           ; $0989CE | OAM x & y
  iwt   r6,#$0EC0                           ; $0989D1 | sprite state
  iwt   r9,#$1000                           ; $0989D4 | drawing information
  iwt   r10,#$1460                          ; $0989D7 | stage ID
  cache                                     ; $0989DA |
  ibt   r12,#$0028                          ; $0989DB | 40 total sprites, including ambient
  move  r13,r15                             ; $0989DD | loop begin through sprite tables

.sprite_despawn_loop
  ldb   (r6)                                ; $0989DF |\
  dec   r0                                  ; $0989E1 | | is sprite state > 0?
  bpl .check_offscreen                      ; $0989E2 | | any state besides 00
  nop                                       ; $0989E4 |/
  inc   r4                                  ; $0989E5 |
  iwt   r15,#.next_sprite                   ; $0989E6 | if free slot, skip processing
  inc   r4                                  ; $0989E9 |

.check_offscreen
  ldb   (r1)                                ; $0989EA |\
  iwt   r7,#$0094                           ; $0989EC | | [layer_X_camera]
  to r7                                     ; $0989EF | | r7 = proper layer #'s
  add   r7                                  ; $0989F0 | | X camera based on sprite's
  to r7                                     ; $0989F1 | | layer #
  ldw   (r7)                                ; $0989F2 |/
  iwt   r8,#$009C                           ; $0989F3 |\
  add   r8                                  ; $0989F6 | | [layer_Y_camera]
  to r8                                     ; $0989F7 | | r8 = same for Y
  ldw   (r0)                                ; $0989F8 |/
  ldw   (r2)                                ; $0989F9 |\  [spr_cam_rel_X]
  sub   r7                                  ; $0989FA | | r7 = sprite x - layer_X_camera
  stw   (r4)                                ; $0989FB | | also store into 1640,x
  move  r7,r0                               ; $0989FC |/
  ldw   (r3)                                ; $0989FE |\
  sub   r8                                  ; $0989FF | | [spr_cam_rel_Y]
  inc   r4                                  ; $098A00 | | r8 = sprite y - layer_Y_camera
  inc   r4                                  ; $098A01 | | also store into 1642,x
  stw   (r4)                                ; $098A02 | |
  move  r8,r0                               ; $098A03 |/
  ldw   (r9)                                ; $098A05 |\  [despawn_threshold_index]
  and   #12                                 ; $098A06 | | r0 = 1000,x bits 2 & 3
  beq .next_sprite                          ; $098A08 | | index into despawn_thresholds
  nop                                       ; $098A0A |/  if this is 0, don't despawn
  iwt   r14,#.despawn_thresholds-4          ; $098A0B |\
  to r14                                    ; $098A0E | |
  add   r14                                 ; $098A0F | | [despawn_X_threshold]
  getb                                      ; $098A10 | | r0 = ROM fetch at 8C83 +
  inc   r14                                 ; $098A11 | | despawn_threshold_index
  iwt   r11,#$00F0                          ; $098A12 | | grabs first word of entry of table:
  getbh                                     ; $098A15 | | x threshold
  inc   r14                                 ; $098A17 |/
  to r5                                     ; $098A18 |\  if spr_cam_rel_X -
  add   r7                                  ; $098A19 | | despawn_X_threshold
  add   r0                                  ; $098A1A | | (unsigned) > $00F0
  add   r11                                 ; $098A1B | | checks X on both sides
  sub   r5                                  ; $098A1C | | despawns if offscreen
  bcc .despawn                              ; $098A1D |/
  sub   r0                                  ; $098A1F |
  getb                                      ; $098A20 |\  [despawn_Y_threshold]
  inc   r14                                 ; $098A21 | | r0 = next word: y threshold
  iwt   r11,#$00C8                          ; $098A22 | |
  getbh                                     ; $098A25 |/
  to r5                                     ; $098A27 |\
  add   r8                                  ; $098A28 | | if spr_cam_rel_Y -
  add   r0                                  ; $098A29 | | despawn_Y_threshold
  add   r11                                 ; $098A2A | | (unsigned) > $00C8
  sub   r5                                  ; $098A2B | | checks Y on top & bottom
  bcs .next_sprite                          ; $098A2C | | next sprite if onscreen
  sub   r0                                  ; $098A2E |/

.despawn
  stw   (r6)                                ; $098A2F | $0000 -> state
  dec   r0                                  ; $098A30 |\
  inc   r1                                  ; $098A31 | | $FF -> 1462,x
  stb   (r1)                                ; $098A32 | | byte 3, used to disable drawing
  dec   r1                                  ; $098A34 |/
  ibt   r0,#$0018                           ; $098A35 |\
  sub   r12                                 ; $098A37 | | $A0 - loop index * 4 + 16E2
  add   r0                                  ; $098A38 | | this gets the current sprite slot
  to r8                                     ; $098A39 | | based on the loop counter
  add   r0                                  ; $098A3A | | there weren't enough registers
  ibt   r0,#$0040                           ; $098A3B | | for every single table
  add   r8                                  ; $098A3D | | so this needed to be calculated
  iwt   r8,#$16E2                           ; $098A3E | | because loop counter is backwards
  add   r8                                  ; $098A41 | | compared to the forward processing
  ldw   (r0)                                ; $098A42 | | if current sprite's dyntile index is
  sub   #0                                  ; $098A43 | | $FFFF, meaning no super FX graphics
  bmi .free_stage_sprite                    ; $098A45 | | then skip freeing dyntile
  nop                                       ; $098A47 |/
  iwt   r8,#$1ECE                           ; $098A48 |\
  add   r8                                  ; $098A4B | | load dyntile reserved information
  ldw   (r0)                                ; $098A4C | | for current sprite using dyntile index
  not                                       ; $098A4D | | take the "not" to treat as a mask
  lm    r8,($1ECC)                          ; $098A4E | | of everything 1 except the sprite's region(s)
  and   r8                                  ; $098A52 | | mask with currently reserved to effectively
  sbk                                       ; $098A53 |/  free these dyntile regions

; this marks the sprite's stage-wide ID
; as free to spawn in
.free_stage_sprite
  ldb   (r10)                               ; $098A54 |\
  iwt   r8,#$28CA                           ; $098A56 | | grab stage ID from 1460,x
  to r8                                     ; $098A59 | | $00 -> 7028CA + ID
  add   r8                                  ; $098A5A | | marks as free
  sub   r0                                  ; $098A5B | |
  stb   (r8)                                ; $098A5C |/
  lm    r0,($01B6)                          ; $098A5E |\  clears the "standing on" slot
  sub   r12                                 ; $098A62 | | 99% sure this never ever fires
  bne .next_sprite                          ; $098A63 | | compares a sprite slot ($00-$5C)
  nop                                       ; $098A65 | | against the loop counter ($00-$28)
  sm    ($01B6),r0                          ; $098A66 |/  they will never be equal...

.next_sprite
  ibt   r0,#$0004                           ; $098A6A |\
  to r2                                     ; $098A6C | |
  add   r2                                  ; $098A6D | |
  to r3                                     ; $098A6E | |
  add   r3                                  ; $098A6F | |
  to r6                                     ; $098A70 | |
  add   r6                                  ; $098A71 | | next sprite slot
  to r9                                     ; $098A72 | | in all tables
  add   r9                                  ; $098A73 | |
  to r10                                    ; $098A74 | |
  add   r10                                 ; $098A75 | |
  to r1                                     ; $098A76 | |
  add   r1                                  ; $098A77 | |
  inc   r4                                  ; $098A78 | |
  loop                                      ; $098A79 | |
  inc   r4                                  ; $098A7A |/  end sprite_despawn_loop

.prep_sprite_priority
  ibt   r0,#$004D                           ; $098A7B |\  begin nested loop
  romb                                      ; $098A7D | | through all sprites' 1462,x
  ibt   r11,#$0000                          ; $098A7F | | r11 = [priority_loop_index]
  iwt   r13,#$8A8F                          ; $098A81 | | go through all sprites once
  iwt   r1,#$1462                           ; $098A84 | | per sprite priority
  iwt   r2,#$1000                           ; $098A87 | | so 8 total, 0-7
  cache                                     ; $098A8A |/

; outer loop starts here
.sprite_priority_loop
  ibt   r12,#$0028                          ; $098A8B | r12 = [draw_loop_index]
  ibt   r10,#$0000                          ; $098A8D | r10 = [draw_sprite_slot]

; inner loop starts here
.sprite_draw_loop
  from r1                                   ; $098A8F |\
  add   r10                                 ; $098A90 | | if 1462,x == priority_loop_index
  ldw   (r0)                                ; $098A91 | | meaning are we on this sprite's
  sub   r11                                 ; $098A92 | | priority? if so, draw it
  beq .check_sprite_anim_frame              ; $098A93 | |
  nop                                       ; $098A95 |/
  iwt   r15,#.next_sprite_draw+1            ; $098A96 |\ next sprite if we're not on
  inc   r10                                 ; $098A99 |/ this sprite's priority

.check_sprite_anim_frame
  iwt   r0,#$13C2                           ; $098A9A |\  [sprite_anim_frame]
  add   r10                                 ; $098A9D | | r9 = 13C2,x
  ldw   (r0)                                ; $098A9E | | animation frame
  move  r9,r0                               ; $098A9F |/
  hib                                       ; $098AA1 |\ is sprite_anim_frame
  beq .sprite_drawing_method                ; $098AA2 |/ $00xx? (high byte 00)
  dec   r0                                  ; $098AA4 |\ is sprite_anim_frame
  bne .jump_drawing_method_01               ; $098AA5 |/ NOT $01xx? (high byte 01)
  to r9                                     ; $098AA7 |\
  sub   r0                                  ; $098AA8 | | if sprite_anim_frame == $01xx
  sms   ($0000),r9                          ; $098AA9 | | store $0000 -> ($0000)
  iwt   r14,#$0914                          ; $098AAC | | and jump to drawing method $00
  bra .drawing_method_00_compute_OAM        ; $098AAF | | hardcoded load from $4D0914
  getb                                      ; $098AB1 |/

; this code handles high byte of sprite_anim_frame
; being > $01, so $02xx, $03xx, ...
.jump_drawing_method_01
  sub   r0                                  ; $098AB2 |\ store $0000 -> ($0000)
  sms   ($0000),r9                          ; $098AB3 |/
  sms   ($0058),r12                         ; $098AB6 | preserve draw_loop_index
  ibt   r12,#$0004                          ; $098AB9 | begin a new (triple nested) loop
  iwt   r14,#$0918                          ; $098ABB | hardcoded load of 4D0918
  iwt   r15,#$8BAE                          ; $098ABE | jump to drawing method 01
  alt2                                      ; $098AC1 |

.sprite_drawing_method
  iwt   r0,#$1140                           ; $098AC2 |\  [OBJ_tile_index]
  add   r10                                 ; $098AC5 | | store sprite's OBJ tile index
  ldb   (r0)                                ; $098AC6 | | << 3 (if any)
  mult  #8                                  ; $098AC8 | | -> ($0000)
  sms   ($0000),r0                          ; $098ACA |/
  from r2                                   ; $098ACD |\
  add   r10                                 ; $098ACE | | load 1000,x
  ldw   (r0)                                ; $098ACF | |
  and   #3                                  ; $098AD0 | | take bits 0 & 1 (drawing method)
  mult  #3                                  ; $098AD2 | | * 3 (to line up with ptr table)
  inc   r0                                  ; $098AD4 | | + 1
  to r15                                    ; $098AD5 | | increment PC by this much
  add   r15                                 ; $098AD6 |/  effectively, pointer table

; this is a "pointer table" in Super FX form
; the PC just gets added onto and then
; we basically iwt r15,#destination
.drawing_method_ptr
  iwt   r15,#.drawing_method_00             ; $098AD7 |
  db $F0                                    ; $098ADA |
  ; iwt   r0,#xxxx

  dw .drawing_method_01                     ; $098ADB |
  alt2                                      ; $098ADD |

  dw .drawing_method_02                     ; $098ADE |
  db $F0                                    ; $098AE0 |
  ; iwt   r0,#xxxx

  dw .drawing_method_03                     ; $098AE1 |
  alt2                                      ; $098AE3 |

.next_sprite_draw
  inc   r10                                 ; $098AE4 |\
  inc   r10                                 ; $098AE5 | | draw_sprite_slot
  inc   r10                                 ; $098AE6 | | next sprite
  loop                                      ; $098AE7 | |
  inc   r10                                 ; $098AE8 |/
  inc   r11                                 ; $098AE9 | next sprite priority
  lms   r0,($011A)                          ; $098AEA |\  if priority_loop_index == 011A
  sub   r11                                 ; $098AED | | this is the "above" layer
  beq .above_layer                          ; $098AEE |/
  from r11                                  ; $098AF0 |\  if priority_loop_index >= 8
  sub   #8                                  ; $098AF1 | | all sprite priorities are done
  bcs .ret                                  ; $098AF3 | | return
  nop                                       ; $098AF5 |/
  iwt   r15,#.sprite_priority_loop+1        ; $098AF6 | else continue sprite_priority_loop
  db $AC                                    ; $098AF9 |
  ; ibt   r12,#xx

.ret
  stop                                      ; $098AFA |\ note: r0 guaranteed = $0000
  nop                                       ; $098AFB |/ because 8 - 8 is final compare

.above_layer
  lms   r8,($0092)                          ; $098AFC |\  reserve $A0 bytes of OAM
  iwt   r0,#$00A0                           ; $098AFF | | for above layer
  add   r8                                  ; $098B02 | | (that's 20 sprites)
  sbk                                       ; $098B03 |/
  sms   ($0118),r8                          ; $098B04 | above layer OAM address -> 0118
  iwt   r15,#.sprite_priority_loop+1        ; $098B07 | continue sprite_priority_loop
  db $AC                                    ; $098B0A |
  ; ibt   r12,#xx

; drawing method 00 seems to just be a simple
; single OAM entry that's determined by a pointer at
; 1A8000 + sprite ID * 2
; this pointer then adds on anim frame * 2
; and that is the OAM word for the entry
.drawing_method_00
  ; iwt r0, #1320
  dw $1320                                  ; $098B0B |\
  add   r10                                 ; $098B0D | | r0 = sprite ID * 2
  ldw   (r0)                                ; $098B0E | |
  add   r0                                  ; $098B0F |/
  iwt   r14,#$0000                          ; $098B10 |\  r0 = read ROM at
  to r14                                    ; $098B13 | | 1A8000,ID*2
  add   r14                                 ; $098B14 | | low byte of pointer
  getb                                      ; $098B15 |/  into method 00 table

..compute_OAM
  inc   r14                                 ; $098B16 | build up OAM 1 piece at a time
  iwt   r6,#$1002                           ; $098B17 |\
  with r6                                   ; $098B1A | | r6 = 1002,x
  add   r10                                 ; $098B1B | | OAM low bytes 3 & 4
  to r6                                     ; $098B1C | | (yx flip & palette)
  ldw   (r6)                                ; $098B1D |/
  getbh                                     ; $098B1E |\
  add   r9                                  ; $098B20 | | 00 method pointer
  to r14                                    ; $098B21 | | + sprite_anim_frame * 2
  add   r9                                  ; $098B22 |/  address of frame's info
  iwt   r0,#$13C0                           ; $098B23 |\
  add   r10                                 ; $098B26 | | facing dir to get x/y flip
  ldb   (r0)                                ; $098B27 | | (00000yx0)
  add   r0                                  ; $098B29 | | << 5
  add   r0                                  ; $098B2A | | to shift as yx00000
  mult  #8                                  ; $098B2B | | ^ 1002,x, swap:
  xor   r6                                  ; $098B2D | | r6 = yxpp---t 00000000
  to r6                                     ; $098B2F | |
  swap                                      ; $098B30 |/
  with r6                                   ; $098B31 |\  tile number from ROM:
  getbl                                     ; $098B32 | | r6 = yxpp---t tttttttt
  inc   r14                                 ; $098B34 |/
  iwt   r0,#$10A0                           ; $098B35 |\  [sprite_priority_override]
  add   r10                                 ; $098B38 | | r7 = low x coord byte
  ldb   (r0)                                ; $098B39 | | sprite priority override
  to r7                                     ; $098B3B | | -p------ 00000000
  swap                                      ; $098B3C |/
  getb                                      ; $098B3D |\  [sprite_high_size]
  move  r4,r0                               ; $098B3E | | r4 = high table size
  iwt   r9,#$00F1                           ; $098B40 | | extracts ------s-
  and   r9                                  ; $098B43 | | size bit from ROM
  swap                                      ; $098B44 | | and copies it in:
  to r6                                     ; $098B45 | | r6 = yxpp--st tttttttt
  xor   r6                                  ; $098B46 |/
  ibt   r9,#$0000                           ; $098B48 |\  [size_correction]
  from r4                                   ; $098B4A | | test ------s- size bit
  and   #2                                  ; $098B4B | | being on or off
  bne ..store_OAM                           ; $098B4D | | if on, r9 = 0
  nop                                       ; $098B4F | | if off, r9 = 4
  ibt   r9,#$0004                           ; $098B50 |/

..store_OAM
  to r7                                     ; $098B52 |\ [OAM_buffer_word_4]
  xor   r7                                  ; $098B53 |/ r7 = -p------ ------s-
  iwt   r0,#$1640                           ; $098B55 |\
  to r8                                     ; $098B58 | | [size_corrected_X]
  add   r10                                 ; $098B59 | | r4 = OAM X (screen rel)
  ldw   (r8)                                ; $098B5A | | + size_correction
  to r4                                     ; $098B5B | | (0 or 4)
  add   r9                                  ; $098B5C |/
  inc   r8                                  ; $098B5D |\
  inc   r8                                  ; $098B5E | | [size_corrected_Y]
  ldw   (r8)                                ; $098B5F | | r5 = OAM Y (screen rel)
  to r5                                     ; $098B60 | | + size_correction
  add   r9                                  ; $098B61 |/  (0 or 4)
  lms   r8,($0092)                          ; $098B62 |\
  iwt   r0,#$1322                           ; $098B65 | | set sprite's OAM
  add   r10                                 ; $098B68 | | pointer to this entry
  from r8                                   ; $098B69 | | (1322,x)
  stw   (r0)                                ; $098B6A |/
  from r4                                   ; $098B6B |\ store size_corrected_X
  stw   (r8)                                ; $098B6C |/ -> word 1 in OAM buffer entry
  inc   r8                                  ; $098B6D |\
  inc   r8                                  ; $098B6E | | store size_corrected_Y
  from r5                                   ; $098B6F | | -> word 2 in OAM buffer entry
  stw   (r8)                                ; $098B70 |/
  inc   r8                                  ; $098B71 |\  store yxpp--st tttttttt
  inc   r8                                  ; $098B72 | | + OBJ_tile_index
  lms   r0,($0000)                          ; $098B73 | |
  add   r6                                  ; $098B76 | | -> word 3 in OAM buffer entry
  stw   (r8)                                ; $098B77 |/
  inc   r8                                  ; $098B78 |\
  inc   r8                                  ; $098B79 | | store OAM_buffer_word_4
  from r7                                   ; $098B7A | | -> word 4 in OAM buffer entry
  stw   (r8)                                ; $098B7B |/
  inc   r8                                  ; $098B7C |\  update next free slot
  inc   r8                                  ; $098B7D | | which claims the space
  sms   ($0092),r8                          ; $098B7E |/
  iwt   r15,#.next_sprite_draw+1            ; $098B81 |\ next sprite
  inc   r10                                 ; $098B84 |/

.drawing_method_01
  ; sms   (0058),r12
  db $AC, $2C                               ; $098B85 | preserve draw_loop_index
  iwt   r0,#$1320                           ; $098B87 |\
  add   r10                                 ; $098B8A | | r0 = sprite ID * 2
  ldw   (r0)                                ; $098B8B | |
  add   r0                                  ; $098B8C |/
  iwt   r14,#$048A                          ; $098B8D |\  [method_01_pointer]
  to r14                                    ; $098B90 | | r14 = 1A848A + ID*2
  add   r14                                 ; $098B91 |/  address of method 01 sprite info
  iwt   r0,#$1001                           ; $098B92 |\
  add   r10                                 ; $098B95 | | OAM buffer byte count
  ldb   (r0)                                ; $098B96 | | mask off first three bits
  iwt   r8,#$00F8                           ; $098B98 | | (pointlessly, they get shifted
  and   r8                                  ; $098B9B |/  off anyway)

..prep_loop
  lsr                                       ; $098B9C |\  / 8
  lsr                                       ; $098B9D | | # of OAM entries this sprite has
  lsr                                       ; $098B9E | | -> size of method_01_loop
  move  r12,r0                              ; $098B9F |/
  to r8                                     ; $098BA1 |\
  getb                                      ; $098BA2 | | [method_01_data]
  inc   r14                                 ; $098BA3 | | read from method_01_pointer
  umult #5                                  ; $098BA4 | | r14 = word($1A848A,ID)
  umult r9                                  ; $098BA6 | | + entry count * 5 * anim frame
  with r8                                   ; $098BA8 | | sets up ROM address to begin
  getbh                                     ; $098BA9 | | reading for method 01 OAM data
  to r14                                    ; $098BAB | |
  add   r8                                  ; $098BAC |/
  sms   ($0042),r1                          ; $098BAD |\
  sms   ($0044),r2                          ; $098BB0 | | preserve both draw & priority
  sms   ($0054),r10                         ; $098BB3 | | loop registers
  sms   ($005A),r13                         ; $098BB6 |/
  iwt   r0,#.next_sprite_draw               ; $098BB9 |\ sprite_draw_loop
  sms   ($0060),r0                          ; $098BBC |/ continue address
  iwt   r0,#$1002                           ; $098BBF |\
  add   r10                                 ; $098BC2 | | r3 = 1002,x (OAM low)
  to r3                                     ; $098BC3 | | 0000ccc0
  ldb   (r0)                                ; $098BC4 |/  this only gets palette for now
  iwt   r0,#$13C0                           ; $098BC6 |\
  add   r10                                 ; $098BC9 | | [sprite_OAM_low]
  ldb   (r0)                                ; $098BCA | | facing dir to get x/y flip
  add   r0                                  ; $098BCC | | (00000yx0)
  add   r0                                  ; $098BCD | | << 5
  mult  #8                                  ; $098BCE | | to shift as yx00000
  xor   r3                                  ; $098BD0 | | ^ 1002,x swap:
  to r3                                     ; $098BD2 | | r3 = yx--ccc- 00000000
  swap                                      ; $098BD3 |/
  lms   r4,($0092)                          ; $098BD4 |\
  iwt   r0,#$1322                           ; $098BD7 | | set sprite's OAM
  add   r10                                 ; $098BDA | | pointer to this entry
  from r4                                   ; $098BDB | | (1322,x)
  stw   (r0)                                ; $098BDC |/
  iwt   r0,#$10A0                           ; $098BDD |\  [sprite_priority_override]
  add   r10                                 ; $098BE0 | | r13 = low x coord byte
  ldb   (r0)                                ; $098BE1 | | sprite priority override
  to r13                                    ; $098BE3 | | -p------ 00000000
  swap                                      ; $098BE4 |/
  ibt   r0,#$003C                           ; $098BE5 |\
  sub   r10                                 ; $098BE7 | | if sprite slot <= 3C
  bcs ..prep_OAM_coords                     ; $098BE8 | | ambient sprite
  sub   r0                                  ; $098BEA |/
  iwt   r0,#$1D56                           ; $098BEB |\  or if 1D56,x - 1 < 0
  add   r10                                 ; $098BEE | | meaning no collision
  ldw   (r0)                                ; $098BEF | | with other sprites
  dec   r0                                  ; $098BF0 | | then r0 = $FFFF
  bmi ..prep_OAM_coords                     ; $098BF1 |/
  sub   r0                                  ; $098BF3 |\  else r0 = $F1FF
  iwt   r0,#$F200                           ; $098BF4 |/  this is for bitmasking palette

..prep_OAM_coords
  dec   r0                                  ; $098BF7 |\ [palette_bitmask]
  sms   ($004E),r0                          ; $098BF8 |/ -> ($004E)
  iwt   r0,#$1640                           ; $098BFB |\
  add   r10                                 ; $098BFE | | [sprite_OAM_X]
  to r1                                     ; $098BFF | | r1 = OAM x (screen rel)
  ldw   (r0)                                ; $098C00 |/
  inc   r0                                  ; $098C01 |\
  inc   r0                                  ; $098C02 | | [sprite_OAM_Y]
  to r2                                     ; $098C03 | | r2 = OAM y (screen rel)
  ldw   (r0)                                ; $098C04 |/
  move  r10,r13                             ; $098C05 | r10 = sprite_priority_override
  move  r13,r15                             ; $098C07 | begin method_01_loop

; loop through each OAM entry
; of this current animation frame
; of this current sprite
; for drawing method 01
..method_01_loop
  getbs                                     ; $098C09 |\ [draw_offset_X]
  inc   r14                                 ; $098C0B |/ byte 1 from method_01_data
  iwt   r9,#$4000                           ; $098C0C |\
  with r9                                   ; $098C0F | | [size_correction_X]
  and   r3                                  ; $098C10 | | is x flip on?
  beq ..check_Y_flip                        ; $098C11 | | if so, negate draw_offset_X
  nop                                       ; $098C13 | | and set r9 = $0008
  not                                       ; $098C14 | |
  inc   r0                                  ; $098C15 | | else r9 = $0000
  ibt   r9,#$0008                           ; $098C16 |/

..check_Y_flip
  to r5                                     ; $098C18 |\ [spr_OAM_offsetted_X]
  add   r1                                  ; $098C19 |/ r5 = sprite_OAM_X +/- draw_offset_X
  getbs                                     ; $098C1A |\ [draw_offset_Y]
  inc   r14                                 ; $098C1C |/ byte 2 from method_01_data
  ibt   r8,#$0000                           ; $098C1D |\
  moves r3,r3                               ; $098C1F | | [size_correction_Y]
  bpl ..compute_OAM                         ; $098C21 | | is y flip on?
  nop                                       ; $098C23 | | if so, negate draw_offset_Y
  not                                       ; $098C24 | | and set r8 = $0008
  inc   r0                                  ; $098C25 | | else r8 = $0000
  ibt   r8,#$0008                           ; $098C26 |/

..compute_OAM
  to r6                                     ; $098C28 |\ [spr_OAM_offsetted_Y]
  add   r2                                  ; $098C29 |/ r6 = OAM y +/- draw_offset_Y
  getb                                      ; $098C2A |\  [OAM_3_4]
  inc   r14                                 ; $098C2B | | palette & tile # from method_01_data
  lms   r7,($004E)                          ; $098C2C | | & palette_bitmask (keep or not)
  getbh                                     ; $098C2F | | ^ sprite_OAM_low
  inc   r14                                 ; $098C31 | | copies in x/y flip and possibly palette
  and   r7                                  ; $098C32 | | r7 = the full yx--ccct tttttttt
  to r7                                     ; $098C33 | | OAM 3 & 4 bytes
  xor   r3                                  ; $098C34 |/
  getb                                      ; $098C36 |\
  and   #2                                  ; $098C37 | | method_01_data byte 5
  bne ..store_OAM                           ; $098C39 | | is size flag set?
  nop                                       ; $098C3B |/
  with r5                                   ; $098C3C |\
  add   r9                                  ; $098C3D | | if not, do size corrections:
  with r6                                   ; $098C3E | | spr_OAM_offsetted_X += size_correction_X
  add   r8                                  ; $098C3F |/  spr_OAM_offsetted_Y += size_correction_Y

..store_OAM
  getbh                                     ; $098C40 |\ read byte 5 again but just
  inc   r14                                 ; $098C42 |/ for size in high byte
  from r5                                   ; $098C43 |\
  stw   (r4)                                ; $098C44 | | store spr_OAM_offsetted_X
  inc   r4                                  ; $098C45 |/  -> word 1 in OAM buffer entry
  inc   r4                                  ; $098C46 |\  [OAM_buffer_word_4]
  to r5                                     ; $098C47 | | sprite_priority_override ^ size
  xor   r10                                 ; $098C48 |/  r5 = -p----s- 00000000
  from r6                                   ; $098C4A |\
  stw   (r4)                                ; $098C4B | | store spr_OAM_offsetted_Y
  inc   r4                                  ; $098C4C | | -> word 2 in OAM buffer entry
  inc   r4                                  ; $098C4D |/
  lms   r0,($0000)                          ; $098C4E |\  store OAM_3_4
  add   r7                                  ; $098C51 | | + OBJ_tile_index
  stw   (r4)                                ; $098C52 | |
  inc   r4                                  ; $098C53 | | -> word 3 in OAM buffer entry
  inc   r4                                  ; $098C54 |/
  from r5                                   ; $098C55 |\
  stw   (r4)                                ; $098C56 | | store OAM_buffer_word_4
  inc   r4                                  ; $098C57 |/  -> word 4 in OAM buffer entry
  loop                                      ; $098C58 |\ next OAM entry
  inc   r4                                  ; $098C59 |/ end method_01_loop
  sms   ($0092),r4                          ; $098C5A | store next free OAM slot
  lms   r1,($0042)                          ; $098C5D |\
  lms   r2,($0044)                          ; $098C60 | |
  lms   r10,($0054)                         ; $098C63 | | restore registers
  lms   r12,($0058)                         ; $098C66 | | to get back to more sprites!
  lms   r13,($005A)                         ; $098C69 | |
  lms   r15,($0060)                         ; $098C6C | | continue sprite_draw_loop
  nop                                       ; $098C6F |/

; 02 drawing method
; all this really does is allocate
; OAM bytes, based on $1001,x
; probably for sprites that hardcode their own OAM
.drawing_method_02
  ; iwt r0,#1001
  dw $1001                                  ; $098C70 |\
  add   r10                                 ; $098C72 | | OAM buffer byte count
  ldw   (r0)                                ; $098C73 | | mask off first three bits
  iwt   r7,#$00F8                           ; $098C74 | |
  and   r7                                  ; $098C77 |/
  lms   r8,($0092)                          ; $098C78 |\  next OAM free slot
  add   r8                                  ; $098C7B | | allocate this many bytes
  sbk                                       ; $098C7C |/
  iwt   r0,#$1322                           ; $098C7D |\
  add   r10                                 ; $098C80 | | OAM buffer pointer
  from r8                                   ; $098C81 | | -> sprite's 1322,x
  stw   (r0)                                ; $098C82 |/
  iwt   r15,#.next_sprite_draw+1            ; $098C83 |\ go to next sprite
  inc   r10                                 ; $098C86 |/

; 8C83 in code (indexed by 4's, pairs of words)
; x, y thresholds for despawning sprites
.despawn_thresholds
  dw $0060, $0060                           ; $098C87 |
  dw $0090, $0060                           ; $098C8B |
  dw $0090, $00A0                           ; $098C8F |

; 03 drawing method
; this is the same as 01 except
; just adds on 32 more entries
; into the buffer as free OAM
; probably for hardcoded OAM
; mixed with regular OAM
.drawing_method_03
  ; sms   (0058),r12
  db $AC, $2C                               ; $098C93 | preserve outer loop counter
  iwt   r0,#$1320                           ; $098C95 |\
  add   r10                                 ; $098C98 | | sprite ID
  ldw   (r0)                                ; $098C99 | |
  add   r0                                  ; $098C9A | | * 2
  iwt   r14,#$048A                          ; $098C9B | |
  to r14                                    ; $098C9E | | method_01_pointer = 1A848A,ID*2
  add   r14                                 ; $098C9F |/
  iwt   r0,#$1001                           ; $098CA0 |\
  add   r10                                 ; $098CA3 | | OAM buffer byte count
  ldb   (r0)                                ; $098CA4 | | mask off first three bits
  iwt   r8,#$00F8                           ; $098CA6 | |
  and   r8                                  ; $098CA9 |/
  iwt   r8,#$0100                           ; $098CAA |\  finish all the rest in method 01 code
  iwt   r15,#.drawing_method_01_prep_loop   ; $098CAD | | adds 256 to OAM byte count
  add   r8                                  ; $098CB0 |/  giving it 32 more entries of "free" OAM
; end gsu_edge_despawn_draw

; gsu routine
  romb                                      ; $098CB1 |
  iwt   r0,#$1322                           ; $098CB3 |
  add   r10                                 ; $098CB6 |
  ldw   (r0)                                ; $098CB7 |
  moves r4,r0                               ; $098CB8 |
  bpl CODE_098CBF                           ; $098CBA |
  nop                                       ; $098CBC |
  stop                                      ; $098CBD |
  nop                                       ; $098CBE |
;
CODE_098CBF:
  iwt   r0,#$13C2                           ; $098CBF |
  add   r10                                 ; $098CC2 |
  ldb   (r0)                                ; $098CC3 |
  add   r0                                  ; $098CC5 |
  to r14                                    ; $098CC6 |
  add   r14                                 ; $098CC7 |
  getb                                      ; $098CC8 |
  inc   r14                                 ; $098CC9 |
  to r14                                    ; $098CCA |
  getbh                                     ; $098CCB |
  iwt   r0,#$1002                           ; $098CCD |
  add   r10                                 ; $098CD0 |
  to r3                                     ; $098CD1 |
  ldb   (r0)                                ; $098CD2 |
  iwt   r0,#$13C0                           ; $098CD4 |
  add   r10                                 ; $098CD7 |
  ldb   (r0)                                ; $098CD8 |
  add   r0                                  ; $098CDA |
  add   r0                                  ; $098CDB |
  mult  #8                                  ; $098CDC |
  xor   r3                                  ; $098CDE |
  to r3                                     ; $098CE0 |
  swap                                      ; $098CE1 |
  iwt   r0,#$1640                           ; $098CE2 |
  add   r10                                 ; $098CE5 |
  to r1                                     ; $098CE6 |
  ldw   (r0)                                ; $098CE7 |
  inc   r0                                  ; $098CE8 |
  inc   r0                                  ; $098CE9 |
  to r2                                     ; $098CEA |
  ldw   (r0)                                ; $098CEB |
  iwt   r0,#$1140                           ; $098CEC |
  add   r10                                 ; $098CEF |
  ldb   (r0)                                ; $098CF0 |
  mult  #8                                  ; $098CF2 |
  sms   ($0000),r0                          ; $098CF4 |
  iwt   r0,#$1001                           ; $098CF7 |
  add   r10                                 ; $098CFA |
  ldw   (r0)                                ; $098CFB |
  iwt   r8,#$00F8                           ; $098CFC |
  and   r8                                  ; $098CFF |
  lsr                                       ; $098D00 |
  lsr                                       ; $098D01 |
  to r12                                    ; $098D02 |
  lsr                                       ; $098D03 |
  iwt   r0,#$10A0                           ; $098D04 |
  add   r10                                 ; $098D07 |
  ldb   (r0)                                ; $098D08 |
  to r10                                    ; $098D0A |
  swap                                      ; $098D0B |
  cache                                     ; $098D0C |
  move  r13,r15                             ; $098D0D | loop start
  getbs                                     ; $098D0F |
  inc   r14                                 ; $098D11 |
  iwt   r9,#$4000                           ; $098D12 |
  with r9                                   ; $098D15 |
  and   r3                                  ; $098D16 |
  beq CODE_098D1E                           ; $098D17 |
  nop                                       ; $098D19 |
  not                                       ; $098D1A |
  inc   r0                                  ; $098D1B |
  ibt   r9,#$0008                           ; $098D1C |

CODE_098D1E:
  to r5                                     ; $098D1E |
  add   r1                                  ; $098D1F |
  getbs                                     ; $098D20 |
  inc   r14                                 ; $098D22 |
  ibt   r8,#$0000                           ; $098D23 |
  moves r3,r3                               ; $098D25 |
  bpl CODE_098D2E                           ; $098D27 |
  nop                                       ; $098D29 |
  not                                       ; $098D2A |
  inc   r0                                  ; $098D2B |
  ibt   r8,#$0008                           ; $098D2C |

CODE_098D2E:
  to r6                                     ; $098D2E |
  add   r2                                  ; $098D2F |
  getb                                      ; $098D30 |
  inc   r14                                 ; $098D31 |
  getbh                                     ; $098D32 |
  inc   r14                                 ; $098D34 |
  to r7                                     ; $098D35 |
  xor   r3                                  ; $098D36 |
  getb                                      ; $098D38 |
  and   #2                                  ; $098D39 |
  bne CODE_098D42                           ; $098D3B |
  nop                                       ; $098D3D |
  with r5                                   ; $098D3E |
  add   r9                                  ; $098D3F |
  with r6                                   ; $098D40 |
  add   r8                                  ; $098D41 |

CODE_098D42:
  getbh                                     ; $098D42 |
  inc   r14                                 ; $098D44 |
  from r5                                   ; $098D45 |
  stw   (r4)                                ; $098D46 |
  inc   r4                                  ; $098D47 |
  inc   r4                                  ; $098D48 |
  to r5                                     ; $098D49 |
  xor   r10                                 ; $098D4A |
  from r6                                   ; $098D4C |
  stw   (r4)                                ; $098D4D |
  inc   r4                                  ; $098D4E |
  inc   r4                                  ; $098D4F |
  lms   r0,($0000)                          ; $098D50 |
  add   r7                                  ; $098D53 |
  stw   (r4)                                ; $098D54 |
  inc   r4                                  ; $098D55 |
  inc   r4                                  ; $098D56 |
  from r5                                   ; $098D57 |
  stw   (r4)                                ; $098D58 |
  inc   r4                                  ; $098D59 |
  loop                                      ; $098D5A |
  inc   r4                                  ; $098D5B |
  stop                                      ; $098D5C |
  nop                                       ; $098D5D |

  ibt   r12,#$0018                          ; $098D5E |
  lms   r2,($0000)                          ; $098D60 |
  from r2                                   ; $098D63 |
  lsr                                       ; $098D64 |
  lsr                                       ; $098D65 |
  from r12                                  ; $098D66 |
  to r1                                     ; $098D67 |
  sub   r0                                  ; $098D68 |
  iwt   r4,#$1CD6                           ; $098D69 |
  from r2                                   ; $098D6C |
  add   r4                                  ; $098D6D |
  to r2                                     ; $098D6E |
  ldw   (r0)                                ; $098D6F |
  add   #2                                  ; $098D70 |
  to r3                                     ; $098D72 |
  ldw   (r0)                                ; $098D73 |
  iwt   r5,#$0F00                           ; $098D74 |
  ibt   r6,#$0010                           ; $098D77 |
  iwt   r7,#$0FA2                           ; $098D79 |
  iwt   r8,#$6000                           ; $098D7C |
  ibt   r9,#$FFFF                           ; $098D7F |
  sms   ($0000),r9                          ; $098D81 |
  cache                                     ; $098D84 |
  iwt   r13,#$8D89                          ; $098D85 |
  from r1                                   ; $098D88 |
  sub   r12                                 ; $098D89 |
  beq CODE_098DBF                           ; $098D8A |
  nop                                       ; $098D8C |
  ldb   (r5)                                ; $098D8D |
  sub   r6                                  ; $098D8F |
  bne CODE_098DBF                           ; $098D90 |
  nop                                       ; $098D92 |
  ldw   (r7)                                ; $098D93 |
  and   r8                                  ; $098D94 |
  bne CODE_098DBF                           ; $098D95 |
  nop                                       ; $098D97 |
  ldw   (r4)                                ; $098D98 |
  sub   r2                                  ; $098D99 |
  move  r11,r0                              ; $098D9A |
  bpl CODE_098DA1                           ; $098D9C |
  nop                                       ; $098D9E |
  not                                       ; $098D9F |
  inc   r0                                  ; $098DA0 |

CODE_098DA1:
  move  r10,r0                              ; $098DA1 |
  from r4                                   ; $098DA3 |
  add   #2                                  ; $098DA4 |
  ldw   (r0)                                ; $098DA6 |
  sub   r3                                  ; $098DA7 |
  move  r14,r0                              ; $098DA8 |
  bpl CODE_098DAF                           ; $098DAA |
  nop                                       ; $098DAC |
  not                                       ; $098DAD |
  inc   r0                                  ; $098DAE |

CODE_098DAF:
  add   r10                                 ; $098DAF |
  sub   r9                                  ; $098DB0 |
  bcs CODE_098DBF                           ; $098DB1 |
  add   r9                                  ; $098DB3 |
  move  r9,r0                               ; $098DB4 |
  sms   ($0000),r12                         ; $098DB6 |
  sms   ($0002),r11                         ; $098DB9 |
  sms   ($0004),r14                         ; $098DBC |

CODE_098DBF:
  ibt   r0,#$0004                           ; $098DBF |
  to r5                                     ; $098DC1 |
  add   r5                                  ; $098DC2 |
  to r7                                     ; $098DC3 |
  add   r7                                  ; $098DC4 |
  to r4                                     ; $098DC5 |
  add   r4                                  ; $098DC6 |
  loop                                      ; $098DC7 |
  from r1                                   ; $098DC8 |
  lms   r1,($0000)                          ; $098DC9 |
  inc   r1                                  ; $098DCC |
  beq CODE_098DD8                           ; $098DCD |
  dec   r1                                  ; $098DCF |
  ibt   r0,#$0018                           ; $098DD0 |
  sub   r1                                  ; $098DD2 |
  add   r0                                  ; $098DD3 |
  add   r0                                  ; $098DD4 |
  sms   ($0000),r0                          ; $098DD5 |

CODE_098DD8:
  stop                                      ; $098DD8 |
  nop                                       ; $098DD9 |

  iwt   r2,#$0F00                           ; $098DDA |
  iwt   r3,#$1CD6                           ; $098DDD |
  iwt   r4,#$1CD8                           ; $098DE0 |
  iwt   r5,#$0FA2                           ; $098DE3 |
  from r3                                   ; $098DE6 |
  add   r1                                  ; $098DE7 |
  to r6                                     ; $098DE8 |
  ldw   (r0)                                ; $098DE9 |
  from r4                                   ; $098DEA |
  add   r1                                  ; $098DEB |
  to r7                                     ; $098DEC |
  ldw   (r0)                                ; $098DED |
  ibt   r8,#$FFFF                           ; $098DEE |
  move  r9,r8                               ; $098DF0 |
  iwt   r11,#$6000                          ; $098DF2 |
  from r1                                   ; $098DF5 |
  lsr                                       ; $098DF6 |
  lsr                                       ; $098DF7 |
  ibt   r12,#$0018                          ; $098DF8 |
  from r12                                  ; $098DFA |
  to r1                                     ; $098DFB |
  sub   r0                                  ; $098DFC |
  cache                                     ; $098DFD |
  move  r13,r15                             ; $098DFE |
  from r12                                  ; $098E00 |
  sub   r1                                  ; $098E01 |
  beq CODE_098E2B                           ; $098E02 |
  nop                                       ; $098E04 |
  ldb   (r2)                                ; $098E05 |
  sub   #14                                 ; $098E07 |
  bcc CODE_098E2B                           ; $098E09 |
  nop                                       ; $098E0B |
  ldw   (r5)                                ; $098E0C |
  and   r11                                 ; $098E0D |
  sub   r11                                 ; $098E0E |
  bne CODE_098E2B                           ; $098E0F |
  nop                                       ; $098E11 |
  ldw   (r3)                                ; $098E12 |
  sub   r6                                  ; $098E13 |
  bpl CODE_098E19                           ; $098E14 |
  nop                                       ; $098E16 |
  not                                       ; $098E17 |
  inc   r0                                  ; $098E18 |

CODE_098E19:
  move  r10,r0                              ; $098E19 |
  ldw   (r4)                                ; $098E1B |
  sub   r7                                  ; $098E1C |
  bpl CODE_098E22                           ; $098E1D |
  nop                                       ; $098E1F |
  not                                       ; $098E20 |
  inc   r0                                  ; $098E21 |

CODE_098E22:
  add   r10                                 ; $098E22 |
  sub   r8                                  ; $098E23 |
  bcs CODE_098E2B                           ; $098E24 |
  add   r8                                  ; $098E26 |
  move  r8,r0                               ; $098E27 |
  move  r9,r12                              ; $098E29 |

CODE_098E2B:
  ibt   r0,#$0004                           ; $098E2B |
  to r2                                     ; $098E2D |
  add   r2                                  ; $098E2E |
  to r3                                     ; $098E2F |
  add   r3                                  ; $098E30 |
  to r4                                     ; $098E31 |
  add   r4                                  ; $098E32 |
  to r5                                     ; $098E33 |
  add   r5                                  ; $098E34 |
  loop                                      ; $098E35 |
  from r12                                  ; $098E36 |
  moves r1,r9                               ; $098E37 |
  bmi CODE_098E42                           ; $098E39 |
  nop                                       ; $098E3B |
  ibt   r0,#$0018                           ; $098E3C |
  sub   r9                                  ; $098E3E |
  add   r0                                  ; $098E3F |
  to r1                                     ; $098E40 |
  add   r0                                  ; $098E41 |

CODE_098E42:
  stop                                      ; $098E42 |
  nop                                       ; $098E43 |

  iwt   r14,#$00A1                          ; $098E44 |
  iwt   r2,#$0F00                           ; $098E47 |
  iwt   r3,#$1CD6                           ; $098E4A |
  iwt   r4,#$1CD8                           ; $098E4D |
  iwt   r5,#$1360                           ; $098E50 |
  iwt   r11,#$1A38                          ; $098E53 |
  from r3                                   ; $098E56 |
  add   r1                                  ; $098E57 |
  to r6                                     ; $098E58 |
  ldw   (r0)                                ; $098E59 |
  from r4                                   ; $098E5A |
  add   r1                                  ; $098E5B |
  to r7                                     ; $098E5C |
  ldw   (r0)                                ; $098E5D |
  ibt   r8,#$FFFF                           ; $098E5E |
  move  r9,r8                               ; $098E60 |
  from r1                                   ; $098E62 |
  lsr                                       ; $098E63 |
  lsr                                       ; $098E64 |
  ibt   r12,#$0018                          ; $098E65 |
  from r12                                  ; $098E67 |
  to r1                                     ; $098E68 |
  sub   r0                                  ; $098E69 |
  cache                                     ; $098E6A |
  move  r13,r15                             ; $098E6B |
  from r12                                  ; $098E6D |
  sub   r1                                  ; $098E6E |
  beq CODE_098EA4                           ; $098E6F |
  nop                                       ; $098E71 |
  ldb   (r2)                                ; $098E72 |
  sub   #8                                  ; $098E74 |
  beq CODE_098E7E                           ; $098E76 |
  nop                                       ; $098E78 |
  sub   #7                                  ; $098E79 |
  bmi CODE_098EA4                           ; $098E7B |
  nop                                       ; $098E7D |

CODE_098E7E:
  ldw   (r5)                                ; $098E7E |
  cmp   r14                                 ; $098E7F |
  bne CODE_098EA4                           ; $098E81 |
  nop                                       ; $098E83 |
  ldb   (r11)                               ; $098E84 |
  moves r0,r0                               ; $098E86 |
  bne CODE_098EA4                           ; $098E88 |
  nop                                       ; $098E8A |
  ldw   (r3)                                ; $098E8B |
  sub   r6                                  ; $098E8C |
  bpl CODE_098E92                           ; $098E8D |
  nop                                       ; $098E8F |
  not                                       ; $098E90 |
  inc   r0                                  ; $098E91 |

CODE_098E92:
  move  r10,r0                              ; $098E92 |
  ldw   (r4)                                ; $098E94 |
  sub   r7                                  ; $098E95 |
  bpl CODE_098E9B                           ; $098E96 |
  nop                                       ; $098E98 |
  not                                       ; $098E99 |
  inc   r0                                  ; $098E9A |

CODE_098E9B:
  add   r10                                 ; $098E9B |
  sub   r8                                  ; $098E9C |
  bcs CODE_098EA4                           ; $098E9D |
  add   r8                                  ; $098E9F |
  move  r8,r0                               ; $098EA0 |
  move  r9,r12                              ; $098EA2 |

CODE_098EA4:
  ibt   r0,#$0004                           ; $098EA4 |
  to r2                                     ; $098EA6 |
  add   r2                                  ; $098EA7 |
  to r3                                     ; $098EA8 |
  add   r3                                  ; $098EA9 |
  to r4                                     ; $098EAA |
  add   r4                                  ; $098EAB |
  to r5                                     ; $098EAC |
  add   r5                                  ; $098EAD |
  to r11                                    ; $098EAE |
  add   r11                                 ; $098EAF |
  loop                                      ; $098EB0 |
  from r12                                  ; $098EB1 |
  moves r1,r9                               ; $098EB2 |
  bmi CODE_098EBD                           ; $098EB4 |
  nop                                       ; $098EB6 |
  ibt   r0,#$0018                           ; $098EB7 |
  sub   r9                                  ; $098EB9 |
  add   r0                                  ; $098EBA |
  to r1                                     ; $098EBB |
  add   r0                                  ; $098EBC |

CODE_098EBD:
  stop                                      ; $098EBD |
  nop                                       ; $098EBE |
  move  r11,r14                             ; $098EBF |
  inc   r11                                 ; $098EC1 |
  iwt   r2,#$0F00                           ; $098EC2 |
  iwt   r3,#$1CD6                           ; $098EC5 |
  iwt   r4,#$1CD8                           ; $098EC8 |
  iwt   r5,#$1360                           ; $098ECB |
  from r3                                   ; $098ECE |
  add   r1                                  ; $098ECF |
  to r6                                     ; $098ED0 |
  ldw   (r0)                                ; $098ED1 |
  from r4                                   ; $098ED2 |
  add   r1                                  ; $098ED3 |
  to r7                                     ; $098ED4 |
  ldw   (r0)                                ; $098ED5 |
  ibt   r8,#$FFFF                           ; $098ED6 |
  move  r9,r8                               ; $098ED8 |
  from r1                                   ; $098EDA |
  lsr                                       ; $098EDB |
  lsr                                       ; $098EDC |
  ibt   r12,#$0018                          ; $098EDD |
  from r12                                  ; $098EDF |
  to r1                                     ; $098EE0 |
  sub   r0                                  ; $098EE1 |
  cache                                     ; $098EE2 |
  move  r13,r15                             ; $098EE3 |
  from r12                                  ; $098EE5 |
  sub   r1                                  ; $098EE6 |
  beq CODE_098F1A                           ; $098EE7 |
  nop                                       ; $098EE9 |
  ldb   (r2)                                ; $098EEA |
  sub   #8                                  ; $098EEC |
  beq CODE_098EF6                           ; $098EEE |
  nop                                       ; $098EF0 |
  sub   #7                                  ; $098EF1 |
  bmi CODE_098F1A                           ; $098EF3 |
  nop                                       ; $098EF5 |

CODE_098EF6:
  ldw   (r5)                                ; $098EF6 |
  cmp   r14                                 ; $098EF7 |
  bmi CODE_098F1A                           ; $098EF9 |
  nop                                       ; $098EFB |
  cmp   r11                                 ; $098EFC |
  bpl CODE_098F1A                           ; $098EFE |
  nop                                       ; $098F00 |
  ldw   (r3)                                ; $098F01 |
  sub   r6                                  ; $098F02 |
  bpl CODE_098F08                           ; $098F03 |
  nop                                       ; $098F05 |
  not                                       ; $098F06 |
  inc   r0                                  ; $098F07 |

CODE_098F08:
  move  r10,r0                              ; $098F08 |
  ldw   (r4)                                ; $098F0A |
  sub   r7                                  ; $098F0B |
  bpl CODE_098F11                           ; $098F0C |
  nop                                       ; $098F0E |
  not                                       ; $098F0F |
  inc   r0                                  ; $098F10 |

CODE_098F11:
  add   r10                                 ; $098F11 |
  sub   r8                                  ; $098F12 |
  bcs CODE_098F1A                           ; $098F13 |
  add   r8                                  ; $098F15 |
  move  r8,r0                               ; $098F16 |
  move  r9,r12                              ; $098F18 |

CODE_098F1A:
  ibt   r0,#$0004                           ; $098F1A |
  to r2                                     ; $098F1C |
  add   r2                                  ; $098F1D |
  to r3                                     ; $098F1E |
  add   r3                                  ; $098F1F |
  to r4                                     ; $098F20 |
  add   r4                                  ; $098F21 |
  to r5                                     ; $098F22 |
  add   r5                                  ; $098F23 |
  loop                                      ; $098F24 |
  from r12                                  ; $098F25 |
  moves r1,r9                               ; $098F26 |
  bmi CODE_098F31                           ; $098F28 |
  nop                                       ; $098F2A |
  ibt   r0,#$0018                           ; $098F2B |
  sub   r9                                  ; $098F2D |
  add   r0                                  ; $098F2E |
  to r1                                     ; $098F2F |
  add   r0                                  ; $098F30 |

CODE_098F31:
  stop                                      ; $098F31 |
  nop                                       ; $098F32 |

  iwt   r2,#$0F00                           ; $098F33 |
  iwt   r3,#$1CD6                           ; $098F36 |
  iwt   r4,#$1CD8                           ; $098F39 |
  iwt   r5,#$1D38                           ; $098F3C |
  from r3                                   ; $098F3F |
  add   r1                                  ; $098F40 |
  to r6                                     ; $098F41 |
  ldw   (r0)                                ; $098F42 |
  from r4                                   ; $098F43 |
  add   r1                                  ; $098F44 |
  to r7                                     ; $098F45 |
  ldw   (r0)                                ; $098F46 |
  ibt   r8,#$FFFF                           ; $098F47 |
  move  r9,r8                               ; $098F49 |
  from r1                                   ; $098F4B |
  lsr                                       ; $098F4C |
  lsr                                       ; $098F4D |
  ibt   r12,#$0018                          ; $098F4E |
  from r12                                  ; $098F50 |
  to r1                                     ; $098F51 |
  sub   r0                                  ; $098F52 |
  cache                                     ; $098F53 |
  dec   r12                                 ; $098F54 |
  move  r13,r15                             ; $098F55 |
  ibt   r0,#$0004                           ; $098F57 |
  to r2                                     ; $098F59 |
  add   r2                                  ; $098F5A |
  to r3                                     ; $098F5B |
  add   r3                                  ; $098F5C |
  to r4                                     ; $098F5D |
  add   r4                                  ; $098F5E |
  to r5                                     ; $098F5F |
  add   r5                                  ; $098F60 |
  from r12                                  ; $098F61 |
  sub   r1                                  ; $098F62 |
  beq CODE_098F8D                           ; $098F63 |
  nop                                       ; $098F65 |
  ldb   (r2)                                ; $098F66 |
  sub   #14                                 ; $098F68 |
  bcc CODE_098F8D                           ; $098F6A |
  nop                                       ; $098F6C |
  ldw   (r5)                                ; $098F6D |
  sub   #0                                  ; $098F6E |
  beq CODE_098F8D                           ; $098F70 |
  nop                                       ; $098F72 |
  ldw   (r3)                                ; $098F73 |
  sub   r6                                  ; $098F74 |
  bpl CODE_098F7A                           ; $098F75 |
  nop                                       ; $098F77 |
  not                                       ; $098F78 |
  inc   r0                                  ; $098F79 |

CODE_098F7A:
  move  r10,r0                              ; $098F7A |
  ldw   (r4)                                ; $098F7C |
  sub   r7                                  ; $098F7D |
  bpl CODE_098F83                           ; $098F7E |
  nop                                       ; $098F80 |
  not                                       ; $098F81 |
  inc   r0                                  ; $098F82 |

CODE_098F83:
  add   r10                                 ; $098F83 |
  cmp   r8                                  ; $098F84 |
  bcs CODE_098F8D                           ; $098F86 |
  nop                                       ; $098F88 |
  move  r8,r0                               ; $098F89 |
  move  r9,r12                              ; $098F8B |

CODE_098F8D:
  loop                                      ; $098F8D |
  from r12                                  ; $098F8E |
  moves r1,r9                               ; $098F8F |
  bmi CODE_098F9A                           ; $098F91 |
  nop                                       ; $098F93 |
  ibt   r0,#$0018                           ; $098F94 |
  sub   r9                                  ; $098F96 |
  add   r0                                  ; $098F97 |
  to r1                                     ; $098F98 |
  add   r0                                  ; $098F99 |

CODE_098F9A:
  stop                                      ; $098F9A |
  nop                                       ; $098F9B |

  iwt   r9,#$0F5C                           ; $098F9C |
  iwt   r10,#$0FFF                          ; $098F9F |
  iwt   r11,#$1D32                          ; $098FA2 |
  iwt   r8,#$1C12                           ; $098FA5 |
  ibt   r2,#$0004                           ; $098FA8 |
  ibt   r14,#$005C                          ; $098FAA |
  from r14                                  ; $098FAC |
  to r7                                     ; $098FAD |
  sub   r1                                  ; $098FAE |
  from r11                                  ; $098FAF |
  sub   r7                                  ; $098FB0 |
  to r3                                     ; $098FB1 |
  ldw   (r0)                                ; $098FB2 |
  add   #2                                  ; $098FB3 |
  to r4                                     ; $098FB5 |
  ldw   (r0)                                ; $098FB6 |
  from r8                                   ; $098FB7 |
  sub   r7                                  ; $098FB8 |
  to r5                                     ; $098FB9 |
  ldw   (r0)                                ; $098FBA |
  add   #2                                  ; $098FBB |
  to r6                                     ; $098FBD |
  ldw   (r0)                                ; $098FBE |
  ibt   r12,#$0018                          ; $098FBF |
  cache                                     ; $098FC1 |
  move  r13,r15                             ; $098FC2 |
  from r14                                  ; $098FC4 |
  sub   r1                                  ; $098FC5 |
  beq CODE_099003                           ; $098FC6 |
  nop                                       ; $098FC8 |
  ldb   (r9)                                ; $098FC9 |
  sub   #14                                 ; $098FCB |
  bcc CODE_099003                           ; $098FCD |
  nop                                       ; $098FCF |
  ldb   (r10)                               ; $098FD0 |
  and   #8                                  ; $098FD2 |
  beq CODE_099003                           ; $098FD4 |
  to r7                                     ; $098FD6 |
  ldw   (r8)                                ; $098FD7 |
  ldw   (r11)                               ; $098FD8 |
  sub   r3                                  ; $098FD9 |
  sms   ($0000),r8                          ; $098FDA |
  add   r5                                  ; $098FDD |
  add   r7                                  ; $098FDE |
  bmi CODE_099003                           ; $098FDF |
  sub   r7                                  ; $098FE1 |
  sub   r7                                  ; $098FE2 |
  sub   r5                                  ; $098FE3 |
  sub   r5                                  ; $098FE4 |
  bpl CODE_099002                           ; $098FE5 |
  inc   r11                                 ; $098FE7 |
  inc   r11                                 ; $098FE8 |
  inc   r8                                  ; $098FE9 |
  inc   r8                                  ; $098FEA |
  to r7                                     ; $098FEB |
  ldw   (r8)                                ; $098FEC |
  ldw   (r11)                               ; $098FED |
  sub   r4                                  ; $098FEE |
  sms   ($0002),r0                          ; $098FEF |
  add   r6                                  ; $098FF2 |
  add   r7                                  ; $098FF3 |
  bmi CODE_098FFF                           ; $098FF4 |
  sub   r7                                  ; $098FF6 |
  sub   r7                                  ; $098FF7 |
  sub   r6                                  ; $098FF8 |
  sub   r6                                  ; $098FF9 |
  bpl CODE_098FFF                           ; $098FFA |
  nop                                       ; $098FFC |
  stop                                      ; $098FFD |
  nop                                       ; $098FFE |

CODE_098FFF:
  dec   r8                                  ; $098FFF |
  dec   r8                                  ; $099000 |
  dec   r11                                 ; $099001 |

CODE_099002:
  dec   r11                                 ; $099002 |

CODE_099003:
  with r11                                  ; $099003 |
  sub   r2                                  ; $099004 |
  with r8                                   ; $099005 |
  sub   r2                                  ; $099006 |
  with r9                                   ; $099007 |
  sub   r2                                  ; $099008 |
  with r10                                  ; $099009 |
  sub   r2                                  ; $09900A |
  with r14                                  ; $09900B |
  sub   r2                                  ; $09900C |
  loop                                      ; $09900D |
  from r14                                  ; $09900E |
  stop                                      ; $09900F |
  nop                                       ; $099010 |

  iwt   r9,#$0F5C                           ; $099011 |
  iwt   r11,#$1D32                          ; $099014 |
  iwt   r8,#$1C12                           ; $099017 |
  ibt   r2,#$0004                           ; $09901A |
  ibt   r14,#$005C                          ; $09901C |
  from r14                                  ; $09901E |
  to r7                                     ; $09901F |
  sub   r1                                  ; $099020 |
  from r11                                  ; $099021 |
  sub   r7                                  ; $099022 |
  to r3                                     ; $099023 |
  ldw   (r0)                                ; $099024 |
  add   #2                                  ; $099025 |
  to r4                                     ; $099027 |
  ldw   (r0)                                ; $099028 |
  from r8                                   ; $099029 |
  sub   r7                                  ; $09902A |
  to r5                                     ; $09902B |
  ldw   (r0)                                ; $09902C |
  add   #2                                  ; $09902D |
  to r6                                     ; $09902F |
  ldw   (r0)                                ; $099030 |
  ibt   r12,#$0018                          ; $099031 |
  cache                                     ; $099033 |
  move  r13,r15                             ; $099034 |
  from r14                                  ; $099036 |
  sub   r1                                  ; $099037 |
  beq CODE_099070                           ; $099038 |
  nop                                       ; $09903A |
  ldb   (r9)                                ; $09903B |
  sub   #14                                 ; $09903D |
  bcc CODE_099070                           ; $09903F |
  to r7                                     ; $099041 |
  ldw   (r8)                                ; $099042 |
  from r7                                   ; $099043 |
  add   r5                                  ; $099044 |
  to r10                                    ; $099045 |
  add   r0                                  ; $099046 |
  inc   r10                                 ; $099047 |
  ldw   (r11)                               ; $099048 |
  sub   r3                                  ; $099049 |
  sms   ($0000),r0                          ; $09904A |
  add   r5                                  ; $09904D |
  add   r7                                  ; $09904E |
  cmp   r10                                 ; $09904F |
  bcs CODE_09906F                           ; $099051 |
  inc   r11                                 ; $099053 |
  inc   r11                                 ; $099054 |
  inc   r8                                  ; $099055 |
  inc   r8                                  ; $099056 |
  to r7                                     ; $099057 |
  ldw   (r8)                                ; $099058 |
  from r7                                   ; $099059 |
  add   r6                                  ; $09905A |
  to r10                                    ; $09905B |
  add   r0                                  ; $09905C |
  inc   r10                                 ; $09905D |
  ldw   (r11)                               ; $09905E |
  sub   r4                                  ; $09905F |
  sms   ($0002),r0                          ; $099060 |
  add   r6                                  ; $099063 |
  add   r7                                  ; $099064 |
  cmp   r10                                 ; $099065 |
  bcs CODE_09906C                           ; $099067 |
  nop                                       ; $099069 |
  stop                                      ; $09906A |
  nop                                       ; $09906B |

CODE_09906C:
  dec   r8                                  ; $09906C |
  dec   r8                                  ; $09906D |
  dec   r11                                 ; $09906E |

CODE_09906F:
  dec   r11                                 ; $09906F |

CODE_099070:
  with r11                                  ; $099070 |
  sub   r2                                  ; $099071 |
  with r8                                   ; $099072 |
  sub   r2                                  ; $099073 |
  with r9                                   ; $099074 |
  sub   r2                                  ; $099075 |
  with r14                                  ; $099076 |
  sub   r2                                  ; $099077 |
  loop                                      ; $099078 |
  from r14                                  ; $099079 |
  stop                                      ; $09907A |
  nop                                       ; $09907B |

  from r1                                   ; $09907C |
  sub   r3                                  ; $09907D |
  move  r5,r0                               ; $09907E |
  bpl CODE_099085                           ; $099080 |
  nop                                       ; $099082 |
  not                                       ; $099083 |
  inc   r0                                  ; $099084 |

CODE_099085:
  move  r7,r0                               ; $099085 |
  from r2                                   ; $099087 |
  sub   r4                                  ; $099088 |
  move  r8,r0                               ; $099089 |
  bpl CODE_099090                           ; $09908B |
  nop                                       ; $09908D |
  not                                       ; $09908E |
  inc   r0                                  ; $09908F |

CODE_099090:
  move  r9,r0                               ; $099090 |
  sub   r7                                  ; $099092 |
  bcs CODE_09909C                           ; $099093 |
  ror                                       ; $099095 |
  move  r0,r7                               ; $099096 |
  move  r7,r9                               ; $099098 |
  move  r9,r0                               ; $09909A |

CODE_09909C:
  move  r10,r0                              ; $09909C |
  with r7                                   ; $09909E |
  lmult                                     ; $09909F |
  sub   r0                                  ; $0990A1 |
  move  r2,r0                               ; $0990A2 |
  ibt   r12,#$0020                          ; $0990A4 |
  iwt   r13,#$90AB                          ; $0990A6 |
  cache                                     ; $0990A9 |
  with r2                                   ; $0990AA |
  add   r2                                  ; $0990AB |
  with r4                                   ; $0990AC |
  add   r4                                  ; $0990AD |
  with r7                                   ; $0990AE |
  rol                                       ; $0990AF |
  rol                                       ; $0990B0 |
  sub   r9                                  ; $0990B1 |
  bcc CODE_0990B7                           ; $0990B2 |
  add   r9                                  ; $0990B4 |
  sub   r9                                  ; $0990B5 |
  inc   r2                                  ; $0990B6 |

CODE_0990B7:
  loop                                      ; $0990B7 |
  with r2                                   ; $0990B8 |
  moves r10,r10                             ; $0990B9 |
  bpl CODE_0990C4                           ; $0990BB |
  nop                                       ; $0990BD |
  move  r0,r6                               ; $0990BE |
  move  r6,r2                               ; $0990C0 |
  move  r2,r0                               ; $0990C2 |

CODE_0990C4:
  move  r1,r6                               ; $0990C4 |
  moves r5,r5                               ; $0990C6 |
  bpl CODE_0990CD                           ; $0990C8 |
  with r1                                   ; $0990CA |
  not                                       ; $0990CB |
  inc   r1                                  ; $0990CC |

CODE_0990CD:
  moves r8,r8                               ; $0990CD |
  bpl CODE_0990D4                           ; $0990CF |
  with r2                                   ; $0990D1 |
  not                                       ; $0990D2 |
  inc   r2                                  ; $0990D3 |

CODE_0990D4:
  stop                                      ; $0990D4 |
  nop                                       ; $0990D5 |

  ibt   r0,#$0008                           ; $0990D6 |
  romb                                      ; $0990D8 |
  ibt   r2,#$0006                           ; $0990DA |
  ibt   r9,#$0055                           ; $0990DC |
  ibt   r10,#$0040                          ; $0990DE |
  iwt   r11,#$AE18                          ; $0990E0 |
  from r11                                  ; $0990E3 |
  to r14                                    ; $0990E4 |
  add   r7                                  ; $0990E5 |
  cache                                     ; $0990E6 |
  iwt   r12,#$0003                          ; $0990E7 |
  iwt   r13,#$90EE                          ; $0990EA |
  getb                                      ; $0990ED |
  with r14                                  ; $0990EE |
  add   r10                                 ; $0990EF |
  mult  r8                                  ; $0990F0 |
  hib                                       ; $0990F1 |
  sex                                       ; $0990F2 |
  dec   r6                                  ; $0990F3 |
  bmi CODE_0990F9                           ; $0990F4 |
  inc   r6                                  ; $0990F6 |
  not                                       ; $0990F7 |
  inc   r0                                  ; $0990F8 |

CODE_0990F9:
  add   r4                                  ; $0990F9 |
  stw   (r1)                                ; $0990FA |
  inc   r1                                  ; $0990FB |
  inc   r1                                  ; $0990FC |
  getb                                      ; $0990FD |
  with r7                                   ; $0990FE |
  add   r9                                  ; $0990FF |
  with r7                                   ; $099100 |
  lob                                       ; $099101 |
  from r11                                  ; $099102 |
  to r14                                    ; $099103 |
  add   r7                                  ; $099104 |
  mult  r8                                  ; $099105 |
  hib                                       ; $099106 |
  sex                                       ; $099107 |
  add   r5                                  ; $099108 |
  stw   (r1)                                ; $099109 |
  with r1                                   ; $09910A |
  add   r2                                  ; $09910B |
  loop                                      ; $09910C |
  getb                                      ; $09910D |
  stop                                      ; $09910E |
  nop                                       ; $09910F |

  db $22, $2A, $2C, $2E, $24, $00, $00, $26 ; $099110 |
  db $00, $00, $28, $00, $00, $00, $02, $04 ; $099118 |
  db $0C, $0E, $20, $06, $08, $0A           ; $099120 |

  ibt r7,#$0010                             ; $099126 |
  from r4                                   ; $099128 |
  sub   r7                                  ; $099129 |
  lsr                                       ; $09912A |
  with r2                                   ; $09912B |
  sub   r0                                  ; $09912C |
  from r5                                   ; $09912D |
  sub   r7                                  ; $09912E |
  lsr                                       ; $09912F |
  with r3                                   ; $099130 |
  sub   r0                                  ; $099131 |
  ibt   r0,#$0009                           ; $099132 |
  romb                                      ; $099134 |
  from r5                                   ; $099136 |
  sub   r7                                  ; $099137 |
  bne CODE_09914A                           ; $099138 |
  from r4                                   ; $09913A |
  sub   r7                                  ; $09913B |
  bne CODE_099144+1                         ; $09913C |
  iwt   r14,#$9110                          ; $09913E |
  bra CODE_099156                           ; $099141 |
  nop                                       ; $099143 |

CODE_099144:
  iwt   r14,#$9111                          ; $099144 |
  bra CODE_099156                           ; $099147 |
  nop                                       ; $099149 |

CODE_09914A:
  sub   r7                                  ; $09914A |
  bne CODE_099153+1                         ; $09914B |
  iwt   r14,#$9114                          ; $09914D |
  bra CODE_099156                           ; $099150 |
  nop                                       ; $099152 |

CODE_099153:
  iwt   r14,#$911D                          ; $099153 |

CODE_099156:
  ibt   r9,#$0002                           ; $099156 |
  iwt   r13,#$8000                          ; $099158 |
  cache                                     ; $09915B |
  link  #4                                  ; $09915C |
  iwt   r15,#$9188                          ; $09915D |
  nop                                       ; $099160 |
  with r5                                   ; $099161 |
  sub   r7                                  ; $099162 |
  beq CODE_099186                           ; $099163 |
  nop                                       ; $099165 |
  with r3                                   ; $099166 |

CODE_099167:
  add   r7                                  ; $099167 |
  with r5                                   ; $099168 |
  sub   r7                                  ; $099169 |
  beq CODE_09917B                           ; $09916A |
  nop                                       ; $09916C |
  link  #4                                  ; $09916D |
  iwt   r15,#$9188                          ; $09916E |
  nop                                       ; $099171 |
  with r14                                  ; $099172 |
  sub   #3                                  ; $099173 |
  with r6                                   ; $099175 |
  xor   r13                                 ; $099176 |
  bra CODE_099167                           ; $099178 |

  with r3                                   ; $09917A |

CODE_09917B:
  with r14                                  ; $09917B |
  add   #3                                  ; $09917C |
  with r6                                   ; $09917E |
  bic   r13                                 ; $09917F |
  link  #4                                  ; $099181 |
  iwt   r15,#$9188                          ; $099182 |
  nop                                       ; $099185 |

CODE_099186:
  stop                                      ; $099186 |
  nop                                       ; $099187 |

  move  r8,r2                               ; $099188 |
  move  r10,r4                              ; $09918A |
  from r8                                   ; $09918C |
  stw   (r1)                                ; $09918D |
  inc   r1                                  ; $09918E |
  inc   r1                                  ; $09918F |
  from r3                                   ; $099190 |
  stw   (r1)                                ; $099191 |
  inc   r1                                  ; $099192 |
  inc   r1                                  ; $099193 |
  getb                                      ; $099194 |
  inc   r14                                 ; $099195 |
  add   r6                                  ; $099196 |
  stw   (r1)                                ; $099197 |
  inc   r1                                  ; $099198 |
  inc   r1                                  ; $099199 |
  from r9                                   ; $09919A |
  stw   (r1)                                ; $09919B |
  with r10                                  ; $09919C |
  sub   r7                                  ; $09919D |
  beq CODE_0991D1                           ; $09919E |
  inc   r1                                  ; $0991A0 |
  inc   r1                                  ; $0991A1 |
  getb                                      ; $0991A2 |
  inc   r14                                 ; $0991A3 |
  to r12                                    ; $0991A4 |
  add   r6                                  ; $0991A5 |

CODE_0991A6:
  with r8                                   ; $0991A6 |
  add   r7                                  ; $0991A7 |
  with r10                                  ; $0991A8 |
  sub   r7                                  ; $0991A9 |
  beq CODE_0991BE                           ; $0991AA |
  from r8                                   ; $0991AC |
  stw   (r1)                                ; $0991AD |
  inc   r1                                  ; $0991AE |
  inc   r1                                  ; $0991AF |
  from r3                                   ; $0991B0 |
  stw   (r1)                                ; $0991B1 |
  inc   r1                                  ; $0991B2 |
  inc   r1                                  ; $0991B3 |
  from r12                                  ; $0991B4 |
  stw   (r1)                                ; $0991B5 |
  inc   r1                                  ; $0991B6 |
  inc   r1                                  ; $0991B7 |
  from r9                                   ; $0991B8 |
  stw   (r1)                                ; $0991B9 |
  inc   r1                                  ; $0991BA |
  bra CODE_0991A6                           ; $0991BB |

  inc   r1                                  ; $0991BD |

CODE_0991BE:
  from r8                                   ; $0991BE |
  stw   (r1)                                ; $0991BF |
  inc   r1                                  ; $0991C0 |
  inc   r1                                  ; $0991C1 |
  from r3                                   ; $0991C2 |
  stw   (r1)                                ; $0991C3 |
  inc   r1                                  ; $0991C4 |
  inc   r1                                  ; $0991C5 |
  getb                                      ; $0991C6 |
  inc   r14                                 ; $0991C7 |
  add   r6                                  ; $0991C8 |
  stw   (r1)                                ; $0991C9 |
  inc   r1                                  ; $0991CA |
  inc   r1                                  ; $0991CB |
  from r9                                   ; $0991CC |
  stw   (r1)                                ; $0991CD |
  inc   r1                                  ; $0991CE |
  jmp   r11                                 ; $0991CF |
  inc   r1                                  ; $0991D0 |

CODE_0991D1:
  inc   r14                                 ; $0991D1 |
  inc   r14                                 ; $0991D2 |
  jmp   r11                                 ; $0991D3 |
  inc   r1                                  ; $0991D4 |

  iwt   r4,#$0022                           ; $0991D5 |
  iwt   r5,#$002C                           ; $0991D8 |
  ibt   r1,#$0004                           ; $0991DB |
  iwt   r2,#$0F00                           ; $0991DD |
  iwt   r3,#$1360                           ; $0991E0 |
  ibt   r6,#$0000                           ; $0991E3 |
  cache                                     ; $0991E5 |
  ibt   r12,#$0018                          ; $0991E6 |
  move  r13,r15                             ; $0991E8 |
  ldw   (r2)                                ; $0991EA |
  sub   #0                                  ; $0991EB |
  beq CODE_0991FC                           ; $0991ED |
  nop                                       ; $0991EF |
  ldw   (r3)                                ; $0991F0 |
  cmp   r4                                  ; $0991F1 |
  bcc CODE_0991FC                           ; $0991F3 |
  nop                                       ; $0991F5 |
  cmp   r5                                  ; $0991F6 |
  bcs CODE_0991FC                           ; $0991F8 |
  nop                                       ; $0991FA |
  inc   r6                                  ; $0991FB |

CODE_0991FC:
  with r2                                   ; $0991FC |
  add   r1                                  ; $0991FD |
  with r3                                   ; $0991FE |
  add   r1                                  ; $0991FF |
  loop                                      ; $099200 |
  nop                                       ; $099201 |
  stop                                      ; $099202 |
  nop                                       ; $099203 |

  iwt   r4,#$0022                           ; $099204 |
  iwt   r5,#$002C                           ; $099207 |
  iwt   r7,#$001E                           ; $09920A |
  iwt   r8,#$0133                           ; $09920D |
  iwt   r9,#$019A                           ; $099210 |
  iwt   r11,#$00F3                          ; $099213 |
  ibt   r1,#$0004                           ; $099216 |
  iwt   r2,#$0F00                           ; $099218 |
  iwt   r3,#$1360                           ; $09921B |
  ibt   r6,#$0000                           ; $09921E |
  cache                                     ; $099220 |
  ibt   r12,#$0018                          ; $099221 |
  move  r13,r15                             ; $099223 |
  ldw   (r2)                                ; $099225 |
  sub   #0                                  ; $099226 |
  beq CODE_09924B                           ; $099228 |
  nop                                       ; $09922A |
  ldw   (r3)                                ; $09922B |
  cmp   r4                                  ; $09922C |
  bcc CODE_099236                           ; $09922E |
  nop                                       ; $099230 |
  cmp   r5                                  ; $099231 |
  bcc CODE_09924A                           ; $099233 |
  nop                                       ; $099235 |

CODE_099236:
  cmp   r7                                  ; $099236 |
  beq CODE_09924A                           ; $099238 |
  nop                                       ; $09923A |
  cmp   r8                                  ; $09923B |
  beq CODE_09924A                           ; $09923D |
  nop                                       ; $09923F |
  cmp   r9                                  ; $099240 |
  beq CODE_09924A                           ; $099242 |
  nop                                       ; $099244 |
  cmp   r11                                 ; $099245 |
  bne CODE_09924B                           ; $099247 |
  nop                                       ; $099249 |

CODE_09924A:
  inc   r6                                  ; $09924A |

CODE_09924B:
  with r2                                   ; $09924B |
  add   r1                                  ; $09924C |
  with r3                                   ; $09924D |
  add   r1                                  ; $09924E |
  loop                                      ; $09924F |
  nop                                       ; $099250 |
  stop                                      ; $099251 |
  nop                                       ; $099252 |

  iwt   r5,#$13BC                           ; $099253 |
  iwt   r6,#$0F5C                           ; $099256 |
  iwt   r7,#$1D32                           ; $099259 |
  iwt   r8,#$1D34                           ; $09925C |
  iwt   r9,#$0FFF                           ; $09925F |
  from r10                                  ; $099262 |
  to r14                                    ; $099263 |
  add   r10                                 ; $099264 |
  cache                                     ; $099265 |
  ibt   r12,#$0018                          ; $099266 |
  move  r13,r15                             ; $099268 |
  ldb   (r6)                                ; $09926A |
  sub   #15                                 ; $09926C |
  bmi CODE_09927F                           ; $09926E |
  nop                                       ; $099270 |
  ldw   (r7)                                ; $099271 |
  sub   r1                                  ; $099272 |
  add   r10                                 ; $099273 |
  sub   r14                                 ; $099274 |
  bcs CODE_09927F                           ; $099275 |
  nop                                       ; $099277 |
  ldw   (r8)                                ; $099278 |
  sub   r2                                  ; $099279 |
  add   r10                                 ; $09927A |
  sub   r14                                 ; $09927B |
  bcc CODE_099284                           ; $09927C |
  from r12                                  ; $09927E |

CODE_09927F:
  iwt   r15,#$932B                          ; $09927F |
  ibt   r0,#$0004                           ; $099282 |

CODE_099284:
  sub   #1                                  ; $099284 |
  add   r0                                  ; $099286 |
  sms   ($004C),r6                          ; $099287 |
  to r6                                     ; $09928A |
  add   r0                                  ; $09928B |
  iwt   r3,#$0108                           ; $09928C |
  ldw   (r5)                                ; $09928F |
  cmp   r3                                  ; $099290 |
  beq CODE_0992A5                           ; $099292 |
  nop                                       ; $099294 |
  iwt   r3,#$9220                           ; $099295 |
  cmp   r3                                  ; $099298 |
  beq CODE_0992A5                           ; $09929A |
  nop                                       ; $09929C |
  iwt   r3,#$9220                           ; $09929D |
  cmp   r3                                  ; $0992A0 |
  bne CODE_0992BE                           ; $0992A2 |
  nop                                       ; $0992A4 |

CODE_0992A5:
  iwt   r0,#$19D6                           ; $0992A5 |
  add   r6                                  ; $0992A8 |
  ldw   (r0)                                ; $0992A9 |
  sub   #0                                  ; $0992AA |
  bne CODE_099327                           ; $0992AC |
  nop                                       ; $0992AE |
  iwt   r0,#$1040                           ; $0992AF |
  add   r6                                  ; $0992B2 |
  to r11                                    ; $0992B3 |
  ldw   (r0)                                ; $0992B4 |
  iwt   r0,#$1900                           ; $0992B5 |
  add   r6                                  ; $0992B8 |
  from r11                                  ; $0992B9 |
  stw   (r0)                                ; $0992BA |
  bra CODE_0992E0                           ; $0992BB |
  nop                                       ; $0992BD |

CODE_0992BE:
  iwt   r3,#$0132                           ; $0992BE |
  cmp   r3                                  ; $0992C1 |
  bne CODE_0992D9                           ; $0992C3 |
  nop                                       ; $0992C5 |
  iwt   r0,#$19D6                           ; $0992C6 |
  add   r6                                  ; $0992C9 |
  ldw   (r0)                                ; $0992CA |
  sub   #3                                  ; $0992CB |
  beq CODE_099327                           ; $0992CD |
  nop                                       ; $0992CF |
  dec   r0                                  ; $0992D0 |
  bne CODE_0992E0                           ; $0992D1 |
  nop                                       ; $0992D3 |
  bra CODE_099327+1                         ; $0992D4 |

  lms   r6,($004C)                          ; $0992D6 |

CODE_0992D9:
  ldb   (r9)                                ; $0992D9 |
  and   #8                                  ; $0992DB |
  beq CODE_099327                           ; $0992DD |
  nop                                       ; $0992DF |

CODE_0992E0:
  lms   r4,($0000)                          ; $0992E0 |
  ldw   (r7)                                ; $0992E3 |
  sub   r1                                  ; $0992E4 |
  bpl CODE_0992EB                           ; $0992E5 |
  nop                                       ; $0992E7 |
  with r4                                   ; $0992E8 |
  not                                       ; $0992E9 |
  inc   r4                                  ; $0992EA |

CODE_0992EB:
  iwt   r0,#$1220                           ; $0992EB |
  add   r6                                  ; $0992EE |
  from r4                                   ; $0992EF |
  stw   (r0)                                ; $0992F0 |
  lms   r4,($0002)                          ; $0992F1 |
  iwt   r0,#$1222                           ; $0992F4 |
  add   r6                                  ; $0992F7 |
  from r4                                   ; $0992F8 |
  stw   (r0)                                ; $0992F9 |
  with r4                                   ; $0992FA |
  sub   r4                                  ; $0992FB |
  iwt   r0,#$1978                           ; $0992FC |
  add   r6                                  ; $0992FF |
  from r4                                   ; $099300 |
  stw   (r0)                                ; $099301 |
  iwt   r0,#$1540                           ; $099302 |
  add   r6                                  ; $099305 |
  from r4                                   ; $099306 |
  stw   (r0)                                ; $099307 |
  inc   r4                                  ; $099308 |
  iwt   r0,#$1D38                           ; $099309 |
  add   r6                                  ; $09930C |
  from r4                                   ; $09930D |
  stw   (r0)                                ; $09930E |
  ibt   r4,#$0040                           ; $09930F |
  iwt   r0,#$1542                           ; $099311 |
  add   r6                                  ; $099314 |
  from r4                                   ; $099315 |
  stw   (r0)                                ; $099316 |
  iwt   r4,#$FFFC                           ; $099317 |
  ldw   (r9)                                ; $09931A |
  and   r4                                  ; $09931B |
  sbk                                       ; $09931C |
  iwt   r4,#$F9FF                           ; $09931D |
  iwt   r0,#$0FA0                           ; $099320 |
  add   r6                                  ; $099323 |
  ldw   (r0)                                ; $099324 |
  and   r4                                  ; $099325 |
  sbk                                       ; $099326 |

CODE_099327:
  lms   r6,($004C)                          ; $099327 |
  ibt   r0,#$0004                           ; $09932A |
  with r5                                   ; $09932C |
  sub   r0                                  ; $09932D |
  with r6                                   ; $09932E |
  sub   r0                                  ; $09932F |
  with r7                                   ; $099330 |
  sub   r0                                  ; $099331 |
  with r8                                   ; $099332 |
  sub   r0                                  ; $099333 |
  with r9                                   ; $099334 |
  sub   r0                                  ; $099335 |
  loop                                      ; $099336 |
  nop                                       ; $099337 |
  stop                                      ; $099338 |
  nop                                       ; $099339 |

  cache                                     ; $09933A |
  ibt   r12,#$0018                          ; $09933B |
  move  r13,r15                             ; $09933D |
  iwt   r2,#$0010                           ; $09933F |
  from r12                                  ; $099342 |
  sub   #1                                  ; $099343 |
  add   r0                                  ; $099345 |
  to r1                                     ; $099346 |
  add   r0                                  ; $099347 |
  iwt   r0,#$0F00                           ; $099348 |
  add   r1                                  ; $09934B |
  ldw   (r0)                                ; $09934C |
  sub   r2                                  ; $09934D |
  bne CODE_09939E                           ; $09934E |
  nop                                       ; $099350 |
  iwt   r3,#$0007                           ; $099351 |
  ibt   r0,#$0009                           ; $099354 |
  romb                                      ; $099356 |
  iwt   r14,#$93A5                          ; $099358 |

CODE_09935B:
  getb                                      ; $09935B |
  inc   r14                                 ; $09935C |
  to r2                                     ; $09935D |
  getbh                                     ; $09935E |
  iwt   r0,#$1360                           ; $099360 |
  add   r1                                  ; $099363 |
  ldw   (r0)                                ; $099364 |
  sub   r2                                  ; $099365 |
  beq CODE_09936F                           ; $099366 |
  dec   r3                                  ; $099368 |
  bne CODE_09935B                           ; $099369 |
  inc   r14                                 ; $09936B |
  bra CODE_09939E                           ; $09936C |
  nop                                       ; $09936E |

CODE_09936F:
  iwt   r0,#$1CD6                           ; $09936F |
  add   r1                                  ; $099372 |
  ldw   (r0)                                ; $099373 |
  to r2                                     ; $099374 |
  sub   r5                                  ; $099375 |
  bpl CODE_09937B                           ; $099376 |
  with r2                                   ; $099378 |
  not                                       ; $099379 |
  inc   r2                                  ; $09937A |

CODE_09937B:
  iwt   r0,#$1BB6                           ; $09937B |
  add   r1                                  ; $09937E |
  ldw   (r0)                                ; $09937F |
  add   r7                                  ; $099380 |
  sub   r2                                  ; $099381 |
  bmi CODE_09939E                           ; $099382 |
  nop                                       ; $099384 |
  iwt   r0,#$1CD8                           ; $099385 |
  add   r1                                  ; $099388 |
  ldw   (r0)                                ; $099389 |
  to r2                                     ; $09938A |
  sub   r6                                  ; $09938B |
  bpl CODE_099391                           ; $09938C |
  with r2                                   ; $09938E |
  not                                       ; $09938F |
  inc   r2                                  ; $099390 |

CODE_099391:
  iwt   r0,#$1BB8                           ; $099391 |
  add   r1                                  ; $099394 |
  ldw   (r0)                                ; $099395 |
  add   r7                                  ; $099396 |
  sub   r2                                  ; $099397 |
  bmi CODE_09939E                           ; $099398 |
  nop                                       ; $09939A |
  bra CODE_0993A3                           ; $09939B |
  nop                                       ; $09939D |

CODE_09939E:
  loop                                      ; $09939E |
  nop                                       ; $09939F |
  iwt   r1,#$FFFF                           ; $0993A0 |

CODE_0993A3:
  stop                                      ; $0993A3 |
  nop                                       ; $0993A4 |

  dw $00DE, $0089, $008A, $0185             ; $0993A5 |
  dw $0186, $0189, $018A                    ; $0993AD |

  lms   r1,($0094)                          ; $0993B3 |
  lm    r0,($1E0C)                          ; $0993B6 |
  to r2                                     ; $0993BA |
  lob                                       ; $0993BB |
  moves r6,r8                               ; $0993BC |
  beq CODE_0993D8                           ; $0993BE |
  from r2                                   ; $0993C0 |
  lmult                                     ; $0993C1 |
  with r4                                   ; $0993C3 |
  hib                                       ; $0993C4 |
  lob                                       ; $0993C5 |
  swap                                      ; $0993C6 |
  to r3                                     ; $0993C7 |
  or    r4                                  ; $0993C8 |
  from r1                                   ; $0993C9 |
  lmult                                     ; $0993CA |
  with r4                                   ; $0993CC |
  add   r3                                  ; $0993CD |
  with r4                                   ; $0993CE |
  hib                                       ; $0993CF |
  adc   #0                                  ; $0993D0 |
  lob                                       ; $0993D2 |
  swap                                      ; $0993D3 |
  or    r4                                  ; $0993D4 |
  sms   ($0096),r0                          ; $0993D5 |

CODE_0993D8:
  moves r6,r10                              ; $0993D8 |
  beq CODE_0993F4                           ; $0993DA |
  from r2                                   ; $0993DC |
  lmult                                     ; $0993DD |
  with r4                                   ; $0993DF |
  hib                                       ; $0993E0 |
  lob                                       ; $0993E1 |
  swap                                      ; $0993E2 |
  to r3                                     ; $0993E3 |
  or    r4                                  ; $0993E4 |
  from r1                                   ; $0993E5 |
  lmult                                     ; $0993E6 |
  with r4                                   ; $0993E8 |
  add   r3                                  ; $0993E9 |
  with r4                                   ; $0993EA |
  hib                                       ; $0993EB |
  adc   #0                                  ; $0993EC |
  lob                                       ; $0993EE |
  swap                                      ; $0993EF |
  or    r4                                  ; $0993F0 |
  sms   ($0098),r0                          ; $0993F1 |

CODE_0993F4:
  moves r6,r12                              ; $0993F4 |
  beq CODE_099410                           ; $0993F6 |
  from r2                                   ; $0993F8 |
  lmult                                     ; $0993F9 |
  with r4                                   ; $0993FB |
  hib                                       ; $0993FC |
  lob                                       ; $0993FD |
  swap                                      ; $0993FE |
  to r3                                     ; $0993FF |
  or    r4                                  ; $099400 |
  from r1                                   ; $099401 |
  lmult                                     ; $099402 |
  with r4                                   ; $099404 |
  add   r3                                  ; $099405 |
  with r4                                   ; $099406 |
  hib                                       ; $099407 |
  adc   #0                                  ; $099408 |
  lob                                       ; $09940A |
  swap                                      ; $09940B |
  or    r4                                  ; $09940C |
  sms   ($009A),r0                          ; $09940D |

CODE_099410:
  iwt   r0,#$070C                           ; $099410 |
  lms   r5,($009C)                          ; $099413 |
  to r1                                     ; $099416 |
  sub   r5                                  ; $099417 |
  lm    r0,($1E0E)                          ; $099418 |
  to r2                                     ; $09941C |
  lob                                       ; $09941D |
  moves r6,r9                               ; $09941E |
  beq CODE_09944B                           ; $099420 |
  nop                                       ; $099422 |
  bpl CODE_09942B                           ; $099423 |
  from r2                                   ; $099425 |
  move  r0,r5                               ; $099426 |
  bra CODE_099448                           ; $099428 |
  nop                                       ; $09942A |

CODE_09942B:
  lmult                                     ; $09942B |
  with r4                                   ; $09942D |
  hib                                       ; $09942E |
  lob                                       ; $09942F |
  swap                                      ; $099430 |
  to r3                                     ; $099431 |
  or    r4                                  ; $099432 |
  from r1                                   ; $099433 |
  lmult                                     ; $099434 |
  with r4                                   ; $099436 |
  add   r3                                  ; $099437 |
  with r4                                   ; $099438 |
  hib                                       ; $099439 |
  adc   #0                                  ; $09943A |
  lob                                       ; $09943C |
  swap                                      ; $09943D |
  to r3                                     ; $09943E |
  or    r4                                  ; $09943F |
  iwt   r0,#$0326                           ; $099440 |
  sub   r3                                  ; $099443 |
  bpl CODE_099448                           ; $099444 |
  nop                                       ; $099446 |
  sub   r0                                  ; $099447 |

CODE_099448:
  sms   ($009E),r0                          ; $099448 |

CODE_09944B:
  moves r6,r11                              ; $09944B |
  beq CODE_099478                           ; $09944D |
  nop                                       ; $09944F |
  bpl CODE_099458                           ; $099450 |
  from r2                                   ; $099452 |
  move  r0,r5                               ; $099453 |
  bra CODE_099475                           ; $099455 |
  nop                                       ; $099457 |

CODE_099458:
  lmult                                     ; $099458 |
  with r4                                   ; $09945A |
  hib                                       ; $09945B |
  lob                                       ; $09945C |
  swap                                      ; $09945D |
  to r3                                     ; $09945E |
  or    r4                                  ; $09945F |
  from r1                                   ; $099460 |
  lmult                                     ; $099461 |
  with r4                                   ; $099463 |
  add   r3                                  ; $099464 |
  with r4                                   ; $099465 |
  hib                                       ; $099466 |
  adc   #0                                  ; $099467 |
  lob                                       ; $099469 |
  swap                                      ; $09946A |
  to r3                                     ; $09946B |
  or    r4                                  ; $09946C |
  iwt   r0,#$0126                           ; $09946D |
  sub   r3                                  ; $099470 |
  bpl CODE_099475                           ; $099471 |
  nop                                       ; $099473 |
  sub   r0                                  ; $099474 |

CODE_099475:
  sms   ($00A0),r0                          ; $099475 |

CODE_099478:
  moves r6,r13                              ; $099478 |
  beq CODE_0994A5                           ; $09947A |
  nop                                       ; $09947C |
  bpl CODE_099485                           ; $09947D |
  from r2                                   ; $09947F |
  move  r0,r5                               ; $099480 |
  bra CODE_0994A2                           ; $099482 |
  nop                                       ; $099484 |

CODE_099485:
  lmult                                     ; $099485 |
  with r4                                   ; $099487 |
  hib                                       ; $099488 |
  lob                                       ; $099489 |
  swap                                      ; $09948A |
  to r3                                     ; $09948B |
  or    r4                                  ; $09948C |
  from r1                                   ; $09948D |
  lmult                                     ; $09948E |
  with r4                                   ; $099490 |
  add   r3                                  ; $099491 |
  with r4                                   ; $099492 |
  hib                                       ; $099493 |
  adc   #0                                  ; $099494 |
  lob                                       ; $099496 |
  swap                                      ; $099497 |
  to r3                                     ; $099498 |
  or    r4                                  ; $099499 |
  iwt   r0,#$0126                           ; $09949A |
  sub   r3                                  ; $09949D |
  bpl CODE_0994A2                           ; $09949E |
  nop                                       ; $0994A0 |
  sub   r0                                  ; $0994A1 |

CODE_0994A2:
  sms   ($00A2),r0                          ; $0994A2 |

CODE_0994A5:
  stop                                      ; $0994A5 |
  nop                                       ; $0994A6 |

; 3-byte entries based on which screens around
; the current camera are empty vs. not
empty_screen_values:
  db $00, $00, $00, $06, $00, $00, $06, $00 ; $0994A7 |
  db $00, $04, $00, $00, $06, $00, $00, $02 ; $0994AF |
  db $00, $00, $06, $00, $00, $01, $00, $00 ; $0994B7 |
  db $06, $00, $00, $06, $00, $00, $02, $00 ; $0994BF |
  db $00, $01, $01, $00, $04, $00, $00, $01 ; $0994C7 |
  db $00, $01, $01, $01, $01, $00, $00, $00 ; $0994CF |

gsu_update_camera:
  lm    r0,($1E2A)                          ; $0994D7 |\  camera event
  sub   #0                                  ; $0994DB | | like stairs cutscene, etc.
  beq .yoshi_delta_X                        ; $0994DD | | zero means off
  nop                                       ; $0994DF |/
  bmi .skip_camera_window                   ; $0994E0 |\ negative means zoom back to Yoshi
  sub   r0                                  ; $0994E2 |/
  lm    r0,($1E36)                          ; $0994E3 |\
  to r1                                     ; $0994E7 | | r1 = ($1E36) * 2
  add   r0                                  ; $0994E8 |/
  iwt   r13,#$0000                          ; $0994E9 |\  positive ($1E2A) means follow camera
  lm    r0,($1E2E)                          ; $0994EC | | event object (stairs, vine, etc.)
  bra .check_X_camera_window                ; $0994F0 | | so use $1E2E instead of Yoshi position as
  nop                                       ; $0994F2 |/  as basis, and r13=0 so no one-pixel minimum

.skip_camera_window
  ibt   r1,#$0000                           ; $0994F3 |\
  iwt   r15,#$958A                          ; $0994F5 | | jump to .clamp_cam_win_rel_X
  nop                                       ; $0994F8 |/  this skips camera window updating

.yoshi_delta_X
  lm    r0,($1E10)                          ; $0994F9 |\
  to r1                                     ; $0994FD | |
  lob                                       ; $0994FE | | r1 = previous frame value
  lm    r0,($1E12)                          ; $0994FF | | of Yoshi x coord + subpixel
  lob                                       ; $099503 | |
  swap                                      ; $099504 | |
  to r1                                     ; $099505 | |
  or    r1                                  ; $099506 |/
  lms   r0,($008A)                          ; $099507 |\
  to r3                                     ; $09950A | |
  lob                                       ; $09950B | |
  lms   r0,($008C)                          ; $09950C | | r1 = (current - previous value
  lob                                       ; $09950F | | of Yoshi x coord + subpixel)
  swap                                      ; $099510 | | * 2
  or    r3                                  ; $099511 | | this is a scaling factor for X
  sub   r1                                  ; $099512 | | so camera can catch up to you
  to r1                                     ; $099513 | |
  add   r0                                  ; $099514 |/
  iwt   r13,#$0100                          ; $099515 | 1 pixel
  lms   r0,($008C)                          ; $099518 | r0 = current Yoshi X

.check_X_camera_window
  lms   r3,($0094)                          ; $09951B |\  r0 = (either Yoshi x
  sub   r3                                  ; $09951E | |  or ($1E2E))
  lm    r4,($1E20)                          ; $09951F | | - prev camera X - camera window min X
  sub   r4                                  ; $099523 |/  (camera window relative Yoshi X)
  bmi .has_yoshi_moved                      ; $099524 |\
  nop                                       ; $099526 | | if camera-relative Yoshi (or $1E2E)
  ibt   r3,#$0018                           ; $099527 | | is between camera window minimum
  sub   r3                                  ; $099529 | | and cam window min + $18
  dec   r0                                  ; $09952A | | then don't branch - this range
  bpl .has_yoshi_moved                      ; $09952B | | checks for turnaround below
  inc   r0                                  ; $09952D |/
  ibt   r0,#$0030                           ; $09952E |\
  lms   r3,($00C4)                          ; $099530 | | if Yoshi is facing right,
  dec   r3                                  ; $099533 | | load $30 as camera window left boundary
  bmi .check_camera_window_delta            ; $099534 | | if left, $A8
  nop                                       ; $099536 | |
  iwt   r0,#$00A8                           ; $099537 |/

.check_camera_window_delta
  sub   r4                                  ; $09953A | - ($1E20): previous camera window left bound
  ibt   r3,#$0050                           ; $09953B |\  if curr - prev camera window < -$50 or > $50
  add   r3                                  ; $09953D | | then branch to store new camera window
  bmi .store_turned_around                  ; $09953E | | this $50 padding exists to allow the middle,
  nop                                       ; $099540 | | such as $80, to not immediately turn around
  iwt   r3,#$00A0                           ; $099541 | | this only handles larger changes like left side
  sub   r3                                  ; $099544 | | turning right or converse
  bcc .skip_yoshi_moved                     ; $099545 |/  if between -$50 and +$50, don't store cam window

.store_turned_around
  add   r4                                  ; $099547 | + ($1E20): curr camera window X +/- $50
  sm    ($1E20),r0                          ; $099548 | store new camera window min (other side)

.skip_yoshi_moved
  bra .clamp_cam_win_rel_X                  ; $09954C |\ skip test for Yoshi movement
  sub   r0                                  ; $09954E |/ clear r0 on jump

.has_yoshi_moved
  moves r1,r1                               ; $09954F |\
  bne .cmp_deltas_X                         ; $099551 | | has Yoshi moved X coord?
  nop                                       ; $099553 |/
  move  r1,r13                              ; $099554 |\  if not, use r13 as Yoshi delta
  sub   #0                                  ; $099556 | | which is a one-pixel value ($0100)
  bpl .cmp_deltas_X                         ; $099558 | | r0 in this context is how far outside
  nop                                       ; $09955A | | of camera window we are, negative
  with r1                                   ; $09955B | | means left and positive right
  not                                       ; $09955C | | if we're on the left, r13 = -1 pixel
  inc   r1                                  ; $09955D |/

; this tests sign bits of camera window-relative Yoshi X vs. Yoshi delta
; if both are the same sign, it will branch
; both being the same sign means that either we are on the
; left of the camera window and Yoshi is moving left,
; or we're on the right and Yoshi is moving right.
; this is the "expected path" and means player is moving
; in the direction of the camera but the camera simply
; hasn't caught up yet.
; the point of this is really to test the opposite:
; opposite sign means player moved the opposite way
; while the camera was moving toward its destination
; but has not arrived there yet, this means player
; turned around in the midst of the camera animation
; hence, intentionally make the new range minimum RIGHT HERE
; to include the player on purpose and allow a middle camera

.cmp_deltas_X
  to r3                                     ; $09955E |\
  xor   r1                                  ; $09955F | |
  bpl .minimum_delta_sign                   ; $099561 | | r3 = cam window rel. Yoshi X ^ Yoshi delta
  to r4                                     ; $099563 | | (see above for explanation)
  bra .store_camera_window_from             ; $099564 | |
  add   r4                                  ; $099566 |/  r4 = prev + distance outside range

.minimum_delta_sign
  move  r3,r0                               ; $099567 | r3 = camera window relative Yoshi X
  move  r4,r13                              ; $099569 | r4 = one-pixel value ($0100) or 0 on cam event
  moves r1,r1                               ; $09956B |\
  bpl .minimum_one_pixel_delta              ; $09956D | | if Yoshi moved right, use +1 pixel
  nop                                       ; $09956F | | as minimum delta
  with r4                                   ; $099570 | | if left, use -1 pixel as min
  not                                       ; $099571 | |
  inc   r4                                  ; $099572 |/

.minimum_one_pixel_delta
  from r1                                   ; $099573 |\  r0 = r1 - r4
  sub   r4                                  ; $099574 | | if Yoshi delta +/- $0100 (1 pixel)
  xor   r1                                  ; $099575 | | is same sign as Yoshi delta, branch
  bpl .check_camwindow_moving               ; $099577 | | this ensures Yoshi's movement is
  nop                                       ; $099579 |/  above one pixel (or below 127 pixels)
  move  r1,r4                               ; $09957A | if below 1 pixel, just set delta to +/- 1

.check_camwindow_moving
  move  r0,r3                               ; $09957C | r0 = camera window relative Yoshi X
  ibt   r4,#$0030                           ; $09957E |\
  moves r1,r1                               ; $099580 | | if Yoshi moving right
  bpl .store_camera_window_X                ; $099582 | | load $30 as camera window min
  from r4                                   ; $099584 | | left, $A8
  iwt   r4,#$00A8                           ; $099585 |/

.store_camera_window_from
  from r4                                   ; $099588 |

.store_camera_window_X
  sbk                                       ; $099589 | $1E20 = new camera window minimum

.clamp_cam_win_rel_X
  to r3                                     ; $09958A |\
  add   #10                                 ; $09958B | | clamps camera window rel. Yoshi X
  bmi .clamp_math                           ; $09958D | | to minimum -10 and maximum +10
  nop                                       ; $09958F | | (meaning if < -10 set to -10
  to r3                                     ; $099590 | | and if > 10 set to 10)
  sub   #10                                 ; $099591 | |
  bmi .cmp_clamped_rel_X                    ; $099593 | |
  nop                                       ; $099595 |/

.clamp_math
  sub   r3                                  ; $099596 | performs the clamp math if needed

.cmp_clamped_rel_X
  lob                                       ; $099597 |\  $xx00 (because only pixel)
  swap                                      ; $099598 | | if clamped camera window relative Yoshi X
  xor   r1                                  ; $099599 | | is same sign as Yoshi delta
  bpl .cmp_rel_X_minus_yoshi_delta          ; $09959B | | similar to above
  nop                                       ; $09959D |/
  from r1                                   ; $09959E | if diff. signs set r0 = 0

.cmp_rel_X_minus_yoshi_delta
  xor   r1                                  ; $09959F | either set to 0 or flip back to $xx00
  sub   r1                                  ; $0995A1 | r0 = (0 or cam win rel X) - Yoshi delta
  to r3                                     ; $0995A2 |\  if cam win rel X - Yoshi delta
  xor   r1                                  ; $0995A3 | | is same sign as Yoshi delta
  bpl .check_X_left_bound                   ; $0995A5 |/
  add   r1                                  ; $0995A7 |\ if diff. signs use clamped camera
  move  r1,r0                               ; $0995A8 |/ window rel Yoshi X instead of Yoshi delta

.check_X_left_bound
  lm    r0,($1E0C)                          ; $0995AA |\
  lob                                       ; $0995AE | | camera X subpixel += yoshi delta or
  add   r1                                  ; $0995AF | | clamped cam win rel Yoshi X
  sbk                                       ; $0995B0 |/
  hib                                       ; $0995B1 |\ $00pp = pixels, no sub
  sex                                       ; $0995B2 |/
  lms   r1,($0094)                          ; $0995B3 |\
  add   r1                                  ; $0995B6 | | check if camera X + delta
  lm    r1,($1E18)                          ; $0995B7 | | has gone below minimum camera bounds
  sub   r1                                  ; $0995BB | | (left side)
  bpl .check_X_right_bound                  ; $0995BC | |
  add   r1                                  ; $0995BE |/
  sub   r0                                  ; $0995BF |\  if so, zero out camera X subpixel
  sm    ($1E0C),r0                          ; $0995C0 | | and set new cam X value to minimum
  move  r0,r1                               ; $0995C4 |/

.check_X_right_bound
  lm    r1,($1E1A)                          ; $0995C6 |\  has camera X + delta
  sub   r1                                  ; $0995CA | | gone above max camera bounds?
  bmi .update_Y                             ; $0995CB | | (right side)
  add   r1                                  ; $0995CD |/
  sub   r0                                  ; $0995CE |\  if so, zero out camera X subpixel
  sm    ($1E0C),r0                          ; $0995CF | | and set new cam X value to maximum
  move  r0,r1                               ; $0995D3 |/

.update_Y
  move  r1,r0                               ; $0995D5 | new camera X value = prev + sub + delta
  lm    r0,($1E2A)                          ; $0995D7 |\  camera event
  sub   #0                                  ; $0995DB | | like stairs cutscene, etc.
  beq .yoshi_delta_Y                        ; $0995DD | | zero means off
  nop                                       ; $0995DF |/
  bmi .zero_delta_Y                         ; $0995E0 |\ negative means zoom back to Yoshi
  nop                                       ; $0995E2 |/
  lm    r2,($1E38)                          ; $0995E3 |\
  from r2                                   ; $0995E7 | |
  div2                                      ; $0995E8 | | multiply camera event Y speed
  div2                                      ; $0995EA | | by 1.25
  to r2                                     ; $0995EC | |
  add   r2                                  ; $0995ED |/
  iwt   r13,#$0000                          ; $0995EE |\  0 pixel value means no 2-pixel min
  lm    r0,($1E30)                          ; $0995F1 | | skip yoshi delta
  bra .check_Y_camera_window                ; $0995F5 | | use cam event delta instead
  nop                                       ; $0995F7 |/

.zero_delta_Y
  ibt   r3,#$0000                           ; $0995F8 |\ zeroes out Yoshi delta
  ibt   r2,#$0000                           ; $0995FA |/ and cam win rel Y
  iwt   r15,#$970D                          ; $0995FC |
  nop                                       ; $0995FF |

.yoshi_delta_Y
  lm    r0,($1E14)                          ; $099600 |\
  to r2                                     ; $099604 | |
  lob                                       ; $099605 | | r2 = prev frame Yoshi Y
  lm    r0,($1E16)                          ; $099606 | | pixel + sub
  lob                                       ; $09960A | | $ppss
  swap                                      ; $09960B | |
  to r2                                     ; $09960C | |
  or    r2                                  ; $09960D |/
  lms   r0,($008E)                          ; $09960E |\
  to r3                                     ; $099611 | |
  lob                                       ; $099612 | | r2 = curr - prev Yoshi
  lms   r0,($0090)                          ; $099613 | | pixel + sub
  lob                                       ; $099616 | | $ppss
  swap                                      ; $099617 | |
  or    r3                                  ; $099618 | |
  sub   r2                                  ; $099619 | |
  move  r2,r0                               ; $09961A | | * 1.25
  div2                                      ; $09961C | | this is a scaling factor
  div2                                      ; $09961E | | so camera can catch up to you
  to r2                                     ; $099620 | |
  add   r2                                  ; $099621 |/
  iwt   r13,#$0200                          ; $099622 | 2-pixel minimum
  lms   r0,($0090)                          ; $099625 | r0 = current Yoshi Y

.check_Y_camera_window
  lms   r3,($009C)                          ; $099628 |\  r3 = (either Yoshi Y
  sub   r3                                  ; $09962B | |  or ($1E30))
  lm    r4,($1E22)                          ; $09962C | | - prev camera Y - camera window min Y
  to r3                                     ; $099630 | |  (camera window relative Yoshi Y)
  sub   r4                                  ; $099631 |/
  bmi .check_camera_event                   ; $099632 |\  if cam rel Yoshi Y (or $1E30) is
  with r3                                   ; $099634 | | outside of camera Y window
  sub   #8                                  ; $099635 | | i.e. Y > min or Y < min + 8
  bpl .check_camera_event                   ; $099637 |/  r3 = how far outside window (either dir)
  to r3                                     ; $099639 |\ if within camera window,
  sub   r0                                  ; $09963A |/ r3 = 0

.check_camera_event
  lm    r0,($1E2A)                          ; $09963B |\
  sub   #0                                  ; $09963F | | no camera event?
  beq .check_up_down_press                  ; $099641 | |
  nop                                       ; $099643 |/
  iwt   r15,#$970D                          ; $099644 |\ on camera event, skip
  nop                                       ; $099647 |/

.check_up_down_press
  lm    r5,($0071)                          ; $099648 |\
  from r5                                   ; $09964C | | if any button except Up or Down
  bic   #12                                 ; $09964D |/  is pressed
  lms   r14,($00A8)                         ; $09964F |\
  or    r14                                 ; $099652 | | or Yoshi is moving (X)
  lms   r14,($00C0)                         ; $099653 | | or Yoshi jumping/in air
  or    r14                                 ; $099656 |/
  bne .check_default_cam_win_Y              ; $099657 |\ then up/down framecount = 0
  sub   r0                                  ; $099659 |/
  lms   r0,($00AE)                          ; $09965A |\
  sub   #4                                  ; $09965D | | if mole Yoshi
  beq .check_default_cam_win_Y              ; $09965F |/  up/down framecount = 0
  from r5                                   ; $099661 |\
  and   #12                                 ; $099662 | | if neither Up nor Down button is pressed
  beq .store_updown_framecount              ; $099664 | | up/down framecount = 0
  sub   r0                                  ; $099666 |/
  lm    r0,($1E24)                          ; $099667 |\ r0 = up/down framecount + 1
  inc   r0                                  ; $09966B |/
  ibt   r4,#$0010                           ; $09966C |\
  sub   r4                                  ; $09966E | | if up/down framecount + 1
  bcc .store_updown_framecount              ; $09966F | | < $10 (this is value to start scrolling)
  add   r4                                  ; $099671 |/
  iwt   r4,#$00A0                           ; $099672 |\  at this point, we are definitely scrolling
  from r5                                   ; $099675 | | so reset up/down framecount
  and   #8                                  ; $099676 | | and check if Up button pressed
  bne .reset_updown_framecount              ; $099678 | | if so, $A0 is camera window Y minimum
  nop                                       ; $09967A | | if Down, $64
  ibt   r4,#$0064                           ; $09967B |/

.reset_updown_framecount
  sub   r0                                  ; $09967D |\ store 0 into up/down framecount
  sbk                                       ; $09967E |/
  with r4                                   ; $09967F |\  move r0,r4
  bra .store_camera_window_Y                ; $099680 | | store cam Y win min as either $64 or $A0
  to r0                                     ; $099682 |/  based on up/down scrolling from controller

.store_updown_framecount
  sm    ($1E24),r0                          ; $099683 |
  bra .check_extended_flutter               ; $099687 |
  nop                                       ; $099689 |

.check_default_cam_win_Y
  sm    ($1E24),r0                          ; $09968A |
  moves r3,r3                               ; $09968E |\
  beq .clamp_yoshi_delta_Y_min              ; $099690 | | are we inside camera window?
  nop                                       ; $099692 |/  if not:
  ibt   r0,#$0064                           ; $099693 |\  if $64 - cam win min Y
  sub   r4                                  ; $099695 | | is same sign as cam win rel Yoshi Y
  to r5                                     ; $099696 | | if not, Yoshi is above cam win min
  xor   r3                                  ; $099697 | | and cam win is above $64 (or both below)
  bpl .check_extended_flutter               ; $099699 | | hence set new camera window Y = $64
  add   r4                                  ; $09969B |/  which is the "default"

.store_camera_window_Y
  sm    ($1E22),r0                          ; $09969C |

.check_extended_flutter
  moves r3,r3                               ; $0996A0 |\
  bpl .clamp_yoshi_delta_Y_min              ; $0996A2 | | if Yoshi is below or within camera window
  nop                                       ; $0996A4 |/
  lms   r0,($00C0)                          ; $0996A5 |\
  sub   #0                                  ; $0996A8 | |
  beq .set_follow_yoshi_Y                   ; $0996AA | | if on ground or ground pounding
  inc   r0                                  ; $0996AC | | set follow flag on
  lms   r0,($00D4)                          ; $0996AD | | this means code below only runs
  dec   r0                                  ; $0996B0 | | while in air but not ground pounding
  bpl .set_follow_yoshi_Y                   ; $0996B1 | |
  inc   r0                                  ; $0996B3 |/
  lm    r0,($1E22)                          ; $0996B4 |\
  ibt   r4,#$0050                           ; $0996B8 | |
  sub   r4                                  ; $0996BA | | r4 = camera window min Y - $50
  to r4                                     ; $0996BB | | + cam win rel Yoshi Y
  add   r3                                  ; $0996BC | |
  bpl .check_follow_flags_Y                 ; $0996BD | | if this value >= 0, skip
  nop                                       ; $0996BF |/
  lms   r0,($00D2)                          ; $0996C0 |\
  iwt   r5,#$8002                           ; $0996C3 | | if flutter state < $8002
  sub   r5                                  ; $0996C6 | | this means code below only runs
  bcc .check_follow_flags_Y                 ; $0996C7 | | during mid-extended flutter
  nop                                       ; $0996C9 |/
  move  r3,r4                               ; $0996CA |\  for extended flutter,
  bra .clamp_cam_win_rel_Y                  ; $0996CC | | use this r4 value instead of
  from r3                                   ; $0996CE |/  cam win rel Y

.set_follow_yoshi_Y
  sm    ($1E0A),r0                          ; $0996CF | set flag to follow Yoshi
  from r13                                  ; $0996D3 |\
  not                                       ; $0996D4 | | r0 = -2 pixel minimum
  inc   r0                                  ; $0996D5 | | - Yoshi Y delta
  sub   r2                                  ; $0996D6 | |
  bpl .check_follow_flags_Y                 ; $0996D7 | | clamp Yoshi Y delta to max -2:
  to r2                                     ; $0996D9 | | if Yoshi Y delta > -2
  add   r2                                  ; $0996DA |/  r2 = -2

.check_follow_flags_Y
  lm    r0,($1E0A)                          ; $0996DB |\
  lms   r4,($00C6)                          ; $0996DF | | if follow flag is on
  or    r4                                  ; $0996E2 | | or Yoshi in water
  lms   r4,($014E)                          ; $0996E3 | | or transforming
  or    r4                                  ; $0996E6 | |
  lms   r4,($00DA)                          ; $0996E7 | | or climbing stairs
  or    r4                                  ; $0996EA | |
  bne .clamp_cam_win_rel_Y_from             ; $0996EB | |
  nop                                       ; $0996ED | |
  lms   r0,($00AE)                          ; $0996EE | | or helicopter Yoshi
  sub   #6                                  ; $0996F1 | |
  beq .clamp_cam_win_rel_Y_from             ; $0996F3 | | then follow Yoshi Y
  nop                                       ; $0996F5 |/
  to r3                                     ; $0996F6 |\
  bra .clamp_cam_win_rel_Y_from             ; $0996F7 | | otherwise, zero out
  sub   r0                                  ; $0996F9 |/  camera win rel Y

.clamp_yoshi_delta_Y_min
  lms   r0,($00C0)                          ; $0996FA |\
  sub   #0                                  ; $0996FD | | if in air
  bne .clamp_cam_win_rel_Y_from             ; $0996FF |/
  sub   r0                                  ; $099701 |\  if not, reset follow flag
  sm    ($1E0A),r0                          ; $099702 |/
  from r13                                  ; $099706 |\
  sub   r2                                  ; $099707 | |
  bmi .clamp_cam_win_rel_Y_from             ; $099708 | | clamp Yoshi Y delta to min 2:
  add   r2                                  ; $09970A | | if Yoshi Y delta < 2
  move  r2,r0                               ; $09970B |/  r2 = 2

.clamp_cam_win_rel_Y_from
  from r3                                   ; $09970D |

.clamp_cam_win_rel_Y
  add   #10                                 ; $09970E |\
  bmi .clamp_cam_win_rel_Y_math             ; $099710 | | clamps camera window rel. Yoshi Y
  from r3                                   ; $099712 | | to minimum -10 and maximum +10
  sub   #10                                 ; $099713 | | (meaning if < -10 set to -10
  bmi .cmp_deltas_Y                         ; $099715 | | and if > 10 set to 10)
  nop                                       ; $099717 |/

.clamp_cam_win_rel_Y_math
  with r3                                   ; $099718 |\ do clamp math if needed
  sub   r0                                  ; $099719 |/

.cmp_deltas_Y
  from r3                                   ; $09971A |\ low byte of cam win rel Yoshi Y
  lob                                       ; $09971B |/
  lm    r3,($1E2A)                          ; $09971C |\ pointless code?
  moves r3,r3                               ; $099720 |/
  swap                                      ; $099722 |\  test sign bits of cam win rel Y
  xor   r2                                  ; $099723 | | vs. Yoshi delta Y
  bpl .cmp_rel_Y_minus_yoshi_delta          ; $099725 | |
  nop                                       ; $099727 |/
  from r2                                   ; $099728 | if diff sign, zero out instead of flip back

.cmp_rel_Y_minus_yoshi_delta
  xor   r2                                  ; $099729 | either set to 0 or flip back to $xx00
  sub   r2                                  ; $09972B | r0 = (0 or cam win rel X) - Yoshi delta
  to r3                                     ; $09972C |\  if cam win rel Y - Yoshi delta
  xor   r2                                  ; $09972D | | is same sign as Yoshi delta
  bpl .check_Y_upper_bound                  ; $09972F |/
  add   r2                                  ; $099731 |\ if diff. signs use clamped camera
  move  r2,r0                               ; $099732 |/ window rel Yoshi Y instead of Yoshi delta

.check_Y_upper_bound
  lm    r0,($1E0E)                          ; $099734 |\
  lob                                       ; $099738 | | camera Y subpixel += yoshi delta or
  add   r2                                  ; $099739 | | clamped cam win rel Yoshi X
  sbk                                       ; $09973A |/
  hib                                       ; $09973B |\ $00pp = pixels, no sub
  sex                                       ; $09973C |/
  lms   r2,($009C)                          ; $09973D |\
  add   r2                                  ; $099740 | | check if camera Y + delta
  lm    r2,($1E1C)                          ; $099741 | | has gone above minimum camera bounds
  sub   r2                                  ; $099745 | | (upper bound)
  bpl .check_Y_lower_bound                  ; $099746 | |
  add   r2                                  ; $099748 |/
  sub   r0                                  ; $099749 |\  if so, zero out camera Y subpixel
  sm    ($1E0E),r0                          ; $09974A | | and set new cam Y value to minimum
  move  r0,r2                               ; $09974E |/

.check_Y_lower_bound
  lm    r2,($1E1E)                          ; $099750 |\  has camera Y + delta
  sub   r2                                  ; $099754 | | gone below max camera bounds?
  bmi .check_empty_screens                  ; $099755 | | (lower bound)
  add   r2                                  ; $099757 |/
  sub   r0                                  ; $099758 |\  if so, zero out camera Y subpixel
  sm    ($1E0E),r0                          ; $099759 | | and set new cam Y value to maximum
  move  r0,r2                               ; $09975D |/

.check_empty_screens
  ibt   r2,#$000C                           ; $09975F |\
  to r2                                     ; $099761 | | subtract 12 from camera Y
  sub   r2                                  ; $099762 |/
  ibt   r5,#$0000                           ; $099763 |
  iwt   r6,#$0CAA                           ; $099765 | screen ID table
  iwt   r0,#$00FF                           ; $099768 |
  to r3                                     ; $09976B |\ r3 = camera X + $FF (right side screen check)
  add   r1                                  ; $09976C |/
  to r4                                     ; $09976D |\ r4 = camera Y + $FF (lower screen check)
  add   r2                                  ; $09976E |/
  moves r0,r2                               ; $09976F |\  r0 = cam Y
  bpl .check_new_screen                     ; $099771 | | if cam Y >= 0
  hib                                       ; $099773 |/
  sub   r0                                  ; $099774 | if cam Y is negative, just use 0

.check_new_screen
  add   r0                                  ; $099775 |\
  add   r0                                  ; $099776 | | r7 = r0 << 4
  add   r0                                  ; $099777 | | Y screen #
  to r7                                     ; $099778 | |
  add   r0                                  ; $099779 |/
  from r1                                   ; $09977A |\
  hib                                       ; $09977B | | r0 = $0CAA
  or    r7                                  ; $09977C | | + $yx screen #
  add   r6                                  ; $09977D |/  screen index
  ldb   (r0)                                ; $09977E |\
  sex                                       ; $099780 | | load screen ID for new screen #
  bmi .check_right_screen                   ; $099781 | | negative means empty
  nop                                       ; $099783 |/
  ibt   r5,#$0002                           ; $099784 | if not empty, r5 = 2

.check_right_screen
  from r3                                   ; $099786 |\
  hib                                       ; $099787 | | screen index for
  or    r7                                  ; $099788 | | screen to the right
  add   r6                                  ; $099789 |/
  ldb   (r0)                                ; $09978A |\
  sex                                       ; $09978C | | load screen ID for right screen #
  bmi .check_lower_screen                   ; $09978D | | negative means empty
  nop                                       ; $09978F |/
  inc   r5                                  ; $099790 | if not empty, r5++

.check_lower_screen
  with r5                                   ; $099791 |\ r5 *= 2
  add   r5                                  ; $099792 |/
  from r4                                   ; $099793 |\
  hib                                       ; $099794 | |
  add   r0                                  ; $099795 | |
  add   r0                                  ; $099796 | |
  add   r0                                  ; $099797 | | screen index for
  to r7                                     ; $099798 | | one screen below
  add   r0                                  ; $099799 | |
  from r1                                   ; $09979A | |
  hib                                       ; $09979B | |
  or    r7                                  ; $09979C | |
  add   r6                                  ; $09979D |/
  ldb   (r0)                                ; $09979E |\
  sex                                       ; $0997A0 | | load screen ID for lower screen #
  bmi .check_lower_right_screen             ; $0997A1 | | negative means empty
  nop                                       ; $0997A3 |/
  inc   r5                                  ; $0997A4 | if not empty, r5++

.check_lower_right_screen
  with r5                                   ; $0997A5 |\ r5 *= 2
  add   r5                                  ; $0997A6 |/
  from r3                                   ; $0997A7 |\
  hib                                       ; $0997A8 | | screen index for
  or    r7                                  ; $0997A9 | | screen to the lower right
  add   r6                                  ; $0997AA |/
  ldb   (r0)                                ; $0997AB |\
  sex                                       ; $0997AD | | screen ID for lower right screen #
  bmi .check_empty_screen_values            ; $0997AE | | negative means empty
  nop                                       ; $0997B0 |/
  inc   r5                                  ; $0997B1 | if not empty, r5++

.check_empty_screen_values
  ibt   r0,#$0009                           ; $0997B2 |\
  romb                                      ; $0997B4 | |
  iwt   r0,#$94A7                           ; $0997B6 | | index into empty_screen_values table
  add   r5                                  ; $0997B9 | | using r5 * 3
  add   r5                                  ; $0997BA | |
  to r14                                    ; $0997BB | |
  add   r5                                  ; $0997BC | | first byte within 3-byte entry
  getb                                      ; $0997BD | |
  inc   r14                                 ; $0997BE |/
  dec   r0                                  ; $0997BF |\
  bpl .lock_X_screen                        ; $0997C0 | | if first byte > 0
  inc   r0                                  ; $0997C2 |/
  iwt   r15,#$984E                          ; $0997C3 |\ else set cam & return
  nop                                       ; $0997C6 |/

.lock_X_screen
  lsr                                       ; $0997C7 |\ if bit 0 of first byte is set
  bcs .lock_diagonal_screen                 ; $0997C8 |/ we lock "diagonally"
  lsr                                       ; $0997CA |\  if bit 1 of first byte is clear
  bcc .lock_Y_screen                        ; $0997CB | | lock Y but not X
  nop                                       ; $0997CD |/
  move  r6,r0                               ; $0997CE | r6 = first byte of table
  sub   r0                                  ; $0997D0 |\ clear camera X subpixel
  sm    ($1E0C),r0                          ; $0997D1 |/
  iwt   r0,#$0080                           ; $0997D5 |\  r0 = camera X + $80 (half screen)
  add   r1                                  ; $0997D8 | | $00ss (ss = screen)
  hib                                       ; $0997D9 | | camera X = $ss00 (half screen over, 0 out pixel)
  to r1                                     ; $0997DA | | this locks screen to not allow it to pan
  swap                                      ; $0997DB |/  over to the empty screen on the left/right
  dec   r6                                  ; $0997DC |\  if first byte at this point
  bmi .ret                                  ; $0997DD | | (that is, >> 2)
  nop                                       ; $0997DF |/  is <= 0, return, otherwise lock Y

.lock_Y_screen
  sub   r0                                  ; $0997E0 |\ clear camera Y subpixel
  sm    ($1E0E),r0                          ; $0997E1 |/
  iwt   r0,#$0080                           ; $0997E5 |\  r0 = camera Y + $80 (half screen)
  add   r2                                  ; $0997E8 | | $00ss (ss = screen)
  hib                                       ; $0997E9 | | camera Y = $ss00 (half screen down, 0 out pixel)
  to r2                                     ; $0997EA | | this locks screen to not allow it to pan
  bra .ret                                  ; $0997EB | | to the empty screen above/below
  swap                                      ; $0997ED |/  if either X or Y is locked, return

.lock_diagonal_screen
  to r3                                     ; $0997EE |\
  getb                                      ; $0997EF | | r3 = second byte of table
  inc   r14                                 ; $0997F0 |/
  move  r0,r1                               ; $0997F1 | r0 = camera X
  dec   r3                                  ; $0997F3 |\
  bmi .lock_diagonal_third_byte             ; $0997F4 | | if second byte <= 0
  inc   r3                                  ; $0997F6 |/
  not                                       ; $0997F7 | else take negative of camera X

.lock_diagonal_third_byte
  to r7                                     ; $0997F8 |\ r7 = +/- camera X pixels
  lob                                       ; $0997F9 |/
  to r5                                     ; $0997FA |\ r5 = third byte of table
  getb                                      ; $0997FB |/
  move  r0,r2                               ; $0997FC | r0 = camera Y
  dec   r5                                  ; $0997FE |\
  bmi .lock_diagonal_compute_pixels         ; $0997FF | | if third byte <= 0
  inc   r5                                  ; $099801 |/
  not                                       ; $099802 | else take negative of camera Y

.lock_diagonal_compute_pixels
  lob                                       ; $099803 |\
  move  r8,r0                               ; $099804 |/ r8 = +/- camera Y pixels
  add   r7                                  ; $099806 | r0 = +/- camera X + +/- camera Y pixels
  iwt   r6,#$0100                           ; $099807 |\
  sub   r6                                  ; $09980A | | if camera X + Y pixels >= $0100, return
  bcs .ret                                  ; $09980B | |
  add   r6                                  ; $09980D |/
  add   r0                                  ; $09980E | r0 *= 2
  iwt   r6,#$2200                           ; $09980F |\
  add   r6                                  ; $099812 | | r0,r4 =
  ldw   (r0)                                ; $099813 | | $7F80 / ((camera X + Y pixels) * 2)
  iwt   r6,#$7F80                           ; $099814 | |
  lmult                                     ; $099817 |/
  with r4                                   ; $099819 |\
  add   r4                                  ; $09981A | |
  rol                                       ; $09981B | | lower byte of computation *= 4
  with r4                                   ; $09981C | | upper byte << 1
  add   r4                                  ; $09981D |/
  to r6                                     ; $09981E |\ r6 = upper byte << 1 + sign bit of upper byte
  adc   #0                                  ; $09981F |/
  from r7                                   ; $099821 |\ r4 = +/- camera X pixels * upper byte of computation * 2
  lmult                                     ; $099822 |/
  iwt   r0,#$0080                           ; $099824 | half screen value
  dec   r3                                  ; $099827 |\
  bmi .lock_diagonal_X                      ; $099828 | | if second byte of table <= 0
  add   r4                                  ; $09982A |/ r0 = r4 + half screen
  not                                       ; $09982B | else take negative of r0

.lock_diagonal_X
  to r7                                     ; $09982C |\ r7 = $00xx: pixels from math above
  hib                                       ; $09982D |/
  from r1                                   ; $09982E |\
  hib                                       ; $09982F | | $ss00: camera X screen only
  swap                                      ; $099830 |/
  to r1                                     ; $099831 |\ new camera X = $ssxx, same screen
  or    r7                                  ; $099832 |/ but diagonal-calculated pixels
  from r8                                   ; $099833 |\ r4 = +/- camera Y pixels * upper byte of computation * 2
  lmult                                     ; $099834 |/
  iwt   r0,#$0080                           ; $099836 | half screen value
  dec   r5                                  ; $099839 |\
  bmi .lock_diagonal_Y                      ; $09983A | | if third byte of table <= 0
  add   r4                                  ; $09983C |/ r0 = r4 + half screen
  not                                       ; $09983D | else take negative of r0

.lock_diagonal_Y
  to r8                                     ; $09983E |\ r8 = $00yy: pixels from math above
  hib                                       ; $09983F |/
  from r2                                   ; $099840 |\
  hib                                       ; $099841 | | $ss00: camera Y screen only
  swap                                      ; $099842 |/
  to r2                                     ; $099843 |\ new camera Y = $ssyy, same screen
  or    r8                                  ; $099844 |/ but diagonal-calculated pixels
  sub   r0                                  ; $099845 |\
  sm    ($1E0C),r0                          ; $099846 | | clear camera X & Y spubpixels
  sm    ($1E0E),r0                          ; $09984A |/

.ret
  sms   ($0094),r1                          ; $09984E |\ store new camera values
  sms   ($009C),r2                          ; $099851 |/
  stop                                      ; $099854 |
  nop                                       ; $099855 |

  iwt   r1,#$0167                           ; $099856 |
  iwt   r2,#$0169                           ; $099859 |
  ibt   r5,#$0000                           ; $09985C |
  ibt   r6,#$0010                           ; $09985E |
  ibt   r8,#$FFFF                           ; $099860 |
  ibt   r9,#$FFFF                           ; $099862 |
  cache                                     ; $099864 |
  ibt   r12,#$0018                          ; $099865 |
  move  r13,r15                             ; $099867 |
  iwt   r0,#$0F00                           ; $099869 |
  add   r5                                  ; $09986C |
  ldw   (r0)                                ; $09986D |
  sub   r6                                  ; $09986E |
  bne CODE_0998AF                           ; $09986F |
  nop                                       ; $099871 |
  iwt   r0,#$1360                           ; $099872 |
  add   r5                                  ; $099875 |
  ldw   (r0)                                ; $099876 |
  cmp   r1                                  ; $099877 |
  bcc CODE_0998AF                           ; $099879 |
  nop                                       ; $09987B |
  cmp   r2                                  ; $09987C |
  bcs CODE_0998AF                           ; $09987E |
  nop                                       ; $099880 |
  iwt   r0,#$1D38                           ; $099881 |
  add   r5                                  ; $099884 |
  ldw   (r0)                                ; $099885 |
  sub   #0                                  ; $099886 |
  bne CODE_0998AF                           ; $099888 |
  nop                                       ; $09988A |
  iwt   r0,#$10E2                           ; $09988B |
  add   r5                                  ; $09988E |
  ldw   (r0)                                ; $09988F |
  from r3                                   ; $099890 |
  sub   r0                                  ; $099891 |
  bpl CODE_099897                           ; $099892 |
  nop                                       ; $099894 |
  not                                       ; $099895 |
  inc   r0                                  ; $099896 |

CODE_099897:
  move  r7,r0                               ; $099897 |
  iwt   r0,#$1182                           ; $099899 |
  add   r5                                  ; $09989C |
  ldw   (r0)                                ; $09989D |
  from r4                                   ; $09989E |
  sub   r0                                  ; $09989F |
  bpl CODE_0998A5                           ; $0998A0 |
  nop                                       ; $0998A2 |
  not                                       ; $0998A3 |
  inc   r0                                  ; $0998A4 |

CODE_0998A5:
  add   r7                                  ; $0998A5 |
  cmp   r8                                  ; $0998A6 |
  bcs CODE_0998AF                           ; $0998A8 |
  nop                                       ; $0998AA |
  move  r8,r0                               ; $0998AB |
  move  r9,r5                               ; $0998AD |

CODE_0998AF:
  with r5                                   ; $0998AF |
  add   #4                                  ; $0998B0 |
  loop                                      ; $0998B2 |
  nop                                       ; $0998B3 |
  stop                                      ; $0998B4 |
  nop                                       ; $0998B5 |

  iwt   r0,#$1362                           ; $0998B6 |
  add   r1                                  ; $0998B9 |
  ldw   (r0)                                ; $0998BA |
  ibt   r2,#$0030                           ; $0998BB |
  to r2                                     ; $0998BD |
  add   r2                                  ; $0998BE |
  iwt   r0,#$19D6                           ; $0998BF |
  add   r1                                  ; $0998C2 |
  ldw   (r0)                                ; $0998C3 |
  lsr                                       ; $0998C4 |
  to r3                                     ; $0998C5 |
  lsr                                       ; $0998C6 |
  iwt   r0,#$19D8                           ; $0998C7 |
  add   r1                                  ; $0998CA |
  to r4                                     ; $0998CB |
  ldw   (r0)                                ; $0998CC |
  iwt   r0,#$1A36                           ; $0998CD |
  add   r1                                  ; $0998D0 |
  to r5                                     ; $0998D1 |
  ldw   (r0)                                ; $0998D2 |
  iwt   r0,#$1680                           ; $0998D3 |
  add   r1                                  ; $0998D6 |
  to r9                                     ; $0998D7 |
  ldw   (r0)                                ; $0998D8 |
  iwt   r0,#$1682                           ; $0998D9 |
  add   r1                                  ; $0998DC |
  to r10                                    ; $0998DD |
  ldw   (r0)                                ; $0998DE |
  ibt   r11,#$0000                          ; $0998DF |
  iwt   r0,#$1180                           ; $0998E1 |
  add   r1                                  ; $0998E4 |
  ldb   (r0)                                ; $0998E5 |
  mult  #8                                  ; $0998E7 |
  sms   ($0000),r0                          ; $0998E9 |
  ibt   r0,#$0009                           ; $0998EC |
  romb                                      ; $0998EE |
  cache                                     ; $0998F0 |

CODE_0998F1:
  with r5                                   ; $0998F1 |
  add   r5                                  ; $0998F2 |
  with r4                                   ; $0998F3 |
  rol                                       ; $0998F4 |
  rol                                       ; $0998F5 |
  with r5                                   ; $0998F6 |
  add   r5                                  ; $0998F7 |
  with r4                                   ; $0998F8 |
  rol                                       ; $0998F9 |
  rol                                       ; $0998FA |
  with r5                                   ; $0998FB |
  add   r5                                  ; $0998FC |
  with r4                                   ; $0998FD |
  rol                                       ; $0998FE |
  rol                                       ; $0998FF |
  and   #7                                  ; $099900 |
  with r3                                   ; $099902 |
  sub   #8                                  ; $099903 |
  bcc CODE_09996D                           ; $099905 |
  nop                                       ; $099907 |
  add   #3                                  ; $099908 |
  lsr                                       ; $09990A |
  lsr                                       ; $09990B |
  iwt   r14,#$99D6                          ; $09990C |
  to r14                                    ; $09990F |
  add   r14                                 ; $099910 |
  to r12                                    ; $099911 |
  getb                                      ; $099912 |
  sms   ($0048),r4                          ; $099913 |
  add   r0                                  ; $099916 |
  iwt   r14,#$99D9                          ; $099917 |
  to r14                                    ; $09991A |
  add   r14                                 ; $09991B |
  getb                                      ; $09991C |
  inc   r14                                 ; $09991D |
  to r14                                    ; $09991E |
  getbh                                     ; $09991F |
  move  r13,r15                             ; $099921 |
  getbs                                     ; $099923 |
  inc   r14                                 ; $099925 |
  moves r6,r11                              ; $099926 |
  beq CODE_09992F                           ; $099928 |
  nop                                       ; $09992A |
  not                                       ; $09992B |
  inc   r0                                  ; $09992C |
  ibt   r6,#$0008                           ; $09992D |

CODE_09992F:
  to r4                                     ; $09992F |
  add   r9                                  ; $099930 |
  getbs                                     ; $099931 |
  inc   r14                                 ; $099933 |
  to r7                                     ; $099934 |
  add   r10                                 ; $099935 |
  getb                                      ; $099936 |
  inc   r14                                 ; $099937 |
  getbh                                     ; $099938 |
  inc   r14                                 ; $09993A |
  to r8                                     ; $09993B |
  xor   r11                                 ; $09993C |
  getb                                      ; $09993E |
  and   #2                                  ; $09993F |
  bne CODE_099946                           ; $099941 |
  nop                                       ; $099943 |
  with r4                                   ; $099944 |
  add   r6                                  ; $099945 |

CODE_099946:
  from r4                                   ; $099946 |
  stw   (r2)                                ; $099947 |
  inc   r2                                  ; $099948 |
  inc   r2                                  ; $099949 |
  from r7                                   ; $09994A |
  stw   (r2)                                ; $09994B |
  inc   r2                                  ; $09994C |
  inc   r2                                  ; $09994D |
  to r7                                     ; $09994E |
  getbh                                     ; $09994F |
  inc   r14                                 ; $099951 |
  lms   r0,($0000)                          ; $099952 |
  add   r8                                  ; $099955 |
  stw   (r2)                                ; $099956 |
  inc   r2                                  ; $099957 |
  inc   r2                                  ; $099958 |
  from r7                                   ; $099959 |
  stw   (r2)                                ; $09995A |
  inc   r2                                  ; $09995B |
  loop                                      ; $09995C |
  inc   r2                                  ; $09995D |
  lms   r4,($0048)                          ; $09995E |
  iwt   r0,#$4000                           ; $099961 |
  to r11                                    ; $099964 |
  xor   r11                                 ; $099965 |
  ibt   r0,#$0020                           ; $099967 |
  with r10                                  ; $099969 |
  bra CODE_0998F1                           ; $09996A |

  sub   r0                                  ; $09996C |

CODE_09996D:
  from r3                                   ; $09996D |
  add   #8                                  ; $09996E |
  bne CODE_09997F                           ; $099970 |
  nop                                       ; $099972 |
  iwt   r0,#$1A38                           ; $099973 |
  add   r1                                  ; $099976 |
  ldw   (r0)                                ; $099977 |
  lsr                                       ; $099978 |
  lsr                                       ; $099979 |
  beq CODE_09997F                           ; $09997A |
  nop                                       ; $09997C |
  add   #7                                  ; $09997D |

CODE_09997F:
  iwt   r14,#$99DF                          ; $09997F |
  to r14                                    ; $099982 |
  add   r14                                 ; $099983 |
  to r12                                    ; $099984 |
  getb                                      ; $099985 |
  add   r0                                  ; $099986 |
  iwt   r14,#$99EA                          ; $099987 |
  to r14                                    ; $09998A |
  add   r14                                 ; $09998B |
  getb                                      ; $09998C |
  inc   r14                                 ; $09998D |
  to r14                                    ; $09998E |
  getbh                                     ; $09998F |
  iwt   r0,#$1362                           ; $099991 |
  add   r1                                  ; $099994 |
  to r2                                     ; $099995 |
  ldw   (r0)                                ; $099996 |
  move  r13,r15                             ; $099997 |
  getbs                                     ; $099999 |
  inc   r14                                 ; $09999B |
  moves r6,r11                              ; $09999C |
  beq CODE_0999A5                           ; $09999E |
  nop                                       ; $0999A0 |
  not                                       ; $0999A1 |
  inc   r0                                  ; $0999A2 |
  ibt   r6,#$0008                           ; $0999A3 |

CODE_0999A5:
  to r4                                     ; $0999A5 |
  add   r9                                  ; $0999A6 |
  getbs                                     ; $0999A7 |
  inc   r14                                 ; $0999A9 |
  to r7                                     ; $0999AA |
  add   r10                                 ; $0999AB |
  getb                                      ; $0999AC |
  inc   r14                                 ; $0999AD |
  getbh                                     ; $0999AE |
  inc   r14                                 ; $0999B0 |
  to r8                                     ; $0999B1 |
  xor   r11                                 ; $0999B2 |
  getb                                      ; $0999B4 |
  and   #2                                  ; $0999B5 |
  bne CODE_0999BC                           ; $0999B7 |
  nop                                       ; $0999B9 |
  with r4                                   ; $0999BA |
  add   r6                                  ; $0999BB |

CODE_0999BC:
  from r4                                   ; $0999BC |
  stw   (r2)                                ; $0999BD |
  inc   r2                                  ; $0999BE |
  inc   r2                                  ; $0999BF |
  from r7                                   ; $0999C0 |
  stw   (r2)                                ; $0999C1 |
  inc   r2                                  ; $0999C2 |
  inc   r2                                  ; $0999C3 |
  to r7                                     ; $0999C4 |
  getbh                                     ; $0999C5 |
  inc   r14                                 ; $0999C7 |
  lms   r0,($0000)                          ; $0999C8 |
  add   r8                                  ; $0999CB |
  stw   (r2)                                ; $0999CC |
  inc   r2                                  ; $0999CD |
  inc   r2                                  ; $0999CE |
  from r7                                   ; $0999CF |
  stw   (r2)                                ; $0999D0 |
  inc   r2                                  ; $0999D1 |
  loop                                      ; $0999D2 |
  inc   r2                                  ; $0999D3 |
  stop                                      ; $0999D4 |
  nop                                       ; $0999D5 |

  db $04, $04, $04                          ; $0999D6 |

  dw $9AC3, $9AD7, $9AEB                    ; $0999D9 |

  db $01, $02, $02, $02, $03, $04, $04, $05 ; $0999DF |
  db $04, $06, $06                          ; $0999E7 |

  dw $9A00, $9A05, $9A0F, $9A19             ; $0999EA |
  dw $9A23, $9A32, $9A46, $9A5A             ; $0999F2 |
  dw $9A73, $9A87, $9AA5                    ; $0999FA |

  db $01, $00, $0C, $22, $02                ; $099A00 |

  db $04, $FC, $0C, $22, $02, $03, $00, $00 ; $099A05 |
  db $A2, $02, $05, $F8                     ; $099A0D |

  db $0C, $22, $02, $03, $00, $00, $A2, $02 ; $099A11 |

  db $06, $F4, $0C, $22, $02, $03, $00, $00 ; $099A19 |
  db $A2, $02                               ; $099A21 |

  db $07, $F0, $0C, $22, $02, $04, $FC, $1A ; $099A23 |
  db $22, $00, $03, $00, $00, $A2, $02      ; $099A2B |

  db $04, $FC, $0A, $22, $00, $03, $00, $00 ; $099A32 |
  db $A2, $02, $05, $EC, $0C, $62, $02, $0B ; $099A3A |
  db $F8, $11, $22, $00                     ; $099A42 |

  db $FB, $F7, $08, $22, $02, $03, $00, $00 ; $099A46 |
  db $A2, $02, $03, $E8, $0C, $62, $02, $03 ; $099A4E |
  db $F0, $00, $22, $02                     ; $099A56 |

  db $F3, $F7, $06, $22, $02, $FB, $F7, $08 ; $099A5A |
  db $22, $02, $03, $00, $00, $A2, $02, $01 ; $099A62 |
  db $E4, $0C, $62, $02, $03, $F0, $00, $22 ; $099A6A |
  db $02                                    ; $099A72 |

  db $05, $04, $0E, $A2, $02, $05, $FC, $0E ; $099A73 |
  db $22, $02, $FD, $FC, $0E, $62, $02, $FD ; $099A7B |
  db $04, $0E, $E2, $02                     ; $099A83 |

  db $07, $07, $1B, $22, $00, $03, $07, $1B ; $099A87 |
  db $62, $00, $07, $06, $0E, $A2, $02, $07 ; $099A8F |
  db $FA, $0E, $22, $02, $FB, $FA, $0E, $62 ; $099A97 |
  db $02, $FB, $06, $0E, $E2, $02           ; $099A9F |

  db $09, $08, $1B, $22, $00, $01, $08, $1B ; $099AA5 |
  db $62, $00, $09, $08, $0E, $A2, $02, $09 ; $099AAD |
  db $F8, $0E, $22, $02, $F9, $F8, $0E, $62 ; $099AB5 |
  db $02, $F9, $08, $0E, $E2, $02           ; $099ABD |

  db $EC, $F7, $02, $22, $02, $FC, $F7, $04 ; $099AC3 |
  db $22, $02, $03, $00, $00, $A2, $02, $03 ; $099ACB |
  db $F0, $00, $22, $02                     ; $099AD3 |

  db $EC, $F9, $02, $22, $02, $FC, $F8, $04 ; $099AD7 |
  db $22, $02, $03, $00, $00, $A2, $02, $03 ; $099ADF |
  db $F0, $00, $22, $02                     ; $099AE7 |

  db $FC, $F9, $04, $22, $02, $EC, $FA, $02 ; $099AEB |
  db $22, $02, $03, $00, $00, $A2, $02, $03 ; $099AF3 |
  db $F0, $00, $22, $02                     ; $099AFB |

  db $00, $10, $20, $30, $30, $40, $50, $50 ; $099AFF |
  db $60, $60, $70, $70, $70, $80, $80, $80 ; $099B07 |
  db $80, $80, $80, $80, $80, $80, $80, $80 ; $099B0F |
  db $80, $70, $70, $60, $60, $50, $50, $40 ; $099B17 |
  db $40, $30, $20, $10                     ; $099B1F |

  sub   r0                                  ; $099B23 |
  sms   ($0000),r0                          ; $099B24 |
  iwt   r0,#$19D6                           ; $099B27 |
  add   r1                                  ; $099B2A |
  ldw   (r0)                                ; $099B2B |
  lsr                                       ; $099B2C |
  lsr                                       ; $099B2D |
  lsr                                       ; $099B2E |
  lsr                                       ; $099B2F |
  to r2                                     ; $099B30 |
  lsr                                       ; $099B31 |
  iwt   r0,#$19D8                           ; $099B32 |
  add   r1                                  ; $099B35 |
  to r3                                     ; $099B36 |
  ldw   (r0)                                ; $099B37 |
  iwt   r0,#$1A36                           ; $099B38 |
  add   r1                                  ; $099B3B |
  to r4                                     ; $099B3C |
  ldw   (r0)                                ; $099B3D |
  iwt   r0,#$1CD6                           ; $099B3E |
  add   r1                                  ; $099B41 |
  ldw   (r0)                                ; $099B42 |
  ibt   r5,#$0020                           ; $099B43 |
  to r5                                     ; $099B45 |
  sub   r5                                  ; $099B46 |
  iwt   r0,#$1182                           ; $099B47 |
  add   r1                                  ; $099B4A |
  ldw   (r0)                                ; $099B4B |
  to r6                                     ; $099B4C |
  add   #4                                  ; $099B4D |
  ibt   r7,#$001C                           ; $099B4F |
  ibt   r12,#$0000                          ; $099B51 |
  ibt   r13,#$0001                          ; $099B53 |
  ibt   r0,#$0009                           ; $099B55 |
  romb                                      ; $099B57 |
  cache                                     ; $099B59 |
  with r4                                   ; $099B5A |
  add   r4                                  ; $099B5B |
  with r3                                   ; $099B5C |
  rol                                       ; $099B5D |
  rol                                       ; $099B5E |
  with r4                                   ; $099B5F |
  add   r4                                  ; $099B60 |
  with r3                                   ; $099B61 |
  rol                                       ; $099B62 |
  rol                                       ; $099B63 |
  with r4                                   ; $099B64 |
  add   r4                                  ; $099B65 |
  with r3                                   ; $099B66 |
  rol                                       ; $099B67 |
  rol                                       ; $099B68 |
  to r11                                    ; $099B69 |
  and   #7                                  ; $099B6A |
  ibt   r0,#$0010                           ; $099B6C |
  to r8                                     ; $099B6E |
  sub   r11                                 ; $099B6F |
  lms   r0,($00AA)                          ; $099B70 |
  sub   #0                                  ; $099B73 |
  bmi CODE_099BB7                           ; $099B75 |
  nop                                       ; $099B77 |
  lms   r0,($011C)                          ; $099B78 |
  sub   r5                                  ; $099B7B |
  bmi CODE_099BB7                           ; $099B7C |
  nop                                       ; $099B7E |
  ibt   r9,#$0024                           ; $099B7F |
  sub   r9                                  ; $099B81 |
  bcs CODE_099BB7                           ; $099B82 |
  add   r9                                  ; $099B84 |
  moves r7,r7                               ; $099B85 |
  bmi CODE_099B8C                           ; $099B87 |
  from r9                                   ; $099B89 |
  sbc   r0                                  ; $099B8A |

CODE_099B8C:
  iwt   r14,#$9AFF                          ; $099B8C |
  to r14                                    ; $099B8F |
  add   r14                                 ; $099B90 |
  lms   r9,($0090)                          ; $099B91 |
  ibt   r0,#$0020                           ; $099B94 |
  to r10                                    ; $099B96 |
  add   r9                                  ; $099B97 |
  getb                                      ; $099B98 |
  umult r8                                  ; $099B99 |
  hib                                       ; $099B9B |
  from r6                                   ; $099B9C |
  sub   r0                                  ; $099B9D |
  sub   r10                                 ; $099B9E |
  bpl CODE_099BB7                           ; $099B9F |
  nop                                       ; $099BA1 |
  add   #9                                  ; $099BA2 |
  bmi CODE_099BB7                           ; $099BA4 |
  nop                                       ; $099BA6 |
  sub   #8                                  ; $099BA7 |
  add   r9                                  ; $099BA9 |
  sbk                                       ; $099BAA |
  iwt   r0,#$0100                           ; $099BAB |
  sms   ($00AA),r0                          ; $099BAE |
  sms   ($01B4),r0                          ; $099BB1 |
  with r11                                  ; $099BB4 |
  or    #8                                  ; $099BB5 |

CODE_099BB7:
  from r11                                  ; $099BB7 |
  and   #7                                  ; $099BB8 |
  sub   r11                                 ; $099BBA |
  bne CODE_099BC4                           ; $099BBB |
  add   r11                                 ; $099BBD |
  beq CODE_099BD4                           ; $099BBE |
  nop                                       ; $099BC0 |
  bra CODE_099BD4                           ; $099BC1 |

  dec   r0                                  ; $099BC3 |

CODE_099BC4:
  to r9                                     ; $099BC4 |
  sub   #7                                  ; $099BC5 |
  bcs CODE_099BD4                           ; $099BC7 |
  nop                                       ; $099BC9 |
  dec   r0                                  ; $099BCA |
  bpl CODE_099BD3                           ; $099BCB |
  inc   r0                                  ; $099BCD |
  ibt   r9,#$001D                           ; $099BCE |
  sms   ($0000),r9                          ; $099BD0 |

CODE_099BD3:
  inc   r0                                  ; $099BD3 |

CODE_099BD4:
  mult  #8                                  ; $099BD4 |
  add   r0                                  ; $099BD6 |
  add   r0                                  ; $099BD7 |
  swap                                      ; $099BD8 |
  add   r0                                  ; $099BD9 |
  with r13                                  ; $099BDA |
  rol                                       ; $099BDB |
  with r12                                  ; $099BDC |
  rol                                       ; $099BDD |
  add   r0                                  ; $099BDE |
  with r13                                  ; $099BDF |
  rol                                       ; $099BE0 |
  with r12                                  ; $099BE1 |
  rol                                       ; $099BE2 |
  add   r0                                  ; $099BE3 |
  with r13                                  ; $099BE4 |
  rol                                       ; $099BE5 |
  with r12                                  ; $099BE6 |
  rol                                       ; $099BE7 |
  with r5                                   ; $099BE8 |
  add   r7                                  ; $099BE9 |
  ibt   r0,#$FFE0                           ; $099BEA |
  to r6                                     ; $099BEC |
  add   r6                                  ; $099BED |
  with r7                                   ; $099BEE |
  not                                       ; $099BEF |
  dec   r2                                  ; $099BF0 |
  beq CODE_099BF8                           ; $099BF1 |
  inc   r7                                  ; $099BF3 |
  iwt   r15,#$9B5B                          ; $099BF4 |
  with r4                                   ; $099BF7 |

CODE_099BF8:
  with r13                                  ; $099BF8 |

CODE_099BF9:
  add   r13                                 ; $099BF9 |
  with r12                                  ; $099BFA |
  rol                                       ; $099BFB |
  bcc CODE_099BF9                           ; $099BFC |
  with r13                                  ; $099BFE |
  iwt   r0,#$19D8                           ; $099BFF |
  add   r1                                  ; $099C02 |
  from r12                                  ; $099C03 |
  stw   (r0)                                ; $099C04 |
  iwt   r0,#$1A36                           ; $099C05 |
  add   r1                                  ; $099C08 |
  from r13                                  ; $099C09 |
  stw   (r0)                                ; $099C0A |
  stop                                      ; $099C0B |
  nop                                       ; $099C0C |

  ibt   r0,#$0008                           ; $099C0D |
  romb                                      ; $099C0F |
  lm    r1,($1972)                          ; $099C11 |
  lms   r0,($003E)                          ; $099C15 |
  to r5                                     ; $099C18 |
  hib                                       ; $099C19 |
  iwt   r0,#$AE18                           ; $099C1A |
  to r14                                    ; $099C1D |
  add   r5                                  ; $099C1E |
  iwt   r0,#$1BB6                           ; $099C1F |
  add   r1                                  ; $099C22 |
  to r2                                     ; $099C23 |
  ldw   (r0)                                ; $099C24 |
  from r2                                   ; $099C25 |
  not                                       ; $099C26 |
  to r3                                     ; $099C27 |
  add   #1                                  ; $099C28 |
  iwt   r0,#$1BB8                           ; $099C2A |
  add   r1                                  ; $099C2D |
  to r4                                     ; $099C2E |
  ldw   (r0)                                ; $099C2F |
  to r6                                     ; $099C30 |
  getb                                      ; $099C31 |
  iwt   r0,#$AE58                           ; $099C32 |
  to r14                                    ; $099C35 |
  add   r5                                  ; $099C36 |
  to r7                                     ; $099C37 |
  getb                                      ; $099C38 |
  from r4                                   ; $099C39 |
  to r8                                     ; $099C3A |
  mult  r6                                  ; $099C3B |
  from r4                                   ; $099C3C |
  to r9                                     ; $099C3D |
  mult  r7                                  ; $099C3E |
  iwt   r11,#$0080                          ; $099C3F |
  from r3                                   ; $099C42 |
  mult  r6                                  ; $099C43 |
  add   r9                                  ; $099C44 |
  add   r0                                  ; $099C45 |
  add   r0                                  ; $099C46 |
  add   r11                                 ; $099C47 |
  hib                                       ; $099C48 |
  to r10                                    ; $099C49 |
  sex                                       ; $099C4A |
  iwt   r0,#$10E2                           ; $099C4B |
  add   r1                                  ; $099C4E |
  ldw   (r0)                                ; $099C4F |
  add   r10                                 ; $099C50 |
  sms   ($0000),r0                          ; $099C51 |
  from r3                                   ; $099C54 |
  mult  r7                                  ; $099C55 |
  from r8                                   ; $099C56 |
  sub   r0                                  ; $099C57 |
  add   r0                                  ; $099C58 |
  add   r0                                  ; $099C59 |
  add   r11                                 ; $099C5A |
  hib                                       ; $099C5B |
  to r10                                    ; $099C5C |
  sex                                       ; $099C5D |
  iwt   r0,#$1182                           ; $099C5E |
  add   r1                                  ; $099C61 |
  ldw   (r0)                                ; $099C62 |
  add   r10                                 ; $099C63 |
  sms   ($0002),r0                          ; $099C64 |
  from r2                                   ; $099C67 |
  mult  r6                                  ; $099C68 |
  add   r9                                  ; $099C69 |
  add   r0                                  ; $099C6A |
  add   r0                                  ; $099C6B |
  add   r11                                 ; $099C6C |
  hib                                       ; $099C6D |
  to r10                                    ; $099C6E |
  sex                                       ; $099C6F |
  iwt   r0,#$10E2                           ; $099C70 |
  add   r1                                  ; $099C73 |
  ldw   (r0)                                ; $099C74 |
  add   r10                                 ; $099C75 |
  sms   ($0004),r0                          ; $099C76 |
  from r2                                   ; $099C79 |
  mult  r7                                  ; $099C7A |
  from r8                                   ; $099C7B |
  sub   r0                                  ; $099C7C |
  add   r0                                  ; $099C7D |
  add   r0                                  ; $099C7E |
  add   r11                                 ; $099C7F |
  hib                                       ; $099C80 |
  to r10                                    ; $099C81 |
  sex                                       ; $099C82 |
  iwt   r0,#$1182                           ; $099C83 |
  add   r1                                  ; $099C86 |
  ldw   (r0)                                ; $099C87 |
  add   r10                                 ; $099C88 |
  sms   ($0006),r0                          ; $099C89 |
  lms   r8,($0000)                          ; $099C8C |
  lms   r9,($0004)                          ; $099C8F |
  lm    r10,($011C)                         ; $099C92 |
  from r10                                  ; $099C96 |
  to r7                                     ; $099C97 |
  sub   r8                                  ; $099C98 |
  bmi CODE_099D18                           ; $099C99 |
  from r10                                  ; $099C9B |
  sub   r9                                  ; $099C9C |
  bpl CODE_099D18                           ; $099C9D |
  nop                                       ; $099C9F |
  lm    r0,($00AA)                          ; $099CA0 |
  sub   #0                                  ; $099CA4 |
  bmi CODE_099D18                           ; $099CA6 |
  nop                                       ; $099CA8 |
  from r9                                   ; $099CA9 |
  sub   r8                                  ; $099CAA |
  to r9                                     ; $099CAB |
  add   r0                                  ; $099CAC |
  iwt   r0,#$2200                           ; $099CAD |
  add   r9                                  ; $099CB0 |
  to r6                                     ; $099CB1 |
  ldw   (r0)                                ; $099CB2 |
  lms   r8,($0002)                          ; $099CB3 |
  lms   r0,($0006)                          ; $099CB6 |
  sub   r8                                  ; $099CB9 |
  lob                                       ; $099CBA |
  swap                                      ; $099CBB |
  to r6                                     ; $099CBC |
  fmult                                     ; $099CBD |
  from r7                                   ; $099CBE |
  lob                                       ; $099CBF |
  swap                                      ; $099CC0 |
  fmult                                     ; $099CC1 |
  to r8                                     ; $099CC2 |
  add   r8                                  ; $099CC3 |
  ibt   r6,#$0020                           ; $099CC4 |
  lm    r7,($0090)                          ; $099CC6 |
  from r7                                   ; $099CCA |
  add   r6                                  ; $099CCB |
  sub   r8                                  ; $099CCC |
  bmi CODE_099D18                           ; $099CCD |
  nop                                       ; $099CCF |
  move  r8,r0                               ; $099CD0 |
  sub   #9                                  ; $099CD2 |
  bpl CODE_099D18                           ; $099CD4 |
  nop                                       ; $099CD6 |
  from r7                                   ; $099CD7 |
  sub   r8                                  ; $099CD8 |
  sm    ($0090),r0                          ; $099CD9 |
  ibt   r0,#$0001                           ; $099CDD |
  sm    ($01B4),r0                          ; $099CDF |
  iwt   r0,#$0100                           ; $099CE3 |
  sm    ($00AA),r0                          ; $099CE6 |
  iwt   r0,#$19D8                           ; $099CEA |
  add   r1                                  ; $099CED |
  to r6                                     ; $099CEE |
  ldw   (r0)                                ; $099CEF |
  iwt   r0,#$1978                           ; $099CF0 |
  add   r1                                  ; $099CF3 |
  to r7                                     ; $099CF4 |
  ldw   (r0)                                ; $099CF5 |
  lm    r0,($011C)                          ; $099CF6 |
  sub   r7                                  ; $099CFA |
  div2                                      ; $099CFB |
  div2                                      ; $099CFD |
  nop                                       ; $099CFF |
  nop                                       ; $099D00 |
  with r6                                   ; $099D01 |
  add   r0                                  ; $099D02 |
  iwt   r0,#$19D8                           ; $099D03 |
  add   r1                                  ; $099D06 |
  from r6                                   ; $099D07 |
  stw   (r0)                                ; $099D08 |
  iwt   r0,#$1976                           ; $099D09 |
  add   r1                                  ; $099D0C |
  ldw   (r0)                                ; $099D0D |
  hib                                       ; $099D0E |
  cmp   r5                                  ; $099D0F |
  bne CODE_099D1C                           ; $099D11 |
  nop                                       ; $099D13 |
  ibt   r0,#$0001                           ; $099D14 |
  stop                                      ; $099D16 |
  nop                                       ; $099D17 |

CODE_099D18:
  ibt   r0,#$0000                           ; $099D18 |
  stop                                      ; $099D1A |
  nop                                       ; $099D1B |

CODE_099D1C:
  from r5                                   ; $099D1C |
  not                                       ; $099D1D |
  inc   r0                                  ; $099D1E |
  to r5                                     ; $099D1F |
  lob                                       ; $099D20 |
  iwt   r0,#$AE18                           ; $099D21 |
  to r14                                    ; $099D24 |
  add   r5                                  ; $099D25 |
  lm    r8,($008C)                          ; $099D26 |
  iwt   r0,#$10E2                           ; $099D2A |
  add   r1                                  ; $099D2D |
  to r12                                    ; $099D2E |
  ldw   (r0)                                ; $099D2F |
  with r8                                   ; $099D30 |
  sub   r12                                 ; $099D31 |
  lm    r9,($0090)                          ; $099D32 |
  iwt   r0,#$1182                           ; $099D36 |
  add   r1                                  ; $099D39 |
  to r13                                    ; $099D3A |
  ldw   (r0)                                ; $099D3B |
  with r9                                   ; $099D3C |
  sub   r13                                 ; $099D3D |
  to r6                                     ; $099D3E |
  getb                                      ; $099D3F |
  iwt   r0,#$AE58                           ; $099D40 |
  to r14                                    ; $099D43 |
  add   r5                                  ; $099D44 |
  from r8                                   ; $099D45 |
  to r10                                    ; $099D46 |
  mult  r6                                  ; $099D47 |
  from r9                                   ; $099D48 |
  to r11                                    ; $099D49 |
  mult  r6                                  ; $099D4A |
  to r7                                     ; $099D4B |
  getb                                      ; $099D4C |
  iwt   r2,#$0080                           ; $099D4D |
  from r9                                   ; $099D50 |
  mult  r7                                  ; $099D51 |
  add   r10                                 ; $099D52 |
  add   r0                                  ; $099D53 |
  add   r0                                  ; $099D54 |
  add   r2                                  ; $099D55 |
  hib                                       ; $099D56 |
  to r10                                    ; $099D57 |
  sex                                       ; $099D58 |
  from r8                                   ; $099D59 |
  mult  r7                                  ; $099D5A |
  from r11                                  ; $099D5B |
  sub   r0                                  ; $099D5C |
  add   r0                                  ; $099D5D |
  add   r0                                  ; $099D5E |
  add   r2                                  ; $099D5F |
  hib                                       ; $099D60 |
  to r11                                    ; $099D61 |
  sex                                       ; $099D62 |
  iwt   r0,#$1976                           ; $099D63 |
  add   r1                                  ; $099D66 |
  ldw   (r0)                                ; $099D67 |
  to r5                                     ; $099D68 |
  hib                                       ; $099D69 |
  iwt   r0,#$AE18                           ; $099D6A |
  to r14                                    ; $099D6D |
  add   r5                                  ; $099D6E |
  to r6                                     ; $099D6F |
  getb                                      ; $099D70 |
  iwt   r0,#$AE58                           ; $099D71 |
  to r14                                    ; $099D74 |
  add   r5                                  ; $099D75 |
  from r10                                  ; $099D76 |
  to r8                                     ; $099D77 |
  mult  r6                                  ; $099D78 |
  from r11                                  ; $099D79 |
  to r9                                     ; $099D7A |
  mult  r6                                  ; $099D7B |
  to r7                                     ; $099D7C |
  getb                                      ; $099D7D |
  from r11                                  ; $099D7E |
  mult  r7                                  ; $099D7F |
  add   r8                                  ; $099D80 |
  add   r0                                  ; $099D81 |
  add   r0                                  ; $099D82 |
  add   r2                                  ; $099D83 |
  hib                                       ; $099D84 |
  sex                                       ; $099D85 |
  add   r12                                 ; $099D86 |
  sm    ($008C),r0                          ; $099D87 |
  from r10                                  ; $099D8B |
  mult  r7                                  ; $099D8C |
  from r9                                   ; $099D8D |
  sub   r0                                  ; $099D8E |
  add   r0                                  ; $099D8F |
  add   r0                                  ; $099D90 |
  add   r2                                  ; $099D91 |
  hib                                       ; $099D92 |
  sex                                       ; $099D93 |
  add   r13                                 ; $099D94 |
  sm    ($0090),r0                          ; $099D95 |
  ibt   r0,#$0001                           ; $099D99 |
  stop                                      ; $099D9B |
  nop                                       ; $099D9C |
  ibt   r0,#$0008                           ; $099D9D |
  romb                                      ; $099D9F |
  lm    r1,($1972)                          ; $099DA1 |
  lms   r0,($003E)                          ; $099DA5 |
  to r5                                     ; $099DA8 |
  hib                                       ; $099DA9 |
  iwt   r0,#$AE18                           ; $099DAA |
  to r14                                    ; $099DAD |
  add   r5                                  ; $099DAE |
  iwt   r0,#$1BB6                           ; $099DAF |
  add   r1                                  ; $099DB2 |
  to r2                                     ; $099DB3 |
  ldw   (r0)                                ; $099DB4 |
  from r2                                   ; $099DB5 |
  not                                       ; $099DB6 |
  to r3                                     ; $099DB7 |
  add   #1                                  ; $099DB8 |
  iwt   r0,#$1BB8                           ; $099DBA |
  add   r1                                  ; $099DBD |
  to r4                                     ; $099DBE |
  ldw   (r0)                                ; $099DBF |
  to r6                                     ; $099DC0 |
  getb                                      ; $099DC1 |
  iwt   r0,#$AE58                           ; $099DC2 |
  to r14                                    ; $099DC5 |
  add   r5                                  ; $099DC6 |
  to r7                                     ; $099DC7 |
  getb                                      ; $099DC8 |
  from r4                                   ; $099DC9 |
  to r8                                     ; $099DCA |
  mult  r6                                  ; $099DCB |
  from r4                                   ; $099DCC |
  to r9                                     ; $099DCD |
  mult  r7                                  ; $099DCE |
  iwt   r11,#$0080                          ; $099DCF |
  from r3                                   ; $099DD2 |
  mult  r6                                  ; $099DD3 |
  add   r9                                  ; $099DD4 |
  add   r0                                  ; $099DD5 |
  add   r0                                  ; $099DD6 |
  add   r11                                 ; $099DD7 |
  hib                                       ; $099DD8 |
  to r10                                    ; $099DD9 |
  sex                                       ; $099DDA |
  iwt   r0,#$10E2                           ; $099DDB |
  add   r1                                  ; $099DDE |
  ldw   (r0)                                ; $099DDF |
  add   r10                                 ; $099DE0 |
  sms   ($0000),r0                          ; $099DE1 |
  from r3                                   ; $099DE4 |
  mult  r7                                  ; $099DE5 |
  from r8                                   ; $099DE6 |
  sub   r0                                  ; $099DE7 |
  add   r0                                  ; $099DE8 |
  add   r0                                  ; $099DE9 |
  add   r11                                 ; $099DEA |
  hib                                       ; $099DEB |
  to r10                                    ; $099DEC |
  sex                                       ; $099DED |
  iwt   r0,#$1182                           ; $099DEE |
  add   r1                                  ; $099DF1 |
  ldw   (r0)                                ; $099DF2 |
  add   r10                                 ; $099DF3 |
  sms   ($0002),r0                          ; $099DF4 |
  from r2                                   ; $099DF7 |
  mult  r6                                  ; $099DF8 |
  add   r9                                  ; $099DF9 |
  add   r0                                  ; $099DFA |
  add   r0                                  ; $099DFB |
  add   r11                                 ; $099DFC |
  hib                                       ; $099DFD |
  to r10                                    ; $099DFE |
  sex                                       ; $099DFF |
  iwt   r0,#$10E2                           ; $099E00 |
  add   r1                                  ; $099E03 |
  ldw   (r0)                                ; $099E04 |
  add   r10                                 ; $099E05 |
  sms   ($0004),r0                          ; $099E06 |
  from r2                                   ; $099E09 |
  mult  r7                                  ; $099E0A |
  from r8                                   ; $099E0B |
  sub   r0                                  ; $099E0C |
  add   r0                                  ; $099E0D |
  add   r0                                  ; $099E0E |
  add   r11                                 ; $099E0F |
  hib                                       ; $099E10 |
  to r10                                    ; $099E11 |
  sex                                       ; $099E12 |
  iwt   r0,#$1182                           ; $099E13 |
  add   r1                                  ; $099E16 |
  ldw   (r0)                                ; $099E17 |
  add   r10                                 ; $099E18 |
  sms   ($0006),r0                          ; $099E19 |
  lms   r8,($0000)                          ; $099E1C |
  lms   r9,($0004)                          ; $099E1F |
  lm    r10,($1CD6)                         ; $099E22 |
  from r10                                  ; $099E26 |
  to r7                                     ; $099E27 |
  sub   r8                                  ; $099E28 |
  bmi CODE_099E9C                           ; $099E29 |
  from r10                                  ; $099E2B |
  sub   r9                                  ; $099E2C |
  bpl CODE_099E9C                           ; $099E2D |
  nop                                       ; $099E2F |
  lm    r0,($1222)                          ; $099E30 |
  sub   #0                                  ; $099E34 |
  bmi CODE_099E9C                           ; $099E36 |
  nop                                       ; $099E38 |
  from r9                                   ; $099E39 |
  sub   r8                                  ; $099E3A |
  to r9                                     ; $099E3B |
  add   r0                                  ; $099E3C |
  iwt   r0,#$2200                           ; $099E3D |
  add   r9                                  ; $099E40 |
  to r6                                     ; $099E41 |
  ldw   (r0)                                ; $099E42 |
  lms   r8,($0002)                          ; $099E43 |
  lms   r0,($0006)                          ; $099E46 |
  sub   r8                                  ; $099E49 |
  lob                                       ; $099E4A |
  swap                                      ; $099E4B |
  to r6                                     ; $099E4C |
  fmult                                     ; $099E4D |
  from r7                                   ; $099E4E |
  lob                                       ; $099E4F |
  swap                                      ; $099E50 |
  fmult                                     ; $099E51 |
  to r8                                     ; $099E52 |
  add   r8                                  ; $099E53 |
  ibt   r6,#$0020                           ; $099E54 |
  lm    r7,($1182)                          ; $099E56 |
  from r7                                   ; $099E5A |
  add   r6                                  ; $099E5B |
  sub   r8                                  ; $099E5C |
  bmi CODE_099E9C                           ; $099E5D |
  nop                                       ; $099E5F |
  move  r8,r0                               ; $099E60 |
  sub   #9                                  ; $099E62 |
  bpl CODE_099E9C                           ; $099E64 |
  nop                                       ; $099E66 |
  from r7                                   ; $099E67 |
  sub   r8                                  ; $099E68 |
  sm    ($1182),r0                          ; $099E69 |
  iwt   r0,#$0100                           ; $099E6D |
  sm    ($1222),r0                          ; $099E70 |
  iwt   r0,#$19D8                           ; $099E74 |
  add   r1                                  ; $099E77 |
  to r6                                     ; $099E78 |
  ldw   (r0)                                ; $099E79 |
  iwt   r0,#$1978                           ; $099E7A |
  add   r1                                  ; $099E7D |
  to r7                                     ; $099E7E |
  ldw   (r0)                                ; $099E7F |
  lm    r0,($1CD6)                          ; $099E80 |
  sub   r7                                  ; $099E84 |
  with r6                                   ; $099E85 |
  add   r0                                  ; $099E86 |
  iwt   r0,#$19D8                           ; $099E87 |
  add   r1                                  ; $099E8A |
  from r6                                   ; $099E8B |
  stw   (r0)                                ; $099E8C |
  iwt   r0,#$1976                           ; $099E8D |
  add   r1                                  ; $099E90 |
  ldw   (r0)                                ; $099E91 |
  hib                                       ; $099E92 |
  cmp   r5                                  ; $099E93 |
  bne CODE_099EA0                           ; $099E95 |
  nop                                       ; $099E97 |
  ibt   r0,#$0001                           ; $099E98 |
  stop                                      ; $099E9A |
  nop                                       ; $099E9B |

CODE_099E9C:
  ibt   r0,#$0000                           ; $099E9C |
  stop                                      ; $099E9E |
  nop                                       ; $099E9F |

CODE_099EA0:
  from r5                                   ; $099EA0 |
  not                                       ; $099EA1 |
  inc   r0                                  ; $099EA2 |
  to r5                                     ; $099EA3 |
  lob                                       ; $099EA4 |
  iwt   r0,#$AE18                           ; $099EA5 |
  to r14                                    ; $099EA8 |
  add   r5                                  ; $099EA9 |
  lm    r8,($10E2)                          ; $099EAA |
  iwt   r0,#$10E2                           ; $099EAE |
  add   r1                                  ; $099EB1 |
  to r12                                    ; $099EB2 |
  ldw   (r0)                                ; $099EB3 |
  with r8                                   ; $099EB4 |
  sub   r12                                 ; $099EB5 |
  lm    r9,($1182)                          ; $099EB6 |
  iwt   r0,#$1182                           ; $099EBA |
  add   r1                                  ; $099EBD |
  to r13                                    ; $099EBE |
  ldw   (r0)                                ; $099EBF |
  with r9                                   ; $099EC0 |
  sub   r13                                 ; $099EC1 |
  to r6                                     ; $099EC2 |
  getb                                      ; $099EC3 |
  iwt   r0,#$AE58                           ; $099EC4 |
  to r14                                    ; $099EC7 |
  add   r5                                  ; $099EC8 |
  from r8                                   ; $099EC9 |
  to r10                                    ; $099ECA |
  mult  r6                                  ; $099ECB |
  from r9                                   ; $099ECC |
  to r11                                    ; $099ECD |
  mult  r6                                  ; $099ECE |
  to r7                                     ; $099ECF |
  getb                                      ; $099ED0 |
  iwt   r2,#$0080                           ; $099ED1 |
  from r9                                   ; $099ED4 |
  mult  r7                                  ; $099ED5 |
  add   r10                                 ; $099ED6 |
  add   r0                                  ; $099ED7 |
  add   r0                                  ; $099ED8 |
  add   r2                                  ; $099ED9 |
  hib                                       ; $099EDA |
  to r10                                    ; $099EDB |
  sex                                       ; $099EDC |
  from r8                                   ; $099EDD |
  mult  r7                                  ; $099EDE |
  from r11                                  ; $099EDF |
  sub   r0                                  ; $099EE0 |
  add   r0                                  ; $099EE1 |
  add   r0                                  ; $099EE2 |
  add   r2                                  ; $099EE3 |
  hib                                       ; $099EE4 |
  to r11                                    ; $099EE5 |
  sex                                       ; $099EE6 |
  iwt   r0,#$1976                           ; $099EE7 |
  add   r1                                  ; $099EEA |
  ldw   (r0)                                ; $099EEB |
  to r5                                     ; $099EEC |
  hib                                       ; $099EED |
  iwt   r0,#$AE18                           ; $099EEE |
  to r14                                    ; $099EF1 |
  add   r5                                  ; $099EF2 |
  to r6                                     ; $099EF3 |
  getb                                      ; $099EF4 |
  iwt   r0,#$AE58                           ; $099EF5 |
  to r14                                    ; $099EF8 |
  add   r5                                  ; $099EF9 |
  from r10                                  ; $099EFA |
  to r8                                     ; $099EFB |
  mult  r6                                  ; $099EFC |
  from r11                                  ; $099EFD |
  to r9                                     ; $099EFE |
  mult  r6                                  ; $099EFF |
  to r7                                     ; $099F00 |
  getb                                      ; $099F01 |
  from r11                                  ; $099F02 |
  mult  r7                                  ; $099F03 |
  add   r8                                  ; $099F04 |
  add   r0                                  ; $099F05 |
  add   r0                                  ; $099F06 |
  add   r2                                  ; $099F07 |
  hib                                       ; $099F08 |
  sex                                       ; $099F09 |
  add   r12                                 ; $099F0A |
  sm    ($10E2),r0                          ; $099F0B |
  from r10                                  ; $099F0F |
  mult  r7                                  ; $099F10 |
  from r9                                   ; $099F11 |
  sub   r0                                  ; $099F12 |
  add   r0                                  ; $099F13 |
  add   r0                                  ; $099F14 |
  add   r2                                  ; $099F15 |
  hib                                       ; $099F16 |
  sex                                       ; $099F17 |
  add   r13                                 ; $099F18 |
  sm    ($1182),r0                          ; $099F19 |
  ibt   r0,#$0001                           ; $099F1D |
  stop                                      ; $099F1F |
  nop                                       ; $099F20 |

gsu_calc_snowy_platform_coords:
  ibt   r0,#$0008                           ; $099F21 |\ $08xxxx ROM
  romb                                      ; $099F23 |/
  lm    r1,($1972)                          ; $099F25 | sprite slot index
  iwt   r0,#$1976                           ; $099F29 |\
  add   r1                                  ; $099F2C | | r2 = $16,x
  ldw   (r0)                                ; $099F2D | | (only high byte)
  to r2                                     ; $099F2E | | this is the angle
  hib                                       ; $099F2F |/
  iwt   r0,#$AE18                           ; $099F30 |\
  to r14                                    ; $099F33 | | cos(r2)
  add   r2                                  ; $099F34 |/
  iwt   r0,#$1A36                           ; $099F35 |\
  add   r1                                  ; $099F38 | | r3 = $7A36,x
  to r3                                     ; $099F39 | | x scale
  ldw   (r0)                                ; $099F3A |/
  iwt   r0,#$1978                           ; $099F3B |\
  add   r1                                  ; $099F3E | | r12 = $18,x
  to r12                                    ; $099F3F | | x scale offset
  ldw   (r0)                                ; $099F40 |/
  with r3                                   ; $099F41 |\ r3 = $7A36,x - $18,x
  sub   r12                                 ; $099F42 |/
  iwt   r0,#$1A38                           ; $099F43 |\
  add   r1                                  ; $099F46 | | r4 = $7A38,x
  to r4                                     ; $099F47 | | y scale
  ldw   (r0)                                ; $099F48 |/
  iwt   r0,#$19D6                           ; $099F49 |\
  add   r1                                  ; $099F4C | | r13 = $76,x
  to r13                                    ; $099F4D | | y scale offset
  ldw   (r0)                                ; $099F4E |/
  with r4                                   ; $099F4F |\ r4 = $7A38,x - $76,x
  sub   r13                                 ; $099F50 |/
  to r5                                     ; $099F51 |\ r5 = cos($16,x)
  getb                                      ; $099F52 |/
  iwt   r0,#$AE58                           ; $099F53 |\
  to r14                                    ; $099F56 | | sin(r2)
  add   r2                                  ; $099F57 |/
  from r3                                   ; $099F58 |\
  to r8                                     ; $099F59 | | r8 = cos($16,x) * ($7A36,x - $18,x)
  mult  r5                                  ; $099F5A |/
  from r4                                   ; $099F5B |\
  to r9                                     ; $099F5C | | r9 = cos($16,x) * ($7A38,x - $76,x)
  mult  r5                                  ; $099F5D |/
  to r7                                     ; $099F5E |\ r7 = sin($16,x)
  getb                                      ; $099F5F |/
  iwt   r10,#$0080                          ; $099F60 |\
  from r4                                   ; $099F63 | | r10 = (($7A38,x - $76,x)
  mult  r7                                  ; $099F64 | | * sin($16,x)
  add   r8                                  ; $099F65 | | + cos($16,x) * ($7A36,x - $18,x))
  add   r0                                  ; $099F66 | | * 4
  add   r0                                  ; $099F67 | |
  add   r10                                 ; $099F68 | | + $80
  hib                                       ; $099F69 | | only high byte
  sex                                       ; $099F6A | |
  to r10                                    ; $099F6B | | + $18,x
  add   r12                                 ; $099F6C |/
  iwt   r0,#$10E2                           ; $099F6D |\
  add   r1                                  ; $099F70 | | r0 = $70E2,x
  ldw   (r0)                                ; $099F71 |/  X coordinate
  from r10                                  ; $099F72 |\
  to r11                                    ; $099F73 | | r11 = big equation above - prev X coord
  sub   r0                                  ; $099F74 |/
  iwt   r0,#$12C0                           ; $099F75 |\
  add   r1                                  ; $099F78 | | store r11 -> $72C0,x
  from r11                                  ; $099F79 | | new X delta
  stw   (r0)                                ; $099F7A |/
  iwt   r0,#$10E2                           ; $099F7B |\
  add   r1                                  ; $099F7E | | store big equation -> $70E2,x
  from r10                                  ; $099F7F | | new X coord
  stw   (r0)                                ; $099F80 |/
  iwt   r10,#$0080                          ; $099F81 |\
  from r3                                   ; $099F84 | | r10 = (-($7A36,x - $18,x)
  mult  r7                                  ; $099F85 | | * sin($16,x)
  from r9                                   ; $099F86 | | + cos($16,x) * ($7A38,x - $76,x)
  sub   r0                                  ; $099F87 | |
  add   r0                                  ; $099F88 | | * 4
  add   r0                                  ; $099F89 | |
  add   r10                                 ; $099F8A | | + $80
  hib                                       ; $099F8B | | only high byte
  sex                                       ; $099F8C | |
  to r10                                    ; $099F8D | | + $76,x
  add   r13                                 ; $099F8E |/
  iwt   r0,#$1182                           ; $099F8F |\
  add   r1                                  ; $099F92 | | r0 = $7182,x
  ldw   (r0)                                ; $099F93 |/  Y coordinate
  from r10                                  ; $099F94 |\
  to r11                                    ; $099F95 | | r11 = big equation - prev Y coord
  sub   r0                                  ; $099F96 |/
  iwt   r0,#$12C2                           ; $099F97 |\
  add   r1                                  ; $099F9A | | store r11 -> $72C2,x
  from r11                                  ; $099F9B | | new Y delta
  stw   (r0)                                ; $099F9C |/
  iwt   r0,#$1182                           ; $099F9D |\
  add   r1                                  ; $099FA0 | | store big equation -> $7182,x
  from r10                                  ; $099FA1 | | new Y coord
  stw   (r0)                                ; $099FA2 |/
  stop                                      ; $099FA3 |
  nop                                       ; $099FA4 |

  ibt   r1,#$FFFF                           ; $099FA5 |
  iwt   r2,#$0F00                           ; $099FA7 |
  iwt   r3,#$1360                           ; $099FAA |
  iwt   r4,#$0010                           ; $099FAD |
  ibt   r5,#$FFFF                           ; $099FB0 |
  ibt   r6,#$FFFF                           ; $099FB2 |
  ibt   r7,#$0000                           ; $099FB4 |
  iwt   r0,#$1CD6                           ; $099FB6 |
  add   r10                                 ; $099FB9 |
  to r8                                     ; $099FBA |
  ldw   (r0)                                ; $099FBB |
  iwt   r0,#$1CD8                           ; $099FBC |
  add   r10                                 ; $099FBF |
  to r9                                     ; $099FC0 |
  ldw   (r0)                                ; $099FC1 |
  cache                                     ; $099FC2 |
  ibt   r12,#$0018                          ; $099FC3 |
  move  r13,r15                             ; $099FC5 |
  ldw   (r2)                                ; $099FC7 |
  sub   r4                                  ; $099FC8 |
  bne CODE_09A01D                           ; $099FC9 |
  nop                                       ; $099FCB |
  ldw   (r3)                                ; $099FCC |
  cmp   r14                                 ; $099FCD |
  bcc CODE_09A01D                           ; $099FCF |
  nop                                       ; $099FD1 |
  cmp   r11                                 ; $099FD2 |
  bcs CODE_09A01D                           ; $099FD4 |
  nop                                       ; $099FD6 |
  iwt   r0,#$1D38                           ; $099FD7 |
  add   r7                                  ; $099FDA |
  ldw   (r0)                                ; $099FDB |
  sub   #0                                  ; $099FDC |
  bne CODE_09A01D                           ; $099FDE |
  nop                                       ; $099FE0 |
  iwt   r0,#$19D8                           ; $099FE1 |
  add   r7                                  ; $099FE4 |
  ldb   (r0)                                ; $099FE5 |
  sex                                       ; $099FE7 |
  bmi CODE_09A01D                           ; $099FE8 |
  nop                                       ; $099FEA |
  iwt   r0,#$1A36                           ; $099FEB |
  add   r7                                  ; $099FEE |
  ldw   (r0)                                ; $099FEF |
  sub   #0                                  ; $099FF0 |
  bne CODE_09A01D                           ; $099FF2 |
  nop                                       ; $099FF4 |
  iwt   r0,#$1CD6                           ; $099FF5 |
  add   r7                                  ; $099FF8 |
  ldw   (r0)                                ; $099FF9 |
  to r10                                    ; $099FFA |
  sub   r8                                  ; $099FFB |
  bpl CODE_09A002                           ; $099FFC |
  with r10                                  ; $099FFE |
  not                                       ; $099FFF |
  inc   r10                                 ; $09A000 |
  from r10                                  ; $09A001 |

CODE_09A002:
  cmp   r5                                  ; $09A002 |
  bcs CODE_09A01D                           ; $09A004 |
  nop                                       ; $09A006 |
  iwt   r0,#$1CD8                           ; $09A007 |
  add   r7                                  ; $09A00A |
  ldw   (r0)                                ; $09A00B |
  sub   r9                                  ; $09A00C |
  bpl CODE_09A012                           ; $09A00D |
  nop                                       ; $09A00F |
  not                                       ; $09A010 |
  inc   r0                                  ; $09A011 |

CODE_09A012:
  cmp   r6                                  ; $09A012 |
  bcs CODE_09A01D                           ; $09A014 |
  nop                                       ; $09A016 |
  move  r6,r0                               ; $09A017 |
  move  r5,r10                              ; $09A019 |
  move  r1,r7                               ; $09A01B |

CODE_09A01D:
  with r2                                   ; $09A01D |
  add   #4                                  ; $09A01E |
  with r3                                   ; $09A020 |
  add   #4                                  ; $09A021 |
  with r7                                   ; $09A023 |
  add   #4                                  ; $09A024 |
  loop                                      ; $09A026 |
  nop                                       ; $09A027 |
  stop                                      ; $09A028 |
  nop                                       ; $09A029 |

  ibt   r4,#$0006                           ; $09A02A |
  cache                                     ; $09A02C |
  ibt   r12,#$001D                          ; $09A02D |
  move  r13,r15                             ; $09A02F |
  ldw   (r3)                                ; $09A031 |
  add   r1                                  ; $09A032 |
  sbk                                       ; $09A033 |
  inc   r3                                  ; $09A034 |
  inc   r3                                  ; $09A035 |
  ldw   (r3)                                ; $09A036 |
  add   r2                                  ; $09A037 |
  with r3                                   ; $09A038 |
  add   r4                                  ; $09A039 |
  loop                                      ; $09A03A |
  sbk                                       ; $09A03B |
  stop                                      ; $09A03C |
  nop                                       ; $09A03D |

  db $04, $00, $F0, $F0, $00, $F0, $F0, $00 ; $09A03E |
  db $00, $00, $00, $00, $F0, $00, $00, $F0 ; $09A046 |
  db $F0, $F0, $FC, $00, $00, $F0, $F0, $F0 ; $09A04E |
  db $00, $00, $F0, $00, $F0, $00, $00, $00 ; $09A056 |
  db $F0, $F0, $00, $F0, $DB, $92, $0C, $00 ; $09A05E |
  db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0 ; $09A066 |
  db $F4, $F0, $E4, $00, $F4, $00, $05, $8D ; $09A06E |
  db $F6, $8D, $19, $8D, $10, $9C, $F0, $F0 ; $09A076 |
  db $00, $F0, $F0, $00, $00, $00, $21, $C8 ; $09A07E |
  db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00 ; $09A086 |
  db $2C, $00, $00, $6E, $DE, $92, $0C, $00 ; $09A08E |
  db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0 ; $09A096 |
  db $F4, $F0, $E4, $00, $F4, $00, $05, $8D ; $09A09E |
  db $F6, $8D, $14, $8D, $18, $9C, $F0, $F0 ; $09A0A6 |
  db $00, $F0, $F0, $00, $00, $00, $28, $C8 ; $09A0AE |
  db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00 ; $09A0B6 |
  db $2C, $00, $00, $6E, $E4, $92, $0C, $00 ; $09A0BE |
  db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0 ; $09A0C6 |
  db $F4, $F0, $E4, $00, $F4, $00, $06, $8D ; $09A0CE |
  db $F7, $8D, $0B, $8D, $1E, $9C, $F0, $F0 ; $09A0D6 |
  db $00, $F0, $F0, $00, $00, $00, $30, $C8 ; $09A0DE |
  db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00 ; $09A0E6 |
  db $2C, $00, $00, $6E, $EE, $92, $0C, $00 ; $09A0EE |
  db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0 ; $09A0F6 |
  db $F4, $F0, $E4, $00, $F4, $00, $07, $8D ; $09A0FE |
  db $F8, $8D, $FF, $8D, $22, $9C, $F0, $F0 ; $09A106 |
  db $00, $F0, $F0, $00, $00, $00, $36, $C8 ; $09A10E |
  db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00 ; $09A116 |
  db $2C, $00, $00, $6E                     ; $09A11E |

  cache                                     ; $09A122 |
  lm    r1,($1972)                          ; $09A123 |
  lms   r11,($0092)                         ; $09A127 |
  ibt   r0,#$0008                           ; $09A12A |
  romb                                      ; $09A12C |
  iwt   r0,#$1976                           ; $09A12E |
  add   r1                                  ; $09A131 |
  ldw   (r0)                                ; $09A132 |
  not                                       ; $09A133 |
  inc   r0                                  ; $09A134 |
  to r4                                     ; $09A135 |
  hib                                       ; $09A136 |
  iwt   r0,#$AE18                           ; $09A137 |
  to r14                                    ; $09A13A |
  add   r4                                  ; $09A13B |
  iwt   r5,#$AE58                           ; $09A13C |
  getbs                                     ; $09A13F |
  from r5                                   ; $09A141 |
  to r14                                    ; $09A142 |
  add   r4                                  ; $09A143 |
  add   r0                                  ; $09A144 |
  to r2                                     ; $09A145 |
  add   r0                                  ; $09A146 |
  getbs                                     ; $09A147 |
  add   r0                                  ; $09A149 |
  to r3                                     ; $09A14A |
  add   r0                                  ; $09A14B |
  ibt   r0,#$0009                           ; $09A14C |
  romb                                      ; $09A14E |
  iwt   r14,#$A03E                          ; $09A150 |
  iwt   r0,#$1A37                           ; $09A153 |
  add   r1                                  ; $09A156 |
  to r9                                     ; $09A157 |
  ldb   (r0)                                ; $09A158 |
  iwt   r0,#$1978                           ; $09A15A |
  add   r1                                  ; $09A15D |
  to r6                                     ; $09A15E |
  ldw   (r0)                                ; $09A15F |
  iwt   r0,#$1680                           ; $09A160 |
  add   r1                                  ; $09A163 |
  to r4                                     ; $09A164 |
  ldw   (r0)                                ; $09A165 |
  getb                                      ; $09A166 |
  inc   r14                                 ; $09A167 |
  swap                                      ; $09A168 |
  fmult                                     ; $09A169 |
  to r4                                     ; $09A16A |
  add   r4                                  ; $09A16B |
  iwt   r0,#$19D6                           ; $09A16C |
  add   r1                                  ; $09A16F |
  to r6                                     ; $09A170 |
  ldw   (r0)                                ; $09A171 |
  iwt   r0,#$1682                           ; $09A172 |
  add   r1                                  ; $09A175 |
  to r5                                     ; $09A176 |
  ldw   (r0)                                ; $09A177 |
  getb                                      ; $09A178 |
  inc   r14                                 ; $09A179 |
  swap                                      ; $09A17A |
  fmult                                     ; $09A17B |
  to r5                                     ; $09A17C |
  add   r5                                  ; $09A17D |
  iwt   r6,#$0C00                           ; $09A17E |
  dec   r9                                  ; $09A181 |
  bmi CODE_09A18E                           ; $09A182 |
  inc   r9                                  ; $09A184 |
  iwt   r0,#$1978                           ; $09A185 |
  add   r1                                  ; $09A188 |
  ldw   (r0)                                ; $09A189 |
  fmult                                     ; $09A18A |
  lob                                       ; $09A18B |
  to r6                                     ; $09A18C |
  swap                                      ; $09A18D |

CODE_09A18E:
  from r2                                   ; $09A18E |
  fmult                                     ; $09A18F |
  to r7                                     ; $09A190 |
  add   r4                                  ; $09A191 |
  from r3                                   ; $09A192 |
  fmult                                     ; $09A193 |
  to r8                                     ; $09A194 |
  add   r5                                  ; $09A195 |
  iwt   r10,#$0000                          ; $09A196 |
  ibt   r12,#$0004                          ; $09A199 |
  move  r13,r15                             ; $09A19B |
  getbs                                     ; $09A19D |
  inc   r14                                 ; $09A19F |
  add   r7                                  ; $09A1A0 |
  stw   (r11)                               ; $09A1A1 |
  inc   r11                                 ; $09A1A2 |
  inc   r11                                 ; $09A1A3 |
  getbs                                     ; $09A1A4 |
  inc   r14                                 ; $09A1A6 |
  add   r8                                  ; $09A1A7 |
  stw   (r11)                               ; $09A1A8 |
  inc   r11                                 ; $09A1A9 |
  inc   r11                                 ; $09A1AA |
  to r6                                     ; $09A1AB |
  ldw   (r10)                               ; $09A1AC |
  inc   r10                                 ; $09A1AD |
  inc   r10                                 ; $09A1AE |
  iwt   r0,#$3E00                           ; $09A1AF |
  or    r6                                  ; $09A1B2 |
  stw   (r11)                               ; $09A1B3 |
  inc   r11                                 ; $09A1B4 |
  inc   r11                                 ; $09A1B5 |
  ibt   r0,#$0002                           ; $09A1B6 |
  stw   (r11)                               ; $09A1B8 |
  inc   r11                                 ; $09A1B9 |
  loop                                      ; $09A1BA |
  inc   r11                                 ; $09A1BB |
  iwt   r6,#$2400                           ; $09A1BC |
  dec   r9                                  ; $09A1BF |
  bmi CODE_09A1CC                           ; $09A1C0 |
  inc   r9                                  ; $09A1C2 |
  iwt   r0,#$1978                           ; $09A1C3 |
  add   r1                                  ; $09A1C6 |
  ldw   (r0)                                ; $09A1C7 |
  fmult                                     ; $09A1C8 |
  lob                                       ; $09A1C9 |
  to r6                                     ; $09A1CA |
  swap                                      ; $09A1CB |

CODE_09A1CC:
  from r2                                   ; $09A1CC |
  fmult                                     ; $09A1CD |
  to r7                                     ; $09A1CE |
  add   r4                                  ; $09A1CF |
  from r3                                   ; $09A1D0 |
  fmult                                     ; $09A1D1 |
  to r8                                     ; $09A1D2 |
  add   r5                                  ; $09A1D3 |
  iwt   r10,#$0000                          ; $09A1D4 |
  ibt   r12,#$0004                          ; $09A1D7 |
  move  r13,r15                             ; $09A1D9 |
  getbs                                     ; $09A1DB |
  inc   r14                                 ; $09A1DD |
  add   r7                                  ; $09A1DE |
  stw   (r11)                               ; $09A1DF |
  inc   r11                                 ; $09A1E0 |
  inc   r11                                 ; $09A1E1 |
  getbs                                     ; $09A1E2 |
  inc   r14                                 ; $09A1E4 |
  add   r8                                  ; $09A1E5 |
  stw   (r11)                               ; $09A1E6 |
  inc   r11                                 ; $09A1E7 |
  inc   r11                                 ; $09A1E8 |
  to r6                                     ; $09A1E9 |
  ldw   (r10)                               ; $09A1EA |
  inc   r10                                 ; $09A1EB |
  inc   r10                                 ; $09A1EC |
  iwt   r0,#$FC00                           ; $09A1ED |
  or    r6                                  ; $09A1F0 |
  stw   (r11)                               ; $09A1F1 |
  inc   r11                                 ; $09A1F2 |
  inc   r11                                 ; $09A1F3 |
  ibt   r0,#$0002                           ; $09A1F4 |
  stw   (r11)                               ; $09A1F6 |
  inc   r11                                 ; $09A1F7 |
  loop                                      ; $09A1F8 |
  inc   r11                                 ; $09A1F9 |
  with r2                                   ; $09A1FA |
  not                                       ; $09A1FB |
  inc   r2                                  ; $09A1FC |
  iwt   r0,#$1978                           ; $09A1FD |
  add   r1                                  ; $09A200 |
  to r6                                     ; $09A201 |
  ldw   (r0)                                ; $09A202 |
  iwt   r0,#$1680                           ; $09A203 |
  add   r1                                  ; $09A206 |
  to r4                                     ; $09A207 |
  ldw   (r0)                                ; $09A208 |
  getb                                      ; $09A209 |
  inc   r14                                 ; $09A20A |
  swap                                      ; $09A20B |
  fmult                                     ; $09A20C |
  to r4                                     ; $09A20D |
  add   r4                                  ; $09A20E |
  iwt   r0,#$19D6                           ; $09A20F |
  add   r1                                  ; $09A212 |
  to r6                                     ; $09A213 |
  ldw   (r0)                                ; $09A214 |
  iwt   r0,#$1682                           ; $09A215 |
  add   r1                                  ; $09A218 |
  to r5                                     ; $09A219 |
  ldw   (r0)                                ; $09A21A |
  getb                                      ; $09A21B |
  inc   r14                                 ; $09A21C |
  swap                                      ; $09A21D |
  fmult                                     ; $09A21E |
  to r5                                     ; $09A21F |
  add   r5                                  ; $09A220 |
  iwt   r6,#$0C00                           ; $09A221 |
  dec   r9                                  ; $09A224 |
  bmi CODE_09A231                           ; $09A225 |
  inc   r9                                  ; $09A227 |
  iwt   r0,#$1978                           ; $09A228 |
  add   r1                                  ; $09A22B |
  ldw   (r0)                                ; $09A22C |
  fmult                                     ; $09A22D |
  lob                                       ; $09A22E |
  to r6                                     ; $09A22F |
  swap                                      ; $09A230 |

CODE_09A231:
  from r2                                   ; $09A231 |
  fmult                                     ; $09A232 |
  to r7                                     ; $09A233 |
  add   r4                                  ; $09A234 |
  from r3                                   ; $09A235 |
  fmult                                     ; $09A236 |
  to r8                                     ; $09A237 |
  add   r5                                  ; $09A238 |
  iwt   r10,#$0000                          ; $09A239 |
  ibt   r12,#$0004                          ; $09A23C |
  move  r13,r15                             ; $09A23E |
  getbs                                     ; $09A240 |
  inc   r14                                 ; $09A242 |
  add   r7                                  ; $09A243 |
  stw   (r11)                               ; $09A244 |
  inc   r11                                 ; $09A245 |
  inc   r11                                 ; $09A246 |
  getbs                                     ; $09A247 |
  inc   r14                                 ; $09A249 |
  add   r8                                  ; $09A24A |
  stw   (r11)                               ; $09A24B |
  inc   r11                                 ; $09A24C |
  inc   r11                                 ; $09A24D |
  to r6                                     ; $09A24E |
  ldw   (r10)                               ; $09A24F |
  inc   r10                                 ; $09A250 |
  inc   r10                                 ; $09A251 |
  iwt   r0,#$7E00                           ; $09A252 |
  or    r6                                  ; $09A255 |
  stw   (r11)                               ; $09A256 |
  inc   r11                                 ; $09A257 |
  inc   r11                                 ; $09A258 |
  ibt   r0,#$0002                           ; $09A259 |
  stw   (r11)                               ; $09A25B |
  inc   r11                                 ; $09A25C |
  loop                                      ; $09A25D |
  inc   r11                                 ; $09A25E |
  iwt   r6,#$2400                           ; $09A25F |
  dec   r9                                  ; $09A262 |
  bmi CODE_09A26F                           ; $09A263 |
  inc   r9                                  ; $09A265 |
  iwt   r0,#$1978                           ; $09A266 |
  add   r1                                  ; $09A269 |
  ldw   (r0)                                ; $09A26A |
  fmult                                     ; $09A26B |
  lob                                       ; $09A26C |
  to r6                                     ; $09A26D |
  swap                                      ; $09A26E |

CODE_09A26F:
  from r2                                   ; $09A26F |
  fmult                                     ; $09A270 |
  to r7                                     ; $09A271 |
  add   r4                                  ; $09A272 |
  from r3                                   ; $09A273 |
  fmult                                     ; $09A274 |
  to r8                                     ; $09A275 |
  add   r5                                  ; $09A276 |
  iwt   r10,#$0000                          ; $09A277 |
  ibt   r12,#$0004                          ; $09A27A |
  move  r13,r15                             ; $09A27C |
  getbs                                     ; $09A27E |
  inc   r14                                 ; $09A280 |
  add   r7                                  ; $09A281 |
  stw   (r11)                               ; $09A282 |
  inc   r11                                 ; $09A283 |
  inc   r11                                 ; $09A284 |
  getbs                                     ; $09A285 |
  inc   r14                                 ; $09A287 |
  add   r8                                  ; $09A288 |
  stw   (r11)                               ; $09A289 |
  inc   r11                                 ; $09A28A |
  inc   r11                                 ; $09A28B |
  to r6                                     ; $09A28C |
  ldw   (r10)                               ; $09A28D |
  inc   r10                                 ; $09A28E |
  inc   r10                                 ; $09A28F |
  iwt   r0,#$BC00                           ; $09A290 |
  or    r6                                  ; $09A293 |
  stw   (r11)                               ; $09A294 |
  inc   r11                                 ; $09A295 |
  inc   r11                                 ; $09A296 |
  ibt   r0,#$0002                           ; $09A297 |
  stw   (r11)                               ; $09A299 |
  inc   r11                                 ; $09A29A |
  loop                                      ; $09A29B |
  inc   r11                                 ; $09A29C |
  iwt   r0,#$1402                           ; $09A29D |
  add   r1                                  ; $09A2A0 |
  to r6                                     ; $09A2A1 |
  ldw   (r0)                                ; $09A2A2 |
  iwt   r0,#$0030                           ; $09A2A3 |
  mult  r6                                  ; $09A2A6 |
  to r14                                    ; $09A2A7 |
  add   r14                                 ; $09A2A8 |
  iwt   r0,#$1400                           ; $09A2A9 |
  add   r1                                  ; $09A2AC |
  to r2                                     ; $09A2AD |
  ldw   (r0)                                ; $09A2AE |
  iwt   r0,#$1680                           ; $09A2AF |
  add   r1                                  ; $09A2B2 |
  to r3                                     ; $09A2B3 |
  ldw   (r0)                                ; $09A2B4 |
  iwt   r0,#$1682                           ; $09A2B5 |
  add   r1                                  ; $09A2B8 |
  to r4                                     ; $09A2B9 |
  ldw   (r0)                                ; $09A2BA |
  iwt   r0,#$1978                           ; $09A2BB |
  add   r1                                  ; $09A2BE |
  to r6                                     ; $09A2BF |
  ldw   (r0)                                ; $09A2C0 |
  getb                                      ; $09A2C1 |
  inc   r14                                 ; $09A2C2 |
  swap                                      ; $09A2C3 |
  dec   r2                                  ; $09A2C4 |
  bmi CODE_09A2CA                           ; $09A2C5 |
  inc   r2                                  ; $09A2C7 |
  not                                       ; $09A2C8 |
  inc   r0                                  ; $09A2C9 |

CODE_09A2CA:
  to r7                                     ; $09A2CA |
  fmult                                     ; $09A2CB |
  iwt   r0,#$19D6                           ; $09A2CC |
  add   r1                                  ; $09A2CF |
  to r6                                     ; $09A2D0 |
  ldw   (r0)                                ; $09A2D1 |
  getb                                      ; $09A2D2 |
  inc   r14                                 ; $09A2D3 |
  swap                                      ; $09A2D4 |
  to r8                                     ; $09A2D5 |
  fmult                                     ; $09A2D6 |
  iwt   r10,#$0008                          ; $09A2D7 |
  ibt   r12,#$0004                          ; $09A2DA |
  move  r13,r15                             ; $09A2DC |
  getbs                                     ; $09A2DE |
  inc   r14                                 ; $09A2E0 |
  dec   r2                                  ; $09A2E1 |
  bmi CODE_09A2E8                           ; $09A2E2 |
  inc   r2                                  ; $09A2E4 |
  not                                       ; $09A2E5 |
  sub   #15                                 ; $09A2E6 |

CODE_09A2E8:
  add   r7                                  ; $09A2E8 |
  add   r3                                  ; $09A2E9 |
  stw   (r11)                               ; $09A2EA |
  inc   r11                                 ; $09A2EB |
  inc   r11                                 ; $09A2EC |
  getbs                                     ; $09A2ED |
  inc   r14                                 ; $09A2EF |
  add   r8                                  ; $09A2F0 |
  add   r4                                  ; $09A2F1 |
  stw   (r11)                               ; $09A2F2 |
  inc   r11                                 ; $09A2F3 |
  inc   r11                                 ; $09A2F4 |
  to r6                                     ; $09A2F5 |
  ldw   (r10)                               ; $09A2F6 |
  inc   r10                                 ; $09A2F7 |
  inc   r10                                 ; $09A2F8 |
  iwt   r0,#$FE00                           ; $09A2F9 |
  dec   r2                                  ; $09A2FC |
  bmi CODE_09A303                           ; $09A2FD |
  inc   r2                                  ; $09A2FF |
  iwt   r0,#$BE00                           ; $09A300 |

CODE_09A303:
  or    r6                                  ; $09A303 |
  stw   (r11)                               ; $09A304 |
  inc   r11                                 ; $09A305 |
  inc   r11                                 ; $09A306 |
  ibt   r0,#$0002                           ; $09A307 |
  stw   (r11)                               ; $09A309 |
  inc   r11                                 ; $09A30A |
  loop                                      ; $09A30B |
  inc   r11                                 ; $09A30C |
  iwt   r10,#$0008                          ; $09A30D |
  ibt   r12,#$0004                          ; $09A310 |
  move  r13,r15                             ; $09A312 |
  getbs                                     ; $09A314 |
  inc   r14                                 ; $09A316 |
  dec   r2                                  ; $09A317 |
  bmi CODE_09A31E                           ; $09A318 |
  inc   r2                                  ; $09A31A |
  not                                       ; $09A31B |
  sub   #15                                 ; $09A31C |

CODE_09A31E:
  add   r7                                  ; $09A31E |
  add   r3                                  ; $09A31F |
  stw   (r11)                               ; $09A320 |
  inc   r11                                 ; $09A321 |
  inc   r11                                 ; $09A322 |
  getbs                                     ; $09A323 |
  inc   r14                                 ; $09A325 |
  add   r8                                  ; $09A326 |
  add   r4                                  ; $09A327 |
  stw   (r11)                               ; $09A328 |
  inc   r11                                 ; $09A329 |
  inc   r11                                 ; $09A32A |
  to r6                                     ; $09A32B |
  ldw   (r10)                               ; $09A32C |
  inc   r10                                 ; $09A32D |
  inc   r10                                 ; $09A32E |
  iwt   r0,#$3C00                           ; $09A32F |
  dec   r2                                  ; $09A332 |
  bmi CODE_09A339                           ; $09A333 |
  inc   r2                                  ; $09A335 |
  iwt   r0,#$7C00                           ; $09A336 |

CODE_09A339:
  or    r6                                  ; $09A339 |
  stw   (r11)                               ; $09A33A |
  inc   r11                                 ; $09A33B |
  inc   r11                                 ; $09A33C |
  ibt   r0,#$0002                           ; $09A33D |
  stw   (r11)                               ; $09A33F |
  inc   r11                                 ; $09A340 |
  loop                                      ; $09A341 |
  inc   r11                                 ; $09A342 |
  cache                                     ; $09A343 |
  iwt   r0,#$1978                           ; $09A344 |
  add   r1                                  ; $09A347 |
  to r6                                     ; $09A348 |
  ldw   (r0)                                ; $09A349 |
  getb                                      ; $09A34A |
  inc   r14                                 ; $09A34B |
  swap                                      ; $09A34C |
  dec   r2                                  ; $09A34D |
  bmi CODE_09A353                           ; $09A34E |
  inc   r2                                  ; $09A350 |
  not                                       ; $09A351 |
  inc   r0                                  ; $09A352 |

CODE_09A353:
  fmult                                     ; $09A353 |
  sub   #8                                  ; $09A354 |
  add   r3                                  ; $09A356 |
  stw   (r11)                               ; $09A357 |
  inc   r11                                 ; $09A358 |
  inc   r11                                 ; $09A359 |
  iwt   r0,#$19D6                           ; $09A35A |
  add   r1                                  ; $09A35D |
  to r6                                     ; $09A35E |
  ldw   (r0)                                ; $09A35F |
  getb                                      ; $09A360 |
  inc   r14                                 ; $09A361 |
  swap                                      ; $09A362 |
  fmult                                     ; $09A363 |
  sub   #15                                 ; $09A364 |
  add   r4                                  ; $09A366 |
  stw   (r11)                               ; $09A367 |
  inc   r11                                 ; $09A368 |
  inc   r11                                 ; $09A369 |
  lms   r6,($0010)                          ; $09A36A |
  iwt   r0,#$3C00                           ; $09A36D |
  dec   r2                                  ; $09A370 |
  bmi CODE_09A377                           ; $09A371 |
  inc   r2                                  ; $09A373 |
  iwt   r0,#$7C00                           ; $09A374 |

CODE_09A377:
  or    r6                                  ; $09A377 |
  stw   (r11)                               ; $09A378 |
  inc   r11                                 ; $09A379 |
  inc   r11                                 ; $09A37A |
  ibt   r0,#$0002                           ; $09A37B |
  stw   (r11)                               ; $09A37D |
  inc   r11                                 ; $09A37E |
  inc   r11                                 ; $09A37F |
  iwt   r0,#$1978                           ; $09A380 |
  add   r1                                  ; $09A383 |
  to r6                                     ; $09A384 |
  ldw   (r0)                                ; $09A385 |
  getb                                      ; $09A386 |
  inc   r14                                 ; $09A387 |
  swap                                      ; $09A388 |
  dec   r2                                  ; $09A389 |
  bmi CODE_09A38F                           ; $09A38A |
  inc   r2                                  ; $09A38C |
  not                                       ; $09A38D |
  inc   r0                                  ; $09A38E |

CODE_09A38F:
  fmult                                     ; $09A38F |
  sub   #8                                  ; $09A390 |
  add   r3                                  ; $09A392 |
  stw   (r11)                               ; $09A393 |
  inc   r11                                 ; $09A394 |
  inc   r11                                 ; $09A395 |
  iwt   r0,#$19D6                           ; $09A396 |
  add   r1                                  ; $09A399 |
  to r6                                     ; $09A39A |
  ldw   (r0)                                ; $09A39B |
  getb                                      ; $09A39C |
  inc   r14                                 ; $09A39D |
  swap                                      ; $09A39E |
  fmult                                     ; $09A39F |
  sub   #15                                 ; $09A3A0 |
  add   r4                                  ; $09A3A2 |
  stw   (r11)                               ; $09A3A3 |
  inc   r11                                 ; $09A3A4 |
  inc   r11                                 ; $09A3A5 |
  lms   r6,($0010)                          ; $09A3A6 |
  iwt   r0,#$3C00                           ; $09A3A9 |
  dec   r2                                  ; $09A3AC |
  bmi CODE_09A3B3                           ; $09A3AD |
  inc   r2                                  ; $09A3AF |
  iwt   r0,#$7C00                           ; $09A3B0 |

CODE_09A3B3:
  or    r6                                  ; $09A3B3 |
  stw   (r11)                               ; $09A3B4 |
  inc   r11                                 ; $09A3B5 |
  inc   r11                                 ; $09A3B6 |
  ibt   r0,#$0002                           ; $09A3B7 |
  stw   (r11)                               ; $09A3B9 |
  inc   r11                                 ; $09A3BA |
  inc   r11                                 ; $09A3BB |
  iwt   r0,#$1978                           ; $09A3BC |
  add   r1                                  ; $09A3BF |
  to r6                                     ; $09A3C0 |
  ldw   (r0)                                ; $09A3C1 |
  getb                                      ; $09A3C2 |
  inc   r14                                 ; $09A3C3 |
  swap                                      ; $09A3C4 |
  dec   r2                                  ; $09A3C5 |
  bmi CODE_09A3CB                           ; $09A3C6 |
  inc   r2                                  ; $09A3C8 |
  not                                       ; $09A3C9 |
  inc   r0                                  ; $09A3CA |

CODE_09A3CB:
  fmult                                     ; $09A3CB |
  sub   #8                                  ; $09A3CC |
  add   r3                                  ; $09A3CE |
  stw   (r11)                               ; $09A3CF |
  inc   r11                                 ; $09A3D0 |
  inc   r11                                 ; $09A3D1 |
  iwt   r0,#$19D6                           ; $09A3D2 |
  add   r1                                  ; $09A3D5 |
  to r6                                     ; $09A3D6 |
  ldw   (r0)                                ; $09A3D7 |
  getb                                      ; $09A3D8 |
  inc   r14                                 ; $09A3D9 |
  swap                                      ; $09A3DA |
  fmult                                     ; $09A3DB |
  sub   #15                                 ; $09A3DC |
  add   r4                                  ; $09A3DE |
  stw   (r11)                               ; $09A3DF |
  inc   r11                                 ; $09A3E0 |
  inc   r11                                 ; $09A3E1 |
  lms   r6,($0012)                          ; $09A3E2 |
  iwt   r0,#$1C00                           ; $09A3E5 |
  dec   r2                                  ; $09A3E8 |
  bmi CODE_09A3EF                           ; $09A3E9 |
  inc   r2                                  ; $09A3EB |
  iwt   r0,#$5C00                           ; $09A3EC |

CODE_09A3EF:
  or    r6                                  ; $09A3EF |
  stw   (r11)                               ; $09A3F0 |
  inc   r11                                 ; $09A3F1 |
  inc   r11                                 ; $09A3F2 |
  ibt   r0,#$0002                           ; $09A3F3 |
  stw   (r11)                               ; $09A3F5 |
  inc   r11                                 ; $09A3F6 |
  inc   r11                                 ; $09A3F7 |
  iwt   r0,#$1978                           ; $09A3F8 |
  add   r1                                  ; $09A3FB |
  to r6                                     ; $09A3FC |
  ldw   (r0)                                ; $09A3FD |
  getb                                      ; $09A3FE |
  inc   r14                                 ; $09A3FF |
  swap                                      ; $09A400 |
  dec   r2                                  ; $09A401 |
  bmi CODE_09A407                           ; $09A402 |
  inc   r2                                  ; $09A404 |
  not                                       ; $09A405 |
  inc   r0                                  ; $09A406 |

CODE_09A407:
  to r7                                     ; $09A407 |
  fmult                                     ; $09A408 |
  iwt   r0,#$19D6                           ; $09A409 |
  add   r1                                  ; $09A40C |
  to r6                                     ; $09A40D |
  ldw   (r0)                                ; $09A40E |
  getb                                      ; $09A40F |
  inc   r14                                 ; $09A410 |
  swap                                      ; $09A411 |
  to r8                                     ; $09A412 |
  fmult                                     ; $09A413 |
  iwt   r10,#$0014                          ; $09A414 |
  ibt   r12,#$0004                          ; $09A417 |
  move  r13,r15                             ; $09A419 |
  getbs                                     ; $09A41B |
  inc   r14                                 ; $09A41D |
  dec   r2                                  ; $09A41E |
  bmi CODE_09A425                           ; $09A41F |
  inc   r2                                  ; $09A421 |
  not                                       ; $09A422 |
  sub   #15                                 ; $09A423 |

CODE_09A425:
  add   r7                                  ; $09A425 |
  add   r3                                  ; $09A426 |
  stw   (r11)                               ; $09A427 |
  inc   r11                                 ; $09A428 |
  inc   r11                                 ; $09A429 |
  getbs                                     ; $09A42A |
  inc   r14                                 ; $09A42C |
  add   r8                                  ; $09A42D |
  add   r4                                  ; $09A42E |
  stw   (r11)                               ; $09A42F |
  inc   r11                                 ; $09A430 |
  inc   r11                                 ; $09A431 |
  to r6                                     ; $09A432 |
  ldw   (r10)                               ; $09A433 |
  inc   r10                                 ; $09A434 |
  inc   r10                                 ; $09A435 |
  iwt   r0,#$2C00                           ; $09A436 |
  dec   r2                                  ; $09A439 |
  bmi CODE_09A440                           ; $09A43A |
  inc   r2                                  ; $09A43C |
  iwt   r0,#$6C00                           ; $09A43D |

CODE_09A440:
  or    r6                                  ; $09A440 |
  stw   (r11)                               ; $09A441 |
  inc   r11                                 ; $09A442 |
  inc   r11                                 ; $09A443 |
  ibt   r0,#$0002                           ; $09A444 |
  stw   (r11)                               ; $09A446 |
  inc   r11                                 ; $09A447 |
  loop                                      ; $09A448 |
  inc   r11                                 ; $09A449 |
  iwt   r0,#$1978                           ; $09A44A |
  add   r1                                  ; $09A44D |
  to r6                                     ; $09A44E |
  ldw   (r0)                                ; $09A44F |
  getb                                      ; $09A450 |
  inc   r14                                 ; $09A451 |
  swap                                      ; $09A452 |
  dec   r2                                  ; $09A453 |
  bmi CODE_09A459                           ; $09A454 |
  inc   r2                                  ; $09A456 |
  not                                       ; $09A457 |
  inc   r0                                  ; $09A458 |

CODE_09A459:
  to r7                                     ; $09A459 |
  fmult                                     ; $09A45A |
  iwt   r0,#$19D6                           ; $09A45B |
  add   r1                                  ; $09A45E |
  to r6                                     ; $09A45F |
  ldw   (r0)                                ; $09A460 |
  getb                                      ; $09A461 |
  inc   r14                                 ; $09A462 |
  swap                                      ; $09A463 |
  to r8                                     ; $09A464 |
  fmult                                     ; $09A465 |
  iwt   r9,#$4000                           ; $09A466 |
  iwt   r10,#$001C                          ; $09A469 |
  ibt   r12,#$0004                          ; $09A46C |
  move  r13,r15                             ; $09A46E |
  getbs                                     ; $09A470 |
  inc   r14                                 ; $09A472 |
  dec   r2                                  ; $09A473 |
  bmi CODE_09A47A                           ; $09A474 |
  inc   r2                                  ; $09A476 |
  not                                       ; $09A477 |
  sub   #15                                 ; $09A478 |

CODE_09A47A:
  add   r7                                  ; $09A47A |
  add   r3                                  ; $09A47B |
  stw   (r11)                               ; $09A47C |
  inc   r11                                 ; $09A47D |
  inc   r11                                 ; $09A47E |
  getbs                                     ; $09A47F |
  inc   r14                                 ; $09A481 |
  add   r8                                  ; $09A482 |
  add   r4                                  ; $09A483 |
  stw   (r11)                               ; $09A484 |
  inc   r11                                 ; $09A485 |
  inc   r11                                 ; $09A486 |
  to r6                                     ; $09A487 |
  ldw   (r10)                               ; $09A488 |
  inc   r10                                 ; $09A489 |
  inc   r10                                 ; $09A48A |
  getb                                      ; $09A48B |
  inc   r14                                 ; $09A48C |
  swap                                      ; $09A48D |
  dec   r2                                  ; $09A48E |
  bmi CODE_09A494                           ; $09A48F |
  inc   r2                                  ; $09A491 |
  xor   r9                                  ; $09A492 |

CODE_09A494:
  or    r6                                  ; $09A494 |
  stw   (r11)                               ; $09A495 |
  inc   r11                                 ; $09A496 |
  inc   r11                                 ; $09A497 |
  ibt   r0,#$0002                           ; $09A498 |
  stw   (r11)                               ; $09A49A |
  inc   r11                                 ; $09A49B |
  loop                                      ; $09A49C |
  inc   r11                                 ; $09A49D |
  sms   ($0092),r11                         ; $09A49E |
  cache                                     ; $09A4A1 |
  iwt   r1,#$1003                           ; $09A4A2 |
  iwt   r2,#$3000                           ; $09A4A5 |
  ibt   r3,#$0004                           ; $09A4A8 |
  iwt   r12,#$0028                          ; $09A4AA |
  move  r13,r15                             ; $09A4AD |
  ldw   (r1)                                ; $09A4AF |
  or    r2                                  ; $09A4B0 |
  with r1                                   ; $09A4B1 |
  add   r3                                  ; $09A4B2 |
  loop                                      ; $09A4B3 |
  sbk                                       ; $09A4B4 |
  stop                                      ; $09A4B5 |
  nop                                       ; $09A4B6 |

  dw $F800, $9EFC, $002C, $FC00             ; $09A4B7 |
  dw $6C9E, $F002, $C0E5, $022D             ; $09A4BF |
  dw $E500, $2DC2, $F002, $E0F5             ; $09A4C7 |
  dw $022D, $F500, $2DE2, $F800             ; $09A4CF |
  dw $2EFD, $006C, $FD00, $2C2E             ; $09A4D7 |
  dw $F002, $C0E5, $022D, $E500             ; $09A4DF |
  dw $2DC2, $F002, $E0F5, $022D             ; $09A4E7 |
  dw $F500, $2DE2, $F800, $2F01             ; $09A4EF |
  dw $006C, $0100, $2C2F, $F002             ; $09A4F7 |
  dw $C0E5, $022D, $E500, $2DC2             ; $09A4FF |
  dw $F002, $E0F5, $022D, $F500             ; $09A507 |
  dw $2DE2                                  ; $09A50F |

  ibt   r0,#$0009                           ; $09A511 |
  romb                                      ; $09A513 |
  cache                                     ; $09A515 |
  lm    r1,($1972)                          ; $09A516 |
  iwt   r0,#$1402                           ; $09A51A |
  add   r1                                  ; $09A51D |
  to r6                                     ; $09A51E |
  ldw   (r0)                                ; $09A51F |
  ibt   r0,#$001E                           ; $09A520 |
  mult  r6                                  ; $09A522 |
  iwt   r2,#$A4B7                           ; $09A523 |
  to r14                                    ; $09A526 |
  add   r2                                  ; $09A527 |
  iwt   r0,#$1680                           ; $09A528 |
  add   r1                                  ; $09A52B |
  to r2                                     ; $09A52C |
  ldw   (r0)                                ; $09A52D |
  iwt   r0,#$1682                           ; $09A52E |
  add   r1                                  ; $09A531 |
  to r3                                     ; $09A532 |
  ldw   (r0)                                ; $09A533 |
  iwt   r0,#$1400                           ; $09A534 |
  add   r1                                  ; $09A537 |
  to r4                                     ; $09A538 |
  ldw   (r0)                                ; $09A539 |
  iwt   r5,#$4000                           ; $09A53A |
  lms   r11,($0092)                         ; $09A53D |
  ibt   r12,#$0006                          ; $09A540 |
  move  r13,r15                             ; $09A542 |
  to r6                                     ; $09A544 |
  getb                                      ; $09A545 |
  inc   r14                                 ; $09A546 |
  getbs                                     ; $09A547 |
  inc   r14                                 ; $09A549 |
  dec   r4                                  ; $09A54A |
  bmi CODE_09A556                           ; $09A54B |
  inc   r4                                  ; $09A54D |
  not                                       ; $09A54E |
  inc   r0                                  ; $09A54F |
  dec   r6                                  ; $09A550 |
  bpl CODE_09A556                           ; $09A551 |
  inc   r6                                  ; $09A553 |
  add   #8                                  ; $09A554 |

CODE_09A556:
  add   r2                                  ; $09A556 |
  stw   (r11)                               ; $09A557 |
  inc   r11                                 ; $09A558 |
  inc   r11                                 ; $09A559 |
  getbs                                     ; $09A55A |
  inc   r14                                 ; $09A55C |
  add   r3                                  ; $09A55D |
  stw   (r11)                               ; $09A55E |
  inc   r11                                 ; $09A55F |
  inc   r11                                 ; $09A560 |
  getb                                      ; $09A561 |
  inc   r14                                 ; $09A562 |
  getbh                                     ; $09A563 |
  inc   r14                                 ; $09A565 |
  dec   r4                                  ; $09A566 |
  bmi CODE_09A56C                           ; $09A567 |
  inc   r4                                  ; $09A569 |
  xor   r5                                  ; $09A56A |

CODE_09A56C:
  stw   (r11)                               ; $09A56C |
  inc   r11                                 ; $09A56D |
  inc   r11                                 ; $09A56E |
  from r6                                   ; $09A56F |
  stw   (r11)                               ; $09A570 |
  inc   r11                                 ; $09A571 |
  loop                                      ; $09A572 |
  inc   r11                                 ; $09A573 |
  iwt   r15,#$A49E                          ; $09A574 |
  nop                                       ; $09A577 |

  cache                                     ; $09A578 |
  ibt   r0,#$0008                           ; $09A579 |
  romb                                      ; $09A57B |
  iwt   r0,#$00C0                           ; $09A57D |
  add   r1                                  ; $09A580 |
  to r11                                    ; $09A581 |
  lob                                       ; $09A582 |
  iwt   r0,#$AE18                           ; $09A583 |
  to r14                                    ; $09A586 |
  add   r11                                 ; $09A587 |
  iwt   r3,#$AE58                           ; $09A588 |
  getbs                                     ; $09A58B |
  from r3                                   ; $09A58D |
  to r14                                    ; $09A58E |
  add   r11                                 ; $09A58F |
  add   r0                                  ; $09A590 |
  to r2                                     ; $09A591 |
  add   r0                                  ; $09A592 |
  iwt   r11,#$AE18                          ; $09A593 |
  getbs                                     ; $09A596 |
  from r11                                  ; $09A598 |
  to r14                                    ; $09A599 |
  add   r1                                  ; $09A59A |
  add   r0                                  ; $09A59B |
  to r3                                     ; $09A59C |
  add   r0                                  ; $09A59D |
  iwt   r11,#$AE58                          ; $09A59E |
  getbs                                     ; $09A5A1 |
  from r11                                  ; $09A5A3 |
  to r14                                    ; $09A5A4 |
  add   r1                                  ; $09A5A5 |
  add   r0                                  ; $09A5A6 |
  add   r0                                  ; $09A5A7 |
  sms   ($000C),r0                          ; $09A5A8 |
  getbs                                     ; $09A5AB |
  add   r0                                  ; $09A5AD |
  add   r0                                  ; $09A5AE |
  sms   ($000E),r0                          ; $09A5AF |
  from r4                                   ; $09A5B2 |
  romb                                      ; $09A5B3 |
  from r7                                   ; $09A5B5 |
  umult r6                                  ; $09A5B6 |
  to r14                                    ; $09A5B8 |
  add   r5                                  ; $09A5B9 |
  lm    r1,($1972)                          ; $09A5BA |
  iwt   r0,#$1400                           ; $09A5BE |
  add   r1                                  ; $09A5C1 |
  to r7                                     ; $09A5C2 |
  ldw   (r0)                                ; $09A5C3 |
  lms   r11,($0092)                         ; $09A5C4 |
  lms   r6,($0000)                          ; $09A5C7 |
  from r8                                   ; $09A5CA |
  fmult                                     ; $09A5CB |
  lob                                       ; $09A5CC |
  swap                                      ; $09A5CD |
  move  r6,r2                               ; $09A5CE |
  to r9                                     ; $09A5D0 |
  fmult                                     ; $09A5D1 |
  dec   r7                                  ; $09A5D2 |
  bmi CODE_09A5D9                           ; $09A5D3 |
  inc   r7                                  ; $09A5D5 |
  with r9                                   ; $09A5D6 |
  not                                       ; $09A5D7 |
  inc   r9                                  ; $09A5D8 |

CODE_09A5D9:
  lms   r6,($0002)                          ; $09A5D9 |
  from r8                                   ; $09A5DC |
  fmult                                     ; $09A5DD |
  lob                                       ; $09A5DE |
  move  r5,r0                               ; $09A5DF |
  swap                                      ; $09A5E1 |
  move  r6,r3                               ; $09A5E2 |
  fmult                                     ; $09A5E4 |
  to r10                                    ; $09A5E5 |
  sub   r5                                  ; $09A5E6 |
  lms   r2,($000C)                          ; $09A5E7 |
  lms   r3,($000E)                          ; $09A5EA |
  getb                                      ; $09A5ED |
  inc   r14                                 ; $09A5EE |
  to r6                                     ; $09A5EF |
  swap                                      ; $09A5F0 |
  move  r5,r6                               ; $09A5F1 |
  lms   r8,($0004)                          ; $09A5F3 |
  dec   r8                                  ; $09A5F6 |
  bmi CODE_09A601                           ; $09A5F7 |
  inc   r8                                  ; $09A5F9 |
  lms   r0,($0000)                          ; $09A5FA |
  fmult                                     ; $09A5FD |
  lob                                       ; $09A5FE |
  to r6                                     ; $09A5FF |
  swap                                      ; $09A600 |

CODE_09A601:
  from r2                                   ; $09A601 |
  fmult                                     ; $09A602 |
  move  r4,r0                               ; $09A603 |
  dec   r7                                  ; $09A605 |
  bmi CODE_09A60C                           ; $09A606 |
  inc   r7                                  ; $09A608 |
  with r4                                   ; $09A609 |
  not                                       ; $09A60A |
  inc   r4                                  ; $09A60B |

CODE_09A60C:
  move  r6,r5                               ; $09A60C |
  dec   r8                                  ; $09A60E |
  bmi CODE_09A619                           ; $09A60F |
  inc   r8                                  ; $09A611 |
  lms   r0,($0002)                          ; $09A612 |
  fmult                                     ; $09A615 |
  lob                                       ; $09A616 |
  to r6                                     ; $09A617 |
  swap                                      ; $09A618 |

CODE_09A619:
  from r3                                   ; $09A619 |
  fmult                                     ; $09A61A |
  move  r5,r0                               ; $09A61B |
  sms   ($0006),r4                          ; $09A61D |
  sms   ($0008),r5                          ; $09A620 |
  lms   r0,($0010)                          ; $09A623 |
  add   r9                                  ; $09A626 |
  to r4                                     ; $09A627 |
  add   r4                                  ; $09A628 |
  lms   r0,($0012)                          ; $09A629 |
  add   r10                                 ; $09A62C |
  to r5                                     ; $09A62D |
  add   r5                                  ; $09A62E |
  ibt   r12,#$0004                          ; $09A62F |
  from r15                                  ; $09A631 |
  add   #7                                  ; $09A632 |
  sms   ($0060),r0                          ; $09A634 |
  iwt   r15,#$A769                          ; $09A637 | sub
  nop                                       ; $09A63A |

  getb                                      ; $09A63B |
  inc   r14                                 ; $09A63C |
  to r6                                     ; $09A63D |
  swap                                      ; $09A63E |
  move  r5,r6                               ; $09A63F |
  lms   r8,($0004)                          ; $09A641 |
  dec   r8                                  ; $09A644 |
  bmi CODE_09A64F                           ; $09A645 |
  inc   r8                                  ; $09A647 |
  lms   r0,($0000)                          ; $09A648 |
  fmult                                     ; $09A64B |
  lob                                       ; $09A64C |
  to r6                                     ; $09A64D |
  swap                                      ; $09A64E |

CODE_09A64F:
  from r2                                   ; $09A64F |
  fmult                                     ; $09A650 |
  move  r4,r0                               ; $09A651 |
  dec   r7                                  ; $09A653 |
  bmi CODE_09A65A                           ; $09A654 |
  inc   r7                                  ; $09A656 |
  with r4                                   ; $09A657 |
  not                                       ; $09A658 |
  inc   r4                                  ; $09A659 |

CODE_09A65A:
  move  r6,r5                               ; $09A65A |
  dec   r8                                  ; $09A65C |
  bmi CODE_09A667                           ; $09A65D |
  inc   r8                                  ; $09A65F |
  lms   r0,($0002)                          ; $09A660 |
  fmult                                     ; $09A663 |
  lob                                       ; $09A664 |
  to r6                                     ; $09A665 |
  swap                                      ; $09A666 |

CODE_09A667:
  from r3                                   ; $09A667 |
  fmult                                     ; $09A668 |
  move  r5,r0                               ; $09A669 |
  sms   ($000A),r4                          ; $09A66B |
  sms   ($000C),r5                          ; $09A66E |
  lms   r0,($0010)                          ; $09A671 |
  add   r9                                  ; $09A674 |
  to r4                                     ; $09A675 |
  add   r4                                  ; $09A676 |
  lms   r0,($0012)                          ; $09A677 |
  add   r10                                 ; $09A67A |
  to r5                                     ; $09A67B |
  add   r5                                  ; $09A67C |
  ibt   r12,#$0004                          ; $09A67D |
  from r15                                  ; $09A67F |
  add   #7                                  ; $09A680 |
  sms   ($0060),r0                          ; $09A682 |
  iwt   r15,#$A769                          ; $09A685 | sub
  nop                                       ; $09A688 |

  with r9                                   ; $09A689 |
  not                                       ; $09A68A |
  inc   r9                                  ; $09A68B |
  lms   r0,($0006)                          ; $09A68C |
  to r4                                     ; $09A68F |
  not                                       ; $09A690 |
  inc   r4                                  ; $09A691 |
  lms   r5,($0008)                          ; $09A692 |
  lms   r0,($0010)                          ; $09A695 |
  add   r9                                  ; $09A698 |
  to r4                                     ; $09A699 |
  add   r4                                  ; $09A69A |
  lms   r0,($0012)                          ; $09A69B |
  add   r10                                 ; $09A69E |
  to r5                                     ; $09A69F |
  add   r5                                  ; $09A6A0 |
  ibt   r12,#$0004                          ; $09A6A1 |
  from r15                                  ; $09A6A3 |
  add   #7                                  ; $09A6A4 | return after
  sms   ($0060),r0                          ; $09A6A6 | makes this a sub
  iwt   r15,#$A769                          ; $09A6A9 |
  nop                                       ; $09A6AC |

  lms   r0,($000A)                          ; $09A6AD |
  to r4                                     ; $09A6B0 |
  not                                       ; $09A6B1 |
  inc   r4                                  ; $09A6B2 |
  lms   r5,($000C)                          ; $09A6B3 |
  lms   r0,($0010)                          ; $09A6B6 |
  add   r9                                  ; $09A6B9 |
  to r4                                     ; $09A6BA |
  add   r4                                  ; $09A6BB |
  lms   r0,($0012)                          ; $09A6BC |
  add   r10                                 ; $09A6BF |
  to r5                                     ; $09A6C0 |
  add   r5                                  ; $09A6C1 |
  ibt   r12,#$0004                          ; $09A6C2 |
  from r15                                  ; $09A6C4 |
  add   #7                                  ; $09A6C5 |
  sms   ($0060),r0                          ; $09A6C7 |
  iwt   r15,#$A769                          ; $09A6CA | sub
  nop                                       ; $09A6CD |

  iwt   r0,#$1402                           ; $09A6CE |
  add   r1                                  ; $09A6D1 |
  ldw   (r0)                                ; $09A6D2 |
  sub   #9                                  ; $09A6D3 |
  bcs CODE_09A737                           ; $09A6D5 |
  nop                                       ; $09A6D7 |
  getb                                      ; $09A6D8 |
  inc   r14                                 ; $09A6D9 |
  swap                                      ; $09A6DA |
  lms   r6,($0000)                          ; $09A6DB |
  to r9                                     ; $09A6DE |
  fmult                                     ; $09A6DF |
  dec   r7                                  ; $09A6E0 |
  bmi CODE_09A6E7                           ; $09A6E1 |
  inc   r7                                  ; $09A6E3 |
  with r9                                   ; $09A6E4 |
  not                                       ; $09A6E5 |
  inc   r9                                  ; $09A6E6 |

CODE_09A6E7:
  getb                                      ; $09A6E7 |
  inc   r14                                 ; $09A6E8 |
  swap                                      ; $09A6E9 |
  lms   r6,($0002)                          ; $09A6EA |
  to r10                                    ; $09A6ED |
  fmult                                     ; $09A6EE |
  lms   r0,($0010)                          ; $09A6EF |
  to r4                                     ; $09A6F2 |
  add   r9                                  ; $09A6F3 |
  lms   r0,($0012)                          ; $09A6F4 |
  to r5                                     ; $09A6F7 |
  add   r10                                 ; $09A6F8 |
  ibt   r12,#$0008                          ; $09A6F9 |
  from r15                                  ; $09A6FB |
  add   #7                                  ; $09A6FC |
  sms   ($0060),r0                          ; $09A6FE |
  iwt   r15,#$A769                          ; $09A701 | sub
  nop                                       ; $09A704 |

  getb                                      ; $09A705 |
  inc   r14                                 ; $09A706 |
  swap                                      ; $09A707 |
  lms   r6,($0000)                          ; $09A708 |
  to r9                                     ; $09A70B |
  fmult                                     ; $09A70C |
  dec   r7                                  ; $09A70D |
  bmi CODE_09A714                           ; $09A70E |
  inc   r7                                  ; $09A710 |
  with r9                                   ; $09A711 |
  not                                       ; $09A712 |
  inc   r9                                  ; $09A713 |

CODE_09A714:
  getb                                      ; $09A714 |
  inc   r14                                 ; $09A715 |
  swap                                      ; $09A716 |
  lms   r6,($0002)                          ; $09A717 |
  to r10                                    ; $09A71A |
  fmult                                     ; $09A71B |
  lms   r0,($0010)                          ; $09A71C |
  to r4                                     ; $09A71F |
  add   r9                                  ; $09A720 |
  lms   r0,($0012)                          ; $09A721 |
  to r5                                     ; $09A724 |
  add   r10                                 ; $09A725 |
  ibt   r12,#$0004                          ; $09A726 |
  from r15                                  ; $09A728 |
  add   #7                                  ; $09A729 |
  sms   ($0060),r0                          ; $09A72B |
  iwt   r15,#$A769                          ; $09A72E | sub
  nop                                       ; $09A731 |

  sms   ($0092),r11                         ; $09A732 | update OAM pointer
  stop                                      ; $09A735 |
  nop                                       ; $09A736 |

CODE_09A737:
  getb                                      ; $09A737 |
  inc   r14                                 ; $09A738 |
  swap                                      ; $09A739 |
  lms   r6,($0000)                          ; $09A73A |
  to r9                                     ; $09A73D |
  fmult                                     ; $09A73E |
  dec   r7                                  ; $09A73F |
  bmi CODE_09A746                           ; $09A740 |
  inc   r7                                  ; $09A742 |
  with r9                                   ; $09A743 |
  not                                       ; $09A744 |
  inc   r9                                  ; $09A745 |

CODE_09A746:
  getb                                      ; $09A746 |
  inc   r14                                 ; $09A747 |
  swap                                      ; $09A748 |
  lms   r6,($0002)                          ; $09A749 |
  to r10                                    ; $09A74C |
  fmult                                     ; $09A74D |
  lms   r0,($0010)                          ; $09A74E |
  to r4                                     ; $09A751 |
  add   r9                                  ; $09A752 |
  lms   r0,($0012)                          ; $09A753 |
  to r5                                     ; $09A756 |
  add   r10                                 ; $09A757 |
  ibt   r12,#$0010                          ; $09A758 |
  from r15                                  ; $09A75A |
  add   #7                                  ; $09A75B |
  sms   ($0060),r0                          ; $09A75D |
  iwt   r15,#$A769                          ; $09A760 | sub
  nop                                       ; $09A763 |

  sms   ($0092),r11                         ; $09A764 |
  stop                                      ; $09A767 |
  nop                                       ; $09A768 |

; OAM sub
  cache                                     ; $09A769 |
  move  r13,r15                             ; $09A76A |
  to r6                                     ; $09A76C |
  getb                                      ; $09A76D | size first in ROM
  inc   r14                                 ; $09A76E |
  ibt   r8,#$0007                           ; $09A76F |
  from r6                                   ; $09A771 |
  and   #2                                  ; $09A772 |
  beq CODE_09A779                           ; $09A774 |
  nop                                       ; $09A776 |
  ibt   r8,#$000F                           ; $09A777 |

CODE_09A779:
  getbs                                     ; $09A779 |
  inc   r14                                 ; $09A77B |
  dec   r7                                  ; $09A77C |
  bmi CODE_09A782                           ; $09A77D |
  inc   r7                                  ; $09A77F |
  not                                       ; $09A780 |
  sub   r8                                  ; $09A781 |

CODE_09A782:
  add   r4                                  ; $09A782 |
  stw   (r11)                               ; $09A783 | X
  inc   r11                                 ; $09A784 |
  inc   r11                                 ; $09A785 |
  getbs                                     ; $09A786 |
  inc   r14                                 ; $09A788 |
  add   r5                                  ; $09A789 |
  stw   (r11)                               ; $09A78A | Y
  inc   r11                                 ; $09A78B |
  inc   r11                                 ; $09A78C |
  getb                                      ; $09A78D |
  inc   r14                                 ; $09A78E |
  iwt   r8,#$4000                           ; $09A78F |
  getbh                                     ; $09A792 |
  inc   r14                                 ; $09A794 |
  dec   r7                                  ; $09A795 |
  bmi CODE_09A79B                           ; $09A796 |
  inc   r7                                  ; $09A798 |
  xor   r8                                  ; $09A799 |

CODE_09A79B:
  stw   (r11)                               ; $09A79B | tile
  inc   r11                                 ; $09A79C |
  inc   r11                                 ; $09A79D |
  from r6                                   ; $09A79E |
  stw   (r11)                               ; $09A79F | size last in buffer
  inc   r11                                 ; $09A7A0 |
  loop                                      ; $09A7A1 |
  inc   r11                                 ; $09A7A2 |
  lms   r15,($0060)                         ; $09A7A3 |
  nop                                       ; $09A7A6 |

  romb                                      ; $09A7A7 |
  lm    r2,($1972)                          ; $09A7A9 |
  iwt   r0,#$1040                           ; $09A7AD |
  add   r2                                  ; $09A7B0 |
  ldw   (r0)                                ; $09A7B1 |
  hib                                       ; $09A7B2 |
  lsr                                       ; $09A7B3 |
  lsr                                       ; $09A7B4 |
  to r12                                    ; $09A7B5 |
  lsr                                       ; $09A7B6 |
  iwt   r0,#$1402                           ; $09A7B7 |
  add   r2                                  ; $09A7BA |
  ldw   (r0)                                ; $09A7BB |
  mult  r12                                 ; $09A7BC |
  mult  #5                                  ; $09A7BD |
  to r14                                    ; $09A7BF |
  add   r1                                  ; $09A7C0 |
  iwt   r0,#$1400                           ; $09A7C1 |
  add   r2                                  ; $09A7C4 |
  to r3                                     ; $09A7C5 |
  ldw   (r0)                                ; $09A7C6 |
  from r3                                   ; $09A7C7 |
  lsr                                       ; $09A7C8 |
  lsr                                       ; $09A7C9 |
  ror                                       ; $09A7CA |
  to r4                                     ; $09A7CB |
  lsr                                       ; $09A7CC |
  iwt   r0,#$1042                           ; $09A7CD |
  add   r2                                  ; $09A7D0 |
  ldw   (r0)                                ; $09A7D1 |
  swap                                      ; $09A7D2 |
  to r4                                     ; $09A7D3 |
  xor   r4                                  ; $09A7D4 |
  iwt   r0,#$1680                           ; $09A7D6 |
  add   r2                                  ; $09A7D9 |
  to r5                                     ; $09A7DA |
  ldw   (r0)                                ; $09A7DB |
  iwt   r0,#$1682                           ; $09A7DC |
  add   r2                                  ; $09A7DF |
  to r6                                     ; $09A7E0 |
  ldw   (r0)                                ; $09A7E1 |
  iwt   r0,#$1362                           ; $09A7E2 |
  add   r2                                  ; $09A7E5 |
  to r7                                     ; $09A7E6 |
  ldw   (r0)                                ; $09A7E7 |
  from r4                                   ; $09A7E8 |
  add   r4                                  ; $09A7E9 |
  rol                                       ; $09A7EA |
  and   #1                                  ; $09A7EB |
  to r8                                     ; $09A7ED |
  add   r0                                  ; $09A7EE |
  cache                                     ; $09A7EF |
  move  r13,r15                             ; $09A7F0 |
  to r1                                     ; $09A7F2 |
  getb                                      ; $09A7F3 |
  inc   r14                                 ; $09A7F4 |
  getbs                                     ; $09A7F5 |
  inc   r14                                 ; $09A7F7 |
  dec   r3                                  ; $09A7F8 |
  bmi CODE_09A804                           ; $09A7F9 |
  inc   r3                                  ; $09A7FB |
  not                                       ; $09A7FC |
  inc   r0                                  ; $09A7FD |
  dec   r1                                  ; $09A7FE |
  bpl CODE_09A804                           ; $09A7FF |
  inc   r1                                  ; $09A801 |
  add   #8                                  ; $09A802 |

CODE_09A804:
  add   r5                                  ; $09A804 |
  stw   (r7)                                ; $09A805 |
  inc   r7                                  ; $09A806 |
  inc   r7                                  ; $09A807 |
  getbs                                     ; $09A808 |
  inc   r14                                 ; $09A80A |
  dec   r8                                  ; $09A80B |
  bmi CODE_09A817                           ; $09A80C |
  inc   r8                                  ; $09A80E |
  not                                       ; $09A80F |
  inc   r0                                  ; $09A810 |
  dec   r1                                  ; $09A811 |
  bpl CODE_09A817                           ; $09A812 |
  inc   r1                                  ; $09A814 |
  add   #8                                  ; $09A815 |

CODE_09A817:
  add   r6                                  ; $09A817 |
  stw   (r7)                                ; $09A818 |
  inc   r7                                  ; $09A819 |
  inc   r7                                  ; $09A81A |
  getb                                      ; $09A81B |
  inc   r14                                 ; $09A81C |
  getbh                                     ; $09A81D |
  inc   r14                                 ; $09A81F |
  xor   r4                                  ; $09A820 |
  stw   (r7)                                ; $09A822 |
  inc   r7                                  ; $09A823 |
  inc   r7                                  ; $09A824 |
  from r1                                   ; $09A825 |
  stw   (r7)                                ; $09A826 |
  inc   r7                                  ; $09A827 |
  loop                                      ; $09A828 |
  inc   r7                                  ; $09A829 |
  stop                                      ; $09A82A |
  nop                                       ; $09A82B |

  sms   ($0002),r1                          ; $09A82C |
  sms   ($0004),r2                          ; $09A82F |
  iwt   r3,#$3A02                           ; $09A832 |
  iwt   r4,#$0009                           ; $09A835 |
  from r4                                   ; $09A838 |
  romb                                      ; $09A839 |
  iwt   r4,#$00D2                           ; $09A83B |
  iwt   r5,#$AADA                           ; $09A83E |
  sub   #0                                  ; $09A841 |
  beq CODE_09A84A                           ; $09A843 |
  nop                                       ; $09A845 |
  iwt   r15,#$A974                          ; $09A846 |
  nop                                       ; $09A849 |

CODE_09A84A:
  cache                                     ; $09A84A |
  ibt   r0,#$0010                           ; $09A84B |
  from r2                                   ; $09A84D |
  to r12                                    ; $09A84E |
  sub   r0                                  ; $09A84F |
  bpl CODE_09A8AB                           ; $09A850 |
  nop                                       ; $09A852 |
  ibt   r2,#$0000                           ; $09A853 |
  from r12                                  ; $09A855 |
  to r6                                     ; $09A856 |
  not                                       ; $09A857 |
  inc   r6                                  ; $09A858 |
  ibt   r0,#$0020                           ; $09A859 |
  from r6                                   ; $09A85B |
  sub   r0                                  ; $09A85C |
  bpl CODE_09A893                           ; $09A85D |
  nop                                       ; $09A85F |
  from r6                                   ; $09A860 |
  add   r6                                  ; $09A861 |
  add   r0                                  ; $09A862 |
  add   r0                                  ; $09A863 |
  to r6                                     ; $09A864 |
  add   r0                                  ; $09A865 |
  iwt   r0,#$0050                           ; $09A866 |
  from r6                                   ; $09A869 |
  sub   r0                                  ; $09A86A |
  bmi CODE_09A8D5                           ; $09A86B |
  nop                                       ; $09A86D |
  from r12                                  ; $09A86E |
  not                                       ; $09A86F |
  inc   r0                                  ; $09A870 |
  iwt   r9,#$0006                           ; $09A871 |
  sub   r9                                  ; $09A874 |
  from r1                                   ; $09A875 |
  sub   r0                                  ; $09A876 |
  to r10                                    ; $09A877 |
  sub   #11                                 ; $09A878 |
  iwt   r0,#$01B0                           ; $09A87A |
  from r6                                   ; $09A87D |
  sub   r0                                  ; $09A87E |
  bmi CODE_09A8D5                           ; $09A87F |
  nop                                       ; $09A881 |
  from r12                                  ; $09A882 |
  not                                       ; $09A883 |
  inc   r0                                  ; $09A884 |
  iwt   r9,#$001B                           ; $09A885 |
  sub   r9                                  ; $09A888 |
  add   r1                                  ; $09A889 |
  to r5                                     ; $09A88A |
  add   #11                                 ; $09A88B |
  move  r6,r10                              ; $09A88D |
  iwt   r15,#$A937                          ; $09A88F |
  nop                                       ; $09A892 |

CODE_09A893:
  ibt   r0,#$0005                           ; $09A893 |
  from r6                                   ; $09A895 |
  sub   r0                                  ; $09A896 |
  from r1                                   ; $09A897 |
  sub   r0                                  ; $09A898 |
  to r8                                     ; $09A899 |
  sub   #11                                 ; $09A89A |
  ibt   r0,#$001B                           ; $09A89C |
  from r6                                   ; $09A89E |
  sub   r0                                  ; $09A89F |
  from r1                                   ; $09A8A0 |
  sub   r0                                  ; $09A8A1 |
  to r5                                     ; $09A8A2 |
  add   #11                                 ; $09A8A3 |
  move  r6,r8                               ; $09A8A5 |
  iwt   r15,#$A937                          ; $09A8A7 |
  nop                                       ; $09A8AA |

CODE_09A8AB:
  beq CODE_09A8C6                           ; $09A8AB |
  nop                                       ; $09A8AD |
  ibt   r11,#$0000                          ; $09A8AE |
  iwt   r0,#$00FF                           ; $09A8B0 |
  move  r13,r15                             ; $09A8B3 |
  from r11                                  ; $09A8B5 |
  cmp   r4                                  ; $09A8B6 |
  bmi CODE_09A8BF                           ; $09A8B8 |
  nop                                       ; $09A8BA |
  iwt   r15,#$A970                          ; $09A8BB |
  nop                                       ; $09A8BE |

CODE_09A8BF:
  stw   (r3)                                ; $09A8BF |
  inc   r3                                  ; $09A8C0 |
  inc   r3                                  ; $09A8C1 |
  inc   r3                                  ; $09A8C2 |
  inc   r3                                  ; $09A8C3 |
  loop                                      ; $09A8C4 |
  inc   r11                                 ; $09A8C5 |

CODE_09A8C6:
  ibt   r6,#$0000                           ; $09A8C6 |
  ibt   r0,#$0010                           ; $09A8C8 |
  with r2                                   ; $09A8CA |
  sub   r0                                  ; $09A8CB |

CODE_09A8CC:
  from r2                                   ; $09A8CC |
  sub   r4                                  ; $09A8CD |
  bmi CODE_09A8D5                           ; $09A8CE |
  nop                                       ; $09A8D0 |
  iwt   r15,#$A970                          ; $09A8D1 |
  nop                                       ; $09A8D4 |

CODE_09A8D5:
  from r5                                   ; $09A8D5 |
  to r14                                    ; $09A8D6 |
  add   r6                                  ; $09A8D7 |
  getb                                      ; $09A8D8 |
  lsr                                       ; $09A8D9 |
  lsr                                       ; $09A8DA |
  lsr                                       ; $09A8DB |
  to r9                                     ; $09A8DC |
  lsr                                       ; $09A8DD |
  iwt   r0,#$0050                           ; $09A8DE |
  from r6                                   ; $09A8E1 |
  sub   r0                                  ; $09A8E2 |
  bmi CODE_09A8F1                           ; $09A8E3 |
  nop                                       ; $09A8E5 |
  iwt   r0,#$01B0                           ; $09A8E6 |
  from r6                                   ; $09A8E9 |
  sub   r0                                  ; $09A8EA |
  bpl CODE_09A92C                           ; $09A8EB |
  nop                                       ; $09A8ED |
  bra CODE_09A8F4                           ; $09A8EE |

  dec   r10                                 ; $09A8F0 |

CODE_09A8F1:
  from r1                                   ; $09A8F1 |
  to r10                                    ; $09A8F2 |
  sub   r9                                  ; $09A8F3 |

CODE_09A8F4:
  bpl CODE_09A8FD                           ; $09A8F4 |
  nop                                       ; $09A8F6 |
  iwt   r0,#$FF00                           ; $09A8F7 |
  bra CODE_09A908                           ; $09A8FA |
  nop                                       ; $09A8FC |

CODE_09A8FD:
  from r10                                  ; $09A8FD |
  hib                                       ; $09A8FE |
  beq CODE_09A908                           ; $09A8FF |
  from r10                                  ; $09A901 |
  iwt   r0,#$00FF                           ; $09A902 |
  bra CODE_09A920                           ; $09A905 |
  nop                                       ; $09A907 |

CODE_09A908:
  to r8                                     ; $09A908 |
  swap                                      ; $09A909 |
  from r1                                   ; $09A90A |
  to r7                                     ; $09A90B |
  add   r9                                  ; $09A90C |
  bpl CODE_09A916                           ; $09A90D |
  from r7                                   ; $09A90F |
  iwt   r0,#$00FF                           ; $09A910 |
  bra CODE_09A920                           ; $09A913 |
  nop                                       ; $09A915 |

CODE_09A916:
  hib                                       ; $09A916 |
  beq CODE_09A91D                           ; $09A917 |
  nop                                       ; $09A919 |
  iwt   r7,#$00FF                           ; $09A91A |

CODE_09A91D:
  with r7                                   ; $09A91D |
  swap                                      ; $09A91E |
  merge                                     ; $09A91F |

CODE_09A920:
  stw   (r3)                                ; $09A920 |
  inc   r3                                  ; $09A921 |
  inc   r3                                  ; $09A922 |
  inc   r3                                  ; $09A923 |
  inc   r3                                  ; $09A924 |
  ibt   r0,#$0010                           ; $09A925 |
  to r6                                     ; $09A927 |
  add   r6                                  ; $09A928 |
  bra CODE_09A8CC                           ; $09A929 |

  inc   r2                                  ; $09A92B |

CODE_09A92C:
  iwt   r0,#$000B                           ; $09A92C |
  to r5                                     ; $09A92F |
  add   r1                                  ; $09A930 |
  iwt   r0,#$0021                           ; $09A931 |
  from r1                                   ; $09A934 |
  to r6                                     ; $09A935 |
  sub   r0                                  ; $09A936 |

CODE_09A937:
  from r2                                   ; $09A937 |
  sub   r4                                  ; $09A938 |
  bpl CODE_09A970                           ; $09A939 |
  nop                                       ; $09A93B |
  from r6                                   ; $09A93C |
  hib                                       ; $09A93D |
  bpl CODE_09A947                           ; $09A93E |
  nop                                       ; $09A940 |
  iwt   r0,#$FF00                           ; $09A941 |
  bra CODE_09A950                           ; $09A944 |
  nop                                       ; $09A946 |

CODE_09A947:
  beq CODE_09A950                           ; $09A947 |
  from r6                                   ; $09A949 |
  iwt   r0,#$00FF                           ; $09A94A |
  bra CODE_09A966                           ; $09A94D |
  nop                                       ; $09A94F |

CODE_09A950:
  to r8                                     ; $09A950 |
  swap                                      ; $09A951 |
  from r5                                   ; $09A952 |
  hib                                       ; $09A953 |
  bpl CODE_09A95D                           ; $09A954 |
  nop                                       ; $09A956 |
  iwt   r0,#$00FF                           ; $09A957 |
  bra CODE_09A966                           ; $09A95A |
  nop                                       ; $09A95C |

CODE_09A95D:
  beq CODE_09A963                           ; $09A95D |
  from r5                                   ; $09A95F |
  iwt   r0,#$00FF                           ; $09A960 |

CODE_09A963:
  to r7                                     ; $09A963 |
  swap                                      ; $09A964 |
  merge                                     ; $09A965 |

CODE_09A966:
  stw   (r3)                                ; $09A966 |
  inc   r3                                  ; $09A967 |
  inc   r3                                  ; $09A968 |
  inc   r3                                  ; $09A969 |
  inc   r3                                  ; $09A96A |
  dec   r5                                  ; $09A96B |
  dec   r6                                  ; $09A96C |
  bra CODE_09A937                           ; $09A96D |

  inc   r2                                  ; $09A96F |

CODE_09A970:
  iwt   r15,#$AA84                          ; $09A970 |
  nop                                       ; $09A973 |
  cache                                     ; $09A974 |
  ibt   r0,#$0010                           ; $09A975 |
  add   r2                                  ; $09A977 |
  beq CODE_09A97E                           ; $09A978 |
  nop                                       ; $09A97A |
  bpl CODE_09A985                           ; $09A97B |
  nop                                       ; $09A97D |

CODE_09A97E:
  iwt   r12,#$00D2                          ; $09A97E |
  iwt   r15,#$AA79                          ; $09A981 |
  nop                                       ; $09A984 |

CODE_09A985:
  iwt   r0,#$000B                           ; $09A985 |
  to r11                                    ; $09A988 |
  add   r2                                  ; $09A989 |
  sms   ($0006),r11                         ; $09A98A |
  bpl CODE_09A99F                           ; $09A98D |
  nop                                       ; $09A98F |
  iwt   r0,#$0005                           ; $09A990 |
  add   r11                                 ; $09A993 |
  add   r0                                  ; $09A994 |
  add   r0                                  ; $09A995 |
  add   r0                                  ; $09A996 |
  to r6                                     ; $09A997 |
  add   r0                                  ; $09A998 |
  ibt   r2,#$0000                           ; $09A999 |
  iwt   r15,#$AA22                          ; $09A99B |
  nop                                       ; $09A99E |

CODE_09A99F:
  iwt   r0,#$000B                           ; $09A99F |
  add   r1                                  ; $09A9A2 |
  to r9                                     ; $09A9A3 |
  add   r11                                 ; $09A9A4 |
  iwt   r0,#$000B                           ; $09A9A5 |
  from r2                                   ; $09A9A8 |
  to r11                                    ; $09A9A9 |
  sub   r0                                  ; $09A9AA |
  sms   ($0008),r11                         ; $09A9AB |
  bpl CODE_09A9BD                           ; $09A9AE |
  nop                                       ; $09A9B0 |
  iwt   r0,#$001B                           ; $09A9B1 |
  add   r11                                 ; $09A9B4 |
  add   r0                                  ; $09A9B5 |
  add   r0                                  ; $09A9B6 |
  add   r0                                  ; $09A9B7 |
  to r6                                     ; $09A9B8 |
  add   r0                                  ; $09A9B9 |
  bra CODE_09A9C7                           ; $09A9BA |
  nop                                       ; $09A9BC |

CODE_09A9BD:
  iwt   r0,#$000B                           ; $09A9BD |
  from r1                                   ; $09A9C0 |
  sub   r0                                  ; $09A9C1 |
  to r10                                    ; $09A9C2 |
  add   r11                                 ; $09A9C3 |
  iwt   r6,#$01A0                           ; $09A9C4 |

CODE_09A9C7:
  ibt   r2,#$0000                           ; $09A9C7 |

CODE_09A9C9:
  from r2                                   ; $09A9C9 |
  sub   r4                                  ; $09A9CA |
  bmi CODE_09A9D2                           ; $09A9CB |
  nop                                       ; $09A9CD |
  iwt   r15,#$A970                          ; $09A9CE |
  nop                                       ; $09A9D1 |

CODE_09A9D2:
  lms   r0,($0008)                          ; $09A9D2 |
  from r2                                   ; $09A9D5 |
  sub   r0                                  ; $09A9D6 |
  bmi CODE_09A9F4                           ; $09A9D7 |
  nop                                       ; $09A9D9 |
  lms   r0,($0006)                          ; $09A9DA |
  from r2                                   ; $09A9DD |
  sub   r0                                  ; $09A9DE |
  bpl CODE_09AA22                           ; $09A9DF |
  nop                                       ; $09A9E1 |
  from r6                                   ; $09A9E2 |
  to r14                                    ; $09A9E3 |
  add   r5                                  ; $09A9E4 |
  ibt   r0,#$0010                           ; $09A9E5 |
  with r6                                   ; $09A9E7 |
  sub   r0                                  ; $09A9E8 |
  getb                                      ; $09A9E9 |
  lsr                                       ; $09A9EA |
  lsr                                       ; $09A9EB |
  lsr                                       ; $09A9EC |
  lsr                                       ; $09A9ED |
  sms   ($000A),r0                          ; $09A9EE |
  from r1                                   ; $09A9F1 |
  to r10                                    ; $09A9F2 |
  sub   r0                                  ; $09A9F3 |

CODE_09A9F4:
  from r10                                  ; $09A9F4 |
  hib                                       ; $09A9F5 |
  beq CODE_09AA08                           ; $09A9F6 |
  from r10                                  ; $09A9F8 |
  bpl CODE_09AA02                           ; $09A9F9 |
  nop                                       ; $09A9FB |
  iwt   r0,#$0000                           ; $09A9FC |
  bra CODE_09AA08                           ; $09A9FF |
  nop                                       ; $09AA01 |

CODE_09AA02:
  iwt   r0,#$00FF                           ; $09AA02 |
  bra CODE_09AA18                           ; $09AA05 |
  nop                                       ; $09AA07 |

CODE_09AA08:
  to r8                                     ; $09AA08 |
  swap                                      ; $09AA09 |
  from r9                                   ; $09AA0A |
  hib                                       ; $09AA0B |
  beq CODE_09AA15                           ; $09AA0C |
  from r9                                   ; $09AA0E |
  bmi CODE_09AA02                           ; $09AA0F |
  nop                                       ; $09AA11 |
  iwt   r0,#$00FF                           ; $09AA12 |

CODE_09AA15:
  to r7                                     ; $09AA15 |
  swap                                      ; $09AA16 |
  merge                                     ; $09AA17 |

CODE_09AA18:
  stw   (r3)                                ; $09AA18 |
  inc   r3                                  ; $09AA19 |
  inc   r3                                  ; $09AA1A |
  inc   r3                                  ; $09AA1B |
  inc   r3                                  ; $09AA1C |
  dec   r9                                  ; $09AA1D |
  dec   r10                                 ; $09AA1E |
  bra CODE_09A9C9                           ; $09AA1F |

  inc   r2                                  ; $09AA21 |

CODE_09AA22:
  from r2                                   ; $09AA22 |
  sub   r4                                  ; $09AA23 |
  bpl CODE_09AA84                           ; $09AA24 |
  nop                                       ; $09AA26 |
  from r6                                   ; $09AA27 |
  to r14                                    ; $09AA28 |
  add   r5                                  ; $09AA29 |
  getb                                      ; $09AA2A |
  lsr                                       ; $09AA2B |
  lsr                                       ; $09AA2C |
  lsr                                       ; $09AA2D |
  to r11                                    ; $09AA2E |
  lsr                                       ; $09AA2F |
  from r1                                   ; $09AA30 |
  sub   r11                                 ; $09AA31 |
  from r1                                   ; $09AA32 |
  to r10                                    ; $09AA33 |
  sub   r11                                 ; $09AA34 |
  bpl CODE_09AA3D                           ; $09AA35 |
  from r10                                  ; $09AA37 |
  ibt   r0,#$0000                           ; $09AA38 |
  bra CODE_09AA47                           ; $09AA3A |
  nop                                       ; $09AA3C |

CODE_09AA3D:
  hib                                       ; $09AA3D |
  beq CODE_09AA47                           ; $09AA3E |
  from r10                                  ; $09AA40 |
  iwt   r0,#$00FF                           ; $09AA41 |
  bra CODE_09AA5E                           ; $09AA44 |
  nop                                       ; $09AA46 |

CODE_09AA47:
  to r8                                     ; $09AA47 |
  swap                                      ; $09AA48 |
  from r1                                   ; $09AA49 |
  to r10                                    ; $09AA4A |
  add   r11                                 ; $09AA4B |
  bpl CODE_09AA55                           ; $09AA4C |
  from r10                                  ; $09AA4E |
  iwt   r0,#$00FF                           ; $09AA4F |
  bra CODE_09AA5E                           ; $09AA52 |
  nop                                       ; $09AA54 |

CODE_09AA55:
  hib                                       ; $09AA55 |
  beq CODE_09AA5B                           ; $09AA56 |
  from r10                                  ; $09AA58 |
  ibt   r0,#$FFFF                           ; $09AA59 |

CODE_09AA5B:
  to r7                                     ; $09AA5B |
  swap                                      ; $09AA5C |
  merge                                     ; $09AA5D |

CODE_09AA5E:
  stw   (r3)                                ; $09AA5E |
  inc   r3                                  ; $09AA5F |
  inc   r3                                  ; $09AA60 |
  inc   r3                                  ; $09AA61 |
  inc   r3                                  ; $09AA62 |
  ibt   r0,#$0010                           ; $09AA63 |
  with r6                                   ; $09AA65 |
  sub   r0                                  ; $09AA66 |
  bpl CODE_09AA22                           ; $09AA67 |
  inc   r2                                  ; $09AA69 |
  from r4                                   ; $09AA6A |
  to r12                                    ; $09AA6B |
  sub   r2                                  ; $09AA6C |
  beq CODE_09AA84                           ; $09AA6D |
  nop                                       ; $09AA6F |
  bmi CODE_09AA84                           ; $09AA70 |
  nop                                       ; $09AA72 |
  bra CODE_09AA79                           ; $09AA73 |
  nop                                       ; $09AA75 |

  iwt   r12,#$00D2                          ; $09AA76 |

CODE_09AA79:
  iwt   r0,#$00FF                           ; $09AA79 |
  move  r13,r15                             ; $09AA7C |
  stw   (r3)                                ; $09AA7E |
  inc   r3                                  ; $09AA7F |
  inc   r3                                  ; $09AA80 |
  inc   r3                                  ; $09AA81 |
  loop                                      ; $09AA82 |
  inc   r3                                  ; $09AA83 |

CODE_09AA84:
  cache                                     ; $09AA84 |
  lms   r1,($0002)                          ; $09AA85 |
  lms   r2,($0004)                          ; $09AA88 |
  iwt   r3,#$3A04                           ; $09AA8B |
  iwt   r12,#$00D2                          ; $09AA8E |
  ibt   r0,#$0016                           ; $09AA91 |
  add   r1                                  ; $09AA93 |
  to r1                                     ; $09AA94 |
  add   r2                                  ; $09AA95 |
  bpl CODE_09AA9F                           ; $09AA96 |
  nop                                       ; $09AA98 |
  iwt   r0,#$FF00                           ; $09AA99 |
  bra CODE_09AAD0                           ; $09AA9C |
  nop                                       ; $09AA9E |

CODE_09AA9F:
  iwt   r0,#$01D2                           ; $09AA9F |
  from r1                                   ; $09AAA2 |
  sub   r0                                  ; $09AAA3 |
  bpl CODE_09AACD                           ; $09AAA4 |
  nop                                       ; $09AAA6 |
  iwt   r7,#$FF00                           ; $09AAA7 |
  move  r13,r15                             ; $09AAAA |
  from r1                                   ; $09AAAC |
  sub   #0                                  ; $09AAAD |
  bpl CODE_09AAB8                           ; $09AAAF |
  from r1                                   ; $09AAB1 |
  iwt   r0,#$FF00                           ; $09AAB2 |
  bra CODE_09AAC4                           ; $09AAB5 |
  nop                                       ; $09AAB7 |

CODE_09AAB8:
  hib                                       ; $09AAB8 |
  beq CODE_09AAC2                           ; $09AAB9 |
  nop                                       ; $09AABB |
  iwt   r0,#$00FF                           ; $09AABC |
  bra CODE_09AAC4                           ; $09AABF |
  nop                                       ; $09AAC1 |

CODE_09AAC2:
  from r1                                   ; $09AAC2 |
  or    r7                                  ; $09AAC3 |

CODE_09AAC4:
  stw   (r3)                                ; $09AAC4 |
  inc   r3                                  ; $09AAC5 |
  inc   r3                                  ; $09AAC6 |
  inc   r3                                  ; $09AAC7 |
  inc   r3                                  ; $09AAC8 |
  loop                                      ; $09AAC9 |
  dec   r1                                  ; $09AACA |
  stop                                      ; $09AACB |
  nop                                       ; $09AACC |

CODE_09AACD:
  iwt   r0,#$00FF                           ; $09AACD |

CODE_09AAD0:
  move  r13,r15                             ; $09AAD0 |
  stw   (r3)                                ; $09AAD2 |
  inc   r3                                  ; $09AAD3 |
  inc   r3                                  ; $09AAD4 |
  inc   r3                                  ; $09AAD5 |
  loop                                      ; $09AAD6 |
  inc   r3                                  ; $09AAD7 |
  stop                                      ; $09AAD8 |
  nop                                       ; $09AAD9 |

  db $16, $1F, $27, $2D, $32, $37, $3B, $3F ; $09AADA |
  db $43, $46, $4A, $4D, $50, $53, $56, $59 ; $09AAE2 |
  db $5B, $5E, $60, $63, $65, $67, $6A, $6C ; $09AAEA |
  db $6E, $70, $72, $74, $76, $78, $7A, $7B ; $09AAF2 |
  db $7D, $7F, $81, $82, $84, $86, $87, $89 ; $09AAFA |
  db $8A, $8C, $8E, $8F, $90, $92, $93, $95 ; $09AB02 |
  db $96, $97, $99, $9A, $9B, $9D, $9E, $9F ; $09AB0A |
  db $A1, $A2, $A3, $A4, $A5, $A7, $A8, $A9 ; $09AB12 |
  db $AA, $AB, $AC, $AD, $AE, $AF, $B0, $B1 ; $09AB1A |
  db $B3, $B4, $B5, $B6, $B7, $B7, $B8, $B9 ; $09AB22 |
  db $BA, $BB, $BC, $BD, $BE, $BF, $C0, $C1 ; $09AB2A |
  db $C2, $C2, $C3, $C4, $C5, $C6, $C7, $C7 ; $09AB32 |
  db $C8, $C9, $CA, $CA, $CB, $CC, $CD, $CD ; $09AB3A |
  db $CE, $CF, $D0, $D0, $D1, $D2, $D2, $D3 ; $09AB42 |
  db $D4, $D5, $D5, $D6, $D6, $D7, $D8, $D8 ; $09AB4A |
  db $D9, $DA, $DA, $DB, $DB, $DC, $DD, $DD ; $09AB52 |
  db $DE, $DE, $DF, $DF, $E0, $E1, $E1, $E2 ; $09AB5A |
  db $E2, $E3, $E3, $E4, $E4, $E5, $E5, $E6 ; $09AB62 |
  db $E6, $E7, $E7, $E8, $E8, $E9, $E9, $E9 ; $09AB6A |
  db $EA, $EA, $EB, $EB, $EC, $EC, $EC, $ED ; $09AB72 |
  db $ED, $EE, $EE, $EE, $EF, $EF, $F0, $F0 ; $09AB7A |
  db $F0, $F1, $F1, $F1, $F2, $F2, $F2, $F3 ; $09AB82 |
  db $F3, $F3, $F4, $F4, $F4, $F5, $F5, $F5 ; $09AB8A |
  db $F5, $F6, $F6, $F6, $F7, $F7, $F7, $F7 ; $09AB92 |
  db $F8, $F8, $F8, $F8, $F9, $F9, $F9, $F9 ; $09AB9A |
  db $FA, $FA, $FA, $FA, $FA, $FB, $FB, $FB ; $09ABA2 |
  db $FB, $FB, $FC, $FC, $FC, $FC, $FC, $FC ; $09ABAA |
  db $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD ; $09ABB2 |
  db $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $09ABBA |
  db $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09ABC2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09ABCA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09ABD2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09ABDA |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09ABE2 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE ; $09ABEA |
  db $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $09ABF2 |
  db $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD ; $09ABFA |
  db $FC, $FC, $FC, $FC, $FC, $FC, $FB, $FB ; $09AC02 |
  db $FB, $FB, $FB, $FA, $FA, $FA, $FA, $FA ; $09AC0A |
  db $F9, $F9, $F9, $F9, $F8, $F8, $F8, $F8 ; $09AC12 |
  db $F7, $F7, $F7, $F7, $F6, $F6, $F6, $F5 ; $09AC1A |
  db $F5, $F5, $F5, $F4, $F4, $F4, $F3, $F3 ; $09AC22 |
  db $F3, $F2, $F2, $F2, $F1, $F1, $F1, $F0 ; $09AC2A |
  db $F0, $F0, $EF, $EF, $EE, $EE, $EE, $ED ; $09AC32 |
  db $ED, $EC, $EC, $EC, $EB, $EB, $EA, $EA ; $09AC3A |
  db $E9, $E9, $E9, $E8, $E8, $E7, $E7, $E6 ; $09AC42 |
  db $E6, $E5, $E5, $E4, $E4, $E3, $E3, $E2 ; $09AC4A |
  db $E2, $E1, $E1, $E0, $DF, $DF, $DE, $DE ; $09AC52 |
  db $DD, $DD, $DC, $DB, $DB, $DA, $DA, $D9 ; $09AC5A |
  db $D8, $D8, $D7, $D6, $D6, $D5, $D5, $D4 ; $09AC62 |
  db $D3, $D2, $D2, $D1, $D0, $D0, $CF, $CE ; $09AC6A |
  db $CD, $CD, $CC, $CB, $CA, $CA, $C9, $C8 ; $09AC72 |
  db $C7, $C7, $C6, $C5, $C4, $C3, $C2, $C2 ; $09AC7A |
  db $C1, $C0, $BF, $BE, $BD, $BC, $BB, $BA ; $09AC82 |
  db $B9, $B8, $B7, $B7, $B6, $B5, $B4, $B3 ; $09AC8A |
  db $B1, $B0, $AF, $AE, $AD, $AC, $AB, $AA ; $09AC92 |
  db $A9, $A8, $A7, $A5, $A4, $A3, $A2, $A1 ; $09AC9A |
  db $9F, $9E, $9D, $9B, $9A, $99, $97, $96 ; $09ACA2 |
  db $95, $93, $92, $90, $8F, $8E, $8C, $8A ; $09ACAA |
  db $89, $87, $86, $84, $82, $81, $7F, $7D ; $09ACB2 |
  db $7B, $7A, $78, $76, $74, $72, $70, $6E ; $09ACBA |
  db $6C, $6A, $67, $65, $63, $60, $5E, $5B ; $09ACC2 |
  db $59, $56, $53, $50, $4D, $4A, $46, $43 ; $09ACCA |
  db $3F, $3B, $37, $32, $2D, $27, $1F, $16 ; $09ACD2 |

  cache                                     ; $09ACDA |
  lm    r1,($1972)                          ; $09ACDB |
  lm    r2,($0092)                          ; $09ACDF |
  iwt   r0,#$1680                           ; $09ACE3 |
  add   r1                                  ; $09ACE6 |
  to r3                                     ; $09ACE7 |
  ldw   (r0)                                ; $09ACE8 |
  iwt   r0,#$1682                           ; $09ACE9 |
  add   r1                                  ; $09ACEC |
  to r4                                     ; $09ACED |
  ldw   (r0)                                ; $09ACEE |

CODE_09ACEF:
  dec   r5                                  ; $09ACEF |
  bmi CODE_09AD56                           ; $09ACF0 |
  nop                                       ; $09ACF2 |
  iwt   r0,#$0008                           ; $09ACF3 |
  romb                                      ; $09ACF6 |
  iwt   r0,#$AE58                           ; $09ACF8 |
  to r14                                    ; $09ACFB |
  add   r9                                  ; $09ACFC |
  getbs                                     ; $09ACFD |
  asr                                       ; $09ACFF |
  asr                                       ; $09AD00 |
  asr                                       ; $09AD01 |
  asr                                       ; $09AD02 |
  mult  r10                                 ; $09AD03 |
  add   r0                                  ; $09AD04 |
  add   r0                                  ; $09AD05 |
  hib                                       ; $09AD06 |
  sex                                       ; $09AD07 |
  to r8                                     ; $09AD08 |
  add   r4                                  ; $09AD09 |
  iwt   r0,#$0009                           ; $09AD0A |
  romb                                      ; $09AD0D |
  iwt   r0,#$AD5C                           ; $09AD0F |
  add   r9                                  ; $09AD12 |
  to r9                                     ; $09AD13 |
  lob                                       ; $09AD14 |
  iwt   r0,#$AD61                           ; $09AD15 |
  to r14                                    ; $09AD18 |
  add   r5                                  ; $09AD19 |
  getb                                      ; $09AD1A |
  umult r6                                  ; $09AD1B |
  add   r0                                  ; $09AD1D |
  hib                                       ; $09AD1E |
  from r3                                   ; $09AD1F |
  to r7                                     ; $09AD20 |
  sub   r0                                  ; $09AD21 |
  iwt   r0,#$AD66                           ; $09AD22 |
  to r14                                    ; $09AD25 |
  add   r5                                  ; $09AD26 |
  to r12                                    ; $09AD27 |
  getb                                      ; $09AD28 |
  iwt   r0,#$AD6B                           ; $09AD29 |
  add   r5                                  ; $09AD2C |
  to r14                                    ; $09AD2D |
  add   r5                                  ; $09AD2E |
  getb                                      ; $09AD2F |
  inc   r14                                 ; $09AD30 |
  getbh                                     ; $09AD31 |
  move  r14,r0                              ; $09AD33 |
  move  r13,r15                             ; $09AD35 |
  getbs                                     ; $09AD37 |
  inc   r14                                 ; $09AD39 |
  add   r7                                  ; $09AD3A |
  stw   (r2)                                ; $09AD3B |
  inc   r2                                  ; $09AD3C |
  inc   r2                                  ; $09AD3D |
  getbs                                     ; $09AD3E |
  inc   r14                                 ; $09AD40 |
  add   r8                                  ; $09AD41 |
  stw   (r2)                                ; $09AD42 |
  inc   r2                                  ; $09AD43 |
  inc   r2                                  ; $09AD44 |
  getb                                      ; $09AD45 |
  inc   r14                                 ; $09AD46 |
  getbh                                     ; $09AD47 |
  inc   r14                                 ; $09AD49 |
  stw   (r2)                                ; $09AD4A |
  inc   r2                                  ; $09AD4B |
  inc   r2                                  ; $09AD4C |
  getb                                      ; $09AD4D |
  inc   r14                                 ; $09AD4E |
  stw   (r2)                                ; $09AD4F |
  inc   r2                                  ; $09AD50 |
  loop                                      ; $09AD51 |
  inc   r2                                  ; $09AD52 |
  bra CODE_09ACEF                           ; $09AD53 |
  nop                                       ; $09AD55 |

CODE_09AD56:
  sm    ($0092),r2                          ; $09AD56 |
  stop                                      ; $09AD5A |
  nop                                       ; $09AD5B |

  db $A0, $10, $D0, $40, $00, $00, $28, $4E ; $09AD5C |
  db $72, $98, $06, $0B, $08, $0C, $11      ; $09AD64 |

  dw $AE65, $AE2E, $AE06, $ADCA             ; $09AD6B |
  dw $AD75                                  ; $09AD73 |

  db $20, $20, $BA, $37, $00, $20, $18, $BA ; $09AD75 |
  db $37, $00, $1A, $10, $A3, $37, $00, $12 ; $09AD7D |
  db $10, $A2, $37, $00, $18, $20, $B4, $37 ; $09AD85 |
  db $00, $10, $18, $B2, $37, $00, $18, $18 ; $09AD8D |
  db $B3, $37, $00, $10, $20, $A2, $37, $00 ; $09AD95 |
  db $20, $28, $95, $37, $00, $00, $28, $BB ; $09AD9D |
  db $37, $00, $18, $28, $94, $37, $00, $10 ; $09ADA5 |
  db $28, $85, $37, $00, $08, $28, $84, $37 ; $09ADAD |
  db $00, $08, $00, $96, $37, $00, $10, $00 ; $09ADB5 |
  db $82, $37, $02, $00, $18, $A0, $37, $02 ; $09ADBD |
  db $00, $08, $80, $37, $02                ; $09ADC5 |

  db $18, $08, $80, $77, $02, $10, $20, $A2 ; $09ADCA |
  db $37, $00, $00, $28, $BB, $37, $00, $20 ; $09ADD2 |
  db $28, $95, $37, $00, $18, $28, $94, $37 ; $09ADDA |
  db $00, $10, $28, $85, $37, $00, $08, $28 ; $09ADE2 |
  db $84, $37, $00, $18, $18, $A4, $37, $02 ; $09ADEA |
  db $08, $00, $96, $37, $00, $10, $00, $82 ; $09ADF2 |
  db $37, $02, $00, $08, $80, $37, $02, $00 ; $09ADFA |
  db $18, $A0, $37, $02                     ; $09AE02 |

  db $0F, $00, $86, $37, $00, $17, $00, $87 ; $09AE06 |
  db $37, $00, $18, $08, $88, $37, $00, $18 ; $09AE0E |
  db $20, $AB, $37, $02, $18, $10, $8B, $37 ; $09AE16 |
  db $02, $08, $08, $89, $37, $02, $08, $18 ; $09AE1E |
  db $97, $37, $02, $00, $20, $A6, $37, $02 ; $09AE26 |

  db $08, $18, $B8, $37, $00, $08, $10, $B8 ; $09AE2E |
  db $37, $00, $18, $20, $A2, $37, $00, $18 ; $09AE36 |
  db $28, $85, $37, $00, $20, $28, $BD, $37 ; $09AE3E |
  db $00, $20, $20, $AD, $37, $00, $10, $10 ; $09AE46 |
  db $BA, $37, $00, $10, $18, $BA, $37, $00 ; $09AE4E |
  db $08, $00, $A9, $37, $02, $08, $20, $8E ; $09AE56 |
  db $37, $02, $00, $20, $8D, $37, $02      ; $09AE5E |

  db $00, $18, $B8, $37, $00, $00, $10, $B8 ; $09AE65 |
  db $37, $00, $08, $10, $BA, $37, $00, $08 ; $09AE6D |
  db $18, $BA, $37, $00, $00, $20, $AE, $37 ; $09AE75 |
  db $02, $00, $00, $A9, $37, $02           ; $09AE7D |

  romb                                      ; $09AE83 |
  move  r14,r5                              ; $09AE85 |
  cache                                     ; $09AE87 |
  lm    r1,($1972)                          ; $09AE88 |
  lm    r2,($0092)                          ; $09AE8C |
  iwt   r0,#$1680                           ; $09AE90 |
  add   r1                                  ; $09AE93 |
  to r3                                     ; $09AE94 |
  ldw   (r0)                                ; $09AE95 |
  iwt   r0,#$1682                           ; $09AE96 |
  add   r1                                  ; $09AE99 |
  to r4                                     ; $09AE9A |
  ldw   (r0)                                ; $09AE9B |
  move  r13,r15                             ; $09AE9C |
  getbs                                     ; $09AE9E |
  inc   r14                                 ; $09AEA0 |
  add   r3                                  ; $09AEA1 |
  stw   (r2)                                ; $09AEA2 |
  inc   r2                                  ; $09AEA3 |
  inc   r2                                  ; $09AEA4 |
  getbs                                     ; $09AEA5 |
  inc   r14                                 ; $09AEA7 |
  add   r4                                  ; $09AEA8 |
  stw   (r2)                                ; $09AEA9 |
  inc   r2                                  ; $09AEAA |
  inc   r2                                  ; $09AEAB |
  getb                                      ; $09AEAC |
  inc   r14                                 ; $09AEAD |
  getbh                                     ; $09AEAE |
  inc   r14                                 ; $09AEB0 |
  stw   (r2)                                ; $09AEB1 |
  inc   r2                                  ; $09AEB2 |
  inc   r2                                  ; $09AEB3 |
  getb                                      ; $09AEB4 |
  inc   r14                                 ; $09AEB5 |
  stw   (r2)                                ; $09AEB6 |
  inc   r2                                  ; $09AEB7 |
  inc   r2                                  ; $09AEB8 |
  loop                                      ; $09AEB9 |
  nop                                       ; $09AEBA |
  sm    ($0092),r2                          ; $09AEBB |
  stop                                      ; $09AEBF |
  nop                                       ; $09AEC0 |

  romb                                      ; $09AEC1 |
  lm    r2,($1972)                          ; $09AEC3 |
  iwt   r0,#$1040                           ; $09AEC7 |
  add   r2                                  ; $09AECA |
  ldw   (r0)                                ; $09AECB |
  hib                                       ; $09AECC |
  lsr                                       ; $09AECD |
  lsr                                       ; $09AECE |
  to r12                                    ; $09AECF |
  lsr                                       ; $09AED0 |
  iwt   r0,#$1402                           ; $09AED1 |
  add   r2                                  ; $09AED4 |
  ldw   (r0)                                ; $09AED5 |
  mult  r12                                 ; $09AED6 |
  mult  #5                                  ; $09AED7 |
  to r14                                    ; $09AED9 |
  add   r1                                  ; $09AEDA |
  iwt   r0,#$1400                           ; $09AEDB |
  add   r2                                  ; $09AEDE |
  to r3                                     ; $09AEDF |
  ldw   (r0)                                ; $09AEE0 |
  from r3                                   ; $09AEE1 |
  lsr                                       ; $09AEE2 |
  lsr                                       ; $09AEE3 |
  ror                                       ; $09AEE4 |
  to r4                                     ; $09AEE5 |
  lsr                                       ; $09AEE6 |
  iwt   r0,#$1680                           ; $09AEE7 |
  add   r2                                  ; $09AEEA |
  to r5                                     ; $09AEEB |
  ldw   (r0)                                ; $09AEEC |
  iwt   r0,#$1682                           ; $09AEED |
  add   r2                                  ; $09AEF0 |
  to r6                                     ; $09AEF1 |
  ldw   (r0)                                ; $09AEF2 |
  iwt   r0,#$1362                           ; $09AEF3 |
  add   r2                                  ; $09AEF6 |
  to r7                                     ; $09AEF7 |
  ldw   (r0)                                ; $09AEF8 |
  iwt   r0,#$1042                           ; $09AEF9 |
  add   r2                                  ; $09AEFC |
  ldw   (r0)                                ; $09AEFD |
  to r8                                     ; $09AEFE |
  swap                                      ; $09AEFF |
  iwt   r0,#$CFFF                           ; $09AF00 |
  and   r8                                  ; $09AF03 |
  to r4                                     ; $09AF04 |
  xor   r4                                  ; $09AF05 |
  iwt   r0,#$3000                           ; $09AF07 |
  to r8                                     ; $09AF0A |
  and   r8                                  ; $09AF0B |
  ibt   r9,#$0005                           ; $09AF0C |
  cache                                     ; $09AF0E |
  move  r13,r15                             ; $09AF0F |
  to r1                                     ; $09AF11 |
  getb                                      ; $09AF12 |
  inc   r14                                 ; $09AF13 |
  getbs                                     ; $09AF14 |
  inc   r14                                 ; $09AF16 |
  dec   r9                                  ; $09AF17 |
  bmi CODE_09AF27                           ; $09AF18 |
  inc   r9                                  ; $09AF1A |
  dec   r3                                  ; $09AF1B |
  bmi CODE_09AF27                           ; $09AF1C |
  inc   r3                                  ; $09AF1E |
  not                                       ; $09AF1F |
  inc   r0                                  ; $09AF20 |
  dec   r1                                  ; $09AF21 |
  bpl CODE_09AF27                           ; $09AF22 |
  inc   r1                                  ; $09AF24 |
  add   #8                                  ; $09AF25 |

CODE_09AF27:
  add   r5                                  ; $09AF27 |
  stw   (r7)                                ; $09AF28 |
  inc   r7                                  ; $09AF29 |
  inc   r7                                  ; $09AF2A |
  getbs                                     ; $09AF2B |
  inc   r14                                 ; $09AF2D |
  add   r6                                  ; $09AF2E |
  stw   (r7)                                ; $09AF2F |
  inc   r7                                  ; $09AF30 |
  inc   r7                                  ; $09AF31 |
  getb                                      ; $09AF32 |
  inc   r14                                 ; $09AF33 |
  getbh                                     ; $09AF34 |
  inc   r14                                 ; $09AF36 |
  dec   r9                                  ; $09AF37 |
  bmi CODE_09AF3D                           ; $09AF38 |
  inc   r9                                  ; $09AF3A |
  xor   r4                                  ; $09AF3B |

CODE_09AF3D:
  xor   r8                                  ; $09AF3D |
  stw   (r7)                                ; $09AF3F |
  inc   r7                                  ; $09AF40 |
  inc   r7                                  ; $09AF41 |
  from r1                                   ; $09AF42 |
  stw   (r7)                                ; $09AF43 |
  inc   r7                                  ; $09AF44 |
  inc   r7                                  ; $09AF45 |
  loop                                      ; $09AF46 |
  dec   r9                                  ; $09AF47 |
  stop                                      ; $09AF48 |
  nop                                       ; $09AF49 |

; bonus item routine
; loops through all current sprites and checks if
; any sprites with flags #$6000 set at $0FA2 table
; result returned with r11, $00 if ememy found, $FF if not
  cache                                     ; $09AF4A |
  iwt   r1,#$0F00                           ; $09AF4B |
  iwt   r2,#$0FA2                           ; $09AF4E |
  iwt   r3,#$6000                           ; $09AF51 |
  ibt   r4,#$0004                           ; $09AF54 |
  ibt   r11,#$0000                          ; $09AF56 |
  ibt   r12,#$0018                          ; $09AF58 |
  move  r13,r15                             ; $09AF5A |
  ldw   (r1)                                ; $09AF5C |
  sub   #0                                  ; $09AF5D |
  beq CODE_09AF67                           ; $09AF5F |
  nop                                       ; $09AF61 |
  ldw   (r2)                                ; $09AF62 |
  and   r3                                  ; $09AF63 |
  beq CODE_09AF6E                           ; $09AF64 |
  nop                                       ; $09AF66 |

CODE_09AF67:
  with r1                                   ; $09AF67 |
  add   r4                                  ; $09AF68 |
  with r2                                   ; $09AF69 |
  add   r4                                  ; $09AF6A |
  loop                                      ; $09AF6B |
  nop                                       ; $09AF6C |
  dec   r11                                 ; $09AF6D |

CODE_09AF6E:
  stop                                      ; $09AF6E |
  nop                                       ; $09AF6F |

; freespace
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF70 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF78 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF80 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF88 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF90 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AF98 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFA0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFA8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFB0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFB8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFC0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFC8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFD0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFD8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFE0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFE8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFF0 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09AFF8 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B000 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B008 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B010 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B018 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B020 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B028 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09B030 |
  db $01, $01, $01, $01, $01, $01           ; $09B038 |

  ibt   r0,#$0009                           ; $09B03E |
  romb                                      ; $09B040 |
  ibt   r0,#$0000                           ; $09B042 |
  cmode                                     ; $09B044 |
  ibt   r0,#$0003                           ; $09B046 |
  color                                     ; $09B048 |
  lm    r0,($406E)                          ; $09B049 |
  add   r0                                  ; $09B04D |
  add   r0                                  ; $09B04E |
  inc   r0                                  ; $09B04F |
  to r15                                    ; $09B050 |
  add   r15                                 ; $09B051 |
  iwt   r15,#$B05F                          ; $09B052 |
  nop                                       ; $09B055 |
  nop                                       ; $09B056 |
  fmult                                     ; $09B057 |
  from r0                                   ; $09B058 |
  nop                                       ; $09B059 |
  nop                                       ; $09B05A |
  dec   r1                                  ; $09B05B |
  from r4                                   ; $09B05C |
  nop                                       ; $09B05D |
  nop                                       ; $09B05E |
  ibt   r0,#$0001                           ; $09B05F |
  sm    ($406E),r0                          ; $09B061 |
  sub   r0                                  ; $09B065 |
  sm    ($407E),r0                          ; $09B066 |
  sm    ($4084),r0                          ; $09B06A |
  sm    ($4088),r0                          ; $09B06E |
  sm    ($408A),r0                          ; $09B072 |
  sm    ($4080),r0                          ; $09B076 |
  sm    ($4082),r0                          ; $09B07A |
  sm    ($4094),r0                          ; $09B07E |
  ibt   r0,#$0010                           ; $09B082 |
  sm    ($4086),r0                          ; $09B084 |
  lm    r0,($4096)                          ; $09B088 |
  sm    ($407C),r0                          ; $09B08C |
  iwt   r0,#$00FF                           ; $09B090 |
  iwt   r1,#$4E00                           ; $09B093 |
  iwt   r12,#$0500                          ; $09B096 |
  move  r13,r15                             ; $09B099 |
  stw   (r1)                                ; $09B09B |
  inc   r1                                  ; $09B09C |
  loop                                      ; $09B09D |
  inc   r1                                  ; $09B09E |
  sub   r0                                  ; $09B09F |
  sms   ($007A),r0                          ; $09B0A0 |
  lm    r0,($4088)                          ; $09B0A3 |
  dec   r0                                  ; $09B0A7 |
  bmi CODE_09B0AF                           ; $09B0A8 |
  sbk                                       ; $09B0AA |
  iwt   r15,#$BA99                          ; $09B0AB |
  nop                                       ; $09B0AE |

CODE_09B0AF:
  lm    r0,($408A)                          ; $09B0AF |
  sm    ($4088),r0                          ; $09B0B3 |
  lm    r0,($4098)                          ; $09B0B7 |
  romb                                      ; $09B0BB |
  lm    r14,($407C)                         ; $09B0BD |
  getb                                      ; $09B0C1 |
  inc   r14                                 ; $09B0C2 |
  getbh                                     ; $09B0C3 |
  sm    ($4072),r0                          ; $09B0C5 |
  ibt   r1,#$0009                           ; $09B0C9 |
  from r1                                   ; $09B0CB |
  romb                                      ; $09B0CC |
  move  r1,r0                               ; $09B0CE |
  inc   r0                                  ; $09B0D0 |
  lob                                       ; $09B0D1 |
  beq CODE_09B0D9                           ; $09B0D2 |
  nop                                       ; $09B0D4 |
  iwt   r15,#$B4E3                          ; $09B0D5 |
  nop                                       ; $09B0D8 |

CODE_09B0D9:
  from r1                                   ; $09B0D9 |
  hib                                       ; $09B0DA |
  add   r0                                  ; $09B0DB |
  add   r0                                  ; $09B0DC |
  inc   r0                                  ; $09B0DD |
  to r15                                    ; $09B0DE |
  add   r15                                 ; $09B0DF |
  iwt   r15,#$B657                          ; $09B0E0 |
  nop                                       ; $09B0E3 |

  db $01, $60, $B6, $01                     ; $09B0E4 |
  db $01, $69, $B6, $01                     ; $09B0E8 |
  db $01, $72, $B6, $01                     ; $09B0EC |
  db $01, $7B, $B6, $01                     ; $09B0F0 |
  db $01, $91, $B6, $01                     ; $09B0F4 |
  db $01, $A1, $B6, $01                     ; $09B0F8 |
  db $01, $B1, $B6, $01                     ; $09B0FC |
  db $01, $C1, $B6, $01                     ; $09B100 |
  db $01, $D1, $B6, $01                     ; $09B104 |
  db $01, $E6, $B6, $01                     ; $09B108 |
  db $01, $0C, $B7, $01                     ; $09B10C |
  db $01, $0C, $B7, $01                     ; $09B110 |
  db $01, $0C, $B7, $01                     ; $09B114 |
  db $01, $0C, $B7, $01                     ; $09B118 |
  db $01, $F6, $B6, $01                     ; $09B11C |
  db $01, $2B, $B7, $01                     ; $09B120 |
  db $01, $54, $B7, $01                     ; $09B124 |
  db $01, $5B, $B7, $01                     ; $09B128 |
  db $01, $61, $B7, $01                     ; $09B12C |
  db $01, $67, $B7, $01                     ; $09B130 |
  db $01, $6D, $B7, $01                     ; $09B134 |
  db $01, $6D, $B7, $01                     ; $09B138 |
  db $01, $6D, $B7, $01                     ; $09B13C |
  db $01, $6D, $B7, $01                     ; $09B140 |
  db $01, $6D, $B7, $01                     ; $09B144 |
  db $01, $6D, $B7, $01                     ; $09B148 |
  db $01, $6D, $B7, $01                     ; $09B14C |
  db $01, $6D, $B7, $01                     ; $09B150 |
  db $01, $6D, $B7, $01                     ; $09B154 |
  db $01, $6D, $B7, $01                     ; $09B158 |
  db $01, $6D, $B7, $01                     ; $09B15C |
  db $01, $C2, $B7, $01                     ; $09B160 |
  db $01, $C2, $B7, $01                     ; $09B164 |
  db $01, $C2, $B7, $01                     ; $09B168 |
  db $01, $C2, $B7, $01                     ; $09B16C |
  db $01, $C2, $B7, $01                     ; $09B170 |
  db $01, $C2, $B7, $01                     ; $09B174 |
  db $01, $C2, $B7, $01                     ; $09B178 |
  db $01, $C2, $B7, $01                     ; $09B17C |
  db $01, $C2, $B7, $01                     ; $09B180 |
  db $01, $C2, $B7, $01                     ; $09B184 |
  db $01, $C2, $B7, $01                     ; $09B188 |
  db $01, $C2, $B7, $01                     ; $09B18C |
  db $01, $C2, $B7, $01                     ; $09B190 |
  db $01, $C2, $B7, $01                     ; $09B194 |
  db $01, $C2, $B7, $01                     ; $09B198 |
  db $01, $C2, $B7, $01                     ; $09B19C |
  db $01, $C2, $B7, $01                     ; $09B1A0 |
  db $01, $D0, $B7, $01                     ; $09B1A4 |
  db $01, $DE, $B7, $01                     ; $09B1A8 |
  db $01, $EC, $B7, $01                     ; $09B1AC |
  db $01, $FA, $B7, $01                     ; $09B1B0 |
  db $01, $04, $B8, $01                     ; $09B1B4 |
  db $01, $0E, $B8, $01                     ; $09B1B8 |
  db $01, $18, $B8, $01                     ; $09B1BC |
  db $01, $22, $B8, $01                     ; $09B1C0 |
  db $01, $2C, $B8, $01                     ; $09B1C4 |
  db $01, $36, $B8, $01                     ; $09B1C8 |
  db $01, $40, $B8, $01                     ; $09B1CC |
  db $01, $4A, $B8, $01                     ; $09B1D0 |
  db $01, $4A, $B8, $01                     ; $09B1D4 |
  db $01, $77, $B8, $01                     ; $09B1D8 |
  db $01, $91, $B8, $01                     ; $09B1DC |
  db $01, $AC, $B8, $01                     ; $09B1E0 |
  db $01, $AC, $B8, $01                     ; $09B1E4 |
  db $01, $AC, $B8, $01                     ; $09B1E8 |
  db $01, $AC, $B8, $01                     ; $09B1EC |
  db $01, $AC, $B8, $01                     ; $09B1F0 |
  db $01, $AC, $B8, $01                     ; $09B1F4 |
  db $01, $AC, $B8, $01                     ; $09B1F8 |
  db $01, $AC, $B8, $01                     ; $09B1FC |
  db $01, $AC, $B8, $01                     ; $09B200 |
  db $01, $AC, $B8, $01                     ; $09B204 |
  db $01, $AC, $B8, $01                     ; $09B208 |
  db $01, $AC, $B8, $01                     ; $09B20C |
  db $01, $AC, $B8, $01                     ; $09B210 |
  db $01, $AC, $B8, $01                     ; $09B214 |
  db $01, $AC, $B8, $01                     ; $09B218 |
  db $01, $AC, $B8, $01                     ; $09B21C |
  db $01, $BC, $B8, $01                     ; $09B220 |
  db $01, $BC, $B8, $01                     ; $09B224 |
  db $01, $CE, $B9, $01                     ; $09B228 |
  db $01, $F0, $B9, $01                     ; $09B22C |
  db $01, $F0, $B9, $01                     ; $09B230 |
  db $01, $F0, $B9, $01                     ; $09B234 |
  db $01, $F0, $B9, $01                     ; $09B238 |
  db $01, $F0, $B9, $01                     ; $09B23C |
  db $01, $F0, $B9, $01                     ; $09B240 |
  db $01, $F0, $B9, $01                     ; $09B244 |
  db $01, $F0, $B9, $01                     ; $09B248 |
  db $01, $F0, $B9, $01                     ; $09B24C |
  db $01, $F0, $B9, $01                     ; $09B250 |
  db $01, $F0, $B9, $01                     ; $09B254 |
  db $01, $F0, $B9, $01                     ; $09B258 |
  db $01, $F0, $B9, $01                     ; $09B25C |
  db $01, $F4, $B9, $01                     ; $09B260 |
  db $01, $84, $BA, $01                     ; $09B264 |
  db $01, $84, $BA, $01                     ; $09B268 |
  db $01, $84, $BA, $01                     ; $09B26C |
  db $01, $84, $BA, $01                     ; $09B270 |
  db $01, $84, $BA, $01                     ; $09B274 |
  db $01, $84, $BA, $01                     ; $09B278 |
  db $01, $84, $BA, $01                     ; $09B27C |
  db $01, $84, $BA, $01                     ; $09B280 |
  db $01, $84, $BA, $01                     ; $09B284 |
  db $01, $84, $BA, $01                     ; $09B288 |
  db $01, $84, $BA, $01                     ; $09B28C |
  db $01, $84, $BA, $01                     ; $09B290 |
  db $01, $84, $BA, $01                     ; $09B294 |
  db $01, $84, $BA, $01                     ; $09B298 |
  db $01, $84, $BA, $01                     ; $09B29C |
  db $01, $84, $BA, $01                     ; $09B2A0 |
  db $01, $84, $BA, $01                     ; $09B2A4 |
  db $01, $84, $BA, $01                     ; $09B2A8 |
  db $01, $84, $BA, $01                     ; $09B2AC |
  db $01, $84, $BA, $01                     ; $09B2B0 |
  db $01, $84, $BA, $01                     ; $09B2B4 |
  db $01, $84, $BA, $01                     ; $09B2B8 |
  db $01, $84, $BA, $01                     ; $09B2BC |
  db $01, $84, $BA, $01                     ; $09B2C0 |
  db $01, $84, $BA, $01                     ; $09B2C4 |
  db $01, $84, $BA, $01                     ; $09B2C8 |
  db $01, $84, $BA, $01                     ; $09B2CC |
  db $01, $84, $BA, $01                     ; $09B2D0 |
  db $01, $84, $BA, $01                     ; $09B2D4 |
  db $01, $84, $BA, $01                     ; $09B2D8 |
  db $01, $84, $BA, $01                     ; $09B2DC |
  db $01, $84, $BA, $01                     ; $09B2E0 |
  db $01, $84, $BA, $01                     ; $09B2E4 |
  db $01, $84, $BA, $01                     ; $09B2E8 |
  db $01, $84, $BA, $01                     ; $09B2EC |
  db $01, $84, $BA, $01                     ; $09B2F0 |
  db $01, $84, $BA, $01                     ; $09B2F4 |
  db $01, $84, $BA, $01                     ; $09B2F8 |
  db $01, $84, $BA, $01                     ; $09B2FC |
  db $01, $84, $BA, $01                     ; $09B300 |
  db $01, $84, $BA, $01                     ; $09B304 |
  db $01, $84, $BA, $01                     ; $09B308 |
  db $01, $84, $BA, $01                     ; $09B30C |
  db $01, $84, $BA, $01                     ; $09B310 |
  db $01, $84, $BA, $01                     ; $09B314 |
  db $01, $84, $BA, $01                     ; $09B318 |
  db $01, $84, $BA, $01                     ; $09B31C |
  db $01, $84, $BA, $01                     ; $09B320 |
  db $01, $84, $BA, $01                     ; $09B324 |
  db $01, $84, $BA, $01                     ; $09B328 |
  db $01, $84, $BA, $01                     ; $09B32C |
  db $01, $84, $BA, $01                     ; $09B330 |
  db $01, $84, $BA, $01                     ; $09B334 |
  db $01, $84, $BA, $01                     ; $09B338 |
  db $01, $84, $BA, $01                     ; $09B33C |
  db $01, $84, $BA, $01                     ; $09B340 |
  db $01, $84, $BA, $01                     ; $09B344 |
  db $01, $84, $BA, $01                     ; $09B348 |
  db $01, $84, $BA, $01                     ; $09B34C |
  db $01, $84, $BA, $01                     ; $09B350 |
  db $01, $84, $BA, $01                     ; $09B354 |
  db $01, $84, $BA, $01                     ; $09B358 |
  db $01, $84, $BA, $01                     ; $09B35C |
  db $01, $84, $BA, $01                     ; $09B360 |
  db $01, $84, $BA, $01                     ; $09B364 |
  db $01, $84, $BA, $01                     ; $09B368 |
  db $01, $84, $BA, $01                     ; $09B36C |
  db $01, $84, $BA, $01                     ; $09B370 |
  db $01, $84, $BA, $01                     ; $09B374 |
  db $01, $84, $BA, $01                     ; $09B378 |
  db $01, $84, $BA, $01                     ; $09B37C |
  db $01, $84, $BA, $01                     ; $09B380 |
  db $01, $84, $BA, $01                     ; $09B384 |
  db $01, $84, $BA, $01                     ; $09B388 |
  db $01, $84, $BA, $01                     ; $09B38C |
  db $01, $84, $BA, $01                     ; $09B390 |
  db $01, $84, $BA, $01                     ; $09B394 |
  db $01, $84, $BA, $01                     ; $09B398 |
  db $01, $84, $BA, $01                     ; $09B39C |
  db $01, $84, $BA, $01                     ; $09B3A0 |
  db $01, $84, $BA, $01                     ; $09B3A4 |
  db $01, $84, $BA, $01                     ; $09B3A8 |
  db $01, $84, $BA, $01                     ; $09B3AC |
  db $01, $84, $BA, $01                     ; $09B3B0 |
  db $01, $84, $BA, $01                     ; $09B3B4 |
  db $01, $84, $BA, $01                     ; $09B3B8 |
  db $01, $84, $BA, $01                     ; $09B3BC |
  db $01, $84, $BA, $01                     ; $09B3C0 |
  db $01, $84, $BA, $01                     ; $09B3C4 |
  db $01, $84, $BA, $01                     ; $09B3C8 |
  db $01, $84, $BA, $01                     ; $09B3CC |
  db $01, $84, $BA, $01                     ; $09B3D0 |
  db $01, $84, $BA, $01                     ; $09B3D4 |
  db $01, $84, $BA, $01                     ; $09B3D8 |
  db $01, $84, $BA, $01                     ; $09B3DC |
  db $01, $84, $BA, $01                     ; $09B3E0 |
  db $01, $84, $BA, $01                     ; $09B3E4 |
  db $01, $84, $BA, $01                     ; $09B3E8 |
  db $01, $84, $BA, $01                     ; $09B3EC |
  db $01, $84, $BA, $01                     ; $09B3F0 |
  db $01, $84, $BA, $01                     ; $09B3F4 |
  db $01, $84, $BA, $01                     ; $09B3F8 |
  db $01, $84, $BA, $01                     ; $09B3FC |
  db $01, $84, $BA, $01                     ; $09B400 |
  db $01, $84, $BA, $01                     ; $09B404 |
  db $01, $84, $BA, $01                     ; $09B408 |
  db $01, $84, $BA, $01                     ; $09B40C |
  db $01, $84, $BA, $01                     ; $09B410 |
  db $01, $84, $BA, $01                     ; $09B414 |
  db $01, $84, $BA, $01                     ; $09B418 |
  db $01, $84, $BA, $01                     ; $09B41C |
  db $01, $84, $BA, $01                     ; $09B420 |
  db $01, $84, $BA, $01                     ; $09B424 |
  db $01, $84, $BA, $01                     ; $09B428 |
  db $01, $84, $BA, $01                     ; $09B42C |
  db $01, $84, $BA, $01                     ; $09B430 |
  db $01, $84, $BA, $01                     ; $09B434 |
  db $01, $84, $BA, $01                     ; $09B438 |
  db $01, $84, $BA, $01                     ; $09B43C |
  db $01, $84, $BA, $01                     ; $09B440 |
  db $01, $84, $BA, $01                     ; $09B444 |
  db $01, $84, $BA, $01                     ; $09B448 |
  db $01, $84, $BA, $01                     ; $09B44C |
  db $01, $84, $BA, $01                     ; $09B450 |
  db $01, $84, $BA, $01                     ; $09B454 |
  db $01, $84, $BA, $01                     ; $09B458 |
  db $01, $84, $BA, $01                     ; $09B45C |
  db $01, $84, $BA, $01                     ; $09B460 |
  db $01, $84, $BA, $01                     ; $09B464 |
  db $01, $84, $BA, $01                     ; $09B468 |
  db $01, $84, $BA, $01                     ; $09B46C |
  db $01, $84, $BA, $01                     ; $09B470 |
  db $01, $84, $BA, $01                     ; $09B474 |
  db $01, $84, $BA, $01                     ; $09B478 |
  db $01, $84, $BA, $01                     ; $09B47C |
  db $01, $84, $BA, $01                     ; $09B480 |
  db $01, $84, $BA, $01                     ; $09B484 |
  db $01, $84, $BA, $01                     ; $09B488 |
  db $01, $84, $BA, $01                     ; $09B48C |
  db $01, $84, $BA, $01                     ; $09B490 |
  db $01, $84, $BA, $01                     ; $09B494 |
  db $01, $84, $BA, $01                     ; $09B498 |
  db $01, $84, $BA, $01                     ; $09B49C |
  db $01, $84, $BA, $01                     ; $09B4A0 |
  db $01, $84, $BA, $01                     ; $09B4A4 |
  db $01, $84, $BA, $01                     ; $09B4A8 |
  db $01, $84, $BA, $01                     ; $09B4AC |
  db $01, $84, $BA, $01                     ; $09B4B0 |
  db $01, $84, $BA, $01                     ; $09B4B4 |
  db $01, $84, $BA, $01                     ; $09B4B8 |
  db $01, $84, $BA, $01                     ; $09B4BC |
  db $01, $84, $BA, $01                     ; $09B4C0 |
  db $01, $84, $BA, $01                     ; $09B4C4 |
  db $01, $84, $BA, $01                     ; $09B4C8 |
  db $01, $84, $BA, $01                     ; $09B4CC |
  db $01, $84, $BA, $01                     ; $09B4D0 |
  db $01, $84, $BA, $01                     ; $09B4D4 |
  db $01, $84, $BA, $01                     ; $09B4D8 |
  db $01, $84, $BA, $01                     ; $09B4DC |
  db $01, $00, $01                          ; $09B4E0 |

  lm    r0,($4082)                          ; $09B4E3 |
  add   r0                                  ; $09B4E7 |
  add   r0                                  ; $09B4E8 |
  lm    r1,($4080)                          ; $09B4E9 |
  or    r1                                  ; $09B4ED |
  add   r0                                  ; $09B4EE |
  add   r0                                  ; $09B4EF |
  inc   r0                                  ; $09B4F0 |
  to r15                                    ; $09B4F1 |
  add   r15                                 ; $09B4F2 |
  iwt   r15,#$B534                          ; $09B4F3 |
  nop                                       ; $09B4F6 |

  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B4F7 |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B4FF |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B507 |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B50F |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B517 |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B51F |
  db $01, $C4, $B5, $01, $01, $C4, $B5, $01 ; $09B527 |
  db $01, $C4, $B5, $01, $01                ; $09B52F |

  cache                                     ; $09B534 |
  lm    r0,($4072)                          ; $09B535 |
  lob                                       ; $09B539 |
  umult #12                                 ; $09B53A |
  iwt   r1,#$BD2F                           ; $09B53C |
  to r14                                    ; $09B53F |
  add   r1                                  ; $09B540 |
  lm    r0,($4086)                          ; $09B541 |
  to r2                                     ; $09B545 |
  add   #3                                  ; $09B546 |
  lm    r3,($4084)                          ; $09B548 |
  ibt   r12,#$000C                          ; $09B54C |
  move  r13,r15                             ; $09B54E |
  move  r1,r3                               ; $09B550 |
  getb                                      ; $09B552 |
  inc   r14                                 ; $09B553 |
  swap                                      ; $09B554 |
  add   r0                                  ; $09B555 |
  bcc CODE_09B55B                           ; $09B556 |
  inc   r1                                  ; $09B558 |
  dec   r1                                  ; $09B559 |
  plot                                      ; $09B55A |

CODE_09B55B:
  add   r0                                  ; $09B55B |
  bcc CODE_09B561                           ; $09B55C |
  inc   r1                                  ; $09B55E |
  dec   r1                                  ; $09B55F |
  plot                                      ; $09B560 |

CODE_09B561:
  add   r0                                  ; $09B561 |
  bcc CODE_09B567                           ; $09B562 |
  inc   r1                                  ; $09B564 |
  dec   r1                                  ; $09B565 |
  plot                                      ; $09B566 |

CODE_09B567:
  add   r0                                  ; $09B567 |
  bcc CODE_09B56D                           ; $09B568 |
  inc   r1                                  ; $09B56A |
  dec   r1                                  ; $09B56B |
  plot                                      ; $09B56C |

CODE_09B56D:
  add   r0                                  ; $09B56D |
  bcc CODE_09B573                           ; $09B56E |
  inc   r1                                  ; $09B570 |
  dec   r1                                  ; $09B571 |
  plot                                      ; $09B572 |

CODE_09B573:
  add   r0                                  ; $09B573 |
  bcc CODE_09B579                           ; $09B574 |
  inc   r1                                  ; $09B576 |
  dec   r1                                  ; $09B577 |
  plot                                      ; $09B578 |

CODE_09B579:
  add   r0                                  ; $09B579 |
  bcc CODE_09B57F                           ; $09B57A |
  inc   r1                                  ; $09B57C |
  dec   r1                                  ; $09B57D |
  plot                                      ; $09B57E |

CODE_09B57F:
  add   r0                                  ; $09B57F |
  bcc CODE_09B585                           ; $09B580 |
  inc   r1                                  ; $09B582 |
  dec   r1                                  ; $09B583 |
  plot                                      ; $09B584 |

CODE_09B585:
  loop                                      ; $09B585 |
  inc   r2                                  ; $09B586 |
  rpix                                      ; $09B587 |
  lm    r0,($407C)                          ; $09B589 |
  inc   r0                                  ; $09B58D |
  sbk                                       ; $09B58E |
  lm    r0,($4072)                          ; $09B58F |
  lob                                       ; $09B593 |
  iwt   r1,#$BC2F                           ; $09B594 |
  to r14                                    ; $09B597 |
  add   r1                                  ; $09B598 |
  getb                                      ; $09B599 |
  to r1                                     ; $09B59A |
  add   r3                                  ; $09B59B |
  iwt   r0,#$0082                           ; $09B59C |
  from r1                                   ; $09B59F |
  sub   r0                                  ; $09B5A0 |
  bcc CODE_09B5BC                           ; $09B5A1 |
  nop                                       ; $09B5A3 |
  ibt   r1,#$0000                           ; $09B5A4 |
  lm    r0,($4086)                          ; $09B5A6 |
  inc   r0                                  ; $09B5AA |
  to r2                                     ; $09B5AB |
  add   #15                                 ; $09B5AC |
  iwt   r0,#$0040                           ; $09B5AE |
  from r2                                   ; $09B5B1 |
  sub   r0                                  ; $09B5B2 |
  bcc CODE_09B5B8                           ; $09B5B3 |
  nop                                       ; $09B5B5 |
  ibt   r2,#$0010                           ; $09B5B6 |

CODE_09B5B8:
  sm    ($4086),r2                          ; $09B5B8 |

CODE_09B5BC:
  sm    ($4084),r1                          ; $09B5BC |
  iwt   r15,#$B09F                          ; $09B5C0 |
  nop                                       ; $09B5C3 |
  cache                                     ; $09B5C4 |
  lm    r5,($4080)                          ; $09B5C5 |
  inc   r5                                  ; $09B5C9 |
  lm    r6,($4082)                          ; $09B5CA |
  inc   r6                                  ; $09B5CE |
  lm    r4,($4086)                          ; $09B5CF |
  from r6                                   ; $09B5D3 |
  umult #3                                  ; $09B5D4 |
  to r4                                     ; $09B5D6 |
  add   r4                                  ; $09B5D7 |
  lm    r9,($4084)                          ; $09B5D8 |
  lm    r0,($4072)                          ; $09B5DC |
  lob                                       ; $09B5E0 |
  umult #12                                 ; $09B5E1 |
  iwt   r1,#$BD2F                           ; $09B5E3 |
  to r14                                    ; $09B5E6 |
  add   r1                                  ; $09B5E7 |
  iwt   r13,#$B5F5                          ; $09B5E8 |
  ibt   r11,#$000C                          ; $09B5EB |

CODE_09B5ED:
  getb                                      ; $09B5ED |
  inc   r14                                 ; $09B5EE |
  to r10                                    ; $09B5EF |
  swap                                      ; $09B5F0 |
  ibt   r12,#$0008                          ; $09B5F1 |
  ibt   r3,#$0000                           ; $09B5F3 |
  with r10                                  ; $09B5F5 |
  add   r10                                 ; $09B5F6 |
  bcc CODE_09B60D                           ; $09B5F7 |
  nop                                       ; $09B5F9 |
  from r9                                   ; $09B5FA |
  to r7                                     ; $09B5FB |
  add   r3                                  ; $09B5FC |
  move  r2,r4                               ; $09B5FD |
  move  r8,r6                               ; $09B5FF |

CODE_09B601:
  move  r1,r7                               ; $09B601 |
  move  r0,r5                               ; $09B603 |

CODE_09B605:
  dec   r0                                  ; $09B605 |
  bne CODE_09B605                           ; $09B606 |
  plot                                      ; $09B608 |
  dec   r8                                  ; $09B609 |
  bne CODE_09B601                           ; $09B60A |
  inc   r2                                  ; $09B60C |

CODE_09B60D:
  with r3                                   ; $09B60D |
  add   r5                                  ; $09B60E |
  loop                                      ; $09B60F |
  nop                                       ; $09B610 |
  with r4                                   ; $09B611 |
  add   r6                                  ; $09B612 |
  dec   r11                                 ; $09B613 |
  bne CODE_09B5ED                           ; $09B614 |
  nop                                       ; $09B616 |
  rpix                                      ; $09B617 |
  lm    r0,($407C)                          ; $09B619 |
  inc   r0                                  ; $09B61D |
  sbk                                       ; $09B61E |
  lm    r0,($4072)                          ; $09B61F |
  lob                                       ; $09B623 |
  iwt   r1,#$BC2F                           ; $09B624 |
  to r14                                    ; $09B627 |
  add   r1                                  ; $09B628 |
  getb                                      ; $09B629 |
  umult r5                                  ; $09B62A |
  to r1                                     ; $09B62C |
  add   r9                                  ; $09B62D |
  iwt   r0,#$0082                           ; $09B62E |
  from r1                                   ; $09B631 |
  sub   r0                                  ; $09B632 |
  bcc CODE_09B64F                           ; $09B633 |
  nop                                       ; $09B635 |
  ibt   r1,#$0000                           ; $09B636 |
  lm    r0,($4086)                          ; $09B638 |
  ibt   r2,#$0010                           ; $09B63C |
  with r2                                   ; $09B63E |
  umult r6                                  ; $09B63F |
  iwt   r0,#$0040                           ; $09B641 |
  from r2                                   ; $09B644 |
  sub   r0                                  ; $09B645 |
  bcc CODE_09B64B                           ; $09B646 |
  nop                                       ; $09B648 |
  ibt   r2,#$0010                           ; $09B649 |

CODE_09B64B:
  sm    ($4086),r2                          ; $09B64B |

CODE_09B64F:
  sm    ($4084),r1                          ; $09B64F |
  iwt   r15,#$B09F                          ; $09B653 |
  nop                                       ; $09B656 |
  iwt   r1,#$4E00                           ; $09B657 |
  iwt   r12,#$0500                          ; $09B65A |
  bra CODE_09B684                           ; $09B65D |
  nop                                       ; $09B65F |

  iwt   r1,#$4E00                           ; $09B660 |
  iwt   r12,#$0100                          ; $09B663 |
  bra CODE_09B684                           ; $09B666 |
  nop                                       ; $09B668 |

  iwt   r1,#$5000                           ; $09B669 |
  iwt   r12,#$0100                          ; $09B66C |
  bra CODE_09B684                           ; $09B66F |
  nop                                       ; $09B671 |

  iwt   r1,#$5200                           ; $09B672 |
  iwt   r12,#$0100                          ; $09B675 |
  bra CODE_09B684                           ; $09B678 |
  nop                                       ; $09B67A |

  iwt   r1,#$5400                           ; $09B67B |
  iwt   r12,#$0100                          ; $09B67E |
  bra CODE_09B684                           ; $09B681 |
  nop                                       ; $09B683 |

CODE_09B684:
  iwt   r0,#$00FF                           ; $09B684 |
  move  r13,r15                             ; $09B687 |
  stw   (r1)                                ; $09B689 |
  inc   r1                                  ; $09B68A |
  loop                                      ; $09B68B |
  inc   r1                                  ; $09B68C |
  iwt   r15,#$BA8E                          ; $09B68D |
  nop                                       ; $09B690 |
  ibt   r0,#$0000                           ; $09B691 |
  sm    ($4084),r0                          ; $09B693 |
  ibt   r0,#$0010                           ; $09B697 |
  sm    ($4086),r0                          ; $09B699 |
  iwt   r15,#$BA8E                          ; $09B69D |
  nop                                       ; $09B6A0 |
  ibt   r0,#$0000                           ; $09B6A1 |
  sm    ($4084),r0                          ; $09B6A3 |
  ibt   r0,#$0020                           ; $09B6A7 |
  sm    ($4086),r0                          ; $09B6A9 |
  iwt   r15,#$BA8E                          ; $09B6AD |
  nop                                       ; $09B6B0 |
  ibt   r0,#$0000                           ; $09B6B1 |
  sm    ($4084),r0                          ; $09B6B3 |
  ibt   r0,#$0030                           ; $09B6B7 |
  sm    ($4086),r0                          ; $09B6B9 |
  iwt   r15,#$BA8E                          ; $09B6BD |
  nop                                       ; $09B6C0 |
  ibt   r0,#$0000                           ; $09B6C1 |
  sm    ($4084),r0                          ; $09B6C3 |
  ibt   r0,#$0040                           ; $09B6C7 |
  sm    ($4086),r0                          ; $09B6C9 |
  iwt   r15,#$BA8E                          ; $09B6CD |
  nop                                       ; $09B6D0 |
  lm    r0,($4086)                          ; $09B6D1 |
  ibt   r1,#$0040                           ; $09B6D5 |
  inc   r0                                  ; $09B6D7 |
  add   #15                                 ; $09B6D8 |
  cmp   r1                                  ; $09B6DA |
  bcc CODE_09B6E1                           ; $09B6DC |
  nop                                       ; $09B6DE |
  ibt   r0,#$0010                           ; $09B6DF |

CODE_09B6E1:
  sbk                                       ; $09B6E1 |
  iwt   r15,#$BA8E                          ; $09B6E2 |
  nop                                       ; $09B6E5 |
  iwt   r0,#$04C0                           ; $09B6E6 |
  lm    r1,($4076)                          ; $09B6E9 |
  and   r1                                  ; $09B6ED |
  beq CODE_09B6F6                           ; $09B6EE |
  nop                                       ; $09B6F0 |
  ibt   r0,#$005C                           ; $09B6F1 |
  sms   ($007A),r0                          ; $09B6F3 |

CODE_09B6F6:
  iwt   r0,#$04C0                           ; $09B6F6 |
  lm    r1,($4076)                          ; $09B6F9 |
  and   r1                                  ; $09B6FD |
  beq CODE_09B708                           ; $09B6FE |
  nop                                       ; $09B700 |
  lm    r0,($407C)                          ; $09B701 |
  inc   r0                                  ; $09B705 |
  inc   r0                                  ; $09B706 |
  sbk                                       ; $09B707 |

CODE_09B708:
  iwt   r15,#$B4E1                          ; $09B708 |
  nop                                       ; $09B70B |
  iwt   r1,#$5600                           ; $09B70C |
  iwt   r12,#$0100                          ; $09B70F |
  iwt   r0,#$00FF                           ; $09B712 |
  move  r13,r15                             ; $09B715 |
  stw   (r1)                                ; $09B717 |
  inc   r1                                  ; $09B718 |
  loop                                      ; $09B719 |
  inc   r1                                  ; $09B71A |
  ibt   r0,#$0000                           ; $09B71B |
  sm    ($4084),r0                          ; $09B71D |
  ibt   r0,#$0050                           ; $09B721 |
  sm    ($4086),r0                          ; $09B723 |
  iwt   r15,#$BA8E                          ; $09B727 |
  nop                                       ; $09B72A |
  iwt   r12,#$0100                          ; $09B72B |
  iwt   r1,#$4E00                           ; $09B72E |
  iwt   r2,#$5000                           ; $09B731 |
  iwt   r3,#$5200                           ; $09B734 |
  iwt   r4,#$5400                           ; $09B737 |
  iwt   r5,#$00FF                           ; $09B73A |
  move  r13,r15                             ; $09B73D |
  ldw   (r2)                                ; $09B73F |
  stw   (r1)                                ; $09B740 |
  inc   r1                                  ; $09B741 |
  inc   r1                                  ; $09B742 |
  ldw   (r3)                                ; $09B743 |
  stw   (r2)                                ; $09B744 |
  inc   r2                                  ; $09B745 |
  inc   r2                                  ; $09B746 |
  ldw   (r4)                                ; $09B747 |
  stw   (r3)                                ; $09B748 |
  inc   r3                                  ; $09B749 |
  inc   r3                                  ; $09B74A |
  from r5                                   ; $09B74B |
  stw   (r4)                                ; $09B74C |
  inc   r4                                  ; $09B74D |
  loop                                      ; $09B74E |
  inc   r4                                  ; $09B74F |
  iwt   r15,#$BA8E                          ; $09B750 |
  nop                                       ; $09B753 |
  iwt   r0,#$0001                           ; $09B754 |
  iwt   r15,#$B76D                          ; $09B757 |
  nop                                       ; $09B75A |
  ibt   r0,#$0002                           ; $09B75B |
  iwt   r15,#$B76D                          ; $09B75D |
  nop                                       ; $09B760 |
  ibt   r0,#$0003                           ; $09B761 |
  iwt   r15,#$B76D                          ; $09B763 |
  nop                                       ; $09B766 |
  ibt   r0,#$0004                           ; $09B767 |
  iwt   r15,#$B76D                          ; $09B769 |
  nop                                       ; $09B76C |
  adc   r0                                  ; $09B76D |
  iwt   r1,#$4E00                           ; $09B76F |
  move  r2,r1                               ; $09B772 |
  to r2                                     ; $09B774 |
  adc   r2                                  ; $09B775 |
  ibt   r5,#$0010                           ; $09B777 |
  iwt   r6,#$5800                           ; $09B779 |
  iwt   r13,#$B785                          ; $09B77C |

CODE_09B77F:
  move  r12,r5                              ; $09B77F |
  move  r4,r2                               ; $09B781 |
  move  r3,r1                               ; $09B783 |
  ldw   (r4)                                ; $09B785 |
  stw   (r3)                                ; $09B786 |
  with r4                                   ; $09B787 |
  adc   r5                                  ; $09B788 |
  with r3                                   ; $09B78A |
  adc   r5                                  ; $09B78B |
  loop                                      ; $09B78D |
  nop                                       ; $09B78E |
  inc   r2                                  ; $09B78F |
  inc   r2                                  ; $09B790 |
  from r5                                   ; $09B791 |
  and   r2                                  ; $09B792 |
  beq CODE_09B7A0                           ; $09B793 |
  nop                                       ; $09B795 |
  iwt   r0,#$FF00                           ; $09B796 |
  and   r2                                  ; $09B799 |
  iwt   r2,#$0100                           ; $09B79A |
  to r2                                     ; $09B79D |
  adc   r2                                  ; $09B79E |

CODE_09B7A0:
  inc   r1                                  ; $09B7A0 |
  inc   r1                                  ; $09B7A1 |
  from r5                                   ; $09B7A2 |
  and   r1                                  ; $09B7A3 |
  beq CODE_09B7B1                           ; $09B7A4 |
  nop                                       ; $09B7A6 |
  iwt   r0,#$FF00                           ; $09B7A7 |
  and   r1                                  ; $09B7AA |
  iwt   r1,#$0100                           ; $09B7AB |
  to r1                                     ; $09B7AE |
  adc   r1                                  ; $09B7AF |

CODE_09B7B1:
  from r1                                   ; $09B7B1 |
  cmp   r6                                  ; $09B7B2 |
  bcc CODE_09B77F                           ; $09B7B4 |
  nop                                       ; $09B7B6 |
  lm    r0,($407C)                          ; $09B7B7 |
  inc   r0                                  ; $09B7BB |
  inc   r0                                  ; $09B7BC |
  sbk                                       ; $09B7BD |
  iwt   r15,#$B4E1                          ; $09B7BE |
  nop                                       ; $09B7C1 |
  ibt   r0,#$0000                           ; $09B7C2 |
  sm    ($4080),r0                          ; $09B7C4 |
  sm    ($4082),r0                          ; $09B7C8 |
  iwt   r15,#$BA8E                          ; $09B7CC |
  nop                                       ; $09B7CF |
  ibt   r0,#$0001                           ; $09B7D0 |
  sm    ($4080),r0                          ; $09B7D2 |
  sm    ($4082),r0                          ; $09B7D6 |
  iwt   r15,#$BA8E                          ; $09B7DA |
  nop                                       ; $09B7DD |
  ibt   r0,#$0002                           ; $09B7DE |
  sm    ($4080),r0                          ; $09B7E0 |
  sm    ($4082),r0                          ; $09B7E4 |
  iwt   r15,#$BA8E                          ; $09B7E8 |
  nop                                       ; $09B7EB |
  ibt   r0,#$0003                           ; $09B7EC |
  sm    ($4080),r0                          ; $09B7EE |
  sm    ($4082),r0                          ; $09B7F2 |
  iwt   r15,#$BA8E                          ; $09B7F6 |
  nop                                       ; $09B7F9 |
  ibt   r0,#$0000                           ; $09B7FA |
  sm    ($4082),r0                          ; $09B7FC |
  iwt   r15,#$BA8E                          ; $09B800 |
  nop                                       ; $09B803 |
  ibt   r0,#$0001                           ; $09B804 |
  sm    ($4082),r0                          ; $09B806 |
  iwt   r15,#$BA8E                          ; $09B80A |
  nop                                       ; $09B80D |
  ibt   r0,#$0002                           ; $09B80E |
  sm    ($4082),r0                          ; $09B810 |
  iwt   r15,#$BA8E                          ; $09B814 |
  nop                                       ; $09B817 |
  ibt   r0,#$0003                           ; $09B818 |
  sm    ($4082),r0                          ; $09B81A |
  iwt   r15,#$BA8E                          ; $09B81E |
  nop                                       ; $09B821 |
  ibt   r0,#$0000                           ; $09B822 |
  sm    ($4080),r0                          ; $09B824 |
  iwt   r15,#$BA8E                          ; $09B828 |
  nop                                       ; $09B82B |
  ibt   r0,#$0001                           ; $09B82C |
  sm    ($4080),r0                          ; $09B82E |
  iwt   r15,#$BA8E                          ; $09B832 |
  nop                                       ; $09B835 |
  ibt   r0,#$0002                           ; $09B836 |
  sm    ($4080),r0                          ; $09B838 |
  iwt   r15,#$BA8E                          ; $09B83C |
  nop                                       ; $09B83F |
  ibt   r0,#$0003                           ; $09B840 |
  sm    ($4080),r0                          ; $09B842 |
  iwt   r15,#$BA8E                          ; $09B846 |
  nop                                       ; $09B849 |
  iwt   r6,#$00A0                           ; $09B84A |
  iwt   r5,#$00D0                           ; $09B84D |
  ibt   r1,#$0064                           ; $09B850 |
  ibt   r2,#$000A                           ; $09B852 |
  ibt   r3,#$0000                           ; $09B854 |
  ibt   r4,#$0000                           ; $09B856 |
  lm    r0,($409A)                          ; $09B858 |

CODE_09B85C:
  sub   r1                                  ; $09B85C |
  bpl CODE_09B85C                           ; $09B85D |
  inc   r3                                  ; $09B85F |
  add   r1                                  ; $09B860 |
  dec   r3                                  ; $09B861 |
  beq CODE_09B868                           ; $09B862 |
  nop                                       ; $09B864 |
  from r6                                   ; $09B865 |
  to r5                                     ; $09B866 |
  add   r3                                  ; $09B867 |

CODE_09B868:
  sub   r2                                  ; $09B868 |
  bpl CODE_09B868                           ; $09B869 |
  inc   r4                                  ; $09B86B |
  dec   r4                                  ; $09B86C |
  add   r2                                  ; $09B86D |
  swap                                      ; $09B86E |
  or    r4                                  ; $09B86F |
  sm    ($409C),r0                          ; $09B870 |
  bra CODE_09B89B                           ; $09B874 |
  nop                                       ; $09B876 |

  lm    r0,($409C)                          ; $09B877 |
  iwt   r4,#$00A0                           ; $09B87B |
  iwt   r5,#$00D0                           ; $09B87E |
  lm    r1,($409A)                          ; $09B881 |
  ibt   r2,#$000A                           ; $09B885 |
  from r1                                   ; $09B887 |
  cmp   r2                                  ; $09B888 |
  bcc CODE_09B89B                           ; $09B88A |
  to r5                                     ; $09B88C |
  add   r4                                  ; $09B88D |
  bra CODE_09B89B                           ; $09B88E |
  nop                                       ; $09B890 |

  lm    r0,($409C)                          ; $09B891 |
  hib                                       ; $09B895 |
  iwt   r4,#$00A0                           ; $09B896 |
  to r5                                     ; $09B899 |
  add   r4                                  ; $09B89A |

CODE_09B89B:
  sm    ($4072),r5                          ; $09B89B |
  lm    r0,($407C)                          ; $09B89F |
  inc   r0                                  ; $09B8A3 |
  sm    ($407C),r0                          ; $09B8A4 |
  iwt   r15,#$B4E3                          ; $09B8A8 |
  nop                                       ; $09B8AB |
  iwt   r15,#$B4E1                          ; $09B8AC |
  nop                                       ; $09B8AF |

  dw $4007, $2002                           ; $09B8B0 |

  dw $4034, $3002                           ; $09B8B4 |

  dw $0802, $0401                           ; $09B8B8 |

  lm    r1,($4076)                          ; $09B8BC |
  with r1                                   ; $09B8C0 |
  swap                                      ; $09B8C1 |
  iwt   r0,#$C0C0                           ; $09B8C2 |
  and   r1                                  ; $09B8C5 |
  beq CODE_09B8EA                           ; $09B8C6 |
  nop                                       ; $09B8C8 |
  ibt   r1,#$0043                           ; $09B8C9 |
  lm    r0,($4094)                          ; $09B8CB |
  and   #1                                  ; $09B8CF |
  beq CODE_09B8DC                           ; $09B8D1 |
  nop                                       ; $09B8D3 |
  ibt   r1,#$002E                           ; $09B8D4 |
  ibt   r0,#$0002                           ; $09B8D6 |
  sm    ($406E),r0                          ; $09B8D8 |

CODE_09B8DC:
  sms   ($007A),r1                          ; $09B8DC |
  lm    r0,($407C)                          ; $09B8DF |
  inc   r0                                  ; $09B8E3 |
  inc   r0                                  ; $09B8E4 |
  sbk                                       ; $09B8E5 |
  iwt   r15,#$B4E1                          ; $09B8E6 |
  nop                                       ; $09B8E9 |

CODE_09B8EA:
  lm    r0,($4072)                          ; $09B8EA |
  swap                                      ; $09B8EE |
  and   #1                                  ; $09B8EF |
  iwt   r14,#$B8B8                          ; $09B8F1 |
  to r14                                    ; $09B8F4 |
  add   r14                                 ; $09B8F5 |
  getb                                      ; $09B8F6 |
  and   r1                                  ; $09B8F7 |
  beq CODE_09B95A                           ; $09B8F8 |
  nop                                       ; $09B8FA |
  ibt   r0,#$005C                           ; $09B8FB |
  sms   ($007A),r0                          ; $09B8FD |
  ibt   r0,#$0000                           ; $09B900 |
  sm    ($4094),r0                          ; $09B902 |
  iwt   r0,#$00D4                           ; $09B906 |
  sm    ($4090),r0                          ; $09B909 |
  lm    r0,($4072)                          ; $09B90D |
  swap                                      ; $09B911 |
  and   #1                                  ; $09B912 |
  add   r0                                  ; $09B914 |
  iwt   r14,#$B8B0                          ; $09B915 |
  to r14                                    ; $09B918 |
  add   r14                                 ; $09B919 |
  getb                                      ; $09B91A |
  sm    ($408C),r0                          ; $09B91B |
  inc   r14                                 ; $09B91F |
  getb                                      ; $09B920 |
  sm    ($408E),r0                          ; $09B921 |
  iwt   r0,#$B930                           ; $09B925 |
  sm    ($4092),r0                          ; $09B928 |
  iwt   r15,#$BA9B                          ; $09B92C |
  nop                                       ; $09B92F |

  iwt   r0,#$00D0                           ; $09B930 |
  sm    ($4090),r0                          ; $09B933 |
  lm    r0,($4072)                          ; $09B937 |
  swap                                      ; $09B93B |
  and   #1                                  ; $09B93C |
  add   r0                                  ; $09B93E |
  iwt   r14,#$B8B4                          ; $09B93F |
  to r14                                    ; $09B942 |
  add   r14                                 ; $09B943 |
  getb                                      ; $09B944 |
  sm    ($408C),r0                          ; $09B945 |
  inc   r14                                 ; $09B949 |
  getb                                      ; $09B94A |
  sm    ($408E),r0                          ; $09B94B |
  iwt   r0,#$B4E1                           ; $09B94F |
  sm    ($4092),r0                          ; $09B952 |
  iwt   r15,#$BA9B                          ; $09B956 |
  nop                                       ; $09B959 |

CODE_09B95A:
  lm    r0,($4072)                          ; $09B95A |
  swap                                      ; $09B95E |
  and   #1                                  ; $09B95F |
  iwt   r14,#$B8BA                          ; $09B961 |
  to r14                                    ; $09B964 |
  add   r14                                 ; $09B965 |
  getb                                      ; $09B966 |
  and   r1                                  ; $09B967 |
  beq CODE_09B9CA                           ; $09B968 |
  nop                                       ; $09B96A |
  ibt   r0,#$005C                           ; $09B96B |
  sms   ($007A),r0                          ; $09B96D |
  ibt   r0,#$0001                           ; $09B970 |
  sm    ($4094),r0                          ; $09B972 |
  iwt   r0,#$00D4                           ; $09B976 |
  sm    ($4090),r0                          ; $09B979 |
  lm    r0,($4072)                          ; $09B97D |
  swap                                      ; $09B981 |
  and   #1                                  ; $09B982 |
  add   r0                                  ; $09B984 |
  iwt   r14,#$B8B4                          ; $09B985 |
  to r14                                    ; $09B988 |
  add   r14                                 ; $09B989 |
  getb                                      ; $09B98A |
  sm    ($408C),r0                          ; $09B98B |
  inc   r14                                 ; $09B98F |
  getb                                      ; $09B990 |
  sm    ($408E),r0                          ; $09B991 |
  iwt   r0,#$B9A0                           ; $09B995 |
  sm    ($4092),r0                          ; $09B998 |
  iwt   r15,#$BA9B                          ; $09B99C |
  nop                                       ; $09B99F |
  iwt   r0,#$00D0                           ; $09B9A0 |
  sm    ($4090),r0                          ; $09B9A3 |
  lm    r0,($4072)                          ; $09B9A7 |
  swap                                      ; $09B9AB |
  and   #1                                  ; $09B9AC |
  add   r0                                  ; $09B9AE |
  iwt   r14,#$B8B0                          ; $09B9AF |
  to r14                                    ; $09B9B2 |
  add   r14                                 ; $09B9B3 |
  getb                                      ; $09B9B4 |
  sm    ($408C),r0                          ; $09B9B5 |
  inc   r14                                 ; $09B9B9 |
  getb                                      ; $09B9BA |
  sm    ($408E),r0                          ; $09B9BB |
  iwt   r0,#$B4E1                           ; $09B9BF |
  sm    ($4092),r0                          ; $09B9C2 |
  iwt   r15,#$BA9B                          ; $09B9C6 |
  nop                                       ; $09B9C9 |

CODE_09B9CA:
  iwt   r15,#$B4E1                          ; $09B9CA |
  nop                                       ; $09B9CD |
  lm    r0,($4076)                          ; $09B9CE |
  iwt   r1,#$C0C0                           ; $09B9D2 |
  and   r1                                  ; $09B9D5 |
  beq CODE_09B9EC                           ; $09B9D6 |
  nop                                       ; $09B9D8 |
  lm    r0,($4094)                          ; $09B9D9 |
  and   #1                                  ; $09B9DD |
  beq CODE_09B9EC                           ; $09B9DF |
  nop                                       ; $09B9E1 |
  lm    r0,($0082)                          ; $09B9E2 |
  xor   #2                                  ; $09B9E6 |
  sm    ($0082),r0                          ; $09B9E8 |

CODE_09B9EC:
  iwt   r15,#$B8BC                          ; $09B9EC |
  nop                                       ; $09B9EF |
  iwt   r15,#$B4E1                          ; $09B9F0 |
  nop                                       ; $09B9F3 |
  cache                                     ; $09B9F4 |
  lm    r0,($4098)                          ; $09B9F5 |
  romb                                      ; $09B9F9 |
  lm    r0,($407C)                          ; $09B9FB |
  to r14                                    ; $09B9FF |
  add   #2                                  ; $09BA00 |
  getb                                      ; $09BA02 |
  inc   r14                                 ; $09BA03 |
  lsr                                       ; $09BA04 |
  lsr                                       ; $09BA05 |
  lsr                                       ; $09BA06 |
  move  r11,r0                              ; $09BA07 |
  move  r10,r0                              ; $09BA09 |
  getb                                      ; $09BA0B |
  inc   r14                                 ; $09BA0C |
  getbh                                     ; $09BA0D |
  inc   r14                                 ; $09BA0F |
  add   r0                                  ; $09BA10 |
  add   r0                                  ; $09BA11 |
  add   r0                                  ; $09BA12 |
  to r9                                     ; $09BA13 |
  add   r0                                  ; $09BA14 |
  getb                                      ; $09BA15 |
  inc   r14                                 ; $09BA16 |
  add   #7                                  ; $09BA17 |
  lsr                                       ; $09BA19 |
  lsr                                       ; $09BA1A |
  to r8                                     ; $09BA1B |
  lsr                                       ; $09BA1C |
  to r7                                     ; $09BA1D |
  getb                                      ; $09BA1E |
  inc   r14                                 ; $09BA1F |
  to r3                                     ; $09BA20 |
  getb                                      ; $09BA21 |
  inc   r14                                 ; $09BA22 |
  getb                                      ; $09BA23 |
  to r2                                     ; $09BA24 |
  add   #15                                 ; $09BA25 |
  inc   r1                                  ; $09BA27 |
  ibt   r0,#$0009                           ; $09BA28 |
  romb                                      ; $09BA2A |

CODE_09BA2C:
  move  r1,r3                               ; $09BA2C |
  move  r11,r10                             ; $09BA2E |
  move  r12,r8                              ; $09BA30 |
  move  r13,r15                             ; $09BA32 |
  iwt   r0,#$C92F                           ; $09BA34 |
  add   r9                                  ; $09BA37 |
  to r14                                    ; $09BA38 |
  add   r11                                 ; $09BA39 |
  getbh                                     ; $09BA3A |
  add   r0                                  ; $09BA3C |
  bcc CODE_09BA42                           ; $09BA3D |
  inc   r1                                  ; $09BA3F |
  dec   r1                                  ; $09BA40 |
  plot                                      ; $09BA41 |

CODE_09BA42:
  add   r0                                  ; $09BA42 |
  bcc CODE_09BA48                           ; $09BA43 |
  inc   r1                                  ; $09BA45 |
  dec   r1                                  ; $09BA46 |
  plot                                      ; $09BA47 |

CODE_09BA48:
  add   r0                                  ; $09BA48 |
  bcc CODE_09BA4E                           ; $09BA49 |
  inc   r1                                  ; $09BA4B |
  dec   r1                                  ; $09BA4C |
  plot                                      ; $09BA4D |

CODE_09BA4E:
  add   r0                                  ; $09BA4E |
  bcc CODE_09BA54                           ; $09BA4F |
  inc   r1                                  ; $09BA51 |
  dec   r1                                  ; $09BA52 |
  plot                                      ; $09BA53 |

CODE_09BA54:
  add   r0                                  ; $09BA54 |
  bcc CODE_09BA5A                           ; $09BA55 |
  inc   r1                                  ; $09BA57 |
  dec   r1                                  ; $09BA58 |
  plot                                      ; $09BA59 |

CODE_09BA5A:
  add   r0                                  ; $09BA5A |
  bcc CODE_09BA60                           ; $09BA5B |
  inc   r1                                  ; $09BA5D |
  dec   r1                                  ; $09BA5E |
  plot                                      ; $09BA5F |

CODE_09BA60:
  add   r0                                  ; $09BA60 |
  bcc CODE_09BA66                           ; $09BA61 |
  inc   r1                                  ; $09BA63 |
  dec   r1                                  ; $09BA64 |
  plot                                      ; $09BA65 |

CODE_09BA66:
  add   r0                                  ; $09BA66 |
  bcc CODE_09BA6C                           ; $09BA67 |
  inc   r1                                  ; $09BA69 |
  dec   r1                                  ; $09BA6A |
  plot                                      ; $09BA6B |

CODE_09BA6C:
  loop                                      ; $09BA6C |
  inc   r11                                 ; $09BA6D |
  with r9                                   ; $09BA6E |
  add   #15                                 ; $09BA6F |
  inc   r9                                  ; $09BA71 |
  dec   r7                                  ; $09BA72 |
  bne CODE_09BA2C                           ; $09BA73 |
  inc   r2                                  ; $09BA75 |
  lm    r0,($407C)                          ; $09BA76 |
  add   #9                                  ; $09BA7A |
  sm    ($407C),r0                          ; $09BA7C |
  iwt   r15,#$B4E1                          ; $09BA80 |
  nop                                       ; $09BA83 |
  ibt   r0,#$0002                           ; $09BA84 |
  sm    ($406E),r0                          ; $09BA86 |
  iwt   r15,#$BA99                          ; $09BA8A |
  nop                                       ; $09BA8D |
  lm    r0,($407C)                          ; $09BA8E |
  inc   r0                                  ; $09BA92 |
  inc   r0                                  ; $09BA93 |
  sbk                                       ; $09BA94 |
  iwt   r15,#$B09F                          ; $09BA95 |
  nop                                       ; $09BA98 |
  stop                                      ; $09BA99 |
  nop                                       ; $09BA9A |

  ibt   r0,#$0001                           ; $09BA9B |
  color                                     ; $09BA9D |
  lm    r8,($408C)                          ; $09BA9E |
  lm    r2,($408E)                          ; $09BAA2 |
  ibt   r0,#$000A                           ; $09BAA6 |
  lm    r1,($4080)                          ; $09BAA8 |
  inc   r1                                  ; $09BAAC |
  to r6                                     ; $09BAAD |
  mult  r1                                  ; $09BAAE |
  ibt   r0,#$0010                           ; $09BAAF |
  lm    r1,($4082)                          ; $09BAB1 |
  inc   r1                                  ; $09BAB5 |
  to r7                                     ; $09BAB6 |
  mult  r1                                  ; $09BAB7 |

CODE_09BAB8:
  move  r1,r8                               ; $09BAB8 |
  move  r12,r6                              ; $09BABA |
  move  r13,r15                             ; $09BABC |
  loop                                      ; $09BABE |
  plot                                      ; $09BABF |
  dec   r7                                  ; $09BAC0 |
  bne CODE_09BAB8                           ; $09BAC1 |
  inc   r2                                  ; $09BAC3 |
  ibt   r0,#$0003                           ; $09BAC4 |
  color                                     ; $09BAC6 |
  lm    r0,($4082)                          ; $09BAC7 |
  add   r0                                  ; $09BACB |
  add   r0                                  ; $09BACC |
  lm    r1,($4080)                          ; $09BACD |
  or    r1                                  ; $09BAD1 |
  add   r0                                  ; $09BAD2 |
  add   r0                                  ; $09BAD3 |
  inc   r0                                  ; $09BAD4 |
  to r15                                    ; $09BAD5 |
  add   r15                                 ; $09BAD6 |
  iwt   r15,#$BB18                          ; $09BAD7 |
  nop                                       ; $09BADA |

  db $01, $A2, $BB, $01                     ; $09BADB |
  db $01, $A2, $BB, $01                     ; $09BADF |
  db $01, $A2, $BB, $01                     ; $09BAE3 |
  db $01, $A2, $BB, $01                     ; $09BAE7 |
  db $01, $A2, $BB, $01                     ; $09BAEB |
  db $01, $A2, $BB, $01                     ; $09BAEF |
  db $01, $A2, $BB, $01                     ; $09BAF3 |
  db $01, $A2, $BB, $01                     ; $09BAF7 |
  db $01, $A2, $BB, $01                     ; $09BAFB |
  db $01, $A2, $BB, $01                     ; $09BAFF |
  db $01, $A2, $BB, $01                     ; $09BB03 |
  db $01, $A2, $BB, $01                     ; $09BB07 |
  db $01, $A2, $BB, $01                     ; $09BB0B |
  db $01, $A2, $BB, $01                     ; $09BB0F |
  db $01, $A2, $BB, $01                     ; $09BB13 |
  db $01                                    ; $09BB17 |

  lm    r0,($4090)                          ; $09BB18 |
  lob                                       ; $09BB1C |
  umult #12                                 ; $09BB1D |
  iwt   r1,#$BD2F                           ; $09BB1F |
  to r14                                    ; $09BB22 |
  add   r1                                  ; $09BB23 |
  lm    r0,($408E)                          ; $09BB24 |
  to r2                                     ; $09BB28 |
  add   #3                                  ; $09BB29 |
  lm    r3,($408C)                          ; $09BB2B |
  ibt   r12,#$000C                          ; $09BB2F |
  move  r13,r15                             ; $09BB31 |
  move  r1,r3                               ; $09BB33 |
  getb                                      ; $09BB35 |
  inc   r14                                 ; $09BB36 |
  swap                                      ; $09BB37 |
  add   r0                                  ; $09BB38 |
  bcc CODE_09BB3E                           ; $09BB39 |
  inc   r1                                  ; $09BB3B |
  dec   r1                                  ; $09BB3C |
  plot                                      ; $09BB3D |

CODE_09BB3E:
  add   r0                                  ; $09BB3E |
  bcc CODE_09BB44                           ; $09BB3F |
  inc   r1                                  ; $09BB41 |
  dec   r1                                  ; $09BB42 |
  plot                                      ; $09BB43 |

CODE_09BB44:
  add   r0                                  ; $09BB44 |
  bcc CODE_09BB4A                           ; $09BB45 |
  inc   r1                                  ; $09BB47 |
  dec   r1                                  ; $09BB48 |
  plot                                      ; $09BB49 |

CODE_09BB4A:
  add   r0                                  ; $09BB4A |
  bcc CODE_09BB50                           ; $09BB4B |
  inc   r1                                  ; $09BB4D |
  dec   r1                                  ; $09BB4E |
  plot                                      ; $09BB4F |

CODE_09BB50:
  add   r0                                  ; $09BB50 |
  bcc CODE_09BB56                           ; $09BB51 |
  inc   r1                                  ; $09BB53 |
  dec   r1                                  ; $09BB54 |
  plot                                      ; $09BB55 |

CODE_09BB56:
  add   r0                                  ; $09BB56 |
  bcc CODE_09BB5C                           ; $09BB57 |
  inc   r1                                  ; $09BB59 |
  dec   r1                                  ; $09BB5A |
  plot                                      ; $09BB5B |

CODE_09BB5C:
  add   r0                                  ; $09BB5C |
  bcc CODE_09BB62                           ; $09BB5D |
  inc   r1                                  ; $09BB5F |
  dec   r1                                  ; $09BB60 |
  plot                                      ; $09BB61 |

CODE_09BB62:
  add   r0                                  ; $09BB62 |
  bcc CODE_09BB68                           ; $09BB63 |
  inc   r1                                  ; $09BB65 |
  dec   r1                                  ; $09BB66 |
  plot                                      ; $09BB67 |

CODE_09BB68:
  loop                                      ; $09BB68 |
  inc   r2                                  ; $09BB69 |
  rpix                                      ; $09BB6A |
  lm    r0,($4090)                          ; $09BB6C |
  lob                                       ; $09BB70 |
  iwt   r1,#$BC2F                           ; $09BB71 |
  to r14                                    ; $09BB74 |
  add   r1                                  ; $09BB75 |
  getb                                      ; $09BB76 |
  to r1                                     ; $09BB77 |
  add   r3                                  ; $09BB78 |
  iwt   r0,#$0082                           ; $09BB79 |
  from r1                                   ; $09BB7C |
  sub   r0                                  ; $09BB7D |
  bcc CODE_09BB99                           ; $09BB7E |
  nop                                       ; $09BB80 |
  ibt   r1,#$0000                           ; $09BB81 |
  lm    r0,($4086)                          ; $09BB83 |
  inc   r0                                  ; $09BB87 |
  to r2                                     ; $09BB88 |
  add   #15                                 ; $09BB89 |
  iwt   r0,#$0040                           ; $09BB8B |
  from r2                                   ; $09BB8E |
  sub   r0                                  ; $09BB8F |
  bcc CODE_09BB95                           ; $09BB90 |
  nop                                       ; $09BB92 |
  ibt   r2,#$0010                           ; $09BB93 |

CODE_09BB95:
  sm    ($4086),r2                          ; $09BB95 |

CODE_09BB99:
  sm    ($4084),r1                          ; $09BB99 |
  lm    r15,($4092)                         ; $09BB9D |
  nop                                       ; $09BBA1 |
  lm    r5,($4080)                          ; $09BBA2 |
  inc   r5                                  ; $09BBA6 |
  lm    r6,($4082)                          ; $09BBA7 |
  inc   r6                                  ; $09BBAB |
  lm    r4,($408E)                          ; $09BBAC |
  from r6                                   ; $09BBB0 |
  umult #3                                  ; $09BBB1 |
  to r4                                     ; $09BBB3 |
  add   r4                                  ; $09BBB4 |
  lm    r9,($408C)                          ; $09BBB5 |
  lm    r0,($4090)                          ; $09BBB9 |
  lob                                       ; $09BBBD |
  umult #12                                 ; $09BBBE |
  iwt   r1,#$BD2F                           ; $09BBC0 |
  to r14                                    ; $09BBC3 |
  add   r1                                  ; $09BBC4 |
  iwt   r13,#$BBD2                          ; $09BBC5 |
  ibt   r11,#$000C                          ; $09BBC8 |

CODE_09BBCA:
  getb                                      ; $09BBCA |
  inc   r14                                 ; $09BBCB |
  to r10                                    ; $09BBCC |
  swap                                      ; $09BBCD |
  ibt   r12,#$0008                          ; $09BBCE |
  ibt   r3,#$0000                           ; $09BBD0 |
  with r10                                  ; $09BBD2 |
  add   r10                                 ; $09BBD3 |
  bcc CODE_09BBEA                           ; $09BBD4 |
  nop                                       ; $09BBD6 |
  from r9                                   ; $09BBD7 |
  to r7                                     ; $09BBD8 |
  add   r3                                  ; $09BBD9 |
  move  r2,r4                               ; $09BBDA |
  move  r8,r6                               ; $09BBDC |

CODE_09BBDE:
  move  r1,r7                               ; $09BBDE |
  move  r0,r5                               ; $09BBE0 |

CODE_09BBE2:
  dec   r0                                  ; $09BBE2 |
  bne CODE_09BBE2                           ; $09BBE3 |
  plot                                      ; $09BBE5 |
  dec   r8                                  ; $09BBE6 |
  bne CODE_09BBDE                           ; $09BBE7 |
  inc   r2                                  ; $09BBE9 |

CODE_09BBEA:
  with r3                                   ; $09BBEA |
  add   r5                                  ; $09BBEB |
  loop                                      ; $09BBEC |
  nop                                       ; $09BBED |
  with r4                                   ; $09BBEE |
  add   r6                                  ; $09BBEF |
  dec   r11                                 ; $09BBF0 |
  bne CODE_09BBCA                           ; $09BBF1 |
  nop                                       ; $09BBF3 |
  rpix                                      ; $09BBF4 |
  lm    r0,($4090)                          ; $09BBF6 |
  lob                                       ; $09BBFA |
  iwt   r1,#$BC2F                           ; $09BBFB |
  to r14                                    ; $09BBFE |
  add   r1                                  ; $09BBFF |
  getb                                      ; $09BC00 |
  umult r5                                  ; $09BC01 |
  to r1                                     ; $09BC03 |
  add   r9                                  ; $09BC04 |
  iwt   r0,#$0082                           ; $09BC05 |
  from r1                                   ; $09BC08 |
  sub   r0                                  ; $09BC09 |
  bcc CODE_09BC26                           ; $09BC0A |
  nop                                       ; $09BC0C |
  ibt   r1,#$0000                           ; $09BC0D |
  lm    r0,($4086)                          ; $09BC0F |
  ibt   r2,#$0010                           ; $09BC13 |
  with r2                                   ; $09BC15 |
  umult r6                                  ; $09BC16 |
  iwt   r0,#$0040                           ; $09BC18 |
  from r2                                   ; $09BC1B |
  sub   r0                                  ; $09BC1C |
  bcc CODE_09BC22                           ; $09BC1D |
  nop                                       ; $09BC1F |
  ibt   r2,#$0010                           ; $09BC20 |

CODE_09BC22:
  sm    ($4086),r2                          ; $09BC22 |

CODE_09BC26:
  sm    ($4084),r1                          ; $09BC26 |
  lm    r15,($4092)                         ; $09BC2A |
  nop                                       ; $09BC2E |

; width of each character in the font (height is always $0C)
  db $08, $08, $08, $08, $08, $08, $05, $08 ; $09BC2F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC37 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC3F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC47 |
  db $08, $08, $08, $08, $08, $08, $04, $04 ; $09BC4F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC57 |
  db $08, $08, $08, $08, $08, $08, $08, $04 ; $09BC5F |
  db $06, $03, $07, $06, $07, $06, $07, $03 ; $09BC67 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC6F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC77 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC7F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC87 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC8F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC97 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BC9F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCA7 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCAF |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCB7 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCBF |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCC7 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCCF |
  db $08, $08, $08, $08, $08, $08, $07, $07 ; $09BCD7 |
  db $08, $08, $05, $08, $08, $07, $08, $08 ; $09BCDF |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCE7 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCEF |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BCF7 |
  db $04, $08, $08, $08, $08, $08, $08, $08 ; $09BCFF |
  db $08, $08, $08, $08, $07, $07, $08, $08 ; $09BD07 |
  db $04, $07, $08, $04, $08, $08, $08, $08 ; $09BD0F |
  db $08, $07, $08, $08, $08, $08, $08, $08 ; $09BD17 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BD1F |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $09BD27 |

; font graphics (1bpp)
  db $18, $04, $00, $1C, $02, $3A, $44, $4E ; $09BD2F |
  db $3B, $00, $00, $00, $0C, $16, $00, $1C ; $09BD37 |
  db $02, $3A, $44, $4E, $3B, $00, $00, $00 ; $09BD3F |
  db $00, $00, $00, $3C, $62, $40, $40, $63 ; $09BD47 |
  db $3E, $08, $04, $38, $18, $04, $00, $1C ; $09BD4F |
  db $22, $7E, $40, $62, $3C, $00, $00, $00 ; $09BD57 |
  db $0C, $10, $00, $1C, $22, $7E, $40, $62 ; $09BD5F |
  db $3C, $00, $00, $00, $0C, $16, $00, $1C ; $09BD67 |
  db $22, $7E, $40, $62, $3C, $00, $00, $00 ; $09BD6F |
  db $30, $58, $00, $20, $20, $20, $40, $40 ; $09BD77 |
  db $20, $00, $00, $00, $0C, $16, $00, $3C ; $09BD7F |
  db $62, $41, $41, $23, $1E, $00, $00, $00 ; $09BD87 |
  db $18, $04, $00, $40, $42, $42, $42, $67 ; $09BD8F |
  db $3D, $00, $00, $00, $0C, $16, $00, $40 ; $09BD97 |
  db $42, $42, $42, $67, $3D, $00, $00, $00 ; $09BD9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BDE7 |
  db $14, $14, $00, $1C, $02, $3A, $44, $4E ; $09BDEF |
  db $3B, $00, $00, $00, $14, $14, $00, $3C ; $09BDF7 |
  db $62, $41, $41, $23, $1E, $00, $00, $00 ; $09BDFF |
  db $14, $14, $00, $40, $42, $42, $42, $67 ; $09BE07 |
  db $3D, $00, $00, $00, $1C, $22, $22, $3C ; $09BE0F |
  db $22, $21, $21, $29, $26, $40, $00, $00 ; $09BE17 |
  db $14, $00, $1C, $26, $22, $43, $7F, $41 ; $09BE1F |
  db $41, $41, $01, $00, $14, $00, $1C, $26 ; $09BE27 |
  db $43, $41, $41, $41, $23, $1E, $00, $00 ; $09BE2F |
  db $14, $00, $22, $21, $41, $41, $41, $43 ; $09BE37 |
  db $66, $3C, $00, $00, $00, $00, $00, $00 ; $09BE3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BE47 |
  db $03, $0F, $1C, $19, $39, $39, $38, $39 ; $09BE4F |
  db $19, $19, $0F, $03, $C0, $F0, $38, $98 ; $09BE57 |
  db $9C, $9C, $1C, $9C, $98, $98, $F0, $C0 ; $09BE5F |
  db $03, $0F, $18, $19, $39, $38, $39, $39 ; $09BE67 |
  db $19, $18, $0F, $03, $C0, $F0, $38, $98 ; $09BE6F |
  db $9C, $3C, $DC, $CC, $88, $18, $F0, $C0 ; $09BE77 |
  db $03, $0F, $19, $19, $39, $3C, $3E, $3E ; $09BE7F |
  db $1E, $1E, $0F, $03, $C0, $F0, $98, $98 ; $09BE87 |
  db $9C, $3C, $7C, $7C, $78, $78, $F0, $C0 ; $09BE8F |
  db $03, $0F, $19, $19, $38, $3C, $3E, $3D ; $09BE97 |
  db $1B, $1B, $0F, $03, $C0, $F0, $D8, $D8 ; $09BE9F |
  db $BC, $7C, $3C, $1C, $98, $98, $F0, $C0 ; $09BEA7 |
  db $00, $1F, $3F, $72, $76, $72, $7A, $72 ; $09BEAF |
  db $3F, $1F, $00, $00, $00, $FF, $FF, $59 ; $09BEB7 |
  db $DB, $59, $DB, $49, $FF, $FF, $00, $00 ; $09BEBF |
  db $00, $FC, $FE, $23, $77, $77, $77, $37 ; $09BEC7 |
  db $FE, $FC, $00, $00, $00, $1F, $3F, $7F ; $09BECF |
  db $7F, $7F, $7F, $7F, $3F, $1F, $00, $00 ; $09BED7 |
  db $00, $FF, $FF, $9F, $9F, $9F, $9F, $81 ; $09BEDF |
  db $FF, $FF, $00, $00, $00, $FC, $FE, $FF ; $09BEE7 |
  db $FF, $FF, $FF, $FF, $FE, $FC, $00, $00 ; $09BEEF |
  db $00, $00, $30, $30, $00, $00, $00, $30 ; $09BEF7 |
  db $30, $00, $00, $00, $00, $00, $30, $30 ; $09BEFF |
  db $00, $00, $30, $30, $10, $20, $00, $00 ; $09BF07 |
  db $00, $1F, $3F, $7F, $7F, $7F, $7F, $7F ; $09BF0F |
  db $3F, $1F, $00, $00, $00, $FF, $FF, $83 ; $09BF17 |
  db $99, $83, $99, $99, $FF, $FF, $00, $00 ; $09BF1F |
  db $00, $FC, $FE, $FF, $FF, $FF, $FF, $FF ; $09BF27 |
  db $FE, $FC, $00, $00, $30, $10, $20, $40 ; $09BF2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BF37 |
  db $14, $22, $41, $77, $14, $14, $14, $14 ; $09BF3F |
  db $14, $1C, $00, $00, $00, $04, $0C, $1F ; $09BF47 |
  db $3F, $7F, $3F, $1F, $0C, $04, $00, $00 ; $09BF4F |
  db $00, $20, $30, $F8, $FC, $FE, $FC, $F8 ; $09BF57 |
  db $30, $20, $00, $00, $00, $00, $08, $1C ; $09BF5F |
  db $3E, $7F, $3E, $3E, $3E, $3E, $00, $00 ; $09BF67 |
  db $00, $00, $3E, $3E, $3E, $3E, $7F, $3E ; $09BF6F |
  db $1C, $08, $00, $00, $00, $1F, $3F, $72 ; $09BF77 |
  db $77, $73, $7B, $73, $3F, $1F, $00, $00 ; $09BF7F |
  db $00, $FF, $FF, $36, $6A, $62, $6A, $6A ; $09BF87 |
  db $FF, $FF, $00, $00, $00, $FC, $FE, $63 ; $09BF8F |
  db $B7, $77, $B7, $B7, $FE, $FC, $00, $00 ; $09BF97 |
  db $0D, $12, $21, $43, $47, $2F, $43, $43 ; $09BF9F |
  db $23, $18, $07, $00, $C0, $30, $88, $CC ; $09BFA7 |
  db $E2, $F2, $C2, $C4, $C4, $18, $E0, $00 ; $09BFAF |
  db $00, $00, $00, $3E, $00, $00, $3E, $00 ; $09BFB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09BFBF |
  db $00, $00, $00, $00, $30, $10, $20, $40 ; $09BFC7 |
  db $00, $00, $00, $18, $24, $7C, $40, $64 ; $09BFCF |
  db $38, $00, $00, $00, $00, $20, $00, $40 ; $09BFD7 |
  db $40, $40, $40, $40, $20, $00, $00, $00 ; $09BFDF |
  db $00, $10, $20, $78, $20, $20, $20, $34 ; $09BFE7 |
  db $18, $00, $00, $00, $00, $00, $00, $58 ; $09BFEF |
  db $34, $20, $20, $20, $20, $00, $00, $00 ; $09BFF7 |
  db $40, $20, $20, $2C, $32, $22, $24, $24 ; $09BFFF |
  db $22, $00, $00, $00, $18, $30, $20, $78 ; $09C007 |
  db $20, $20, $20, $10, $10, $00, $00, $00 ; $09C00F |
  db $00, $00, $00, $58, $2C, $24, $24, $24 ; $09C017 |
  db $22, $00, $00, $00, $00, $00, $00, $00 ; $09C01F |
  db $00, $00, $00, $00, $60, $60, $00, $00 ; $09C027 |
  db $18, $06, $00, $1C, $26, $22, $43, $7F ; $09C02F |
  db $41, $41, $41, $01, $1C, $16, $00, $1C ; $09C037 |
  db $26, $22, $43, $7F, $41, $41, $41, $01 ; $09C03F |
  db $1C, $22, $40, $40, $40, $40, $41, $23 ; $09C047 |
  db $1E, $08, $04, $38, $1C, $06, $00, $3E ; $09C04F |
  db $40, $40, $7C, $40, $40, $40, $7F, $00 ; $09C057 |
  db $1C, $30, $00, $3E, $40, $40, $7C, $40 ; $09C05F |
  db $40, $40, $7F, $00, $1C, $16, $00, $3E ; $09C067 |
  db $40, $40, $7C, $40, $40, $40, $7F, $00 ; $09C06F |
  db $38, $2C, $00, $38, $10, $10, $10, $20 ; $09C077 |
  db $20, $20, $70, $00, $1C, $16, $00, $1C ; $09C07F |
  db $26, $43, $41, $41, $41, $23, $1E, $00 ; $09C087 |
  db $06, $18, $00, $21, $21, $41, $41, $41 ; $09C08F |
  db $43, $66, $3C, $00, $18, $06, $00, $21 ; $09C097 |
  db $21, $41, $41, $41, $43, $66, $3C, $00 ; $09C09F |
  db $14, $00, $38, $10, $10, $20, $20, $20 ; $09C0A7 |
  db $20, $70, $00, $00, $50, $50, $00, $20 ; $09C0AF |
  db $20, $20, $20, $30, $18, $00, $00, $00 ; $09C0B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C0FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C107 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C10F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C117 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C11F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C127 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C12F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C137 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C13F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C147 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C14F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C157 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C15F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C167 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C16F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C177 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C17F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C187 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C18F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C197 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C19F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C1FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C207 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C20F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C217 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C21F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C227 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C22F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C237 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C23F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C247 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C24F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C257 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C25F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C267 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C26F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C277 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C27F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C287 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C28F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C297 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C29F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C2FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C307 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C30F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C317 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C31F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C327 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C32F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C337 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C33F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C347 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C34F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C357 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C35F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C367 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C36F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C377 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C37F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C387 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C38F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C397 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C39F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C3FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C407 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C40F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C417 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C41F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C427 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C42F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C437 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C43F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C447 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C44F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C457 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C45F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C467 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C46F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C477 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C47F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C487 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C48F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C497 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C49F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C4A7 |
  db $1C, $32, $21, $41, $41, $41, $41, $22 ; $09C4AF |
  db $1C, $00, $00, $00, $0C, $14, $04, $04 ; $09C4B7 |
  db $04, $08, $08, $08, $1C, $00, $00, $00 ; $09C4BF |
  db $1E, $31, $21, $01, $06, $18, $20, $42 ; $09C4C7 |
  db $7E, $00, $00, $00, $1C, $22, $02, $0C ; $09C4CF |
  db $02, $01, $41, $63, $3E, $00, $00, $00 ; $09C4D7 |
  db $22, $22, $44, $44, $64, $3F, $08, $08 ; $09C4DF |
  db $08, $00, $00, $00, $20, $3E, $20, $20 ; $09C4E7 |
  db $3E, $03, $01, $43, $3E, $00, $00, $00 ; $09C4EF |
  db $1C, $20, $40, $5E, $63, $41, $41, $23 ; $09C4F7 |
  db $1E, $00, $00, $00, $3F, $61, $42, $04 ; $09C4FF |
  db $04, $08, $08, $08, $08, $00, $00, $00 ; $09C507 |
  db $1C, $22, $22, $1C, $22, $41, $41, $63 ; $09C50F |
  db $3E, $00, $00, $00, $3E, $61, $41, $42 ; $09C517 |
  db $3E, $04, $04, $08, $08, $00, $00, $00 ; $09C51F |
  db $1C, $26, $22, $43, $7F, $41, $41, $41 ; $09C527 |
  db $01, $00, $00, $00, $7C, $22, $22, $3C ; $09C52F |
  db $22, $21, $21, $23, $3E, $00, $00, $00 ; $09C537 |
  db $1C, $22, $40, $40, $40, $40, $41, $23 ; $09C53F |
  db $1E, $00, $00, $00, $7C, $26, $23, $21 ; $09C547 |
  db $21, $21, $21, $22, $7C, $00, $00, $00 ; $09C54F |
  db $3E, $40, $40, $40, $7C, $40, $40, $40 ; $09C557 |
  db $7E, $00, $00, $00, $3E, $40, $40, $40 ; $09C55F |
  db $7C, $40, $40, $40, $20, $00, $00, $00 ; $09C567 |
  db $1C, $22, $40, $40, $4F, $41, $41, $23 ; $09C56F |
  db $1E, $00, $00, $00, $21, $41, $41, $41 ; $09C577 |
  db $7F, $41, $41, $41, $41, $00, $00, $00 ; $09C57F |
  db $38, $10, $10, $10, $20, $20, $20, $20 ; $09C587 |
  db $70, $00, $00, $00, $01, $01, $01, $21 ; $09C58F |
  db $41, $41, $41, $62, $3C, $00, $00, $00 ; $09C597 |
  db $42, $44, $48, $50, $70, $58, $4C, $46 ; $09C59F |
  db $43, $00, $00, $00, $40, $40, $40, $40 ; $09C5A7 |
  db $40, $40, $40, $40, $7E, $00, $00, $00 ; $09C5AF |
  db $20, $21, $73, $55, $49, $41, $41, $41 ; $09C5B7 |
  db $21, $00, $00, $00, $42, $61, $61, $51 ; $09C5BF |
  db $51, $49, $49, $45, $43, $00, $00, $00 ; $09C5C7 |
  db $1C, $26, $43, $41, $41, $41, $41, $23 ; $09C5CF |
  db $1E, $00, $00, $00, $7E, $43, $41, $43 ; $09C5D7 |
  db $3E, $20, $20, $20, $20, $00, $00, $00 ; $09C5DF |
  db $1C, $26, $43, $41, $41, $41, $51, $2A ; $09C5E7 |
  db $1C, $02, $01, $00, $7C, $42, $41, $43 ; $09C5EF |
  db $7E, $48, $44, $42, $41, $00, $00, $00 ; $09C5F7 |
  db $1C, $22, $20, $30, $1C, $02, $41, $43 ; $09C5FF |
  db $3E, $00, $00, $00, $3F, $48, $08, $08 ; $09C607 |
  db $08, $04, $04, $04, $04, $00, $00, $00 ; $09C60F |
  db $22, $21, $41, $41, $41, $41, $43, $66 ; $09C617 |
  db $3C, $00, $00, $00, $40, $41, $21, $23 ; $09C61F |
  db $22, $16, $14, $1C, $08, $00, $00, $00 ; $09C627 |
  db $42, $41, $41, $49, $49, $5D, $55, $77 ; $09C62F |
  db $22, $00, $00, $00, $40, $41, $23, $16 ; $09C637 |
  db $0C, $1C, $32, $61, $41, $00, $00, $00 ; $09C63F |
  db $41, $43, $26, $1C, $08, $08, $08, $08 ; $09C647 |
  db $08, $00, $00, $00, $70, $0F, $02, $04 ; $09C64F |
  db $08, $10, $20, $40, $7F, $00, $00, $00 ; $09C657 |
  db $7E, $82, $BE, $A0, $A0, $A0, $E0, $00 ; $09C65F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C667 |
  db $00, $07, $05, $05, $05, $7D, $41, $7E ; $09C66F |
  db $3C, $62, $42, $06, $0C, $18, $10, $00 ; $09C677 |
  db $10, $10, $00, $00, $30, $30, $20, $60 ; $09C67F |
  db $40, $40, $40, $00, $40, $40, $00, $00 ; $09C687 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C68F |
  db $80, $C0, $60, $20, $00, $00, $00, $00 ; $09C697 |
  db $00, $7F, $00, $00, $00, $00, $00, $00 ; $09C69F |
  db $03, $03, $03, $1F, $1F, $1E, $1F, $1F ; $09C6A7 |
  db $03, $03, $03, $00, $E0, $E0, $E0, $FC ; $09C6AF |
  db $7C, $BC, $7C, $FC, $E0, $E0, $E0, $00 ; $09C6B7 |
  db $00, $00, $00, $00, $2A, $2A, $00, $00 ; $09C6BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C6C7 |
  db $00, $00, $00, $00, $60, $90, $90, $60 ; $09C6CF |
  db $00, $00, $00, $00, $00, $30, $49, $06 ; $09C6D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C6DF |
  db $00, $00, $00, $00, $30, $10, $20, $40 ; $09C6E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C6EF |
  db $00, $00, $00, $00, $48, $48, $6C, $24 ; $09C6F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C6FF |
  db $24, $24, $6C, $48, $00, $00, $00, $00 ; $09C707 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C70F |
  db $00, $18, $18, $00, $00, $00, $00, $00 ; $09C717 |
  db $60, $70, $78, $7C, $7E, $7F, $7E, $7C ; $09C71F |
  db $78, $70, $60, $00, $01, $1A, $27, $21 ; $09C727 |
  db $20, $11, $0E, $02, $01, $00, $00, $00 ; $09C72F |
  db $80, $40, $60, $10, $10, $26, $3A, $12 ; $09C737 |
  db $84, $58, $F0, $00, $00, $00, $44, $68 ; $09C73F |
  db $30, $18, $2C, $44, $00, $00, $00, $00 ; $09C747 |
  db $00, $00, $00, $1C, $02, $3A, $44, $4E ; $09C74F |
  db $3B, $00, $00, $00, $40, $20, $20, $2E ; $09C757 |
  db $31, $21, $21, $33, $5E, $00, $00, $00 ; $09C75F |
  db $00, $00, $00, $3C, $62, $40, $40, $63 ; $09C767 |
  db $3E, $00, $00, $00, $02, $01, $01, $39 ; $09C76F |
  db $66, $42, $42, $46, $3B, $00, $00, $00 ; $09C777 |
  db $00, $00, $00, $1C, $22, $7E, $40, $62 ; $09C77F |
  db $3C, $00, $00, $00, $0C, $1A, $10, $7E ; $09C787 |
  db $10, $10, $10, $08, $08, $00, $00, $00 ; $09C78F |
  db $00, $00, $02, $1E, $31, $23, $1E, $08 ; $09C797 |
  db $3E, $61, $43, $3E, $40, $20, $20, $2E ; $09C79F |
  db $31, $21, $22, $22, $21, $00, $00, $00 ; $09C7A7 |
  db $00, $20, $00, $40, $40, $40, $40, $60 ; $09C7AF |
  db $30, $00, $00, $00, $00, $02, $00, $02 ; $09C7B7 |
  db $02, $02, $02, $02, $46, $4C, $38, $00 ; $09C7BF |
  db $40, $40, $42, $64, $28, $38, $2C, $26 ; $09C7C7 |
  db $23, $00, $00, $00, $20, $20, $40, $40 ; $09C7CF |
  db $40, $40, $40, $60, $30, $00, $00, $00 ; $09C7D7 |
  db $00, $00, $40, $56, $6B, $49, $49, $49 ; $09C7DF |
  db $49, $00, $00, $00, $00, $00, $00, $5C ; $09C7E7 |
  db $26, $22, $22, $22, $21, $00, $00, $00 ; $09C7EF |
  db $00, $00, $00, $3C, $62, $41, $41, $23 ; $09C7F7 |
  db $1E, $00, $00, $00, $00, $00, $00, $5E ; $09C7FF |
  db $23, $21, $21, $13, $1E, $10, $10, $10 ; $09C807 |
  db $00, $00, $00, $1D, $22, $46, $44, $4C ; $09C80F |
  db $38, $08, $08, $04, $00, $00, $00, $5C ; $09C817 |
  db $32, $22, $20, $20, $20, $00, $00, $00 ; $09C81F |
  db $00, $00, $38, $44, $60, $3C, $06, $42 ; $09C827 |
  db $3C, $00, $00, $00, $00, $08, $10, $7C ; $09C82F |
  db $10, $10, $10, $19, $0E, $00, $00, $00 ; $09C837 |
  db $00, $00, $00, $40, $42, $42, $42, $67 ; $09C83F |
  db $3D, $00, $00, $00, $00, $00, $01, $42 ; $09C847 |
  db $62, $24, $34, $18, $08, $00, $00, $00 ; $09C84F |
  db $00, $00, $00, $21, $41, $49, $49, $5B ; $09C857 |
  db $36, $00, $00, $00, $00, $00, $01, $62 ; $09C85F |
  db $34, $18, $18, $2C, $43, $00, $00, $00 ; $09C867 |
  db $00, $00, $00, $41, $21, $22, $12, $16 ; $09C86F |
  db $0C, $18, $30, $C0, $00, $00, $00, $3C ; $09C877 |
  db $03, $06, $18, $30, $7C, $03, $00, $00 ; $09C87F |
  db $03, $07, $0F, $1F, $3F, $7F, $3F, $1F ; $09C887 |
  db $0F, $07, $03, $00, $00, $00, $00, $00 ; $09C88F |
  db $00, $00, $00, $00, $60, $60, $00, $00 ; $09C897 |
  db $0D, $12, $20, $43, $44, $40, $41, $20 ; $09C89F |
  db $11, $0C, $03, $00, $C0, $30, $08, $C4 ; $09C8A7 |
  db $22, $E2, $82, $0C, $84, $18, $E0, $00 ; $09C8AF |
  db $00, $01, $02, $3C, $11, $09, $04, $04 ; $09C8B7 |
  db $38, $3D, $1E, $00, $80, $40, $20, $1E ; $09C8BF |
  db $44, $48, $10, $10, $8E, $5E, $3C, $00 ; $09C8C7 |
  db $01, $06, $09, $11, $10, $20, $20, $20 ; $09C8CF |
  db $3F, $2B, $3F, $00, $C0, $30, $C8, $C4 ; $09C8D7 |
  db $84, $02, $82, $02, $FE, $02, $FE, $00 ; $09C8DF |
  db $1C, $14, $14, $14, $14, $14, $77, $41 ; $09C8E7 |
  db $22, $14, $08, $00, $00, $00, $00, $00 ; $09C8EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C8F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C8FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C907 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C90F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C917 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C91F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C927 |

; message box pictures (1bpp)
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C92F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C937 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C93F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C947 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C94F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C957 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C95F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C967 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C96F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C977 |
  db $00, $00, $03, $F8, $00, $00, $00, $00 ; $09C97F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C987 |
  db $00, $03, $0C, $0E, $00, $00, $00, $00 ; $09C98F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C997 |
  db $00, $03, $98, $03, $00, $00, $00, $00 ; $09C99F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09C9A7 |
  db $00, $1B, $B0, $01, $80, $00, $00, $00 ; $09C9AF |
  db $00, $00, $00, $00, $04, $08, $00, $00 ; $09C9B7 |
  db $00, $19, $C0, $00, $C0, $00, $00, $00 ; $09C9BF |
  db $00, $00, $00, $00, $04, $10, $00, $00 ; $09C9C7 |
  db $00, $1C, $C0, $00, $40, $00, $00, $00 ; $09C9CF |
  db $00, $00, $00, $00, $02, $10, $00, $00 ; $09C9D7 |
  db $00, $0F, $00, $00, $60, $00, $00, $00 ; $09C9DF |
  db $00, $00, $00, $00, $03, $20, $00, $00 ; $09C9E7 |
  db $00, $1F, $F8, $00, $20, $00, $00, $00 ; $09C9EF |
  db $00, $00, $00, $00, $01, $C0, $00, $00 ; $09C9F7 |
  db $00, $30, $0C, $00, $20, $1F, $F0, $00 ; $09C9FF |
  db $00, $00, $00, $00, $00, $80, $00, $00 ; $09CA07 |
  db $00, $60, $02, $00, $20, $1F, $F0, $00 ; $09CA0F |
  db $00, $00, $00, $00, $02, $30, $00, $00 ; $09CA17 |
  db $00, $40, $01, $00, $20, $1F, $B0, $00 ; $09CA1F |
  db $00, $00, $00, $00, $03, $30, $00, $00 ; $09CA27 |
  db $00, $C0, $00, $80, $20, $1F, $A0, $00 ; $09CA2F |
  db $00, $00, $00, $00, $03, $33, $FF, $00 ; $09CA37 |
  db $03, $80, $00, $C0, $20, $0F, $A0, $60 ; $09CA3F |
  db $00, $00, $00, $01, $C3, $BE, $01, $C0 ; $09CA47 |
  db $04, $80, $00, $40, $20, $0F, $E3, $E0 ; $09CA4F |
  db $00, $00, $00, $03, $6F, $38, $00, $60 ; $09CA57 |
  db $04, $80, $00, $40, $20, $0F, $FF, $E0 ; $09CA5F |
  db $00, $00, $00, $02, $33, $30, $04, $30 ; $09CA67 |
  db $04, $80, $00, $40, $67, $FF, $FF, $A0 ; $09CA6F |
  db $00, $00, $00, $02, $30, $00, $48, $10 ; $09CA77 |
  db $03, $C0, $00, $00, $47, $FC, $7F, $E0 ; $09CA7F |
  db $00, $00, $00, $02, $64, $0C, $90, $08 ; $09CA87 |
  db $01, $40, $00, $00, $C7, $F8, $3F, $A0 ; $09CA8F |
  db $00, $00, $02, $02, $44, $19, $21, $08 ; $09CA97 |
  db $02, $40, $00, $00, $87, $F8, $3F, $A0 ; $09CA9F |
  db $00, $00, $03, $03, $4E, $32, $62, $08 ; $09CAA7 |
  db $02, $60, $00, $03, $07, $F8, $3C, $20 ; $09CAAF |
  db $7C, $00, $05, $06, $4A, $26, $C2, $08 ; $09CAB7 |
  db $02, $20, $00, $1C, $07, $3C, $7F, $E1 ; $09CABF |
  db $C7, $00, $0C, $CC, $4A, $04, $00, $08 ; $09CAC7 |
  db $01, $F0, $00, $04, $04, $FF, $C0, $03 ; $09CACF |
  db $C1, $80, $08, $78, $44, $00, $00, $08 ; $09CAD7 |
  db $00, $38, $00, $04, $07, $8F, $E0, $03 ; $09CADF |
  db $C2, $80, $08, $4C, $40, $00, $00, $08 ; $09CAE7 |
  db $00, $36, $04, $0C, $00, $0F, $E0, $07 ; $09CAEF |
  db $C1, $80, $10, $47, $A0, $00, $00, $08 ; $09CAF7 |
  db $00, $1E, $07, $F0, $00, $1F, $F0, $0F ; $09CAFF |
  db $87, $40, $10, $40, $B0, $00, $00, $10 ; $09CB07 |
  db $00, $06, $06, $00, $00, $1F, $F0, $0F ; $09CB0F |
  db $8F, $C0, $10, $67, $F8, $00, $00, $30 ; $09CB17 |
  db $00, $7C, $83, $C0, $00, $1F, $D0, $1E ; $09CB1F |
  db $0F, $C0, $10, $3C, $B8, $00, $00, $60 ; $09CB27 |
  db $0F, $D9, $83, $60, $00, $1F, $10, $10 ; $09CB2F |
  db $0F, $C0, $10, $60, $00, $00, $00, $80 ; $09CB37 |
  db $08, $11, $01, $30, $00, $1F, $F0, $10 ; $09CB3F |
  db $0F, $C0, $10, $40, $C0, $10, $03, $80 ; $09CB47 |
  db $08, $23, $01, $10, $00, $00, $00, $10 ; $09CB4F |
  db $07, $40, $10, $C0, $81, $08, $06, $00 ; $09CB57 |
  db $08, $61, $81, $30, $00, $00, $00, $10 ; $09CB5F |
  db $02, $C0, $18, $81, $03, $07, $F8, $00 ; $09CB67 |
  db $04, $60, $43, $E0, $00, $00, $00, $1B ; $09CB6F |
  db $89, $C0, $28, $81, $02, $01, $80, $00 ; $09CB77 |
  db $04, $20, $42, $C0, $00, $3F, $F0, $0F ; $09CB7F |
  db $E5, $80, $44, $82, $06, $00, $00, $00 ; $09CB87 |
  db $02, $30, $C4, $00, $00, $1F, $E0, $0F ; $09CB8F |
  db $F3, $80, $92, $66, $18, $00, $00, $00 ; $09CB97 |
  db $01, $19, $88, $00, $00, $1F, $C0, $07 ; $09CB9F |
  db $F7, $00, $A1, $9C, $70, $00, $00, $00 ; $09CBA7 |
  db $00, $CE, $10, $00, $00, $0F, $80, $03 ; $09CBAF |
  db $FE, $61, $20, $E0, $F8, $00, $00, $00 ; $09CBB7 |
  db $00, $30, $60, $00, $00, $07, $00, $00 ; $09CBBF |
  db $F8, $11, $41, $FF, $BF, $00, $00, $00 ; $09CBC7 |
  db $00, $FF, $BC, $00, $00, $07, $00, $00 ; $09CBCF |
  db $01, $8A, $47, $C0, $C0, $E0, $00, $00 ; $09CBD7 |
  db $03, $1C, $03, $80, $00, $02, $00, $00 ; $09CBDF |
  db $00, $64, $8C, $31, $80, $10, $00, $00 ; $09CBE7 |
  db $04, $02, $00, $C0, $00, $00, $00, $00 ; $09CBEF |
  db $00, $10, $98, $0D, $80, $10, $00, $00 ; $09CBF7 |
  db $08, $01, $00, $40, $00, $00, $00, $00 ; $09CBFF |
  db $00, $09, $10, $04, $E0, $70, $00, $00 ; $09CC07 |
  db $0C, $01, $FF, $C0, $00, $00, $00, $00 ; $09CC0F |
  db $00, $00, $13, $FE, $1F, $C0, $00, $00 ; $09CC17 |
  db $07, $FE, $00, $00, $00, $00, $00, $00 ; $09CC1F |
  db $00, $00, $1C, $00, $00, $00, $00, $00 ; $09CC27 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CC2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CC37 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CC3F |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $09CC47 |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $09CC4F |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $09CC57 |
  db $00, $00, $01, $9B, $E0, $00, $00, $00 ; $09CC5F |
  db $00, $00, $21, $02, $00, $00, $00, $00 ; $09CC67 |
  db $00, $00, $01, $9F, $F8, $00, $00, $00 ; $09CC6F |
  db $00, $00, $20, $81, $00, $00, $00, $00 ; $09CC77 |
  db $00, $00, $01, $CE, $0C, $00, $00, $00 ; $09CC7F |
  db $00, $00, $20, $81, $00, $00, $00, $00 ; $09CC87 |
  db $00, $00, $00, $D8, $06, $00, $00, $00 ; $09CC8F |
  db $00, $00, $10, $81, $00, $00, $00, $00 ; $09CC97 |
  db $00, $00, $30, $D0, $02, $00, $00, $00 ; $09CC9F |
  db $00, $00, $08, $80, $80, $00, $00, $00 ; $09CCA7 |
  db $00, $00, $4C, $10, $03, $00, $00, $00 ; $09CCAF |
  db $00, $00, $08, $40, $80, $00, $00, $00 ; $09CCB7 |
  db $00, $00, $C3, $00, $03, $00, $00, $00 ; $09CCBF |
  db $00, $00, $08, $40, $80, $00, $00, $00 ; $09CCC7 |
  db $00, $00, $8C, $80, $03, $00, $00, $00 ; $09CCCF |
  db $00, $00, $08, $40, $00, $00, $00, $00 ; $09CCD7 |
  db $00, $00, $74, $00, $03, $00, $00, $00 ; $09CCDF |
  db $00, $00, $08, $40, $40, $00, $00, $00 ; $09CCE7 |
  db $00, $00, $38, $00, $03, $00, $00, $00 ; $09CCEF |
  db $00, $00, $01, $E0, $E6, $00, $00, $00 ; $09CCF7 |
  db $00, $00, $28, $00, $02, $00, $00, $00 ; $09CCFF |
  db $00, $00, $03, $30, $EE, $00, $00, $00 ; $09CD07 |
  db $00, $00, $68, $40, $02, $00, $00, $00 ; $09CD0F |
  db $00, $00, $02, $11, $CE, $00, $00, $00 ; $09CD17 |
  db $00, $00, $78, $20, $0C, $00, $00, $00 ; $09CD1F |
  db $00, $00, $02, $19, $9C, $00, $00, $00 ; $09CD27 |
  db $00, $00, $3C, $30, $08, $00, $00, $00 ; $09CD2F |
  db $00, $00, $03, $E0, $3F, $C0, $00, $00 ; $09CD37 |
  db $00, $00, $3C, $1C, $30, $00, $00, $00 ; $09CD3F |
  db $00, $00, $04, $C0, $00, $30, $00, $00 ; $09CD47 |
  db $00, $00, $0F, $07, $E0, $00, $00, $00 ; $09CD4F |
  db $00, $00, $09, $80, $00, $18, $00, $00 ; $09CD57 |
  db $00, $00, $03, $F2, $00, $00, $00, $00 ; $09CD5F |
  db $00, $00, $09, $00, $00, $08, $00, $00 ; $09CD67 |
  db $00, $00, $00, $63, $00, $00, $01, $00 ; $09CD6F |
  db $00, $00, $07, $0C, $00, $0C, $00, $00 ; $09CD77 |
  db $00, $00, $00, $41, $00, $00, $03, $00 ; $09CD7F |
  db $00, $00, $07, $18, $00, $04, $00, $00 ; $09CD87 |
  db $00, $00, $00, $81, $00, $03, $03, $00 ; $09CD8F |
  db $00, $00, $35, $88, $00, $04, $00, $00 ; $09CD97 |
  db $00, $00, $03, $C1, $00, $03, $C3, $80 ; $09CD9F |
  db $00, $00, $FB, $C8, $00, $04, $00, $00 ; $09CDA7 |
  db $00, $00, $07, $40, $80, $03, $F7, $80 ; $09CDAF |
  db $00, $01, $09, $F8, $00, $04, $00, $00 ; $09CDB7 |
  db $00, $00, $39, $40, $80, $03, $FF, $C0 ; $09CDBF |
  db $00, $01, $0F, $44, $00, $08, $00, $00 ; $09CDC7 |
  db $00, $03, $C2, $71, $80, $07, $FF, $C0 ; $09CDCF |
  db $00, $01, $01, $C6, $00, $18, $00, $00 ; $09CDD7 |
  db $00, $03, $06, $11, $00, $07, $FF, $E0 ; $09CDDF |
  db $00, $01, $80, $43, $00, $30, $00, $00 ; $09CDE7 |
  db $00, $01, $06, $31, $00, $0F, $FF, $F0 ; $09CDEF |
  db $00, $00, $FE, $41, $80, $40, $00, $00 ; $09CDF7 |
  db $00, $00, $C3, $E3, $00, $0F, $FF, $F8 ; $09CDFF |
  db $00, $40, $72, $C0, $E3, $80, $00, $00 ; $09CE07 |
  db $00, $00, $E0, $06, $00, $07, $FF, $FC ; $09CE0F |
  db $00, $60, $03, $80, $DC, $00, $00, $00 ; $09CE17 |
  db $00, $00, $30, $18, $00, $01, $FF, $F8 ; $09CE1F |
  db $00, $78, $07, $00, $60, $04, $00, $00 ; $09CE27 |
  db $00, $00, $0F, $F0, $00, $00, $1F, $E0 ; $09CE2F |
  db $00, $20, $1C, $08, $20, $84, $00, $00 ; $09CE37 |
  db $00, $00, $00, $00, $00, $00, $1F, $80 ; $09CE3F |
  db $00, $20, $78, $3C, $21, $C3, $00, $00 ; $09CE47 |
  db $00, $00, $0E, $70, $00, $00, $1E, $00 ; $09CE4F |
  db $00, $20, $20, $3C, $23, $C0, $E0, $00 ; $09CE57 |
  db $00, $00, $1E, $50, $00, $00, $3E, $00 ; $09CE5F |
  db $00, $40, $20, $7C, $67, $C1, $80, $00 ; $09CE67 |
  db $00, $02, $32, $90, $00, $00, $38, $00 ; $09CE6F |
  db $00, $80, $30, $F8, $4F, $C2, $00, $00 ; $09CE77 |
  db $00, $04, $26, $90, $00, $00, $30, $00 ; $09CE7F |
  db $07, $C0, $19, $F8, $4F, $84, $00, $00 ; $09CE87 |
  db $00, $04, $24, $90, $00, $00, $00, $00 ; $09CE8F |
  db $00, $60, $0F, $E0, $9E, $0C, $00, $00 ; $09CE97 |
  db $00, $08, $28, $E0, $00, $00, $00, $00 ; $09CE9F |
  db $00, $10, $07, $E3, $1C, $08, $00, $00 ; $09CEA7 |
  db $00, $18, $B0, $60, $00, $00, $00, $00 ; $09CEAF |
  db $00, $10, $03, $C6, $18, $38, $00, $00 ; $09CEB7 |
  db $00, $11, $00, $00, $00, $00, $00, $00 ; $09CEBF |
  db $00, $3E, $03, $F8, $01, $CC, $00, $00 ; $09CEC7 |
  db $00, $11, $00, $00, $00, $00, $00, $00 ; $09CECF |
  db $00, $62, $E0, $00, $01, $02, $00, $00 ; $09CED7 |
  db $00, $11, $08, $00, $00, $00, $00, $00 ; $09CEDF |
  db $00, $C3, $B0, $00, $7A, $00, $00, $00 ; $09CEE7 |
  db $00, $02, $10, $00, $00, $00, $00, $00 ; $09CEEF |
  db $00, $03, $17, $CF, $46, $00, $00, $00 ; $09CEF7 |
  db $00, $02, $10, $00, $00, $00, $00, $00 ; $09CEFF |
  db $00, $04, $18, $69, $C3, $00, $00, $00 ; $09CF07 |
  db $00, $02, $20, $00, $00, $00, $00, $00 ; $09CF0F |
  db $00, $00, $08, $18, $41, $00, $00, $00 ; $09CF17 |
  db $00, $02, $20, $00, $00, $00, $00, $00 ; $09CF1F |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $09CF27 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF37 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF4F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF57 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF5F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF67 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF6F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF77 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF87 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF97 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CF9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFF7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09CFFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D007 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D00F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D017 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D01F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D027 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D02F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D037 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D03F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D047 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D04F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D057 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D05F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D067 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D06F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D077 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D07F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D087 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D08F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D097 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D09F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D0FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D107 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D10F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D117 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D11F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D127 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D12F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D137 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D13F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D147 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D14F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D157 |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $09D15F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D167 |
  db $00, $00, $00, $1C, $07, $C0, $00, $00 ; $09D16F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D177 |
  db $00, $00, $01, $9C, $18, $38, $00, $00 ; $09D17F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D187 |
  db $00, $00, $01, $8E, $60, $04, $00, $00 ; $09D18F |
  db $00, $00, $01, $F8, $00, $00, $00, $00 ; $09D197 |
  db $00, $00, $01, $CE, $C0, $02, $00, $00 ; $09D19F |
  db $00, $00, $01, $04, $00, $07, $00, $00 ; $09D1A7 |
  db $00, $00, $00, $C6, $80, $03, $00, $00 ; $09D1AF |
  db $00, $00, $03, $04, $00, $18, $C0, $00 ; $09D1B7 |
  db $00, $00, $00, $E1, $00, $01, $00, $00 ; $09D1BF |
  db $70, $00, $03, $04, $00, $38, $20, $00 ; $09D1C7 |
  db $00, $00, $00, $61, $00, $00, $80, $00 ; $09D1CF |
  db $90, $00, $01, $0B, $80, $7C, $10, $00 ; $09D1D7 |
  db $00, $00, $00, $02, $00, $00, $80, $01 ; $09D1DF |
  db $8E, $00, $01, $00, $C3, $FC, $08, $00 ; $09D1E7 |
  db $00, $00, $00, $72, $00, $00, $80, $03 ; $09D1EF |
  db $83, $00, $03, $40, $7C, $7C, $E8, $00 ; $09D1F7 |
  db $00, $00, $06, $82, $00, $00, $80, $02 ; $09D1FF |
  db $03, $80, $02, $30, $E0, $F9, $F4, $00 ; $09D207 |
  db $00, $00, $0F, $00, $00, $00, $80, $06 ; $09D20F |
  db $20, $80, $07, $E0, $60, $D9, $F4, $00 ; $09D217 |
  db $00, $00, $0A, $00, $00, $00, $80, $06 ; $09D21F |
  db $20, $80, $7C, $20, $C0, $E1, $F4, $00 ; $09D227 |
  db $00, $00, $0A, $00, $00, $00, $80, $03 ; $09D22F |
  db $38, $CF, $84, $10, $C1, $C0, $E2, $00 ; $09D237 |
  db $00, $00, $0A, $00, $00, $01, $80, $01 ; $09D23F |
  db $0C, $F0, $06, $18, $3E, $B8, $02, $00 ; $09D247 |
  db $00, $00, $0E, $00, $00, $03, $00, $03 ; $09D24F |
  db $7C, $C0, $01, $18, $20, $FC, $02, $00 ; $09D257 |
  db $00, $00, $0A, $00, $00, $02, $00, $0F ; $09D25F |
  db $84, $C0, $03, $F0, $30, $FE, $0E, $00 ; $09D267 |
  db $00, $00, $0B, $07, $00, $0C, $00, $F1 ; $09D26F |
  db $0C, $60, $3E, $10, $10, $FE, $1E, $00 ; $09D277 |
  db $00, $00, $09, $01, $C0, $78, $00, $03 ; $09D27F |
  db $18, $27, $C2, $10, $1F, $FC, $3C, $00 ; $09D287 |
  db $00, $00, $0F, $C0, $7F, $E0, $00, $02 ; $09D28F |
  db $18, $38, $02, $18, $30, $78, $3C, $00 ; $09D297 |
  db $00, $00, $00, $79, $90, $D0, $00, $03 ; $09D29F |
  db $BC, $10, $01, $FC, $60, $20, $38, $00 ; $09D2A7 |
  db $00, $00, $00, $2F, $0C, $9F, $00, $07 ; $09D2AF |
  db $CC, $30, $7F, $E0, $20, $18, $30, $00 ; $09D2B7 |
  db $00, $00, $00, $79, $87, $99, $80, $F8 ; $09D2BF |
  db $C8, $7F, $80, $28, $20, $07, $C0, $00 ; $09D2C7 |
  db $00, $00, $00, $47, $FC, $00, $80, $00 ; $09D2CF |
  db $F8, $60, $00, $28, $20, $00, $00, $00 ; $09D2D7 |
  db $00, $07, $61, $A1, $EC, $00, $80, $03 ; $09D2DF |
  db $E0, $60, $00, $1C, $20, $00, $00, $00 ; $09D2E7 |
  db $00, $1C, $81, $01, $94, $00, $9C, $00 ; $09D2EF |
  db $16, $40, $00, $03, $C0, $00, $00, $00 ; $09D2F7 |
  db $00, $31, $01, $07, $1A, $01, $E4, $00 ; $09D2FF |
  db $1E, $60, $00, $00, $00, $00, $00, $00 ; $09D307 |
  db $00, $C6, $03, $8F, $0B, $FF, $84, $00 ; $09D30F |
  db $07, $C0, $00, $00, $00, $00, $00, $00 ; $09D317 |
  db $03, $88, $0E, $FB, $0A, $61, $04, $00 ; $09D31F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D327 |
  db $06, $30, $30, $02, $0A, $22, $08, $00 ; $09D32F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D337 |
  db $08, $40, $C0, $E2, $0A, $22, $18, $00 ; $09D33F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D347 |
  db $10, $47, $03, $22, $14, $24, $30, $00 ; $09D34F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D357 |
  db $20, $78, $0D, $17, $34, $68, $60, $00 ; $09D35F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D367 |
  db $40, $00, $71, $0F, $E8, $69, $C0, $00 ; $09D36F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D377 |
  db $40, $03, $81, $07, $F0, $4B, $00, $00 ; $09D37F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D387 |
  db $60, $3E, $01, $82, $00, $CC, $00, $00 ; $09D38F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D397 |
  db $3F, $F0, $00, $81, $01, $C0, $00, $00 ; $09D39F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3A7 |
  db $07, $80, $00, $C1, $C3, $00, $00, $00 ; $09D3AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3B7 |
  db $00, $00, $00, $30, $FC, $00, $00, $00 ; $09D3BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3C7 |
  db $00, $00, $00, $0F, $80, $00, $00, $00 ; $09D3CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3D7 |
  db $00, $00, $00, $01, $80, $00, $00, $00 ; $09D3DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D3FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D407 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D40F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D417 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D41F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D427 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D42F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D437 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D43F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D447 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D44F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D457 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D45F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D467 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D46F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D477 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D47F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D487 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D48F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D497 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D49F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4C7 |
  db $00, $00, $00, $00, $66, $00, $00, $00 ; $09D4CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4D7 |
  db $00, $00, $00, $00, $66, $00, $00, $00 ; $09D4DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4E7 |
  db $00, $00, $00, $00, $66, $1F, $00, $00 ; $09D4EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D4F7 |
  db $00, $00, $00, $00, $66, $71, $80, $00 ; $09D4FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D507 |
  db $00, $00, $00, $00, $67, $80, $60, $00 ; $09D50F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D517 |
  db $00, $00, $00, $00, $06, $00, $20, $00 ; $09D51F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D527 |
  db $00, $00, $00, $00, $08, $00, $10, $00 ; $09D52F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D537 |
  db $00, $00, $00, $00, $F0, $00, $10, $00 ; $09D53F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D547 |
  db $00, $00, $00, $F3, $00, $00, $08, $00 ; $09D54F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D557 |
  db $00, $00, $01, $9C, $00, $00, $08, $00 ; $09D55F |
  db $00, $00, $00, $00, $30, $00, $00, $00 ; $09D567 |
  db $00, $00, $02, $08, $00, $00, $08, $00 ; $09D56F |
  db $00, $00, $00, $00, $50, $00, $00, $00 ; $09D577 |
  db $00, $00, $02, $10, $00, $00, $08, $00 ; $09D57F |
  db $00, $00, $00, $00, $97, $FC, $00, $00 ; $09D587 |
  db $00, $00, $02, $10, $00, $00, $08, $00 ; $09D58F |
  db $00, $00, $00, $00, $9F, $07, $00, $00 ; $09D597 |
  db $00, $00, $01, $F0, $00, $00, $10, $00 ; $09D59F |
  db $00, $00, $00, $00, $7B, $E1, $80, $00 ; $09D5A7 |
  db $00, $00, $00, $F0, $00, $00, $10, $00 ; $09D5AF |
  db $00, $00, $00, $00, $3C, $F8, $40, $00 ; $09D5B7 |
  db $00, $00, $00, $90, $03, $E0, $20, $00 ; $09D5BF |
  db $00, $00, $00, $00, $77, $1E, $60, $00 ; $09D5C7 |
  db $00, $00, $00, $98, $0C, $1C, $60, $00 ; $09D5CF |
  db $00, $00, $00, $00, $53, $87, $30, $00 ; $09D5D7 |
  db $00, $03, $00, $C8, $10, $07, $80, $00 ; $09D5DF |
  db $00, $00, $01, $FC, $D1, $C3, $B0, $00 ; $09D5E7 |
  db $00, $03, $C3, $FC, $30, $00, $00, $00 ; $09D5EF |
  db $00, $00, $06, $06, $90, $E1, $90, $00 ; $09D5F7 |
  db $00, $02, $6C, $66, $20, $00, $00, $00 ; $09D5FF |
  db $00, $00, $04, $03, $98, $F0, $D0, $00 ; $09D607 |
  db $00, $02, $38, $23, $3F, $FF, $FF, $FF ; $09D60F |
  db $FF, $FF, $F8, $01, $98, $78, $D0, $00 ; $09D617 |
  db $00, $02, $6F, $FF, $20, $00, $00, $00 ; $09D61F |
  db $00, $00, $00, $01, $98, $3C, $D0, $00 ; $09D627 |
  db $00, $02, $98, $7D, $20, $00, $00, $00 ; $09D62F |
  db $00, $00, $00, $01, $9C, $1C, $50, $00 ; $09D637 |
  db $00, $01, $81, $81, $BF, $FF, $FF, $FF ; $09D63F |
  db $FF, $FF, $FC, $03, $CC, $0E, $70, $00 ; $09D647 |
  db $00, $01, $86, $02, $A0, $00, $00, $00 ; $09D64F |
  db $00, $00, $03, $8E, $4F, $06, $20, $00 ; $09D657 |
  db $00, $01, $84, $06, $A0, $00, $00, $00 ; $09D65F |
  db $00, $00, $00, $78, $47, $83, $60, $00 ; $09D667 |
  db $00, $00, $CC, $04, $B8, $00, $00, $00 ; $09D66F |
  db $00, $00, $00, $00, $23, $E1, $C0, $00 ; $09D677 |
  db $00, $00, $F8, $18, $86, $00, $00, $00 ; $09D67F |
  db $00, $00, $00, $00, $18, $7D, $80, $00 ; $09D687 |
  db $00, $00, $60, $EC, $42, $00, $00, $00 ; $09D68F |
  db $00, $00, $00, $00, $06, $07, $00, $00 ; $09D697 |
  db $00, $03, $FF, $FB, $66, $00, $00, $00 ; $09D69F |
  db $00, $00, $00, $00, $01, $FE, $00, $00 ; $09D6A7 |
  db $00, $04, $03, $E0, $BC, $00, $00, $00 ; $09D6AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6B7 |
  db $00, $07, $FC, $3F, $80, $00, $00, $00 ; $09D6BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D6FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D707 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D70F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D717 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D71F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D727 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D72F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D737 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D73F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D747 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D74F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D757 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D75F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D767 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D76F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D777 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D77F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D787 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D78F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D797 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D79F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D7FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D807 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D80F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D817 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D81F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D827 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D82F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D837 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D83F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D847 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D84F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D857 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D85F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D867 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D86F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D877 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D87F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D887 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D88F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D897 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D89F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D8FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D907 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D90F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D917 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D91F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09D927 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D92F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D937 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D93F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D947 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D94F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D957 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D95F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D967 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D96F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D977 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D97F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D987 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D98F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D997 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D99F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D9A7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D9AF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09D9B7 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D9BF |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09D9C7 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D9CF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D9D7 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D9DF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D9E7 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D9EF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09D9F7 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09D9FF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DA07 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA0F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DA1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DA27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DA2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DA37 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA3F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA47 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DA4F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DA57 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DA5F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DA67 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DA6F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DA77 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DA7F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DA87 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA8F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DA97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DA9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DAA7 |
  db $00, $00, $00, $FF, $FF, $FF, $FF, $FF ; $09DAAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DAB7 |
  db $00, $00, $00, $BD, $BD, $BD, $BD, $BD ; $09DABF |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DAC7 |
  db $00, $00, $00, $DB, $DB, $DB, $DB, $DB ; $09DACF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DAD7 |
  db $30, $00, $00, $E7, $E7, $E7, $E7, $E7 ; $09DADF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DAE7 |
  db $50, $00, $00, $E7, $E7, $E7, $E7, $E7 ; $09DAEF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DAF7 |
  db $90, $00, $00, $DB, $DB, $DB, $DB, $DB ; $09DAFF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DB07 |
  db $9F, $00, $00, $BD, $BD, $BD, $BD, $BD ; $09DB0F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DB17 |
  db $7D, $80, $00, $FF, $FF, $FF, $FF, $FF ; $09DB1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DB27 |
  db $6C, $FF, $00, $FF, $FF, $FF, $FF, $FF ; $09DB2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DB37 |
  db $48, $20, $C0, $BD, $BD, $BD, $BD, $BD ; $09DB3F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DB47 |
  db $48, $60, $60, $DB, $DB, $DB, $DB, $DB ; $09DB4F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DB57 |
  db $CC, $C0, $30, $E7, $E7, $E7, $E7, $E7 ; $09DB5F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DB67 |
  db $87, $81, $10, $E7, $E7, $E7, $E7, $E7 ; $09DB6F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DB77 |
  db $80, $03, $D0, $DB, $DB, $DB, $DB, $DB ; $09DB7F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DB87 |
  db $80, $04, $70, $BD, $BD, $BD, $BD, $BD ; $09DB8F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DB97 |
  db $86, $08, $10, $FF, $FF, $FF, $FF, $FF ; $09DB9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DBA7 |
  db $99, $88, $10, $FF, $FF, $FF, $FF, $FF ; $09DBAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DBB7 |
  db $E0, $88, $10, $BD, $BD, $BD, $BD, $BD ; $09DBBF |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DBC7 |
  db $60, $C8, $20, $DB, $DB, $DB, $DB, $DB ; $09DBCF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DBD7 |
  db $60, $4C, $60, $E7, $E7, $E7, $E7, $E7 ; $09DBDF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DBE7 |
  db $60, $43, $C0, $E7, $E7, $E7, $E7, $E7 ; $09DBEF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DBF7 |
  db $30, $80, $80, $DB, $DB, $DB, $DB, $DB ; $09DBFF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DC07 |
  db $1F, $83, $00, $BD, $BD, $BD, $BD, $BD ; $09DC0F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DC17 |
  db $07, $FE, $00, $FF, $FF, $FF, $FF, $FF ; $09DC1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DC27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DC2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DC37 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DC3F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DC47 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DC4F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DC57 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DC5F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DC67 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DC6F |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DC77 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DC7F |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DC87 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DC8F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DC97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DC9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DCA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DCAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DCB7 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DCBF |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DCC7 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DCCF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DCD7 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DCDF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DCE7 |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DCEF |
  db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7 ; $09DCF7 |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DCFF |
  db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB ; $09DD07 |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DD0F |
  db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD ; $09DD17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DD1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09DD27 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD37 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD4F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD57 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD5F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD67 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD6F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD77 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD87 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD97 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DD9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDF7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DDFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE07 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE0F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE17 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE1F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE27 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE37 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE4F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE57 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE5F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE67 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE6F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE77 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE87 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE97 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DE9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DECF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DED7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEF7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DEFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF07 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF0F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF17 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF1F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF27 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF2F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF37 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF4F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF57 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF5F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF67 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF6F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF77 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF87 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF97 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DF9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFF7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09DFFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E007 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E00F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E017 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E01F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E027 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E02F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E037 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E03F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E047 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E04F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E057 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E05F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E067 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E06F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E077 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E07F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E087 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E08F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E097 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E09F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E0FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E107 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E10F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E117 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E11F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E127 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E12F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E137 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E13F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E147 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E14F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E157 |
  db $00, $07, $E0, $00, $00, $05, $05, $00 ; $09E15F |
  db $00, $05, $00, $0C, $0C, $00, $00, $00 ; $09E167 |
  db $00, $04, $20, $10, $00, $05, $35, $00 ; $09E16F |
  db $40, $05, $04, $08, $08, $00, $00, $00 ; $09E177 |
  db $00, $04, $20, $10, $00, $00, $18, $00 ; $09E17F |
  db $40, $80, $44, $08, $08, $00, $00, $00 ; $09E187 |
  db $00, $3C, $3C, $FF, $00, $FE, $08, $00 ; $09E18F |
  db $61, $84, $44, $18, $18, $00, $00, $00 ; $09E197 |
  db $00, $21, $84, $10, $00, $0C, $08, $00 ; $09E19F |
  db $27, $BF, $FF, $10, $10, $00, $00, $00 ; $09E1A7 |
  db $00, $22, $44, $10, $00, $18, $18, $00 ; $09E1AF |
  db $3C, $82, $44, $10, $10, $00, $00, $00 ; $09E1B7 |
  db $00, $22, $44, $10, $00, $30, $52, $7C ; $09E1BF |
  db $30, $82, $44, $10, $10, $00, $00, $00 ; $09E1C7 |
  db $00, $21, $84, $FF, $FF, $60, $DB, $C6 ; $09E1CF |
  db $60, $9E, $44, $10, $10, $00, $00, $00 ; $09E1D7 |
  db $00, $3C, $3C, $08, $00, $40, $89, $02 ; $09E1DF |
  db $C0, $B3, $40, $00, $00, $00, $00, $00 ; $09E1E7 |
  db $00, $04, $20, $08, $00, $40, $89, $06 ; $09E1EF |
  db $81, $A2, $40, $10, $10, $00, $00, $00 ; $09E1F7 |
  db $00, $04, $20, $0C, $00, $63, $18, $0C ; $09E1FF |
  db $C3, $B6, $63, $38, $38, $00, $00, $00 ; $09E207 |
  db $00, $07, $E0, $04, $00, $3E, $30, $18 ; $09E20F |
  db $7E, $1C, $3E, $30, $30, $00, $00, $00 ; $09E217 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E21F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E227 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E22F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E237 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E23F |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $09E247 |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $09E24F |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $09E257 |
  db $00, $00, $01, $9B, $E0, $00, $00, $00 ; $09E25F |
  db $00, $00, $21, $02, $00, $00, $00, $00 ; $09E267 |
  db $00, $00, $01, $9F, $F8, $00, $00, $00 ; $09E26F |
  db $00, $00, $20, $81, $00, $00, $00, $00 ; $09E277 |
  db $00, $00, $01, $CE, $0C, $00, $00, $00 ; $09E27F |
  db $00, $00, $20, $81, $00, $00, $00, $00 ; $09E287 |
  db $00, $00, $01, $D8, $06, $00, $00, $00 ; $09E28F |
  db $00, $00, $10, $81, $00, $00, $00, $00 ; $09E297 |
  db $00, $00, $30, $10, $02, $00, $00, $00 ; $09E29F |
  db $00, $00, $08, $80, $80, $00, $00, $00 ; $09E2A7 |
  db $00, $00, $4C, $10, $03, $00, $00, $00 ; $09E2AF |
  db $00, $00, $08, $40, $80, $00, $00, $00 ; $09E2B7 |
  db $00, $00, $C3, $00, $03, $00, $00, $00 ; $09E2BF |
  db $00, $00, $08, $40, $80, $00, $00, $00 ; $09E2C7 |
  db $00, $00, $8C, $80, $03, $00, $00, $00 ; $09E2CF |
  db $00, $00, $08, $40, $00, $00, $00, $00 ; $09E2D7 |
  db $00, $00, $74, $00, $03, $00, $00, $00 ; $09E2DF |
  db $00, $00, $08, $40, $00, $00, $00, $00 ; $09E2E7 |
  db $00, $00, $38, $00, $03, $00, $00, $00 ; $09E2EF |
  db $00, $00, $01, $E0, $0C, $00, $00, $00 ; $09E2F7 |
  db $00, $00, $28, $00, $02, $00, $00, $00 ; $09E2FF |
  db $00, $00, $03, $31, $8C, $00, $00, $00 ; $09E307 |
  db $00, $00, $68, $40, $02, $00, $00, $00 ; $09E30F |
  db $00, $00, $02, $11, $98, $00, $00, $00 ; $09E317 |
  db $00, $00, $78, $20, $0C, $00, $00, $00 ; $09E31F |
  db $00, $00, $02, $1F, $B8, $00, $00, $00 ; $09E327 |
  db $00, $00, $3C, $30, $08, $00, $00, $00 ; $09E32F |
  db $00, $00, $03, $E3, $BF, $C0, $00, $00 ; $09E337 |
  db $00, $00, $3C, $1C, $30, $00, $00, $00 ; $09E33F |
  db $00, $00, $04, $C7, $10, $30, $00, $00 ; $09E347 |
  db $00, $00, $0F, $07, $E0, $00, $00, $00 ; $09E34F |
  db $00, $00, $09, $86, $20, $18, $00, $00 ; $09E357 |
  db $00, $00, $03, $F2, $00, $00, $00, $00 ; $09E35F |
  db $00, $00, $09, $02, $00, $08, $00, $00 ; $09E367 |
  db $00, $00, $00, $63, $00, $00, $01, $00 ; $09E36F |
  db $00, $00, $07, $0C, $00, $0C, $00, $00 ; $09E377 |
  db $00, $00, $00, $41, $00, $00, $03, $00 ; $09E37F |
  db $00, $00, $07, $18, $00, $04, $00, $00 ; $09E387 |
  db $00, $00, $00, $81, $00, $03, $03, $00 ; $09E38F |
  db $00, $00, $35, $88, $00, $04, $00, $00 ; $09E397 |
  db $00, $00, $03, $C1, $00, $03, $C3, $80 ; $09E39F |
  db $00, $00, $FB, $C8, $00, $04, $00, $00 ; $09E3A7 |
  db $00, $00, $07, $40, $80, $03, $F7, $80 ; $09E3AF |
  db $00, $01, $09, $F8, $00, $04, $00, $00 ; $09E3B7 |
  db $00, $00, $39, $40, $80, $03, $FF, $C0 ; $09E3BF |
  db $00, $01, $0F, $44, $00, $08, $00, $00 ; $09E3C7 |
  db $00, $03, $C2, $71, $80, $07, $FF, $C0 ; $09E3CF |
  db $00, $01, $01, $C6, $00, $18, $00, $00 ; $09E3D7 |
  db $00, $03, $06, $11, $00, $07, $FF, $E0 ; $09E3DF |
  db $00, $01, $80, $43, $00, $30, $00, $00 ; $09E3E7 |
  db $00, $01, $06, $31, $00, $0F, $FF, $F0 ; $09E3EF |
  db $00, $00, $FE, $41, $80, $40, $00, $00 ; $09E3F7 |
  db $00, $00, $C3, $E3, $00, $0F, $FF, $F8 ; $09E3FF |
  db $00, $40, $72, $C0, $E3, $80, $00, $00 ; $09E407 |
  db $00, $00, $E0, $06, $00, $07, $FF, $FC ; $09E40F |
  db $00, $60, $03, $80, $DC, $00, $00, $00 ; $09E417 |
  db $00, $00, $30, $18, $00, $01, $FF, $F8 ; $09E41F |
  db $00, $78, $07, $00, $60, $04, $00, $00 ; $09E427 |
  db $00, $00, $0F, $F0, $00, $00, $1F, $E0 ; $09E42F |
  db $00, $20, $1C, $08, $20, $84, $00, $00 ; $09E437 |
  db $00, $00, $00, $00, $00, $00, $1F, $80 ; $09E43F |
  db $00, $20, $78, $3C, $21, $C3, $00, $00 ; $09E447 |
  db $00, $00, $0E, $70, $00, $00, $1E, $00 ; $09E44F |
  db $00, $20, $20, $3C, $23, $C0, $E0, $00 ; $09E457 |
  db $00, $00, $1E, $50, $00, $00, $3E, $00 ; $09E45F |
  db $00, $40, $20, $7C, $67, $C1, $80, $00 ; $09E467 |
  db $00, $02, $32, $90, $00, $00, $38, $00 ; $09E46F |
  db $00, $80, $30, $F8, $4F, $C2, $00, $00 ; $09E477 |
  db $00, $04, $26, $90, $00, $00, $30, $00 ; $09E47F |
  db $07, $C0, $19, $F8, $4F, $84, $00, $00 ; $09E487 |
  db $00, $04, $24, $90, $00, $00, $00, $00 ; $09E48F |
  db $00, $60, $0F, $E0, $9E, $0C, $00, $00 ; $09E497 |
  db $00, $08, $28, $E0, $00, $00, $00, $00 ; $09E49F |
  db $00, $10, $07, $E3, $1C, $08, $00, $00 ; $09E4A7 |
  db $00, $18, $B0, $60, $00, $00, $00, $00 ; $09E4AF |
  db $00, $10, $03, $C6, $18, $38, $00, $00 ; $09E4B7 |
  db $00, $11, $00, $00, $00, $00, $00, $00 ; $09E4BF |
  db $00, $3E, $03, $F8, $01, $CC, $00, $00 ; $09E4C7 |
  db $00, $11, $00, $00, $00, $00, $00, $00 ; $09E4CF |
  db $00, $62, $E0, $00, $01, $02, $00, $00 ; $09E4D7 |
  db $00, $11, $08, $00, $00, $00, $00, $00 ; $09E4DF |
  db $00, $C3, $B0, $00, $7A, $00, $00, $00 ; $09E4E7 |
  db $00, $02, $10, $00, $00, $00, $00, $00 ; $09E4EF |
  db $00, $03, $17, $CF, $46, $00, $00, $00 ; $09E4F7 |
  db $00, $02, $10, $00, $00, $00, $00, $00 ; $09E4FF |
  db $00, $04, $18, $69, $C3, $00, $00, $00 ; $09E507 |
  db $00, $02, $20, $00, $00, $00, $00, $00 ; $09E50F |
  db $00, $00, $08, $18, $41, $00, $00, $00 ; $09E517 |
  db $00, $02, $20, $00, $00, $00, $00, $00 ; $09E51F |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $09E527 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E52F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E537 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E53F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E547 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E54F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E557 |
  db $00, $00, $05, $00, $00, $05, $00, $05 ; $09E55F |
  db $00, $00, $00, $05, $0C, $0C, $00, $00 ; $09E567 |
  db $00, $83, $15, $10, $00, $05, $20, $05 ; $09E56F |
  db $30, $20, $FC, $05, $08, $08, $00, $00 ; $09E577 |
  db $00, $C6, $10, $3E, $C0, $00, $26, $80 ; $09E57F |
  db $1C, $20, $0C, $F8, $08, $08, $00, $00 ; $09E587 |
  db $00, $6C, $FF, $63, $78, $FE, $F3, $84 ; $09E58F |
  db $06, $AC, $18, $18, $18, $18, $00, $00 ; $09E597 |
  db $00, $38, $10, $C1, $01, $0C, $41, $9F ; $09E59F |
  db $20, $BE, $30, $30, $10, $10, $00, $00 ; $09E5A7 |
  db $00, $10, $10, $91, $01, $18, $C4, $82 ; $09E5AF |
  db $60, $B2, $3E, $60, $10, $10, $00, $00 ; $09E5B7 |
  db $00, $10, $52, $1B, $03, $30, $84, $82 ; $09E5BF |
  db $3E, $A2, $03, $FF, $10, $10, $00, $00 ; $09E5C7 |
  db $00, $30, $D2, $0E, $06, $60, $3C, $82 ; $09E5CF |
  db $03, $A6, $79, $18, $10, $10, $00, $00 ; $09E5D7 |
  db $00, $20, $93, $06, $0C, $40, $66, $82 ; $09E5DF |
  db $01, $E4, $CD, $30, $00, $00, $00, $00 ; $09E5E7 |
  db $00, $20, $91, $0C, $18, $40, $47, $C6 ; $09E5EF |
  db $03, $E6, $87, $20, $10, $10, $00, $00 ; $09E5F7 |
  db $00, $20, $18, $18, $30, $63, $6D, $0C ; $09E5FF |
  db $C6, $23, $C6, $33, $38, $38, $00, $00 ; $09E607 |
  db $00, $20, $08, $30, $60, $3E, $38, $08 ; $09E60F |
  db $7C, $20, $7C, $1E, $30, $30, $00, $00 ; $09E617 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E61F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E627 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E62F |
  db $00, $00, $00, $07, $80, $00, $00, $00 ; $09E637 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E63F |
  db $00, $80, $40, $18, $78, $00, $00, $00 ; $09E647 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E64F |
  db $00, $86, $40, $20, $0F, $00, $00, $00 ; $09E657 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $09E65F |
  db $C1, $1A, $C0, $00, $01, $80, $00, $00 ; $09E667 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $09E66F |
  db $23, $08, $80, $00, $00, $C0, $00, $00 ; $09E677 |
  db $00, $00, $00, $00, $00, $00, $00, $11 ; $09E67F |
  db $25, $00, $00, $1F, $80, $60, $00, $00 ; $09E687 |
  db $00, $00, $00, $00, $00, $00, $00, $13 ; $09E68F |
  db $C9, $80, $00, $60, $60, $20, $00, $00 ; $09E697 |
  db $00, $00, $00, $00, $00, $00, $00, $0C ; $09E69F |
  db $00, $80, $00, $40, $38, $00, $00, $00 ; $09E6A7 |
  db $00, $00, $00, $00, $00, $00, $00, $18 ; $09E6AF |
  db $00, $80, $CC, $00, $0C, $0F, $C0, $00 ; $09E6B7 |
  db $00, $00, $0D, $8F, $80, $00, $00, $29 ; $09E6BF |
  db $00, $00, $CC, $00, $06, $18, $E0, $00 ; $09E6C7 |
  db $00, $00, $0D, $98, $C0, $00, $00, $45 ; $09E6CF |
  db $C0, $00, $CC, $01, $E0, $3C, $70, $00 ; $09E6D7 |
  db $00, $00, $0F, $E0, $60, $00, $00, $12 ; $09E6DF |
  db $40, $33, $EC, $00, $18, $7C, $38, $00 ; $09E6E7 |
  db $00, $00, $1D, $80, $20, $00, $00, $12 ; $09E6EF |
  db $00, $7E, $CD, $F8, $0C, $7C, $1C, $00 ; $09E6F7 |
  db $00, $00, $2D, $80, $10, $00, $00, $18 ; $09E6FF |
  db $00, $88, $06, $0C, $04, $F8, $FC, $00 ; $09E707 |
  db $00, $00, $E0, $00, $18, $00, $00, $00 ; $09E70F |
  db $00, $90, $08, $02, $00, $C1, $EC, $00 ; $09E717 |
  db $00, $01, $40, $00, $18, $00, $00, $00 ; $09E71F |
  db $00, $B0, $10, $03, $00, $81, $EC, $00 ; $09E727 |
  db $00, $01, $40, $80, $18, $00, $00, $00 ; $09E72F |
  db $01, $E0, $00, $01, $00, $81, $EC, $00 ; $09E737 |
  db $00, $0F, $C1, $80, $18, $02, $00, $00 ; $09E73F |
  db $03, $20, $00, $01, $01, $B9, $CC, $00 ; $09E747 |
  db $00, $3B, $43, $00, $18, $03, $00, $00 ; $09E74F |
  db $02, $20, $00, $01, $01, $FC, $0C, $00 ; $09E757 |
  db $00, $21, $E6, $00, $30, $03, $80, $00 ; $09E75F |
  db $02, $20, $10, $01, $01, $DE, $1C, $00 ; $09E767 |
  db $00, $71, $E2, $00, $30, $03, $80, $30 ; $09E76F |
  db $03, $20, $70, $03, $00, $FE, $18, $00 ; $09E777 |
  db $00, $79, $D3, $00, $60, $23, $80, $78 ; $09E77F |
  db $C0, $F1, $C0, $02, $00, $FC, $70, $00 ; $09E787 |
  db $00, $F9, $E9, $81, $C0, $7F, $C0, $49 ; $09E78F |
  db $C0, $18, $C0, $06, $00, $7B, $E0, $00 ; $09E797 |
  db $00, $F8, $FC, $E2, $60, $3F, $E0, $4D ; $09E79F |
  db $FF, $9C, $27, $84, $00, $1F, $C0, $00 ; $09E7A7 |
  db $00, $B0, $2E, $3C, $90, $3F, $F0, $45 ; $09E7AF |
  db $7F, $F0, $3C, $8C, $00, $00, $00, $00 ; $09E7B7 |
  db $00, $80, $24, $21, $30, $3F, $F8, $45 ; $09E7BF |
  db $20, $50, $78, $F8, $00, $00, $00, $00 ; $09E7C7 |
  db $00, $80, $40, $99, $30, $3F, $FC, $43 ; $09E7CF |
  db $31, $A0, $00, $70, $00, $00, $00, $00 ; $09E7D7 |
  db $00, $F0, $81, $0E, $30, $3F, $FC, $43 ; $09E7DF |
  db $3E, $60, $00, $18, $00, $00, $00, $00 ; $09E7E7 |
  db $00, $7C, $82, $06, $70, $23, $F0, $63 ; $09E7EF |
  db $30, $41, $00, $08, $00, $00, $00, $00 ; $09E7F7 |
  db $00, $7C, $CC, $02, $60, $03, $C0, $27 ; $09E7FF |
  db $1F, $81, $C0, $08, $00, $00, $00, $00 ; $09E807 |
  db $00, $3C, $7C, $02, $60, $03, $80, $25 ; $09E80F |
  db $80, $03, $FE, $18, $00, $00, $00, $00 ; $09E817 |
  db $00, $1F, $C4, $01, $60, $03, $80, $2C ; $09E81F |
  db $80, $03, $03, $70, $00, $00, $00, $00 ; $09E827 |
  db $00, $00, $04, $00, $C0, $03, $00, $30 ; $09E82F |
  db $C0, $07, $00, $C0, $00, $00, $00, $00 ; $09E837 |
  db $00, $00, $06, $00, $40, $02, $00, $00 ; $09E83F |
  db $60, $06, $00, $00, $00, $00, $00, $00 ; $09E847 |
  db $00, $00, $02, $00, $80, $00, $00, $00 ; $09E84F |
  db $7C, $0C, $00, $00, $00, $00, $00, $00 ; $09E857 |
  db $00, $00, $01, $07, $00, $00, $00, $00 ; $09E85F |
  db $1F, $78, $00, $00, $00, $00, $00, $00 ; $09E867 |
  db $00, $00, $07, $FC, $00, $00, $00, $00 ; $09E86F |
  db $03, $C0, $00, $00, $00, $00, $00, $00 ; $09E877 |
  db $00, $00, $1C, $20, $00, $00, $00, $00 ; $09E87F |
  db $06, $3E, $00, $00, $00, $00, $00, $00 ; $09E887 |
  db $00, $00, $20, $10, $00, $00, $00, $00 ; $09E88F |
  db $0C, $01, $00, $00, $00, $00, $00, $00 ; $09E897 |
  db $00, $00, $3F, $F0, $00, $00, $00, $00 ; $09E89F |
  db $0F, $FF, $00, $00, $00, $00, $00, $00 ; $09E8A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8B7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8F7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E8FF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E907 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E90F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E917 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E91F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $09E927 |

  romb                                      ; $09E92F |
  from r14                                  ; $09E931 |
  add   r14                                 ; $09E932 |
  to r14                                    ; $09E933 |
  add   r10                                 ; $09E934 |
  to r10                                    ; $09E935 |
  getb                                      ; $09E936 |
  inc   r14                                 ; $09E937 |
  with r10                                  ; $09E938 |
  getbh                                     ; $09E939 |
  ibt   r0,#$0002                           ; $09E93B |
  color                                     ; $09E93D |
  iwt   r13,#$E988                          ; $09E93E |
  cache                                     ; $09E941 |
  iwt   r3,#$00FF                           ; $09E942 |
  from r10                                  ; $09E945 |
  to r14                                    ; $09E946 |
  add   r11                                 ; $09E947 |
  getb                                      ; $09E948 |
  sms   ($003E),r0                          ; $09E949 |
  cmp   r3                                  ; $09E94C |
  beq CODE_09E963                           ; $09E94E |
  dec   r3                                  ; $09E950 |
  cmp   r3                                  ; $09E951 |
  beq CODE_09E95F                           ; $09E953 |
  dec   r3                                  ; $09E955 |
  cmp   r3                                  ; $09E956 |
  bne CODE_09E96A                           ; $09E958 |
  nop                                       ; $09E95A |
  iwt   r15,#$E9AD                          ; $09E95B |
  nop                                       ; $09E95E |

CODE_09E95F:
  inc   r11                                 ; $09E95F |
  inc   r14                                 ; $09E960 |
  to r8                                     ; $09E961 |
  getb                                      ; $09E962 |

CODE_09E963:
  inc   r11                                 ; $09E963 |
  inc   r14                                 ; $09E964 |
  to r9                                     ; $09E965 |
  getb                                      ; $09E966 |
  inc   r11                                 ; $09E967 |
  inc   r14                                 ; $09E968 |
  getb                                      ; $09E969 |

CODE_09E96A:
  inc   r11                                 ; $09E96A |
  ibt   r6,#$000C                           ; $09E96B |
  lmult                                     ; $09E96D |
  ibt   r0,#$0009                           ; $09E96F |
  romb                                      ; $09E971 |
  iwt   r0,#$BD2F                           ; $09E973 |
  to r14                                    ; $09E976 |
  add   r4                                  ; $09E977 |
  ibt   r3,#$000C                           ; $09E978 |
  move  r2,r8                               ; $09E97A |

CODE_09E97C:
  ibt   r12,#$0008                          ; $09E97C |
  move  r1,r9                               ; $09E97E |
  ibt   r0,#$0000                           ; $09E980 |
  getbl                                     ; $09E982 |
  to r5                                     ; $09E984 |
  swap                                      ; $09E985 |
  beq CODE_09E994                           ; $09E986 |
  with r5                                   ; $09E988 |
  rol                                       ; $09E989 |
  bcc CODE_09E991                           ; $09E98A |
  nop                                       ; $09E98C |
  plot                                      ; $09E98D |
  bra CODE_09E992                           ; $09E98E |
  nop                                       ; $09E990 |

CODE_09E991:
  inc   r1                                  ; $09E991 |

CODE_09E992:
  loop                                      ; $09E992 |
  nop                                       ; $09E993 |

CODE_09E994:
  dec   r3                                  ; $09E994 |
  beq CODE_09E99C                           ; $09E995 |
  inc   r2                                  ; $09E997 |
  inc   r14                                 ; $09E998 |
  bra CODE_09E97C                           ; $09E999 |
  nop                                       ; $09E99B |

CODE_09E99C:
  rpix                                      ; $09E99C |
  ibt   r0,#$0009                           ; $09E99E |
  romb                                      ; $09E9A0 |
  iwt   r14,#$BC2F                          ; $09E9A2 |
  lms   r0,($003E)                          ; $09E9A5 |
  to r14                                    ; $09E9A8 |
  add   r14                                 ; $09E9A9 |
  getb                                      ; $09E9AA |
  to r9                                     ; $09E9AB |
  add   r9                                  ; $09E9AC |
  stop                                      ; $09E9AD |
  nop                                       ; $09E9AE |

  cache                                     ; $09E9AF |
  ibt   r0,#$0000                           ; $09E9B0 |
  cmode                                     ; $09E9B2 |
  sms   ($00B0),r0                          ; $09E9B4 |
  lms   r0,($00AA)                          ; $09E9B7 |
  romb                                      ; $09E9BA |
  lms   r14,($00A8)                         ; $09E9BC |
  to r11                                    ; $09E9BF |
  getb                                      ; $09E9C0 |
  inc   r14                                 ; $09E9C1 |
  sms   ($00A8),r14                         ; $09E9C2 |
  move  r0,r11                              ; $09E9C5 |
  sms   ($003E),r0                          ; $09E9C7 |
  iwt   r3,#$00FF                           ; $09E9CA |
  cmp   r3                                  ; $09E9CD |
  beq CODE_09EA06                           ; $09E9CF |
  dec   r3                                  ; $09E9D1 |
  cmp   r3                                  ; $09E9D2 |
  beq CODE_09E9F1                           ; $09E9D4 |
  dec   r3                                  ; $09E9D6 |
  cmp   r3                                  ; $09E9D7 |
  beq CODE_09E9F1                           ; $09E9D9 |
  dec   r3                                  ; $09E9DB |
  cmp   r3                                  ; $09E9DC |
  beq CODE_09E9F1                           ; $09E9DE |
  dec   r3                                  ; $09E9E0 |
  cmp   r3                                  ; $09E9E1 |
  beq CODE_09E9F1                           ; $09E9E3 |
  dec   r3                                  ; $09E9E5 |
  ibt   r3,#$FFFE                           ; $09E9E6 |
  lms   r0,($00B0)                          ; $09E9E8 |
  lob                                       ; $09E9EB |
  beq CODE_09E9F1                           ; $09E9EC |
  nop                                       ; $09E9EE |
  ibt   r3,#$FFF9                           ; $09E9EF |

CODE_09E9F1:
  inc   r3                                  ; $09E9F1 |
  ibt   r0,#$0009                           ; $09E9F2 |
  romb                                      ; $09E9F4 |
  from r3                                   ; $09E9F6 |
  sex                                       ; $09E9F7 |
  not                                       ; $09E9F8 |
  add   r0                                  ; $09E9F9 |
  iwt   r14,#$EA08                          ; $09E9FA |
  to r14                                    ; $09E9FD |
  add   r14                                 ; $09E9FE |
  getb                                      ; $09E9FF |
  inc   r14                                 ; $09EA00 |
  getbh                                     ; $09EA01 |
  move  r15,r0                              ; $09EA03 |
  nop                                       ; $09EA05 |

CODE_09EA06:
  stop                                      ; $09EA06 |
  nop                                       ; $09EA07 |

  dw $EA14                                  ; $09EA08 |
  dw $EA8D                                  ; $09EA0A |
  dw $EAB8                                  ; $09EA0C |
  dw $EACC                                  ; $09EA0E |
  dw $EAE0                                  ; $09EA10 |
  dw $EAE9                                  ; $09EA12 |

  ibt   r0,#$0009                           ; $09EA14 |
  romb                                      ; $09EA16 |
  ibt   r6,#$000C                           ; $09EA18 |
  from r11                                  ; $09EA1A |
  lmult                                     ; $09EA1B |
  iwt   r14,#$BD2F                          ; $09EA1D |
  from r14                                  ; $09EA20 |
  to r9                                     ; $09EA21 |
  add   r4                                  ; $09EA22 |
  lms   r5,($00AC)                          ; $09EA23 |
  move  r2,r5                               ; $09EA26 |
  ibt   r3,#$0007                           ; $09EA28 |
  ibt   r4,#$007F                           ; $09EA2A |
  iwt   r13,#$EA47                          ; $09EA2C |

CODE_09EA2F:
  move  r14,r9                              ; $09EA2F |
  ibt   r12,#$0008                          ; $09EA31 |
  lms   r1,($00AE)                          ; $09EA33 |
  getb                                      ; $09EA36 |
  to r10                                    ; $09EA37 |
  swap                                      ; $09EA38 |
  with r14                                  ; $09EA39 |
  add   #8                                  ; $09EA3A |
  getb                                      ; $09EA3C |
  to r11                                    ; $09EA3D |
  swap                                      ; $09EA3E |
  from r3                                   ; $09EA3F |
  and   #4                                  ; $09EA40 |
  bne CODE_09EA47                           ; $09EA42 |
  inc   r9                                  ; $09EA44 |
  ibt   r11,#$0000                          ; $09EA45 |

CODE_09EA47:
  ibt   r0,#$0000                           ; $09EA47 |
  with r11                                  ; $09EA49 |
  rol                                       ; $09EA4A |
  rol                                       ; $09EA4B |
  with r10                                  ; $09EA4C |
  rol                                       ; $09EA4D |
  rol                                       ; $09EA4E |
  color                                     ; $09EA4F |
  plot                                      ; $09EA50 |
  with r1                                   ; $09EA51 |
  and   r4                                  ; $09EA52 |
  bne CODE_09EA5A                           ; $09EA53 |
  nop                                       ; $09EA55 |
  ibt   r0,#$0020                           ; $09EA56 |
  to r2                                     ; $09EA58 |
  add   r2                                  ; $09EA59 |

CODE_09EA5A:
  loop                                      ; $09EA5A |
  nop                                       ; $09EA5B |
  inc   r5                                  ; $09EA5C |
  move  r2,r5                               ; $09EA5D |
  dec   r3                                  ; $09EA5F |
  bpl CODE_09EA2F                           ; $09EA60 |
  nop                                       ; $09EA62 |
  iwt   r14,#$BC2F                          ; $09EA63 |
  lms   r0,($003E)                          ; $09EA66 |
  to r14                                    ; $09EA69 |
  add   r14                                 ; $09EA6A |
  getb                                      ; $09EA6B |
  lms   r1,($00AE)                          ; $09EA6C |
  add   r1                                  ; $09EA6F |
  sms   ($00AE),r0                          ; $09EA70 |
  ibt   r1,#$007F                           ; $09EA73 |
  cmp   r1                                  ; $09EA75 |
  bcc CODE_09EA87                           ; $09EA77 |
  nop                                       ; $09EA79 |
  and   r1                                  ; $09EA7A |
  sms   ($00AE),r0                          ; $09EA7B |
  ibt   r0,#$0020                           ; $09EA7E |
  lms   r1,($00AC)                          ; $09EA80 |
  add   r1                                  ; $09EA83 |
  sms   ($00AC),r0                          ; $09EA84 |

CODE_09EA87:
  rpix                                      ; $09EA87 |
  iwt   r15,#$E9B7                          ; $09EA89 |
  nop                                       ; $09EA8C |

  lms   r0,($00AA)                          ; $09EA8D |
  romb                                      ; $09EA90 |
  lms   r14,($00A8)                         ; $09EA92 |
  getb                                      ; $09EA95 |
  swap                                      ; $09EA96 |
  inc   r14                                 ; $09EA97 |
  sms   ($00A8),r14                         ; $09EA98 |
  iwt   r2,#$0400                           ; $09EA9B |
  iwt   r1,#$4C00                           ; $09EA9E |
  to r1                                     ; $09EAA1 |
  add   r1                                  ; $09EAA2 |
  with r2                                   ; $09EAA3 |
  add   r1                                  ; $09EAA4 |
  iwt   r12,#$0080                          ; $09EAA5 |
  iwt   r13,#$EAAD                          ; $09EAA8 |
  ibt   r0,#$0000                           ; $09EAAB |
  stw   (r1)                                ; $09EAAD |
  inc   r1                                  ; $09EAAE |
  inc   r1                                  ; $09EAAF |
  stw   (r2)                                ; $09EAB0 |
  inc   r2                                  ; $09EAB1 |
  loop                                      ; $09EAB2 |
  inc   r2                                  ; $09EAB3 |
  iwt   r15,#$E9B7                          ; $09EAB4 |
  nop                                       ; $09EAB7 |

  lms   r0,($00AA)                          ; $09EAB8 |
  romb                                      ; $09EABB |
  lms   r14,($00A8)                         ; $09EABD |
  getb                                      ; $09EAC0 |
  inc   r14                                 ; $09EAC1 |
  sms   ($00A8),r14                         ; $09EAC2 |
  sms   ($00AC),r0                          ; $09EAC5 |
  iwt   r15,#$E9B7                          ; $09EAC8 |
  nop                                       ; $09EACB |

  lms   r0,($00AA)                          ; $09EACC |
  romb                                      ; $09EACF |
  lms   r14,($00A8)                         ; $09EAD1 |
  getb                                      ; $09EAD4 |
  inc   r14                                 ; $09EAD5 |
  sms   ($00A8),r14                         ; $09EAD6 |
  sms   ($00AE),r0                          ; $09EAD9 |
  iwt   r15,#$E9B7                          ; $09EADC |
  nop                                       ; $09EADF |

  ibt   r0,#$0001                           ; $09EAE0 |
  sms   ($00B0),r0                          ; $09EAE2 |
  iwt   r15,#$E9B7                          ; $09EAE5 |
  nop                                       ; $09EAE8 |

  ibt   r0,#$0009                           ; $09EAE9 |
  romb                                      ; $09EAEB |
  ibt   r6,#$000C                           ; $09EAED |
  from r11                                  ; $09EAEF |
  lmult                                     ; $09EAF0 |
  iwt   r14,#$BD2F                          ; $09EAF2 |
  from r14                                  ; $09EAF5 |
  to r9                                     ; $09EAF6 |
  add   r4                                  ; $09EAF7 |
  lms   r5,($00AC)                          ; $09EAF8 |
  ibt   r3,#$0008                           ; $09EAFB |
  ibt   r4,#$007F                           ; $09EAFD |
  iwt   r13,#$EB14                          ; $09EAFF |

CODE_09EB02:
  ibt   r12,#$0008                          ; $09EB02 |
  lms   r1,($00AE)                          ; $09EB04 |
  move  r14,r9                              ; $09EB07 |
  move  r2,r5                               ; $09EB09 |
  getb                                      ; $09EB0B |
  to r10                                    ; $09EB0C |
  swap                                      ; $09EB0D |
  with r14                                  ; $09EB0E |
  add   #4                                  ; $09EB0F |
  getb                                      ; $09EB11 |
  to r11                                    ; $09EB12 |
  swap                                      ; $09EB13 |
  ibt   r0,#$0000                           ; $09EB14 |
  with r11                                  ; $09EB16 |
  rol                                       ; $09EB17 |
  rol                                       ; $09EB18 |
  with r10                                  ; $09EB19 |
  rol                                       ; $09EB1A |
  rol                                       ; $09EB1B |
  color                                     ; $09EB1C |
  plot                                      ; $09EB1D |
  plot                                      ; $09EB1E |
  with r1                                   ; $09EB1F |
  and   r4                                  ; $09EB20 |
  bne CODE_09EB28                           ; $09EB21 |
  nop                                       ; $09EB23 |
  ibt   r0,#$0020                           ; $09EB24 |
  to r2                                     ; $09EB26 |
  add   r2                                  ; $09EB27 |

CODE_09EB28:
  loop                                      ; $09EB28 |
  nop                                       ; $09EB29 |
  dec   r3                                  ; $09EB2A |
  beq CODE_09EB36                           ; $09EB2B |
  from r3                                   ; $09EB2D |
  and   #1                                  ; $09EB2E |
  bne CODE_09EB02                           ; $09EB30 |
  inc   r5                                  ; $09EB32 |
  bra CODE_09EB02                           ; $09EB33 |

  inc   r9                                  ; $09EB35 |

CODE_09EB36:
  ibt   r0,#$0001                           ; $09EB36 |
  color                                     ; $09EB38 |
  inc   r5                                  ; $09EB39 |
  inc   r9                                  ; $09EB3A |
  inc   r9                                  ; $09EB3B |
  inc   r9                                  ; $09EB3C |
  inc   r9                                  ; $09EB3D |
  inc   r9                                  ; $09EB3E |
  ibt   r3,#$0008                           ; $09EB3F |
  iwt   r13,#$EB50                          ; $09EB41 |

CODE_09EB44:
  ibt   r12,#$0008                          ; $09EB44 |
  lms   r1,($00AE)                          ; $09EB46 |
  move  r14,r9                              ; $09EB49 |
  move  r2,r5                               ; $09EB4B |
  getb                                      ; $09EB4D |
  to r10                                    ; $09EB4E |
  swap                                      ; $09EB4F |
  with r10                                  ; $09EB50 |
  rol                                       ; $09EB51 |
  bcc CODE_09EB59                           ; $09EB52 |
  nop                                       ; $09EB54 |
  plot                                      ; $09EB55 |
  plot                                      ; $09EB56 |
  dec   r1                                  ; $09EB57 |
  dec   r1                                  ; $09EB58 |

CODE_09EB59:
  inc   r1                                  ; $09EB59 |
  inc   r1                                  ; $09EB5A |
  with r1                                   ; $09EB5B |
  and   r4                                  ; $09EB5C |
  bne CODE_09EB64                           ; $09EB5D |
  nop                                       ; $09EB5F |
  ibt   r0,#$0020                           ; $09EB60 |
  to r2                                     ; $09EB62 |
  add   r2                                  ; $09EB63 |

CODE_09EB64:
  loop                                      ; $09EB64 |
  nop                                       ; $09EB65 |
  dec   r3                                  ; $09EB66 |
  beq CODE_09EB72                           ; $09EB67 |
  from r3                                   ; $09EB69 |
  and   #1                                  ; $09EB6A |
  bne CODE_09EB44                           ; $09EB6C |
  inc   r5                                  ; $09EB6E |
  bra CODE_09EB44                           ; $09EB6F |

  inc   r9                                  ; $09EB71 |

CODE_09EB72:
  iwt   r14,#$BC2F                          ; $09EB72 |
  lms   r0,($003E)                          ; $09EB75 |
  to r14                                    ; $09EB78 |
  add   r14                                 ; $09EB79 |
  to r1                                     ; $09EB7A |
  getb                                      ; $09EB7B |
  lms   r0,($00AE)                          ; $09EB7C |
  add   r1                                  ; $09EB7F |
  add   r1                                  ; $09EB80 |
  sms   ($00AE),r0                          ; $09EB81 |
  ibt   r1,#$007F                           ; $09EB84 |
  cmp   r1                                  ; $09EB86 |
  bcc CODE_09EB98                           ; $09EB88 |
  nop                                       ; $09EB8A |
  and   r1                                  ; $09EB8B |
  sms   ($00AE),r0                          ; $09EB8C |
  ibt   r0,#$0020                           ; $09EB8F |
  lms   r1,($00AC)                          ; $09EB91 |
  add   r1                                  ; $09EB94 |
  sms   ($00AC),r0                          ; $09EB95 |

CODE_09EB98:
  rpix                                      ; $09EB98 |
  iwt   r15,#$E9B7                          ; $09EB9A |
  nop                                       ; $09EB9D |
  cache                                     ; $09EB9E |
  ibt   r0,#$0011                           ; $09EB9F |
  cmode                                     ; $09EBA1 |
  lms   r0,($0028)                          ; $09EBA3 |
  color                                     ; $09EBA6 |
  ibt   r1,#$0000                           ; $09EBA7 |
  ibt   r2,#$0000                           ; $09EBA9 |
  ibt   r3,#$007F                           ; $09EBAB |
  ibt   r12,#$0010                          ; $09EBAD |
  iwt   r13,#$EBB2                          ; $09EBAF |

CODE_09EBB2:
  plot                                      ; $09EBB2 |
  with r1                                   ; $09EBB3 |
  and   r3                                  ; $09EBB4 |
  bne CODE_09EBB2                           ; $09EBB5 |
  nop                                       ; $09EBB7 |
  loop                                      ; $09EBB8 |
  inc   r2                                  ; $09EBB9 |
  lms   r0,($002A)                          ; $09EBBA |
  color                                     ; $09EBBD |
  ibt   r1,#$0000                           ; $09EBBE |
  ibt   r2,#$0000                           ; $09EBC0 |
  plot                                      ; $09EBC2 |
  ibt   r1,#$0000                           ; $09EBC3 |
  ibt   r2,#$000F                           ; $09EBC5 |
  plot                                      ; $09EBC7 |
  ibt   r1,#$0067                           ; $09EBC8 |
  ibt   r2,#$0000                           ; $09EBCA |
  plot                                      ; $09EBCC |
  ibt   r1,#$0067                           ; $09EBCD |
  ibt   r2,#$000F                           ; $09EBCF |
  plot                                      ; $09EBD1 |
  lms   r0,($002C)                          ; $09EBD2 |
  color                                     ; $09EBD5 |
  iwt   r13,#$EC24                          ; $09EBD6 |

CODE_09EBD9:
  iwt   r1,#$00FF                           ; $09EBD9 |
  lms   r0,($0022)                          ; $09EBDC |
  romb                                      ; $09EBDF |
  lms   r14,($0020)                         ; $09EBE1 |
  getb                                      ; $09EBE4 |
  inc   r14                                 ; $09EBE5 |
  sms   ($0020),r14                         ; $09EBE6 |
  cmp   r1                                  ; $09EBE9 |
  bne CODE_09EC09                           ; $09EBEB |
  nop                                       ; $09EBED |
  getb                                      ; $09EBEE |
  inc   r14                                 ; $09EBEF |
  sms   ($0020),r14                         ; $09EBF0 |
  cmp   r1                                  ; $09EBF3 |
  bne CODE_09EBFA                           ; $09EBF5 |
  nop                                       ; $09EBF7 |
  stop                                      ; $09EBF8 |
  nop                                       ; $09EBF9 |

CODE_09EBFA:
  sex                                       ; $09EBFA |
  bmi CODE_09EC41                           ; $09EBFB |
  to r10                                    ; $09EBFD |
  lob                                       ; $09EBFE |
  getb                                      ; $09EBFF |
  to r11                                    ; $09EC00 |
  lob                                       ; $09EC01 |
  inc   r14                                 ; $09EC02 |
  sms   ($0020),r14                         ; $09EC03 |
  bra CODE_09EBD9                           ; $09EC06 |
  nop                                       ; $09EC08 |

CODE_09EC09:
  sms   ($003E),r0                          ; $09EC09 |
  ibt   r6,#$000C                           ; $09EC0C |
  lmult                                     ; $09EC0E |
  ibt   r0,#$0009                           ; $09EC10 |
  romb                                      ; $09EC12 |
  iwt   r0,#$BD2F                           ; $09EC14 |
  to r14                                    ; $09EC17 |
  add   r4                                  ; $09EC18 |
  move  r2,r11                              ; $09EC19 |

CODE_09EC1B:
  ibt   r12,#$0008                          ; $09EC1B |
  getb                                      ; $09EC1D |
  lob                                       ; $09EC1E |
  to r3                                     ; $09EC1F |
  swap                                      ; $09EC20 |
  inc   r14                                 ; $09EC21 |
  move  r1,r10                              ; $09EC22 |
  with r3                                   ; $09EC24 |
  rol                                       ; $09EC25 |
  bcc CODE_09EC2B                           ; $09EC26 |
  nop                                       ; $09EC28 |
  plot                                      ; $09EC29 |
  dec   r1                                  ; $09EC2A |

CODE_09EC2B:
  loop                                      ; $09EC2B |
  inc   r1                                  ; $09EC2C |
  dec   r6                                  ; $09EC2D |
  bne CODE_09EC1B                           ; $09EC2E |
  inc   r2                                  ; $09EC30 |
  rpix                                      ; $09EC31 |
  iwt   r14,#$BC2F                          ; $09EC33 |
  lms   r0,($003E)                          ; $09EC36 |
  to r14                                    ; $09EC39 |
  add   r14                                 ; $09EC3A |
  getb                                      ; $09EC3B |
  to r10                                    ; $09EC3C |
  add   r10                                 ; $09EC3D |
  bra CODE_09EBD9                           ; $09EC3E |
  nop                                       ; $09EC40 |

CODE_09EC41:
  cache                                     ; $09EC41 |
  ibt   r0,#$0011                           ; $09EC42 |
  cmode                                     ; $09EC44 |
  lms   r0,($0024)                          ; $09EC46 |
  color                                     ; $09EC49 |
  ibt   r1,#$0000                           ; $09EC4A |
  ibt   r2,#$0010                           ; $09EC4C |
  ibt   r3,#$007F                           ; $09EC4E |
  ibt   r12,#$0030                          ; $09EC50 |
  iwt   r13,#$EC55                          ; $09EC52 |

CODE_09EC55:
  plot                                      ; $09EC55 |
  with r1                                   ; $09EC56 |
  and   r3                                  ; $09EC57 |
  bne CODE_09EC55                           ; $09EC58 |
  nop                                       ; $09EC5A |
  loop                                      ; $09EC5B |
  inc   r2                                  ; $09EC5C |
  lms   r0,($0026)                          ; $09EC5D |
  color                                     ; $09EC60 |
  iwt   r13,#$ECAD                          ; $09EC61 |

CODE_09EC64:
  iwt   r1,#$00FF                           ; $09EC64 |
  lms   r0,($0022)                          ; $09EC67 |
  romb                                      ; $09EC6A |
  lms   r14,($0020)                         ; $09EC6C |
  getb                                      ; $09EC6F |
  inc   r14                                 ; $09EC70 |
  sms   ($0020),r14                         ; $09EC71 |
  cmp   r1                                  ; $09EC74 |
  bne CODE_09EC8E                           ; $09EC76 |
  nop                                       ; $09EC78 |
  getb                                      ; $09EC79 |
  inc   r14                                 ; $09EC7A |
  sms   ($0020),r14                         ; $09EC7B |
  cmp   r1                                  ; $09EC7E |
  beq CODE_09ECD6                           ; $09EC80 |
  to r10                                    ; $09EC82 |
  lob                                       ; $09EC83 |
  getb                                      ; $09EC84 |
  to r11                                    ; $09EC85 |
  lob                                       ; $09EC86 |
  inc   r14                                 ; $09EC87 |
  sms   ($0020),r14                         ; $09EC88 |
  bra CODE_09EC64                           ; $09EC8B |
  nop                                       ; $09EC8D |

CODE_09EC8E:
  sms   ($003E),r0                          ; $09EC8E |
  ibt   r6,#$000C                           ; $09EC91 |
  lmult                                     ; $09EC93 |
  ibt   r0,#$0009                           ; $09EC95 |
  romb                                      ; $09EC97 |
  iwt   r0,#$BD2F                           ; $09EC99 |
  to r14                                    ; $09EC9C |
  add   r4                                  ; $09EC9D |
  move  r2,r11                              ; $09EC9E |
  move  r5,r2                               ; $09ECA0 |

CODE_09ECA2:
  move  r2,r5                               ; $09ECA2 |
  ibt   r12,#$0008                          ; $09ECA4 |
  getb                                      ; $09ECA6 |
  lob                                       ; $09ECA7 |
  to r3                                     ; $09ECA8 |
  swap                                      ; $09ECA9 |
  inc   r14                                 ; $09ECAA |
  move  r1,r10                              ; $09ECAB |
  with r3                                   ; $09ECAD |
  rol                                       ; $09ECAE |
  bcc CODE_09ECB4                           ; $09ECAF |
  nop                                       ; $09ECB1 |
  plot                                      ; $09ECB2 |
  dec   r1                                  ; $09ECB3 |

CODE_09ECB4:
  inc   r1                                  ; $09ECB4 |
  ibt   r0,#$007F                           ; $09ECB5 |
  and   r1                                  ; $09ECB7 |
  bne CODE_09ECBF                           ; $09ECB8 |
  nop                                       ; $09ECBA |
  ibt   r0,#$0010                           ; $09ECBB |
  to r2                                     ; $09ECBD |
  add   r2                                  ; $09ECBE |

CODE_09ECBF:
  loop                                      ; $09ECBF |
  nop                                       ; $09ECC0 |
  inc   r5                                  ; $09ECC1 |
  dec   r6                                  ; $09ECC2 |
  bne CODE_09ECA2                           ; $09ECC3 |
  nop                                       ; $09ECC5 |
  rpix                                      ; $09ECC6 |
  iwt   r14,#$BC2F                          ; $09ECC8 |
  lms   r0,($003E)                          ; $09ECCB |
  to r14                                    ; $09ECCE |
  add   r14                                 ; $09ECCF |
  getb                                      ; $09ECD0 |
  to r10                                    ; $09ECD1 |
  add   r10                                 ; $09ECD2 |
  bra CODE_09EC64                           ; $09ECD3 |
  nop                                       ; $09ECD5 |

CODE_09ECD6:
  stop                                      ; $09ECD6 |
  nop                                       ; $09ECD7 |

  cache                                     ; $09ECD8 |
  ibt   r0,#$0011                           ; $09ECD9 |
  cmode                                     ; $09ECDB |
  ibt   r0,#$0009                           ; $09ECDD |
  romb                                      ; $09ECDF |
  iwt   r14,#$BD2F                          ; $09ECE1 |
  ibt   r0,#$0001                           ; $09ECE4 |
  color                                     ; $09ECE6 |
  getb                                      ; $09ECE7 |
  swap                                      ; $09ECE8 |
  inc   r14                                 ; $09ECE9 |
  ibt   r3,#$0000                           ; $09ECEA |
  ibt   r4,#$0004                           ; $09ECEC |
  iwt   r11,#$0008                          ; $09ECEE |
  iwt   r13,#$ECF6                          ; $09ECF1 |

CODE_09ECF4:
  ibt   r12,#$0008                          ; $09ECF4 |
  ibt   r10,#$000C                          ; $09ECF6 |
  move  r2,r4                               ; $09ECF8 |

CODE_09ECFA:
  move  r1,r3                               ; $09ECFA |

CODE_09ECFC:
  add   r0                                  ; $09ECFC |
  bcc CODE_09ED02                           ; $09ECFD |
  inc   r1                                  ; $09ECFF |
  dec   r1                                  ; $09ED00 |
  plot                                      ; $09ED01 |

CODE_09ED02:
  moves r0,r0                               ; $09ED02 |
  bne CODE_09ECFC                           ; $09ED04 |
  nop                                       ; $09ED06 |
  getb                                      ; $09ED07 |
  swap                                      ; $09ED08 |
  inc   r14                                 ; $09ED09 |
  inc   r2                                  ; $09ED0A |
  dec   r10                                 ; $09ED0B |
  bne CODE_09ECFA+1                         ; $09ED0C |
  with r3                                   ; $09ED0E |
  add   #8                                  ; $09ED0F |
  loop                                      ; $09ED11 |
  with r4                                   ; $09ED12 |
  add   #15                                 ; $09ED13 |
  inc   r4                                  ; $09ED15 |
  ibt   r3,#$0000                           ; $09ED16 |
  dec   r11                                 ; $09ED18 |
  bne CODE_09ECF4                           ; $09ED19 |
  nop                                       ; $09ED1B |
  ibt   r3,#$0040                           ; $09ED1C |
  ibt   r4,#$0004                           ; $09ED1E |
  iwt   r11,#$0008                          ; $09ED20 |
  iwt   r13,#$ED28                          ; $09ED23 |

CODE_09ED26:
  ibt   r12,#$0008                          ; $09ED26 |
  ibt   r10,#$000C                          ; $09ED28 |
  move  r2,r4                               ; $09ED2A |

CODE_09ED2C:
  move  r1,r3                               ; $09ED2C |

CODE_09ED2E:
  add   r0                                  ; $09ED2E |
  bcc CODE_09ED34                           ; $09ED2F |
  inc   r1                                  ; $09ED31 |
  dec   r1                                  ; $09ED32 |
  plot                                      ; $09ED33 |

CODE_09ED34:
  moves r0,r0                               ; $09ED34 |
  bne CODE_09ED2E                           ; $09ED36 |
  nop                                       ; $09ED38 |
  getb                                      ; $09ED39 |
  swap                                      ; $09ED3A |
  inc   r14                                 ; $09ED3B |
  inc   r2                                  ; $09ED3C |
  dec   r10                                 ; $09ED3D |
  bne CODE_09ED2C+1                         ; $09ED3E |
  with r3                                   ; $09ED40 |
  add   #8                                  ; $09ED41 |
  loop                                      ; $09ED43 |
  with r4                                   ; $09ED44 |
  add   #15                                 ; $09ED45 |
  inc   r4                                  ; $09ED47 |
  ibt   r3,#$0040                           ; $09ED48 |
  dec   r11                                 ; $09ED4A |
  bne CODE_09ED26                           ; $09ED4B |
  nop                                       ; $09ED4D |
  iwt   r3,#$0080                           ; $09ED4E |
  ibt   r4,#$0004                           ; $09ED51 |
  iwt   r11,#$0008                          ; $09ED53 |
  iwt   r13,#$ED5B                          ; $09ED56 |

CODE_09ED59:
  ibt   r12,#$0008                          ; $09ED59 |
  ibt   r10,#$000C                          ; $09ED5B |
  move  r2,r4                               ; $09ED5D |

CODE_09ED5F:
  move  r1,r3                               ; $09ED5F |

CODE_09ED61:
  add   r0                                  ; $09ED61 |
  bcc CODE_09ED67                           ; $09ED62 |
  inc   r1                                  ; $09ED64 |
  dec   r1                                  ; $09ED65 |
  plot                                      ; $09ED66 |

CODE_09ED67:
  moves r0,r0                               ; $09ED67 |
  bne CODE_09ED61                           ; $09ED69 |
  nop                                       ; $09ED6B |
  getb                                      ; $09ED6C |
  swap                                      ; $09ED6D |
  inc   r14                                 ; $09ED6E |
  inc   r2                                  ; $09ED6F |
  dec   r10                                 ; $09ED70 |
  bne CODE_09ED5F+1                         ; $09ED71 |
  with r3                                   ; $09ED73 |
  add   #8                                  ; $09ED74 |
  loop                                      ; $09ED76 |
  with r4                                   ; $09ED77 |
  add   #15                                 ; $09ED78 |
  inc   r4                                  ; $09ED7A |
  iwt   r3,#$0080                           ; $09ED7B |
  dec   r11                                 ; $09ED7E |
  bne CODE_09ED59                           ; $09ED7F |
  nop                                       ; $09ED81 |
  iwt   r3,#$00C0                           ; $09ED82 |
  ibt   r4,#$0004                           ; $09ED85 |
  iwt   r11,#$0008                          ; $09ED87 |
  iwt   r13,#$ED8F                          ; $09ED8A |

CODE_09ED8D:
  ibt   r12,#$0008                          ; $09ED8D |
  ibt   r10,#$000C                          ; $09ED8F |
  move  r2,r4                               ; $09ED91 |

CODE_09ED93:
  move  r1,r3                               ; $09ED93 |

CODE_09ED95:
  add   r0                                  ; $09ED95 |
  bcc CODE_09ED9B                           ; $09ED96 |
  inc   r1                                  ; $09ED98 |
  dec   r1                                  ; $09ED99 |
  plot                                      ; $09ED9A |

CODE_09ED9B:
  moves r0,r0                               ; $09ED9B |
  bne CODE_09ED95                           ; $09ED9D |
  nop                                       ; $09ED9F |
  getb                                      ; $09EDA0 |
  swap                                      ; $09EDA1 |
  inc   r14                                 ; $09EDA2 |
  inc   r2                                  ; $09EDA3 |
  dec   r10                                 ; $09EDA4 |
  bne CODE_09ED93+1                         ; $09EDA5 |
  with r3                                   ; $09EDA7 |
  add   #8                                  ; $09EDA8 |
  loop                                      ; $09EDAA |
  with r4                                   ; $09EDAB |
  add   #15                                 ; $09EDAC |
  inc   r4                                  ; $09EDAE |
  iwt   r3,#$00C0                           ; $09EDAF |
  dec   r11                                 ; $09EDB2 |
  bne CODE_09ED8D                           ; $09EDB3 |
  nop                                       ; $09EDB5 |
  rpix                                      ; $09EDB6 |
  iwt   r10,#$1C01                          ; $09EDB8 |
  iwt   r11,#$3C00                          ; $09EDBB |
  iwt   r12,#$2000                          ; $09EDBE |
  move  r13,r15                             ; $09EDC1 |
  ldb   (r11)                               ; $09EDC3 |
  stb   (r10)                               ; $09EDC5 |
  inc   r11                                 ; $09EDC7 |
  inc   r11                                 ; $09EDC8 |
  inc   r10                                 ; $09EDC9 |
  loop                                      ; $09EDCA |
  inc   r10                                 ; $09EDCB |
  stop                                      ; $09EDCC |
  nop                                       ; $09EDCD |

; freespace
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDCE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDD6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDDE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDE6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDEE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDF6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EDFE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE06 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE0E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE16 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE1E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE26 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE2E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE36 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE3E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE46 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE4E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE56 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE5E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE66 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE6E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE76 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE7E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE86 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE8E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE96 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EE9E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEA6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEAE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEB6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEBE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEC6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EECE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EED6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEDE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEE6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEEE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEF6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EEFE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF06 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF0E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF16 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF1E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF26 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF2E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF36 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF3E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF46 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF4E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF56 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF5E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF66 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF6E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF76 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF7E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF86 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF8E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF96 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EF9E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFA6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFAE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFB6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFBE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFC6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFCE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFD6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFDE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFE6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFEE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFF6 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09EFFE |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F006 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F00E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F016 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F01E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F026 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F02E |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F036 |

  sub   r0                                  ; $09F03E |
  cmode                                     ; $09F03F |
  sms   ($0002),r1                          ; $09F041 |
  sms   ($0004),r2                          ; $09F044 |
  sms   ($0006),r3                          ; $09F047 |
  cache                                     ; $09F04A |
  ldw   (r5)                                ; $09F04B |

CODE_09F04C:
  inc   r0                                  ; $09F04C |
  bne CODE_09F054                           ; $09F04D |
  dec   r0                                  ; $09F04F |
  rpix                                      ; $09F050 |
  stop                                      ; $09F052 |
  nop                                       ; $09F053 |

CODE_09F054:
  sub   r1                                  ; $09F054 |
  bmi CODE_09F05F                           ; $09F055 |
  inc   r5                                  ; $09F057 |
  iwt   r6,#$01C0                           ; $09F058 |
  sub   r6                                  ; $09F05B |
  bcc CODE_09F065                           ; $09F05C |
  add   r6                                  ; $09F05E |

CODE_09F05F:
  with r5                                   ; $09F05F |
  add   #5                                  ; $09F060 |
  bra CODE_09F04C                           ; $09F062 |

  ldw   (r5)                                ; $09F064 |

CODE_09F065:
  move  r7,r0                               ; $09F065 |
  iwt   r6,#$0040                           ; $09F067 |
  add   r6                                  ; $09F06A |
  add   r0                                  ; $09F06B |
  iwt   r6,#$1200                           ; $09F06C |
  add   r6                                  ; $09F06F |
  to r6                                     ; $09F070 |
  ldw   (r0)                                ; $09F071 |
  inc   r5                                  ; $09F072 |
  ldb   (r5)                                ; $09F073 |
  sex                                       ; $09F075 |
  sub   r3                                  ; $09F076 |
  lmult                                     ; $09F077 |
  with r4                                   ; $09F079 |
  hib                                       ; $09F07A |
  lob                                       ; $09F07B |
  swap                                      ; $09F07C |
  or    r4                                  ; $09F07D |
  ibt   r4,#$0060                           ; $09F07E |
  to r3                                     ; $09F080 |
  add   r4                                  ; $09F081 |
  inc   r5                                  ; $09F082 |
  ldb   (r5)                                ; $09F083 |
  sex                                       ; $09F085 |
  sub   r2                                  ; $09F086 |
  lmult                                     ; $09F087 |
  with r4                                   ; $09F089 |
  hib                                       ; $09F08A |
  lob                                       ; $09F08B |
  swap                                      ; $09F08C |
  or    r4                                  ; $09F08D |
  ibt   r4,#$0020                           ; $09F08E |
  to r2                                     ; $09F090 |
  add   r4                                  ; $09F091 |
  inc   r5                                  ; $09F092 |
  ldb   (r5)                                ; $09F093 |
  add   r0                                  ; $09F095 |
  add   r0                                  ; $09F096 |
  lmult                                     ; $09F097 |
  with r4                                   ; $09F099 |
  hib                                       ; $09F09A |
  lob                                       ; $09F09B |
  swap                                      ; $09F09C |
  to r6                                     ; $09F09D |
  or    r4                                  ; $09F09E |
  ibt   r0,#$0009                           ; $09F09F |
  romb                                      ; $09F0A1 |
  inc   r5                                  ; $09F0A3 |
  ldb   (r5)                                ; $09F0A4 |
  sms   ($004A),r5                          ; $09F0A6 |
  iwt   r4,#$00C0                           ; $09F0A9 |
  to r5                                     ; $09F0AC |
  and   r4                                  ; $09F0AD |
  bic   r4                                  ; $09F0AE |
  mult  #7                                  ; $09F0B0 |
  iwt   r14,#$F43E                          ; $09F0B2 |
  to r14                                    ; $09F0B5 |
  add   r14                                 ; $09F0B6 |
  from r7                                   ; $09F0B7 |
  lsr                                       ; $09F0B8 |
  lsr                                       ; $09F0B9 |
  lsr                                       ; $09F0BA |
  ibt   r4,#$0030                           ; $09F0BB |
  and   r4                                  ; $09F0BD |
  to r5                                     ; $09F0BE |
  or    r5                                  ; $09F0BF |
  getb                                      ; $09F0C0 |
  inc   r14                                 ; $09F0C1 |
  swap                                      ; $09F0C2 |
  fmult                                     ; $09F0C3 |
  adc   r3                                  ; $09F0C4 |
  move  r3,r0                               ; $09F0C6 |
  iwt   r1,#$00C0                           ; $09F0C8 |
  sub   r1                                  ; $09F0CB |
  bpl CODE_09F0ED                           ; $09F0CC |
  getb                                      ; $09F0CE |
  inc   r14                                 ; $09F0CF |
  swap                                      ; $09F0D0 |
  fmult                                     ; $09F0D1 |
  adc   r2                                  ; $09F0D2 |
  move  r2,r0                               ; $09F0D4 |
  iwt   r8,#$0080                           ; $09F0D6 |
  sub   r8                                  ; $09F0D9 |
  bpl CODE_09F0ED                           ; $09F0DA |
  getb                                      ; $09F0DC |
  inc   r14                                 ; $09F0DD |
  swap                                      ; $09F0DE |
  fmult                                     ; $09F0DF |
  to r9                                     ; $09F0E0 |
  add   r3                                  ; $09F0E1 |
  bmi CODE_09F0ED                           ; $09F0E2 |
  getb                                      ; $09F0E4 |
  inc   r14                                 ; $09F0E5 |
  swap                                      ; $09F0E6 |
  fmult                                     ; $09F0E7 |
  to r10                                    ; $09F0E8 |
  add   r2                                  ; $09F0E9 |
  bpl CODE_09F0F3                           ; $09F0EA |
  getb                                      ; $09F0EC |

CODE_09F0ED:
  iwt   r15,#$F180                          ; $09F0ED |
  lms   r1,($0002)                          ; $09F0F0 |

CODE_09F0F3:
  inc   r14                                 ; $09F0F3 |
  to r11                                    ; $09F0F4 |
  getbh                                     ; $09F0F5 |
  inc   r14                                 ; $09F0F7 |
  ibt   r7,#$0001                           ; $09F0F8 |
  sub   r0                                  ; $09F0FA |
  move  r4,r0                               ; $09F0FB |
  ibt   r12,#$0020                          ; $09F0FD |
  iwt   r13,#$F103                          ; $09F0FF |
  with r4                                   ; $09F102 |
  add   r4                                  ; $09F103 |
  with r7                                   ; $09F104 |
  add   r7                                  ; $09F105 |
  rol                                       ; $09F106 |
  sub   r6                                  ; $09F107 |
  bcc CODE_09F10D                           ; $09F108 |
  add   r6                                  ; $09F10A |
  sub   r6                                  ; $09F10B |
  inc   r4                                  ; $09F10C |

CODE_09F10D:
  loop                                      ; $09F10D |
  with r4                                   ; $09F10E |
  move  r6,r4                               ; $09F10F |
  getb                                      ; $09F111 |
  ibt   r4,#$007F                           ; $09F112 |
  and   r4                                  ; $09F114 |
  romb                                      ; $09F115 |
  getbs                                     ; $09F117 |
  iwt   r4,#$8000                           ; $09F119 |
  and   r4                                  ; $09F11C |
  to r5                                     ; $09F11D |
  or    r5                                  ; $09F11E |
  ibt   r7,#$0000                           ; $09F11F |
  moves r0,r2                               ; $09F121 |
  bpl CODE_09F12D                           ; $09F123 |
  not                                       ; $09F125 |
  inc   r0                                  ; $09F126 |
  lmult                                     ; $09F127 |
  move  r7,r4                               ; $09F129 |
  ibt   r2,#$0000                           ; $09F12B |

CODE_09F12D:
  ibt   r4,#$0000                           ; $09F12D |
  moves r0,r3                               ; $09F12F |
  bpl CODE_09F139                           ; $09F131 |
  not                                       ; $09F133 |
  inc   r0                                  ; $09F134 |
  lmult                                     ; $09F135 |
  ibt   r3,#$0000                           ; $09F137 |

CODE_09F139:
  dec   r1                                  ; $09F139 |
  from r1                                   ; $09F13A |
  sub   r9                                  ; $09F13B |
  bcc CODE_09F140                           ; $09F13C |
  add   r9                                  ; $09F13E |
  from r9                                   ; $09F13F |

CODE_09F140:
  to r9                                     ; $09F140 |
  sub   r3                                  ; $09F141 |
  inc   r9                                  ; $09F142 |
  dec   r8                                  ; $09F143 |
  from r8                                   ; $09F144 |
  sub   r10                                 ; $09F145 |
  bcc CODE_09F14A                           ; $09F146 |
  add   r10                                 ; $09F148 |
  from r10                                  ; $09F149 |

CODE_09F14A:
  to r10                                    ; $09F14A |
  sub   r2                                  ; $09F14B |
  inc   r10                                 ; $09F14C |
  iwt   r13,#$F156                          ; $09F14D |

CODE_09F150:
  move  r1,r3                               ; $09F150 |
  move  r8,r4                               ; $09F152 |
  move  r12,r9                              ; $09F154 |
  merge                                     ; $09F156 |
  to r14                                    ; $09F157 |
  add   r11                                 ; $09F158 |
  with r8                                   ; $09F159 |
  add   r6                                  ; $09F15A |
  moves r5,r5                               ; $09F15B |
  bpl CODE_09F164                           ; $09F15D |
  getb                                      ; $09F15F |
  lsr                                       ; $09F160 |
  lsr                                       ; $09F161 |
  lsr                                       ; $09F162 |
  lsr                                       ; $09F163 |

CODE_09F164:
  and   #15                                 ; $09F164 |
  beq CODE_09F177                           ; $09F166 |
  add   r5                                  ; $09F168 |
  color                                     ; $09F169 |
  loop                                      ; $09F16A |
  plot                                      ; $09F16B |
  with r7                                   ; $09F16C |
  add   r6                                  ; $09F16D |
  dec   r10                                 ; $09F16E |
  bne CODE_09F150                           ; $09F16F |
  inc   r2                                  ; $09F171 |
  bra CODE_09F17F+1                         ; $09F172 |

  lms   r1,($0002)                          ; $09F174 |

CODE_09F177:
  loop                                      ; $09F177 |
  inc   r1                                  ; $09F178 |
  with r7                                   ; $09F179 |
  add   r6                                  ; $09F17A |
  dec   r10                                 ; $09F17B |
  bne CODE_09F150                           ; $09F17C |
  inc   r2                                  ; $09F17E |

CODE_09F17F:
  lms   r1,($0002)                          ; $09F17F |
  lms   r2,($0004)                          ; $09F182 |
  lms   r3,($0006)                          ; $09F185 |
  lms   r5,($004A)                          ; $09F188 |
  iwt   r15,#$F04B                          ; $09F18B |
  inc   r5                                  ; $09F18E |

; freespace
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F18F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F197 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F19F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1A7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1AF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1B7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1BF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1C7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1CF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1D7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1DF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1E7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1EF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1F7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F1FF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F207 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F20F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F217 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F21F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F227 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F22F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F237 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F23F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F247 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F24F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F257 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F25F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F267 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F26F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F277 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F27F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F287 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F28F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F297 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F29F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2A7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2AF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2B7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2BF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2C7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2CF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2D7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2DF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2E7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2EF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2F7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F2FF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F307 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F30F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F317 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F31F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F327 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F32F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F337 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F33F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F347 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F34F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F357 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F35F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F367 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F36F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F377 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F37F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F387 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F38F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F397 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F39F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3A7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3AF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3B7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3BF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3C7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3CF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3D7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3DF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3E7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3EF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3F7 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F3FF |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F407 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F40F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F417 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F41F |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F427 |
  db $01, $01, $01, $01, $01, $01, $01, $01 ; $09F42F |
  db $01, $01, $01, $01, $01, $01, $01      ; $09F437 |

  db $F4, $F0, $18, $28, $00, $C0, $D5, $E8 ; $09F43E |
  db $F3, $2F, $28, $18, $C0, $D5, $E4, $FA ; $09F446 |
  db $37, $1F, $80, $80, $D5, $E0, $05, $3F ; $09F44E |
  db $0F, $40, $80, $D5, $E4, $04, $37, $17 ; $09F456 |
  db $30, $E8, $D5, $F0, $04, $1F, $1F, $60 ; $09F45E |
  db $A0, $D5, $F0, $04, $20, $1F, $20, $80 ; $09F466 |
  db $D5, $F0, $01, $20, $1F, $00, $80, $D5 ; $09F46E |
  db $E8, $05, $2F, $10, $40, $90, $D5, $E8 ; $09F476 |
  db $02, $2F, $17, $00, $E8, $D5, $E8, $FF ; $09F47E |
  db $30, $17, $30, $A0, $D5, $E8, $F9, $2F ; $09F486 |
  db $1F, $00, $A0, $D5, $F4, $F0, $17, $28 ; $09F48E |
  db $48, $C0, $D5, $E8, $C0, $2F, $3F, $00 ; $09F496 |
  db $80, $55, $F8, $E8, $0F, $17, $30, $A8 ; $09F49E |
  db $55, $E8, $C0, $2F, $3F, $80, $80, $55 ; $09F4A6 |
  db $E8, $E8, $2F, $27, $30, $80, $55, $F0 ; $09F4AE |
  db $D0, $1F, $2F, $60, $80, $55, $F0, $F4 ; $09F4B6 |
  db $1F, $17, $40, $A8, $55, $F0, $F8, $1F ; $09F4BE |
  db $0F, $60, $B0, $55, $C0, $C8, $7F, $37 ; $09F4C6 |
  db $80, $C8, $D5, $D8, $C0, $4F, $47, $B0 ; $09F4CE |
  db $80, $55, $C0, $F8, $7F, $17, $80, $E8 ; $09F4D6 |
  db $55, $D8, $E0, $50, $40, $30, $C0, $55 ; $09F4DE |
  db $E8, $E0, $2F, $3F, $00, $C0, $55, $DC ; $09F4E6 |
  db $DC, $47, $47, $B8, $80, $D5, $F8, $F4 ; $09F4EE |
  db $10, $18, $60, $C0, $D5, $F8, $F4, $10 ; $09F4F6 |
  db $18, $70, $C0, $D5, $F8, $F4, $10, $18 ; $09F4FE |
  db $30, $A8, $55, $F4, $F4, $18, $18, $80 ; $09F506 |
  db $D0, $55, $F4, $F4, $18, $18, $98, $D0 ; $09F50E |
  db $55, $F4, $F4, $18, $18, $68, $D8, $D5 ; $09F516 |
  db $F4, $F4, $18, $18, $80, $A0, $D5, $F8 ; $09F51E |
  db $F8, $10, $10, $80, $C0, $55, $F8, $F8 ; $09F526 |
  db $10, $10, $90, $C0, $55, $F8, $F8, $10 ; $09F52E |
  db $10, $A0, $C0, $55, $F8, $F8, $10, $10 ; $09F536 |
  db $B0, $C8, $55, $F8, $F8, $10, $10, $C0 ; $09F53E |
  db $C8, $55, $F8, $F8, $10, $10, $D0, $C8 ; $09F546 |
  db $55, $F8, $F8, $10, $10, $E0, $C8, $55 ; $09F54E |
  db $F8, $F8, $10, $10, $F0, $C8, $55, $F8 ; $09F556 |
  db $F8, $10, $10, $B0, $D8, $55, $F8, $F8 ; $09F55E |
  db $10, $10, $C0, $D8, $55, $F8, $F8, $10 ; $09F566 |
  db $10, $D0, $D8, $55                     ; $09F56E |

  romb                                      ; $09F572 |
  move  r14,r14                             ; $09F574 |
  link  #4                                  ; $09F576 |
  iwt   r15,#$F5CA                          ; $09F577 |
  nop                                       ; $09F57A |
  iwt   r8,#$385E                           ; $09F57B |
  iwt   r9,#$5800                           ; $09F57E |
  iwt   r10,#$58D2                          ; $09F581 |
  cache                                     ; $09F584 |
  ibt   r12,#$004F                          ; $09F585 |
  move  r13,r15                             ; $09F587 |
  from r1                                   ; $09F589 |
  stw   (r8)                                ; $09F58A |
  inc   r8                                  ; $09F58B |
  inc   r8                                  ; $09F58C |
  from r2                                   ; $09F58D |
  stb   (r9)                                ; $09F58E |
  inc   r9                                  ; $09F590 |
  from r3                                   ; $09F591 |
  stw   (r10)                               ; $09F592 |
  inc   r10                                 ; $09F593 |
  loop                                      ; $09F594 |
  inc   r10                                 ; $09F595 |
  ibt   r7,#$000E                           ; $09F596 |

CODE_09F598:
  link  #4                                  ; $09F598 |
  iwt   r15,#$F5CA                          ; $09F599 |
  nop                                       ; $09F59C |
  ibt   r12,#$0004                          ; $09F59D |
  move  r13,r15                             ; $09F59F |
  from r1                                   ; $09F5A1 |
  stw   (r8)                                ; $09F5A2 |
  inc   r8                                  ; $09F5A3 |
  inc   r8                                  ; $09F5A4 |
  from r2                                   ; $09F5A5 |
  stb   (r9)                                ; $09F5A6 |
  inc   r9                                  ; $09F5A8 |
  from r3                                   ; $09F5A9 |
  stw   (r10)                               ; $09F5AA |
  inc   r10                                 ; $09F5AB |
  loop                                      ; $09F5AC |
  inc   r10                                 ; $09F5AD |
  dec   r7                                  ; $09F5AE |
  bne CODE_09F598                           ; $09F5AF |
  nop                                       ; $09F5B1 |
  link  #4                                  ; $09F5B2 |
  iwt   r15,#$F5CA                          ; $09F5B3 |
  nop                                       ; $09F5B6 |
  ibt   r12,#$004A                          ; $09F5B7 |
  move  r13,r15                             ; $09F5B9 |
  from r1                                   ; $09F5BB |
  stw   (r8)                                ; $09F5BC |
  inc   r8                                  ; $09F5BD |
  inc   r8                                  ; $09F5BE |
  from r2                                   ; $09F5BF |
  stb   (r9)                                ; $09F5C0 |
  inc   r9                                  ; $09F5C2 |
  from r3                                   ; $09F5C3 |
  stw   (r10)                               ; $09F5C4 |
  inc   r10                                 ; $09F5C5 |
  loop                                      ; $09F5C6 |
  inc   r10                                 ; $09F5C7 |
  stop                                      ; $09F5C8 |
  nop                                       ; $09F5C9 |

  getb                                      ; $09F5CA |
  inc   r14                                 ; $09F5CB |
  getbh                                     ; $09F5CC |
  inc   r14                                 ; $09F5CE |
  move  r1,r0                               ; $09F5CF |
  ibt   r5,#$001F                           ; $09F5D1 |
  and   r5                                  ; $09F5D3 |
  ibt   r6,#$0020                           ; $09F5D4 |
  to r2                                     ; $09F5D6 |
  or    r6                                  ; $09F5D7 |
  from r1                                   ; $09F5D8 |
  lsr                                       ; $09F5D9 |
  lsr                                       ; $09F5DA |
  lsr                                       ; $09F5DB |
  lsr                                       ; $09F5DC |
  lsr                                       ; $09F5DD |
  move  r4,r0                               ; $09F5DE |
  and   r5                                  ; $09F5E0 |
  with r6                                   ; $09F5E1 |
  add   r6                                  ; $09F5E2 |
  to r3                                     ; $09F5E3 |
  or    r6                                  ; $09F5E4 |
  from r4                                   ; $09F5E5 |
  lsr                                       ; $09F5E6 |
  lsr                                       ; $09F5E7 |
  lsr                                       ; $09F5E8 |
  lsr                                       ; $09F5E9 |
  lsr                                       ; $09F5EA |
  and   r5                                  ; $09F5EB |
  with r6                                   ; $09F5EC |
  add   r6                                  ; $09F5ED |
  or    r6                                  ; $09F5EE |
  swap                                      ; $09F5EF |
  to r3                                     ; $09F5F0 |
  or    r3                                  ; $09F5F1 |
  jmp   r11                                 ; $09F5F2 |
  nop                                       ; $09F5F3 |

  from r1                                   ; $09F5F4 |
  sub   r3                                  ; $09F5F5 |
  iwt   r9,#$0100                           ; $09F5F6 |
  to r9                                     ; $09F5F9 |
  add   r9                                  ; $09F5FA |
  ibt   r10,#$0001                          ; $09F5FB |
  sub   r0                                  ; $09F5FD |
  move  r6,r0                               ; $09F5FE |
  cache                                     ; $09F600 |
  ibt   r12,#$0020                          ; $09F601 |
  iwt   r13,#$F607                          ; $09F603 |
  with r6                                   ; $09F606 |
  add   r6                                  ; $09F607 |
  with r10                                  ; $09F608 |
  add   r10                                 ; $09F609 |
  rol                                       ; $09F60A |
  sub   r9                                  ; $09F60B |
  bcc CODE_09F611                           ; $09F60C |
  add   r9                                  ; $09F60E |
  sub   r9                                  ; $09F60F |
  inc   r6                                  ; $09F610 |

CODE_09F611:
  loop                                      ; $09F611 |
  with r6                                   ; $09F612 |
  lms   r8,($0094)                          ; $09F613 |
  iwt   r10,#$0078                          ; $09F616 |
  from r3                                   ; $09F619 |
  sub   r8                                  ; $09F61A |
  sub   r10                                 ; $09F61B |
  lmult                                     ; $09F61C |
  with r4                                   ; $09F61E |
  hib                                       ; $09F61F |
  lob                                       ; $09F620 |
  swap                                      ; $09F621 |
  or    r4                                  ; $09F622 |
  add   r10                                 ; $09F623 |
  add   r8                                  ; $09F624 |
  to r1                                     ; $09F625 |
  sub   r1                                  ; $09F626 |
  lms   r8,($009C)                          ; $09F627 |
  iwt   r10,#$0088                          ; $09F62A |
  from r2                                   ; $09F62D |
  sub   r8                                  ; $09F62E |
  sub   r10                                 ; $09F62F |
  lmult                                     ; $09F630 |
  with r4                                   ; $09F632 |
  hib                                       ; $09F633 |
  lob                                       ; $09F634 |
  swap                                      ; $09F635 |
  or    r4                                  ; $09F636 |
  add   r10                                 ; $09F637 |
  add   r8                                  ; $09F638 |
  to r2                                     ; $09F639 |
  sub   r2                                  ; $09F63A |
  ibt   r4,#$0006                           ; $09F63B |
  move  r12,r7                              ; $09F63D |
  move  r13,r15                             ; $09F63F |
  ldw   (r5)                                ; $09F641 |
  add   r1                                  ; $09F642 |
  sbk                                       ; $09F643 |
  inc   r5                                  ; $09F644 |
  inc   r5                                  ; $09F645 |
  ldw   (r5)                                ; $09F646 |
  add   r2                                  ; $09F647 |
  with r5                                   ; $09F648 |
  add   r4                                  ; $09F649 |
  loop                                      ; $09F64A |
  sbk                                       ; $09F64B |
  stop                                      ; $09F64C |
  nop                                       ; $09F64D |

  cache                                     ; $09F64E |
  ibt   r10,#$001F                          ; $09F64F |
  lm    r0,($11AA)                          ; $09F651 |
  inc   r0                                  ; $09F655 |
  sbk                                       ; $09F656 |
  move  r6,r0                               ; $09F657 |
  iwt   r12,#$0100                          ; $09F659 |
  move  r13,r15                             ; $09F65C |
  ldw   (r1)                                ; $09F65E |
  to r8                                     ; $09F65F |
  and   r10                                 ; $09F660 |
  ldw   (r2)                                ; $09F661 |
  to r9                                     ; $09F662 |
  and   r10                                 ; $09F663 |
  link  #4                                  ; $09F664 |
  iwt   r15,#$F6A3                          ; $09F665 |
  nop                                       ; $09F668 |
  move  r5,r0                               ; $09F669 |
  ldw   (r1)                                ; $09F66B |
  add   r0                                  ; $09F66C |
  add   r0                                  ; $09F66D |
  add   r0                                  ; $09F66E |
  swap                                      ; $09F66F |
  to r8                                     ; $09F670 |
  and   r10                                 ; $09F671 |
  ldw   (r2)                                ; $09F672 |
  add   r0                                  ; $09F673 |
  add   r0                                  ; $09F674 |
  add   r0                                  ; $09F675 |
  swap                                      ; $09F676 |
  to r9                                     ; $09F677 |
  and   r10                                 ; $09F678 |
  link  #4                                  ; $09F679 |
  iwt   r15,#$F6A3                          ; $09F67A |
  nop                                       ; $09F67D |
  swap                                      ; $09F67E |
  lsr                                       ; $09F67F |
  lsr                                       ; $09F680 |
  lsr                                       ; $09F681 |
  to r5                                     ; $09F682 |
  or    r5                                  ; $09F683 |
  ldw   (r1)                                ; $09F684 |
  swap                                      ; $09F685 |
  lsr                                       ; $09F686 |
  lsr                                       ; $09F687 |
  to r8                                     ; $09F688 |
  and   r10                                 ; $09F689 |
  ldw   (r2)                                ; $09F68A |
  swap                                      ; $09F68B |
  lsr                                       ; $09F68C |
  lsr                                       ; $09F68D |
  to r9                                     ; $09F68E |
  and   r10                                 ; $09F68F |
  link  #4                                  ; $09F690 |
  iwt   r15,#$F6A3                          ; $09F691 |
  nop                                       ; $09F694 |
  swap                                      ; $09F695 |
  add   r0                                  ; $09F696 |
  add   r0                                  ; $09F697 |
  or    r5                                  ; $09F698 |
  stw   (r3)                                ; $09F699 |
  inc   r1                                  ; $09F69A |
  inc   r1                                  ; $09F69B |
  inc   r2                                  ; $09F69C |
  inc   r2                                  ; $09F69D |
  inc   r3                                  ; $09F69E |
  loop                                      ; $09F69F |
  inc   r3                                  ; $09F6A0 |
  stop                                      ; $09F6A1 |
  nop                                       ; $09F6A2 |

  from r9                                   ; $09F6A3 |
  sub   r8                                  ; $09F6A4 |
  mult  r6                                  ; $09F6A5 |
  asr                                       ; $09F6A6 |
  asr                                       ; $09F6A7 |
  asr                                       ; $09F6A8 |
  asr                                       ; $09F6A9 |
  asr                                       ; $09F6AA |
  add   r8                                  ; $09F6AB |
  and   r10                                 ; $09F6AC |
  move  r15,r11                             ; $09F6AD |
  nop                                       ; $09F6AF |
  iwt   r6,#$0040                           ; $09F6B0 |
  from r1                                   ; $09F6B3 |
  lmult                                     ; $09F6B4 |
  with r4                                   ; $09F6B6 |
  hib                                       ; $09F6B7 |
  lob                                       ; $09F6B8 |
  swap                                      ; $09F6B9 |
  to r9                                     ; $09F6BA |
  or    r4                                  ; $09F6BB |
  ibt   r10,#$0001                          ; $09F6BC |
  sub   r0                                  ; $09F6BE |
  move  r6,r0                               ; $09F6BF |
  cache                                     ; $09F6C1 |
  ibt   r12,#$0020                          ; $09F6C2 |
  iwt   r13,#$F6C8                          ; $09F6C4 |
  with r6                                   ; $09F6C7 |
  add   r6                                  ; $09F6C8 |
  with r10                                  ; $09F6C9 |
  add   r10                                 ; $09F6CA |
  rol                                       ; $09F6CB |
  sub   r1                                  ; $09F6CC |
  bcc CODE_09F6D2                           ; $09F6CD |
  add   r1                                  ; $09F6CF |
  sub   r1                                  ; $09F6D0 |
  inc   r6                                  ; $09F6D1 |

CODE_09F6D2:
  loop                                      ; $09F6D2 |
  with r6                                   ; $09F6D3 |
  lms   r8,($0094)                          ; $09F6D4 |
  iwt   r10,#$0080                          ; $09F6D7 |
  from r3                                   ; $09F6DA |
  sub   r8                                  ; $09F6DB |
  sub   r10                                 ; $09F6DC |
  lmult                                     ; $09F6DD |
  with r4                                   ; $09F6DF |
  hib                                       ; $09F6E0 |
  lob                                       ; $09F6E1 |
  swap                                      ; $09F6E2 |
  or    r4                                  ; $09F6E3 |
  dec   r5                                  ; $09F6E4 |
  bpl CODE_09F6EA                           ; $09F6E5 |
  inc   r5                                  ; $09F6E7 |
  not                                       ; $09F6E8 |
  inc   r0                                  ; $09F6E9 |

CODE_09F6EA:
  iwt   r5,#$0180                           ; $09F6EA |
  add   r5                                  ; $09F6ED |
  sms   ($0098),r0                          ; $09F6EE |
  lms   r8,($009C)                          ; $09F6F1 |
  iwt   r10,#$0090                          ; $09F6F4 |
  from r2                                   ; $09F6F7 |
  sub   r8                                  ; $09F6F8 |
  sub   r10                                 ; $09F6F9 |
  lmult                                     ; $09F6FA |
  with r4                                   ; $09F6FC |
  hib                                       ; $09F6FD |
  lob                                       ; $09F6FE |
  swap                                      ; $09F6FF |
  to r5                                     ; $09F700 |
  or    r4                                  ; $09F701 |
  iwt   r0,#$0180                           ; $09F702 |
  sub   r5                                  ; $09F705 |
  sms   ($00A0),r0                          ; $09F706 |
  stop                                      ; $09F709 |
  nop                                       ; $09F70A |

  iwt   r0,#$1C16                           ; $09F70B |
  add   r1                                  ; $09F70E |
  ldw   (r0)                                ; $09F70F |
  dec   r0                                  ; $09F710 |
  bpl CODE_09F716                           ; $09F711 |
  inc   r0                                  ; $09F713 |
  not                                       ; $09F714 |
  inc   r0                                  ; $09F715 |

CODE_09F716:
  ibt   r4,#$0040                           ; $09F716 |
  sub   r4                                  ; $09F718 |
  bcs CODE_09F73F                           ; $09F719 |
  add   r4                                  ; $09F71B |
  to r2                                     ; $09F71C |
  umult r0                                  ; $09F71D |
  iwt   r0,#$1C18                           ; $09F71F |
  add   r1                                  ; $09F722 |
  ldw   (r0)                                ; $09F723 |
  dec   r0                                  ; $09F724 |
  bpl CODE_09F72A                           ; $09F725 |
  inc   r0                                  ; $09F727 |
  not                                       ; $09F728 |
  inc   r0                                  ; $09F729 |

CODE_09F72A:
  sub   r4                                  ; $09F72A |
  bcs CODE_09F73F                           ; $09F72B |
  add   r4                                  ; $09F72D |
  umult r0                                  ; $09F72E |
  to r2                                     ; $09F730 |
  add   r2                                  ; $09F731 |
  lms   r0,($0122)                          ; $09F732 |
  umult r0                                  ; $09F735 |
  iwt   r3,#$0790                           ; $09F737 |
  add   r3                                  ; $09F73A |
  sub   r2                                  ; $09F73B |
  bcs CODE_09F741                           ; $09F73C |
  sub   r0                                  ; $09F73E |

CODE_09F73F:
  ibt   r0,#$0001                           ; $09F73F |

CODE_09F741:
  stop                                      ; $09F741 |
  nop                                       ; $09F742 |

; takes no parameters
; returns r1 as flag:
; $0000 means go ahead and spawn a Baron von Zeppelin w/ bowser egg
; anything else means do not spawn
; This routine is called by Baby Bowser in mecha form
; to see whether to spawn a balloon w/ egg or not.
; It loops through sprite tables looking for one that exists already.
; If a balloon w/ egg exists, or if a collidable bowser egg exists,
; then the flag turns on (don't spawn).
gsu_check_bowser_egg_spawn:
  ibt   r1,#$0000                           ; $09F743 | return value flag
  iwt   r2,#$0F00                           ; $09F745 | sprite state table
  iwt   r3,#$1360                           ; $09F748 | sprite ID table
  iwt   r4,#$1D38                           ; $09F74B |
  iwt   r5,#$00CD                           ; $09F74E | sprite ID: balloon w/ bowser egg
  iwt   r6,#$0026                           ; $09F751 | sprite ID: bowser egg
  iwt   r7,#$0004                           ; $09F754 | sprite entry size
  cache                                     ; $09F757 |\
  ibt   r12,#$0018                          ; $09F758 | | begin loop of all sprites
  move  r13,r15                             ; $09F75A |/
  ldw   (r2)                                ; $09F75C |\
  lob                                       ; $09F75D | | if sprite's state is uninitialized
  beq .next_sprite                          ; $09F75E | | skip to next
  nop                                       ; $09F760 |/
  ldw   (r3)                                ; $09F761 |\
  sub   r5                                  ; $09F762 | | if sprite ID is balloon w/ bowser egg
  beq .return_flag_on                       ; $09F763 | | flag on return value and go to next
  add   r5                                  ; $09F765 |/
  sub   r6                                  ; $09F766 |\  if sprite ID is NOT bowser egg
  bne .next_sprite                          ; $09F767 | | skip to next
  nop                                       ; $09F769 |/
  ldw   (r4)                                ; $09F76A |\  if bowser egg's collision state
  sub   #0                                  ; $09F76B | | is anything but $00, meaning
  bne .next_sprite                          ; $09F76D | | tonguable/collidable with everything
  nop                                       ; $09F76F |/  then skip to next

.return_flag_on
  inc   r1                                  ; $09F770 | return value flag on

.next_sprite
  with r2                                   ; $09F771 |\
  add   r7                                  ; $09F772 | |
  with r3                                   ; $09F773 | | next entry in sprite tables
  add   r7                                  ; $09F774 | | and loop
  with r4                                   ; $09F775 | |
  add   r7                                  ; $09F776 | |
  loop                                      ; $09F777 | |
  nop                                       ; $09F778 |/
  stop                                      ; $09F779 |
  nop                                       ; $09F77A |

  cache                                     ; $09F77B |
  iwt   r3,#$6800                           ; $09F77C |
  iwt   r0,#$03CE                           ; $09F77F |
  iwt   r12,#$0400                          ; $09F782 |
  move  r13,r15                             ; $09F785 |
  stw   (r3)                                ; $09F787 |
  inc   r3                                  ; $09F788 |
  loop                                      ; $09F789 |
  inc   r3                                  ; $09F78A |
  iwt   r1,#$2000                           ; $09F78B |
  iwt   r2,#$6C44                           ; $09F78E |
  ibt   r4,#$0010                           ; $09F791 |
  ibt   r5,#$000F                           ; $09F793 |
  ibt   r7,#$0028                           ; $09F795 |
  ibt   r8,#$0038                           ; $09F797 |
  ibt   r10,#$000B                          ; $09F799 |
  ibt   r11,#$000C                          ; $09F79B |

CODE_09F79D:
  move  r0,r1                               ; $09F79D |
  move  r12,r11                             ; $09F79F |
  move  r13,r15                             ; $09F7A1 |
  stw   (r2)                                ; $09F7A3 |
  inc   r0                                  ; $09F7A4 |
  inc   r0                                  ; $09F7A5 |
  to r14                                    ; $09F7A6 |
  and   r5                                  ; $09F7A7 |
  bne CODE_09F7AC                           ; $09F7A8 |
  inc   r2                                  ; $09F7AA |
  add   r4                                  ; $09F7AB |

CODE_09F7AC:
  loop                                      ; $09F7AC |
  inc   r2                                  ; $09F7AD |
  with r2                                   ; $09F7AE |
  add   r7                                  ; $09F7AF |
  from r1                                   ; $09F7B0 |
  add   r8                                  ; $09F7B1 |
  to r1                                     ; $09F7B2 |
  bic   r4                                  ; $09F7B3 |
  dec   r10                                 ; $09F7B5 |
  bne CODE_09F79D+1                         ; $09F7B6 |
  move  r0,r1                               ; $09F7B8 |
  stop                                      ; $09F7BA |
  nop                                       ; $09F7BB |

  cache                                     ; $09F7BC |
  iwt   r5,#$6800                           ; $09F7BD |
  sub   r0                                  ; $09F7C0 |
  iwt   r12,#$0300                          ; $09F7C1 |
  move  r13,r15                             ; $09F7C4 |
  stw   (r5)                                ; $09F7C6 |
  inc   r5                                  ; $09F7C7 |
  loop                                      ; $09F7C8 |
  inc   r5                                  ; $09F7C9 |
  ibt   r5,#$0000                           ; $09F7CA |
  ibt   r6,#$0000                           ; $09F7CC |
  iwt   r9,#$0080                           ; $09F7CE |
  ibt   r10,#$0010                          ; $09F7D1 |

CODE_09F7D3:
  from r3                                   ; $09F7D3 |

CODE_09F7D4:
  romb                                      ; $09F7D4 |
  move  r14,r4                              ; $09F7D6 |
  getb                                      ; $09F7D8 |
  inc   r14                                 ; $09F7D9 |
  iwt   r11,#$00FF                          ; $09F7DA |
  sub   r11                                 ; $09F7DD |
  bne CODE_09F7F1                           ; $09F7DE |
  add   r11                                 ; $09F7E0 |
  getb                                      ; $09F7E1 |
  inc   r14                                 ; $09F7E2 |
  to r11                                    ; $09F7E3 |
  sub   #10                                 ; $09F7E4 |
  beq CODE_09F7EB                           ; $09F7E6 |
  nop                                       ; $09F7E8 |
  stop                                      ; $09F7E9 |
  nop                                       ; $09F7EA |

CODE_09F7EB:
  getb                                      ; $09F7EB |
  inc   r14                                 ; $09F7EC |
  ibt   r5,#$0040                           ; $09F7ED |
  ibt   r6,#$0010                           ; $09F7EF |

CODE_09F7F1:
  move  r4,r14                              ; $09F7F1 |
  ibt   r14,#$0009                          ; $09F7F3 |
  from r14                                  ; $09F7F5 |
  romb                                      ; $09F7F6 |
  iwt   r14,#$BC2F                          ; $09F7F8 |
  to r14                                    ; $09F7FB |
  add   r14                                 ; $09F7FC |
  to r7                                     ; $09F7FD |
  getb                                      ; $09F7FE |
  umult #12                                 ; $09F7FF |
  iwt   r14,#$BD2F                          ; $09F801 |
  to r14                                    ; $09F804 |
  add   r14                                 ; $09F805 |
  ibt   r8,#$000C                           ; $09F806 |

CODE_09F808:
  to r11                                    ; $09F808 |
  getbh                                     ; $09F809 |
  inc   r14                                 ; $09F80B |
  move  r1,r5                               ; $09F80C |
  move  r2,r6                               ; $09F80E |
  move  r12,r7                              ; $09F810 |
  move  r13,r15                             ; $09F812 |
  with r11                                  ; $09F814 |
  add   r11                                 ; $09F815 |
  rol                                       ; $09F816 |
  and   #1                                  ; $09F817 |
  color                                     ; $09F819 |
  from r1                                   ; $09F81A |
  sub   r9                                  ; $09F81B |
  bcc CODE_09F822                           ; $09F81C |
  with r2                                   ; $09F81E |
  add   r10                                 ; $09F81F |
  move  r1,r0                               ; $09F820 |

CODE_09F822:
  loop                                      ; $09F822 |
  plot                                      ; $09F823 |
  dec   r8                                  ; $09F824 |
  bne CODE_09F808                           ; $09F825 |
  inc   r6                                  ; $09F827 |
  with r6                                   ; $09F828 |
  sub   #12                                 ; $09F829 |
  with r5                                   ; $09F82B |
  add   r7                                  ; $09F82C |
  rpix                                      ; $09F82D |
  from r5                                   ; $09F82F |
  sub   r9                                  ; $09F830 |
  bcc CODE_09F7D4                           ; $09F831 |
  from r3                                   ; $09F833 |
  move  r5,r0                               ; $09F834 |
  with r6                                   ; $09F836 |
  bra CODE_09F7D3                           ; $09F837 |
  add   r10                                 ; $09F839 |

  ibt   r0,#$0008                           ; $09F83A |
  romb                                      ; $09F83C |
  iwt   r0,#$AE18                           ; $09F83E |
  to r14                                    ; $09F841 |
  add   r1                                  ; $09F842 |
  getbs                                     ; $09F843 |
  move  r1,r0                               ; $09F845 |
  lms   r3,($0122)                          ; $09F847 |
  mult  r3                                  ; $09F84A |
  add   r0                                  ; $09F84B |
  add   r0                                  ; $09F84C |
  hib                                       ; $09F84D |
  sex                                       ; $09F84E |
  not                                       ; $09F84F |
  add   r4                                  ; $09F850 |
  lms   r4,($0090)                          ; $09F851 |
  add   r4                                  ; $09F854 |
  sms   ($011E),r0                          ; $09F855 |
  ibt   r0,#$0040                           ; $09F858 |
  to r14                                    ; $09F85A |
  add   r14                                 ; $09F85B |
  getbs                                     ; $09F85C |
  move  r2,r0                               ; $09F85E |
  mult  r3                                  ; $09F860 |
  add   r0                                  ; $09F861 |
  add   r0                                  ; $09F862 |
  hib                                       ; $09F863 |
  sex                                       ; $09F864 |
  add   #8                                  ; $09F865 |
  lms   r4,($008C)                          ; $09F867 |
  add   r4                                  ; $09F86A |
  sms   ($011C),r0                          ; $09F86B |
  dec   r1                                  ; $09F86E |
  bpl CODE_09F875                           ; $09F86F |
  inc   r1                                  ; $09F871 |
  with r1                                   ; $09F872 |
  not                                       ; $09F873 |
  inc   r1                                  ; $09F874 |

CODE_09F875:
  dec   r2                                  ; $09F875 |
  bpl CODE_09F87C                           ; $09F876 |
  inc   r2                                  ; $09F878 |
  with r2                                   ; $09F879 |
  not                                       ; $09F87A |
  inc   r2                                  ; $09F87B |

CODE_09F87C:
  lms   r0,($0120)                          ; $09F87C |
  to r5                                     ; $09F87F |
  mult  r1                                  ; $09F880 |
  to r6                                     ; $09F881 |
  mult  r2                                  ; $09F882 |
  from r3                                   ; $09F883 |
  mult  r2                                  ; $09F884 |
  add   r5                                  ; $09F885 |
  add   r0                                  ; $09F886 |
  add   r0                                  ; $09F887 |
  hib                                       ; $09F888 |
  sms   ($0120),r0                          ; $09F889 |
  from r3                                   ; $09F88C |
  mult  r1                                  ; $09F88D |
  add   r6                                  ; $09F88E |
  add   r0                                  ; $09F88F |
  add   r0                                  ; $09F890 |
  hib                                       ; $09F891 |
  sms   ($0122),r0                          ; $09F892 |
  stop                                      ; $09F895 |
  nop                                       ; $09F896 |
  lm    r0,($0002)                          ; $09F897 |
  add   r0                                  ; $09F89B |
  mult  #8                                  ; $09F89C |
  lm    r1,($0000)                          ; $09F89E |
  add   r1                                  ; $09F8A2 |
  mult  #4                                  ; $09F8A3 |
  iwt   r1,#$5800                           ; $09F8A5 |
  to r14                                    ; $09F8A8 |
  add   r1                                  ; $09F8A9 |
  cache                                     ; $09F8AA |
  iwt   r1,#$063F                           ; $09F8AB |
  iwt   r3,#$06FF                           ; $09F8AE |
  link  #4                                  ; $09F8B1 |
  iwt   r15,#$F905                          ; $09F8B2 |
  nop                                       ; $09F8B5 |
  iwt   r1,#$061F                           ; $09F8B6 |
  iwt   r3,#$06BF                           ; $09F8B9 |
  link  #4                                  ; $09F8BC |
  iwt   r15,#$F905                          ; $09F8BD |
  nop                                       ; $09F8C0 |
  iwt   r1,#$043F                           ; $09F8C1 |
  iwt   r3,#$02FF                           ; $09F8C4 |
  link  #4                                  ; $09F8C7 |
  iwt   r15,#$F905                          ; $09F8C8 |
  nop                                       ; $09F8CB |
  iwt   r1,#$041F                           ; $09F8CC |
  iwt   r3,#$02BF                           ; $09F8CF |
  link  #4                                  ; $09F8D2 |
  iwt   r15,#$F905                          ; $09F8D3 |
  nop                                       ; $09F8D6 |
  iwt   r1,#$023F                           ; $09F8D7 |
  iwt   r3,#$067F                           ; $09F8DA |
  link  #4                                  ; $09F8DD |
  iwt   r15,#$F905                          ; $09F8DE |
  nop                                       ; $09F8E1 |
  iwt   r1,#$021F                           ; $09F8E2 |
  iwt   r3,#$063F                           ; $09F8E5 |
  link  #4                                  ; $09F8E8 |
  iwt   r15,#$F905                          ; $09F8E9 |
  nop                                       ; $09F8EC |
  iwt   r1,#$003F                           ; $09F8ED |
  iwt   r3,#$027F                           ; $09F8F0 |
  link  #4                                  ; $09F8F3 |
  iwt   r15,#$F905                          ; $09F8F4 |
  nop                                       ; $09F8F7 |
  iwt   r1,#$001F                           ; $09F8F8 |
  iwt   r3,#$023F                           ; $09F8FB |
  link  #4                                  ; $09F8FE |
  iwt   r15,#$F905                          ; $09F8FF |
  nop                                       ; $09F902 |
  stop                                      ; $09F903 |
  nop                                       ; $09F904 |

  with r1                                   ; $09F905 |
  add   r14                                 ; $09F906 |
  with r3                                   ; $09F907 |
  add   r14                                 ; $09F908 |
  ibt   r2,#$0010                           ; $09F909 |
  from r1                                   ; $09F90B |
  to r2                                     ; $09F90C |
  sub   r2                                  ; $09F90D |
  ibt   r4,#$0020                           ; $09F90E |
  from r3                                   ; $09F910 |
  to r4                                     ; $09F911 |
  sub   r4                                  ; $09F912 |
  from r3                                   ; $09F913 |
  to r5                                     ; $09F914 |
  sub   #2                                  ; $09F915 |
  from r4                                   ; $09F917 |
  to r6                                     ; $09F918 |
  sub   #2                                  ; $09F919 |
  ibt   r10,#$0002                          ; $09F91B |
  ibt   r12,#$0004                          ; $09F91D |

CODE_09F91F:
  ibt   r13,#$0002                          ; $09F91F |

CODE_09F921:
  to r7                                     ; $09F921 |
  ldb   (r1)                                ; $09F922 |
  move  r8,r7                               ; $09F924 |
  with r7                                   ; $09F926 |
  lsr                                       ; $09F927 |
  ror                                       ; $09F928 |
  with r8                                   ; $09F929 |
  lsr                                       ; $09F92A |
  ror                                       ; $09F92B |
  with r7                                   ; $09F92C |
  lsr                                       ; $09F92D |
  ror                                       ; $09F92E |
  with r8                                   ; $09F92F |
  lsr                                       ; $09F930 |
  ror                                       ; $09F931 |
  with r7                                   ; $09F932 |
  lsr                                       ; $09F933 |
  ror                                       ; $09F934 |
  with r8                                   ; $09F935 |
  lsr                                       ; $09F936 |
  ror                                       ; $09F937 |
  with r7                                   ; $09F938 |
  lsr                                       ; $09F939 |
  ror                                       ; $09F93A |
  with r8                                   ; $09F93B |
  lsr                                       ; $09F93C |
  ror                                       ; $09F93D |
  swap                                      ; $09F93E |
  stb   (r3)                                ; $09F93F |
  dec   r3                                  ; $09F941 |
  stb   (r5)                                ; $09F942 |
  dec   r5                                  ; $09F944 |
  with r7                                   ; $09F945 |
  lsr                                       ; $09F946 |
  ror                                       ; $09F947 |
  with r8                                   ; $09F948 |
  lsr                                       ; $09F949 |
  ror                                       ; $09F94A |
  with r7                                   ; $09F94B |
  lsr                                       ; $09F94C |
  ror                                       ; $09F94D |
  with r8                                   ; $09F94E |
  lsr                                       ; $09F94F |
  ror                                       ; $09F950 |
  with r7                                   ; $09F951 |
  lsr                                       ; $09F952 |
  ror                                       ; $09F953 |
  with r8                                   ; $09F954 |
  lsr                                       ; $09F955 |
  ror                                       ; $09F956 |
  with r7                                   ; $09F957 |
  lsr                                       ; $09F958 |
  ror                                       ; $09F959 |
  with r8                                   ; $09F95A |
  lsr                                       ; $09F95B |
  ror                                       ; $09F95C |
  swap                                      ; $09F95D |
  stb   (r4)                                ; $09F95E |
  dec   r4                                  ; $09F960 |
  stb   (r6)                                ; $09F961 |
  dec   r6                                  ; $09F963 |
  dec   r13                                 ; $09F964 |
  bne CODE_09F921                           ; $09F965 |
  dec   r1                                  ; $09F967 |
  with r3                                   ; $09F968 |
  sub   #2                                  ; $09F969 |
  with r4                                   ; $09F96B |
  sub   #2                                  ; $09F96C |
  with r5                                   ; $09F96E |
  sub   #2                                  ; $09F96F |
  with r6                                   ; $09F971 |
  sub   #2                                  ; $09F972 |
  dec   r12                                 ; $09F974 |
  bne CODE_09F91F                           ; $09F975 |
  nop                                       ; $09F977 |
  ibt   r12,#$0004                          ; $09F978 |

CODE_09F97A:
  ibt   r13,#$0002                          ; $09F97A |

CODE_09F97C:
  to r7                                     ; $09F97C |
  ldb   (r2)                                ; $09F97D |
  move  r8,r7                               ; $09F97F |
  with r7                                   ; $09F981 |
  lsr                                       ; $09F982 |
  ror                                       ; $09F983 |
  with r8                                   ; $09F984 |
  lsr                                       ; $09F985 |
  ror                                       ; $09F986 |
  with r7                                   ; $09F987 |
  lsr                                       ; $09F988 |
  ror                                       ; $09F989 |
  with r8                                   ; $09F98A |
  lsr                                       ; $09F98B |
  ror                                       ; $09F98C |
  with r7                                   ; $09F98D |
  lsr                                       ; $09F98E |
  ror                                       ; $09F98F |
  with r8                                   ; $09F990 |
  lsr                                       ; $09F991 |
  ror                                       ; $09F992 |
  with r7                                   ; $09F993 |
  lsr                                       ; $09F994 |
  ror                                       ; $09F995 |
  with r8                                   ; $09F996 |
  lsr                                       ; $09F997 |
  ror                                       ; $09F998 |
  swap                                      ; $09F999 |
  stb   (r3)                                ; $09F99A |
  dec   r3                                  ; $09F99C |
  stb   (r5)                                ; $09F99D |
  dec   r5                                  ; $09F99F |
  with r7                                   ; $09F9A0 |
  lsr                                       ; $09F9A1 |
  ror                                       ; $09F9A2 |
  with r8                                   ; $09F9A3 |
  lsr                                       ; $09F9A4 |
  ror                                       ; $09F9A5 |
  with r7                                   ; $09F9A6 |
  lsr                                       ; $09F9A7 |
  ror                                       ; $09F9A8 |
  with r8                                   ; $09F9A9 |
  lsr                                       ; $09F9AA |
  ror                                       ; $09F9AB |
  with r7                                   ; $09F9AC |
  lsr                                       ; $09F9AD |
  ror                                       ; $09F9AE |
  with r8                                   ; $09F9AF |
  lsr                                       ; $09F9B0 |
  ror                                       ; $09F9B1 |
  with r7                                   ; $09F9B2 |
  lsr                                       ; $09F9B3 |
  ror                                       ; $09F9B4 |
  with r8                                   ; $09F9B5 |
  lsr                                       ; $09F9B6 |
  ror                                       ; $09F9B7 |
  swap                                      ; $09F9B8 |
  stb   (r4)                                ; $09F9B9 |
  dec   r4                                  ; $09F9BB |
  stb   (r6)                                ; $09F9BC |
  dec   r6                                  ; $09F9BE |
  dec   r13                                 ; $09F9BF |
  bne CODE_09F97C                           ; $09F9C0 |
  dec   r2                                  ; $09F9C2 |
  with r3                                   ; $09F9C3 |
  sub   #2                                  ; $09F9C4 |
  with r4                                   ; $09F9C6 |
  sub   #2                                  ; $09F9C7 |
  with r5                                   ; $09F9C9 |
  sub   #2                                  ; $09F9CA |
  with r6                                   ; $09F9CC |
  sub   #2                                  ; $09F9CD |
  dec   r12                                 ; $09F9CF |
  bne CODE_09F97A                           ; $09F9D0 |
  nop                                       ; $09F9D2 |
  iwt   r12,#$01E0                          ; $09F9D3 |
  with r3                                   ; $09F9D6 |
  sub   r12                                 ; $09F9D7 |
  with r4                                   ; $09F9D8 |
  sub   r12                                 ; $09F9D9 |
  with r5                                   ; $09F9DA |
  sub   r12                                 ; $09F9DB |
  with r6                                   ; $09F9DC |
  sub   r12                                 ; $09F9DD |
  dec   r10                                 ; $09F9DE |
  beq CODE_09F9E6                           ; $09F9DF |
  nop                                       ; $09F9E1 |
  iwt   r15,#$F91D                          ; $09F9E2 |
  nop                                       ; $09F9E5 |

CODE_09F9E6:
  jmp   r11                                 ; $09F9E6 |
  nop                                       ; $09F9E7 |

; in:
; r1 = upper screen tile #: 000000rrrrccccc0
; r2 = lower screen tile #: 000000rrrrccccc0
; r3 = Y camera row
; r10 = Y camera row * 4
; r12 = 4-bit negative Y camera row

; converts a full column of MAP16 indices to tilemap entries
gsu_map16_to_tmap_column:
  iwt   r0,#$409E                           ; $09F9E8 |\  current screen table
  to r1                                     ; $09F9EB | | $409E indexed with upper screen tile #
  add   r1                                  ; $09F9EC |/
  to r2                                     ; $09F9ED |\  $409E with lower screen tile #
  add   r2                                  ; $09F9EE |/
  iwt   r0,#$0DAA                           ; $09F9EF |
  to r4                                     ; $09F9F2 | index into MAP16 tables
  add   r10                                 ; $09F9F3 | r4 = $0DAA + y camera row * 4
  ibt   r0,#$0040                           ; $09F9F4 |
  to r5                                     ; $09F9F6 |
  add   r4                                  ; $09F9F7 | r5 = $0DEA + y camera row * 4
  from r12                                  ; $09F9F8 |\
  add   r12                                 ; $09F9F9 | | r0 = 4-bit -Y camera row * 4 + 4-bit Y camera row * 4
  add   r0                                  ; $09F9FA | | this should always be $40 or $00
  add   r10                                 ; $09F9FB |/
  ibt   r10,#$003E                          ; $09F9FC |\
  to r10                                    ; $09F9FE | | ANDing $3E will always be $00, don't get the point of this
  and   r10                                 ; $09F9FF |/
  ibt   r0,#$004C                           ; $09FA00 |\  dickbutt mirror
  romb                                      ; $09FA02 |/  banks 18 & 19
  iwt   r6,#$32A4                           ; $09FA04 | MAP16 page offset table
  iwt   r7,#$33F2                           ; $09FA07 | MAP16 page base address
  ibt   r8,#$0008                           ; $09FA0A | multiplier for indexing
  link  #4                                  ; $09FA0C |\  load upper screen
  iwt   r15,#$FA28                          ; $09FA0D | | gsu_map16_partial_column
  cache                                     ; $09FA10 |/
  move  r1,r2                               ; $09FA11 |\ keep going in lower screen
  moves r12,r3                              ; $09FA13 |/ restart at top of lower screen
  beq .ret                                  ; $09FA15 | if it's 0, don't bother doing the rest
  nop                                       ; $09FA17 |
  iwt   r0,#$0DAA                           ; $09FA18 |\
  to r4                                     ; $09FA1B | |
  add   r10                                 ; $09FA1C | | reinitialize destination table addresses
  ibt   r0,#$0040                           ; $09FA1D | | at the next screen point
  to r5                                     ; $09FA1F | |
  add   r4                                  ; $09FA20 |/
  link  #4                                  ; $09FA21 |\  load lower screen
  iwt   r15,#$FA28                          ; $09FA22 | | gsu_map16_partial_column
  nop                                       ; $09FA25 |/

.ret
  stop                                      ; $09FA26 |
  nop                                       ; $09FA27 |

; in:
; r1 = location of MAP16 index ($409E,x)
; r4 = left half of MAP16 tile destination
; r5 = right half of MAP16 tile destination
; r6 = MAP16 page offset table ($32A4)
; r7 = MAP16 page base address ($33F2)
; r8 = size of one MAP16 entry in bytes ($0008)
; r12 = loop counter

; converts a partial column of MAP16 indices to VRAM tilemap bytes
; stores into new column destination tables
gsu_map16_partial_column:
  move  r13,r15                             ; $09FA28 | loop begin
  ldw   (r1)                                ; $09FA2A | r0 = ($409E,x)
  to r9                                     ; $09FA2B |\ low byte = object offset within page
  umult r8                                  ; $09FA2C |/ r9 = low byte * 8 (for indexing)
  hib                                       ; $09FA2E |\ high byte = MAP16 page #
  add   r0                                  ; $09FA2F |/ page * 2 (for indexing)
  to r14                                    ; $09FA30 |\
  add   r6                                  ; $09FA31 | | page * 2 + page offset table =
  getb                                      ; $09FA32 | | page offset (in ROM)
  inc   r14                                 ; $09FA33 | |
  getbh                                     ; $09FA34 |/
  add   r9                                  ; $09FA36 |\  page base + page offset + object offset =
  to r14                                    ; $09FA37 | | full MAP16 ROM address
  add   r7                                  ; $09FA38 |/
  ibt   r9,#$0040                           ; $09FA39 |\
  with r1                                   ; $09FA3B | | go to next row for next iteration
  add   r9                                  ; $09FA3C |/
  getb                                      ; $09FA3D |\
  inc   r14                                 ; $09FA3E | |
  stb   (r4)                                ; $09FA3F | |
  inc   r4                                  ; $09FA41 | |
  getb                                      ; $09FA42 | |
  inc   r14                                 ; $09FA43 | |
  stb   (r4)                                ; $09FA44 | |
  inc   r4                                  ; $09FA46 | |
  getb                                      ; $09FA47 | |
  inc   r14                                 ; $09FA48 | |
  stb   (r5)                                ; $09FA49 | | store VRAM tilemaps
  inc   r5                                  ; $09FA4B | | at current spot
  getb                                      ; $09FA4C | | within "new column" tables
  inc   r14                                 ; $09FA4D | | r4 = left half
  stb   (r5)                                ; $09FA4E | | r5 = right half
  inc   r5                                  ; $09FA50 | |
  getb                                      ; $09FA51 | |
  inc   r14                                 ; $09FA52 | |
  stb   (r4)                                ; $09FA53 | |
  inc   r4                                  ; $09FA55 | |
  getb                                      ; $09FA56 | |
  inc   r14                                 ; $09FA57 | |
  stb   (r4)                                ; $09FA58 | |
  inc   r4                                  ; $09FA5A | |
  getb                                      ; $09FA5B | |
  inc   r14                                 ; $09FA5C | |
  stb   (r5)                                ; $09FA5D | |
  inc   r5                                  ; $09FA5F | |
  getb                                      ; $09FA60 | |
  inc   r14                                 ; $09FA61 | |
  stb   (r5)                                ; $09FA62 | |
  loop                                      ; $09FA64 | |
  inc   r5                                  ; $09FA65 |/
  jmp   r11                                 ; $09FA66 |\  return
  nop                                       ; $09FA67 |/

; in:
; r1 = left screen tile #: 000000rrrrccccc0
; r2 = right screen tile #: 000000rrrrccccc0
; r3 = camera X column + 1
; r12 = 4-bit negative camera X column

; converts a full row of MAP16 indices to tilemap entries
gsu_map16_to_tmap_row:
  iwt   r0,#$409E                           ; $09FA68 |\  current screen table
  to r1                                     ; $09FA6B | | $409E indexed with left screen tile #
  add   r1                                  ; $09FA6C |/
  to r2                                     ; $09FA6D |\  $409E with right screen tile #
  add   r2                                  ; $09FA6E |/
  iwt   r4,#$0E2A                           ; $09FA6F | new row top half table
  iwt   r5,#$0E6E                           ; $09FA72 | new row bottom half table
  ibt   r0,#$004C                           ; $09FA75 |\ ROM bank
  romb                                      ; $09FA77 |/
  iwt   r6,#$32A4                           ; $09FA79 | MAP16 page offset table
  iwt   r7,#$33F2                           ; $09FA7C | MAP16 page base address
  ibt   r8,#$0008                           ; $09FA7F | multiplier for indexing
  link  #4                                  ; $09FA81 |\  load left screen
  iwt   r15,#$FA91                          ; $09FA82 | | gsu_map16_partial_row
  cache                                     ; $09FA85 |/
  move  r1,r2                               ; $09FA86 |\ restart at right screen index
  move  r12,r3                              ; $09FA88 |/ and loop counter
  link  #4                                  ; $09FA8A |\  load right screen
  iwt   r15,#$FA91                          ; $09FA8B | | gsu_map16_partial_row
  nop                                       ; $09FA8E |/
  stop                                      ; $09FA8F |
  nop                                       ; $09FA90 |

; in:
; r1 = location of MAP16 index ($409E,x)
; r4 = top half of MAP16 tile destination
; r5 = bottom half of MAP16 tile destination
; r6 = MAP16 page offset table ($32A4)
; r7 = MAP16 page base address ($33F2)
; r8 = size of one MAP16 entry in bytes ($0008)
; r12 = loop counter

; converts a partial row of MAP16 indices to VRAM tilemap bytes
; stores into new row destination tables
gsu_map16_partial_row:
  move  r13,r15                             ; $09FA91 | loop begin
  ldw   (r1)                                ; $09FA93 | r0 = (409E,x)
  to r9                                     ; $09FA94 |\ low byte = object offset within page
  umult r8                                  ; $09FA95 |/ r9 = low byte * 8 (for indexing)
  hib                                       ; $09FA97 |\ high byte = MAP16 page #
  add   r0                                  ; $09FA98 |/ page * 2 (for indexing)
  to r14                                    ; $09FA99 |\
  add   r6                                  ; $09FA9A | | page * 2 + page offset table =
  getb                                      ; $09FA9B | | page offset (in ROM)
  inc   r14                                 ; $09FA9C |/
  inc   r1                                  ; $09FA9D |\ next column for next iteration
  inc   r1                                  ; $09FA9E |/
  getbh                                     ; $09FA9F |\
  add   r9                                  ; $09FAA1 | | page base + page offset + object offset =
  to r14                                    ; $09FAA2 | | full MAP16 ROM address
  add   r7                                  ; $09FAA3 |/
  getb                                      ; $09FAA4 |\
  inc   r14                                 ; $09FAA5 | |
  stb   (r4)                                ; $09FAA6 | |
  inc   r4                                  ; $09FAA8 | |
  getb                                      ; $09FAA9 | |
  inc   r14                                 ; $09FAAA | |
  stb   (r4)                                ; $09FAAB | |
  inc   r4                                  ; $09FAAD | |
  getb                                      ; $09FAAE | |
  inc   r14                                 ; $09FAAF | |
  stb   (r4)                                ; $09FAB0 | | store VRAM tilemaps
  inc   r4                                  ; $09FAB2 | | at current spot
  getb                                      ; $09FAB3 | | within "new row" tables
  inc   r14                                 ; $09FAB4 | | r4 = top half
  stb   (r4)                                ; $09FAB5 | | r5 = bottom half
  inc   r4                                  ; $09FAB7 | |
  getb                                      ; $09FAB8 | |
  inc   r14                                 ; $09FAB9 | |
  stb   (r5)                                ; $09FABA | |
  inc   r5                                  ; $09FABC | |
  getb                                      ; $09FABD | |
  inc   r14                                 ; $09FABE | |
  stb   (r5)                                ; $09FABF | |
  inc   r5                                  ; $09FAC1 | |
  getb                                      ; $09FAC2 | |
  inc   r14                                 ; $09FAC3 | |
  stb   (r5)                                ; $09FAC4 | |
  inc   r5                                  ; $09FAC6 | |
  getb                                      ; $09FAC7 | |
  inc   r14                                 ; $09FAC8 | |
  stb   (r5)                                ; $09FAC9 | |
  loop                                      ; $09FACB | |
  inc   r5                                  ; $09FACC |/
  jmp   r11                                 ; $09FACD |\ return
  nop                                       ; $09FACE |/

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FACF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FAD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FADF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FAE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FAEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FAF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FAFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FB9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FBFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FC9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FCFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FD9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FDFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FE9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FECF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FED7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEF7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FEFF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF07 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF0F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF17 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF1F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF27 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF2F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF37 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF3F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF47 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF4F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF57 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF5F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF67 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF6F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF77 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF7F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF87 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF8F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF97 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FF9F |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFA7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFAF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFB7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFBF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFC7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFCF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFD7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFDF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFE7 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFEF |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $09FFF7 |
  db $FF                                    ; $09FFFF |
