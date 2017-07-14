org $0A8000

; decompresses LC_LZ16 graphics files
; parameters:
; r0 = bank of gfx file
; r1 = address of gfx file
; r3 = destination uncompressed size
gsu_decompress_lc_lz16:
  romb                                      ; $0A8000 | r0 -> rom bank
  sm    ($0080),r0                          ; $0A8002 |
  move  r14,r1                              ; $0A8006 |
  ibt   r0,#$0011                           ; $0A8008 |
  cmode                                     ; $0A800A |
  ibt   r2,#$0000                           ; $0A800C |
  iwt   r4,#$0F0F                           ; $0A800E |
  getb                                      ; $0A8011 |
  add   r0                                  ; $0A8012 |
  add   r0                                  ; $0A8013 |
  add   r0                                  ; $0A8014 |
  to r6                                     ; $0A8015 |
  add   r0                                  ; $0A8016 |
  link  #4                                  ; $0A8017 |
  iwt   r15,#$81B3                          ; $0A8018 |
  getb                                      ; $0A801B |
  rol                                       ; $0A801C |
  or    r6                                  ; $0A801D |
  to r6                                     ; $0A801E |
  and   r4                                  ; $0A801F |
  getb                                      ; $0A8020 |
  add   r0                                  ; $0A8021 |
  add   r0                                  ; $0A8022 |
  add   r0                                  ; $0A8023 |
  to r7                                     ; $0A8024 |
  add   r0                                  ; $0A8025 |
  link  #4                                  ; $0A8026 |
  iwt   r15,#$81B3                          ; $0A8027 |
  getb                                      ; $0A802A |
  rol                                       ; $0A802B |
  or    r7                                  ; $0A802C |
  to r7                                     ; $0A802D |
  and   r4                                  ; $0A802E |
  getb                                      ; $0A802F |
  add   r0                                  ; $0A8030 |
  add   r0                                  ; $0A8031 |
  add   r0                                  ; $0A8032 |
  to r8                                     ; $0A8033 |
  add   r0                                  ; $0A8034 |
  link  #4                                  ; $0A8035 |
  iwt   r15,#$81B3                          ; $0A8036 |
  getb                                      ; $0A8039 |
  rol                                       ; $0A803A |
  or    r8                                  ; $0A803B |
  to r8                                     ; $0A803C |
  and   r4                                  ; $0A803D |
  getb                                      ; $0A803E |
  to r9                                     ; $0A803F |
  and   r4                                  ; $0A8040 |
  sub   r0                                  ; $0A8041 |
  ibt   r1,#$0000                           ; $0A8042 |
  ibt   r12,#$0040                          ; $0A8044 |
  cache                                     ; $0A8046 |
  move  r13,r15                             ; $0A8047 |
  stw   (r1)                                ; $0A8049 |
  inc   r1                                  ; $0A804A |
  loop                                      ; $0A804B |
  inc   r1                                  ; $0A804C |
  dec   r1                                  ; $0A804D |
  link  #4                                  ; $0A804E |
  iwt   r15,#$81B3                          ; $0A804F |
  getb                                      ; $0A8052 |
  ibt   r10,#$0005                          ; $0A8053 |
  lsr                                       ; $0A8055 |
  lsr                                       ; $0A8056 |
  iwt   r15,#$8116                          ; $0A8057 |
  lsr                                       ; $0A805A |

CODE_0A805B:
  bne CODE_0A8063                           ; $0A805B |
  lsr                                       ; $0A805D |
  link  #4                                  ; $0A805E |
  iwt   r15,#$81B3                          ; $0A805F |
  getb                                      ; $0A8062 |

CODE_0A8063:
  move  r4,r0                               ; $0A8063 |
  to r5                                     ; $0A8065 |
  ldb   (r1)                                ; $0A8066 |
  bcs CODE_0A8085                           ; $0A8068 |
  dec   r1                                  ; $0A806A |

CODE_0A806B:
  ldb   (r1)                                ; $0A806B |
  cmp   r5                                  ; $0A806D |
  beq CODE_0A806B                           ; $0A806F |
  dec   r1                                  ; $0A8071 |
  inc   r1                                  ; $0A8072 |
  move  r13,r15                             ; $0A8073 |
  from r5                                   ; $0A8075 |
  stb   (r1)                                ; $0A8076 |
  loop                                      ; $0A8078 |
  dec   r1                                  ; $0A8079 |
  bpl CODE_0A8091+1                         ; $0A807A |
  alt1                                      ; $0A807C |
  nop                                       ; $0A807D |
  bra CODE_0A80EC                           ; $0A807E |
  inc   r1                                  ; $0A8080 |

CODE_0A8081:
  and   r1                                  ; $0A8081 |
  bra CODE_0A808F                           ; $0A8082 |
  sub   r0                                  ; $0A8084 |

CODE_0A8085:
  bmi CODE_0A8081                           ; $0A8085 |
  ldb   (r1)                                ; $0A8087 |
  cmp   r5                                  ; $0A8089 |
  beq CODE_0A8085                           ; $0A808B |
  dec   r1                                  ; $0A808D |
  inc   r1                                  ; $0A808E |

CODE_0A808F:
  with r1                                   ; $0A808F |
  add   r12                                 ; $0A8090 |

CODE_0A8091:
  stb   (r1)                                ; $0A8091 |
  move  r0,r4                               ; $0A8093 |

CODE_0A8095:
  ibt   r12,#$0000                          ; $0A8095 |
  ibt   r4,#$0001                           ; $0A8097 |
  bra CODE_0A80AC                           ; $0A8099 |
  dec   r10                                 ; $0A809B |

CODE_0A809C:
  dec   r10                                 ; $0A809C |
  bne CODE_0A80A5                           ; $0A809D |
  lsr                                       ; $0A809F |
  link  #4                                  ; $0A80A0 |
  iwt   r15,#$81B3                          ; $0A80A1 |
  getb                                      ; $0A80A4 |

CODE_0A80A5:
  bcc CODE_0A80A9                           ; $0A80A5 |
  with r12                                  ; $0A80A7 |
  or    r4                                  ; $0A80A8 |

CODE_0A80A9:
  with r4                                   ; $0A80A9 |
  add   r4                                  ; $0A80AA |
  dec   r10                                 ; $0A80AB |

CODE_0A80AC:
  bne CODE_0A80B4                           ; $0A80AC |
  lsr                                       ; $0A80AE |
  link  #4                                  ; $0A80AF |
  iwt   r15,#$81B3                          ; $0A80B0 |
  getb                                      ; $0A80B3 |

CODE_0A80B4:
  bcs CODE_0A809C                           ; $0A80B4 |
  with r12                                  ; $0A80B6 |
  or    r4                                  ; $0A80B7 |
  moves r9,r9                               ; $0A80B8 |
  bpl CODE_0A8128                           ; $0A80BA |
  dec   r10                                 ; $0A80BC |
  bne CODE_0A80C5                           ; $0A80BD |
  lsr                                       ; $0A80BF |
  link  #4                                  ; $0A80C0 |
  iwt   r15,#$81B3                          ; $0A80C1 |
  getb                                      ; $0A80C4 |

CODE_0A80C5:
  bcs CODE_0A805B                           ; $0A80C5 |
  dec   r10                                 ; $0A80C7 |
  bne CODE_0A80D0                           ; $0A80C8 |
  lsr                                       ; $0A80CA |
  link  #4                                  ; $0A80CB |
  iwt   r15,#$81B3                          ; $0A80CC |
  getb                                      ; $0A80CF |

CODE_0A80D0:
  bcs CODE_0A8126+1                         ; $0A80D0 |
  move  r4,r0                               ; $0A80D2 |
  move  r13,r15                             ; $0A80D4 |
  to r5                                     ; $0A80D6 |
  ldb   (r1)                                ; $0A80D7 |
  dec   r1                                  ; $0A80D9 |

CODE_0A80DA:
  bmi CODE_0A80EB                           ; $0A80DA |
  ldb   (r1)                                ; $0A80DC |
  cmp   r5                                  ; $0A80DE |
  beq CODE_0A80DA                           ; $0A80E0 |
  dec   r1                                  ; $0A80E2 |
  loop                                      ; $0A80E3 |
  inc   r1                                  ; $0A80E4 |
  move  r0,r4                               ; $0A80E5 |
  bra CODE_0A8095+1                         ; $0A80E7 |
  db $AC                                    ; $0A80E9 | ibt #$xx

CODE_0A80EA:
  to r4                                     ; $0A80EA |

CODE_0A80EB:
  inc   r1                                  ; $0A80EB |

CODE_0A80EC:
  iwt   r12,#$0080                          ; $0A80EC |
  move  r13,r15                             ; $0A80EF |
  ldb   (r1)                                ; $0A80F1 |
  color                                     ; $0A80F3 |
  loop                                      ; $0A80F4 |
  plot                                      ; $0A80F5 |
  inc   r2                                  ; $0A80F6 |
  from r2                                   ; $0A80F7 |
  cmp   r3                                  ; $0A80F8 |
  bcc CODE_0A8113                           ; $0A80FA |
  dec   r1                                  ; $0A80FC |
  rpix                                      ; $0A80FD |
  stop                                      ; $0A80FF |
  nop                                       ; $0A8100 |

CODE_0A8101:
  to r5                                     ; $0A8101 |
  swap                                      ; $0A8102 |
  with r5                                   ; $0A8103 |
  and   #15                                 ; $0A8104 |

CODE_0A8106:
  move  r13,r15                             ; $0A8106 |
  from r5                                   ; $0A8108 |
  stb   (r1)                                ; $0A8109 |
  loop                                      ; $0A810B |
  dec   r1                                  ; $0A810C |
  bpl CODE_0A8095+1                         ; $0A810D |
  ibt   r12,#$0000                          ; $0A810F |
  bra CODE_0A80EA                           ; $0A8111 |
  with r0                                   ; $0A8112 |

CODE_0A8113:
  move  r0,r4                               ; $0A8113 |
  with r9                                   ; $0A8116 |
  rol                                       ; $0A8117 |
  dec   r10                                 ; $0A8118 |
  bne CODE_0A8121                           ; $0A8119 |
  lsr                                       ; $0A811B |
  link  #4                                  ; $0A811C |
  iwt   r15,#$81B3                          ; $0A811D |
  getb                                      ; $0A8120 |

CODE_0A8121:
  with r9                                   ; $0A8121 |
  ror                                       ; $0A8122 |
  iwt   r15,#$8096                          ; $0A8123 |

CODE_0A8126:
  ibt   r12,#$FFEA                          ; $0A8126 |

CODE_0A8128:
  bne CODE_0A8130                           ; $0A8128 |
  lsr                                       ; $0A812A |
  link  #4                                  ; $0A812B |
  iwt   r15,#$81B3                          ; $0A812C |
  getb                                      ; $0A812F |

CODE_0A8130:
  bcs CODE_0A814C                           ; $0A8130 |
  dec   r10                                 ; $0A8132 |
  bne CODE_0A813A                           ; $0A8133 |
  lsr                                       ; $0A8135 |
  link  #3                                  ; $0A8136 |
  bra CODE_0A81B3                           ; $0A8137 |
  getb                                      ; $0A8139 |

CODE_0A813A:
  bcs CODE_0A8165                           ; $0A813A |
  dec   r10                                 ; $0A813C |
  bne CODE_0A8144                           ; $0A813D |
  lsr                                       ; $0A813F |
  link  #3                                  ; $0A8140 |
  bra CODE_0A81B3                           ; $0A8141 |
  getb                                      ; $0A8143 |

CODE_0A8144:
  bcs CODE_0A8101                           ; $0A8144 |
  from r6                                   ; $0A8146 |
  to r5                                     ; $0A8147 |
  alt2                                      ; $0A8148 |
  bra CODE_0A8106                           ; $0A8149 |
  and   r15                                 ; $0A814B |

CODE_0A814C:
  bne CODE_0A8153                           ; $0A814C |
  lsr                                       ; $0A814E |
  link  #3                                  ; $0A814F |
  bra CODE_0A81B3                           ; $0A8150 |
  getb                                      ; $0A8152 |

CODE_0A8153:
  bcs CODE_0A8174                           ; $0A8153 |
  dec   r10                                 ; $0A8155 |
  bne CODE_0A815D                           ; $0A8156 |
  lsr                                       ; $0A8158 |
  link  #3                                  ; $0A8159 |
  bra CODE_0A81B3                           ; $0A815A |
  getb                                      ; $0A815C |

CODE_0A815D:
  bcs CODE_0A8101                           ; $0A815D |
  from r8                                   ; $0A815F |
  to r5                                     ; $0A8160 |
  alt2                                      ; $0A8161 |
  bra CODE_0A8106                           ; $0A8162 |
  and   r15                                 ; $0A8164 |

CODE_0A8165:
  bne CODE_0A816C                           ; $0A8165 |
  lsr                                       ; $0A8167 |
  link  #3                                  ; $0A8168 |
  bra CODE_0A81B3                           ; $0A8169 |
  getb                                      ; $0A816B |

CODE_0A816C:
  bcs CODE_0A8101                           ; $0A816C |
  from r7                                   ; $0A816E |
  to r5                                     ; $0A816F |
  alt2                                      ; $0A8170 |
  bra CODE_0A8106                           ; $0A8171 |
  and   r15                                 ; $0A8173 |

CODE_0A8174:
  bne CODE_0A817B                           ; $0A8174 |
  lsr                                       ; $0A8176 |
  link  #3                                  ; $0A8177 |
  bra CODE_0A81B3                           ; $0A8178 |
  getb                                      ; $0A817A |

CODE_0A817B:
  bcs CODE_0A8185                           ; $0A817B |
  from r9                                   ; $0A817D |
  to r5                                     ; $0A817E |
  and   #15                                 ; $0A817F |
  iwt   r15,#$8107                          ; $0A8181 |
  with r15                                  ; $0A8184 |

CODE_0A8185:
  ibt   r5,#$0000                           ; $0A8185 |
  dec   r10                                 ; $0A8187 |
  bne CODE_0A818F                           ; $0A8188 |
  lsr                                       ; $0A818A |
  link  #3                                  ; $0A818B |
  bra CODE_0A81B3                           ; $0A818C |
  getb                                      ; $0A818E |

CODE_0A818F:
  with r5                                   ; $0A818F |
  rol                                       ; $0A8190 |
  dec   r10                                 ; $0A8191 |
  bne CODE_0A8199                           ; $0A8192 |
  lsr                                       ; $0A8194 |
  link  #3                                  ; $0A8195 |
  bra CODE_0A81B3                           ; $0A8196 |
  getb                                      ; $0A8198 |

CODE_0A8199:
  with r5                                   ; $0A8199 |
  rol                                       ; $0A819A |
  dec   r10                                 ; $0A819B |
  bne CODE_0A81A3                           ; $0A819C |
  lsr                                       ; $0A819E |
  link  #3                                  ; $0A819F |
  bra CODE_0A81B3                           ; $0A81A0 |
  getb                                      ; $0A81A2 |

CODE_0A81A3:
  with r5                                   ; $0A81A3 |
  rol                                       ; $0A81A4 |
  dec   r10                                 ; $0A81A5 |
  bne CODE_0A81AD                           ; $0A81A6 |
  lsr                                       ; $0A81A8 |
  link  #3                                  ; $0A81A9 |
  bra CODE_0A81B3                           ; $0A81AA |
  getb                                      ; $0A81AC |

CODE_0A81AD:
  with r5                                   ; $0A81AD |
  rol                                       ; $0A81AE |
  iwt   r15,#$8107                          ; $0A81AF |
  with r15                                  ; $0A81B2 |

; decompression subroutine
CODE_0A81B3:
  inc   r14                                 ; $0A81B3 |
  bne CODE_0A81C4+1                         ; $0A81B4 |
  ibt   r10,#$0008                          ; $0A81B6 |
  lm    r10,($0080)                         ; $0A81B8 |
  inc   r10                                 ; $0A81BC |
  from r10                                  ; $0A81BD |
  sbk                                       ; $0A81BE |
  from r10                                  ; $0A81BF |
  romb                                      ; $0A81C0 |
  ibt   r14,#$0000                          ; $0A81C2 |

CODE_0A81C4:
  ibt   r10,#$0008                          ; $0A81C4 |
  move  r15,r11                             ; $0A81C6 |\ return
  lsr                                       ; $0A81C8 |/

; salvo routine
  with r2                                   ; $0A81C9 |
  sub   #8                                  ; $0A81CA |
  with r3                                   ; $0A81CC |
  sub   #8                                  ; $0A81CD |
  ibt   r0,#$000A                           ; $0A81CF |
  romb                                      ; $0A81D1 |
  iwt   r14,#$860E                          ; $0A81D3 |
  getb                                      ; $0A81D6 |
  sms   ($0020),r0                          ; $0A81D7 |
  to r10                                    ; $0A81DA |
  swap                                      ; $0A81DB |
  iwt   r9,#$00D1                           ; $0A81DC |
  lms   r0,($0002)                          ; $0A81DF |
  to r1                                     ; $0A81E2 |
  sub   #8                                  ; $0A81E3 |
  iwt   r0,#$2200                           ; $0A81E5 |
  lms   r8,($0006)                          ; $0A81E8 |
  add   r8                                  ; $0A81EB |
  add   r8                                  ; $0A81EC |
  to r8                                     ; $0A81ED |
  ldw   (r0)                                ; $0A81EE |
  sms   ($0022),r8                          ; $0A81EF |
  cache                                     ; $0A81F2 |
  lms   r0,($0000)                          ; $0A81F3 |
  sms   ($0024),r0                          ; $0A81F6 |
  ibt   r11,#$0060                          ; $0A81F9 |
  add   r11                                 ; $0A81FB |
  iwt   r11,#$01C0                          ; $0A81FC |
  sub   r11                                 ; $0A81FF |
  bcc CODE_0A820E                           ; $0A8200 |
  nop                                       ; $0A8202 |
  ibt   r0,#$FF80                           ; $0A8203 |
  sms   ($0024),r0                          ; $0A8205 |
  iwt   r15,#$82FD                          ; $0A8208 |
  lms   r0,($0020)                          ; $0A820B |

CODE_0A820E:
  iwt   r11,#$3514                          ; $0A820E |
  iwt   r13,#$00D0                          ; $0A8211 |
  from r13                                  ; $0A8214 |
  sub   r1                                  ; $0A8215 |
  bpl CODE_0A8223                           ; $0A8216 |
  to r6                                     ; $0A8218 |
  not                                       ; $0A8219 |
  inc   r6                                  ; $0A821A |
  from r8                                   ; $0A821B |
  lmult                                     ; $0A821C |
  with r10                                  ; $0A821E |
  sub   r4                                  ; $0A821F |
  bra CODE_0A8242                           ; $0A8220 |
  inc   r14                                 ; $0A8222 |

CODE_0A8223:
  move  r12,r0                              ; $0A8223 |
  from r13                                  ; $0A8225 |
  sub   r12                                 ; $0A8226 |
  bpl CODE_0A822D                           ; $0A8227 |
  inc   r12                                 ; $0A8229 |
  move  r12,r13                             ; $0A822A |
  inc   r12                                 ; $0A822C |

CODE_0A822D:
  with r9                                   ; $0A822D |
  sub   r12                                 ; $0A822E |
  iwt   r0,#$FF26                           ; $0A822F |
  move  r13,r15                             ; $0A8232 |
  stw   (r11)                               ; $0A8234 |
  dec   r11                                 ; $0A8235 |
  dec   r11                                 ; $0A8236 |
  loop                                      ; $0A8237 |
  inc   r0                                  ; $0A8238 |
  bne CODE_0A8242                           ; $0A8239 |
  inc   r14                                 ; $0A823B |
  iwt   r15,#$82FD                          ; $0A823C |
  lms   r0,($0020)                          ; $0A823F |

CODE_0A8242:
  lms   r6,($0004)                          ; $0A8242 |
  move  r7,r14                              ; $0A8245 |
  from r9                                   ; $0A8247 |
  to r12                                    ; $0A8248 |
  sub   r2                                  ; $0A8249 |
  inc   r12                                 ; $0A824A |
  move  r13,r15                             ; $0A824B |
  with r10                                  ; $0A824D |
  sub   r8                                  ; $0A824E |
  bmi CODE_0A8270                           ; $0A824F |
  from r10                                  ; $0A8251 |
  hib                                       ; $0A8252 |
  to r14                                    ; $0A8253 |
  add   r7                                  ; $0A8254 |
  getb                                      ; $0A8255 |
  swap                                      ; $0A8256 |
  fmult                                     ; $0A8257 |
  inc   r0                                  ; $0A8258 |
  lsr                                       ; $0A8259 |
  move  r5,r0                               ; $0A825A |
  sub   r9                                  ; $0A825C |
  sub   #8                                  ; $0A825D |
  stw   (r11)                               ; $0A825F |
  dec   r11                                 ; $0A8260 |
  dec   r11                                 ; $0A8261 |
  loop                                      ; $0A8262 |
  dec   r9                                  ; $0A8263 |
  bpl CODE_0A826D                           ; $0A8264 |
  nop                                       ; $0A8266 |
  iwt   r15,#$82FD                          ; $0A8267 |
  lms   r0,($0020)                          ; $0A826A |

CODE_0A826D:
  bra CODE_0A8289                           ; $0A826D |
  from r2                                   ; $0A826F |

CODE_0A8270:
  from r9                                   ; $0A8270 |
  not                                       ; $0A8271 |
  sub   #8                                  ; $0A8272 |
  with r9                                   ; $0A8274 |
  sub   r12                                 ; $0A8275 |
  move  r13,r15                             ; $0A8276 |
  stw   (r11)                               ; $0A8278 |
  dec   r11                                 ; $0A8279 |
  dec   r11                                 ; $0A827A |
  loop                                      ; $0A827B |
  inc   r0                                  ; $0A827C |
  bne CODE_0A8286                           ; $0A827D |
  nop                                       ; $0A827F |
  iwt   r15,#$82FD                          ; $0A8280 |
  lms   r0,($0020)                          ; $0A8283 |

CODE_0A8286:
  ibt   r5,#$0000                           ; $0A8286 |
  from r2                                   ; $0A8288 |

CODE_0A8289:
  sub   r3                                  ; $0A8289 |
  move  r13,r0                              ; $0A828A |
  bpl CODE_0A8291                           ; $0A828C |
  nop                                       ; $0A828E |
  not                                       ; $0A828F |
  inc   r0                                  ; $0A8290 |

CODE_0A8291:
  move  r12,r0                              ; $0A8291 |
  iwt   r14,#$866F                          ; $0A8293 |
  ibt   r0,#$0022                           ; $0A8296 |
  cmp   r12                                 ; $0A8298 |
  bcs CODE_0A829F                           ; $0A829A |
  from r12                                  ; $0A829C |
  move  r12,r0                              ; $0A829D |

CODE_0A829F:
  sub   r9                                  ; $0A829F |
  bcc CODE_0A82A6                           ; $0A82A0 |
  inc   r12                                 ; $0A82A2 |
  move  r12,r9                              ; $0A82A3 |
  inc   r12                                 ; $0A82A5 |

CODE_0A82A6:
  with r14                                  ; $0A82A6 |
  add   r12                                 ; $0A82A7 |
  to r4                                     ; $0A82A8 |
  getb                                      ; $0A82A9 |
  with r5                                   ; $0A82AA |
  sub   r4                                  ; $0A82AB |
  ibt   r10,#$FFFF                          ; $0A82AC |
  moves r13,r13                             ; $0A82AE |
  bpl CODE_0A82BF                           ; $0A82B0 |
  dec   r14                                 ; $0A82B2 |
  inc   r14                                 ; $0A82B3 |
  ibt   r0,#$0023                           ; $0A82B4 |
  to r12                                    ; $0A82B6 |
  sub   r12                                 ; $0A82B7 |
  bne CODE_0A82DE                           ; $0A82B8 |
  inc   r14                                 ; $0A82BA |
  dec   r14                                 ; $0A82BB |
  bra CODE_0A82DE                           ; $0A82BC |
  inc   r12                                 ; $0A82BE |

CODE_0A82BF:
  move  r13,r15                             ; $0A82BF |
  getb                                      ; $0A82C1 |
  dec   r14                                 ; $0A82C2 |
  add   r5                                  ; $0A82C3 |
  bpl CODE_0A82C9                           ; $0A82C4 |
  nop                                       ; $0A82C6 |
  move  r0,r10                              ; $0A82C7 |

CODE_0A82C9:
  sub   r9                                  ; $0A82C9 |
  sub   #8                                  ; $0A82CA |
  stw   (r11)                               ; $0A82CC |
  dec   r11                                 ; $0A82CD |
  dec   r11                                 ; $0A82CE |
  loop                                      ; $0A82CF |
  dec   r9                                  ; $0A82D0 |
  bmi CODE_0A82FC                           ; $0A82D1 |
  inc   r14                                 ; $0A82D3 |
  ibt   r12,#$0023                          ; $0A82D4 |
  from r12                                  ; $0A82D6 |
  sub   r9                                  ; $0A82D7 |
  bcc CODE_0A82DE                           ; $0A82D8 |
  inc   r12                                 ; $0A82DA |
  move  r12,r9                              ; $0A82DB |
  inc   r12                                 ; $0A82DD |

CODE_0A82DE:
  move  r13,r15                             ; $0A82DE |
  getb                                      ; $0A82E0 |
  inc   r14                                 ; $0A82E1 |
  add   r5                                  ; $0A82E2 |
  bpl CODE_0A82E8                           ; $0A82E3 |
  nop                                       ; $0A82E5 |
  move  r0,r10                              ; $0A82E6 |

CODE_0A82E8:
  sub   r9                                  ; $0A82E8 |
  sub   #8                                  ; $0A82E9 |
  stw   (r11)                               ; $0A82EB |
  dec   r11                                 ; $0A82EC |
  dec   r11                                 ; $0A82ED |
  loop                                      ; $0A82EE |
  dec   r9                                  ; $0A82EF |
  bmi CODE_0A82FC                           ; $0A82F0 |
  inc   r9                                  ; $0A82F2 |
  move  r12,r9                              ; $0A82F3 |
  move  r13,r15                             ; $0A82F5 |
  inc   r0                                  ; $0A82F7 |
  stw   (r11)                               ; $0A82F8 |
  dec   r11                                 ; $0A82F9 |
  loop                                      ; $0A82FA |
  dec   r11                                 ; $0A82FB |

CODE_0A82FC:
  lms   r0,($0020)                          ; $0A82FC |
  swap                                      ; $0A82FF |
  lms   r6,($0006)                          ; $0A8300 |
  to r12                                    ; $0A8303 |
  fmult                                     ; $0A8304 |
  iwt   r7,#$3516                           ; $0A8305 |
  lms   r0,($0002)                          ; $0A8308 |
  sub   #8                                  ; $0A830B |
  move  r9,r0                               ; $0A830D |
  add   r7                                  ; $0A830F |
  to r1                                     ; $0A8310 |
  add   r9                                  ; $0A8311 |
  lms   r0,($0008)                          ; $0A8312 |
  to r2                                     ; $0A8315 |
  swap                                      ; $0A8316 |
  lms   r0,($000C)                          ; $0A8317 |
  lms   r6,($0022)                          ; $0A831A |
  lmult                                     ; $0A831D |
  lob                                       ; $0A831F |
  swap                                      ; $0A8320 |
  with r4                                   ; $0A8321 |
  hib                                       ; $0A8322 |
  to r3                                     ; $0A8323 |
  or    r4                                  ; $0A8324 |
  lms   r0,($000A)                          ; $0A8325 |
  lms   r6,($0004)                          ; $0A8328 |
  lmult                                     ; $0A832B |
  move  r6,r4                               ; $0A832D |
  iwt   r11,#$AC18                          ; $0A832F |
  iwt   r0,#$0080                           ; $0A8332 |
  lms   r5,($0024)                          ; $0A8335 |
  to r5                                     ; $0A8338 |
  sub   r5                                  ; $0A8339 |
  move  r8,r5                               ; $0A833A |
  ibt   r0,#$0008                           ; $0A833C |
  romb                                      ; $0A833E |
  move  r10,r9                              ; $0A8340 |
  iwt   r4,#$00D2                           ; $0A8342 |
  move  r13,r15                             ; $0A8345 |
  moves r0,r10                              ; $0A8347 |
  bmi CODE_0A8360                           ; $0A8349 |
  sub   r4                                  ; $0A834B |
  bcs CODE_0A835A                           ; $0A834C |
  from r2                                   ; $0A834E |
  hib                                       ; $0A834F |
  add   r0                                  ; $0A8350 |
  to r14                                    ; $0A8351 |
  add   r11                                 ; $0A8352 |
  getb                                      ; $0A8353 |
  inc   r14                                 ; $0A8354 |
  getbh                                     ; $0A8355 |
  fmult                                     ; $0A8357 |
  add   r5                                  ; $0A8358 |
  stw   (r1)                                ; $0A8359 |

CODE_0A835A:
  with r2                                   ; $0A835A |
  add   r3                                  ; $0A835B |
  dec   r1                                  ; $0A835C |
  dec   r1                                  ; $0A835D |
  loop                                      ; $0A835E |
  dec   r10                                 ; $0A835F |

CODE_0A8360:
  lms   r0,($000E)                          ; $0A8360 |
  swap                                      ; $0A8363 |
  lms   r6,($0004)                          ; $0A8364 |
  fmult                                     ; $0A8367 |
  to r2                                     ; $0A8368 |
  adc   #0                                  ; $0A8369 |
  lms   r0,($0010)                          ; $0A836B |
  swap                                      ; $0A836E |
  lms   r6,($0006)                          ; $0A836F |
  fmult                                     ; $0A8372 |
  adc   #0                                  ; $0A8373 |
  sms   ($0010),r0                          ; $0A8375 |
  add   r9                                  ; $0A8378 |
  move  r1,r0                               ; $0A8379 |
  sub   r4                                  ; $0A837B |
  bcs CODE_0A8386                           ; $0A837C |
  sub   r0                                  ; $0A837E |
  from r7                                   ; $0A837F |
  add   r1                                  ; $0A8380 |
  add   r1                                  ; $0A8381 |
  ldw   (r0)                                ; $0A8382 |
  sub   r8                                  ; $0A8383 |
  not                                       ; $0A8384 |
  inc   r0                                  ; $0A8385 |

CODE_0A8386:
  add   r2                                  ; $0A8386 |
  sms   ($000E),r0                          ; $0A8387 |
  iwt   r0,#$85E4                           ; $0A838A |
  sms   ($0020),r0                          ; $0A838D |

  link  #4                                  ; $0A8390 |
  iwt   r15,#$84F2                          ; $0A8391 |
  cache                                     ; $0A8394 |
  iwt   r1,#$0F00                           ; $0A8395 |
  iwt   r2,#$1D38                           ; $0A8398 |
  iwt   r3,#$1CD6                           ; $0A839B |
  iwt   r0,#$1D37                           ; $0A839E |
  lms   r4,($0012)                          ; $0A83A1 |
  add   r4                                  ; $0A83A4 |
  ldb   (r0)                                ; $0A83A5 |
  add   r0                                  ; $0A83A7 |
  to r4                                     ; $0A83A8 |
  add   r0                                  ; $0A83A9 |
  lm    r10,($0094)                         ; $0A83AA |
  ibt   r12,#$0018                          ; $0A83AE |
  lm    r0,($009C)                          ; $0A83B0 |
  to r11                                    ; $0A83B4 |
  add   #8                                  ; $0A83B5 |
  cache                                     ; $0A83B7 |
  iwt   r13,#$83BC                          ; $0A83B8 |
  with r4                                   ; $0A83BB |
  sub   #4                                  ; $0A83BC |
  bpl CODE_0A83C4                           ; $0A83BE |
  from r1                                   ; $0A83C0 |
  ibt   r4,#$005C                           ; $0A83C1 |
  from r1                                   ; $0A83C3 |

CODE_0A83C4:
  add   r4                                  ; $0A83C4 |
  ldb   (r0)                                ; $0A83C5 |
  sub   #14                                 ; $0A83C7 |
  bcc CODE_0A8400                           ; $0A83C9 |
  from r2                                   ; $0A83CB |
  add   r4                                  ; $0A83CC |
  ldw   (r0)                                ; $0A83CD |
  sub   #0                                  ; $0A83CE |
  beq CODE_0A8400                           ; $0A83D0 |
  from r3                                   ; $0A83D2 |
  add   r4                                  ; $0A83D3 |
  to r14                                    ; $0A83D4 |
  ldw   (r0)                                ; $0A83D5 |
  with r14                                  ; $0A83D6 |
  sub   r10                                 ; $0A83D7 |
  inc   r0                                  ; $0A83D8 |
  inc   r0                                  ; $0A83D9 |
  ldw   (r0)                                ; $0A83DA |
  sub   r11                                 ; $0A83DB |
  sub   r5                                  ; $0A83DC |
  bcs CODE_0A8400                           ; $0A83DD |
  add   r5                                  ; $0A83DF |
  move  r9,r0                               ; $0A83E0 |
  add   r0                                  ; $0A83E2 |
  add   r6                                  ; $0A83E3 |
  ldw   (r0)                                ; $0A83E4 |
  add   r9                                  ; $0A83E5 |
  add   #9                                  ; $0A83E6 |
  to r8                                     ; $0A83E8 |
  lob                                       ; $0A83E9 |
  from r7                                   ; $0A83EA |
  add   r9                                  ; $0A83EB |
  add   r9                                  ; $0A83EC |
  to r9                                     ; $0A83ED |
  ldw   (r0)                                ; $0A83EE |
  iwt   r0,#$0080                           ; $0A83EF |
  sub   r9                                  ; $0A83F2 |
  sub   r14                                 ; $0A83F3 |
  move  r14,r0                              ; $0A83F4 |
  bpl CODE_0A83FB                           ; $0A83F6 |
  nop                                       ; $0A83F8 |
  not                                       ; $0A83F9 |
  inc   r0                                  ; $0A83FA |

CODE_0A83FB:
  add   r0                                  ; $0A83FB |
  sub   r8                                  ; $0A83FC |
  bcc CODE_0A8412                           ; $0A83FD |
  nop                                       ; $0A83FF |

CODE_0A8400:
  loop                                      ; $0A8400 |
  with r4                                   ; $0A8401 |
  lms   r0,($0012)                          ; $0A8402 |
  iwt   r1,#$1D36                           ; $0A8405 |
  to r1                                     ; $0A8408 |
  add   r1                                  ; $0A8409 |
  sub   r0                                  ; $0A840A |
  stb   (r1)                                ; $0A840B |
  bra CODE_0A8430+1                         ; $0A840D |

  lms   r0,($0000)                          ; $0A840F |

CODE_0A8412:
  lms   r1,($0012)                          ; $0A8412 |
  iwt   r0,#$1C76                           ; $0A8415 |
  add   r1                                  ; $0A8418 |
  with r14                                  ; $0A8419 |
  not                                       ; $0A841A |
  inc   r14                                 ; $0A841B |
  from r14                                  ; $0A841C |
  stw   (r0)                                ; $0A841D |
  iwt   r0,#$1D37                           ; $0A841E |
  to r2                                     ; $0A8421 |
  add   r1                                  ; $0A8422 |
  from r4                                   ; $0A8423 |
  lsr                                       ; $0A8424 |
  lsr                                       ; $0A8425 |
  stb   (r2)                                ; $0A8426 |
  iwt   r0,#$1D36                           ; $0A8428 |
  add   r1                                  ; $0A842B |
  inc   r4                                  ; $0A842C |
  from r4                                   ; $0A842D |
  stb   (r0)                                ; $0A842E |

CODE_0A8430:
  lms   r0,($0000)                          ; $0A8430 |
  lm    r10,($0094)                         ; $0A8433 |
  to r10                                    ; $0A8437 |
  add   r10                                 ; $0A8438 |
  lms   r9,($0012)                          ; $0A8439 |
  iwt   r0,#$1720                           ; $0A843C |
  add   r9                                  ; $0A843F |
  ldw   (r0)                                ; $0A8440 |
  lms   r9,($0002)                          ; $0A8441 |
  add   r9                                  ; $0A8444 |
  lm    r9,($009C)                          ; $0A8445 |
  to r9                                     ; $0A8449 |
  add   r9                                  ; $0A844A |
  lms   r12,($0004)                         ; $0A844B |
  lms   r13,($0006)                         ; $0A844E |
  ibt   r0,#$000A                           ; $0A8451 |
  romb                                      ; $0A8453 |
  lms   r14,($0020)                         ; $0A8455 |
  ibt   r2,#$0000                           ; $0A8458 |
  link  #4                                  ; $0A845A |
  iwt   r15,#$84BB                          ; $0A845B |
  getb                                      ; $0A845E |
  and   #2                                  ; $0A845F |
  beq CODE_0A8465                           ; $0A8461 |
  nop                                       ; $0A8463 |
  inc   r2                                  ; $0A8464 |

CODE_0A8465:
  with r2                                   ; $0A8465 |
  add   r2                                  ; $0A8466 |
  link  #4                                  ; $0A8467 |
  iwt   r15,#$84BB                          ; $0A8468 |
  getb                                      ; $0A846B |
  and   #2                                  ; $0A846C |
  beq CODE_0A8472                           ; $0A846E |
  nop                                       ; $0A8470 |
  inc   r2                                  ; $0A8471 |

CODE_0A8472:
  with r2                                   ; $0A8472 |
  add   r2                                  ; $0A8473 |
  link  #4                                  ; $0A8474 |
  iwt   r15,#$84BB                          ; $0A8475 |
  getb                                      ; $0A8478 |
  and   #2                                  ; $0A8479 |
  beq CODE_0A847F                           ; $0A847B |
  nop                                       ; $0A847D |
  inc   r2                                  ; $0A847E |

CODE_0A847F:
  with r2                                   ; $0A847F |
  add   r2                                  ; $0A8480 |
  link  #4                                  ; $0A8481 |
  iwt   r15,#$84BB                          ; $0A8482 |
  getb                                      ; $0A8485 |
  and   #2                                  ; $0A8486 |
  beq CODE_0A848C                           ; $0A8488 |
  nop                                       ; $0A848A |
  inc   r2                                  ; $0A848B |

CODE_0A848C:
  with r2                                   ; $0A848C |
  add   r2                                  ; $0A848D |
  link  #4                                  ; $0A848E |
  iwt   r15,#$84BB                          ; $0A848F |
  getb                                      ; $0A8492 |
  and   #2                                  ; $0A8493 |
  beq CODE_0A8499                           ; $0A8495 |
  nop                                       ; $0A8497 |
  inc   r2                                  ; $0A8498 |

CODE_0A8499:
  lms   r0,($0002)                          ; $0A8499 |
  sms   ($0020),r0                          ; $0A849C |
  with r2                                   ; $0A849F |
  add   r2                                  ; $0A84A0 |
  iwt   r13,#$0100                          ; $0A84A1 |
  link  #4                                  ; $0A84A4 |
  iwt   r15,#$84BB                          ; $0A84A5 |
  getb                                      ; $0A84A8 |
  and   #3                                  ; $0A84A9 |
  beq CODE_0A84AF                           ; $0A84AB |
  nop                                       ; $0A84AD |
  inc   r2                                  ; $0A84AE |

CODE_0A84AF:
  iwt   r0,#$1860                           ; $0A84AF |
  lms   r1,($0012)                          ; $0A84B2 |
  add   r1                                  ; $0A84B5 |
  from r2                                   ; $0A84B6 |
  stw   (r0)                                ; $0A84B7 |
  sub   r0                                  ; $0A84B8 |
  stop                                      ; $0A84B9 |
  nop                                       ; $0A84BA |

  inc   r14                                 ; $0A84BB |
  swap                                      ; $0A84BC |
  move  r6,r12                              ; $0A84BD |
  fmult                                     ; $0A84BF |
  to r8                                     ; $0A84C0 |
  add   r10                                 ; $0A84C1 |
  getb                                      ; $0A84C2 |
  inc   r14                                 ; $0A84C3 |
  swap                                      ; $0A84C4 |
  move  r6,r13                              ; $0A84C5 |
  fmult                                     ; $0A84C7 |
  add   r9                                  ; $0A84C8 |
  move  r7,r0                               ; $0A84C9 |
  lm    r6,($009C)                          ; $0A84CB |
  sub   r6                                  ; $0A84CF |
  sub   #8                                  ; $0A84D0 |
  iwt   r6,#$00D2                           ; $0A84D2 |
  cmp   r6                                  ; $0A84D5 |
  bcs CODE_0A84EC                           ; $0A84D7 |
  from r8                                   ; $0A84D9 |
  iwt   r6,#$3516                           ; $0A84DA |
  add   r0                                  ; $0A84DD |
  add   r6                                  ; $0A84DE |
  to r6                                     ; $0A84DF |
  ldw   (r0)                                ; $0A84E0 |
  iwt   r0,#$0080                           ; $0A84E1 |
  sub   r6                                  ; $0A84E4 |
  lms   r6,($0024)                          ; $0A84E5 |
  sub   r6                                  ; $0A84E8 |
  add   r8                                  ; $0A84E9 |
  move  r8,r0                               ; $0A84EA |

CODE_0A84EC:
  move  r0,r7                               ; $0A84EC |
  iwt   r15,#$D096                          ; $0A84EE |
  to r7                                     ; $0A84F1 |
  iwt   r0,#$00FF                           ; $0A84F2 |
  sms   ($0060),r11                         ; $0A84F5 |
  move  r11,r0                              ; $0A84F8 |
  ibt   r0,#$000A                           ; $0A84FA |
  romb                                      ; $0A84FC |
  iwt   r14,#$85F0                          ; $0A84FE |
  lms   r0,($0018)                          ; $0A8501 |
  sub   #0                                  ; $0A8504 |
  beq CODE_0A850B                           ; $0A8506 |
  with r14                                  ; $0A8508 |
  add   #10                                 ; $0A8509 |

CODE_0A850B:
  lms   r1,($0014)                          ; $0A850B |
  lms   r0,($0016)                          ; $0A850E |
  to r2                                     ; $0A8511 |
  sub   #8                                  ; $0A8512 |
  iwt   r5,#$00D2                           ; $0A8514 |
  iwt   r6,#$3372                           ; $0A8517 |
  iwt   r7,#$3516                           ; $0A851A |
  iwt   r3,#$0080                           ; $0A851D |
  ibt   r10,#$0000                          ; $0A8520 |
  ibt   r12,#$0005                          ; $0A8522 |
  iwt   r13,#$8528                          ; $0A8524 |
  with r10                                  ; $0A8527 |
  add   r10                                 ; $0A8528 |
  getbs                                     ; $0A8529 |
  inc   r14                                 ; $0A852B |
  to r4                                     ; $0A852C |
  add   r1                                  ; $0A852D |
  getbs                                     ; $0A852E |
  inc   r14                                 ; $0A8530 |
  add   r2                                  ; $0A8531 |
  sub   r5                                  ; $0A8532 |
  bcs CODE_0A8552                           ; $0A8533 |
  add   r5                                  ; $0A8535 |
  move  r9,r0                               ; $0A8536 |
  add   r0                                  ; $0A8538 |
  add   r6                                  ; $0A8539 |
  ldw   (r0)                                ; $0A853A |
  add   r9                                  ; $0A853B |
  add   #9                                  ; $0A853C |
  to r8                                     ; $0A853E |
  and   r11                                 ; $0A853F |
  from r7                                   ; $0A8540 |
  add   r9                                  ; $0A8541 |
  add   r9                                  ; $0A8542 |
  ldw   (r0)                                ; $0A8543 |
  from r3                                   ; $0A8544 |
  sub   r0                                  ; $0A8545 |
  sub   r4                                  ; $0A8546 |
  bpl CODE_0A854C                           ; $0A8547 |
  nop                                       ; $0A8549 |
  not                                       ; $0A854A |
  inc   r0                                  ; $0A854B |

CODE_0A854C:
  add   r0                                  ; $0A854C |
  sub   r8                                  ; $0A854D |
  bcs CODE_0A8552                           ; $0A854E |
  nop                                       ; $0A8550 |
  inc   r10                                 ; $0A8551 |

CODE_0A8552:
  loop                                      ; $0A8552 |
  with r10                                  ; $0A8553 |
  sms   ($0014),r10                         ; $0A8554 |
  from r10                                  ; $0A8557 |
  lsr                                       ; $0A8558 |
  bcc CODE_0A85AB                           ; $0A8559 |
  sub   r0                                  ; $0A855B |
  move  r1,r0                               ; $0A855C |

CODE_0A855E:
  dec   r9                                  ; $0A855E |
  bmi CODE_0A8582                           ; $0A855F |
  from r1                                   ; $0A8561 |
  add   #10                                 ; $0A8562 |
  bmi CODE_0A8582                           ; $0A8564 |
  from r9                                   ; $0A8566 |
  add   r9                                  ; $0A8567 |
  add   r6                                  ; $0A8568 |
  ldw   (r0)                                ; $0A8569 |
  add   r9                                  ; $0A856A |
  add   #9                                  ; $0A856B |
  to r8                                     ; $0A856D |
  and   r11                                 ; $0A856E |
  from r7                                   ; $0A856F |
  add   r9                                  ; $0A8570 |
  add   r9                                  ; $0A8571 |
  ldw   (r0)                                ; $0A8572 |
  from r3                                   ; $0A8573 |
  sub   r0                                  ; $0A8574 |
  sub   r4                                  ; $0A8575 |
  move  r2,r0                               ; $0A8576 |
  bpl CODE_0A857D                           ; $0A8578 |
  nop                                       ; $0A857A |
  not                                       ; $0A857B |
  inc   r0                                  ; $0A857C |

CODE_0A857D:
  add   r0                                  ; $0A857D |
  sub   r8                                  ; $0A857E |
  bcc CODE_0A855E                           ; $0A857F |
  dec   r1                                  ; $0A8581 |

CODE_0A8582:
  sms   ($0016),r1                          ; $0A8582 |
  from r9                                   ; $0A8585 |
  add   #2                                  ; $0A8586 |
  cmp   r5                                  ; $0A8588 |
  bcs CODE_0A8595                           ; $0A858A |
  from r8                                   ; $0A858C |
  from r0                                   ; $0A858D |
  add   r0                                  ; $0A858E |
  add   r6                                  ; $0A858F |
  ldw   (r0)                                ; $0A8590 |
  add   r9                                  ; $0A8591 |
  add   #9                                  ; $0A8592 |
  and   r11                                 ; $0A8594 |

CODE_0A8595:
  sub   r8                                  ; $0A8595 |
  lsr                                       ; $0A8596 |
  ibt   r3,#$0004                           ; $0A8597 |
  cmp   r3                                  ; $0A8599 |
  bcc CODE_0A85A0                           ; $0A859B |
  nop                                       ; $0A859D |
  move  r0,r3                               ; $0A859E |

CODE_0A85A0:
  moves r2,r2                               ; $0A85A0 |
  bpl CODE_0A85A7                           ; $0A85A2 |
  nop                                       ; $0A85A4 |
  add   #5                                  ; $0A85A5 |

CODE_0A85A7:
  add   r0                                  ; $0A85A7 |
  sms   ($0018),r0                          ; $0A85A8 |

CODE_0A85AB:
  iwt   r0,#$8604                           ; $0A85AB |
  sub   r14                                 ; $0A85AE |
  bcc CODE_0A85DF                           ; $0A85AF |
  to r14                                    ; $0A85B1 |
  add   r14                                 ; $0A85B2 |
  lms   r0,($0014)                          ; $0A85B3 |
  sms   ($001A),r0                          ; $0A85B6 |
  lms   r0,($0016)                          ; $0A85B9 |
  sms   ($001C),r0                          ; $0A85BC |
  lms   r0,($0018)                          ; $0A85BF |
  sms   ($001E),r0                          ; $0A85C2 |
  lms   r0,($01CC)                          ; $0A85C5 |
  sub   #0                                  ; $0A85C8 |
  beq CODE_0A85D3                           ; $0A85CA |
  sub   r0                                  ; $0A85CC |
  sms   ($0014),r0                          ; $0A85CD |
  bra CODE_0A85DF                           ; $0A85D0 |
  nop                                       ; $0A85D2 |

CODE_0A85D3:
  lm    r1,($1680)                          ; $0A85D3 |
  lm    r0,($1682)                          ; $0A85D7 |
  iwt   r15,#$8512                          ; $0A85DB |
  to r2                                     ; $0A85DE |

CODE_0A85DF:
  lms   r11,($0060)                         ; $0A85DF |
  jmp   r11                                 ; $0A85E2 |
  nop                                       ; $0A85E3 |

  db $EA, $C0, $0E, $C0, $E0, $F0, $18, $F0 ; $0A85E4 |
  db $00, $B0, $00, $00, $02, $04, $0E, $04 ; $0A85EC |
  db $02, $14, $0E, $14, $08, $20, $02, $12 ; $0A85F4 |
  db $0E, $12, $02, $14, $0E, $14, $08, $20 ; $0A85FC |

  db $02, $02, $0E, $02, $02, $0A, $0E, $0A ; $0A8604 |
  db $08, $10, $60, $00, $16, $1F, $26, $2C ; $0A860C |
  db $31, $36, $3A, $3D, $41, $44, $47, $4A ; $0A8614 |
  db $4D, $4F, $52, $54, $56, $58, $5B, $5C ; $0A861C |
  db $5E, $60, $62, $63, $65, $66, $68, $69 ; $0A8624 |
  db $6B, $6C, $6D, $6E, $6F, $71, $72, $73 ; $0A862C |
  db $74, $74, $75, $76, $77, $78, $78, $79 ; $0A8634 |
  db $7A, $7A, $7B, $7B, $7C, $7C, $7D, $7D ; $0A863C |
  db $7E, $7E, $7E, $7E, $7F, $7F, $7F, $7F ; $0A8644 |
  db $7F, $7F, $7F, $7F, $7F, $7F, $7E, $7E ; $0A864C |
  db $7D, $7C, $7B, $7A, $79, $78, $76, $74 ; $0A8654 |
  db $73, $71, $6E, $6C, $69, $66, $63, $60 ; $0A865C |
  db $5C, $58, $54, $4F, $4A, $44, $3D, $36 ; $0A8664 |
  db $2C, $1F, $00, $00, $00, $00, $00, $01 ; $0A866C |
  db $02, $03, $04, $06, $08, $0A, $0C, $0E ; $0A8674 |
  db $10, $13, $16, $19, $1C, $20, $24, $28 ; $0A867C |
  db $2C, $30, $34, $39, $3E, $43, $48, $4E ; $0A8684 |
  db $54, $5A, $60, $66, $6C, $73, $7A      ; $0A868C |

  ibt   r0,#$000A                           ; $0A8693 |
  romb                                      ; $0A8695 |
  sms   ($0004),r5                          ; $0A8697 |
  with r4                                   ; $0A869A |
  sub   #8                                  ; $0A869B |
  iwt   r5,#$00D1                           ; $0A869D |
  iwt   r9,#$3514                           ; $0A86A0 |
  iwt   r7,#$36B8                           ; $0A86A3 |
  cache                                     ; $0A86A6 |
  from r5                                   ; $0A86A7 |
  to r12                                    ; $0A86A8 |
  sub   r4                                  ; $0A86A9 |
  bpl CODE_0A86B5                           ; $0A86AA |
  from r12                                  ; $0A86AC |
  not                                       ; $0A86AD |
  inc   r0                                  ; $0A86AE |
  to r5                                     ; $0A86AF |
  add   r5                                  ; $0A86B0 |
  bra CODE_0A86CD+1                         ; $0A86B1 |

  move  r14,r1                              ; $0A86B3 |

CODE_0A86B5:
  sub   r5                                  ; $0A86B5 |
  bcc CODE_0A86BD                           ; $0A86B6 |
  inc   r12                                 ; $0A86B8 |
  iwt   r15,#$874A                          ; $0A86B9 |
  inc   r5                                  ; $0A86BC |

CODE_0A86BD:
  with r5                                   ; $0A86BD |
  sub   r12                                 ; $0A86BE |
  from r7                                   ; $0A86BF |
  sub   r12                                 ; $0A86C0 |
  to r7                                     ; $0A86C1 |
  sub   r12                                 ; $0A86C2 |
  iwt   r0,#$FF26                           ; $0A86C3 |
  move  r13,r15                             ; $0A86C6 |
  stw   (r9)                                ; $0A86C8 |
  dec   r9                                  ; $0A86C9 |
  dec   r9                                  ; $0A86CA |
  loop                                      ; $0A86CB |
  inc   r0                                  ; $0A86CC |

CODE_0A86CD:
  move  r14,r1                              ; $0A86CD |
  inc   r1                                  ; $0A86CF |
  iwt   r10,#$2200                          ; $0A86D0 |
  move  r6,r3                               ; $0A86D3 |
  to r4                                     ; $0A86D5 |
  getb                                      ; $0A86D6 |
  move  r14,r2                              ; $0A86D7 |
  inc   r2                                  ; $0A86D9 |
  to r8                                     ; $0A86DA |
  getb                                      ; $0A86DB |
  from r8                                   ; $0A86DC |
  sub   r4                                  ; $0A86DD |
  swap                                      ; $0A86DE |
  fmult                                     ; $0A86DF |
  adc   r4                                  ; $0A86E0 |
  moves r12,r0                              ; $0A86E2 |
  beq CODE_0A8749                           ; $0A86E4 |
  add   r0                                  ; $0A86E6 |
  add   r10                                 ; $0A86E7 |
  to r6                                     ; $0A86E8 |
  ldw   (r0)                                ; $0A86E9 |
  from r4                                   ; $0A86EA |
  swap                                      ; $0A86EB |
  fmult                                     ; $0A86EC |
  to r4                                     ; $0A86ED |
  adc   #0                                  ; $0A86EE |
  from r8                                   ; $0A86F0 |
  swap                                      ; $0A86F1 |
  fmult                                     ; $0A86F2 |
  to r8                                     ; $0A86F3 |
  adc   #0                                  ; $0A86F4 |
  move  r6,r3                               ; $0A86F6 |
  ibt   r10,#$0000                          ; $0A86F8 |
  move  r11,r10                             ; $0A86FA |
  from r5                                   ; $0A86FC |
  sub   r12                                 ; $0A86FD |
  inc   r0                                  ; $0A86FE |
  bpl CODE_0A8703                           ; $0A86FF |
  to r12                                    ; $0A8701 |
  add   r12                                 ; $0A8702 |

CODE_0A8703:
  move  r13,r15                             ; $0A8703 |
  iwt   r0,#$00B1                           ; $0A8705 |
  sub   r5                                  ; $0A8708 |
  bmi CODE_0A8741                           ; $0A8709 |
  from r10                                  ; $0A870B |
  hib                                       ; $0A870C |
  add   r0                                  ; $0A870D |
  to r14                                    ; $0A870E |
  add   r1                                  ; $0A870F |
  getbs                                     ; $0A8710 |
  inc   r14                                 ; $0A8712 |
  sms   ($0000),r0                          ; $0A8713 |
  to r3                                     ; $0A8716 |
  getb                                      ; $0A8717 |
  from r11                                  ; $0A8718 |
  hib                                       ; $0A8719 |
  add   r0                                  ; $0A871A |
  to r14                                    ; $0A871B |
  add   r2                                  ; $0A871C |
  getbs                                     ; $0A871D |
  inc   r14                                 ; $0A871F |
  sms   ($0002),r0                          ; $0A8720 |
  getb                                      ; $0A8723 |
  sub   r3                                  ; $0A8724 |
  swap                                      ; $0A8725 |
  fmult                                     ; $0A8726 |
  adc   r3                                  ; $0A8727 |
  sub   r5                                  ; $0A8729 |
  sub   #8                                  ; $0A872A |
  stw   (r9)                                ; $0A872C |
  lms   r3,($0000)                          ; $0A872D |
  lms   r0,($0002)                          ; $0A8730 |
  sub   r3                                  ; $0A8733 |
  swap                                      ; $0A8734 |
  fmult                                     ; $0A8735 |
  adc   r3                                  ; $0A8736 |
  lms   r3,($0004)                          ; $0A8738 |
  add   r3                                  ; $0A873B |
  stw   (r7)                                ; $0A873C |
  dec   r9                                  ; $0A873D |
  dec   r9                                  ; $0A873E |
  dec   r7                                  ; $0A873F |
  dec   r7                                  ; $0A8740 |

CODE_0A8741:
  with r10                                  ; $0A8741 |
  add   r4                                  ; $0A8742 |
  with r11                                  ; $0A8743 |
  add   r8                                  ; $0A8744 |
  loop                                      ; $0A8745 |
  dec   r5                                  ; $0A8746 |
  bmi CODE_0A875F                           ; $0A8747 |

CODE_0A8749:
  inc   r5                                  ; $0A8749 |
  iwt   r0,#$00D2                           ; $0A874A |
  sub   r5                                  ; $0A874D |
  bpl CODE_0A8752                           ; $0A874E |
  to r5                                     ; $0A8750 |
  add   r5                                  ; $0A8751 |

CODE_0A8752:
  move  r12,r5                              ; $0A8752 |
  from r5                                   ; $0A8754 |
  not                                       ; $0A8755 |
  sub   #7                                  ; $0A8756 |
  move  r13,r15                             ; $0A8758 |
  stw   (r9)                                ; $0A875A |
  dec   r9                                  ; $0A875B |
  dec   r9                                  ; $0A875C |
  loop                                      ; $0A875D |
  inc   r0                                  ; $0A875E |

CODE_0A875F:
  link  #4                                  ; $0A875F |
  iwt   r15,#$84F2                          ; $0A8760 |
  cache                                     ; $0A8763 |
  stop                                      ; $0A8764 |
  nop                                       ; $0A8765 |

  dw $003B, $001F, $002B, $0034             ; $0A8766 |
  dw $003B, $0042, $0047, $004B             ; $0A876E |
  dw $004F, $0053, $0056, $0059             ; $0A8776 |
  dw $005B, $005D, $005F, $0060             ; $0A877E |
  dw $0061, $0062, $0063, $0063             ; $0A8786 |
  dw $0063, $0063, $0063, $0063             ; $0A878E |
  dw $0063, $0063, $0062, $0062             ; $0A8796 |
  dw $0061, $0061, $0060, $0060             ; $0A879E |
  dw $005F, $005E, $005D, $005C             ; $0A87A6 |
  dw $005B, $005A, $0059, $0057             ; $0A87AE |
  dw $0056, $0055, $0053, $0051             ; $0A87B6 |
  dw $004F, $004E, $004B, $0049             ; $0A87BE |
  dw $0047, $0044, $0042, $003F             ; $0A87C6 |
  dw $003B, $0038, $0034, $0030             ; $0A87CE |
  dw $002B, $0025, $001F, $2E16             ; $0A87D6 |
  dw $3C00, $3E00, $3E00, $3E00             ; $0A87DE |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A87E6 |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A87EE |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A87F6 |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A87FE |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A8806 |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A880E |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A8816 |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A881E |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A8826 |
  dw $3E00, $3E00, $3E00, $3E00             ; $0A882E |
  dw $3E00, $3C00, $003E, $005C             ; $0A8836 |
  dw $005E, $005E, $005E, $005E             ; $0A883E |
  dw $005E, $005E, $005E, $005E             ; $0A8846 |
  dw $005E, $005E, $005E, $005E             ; $0A884E |
  dw $005E, $005E, $005E, $005E             ; $0A8856 |
  dw $005E, $005E, $005E, $005E             ; $0A885E |
  dw $005E, $005E, $005E, $005E             ; $0A8866 |
  dw $005E, $005E, $005E, $005E             ; $0A886E |
  dw $005E, $005E, $005E, $005E             ; $0A8876 |
  dw $005E, $005E, $005E, $005E             ; $0A887E |
  dw $005E, $005E, $005E, $005E             ; $0A8886 |
  dw $005E, $005E, $005E, $005E             ; $0A888E |
  dw $005E, $005E, $005E, $005E             ; $0A8896 |
  dw $005E, $005E, $005E, $005E             ; $0A889E |
  dw $005E, $005E, $005E, $005E             ; $0A88A6 |
  dw $005E, $005E, $005E, $005E             ; $0A88AE |
  dw $5E5C, $7C00, $7E00, $7E00             ; $0A88B6 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88BE |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88C6 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88CE |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88D6 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88DE |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88E6 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88EE |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88F6 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A88FE |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8906 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A890E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8916 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A891E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8926 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A892E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8936 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A893E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8946 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A894E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8956 |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A895E |
  dw $7E00, $7E00, $7E00, $7E00             ; $0A8966 |
  dw $7E00, $7E00, $7C00                    ; $0A896E |

  iwt   r0,#$8A38                           ; $0A8974 |
  bra CODE_0A897D                           ; $0A8977 |
  nop                                       ; $0A8979 |

  iwt   r0,#$8A44                           ; $0A897A |

CODE_0A897D:
  sms   ($0020),r0                          ; $0A897D |
  sms   ($0000),r2                          ; $0A8980 |
  sms   ($0024),r2                          ; $0A8983 |
  sms   ($0002),r3                          ; $0A8986 |
  sms   ($0004),r5                          ; $0A8989 |
  sms   ($0006),r7                          ; $0A898C |
  ibt   r0,#$000A                           ; $0A898F |
  romb                                      ; $0A8991 |
  iwt   r14,#$8A50                          ; $0A8993 |
  getb                                      ; $0A8996 |
  to r10                                    ; $0A8997 |
  swap                                      ; $0A8998 |
  with r3                                   ; $0A8999 |
  sub   #8                                  ; $0A899A |
  iwt   r0,#$2200                           ; $0A899C |
  add   r7                                  ; $0A899F |
  add   r7                                  ; $0A89A0 |
  to r8                                     ; $0A89A1 |
  ldw   (r0)                                ; $0A89A2 |
  iwt   r9,#$00D1                           ; $0A89A3 |
  cache                                     ; $0A89A6 |
  ibt   r0,#$0060                           ; $0A89A7 |
  add   r2                                  ; $0A89A9 |
  iwt   r11,#$01C0                          ; $0A89AA |
  sub   r11                                 ; $0A89AD |
  bcc CODE_0A89B7                           ; $0A89AE |
  nop                                       ; $0A89B0 |
  ibt   r2,#$FF80                           ; $0A89B1 |
  iwt   r15,#$8A24                          ; $0A89B3 |
  nop                                       ; $0A89B6 |

CODE_0A89B7:
  iwt   r11,#$3514                          ; $0A89B7 |
  iwt   r13,#$00D0                          ; $0A89BA |
  from r13                                  ; $0A89BD |
  sub   r3                                  ; $0A89BE |
  bpl CODE_0A89D5                           ; $0A89BF |
  to r6                                     ; $0A89C1 |
  not                                       ; $0A89C2 |
  inc   r6                                  ; $0A89C3 |
  from r8                                   ; $0A89C4 |
  lmult                                     ; $0A89C5 |
  adc   #0                                  ; $0A89C7 |
  beq CODE_0A89CE                           ; $0A89C9 |
  nop                                       ; $0A89CB |
  move  r4,r10                              ; $0A89CC |

CODE_0A89CE:
  with r10                                  ; $0A89CE |
  sub   r4                                  ; $0A89CF |
  move  r12,r9                              ; $0A89D0 |
  bra CODE_0A89F3                           ; $0A89D2 |
  inc   r14                                 ; $0A89D4 |

CODE_0A89D5:
  move  r12,r0                              ; $0A89D5 |
  from r13                                  ; $0A89D7 |
  sub   r12                                 ; $0A89D8 |
  bpl CODE_0A89DF                           ; $0A89D9 |
  inc   r12                                 ; $0A89DB |
  move  r12,r13                             ; $0A89DC |
  inc   r12                                 ; $0A89DE |

CODE_0A89DF:
  with r9                                   ; $0A89DF |
  sub   r12                                 ; $0A89E0 |
  iwt   r0,#$FF26                           ; $0A89E1 |
  move  r13,r15                             ; $0A89E4 |
  stw   (r11)                               ; $0A89E6 |
  dec   r11                                 ; $0A89E7 |
  dec   r11                                 ; $0A89E8 |
  loop                                      ; $0A89E9 |
  inc   r0                                  ; $0A89EA |
  moves r12,r9                              ; $0A89EB |
  bpl CODE_0A89F3                           ; $0A89ED |
  inc   r14                                 ; $0A89EF |
  iwt   r15,#$8A24                          ; $0A89F0 |

CODE_0A89F3:
  move  r6,r5                               ; $0A89F3 |
  move  r7,r14                              ; $0A89F5 |
  inc   r12                                 ; $0A89F7 |
  move  r13,r15                             ; $0A89F8 |
  with r10                                  ; $0A89FA |
  sub   r8                                  ; $0A89FB |
  bmi CODE_0A8A19                           ; $0A89FC |
  from r10                                  ; $0A89FE |
  hib                                       ; $0A89FF |
  to r14                                    ; $0A8A00 |
  add   r7                                  ; $0A8A01 |
  iwt   r5,#$0100                           ; $0A8A02 |
  sub   r1                                  ; $0A8A05 |
  bcs CODE_0A8A0B                           ; $0A8A06 |
  nop                                       ; $0A8A08 |
  with r5                                   ; $0A8A09 |
  add   r5                                  ; $0A8A0A |

CODE_0A8A0B:
  getb                                      ; $0A8A0B |
  swap                                      ; $0A8A0C |
  fmult                                     ; $0A8A0D |
  sub   r12                                 ; $0A8A0E |
  sub   #8                                  ; $0A8A0F |
  add   r5                                  ; $0A8A11 |
  stw   (r11)                               ; $0A8A12 |
  dec   r11                                 ; $0A8A13 |
  loop                                      ; $0A8A14 |
  dec   r11                                 ; $0A8A15 |
  iwt   r15,#$8A24                          ; $0A8A16 |

CODE_0A8A19:
  from r12                                  ; $0A8A19 |
  not                                       ; $0A8A1A |
  sub   #7                                  ; $0A8A1B |
  move  r13,r15                             ; $0A8A1D |
  stw   (r11)                               ; $0A8A1F |
  dec   r11                                 ; $0A8A20 |
  dec   r11                                 ; $0A8A21 |
  loop                                      ; $0A8A22 |
  inc   r0                                  ; $0A8A23 |
  iwt   r0,#$0080                           ; $0A8A24 |
  sub   r2                                  ; $0A8A27 |
  iwt   r11,#$3516                          ; $0A8A28 |
  iwt   r12,#$00D2                          ; $0A8A2B |
  move  r13,r15                             ; $0A8A2E |
  stw   (r11)                               ; $0A8A30 |
  inc   r11                                 ; $0A8A31 |
  loop                                      ; $0A8A32 |
  inc   r11                                 ; $0A8A33 |
  iwt   r15,#$8390                          ; $0A8A34 |
  nop                                       ; $0A8A37 |

  db $C1, $C0, $3F, $C0, $D6, $F0, $2A, $F0 ; $0A8A38 |
  db $00, $81, $00, $0E                     ; $0A8A40 |

  db $C1, $C0, $3F, $C0, $D6, $F0, $2A, $F0 ; $0A8A44 |
  db $00, $81, $00, $0A                     ; $0A8A4C |

  db $7F, $00, $17, $20, $27, $2D, $32, $36 ; $0A8A50 |
  db $3A, $3E, $41, $45, $48, $4B, $4D, $50 ; $0A8A58 |
  db $52, $55, $57, $59, $5B, $5D, $5F, $60 ; $0A8A60 |
  db $62, $64, $65, $67, $68, $6A, $6B, $6C ; $0A8A68 |
  db $6D, $6F, $70, $71, $72, $73, $74, $75 ; $0A8A70 |
  db $75, $76, $77, $78, $78, $79, $7A, $7A ; $0A8A78 |
  db $7B, $7B, $7C, $7C, $7D, $7D, $7D, $7E ; $0A8A80 |
  db $7E, $7E, $7E, $7F, $7F, $7F, $7F, $7F ; $0A8A88 |
  db $7F, $7F, $7F, $7F, $7F, $7F, $7E, $7E ; $0A8A90 |
  db $7E, $7E, $7D, $7D, $7D, $7C, $7C, $7B ; $0A8A98 |
  db $7B, $7A, $7A, $79, $78, $78, $77, $76 ; $0A8AA0 |
  db $75, $75, $74, $73, $72, $71, $70, $6F ; $0A8AA8 |
  db $6D, $6C, $6B, $6A, $68, $67, $65, $64 ; $0A8AB0 |
  db $62, $60, $5F, $5D, $5B, $59, $57, $55 ; $0A8AB8 |
  db $52, $50, $4D, $4B, $48, $45, $41, $3E ; $0A8AC0 |
  db $3A, $36, $32, $2D, $27, $20, $17, $00 ; $0A8AC8 |

  link  #4                                  ; $0A8AD0 |
  iwt   r15,#$8B5E                          ; $0A8AD1 |
  cache                                     ; $0A8AD4 |
  iwt   r1,#$0F00                           ; $0A8AD5 |
  iwt   r2,#$1D38                           ; $0A8AD8 |
  iwt   r3,#$1CD6                           ; $0A8ADB |
  iwt   r0,#$1D37                           ; $0A8ADE |
  lms   r4,($0012)                          ; $0A8AE1 |
  add   r4                                  ; $0A8AE4 |
  ldb   (r0)                                ; $0A8AE5 |
  add   r0                                  ; $0A8AE7 |
  to r4                                     ; $0A8AE8 |
  add   r0                                  ; $0A8AE9 |
  lm    r10,($0094)                         ; $0A8AEA |
  ibt   r12,#$0018                          ; $0A8AEE |
  lm    r0,($009C)                          ; $0A8AF0 |
  to r11                                    ; $0A8AF4 |
  add   #8                                  ; $0A8AF5 |
  cache                                     ; $0A8AF7 |
  iwt   r13,#$8AFC                          ; $0A8AF8 |
  with r4                                   ; $0A8AFB |
  sub   #4                                  ; $0A8AFC |
  bpl CODE_0A8B04                           ; $0A8AFE |
  from r1                                   ; $0A8B00 |
  ibt   r4,#$005C                           ; $0A8B01 |
  from r1                                   ; $0A8B03 |

CODE_0A8B04:
  add   r4                                  ; $0A8B04 |
  ldb   (r0)                                ; $0A8B05 |
  sub   #14                                 ; $0A8B07 |
  bcc CODE_0A8B3E                           ; $0A8B09 |
  from r2                                   ; $0A8B0B |
  add   r4                                  ; $0A8B0C |
  ldw   (r0)                                ; $0A8B0D |
  sub   #0                                  ; $0A8B0E |
  beq CODE_0A8B3E                           ; $0A8B10 |
  from r3                                   ; $0A8B12 |
  add   r4                                  ; $0A8B13 |
  to r14                                    ; $0A8B14 |
  ldw   (r0)                                ; $0A8B15 |
  with r14                                  ; $0A8B16 |
  sub   r10                                 ; $0A8B17 |
  inc   r0                                  ; $0A8B18 |
  inc   r0                                  ; $0A8B19 |
  ldw   (r0)                                ; $0A8B1A |
  sub   r11                                 ; $0A8B1B |
  sub   r5                                  ; $0A8B1C |
  bcs CODE_0A8B47                           ; $0A8B1D |
  add   r5                                  ; $0A8B1F |
  move  r9,r0                               ; $0A8B20 |
  add   r0                                  ; $0A8B22 |
  add   r6                                  ; $0A8B23 |
  ldw   (r0)                                ; $0A8B24 |
  add   r9                                  ; $0A8B25 |
  add   #9                                  ; $0A8B26 |
  to r8                                     ; $0A8B28 |
  lob                                       ; $0A8B29 |
  from r7                                   ; $0A8B2A |
  add   r9                                  ; $0A8B2B |
  add   r9                                  ; $0A8B2C |
  to r9                                     ; $0A8B2D |
  ldw   (r0)                                ; $0A8B2E |
  iwt   r0,#$0080                           ; $0A8B2F |
  sub   r9                                  ; $0A8B32 |
  sub   r14                                 ; $0A8B33 |
  bpl CODE_0A8B39                           ; $0A8B34 |
  nop                                       ; $0A8B36 |
  not                                       ; $0A8B37 |
  inc   r0                                  ; $0A8B38 |

CODE_0A8B39:
  add   r0                                  ; $0A8B39 |
  sub   r8                                  ; $0A8B3A |
  bcs CODE_0A8B47                           ; $0A8B3B |
  nop                                       ; $0A8B3D |

CODE_0A8B3E:
  loop                                      ; $0A8B3E |
  with r4                                   ; $0A8B3F |
  lms   r1,($0012)                          ; $0A8B40 |
  to r4                                     ; $0A8B43 |
  bra CODE_0A8B55                           ; $0A8B44 |
  sub   r0                                  ; $0A8B46 |

CODE_0A8B47:
  lms   r1,($0012)                          ; $0A8B47 |
  iwt   r0,#$1D37                           ; $0A8B4A |
  to r2                                     ; $0A8B4D |
  add   r1                                  ; $0A8B4E |
  from r4                                   ; $0A8B4F |
  lsr                                       ; $0A8B50 |
  lsr                                       ; $0A8B51 |
  stb   (r2)                                ; $0A8B52 |
  inc   r4                                  ; $0A8B54 |

CODE_0A8B55:
  iwt   r0,#$1D36                           ; $0A8B55 |
  add   r1                                  ; $0A8B58 |
  from r4                                   ; $0A8B59 |
  stb   (r0)                                ; $0A8B5A |
  stop                                      ; $0A8B5C |
  nop                                       ; $0A8B5D |

  ibt   r0,#$FFFF                           ; $0A8B5E |
  sms   ($0060),r11                         ; $0A8B60 |
  move  r11,r0                              ; $0A8B63 |
  ibt   r0,#$000A                           ; $0A8B65 |
  romb                                      ; $0A8B67 |
  iwt   r14,#$85F0                          ; $0A8B69 |
  lms   r0,($0018)                          ; $0A8B6C |
  sub   #0                                  ; $0A8B6F |
  beq CODE_0A8B76                           ; $0A8B71 |
  with r14                                  ; $0A8B73 |
  add   #10                                 ; $0A8B74 |

CODE_0A8B76:
  lms   r1,($0014)                          ; $0A8B76 |
  lms   r0,($0016)                          ; $0A8B79 |
  to r2                                     ; $0A8B7C |
  sub   #8                                  ; $0A8B7D |
  iwt   r5,#$00D2                           ; $0A8B7F |
  iwt   r6,#$3372                           ; $0A8B82 |
  iwt   r7,#$3516                           ; $0A8B85 |
  iwt   r3,#$0080                           ; $0A8B88 |
  ibt   r10,#$0000                          ; $0A8B8B |
  ibt   r12,#$0005                          ; $0A8B8D |
  iwt   r13,#$8B93                          ; $0A8B8F |
  with r10                                  ; $0A8B92 |
  add   r10                                 ; $0A8B93 |
  getbs                                     ; $0A8B94 |
  inc   r14                                 ; $0A8B96 |
  to r4                                     ; $0A8B97 |
  add   r1                                  ; $0A8B98 |
  getbs                                     ; $0A8B99 |
  inc   r14                                 ; $0A8B9B |
  add   r2                                  ; $0A8B9C |
  move  r9,r0                               ; $0A8B9D |
  sub   r5                                  ; $0A8B9F |
  bcs CODE_0A8BBC                           ; $0A8BA0 |
  add   r5                                  ; $0A8BA2 |
  add   r0                                  ; $0A8BA3 |
  add   r6                                  ; $0A8BA4 |
  ldw   (r0)                                ; $0A8BA5 |
  add   r9                                  ; $0A8BA6 |
  add   #9                                  ; $0A8BA7 |
  to r8                                     ; $0A8BA9 |
  and   r11                                 ; $0A8BAA |
  from r7                                   ; $0A8BAB |
  add   r9                                  ; $0A8BAC |
  add   r9                                  ; $0A8BAD |
  ldw   (r0)                                ; $0A8BAE |
  from r3                                   ; $0A8BAF |
  sub   r0                                  ; $0A8BB0 |
  sub   r4                                  ; $0A8BB1 |
  bpl CODE_0A8BB7                           ; $0A8BB2 |
  nop                                       ; $0A8BB4 |
  not                                       ; $0A8BB5 |
  inc   r0                                  ; $0A8BB6 |

CODE_0A8BB7:
  add   r0                                  ; $0A8BB7 |
  sub   r8                                  ; $0A8BB8 |
  bcc CODE_0A8BBD                           ; $0A8BB9 |
  nop                                       ; $0A8BBB |

CODE_0A8BBC:
  inc   r10                                 ; $0A8BBC |

CODE_0A8BBD:
  loop                                      ; $0A8BBD |
  with r10                                  ; $0A8BBE |
  sms   ($0014),r10                         ; $0A8BBF |
  from r10                                  ; $0A8BC2 |
  lsr                                       ; $0A8BC3 |
  bcc CODE_0A8C1D                           ; $0A8BC4 |
  sub   r0                                  ; $0A8BC6 |
  move  r1,r0                               ; $0A8BC7 |

CODE_0A8BC9:
  dec   r9                                  ; $0A8BC9 |
  bmi CODE_0A8BF4                           ; $0A8BCA |
  from r1                                   ; $0A8BCC |
  add   #10                                 ; $0A8BCD |
  bmi CODE_0A8BF4                           ; $0A8BCF |
  from r9                                   ; $0A8BD1 |
  sub   r5                                  ; $0A8BD2 |
  bcc CODE_0A8BD9                           ; $0A8BD3 |
  add   r5                                  ; $0A8BD5 |
  bra CODE_0A8BC9                           ; $0A8BD6 |
  dec   r1                                  ; $0A8BD8 |

CODE_0A8BD9:
  add   r0                                  ; $0A8BD9 |
  add   r6                                  ; $0A8BDA |
  ldw   (r0)                                ; $0A8BDB |
  add   r9                                  ; $0A8BDC |
  add   #9                                  ; $0A8BDD |
  to r8                                     ; $0A8BDF |
  and   r11                                 ; $0A8BE0 |
  from r7                                   ; $0A8BE1 |
  add   r9                                  ; $0A8BE2 |
  add   r9                                  ; $0A8BE3 |
  ldw   (r0)                                ; $0A8BE4 |
  from r3                                   ; $0A8BE5 |
  sub   r0                                  ; $0A8BE6 |
  sub   r4                                  ; $0A8BE7 |
  move  r2,r0                               ; $0A8BE8 |
  bpl CODE_0A8BEF                           ; $0A8BEA |
  nop                                       ; $0A8BEC |
  not                                       ; $0A8BED |
  inc   r0                                  ; $0A8BEE |

CODE_0A8BEF:
  add   r0                                  ; $0A8BEF |
  sub   r8                                  ; $0A8BF0 |
  bcs CODE_0A8BC9                           ; $0A8BF1 |
  dec   r1                                  ; $0A8BF3 |

CODE_0A8BF4:
  sms   ($0016),r1                          ; $0A8BF4 |
  from r9                                   ; $0A8BF7 |
  add   #2                                  ; $0A8BF8 |
  cmp   r5                                  ; $0A8BFA |
  bcs CODE_0A8C07                           ; $0A8BFC |
  from r8                                   ; $0A8BFE |
  from r0                                   ; $0A8BFF |
  add   r0                                  ; $0A8C00 |
  add   r6                                  ; $0A8C01 |
  ldw   (r0)                                ; $0A8C02 |
  add   r9                                  ; $0A8C03 |
  add   #9                                  ; $0A8C04 |
  and   r11                                 ; $0A8C06 |

CODE_0A8C07:
  sub   r8                                  ; $0A8C07 |
  lsr                                       ; $0A8C08 |
  ibt   r3,#$0004                           ; $0A8C09 |
  cmp   r3                                  ; $0A8C0B |
  bcc CODE_0A8C12                           ; $0A8C0D |
  nop                                       ; $0A8C0F |
  move  r0,r3                               ; $0A8C10 |

CODE_0A8C12:
  moves r2,r2                               ; $0A8C12 |
  bpl CODE_0A8C19                           ; $0A8C14 |
  nop                                       ; $0A8C16 |
  add   #5                                  ; $0A8C17 |

CODE_0A8C19:
  add   r0                                  ; $0A8C19 |
  sms   ($0018),r0                          ; $0A8C1A |

CODE_0A8C1D:
  iwt   r0,#$8604                           ; $0A8C1D |
  sub   r14                                 ; $0A8C20 |
  bcc CODE_0A8C43                           ; $0A8C21 |
  to r14                                    ; $0A8C23 |
  add   r14                                 ; $0A8C24 |
  lms   r0,($0014)                          ; $0A8C25 |
  sms   ($001A),r0                          ; $0A8C28 |
  lms   r0,($0016)                          ; $0A8C2B |
  sms   ($001C),r0                          ; $0A8C2E |
  lms   r0,($0018)                          ; $0A8C31 |
  sms   ($001E),r0                          ; $0A8C34 |
  lm    r1,($1680)                          ; $0A8C37 |
  lm    r0,($1682)                          ; $0A8C3B |
  iwt   r15,#$8B7D                          ; $0A8C3F |
  to r2                                     ; $0A8C42 |

CODE_0A8C43:
  lms   r11,($0060)                         ; $0A8C43 |
  jmp   r11                                 ; $0A8C46 |
  nop                                       ; $0A8C47 |

  ibt   r0,#$000A                           ; $0A8C48 |
  romb                                      ; $0A8C4A |
  ibt   r11,#$0000                          ; $0A8C4C |
  ibt   r12,#$0018                          ; $0A8C4E |
  cache                                     ; $0A8C50 |
  move  r13,r15                             ; $0A8C51 |
  ibt   r10,#$0000                          ; $0A8C53 |
  iwt   r0,#$0F00                           ; $0A8C55 |
  add   r11                                 ; $0A8C58 |
  ldw   (r0)                                ; $0A8C59 |
  sub   #14                                 ; $0A8C5A |
  bcc CODE_0A8C74                           ; $0A8C5C |
  nop                                       ; $0A8C5E |
  iwt   r0,#$1D38                           ; $0A8C5F |
  add   r11                                 ; $0A8C62 |
  ldw   (r0)                                ; $0A8C63 |
  sub   #0                                  ; $0A8C64 |
  bne CODE_0A8C74                           ; $0A8C66 |
  nop                                       ; $0A8C68 |
  iwt   r0,#$0FA2                           ; $0A8C69 |
  add   r11                                 ; $0A8C6C |
  ldw   (r0)                                ; $0A8C6D |
  ibt   r1,#$001F                           ; $0A8C6E |
  and   r1                                  ; $0A8C70 |
  bne CODE_0A8C78                           ; $0A8C71 |
  add   r0                                  ; $0A8C73 |

CODE_0A8C74:
  iwt   r15,#$8D7F                          ; $0A8C74 |
  inc   r11                                 ; $0A8C77 |

CODE_0A8C78:
  ibt   r3,#$0004                           ; $0A8C78 |
  iwt   r2,#$CF0B                           ; $0A8C7A |
  ibt   r1,#$0038                           ; $0A8C7D |
  sub   r1                                  ; $0A8C7F |
  bcc CODE_0A8C87                           ; $0A8C80 |
  add   r1                                  ; $0A8C82 |
  ibt   r3,#$0001                           ; $0A8C83 |
  dec   r2                                  ; $0A8C85 |
  dec   r2                                  ; $0A8C86 |

CODE_0A8C87:
  iwt   r14,#$CECA                          ; $0A8C87 |
  to r14                                    ; $0A8C8A |
  add   r14                                 ; $0A8C8B |
  getb                                      ; $0A8C8C |
  add   r0                                  ; $0A8C8D |
  to r14                                    ; $0A8C8E |
  add   r2                                  ; $0A8C8F |
  iwt   r0,#$1680                           ; $0A8C90 |
  add   r11                                 ; $0A8C93 |
  to r1                                     ; $0A8C94 |
  ldw   (r0)                                ; $0A8C95 |
  iwt   r0,#$1682                           ; $0A8C96 |
  add   r11                                 ; $0A8C99 |
  ldw   (r0)                                ; $0A8C9A |
  to r2                                     ; $0A8C9B |
  sub   #8                                  ; $0A8C9C |
  iwt   r5,#$00D2                           ; $0A8C9E |
  iwt   r6,#$3372                           ; $0A8CA1 |
  iwt   r7,#$3516                           ; $0A8CA4 |
  sms   ($0058),r12                         ; $0A8CA7 |
  sms   ($005A),r13                         ; $0A8CAA |
  move  r12,r3                              ; $0A8CAD |
  iwt   r3,#$0080                           ; $0A8CAF |
  iwt   r13,#$8CB6                          ; $0A8CB2 |
  with r10                                  ; $0A8CB5 |
  add   r10                                 ; $0A8CB6 |
  getbs                                     ; $0A8CB7 |
  inc   r14                                 ; $0A8CB9 |
  to r4                                     ; $0A8CBA |
  add   r1                                  ; $0A8CBB |
  getbs                                     ; $0A8CBC |
  inc   r14                                 ; $0A8CBE |
  add   r2                                  ; $0A8CBF |
  move  r9,r0                               ; $0A8CC0 |
  sub   r5                                  ; $0A8CC2 |
  bcs CODE_0A8CDF                           ; $0A8CC3 |
  add   r5                                  ; $0A8CC5 |
  add   r0                                  ; $0A8CC6 |
  add   r6                                  ; $0A8CC7 |
  ldw   (r0)                                ; $0A8CC8 |
  add   r9                                  ; $0A8CC9 |
  add   #9                                  ; $0A8CCA |
  to r8                                     ; $0A8CCC |
  lob                                       ; $0A8CCD |
  from r7                                   ; $0A8CCE |
  add   r9                                  ; $0A8CCF |
  add   r9                                  ; $0A8CD0 |
  ldw   (r0)                                ; $0A8CD1 |
  from r3                                   ; $0A8CD2 |
  sub   r0                                  ; $0A8CD3 |
  sub   r4                                  ; $0A8CD4 |
  bpl CODE_0A8CDA                           ; $0A8CD5 |
  nop                                       ; $0A8CD7 |
  not                                       ; $0A8CD8 |
  inc   r0                                  ; $0A8CD9 |

CODE_0A8CDA:
  add   r0                                  ; $0A8CDA |
  sub   r8                                  ; $0A8CDB |
  bcc CODE_0A8CE0                           ; $0A8CDC |
  nop                                       ; $0A8CDE |

CODE_0A8CDF:
  inc   r10                                 ; $0A8CDF |

CODE_0A8CE0:
  loop                                      ; $0A8CE0 |
  with r10                                  ; $0A8CE1 |
  lms   r12,($0058)                         ; $0A8CE2 |
  lms   r13,($005A)                         ; $0A8CE5 |
  from r10                                  ; $0A8CE8 |
  lsr                                       ; $0A8CE9 |
  bcc CODE_0A8D30                           ; $0A8CEA |
  sub   r0                                  ; $0A8CEC |
  move  r1,r0                               ; $0A8CED |
  from r10                                  ; $0A8CEF |
  and   #2                                  ; $0A8CF0 |
  beq CODE_0A8CFE                           ; $0A8CF2 |
  from r9                                   ; $0A8CF4 |
  sex                                       ; $0A8CF5 |
  bmi CODE_0A8CFE                           ; $0A8CF6 |
  with r10                                  ; $0A8CF8 |
  bic   #1                                  ; $0A8CF9 |
  bra CODE_0A8D31                           ; $0A8CFB |
  from r10                                  ; $0A8CFD |

CODE_0A8CFE:
  dec   r9                                  ; $0A8CFE |
  bmi CODE_0A8D29                           ; $0A8CFF |
  from r1                                   ; $0A8D01 |
  add   #10                                 ; $0A8D02 |
  bmi CODE_0A8D29                           ; $0A8D04 |
  from r9                                   ; $0A8D06 |
  sub   r5                                  ; $0A8D07 |
  bcc CODE_0A8D0E                           ; $0A8D08 |
  add   r5                                  ; $0A8D0A |
  bra CODE_0A8CFE                           ; $0A8D0B |
  dec   r1                                  ; $0A8D0D |

CODE_0A8D0E:
  add   r0                                  ; $0A8D0E |
  add   r6                                  ; $0A8D0F |
  ldw   (r0)                                ; $0A8D10 |
  add   r9                                  ; $0A8D11 |
  add   #9                                  ; $0A8D12 |
  to r8                                     ; $0A8D14 |
  lob                                       ; $0A8D15 |
  from r7                                   ; $0A8D16 |
  add   r9                                  ; $0A8D17 |
  add   r9                                  ; $0A8D18 |
  ldw   (r0)                                ; $0A8D19 |
  from r3                                   ; $0A8D1A |
  sub   r0                                  ; $0A8D1B |
  sub   r4                                  ; $0A8D1C |
  move  r2,r0                               ; $0A8D1D |
  bpl CODE_0A8D24                           ; $0A8D1F |
  nop                                       ; $0A8D21 |
  not                                       ; $0A8D22 |
  inc   r0                                  ; $0A8D23 |

CODE_0A8D24:
  add   r0                                  ; $0A8D24 |
  sub   r8                                  ; $0A8D25 |
  bcs CODE_0A8CFE                           ; $0A8D26 |
  dec   r1                                  ; $0A8D28 |

CODE_0A8D29:
  iwt   r0,#$1182                           ; $0A8D29 |
  add   r11                                 ; $0A8D2C |
  ldw   (r0)                                ; $0A8D2D |
  add   r1                                  ; $0A8D2E |
  sbk                                       ; $0A8D2F |

CODE_0A8D30:
  from r10                                  ; $0A8D30 |

CODE_0A8D31:
  and   #12                                 ; $0A8D31 |
  beq CODE_0A8D67                           ; $0A8D33 |
  from r4                                   ; $0A8D35 |
  sex                                       ; $0A8D36 |
  ibt   r4,#$0001                           ; $0A8D37 |
  bpl CODE_0A8D3E                           ; $0A8D39 |
  nop                                       ; $0A8D3B |
  ibt   r4,#$FFFF                           ; $0A8D3C |

CODE_0A8D3E:
  iwt   r0,#$10E2                           ; $0A8D3E |
  add   r11                                 ; $0A8D41 |
  ldw   (r0)                                ; $0A8D42 |
  add   r4                                  ; $0A8D43 |
  sbk                                       ; $0A8D44 |
  iwt   r0,#$15E0                           ; $0A8D45 |
  add   r11                                 ; $0A8D48 |
  ldw   (r0)                                ; $0A8D49 |
  to r2                                     ; $0A8D4A |
  xor   r4                                  ; $0A8D4B |
  bpl CODE_0A8D53                           ; $0A8D4D |
  nop                                       ; $0A8D4F |
  not                                       ; $0A8D50 |
  inc   r0                                  ; $0A8D51 |
  sbk                                       ; $0A8D52 |

CODE_0A8D53:
  iwt   r0,#$1220                           ; $0A8D53 |
  add   r11                                 ; $0A8D56 |
  ldw   (r0)                                ; $0A8D57 |
  to r2                                     ; $0A8D58 |
  xor   r4                                  ; $0A8D59 |
  bpl CODE_0A8D61                           ; $0A8D5B |
  inc   r4                                  ; $0A8D5D |
  not                                       ; $0A8D5E |
  inc   r0                                  ; $0A8D5F |
  sbk                                       ; $0A8D60 |

CODE_0A8D61:
  iwt   r0,#$1400                           ; $0A8D61 |
  add   r11                                 ; $0A8D64 |
  from r4                                   ; $0A8D65 |
  stw   (r0)                                ; $0A8D66 |

CODE_0A8D67:
  from r10                                  ; $0A8D67 |
  and   #2                                  ; $0A8D68 |
  beq CODE_0A8D7E                           ; $0A8D6A |
  nop                                       ; $0A8D6C |
  iwt   r0,#$1222                           ; $0A8D6D |
  add   r11                                 ; $0A8D70 |
  ldw   (r0)                                ; $0A8D71 |
  sub   #0                                  ; $0A8D72 |
  bpl CODE_0A8D7E                           ; $0A8D74 |
  to r2                                     ; $0A8D76 |
  sub   r0                                  ; $0A8D77 |
  iwt   r0,#$1222                           ; $0A8D78 |
  add   r11                                 ; $0A8D7B |
  from r2                                   ; $0A8D7C |
  stw   (r0)                                ; $0A8D7D |

CODE_0A8D7E:
  inc   r11                                 ; $0A8D7E |
  iwt   r0,#$185F                           ; $0A8D7F |
  add   r11                                 ; $0A8D82 |
  from r10                                  ; $0A8D83 |
  stw   (r0)                                ; $0A8D84 |
  inc   r11                                 ; $0A8D85 |
  inc   r11                                 ; $0A8D86 |
  loop                                      ; $0A8D87 |
  inc   r11                                 ; $0A8D88 |
  stop                                      ; $0A8D89 |
  nop                                       ; $0A8D8A |

  romb                                      ; $0A8D8B |
  move  r14,r14                             ; $0A8D8D |
  iwt   r1,#$49C6                           ; $0A8D8F |
  to r12                                    ; $0A8D92 |
  ldb   (r1)                                ; $0A8D93 |
  inc   r1                                  ; $0A8D95 |
  cache                                     ; $0A8D96 |
  move  r13,r15                             ; $0A8D97 |
  ldb   (r1)                                ; $0A8D99 |
  to r2                                     ; $0A8D9B |
  sex                                       ; $0A8D9C |
  getbs                                     ; $0A8D9D |
  sub   r2                                  ; $0A8D9F |
  beq CODE_0A8DAB                           ; $0A8DA0 |
  inc   r14                                 ; $0A8DA2 |
  asr                                       ; $0A8DA3 |
  asr                                       ; $0A8DA4 |
  asr                                       ; $0A8DA5 |
  asr                                       ; $0A8DA6 |
  bne CODE_0A8DAB                           ; $0A8DA7 |
  nop                                       ; $0A8DA9 |
  inc   r0                                  ; $0A8DAA |

CODE_0A8DAB:
  add   r2                                  ; $0A8DAB |
  stb   (r1)                                ; $0A8DAC |
  inc   r1                                  ; $0A8DAE |
  ldb   (r1)                                ; $0A8DAF |
  to r2                                     ; $0A8DB1 |
  sex                                       ; $0A8DB2 |
  getbs                                     ; $0A8DB3 |
  sub   r2                                  ; $0A8DB5 |
  beq CODE_0A8DC1                           ; $0A8DB6 |
  inc   r14                                 ; $0A8DB8 |
  asr                                       ; $0A8DB9 |
  asr                                       ; $0A8DBA |
  asr                                       ; $0A8DBB |
  asr                                       ; $0A8DBC |
  bne CODE_0A8DC1                           ; $0A8DBD |
  nop                                       ; $0A8DBF |
  inc   r0                                  ; $0A8DC0 |

CODE_0A8DC1:
  add   r2                                  ; $0A8DC1 |
  stb   (r1)                                ; $0A8DC2 |
  loop                                      ; $0A8DC4 |
  inc   r1                                  ; $0A8DC5 |
  stop                                      ; $0A8DC6 |
  nop                                       ; $0A8DC7 |

  sms   ($0000),r1                          ; $0A8DC8 |
  sms   ($0002),r2                          ; $0A8DCB |
  link  #4                                  ; $0A8DCE |
  iwt   r15,#$8EFC                          ; $0A8DCF |
  nop                                       ; $0A8DD2 |
  move  r3,r1                               ; $0A8DD3 |
  lms   r4,($0004)                          ; $0A8DD5 |
  from r4                                   ; $0A8DD8 |
  to r5                                     ; $0A8DD9 |
  mult  r4                                  ; $0A8DDA |
  lms   r1,($0000)                          ; $0A8DDB |
  from r1                                   ; $0A8DDE |
  to r6                                     ; $0A8DDF |
  mult  r1                                  ; $0A8DE0 |
  lms   r2,($0002)                          ; $0A8DE1 |
  from r2                                   ; $0A8DE4 |
  mult  r2                                  ; $0A8DE5 |
  add   r6                                  ; $0A8DE6 |
  sub   r5                                  ; $0A8DE7 |
  bcc CODE_0A8E10                           ; $0A8DE8 |
  nop                                       ; $0A8DEA |
  ibt   r0,#$0008                           ; $0A8DEB |
  romb                                      ; $0A8DED |
  iwt   r0,#$AE18                           ; $0A8DEF |
  to r14                                    ; $0A8DF2 |
  add   r3                                  ; $0A8DF3 |
  getb                                      ; $0A8DF4 |
  mult  r4                                  ; $0A8DF5 |
  add   r0                                  ; $0A8DF6 |
  add   r0                                  ; $0A8DF7 |
  hib                                       ; $0A8DF8 |
  sex                                       ; $0A8DF9 |
  to r1                                     ; $0A8DFA |
  not                                       ; $0A8DFB |
  inc   r1                                  ; $0A8DFC |
  sms   ($0000),r1                          ; $0A8DFD |
  ibt   r0,#$0040                           ; $0A8E00 |
  to r14                                    ; $0A8E02 |
  add   r14                                 ; $0A8E03 |
  getb                                      ; $0A8E04 |
  mult  r4                                  ; $0A8E05 |
  add   r0                                  ; $0A8E06 |
  add   r0                                  ; $0A8E07 |
  hib                                       ; $0A8E08 |
  sex                                       ; $0A8E09 |
  to r2                                     ; $0A8E0A |
  not                                       ; $0A8E0B |
  inc   r2                                  ; $0A8E0C |
  sms   ($0002),r2                          ; $0A8E0D |

CODE_0A8E10:
  ibt   r0,#$007F                           ; $0A8E10 |
  xor   r3                                  ; $0A8E12 |
  inc   r0                                  ; $0A8E14 |
  lob                                       ; $0A8E15 |
  add   #8                                  ; $0A8E16 |
  lsr                                       ; $0A8E18 |
  lsr                                       ; $0A8E19 |
  lsr                                       ; $0A8E1A |
  lsr                                       ; $0A8E1B |
  sms   ($0004),r0                          ; $0A8E1C |
  move  r4,r0                               ; $0A8E1F |
  add   r0                                  ; $0A8E21 |
  iwt   r3,#$49C7                           ; $0A8E22 |
  to r3                                     ; $0A8E25 |
  add   r3                                  ; $0A8E26 |
  from r1                                   ; $0A8E27 |
  stb   (r3)                                ; $0A8E28 |
  inc   r3                                  ; $0A8E2A |
  from r2                                   ; $0A8E2B |
  stb   (r3)                                ; $0A8E2C |
  from r4                                   ; $0A8E2E |
  sub   #2                                  ; $0A8E2F |
  and   #15                                 ; $0A8E31 |
  add   r0                                  ; $0A8E33 |
  iwt   r3,#$49C7                           ; $0A8E34 |
  to r3                                     ; $0A8E37 |
  add   r3                                  ; $0A8E38 |
  ldb   (r3)                                ; $0A8E39 |
  sex                                       ; $0A8E3B |
  to r1                                     ; $0A8E3C |
  sub   r1                                  ; $0A8E3D |
  inc   r3                                  ; $0A8E3E |
  ldb   (r3)                                ; $0A8E3F |
  sex                                       ; $0A8E41 |
  to r2                                     ; $0A8E42 |
  sub   r2                                  ; $0A8E43 |
  link  #4                                  ; $0A8E44 |
  iwt   r15,#$8EDE                          ; $0A8E45 |
  nop                                       ; $0A8E48 |
  lms   r0,($0004)                          ; $0A8E49 |
  dec   r0                                  ; $0A8E4C |
  and   #15                                 ; $0A8E4D |
  add   r0                                  ; $0A8E4F |
  iwt   r4,#$49C7                           ; $0A8E50 |
  to r4                                     ; $0A8E53 |
  add   r4                                  ; $0A8E54 |
  ldb   (r4)                                ; $0A8E55 |
  move  r6,r0                               ; $0A8E57 |
  lms   r1,($0000)                          ; $0A8E59 |
  sub   r1                                  ; $0A8E5C |
  to r5                                     ; $0A8E5D |
  mult  r3                                  ; $0A8E5E |
  inc   r4                                  ; $0A8E5F |
  ldb   (r4)                                ; $0A8E60 |
  move  r7,r0                               ; $0A8E62 |
  lms   r1,($0002)                          ; $0A8E64 |
  sub   r1                                  ; $0A8E67 |
  mult  r2                                  ; $0A8E68 |
  from r5                                   ; $0A8E69 |
  sub   r0                                  ; $0A8E6A |
  add   r0                                  ; $0A8E6B |
  add   r0                                  ; $0A8E6C |
  hib                                       ; $0A8E6D |
  move  r5,r0                               ; $0A8E6E |
  mult  r2                                  ; $0A8E70 |
  add   r0                                  ; $0A8E71 |
  add   r0                                  ; $0A8E72 |
  hib                                       ; $0A8E73 |
  add   r7                                  ; $0A8E74 |
  stb   (r4)                                ; $0A8E75 |
  from r5                                   ; $0A8E77 |
  mult  r3                                  ; $0A8E78 |
  add   r0                                  ; $0A8E79 |
  add   r0                                  ; $0A8E7A |
  hib                                       ; $0A8E7B |
  from r6                                   ; $0A8E7C |
  sub   r0                                  ; $0A8E7D |
  dec   r4                                  ; $0A8E7E |
  stb   (r4)                                ; $0A8E7F |
  lms   r0,($0004)                          ; $0A8E81 |
  add   #2                                  ; $0A8E84 |
  and   #15                                 ; $0A8E86 |
  add   r0                                  ; $0A8E88 |
  iwt   r3,#$49C7                           ; $0A8E89 |
  to r3                                     ; $0A8E8C |
  add   r3                                  ; $0A8E8D |
  ldb   (r3)                                ; $0A8E8E |
  sex                                       ; $0A8E90 |
  lms   r1,($0000)                          ; $0A8E91 |
  to r1                                     ; $0A8E94 |
  sub   r1                                  ; $0A8E95 |
  inc   r3                                  ; $0A8E96 |
  ldb   (r3)                                ; $0A8E97 |
  sex                                       ; $0A8E99 |
  lms   r2,($0002)                          ; $0A8E9A |
  to r2                                     ; $0A8E9D |
  sub   r2                                  ; $0A8E9E |
  link  #4                                  ; $0A8E9F |
  iwt   r15,#$8EDE                          ; $0A8EA0 |
  nop                                       ; $0A8EA3 |
  lms   r0,($0004)                          ; $0A8EA4 |
  inc   r0                                  ; $0A8EA7 |
  and   #15                                 ; $0A8EA8 |
  add   r0                                  ; $0A8EAA |
  iwt   r4,#$49C7                           ; $0A8EAB |
  to r4                                     ; $0A8EAE |
  add   r4                                  ; $0A8EAF |
  ldb   (r4)                                ; $0A8EB0 |
  move  r6,r0                               ; $0A8EB2 |
  lms   r1,($0000)                          ; $0A8EB4 |
  sub   r1                                  ; $0A8EB7 |
  to r5                                     ; $0A8EB8 |
  mult  r3                                  ; $0A8EB9 |
  inc   r4                                  ; $0A8EBA |
  ldb   (r4)                                ; $0A8EBB |
  move  r7,r0                               ; $0A8EBD |
  lms   r1,($0002)                          ; $0A8EBF |
  sub   r1                                  ; $0A8EC2 |
  mult  r2                                  ; $0A8EC3 |
  from r5                                   ; $0A8EC4 |
  sub   r0                                  ; $0A8EC5 |
  add   r0                                  ; $0A8EC6 |
  add   r0                                  ; $0A8EC7 |
  hib                                       ; $0A8EC8 |
  move  r5,r0                               ; $0A8EC9 |
  mult  r2                                  ; $0A8ECB |
  add   r0                                  ; $0A8ECC |
  add   r0                                  ; $0A8ECD |
  hib                                       ; $0A8ECE |
  add   r7                                  ; $0A8ECF |
  stb   (r4)                                ; $0A8ED0 |
  from r5                                   ; $0A8ED2 |
  mult  r3                                  ; $0A8ED3 |
  add   r0                                  ; $0A8ED4 |
  add   r0                                  ; $0A8ED5 |
  hib                                       ; $0A8ED6 |
  from r6                                   ; $0A8ED7 |
  sub   r0                                  ; $0A8ED8 |
  dec   r4                                  ; $0A8ED9 |
  stb   (r4)                                ; $0A8EDA |
  stop                                      ; $0A8EDC |
  nop                                       ; $0A8EDD |

  sms   ($0062),r11                         ; $0A8EDE |
  link  #4                                  ; $0A8EE1 |
  iwt   r15,#$8EFC                          ; $0A8EE2 |
  nop                                       ; $0A8EE5 |
  ibt   r0,#$0008                           ; $0A8EE6 |
  romb                                      ; $0A8EE8 |
  iwt   r0,#$AE18                           ; $0A8EEA |
  to r14                                    ; $0A8EED |
  add   r1                                  ; $0A8EEE |
  to r2                                     ; $0A8EEF |
  getb                                      ; $0A8EF0 |
  ibt   r0,#$0040                           ; $0A8EF1 |
  to r14                                    ; $0A8EF3 |
  add   r14                                 ; $0A8EF4 |
  to r3                                     ; $0A8EF5 |
  getb                                      ; $0A8EF6 |
  lms   r11,($0062)                         ; $0A8EF7 |
  jmp   r11                                 ; $0A8EFA |
  nop                                       ; $0A8EFB |

  sms   ($0060),r11                         ; $0A8EFC |
  iwt   r0,#$BC74                           ; $0A8EFF |
  ibt   r8,#$000B                           ; $0A8F02 |
  ibt   r5,#$000A                           ; $0A8F04 |
  move  r11,r15                             ; $0A8F06 |
  ljmp  r8                                  ; $0A8F08 |
  nop                                       ; $0A8F0A |

  lms   r11,($0060)                         ; $0A8F0B |
  jmp   r11                                 ; $0A8F0E |
  nop                                       ; $0A8F0F |

  cache                                     ; $0A8F10 |
  ibt   r0,#$0008                           ; $0A8F11 |
  romb                                      ; $0A8F13 |
  with r3                                   ; $0A8F15 |
  lob                                       ; $0A8F16 |
  with r9                                   ; $0A8F17 |
  lob                                       ; $0A8F18 |
  iwt   r12,#$00D2                          ; $0A8F19 |
  move  r13,r15                             ; $0A8F1C |
  with r1                                   ; $0A8F1E |
  lob                                       ; $0A8F1F |
  iwt   r0,#$AC18                           ; $0A8F20 |
  add   r1                                  ; $0A8F23 |
  to r14                                    ; $0A8F24 |
  add   r1                                  ; $0A8F25 |
  getb                                      ; $0A8F26 |
  inc   r14                                 ; $0A8F27 |
  getbh                                     ; $0A8F28 |
  move  r6,r2                               ; $0A8F2A |
  lmult                                     ; $0A8F2C |
  with r4                                   ; $0A8F2E |
  hib                                       ; $0A8F2F |
  lob                                       ; $0A8F30 |
  swap                                      ; $0A8F31 |
  or    r4                                  ; $0A8F32 |
  add   r10                                 ; $0A8F33 |
  stw   (r5)                                ; $0A8F34 |
  inc   r5                                  ; $0A8F35 |
  inc   r5                                  ; $0A8F36 |
  with r1                                   ; $0A8F37 |
  add   r3                                  ; $0A8F38 |
  with r7                                   ; $0A8F39 |
  lob                                       ; $0A8F3A |
  iwt   r0,#$AC18                           ; $0A8F3B |
  add   r7                                  ; $0A8F3E |
  to r14                                    ; $0A8F3F |
  add   r7                                  ; $0A8F40 |
  getb                                      ; $0A8F41 |
  inc   r14                                 ; $0A8F42 |
  getbh                                     ; $0A8F43 |
  move  r6,r8                               ; $0A8F45 |
  lmult                                     ; $0A8F47 |
  with r4                                   ; $0A8F49 |
  hib                                       ; $0A8F4A |
  lob                                       ; $0A8F4B |
  swap                                      ; $0A8F4C |
  or    r4                                  ; $0A8F4D |
  add   r11                                 ; $0A8F4E |
  stw   (r5)                                ; $0A8F4F |
  with r7                                   ; $0A8F50 |
  add   r9                                  ; $0A8F51 |
  inc   r5                                  ; $0A8F52 |
  loop                                      ; $0A8F53 |
  inc   r5                                  ; $0A8F54 |
  stop                                      ; $0A8F55 |
  nop                                       ; $0A8F56 |

  romb                                      ; $0A8F57 |
  move  r14,r14                             ; $0A8F59 |
  iwt   r1,#$49C6                           ; $0A8F5B |
  ldb   (r1)                                ; $0A8F5E |
  inc   r1                                  ; $0A8F60 |
  move  r12,r0                              ; $0A8F61 |
  to r11                                    ; $0A8F63 |
  add   r0                                  ; $0A8F64 |
  getb                                      ; $0A8F65 |
  inc   r14                                 ; $0A8F66 |
  swap                                      ; $0A8F67 |
  fmult                                     ; $0A8F68 |
  stb   (r1)                                ; $0A8F69 |
  inc   r1                                  ; $0A8F6B |
  getb                                      ; $0A8F6C |
  inc   r14                                 ; $0A8F6D |
  swap                                      ; $0A8F6E |
  fmult                                     ; $0A8F6F |
  stb   (r1)                                ; $0A8F70 |
  inc   r1                                  ; $0A8F72 |
  iwt   r2,#$FF81                           ; $0A8F73 |
  to r2                                     ; $0A8F76 |
  add   r2                                  ; $0A8F77 |
  ibt   r3,#$0000                           ; $0A8F78 |
  dec   r12                                 ; $0A8F7A |
  cache                                     ; $0A8F7B |
  move  r13,r15                             ; $0A8F7C |
  getb                                      ; $0A8F7E |
  inc   r14                                 ; $0A8F7F |
  swap                                      ; $0A8F80 |
  fmult                                     ; $0A8F81 |
  stb   (r1)                                ; $0A8F82 |
  getb                                      ; $0A8F84 |
  swap                                      ; $0A8F85 |
  fmult                                     ; $0A8F86 |
  to r4                                     ; $0A8F87 |
  sub   r2                                  ; $0A8F88 |
  bpl CODE_0A8FA1                           ; $0A8F89 |
  inc   r14                                 ; $0A8F8B |
  from r2                                   ; $0A8F8C |
  sub   r3                                  ; $0A8F8D |
  bpl CODE_0A8F9F                           ; $0A8F8E |
  from r1                                   ; $0A8F90 |
  to r5                                     ; $0A8F91 |
  sub   #2                                  ; $0A8F92 |
  to r3                                     ; $0A8F94 |
  ldb   (r5)                                ; $0A8F95 |
  from r4                                   ; $0A8F97 |
  not                                       ; $0A8F98 |
  inc   r0                                  ; $0A8F99 |
  lsr                                       ; $0A8F9A |
  lsr                                       ; $0A8F9B |
  add   r3                                  ; $0A8F9C |
  stb   (r5)                                ; $0A8F9D |

CODE_0A8F9F:
  move  r0,r2                               ; $0A8F9F |

CODE_0A8FA1:
  inc   r1                                  ; $0A8FA1 |
  stb   (r1)                                ; $0A8FA2 |
  move  r3,r0                               ; $0A8FA4 |
  loop                                      ; $0A8FA6 |
  inc   r1                                  ; $0A8FA7 |
  iwt   r1,#$49C7                           ; $0A8FA8 |
  iwt   r2,#$4C76                           ; $0A8FAB |
  move  r12,r11                             ; $0A8FAE |
  move  r13,r15                             ; $0A8FB0 |
  ldb   (r1)                                ; $0A8FB2 |
  stb   (r2)                                ; $0A8FB4 |
  inc   r1                                  ; $0A8FB6 |
  loop                                      ; $0A8FB7 |
  inc   r2                                  ; $0A8FB8 |
  stop                                      ; $0A8FB9 |
  nop                                       ; $0A8FBA |

  iwt   r3,#$4C76                           ; $0A8FBB |
  iwt   r1,#$49C6                           ; $0A8FBE |
  to r12                                    ; $0A8FC1 |
  ldb   (r1)                                ; $0A8FC2 |
  inc   r1                                  ; $0A8FC4 |
  cache                                     ; $0A8FC5 |
  move  r13,r15                             ; $0A8FC6 |
  ldb   (r1)                                ; $0A8FC8 |
  to r2                                     ; $0A8FCA |
  sex                                       ; $0A8FCB |
  ldb   (r3)                                ; $0A8FCC |
  inc   r3                                  ; $0A8FCE |
  sex                                       ; $0A8FCF |
  sub   r2                                  ; $0A8FD0 |
  beq CODE_0A8FDD                           ; $0A8FD1 |
  inc   r3                                  ; $0A8FD3 |
  hib                                       ; $0A8FD4 |
  sex                                       ; $0A8FD5 |
  bmi CODE_0A8FDA                           ; $0A8FD6 |
  nop                                       ; $0A8FD8 |
  inc   r0                                  ; $0A8FD9 |

CODE_0A8FDA:
  add   r2                                  ; $0A8FDA |
  stb   (r1)                                ; $0A8FDB |

CODE_0A8FDD:
  inc   r1                                  ; $0A8FDD |
  loop                                      ; $0A8FDE |
  inc   r1                                  ; $0A8FDF |
  stop                                      ; $0A8FE0 |
  nop                                       ; $0A8FE1 |

  iwt   r10,#$4C76                          ; $0A8FE2 |
  iwt   r1,#$49C6                           ; $0A8FE5 |
  to r12                                    ; $0A8FE8 |
  ldb   (r1)                                ; $0A8FE9 |
  inc   r1                                  ; $0A8FEB |
  inc   r1                                  ; $0A8FEC |
  to r3                                     ; $0A8FED |
  ldb   (r1)                                ; $0A8FEE |
  dec   r1                                  ; $0A8FF0 |
  iwt   r2,#$4C96                           ; $0A8FF1 |
  cache                                     ; $0A8FF4 |
  move  r13,r15                             ; $0A8FF5 |
  to r5                                     ; $0A8FF7 |
  ldb   (r1)                                ; $0A8FF8 |
  move  r7,r1                               ; $0A8FFA |
  inc   r1                                  ; $0A8FFC |
  ldb   (r1)                                ; $0A8FFD |
  inc   r1                                  ; $0A8FFF |
  sex                                       ; $0A9000 |
  sub   r3                                  ; $0A9001 |
  lmult                                     ; $0A9002 |
  with r4                                   ; $0A9004 |
  hib                                       ; $0A9005 |
  lob                                       ; $0A9006 |
  swap                                      ; $0A9007 |
  or    r4                                  ; $0A9008 |
  to r8                                     ; $0A9009 |
  ldw   (r2)                                ; $0A900A |
  inc   r2                                  ; $0A900B |
  inc   r2                                  ; $0A900C |
  sbk                                       ; $0A900D |
  sub   r8                                  ; $0A900E |
  move  r8,r0                               ; $0A900F |
  add   r5                                  ; $0A9011 |
  stb   (r7)                                ; $0A9012 |
  ldb   (r10)                               ; $0A9014 |
  add   r8                                  ; $0A9016 |
  stb   (r10)                               ; $0A9017 |
  inc   r10                                 ; $0A9019 |
  loop                                      ; $0A901A |
  inc   r10                                 ; $0A901B |
  stop                                      ; $0A901C |
  nop                                       ; $0A901D |

  db $C8, $14, $02, $C8, $38, $02, $80, $26 ; $0A901E |
  db $01, $9C, $68, $08, $54, $54, $02, $40 ; $0A9026 |
  db $64, $01, $E8, $08, $05, $E0, $76, $05 ; $0A902E |
  db $C0, $8E, $01                          ; $0A9036 |

  ibt   r0,#$000A                           ; $0A9039 |
  romb                                      ; $0A903B |
  iwt   r14,#$901E                          ; $0A903D |
  with r2                                   ; $0A9040 |
  sub   #8                                  ; $0A9041 |
  with r3                                   ; $0A9043 |
  sex                                       ; $0A9044 |
  with r4                                   ; $0A9045 |
  sex                                       ; $0A9046 |
  from r4                                   ; $0A9047 |
  to r3                                     ; $0A9048 |
  sub   r3                                  ; $0A9049 |
  iwt   r8,#$3372                           ; $0A904A |
  iwt   r9,#$3516                           ; $0A904D |
  cache                                     ; $0A9050 |
  ibt   r7,#$0009                           ; $0A9051 |
  getb                                      ; $0A9053 |

CODE_0A9054:
  inc   r14                                 ; $0A9054 |
  umult r3                                  ; $0A9055 |
  hib                                       ; $0A9057 |
  to r10                                    ; $0A9058 |
  sub   r4                                  ; $0A9059 |
  from r2                                   ; $0A905A |
  sub   r10                                 ; $0A905B |
  move  r11,r0                              ; $0A905C |
  add   r0                                  ; $0A905E |
  add   r8                                  ; $0A905F |
  ldw   (r0)                                ; $0A9060 |
  add   r11                                 ; $0A9061 |
  add   #9                                  ; $0A9062 |
  to r12                                    ; $0A9064 |
  lob                                       ; $0A9065 |
  getbs                                     ; $0A9066 |
  move  r13,r0                              ; $0A9068 |
  inc   r14                                 ; $0A906A |
  umult r12                                 ; $0A906B |
  add   r0                                  ; $0A906D |
  hib                                       ; $0A906E |
  add   r0                                  ; $0A906F |
  sub   r12                                 ; $0A9070 |
  to r12                                    ; $0A9071 |
  div2                                      ; $0A9072 |
  from r9                                   ; $0A9074 |
  add   r11                                 ; $0A9075 |
  add   r11                                 ; $0A9076 |
  to r11                                    ; $0A9077 |
  ldw   (r0)                                ; $0A9078 |
  iwt   r0,#$0080                           ; $0A9079 |
  sub   r11                                 ; $0A907C |
  add   r12                                 ; $0A907D |
  to r11                                    ; $0A907E |
  sub   r1                                  ; $0A907F |
  ibt   r0,#$0040                           ; $0A9080 |
  sub   r13                                 ; $0A9082 |
  bcs CODE_0A908C                           ; $0A9083 |
  add   r13                                 ; $0A9085 |
  add   r0                                  ; $0A9086 |
  to r13                                    ; $0A9087 |
  sub   r13                                 ; $0A9088 |
  bcc CODE_0A908D                           ; $0A9089 |
  sub   r0                                  ; $0A908B |

CODE_0A908C:
  from r13                                  ; $0A908C |

CODE_0A908D:
  umult r6                                  ; $0A908D |
  add   r0                                  ; $0A908F |
  hib                                       ; $0A9090 |
  with r10                                  ; $0A9091 |
  sub   r0                                  ; $0A9092 |
  to r12                                    ; $0A9093 |
  getb                                      ; $0A9094 |
  inc   r14                                 ; $0A9095 |
  move  r13,r15                             ; $0A9096 |
  ldw   (r5)                                ; $0A9098 |
  add   r11                                 ; $0A9099 |
  sbk                                       ; $0A909A |
  inc   r5                                  ; $0A909B |
  inc   r5                                  ; $0A909C |
  ldw   (r5)                                ; $0A909D |
  sub   r10                                 ; $0A909E |
  with r5                                   ; $0A909F |
  add   #6                                  ; $0A90A0 |
  loop                                      ; $0A90A2 |
  sbk                                       ; $0A90A3 |
  dec   r7                                  ; $0A90A4 |
  bne CODE_0A9054                           ; $0A90A5 |
  getb                                      ; $0A90A7 |
  lms   r6,($0002)                          ; $0A90A8 |
  iwt   r0,#$2A00                           ; $0A90AB |
  to r7                                     ; $0A90AE |
  fmult                                     ; $0A90AF |
  ibt   r0,#$0058                           ; $0A90B0 |
  with r5                                   ; $0A90B2 |
  sub   r0                                  ; $0A90B3 |
  ldw   (r5)                                ; $0A90B4 |
  sub   r7                                  ; $0A90B5 |
  sbk                                       ; $0A90B6 |
  ibt   r0,#$0028                           ; $0A90B7 |
  to r5                                     ; $0A90B9 |
  add   r5                                  ; $0A90BA |
  ldw   (r5)                                ; $0A90BB |
  add   r7                                  ; $0A90BC |
  ibt   r7,#$0010                           ; $0A90BD |
  sub   r7                                  ; $0A90BF |
  sbk                                       ; $0A90C0 |
  lms   r0,($0000)                          ; $0A90C1 |
  sub   #0                                  ; $0A90C4 |
  bmi CODE_0A90FD                           ; $0A90C6 |
  nop                                       ; $0A90C8 |
  ibt   r0,#$0030                           ; $0A90C9 |
  to r5                                     ; $0A90CB |
  add   r5                                  ; $0A90CC |
  iwt   r0,#$008F                           ; $0A90CD |
  lmult                                     ; $0A90D0 |
  iwt   r0,#$0080                           ; $0A90D2 |
  add   r4                                  ; $0A90D5 |
  to r10                                    ; $0A90D6 |
  hib                                       ; $0A90D7 |
  from r8                                   ; $0A90D8 |
  add   r2                                  ; $0A90D9 |
  add   r2                                  ; $0A90DA |
  ldw   (r0)                                ; $0A90DB |
  add   r2                                  ; $0A90DC |
  add   #9                                  ; $0A90DD |
  sub   r10                                 ; $0A90DF |
  to r10                                    ; $0A90E0 |
  div2                                      ; $0A90E1 |
  from r9                                   ; $0A90E3 |
  add   r2                                  ; $0A90E4 |
  add   r2                                  ; $0A90E5 |
  to r11                                    ; $0A90E6 |
  ldw   (r0)                                ; $0A90E7 |
  iwt   r0,#$0080                           ; $0A90E8 |
  sub   r11                                 ; $0A90EB |
  sub   r1                                  ; $0A90EC |
  to r11                                    ; $0A90ED |
  add   r10                                 ; $0A90EE |
  sms   ($0000),r11                         ; $0A90EF |
  ibt   r12,#$0004                          ; $0A90F2 |
  move  r13,r15                             ; $0A90F4 |
  ldw   (r5)                                ; $0A90F6 |
  add   r11                                 ; $0A90F7 |
  with r5                                   ; $0A90F8 |
  add   #8                                  ; $0A90F9 |
  loop                                      ; $0A90FB |
  sbk                                       ; $0A90FC |

CODE_0A90FD:
  stop                                      ; $0A90FD |
  nop                                       ; $0A90FE |

  romb                                      ; $0A90FF |
  with r14                                  ; $0A9101 |
  add   #4                                  ; $0A9102 |
  iwt   r1,#$49CB                           ; $0A9104 |
  ibt   r12,#$000D                          ; $0A9107 |
  iwt   r0,#$0100                           ; $0A9109 |
  sub   r7                                  ; $0A910C |
  bmi CODE_0A9112                           ; $0A910D |
  add   r7                                  ; $0A910F |
  move  r0,r7                               ; $0A9110 |

CODE_0A9112:
  move  r8,r0                               ; $0A9112 |
  from r7                                   ; $0A9114 |
  lsr                                       ; $0A9115 |
  lsr                                       ; $0A9116 |
  lsr                                       ; $0A9117 |
  to r7                                     ; $0A9118 |
  lsr                                       ; $0A9119 |
  ibt   r2,#$FFB4                           ; $0A911A |
  ibt   r3,#$0000                           ; $0A911C |
  ibt   r9,#$0038                           ; $0A911E |
  cache                                     ; $0A9120 |
  move  r13,r15                             ; $0A9121 |
  getb                                      ; $0A9123 |
  inc   r14                                 ; $0A9124 |
  swap                                      ; $0A9125 |
  move  r6,r8                               ; $0A9126 |
  fmult                                     ; $0A9128 |
  stb   (r1)                                ; $0A9129 |
  getbs                                     ; $0A912B |
  sub   r9                                  ; $0A912D |
  move  r6,r7                               ; $0A912E |
  lmult                                     ; $0A9130 |
  with r4                                   ; $0A9132 |
  hib                                       ; $0A9133 |
  lob                                       ; $0A9134 |
  swap                                      ; $0A9135 |
  or    r4                                  ; $0A9136 |
  add   r9                                  ; $0A9137 |
  to r4                                     ; $0A9138 |
  sub   r2                                  ; $0A9139 |
  bpl CODE_0A9152                           ; $0A913A |
  inc   r14                                 ; $0A913C |
  from r2                                   ; $0A913D |
  sub   r3                                  ; $0A913E |
  bpl CODE_0A9150                           ; $0A913F |
  from r1                                   ; $0A9141 |
  to r5                                     ; $0A9142 |
  sub   #2                                  ; $0A9143 |
  to r3                                     ; $0A9145 |
  ldb   (r5)                                ; $0A9146 |
  from r4                                   ; $0A9148 |
  not                                       ; $0A9149 |
  inc   r0                                  ; $0A914A |
  lsr                                       ; $0A914B |
  lsr                                       ; $0A914C |
  add   r3                                  ; $0A914D |
  stb   (r5)                                ; $0A914E |

CODE_0A9150:
  move  r0,r2                               ; $0A9150 |

CODE_0A9152:
  inc   r1                                  ; $0A9152 |
  stb   (r1)                                ; $0A9153 |
  move  r3,r0                               ; $0A9155 |
  loop                                      ; $0A9157 |
  inc   r1                                  ; $0A9158 |
  iwt   r10,#$0100                          ; $0A9159 |
  from r10                                  ; $0A915C |
  sub   r7                                  ; $0A915D |
  add   r0                                  ; $0A915E |
  add   r0                                  ; $0A915F |
  sub   r10                                 ; $0A9160 |
  bcc CODE_0A9166                           ; $0A9161 |
  add   r10                                 ; $0A9163 |
  move  r0,r10                              ; $0A9164 |

CODE_0A9166:
  move  r6,r0                               ; $0A9166 |
  iwt   r0,#$4700                           ; $0A9168 |
  fmult                                     ; $0A916B |
  ibt   r3,#$0038                           ; $0A916C |
  add   r3                                  ; $0A916E |
  iwt   r1,#$49C8                           ; $0A916F |
  stb   (r1)                                ; $0A9172 |
  iwt   r0,#$0800                           ; $0A9174 |
  fmult                                     ; $0A9177 |
  to r3                                     ; $0A9178 |
  add   r3                                  ; $0A9179 |
  iwt   r0,#$0100                           ; $0A917A |
  sub   r8                                  ; $0A917D |
  iwt   r6,#$1000                           ; $0A917E |
  fmult                                     ; $0A9181 |
  add   r3                                  ; $0A9182 |
  inc   r1                                  ; $0A9183 |
  inc   r1                                  ; $0A9184 |
  stb   (r1)                                ; $0A9185 |
  iwt   r2,#$49E6                           ; $0A9187 |
  stb   (r2)                                ; $0A918A |
  ibt   r0,#$0020                           ; $0A918C |
  sub   r8                                  ; $0A918E |
  bpl CODE_0A9194                           ; $0A918F |
  add   r8                                  ; $0A9191 |
  move  r0,r8                               ; $0A9192 |

CODE_0A9194:
  iwt   r6,#$4000                           ; $0A9194 |
  fmult                                     ; $0A9197 |
  dec   r2                                  ; $0A9198 |
  stb   (r2)                                ; $0A9199 |
  not                                       ; $0A919B |
  inc   r0                                  ; $0A919C |
  dec   r1                                  ; $0A919D |
  stb   (r1)                                ; $0A919E |
  stop                                      ; $0A91A0 |
  nop                                       ; $0A91A1 |

  with r2                                   ; $0A91A2 |
  sub   #8                                  ; $0A91A3 |
  from r2                                   ; $0A91A5 |
  add   r2                                  ; $0A91A6 |
  iwt   r8,#$3372                           ; $0A91A7 |
  add   r8                                  ; $0A91AA |
  ldw   (r0)                                ; $0A91AB |
  add   r2                                  ; $0A91AC |
  add   #9                                  ; $0A91AD |
  lob                                       ; $0A91AF |
  move  r12,r0                              ; $0A91B0 |
  umult r3                                  ; $0A91B2 |
  hib                                       ; $0A91B4 |
  add   r0                                  ; $0A91B5 |
  sub   r12                                 ; $0A91B6 |
  to r12                                    ; $0A91B7 |
  div2                                      ; $0A91B8 |
  iwt   r0,#$3516                           ; $0A91BA |
  add   r2                                  ; $0A91BD |
  add   r2                                  ; $0A91BE |
  to r11                                    ; $0A91BF |
  ldw   (r0)                                ; $0A91C0 |
  iwt   r0,#$0080                           ; $0A91C1 |
  sub   r11                                 ; $0A91C4 |
  add   r12                                 ; $0A91C5 |
  sub   r1                                  ; $0A91C6 |
  stop                                      ; $0A91C7 |
  nop                                       ; $0A91C8 |

  sub   r0                                  ; $0A91C9 |
  move  r7,r0                               ; $0A91CA |
  ibt   r12,#$0020                          ; $0A91CC |
  iwt   r13,#$91D2                          ; $0A91CE |
  with r7                                   ; $0A91D1 |
  add   r7                                  ; $0A91D2 |
  with r4                                   ; $0A91D3 |
  add   r4                                  ; $0A91D4 |
  rol                                       ; $0A91D5 |
  sub   r6                                  ; $0A91D6 |
  bcc CODE_0A91DC                           ; $0A91D7 |
  add   r6                                  ; $0A91D9 |
  sub   r6                                  ; $0A91DA |
  inc   r7                                  ; $0A91DB |

CODE_0A91DC:
  loop                                      ; $0A91DC |
  with r7                                   ; $0A91DD |
  stop                                      ; $0A91DE |
  nop                                       ; $0A91DF |

  ibt   r0,#$0008                           ; $0A91E0 |
  romb                                      ; $0A91E2 |
  from r1                                   ; $0A91E4 |
  lsr                                       ; $0A91E5 |
  lsr                                       ; $0A91E6 |
  lsr                                       ; $0A91E7 |
  lsr                                       ; $0A91E8 |
  lob                                       ; $0A91E9 |
  to r7                                     ; $0A91EA |
  umult r2                                  ; $0A91EB |
  from r1                                   ; $0A91ED |
  and   #15                                 ; $0A91EE |
  add   r0                                  ; $0A91F0 |
  umult #8                                  ; $0A91F1 |
  iwt   r14,#$AE18                          ; $0A91F3 |
  to r14                                    ; $0A91F6 |
  add   r14                                 ; $0A91F7 |
  getbs                                     ; $0A91F8 |
  add   r0                                  ; $0A91FA |
  to r6                                     ; $0A91FB |
  add   r0                                  ; $0A91FC |
  from r7                                   ; $0A91FD |
  to r1                                     ; $0A91FE |
  fmult                                     ; $0A91FF |
  from r5                                   ; $0A9200 |
  lmult                                     ; $0A9201 |
  with r4                                   ; $0A9203 |
  hib                                       ; $0A9204 |
  lob                                       ; $0A9205 |
  swap                                      ; $0A9206 |
  to r3                                     ; $0A9207 |
  or    r4                                  ; $0A9208 |
  ibt   r0,#$0040                           ; $0A9209 |
  to r14                                    ; $0A920B |
  add   r14                                 ; $0A920C |
  getbs                                     ; $0A920D |
  add   r0                                  ; $0A920F |
  to r6                                     ; $0A9210 |
  add   r0                                  ; $0A9211 |
  from r7                                   ; $0A9212 |
  to r2                                     ; $0A9213 |
  fmult                                     ; $0A9214 |
  from r5                                   ; $0A9215 |
  lmult                                     ; $0A9216 |
  with r4                                   ; $0A9218 |
  hib                                       ; $0A9219 |
  lob                                       ; $0A921A |
  swap                                      ; $0A921B |
  to r4                                     ; $0A921C |
  or    r4                                  ; $0A921D |
  stop                                      ; $0A921E |
  nop                                       ; $0A921F |

; sprite hitbox table, indexed by first 5 bits of $0A9320 table
; 4 word entries
; Word 1: X offset for hitbox center
; Word 2: Y offset for hitbox center
; Word 3: Width of hitbox from center (both sides)
; Word 4: Height of hitbox from center (top & bottom)
sprite_hitbox_settings:
  db $08, $00, $08, $00, $06, $00, $06, $00 ; $0A9220 |
  db $08, $00, $08, $00, $07, $00, $0C, $00 ; $0A9228 |
  db $08, $00, $08, $00, $0C, $00, $0C, $00 ; $0A9230 |
  db $08, $00, $FC, $FF, $06, $00, $04, $00 ; $0A9238 |
  db $08, $00, $03, $00, $08, $00, $0C, $00 ; $0A9240 |
  db $08, $00, $08, $00, $00, $00, $18, $00 ; $0A9248 |
  db $08, $00, $04, $00, $06, $00, $0A, $00 ; $0A9250 |
  db $08, $00, $F9, $FF, $10, $00, $16, $00 ; $0A9258 |
  db $08, $00, $00, $00, $06, $00, $0E, $00 ; $0A9260 |
  db $08, $00, $08, $00, $0A, $00, $0A, $00 ; $0A9268 |
  db $08, $00, $08, $00, $07, $00, $07, $00 ; $0A9270 |
  db $08, $00, $10, $00, $0C, $00, $08, $00 ; $0A9278 |
  db $08, $00, $08, $00, $18, $00, $18, $00 ; $0A9280 |
  db $08, $00, $F8, $FF, $06, $00, $12, $00 ; $0A9288 |
  db $08, $00, $04, $00, $06, $00, $0C, $00 ; $0A9290 |
  db $08, $00, $08, $00, $02, $00, $02, $00 ; $0A9298 |
  db $08, $00, $08, $00, $08, $00, $0C, $00 ; $0A92A0 |
  db $08, $00, $00, $00, $0E, $00, $16, $00 ; $0A92A8 |
  db $08, $00, $08, $00, $0A, $00, $0C, $00 ; $0A92B0 |
  db $08, $00, $08, $00, $20, $00, $20, $00 ; $0A92B8 |
  db $08, $00, $08, $00, $18, $00, $08, $00 ; $0A92C0 |
  db $08, $00, $08, $00, $08, $00, $18, $00 ; $0A92C8 |
  db $08, $00, $04, $00, $06, $00, $0A, $00 ; $0A92D0 |
  db $08, $00, $00, $00, $0C, $00, $0E, $00 ; $0A92D8 |
  db $08, $00, $0E, $00, $06, $00, $0A, $00 ; $0A92E0 |
  db $08, $00, $08, $00, $11, $00, $18, $00 ; $0A92E8 |
  db $08, $00, $08, $00, $18, $00, $18, $00 ; $0A92F0 |
  db $08, $00, $08, $00, $10, $00, $10, $00 ; $0A92F8 |
  db $08, $00, $08, $00, $0C, $00, $0C, $00 ; $0A9300 |
  db $08, $00, $08, $00, $04, $00, $04, $00 ; $0A9308 |
  db $08, $00, $09, $00, $08, $00, $0A, $00 ; $0A9310 |
  db $08, $00, $0C, $00, $0C, $00, $0C, $00 ; $0A9318 |

; sprite table (bit 8 makes sprites inedible if set)
; A bunch of bitwise settings, mostly behavior related
; byte 1: 000h hhhh
; h = hitbox index for $0A9220 table
  dw $0040, $0060, $0060, $0062             ; $0A9320 |
  dw $0060, $8420, $0262, $8420             ; $0A9328 |
  dw $0060, $8420, $7660, $68A0             ; $0A9330 |
  dw $687A, $0060, $0060, $0060             ; $0A9338 |
  dw $0160, $0060, $0060, $0060             ; $0A9340 |
  dw $0060, $0200, $0560, $4400             ; $0A9348 |
  dw $027F, $0000, $0040, $0040             ; $0A9350 |
  dw $4480, $0042, $4E00, $0460             ; $0A9358 |
  dw $FC20, $0462, $003C, $003C             ; $0A9360 |
  dw $003C, $003C, $0037, $023C             ; $0A9368 |
  dw $003C, $0037, $0037, $0037             ; $0A9370 |
  dw $EC43, $EC40, $E840, $0260             ; $0A9378 |
  dw $4E00, $6C00, $0260, $4E60             ; $0A9380 |
  dw $0044, $0140, $0040, $2400             ; $0A9388 |
  dw $68A0, $0040, $7E00, $7E00             ; $0A9390 |
  dw $6C7A, $0060, $0060, $EC40             ; $0A9398 |
  dw $0460, $0460, $0060, $4E02             ; $0A93A0 |
  dw $4E02, $0462, $0060, $0660             ; $0A93A8 |
  dw $0060, $00A0, $68A0, $68A0             ; $0A93B0 |
  dw $6C60, $0060, $0060, $0060             ; $0A93B8 |
  dw $0040, $0040, $0060, $0060             ; $0A93C0 |
  dw $BE00, $0060, $0060, $0160             ; $0A93C8 |
  dw $EE00, $0060, $68A0, $FC20             ; $0A93D0 |
  dw $0060, $B46A, $0040, $0040             ; $0A93D8 |
  dw $6860, $F620, $4E00, $7480             ; $0A93E0 |
  dw $0060, $047E, $BE00, $C060             ; $0A93E8 |
  dw $F46A, $F46A, $F46A, $0460             ; $0A93F0 |
  dw $0060, $6CA0, $6CA0, $0060             ; $0A93F8 |
  dw $74A9, $6CA9, $6E60, $0067             ; $0A9400 |
  dw $7E00, $6860, $68A0, $68A0             ; $0A9408 |
  dw $F466, $F466, $F466, $6860             ; $0A9410 |
  dw $6860, $6860, $0060, $6860             ; $0A9418 |
  dw $6C20, $6C20, $6CA0, $0060             ; $0A9420 |
  dw $007B, $7E00, $8060, $0060             ; $0A9428 |
  dw $0060, $0060, $0060, $6C00             ; $0A9430 |
  dw $0060, $7C00, $0662, $0060             ; $0A9438 |
  dw $0160, $0060, $3420, $0060             ; $0A9440 |
  dw $B46A, $0460, $0460, $0060             ; $0A9448 |
  dw $0060, $6C00, $F060, $7E00             ; $0A9450 |
  dw $0060, $0060, $04A2, $6EA8             ; $0A9458 |
  dw $0460, $B620, $6861, $0060             ; $0A9460 |
  dw $0060, $0060, $6C60, $6860             ; $0A9468 |
  dw $6C60, $0060, $0060, $0060             ; $0A9470 |
  dw $0060, $B460, $6E6C, $0460             ; $0A9478 |
  dw $0460, $0460, $0460, $0673             ; $0A9480 |
  dw $0460, $0460, $0460, $0460             ; $0A9488 |
  dw $0460, $0460, $0460, $0460             ; $0A9490 |
  dw $0460, $0460, $0460, $0460             ; $0A9498 |
  dw $0460, $0460, $0460, $0460             ; $0A94A0 |
  dw $0460, $0460, $0460, $0460             ; $0A94A8 |
  dw $0460, $0460, $0060, $0460             ; $0A94B0 |
  dw $0460, $0020, $0060, $0060             ; $0A94B8 |
  dw $007C, $0060, $0060, $4EBA             ; $0A94C0 |
  dw $4EA2, $0060, $0160, $0560             ; $0A94C8 |
  dw $0060, $0420, $0460, $0060             ; $0A94D0 |
  dw $04A2, $0060, $0060, $6E00             ; $0A94D8 |
  dw $6E00, $6C80, $06A0, $06A0             ; $0A94E0 |
  dw $6860, $6C00, $260F, $7482             ; $0A94E8 |
  dw $6C20, $6C00, $7C00, $7C00             ; $0A94F0 |
  dw $6E00, $6E00, $6860, $6860             ; $0A94F8 |
  dw $6C20, $0060, $4C2D, $4E20             ; $0A9500 |
  dw $0060, $78AE, $7C82, $7480             ; $0A9508 |
  dw $6CA0, $6E1D, $0462, $6C20             ; $0A9510 |
  dw $6C20, $4C10, $6C6F, $F462             ; $0A9518 |
  dw $0402, $0060, $0060, $0060             ; $0A9520 |
  dw $7E80, $0060, $0060, $066F             ; $0A9528 |
  dw $7C00, $6C20, $6C20, $6C20             ; $0A9530 |
  dw $68A2, $0060, $0062, $6860             ; $0A9538 |
  dw $0462, $0600, $0060, $7E00             ; $0A9540 |
  dw $006F, $043E, $00A0, $0060             ; $0A9548 |
  dw $0062, $7622, $7C8E, $7C00             ; $0A9550 |
  dw $0600, $6C00, $0020, $0020             ; $0A9558 |
  dw $0422, $0062, $0462, $0462             ; $0A9560 |
  dw $7401, $0460, $6CB1, $6CA0             ; $0A9568 |
  dw $06A0, $0400, $4E00, $4E32             ; $0A9570 |
  dw $6E20, $0060, $0060, $6CA0             ; $0A9578 |
  dw $6CA0, $0060, $7E0F, $4E00             ; $0A9580 |
  dw $06A2, $7E80, $7E80, $0460             ; $0A9588 |
  dw $0460, $0460, $0460, $0060             ; $0A9590 |
  dw $04B4, $FE00, $FE00, $7E00             ; $0A9598 |
  dw $7E00, $7E00, $7E00, $74A0             ; $0A95A0 |
  dw $04B5, $4E20, $4E20, $007C             ; $0A95A8 |
  dw $0060, $0460, $0460, $0460             ; $0A95B0 |
  dw $0460, $0460, $0460, $0460             ; $0A95B8 |
  dw $0460, $0460, $0436, $6C20             ; $0A95C0 |
  dw $0060, $7422, $6E82, $4C00             ; $0A95C8 |
  dw $74A2, $7C2E, $7C2E, $6E00             ; $0A95D0 |
  dw $3440, $3440, $0060, $3060             ; $0A95D8 |
  dw $3060, $0060, $3440, $6E00             ; $0A95E0 |
  dw $6600, $6E00, $4C00, $0620             ; $0A95E8 |
  dw $0620, $6618, $6618, $4E38             ; $0A95F0 |
  dw $4E38, $4E38, $4E38, $4E38             ; $0A95F8 |
  dw $C660, $ACA0, $ACA0, $0420             ; $0A9600 |
  dw $0420, $0460, $0461, $0460             ; $0A9608 |
  dw $0420, $0460, $0420, $0420             ; $0A9610 |
  dw $0420, $0420, $0460, $0460             ; $0A9618 |
  dw $0060, $4416, $0060, $0060             ; $0A9620 |
  dw $2600, $0060, $0060, $0060             ; $0A9628 |
  dw $0060, $0060, $0060, $0060             ; $0A9630 |
  dw $0060, $0060, $0060, $0062             ; $0A9638 |
  dw $6C40, $0060, $4C00, $0160             ; $0A9640 |
  dw $6C40, $0060, $0060, $0060             ; $0A9648 |
  dw $0060, $04A0, $4E20, $2600             ; $0A9650 |
  dw $2600, $4E20, $6600, $4E20             ; $0A9658 |
  dw $04A0, $04A0, $0620, $6620             ; $0A9660 |
  dw $F479, $C200, $C200, $C200             ; $0A9668 |
  dw $C200, $C200, $6EA0, $6E20             ; $0A9670 |
  dw $0060, $46A0, $6CA0, $047E             ; $0A9678 |
  dw $0060, $006F, $0400, $0240             ; $0A9680 |
  dw $0060, $0440, $0040, $0660             ; $0A9688 |
  dw $0060, $0660                           ; $0A9690 |

; freespace
  dw $FFFF, $FFFF                           ; $0A9694 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9698 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96A0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96A8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96B0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96B8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96C0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96C8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96D0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96D8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96E0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96E8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96F0 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A96F8 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9700 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9708 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9710 |
  dw $FFFF, $FFFF, $FFFF                    ; $0A9718 |

; sprite table (determines if sprites stay on ledges?)
; A bunch of bitwise settings, mostly terrain related
  dw $4484, $4008, $2000, $4003             ; $0A971E |
  dw $4000, $60A0, $2040, $60A0             ; $0A9726 |
  dw $2000, $60A0, $0959, $2021             ; $0A972E |
  dw $20A0, $2000, $2000, $2000             ; $0A9736 |
  dw $2000, $2000, $4008, $2000             ; $0A973E |
  dw $2000, $205C, $2000, $0841             ; $0A9746 |
  dw $205E, $2040, $401E, $405C             ; $0A974E |
  dw $08A5, $405E, $0E81, $2000             ; $0A9756 |
  dw $0801, $4003, $205C, $205C             ; $0A975E |
  dw $205C, $205C, $205C, $6041             ; $0A9766 |
  dw $2081, $205A, $205C, $205C             ; $0A976E |
  dw $0040, $4040, $2060, $2000             ; $0A9776 |
  dw $0941, $0941, $2000, $0000             ; $0A977E |
  dw $2041, $2040, $2041, $0881             ; $0A9786 |
  dw $0040, $4040, $880A, $880A             ; $0A978E |
  dw $2221, $4000, $4000, $4040             ; $0A9796 |
  dw $2001, $2000, $2000, $0857             ; $0A979E |
  dw $0857, $2000, $2040, $A041             ; $0A97A6 |
  dw $A000, $2481, $2681, $2681             ; $0A97AE |
  dw $0001, $2040, $4008, $2040             ; $0A97B6 |
  dw $4040, $4040, $4000, $2040             ; $0A97BE |
  dw $8841, $405B, $405B, $4000             ; $0A97C6 |
  dw $0881, $2040, $0000, $0801             ; $0A97CE |
  dw $4000, $4040, $4040, $4040             ; $0A97D6 |
  dw $203B, $604F, $0E81, $0C01             ; $0A97DE |
  dw $405B, $2000, $8841, $2000             ; $0A97E6 |
  dw $4040, $4040, $4040, $4000             ; $0A97EE |
  dw $4001, $080A, $080A, $4001             ; $0A97F6 |
  dw $0843, $0000, $0006, $4040             ; $0A97FE |
  dw $0D41, $0040, $000B, $000B             ; $0A9806 |
  dw $2041, $2041, $2041, $0040             ; $0A980E |
  dw $0021, $0040, $4040, $4040             ; $0A9816 |
  dw $0020, $0021, $0041, $2000             ; $0A981E |
  dw $2000, $0941, $2040, $2041             ; $0A9826 |
  dw $2041, $4040, $4040, $0061             ; $0A982E |
  dw $2016, $0000, $2019, $0000             ; $0A9836 |
  dw $4000, $C000, $0841, $4008             ; $0A983E |
  dw $404C, $4040, $4040, $4000             ; $0A9846 |
  dw $4000, $0018, $4000, $0D41             ; $0A984E |
  dw $0040, $4001, $400E, $0801             ; $0A9856 |
  dw $2000, $4041, $2018, $0801             ; $0A985E |
  dw $0801, $2000, $2000, $2000             ; $0A9866 |
  dw $2000, $2000, $2000, $2000             ; $0A986E |
  dw $2000, $4040, $2056, $2020             ; $0A9876 |
  dw $2020, $2020, $2020, $2000             ; $0A987E |
  dw $2020, $2020, $2020, $2020             ; $0A9886 |
  dw $2020, $2020, $2020, $2020             ; $0A988E |
  dw $2020, $2020, $2020, $2020             ; $0A9896 |
  dw $2020, $2020, $2020, $2020             ; $0A989E |
  dw $2020, $2020, $2020, $2020             ; $0A98A6 |
  dw $2020, $2020, $4008, $2020             ; $0A98AE |
  dw $2020, $2061, $2000, $2000             ; $0A98B6 |
  dw $2000, $2000, $2401, $001F             ; $0A98BE |
  dw $0003, $4000, $4000, $2000             ; $0A98C6 |
  dw $4000, $0012, $2001, $4000             ; $0A98CE |
  dw $4011, $4000, $4000, $84A1             ; $0A98D6 |
  dw $8000, $04A0, $0947, $0947             ; $0A98DE |
  dw $0881, $0858, $0800, $0041             ; $0A98E6 |
  dw $0800, $0841, $0000, $0000             ; $0A98EE |
  dw $0861, $0861, $3001, $1001             ; $0A98F6 |
  dw $0000, $2001, $0801, $0841             ; $0A98FE |
  dw $2001, $0955, $0943, $0941             ; $0A9906 |
  dw $0801, $2018, $2000, $0941             ; $0A990E |
  dw $0941, $0C99, $0000, $44A3             ; $0A9916 |
  dw $A043, $4000, $4000, $2000             ; $0A991E |
  dw $0006, $2000, $2000, $205D             ; $0A9926 |
  dw $0941, $0841, $0941, $0841             ; $0A992E |
  dw $201C, $2000, $4003, $0000             ; $0A9936 |
  dw $2000, $1149, $2013, $0159             ; $0A993E |
  dw $0000, $E481, $401C, $4000             ; $0A9946 |
  dw $4000, $8E83, $0895, $0000             ; $0A994E |
  dw $C000, $0018, $5003, $5003             ; $0A9956 |
  dw $5003, $4000, $2003, $2003             ; $0A995E |
  dw $0E96, $2000, $401C, $2000             ; $0A9966 |
  dw $2000, $0000, $0C81, $0957             ; $0A996E |
  dw $0000, $2000, $2000, $0000             ; $0A9976 |
  dw $0000, $4008, $0841, $0E81             ; $0A997E |
  dw $2083, $0000, $0000, $4000             ; $0A9986 |
  dw $4000, $4000, $4000, $0000             ; $0A998E |
  dw $4000, $0000, $0000, $8800             ; $0A9996 |
  dw $8800, $8800, $8800, $0000             ; $0A999E |
  dw $4000, $0053, $0053, $2000             ; $0A99A6 |
  dw $4001, $2000, $2000, $2000             ; $0A99AE |
  dw $2000, $2000, $2000, $2000             ; $0A99B6 |
  dw $2000, $2000, $0000, $0000             ; $0A99BE |
  dw $2000, $0003, $0000, $0800             ; $0A99C6 |
  dw $0003, $0941, $0941, $0941             ; $0A99CE |
  dw $4000, $4000, $405B, $4000             ; $0A99D6 |
  dw $4000, $2000, $4000, $0041             ; $0A99DE |
  dw $0841, $8801, $8000, $1858             ; $0A99E6 |
  dw $1858, $0C96, $0E96, $1C96             ; $0A99EE |
  dw $1E96, $1856, $1800, $1800             ; $0A99F6 |
  dw $0000, $2000, $2000, $0061             ; $0A99FE |
  dw $0061, $0060, $0061, $2063             ; $0A9A06 |
  dw $2061, $2061, $2061, $2061             ; $0A9A0E |
  dw $2061, $2061, $2063, $2000             ; $0A9A16 |
  dw $4000, $0E81, $2000, $2000             ; $0A9A1E |
  dw $1E81, $401B, $401B, $401B             ; $0A9A26 |
  dw $401B, $401B, $401B, $401B             ; $0A9A2E |
  dw $401B, $401B, $401B, $401B             ; $0A9A36 |
  dw $2026, $2142, $0E81, $4000             ; $0A9A3E |
  dw $0000, $4000, $4000, $2000             ; $0A9A46 |
  dw $2000, $0000, $0941, $1841             ; $0A9A4E |
  dw $10A0, $0000, $0841, $0000             ; $0A9A56 |
  dw $0000, $0000, $E041, $0041             ; $0A9A5E |
  dw $4000, $0C98, $0C98, $0C98             ; $0A9A66 |
  dw $0C98, $0C98, $0000, $0000             ; $0A9A6E |
  dw $2041, $2499, $201E, $2000             ; $0A9A76 |
  dw $2000, $0000, $E061, $0441             ; $0A9A7E |
  dw $0000, $0441, $0001, $0441             ; $0A9A86 |
  dw $0000, $0481, $FFFF, $FFFF             ; $0A9A8E |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9A96 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9A9E |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AA6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AAE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AB6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9ABE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AC6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9ACE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AD6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9ADE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AE6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AEE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AF6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9AFE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9B06 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9B0E |
  dw $FFFF, $FFFF, $FFFF                    ; $0A9B16 |

; sprite table OAM mirrors and bitflags, two byte entries
; indexed by sprite ID
; Byte 1: sf?bddmm
;   s = automatic swallow 
;   f = can be frozen
;   b = can be burned by flame
;   d = Index into despawning x,y threshold table (00 means no despawning)
;   m = drawing method index
; byte 2: Count/# of bytes taken up in OAM buffer
sprite_oam_misc_flags:
  dw $2009, $2005, $2001, $2005             ; $0A9B1C |
  dw $0804, $0904, $0904, $0904             ; $0A9B24 |
  dw $0004, $0904, $3055, $0804             ; $0A9B2C |
  dw $8001, $6801, $0002, $0002             ; $0A9B34 |
  dw $6001, $2001, $2005, $0002             ; $0A9B3C |
  dw $2001, $0800, $2001, $5001             ; $0A9B44 |
  dw $0904, $0804, $2001, $1005             ; $0A9B4C |
  dw $2115, $2001, $1979, $2801             ; $0A9B54 |
  dw $3001, $2805, $0804, $0804             ; $0A9B5C |
  dw $0804, $0804, $2005, $0800             ; $0A9B64 |
  dw $2005, $2005, $2005, $2005             ; $0A9B6C |
  dw $5001, $0002, $2001, $0804             ; $0A9B74 |
  dw $2951, $0954, $1805, $2855             ; $0A9B7C |
  dw $2801, $1901, $0002, $0954             ; $0A9B84 |
  dw $0804, $000A, $3155, $3155             ; $0A9B8C |
  dw $2801, $0802, $4005, $0002             ; $0A9B94 |
  dw $2801, $7001, $0006, $4175             ; $0A9B9C |
  dw $4175, $3001, $0002, $2001             ; $0A9BA4 |
  dw $3801, $0006, $3005, $3005             ; $0A9BAC |
  dw $3105, $2005, $2005, $7006             ; $0A9BB4 |
  dw $0002, $0002, $2001, $3801             ; $0A9BBC |
  dw $3D55, $8809, $6809, $3801             ; $0A9BC4 |
  dw $2801, $0804, $2005, $3001             ; $0A9BCC |
  dw $0004, $0804, $0002, $0002             ; $0A9BD4 |
  dw $0804, $1801, $3155, $3155             ; $0A9BDC |
  dw $8809, $0804, $3D51, $0004             ; $0A9BE4 |
  dw $2005, $2005, $2005, $0800             ; $0A9BEC |
  dw $2005, $2155, $2155, $2005             ; $0A9BF4 |
  dw $4979, $4001, $0804, $6001             ; $0A9BFC |
  dw $0954, $2105, $3145, $3145             ; $0A9C04 |
  dw $2945, $2945, $2945, $2155             ; $0A9C0C |
  dw $2155, $2155, $0002, $6005             ; $0A9C14 |
  dw $2145, $2145, $4105, $4001             ; $0A9C1C |
  dw $0006, $0974, $2005, $0800             ; $0A9C24 |
  dw $0804, $1805, $1805, $2085             ; $0A9C2C |
  dw $2001, $0106, $3001, $8101             ; $0A9C34 |
  dw $6001, $6001, $1905, $2005             ; $0A9C3C |
  dw $2009, $2005, $2005, $2005             ; $0A9C44 |
  dw $2005, $0904, $3009, $0950             ; $0A9C4C |
  dw $3901, $2005, $2005, $3955             ; $0A9C54 |
  dw $5005, $0800, $2005, $3001             ; $0A9C5C |
  dw $3001, $600D, $0801, $2801             ; $0A9C64 |
  dw $0801, $8001, $0805, $0800             ; $0A9C6C |
  dw $2005, $2005, $3101, $2805             ; $0A9C74 |
  dw $2805, $2805, $2805, $0006             ; $0A9C7C |
  dw $2805, $0006, $2805, $2805             ; $0A9C84 |
  dw $2805, $2805, $2805, $2805             ; $0A9C8C |
  dw $2805, $2805, $2805, $2805             ; $0A9C94 |
  dw $2805, $2805, $2805, $2805             ; $0A9C9C |
  dw $2805, $2805, $2805, $2805             ; $0A9CA4 |
  dw $2805, $2805, $8005, $2805             ; $0A9CAC |
  dw $2805, $3805, $2001, $8001             ; $0A9CB4 |
  dw $0006, $0006, $2001, $C975             ; $0A9CBC |
  dw $2175, $0002, $6801, $1801             ; $0A9CC4 |
  dw $2005, $3802, $4805, $0002             ; $0A9CCC |
  dw $8005, $0002, $0002, $1375             ; $0A9CD4 |
  dw $0B74, $3375, $3101, $3101             ; $0A9CDC |
  dw $1805, $0904, $2855, $3151             ; $0A9CE4 |
  dw $4955, $4955, $1975, $1175             ; $0A9CEC |
  dw $3945, $3945, $1001, $2001             ; $0A9CF4 |
  dw $0900, $1805, $4975, $0974             ; $0A9CFC |
  dw $1805, $3155, $3125, $3125             ; $0A9D04 |
  dw $3155, $0904, $2005, $4955             ; $0A9D0C |
  dw $4155, $3955, $2005, $3801             ; $0A9D14 |
  dw $3905, $6001, $C001, $1009             ; $0A9D1C |
  dw $2145, $0801, $0801, $0804             ; $0A9D24 |
  dw $2175, $2975, $2975, $2975             ; $0A9D2C |
  dw $8801, $1801, $2005, $3805             ; $0A9D34 |
  dw $2905, $3905, $0904, $3175             ; $0A9D3C |
  dw $1105, $0800, $2005, $0804             ; $0A9D44 |
  dw $2005, $2101, $3955, $2901             ; $0A9D4C |
  dw $1051, $0904, $2001, $2001             ; $0A9D54 |
  dw $2001, $0002, $2801, $2801             ; $0A9D5C |
  dw $1079, $3801, $7001, $2101             ; $0A9D64 |
  dw $000A, $49D1, $1959, $4159             ; $0A9D6C |
  dw $0000, $3801, $0000, $1829             ; $0A9D74 |
  dw $1825, $2005, $1175, $2979             ; $0A9D7C |
  dw $5802, $2155, $2155, $9002             ; $0A9D84 |
  dw $4802, $D802, $B002, $0804             ; $0A9D8C |
  dw $4005, $1975, $1971, $2875             ; $0A9D94 |
  dw $2875, $2875, $2875, $A906             ; $0A9D9C |
  dw $4005, $1915, $1915, $0006             ; $0A9DA4 |
  dw $2005, $3005, $3005, $3005             ; $0A9DAC |
  dw $3005, $3005, $3005, $3005             ; $0A9DB4 |
  dw $3005, $3005, $3955, $4955             ; $0A9DBC |
  dw $2401, $5155, $2151, $1905             ; $0A9DC4 |
  dw $5155, $3925, $3925, $3955             ; $0A9DCC |
  dw $0904, $0904, $8809, $4001             ; $0A9DD4 |
  dw $4001, $0000, $8901, $0804             ; $0A9DDC |
  dw $1875, $1855, $3101, $0974             ; $0A9DE4 |
  dw $0974, $3155, $3155, $3155             ; $0A9DEC |
  dw $3155, $5955, $5959, $595D             ; $0A9DF4 |
  dw $2105, $A801, $1802, $3005             ; $0A9DFC |
  dw $2005, $2005, $4005, $3805             ; $0A9E04 |
  dw $3E05, $2005, $2005, $2005             ; $0A9E0C |
  dw $2005, $2005, $6805, $1805             ; $0A9E14 |
  dw $2005, $2975, $0804, $0804             ; $0A9E1C |
  dw $1975, $1805, $1805, $1805             ; $0A9E24 |
  dw $1805, $1805, $1805, $1805             ; $0A9E2C |
  dw $1805, $1805, $1805, $2005             ; $0A9E34 |
  dw $2005, $0805, $2959, $6001             ; $0A9E3C |
  dw $4005, $2005, $800D, $1805             ; $0A9E44 |
  dw $1805, $2005, $1155, $1975             ; $0A9E4C |
  dw $2975, $4155, $2155, $4151             ; $0A9E54 |
  dw $380E, $200E, $1801, $2155             ; $0A9E5C |
  dw $3005, $3875, $3875, $3875             ; $0A9E64 |
  dw $3875, $3875, $B006, $3951             ; $0A9E6C |
  dw $1005, $3001, $1805, $0804             ; $0A9E74 |
  dw $0800, $7101, $0904, $3101             ; $0A9E7C |
  dw $1101, $3101, $2101, $3851             ; $0A9E84 |
  dw $0100, $3811                           ; $0A9E8C |

; freespace
  dw $FFFF, $FFFF                           ; $0A9E90 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9E94 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9E9C |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EA4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EAC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EB4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EBC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EC4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9ECC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9ED4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EDC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EE4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EEC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EF4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9EFC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9F04 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0A9F0C |
  dw $FFFF, $FFFF, $FFFF                    ; $0A9F14 |

; sprite table OAM mirrors, two byte entries
; indexed by sprite ID
; byte 1: priority flags in 00pp0000
; byte 2: palette and flip attributes in YX00CCC0 format
sprite_oam_attributes:
  dw $0805, $0007, $0C02, $0805             ; $0A9F1A |
  dw $0201, $0604, $1202, $0004             ; $0A9F22 |
  dw $2C07, $0204, $0005, $0002             ; $0A9F2A |
  dw $0C05, $0000, $0000, $0000             ; $0A9F32 |
  dw $0005, $1C02, $0207, $00FF             ; $0A9F3A |
  dw $02FF, $0A02, $0CFF, $0001             ; $0A9F42 |
  dw $1202, $0202, $0005, $0805             ; $0A9F4A |
  dw $0205, $0005, $0005, $0006             ; $0A9F52 |
  dw $0003, $0402, $0005, $0205             ; $0A9F5A |
  dw $0405, $0005, $0005, $0205             ; $0A9F62 |
  dw $0005, $0005, $0205, $0005             ; $0A9F6A |
  dw $0202, $0E02, $0006, $0C07             ; $0A9F72 |
  dw $0005, $0005, $0007, $0006             ; $0A9F7A |
  dw $0C06, $0007, $00FF, $0405             ; $0A9F82 |
  dw $0605, $00FF, $0002, $0002             ; $0A9F8A |
  dw $0C05, $0007, $0202, $0000             ; $0A9F92 |
  dw $0002, $0002, $00FF, $0205             ; $0A9F9A |
  dw $0005, $0005, $0005, $0005             ; $0A9FA2 |
  dw $12FF, $00FF, $0002, $0002             ; $0A9FAA |
  dw $8005, $0004, $0007, $0000             ; $0A9FB2 |
  dw $00FF, $02FF, $0002, $1205             ; $0A9FBA |
  dw $8202, $0005, $0005, $0005             ; $0A9FC2 |
  dw $0002, $0405, $0205, $0803             ; $0A9FCA |
  dw $08FF, $0602, $00FF, $00FF             ; $0A9FD2 |
  dw $0802, $0A04, $0005, $0802             ; $0A9FDA |
  dw $0805, $0005, $0202, $00FF             ; $0A9FE2 |
  dw $0004, $0204, $0404, $0002             ; $0A9FEA |
  dw $0004, $0402, $0402, $0004             ; $0A9FF2 |
  dw $0204, $0204, $0807, $0005             ; $0A9FFA |
  dw $0405, $04FF, $0206, $0206             ; $0AA002 |
  dw $0002, $0002, $0002, $00FF             ; $0AA00A |
  dw $00FF, $00FF, $0CFF, $0805             ; $0AA012 |
  dw $02FF, $02FF, $0202, $2007             ; $0AA01A |
  dw $00FF, $0003, $0005, $0202             ; $0AA022 |
  dw $0405, $0205, $0805, $0005             ; $0AA02A |
  dw $0E05, $00FF, $1204, $0004             ; $0AA032 |
  dw $0005, $0203, $0204, $0007             ; $0AA03A |
  dw $0806, $0002, $0802, $0202             ; $0AA042 |
  dw $0A02, $0405, $0005, $0205             ; $0AA04A |
  dw $0401, $0202, $0406, $0003             ; $0AA052 |
  dw $0001, $0805, $0403, $0007             ; $0AA05A |
  dw $0007, $0006, $0C00, $0C00             ; $0AA062 |
  dw $0C00, $0CFF, $2C00, $0005             ; $0AA06A |
  dw $00FF, $0204, $00FF, $0002             ; $0AA072 |
  dw $0002, $0002, $0002, $00FF             ; $0AA07A |
  dw $0002, $00FF, $0002, $0002             ; $0AA082 |
  dw $0002, $0002, $0002, $0002             ; $0AA08A |
  dw $0002, $0002, $0002, $0002             ; $0AA092 |
  dw $0002, $0002, $0002, $0002             ; $0AA09A |
  dw $0002, $0002, $0002, $0002             ; $0AA0A2 |
  dw $0002, $0002, $0207, $0002             ; $0AA0AA |
  dw $0002, $1005, $02FF, $0CFF             ; $0AA0B2 |
  dw $00FF, $00FF, $0405, $0005             ; $0AA0BA |
  dw $0005, $2000, $0005, $0405             ; $0AA0C2 |
  dw $0207, $0005, $0005, $0005             ; $0AA0CA |
  dw $0606, $00FF, $0C05, $0005             ; $0AA0D2 |
  dw $0C05, $0E05, $0207, $0207             ; $0AA0DA |
  dw $0006, $0007, $1005, $0005             ; $0AA0E2 |
  dw $0005, $0005, $1005, $1005             ; $0AA0EA |
  dw $00FF, $00FF, $0007, $0605             ; $0AA0F2 |
  dw $0406, $0002, $0005, $0005             ; $0AA0FA |
  dw $0002, $0005, $0005, $0005             ; $0AA102 |
  dw $0005, $0404, $0206, $0005             ; $0AA10A |
  dw $0005, $0005, $0201, $0005             ; $0AA112 |
  dw $0006, $0002, $0002, $0007             ; $0AA11A |
  dw $0005, $0007, $0007, $1003             ; $0AA122 |
  dw $0005, $0005, $0405, $0405             ; $0AA12A |
  dw $0007, $0006, $0805, $0405             ; $0AA132 |
  dw $0006, $0005, $00FF, $0005             ; $0AA13A |
  dw $0004, $0402, $0004, $0804             ; $0AA142 |
  dw $0804, $0002, $0001, $1005             ; $0AA14A |
  dw $0002, $0403, $0005, $0405             ; $0AA152 |
  dw $0805, $00FF, $0402, $0402             ; $0AA15A |
  dw $0003, $1203, $0007, $0806             ; $0AA162 |
  dw $00FF, $1005, $0005, $0005             ; $0AA16A |
  dw $0005, $0005, $00FF, $1005             ; $0AA172 |
  dw $1005, $0007, $00FF, $0005             ; $0AA17A |
  dw $0002, $0405, $0405, $0C07             ; $0AA182 |
  dw $0C07, $0C07, $0C07, $0EFF             ; $0AA18A |
  dw $0002, $1005, $1005, $0005             ; $0AA192 |
  dw $0005, $0005, $0005, $0005             ; $0AA19A |
  dw $0002, $0805, $0005, $00FF             ; $0AA1A2 |
  dw $0004, $0005, $0005, $0005             ; $0AA1AA |
  dw $0005, $0005, $0005, $0005             ; $0AA1B2 |
  dw $0005, $0005, $0005, $0005             ; $0AA1BA |
  dw $00FF, $0405, $0005, $2005             ; $0AA1C2 |
  dw $0405, $0205, $0205, $0005             ; $0AA1CA |
  dw $0004, $0204, $0805, $0005             ; $0AA1D2 |
  dw $0205, $00FF, $0005, $0005             ; $0AA1DA |
  dw $0005, $0005, $1005, $0004             ; $0AA1E2 |
  dw $0204, $0005, $0205, $0005             ; $0AA1EA |
  dw $0205, $0005, $0205, $0205             ; $0AA1F2 |
  dw $0005, $0CFF, $0C02, $1005             ; $0AA1FA |
  dw $1005, $1005, $1005, $1005             ; $0AA202 |
  dw $1005, $1005, $1005, $1005             ; $0AA20A |
  dw $1005, $1005, $1005, $0005             ; $0AA212 |
  dw $0005, $0005, $0205, $0005             ; $0AA21A |
  dw $0005, $0002, $0002, $0402             ; $0AA222 |
  dw $0402, $0002, $0002, $0402             ; $0AA22A |
  dw $0402, $0202, $0202, $0002             ; $0AA232 |
  dw $0005, $0005, $0005, $0005             ; $0AA23A |
  dw $3005, $0E05, $0E05, $0006             ; $0AA242 |
  dw $0006, $0205, $0405, $0005             ; $0AA24A |
  dw $1005, $1005, $0005, $1005             ; $0AA252 |
  dw $0001, $0001, $0005, $0005             ; $0AA25A |
  dw $0C05, $0004, $0004, $0004             ; $0AA262 |
  dw $0004, $0004, $0005, $1003             ; $0AA26A |
  dw $0005, $0205, $0004, $0405             ; $0AA272 |
  dw $0205, $0405, $0406, $0005             ; $0AA27A |
  dw $0406, $0005, $0206, $0004             ; $0AA282 |
  dw $0005, $0004                           ; $0AA28A |

; freespace
  dw $FFFF, $FFFF                           ; $0AA28E |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA292 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA29A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA2FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA302 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AA30A |
  dw $FFFF, $FFFF, $FFFF                    ; $0AA312 |

; Sprite Table Gravity table
; indexed by sprite ID
; byte 1: Y-acceleration (Gravity)
; byte 2: Y-acceleration ceiling (max speed for acceleration)
; Acceleration ceiling are stored as divided by 16
sprite_y_accel:
  db $10, $40, $60, $60, $00, $00, $40, $40 ; $0AA318 |
  db $70, $40, $00, $40, $10, $04, $00, $40 ; $0AA320 |
  db $00, $00, $00, $40, $40, $40, $40, $40 ; $0AA328 |
  db $40, $40, $00, $00, $00, $00, $00, $00 ; $0AA330 |
  db $00, $00, $00, $00, $60, $60, $00, $00 ; $0AA338 |
  db $00, $08, $00, $00, $00, $00, $40, $40 ; $0AA340 |
  db $10, $C0, $02, $F8, $40, $40, $00, $00 ; $0AA348 |
  db $2C, $2C, $40, $40, $40, $40, $00, $40 ; $0AA350 |
  db $40, $40, $00, $40, $00, $40, $00, $40 ; $0AA358 |
  db $00, $40, $00, $40, $00, $40, $40, $40 ; $0AA360 |
  db $40, $40, $00, $40, $00, $40, $00, $40 ; $0AA368 |
  db $00, $00, $03, $10, $00, $08, $00, $00 ; $0AA370 |
  db $40, $40, $40, $40, $00, $00, $00, $40 ; $0AA378 |
  db $00, $40, $00, $00, $00, $00, $04, $04 ; $0AA380 |
  db $00, $00, $00, $00, $40, $40, $40, $40 ; $0AA388 |
  db $40, $40, $00, $00, $00, $00, $00, $00 ; $0AA390 |
  db $40, $40, $00, $00, $00, $00, $40, $40 ; $0AA398 |
  db $40, $40, $00, $00, $40, $40, $40, $40 ; $0AA3A0 |
  db $00, $00, $40, $40, $40, $40, $00, $00 ; $0AA3A8 |
  db $00, $40, $00, $00, $60, $60, $00, $00 ; $0AA3B0 |
  db $00, $00, $00, $00, $04, $F4, $00, $00 ; $0AA3B8 |
  db $00, $40, $00, $28, $00, $28, $00, $00 ; $0AA3C0 |
  db $05, $00, $00, $00, $00, $00, $40, $40 ; $0AA3C8 |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $0AA3D0 |
  db $2C, $2C, $40, $40, $40, $40, $40, $40 ; $0AA3D8 |
  db $00, $28, $00, $00, $40, $40, $00, $00 ; $0AA3E0 |
  db $00, $40, $00, $10, $00, $40, $00, $00 ; $0AA3E8 |
  db $60, $40, $40, $40, $40, $40, $60, $40 ; $0AA3F0 |
  db $2C, $2C, $00, $00, $00, $00, $00, $00 ; $0AA3F8 |
  db $2C, $2C, $00, $00, $00, $40, $00, $40 ; $0AA400 |
  db $40, $40, $40, $40, $40, $40, $00, $00 ; $0AA408 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA410 |
  db $00, $2C, $00, $2C, $40, $40, $00, $00 ; $0AA418 |
  db $00, $00, $2C, $2C, $40, $08, $40, $40 ; $0AA420 |
  db $20, $20, $00, $00, $00, $00, $00, $00 ; $0AA428 |
  db $00, $40, $00, $00, $10, $0C, $00, $00 ; $0AA430 |
  db $00, $00, $00, $00, $40, $40, $60, $60 ; $0AA438 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $0AA440 |
  db $00, $40, $00, $00, $00, $00, $2C, $2C ; $0AA448 |
  db $00, $40, $40, $40, $40, $40, $40, $40 ; $0AA450 |
  db $00, $00, $40, $40, $40, $40, $40, $40 ; $0AA458 |
  db $40, $40, $00, $00, $08, $10, $08, $10 ; $0AA460 |
  db $00, $00, $00, $00, $00, $00, $40, $40 ; $0AA468 |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $0AA470 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA478 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA480 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA488 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA490 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA498 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA4A0 |
  db $00, $00, $00, $00, $60, $60, $00, $00 ; $0AA4A8 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA4B0 |
  db $00, $00, $00, $00, $40, $40, $40, $40 ; $0AA4B8 |
  db $40, $40, $00, $00, $00, $00, $00, $40 ; $0AA4C0 |
  db $00, $00, $08, $10, $40, $40, $40, $40 ; $0AA4C8 |
  db $40, $40, $00, $00, $00, $20, $00, $00 ; $0AA4D0 |
  db $00, $00, $00, $00, $40, $40, $40, $40 ; $0AA4D8 |
  db $40, $40, $00, $30, $00, $00, $34, $34 ; $0AA4E0 |
  db $10, $00, $40, $40, $10, $80, $00, $00 ; $0AA4E8 |
  db $40, $40, $40, $40, $40, $40, $00, $00 ; $0AA4F0 |
  db $00, $40, $40, $40, $40, $40, $40, $40 ; $0AA4F8 |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $0AA500 |
  db $40, $40, $00, $00, $00, $00, $40, $40 ; $0AA508 |
  db $40, $40, $40, $40, $00, $00, $40, $40 ; $0AA510 |
  db $02, $F8, $00, $00, $00, $00, $00, $00 ; $0AA518 |
  db $00, $40, $00, $00, $00, $00, $01, $40 ; $0AA520 |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $0AA528 |
  db $00, $40, $00, $00, $40, $40, $06, $10 ; $0AA530 |
  db $00, $00, $40, $40, $00, $10, $40, $40 ; $0AA538 |
  db $00, $00, $18, $40, $04, $00, $00, $20 ; $0AA540 |
  db $00, $20, $20, $20, $40, $40, $00, $00 ; $0AA548 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA550 |
  db $00, $00, $00, $00, $00, $40, $00, $40 ; $0AA558 |
  db $40, $40, $00, $00, $00, $40, $00, $00 ; $0AA560 |
  db $00, $00, $04, $00, $40, $40, $40, $40 ; $0AA568 |
  db $00, $00, $40, $40, $00, $00, $00, $00 ; $0AA570 |
  db $00, $00, $60, $60, $00, $40, $40, $40 ; $0AA578 |
  db $00, $40, $00, $40, $00, $40, $01, $20 ; $0AA580 |
  db $01, $20, $01, $20, $01, $20, $00, $00 ; $0AA588 |
  db $00, $00, $00, $00, $00, $00, $00, $40 ; $0AA590 |
  db $00, $40, $00, $40, $00, $40, $00, $40 ; $0AA598 |
  db $00, $00, $40, $C0, $40, $C0, $00, $00 ; $0AA5A0 |
  db $60, $40, $00, $00, $00, $00, $00, $00 ; $0AA5A8 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA5B0 |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $0AA5B8 |
  db $00, $00, $20, $20, $00, $60, $00, $40 ; $0AA5C0 |
  db $20, $20, $40, $40, $40, $40, $40, $40 ; $0AA5C8 |
  db $00, $40, $00, $40, $00, $28, $00, $00 ; $0AA5D0 |
  db $00, $00, $00, $00, $00, $00, $40, $40 ; $0AA5D8 |
  db $40, $40, $08, $08, $00, $40, $40, $40 ; $0AA5E0 |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $0AA5E8 |
  db $40, $40, $20, $20, $00, $00, $00, $00 ; $0AA5F0 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA5F8 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA600 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AA608 |
  db $00, $00, $00, $00, $00, $00, $04, $E0 ; $0AA610 |
  db $00, $00, $40, $40, $00, $00, $00, $00 ; $0AA618 |
  db $40, $40, $28, $28, $28, $28, $28, $28 ; $0AA620 |
  db $28, $28, $28, $28, $28, $28, $28, $28 ; $0AA628 |
  db $28, $28, $28, $28, $28, $28, $28, $28 ; $0AA630 |
  db $00, $40, $40, $40, $40, $40, $00, $00 ; $0AA638 |
  db $00, $00, $00, $40, $00, $40, $00, $00 ; $0AA640 |
  db $00, $00, $00, $00, $40, $40, $40, $40 ; $0AA648 |
  db $00, $00, $00, $00, $40, $40, $00, $00 ; $0AA650 |
  db $00, $00, $00, $00, $18, $40, $40, $40 ; $0AA658 |
  db $00, $80, $40, $40, $40, $40, $00, $40 ; $0AA660 |
  db $40, $40, $00, $40, $00, $00, $00, $00 ; $0AA668 |
  db $20, $20, $40, $40, $00, $00, $00, $00 ; $0AA670 |
  db $00, $00, $00, $00, $20, $50, $40, $40 ; $0AA678 |
  db $00, $00, $40, $40, $00, $00, $40, $40 ; $0AA680 |
  db $00, $00, $40, $40                     ; $0AA688 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA68C |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA694 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA69C |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6A4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6AC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6B4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6BC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6C4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6CC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6D4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6DC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6E4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6EC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6F4 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA6FC |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA704 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AA70C |
  db $FF, $FF                               ; $0AA714 |

; 1 Word entries: Spriteset Graphics File
; Indexed by sprite ID
; $0000 means either global sprites or GSU drawn
sprite_gfx_file:
  dw $0000, $0000, $005A, $0000             ; $0AA716 |
  dw $0000, $0000, $0000, $0000             ; $0AA71E |
  dw $0000, $0000, $004A, $004A             ; $0AA726 |
  dw $0000, $0000, $0000, $0000             ; $0AA72E |
  dw $0042, $0000, $0000, $0000             ; $0AA736 |
  dw $0000, $0000, $0061, $0068             ; $0AA73E |
  dw $0000, $0000, $002E, $0048             ; $0AA746 |
  dw $0000, $002E, $0000, $0031             ; $0AA74E |
  dw $004E, $0000, $0000, $0000             ; $0AA756 |
  dw $0000, $0000, $0000, $0000             ; $0AA75E |
  dw $0000, $0000, $002F, $002F             ; $0AA766 |
  dw $0032, $0000, $0045, $0028             ; $0AA76E |
  dw $0028, $0036, $0028, $0028             ; $0AA776 |
  dw $0042, $0042, $0000, $0046             ; $0AA77E |
  dw $0042, $0000, $004F, $004F             ; $0AA786 |
  dw $0000, $0000, $0000, $0000             ; $0AA78E |
  dw $0000, $0000, $0000, $0070             ; $0AA796 |
  dw $0070, $0070, $0000, $0000             ; $0AA79E |
  dw $006A, $0000, $0000, $0000             ; $0AA7A6 |
  dw $0036, $0000, $0000, $0000             ; $0AA7AE |
  dw $0000, $0000, $0000, $006A             ; $0AA7B6 |
  dw $0029, $0000, $0000, $0000             ; $0AA7BE |
  dw $0000, $0000, $001B, $004E             ; $0AA7C6 |
  dw $0000, $0000, $0000, $0000             ; $0AA7CE |
  dw $0000, $0000, $0026, $0000             ; $0AA7D6 |
  dw $0000, $0000, $0029, $0000             ; $0AA7DE |
  dw $0000, $0000, $0000, $0000             ; $0AA7E6 |
  dw $0000, $0000, $0000, $0000             ; $0AA7EE |
  dw $0035, $0061, $002E, $0000             ; $0AA7F6 |
  dw $0026, $0000, $0045, $0045             ; $0AA7FE |
  dw $0031, $0031, $0031, $0000             ; $0AA806 |
  dw $0000, $0031, $0000, $0000             ; $0AA80E |
  dw $0000, $0000, $0000, $0000             ; $0AA816 |
  dw $0000, $001E, $0000, $0000             ; $0AA81E |
  dw $0000, $0000, $0000, $0000             ; $0AA826 |
  dw $0000, $0000, $0067, $0000             ; $0AA82E |
  dw $0042, $0000, $001E, $0000             ; $0AA836 |
  dw $0000, $0000, $0000, $0000             ; $0AA83E |
  dw $0000, $004F, $0000, $0059             ; $0AA846 |
  dw $0000, $0000, $0000, $0029             ; $0AA84E |
  dw $0000, $0036, $004B, $004E             ; $0AA856 |
  dw $004E, $0053, $001B, $001B             ; $0AA85E |
  dw $001B, $001B, $001B, $0000             ; $0AA866 |
  dw $0000, $0000, $0047, $0000             ; $0AA86E |
  dw $0000, $0000, $0000, $0000             ; $0AA876 |
  dw $0000, $0000, $0000, $0000             ; $0AA87E |
  dw $0000, $0000, $0000, $0000             ; $0AA886 |
  dw $0000, $0000, $0000, $0000             ; $0AA88E |
  dw $0000, $0000, $0000, $0000             ; $0AA896 |
  dw $0000, $0000, $0000, $0000             ; $0AA89E |
  dw $0000, $0000, $0000, $0000             ; $0AA8A6 |
  dw $0000, $0000, $0000, $0000             ; $0AA8AE |
  dw $0000, $0000, $0029, $006F             ; $0AA8B6 |
  dw $006D, $001A, $0000, $0055             ; $0AA8BE |
  dw $0000, $0049, $0044, $0000             ; $0AA8C6 |
  dw $0000, $0000, $0020, $003E             ; $0AA8CE |
  dw $003E, $003E, $0022, $0022             ; $0AA8D6 |
  dw $0024, $0000, $0025, $0000             ; $0AA8DE |
  dw $002A, $002A, $002C, $002D             ; $0AA8E6 |
  dw $0000, $0000, $002F, $002F             ; $0AA8EE |
  dw $002F, $001F, $0037, $0000             ; $0AA8F6 |
  dw $001F, $0000, $0000, $0000             ; $0AA8FE |
  dw $0036, $0000, $0000, $0035             ; $0AA906 |
  dw $0035, $0000, $0000, $003A             ; $0AA90E |
  dw $0000, $0000, $0000, $003C             ; $0AA916 |
  dw $0000, $0000, $0000, $0000             ; $0AA91E |
  dw $0029, $0000, $0000, $0000             ; $0AA926 |
  dw $003F, $003F, $0000, $0030             ; $0AA92E |
  dw $0071, $0041, $0041, $0040             ; $0AA936 |
  dw $0040, $0000, $004C, $004C             ; $0AA93E |
  dw $004C, $0046, $0000, $0049             ; $0AA946 |
  dw $0049, $0049, $0000, $0000             ; $0AA94E |
  dw $0000, $0000, $0000, $0000             ; $0AA956 |
  dw $0027, $006A, $004E, $0000             ; $0AA95E |
  dw $0000, $0052, $0000, $0050             ; $0AA966 |
  dw $0000, $00AB, $0000, $0051             ; $0AA96E |
  dw $0051, $0000, $0045, $0000             ; $0AA976 |
  dw $00AD, $0000, $0000, $0020             ; $0AA97E |
  dw $0020, $0020, $0020, $0070             ; $0AA986 |
  dw $0000, $0055, $0055, $0054             ; $0AA98E |
  dw $0054, $0054, $0054, $0058             ; $0AA996 |
  dw $0000, $0055, $0055, $0000             ; $0AA99E |
  dw $0000, $0057, $0057, $0057             ; $0AA9A6 |
  dw $0057, $0057, $0057, $0057             ; $0AA9AE |
  dw $0057, $0057, $0056, $002A             ; $0AA9B6 |
  dw $0053, $002B, $0000, $0049             ; $0AA9BE |
  dw $002B, $0000, $0000, $0039             ; $0AA9C6 |
  dw $002A, $002A, $0000, $0000             ; $0AA9CE |
  dw $0000, $0000, $002A, $0000             ; $0AA9D6 |
  dw $0025, $0025, $0049, $0047             ; $0AA9DE |
  dw $0047, $0047, $0047, $0047             ; $0AA9E6 |
  dw $0047, $002B, $002B, $002B             ; $0AA9EE |
  dw $004F, $005A, $005A, $0000             ; $0AA9F6 |
  dw $0000, $0000, $0000, $0000             ; $0AA9FE |
  dw $0000, $0000, $0000, $0000             ; $0AAA06 |
  dw $0000, $0000, $0000, $0000             ; $0AAA0E |
  dw $0000, $005D, $005D, $005D             ; $0AAA16 |
  dw $005E, $0000, $0000, $0000             ; $0AAA1E |
  dw $0000, $0000, $0000, $0000             ; $0AAA26 |
  dw $0000, $0000, $0000, $0000             ; $0AAA2E |
  dw $005F, $005E, $005D, $0042             ; $0AAA36 |
  dw $0062, $0000, $0000, $001C             ; $0AAA3E |
  dw $001C, $0000, $0060, $005E             ; $0AAA46 |
  dw $005E, $0063, $0063, $0063             ; $0AAA4E |
  dw $0065, $0065, $0000, $0060             ; $0AAA56 |
  dw $0048, $0064, $0064, $0064             ; $0AAA5E |
  dw $0064, $0064, $0066, $0065             ; $0AAA66 |
  dw $0068, $0067, $0067, $0000             ; $0AAA6E |
  dw $0065, $0000, $0000, $004E             ; $0AAA76 |
  dw $0000, $004E, $0000, $004E             ; $0AAA7E |
  dw $0000, $004E, $FFFF, $FFFF             ; $0AAA86 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAA8E |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAA96 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAA9E |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAA6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAAE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAB6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAABE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAC6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAACE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAD6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAADE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAE6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAEE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAF6 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAAFE |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAB06 |
  dw $FFFF, $FFFF, $FFFF                    ; $0AAB0E |

; sprite table (which super FX sprite to use when yoshi spits out an enemy)
  dw $0000, $0000, $0000, $0000             ; $0AAB14 |
  dw $0000, $0000, $0000, $0000             ; $0AAB1C |
  dw $0000, $0000, $0000, $014A             ; $0AAB24 |
  dw $0000, $0000, $0000, $0000             ; $0AAB2C |
  dw $0000, $0000, $0000, $0000             ; $0AAB34 |
  dw $0000, $0000, $0000, $0000             ; $0AAB3C |
  dw $0000, $0000, $0000, $0000             ; $0AAB44 |
  dw $0000, $0000, $0164, $0000             ; $0AAB4C |
  dw $00C6, $0000, $0342, $0342             ; $0AAB54 |
  dw $0342, $0342, $0000, $0000             ; $0AAB5C |
  dw $0000, $8388, $8388, $8388             ; $0AAB64 |
  dw $0000, $0000, $0000, $0000             ; $0AAB6C |
  dw $0000, $0000, $0000, $0000             ; $0AAB74 |
  dw $0000, $0000, $0000, $0000             ; $0AAB7C |
  dw $0000, $0000, $0000, $0000             ; $0AAB84 |
  dw $0000, $0000, $0000, $0000             ; $0AAB8C |
  dw $0000, $0000, $0000, $800C             ; $0AAB94 |
  dw $800C, $0000, $0000, $0000             ; $0AAB9C |
  dw $0000, $0000, $0000, $0000             ; $0AABA4 |
  dw $0000, $0000, $0000, $0000             ; $0AABAC |
  dw $0000, $0000, $0000, $0000             ; $0AABB4 |
  dw $0000, $0000, $0000, $0000             ; $0AABBC |
  dw $0000, $0000, $0000, $00C6             ; $0AABC4 |
  dw $0000, $0000, $0000, $0000             ; $0AABCC |
  dw $0000, $0000, $0000, $0000             ; $0AABD4 |
  dw $0000, $0000, $0000, $0000             ; $0AABDC |
  dw $0000, $0000, $0000, $0000             ; $0AABE4 |
  dw $0000, $0000, $0000, $0000             ; $0AABEC |
  dw $0000, $0000, $0000, $0000             ; $0AABF4 |
  dw $0000, $0000, $0000, $0000             ; $0AABFC |
  dw $0000, $0000, $0000, $0000             ; $0AAC04 |
  dw $0000, $0000, $0000, $0000             ; $0AAC0C |
  dw $0000, $0000, $0000, $0000             ; $0AAC14 |
  dw $0000, $0000, $0000, $0000             ; $0AAC1C |
  dw $0000, $0000, $0000, $0000             ; $0AAC24 |
  dw $0000, $0000, $0000, $0000             ; $0AAC2C |
  dw $0000, $0000, $0000, $0000             ; $0AAC34 |
  dw $0000, $0000, $0000, $0000             ; $0AAC3C |
  dw $0000, $0000, $0000, $0000             ; $0AAC44 |
  dw $0000, $0000, $0000, $0000             ; $0AAC4C |
  dw $0000, $0000, $0000, $00C6             ; $0AAC54 |
  dw $00C6, $0000, $0000, $0000             ; $0AAC5C |
  dw $0000, $0000, $0000, $0000             ; $0AAC64 |
  dw $0000, $0000, $0000, $0000             ; $0AAC6C |
  dw $0000, $0000, $0000, $0000             ; $0AAC74 |
  dw $0000, $0000, $0000, $0000             ; $0AAC7C |
  dw $0000, $0000, $0000, $0000             ; $0AAC84 |
  dw $0000, $0000, $0000, $0000             ; $0AAC8C |
  dw $0000, $0000, $0000, $0000             ; $0AAC94 |
  dw $0000, $0000, $0000, $0000             ; $0AAC9C |
  dw $0000, $0000, $0000, $0000             ; $0AACA4 |
  dw $0000, $0000, $0000, $0000             ; $0AACAC |
  dw $0342, $0000, $0000, $0000             ; $0AACB4 |
  dw $0000, $0000, $0000, $0000             ; $0AACBC |
  dw $0000, $0000, $0000, $0000             ; $0AACC4 |
  dw $0000, $0000, $0000, $0000             ; $0AACCC |
  dw $0000, $0000, $0000, $0000             ; $0AACD4 |
  dw $0000, $0000, $0000, $0000             ; $0AACDC |
  dw $0000, $0000, $0000, $0000             ; $0AACE4 |
  dw $0000, $0000, $0000, $0000             ; $0AACEC |
  dw $0000, $0000, $0000, $0164             ; $0AACF4 |
  dw $0000, $00C6, $0000, $0000             ; $0AACFC |
  dw $0000, $0000, $0000, $0000             ; $0AAD04 |
  dw $0000, $00C6, $0000, $0000             ; $0AAD0C |
  dw $0000, $0000, $0000, $0000             ; $0AAD14 |
  dw $0000, $0000, $0000, $0000             ; $0AAD1C |
  dw $0000, $0120, $0120, $0120             ; $0AAD24 |
  dw $0000, $0000, $0000, $0000             ; $0AAD2C |
  dw $0000, $0000, $0000, $0000             ; $0AAD34 |
  dw $0000, $0000, $0000, $0000             ; $0AAD3C |
  dw $0000, $0000, $00C6, $0000             ; $0AAD44 |
  dw $0000, $0000, $0000, $0000             ; $0AAD4C |
  dw $0000, $0000, $0000, $0000             ; $0AAD54 |
  dw $0000, $0000, $0000, $0000             ; $0AAD5C |
  dw $0000, $0000, $0164, $0000             ; $0AAD64 |
  dw $0000, $0000, $0000, $0000             ; $0AAD6C |
  dw $0000, $0000, $0000, $0048             ; $0AAD74 |
  dw $0000, $0000, $0000, $0000             ; $0AAD7C |
  dw $0000, $0000, $0000, $0000             ; $0AAD84 |
  dw $0000, $0000, $0000, $0000             ; $0AAD8C |
  dw $0000, $0000, $0000, $0000             ; $0AAD94 |
  dw $0000, $0000, $0000, $0000             ; $0AAD9C |
  dw $0000, $0000, $0000, $0000             ; $0AADA4 |
  dw $0000, $0000, $0000, $0000             ; $0AADAC |
  dw $0000, $0000, $0000, $0000             ; $0AADB4 |
  dw $0000, $0000, $0000, $0000             ; $0AADBC |
  dw $0000, $004A, $004A, $0000             ; $0AADC4 |
  dw $0000, $0000, $0000, $0000             ; $0AADCC |
  dw $0000, $0000, $0000, $0000             ; $0AADD4 |
  dw $0000, $0000, $0000, $0000             ; $0AADDC |
  dw $0000, $0000, $0000, $0000             ; $0AADE4 |
  dw $0000, $0000, $0000, $0000             ; $0AADEC |
  dw $0000, $0000, $0000, $0000             ; $0AADF4 |
  dw $0000, $0000, $0000, $0000             ; $0AADFC |
  dw $0000, $0000, $0000, $0000             ; $0AAE04 |
  dw $0000, $0000, $0000, $0000             ; $0AAE0C |
  dw $0000, $0000, $0000, $0000             ; $0AAE14 |
  dw $0000, $0000, $0000, $0000             ; $0AAE1C |
  dw $0000, $0000, $0000, $0000             ; $0AAE24 |
  dw $0000, $0000, $0000, $0000             ; $0AAE2C |
  dw $0000, $0000, $0000, $0000             ; $0AAE34 |
  dw $0000, $0000, $0000, $0000             ; $0AAE3C |
  dw $0000, $0000, $0122, $0000             ; $0AAE44 |
  dw $0000, $0000, $0000, $0000             ; $0AAE4C |
  dw $0000, $0000, $0000, $0000             ; $0AAE54 |
  dw $0000, $0000, $0000, $0000             ; $0AAE5C |
  dw $0000, $0000, $0000, $0000             ; $0AAE64 |
  dw $0000, $0000, $0000, $0000             ; $0AAE6C |
  dw $0000, $0000, $0000, $0000             ; $0AAE74 |
  dw $0000, $0000, $0000, $0000             ; $0AAE7C |
  dw $0000, $0000, $FFFF, $FFFF             ; $0AAE84 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAE8C |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAE94 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAE9C |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEA4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEAC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEB4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEBC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEC4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAECC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAED4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEDC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEE4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEEC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEF4 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAEFC |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AAF04 |
  dw $FFFF, $FFFF, $FFFF                    ; $0AAF0C |

; sprite table
  dw $0000, $0000, $001C, $0000             ; $0AAF12 |
  dw $0000, $0000, $0000, $0000             ; $0AAF1A |
  dw $0000, $0000, $0000, $0000             ; $0AAF22 |
  dw $0000, $0000, $0000, $0000             ; $0AAF2A |
  dw $0000, $0000, $0000, $0000             ; $0AAF32 |
  dw $0000, $0000, $8840, $0000             ; $0AAF3A |
  dw $0000, $0000, $0000, $0000             ; $0AAF42 |
  dw $0000, $0000, $0000, $0000             ; $0AAF4A |
  dw $0000, $0000, $0000, $0000             ; $0AAF52 |
  dw $0000, $0000, $0000, $0000             ; $0AAF5A |
  dw $0000, $0000, $0000, $0000             ; $0AAF62 |
  dw $0000, $0000, $0000, $0000             ; $0AAF6A |
  dw $0000, $0000, $0000, $0000             ; $0AAF72 |
  dw $0000, $0000, $0000, $0000             ; $0AAF7A |
  dw $0000, $0000, $0000, $0000             ; $0AAF82 |
  dw $0000, $0000, $0000, $0000             ; $0AAF8A |
  dw $0000, $0000, $0000, $0000             ; $0AAF92 |
  dw $0000, $0000, $0000, $0000             ; $0AAF9A |
  dw $0000, $0000, $0000, $0000             ; $0AAFA2 |
  dw $0000, $0000, $0000, $0000             ; $0AAFAA |
  dw $0000, $0000, $0000, $0000             ; $0AAFB2 |
  dw $0000, $0000, $0000, $0000             ; $0AAFBA |
  dw $0000, $0000, $0000, $0000             ; $0AAFC2 |
  dw $0000, $0000, $0000, $0000             ; $0AAFCA |
  dw $0000, $0000, $0000, $0000             ; $0AAFD2 |
  dw $0000, $0000, $0000, $0000             ; $0AAFDA |
  dw $0000, $0000, $0000, $0000             ; $0AAFE2 |
  dw $0000, $0000, $0000, $0000             ; $0AAFEA |
  dw $0000, $0040, $0040, $0040             ; $0AAFF2 |
  dw $0040, $FFFF, $FFFF, $FFFF             ; $0AAFFA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB002 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB00A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB012 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB01A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB022 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB02A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB032 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB03A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB042 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB04A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB052 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB05A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB062 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB06A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB072 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB07A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB082 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB08A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB092 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB09A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB0FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB102 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB10A |
  dw $0000, $0000, $001C, $0000             ; $0AB112 |
  dw $0000, $0000, $0000, $0000             ; $0AB11A |
  dw $0000, $0000, $0000, $0000             ; $0AB122 |
  dw $0000, $0000, $0000, $0000             ; $0AB12A |
  dw $0000, $0000, $0000, $0000             ; $0AB132 |
  dw $0000, $0000, $0000, $0000             ; $0AB13A |
  dw $0000, $0000, $0000, $0000             ; $0AB142 |
  dw $0000, $0000, $0000, $0000             ; $0AB14A |
  dw $0000, $0000, $0000, $0000             ; $0AB152 |
  dw $0000, $0000, $0000, $0000             ; $0AB15A |
  dw $0000, $0000, $0000, $0000             ; $0AB162 |
  dw $0000, $0000, $0000, $0000             ; $0AB16A |
  dw $0000, $0000, $0000, $0000             ; $0AB172 |
  dw $0000, $0000, $0000, $0000             ; $0AB17A |
  dw $0000, $0000, $0000, $0000             ; $0AB182 |
  dw $0000, $0000, $0000, $0000             ; $0AB18A |
  dw $0000, $0000, $0000, $0000             ; $0AB192 |
  dw $0000, $0000, $0000, $0000             ; $0AB19A |
  dw $0000, $0000, $0000, $0000             ; $0AB1A2 |
  dw $0000, $0000, $0000, $0000             ; $0AB1AA |
  dw $0000, $0000, $0000, $0000             ; $0AB1B2 |
  dw $0000, $0000, $0000, $0000             ; $0AB1BA |
  dw $0000, $0000, $0000, $0000             ; $0AB1C2 |
  dw $0000, $0001, $0000, $0000             ; $0AB1CA |
  dw $0000, $0000, $0000, $0000             ; $0AB1D2 |
  dw $0000, $0000, $0000, $0000             ; $0AB1DA |
  dw $0000, $0000, $0000, $0000             ; $0AB1E2 |
  dw $0000, $0000, $0000, $0000             ; $0AB1EA |
  dw $0000, $0000, $0000, $0000             ; $0AB1F2 |
  dw $0000, $FFFF, $FFFF, $FFFF             ; $0AB1FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB202 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB20A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB212 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB21A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB222 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB22A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB232 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB23A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB242 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB24A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB252 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB25A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB262 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB26A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB272 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB27A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB282 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB28A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB292 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB29A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB2FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB302 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB30A |

; sprite table
  dw $1005, $0804, $0804, $0804             ; $0AB312 |
  dw $2005, $2005, $2005, $1005             ; $0AB31A |
  dw $6005, $2805, $2005, $2005             ; $0AB322 |
  dw $0804, $0804, $0804, $0804             ; $0AB32A |
  dw $0804, $4005, $2001, $4005             ; $0AB332 |
  dw $0804, $0804, $2005, $0002             ; $0AB33A |
  dw $2005, $2005, $3805, $2805             ; $0AB342 |
  dw $0804, $0804, $0804, $0804             ; $0AB34A |
  dw $0804, $3805, $2805, $0804             ; $0AB352 |
  dw $0804, $0804, $1805, $6005             ; $0AB35A |
  dw $2005, $2005, $2005, $0804             ; $0AB362 |
  dw $4005, $4005, $2005, $2005             ; $0AB36A |
  dw $1005, $1805, $0804, $4005             ; $0AB372 |
  dw $6005, $2005, $0804, $2005             ; $0AB37A |
  dw $2006, $0804, $5005, $0805             ; $0AB382 |
  dw $3005, $3805, $0804, $3005             ; $0AB38A |
  dw $0804, $0804, $0804, $1805             ; $0AB392 |
  dw $3005, $0804, $0804, $3005             ; $0AB39A |
  dw $0804, $0804, $2005, $0804             ; $0AB3A2 |
  dw $0804, $0804, $4005, $1805             ; $0AB3AA |
  dw $2005, $4806, $6006, $2005             ; $0AB3B2 |
  dw $6005, $2005, $4006, $4006             ; $0AB3BA |
  dw $0804, $4805, $0806, $0804             ; $0AB3C2 |
  dw $0804, $0804, $2002, $0804             ; $0AB3CA |
  dw $3005, $0804, $3005, $2005             ; $0AB3D2 |
  dw $2005, $2005, $2005, $1805             ; $0AB3DA |
  dw $2005, $0804, $2005, $1005             ; $0AB3E2 |
  dw $0804, $0804, $2005, $0804             ; $0AB3EA |
  dw $5005, $2981, $4181, $6181             ; $0AB3F2 |
  dw $6181, $FFFF, $FFFF, $FFFF             ; $0AB3FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB402 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB40A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB412 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB41A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB422 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB42A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB432 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB43A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB442 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB44A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB452 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB45A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB462 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB46A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB472 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB47A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB482 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB48A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB492 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB49A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB4FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB502 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB50A |
  dw $1602, $1602, $16FF, $0005             ; $0AB512 |
  dw $0602, $0002, $0606, $0602             ; $0AB51A |
  dw $0605, $0002, $0602, $0602             ; $0AB522 |
  dw $0602, $1202, $0602, $0602             ; $0AB52A |
  dw $0602, $0602, $0602, $0602             ; $0AB532 |
  dw $1602, $0604, $0602, $0602             ; $0AB53A |
  dw $0001, $0000, $0602, $0602             ; $0AB542 |
  dw $0204, $0601, $0601, $0601             ; $0AB54A |
  dw $0601, $0601, $0601, $0601             ; $0AB552 |
  dw $0601, $0601, $0601, $0601             ; $0AB55A |
  dw $0000, $0401, $0601, $0601             ; $0AB562 |
  dw $0601, $0601, $0601, $0201             ; $0AB56A |
  dw $0001, $0001, $0601, $0001             ; $0AB572 |
  dw $0001, $0601, $0601, $0001             ; $0AB57A |
  dw $0001, $0001, $0001, $0601             ; $0AB582 |
  dw $0601, $0001, $0406, $0601             ; $0AB58A |
  dw $0205, $0205, $0606, $1001             ; $0AB592 |
  dw $1001, $0401, $0001, $0001             ; $0AB59A |
  dw $0001, $0601, $0001, $0601             ; $0AB5A2 |
  dw $0601, $0201, $0001, $0001             ; $0AB5AA |
  dw $0001, $0001, $0001, $0401             ; $0AB5B2 |
  dw $0606, $0401, $0401, $0401             ; $0AB5BA |
  dw $0001, $0001, $0000, $0401             ; $0AB5C2 |
  dw $0401, $0201, $0001, $0401             ; $0AB5CA |
  dw $1601, $0201, $0001, $0001             ; $0AB5D2 |
  dw $0401, $0001, $16FF, $0001             ; $0AB5DA |
  dw $0001, $0C01, $1000, $0602             ; $0AB5E2 |
  dw $0002, $0007, $0201, $0003             ; $0AB5EA |
  dw $0401, $0806, $0606, $0406             ; $0AB5F2 |
  dw $0006, $FFFF, $FFFF, $FFFF             ; $0AB5FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB602 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB60A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB612 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB61A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB622 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB62A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB632 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB63A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB642 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB64A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB652 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB65A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB662 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB66A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB672 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB67A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB682 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB68A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB692 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB69A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB6FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB702 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB70A |

; sprite table
  dw $0000, $0000, $0000, $4040             ; $0AB712 |
  dw $0000, $0006, $0000, $0000             ; $0AB71A |
  dw $0000, $0000, $F8F8, $0000             ; $0AB722 |
  dw $0000, $2008, $0000, $F802             ; $0AB72A |
  dw $4020, $4020, $1008, $0000             ; $0AB732 |
  dw $2020, $0000, $0000, $0402             ; $0AB73A |
  dw $0000, $0000, $0000, $0000             ; $0AB742 |
  dw $0000, $1008, $0000, $F008             ; $0AB74A |
  dw $0000, $0000, $0000, $0000             ; $0AB752 |
  dw $0000, $0000, $0000, $0000             ; $0AB75A |
  dw $0000, $0000, $0000, $0000             ; $0AB762 |
  dw $0000, $0000, $0000, $0000             ; $0AB76A |
  dw $4040, $4040, $0000, $0000             ; $0AB772 |
  dw $0000, $0000, $0408, $0000             ; $0AB77A |
  dw $0000, $4040, $0000, $0000             ; $0AB782 |
  dw $0000, $4040, $0000, $0000             ; $0AB78A |
  dw $0000, $0000, $0000, $0000             ; $0AB792 |
  dw $0000, $0404, $0000, $0000             ; $0AB79A |
  dw $0000, $0000, $0000, $4040             ; $0AB7A2 |
  dw $4040, $4040, $0000, $0000             ; $0AB7AA |
  dw $0000, $0000, $0000, $0000             ; $0AB7B2 |
  dw $0000, $0000, $0000, $0000             ; $0AB7BA |
  dw $0000, $0000, $0000, $0404             ; $0AB7C2 |
  dw $0000, $2020, $0000, $0000             ; $0AB7CA |
  dw $0000, $4040, $0000, $0000             ; $0AB7D2 |
  dw $0000, $0000, $0000, $0000             ; $0AB7DA |
  dw $0000, $4040, $0000, $0000             ; $0AB7E2 |
  dw $0006, $0010, $0000, $4040             ; $0AB7EA |
  dw $0000, $4040, $4040, $4040             ; $0AB7F2 |
  dw $4040, $FFFF, $FFFF, $FFFF             ; $0AB7FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB802 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB80A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB812 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB81A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB822 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB82A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB832 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB83A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB842 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB84A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB852 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB85A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB862 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB86A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB872 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB87A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB882 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB88A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB892 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB89A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8A2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8AA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8B2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8BA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8C2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8CA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8D2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8DA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8E2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8EA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8F2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB8FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB902 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0AB90A |
  dw $0000, $0000, $0000, $0000             ; $0AB912 |
  dw $0000, $0000, $0000, $0000             ; $0AB91A |
  dw $0000, $0000, $0000, $0000             ; $0AB922 |
  dw $0000, $0048, $0000, $0000             ; $0AB92A |
  dw $0000, $0000, $0000, $0000             ; $0AB932 |
  dw $0032, $0032, $0000, $0000             ; $0AB93A |
  dw $0045, $0000, $0000, $0000             ; $0AB942 |
  dw $0000, $0000, $0000, $0000             ; $0AB94A |
  dw $0000, $0000, $0000, $0000             ; $0AB952 |
  dw $0000, $0000, $0000, $0000             ; $0AB95A |
  dw $0000, $0000, $0000, $001C             ; $0AB962 |
  dw $0000, $0000, $0000, $0000             ; $0AB96A |
  dw $0035, $0035, $0000, $0000             ; $0AB972 |
  dw $0000, $0000, $0000, $0000             ; $0AB97A |
  dw $0000, $0000, $0041, $0000             ; $0AB982 |
  dw $0000, $0037, $0049, $0000             ; $0AB98A |
  dw $0051, $0051, $0000, $0000             ; $0AB992 |
  dw $0054, $002B, $0057, $0000             ; $0AB99A |
  dw $0056, $0000, $0058, $0058             ; $0AB9A2 |
  dw $0058, $0000, $0000, $0000             ; $0AB9AA |
  dw $0000, $0000, $0000, $004B             ; $0AB9B2 |
  dw $0000, $004B, $005D, $002B             ; $0AB9BA |
  dw $005D, $0000, $0000, $0063             ; $0AB9C2 |
  dw $0063, $0045, $0000, $0060             ; $0AB9CA |
  dw $0000, $0066, $0041, $0041             ; $0AB9D2 |
  dw $0066, $0000, $0000, $0000             ; $0AB9DA |
  dw $0000, $0000, $0000, $0000             ; $0AB9E2 |
  dw $0000, $0000, $0000, $0000             ; $0AB9EA |
  dw $0000, $0000, $0000, $0000             ; $0AB9F2 |
  dw $0000, $FFFF, $FFFF, $FFFF             ; $0AB9FA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA02 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA0A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA12 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA1A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA22 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA2A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA32 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA3A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA42 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA4A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA52 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA5A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA62 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA6A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA72 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA7A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA82 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA8A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA92 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABA9A |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAA2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAAA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAB2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABABA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAC2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABACA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAD2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABADA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAE2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAEA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAF2 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABAFA |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABB02 |
  dw $FFFF, $FFFF, $FFFF, $FFFF             ; $0ABB0A |

; MAP16 page information table
; 3 byte entries, each one is a MAP16 page
; byte 1: collision/clip bitflags:
; $01: ground only (like brown/red platform)
; $02: solid block
; $04: slope (byte 3 controls what kind)
; $08: water physics (eggs skip off this)
; $10: lava physics (doesn't affect Yoshi but sprites move slow through it)
; $20: cross-section wall flag
; $40: unused
; $80: unused
; byte 2: special properties
; byte 3: slope direction & angle
MAP16_page_info:
  db $00, $00, $00                          ; $0ABB12 | page $00
  db $02, $00, $00                          ; $0ABB15 | page $01
  db $04, $08, $00                          ; $0ABB18 | page $02
  db $04, $08, $01                          ; $0ABB1B | page $03
  db $00, $00, $00                          ; $0ABB1E | page $04
  db $04, $08, $02                          ; $0ABB21 | page $05
  db $04, $08, $03                          ; $0ABB24 | page $06
  db $00, $00, $00                          ; $0ABB27 | page $07
  db $04, $08, $04                          ; $0ABB2A | page $08
  db $00, $00, $00                          ; $0ABB2D | page $09
  db $04, $08, $05                          ; $0ABB30 | page $0A
  db $00, $00, $00                          ; $0ABB33 | page $0B
  db $04, $08, $06                          ; $0ABB36 | page $0C
  db $04, $08, $07                          ; $0ABB39 | page $0D
  db $00, $00, $00                          ; $0ABB3C | page $0E
  db $04, $08, $08                          ; $0ABB3F | page $0F
  db $04, $08, $09                          ; $0ABB42 | page $10
  db $00, $00, $00                          ; $0ABB45 | page $11
  db $00, $00, $00                          ; $0ABB48 | page $12
  db $00, $00, $00                          ; $0ABB4B | page $13
  db $09, $00, $00                          ; $0ABB4E | page $14
  db $01, $00, $00                          ; $0ABB51 | page $15
  db $08, $00, $00                          ; $0ABB54 | page $16
  db $00, $00, $00                          ; $0ABB57 | page $17
  db $00, $01, $00                          ; $0ABB5A | page $18
  db $20, $00, $00                          ; $0ABB5D | page $19
  db $02, $40, $00                          ; $0ABB60 | page $1A
  db $02, $40, $00                          ; $0ABB63 | page $1B
  db $02, $40, $00                          ; $0ABB66 | page $1C
  db $20, $00, $00                          ; $0ABB69 | page $1D
  db $01, $48, $00                          ; $0ABB6C | page $1E
  db $00, $48, $00                          ; $0ABB6F | page $1F
  db $00, $48, $00                          ; $0ABB72 | page $20
  db $00, $48, $00                          ; $0ABB75 | page $21
  db $00, $48, $00                          ; $0ABB78 | page $22
  db $00, $48, $00                          ; $0ABB7B | page $23
  db $00, $48, $00                          ; $0ABB7E | page $24
  db $00, $48, $00                          ; $0ABB81 | page $25
  db $00, $48, $00                          ; $0ABB84 | page $26
  db $00, $48, $00                          ; $0ABB87 | page $27
  db $00, $48, $00                          ; $0ABB8A | page $28
  db $02, $D8, $00                          ; $0ABB8D | page $29
  db $00, $00, $00                          ; $0ABB90 | page $2A
  db $04, $00, $0A                          ; $0ABB93 | page $2B
  db $04, $00, $0B                          ; $0ABB96 | page $2C
  db $04, $00, $0C                          ; $0ABB99 | page $2D
  db $00, $00, $00                          ; $0ABB9C | page $2E
  db $04, $00, $0D                          ; $0ABB9F | page $2F
  db $04, $00, $0E                          ; $0ABBA2 | page $30
  db $04, $00, $0F                          ; $0ABBA5 | page $31
  db $00, $00, $00                          ; $0ABBA8 | page $32
  db $04, $00, $10                          ; $0ABBAB | page $33
  db $00, $00, $00                          ; $0ABBAE | page $34
  db $04, $00, $11                          ; $0ABBB1 | page $35
  db $00, $00, $00                          ; $0ABBB4 | page $36
  db $01, $10, $00                          ; $0ABBB7 | page $37
  db $01, $00, $00                          ; $0ABBBA | page $38
  db $02, $00, $00                          ; $0ABBBD | page $39
  db $02, $08, $00                          ; $0ABBC0 | page $3A
  db $00, $00, $00                          ; $0ABBC3 | page $3B
  db $00, $00, $00                          ; $0ABBC6 | page $3C
  db $00, $00, $00                          ; $0ABBC9 | page $3D
  db $02, $00, $00                          ; $0ABBCC | page $3E
  db $21, $00, $00                          ; $0ABBCF | page $3F
  db $24, $00, $06                          ; $0ABBD2 | page $40
  db $24, $00, $07                          ; $0ABBD5 | page $41
  db $00, $00, $00                          ; $0ABBD8 | page $42
  db $00, $00, $00                          ; $0ABBDB | page $43
  db $24, $00, $08                          ; $0ABBDE | page $44
  db $24, $00, $09                          ; $0ABBE1 | page $45
  db $00, $00, $00                          ; $0ABBE4 | page $46
  db $00, $00, $00                          ; $0ABBE7 | page $47
  db $24, $00, $00                          ; $0ABBEA | page $48
  db $24, $00, $01                          ; $0ABBED | page $49
  db $02, $00, $00                          ; $0ABBF0 | page $4A
  db $24, $00, $02                          ; $0ABBF3 | page $4B
  db $24, $00, $03                          ; $0ABBF6 | page $4C
  db $02, $00, $00                          ; $0ABBF9 | page $4D
  db $24, $00, $04                          ; $0ABBFC | page $4E
  db $00, $00, $00                          ; $0ABBFF | page $4F
  db $24, $00, $05                          ; $0ABC02 | page $50
  db $00, $00, $00                          ; $0ABC05 | page $51
  db $02, $00, $00                          ; $0ABC08 | page $52
  db $25, $00, $12                          ; $0ABC0B | page $53
  db $02, $00, $00                          ; $0ABC0E | page $54
  db $25, $00, $13                          ; $0ABC11 | page $55
  db $02, $00, $00                          ; $0ABC14 | page $56
  db $25, $00, $14                          ; $0ABC17 | page $57
  db $02, $00, $00                          ; $0ABC1A | page $58
  db $25, $00, $15                          ; $0ABC1D | page $59
  db $02, $00, $00                          ; $0ABC20 | page $5A
  db $25, $00, $16                          ; $0ABC23 | page $5B
  db $02, $00, $00                          ; $0ABC26 | page $5C
  db $25, $00, $17                          ; $0ABC29 | page $5D
  db $00, $48, $00                          ; $0ABC2C | page $5E
  db $02, $38, $00                          ; $0ABC2F | page $5F
  db $00, $30, $00                          ; $0ABC32 | page $60
  db $02, $18, $00                          ; $0ABC35 | page $61
  db $00, $00, $00                          ; $0ABC38 | page $62
  db $00, $00, $00                          ; $0ABC3B | page $63
  db $02, $00, $00                          ; $0ABC3E | page $64
  db $00, $00, $00                          ; $0ABC41 | page $65
  db $04, $60, $18                          ; $0ABC44 | page $66
  db $04, $68, $19                          ; $0ABC47 | page $67
  db $20, $00, $00                          ; $0ABC4A | page $68
  db $20, $00, $00                          ; $0ABC4D | page $69
  db $00, $00, $00                          ; $0ABC50 | page $6A
  db $02, $58, $00                          ; $0ABC53 | page $6B
  db $04, $C8, $1A                          ; $0ABC56 | page $6C
  db $00, $00, $00                          ; $0ABC59 | page $6D
  db $02, $00, $00                          ; $0ABC5C | page $6E
  db $02, $00, $00                          ; $0ABC5F | page $6F
  db $20, $00, $00                          ; $0ABC62 | page $70
  db $20, $00, $00                          ; $0ABC65 | page $71
  db $02, $70, $00                          ; $0ABC68 | page $72
  db $00, $78, $00                          ; $0ABC6B | page $73
  db $00, $B0, $00                          ; $0ABC6E | page $74
  db $01, $88, $00                          ; $0ABC71 | page $75
  db $01, $90, $00                          ; $0ABC74 | page $76
  db $00, $00, $00                          ; $0ABC77 | page $77
  db $02, $98, $00                          ; $0ABC7A | page $78
  db $02, $00, $00                          ; $0ABC7D | page $79
  db $02, $00, $00                          ; $0ABC80 | page $7A
  db $02, $00, $00                          ; $0ABC83 | page $7B
  db $02, $D8, $00                          ; $0ABC86 | page $7C
  db $02, $A0, $00                          ; $0ABC89 | page $7D
  db $18, $28, $00                          ; $0ABC8C | page $7E
  db $04, $98, $04                          ; $0ABC8F | page $7F
  db $04, $98, $05                          ; $0ABC92 | page $80
  db $00, $98, $00                          ; $0ABC95 | page $81
  db $02, $98, $00                          ; $0ABC98 | page $82
  db $02, $98, $00                          ; $0ABC9B | page $83
  db $00, $00, $00                          ; $0ABC9E | page $84
  db $00, $00, $00                          ; $0ABCA1 | page $85
  db $04, $00, $1B                          ; $0ABCA4 | page $86
  db $00, $00, $00                          ; $0ABCA7 | page $87
  db $02, $00, $00                          ; $0ABCAA | page $88
  db $02, $B8, $00                          ; $0ABCAD | page $89
  db $00, $80, $00                          ; $0ABCB0 | page $8A
  db $00, $A8, $00                          ; $0ABCB3 | page $8B
  db $02, $B8, $00                          ; $0ABCB6 | page $8C
  db $00, $00, $00                          ; $0ABCB9 | page $8D
  db $02, $D0, $00                          ; $0ABCBC | page $8E
  db $01, $C0, $00                          ; $0ABCBF | page $8F
  db $02, $00, $00                          ; $0ABCC2 | page $90
  db $18, $00, $00                          ; $0ABCC5 | page $91
  db $00, $00, $00                          ; $0ABCC8 | page $92
  db $02, $20, $00                          ; $0ABCCB | page $93
  db $04, $20, $04                          ; $0ABCCE | page $94
  db $04, $20, $05                          ; $0ABCD1 | page $95
  db $00, $00, $00                          ; $0ABCD4 | page $96
  db $0C, $00, $04                          ; $0ABCD7 | page $97
  db $0C, $00, $05                          ; $0ABCDA | page $98
  db $00, $00, $00                          ; $0ABCDD | page $99
  db $01, $00, $00                          ; $0ABCE0 | page $9A
  db $00, $00, $00                          ; $0ABCE3 | page $9B
  db $02, $00, $00                          ; $0ABCE6 | page $9C
  db $02, $00, $00                          ; $0ABCE9 | page $9D
  db $00, $00, $00                          ; $0ABCEC | page $9E
  db $25, $00, $1C                          ; $0ABCEF | page $9F
  db $25, $00, $1D                          ; $0ABCF2 | page $A0
  db $25, $00, $1E                          ; $0ABCF5 | page $A1
  db $25, $00, $1F                          ; $0ABCF8 | page $A2
  db $02, $58, $00                          ; $0ABCFB | page $A3
  db $00, $30, $00                          ; $0ABCFE | page $A4
  db $00, $00, $00                          ; $0ABD01 | page $A5
  db $02, $28, $00                          ; $0ABD04 | page $A6
  db $00, $00, $00                          ; $0ABD07 | page $A7

  dw $80C0, $0F2D                           ; $0ABD0A |
  dw $1F00, $1E2D, $80C0, $0F2D             ; $0ABD0E |
  dw $1F00, $1C2D, $80C0, $0E2D             ; $0ABD16 |
  dw $1F00, $1A2D, $80C0, $0E2D             ; $0ABD1E |
  dw $1F00, $182D, $80C0, $0D2D             ; $0ABD26 |
  dw $1F00, $162D, $80C0, $0D2D             ; $0ABD2E |
  dw $1F00, $142D, $80C0, $0C2D             ; $0ABD36 |
  dw $1F00, $122D, $80C0, $0C2D             ; $0ABD3E |
  dw $1F00, $102D, $80C0, $0B2D             ; $0ABD46 |
  dw $0F00, $0E2D, $80C0, $0B2D             ; $0ABD4E |
  dw $0F00, $0C2D, $80C0, $0A2D             ; $0ABD56 |
  dw $0F00, $0A2D, $80C0, $0A2D             ; $0ABD5E |
  dw $0F00, $082D, $80C0, $092D             ; $0ABD66 |
  dw $0F00, $062D, $80C0, $092D             ; $0ABD6E |
  dw $0F00, $042D, $80C0, $082D             ; $0ABD76 |
  dw $0F00, $022D, $80C0, $082D             ; $0ABD7E |
  dw $0F00, $002D, $80C0, $072D             ; $0ABD86 |
  dw $0F00, $0E2D, $80C0, $072D             ; $0ABD8E |
  dw $0F00, $0C2D, $80C0, $062D             ; $0ABD96 |
  dw $0F00, $0A2D, $80C0, $062D             ; $0ABD9E |
  dw $0F00, $082D, $80C0, $052D             ; $0ABDA6 |
  dw $0F00, $062D, $80C0, $052D             ; $0ABDAE |
  dw $0F00, $042D, $80C0, $042D             ; $0ABDB6 |
  dw $0F00, $022D, $80C0, $042D             ; $0ABDBE |
  dw $0F00, $002D, $80C0, $032D             ; $0ABDC6 |
  dw $0F00, $FE2D, $80C0, $032D             ; $0ABDCE |
  dw $0F00, $FC2D, $80C0, $022D             ; $0ABDD6 |
  dw $0F00, $FA2D, $80C0, $022D             ; $0ABDDE |
  dw $0F00, $F82D, $80C0, $012D             ; $0ABDE6 |
  dw $0F00, $F62D, $80C0, $012D             ; $0ABDEE |
  dw $0F00, $F42D, $80C0, $002D             ; $0ABDF6 |
  dw $0F00, $F22D, $80C0, $002D             ; $0ABDFE |
  dw $0F00, $F02D, $00D3, $7F40             ; $0ABE06 |
  dw $0F00, $00D3, $00D3, $7F40             ; $0ABE0E |
  dw $0F00, $02D3, $01D3, $7F40             ; $0ABE16 |
  dw $0F00, $04D3, $01D3, $7F40             ; $0ABE1E |
  dw $0F00, $06D3, $02D3, $7F40             ; $0ABE26 |
  dw $0F00, $08D3, $02D3, $7F40             ; $0ABE2E |
  dw $0F00, $0AD3, $03D3, $7F40             ; $0ABE36 |
  dw $0F00, $0CD3, $03D3, $7F40             ; $0ABE3E |
  dw $0F00, $0ED3, $04D3, $7F40             ; $0ABE46 |
  dw $1F00, $10D3, $04D3, $7F40             ; $0ABE4E |
  dw $1F00, $12D3, $05D3, $7F40             ; $0ABE56 |
  dw $1F00, $14D3, $05D3, $7F40             ; $0ABE5E |
  dw $1F00, $16D3, $06D3, $7F40             ; $0ABE66 |
  dw $1F00, $18D3, $06D3, $7F40             ; $0ABE6E |
  dw $1F00, $1AD3, $07D3, $7F40             ; $0ABE76 |
  dw $1F00, $1CD3, $07D3, $7F40             ; $0ABE7E |
  dw $1F00, $1ED3, $08D3, $7F40             ; $0ABE86 |
  dw $0F00, $F0D3, $08D3, $7F40             ; $0ABE8E |
  dw $0F00, $F2D3, $09D3, $7F40             ; $0ABE96 |
  dw $0F00, $F4D3, $09D3, $7F40             ; $0ABE9E |
  dw $0F00, $F6D3, $0AD3, $7F40             ; $0ABEA6 |
  dw $0F00, $F8D3, $0AD3, $7F40             ; $0ABEAE |
  dw $0F00, $FAD3, $0BD3, $7F40             ; $0ABEB6 |
  dw $0F00, $FCD3, $0BD3, $7F40             ; $0ABEBE |
  dw $0F00, $FED3, $0CD3, $7F40             ; $0ABEC6 |
  dw $0F00, $00D3, $0CD3, $7F40             ; $0ABECE |
  dw $0F00, $02D3, $0DD3, $7F40             ; $0ABED6 |
  dw $0F00, $04D3, $0DD3, $7F40             ; $0ABEDE |
  dw $0F00, $06D3, $0ED3, $7F40             ; $0ABEE6 |
  dw $0F00, $08D3, $0ED3, $7F40             ; $0ABEEE |
  dw $0F00, $0AD3, $0FD3, $7F40             ; $0ABEF6 |
  dw $0F00, $0CD3, $0FD3, $7F40             ; $0ABEFE |
  dw $0F00, $0ED3, $80C0, $0F20             ; $0ABF06 |
  dw $0F00, $0F20, $80C0, $0E20             ; $0ABF0E |
  dw $0F00, $0E20, $80C0, $0D20             ; $0ABF16 |
  dw $0F00, $0D20, $80C0, $0C20             ; $0ABF1E |
  dw $0F00, $0C20, $80C0, $0B20             ; $0ABF26 |
  dw $0F00, $0B20, $80C0, $0A20             ; $0ABF2E |
  dw $0F00, $0A20, $80C0, $0920             ; $0ABF36 |
  dw $0F00, $0920, $80C0, $0820             ; $0ABF3E |
  dw $0F00, $0820, $80C0, $0720             ; $0ABF46 |
  dw $0F00, $0720, $80C0, $0620             ; $0ABF4E |
  dw $0F00, $0620, $80C0, $0520             ; $0ABF56 |
  dw $0F00, $0520, $80C0, $0420             ; $0ABF5E |
  dw $0F00, $0420, $80C0, $0320             ; $0ABF66 |
  dw $0F00, $0320, $80C0, $0220             ; $0ABF6E |
  dw $0F00, $0220, $80C0, $0120             ; $0ABF76 |
  dw $0F00, $0120, $80C0, $0020             ; $0ABF7E |
  dw $0F00, $0020, $00E0, $7F40             ; $0ABF86 |
  dw $0F00, $00E0, $01E0, $7F40             ; $0ABF8E |
  dw $0F00, $01E0, $02E0, $7F40             ; $0ABF96 |
  dw $0F00, $02E0, $03E0, $7F40             ; $0ABF9E |
  dw $0F00, $03E0, $04E0, $7F40             ; $0ABFA6 |
  dw $0F00, $04E0, $05E0, $7F40             ; $0ABFAE |
  dw $0F00, $05E0, $06E0, $7F40             ; $0ABFB6 |
  dw $0F00, $06E0, $07E0, $7F40             ; $0ABFBE |
  dw $0F00, $07E0, $08E0, $7F40             ; $0ABFC6 |
  dw $0F00, $08E0, $09E0, $7F40             ; $0ABFCE |
  dw $0F00, $09E0, $0AE0, $7F40             ; $0ABFD6 |
  dw $0F00, $0AE0, $0BE0, $7F40             ; $0ABFDE |
  dw $0F00, $0BE0, $0CE0, $7F40             ; $0ABFE6 |
  dw $0F00, $0CE0, $0DE0, $7F40             ; $0ABFEE |
  dw $0F00, $0DE0, $0EE0, $7F40             ; $0ABFF6 |
  dw $0F00, $0EE0, $0FE0, $7F40             ; $0ABFFE |
  dw $0F00, $0FE0, $8000, $7F00             ; $0AC006 |
  dw $0F00, $0F12, $8000, $7F00             ; $0AC00E |
  dw $0F00, $0F12, $8000, $7F00             ; $0AC016 |
  dw $0F00, $0E12, $8000, $7F00             ; $0AC01E |
  dw $0F00, $0E12, $8000, $7F00             ; $0AC026 |
  dw $0F00, $0D12, $8000, $7F00             ; $0AC02E |
  dw $0F00, $0D12, $8000, $7F00             ; $0AC036 |
  dw $0F00, $0C12, $8000, $7F00             ; $0AC03E |
  dw $0F00, $0C12, $80C0, $0E12             ; $0AC046 |
  dw $0F00, $0B12, $80C0, $0C12             ; $0AC04E |
  dw $0F00, $0B12, $80C0, $0A12             ; $0AC056 |
  dw $0F00, $0A12, $80C0, $0812             ; $0AC05E |
  dw $0F00, $0A12, $80C0, $0612             ; $0AC066 |
  dw $0F00, $0912, $80C0, $0412             ; $0AC06E |
  dw $0F00, $0912, $80C0, $0212             ; $0AC076 |
  dw $0F00, $0812, $80C0, $0012             ; $0AC07E |
  dw $0F00, $0812, $80C0, $0E12             ; $0AC086 |
  dw $0F00, $0712, $80C0, $0C12             ; $0AC08E |
  dw $0F00, $0712, $80C0, $0A12             ; $0AC096 |
  dw $0F00, $0612, $80C0, $0812             ; $0AC09E |
  dw $0F00, $0612, $80C0, $0612             ; $0AC0A6 |
  dw $0F00, $0512, $80C0, $0412             ; $0AC0AE |
  dw $0F00, $0512, $80C0, $0212             ; $0AC0B6 |
  dw $0F00, $0412, $80C0, $0012             ; $0AC0BE |
  dw $0F00, $0412, $80C0, $FE12             ; $0AC0C6 |
  dw $0F00, $0312, $80C0, $FC12             ; $0AC0CE |
  dw $0F00, $0312, $80C0, $FA12             ; $0AC0D6 |
  dw $0F00, $0212, $80C0, $F812             ; $0AC0DE |
  dw $0F00, $0212, $80C0, $F612             ; $0AC0E6 |
  dw $0F00, $0112, $80C0, $F412             ; $0AC0EE |
  dw $0F00, $0112, $80C0, $F212             ; $0AC0F6 |
  dw $0F00, $0012, $80C0, $F012             ; $0AC0FE |
  dw $0F00, $0012, $00EE, $7F40             ; $0AC106 |
  dw $0F00, $00EE, $02EE, $7F40             ; $0AC10E |
  dw $0F00, $00EE, $04EE, $7F40             ; $0AC116 |
  dw $0F00, $01EE, $06EE, $7F40             ; $0AC11E |
  dw $0F00, $01EE, $08EE, $7F40             ; $0AC126 |
  dw $0F00, $02EE, $0AEE, $7F40             ; $0AC12E |
  dw $0F00, $02EE, $0CEE, $7F40             ; $0AC136 |
  dw $0F00, $03EE, $0EEE, $7F40             ; $0AC13E |
  dw $0F00, $03EE, $10EE, $7F40             ; $0AC146 |
  dw $0F00, $04EE, $12EE, $7F40             ; $0AC14E |
  dw $0F00, $04EE, $14EE, $7F40             ; $0AC156 |
  dw $0F00, $05EE, $16EE, $7F40             ; $0AC15E |
  dw $0F00, $05EE, $18EE, $7F40             ; $0AC166 |
  dw $0F00, $06EE, $1AEE, $7F40             ; $0AC16E |
  dw $0F00, $06EE, $1CEE, $7F40             ; $0AC176 |
  dw $0F00, $07EE, $1EEE, $7F40             ; $0AC17E |
  dw $0F00, $07EE, $8000, $7F00             ; $0AC186 |
  dw $2000, $08EE, $8000, $7F00             ; $0AC18E |
  dw $2000, $08EE, $8000, $7F00             ; $0AC196 |
  dw $2000, $09EE, $8000, $7F00             ; $0AC19E |
  dw $2000, $09EE, $8000, $7F00             ; $0AC1A6 |
  dw $2000, $0AEE, $8000, $7F00             ; $0AC1AE |
  dw $2000, $0AEE, $8000, $7F00             ; $0AC1B6 |
  dw $2000, $0BEE, $8000, $7F00             ; $0AC1BE |
  dw $2000, $0BEE, $00EE, $7F40             ; $0AC1C6 |
  dw $1000, $0CEE, $02EE, $7F40             ; $0AC1CE |
  dw $1000, $0CEE, $04EE, $7F40             ; $0AC1D6 |
  dw $1000, $0DEE, $06EE, $7F40             ; $0AC1DE |
  dw $1000, $0DEE, $08EE, $7F40             ; $0AC1E6 |
  dw $1000, $0EEE, $0AEE, $7F40             ; $0AC1EE |
  dw $1000, $0EEE, $0CEE, $7F40             ; $0AC1F6 |
  dw $1000, $0FEE, $0EEE, $7F40             ; $0AC1FE |
  dw $1000, $0FEE, $8000, $7F00             ; $0AC206 |
  dw $FF00, $4020, $8000, $7F00             ; $0AC20E |
  dw $FF00, $4020, $8000, $7F00             ; $0AC216 |
  dw $FF00, $4020, $8000, $7F00             ; $0AC21E |
  dw $FF00, $4020, $8000, $7F00             ; $0AC226 |
  dw $FF00, $4020, $0F00, $7F00             ; $0AC22E |
  dw $0F00, $0F20, $0F00, $0D00             ; $0AC236 |
  dw $0F00, $0D20, $0F00, $0C00             ; $0AC23E |
  dw $0F00, $0C20, $0F00, $0B00             ; $0AC246 |
  dw $0F00, $0B20, $0F00, $0A00             ; $0AC24E |
  dw $0F00, $0A20, $0F00, $0900             ; $0AC256 |
  dw $0F00, $0920, $0F00, $0800             ; $0AC25E |
  dw $0F00, $0820, $0F00, $0700             ; $0AC266 |
  dw $0F00, $0720, $0F00, $0600             ; $0AC26E |
  dw $0F00, $0620, $0F00, $0600             ; $0AC276 |
  dw $0F00, $0620, $0F00, $0500             ; $0AC27E |
  dw $0F00, $0520, $0F00, $0B00             ; $0AC286 |
  dw $0F00, $0412, $0F00, $0700             ; $0AC28E |
  dw $0F00, $0412, $0F00, $0400             ; $0AC296 |
  dw $0F00, $0312, $0F00, $0200             ; $0AC29E |
  dw $0F00, $0312, $0F00, $0000             ; $0AC2A6 |
  dw $0F00, $0212, $0F00, $0000             ; $0AC2AE |
  dw $0F00, $0212, $0F00, $0000             ; $0AC2B6 |
  dw $0F00, $0212, $0F00, $0000             ; $0AC2BE |
  dw $0F00, $0112, $0F00, $0000             ; $0AC2C6 |
  dw $0F00, $0112, $0F00, $0000             ; $0AC2CE |
  dw $0F00, $0112, $0F00, $0000             ; $0AC2D6 |
  dw $0F00, $0112, $0F00, $0000             ; $0AC2DE |
  dw $0F00, $0012, $0F00, $0000             ; $0AC2E6 |
  dw $0F00, $0012, $0F00, $0000             ; $0AC2EE |
  dw $0F00, $0012, $0F00, $0000             ; $0AC2F6 |
  dw $0F00, $0012, $0F00, $0000             ; $0AC2FE |
  dw $0F00, $0012, $0F00, $0400             ; $0AC306 |
  dw $0F00, $0B20, $0F00, $0400             ; $0AC30E |
  dw $0F00, $0720, $0F00, $0300             ; $0AC316 |
  dw $0F00, $0420, $0F00, $0300             ; $0AC31E |
  dw $0F00, $0220, $0F00, $0200             ; $0AC326 |
  dw $0F00, $0020, $0F00, $0200             ; $0AC32E |
  dw $0F00, $FF20, $0F00, $0200             ; $0AC336 |
  dw $0F00, $FD20, $0F00, $0100             ; $0AC33E |
  dw $0F00, $FC20, $0F00, $0100             ; $0AC346 |
  dw $0F00, $FB20, $0F00, $0100             ; $0AC34E |
  dw $0F00, $FA20, $0F00, $0100             ; $0AC356 |
  dw $0F00, $F920, $0F00, $0000             ; $0AC35E |
  dw $0F00, $F820, $0F00, $0000             ; $0AC366 |
  dw $0F00, $F720, $0F00, $0000             ; $0AC36E |
  dw $0F00, $F620, $0F00, $0000             ; $0AC376 |
  dw $0F00, $F620, $0F00, $0000             ; $0AC37E |
  dw $0F00, $F520, $0400, $0000             ; $0AC386 |
  dw $0F00, $00EE, $0800, $0000             ; $0AC38E |
  dw $0F00, $00EE, $0B00, $0000             ; $0AC396 |
  dw $0F00, $00EE, $0D00, $0000             ; $0AC39E |
  dw $0F00, $00EE, $0F00, $0000             ; $0AC3A6 |
  dw $0F00, $00EE, $0F00, $0000             ; $0AC3AE |
  dw $0F00, $01EE, $0F00, $0000             ; $0AC3B6 |
  dw $0F00, $01EE, $0F00, $0000             ; $0AC3BE |
  dw $0F00, $01EE, $0F00, $0000             ; $0AC3C6 |
  dw $0F00, $01EE, $0F00, $0000             ; $0AC3CE |
  dw $0F00, $02EE, $0F00, $0000             ; $0AC3D6 |
  dw $0F00, $02EE, $0F00, $0000             ; $0AC3DE |
  dw $0F00, $02EE, $0F00, $0000             ; $0AC3E6 |
  dw $0F00, $03EE, $0F00, $0000             ; $0AC3EE |
  dw $0F00, $03EE, $0F00, $0000             ; $0AC3F6 |
  dw $0F00, $04EE, $0F00, $0000             ; $0AC3FE |
  dw $0F00, $04EE, $8000, $7F00             ; $0AC406 |
  dw $0F00, $05E0, $8000, $7F00             ; $0AC40E |
  dw $0F00, $06E0, $8000, $7F00             ; $0AC416 |
  dw $0F00, $06E0, $8000, $7F00             ; $0AC41E |
  dw $0F00, $07E0, $8000, $7F00             ; $0AC426 |
  dw $0F00, $08E0, $0000, $0000             ; $0AC42E |
  dw $0F00, $09E0, $0200, $0000             ; $0AC436 |
  dw $0F00, $0AE0, $0300, $0000             ; $0AC43E |
  dw $0F00, $0BE0, $0400, $0000             ; $0AC446 |
  dw $0F00, $0CE0, $0500, $0000             ; $0AC44E |
  dw $0F00, $0DE0, $0600, $0000             ; $0AC456 |
  dw $FF00, $0FE0, $0700, $0000             ; $0AC45E |
  dw $FF00, $40E0, $0800, $0000             ; $0AC466 |
  dw $FF00, $40E0, $0900, $0000             ; $0AC46E |
  dw $FF00, $40E0, $0900, $0000             ; $0AC476 |
  dw $FF00, $40E0, $0A00, $0000             ; $0AC47E |
  dw $FF00, $40E0, $0B00, $0000             ; $0AC486 |
  dw $0F00, $F5E0, $0B00, $0000             ; $0AC48E |
  dw $0F00, $F6E0, $0C00, $0000             ; $0AC496 |
  dw $0F00, $F6E0, $0C00, $0000             ; $0AC49E |
  dw $0F00, $F7E0, $0D00, $0000             ; $0AC4A6 |
  dw $0F00, $F8E0, $0D00, $0000             ; $0AC4AE |
  dw $0F00, $F9E0, $0D00, $0000             ; $0AC4B6 |
  dw $0F00, $FAE0, $0E00, $0000             ; $0AC4BE |
  dw $0F00, $FBE0, $0E00, $0000             ; $0AC4C6 |
  dw $0F00, $FCE0, $0E00, $0000             ; $0AC4CE |
  dw $0F00, $FDE0, $0E00, $0000             ; $0AC4D6 |
  dw $0F00, $FFE0, $0F00, $0000             ; $0AC4DE |
  dw $0F00, $00E0, $0F00, $0000             ; $0AC4E6 |
  dw $0F00, $02E0, $0F00, $0000             ; $0AC4EE |
  dw $0F00, $04E0, $0F00, $0000             ; $0AC4F6 |
  dw $0F00, $07E0, $0F00, $0000             ; $0AC4FE |
  dw $0F00, $0BE0, $0F00, $0D00             ; $0AC506 |
  dw $0F00, $0D20, $0F00, $0A00             ; $0AC50E |
  dw $0F00, $0A20, $0F00, $0800             ; $0AC516 |
  dw $0F00, $0820, $0F00, $0700             ; $0AC51E |
  dw $0F00, $0720, $0F00, $0600             ; $0AC526 |
  dw $0F00, $0620, $0F00, $0500             ; $0AC52E |
  dw $0F00, $0520, $0F00, $0400             ; $0AC536 |
  dw $0F00, $0420, $0F00, $0300             ; $0AC53E |
  dw $0F00, $0320, $0F00, $0200             ; $0AC546 |
  dw $0F00, $0212, $0F00, $0200             ; $0AC54E |
  dw $0F00, $0212, $0F00, $0100             ; $0AC556 |
  dw $0F00, $0112, $0F00, $0100             ; $0AC55E |
  dw $0F00, $0112, $0F00, $0100             ; $0AC566 |
  dw $0F00, $0100, $0F00, $0000             ; $0AC56E |
  dw $0F00, $0000, $0F00, $0000             ; $0AC576 |
  dw $0F00, $0000, $0F00, $0000             ; $0AC57E |
  dw $0F00, $0000, $0F00, $0000             ; $0AC586 |
  dw $0F00, $0000, $0F00, $0000             ; $0AC58E |
  dw $0F00, $0000, $0F00, $0000             ; $0AC596 |
  dw $0F00, $0000, $0F00, $0100             ; $0AC59E |
  dw $0F00, $0100, $0F00, $0100             ; $0AC5A6 |
  dw $0F00, $01EE, $0F00, $0100             ; $0AC5AE |
  dw $0F00, $01EE, $0F00, $0200             ; $0AC5B6 |
  dw $0F00, $02EE, $0F00, $0200             ; $0AC5BE |
  dw $0F00, $02EE, $0F00, $0300             ; $0AC5C6 |
  dw $0F00, $03E0, $0F00, $0400             ; $0AC5CE |
  dw $0F00, $04E0, $0F00, $0500             ; $0AC5D6 |
  dw $0F00, $05E0, $0F00, $0600             ; $0AC5DE |
  dw $0F00, $06E0, $0F00, $0700             ; $0AC5E6 |
  dw $0F00, $07E0, $0F00, $0800             ; $0AC5EE |
  dw $0F00, $08E0, $0F00, $0A00             ; $0AC5F6 |
  dw $0F00, $0AE0, $0F00, $0D00             ; $0AC5FE |
  dw $0F00, $0DE0, $80C0, $006E             ; $0AC606 |
  dw $006E, $0000, $80C0, $026E             ; $0AC60E |
  dw $006E, $0000, $80C0, $046E             ; $0AC616 |
  dw $016E, $0000, $80C0, $066E             ; $0AC61E |
  dw $016E, $0000, $80C0, $086E             ; $0AC626 |
  dw $026E, $0000, $80C0, $0A6E             ; $0AC62E |
  dw $026E, $0000, $80C0, $0C6E             ; $0AC636 |
  dw $036E, $0000, $80C0, $0E6E             ; $0AC63E |
  dw $036E, $0000, $8000, $7F00             ; $0AC646 |
  dw $046E, $0000, $8000, $7F00             ; $0AC64E |
  dw $046E, $0000, $8000, $7F00             ; $0AC656 |
  dw $056E, $0000, $8000, $7F00             ; $0AC65E |
  dw $056E, $0000, $8000, $7F00             ; $0AC666 |
  dw $066E, $0000, $8000, $7F00             ; $0AC66E |
  dw $066E, $0000, $8000, $7F00             ; $0AC676 |
  dw $076E, $0000, $8000, $7F00             ; $0AC67E |
  dw $076E, $0000, $80C0, $F06E             ; $0AC686 |
  dw $086E, $0000, $80C0, $F26E             ; $0AC68E |
  dw $086E, $0000, $80C0, $F46E             ; $0AC696 |
  dw $096E, $0000, $80C0, $F66E             ; $0AC69E |
  dw $096E, $0000, $80C0, $F86E             ; $0AC6A6 |
  dw $0A6E, $0000, $80C0, $FA6E             ; $0AC6AE |
  dw $0A6E, $0000, $80C0, $FC6E             ; $0AC6B6 |
  dw $0B6E, $0000, $80C0, $FE6E             ; $0AC6BE |
  dw $0B6E, $0000, $80C0, $006E             ; $0AC6C6 |
  dw $0C6E, $0000, $80C0, $026E             ; $0AC6CE |
  dw $0C6E, $0000, $80C0, $046E             ; $0AC6D6 |
  dw $0D6E, $0000, $80C0, $066E             ; $0AC6DE |
  dw $0D6E, $0000, $80C0, $086E             ; $0AC6E6 |
  dw $0E6E, $0000, $80C0, $0A6E             ; $0AC6EE |
  dw $0E6E, $0000, $80C0, $0C6E             ; $0AC6F6 |
  dw $0F6E, $0000, $80C0, $0E6E             ; $0AC6FE |
  dw $0F6E, $0000, $1E92, $7F40             ; $0AC706 |
  dw $0F92, $0000, $1C92, $7F40             ; $0AC70E |
  dw $0F92, $0000, $1A92, $7F40             ; $0AC716 |
  dw $0E92, $0000, $1892, $7F40             ; $0AC71E |
  dw $0E92, $0000, $1692, $7F40             ; $0AC726 |
  dw $0D92, $0000, $1492, $7F40             ; $0AC72E |
  dw $0D92, $0000, $1292, $7F40             ; $0AC736 |
  dw $0C92, $0000, $1092, $7F40             ; $0AC73E |
  dw $0C92, $0000, $0E92, $7F40             ; $0AC746 |
  dw $0B92, $0000, $0C92, $7F40             ; $0AC74E |
  dw $0B92, $0000, $0A92, $7F40             ; $0AC756 |
  dw $0A92, $0000, $0892, $7F40             ; $0AC75E |
  dw $0A92, $0000, $0692, $7F40             ; $0AC766 |
  dw $0992, $0000, $0492, $7F40             ; $0AC76E |
  dw $0992, $0000, $0292, $7F40             ; $0AC776 |
  dw $0892, $0000, $0092, $7F40             ; $0AC77E |
  dw $0892, $0000, $0E92, $7F40             ; $0AC786 |
  dw $0792, $0000, $0C92, $7F40             ; $0AC78E |
  dw $0792, $0000, $0A92, $7F40             ; $0AC796 |
  dw $0692, $0000, $0892, $7F40             ; $0AC79E |
  dw $0692, $0000, $0692, $7F40             ; $0AC7A6 |
  dw $0592, $0000, $0492, $7F40             ; $0AC7AE |
  dw $0592, $0000, $0292, $7F40             ; $0AC7B6 |
  dw $0492, $0000, $0092, $7F40             ; $0AC7BE |
  dw $0492, $0000, $FE00, $7F00             ; $0AC7C6 |
  dw $0392, $0000, $FC00, $7F00             ; $0AC7CE |
  dw $0392, $0000, $FA00, $7F00             ; $0AC7D6 |
  dw $0292, $0000, $F800, $7F00             ; $0AC7DE |
  dw $0292, $0000, $F600, $7F00             ; $0AC7E6 |
  dw $0192, $0000, $F400, $7F00             ; $0AC7EE |
  dw $0192, $0000, $F200, $7F00             ; $0AC7F6 |
  dw $0092, $0000, $F000, $7F00             ; $0AC7FE |
  dw $0092, $0000, $80C0, $0060             ; $0AC806 |
  dw $0060, $0000, $80C0, $0160             ; $0AC80E |
  dw $0160, $0000, $80C0, $0260             ; $0AC816 |
  dw $0260, $0000, $80C0, $0360             ; $0AC81E |
  dw $0360, $0000, $80C0, $0460             ; $0AC826 |
  dw $0460, $0000, $80C0, $0560             ; $0AC82E |
  dw $0560, $0000, $80C0, $0660             ; $0AC836 |
  dw $0660, $0000, $80C0, $0760             ; $0AC83E |
  dw $0760, $0000, $80C0, $0860             ; $0AC846 |
  dw $0860, $0000, $80C0, $0960             ; $0AC84E |
  dw $0960, $0000, $80C0, $0A60             ; $0AC856 |
  dw $0A60, $0000, $80C0, $0B60             ; $0AC85E |
  dw $0B60, $0000, $80C0, $0C60             ; $0AC866 |
  dw $0C60, $0000, $80C0, $0D60             ; $0AC86E |
  dw $0D60, $0000, $80C0, $0E60             ; $0AC876 |
  dw $0E60, $0000, $80C0, $0F60             ; $0AC87E |
  dw $0F60, $0000, $0FA0, $7F40             ; $0AC886 |
  dw $0FA0, $0000, $0EA0, $7F40             ; $0AC88E |
  dw $0EA0, $0000, $0DA0, $7F40             ; $0AC896 |
  dw $0DA0, $0000, $0CA0, $7F40             ; $0AC89E |
  dw $0CA0, $0000, $0BA0, $7F40             ; $0AC8A6 |
  dw $0BA0, $0000, $0AA0, $7F40             ; $0AC8AE |
  dw $0AA0, $0000, $09A0, $7F40             ; $0AC8B6 |
  dw $09A0, $0000, $08A0, $7F40             ; $0AC8BE |
  dw $08A0, $0000, $07A0, $7F40             ; $0AC8C6 |
  dw $07A0, $0000, $06A0, $7F40             ; $0AC8CE |
  dw $06A0, $0000, $05A0, $7F40             ; $0AC8D6 |
  dw $05A0, $0000, $04A0, $7F40             ; $0AC8DE |
  dw $04A0, $0000, $03A0, $7F40             ; $0AC8E6 |
  dw $03A0, $0000, $02A0, $7F40             ; $0AC8EE |
  dw $02A0, $0000, $01A0, $7F40             ; $0AC8F6 |
  dw $01A0, $0000, $00A0, $7F40             ; $0AC8FE |
  dw $00A0, $0000, $8000, $0F00             ; $0AC906 |
  dw $0000, $0801, $8000, $0E00             ; $0AC90E |
  dw $0000, $0801, $8000, $0D00             ; $0AC916 |
  dw $0000, $0801, $8000, $0C00             ; $0AC91E |
  dw $0000, $0801, $8000, $0B00             ; $0AC926 |
  dw $0000, $0801, $8000, $0A00             ; $0AC92E |
  dw $0000, $0801, $8000, $0900             ; $0AC936 |
  dw $0000, $0801, $8000, $0800             ; $0AC93E |
  dw $0000, $0801, $8000, $0700             ; $0AC946 |
  dw $0000, $0001, $8000, $0600             ; $0AC94E |
  dw $0000, $0001, $8000, $0500             ; $0AC956 |
  dw $0000, $0001, $8000, $0400             ; $0AC95E |
  dw $0000, $0001, $8000, $0300             ; $0AC966 |
  dw $0000, $0001, $8000, $0200             ; $0AC96E |
  dw $0000, $0001, $8000, $0100             ; $0AC976 |
  dw $0000, $0001, $8000, $0000             ; $0AC97E |
  dw $0000, $0001, $0F00, $7F00             ; $0AC986 |
  dw $0000, $0001, $0E00, $7F00             ; $0AC98E |
  dw $0000, $0001, $0D00, $7F00             ; $0AC996 |
  dw $0000, $0001, $0C00, $7F00             ; $0AC99E |
  dw $0000, $0001, $0B00, $7F00             ; $0AC9A6 |
  dw $0000, $0001, $0A00, $7F00             ; $0AC9AE |
  dw $0000, $0001, $0900, $7F00             ; $0AC9B6 |
  dw $0000, $0001, $0800, $7F00             ; $0AC9BE |
  dw $0000, $0001, $0700, $7F00             ; $0AC9C6 |
  dw $0000, $0801, $0600, $7F00             ; $0AC9CE |
  dw $0000, $0801, $0500, $7F00             ; $0AC9D6 |
  dw $0000, $0801, $0400, $7F00             ; $0AC9DE |
  dw $0000, $0801, $0300, $7F00             ; $0AC9E6 |
  dw $0000, $0801, $0200, $7F00             ; $0AC9EE |
  dw $0000, $0801, $0100, $7F00             ; $0AC9F6 |
  dw $0000, $0801, $0000, $7F00             ; $0AC9FE |
  dw $0000, $0801, $0F20, $00E0             ; $0ACA06 |
  dw $0000, $0E2D, $0E20, $01E0             ; $0ACA0E |
  dw $0000, $0C2D, $0D20, $02E0             ; $0ACA16 |
  dw $0000, $0A2D, $0C20, $03E0             ; $0ACA1E |
  dw $0000, $082D, $0B20, $04E0             ; $0ACA26 |
  dw $0000, $062D, $0A20, $05E0             ; $0ACA2E |
  dw $0000, $042D, $0920, $06E0             ; $0ACA36 |
  dw $0000, $022D, $0820, $07E0             ; $0ACA3E |
  dw $0000, $002D, $0720, $08E0             ; $0ACA46 |
  dw $0000, $00D3, $0620, $09E0             ; $0ACA4E |
  dw $0000, $02D3, $0520, $0AE0             ; $0ACA56 |
  dw $0000, $04D3, $0420, $0BE0             ; $0ACA5E |
  dw $0000, $06D3, $0320, $0CE0             ; $0ACA66 |
  dw $0000, $08D3, $0220, $0DE0             ; $0ACA6E |
  dw $0000, $0AD3, $0120, $0EE0             ; $0ACA76 |
  dw $0000, $0CD3, $0020, $0FE0             ; $0ACA7E |
  dw $0000, $0ED3, $0500, $0A00             ; $0ACA86 |
  dw $0000, $052D, $0312, $0CEE             ; $0ACA8E |
  dw $0000, $0320, $0220, $0DE0             ; $0ACA96 |
  dw $0000, $0220, $0120, $0EE0             ; $0ACA9E |
  dw $0000, $0112, $002D, $0FD3             ; $0ACAA6 |
  dw $0000, $0112, $0040, $0FC0             ; $0ACAAE |
  dw $0000, $0000, $0040, $0FC0             ; $0ACAB6 |
  dw $0000, $0000, $0040, $0FC0             ; $0ACABE |
  dw $0000, $0000, $0040, $0FC0             ; $0ACAC6 |
  dw $0000, $0000, $0040, $0FC0             ; $0ACACE |
  dw $0000, $0000, $0040, $0FC0             ; $0ACAD6 |
  dw $0000, $0000, $0040, $0FC0             ; $0ACADE |
  dw $0000, $01EE, $0040, $0FC0             ; $0ACAE6 |
  dw $0000, $01EE, $0040, $0FC0             ; $0ACAEE |
  dw $0000, $02E0, $0040, $0FC0             ; $0ACAF6 |
  dw $0000, $03E0, $0040, $0FC0             ; $0ACAFE |
  dw $0000, $05D3, $80C0, $0053             ; $0ACB06 |
  dw $0053, $0000, $80C0, $0053             ; $0ACB0E |
  dw $0253, $0000, $80C0, $0153             ; $0ACB16 |
  dw $0453, $0000, $80C0, $0153             ; $0ACB1E |
  dw $0653, $0000, $80C0, $0253             ; $0ACB26 |
  dw $0853, $0000, $80C0, $0253             ; $0ACB2E |
  dw $0A53, $0000, $80C0, $0353             ; $0ACB36 |
  dw $0C53, $0000, $80C0, $0353             ; $0ACB3E |
  dw $0E53, $0000, $80C0, $0453             ; $0ACB46 |
  dw $1053, $0000, $80C0, $0453             ; $0ACB4E |
  dw $1253, $0000, $80C0, $0553             ; $0ACB56 |
  dw $1453, $0000, $80C0, $0553             ; $0ACB5E |
  dw $1653, $0000, $80C0, $0653             ; $0ACB66 |
  dw $1853, $0000, $80C0, $0653             ; $0ACB6E |
  dw $1A53, $0000, $80C0, $0753             ; $0ACB76 |
  dw $1C53, $0000, $80C0, $0753             ; $0ACB7E |
  dw $1E53, $0000, $80C0, $0853             ; $0ACB86 |
  dw $F053, $F000, $80C0, $0853             ; $0ACB8E |
  dw $F253, $F000, $80C0, $0953             ; $0ACB96 |
  dw $F453, $F000, $80C0, $0953             ; $0ACB9E |
  dw $F653, $F000, $80C0, $0A53             ; $0ACBA6 |
  dw $F853, $F000, $80C0, $0A53             ; $0ACBAE |
  dw $FA53, $F000, $80C0, $0B53             ; $0ACBB6 |
  dw $FC53, $F000, $80C0, $0B53             ; $0ACBBE |
  dw $FE53, $F000, $80C0, $0C53             ; $0ACBC6 |
  dw $0053, $0000, $80C0, $0C53             ; $0ACBCE |
  dw $0253, $0000, $80C0, $0D53             ; $0ACBD6 |
  dw $0453, $0000, $80C0, $0D53             ; $0ACBDE |
  dw $0653, $0000, $80C0, $0E53             ; $0ACBE6 |
  dw $0853, $0000, $80C0, $0E53             ; $0ACBEE |
  dw $0A53, $0000, $80C0, $0F53             ; $0ACBF6 |
  dw $0C53, $0000, $80C0, $0F53             ; $0ACBFE |
  dw $0E53, $0000, $0FAD, $7F40             ; $0ACC06 |
  dw $1EAD, $0000, $0FAD, $7F40             ; $0ACC0E |
  dw $1CAD, $0000, $0EAD, $7F40             ; $0ACC16 |
  dw $1AAD, $0000, $0EAD, $7F40             ; $0ACC1E |
  dw $18AD, $0000, $0DAD, $7F40             ; $0ACC26 |
  dw $16AD, $0000, $0DAD, $7F40             ; $0ACC2E |
  dw $14AD, $0000, $0CAD, $7F40             ; $0ACC36 |
  dw $12AD, $0000, $0CAD, $7F40             ; $0ACC3E |
  dw $10AD, $0000, $0BAD, $7F40             ; $0ACC46 |
  dw $0EAD, $0000, $0BAD, $7F40             ; $0ACC4E |
  dw $0CAD, $0000, $0AAD, $7F40             ; $0ACC56 |
  dw $0AAD, $0000, $0AAD, $7F40             ; $0ACC5E |
  dw $08AD, $0000, $09AD, $7F40             ; $0ACC66 |
  dw $06AD, $0000, $09AD, $7F40             ; $0ACC6E |
  dw $04AD, $0000, $08AD, $7F40             ; $0ACC76 |
  dw $02AD, $0000, $08AD, $7F40             ; $0ACC7E |
  dw $00AD, $0000, $07AD, $7F40             ; $0ACC86 |
  dw $0EAD, $0000, $07AD, $7F40             ; $0ACC8E |
  dw $0CAD, $0000, $06AD, $7F40             ; $0ACC96 |
  dw $0AAD, $0000, $06AD, $7F40             ; $0ACC9E |
  dw $08AD, $0000, $05AD, $7F40             ; $0ACCA6 |
  dw $06AD, $0000, $05AD, $7F40             ; $0ACCAE |
  dw $04AD, $0000, $04AD, $7F40             ; $0ACCB6 |
  dw $02AD, $0000, $04AD, $7F40             ; $0ACCBE |
  dw $00AD, $0000, $03AD, $7F40             ; $0ACCC6 |
  dw $FEAD, $F000, $03AD, $7F40             ; $0ACCCE |
  dw $FCAD, $F000, $02AD, $7F40             ; $0ACCD6 |
  dw $FAAD, $F000, $02AD, $7F40             ; $0ACCDE |
  dw $F8AD, $F000, $01AD, $7F40             ; $0ACCE6 |
  dw $F6AD, $F000, $01AD, $7F40             ; $0ACCEE |
  dw $F4AD, $F000, $00AD, $7F40             ; $0ACCF6 |
  dw $F2AD, $F000, $00AD, $7F40             ; $0ACCFE |
  dw $F0AD, $F000                           ; $0ACD06 |

  db $05, $04, $06, $01, $00, $02, $09, $08 ; $0ACD0A |
  db $0A, $0D, $0C, $0E, $07, $0F, $03, $0B ; $0ACD12 |
  db $01, $00, $02, $03                     ; $0ACD1A |

  ibt   r0,#$000A                           ; $0ACD1E |
  romb                                      ; $0ACD20 |
  move  r8,r1                               ; $0ACD22 |
  move  r0,r2                               ; $0ACD24 |
  link  #4                                  ; $0ACD26 |
  iwt   r15,#$D095                          ; $0ACD27 |
  cache                                     ; $0ACD2A |
  from r6                                   ; $0ACD2B |
  lob                                       ; $0ACD2C |
  iwt   r3,#$CD0A                           ; $0ACD2D |
  to r14                                    ; $0ACD30 |
  add   r3                                  ; $0ACD31 |
  getb                                      ; $0ACD32 |
  to r14                                    ; $0ACD33 |
  and   #4                                  ; $0ACD34 |
  beq CODE_0ACD89                           ; $0ACD36 |
  nop                                       ; $0ACD38 |
  ibt   r9,#$0000                           ; $0ACD39 |
  ibt   r10,#$0000                          ; $0ACD3B |
  ibt   r4,#$0010                           ; $0ACD3D |
  to r14                                    ; $0ACD3F |
  and   #8                                  ; $0ACD40 |
  beq CODE_0ACD46                           ; $0ACD42 |
  nop                                       ; $0ACD44 |
  dec   r10                                 ; $0ACD45 |

CODE_0ACD46:
  and   #3                                  ; $0ACD46 |
  bne CODE_0ACD6F                           ; $0ACD48 |
  dec   r0                                  ; $0ACD4A |
  with r9                                   ; $0ACD4B |

CODE_0ACD4C:
  add   r4                                  ; $0ACD4C |
  from r1                                   ; $0ACD4D |
  to r8                                     ; $0ACD4E |
  add   r9                                  ; $0ACD4F |
  move  r0,r2                               ; $0ACD50 |
  link  #4                                  ; $0ACD52 |
  iwt   r15,#$D096                          ; $0ACD53 |
  lm    r0,($F800)                          ; $0ACD56 |
  and   r7                                  ; $0ACD5A |
  iwt   r7,#$7000                           ; $0ACD5B |
  sub   r7                                  ; $0ACD5E |
  bne CODE_0ACD89                           ; $0ACD5F |
  from r6                                   ; $0ACD61 |
  lob                                       ; $0ACD62 |
  to r14                                    ; $0ACD63 |
  add   r3                                  ; $0ACD64 |
  getb                                      ; $0ACD65 |
  and   #2                                  ; $0ACD66 |
  beq CODE_0ACD4C                           ; $0ACD68 |
  with r9                                   ; $0ACD6A |
  with r1                                   ; $0ACD6B |
  bra CODE_0ACD9D                           ; $0ACD6C |
  add   r9                                  ; $0ACD6E |

CODE_0ACD6F:
  bne CODE_0ACD9A                           ; $0ACD6F |
  dec   r0                                  ; $0ACD71 |
  with r9                                   ; $0ACD72 |

CODE_0ACD73:
  add   r4                                  ; $0ACD73 |
  from r1                                   ; $0ACD74 |
  to r8                                     ; $0ACD75 |
  add   r9                                  ; $0ACD76 |
  move  r0,r2                               ; $0ACD77 |
  link  #4                                  ; $0ACD79 |
  iwt   r15,#$D096                          ; $0ACD7A |
  lm    r0,($F800)                          ; $0ACD7D |
  and   r7                                  ; $0ACD81 |
  iwt   r7,#$7000                           ; $0ACD82 |
  sub   r7                                  ; $0ACD85 |
  beq CODE_0ACD8E                           ; $0ACD86 |
  from r6                                   ; $0ACD88 |

CODE_0ACD89:
  ibt   r9,#$0000                           ; $0ACD89 |
  sub   r0                                  ; $0ACD8B |
  stop                                      ; $0ACD8C |
  nop                                       ; $0ACD8D |

CODE_0ACD8E:
  lob                                       ; $0ACD8E |
  to r14                                    ; $0ACD8F |
  add   r3                                  ; $0ACD90 |
  getb                                      ; $0ACD91 |
  and   #2                                  ; $0ACD92 |
  beq CODE_0ACD73                           ; $0ACD94 |
  with r9                                   ; $0ACD96 |
  bra CODE_0ACDBF                           ; $0ACD97 |
  nop                                       ; $0ACD99 |

CODE_0ACD9A:
  bne CODE_0ACDBF                           ; $0ACD9A |
  nop                                       ; $0ACD9C |

CODE_0ACD9D:
  with r9                                   ; $0ACD9D |

CODE_0ACD9E:
  add   r4                                  ; $0ACD9E |
  from r1                                   ; $0ACD9F |
  to r8                                     ; $0ACDA0 |
  sub   r9                                  ; $0ACDA1 |
  move  r0,r2                               ; $0ACDA2 |
  link  #4                                  ; $0ACDA4 |
  iwt   r15,#$D096                          ; $0ACDA5 |
  lm    r0,($F800)                          ; $0ACDA8 |
  and   r7                                  ; $0ACDAC |
  iwt   r7,#$7000                           ; $0ACDAD |
  sub   r7                                  ; $0ACDB0 |
  bne CODE_0ACD89                           ; $0ACDB1 |
  from r6                                   ; $0ACDB3 |
  lob                                       ; $0ACDB4 |
  to r14                                    ; $0ACDB5 |
  add   r3                                  ; $0ACDB6 |
  getb                                      ; $0ACDB7 |
  and   #1                                  ; $0ACDB8 |
  beq CODE_0ACD9E                           ; $0ACDBA |
  with r9                                   ; $0ACDBC |
  with r1                                   ; $0ACDBD |
  sub   r9                                  ; $0ACDBE |

CODE_0ACDBF:
  inc   r10                                 ; $0ACDBF |
  beq CODE_0ACDE3                           ; $0ACDC0 |
  nop                                       ; $0ACDC2 |
  dec   r10                                 ; $0ACDC3 |

CODE_0ACDC4:
  with r10                                  ; $0ACDC4 |
  add   r4                                  ; $0ACDC5 |
  move  r8,r1                               ; $0ACDC6 |
  from r2                                   ; $0ACDC8 |
  add   r10                                 ; $0ACDC9 |
  link  #4                                  ; $0ACDCA |
  iwt   r15,#$D096                          ; $0ACDCB |
  lm    r0,($F800)                          ; $0ACDCE |
  and   r7                                  ; $0ACDD2 |
  iwt   r7,#$7000                           ; $0ACDD3 |
  sub   r7                                  ; $0ACDD6 |
  bne CODE_0ACD89                           ; $0ACDD7 |
  from r6                                   ; $0ACDD9 |
  lob                                       ; $0ACDDA |
  to r14                                    ; $0ACDDB |
  add   r3                                  ; $0ACDDC |
  getb                                      ; $0ACDDD |
  and   #8                                  ; $0ACDDE |
  beq CODE_0ACDC4                           ; $0ACDE0 |
  nop                                       ; $0ACDE2 |

CODE_0ACDE3:
  from r9                                   ; $0ACDE3 |
  lsr                                       ; $0ACDE4 |
  to r1                                     ; $0ACDE5 |
  add   r1                                  ; $0ACDE6 |
  from r10                                  ; $0ACDE7 |
  lsr                                       ; $0ACDE8 |
  to r2                                     ; $0ACDE9 |
  add   r2                                  ; $0ACDEA |
  with r9                                   ; $0ACDEB |
  add   r4                                  ; $0ACDEC |
  with r10                                  ; $0ACDED |
  add   r4                                  ; $0ACDEE |
  move  r6,r10                              ; $0ACDEF |
  from r9                                   ; $0ACDF1 |
  lmult                                     ; $0ACDF2 |
  from r4                                   ; $0ACDF4 |
  to r3                                     ; $0ACDF5 |
  hib                                       ; $0ACDF6 |
  sub   r0                                  ; $0ACDF7 |
  stop                                      ; $0ACDF8 |
  nop                                       ; $0ACDF9 |

  ibt   r0,#$000A                           ; $0ACDFA |
  romb                                      ; $0ACDFC |
  from r1                                   ; $0ACDFE |
  to r8                                     ; $0ACDFF |
  add   r3                                  ; $0ACE00 |
  from r2                                   ; $0ACE01 |
  add   r4                                  ; $0ACE02 |
  link  #4                                  ; $0ACE03 |
  iwt   r15,#$D095                          ; $0ACE04 |
  cache                                     ; $0ACE07 |
  and   #2                                  ; $0ACE08 |
  bne CODE_0ACE28                           ; $0ACE0A |
  nop                                       ; $0ACE0C |
  ibt   r12,#$000F                          ; $0ACE0D |
  move  r13,r15                             ; $0ACE0F |
  lms   r1,($0000)                          ; $0ACE11 |
  from r1                                   ; $0ACE14 |
  to r8                                     ; $0ACE15 |
  add   r3                                  ; $0ACE16 |
  lms   r2,($0002)                          ; $0ACE17 |
  from r2                                   ; $0ACE1A |
  add   r4                                  ; $0ACE1B |
  link  #4                                  ; $0ACE1C |
  iwt   r15,#$D096                          ; $0ACE1D |
  alt1                                      ; $0ACE20 |

  and   #2                                  ; $0ACE21 |
  bne CODE_0ACE2C                           ; $0ACE23 |
  nop                                       ; $0ACE25 |
  loop                                      ; $0ACE26 |
  nop                                       ; $0ACE27 |

CODE_0ACE28:
  ibt   r1,#$FFFF                           ; $0ACE28 |
  ibt   r2,#$FFFF                           ; $0ACE2A |

CODE_0ACE2C:
  sub   r0                                  ; $0ACE2C |
  stop                                      ; $0ACE2D |
  nop                                       ; $0ACE2E |

  ibt   r7,#$000A                           ; $0ACE2F |\
  from r7                                   ; $0ACE31 | | $0A -> rom bank
  romb                                      ; $0ACE32 |/
  link  #4                                  ; $0ACE34 |\
  iwt   r15,#$D096                          ; $0ACE35 | | call sub
  alt1                                      ; $0ACE38 |/

  to r5                                     ; $0ACE39 |
  and   #2                                  ; $0ACE3A |
  sub   r0                                  ; $0ACE3C |
  stop                                      ; $0ACE3D |
  nop                                       ; $0ACE3E |

  ibt   r0,#$000A                           ; $0ACE3F |
  romb                                      ; $0ACE41 |
  cache                                     ; $0ACE43 |

CODE_0ACE44:
  ibt   r12,#$0007                          ; $0ACE44 |
  move  r13,r15                             ; $0ACE46 |
  move  r8,r2                               ; $0ACE48 |
  move  r0,r3                               ; $0ACE4A |
  link  #4                                  ; $0ACE4C |
  iwt   r15,#$D096                          ; $0ACE4D |
  alt1                                      ; $0ACE50 |

  and   #3                                  ; $0ACE51 |
  bne CODE_0ACE76                           ; $0ACE53 |
  nop                                       ; $0ACE55 |
  with r3                                   ; $0ACE56 |
  sub   #15                                 ; $0ACE57 |
  dec   r3                                  ; $0ACE59 |
  with r14                                  ; $0ACE5A |
  add   #15                                 ; $0ACE5B |
  loop                                      ; $0ACE5D |
  inc   r14                                 ; $0ACE5E |

CODE_0ACE5F:
  lms   r0,($0020)                          ; $0ACE5F |
  dec   r0                                  ; $0ACE62 |
  beq CODE_0ACE71                           ; $0ACE63 |
  sbk                                       ; $0ACE65 |
  ibt   r3,#$0004                           ; $0ACE66 |
  from r3                                   ; $0ACE68 |
  to r14                                    ; $0ACE69 |
  sub   r0                                  ; $0ACE6A |
  with r2                                   ; $0ACE6B |
  add   r4                                  ; $0ACE6C |
  with r10                                  ; $0ACE6D |
  bra CODE_0ACE44                           ; $0ACE6E |
  to r3                                     ; $0ACE70 |

CODE_0ACE71:
  ibt   r14,#$FFF0                          ; $0ACE71 |
  sub   r0                                  ; $0ACE73 |

CODE_0ACE74:
  stop                                      ; $0ACE74 |
  nop                                       ; $0ACE75 |

CODE_0ACE76:
  move  r13,r15                             ; $0ACE76 |
  with r3                                   ; $0ACE78 |
  sub   #15                                 ; $0ACE79 |
  dec   r3                                  ; $0ACE7B |
  move  r8,r2                               ; $0ACE7C |
  move  r0,r3                               ; $0ACE7E |
  link  #4                                  ; $0ACE80 |
  iwt   r15,#$D096                          ; $0ACE81 |
  alt1                                      ; $0ACE84 |

  and   #2                                  ; $0ACE85 |
  beq CODE_0ACE74                           ; $0ACE87 |
  sub   r0                                  ; $0ACE89 |
  with r14                                  ; $0ACE8A |
  add   #15                                 ; $0ACE8B |
  loop                                      ; $0ACE8D |
  inc   r14                                 ; $0ACE8E |
  bra CODE_0ACE5F                           ; $0ACE8F |
  nop                                       ; $0ACE91 |

  ibt   r0,#$000A                           ; $0ACE92 |
  romb                                      ; $0ACE94 |
  cache                                     ; $0ACE96 |
  move  r13,r15                             ; $0ACE97 |
  move  r8,r2                               ; $0ACE99 |
  move  r0,r3                               ; $0ACE9B |
  link  #4                                  ; $0ACE9D |
  iwt   r15,#$D096                          ; $0ACE9E |
  alt1                                      ; $0ACEA1 |

  and   #2                                  ; $0ACEA2 |
  beq CODE_0ACEC9                           ; $0ACEA4 |
  with r3                                   ; $0ACEA6 |
  add   r4                                  ; $0ACEA7 |
  loop                                      ; $0ACEA8 |
  inc   r14                                 ; $0ACEA9 |
  ibt   r14,#$0010                          ; $0ACEAA |
  lms   r12,($0058)                         ; $0ACEAC |
  dec   r12                                 ; $0ACEAF |
  move  r2,r9                               ; $0ACEB0 |
  move  r3,r10                              ; $0ACEB2 |
  move  r13,r15                             ; $0ACEB4 |
  move  r8,r2                               ; $0ACEB6 |
  move  r0,r3                               ; $0ACEB8 |
  link  #4                                  ; $0ACEBA |
  iwt   r15,#$D096                          ; $0ACEBB |
  alt1                                      ; $0ACEBE |

  and   #1                                  ; $0ACEBF |
  bne CODE_0ACEC9                           ; $0ACEC1 |
  with r3                                   ; $0ACEC3 |
  add   r4                                  ; $0ACEC4 |
  loop                                      ; $0ACEC5 |
  inc   r14                                 ; $0ACEC6 |
  ibt   r14,#$FFF0                          ; $0ACEC7 |

CODE_0ACEC9:
  stop                                      ; $0ACEC9 |
  nop                                       ; $0ACECA |

  db $01, $00, $01, $05, $01, $0A, $05, $0F ; $0ACECB |
  db $01, $14, $0C, $00, $09, $19, $01, $20 ; $0ACED3 |
  db $09, $25, $03, $2C, $03, $30, $04, $34 ; $0ACEDB |
  db $02, $00, $0D, $36, $08, $00, $0D, $3B ; $0ACEE3 |
  db $0E, $3B, $02, $0A, $09, $40, $0A, $47 ; $0ACEEB |
  db $09, $4C, $01, $53, $01, $58, $05, $00 ; $0ACEF3 |
  db $01, $5D, $01, $62, $0C, $67, $00, $6C ; $0ACEFB |
  db $0B, $6C, $06, $6C, $01, $6D, $08, $05 ; $0ACF03 |
  db $02, $05, $0D, $05, $08, $01, $08, $10 ; $0ACF0B |
  db $08, $08, $05, $08, $0A, $08, $08, $05 ; $0ACF13 |
  db $08, $0B, $08, $08, $FC, $08, $14, $08 ; $0ACF1B |
  db $08, $FC, $08, $14, $08, $0A, $F8, $0A ; $0ACF23 |
  db $18, $0A, $08, $00, $08, $10, $08, $08 ; $0ACF2B |
  db $00, $08, $0F, $08, $08, $FC, $08, $15 ; $0ACF33 |
  db $08, $05, $FA, $05, $15, $05, $FB, $00 ; $0ACF3B |
  db $14, $00, $FB, $10, $14, $10, $10, $10 ; $0ACF43 |
  db $02, $10, $1E, $10, $08, $02, $08, $20 ; $0ACF4B |
  db $08, $08, $F8, $00, $18, $00, $F9, $00 ; $0ACF53 |
  db $17, $00, $F9, $10, $17, $10, $FE, $FE ; $0ACF5B |
  db $11, $11, $FE, $11, $11, $FE, $00, $00 ; $0ACF63 |
  db $0F, $0F, $00, $0F, $0F, $00, $FE, $10 ; $0ACF6B |
  db $12, $10, $08, $08, $FA, $08, $16, $08 ; $0ACF73 |
  db $08, $FA, $08, $16, $08, $08, $FC, $FC ; $0ACF7B |
  db $14, $FC, $08, $FA, $08, $16, $08, $08 ; $0ACF83 |
  db $02, $08, $0E, $08, $04, $00, $0C, $00 ; $0ACF8B |
  db $04, $10, $0C, $10, $08, $08, $00, $08 ; $0ACF93 |
  db $10, $08, $08, $00, $08, $10, $08, $04 ; $0ACF9B |
  db $00, $04, $10, $04, $00, $FA, $10, $FA ; $0ACFA3 |
  db $01, $10, $0F, $10, $08, $08, $02, $08 ; $0ACFAB |
  db $0D, $08, $08, $FA, $08, $18, $08, $08 ; $0ACFB3 |
  db $FD, $06, $13, $06, $08, $F9, $08, $16 ; $0ACFBB |
  db $08, $08, $00, $08, $10, $08, $08, $FD ; $0ACFC3 |
  db $08, $13, $08, $04, $FC, $04, $14, $04 ; $0ACFCB |
  db $08, $F8, $08, $10, $08, $08, $00, $08 ; $0ACFD3 |
  db $0F, $08, $08, $00, $08, $0F, $08, $08 ; $0ACFDB |
  db $08, $08, $EC, $04, $24, $04, $08, $E8 ; $0ACFE3 |
  db $08, $20                               ; $0ACFEB |

  ibt   r0,#$000A                           ; $0ACFED |
  romb                                      ; $0ACFEF |
  ibt   r1,#$0000                           ; $0ACFF1 |
  ibt   r12,#$0028                          ; $0ACFF3 |
  cache                                     ; $0ACFF5 |
  move  r13,r15                             ; $0ACFF6 |
  iwt   r0,#$0EC3                           ; $0ACFF8 |
  add   r1                                  ; $0ACFFB |
  ldb   (r0)                                ; $0ACFFC |
  moves r2,r0                               ; $0ACFFE |
  beq CODE_0AD00D                           ; $0AD000 |
  nop                                       ; $0AD002 |
  iwt   r0,#$1820                           ; $0AD003 |
  add   r1                                  ; $0AD006 |
  ldw   (r0)                                ; $0AD007 |
  bic   #1                                  ; $0AD008 |
  sbk                                       ; $0AD00A |
  ibt   r2,#$0000                           ; $0AD00B |

CODE_0AD00D:
  iwt   r0,#$0EC2                           ; $0AD00D |
  add   r1                                  ; $0AD010 |
  from r2                                   ; $0AD011 |
  stw   (r0)                                ; $0AD012 |
  iwt   r0,#$0EC0                           ; $0AD013 |
  add   r1                                  ; $0AD016 |
  ldw   (r0)                                ; $0AD017 |
  sub   #14                                 ; $0AD018 |
  bcc CODE_0AD07E                           ; $0AD01A |
  nop                                       ; $0AD01C |
  iwt   r0,#$0F62                           ; $0AD01D |
  add   r1                                  ; $0AD020 |
  ldw   (r0)                                ; $0AD021 |
  ibt   r7,#$001F                           ; $0AD022 |
  and   r7                                  ; $0AD024 |
  beq CODE_0AD07E                           ; $0AD025 |
  add   r0                                  ; $0AD027 |
  iwt   r14,#$CEC9                          ; $0AD028 |
  to r14                                    ; $0AD02B |
  add   r14                                 ; $0AD02C |
  iwt   r0,#$10A2                           ; $0AD02D |
  add   r1                                  ; $0AD030 |
  to r9                                     ; $0AD031 |
  ldw   (r0)                                ; $0AD032 |
  to r7                                     ; $0AD033 |
  getb                                      ; $0AD034 |
  inc   r14                                 ; $0AD035 |
  iwt   r0,#$1142                           ; $0AD036 |
  add   r1                                  ; $0AD039 |
  to r10                                    ; $0AD03A |
  ldw   (r0)                                ; $0AD03B |
  iwt   r0,#$16E0                           ; $0AD03C |
  add   r1                                  ; $0AD03F |
  ldw   (r0)                                ; $0AD040 |
  to r10                                    ; $0AD041 |
  add   r10                                 ; $0AD042 |
  getb                                      ; $0AD043 |
  add   r0                                  ; $0AD044 |
  iwt   r14,#$CF09                          ; $0AD045 |
  to r14                                    ; $0AD048 |
  add   r14                                 ; $0AD049 |
  from r7                                   ; $0AD04A |
  add   r7                                  ; $0AD04B |
  add   r7                                  ; $0AD04C |
  inc   r0                                  ; $0AD04D |
  to r15                                    ; $0AD04E |
  add   r15                                 ; $0AD04F |

CODE_0AD050:         db $FF
  dl $01D642                                ; $0AD051 |
  dl $01D51C                                ; $0AD054 |
  dl $01D61B                                ; $0AD057 |
  dl $01D64B                                ; $0AD05A |
  dl $01D669                                ; $0AD05D |
  dl $01E20F                                ; $0AD060 |
  dl $01E459                                ; $0AD063 |
  dl $01E3C5                                ; $0AD066 |
  dl $01E4BA                                ; $0AD069 |
  dl $01DD9F                                ; $0AD06C |
  dl $01D679                                ; $0AD06F |
  dl $01DD91                                ; $0AD072 |
  dl $01E385                                ; $0AD075 |
  dl $01E148                                ; $0AD078 |
  dl $01E580                                ; $0AD07B |

CODE_0AD07E:
  inc r1                                    ; $0AD07E |
  iwt   r0,#$181F                           ; $0AD07F |
  add   r1                                  ; $0AD082 |
  from r2                                   ; $0AD083 |
  stw   (r0)                                ; $0AD084 |
  inc   r1                                  ; $0AD085 |
  inc   r1                                  ; $0AD086 |
  loop                                      ; $0AD087 |
  inc   r1                                  ; $0AD088 |
  sub   r0                                  ; $0AD089 |
  stop                                      ; $0AD08A |
  nop                                       ; $0AD08B |

; unused code
  alt3                                      ; $0AD08C |

  getb                                      ; $0AD08D |
  inc   r14                                 ; $0AD08E |
  to r8                                     ; $0AD08F |
  add   r9                                  ; $0AD090 |
  getbs                                     ; $0AD091 |
  inc   r14                                 ; $0AD093 |
  add   r10                                 ; $0AD094 |
  lms   r6,($01CA)                          ; $0AD095 |
  dec   r6                                  ; $0AD098 |
  to r7                                     ; $0AD099 |
  bmi CODE_0AD0A1                           ; $0AD09A |
  add   r0                                  ; $0AD09C |
  iwt   r15,#$D134                          ; $0AD09D |
  nop                                       ; $0AD0A0 |

CODE_0AD0A1:
  lms   r5,($00A6)                          ; $0AD0A1 |
  sub   r5                                  ; $0AD0A4 |
  iwt   r5,#$00E0                           ; $0AD0A5 |
  sub   r5                                  ; $0AD0A8 |
  lms   r5,($00A4)                          ; $0AD0A9 |
  bcs CODE_0AD0C8                           ; $0AD0AC |
  from r8                                   ; $0AD0AE |
  sub   r5                                  ; $0AD0AF |
  hib                                       ; $0AD0B0 |
  bne CODE_0AD0C8                           ; $0AD0B1 |
  from r8                                   ; $0AD0B3 |
  lsr                                       ; $0AD0B4 |
  lsr                                       ; $0AD0B5 |
  lsr                                       ; $0AD0B6 |
  ibt   r5,#$003E                           ; $0AD0B7 |
  to r5                                     ; $0AD0B9 |
  and   r5                                  ; $0AD0BA |
  iwt   r0,#$01E0                           ; $0AD0BB |
  and   r7                                  ; $0AD0BE |
  add   r0                                  ; $0AD0BF |
  or    r5                                  ; $0AD0C0 |
  iwt   r5,#$409E                           ; $0AD0C1 |
  add   r5                                  ; $0AD0C4 |
  bra CODE_0AD0F2                           ; $0AD0C5 |

  ldw   (r0)                                ; $0AD0C7 |

CODE_0AD0C8:
  merge                                     ; $0AD0C8 |
  beq CODE_0AD12F                           ; $0AD0C9 |
  to r6                                     ; $0AD0CB |
  lob                                       ; $0AD0CC |
  hib                                       ; $0AD0CD |
  and   #14                                 ; $0AD0CE |
  umult #8                                  ; $0AD0D0 |
  or    r6                                  ; $0AD0D2 |
  iwt   r6,#$0CAA                           ; $0AD0D3 |
  add   r6                                  ; $0AD0D6 |
  ldb   (r0)                                ; $0AD0D7 |
  ibt   r6,#$003F                           ; $0AD0D9 |
  and   r6                                  ; $0AD0DB |
  to r6                                     ; $0AD0DC |
  swap                                      ; $0AD0DD |
  iwt   r0,#$01E0                           ; $0AD0DE |
  to r5                                     ; $0AD0E1 |
  and   r7                                  ; $0AD0E2 |
  from r8                                   ; $0AD0E3 |
  lob                                       ; $0AD0E4 |
  lsr                                       ; $0AD0E5 |
  lsr                                       ; $0AD0E6 |
  lsr                                       ; $0AD0E7 |
  or    r5                                  ; $0AD0E8 |
  lsr                                       ; $0AD0E9 |
  or    r6                                  ; $0AD0EA |
  add   r0                                  ; $0AD0EB |
  iwt   r6,#$8000                           ; $0AD0EC |
  add   r6                                  ; $0AD0EF |
  stop                                      ; $0AD0F0 |
  nop                                       ; $0AD0F1 |

CODE_0AD0F2:
  move  r6,r0                               ; $0AD0F2 |
  hib                                       ; $0AD0F4 |
  umult #3                                  ; $0AD0F5 |

CODE_0AD0F7:
  move  r5,r14                              ; $0AD0F7 |
  iwt   r14,#$BB12                          ; $0AD0F9 |
  to r14                                    ; $0AD0FC |
  add   r14                                 ; $0AD0FD |
  sms   ($0000),r8                          ; $0AD0FE |
  getb                                      ; $0AD101 |
  inc   r14                                 ; $0AD102 |
  with r7                                   ; $0AD103 |
  asr                                       ; $0AD104 |
  sms   ($0002),r7                          ; $0AD105 |
  ibt   r8,#$FFF8                           ; $0AD108 |
  getbh                                     ; $0AD10A |
  inc   r14                                 ; $0AD10C |
  move  r7,r0                               ; $0AD10D |
  hib                                       ; $0AD10F |
  and   r8                                  ; $0AD110 |
  ibt   r8,#$0072                           ; $0AD111 |
  sub   r8                                  ; $0AD113 |
  sub   #15                                 ; $0AD114 |
  bcs CODE_0AD128                           ; $0AD116 |
  to r8                                     ; $0AD118 |
  ibt   r8,#$0011                           ; $0AD119 |
  add   r8                                  ; $0AD11B |
  lm    r8,($1E08)                          ; $0AD11C |
  and   r8                                  ; $0AD120 |
  beq CODE_0AD128                           ; $0AD121 |
  to r8                                     ; $0AD123 |
  with r7                                   ; $0AD124 |
  or    #2                                  ; $0AD125 |
  to r8                                     ; $0AD127 |

CODE_0AD128:
  getb                                      ; $0AD128 |
  move  r0,r7                               ; $0AD129 |
  move  r14,r5                              ; $0AD12B |
  jmp   r11                                 ; $0AD12D |
  nop                                       ; $0AD12E |

CODE_0AD12F:
  ibt   r6,#$0001                           ; $0AD12F |
  bra CODE_0AD0F7                           ; $0AD131 |
  sub   r0                                  ; $0AD133 |

  lm    r0,($0094)                          ; $0AD134 |
  bic   #7                                  ; $0AD138 |
  from r8                                   ; $0AD13A |
  sub   r0                                  ; $0AD13B |
  bpl CODE_0AD140                           ; $0AD13C |
  lsr                                       ; $0AD13E |
  sub   r0                                  ; $0AD13F |

CODE_0AD140:
  lsr                                       ; $0AD140 |
  ibt   r5,#$0042                           ; $0AD141 |
  sub   r5                                  ; $0AD143 |
  bcc CODE_0AD149                           ; $0AD144 |
  add   r5                                  ; $0AD146 |
  ibt   r0,#$0040                           ; $0AD147 |

CODE_0AD149:
  lsr                                       ; $0AD149 |
  bne CODE_0AD154                           ; $0AD14A |
  add   r0                                  ; $0AD14C |
  lm    r0,($1EF0)                          ; $0AD14D |
  bra CODE_0AD159+1                         ; $0AD151 |
  db $F5                                    ; $0AD153 | iwt r5,#$xxxx

CODE_0AD154:
  iwt   r5,#$1F30                           ; $0AD154 |
  add   r5                                  ; $0AD157 |
  ldw   (r0)                                ; $0AD158 |

CODE_0AD159:
  iwt   r5,#$1FFF                           ; $0AD159 |
  and   r5                                  ; $0AD15C |
  lm    r5,($009C)                          ; $0AD15D |
  sub   r5                                  ; $0AD161 |
  add   r0                                  ; $0AD162 |
  to r7                                     ; $0AD163 |
  add   r7                                  ; $0AD164 |
  iwt   r15,#$D0A2                          ; $0AD165 |
  lms   r11,($0060)                         ; $0AD168 |
  iwt   r0,#$11E2                           ; $0AD16B |
  add   r1                                  ; $0AD16E |
  ldw   (r0)                                ; $0AD16F |
  xor   r3                                  ; $0AD170 |
  bmi CODE_0AD177                           ; $0AD172 |
  nop                                       ; $0AD174 |
  jmp   r11                                 ; $0AD175 |
  nop                                       ; $0AD176 |

CODE_0AD177:
  moves r3,r3                               ; $0AD177 |
  bmi CODE_0AD17F                           ; $0AD179 |
  sub   r0                                  ; $0AD17B |
  iwt   r0,#$0080                           ; $0AD17C |

CODE_0AD17F:
  sms   ($0010),r0                          ; $0AD17F |
  from r9                                   ; $0AD182 |
  to r8                                     ; $0AD183 |
  add   #8                                  ; $0AD184 |
  iwt   r6,#$0F00                           ; $0AD186 |
  iwt   r5,#$0040                           ; $0AD189 |
  from r1                                   ; $0AD18C |
  to r5                                     ; $0AD18D |
  sub   r5                                  ; $0AD18E |
  iwt   r0,#$1A36                           ; $0AD18F |
  add   r5                                  ; $0AD192 |
  ldw   (r0)                                ; $0AD193 |
  lsr                                       ; $0AD194 |
  lsr                                       ; $0AD195 |
  lsr                                       ; $0AD196 |
  fmult                                     ; $0AD197 |
  add   r10                                 ; $0AD198 |
  add   #8                                  ; $0AD199 |
  link  #4                                  ; $0AD19B |
  iwt   r15,#$D096                          ; $0AD19C |
  alt1                                      ; $0AD19F |
  bra CODE_0AD1C7                           ; $0AD1A0 |
  nop                                       ; $0AD1A2 |

  ibt   r11,#$0030                          ; $0AD1A3 |
  iwt   r0,#$11E2                           ; $0AD1A5 |
  add   r1                                  ; $0AD1A8 |
  ldw   (r0)                                ; $0AD1A9 |
  xor   r3                                  ; $0AD1AA |
  bmi CODE_0AD1B7                           ; $0AD1AC |
  nop                                       ; $0AD1AE |
  inc   r14                                 ; $0AD1AF |
  inc   r14                                 ; $0AD1B0 |
  ibt   r7,#$0000                           ; $0AD1B1 |
  jmp   r11                                 ; $0AD1B3 |
  nop                                       ; $0AD1B4 |
  ibt   r11,#$0030                          ; $0AD1B5 |

CODE_0AD1B7:
  moves r3,r3                               ; $0AD1B7 |
  bmi CODE_0AD1BF                           ; $0AD1B9 |
  sub   r0                                  ; $0AD1BB |
  iwt   r0,#$0080                           ; $0AD1BC |

CODE_0AD1BF:
  sms   ($0010),r0                          ; $0AD1BF |
  link  #4                                  ; $0AD1C2 |
  iwt   r15,#$D08D                          ; $0AD1C3 |
  alt3                                      ; $0AD1C6 |

CODE_0AD1C7:
  lms   r0,($0002)                          ; $0AD1C7 |
  to r4                                     ; $0AD1CA |
  and   #15                                 ; $0AD1CB |
  sms   ($0048),r4                          ; $0AD1CD |
  ibt   r5,#$0005                           ; $0AD1D0 |
  moves r3,r3                               ; $0AD1D2 |
  bpl CODE_0AD1D9                           ; $0AD1D4 |
  nop                                       ; $0AD1D6 |
  ibt   r5,#$0004                           ; $0AD1D7 |

CODE_0AD1D9:
  from r7                                   ; $0AD1D9 |
  and   r5                                  ; $0AD1DA |
  sub   r5                                  ; $0AD1DB |
  sms   ($0040),r0                          ; $0AD1DC |
  beq CODE_0AD20B                           ; $0AD1DF |
  nop                                       ; $0AD1E1 |
  sms   ($0004),r6                          ; $0AD1E2 |
  sms   ($0006),r7                          ; $0AD1E5 |
  sms   ($0008),r8                          ; $0AD1E8 |
  lms   r8,($0000)                          ; $0AD1EB |
  sms   ($000A),r8                          ; $0AD1EE |
  lms   r7,($0002)                          ; $0AD1F1 |
  sms   ($000C),r7                          ; $0AD1F4 |
  sms   ($000E),r5                          ; $0AD1F7 |
  from r3                                   ; $0AD1FA |
  add   r7                                  ; $0AD1FB |
  link  #4                                  ; $0AD1FC |
  iwt   r15,#$D096                          ; $0AD1FD |
  alt1                                      ; $0AD200 |

  lms   r5,($000E)                          ; $0AD201 |
  and   r5                                  ; $0AD204 |
  sub   r5                                  ; $0AD205 |
  bne CODE_0AD26F                           ; $0AD206 |
  nop                                       ; $0AD208 |
  with r4                                   ; $0AD209 |
  sub   r3                                  ; $0AD20A |

CODE_0AD20B:
  sms   ($005C),r14                         ; $0AD20B |
  from r8                                   ; $0AD20E |
  swap                                      ; $0AD20F |
  moves r3,r3                               ; $0AD210 |
  bpl CODE_0AD217                           ; $0AD212 |
  lsr                                       ; $0AD214 |
  inc   r0                                  ; $0AD215 |
  inc   r0                                  ; $0AD216 |

CODE_0AD217:
  iwt   r14,#$BD0E                          ; $0AD217 |
  to r14                                    ; $0AD21A |
  add   r14                                 ; $0AD21B |
  lms   r0,($0000)                          ; $0AD21C |
  and   #15                                 ; $0AD21F |
  add   r0                                  ; $0AD221 |
  add   r0                                  ; $0AD222 |
  add   r0                                  ; $0AD223 |
  to r14                                    ; $0AD224 |
  add   r14                                 ; $0AD225 |
  to r5                                     ; $0AD226 |
  getb                                      ; $0AD227 |
  inc   r14                                 ; $0AD228 |
  getbs                                     ; $0AD229 |
  lms   r14,($005C)                         ; $0AD22B |
  sub   r4                                  ; $0AD22E |
  xor   r3                                  ; $0AD22F |
  bmi CODE_0AD267                           ; $0AD231 |
  to r4                                     ; $0AD233 |
  xor   r3                                  ; $0AD234 |
  inc   r4                                  ; $0AD236 |
  sms   ($0010),r5                          ; $0AD237 |
  moves r3,r3                               ; $0AD23A |
  bpl CODE_0AD295                           ; $0AD23C |
  from r4                                   ; $0AD23E |
  add   #10                                 ; $0AD23F |
  bmi CODE_0AD267                           ; $0AD241 |
  nop                                       ; $0AD243 |
  iwt   r0,#$11E2                           ; $0AD244 |
  add   r1                                  ; $0AD247 |
  ldw   (r0)                                ; $0AD248 |
  add   r0                                  ; $0AD249 |
  bcc CODE_0AD2B8                           ; $0AD24A |
  inc   r2                                  ; $0AD24C |
  iwt   r0,#$268E                           ; $0AD24D |
  add   r1                                  ; $0AD250 |
  ldw   (r0)                                ; $0AD251 |
  lob                                       ; $0AD252 |
  bne CODE_0AD266                           ; $0AD253 |
  nop                                       ; $0AD255 |
  iwt   r0,#$11E1                           ; $0AD256 |
  add   r1                                  ; $0AD259 |
  ldw   (r0)                                ; $0AD25A |
  xor   r5                                  ; $0AD25B |
  sex                                       ; $0AD25D |
  bmi CODE_0AD266                           ; $0AD25E |
  sub   r0                                  ; $0AD260 |
  sms   ($0010),r0                          ; $0AD261 |
  with r10                                  ; $0AD264 |
  add   r4                                  ; $0AD265 |

CODE_0AD266:
  dec   r2                                  ; $0AD266 |

CODE_0AD267:
  lms   r0,($0040)                          ; $0AD267 |
  sub   #0                                  ; $0AD26A |
  beq CODE_0AD2B1                           ; $0AD26C |
  nop                                       ; $0AD26E |

CODE_0AD26F:
  lms   r4,($0048)                          ; $0AD26F |
  lms   r6,($0004)                          ; $0AD272 |
  lms   r7,($0006)                          ; $0AD275 |
  lms   r8,($0008)                          ; $0AD278 |
  lms   r0,($000A)                          ; $0AD27B |
  sms   ($0000),r0                          ; $0AD27E |
  lms   r0,($000C)                          ; $0AD281 |
  sms   ($0002),r0                          ; $0AD284 |
  moves r3,r3                               ; $0AD287 |
  bmi CODE_0AD29A                           ; $0AD289 |
  from r7                                   ; $0AD28B |
  and   #2                                  ; $0AD28C |
  beq CODE_0AD2FB                           ; $0AD28E |
  nop                                       ; $0AD290 |
  ibt   r0,#$0010                           ; $0AD291 |
  to r4                                     ; $0AD293 |
  sub   r4                                  ; $0AD294 |

CODE_0AD295:
  with r10                                  ; $0AD295 |
  add   r4                                  ; $0AD296 |
  bra CODE_0AD2B3                           ; $0AD297 |
  inc   r2                                  ; $0AD299 |

CODE_0AD29A:
  and   #3                                  ; $0AD29A |
  beq CODE_0AD2B3                           ; $0AD29C |
  nop                                       ; $0AD29E |
  iwt   r0,#$11E2                           ; $0AD29F |
  add   r1                                  ; $0AD2A2 |
  ldw   (r0)                                ; $0AD2A3 |
  add   r0                                  ; $0AD2A4 |
  bcs CODE_0AD2B1                           ; $0AD2A5 |
  with r4                                   ; $0AD2A7 |
  not                                       ; $0AD2A8 |
  inc   r4                                  ; $0AD2A9 |
  from r4                                   ; $0AD2AA |
  add   #10                                 ; $0AD2AB |
  bpl CODE_0AD2B8                           ; $0AD2AD |
  inc   r2                                  ; $0AD2AF |
  dec   r2                                  ; $0AD2B0 |

CODE_0AD2B1:
  ibt   r4,#$0020                           ; $0AD2B1 |

CODE_0AD2B3:
  lms   r11,($0060)                         ; $0AD2B3 |
  jmp   r11                                 ; $0AD2B6 |
  nop                                       ; $0AD2B7 |

CODE_0AD2B8:
  iwt   r0,#$F800                           ; $0AD2B8 |
  and   r7                                  ; $0AD2BB |
  iwt   r5,#$9800                           ; $0AD2BC |
  sub   r5                                  ; $0AD2BF |
  bne CODE_0AD2F6                           ; $0AD2C0 |
  nop                                       ; $0AD2C2 |
  lms   r0,($0010)                          ; $0AD2C3 |
  swap                                      ; $0AD2C6 |
  beq CODE_0AD2D3                           ; $0AD2C7 |
  nop                                       ; $0AD2C9 |
  ibt   r5,#$FFD0                           ; $0AD2CA |
  bpl CODE_0AD2E4                           ; $0AD2CC |
  with r5                                   ; $0AD2CE |
  not                                       ; $0AD2CF |
  bra CODE_0AD2E4                           ; $0AD2D0 |
  inc   r5                                  ; $0AD2D2 |

CODE_0AD2D3:
  from r6                                   ; $0AD2D3 |
  hib                                       ; $0AD2D4 |
  iwt   r5,#$0082                           ; $0AD2D5 |
  sub   r5                                  ; $0AD2D8 |
  bmi CODE_0AD2EB                           ; $0AD2D9 |
  nop                                       ; $0AD2DB |
  iwt   r5,#$0FF0                           ; $0AD2DC |
  beq CODE_0AD2E4                           ; $0AD2DF |
  with r5                                   ; $0AD2E1 |
  not                                       ; $0AD2E2 |
  inc   r5                                  ; $0AD2E3 |

CODE_0AD2E4:
  iwt   r0,#$0EC3                           ; $0AD2E4 |
  add   r1                                  ; $0AD2E7 |
  from r5                                   ; $0AD2E8 |
  stb   (r0)                                ; $0AD2E9 |

CODE_0AD2EB:
  iwt   r0,#$1781                           ; $0AD2EB |
  add   r1                                  ; $0AD2EE |
  ldb   (r0)                                ; $0AD2EF |
  sub   #0                                  ; $0AD2F1 |
  beq CODE_0AD312                           ; $0AD2F3 |
  nop                                       ; $0AD2F5 |

CODE_0AD2F6:
  lms   r11,($0060)                         ; $0AD2F6 |
  jmp   r11                                 ; $0AD2F9 |
  nop                                       ; $0AD2FA |

CODE_0AD2FB:
  iwt   r0,#$F800                           ; $0AD2FB |
  and   r7                                  ; $0AD2FE |
  iwt   r5,#$9800                           ; $0AD2FF |
  sub   r5                                  ; $0AD302 |
  bne CODE_0AD2F6                           ; $0AD303 |
  from r1                                   ; $0AD305 |
  lsr                                       ; $0AD306 |
  lsr                                       ; $0AD307 |
  lm    r5,($1974)                          ; $0AD308 |
  add   r5                                  ; $0AD30C |
  and   #7                                  ; $0AD30D |
  beq CODE_0AD2F6                           ; $0AD30F |
  nop                                       ; $0AD311 |

CODE_0AD312:
  sms   ($0048),r4                          ; $0AD312 |
  ibt   r5,#$0008                           ; $0AD315 |
  iwt   r0,#$1781                           ; $0AD317 |
  add   r1                                  ; $0AD31A |
  from r5                                   ; $0AD31B |
  stb   (r0)                                ; $0AD31C |
  ibt   r0,#$0037                           ; $0AD31E |
  sms   ($007A),r0                          ; $0AD320 |
  iwt   r5,#$0201                           ; $0AD323 |
  link  #4                                  ; $0AD326 |
  iwt   r15,#$DFE3                          ; $0AD327 |
  nop                                       ; $0AD32A |
  iwt   r0,#$10A2                           ; $0AD32B |
  add   r4                                  ; $0AD32E |
  from r9                                   ; $0AD32F |
  stw   (r0)                                ; $0AD330 |
  lms   r5,($0002)                          ; $0AD331 |
  iwt   r0,#$1142                           ; $0AD334 |
  add   r4                                  ; $0AD337 |
  from r5                                   ; $0AD338 |
  stw   (r0)                                ; $0AD339 |
  ibt   r5,#$0005                           ; $0AD33A |
  iwt   r0,#$13C2                           ; $0AD33C |
  add   r4                                  ; $0AD33F |
  from r5                                   ; $0AD340 |
  stw   (r0)                                ; $0AD341 |
  ibt   r5,#$0002                           ; $0AD342 |
  iwt   r0,#$1782                           ; $0AD344 |
  add   r4                                  ; $0AD347 |
  from r5                                   ; $0AD348 |
  stw   (r0)                                ; $0AD349 |
  lms   r4,($0048)                          ; $0AD34A |
  lms   r11,($0060)                         ; $0AD34D |
  jmp   r11                                 ; $0AD350 |
  nop                                       ; $0AD351 |

  to r3                                     ; $0AD352 |
  link  #4                                  ; $0AD353 |
  iwt   r15,#$D08D                          ; $0AD354 |
  alt3                                      ; $0AD357 |

  and   #2                                  ; $0AD358 |
  beq CODE_0AD35E                           ; $0AD35A |
  nop                                       ; $0AD35C |
  inc   r2                                  ; $0AD35D |

CODE_0AD35E:
  move  r11,r3                              ; $0AD35E |
  jmp   r11                                 ; $0AD360 |
  nop                                       ; $0AD361 |

  to r3                                     ; $0AD362 |
  link  #4                                  ; $0AD363 |
  iwt   r15,#$D08D                          ; $0AD364 |
  alt3                                      ; $0AD367 |

  and   #3                                  ; $0AD368 |
  beq CODE_0AD36E                           ; $0AD36A |
  nop                                       ; $0AD36C |
  inc   r2                                  ; $0AD36D |

CODE_0AD36E:
  move  r11,r3                              ; $0AD36E |
  jmp   r11                                 ; $0AD370 |
  nop                                       ; $0AD371 |

  to r3                                     ; $0AD372 |
  link  #4                                  ; $0AD373 |
  iwt   r15,#$D08D                          ; $0AD374 |
  alt3                                      ; $0AD377 |

  and   #2                                  ; $0AD378 |
  beq CODE_0AD37E                           ; $0AD37A |
  nop                                       ; $0AD37C |
  inc   r2                                  ; $0AD37D |

CODE_0AD37E:
  link  #4                                  ; $0AD37E |
  iwt   r15,#$D401                          ; $0AD37F |
  ibt   r0,#$0023                           ; $0AD382 |
  to r11                                    ; $0AD384 |
  jmp   r11                                 ; $0AD385 |
  nop                                       ; $0AD386 |

  ibt   r11,#$0030                          ; $0AD387 |
  iwt   r6,#$0F00                           ; $0AD389 |
  iwt   r5,#$0040                           ; $0AD38C |
  from r1                                   ; $0AD38F |
  to r5                                     ; $0AD390 |
  sub   r5                                  ; $0AD391 |
  iwt   r0,#$1A36                           ; $0AD392 |
  add   r5                                  ; $0AD395 |
  ldw   (r0)                                ; $0AD396 |
  lsr                                       ; $0AD397 |
  lsr                                       ; $0AD398 |
  lsr                                       ; $0AD399 |
  fmult                                     ; $0AD39A |
  moves r3,r3                               ; $0AD39B |
  bmi CODE_0AD3A2                           ; $0AD39D |
  nop                                       ; $0AD39F |
  not                                       ; $0AD3A0 |
  inc   r0                                  ; $0AD3A1 |

CODE_0AD3A2:
  add   r9                                  ; $0AD3A2 |
  to r8                                     ; $0AD3A3 |
  add   #8                                  ; $0AD3A4 |
  move  r0,r10                              ; $0AD3A6 |
  link  #4                                  ; $0AD3A8 |
  iwt   r15,#$D096                          ; $0AD3A9 |
  alt1                                      ; $0AD3AC |
  bra CODE_0AD3B7                           ; $0AD3AD |
  nop                                       ; $0AD3AF |

  ibt   r11,#$0030                          ; $0AD3B0 |
  link  #4                                  ; $0AD3B2 |
  iwt   r15,#$D08D                          ; $0AD3B3 |
  alt3                                      ; $0AD3B6 |

CODE_0AD3B7:
  and   #2                                  ; $0AD3B7 |
  beq CODE_0AD3FC                           ; $0AD3B9 |
  from r2                                   ; $0AD3BB |
  and   #2                                  ; $0AD3BC |
  bne CODE_0AD3FC                           ; $0AD3BE |
  with r9                                   ; $0AD3C0 |
  add   r3                                  ; $0AD3C1 |
  iwt   r0,#$11E0                           ; $0AD3C2 |
  to r4                                     ; $0AD3C5 |
  add   r1                                  ; $0AD3C6 |
  iwt   r0,#$0F62                           ; $0AD3C7 |
  add   r1                                  ; $0AD3CA |
  to r5                                     ; $0AD3CB |
  ldw   (r0)                                ; $0AD3CC |
  iwt   r0,#$00C0                           ; $0AD3CD |
  and   r5                                  ; $0AD3D0 |
  beq CODE_0AD3FC                           ; $0AD3D1 |
  inc   r2                                  ; $0AD3D3 |
  swap                                      ; $0AD3D4 |
  bmi CODE_0AD3FB                           ; $0AD3D5 |
  sub   r0                                  ; $0AD3D7 |
  ldw   (r4)                                ; $0AD3D8 |
  to r11                                    ; $0AD3D9 |
  xor   r3                                  ; $0AD3DA |
  bpl CODE_0AD3FC                           ; $0AD3DC |
  not                                       ; $0AD3DE |
  with r5                                   ; $0AD3DF |
  swap                                      ; $0AD3E0 |
  with r5                                   ; $0AD3E1 |
  and   #4                                  ; $0AD3E2 |
  beq CODE_0AD3E8                           ; $0AD3E4 |
  inc   r0                                  ; $0AD3E6 |
  sub   r0                                  ; $0AD3E7 |

CODE_0AD3E8:
  sbk                                       ; $0AD3E8 |
  iwt   r0,#$13C0                           ; $0AD3E9 |
  add   r1                                  ; $0AD3EC |
  ldw   (r0)                                ; $0AD3ED |
  xor   #2                                  ; $0AD3EE |
  sbk                                       ; $0AD3F0 |
  iwt   r0,#$15A0                           ; $0AD3F1 |
  add   r1                                  ; $0AD3F4 |
  ldw   (r0)                                ; $0AD3F5 |
  not                                       ; $0AD3F6 |
  inc   r0                                  ; $0AD3F7 |
  bra CODE_0AD3FC                           ; $0AD3F8 |
  sbk                                       ; $0AD3FA |

CODE_0AD3FB:
  stw   (r4)                                ; $0AD3FB |

CODE_0AD3FC:
  lms   r11,($0060)                         ; $0AD3FC |
  jmp   r11                                 ; $0AD3FF |
  nop                                       ; $0AD400 |

  to r8                                     ; $0AD401 |
  and   r7                                  ; $0AD402 |
  bne CODE_0AD412                           ; $0AD403 |
  nop                                       ; $0AD405 |
  lms   r0,($0002)                          ; $0AD406 |
  lms   r5,($01BC)                          ; $0AD409 |
  sub   r5                                  ; $0AD40C |
  bmi CODE_0AD412                           ; $0AD40D |
  sub   r0                                  ; $0AD40F |
  ibt   r0,#$0008                           ; $0AD410 |

CODE_0AD412:
  move  r5,r0                               ; $0AD412 |
  iwt   r0,#$1822                           ; $0AD414 |
  add   r1                                  ; $0AD417 |
  ldb   (r0)                                ; $0AD418 |
  sub   r5                                  ; $0AD41A |
  bne CODE_0AD46E                           ; $0AD41B |
  add   r5                                  ; $0AD41D |
  beq CODE_0AD46C                           ; $0AD41E |
  nop                                       ; $0AD420 |
  lm    r5,($1974)                          ; $0AD421 |
  ibt   r0,#$007F                           ; $0AD425 |
  to r5                                     ; $0AD427 |
  and   r5                                  ; $0AD428 |
  and   r1                                  ; $0AD429 |
  sub   r5                                  ; $0AD42A |
  bne CODE_0AD46C                           ; $0AD42B |
  nop                                       ; $0AD42D |
  ibt   r0,#$0010                           ; $0AD42E |
  and   r7                                  ; $0AD430 |
  bne CODE_0AD46C                           ; $0AD431 |
  nop                                       ; $0AD433 |
  sms   ($0060),r11                         ; $0AD434 |
  iwt   r5,#$01BC                           ; $0AD437 |
  link  #4                                  ; $0AD43A |
  iwt   r15,#$DFE3                          ; $0AD43B |
  nop                                       ; $0AD43E |
  lms   r0,($0000)                          ; $0AD43F |
  to r5                                     ; $0AD442 |
  sub   #8                                  ; $0AD443 |
  iwt   r0,#$10A2                           ; $0AD445 |
  add   r4                                  ; $0AD448 |
  from r5                                   ; $0AD449 |
  stw   (r0)                                ; $0AD44A |
  lms   r0,($0002)                          ; $0AD44B |
  to r5                                     ; $0AD44E |
  sub   #8                                  ; $0AD44F |
  iwt   r0,#$1142                           ; $0AD451 |
  add   r4                                  ; $0AD454 |
  from r5                                   ; $0AD455 |
  stw   (r0)                                ; $0AD456 |
  lm    r5,($1970)                          ; $0AD457 |
  iwt   r0,#$1E4C                           ; $0AD45B |
  add   r4                                  ; $0AD45E |
  from r5                                   ; $0AD45F |
  stw   (r0)                                ; $0AD460 |
  ibt   r5,#$FFFF                           ; $0AD461 |
  iwt   r0,#$1782                           ; $0AD463 |
  add   r4                                  ; $0AD466 |
  from r5                                   ; $0AD467 |
  stw   (r0)                                ; $0AD468 |
  lms   r11,($0060)                         ; $0AD469 |

CODE_0AD46C:
  jmp   r11                                 ; $0AD46C |
  nop                                       ; $0AD46D |

CODE_0AD46E:
  move  r4,r0                               ; $0AD46E |
  iwt   r0,#$1822                           ; $0AD470 |
  add   r1                                  ; $0AD473 |
  from r5                                   ; $0AD474 |
  stb   (r0)                                ; $0AD475 |
  from r4                                   ; $0AD477 |
  swap                                      ; $0AD478 |
  bmi CODE_0AD4C4                           ; $0AD479 |
  from r7                                   ; $0AD47B |
  and   #2                                  ; $0AD47C |
  bne CODE_0AD4C4                           ; $0AD47E |
  from r4                                   ; $0AD480 |
  or    r7                                  ; $0AD481 |
  ibt   r4,#$0010                           ; $0AD482 |
  and   r4                                  ; $0AD484 |
  bne CODE_0AD4C6                           ; $0AD485 |
  sms   ($0060),r11                         ; $0AD487 |
  ibt   r0,#$005F                           ; $0AD48A |
  sms   ($007A),r0                          ; $0AD48C |
  iwt   r5,#$01BA                           ; $0AD48F |
  link  #4                                  ; $0AD492 |
  iwt   r15,#$DFE3                          ; $0AD493 |
  nop                                       ; $0AD496 |
  lms   r0,($0000)                          ; $0AD497 |
  to r5                                     ; $0AD49A |
  sub   #8                                  ; $0AD49B |
  iwt   r0,#$10A2                           ; $0AD49D |
  add   r4                                  ; $0AD4A0 |
  from r5                                   ; $0AD4A1 |
  stw   (r0)                                ; $0AD4A2 |
  lms   r0,($0002)                          ; $0AD4A3 |
  sub   #8                                  ; $0AD4A6 |
  to r5                                     ; $0AD4A8 |
  bic   #15                                 ; $0AD4A9 |
  iwt   r0,#$1142                           ; $0AD4AB |
  add   r4                                  ; $0AD4AE |
  from r5                                   ; $0AD4AF |
  stw   (r0)                                ; $0AD4B0 |
  ibt   r5,#$001A                           ; $0AD4B1 |
  iwt   r0,#$1E4C                           ; $0AD4B3 |
  add   r4                                  ; $0AD4B6 |
  from r5                                   ; $0AD4B7 |
  stw   (r0)                                ; $0AD4B8 |
  ibt   r5,#$0003                           ; $0AD4B9 |
  iwt   r0,#$1782                           ; $0AD4BB |
  add   r4                                  ; $0AD4BE |
  from r5                                   ; $0AD4BF |
  stw   (r0)                                ; $0AD4C0 |
  lms   r11,($0060)                         ; $0AD4C1 |

CODE_0AD4C4:
  jmp   r11                                 ; $0AD4C4 |
  nop                                       ; $0AD4C5 |

CODE_0AD4C6:
  sms   ($0060),r11                         ; $0AD4C6 |
  iwt   r5,#$01C7                           ; $0AD4C9 |
  link  #4                                  ; $0AD4CC |
  iwt   r15,#$DFE3                          ; $0AD4CD |
  nop                                       ; $0AD4D0 |
  iwt   r0,#$1140                           ; $0AD4D1 |
  add   r4                                  ; $0AD4D4 |
  ldb   (r0)                                ; $0AD4D5 |
  lob                                       ; $0AD4D7 |
  bne CODE_0AD4EC                           ; $0AD4D8 |
  to r5                                     ; $0AD4DA |
  sub   r0                                  ; $0AD4DB |
  iwt   r0,#$0EC0                           ; $0AD4DC |
  add   r4                                  ; $0AD4DF |
  from r5                                   ; $0AD4E0 |
  stw   (r0)                                ; $0AD4E1 |
  dec   r5                                  ; $0AD4E2 |
  iwt   r0,#$1462                           ; $0AD4E3 |
  add   r4                                  ; $0AD4E6 |
  from r5                                   ; $0AD4E7 |
  stw   (r0)                                ; $0AD4E8 |
  bra CODE_0AD517                           ; $0AD4E9 |
  nop                                       ; $0AD4EB |

CODE_0AD4EC:
  lms   r0,($0000)                          ; $0AD4EC |
  to r5                                     ; $0AD4EF |
  sub   #8                                  ; $0AD4F0 |
  iwt   r0,#$10A2                           ; $0AD4F2 |
  add   r4                                  ; $0AD4F5 |
  from r5                                   ; $0AD4F6 |
  stw   (r0)                                ; $0AD4F7 |
  lms   r0,($0002)                          ; $0AD4F8 |
  sub   #8                                  ; $0AD4FB |
  to r5                                     ; $0AD4FD |
  bic   #15                                 ; $0AD4FE |
  iwt   r0,#$1142                           ; $0AD500 |
  add   r4                                  ; $0AD503 |
  from r5                                   ; $0AD504 |
  stw   (r0)                                ; $0AD505 |
  iwt   r5,#$FF40                           ; $0AD506 |
  iwt   r0,#$1E4C                           ; $0AD509 |
  add   r4                                  ; $0AD50C |
  from r5                                   ; $0AD50D |
  stw   (r0)                                ; $0AD50E |
  ibt   r5,#$0030                           ; $0AD50F |
  iwt   r0,#$1782                           ; $0AD511 |
  add   r4                                  ; $0AD514 |
  from r5                                   ; $0AD515 |
  stw   (r0)                                ; $0AD516 |

CODE_0AD517:
  lms   r11,($0060)                         ; $0AD517 |
  jmp   r11                                 ; $0AD51A |
  nop                                       ; $0AD51B |

  link  #4                                  ; $0AD51C |
  iwt   r15,#$D372                          ; $0AD51D |
  with r11                                  ; $0AD520 |
  with r2                                   ; $0AD521 |
  add   r2                                  ; $0AD522 |
  with r2                                   ; $0AD523 |
  add   r2                                  ; $0AD524 |
  iwt   r0,#$11E0                           ; $0AD525 |
  add   r1                                  ; $0AD528 |
  ldw   (r0)                                ; $0AD529 |
  dec   r0                                  ; $0AD52A |
  bpl CODE_0AD545                           ; $0AD52B |
  nop                                       ; $0AD52D |
  ibt   r3,#$0001                           ; $0AD52E |
  link  #4                                  ; $0AD530 |
  iwt   r15,#$D3B0                          ; $0AD531 |
  sm    ($11E0),r0                          ; $0AD534 |
  add   r1                                  ; $0AD538 |
  ldw   (r0)                                ; $0AD539 |
  sub   #0                                  ; $0AD53A |
  beq CODE_0AD548                           ; $0AD53C |
  with r2                                   ; $0AD53E |
  add   r2                                  ; $0AD53F |
  inc   r14                                 ; $0AD540 |
  inc   r14                                 ; $0AD541 |
  bra CODE_0AD551                           ; $0AD542 |
  with r2                                   ; $0AD544 |

CODE_0AD545:
  inc   r14                                 ; $0AD545 |
  inc   r14                                 ; $0AD546 |
  with r2                                   ; $0AD547 |

CODE_0AD548:
  add   r2                                  ; $0AD548 |
  ibt   r3,#$FFFF                           ; $0AD549 |
  link  #4                                  ; $0AD54B |
  iwt   r15,#$D3B0                          ; $0AD54C |
  alt2                                      ; $0AD54F |

  with r2                                   ; $0AD550 |

CODE_0AD551:
  add   r2                                  ; $0AD551 |
  ibt   r3,#$0010                           ; $0AD552 |
  link  #4                                  ; $0AD554 |
  iwt   r15,#$D1A3                          ; $0AD555 |
  alt2                                      ; $0AD558 |

  from r2                                   ; $0AD559 |
  lsr                                       ; $0AD55A |
  bcc CODE_0AD566                           ; $0AD55B |
  nop                                       ; $0AD55D |
  inc   r10                                 ; $0AD55E |
  iwt   r0,#$11E2                           ; $0AD55F |
  to r4                                     ; $0AD562 |
  add   r1                                  ; $0AD563 |
  sub   r0                                  ; $0AD564 |
  stw   (r4)                                ; $0AD565 |

CODE_0AD566:
  with r2                                   ; $0AD566 |
  add   r2                                  ; $0AD567 |
  ibt   r3,#$FFF0                           ; $0AD568 |
  link  #4                                  ; $0AD56A |
  iwt   r15,#$D1B5                          ; $0AD56B |
  alt2                                      ; $0AD56E |

  from r2                                   ; $0AD56F |
  lsr                                       ; $0AD570 |
  bcs CODE_0AD5C4                           ; $0AD571 |
  nop                                       ; $0AD573 |
  iwt   r0,#$1820                           ; $0AD574 |
  add   r1                                  ; $0AD577 |
  ldw   (r0)                                ; $0AD578 |
  lsr                                       ; $0AD579 |
  bcc CODE_0AD5FB                           ; $0AD57A |
  nop                                       ; $0AD57C |
  iwt   r0,#$0F63                           ; $0AD57D |
  add   r1                                  ; $0AD580 |
  to r6                                     ; $0AD581 |
  ldb   (r0)                                ; $0AD582 |
  from r6                                   ; $0AD584 |
  and   #3                                  ; $0AD585 |
  beq CODE_0AD5FB                           ; $0AD587 |
  lsr                                       ; $0AD589 |
  iwt   r5,#$11E0                           ; $0AD58A |
  with r5                                   ; $0AD58D |
  add   r1                                  ; $0AD58E |
  to r5                                     ; $0AD58F |
  ldw   (r5)                                ; $0AD590 |
  with r5                                   ; $0AD591 |
  not                                       ; $0AD592 |
  lsr                                       ; $0AD593 |
  bcs CODE_0AD5B7                           ; $0AD594 |
  inc   r5                                  ; $0AD596 |
  from r6                                   ; $0AD597 |
  and   #4                                  ; $0AD598 |
  bne CODE_0AD59E                           ; $0AD59A |
  sub   r0                                  ; $0AD59C |
  from r5                                   ; $0AD59D |

CODE_0AD59E:
  sbk                                       ; $0AD59E |
  ibt   r6,#$0000                           ; $0AD59F |
  iwt   r0,#$10A1                           ; $0AD5A1 |
  add   r1                                  ; $0AD5A4 |
  from r6                                   ; $0AD5A5 |
  stb   (r0)                                ; $0AD5A6 |
  iwt   r0,#$13C0                           ; $0AD5A8 |
  add   r1                                  ; $0AD5AB |
  ldw   (r0)                                ; $0AD5AC |
  xor   #2                                  ; $0AD5AD |
  sbk                                       ; $0AD5AF |
  iwt   r0,#$15A0                           ; $0AD5B0 |
  add   r1                                  ; $0AD5B3 |
  ldw   (r0)                                ; $0AD5B4 |
  not                                       ; $0AD5B5 |
  inc   r0                                  ; $0AD5B6 |

CODE_0AD5B7:
  sbk                                       ; $0AD5B7 |
  iwt   r0,#$272E                           ; $0AD5B8 |
  add   r1                                  ; $0AD5BB |
  to r9                                     ; $0AD5BC |
  ldw   (r0)                                ; $0AD5BD |
  inc   r0                                  ; $0AD5BE |
  inc   r0                                  ; $0AD5BF |
  to r10                                    ; $0AD5C0 |
  bra CODE_0AD5D9                           ; $0AD5C1 |
  ldw   (r0)                                ; $0AD5C3 |

CODE_0AD5C4:
  with r10                                  ; $0AD5C4 |
  add   r4                                  ; $0AD5C5 |
  ibt   r6,#$FFFF                           ; $0AD5C6 |
  iwt   r0,#$1141                           ; $0AD5C8 |
  add   r1                                  ; $0AD5CB |
  from r6                                   ; $0AD5CC |
  stb   (r0)                                ; $0AD5CD |
  iwt   r0,#$272E                           ; $0AD5CF |
  add   r1                                  ; $0AD5D2 |
  from r9                                   ; $0AD5D3 |
  stw   (r0)                                ; $0AD5D4 |
  inc   r0                                  ; $0AD5D5 |
  inc   r0                                  ; $0AD5D6 |
  from r10                                  ; $0AD5D7 |
  stw   (r0)                                ; $0AD5D8 |

CODE_0AD5D9:
  lms   r6,($0010)                          ; $0AD5D9 |
  iwt   r0,#$0EC2                           ; $0AD5DC |
  add   r1                                  ; $0AD5DF |
  from r6                                   ; $0AD5E0 |
  stb   (r0)                                ; $0AD5E1 |
  sub   r0                                  ; $0AD5E3 |
  sms   ($0010),r0                          ; $0AD5E4 |
  iwt   r0,#$0F62                           ; $0AD5E7 |
  add   r1                                  ; $0AD5EA |
  ldw   (r0)                                ; $0AD5EB |
  ibt   r6,#$0020                           ; $0AD5EC |
  and   r6                                  ; $0AD5EE |
  bne CODE_0AD5FB                           ; $0AD5EF |
  nop                                       ; $0AD5F1 |
  iwt   r0,#$11E2                           ; $0AD5F2 |
  to r4                                     ; $0AD5F5 |
  add   r1                                  ; $0AD5F6 |
  iwt   r0,#$0100                           ; $0AD5F7 |
  stw   (r4)                                ; $0AD5FA |

CODE_0AD5FB:
  lms   r5,($0010)                          ; $0AD5FB |
  iwt   r0,#$268E                           ; $0AD5FE |
  add   r1                                  ; $0AD601 |
  from r5                                   ; $0AD602 |
  stw   (r0)                                ; $0AD603 |
  iwt   r0,#$10A2                           ; $0AD604 |
  add   r1                                  ; $0AD607 |
  from r9                                   ; $0AD608 |
  stw   (r0)                                ; $0AD609 |
  iwt   r0,#$16E0                           ; $0AD60A |
  add   r1                                  ; $0AD60D |
  ldw   (r0)                                ; $0AD60E |
  with r10                                  ; $0AD60F |
  sub   r0                                  ; $0AD610 |
  iwt   r0,#$1142                           ; $0AD611 |
  add   r1                                  ; $0AD614 |
  from r10                                  ; $0AD615 |
  stw   (r0)                                ; $0AD616 |
  iwt   r15,#$D07F                          ; $0AD617 |
  inc   r1                                  ; $0AD61A |
  link  #4                                  ; $0AD61B |
  iwt   r15,#$D372                          ; $0AD61C |
  with r11                                  ; $0AD61F |
  with r2                                   ; $0AD620 |
  add   r2                                  ; $0AD621 |
  with r2                                   ; $0AD622 |
  add   r2                                  ; $0AD623 |
  link  #4                                  ; $0AD624 |
  iwt   r15,#$D352                          ; $0AD625 |
  with r11                                  ; $0AD628 |
  with r2                                   ; $0AD629 |
  add   r2                                  ; $0AD62A |
  link  #4                                  ; $0AD62B |
  iwt   r15,#$D352                          ; $0AD62C |
  with r11                                  ; $0AD62F |
  with r2                                   ; $0AD630 |
  add   r2                                  ; $0AD631 |
  link  #4                                  ; $0AD632 |
  iwt   r15,#$D352                          ; $0AD633 |
  with r11                                  ; $0AD636 |
  with r2                                   ; $0AD637 |
  add   r2                                  ; $0AD638 |
  link  #4                                  ; $0AD639 |
  iwt   r15,#$D352                          ; $0AD63A |
  with r11                                  ; $0AD63D |
  iwt   r15,#$D07F                          ; $0AD63E |
  inc   r1                                  ; $0AD641 |
  link  #4                                  ; $0AD642 |
  iwt   r15,#$D372                          ; $0AD643 |
  with r11                                  ; $0AD646 |
  iwt   r15,#$D07F                          ; $0AD647 |
  inc   r1                                  ; $0AD64A |
  link  #4                                  ; $0AD64B |
  iwt   r15,#$D352                          ; $0AD64C |
  with r11                                  ; $0AD64F |
  with r2                                   ; $0AD650 |
  add   r2                                  ; $0AD651 |
  link  #4                                  ; $0AD652 |
  iwt   r15,#$D352                          ; $0AD653 |
  with r11                                  ; $0AD656 |
  with r2                                   ; $0AD657 |
  add   r2                                  ; $0AD658 |
  link  #4                                  ; $0AD659 |
  iwt   r15,#$D352                          ; $0AD65A |
  with r11                                  ; $0AD65D |
  with r2                                   ; $0AD65E |
  add   r2                                  ; $0AD65F |
  link  #4                                  ; $0AD660 |
  iwt   r15,#$D352                          ; $0AD661 |
  with r11                                  ; $0AD664 |
  iwt   r15,#$D07F                          ; $0AD665 |
  inc   r1                                  ; $0AD668 |
  link  #4                                  ; $0AD669 |
  iwt   r15,#$D352                          ; $0AD66A |
  with r11                                  ; $0AD66D |
  with r2                                   ; $0AD66E |
  add   r2                                  ; $0AD66F |
  link  #4                                  ; $0AD670 |
  iwt   r15,#$D352                          ; $0AD671 |
  with r11                                  ; $0AD674 |
  iwt   r15,#$D07F                          ; $0AD675 |
  inc   r1                                  ; $0AD678 |
  link  #4                                  ; $0AD679 |
  iwt   r15,#$D372                          ; $0AD67A |
  with r11                                  ; $0AD67D |
  link  #4                                  ; $0AD67E |
  iwt   r15,#$DD15                          ; $0AD67F |
  nop                                       ; $0AD682 |
  with r2                                   ; $0AD683 |
  add   r2                                  ; $0AD684 |
  with r2                                   ; $0AD685 |
  add   r2                                  ; $0AD686 |
  iwt   r0,#$11E0                           ; $0AD687 |
  add   r1                                  ; $0AD68A |
  ldw   (r0)                                ; $0AD68B |
  dec   r0                                  ; $0AD68C |
  bpl CODE_0AD6B3                           ; $0AD68D |
  nop                                       ; $0AD68F |
  ibt   r3,#$0010                           ; $0AD690 |
  link  #4                                  ; $0AD692 |
  iwt   r15,#$D80B                          ; $0AD693 |
  alt2                                      ; $0AD696 |
  link  #4                                  ; $0AD697 |
  iwt   r15,#$D90D                          ; $0AD698 |
  nop                                       ; $0AD69B |
  from r2                                   ; $0AD69C |
  lsr                                       ; $0AD69D |
  bcc CODE_0AD6A3                           ; $0AD69E |
  nop                                       ; $0AD6A0 |
  with r9                                   ; $0AD6A1 |
  add   r4                                  ; $0AD6A2 |

CODE_0AD6A3:
  iwt   r0,#$11E0                           ; $0AD6A3 |
  add   r1                                  ; $0AD6A6 |
  ldw   (r0)                                ; $0AD6A7 |
  sub   #0                                  ; $0AD6A8 |
  beq CODE_0AD6B6                           ; $0AD6AA |
  with r2                                   ; $0AD6AC |
  add   r2                                  ; $0AD6AD |
  inc   r14                                 ; $0AD6AE |
  inc   r14                                 ; $0AD6AF |
  bra CODE_0AD6CB                           ; $0AD6B0 |
  with r2                                   ; $0AD6B2 |

CODE_0AD6B3:
  inc   r14                                 ; $0AD6B3 |
  inc   r14                                 ; $0AD6B4 |
  with r2                                   ; $0AD6B5 |

CODE_0AD6B6:
  add   r2                                  ; $0AD6B6 |
  ibt   r3,#$FFF0                           ; $0AD6B7 |
  link  #4                                  ; $0AD6B9 |
  iwt   r15,#$D80B                          ; $0AD6BA |
  alt2                                      ; $0AD6BD |

  link  #4                                  ; $0AD6BE |
  iwt   r15,#$D90D                          ; $0AD6BF |
  nop                                       ; $0AD6C2 |

  from r2                                   ; $0AD6C3 |
  lsr                                       ; $0AD6C4 |
  bcc CODE_0AD6CA                           ; $0AD6C5 |
  nop                                       ; $0AD6C7 |
  with r9                                   ; $0AD6C8 |
  add   r4                                  ; $0AD6C9 |

CODE_0AD6CA:
  with r2                                   ; $0AD6CA |

CODE_0AD6CB:
  add   r2                                  ; $0AD6CB |
  ibt   r3,#$0010                           ; $0AD6CC |
  link  #4                                  ; $0AD6CE |
  iwt   r15,#$D1A3                          ; $0AD6CF |
  alt2                                      ; $0AD6D2 |

  link  #4                                  ; $0AD6D3 |
  iwt   r15,#$D912                          ; $0AD6D4 |
  nop                                       ; $0AD6D7 |

  from r2                                   ; $0AD6D8 |
  lsr                                       ; $0AD6D9 |
  bcc CODE_0AD6DF                           ; $0AD6DA |
  nop                                       ; $0AD6DC |
  with r10                                  ; $0AD6DD |
  add   r4                                  ; $0AD6DE |

CODE_0AD6DF:
  with r2                                   ; $0AD6DF |
  add   r2                                  ; $0AD6E0 |
  ibt   r3,#$FFF0                           ; $0AD6E1 |
  iwt   r0,#$1502                           ; $0AD6E3 |
  add   r1                                  ; $0AD6E6 |
  ldw   (r0)                                ; $0AD6E7 |
  ibt   r5,#$0040                           ; $0AD6E8 |
  sub   r5                                  ; $0AD6EA |
  bcs CODE_0AD6F7                           ; $0AD6EB |
  nop                                       ; $0AD6ED |
  iwt   r0,#$11E2                           ; $0AD6EE |
  add   r1                                  ; $0AD6F1 |
  ldw   (r0)                                ; $0AD6F2 |
  add   r0                                  ; $0AD6F3 |
  bcs CODE_0AD748                           ; $0AD6F4 |
  nop                                       ; $0AD6F6 |

CODE_0AD6F7:
  link  #4                                  ; $0AD6F7 |
  iwt   r15,#$D1B5                          ; $0AD6F8 |
  alt2                                      ; $0AD6FB |

  link  #4                                  ; $0AD6FC |
  iwt   r15,#$D912                          ; $0AD6FD |
  nop                                       ; $0AD700 |

  from r2                                   ; $0AD701 |
  lsr                                       ; $0AD702 |
  bcc CODE_0AD74C                           ; $0AD703 |
  nop                                       ; $0AD705 |
  with r10                                  ; $0AD706 |
  add   r4                                  ; $0AD707 |
  iwt   r0,#$1502                           ; $0AD708 |
  add   r1                                  ; $0AD70B |
  ldw   (r0)                                ; $0AD70C |
  ibt   r5,#$0040                           ; $0AD70D |
  sub   r5                                  ; $0AD70F |
  bcc CODE_0AD748                           ; $0AD710 |
  nop                                       ; $0AD712 |
  ibt   r6,#$FFFF                           ; $0AD713 |
  iwt   r0,#$1141                           ; $0AD715 |
  add   r1                                  ; $0AD718 |
  from r6                                   ; $0AD719 |
  stb   (r0)                                ; $0AD71A |
  iwt   r0,#$272E                           ; $0AD71C |
  add   r1                                  ; $0AD71F |
  from r9                                   ; $0AD720 |
  stw   (r0)                                ; $0AD721 |
  inc   r0                                  ; $0AD722 |
  inc   r0                                  ; $0AD723 |
  from r10                                  ; $0AD724 |
  stw   (r0)                                ; $0AD725 |
  lms   r6,($0010)                          ; $0AD726 |
  iwt   r0,#$0EC2                           ; $0AD729 |
  add   r1                                  ; $0AD72C |
  from r6                                   ; $0AD72D |
  stb   (r0)                                ; $0AD72E |
  sub   r0                                  ; $0AD730 |
  sms   ($0010),r0                          ; $0AD731 |
  iwt   r0,#$0F62                           ; $0AD734 |
  add   r1                                  ; $0AD737 |
  ldw   (r0)                                ; $0AD738 |
  ibt   r6,#$0020                           ; $0AD739 |
  and   r6                                  ; $0AD73B |
  bne CODE_0AD748                           ; $0AD73C |
  nop                                       ; $0AD73E |
  iwt   r0,#$11E2                           ; $0AD73F |
  to r4                                     ; $0AD742 |
  add   r1                                  ; $0AD743 |
  iwt   r0,#$0100                           ; $0AD744 |
  stw   (r4)                                ; $0AD747 |

CODE_0AD748:
  iwt   r15,#$D7EB                          ; $0AD748 |
  nop                                       ; $0AD74B |

CODE_0AD74C:
  iwt   r0,#$1502                           ; $0AD74C |
  add   r1                                  ; $0AD74F |
  ldw   (r0)                                ; $0AD750 |
  ibt   r5,#$0040                           ; $0AD751 |
  sub   r5                                  ; $0AD753 |
  bcs CODE_0AD748                           ; $0AD754 |
  from r7                                   ; $0AD756 |
  and   #8                                  ; $0AD757 |
  bne CODE_0AD766                           ; $0AD759 |
  nop                                       ; $0AD75B |
  lms   r0,($0002)                          ; $0AD75C |
  lms   r5,($01BC)                          ; $0AD75F |
  sub   r5                                  ; $0AD762 |
  bmi CODE_0AD748                           ; $0AD763 |
  nop                                       ; $0AD765 |

CODE_0AD766:
  iwt   r0,#$1822                           ; $0AD766 |
  add   r1                                  ; $0AD769 |
  ldb   (r0)                                ; $0AD76A |
  dec   r0                                  ; $0AD76C |
  bpl CODE_0AD748                           ; $0AD76D |
  nop                                       ; $0AD76F |
  ibt   r0,#$0037                           ; $0AD770 |
  sms   ($007A),r0                          ; $0AD772 |
  iwt   r5,#$0201                           ; $0AD775 |
  link  #4                                  ; $0AD778 |
  iwt   r15,#$DFE3                          ; $0AD779 |
  nop                                       ; $0AD77C |
  iwt   r0,#$10A2                           ; $0AD77D |
  add   r4                                  ; $0AD780 |
  from r9                                   ; $0AD781 |
  stw   (r0)                                ; $0AD782 |
  lms   r0,($0002)                          ; $0AD783 |
  to r5                                     ; $0AD786 |
  bic   #15                                 ; $0AD787 |
  iwt   r0,#$1142                           ; $0AD789 |
  add   r4                                  ; $0AD78C |
  from r5                                   ; $0AD78D |
  stw   (r0)                                ; $0AD78E |
  ibt   r5,#$0005                           ; $0AD78F |
  iwt   r0,#$13C2                           ; $0AD791 |
  add   r4                                  ; $0AD794 |
  from r5                                   ; $0AD795 |
  stw   (r0)                                ; $0AD796 |
  ibt   r5,#$0002                           ; $0AD797 |
  iwt   r0,#$1782                           ; $0AD799 |
  add   r4                                  ; $0AD79C |
  from r5                                   ; $0AD79D |
  stw   (r0)                                ; $0AD79E |
  ibt   r4,#$0014                           ; $0AD79F |
  iwt   r0,#$11E2                           ; $0AD7A1 |
  add   r1                                  ; $0AD7A4 |
  to r5                                     ; $0AD7A5 |
  ldw   (r0)                                ; $0AD7A6 |
  iwt   r0,#$11E0                           ; $0AD7A7 |
  add   r1                                  ; $0AD7AA |
  to r6                                     ; $0AD7AB |
  ldw   (r0)                                ; $0AD7AC |
  move  r0,r5                               ; $0AD7AD |
  moves r6,r6                               ; $0AD7AF |
  bmi CODE_0AD7B6                           ; $0AD7B1 |
  nop                                       ; $0AD7B3 |
  not                                       ; $0AD7B4 |
  inc   r0                                  ; $0AD7B5 |

CODE_0AD7B6:
  add   r6                                  ; $0AD7B6 |
  to r6                                     ; $0AD7B7 |
  xor   r6                                  ; $0AD7B8 |
  bpl CODE_0AD7C0                           ; $0AD7BA |
  nop                                       ; $0AD7BC |
  ibt   r4,#$0040                           ; $0AD7BD |
  sub   r0                                  ; $0AD7BF |

CODE_0AD7C0:
  to r6                                     ; $0AD7C0 |
  div2                                      ; $0AD7C1 |
  add   r6                                  ; $0AD7C3 |
  sbk                                       ; $0AD7C4 |
  dec   r0                                  ; $0AD7C5 |
  bmi CODE_0AD7CB                           ; $0AD7C6 |
  inc   r0                                  ; $0AD7C8 |
  not                                       ; $0AD7C9 |
  inc   r0                                  ; $0AD7CA |

CODE_0AD7CB:
  iwt   r5,#$FF00                           ; $0AD7CB |
  sub   r5                                  ; $0AD7CE |
  bmi CODE_0AD7DF                           ; $0AD7CF |
  add   r5                                  ; $0AD7D1 |
  move  r5,r0                               ; $0AD7D2 |
  iwt   r0,#$FFC0                           ; $0AD7D4 |
  sub   r5                                  ; $0AD7D7 |
  bpl CODE_0AD7DF                           ; $0AD7D8 |
  nop                                       ; $0AD7DA |
  ibt   r4,#$0040                           ; $0AD7DB |
  ibt   r5,#$0000                           ; $0AD7DD |

CODE_0AD7DF:
  iwt   r0,#$11E2                           ; $0AD7DF |
  add   r1                                  ; $0AD7E2 |
  from r5                                   ; $0AD7E3 |
  stw   (r0)                                ; $0AD7E4 |
  iwt   r0,#$1502                           ; $0AD7E5 |
  add   r1                                  ; $0AD7E8 |
  from r4                                   ; $0AD7E9 |
  stw   (r0)                                ; $0AD7EA |
  lms   r5,($0010)                          ; $0AD7EB |
  iwt   r0,#$268E                           ; $0AD7EE |
  add   r1                                  ; $0AD7F1 |
  from r5                                   ; $0AD7F2 |
  stw   (r0)                                ; $0AD7F3 |
  iwt   r0,#$10A2                           ; $0AD7F4 |
  add   r1                                  ; $0AD7F7 |
  from r9                                   ; $0AD7F8 |
  stw   (r0)                                ; $0AD7F9 |
  iwt   r0,#$16E0                           ; $0AD7FA |
  add   r1                                  ; $0AD7FD |
  ldw   (r0)                                ; $0AD7FE |
  with r10                                  ; $0AD7FF |
  sub   r0                                  ; $0AD800 |
  iwt   r0,#$1142                           ; $0AD801 |
  add   r1                                  ; $0AD804 |
  from r10                                  ; $0AD805 |
  stw   (r0)                                ; $0AD806 |
  iwt   r15,#$D07F                          ; $0AD807 |
  inc   r1                                  ; $0AD80A |
  ibt   r11,#$0030                          ; $0AD80B |
  iwt   r0,#$1502                           ; $0AD80D |
  add   r1                                  ; $0AD810 |
  ldw   (r0)                                ; $0AD811 |
  ibt   r5,#$0040                           ; $0AD812 |
  sub   r5                                  ; $0AD814 |
  bcc CODE_0AD849                           ; $0AD815 |
  nop                                       ; $0AD817 |
  link  #4                                  ; $0AD818 |
  iwt   r15,#$D08D                          ; $0AD819 |
  alt3                                      ; $0AD81C |

  and   #2                                  ; $0AD81D |
  beq CODE_0AD844                           ; $0AD81F |
  from r2                                   ; $0AD821 |
  and   #2                                  ; $0AD822 |
  bne CODE_0AD844                           ; $0AD824 |
  from r3                                   ; $0AD826 |
  sex                                       ; $0AD827 |
  bmi CODE_0AD82C                           ; $0AD828 |
  hib                                       ; $0AD82A |
  inc   r0                                  ; $0AD82B |

CODE_0AD82C:
  to r4                                     ; $0AD82C |
  sex                                       ; $0AD82D |
  iwt   r0,#$11E0                           ; $0AD82E |
  add   r1                                  ; $0AD831 |
  ldw   (r0)                                ; $0AD832 |
  to r5                                     ; $0AD833 |
  xor   r3                                  ; $0AD834 |
  bpl CODE_0AD844                           ; $0AD836 |
  inc   r2                                  ; $0AD838 |
  not                                       ; $0AD839 |
  inc   r0                                  ; $0AD83A |
  sbk                                       ; $0AD83B |
  iwt   r0,#$13C0                           ; $0AD83C |
  add   r1                                  ; $0AD83F |
  ldw   (r0)                                ; $0AD840 |
  xor   #2                                  ; $0AD841 |
  sbk                                       ; $0AD843 |

CODE_0AD844:
  lms   r11,($0060)                         ; $0AD844 |
  jmp   r11                                 ; $0AD847 |
  nop                                       ; $0AD848 |

CODE_0AD849:
  iwt   r0,#$00C0                           ; $0AD849 |
  moves r3,r3                               ; $0AD84C |
  bpl CODE_0AD853                           ; $0AD84E |
  nop                                       ; $0AD850 |
  ibt   r0,#$0040                           ; $0AD851 |

CODE_0AD853:
  sms   ($0010),r0                          ; $0AD853 |
  iwt   r0,#$11E0                           ; $0AD856 |
  add   r1                                  ; $0AD859 |
  ldw   (r0)                                ; $0AD85A |
  xor   r3                                  ; $0AD85B |
  bmi CODE_0AD866                           ; $0AD85D |
  nop                                       ; $0AD85F |
  inc   r14                                 ; $0AD860 |
  inc   r14                                 ; $0AD861 |
  ibt   r7,#$0000                           ; $0AD862 |
  jmp   r11                                 ; $0AD864 |
  nop                                       ; $0AD865 |

CODE_0AD866:
  link  #4                                  ; $0AD866 |
  iwt   r15,#$D08D                          ; $0AD867 |
  alt3                                      ; $0AD86A |

  lms   r0,($0000)                          ; $0AD86B |
  to r4                                     ; $0AD86E |
  and   #15                                 ; $0AD86F |
  sms   ($0048),r4                          ; $0AD871 |
  from r7                                   ; $0AD874 |
  and   #4                                  ; $0AD875 |
  sms   ($0040),r0                          ; $0AD877 |
  bne CODE_0AD8A0                           ; $0AD87A |
  nop                                       ; $0AD87C |
  sms   ($0004),r6                          ; $0AD87D |
  sms   ($0006),r7                          ; $0AD880 |
  sms   ($0008),r8                          ; $0AD883 |
  lms   r0,($0000)                          ; $0AD886 |
  sms   ($000A),r0                          ; $0AD889 |
  to r8                                     ; $0AD88C |
  add   r3                                  ; $0AD88D |
  lms   r0,($0002)                          ; $0AD88E |
  sms   ($000C),r0                          ; $0AD891 |
  link  #4                                  ; $0AD894 |
  iwt   r15,#$D096                          ; $0AD895 |
  alt1                                      ; $0AD898 |

  and   #4                                  ; $0AD899 |
  beq CODE_0AD8E1                           ; $0AD89B |
  nop                                       ; $0AD89D |
  with r4                                   ; $0AD89E |
  sub   r3                                  ; $0AD89F |

CODE_0AD8A0:
  sms   ($005C),r14                         ; $0AD8A0 |
  from r8                                   ; $0AD8A3 |
  swap                                      ; $0AD8A4 |
  moves r3,r3                               ; $0AD8A5 |
  bpl CODE_0AD8AC                           ; $0AD8A7 |
  lsr                                       ; $0AD8A9 |
  inc   r0                                  ; $0AD8AA |
  inc   r0                                  ; $0AD8AB |

CODE_0AD8AC:
  iwt   r14,#$BD0A                          ; $0AD8AC |
  to r14                                    ; $0AD8AF |
  add   r14                                 ; $0AD8B0 |
  lms   r0,($0002)                          ; $0AD8B1 |
  and   #15                                 ; $0AD8B4 |
  add   r0                                  ; $0AD8B6 |
  add   r0                                  ; $0AD8B7 |
  add   r0                                  ; $0AD8B8 |
  to r14                                    ; $0AD8B9 |
  add   r14                                 ; $0AD8BA |
  to r5                                     ; $0AD8BB |
  getb                                      ; $0AD8BC |
  inc   r14                                 ; $0AD8BD |
  getbs                                     ; $0AD8BE |
  lms   r14,($005C)                         ; $0AD8C0 |
  sub   r4                                  ; $0AD8C3 |
  xor   r3                                  ; $0AD8C4 |
  bmi CODE_0AD8D9                           ; $0AD8C6 |
  to r4                                     ; $0AD8C8 |
  xor   r3                                  ; $0AD8C9 |
  inc   r4                                  ; $0AD8CB |
  sms   ($0010),r5                          ; $0AD8CC |
  from r4                                   ; $0AD8CF |
  add   #8                                  ; $0AD8D0 |
  ibt   r5,#$0011                           ; $0AD8D2 |
  sub   r5                                  ; $0AD8D4 |
  bcc CODE_0AD908                           ; $0AD8D5 |
  inc   r2                                  ; $0AD8D7 |
  dec   r2                                  ; $0AD8D8 |

CODE_0AD8D9:
  lms   r0,($0040)                          ; $0AD8D9 |
  sub   #4                                  ; $0AD8DC |
  beq CODE_0AD908                           ; $0AD8DE |
  nop                                       ; $0AD8E0 |

CODE_0AD8E1:
  lms   r4,($0048)                          ; $0AD8E1 |
  lms   r6,($0004)                          ; $0AD8E4 |
  lms   r7,($0006)                          ; $0AD8E7 |
  lms   r8,($0008)                          ; $0AD8EA |
  lms   r0,($000A)                          ; $0AD8ED |
  sms   ($0000),r0                          ; $0AD8F0 |
  lms   r0,($000C)                          ; $0AD8F3 |
  sms   ($0002),r0                          ; $0AD8F6 |
  from r7                                   ; $0AD8F9 |
  and   #2                                  ; $0AD8FA |
  beq CODE_0AD908                           ; $0AD8FC |
  nop                                       ; $0AD8FE |
  inc   r2                                  ; $0AD8FF |
  moves r0,r3                               ; $0AD900 |
  bpl CODE_0AD906                           ; $0AD902 |
  nop                                       ; $0AD904 |
  sub   r0                                  ; $0AD905 |

CODE_0AD906:
  to r4                                     ; $0AD906 |
  sub   r4                                  ; $0AD907 |

CODE_0AD908:
  lms   r11,($0060)                         ; $0AD908 |
  jmp   r11                                 ; $0AD90B |
  nop                                       ; $0AD90C |

  ibt   r3,#$0000                           ; $0AD90D |
  bra CODE_0AD915                           ; $0AD90F |
  from r2                                   ; $0AD911 |

  ibt   r3,#$0001                           ; $0AD912 |
  from r2                                   ; $0AD914 |

CODE_0AD915:
  lsr                                       ; $0AD915 |
  bcs CODE_0AD91D                           ; $0AD916 |
  nop                                       ; $0AD918 |
  iwt   r15,#$DD15                          ; $0AD919 |
  nop                                       ; $0AD91C |

CODE_0AD91D:
  iwt   r0,#$1502                           ; $0AD91D |
  add   r1                                  ; $0AD920 |
  ldw   (r0)                                ; $0AD921 |
  ibt   r5,#$0040                           ; $0AD922 |
  sub   r5                                  ; $0AD924 |
  bcc CODE_0AD942                           ; $0AD925 |
  nop                                       ; $0AD927 |
  iwt   r0,#$1938                           ; $0AD928 |
  add   r1                                  ; $0AD92B |
  ldw   (r0)                                ; $0AD92C |
  sub   #0                                  ; $0AD92D |
  bne CODE_0AD940                           ; $0AD92F |
  inc   r0                                  ; $0AD931 |
  sbk                                       ; $0AD932 |
  from r6                                   ; $0AD933 |
  hib                                       ; $0AD934 |
  iwt   r5,#$008E                           ; $0AD935 |
  sub   r5                                  ; $0AD938 |
  bne CODE_0AD940                           ; $0AD939 |
  nop                                       ; $0AD93B |
  iwt   r15,#$DCAC                          ; $0AD93C |
  nop                                       ; $0AD93F |

CODE_0AD940:
  jmp   r11                                 ; $0AD940 |
  nop                                       ; $0AD941 |

CODE_0AD942:
  iwt   r0,#$F800                           ; $0AD942 |
  and   r7                                  ; $0AD945 |
  iwt   r5,#$4000                           ; $0AD946 |
  sub   r5                                  ; $0AD949 |
  beq CODE_0AD98E                           ; $0AD94A |
  nop                                       ; $0AD94C |
  from r6                                   ; $0AD94D |
  hib                                       ; $0AD94E |
  ibt   r5,#$007A                           ; $0AD94F |
  sub   r5                                  ; $0AD951 |
  bne CODE_0AD959                           ; $0AD952 |
  add   r5                                  ; $0AD954 |
  iwt   r15,#$DB08                          ; $0AD955 |
  nop                                       ; $0AD958 |

CODE_0AD959:
  ibt   r5,#$007B                           ; $0AD959 |
  sub   r5                                  ; $0AD95B |
  bne CODE_0AD963                           ; $0AD95C |
  add   r5                                  ; $0AD95E |
  iwt   r15,#$DBA0                          ; $0AD95F |
  nop                                       ; $0AD962 |

CODE_0AD963:
  ibt   r5,#$007C                           ; $0AD963 |
  sub   r5                                  ; $0AD965 |
  bne CODE_0AD96D                           ; $0AD966 |
  add   r5                                  ; $0AD968 |
  iwt   r15,#$DC5B                          ; $0AD969 |
  nop                                       ; $0AD96C |

CODE_0AD96D:
  iwt   r5,#$008E                           ; $0AD96D |
  sub   r5                                  ; $0AD970 |
  bne CODE_0AD978                           ; $0AD971 |
  nop                                       ; $0AD973 |
  iwt   r15,#$DCAC                          ; $0AD974 |
  nop                                       ; $0AD977 |

CODE_0AD978:
  iwt   r0,#$1320                           ; $0AD978 |
  add   r1                                  ; $0AD97B |
  ldw   (r0)                                ; $0AD97C |
  iwt   r5,#$0107                           ; $0AD97D |
  sub   r5                                  ; $0AD980 |
  ibt   r5,#$001F                           ; $0AD981 |
  beq CODE_0AD987                           ; $0AD983 |
  nop                                       ; $0AD985 |
  inc   r5                                  ; $0AD986 |

CODE_0AD987:
  sms   ($007A),r5                          ; $0AD987 |
  iwt   r15,#$DA1A                          ; $0AD98A |
  nop                                       ; $0AD98D |

CODE_0AD98E:
  ibt   r5,#$0002                           ; $0AD98E |
  iwt   r0,#$1502                           ; $0AD990 |
  add   r1                                  ; $0AD993 |
  from r5                                   ; $0AD994 |
  stw   (r0)                                ; $0AD995 |
  ibt   r0,#$001C                           ; $0AD996 |
  sms   ($007A),r0                          ; $0AD998 |
  sms   ($0060),r11                         ; $0AD99B |
  sms   ($0048),r4                          ; $0AD99E |
  sms   ($004C),r6                          ; $0AD9A1 |
  iwt   r5,#$01C3                           ; $0AD9A4 |
  link  #4                                  ; $0AD9A7 |
  iwt   r15,#$DFE3                          ; $0AD9A8 |
  nop                                       ; $0AD9AB |
  lms   r0,($0000)                          ; $0AD9AC |
  to r5                                     ; $0AD9AF |
  bic   #15                                 ; $0AD9B0 |
  iwt   r0,#$10A2                           ; $0AD9B2 |
  add   r4                                  ; $0AD9B5 |
  from r5                                   ; $0AD9B6 |
  stw   (r0)                                ; $0AD9B7 |
  lms   r0,($0002)                          ; $0AD9B8 |
  to r5                                     ; $0AD9BB |
  bic   #15                                 ; $0AD9BC |
  iwt   r0,#$1142                           ; $0AD9BE |
  add   r4                                  ; $0AD9C1 |
  from r5                                   ; $0AD9C2 |
  stw   (r0)                                ; $0AD9C3 |
  iwt   r0,#$11E0                           ; $0AD9C4 |
  add   r1                                  ; $0AD9C7 |
  ldw   (r0)                                ; $0AD9C8 |
  not                                       ; $0AD9C9 |
  inc   r0                                  ; $0AD9CA |
  div2                                      ; $0AD9CB |
  div2                                      ; $0AD9CD |
  div2                                      ; $0AD9CF |
  to r5                                     ; $0AD9D1 |
  div2                                      ; $0AD9D2 |
  iwt   r0,#$11E0                           ; $0AD9D4 |
  add   r4                                  ; $0AD9D7 |
  from r5                                   ; $0AD9D8 |
  stw   (r0)                                ; $0AD9D9 |
  iwt   r0,#$11E2                           ; $0AD9DA |
  add   r1                                  ; $0AD9DD |
  ldw   (r0)                                ; $0AD9DE |
  div2                                      ; $0AD9DF |
  div2                                      ; $0AD9E1 |
  div2                                      ; $0AD9E3 |
  to r5                                     ; $0AD9E5 |
  div2                                      ; $0AD9E6 |
  iwt   r0,#$11E2                           ; $0AD9E8 |
  add   r4                                  ; $0AD9EB |
  from r5                                   ; $0AD9EC |
  stw   (r0)                                ; $0AD9ED |
  ibt   r5,#$000A                           ; $0AD9EE |
  iwt   r0,#$13C2                           ; $0AD9F0 |
  add   r4                                  ; $0AD9F3 |
  from r5                                   ; $0AD9F4 |
  stw   (r0)                                ; $0AD9F5 |
  ibt   r5,#$0002                           ; $0AD9F6 |
  iwt   r0,#$1782                           ; $0AD9F8 |
  add   r4                                  ; $0AD9FB |
  from r5                                   ; $0AD9FC |
  stw   (r0)                                ; $0AD9FD |
  ibt   r5,#$0008                           ; $0AD9FE |
  iwt   r0,#$1502                           ; $0ADA00 |
  add   r4                                  ; $0ADA03 |
  from r5                                   ; $0ADA04 |
  stw   (r0)                                ; $0ADA05 |
  iwt   r5,#$0400                           ; $0ADA06 |
  iwt   r0,#$15A2                           ; $0ADA09 |
  add   r4                                  ; $0ADA0C |
  from r5                                   ; $0ADA0D |
  stw   (r0)                                ; $0ADA0E |
  ibt   r0,#$0004                           ; $0ADA0F |
  stop                                      ; $0ADA11 |
  nop                                       ; $0ADA12 |

  lms   r11,($0060)                         ; $0ADA13 |
  iwt   r15,#$DAFA                          ; $0ADA16 |
  nop                                       ; $0ADA19 |
  sms   ($0048),r4                          ; $0ADA1A |
  sms   ($004C),r6                          ; $0ADA1D |
  iwt   r0,#$1502                           ; $0ADA20 |
  add   r1                                  ; $0ADA23 |
  ldw   (r0)                                ; $0ADA24 |
  to r5                                     ; $0ADA25 |
  sub   #3                                  ; $0ADA26 | number of times an egg will ricochet
  bcc CODE_0ADA60                           ; $0ADA28 |
  inc   r0                                  ; $0ADA2A | change to 01 to make eggs bounce infinitely
  iwt   r0,#$009E                           ; $0ADA2B | sound eggs make when they die
  sms   ($007A),r0                          ; $0ADA2E |
  ibt   r5,#$000E                           ; $0ADA31 |
  iwt   r0,#$0EC0                           ; $0ADA33 | change to #$0000to make eggs collectible after the final hit, rather than having them fall away
  add   r1                                  ; $0ADA36 |
  from r5                                   ; $0ADA37 |
  stw   (r0)                                ; $0ADA38 |
  ibt   r5,#$0000                           ; $0ADA39 |
  iwt   r0,#$1CF8                           ; $0ADA3B |
  add   r1                                  ; $0ADA3E |
  from r5                                   ; $0ADA3F |
  stw   (r0)                                ; $0ADA40 |
  iwt   r0,#$11E0                           ; $0ADA41 | how far the egg falls away horizontally after the last ricochet
  add   r1                                  ; $0ADA44 |
  ldw   (r0)                                ; $0ADA45 |
  div2                                      ; $0ADA46 |
  div2                                      ; $0ADA48 |
  sbk                                       ; $0ADA4A |
  iwt   r0,#$11E2                           ; $0ADA4B | how far the egg falls away vertically after the last ricochet
  add   r1                                  ; $0ADA4E |
  ldw   (r0)                                ; $0ADA4F |
  div2                                      ; $0ADA50 |
  div2                                      ; $0ADA52 |
  sbk                                       ; $0ADA54 |
  ibt   r5,#$0040                           ; $0ADA55 |
  iwt   r0,#$1502                           ; $0ADA57 |
  add   r1                                  ; $0ADA5A |
  from r5                                   ; $0ADA5B |
  stw   (r0)                                ; $0ADA5C |
  bra CODE_0ADA8B                           ; $0ADA5D |
  nop                                       ; $0ADA5F |

CODE_0ADA60:
  sbk                                       ; $0ADA60 |
  iwt   r0,#$1320                           ; $0ADA61 | change to #$0000to make eggs stay green during ricochets
  add   r1                                  ; $0ADA64 |
  ldw   (r0)                                ; $0ADA65 |
  iwt   r5,#$0024                           ; $0ADA66 |
  sub   r5                                  ; $0ADA69 |
  bcc CODE_0ADA8B                           ; $0ADA6A |
  add   r5                                  ; $0ADA6C |
  iwt   r5,#$0026                           ; $0ADA6D |
  sub   r5                                  ; $0ADA70 |
  bcs CODE_0ADA8B                           ; $0ADA71 |
  add   r5                                  ; $0ADA73 |
  dec   r0                                  ; $0ADA74 |
  sbk                                       ; $0ADA75 |
  move  r5,r14                              ; $0ADA76 |
  add   r0                                  ; $0ADA78 |
  iwt   r14,#$9F1B                          ; $0ADA79 |
  to r14                                    ; $0ADA7C |
  add   r14                                 ; $0ADA7D |
  to r14                                    ; $0ADA7E |
  getb                                      ; $0ADA7F |
  iwt   r0,#$1002                           ; $0ADA80 |
  add   r1                                  ; $0ADA83 |
  ldw   (r0)                                ; $0ADA84 |
  bic   #14                                 ; $0ADA85 |
  or    r14                                 ; $0ADA87 |
  sbk                                       ; $0ADA88 |
  move  r14,r5                              ; $0ADA89 |

CODE_0ADA8B:
  sms   ($004E),r7                          ; $0ADA8B |
  sms   ($0050),r8                          ; $0ADA8E |
  sms   ($005C),r14                         ; $0ADA91 |
  dec   r3                                  ; $0ADA94 |
  bpl CODE_0ADAA0                           ; $0ADA95 |
  inc   r3                                  ; $0ADA97 |
  iwt   r0,#$13C0                           ; $0ADA98 |
  add   r1                                  ; $0ADA9B |
  ldw   (r0)                                ; $0ADA9C |
  xor   #2                                  ; $0ADA9D |
  sbk                                       ; $0ADA9F |

CODE_0ADAA0:
  ibt   r0,#$0008                           ; $0ADAA0 |
  romb                                      ; $0ADAA2 |
  lms   r0,($0010)                          ; $0ADAA4 |
  add   r0                                  ; $0ADAA7 |
  lob                                       ; $0ADAA8 |
  iwt   r14,#$AE18                          ; $0ADAA9 |
  to r14                                    ; $0ADAAC |
  add   r14                                 ; $0ADAAD |
  getb                                      ; $0ADAAE |
  to r6                                     ; $0ADAAF |
  swap                                      ; $0ADAB0 |
  iwt   r0,#$11E0                           ; $0ADAB1 |
  add   r1                                  ; $0ADAB4 |
  to r4                                     ; $0ADAB5 |
  ldw   (r0)                                ; $0ADAB6 |
  from r4                                   ; $0ADAB7 |
  fmult                                     ; $0ADAB8 |
  to r7                                     ; $0ADAB9 |
  rol                                       ; $0ADABA |
  iwt   r0,#$11E2                           ; $0ADABB |
  add   r1                                  ; $0ADABE |
  to r5                                     ; $0ADABF |
  ldw   (r0)                                ; $0ADAC0 |
  from r5                                   ; $0ADAC1 |
  fmult                                     ; $0ADAC2 |
  to r8                                     ; $0ADAC3 |
  rol                                       ; $0ADAC4 |
  ibt   r0,#$0040                           ; $0ADAC5 |
  to r14                                    ; $0ADAC7 |
  add   r14                                 ; $0ADAC8 |
  getb                                      ; $0ADAC9 |
  to r6                                     ; $0ADACA |
  swap                                      ; $0ADACB |
  ibt   r0,#$000A                           ; $0ADACC |
  romb                                      ; $0ADACE |
  from r5                                   ; $0ADAD0 |
  fmult                                     ; $0ADAD1 |
  rol                                       ; $0ADAD2 |
  add   r7                                  ; $0ADAD3 |
  to r5                                     ; $0ADAD4 |
  add   r0                                  ; $0ADAD5 |
  iwt   r0,#$11E0                           ; $0ADAD6 |
  add   r1                                  ; $0ADAD9 |
  from r5                                   ; $0ADADA |
  stw   (r0)                                ; $0ADADB |
  from r4                                   ; $0ADADC |
  fmult                                     ; $0ADADD |
  rol                                       ; $0ADADE |
  sub   r8                                  ; $0ADADF |
  to r4                                     ; $0ADAE0 |
  add   r0                                  ; $0ADAE1 |
  iwt   r0,#$11E2                           ; $0ADAE2 |
  add   r1                                  ; $0ADAE5 |
  from r4                                   ; $0ADAE6 |
  stw   (r0)                                ; $0ADAE7 |
  lms   r7,($004E)                          ; $0ADAE8 |
  lms   r8,($0050)                          ; $0ADAEB |
  lms   r14,($005C)                         ; $0ADAEE |
  ibt   r5,#$0001                           ; $0ADAF1 |
  iwt   r0,#$18C2                           ; $0ADAF3 |
  add   r1                                  ; $0ADAF6 |
  from r5                                   ; $0ADAF7 |
  stb   (r0)                                ; $0ADAF8 |
  lms   r4,($0048)                          ; $0ADAFA |
  lms   r6,($004C)                          ; $0ADAFD |
  jmp   r11                                 ; $0ADB00 |
  nop                                       ; $0ADB01 |

  dw $7A02, $7A04, $0000                    ; $0ADB02 |

  ibt   r5,#$0000                           ; $0ADB08 |
  iwt   r0,#$1502                           ; $0ADB0A |
  add   r1                                  ; $0ADB0D |
  from r5                                   ; $0ADB0E |
  stw   (r0)                                ; $0ADB0F |
  inc   r5                                  ; $0ADB10 |
  iwt   r0,#$18C2                           ; $0ADB11 |
  add   r1                                  ; $0ADB14 |
  from r5                                   ; $0ADB15 |
  stw   (r0)                                ; $0ADB16 |
  sms   ($0048),r4                          ; $0ADB17 |
  sms   ($004C),r6                          ; $0ADB1A |
  from r6                                   ; $0ADB1D |
  lob                                       ; $0ADB1E |
  lsr                                       ; $0ADB1F |
  lms   r6,($0000)                          ; $0ADB20 |
  bcc CODE_0ADB2C                           ; $0ADB23 |
  add   r0                                  ; $0ADB25 |
  ibt   r5,#$0010                           ; $0ADB26 |
  with r6                                   ; $0ADB28 |
  sub   r5                                  ; $0ADB29 |
  from r6                                   ; $0ADB2A |
  sbk                                       ; $0ADB2B |

CODE_0ADB2C:
  move  r4,r14                              ; $0ADB2C |
  iwt   r14,#$DB02                          ; $0ADB2E |
  to r14                                    ; $0ADB31 |
  add   r14                                 ; $0ADB32 |
  getb                                      ; $0ADB33 |
  inc   r14                                 ; $0ADB34 |
  to r5                                     ; $0ADB35 |
  getbh                                     ; $0ADB36 |
  move  r14,r4                              ; $0ADB38 |
  ibt   r0,#$000E                           ; $0ADB3A |
  stop                                      ; $0ADB3C |
  nop                                       ; $0ADB3D |

  ibt   r0,#$0010                           ; $0ADB3E |
  add   r6                                  ; $0ADB40 |
  sms   ($0000),r0                          ; $0ADB41 |
  moves r5,r5                               ; $0ADB44 |
  beq CODE_0ADB51                           ; $0ADB46 |
  nop                                       ; $0ADB48 |
  ibt   r0,#$0008                           ; $0ADB49 |
  sms   ($007A),r0                          ; $0ADB4B |
  bra CODE_0ADB94                           ; $0ADB4E |
  inc   r5                                  ; $0ADB50 |

CODE_0ADB51:
  ibt   r0,#$0032                           ; $0ADB51 |
  sms   ($007A),r0                          ; $0ADB53 |
  move  r6,r11                              ; $0ADB56 |
  iwt   r5,#$020A                           ; $0ADB58 |
  link  #4                                  ; $0ADB5B |
  iwt   r15,#$DFE3                          ; $0ADB5C |
  nop                                       ; $0ADB5F |
  lms   r0,($0000)                          ; $0ADB60 |
  bic   #15                                 ; $0ADB63 |
  to r5                                     ; $0ADB65 |
  sub   #8                                  ; $0ADB66 |
  iwt   r0,#$10A2                           ; $0ADB68 |
  add   r4                                  ; $0ADB6B |
  from r5                                   ; $0ADB6C |
  stw   (r0)                                ; $0ADB6D |
  lms   r0,($0002)                          ; $0ADB6E |
  to r5                                     ; $0ADB71 |
  bic   #15                                 ; $0ADB72 |
  iwt   r0,#$1142                           ; $0ADB74 |
  add   r4                                  ; $0ADB77 |
  from r5                                   ; $0ADB78 |
  stw   (r0)                                ; $0ADB79 |
  ibt   r5,#$0004                           ; $0ADB7A |
  iwt   r0,#$13C2                           ; $0ADB7C |
  add   r4                                  ; $0ADB7F |
  from r5                                   ; $0ADB80 |
  stw   (r0)                                ; $0ADB81 |
  iwt   r0,#$1E4C                           ; $0ADB82 |
  add   r4                                  ; $0ADB85 |
  from r5                                   ; $0ADB86 |
  stw   (r0)                                ; $0ADB87 |
  ibt   r5,#$0008                           ; $0ADB88 |
  iwt   r0,#$1782                           ; $0ADB8A |
  add   r4                                  ; $0ADB8D |
  from r5                                   ; $0ADB8E |
  stw   (r0)                                ; $0ADB8F |
  move  r11,r6                              ; $0ADB90 |
  ibt   r5,#$0000                           ; $0ADB92 |

CODE_0ADB94:
  ibt   r0,#$000E                           ; $0ADB94 |
  stop                                      ; $0ADB96 |
  nop                                       ; $0ADB97 |

  iwt   r15,#$DA8B                          ; $0ADB98 |
  nop                                       ; $0ADB9B |

  dw $7B04, $0000                           ; $0ADB9C |

  ibt   r5,#$0000                           ; $0ADBA0 |
  iwt   r0,#$1502                           ; $0ADBA2 |
  add   r1                                  ; $0ADBA5 |
  from r5                                   ; $0ADBA6 |
  stw   (r0)                                ; $0ADBA7 |
  inc   r5                                  ; $0ADBA8 |
  iwt   r0,#$18C2                           ; $0ADBA9 |
  add   r1                                  ; $0ADBAC |
  from r5                                   ; $0ADBAD |
  stw   (r0)                                ; $0ADBAE |
  sms   ($0048),r4                          ; $0ADBAF |
  sms   ($004C),r6                          ; $0ADBB2 |
  sms   ($004E),r7                          ; $0ADBB5 |
  from r6                                   ; $0ADBB8 |
  lob                                       ; $0ADBB9 |
  lsr                                       ; $0ADBBA |
  lms   r7,($0000)                          ; $0ADBBB |
  bcc CODE_0ADBC7                           ; $0ADBBE |
  nop                                       ; $0ADBC0 |
  ibt   r5,#$0010                           ; $0ADBC1 |
  with r7                                   ; $0ADBC3 |
  sub   r5                                  ; $0ADBC4 |
  from r7                                   ; $0ADBC5 |
  sbk                                       ; $0ADBC6 |

CODE_0ADBC7:
  lsr                                       ; $0ADBC7 |
  lms   r6,($0002)                          ; $0ADBC8 |
  bcc CODE_0ADBD4                           ; $0ADBCB |
  add   r0                                  ; $0ADBCD |
  ibt   r5,#$0010                           ; $0ADBCE |
  with r6                                   ; $0ADBD0 |
  sub   r5                                  ; $0ADBD1 |
  from r6                                   ; $0ADBD2 |
  sbk                                       ; $0ADBD3 |

CODE_0ADBD4:
  move  r4,r14                              ; $0ADBD4 |
  iwt   r14,#$DB9C                          ; $0ADBD6 |
  to r14                                    ; $0ADBD9 |
  add   r14                                 ; $0ADBDA |
  getb                                      ; $0ADBDB |
  inc   r14                                 ; $0ADBDC |
  to r5                                     ; $0ADBDD |
  getbh                                     ; $0ADBDE |
  move  r14,r4                              ; $0ADBE0 |
  moves r5,r5                               ; $0ADBE2 |
  bne CODE_0ADC2A                           ; $0ADBE4 |
  nop                                       ; $0ADBE6 |
  ibt   r0,#$000C                           ; $0ADBE7 |
  stop                                      ; $0ADBE9 |
  nop                                       ; $0ADBEA |

  sms   ($0060),r11                         ; $0ADBEB |
  ibt   r0,#$0048                           ; $0ADBEE |
  sms   ($007A),r0                          ; $0ADBF0 |
  iwt   r5,#$020C                           ; $0ADBF3 |
  link  #4                                  ; $0ADBF6 |
  iwt   r15,#$DFE3                          ; $0ADBF7 |
  nop                                       ; $0ADBFA |
  from r7                                   ; $0ADBFB |
  bic   #15                                 ; $0ADBFC |
  to r5                                     ; $0ADBFE |
  add   #8                                  ; $0ADBFF |
  iwt   r0,#$10A2                           ; $0ADC01 |
  add   r4                                  ; $0ADC04 |
  from r5                                   ; $0ADC05 |
  stw   (r0)                                ; $0ADC06 |
  from r6                                   ; $0ADC07 |
  bic   #15                                 ; $0ADC08 |
  to r5                                     ; $0ADC0A |
  add   #8                                  ; $0ADC0B |
  iwt   r0,#$1142                           ; $0ADC0D |
  add   r4                                  ; $0ADC10 |
  from r5                                   ; $0ADC11 |
  stw   (r0)                                ; $0ADC12 |
  ibt   r5,#$000D                           ; $0ADC13 |
  iwt   r0,#$13C2                           ; $0ADC15 |
  add   r4                                  ; $0ADC18 |
  from r5                                   ; $0ADC19 |
  stw   (r0)                                ; $0ADC1A |
  ibt   r5,#$0002                           ; $0ADC1B |
  iwt   r0,#$1782                           ; $0ADC1D |
  add   r4                                  ; $0ADC20 |
  from r5                                   ; $0ADC21 |
  stw   (r0)                                ; $0ADC22 |
  lms   r11,($0060)                         ; $0ADC23 |
  iwt   r15,#$DA8E                          ; $0ADC26 |
  nop                                       ; $0ADC29 |

CODE_0ADC2A:
  ibt   r0,#$000A                           ; $0ADC2A |
  sms   ($007A),r0                          ; $0ADC2C |
  ibt   r0,#$000E                           ; $0ADC2F |
  stop                                      ; $0ADC31 |
  nop                                       ; $0ADC32 |

  ibt   r0,#$0010                           ; $0ADC33 |
  add   r7                                  ; $0ADC35 |
  sms   ($0000),r0                          ; $0ADC36 |
  inc   r5                                  ; $0ADC39 |
  ibt   r0,#$000E                           ; $0ADC3A |
  stop                                      ; $0ADC3C |
  nop                                       ; $0ADC3D |

  sms   ($0000),r7                          ; $0ADC3E |
  ibt   r0,#$0010                           ; $0ADC41 |
  add   r6                                  ; $0ADC43 |
  sms   ($0002),r0                          ; $0ADC44 |
  inc   r5                                  ; $0ADC47 |
  ibt   r0,#$000E                           ; $0ADC48 |
  stop                                      ; $0ADC4A |
  nop                                       ; $0ADC4B |

  ibt   r0,#$0010                           ; $0ADC4C |
  add   r7                                  ; $0ADC4E |
  sms   ($0000),r0                          ; $0ADC4F |
  inc   r5                                  ; $0ADC52 |
  ibt   r0,#$000E                           ; $0ADC53 |
  stop                                      ; $0ADC55 |
  nop                                       ; $0ADC56 |

  iwt   r15,#$DA8E                          ; $0ADC57 |
  nop                                       ; $0ADC5A |

  ibt   r5,#$0001                           ; $0ADC5B |
  iwt   r0,#$18C2                           ; $0ADC5D |
  add   r1                                  ; $0ADC60 |
  from r5                                   ; $0ADC61 |
  stw   (r0)                                ; $0ADC62 |
  ibt   r0,#$0004                           ; $0ADC63 |
  sms   ($007A),r0                          ; $0ADC65 |
  sms   ($0060),r11                         ; $0ADC68 |
  sms   ($0048),r4                          ; $0ADC6B |
  sms   ($004C),r6                          ; $0ADC6E |
  iwt   r5,#$020B                           ; $0ADC71 |
  link  #4                                  ; $0ADC74 |
  iwt   r15,#$DFE3                          ; $0ADC75 |
  nop                                       ; $0ADC78 |
  lms   r0,($0000)                          ; $0ADC79 |
  to r5                                     ; $0ADC7C |
  bic   #15                                 ; $0ADC7D |
  iwt   r0,#$10A2                           ; $0ADC7F |
  add   r4                                  ; $0ADC82 |
  from r5                                   ; $0ADC83 |
  stw   (r0)                                ; $0ADC84 |
  lms   r0,($0002)                          ; $0ADC85 |
  to r5                                     ; $0ADC88 |
  bic   #15                                 ; $0ADC89 |
  iwt   r0,#$1142                           ; $0ADC8B |
  add   r4                                  ; $0ADC8E |
  from r5                                   ; $0ADC8F |
  stw   (r0)                                ; $0ADC90 |
  ibt   r5,#$000C                           ; $0ADC91 |
  iwt   r0,#$13C2                           ; $0ADC93 |
  add   r4                                  ; $0ADC96 |
  from r5                                   ; $0ADC97 |
  stw   (r0)                                ; $0ADC98 |
  ibt   r5,#$0002                           ; $0ADC99 |
  iwt   r0,#$1782                           ; $0ADC9B |
  add   r4                                  ; $0ADC9E |
  from r5                                   ; $0ADC9F |
  stw   (r0)                                ; $0ADCA0 |
  ibt   r0,#$0018                           ; $0ADCA1 |
  stop                                      ; $0ADCA3 |
  nop                                       ; $0ADCA4 |

  lms   r11,($0060)                         ; $0ADCA5 |
  iwt   r15,#$DA20                          ; $0ADCA8 |
  nop                                       ; $0ADCAB |

  ibt   r5,#$0001                           ; $0ADCAC |
  iwt   r0,#$18C2                           ; $0ADCAE |
  add   r1                                  ; $0ADCB1 |
  from r5                                   ; $0ADCB2 |
  stw   (r0)                                ; $0ADCB3 |
  ibt   r0,#$0004                           ; $0ADCB4 |
  sms   ($007A),r0                          ; $0ADCB6 |
  sms   ($0060),r11                         ; $0ADCB9 |
  sms   ($0048),r4                          ; $0ADCBC |
  sms   ($004C),r6                          ; $0ADCBF |
  iwt   r5,#$0190                           ; $0ADCC2 |
  link  #4                                  ; $0ADCC5 |
  iwt   r15,#$DE1C                          ; $0ADCC6 |
  nop                                       ; $0ADCC9 |
  lms   r11,($0060)                         ; $0ADCCA |
  bmi CODE_0ADD11                           ; $0ADCCD |
  nop                                       ; $0ADCCF |
  lms   r0,($0000)                          ; $0ADCD0 |
  to r5                                     ; $0ADCD3 |
  bic   #15                                 ; $0ADCD4 |
  iwt   r0,#$10E2                           ; $0ADCD6 |
  add   r4                                  ; $0ADCD9 |
  from r5                                   ; $0ADCDA |
  stw   (r0)                                ; $0ADCDB |
  lms   r0,($0002)                          ; $0ADCDC |
  to r5                                     ; $0ADCDF |
  bic   #15                                 ; $0ADCE0 |
  iwt   r0,#$1182                           ; $0ADCE2 |
  add   r4                                  ; $0ADCE5 |
  from r5                                   ; $0ADCE6 |
  stw   (r0)                                ; $0ADCE7 |
  ibt   r5,#$0002                           ; $0ADCE8 |
  iwt   r0,#$1976                           ; $0ADCEA |
  add   r4                                  ; $0ADCED |
  from r5                                   ; $0ADCEE |
  stw   (r0)                                ; $0ADCEF |
  iwt   r0,#$1502                           ; $0ADCF0 |
  add   r1                                  ; $0ADCF3 |
  to r0                                     ; $0ADCF4 |
  ldw   (r0)                                ; $0ADCF5 |
  ibt   r5,#$0040                           ; $0ADCF6 |
  sub   r5                                  ; $0ADCF8 |
  bcs CODE_0ADD09                           ; $0ADCF9 |
  add   r5                                  ; $0ADCFB |
  to r5                                     ; $0ADCFC |
  sub   #3                                  ; $0ADCFD |
  bcc CODE_0ADD04                           ; $0ADCFF |
  inc   r0                                  ; $0ADD01 |
  ibt   r0,#$0040                           ; $0ADD02 |

CODE_0ADD04:
  sbk                                       ; $0ADD04 |
  iwt   r15,#$DAFA                          ; $0ADD05 |
  nop                                       ; $0ADD08 |

CODE_0ADD09:
  ibt   r5,#$0030                           ; $0ADD09 |
  iwt   r0,#$1978                           ; $0ADD0B |
  add   r4                                  ; $0ADD0E |
  from r5                                   ; $0ADD0F |
  stw   (r0)                                ; $0ADD10 |

CODE_0ADD11:
  iwt   r15,#$DA20                          ; $0ADD11 |
  nop                                       ; $0ADD14 |
  iwt   r0,#$F800                           ; $0ADD15 |
  and   r7                                  ; $0ADD18 |
  iwt   r5,#$3000                           ; $0ADD19 |
  sub   r5                                  ; $0ADD1C |
  beq CODE_0ADD86                           ; $0ADD1D |
  add   r5                                  ; $0ADD1F |
  iwt   r5,#$B000                           ; $0ADD20 |
  sub   r5                                  ; $0ADD23 |
  beq CODE_0ADD7D                           ; $0ADD24 |
  add   r5                                  ; $0ADD26 |
  iwt   r5,#$A800                           ; $0ADD27 |
  sub   r5                                  ; $0ADD2A |
  bne CODE_0ADD7B                           ; $0ADD2B |
  nop                                       ; $0ADD2D |
  iwt   r0,#$1AB6                           ; $0ADD2E |
  add   r1                                  ; $0ADD31 |
  ldw   (r0)                                ; $0ADD32 |
  sub   #0                                  ; $0ADD33 |
  bne CODE_0ADD7B                           ; $0ADD35 |
  nop                                       ; $0ADD37 |
  ibt   r5,#$0008                           ; $0ADD38 |
  iwt   r0,#$1AB6                           ; $0ADD3A |
  add   r1                                  ; $0ADD3D |
  from r5                                   ; $0ADD3E |
  stw   (r0)                                ; $0ADD3F |
  ibt   r0,#$0007                           ; $0ADD40 |
  sms   ($007A),r0                          ; $0ADD42 |
  sms   ($0060),r11                         ; $0ADD45 |
  iwt   r5,#$0214                           ; $0ADD48 |
  link  #4                                  ; $0ADD4B |
  iwt   r15,#$DFE3                          ; $0ADD4C |
  nop                                       ; $0ADD4F |
  lms   r11,($0060)                         ; $0ADD50 |
  lms   r0,($0000)                          ; $0ADD53 |
  to r5                                     ; $0ADD56 |
  bic   #15                                 ; $0ADD57 |
  iwt   r0,#$10A2                           ; $0ADD59 |
  add   r4                                  ; $0ADD5C |
  from r5                                   ; $0ADD5D |
  stw   (r0)                                ; $0ADD5E |
  lms   r0,($0002)                          ; $0ADD5F |
  to r5                                     ; $0ADD62 |
  bic   #15                                 ; $0ADD63 |
  iwt   r0,#$1142                           ; $0ADD65 |
  add   r4                                  ; $0ADD68 |
  from r5                                   ; $0ADD69 |
  stw   (r0)                                ; $0ADD6A |
  ibt   r5,#$000E                           ; $0ADD6B |
  iwt   r0,#$13C2                           ; $0ADD6D |
  add   r4                                  ; $0ADD70 |
  from r5                                   ; $0ADD71 |
  stw   (r0)                                ; $0ADD72 |
  ibt   r5,#$0004                           ; $0ADD73 |
  iwt   r0,#$1782                           ; $0ADD75 |
  add   r4                                  ; $0ADD78 |
  from r5                                   ; $0ADD79 |
  stw   (r0)                                ; $0ADD7A |

CODE_0ADD7B:
  jmp   r11                                 ; $0ADD7B |
  nop                                       ; $0ADD7C |

CODE_0ADD7D:
  lm    r0,($1E08)                          ; $0ADD7D |
  and   #8                                  ; $0ADD81 |
  beq CODE_0ADD8F                           ; $0ADD83 |
  nop                                       ; $0ADD85 |

CODE_0ADD86:
  ibt   r0,#$0009                           ; $0ADD86 |
  sms   ($007A),r0                          ; $0ADD88 |
  ibt   r0,#$0002                           ; $0ADD8B |
  stop                                      ; $0ADD8D |
  nop                                       ; $0ADD8E |

CODE_0ADD8F:
  jmp   r11                                 ; $0ADD8F |
  nop                                       ; $0ADD90 |

  link  #4                                  ; $0ADD91 |
  iwt   r15,#$D372                          ; $0ADD92 |
  with r11                                  ; $0ADD95 |
  link  #4                                  ; $0ADD96 |
  iwt   r15,#$D90D                          ; $0ADD97 |
  nop                                       ; $0ADD9A |
  iwt   r15,#$D07F                          ; $0ADD9B |
  inc   r1                                  ; $0ADD9E |
  link  #4                                  ; $0ADD9F |
  iwt   r15,#$D372                          ; $0ADDA0 |
  with r11                                  ; $0ADDA3 |
  with r2                                   ; $0ADDA4 |
  add   r2                                  ; $0ADDA5 |
  with r2                                   ; $0ADDA6 |
  add   r2                                  ; $0ADDA7 |
  iwt   r0,#$11E0                           ; $0ADDA8 |
  add   r1                                  ; $0ADDAB |
  ldw   (r0)                                ; $0ADDAC |
  dec   r0                                  ; $0ADDAD |
  bpl CODE_0ADDC8                           ; $0ADDAE |
  nop                                       ; $0ADDB0 |
  ibt   r3,#$0001                           ; $0ADDB1 |
  link  #4                                  ; $0ADDB3 |
  iwt   r15,#$D3B0                          ; $0ADDB4 |
  sm    ($11E0),r0                          ; $0ADDB7 |
  add   r1                                  ; $0ADDBB |
  ldw   (r0)                                ; $0ADDBC |
  sub   #0                                  ; $0ADDBD |
  beq CODE_0ADDCB                           ; $0ADDBF |
  with r2                                   ; $0ADDC1 |
  add   r2                                  ; $0ADDC2 |
  inc   r14                                 ; $0ADDC3 |
  inc   r14                                 ; $0ADDC4 |
  bra CODE_0ADDD4                           ; $0ADDC5 |
  with r2                                   ; $0ADDC7 |

CODE_0ADDC8:
  inc   r14                                 ; $0ADDC8 |
  inc   r14                                 ; $0ADDC9 |
  with r2                                   ; $0ADDCA |

CODE_0ADDCB:
  add   r2                                  ; $0ADDCB |
  ibt   r3,#$FFFF                           ; $0ADDCC |
  link  #4                                  ; $0ADDCE |
  iwt   r15,#$D3B0                          ; $0ADDCF |
  alt2                                      ; $0ADDD2 |
  with r2                                   ; $0ADDD3 |

CODE_0ADDD4:
  add   r2                                  ; $0ADDD4 |
  link  #4                                  ; $0ADDD5 |
  iwt   r15,#$D352                          ; $0ADDD6 |
  with r11                                  ; $0ADDD9 |
  with r2                                   ; $0ADDDA |
  add   r2                                  ; $0ADDDB |
  link  #4                                  ; $0ADDDC |
  iwt   r15,#$D352                          ; $0ADDDD |
  moves r11,r2                              ; $0ADDE0 |
  and   #3                                  ; $0ADDE2 |
  sub   #3                                  ; $0ADDE4 |
  beq CODE_0ADDEC                           ; $0ADDE6 |
  with r2                                   ; $0ADDE8 |
  bic   #3                                  ; $0ADDE9 |
  with r2                                   ; $0ADDEB |

CODE_0ADDEC:
  lsr                                       ; $0ADDEC |
  from r2                                   ; $0ADDED |
  lsr                                       ; $0ADDEE |
  bcc CODE_0ADDFA                           ; $0ADDEF |
  nop                                       ; $0ADDF1 |
  inc   r10                                 ; $0ADDF2 |
  iwt   r0,#$11E2                           ; $0ADDF3 |
  to r4                                     ; $0ADDF6 |
  add   r1                                  ; $0ADDF7 |
  sub   r0                                  ; $0ADDF8 |
  stw   (r4)                                ; $0ADDF9 |

CODE_0ADDFA:
  with r2                                   ; $0ADDFA |
  add   r2                                  ; $0ADDFB |
  ibt   r3,#$FFF0                           ; $0ADDFC |
  link  #4                                  ; $0ADDFE |
  iwt   r15,#$D1B5                          ; $0ADDFF |
  alt2                                      ; $0ADE02 |

  with r2                                   ; $0ADE03 |
  add   r2                                  ; $0ADE04 |
  ibt   r3,#$FFF0                           ; $0ADE05 |
  link  #4                                  ; $0ADE07 |
  iwt   r15,#$D1B5                          ; $0ADE08 |
CODE_0ADE0B:         alt2

  from r2                                   ; $0ADE0C |
  and   #3                                  ; $0ADE0D |
  sub   #3                                  ; $0ADE0F |
  beq CODE_0ADE17                           ; $0ADE11 |
  with r2                                   ; $0ADE13 |
  bic   #3                                  ; $0ADE14 |
  with r2                                   ; $0ADE16 |

CODE_0ADE17:
  lsr                                       ; $0ADE17 |
  iwt   r15,#$D570                          ; $0ADE18 |
  from r2                                   ; $0ADE1B |
  sms   ($0058),r12                         ; $0ADE1C |
  sms   ($005A),r13                         ; $0ADE1F |
  iwt   r4,#$0F5C                           ; $0ADE22 |
  ibt   r12,#$0012                          ; $0ADE25 |
  move  r13,r15                             ; $0ADE27 |
  ldb   (r4)                                ; $0ADE29 |
  sub   #0                                  ; $0ADE2B |
  beq CODE_0ADE3D                           ; $0ADE2D |
  dec   r4                                  ; $0ADE2F |
  dec   r4                                  ; $0ADE30 |
  dec   r4                                  ; $0ADE31 |
  loop                                      ; $0ADE32 |
  dec   r4                                  ; $0ADE33 |
  dec   r12                                 ; $0ADE34 |
  lms   r12,($0058)                         ; $0ADE35 |
  lms   r13,($005A)                         ; $0ADE38 |
  jmp   r11                                 ; $0ADE3B |
  nop                                       ; $0ADE3C |

CODE_0ADE3D:
  from r12                                  ; $0ADE3D |
  add   #5                                  ; $0ADE3E |
  add   r0                                  ; $0ADE40 |
  to r4                                     ; $0ADE41 |
  add   r0                                  ; $0ADE42 |
  ibt   r12,#$0010                          ; $0ADE43 |
  iwt   r0,#$0F00                           ; $0ADE45 |
  add   r4                                  ; $0ADE48 |
  from r12                                  ; $0ADE49 |
  stw   (r0)                                ; $0ADE4A |
  iwt   r12,#$00FF                          ; $0ADE4B |
  iwt   r0,#$14A0                           ; $0ADE4E |
  add   r4                                  ; $0ADE51 |
  from r12                                  ; $0ADE52 |
  stw   (r0)                                ; $0ADE53 |
  ibt   r12,#$0000                          ; $0ADE54 |
  iwt   r0,#$1D96                           ; $0ADE56 |
  add   r4                                  ; $0ADE59 |
  from r12                                  ; $0ADE5A |
  stw   (r0)                                ; $0ADE5B |
  iwt   r0,#$1220                           ; $0ADE5C |
  add   r4                                  ; $0ADE5F |
  from r12                                  ; $0ADE60 |
  stw   (r0)                                ; $0ADE61 |
  iwt   r0,#$1222                           ; $0ADE62 |
  add   r4                                  ; $0ADE65 |
  from r12                                  ; $0ADE66 |
  stw   (r0)                                ; $0ADE67 |
  iwt   r0,#$1976                           ; $0ADE68 |
  add   r4                                  ; $0ADE6B |
  from r12                                  ; $0ADE6C |
  stw   (r0)                                ; $0ADE6D |
  iwt   r0,#$1400                           ; $0ADE6E |
  add   r4                                  ; $0ADE71 |
  from r12                                  ; $0ADE72 |
  stw   (r0)                                ; $0ADE73 |
  iwt   r0,#$10E0                           ; $0ADE74 |
  add   r4                                  ; $0ADE77 |
  from r12                                  ; $0ADE78 |
  stw   (r0)                                ; $0ADE79 |
  iwt   r0,#$1D36                           ; $0ADE7A |
  add   r4                                  ; $0ADE7D |
  from r12                                  ; $0ADE7E |
  stw   (r0)                                ; $0ADE7F |
  iwt   r0,#$1978                           ; $0ADE80 |
  add   r4                                  ; $0ADE83 |
  from r12                                  ; $0ADE84 |
  stw   (r0)                                ; $0ADE85 |
  iwt   r0,#$19D6                           ; $0ADE86 |
  add   r4                                  ; $0ADE89 |
  from r12                                  ; $0ADE8A |
  stw   (r0)                                ; $0ADE8B |
  iwt   r0,#$19D8                           ; $0ADE8C |
  add   r4                                  ; $0ADE8F |
  from r12                                  ; $0ADE90 |
  stw   (r0)                                ; $0ADE91 |
  iwt   r0,#$1A36                           ; $0ADE92 |
  add   r4                                  ; $0ADE95 |
  from r12                                  ; $0ADE96 |
  stw   (r0)                                ; $0ADE97 |
  iwt   r0,#$1A38                           ; $0ADE98 |
  add   r4                                  ; $0ADE9B |
  from r12                                  ; $0ADE9C |
  stw   (r0)                                ; $0ADE9D |
  iwt   r0,#$1A96                           ; $0ADE9E |
  add   r4                                  ; $0ADEA1 |
  from r12                                  ; $0ADEA2 |
  stw   (r0)                                ; $0ADEA3 |
  iwt   r0,#$1A98                           ; $0ADEA4 |
  add   r4                                  ; $0ADEA7 |
  from r12                                  ; $0ADEA8 |
  stw   (r0)                                ; $0ADEA9 |
  iwt   r0,#$1AF6                           ; $0ADEAA |
  add   r4                                  ; $0ADEAD |
  from r12                                  ; $0ADEAE |
  stw   (r0)                                ; $0ADEAF |
  iwt   r0,#$1AF8                           ; $0ADEB0 |
  add   r4                                  ; $0ADEB3 |
  from r12                                  ; $0ADEB4 |
  stw   (r0)                                ; $0ADEB5 |
  iwt   r0,#$1402                           ; $0ADEB6 |
  add   r4                                  ; $0ADEB9 |
  from r12                                  ; $0ADEBA |
  stw   (r0)                                ; $0ADEBB |
  iwt   r0,#$1860                           ; $0ADEBC |
  add   r4                                  ; $0ADEBF |
  from r12                                  ; $0ADEC0 |
  stw   (r0)                                ; $0ADEC1 |
  iwt   r0,#$0F02                           ; $0ADEC2 |
  add   r4                                  ; $0ADEC5 |
  from r12                                  ; $0ADEC6 |
  stw   (r0)                                ; $0ADEC7 |
  iwt   r0,#$1D38                           ; $0ADEC8 |
  add   r4                                  ; $0ADECB |
  from r12                                  ; $0ADECC |
  stw   (r0)                                ; $0ADECD |
  iwt   r0,#$1720                           ; $0ADECE |
  add   r4                                  ; $0ADED1 |
  from r12                                  ; $0ADED2 |
  stw   (r0)                                ; $0ADED3 |
  iwt   r0,#$1680                           ; $0ADED4 |
  add   r4                                  ; $0ADED7 |
  from r12                                  ; $0ADED8 |
  stw   (r0)                                ; $0ADED9 |
  iwt   r0,#$1682                           ; $0ADEDA |
  add   r4                                  ; $0ADEDD |
  from r12                                  ; $0ADEDE |
  stw   (r0)                                ; $0ADEDF |
  iwt   r0,#$1540                           ; $0ADEE0 |
  add   r4                                  ; $0ADEE3 |
  from r12                                  ; $0ADEE4 |
  stw   (r0)                                ; $0ADEE5 |
  iwt   r0,#$15E0                           ; $0ADEE6 |
  add   r4                                  ; $0ADEE9 |
  from r12                                  ; $0ADEEA |
  stw   (r0)                                ; $0ADEEB |
  iwt   r0,#$17C0                           ; $0ADEEC |
  add   r4                                  ; $0ADEEF |
  from r12                                  ; $0ADEF0 |
  stw   (r0)                                ; $0ADEF1 |
  dec   r12                                 ; $0ADEF2 |
  iwt   r0,#$1362                           ; $0ADEF3 |
  add   r4                                  ; $0ADEF6 |
  from r12                                  ; $0ADEF7 |
  stw   (r0)                                ; $0ADEF8 |
  iwt   r0,#$1722                           ; $0ADEF9 |
  add   r4                                  ; $0ADEFC |
  from r12                                  ; $0ADEFD |
  stw   (r0)                                ; $0ADEFE |
  iwt   r12,#$1FFF                          ; $0ADEFF |
  iwt   r0,#$1862                           ; $0ADF02 |
  add   r4                                  ; $0ADF05 |
  from r12                                  ; $0ADF06 |
  stw   (r0)                                ; $0ADF07 |
  iwt   r0,#$1360                           ; $0ADF08 |
  add   r4                                  ; $0ADF0B |
  from r5                                   ; $0ADF0C |
  stw   (r0)                                ; $0ADF0D |
  from r5                                   ; $0ADF0E |
  to r12                                    ; $0ADF0F |
  add   r5                                  ; $0ADF10 |
  sms   ($005C),r14                         ; $0ADF11 |
  iwt   r0,#$A716                           ; $0ADF14 |
  to r14                                    ; $0ADF17 |
  add   r12                                 ; $0ADF18 |
  to r13                                    ; $0ADF19 |
  getb                                      ; $0ADF1A |
  iwt   r5,#$0EBB                           ; $0ADF1B |
  ibt   r14,#$0006                          ; $0ADF1E |

CODE_0ADF20:
  ldb   (r5)                                ; $0ADF20 |
  sub   r13                                 ; $0ADF22 |
  beq CODE_0ADF2D                           ; $0ADF23 |
  dec   r14                                 ; $0ADF25 |
  bne CODE_0ADF20                           ; $0ADF26 |
  dec   r5                                  ; $0ADF28 |
  to r5                                     ; $0ADF29 |
  bra CODE_0ADF33                           ; $0ADF2A |
  sub   r0                                  ; $0ADF2C |

CODE_0ADF2D:
  from r14                                  ; $0ADF2D |
  add   #8                                  ; $0ADF2E |
  add   r0                                  ; $0ADF30 |
  to r5                                     ; $0ADF31 |
  add   r0                                  ; $0ADF32 |

CODE_0ADF33:
  iwt   r0,#$1180                           ; $0ADF33 |
  add   r4                                  ; $0ADF36 |
  from r5                                   ; $0ADF37 |
  stw   (r0)                                ; $0ADF38 |
  iwt   r0,#$9F1A                           ; $0ADF39 |
  to r14                                    ; $0ADF3C |
  add   r12                                 ; $0ADF3D |
  to r5                                     ; $0ADF3E |
  getb                                      ; $0ADF3F |
  inc   r14                                 ; $0ADF40 |
  iwt   r0,#$14A2                           ; $0ADF41 |
  add   r4                                  ; $0ADF44 |
  from r5                                   ; $0ADF45 |
  stw   (r0)                                ; $0ADF46 |
  getb                                      ; $0ADF47 |
  ibt   r5,#$0020                           ; $0ADF48 |
  to r5                                     ; $0ADF4A |
  xor   r5                                  ; $0ADF4B |
  iwt   r0,#$1042                           ; $0ADF4D |
  add   r4                                  ; $0ADF50 |
  from r5                                   ; $0ADF51 |
  stw   (r0)                                ; $0ADF52 |
  iwt   r0,#$A318                           ; $0ADF53 |
  to r14                                    ; $0ADF56 |
  add   r12                                 ; $0ADF57 |
  to r5                                     ; $0ADF58 |
  getbs                                     ; $0ADF59 |
  inc   r14                                 ; $0ADF5B |
  iwt   r0,#$1542                           ; $0ADF5C |
  add   r4                                  ; $0ADF5F |
  from r5                                   ; $0ADF60 |
  stw   (r0)                                ; $0ADF61 |
  getbs                                     ; $0ADF62 |
  mult  #8                                  ; $0ADF64 |
  to r5                                     ; $0ADF66 |
  add   r0                                  ; $0ADF67 |
  iwt   r0,#$15E2                           ; $0ADF68 |
  add   r4                                  ; $0ADF6B |
  from r5                                   ; $0ADF6C |
  stw   (r0)                                ; $0ADF6D |
  iwt   r0,#$971E                           ; $0ADF6E |
  to r14                                    ; $0ADF71 |
  add   r12                                 ; $0ADF72 |
  getb                                      ; $0ADF73 |
  inc   r14                                 ; $0ADF74 |
  to r5                                     ; $0ADF75 |
  getbh                                     ; $0ADF76 |
  iwt   r0,#$0FA2                           ; $0ADF78 |
  add   r4                                  ; $0ADF7B |
  from r5                                   ; $0ADF7C |
  stw   (r0)                                ; $0ADF7D |
  iwt   r0,#$9B1C                           ; $0ADF7E |
  to r14                                    ; $0ADF81 |
  add   r12                                 ; $0ADF82 |
  getb                                      ; $0ADF83 |
  inc   r14                                 ; $0ADF84 |
  to r5                                     ; $0ADF85 |
  getbh                                     ; $0ADF86 |
  iwt   r0,#$1040                           ; $0ADF88 |
  add   r4                                  ; $0ADF8B |
  from r5                                   ; $0ADF8C |
  stw   (r0)                                ; $0ADF8D |
  iwt   r0,#$9320                           ; $0ADF8E |
  to r14                                    ; $0ADF91 |
  add   r12                                 ; $0ADF92 |
  getb                                      ; $0ADF93 |
  inc   r14                                 ; $0ADF94 |
  to r5                                     ; $0ADF95 |
  getbh                                     ; $0ADF96 |
  iwt   r0,#$0FA0                           ; $0ADF98 |
  add   r4                                  ; $0ADF9B |
  from r5                                   ; $0ADF9C |
  stw   (r0)                                ; $0ADF9D |
  ibt   r0,#$001F                           ; $0ADF9E |
  and   r5                                  ; $0ADFA0 |
  add   r0                                  ; $0ADFA1 |
  add   r0                                  ; $0ADFA2 |
  add   r0                                  ; $0ADFA3 |
  iwt   r14,#$9220                          ; $0ADFA4 |
  to r14                                    ; $0ADFA7 |
  add   r14                                 ; $0ADFA8 |
  getb                                      ; $0ADFA9 |
  inc   r14                                 ; $0ADFAA |
  to r5                                     ; $0ADFAB |
  getbh                                     ; $0ADFAC |
  inc   r14                                 ; $0ADFAE |
  iwt   r0,#$1B56                           ; $0ADFAF |
  add   r4                                  ; $0ADFB2 |
  from r5                                   ; $0ADFB3 |
  stw   (r0)                                ; $0ADFB4 |
  getb                                      ; $0ADFB5 |
  inc   r14                                 ; $0ADFB6 |
  to r5                                     ; $0ADFB7 |
  getbh                                     ; $0ADFB8 |
  inc   r14                                 ; $0ADFBA |
  iwt   r0,#$1B58                           ; $0ADFBB |
  add   r4                                  ; $0ADFBE |
  from r5                                   ; $0ADFBF |
  stw   (r0)                                ; $0ADFC0 |
  getb                                      ; $0ADFC1 |
  inc   r14                                 ; $0ADFC2 |
  to r5                                     ; $0ADFC3 |
  getbh                                     ; $0ADFC4 |
  inc   r14                                 ; $0ADFC6 |
  iwt   r0,#$1BB6                           ; $0ADFC7 |
  add   r4                                  ; $0ADFCA |
  from r5                                   ; $0ADFCB |
  stw   (r0)                                ; $0ADFCC |
  getb                                      ; $0ADFCD |
  inc   r14                                 ; $0ADFCE |
  to r5                                     ; $0ADFCF |
  getbh                                     ; $0ADFD0 |
  iwt   r0,#$1BB8                           ; $0ADFD2 |
  add   r4                                  ; $0ADFD5 |
  from r5                                   ; $0ADFD6 |
  stw   (r0)                                ; $0ADFD7 |
  lms   r14,($005C)                         ; $0ADFD8 |
  lms   r12,($0058)                         ; $0ADFDB |
  lms   r13,($005A)                         ; $0ADFDE |
  jmp   r11                                 ; $0ADFE1 |
  sub   r0                                  ; $0ADFE2 |

  sms   ($0058),r12                         ; $0ADFE3 |
  sms   ($005A),r13                         ; $0ADFE6 |
  iwt   r4,#$0EFC                           ; $0ADFE9 |
  ibt   r12,#$0010                          ; $0ADFEC |
  move  r13,r15                             ; $0ADFEE |
  ldb   (r4)                                ; $0ADFF0 |
  sub   #0                                  ; $0ADFF2 |
  beq CODE_0AE00D                           ; $0ADFF4 |
  dec   r4                                  ; $0ADFF6 |
  dec   r4                                  ; $0ADFF7 |
  dec   r4                                  ; $0ADFF8 |
  loop                                      ; $0ADFF9 |
  dec   r4                                  ; $0ADFFA |
  lm    r0,($1E4A)                          ; $0ADFFB |
  dec   r0                                  ; $0ADFFF |
  dec   r0                                  ; $0AE000 |
  dec   r0                                  ; $0AE001 |
  dec   r0                                  ; $0AE002 |
  bpl CODE_0AE008                           ; $0AE003 |
  nop                                       ; $0AE005 |
  ibt   r0,#$003C                           ; $0AE006 |

CODE_0AE008:
  sbk                                       ; $0AE008 |
  lsr                                       ; $0AE009 |
  to r12                                    ; $0AE00A |
  lsr                                       ; $0AE00B |
  inc   r12                                 ; $0AE00C |

CODE_0AE00D:
  dec   r12                                 ; $0AE00D |
  from r12                                  ; $0AE00E |
  add   r12                                 ; $0AE00F |
  to r4                                     ; $0AE010 |
  add   r0                                  ; $0AE011 |
  ibt   r12,#$000E                          ; $0AE012 |
  iwt   r0,#$0EC0                           ; $0AE014 |
  add   r4                                  ; $0AE017 |
  from r12                                  ; $0AE018 |
  stw   (r0)                                ; $0AE019 |
  iwt   r12,#$00FF                          ; $0AE01A |
  iwt   r0,#$1460                           ; $0AE01D |
  add   r4                                  ; $0AE020 |
  from r12                                  ; $0AE021 |
  stw   (r0)                                ; $0AE022 |
  ibt   r12,#$0000                          ; $0AE023 |
  iwt   r0,#$11E0                           ; $0AE025 |
  add   r4                                  ; $0AE028 |
  from r12                                  ; $0AE029 |
  stw   (r0)                                ; $0AE02A |
  iwt   r0,#$11E2                           ; $0AE02B |
  add   r4                                  ; $0AE02E |
  from r12                                  ; $0AE02F |
  stw   (r0)                                ; $0AE030 |
  iwt   r0,#$13C0                           ; $0AE031 |
  add   r4                                  ; $0AE034 |
  from r12                                  ; $0AE035 |
  stw   (r0)                                ; $0AE036 |
  iwt   r0,#$10A0                           ; $0AE037 |
  add   r4                                  ; $0AE03A |
  from r12                                  ; $0AE03B |
  stw   (r0)                                ; $0AE03C |
  iwt   r0,#$1E4C                           ; $0AE03D |
  add   r4                                  ; $0AE040 |
  from r12                                  ; $0AE041 |
  stw   (r0)                                ; $0AE042 |
  iwt   r0,#$1E4E                           ; $0AE043 |
  add   r4                                  ; $0AE046 |
  from r12                                  ; $0AE047 |
  stw   (r0)                                ; $0AE048 |
  iwt   r0,#$1E8C                           ; $0AE049 |
  add   r4                                  ; $0AE04C |
  from r12                                  ; $0AE04D |
  stw   (r0)                                ; $0AE04E |
  iwt   r0,#$1782                           ; $0AE04F |
  add   r4                                  ; $0AE052 |
  from r12                                  ; $0AE053 |
  stw   (r0)                                ; $0AE054 |
  iwt   r0,#$1E8E                           ; $0AE055 |
  add   r4                                  ; $0AE058 |
  from r12                                  ; $0AE059 |
  stw   (r0)                                ; $0AE05A |
  iwt   r0,#$13C2                           ; $0AE05B |
  add   r4                                  ; $0AE05E |
  from r12                                  ; $0AE05F |
  stw   (r0)                                ; $0AE060 |
  iwt   r0,#$1820                           ; $0AE061 |
  add   r4                                  ; $0AE064 |
  from r12                                  ; $0AE065 |
  stw   (r0)                                ; $0AE066 |
  iwt   r0,#$0EC2                           ; $0AE067 |
  add   r4                                  ; $0AE06A |
  from r12                                  ; $0AE06B |
  stw   (r0)                                ; $0AE06C |
  iwt   r0,#$16E0                           ; $0AE06D |
  add   r4                                  ; $0AE070 |
  from r12                                  ; $0AE071 |
  stw   (r0)                                ; $0AE072 |
  iwt   r0,#$1640                           ; $0AE073 |
  add   r4                                  ; $0AE076 |
  from r12                                  ; $0AE077 |
  stw   (r0)                                ; $0AE078 |
  iwt   r0,#$1642                           ; $0AE079 |
  add   r4                                  ; $0AE07C |
  from r12                                  ; $0AE07D |
  stw   (r0)                                ; $0AE07E |
  iwt   r0,#$1500                           ; $0AE07F |
  add   r4                                  ; $0AE082 |
  from r12                                  ; $0AE083 |
  stw   (r0)                                ; $0AE084 |
  iwt   r0,#$15A0                           ; $0AE085 |
  add   r4                                  ; $0AE088 |
  from r12                                  ; $0AE089 |
  stw   (r0)                                ; $0AE08A |
  iwt   r0,#$1780                           ; $0AE08B |
  add   r4                                  ; $0AE08E |
  from r12                                  ; $0AE08F |
  stw   (r0)                                ; $0AE090 |
  dec   r12                                 ; $0AE091 |
  iwt   r0,#$1322                           ; $0AE092 |
  add   r4                                  ; $0AE095 |
  from r12                                  ; $0AE096 |
  stw   (r0)                                ; $0AE097 |
  iwt   r0,#$16E2                           ; $0AE098 |
  add   r4                                  ; $0AE09B |
  from r12                                  ; $0AE09C |
  stw   (r0)                                ; $0AE09D |
  iwt   r12,#$1FFF                          ; $0AE09E |
  iwt   r0,#$1822                           ; $0AE0A1 |
  add   r4                                  ; $0AE0A4 |
  from r12                                  ; $0AE0A5 |
  stw   (r0)                                ; $0AE0A6 |
  iwt   r0,#$1320                           ; $0AE0A7 |
  add   r4                                  ; $0AE0AA |
  from r5                                   ; $0AE0AB |
  stw   (r0)                                ; $0AE0AC |
  from r5                                   ; $0AE0AD |
  to r12                                    ; $0AE0AE |
  add   r5                                  ; $0AE0AF |
  sms   ($005C),r14                         ; $0AE0B0 |
  iwt   r0,#$B59E                           ; $0AE0B3 |
  to r14                                    ; $0AE0B6 |
  add   r12                                 ; $0AE0B7 |
  to r13                                    ; $0AE0B8 |
  getb                                      ; $0AE0B9 |
  iwt   r5,#$0EBB                           ; $0AE0BA |
  ibt   r14,#$0006                          ; $0AE0BD |

CODE_0AE0BF:
  ldb   (r5)                                ; $0AE0BF |
  sub   r13                                 ; $0AE0C1 |
  beq CODE_0AE0CC                           ; $0AE0C2 |
  dec   r14                                 ; $0AE0C4 |
  bne CODE_0AE0BF                           ; $0AE0C5 |
  dec   r5                                  ; $0AE0C7 |
  to r5                                     ; $0AE0C8 |
  bra CODE_0AE0D2                           ; $0AE0C9 |
  sub   r0                                  ; $0AE0CB |

CODE_0AE0CC:
  from r14                                  ; $0AE0CC |
  add   #8                                  ; $0AE0CD |
  add   r0                                  ; $0AE0CF |
  to r5                                     ; $0AE0D0 |
  add   r0                                  ; $0AE0D1 |

CODE_0AE0D2:
  iwt   r0,#$1140                           ; $0AE0D2 |
  add   r4                                  ; $0AE0D5 |
  from r5                                   ; $0AE0D6 |
  stw   (r0)                                ; $0AE0D7 |
  iwt   r0,#$B19E                           ; $0AE0D8 |
  to r14                                    ; $0AE0DB |
  add   r12                                 ; $0AE0DC |
  to r5                                     ; $0AE0DD |
  getb                                      ; $0AE0DE |
  inc   r14                                 ; $0AE0DF |
  iwt   r0,#$1462                           ; $0AE0E0 |
  add   r4                                  ; $0AE0E3 |
  from r5                                   ; $0AE0E4 |
  stw   (r0)                                ; $0AE0E5 |
  getb                                      ; $0AE0E6 |
  ibt   r5,#$0030                           ; $0AE0E7 |
  to r5                                     ; $0AE0E9 |
  xor   r5                                  ; $0AE0EA |
  iwt   r0,#$1002                           ; $0AE0EC |
  add   r4                                  ; $0AE0EF |
  from r5                                   ; $0AE0F0 |
  stw   (r0)                                ; $0AE0F1 |
  iwt   r0,#$B39E                           ; $0AE0F2 |
  to r14                                    ; $0AE0F5 |
  add   r12                                 ; $0AE0F6 |
  to r5                                     ; $0AE0F7 |
  getbs                                     ; $0AE0F8 |
  inc   r14                                 ; $0AE0FA |
  iwt   r0,#$1502                           ; $0AE0FB |
  add   r4                                  ; $0AE0FE |
  from r5                                   ; $0AE0FF |
  stw   (r0)                                ; $0AE100 |
  getbs                                     ; $0AE101 |
  mult  #8                                  ; $0AE103 |
  to r5                                     ; $0AE105 |
  add   r0                                  ; $0AE106 |
  iwt   r0,#$15A2                           ; $0AE107 |
  add   r4                                  ; $0AE10A |
  from r5                                   ; $0AE10B |
  stw   (r0)                                ; $0AE10C |
  iwt   r0,#$AB9E                           ; $0AE10D |
  to r14                                    ; $0AE110 |
  add   r12                                 ; $0AE111 |
  getb                                      ; $0AE112 |
  inc   r14                                 ; $0AE113 |
  to r5                                     ; $0AE114 |
  getbh                                     ; $0AE115 |
  iwt   r0,#$0F60                           ; $0AE117 |
  add   r4                                  ; $0AE11A |
  from r5                                   ; $0AE11B |
  stw   (r0)                                ; $0AE11C |
  iwt   r0,#$AD9E                           ; $0AE11D |
  to r14                                    ; $0AE120 |
  add   r12                                 ; $0AE121 |
  getb                                      ; $0AE122 |
  inc   r14                                 ; $0AE123 |
  to r5                                     ; $0AE124 |
  getbh                                     ; $0AE125 |
  iwt   r0,#$0F62                           ; $0AE127 |
  add   r4                                  ; $0AE12A |
  from r5                                   ; $0AE12B |
  stw   (r0)                                ; $0AE12C |
  iwt   r0,#$AF9E                           ; $0AE12D |
  to r14                                    ; $0AE130 |
  add   r12                                 ; $0AE131 |
  getb                                      ; $0AE132 |
  inc   r14                                 ; $0AE133 |
  to r5                                     ; $0AE134 |
  getbh                                     ; $0AE135 |
  iwt   r0,#$1000                           ; $0AE137 |
  add   r4                                  ; $0AE13A |
  from r5                                   ; $0AE13B |
  stw   (r0)                                ; $0AE13C |
  lms   r14,($005C)                         ; $0AE13D |
  lms   r12,($0058)                         ; $0AE140 |
  lms   r13,($005A)                         ; $0AE143 |
  jmp   r11                                 ; $0AE146 |
  nop                                       ; $0AE147 |

  link  #4                                  ; $0AE148 |
  iwt   r15,#$D372                          ; $0AE149 |
  with r11                                  ; $0AE14C |
  lm    r3,($29CA)                          ; $0AE14D |
  iwt   r0,#$18C2                           ; $0AE151 |
  add   r1                                  ; $0AE154 |
  from r3                                   ; $0AE155 |
  stw   (r0)                                ; $0AE156 |
  lms   r0,($0000)                          ; $0AE157 |
  stw   (r3)                                ; $0AE15A |
  inc   r3                                  ; $0AE15B |
  inc   r3                                  ; $0AE15C |
  lms   r0,($0002)                          ; $0AE15D |
  stw   (r3)                                ; $0AE160 |
  inc   r3                                  ; $0AE161 |
  inc   r3                                  ; $0AE162 |
  from r7                                   ; $0AE163 |
  stw   (r3)                                ; $0AE164 |
  inc   r3                                  ; $0AE165 |
  inc   r3                                  ; $0AE166 |
  from r6                                   ; $0AE167 |
  stw   (r3)                                ; $0AE168 |
  inc   r3                                  ; $0AE169 |
  inc   r3                                  ; $0AE16A |
  sm    ($29CA),r3                          ; $0AE16B |
  with r2                                   ; $0AE16F |
  add   r2                                  ; $0AE170 |
  with r2                                   ; $0AE171 |
  add   r2                                  ; $0AE172 |
  link  #4                                  ; $0AE173 |
  iwt   r15,#$D352                          ; $0AE174 |
  with r11                                  ; $0AE177 |
  lm    r3,($29CA)                          ; $0AE178 |
  lms   r0,($0000)                          ; $0AE17C |
  stw   (r3)                                ; $0AE17F |
  inc   r3                                  ; $0AE180 |
  inc   r3                                  ; $0AE181 |
  lms   r0,($0002)                          ; $0AE182 |
  stw   (r3)                                ; $0AE185 |
  inc   r3                                  ; $0AE186 |
  inc   r3                                  ; $0AE187 |
  from r7                                   ; $0AE188 |
  stw   (r3)                                ; $0AE189 |
  inc   r3                                  ; $0AE18A |
  inc   r3                                  ; $0AE18B |
  from r6                                   ; $0AE18C |
  stw   (r3)                                ; $0AE18D |
  inc   r3                                  ; $0AE18E |
  inc   r3                                  ; $0AE18F |
  sm    ($29CA),r3                          ; $0AE190 |
  with r2                                   ; $0AE194 |
  add   r2                                  ; $0AE195 |
  link  #4                                  ; $0AE196 |
  iwt   r15,#$D352                          ; $0AE197 |
  with r11                                  ; $0AE19A |
  lm    r3,($29CA)                          ; $0AE19B |
  lms   r0,($0000)                          ; $0AE19F |
  stw   (r3)                                ; $0AE1A2 |
  inc   r3                                  ; $0AE1A3 |
  inc   r3                                  ; $0AE1A4 |
  lms   r0,($0002)                          ; $0AE1A5 |
  stw   (r3)                                ; $0AE1A8 |
  inc   r3                                  ; $0AE1A9 |
  inc   r3                                  ; $0AE1AA |
  from r7                                   ; $0AE1AB |
  stw   (r3)                                ; $0AE1AC |
  inc   r3                                  ; $0AE1AD |
  inc   r3                                  ; $0AE1AE |
  from r6                                   ; $0AE1AF |
  stw   (r3)                                ; $0AE1B0 |
  inc   r3                                  ; $0AE1B1 |
  inc   r3                                  ; $0AE1B2 |
  sm    ($29CA),r3                          ; $0AE1B3 |
  with r2                                   ; $0AE1B7 |
  add   r2                                  ; $0AE1B8 |
  iwt   r0,#$11E0                           ; $0AE1B9 |
  to r4                                     ; $0AE1BC |
  add   r1                                  ; $0AE1BD |
  to r7                                     ; $0AE1BE |
  ldw   (r4)                                ; $0AE1BF |
  from r2                                   ; $0AE1C0 |
  and   #6                                  ; $0AE1C1 |
  beq CODE_0AE20B                           ; $0AE1C3 |
  nop                                       ; $0AE1C5 |
  ibt   r3,#$0001                           ; $0AE1C6 |
  sub   #4                                  ; $0AE1C8 |
  bpl CODE_0AE1CF                           ; $0AE1CA |
  nop                                       ; $0AE1CC |
  ibt   r3,#$FFFF                           ; $0AE1CD |

CODE_0AE1CF:
  xor   r7                                  ; $0AE1CF |
  bpl CODE_0AE20B                           ; $0AE1D1 |
  nop                                       ; $0AE1D3 |
  with r9                                   ; $0AE1D4 |
  add   r3                                  ; $0AE1D5 |
  iwt   r0,#$0F62                           ; $0AE1D6 |
  add   r1                                  ; $0AE1D9 |
  to r5                                     ; $0AE1DA |
  ldw   (r0)                                ; $0AE1DB |
  iwt   r0,#$00C0                           ; $0AE1DC |
  and   r5                                  ; $0AE1DF |
  beq CODE_0AE20B                           ; $0AE1E0 |
  inc   r2                                  ; $0AE1E2 |
  swap                                      ; $0AE1E3 |
  bmi CODE_0AE20A                           ; $0AE1E4 |
  sub   r0                                  ; $0AE1E6 |
  ldw   (r4)                                ; $0AE1E7 |
  to r11                                    ; $0AE1E8 |
  xor   r3                                  ; $0AE1E9 |
  bpl CODE_0AE20B                           ; $0AE1EB |
  not                                       ; $0AE1ED |
  with r5                                   ; $0AE1EE |
  swap                                      ; $0AE1EF |
  with r5                                   ; $0AE1F0 |
  and   #4                                  ; $0AE1F1 |
  beq CODE_0AE1F7                           ; $0AE1F3 |
  inc   r0                                  ; $0AE1F5 |
  sub   r0                                  ; $0AE1F6 |

CODE_0AE1F7:
  sbk                                       ; $0AE1F7 |
  iwt   r0,#$13C0                           ; $0AE1F8 |
  add   r1                                  ; $0AE1FB |
  ldw   (r0)                                ; $0AE1FC |
  xor   #2                                  ; $0AE1FD |
  sbk                                       ; $0AE1FF |
  iwt   r0,#$15A0                           ; $0AE200 |
  add   r1                                  ; $0AE203 |
  ldw   (r0)                                ; $0AE204 |
  not                                       ; $0AE205 |
  inc   r0                                  ; $0AE206 |
  bra CODE_0AE20B                           ; $0AE207 |
  sbk                                       ; $0AE209 |

CODE_0AE20A:
  stw   (r4)                                ; $0AE20A |

CODE_0AE20B:
  iwt   r15,#$E284                          ; $0AE20B |
  nop                                       ; $0AE20E |
  link  #4                                  ; $0AE20F |
  iwt   r15,#$D372                          ; $0AE210 |
  with r11                                  ; $0AE213 |
  lm    r3,($29CA)                          ; $0AE214 |
  iwt   r0,#$18C2                           ; $0AE218 |
  add   r1                                  ; $0AE21B |
  from r3                                   ; $0AE21C |
  stw   (r0)                                ; $0AE21D |
  lms   r0,($0000)                          ; $0AE21E |
  stw   (r3)                                ; $0AE221 |
  inc   r3                                  ; $0AE222 |
  inc   r3                                  ; $0AE223 |
  lms   r0,($0002)                          ; $0AE224 |
  stw   (r3)                                ; $0AE227 |
  inc   r3                                  ; $0AE228 |
  inc   r3                                  ; $0AE229 |
  from r7                                   ; $0AE22A |
  stw   (r3)                                ; $0AE22B |
  inc   r3                                  ; $0AE22C |
  inc   r3                                  ; $0AE22D |
  from r6                                   ; $0AE22E |
  stw   (r3)                                ; $0AE22F |
  inc   r3                                  ; $0AE230 |
  inc   r3                                  ; $0AE231 |
  sm    ($29CA),r3                          ; $0AE232 |
  with r2                                   ; $0AE236 |
  add   r2                                  ; $0AE237 |
  with r2                                   ; $0AE238 |
  add   r2                                  ; $0AE239 |
  ibt   r3,#$0001                           ; $0AE23A |
  link  #4                                  ; $0AE23C |
  iwt   r15,#$D3B0                          ; $0AE23D |
  alt2                                      ; $0AE240 |

  lm    r3,($29CA)                          ; $0AE241 |
  lms   r0,($0000)                          ; $0AE245 |
  stw   (r3)                                ; $0AE248 |
  inc   r3                                  ; $0AE249 |
  inc   r3                                  ; $0AE24A |
  lms   r0,($0002)                          ; $0AE24B |
  stw   (r3)                                ; $0AE24E |
  inc   r3                                  ; $0AE24F |
  inc   r3                                  ; $0AE250 |
  from r7                                   ; $0AE251 |
  stw   (r3)                                ; $0AE252 |
  inc   r3                                  ; $0AE253 |
  inc   r3                                  ; $0AE254 |
  from r6                                   ; $0AE255 |
  stw   (r3)                                ; $0AE256 |
  inc   r3                                  ; $0AE257 |
  inc   r3                                  ; $0AE258 |
  sm    ($29CA),r3                          ; $0AE259 |
  with r2                                   ; $0AE25D |
  add   r2                                  ; $0AE25E |
  ibt   r3,#$FFFF                           ; $0AE25F |
  link  #4                                  ; $0AE261 |
  iwt   r15,#$D3B0                          ; $0AE262 |
  alt2                                      ; $0AE265 |

  lm    r3,($29CA)                          ; $0AE266 |
  lms   r0,($0000)                          ; $0AE26A |
  stw   (r3)                                ; $0AE26D |
  inc   r3                                  ; $0AE26E |
  inc   r3                                  ; $0AE26F |
  lms   r0,($0002)                          ; $0AE270 |
  stw   (r3)                                ; $0AE273 |
  inc   r3                                  ; $0AE274 |
  inc   r3                                  ; $0AE275 |
  from r7                                   ; $0AE276 |
  stw   (r3)                                ; $0AE277 |
  inc   r3                                  ; $0AE278 |
  inc   r3                                  ; $0AE279 |
  from r6                                   ; $0AE27A |
  stw   (r3)                                ; $0AE27B |
  inc   r3                                  ; $0AE27C |
  inc   r3                                  ; $0AE27D |
  sm    ($29CA),r3                          ; $0AE27E |
  with r2                                   ; $0AE282 |
  add   r2                                  ; $0AE283 |
  ibt   r3,#$0010                           ; $0AE284 |
  link  #4                                  ; $0AE286 |
  iwt   r15,#$D1B5                          ; $0AE287 |
  alt2                                      ; $0AE28A |

  lm    r3,($29CA)                          ; $0AE28B |
  lms   r0,($0000)                          ; $0AE28F |
  stw   (r3)                                ; $0AE292 |
  inc   r3                                  ; $0AE293 |
  inc   r3                                  ; $0AE294 |
  lms   r0,($0002)                          ; $0AE295 |
  stw   (r3)                                ; $0AE298 |
  inc   r3                                  ; $0AE299 |
  inc   r3                                  ; $0AE29A |
  from r7                                   ; $0AE29B |
  stw   (r3)                                ; $0AE29C |
  inc   r3                                  ; $0AE29D |
  inc   r3                                  ; $0AE29E |
  from r6                                   ; $0AE29F |
  stw   (r3)                                ; $0AE2A0 |
  inc   r3                                  ; $0AE2A1 |
  inc   r3                                  ; $0AE2A2 |
  sm    ($29CA),r3                          ; $0AE2A3 |
  from r2                                   ; $0AE2A7 |
  lsr                                       ; $0AE2A8 |
  bcc CODE_0AE2B4                           ; $0AE2A9 |
  nop                                       ; $0AE2AB |
  inc   r10                                 ; $0AE2AC |
  iwt   r0,#$11E2                           ; $0AE2AD |
  to r4                                     ; $0AE2B0 |
  add   r1                                  ; $0AE2B1 |
  sub   r0                                  ; $0AE2B2 |
  stw   (r4)                                ; $0AE2B3 |

CODE_0AE2B4:
  with r2                                   ; $0AE2B4 |
  add   r2                                  ; $0AE2B5 |
  ibt   r3,#$FFF0                           ; $0AE2B6 |
  link  #4                                  ; $0AE2B8 |
  iwt   r15,#$D1B5                          ; $0AE2B9 |
  alt2                                      ; $0AE2BC |

  lm    r3,($29CA)                          ; $0AE2BD |
  lms   r0,($0000)                          ; $0AE2C1 |
  stw   (r3)                                ; $0AE2C4 |
  inc   r3                                  ; $0AE2C5 |
  inc   r3                                  ; $0AE2C6 |
  lms   r0,($0002)                          ; $0AE2C7 |
  stw   (r3)                                ; $0AE2CA |
  inc   r3                                  ; $0AE2CB |
  inc   r3                                  ; $0AE2CC |
  from r7                                   ; $0AE2CD |
  stw   (r3)                                ; $0AE2CE |
  inc   r3                                  ; $0AE2CF |
  inc   r3                                  ; $0AE2D0 |
  from r6                                   ; $0AE2D1 |
  stw   (r3)                                ; $0AE2D2 |
  inc   r3                                  ; $0AE2D3 |
  inc   r3                                  ; $0AE2D4 |
  sm    ($29CA),r3                          ; $0AE2D5 |
  from r2                                   ; $0AE2D9 |
  lsr                                       ; $0AE2DA |
  bcs CODE_0AE32E                           ; $0AE2DB |
  nop                                       ; $0AE2DD |
  iwt   r0,#$1820                           ; $0AE2DE |
  add   r1                                  ; $0AE2E1 |
  ldw   (r0)                                ; $0AE2E2 |
  lsr                                       ; $0AE2E3 |
  bcc CODE_0AE365                           ; $0AE2E4 |
  nop                                       ; $0AE2E6 |
  iwt   r0,#$0F63                           ; $0AE2E7 |
  add   r1                                  ; $0AE2EA |
  to r6                                     ; $0AE2EB |
  ldb   (r0)                                ; $0AE2EC |
  from r6                                   ; $0AE2EE |
  and   #3                                  ; $0AE2EF |
  beq CODE_0AE365                           ; $0AE2F1 |
  lsr                                       ; $0AE2F3 |
  iwt   r5,#$11E0                           ; $0AE2F4 |
  with r5                                   ; $0AE2F7 |
  add   r1                                  ; $0AE2F8 |
  to r5                                     ; $0AE2F9 |
  ldw   (r5)                                ; $0AE2FA |
  with r5                                   ; $0AE2FB |
  not                                       ; $0AE2FC |
  lsr                                       ; $0AE2FD |
  bcs CODE_0AE321                           ; $0AE2FE |
  inc   r5                                  ; $0AE300 |
  from r6                                   ; $0AE301 |
  and   #4                                  ; $0AE302 |
  bne CODE_0AE308                           ; $0AE304 |
  sub   r0                                  ; $0AE306 |
  from r5                                   ; $0AE307 |

CODE_0AE308:
  sbk                                       ; $0AE308 |
  ibt   r6,#$0000                           ; $0AE309 |
  iwt   r0,#$10A1                           ; $0AE30B |
  add   r1                                  ; $0AE30E |
  from r6                                   ; $0AE30F |
  stb   (r0)                                ; $0AE310 |
  iwt   r0,#$13C0                           ; $0AE312 |
  add   r1                                  ; $0AE315 |
  ldw   (r0)                                ; $0AE316 |
  xor   #2                                  ; $0AE317 |
  sbk                                       ; $0AE319 |
  iwt   r0,#$15A0                           ; $0AE31A |
  add   r1                                  ; $0AE31D |
  ldw   (r0)                                ; $0AE31E |
  not                                       ; $0AE31F |
  inc   r0                                  ; $0AE320 |

CODE_0AE321:
  sbk                                       ; $0AE321 |
  iwt   r0,#$272E                           ; $0AE322 |
  add   r1                                  ; $0AE325 |
  to r9                                     ; $0AE326 |
  ldw   (r0)                                ; $0AE327 |
  inc   r0                                  ; $0AE328 |
  inc   r0                                  ; $0AE329 |
  to r10                                    ; $0AE32A |
  bra CODE_0AE343                           ; $0AE32B |
  ldw   (r0)                                ; $0AE32D |

CODE_0AE32E:
  with r10                                  ; $0AE32E |
  add   r4                                  ; $0AE32F |
  ibt   r6,#$FFFF                           ; $0AE330 |
  iwt   r0,#$1141                           ; $0AE332 |
  add   r1                                  ; $0AE335 |
  from r6                                   ; $0AE336 |
  stb   (r0)                                ; $0AE337 |
  iwt   r0,#$272E                           ; $0AE339 |
  add   r1                                  ; $0AE33C |
  from r9                                   ; $0AE33D |
  stw   (r0)                                ; $0AE33E |
  inc   r0                                  ; $0AE33F |
  inc   r0                                  ; $0AE340 |
  from r10                                  ; $0AE341 |
  stw   (r0)                                ; $0AE342 |

CODE_0AE343:
  lms   r6,($0010)                          ; $0AE343 |
  iwt   r0,#$0EC2                           ; $0AE346 |
  add   r1                                  ; $0AE349 |
  from r6                                   ; $0AE34A |
  stb   (r0)                                ; $0AE34B |
  sub   r0                                  ; $0AE34D |
  sms   ($0010),r0                          ; $0AE34E |
  iwt   r0,#$0F62                           ; $0AE351 |
  add   r1                                  ; $0AE354 |
  ldw   (r0)                                ; $0AE355 |
  ibt   r6,#$0020                           ; $0AE356 |
  and   r6                                  ; $0AE358 |
  bne CODE_0AE365                           ; $0AE359 |
  nop                                       ; $0AE35B |
  iwt   r0,#$11E2                           ; $0AE35C |
  to r4                                     ; $0AE35F |
  add   r1                                  ; $0AE360 |
  iwt   r0,#$0100                           ; $0AE361 |
  stw   (r4)                                ; $0AE364 |

CODE_0AE365:
  lms   r5,($0010)                          ; $0AE365 |
  iwt   r0,#$268E                           ; $0AE368 |
  add   r1                                  ; $0AE36B |
  from r5                                   ; $0AE36C |
  stw   (r0)                                ; $0AE36D |
  iwt   r0,#$10A2                           ; $0AE36E |
  add   r1                                  ; $0AE371 |
  from r9                                   ; $0AE372 |
  stw   (r0)                                ; $0AE373 |
  iwt   r0,#$16E0                           ; $0AE374 |
  add   r1                                  ; $0AE377 |
  ldw   (r0)                                ; $0AE378 |
  with r10                                  ; $0AE379 |
  sub   r0                                  ; $0AE37A |
  iwt   r0,#$1142                           ; $0AE37B |
  add   r1                                  ; $0AE37E |
  from r10                                  ; $0AE37F |
  stw   (r0)                                ; $0AE380 |
  iwt   r15,#$D07F                          ; $0AE381 |
  inc   r1                                  ; $0AE384 |
  link  #4                                  ; $0AE385 |
  iwt   r15,#$D362                          ; $0AE386 |
  with r11                                  ; $0AE389 |

  move  r3,r11                              ; $0AE38A |
  link  #4                                  ; $0AE38C |
  iwt   r15,#$D401                          ; $0AE38D |
  ibt   r0,#$0023                           ; $0AE390 |
  to r11                                    ; $0AE392 |
  lm    r3,($29CA)                          ; $0AE393 |
  iwt   r0,#$18C2                           ; $0AE397 |
  add   r1                                  ; $0AE39A |
  from r3                                   ; $0AE39B |
  stw   (r0)                                ; $0AE39C |
  lms   r0,($0000)                          ; $0AE39D |
  stw   (r3)                                ; $0AE3A0 |
  inc   r3                                  ; $0AE3A1 |
  inc   r3                                  ; $0AE3A2 |
  lms   r0,($0002)                          ; $0AE3A3 |
  stw   (r3)                                ; $0AE3A6 |
  inc   r3                                  ; $0AE3A7 |
  inc   r3                                  ; $0AE3A8 |
  from r7                                   ; $0AE3A9 |
  stw   (r3)                                ; $0AE3AA |
  inc   r3                                  ; $0AE3AB |
  inc   r3                                  ; $0AE3AC |
  from r6                                   ; $0AE3AD |
  stw   (r3)                                ; $0AE3AE |
  inc   r3                                  ; $0AE3AF |
  inc   r3                                  ; $0AE3B0 |
  sm    ($29CA),r3                          ; $0AE3B1 |
  with r2                                   ; $0AE3B5 |
  add   r2                                  ; $0AE3B6 |
  with r2                                   ; $0AE3B7 |
  add   r2                                  ; $0AE3B8 |
  link  #4                                  ; $0AE3B9 |
  iwt   r15,#$D362                          ; $0AE3BA |
  with r11                                  ; $0AE3BD |
  lm    r3,($29CA)                          ; $0AE3BE |
  bra CODE_0AE3D4                           ; $0AE3C2 |
  nop                                       ; $0AE3C4 |

  link  #4                                  ; $0AE3C5 |
  iwt   r15,#$D362                          ; $0AE3C6 |
  with r11                                  ; $0AE3C9 |
  lm    r3,($29CA)                          ; $0AE3CA |
  iwt   r0,#$18C2                           ; $0AE3CE |
  add   r1                                  ; $0AE3D1 |
  from r3                                   ; $0AE3D2 |
  stw   (r0)                                ; $0AE3D3 |

CODE_0AE3D4:
  lms   r0,($0000)                          ; $0AE3D4 |
  stw   (r3)                                ; $0AE3D7 |
  inc   r3                                  ; $0AE3D8 |
  inc   r3                                  ; $0AE3D9 |
  lms   r0,($0002)                          ; $0AE3DA |
  stw   (r3)                                ; $0AE3DD |
  inc   r3                                  ; $0AE3DE |
  inc   r3                                  ; $0AE3DF |
  from r7                                   ; $0AE3E0 |
  stw   (r3)                                ; $0AE3E1 |
  inc   r3                                  ; $0AE3E2 |
  inc   r3                                  ; $0AE3E3 |
  from r6                                   ; $0AE3E4 |
  stw   (r3)                                ; $0AE3E5 |
  inc   r3                                  ; $0AE3E6 |
  inc   r3                                  ; $0AE3E7 |
  sm    ($29CA),r3                          ; $0AE3E8 |
  with r2                                   ; $0AE3EC |
  add   r2                                  ; $0AE3ED |
  link  #4                                  ; $0AE3EE |
  iwt   r15,#$D362                          ; $0AE3EF |
  with r11                                  ; $0AE3F2 |
  lm    r3,($29CA)                          ; $0AE3F3 |
  lms   r0,($0000)                          ; $0AE3F7 |
  stw   (r3)                                ; $0AE3FA |
  inc   r3                                  ; $0AE3FB |
  inc   r3                                  ; $0AE3FC |
  lms   r0,($0002)                          ; $0AE3FD |
  stw   (r3)                                ; $0AE400 |
  inc   r3                                  ; $0AE401 |
  inc   r3                                  ; $0AE402 |
  from r7                                   ; $0AE403 |
  stw   (r3)                                ; $0AE404 |
  inc   r3                                  ; $0AE405 |
  inc   r3                                  ; $0AE406 |
  from r6                                   ; $0AE407 |
  stw   (r3)                                ; $0AE408 |
  inc   r3                                  ; $0AE409 |
  inc   r3                                  ; $0AE40A |
  sm    ($29CA),r3                          ; $0AE40B |
  with r2                                   ; $0AE40F |
  add   r2                                  ; $0AE410 |
  link  #4                                  ; $0AE411 |
  iwt   r15,#$D362                          ; $0AE412 |
  with r11                                  ; $0AE415 |
  lm    r3,($29CA)                          ; $0AE416 |
  lms   r0,($0000)                          ; $0AE41A |
  stw   (r3)                                ; $0AE41D |
  inc   r3                                  ; $0AE41E |
  inc   r3                                  ; $0AE41F |
  lms   r0,($0002)                          ; $0AE420 |
  stw   (r3)                                ; $0AE423 |
  inc   r3                                  ; $0AE424 |
  inc   r3                                  ; $0AE425 |
  from r7                                   ; $0AE426 |
  stw   (r3)                                ; $0AE427 |
  inc   r3                                  ; $0AE428 |
  inc   r3                                  ; $0AE429 |
  from r6                                   ; $0AE42A |
  stw   (r3)                                ; $0AE42B |
  inc   r3                                  ; $0AE42C |
  inc   r3                                  ; $0AE42D |
  sm    ($29CA),r3                          ; $0AE42E |
  with r2                                   ; $0AE432 |
  add   r2                                  ; $0AE433 |
  link  #4                                  ; $0AE434 |
  iwt   r15,#$D362                          ; $0AE435 |
  with r11                                  ; $0AE438 |
  lm    r3,($29CA)                          ; $0AE439 |
  lms   r0,($0000)                          ; $0AE43D |
  stw   (r3)                                ; $0AE440 |
  inc   r3                                  ; $0AE441 |
  inc   r3                                  ; $0AE442 |
  lms   r0,($0002)                          ; $0AE443 |
  stw   (r3)                                ; $0AE446 |
  inc   r3                                  ; $0AE447 |
  inc   r3                                  ; $0AE448 |
  from r7                                   ; $0AE449 |
  stw   (r3)                                ; $0AE44A |
  inc   r3                                  ; $0AE44B |
  inc   r3                                  ; $0AE44C |
  from r6                                   ; $0AE44D |
  stw   (r3)                                ; $0AE44E |
  inc   r3                                  ; $0AE44F |
  inc   r3                                  ; $0AE450 |
  sm    ($29CA),r3                          ; $0AE451 |
  iwt   r15,#$D07F                          ; $0AE455 |
  inc   r1                                  ; $0AE458 |
  link  #4                                  ; $0AE459 |
  iwt   r15,#$D372                          ; $0AE45A |
  with r11                                  ; $0AE45D |
  lm    r3,($29CA)                          ; $0AE45E |
  iwt   r0,#$18C2                           ; $0AE462 |
  add   r1                                  ; $0AE465 |
  from r3                                   ; $0AE466 |
  stw   (r0)                                ; $0AE467 |
  lms   r0,($0000)                          ; $0AE468 |
  stw   (r3)                                ; $0AE46B |
  inc   r3                                  ; $0AE46C |
  inc   r3                                  ; $0AE46D |
  lms   r0,($0002)                          ; $0AE46E |
  stw   (r3)                                ; $0AE471 |
  inc   r3                                  ; $0AE472 |
  inc   r3                                  ; $0AE473 |
  from r7                                   ; $0AE474 |
  stw   (r3)                                ; $0AE475 |
  inc   r3                                  ; $0AE476 |
  inc   r3                                  ; $0AE477 |
  from r6                                   ; $0AE478 |
  stw   (r3)                                ; $0AE479 |
  inc   r3                                  ; $0AE47A |
  inc   r3                                  ; $0AE47B |
  sm    ($29CA),r3                          ; $0AE47C |
  iwt   r15,#$D07F                          ; $0AE480 |
  inc   r1                                  ; $0AE483 |
  from r6                                   ; $0AE484 |
  hib                                       ; $0AE485 |
  ibt   r5,#$007A                           ; $0AE486 |
  sub   r5                                  ; $0AE488 |
  bne CODE_0AE4B8                           ; $0AE489 |
  nop                                       ; $0AE48B |
  iwt   r4,#$0400                           ; $0AE48C |
  iwt   r5,#$FC00                           ; $0AE48F |
  lms   r0,($003E)                          ; $0AE492 |
  not                                       ; $0AE495 |
  inc   r0                                  ; $0AE496 |
  add   r0                                  ; $0AE497 |
  cmp   r4                                  ; $0AE498 |
  bmi CODE_0AE49F                           ; $0AE49A |
  nop                                       ; $0AE49C |
  move  r0,r4                               ; $0AE49D |

CODE_0AE49F:
  cmp   r5                                  ; $0AE49F |
  bpl CODE_0AE4A6                           ; $0AE4A1 |
  nop                                       ; $0AE4A3 |
  move  r0,r5                               ; $0AE4A4 |

CODE_0AE4A6:
  sbk                                       ; $0AE4A6 |
  moves r3,r3                               ; $0AE4A7 |
  bne CODE_0AE4B1                           ; $0AE4A9 |
  sm    ($1220),r0                          ; $0AE4AB |
  jmp   r11                                 ; $0AE4AF |
  nop                                       ; $0AE4B0 |

CODE_0AE4B1:
  sm    ($1222),r0                          ; $0AE4B1 |
  with r2                                   ; $0AE4B5 |
  bic   #1                                  ; $0AE4B6 |

CODE_0AE4B8:
  jmp   r11                                 ; $0AE4B8 |
  nop                                       ; $0AE4B9 |

  link  #4                                  ; $0AE4BA |
  iwt   r15,#$D372                          ; $0AE4BB |
  with r11                                  ; $0AE4BE |
  with r2                                   ; $0AE4BF |
  add   r2                                  ; $0AE4C0 |
  with r2                                   ; $0AE4C1 |
  add   r2                                  ; $0AE4C2 |
  lm    r0,($1220)                          ; $0AE4C3 |
  sms   ($003E),r0                          ; $0AE4C7 |
  dec   r0                                  ; $0AE4CA |
  bpl CODE_0AE4EB                           ; $0AE4CB |
  nop                                       ; $0AE4CD |
  ibt   r3,#$0001                           ; $0AE4CE |
  link  #4                                  ; $0AE4D0 |
  iwt   r15,#$D3B0                          ; $0AE4D1 |
  sms   ($0000),r3                          ; $0AE4D4 |
  link  #4                                  ; $0AE4D7 |
  iwt   r15,#$E484                          ; $0AE4D8 |
  nop                                       ; $0AE4DB |
  lm    r0,($1220)                          ; $0AE4DC |
  sub   #0                                  ; $0AE4E0 |
  beq CODE_0AE4EE                           ; $0AE4E2 |
  with r2                                   ; $0AE4E4 |
  add   r2                                  ; $0AE4E5 |
  inc   r14                                 ; $0AE4E6 |
  inc   r14                                 ; $0AE4E7 |
  bra CODE_0AE4FE                           ; $0AE4E8 |
  with r2                                   ; $0AE4EA |

CODE_0AE4EB:
  inc   r14                                 ; $0AE4EB |
  inc   r14                                 ; $0AE4EC |
  with r2                                   ; $0AE4ED |

CODE_0AE4EE:
  add   r2                                  ; $0AE4EE |
  ibt   r3,#$FFFF                           ; $0AE4EF |
  link  #4                                  ; $0AE4F1 |
  iwt   r15,#$D3B0                          ; $0AE4F2 |
  sms   ($0000),r3                          ; $0AE4F5 |
  link  #4                                  ; $0AE4F8 |
  iwt   r15,#$E484                          ; $0AE4F9 |
  nop                                       ; $0AE4FC |
  with r2                                   ; $0AE4FD |

CODE_0AE4FE:
  add   r2                                  ; $0AE4FE |
  lm    r0,($1222)                          ; $0AE4FF |
  sms   ($003E),r0                          ; $0AE503 |
  ibt   r3,#$0010                           ; $0AE506 |
  link  #4                                  ; $0AE508 |
  iwt   r15,#$D1A3                          ; $0AE509 |
  alt2                                      ; $0AE50C |

  from r2                                   ; $0AE50D |
  lsr                                       ; $0AE50E |
  bcc CODE_0AE51F                           ; $0AE50F |
  nop                                       ; $0AE511 |
  inc   r10                                 ; $0AE512 |
  sub   r0                                  ; $0AE513 |
  sm    ($1222),r0                          ; $0AE514 |
  ibt   r3,#$0001                           ; $0AE518 |
  link  #4                                  ; $0AE51A |
  iwt   r15,#$E484                          ; $0AE51B |
  nop                                       ; $0AE51E |

CODE_0AE51F:
  with r2                                   ; $0AE51F |
  add   r2                                  ; $0AE520 |
  ibt   r3,#$FFF0                           ; $0AE521 |
  link  #4                                  ; $0AE523 |
  iwt   r15,#$D1B5                          ; $0AE524 |
  alt2                                      ; $0AE527 |

  from r2                                   ; $0AE528 |
  lsr                                       ; $0AE529 |
  bcc CODE_0AE534                           ; $0AE52A |
  from r7                                   ; $0AE52C |
  and   #1                                  ; $0AE52D |
  beq CODE_0AE537                           ; $0AE52F |
  with r2                                   ; $0AE531 |
  bic   #1                                  ; $0AE532 |

CODE_0AE534:
  bra CODE_0AE565                           ; $0AE534 |
  nop                                       ; $0AE536 |

CODE_0AE537:
  with r10                                  ; $0AE537 |
  add   r4                                  ; $0AE538 |
  ibt   r3,#$FFFF                           ; $0AE539 |
  iwt   r0,#$1141                           ; $0AE53B |
  add   r1                                  ; $0AE53E |
  from r3                                   ; $0AE53F |
  stb   (r0)                                ; $0AE540 |
  iwt   r0,#$272E                           ; $0AE542 |
  add   r1                                  ; $0AE545 |
  from r9                                   ; $0AE546 |
  stw   (r0)                                ; $0AE547 |
  inc   r0                                  ; $0AE548 |
  inc   r0                                  ; $0AE549 |
  from r10                                  ; $0AE54A |
  stw   (r0)                                ; $0AE54B |
  lms   r3,($0010)                          ; $0AE54C |
  sm    ($0F02),r3                          ; $0AE54F |
  sub   r0                                  ; $0AE553 |
  sms   ($0010),r0                          ; $0AE554 |
  iwt   r0,#$0100                           ; $0AE557 |
  sm    ($1222),r0                          ; $0AE55A |
  ibt   r3,#$0001                           ; $0AE55E |
  link  #4                                  ; $0AE560 |
  iwt   r15,#$E484                          ; $0AE561 |
  nop                                       ; $0AE564 |

CODE_0AE565:
  lms   r5,($0010)                          ; $0AE565 |
  iwt   r0,#$268E                           ; $0AE568 |
  add   r1                                  ; $0AE56B |
  from r5                                   ; $0AE56C |
  stw   (r0)                                ; $0AE56D |
  sm    ($10E2),r9                          ; $0AE56E |
  lm    r0,($1720)                          ; $0AE572 |
  with r10                                  ; $0AE576 |
  sub   r0                                  ; $0AE577 |
  sm    ($1182),r10                         ; $0AE578 |
  iwt   r15,#$D07F                          ; $0AE57C |
  inc   r1                                  ; $0AE57F |
  iwt   r0,#$11E0                           ; $0AE580 |
  add   r1                                  ; $0AE583 |
  ldw   (r0)                                ; $0AE584 |
  dec   r0                                  ; $0AE585 |
  bpl CODE_0AE59F                           ; $0AE586 |
  with r2                                   ; $0AE588 |
  ibt   r3,#$0001                           ; $0AE589 |
  link  #4                                  ; $0AE58B |
  iwt   r15,#$D387                          ; $0AE58C |
  sm    ($11E0),r0                          ; $0AE58F |
  add   r1                                  ; $0AE593 |
  ldw   (r0)                                ; $0AE594 |
  sub   #0                                  ; $0AE595 |
  beq CODE_0AE59F                           ; $0AE597 |
  with r2                                   ; $0AE599 |
  add   r2                                  ; $0AE59A |
  bra CODE_0AE5A8                           ; $0AE59B |
  with r2                                   ; $0AE59D |

  with r2                                   ; $0AE59E |

CODE_0AE59F:
  add   r2                                  ; $0AE59F |
  ibt   r3,#$FFFF                           ; $0AE5A0 |
  link  #4                                  ; $0AE5A2 |
  iwt   r15,#$D387                          ; $0AE5A3 |
  alt2                                      ; $0AE5A6 |
  with r2                                   ; $0AE5A7 |

CODE_0AE5A8:
  add   r2                                  ; $0AE5A8 |
  with r2                                   ; $0AE5A9 |
  add   r2                                  ; $0AE5AA |
  ibt   r3,#$FFF0                           ; $0AE5AB |
  link  #4                                  ; $0AE5AD |
  iwt   r15,#$D169                          ; $0AE5AE |
  alt2                                      ; $0AE5B1 |

  from r2                                   ; $0AE5B2 |
  lsr                                       ; $0AE5B3 |
  bcc CODE_0AE5E2                           ; $0AE5B4 |
  with r10                                  ; $0AE5B6 |
  add   r4                                  ; $0AE5B7 |
  ibt   r3,#$FFFF                           ; $0AE5B8 |
  iwt   r0,#$1141                           ; $0AE5BA |
  add   r1                                  ; $0AE5BD |
  from r3                                   ; $0AE5BE |
  stb   (r0)                                ; $0AE5BF |
  iwt   r0,#$272E                           ; $0AE5C1 |
  add   r1                                  ; $0AE5C4 |
  from r9                                   ; $0AE5C5 |
  stw   (r0)                                ; $0AE5C6 |
  inc   r0                                  ; $0AE5C7 |
  inc   r0                                  ; $0AE5C8 |
  from r10                                  ; $0AE5C9 |
  stw   (r0)                                ; $0AE5CA |
  lms   r3,($0010)                          ; $0AE5CB |
  iwt   r0,#$0EC2                           ; $0AE5CE |
  add   r1                                  ; $0AE5D1 |
  from r3                                   ; $0AE5D2 |
  stb   (r0)                                ; $0AE5D3 |
  sub   r0                                  ; $0AE5D5 |
  sms   ($0010),r0                          ; $0AE5D6 |
  iwt   r3,#$0100                           ; $0AE5D9 |
  iwt   r0,#$1222                           ; $0AE5DC |
  add   r1                                  ; $0AE5DF |
  from r3                                   ; $0AE5E0 |
  stw   (r0)                                ; $0AE5E1 |

CODE_0AE5E2:
  lms   r5,($0010)                          ; $0AE5E2 |
  iwt   r0,#$268E                           ; $0AE5E5 |
  add   r1                                  ; $0AE5E8 |
  from r5                                   ; $0AE5E9 |
  stw   (r0)                                ; $0AE5EA |
  iwt   r0,#$10A2                           ; $0AE5EB |
  add   r1                                  ; $0AE5EE |
  from r9                                   ; $0AE5EF |
  stw   (r0)                                ; $0AE5F0 |
  iwt   r0,#$16E0                           ; $0AE5F1 |
  add   r1                                  ; $0AE5F4 |
  ldw   (r0)                                ; $0AE5F5 |
  with r10                                  ; $0AE5F6 |
  sub   r0                                  ; $0AE5F7 |
  iwt   r0,#$1142                           ; $0AE5F8 |
  add   r1                                  ; $0AE5FB |
  from r10                                  ; $0AE5FC |
  stw   (r0)                                ; $0AE5FD |
  iwt   r15,#$D07F                          ; $0AE5FE |
  inc   r1                                  ; $0AE601 |
  ibt   r0,#$000B                           ; $0AE602 |
  romb                                      ; $0AE604 |
  iwt   r0,#$1860                           ; $0AE606 |
  add   r10                                 ; $0AE609 |
  to r6                                     ; $0AE60A |
  ldw   (r0)                                ; $0AE60B |
  from r6                                   ; $0AE60C |
  and   r7                                  ; $0AE60D |
  bne CODE_0AE629                           ; $0AE60E |
  from r6                                   ; $0AE610 |
  and   #15                                 ; $0AE611 |
  beq CODE_0AE61E                           ; $0AE613 |
  link  #4                                  ; $0AE615 |
  iwt   r15,#$E694                          ; $0AE616 |
  nop                                       ; $0AE619 |
  sub   r0                                  ; $0AE61A |
  stop                                      ; $0AE61B |
  nop                                       ; $0AE61C |

  link  #4                                  ; $0AE61D |

CODE_0AE61E:
  iwt   r15,#$E6B5                          ; $0AE61E |
  nop                                       ; $0AE621 |
  with r4                                   ; $0AE622 |
  add   #10                                 ; $0AE623 |
  ibt   r0,#$000B                           ; $0AE625 |
  romb                                      ; $0AE627 |

CODE_0AE629:
  ibt   r6,#$0000                           ; $0AE629 |
  iwt   r0,#$19D7                           ; $0AE62B |
  add   r10                                 ; $0AE62E |
  from r6                                   ; $0AE62F |
  stb   (r0)                                ; $0AE630 |
  iwt   r0,#$8843                           ; $0AE632 |
  to r14                                    ; $0AE635 |
  add   r4                                  ; $0AE636 |
  to r6                                     ; $0AE637 |
  getbs                                     ; $0AE638 |
  iwt   r0,#$1220                           ; $0AE63A |
  add   r10                                 ; $0AE63D |
  from r6                                   ; $0AE63E |
  stw   (r0)                                ; $0AE63F |
  iwt   r0,#$886B                           ; $0AE640 |
  to r14                                    ; $0AE643 |
  add   r4                                  ; $0AE644 |
  to r6                                     ; $0AE645 |
  getbs                                     ; $0AE646 |
  iwt   r0,#$1222                           ; $0AE648 |
  add   r10                                 ; $0AE64B |
  from r6                                   ; $0AE64C |
  stw   (r0)                                ; $0AE64D |
  iwt   r0,#$8893                           ; $0AE64E |
  to r14                                    ; $0AE651 |
  add   r4                                  ; $0AE652 |
  to r6                                     ; $0AE653 |
  getb                                      ; $0AE654 |
  iwt   r0,#$1902                           ; $0AE655 |
  add   r10                                 ; $0AE658 |
  from r6                                   ; $0AE659 |
  stw   (r0)                                ; $0AE65A |
  iwt   r0,#$88BB                           ; $0AE65B |
  to r14                                    ; $0AE65E |
  add   r4                                  ; $0AE65F |
  getb                                      ; $0AE660 |
  to r6                                     ; $0AE661 |
  and   #1                                  ; $0AE662 |
  beq CODE_0AE66A                           ; $0AE664 |
  nop                                       ; $0AE666 |
  swap                                      ; $0AE667 |
  inc   r0                                  ; $0AE668 |
  swap                                      ; $0AE669 |

CODE_0AE66A:
  bic   #1                                  ; $0AE66A |
  sms   ($0018),r0                          ; $0AE66C |
  iwt   r0,#$88E3                           ; $0AE66F |
  to r14                                    ; $0AE672 |
  add   r4                                  ; $0AE673 |
  to r6                                     ; $0AE674 |
  getbs                                     ; $0AE675 |
  iwt   r0,#$10E2                           ; $0AE677 |
  add   r10                                 ; $0AE67A |
  ldw   (r0)                                ; $0AE67B |
  bic   #15                                 ; $0AE67C |
  add   r6                                  ; $0AE67E |
  sbk                                       ; $0AE67F |
  iwt   r0,#$890B                           ; $0AE680 |
  to r14                                    ; $0AE683 |
  add   r4                                  ; $0AE684 |
  to r6                                     ; $0AE685 |
  getbs                                     ; $0AE686 |
  iwt   r0,#$1182                           ; $0AE688 |
  add   r10                                 ; $0AE68B |
  ldw   (r0)                                ; $0AE68C |
  bic   #15                                 ; $0AE68D |
  add   r6                                  ; $0AE68F |
  sbk                                       ; $0AE690 |
  sub   r0                                  ; $0AE691 |
  stop                                      ; $0AE692 |
  nop                                       ; $0AE693 |

  from r3                                   ; $0AE694 |
  sub   #11                                 ; $0AE695 |
  beq CODE_0AE6BB                           ; $0AE697 |
  sub   r0                                  ; $0AE699 |

CODE_0AE69A:
  sms   ($001C),r0                          ; $0AE69A |
  sms   ($0008),r4                          ; $0AE69D |
  iwt   r0,#$8997                           ; $0AE6A0 |
  to r14                                    ; $0AE6A3 |
  add   r4                                  ; $0AE6A4 |
  getb                                      ; $0AE6A5 |
  iwt   r6,#$10E2                           ; $0AE6A6 |
  with r6                                   ; $0AE6A9 |
  add   r10                                 ; $0AE6AA |
  to r6                                     ; $0AE6AB |
  ldw   (r6)                                ; $0AE6AC |
  to r8                                     ; $0AE6AD |
  add   r6                                  ; $0AE6AE |
  iwt   r0,#$89A1                           ; $0AE6AF |
  bra CODE_0AE6D9                           ; $0AE6B2 |
  to r14                                    ; $0AE6B4 |

  from r3                                   ; $0AE6B5 |
  sub   #1                                  ; $0AE6B6 |
  beq CODE_0AE69A                           ; $0AE6B8 |
  sub   r0                                  ; $0AE6BA |

CODE_0AE6BB:
  ibt   r0,#$000A                           ; $0AE6BB |
  sms   ($001C),r0                          ; $0AE6BD |
  sms   ($0008),r4                          ; $0AE6C0 |
  from r7                                   ; $0AE6C3 |
  to r4                                     ; $0AE6C4 |
  asr                                       ; $0AE6C5 |
  iwt   r0,#$89AB                           ; $0AE6C6 |
  to r14                                    ; $0AE6C9 |
  add   r4                                  ; $0AE6CA |
  getb                                      ; $0AE6CB |
  iwt   r6,#$10E2                           ; $0AE6CC |
  with r6                                   ; $0AE6CF |
  add   r10                                 ; $0AE6D0 |
  to r6                                     ; $0AE6D1 |
  ldw   (r6)                                ; $0AE6D2 |
  to r8                                     ; $0AE6D3 |
  add   r6                                  ; $0AE6D4 |
  iwt   r0,#$89B0                           ; $0AE6D5 |
  to r14                                    ; $0AE6D8 |

CODE_0AE6D9:
  add   r4                                  ; $0AE6D9 |
  getb                                      ; $0AE6DA |
  iwt   r6,#$1182                           ; $0AE6DB |
  with r6                                   ; $0AE6DE |
  add   r10                                 ; $0AE6DF |
  to r6                                     ; $0AE6E0 |
  ldw   (r6)                                ; $0AE6E1 |
  add   r6                                  ; $0AE6E2 |
  sms   ($0020),r10                         ; $0AE6E3 |
  sms   ($006A),r11                         ; $0AE6E6 |
  ibt   r6,#$000A                           ; $0AE6E9 |
  from r6                                   ; $0AE6EB |
  romb                                      ; $0AE6EC |
  link  #4                                  ; $0AE6EE |
  iwt   r15,#$D096                          ; $0AE6EF |
  lms   r0,($0016)                          ; $0AE6F2 |
  romb                                      ; $0AE6F5 |
  lms   r11,($006A)                         ; $0AE6F7 |
  lms   r10,($0020)                         ; $0AE6FA |
  lms   r4,($0008)                          ; $0AE6FD |
  from r7                                   ; $0AE700 |
  and   #4                                  ; $0AE701 |
  bne CODE_0AE70A                           ; $0AE703 |
  nop                                       ; $0AE705 |
  iwt   r15,#$E7AC                          ; $0AE706 |
  nop                                       ; $0AE709 |

CODE_0AE70A:
  lms   r0,($001C)                          ; $0AE70A |
  with r4                                   ; $0AE70D |
  add   r0                                  ; $0AE70E |
  iwt   r0,#$8933                           ; $0AE70F |
  to r14                                    ; $0AE712 |
  add   r4                                  ; $0AE713 |
  to r6                                     ; $0AE714 |
  getbs                                     ; $0AE715 |
  iwt   r0,#$1220                           ; $0AE717 |
  add   r10                                 ; $0AE71A |
  from r6                                   ; $0AE71B |
  stw   (r0)                                ; $0AE71C |
  iwt   r0,#$8947                           ; $0AE71D |
  to r14                                    ; $0AE720 |
  add   r4                                  ; $0AE721 |
  to r6                                     ; $0AE722 |
  getbs                                     ; $0AE723 |
  iwt   r0,#$1222                           ; $0AE725 |
  add   r10                                 ; $0AE728 |
  from r6                                   ; $0AE729 |
  stw   (r0)                                ; $0AE72A |
  iwt   r0,#$895B                           ; $0AE72B |
  to r14                                    ; $0AE72E |
  add   r4                                  ; $0AE72F |
  getb                                      ; $0AE730 |
  to r6                                     ; $0AE731 |
  and   #1                                  ; $0AE732 |
  beq CODE_0AE73A                           ; $0AE734 |
  nop                                       ; $0AE736 |
  swap                                      ; $0AE737 |
  inc   r0                                  ; $0AE738 |
  swap                                      ; $0AE739 |

CODE_0AE73A:
  bic   #1                                  ; $0AE73A |
  sms   ($0018),r0                          ; $0AE73C |
  iwt   r0,#$19D7                           ; $0AE73F |
  add   r10                                 ; $0AE742 |
  ldb   (r0)                                ; $0AE743 |
  sub   #0                                  ; $0AE745 |
  bne CODE_0AE7AA                           ; $0AE747 |
  sub   r0                                  ; $0AE749 |
  iwt   r0,#$896F                           ; $0AE74A |
  to r14                                    ; $0AE74D |
  add   r4                                  ; $0AE74E |
  to r6                                     ; $0AE74F |
  getb                                      ; $0AE750 |
  iwt   r0,#$10E2                           ; $0AE751 |
  add   r10                                 ; $0AE754 |
  ldw   (r0)                                ; $0AE755 |
  bic   #15                                 ; $0AE756 |
  or    r6                                  ; $0AE758 |
  sbk                                       ; $0AE759 |
  iwt   r0,#$8983                           ; $0AE75A |
  to r14                                    ; $0AE75D |
  add   r4                                  ; $0AE75E |
  to r6                                     ; $0AE75F |
  getb                                      ; $0AE760 |
  iwt   r0,#$1182                           ; $0AE761 |
  add   r10                                 ; $0AE764 |
  ldw   (r0)                                ; $0AE765 |
  bic   #15                                 ; $0AE766 |
  or    r6                                  ; $0AE768 |
  sbk                                       ; $0AE769 |
  ibt   r6,#$0000                           ; $0AE76A |
  iwt   r0,#$10E1                           ; $0AE76C |
  add   r10                                 ; $0AE76F |
  from r6                                   ; $0AE770 |
  stb   (r0)                                ; $0AE771 |
  iwt   r0,#$1181                           ; $0AE773 |
  add   r10                                 ; $0AE776 |
  from r6                                   ; $0AE777 |
  stb   (r0)                                ; $0AE778 |
  ibt   r6,#$FFFF                           ; $0AE77A |
  iwt   r0,#$1220                           ; $0AE77C |
  add   r10                                 ; $0AE77F |
  ldw   (r0)                                ; $0AE780 |
  sub   #0                                  ; $0AE781 |
  bpl CODE_0AE78D                           ; $0AE783 |
  nop                                       ; $0AE785 |
  iwt   r0,#$10E1                           ; $0AE786 |
  add   r10                                 ; $0AE789 |
  from r6                                   ; $0AE78A |
  stb   (r0)                                ; $0AE78B |

CODE_0AE78D:
  iwt   r0,#$1222                           ; $0AE78D |
  add   r10                                 ; $0AE790 |
  ldw   (r0)                                ; $0AE791 |
  sub   #0                                  ; $0AE792 |
  bpl CODE_0AE79E                           ; $0AE794 |
  nop                                       ; $0AE796 |
  iwt   r0,#$1181                           ; $0AE797 |
  add   r10                                 ; $0AE79A |
  from r6                                   ; $0AE79B |
  stb   (r0)                                ; $0AE79C |

CODE_0AE79E:
  lms   r6,($001C)                          ; $0AE79E |
  inc   r6                                  ; $0AE7A1 |
  iwt   r0,#$19D7                           ; $0AE7A2 |
  add   r10                                 ; $0AE7A5 |
  from r6                                   ; $0AE7A6 |
  stb   (r0)                                ; $0AE7A7 |
  sub   r0                                  ; $0AE7A9 |

CODE_0AE7AA:
  stop                                      ; $0AE7AA |
  nop                                       ; $0AE7AB |

  iwt   r0,#$19D7                           ; $0AE7AC |
  add   r10                                 ; $0AE7AF |
  to r3                                     ; $0AE7B0 |
  ldb   (r0)                                ; $0AE7B1 |
  moves r3,r3                               ; $0AE7B3 |
  beq CODE_0AE816                           ; $0AE7B5 |
  nop                                       ; $0AE7B7 |
  dec   r3                                  ; $0AE7B8 |
  beq CODE_0AE807                           ; $0AE7B9 |
  nop                                       ; $0AE7BB |
  iwt   r0,#$19D9                           ; $0AE7BC |
  add   r10                                 ; $0AE7BF |
  to r6                                     ; $0AE7C0 |
  ldb   (r0)                                ; $0AE7C1 |
  iwt   r0,#$1860                           ; $0AE7C3 |
  add   r10                                 ; $0AE7C6 |
  ldw   (r0)                                ; $0AE7C7 |
  moves r6,r6                               ; $0AE7C8 |
  beq CODE_0AE7D0                           ; $0AE7CA |
  nop                                       ; $0AE7CC |
  add   #15                                 ; $0AE7CD |
  inc   r0                                  ; $0AE7CF |

CODE_0AE7D0:
  iwt   r6,#$89B5                           ; $0AE7D0 |
  to r14                                    ; $0AE7D3 |
  add   r6                                  ; $0AE7D4 |
  to r4                                     ; $0AE7D5 |
  getbs                                     ; $0AE7D6 |
  moves r4,r4                               ; $0AE7D8 |
  bmi CODE_0AE7AA                           ; $0AE7DA |
  sub   r0                                  ; $0AE7DC |
  from r4                                   ; $0AE7DD |
  add   r4                                  ; $0AE7DE |
  sex                                       ; $0AE7DF |
  bmi CODE_0AE807                           ; $0AE7E0 |
  nop                                       ; $0AE7E2 |
  iwt   r0,#$89D5                           ; $0AE7E3 |
  to r14                                    ; $0AE7E6 |
  add   r4                                  ; $0AE7E7 |
  getbs                                     ; $0AE7E8 |
  iwt   r6,#$10E2                           ; $0AE7EA |
  with r6                                   ; $0AE7ED |
  add   r10                                 ; $0AE7EE |
  to r6                                     ; $0AE7EF |
  ldw   (r6)                                ; $0AE7F0 |
  add   r6                                  ; $0AE7F1 |
  sbk                                       ; $0AE7F2 |
  iwt   r0,#$89DF                           ; $0AE7F3 |
  to r14                                    ; $0AE7F6 |
  add   r4                                  ; $0AE7F7 |
  getbs                                     ; $0AE7F8 |
  iwt   r6,#$1182                           ; $0AE7FA |
  with r6                                   ; $0AE7FD |
  add   r10                                 ; $0AE7FE |
  to r6                                     ; $0AE7FF |
  ldw   (r6)                                ; $0AE800 |
  add   r6                                  ; $0AE801 |
  sbk                                       ; $0AE802 |
  iwt   r15,#$E62A                          ; $0AE803 |
  db $A6                                    ; $0AE806 | ibt r6,#$00xx

CODE_0AE807:
  lms r0,($001C)                            ; $0AE807 |
  to r4                                     ; $0AE80A |
  xor   #10                                 ; $0AE80B |
  lms   r0,($0008)                          ; $0AE80D |
  with r4                                   ; $0AE810 |
  add   r0                                  ; $0AE811 |
  iwt   r15,#$E623                          ; $0AE812 |
  with r4                                   ; $0AE815 |

CODE_0AE816:
  lms   r4,($0008)                          ; $0AE816 |
  jmp   r11                                 ; $0AE819 |
  nop                                       ; $0AE81A |

  ibt   r0,#$000B                           ; $0AE81B |
  romb                                      ; $0AE81D |
  iwt   r0,#$8893                           ; $0AE81F |
  to r14                                    ; $0AE822 |
  add   r4                                  ; $0AE823 |
  to r4                                     ; $0AE824 |
  getb                                      ; $0AE825 |
  iwt   r0,#$1902                           ; $0AE826 |
  add   r10                                 ; $0AE829 |
  from r4                                   ; $0AE82A |
  stw   (r0)                                ; $0AE82B |
  with r4                                   ; $0AE82C |
  lsr                                       ; $0AE82D |
  iwt   r0,#$8933                           ; $0AE82E |
  to r14                                    ; $0AE831 |
  add   r4                                  ; $0AE832 |
  to r6                                     ; $0AE833 |
  getbs                                     ; $0AE834 |
  iwt   r0,#$1220                           ; $0AE836 |
  add   r10                                 ; $0AE839 |
  from r6                                   ; $0AE83A |
  stw   (r0)                                ; $0AE83B |
  iwt   r0,#$8947                           ; $0AE83C |
  to r14                                    ; $0AE83F |
  add   r4                                  ; $0AE840 |
  to r6                                     ; $0AE841 |
  getbs                                     ; $0AE842 |
  iwt   r0,#$1222                           ; $0AE844 |
  add   r10                                 ; $0AE847 |
  from r6                                   ; $0AE848 |
  stw   (r0)                                ; $0AE849 |
  iwt   r0,#$895B                           ; $0AE84A |
  to r14                                    ; $0AE84D |
  add   r4                                  ; $0AE84E |
  getb                                      ; $0AE84F |
  to r6                                     ; $0AE850 |
  and   #1                                  ; $0AE851 |
  beq CODE_0AE859                           ; $0AE853 |
  nop                                       ; $0AE855 |
  swap                                      ; $0AE856 |
  inc   r0                                  ; $0AE857 |
  swap                                      ; $0AE858 |

CODE_0AE859:
  bic   #1                                  ; $0AE859 |
  sms   ($0018),r0                          ; $0AE85B |
  stop                                      ; $0AE85E |
  nop                                       ; $0AE85F |

  dw $9EE3, $3449                           ; $0AE860 |

  ibt   r0,#$000A                           ; $0AE864 |
  romb                                      ; $0AE866 |
  ibt   r2,#$0000                           ; $0AE868 |
  with r5                                   ; $0AE86A |
  sex                                       ; $0AE86B |
  bmi CODE_0AE877                           ; $0AE86C |
  nop                                       ; $0AE86E |
  lms   r0,($0028)                          ; $0AE86F |
  not                                       ; $0AE872 |
  inc   r0                                  ; $0AE873 |
  sbk                                       ; $0AE874 |
  ibt   r2,#$0002                           ; $0AE875 |

CODE_0AE877:
  ibt   r3,#$0020                           ; $0AE877 |
  iwt   r1,#$E860                           ; $0AE879 |
  from r6                                   ; $0AE87C |
  hib                                       ; $0AE87D |
  sub   r3                                  ; $0AE87E |
  lob                                       ; $0AE87F |
  add   r0                                  ; $0AE880 |
  add   r0                                  ; $0AE881 |
  hib                                       ; $0AE882 |
  add   r2                                  ; $0AE883 |
  and   #3                                  ; $0AE884 |
  to r14                                    ; $0AE886 |
  add   r1                                  ; $0AE887 |
  getb                                      ; $0AE888 |
  sms   ($003A),r0                          ; $0AE889 |
  ibt   r7,#$000A                           ; $0AE88C |
  from r7                                   ; $0AE88E |
  romb                                      ; $0AE88F |
  lms   r1,($003A)                          ; $0AE891 |
  link  #4                                  ; $0AE894 |
  iwt   r15,#$E8AB                          ; $0AE895 |
  nop                                       ; $0AE898 |
  lms   r0,($003A)                          ; $0AE899 |
  lsr                                       ; $0AE89C |
  lsr                                       ; $0AE89D |
  lsr                                       ; $0AE89E |
  to r1                                     ; $0AE89F |
  lsr                                       ; $0AE8A0 |
  link  #4                                  ; $0AE8A1 |
  iwt   r15,#$E8AB                          ; $0AE8A2 |
  nop                                       ; $0AE8A5 |
  sub   r0                                  ; $0AE8A6 |
  move  r1,r0                               ; $0AE8A7 |
  stop                                      ; $0AE8A9 |
  nop                                       ; $0AE8AA |

  sms   ($0062),r11                         ; $0AE8AB |
  lms   r2,($003C)                          ; $0AE8AE |
  from r1                                   ; $0AE8B1 |
  and   #1                                  ; $0AE8B2 |
  beq CODE_0AE8BA                           ; $0AE8B4 |
  nop                                       ; $0AE8B6 |
  lms   r2,($003E)                          ; $0AE8B7 |

CODE_0AE8BA:
  from r1                                   ; $0AE8BA |
  and   #2                                  ; $0AE8BB |
  beq CODE_0AE8C3                           ; $0AE8BD |
  nop                                       ; $0AE8BF |
  with r2                                   ; $0AE8C0 |
  not                                       ; $0AE8C1 |
  inc   r2                                  ; $0AE8C2 |

CODE_0AE8C3:
  lms   r3,($0028)                          ; $0AE8C3 |
  lms   r0,($002A)                          ; $0AE8C6 |
  add   r2                                  ; $0AE8C9 |
  to r8                                     ; $0AE8CA |
  add   r3                                  ; $0AE8CB |
  sms   ($0020),r8                          ; $0AE8CC |
  lms   r2,($003C)                          ; $0AE8CF |
  from r1                                   ; $0AE8D2 |
  and   #4                                  ; $0AE8D3 |
  beq CODE_0AE8DB                           ; $0AE8D5 |
  nop                                       ; $0AE8D7 |
  lms   r2,($003E)                          ; $0AE8D8 |

CODE_0AE8DB:
  from r1                                   ; $0AE8DB |
  and   #8                                  ; $0AE8DC |
  beq CODE_0AE8E4                           ; $0AE8DE |
  nop                                       ; $0AE8E0 |
  with r2                                   ; $0AE8E1 |
  not                                       ; $0AE8E2 |
  inc   r2                                  ; $0AE8E3 |

CODE_0AE8E4:
  lms   r0,($002C)                          ; $0AE8E4 |
  add   r2                                  ; $0AE8E7 |
  sms   ($0022),r0                          ; $0AE8E8 |
  link  #4                                  ; $0AE8EB |
  iwt   r15,#$D095                          ; $0AE8EC |
  cache                                     ; $0AE8EF |
  from r7                                   ; $0AE8F0 |
  and   #2                                  ; $0AE8F1 |
  bne CODE_0AE918                           ; $0AE8F3 |
  sub   r0                                  ; $0AE8F5 |
  lms   r8,($0020)                          ; $0AE8F6 |
  ibt   r0,#$0006                           ; $0AE8F9 |
  lms   r1,($002A)                          ; $0AE8FB |
  from r1                                   ; $0AE8FE |
  cmp   r8                                  ; $0AE8FF |
  bpl CODE_0AE906                           ; $0AE901 |
  nop                                       ; $0AE903 |
  not                                       ; $0AE904 |
  inc   r0                                  ; $0AE905 |

CODE_0AE906:
  to r8                                     ; $0AE906 |
  add   r8                                  ; $0AE907 |
  lms   r0,($0022)                          ; $0AE908 |
  add   #8                                  ; $0AE90B |
  link  #4                                  ; $0AE90D |
  iwt   r15,#$D096                          ; $0AE90E |
  alt1                                      ; $0AE911 |

  from r7                                   ; $0AE912 |
  and   #3                                  ; $0AE913 |
  beq CODE_0AE91C                           ; $0AE915 |
  sub   r0                                  ; $0AE917 |

CODE_0AE918:
  ibt   r1,#$0001                           ; $0AE918 |
  stop                                      ; $0AE91A |
  nop                                       ; $0AE91B |

CODE_0AE91C:
  lms   r11,($0062)                         ; $0AE91C |
  jmp   r11                                 ; $0AE91F |
  nop                                       ; $0AE920 |

  ibt   r0,#$000A                           ; $0AE921 |
  romb                                      ; $0AE923 |
  ibt   r3,#$0000                           ; $0AE925 |
  ibt   r4,#$0010                           ; $0AE927 |
  ibt   r9,#$FFF0                           ; $0AE929 |
  lms   r0,($009C)                          ; $0AE92B |
  to r9                                     ; $0AE92E |
  and   r9                                  ; $0AE92F |
  iwt   r10,#$00F0                          ; $0AE930 |
  ibt   r12,#$0008                          ; $0AE933 |
  move  r8,r1                               ; $0AE935 |
  from r2                                   ; $0AE937 |
  add   r9                                  ; $0AE938 |
  link  #4                                  ; $0AE939 |
  iwt   r15,#$D095                          ; $0AE93A |
  cache                                     ; $0AE93D |
  and   #3                                  ; $0AE93E |
  bne CODE_0AE946                           ; $0AE940 |
  nop                                       ; $0AE942 |
  bra CODE_0AE94C                           ; $0AE943 |
  inc   r3                                  ; $0AE945 |

CODE_0AE946:
  and   #2                                  ; $0AE946 |
  bne CODE_0AE94C                           ; $0AE948 |
  nop                                       ; $0AE94A |
  inc   r3                                  ; $0AE94B |

CODE_0AE94C:
  dec   r12                                 ; $0AE94C |
  move  r13,r15                             ; $0AE94D |
  from r2                                   ; $0AE94F |
  add   r4                                  ; $0AE950 |
  cmp   r10                                 ; $0AE951 |
  bcc CODE_0AE959                           ; $0AE953 |
  nop                                       ; $0AE955 |
  sub   r0                                  ; $0AE956 |
  move  r3,r0                               ; $0AE957 |

CODE_0AE959:
  move  r2,r0                               ; $0AE959 |
  move  r8,r1                               ; $0AE95B |
  from r2                                   ; $0AE95D |
  add   r9                                  ; $0AE95E |
  link  #4                                  ; $0AE95F |
  iwt   r15,#$D096                          ; $0AE960 |
  alt1                                      ; $0AE963 |

  to r5                                     ; $0AE964 |
  and   #3                                  ; $0AE965 |
  bne CODE_0AE96D                           ; $0AE967 |
  nop                                       ; $0AE969 |
  bra CODE_0AE9A7                           ; $0AE96A |
  inc   r3                                  ; $0AE96C |

CODE_0AE96D:
  from r3                                   ; $0AE96D |
  sub   #2                                  ; $0AE96E |
  bcc CODE_0AE99C                           ; $0AE970 |
  nop                                       ; $0AE972 |
  with r2                                   ; $0AE973 |
  add   r9                                  ; $0AE974 |
  lms   r11,($0020)                         ; $0AE975 |
  lm    r0,($008C)                          ; $0AE978 |
  sub   r1                                  ; $0AE97C |
  bpl CODE_0AE982                           ; $0AE97D |
  nop                                       ; $0AE97F |
  not                                       ; $0AE980 |
  inc   r0                                  ; $0AE981 |

CODE_0AE982:
  sub   r11                                 ; $0AE982 |
  bpl CODE_0AE998                           ; $0AE983 |
  nop                                       ; $0AE985 |
  lm    r0,($0090)                          ; $0AE986 |
  sub   r2                                  ; $0AE98A |
  bpl CODE_0AE990                           ; $0AE98B |
  nop                                       ; $0AE98D |
  not                                       ; $0AE98E |
  inc   r0                                  ; $0AE98F |

CODE_0AE990:
  sub   r11                                 ; $0AE990 |
  bpl CODE_0AE998                           ; $0AE991 |
  nop                                       ; $0AE993 |
  with r2                                   ; $0AE994 |
  bra CODE_0AE99C                           ; $0AE995 |
  sub   r9                                  ; $0AE997 |

CODE_0AE998:
  to r10                                    ; $0AE998 |
  bra CODE_0AE9AB                           ; $0AE999 |
  sub   r0                                  ; $0AE99B |

CODE_0AE99C:
  from r5                                   ; $0AE99C |
  and   #2                                  ; $0AE99D |
  bne CODE_0AE9A5                           ; $0AE99F |
  nop                                       ; $0AE9A1 |
  bra CODE_0AE9A7                           ; $0AE9A2 |
  inc   r3                                  ; $0AE9A4 |

CODE_0AE9A5:
  to r3                                     ; $0AE9A5 |
  sub   r0                                  ; $0AE9A6 |

CODE_0AE9A7:
  loop                                      ; $0AE9A7 |
  nop                                       ; $0AE9A8 |
  ibt   r10,#$FFFF                          ; $0AE9A9 |

CODE_0AE9AB:
  sub   r0                                  ; $0AE9AB |
  stop                                      ; $0AE9AC |
  nop                                       ; $0AE9AD |

  romb                                      ; $0AE9AE |
  to r10                                    ; $0AE9B0 |
  sub   r0                                  ; $0AE9B1 |
  iwt   r0,#$0006                           ; $0AE9B2 |
  add   r3                                  ; $0AE9B5 |
  to r4                                     ; $0AE9B6 |
  ldw   (r0)                                ; $0AE9B7 |
  link  #4                                  ; $0AE9B8 |
  iwt   r15,#$E9F8                          ; $0AE9B9 |
  nop                                       ; $0AE9BC |
  or    r10                                 ; $0AE9BD |
  to r10                                    ; $0AE9BE |
  add   r0                                  ; $0AE9BF |
  iwt   r0,#$000E                           ; $0AE9C0 |
  add   r3                                  ; $0AE9C3 |
  to r4                                     ; $0AE9C4 |
  ldw   (r0)                                ; $0AE9C5 |
  link  #4                                  ; $0AE9C6 |
  iwt   r15,#$E9F8                          ; $0AE9C7 |
  nop                                       ; $0AE9CA |
  or    r10                                 ; $0AE9CB |
  to r10                                    ; $0AE9CC |
  add   r0                                  ; $0AE9CD |
  iwt   r0,#$0016                           ; $0AE9CE |
  add   r3                                  ; $0AE9D1 |
  to r4                                     ; $0AE9D2 |
  ldw   (r0)                                ; $0AE9D3 |
  link  #4                                  ; $0AE9D4 |
  iwt   r15,#$E9F8                          ; $0AE9D5 |
  nop                                       ; $0AE9D8 |
  or    r10                                 ; $0AE9D9 |
  to r10                                    ; $0AE9DA |
  add   r0                                  ; $0AE9DB |
  iwt   r0,#$001E                           ; $0AE9DC |
  add   r3                                  ; $0AE9DF |
  to r4                                     ; $0AE9E0 |
  ldw   (r0)                                ; $0AE9E1 |
  link  #4                                  ; $0AE9E2 |
  iwt   r15,#$E9F8                          ; $0AE9E3 |
  nop                                       ; $0AE9E6 |
  or    r10                                 ; $0AE9E7 |
  to r10                                    ; $0AE9E8 |
  add   r0                                  ; $0AE9E9 |
  iwt   r0,#$0026                           ; $0AE9EA |
  add   r3                                  ; $0AE9ED |
  to r4                                     ; $0AE9EE |
  ldw   (r0)                                ; $0AE9EF |
  link  #4                                  ; $0AE9F0 |
  iwt   r15,#$E9F8                          ; $0AE9F1 |
  nop                                       ; $0AE9F4 |
  or    r10                                 ; $0AE9F5 |
  stop                                      ; $0AE9F6 |
  nop                                       ; $0AE9F7 |

  cache                                     ; $0AE9F8 |
  move  r14,r1                              ; $0AE9F9 |
  move  r12,r2                              ; $0AE9FB |
  move  r13,r15                             ; $0AE9FD |
  iwt   r0,#$FF00                           ; $0AE9FF |
  getbl                                     ; $0AEA02 |
  inc   r14                                 ; $0AEA04 |
  to r5                                     ; $0AEA05 |
  and   r4                                  ; $0AEA06 |
  getb                                      ; $0AEA07 |
  inc   r14                                 ; $0AEA08 |
  getbh                                     ; $0AEA09 |
  inc   r14                                 ; $0AEA0B |
  cmp   r5                                  ; $0AEA0C |
  beq CODE_0AEA16                           ; $0AEA0E |
  sub   r0                                  ; $0AEA10 |
  loop                                      ; $0AEA11 |
  nop                                       ; $0AEA12 |
  bra CODE_0AEA17                           ; $0AEA13 |
  nop                                       ; $0AEA15 |

CODE_0AEA16:
  inc   r0                                  ; $0AEA16 |

CODE_0AEA17:
  jmp   r11                                 ; $0AEA17 |
  nop                                       ; $0AEA18 |

  ibt   r10,#$0001                          ; $0AEA19 |
  moves r12,r12                             ; $0AEA1B |
  beq CODE_0AEA71                           ; $0AEA1D |
  nop                                       ; $0AEA1F |
  bpl CODE_0AEA27                           ; $0AEA20 |
  with r12                                  ; $0AEA22 |
  not                                       ; $0AEA23 |
  inc   r12                                 ; $0AEA24 |
  ibt   r10,#$FFFF                          ; $0AEA25 |

CODE_0AEA27:
  iwt   r0,#$0020                           ; $0AEA27 |
  iwt   r13,#$0024                          ; $0AEA2A |
  moves r9,r9                               ; $0AEA2D |
  beq CODE_0AEA38                           ; $0AEA2F |
  nop                                       ; $0AEA31 |
  iwt   r0,#$0022                           ; $0AEA32 |
  iwt   r13,#$0026                          ; $0AEA35 |

CODE_0AEA38:
  sms   ($0028),r0                          ; $0AEA38 |
  sms   ($002A),r13                         ; $0AEA3B |
  ibt   r0,#$000A                           ; $0AEA3E |
  romb                                      ; $0AEA40 |
  move  r13,r15                             ; $0AEA42 |
  lms   r8,($0020)                          ; $0AEA44 |
  lms   r0,($0022)                          ; $0AEA47 |
  link  #4                                  ; $0AEA4A |
  iwt   r15,#$D096                          ; $0AEA4B |
  alt1                                      ; $0AEA4E |

  and   #2                                  ; $0AEA4F |
  bne CODE_0AEA72                           ; $0AEA51 |
  sub   r0                                  ; $0AEA53 |
  lms   r8,($0024)                          ; $0AEA54 |
  lms   r0,($0026)                          ; $0AEA57 |
  link  #4                                  ; $0AEA5A |
  iwt   r15,#$D096                          ; $0AEA5B |
  alt1                                      ; $0AEA5E |

  and   #2                                  ; $0AEA5F |
  bne CODE_0AEA72                           ; $0AEA61 |
  sub   r0                                  ; $0AEA63 |
  lms   r0,($0028)                          ; $0AEA64 |
  ldw   (r0)                                ; $0AEA67 |
  add   r10                                 ; $0AEA68 |
  sbk                                       ; $0AEA69 |
  lms   r0,($002A)                          ; $0AEA6A |
  ldw   (r0)                                ; $0AEA6D |
  add   r10                                 ; $0AEA6E |
  loop                                      ; $0AEA6F |
  sbk                                       ; $0AEA70 |

CODE_0AEA71:
  sub   r0                                  ; $0AEA71 |

CODE_0AEA72:
  stop                                      ; $0AEA72 |
  nop                                       ; $0AEA73 |

; the noise loop to play for each form of
; player, follows same order as $7000AE
; one byte per
player_noise_loops:
  db $00, $44, $84, $04, $00, $00, $64, $00 ; $0AEA74 |
  db $00, $00                               ; $0AEA7C |

  db $21, $00, $22, $00, $23, $00           ; $0AEA7E |
  db $24, $00, $25, $00, $26, $00, $27, $00 ; $0AEA84 |
  db $27, $00, $28, $00, $29, $00, $2A, $00 ; $0AEA8C |
  db $29, $00, $28, $00, $03, $00, $02, $00 ; $0AEA94 |
  db $02, $00, $02, $00, $02, $00, $08, $00 ; $0AEA9C |
  db $00, $00, $01, $00, $01, $00, $02, $00 ; $0AEAA4 |
  db $01, $00, $01, $00, $00, $00, $F8, $18 ; $0AEAAC |
  db $FC, $1C, $00, $08, $04, $14, $08, $06 ; $0AEAB4 |
  db $02, $06, $FE, $1A, $02, $0E, $C0, $04 ; $0AEABC |
  db $4E, $01, $FF, $00, $4F, $01, $94, $00 ; $0AEAC4 |
  db $9E, $00, $95, $00, $A1, $00, $96, $00 ; $0AEACC |
  db $A1, $00, $97, $00, $A2, $00, $98, $00 ; $0AEAD4 |
  db $9F, $00, $99, $00, $A0, $00, $9A, $00 ; $0AEADC |
  db $A1, $00, $9B, $00, $A2, $00, $9C, $00 ; $0AEAE4 |
  db $9C, $00, $9C, $00, $9C, $00, $9D, $00 ; $0AEAEC |
  db $9D, $00, $9D, $00, $9D, $00, $9E, $00 ; $0AEAF4 |
  db $0F, $08, $07, $06, $07, $04, $07, $04 ; $0AEAFC |
  db $03, $04, $03, $04, $01, $04, $01, $04 ; $0AEB04 |
  db $00, $04

; player part terrain collision offsets
; indexed as follows:
; top left, top center, top right
; mid left, center, mid right
; bottom left, bottom center, bottom right
; each pair is an X,Y offset for terrain collision
player_part_terrain_regular:
  db $01, $09, $01, $17, $0F, $09, $0F, $17 ; $0AEB0E |
  db $06, $04, $0A, $04, $03, $20, $08, $20 ; $0AEB16 |
  db $0D, $20                               ; $0AEB1E |

player_part_terrain_ducking:
  db $01, $16, $01, $17, $0F, $16, $0F, $17 ; $0AEB20 |
  db $06, $10, $0A, $10, $03, $20, $08, $20 ; $0AEB28 |
  db $0D, $20                               ; $0AEB30 |

player_part_terrain_swimming:
  db $01, $0C, $01, $16, $0F, $0C, $0F, $16 ; $0AEB32 |
  db $06, $04, $0A, $04, $03, $20, $08, $20 ; $0AEB3A |
  db $0D, $20                               ; $0AEB42 |

  db $01, $14, $01, $16, $0F, $14, $0F, $16 ; $0AEB44 |
  db $06, $10, $0A, $10, $03, $20, $08, $20 ; $0AEB4C |
  db $0D, $20, $F3, $F8, $F3, $00, $0C, $F8 ; $0AEB54 |
  db $0C, $00, $F7, $F4, $00, $F4, $09, $F4 ; $0AEB5C |
  db $F7, $08, $00, $08, $09, $08, $FC, $0C ; $0AEB64 |
  db $FC, $18, $13, $0C, $13, $17, $07, $0C ; $0AEB6C |
  db $FC, $23, $08, $23, $13, $23, $FA, $EB ; $0AEB74 |
  db $FA, $F0, $06, $EB, $06, $F0, $00, $E8 ; $0AEB7C |
  db $00, $00, $01, $0B, $01, $16, $0F, $0B ; $0AEB84 |
  db $0F, $16, $06, $07, $0A, $07, $03, $20 ; $0AEB8C |
  db $08, $20, $0D, $20, $01, $16, $01, $16 ; $0AEB94 |
  db $0F, $16, $0F, $16, $06, $10, $0A, $10 ; $0AEB9C |
  db $03, $20, $08, $20, $0D, $20, $FE, $08 ; $0AEBA4 |
  db $FE, $16, $12, $08, $12, $16, $02, $04 ; $0AEBAC |
  db $0E, $04, $00, $20, $08, $20, $10, $20 ; $0AEBB4 |

  db $00, $01, $04, $84, $00, $02, $08, $88 ; $0AEBBC |
  db $04, $84, $08, $88, $40, $40, $40, $42 ; $0AEBC4 |
  db $40, $40, $41, $40, $40, $40, $48, $C8 ; $0AEBCC |
  db $44, $C4, $40, $40, $04, $84, $00, $01 ; $0AEBD4 |
  db $80, $02, $04, $84, $04, $84, $F0, $00 ; $0AEBDC |
  db $F1, $00, $EF, $00, $F2, $00, $EE, $00 ; $0AEBE4 |
  db $F3, $00, $ED, $00, $F4, $00, $EC, $00 ; $0AEBEC |
  db $F5, $00, $EB, $00, $F6, $00, $EA, $00 ; $0AEBF4 |
  db $F7, $00, $E9, $00, $F8, $00, $E8, $00 ; $0AEBFC |
  db $F9, $00, $E7, $00, $FA, $00, $E6, $00 ; $0AEC04 |
  db $FB, $00, $E5, $00, $FC, $00, $E4, $00 ; $0AEC0C |
  db $FD, $00, $E3, $00, $FE, $00, $E2, $00 ; $0AEC14 |
  db $FF, $00, $E1, $00, $00, $01, $00, $00 ; $0AEC1C |
  db $00, $00, $1F, $0F, $07, $03, $03, $00 ; $0AEC24 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC2C |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC34 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC3C |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC44 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC4C |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC54 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AEC5C |
  db $03, $00, $FD, $00, $03, $00, $FD, $80 ; $0AEC64 |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC6C |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC74 |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC7C |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC84 |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC8C |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC94 |
  db $01, $80, $FE, $80, $01, $80, $FE, $80 ; $0AEC9C |
  db $01, $80, $FE, $80, $01, $80, $FE, $00 ; $0AECA4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECAC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECB4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECBC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECC4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECCC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECD4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECDC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECE4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECEC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECF4 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AECFC |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AED04 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AED0C |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AED14 |
  db $03, $00, $FD, $00, $03, $00, $FD, $00 ; $0AED1C |
  db $03, $00, $FD, $00, $03, $00, $FD, $90 ; $0AED24 |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED2C |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED34 |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED3C |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED44 |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED4C |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED54 |
  db $02, $70, $FD, $90, $02, $70, $FD, $90 ; $0AED5C |
  db $02, $70, $FD, $90, $02, $70, $FD, $00 ; $0AED64 |
  db $01, $00, $FF, $00, $01, $00, $FF, $80 ; $0AED6C |
  db $00, $00, $FD, $00, $01, $00, $FF, $00 ; $0AED74 |
  db $01, $00, $FF, $00, $01, $00, $FF, $00 ; $0AED7C |
  db $01, $00, $FF, $00, $01, $00, $FF, $00 ; $0AED84 |
  db $01, $00, $FF, $00, $01, $00, $FF, $00 ; $0AED8C |
  db $01, $00, $FF, $00, $01, $00, $FF, $00 ; $0AED94 |
  db $01, $00, $FF, $00, $01, $00, $FF, $00 ; $0AED9C |
  db $03, $80, $FF, $00, $01, $00, $FF, $00 ; $0AEDA4 |
  db $08, $00, $F8, $00, $08, $00, $F8, $10 ; $0AEDAC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDB4 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDBC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDC4 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDCC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDD4 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDDC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDE4 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDEC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDF4 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEDFC |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEE04 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEE0C |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEE14 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEE1C |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $10 ; $0AEE24 |
  db $00, $38, $00, $F0, $FF, $C8, $FF, $06 ; $0AEE2C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE34 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE3C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE44 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE4C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE54 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE5C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE64 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE6C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE74 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE7C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE84 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE8C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE94 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEE9C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AEEA4 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $02 ; $0AEEAC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEB4 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEBC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEC4 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEECC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEED4 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEDC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEE4 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEEC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEF4 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEEFC |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEF04 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEF0C |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEF14 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEF1C |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $02 ; $0AEF24 |
  db $00, $03, $00, $FE, $FF, $FD, $FF, $04 ; $0AEF2C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF34 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF3C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF44 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF4C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF54 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF5C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF64 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF6C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF74 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF7C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF84 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF8C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF94 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEF9C |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $04 ; $0AEFA4 |
  db $00, $08, $00, $FC, $FF, $F8, $FF, $08 ; $0AEFAC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFB4 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFBC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFC4 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFCC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFD4 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFDC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFE4 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFEC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFF4 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AEFFC |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AF004 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AF00C |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AF014 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AF01C |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $08 ; $0AF024 |
  db $00, $38, $00, $F8, $FF, $C8, $FF, $06 ; $0AF02C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF034 |
  db $00, $04, $00, $FA, $FF, $F6, $FF, $02 ; $0AF03C |
  db $00, $04, $00, $F8, $FF, $F0, $FF, $06 ; $0AF044 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF04C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF054 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF05C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF064 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF06C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF074 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF07C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF084 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF08C |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $06 ; $0AF094 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $08 ; $0AF09C |
  db $00, $10, $00, $FE, $FF, $FC, $FF, $06 ; $0AF0A4 |
  db $00, $0A, $00, $FA, $FF, $F6, $FF, $00 ; $0AF0AC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0B4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0BC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0C4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0CC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0D4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0DC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0E4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0EC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0F4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF0FC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF104 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF10C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF114 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF11C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF124 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF12C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF134 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF13C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF144 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF14C |
  db $00, $00, $00, $00, $FF, $00, $00, $00 ; $0AF154 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF15C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0AF164 |
  db $00, $00, $00, $00, $01, $00, $00, $80 ; $0AF16C |
  db $03, $40, $03, $00, $03, $00, $03, $80 ; $0AF174 |
  db $04, $80, $04, $80, $04, $80, $04, $80 ; $0AF17C |
  db $04, $80, $04, $80, $04, $80, $04, $80 ; $0AF184 |
  db $04, $80, $04, $80, $04, $00, $04, $E0 ; $0AF18C |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF194 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF19C |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF1A4 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF1AC |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF1B4 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF1BC |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF1C4 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $FD ; $0AF1CC |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1D4 |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1DC |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1E4 |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1EC |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1F4 |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF1FC |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FD ; $0AF204 |
  db $FF, $03, $00, $FD, $FF, $03, $00, $FF ; $0AF20C |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF214 |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF21C |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF224 |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF22C |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF234 |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF23C |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FF ; $0AF244 |
  db $FF, $01, $00, $FF, $FF, $01, $00, $FC ; $0AF24C |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF254 |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF25C |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF264 |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF26C |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF274 |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF27C |
  db $FF, $04, $00, $FC, $FF, $04, $00, $FC ; $0AF284 |
  db $FF, $04, $00, $FC, $FF, $04, $00, $D0 ; $0AF28C |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF294 |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF29C |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF2A4 |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF2AC |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF2B4 |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF2BC |
  db $FF, $30, $00, $D0, $FF, $30, $00, $D0 ; $0AF2C4 |
  db $FF, $30, $00, $D0, $FF, $30, $00, $F8 ; $0AF2CC |
  db $FF, $08, $00, $F8, $FF, $08, $00, $D0 ; $0AF2D4 |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF2DC |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF2E4 |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF2EC |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF2F4 |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF2FC |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF304 |
  db $FF, $30, $00, $F8, $FF, $08, $00, $FC ; $0AF30C |
  db $FF, $04, $00, $FC, $FF, $04, $00, $F8 ; $0AF314 |
  db $FF, $08, $00, $F8, $FF, $08, $00, $E0 ; $0AF31C |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF324 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF32C |
  db $FF, $20, $00, $E0, $FF, $20, $00, $E0 ; $0AF334 |
  db $FF, $20, $00, $E0, $FF, $20, $00, $F8 ; $0AF33C |
  db $FF, $08, $00, $F8, $FF, $08, $00, $F8 ; $0AF344 |
  db $FF, $08, $00, $FC, $FF, $04, $00, $0C ; $0AF34C |
  db $FE, $F4, $FE, $00, $FA, $00, $FA, $08 ; $0AF354 |
  db $00, $38, $20, $F8, $00, $C8, $E0, $F8 ; $0AF35C |
  db $00, $00, $39, $08, $00, $00, $C7, $00 ; $0AF364 |
  db $F8, $C8, $E0, $00, $F8, $C8, $E0, $00 ; $0AF36C |
  db $08, $00, $C7, $00, $08, $00, $C7, $55 ; $0AF374 |
  db $00, $62, $00, $5B, $00, $68, $00, $A6 ; $0AF37C |
  db $01, $A8, $01, $A7, $01, $A9, $01, $A7 ; $0AF384 |
  db $01, $A9, $01, $A7, $01, $A9, $01, $A7 ; $0AF38C |
  db $01, $A9, $01, $A7, $01, $A9, $01, $A7 ; $0AF394 |
  db $01, $A9, $01, $A7, $01, $A9, $01, $A7 ; $0AF39C |
  db $01, $A9, $01, $A6, $01, $A8, $01, $03 ; $0AF3A4 |
  db $56, $00, $03, $63, $00, $03, $5C, $00 ; $0AF3AC |
  db $03, $69, $00, $03, $57, $00, $03, $64 ; $0AF3B4 |
  db $00, $03, $5D, $00, $03, $64, $00, $03 ; $0AF3BC |
  db $58, $00, $03, $65, $00, $03, $58, $00 ; $0AF3C4 |
  db $03, $65, $00, $08, $59, $00, $08, $66 ; $0AF3CC |
  db $00, $08, $59, $00, $08, $66, $00, $06 ; $0AF3D4 |
  db $5A, $00, $06, $67, $00, $06, $5A, $00 ; $0AF3DC |
  db $06, $67, $00, $02, $0E, $00, $02, $31 ; $0AF3E4 |
  db $01, $02, $0E, $00, $02, $31, $01, $02 ; $0AF3EC |
  db $0F, $00, $02, $31, $01, $02, $0F, $00 ; $0AF3F4 |
  db $02, $31, $01, $02, $13, $00, $02, $67 ; $0AF3FC |
  db $00, $02, $13, $00, $02, $67, $00, $02 ; $0AF404 |
  db $14, $00, $02, $67, $00, $02, $14, $00 ; $0AF40C |
  db $02, $67, $00, $03, $56, $00, $03, $63 ; $0AF414 |
  db $00, $03, $5C, $00, $03, $69, $00, $03 ; $0AF41C |
  db $57, $00, $03, $64, $00, $03, $5D, $00 ; $0AF424 |
  db $03, $64, $00, $03, $58, $00, $03, $65 ; $0AF42C |
  db $00, $03, $58, $00, $03, $65, $00, $08 ; $0AF434 |
  db $59, $00, $08, $66, $00, $08, $59, $00 ; $0AF43C |
  db $08, $66, $00, $03, $A3, $01, $04, $A3 ; $0AF444 |
  db $01, $03, $A3, $01, $04, $A3, $01, $04 ; $0AF44C |
  db $A1, $01, $06, $A1, $01, $04, $A1, $01 ; $0AF454 |
  db $06, $A1, $01, $02, $A4, $01, $02, $A4 ; $0AF45C |
  db $01, $02, $A4, $01, $02, $A4, $01, $02 ; $0AF464 |
  db $A2, $01, $03, $A2, $01, $02, $A2, $01 ; $0AF46C |
  db $03, $A2, $01, $03, $A5, $01, $04, $A5 ; $0AF474 |
  db $01, $03, $A5, $01, $04, $A5, $01, $09 ; $0AF47C |
  db $00, $19, $00, $07, $00, $05, $00, $05 ; $0AF484 |
  db $FA, $15, $FA, $25, $FA, $35, $FA, $45 ; $0AF48C |
  db $FA, $55, $FA, $EB, $FA, $DB, $FA, $CB ; $0AF494 |
  db $FA, $BB, $FA, $AB, $FA, $9B, $FA, $05 ; $0AF49C |
  db $F6, $15, $F6, $25, $F6, $35, $F6, $45 ; $0AF4A4 |
  db $F6, $55, $F6, $EB, $F6, $DB, $F6, $CB ; $0AF4AC |
  db $F6, $BB, $F6, $AB, $F6, $9B, $F6, $F4 ; $0AF4B4 |
  db $E2, $F4, $D2, $F4, $C2, $F4, $B2, $F4 ; $0AF4BC |
  db $A2, $F4, $92, $FC, $E2, $FC, $D2, $FC ; $0AF4C4 |
  db $C2, $FC, $B2, $FC, $A2, $FC, $92, $02 ; $0AF4CC |
  db $04, $09, $10, $05, $F5, $40, $03, $50 ; $0AF4D4 |
  db $00, $80, $03, $50, $00, $C0, $03, $50 ; $0AF4DC |
  db $00, $00, $04, $50, $00, $EC, $F5, $C0 ; $0AF4E4 |
  db $FC, $50, $00, $80, $FC, $50, $00, $40 ; $0AF4EC |
  db $FC, $50, $00, $00, $FC, $50, $00, $04 ; $0AF4F4 |
  db $F4, $40, $03, $50, $00, $80, $03, $50 ; $0AF4FC |
  db $00, $C0, $03, $50, $00, $00, $04, $50 ; $0AF504 |
  db $00, $ED, $F4, $C0, $FC, $50, $00, $80 ; $0AF50C |
  db $FC, $50, $00, $40, $FC, $50, $00, $00 ; $0AF514 |
  db $FC, $50, $00, $F6, $ED, $00, $00, $00 ; $0AF51C |
  db $FC, $00, $00, $00, $FC, $00, $00, $00 ; $0AF524 |
  db $FC, $00, $00, $00, $FC, $FA, $ED, $00 ; $0AF52C |
  db $00, $00, $FC, $00, $00, $00, $FC, $00 ; $0AF534 |
  db $00, $00, $FC, $00, $00, $00, $FC, $04 ; $0AF53C |
  db $F4, $00, $04, $10, $FF, $00, $04, $00 ; $0AF544 |
  db $00, $00, $04, $30, $00, $00, $04, $70 ; $0AF54C |
  db $FF, $00, $04, $F0, $00, $00, $04, $D0 ; $0AF554 |
  db $FF, $00, $04, $90, $00, $EC, $F4, $00 ; $0AF55C |
  db $FC, $10, $FF, $00, $FC, $00, $00, $00 ; $0AF564 |
  db $FC, $30, $00, $00, $FC, $70, $FF, $00 ; $0AF56C |
  db $FC, $F0, $00, $00, $FC, $D0, $FF, $00 ; $0AF574 |
  db $FC, $90, $00, $FD, $F4, $00, $04, $10 ; $0AF57C |
  db $FF, $00, $04, $00, $00, $00, $04, $30 ; $0AF584 |
  db $00, $00, $04, $70, $FF, $00, $04, $F0 ; $0AF58C |
  db $00, $00, $04, $D0, $FF, $00, $04, $90 ; $0AF594 |
  db $00, $F3, $F4, $00, $FC, $10, $FF, $00 ; $0AF59C |
  db $FC, $00, $00, $00, $FC, $30, $00, $00 ; $0AF5A4 |
  db $FC, $70, $FF, $00, $FC, $F0, $00, $00 ; $0AF5AC |
  db $FC, $D0, $FF, $00, $FC, $90, $00, $F6 ; $0AF5B4 |
  db $ED, $10, $FF, $00, $FC, $00, $00, $00 ; $0AF5BC |
  db $FC, $30, $00, $00, $FC, $70, $FF, $00 ; $0AF5C4 |
  db $FC, $F0, $00, $00, $FC, $D0, $FF, $00 ; $0AF5CC |
  db $FC, $90, $00, $00, $FC, $FA, $ED, $F0 ; $0AF5D4 |
  db $00, $00, $FC, $00, $00, $00, $FC, $D0 ; $0AF5DC |
  db $FF, $00, $FC, $90, $00, $00, $FC, $10 ; $0AF5E4 |
  db $FF, $00, $FC, $30, $00, $00, $FC, $70 ; $0AF5EC |
  db $FF, $00, $FC, $00, $00, $40, $00, $41 ; $0AF5F4 |
  db $00, $42, $00, $43, $00, $42, $00, $41 ; $0AF5FC |
  db $00, $40, $00, $74, $00, $73, $00, $72 ; $0AF604 |
  db $00, $71, $00, $70, $00, $6F, $00, $6E ; $0AF60C |
  db $00, $6E, $00, $6D, $00, $6E, $00, $6D ; $0AF614 |
  db $00, $6C, $00, $00, $40, $05, $02, $02 ; $0AF61C |
  db $02, $90, $00, $91, $00, $92, $00, $93 ; $0AF624 |
  db $00, $92, $00, $91, $00, $8B, $00, $8A ; $0AF62C |
  db $00, $89, $00, $88, $00, $89, $00, $8A ; $0AF634 |
  db $00, $8C, $00, $8D, $00, $8E, $00, $8F ; $0AF63C |
  db $00, $8E, $00, $8D, $00, $34, $00, $33 ; $0AF644 |
  db $00, $32, $00, $31, $00, $30, $00, $2F ; $0AF64C |
  db $00, $2E, $00, $2D, $00, $2C, $00, $2B ; $0AF654 |
  db $00, $00, $0C, $01, $01, $01, $02, $04 ; $0AF65C |
  db $01, $02, $01, $11, $00, $12, $00, $48 ; $0AF664 |
  db $00, $48, $00, $48, $00, $7C, $00, $79 ; $0AF66C |
  db $00, $7B, $00, $7C, $00, $7A, $00, $7C ; $0AF674 |
  db $00, $20, $00, $1F, $00, $1E, $00, $0B ; $0AF67C |
  db $01, $0A, $01, $09, $01, $08, $01, $07 ; $0AF684 |
  db $01, $06, $01, $05, $01, $04, $01, $03 ; $0AF68C |
  db $01, $02, $01, $01, $01, $1D, $00, $1E ; $0AF694 |
  db $00, $1F, $00, $20, $00, $32, $00, $38 ; $0AF69C |
  db $00, $39, $00, $3A, $00, $11, $00, $12 ; $0AF6A4 |
  db $00, $11, $00, $1A, $00, $1B, $00, $1C ; $0AF6AC |
  db $00, $1C, $00, $1B, $00, $1A, $00, $1A ; $0AF6B4 |
  db $00, $1A, $00, $35, $00, $36, $00, $37 ; $0AF6BC |
  db $00, $37, $00, $36, $00, $35, $00, $35 ; $0AF6C4 |
  db $00, $35, $00, $3B, $00, $3C, $00, $3D ; $0AF6CC |
  db $00, $3E, $00, $3F, $00, $4D, $00, $4D ; $0AF6D4 |
  db $00, $4D, $00, $4D, $00, $17, $00, $17 ; $0AF6DC |
  db $00, $17, $00, $17, $00, $16, $00, $16 ; $0AF6E4 |
  db $00, $16, $00, $16, $00, $16, $00, $16 ; $0AF6EC |
  db $00, $16, $00, $16, $00, $15, $00, $15 ; $0AF6F4 |
  db $00, $15, $00, $15, $00, $15, $00, $15 ; $0AF6FC |
  db $00, $16, $00, $16, $00, $16, $00, $16 ; $0AF704 |
  db $00, $16, $00, $16, $00, $16, $00, $16 ; $0AF70C |
  db $00, $15, $00, $15, $00, $15, $00, $15 ; $0AF714 |
  db $00, $15, $00, $15, $00, $16, $00, $16 ; $0AF71C |
  db $00, $16, $00, $16, $00, $16, $00, $16 ; $0AF724 |
  db $00, $16, $00, $16, $00, $15, $00, $15 ; $0AF72C |
  db $00, $15, $00, $15, $00, $15, $00, $15 ; $0AF734 |
  db $00, $17, $00, $17, $00, $17, $00, $17 ; $0AF73C |
  db $00, $17, $00, $17, $00, $17, $00, $17 ; $0AF744 |
  db $00, $40, $00, $41, $00, $42, $00, $43 ; $0AF74C |
  db $00, $43, $00, $43, $00, $43, $00, $43 ; $0AF754 |
  db $00, $43, $00, $43, $00, $43, $00, $43 ; $0AF75C |
  db $00, $43, $00, $43, $00, $43, $00, $43 ; $0AF764 |
  db $00, $43, $00, $43, $00, $43, $00, $43 ; $0AF76C |
  db $00, $43, $00, $43, $00, $43, $00, $42 ; $0AF774 |
  db $00, $41, $00, $40, $00, $46, $00, $46 ; $0AF77C |
  db $00, $46, $00, $46, $00, $46, $00, $46 ; $0AF784 |
  db $00, $47, $00, $47, $00, $47, $00, $47 ; $0AF78C |
  db $00, $47, $00, $47, $00, $46, $00, $46 ; $0AF794 |
  db $00, $46, $00, $46, $00, $46, $00, $46 ; $0AF79C |
  db $00, $4D, $00, $4D, $00, $4D, $00, $4D ; $0AF7A4 |
  db $00, $4D, $00, $4D, $00, $44, $00, $44 ; $0AF7AC |
  db $00, $44, $00, $44, $00, $44, $00, $44 ; $0AF7B4 |
  db $00, $45, $00, $45, $00, $45, $00, $45 ; $0AF7BC |
  db $00, $45, $00, $45, $00, $44, $00, $44 ; $0AF7C4 |
  db $00, $44, $00, $44, $00, $44, $00, $44 ; $0AF7CC |
  db $00, $29, $03, $35, $19, $A8, $00, $00 ; $0AF7D4 |
  db $00, $08, $00, $74, $00, $00, $00, $00 ; $0AF7DC |
  db $75, $00, $00, $04, $03, $02, $02, $02 ; $0AF7E4 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF7EC |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF7F4 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF7FC |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF804 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF80C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF814 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF81C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF824 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF82C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF834 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF83C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF844 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF84C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF854 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF85C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF864 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF86C |
  db $00, $00, $00, $04, $03, $02, $02, $02 ; $0AF874 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AF87C |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF884 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF88C |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF894 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF89C |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8A4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8AC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8B4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8BC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8C4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8CC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8D4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8DC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8E4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8EC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF8F4 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF8FC |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF904 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF90C |
  db $00, $00, $00, $06, $05, $04, $03, $03 ; $0AF914 |
  db $02, $01, $01, $01, $00, $00, $00, $00 ; $0AF91C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF924 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF92C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF934 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF93C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF944 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF94C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF954 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF95C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF964 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF96C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF974 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF97C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF984 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF98C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF994 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF99C |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF9A4 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF9AC |
  db $00, $00, $00, $01, $02, $02, $01, $01 ; $0AF9B4 |
  db $01, $01, $01, $01, $00, $00, $00, $00 ; $0AF9BC |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AF9C4 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AF9CC |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AF9D4 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AF9DC |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AF9E4 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AF9EC |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AF9F4 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AF9FC |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA04 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA0C |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA14 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA1C |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA24 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA2C |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA34 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA3C |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA44 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA4C |
  db $00, $00, $00, $01, $02, $03, $02, $02 ; $0AFA54 |
  db $02, $02, $01, $01, $00, $00, $00, $00 ; $0AFA5C |
  db $00, $00, $00, $00, $00, $A0, $00, $40 ; $0AFA64 |
  db $01, $40, $01, $A0, $00, $E0, $01, $01 ; $0AFA6C |
  db $00, $02, $00, $03, $00, $04, $00, $05 ; $0AFA74 |
  db $00, $09, $00, $0A, $00, $0B, $00, $0C ; $0AFA7C |
  db $00, $10, $00, $4E, $00, $4F, $00, $50 ; $0AFA84 |
  db $00, $51, $00, $52, $00, $4E, $00, $4F ; $0AFA8C |
  db $00, $50, $00, $51, $00, $52, $00, $AD ; $0AFA94 |
  db $00, $AE, $00, $AF, $00, $B0, $00, $B1 ; $0AFA9C |
  db $00, $AD, $00, $AE, $00, $AF, $00, $B0 ; $0AFAA4 |
  db $00, $B1, $00, $C8, $00, $C9, $00, $CA ; $0AFAAC |
  db $00, $CB, $00, $CC, $00, $C8, $00, $C9 ; $0AFAB4 |
  db $00, $CA, $00, $CB, $00, $CC, $00, $BA ; $0AFABC |
  db $00, $BB, $00, $BC, $00, $BD, $00, $BE ; $0AFAC4 |
  db $00, $BA, $00, $BB, $00, $BC, $00, $BD ; $0AFACC |
  db $00, $BE, $00, $D5, $00, $D6, $00, $D7 ; $0AFAD4 |
  db $00, $D8, $00, $D9, $00, $D5, $00, $D6 ; $0AFADC |
  db $00, $D7, $00, $D8, $00, $D9, $00, $B8 ; $0AFAE4 |
  db $00, $B9, $00, $B8, $00, $B7, $00, $B8 ; $0AFAEC |
  db $00, $B9, $00, $B8, $00, $B7, $00, $B6 ; $0AFAF4 |
  db $00, $B5, $00, $B4, $00, $B3, $00, $B2 ; $0AFAFC |
  db $00, $A4, $00, $A5, $00, $A6, $00, $A7 ; $0AFB04 |
  db $00, $A8, $00, $A9, $00, $AA, $00, $AB ; $0AFB0C |
  db $00, $AC, $00, $AB, $00, $AA, $00, $AB ; $0AFB14 |
  db $00, $AC, $00, $AB, $00, $D3, $00, $D4 ; $0AFB1C |
  db $00, $D3, $00, $D2, $00, $D3, $00, $D4 ; $0AFB24 |
  db $00, $D3, $00, $D2, $00, $D1, $00, $D0 ; $0AFB2C |
  db $00, $CF, $00, $CE, $00, $CD, $00, $BF ; $0AFB34 |
  db $00, $C0, $00, $C1, $00, $C2, $00, $C3 ; $0AFB3C |
  db $00, $C4, $00, $C5, $00, $C6, $00, $C7 ; $0AFB44 |
  db $00, $C6, $00, $C5, $00, $C6, $00, $C7 ; $0AFB4C |
  db $00, $C6, $00, $20, $14, $04, $10, $04 ; $0AFB54 |
  db $13, $07, $03, $03, $03, $03, $03, $03 ; $0AFB5C |
  db $04, $04, $04, $04, $04, $04, $04, $08 ; $0AFB64 |
  db $11, $04, $08, $04, $11, $20, $A0, $40 ; $0AFB6C |
  db $80, $20, $80, $20, $A0, $40, $E0, $00 ; $0AFB74 |
  db $04, $00, $00, $E0, $00, $FC, $00, $00 ; $0AFB7C |
  db $E0, $00, $FC, $00, $00, $00, $00, $00 ; $0AFB84 |
  db $00, $04, $D0, $D4, $02, $D4, $02, $D0 ; $0AFB8C |
  db $2C, $FD, $D4, $02, $D0, $2C, $FD, $D4 ; $0AFB94 |
  db $02, $00, $00, $00, $00, $FC, $F0, $D4 ; $0AFB9C |
  db $02, $2C, $FD, $F0, $2C, $FD, $2C, $FD ; $0AFBA4 |
  db $F0, $2C, $FD, $2C, $FD, $00, $00, $00 ; $0AFBAC |
  db $00, $FC, $F0, $D4, $02, $2C, $FD, $F0 ; $0AFBB4 |
  db $2C, $FD, $2C, $FD, $F0, $2C, $FD, $2C ; $0AFBBC |
  db $FD, $00, $00, $00, $00, $00, $00, $80 ; $0AFBC4 |
  db $01, $00, $00, $00, $80, $FE, $00, $00 ; $0AFBCC |
  db $00, $80, $FE, $00, $00, $40, $00, $00 ; $0AFBD4 |
  db $80, $01, $20, $10, $01, $10, $01, $20 ; $0AFBDC |
  db $F0, $FE, $10, $01, $20, $F0, $FE, $10 ; $0AFBE4 |
  db $01, $C0, $00, $00, $80, $FE, $E0, $10 ; $0AFBEC |
  db $01, $F0, $FE, $E0, $F0, $FE, $F0, $FE ; $0AFBF4 |
  db $E0, $F0, $FE, $F0, $FE, $C0, $00, $00 ; $0AFBFC |
  db $80, $FE, $E0, $10, $01, $F0, $FE, $E0 ; $0AFC04 |
  db $F0, $FE, $F0, $FE, $E0, $F0, $FE, $F0 ; $0AFC0C |
  db $FE, $A0, $60, $C0, $60, $FF, $FC, $F9 ; $0AFC14 |
  db $00, $07, $03, $01, $00, $00, $C0, $80 ; $0AFC1C |
  db $40, $03, $02, $0C, $08, $03, $01, $0C ; $0AFC24 |
  db $04, $00, $02, $03, $01, $00, $01, $03 ; $0AFC2C |
  db $02, $02, $00, $05, $00, $A0, $00, $04 ; $0AFC34 |
  db $00, $40, $01, $80, $00, $04, $01, $1A ; $0AFC3C |
  db $00, $00, $01, $41, $00, $18, $00, $40 ; $0AFC44 |
  db $01, $A0, $00, $40, $00, $A0, $00, $20 ; $0AFC4C |
  db $00, $41, $00, $1A, $00, $01, $00, $1A ; $0AFC54 |
  db $00, $18, $00, $E0, $01, $80, $01, $00 ; $0AFC5C |
  db $20, $00, $5B, $00, $58, $00, $01, $02 ; $0AFC64 |
  db $00, $A5, $00, $21, $00, $04, $80, $00 ; $0AFC6C |
  db $1E, $01, $06, $00, $02, $A0, $00, $80 ; $0AFC74 |
  db $00, $20, $00, $1A, $00, $02, $00, $01 ; $0AFC7C |
  db $00, $01, $00, $04, $00, $1A, $00, $18 ; $0AFC84 |
  db $00, $02, $00, $A0, $00, $08, $00, $04 ; $0AFC8C |
  db $00, $04, $00, $00, $01, $A0, $00, $20 ; $0AFC94 |
  db $00, $80, $00, $1A, $00, $01, $00, $02 ; $0AFC9C |
  db $00, $00, $01, $40, $00, $1A, $00, $02 ; $0AFCA4 |
  db $00, $18, $00, $A0, $00, $04, $00, $08 ; $0AFCAC |
  db $00, $40, $00, $01, $00, $04, $02, $08 ; $0AFCB4 |
  db $01, $08, $01, $04, $02, $10, $05, $0A ; $0AFCBC |
  db $04, $08, $03, $06, $02, $04, $02, $02 ; $0AFCC4 |
  db $01, $01, $01, $00, $00, $30, $0D, $2C ; $0AFCCC |
  db $0C, $28, $0B, $24, $0A, $20, $09, $1C ; $0AFCD4 |
  db $08, $18, $07, $14, $06, $19, $1E, $23 ; $0AFCDC |
  db $28, $2D, $32, $37, $1E, $01, $1D, $01 ; $0AFCE4 |
  db $21, $01, $20, $01, $1F, $01, $20, $01 ; $0AFCEC |
  db $1C, $01, $1B, $01, $1A, $01, $19, $01 ; $0AFCF4 |
  db $18, $01, $17, $01, $18, $01, $04, $04 ; $0AFCFC |
  db $02, $04, $02, $04, $02, $04, $02, $04 ; $0AFD04 |
  db $FA, $04, $F4, $04, $FE, $04, $FE, $04 ; $0AFD0C |
  db $FE, $04, $FE, $04, $FC, $04, $FE, $04 ; $0AFD14 |
  db $02, $04, $0A, $04, $08, $04, $06, $04 ; $0AFD1C |
  db $04, $04, $02, $04, $02, $04, $02, $04 ; $0AFD24 |
  db $02, $04, $02, $04, $02, $04, $02, $04 ; $0AFD2C |
  db $FA, $04, $00, $00, $FE, $04, $FE, $04 ; $0AFD34 |
  db $FC, $04, $FA, $04, $F8, $04, $F6, $04 ; $0AFD3C |
  db $FE, $04, $FE, $04, $04, $04, $02, $04 ; $0AFD44 |
  db $FA, $04, $FE, $04, $A1, $60, $00, $00 ; $0AFD4C |
  db $00, $E1, $40, $00, $00, $00, $81, $60 ; $0AFD54 |
  db $00, $00, $00, $81, $00, $00, $00, $00 ; $0AFD5C |
  db $A1, $40, $01, $16, $01, $61, $00, $01 ; $0AFD64 |
  db $16, $01, $21, $60, $01, $16, $01, $41 ; $0AFD6C |
  db $60, $01, $16, $01, $61, $60, $01, $16 ; $0AFD74 |
  db $01, $81, $00, $01, $22, $01, $81, $00 ; $0AFD7C |
  db $01, $23, $01, $81, $00, $01, $24, $01 ; $0AFD84 |
  db $00, $20, $20, $20, $C0, $40, $80, $00 ; $0AFD8C |
  db $08, $C0, $08, $C0, $01, $00, $00, $00 ; $0AFD94 |
  db $00, $00, $02, $80, $00, $00, $00, $00 ; $0AFD9C |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $0AFDA4 |
  db $00, $00, $08, $10, $00, $00, $00, $08 ; $0AFDAC |
  db $00, $00, $08, $08, $00, $00, $01, $00 ; $0AFDB4 |
  db $01, $01, $00, $01, $FF, $01, $FF, $00 ; $0AFDBC |
  db $FF, $FF, $00, $FF, $01, $FF, $00, $80 ; $0AFDC4 |
  db $00, $40, $60, $20, $60, $C0, $A0, $E0 ; $0AFDCC |
  db $A0, $40, $60, $20, $60, $80, $40, $20 ; $0AFDD4 |
  db $10, $08, $04, $02, $01, $08, $08, $08 ; $0AFDDC |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $0AFDE4 |
  db $08, $08, $08, $08, $08, $00, $00, $00 ; $0AFDEC |
  db $00, $01, $02, $04, $08, $10, $20, $40 ; $0AFDF4 |
  db $80, $00, $00, $00, $00, $08, $04, $02 ; $0AFDFC |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0AFE04 |
  db $00, $80, $40, $20, $10, $00, $00, $00 ; $0AFE0C |
  db $00, $FF, $00, $00, $00, $08, $08, $08 ; $0AFE14 |
  db $08, $FF, $00, $00, $00, $08, $08, $08 ; $0AFE1C |
  db $08, $0F, $08, $08, $08, $08, $08, $08 ; $0AFE24 |
  db $08, $F8, $08, $08, $08, $00, $00, $00 ; $0AFE2C |
  db $00, $FF, $08, $08, $08                ; $0AFE34 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE39 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE41 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE49 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE51 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE59 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE61 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE69 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE71 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE79 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE81 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE89 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE91 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFE99 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEA1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEA9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEB1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEB9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEC1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEC9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFED1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFED9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEE1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEE9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEF1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFEF9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF01 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF09 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF11 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF19 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF21 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF29 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF31 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF39 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF41 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF49 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF51 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF59 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF61 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF69 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF71 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF79 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF81 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF89 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF91 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFF99 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFA1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFA9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFB1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFB9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFC1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFC9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFD1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFD9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFE1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFE9 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $0AFFF1 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF      ; $0AFFF9 |
