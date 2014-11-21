
000A:8000 3F DF        romb
000A:8002 3E F0 80 00  sm    (0080),r0
000A:8006 21 1E        move  r14,r1
000A:8008 A0 11        ibt   r0,#0011
000A:800A 3D 4E        cmode
000A:800C A2 00        ibt   r2,#0000
000A:800E F4 0F 0F     iwt   r4,#0F0F
000A:8011 EF           getb
000A:8012 50           add   r0
000A:8013 50           add   r0
000A:8014 50           add   r0
000A:8015 16 50        add   r0
000A:8017 94           link  #04
000A:8018 FF B3 81     iwt   r15,#81B3
000A:801B EF           getb
000A:801C 04           rol
000A:801D C6           or    r6
000A:801E 16 74        and   r4
000A:8020 EF           getb
000A:8021 50           add   r0
000A:8022 50           add   r0
000A:8023 50           add   r0
000A:8024 17 50        add   r0
000A:8026 94           link  #04
000A:8027 FF B3 81     iwt   r15,#81B3
000A:802A EF           getb
000A:802B 04           rol
000A:802C C7           or    r7
000A:802D 17 74        and   r4
000A:802F EF           getb
000A:8030 50           add   r0
000A:8031 50           add   r0
000A:8032 50           add   r0
000A:8033 18 50        add   r0
000A:8035 94           link  #04
000A:8036 FF B3 81     iwt   r15,#81B3
000A:8039 EF           getb
000A:803A 04           rol
000A:803B C8           or    r8
000A:803C 18 74        and   r4
000A:803E EF           getb
000A:803F 19 74        and   r4
000A:8041 60           sub   r0
000A:8042 A1 00        ibt   r1,#0000
000A:8044 AC 40        ibt   r12,#0040
000A:8046 02           cache
000A:8047 2F 1D        move  r13,r15
000A:8049 31           stw   (r1)
000A:804A D1           inc   r1
000A:804B 3C           loop
000A:804C D1           inc   r1
000A:804D E1           dec   r1
000A:804E 94           link  #04
000A:804F FF B3 81     iwt   r15,#81B3
000A:8052 EF           getb
000A:8053 AA 05        ibt   r10,#0005
000A:8055 03           lsr
000A:8056 03           lsr
000A:8057 FF 16 81     iwt   r15,#8116
000A:805A 03           lsr
000A:805B 08 06        bne   8063
000A:805D 03           lsr
000A:805E 94           link  #04
000A:805F FF B3 81     iwt   r15,#81B3
000A:8062 EF           getb
000A:8063 20 14        move  r4,r0
000A:8065 15 3D 41     ldb   (r1)
000A:8068 0D 1B        bcs   8085
000A:806A E1           dec   r1
000A:806B 3D 41        ldb   (r1)
000A:806D 3F 65        cmp   r5
000A:806F 09 FA        beq   806B
000A:8071 E1           dec   r1
000A:8072 D1           inc   r1
000A:8073 2F 1D        move  r13,r15
000A:8075 B5 3D 31     stb   (r1)
000A:8078 3C           loop
000A:8079 E1           dec   r1
000A:807A 0A 16        bpl   8092
000A:807C 3D 01        nop
000A:807E 05 6C        bra   80EC

000A:8080 D1           inc   r1
000A:8081 71           and   r1
000A:8082 05 0B        bra   808F

000A:8084 60           sub   r0
000A:8085 0B FA        bmi   8081
000A:8087 3D 41        ldb   (r1)
000A:8089 3F 65        cmp   r5
000A:808B 09 F8        beq   8085
000A:808D E1           dec   r1
000A:808E D1           inc   r1
000A:808F 21 5C        add   r12
000A:8091 3D 31        stb   (r1)
000A:8093 24 10        move  r0,r4
000A:8095 AC 00        ibt   r12,#0000
000A:8097 A4 01        ibt   r4,#0001
000A:8099 05 11        bra   80AC

000A:809B EA           dec   r10

000A:809C EA           dec   r10
000A:809D 08 06        bne   80A5
000A:809F 03           lsr
000A:80A0 94           link  #04
000A:80A1 FF B3 81     iwt   r15,#81B3
000A:80A4 EF           getb
000A:80A5 0C 02        bcc   80A9
000A:80A7 2C C4        or    r4
000A:80A9 24 54        add   r4
000A:80AB EA           dec   r10
000A:80AC 08 06        bne   80B4
000A:80AE 03           lsr
000A:80AF 94           link  #04
000A:80B0 FF B3 81     iwt   r15,#81B3
000A:80B3 EF           getb
000A:80B4 0D E6        bcs   809C
000A:80B6 2C C4        or    r4
000A:80B8 29 B9        moves r9,r9
000A:80BA 0A 6C        bpl   8128
000A:80BC EA           dec   r10
000A:80BD 08 06        bne   80C5
000A:80BF 03           lsr
000A:80C0 94           link  #04
000A:80C1 FF B3 81     iwt   r15,#81B3
000A:80C4 EF           getb
000A:80C5 0D 94        bcs   805B
000A:80C7 EA           dec   r10
000A:80C8 08 06        bne   80D0
000A:80CA 03           lsr
000A:80CB 94           link  #04
000A:80CC FF B3 81     iwt   r15,#81B3
000A:80CF EF           getb
000A:80D0 0D 55        bcs   8127
000A:80D2 20 14        move  r4,r0
000A:80D4 2F 1D        move  r13,r15
000A:80D6 15 3D 41     ldb   (r1)
000A:80D9 E1           dec   r1
000A:80DA 0B 0F        bmi   80EB
000A:80DC 3D 41        ldb   (r1)
000A:80DE 3F 65        cmp   r5
000A:80E0 09 F8        beq   80DA
000A:80E2 E1           dec   r1
000A:80E3 3C           loop
000A:80E4 D1           inc   r1
000A:80E5 24 10        move  r0,r4
000A:80E7 05 AD        bra   8096

000A:80E9 AC 14        ibt   r12,#0014
000A:80EB D1           inc   r1
000A:80EC FC 80 00     iwt   r12,#0080
000A:80EF 2F 1D        move  r13,r15
000A:80F1 3D 41        ldb   (r1)
000A:80F3 4E           color
000A:80F4 3C           loop
000A:80F5 4C           plot
000A:80F6 D2           inc   r2
000A:80F7 B2 3F 63     cmp   r3
000A:80FA 0C 18        bcc   8114
000A:80FC E1           dec   r1
000A:80FD 3D 4C        rpix
000A:80FF 00           stop
000A:8100 01           nop

000A:8101 15 4D        swap
000A:8103 25 3E 7F     and   #0F
000A:8106 2F 1D        move  r13,r15
000A:8108 B5 3D 31     stb   (r1)
000A:810B 3C           loop
000A:810C E1           dec   r1
000A:810D 0A 87        bpl   8096
000A:810F AC 00        ibt   r12,#0000
000A:8111 05 D7        bra   80EA

000A:8113 20 24 10     move  r0,r4
000A:8116 29 04        rol
000A:8118 EA           dec   r10
000A:8119 08 06        bne   8121
000A:811B 03           lsr
000A:811C 94           link  #04
000A:811D FF B3 81     iwt   r15,#81B3
000A:8120 EF           getb
000A:8121 29 97        ror
000A:8123 FF 96 80     iwt   r15,#8096
000A:8126 AC EA        ibt   r12,#FFEA
000A:8128 08 06        bne   8130
000A:812A 03           lsr
000A:812B 94           link  #04
000A:812C FF B3 81     iwt   r15,#81B3
000A:812F EF           getb
000A:8130 0D 1A        bcs   814C
000A:8132 EA           dec   r10
000A:8133 08 05        bne   813A
000A:8135 03           lsr
000A:8136 93           link  #03
000A:8137 05 7A        bra   81B3

000A:8139 EF           getb

000A:813A 0D 29        bcs   8165
000A:813C EA           dec   r10
000A:813D 08 05        bne   8144
000A:813F 03           lsr
000A:8140 93           link  #03
000A:8141 05 70        bra   81B3

000A:8143 EF           getb

000A:8144 0D BB        bcs   8101
000A:8146 B6           from  r6
000A:8147 15           to    r5
000A:8148 3E           alt2
000A:8149 05 BB        bra   8106

000A:814B 7F           and   r15

000A:814C 08 05        bne   8153
000A:814E 03           lsr
000A:814F 93           link  #03
000A:8150 05 61        bra   81B3

000A:8152 EF           getb

000A:8153 0D 1F        bcs   8174
000A:8155 EA           dec   r10
000A:8156 08 05        bne   815D
000A:8158 03           lsr
000A:8159 93           link  #03
000A:815A 05 57        bra   81B3

000A:815C EF           getb

000A:815D 0D A2        bcs   8101
000A:815F B8           from  r8
000A:8160 15           to    r5
000A:8161 3E           alt2
000A:8162 05 A2        bra   8106

000A:8164 7F           and   r15

000A:8165 08 05        bne   816C
000A:8167 03           lsr
000A:8168 93           link  #03
000A:8169 05 48        bra   81B3

000A:816B EF           getb

000A:816C 0D 93        bcs   8101
000A:816E B7           from  r7
000A:816F 15           to    r5
000A:8170 3E           alt2
000A:8171 05 93        bra   8106

000A:8173 7F           and   r15

000A:8174 08 05        bne   817B
000A:8176 03           lsr
000A:8177 93           link  #03
000A:8178 05 39        bra   81B3

000A:817A EF           getb
000A:817B 0D 08        bcs   8185
000A:817D B9 15 3E 7F  and   #0F
000A:8181 FF 07 81     iwt   r15,#8107
000A:8184 2F A5 00     ibt   r5,#0000
000A:8187 EA           dec   r10
000A:8188 08 05        bne   818F
000A:818A 03           lsr
000A:818B 93           link  #03
000A:818C 05 25        bra   81B3

000A:818E EF           getb

000A:818F 25 04        rol
000A:8191 EA           dec   r10
000A:8192 08 05        bne   8199
000A:8194 03           lsr
000A:8195 93           link  #03
000A:8196 05 1B        bra   81B3

000A:8198 EF           getb

000A:8199 25 04        rol
000A:819B EA           dec   r10
000A:819C 08 05        bne   81A3
000A:819E 03           lsr
000A:819F 93           link  #03
000A:81A0 05 11        bra   81B3

000A:81A2 EF           getb

000A:81A3 25 04        rol
000A:81A5 EA           dec   r10
000A:81A6 08 05        bne   81AD
000A:81A8 03           lsr
000A:81A9 93           link  #03
000A:81AA 05 07        bra   81B3

000A:81AC EF           getb

000A:81AD 25 04        rol
000A:81AF FF 07 81     iwt   r15,#8107
000A:81B2 2F DE        inc   r14
000A:81B4 08 0F        bne   81C5
000A:81B6 AA 08        ibt   r10,#0008
000A:81B8 3D FA 80 00  lm    r10,(0080)
000A:81BC DA           inc   r10
000A:81BD BA 90        sbk
000A:81BF BA 3F DF     romb
000A:81C2 AE 00        ibt   r14,#0000
000A:81C4 AA 08        ibt   r10,#0008
000A:81C6 2B 1F        move  r15,r11
000A:81C8 03           lsr

000A:81C9 22 3E 68     sub   #08
000A:81CC 23 3E 68     sub   #08
000A:81CF A0 0A        ibt   r0,#000A
000A:81D1 3F DF        romb
000A:81D3 FE 0E 86     iwt   r14,#860E
000A:81D6 EF           getb
000A:81D7 3E A0 10     sms   (0020),r0
000A:81DA 1A 4D        swap
000A:81DC F9 D1 00     iwt   r9,#00D1
000A:81DF 3D A0 01     lms   r0,(0002)
000A:81E2 11 3E 68     sub   #08
000A:81E5 F0 00 22     iwt   r0,#2200
000A:81E8 3D A8 03     lms   r8,(0006)
000A:81EB 58           add   r8
000A:81EC 58           add   r8
000A:81ED 18 40        ldw   (r0)
000A:81EF 3E A8 11     sms   (0022),r8
000A:81F2 02           cache
000A:81F3 3D A0 00     lms   r0,(0000)
000A:81F6 3E A0 12     sms   (0024),r0
000A:81F9 AB 60        ibt   r11,#0060
000A:81FB 5B           add   r11
000A:81FC FB C0 01     iwt   r11,#01C0
000A:81FF 6B           sub   r11
000A:8200 0C 0C        bcc   820E
000A:8202 01           nop
000A:8203 A0 80        ibt   r0,#FF80
000A:8205 3E A0 12     sms   (0024),r0
000A:8208 FF FD 82     iwt   r15,#82FD
000A:820B 3D A0 10     lms   r0,(0020)
000A:820E FB 14 35     iwt   r11,#3514
000A:8211 FD D0 00     iwt   r13,#00D0
000A:8214 BD 61        sub   r1
000A:8216 0A 0B        bpl   8223
000A:8218 16 4F        not
000A:821A D6           inc   r6
000A:821B B8 3D 9F     lmult
000A:821E 2A 64        sub   r4
000A:8220 05 20        bra   8242

000A:8222 DE           inc   r14

000A:8223 20 1C        move  r12,r0
000A:8225 BD 6C        sub   r12
000A:8227 0A 04        bpl   822D
000A:8229 DC           inc   r12
000A:822A 2D 1C        move  r12,r13
000A:822C DC           inc   r12
000A:822D 29 6C        sub   r12
000A:822F F0 26 FF     iwt   r0,#FF26
000A:8232 2F 1D        move  r13,r15
000A:8234 3B           stw   (r11)
000A:8235 EB           dec   r11
000A:8236 EB           dec   r11
000A:8237 3C           loop
000A:8238 D0           inc   r0
000A:8239 08 07        bne   8242
000A:823B DE           inc   r14
000A:823C FF FD 82     iwt   r15,#82FD
000A:823F 3D A0 10     lms   r0,(0020)
000A:8242 3D A6 02     lms   r6,(0004)
000A:8245 2E 17        move  r7,r14
000A:8247 B9 1C 62     sub   r2
000A:824A DC           inc   r12
000A:824B 2F 1D        move  r13,r15
000A:824D 2A 68        sub   r8
000A:824F 0B 1F        bmi   8270
000A:8251 BA C0        hib
000A:8253 1E 57        add   r7
000A:8255 EF           getb
000A:8256 4D           swap
000A:8257 9F           fmult
000A:8258 D0           inc   r0
000A:8259 03           lsr
000A:825A 20 15        move  r5,r0
000A:825C 69           sub   r9
000A:825D 3E 68        sub   #08
000A:825F 3B           stw   (r11)
000A:8260 EB           dec   r11
000A:8261 EB           dec   r11
000A:8262 3C           loop
000A:8263 E9           dec   r9
000A:8264 0A 07        bpl   826D
000A:8266 01           nop
000A:8267 FF FD 82     iwt   r15,#82FD
000A:826A 3D A0 10     lms   r0,(0020)
000A:826D 05 1A        bra   8289

000A:826F B2 B9 4F     not
000A:8272 3E 68        sub   #08
000A:8274 29 6C        sub   r12
000A:8276 2F 1D        move  r13,r15
000A:8278 3B           stw   (r11)
000A:8279 EB           dec   r11
000A:827A EB           dec   r11
000A:827B 3C           loop
000A:827C D0           inc   r0
000A:827D 08 07        bne   8286
000A:827F 01           nop
000A:8280 FF FD 82     iwt   r15,#82FD
000A:8283 3D A0 10     lms   r0,(0020)
000A:8286 A5 00        ibt   r5,#0000
000A:8288 B2 63        sub   r3
000A:828A 20 1D        move  r13,r0
000A:828C 0A 03        bpl   8291
000A:828E 01           nop
000A:828F 4F           not
000A:8290 D0           inc   r0
000A:8291 20 1C        move  r12,r0
000A:8293 FE 6F 86     iwt   r14,#866F
000A:8296 A0 22        ibt   r0,#0022
000A:8298 3F 6C        cmp   r12
000A:829A 0D 03        bcs   829F
000A:829C BC 20 1C     move  r12,r0
000A:829F 69           sub   r9
000A:82A0 0C 04        bcc   82A6
000A:82A2 DC           inc   r12
000A:82A3 29 1C        move  r12,r9
000A:82A5 DC           inc   r12
000A:82A6 2E 5C        add   r12
000A:82A8 14 EF        getb
000A:82AA 25 64        sub   r4
000A:82AC AA FF        ibt   r10,#FFFF
000A:82AE 2D BD        moves r13,r13
000A:82B0 0A 0D        bpl   82BF
000A:82B2 EE           dec   r14
000A:82B3 DE           inc   r14
000A:82B4 A0 23        ibt   r0,#0023
000A:82B6 1C 6C        sub   r12
000A:82B8 08 24        bne   82DE
000A:82BA DE           inc   r14
000A:82BB EE           dec   r14
000A:82BC 05 20        bra   82DE

000A:82BE DC           inc   r12

000A:82BF 2F 1D        move  r13,r15
000A:82C1 EF           getb
000A:82C2 EE           dec   r14
000A:82C3 55           add   r5
000A:82C4 0A 03        bpl   82C9
000A:82C6 01           nop
000A:82C7 2A 10        move  r0,r10
000A:82C9 69           sub   r9
000A:82CA 3E 68        sub   #08
000A:82CC 3B           stw   (r11)
000A:82CD EB           dec   r11
000A:82CE EB           dec   r11
000A:82CF 3C           loop
000A:82D0 E9           dec   r9
000A:82D1 0B 29        bmi   82FC
000A:82D3 DE           inc   r14
000A:82D4 AC 23        ibt   r12,#0023
000A:82D6 BC 69        sub   r9
000A:82D8 0C 04        bcc   82DE
000A:82DA DC           inc   r12
000A:82DB 29 1C        move  r12,r9
000A:82DD DC           inc   r12
000A:82DE 2F 1D        move  r13,r15
000A:82E0 EF           getb
000A:82E1 DE           inc   r14
000A:82E2 55           add   r5
000A:82E3 0A 03        bpl   82E8
000A:82E5 01           nop
000A:82E6 2A 10        move  r0,r10
000A:82E8 69           sub   r9
000A:82E9 3E 68        sub   #08
000A:82EB 3B           stw   (r11)
000A:82EC EB           dec   r11
000A:82ED EB           dec   r11
000A:82EE 3C           loop
000A:82EF E9           dec   r9
000A:82F0 0B 0A        bmi   82FC
000A:82F2 D9           inc   r9
000A:82F3 29 1C        move  r12,r9
000A:82F5 2F 1D        move  r13,r15
000A:82F7 D0           inc   r0
000A:82F8 3B           stw   (r11)
000A:82F9 EB           dec   r11
000A:82FA 3C           loop
000A:82FB EB           dec   r11
000A:82FC 3D A0 10     lms   r0,(0020)
000A:82FF 4D           swap
000A:8300 3D A6 03     lms   r6,(0006)
000A:8303 1C 9F        fmult
000A:8305 F7 16 35     iwt   r7,#3516
000A:8308 3D A0 01     lms   r0,(0002)
000A:830B 3E 68        sub   #08
000A:830D 20 19        move  r9,r0
000A:830F 57           add   r7
000A:8310 11 59        add   r9
000A:8312 3D A0 04     lms   r0,(0008)
000A:8315 12 4D        swap
000A:8317 3D A0 06     lms   r0,(000C)
000A:831A 3D A6 11     lms   r6,(0022)
000A:831D 3D 9F        lmult
000A:831F 9E           lob
000A:8320 4D           swap
000A:8321 24 C0        hib
000A:8323 13 C4        or    r4
000A:8325 3D A0 05     lms   r0,(000A)
000A:8328 3D A6 02     lms   r6,(0004)
000A:832B 3D 9F        lmult
000A:832D 24 16        move  r6,r4
000A:832F FB 18 AC     iwt   r11,#AC18
000A:8332 F0 80 00     iwt   r0,#0080
000A:8335 3D A5 12     lms   r5,(0024)
000A:8338 15 65        sub   r5
000A:833A 25 18        move  r8,r5
000A:833C A0 08        ibt   r0,#0008
000A:833E 3F DF        romb
000A:8340 29 1A        move  r10,r9
000A:8342 F4 D2 00     iwt   r4,#00D2
000A:8345 2F 1D        move  r13,r15
000A:8347 20 BA        moves r0,r10
000A:8349 0B 15        bmi   8360
000A:834B 64           sub   r4
000A:834C 0D 0C        bcs   835A
000A:834E B2 C0        hib
000A:8350 50           add   r0
000A:8351 1E 5B        add   r11
000A:8353 EF           getb
000A:8354 DE           inc   r14
000A:8355 3D EF        getbh
000A:8357 9F           fmult
000A:8358 55           add   r5
000A:8359 31           stw   (r1)
000A:835A 22 53        add   r3
000A:835C E1           dec   r1
000A:835D E1           dec   r1
000A:835E 3C           loop
000A:835F EA           dec   r10
000A:8360 3D A0 07     lms   r0,(000E)
000A:8363 4D           swap
000A:8364 3D A6 02     lms   r6,(0004)
000A:8367 9F           fmult
000A:8368 12 3F 50     adc   #00
000A:836B 3D A0 08     lms   r0,(0010)
000A:836E 4D           swap
000A:836F 3D A6 03     lms   r6,(0006)
000A:8372 9F           fmult
000A:8373 3F 50        adc   #00
000A:8375 3E A0 08     sms   (0010),r0
000A:8378 59           add   r9
000A:8379 20 11        move  r1,r0
000A:837B 64           sub   r4
000A:837C 0D 08        bcs   8386
000A:837E 60           sub   r0
000A:837F B7 51        add   r1
000A:8381 51           add   r1
000A:8382 40           ldw   (r0)
000A:8383 68           sub   r8
000A:8384 4F           not
000A:8385 D0           inc   r0
000A:8386 52           add   r2
000A:8387 3E A0 07     sms   (000E),r0
000A:838A F0 E4 85     iwt   r0,#85E4
000A:838D 3E A0 10     sms   (0020),r0

000A:8390 94           link  #04
000A:8391 FF F2 84     iwt   r15,#84F2
000A:8394 02           cache
000A:8395 F1 00 0F     iwt   r1,#0F00
000A:8398 F2 38 1D     iwt   r2,#1D38
000A:839B F3 D6 1C     iwt   r3,#1CD6
000A:839E F0 37 1D     iwt   r0,#1D37
000A:83A1 3D A4 09     lms   r4,(0012)
000A:83A4 54           add   r4
000A:83A5 3D 40        ldb   (r0)
000A:83A7 50           add   r0
000A:83A8 14 50        add   r0
000A:83AA 3D FA 94 00  lm    r10,(0094)
000A:83AE AC 18        ibt   r12,#0018
000A:83B0 3D F0 9C 00  lm    r0,(009C)
000A:83B4 1B 3E 58     add   #08
000A:83B7 02           cache
000A:83B8 FD BC 83     iwt   r13,#83BC
000A:83BB 24 3E 64     sub   #04
000A:83BE 0A 04        bpl   83C4
000A:83C0 B1 A4 5C     ibt   r4,#005C
000A:83C3 B1 54        add   r4
000A:83C5 3D 40        ldb   (r0)
000A:83C7 3E 6E        sub   #0E
000A:83C9 0C 35        bcc   8400
000A:83CB B2 54        add   r4
000A:83CD 40           ldw   (r0)
000A:83CE 3E 60        sub   #00
000A:83D0 09 2E        beq   8400
000A:83D2 B3 54        add   r4
000A:83D4 1E 40        ldw   (r0)
000A:83D6 2E 6A        sub   r10
000A:83D8 D0           inc   r0
000A:83D9 D0           inc   r0
000A:83DA 40           ldw   (r0)
000A:83DB 6B           sub   r11
000A:83DC 65           sub   r5
000A:83DD 0D 21        bcs   8400
000A:83DF 55           add   r5
000A:83E0 20 19        move  r9,r0
000A:83E2 50           add   r0
000A:83E3 56           add   r6
000A:83E4 40           ldw   (r0)
000A:83E5 59           add   r9
000A:83E6 3E 59        add   #09
000A:83E8 18 9E        lob
000A:83EA B7 59        add   r9
000A:83EC 59           add   r9
000A:83ED 19 40        ldw   (r0)
000A:83EF F0 80 00     iwt   r0,#0080
000A:83F2 69           sub   r9
000A:83F3 6E           sub   r14
000A:83F4 20 1E        move  r14,r0
000A:83F6 0A 03        bpl   83FB
000A:83F8 01           nop
000A:83F9 4F           not
000A:83FA D0           inc   r0
000A:83FB 50           add   r0
000A:83FC 68           sub   r8
000A:83FD 0C 13        bcc   8412
000A:83FF 01           nop
000A:8400 3C           loop
000A:8401 24 3D A0 09  lms   r0,(0012)
000A:8405 F1 36 1D     iwt   r1,#1D36
000A:8408 11 51        add   r1
000A:840A 60           sub   r0
000A:840B 3D 31        stb   (r1)
000A:840D 05 22        bra   8431

000A:840F 3D A0 00     lms   r0,(0000)
000A:8412 3D A1 09     lms   r1,(0012)
000A:8415 F0 76 1C     iwt   r0,#1C76
000A:8418 51           add   r1
000A:8419 2E 4F        not
000A:841B DE           inc   r14
000A:841C BE 30        stw   (r0)
000A:841E F0 37 1D     iwt   r0,#1D37
000A:8421 12 51        add   r1
000A:8423 B4 03        lsr
000A:8425 03           lsr
000A:8426 3D 32        stb   (r2)
000A:8428 F0 36 1D     iwt   r0,#1D36
000A:842B 51           add   r1
000A:842C D4           inc   r4
000A:842D B4 3D 30     stb   (r0)
000A:8430 3D A0 00     lms   r0,(0000)
000A:8433 3D FA 94 00  lm    r10,(0094)
000A:8437 1A 5A        add   r10
000A:8439 3D A9 09     lms   r9,(0012)
000A:843C F0 20 17     iwt   r0,#1720
000A:843F 59           add   r9
000A:8440 40           ldw   (r0)
000A:8441 3D A9 01     lms   r9,(0002)
000A:8444 59           add   r9
000A:8445 3D F9 9C 00  lm    r9,(009C)
000A:8449 19 59        add   r9
000A:844B 3D AC 02     lms   r12,(0004)
000A:844E 3D AD 03     lms   r13,(0006)
000A:8451 A0 0A        ibt   r0,#000A
000A:8453 3F DF        romb
000A:8455 3D AE 10     lms   r14,(0020)
000A:8458 A2 00        ibt   r2,#0000
000A:845A 94           link  #04
000A:845B FF BB 84     iwt   r15,#84BB
000A:845E EF           getb
000A:845F 3E 72        and   #02
000A:8461 09 02        beq   8465
000A:8463 01           nop
000A:8464 D2           inc   r2
000A:8465 22 52        add   r2
000A:8467 94           link  #04
000A:8468 FF BB 84     iwt   r15,#84BB
000A:846B EF           getb
000A:846C 3E 72        and   #02
000A:846E 09 02        beq   8472
000A:8470 01           nop
000A:8471 D2           inc   r2
000A:8472 22 52        add   r2
000A:8474 94           link  #04
000A:8475 FF BB 84     iwt   r15,#84BB
000A:8478 EF           getb
000A:8479 3E 72        and   #02
000A:847B 09 02        beq   847F
000A:847D 01           nop
000A:847E D2           inc   r2
000A:847F 22 52        add   r2
000A:8481 94           link  #04
000A:8482 FF BB 84     iwt   r15,#84BB
000A:8485 EF           getb
000A:8486 3E 72        and   #02
000A:8488 09 02        beq   848C
000A:848A 01           nop
000A:848B D2           inc   r2
000A:848C 22 52        add   r2
000A:848E 94           link  #04
000A:848F FF BB 84     iwt   r15,#84BB
000A:8492 EF           getb
000A:8493 3E 72        and   #02
000A:8495 09 02        beq   8499
000A:8497 01           nop
000A:8498 D2           inc   r2
000A:8499 3D A0 01     lms   r0,(0002)
000A:849C 3E A0 10     sms   (0020),r0
000A:849F 22 52        add   r2
000A:84A1 FD 00 01     iwt   r13,#0100
000A:84A4 94           link  #04
000A:84A5 FF BB 84     iwt   r15,#84BB
000A:84A8 EF           getb
000A:84A9 3E 73        and   #03
000A:84AB 09 02        beq   84AF
000A:84AD 01           nop
000A:84AE D2           inc   r2
000A:84AF F0 60 18     iwt   r0,#1860
000A:84B2 3D A1 09     lms   r1,(0012)
000A:84B5 51           add   r1
000A:84B6 B2 30        stw   (r0)
000A:84B8 60           sub   r0
000A:84B9 00           stop
000A:84BA 01           nop

000A:84BB DE           inc   r14
000A:84BC 4D           swap
000A:84BD 2C 16        move  r6,r12
000A:84BF 9F           fmult
000A:84C0 18 5A        add   r10
000A:84C2 EF           getb
000A:84C3 DE           inc   r14
000A:84C4 4D           swap
000A:84C5 2D 16        move  r6,r13
000A:84C7 9F           fmult
000A:84C8 59           add   r9
000A:84C9 20 17        move  r7,r0
000A:84CB 3D F6 9C 00  lm    r6,(009C)
000A:84CF 66           sub   r6
000A:84D0 3E 68        sub   #08
000A:84D2 F6 D2 00     iwt   r6,#00D2
000A:84D5 3F 66        cmp   r6
000A:84D7 0D 13        bcs   84EC
000A:84D9 B8 F6 16 35  iwt   r6,#3516
000A:84DD 50           add   r0
000A:84DE 56           add   r6
000A:84DF 16 40        ldw   (r0)
000A:84E1 F0 80 00     iwt   r0,#0080
000A:84E4 66           sub   r6
000A:84E5 3D A6 12     lms   r6,(0024)
000A:84E8 66           sub   r6
000A:84E9 58           add   r8
000A:84EA 20 18        move  r8,r0
000A:84EC 27 10        move  r0,r7
000A:84EE FF 96 D0     iwt   r15,#D096
000A:84F1 17 F0 FF 00  iwt   r0,#00FF
000A:84F5 3E AB 30     sms   (0060),r11
000A:84F8 20 1B        move  r11,r0
000A:84FA A0 0A        ibt   r0,#000A
000A:84FC 3F DF        romb
000A:84FE FE F0 85     iwt   r14,#85F0
000A:8501 3D A0 0C     lms   r0,(0018)
000A:8504 3E 60        sub   #00
000A:8506 09 03        beq   850B
000A:8508 2E 3E 5A     add   #0A
000A:850B 3D A1 0A     lms   r1,(0014)
000A:850E 3D A0 0B     lms   r0,(0016)
000A:8511 12 3E 68     sub   #08
000A:8514 F5 D2 00     iwt   r5,#00D2
000A:8517 F6 72 33     iwt   r6,#3372
000A:851A F7 16 35     iwt   r7,#3516
000A:851D F3 80 00     iwt   r3,#0080
000A:8520 AA 00        ibt   r10,#0000
000A:8522 AC 05        ibt   r12,#0005
000A:8524 FD 28 85     iwt   r13,#8528
000A:8527 2A 5A        add   r10
000A:8529 3F EF        getbs
000A:852B DE           inc   r14
000A:852C 14 51        add   r1
000A:852E 3F EF        getbs
000A:8530 DE           inc   r14
000A:8531 52           add   r2
000A:8532 65           sub   r5
000A:8533 0D 1D        bcs   8552
000A:8535 55           add   r5
000A:8536 20 19        move  r9,r0
000A:8538 50           add   r0
000A:8539 56           add   r6
000A:853A 40           ldw   (r0)
000A:853B 59           add   r9
000A:853C 3E 59        add   #09
000A:853E 18 7B        and   r11
000A:8540 B7 59        add   r9
000A:8542 59           add   r9
000A:8543 40           ldw   (r0)
000A:8544 B3 60        sub   r0
000A:8546 64           sub   r4
000A:8547 0A 03        bpl   854C
000A:8549 01           nop
000A:854A 4F           not
000A:854B D0           inc   r0
000A:854C 50           add   r0
000A:854D 68           sub   r8
000A:854E 0D 02        bcs   8552
000A:8550 01           nop
000A:8551 DA           inc   r10
000A:8552 3C           loop
000A:8553 2A 3E AA 0A  sms   (0014),r10
000A:8557 BA 03        lsr
000A:8559 0C 50        bcc   85AB
000A:855B 60           sub   r0
000A:855C 20 11        move  r1,r0
000A:855E E9           dec   r9
000A:855F 0B 21        bmi   8582
000A:8561 B1 3E 5A     add   #0A
000A:8564 0B 1C        bmi   8582
000A:8566 B9 59        add   r9
000A:8568 56           add   r6
000A:8569 40           ldw   (r0)
000A:856A 59           add   r9
000A:856B 3E 59        add   #09
000A:856D 18 7B        and   r11
000A:856F B7 59        add   r9
000A:8571 59           add   r9
000A:8572 40           ldw   (r0)
000A:8573 B3 60        sub   r0
000A:8575 64           sub   r4
000A:8576 20 12        move  r2,r0
000A:8578 0A 03        bpl   857D
000A:857A 01           nop
000A:857B 4F           not
000A:857C D0           inc   r0
000A:857D 50           add   r0
000A:857E 68           sub   r8
000A:857F 0C DD        bcc   855E
000A:8581 E1           dec   r1
000A:8582 3E A1 0B     sms   (0016),r1
000A:8585 B9 3E 52     add   #02
000A:8588 3F 65        cmp   r5
000A:858A 0D 09        bcs   8595
000A:858C B8 B0 50     add   r0
000A:858F 56           add   r6
000A:8590 40           ldw   (r0)
000A:8591 59           add   r9
000A:8592 3E 59        add   #09
000A:8594 7B           and   r11
000A:8595 68           sub   r8
000A:8596 03           lsr
000A:8597 A3 04        ibt   r3,#0004
000A:8599 3F 63        cmp   r3
000A:859B 0C 03        bcc   85A0
000A:859D 01           nop
000A:859E 23 10        move  r0,r3
000A:85A0 22 B2        moves r2,r2
000A:85A2 0A 03        bpl   85A7
000A:85A4 01           nop
000A:85A5 3E 55        add   #05
000A:85A7 50           add   r0
000A:85A8 3E A0 0C     sms   (0018),r0
000A:85AB F0 04 86     iwt   r0,#8604
000A:85AE 6E           sub   r14
000A:85AF 0C 2E        bcc   85DF
000A:85B1 1E 5E        add   r14
000A:85B3 3D A0 0A     lms   r0,(0014)
000A:85B6 3E A0 0D     sms   (001A),r0
000A:85B9 3D A0 0B     lms   r0,(0016)
000A:85BC 3E A0 0E     sms   (001C),r0
000A:85BF 3D A0 0C     lms   r0,(0018)
000A:85C2 3E A0 0F     sms   (001E),r0
000A:85C5 3D A0 E6     lms   r0,(01CC)
000A:85C8 3E 60        sub   #00
000A:85CA 09 07        beq   85D3
000A:85CC 60           sub   r0
000A:85CD 3E A0 0A     sms   (0014),r0
000A:85D0 05 0D        bra   85DF

000A:85D2 01           nop

DATA_0A85D3:         db $3D, $F1, $80, $16, $3D, $F0, $82, $16
DATA_0A85DB:         db $FF, $12, $85, $12, $3D, $AB, $30, $9B
DATA_0A85E3:         db $01

DATA_0A85E4:         db $EA, $C0, $0E, $C0, $E0, $F0, $18, $F0
DATA_0A85EC:         db $00, $B0, $00, $00, $02, $04, $0E, $04
DATA_0A85F4:         db $02, $14, $0E, $14, $08, $20, $02, $12
DATA_0A85FC:         db $0E, $12, $02, $14, $0E, $14, $08, $20

DATA_0A8604:         db $02, $02, $0E, $02, $02, $0A, $0E, $0A
DATA_0A860C:         db $08, $10, $60, $00, $16, $1F, $26, $2C
DATA_0A8614:         db $36, $3A, $3D, $41, $44, $47, $4A, $4D
DATA_0A861C:         db $4F, $52, $54, $56, $58, $5B, $5C, $5E
DATA_0A8624:         db $60, $62, $63, $65, $66, $68, $69, $6B
DATA_0A862C:         db $6C, $6D, $6E, $6F, $71, $72, $73, $74
DATA_0A8634:         db $74, $75, $76, $77, $78, $78, $79, $7A
DATA_0A863C:         db $7A, $7B, $7B, $7C, $7C, $7D, $7D, $7E
DATA_0A8644:         db $7E, $7E, $7E, $7F, $7F, $7F, $7F, $7F
DATA_0A864C:         db $7F, $7F, $7F, $7F, $7F, $7E, $7E, $7D
DATA_0A8654:         db $7C, $7B, $7A, $79, $78, $76, $74, $73
DATA_0A865C:         db $71, $6E, $6C, $69, $66, $63, $60, $5C
DATA_0A8664:         db $58, $54, $4F, $4A, $44, $3D, $36, $2C
DATA_0A866C:         db $1F, $00, $00, $00, $00, $00, $01, $02
DATA_0A8674:         db $03, $04, $06, $08, $0A, $0C, $0E, $10
DATA_0A867C:         db $13, $16, $19, $1C, $34, $39, $3E, $43
DATA_0A8684:         db $48, $4E, $54, $5A, $60, $66, $6C, $73
DATA_0A868C:         db $7A

000A:8693 A0 0A        ibt   r0,#000A
000A:8695 3F DF        romb
000A:8697 3E A5 02     sms   (0004),r5
000A:869A 24 3E 68     sub   #08
000A:869D F5 D1 00     iwt   r5,#00D1
000A:86A0 F9 14 35     iwt   r9,#3514
000A:86A3 F7 B8 36     iwt   r7,#36B8
000A:86A6 02           cache
000A:86A7 B5 1C 64     sub   r4
000A:86AA 0A 09        bpl   86B5
000A:86AC BC 4F        not
000A:86AE D0           inc   r0
000A:86AF 15 55        add   r5
000A:86B1 05 1B        bra   86CE

000A:86B3 21 1E        move  r14,r1
000A:86B5 65           sub   r5
000A:86B6 0C 05        bcc   86BD
000A:86B8 DC           inc   r12
000A:86B9 FF 4A 87     iwt   r15,#874A
000A:86BC D5           inc   r5
000A:86BD 25 6C        sub   r12
000A:86BF B7 6C        sub   r12
000A:86C1 17 6C        sub   r12
000A:86C3 F0 26 FF     iwt   r0,#FF26
000A:86C6 2F 1D        move  r13,r15
000A:86C8 39           stw   (r9)
000A:86C9 E9           dec   r9
000A:86CA E9           dec   r9
000A:86CB 3C           loop
000A:86CC D0           inc   r0
000A:86CD 21 1E        move  r14,r1
000A:86CF D1           inc   r1
000A:86D0 FA 00 22     iwt   r10,#2200
000A:86D3 23 16        move  r6,r3
000A:86D5 14 EF        getb
000A:86D7 22 1E        move  r14,r2
000A:86D9 D2           inc   r2
000A:86DA 18 EF        getb
000A:86DC B8 64        sub   r4
000A:86DE 4D           swap
000A:86DF 9F           fmult
000A:86E0 3D 54        adc   r4
000A:86E2 2C B0        moves r12,r0
000A:86E4 09 63        beq   8749
000A:86E6 50           add   r0
000A:86E7 5A           add   r10
000A:86E8 16 40        ldw   (r0)
000A:86EA B4 4D        swap
000A:86EC 9F           fmult
000A:86ED 14 3F 50     adc   #00
000A:86F0 B8 4D        swap
000A:86F2 9F           fmult
000A:86F3 18 3F 50     adc   #00
000A:86F6 23 16        move  r6,r3
000A:86F8 AA 00        ibt   r10,#0000
000A:86FA 2A 1B        move  r11,r10
000A:86FC B5 6C        sub   r12
000A:86FE D0           inc   r0
000A:86FF 0A 02        bpl   8703
000A:8701 1C 5C        add   r12
000A:8703 2F 1D        move  r13,r15
000A:8705 F0 B1 00     iwt   r0,#00B1
000A:8708 65           sub   r5
000A:8709 0B 36        bmi   8741
000A:870B BA C0        hib
000A:870D 50           add   r0
000A:870E 1E 51        add   r1
000A:8710 3F EF        getbs
000A:8712 DE           inc   r14
000A:8713 3E A0 00     sms   (0000),r0
000A:8716 13 EF        getb
000A:8718 BB C0        hib
000A:871A 50           add   r0
000A:871B 1E 52        add   r2
000A:871D 3F EF        getbs
000A:871F DE           inc   r14
000A:8720 3E A0 01     sms   (0002),r0
000A:8723 EF           getb
000A:8724 63           sub   r3
000A:8725 4D           swap
000A:8726 9F           fmult
000A:8727 3D 53        adc   r3
000A:8729 65           sub   r5
000A:872A 3E 68        sub   #08
000A:872C 39           stw   (r9)
000A:872D 3D A3 00     lms   r3,(0000)
000A:8730 3D A0 01     lms   r0,(0002)
000A:8733 63           sub   r3
000A:8734 4D           swap
000A:8735 9F           fmult
000A:8736 3D 53        adc   r3
000A:8738 3D A3 02     lms   r3,(0004)
000A:873B 53           add   r3
000A:873C 37           stw   (r7)
000A:873D E9           dec   r9
000A:873E E9           dec   r9
000A:873F E7           dec   r7
000A:8740 E7           dec   r7
000A:8741 2A 54        add   r4
000A:8743 2B 58        add   r8
000A:8745 3C           loop
000A:8746 E5           dec   r5
000A:8747 0B 16        bmi   875F
000A:8749 D5           inc   r5
000A:874A F0 D2 00     iwt   r0,#00D2
000A:874D 65           sub   r5
000A:874E 0A 02        bpl   8752
000A:8750 15 55        add   r5
000A:8752 25 1C        move  r12,r5
000A:8754 B5 4F        not
000A:8756 3E 67        sub   #07
000A:8758 2F 1D        move  r13,r15
000A:875A 39           stw   (r9)
000A:875B E9           dec   r9
000A:875C E9           dec   r9
000A:875D 3C           loop
000A:875E D0           inc   r0
000A:875F 94           link  #04
000A:8760 FF F2 84     iwt   r15,#84F2
000A:8763 02           cache
000A:8764 00           stop
000A:8765 01           nop

DATA_0A8766:         dw $003B, $001F, $002B, $0034
DATA_0A876E:         dw $003B, $0042, $0047, $004B
DATA_0A8776:         dw $004F, $0053, $0056, $0059
DATA_0A877E:         dw $005B, $005D, $005F, $0060
DATA_0A8786:         dw $0061, $0062, $0063, $0063
DATA_0A878E:         dw $0063, $0063, $0063, $0063
DATA_0A8796:         dw $0063, $0063, $0062, $0062
DATA_0A879E:         dw $0061, $0061, $0060, $0060
DATA_0A87A6:         dw $005F, $005E, $005D, $005C
DATA_0A87AE:         dw $005B, $005A, $0059, $0057
DATA_0A87B6:         dw $0056, $0055, $0053, $0051
DATA_0A87BE:         dw $004F, $004E, $004B, $0049
DATA_0A87C6:         dw $0047, $0044, $0042, $003F
DATA_0A87CE:         dw $003B, $0038, $0034, $0030
DATA_0A87D6:         dw $002B, $0025, $001F, $2E16
DATA_0A87DE:         dw $3C00, $3E00, $3E00, $3E00
DATA_0A87E6:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A87EE:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A87F6:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A87FE:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A8806:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A880E:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A8816:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A881E:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A8826:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A882E:         dw $3E00, $3E00, $3E00, $3E00
DATA_0A8836:         dw $3E00, $3C00, $003E, $005C
DATA_0A883E:         dw $005E, $005E, $005E, $005E
DATA_0A8846:         dw $005E, $005E, $005E, $005E
DATA_0A884E:         dw $005E, $005E, $005E, $005E
DATA_0A8856:         dw $005E, $005E, $005E, $005E
DATA_0A885E:         dw $005E, $005E, $005E, $005E
DATA_0A8866:         dw $005E, $005E, $005E, $005E
DATA_0A886E:         dw $005E, $005E, $005E, $005E
DATA_0A8876:         dw $005E, $005E, $005E, $005E
DATA_0A887E:         dw $005E, $005E, $005E, $005E
DATA_0A8886:         dw $005E, $005E, $005E, $005E
DATA_0A888E:         dw $005E, $005E, $005E, $005E
DATA_0A8896:         dw $005E, $005E, $005E, $005E
DATA_0A889E:         dw $005E, $005E, $005E, $005E
DATA_0A88A6:         dw $005E, $005E, $005E, $005E
DATA_0A88AE:         dw $005E, $005E, $005E, $005E
DATA_0A88B6:         dw $5E5C, $7C00, $7E00, $7E00
DATA_0A88BE:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88C6:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88CE:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88D6:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88DE:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88E6:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88EE:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88F6:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A88FE:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8906:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A890E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8916:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A891E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8926:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A892E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8936:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A893E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8946:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A894E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8956:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A895E:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A8966:         dw $7E00, $7E00, $7E00, $7E00
DATA_0A896E:         dw $7E00, $7E00, $7C00

000A:8974 F0 38 8A     iwt   r0,#8A38
000A:8977 05 04        bra   897D

000A:8979 01           nop

000A:897A F0 44 8A     iwt   r0,#8A44
000A:897D 3E A0 10     sms   (0020),r0
000A:8980 3E A2 00     sms   (0000),r2
000A:8983 3E A2 12     sms   (0024),r2
000A:8986 3E A3 01     sms   (0002),r3
000A:8989 3E A5 02     sms   (0004),r5
000A:898C 3E A7 03     sms   (0006),r7
000A:898F A0 0A        ibt   r0,#000A
000A:8991 3F DF        romb
000A:8993 FE 50 8A     iwt   r14,#8A50
000A:8996 EF           getb
000A:8997 1A 4D        swap
000A:8999 23 3E 68     sub   #08
000A:899C F0 00 22     iwt   r0,#2200
000A:899F 57           add   r7
000A:89A0 57           add   r7
000A:89A1 18 40        ldw   (r0)
000A:89A3 F9 D1 00     iwt   r9,#00D1
000A:89A6 02           cache
000A:89A7 A0 60        ibt   r0,#0060
000A:89A9 52           add   r2
000A:89AA FB C0 01     iwt   r11,#01C0
000A:89AD 6B           sub   r11
000A:89AE 0C 07        bcc   89B7
000A:89B0 01           nop
000A:89B1 A2 80        ibt   r2,#FF80
000A:89B3 FF 24 8A     iwt   r15,#8A24
000A:89B6 01           nop
000A:89B7 FB 14 35     iwt   r11,#3514
000A:89BA FD D0 00     iwt   r13,#00D0
000A:89BD BD 63        sub   r3
000A:89BF 0A 14        bpl   89D5
000A:89C1 16 4F        not
000A:89C3 D6           inc   r6
000A:89C4 B8 3D 9F     lmult
000A:89C7 3F 50        adc   #00
000A:89C9 09 03        beq   89CE
000A:89CB 01           nop
000A:89CC 2A 14        move  r4,r10
000A:89CE 2A 64        sub   r4
000A:89D0 29 1C        move  r12,r9
000A:89D2 05 1F        bra   89F3

000A:89D4 DE           inc   r14
000A:89D5 20 1C        move  r12,r0
000A:89D7 BD 6C        sub   r12
000A:89D9 0A 04        bpl   89DF
000A:89DB DC           inc   r12
000A:89DC 2D 1C        move  r12,r13
000A:89DE DC           inc   r12
000A:89DF 29 6C        sub   r12
000A:89E1 F0 26 FF     iwt   r0,#FF26
000A:89E4 2F 1D        move  r13,r15
000A:89E6 3B           stw   (r11)
000A:89E7 EB           dec   r11
000A:89E8 EB           dec   r11
000A:89E9 3C           loop
000A:89EA D0           inc   r0
000A:89EB 2C B9        moves r12,r9
000A:89ED 0A 04        bpl   89F3
000A:89EF DE           inc   r14
000A:89F0 FF 24 8A     iwt   r15,#8A24
000A:89F3 25 16        move  r6,r5
000A:89F5 2E 17        move  r7,r14
000A:89F7 DC           inc   r12
000A:89F8 2F 1D        move  r13,r15
000A:89FA 2A 68        sub   r8
000A:89FC 0B 1B        bmi   8A19
000A:89FE BA C0        hib
000A:8A00 1E 57        add   r7
000A:8A02 F5 00 01     iwt   r5,#0100
000A:8A05 61           sub   r1
000A:8A06 0D 03        bcs   8A0B
000A:8A08 01           nop
000A:8A09 25 55        add   r5
000A:8A0B EF           getb
000A:8A0C 4D           swap
000A:8A0D 9F           fmult
000A:8A0E 6C           sub   r12
000A:8A0F 3E 68        sub   #08
000A:8A11 55           add   r5
000A:8A12 3B           stw   (r11)
000A:8A13 EB           dec   r11
000A:8A14 3C           loop
000A:8A15 EB           dec   r11
000A:8A16 FF 24 8A     iwt   r15,#8A24
000A:8A19 BC 4F        not
000A:8A1B 3E 67        sub   #07
000A:8A1D 2F 1D        move  r13,r15
000A:8A1F 3B           stw   (r11)
000A:8A20 EB           dec   r11
000A:8A21 EB           dec   r11
000A:8A22 3C           loop
000A:8A23 D0           inc   r0
000A:8A24 F0 80 00     iwt   r0,#0080
000A:8A27 62           sub   r2
000A:8A28 FB 16 35     iwt   r11,#3516
000A:8A2B FC D2 00     iwt   r12,#00D2
000A:8A2E 2F 1D        move  r13,r15
000A:8A30 3B           stw   (r11)
000A:8A31 DB           inc   r11
000A:8A32 3C           loop
000A:8A33 DB           inc   r11
000A:8A34 FF 90 83     iwt   r15,#8390
000A:8A37 01           nop

DATA_0A8A38:         db $C1, $C0, $3F, $C0, $D6, $F0, $2A, $F0
DATA_0A8A40:         db $00, $81, $00, $0E

DATA_0A8A44:         db $C1, $C0, $3F, $C0, $D6, $F0, $2A, $F0
DATA_0A8A4C:         db $00, $81, $00, $0A

DATA_0A8A50:         db $7F, $00, $17, $20, $27, $2D, $36, $3A
DATA_0A8A58:         db $3E, $41, $45, $48, $4B, $4D, $50, $52
DATA_0A8A60:         db $55, $57, $59, $5B, $5D, $5F, $60, $62
DATA_0A8A68:         db $64, $65, $67, $68, $6A, $6B, $6C, $6D
DATA_0A8A70:         db $6F, $70, $71, $72, $73, $74, $75, $75
DATA_0A8A78:         db $76, $77, $78, $78, $79, $7A, $7A, $7B
DATA_0A8A80:         db $7B, $7C, $7C, $7D, $7D, $7D, $7E, $7E
DATA_0A8A88:         db $7E, $7E, $7F, $7F, $7F, $7F, $7F, $7F
DATA_0A8A90:         db $7F, $7F, $7F, $7F, $7F, $7E, $7E, $7E
DATA_0A8A98:         db $7E, $7D, $7D, $7D, $7C, $7C, $7B, $7B
DATA_0A8AA0:         db $7A, $7A, $79, $78, $78, $77, $76, $75
DATA_0A8AA8:         db $75, $74, $73, $72, $71, $70, $6F, $6D
DATA_0A8AB0:         db $6C, $6B, $6A, $68, $67, $65, $64, $62
DATA_0A8AB8:         db $60, $5F, $5D, $5B, $59, $57, $55, $52
DATA_0A8AC0:         db $50, $4D, $4B, $48, $45, $41, $3E, $3A
DATA_0A8AC8:         db $36, $32, $2D, $27, $20, $17, $00

000A:8AD0 94           link  #04
000A:8AD1 FF 5E 8B     iwt   r15,#8B5E
000A:8AD4 02           cache
000A:8AD5 F1 00 0F     iwt   r1,#0F00
000A:8AD8 F2 38 1D     iwt   r2,#1D38
000A:8ADB F3 D6 1C     iwt   r3,#1CD6
000A:8ADE F0 37 1D     iwt   r0,#1D37
000A:8AE1 3D A4 09     lms   r4,(0012)
000A:8AE4 54           add   r4
000A:8AE5 3D 40        ldb   (r0)
000A:8AE7 50           add   r0
000A:8AE8 14 50        add   r0
000A:8AEA 3D FA 94 00  lm    r10,(0094)
000A:8AEE AC 18        ibt   r12,#0018
000A:8AF0 3D F0 9C 00  lm    r0,(009C)
000A:8AF4 1B 3E 58     add   #08
000A:8AF7 02           cache
000A:8AF8 FD FC 8A     iwt   r13,#8AFC
000A:8AFB 24 3E 64     sub   #04
000A:8AFE 0A 04        bpl   8B04
000A:8B00 B1 A4 5C     ibt   r4,#005C
000A:8B03 B1 54        add   r4
000A:8B05 3D 40        ldb   (r0)
000A:8B07 3E 6E        sub   #0E
000A:8B09 0C 33        bcc   8B3E
000A:8B0B B2 54        add   r4
000A:8B0D 40           ldw   (r0)
000A:8B0E 3E 60        sub   #00
000A:8B10 09 2C        beq   8B3E
000A:8B12 B3 54        add   r4
000A:8B14 1E 40        ldw   (r0)
000A:8B16 2E 6A        sub   r10
000A:8B18 D0           inc   r0
000A:8B19 D0           inc   r0
000A:8B1A 40           ldw   (r0)
000A:8B1B 6B           sub   r11
000A:8B1C 65           sub   r5
000A:8B1D 0D 28        bcs   8B47
000A:8B1F 55           add   r5
000A:8B20 20 19        move  r9,r0
000A:8B22 50           add   r0
000A:8B23 56           add   r6
000A:8B24 40           ldw   (r0)
000A:8B25 59           add   r9
000A:8B26 3E 59        add   #09
000A:8B28 18 9E        lob
000A:8B2A B7 59        add   r9
000A:8B2C 59           add   r9
000A:8B2D 19 40        ldw   (r0)
000A:8B2F F0 80 00     iwt   r0,#0080
000A:8B32 69           sub   r9
000A:8B33 6E           sub   r14
000A:8B34 0A 03        bpl   8B39
000A:8B36 01           nop
000A:8B37 4F           not
000A:8B38 D0           inc   r0
000A:8B39 50           add   r0
000A:8B3A 68           sub   r8
000A:8B3B 0D 0A        bcs   8B47
000A:8B3D 01           nop
000A:8B3E 3C           loop
000A:8B3F 24 3D A1 09  lms   r1,(0012)
000A:8B43 14           to    r4
000A:8B44 05 0F        bra   8B55

000A:8B46 60           sub   r0

000A:8B47 3D A1 09     lms   r1,(0012)
000A:8B4A F0 37 1D     iwt   r0,#1D37
000A:8B4D 12 51        add   r1
000A:8B4F B4 03        lsr
000A:8B51 03           lsr
000A:8B52 3D 32        stb   (r2)
000A:8B54 D4           inc   r4
000A:8B55 F0 36 1D     iwt   r0,#1D36
000A:8B58 51           add   r1
000A:8B59 B4 3D 30     stb   (r0)
000A:8B5C 00           stop
000A:8B5D 01           nop

000A:8B5E A0 FF        ibt   r0,#FFFF
000A:8B60 3E AB 30     sms   (0060),r11
000A:8B63 20 1B        move  r11,r0
000A:8B65 A0 0A        ibt   r0,#000A
000A:8B67 3F DF        romb
000A:8B69 FE F0 85     iwt   r14,#85F0
000A:8B6C 3D A0 0C     lms   r0,(0018)
000A:8B6F 3E 60        sub   #00
000A:8B71 09 03        beq   8B76
000A:8B73 2E 3E 5A     add   #0A
000A:8B76 3D A1 0A     lms   r1,(0014)
000A:8B79 3D A0 0B     lms   r0,(0016)
000A:8B7C 12 3E 68     sub   #08
000A:8B7F F5 D2 00     iwt   r5,#00D2
000A:8B82 F6 72 33     iwt   r6,#3372
000A:8B85 F7 16 35     iwt   r7,#3516
000A:8B88 F3 80 00     iwt   r3,#0080
000A:8B8B AA 00        ibt   r10,#0000
000A:8B8D AC 05        ibt   r12,#0005
000A:8B8F FD 93 8B     iwt   r13,#8B93
000A:8B92 2A 5A        add   r10
000A:8B94 3F EF        getbs
000A:8B96 DE           inc   r14
000A:8B97 14 51        add   r1
000A:8B99 3F EF        getbs
000A:8B9B DE           inc   r14
000A:8B9C 52           add   r2
000A:8B9D 20 19        move  r9,r0
000A:8B9F 65           sub   r5
000A:8BA0 0D 1A        bcs   8BBC
000A:8BA2 55           add   r5
000A:8BA3 50           add   r0
000A:8BA4 56           add   r6
000A:8BA5 40           ldw   (r0)
000A:8BA6 59           add   r9
000A:8BA7 3E 59        add   #09
000A:8BA9 18 7B        and   r11
000A:8BAB B7 59        add   r9
000A:8BAD 59           add   r9
000A:8BAE 40           ldw   (r0)
000A:8BAF B3 60        sub   r0
000A:8BB1 64           sub   r4
000A:8BB2 0A 03        bpl   8BB7
000A:8BB4 01           nop
000A:8BB5 4F           not
000A:8BB6 D0           inc   r0
000A:8BB7 50           add   r0
000A:8BB8 68           sub   r8
000A:8BB9 0C 02        bcc   8BBD
000A:8BBB 01           nop
000A:8BBC DA           inc   r10
000A:8BBD 3C           loop
000A:8BBE 2A 3E AA 0A  sms   (0014),r10
000A:8BC2 BA 03        lsr
000A:8BC4 0C 57        bcc   8C1D
000A:8BC6 60           sub   r0
000A:8BC7 20 11        move  r1,r0
000A:8BC9 E9           dec   r9
000A:8BCA 0B 28        bmi   8BF4
000A:8BCC B1 3E 5A     add   #0A
000A:8BCF 0B 23        bmi   8BF4
000A:8BD1 B9 65        sub   r5
000A:8BD3 0C 04        bcc   8BD9
000A:8BD5 55           add   r5
000A:8BD6 05 F1        bra   8BC9

000A:8BD8 E1           dec   r1

000A:8BD9 50           add   r0
000A:8BDA 56           add   r6
000A:8BDB 40           ldw   (r0)
000A:8BDC 59           add   r9
000A:8BDD 3E 59        add   #09
000A:8BDF 18 7B        and   r11
000A:8BE1 B7 59        add   r9
000A:8BE3 59           add   r9
000A:8BE4 40           ldw   (r0)
000A:8BE5 B3 60        sub   r0
000A:8BE7 64           sub   r4
000A:8BE8 20 12        move  r2,r0
000A:8BEA 0A 03        bpl   8BEF
000A:8BEC 01           nop
000A:8BED 4F           not
000A:8BEE D0           inc   r0
000A:8BEF 50           add   r0
000A:8BF0 68           sub   r8
000A:8BF1 0D D6        bcs   8BC9
000A:8BF3 E1           dec   r1
000A:8BF4 3E A1 0B     sms   (0016),r1
000A:8BF7 B9 3E 52     add   #02
000A:8BFA 3F 65        cmp   r5
000A:8BFC 0D 09        bcs   8C07
000A:8BFE B8 B0 50     add   r0
000A:8C01 56           add   r6
000A:8C02 40           ldw   (r0)
000A:8C03 59           add   r9
000A:8C04 3E 59        add   #09
000A:8C06 7B           and   r11
000A:8C07 68           sub   r8
000A:8C08 03           lsr
000A:8C09 A3 04        ibt   r3,#0004
000A:8C0B 3F 63        cmp   r3
000A:8C0D 0C 03        bcc   8C12
000A:8C0F 01           nop
000A:8C10 23 10        move  r0,r3
000A:8C12 22 B2        moves r2,r2
000A:8C14 0A 03        bpl   8C19
000A:8C16 01           nop
000A:8C17 3E 55        add   #05
000A:8C19 50           add   r0
000A:8C1A 3E A0 0C     sms   (0018),r0
000A:8C1D F0 04 86     iwt   r0,#8604
000A:8C20 6E           sub   r14
000A:8C21 0C 20        bcc   8C43
000A:8C23 1E 5E        add   r14
000A:8C25 3D A0 0A     lms   r0,(0014)
000A:8C28 3E A0 0D     sms   (001A),r0
000A:8C2B 3D A0 0B     lms   r0,(0016)
000A:8C2E 3E A0 0E     sms   (001C),r0
000A:8C31 3D A0 0C     lms   r0,(0018)
000A:8C34 3E A0 0F     sms   (001E),r0
000A:8C37 3D F1 80 16  lm    r1,(1680)
000A:8C3B 3D F0 82 16  lm    r0,(1682)
000A:8C3F FF 7D 8B     iwt   r15,#8B7D
000A:8C42 12 3D AB 30  lms   r11,(0060)
000A:8C46 9B           jmp   r11
000A:8C47 01           nop

000A:8C48 A0 0A        ibt   r0,#000A
000A:8C4A 3F DF        romb
000A:8C4C AB 00        ibt   r11,#0000
000A:8C4E AC 18        ibt   r12,#0018
000A:8C50 02           cache
000A:8C51 2F 1D        move  r13,r15
000A:8C53 AA 00        ibt   r10,#0000
000A:8C55 F0 00 0F     iwt   r0,#0F00
000A:8C58 5B           add   r11
000A:8C59 40           ldw   (r0)
000A:8C5A 3E 6E        sub   #0E
000A:8C5C 0C 16        bcc   8C74
000A:8C5E 01           nop
000A:8C5F F0 38 1D     iwt   r0,#1D38
000A:8C62 5B           add   r11
000A:8C63 40           ldw   (r0)
000A:8C64 3E 60        sub   #00
000A:8C66 08 0C        bne   8C74
000A:8C68 01           nop
000A:8C69 F0 A2 0F     iwt   r0,#0FA2
000A:8C6C 5B           add   r11
000A:8C6D 40           ldw   (r0)
000A:8C6E A1 1F        ibt   r1,#001F
000A:8C70 71           and   r1
000A:8C71 08 05        bne   8C78
000A:8C73 50           add   r0
000A:8C74 FF 7F 8D     iwt   r15,#8D7F
000A:8C77 DB           inc   r11
000A:8C78 A3 04        ibt   r3,#0004
000A:8C7A F2 0B CF     iwt   r2,#CF0B
000A:8C7D A1 38        ibt   r1,#0038
000A:8C7F 61           sub   r1
000A:8C80 0C 05        bcc   8C87
000A:8C82 51           add   r1
000A:8C83 A3 01        ibt   r3,#0001
000A:8C85 E2           dec   r2
000A:8C86 E2           dec   r2
000A:8C87 FE CA CE     iwt   r14,#CECA
000A:8C8A 1E 5E        add   r14
000A:8C8C EF           getb
000A:8C8D 50           add   r0
000A:8C8E 1E 52        add   r2
000A:8C90 F0 80 16     iwt   r0,#1680
000A:8C93 5B           add   r11
000A:8C94 11 40        ldw   (r0)
000A:8C96 F0 82 16     iwt   r0,#1682
000A:8C99 5B           add   r11
000A:8C9A 40           ldw   (r0)
000A:8C9B 12 3E 68     sub   #08
000A:8C9E F5 D2 00     iwt   r5,#00D2
000A:8CA1 F6 72 33     iwt   r6,#3372
000A:8CA4 F7 16 35     iwt   r7,#3516
000A:8CA7 3E AC 2C     sms   (0058),r12
000A:8CAA 3E AD 2D     sms   (005A),r13
000A:8CAD 23 1C        move  r12,r3
000A:8CAF F3 80 00     iwt   r3,#0080
000A:8CB2 FD B6 8C     iwt   r13,#8CB6
000A:8CB5 2A 5A        add   r10
000A:8CB7 3F EF        getbs
000A:8CB9 DE           inc   r14
000A:8CBA 14 51        add   r1
000A:8CBC 3F EF        getbs
000A:8CBE DE           inc   r14
000A:8CBF 52           add   r2
000A:8CC0 20 19        move  r9,r0
000A:8CC2 65           sub   r5
000A:8CC3 0D 1A        bcs   8CDF
000A:8CC5 55           add   r5
000A:8CC6 50           add   r0
000A:8CC7 56           add   r6
000A:8CC8 40           ldw   (r0)
000A:8CC9 59           add   r9
000A:8CCA 3E 59        add   #09
000A:8CCC 18 9E        lob
000A:8CCE B7 59        add   r9
000A:8CD0 59           add   r9
000A:8CD1 40           ldw   (r0)
000A:8CD2 B3 60        sub   r0
000A:8CD4 64           sub   r4
000A:8CD5 0A 03        bpl   8CDA
000A:8CD7 01           nop
000A:8CD8 4F           not
000A:8CD9 D0           inc   r0
000A:8CDA 50           add   r0
000A:8CDB 68           sub   r8
000A:8CDC 0C 02        bcc   8CE0
000A:8CDE 01           nop
000A:8CDF DA           inc   r10
000A:8CE0 3C           loop
000A:8CE1 2A 3D AC 2C  lms   r12,(0058)
000A:8CE5 3D AD 2D     lms   r13,(005A)
000A:8CE8 BA 03        lsr
000A:8CEA 0C 44        bcc   8D30
000A:8CEC 60           sub   r0
000A:8CED 20 11        move  r1,r0
000A:8CEF BA 3E 72     and   #02
000A:8CF2 09 0A        beq   8CFE
000A:8CF4 B9 95        sex
000A:8CF6 0B 06        bmi   8CFE
000A:8CF8 2A 3F 71     bic   #01
000A:8CFB 05 34        bra   8D31

000A:8CFD BA E9        dec   r9

000A:8CFF 0B 28        bmi   8D29
000A:8D01 B1 3E 5A     add   #0A
000A:8D04 0B 23        bmi   8D29
000A:8D06 B9 65        sub   r5
000A:8D08 0C 04        bcc   8D0E
000A:8D0A 55           add   r5
000A:8D0B 05 F1        bra   8CFE

000A:8D0D E1           dec   r1

000A:8D0E 50           add   r0
000A:8D0F 56           add   r6
000A:8D10 40           ldw   (r0)
000A:8D11 59           add   r9
000A:8D12 3E 59        add   #09
000A:8D14 18 9E        lob
000A:8D16 B7 59        add   r9
000A:8D18 59           add   r9
000A:8D19 40           ldw   (r0)
000A:8D1A B3 60        sub   r0
000A:8D1C 64           sub   r4
000A:8D1D 20 12        move  r2,r0
000A:8D1F 0A 03        bpl   8D24
000A:8D21 01           nop
000A:8D22 4F           not
000A:8D23 D0           inc   r0
000A:8D24 50           add   r0
000A:8D25 68           sub   r8
000A:8D26 0D D6        bcs   8CFE
000A:8D28 E1           dec   r1
000A:8D29 F0 82 11     iwt   r0,#1182
000A:8D2C 5B           add   r11
000A:8D2D 40           ldw   (r0)
000A:8D2E 51           add   r1
000A:8D2F 90           sbk
000A:8D30 BA 3E 7C     and   #0C
000A:8D33 09 32        beq   8D67
000A:8D35 B4 95        sex
000A:8D37 A4 01        ibt   r4,#0001
000A:8D39 0A 03        bpl   8D3E
000A:8D3B 01           nop
000A:8D3C A4 FF        ibt   r4,#FFFF
000A:8D3E F0 E2 10     iwt   r0,#10E2
000A:8D41 5B           add   r11
000A:8D42 40           ldw   (r0)
000A:8D43 54           add   r4
000A:8D44 90           sbk
000A:8D45 F0 E0 15     iwt   r0,#15E0
000A:8D48 5B           add   r11
000A:8D49 40           ldw   (r0)
000A:8D4A 12 3D C4     xor   r4
000A:8D4D 0A 04        bpl   8D53
000A:8D4F 01           nop
000A:8D50 4F           not
000A:8D51 D0           inc   r0
000A:8D52 90           sbk
000A:8D53 F0 20 12     iwt   r0,#1220
000A:8D56 5B           add   r11
000A:8D57 40           ldw   (r0)
000A:8D58 12 3D C4     xor   r4
000A:8D5B 0A 04        bpl   8D61
000A:8D5D D4           inc   r4
000A:8D5E 4F           not
000A:8D5F D0           inc   r0
000A:8D60 90           sbk
000A:8D61 F0 00 14     iwt   r0,#1400
000A:8D64 5B           add   r11
000A:8D65 B4 30        stw   (r0)
000A:8D67 BA 3E 72     and   #02
000A:8D6A 09 12        beq   8D7E
000A:8D6C 01           nop
000A:8D6D F0 22 12     iwt   r0,#1222
000A:8D70 5B           add   r11
000A:8D71 40           ldw   (r0)
000A:8D72 3E 60        sub   #00
000A:8D74 0A 08        bpl   8D7E
000A:8D76 12 60        sub   r0
000A:8D78 F0 22 12     iwt   r0,#1222
000A:8D7B 5B           add   r11
000A:8D7C B2 30        stw   (r0)
000A:8D7E DB           inc   r11
000A:8D7F F0 5F 18     iwt   r0,#185F
000A:8D82 5B           add   r11
000A:8D83 BA 30        stw   (r0)
000A:8D85 DB           inc   r11
000A:8D86 DB           inc   r11
000A:8D87 3C           loop
000A:8D88 DB           inc   r11
000A:8D89 00           stop
000A:8D8A 01           nop

000A:8D8B 3F DF        romb
000A:8D8D 2E 1E        move  r14,r14
000A:8D8F F1 C6 49     iwt   r1,#49C6
000A:8D92 1C 3D 41     ldb   (r1)
000A:8D95 D1           inc   r1
000A:8D96 02           cache
000A:8D97 2F 1D        move  r13,r15
000A:8D99 3D 41        ldb   (r1)
000A:8D9B 12 95        sex
000A:8D9D 3F EF        getbs
000A:8D9F 62           sub   r2
000A:8DA0 09 09        beq   8DAB
000A:8DA2 DE           inc   r14
000A:8DA3 96           asr
000A:8DA4 96           asr
000A:8DA5 96           asr
000A:8DA6 96           asr
000A:8DA7 08 02        bne   8DAB
000A:8DA9 01           nop
000A:8DAA D0           inc   r0
000A:8DAB 52           add   r2
000A:8DAC 3D 31        stb   (r1)
000A:8DAE D1           inc   r1
000A:8DAF 3D 41        ldb   (r1)
000A:8DB1 12 95        sex
000A:8DB3 3F EF        getbs
000A:8DB5 62           sub   r2
000A:8DB6 09 09        beq   8DC1
000A:8DB8 DE           inc   r14
000A:8DB9 96           asr
000A:8DBA 96           asr
000A:8DBB 96           asr
000A:8DBC 96           asr
000A:8DBD 08 02        bne   8DC1
000A:8DBF 01           nop
000A:8DC0 D0           inc   r0
000A:8DC1 52           add   r2
000A:8DC2 3D 31        stb   (r1)
000A:8DC4 3C           loop
000A:8DC5 D1           inc   r1
000A:8DC6 00           stop
000A:8DC7 01           nop

000A:8DC8 3E A1 00     sms   (0000),r1
000A:8DCB 3E A2 01     sms   (0002),r2
000A:8DCE 94           link  #04
000A:8DCF FF FC 8E     iwt   r15,#8EFC
000A:8DD2 01           nop
000A:8DD3 21 13        move  r3,r1
000A:8DD5 3D A4 02     lms   r4,(0004)
000A:8DD8 B4 15 84     mult  r4
000A:8DDB 3D A1 00     lms   r1,(0000)
000A:8DDE B1 16 81     mult  r1
000A:8DE1 3D A2 01     lms   r2,(0002)
000A:8DE4 B2 82        mult  r2
000A:8DE6 56           add   r6
000A:8DE7 65           sub   r5
000A:8DE8 0C 26        bcc   8E10
000A:8DEA 01           nop
000A:8DEB A0 08        ibt   r0,#0008
000A:8DED 3F DF        romb
000A:8DEF F0 18 AE     iwt   r0,#AE18
000A:8DF2 1E 53        add   r3
000A:8DF4 EF           getb
000A:8DF5 84           mult  r4
000A:8DF6 50           add   r0
000A:8DF7 50           add   r0
000A:8DF8 C0           hib
000A:8DF9 95           sex
000A:8DFA 11 4F        not
000A:8DFC D1           inc   r1
000A:8DFD 3E A1 00     sms   (0000),r1
000A:8E00 A0 40        ibt   r0,#0040
000A:8E02 1E 5E        add   r14
000A:8E04 EF           getb
000A:8E05 84           mult  r4
000A:8E06 50           add   r0
000A:8E07 50           add   r0
000A:8E08 C0           hib
000A:8E09 95           sex
000A:8E0A 12 4F        not
000A:8E0C D2           inc   r2
000A:8E0D 3E A2 01     sms   (0002),r2
000A:8E10 A0 7F        ibt   r0,#007F
000A:8E12 3D C3        xor   r3
000A:8E14 D0           inc   r0
000A:8E15 9E           lob
000A:8E16 3E 58        add   #08
000A:8E18 03           lsr
000A:8E19 03           lsr
000A:8E1A 03           lsr
000A:8E1B 03           lsr
000A:8E1C 3E A0 02     sms   (0004),r0
000A:8E1F 20 14        move  r4,r0
000A:8E21 50           add   r0
000A:8E22 F3 C7 49     iwt   r3,#49C7
000A:8E25 13 53        add   r3
000A:8E27 B1 3D 33     stb   (r3)
000A:8E2A D3           inc   r3
000A:8E2B B2 3D 33     stb   (r3)
000A:8E2E B4 3E 62     sub   #02
000A:8E31 3E 7F        and   #0F
000A:8E33 50           add   r0
000A:8E34 F3 C7 49     iwt   r3,#49C7
000A:8E37 13 53        add   r3
000A:8E39 3D 43        ldb   (r3)
000A:8E3B 95           sex
000A:8E3C 11 61        sub   r1
000A:8E3E D3           inc   r3
000A:8E3F 3D 43        ldb   (r3)
000A:8E41 95           sex
000A:8E42 12 62        sub   r2
000A:8E44 94           link  #04
000A:8E45 FF DE 8E     iwt   r15,#8EDE
000A:8E48 01           nop
000A:8E49 3D A0 02     lms   r0,(0004)
000A:8E4C E0           dec   r0
000A:8E4D 3E 7F        and   #0F
000A:8E4F 50           add   r0
000A:8E50 F4 C7 49     iwt   r4,#49C7
000A:8E53 14 54        add   r4
000A:8E55 3D 44        ldb   (r4)
000A:8E57 20 16        move  r6,r0
000A:8E59 3D A1 00     lms   r1,(0000)
000A:8E5C 61           sub   r1
000A:8E5D 15 83        mult  r3
000A:8E5F D4           inc   r4
000A:8E60 3D 44        ldb   (r4)
000A:8E62 20 17        move  r7,r0
000A:8E64 3D A1 01     lms   r1,(0002)
000A:8E67 61           sub   r1
000A:8E68 82           mult  r2
000A:8E69 B5 60        sub   r0
000A:8E6B 50           add   r0
000A:8E6C 50           add   r0
000A:8E6D C0           hib
000A:8E6E 20 15        move  r5,r0
000A:8E70 82           mult  r2
000A:8E71 50           add   r0
000A:8E72 50           add   r0
000A:8E73 C0           hib
000A:8E74 57           add   r7
000A:8E75 3D 34        stb   (r4)
000A:8E77 B5 83        mult  r3
000A:8E79 50           add   r0
000A:8E7A 50           add   r0
000A:8E7B C0           hib
000A:8E7C B6 60        sub   r0
000A:8E7E E4           dec   r4
000A:8E7F 3D 34        stb   (r4)
000A:8E81 3D A0 02     lms   r0,(0004)
000A:8E84 3E 52        add   #02
000A:8E86 3E 7F        and   #0F
000A:8E88 50           add   r0
000A:8E89 F3 C7 49     iwt   r3,#49C7
000A:8E8C 13 53        add   r3
000A:8E8E 3D 43        ldb   (r3)
000A:8E90 95           sex
000A:8E91 3D A1 00     lms   r1,(0000)
000A:8E94 11 61        sub   r1
000A:8E96 D3           inc   r3
000A:8E97 3D 43        ldb   (r3)
000A:8E99 95           sex
000A:8E9A 3D A2 01     lms   r2,(0002)
000A:8E9D 12 62        sub   r2
000A:8E9F 94           link  #04
000A:8EA0 FF DE 8E     iwt   r15,#8EDE
000A:8EA3 01           nop
000A:8EA4 3D A0 02     lms   r0,(0004)
000A:8EA7 D0           inc   r0
000A:8EA8 3E 7F        and   #0F
000A:8EAA 50           add   r0
000A:8EAB F4 C7 49     iwt   r4,#49C7
000A:8EAE 14 54        add   r4
000A:8EB0 3D 44        ldb   (r4)
000A:8EB2 20 16        move  r6,r0
000A:8EB4 3D A1 00     lms   r1,(0000)
000A:8EB7 61           sub   r1
000A:8EB8 15 83        mult  r3
000A:8EBA D4           inc   r4
000A:8EBB 3D 44        ldb   (r4)
000A:8EBD 20 17        move  r7,r0
000A:8EBF 3D A1 01     lms   r1,(0002)
000A:8EC2 61           sub   r1
000A:8EC3 82           mult  r2
000A:8EC4 B5 60        sub   r0
000A:8EC6 50           add   r0
000A:8EC7 50           add   r0
000A:8EC8 C0           hib
000A:8EC9 20 15        move  r5,r0
000A:8ECB 82           mult  r2
000A:8ECC 50           add   r0
000A:8ECD 50           add   r0
000A:8ECE C0           hib
000A:8ECF 57           add   r7
000A:8ED0 3D 34        stb   (r4)
000A:8ED2 B5 83        mult  r3
000A:8ED4 50           add   r0
000A:8ED5 50           add   r0
000A:8ED6 C0           hib
000A:8ED7 B6 60        sub   r0
000A:8ED9 E4           dec   r4
000A:8EDA 3D 34        stb   (r4)
000A:8EDC 00           stop
000A:8EDD 01           nop

000A:8EDE 3E AB 31     sms   (0062),r11
000A:8EE1 94           link  #04
000A:8EE2 FF FC 8E     iwt   r15,#8EFC
000A:8EE5 01           nop
000A:8EE6 A0 08        ibt   r0,#0008
000A:8EE8 3F DF        romb
000A:8EEA F0 18 AE     iwt   r0,#AE18
000A:8EED 1E 51        add   r1
000A:8EEF 12 EF        getb
000A:8EF1 A0 40        ibt   r0,#0040
000A:8EF3 1E 5E        add   r14
000A:8EF5 13 EF        getb
000A:8EF7 3D AB 31     lms   r11,(0062)
000A:8EFA 9B           jmp   r11
000A:8EFB 01           nop

000A:8EFC 3E AB 30     sms   (0060),r11
000A:8EFF F0 74 BC     iwt   r0,#BC74
000A:8F02 A8 0B        ibt   r8,#000B
000A:8F04 A5 0A        ibt   r5,#000A
000A:8F06 2F 1B        move  r11,r15
000A:8F08 3D 98        ljmp  r8
000A:8F0A 01           nop

000A:8F0B 3D AB 30     lms   r11,(0060)
000A:8F0E 9B           jmp   r11
000A:8F0F 01           nop

000A:8F10 02           cache
000A:8F11 A0 08        ibt   r0,#0008
000A:8F13 3F DF        romb
000A:8F15 23 9E        lob
000A:8F17 29 9E        lob
000A:8F19 FC D2 00     iwt   r12,#00D2
000A:8F1C 2F 1D        move  r13,r15
000A:8F1E 21 9E        lob
000A:8F20 F0 18 AC     iwt   r0,#AC18
000A:8F23 51           add   r1
000A:8F24 1E 51        add   r1
000A:8F26 EF           getb
000A:8F27 DE           inc   r14
000A:8F28 3D EF        getbh
000A:8F2A 22 16        move  r6,r2
000A:8F2C 3D 9F        lmult
000A:8F2E 24 C0        hib
000A:8F30 9E           lob
000A:8F31 4D           swap
000A:8F32 C4           or    r4
000A:8F33 5A           add   r10
000A:8F34 35           stw   (r5)
000A:8F35 D5           inc   r5
000A:8F36 D5           inc   r5
000A:8F37 21 53        add   r3
000A:8F39 27 9E        lob
000A:8F3B F0 18 AC     iwt   r0,#AC18
000A:8F3E 57           add   r7
000A:8F3F 1E 57        add   r7
000A:8F41 EF           getb
000A:8F42 DE           inc   r14
000A:8F43 3D EF        getbh
000A:8F45 28 16        move  r6,r8
000A:8F47 3D 9F        lmult
000A:8F49 24 C0        hib
000A:8F4B 9E           lob
000A:8F4C 4D           swap
000A:8F4D C4           or    r4
000A:8F4E 5B           add   r11
000A:8F4F 35           stw   (r5)
000A:8F50 27 59        add   r9
000A:8F52 D5           inc   r5
000A:8F53 3C           loop
000A:8F54 D5           inc   r5
000A:8F55 00           stop
000A:8F56 01           nop

000A:8F57 3F DF        romb
000A:8F59 2E 1E        move  r14,r14
000A:8F5B F1 C6 49     iwt   r1,#49C6
000A:8F5E 3D 41        ldb   (r1)
000A:8F60 D1           inc   r1
000A:8F61 20 1C        move  r12,r0
000A:8F63 1B 50        add   r0
000A:8F65 EF           getb
000A:8F66 DE           inc   r14
000A:8F67 4D           swap
000A:8F68 9F           fmult
000A:8F69 3D 31        stb   (r1)
000A:8F6B D1           inc   r1
000A:8F6C EF           getb
000A:8F6D DE           inc   r14
000A:8F6E 4D           swap
000A:8F6F 9F           fmult
000A:8F70 3D 31        stb   (r1)
000A:8F72 D1           inc   r1
000A:8F73 F2 81 FF     iwt   r2,#FF81
000A:8F76 12 52        add   r2
000A:8F78 A3 00        ibt   r3,#0000
000A:8F7A EC           dec   r12
000A:8F7B 02           cache
000A:8F7C 2F 1D        move  r13,r15
000A:8F7E EF           getb
000A:8F7F DE           inc   r14
000A:8F80 4D           swap
000A:8F81 9F           fmult
000A:8F82 3D 31        stb   (r1)
000A:8F84 EF           getb
000A:8F85 4D           swap
000A:8F86 9F           fmult
000A:8F87 14 62        sub   r2
000A:8F89 0A 16        bpl   8FA1
000A:8F8B DE           inc   r14
000A:8F8C B2 63        sub   r3
000A:8F8E 0A 0F        bpl   8F9F
000A:8F90 B1 15 3E 62  sub   #02
000A:8F94 13 3D 45     ldb   (r5)
000A:8F97 B4 4F        not
000A:8F99 D0           inc   r0
000A:8F9A 03           lsr
000A:8F9B 03           lsr
000A:8F9C 53           add   r3
000A:8F9D 3D 35        stb   (r5)
000A:8F9F 22 10        move  r0,r2
000A:8FA1 D1           inc   r1
000A:8FA2 3D 31        stb   (r1)
000A:8FA4 20 13        move  r3,r0
000A:8FA6 3C           loop
000A:8FA7 D1           inc   r1
000A:8FA8 F1 C7 49     iwt   r1,#49C7
000A:8FAB F2 76 4C     iwt   r2,#4C76
000A:8FAE 2B 1C        move  r12,r11
000A:8FB0 2F 1D        move  r13,r15
000A:8FB2 3D 41        ldb   (r1)
000A:8FB4 3D 32        stb   (r2)
000A:8FB6 D1           inc   r1
000A:8FB7 3C           loop
000A:8FB8 D2           inc   r2
000A:8FB9 00           stop
000A:8FBA 01           nop

000A:8FBB F3 76 4C     iwt   r3,#4C76
000A:8FBE F1 C6 49     iwt   r1,#49C6
000A:8FC1 1C 3D 41     ldb   (r1)
000A:8FC4 D1           inc   r1
000A:8FC5 02           cache
000A:8FC6 2F 1D        move  r13,r15
000A:8FC8 3D 41        ldb   (r1)
000A:8FCA 12 95        sex
000A:8FCC 3D 43        ldb   (r3)
000A:8FCE D3           inc   r3
000A:8FCF 95           sex
000A:8FD0 62           sub   r2
000A:8FD1 09 0A        beq   8FDD
000A:8FD3 D3           inc   r3
000A:8FD4 C0           hib
000A:8FD5 95           sex
000A:8FD6 0B 02        bmi   8FDA
000A:8FD8 01           nop
000A:8FD9 D0           inc   r0
000A:8FDA 52           add   r2
000A:8FDB 3D 31        stb   (r1)
000A:8FDD D1           inc   r1
000A:8FDE 3C           loop
000A:8FDF D1           inc   r1
000A:8FE0 00           stop
000A:8FE1 01           nop

000A:8FE2 FA 76 4C     iwt   r10,#4C76
000A:8FE5 F1 C6 49     iwt   r1,#49C6
000A:8FE8 1C 3D 41     ldb   (r1)
000A:8FEB D1           inc   r1
000A:8FEC D1           inc   r1
000A:8FED 13 3D 41     ldb   (r1)
000A:8FF0 E1           dec   r1
000A:8FF1 F2 96 4C     iwt   r2,#4C96
000A:8FF4 02           cache
000A:8FF5 2F 1D        move  r13,r15
000A:8FF7 15 3D 41     ldb   (r1)
000A:8FFA 21 17        move  r7,r1
000A:8FFC D1           inc   r1
000A:8FFD 3D 41        ldb   (r1)
000A:8FFF D1           inc   r1
000A:9000 95           sex
000A:9001 63           sub   r3
000A:9002 3D 9F        lmult
000A:9004 24 C0        hib
000A:9006 9E           lob
000A:9007 4D           swap
000A:9008 C4           or    r4
000A:9009 18 42        ldw   (r2)
000A:900B D2           inc   r2
000A:900C D2           inc   r2
000A:900D 90           sbk
000A:900E 68           sub   r8
000A:900F 20 18        move  r8,r0
000A:9011 55           add   r5
000A:9012 3D 37        stb   (r7)
000A:9014 3D 4A        ldb   (r10)
000A:9016 58           add   r8
000A:9017 3D 3A        stb   (r10)
000A:9019 DA           inc   r10
000A:901A 3C           loop
000A:901B DA           inc   r10
000A:901C 00           stop
000A:901D 01           nop

DATA_0A901E:         db $C8, $14, $02, $C8, $38, $02, $80, $26
DATA_0A9026:         db $01, $9C, $68, $08, $54, $54, $02, $40
DATA_0A902E:         db $64, $01, $E8, $08, $05, $E0, $76, $05
DATA_0A9036:         db $C0, $8E, $01

000A:9039 A0 0A        ibt   r0,#000A
000A:903B 3F DF        romb
000A:903D FE 1E 90     iwt   r14,#901E
000A:9040 22 3E 68     sub   #08
000A:9043 23 95        sex
000A:9045 24 95        sex
000A:9047 B4 13 63     sub   r3
000A:904A F8 72 33     iwt   r8,#3372
000A:904D F9 16 35     iwt   r9,#3516
000A:9050 02           cache
000A:9051 A7 09        ibt   r7,#0009
000A:9053 EF           getb
000A:9054 DE           inc   r14
000A:9055 3D 83        umult r3
000A:9057 C0           hib
000A:9058 1A 64        sub   r4
000A:905A B2 6A        sub   r10
000A:905C 20 1B        move  r11,r0
000A:905E 50           add   r0
000A:905F 58           add   r8
000A:9060 40           ldw   (r0)
000A:9061 5B           add   r11
000A:9062 3E 59        add   #09
000A:9064 1C 9E        lob
000A:9066 3F EF        getbs
000A:9068 20 1D        move  r13,r0
000A:906A DE           inc   r14
000A:906B 3D 8C        umult r12
000A:906D 50           add   r0
000A:906E C0           hib
000A:906F 50           add   r0
000A:9070 6C           sub   r12
000A:9071 1C 3D 96     div2
000A:9074 B9 5B        add   r11
000A:9076 5B           add   r11
000A:9077 1B 40        ldw   (r0)
000A:9079 F0 80 00     iwt   r0,#0080
000A:907C 6B           sub   r11
000A:907D 5C           add   r12
000A:907E 1B 61        sub   r1
000A:9080 A0 40        ibt   r0,#0040
000A:9082 6D           sub   r13
000A:9083 0D 07        bcs   908C
000A:9085 5D           add   r13
000A:9086 50           add   r0
000A:9087 1D 6D        sub   r13
000A:9089 0C 02        bcc   908D
000A:908B 60           sub   r0
000A:908C BD 3D 86     umult r6
000A:908F 50           add   r0
000A:9090 C0           hib
000A:9091 2A 60        sub   r0
000A:9093 1C EF        getb
000A:9095 DE           inc   r14
000A:9096 2F 1D        move  r13,r15
000A:9098 45           ldw   (r5)
000A:9099 5B           add   r11
000A:909A 90           sbk
000A:909B D5           inc   r5
000A:909C D5           inc   r5
000A:909D 45           ldw   (r5)
000A:909E 6A           sub   r10
000A:909F 25 3E 56     add   #06
000A:90A2 3C           loop
000A:90A3 90           sbk
000A:90A4 E7           dec   r7
000A:90A5 08 AD        bne   9054
000A:90A7 EF           getb
000A:90A8 3D A6 01     lms   r6,(0002)
000A:90AB F0 00 2A     iwt   r0,#2A00
000A:90AE 17 9F        fmult
000A:90B0 A0 58        ibt   r0,#0058
000A:90B2 25 60        sub   r0
000A:90B4 45           ldw   (r5)
000A:90B5 67           sub   r7
000A:90B6 90           sbk
000A:90B7 A0 28        ibt   r0,#0028
000A:90B9 15 55        add   r5
000A:90BB 45           ldw   (r5)
000A:90BC 57           add   r7
000A:90BD A7 10        ibt   r7,#0010
000A:90BF 67           sub   r7
000A:90C0 90           sbk
000A:90C1 3D A0 00     lms   r0,(0000)
000A:90C4 3E 60        sub   #00
000A:90C6 0B 35        bmi   90FD
000A:90C8 01           nop
000A:90C9 A0 30        ibt   r0,#0030
000A:90CB 15 55        add   r5
000A:90CD F0 8F 00     iwt   r0,#008F
000A:90D0 3D 9F        lmult
000A:90D2 F0 80 00     iwt   r0,#0080
000A:90D5 54           add   r4
000A:90D6 1A C0        hib
000A:90D8 B8 52        add   r2
000A:90DA 52           add   r2
000A:90DB 40           ldw   (r0)
000A:90DC 52           add   r2
000A:90DD 3E 59        add   #09
000A:90DF 6A           sub   r10
000A:90E0 1A 3D 96     div2
000A:90E3 B9 52        add   r2
000A:90E5 52           add   r2
000A:90E6 1B 40        ldw   (r0)
000A:90E8 F0 80 00     iwt   r0,#0080
000A:90EB 6B           sub   r11
000A:90EC 61           sub   r1
000A:90ED 1B 5A        add   r10
000A:90EF 3E AB 00     sms   (0000),r11
000A:90F2 AC 04        ibt   r12,#0004
000A:90F4 2F 1D        move  r13,r15
000A:90F6 45           ldw   (r5)
000A:90F7 5B           add   r11
000A:90F8 25 3E 58     add   #08
000A:90FB 3C           loop
000A:90FC 90           sbk
000A:90FD 00           stop
000A:90FE 01           nop

000A:90FF 3F DF        romb
000A:9101 2E 3E 54     add   #04
000A:9104 F1 CB 49     iwt   r1,#49CB
000A:9107 AC 0D        ibt   r12,#000D
000A:9109 F0 00 01     iwt   r0,#0100
000A:910C 67           sub   r7
000A:910D 0B 03        bmi   9112
000A:910F 57           add   r7
000A:9110 27 10        move  r0,r7
000A:9112 20 18        move  r8,r0
000A:9114 B7 03        lsr
000A:9116 03           lsr
000A:9117 03           lsr
000A:9118 17 03        lsr
000A:911A A2 B4        ibt   r2,#FFB4
000A:911C A3 00        ibt   r3,#0000
000A:911E A9 38        ibt   r9,#0038
000A:9120 02           cache
000A:9121 2F 1D        move  r13,r15
000A:9123 EF           getb
000A:9124 DE           inc   r14
000A:9125 4D           swap
000A:9126 28 16        move  r6,r8
000A:9128 9F           fmult
000A:9129 3D 31        stb   (r1)
000A:912B 3F EF        getbs
000A:912D 69           sub   r9
000A:912E 27 16        move  r6,r7
000A:9130 3D 9F        lmult
000A:9132 24 C0        hib
000A:9134 9E           lob
000A:9135 4D           swap
000A:9136 C4           or    r4
000A:9137 59           add   r9
000A:9138 14 62        sub   r2
000A:913A 0A 16        bpl   9152
000A:913C DE           inc   r14
000A:913D B2 63        sub   r3
000A:913F 0A 0F        bpl   9150
000A:9141 B1 15 3E 62  sub   #02
000A:9145 13 3D 45     ldb   (r5)
000A:9148 B4 4F        not
000A:914A D0           inc   r0
000A:914B 03           lsr
000A:914C 03           lsr
000A:914D 53           add   r3
000A:914E 3D 35        stb   (r5)
000A:9150 22 10        move  r0,r2
000A:9152 D1           inc   r1
000A:9153 3D 31        stb   (r1)
000A:9155 20 13        move  r3,r0
000A:9157 3C           loop
000A:9158 D1           inc   r1
000A:9159 FA 00 01     iwt   r10,#0100
000A:915C BA 67        sub   r7
000A:915E 50           add   r0
000A:915F 50           add   r0
000A:9160 6A           sub   r10
000A:9161 0C 03        bcc   9166
000A:9163 5A           add   r10
000A:9164 2A 10        move  r0,r10
000A:9166 20 16        move  r6,r0
000A:9168 F0 00 47     iwt   r0,#4700
000A:916B 9F           fmult
000A:916C A3 38        ibt   r3,#0038
000A:916E 53           add   r3
000A:916F F1 C8 49     iwt   r1,#49C8
000A:9172 3D 31        stb   (r1)
000A:9174 F0 00 08     iwt   r0,#0800
000A:9177 9F           fmult
000A:9178 13 53        add   r3
000A:917A F0 00 01     iwt   r0,#0100
000A:917D 68           sub   r8
000A:917E F6 00 10     iwt   r6,#1000
000A:9181 9F           fmult
000A:9182 53           add   r3
000A:9183 D1           inc   r1
000A:9184 D1           inc   r1
000A:9185 3D 31        stb   (r1)
000A:9187 F2 E6 49     iwt   r2,#49E6
000A:918A 3D 32        stb   (r2)
000A:918C A0 20        ibt   r0,#0020
000A:918E 68           sub   r8
000A:918F 0A 03        bpl   9194
000A:9191 58           add   r8
000A:9192 28 10        move  r0,r8
000A:9194 F6 00 40     iwt   r6,#4000
000A:9197 9F           fmult
000A:9198 E2           dec   r2
000A:9199 3D 32        stb   (r2)
000A:919B 4F           not
000A:919C D0           inc   r0
000A:919D E1           dec   r1
000A:919E 3D 31        stb   (r1)
000A:91A0 00           stop
000A:91A1 01           nop

000A:91A2 22 3E 68     sub   #08
000A:91A5 B2 52        add   r2
000A:91A7 F8 72 33     iwt   r8,#3372
000A:91AA 58           add   r8
000A:91AB 40           ldw   (r0)
000A:91AC 52           add   r2
000A:91AD 3E 59        add   #09
000A:91AF 9E           lob
000A:91B0 20 1C        move  r12,r0
000A:91B2 3D 83        umult r3
000A:91B4 C0           hib
000A:91B5 50           add   r0
000A:91B6 6C           sub   r12
000A:91B7 1C 3D 96     div2
000A:91BA F0 16 35     iwt   r0,#3516
000A:91BD 52           add   r2
000A:91BE 52           add   r2
000A:91BF 1B 40        ldw   (r0)
000A:91C1 F0 80 00     iwt   r0,#0080
000A:91C4 6B           sub   r11
000A:91C5 5C           add   r12
000A:91C6 61           sub   r1
000A:91C7 00           stop
000A:91C8 01           nop

000A:91C9 60           sub   r0
000A:91CA 20 17        move  r7,r0
000A:91CC AC 20        ibt   r12,#0020
000A:91CE FD D2 91     iwt   r13,#91D2
000A:91D1 27 57        add   r7
000A:91D3 24 54        add   r4
000A:91D5 04           rol
000A:91D6 66           sub   r6
000A:91D7 0C 03        bcc   91DC
000A:91D9 56           add   r6
000A:91DA 66           sub   r6
000A:91DB D7           inc   r7
000A:91DC 3C           loop
000A:91DD 27 00        stop
000A:91DF 01           nop

000A:91E0 A0 08        ibt   r0,#0008
000A:91E2 3F DF        romb
000A:91E4 B1 03        lsr
000A:91E6 03           lsr
000A:91E7 03           lsr
000A:91E8 03           lsr
000A:91E9 9E           lob
000A:91EA 17 3D 82     umult r2
000A:91ED B1 3E 7F     and   #0F
000A:91F0 50           add   r0
000A:91F1 3F 88        umult #08
000A:91F3 FE 18 AE     iwt   r14,#AE18
000A:91F6 1E 5E        add   r14
000A:91F8 3F EF        getbs
000A:91FA 50           add   r0
000A:91FB 16 50        add   r0
000A:91FD B7 11 9F     fmult
000A:9200 B5 3D 9F     lmult
000A:9203 24 C0        hib
000A:9205 9E           lob
000A:9206 4D           swap
000A:9207 13 C4        or    r4
000A:9209 A0 40        ibt   r0,#0040
000A:920B 1E 5E        add   r14
000A:920D 3F EF        getbs
000A:920F 50           add   r0
000A:9210 16 50        add   r0
000A:9212 B7 12 9F     fmult
000A:9215 B5 3D 9F     lmult
000A:9218 24 C0        hib
000A:921A 9E           lob
000A:921B 4D           swap
000A:921C 14 C4        or    r4
000A:921E 00           stop
000A:921F 01           nop

; sprite clipping table (8 bytes per clipping type)
DATA_0A9220:         db $08, $00, $08, $00, $06, $00, $06, $00
DATA_0A9228:         db $08, $00, $08, $00, $07, $00, $0C, $00
DATA_0A9230:         db $08, $00, $08, $00, $0C, $00, $0C, $00
DATA_0A9238:         db $08, $00, $FC, $FF, $06, $00, $04, $00
DATA_0A9240:         db $08, $00, $03, $00, $08, $00, $0C, $00
DATA_0A9248:         db $08, $00, $08, $00, $00, $00, $18, $00
DATA_0A9250:         db $08, $00, $04, $00, $06, $00, $0A, $00
DATA_0A9258:         db $08, $00, $F9, $FF, $10, $00, $16, $00
DATA_0A9260:         db $08, $00, $00, $00, $06, $00, $0E, $00
DATA_0A9268:         db $08, $00, $08, $00, $0A, $00, $0A, $00
DATA_0A9270:         db $08, $00, $08, $00, $07, $00, $07, $00
DATA_0A9278:         db $08, $00, $10, $00, $0C, $00, $08, $00
DATA_0A9280:         db $08, $00, $08, $00, $18, $00, $18, $00
DATA_0A9288:         db $08, $00, $F8, $FF, $06, $00, $12, $00
DATA_0A9290:         db $08, $00, $04, $00, $06, $00, $0C, $00
DATA_0A9298:         db $08, $00, $08, $00, $02, $00, $02, $00
DATA_0A92A0:         db $08, $00, $08, $00, $08, $00, $0C, $00
DATA_0A92A8:         db $08, $00, $00, $00, $0E, $00, $16, $00
DATA_0A92B0:         db $08, $00, $08, $00, $0A, $00, $0C, $00
DATA_0A92B8:         db $08, $00, $08, $00, $20, $00, $20, $00
DATA_0A92C0:         db $08, $00, $08, $00, $18, $00, $08, $00
DATA_0A92C8:         db $08, $00, $08, $00, $08, $00, $18, $00
DATA_0A92D0:         db $08, $00, $04, $00, $06, $00, $0A, $00
DATA_0A92D8:         db $08, $00, $00, $00, $0C, $00, $0E, $00
DATA_0A92E0:         db $08, $00, $0E, $00, $06, $00, $0A, $00
DATA_0A92E8:         db $08, $00, $08, $00, $11, $00, $18, $00
DATA_0A92F0:         db $08, $00, $08, $00, $18, $00, $18, $00
DATA_0A92F8:         db $08, $00, $08, $00, $10, $00, $10, $00
DATA_0A9300:         db $08, $00, $08, $00, $0C, $00, $0C, $00
DATA_0A9308:         db $08, $00, $08, $00, $04, $00, $04, $00
DATA_0A9310:         db $08, $00, $09, $00, $08, $00, $0A, $00
DATA_0A9318:         db $08, $00, $0C, $00, $0C, $00, $0C, $00

; some sprite table (bit 8 makes sprites inedible if set)
DATA_0A9320:         dw $0040, $0060, $0060, $0062
DATA_0A9328:         dw $0060, $8420, $0262, $8420
DATA_0A9330:         dw $0060, $8420, $7660, $68A0
DATA_0A9338:         dw $687A, $0060, $0060, $0060
DATA_0A9340:         dw $0160, $0060, $0060, $0060
DATA_0A9348:         dw $0060, $0200, $0560, $4400
DATA_0A9350:         dw $027F, $0000, $0040, $0040
DATA_0A9358:         dw $4480, $0042, $4E00, $0460
DATA_0A9360:         dw $FC20, $0462, $003C, $003C
DATA_0A9368:         dw $003C, $003C, $0037, $023C
DATA_0A9370:         dw $003C, $0037, $0037, $0037
DATA_0A9378:         dw $EC43, $EC40, $E840, $0260
DATA_0A9380:         dw $4E00, $6C00, $0260, $4E60
DATA_0A9388:         dw $0044, $0140, $0040, $2400
DATA_0A9390:         dw $68A0, $0040, $7E00, $7E00
DATA_0A9398:         dw $6C7A, $0060, $0060, $EC40
DATA_0A93A0:         dw $0460, $0460, $0060, $4E02
DATA_0A93A8:         dw $4E02, $0462, $0060, $0660
DATA_0A93B0:         dw $0060, $00A0, $68A0, $68A0
DATA_0A93B8:         dw $6C60, $0060, $0060, $0060
DATA_0A93C0:         dw $0040, $0040, $0060, $0060
DATA_0A93C8:         dw $BE00, $0060, $0060, $0160
DATA_0A93D0:         dw $EE00, $0060, $68A0, $FC20
DATA_0A93D8:         dw $0060, $B46A, $0040, $0040
DATA_0A93E0:         dw $6860, $F620, $4E00, $7480
DATA_0A93E8:         dw $0060, $047E, $BE00, $C060
DATA_0A93F0:         dw $F46A, $F46A, $F46A, $0460
DATA_0A93F8:         dw $0060, $6CA0, $6CA0, $0060
DATA_0A9400:         dw $74A9, $6CA9, $6E60, $0067
DATA_0A9408:         dw $7E00, $6860, $68A0, $68A0
DATA_0A9410:         dw $F466, $F466, $F466, $6860
DATA_0A9418:         dw $6860, $6860, $0060, $6860
DATA_0A9420:         dw $6C20, $6C20, $6CA0, $0060
DATA_0A9428:         dw $007B, $7E00, $8060, $0060
DATA_0A9430:         dw $0060, $0060, $0060, $6C00
DATA_0A9438:         dw $0060, $7C00, $0662, $0060
DATA_0A9440:         dw $0160, $0060, $3420, $0060
DATA_0A9448:         dw $B46A, $0460, $0460, $0060
DATA_0A9450:         dw $0060, $6C00, $F060, $7E00
DATA_0A9458:         dw $0060, $0060, $04A2, $6EA8
DATA_0A9460:         dw $0460, $B620, $6861, $0060
DATA_0A9468:         dw $0060, $0060, $6C60, $6860
DATA_0A9470:         dw $6C60, $0060, $0060, $0060
DATA_0A9478:         dw $0060, $B460, $6E6C, $0460
DATA_0A9480:         dw $0460, $0460, $0460, $0673
DATA_0A9488:         dw $0460, $0460, $0460, $0460
DATA_0A9490:         dw $0460, $0460, $0460, $0460
DATA_0A9498:         dw $0460, $0460, $0460, $0460
DATA_0A94A0:         dw $0460, $0460, $0460, $0460
DATA_0A94A8:         dw $0460, $0460, $0460, $0460
DATA_0A94B0:         dw $0460, $0460, $0060, $0460
DATA_0A94B8:         dw $0460, $0020, $0060, $0060
DATA_0A94C0:         dw $007C, $0060, $0060, $4EBA
DATA_0A94C8:         dw $4EA2, $0060, $0160, $0560
DATA_0A94D0:         dw $0060, $0420, $0460, $0060
DATA_0A94D8:         dw $04A2, $0060, $0060, $6E00
DATA_0A94E0:         dw $6E00, $6C80, $06A0, $06A0
DATA_0A94E8:         dw $6860, $6C00, $260F, $7482
DATA_0A94F0:         dw $6C20, $6C00, $7C00, $7C00
DATA_0A94F8:         dw $6E00, $6E00, $6860, $6860
DATA_0A9500:         dw $6C20, $0060, $4C2D, $4E20
DATA_0A9508:         dw $0060, $78AE, $7C82, $7480
DATA_0A9510:         dw $6CA0, $6E1D, $0462, $6C20
DATA_0A9518:         dw $6C20, $4C10, $6C6F, $F462
DATA_0A9520:         dw $0402, $0060, $0060, $0060
DATA_0A9528:         dw $7E80, $0060, $0060, $066F
DATA_0A9530:         dw $7C00, $6C20, $6C20, $6C20
DATA_0A9538:         dw $68A2, $0060, $0062, $6860
DATA_0A9540:         dw $0462, $0600, $0060, $7E00
DATA_0A9548:         dw $006F, $043E, $00A0, $0060
DATA_0A9550:         dw $0062, $7622, $7C8E, $7C00
DATA_0A9558:         dw $0600, $6C00, $0020, $0020
DATA_0A9560:         dw $0422, $0062, $0462, $0462
DATA_0A9568:         dw $7401, $0460, $6CB1, $6CA0
DATA_0A9570:         dw $06A0, $0400, $4E00, $4E32
DATA_0A9578:         dw $6E20, $0060, $0060, $6CA0
DATA_0A9580:         dw $6CA0, $0060, $7E0F, $4E00
DATA_0A9588:         dw $06A2, $7E80, $7E80, $0460
DATA_0A9590:         dw $0460, $0460, $0460, $0060
DATA_0A9598:         dw $04B4, $FE00, $FE00, $7E00
DATA_0A95A0:         dw $7E00, $7E00, $7E00, $74A0
DATA_0A95A8:         dw $04B5, $4E20, $4E20, $007C
DATA_0A95B0:         dw $0060, $0460, $0460, $0460
DATA_0A95B8:         dw $0460, $0460, $0460, $0460
DATA_0A95C0:         dw $0460, $0460, $0436, $6C20
DATA_0A95C8:         dw $0060, $7422, $6E82, $4C00
DATA_0A95D0:         dw $74A2, $7C2E, $7C2E, $6E00
DATA_0A95D8:         dw $3440, $3440, $0060, $3060
DATA_0A95E0:         dw $3060, $0060, $3440, $6E00
DATA_0A95E8:         dw $6600, $6E00, $4C00, $0620
DATA_0A95F0:         dw $0620, $6618, $6618, $4E38
DATA_0A95F8:         dw $4E38, $4E38, $4E38, $4E38
DATA_0A9600:         dw $C660, $ACA0, $ACA0, $0420
DATA_0A9608:         dw $0420, $0460, $0461, $0460
DATA_0A9610:         dw $0420, $0460, $0420, $0420
DATA_0A9618:         dw $0420, $0420, $0460, $0460
DATA_0A9620:         dw $0060, $4416, $0060, $0060
DATA_0A9628:         dw $2600, $0060, $0060, $0060
DATA_0A9630:         dw $0060, $0060, $0060, $0060
DATA_0A9638:         dw $0060, $0060, $0060, $0062
DATA_0A9640:         dw $6C40, $0060, $4C00, $0160
DATA_0A9648:         dw $6C40, $0060, $0060, $0060
DATA_0A9650:         dw $0060, $04A0, $4E20, $2600
DATA_0A9658:         dw $2600, $4E20, $6600, $4E20
DATA_0A9660:         dw $04A0, $04A0, $0620, $6620
DATA_0A9668:         dw $F479, $C200, $C200, $C200
DATA_0A9670:         dw $C200, $C200, $6EA0, $6E20
DATA_0A9678:         dw $0060, $46A0, $6CA0, $047E
DATA_0A9680:         dw $0060, $006F, $0400, $0240
DATA_0A9688:         dw $0060, $0440, $0040, $0660
DATA_0A9690:         dw $0060, $0660

; freespace
DATA_0A9694:         dw $FFFF, $FFFF
DATA_0A9698:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96A0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96A8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96B0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96B8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96C0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96C8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96D0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96D8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96E0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96E8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96F0:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A96F8:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9700:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9708:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9710:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9718:         dw $FFFF, $FFFF, $FFFF

; sprite table (determines if sprites stay on ledges?)
DATA_0A971E:         dw $4484, $4008, $2000, $4003
DATA_0A9726:         dw $4000, $60A0, $2040, $60A0
DATA_0A972E:         dw $2000, $60A0, $0959, $2021
DATA_0A9736:         dw $20A0, $2000, $2000, $2000
DATA_0A973E:         dw $2000, $2000, $4008, $2000
DATA_0A9746:         dw $2000, $205C, $2000, $0841
DATA_0A974E:         dw $205E, $2040, $401E, $405C
DATA_0A9756:         dw $08A5, $405E, $0E81, $2000
DATA_0A975E:         dw $0801, $4003, $205C, $205C
DATA_0A9766:         dw $205C, $205C, $205C, $6041
DATA_0A976E:         dw $2081, $205A, $205C, $205C
DATA_0A9776:         dw $0040, $4040, $2060, $2000
DATA_0A977E:         dw $0941, $0941, $2000, $0000
DATA_0A9786:         dw $2041, $2040, $2041, $0881
DATA_0A978E:         dw $0040, $4040, $880A, $880A
DATA_0A9796:         dw $2221, $4000, $4000, $4040
DATA_0A979E:         dw $2001, $2000, $2000, $0857
DATA_0A97A6:         dw $0857, $2000, $2040, $A041
DATA_0A97AE:         dw $A000, $2481, $2681, $2681
DATA_0A97B6:         dw $0001, $2040, $4008, $2040
DATA_0A97BE:         dw $4040, $4040, $4000, $2040
DATA_0A97C6:         dw $8841, $405B, $405B, $4000
DATA_0A97CE:         dw $0881, $2040, $0000, $0801
DATA_0A97D6:         dw $4000, $4040, $4040, $4040
DATA_0A97DE:         dw $203B, $604F, $0E81, $0C01
DATA_0A97E6:         dw $405B, $2000, $8841, $2000
DATA_0A97EE:         dw $4040, $4040, $4040, $4000
DATA_0A97F6:         dw $4001, $080A, $080A, $4001
DATA_0A97FE:         dw $0843, $0000, $0006, $4040
DATA_0A9806:         dw $0D41, $0040, $000B, $000B
DATA_0A980E:         dw $2041, $2041, $2041, $0040
DATA_0A9816:         dw $0021, $0040, $4040, $4040
DATA_0A981E:         dw $0020, $0021, $0041, $2000
DATA_0A9826:         dw $2000, $0941, $2040, $2041
DATA_0A982E:         dw $2041, $4040, $4040, $0061
DATA_0A9836:         dw $2016, $0000, $2019, $0000
DATA_0A983E:         dw $4000, $C000, $0841, $4008
DATA_0A9846:         dw $404C, $4040, $4040, $4000
DATA_0A984E:         dw $4000, $0018, $4000, $0D41
DATA_0A9856:         dw $0040, $4001, $400E, $0801
DATA_0A985E:         dw $2000, $4041, $2018, $0801
DATA_0A9866:         dw $0801, $2000, $2000, $2000
DATA_0A986E:         dw $2000, $2000, $2000, $2000
DATA_0A9876:         dw $2000, $4040, $2056, $2020
DATA_0A987E:         dw $2020, $2020, $2020, $2000
DATA_0A9886:         dw $2020, $2020, $2020, $2020
DATA_0A988E:         dw $2020, $2020, $2020, $2020
DATA_0A9896:         dw $2020, $2020, $2020, $2020
DATA_0A989E:         dw $2020, $2020, $2020, $2020
DATA_0A98A6:         dw $2020, $2020, $2020, $2020
DATA_0A98AE:         dw $2020, $2020, $4008, $2020
DATA_0A98B6:         dw $2020, $2061, $2000, $2000
DATA_0A98BE:         dw $2000, $2000, $2401, $001F
DATA_0A98C6:         dw $0003, $4000, $4000, $2000
DATA_0A98CE:         dw $4000, $0012, $2001, $4000
DATA_0A98D6:         dw $4011, $4000, $4000, $84A1
DATA_0A98DE:         dw $8000, $04A0, $0947, $0947
DATA_0A98E6:         dw $0881, $0858, $0800, $0041
DATA_0A98EE:         dw $0800, $0841, $0000, $0000
DATA_0A98F6:         dw $0861, $0861, $3001, $1001
DATA_0A98FE:         dw $0000, $2001, $0801, $0841
DATA_0A9906:         dw $2001, $0955, $0943, $0941
DATA_0A990E:         dw $0801, $2018, $2000, $0941
DATA_0A9916:         dw $0941, $0C99, $0000, $44A3
DATA_0A991E:         dw $A043, $4000, $4000, $2000
DATA_0A9926:         dw $0006, $2000, $2000, $205D
DATA_0A992E:         dw $0941, $0841, $0941, $0841
DATA_0A9936:         dw $201C, $2000, $4003, $0000
DATA_0A993E:         dw $2000, $1149, $2013, $0159
DATA_0A9946:         dw $0000, $E481, $401C, $4000
DATA_0A994E:         dw $4000, $8E83, $0895, $0000
DATA_0A9956:         dw $C000, $0018, $5003, $5003
DATA_0A995E:         dw $5003, $4000, $2003, $2003
DATA_0A9966:         dw $0E96, $2000, $401C, $2000
DATA_0A996E:         dw $2000, $0000, $0C81, $0957
DATA_0A9976:         dw $0000, $2000, $2000, $0000
DATA_0A997E:         dw $0000, $4008, $0841, $0E81
DATA_0A9986:         dw $2083, $0000, $0000, $4000
DATA_0A998E:         dw $4000, $4000, $4000, $0000
DATA_0A9996:         dw $4000, $0000, $0000, $8800
DATA_0A999E:         dw $8800, $8800, $8800, $0000
DATA_0A99A6:         dw $4000, $0053, $0053, $2000
DATA_0A99AE:         dw $4001, $2000, $2000, $2000
DATA_0A99B6:         dw $2000, $2000, $2000, $2000
DATA_0A99BE:         dw $2000, $2000, $0000, $0000
DATA_0A99C6:         dw $2000, $0003, $0000, $0800
DATA_0A99CE:         dw $0003, $0941, $0941, $0941
DATA_0A99D6:         dw $4000, $4000, $405B, $4000
DATA_0A99DE:         dw $4000, $2000, $4000, $0041
DATA_0A99E6:         dw $0841, $8801, $8000, $1858
DATA_0A99EE:         dw $1858, $0C96, $0E96, $1C96
DATA_0A99F6:         dw $1E96, $1856, $1800, $1800
DATA_0A99FE:         dw $0000, $2000, $2000, $0061
DATA_0A9A06:         dw $0061, $0060, $0061, $2063
DATA_0A9A0E:         dw $2061, $2061, $2061, $2061
DATA_0A9A16:         dw $2061, $2061, $2063, $2000
DATA_0A9A1E:         dw $4000, $0E81, $2000, $2000
DATA_0A9A26:         dw $1E81, $401B, $401B, $401B
DATA_0A9A2E:         dw $401B, $401B, $401B, $401B
DATA_0A9A36:         dw $401B, $401B, $401B, $401B
DATA_0A9A3E:         dw $2026, $2142, $0E81, $4000
DATA_0A9A46:         dw $0000, $4000, $4000, $2000
DATA_0A9A4E:         dw $2000, $0000, $0941, $1841
DATA_0A9A56:         dw $10A0, $0000, $0841, $0000
DATA_0A9A5E:         dw $0000, $0000, $E041, $0041
DATA_0A9A66:         dw $4000, $0C98, $0C98, $0C98
DATA_0A9A6E:         dw $0C98, $0C98, $0000, $0000
DATA_0A9A76:         dw $2041, $2499, $201E, $2000
DATA_0A9A7E:         dw $2000, $0000, $E061, $0441
DATA_0A9A86:         dw $0000, $0441, $0001, $0441
DATA_0A9A8E:         dw $0000, $0481, $FFFF, $FFFF
DATA_0A9A96:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9A9E:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AA6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AAE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AB6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9ABE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AC6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9ACE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AD6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9ADE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AE6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AEE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AF6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9AFE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9B06:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9B0E:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9B16:         dw $FFFF, $FFFF, $FFFF

; sprite table: feeds into $7040,x
DATA_0A9B1C:         dw $2009, $2005, $2001, $2005
DATA_0A9B24:         dw $0804, $0904, $0904, $0904
DATA_0A9B2C:         dw $0004, $0904, $3055, $0804
DATA_0A9B34:         dw $8001, $6801, $0002, $0002
DATA_0A9B3C:         dw $6001, $2001, $2005, $0002
DATA_0A9B44:         dw $2001, $0800, $2001, $5001
DATA_0A9B4C:         dw $0904, $0804, $2001, $1005
DATA_0A9B54:         dw $2115, $2001, $1979, $2801
DATA_0A9B5C:         dw $3001, $2805, $0804, $0804
DATA_0A9B64:         dw $0804, $0804, $2005, $0800
DATA_0A9B6C:         dw $2005, $2005, $2005, $2005
DATA_0A9B74:         dw $5001, $0002, $2001, $0804
DATA_0A9B7C:         dw $2951, $0954, $1805, $2855
DATA_0A9B84:         dw $2801, $1901, $0002, $0954
DATA_0A9B8C:         dw $0804, $000A, $3155, $3155
DATA_0A9B94:         dw $2801, $0802, $4005, $0002
DATA_0A9B9C:         dw $2801, $7001, $0006, $4175
DATA_0A9BA4:         dw $4175, $3001, $0002, $2001
DATA_0A9BAC:         dw $3801, $0006, $3005, $3005
DATA_0A9BB4:         dw $3105, $2005, $2005, $7006
DATA_0A9BBC:         dw $0002, $0002, $2001, $3801
DATA_0A9BC4:         dw $3D55, $8809, $6809, $3801
DATA_0A9BCC:         dw $2801, $0804, $2005, $3001
DATA_0A9BD4:         dw $0004, $0804, $0002, $0002
DATA_0A9BDC:         dw $0804, $1801, $3155, $3155
DATA_0A9BE4:         dw $8809, $0804, $3D51, $0004
DATA_0A9BEC:         dw $2005, $2005, $2005, $0800
DATA_0A9BF4:         dw $2005, $2155, $2155, $2005
DATA_0A9BFC:         dw $4979, $4001, $0804, $6001
DATA_0A9C04:         dw $0954, $2105, $3145, $3145
DATA_0A9C0C:         dw $2945, $2945, $2945, $2155
DATA_0A9C14:         dw $2155, $2155, $0002, $6005
DATA_0A9C1C:         dw $2145, $2145, $4105, $4001
DATA_0A9C24:         dw $0006, $0974, $2005, $0800
DATA_0A9C2C:         dw $0804, $1805, $1805, $2085
DATA_0A9C34:         dw $2001, $0106, $3001, $8101
DATA_0A9C3C:         dw $6001, $6001, $1905, $2005
DATA_0A9C44:         dw $2009, $2005, $2005, $2005
DATA_0A9C4C:         dw $2005, $0904, $3009, $0950
DATA_0A9C54:         dw $3901, $2005, $2005, $3955
DATA_0A9C5C:         dw $5005, $0800, $2005, $3001
DATA_0A9C64:         dw $3001, $600D, $0801, $2801
DATA_0A9C6C:         dw $0801, $8001, $0805, $0800
DATA_0A9C74:         dw $2005, $2005, $3101, $2805
DATA_0A9C7C:         dw $2805, $2805, $2805, $0006
DATA_0A9C84:         dw $2805, $0006, $2805, $2805
DATA_0A9C8C:         dw $2805, $2805, $2805, $2805
DATA_0A9C94:         dw $2805, $2805, $2805, $2805
DATA_0A9C9C:         dw $2805, $2805, $2805, $2805
DATA_0A9CA4:         dw $2805, $2805, $2805, $2805
DATA_0A9CAC:         dw $2805, $2805, $8005, $2805
DATA_0A9CB4:         dw $2805, $3805, $2001, $8001
DATA_0A9CBC:         dw $0006, $0006, $2001, $C975
DATA_0A9CC4:         dw $2175, $0002, $6801, $1801
DATA_0A9CCC:         dw $2005, $3802, $4805, $0002
DATA_0A9CD4:         dw $8005, $0002, $0002, $1375
DATA_0A9CDC:         dw $0B74, $3375, $3101, $3101
DATA_0A9CE4:         dw $1805, $0904, $2855, $3151
DATA_0A9CEC:         dw $4955, $4955, $1975, $1175
DATA_0A9CF4:         dw $3945, $3945, $1001, $2001
DATA_0A9CFC:         dw $0900, $1805, $4975, $0974
DATA_0A9D04:         dw $1805, $3155, $3125, $3125
DATA_0A9D0C:         dw $3155, $0904, $2005, $4955
DATA_0A9D14:         dw $4155, $3955, $2005, $3801
DATA_0A9D1C:         dw $3905, $6001, $C001, $1009
DATA_0A9D24:         dw $2145, $0801, $0801, $0804
DATA_0A9D2C:         dw $2175, $2975, $2975, $2975
DATA_0A9D34:         dw $8801, $1801, $2005, $3805
DATA_0A9D3C:         dw $2905, $3905, $0904, $3175
DATA_0A9D44:         dw $1105, $0800, $2005, $0804
DATA_0A9D4C:         dw $2005, $2101, $3955, $2901
DATA_0A9D54:         dw $1051, $0904, $2001, $2001
DATA_0A9D5C:         dw $2001, $0002, $2801, $2801
DATA_0A9D64:         dw $1079, $3801, $7001, $2101
DATA_0A9D6C:         dw $000A, $49D1, $1959, $4159
DATA_0A9D74:         dw $0000, $3801, $0000, $1829
DATA_0A9D7C:         dw $1825, $2005, $1175, $2979
DATA_0A9D84:         dw $5802, $2155, $2155, $9002
DATA_0A9D8C:         dw $4802, $D802, $B002, $0804
DATA_0A9D94:         dw $4005, $1975, $1971, $2875
DATA_0A9D9C:         dw $2875, $2875, $2875, $A906
DATA_0A9DA4:         dw $4005, $1915, $1915, $0006
DATA_0A9DAC:         dw $2005, $3005, $3005, $3005
DATA_0A9DB4:         dw $3005, $3005, $3005, $3005
DATA_0A9DBC:         dw $3005, $3005, $3955, $4955
DATA_0A9DC4:         dw $2401, $5155, $2151, $1905
DATA_0A9DCC:         dw $5155, $3925, $3925, $3955
DATA_0A9DD4:         dw $0904, $0904, $8809, $4001
DATA_0A9DDC:         dw $4001, $0000, $8901, $0804
DATA_0A9DE4:         dw $1875, $1855, $3101, $0974
DATA_0A9DEC:         dw $0974, $3155, $3155, $3155
DATA_0A9DF4:         dw $3155, $5955, $5959, $595D
DATA_0A9DFC:         dw $2105, $A801, $1802, $3005
DATA_0A9E04:         dw $2005, $2005, $4005, $3805
DATA_0A9E0C:         dw $3E05, $2005, $2005, $2005
DATA_0A9E14:         dw $2005, $2005, $6805, $1805
DATA_0A9E1C:         dw $2005, $2975, $0804, $0804
DATA_0A9E24:         dw $1975, $1805, $1805, $1805
DATA_0A9E2C:         dw $1805, $1805, $1805, $1805
DATA_0A9E34:         dw $1805, $1805, $1805, $2005
DATA_0A9E3C:         dw $2005, $0805, $2959, $6001
DATA_0A9E44:         dw $4005, $2005, $800D, $1805
DATA_0A9E4C:         dw $1805, $2005, $1155, $1975
DATA_0A9E54:         dw $2975, $4155, $2155, $4151
DATA_0A9E5C:         dw $380E, $200E, $1801, $2155
DATA_0A9E64:         dw $3005, $3875, $3875, $3875
DATA_0A9E6C:         dw $3875, $3875, $B006, $3951
DATA_0A9E74:         dw $1005, $3001, $1805, $0804
DATA_0A9E7C:         dw $0800, $7101, $0904, $3101
DATA_0A9E84:         dw $1101, $3101, $2101, $3851
DATA_0A9E8C:         dw $0100, $3811

; freespace
DATA_0A9E90:         dw $FFFF, $FFFF
DATA_0A9E94:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9E9C:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EA4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EAC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EB4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EBC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EC4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9ECC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9ED4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EDC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EE4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EEC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EF4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9EFC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9F04:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9F0C:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0A9F14:         dw $FFFF, $FFFF, $FFFF

; sprite table (graphics-related; byte 2 is palette attributes in YXPPCCCT format)
DATA_0A9F1A:         dw $0805, $0007, $0C02, $0805
DATA_0A9F22:         dw $0201, $0604, $1202, $0004
DATA_0A9F2A:         dw $2C07, $0204, $0005, $0002
DATA_0A9F32:         dw $0C05, $0000, $0000, $0000
DATA_0A9F3A:         dw $0005, $1C02, $0207, $00FF
DATA_0A9F42:         dw $02FF, $0A02, $0CFF, $0001
DATA_0A9F4A:         dw $1202, $0202, $0005, $0805
DATA_0A9F52:         dw $0205, $0005, $0005, $0006
DATA_0A9F5A:         dw $0003, $0402, $0005, $0205
DATA_0A9F62:         dw $0405, $0005, $0005, $0205
DATA_0A9F6A:         dw $0005, $0005, $0205, $0005
DATA_0A9F72:         dw $0202, $0E02, $0006, $0C07
DATA_0A9F7A:         dw $0005, $0005, $0007, $0006
DATA_0A9F82:         dw $0C06, $0007, $00FF, $0405
DATA_0A9F8A:         dw $0605, $00FF, $0002, $0002
DATA_0A9F92:         dw $0C05, $0007, $0202, $0000
DATA_0A9F9A:         dw $0002, $0002, $00FF, $0205
DATA_0A9FA2:         dw $0005, $0005, $0005, $0005
DATA_0A9FAA:         dw $12FF, $00FF, $0002, $0002
DATA_0A9FB2:         dw $8005, $0004, $0007, $0000
DATA_0A9FBA:         dw $00FF, $02FF, $0002, $1205
DATA_0A9FC2:         dw $8202, $0005, $0005, $0005
DATA_0A9FCA:         dw $0002, $0405, $0205, $0803
DATA_0A9FD2:         dw $08FF, $0602, $00FF, $00FF
DATA_0A9FDA:         dw $0802, $0A04, $0005, $0802
DATA_0A9FE2:         dw $0805, $0005, $0202, $00FF
DATA_0A9FEA:         dw $0004, $0204, $0404, $0002
DATA_0A9FF2:         dw $0004, $0402, $0402, $0004
DATA_0A9FFA:         dw $0204, $0204, $0807, $0005
DATA_0AA002:         dw $0405, $04FF, $0206, $0206
DATA_0AA00A:         dw $0002, $0002, $0002, $00FF
DATA_0AA012:         dw $00FF, $00FF, $0CFF, $0805
DATA_0AA01A:         dw $02FF, $02FF, $0202, $2007
DATA_0AA022:         dw $00FF, $0003, $0005, $0202
DATA_0AA02A:         dw $0405, $0205, $0805, $0005
DATA_0AA032:         dw $0E05, $00FF, $1204, $0004
DATA_0AA03A:         dw $0005, $0203, $0204, $0007
DATA_0AA042:         dw $0806, $0002, $0802, $0202
DATA_0AA04A:         dw $0A02, $0405, $0005, $0205
DATA_0AA052:         dw $0401, $0202, $0406, $0003
DATA_0AA05A:         dw $0001, $0805, $0403, $0007
DATA_0AA062:         dw $0007, $0006, $0C00, $0C00
DATA_0AA06A:         dw $0C00, $0CFF, $2C00, $0005
DATA_0AA072:         dw $00FF, $0204, $00FF, $0002
DATA_0AA07A:         dw $0002, $0002, $0002, $00FF
DATA_0AA082:         dw $0002, $00FF, $0002, $0002
DATA_0AA08A:         dw $0002, $0002, $0002, $0002
DATA_0AA092:         dw $0002, $0002, $0002, $0002
DATA_0AA09A:         dw $0002, $0002, $0002, $0002
DATA_0AA0A2:         dw $0002, $0002, $0002, $0002
DATA_0AA0AA:         dw $0002, $0002, $0207, $0002
DATA_0AA0B2:         dw $0002, $1005, $02FF, $0CFF
DATA_0AA0BA:         dw $00FF, $00FF, $0405, $0005
DATA_0AA0C2:         dw $0005, $2000, $0005, $0405
DATA_0AA0CA:         dw $0207, $0005, $0005, $0005
DATA_0AA0D2:         dw $0606, $00FF, $0C05, $0005
DATA_0AA0DA:         dw $0C05, $0E05, $0207, $0207
DATA_0AA0E2:         dw $0006, $0007, $1005, $0005
DATA_0AA0EA:         dw $0005, $0005, $1005, $1005
DATA_0AA0F2:         dw $00FF, $00FF, $0007, $0605
DATA_0AA0FA:         dw $0406, $0002, $0005, $0005
DATA_0AA102:         dw $0002, $0005, $0005, $0005
DATA_0AA10A:         dw $0005, $0404, $0206, $0005
DATA_0AA112:         dw $0005, $0005, $0201, $0005
DATA_0AA11A:         dw $0006, $0002, $0002, $0007
DATA_0AA122:         dw $0005, $0007, $0007, $1003
DATA_0AA12A:         dw $0005, $0005, $0405, $0405
DATA_0AA132:         dw $0007, $0006, $0805, $0405
DATA_0AA13A:         dw $0006, $0005, $00FF, $0005
DATA_0AA142:         dw $0004, $0402, $0004, $0804
DATA_0AA14A:         dw $0804, $0002, $0001, $1005
DATA_0AA152:         dw $0002, $0403, $0005, $0405
DATA_0AA15A:         dw $0805, $00FF, $0402, $0402
DATA_0AA162:         dw $0003, $1203, $0007, $0806
DATA_0AA16A:         dw $00FF, $1005, $0005, $0005
DATA_0AA172:         dw $0005, $0005, $00FF, $1005
DATA_0AA17A:         dw $1005, $0007, $00FF, $0005
DATA_0AA182:         dw $0002, $0405, $0405, $0C07
DATA_0AA18A:         dw $0C07, $0C07, $0C07, $0EFF
DATA_0AA192:         dw $0002, $1005, $1005, $0005
DATA_0AA19A:         dw $0005, $0005, $0005, $0005
DATA_0AA1A2:         dw $0002, $0805, $0005, $00FF
DATA_0AA1AA:         dw $0004, $0005, $0005, $0005
DATA_0AA1B2:         dw $0005, $0005, $0005, $0005
DATA_0AA1BA:         dw $0005, $0005, $0005, $0005
DATA_0AA1C2:         dw $00FF, $0405, $0005, $2005
DATA_0AA1CA:         dw $0405, $0205, $0205, $0005
DATA_0AA1D2:         dw $0004, $0204, $0805, $0005
DATA_0AA1DA:         dw $0205, $00FF, $0005, $0005
DATA_0AA1E2:         dw $0005, $0005, $1005, $0004
DATA_0AA1EA:         dw $0204, $0005, $0205, $0005
DATA_0AA1F2:         dw $0205, $0005, $0205, $0205
DATA_0AA1FA:         dw $0005, $0CFF, $0C02, $1005
DATA_0AA202:         dw $1005, $1005, $1005, $1005
DATA_0AA20A:         dw $1005, $1005, $1005, $1005
DATA_0AA212:         dw $1005, $1005, $1005, $0005
DATA_0AA21A:         dw $0005, $0005, $0205, $0005
DATA_0AA222:         dw $0005, $0002, $0002, $0402
DATA_0AA22A:         dw $0402, $0002, $0002, $0402
DATA_0AA232:         dw $0402, $0202, $0202, $0002
DATA_0AA23A:         dw $0005, $0005, $0005, $0005
DATA_0AA242:         dw $3005, $0E05, $0E05, $0006
DATA_0AA24A:         dw $0006, $0205, $0405, $0005
DATA_0AA252:         dw $1005, $1005, $0005, $1005
DATA_0AA25A:         dw $0001, $0001, $0005, $0005
DATA_0AA262:         dw $0C05, $0004, $0004, $0004
DATA_0AA26A:         dw $0004, $0004, $0005, $1003
DATA_0AA272:         dw $0005, $0205, $0004, $0405
DATA_0AA27A:         dw $0205, $0405, $0406, $0005
DATA_0AA282:         dw $0406, $0005, $0206, $0004
DATA_0AA28A:         dw $0005, $0004

; freespace
DATA_0AA28A:         dw $FFFF, $FFFF
DATA_0AA292:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA29A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA2FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA302:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA30A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AA312:         dw $FFFF, $FFFF, $FFFF

; sprite table (sprite gravity)
; pairs of bytes
; first goes in 7542,x table
; second goes in 75E2,x table
DATA_0AA318:         db $10, $40, $60, $60, $00, $00, $40, $40
DATA_0AA320:         db $70, $40, $00, $40, $10, $04, $00, $40
DATA_0AA328:         db $00, $00, $00, $40, $40, $40, $40, $40
DATA_0AA330:         db $40, $40, $00, $00, $00, $00, $00, $00
DATA_0AA338:         db $00, $00, $00, $00, $60, $60, $00, $00
DATA_0AA340:         db $00, $08, $00, $00, $00, $00, $40, $40
DATA_0AA348:         db $10, $C0, $02, $F8, $40, $40, $00, $00
DATA_0AA350:         db $2C, $2C, $40, $40, $40, $40, $00, $40
DATA_0AA358:         db $40, $40, $00, $40, $00, $40, $00, $40
DATA_0AA360:         db $00, $40, $00, $40, $00, $40, $40, $40
DATA_0AA368:         db $40, $40, $00, $40, $00, $40, $00, $40
DATA_0AA370:         db $00, $00, $03, $10, $00, $08, $00, $00
DATA_0AA378:         db $40, $40, $40, $40, $00, $00, $00, $40
DATA_0AA380:         db $00, $40, $00, $00, $00, $00, $04, $04
DATA_0AA388:         db $00, $00, $00, $00, $40, $40, $40, $40
DATA_0AA390:         db $40, $40, $00, $00, $00, $00, $00, $00
DATA_0AA398:         db $40, $40, $00, $00, $00, $00, $40, $40
DATA_0AA3A0:         db $40, $40, $00, $00, $40, $40, $40, $40
DATA_0AA3A8:         db $00, $00, $40, $40, $40, $40, $00, $00
DATA_0AA3B0:         db $00, $40, $00, $00, $60, $60, $00, $00
DATA_0AA3B8:         db $00, $00, $00, $00, $04, $F4, $00, $00
DATA_0AA3C0:         db $00, $40, $00, $28, $00, $28, $00, $00
DATA_0AA3C8:         db $05, $00, $00, $00, $00, $00, $40, $40
DATA_0AA3D0:         db $00, $00, $00, $40, $00, $00, $00, $00
DATA_0AA3D8:         db $2C, $2C, $40, $40, $40, $40, $40, $40
DATA_0AA3E0:         db $00, $28, $00, $00, $40, $40, $00, $00
DATA_0AA3E8:         db $00, $40, $00, $10, $00, $40, $00, $00
DATA_0AA3F0:         db $60, $40, $40, $40, $40, $40, $60, $40
DATA_0AA3F8:         db $2C, $2C, $00, $00, $00, $00, $00, $00
DATA_0AA400:         db $2C, $2C, $00, $00, $00, $40, $00, $40
DATA_0AA408:         db $40, $40, $40, $40, $40, $40, $00, $00
DATA_0AA410:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA418:         db $00, $2C, $00, $2C, $40, $40, $00, $00
DATA_0AA420:         db $00, $00, $2C, $2C, $40, $08, $40, $40
DATA_0AA428:         db $20, $20, $00, $00, $00, $00, $00, $00
DATA_0AA430:         db $00, $40, $00, $00, $10, $0C, $00, $00
DATA_0AA438:         db $00, $00, $00, $00, $40, $40, $60, $60
DATA_0AA440:         db $00, $40, $00, $00, $00, $00, $00, $00
DATA_0AA448:         db $00, $40, $00, $00, $00, $00, $2C, $2C
DATA_0AA450:         db $00, $40, $40, $40, $40, $40, $40, $40
DATA_0AA458:         db $00, $00, $40, $40, $40, $40, $40, $40
DATA_0AA460:         db $40, $40, $00, $00, $08, $10, $08, $10
DATA_0AA468:         db $00, $00, $00, $00, $00, $00, $40, $40
DATA_0AA470:         db $00, $00, $00, $40, $00, $00, $00, $00
DATA_0AA478:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA480:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA488:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA490:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA498:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA4A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA4A8:         db $00, $00, $00, $00, $60, $60, $00, $00
DATA_0AA4B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA4B8:         db $00, $00, $00, $00, $40, $40, $40, $40
DATA_0AA4C0:         db $40, $40, $00, $00, $00, $00, $00, $40
DATA_0AA4C8:         db $00, $00, $08, $10, $40, $40, $40, $40
DATA_0AA4D0:         db $40, $40, $00, $00, $00, $20, $00, $00
DATA_0AA4D8:         db $00, $00, $00, $00, $40, $40, $40, $40
DATA_0AA4E0:         db $40, $40, $00, $30, $00, $00, $34, $34
DATA_0AA4E8:         db $10, $00, $40, $40, $10, $80, $00, $00
DATA_0AA4F0:         db $40, $40, $40, $40, $40, $40, $00, $00
DATA_0AA4F8:         db $00, $40, $40, $40, $40, $40, $40, $40
DATA_0AA500:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_0AA508:         db $40, $40, $00, $00, $00, $00, $40, $40
DATA_0AA510:         db $40, $40, $40, $40, $00, $00, $40, $40
DATA_0AA518:         db $02, $F8, $00, $00, $00, $00, $00, $00
DATA_0AA520:         db $00, $40, $00, $00, $00, $00, $01, $40
DATA_0AA528:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_0AA530:         db $00, $40, $00, $00, $40, $40, $06, $10
DATA_0AA538:         db $00, $00, $40, $40, $00, $10, $40, $40
DATA_0AA540:         db $00, $00, $18, $40, $04, $00, $00, $20
DATA_0AA548:         db $00, $20, $20, $20, $40, $40, $00, $00
DATA_0AA550:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA558:         db $00, $00, $00, $00, $00, $40, $00, $40
DATA_0AA560:         db $40, $40, $00, $00, $00, $40, $00, $00
DATA_0AA568:         db $00, $00, $04, $00, $40, $40, $40, $40
DATA_0AA570:         db $00, $00, $40, $40, $00, $00, $00, $00
DATA_0AA578:         db $00, $00, $60, $60, $00, $40, $40, $40
DATA_0AA580:         db $00, $40, $00, $40, $00, $40, $01, $20
DATA_0AA588:         db $01, $20, $01, $20, $01, $20, $00, $00
DATA_0AA590:         db $00, $00, $00, $00, $00, $00, $00, $40
DATA_0AA598:         db $00, $40, $00, $40, $00, $40, $00, $40
DATA_0AA5A0:         db $00, $00, $40, $C0, $40, $C0, $00, $00
DATA_0AA5A8:         db $60, $40, $00, $00, $00, $00, $00, $00
DATA_0AA5B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA5B8:         db $00, $00, $00, $00, $00, $00, $10, $00
DATA_0AA5C0:         db $00, $00, $20, $20, $00, $60, $00, $40
DATA_0AA5C8:         db $20, $20, $40, $40, $40, $40, $40, $40
DATA_0AA5D0:         db $00, $40, $00, $40, $00, $28, $00, $00
DATA_0AA5D8:         db $00, $00, $00, $00, $00, $00, $40, $40
DATA_0AA5E0:         db $40, $40, $08, $08, $00, $40, $40, $40
DATA_0AA5E8:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_0AA5F0:         db $40, $40, $20, $20, $00, $00, $00, $00
DATA_0AA5F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA600:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA608:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0AA610:         db $00, $00, $00, $00, $00, $00, $04, $E0
DATA_0AA618:         db $00, $00, $40, $40, $00, $00, $00, $00
DATA_0AA620:         db $40, $40, $28, $28, $28, $28, $28, $28
DATA_0AA628:         db $28, $28, $28, $28, $28, $28, $28, $28
DATA_0AA630:         db $28, $28, $28, $28, $28, $28, $28, $28
DATA_0AA638:         db $00, $40, $40, $40, $40, $40, $00, $00
DATA_0AA640:         db $00, $00, $00, $40, $00, $40, $00, $00
DATA_0AA648:         db $00, $00, $00, $00, $40, $40, $40, $40
DATA_0AA650:         db $00, $00, $00, $00, $40, $40, $00, $00
DATA_0AA658:         db $00, $00, $00, $00, $18, $40, $40, $40
DATA_0AA660:         db $00, $80, $40, $40, $40, $40, $00, $40
DATA_0AA668:         db $40, $40, $00, $40, $00, $00, $00, $00
DATA_0AA670:         db $20, $20, $40, $40, $00, $00, $00, $00
DATA_0AA678:         db $00, $00, $00, $00, $20, $50, $40, $40
DATA_0AA680:         db $00, $00, $40, $40, $00, $00, $40, $40
DATA_0AA688:         db $00, $00, $40, $40

; freespace
DATA_0AA68C:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA694:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA69C:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6A4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6AC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6B4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6BC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6C4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6CC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6D4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6DC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6E4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6EC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6F4:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA6FC:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA704:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA70C:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AA714:         db $FF, $FF

; sprite table (GFX file to use)
DATA_0AA716:         dw $0000, $0000, $005A, $0000
DATA_0AA71E:         dw $0000, $0000, $0000, $0000
DATA_0AA726:         dw $0000, $0000, $004A, $004A
DATA_0AA72E:         dw $0000, $0000, $0000, $0000
DATA_0AA736:         dw $0042, $0000, $0000, $0000
DATA_0AA73E:         dw $0000, $0000, $0061, $0068
DATA_0AA746:         dw $0000, $0000, $002E, $0048
DATA_0AA74E:         dw $0000, $002E, $0000, $0031
DATA_0AA756:         dw $004E, $0000, $0000, $0000
DATA_0AA75E:         dw $0000, $0000, $0000, $0000
DATA_0AA766:         dw $0000, $0000, $002F, $002F
DATA_0AA76E:         dw $0032, $0000, $0045, $0028
DATA_0AA776:         dw $0028, $0036, $0028, $0028
DATA_0AA77E:         dw $0042, $0042, $0000, $0046
DATA_0AA786:         dw $0042, $0000, $004F, $004F
DATA_0AA78E:         dw $0000, $0000, $0000, $0000
DATA_0AA796:         dw $0000, $0000, $0000, $0070
DATA_0AA79E:         dw $0070, $0070, $0000, $0000
DATA_0AA7A6:         dw $006A, $0000, $0000, $0000
DATA_0AA7AE:         dw $0036, $0000, $0000, $0000
DATA_0AA7B6:         dw $0000, $0000, $0000, $006A
DATA_0AA7BE:         dw $0029, $0000, $0000, $0000
DATA_0AA7C6:         dw $0000, $0000, $001B, $004E
DATA_0AA7CE:         dw $0000, $0000, $0000, $0000
DATA_0AA7D6:         dw $0000, $0000, $0026, $0000
DATA_0AA7DE:         dw $0000, $0000, $0029, $0000
DATA_0AA7E6:         dw $0000, $0000, $0000, $0000
DATA_0AA7EE:         dw $0000, $0000, $0000, $0000
DATA_0AA7F6:         dw $0035, $0061, $002E, $0000
DATA_0AA7FE:         dw $0026, $0000, $0045, $0045
DATA_0AA806:         dw $0031, $0031, $0031, $0000
DATA_0AA80E:         dw $0000, $0031, $0000, $0000
DATA_0AA816:         dw $0000, $0000, $0000, $0000
DATA_0AA81E:         dw $0000, $001E, $0000, $0000
DATA_0AA826:         dw $0000, $0000, $0000, $0000
DATA_0AA82E:         dw $0000, $0000, $0067, $0000
DATA_0AA836:         dw $0042, $0000, $001E, $0000
DATA_0AA83E:         dw $0000, $0000, $0000, $0000
DATA_0AA846:         dw $0000, $004F, $0000, $0059
DATA_0AA84E:         dw $0000, $0000, $0000, $0029
DATA_0AA856:         dw $0000, $0036, $004B, $004E
DATA_0AA85E:         dw $004E, $0053, $001B, $001B
DATA_0AA866:         dw $001B, $001B, $001B, $0000
DATA_0AA86E:         dw $0000, $0000, $0047, $0000
DATA_0AA876:         dw $0000, $0000, $0000, $0000
DATA_0AA87E:         dw $0000, $0000, $0000, $0000
DATA_0AA886:         dw $0000, $0000, $0000, $0000
DATA_0AA88E:         dw $0000, $0000, $0000, $0000
DATA_0AA896:         dw $0000, $0000, $0000, $0000
DATA_0AA89E:         dw $0000, $0000, $0000, $0000
DATA_0AA8A6:         dw $0000, $0000, $0000, $0000
DATA_0AA8AE:         dw $0000, $0000, $0000, $0000
DATA_0AA8B6:         dw $0000, $0000, $0029, $006F
DATA_0AA8BE:         dw $006D, $001A, $0000, $0055
DATA_0AA8C6:         dw $0000, $0049, $0044, $0000
DATA_0AA8CE:         dw $0000, $0000, $0020, $003E
DATA_0AA8D6:         dw $003E, $003E, $0022, $0022
DATA_0AA8DE:         dw $0024, $0000, $0025, $0000
DATA_0AA8E6:         dw $002A, $002A, $002C, $002D
DATA_0AA8EE:         dw $0000, $0000, $002F, $002F
DATA_0AA8F6:         dw $002F, $001F, $0037, $0000
DATA_0AA8FE:         dw $001F, $0000, $0000, $0000
DATA_0AA906:         dw $0036, $0000, $0000, $0035
DATA_0AA90E:         dw $0035, $0000, $0000, $003A
DATA_0AA916:         dw $0000, $0000, $0000, $003C
DATA_0AA91E:         dw $0000, $0000, $0000, $0000
DATA_0AA926:         dw $0029, $0000, $0000, $0000
DATA_0AA92E:         dw $003F, $003F, $0000, $0030
DATA_0AA936:         dw $0071, $0041, $0041, $0040
DATA_0AA93E:         dw $0040, $0000, $004C, $004C
DATA_0AA946:         dw $004C, $0046, $0000, $0049
DATA_0AA94E:         dw $0049, $0049, $0000, $0000
DATA_0AA956:         dw $0000, $0000, $0000, $0000
DATA_0AA95E:         dw $0027, $006A, $004E, $0000
DATA_0AA966:         dw $0000, $0052, $0000, $0050
DATA_0AA96E:         dw $0000, $00AB, $0000, $0051
DATA_0AA976:         dw $0051, $0000, $0045, $0000
DATA_0AA97E:         dw $00AD, $0000, $0000, $0020
DATA_0AA986:         dw $0020, $0020, $0020, $0070
DATA_0AA98E:         dw $0000, $0055, $0055, $0054
DATA_0AA996:         dw $0054, $0054, $0054, $0058
DATA_0AA99E:         dw $0000, $0055, $0055, $0000
DATA_0AA9A6:         dw $0000, $0057, $0057, $0057
DATA_0AA9AE:         dw $0057, $0057, $0057, $0057
DATA_0AA9B6:         dw $0057, $0057, $0056, $002A
DATA_0AA9BE:         dw $0053, $002B, $0000, $0049
DATA_0AA9C6:         dw $002B, $0000, $0000, $0039
DATA_0AA9CE:         dw $002A, $002A, $0000, $0000
DATA_0AA9D6:         dw $0000, $0000, $002A, $0000
DATA_0AA9DE:         dw $0025, $0025, $0049, $0047
DATA_0AA9E6:         dw $0047, $0047, $0047, $0047
DATA_0AA9EE:         dw $0047, $002B, $002B, $002B
DATA_0AA9F6:         dw $004F, $005A, $005A, $0000
DATA_0AA9FE:         dw $0000, $0000, $0000, $0000
DATA_0AAA06:         dw $0000, $0000, $0000, $0000
DATA_0AAA0E:         dw $0000, $0000, $0000, $0000
DATA_0AAA16:         dw $0000, $005D, $005D, $005D
DATA_0AAA1E:         dw $005E, $0000, $0000, $0000
DATA_0AAA26:         dw $0000, $0000, $0000, $0000
DATA_0AAA2E:         dw $0000, $0000, $0000, $0000
DATA_0AAA36:         dw $005F, $005E, $005D, $0042
DATA_0AAA3E:         dw $0062, $0000, $0000, $001C
DATA_0AAA46:         dw $001C, $0000, $0060, $005E
DATA_0AAA4E:         dw $005E, $0063, $0063, $0063
DATA_0AAA56:         dw $0065, $0065, $0000, $0060
DATA_0AAA5E:         dw $0048, $0064, $0064, $0064
DATA_0AAA66:         dw $0064, $0064, $0066, $0065
DATA_0AAA6E:         dw $0068, $0067, $0067, $0000
DATA_0AAA76:         dw $0065, $0000, $0000, $004E
DATA_0AAA7E:         dw $0000, $004E, $0000, $004E
DATA_0AAA86:         dw $0000, $004E, $FFFF, $FFFF
DATA_0AAA8E:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAA96:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAA9E:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAA6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAAE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAB6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAABE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAC6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAACE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAD6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAADE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAE6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAEE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAF6:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAAFE:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAB06:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAB0E:         dw $FFFF, $FFFF, $FFFF

; sprite table (which super FX sprite to use when yoshi spits out an enemy)
DATA_0AAB14:         dw $0000, $0000, $0000, $0000
DATA_0AAB1C:         dw $0000, $0000, $0000, $0000
DATA_0AAB24:         dw $0000, $0000, $0000, $014A
DATA_0AAB2C:         dw $0000, $0000, $0000, $0000
DATA_0AAB34:         dw $0000, $0000, $0000, $0000
DATA_0AAB3C:         dw $0000, $0000, $0000, $0000
DATA_0AAB44:         dw $0000, $0000, $0000, $0000
DATA_0AAB4C:         dw $0000, $0000, $0164, $0000
DATA_0AAB54:         dw $00C6, $0000, $0342, $0342
DATA_0AAB5C:         dw $0342, $0342, $0000, $0000
DATA_0AAB64:         dw $0000, $8388, $8388, $8388
DATA_0AAB6C:         dw $0000, $0000, $0000, $0000
DATA_0AAB74:         dw $0000, $0000, $0000, $0000
DATA_0AAB7C:         dw $0000, $0000, $0000, $0000
DATA_0AAB84:         dw $0000, $0000, $0000, $0000
DATA_0AAB8C:         dw $0000, $0000, $0000, $0000
DATA_0AAB94:         dw $0000, $0000, $0000, $800C
DATA_0AAB9C:         dw $800C, $0000, $0000, $0000
DATA_0AABA4:         dw $0000, $0000, $0000, $0000
DATA_0AABAC:         dw $0000, $0000, $0000, $0000
DATA_0AABB4:         dw $0000, $0000, $0000, $0000
DATA_0AABBC:         dw $0000, $0000, $0000, $0000
DATA_0AABC4:         dw $0000, $0000, $0000, $00C6
DATA_0AABCC:         dw $0000, $0000, $0000, $0000
DATA_0AABD4:         dw $0000, $0000, $0000, $0000
DATA_0AABDC:         dw $0000, $0000, $0000, $0000
DATA_0AABE4:         dw $0000, $0000, $0000, $0000
DATA_0AABEC:         dw $0000, $0000, $0000, $0000
DATA_0AABF4:         dw $0000, $0000, $0000, $0000
DATA_0AABFC:         dw $0000, $0000, $0000, $0000
DATA_0AAC04:         dw $0000, $0000, $0000, $0000
DATA_0AAC0C:         dw $0000, $0000, $0000, $0000
DATA_0AAC14:         dw $0000, $0000, $0000, $0000
DATA_0AAC1C:         dw $0000, $0000, $0000, $0000
DATA_0AAC24:         dw $0000, $0000, $0000, $0000
DATA_0AAC2C:         dw $0000, $0000, $0000, $0000
DATA_0AAC34:         dw $0000, $0000, $0000, $0000
DATA_0AAC3C:         dw $0000, $0000, $0000, $0000
DATA_0AAC44:         dw $0000, $0000, $0000, $0000
DATA_0AAC4C:         dw $0000, $0000, $0000, $0000
DATA_0AAC54:         dw $0000, $0000, $0000, $00C6
DATA_0AAC5C:         dw $00C6, $0000, $0000, $0000
DATA_0AAC64:         dw $0000, $0000, $0000, $0000
DATA_0AAC6C:         dw $0000, $0000, $0000, $0000
DATA_0AAC74:         dw $0000, $0000, $0000, $0000
DATA_0AAC7C:         dw $0000, $0000, $0000, $0000
DATA_0AAC84:         dw $0000, $0000, $0000, $0000
DATA_0AAC8C:         dw $0000, $0000, $0000, $0000
DATA_0AAC94:         dw $0000, $0000, $0000, $0000
DATA_0AAC9C:         dw $0000, $0000, $0000, $0000
DATA_0AACA4:         dw $0000, $0000, $0000, $0000
DATA_0AACAC:         dw $0000, $0000, $0000, $0000
DATA_0AACB4:         dw $0342, $0000, $0000, $0000
DATA_0AACBC:         dw $0000, $0000, $0000, $0000
DATA_0AACC4:         dw $0000, $0000, $0000, $0000
DATA_0AACCC:         dw $0000, $0000, $0000, $0000
DATA_0AACD4:         dw $0000, $0000, $0000, $0000
DATA_0AACDC:         dw $0000, $0000, $0000, $0000
DATA_0AACE4:         dw $0000, $0000, $0000, $0000
DATA_0AACEC:         dw $0000, $0000, $0000, $0000
DATA_0AACF4:         dw $0000, $0000, $0000, $0164
DATA_0AACFC:         dw $0000, $00C6, $0000, $0000
DATA_0AAD04:         dw $0000, $0000, $0000, $0000
DATA_0AAD0C:         dw $0000, $00C6, $0000, $0000
DATA_0AAD14:         dw $0000, $0000, $0000, $0000
DATA_0AAD1C:         dw $0000, $0000, $0000, $0000
DATA_0AAD24:         dw $0000, $0120, $0120, $0120
DATA_0AAD2C:         dw $0000, $0000, $0000, $0000
DATA_0AAD34:         dw $0000, $0000, $0000, $0000
DATA_0AAD3C:         dw $0000, $0000, $0000, $0000
DATA_0AAD44:         dw $0000, $0000, $00C6, $0000
DATA_0AAD4C:         dw $0000, $0000, $0000, $0000
DATA_0AAD54:         dw $0000, $0000, $0000, $0000
DATA_0AAD5C:         dw $0000, $0000, $0000, $0000
DATA_0AAD64:         dw $0000, $0000, $0164, $0000
DATA_0AAD6C:         dw $0000, $0000, $0000, $0000
DATA_0AAD74:         dw $0000, $0000, $0000, $0048
DATA_0AAD7C:         dw $0000, $0000, $0000, $0000
DATA_0AAD84:         dw $0000, $0000, $0000, $0000
DATA_0AAD8C:         dw $0000, $0000, $0000, $0000
DATA_0AAD94:         dw $0000, $0000, $0000, $0000
DATA_0AAD9C:         dw $0000, $0000, $0000, $0000
DATA_0AADA4:         dw $0000, $0000, $0000, $0000
DATA_0AADAC:         dw $0000, $0000, $0000, $0000
DATA_0AADB4:         dw $0000, $0000, $0000, $0000
DATA_0AADBC:         dw $0000, $0000, $0000, $0000
DATA_0AADC4:         dw $0000, $004A, $004A, $0000
DATA_0AADCC:         dw $0000, $0000, $0000, $0000
DATA_0AADD4:         dw $0000, $0000, $0000, $0000
DATA_0AADDC:         dw $0000, $0000, $0000, $0000
DATA_0AADE4:         dw $0000, $0000, $0000, $0000
DATA_0AADEC:         dw $0000, $0000, $0000, $0000
DATA_0AADF4:         dw $0000, $0000, $0000, $0000
DATA_0AADFC:         dw $0000, $0000, $0000, $0000
DATA_0AAE04:         dw $0000, $0000, $0000, $0000
DATA_0AAE0C:         dw $0000, $0000, $0000, $0000
DATA_0AAE14:         dw $0000, $0000, $0000, $0000
DATA_0AAE1C:         dw $0000, $0000, $0000, $0000
DATA_0AAE24:         dw $0000, $0000, $0000, $0000
DATA_0AAE2C:         dw $0000, $0000, $0000, $0000
DATA_0AAE34:         dw $0000, $0000, $0000, $0000
DATA_0AAE3C:         dw $0000, $0000, $0000, $0000
DATA_0AAE44:         dw $0000, $0000, $0122, $0000
DATA_0AAE4C:         dw $0000, $0000, $0000, $0000
DATA_0AAE54:         dw $0000, $0000, $0000, $0000
DATA_0AAE5C:         dw $0000, $0000, $0000, $0000
DATA_0AAE64:         dw $0000, $0000, $0000, $0000
DATA_0AAE6C:         dw $0000, $0000, $0000, $0000
DATA_0AAE74:         dw $0000, $0000, $0000, $0000
DATA_0AAE7C:         dw $0000, $0000, $0000, $0000
DATA_0AAE84:         dw $0000, $0000, $FFFF, $FFFF
DATA_0AAE8C:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAE94:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAE9C:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEA4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEAC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEB4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEBC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEC4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAECC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAED4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEDC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEE4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEEC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEF4:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAEFC:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAF04:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AAF0C:         dw $FFFF, $FFFF, $FFFF

; sprite table
DATA_0AAF12:         dw $0000, $0000, $001C, $0000
DATA_0AAF1A:         dw $0000, $0000, $0000, $0000
DATA_0AAF22:         dw $0000, $0000, $0000, $0000
DATA_0AAF2A:         dw $0000, $0000, $0000, $0000
DATA_0AAF32:         dw $0000, $0000, $0000, $0000
DATA_0AAF3A:         dw $0000, $0000, $8840, $0000
DATA_0AAF42:         dw $0000, $0000, $0000, $0000
DATA_0AAF4A:         dw $0000, $0000, $0000, $0000
DATA_0AAF52:         dw $0000, $0000, $0000, $0000
DATA_0AAF5A:         dw $0000, $0000, $0000, $0000
DATA_0AAF62:         dw $0000, $0000, $0000, $0000
DATA_0AAF6A:         dw $0000, $0000, $0000, $0000
DATA_0AAF72:         dw $0000, $0000, $0000, $0000
DATA_0AAF7A:         dw $0000, $0000, $0000, $0000
DATA_0AAF82:         dw $0000, $0000, $0000, $0000
DATA_0AAF8A:         dw $0000, $0000, $0000, $0000
DATA_0AAF92:         dw $0000, $0000, $0000, $0000
DATA_0AAF9A:         dw $0000, $0000, $0000, $0000
DATA_0AAFA2:         dw $0000, $0000, $0000, $0000
DATA_0AAFAA:         dw $0000, $0000, $0000, $0000
DATA_0AAFB2:         dw $0000, $0000, $0000, $0000
DATA_0AAFBA:         dw $0000, $0000, $0000, $0000
DATA_0AAFC2:         dw $0000, $0000, $0000, $0000
DATA_0AAFCA:         dw $0000, $0000, $0000, $0000
DATA_0AAFD2:         dw $0000, $0000, $0000, $0000
DATA_0AAFDA:         dw $0000, $0000, $0000, $0000
DATA_0AAFE2:         dw $0000, $0000, $0000, $0000
DATA_0AAFEA:         dw $0000, $0000, $0000, $0000
DATA_0AAFF2:         dw $0000, $0040, $0040, $0040
DATA_0AAFFA:         dw $0040, $FFFF, $FFFF, $FFFF
DATA_0AB002:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB00A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB012:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB01A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB022:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB02A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB032:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB03A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB042:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB04A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB052:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB05A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB062:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB06A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB072:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB07A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB082:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB08A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB092:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB09A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB0FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB102:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB10A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB112:         dw $0000, $0000, $001C, $0000
DATA_0AB11A:         dw $0000, $0000, $0000, $0000
DATA_0AB122:         dw $0000, $0000, $0000, $0000
DATA_0AB12A:         dw $0000, $0000, $0000, $0000
DATA_0AB132:         dw $0000, $0000, $0000, $0000
DATA_0AB13A:         dw $0000, $0000, $0000, $0000
DATA_0AB142:         dw $0000, $0000, $0000, $0000
DATA_0AB14A:         dw $0000, $0000, $0000, $0000
DATA_0AB152:         dw $0000, $0000, $0000, $0000
DATA_0AB15A:         dw $0000, $0000, $0000, $0000
DATA_0AB162:         dw $0000, $0000, $0000, $0000
DATA_0AB16A:         dw $0000, $0000, $0000, $0000
DATA_0AB172:         dw $0000, $0000, $0000, $0000
DATA_0AB17A:         dw $0000, $0000, $0000, $0000
DATA_0AB182:         dw $0000, $0000, $0000, $0000
DATA_0AB18A:         dw $0000, $0000, $0000, $0000
DATA_0AB192:         dw $0000, $0000, $0000, $0000
DATA_0AB19A:         dw $0000, $0000, $0000, $0000
DATA_0AB1A2:         dw $0000, $0000, $0000, $0000
DATA_0AB1AA:         dw $0000, $0000, $0000, $0000
DATA_0AB1B2:         dw $0000, $0000, $0000, $0000
DATA_0AB1BA:         dw $0000, $0000, $0000, $0000
DATA_0AB1C2:         dw $0000, $0000, $0000, $0000
DATA_0AB1CA:         dw $0000, $0001, $0000, $0000
DATA_0AB1D2:         dw $0000, $0000, $0000, $0000
DATA_0AB1DA:         dw $0000, $0000, $0000, $0000
DATA_0AB1E2:         dw $0000, $0000, $0000, $0000
DATA_0AB1EA:         dw $0000, $0000, $0000, $0000
DATA_0AB1F2:         dw $0000, $0000, $0000, $0000
DATA_0AB1FA:         dw $0000, $FFFF, $FFFF, $FFFF
DATA_0AB202:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB20A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB212:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB21A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB222:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB22A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB232:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB23A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB242:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB24A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB252:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB25A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB262:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB26A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB272:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB27A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB282:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB28A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB292:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB29A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB2FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB302:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB30A:         dw $FFFF, $FFFF, $FFFF, $FFFF

; sprite table
DATA_0AB312:         dw $1005, $0804, $0804, $0804
DATA_0AB31A:         dw $2005, $2005, $2005, $1005
DATA_0AB322:         dw $6005, $2805, $2005, $2005
DATA_0AB32A:         dw $0804, $0804, $0804, $0804
DATA_0AB332:         dw $0804, $4005, $2001, $4005
DATA_0AB33A:         dw $0804, $0804, $2005, $0002
DATA_0AB342:         dw $2005, $2005, $3805, $2805
DATA_0AB34A:         dw $0804, $0804, $0804, $0804
DATA_0AB352:         dw $0804, $3805, $2805, $0804
DATA_0AB35A:         dw $0804, $0804, $1805, $6005
DATA_0AB362:         dw $2005, $2005, $2005, $0804
DATA_0AB36A:         dw $4005, $4005, $2005, $2005
DATA_0AB372:         dw $1005, $1805, $0804, $4005
DATA_0AB37A:         dw $6005, $2005, $0804, $2005
DATA_0AB382:         dw $2006, $0804, $5005, $0805
DATA_0AB38A:         dw $3005, $3805, $0804, $3005
DATA_0AB392:         dw $0804, $0804, $0804, $1805
DATA_0AB39A:         dw $3005, $0804, $0804, $3005
DATA_0AB3A2:         dw $0804, $0804, $2005, $0804
DATA_0AB3AA:         dw $0804, $0804, $4005, $1805
DATA_0AB3B2:         dw $2005, $4806, $6006, $2005
DATA_0AB3BA:         dw $6005, $2005, $4006, $4006
DATA_0AB3C2:         dw $0804, $4805, $0806, $0804
DATA_0AB3CA:         dw $0804, $0804, $2002, $0804
DATA_0AB3D2:         dw $3005, $0804, $3005, $2005
DATA_0AB3DA:         dw $2005, $2005, $2005, $1805
DATA_0AB3E2:         dw $2005, $0804, $2005, $1005
DATA_0AB3EA:         dw $0804, $0804, $2005, $0804
DATA_0AB3F2:         dw $5005, $2981, $4181, $6181
DATA_0AB3FA:         dw $6181, $FFFF, $FFFF, $FFFF
DATA_0AB402:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB40A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB412:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB41A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB422:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB42A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB432:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB43A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB442:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB44A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB452:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB45A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB462:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB46A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB472:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB47A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB482:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB48A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB492:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB49A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB4FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB502:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB50A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB512:         dw $1602, $1602, $16FF, $0005
DATA_0AB51A:         dw $0602, $0002, $0606, $0602
DATA_0AB522:         dw $0605, $0002, $0602, $0602
DATA_0AB52A:         dw $0602, $1202, $0602, $0602
DATA_0AB532:         dw $0602, $0602, $0602, $0602
DATA_0AB53A:         dw $1602, $0604, $0602, $0602
DATA_0AB542:         dw $0001, $0000, $0602, $0602
DATA_0AB54A:         dw $0204, $0601, $0601, $0601
DATA_0AB552:         dw $0601, $0601, $0601, $0601
DATA_0AB55A:         dw $0601, $0601, $0601, $0601
DATA_0AB562:         dw $0000, $0401, $0601, $0601
DATA_0AB56A:         dw $0601, $0601, $0601, $0201
DATA_0AB572:         dw $0001, $0001, $0601, $0001
DATA_0AB57A:         dw $0001, $0601, $0601, $0001
DATA_0AB582:         dw $0001, $0001, $0001, $0601
DATA_0AB58A:         dw $0601, $0001, $0406, $0601
DATA_0AB592:         dw $0205, $0205, $0606, $1001
DATA_0AB59A:         dw $1001, $0401, $0001, $0001
DATA_0AB5A2:         dw $0001, $0601, $0001, $0601
DATA_0AB5AA:         dw $0601, $0201, $0001, $0001
DATA_0AB5B2:         dw $0001, $0001, $0001, $0401
DATA_0AB5BA:         dw $0606, $0401, $0401, $0401
DATA_0AB5C2:         dw $0001, $0001, $0000, $0401
DATA_0AB5CA:         dw $0401, $0201, $0001, $0401
DATA_0AB5D2:         dw $1601, $0201, $0001, $0001
DATA_0AB5DA:         dw $0401, $0001, $16FF, $0001
DATA_0AB5E2:         dw $0001, $0C01, $1000, $0602
DATA_0AB5EA:         dw $0002, $0007, $0201, $0003
DATA_0AB5F2:         dw $0401, $0806, $0606, $0406
DATA_0AB5FA:         dw $0006, $FFFF, $FFFF, $FFFF
DATA_0AB602:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB60A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB612:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB61A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB622:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB62A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB632:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB63A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB642:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB64A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB652:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB65A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB662:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB66A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB672:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB67A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB682:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB68A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB692:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB69A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB6FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB702:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB70A:         dw $FFFF, $FFFF, $FFFF, $FFFF

; sprite table
DATA_0AB712:         dw $0000, $0000, $0000, $4040
DATA_0AB71A:         dw $0000, $0006, $0000, $0000
DATA_0AB722:         dw $0000, $0000, $F8F8, $0000
DATA_0AB72A:         dw $0000, $2008, $0000, $F802
DATA_0AB732:         dw $4020, $4020, $1008, $0000
DATA_0AB73A:         dw $2020, $0000, $0000, $0402
DATA_0AB742:         dw $0000, $0000, $0000, $0000
DATA_0AB74A:         dw $0000, $1008, $0000, $F008
DATA_0AB752:         dw $0000, $0000, $0000, $0000
DATA_0AB75A:         dw $0000, $0000, $0000, $0000
DATA_0AB762:         dw $0000, $0000, $0000, $0000
DATA_0AB76A:         dw $0000, $0000, $0000, $0000
DATA_0AB772:         dw $4040, $4040, $0000, $0000
DATA_0AB77A:         dw $0000, $0000, $0408, $0000
DATA_0AB782:         dw $0000, $4040, $0000, $0000
DATA_0AB78A:         dw $0000, $4040, $0000, $0000
DATA_0AB792:         dw $0000, $0000, $0000, $0000
DATA_0AB79A:         dw $0000, $0404, $0000, $0000
DATA_0AB7A2:         dw $0000, $0000, $0000, $4040
DATA_0AB7AA:         dw $4040, $4040, $0000, $0000
DATA_0AB7B2:         dw $0000, $0000, $0000, $0000
DATA_0AB7BA:         dw $0000, $0000, $0000, $0000
DATA_0AB7C2:         dw $0000, $0000, $0000, $0404
DATA_0AB7CA:         dw $0000, $2020, $0000, $0000
DATA_0AB7D2:         dw $0000, $4040, $0000, $0000
DATA_0AB7DA:         dw $0000, $0000, $0000, $0000
DATA_0AB7E2:         dw $0000, $4040, $0000, $0000
DATA_0AB7EA:         dw $0006, $0010, $0000, $4040
DATA_0AB7F2:         dw $0000, $4040, $4040, $4040
DATA_0AB7FA:         dw $4040, $FFFF, $FFFF, $FFFF
DATA_0AB802:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB80A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB812:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB81A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB822:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB82A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB832:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB83A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB842:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB84A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB852:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB85A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB862:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB86A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB872:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB87A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB882:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB88A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB892:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB89A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8A2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8AA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8B2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8BA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8C2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8CA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8D2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8DA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8E2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8EA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8F2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB8FA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB902:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB90A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0AB912:         dw $0000, $0000, $0000, $0000
DATA_0AB91A:         dw $0000, $0000, $0000, $0000
DATA_0AB922:         dw $0000, $0000, $0000, $0000
DATA_0AB92A:         dw $0000, $0048, $0000, $0000
DATA_0AB932:         dw $0000, $0000, $0000, $0000
DATA_0AB93A:         dw $0032, $0032, $0000, $0000
DATA_0AB942:         dw $0045, $0000, $0000, $0000
DATA_0AB94A:         dw $0000, $0000, $0000, $0000
DATA_0AB952:         dw $0000, $0000, $0000, $0000
DATA_0AB95A:         dw $0000, $0000, $0000, $0000
DATA_0AB962:         dw $0000, $0000, $0000, $001C
DATA_0AB96A:         dw $0000, $0000, $0000, $0000
DATA_0AB972:         dw $0035, $0035, $0000, $0000
DATA_0AB97A:         dw $0000, $0000, $0000, $0000
DATA_0AB982:         dw $0000, $0000, $0041, $0000
DATA_0AB98A:         dw $0000, $0037, $0049, $0000
DATA_0AB992:         dw $0051, $0051, $0000, $0000
DATA_0AB99A:         dw $0054, $002B, $0057, $0000
DATA_0AB9A2:         dw $0056, $0000, $0058, $0058
DATA_0AB9AA:         dw $0058, $0000, $0000, $0000
DATA_0AB9B2:         dw $0000, $0000, $0000, $004B
DATA_0AB9BA:         dw $0000, $004B, $005D, $002B
DATA_0AB9C2:         dw $005D, $0000, $0000, $0063
DATA_0AB9CA:         dw $0063, $0045, $0000, $0060
DATA_0AB9D2:         dw $0000, $0066, $0041, $0041
DATA_0AB9DA:         dw $0066, $0000, $0000, $0000
DATA_0AB9E2:         dw $0000, $0000, $0000, $0000
DATA_0AB9EA:         dw $0000, $0000, $0000, $0000
DATA_0AB9F2:         dw $0000, $0000, $0000, $0000
DATA_0AB9FA:         dw $0000, $FFFF, $FFFF, $FFFF
DATA_0ABA02:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA0A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA12:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA1A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA22:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA2A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA32:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA3A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA42:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA4A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA52:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA5A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA62:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA6A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA72:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA7A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA82:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA8A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA92:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABA9A:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAA2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAAA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAB2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABABA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAC2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABACA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAD2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABADA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAE2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAEA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAF2:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABAFA:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABB02:         dw $FFFF, $FFFF, $FFFF, $FFFF
DATA_0ABB0A:         dw $FFFF, $FFFF, $FFFF, $FFFF

DATA_0ABB12:         dw $0000, $0200, $0000, $0804
DATA_0ABB1A:         dw $0400, $0108, $0000, $0400
DATA_0ABB22:         dw $0208, $0804, $0003, $0000
DATA_0ABB2A:         dw $0804, $0004, $0000, $0804
DATA_0ABB32:         dw $0005, $0000, $0804, $0406
DATA_0ABB3A:         dw $0708, $0000, $0400, $0808
DATA_0ABB42:         dw $0804, $0009, $0000, $0000
DATA_0ABB4A:         dw $0000, $0000, $0009, $0100
DATA_0ABB52:         dw $0000, $0008, $0000, $0000
DATA_0ABB5A:         dw $0100, $2000, $0000, $4002
DATA_0ABB62:         dw $0200, $0040, $4002, $2000
DATA_0ABB6A:         dw $0000, $4801, $0000, $0048
DATA_0ABB72:         dw $4800, $0000, $0048, $4800
DATA_0ABB7A:         dw $0000, $0048, $4800, $0000
DATA_0ABB82:         dw $0048, $4800, $0000, $0048
DATA_0ABB8A:         dw $4800, $0200, $00D8, $0000
DATA_0ABB92:         dw $0400, $0A00, $0004, $040B
DATA_0ABB9A:         dw $0C00, $0000, $0400, $0D00
DATA_0ABBA2:         dw $0004, $040E, $0F00, $0000
DATA_0ABBAA:         dw $0400, $1000, $0000, $0400
DATA_0ABBB2:         dw $1100, $0000, $0100, $0010
DATA_0ABBBA:         dw $0001, $0200, $0000, $0802
DATA_0ABBC2:         dw $0000, $0000, $0000, $0000
DATA_0ABBCA:         dw $0000, $0002, $2100, $0000
DATA_0ABBD2:         dw $0024, $2406, $0700, $0000
DATA_0ABBDA:         dw $0000, $0000, $0024, $2408
DATA_0ABBE2:         dw $0900, $0000, $0000, $0000
DATA_0ABBEA:         dw $0024, $2400, $0100, $0002
DATA_0ABBF2:         dw $2400, $0200, $0024, $0203
DATA_0ABBFA:         dw $0000, $0024, $0004, $0000
DATA_0ABC02:         dw $0024, $0005, $0000, $0002
DATA_0ABC0A:         dw $2500, $1200, $0002, $2500
DATA_0ABC12:         dw $1300, $0002, $2500, $1400
DATA_0ABC1A:         dw $0002, $2500, $1500, $0002
DATA_0ABC22:         dw $2500, $1600, $0002, $2500
DATA_0ABC2A:         dw $1700, $4800, $0200, $0038
DATA_0ABC32:         dw $3000, $0200, $0018, $0000
DATA_0ABC3A:         dw $0000, $0000, $0002, $0000
DATA_0ABC42:         dw $0000, $6004, $0418, $1968
DATA_0ABC4A:         dw $0020, $2000, $0000, $0000
DATA_0ABC52:         dw $0200, $0058, $C804, $001A
DATA_0ABC5A:         dw $0000, $0002, $0200, $0000
DATA_0ABC62:         dw $0020, $2000, $0000, $7002
DATA_0ABC6A:         dw $0000, $0078, $B000, $0100
DATA_0ABC72:         dw $0088, $9001, $0000, $0000
DATA_0ABC7A:         dw $9802, $0200, $0000, $0002
DATA_0ABC82:         dw $0200, $0000, $D802, $0200
DATA_0ABC8A:         dw $00A0, $2818, $0400, $0498
DATA_0ABC92:         dw $9804, $0005, $0098, $9802
DATA_0ABC9A:         dw $0200, $0098, $0000, $0000
DATA_0ABCA2:         dw $0000, $0004, $001B, $0000
DATA_0ABCAA:         dw $0002, $0200, $00B8, $8000
DATA_0ABCB2:         dw $0000, $00A8, $B802, $0000
DATA_0ABCBA:         dw $0000, $D002, $0100, $00C0
DATA_0ABCC2:         dw $0002, $1800, $0000, $0000
DATA_0ABCCA:         dw $0200, $0020, $2004, $0404
DATA_0ABCD2:         dw $0520, $0000, $0C00, $0400
DATA_0ABCDA:         dw $000C, $0005, $0000, $0001
DATA_0ABCE2:         dw $0000, $0000, $0002, $0200
DATA_0ABCEA:         dw $0000, $0000, $2500, $1C00
DATA_0ABCF2:         dw $0025, $251D, $1E00, $0025
DATA_0ABCFA:         dw $021F, $0058, $3000, $0000
DATA_0ABD02:         dw $0000, $2802, $0000, $0000
DATA_0ABD0A:         dw $80C0, $0F2D

DATA_0ABD0E:         dw $1F00, $1E2D, $80C0, $0F2D
DATA_0ABD16:         dw $1F00, $1C2D, $80C0, $0E2D
DATA_0ABD1E:         dw $1F00, $1A2D, $80C0, $0E2D
DATA_0ABD26:         dw $1F00, $182D, $80C0, $0D2D
DATA_0ABD2E:         dw $1F00, $162D, $80C0, $0D2D
DATA_0ABD36:         dw $1F00, $142D, $80C0, $0C2D
DATA_0ABD3E:         dw $1F00, $122D, $80C0, $0C2D
DATA_0ABD46:         dw $1F00, $102D, $80C0, $0B2D
DATA_0ABD4E:         dw $0F00, $0E2D, $80C0, $0B2D
DATA_0ABD56:         dw $0F00, $0C2D, $80C0, $0A2D
DATA_0ABD5E:         dw $0F00, $0A2D, $80C0, $0A2D
DATA_0ABD66:         dw $0F00, $082D, $80C0, $092D
DATA_0ABD6E:         dw $0F00, $062D, $80C0, $092D
DATA_0ABD76:         dw $0F00, $042D, $80C0, $082D
DATA_0ABD7E:         dw $0F00, $022D, $80C0, $082D
DATA_0ABD86:         dw $0F00, $002D, $80C0, $072D
DATA_0ABD8E:         dw $0F00, $0E2D, $80C0, $072D
DATA_0ABD96:         dw $0F00, $0C2D, $80C0, $062D
DATA_0ABD9E:         dw $0F00, $0A2D, $80C0, $062D
DATA_0ABDA6:         dw $0F00, $082D, $80C0, $052D
DATA_0ABDAE:         dw $0F00, $062D, $80C0, $052D
DATA_0ABDB6:         dw $0F00, $042D, $80C0, $042D
DATA_0ABDBE:         dw $0F00, $022D, $80C0, $042D
DATA_0ABDC6:         dw $0F00, $002D, $80C0, $032D
DATA_0ABDCE:         dw $0F00, $FE2D, $80C0, $032D
DATA_0ABDD6:         dw $0F00, $FC2D, $80C0, $022D
DATA_0ABDDE:         dw $0F00, $FA2D, $80C0, $022D
DATA_0ABDE6:         dw $0F00, $F82D, $80C0, $012D
DATA_0ABDEE:         dw $0F00, $F62D, $80C0, $012D
DATA_0ABDF6:         dw $0F00, $F42D, $80C0, $002D
DATA_0ABDFE:         dw $0F00, $F22D, $80C0, $002D
DATA_0ABE06:         dw $0F00, $F02D, $00D3, $7F40
DATA_0ABE0E:         dw $0F00, $00D3, $00D3, $7F40
DATA_0ABE16:         dw $0F00, $02D3, $01D3, $7F40
DATA_0ABE1E:         dw $0F00, $04D3, $01D3, $7F40
DATA_0ABE26:         dw $0F00, $06D3, $02D3, $7F40
DATA_0ABE2E:         dw $0F00, $08D3, $02D3, $7F40
DATA_0ABE36:         dw $0F00, $0AD3, $03D3, $7F40
DATA_0ABE3E:         dw $0F00, $0CD3, $03D3, $7F40
DATA_0ABE46:         dw $0F00, $0ED3, $04D3, $7F40
DATA_0ABE4E:         dw $1F00, $10D3, $04D3, $7F40
DATA_0ABE56:         dw $1F00, $12D3, $05D3, $7F40
DATA_0ABE5E:         dw $1F00, $14D3, $05D3, $7F40
DATA_0ABE66:         dw $1F00, $16D3, $06D3, $7F40
DATA_0ABE6E:         dw $1F00, $18D3, $06D3, $7F40
DATA_0ABE76:         dw $1F00, $1AD3, $07D3, $7F40
DATA_0ABE7E:         dw $1F00, $1CD3, $07D3, $7F40
DATA_0ABE86:         dw $1F00, $1ED3, $08D3, $7F40
DATA_0ABE8E:         dw $0F00, $F0D3, $08D3, $7F40
DATA_0ABE96:         dw $0F00, $F2D3, $09D3, $7F40
DATA_0ABE9E:         dw $0F00, $F4D3, $09D3, $7F40
DATA_0ABEA6:         dw $0F00, $F6D3, $0AD3, $7F40
DATA_0ABEAE:         dw $0F00, $F8D3, $0AD3, $7F40
DATA_0ABEB6:         dw $0F00, $FAD3, $0BD3, $7F40
DATA_0ABEBE:         dw $0F00, $FCD3, $0BD3, $7F40
DATA_0ABEC6:         dw $0F00, $FED3, $0CD3, $7F40
DATA_0ABECE:         dw $0F00, $00D3, $0CD3, $7F40
DATA_0ABED6:         dw $0F00, $02D3, $0DD3, $7F40
DATA_0ABEDE:         dw $0F00, $04D3, $0DD3, $7F40
DATA_0ABEE6:         dw $0F00, $06D3, $0ED3, $7F40
DATA_0ABEEE:         dw $0F00, $08D3, $0ED3, $7F40
DATA_0ABEF6:         dw $0F00, $0AD3, $0FD3, $7F40
DATA_0ABEFE:         dw $0F00, $0CD3, $0FD3, $7F40
DATA_0ABF06:         dw $0F00, $0ED3, $80C0, $0F20
DATA_0ABF0E:         dw $0F00, $0F20, $80C0, $0E20
DATA_0ABF16:         dw $0F00, $0E20, $80C0, $0D20
DATA_0ABF1E:         dw $0F00, $0D20, $80C0, $0C20
DATA_0ABF26:         dw $0F00, $0C20, $80C0, $0B20
DATA_0ABF2E:         dw $0F00, $0B20, $80C0, $0A20
DATA_0ABF36:         dw $0F00, $0A20, $80C0, $0920
DATA_0ABF3E:         dw $0F00, $0920, $80C0, $0820
DATA_0ABF46:         dw $0F00, $0820, $80C0, $0720
DATA_0ABF4E:         dw $0F00, $0720, $80C0, $0620
DATA_0ABF56:         dw $0F00, $0620, $80C0, $0520
DATA_0ABF5E:         dw $0F00, $0520, $80C0, $0420
DATA_0ABF66:         dw $0F00, $0420, $80C0, $0320
DATA_0ABF6E:         dw $0F00, $0320, $80C0, $0220
DATA_0ABF76:         dw $0F00, $0220, $80C0, $0120
DATA_0ABF7E:         dw $0F00, $0120, $80C0, $0020
DATA_0ABF86:         dw $0F00, $0020, $00E0, $7F40
DATA_0ABF8E:         dw $0F00, $00E0, $01E0, $7F40
DATA_0ABF96:         dw $0F00, $01E0, $02E0, $7F40
DATA_0ABF9E:         dw $0F00, $02E0, $03E0, $7F40
DATA_0ABFA6:         dw $0F00, $03E0, $04E0, $7F40
DATA_0ABFAE:         dw $0F00, $04E0, $05E0, $7F40
DATA_0ABFB6:         dw $0F00, $05E0, $06E0, $7F40
DATA_0ABFBE:         dw $0F00, $06E0, $07E0, $7F40
DATA_0ABFC6:         dw $0F00, $07E0, $08E0, $7F40
DATA_0ABFCE:         dw $0F00, $08E0, $09E0, $7F40
DATA_0ABFD6:         dw $0F00, $09E0, $0AE0, $7F40
DATA_0ABFDE:         dw $0F00, $0AE0, $0BE0, $7F40
DATA_0ABFE6:         dw $0F00, $0BE0, $0CE0, $7F40
DATA_0ABFEE:         dw $0F00, $0CE0, $0DE0, $7F40
DATA_0ABFF6:         dw $0F00, $0DE0, $0EE0, $7F40
DATA_0ABFFE:         dw $0F00, $0EE0, $0FE0, $7F40
DATA_0AC006:         dw $0F00, $0FE0, $8000, $7F00
DATA_0AC00E:         dw $0F00, $0F12, $8000, $7F00
DATA_0AC016:         dw $0F00, $0F12, $8000, $7F00
DATA_0AC01E:         dw $0F00, $0E12, $8000, $7F00
DATA_0AC026:         dw $0F00, $0E12, $8000, $7F00
DATA_0AC02E:         dw $0F00, $0D12, $8000, $7F00
DATA_0AC036:         dw $0F00, $0D12, $8000, $7F00
DATA_0AC03E:         dw $0F00, $0C12, $8000, $7F00
DATA_0AC046:         dw $0F00, $0C12, $80C0, $0E12
DATA_0AC04E:         dw $0F00, $0B12, $80C0, $0C12
DATA_0AC056:         dw $0F00, $0B12, $80C0, $0A12
DATA_0AC05E:         dw $0F00, $0A12, $80C0, $0812
DATA_0AC066:         dw $0F00, $0A12, $80C0, $0612
DATA_0AC06E:         dw $0F00, $0912, $80C0, $0412
DATA_0AC076:         dw $0F00, $0912, $80C0, $0212
DATA_0AC07E:         dw $0F00, $0812, $80C0, $0012
DATA_0AC086:         dw $0F00, $0812, $80C0, $0E12
DATA_0AC08E:         dw $0F00, $0712, $80C0, $0C12
DATA_0AC096:         dw $0F00, $0712, $80C0, $0A12
DATA_0AC09E:         dw $0F00, $0612, $80C0, $0812
DATA_0AC0A6:         dw $0F00, $0612, $80C0, $0612
DATA_0AC0AE:         dw $0F00, $0512, $80C0, $0412
DATA_0AC0B6:         dw $0F00, $0512, $80C0, $0212
DATA_0AC0BE:         dw $0F00, $0412, $80C0, $0012
DATA_0AC0C6:         dw $0F00, $0412, $80C0, $FE12
DATA_0AC0CE:         dw $0F00, $0312, $80C0, $FC12
DATA_0AC0D6:         dw $0F00, $0312, $80C0, $FA12
DATA_0AC0DE:         dw $0F00, $0212, $80C0, $F812
DATA_0AC0E6:         dw $0F00, $0212, $80C0, $F612
DATA_0AC0EE:         dw $0F00, $0112, $80C0, $F412
DATA_0AC0F6:         dw $0F00, $0112, $80C0, $F212
DATA_0AC0FE:         dw $0F00, $0012, $80C0, $F012
DATA_0AC106:         dw $0F00, $0012, $00EE, $7F40
DATA_0AC10E:         dw $0F00, $00EE, $02EE, $7F40
DATA_0AC116:         dw $0F00, $00EE, $04EE, $7F40
DATA_0AC11E:         dw $0F00, $01EE, $06EE, $7F40
DATA_0AC126:         dw $0F00, $01EE, $08EE, $7F40
DATA_0AC12E:         dw $0F00, $02EE, $0AEE, $7F40
DATA_0AC136:         dw $0F00, $02EE, $0CEE, $7F40
DATA_0AC13E:         dw $0F00, $03EE, $0EEE, $7F40
DATA_0AC146:         dw $0F00, $03EE, $10EE, $7F40
DATA_0AC14E:         dw $0F00, $04EE, $12EE, $7F40
DATA_0AC156:         dw $0F00, $04EE, $14EE, $7F40
DATA_0AC15E:         dw $0F00, $05EE, $16EE, $7F40
DATA_0AC166:         dw $0F00, $05EE, $18EE, $7F40
DATA_0AC16E:         dw $0F00, $06EE, $1AEE, $7F40
DATA_0AC176:         dw $0F00, $06EE, $1CEE, $7F40
DATA_0AC17E:         dw $0F00, $07EE, $1EEE, $7F40
DATA_0AC186:         dw $0F00, $07EE, $8000, $7F00
DATA_0AC18E:         dw $2000, $08EE, $8000, $7F00
DATA_0AC196:         dw $2000, $08EE, $8000, $7F00
DATA_0AC19E:         dw $2000, $09EE, $8000, $7F00
DATA_0AC1A6:         dw $2000, $09EE, $8000, $7F00
DATA_0AC1AE:         dw $2000, $0AEE, $8000, $7F00
DATA_0AC1B6:         dw $2000, $0AEE, $8000, $7F00
DATA_0AC1BE:         dw $2000, $0BEE, $8000, $7F00
DATA_0AC1C6:         dw $2000, $0BEE, $00EE, $7F40
DATA_0AC1CE:         dw $1000, $0CEE, $02EE, $7F40
DATA_0AC1D6:         dw $1000, $0CEE, $04EE, $7F40
DATA_0AC1DE:         dw $1000, $0DEE, $06EE, $7F40
DATA_0AC1E6:         dw $1000, $0DEE, $08EE, $7F40
DATA_0AC1EE:         dw $1000, $0EEE, $0AEE, $7F40
DATA_0AC1F6:         dw $1000, $0EEE, $0CEE, $7F40
DATA_0AC1FE:         dw $1000, $0FEE, $0EEE, $7F40
DATA_0AC206:         dw $1000, $0FEE, $8000, $7F00
DATA_0AC20E:         dw $FF00, $4020, $8000, $7F00
DATA_0AC216:         dw $FF00, $4020, $8000, $7F00
DATA_0AC21E:         dw $FF00, $4020, $8000, $7F00
DATA_0AC226:         dw $FF00, $4020, $8000, $7F00
DATA_0AC22E:         dw $FF00, $4020, $0F00, $7F00
DATA_0AC236:         dw $0F00, $0F20, $0F00, $0D00
DATA_0AC23E:         dw $0F00, $0D20, $0F00, $0C00
DATA_0AC246:         dw $0F00, $0C20, $0F00, $0B00
DATA_0AC24E:         dw $0F00, $0B20, $0F00, $0A00
DATA_0AC256:         dw $0F00, $0A20, $0F00, $0900
DATA_0AC25E:         dw $0F00, $0920, $0F00, $0800
DATA_0AC266:         dw $0F00, $0820, $0F00, $0700
DATA_0AC26E:         dw $0F00, $0720, $0F00, $0600
DATA_0AC276:         dw $0F00, $0620, $0F00, $0600
DATA_0AC27E:         dw $0F00, $0620, $0F00, $0500
DATA_0AC286:         dw $0F00, $0520, $0F00, $0B00
DATA_0AC28E:         dw $0F00, $0412, $0F00, $0700
DATA_0AC296:         dw $0F00, $0412, $0F00, $0400
DATA_0AC29E:         dw $0F00, $0312, $0F00, $0200
DATA_0AC2A6:         dw $0F00, $0312, $0F00, $0000
DATA_0AC2AE:         dw $0F00, $0212, $0F00, $0000
DATA_0AC2B6:         dw $0F00, $0212, $0F00, $0000
DATA_0AC2BE:         dw $0F00, $0212, $0F00, $0000
DATA_0AC2C6:         dw $0F00, $0112, $0F00, $0000
DATA_0AC2CE:         dw $0F00, $0112, $0F00, $0000
DATA_0AC2D6:         dw $0F00, $0112, $0F00, $0000
DATA_0AC2DE:         dw $0F00, $0112, $0F00, $0000
DATA_0AC2E6:         dw $0F00, $0012, $0F00, $0000
DATA_0AC2EE:         dw $0F00, $0012, $0F00, $0000
DATA_0AC2F6:         dw $0F00, $0012, $0F00, $0000
DATA_0AC2FE:         dw $0F00, $0012, $0F00, $0000
DATA_0AC306:         dw $0F00, $0012, $0F00, $0400
DATA_0AC30E:         dw $0F00, $0B20, $0F00, $0400
DATA_0AC316:         dw $0F00, $0720, $0F00, $0300
DATA_0AC31E:         dw $0F00, $0420, $0F00, $0300
DATA_0AC326:         dw $0F00, $0220, $0F00, $0200
DATA_0AC32E:         dw $0F00, $0020, $0F00, $0200
DATA_0AC336:         dw $0F00, $FF20, $0F00, $0200
DATA_0AC33E:         dw $0F00, $FD20, $0F00, $0100
DATA_0AC346:         dw $0F00, $FC20, $0F00, $0100
DATA_0AC34E:         dw $0F00, $FB20, $0F00, $0100
DATA_0AC356:         dw $0F00, $FA20, $0F00, $0100
DATA_0AC35E:         dw $0F00, $F920, $0F00, $0000
DATA_0AC366:         dw $0F00, $F820, $0F00, $0000
DATA_0AC36E:         dw $0F00, $F720, $0F00, $0000
DATA_0AC376:         dw $0F00, $F620, $0F00, $0000
DATA_0AC37E:         dw $0F00, $F620, $0F00, $0000
DATA_0AC386:         dw $0F00, $F520, $0400, $0000
DATA_0AC38E:         dw $0F00, $00EE, $0800, $0000
DATA_0AC396:         dw $0F00, $00EE, $0B00, $0000
DATA_0AC39E:         dw $0F00, $00EE, $0D00, $0000
DATA_0AC3A6:         dw $0F00, $00EE, $0F00, $0000
DATA_0AC3AE:         dw $0F00, $00EE, $0F00, $0000
DATA_0AC3B6:         dw $0F00, $01EE, $0F00, $0000
DATA_0AC3BE:         dw $0F00, $01EE, $0F00, $0000
DATA_0AC3C6:         dw $0F00, $01EE, $0F00, $0000
DATA_0AC3CE:         dw $0F00, $01EE, $0F00, $0000
DATA_0AC3D6:         dw $0F00, $02EE, $0F00, $0000
DATA_0AC3DE:         dw $0F00, $02EE, $0F00, $0000
DATA_0AC3E6:         dw $0F00, $02EE, $0F00, $0000
DATA_0AC3EE:         dw $0F00, $03EE, $0F00, $0000
DATA_0AC3F6:         dw $0F00, $03EE, $0F00, $0000
DATA_0AC3FE:         dw $0F00, $04EE, $0F00, $0000
DATA_0AC406:         dw $0F00, $04EE, $8000, $7F00
DATA_0AC40E:         dw $0F00, $05E0, $8000, $7F00
DATA_0AC416:         dw $0F00, $06E0, $8000, $7F00
DATA_0AC41E:         dw $0F00, $06E0, $8000, $7F00
DATA_0AC426:         dw $0F00, $07E0, $8000, $7F00
DATA_0AC42E:         dw $0F00, $08E0, $0000, $0000
DATA_0AC436:         dw $0F00, $09E0, $0200, $0000
DATA_0AC43E:         dw $0F00, $0AE0, $0300, $0000
DATA_0AC446:         dw $0F00, $0BE0, $0400, $0000
DATA_0AC44E:         dw $0F00, $0CE0, $0500, $0000
DATA_0AC456:         dw $0F00, $0DE0, $0600, $0000
DATA_0AC45E:         dw $FF00, $0FE0, $0700, $0000
DATA_0AC466:         dw $FF00, $40E0, $0800, $0000
DATA_0AC46E:         dw $FF00, $40E0, $0900, $0000
DATA_0AC476:         dw $FF00, $40E0, $0900, $0000
DATA_0AC47E:         dw $FF00, $40E0, $0A00, $0000
DATA_0AC486:         dw $FF00, $40E0, $0B00, $0000
DATA_0AC48E:         dw $0F00, $F5E0, $0B00, $0000
DATA_0AC496:         dw $0F00, $F6E0, $0C00, $0000
DATA_0AC49E:         dw $0F00, $F6E0, $0C00, $0000
DATA_0AC4A6:         dw $0F00, $F7E0, $0D00, $0000
DATA_0AC4AE:         dw $0F00, $F8E0, $0D00, $0000
DATA_0AC4B6:         dw $0F00, $F9E0, $0D00, $0000
DATA_0AC4BE:         dw $0F00, $FAE0, $0E00, $0000
DATA_0AC4C6:         dw $0F00, $FBE0, $0E00, $0000
DATA_0AC4CE:         dw $0F00, $FCE0, $0E00, $0000
DATA_0AC4D6:         dw $0F00, $FDE0, $0E00, $0000
DATA_0AC4DE:         dw $0F00, $FFE0, $0F00, $0000
DATA_0AC4E6:         dw $0F00, $00E0, $0F00, $0000
DATA_0AC4EE:         dw $0F00, $02E0, $0F00, $0000
DATA_0AC4F6:         dw $0F00, $04E0, $0F00, $0000
DATA_0AC4FE:         dw $0F00, $07E0, $0F00, $0000
DATA_0AC506:         dw $0F00, $0BE0, $0F00, $0D00
DATA_0AC50E:         dw $0F00, $0D20, $0F00, $0A00
DATA_0AC516:         dw $0F00, $0A20, $0F00, $0800
DATA_0AC51E:         dw $0F00, $0820, $0F00, $0700
DATA_0AC526:         dw $0F00, $0720, $0F00, $0600
DATA_0AC52E:         dw $0F00, $0620, $0F00, $0500
DATA_0AC536:         dw $0F00, $0520, $0F00, $0400
DATA_0AC53E:         dw $0F00, $0420, $0F00, $0300
DATA_0AC546:         dw $0F00, $0320, $0F00, $0200
DATA_0AC54E:         dw $0F00, $0212, $0F00, $0200
DATA_0AC556:         dw $0F00, $0212, $0F00, $0100
DATA_0AC55E:         dw $0F00, $0112, $0F00, $0100
DATA_0AC566:         dw $0F00, $0112, $0F00, $0100
DATA_0AC56E:         dw $0F00, $0100, $0F00, $0000
DATA_0AC576:         dw $0F00, $0000, $0F00, $0000
DATA_0AC57E:         dw $0F00, $0000, $0F00, $0000
DATA_0AC586:         dw $0F00, $0000, $0F00, $0000
DATA_0AC58E:         dw $0F00, $0000, $0F00, $0000
DATA_0AC596:         dw $0F00, $0000, $0F00, $0000
DATA_0AC59E:         dw $0F00, $0000, $0F00, $0100
DATA_0AC5A6:         dw $0F00, $0100, $0F00, $0100
DATA_0AC5AE:         dw $0F00, $01EE, $0F00, $0100
DATA_0AC5B6:         dw $0F00, $01EE, $0F00, $0200
DATA_0AC5BE:         dw $0F00, $02EE, $0F00, $0200
DATA_0AC5C6:         dw $0F00, $02EE, $0F00, $0300
DATA_0AC5CE:         dw $0F00, $03E0, $0F00, $0400
DATA_0AC5D6:         dw $0F00, $04E0, $0F00, $0500
DATA_0AC5DE:         dw $0F00, $05E0, $0F00, $0600
DATA_0AC5E6:         dw $0F00, $06E0, $0F00, $0700
DATA_0AC5EE:         dw $0F00, $07E0, $0F00, $0800
DATA_0AC5F6:         dw $0F00, $08E0, $0F00, $0A00
DATA_0AC5FE:         dw $0F00, $0AE0, $0F00, $0D00
DATA_0AC606:         dw $0F00, $0DE0, $80C0, $006E
DATA_0AC60E:         dw $006E, $0000, $80C0, $026E
DATA_0AC616:         dw $006E, $0000, $80C0, $046E
DATA_0AC61E:         dw $016E, $0000, $80C0, $066E
DATA_0AC626:         dw $016E, $0000, $80C0, $086E
DATA_0AC62E:         dw $026E, $0000, $80C0, $0A6E
DATA_0AC636:         dw $026E, $0000, $80C0, $0C6E
DATA_0AC63E:         dw $036E, $0000, $80C0, $0E6E
DATA_0AC646:         dw $036E, $0000, $8000, $7F00
DATA_0AC64E:         dw $046E, $0000, $8000, $7F00
DATA_0AC656:         dw $046E, $0000, $8000, $7F00
DATA_0AC65E:         dw $056E, $0000, $8000, $7F00
DATA_0AC666:         dw $056E, $0000, $8000, $7F00
DATA_0AC66E:         dw $066E, $0000, $8000, $7F00
DATA_0AC676:         dw $066E, $0000, $8000, $7F00
DATA_0AC67E:         dw $076E, $0000, $8000, $7F00
DATA_0AC686:         dw $076E, $0000, $80C0, $F06E
DATA_0AC68E:         dw $086E, $0000, $80C0, $F26E
DATA_0AC696:         dw $086E, $0000, $80C0, $F46E
DATA_0AC69E:         dw $096E, $0000, $80C0, $F66E
DATA_0AC6A6:         dw $096E, $0000, $80C0, $F86E
DATA_0AC6AE:         dw $0A6E, $0000, $80C0, $FA6E
DATA_0AC6B6:         dw $0A6E, $0000, $80C0, $FC6E
DATA_0AC6BE:         dw $0B6E, $0000, $80C0, $FE6E
DATA_0AC6C6:         dw $0B6E, $0000, $80C0, $006E
DATA_0AC6CE:         dw $0C6E, $0000, $80C0, $026E
DATA_0AC6D6:         dw $0C6E, $0000, $80C0, $046E
DATA_0AC6DE:         dw $0D6E, $0000, $80C0, $066E
DATA_0AC6E6:         dw $0D6E, $0000, $80C0, $086E
DATA_0AC6EE:         dw $0E6E, $0000, $80C0, $0A6E
DATA_0AC6F6:         dw $0E6E, $0000, $80C0, $0C6E
DATA_0AC6FE:         dw $0F6E, $0000, $80C0, $0E6E
DATA_0AC706:         dw $0F6E, $0000, $1E92, $7F40
DATA_0AC70E:         dw $0F92, $0000, $1C92, $7F40
DATA_0AC716:         dw $0F92, $0000, $1A92, $7F40
DATA_0AC71E:         dw $0E92, $0000, $1892, $7F40
DATA_0AC726:         dw $0E92, $0000, $1692, $7F40
DATA_0AC72E:         dw $0D92, $0000, $1492, $7F40
DATA_0AC736:         dw $0D92, $0000, $1292, $7F40
DATA_0AC73E:         dw $0C92, $0000, $1092, $7F40
DATA_0AC746:         dw $0C92, $0000, $0E92, $7F40
DATA_0AC74E:         dw $0B92, $0000, $0C92, $7F40
DATA_0AC756:         dw $0B92, $0000, $0A92, $7F40
DATA_0AC75E:         dw $0A92, $0000, $0892, $7F40
DATA_0AC766:         dw $0A92, $0000, $0692, $7F40
DATA_0AC76E:         dw $0992, $0000, $0492, $7F40
DATA_0AC776:         dw $0992, $0000, $0292, $7F40
DATA_0AC77E:         dw $0892, $0000, $0092, $7F40
DATA_0AC786:         dw $0892, $0000, $0E92, $7F40
DATA_0AC78E:         dw $0792, $0000, $0C92, $7F40
DATA_0AC796:         dw $0792, $0000, $0A92, $7F40
DATA_0AC79E:         dw $0692, $0000, $0892, $7F40
DATA_0AC7A6:         dw $0692, $0000, $0692, $7F40
DATA_0AC7AE:         dw $0592, $0000, $0492, $7F40
DATA_0AC7B6:         dw $0592, $0000, $0292, $7F40
DATA_0AC7BE:         dw $0492, $0000, $0092, $7F40
DATA_0AC7C6:         dw $0492, $0000, $FE00, $7F00
DATA_0AC7CE:         dw $0392, $0000, $FC00, $7F00
DATA_0AC7D6:         dw $0392, $0000, $FA00, $7F00
DATA_0AC7DE:         dw $0292, $0000, $F800, $7F00
DATA_0AC7E6:         dw $0292, $0000, $F600, $7F00
DATA_0AC7EE:         dw $0192, $0000, $F400, $7F00
DATA_0AC7F6:         dw $0192, $0000, $F200, $7F00
DATA_0AC7FE:         dw $0092, $0000, $F000, $7F00
DATA_0AC806:         dw $0092, $0000, $80C0, $0060
DATA_0AC80E:         dw $0060, $0000, $80C0, $0160
DATA_0AC816:         dw $0160, $0000, $80C0, $0260
DATA_0AC81E:         dw $0260, $0000, $80C0, $0360
DATA_0AC826:         dw $0360, $0000, $80C0, $0460
DATA_0AC82E:         dw $0460, $0000, $80C0, $0560
DATA_0AC836:         dw $0560, $0000, $80C0, $0660
DATA_0AC83E:         dw $0660, $0000, $80C0, $0760
DATA_0AC846:         dw $0760, $0000, $80C0, $0860
DATA_0AC84E:         dw $0860, $0000, $80C0, $0960
DATA_0AC856:         dw $0960, $0000, $80C0, $0A60
DATA_0AC85E:         dw $0A60, $0000, $80C0, $0B60
DATA_0AC866:         dw $0B60, $0000, $80C0, $0C60
DATA_0AC86E:         dw $0C60, $0000, $80C0, $0D60
DATA_0AC876:         dw $0D60, $0000, $80C0, $0E60
DATA_0AC87E:         dw $0E60, $0000, $80C0, $0F60
DATA_0AC886:         dw $0F60, $0000, $0FA0, $7F40
DATA_0AC88E:         dw $0FA0, $0000, $0EA0, $7F40
DATA_0AC896:         dw $0EA0, $0000, $0DA0, $7F40
DATA_0AC89E:         dw $0DA0, $0000, $0CA0, $7F40
DATA_0AC8A6:         dw $0CA0, $0000, $0BA0, $7F40
DATA_0AC8AE:         dw $0BA0, $0000, $0AA0, $7F40
DATA_0AC8B6:         dw $0AA0, $0000, $09A0, $7F40
DATA_0AC8BE:         dw $09A0, $0000, $08A0, $7F40
DATA_0AC8C6:         dw $08A0, $0000, $07A0, $7F40
DATA_0AC8CE:         dw $07A0, $0000, $06A0, $7F40
DATA_0AC8D6:         dw $06A0, $0000, $05A0, $7F40
DATA_0AC8DE:         dw $05A0, $0000, $04A0, $7F40
DATA_0AC8E6:         dw $04A0, $0000, $03A0, $7F40
DATA_0AC8EE:         dw $03A0, $0000, $02A0, $7F40
DATA_0AC8F6:         dw $02A0, $0000, $01A0, $7F40
DATA_0AC8FE:         dw $01A0, $0000, $00A0, $7F40
DATA_0AC906:         dw $00A0, $0000, $8000, $0F00
DATA_0AC90E:         dw $0000, $0801, $8000, $0E00
DATA_0AC916:         dw $0000, $0801, $8000, $0D00
DATA_0AC91E:         dw $0000, $0801, $8000, $0C00
DATA_0AC926:         dw $0000, $0801, $8000, $0B00
DATA_0AC92E:         dw $0000, $0801, $8000, $0A00
DATA_0AC936:         dw $0000, $0801, $8000, $0900
DATA_0AC93E:         dw $0000, $0801, $8000, $0800
DATA_0AC946:         dw $0000, $0801, $8000, $0700
DATA_0AC94E:         dw $0000, $0001, $8000, $0600
DATA_0AC956:         dw $0000, $0001, $8000, $0500
DATA_0AC95E:         dw $0000, $0001, $8000, $0400
DATA_0AC966:         dw $0000, $0001, $8000, $0300
DATA_0AC96E:         dw $0000, $0001, $8000, $0200
DATA_0AC976:         dw $0000, $0001, $8000, $0100
DATA_0AC97E:         dw $0000, $0001, $8000, $0000
DATA_0AC986:         dw $0000, $0001, $0F00, $7F00
DATA_0AC98E:         dw $0000, $0001, $0E00, $7F00
DATA_0AC996:         dw $0000, $0001, $0D00, $7F00
DATA_0AC99E:         dw $0000, $0001, $0C00, $7F00
DATA_0AC9A6:         dw $0000, $0001, $0B00, $7F00
DATA_0AC9AE:         dw $0000, $0001, $0A00, $7F00
DATA_0AC9B6:         dw $0000, $0001, $0900, $7F00
DATA_0AC9BE:         dw $0000, $0001, $0800, $7F00
DATA_0AC9C6:         dw $0000, $0001, $0700, $7F00
DATA_0AC9CE:         dw $0000, $0801, $0600, $7F00
DATA_0AC9D6:         dw $0000, $0801, $0500, $7F00
DATA_0AC9DE:         dw $0000, $0801, $0400, $7F00
DATA_0AC9E6:         dw $0000, $0801, $0300, $7F00
DATA_0AC9EE:         dw $0000, $0801, $0200, $7F00
DATA_0AC9F6:         dw $0000, $0801, $0100, $7F00
DATA_0AC9FE:         dw $0000, $0801, $0000, $7F00
DATA_0ACA06:         dw $0000, $0801, $0F20, $00E0
DATA_0ACA0E:         dw $0000, $0E2D, $0E20, $01E0
DATA_0ACA16:         dw $0000, $0C2D, $0D20, $02E0
DATA_0ACA1E:         dw $0000, $0A2D, $0C20, $03E0
DATA_0ACA26:         dw $0000, $082D, $0B20, $04E0
DATA_0ACA2E:         dw $0000, $062D, $0A20, $05E0
DATA_0ACA36:         dw $0000, $042D, $0920, $06E0
DATA_0ACA3E:         dw $0000, $022D, $0820, $07E0
DATA_0ACA46:         dw $0000, $002D, $0720, $08E0
DATA_0ACA4E:         dw $0000, $00D3, $0620, $09E0
DATA_0ACA56:         dw $0000, $02D3, $0520, $0AE0
DATA_0ACA5E:         dw $0000, $04D3, $0420, $0BE0
DATA_0ACA66:         dw $0000, $06D3, $0320, $0CE0
DATA_0ACA6E:         dw $0000, $08D3, $0220, $0DE0
DATA_0ACA76:         dw $0000, $0AD3, $0120, $0EE0
DATA_0ACA7E:         dw $0000, $0CD3, $0020, $0FE0
DATA_0ACA86:         dw $0000, $0ED3, $0500, $0A00
DATA_0ACA8E:         dw $0000, $052D, $0312, $0CEE
DATA_0ACA96:         dw $0000, $0320, $0220, $0DE0
DATA_0ACA9E:         dw $0000, $0220, $0120, $0EE0
DATA_0ACAA6:         dw $0000, $0112, $002D, $0FD3
DATA_0ACAAE:         dw $0000, $0112, $0040, $0FC0
DATA_0ACAB6:         dw $0000, $0000, $0040, $0FC0
DATA_0ACABE:         dw $0000, $0000, $0040, $0FC0
DATA_0ACAC6:         dw $0000, $0000, $0040, $0FC0
DATA_0ACACE:         dw $0000, $0000, $0040, $0FC0
DATA_0ACAD6:         dw $0000, $0000, $0040, $0FC0
DATA_0ACADE:         dw $0000, $0000, $0040, $0FC0
DATA_0ACAE6:         dw $0000, $01EE, $0040, $0FC0
DATA_0ACAEE:         dw $0000, $01EE, $0040, $0FC0
DATA_0ACAF6:         dw $0000, $02E0, $0040, $0FC0
DATA_0ACAFE:         dw $0000, $03E0, $0040, $0FC0
DATA_0ACB06:         dw $0000, $05D3, $80C0, $0053
DATA_0ACB0E:         dw $0053, $0000, $80C0, $0053
DATA_0ACB16:         dw $0253, $0000, $80C0, $0153
DATA_0ACB1E:         dw $0453, $0000, $80C0, $0153
DATA_0ACB26:         dw $0653, $0000, $80C0, $0253
DATA_0ACB2E:         dw $0853, $0000, $80C0, $0253
DATA_0ACB36:         dw $0A53, $0000, $80C0, $0353
DATA_0ACB3E:         dw $0C53, $0000, $80C0, $0353
DATA_0ACB46:         dw $0E53, $0000, $80C0, $0453
DATA_0ACB4E:         dw $1053, $0000, $80C0, $0453
DATA_0ACB56:         dw $1253, $0000, $80C0, $0553
DATA_0ACB5E:         dw $1453, $0000, $80C0, $0553
DATA_0ACB66:         dw $1653, $0000, $80C0, $0653
DATA_0ACB6E:         dw $1853, $0000, $80C0, $0653
DATA_0ACB76:         dw $1A53, $0000, $80C0, $0753
DATA_0ACB7E:         dw $1C53, $0000, $80C0, $0753
DATA_0ACB86:         dw $1E53, $0000, $80C0, $0853
DATA_0ACB8E:         dw $F053, $F000, $80C0, $0853
DATA_0ACB96:         dw $F253, $F000, $80C0, $0953
DATA_0ACB9E:         dw $F453, $F000, $80C0, $0953
DATA_0ACBA6:         dw $F653, $F000, $80C0, $0A53
DATA_0ACBAE:         dw $F853, $F000, $80C0, $0A53
DATA_0ACBB6:         dw $FA53, $F000, $80C0, $0B53
DATA_0ACBBE:         dw $FC53, $F000, $80C0, $0B53
DATA_0ACBC6:         dw $FE53, $F000, $80C0, $0C53
DATA_0ACBCE:         dw $0053, $0000, $80C0, $0C53
DATA_0ACBD6:         dw $0253, $0000, $80C0, $0D53
DATA_0ACBDE:         dw $0453, $0000, $80C0, $0D53
DATA_0ACBE6:         dw $0653, $0000, $80C0, $0E53
DATA_0ACBEE:         dw $0853, $0000, $80C0, $0E53
DATA_0ACBF6:         dw $0A53, $0000, $80C0, $0F53
DATA_0ACBFE:         dw $0C53, $0000, $80C0, $0F53
DATA_0ACC06:         dw $0E53, $0000, $0FAD, $7F40
DATA_0ACC0E:         dw $1EAD, $0000, $0FAD, $7F40
DATA_0ACC16:         dw $1CAD, $0000, $0EAD, $7F40
DATA_0ACC1E:         dw $1AAD, $0000, $0EAD, $7F40
DATA_0ACC26:         dw $18AD, $0000, $0DAD, $7F40
DATA_0ACC2E:         dw $16AD, $0000, $0DAD, $7F40
DATA_0ACC36:         dw $14AD, $0000, $0CAD, $7F40
DATA_0ACC3E:         dw $12AD, $0000, $0CAD, $7F40
DATA_0ACC46:         dw $10AD, $0000, $0BAD, $7F40
DATA_0ACC4E:         dw $0EAD, $0000, $0BAD, $7F40
DATA_0ACC56:         dw $0CAD, $0000, $0AAD, $7F40
DATA_0ACC5E:         dw $0AAD, $0000, $0AAD, $7F40
DATA_0ACC66:         dw $08AD, $0000, $09AD, $7F40
DATA_0ACC6E:         dw $06AD, $0000, $09AD, $7F40
DATA_0ACC76:         dw $04AD, $0000, $08AD, $7F40
DATA_0ACC7E:         dw $02AD, $0000, $08AD, $7F40
DATA_0ACC86:         dw $00AD, $0000, $07AD, $7F40
DATA_0ACC8E:         dw $0EAD, $0000, $07AD, $7F40
DATA_0ACC96:         dw $0CAD, $0000, $06AD, $7F40
DATA_0ACC9E:         dw $0AAD, $0000, $06AD, $7F40
DATA_0ACCA6:         dw $08AD, $0000, $05AD, $7F40
DATA_0ACCAE:         dw $06AD, $0000, $05AD, $7F40
DATA_0ACCB6:         dw $04AD, $0000, $04AD, $7F40
DATA_0ACCBE:         dw $02AD, $0000, $04AD, $7F40
DATA_0ACCC6:         dw $00AD, $0000, $03AD, $7F40
DATA_0ACCCE:         dw $FEAD, $F000, $03AD, $7F40
DATA_0ACCD6:         dw $FCAD, $F000, $02AD, $7F40
DATA_0ACCDE:         dw $FAAD, $F000, $02AD, $7F40
DATA_0ACCE6:         dw $F8AD, $F000, $01AD, $7F40
DATA_0ACCEE:         dw $F6AD, $F000, $01AD, $7F40
DATA_0ACCF6:         dw $F4AD, $F000, $00AD, $7F40
DATA_0ACCFE:         dw $F2AD, $F000, $00AD, $7F40
DATA_0ACD06:         dw $F0AD, $F000


DATA_0ACD0A:         db $05, $04, $06, $01, $00, $02, $09, $08
DATA_0ACD12:         db $0A, $0D, $0C, $0E, $07, $0F, $03, $0B
DATA_0ACD1A:         db $01, $00, $02, $03

000A:CD1E A0 0A        ibt   r0,#000A
000A:CD20 3F DF        romb
000A:CD22 21 18        move  r8,r1
000A:CD24 22 10        move  r0,r2
000A:CD26 94           link  #04
000A:CD27 FF 95 D0     iwt   r15,#D095
000A:CD2A 02           cache
000A:CD2B B6 9E        lob
000A:CD2D F3 0A CD     iwt   r3,#CD0A
000A:CD30 1E 53        add   r3
000A:CD32 EF           getb
000A:CD33 1E 3E 74     and   #04
000A:CD36 09 51        beq   CD89
000A:CD38 01           nop
000A:CD39 A9 00        ibt   r9,#0000
000A:CD3B AA 00        ibt   r10,#0000
000A:CD3D A4 10        ibt   r4,#0010
000A:CD3F 1E 3E 78     and   #08
000A:CD42 09 02        beq   CD46
000A:CD44 01           nop
000A:CD45 EA           dec   r10
000A:CD46 3E 73        and   #03
000A:CD48 08 25        bne   CD6F
000A:CD4A E0           dec   r0
000A:CD4B 29 54        add   r4
000A:CD4D B1 18 59     add   r9
000A:CD50 22 10        move  r0,r2
000A:CD52 94           link  #04
000A:CD53 FF 96 D0     iwt   r15,#D096
000A:CD56 3D F0 00 F8  lm    r0,(F800)
000A:CD5A 77           and   r7
000A:CD5B F7 00 70     iwt   r7,#7000
000A:CD5E 67           sub   r7
000A:CD5F 08 28        bne   CD89
000A:CD61 B6 9E        lob
000A:CD63 1E 53        add   r3
000A:CD65 EF           getb
000A:CD66 3E 72        and   #02
000A:CD68 09 E2        beq   CD4C
000A:CD6A 29           with  r9
000A:CD6B 21           with  r1
000A:CD6C 05 2F        bra   CD9D

000A:CD6E 59           add   r9

000A:CD6F 08 29        bne   CD9A
000A:CD71 E0           dec   r0
000A:CD72 29 54        add   r4
000A:CD74 B1 18 59     add   r9
000A:CD77 22 10        move  r0,r2
000A:CD79 94           link  #04
000A:CD7A FF 96 D0     iwt   r15,#D096
000A:CD7D 3D F0 00 F8  lm    r0,(F800)
000A:CD81 77           and   r7
000A:CD82 F7 00 70     iwt   r7,#7000
000A:CD85 67           sub   r7
000A:CD86 09 06        beq   CD8E
000A:CD88 B6 A9 00     ibt   r9,#0000
000A:CD8B 60           sub   r0
000A:CD8C 00           stop
000A:CD8D 01           nop
000A:CD8E 9E           lob
000A:CD8F 1E 53        add   r3
000A:CD91 EF           getb
000A:CD92 3E 72        and   #02
000A:CD94 09 DD        beq   CD73
000A:CD96 29           with  r9
000A:CD97 05 26        bra   CDBF

000A:CD99 01           nop
000A:CD9A 08 23        bne   CDBF
000A:CD9C 01           nop
000A:CD9D 29 54        add   r4
000A:CD9F B1 18 69     sub   r9
000A:CDA2 22 10        move  r0,r2
000A:CDA4 94           link  #04
000A:CDA5 FF 96 D0     iwt   r15,#D096
000A:CDA8 3D F0 00 F8  lm    r0,(F800)
000A:CDAC 77           and   r7
000A:CDAD F7 00 70     iwt   r7,#7000
000A:CDB0 67           sub   r7
000A:CDB1 08 D6        bne   CD89
000A:CDB3 B6 9E        lob
000A:CDB5 1E 53        add   r3
000A:CDB7 EF           getb
000A:CDB8 3E 71        and   #01
000A:CDBA 09 E2        beq   CD9E
000A:CDBC 29 21 69     sub   r9
000A:CDBF DA           inc   r10
000A:CDC0 09 21        beq   CDE3
000A:CDC2 01           nop
000A:CDC3 EA           dec   r10
000A:CDC4 2A 54        add   r4
000A:CDC6 21 18        move  r8,r1
000A:CDC8 B2 5A        add   r10
000A:CDCA 94           link  #04
000A:CDCB FF 96 D0     iwt   r15,#D096
000A:CDCE 3D F0 00 F8  lm    r0,(F800)
000A:CDD2 77           and   r7
000A:CDD3 F7 00 70     iwt   r7,#7000
000A:CDD6 67           sub   r7
000A:CDD7 08 B0        bne   CD89
000A:CDD9 B6 9E        lob
000A:CDDB 1E 53        add   r3
000A:CDDD EF           getb
000A:CDDE 3E 78        and   #08
000A:CDE0 09 E2        beq   CDC4
000A:CDE2 01           nop
000A:CDE3 B9 03        lsr
000A:CDE5 11 51        add   r1
000A:CDE7 BA 03        lsr
000A:CDE9 12 52        add   r2
000A:CDEB 29 54        add   r4
000A:CDED 2A 54        add   r4
000A:CDEF 2A 16        move  r6,r10
000A:CDF1 B9 3D 9F     lmult
000A:CDF4 B4 13 C0     hib
000A:CDF7 60           sub   r0
000A:CDF8 00           stop
000A:CDF9 01           nop

000A:CDFA A0 0A        ibt   r0,#000A
000A:CDFC 3F DF        romb
000A:CDFE B1 18 53     add   r3
000A:CE01 B2 54        add   r4
000A:CE03 94           link  #04
000A:CE04 FF 95 D0     iwt   r15,#D095
000A:CE07 02           cache
000A:CE08 3E 72        and   #02
000A:CE0A 08 1C        bne   CE28
000A:CE0C 01           nop
000A:CE0D AC 0F        ibt   r12,#000F
000A:CE0F 2F 1D        move  r13,r15
000A:CE11 3D A1 00     lms   r1,(0000)
000A:CE14 B1 18 53     add   r3
000A:CE17 3D A2 01     lms   r2,(0002)
000A:CE1A B2 54        add   r4
000A:CE1C 94           link  #04
000A:CE1D FF 96 D0     iwt   r15,#D096
000A:CE20 3D 3E 72     and   #02
000A:CE23 08 07        bne   CE2C
000A:CE25 01           nop
000A:CE26 3C           loop
000A:CE27 01           nop
000A:CE28 A1 FF        ibt   r1,#FFFF
000A:CE2A A2 FF        ibt   r2,#FFFF
000A:CE2C 60           sub   r0
000A:CE2D 00           stop
000A:CE2E 01           nop

000A:CE2F A7 0A        ibt   r7,#000A
000A:CE31 B7 3F DF     romb
000A:CE34 94           link  #04
000A:CE35 FF 96 D0     iwt   r15,#D096
000A:CE38 3D 15 3E 72  and   #02
000A:CE3C 60           sub   r0
000A:CE3D 00           stop
000A:CE3E 01           nop

000A:CE3F A0 0A        ibt   r0,#000A
000A:CE41 3F DF        romb
000A:CE43 02           cache
000A:CE44 AC 07        ibt   r12,#0007
000A:CE46 2F 1D        move  r13,r15
000A:CE48 22 18        move  r8,r2
000A:CE4A 23 10        move  r0,r3
000A:CE4C 94           link  #04
000A:CE4D FF 96 D0     iwt   r15,#D096
000A:CE50 3D 3E 73     and   #03
000A:CE53 08 21        bne   CE76
000A:CE55 01           nop
000A:CE56 23 3E 6F     sub   #0F
000A:CE59 E3           dec   r3
000A:CE5A 2E 3E 5F     add   #0F
000A:CE5D 3C           loop
000A:CE5E DE           inc   r14
000A:CE5F 3D A0 10     lms   r0,(0020)
000A:CE62 E0           dec   r0
000A:CE63 09 0C        beq   CE71
000A:CE65 90           sbk
000A:CE66 A3 04        ibt   r3,#0004
000A:CE68 B3 1E 60     sub   r0
000A:CE6B 22 54        add   r4
000A:CE6D 2A           with  r10
000A:CE6E 05 D4        bra   CE44

000A:CE70 13 AE F0     ibt   r14,#FFF0
000A:CE73 60           sub   r0
000A:CE74 00           stop
000A:CE75 01           nop

000A:CE76 2F 1D        move  r13,r15
000A:CE78 23 3E 6F     sub   #0F
000A:CE7B E3           dec   r3
000A:CE7C 22 18        move  r8,r2
000A:CE7E 23 10        move  r0,r3
000A:CE80 94           link  #04
000A:CE81 FF 96 D0     iwt   r15,#D096
000A:CE84 3D 3E 72     and   #02
000A:CE87 09 EB        beq   CE74
000A:CE89 60           sub   r0
000A:CE8A 2E 3E 5F     add   #0F
000A:CE8D 3C           loop
000A:CE8E DE           inc   r14
000A:CE8F 05 CE        bra   CE5F

000A:CE91 01           nop

000A:CE92 A0 0A        ibt   r0,#000A
000A:CE94 3F DF        romb
000A:CE96 02           cache
000A:CE97 2F 1D        move  r13,r15
000A:CE99 22 18        move  r8,r2
000A:CE9B 23 10        move  r0,r3
000A:CE9D 94           link  #04
000A:CE9E FF 96 D0     iwt   r15,#D096
000A:CEA1 3D 3E 72     and   #02
000A:CEA4 09 23        beq   CEC9
000A:CEA6 23 54        add   r4
000A:CEA8 3C           loop
000A:CEA9 DE           inc   r14
000A:CEAA AE 10        ibt   r14,#0010
000A:CEAC 3D AC 2C     lms   r12,(0058)
000A:CEAF EC           dec   r12
000A:CEB0 29 12        move  r2,r9
000A:CEB2 2A 13        move  r3,r10
000A:CEB4 2F 1D        move  r13,r15
000A:CEB6 22 18        move  r8,r2
000A:CEB8 23 10        move  r0,r3
000A:CEBA 94           link  #04
000A:CEBB FF 96 D0     iwt   r15,#D096
000A:CEBE 3D 3E 71     and   #01
000A:CEC1 08 06        bne   CEC9
000A:CEC3 23 54        add   r4
000A:CEC5 3C           loop
000A:CEC6 DE           inc   r14
000A:CEC7 AE F0        ibt   r14,#FFF0
000A:CEC9 00           stop
000A:CECA 01           nop

DATA_0ACECB:         db $01, $00, $01, $05, $01, $0A, $05, $0F
DATA_0ACED3:         db $01, $14, $0C, $00, $09, $19, $01, $20
DATA_0ACEDB:         db $09, $25, $03, $2C, $03, $30, $04, $34
DATA_0ACEE3:         db $02, $00, $0D, $36, $08, $00, $0D, $3B
DATA_0ACEEB:         db $0E, $3B, $02, $0A, $09, $40, $0A, $47
DATA_0ACEF3:         db $09, $4C, $01, $53, $01, $58, $05, $00
DATA_0ACEFB:         db $01, $5D, $01, $62, $0C, $67, $00, $6C
DATA_0ACF03:         db $0B, $6C, $06, $6C, $01, $6D, $08, $05
DATA_0ACF0B:         db $02, $05, $0D, $05, $08, $01, $08, $10
DATA_0ACF13:         db $08, $08, $05, $08, $0A, $08, $08, $05
DATA_0ACF1B:         db $08, $0B, $08, $08, $FC, $08, $14, $08
DATA_0ACF23:         db $08, $FC, $08, $14, $08, $0A, $F8, $0A
DATA_0ACF2B:         db $18, $0A, $08, $00, $08, $10, $08, $08
DATA_0ACF33:         db $00, $08, $0F, $08, $08, $FC, $08, $15
DATA_0ACF3B:         db $08, $05, $FA, $05, $15, $05, $FB, $00
DATA_0ACF43:         db $14, $00, $FB, $10, $14, $10, $10, $10
DATA_0ACF4B:         db $02, $10, $1E, $10, $08, $02, $08, $20
DATA_0ACF53:         db $08, $08, $F8, $00, $18, $00, $F9, $00
DATA_0ACF5B:         db $17, $00, $F9, $10, $17, $10, $FE, $FE
DATA_0ACF63:         db $11, $11, $FE, $11, $11, $FE, $00, $00
DATA_0ACF6B:         db $0F, $0F, $00, $0F, $0F, $00, $FE, $10
DATA_0ACF73:         db $12, $10, $08, $08, $FA, $08, $16, $08
DATA_0ACF7B:         db $08, $FA, $08, $16, $08, $08, $FC, $FC
DATA_0ACF83:         db $14, $FC, $08, $FA, $08, $16, $08, $08
DATA_0ACF8B:         db $02, $08, $0E, $08, $04, $00, $0C, $00
DATA_0ACF93:         db $04, $10, $0C, $10, $08, $08, $00, $08
DATA_0ACF9B:         db $10, $08, $08, $00, $08, $10, $08, $04
DATA_0ACFA3:         db $00, $04, $10, $04, $00, $FA, $10, $FA
DATA_0ACFAB:         db $01, $10, $0F, $10, $08, $08, $02, $08
DATA_0ACFB3:         db $0D, $08, $08, $FA, $08, $18, $08, $08
DATA_0ACFBB:         db $FD, $06, $13, $06, $08, $F9, $08, $16
DATA_0ACFC3:         db $08, $08, $00, $08, $10, $08, $08, $FD
DATA_0ACFCB:         db $08, $13, $08, $04, $FC, $04, $14, $04
DATA_0ACFD3:         db $08, $F8, $08, $10, $08, $08, $00, $08
DATA_0ACFDB:         db $0F, $08, $08, $00, $08, $0F, $08, $08
DATA_0ACFE3:         db $08, $08, $EC, $04, $24, $04, $08, $E8
DATA_0ACFEB:         db $08, $20

000A:CFED A0 0A        ibt   r0,#000A
000A:CFEF 3F DF        romb
000A:CFF1 A1 00        ibt   r1,#0000
000A:CFF3 AC 28        ibt   r12,#0028
000A:CFF5 02           cache
000A:CFF6 2F 1D        move  r13,r15
000A:CFF8 F0 C3 0E     iwt   r0,#0EC3
000A:CFFB 51           add   r1
000A:CFFC 3D 40        ldb   (r0)
000A:CFFE 22 B0        moves r2,r0
000A:D000 09 0B        beq   D00D
000A:D002 01           nop
000A:D003 F0 20 18     iwt   r0,#1820
000A:D006 51           add   r1
000A:D007 40           ldw   (r0)
000A:D008 3F 71        bic   #01
000A:D00A 90           sbk
000A:D00B A2 00        ibt   r2,#0000
000A:D00D F0 C2 0E     iwt   r0,#0EC2
000A:D010 51           add   r1
000A:D011 B2 30        stw   (r0)
000A:D013 F0 C0 0E     iwt   r0,#0EC0
000A:D016 51           add   r1
000A:D017 40           ldw   (r0)
000A:D018 3E 6E        sub   #0E
000A:D01A 0C 62        bcc   D07E
000A:D01C 01           nop
000A:D01D F0 62 0F     iwt   r0,#0F62
000A:D020 51           add   r1
000A:D021 40           ldw   (r0)
000A:D022 A7 1F        ibt   r7,#001F
000A:D024 77           and   r7
000A:D025 09 57        beq   D07E
000A:D027 50           add   r0
000A:D028 FE C9 CE     iwt   r14,#CEC9
000A:D02B 1E 5E        add   r14
000A:D02D F0 A2 10     iwt   r0,#10A2
000A:D030 51           add   r1
000A:D031 19 40        ldw   (r0)
000A:D033 17 EF        getb
000A:D035 DE           inc   r14
000A:D036 F0 42 11     iwt   r0,#1142
000A:D039 51           add   r1
000A:D03A 1A 40        ldw   (r0)
000A:D03C F0 E0 16     iwt   r0,#16E0
000A:D03F 51           add   r1
000A:D040 40           ldw   (r0)
000A:D041 1A 5A        add   r10
000A:D043 EF           getb
000A:D044 50           add   r0
000A:D045 FE 09 CF     iwt   r14,#CF09
000A:D048 1E 5E        add   r14
000A:D04A B7 57        add   r7
000A:D04C 57           add   r7
000A:D04D D0           inc   r0
000A:D04E 1F 5F        add   r15
000A:D050 FF 42 D6     iwt   r15,#D642
000A:D053 01           nop

DATA_0AD054:         db $1C, $D5, $01, $1B, $D6, $01, $4B, $D6
DATA_0AD05C:         db $01, $69, $D6, $01, $0F, $E2, $01, $59
DATA_0AD064:         db $E4, $01, $C5, $E3, $01, $BA, $E4, $01
DATA_0AD06C:         db $9F, $DD, $01, $79, $D6, $01, $91, $DD
DATA_0AD074:         db $01, $85, $E3, $01, $48, $E1, $01, $80
DATA_0AD07C:         db $E5, $01, $D1

000A:D07F F0 1F 18     iwt   r0,#181F
000A:D082 51           add   r1
000A:D083 B2 30        stw   (r0)
000A:D085 D1           inc   r1
000A:D086 D1           inc   r1
000A:D087 3C           loop
000A:D088 D1           inc   r1
000A:D089 60           sub   r0
000A:D08A 00           stop
000A:D08B 01           nop

000A:D08C 3F EF        getbs
000A:D08E DE           inc   r14
000A:D08F 18 59        add   r9
000A:D091 3F EF        getbs
000A:D093 DE           inc   r14
000A:D094 5A           add   r10
000A:D095 3D A6 E5     lms   r6,(01CA)
000A:D098 E6           dec   r6
000A:D099 17           to    r7
000A:D09A 0B 05        bmi   D0A1
000A:D09C 50           add   r0
000A:D09D FF 34 D1     iwt   r15,#D134
000A:D0A0 01           nop
000A:D0A1 3D A5 53     lms   r5,(00A6)
000A:D0A4 65           sub   r5
000A:D0A5 F5 E0 00     iwt   r5,#00E0
000A:D0A8 65           sub   r5
000A:D0A9 3D A5 52     lms   r5,(00A4)
000A:D0AC 0D 1A        bcs   D0C8
000A:D0AE B8 65        sub   r5
000A:D0B0 C0           hib
000A:D0B1 08 15        bne   D0C8
000A:D0B3 B8 03        lsr
000A:D0B5 03           lsr
000A:D0B6 03           lsr
000A:D0B7 A5 3E        ibt   r5,#003E
000A:D0B9 15 75        and   r5
000A:D0BB F0 E0 01     iwt   r0,#01E0
000A:D0BE 77           and   r7
000A:D0BF 50           add   r0
000A:D0C0 C5           or    r5
000A:D0C1 F5 9E 40     iwt   r5,#409E
000A:D0C4 55           add   r5
000A:D0C5 05 2B        bra   D0F2

000A:D0C7 40           ldw   (r0)

000A:D0C8 70           merge
000A:D0C9 09 64        beq   D12F
000A:D0CB 16 9E        lob
000A:D0CD C0           hib
000A:D0CE 3E 7E        and   #0E
000A:D0D0 3F 88        umult #08
000A:D0D2 C6           or    r6
000A:D0D3 F6 AA 0C     iwt   r6,#0CAA
000A:D0D6 56           add   r6
000A:D0D7 3D 40        ldb   (r0)
000A:D0D9 A6 3F        ibt   r6,#003F
000A:D0DB 76           and   r6
000A:D0DC 16 4D        swap
000A:D0DE F0 E0 01     iwt   r0,#01E0
000A:D0E1 15 77        and   r7
000A:D0E3 B8 9E        lob
000A:D0E5 03           lsr
000A:D0E6 03           lsr
000A:D0E7 03           lsr
000A:D0E8 C5           or    r5
000A:D0E9 03           lsr
000A:D0EA C6           or    r6
000A:D0EB 50           add   r0
000A:D0EC F6 00 80     iwt   r6,#8000
000A:D0EF 56           add   r6
000A:D0F0 00           stop
000A:D0F1 01           nop

000A:D0F2 20 16        move  r6,r0
000A:D0F4 C0           hib
000A:D0F5 3F 83        umult #03
000A:D0F7 2E 15        move  r5,r14
000A:D0F9 FE 12 BB     iwt   r14,#BB12
000A:D0FC 1E 5E        add   r14
000A:D0FE 3E A8 00     sms   (0000),r8
000A:D101 EF           getb
000A:D102 DE           inc   r14
000A:D103 27 96        asr
000A:D105 3E A7 01     sms   (0002),r7
000A:D108 A8 F8        ibt   r8,#FFF8
000A:D10A 3D EF        getbh
000A:D10C DE           inc   r14
000A:D10D 20 17        move  r7,r0
000A:D10F C0           hib
000A:D110 78           and   r8
000A:D111 A8 72        ibt   r8,#0072
000A:D113 68           sub   r8
000A:D114 3E 6F        sub   #0F
000A:D116 0D 10        bcs   D128
000A:D118 18 A8 11     ibt   r8,#0011
000A:D11B 58           add   r8
000A:D11C 3D F8 08 1E  lm    r8,(1E08)
000A:D120 78           and   r8
000A:D121 09 05        beq   D128
000A:D123 18 27 3E C2  or    #02
000A:D127 18 EF        getb
000A:D129 27 10        move  r0,r7
000A:D12B 25 1E        move  r14,r5
000A:D12D 9B           jmp   r11
000A:D12E 01           nop

000A:D12F A6 01        ibt   r6,#0001
000A:D131 05 C4        bra   D0F7

000A:D133 60           sub   r0

000A:D134 3D F0 94 00  lm    r0,(0094)
000A:D138 3F 77        bic   #07
000A:D13A B8 60        sub   r0
000A:D13C 0A 02        bpl   D140
000A:D13E 03           lsr
000A:D13F 60           sub   r0
000A:D140 03           lsr
000A:D141 A5 42        ibt   r5,#0042
000A:D143 65           sub   r5
000A:D144 0C 03        bcc   D149
000A:D146 55           add   r5
000A:D147 A0 40        ibt   r0,#0040
000A:D149 03           lsr
000A:D14A 08 08        bne   D154
000A:D14C 50           add   r0
000A:D14D 3D F0 F0 1E  lm    r0,(1EF0)
000A:D151 05 07        bra   D15A

000A:D153 F5 F5 30     iwt   r5,#30F5
000A:D156 1F 55        add   r5
000A:D158 40           ldw   (r0)
000A:D159 F5 FF 1F     iwt   r5,#1FFF
000A:D15C 75           and   r5
000A:D15D 3D F5 9C 00  lm    r5,(009C)
000A:D161 65           sub   r5
000A:D162 50           add   r0
000A:D163 17 57        add   r7
000A:D165 FF A2 D0     iwt   r15,#D0A2
000A:D168 3D AB 30     lms   r11,(0060)
000A:D16B F0 E2 11     iwt   r0,#11E2
000A:D16E 51           add   r1
000A:D16F 40           ldw   (r0)
000A:D170 3D C3        xor   r3
000A:D172 0B 03        bmi   D177
000A:D174 01           nop
000A:D175 9B           jmp   r11
000A:D176 01           nop
000A:D177 23 B3        moves r3,r3
000A:D179 0B 04        bmi   D17F
000A:D17B 60           sub   r0
000A:D17C F0 80 00     iwt   r0,#0080
000A:D17F 3E A0 08     sms   (0010),r0
000A:D182 B9 18 3E 58  add   #08
000A:D186 F6 00 0F     iwt   r6,#0F00
000A:D189 F5 40 00     iwt   r5,#0040
000A:D18C B1 15 65     sub   r5
000A:D18F F0 36 1A     iwt   r0,#1A36
000A:D192 55           add   r5
000A:D193 40           ldw   (r0)
000A:D194 03           lsr
000A:D195 03           lsr
000A:D196 03           lsr
000A:D197 9F           fmult
000A:D198 5A           add   r10
000A:D199 3E 58        add   #08
000A:D19B 94           link  #04
000A:D19C FF 96 D0     iwt   r15,#D096
000A:D19F 3D           alt1
000A:D1A0 05 25        bra   D1C7

000A:D1A2 01           nop
000A:D1A3 AB 30        ibt   r11,#0030
000A:D1A5 F0 E2 11     iwt   r0,#11E2
000A:D1A8 51           add   r1
000A:D1A9 40           ldw   (r0)
000A:D1AA 3D C3        xor   r3
000A:D1AC 0B 09        bmi   D1B7
000A:D1AE 01           nop
000A:D1AF DE           inc   r14
000A:D1B0 DE           inc   r14
000A:D1B1 A7 00        ibt   r7,#0000
000A:D1B3 9B           jmp   r11
000A:D1B4 01           nop
000A:D1B5 AB 30        ibt   r11,#0030
000A:D1B7 23 B3        moves r3,r3
000A:D1B9 0B 04        bmi   D1BF
000A:D1BB 60           sub   r0
000A:D1BC F0 80 00     iwt   r0,#0080
000A:D1BF 3E A0 08     sms   (0010),r0
000A:D1C2 94           link  #04
000A:D1C3 FF 8D D0     iwt   r15,#D08D
000A:D1C6 3F 3D A0 01  lms   r0,(0002)
000A:D1CA 14 3E 7F     and   #0F
000A:D1CD 3E A4 24     sms   (0048),r4
000A:D1D0 A5 05        ibt   r5,#0005
000A:D1D2 23 B3        moves r3,r3
000A:D1D4 0A 03        bpl   D1D9
000A:D1D6 01           nop
000A:D1D7 A5 04        ibt   r5,#0004
000A:D1D9 B7 75        and   r5
000A:D1DB 65           sub   r5
000A:D1DC 3E A0 20     sms   (0040),r0
000A:D1DF 09 2A        beq   D20B
000A:D1E1 01           nop
000A:D1E2 3E A6 02     sms   (0004),r6
000A:D1E5 3E A7 03     sms   (0006),r7
000A:D1E8 3E A8 04     sms   (0008),r8
000A:D1EB 3D A8 00     lms   r8,(0000)
000A:D1EE 3E A8 05     sms   (000A),r8
000A:D1F1 3D A7 01     lms   r7,(0002)
000A:D1F4 3E A7 06     sms   (000C),r7
000A:D1F7 3E A5 07     sms   (000E),r5
000A:D1FA B3 57        add   r7
000A:D1FC 94           link  #04
000A:D1FD FF 96 D0     iwt   r15,#D096
000A:D200 3D 3D A5 07  lms   r5,(000E)
000A:D204 75           and   r5
000A:D205 65           sub   r5
000A:D206 08 67        bne   D26F
000A:D208 01           nop
000A:D209 24 63        sub   r3
000A:D20B 3E AE 2E     sms   (005C),r14
000A:D20E B8 4D        swap
000A:D210 23 B3        moves r3,r3
000A:D212 0A 03        bpl   D217
000A:D214 03           lsr
000A:D215 D0           inc   r0
000A:D216 D0           inc   r0
000A:D217 FE 0E BD     iwt   r14,#BD0E
000A:D21A 1E 5E        add   r14
000A:D21C 3D A0 00     lms   r0,(0000)
000A:D21F 3E 7F        and   #0F
000A:D221 50           add   r0
000A:D222 50           add   r0
000A:D223 50           add   r0
000A:D224 1E 5E        add   r14
000A:D226 15 EF        getb
000A:D228 DE           inc   r14
000A:D229 3F EF        getbs
000A:D22B 3D AE 2E     lms   r14,(005C)
000A:D22E 64           sub   r4
000A:D22F 3D C3        xor   r3
000A:D231 0B 34        bmi   D267
000A:D233 14 3D C3     xor   r3
000A:D236 D4           inc   r4
000A:D237 3E A5 08     sms   (0010),r5
000A:D23A 23 B3        moves r3,r3
000A:D23C 0A 57        bpl   D295
000A:D23E B4 3E 5A     add   #0A
000A:D241 0B 24        bmi   D267
000A:D243 01           nop
000A:D244 F0 E2 11     iwt   r0,#11E2
000A:D247 51           add   r1
000A:D248 40           ldw   (r0)
000A:D249 50           add   r0
000A:D24A 0C 6C        bcc   D2B8
000A:D24C D2           inc   r2
000A:D24D F0 8E 26     iwt   r0,#268E
000A:D250 51           add   r1
000A:D251 40           ldw   (r0)
000A:D252 9E           lob
000A:D253 08 11        bne   D266
000A:D255 01           nop
000A:D256 F0 E1 11     iwt   r0,#11E1
000A:D259 51           add   r1
000A:D25A 40           ldw   (r0)
000A:D25B 3D C5        xor   r5
000A:D25D 95           sex
000A:D25E 0B 06        bmi   D266
000A:D260 60           sub   r0
000A:D261 3E A0 08     sms   (0010),r0
000A:D264 2A 54        add   r4
000A:D266 E2           dec   r2
000A:D267 3D A0 20     lms   r0,(0040)
000A:D26A 3E 60        sub   #00
000A:D26C 09 43        beq   D2B1
000A:D26E 01           nop
000A:D26F 3D A4 24     lms   r4,(0048)
000A:D272 3D A6 02     lms   r6,(0004)
000A:D275 3D A7 03     lms   r7,(0006)
000A:D278 3D A8 04     lms   r8,(0008)
000A:D27B 3D A0 05     lms   r0,(000A)
000A:D27E 3E A0 00     sms   (0000),r0
000A:D281 3D A0 06     lms   r0,(000C)
000A:D284 3E A0 01     sms   (0002),r0
000A:D287 23 B3        moves r3,r3
000A:D289 0B 0F        bmi   D29A
000A:D28B B7 3E 72     and   #02
000A:D28E 09 6B        beq   D2FB
000A:D290 01           nop
000A:D291 A0 10        ibt   r0,#0010
000A:D293 14 64        sub   r4
000A:D295 2A 54        add   r4
000A:D297 05 1A        bra   D2B3

000A:D299 D2           inc   r2
000A:D29A 3E 73        and   #03
000A:D29C 09 15        beq   D2B3
000A:D29E 01           nop
000A:D29F F0 E2 11     iwt   r0,#11E2
000A:D2A2 51           add   r1
000A:D2A3 40           ldw   (r0)
000A:D2A4 50           add   r0
000A:D2A5 0D 0A        bcs   D2B1
000A:D2A7 24 4F        not
000A:D2A9 D4           inc   r4
000A:D2AA B4 3E 5A     add   #0A
000A:D2AD 0A 09        bpl   D2B8
000A:D2AF D2           inc   r2
000A:D2B0 E2           dec   r2
000A:D2B1 A4 20        ibt   r4,#0020
000A:D2B3 3D AB 30     lms   r11,(0060)
000A:D2B6 9B           jmp   r11
000A:D2B7 01           nop

000A:D2B8 F0 00 F8     iwt   r0,#F800
000A:D2BB 77           and   r7
000A:D2BC F5 00 98     iwt   r5,#9800
000A:D2BF 65           sub   r5
000A:D2C0 08 34        bne   D2F6
000A:D2C2 01           nop
000A:D2C3 3D A0 08     lms   r0,(0010)
000A:D2C6 4D           swap
000A:D2C7 09 0A        beq   D2D3
000A:D2C9 01           nop
000A:D2CA A5 D0        ibt   r5,#FFD0
000A:D2CC 0A 16        bpl   D2E4
000A:D2CE 25 4F        not
000A:D2D0 05 12        bra   D2E4

000A:D2D2 D5           inc   r5

000A:D2D3 B6 C0        hib
000A:D2D5 F5 82 00     iwt   r5,#0082
000A:D2D8 65           sub   r5
000A:D2D9 0B 10        bmi   D2EB
000A:D2DB 01           nop
000A:D2DC F5 F0 0F     iwt   r5,#0FF0
000A:D2DF 09 03        beq   D2E4
000A:D2E1 25 4F        not
000A:D2E3 D5           inc   r5
000A:D2E4 F0 C3 0E     iwt   r0,#0EC3
000A:D2E7 51           add   r1
000A:D2E8 B5 3D 30     stb   (r0)
000A:D2EB F0 81 17     iwt   r0,#1781
000A:D2EE 51           add   r1
000A:D2EF 3D 40        ldb   (r0)
000A:D2F1 3E 60        sub   #00
000A:D2F3 09 1D        beq   D312
000A:D2F5 01           nop
000A:D2F6 3D AB 30     lms   r11,(0060)
000A:D2F9 9B           jmp   r11
000A:D2FA 01           nop

000A:D2FB F0 00 F8     iwt   r0,#F800
000A:D2FE 77           and   r7
000A:D2FF F5 00 98     iwt   r5,#9800
000A:D302 65           sub   r5
000A:D303 08 F1        bne   D2F6
000A:D305 B1 03        lsr
000A:D307 03           lsr
000A:D308 3D F5 74 19  lm    r5,(1974)
000A:D30C 55           add   r5
000A:D30D 3E 77        and   #07
000A:D30F 09 E5        beq   D2F6
000A:D311 01           nop
000A:D312 3E A4 24     sms   (0048),r4
000A:D315 A5 08        ibt   r5,#0008
000A:D317 F0 81 17     iwt   r0,#1781
000A:D31A 51           add   r1
000A:D31B B5 3D 30     stb   (r0)
000A:D31E A0 37        ibt   r0,#0037
000A:D320 3E A0 3D     sms   (007A),r0
000A:D323 F5 01 02     iwt   r5,#0201
000A:D326 94           link  #04
000A:D327 FF E3 DF     iwt   r15,#DFE3
000A:D32A 01           nop
000A:D32B F0 A2 10     iwt   r0,#10A2
000A:D32E 54           add   r4
000A:D32F B9 30        stw   (r0)
000A:D331 3D A5 01     lms   r5,(0002)
000A:D334 F0 42 11     iwt   r0,#1142
000A:D337 54           add   r4
000A:D338 B5 30        stw   (r0)
000A:D33A A5 05        ibt   r5,#0005
000A:D33C F0 C2 13     iwt   r0,#13C2
000A:D33F 54           add   r4
000A:D340 B5 30        stw   (r0)
000A:D342 A5 02        ibt   r5,#0002
000A:D344 F0 82 17     iwt   r0,#1782
000A:D347 54           add   r4
000A:D348 B5 30        stw   (r0)
000A:D34A 3D A4 24     lms   r4,(0048)
000A:D34D 3D AB 30     lms   r11,(0060)
000A:D350 9B           jmp   r11
000A:D351 01           nop

000A:D352 13 94        link  #04
000A:D354 FF 8D D0     iwt   r15,#D08D
000A:D357 3F 3E 72     and   #02
000A:D35A 09 02        beq   D35E
000A:D35C 01           nop
000A:D35D D2           inc   r2
000A:D35E 23 1B        move  r11,r3
000A:D360 9B           jmp   r11
000A:D361 01           nop

000A:D362 13 94        link  #04
000A:D364 FF 8D D0     iwt   r15,#D08D
000A:D367 3F 3E 73     and   #03
000A:D36A 09 02        beq   D36E
000A:D36C 01           nop
000A:D36D D2           inc   r2
000A:D36E 23 1B        move  r11,r3
000A:D370 9B           jmp   r11
000A:D371 01           nop

000A:D372 13 94        link  #04
000A:D374 FF 8D D0     iwt   r15,#D08D
000A:D377 3F 3E 72     and   #02
000A:D37A 09 02        beq   D37E
000A:D37C 01           nop
000A:D37D D2           inc   r2
000A:D37E 94           link  #04
000A:D37F FF 01 D4     iwt   r15,#D401
000A:D382 A0 23        ibt   r0,#0023
000A:D384 1B 9B        jmp   r11
000A:D386 01           nop

000A:D387 AB 30        ibt   r11,#0030
000A:D389 F6 00 0F     iwt   r6,#0F00
000A:D38C F5 40 00     iwt   r5,#0040
000A:D38F B1 15 65     sub   r5
000A:D392 F0 36 1A     iwt   r0,#1A36
000A:D395 55           add   r5
000A:D396 40           ldw   (r0)
000A:D397 03           lsr
000A:D398 03           lsr
000A:D399 03           lsr
000A:D39A 9F           fmult
000A:D39B 23 B3        moves r3,r3
000A:D39D 0B 03        bmi   D3A2
000A:D39F 01           nop
000A:D3A0 4F           not
000A:D3A1 D0           inc   r0
000A:D3A2 59           add   r9
000A:D3A3 18 3E 58     add   #08
000A:D3A6 2A 10        move  r0,r10
000A:D3A8 94           link  #04
000A:D3A9 FF 96 D0     iwt   r15,#D096
000A:D3AC 3D           alt1
000A:D3AD 05 08        bra   D3B7

000A:D3AF 01           nop

000A:D3B0 AB 30        ibt   r11,#0030
000A:D3B2 94           link  #04
000A:D3B3 FF 8D D0     iwt   r15,#D08D
000A:D3B6 3F 3E 72     and   #02
000A:D3B9 09 41        beq   D3FC
000A:D3BB B2 3E 72     and   #02
000A:D3BE 08 3C        bne   D3FC
000A:D3C0 29 53        add   r3
000A:D3C2 F0 E0 11     iwt   r0,#11E0
000A:D3C5 14 51        add   r1
000A:D3C7 F0 62 0F     iwt   r0,#0F62
000A:D3CA 51           add   r1
000A:D3CB 15 40        ldw   (r0)
000A:D3CD F0 C0 00     iwt   r0,#00C0
000A:D3D0 75           and   r5
000A:D3D1 09 29        beq   D3FC
000A:D3D3 D2           inc   r2
000A:D3D4 4D           swap
000A:D3D5 0B 24        bmi   D3FB
000A:D3D7 60           sub   r0
000A:D3D8 44           ldw   (r4)
000A:D3D9 1B 3D C3     xor   r3
000A:D3DC 0A 1E        bpl   D3FC
000A:D3DE 4F           not
000A:D3DF 25 4D        swap
000A:D3E1 25 3E 74     and   #04
000A:D3E4 09 02        beq   D3E8
000A:D3E6 D0           inc   r0
000A:D3E7 60           sub   r0
000A:D3E8 90           sbk
000A:D3E9 F0 C0 13     iwt   r0,#13C0
000A:D3EC 51           add   r1
000A:D3ED 40           ldw   (r0)
000A:D3EE 3F C2        xor   #02
000A:D3F0 90           sbk
000A:D3F1 F0 A0 15     iwt   r0,#15A0
000A:D3F4 51           add   r1
000A:D3F5 40           ldw   (r0)
000A:D3F6 4F           not
000A:D3F7 D0           inc   r0
000A:D3F8 05 02        bra   D3FC

000A:D3FA 90           sbk

000A:D3FB 34           stw   (r4)
000A:D3FC 3D AB 30     lms   r11,(0060)
000A:D3FF 9B           jmp   r11
000A:D400 01           nop

000A:D401 18 77        and   r7
000A:D403 08 0D        bne   D412
000A:D405 01           nop
000A:D406 3D A0 01     lms   r0,(0002)
000A:D409 3D A5 DE     lms   r5,(01BC)
000A:D40C 65           sub   r5
000A:D40D 0B 03        bmi   D412
000A:D40F 60           sub   r0
000A:D410 A0 08        ibt   r0,#0008
000A:D412 20 15        move  r5,r0
000A:D414 F0 22 18     iwt   r0,#1822
000A:D417 51           add   r1
000A:D418 3D 40        ldb   (r0)
000A:D41A 65           sub   r5
000A:D41B 08 51        bne   D46E
000A:D41D 55           add   r5
000A:D41E 09 4C        beq   D46C
000A:D420 01           nop
000A:D421 3D F5 74 19  lm    r5,(1974)
000A:D425 A0 7F        ibt   r0,#007F
000A:D427 15 75        and   r5
000A:D429 71           and   r1
000A:D42A 65           sub   r5
000A:D42B 08 3F        bne   D46C
000A:D42D 01           nop
000A:D42E A0 10        ibt   r0,#0010
000A:D430 77           and   r7
000A:D431 08 39        bne   D46C
000A:D433 01           nop
000A:D434 3E AB 30     sms   (0060),r11
000A:D437 F5 BC 01     iwt   r5,#01BC
000A:D43A 94           link  #04
000A:D43B FF E3 DF     iwt   r15,#DFE3
000A:D43E 01           nop
000A:D43F 3D A0 00     lms   r0,(0000)
000A:D442 15 3E 68     sub   #08
000A:D445 F0 A2 10     iwt   r0,#10A2
000A:D448 54           add   r4
000A:D449 B5 30        stw   (r0)
000A:D44B 3D A0 01     lms   r0,(0002)
000A:D44E 15 3E 68     sub   #08
000A:D451 F0 42 11     iwt   r0,#1142
000A:D454 54           add   r4
000A:D455 B5 30        stw   (r0)
000A:D457 3D F5 70 19  lm    r5,(1970)
000A:D45B F0 4C 1E     iwt   r0,#1E4C
000A:D45E 54           add   r4
000A:D45F B5 30        stw   (r0)
000A:D461 A5 FF        ibt   r5,#FFFF
000A:D463 F0 82 17     iwt   r0,#1782
000A:D466 54           add   r4
000A:D467 B5 30        stw   (r0)
000A:D469 3D AB 30     lms   r11,(0060)
000A:D46C 9B           jmp   r11
000A:D46D 01           nop

000A:D46E 20 14        move  r4,r0
000A:D470 F0 22 18     iwt   r0,#1822
000A:D473 51           add   r1
000A:D474 B5 3D 30     stb   (r0)
000A:D477 B4 4D        swap
000A:D479 0B 49        bmi   D4C4
000A:D47B B7 3E 72     and   #02
000A:D47E 08 44        bne   D4C4
000A:D480 B4 C7        or    r7
000A:D482 A4 10        ibt   r4,#0010
000A:D484 74           and   r4
000A:D485 08 3F        bne   D4C6
000A:D487 3E AB 30     sms   (0060),r11
000A:D48A A0 5F        ibt   r0,#005F
000A:D48C 3E A0 3D     sms   (007A),r0
000A:D48F F5 BA 01     iwt   r5,#01BA
000A:D492 94           link  #04
000A:D493 FF E3 DF     iwt   r15,#DFE3
000A:D496 01           nop
000A:D497 3D A0 00     lms   r0,(0000)
000A:D49A 15 3E 68     sub   #08
000A:D49D F0 A2 10     iwt   r0,#10A2
000A:D4A0 54           add   r4
000A:D4A1 B5 30        stw   (r0)
000A:D4A3 3D A0 01     lms   r0,(0002)
000A:D4A6 3E 68        sub   #08
000A:D4A8 15 3F 7F     bic   #0F
000A:D4AB F0 42 11     iwt   r0,#1142
000A:D4AE 54           add   r4
000A:D4AF B5 30        stw   (r0)
000A:D4B1 A5 1A        ibt   r5,#001A
000A:D4B3 F0 4C 1E     iwt   r0,#1E4C
000A:D4B6 54           add   r4
000A:D4B7 B5 30        stw   (r0)
000A:D4B9 A5 03        ibt   r5,#0003
000A:D4BB F0 82 17     iwt   r0,#1782
000A:D4BE 54           add   r4
000A:D4BF B5 30        stw   (r0)
000A:D4C1 3D AB 30     lms   r11,(0060)
000A:D4C4 9B           jmp   r11
000A:D4C5 01           nop

000A:D4C6 3E AB 30     sms   (0060),r11
000A:D4C9 F5 C7 01     iwt   r5,#01C7
000A:D4CC 94           link  #04
000A:D4CD FF E3 DF     iwt   r15,#DFE3
000A:D4D0 01           nop
000A:D4D1 F0 40 11     iwt   r0,#1140
000A:D4D4 54           add   r4
000A:D4D5 3D 40        ldb   (r0)
000A:D4D7 9E           lob
000A:D4D8 08 12        bne   D4EC
000A:D4DA 15 60        sub   r0
000A:D4DC F0 C0 0E     iwt   r0,#0EC0
000A:D4DF 54           add   r4
000A:D4E0 B5 30        stw   (r0)
000A:D4E2 E5           dec   r5
000A:D4E3 F0 62 14     iwt   r0,#1462
000A:D4E6 54           add   r4
000A:D4E7 B5 30        stw   (r0)
000A:D4E9 05 2C        bra   D517

000A:D4EB 01           nop

000A:D4EC 3D A0 00     lms   r0,(0000)
000A:D4EF 15 3E 68     sub   #08
000A:D4F2 F0 A2 10     iwt   r0,#10A2
000A:D4F5 54           add   r4
000A:D4F6 B5 30        stw   (r0)
000A:D4F8 3D A0 01     lms   r0,(0002)
000A:D4FB 3E 68        sub   #08
000A:D4FD 15 3F 7F     bic   #0F
000A:D500 F0 42 11     iwt   r0,#1142
000A:D503 54           add   r4
000A:D504 B5 30        stw   (r0)
000A:D506 F5 40 FF     iwt   r5,#FF40
000A:D509 F0 4C 1E     iwt   r0,#1E4C
000A:D50C 54           add   r4
000A:D50D B5 30        stw   (r0)
000A:D50F A5 30        ibt   r5,#0030
000A:D511 F0 82 17     iwt   r0,#1782
000A:D514 54           add   r4
000A:D515 B5 30        stw   (r0)
000A:D517 3D AB 30     lms   r11,(0060)
000A:D51A 9B           jmp   r11
000A:D51B 01           nop

000A:D51C 94           link  #04
000A:D51D FF 72 D3     iwt   r15,#D372
000A:D520 2B 22 52     add   r2
000A:D523 22 52        add   r2
000A:D525 F0 E0 11     iwt   r0,#11E0
000A:D528 51           add   r1
000A:D529 40           ldw   (r0)
000A:D52A E0           dec   r0
000A:D52B 0A 18        bpl   D545
000A:D52D 01           nop
000A:D52E A3 01        ibt   r3,#0001
000A:D530 94           link  #04
000A:D531 FF B0 D3     iwt   r15,#D3B0
000A:D534 3E F0 E0 11  sm    (11E0),r0
000A:D538 51           add   r1
000A:D539 40           ldw   (r0)
000A:D53A 3E 60        sub   #00
000A:D53C 09 0A        beq   D548
000A:D53E 22 52        add   r2
000A:D540 DE           inc   r14
000A:D541 DE           inc   r14
000A:D542 05 0D        bra   D551

000A:D544 22 DE        inc   r14
000A:D546 DE           inc   r14
000A:D547 22 52        add   r2
000A:D549 A3 FF        ibt   r3,#FFFF
000A:D54B 94           link  #04
000A:D54C FF B0 D3     iwt   r15,#D3B0
000A:D54F 3E 22 52     add   #02
000A:D552 A3 10        ibt   r3,#0010
000A:D554 94           link  #04
000A:D555 FF A3 D1     iwt   r15,#D1A3
000A:D558 3E B2 03     lsr
000A:D55B 0C 09        bcc   D566
000A:D55D 01           nop
000A:D55E DA           inc   r10
000A:D55F F0 E2 11     iwt   r0,#11E2
000A:D562 14 51        add   r1
000A:D564 60           sub   r0
000A:D565 34           stw   (r4)
000A:D566 22 52        add   r2
000A:D568 A3 F0        ibt   r3,#FFF0
000A:D56A 94           link  #04
000A:D56B FF B5 D1     iwt   r15,#D1B5
000A:D56E 3E B2 03     lsr
000A:D571 0D 51        bcs   D5C4
000A:D573 01           nop
000A:D574 F0 20 18     iwt   r0,#1820
000A:D577 51           add   r1
000A:D578 40           ldw   (r0)
000A:D579 03           lsr
000A:D57A 0C 7F        bcc   D5FB
000A:D57C 01           nop
000A:D57D F0 63 0F     iwt   r0,#0F63
000A:D580 51           add   r1
000A:D581 16 3D 40     ldb   (r0)
000A:D584 B6 3E 73     and   #03
000A:D587 09 72        beq   D5FB
000A:D589 03           lsr
000A:D58A F5 E0 11     iwt   r5,#11E0
000A:D58D 25 51        add   r1
000A:D58F 15 45        ldw   (r5)
000A:D591 25 4F        not
000A:D593 03           lsr
000A:D594 0D 21        bcs   D5B7
000A:D596 D5           inc   r5
000A:D597 B6 3E 74     and   #04
000A:D59A 08 02        bne   D59E
000A:D59C 60           sub   r0
000A:D59D B5 90        sbk
000A:D59F A6 00        ibt   r6,#0000
000A:D5A1 F0 A1 10     iwt   r0,#10A1
000A:D5A4 51           add   r1
000A:D5A5 B6 3D 30     stb   (r0)
000A:D5A8 F0 C0 13     iwt   r0,#13C0
000A:D5AB 51           add   r1
000A:D5AC 40           ldw   (r0)
000A:D5AD 3F C2        xor   #02
000A:D5AF 90           sbk
000A:D5B0 F0 A0 15     iwt   r0,#15A0
000A:D5B3 51           add   r1
000A:D5B4 40           ldw   (r0)
000A:D5B5 4F           not
000A:D5B6 D0           inc   r0
000A:D5B7 90           sbk
000A:D5B8 F0 2E 27     iwt   r0,#272E
000A:D5BB 51           add   r1
000A:D5BC 19 40        ldw   (r0)
000A:D5BE D0           inc   r0
000A:D5BF D0           inc   r0
000A:D5C0 1A           to    r10
000A:D5C1 05 16        bra   D5D9

000A:D5C3 40           ldw   (r0)

000A:D5C4 2A 54        add   r4
000A:D5C6 A6 FF        ibt   r6,#FFFF
000A:D5C8 F0 41 11     iwt   r0,#1141
000A:D5CB 51           add   r1
000A:D5CC B6 3D 30     stb   (r0)
000A:D5CF F0 2E 27     iwt   r0,#272E
000A:D5D2 51           add   r1
000A:D5D3 B9 30        stw   (r0)
000A:D5D5 D0           inc   r0
000A:D5D6 D0           inc   r0
000A:D5D7 BA 30        stw   (r0)
000A:D5D9 3D A6 08     lms   r6,(0010)
000A:D5DC F0 C2 0E     iwt   r0,#0EC2
000A:D5DF 51           add   r1
000A:D5E0 B6 3D 30     stb   (r0)
000A:D5E3 60           sub   r0
000A:D5E4 3E A0 08     sms   (0010),r0
000A:D5E7 F0 62 0F     iwt   r0,#0F62
000A:D5EA 51           add   r1
000A:D5EB 40           ldw   (r0)
000A:D5EC A6 20        ibt   r6,#0020
000A:D5EE 76           and   r6
000A:D5EF 08 0A        bne   D5FB
000A:D5F1 01           nop
000A:D5F2 F0 E2 11     iwt   r0,#11E2
000A:D5F5 14 51        add   r1
000A:D5F7 F0 00 01     iwt   r0,#0100
000A:D5FA 34           stw   (r4)
000A:D5FB 3D A5 08     lms   r5,(0010)
000A:D5FE F0 8E 26     iwt   r0,#268E
000A:D601 51           add   r1
000A:D602 B5 30        stw   (r0)
000A:D604 F0 A2 10     iwt   r0,#10A2
000A:D607 51           add   r1
000A:D608 B9 30        stw   (r0)
000A:D60A F0 E0 16     iwt   r0,#16E0
000A:D60D 51           add   r1
000A:D60E 40           ldw   (r0)
000A:D60F 2A 60        sub   r0
000A:D611 F0 42 11     iwt   r0,#1142
000A:D614 51           add   r1
000A:D615 BA 30        stw   (r0)
000A:D617 FF 7F D0     iwt   r15,#D07F
000A:D61A D1           inc   r1
000A:D61B 94           link  #04
000A:D61C FF 72 D3     iwt   r15,#D372
000A:D61F 2B 22 52     add   r2
000A:D622 22 52        add   r2
000A:D624 94           link  #04
000A:D625 FF 52 D3     iwt   r15,#D352
000A:D628 2B 22 52     add   r2
000A:D62B 94           link  #04
000A:D62C FF 52 D3     iwt   r15,#D352
000A:D62F 2B 22 52     add   r2
000A:D632 94           link  #04
000A:D633 FF 52 D3     iwt   r15,#D352
000A:D636 2B 22 52     add   r2
000A:D639 94           link  #04
000A:D63A FF 52 D3     iwt   r15,#D352
000A:D63D 2B FF 7F D0  iwt   r15,#D07F
000A:D641 D1           inc   r1
000A:D642 94           link  #04
000A:D643 FF 72 D3     iwt   r15,#D372
000A:D646 2B FF 7F D0  iwt   r15,#D07F
000A:D64A D1           inc   r1
000A:D64B 94           link  #04
000A:D64C FF 52 D3     iwt   r15,#D352
000A:D64F 2B 22 52     add   r2
000A:D652 94           link  #04
000A:D653 FF 52 D3     iwt   r15,#D352
000A:D656 2B 22 52     add   r2
000A:D659 94           link  #04
000A:D65A FF 52 D3     iwt   r15,#D352
000A:D65D 2B 22 52     add   r2
000A:D660 94           link  #04
000A:D661 FF 52 D3     iwt   r15,#D352
000A:D664 2B FF 7F D0  iwt   r15,#D07F
000A:D668 D1           inc   r1
000A:D669 94           link  #04
000A:D66A FF 52 D3     iwt   r15,#D352
000A:D66D 2B 22 52     add   r2
000A:D670 94           link  #04
000A:D671 FF 52 D3     iwt   r15,#D352
000A:D674 2B FF 7F D0  iwt   r15,#D07F
000A:D678 D1           inc   r1
000A:D679 94           link  #04
000A:D67A FF 72 D3     iwt   r15,#D372
000A:D67D 2B 94        link  #04
000A:D67F FF 15 DD     iwt   r15,#DD15
000A:D682 01           nop
000A:D683 22 52        add   r2
000A:D685 22 52        add   r2
000A:D687 F0 E0 11     iwt   r0,#11E0
000A:D68A 51           add   r1
000A:D68B 40           ldw   (r0)
000A:D68C E0           dec   r0
000A:D68D 0A 24        bpl   D6B3
000A:D68F 01           nop
000A:D690 A3 10        ibt   r3,#0010
000A:D692 94           link  #04
000A:D693 FF 0B D8     iwt   r15,#D80B
000A:D696 3E 94        jmp r4
000A:D698 FF 0D D9     iwt   r15,#D90D
000A:D69B 01           nop
000A:D69C B2 03        lsr
000A:D69E 0C 03        bcc   D6A3
000A:D6A0 01           nop
000A:D6A1 29 54        add   r4
000A:D6A3 F0 E0 11     iwt   r0,#11E0
000A:D6A6 51           add   r1
000A:D6A7 40           ldw   (r0)
000A:D6A8 3E 60        sub   #00
000A:D6AA 09 0A        beq   D6B6
000A:D6AC 22 52        add   r2
000A:D6AE DE           inc   r14
000A:D6AF DE           inc   r14
000A:D6B0 05 19        bra   D6CB

000A:D6B2 22 DE        inc   r14
000A:D6B4 DE           inc   r14
000A:D6B5 22 52        add   r2
000A:D6B7 A3 F0        ibt   r3,#FFF0
000A:D6B9 94           link  #04
000A:D6BA FF 0B D8     iwt   r15,#D80B
000A:D6BD 3E 94        jmp r4
000A:D6BF FF 0D D9     iwt   r15,#D90D
000A:D6C2 01           nop
000A:D6C3 B2 03        lsr
000A:D6C5 0C 03        bcc   D6CA
000A:D6C7 01           nop
000A:D6C8 29 54        add   r4
000A:D6CA 22 52        add   r2
000A:D6CC A3 10        ibt   r3,#0010
000A:D6CE 94           link  #04
000A:D6CF FF A3 D1     iwt   r15,#D1A3
000A:D6D2 3E 94        jmp r4
000A:D6D4 FF 12 D9     iwt   r15,#D912
000A:D6D7 01           nop
000A:D6D8 B2 03        lsr
000A:D6DA 0C 03        bcc   D6DF
000A:D6DC 01           nop
000A:D6DD 2A 54        add   r4
000A:D6DF 22 52        add   r2
000A:D6E1 A3 F0        ibt   r3,#FFF0
000A:D6E3 F0 02 15     iwt   r0,#1502
000A:D6E6 51           add   r1
000A:D6E7 40           ldw   (r0)
000A:D6E8 A5 40        ibt   r5,#0040
000A:D6EA 65           sub   r5
000A:D6EB 0D 0A        bcs   D6F7
000A:D6ED 01           nop
000A:D6EE F0 E2 11     iwt   r0,#11E2
000A:D6F1 51           add   r1
000A:D6F2 40           ldw   (r0)
000A:D6F3 50           add   r0
000A:D6F4 0D 52        bcs   D748
000A:D6F6 01           nop
000A:D6F7 94           link  #04
000A:D6F8 FF B5 D1     iwt   r15,#D1B5
000A:D6FB 3E 94        jmp r4
000A:D6FD FF 12 D9     iwt   r15,#D912
000A:D700 01           nop
000A:D701 B2 03        lsr
000A:D703 0C 47        bcc   D74C
000A:D705 01           nop
000A:D706 2A 54        add   r4
000A:D708 F0 02 15     iwt   r0,#1502
000A:D70B 51           add   r1
000A:D70C 40           ldw   (r0)
000A:D70D A5 40        ibt   r5,#0040
000A:D70F 65           sub   r5
000A:D710 0C 36        bcc   D748
000A:D712 01           nop
000A:D713 A6 FF        ibt   r6,#FFFF
000A:D715 F0 41 11     iwt   r0,#1141
000A:D718 51           add   r1
000A:D719 B6 3D 30     stb   (r0)
000A:D71C F0 2E 27     iwt   r0,#272E
000A:D71F 51           add   r1
000A:D720 B9 30        stw   (r0)
000A:D722 D0           inc   r0
000A:D723 D0           inc   r0
000A:D724 BA 30        stw   (r0)
000A:D726 3D A6 08     lms   r6,(0010)
000A:D729 F0 C2 0E     iwt   r0,#0EC2
000A:D72C 51           add   r1
000A:D72D B6 3D 30     stb   (r0)
000A:D730 60           sub   r0
000A:D731 3E A0 08     sms   (0010),r0
000A:D734 F0 62 0F     iwt   r0,#0F62
000A:D737 51           add   r1
000A:D738 40           ldw   (r0)
000A:D739 A6 20        ibt   r6,#0020
000A:D73B 76           and   r6
000A:D73C 08 0A        bne   D748
000A:D73E 01           nop
000A:D73F F0 E2 11     iwt   r0,#11E2
000A:D742 14 51        add   r1
000A:D744 F0 00 01     iwt   r0,#0100
000A:D747 34           stw   (r4)
000A:D748 FF EB D7     iwt   r15,#D7EB
000A:D74B 01           nop
000A:D74C F0 02 15     iwt   r0,#1502
000A:D74F 51           add   r1
000A:D750 40           ldw   (r0)
000A:D751 A5 40        ibt   r5,#0040
000A:D753 65           sub   r5
000A:D754 0D F2        bcs   D748
000A:D756 B7 3E 78     and   #08
000A:D759 08 0B        bne   D766
000A:D75B 01           nop
000A:D75C 3D A0 01     lms   r0,(0002)
000A:D75F 3D A5 DE     lms   r5,(01BC)
000A:D762 65           sub   r5
000A:D763 0B E3        bmi   D748
000A:D765 01           nop
000A:D766 F0 22 18     iwt   r0,#1822
000A:D769 51           add   r1
000A:D76A 3D 40        ldb   (r0)
000A:D76C E0           dec   r0
000A:D76D 0A D9        bpl   D748
000A:D76F 01           nop
000A:D770 A0 37        ibt   r0,#0037
000A:D772 3E A0 3D     sms   (007A),r0
000A:D775 F5 01 02     iwt   r5,#0201
000A:D778 94           link  #04
000A:D779 FF E3 DF     iwt   r15,#DFE3
000A:D77C 01           nop
000A:D77D F0 A2 10     iwt   r0,#10A2
000A:D780 54           add   r4
000A:D781 B9 30        stw   (r0)
000A:D783 3D A0 01     lms   r0,(0002)
000A:D786 15 3F 7F     bic   #0F
000A:D789 F0 42 11     iwt   r0,#1142
000A:D78C 54           add   r4
000A:D78D B5 30        stw   (r0)
000A:D78F A5 05        ibt   r5,#0005
000A:D791 F0 C2 13     iwt   r0,#13C2
000A:D794 54           add   r4
000A:D795 B5 30        stw   (r0)
000A:D797 A5 02        ibt   r5,#0002
000A:D799 F0 82 17     iwt   r0,#1782
000A:D79C 54           add   r4
000A:D79D B5 30        stw   (r0)
000A:D79F A4 14        ibt   r4,#0014
000A:D7A1 F0 E2 11     iwt   r0,#11E2
000A:D7A4 51           add   r1
000A:D7A5 15 40        ldw   (r0)
000A:D7A7 F0 E0 11     iwt   r0,#11E0
000A:D7AA 51           add   r1
000A:D7AB 16 40        ldw   (r0)
000A:D7AD 25 10        move  r0,r5
000A:D7AF 26 B6        moves r6,r6
000A:D7B1 0B 03        bmi   D7B6
000A:D7B3 01           nop
000A:D7B4 4F           not
000A:D7B5 D0           inc   r0
000A:D7B6 56           add   r6
000A:D7B7 16 3D C6     xor   r6
000A:D7BA 0A 04        bpl   D7C0
000A:D7BC 01           nop
000A:D7BD A4 40        ibt   r4,#0040
000A:D7BF 60           sub   r0
000A:D7C0 16 3D 96     div2
000A:D7C3 56           add   r6
000A:D7C4 90           sbk
000A:D7C5 E0           dec   r0
000A:D7C6 0B 03        bmi   D7CB
000A:D7C8 D0           inc   r0
000A:D7C9 4F           not
000A:D7CA D0           inc   r0
000A:D7CB F5 00 FF     iwt   r5,#FF00
000A:D7CE 65           sub   r5
000A:D7CF 0B 0E        bmi   D7DF
000A:D7D1 55           add   r5
000A:D7D2 20 15        move  r5,r0
000A:D7D4 F0 C0 FF     iwt   r0,#FFC0
000A:D7D7 65           sub   r5
000A:D7D8 0A 05        bpl   D7DF
000A:D7DA 01           nop
000A:D7DB A4 40        ibt   r4,#0040
000A:D7DD A5 00        ibt   r5,#0000
000A:D7DF F0 E2 11     iwt   r0,#11E2
000A:D7E2 51           add   r1
000A:D7E3 B5 30        stw   (r0)
000A:D7E5 F0 02 15     iwt   r0,#1502
000A:D7E8 51           add   r1
000A:D7E9 B4 30        stw   (r0)
000A:D7EB 3D A5 08     lms   r5,(0010)
000A:D7EE F0 8E 26     iwt   r0,#268E
000A:D7F1 51           add   r1
000A:D7F2 B5 30        stw   (r0)
000A:D7F4 F0 A2 10     iwt   r0,#10A2
000A:D7F7 51           add   r1
000A:D7F8 B9 30        stw   (r0)
000A:D7FA F0 E0 16     iwt   r0,#16E0
000A:D7FD 51           add   r1
000A:D7FE 40           ldw   (r0)
000A:D7FF 2A 60        sub   r0
000A:D801 F0 42 11     iwt   r0,#1142
000A:D804 51           add   r1
000A:D805 BA 30        stw   (r0)
000A:D807 FF 7F D0     iwt   r15,#D07F
000A:D80A D1           inc   r1
000A:D80B AB 30        ibt   r11,#0030
000A:D80D F0 02 15     iwt   r0,#1502
000A:D810 51           add   r1
000A:D811 40           ldw   (r0)
000A:D812 A5 40        ibt   r5,#0040
000A:D814 65           sub   r5
000A:D815 0C 32        bcc   D849
000A:D817 01           nop
000A:D818 94           link  #04
000A:D819 FF 8D D0     iwt   r15,#D08D
000A:D81C 3F 3E 72     and   #02
000A:D81F 09 23        beq   D844
000A:D821 B2 3E 72     and   #02
000A:D824 08 1E        bne   D844
000A:D826 B3 95        sex
000A:D828 0B 02        bmi   D82C
000A:D82A C0           hib
000A:D82B D0           inc   r0
000A:D82C 14 95        sex
000A:D82E F0 E0 11     iwt   r0,#11E0
000A:D831 51           add   r1
000A:D832 40           ldw   (r0)
000A:D833 15 3D C3     xor   r3
000A:D836 0A 0C        bpl   D844
000A:D838 D2           inc   r2
000A:D839 4F           not
000A:D83A D0           inc   r0
000A:D83B 90           sbk
000A:D83C F0 C0 13     iwt   r0,#13C0
000A:D83F 51           add   r1
000A:D840 40           ldw   (r0)
000A:D841 3F C2        xor   #02
000A:D843 90           sbk
000A:D844 3D AB 30     lms   r11,(0060)
000A:D847 9B           jmp   r11
000A:D848 01           nop

000A:D849 F0 C0 00     iwt   r0,#00C0
000A:D84C 23 B3        moves r3,r3
000A:D84E 0A 03        bpl   D853
000A:D850 01           nop
000A:D851 A0 40        ibt   r0,#0040
000A:D853 3E A0 08     sms   (0010),r0
000A:D856 F0 E0 11     iwt   r0,#11E0
000A:D859 51           add   r1
000A:D85A 40           ldw   (r0)
000A:D85B 3D C3        xor   r3
000A:D85D 0B 07        bmi   D866
000A:D85F 01           nop
000A:D860 DE           inc   r14
000A:D861 DE           inc   r14
000A:D862 A7 00        ibt   r7,#0000
000A:D864 9B           jmp   r11
000A:D865 01           nop

000A:D866 94           link  #04
000A:D867 FF 8D D0     iwt   r15,#D08D
000A:D86A 3F 3D A0 00  lms   r0,(0000)
000A:D86E 14 3E 7F     and   #0F
000A:D871 3E A4 24     sms   (0048),r4
000A:D874 B7 3E 74     and   #04
000A:D877 3E A0 20     sms   (0040),r0
000A:D87A 08 24        bne   D8A0
000A:D87C 01           nop
000A:D87D 3E A6 02     sms   (0004),r6
000A:D880 3E A7 03     sms   (0006),r7
000A:D883 3E A8 04     sms   (0008),r8
000A:D886 3D A0 00     lms   r0,(0000)
000A:D889 3E A0 05     sms   (000A),r0
000A:D88C 18 53        add   r3
000A:D88E 3D A0 01     lms   r0,(0002)
000A:D891 3E A0 06     sms   (000C),r0
000A:D894 94           link  #04
000A:D895 FF 96 D0     iwt   r15,#D096
000A:D898 3D 3E 74     and   #04
000A:D89B 09 44        beq   D8E1
000A:D89D 01           nop
000A:D89E 24 63        sub   r3
000A:D8A0 3E AE 2E     sms   (005C),r14
000A:D8A3 B8 4D        swap
000A:D8A5 23 B3        moves r3,r3
000A:D8A7 0A 03        bpl   D8AC
000A:D8A9 03           lsr
000A:D8AA D0           inc   r0
000A:D8AB D0           inc   r0
000A:D8AC FE 0A BD     iwt   r14,#BD0A
000A:D8AF 1E 5E        add   r14
000A:D8B1 3D A0 01     lms   r0,(0002)
000A:D8B4 3E 7F        and   #0F
000A:D8B6 50           add   r0
000A:D8B7 50           add   r0
000A:D8B8 50           add   r0
000A:D8B9 1E 5E        add   r14
000A:D8BB 15 EF        getb
000A:D8BD DE           inc   r14
000A:D8BE 3F EF        getbs
000A:D8C0 3D AE 2E     lms   r14,(005C)
000A:D8C3 64           sub   r4
000A:D8C4 3D C3        xor   r3
000A:D8C6 0B 11        bmi   D8D9
000A:D8C8 14 3D C3     xor   r3
000A:D8CB D4           inc   r4
000A:D8CC 3E A5 08     sms   (0010),r5
000A:D8CF B4 3E 58     add   #08
000A:D8D2 A5 11        ibt   r5,#0011
000A:D8D4 65           sub   r5
000A:D8D5 0C 31        bcc   D908
000A:D8D7 D2           inc   r2
000A:D8D8 E2           dec   r2
000A:D8D9 3D A0 20     lms   r0,(0040)
000A:D8DC 3E 64        sub   #04
000A:D8DE 09 28        beq   D908
000A:D8E0 01           nop
000A:D8E1 3D A4 24     lms   r4,(0048)
000A:D8E4 3D A6 02     lms   r6,(0004)
000A:D8E7 3D A7 03     lms   r7,(0006)
000A:D8EA 3D A8 04     lms   r8,(0008)
000A:D8ED 3D A0 05     lms   r0,(000A)
000A:D8F0 3E A0 00     sms   (0000),r0
000A:D8F3 3D A0 06     lms   r0,(000C)
000A:D8F6 3E A0 01     sms   (0002),r0
000A:D8F9 B7 3E 72     and   #02
000A:D8FC 09 0A        beq   D908
000A:D8FE 01           nop
000A:D8FF D2           inc   r2
000A:D900 20 B3        moves r0,r3
000A:D902 0A 02        bpl   D906
000A:D904 01           nop
000A:D905 60           sub   r0
000A:D906 14 64        sub   r4
000A:D908 3D AB 30     lms   r11,(0060)
000A:D90B 9B           jmp   r11
000A:D90C 01           nop

000A:D90D A3 00        ibt   r3,#0000
000A:D90F 05 04        bra   D915

000A:D911 B2 A3 01     ibt   r3,#0001
000A:D914 B2 03        lsr
000A:D916 0D 05        bcs   D91D
000A:D918 01           nop
000A:D919 FF 15 DD     iwt   r15,#DD15
000A:D91C 01           nop
000A:D91D F0 02 15     iwt   r0,#1502
000A:D920 51           add   r1
000A:D921 40           ldw   (r0)
000A:D922 A5 40        ibt   r5,#0040
000A:D924 65           sub   r5
000A:D925 0C 1B        bcc   D942
000A:D927 01           nop
000A:D928 F0 38 19     iwt   r0,#1938
000A:D92B 51           add   r1
000A:D92C 40           ldw   (r0)
000A:D92D 3E 60        sub   #00
000A:D92F 08 0F        bne   D940
000A:D931 D0           inc   r0
000A:D932 90           sbk
000A:D933 B6 C0        hib
000A:D935 F5 8E 00     iwt   r5,#008E
000A:D938 65           sub   r5
000A:D939 08 05        bne   D940
000A:D93B 01           nop
000A:D93C FF AC DC     iwt   r15,#DCAC
000A:D93F 01           nop
000A:D940 9B           jmp   r11
000A:D941 01           nop

000A:D942 F0 00 F8     iwt   r0,#F800
000A:D945 77           and   r7
000A:D946 F5 00 40     iwt   r5,#4000
000A:D949 65           sub   r5
000A:D94A 09 42        beq   D98E
000A:D94C 01           nop
000A:D94D B6 C0        hib
000A:D94F A5 7A        ibt   r5,#007A
000A:D951 65           sub   r5
000A:D952 08 05        bne   D959
000A:D954 55           add   r5
000A:D955 FF 08 DB     iwt   r15,#DB08
000A:D958 01           nop
000A:D959 A5 7B        ibt   r5,#007B
000A:D95B 65           sub   r5
000A:D95C 08 05        bne   D963
000A:D95E 55           add   r5
000A:D95F FF A0 DB     iwt   r15,#DBA0
000A:D962 01           nop
000A:D963 A5 7C        ibt   r5,#007C
000A:D965 65           sub   r5
000A:D966 08 05        bne   D96D
000A:D968 55           add   r5
000A:D969 FF 5B DC     iwt   r15,#DC5B
000A:D96C 01           nop
000A:D96D F5 8E 00     iwt   r5,#008E
000A:D970 65           sub   r5
000A:D971 08 05        bne   D978
000A:D973 01           nop
000A:D974 FF AC DC     iwt   r15,#DCAC
000A:D977 01           nop
000A:D978 F0 20 13     iwt   r0,#1320
000A:D97B 51           add   r1
000A:D97C 40           ldw   (r0)
000A:D97D F5 07 01     iwt   r5,#0107
000A:D980 65           sub   r5
000A:D981 A5 1F        ibt   r5,#001F
000A:D983 09 02        beq   D987
000A:D985 01           nop
000A:D986 D5           inc   r5
000A:D987 3E A5 3D     sms   (007A),r5
000A:D98A FF 1A DA     iwt   r15,#DA1A
000A:D98D 01           nop
000A:D98E A5 02        ibt   r5,#0002
000A:D990 F0 02 15     iwt   r0,#1502
000A:D993 51           add   r1
000A:D994 B5 30        stw   (r0)
000A:D996 A0 1C        ibt   r0,#001C
000A:D998 3E A0 3D     sms   (007A),r0
000A:D99B 3E AB 30     sms   (0060),r11
000A:D99E 3E A4 24     sms   (0048),r4
000A:D9A1 3E A6 26     sms   (004C),r6
000A:D9A4 F5 C3 01     iwt   r5,#01C3
000A:D9A7 94           link  #04
000A:D9A8 FF E3 DF     iwt   r15,#DFE3
000A:D9AB 01           nop
000A:D9AC 3D A0 00     lms   r0,(0000)
000A:D9AF 15 3F 7F     bic   #0F
000A:D9B2 F0 A2 10     iwt   r0,#10A2
000A:D9B5 54           add   r4
000A:D9B6 B5 30        stw   (r0)
000A:D9B8 3D A0 01     lms   r0,(0002)
000A:D9BB 15 3F 7F     bic   #0F
000A:D9BE F0 42 11     iwt   r0,#1142
000A:D9C1 54           add   r4
000A:D9C2 B5 30        stw   (r0)
000A:D9C4 F0 E0 11     iwt   r0,#11E0
000A:D9C7 51           add   r1
000A:D9C8 40           ldw   (r0)
000A:D9C9 4F           not
000A:D9CA D0           inc   r0
000A:D9CB 3D 96        div2
000A:D9CD 3D 96        div2
000A:D9CF 3D 96        div2
000A:D9D1 15 3D 96     div2
000A:D9D4 F0 E0 11     iwt   r0,#11E0
000A:D9D7 54           add   r4
000A:D9D8 B5 30        stw   (r0)
000A:D9DA F0 E2 11     iwt   r0,#11E2
000A:D9DD 51           add   r1
000A:D9DE 40           ldw   (r0)
000A:D9DF 3D 96        div2
000A:D9E1 3D 96        div2
000A:D9E3 3D 96        div2
000A:D9E5 15 3D 96     div2
000A:D9E8 F0 E2 11     iwt   r0,#11E2
000A:D9EB 54           add   r4
000A:D9EC B5 30        stw   (r0)
000A:D9EE A5 0A        ibt   r5,#000A
000A:D9F0 F0 C2 13     iwt   r0,#13C2
000A:D9F3 54           add   r4
000A:D9F4 B5 30        stw   (r0)
000A:D9F6 A5 02        ibt   r5,#0002
000A:D9F8 F0 82 17     iwt   r0,#1782
000A:D9FB 54           add   r4
000A:D9FC B5 30        stw   (r0)
000A:D9FE A5 08        ibt   r5,#0008
000A:DA00 F0 02 15     iwt   r0,#1502
000A:DA03 54           add   r4
000A:DA04 B5 30        stw   (r0)
000A:DA06 F5 00 04     iwt   r5,#0400
000A:DA09 F0 A2 15     iwt   r0,#15A2
000A:DA0C 54           add   r4
000A:DA0D B5 30        stw   (r0)
000A:DA0F A0 04        ibt   r0,#0004
000A:DA11 00           stop
000A:DA12 01           nop

000A:DA13 3D AB 30     lms   r11,(0060)
000A:DA16 FF FA DA     iwt   r15,#DAFA
000A:DA19 01           nop
000A:DA1A 3E A4 24     sms   (0048),r4
000A:DA1D 3E A6 26     sms   (004C),r6
000A:DA20 F0 02 15     iwt   r0,#1502
000A:DA23 51           add   r1
000A:DA24 40           ldw   (r0)
000A:DA25 15 3E 63     sub   #03 				; number of times an egg will ricochet
000A:DA28 0C 36        bcc   DA60
000A:DA2A D0           inc   r0 				; change to 01 to make eggs bounce infinitely
000A:DA2B F0 9E 00     iwt   r0,#009E 			; sound eggs make when they die
000A:DA2E 3E A0 3D     sms   (007A),r0
000A:DA31 A5 0E        ibt   r5,#000E
000A:DA33 F0 C0 0E     iwt   r0,#0EC0 			; change to #0000 to make eggs collectible after the final hit, rather than having them fall away
000A:DA36 51           add   r1
000A:DA37 B5 30        stw   (r0)
000A:DA39 A5 00        ibt   r5,#0000
000A:DA3B F0 F8 1C     iwt   r0,#1CF8
000A:DA3E 51           add   r1
000A:DA3F B5 30        stw   (r0)
000A:DA41 F0 E0 11     iwt   r0,#11E0 			; how far the egg falls away horizontally after the last ricochet
000A:DA44 51           add   r1
000A:DA45 40           ldw   (r0)
000A:DA46 3D 96        div2
000A:DA48 3D 96        div2
000A:DA4A 90           sbk
000A:DA4B F0 E2 11     iwt   r0,#11E2 			; how far the egg falls away vertically after the last ricochet
000A:DA4E 51           add   r1
000A:DA4F 40           ldw   (r0)
000A:DA50 3D 96        div2
000A:DA52 3D 96        div2
000A:DA54 90           sbk
000A:DA55 A5 40        ibt   r5,#0040
000A:DA57 F0 02 15     iwt   r0,#1502
000A:DA5A 51           add   r1
000A:DA5B B5 30        stw   (r0)
000A:DA5D 05 2C        bra   DA8B

000A:DA5F 01           nop

000A:DA60 90           sbk
000A:DA61 F0 20 13     iwt   r0,#1320 			; change to #0000 to make eggs stay green during ricochets
000A:DA64 51           add   r1
000A:DA65 40           ldw   (r0)
000A:DA66 F5 24 00     iwt   r5,#0024
000A:DA69 65           sub   r5
000A:DA6A 0C 1F        bcc   DA8B
000A:DA6C 55           add   r5
000A:DA6D F5 26 00     iwt   r5,#0026
000A:DA70 65           sub   r5
000A:DA71 0D 18        bcs   DA8B
000A:DA73 55           add   r5
000A:DA74 E0           dec   r0
000A:DA75 90           sbk
000A:DA76 2E 15        move  r5,r14
000A:DA78 50           add   r0
000A:DA79 FE 1B 9F     iwt   r14,#9F1B
000A:DA7C 1E 5E        add   r14
000A:DA7E 1E EF        getb
000A:DA80 F0 02 10     iwt   r0,#1002
000A:DA83 51           add   r1
000A:DA84 40           ldw   (r0)
000A:DA85 3F 7E        bic   #0E
000A:DA87 CE           or    r14
000A:DA88 90           sbk
000A:DA89 25 1E        move  r14,r5
000A:DA8B 3E A7 27     sms   (004E),r7
000A:DA8E 3E A8 28     sms   (0050),r8
000A:DA91 3E AE 2E     sms   (005C),r14
000A:DA94 E3           dec   r3
000A:DA95 0A 09        bpl   DAA0
000A:DA97 D3           inc   r3
000A:DA98 F0 C0 13     iwt   r0,#13C0
000A:DA9B 51           add   r1
000A:DA9C 40           ldw   (r0)
000A:DA9D 3F C2        xor   #02
000A:DA9F 90           sbk
000A:DAA0 A0 08        ibt   r0,#0008
000A:DAA2 3F DF        romb
000A:DAA4 3D A0 08     lms   r0,(0010)
000A:DAA7 50           add   r0
000A:DAA8 9E           lob
000A:DAA9 FE 18 AE     iwt   r14,#AE18
000A:DAAC 1E 5E        add   r14
000A:DAAE EF           getb
000A:DAAF 16 4D        swap
000A:DAB1 F0 E0 11     iwt   r0,#11E0
000A:DAB4 51           add   r1
000A:DAB5 14 40        ldw   (r0)
000A:DAB7 B4 9F        fmult
000A:DAB9 17 04        rol
000A:DABB F0 E2 11     iwt   r0,#11E2
000A:DABE 51           add   r1
000A:DABF 15 40        ldw   (r0)
000A:DAC1 B5 9F        fmult
000A:DAC3 18 04        rol
000A:DAC5 A0 40        ibt   r0,#0040
000A:DAC7 1E 5E        add   r14
000A:DAC9 EF           getb
000A:DACA 16 4D        swap
000A:DACC A0 0A        ibt   r0,#000A
000A:DACE 3F DF        romb
000A:DAD0 B5 9F        fmult
000A:DAD2 04           rol
000A:DAD3 57           add   r7
000A:DAD4 15 50        add   r0
000A:DAD6 F0 E0 11     iwt   r0,#11E0
000A:DAD9 51           add   r1
000A:DADA B5 30        stw   (r0)
000A:DADC B4 9F        fmult
000A:DADE 04           rol
000A:DADF 68           sub   r8
000A:DAE0 14 50        add   r0
000A:DAE2 F0 E2 11     iwt   r0,#11E2
000A:DAE5 51           add   r1
000A:DAE6 B4 30        stw   (r0)
000A:DAE8 3D A7 27     lms   r7,(004E)
000A:DAEB 3D A8 28     lms   r8,(0050)
000A:DAEE 3D AE 2E     lms   r14,(005C)
000A:DAF1 A5 01        ibt   r5,#0001
000A:DAF3 F0 C2 18     iwt   r0,#18C2
000A:DAF6 51           add   r1
000A:DAF7 B5 3D 30     stb   (r0)
000A:DAFA 3D A4 24     lms   r4,(0048)
000A:DAFD 3D A6 26     lms   r6,(004C)
000A:DB00 9B           jmp   r11
000A:DB01 01           nop

DATA_0ADB02:         dw $7A02, $7A04, $0000

000A:DB08 A5 00        ibt   r5,#0000
000A:DB0A F0 02 15     iwt   r0,#1502
000A:DB0D 51           add   r1
000A:DB0E B5 30        stw   (r0)
000A:DB10 D5           inc   r5
000A:DB11 F0 C2 18     iwt   r0,#18C2
000A:DB14 51           add   r1
000A:DB15 B5 30        stw   (r0)
000A:DB17 3E A4 24     sms   (0048),r4
000A:DB1A 3E A6 26     sms   (004C),r6
000A:DB1D B6 9E        lob
000A:DB1F 03           lsr
000A:DB20 3D A6 00     lms   r6,(0000)
000A:DB23 0C 07        bcc   DB2C
000A:DB25 50           add   r0
000A:DB26 A5 10        ibt   r5,#0010
000A:DB28 26 65        sub   r5
000A:DB2A B6 90        sbk
000A:DB2C 2E 14        move  r4,r14
000A:DB2E FE 02 DB     iwt   r14,#DB02
000A:DB31 1E 5E        add   r14
000A:DB33 EF           getb
000A:DB34 DE           inc   r14
000A:DB35 15 3D EF     getbh
000A:DB38 24 1E        move  r14,r4
000A:DB3A A0 0E        ibt   r0,#000E
000A:DB3C 00           stop
000A:DB3D 01           nop

000A:DB3E A0 10        ibt   r0,#0010
000A:DB40 56           add   r6
000A:DB41 3E A0 00     sms   (0000),r0
000A:DB44 25 B5        moves r5,r5
000A:DB46 09 09        beq   DB51
000A:DB48 01           nop
000A:DB49 A0 08        ibt   r0,#0008
000A:DB4B 3E A0 3D     sms   (007A),r0
000A:DB4E 05 44        bra   DB94

000A:DB50 D5           inc   r5

000A:DB51 A0 32        ibt   r0,#0032
000A:DB53 3E A0 3D     sms   (007A),r0
000A:DB56 2B 16        move  r6,r11
000A:DB58 F5 0A 02     iwt   r5,#020A
000A:DB5B 94           link  #04
000A:DB5C FF E3 DF     iwt   r15,#DFE3
000A:DB5F 01           nop
000A:DB60 3D A0 00     lms   r0,(0000)
000A:DB63 3F 7F        bic   #0F
000A:DB65 15 3E 68     sub   #08
000A:DB68 F0 A2 10     iwt   r0,#10A2
000A:DB6B 54           add   r4
000A:DB6C B5 30        stw   (r0)
000A:DB6E 3D A0 01     lms   r0,(0002)
000A:DB71 15 3F 7F     bic   #0F
000A:DB74 F0 42 11     iwt   r0,#1142
000A:DB77 54           add   r4
000A:DB78 B5 30        stw   (r0)
000A:DB7A A5 04        ibt   r5,#0004
000A:DB7C F0 C2 13     iwt   r0,#13C2
000A:DB7F 54           add   r4
000A:DB80 B5 30        stw   (r0)
000A:DB82 F0 4C 1E     iwt   r0,#1E4C
000A:DB85 54           add   r4
000A:DB86 B5 30        stw   (r0)
000A:DB88 A5 08        ibt   r5,#0008
000A:DB8A F0 82 17     iwt   r0,#1782
000A:DB8D 54           add   r4
000A:DB8E B5 30        stw   (r0)
000A:DB90 26 1B        move  r11,r6
000A:DB92 A5 00        ibt   r5,#0000
000A:DB94 A0 0E        ibt   r0,#000E
000A:DB96 00           stop
000A:DB97 01           nop

000A:DB98 FF 8B DA     iwt   r15,#DA8B
000A:DB9B 01           nop

DATA_0ADB9C:         dw $7B04, $0000

000A:DBA0 A5 00        ibt   r5,#0000
000A:DBA2 F0 02 15     iwt   r0,#1502
000A:DBA5 51           add   r1
000A:DBA6 B5 30        stw   (r0)
000A:DBA8 D5           inc   r5
000A:DBA9 F0 C2 18     iwt   r0,#18C2
000A:DBAC 51           add   r1
000A:DBAD B5 30        stw   (r0)
000A:DBAF 3E A4 24     sms   (0048),r4
000A:DBB2 3E A6 26     sms   (004C),r6
000A:DBB5 3E A7 27     sms   (004E),r7
000A:DBB8 B6 9E        lob
000A:DBBA 03           lsr
000A:DBBB 3D A7 00     lms   r7,(0000)
000A:DBBE 0C 07        bcc   DBC7
000A:DBC0 01           nop
000A:DBC1 A5 10        ibt   r5,#0010
000A:DBC3 27 65        sub   r5
000A:DBC5 B7 90        sbk
000A:DBC7 03           lsr
000A:DBC8 3D A6 01     lms   r6,(0002)
000A:DBCB 0C 07        bcc   DBD4
000A:DBCD 50           add   r0
000A:DBCE A5 10        ibt   r5,#0010
000A:DBD0 26 65        sub   r5
000A:DBD2 B6 90        sbk
000A:DBD4 2E 14        move  r4,r14
000A:DBD6 FE 9C DB     iwt   r14,#DB9C
000A:DBD9 1E 5E        add   r14
000A:DBDB EF           getb
000A:DBDC DE           inc   r14
000A:DBDD 15 3D EF     getbh
000A:DBE0 24 1E        move  r14,r4
000A:DBE2 25 B5        moves r5,r5
000A:DBE4 08 44        bne   DC2A
000A:DBE6 01           nop
000A:DBE7 A0 0C        ibt   r0,#000C
000A:DBE9 00           stop
000A:DBEA 01           nop

000A:DBEB 3E AB 30     sms   (0060),r11
000A:DBEE A0 48        ibt   r0,#0048
000A:DBF0 3E A0 3D     sms   (007A),r0
000A:DBF3 F5 0C 02     iwt   r5,#020C
000A:DBF6 94           link  #04
000A:DBF7 FF E3 DF     iwt   r15,#DFE3
000A:DBFA 01           nop
000A:DBFB B7 3F 7F     bic   #0F
000A:DBFE 15 3E 58     add   #08
000A:DC01 F0 A2 10     iwt   r0,#10A2
000A:DC04 54           add   r4
000A:DC05 B5 30        stw   (r0)
000A:DC07 B6 3F 7F     bic   #0F
000A:DC0A 15 3E 58     add   #08
000A:DC0D F0 42 11     iwt   r0,#1142
000A:DC10 54           add   r4
000A:DC11 B5 30        stw   (r0)
000A:DC13 A5 0D        ibt   r5,#000D
000A:DC15 F0 C2 13     iwt   r0,#13C2
000A:DC18 54           add   r4
000A:DC19 B5 30        stw   (r0)
000A:DC1B A5 02        ibt   r5,#0002
000A:DC1D F0 82 17     iwt   r0,#1782
000A:DC20 54           add   r4
000A:DC21 B5 30        stw   (r0)
000A:DC23 3D AB 30     lms   r11,(0060)
000A:DC26 FF 8E DA     iwt   r15,#DA8E
000A:DC29 01           nop
000A:DC2A A0 0A        ibt   r0,#000A
000A:DC2C 3E A0 3D     sms   (007A),r0
000A:DC2F A0 0E        ibt   r0,#000E
000A:DC31 00           stop
000A:DC32 01           nop

000A:DC33 A0 10        ibt   r0,#0010
000A:DC35 57           add   r7
000A:DC36 3E A0 00     sms   (0000),r0
000A:DC39 D5           inc   r5
000A:DC3A A0 0E        ibt   r0,#000E
000A:DC3C 00           stop
000A:DC3D 01           nop

000A:DC3E 3E A7 00     sms   (0000),r7
000A:DC41 A0 10        ibt   r0,#0010
000A:DC43 56           add   r6
000A:DC44 3E A0 01     sms   (0002),r0
000A:DC47 D5           inc   r5
000A:DC48 A0 0E        ibt   r0,#000E
000A:DC4A 00           stop
000A:DC4B 01           nop

000A:DC4C A0 10        ibt   r0,#0010
000A:DC4E 57           add   r7
000A:DC4F 3E A0 00     sms   (0000),r0
000A:DC52 D5           inc   r5
000A:DC53 A0 0E        ibt   r0,#000E
000A:DC55 00           stop
000A:DC56 01           nop

000A:DC57 FF 8E DA     iwt   r15,#DA8E
000A:DC5A 01           nop

000A:DC5B A5 01        ibt   r5,#0001
000A:DC5D F0 C2 18     iwt   r0,#18C2
000A:DC60 51           add   r1
000A:DC61 B5 30        stw   (r0)
000A:DC63 A0 04        ibt   r0,#0004
000A:DC65 3E A0 3D     sms   (007A),r0
000A:DC68 3E AB 30     sms   (0060),r11
000A:DC6B 3E A4 24     sms   (0048),r4
000A:DC6E 3E A6 26     sms   (004C),r6
000A:DC71 F5 0B 02     iwt   r5,#020B
000A:DC74 94           link  #04
000A:DC75 FF E3 DF     iwt   r15,#DFE3
000A:DC78 01           nop
000A:DC79 3D A0 00     lms   r0,(0000)
000A:DC7C 15 3F 7F     bic   #0F
000A:DC7F F0 A2 10     iwt   r0,#10A2
000A:DC82 54           add   r4
000A:DC83 B5 30        stw   (r0)
000A:DC85 3D A0 01     lms   r0,(0002)
000A:DC88 15 3F 7F     bic   #0F
000A:DC8B F0 42 11     iwt   r0,#1142
000A:DC8E 54           add   r4
000A:DC8F B5 30        stw   (r0)
000A:DC91 A5 0C        ibt   r5,#000C
000A:DC93 F0 C2 13     iwt   r0,#13C2
000A:DC96 54           add   r4
000A:DC97 B5 30        stw   (r0)
000A:DC99 A5 02        ibt   r5,#0002
000A:DC9B F0 82 17     iwt   r0,#1782
000A:DC9E 54           add   r4
000A:DC9F B5 30        stw   (r0)
000A:DCA1 A0 18        ibt   r0,#0018
000A:DCA3 00           stop
000A:DCA4 01           nop

000A:DCA5 3D AB 30     lms   r11,(0060)
000A:DCA8 FF 20 DA     iwt   r15,#DA20
000A:DCAB 01           nop

000A:DCAC A5 01        ibt   r5,#0001
000A:DCAE F0 C2 18     iwt   r0,#18C2
000A:DCB1 51           add   r1
000A:DCB2 B5 30        stw   (r0)
000A:DCB4 A0 04        ibt   r0,#0004
000A:DCB6 3E A0 3D     sms   (007A),r0
000A:DCB9 3E AB 30     sms   (0060),r11
000A:DCBC 3E A4 24     sms   (0048),r4
000A:DCBF 3E A6 26     sms   (004C),r6
000A:DCC2 F5 90 01     iwt   r5,#0190
000A:DCC5 94           link  #04
000A:DCC6 FF 1C DE     iwt   r15,#DE1C
000A:DCC9 01           nop
000A:DCCA 3D AB 30     lms   r11,(0060)
000A:DCCD 0B 42        bmi   DD11
000A:DCCF 01           nop
000A:DCD0 3D A0 00     lms   r0,(0000)
000A:DCD3 15 3F 7F     bic   #0F
000A:DCD6 F0 E2 10     iwt   r0,#10E2
000A:DCD9 54           add   r4
000A:DCDA B5 30        stw   (r0)
000A:DCDC 3D A0 01     lms   r0,(0002)
000A:DCDF 15 3F 7F     bic   #0F
000A:DCE2 F0 82 11     iwt   r0,#1182
000A:DCE5 54           add   r4
000A:DCE6 B5 30        stw   (r0)
000A:DCE8 A5 02        ibt   r5,#0002
000A:DCEA F0 76 19     iwt   r0,#1976
000A:DCED 54           add   r4
000A:DCEE B5 30        stw   (r0)
000A:DCF0 F0 02 15     iwt   r0,#1502
000A:DCF3 51           add   r1
000A:DCF4 10 40        ldw   (r0)
000A:DCF6 A5 40        ibt   r5,#0040
000A:DCF8 65           sub   r5
000A:DCF9 0D 0E        bcs   DD09
000A:DCFB 55           add   r5
000A:DCFC 15 3E 63     sub   #03
000A:DCFF 0C 03        bcc   DD04
000A:DD01 D0           inc   r0
000A:DD02 A0 40        ibt   r0,#0040
000A:DD04 90           sbk
000A:DD05 FF FA DA     iwt   r15,#DAFA
000A:DD08 01           nop
000A:DD09 A5 30        ibt   r5,#0030
000A:DD0B F0 78 19     iwt   r0,#1978
000A:DD0E 54           add   r4
000A:DD0F B5 30        stw   (r0)
000A:DD11 FF 20 DA     iwt   r15,#DA20
000A:DD14 01           nop
000A:DD15 F0 00 F8     iwt   r0,#F800
000A:DD18 77           and   r7
000A:DD19 F5 00 30     iwt   r5,#3000
000A:DD1C 65           sub   r5
000A:DD1D 09 67        beq   DD86
000A:DD1F 55           add   r5
000A:DD20 F5 00 B0     iwt   r5,#B000
000A:DD23 65           sub   r5
000A:DD24 09 57        beq   DD7D
000A:DD26 55           add   r5
000A:DD27 F5 00 A8     iwt   r5,#A800
000A:DD2A 65           sub   r5
000A:DD2B 08 4E        bne   DD7B
000A:DD2D 01           nop
000A:DD2E F0 B6 1A     iwt   r0,#1AB6
000A:DD31 51           add   r1
000A:DD32 40           ldw   (r0)
000A:DD33 3E 60        sub   #00
000A:DD35 08 44        bne   DD7B
000A:DD37 01           nop
000A:DD38 A5 08        ibt   r5,#0008
000A:DD3A F0 B6 1A     iwt   r0,#1AB6
000A:DD3D 51           add   r1
000A:DD3E B5 30        stw   (r0)
000A:DD40 A0 07        ibt   r0,#0007
000A:DD42 3E A0 3D     sms   (007A),r0
000A:DD45 3E AB 30     sms   (0060),r11
000A:DD48 F5 14 02     iwt   r5,#0214
000A:DD4B 94           link  #04
000A:DD4C FF E3 DF     iwt   r15,#DFE3
000A:DD4F 01           nop
000A:DD50 3D AB 30     lms   r11,(0060)
000A:DD53 3D A0 00     lms   r0,(0000)
000A:DD56 15 3F 7F     bic   #0F
000A:DD59 F0 A2 10     iwt   r0,#10A2
000A:DD5C 54           add   r4
000A:DD5D B5 30        stw   (r0)
000A:DD5F 3D A0 01     lms   r0,(0002)
000A:DD62 15 3F 7F     bic   #0F
000A:DD65 F0 42 11     iwt   r0,#1142
000A:DD68 54           add   r4
000A:DD69 B5 30        stw   (r0)
000A:DD6B A5 0E        ibt   r5,#000E
000A:DD6D F0 C2 13     iwt   r0,#13C2
000A:DD70 54           add   r4
000A:DD71 B5 30        stw   (r0)
000A:DD73 A5 04        ibt   r5,#0004
000A:DD75 F0 82 17     iwt   r0,#1782
000A:DD78 54           add   r4
000A:DD79 B5 30        stw   (r0)
000A:DD7B 9B           jmp   r11
000A:DD7C 01           nop

000A:DD7D 3D F0 08 1E  lm    r0,(1E08)
000A:DD81 3E 78        and   #08
000A:DD83 09 0A        beq   DD8F
000A:DD85 01           nop
000A:DD86 A0 09        ibt   r0,#0009
000A:DD88 3E A0 3D     sms   (007A),r0
000A:DD8B A0 02        ibt   r0,#0002
000A:DD8D 00           stop
000A:DD8E 01           nop

000A:DD8F 9B           jmp   r11
000A:DD90 01           nop

000A:DD91 94           link  #04
000A:DD92 FF 72 D3     iwt   r15,#D372
000A:DD95 2B 94        link  #04
000A:DD97 FF 0D D9     iwt   r15,#D90D
000A:DD9A 01           nop
000A:DD9B FF 7F D0     iwt   r15,#D07F
000A:DD9E D1           inc   r1
000A:DD9F 94           link  #04
000A:DDA0 FF 72 D3     iwt   r15,#D372
000A:DDA3 2B 22 52     add   r2
000A:DDA6 22 52        add   r2
000A:DDA8 F0 E0 11     iwt   r0,#11E0
000A:DDAB 51           add   r1
000A:DDAC 40           ldw   (r0)
000A:DDAD E0           dec   r0
000A:DDAE 0A 18        bpl   DDC8
000A:DDB0 01           nop
000A:DDB1 A3 01        ibt   r3,#0001
000A:DDB3 94           link  #04
000A:DDB4 FF B0 D3     iwt   r15,#D3B0
000A:DDB7 3E F0 E0 11  sm    (11E0),r0
000A:DDBB 51           add   r1
000A:DDBC 40           ldw   (r0)
000A:DDBD 3E 60        sub   #00
000A:DDBF 09 0A        beq   DDCB
000A:DDC1 22 52        add   r2
000A:DDC3 DE           inc   r14
000A:DDC4 DE           inc   r14
000A:DDC5 05 0D        bra   DDD4

000A:DDC7 22 DE        inc   r14
000A:DDC9 DE           inc   r14
000A:DDCA 22 52        add   r2
000A:DDCC A3 FF        ibt   r3,#FFFF
000A:DDCE 94           link  #04
000A:DDCF FF B0 D3     iwt   r15,#D3B0
000A:DDD2 3E 22 52     add   #02
000A:DDD5 94           link  #04
000A:DDD6 FF 52 D3     iwt   r15,#D352
000A:DDD9 2B 22 52     add   r2
000A:DDDC 94           link  #04
000A:DDDD FF 52 D3     iwt   r15,#D352
000A:DDE0 2B B2        moves r11,r2
000A:DDE2 3E 73        and   #03
000A:DDE4 3E 63        sub   #03
000A:DDE6 09 04        beq   DDEC
000A:DDE8 22 3F 73     bic   #03
000A:DDEB 22 03        lsr
000A:DDED B2 03        lsr
000A:DDEF 0C 09        bcc   DDFA
000A:DDF1 01           nop
000A:DDF2 DA           inc   r10
000A:DDF3 F0 E2 11     iwt   r0,#11E2
000A:DDF6 14 51        add   r1
000A:DDF8 60           sub   r0
000A:DDF9 34           stw   (r4)
000A:DDFA 22 52        add   r2
000A:DDFC A3 F0        ibt   r3,#FFF0
000A:DDFE 94           link  #04
000A:DDFF FF B5 D1     iwt   r15,#D1B5
000A:DE02 3E 22 52     add   #02
000A:DE05 A3 F0        ibt   r3,#FFF0
000A:DE07 94           link  #04
000A:DE08 FF B5 D1     iwt   r15,#D1B5
000A:DE0B 3E B2 3E 73  and   #03
000A:DE0F 3E 63        sub   #03
000A:DE11 09 04        beq   DE17
000A:DE13 22 3F 73     bic   #03
000A:DE16 22 03        lsr
000A:DE18 FF 70 D5     iwt   r15,#D570
000A:DE1B B2 3E AC 2C  sms   (0058),r12
000A:DE1F 3E AD 2D     sms   (005A),r13
000A:DE22 F4 5C 0F     iwt   r4,#0F5C
000A:DE25 AC 12        ibt   r12,#0012
000A:DE27 2F 1D        move  r13,r15
000A:DE29 3D 44        ldb   (r4)
000A:DE2B 3E 60        sub   #00
000A:DE2D 09 0E        beq   DE3D
000A:DE2F E4           dec   r4
000A:DE30 E4           dec   r4
000A:DE31 E4           dec   r4
000A:DE32 3C           loop
000A:DE33 E4           dec   r4
000A:DE34 EC           dec   r12
000A:DE35 3D AC 2C     lms   r12,(0058)
000A:DE38 3D AD 2D     lms   r13,(005A)
000A:DE3B 9B           jmp   r11
000A:DE3C 01           nop

000A:DE3D BC 3E 55     add   #05
000A:DE40 50           add   r0
000A:DE41 14 50        add   r0
000A:DE43 AC 10        ibt   r12,#0010
000A:DE45 F0 00 0F     iwt   r0,#0F00
000A:DE48 54           add   r4
000A:DE49 BC 30        stw   (r0)
000A:DE4B FC FF 00     iwt   r12,#00FF
000A:DE4E F0 A0 14     iwt   r0,#14A0
000A:DE51 54           add   r4
000A:DE52 BC 30        stw   (r0)
000A:DE54 AC 00        ibt   r12,#0000
000A:DE56 F0 96 1D     iwt   r0,#1D96
000A:DE59 54           add   r4
000A:DE5A BC 30        stw   (r0)
000A:DE5C F0 20 12     iwt   r0,#1220
000A:DE5F 54           add   r4
000A:DE60 BC 30        stw   (r0)
000A:DE62 F0 22 12     iwt   r0,#1222
000A:DE65 54           add   r4
000A:DE66 BC 30        stw   (r0)
000A:DE68 F0 76 19     iwt   r0,#1976
000A:DE6B 54           add   r4
000A:DE6C BC 30        stw   (r0)
000A:DE6E F0 00 14     iwt   r0,#1400
000A:DE71 54           add   r4
000A:DE72 BC 30        stw   (r0)
000A:DE74 F0 E0 10     iwt   r0,#10E0
000A:DE77 54           add   r4
000A:DE78 BC 30        stw   (r0)
000A:DE7A F0 36 1D     iwt   r0,#1D36
000A:DE7D 54           add   r4
000A:DE7E BC 30        stw   (r0)
000A:DE80 F0 78 19     iwt   r0,#1978
000A:DE83 54           add   r4
000A:DE84 BC 30        stw   (r0)
000A:DE86 F0 D6 19     iwt   r0,#19D6
000A:DE89 54           add   r4
000A:DE8A BC 30        stw   (r0)
000A:DE8C F0 D8 19     iwt   r0,#19D8
000A:DE8F 54           add   r4
000A:DE90 BC 30        stw   (r0)
000A:DE92 F0 36 1A     iwt   r0,#1A36
000A:DE95 54           add   r4
000A:DE96 BC 30        stw   (r0)
000A:DE98 F0 38 1A     iwt   r0,#1A38
000A:DE9B 54           add   r4
000A:DE9C BC 30        stw   (r0)
000A:DE9E F0 96 1A     iwt   r0,#1A96
000A:DEA1 54           add   r4
000A:DEA2 BC 30        stw   (r0)
000A:DEA4 F0 98 1A     iwt   r0,#1A98
000A:DEA7 54           add   r4
000A:DEA8 BC 30        stw   (r0)
000A:DEAA F0 F6 1A     iwt   r0,#1AF6
000A:DEAD 54           add   r4
000A:DEAE BC 30        stw   (r0)
000A:DEB0 F0 F8 1A     iwt   r0,#1AF8
000A:DEB3 54           add   r4
000A:DEB4 BC 30        stw   (r0)
000A:DEB6 F0 02 14     iwt   r0,#1402
000A:DEB9 54           add   r4
000A:DEBA BC 30        stw   (r0)
000A:DEBC F0 60 18     iwt   r0,#1860
000A:DEBF 54           add   r4
000A:DEC0 BC 30        stw   (r0)
000A:DEC2 F0 02 0F     iwt   r0,#0F02
000A:DEC5 54           add   r4
000A:DEC6 BC 30        stw   (r0)
000A:DEC8 F0 38 1D     iwt   r0,#1D38
000A:DECB 54           add   r4
000A:DECC BC 30        stw   (r0)
000A:DECE F0 20 17     iwt   r0,#1720
000A:DED1 54           add   r4
000A:DED2 BC 30        stw   (r0)
000A:DED4 F0 80 16     iwt   r0,#1680
000A:DED7 54           add   r4
000A:DED8 BC 30        stw   (r0)
000A:DEDA F0 82 16     iwt   r0,#1682
000A:DEDD 54           add   r4
000A:DEDE BC 30        stw   (r0)
000A:DEE0 F0 40 15     iwt   r0,#1540
000A:DEE3 54           add   r4
000A:DEE4 BC 30        stw   (r0)
000A:DEE6 F0 E0 15     iwt   r0,#15E0
000A:DEE9 54           add   r4
000A:DEEA BC 30        stw   (r0)
000A:DEEC F0 C0 17     iwt   r0,#17C0
000A:DEEF 54           add   r4
000A:DEF0 BC 30        stw   (r0)
000A:DEF2 EC           dec   r12
000A:DEF3 F0 62 13     iwt   r0,#1362
000A:DEF6 54           add   r4
000A:DEF7 BC 30        stw   (r0)
000A:DEF9 F0 22 17     iwt   r0,#1722
000A:DEFC 54           add   r4
000A:DEFD BC 30        stw   (r0)
000A:DEFF FC FF 1F     iwt   r12,#1FFF
000A:DF02 F0 62 18     iwt   r0,#1862
000A:DF05 54           add   r4
000A:DF06 BC 30        stw   (r0)
000A:DF08 F0 60 13     iwt   r0,#1360
000A:DF0B 54           add   r4
000A:DF0C B5 30        stw   (r0)
000A:DF0E B5 1C 55     add   r5
000A:DF11 3E AE 2E     sms   (005C),r14
000A:DF14 F0 16 A7     iwt   r0,#A716
000A:DF17 1E 5C        add   r12
000A:DF19 1D EF        getb
000A:DF1B F5 BB 0E     iwt   r5,#0EBB
000A:DF1E AE 06        ibt   r14,#0006
000A:DF20 3D 45        ldb   (r5)
000A:DF22 6D           sub   r13
000A:DF23 09 08        beq   DF2D
000A:DF25 EE           dec   r14
000A:DF26 08 F8        bne   DF20
000A:DF28 E5           dec   r5
000A:DF29 15           to    r5
000A:DF2A 05 07        bra   DF33

000A:DF2C 60           sub   r0

000A:DF2D BE 3E 58     add   #08
000A:DF30 50           add   r0
000A:DF31 15 50        add   r0
000A:DF33 F0 80 11     iwt   r0,#1180
000A:DF36 54           add   r4
000A:DF37 B5 30        stw   (r0)
000A:DF39 F0 1A 9F     iwt   r0,#9F1A
000A:DF3C 1E 5C        add   r12
000A:DF3E 15 EF        getb
000A:DF40 DE           inc   r14
000A:DF41 F0 A2 14     iwt   r0,#14A2
000A:DF44 54           add   r4
000A:DF45 B5 30        stw   (r0)
000A:DF47 EF           getb
000A:DF48 A5 20        ibt   r5,#0020
000A:DF4A 15 3D C5     xor   r5
000A:DF4D F0 42 10     iwt   r0,#1042
000A:DF50 54           add   r4
000A:DF51 B5 30        stw   (r0)
000A:DF53 F0 18 A3     iwt   r0,#A318
000A:DF56 1E 5C        add   r12
000A:DF58 15 3F EF     getbs
000A:DF5B DE           inc   r14
000A:DF5C F0 42 15     iwt   r0,#1542
000A:DF5F 54           add   r4
000A:DF60 B5 30        stw   (r0)
000A:DF62 3F EF        getbs
000A:DF64 3E 88        mult  #08
000A:DF66 15 50        add   r0
000A:DF68 F0 E2 15     iwt   r0,#15E2
000A:DF6B 54           add   r4
000A:DF6C B5 30        stw   (r0)
000A:DF6E F0 1E 97     iwt   r0,#971E
000A:DF71 1E 5C        add   r12
000A:DF73 EF           getb
000A:DF74 DE           inc   r14
000A:DF75 15 3D EF     getbh
000A:DF78 F0 A2 0F     iwt   r0,#0FA2
000A:DF7B 54           add   r4
000A:DF7C B5 30        stw   (r0)
000A:DF7E F0 1C 9B     iwt   r0,#9B1C
000A:DF81 1E 5C        add   r12
000A:DF83 EF           getb
000A:DF84 DE           inc   r14
000A:DF85 15 3D EF     getbh
000A:DF88 F0 40 10     iwt   r0,#1040
000A:DF8B 54           add   r4
000A:DF8C B5 30        stw   (r0)
000A:DF8E F0 20 93     iwt   r0,#9320
000A:DF91 1E 5C        add   r12
000A:DF93 EF           getb
000A:DF94 DE           inc   r14
000A:DF95 15 3D EF     getbh
000A:DF98 F0 A0 0F     iwt   r0,#0FA0
000A:DF9B 54           add   r4
000A:DF9C B5 30        stw   (r0)
000A:DF9E A0 1F        ibt   r0,#001F
000A:DFA0 75           and   r5
000A:DFA1 50           add   r0
000A:DFA2 50           add   r0
000A:DFA3 50           add   r0
000A:DFA4 FE 20 92     iwt   r14,#9220
000A:DFA7 1E 5E        add   r14
000A:DFA9 EF           getb
000A:DFAA DE           inc   r14
000A:DFAB 15 3D EF     getbh
000A:DFAE DE           inc   r14
000A:DFAF F0 56 1B     iwt   r0,#1B56
000A:DFB2 54           add   r4
000A:DFB3 B5 30        stw   (r0)
000A:DFB5 EF           getb
000A:DFB6 DE           inc   r14
000A:DFB7 15 3D EF     getbh
000A:DFBA DE           inc   r14
000A:DFBB F0 58 1B     iwt   r0,#1B58
000A:DFBE 54           add   r4
000A:DFBF B5 30        stw   (r0)
000A:DFC1 EF           getb
000A:DFC2 DE           inc   r14
000A:DFC3 15 3D EF     getbh
000A:DFC6 DE           inc   r14
000A:DFC7 F0 B6 1B     iwt   r0,#1BB6
000A:DFCA 54           add   r4
000A:DFCB B5 30        stw   (r0)
000A:DFCD EF           getb
000A:DFCE DE           inc   r14
000A:DFCF 15 3D EF     getbh
000A:DFD2 F0 B8 1B     iwt   r0,#1BB8
000A:DFD5 54           add   r4
000A:DFD6 B5 30        stw   (r0)
000A:DFD8 3D AE 2E     lms   r14,(005C)
000A:DFDB 3D AC 2C     lms   r12,(0058)
000A:DFDE 3D AD 2D     lms   r13,(005A)
000A:DFE1 9B           jmp   r11
000A:DFE2 60           sub   r0

000A:DFE3 3E AC 2C     sms   (0058),r12
000A:DFE6 3E AD 2D     sms   (005A),r13
000A:DFE9 F4 FC 0E     iwt   r4,#0EFC
000A:DFEC AC 10        ibt   r12,#0010
000A:DFEE 2F 1D        move  r13,r15
000A:DFF0 3D 44        ldb   (r4)
000A:DFF2 3E 60        sub   #00
000A:DFF4 09 17        beq   E00D
000A:DFF6 E4           dec   r4
000A:DFF7 E4           dec   r4
000A:DFF8 E4           dec   r4
000A:DFF9 3C           loop
000A:DFFA E4           dec   r4
000A:DFFB 3D F0 4A 1E  lm    r0,(1E4A)
000A:DFFF E0           dec   r0
000A:E000 E0           dec   r0
000A:E001 E0           dec   r0
000A:E002 E0           dec   r0
000A:E003 0A 03        bpl   E008
000A:E005 01           nop
000A:E006 A0 3C        ibt   r0,#003C
000A:E008 90           sbk
000A:E009 03           lsr
000A:E00A 1C 03        lsr
000A:E00C DC           inc   r12
000A:E00D EC           dec   r12
000A:E00E BC 5C        add   r12
000A:E010 14 50        add   r0
000A:E012 AC 0E        ibt   r12,#000E
000A:E014 F0 C0 0E     iwt   r0,#0EC0
000A:E017 54           add   r4
000A:E018 BC 30        stw   (r0)
000A:E01A FC FF 00     iwt   r12,#00FF
000A:E01D F0 60 14     iwt   r0,#1460
000A:E020 54           add   r4
000A:E021 BC 30        stw   (r0)
000A:E023 AC 00        ibt   r12,#0000
000A:E025 F0 E0 11     iwt   r0,#11E0
000A:E028 54           add   r4
000A:E029 BC 30        stw   (r0)
000A:E02B F0 E2 11     iwt   r0,#11E2
000A:E02E 54           add   r4
000A:E02F BC 30        stw   (r0)
000A:E031 F0 C0 13     iwt   r0,#13C0
000A:E034 54           add   r4
000A:E035 BC 30        stw   (r0)
000A:E037 F0 A0 10     iwt   r0,#10A0
000A:E03A 54           add   r4
000A:E03B BC 30        stw   (r0)
000A:E03D F0 4C 1E     iwt   r0,#1E4C
000A:E040 54           add   r4
000A:E041 BC 30        stw   (r0)
000A:E043 F0 4E 1E     iwt   r0,#1E4E
000A:E046 54           add   r4
000A:E047 BC 30        stw   (r0)
000A:E049 F0 8C 1E     iwt   r0,#1E8C
000A:E04C 54           add   r4
000A:E04D BC 30        stw   (r0)
000A:E04F F0 82 17     iwt   r0,#1782
000A:E052 54           add   r4
000A:E053 BC 30        stw   (r0)
000A:E055 F0 8E 1E     iwt   r0,#1E8E
000A:E058 54           add   r4
000A:E059 BC 30        stw   (r0)
000A:E05B F0 C2 13     iwt   r0,#13C2
000A:E05E 54           add   r4
000A:E05F BC 30        stw   (r0)
000A:E061 F0 20 18     iwt   r0,#1820
000A:E064 54           add   r4
000A:E065 BC 30        stw   (r0)
000A:E067 F0 C2 0E     iwt   r0,#0EC2
000A:E06A 54           add   r4
000A:E06B BC 30        stw   (r0)
000A:E06D F0 E0 16     iwt   r0,#16E0
000A:E070 54           add   r4
000A:E071 BC 30        stw   (r0)
000A:E073 F0 40 16     iwt   r0,#1640
000A:E076 54           add   r4
000A:E077 BC 30        stw   (r0)
000A:E079 F0 42 16     iwt   r0,#1642
000A:E07C 54           add   r4
000A:E07D BC 30        stw   (r0)
000A:E07F F0 00 15     iwt   r0,#1500
000A:E082 54           add   r4
000A:E083 BC 30        stw   (r0)
000A:E085 F0 A0 15     iwt   r0,#15A0
000A:E088 54           add   r4
000A:E089 BC 30        stw   (r0)
000A:E08B F0 80 17     iwt   r0,#1780
000A:E08E 54           add   r4
000A:E08F BC 30        stw   (r0)
000A:E091 EC           dec   r12
000A:E092 F0 22 13     iwt   r0,#1322
000A:E095 54           add   r4
000A:E096 BC 30        stw   (r0)
000A:E098 F0 E2 16     iwt   r0,#16E2
000A:E09B 54           add   r4
000A:E09C BC 30        stw   (r0)
000A:E09E FC FF 1F     iwt   r12,#1FFF
000A:E0A1 F0 22 18     iwt   r0,#1822
000A:E0A4 54           add   r4
000A:E0A5 BC 30        stw   (r0)
000A:E0A7 F0 20 13     iwt   r0,#1320
000A:E0AA 54           add   r4
000A:E0AB B5 30        stw   (r0)
000A:E0AD B5 1C 55     add   r5
000A:E0B0 3E AE 2E     sms   (005C),r14
000A:E0B3 F0 9E B5     iwt   r0,#B59E
000A:E0B6 1E 5C        add   r12
000A:E0B8 1D EF        getb
000A:E0BA F5 BB 0E     iwt   r5,#0EBB
000A:E0BD AE 06        ibt   r14,#0006
000A:E0BF 3D 45        ldb   (r5)
000A:E0C1 6D           sub   r13
000A:E0C2 09 08        beq   E0CC
000A:E0C4 EE           dec   r14
000A:E0C5 08 F8        bne   E0BF
000A:E0C7 E5           dec   r5
000A:E0C8 15           to    r5
000A:E0C9 05 07        bra   E0D2

000A:E0CB 60           sub   r0

000A:E0CC BE 3E 58     add   #08
000A:E0CF 50           add   r0
000A:E0D0 15 50        add   r0
000A:E0D2 F0 40 11     iwt   r0,#1140
000A:E0D5 54           add   r4
000A:E0D6 B5 30        stw   (r0)
000A:E0D8 F0 9E B1     iwt   r0,#B19E
000A:E0DB 1E 5C        add   r12
000A:E0DD 15 EF        getb
000A:E0DF DE           inc   r14
000A:E0E0 F0 62 14     iwt   r0,#1462
000A:E0E3 54           add   r4
000A:E0E4 B5 30        stw   (r0)
000A:E0E6 EF           getb
000A:E0E7 A5 30        ibt   r5,#0030
000A:E0E9 15 3D C5     xor   r5
000A:E0EC F0 02 10     iwt   r0,#1002
000A:E0EF 54           add   r4
000A:E0F0 B5 30        stw   (r0)
000A:E0F2 F0 9E B3     iwt   r0,#B39E
000A:E0F5 1E 5C        add   r12
000A:E0F7 15 3F EF     getbs
000A:E0FA DE           inc   r14
000A:E0FB F0 02 15     iwt   r0,#1502
000A:E0FE 54           add   r4
000A:E0FF B5 30        stw   (r0)
000A:E101 3F EF        getbs
000A:E103 3E 88        mult  #08
000A:E105 15 50        add   r0
000A:E107 F0 A2 15     iwt   r0,#15A2
000A:E10A 54           add   r4
000A:E10B B5 30        stw   (r0)
000A:E10D F0 9E AB     iwt   r0,#AB9E
000A:E110 1E 5C        add   r12
000A:E112 EF           getb
000A:E113 DE           inc   r14
000A:E114 15 3D EF     getbh
000A:E117 F0 60 0F     iwt   r0,#0F60
000A:E11A 54           add   r4
000A:E11B B5 30        stw   (r0)
000A:E11D F0 9E AD     iwt   r0,#AD9E
000A:E120 1E 5C        add   r12
000A:E122 EF           getb
000A:E123 DE           inc   r14
000A:E124 15 3D EF     getbh
000A:E127 F0 62 0F     iwt   r0,#0F62
000A:E12A 54           add   r4
000A:E12B B5 30        stw   (r0)
000A:E12D F0 9E AF     iwt   r0,#AF9E
000A:E130 1E 5C        add   r12
000A:E132 EF           getb
000A:E133 DE           inc   r14
000A:E134 15 3D EF     getbh
000A:E137 F0 00 10     iwt   r0,#1000
000A:E13A 54           add   r4
000A:E13B B5 30        stw   (r0)
000A:E13D 3D AE 2E     lms   r14,(005C)
000A:E140 3D AC 2C     lms   r12,(0058)
000A:E143 3D AD 2D     lms   r13,(005A)
000A:E146 9B           jmp   r11
000A:E147 01           nop

000A:E148 94           link  #04
000A:E149 FF 72 D3     iwt   r15,#D372
000A:E14C 2B 3D F3 CA+ lm    r3,(29CA)
000A:E151 F0 C2 18     iwt   r0,#18C2
000A:E154 51           add   r1
000A:E155 B3 30        stw   (r0)
000A:E157 3D A0 00     lms   r0,(0000)
000A:E15A 33           stw   (r3)
000A:E15B D3           inc   r3
000A:E15C D3           inc   r3
000A:E15D 3D A0 01     lms   r0,(0002)
000A:E160 33           stw   (r3)
000A:E161 D3           inc   r3
000A:E162 D3           inc   r3
000A:E163 B7 33        stw   (r3)
000A:E165 D3           inc   r3
000A:E166 D3           inc   r3
000A:E167 B6 33        stw   (r3)
000A:E169 D3           inc   r3
000A:E16A D3           inc   r3
000A:E16B 3E F3 CA 29  sm    (29CA),r3
000A:E16F 22 52        add   r2
000A:E171 22 52        add   r2
000A:E173 94           link  #04
000A:E174 FF 52 D3     iwt   r15,#D352
000A:E177 2B 3D F3 CA+ lm    r3,(29CA)
000A:E17C 3D A0 00     lms   r0,(0000)
000A:E17F 33           stw   (r3)
000A:E180 D3           inc   r3
000A:E181 D3           inc   r3
000A:E182 3D A0 01     lms   r0,(0002)
000A:E185 33           stw   (r3)
000A:E186 D3           inc   r3
000A:E187 D3           inc   r3
000A:E188 B7 33        stw   (r3)
000A:E18A D3           inc   r3
000A:E18B D3           inc   r3
000A:E18C B6 33        stw   (r3)
000A:E18E D3           inc   r3
000A:E18F D3           inc   r3
000A:E190 3E F3 CA 29  sm    (29CA),r3
000A:E194 22 52        add   r2
000A:E196 94           link  #04
000A:E197 FF 52 D3     iwt   r15,#D352
000A:E19A 2B 3D F3 CA+ lm    r3,(29CA)
000A:E19F 3D A0 00     lms   r0,(0000)
000A:E1A2 33           stw   (r3)
000A:E1A3 D3           inc   r3
000A:E1A4 D3           inc   r3
000A:E1A5 3D A0 01     lms   r0,(0002)
000A:E1A8 33           stw   (r3)
000A:E1A9 D3           inc   r3
000A:E1AA D3           inc   r3
000A:E1AB B7 33        stw   (r3)
000A:E1AD D3           inc   r3
000A:E1AE D3           inc   r3
000A:E1AF B6 33        stw   (r3)
000A:E1B1 D3           inc   r3
000A:E1B2 D3           inc   r3
000A:E1B3 3E F3 CA 29  sm    (29CA),r3
000A:E1B7 22 52        add   r2
000A:E1B9 F0 E0 11     iwt   r0,#11E0
000A:E1BC 14 51        add   r1
000A:E1BE 17 44        ldw   (r4)
000A:E1C0 B2 3E 76     and   #06
000A:E1C3 09 46        beq   E20B
000A:E1C5 01           nop
000A:E1C6 A3 01        ibt   r3,#0001
000A:E1C8 3E 64        sub   #04
000A:E1CA 0A 03        bpl   E1CF
000A:E1CC 01           nop
000A:E1CD A3 FF        ibt   r3,#FFFF
000A:E1CF 3D C7        xor   r7
000A:E1D1 0A 38        bpl   E20B
000A:E1D3 01           nop
000A:E1D4 29 53        add   r3
000A:E1D6 F0 62 0F     iwt   r0,#0F62
000A:E1D9 51           add   r1
000A:E1DA 15 40        ldw   (r0)
000A:E1DC F0 C0 00     iwt   r0,#00C0
000A:E1DF 75           and   r5
000A:E1E0 09 29        beq   E20B
000A:E1E2 D2           inc   r2
000A:E1E3 4D           swap
000A:E1E4 0B 24        bmi   E20A
000A:E1E6 60           sub   r0
000A:E1E7 44           ldw   (r4)
000A:E1E8 1B 3D C3     xor   r3
000A:E1EB 0A 1E        bpl   E20B
000A:E1ED 4F           not
000A:E1EE 25 4D        swap
000A:E1F0 25 3E 74     and   #04
000A:E1F3 09 02        beq   E1F7
000A:E1F5 D0           inc   r0
000A:E1F6 60           sub   r0
000A:E1F7 90           sbk
000A:E1F8 F0 C0 13     iwt   r0,#13C0
000A:E1FB 51           add   r1
000A:E1FC 40           ldw   (r0)
000A:E1FD 3F C2        xor   #02
000A:E1FF 90           sbk
000A:E200 F0 A0 15     iwt   r0,#15A0
000A:E203 51           add   r1
000A:E204 40           ldw   (r0)
000A:E205 4F           not
000A:E206 D0           inc   r0
000A:E207 05 02        bra   E20B

000A:E209 90           sbk

000A:E20A 34           stw   (r4)
000A:E20B FF 84 E2     iwt   r15,#E284
000A:E20E 01           nop
000A:E20F 94           link  #04
000A:E210 FF 72 D3     iwt   r15,#D372
000A:E213 2B 3D F3 CA+ lm    r3,(29CA)
000A:E218 F0 C2 18     iwt   r0,#18C2
000A:E21B 51           add   r1
000A:E21C B3 30        stw   (r0)
000A:E21E 3D A0 00     lms   r0,(0000)
000A:E221 33           stw   (r3)
000A:E222 D3           inc   r3
000A:E223 D3           inc   r3
000A:E224 3D A0 01     lms   r0,(0002)
000A:E227 33           stw   (r3)
000A:E228 D3           inc   r3
000A:E229 D3           inc   r3
000A:E22A B7 33        stw   (r3)
000A:E22C D3           inc   r3
000A:E22D D3           inc   r3
000A:E22E B6 33        stw   (r3)
000A:E230 D3           inc   r3
000A:E231 D3           inc   r3
000A:E232 3E F3 CA 29  sm    (29CA),r3
000A:E236 22 52        add   r2
000A:E238 22 52        add   r2
000A:E23A A3 01        ibt   r3,#0001
000A:E23C 94           link  #04
000A:E23D FF B0 D3     iwt   r15,#D3B0
000A:E240 3E 3D F3 CA+ lm    r3,(29CA)
000A:E245 3D A0 00     lms   r0,(0000)
000A:E248 33           stw   (r3)
000A:E249 D3           inc   r3
000A:E24A D3           inc   r3
000A:E24B 3D A0 01     lms   r0,(0002)
000A:E24E 33           stw   (r3)
000A:E24F D3           inc   r3
000A:E250 D3           inc   r3
000A:E251 B7 33        stw   (r3)
000A:E253 D3           inc   r3
000A:E254 D3           inc   r3
000A:E255 B6 33        stw   (r3)
000A:E257 D3           inc   r3
000A:E258 D3           inc   r3
000A:E259 3E F3 CA 29  sm    (29CA),r3
000A:E25D 22 52        add   r2
000A:E25F A3 FF        ibt   r3,#FFFF
000A:E261 94           link  #04
000A:E262 FF B0 D3     iwt   r15,#D3B0
000A:E265 3E 3D F3 CA+ lm    r3,(29CA)
000A:E26A 3D A0 00     lms   r0,(0000)
000A:E26D 33           stw   (r3)
000A:E26E D3           inc   r3
000A:E26F D3           inc   r3
000A:E270 3D A0 01     lms   r0,(0002)
000A:E273 33           stw   (r3)
000A:E274 D3           inc   r3
000A:E275 D3           inc   r3
000A:E276 B7 33        stw   (r3)
000A:E278 D3           inc   r3
000A:E279 D3           inc   r3
000A:E27A B6 33        stw   (r3)
000A:E27C D3           inc   r3
000A:E27D D3           inc   r3
000A:E27E 3E F3 CA 29  sm    (29CA),r3
000A:E282 22 52        add   r2
000A:E284 A3 10        ibt   r3,#0010
000A:E286 94           link  #04
000A:E287 FF B5 D1     iwt   r15,#D1B5
000A:E28A 3E 3D F3 CA+ lm    r3,(29CA)
000A:E28F 3D A0 00     lms   r0,(0000)
000A:E292 33           stw   (r3)
000A:E293 D3           inc   r3
000A:E294 D3           inc   r3
000A:E295 3D A0 01     lms   r0,(0002)
000A:E298 33           stw   (r3)
000A:E299 D3           inc   r3
000A:E29A D3           inc   r3
000A:E29B B7 33        stw   (r3)
000A:E29D D3           inc   r3
000A:E29E D3           inc   r3
000A:E29F B6 33        stw   (r3)
000A:E2A1 D3           inc   r3
000A:E2A2 D3           inc   r3
000A:E2A3 3E F3 CA 29  sm    (29CA),r3
000A:E2A7 B2 03        lsr
000A:E2A9 0C 09        bcc   E2B4
000A:E2AB 01           nop
000A:E2AC DA           inc   r10
000A:E2AD F0 E2 11     iwt   r0,#11E2
000A:E2B0 14 51        add   r1
000A:E2B2 60           sub   r0
000A:E2B3 34           stw   (r4)
000A:E2B4 22 52        add   r2
000A:E2B6 A3 F0        ibt   r3,#FFF0
000A:E2B8 94           link  #04
000A:E2B9 FF B5 D1     iwt   r15,#D1B5
000A:E2BC 3E 3D F3 CA+ lm    r3,(29CA)
000A:E2C1 3D A0 00     lms   r0,(0000)
000A:E2C4 33           stw   (r3)
000A:E2C5 D3           inc   r3
000A:E2C6 D3           inc   r3
000A:E2C7 3D A0 01     lms   r0,(0002)
000A:E2CA 33           stw   (r3)
000A:E2CB D3           inc   r3
000A:E2CC D3           inc   r3
000A:E2CD B7 33        stw   (r3)
000A:E2CF D3           inc   r3
000A:E2D0 D3           inc   r3
000A:E2D1 B6 33        stw   (r3)
000A:E2D3 D3           inc   r3
000A:E2D4 D3           inc   r3
000A:E2D5 3E F3 CA 29  sm    (29CA),r3
000A:E2D9 B2 03        lsr
000A:E2DB 0D 51        bcs   E32E
000A:E2DD 01           nop
000A:E2DE F0 20 18     iwt   r0,#1820
000A:E2E1 51           add   r1
000A:E2E2 40           ldw   (r0)
000A:E2E3 03           lsr
000A:E2E4 0C 7F        bcc   E365
000A:E2E6 01           nop
000A:E2E7 F0 63 0F     iwt   r0,#0F63
000A:E2EA 51           add   r1
000A:E2EB 16 3D 40     ldb   (r0)
000A:E2EE B6 3E 73     and   #03
000A:E2F1 09 72        beq   E365
000A:E2F3 03           lsr
000A:E2F4 F5 E0 11     iwt   r5,#11E0
000A:E2F7 25 51        add   r1
000A:E2F9 15 45        ldw   (r5)
000A:E2FB 25 4F        not
000A:E2FD 03           lsr
000A:E2FE 0D 21        bcs   E321
000A:E300 D5           inc   r5
000A:E301 B6 3E 74     and   #04
000A:E304 08 02        bne   E308
000A:E306 60           sub   r0
000A:E307 B5 90        sbk
000A:E309 A6 00        ibt   r6,#0000
000A:E30B F0 A1 10     iwt   r0,#10A1
000A:E30E 51           add   r1
000A:E30F B6 3D 30     stb   (r0)
000A:E312 F0 C0 13     iwt   r0,#13C0
000A:E315 51           add   r1
000A:E316 40           ldw   (r0)
000A:E317 3F C2        xor   #02
000A:E319 90           sbk
000A:E31A F0 A0 15     iwt   r0,#15A0
000A:E31D 51           add   r1
000A:E31E 40           ldw   (r0)
000A:E31F 4F           not
000A:E320 D0           inc   r0
000A:E321 90           sbk
000A:E322 F0 2E 27     iwt   r0,#272E
000A:E325 51           add   r1
000A:E326 19 40        ldw   (r0)
000A:E328 D0           inc   r0
000A:E329 D0           inc   r0
000A:E32A 1A           to    r10
000A:E32B 05 16        bra   E343

000A:E32D 40           ldw   (r0)

000A:E32E 2A 54        add   r4
000A:E330 A6 FF        ibt   r6,#FFFF
000A:E332 F0 41 11     iwt   r0,#1141
000A:E335 51           add   r1
000A:E336 B6 3D 30     stb   (r0)
000A:E339 F0 2E 27     iwt   r0,#272E
000A:E33C 51           add   r1
000A:E33D B9 30        stw   (r0)
000A:E33F D0           inc   r0
000A:E340 D0           inc   r0
000A:E341 BA 30        stw   (r0)
000A:E343 3D A6 08     lms   r6,(0010)
000A:E346 F0 C2 0E     iwt   r0,#0EC2
000A:E349 51           add   r1
000A:E34A B6 3D 30     stb   (r0)
000A:E34D 60           sub   r0
000A:E34E 3E A0 08     sms   (0010),r0
000A:E351 F0 62 0F     iwt   r0,#0F62
000A:E354 51           add   r1
000A:E355 40           ldw   (r0)
000A:E356 A6 20        ibt   r6,#0020
000A:E358 76           and   r6
000A:E359 08 0A        bne   E365
000A:E35B 01           nop
000A:E35C F0 E2 11     iwt   r0,#11E2
000A:E35F 14 51        add   r1
000A:E361 F0 00 01     iwt   r0,#0100
000A:E364 34           stw   (r4)
000A:E365 3D A5 08     lms   r5,(0010)
000A:E368 F0 8E 26     iwt   r0,#268E
000A:E36B 51           add   r1
000A:E36C B5 30        stw   (r0)
000A:E36E F0 A2 10     iwt   r0,#10A2
000A:E371 51           add   r1
000A:E372 B9 30        stw   (r0)
000A:E374 F0 E0 16     iwt   r0,#16E0
000A:E377 51           add   r1
000A:E378 40           ldw   (r0)
000A:E379 2A 60        sub   r0
000A:E37B F0 42 11     iwt   r0,#1142
000A:E37E 51           add   r1
000A:E37F BA 30        stw   (r0)
000A:E381 FF 7F D0     iwt   r15,#D07F
000A:E384 D1           inc   r1
000A:E385 94           link  #04
000A:E386 FF 62 D3     iwt   r15,#D362
000A:E389 2B 2B 13     move  r3,r11
000A:E38C 94           link  #04
000A:E38D FF 01 D4     iwt   r15,#D401
000A:E390 A0 23        ibt   r0,#0023
000A:E392 1B 3D F3 CA+ lm    r3,(29CA)
000A:E397 F0 C2 18     iwt   r0,#18C2
000A:E39A 51           add   r1
000A:E39B B3 30        stw   (r0)
000A:E39D 3D A0 00     lms   r0,(0000)
000A:E3A0 33           stw   (r3)
000A:E3A1 D3           inc   r3
000A:E3A2 D3           inc   r3
000A:E3A3 3D A0 01     lms   r0,(0002)
000A:E3A6 33           stw   (r3)
000A:E3A7 D3           inc   r3
000A:E3A8 D3           inc   r3
000A:E3A9 B7 33        stw   (r3)
000A:E3AB D3           inc   r3
000A:E3AC D3           inc   r3
000A:E3AD B6 33        stw   (r3)
000A:E3AF D3           inc   r3
000A:E3B0 D3           inc   r3
000A:E3B1 3E F3 CA 29  sm    (29CA),r3
000A:E3B5 22 52        add   r2
000A:E3B7 22 52        add   r2
000A:E3B9 94           link  #04
000A:E3BA FF 62 D3     iwt   r15,#D362
000A:E3BD 2B 3D F3 CA+ lm    r3,(29CA)
000A:E3C2 05 10        bra   E3D4

000A:E3C4 01           nop

000A:E3C5 94           link  #04
000A:E3C6 FF 62 D3     iwt   r15,#D362
000A:E3C9 2B 3D F3 CA+ lm    r3,(29CA)
000A:E3CE F0 C2 18     iwt   r0,#18C2
000A:E3D1 51           add   r1
000A:E3D2 B3 30        stw   (r0)
000A:E3D4 3D A0 00     lms   r0,(0000)
000A:E3D7 33           stw   (r3)
000A:E3D8 D3           inc   r3
000A:E3D9 D3           inc   r3
000A:E3DA 3D A0 01     lms   r0,(0002)
000A:E3DD 33           stw   (r3)
000A:E3DE D3           inc   r3
000A:E3DF D3           inc   r3
000A:E3E0 B7 33        stw   (r3)
000A:E3E2 D3           inc   r3
000A:E3E3 D3           inc   r3
000A:E3E4 B6 33        stw   (r3)
000A:E3E6 D3           inc   r3
000A:E3E7 D3           inc   r3
000A:E3E8 3E F3 CA 29  sm    (29CA),r3
000A:E3EC 22 52        add   r2
000A:E3EE 94           link  #04
000A:E3EF FF 62 D3     iwt   r15,#D362
000A:E3F2 2B 3D F3 CA+ lm    r3,(29CA)
000A:E3F7 3D A0 00     lms   r0,(0000)
000A:E3FA 33           stw   (r3)
000A:E3FB D3           inc   r3
000A:E3FC D3           inc   r3
000A:E3FD 3D A0 01     lms   r0,(0002)
000A:E400 33           stw   (r3)
000A:E401 D3           inc   r3
000A:E402 D3           inc   r3
000A:E403 B7 33        stw   (r3)
000A:E405 D3           inc   r3
000A:E406 D3           inc   r3
000A:E407 B6 33        stw   (r3)
000A:E409 D3           inc   r3
000A:E40A D3           inc   r3
000A:E40B 3E F3 CA 29  sm    (29CA),r3
000A:E40F 22 52        add   r2
000A:E411 94           link  #04
000A:E412 FF 62 D3     iwt   r15,#D362
000A:E415 2B 3D F3 CA+ lm    r3,(29CA)
000A:E41A 3D A0 00     lms   r0,(0000)
000A:E41D 33           stw   (r3)
000A:E41E D3           inc   r3
000A:E41F D3           inc   r3
000A:E420 3D A0 01     lms   r0,(0002)
000A:E423 33           stw   (r3)
000A:E424 D3           inc   r3
000A:E425 D3           inc   r3
000A:E426 B7 33        stw   (r3)
000A:E428 D3           inc   r3
000A:E429 D3           inc   r3
000A:E42A B6 33        stw   (r3)
000A:E42C D3           inc   r3
000A:E42D D3           inc   r3
000A:E42E 3E F3 CA 29  sm    (29CA),r3
000A:E432 22 52        add   r2
000A:E434 94           link  #04
000A:E435 FF 62 D3     iwt   r15,#D362
000A:E438 2B 3D F3 CA+ lm    r3,(29CA)
000A:E43D 3D A0 00     lms   r0,(0000)
000A:E440 33           stw   (r3)
000A:E441 D3           inc   r3
000A:E442 D3           inc   r3
000A:E443 3D A0 01     lms   r0,(0002)
000A:E446 33           stw   (r3)
000A:E447 D3           inc   r3
000A:E448 D3           inc   r3
000A:E449 B7 33        stw   (r3)
000A:E44B D3           inc   r3
000A:E44C D3           inc   r3
000A:E44D B6 33        stw   (r3)
000A:E44F D3           inc   r3
000A:E450 D3           inc   r3
000A:E451 3E F3 CA 29  sm    (29CA),r3
000A:E455 FF 7F D0     iwt   r15,#D07F
000A:E458 D1           inc   r1
000A:E459 94           link  #04
000A:E45A FF 72 D3     iwt   r15,#D372
000A:E45D 2B 3D F3 CA+ lm    r3,(29CA)
000A:E462 F0 C2 18     iwt   r0,#18C2
000A:E465 51           add   r1
000A:E466 B3 30        stw   (r0)
000A:E468 3D A0 00     lms   r0,(0000)
000A:E46B 33           stw   (r3)
000A:E46C D3           inc   r3
000A:E46D D3           inc   r3
000A:E46E 3D A0 01     lms   r0,(0002)
000A:E471 33           stw   (r3)
000A:E472 D3           inc   r3
000A:E473 D3           inc   r3
000A:E474 B7 33        stw   (r3)
000A:E476 D3           inc   r3
000A:E477 D3           inc   r3
000A:E478 B6 33        stw   (r3)
000A:E47A D3           inc   r3
000A:E47B D3           inc   r3
000A:E47C 3E F3 CA 29  sm    (29CA),r3
000A:E480 FF 7F D0     iwt   r15,#D07F
000A:E483 D1           inc   r1
000A:E484 B6 C0        hib
000A:E486 A5 7A        ibt   r5,#007A
000A:E488 65           sub   r5
000A:E489 08 2D        bne   E4B8
000A:E48B 01           nop
000A:E48C F4 00 04     iwt   r4,#0400
000A:E48F F5 00 FC     iwt   r5,#FC00
000A:E492 3D A0 1F     lms   r0,(003E)
000A:E495 4F           not
000A:E496 D0           inc   r0
000A:E497 50           add   r0
000A:E498 3F 64        cmp   r4
000A:E49A 0B 03        bmi   E49F
000A:E49C 01           nop
000A:E49D 24 10        move  r0,r4
000A:E49F 3F 65        cmp   r5
000A:E4A1 0A 03        bpl   E4A6
000A:E4A3 01           nop
000A:E4A4 25 10        move  r0,r5
000A:E4A6 90           sbk
000A:E4A7 23 B3        moves r3,r3
000A:E4A9 08 06        bne   E4B1
000A:E4AB 3E F0 20 12  sm    (1220),r0
000A:E4AF 9B           jmp   r11
000A:E4B0 01           nop

000A:E4B1 3E F0 22 12  sm    (1222),r0
000A:E4B5 22 3F 71     bic   #01
000A:E4B8 9B           jmp   r11
000A:E4B9 01           nop

000A:E4BA 94           link  #04
000A:E4BB FF 72 D3     iwt   r15,#D372
000A:E4BE 2B 22 52     add   r2
000A:E4C1 22 52        add   r2
000A:E4C3 3D F0 20 12  lm    r0,(1220)
000A:E4C7 3E A0 1F     sms   (003E),r0
000A:E4CA E0           dec   r0
000A:E4CB 0A 1E        bpl   E4EB
000A:E4CD 01           nop
000A:E4CE A3 01        ibt   r3,#0001
000A:E4D0 94           link  #04
000A:E4D1 FF B0 D3     iwt   r15,#D3B0
000A:E4D4 3E A3 00     sms   (0000),r3
000A:E4D7 94           link  #04
000A:E4D8 FF 84 E4     iwt   r15,#E484
000A:E4DB 01           nop
000A:E4DC 3D F0 20 12  lm    r0,(1220)
000A:E4E0 3E 60        sub   #00
000A:E4E2 09 0A        beq   E4EE
000A:E4E4 22 52        add   r2
000A:E4E6 DE           inc   r14
000A:E4E7 DE           inc   r14
000A:E4E8 05 14        bra   E4FE

000A:E4EA 22 DE        inc   r14
000A:E4EC DE           inc   r14
000A:E4ED 22 52        add   r2
000A:E4EF A3 FF        ibt   r3,#FFFF
000A:E4F1 94           link  #04
000A:E4F2 FF B0 D3     iwt   r15,#D3B0
000A:E4F5 3E A3 00     sms   (0000),r3
000A:E4F8 94           link  #04
000A:E4F9 FF 84 E4     iwt   r15,#E484
000A:E4FC 01           nop
000A:E4FD 22 52        add   r2
000A:E4FF 3D F0 22 12  lm    r0,(1222)
000A:E503 3E A0 1F     sms   (003E),r0
000A:E506 A3 10        ibt   r3,#0010
000A:E508 94           link  #04
000A:E509 FF A3 D1     iwt   r15,#D1A3
000A:E50C 3E B2 03     lsr
000A:E50F 0C 0E        bcc   E51F
000A:E511 01           nop
000A:E512 DA           inc   r10
000A:E513 60           sub   r0
000A:E514 3E F0 22 12  sm    (1222),r0
000A:E518 A3 01        ibt   r3,#0001
000A:E51A 94           link  #04
000A:E51B FF 84 E4     iwt   r15,#E484
000A:E51E 01           nop
000A:E51F 22 52        add   r2
000A:E521 A3 F0        ibt   r3,#FFF0
000A:E523 94           link  #04
000A:E524 FF B5 D1     iwt   r15,#D1B5
000A:E527 3E B2 03     lsr
000A:E52A 0C 08        bcc   E534
000A:E52C B7 3E 71     and   #01
000A:E52F 09 06        beq   E537
000A:E531 22 3F 71     bic   #01
000A:E534 05 2F        bra   E565

000A:E536 01           nop
000A:E537 2A 54        add   r4
000A:E539 A3 FF        ibt   r3,#FFFF
000A:E53B F0 41 11     iwt   r0,#1141
000A:E53E 51           add   r1
000A:E53F B3 3D 30     stb   (r0)
000A:E542 F0 2E 27     iwt   r0,#272E
000A:E545 51           add   r1
000A:E546 B9 30        stw   (r0)
000A:E548 D0           inc   r0
000A:E549 D0           inc   r0
000A:E54A BA 30        stw   (r0)
000A:E54C 3D A3 08     lms   r3,(0010)
000A:E54F 3E F3 02 0F  sm    (0F02),r3
000A:E553 60           sub   r0
000A:E554 3E A0 08     sms   (0010),r0
000A:E557 F0 00 01     iwt   r0,#0100
000A:E55A 3E F0 22 12  sm    (1222),r0
000A:E55E A3 01        ibt   r3,#0001
000A:E560 94           link  #04
000A:E561 FF 84 E4     iwt   r15,#E484
000A:E564 01           nop
000A:E565 3D A5 08     lms   r5,(0010)
000A:E568 F0 8E 26     iwt   r0,#268E
000A:E56B 51           add   r1
000A:E56C B5 30        stw   (r0)
000A:E56E 3E F9 E2 10  sm    (10E2),r9
000A:E572 3D F0 20 17  lm    r0,(1720)
000A:E576 2A 60        sub   r0
000A:E578 3E FA 82 11  sm    (1182),r10
000A:E57C FF 7F D0     iwt   r15,#D07F
000A:E57F D1           inc   r1
000A:E580 F0 E0 11     iwt   r0,#11E0
000A:E583 51           add   r1
000A:E584 40           ldw   (r0)
000A:E585 E0           dec   r0
000A:E586 0A 17        bpl   E59F
000A:E588 22 A3 01     ibt   r3,#0001
000A:E58B 94           link  #04
000A:E58C FF 87 D3     iwt   r15,#D387
000A:E58F 3E F0 E0 11  sm    (11E0),r0
000A:E593 51           add   r1
000A:E594 40           ldw   (r0)
000A:E595 3E 60        sub   #00
000A:E597 09 06        beq   E59F
000A:E599 22 52        add   r2
000A:E59B 05 0B        bra   E5A8

000A:E59D 22 22 52     add   r2
000A:E5A0 A3 FF        ibt   r3,#FFFF
000A:E5A2 94           link  #04
000A:E5A3 FF 87 D3     iwt   r15,#D387
000A:E5A6 3E 22 52     add   #02
000A:E5A9 22 52        add   r2
000A:E5AB A3 F0        ibt   r3,#FFF0
000A:E5AD 94           link  #04
000A:E5AE FF 69 D1     iwt   r15,#D169
000A:E5B1 3E B2 03     lsr
000A:E5B4 0C 2C        bcc   E5E2
000A:E5B6 2A 54        add   r4
000A:E5B8 A3 FF        ibt   r3,#FFFF
000A:E5BA F0 41 11     iwt   r0,#1141
000A:E5BD 51           add   r1
000A:E5BE B3 3D 30     stb   (r0)
000A:E5C1 F0 2E 27     iwt   r0,#272E
000A:E5C4 51           add   r1
000A:E5C5 B9 30        stw   (r0)
000A:E5C7 D0           inc   r0
000A:E5C8 D0           inc   r0
000A:E5C9 BA 30        stw   (r0)
000A:E5CB 3D A3 08     lms   r3,(0010)
000A:E5CE F0 C2 0E     iwt   r0,#0EC2
000A:E5D1 51           add   r1
000A:E5D2 B3 3D 30     stb   (r0)
000A:E5D5 60           sub   r0
000A:E5D6 3E A0 08     sms   (0010),r0
000A:E5D9 F3 00 01     iwt   r3,#0100
000A:E5DC F0 22 12     iwt   r0,#1222
000A:E5DF 51           add   r1
000A:E5E0 B3 30        stw   (r0)
000A:E5E2 3D A5 08     lms   r5,(0010)
000A:E5E5 F0 8E 26     iwt   r0,#268E
000A:E5E8 51           add   r1
000A:E5E9 B5 30        stw   (r0)
000A:E5EB F0 A2 10     iwt   r0,#10A2
000A:E5EE 51           add   r1
000A:E5EF B9 30        stw   (r0)
000A:E5F1 F0 E0 16     iwt   r0,#16E0
000A:E5F4 51           add   r1
000A:E5F5 40           ldw   (r0)
000A:E5F6 2A 60        sub   r0
000A:E5F8 F0 42 11     iwt   r0,#1142
000A:E5FB 51           add   r1
000A:E5FC BA 30        stw   (r0)
000A:E5FE FF 7F D0     iwt   r15,#D07F
000A:E601 D1           inc   r1
000A:E602 A0 0B        ibt   r0,#000B
000A:E604 3F DF        romb
000A:E606 F0 60 18     iwt   r0,#1860
000A:E609 5A           add   r10
000A:E60A 16 40        ldw   (r0)
000A:E60C B6 77        and   r7
000A:E60E 08 19        bne   E629
000A:E610 B6 3E 7F     and   #0F
000A:E613 09 09        beq   E61E
000A:E615 94           link  #04
000A:E616 FF 94 E6     iwt   r15,#E694
000A:E619 01           nop
000A:E61A 60           sub   r0
000A:E61B 00           stop
000A:E61C 01           nop

000A:E61D 94           link  #04
000A:E61E FF B5 E6     iwt   r15,#E6B5
000A:E621 01           nop
000A:E622 24 3E 5A     add   #0A
000A:E625 A0 0B        ibt   r0,#000B
000A:E627 3F DF        romb
000A:E629 A6 00        ibt   r6,#0000
000A:E62B F0 D7 19     iwt   r0,#19D7
000A:E62E 5A           add   r10
000A:E62F B6 3D 30     stb   (r0)
000A:E632 F0 43 88     iwt   r0,#8843
000A:E635 1E 54        add   r4
000A:E637 16 3F EF     getbs
000A:E63A F0 20 12     iwt   r0,#1220
000A:E63D 5A           add   r10
000A:E63E B6 30        stw   (r0)
000A:E640 F0 6B 88     iwt   r0,#886B
000A:E643 1E 54        add   r4
000A:E645 16 3F EF     getbs
000A:E648 F0 22 12     iwt   r0,#1222
000A:E64B 5A           add   r10
000A:E64C B6 30        stw   (r0)
000A:E64E F0 93 88     iwt   r0,#8893
000A:E651 1E 54        add   r4
000A:E653 16 EF        getb
000A:E655 F0 02 19     iwt   r0,#1902
000A:E658 5A           add   r10
000A:E659 B6 30        stw   (r0)
000A:E65B F0 BB 88     iwt   r0,#88BB
000A:E65E 1E 54        add   r4
000A:E660 EF           getb
000A:E661 16 3E 71     and   #01
000A:E664 09 04        beq   E66A
000A:E666 01           nop
000A:E667 4D           swap
000A:E668 D0           inc   r0
000A:E669 4D           swap
000A:E66A 3F 71        bic   #01
000A:E66C 3E A0 0C     sms   (0018),r0
000A:E66F F0 E3 88     iwt   r0,#88E3
000A:E672 1E 54        add   r4
000A:E674 16 3F EF     getbs
000A:E677 F0 E2 10     iwt   r0,#10E2
000A:E67A 5A           add   r10
000A:E67B 40           ldw   (r0)
000A:E67C 3F 7F        bic   #0F
000A:E67E 56           add   r6
000A:E67F 90           sbk
000A:E680 F0 0B 89     iwt   r0,#890B
000A:E683 1E 54        add   r4
000A:E685 16 3F EF     getbs
000A:E688 F0 82 11     iwt   r0,#1182
000A:E68B 5A           add   r10
000A:E68C 40           ldw   (r0)
000A:E68D 3F 7F        bic   #0F
000A:E68F 56           add   r6
000A:E690 90           sbk
000A:E691 60           sub   r0
000A:E692 00           stop
000A:E693 01           nop

000A:E694 B3 3E 6B     sub   #0B
000A:E697 09 22        beq   E6BB
000A:E699 60           sub   r0
000A:E69A 3E A0 0E     sms   (001C),r0
000A:E69D 3E A4 04     sms   (0008),r4
000A:E6A0 F0 97 89     iwt   r0,#8997
000A:E6A3 1E 54        add   r4
000A:E6A5 EF           getb
000A:E6A6 F6 E2 10     iwt   r6,#10E2
000A:E6A9 26 5A        add   r10
000A:E6AB 16 46        ldw   (r6)
000A:E6AD 18 56        add   r6
000A:E6AF F0 A1 89     iwt   r0,#89A1
000A:E6B2 05 25        bra   E6D9

000A:E6B4 1E B3 3E 61  sub   #01
000A:E6B8 09 E0        beq   E69A
000A:E6BA 60           sub   r0
000A:E6BB A0 0A        ibt   r0,#000A
000A:E6BD 3E A0 0E     sms   (001C),r0
000A:E6C0 3E A4 04     sms   (0008),r4
000A:E6C3 B7 14 96     asr
000A:E6C6 F0 AB 89     iwt   r0,#89AB
000A:E6C9 1E 54        add   r4
000A:E6CB EF           getb
000A:E6CC F6 E2 10     iwt   r6,#10E2
000A:E6CF 26 5A        add   r10
000A:E6D1 16 46        ldw   (r6)
000A:E6D3 18 56        add   r6
000A:E6D5 F0 B0 89     iwt   r0,#89B0
000A:E6D8 1E 54        add   r4
000A:E6DA EF           getb
000A:E6DB F6 82 11     iwt   r6,#1182
000A:E6DE 26 5A        add   r10
000A:E6E0 16 46        ldw   (r6)
000A:E6E2 56           add   r6
000A:E6E3 3E AA 10     sms   (0020),r10
000A:E6E6 3E AB 35     sms   (006A),r11
000A:E6E9 A6 0A        ibt   r6,#000A
000A:E6EB B6 3F DF     romb
000A:E6EE 94           link  #04
000A:E6EF FF 96 D0     iwt   r15,#D096
000A:E6F2 3D A0 0B     lms   r0,(0016)
000A:E6F5 3F DF        romb
000A:E6F7 3D AB 35     lms   r11,(006A)
000A:E6FA 3D AA 10     lms   r10,(0020)
000A:E6FD 3D A4 04     lms   r4,(0008)
000A:E700 B7 3E 74     and   #04
000A:E703 08 05        bne   E70A
000A:E705 01           nop
000A:E706 FF AC E7     iwt   r15,#E7AC
000A:E709 01           nop
000A:E70A 3D A0 0E     lms   r0,(001C)
000A:E70D 24 50        add   r0
000A:E70F F0 33 89     iwt   r0,#8933
000A:E712 1E 54        add   r4
000A:E714 16 3F EF     getbs
000A:E717 F0 20 12     iwt   r0,#1220
000A:E71A 5A           add   r10
000A:E71B B6 30        stw   (r0)
000A:E71D F0 47 89     iwt   r0,#8947
000A:E720 1E 54        add   r4
000A:E722 16 3F EF     getbs
000A:E725 F0 22 12     iwt   r0,#1222
000A:E728 5A           add   r10
000A:E729 B6 30        stw   (r0)
000A:E72B F0 5B 89     iwt   r0,#895B
000A:E72E 1E 54        add   r4
000A:E730 EF           getb
000A:E731 16 3E 71     and   #01
000A:E734 09 04        beq   E73A
000A:E736 01           nop
000A:E737 4D           swap
000A:E738 D0           inc   r0
000A:E739 4D           swap
000A:E73A 3F 71        bic   #01
000A:E73C 3E A0 0C     sms   (0018),r0
000A:E73F F0 D7 19     iwt   r0,#19D7
000A:E742 5A           add   r10
000A:E743 3D 40        ldb   (r0)
000A:E745 3E 60        sub   #00
000A:E747 08 61        bne   E7AA
000A:E749 60           sub   r0
000A:E74A F0 6F 89     iwt   r0,#896F
000A:E74D 1E 54        add   r4
000A:E74F 16 EF        getb
000A:E751 F0 E2 10     iwt   r0,#10E2
000A:E754 5A           add   r10
000A:E755 40           ldw   (r0)
000A:E756 3F 7F        bic   #0F
000A:E758 C6           or    r6
000A:E759 90           sbk
000A:E75A F0 83 89     iwt   r0,#8983
000A:E75D 1E 54        add   r4
000A:E75F 16 EF        getb
000A:E761 F0 82 11     iwt   r0,#1182
000A:E764 5A           add   r10
000A:E765 40           ldw   (r0)
000A:E766 3F 7F        bic   #0F
000A:E768 C6           or    r6
000A:E769 90           sbk
000A:E76A A6 00        ibt   r6,#0000
000A:E76C F0 E1 10     iwt   r0,#10E1
000A:E76F 5A           add   r10
000A:E770 B6 3D 30     stb   (r0)
000A:E773 F0 81 11     iwt   r0,#1181
000A:E776 5A           add   r10
000A:E777 B6 3D 30     stb   (r0)
000A:E77A A6 FF        ibt   r6,#FFFF
000A:E77C F0 20 12     iwt   r0,#1220
000A:E77F 5A           add   r10
000A:E780 40           ldw   (r0)
000A:E781 3E 60        sub   #00
000A:E783 0A 08        bpl   E78D
000A:E785 01           nop
000A:E786 F0 E1 10     iwt   r0,#10E1
000A:E789 5A           add   r10
000A:E78A B6 3D 30     stb   (r0)
000A:E78D F0 22 12     iwt   r0,#1222
000A:E790 5A           add   r10
000A:E791 40           ldw   (r0)
000A:E792 3E 60        sub   #00
000A:E794 0A 08        bpl   E79E
000A:E796 01           nop
000A:E797 F0 81 11     iwt   r0,#1181
000A:E79A 5A           add   r10
000A:E79B B6 3D 30     stb   (r0)
000A:E79E 3D A6 0E     lms   r6,(001C)
000A:E7A1 D6           inc   r6
000A:E7A2 F0 D7 19     iwt   r0,#19D7
000A:E7A5 5A           add   r10
000A:E7A6 B6 3D 30     stb   (r0)
000A:E7A9 60           sub   r0
000A:E7AA 00           stop
000A:E7AB 01           nop

000A:E7AC F0 D7 19     iwt   r0,#19D7
000A:E7AF 5A           add   r10
000A:E7B0 13 3D 40     ldb   (r0)
000A:E7B3 23 B3        moves r3,r3
000A:E7B5 09 5F        beq   E816
000A:E7B7 01           nop
000A:E7B8 E3           dec   r3
000A:E7B9 09 4C        beq   E807
000A:E7BB 01           nop
000A:E7BC F0 D9 19     iwt   r0,#19D9
000A:E7BF 5A           add   r10
000A:E7C0 16 3D 40     ldb   (r0)
000A:E7C3 F0 60 18     iwt   r0,#1860
000A:E7C6 5A           add   r10
000A:E7C7 40           ldw   (r0)
000A:E7C8 26 B6        moves r6,r6
000A:E7CA 09 04        beq   E7D0
000A:E7CC 01           nop
000A:E7CD 3E 5F        add   #0F
000A:E7CF D0           inc   r0
000A:E7D0 F6 B5 89     iwt   r6,#89B5
000A:E7D3 1E 56        add   r6
000A:E7D5 14 3F EF     getbs
000A:E7D8 24 B4        moves r4,r4
000A:E7DA 0B CE        bmi   E7AA
000A:E7DC 60           sub   r0
000A:E7DD B4 54        add   r4
000A:E7DF 95           sex
000A:E7E0 0B 25        bmi   E807
000A:E7E2 01           nop
000A:E7E3 F0 D5 89     iwt   r0,#89D5
000A:E7E6 1E 54        add   r4
000A:E7E8 3F EF        getbs
000A:E7EA F6 E2 10     iwt   r6,#10E2
000A:E7ED 26 5A        add   r10
000A:E7EF 16 46        ldw   (r6)
000A:E7F1 56           add   r6
000A:E7F2 90           sbk
000A:E7F3 F0 DF 89     iwt   r0,#89DF
000A:E7F6 1E 54        add   r4
000A:E7F8 3F EF        getbs
000A:E7FA F6 82 11     iwt   r6,#1182
000A:E7FD 26 5A        add   r10
000A:E7FF 16 46        ldw   (r6)
000A:E801 56           add   r6
000A:E802 90           sbk
000A:E803 FF 2A E6     iwt   r15,#E62A
000A:E806 A6 3D        ibt   r6,#003D
000A:E808 A0 0E        ibt   r0,#000E
000A:E80A 14 3F CA     xor   #0A
000A:E80D 3D A0 04     lms   r0,(0008)
000A:E810 24 50        add   r0
000A:E812 FF 23 E6     iwt   r15,#E623
000A:E815 24 3D A4 04  lms   r4,(0008)
000A:E819 9B           jmp   r11
000A:E81A 01           nop

000A:E81B A0 0B        ibt   r0,#000B
000A:E81D 3F DF        romb
000A:E81F F0 93 88     iwt   r0,#8893
000A:E822 1E 54        add   r4
000A:E824 14 EF        getb
000A:E826 F0 02 19     iwt   r0,#1902
000A:E829 5A           add   r10
000A:E82A B4 30        stw   (r0)
000A:E82C 24 03        lsr
000A:E82E F0 33 89     iwt   r0,#8933
000A:E831 1E 54        add   r4
000A:E833 16 3F EF     getbs
000A:E836 F0 20 12     iwt   r0,#1220
000A:E839 5A           add   r10
000A:E83A B6 30        stw   (r0)
000A:E83C F0 47 89     iwt   r0,#8947
000A:E83F 1E 54        add   r4
000A:E841 16 3F EF     getbs
000A:E844 F0 22 12     iwt   r0,#1222
000A:E847 5A           add   r10
000A:E848 B6 30        stw   (r0)
000A:E84A F0 5B 89     iwt   r0,#895B
000A:E84D 1E 54        add   r4
000A:E84F EF           getb
000A:E850 16 3E 71     and   #01
000A:E853 09 04        beq   E859
000A:E855 01           nop
000A:E856 4D           swap
000A:E857 D0           inc   r0
000A:E858 4D           swap
000A:E859 3F 71        bic   #01
000A:E85B 3E A0 0C     sms   (0018),r0
000A:E85E 00           stop
000A:E85F 01           nop

DATA_0AE860:         dw $9EE3, $3449

000A:E864 A0 0A        ibt   r0,#000A
000A:E866 3F DF        romb
000A:E868 A2 00        ibt   r2,#0000
000A:E86A 25 95        sex
000A:E86C 0B 09        bmi   E877
000A:E86E 01           nop
000A:E86F 3D A0 14     lms   r0,(0028)
000A:E872 4F           not
000A:E873 D0           inc   r0
000A:E874 90           sbk
000A:E875 A2 02        ibt   r2,#0002
000A:E877 A3 20        ibt   r3,#0020
000A:E879 F1 60 E8     iwt   r1,#E860
000A:E87C B6 C0        hib
000A:E87E 63           sub   r3
000A:E87F 9E           lob
000A:E880 50           add   r0
000A:E881 50           add   r0
000A:E882 C0           hib
000A:E883 52           add   r2
000A:E884 3E 73        and   #03
000A:E886 1E 51        add   r1
000A:E888 EF           getb
000A:E889 3E A0 1D     sms   (003A),r0
000A:E88C A7 0A        ibt   r7,#000A
000A:E88E B7 3F DF     romb
000A:E891 3D A1 1D     lms   r1,(003A)
000A:E894 94           link  #04
000A:E895 FF AB E8     iwt   r15,#E8AB
000A:E898 01           nop
000A:E899 3D A0 1D     lms   r0,(003A)
000A:E89C 03           lsr
000A:E89D 03           lsr
000A:E89E 03           lsr
000A:E89F 11 03        lsr
000A:E8A1 94           link  #04
000A:E8A2 FF AB E8     iwt   r15,#E8AB
000A:E8A5 01           nop
000A:E8A6 60           sub   r0
000A:E8A7 20 11        move  r1,r0
000A:E8A9 00           stop
000A:E8AA 01           nop

000A:E8AB 3E AB 31     sms   (0062),r11
000A:E8AE 3D A2 1E     lms   r2,(003C)
000A:E8B1 B1 3E 71     and   #01
000A:E8B4 09 04        beq   E8BA
000A:E8B6 01           nop
000A:E8B7 3D A2 1F     lms   r2,(003E)
000A:E8BA B1 3E 72     and   #02
000A:E8BD 09 04        beq   E8C3
000A:E8BF 01           nop
000A:E8C0 22 4F        not
000A:E8C2 D2           inc   r2
000A:E8C3 3D A3 14     lms   r3,(0028)
000A:E8C6 3D A0 15     lms   r0,(002A)
000A:E8C9 52           add   r2
000A:E8CA 18 53        add   r3
000A:E8CC 3E A8 10     sms   (0020),r8
000A:E8CF 3D A2 1E     lms   r2,(003C)
000A:E8D2 B1 3E 74     and   #04
000A:E8D5 09 04        beq   E8DB
000A:E8D7 01           nop
000A:E8D8 3D A2 1F     lms   r2,(003E)
000A:E8DB B1 3E 78     and   #08
000A:E8DE 09 04        beq   E8E4
000A:E8E0 01           nop
000A:E8E1 22 4F        not
000A:E8E3 D2           inc   r2
000A:E8E4 3D A0 16     lms   r0,(002C)
000A:E8E7 52           add   r2
000A:E8E8 3E A0 11     sms   (0022),r0
000A:E8EB 94           link  #04
000A:E8EC FF 95 D0     iwt   r15,#D095
000A:E8EF 02           cache
000A:E8F0 B7 3E 72     and   #02
000A:E8F3 08 23        bne   E918
000A:E8F5 60           sub   r0
000A:E8F6 3D A8 10     lms   r8,(0020)
000A:E8F9 A0 06        ibt   r0,#0006
000A:E8FB 3D A1 15     lms   r1,(002A)
000A:E8FE B1 3F 68     cmp   r8
000A:E901 0A 03        bpl   E906
000A:E903 01           nop
000A:E904 4F           not
000A:E905 D0           inc   r0
000A:E906 18 58        add   r8
000A:E908 3D A0 11     lms   r0,(0022)
000A:E90B 3E 58        add   #08
000A:E90D 94           link  #04
000A:E90E FF 96 D0     iwt   r15,#D096
000A:E911 3D B7 3E 73  and   #03
000A:E915 09 05        beq   E91C
000A:E917 60           sub   r0
000A:E918 A1 01        ibt   r1,#0001
000A:E91A 00           stop
000A:E91B 01           nop

000A:E91C 3D AB 31     lms   r11,(0062)
000A:E91F 9B           jmp   r11
000A:E920 01           nop

000A:E921 A0 0A        ibt   r0,#000A
000A:E923 3F DF        romb
000A:E925 A3 00        ibt   r3,#0000
000A:E927 A4 10        ibt   r4,#0010
000A:E929 A9 F0        ibt   r9,#FFF0
000A:E92B 3D A0 4E     lms   r0,(009C)
000A:E92E 19 79        and   r9
000A:E930 FA F0 00     iwt   r10,#00F0
000A:E933 AC 08        ibt   r12,#0008
000A:E935 21 18        move  r8,r1
000A:E937 B2 59        add   r9
000A:E939 94           link  #04
000A:E93A FF 95 D0     iwt   r15,#D095
000A:E93D 02           cache
000A:E93E 3E 73        and   #03
000A:E940 08 04        bne   E946
000A:E942 01           nop
000A:E943 05 07        bra   E94C

000A:E945 D3           inc   r3

000A:E946 3E 72        and   #02
000A:E948 08 02        bne   E94C
000A:E94A 01           nop
000A:E94B D3           inc   r3
000A:E94C EC           dec   r12
000A:E94D 2F 1D        move  r13,r15
000A:E94F B2 54        add   r4
000A:E951 3F 6A        cmp   r10
000A:E953 0C 04        bcc   E959
000A:E955 01           nop
000A:E956 60           sub   r0
000A:E957 20 13        move  r3,r0
000A:E959 20 12        move  r2,r0
000A:E95B 21 18        move  r8,r1
000A:E95D B2 59        add   r9
000A:E95F 94           link  #04
000A:E960 FF 96 D0     iwt   r15,#D096
000A:E963 3D 15 3E 73  and   #03
000A:E967 08 04        bne   E96D
000A:E969 01           nop
000A:E96A 05 3B        bra   E9A7

000A:E96C D3           inc   r3

000A:E96D B3 3E 62     sub   #02
000A:E970 0C 2A        bcc   E99C
000A:E972 01           nop
000A:E973 22 59        add   r9
000A:E975 3D AB 10     lms   r11,(0020)
000A:E978 3D F0 8C 00  lm    r0,(008C)
000A:E97C 61           sub   r1
000A:E97D 0A 03        bpl   E982
000A:E97F 01           nop
000A:E980 4F           not
000A:E981 D0           inc   r0
000A:E982 6B           sub   r11
000A:E983 0A 13        bpl   E998
000A:E985 01           nop
000A:E986 3D F0 90 00  lm    r0,(0090)
000A:E98A 62           sub   r2
000A:E98B 0A 03        bpl   E990
000A:E98D 01           nop
000A:E98E 4F           not
000A:E98F D0           inc   r0
000A:E990 6B           sub   r11
000A:E991 0A 05        bpl   E998
000A:E993 01           nop
000A:E994 22           with  r2
000A:E995 05 05        bra   E99C

000A:E997 69           sub   r9

000A:E998 1A           to    r10
000A:E999 05 10        bra   E9AB

000A:E99B 60           sub   r0

000A:E99C B5 3E 72     and   #02
000A:E99F 08 04        bne   E9A5
000A:E9A1 01           nop
000A:E9A2 05 03        bra   E9A7

000A:E9A4 D3           inc   r3

000A:E9A5 13 60        sub   r0
000A:E9A7 3C           loop
000A:E9A8 01           nop
000A:E9A9 AA FF        ibt   r10,#FFFF
000A:E9AB 60           sub   r0
000A:E9AC 00           stop
000A:E9AD 01           nop

000A:E9AE 3F DF        romb
000A:E9B0 1A 60        sub   r0
000A:E9B2 F0 06 00     iwt   r0,#0006
000A:E9B5 53           add   r3
000A:E9B6 14 40        ldw   (r0)
000A:E9B8 94           link  #04
000A:E9B9 FF F8 E9     iwt   r15,#E9F8
000A:E9BC 01           nop
000A:E9BD CA           or    r10
000A:E9BE 1A 50        add   r0
000A:E9C0 F0 0E 00     iwt   r0,#000E
000A:E9C3 53           add   r3
000A:E9C4 14 40        ldw   (r0)
000A:E9C6 94           link  #04
000A:E9C7 FF F8 E9     iwt   r15,#E9F8
000A:E9CA 01           nop
000A:E9CB CA           or    r10
000A:E9CC 1A 50        add   r0
000A:E9CE F0 16 00     iwt   r0,#0016
000A:E9D1 53           add   r3
000A:E9D2 14 40        ldw   (r0)
000A:E9D4 94           link  #04
000A:E9D5 FF F8 E9     iwt   r15,#E9F8
000A:E9D8 01           nop
000A:E9D9 CA           or    r10
000A:E9DA 1A 50        add   r0
000A:E9DC F0 1E 00     iwt   r0,#001E
000A:E9DF 53           add   r3
000A:E9E0 14 40        ldw   (r0)
000A:E9E2 94           link  #04
000A:E9E3 FF F8 E9     iwt   r15,#E9F8
000A:E9E6 01           nop
000A:E9E7 CA           or    r10
000A:E9E8 1A 50        add   r0
000A:E9EA F0 26 00     iwt   r0,#0026
000A:E9ED 53           add   r3
000A:E9EE 14 40        ldw   (r0)
000A:E9F0 94           link  #04
000A:E9F1 FF F8 E9     iwt   r15,#E9F8
000A:E9F4 01           nop
000A:E9F5 CA           or    r10
000A:E9F6 00           stop
000A:E9F7 01           nop

000A:E9F8 02           cache
000A:E9F9 21 1E        move  r14,r1
000A:E9FB 22 1C        move  r12,r2
000A:E9FD 2F 1D        move  r13,r15
000A:E9FF F0 00 FF     iwt   r0,#FF00
000A:EA02 3E EF        getbl
000A:EA04 DE           inc   r14
000A:EA05 15 74        and   r4
000A:EA07 EF           getb
000A:EA08 DE           inc   r14
000A:EA09 3D EF        getbh
000A:EA0B DE           inc   r14
000A:EA0C 3F 65        cmp   r5
000A:EA0E 09 06        beq   EA16
000A:EA10 60           sub   r0
000A:EA11 3C           loop
000A:EA12 01           nop
000A:EA13 05 02        bra   EA17

000A:EA15 01           nop

000A:EA16 D0           inc   r0
000A:EA17 9B           jmp   r11
000A:EA18 01           nop

000A:EA19 AA 01        ibt   r10,#0001
000A:EA1B 2C BC        moves r12,r12
000A:EA1D 09 52        beq   EA71
000A:EA1F 01           nop
000A:EA20 0A 05        bpl   EA27
000A:EA22 2C 4F        not
000A:EA24 DC           inc   r12
000A:EA25 AA FF        ibt   r10,#FFFF
000A:EA27 F0 20 00     iwt   r0,#0020
000A:EA2A FD 24 00     iwt   r13,#0024
000A:EA2D 29 B9        moves r9,r9
000A:EA2F 09 07        beq   EA38
000A:EA31 01           nop
000A:EA32 F0 22 00     iwt   r0,#0022
000A:EA35 FD 26 00     iwt   r13,#0026
000A:EA38 3E A0 14     sms   (0028),r0
000A:EA3B 3E AD 15     sms   (002A),r13
000A:EA3E A0 0A        ibt   r0,#000A
000A:EA40 3F DF        romb
000A:EA42 2F 1D        move  r13,r15
000A:EA44 3D A8 10     lms   r8,(0020)
000A:EA47 3D A0 11     lms   r0,(0022)
000A:EA4A 94           link  #04
000A:EA4B FF 96 D0     iwt   r15,#D096
000A:EA4E 3D 3E 72     and   #02
000A:EA51 08 1F        bne   EA72
000A:EA53 60           sub   r0
000A:EA54 3D A8 12     lms   r8,(0024)
000A:EA57 3D A0 13     lms   r0,(0026)
000A:EA5A 94           link  #04
000A:EA5B FF 96 D0     iwt   r15,#D096
000A:EA5E 3D 3E 72     and   #02
000A:EA61 08 0F        bne   EA72
000A:EA63 60           sub   r0
000A:EA64 3D A0 14     lms   r0,(0028)
000A:EA67 40           ldw   (r0)
000A:EA68 5A           add   r10
000A:EA69 90           sbk
000A:EA6A 3D A0 15     lms   r0,(002A)
000A:EA6D 40           ldw   (r0)
000A:EA6E 5A           add   r10
000A:EA6F 3C           loop
000A:EA70 90           sbk
000A:EA71 60           sub   r0
000A:EA72 00           stop
000A:EA73 01           nop

DATA_0AEA74:         dw $4400, $0484, $0000, $0064
DATA_0AEA7C:         dw $0000, $0021, $0022, $0023
DATA_0AEA84:         dw $0024, $0025, $0026, $0027
DATA_0AEA8C:         dw $0027, $0028, $0029, $002A
DATA_0AEA94:         dw $0029, $0028, $0003, $0002
DATA_0AEA9C:         dw $0002, $0002, $0002, $0008
DATA_0AEAA4:         dw $0000, $0001, $0001, $0002
DATA_0AEAAC:         dw $0001, $0001, $0000, $18F8
DATA_0AEAB4:         dw $1CFC, $0800, $1404, $0608
DATA_0AEABC:         dw $0602, $1AFE, $0E02, $04C0
DATA_0AEAC4:         dw $014E, $00FF, $014F, $0094
DATA_0AEACC:         dw $009E, $0095, $00A1, $0096
DATA_0AEAD4:         dw $00A1, $0097, $00A2, $0098
DATA_0AEADC:         dw $009F, $0099, $00A0, $009A
DATA_0AEAE4:         dw $00A1, $009B, $00A2, $009C
DATA_0AEAEC:         dw $009C, $009C, $009C, $009D
DATA_0AEAF4:         dw $009D, $009D, $009D, $009E
DATA_0AEAFC:         dw $080F, $0607, $0407, $0407
DATA_0AEB04:         dw $0403, $0403, $0401, $0401
DATA_0AEB0C:         dw $0400, $0901, $1701, $090F
DATA_0AEB14:         dw $170F, $0406, $040A, $2003
DATA_0AEB1C:         dw $2008, $200D, $1601, $1701
DATA_0AEB24:         dw $160F, $170F, $1006, $100A
DATA_0AEB2C:         dw $2003, $2008, $200D, $0C01
DATA_0AEB34:         dw $1601, $0C0F, $160F, $0406
DATA_0AEB3C:         dw $040A, $2003, $2008, $200D
DATA_0AEB44:         dw $1401, $1601, $140F, $160F
DATA_0AEB4C:         dw $1006, $100A, $2003, $2008
DATA_0AEB54:         dw $200D, $F8F3, $00F3, $F80C
DATA_0AEB5C:         dw $000C, $F4F7, $F400, $F409
DATA_0AEB64:         dw $08F7, $0800, $0809, $0CFC
DATA_0AEB6C:         dw $18FC, $0C13, $1713, $0C07
DATA_0AEB74:         dw $23FC, $2308, $2313, $EBFA
DATA_0AEB7C:         dw $F0FA, $EB06, $F006, $E800
DATA_0AEB84:         dw $0000, $0B01, $1601, $0B0F
DATA_0AEB8C:         dw $160F, $0706, $070A, $2003
DATA_0AEB94:         dw $2008, $200D, $1601, $1601
DATA_0AEB9C:         dw $160F, $160F, $1006, $100A
DATA_0AEBA4:         dw $2003, $2008, $200D, $08FE
DATA_0AEBAC:         dw $16FE, $0812, $1612, $0402
DATA_0AEBB4:         dw $040E, $2000, $2008, $2010
DATA_0AEBBC:         dw $0100, $8404, $0200, $8808
DATA_0AEBC4:         dw $8404, $8808, $4040, $4240
DATA_0AEBCC:         dw $4040, $4041, $4040, $C848
DATA_0AEBD4:         dw $C444, $4040, $8404, $0100
DATA_0AEBDC:         dw $0280, $8404, $8404, $00F0
DATA_0AEBE4:         dw $00F1, $00EF, $00F2, $00EE
DATA_0AEBEC:         dw $00F3, $00ED, $00F4, $00EC
DATA_0AEBF4:         dw $00F5, $00EB, $00F6, $00EA
DATA_0AEBFC:         dw $00F7, $00E9, $00F8, $00E8
DATA_0AEC04:         dw $00F9, $00E7, $00FA, $00E6
DATA_0AEC0C:         dw $00FB, $00E5, $00FC, $00E4
DATA_0AEC14:         dw $00FD, $00E3, $00FE, $00E2
DATA_0AEC1C:         dw $00FF, $00E1, $0100, $0000
DATA_0AEC24:         dw $0000, $0F1F, $0307, $0003
DATA_0AEC2C:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC34:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC3C:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC44:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC4C:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC54:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC5C:         dw $0003, $00FD, $0003, $00FD
DATA_0AEC64:         dw $0003, $00FD, $0003, $80FD
DATA_0AEC6C:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC74:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC7C:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC84:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC8C:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC94:         dw $8001, $80FE, $8001, $80FE
DATA_0AEC9C:         dw $8001, $80FE, $8001, $80FE
DATA_0AECA4:         dw $8001, $80FE, $8001, $00FE
DATA_0AECAC:         dw $0003, $00FD, $0003, $00FD
DATA_0AECB4:         dw $0003, $00FD, $0003, $00FD
DATA_0AECBC:         dw $0003, $00FD, $0003, $00FD
DATA_0AECC4:         dw $0003, $00FD, $0003, $00FD
DATA_0AECCC:         dw $0003, $00FD, $0003, $00FD
DATA_0AECD4:         dw $0003, $00FD, $0003, $00FD
DATA_0AECDC:         dw $0003, $00FD, $0003, $00FD
DATA_0AECE4:         dw $0003, $00FD, $0003, $00FD
DATA_0AECEC:         dw $0003, $00FD, $0003, $00FD
DATA_0AECF4:         dw $0003, $00FD, $0003, $00FD
DATA_0AECFC:         dw $0003, $00FD, $0003, $00FD
DATA_0AED04:         dw $0003, $00FD, $0003, $00FD
DATA_0AED0C:         dw $0003, $00FD, $0003, $00FD
DATA_0AED14:         dw $0003, $00FD, $0003, $00FD
DATA_0AED1C:         dw $0003, $00FD, $0003, $00FD
DATA_0AED24:         dw $0003, $00FD, $0003, $90FD
DATA_0AED2C:         dw $7002, $90FD, $7002, $90FD
DATA_0AED34:         dw $7002, $90FD, $7002, $90FD
DATA_0AED3C:         dw $7002, $90FD, $7002, $90FD
DATA_0AED44:         dw $7002, $90FD, $7002, $90FD
DATA_0AED4C:         dw $7002, $90FD, $7002, $90FD
DATA_0AED54:         dw $7002, $90FD, $7002, $90FD
DATA_0AED5C:         dw $7002, $90FD, $7002, $90FD
DATA_0AED64:         dw $7002, $90FD, $7002, $00FD
DATA_0AED6C:         dw $0001, $00FF, $0001, $80FF
DATA_0AED74:         dw $0000, $00FD, $0001, $00FF
DATA_0AED7C:         dw $0001, $00FF, $0001, $00FF
DATA_0AED84:         dw $0001, $00FF, $0001, $00FF
DATA_0AED8C:         dw $0001, $00FF, $0001, $00FF
DATA_0AED94:         dw $0001, $00FF, $0001, $00FF
DATA_0AED9C:         dw $0001, $00FF, $0001, $00FF
DATA_0AEDA4:         dw $8003, $00FF, $0001, $00FF
DATA_0AEDAC:         dw $0008, $00F8, $0008, $10F8
DATA_0AEDB4:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDBC:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDC4:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDCC:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDD4:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDDC:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDE4:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDEC:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDF4:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEDFC:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE04:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE0C:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE14:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE1C:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE24:         dw $3800, $F000, $C8FF, $10FF
DATA_0AEE2C:         dw $3800, $F000, $C8FF, $06FF
DATA_0AEE34:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE3C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE44:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE4C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE54:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE5C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE64:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE6C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE74:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE7C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE84:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE8C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE94:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEE9C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEEA4:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AEEAC:         dw $0A00, $FA00, $F6FF, $02FF
DATA_0AEEB4:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEBC:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEC4:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEECC:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEED4:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEDC:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEE4:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEEC:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEF4:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEEFC:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF04:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF0C:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF14:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF1C:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF24:         dw $0300, $FE00, $FDFF, $02FF
DATA_0AEF2C:         dw $0300, $FE00, $FDFF, $04FF
DATA_0AEF34:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF3C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF44:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF4C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF54:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF5C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF64:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF6C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF74:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF7C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF84:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF8C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF94:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEF9C:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEFA4:         dw $0800, $FC00, $F8FF, $04FF
DATA_0AEFAC:         dw $0800, $FC00, $F8FF, $08FF
DATA_0AEFB4:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFBC:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFC4:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFCC:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFD4:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFDC:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFE4:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFEC:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFF4:         dw $3800, $F800, $C8FF, $08FF
DATA_0AEFFC:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF004:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF00C:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF014:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF01C:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF024:         dw $3800, $F800, $C8FF, $08FF
DATA_0AF02C:         dw $3800, $F800, $C8FF, $06FF
DATA_0AF034:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF03C:         dw $0400, $FA00, $F6FF, $02FF
DATA_0AF044:         dw $0400, $F800, $F0FF, $06FF
DATA_0AF04C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF054:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF05C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF064:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF06C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF074:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF07C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF084:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF08C:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF094:         dw $0A00, $FA00, $F6FF, $06FF
DATA_0AF09C:         dw $0A00, $FA00, $F6FF, $08FF
DATA_0AF0A4:         dw $1000, $FE00, $FCFF, $06FF
DATA_0AF0AC:         dw $0A00, $FA00, $F6FF, $00FF
DATA_0AF0B4:         dw $0000, $0000, $0000, $0000
DATA_0AF0BC:         dw $0000, $0000, $0000, $0000
DATA_0AF0C4:         dw $0000, $0000, $0000, $0000
DATA_0AF0CC:         dw $0000, $0000, $0000, $0000
DATA_0AF0D4:         dw $0000, $0000, $0000, $0000
DATA_0AF0DC:         dw $0000, $0000, $0000, $0000
DATA_0AF0E4:         dw $0000, $0000, $0000, $0000
DATA_0AF0EC:         dw $0000, $0000, $0000, $0000
DATA_0AF0F4:         dw $0000, $0000, $0000, $0000
DATA_0AF0FC:         dw $0000, $0000, $0000, $0000
DATA_0AF104:         dw $0000, $0000, $0000, $0000
DATA_0AF10C:         dw $0000, $0000, $0000, $0000
DATA_0AF114:         dw $0000, $0000, $0000, $0000
DATA_0AF11C:         dw $0000, $0000, $0000, $0000
DATA_0AF124:         dw $0000, $0000, $0000, $0000
DATA_0AF12C:         dw $0000, $0000, $0000, $0000
DATA_0AF134:         dw $0000, $0000, $0000, $0000
DATA_0AF13C:         dw $0000, $0000, $0000, $0000
DATA_0AF144:         dw $0000, $0000, $0000, $0000
DATA_0AF14C:         dw $0000, $0000, $0000, $0000
DATA_0AF154:         dw $0000, $0000, $00FF, $0000
DATA_0AF15C:         dw $0000, $0000, $0000, $0000
DATA_0AF164:         dw $0000, $0000, $0000, $0000
DATA_0AF16C:         dw $0000, $0000, $0001, $8000
DATA_0AF174:         dw $4003, $0003, $0003, $8003
DATA_0AF17C:         dw $8004, $8004, $8004, $8004
DATA_0AF184:         dw $8004, $8004, $8004, $8004
DATA_0AF18C:         dw $8004, $8004, $0004, $E004
DATA_0AF194:         dw $20FF, $E000, $20FF, $E000
DATA_0AF19C:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1A4:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1AC:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1B4:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1BC:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1C4:         dw $20FF, $E000, $20FF, $E000
DATA_0AF1CC:         dw $20FF, $E000, $20FF, $FD00
DATA_0AF1D4:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF1DC:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF1E4:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF1EC:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF1F4:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF1FC:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF204:         dw $03FF, $FD00, $03FF, $FD00
DATA_0AF20C:         dw $03FF, $FD00, $03FF, $FF00
DATA_0AF214:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF21C:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF224:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF22C:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF234:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF23C:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF244:         dw $01FF, $FF00, $01FF, $FF00
DATA_0AF24C:         dw $01FF, $FF00, $01FF, $FC00
DATA_0AF254:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF25C:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF264:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF26C:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF274:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF27C:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF284:         dw $04FF, $FC00, $04FF, $FC00
DATA_0AF28C:         dw $04FF, $FC00, $04FF, $D000
DATA_0AF294:         dw $30FF, $D000, $30FF, $D000
DATA_0AF29C:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2A4:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2AC:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2B4:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2BC:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2C4:         dw $30FF, $D000, $30FF, $D000
DATA_0AF2CC:         dw $30FF, $D000, $30FF, $F800
DATA_0AF2D4:         dw $08FF, $F800, $08FF, $D000
DATA_0AF2DC:         dw $08FF, $F800, $08FF, $F800
DATA_0AF2E4:         dw $08FF, $F800, $08FF, $F800
DATA_0AF2EC:         dw $08FF, $F800, $08FF, $F800
DATA_0AF2F4:         dw $08FF, $F800, $08FF, $F800
DATA_0AF2FC:         dw $08FF, $F800, $08FF, $F800
DATA_0AF304:         dw $08FF, $F800, $08FF, $F800
DATA_0AF30C:         dw $30FF, $F800, $08FF, $FC00
DATA_0AF314:         dw $04FF, $FC00, $04FF, $F800
DATA_0AF31C:         dw $08FF, $F800, $08FF, $E000
DATA_0AF324:         dw $20FF, $E000, $20FF, $E000
DATA_0AF32C:         dw $20FF, $E000, $20FF, $E000
DATA_0AF334:         dw $20FF, $E000, $20FF, $E000
DATA_0AF33C:         dw $20FF, $E000, $20FF, $F800
DATA_0AF344:         dw $08FF, $F800, $08FF, $F800
DATA_0AF34C:         dw $08FF, $FC00, $04FF, $0C00
DATA_0AF354:         dw $F4FE, $00FE, $00FA, $08FA
DATA_0AF35C:         dw $3800, $F820, $C800, $F8E0
DATA_0AF364:         dw $0000, $0839, $0000, $00C7
DATA_0AF36C:         dw $C8F8, $00E0, $C8F8, $00E0
DATA_0AF374:         dw $0008, $00C7, $0008, $55C7
DATA_0AF37C:         dw $6200, $5B00, $6800, $A600
DATA_0AF384:         dw $A801, $A701, $A901, $A701
DATA_0AF38C:         dw $A901, $A701, $A901, $A701
DATA_0AF394:         dw $A901, $A701, $A901, $A701
DATA_0AF39C:         dw $A901, $A701, $A901, $A701
DATA_0AF3A4:         dw $A901, $A601, $A801, $0301
DATA_0AF3AC:         dw $0056, $6303, $0300, $005C
DATA_0AF3B4:         dw $6903, $0300, $0057, $6403
DATA_0AF3BC:         dw $0300, $005D, $6403, $0300
DATA_0AF3C4:         dw $0058, $6503, $0300, $0058
DATA_0AF3CC:         dw $6503, $0800, $0059, $6608
DATA_0AF3D4:         dw $0800, $0059, $6608, $0600
DATA_0AF3DC:         dw $005A, $6706, $0600, $005A
DATA_0AF3E4:         dw $6706, $0200, $000E, $3102
DATA_0AF3EC:         dw $0201, $000E, $3102, $0201
DATA_0AF3F4:         dw $000F, $3102, $0201, $000F
DATA_0AF3FC:         dw $3102, $0201, $0013, $6702
DATA_0AF404:         dw $0200, $0013, $6702, $0200
DATA_0AF40C:         dw $0014, $6702, $0200, $0014
DATA_0AF414:         dw $6702, $0300, $0056, $6303
DATA_0AF41C:         dw $0300, $005C, $6903, $0300
DATA_0AF424:         dw $0057, $6403, $0300, $005D
DATA_0AF42C:         dw $6403, $0300, $0058, $6503
DATA_0AF434:         dw $0300, $0058, $6503, $0800
DATA_0AF43C:         dw $0059, $6608, $0800, $0059
DATA_0AF444:         dw $6608, $0300, $01A3, $A304
DATA_0AF44C:         dw $0301, $01A3, $A304, $0401
DATA_0AF454:         dw $01A1, $A106, $0401, $01A1
DATA_0AF45C:         dw $A106, $0201, $01A4, $A402
DATA_0AF464:         dw $0201, $01A4, $A402, $0201
DATA_0AF46C:         dw $01A2, $A203, $0201, $01A2
DATA_0AF474:         dw $A203, $0301, $01A5, $A504
DATA_0AF47C:         dw $0301, $01A5, $A504, $0901
DATA_0AF484:         dw $1900, $0700, $0500, $0500
DATA_0AF48C:         dw $15FA, $25FA, $35FA, $45FA
DATA_0AF494:         dw $55FA, $EBFA, $DBFA, $CBFA
DATA_0AF49C:         dw $BBFA, $ABFA, $9BFA, $05FA
DATA_0AF4A4:         dw $15F6, $25F6, $35F6, $45F6
DATA_0AF4AC:         dw $55F6, $EBF6, $DBF6, $CBF6
DATA_0AF4B4:         dw $BBF6, $ABF6, $9BF6, $F4F6
DATA_0AF4BC:         dw $F4E2, $F4D2, $F4C2, $F4B2
DATA_0AF4C4:         dw $F4A2, $FC92, $FCE2, $FCD2
DATA_0AF4CC:         dw $FCC2, $FCB2, $FCA2, $0292
DATA_0AF4D4:         dw $0904, $0510, $40F5, $5003
DATA_0AF4DC:         dw $8000, $5003, $C000, $5003
DATA_0AF4E4:         dw $0000, $5004, $EC00, $C0F5
DATA_0AF4EC:         dw $50FC, $8000, $50FC, $4000
DATA_0AF4F4:         dw $50FC, $0000, $50FC, $0400
DATA_0AF4FC:         dw $40F4, $5003, $8000, $5003
DATA_0AF504:         dw $C000, $5003, $0000, $5004
DATA_0AF50C:         dw $ED00, $C0F4, $50FC, $8000
DATA_0AF514:         dw $50FC, $4000, $50FC, $0000
DATA_0AF51C:         dw $50FC, $F600, $00ED, $0000
DATA_0AF524:         dw $00FC, $0000, $00FC, $0000
DATA_0AF52C:         dw $00FC, $0000, $FAFC, $00ED
DATA_0AF534:         dw $0000, $00FC, $0000, $00FC
DATA_0AF53C:         dw $0000, $00FC, $0000, $04FC
DATA_0AF544:         dw $00F4, $1004, $00FF, $0004
DATA_0AF54C:         dw $0000, $3004, $0000, $7004
DATA_0AF554:         dw $00FF, $F004, $0000, $D004
DATA_0AF55C:         dw $00FF, $9004, $EC00, $00F4
DATA_0AF564:         dw $10FC, $00FF, $00FC, $0000
DATA_0AF56C:         dw $30FC, $0000, $70FC, $00FF
DATA_0AF574:         dw $F0FC, $0000, $D0FC, $00FF
DATA_0AF57C:         dw $90FC, $FD00, $00F4, $1004
DATA_0AF584:         dw $00FF, $0004, $0000, $3004
DATA_0AF58C:         dw $0000, $7004, $00FF, $F004
DATA_0AF594:         dw $0000, $D004, $00FF, $9004
DATA_0AF59C:         dw $F300, $00F4, $10FC, $00FF
DATA_0AF5A4:         dw $00FC, $0000, $30FC, $0000
DATA_0AF5AC:         dw $70FC, $00FF, $F0FC, $0000
DATA_0AF5B4:         dw $D0FC, $00FF, $90FC, $F600
DATA_0AF5BC:         dw $10ED, $00FF, $00FC, $0000
DATA_0AF5C4:         dw $30FC, $0000, $70FC, $00FF
DATA_0AF5CC:         dw $F0FC, $0000, $D0FC, $00FF
DATA_0AF5D4:         dw $90FC, $0000, $FAFC, $F0ED
DATA_0AF5DC:         dw $0000, $00FC, $0000, $D0FC
DATA_0AF5E4:         dw $00FF, $90FC, $0000, $10FC
DATA_0AF5EC:         dw $00FF, $30FC, $0000, $70FC
DATA_0AF5F4:         dw $00FF, $00FC, $4000, $4100
DATA_0AF5FC:         dw $4200, $4300, $4200, $4100
DATA_0AF604:         dw $4000, $7400, $7300, $7200
DATA_0AF60C:         dw $7100, $7000, $6F00, $6E00
DATA_0AF614:         dw $6E00, $6D00, $6E00, $6D00
DATA_0AF61C:         dw $6C00, $0000, $0540, $0202
DATA_0AF624:         dw $9002, $9100, $9200, $9300
DATA_0AF62C:         dw $9200, $9100, $8B00, $8A00
DATA_0AF634:         dw $8900, $8800, $8900, $8A00
DATA_0AF63C:         dw $8C00, $8D00, $8E00, $8F00
DATA_0AF644:         dw $8E00, $8D00, $3400, $3300
DATA_0AF64C:         dw $3200, $3100, $3000, $2F00
DATA_0AF654:         dw $2E00, $2D00, $2C00, $2B00
DATA_0AF65C:         dw $0000, $010C, $0101, $0402
DATA_0AF664:         dw $0201, $1101, $1200, $4800
DATA_0AF66C:         dw $4800, $4800, $7C00, $7900
DATA_0AF674:         dw $7B00, $7C00, $7A00, $7C00
DATA_0AF67C:         dw $2000, $1F00, $1E00, $0B00
DATA_0AF684:         dw $0A01, $0901, $0801, $0701
DATA_0AF68C:         dw $0601, $0501, $0401, $0301
DATA_0AF694:         dw $0201, $0101, $1D01, $1E00
DATA_0AF69C:         dw $1F00, $2000, $3200, $3800
DATA_0AF6A4:         dw $3900, $3A00, $1100, $1200
DATA_0AF6AC:         dw $1100, $1A00, $1B00, $1C00
DATA_0AF6B4:         dw $1C00, $1B00, $1A00, $1A00
DATA_0AF6BC:         dw $1A00, $3500, $3600, $3700
DATA_0AF6C4:         dw $3700, $3600, $3500, $3500
DATA_0AF6CC:         dw $3500, $3B00, $3C00, $3D00
DATA_0AF6D4:         dw $3E00, $3F00, $4D00, $4D00
DATA_0AF6DC:         dw $4D00, $4D00, $1700, $1700
DATA_0AF6E4:         dw $1700, $1700, $1600, $1600
DATA_0AF6EC:         dw $1600, $1600, $1600, $1600
DATA_0AF6F4:         dw $1600, $1600, $1500, $1500
DATA_0AF6FC:         dw $1500, $1500, $1500, $1500
DATA_0AF704:         dw $1600, $1600, $1600, $1600
DATA_0AF70C:         dw $1600, $1600, $1600, $1600
DATA_0AF714:         dw $1500, $1500, $1500, $1500
DATA_0AF71C:         dw $1500, $1500, $1600, $1600
DATA_0AF724:         dw $1600, $1600, $1600, $1600
DATA_0AF72C:         dw $1600, $1600, $1500, $1500
DATA_0AF734:         dw $1500, $1500, $1500, $1500
DATA_0AF73C:         dw $1700, $1700, $1700, $1700
DATA_0AF744:         dw $1700, $1700, $1700, $1700
DATA_0AF74C:         dw $4000, $4100, $4200, $4300
DATA_0AF754:         dw $4300, $4300, $4300, $4300
DATA_0AF75C:         dw $4300, $4300, $4300, $4300
DATA_0AF764:         dw $4300, $4300, $4300, $4300
DATA_0AF76C:         dw $4300, $4300, $4300, $4300
DATA_0AF774:         dw $4300, $4300, $4300, $4200
DATA_0AF77C:         dw $4100, $4000, $4600, $4600
DATA_0AF784:         dw $4600, $4600, $4600, $4600
DATA_0AF78C:         dw $4700, $4700, $4700, $4700
DATA_0AF794:         dw $4700, $4700, $4600, $4600
DATA_0AF79C:         dw $4600, $4600, $4600, $4600
DATA_0AF7A4:         dw $4D00, $4D00, $4D00, $4D00
DATA_0AF7AC:         dw $4D00, $4D00, $4400, $4400
DATA_0AF7B4:         dw $4400, $4400, $4400, $4400
DATA_0AF7BC:         dw $4500, $4500, $4500, $4500
DATA_0AF7C4:         dw $4500, $4500, $4400, $4400
DATA_0AF7CC:         dw $4400, $4400, $4400, $4400
DATA_0AF7D4:         dw $2900, $3503, $A819, $0000
DATA_0AF7DC:         dw $0800, $7400, $0000, $0000
DATA_0AF7E4:         dw $0075, $0400, $0203, $0202
DATA_0AF7EC:         dw $0001, $0000, $0000, $0000
DATA_0AF7F4:         dw $0000, $0400, $0203, $0202
DATA_0AF7FC:         dw $0001, $0000, $0000, $0000
DATA_0AF804:         dw $0000, $0400, $0203, $0202
DATA_0AF80C:         dw $0001, $0000, $0000, $0000
DATA_0AF814:         dw $0000, $0400, $0203, $0202
DATA_0AF81C:         dw $0001, $0000, $0000, $0000
DATA_0AF824:         dw $0000, $0400, $0203, $0202
DATA_0AF82C:         dw $0001, $0000, $0000, $0000
DATA_0AF834:         dw $0000, $0400, $0203, $0202
DATA_0AF83C:         dw $0001, $0000, $0000, $0000
DATA_0AF844:         dw $0000, $0400, $0203, $0202
DATA_0AF84C:         dw $0001, $0000, $0000, $0000
DATA_0AF854:         dw $0000, $0400, $0203, $0202
DATA_0AF85C:         dw $0001, $0000, $0000, $0000
DATA_0AF864:         dw $0000, $0400, $0203, $0202
DATA_0AF86C:         dw $0001, $0000, $0000, $0000
DATA_0AF874:         dw $0000, $0400, $0203, $0202
DATA_0AF87C:         dw $0001, $0000, $0000, $0000
DATA_0AF884:         dw $0000, $0600, $0405, $0303
DATA_0AF88C:         dw $0102, $0101, $0000, $0000
DATA_0AF894:         dw $0000, $0600, $0405, $0303
DATA_0AF89C:         dw $0102, $0101, $0000, $0000
DATA_0AF8A4:         dw $0000, $0600, $0405, $0303
DATA_0AF8AC:         dw $0102, $0101, $0000, $0000
DATA_0AF8B4:         dw $0000, $0600, $0405, $0303
DATA_0AF8BC:         dw $0102, $0101, $0000, $0000
DATA_0AF8C4:         dw $0000, $0600, $0405, $0303
DATA_0AF8CC:         dw $0102, $0101, $0000, $0000
DATA_0AF8D4:         dw $0000, $0600, $0405, $0303
DATA_0AF8DC:         dw $0102, $0101, $0000, $0000
DATA_0AF8E4:         dw $0000, $0600, $0405, $0303
DATA_0AF8EC:         dw $0102, $0101, $0000, $0000
DATA_0AF8F4:         dw $0000, $0600, $0405, $0303
DATA_0AF8FC:         dw $0102, $0101, $0000, $0000
DATA_0AF904:         dw $0000, $0600, $0405, $0303
DATA_0AF90C:         dw $0102, $0101, $0000, $0000
DATA_0AF914:         dw $0000, $0600, $0405, $0303
DATA_0AF91C:         dw $0102, $0101, $0000, $0000
DATA_0AF924:         dw $0000, $0100, $0202, $0101
DATA_0AF92C:         dw $0101, $0101, $0000, $0000
DATA_0AF934:         dw $0000, $0100, $0202, $0101
DATA_0AF93C:         dw $0101, $0101, $0000, $0000
DATA_0AF944:         dw $0000, $0100, $0202, $0101
DATA_0AF94C:         dw $0101, $0101, $0000, $0000
DATA_0AF954:         dw $0000, $0100, $0202, $0101
DATA_0AF95C:         dw $0101, $0101, $0000, $0000
DATA_0AF964:         dw $0000, $0100, $0202, $0101
DATA_0AF96C:         dw $0101, $0101, $0000, $0000
DATA_0AF974:         dw $0000, $0100, $0202, $0101
DATA_0AF97C:         dw $0101, $0101, $0000, $0000
DATA_0AF984:         dw $0000, $0100, $0202, $0101
DATA_0AF98C:         dw $0101, $0101, $0000, $0000
DATA_0AF994:         dw $0000, $0100, $0202, $0101
DATA_0AF99C:         dw $0101, $0101, $0000, $0000
DATA_0AF9A4:         dw $0000, $0100, $0202, $0101
DATA_0AF9AC:         dw $0101, $0101, $0000, $0000
DATA_0AF9B4:         dw $0000, $0100, $0202, $0101
DATA_0AF9BC:         dw $0101, $0101, $0000, $0000
DATA_0AF9C4:         dw $0000, $0100, $0302, $0202
DATA_0AF9CC:         dw $0202, $0101, $0000, $0000
DATA_0AF9D4:         dw $0000, $0100, $0302, $0202
DATA_0AF9DC:         dw $0202, $0101, $0000, $0000
DATA_0AF9E4:         dw $0000, $0100, $0302, $0202
DATA_0AF9EC:         dw $0202, $0101, $0000, $0000
DATA_0AF9F4:         dw $0000, $0100, $0302, $0202
DATA_0AF9FC:         dw $0202, $0101, $0000, $0000
DATA_0AFA04:         dw $0000, $0100, $0302, $0202
DATA_0AFA0C:         dw $0202, $0101, $0000, $0000
DATA_0AFA14:         dw $0000, $0100, $0302, $0202
DATA_0AFA1C:         dw $0202, $0101, $0000, $0000
DATA_0AFA24:         dw $0000, $0100, $0302, $0202
DATA_0AFA2C:         dw $0202, $0101, $0000, $0000
DATA_0AFA34:         dw $0000, $0100, $0302, $0202
DATA_0AFA3C:         dw $0202, $0101, $0000, $0000
DATA_0AFA44:         dw $0000, $0100, $0302, $0202
DATA_0AFA4C:         dw $0202, $0101, $0000, $0000
DATA_0AFA54:         dw $0000, $0100, $0302, $0202
DATA_0AFA5C:         dw $0202, $0101, $0000, $0000
DATA_0AFA64:         dw $0000, $0000, $A000, $4000
DATA_0AFA6C:         dw $4001, $A001, $E000, $0101
DATA_0AFA74:         dw $0200, $0300, $0400, $0500
DATA_0AFA7C:         dw $0900, $0A00, $0B00, $0C00
DATA_0AFA84:         dw $1000, $4E00, $4F00, $5000
DATA_0AFA8C:         dw $5100, $5200, $4E00, $4F00
DATA_0AFA94:         dw $5000, $5100, $5200, $AD00
DATA_0AFA9C:         dw $AE00, $AF00, $B000, $B100
DATA_0AFAA4:         dw $AD00, $AE00, $AF00, $B000
DATA_0AFAAC:         dw $B100, $C800, $C900, $CA00
DATA_0AFAB4:         dw $CB00, $CC00, $C800, $C900
DATA_0AFABC:         dw $CA00, $CB00, $CC00, $BA00
DATA_0AFAC4:         dw $BB00, $BC00, $BD00, $BE00
DATA_0AFACC:         dw $BA00, $BB00, $BC00, $BD00
DATA_0AFAD4:         dw $BE00, $D500, $D600, $D700
DATA_0AFADC:         dw $D800, $D900, $D500, $D600
DATA_0AFAE4:         dw $D700, $D800, $D900, $B800
DATA_0AFAEC:         dw $B900, $B800, $B700, $B800
DATA_0AFAF4:         dw $B900, $B800, $B700, $B600
DATA_0AFAFC:         dw $B500, $B400, $B300, $B200
DATA_0AFB04:         dw $A400, $A500, $A600, $A700
DATA_0AFB0C:         dw $A800, $A900, $AA00, $AB00
DATA_0AFB14:         dw $AC00, $AB00, $AA00, $AB00
DATA_0AFB1C:         dw $AC00, $AB00, $D300, $D400
DATA_0AFB24:         dw $D300, $D200, $D300, $D400
DATA_0AFB2C:         dw $D300, $D200, $D100, $D000
DATA_0AFB34:         dw $CF00, $CE00, $CD00, $BF00
DATA_0AFB3C:         dw $C000, $C100, $C200, $C300
DATA_0AFB44:         dw $C400, $C500, $C600, $C700
DATA_0AFB4C:         dw $C600, $C500, $C600, $C700
DATA_0AFB54:         dw $C600, $2000, $0414, $0410
DATA_0AFB5C:         dw $0713, $0303, $0303, $0303
DATA_0AFB64:         dw $0404, $0404, $0404, $0804
DATA_0AFB6C:         dw $0411, $0408, $2011, $40A0
DATA_0AFB74:         dw $2080, $2080, $40A0, $00E0
DATA_0AFB7C:         dw $0004, $E000, $FC00, $0000
DATA_0AFB84:         dw $00E0, $00FC, $0000, $0000
DATA_0AFB8C:         dw $0400, $D4D0, $D402, $D002
DATA_0AFB94:         dw $FD2C, $02D4, $2CD0, $D4FD
DATA_0AFB9C:         dw $0002, $0000, $FC00, $D4F0
DATA_0AFBA4:         dw $2C02, $F0FD, $FD2C, $FD2C
DATA_0AFBAC:         dw $2CF0, $2CFD, $00FD, $0000
DATA_0AFBB4:         dw $FC00, $D4F0, $2C02, $F0FD
DATA_0AFBBC:         dw $FD2C, $FD2C, $2CF0, $2CFD
DATA_0AFBC4:         dw $00FD, $0000, $0000, $8000
DATA_0AFBCC:         dw $0001, $0000, $FE80, $0000
DATA_0AFBD4:         dw $8000, $00FE, $4000, $0000
DATA_0AFBDC:         dw $0180, $1020, $1001, $2001
DATA_0AFBE4:         dw $FEF0, $0110, $F020, $10FE
DATA_0AFBEC:         dw $C001, $0000, $FE80, $10E0
DATA_0AFBF4:         dw $F001, $E0FE, $FEF0, $FEF0
DATA_0AFBFC:         dw $F0E0, $F0FE, $C0FE, $0000
DATA_0AFC04:         dw $FE80, $10E0, $F001, $E0FE
DATA_0AFC0C:         dw $FEF0, $FEF0, $F0E0, $F0FE
DATA_0AFC14:         dw $A0FE, $C060, $FF60, $F9FC
DATA_0AFC1C:         dw $0700, $0103, $0000, $80C0
DATA_0AFC24:         dw $0340, $0C02, $0308, $0C01
DATA_0AFC2C:         dw $0004, $0302, $0001, $0301
DATA_0AFC34:         dw $0202, $0500, $A000, $0400
DATA_0AFC3C:         dw $4000, $8001, $0400, $1A01
DATA_0AFC44:         dw $0000, $4101, $1800, $4000
DATA_0AFC4C:         dw $A001, $4000, $A000, $2000
DATA_0AFC54:         dw $4100, $1A00, $0100, $1A00
DATA_0AFC5C:         dw $1800, $E000, $8001, $0001
DATA_0AFC64:         dw $0020, $005B, $0058, $0201
DATA_0AFC6C:         dw $A500, $2100, $0400, $0080
DATA_0AFC74:         dw $011E, $0006, $A002, $8000
DATA_0AFC7C:         dw $2000, $1A00, $0200, $0100
DATA_0AFC84:         dw $0100, $0400, $1A00, $1800
DATA_0AFC8C:         dw $0200, $A000, $0800, $0400
DATA_0AFC94:         dw $0400, $0000, $A001, $2000
DATA_0AFC9C:         dw $8000, $1A00, $0100, $0200
DATA_0AFCA4:         dw $0000, $4001, $1A00, $0200
DATA_0AFCAC:         dw $1800, $A000, $0400, $0800
DATA_0AFCB4:         dw $4000, $0100, $0400, $0802
DATA_0AFCBC:         dw $0801, $0401, $1002, $0A05
DATA_0AFCC4:         dw $0804, $0603, $0402, $0202
DATA_0AFCCC:         dw $0101, $0001, $3000, $2C0D
DATA_0AFCD4:         dw $280C, $240B, $200A, $1C09
DATA_0AFCDC:         dw $1808, $1407, $1906, $231E
DATA_0AFCE4:         dw $2D28, $1E37, $1D01, $2101
DATA_0AFCEC:         dw $2001, $1F01, $2001, $1C01
DATA_0AFCF4:         dw $1B01, $1A01, $1901, $1801
DATA_0AFCFC:         dw $1701, $1801, $0401, $0204
DATA_0AFD04:         dw $0204, $0204, $0204, $FA04
DATA_0AFD0C:         dw $F404, $FE04, $FE04, $FE04
DATA_0AFD14:         dw $FE04, $FC04, $FE04, $0204
DATA_0AFD1C:         dw $0A04, $0804, $0604, $0404
DATA_0AFD24:         dw $0204, $0204, $0204, $0204
DATA_0AFD2C:         dw $0204, $0204, $0204, $FA04
DATA_0AFD34:         dw $0004, $FE00, $FE04, $FC04
DATA_0AFD3C:         dw $FA04, $F804, $F604, $FE04
DATA_0AFD44:         dw $FE04, $0404, $0204, $FA04
DATA_0AFD4C:         dw $FE04, $A104, $0060, $0000
DATA_0AFD54:         dw $40E1, $0000, $8100, $0060
DATA_0AFD5C:         dw $0000, $0081, $0000, $A100
DATA_0AFD64:         dw $0140, $0116, $0061, $1601
DATA_0AFD6C:         dw $2101, $0160, $0116, $6041
DATA_0AFD74:         dw $1601, $6101, $0160, $0116
DATA_0AFD7C:         dw $0081, $2201, $8101, $0100
DATA_0AFD84:         dw $0123, $0081, $2401, $0001
DATA_0AFD8C:         dw $2020, $C020, $8040, $0800
DATA_0AFD94:         dw $08C0, $01C0, $0000, $0000
DATA_0AFD9C:         dw $0200, $0080, $0000, $0000
DATA_0AFDA4:         dw $0000, $0000, $0000, $0008
DATA_0AFDAC:         dw $0800, $0010, $0000, $0008
DATA_0AFDB4:         dw $0800, $0008, $0100, $0100
DATA_0AFDBC:         dw $0001, $FF01, $FF01, $FF00
DATA_0AFDC4:         dw $00FF, $01FF, $00FF, $0080
DATA_0AFDCC:         dw $6040, $6020, $A0C0, $A0E0
DATA_0AFDD4:         dw $6040, $6020, $4080, $1020
DATA_0AFDDC:         dw $0408, $0102, $0808, $0808
DATA_0AFDE4:         dw $0808, $0808, $0808, $0808
DATA_0AFDEC:         dw $0808, $0808, $0000, $0000
DATA_0AFDF4:         dw $0201, $0804, $2010, $8040
DATA_0AFDFC:         dw $0000, $0000, $0408, $0102
DATA_0AFE04:         dw $0000, $0000, $0000, $0000
DATA_0AFE0C:         dw $4080, $1020, $0000, $0000
DATA_0AFE14:         dw $00FF, $0000, $0808, $0808
DATA_0AFE1C:         dw $00FF, $0000, $0808, $0808
DATA_0AFE24:         dw $080F, $0808, $0808, $0808
DATA_0AFE2C:         dw $08F8, $0808, $0000, $0000
DATA_0AFE34:         dw $08FF, $0808

; freespace
DATA_0AFE39:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE41:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE49:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE51:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE59:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE61:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE69:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE71:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE79:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE81:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE89:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE91:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFE99:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEA1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEA9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEB1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEB9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEC1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEC9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFED1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFED9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEE1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEE9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEF1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFEF9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF01:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF09:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF11:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF19:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF21:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF29:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF31:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF39:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF41:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF49:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF51:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF59:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF61:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF69:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF71:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF79:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF81:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF89:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF91:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFF99:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFA1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFA9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFB1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFB9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFC1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFC9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFD1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFD9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFE1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFE9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFF1:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0AFFF9:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF
