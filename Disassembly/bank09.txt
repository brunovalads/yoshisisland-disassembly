; r1 = camera x + offset (288 right or 48 left)
; r2 = camera y - 32
; r3 = camera y + offset (272 down or 32 up)
; r4 = camera x - 48

org $098000

CODE_098000:         cache              ;
CODE_098001:         from r1            ;
CODE_098002:         asr                ;\
CODE_098003:         asr                ; |
CODE_098004:         asr                ; |
CODE_098005:         to r1              ;
CODE_098006:         asr                ; |
CODE_098007:         from r2            ;
CODE_098008:         asr                ; |
CODE_098009:         asr                ; |
CODE_09800A:         asr                ; |
CODE_09800B:         to r2              ;
CODE_09800C:         asr                ; | divide camera positions by 16
CODE_09800D:         from r3            ;
CODE_09800E:         asr                ; |
CODE_09800F:         asr                ; |
CODE_098010:         asr                ; |
CODE_098011:         to r3              ;
CODE_098012:         asr                ; |
CODE_098013:         from r4            ;
CODE_098014:         asr                ; |
CODE_098015:         asr                ; |
CODE_098016:         asr                ; |
CODE_098017:         to r4              ;
CODE_098018:         asr                ;/
CODE_098019:         ibt   r5,#FFFF     ;
CODE_09801B:         iwt   r6,#01FF     ;
CODE_09801E:         ibt   r7,#0016     ;
CODE_098020:         ibt   r13,#0014    ;
CODE_098022:         ibt   r8,#0000     ;
CODE_098024:         iwt   r9,#28CA     ;
CODE_098027:         iwt   r10,#27CE    ; #$27CE into r10 (first word is sprite ID)
CODE_09802A:         lm    r0,(2602)    ;\ set the value in $702602 as the ROM data bank
CODE_09802E:         romb               ;/
CODE_098030:         lm    r14,(2600)   ; r14 = ROM address

; loop begins here
CODE_098034:         ldb   (r9)         ;\
CODE_098036:         dec   r0           ; |
CODE_098037:         bmi CODE_098041    ; |
CODE_098039:         getb               ; | loop until <= 0
CODE_09803A:         with r14           ;
CODE_09803B:         add   #03          ; | in 7028CA table
CODE_09803D:         inc   r8           ; |
CODE_09803E:         bra CODE_098034    ; |

CODE_098040:         inc   r9           ;/

CODE_098041:         inc   r14          ;
CODE_098042:         to r12             ;
CODE_098043:         getbh              ;
CODE_098045:         from r12           ;
CODE_098046:         sub   r5           ; r12 - r5 -> r0
CODE_098047:         beq CODE_098080    ;
CODE_098049:         inc   r14          ;
CODE_09804A:         from r12           ;
CODE_09804B:         and   r6           ;\ sprite ID -> $7027CE
CODE_09804C:         stw   (r10)        ;/
CODE_09804D:         to r11             ;
CODE_09804E:         getb               ; r11 = passed in table,x
CODE_09804F:         inc   r14          ; inc r14
CODE_098050:         from r12           ;
CODE_098051:         hib                ; load high byte of r12 to r0
CODE_098052:         lsr                ; multiply r0 by 2
CODE_098053:         move  r12,r0       ; move r0 into r12
CODE_098055:         sub   r3           ; r0 - ((camera y + offset)/16) -> r0
CODE_098056:         bne CODE_098060    ;\
CODE_098058:         from r11           ;
CODE_098059:         sub   r4           ;/ r11 - ((camera x - 48)/16) -> r0
CODE_09805A:         bmi CODE_09805F    ;\
CODE_09805C:         sub   r7           ;/ r0 - r7 -> r0
CODE_09805D:         bmi CODE_09806B    ;\
CODE_09805F:         from r11           ;
CODE_098060:         sub   r1           ;/ r11 - ((camera x + offset)/16) -> r0
CODE_098061:         bne CODE_09807C    ;\
CODE_098063:         from r12           ;
CODE_098064:         sub   r2           ;/ r12 - ((camera y - 32)/16) -> r0
CODE_098065:         bmi CODE_09807C    ;\
CODE_098067:         sub   r13          ;/ r0 - r13 -> r0
CODE_098068:         bpl CODE_09807C    ;\
CODE_09806A:         nop                ;/
CODE_09806B:         inc   r10          ;\ \
CODE_09806C:         inc   r10          ; | | x tile position -> $7027D0
CODE_09806D:         from r11           ;
CODE_09806E:         stw   (r10)        ; |/
CODE_09806F:         inc   r10          ; |\
CODE_098070:         inc   r10          ; | | y tile position -> $7027D2
CODE_098071:         from r12           ;
CODE_098072:         stw   (r10)        ; |/
CODE_098073:         inc   r10          ; |\
CODE_098074:         inc   r10          ; | | y tile position -> $7027D4
CODE_098075:         from r8            ;
CODE_098076:         stw   (r10)        ; |/
CODE_098077:         inc   r10          ; |\
CODE_098078:         inc   r10          ; | | r5 -> $7028CA + r8
CODE_098079:         from r5            ;
CODE_09807A:         stb   (r9)         ;/ /
CODE_09807C:         inc   r8           ;
CODE_09807D:         bra CODE_098034    ;\ loop back up

CODE_09807F:         inc   r9           ;/

CODE_098080:         from r5            ;
CODE_098081:         stw   (r10)        ; r5 -> r10
CODE_098082:         stop               ;
CODE_098083:         nop                ;

CODE_098084:         iwt   r1,#10E2     ;
CODE_098087:         iwt   r2,#1182     ;
CODE_09808A:         iwt   r3,#1B56     ;
CODE_09808D:         iwt   r4,#0F00     ;
CODE_098090:         iwt   r5,#1CD6     ;
CODE_098093:         cache              ;
CODE_098094:         ibt   r12,#0018    ;
CODE_098096:         move  r13,r15      ;
CODE_098098:         ldb   (r4)         ;
CODE_09809A:         with r4            ;
CODE_09809B:         add   #04          ;
CODE_09809D:         dec   r0           ;
CODE_09809E:         bpl CODE_0980B4    ;
CODE_0980A0:         inc   r0           ;
CODE_0980A1:         move  r6,r12       ;
CODE_0980A3:         stb   (r6)         ;
CODE_0980A5:         ibt   r0,#0004     ;
CODE_0980A7:         with r1            ;
CODE_0980A8:         add   r0           ;
CODE_0980A9:         with r2            ;
CODE_0980AA:         add   r0           ;
CODE_0980AB:         with r3            ;
CODE_0980AC:         add   r0           ;
CODE_0980AD:         with r5            ;
CODE_0980AE:         add   r0           ;
CODE_0980AF:         loop               ;
CODE_0980B0:         nop                ;
CODE_0980B1:         bra CODE_0980D7    ;

CODE_0980B3:         nop                ;

CODE_0980B4:         sub   #0E          ;
CODE_0980B6:         bcs CODE_0980BA    ;
CODE_0980B8:         inc   r0           ;
CODE_0980B9:         sub   r0           ;
CODE_0980BA:         move  r6,r12       ;
CODE_0980BC:         stb   (r6)         ;
CODE_0980BE:         to r6              ;
CODE_0980BF:         ldw   (r1)         ;
CODE_0980C0:         with r1            ;
CODE_0980C1:         add   #04          ;
CODE_0980C3:         ldw   (r3)         ;
CODE_0980C4:         inc   r3           ;
CODE_0980C5:         inc   r3           ;
CODE_0980C6:         add   r6           ;
CODE_0980C7:         stw   (r5)         ;
CODE_0980C8:         inc   r5           ;
CODE_0980C9:         inc   r5           ;
CODE_0980CA:         to r6              ;
CODE_0980CB:         ldw   (r2)         ;
CODE_0980CC:         with r2            ;
CODE_0980CD:         add   #04          ;
CODE_0980CF:         ldw   (r3)         ;
CODE_0980D0:         inc   r3           ;
CODE_0980D1:         inc   r3           ;
CODE_0980D2:         add   r6           ;
CODE_0980D3:         stw   (r5)         ;
CODE_0980D4:         inc   r5           ;
CODE_0980D5:         loop               ;
CODE_0980D6:         inc   r5           ;
CODE_0980D7:         lms   r14,(011C)   ;
CODE_0980DA:         lms   r2,(011E)    ;
CODE_0980DD:         lms   r3,(0120)    ;
CODE_0980E0:         lms   r4,(0122)    ;
CODE_0980E3:         iwt   r5,#1CD6     ;
CODE_0980E6:         iwt   r6,#1BB6     ;
CODE_0980E9:         iwt   r7,#1C16     ;
CODE_0980EC:         iwt   r8,#17C2     ;
CODE_0980EF:         iwt   r0,#1D36     ;
CODE_0980F2:         sms   (003E),r0    ;
CODE_0980F5:         ibt   r12,#0018    ;
CODE_0980F7:         move  r13,r15      ;
CODE_0980F9:         move  r0,r12       ;
CODE_0980FB:         ldb   (r0)         ;
CODE_0980FD:         sub   #03          ;
CODE_0980FF:         bcs CODE_09810E    ;
CODE_098101:         nop                ;
CODE_098102:         ibt   r0,#0004     ;
CODE_098104:         with r5            ;
CODE_098105:         add   r0           ;
CODE_098106:         with r6            ;
CODE_098107:         add   r0           ;
CODE_098108:         with r7            ;
CODE_098109:         add   r0           ;
CODE_09810A:         inc   r8           ;
CODE_09810B:         bra CODE_09815B    ;

CODE_09810D:         inc   r8           ;

CODE_09810E:         to r9              ;
CODE_09810F:         ldw   (r6)         ;
CODE_098110:         inc   r6           ;
CODE_098111:         inc   r6           ;
CODE_098112:         to r10             ;
CODE_098113:         ldw   (r6)         ;
CODE_098114:         inc   r6           ;
CODE_098115:         inc   r6           ;
CODE_098116:         ldw   (r5)         ;
CODE_098117:         inc   r5           ;
CODE_098118:         inc   r5           ;
CODE_098119:         sub   r14          ;
CODE_09811A:         stw   (r7)         ;
CODE_09811B:         inc   r7           ;
CODE_09811C:         inc   r7           ;
CODE_09811D:         moves r11,r0       ;
CODE_09811F:         bpl CODE_098124    ;
CODE_098121:         sub   r0           ;
CODE_098122:         inc   r0           ;
CODE_098123:         inc   r0           ;
CODE_098124:         stb   (r8)         ;
CODE_098126:         inc   r8           ;
CODE_098127:         ldw   (r5)         ;
CODE_098128:         inc   r5           ;
CODE_098129:         inc   r5           ;
CODE_09812A:         sub   r2           ;
CODE_09812B:         stw   (r7)         ;
CODE_09812C:         inc   r7           ;
CODE_09812D:         inc   r7           ;
CODE_09812E:         moves r1,r0        ;
CODE_098130:         bpl CODE_098135    ;
CODE_098132:         sub   r0           ;
CODE_098133:         inc   r0           ;
CODE_098134:         inc   r0           ;
CODE_098135:         stb   (r8)         ;
CODE_098137:         from r1            ;
CODE_098138:         add   r10          ;
CODE_098139:         add   r4           ;
CODE_09813A:         bmi CODE_09815B    ;
CODE_09813C:         inc   r8           ;
CODE_09813D:         sub   r10          ;
CODE_09813E:         sub   r10          ;
CODE_09813F:         sub   r4           ;
CODE_098140:         sub   r4           ;
CODE_098141:         bpl CODE_09815C    ;
CODE_098143:         sub   r0           ;
CODE_098144:         from r11           ;
CODE_098145:         add   r9           ;
CODE_098146:         add   r3           ;
CODE_098147:         bmi CODE_09815B    ;
CODE_098149:         sub   r9           ;
CODE_09814A:         sub   r9           ;
CODE_09814B:         sub   r3           ;
CODE_09814C:         sub   r3           ;
CODE_09814D:         bpl CODE_09815C    ;
CODE_09814F:         sub   r0           ;
CODE_098150:         lms   r0,(00AC)    ;
CODE_098153:         sub   #06          ;
CODE_098155:         bcs CODE_09815C    ;
CODE_098157:         sub   r0           ;
CODE_098158:         bra CODE_09815C    ;

CODE_09815A:         dec   r0           ;

CODE_09815B:         sub   r0           ;
CODE_09815C:         lms   r1,(003E)    ;
CODE_09815F:         stb   (r1)         ;
CODE_098161:         inc   r8           ;
CODE_098162:         with r1            ;
CODE_098163:         add   #04          ;
CODE_098165:         sms   (003E),r1    ;
CODE_098168:         loop               ;
CODE_098169:         inc   r8           ;
CODE_09816A:         iwt   r1,#0FA1     ;
CODE_09816D:         iwt   r5,#1CD6     ;
CODE_098170:         iwt   r6,#1BB6     ;
CODE_098173:         iwt   r7,#1C76     ;
CODE_098176:         iwt   r9,#1D36     ;
CODE_098179:         iwt   r10,#1D37    ;
CODE_09817C:         ibt   r12,#0018    ;
CODE_09817E:         move  r0,r12       ;
CODE_098180:         ldb   (r0)         ;
CODE_098182:         dec   r0           ;
CODE_098183:         bmi CODE_098193    ;
CODE_098185:         nop                ;
CODE_098186:         ldb   (r9)         ;
CODE_098188:         sub   #00          ;
CODE_09818A:         bne CODE_098193    ;
CODE_09818C:         nop                ;
CODE_09818D:         ldw   (r1)         ;
CODE_09818E:         and   #04          ;
CODE_098190:         bne CODE_09819F    ;
CODE_098192:         nop                ;
CODE_098193:         ibt   r0,#0004     ;
CODE_098195:         with r5            ;
CODE_098196:         add   r0           ;
CODE_098197:         with r6            ;
CODE_098198:         add   r0           ;
CODE_098199:         with r7            ;
CODE_09819A:         add   r0           ;
CODE_09819B:         iwt   r15,#8263    ;
CODE_09819E:         nop                ;
CODE_09819F:         to r14             ;
CODE_0981A0:         ldw   (r5)         ;
CODE_0981A1:         inc   r5           ;
CODE_0981A2:         inc   r5           ;
CODE_0981A3:         to r2              ;
CODE_0981A4:         ldw   (r5)         ;
CODE_0981A5:         inc   r5           ;
CODE_0981A6:         inc   r5           ;
CODE_0981A7:         to r3              ;
CODE_0981A8:         ldw   (r6)         ;
CODE_0981A9:         inc   r6           ;
CODE_0981AA:         inc   r6           ;
CODE_0981AB:         to r4              ;
CODE_0981AC:         ldw   (r6)         ;
CODE_0981AD:         inc   r6           ;
CODE_0981AE:         inc   r6           ;
CODE_0981AF:         sms   (0042),r1    ;
CODE_0981B2:         sms   (004A),r5    ;
CODE_0981B5:         sms   (004C),r6    ;
CODE_0981B8:         sms   (004E),r7    ;
CODE_0981BB:         sms   (0052),r9    ;
CODE_0981BE:         sms   (0054),r10   ;
CODE_0981C1:         sms   (0058),r12   ;
CODE_0981C4:         iwt   r1,#0FA1     ;
CODE_0981C7:         to r11             ;
CODE_0981C8:         ldb   (r10)        ;
CODE_0981CA:         inc   r11          ;
CODE_0981CB:         move  r10,r12      ;
CODE_0981CD:         ibt   r12,#0018    ;
CODE_0981CF:         iwt   r13,#81D3    ;
CODE_0981D2:         from r10           ;
CODE_0981D3:         sub   r11          ;
CODE_0981D4:         beq CODE_098241    ;
CODE_0981D6:         nop                ;
CODE_0981D7:         ldb   (r11)        ;
CODE_0981D9:         dec   r0           ;
CODE_0981DA:         bmi CODE_098241    ;
CODE_0981DC:         nop                ;
CODE_0981DD:         ibt   r0,#0018     ;
CODE_0981DF:         sub   r11          ;
CODE_0981E0:         add   r0           ;
CODE_0981E1:         add   r0           ;
CODE_0981E2:         move  r8,r0        ;
CODE_0981E4:         add   r1           ;
CODE_0981E5:         ldw   (r0)         ;
CODE_0981E6:         and   #02          ;
CODE_0981E8:         beq CODE_098241    ;
CODE_0981EA:         nop                ;
CODE_0981EB:         iwt   r0,#1CD6     ;
CODE_0981EE:         to r5              ;
CODE_0981EF:         add   r8           ;
CODE_0981F0:         iwt   r0,#1BB6     ;
CODE_0981F3:         to r6              ;
CODE_0981F4:         add   r8           ;
CODE_0981F5:         to r9              ;
CODE_0981F6:         ldw   (r6)         ;
CODE_0981F7:         ldw   (r5)         ;
CODE_0981F8:         sub   r14          ;
CODE_0981F9:         move  r7,r0        ;
CODE_0981FB:         add   r3           ;
CODE_0981FC:         add   r9           ;
CODE_0981FD:         bmi CODE_098241    ;
CODE_0981FF:         sub   r9           ;
CODE_098200:         sub   r9           ;
CODE_098201:         sub   r3           ;
CODE_098202:         sub   r3           ;
CODE_098203:         dec   r0           ;
CODE_098204:         bpl CODE_098241    ;
CODE_098206:         inc   r5           ;
CODE_098207:         inc   r5           ;
CODE_098208:         inc   r6           ;
CODE_098209:         inc   r6           ;
CODE_09820A:         to r9              ;
CODE_09820B:         ldw   (r6)         ;
CODE_09820C:         ldw   (r5)         ;
CODE_09820D:         sub   r2           ;
CODE_09820E:         move  r5,r0        ;
CODE_098210:         add   r4           ;
CODE_098211:         add   r9           ;
CODE_098212:         bmi CODE_098241    ;
CODE_098214:         sub   r9           ;
CODE_098215:         sub   r9           ;
CODE_098216:         sub   r4           ;
CODE_098217:         sub   r4           ;
CODE_098218:         dec   r0           ;
CODE_098219:         bpl CODE_098241    ;
CODE_09821B:         nop                ;
CODE_09821C:         lms   r0,(004E)    ;
CODE_09821F:         from r7            ;
CODE_098220:         stw   (r0)         ;
CODE_098221:         inc   r0           ;
CODE_098222:         inc   r0           ;
CODE_098223:         from r5            ;
CODE_098224:         stw   (r0)         ;
CODE_098225:         to r7              ;
CODE_098226:         add   #02          ;
CODE_098228:         lms   r9,(0052)    ;
CODE_09822B:         inc   r8           ;
CODE_09822C:         from r8            ;
CODE_09822D:         stb   (r9)         ;
CODE_09822F:         dec   r11          ;
CODE_098230:         bne CODE_098235    ;
CODE_098232:         dec   r11          ;
CODE_098233:         ibt   r11,#0017    ;
CODE_098235:         lms   r10,(0054)   ;
CODE_098238:         move  r0,r11       ;
CODE_09823A:         stb   (r10)        ;
CODE_09823C:         bra CODE_098256    ;

CODE_09823E:         lms   r1,(0042)    ;
CODE_098241:         dec   r11          ;
CODE_098242:         bne CODE_098247    ;
CODE_098244:         nop                ;
CODE_098245:         ibt   r11,#0018    ;
CODE_098247:         loop               ;
CODE_098248:         from r10           ;
CODE_098249:         lms   r0,(004E)    ;
CODE_09824C:         to r7              ;
CODE_09824D:         add   #04          ;
CODE_09824F:         lms   r9,(0052)    ;
CODE_098252:         lms   r10,(0054)   ;
CODE_098255:         lms   r1,(0042)    ;
CODE_098258:         lms   r5,(004A)    ;
CODE_09825B:         lms   r6,(004C)    ;
CODE_09825E:         lms   r12,(0058)   ;
CODE_098261:         ibt   r0,#0004     ;
CODE_098263:         with r1            ;
CODE_098264:         add   r0           ;
CODE_098265:         with r9            ;
CODE_098266:         add   r0           ;
CODE_098267:         with r10           ;
CODE_098268:         add   r0           ;
CODE_098269:         iwt   r13,#817F    ;
CODE_09826C:         loop               ;
CODE_09826D:         move  r0,r12       ;
CODE_09826F:         lms   r0,(01AE)    ;
CODE_098272:         sub   #00          ;
CODE_098274:         bne CODE_0982D9    ;
CODE_098276:         cache              ;
CODE_098277:         lms   r1,(015A)    ;
CODE_09827A:         lms   r2,(015C)    ;
CODE_09827D:         iwt   r5,#1CD6     ;
CODE_098280:         iwt   r6,#1BB6     ;
CODE_098283:         iwt   r7,#0FA0     ;
CODE_098286:         iwt   r8,#1040     ;
CODE_098289:         iwt   r11,#1D38    ;
CODE_09828C:         ibt   r14,#0040    ;
CODE_09828E:         ibt   r12,#0018    ;
CODE_098290:         iwt   r13,#8294    ;
CODE_098293:         move  r0,r12       ;
CODE_098295:         ldb   (r0)         ;
CODE_098297:         sub   #03          ;
CODE_098299:         bcc CODE_0982A1    ;
CODE_09829B:         nop                ;
CODE_09829C:         ldw   (r7)         ;
CODE_09829D:         and   r14          ;
CODE_09829E:         beq CODE_0982A9    ;
CODE_0982A0:         nop                ;
CODE_0982A1:         ibt   r0,#0004     ;
CODE_0982A3:         with r5            ;
CODE_0982A4:         add   r0           ;
CODE_0982A5:         with r6            ;
CODE_0982A6:         with  r6           ;
CODE_0982A6:         bra CODE_0982D0    ;

CODE_0982A8:         add   r0           ;
CODE_0982A9:         ldw   (r11)        ;
CODE_0982AA:         lsr                ;
CODE_0982AB:         bne CODE_0982A1    ;
CODE_0982AD:         to r9              ;
CODE_0982AE:         ldw   (r6)         ;
CODE_0982AF:         inc   r6           ;
CODE_0982B0:         inc   r6           ;
CODE_0982B1:         to r10             ;
CODE_0982B2:         ldw   (r6)         ;
CODE_0982B3:         inc   r6           ;
CODE_0982B4:         inc   r6           ;
CODE_0982B5:         ldw   (r5)         ;
CODE_0982B6:         inc   r5           ;
CODE_0982B7:         inc   r5           ;
CODE_0982B8:         to r3              ;
CODE_0982B9:         sub   r1           ;
CODE_0982BA:         ldw   (r5)         ;
CODE_0982BB:         inc   r5           ;
CODE_0982BC:         inc   r5           ;
CODE_0982BD:         to r4              ;
CODE_0982BE:         sub   r2           ;
CODE_0982BF:         from r4            ;
CODE_0982C0:         add   r10          ;
CODE_0982C1:         add   #0C          ;
CODE_0982C3:         bmi CODE_0982CE    ;
CODE_0982C5:         sub   r10          ;
CODE_0982C6:         sub   r10          ;
CODE_0982C7:         sub   #0C          ;
CODE_0982C9:         sub   #0C          ;
CODE_0982CB:         bmi CODE_0982DB    ;
CODE_0982CD:         from r3            ;
CODE_0982CE:         ibt   r0,#0004     ;
CODE_0982D0:         with r7            ;
CODE_0982D1:         add   r0           ;
CODE_0982D2:         with r8            ;
CODE_0982D3:         add   r0           ;
CODE_0982D4:         with r11           ;
CODE_0982D5:         add   r0           ;
CODE_0982D6:         loop               ;
CODE_0982D7:         move  r0,r12       ;
CODE_0982D9:         stop               ;
CODE_0982DA:         nop                ;

CODE_0982DB:         add   r9           ;
CODE_0982DC:         add   #0C          ;
CODE_0982DE:         bmi CODE_0982CE    ;
CODE_0982E0:         sub   r9           ;
CODE_0982E1:         sub   r9           ;
CODE_0982E2:         sub   #0C          ;
CODE_0982E4:         sub   #0C          ;
CODE_0982E6:         bpl CODE_0982CF    ;
CODE_0982E8:         ibt   r0,#0018     ;
CODE_0982EA:         sub   r12          ;
CODE_0982EB:         add   r0           ;
CODE_0982EC:         to r1              ;
CODE_0982ED:         add   r0           ;
CODE_0982EE:         inc   r1           ;
CODE_0982EF:         lms   r0,(0162)    ;
CODE_0982F2:         lms   r5,(0168)    ;
CODE_0982F5:         or    r5           ;
CODE_0982F6:         bne CODE_0982D9    ;
CODE_0982F8:         nop                ;
CODE_0982F9:         lms   r6,(0150)    ;
CODE_0982FC:         dec   r6           ;
CODE_0982FD:         bmi CODE_0982D9    ;
CODE_0982FF:         inc   r6           ;
CODE_098300:         lms   r0,(015E)    ;
CODE_098303:         dec   r0           ;
CODE_098304:         bpl CODE_09835D    ;
CODE_098306:         nop                ;
CODE_098307:         iwt   r0,#0EFF     ;
CODE_09830A:         to r5              ;
CODE_09830B:         add   r1           ;
CODE_09830C:         lms   r0,(0152)    ;
CODE_09830F:         lms   r2,(0154)    ;
CODE_098312:         or    r2           ;
CODE_098313:         beq CODE_09835D    ;
CODE_098315:         nop                ;
CODE_098316:         from r6            ;
CODE_098317:         lsr                ;
CODE_098318:         bcc CODE_09831E    ;
CODE_09831A:         inc   r6           ;
CODE_09831B:         sms   (0150),r6    ;
CODE_09831E:         sms   (0162),r1    ;
CODE_098321:         ldw   (r7)         ;
CODE_098322:         sex                ;
CODE_098323:         bpl CODE_098336    ;
CODE_098325:         sub   r0           ;
CODE_098326:         inc   r0           ;
CODE_098327:         sms   (015E),r0    ;
CODE_09832A:         ibt   r0,#0014     ;
CODE_09832C:         sms   (0160),r0    ;
CODE_09832F:         ibt   r0,#003C     ;
CODE_098331:         sms   (007A),r0    ;
CODE_098334:         stop               ;
CODE_098335:         nop                ;

CODE_098336:         sms   (0164),r3    ;
CODE_098339:         sms   (0166),r4    ;
CODE_09833C:         ibt   r0,#0008     ;
CODE_09833E:         stw   (r5)         ;
CODE_09833F:         inc   r7           ;
CODE_098340:         inc   r7           ;
CODE_098341:         ldw   (r7)         ;
CODE_098342:         add   r0           ;
CODE_098343:         bcs CODE_09835D    ;
CODE_098345:         add   r0           ;
CODE_098346:         add   r0           ;
CODE_098347:         iwt   r2,#8000     ;
CODE_09834A:         and   r2           ;
CODE_09834B:         or    r1           ;
CODE_09834C:         sms   (0168),r0    ;
CODE_09834F:         ldw   (r8)         ;
CODE_098350:         bic   #0C          ;
CODE_098352:         sbk                ;
CODE_098353:         swap               ;
CODE_098354:         bmi CODE_09835A    ;
CODE_098356:         sub   r0           ;
CODE_098357:         iwt   r0,#04B0     ;
CODE_09835A:         sms   (01EE),r0    ;
CODE_09835D:         stop               ;
CODE_09835E:         nop                ;

; copy yoshi to OAM buff
CODE_09835F:         ibt   r0,#004C     ;
CODE_098361:         romb               ;
CODE_098363:         move  r14,r14      ;
CODE_098365:         lms   r4,(0126)    ;
CODE_098368:         lms   r5,(0118)    ;
CODE_09836B:         ibt   r0,#0060     ;
CODE_09836D:         to r5              ;
CODE_09836E:         add   r5           ;
CODE_09836F:         iwt   r9,#0128     ;
CODE_098372:         ibt   r7,#0000     ;
CODE_098374:         cache              ;
CODE_098375:         move  r13,r15      ;
CODE_098377:         to r6              ;
CODE_098378:         getb               ;
CODE_098379:         inc   r14          ;
CODE_09837A:         from r6            ;
CODE_09837B:         lsr                ;
CODE_09837C:         lsr                ;
CODE_09837D:         lsr                ;
CODE_09837E:         lsr                ;
CODE_09837F:         to r11             ;
CODE_098380:         and   #02          ;
CODE_098382:         getb               ;
CODE_098383:         inc   r14          ;
CODE_098384:         sex                ;
CODE_098385:         ibt   r8,#0000     ;
CODE_098387:         dec   r3           ;
CODE_098388:         bpl CODE_098395    ;
CODE_09838A:         inc   r3           ;
CODE_09838B:         not                ;
CODE_09838C:         inc   r0           ;
CODE_09838D:         ibt   r8,#0040     ;
CODE_09838F:         dec   r11          ;
CODE_098390:         bpl CODE_098395    ;
CODE_098392:         inc   r11          ;
CODE_098393:         add   #08          ;
CODE_098395:         add   r1           ;
CODE_098396:         stw   (r5)         ;
CODE_098397:         inc   r5           ;
CODE_098398:         inc   r5           ;
CODE_098399:         getb               ;
CODE_09839A:         inc   r14          ;
CODE_09839B:         sex                ;
CODE_09839C:         add   r2           ;
CODE_09839D:         stw   (r5)         ;
CODE_09839E:         inc   r5           ;
CODE_09839F:         inc   r5           ;
CODE_0983A0:         iwt   r0,#00C0     ;
CODE_0983A3:         and   r6           ;
CODE_0983A4:         xor   r8           ;
CODE_0983A6:         or    r4           ;
CODE_0983A7:         lms   r10,(0124)   ;
CODE_0983AA:         or    r10          ;
CODE_0983AB:         swap               ;
CODE_0983AC:         or    r7           ;
CODE_0983AD:         inc   r7           ;
CODE_0983AE:         inc   r7           ;
CODE_0983AF:         stw   (r5)         ;
CODE_0983B0:         inc   r5           ;
CODE_0983B1:         inc   r5           ;
CODE_0983B2:         from r11           ;
CODE_0983B3:         stw   (r5)         ;
CODE_0983B4:         inc   r5           ;
CODE_0983B5:         inc   r5           ;
CODE_0983B6:         from r6            ;
CODE_0983B7:         and   #0F          ;
CODE_0983B9:         swap               ;
CODE_0983BA:         getbl              ;
CODE_0983BC:         inc   r14          ;
CODE_0983BD:         with r11           ;
CODE_0983BE:         and   #02          ;
CODE_0983C0:         beq CODE_0983DA    ;
CODE_0983C2:         nop                ;
CODE_0983C3:         iwt   r10,#0090    ;
CODE_0983C6:         cmp   r10          ;
CODE_0983C8:         bcs CODE_0983DA    ;
CODE_0983CA:         nop                ;
CODE_0983CB:         lms   r10,(0168)   ;
CODE_0983CE:         lms   r11,(0162)   ;
CODE_0983D1:         with r10           ;
CODE_0983D2:         or    r11          ;
CODE_0983D3:         bne CODE_0983DA    ;
CODE_0983D5:         nop                ;
CODE_0983D6:         iwt   r10,#0100    ;
CODE_0983D9:         add   r10          ;
CODE_0983DA:         iwt   r10,#07FF    ;
CODE_0983DD:         and   r10          ;
CODE_0983DE:         with r6            ;
CODE_0983DF:         and   #08          ;
CODE_0983E1:         ibt   r6,#0052     ;
CODE_0983E3:         beq CODE_0983EC    ;
CODE_0983E5:         nop                ;
CODE_0983E6:         iwt   r6,#8300     ;
CODE_0983E9:         add   r6           ;
CODE_0983EA:         ibt   r6,#0070     ;
CODE_0983EC:         add   r0           ;
CODE_0983ED:         add   r0           ;
CODE_0983EE:         add   r0           ;
CODE_0983EF:         add   r0           ;
CODE_0983F0:         add   r0           ;
CODE_0983F1:         stw   (r9)         ;
CODE_0983F2:         inc   r9           ;
CODE_0983F3:         inc   r9           ;
CODE_0983F4:         to r10             ;
CODE_0983F5:         hib                ;
CODE_0983F6:         from r6            ;
CODE_0983F7:         stb   (r9)         ;
CODE_0983F9:         inc   r9           ;
CODE_0983FA:         from r10           ;
CODE_0983FB:         add   #02          ;
CODE_0983FD:         stb   (r9)         ;
CODE_0983FF:         loop               ;
CODE_098400:         inc   r9           ;
CODE_098401:         lms   r0,(00AE)    ;
CODE_098404:         add   r0           ;
CODE_098405:         inc   r0           ;
CODE_098406:         to r15             ;
CODE_098407:         add   r15          ;
CODE_098408:         iwt   r15,#8431    ;
CODE_09840B:         nop                ;

DATA_09840C:         db $01, $1D, $86, $01, $01, $2D, $87, $01
DATA_098414:         db $01, $87, $87, $01, $01, $89, $87, $01
DATA_09841C:         db $01, $E1, $87, $01, $01, $E3, $87, $01
DATA_098424:         db $01, $E5, $87, $01, $01, $E7, $87, $01
DATA_09842C:         db $01, $E5, $87, $01, $01

CODE_098431:         iwt   r0,#0009     ;
CODE_098434:         romb               ;
CODE_098436:         lms   r0,(015E)    ;
CODE_098439:         iwt   r14,#853D    ;
CODE_09843C:         to r14             ;
CODE_09843D:         add   r14          ;
CODE_09843E:         to r10             ;
CODE_09843F:         getb               ;
CODE_098440:         lms   r5,(0118)    ;
CODE_098443:         with r4            ;
CODE_098444:         swap               ;
CODE_098445:         lms   r11,(0150)   ;
CODE_098448:         dec   r11          ;
CODE_098449:         bmi CODE_098473    ;
CODE_09844B:         nop                ;
CODE_09844C:         from r11           ;
CODE_09844D:         sub   #07          ;
CODE_09844F:         bcs CODE_098473    ;
CODE_098451:         nop                ;
CODE_098452:         lms   r0,(0154)    ;
CODE_098455:         sub   #00          ;
CODE_098457:         bpl CODE_09845C    ;
CODE_098459:         nop                ;
CODE_09845A:         not                ;
CODE_09845B:         inc   r0           ;
CODE_09845C:         lsr                ;
CODE_09845D:         lsr                ;
CODE_09845E:         to r7              ;
CODE_09845F:         lsr                ;
CODE_098460:         lms   r0,(0152)    ;
CODE_098463:         sub   #00          ;
CODE_098465:         bpl CODE_09846A    ;
CODE_098467:         nop                ;
CODE_098468:         not                ;
CODE_098469:         inc   r0           ;
CODE_09846A:         lsr                ;
CODE_09846B:         lsr                ;
CODE_09846C:         to r6              ;
CODE_09846D:         lsr                ;
CODE_09846E:         from r6            ;
CODE_09846F:         or    r7           ;
CODE_098470:         bne CODE_098475    ;
CODE_098472:         nop                ;
CODE_098473:         stop               ;
CODE_098474:         nop                ;

CODE_098475:         lms   r1,(0156)    ;
CODE_098478:         lms   r2,(0158)    ;
CODE_09847B:         from r11           ;
CODE_09847C:         lsr                ;
CODE_09847D:         beq CODE_098484    ;
CODE_09847F:         nop                ;
CODE_098480:         iwt   r15,#84DE    ;
CODE_098483:         nop                ;
CODE_098484:         ibt   r9,#0008     ;
CODE_098486:         ibt   r8,#0000     ;
CODE_098488:         ibt   r7,#0000     ;
CODE_09848A:         dec   r3           ;
CODE_09848B:         bpl CODE_098495    ;
CODE_09848D:         inc   r3           ;
CODE_09848E:         ibt   r7,#0008     ;
CODE_098490:         ibt   r9,#FFF8     ;
CODE_098492:         iwt   r8,#4000     ;
CODE_098495:         from r1            ;
CODE_098496:         add   r7           ;
CODE_098497:         stw   (r5)         ;
CODE_098498:         inc   r5           ;
CODE_098499:         inc   r5           ;
CODE_09849A:         from r2            ;
CODE_09849B:         stw   (r5)         ;
CODE_09849C:         inc   r5           ;
CODE_09849D:         inc   r5           ;
CODE_09849E:         iwt   r0,#0A20     ;
CODE_0984A1:         or    r4           ;
CODE_0984A2:         or    r8           ;
CODE_0984A3:         stw   (r5)         ;
CODE_0984A4:         inc   r5           ;
CODE_0984A5:         inc   r5           ;
CODE_0984A6:         sub   r0           ;
CODE_0984A7:         stw   (r5)         ;
CODE_0984A8:         inc   r5           ;
CODE_0984A9:         inc   r5           ;
CODE_0984AA:         cache              ;
CODE_0984AB:         iwt   r0,#854D     ;
CODE_0984AE:         to r14             ;
CODE_0984AF:         add   r10          ;
CODE_0984B0:         getb               ;
CODE_0984B1:         inc   r14          ;
CODE_0984B2:         getbh              ;
CODE_0984B4:         move  r14,r0       ;
CODE_0984B6:         dec   r6           ;
CODE_0984B7:         beq CODE_0984DC    ;
CODE_0984B9:         nop                ;
CODE_0984BA:         move  r12,r6       ;
CODE_0984BC:         move  r13,r15      ;
CODE_0984BE:         with r1            ;
CODE_0984BF:         add   r9           ;
CODE_0984C0:         from r1            ;
CODE_0984C1:         add   r7           ;
CODE_0984C2:         stw   (r5)         ;
CODE_0984C3:         inc   r5           ;
CODE_0984C4:         inc   r5           ;
CODE_0984C5:         getbs              ;
CODE_0984C7:         inc   r14          ;
CODE_0984C8:         add   r2           ;
CODE_0984C9:         stw   (r5)         ;
CODE_0984CA:         inc   r5           ;
CODE_0984CB:         inc   r5           ;
CODE_0984CC:         getb               ;
CODE_0984CD:         inc   r14          ;
CODE_0984CE:         getbh              ;
CODE_0984D0:         inc   r14          ;
CODE_0984D1:         or    r4           ;
CODE_0984D2:         xor   r8           ;
CODE_0984D4:         stw   (r5)         ;
CODE_0984D5:         inc   r5           ;
CODE_0984D6:         inc   r5           ;
CODE_0984D7:         sub   r0           ;
CODE_0984D8:         stw   (r5)         ;
CODE_0984D9:         inc   r5           ;
CODE_0984DA:         loop               ;
CODE_0984DB:         inc   r5           ;
CODE_0984DC:         stop               ;
CODE_0984DD:         nop                ;

CODE_0984DE:         move  r6,r7        ;
CODE_0984E0:         ibt   r8,#0000     ;
CODE_0984E2:         ibt   r7,#0008     ;
CODE_0984E4:         dec   r3           ;
CODE_0984E5:         bpl CODE_0984ED    ;
CODE_0984E7:         inc   r3           ;
CODE_0984E8:         ibt   r7,#0000     ;
CODE_0984EA:         iwt   r8,#4000     ;
CODE_0984ED:         from r1            ;
CODE_0984EE:         add   r7           ;
CODE_0984EF:         stw   (r5)         ;
CODE_0984F0:         inc   r5           ;
CODE_0984F1:         inc   r5           ;
CODE_0984F2:         from r2            ;
CODE_0984F3:         stw   (r5)         ;
CODE_0984F4:         inc   r5           ;
CODE_0984F5:         inc   r5           ;
CODE_0984F6:         iwt   r0,#0A22     ;
CODE_0984F9:         or    r4           ;
CODE_0984FA:         or    r8           ;
CODE_0984FB:         stw   (r5)         ;
CODE_0984FC:         inc   r5           ;
CODE_0984FD:         inc   r5           ;
CODE_0984FE:         sub   r0           ;
CODE_0984FF:         stw   (r5)         ;
CODE_098500:         inc   r5           ;
CODE_098501:         inc   r5           ;
CODE_098502:         cache              ;
CODE_098503:         iwt   r0,#85B5     ;
CODE_098506:         to r14             ;
CODE_098507:         add   r10          ;
CODE_098508:         getb               ;
CODE_098509:         inc   r14          ;
CODE_09850A:         getbh              ;
CODE_09850C:         move  r14,r0       ;
CODE_09850E:         dec   r6           ;
CODE_09850F:         beq CODE_09853B    ;
CODE_098511:         nop                ;
CODE_098512:         move  r12,r6       ;
CODE_098514:         move  r13,r15      ;
CODE_098516:         with r2            ;
CODE_098517:         add   #08          ;
CODE_098519:         getbs              ;
CODE_09851B:         inc   r14          ;
CODE_09851C:         dec   r3           ;
CODE_09851D:         bpl CODE_098522    ;
CODE_09851F:         inc   r3           ;
CODE_098520:         not                ;
CODE_098521:         inc   r0           ;
CODE_098522:         add   r1           ;
CODE_098523:         add   r7           ;
CODE_098524:         stw   (r5)         ;
CODE_098525:         inc   r5           ;
CODE_098526:         inc   r5           ;
CODE_098527:         from r2            ;
CODE_098528:         stw   (r5)         ;
CODE_098529:         inc   r5           ;
CODE_09852A:         inc   r5           ;
CODE_09852B:         getb               ;
CODE_09852C:         inc   r14          ;
CODE_09852D:         getbh              ;
CODE_09852F:         inc   r14          ;
CODE_098530:         or    r4           ;
CODE_098531:         xor   r8           ;
CODE_098533:         stw   (r5)         ;
CODE_098534:         inc   r5           ;
CODE_098535:         inc   r5           ;
CODE_098536:         sub   r0           ;
CODE_098537:         stw   (r5)         ;
CODE_098538:         inc   r5           ;
CODE_098539:         loop               ;
CODE_09853A:         inc   r5           ;
CODE_09853B:         stop               ;
CODE_09853C:         nop                ;

DATA_09853D:         db $00, $02, $02, $02, $04, $04, $04, $06
DATA_098545:         db $06, $06, $04, $04, $04, $02, $02, $02

DATA_09854D:         dw $8555, $856D, $8585, $859D

DATA_098555:         dw $2100, $000A, $0A21, $2100
DATA_09855D:         dw $000A, $0A21, $2100, $000A
DATA_098565:         dw $0A21, $2100, $000A, $0A21
DATA_09856D:         dw $3000, $FF0A, $8A30, $3000
DATA_098575:         dw $FF0A, $8A30, $3000, $FF0A
DATA_09857D:         dw $8A30, $3000, $FF0A, $8A30
DATA_098585:         dw $3100, $FF0A, $8A31, $3100
DATA_09858D:         dw $FF0A, $8A31, $3100, $FF0A
DATA_098595:         dw $8A31, $3100, $FF0A, $8A31
DATA_09859D:         dw $3100, $018A, $0A31, $3100
DATA_0985A5:         dw $018A, $0A31, $3100, $018A
DATA_0985AD:         dw $0A31, $3100, $018A, $0A31

DATA_0985B5:         dw $85BD, $85D5, $85ED, $8605

DATA_0985BD:         dw $3200, $000A, $0A32, $3200
DATA_0985C5:         dw $000A, $0A32, $3200, $000A
DATA_0985CD:         dw $0A32, $3200, $000A, $0A32
DATA_0985D5:         dw $23FF, $000A, $4A23, $23FF
DATA_0985DD:         dw $000A, $4A23, $23FF, $000A
DATA_0985E5:         dw $4A23, $23FF, $000A, $4A23
DATA_0985ED:         dw $33FF, $000A, $4A33, $33FF
DATA_0985F5:         dw $000A, $4A33, $33FF, $000A
DATA_0985FD:         dw $4A33, $33FF, $000A, $4A33
DATA_098605:         dw $3300, $FF4A, $0A33, $3300
DATA_09860D:         dw $FF4A, $0A33, $3300, $FF4A
DATA_098615:         dw $0A33, $3300, $FF4A, $0A33
DATA_09861D:         dw $A03D, $9E89, $0308, $0001
DATA_098625:         dw $3D01, $8CA6, $60A0, $5615
DATA_09862D:         dw $10A0, $5026, $00F2, $AC80
DATA_098635:         dw $0204, $1D2F, $B245, $3690
DATA_09863D:         dw $D5D5, $D6D6, $3645, $D5D5
DATA_098645:         dw $D6D6, $3645, $D5D5, $D6D6
DATA_09864D:         dw $3645, $D5D5, $3CD6, $B2D6
DATA_098655:         dw $2535, $543E, $2545, $543E
DATA_09865D:         dw $35B2, $FFF9, $3D01, $A979
DATA_098665:         dw $1908, $3DC9, $62A0, $5050
DATA_09866D:         dw $3E1E, $F164, $017E, $84F2
DATA_098675:         dw $3D01, $4AA3, $A43D, $A54E
DATA_09867D:         dw $3D10, $89A0, $3D65, $48A5
DATA_098685:         dw $3D55, $CCA5, $1465, $3D64
DATA_09868D:         dw $8CA5, $30A0, $5516, $02FA
DATA_098695:         dw $AC40, $0202, $1D2F, $3E41
DATA_09869D:         dw $6368, $6E35, $D536, $D6D5
DATA_0986A5:         dw $42D6, $3554, $D536, $D6D5
DATA_0986AD:         dw $B9D6, $B935, $D536, $D6D5
DATA_0986B5:         dw $BAD6, $359E, $36BA, $D5D5
DATA_0986BD:         dw $21D6, $543E, $3E22, $3C54
DATA_0986C5:         dw $3DD6, $89AB, $3E2B, $0A68
DATA_0986CD:         dw $0103, $0100, $1FA7, $3DB9
DATA_0986D5:         dw $1977, $CA3E, $3F2A, $3D72
DATA_0986DD:         dw $62A0, $23E0, $2650, $A015
DATA_0986E5:         dw $2630, $2450, $543E, $3E24
DATA_0986ED:         dw $F168, $017E, $84F2, $AC01
DATA_0986F5:         dw $2F02, $411D, $643E, $3563
DATA_0986FD:         dw $366E, $D5D5, $D6D6, $5442
DATA_098705:         dw $3635, $D5D5, $D6D6, $1029
DATA_09870D:         dw $3635, $D5D5, $D6D6, $3560
DATA_098715:         dw $36BA, $D5D5, $21D6, $543E
DATA_09871D:         dw $3E22, $3C54, $2BD6, $683E
DATA_098725:         dw $3EBB, $0A61, $24C2, $0100
DATA_09872D:         dw $A03D, $F15F, $0198, $0961
DATA_098735:         dw $514F, $08A0, $DF3F, $A03D
DATA_09873D:         dw $C0BF, $18FE, $1EAE, $165E
DATA_098745:         dw $EF3F, $00F1, $B1F4, $9F18
DATA_09874D:         dw $00F2, $B2DC, $9F1A, $B323
DATA_098755:         dw $0608, $4F28, $2AD8, $DA4F
DATA_09875D:         dw $40A0, $5E1E, $3F16, $B1EF
DATA_098765:         dw $9F17, $19B2, $3D9F, $8CA5
DATA_09876D:         dw $60A0, $5515, $5845, $D590
DATA_098775:         dw $45D5, $9057, $26A0, $5515
DATA_09877D:         dw $5A45, $D590, $45D5, $9059
DATA_098785:         dw $0100, $0100, $A03D, $F15F
DATA_09878D:         dw $0186, $0861, $014D, $08A0
DATA_098795:         dw $DF3F, $A03D, $C0BF, $1620
DATA_09879D:         dw $40A7, $9557, $080A, $A001
DATA_0987A5:         dw $3D7F, $D0C6, $9E16, $18F0
DATA_0987AD:         dw $1EAE, $3F56, $F6EF, $F000
DATA_0987B5:         dw $9F17, $40A0, $5E1E, $EF3F
DATA_0987BD:         dw $9F18, $B323, $0309, $4F28
DATA_0987C5:         dw $3DD8, $8CA5, $60A0, $5515
DATA_0987CD:         dw $06A6, $AC02, $2F04, $451D
DATA_0987D5:         dw $9058, $D5D5, $5745, $5625
DATA_0987DD:         dw $903C, $0100, $0100, $0100
DATA_0987E5:         dw $0100, $08A0, $DF3F, $A03D
DATA_0987ED:         dw $FE5F, $0124, $096E, $0144
DATA_0987F5:         dw $A03D, $E0C0, $3B0B, $3D01
DATA_0987FD:         dw $BFA0, $18FE, $1EAE, $3F5E
DATA_098805:         dw $F6EF, $D000, $A79F, $170E
DATA_09880D:         dw $A057, $1E40, $3F5E, $18EF
DATA_098815:         dw $239F, $09B3, $2803, $D84F
DATA_09881D:         dw $A53D, $A08C, $1560, $A655
DATA_098825:         dw $0206, $04AC, $1D2F, $5845
DATA_09882D:         dw $D590, $45D5, $2557, $3C56
DATA_098835:         dw $0090, $3D01, $BFA0, $18FE
DATA_09883D:         dw $1EAE, $3F5E, $F6EF, $3000
DATA_098845:         dw $A79F, $170A, $C305, $A067
DATA_09884D:         dw $3F08, $F1DF, $11E0, $80F2
DATA_098855:         dw $F312, $10A0, $40F9, $F711
DATA_09885D:         dw $0EC0, $A0F8, $FA15, $1500
DATA_098865:         dw $22F5, $0218, $28AC, $1D2F
DATA_09886D:         dw $473D, $D7D7, $6C3E, $150D
DATA_098875:         dw $A016, $1104, $1251, $1352
DATA_09887D:         dw $1953, $1859, $1558, $1A55
DATA_098885:         dw $FF5A, $8921, $41D7, $2047
DATA_09888D:         dw $C014, $883E, $501B, $9EB4
DATA_098895:         dw $58FE, $1EAE, $485E, $0A66
DATA_09889D:         dw $4A03, $D04F, $3156, $505B
DATA_0988A5:         dw $5016, $A4EF, $2E40, $4D64
DATA_0988AD:         dw $9F1B, $4DEF, $9F16, $00FE
DATA_0988B5:         dw $4501, $4DE0, $050B, $D04D
DATA_0988BD:         dw $C01E, $BEDE, $9F3D, $C024
DATA_0988C5:         dw $4D9E, $20C4, $0916, $9E0B
DATA_0988CD:         dw $4D14, $5443, $B690, $95C0
DATA_0988D5:         dw $503F, $D332, $16D3, $5643
DATA_0988DD:         dw $D190, $D2D1, $D8D2, $DAD8
DATA_0988E5:         dw $48DA, $4116, $0A66, $4A03
DATA_0988ED:         dw $D04F, $3156, $5B16, $3DBE
DATA_0988F5:         dw $249F, $9EC0, $C44D, $1620
DATA_0988FD:         dw $0B09, $149E, $494D, $9054
DATA_098905:         dw $C0B6, $3F95, $3250, $D9D9
DATA_09890D:         dw $4916, $9056, $D1D1, $D2D2
DATA_098915:         dw $D8D8, $D3D3, $D9D9, $DADA
DATA_09891D:         dw $3E25, $D754, $D73C, $0100

; gsu routine
CODE_098925:         lms   r0,(00AC)    ;
CODE_098928:         lm    r1,(1E2A)    ;
CODE_09892C:         or    r1           ;
CODE_09892D:         beq CODE_098934    ;
CODE_09892F:         nop                ;
CODE_098930:         iwt   r15,#89C1    ;
CODE_098933:         nop                ;
CODE_098934:         lms   r0,(008C)    ; yoshi x
CODE_098937:         lms   r1,(0094)    ; camera x
CODE_09893A:         sub   r1           ; yoshi - camera x
CODE_09893B:         ibt   r2,#0060     ;
CODE_09893D:         ibt   r4,#0008     ; test if yoshi is to the left
CODE_09893F:         to r6              ;
CODE_098940:         sub   r4           ; of left edge of screen
CODE_098941:         bmi CODE_098963    ;
CODE_098943:         nop                ;
CODE_098944:         iwt   r2,#0180     ;
CODE_098947:         iwt   r4,#00E8     ; test if yoshi is to the left
CODE_09894A:         to r6              ;
CODE_09894B:         sub   r4           ; of right edge of screen
CODE_09894C:         dec   r6           ;
CODE_09894D:         bmi CODE_0989C1    ;
CODE_09894F:         inc   r6           ;
CODE_098950:         moves r3,r3        ;
CODE_098952:         beq CODE_098963    ;
CODE_098954:         nop                ;
CODE_098955:         iwt   r4,#00F8     ;
CODE_098958:         sub   r4           ;
CODE_098959:         bmi CODE_0989C1    ;
CODE_09895B:         nop                ;
CODE_09895C:         ibt   r0,#0016     ;
CODE_09895E:         stop               ;
CODE_09895F:         nop                ;

CODE_098960:         bra CODE_0989C1    ;

CODE_098962:         nop                ;

CODE_098963:         lm    r5,(1E28)    ;
CODE_098967:         from r6            ;
CODE_098968:         xor   r5           ;
CODE_09896A:         bpl CODE_098987    ;
CODE_09896C:         nop                ;
CODE_09896D:         lms   r0,(00FC)    ;
CODE_098970:         and   r2           ;
CODE_098971:         beq CODE_098987    ;
CODE_098973:         nop                ;
CODE_098974:         moves r0,r6        ;
CODE_098976:         bpl CODE_09897B    ;
CODE_098978:         nop                ;
CODE_098979:         not                ;
CODE_09897A:         inc   r0           ;
CODE_09897B:         sub   #0F          ;
CODE_09897D:         bcc CODE_0989C1    ;
CODE_09897F:         nop                ;
CODE_098980:         ibt   r0,#0012     ;
CODE_098982:         stop               ;
CODE_098983:         nop                ;

CODE_098984:         bra CODE_0989C1    ;

CODE_098986:         nop                ;

CODE_098987:         lms   r7,(00A8)    ;
CODE_09898A:         from r7            ;
CODE_09898B:         sub   r5           ;
CODE_09898C:         xor   r7           ;
CODE_09898E:         bmi CODE_09899D    ;
CODE_098990:         nop                ;
CODE_098991:         from r5            ;
CODE_098992:         sbk                ;
CODE_098993:         sms   (00B4),r5    ;
CODE_098996:         lm    r0,(1E26)    ;
CODE_09899A:         sms   (008A),r0    ;
CODE_09899D:         from r6            ;
CODE_09899E:         add   #04          ;
CODE_0989A0:         bmi CODE_0989A8    ;
CODE_0989A2:         nop                ;
CODE_0989A3:         sub   #08          ;
CODE_0989A5:         bcc CODE_0989AC    ;
CODE_0989A7:         nop                ;
CODE_0989A8:         not                ;
CODE_0989A9:         inc   r0           ;
CODE_0989AA:         to r6              ;
CODE_0989AB:         add   r6           ;
CODE_0989AC:         lms   r0,(008C)    ;
CODE_0989AF:         sub   r6           ;
CODE_0989B0:         sbk                ;
CODE_0989B1:         lm    r5,(1E48)    ;
CODE_0989B5:         moves r5,r5        ;
CODE_0989B7:         bmi CODE_0989C1    ;
CODE_0989B9:         nop                ;
CODE_0989BA:         iwt   r0,#10E2     ;
CODE_0989BD:         add   r5           ;
CODE_0989BE:         ldw   (r0)         ;
CODE_0989BF:         sub   r6           ;
CODE_0989C0:         sbk                ;

CODE_0989C1:         ibt   r0,#0009     ;
CODE_0989C3:         romb               ;
CODE_0989C5:         iwt   r1,#1461     ;
CODE_0989C8:         iwt   r2,#10A2     ; x coord
CODE_0989CB:         iwt   r3,#1142     ; y coord
CODE_0989CE:         iwt   r4,#1640     ; OAM x & y
CODE_0989D1:         iwt   r6,#0EC0     ; sprite state
CODE_0989D4:         iwt   r9,#1000     ;
CODE_0989D7:         iwt   r10,#1460    ;
CODE_0989DA:         cache              ;
CODE_0989DB:         ibt   r12,#0028    ;
CODE_0989DD:         move  r13,r15      ; loop begin through sprite tables
CODE_0989DF:         ldb   (r6)         ;
CODE_0989E1:         dec   r0           ; test for > 0
CODE_0989E2:         bpl CODE_0989EA    ; any state besides 00
CODE_0989E4:         nop                ;
CODE_0989E5:         inc   r4           ;
CODE_0989E6:         iwt   r15,#8A6A    ; if free slot, skip processing
CODE_0989E9:         inc   r4           ;
CODE_0989EA:         ldb   (r1)         ; select the X camera to use
CODE_0989EC:         iwt   r7,#0094     ; (layer?)
CODE_0989EF:         to r7              ;
CODE_0989F0:         add   r7           ;
CODE_0989F1:         to r7              ;
CODE_0989F2:         ldw   (r7)         ;
CODE_0989F3:         iwt   r8,#009C     ; select layer Y camera
CODE_0989F6:         add   r8           ;
CODE_0989F7:         to r8              ;
CODE_0989F8:         ldw   (r0)         ;
CODE_0989F9:         ldw   (r2)         ; x coord
CODE_0989FA:         sub   r7           ; - layer camera X
CODE_0989FB:         stw   (r4)         ; -> 1640,x
CODE_0989FC:         move  r7,r0        ; cache in r7
CODE_0989FE:         ldw   (r3)         ; y coord
CODE_0989FF:         sub   r8           ; - layer camera Y
CODE_098A00:         inc   r4           ;
CODE_098A01:         inc   r4           ;
CODE_098A02:         stw   (r4)         ; -> 1642,x
CODE_098A03:         move  r8,r0        ; cache in r8
CODE_098A05:         ldw   (r9)         ; 1000,x bits 2 & 3
CODE_098A06:         and   #0C          ; get index into 8C83 table
CODE_098A08:         beq CODE_098A6A    ; if 0, go to next sprite
CODE_098A0A:         nop                ;
CODE_098A0B:         iwt   r14,#8C83    ; get first word: x threshold
CODE_098A0E:         to r14             ;
CODE_098A0F:         add   r14          ; in entry in table
CODE_098A10:         getb               ;
CODE_098A11:         inc   r14          ;
CODE_098A12:         iwt   r11,#00F0    ;
CODE_098A15:         getbh              ;
CODE_098A17:         inc   r14          ;
CODE_098A18:         to r5              ;
CODE_098A19:         add   r7           ; if x threshold + #F0
CODE_098A1A:         add   r0           ; < 1640,x (OAM x coord)
CODE_098A1B:         add   r11          ; offscreen on right side check
CODE_098A1C:         sub   r5           ; w/ threshold
CODE_098A1D:         bcc CODE_098A2F    ;
CODE_098A1F:         sub   r0           ;
CODE_098A20:         getb               ; get next word: y threshold
CODE_098A21:         inc   r14          ;
CODE_098A22:         iwt   r11,#00C8    ;
CODE_098A25:         getbh              ;
CODE_098A27:         to r5              ;
CODE_098A28:         add   r8           ;
CODE_098A29:         add   r0           ; if y threshold + #C8
CODE_098A2A:         add   r11          ; > 1642,x (OAM y coord)
CODE_098A2B:         sub   r5           ; offscreen on bottom check
CODE_098A2C:         bcs CODE_098A6A    ; (w/ threshold)
CODE_098A2E:         sub   r0           ;
CODE_098A2F:         stw   (r6)         ; kill sprite (#00 -> state)
CODE_098A30:         dec   r0           ;
CODE_098A31:         inc   r1           ;
CODE_098A32:         stb   (r1)         ;
CODE_098A34:         dec   r1           ;
CODE_098A35:         ibt   r0,#0018     ;
CODE_098A37:         sub   r12          ;
CODE_098A38:         add   r0           ;
CODE_098A39:         to r8              ;
CODE_098A3A:         add   r0           ;
CODE_098A3B:         ibt   r0,#0040     ;
CODE_098A3D:         add   r8           ;
CODE_098A3E:         iwt   r8,#16E2     ;
CODE_098A41:         add   r8           ;
CODE_098A42:         ldw   (r0)         ;
CODE_098A43:         sub   #00          ;
CODE_098A45:         bmi CODE_098A54    ;
CODE_098A47:         nop                ;
CODE_098A48:         iwt   r8,#1ECE     ;
CODE_098A4B:         add   r8           ;
CODE_098A4C:         ldw   (r0)         ;
CODE_098A4D:         not                ;
CODE_098A4E:         lm    r8,(1ECC)    ;
CODE_098A52:         and   r8           ;
CODE_098A53:         sbk                ;
CODE_098A54:         ldb   (r10)        ;
CODE_098A56:         iwt   r8,#28CA     ;
CODE_098A59:         to r8              ;
CODE_098A5A:         add   r8           ;
CODE_098A5B:         sub   r0           ;
CODE_098A5C:         stb   (r8)         ; store #00 in (28CA + (1460))
CODE_098A5E:         lm    r0,(01B6)    ;
CODE_098A62:         sub   r12          ;
CODE_098A63:         bne CODE_098A6A    ;
CODE_098A65:         nop                ;
CODE_098A66:         sm    (01B6),r0    ;
CODE_098A6A:         ibt   r0,#0004     ; next sprite slot
CODE_098A6C:         to r2              ;
CODE_098A6D:         add   r2           ; in all tables
CODE_098A6E:         to r3              ;
CODE_098A6F:         add   r3           ;
CODE_098A70:         to r6              ;
CODE_098A71:         add   r6           ;
CODE_098A72:         to r9              ;
CODE_098A73:         add   r9           ;
CODE_098A74:         to r10             ;
CODE_098A75:         add   r10          ;
CODE_098A76:         to r1              ;
CODE_098A77:         add   r1           ;
CODE_098A78:         inc   r4           ;
CODE_098A79:         loop               ;
CODE_098A7A:         inc   r4           ;
CODE_098A7B:         ibt   r0,#004D     ; begin nested loop
CODE_098A7D:         romb               ; through table 1462
CODE_098A7F:         ibt   r11,#0000    ; i, outer loop counter
CODE_098A81:         iwt   r13,#8A8F    ; go through table
CODE_098A84:         iwt   r1,#1462     ; 8 times, i++ each time
CODE_098A87:         iwt   r2,#1000     ;
CODE_098A8A:         cache              ; outer loop starts:
CODE_098A8B:         ibt   r12,#0028    ; j, inner loop counter
CODE_098A8D:         ibt   r10,#0000    ;
CODE_098A8F:         from r1            ;
CODE_098A90:         add   r10          ; inner loop starts here
CODE_098A91:         ldw   (r0)         ;
CODE_098A92:         sub   r11          ; 1462,x - i
CODE_098A93:         beq CODE_098A9A    ;
CODE_098A95:         nop                ;
CODE_098A96:         iwt   r15,#8AE5    ; next sprite if not zero ^
CODE_098A99:         inc   r10          ;
CODE_098A9A:         iwt   r0,#13C2     ; 13C2,x
CODE_098A9D:         add   r10          ; is animation frame
CODE_098A9E:         ldw   (r0)         ;
CODE_098A9F:         move  r9,r0        ;
CODE_098AA1:         hib                ; animation frame being $00xx
CODE_098AA2:         beq CODE_098AC2    ;
CODE_098AA4:         dec   r0           ;
CODE_098AA5:         bne CODE_098AB2    ; animation frame being $01xx
CODE_098AA7:         to r9              ;
CODE_098AA8:         sub   r0           ; performs this table read
CODE_098AA9:         sms   (0000),r9    ;
CODE_098AAC:         iwt   r14,#0914    ;
CODE_098AAF:         bra CODE_098B16    ;

CODE_098AB1:         getb               ;

CODE_098AB2:         sub   r0           ; animation frame: anything else
CODE_098AB3:         sms   (0000),r9    ;
CODE_098AB6:         sms   (0058),r12   ;
CODE_098AB9:         ibt   r12,#0004    ;
CODE_098ABB:         iwt   r14,#0918    ;
CODE_098ABE:         iwt   r15,#8BAE    ;
CODE_098AC1          alt2

CODE_098AC2:         iwt   r0,#$1140    ; y coord
CODE_098AC5:         add   r10          ;
CODE_098AC6:         ldb   (r0)         ; subpixel only
CODE_098AC8:         mult  #08          ; << 3
CODE_098ACA:         sms   (0000),r0    ; cache in 0000
CODE_098ACD:         from r2            ;
CODE_098ACE:         add   r10          ;
CODE_098ACF:         ldw   (r0)         ; 1000,x
CODE_098AD0:         and   #03          ; bits 0 & 1
CODE_098AD2:         mult  #03          ; * 3
CODE_098AD4:         inc   r0           ; + 1
CODE_098AD5:         to r15             ;
CODE_098AD6:         add   r15          ; increment PC by ^

; weird style of pointer table: this is 00 index
CODE_098AD7:         iwt   r15,#8B0B    ;
                     ; iwt   r0,#xxxx
CODE_098ADA:         db $F0             ;

; 01 index
                     ; iwt   r15,#8B85
CODE_098ADB:         dw $8B85           ;
CODE_098ADD:         alt2               ;

; 02 index
                     ; iwt   r15,#8C70
CODE_098ADE:         dw $8C70           ;
                     ; iwt   r0,#xxxx
CODE_098AE0:         db $F0             ;

; 03 index
                     ; iwt   r15,#8C93
CODE_098AE1:         dw $8C93           ;
CODE_098AE3:         alt2               ;

CODE_098AE4:         inc   r10          ;
CODE_098AE5:         inc   r10          ; next sprite
CODE_098AE6:         inc   r10          ;
CODE_098AE7:         loop               ;
CODE_098AE8:         inc   r10          ;
CODE_098AE9:         inc   r11          ; i++
CODE_098AEA:         lms   r0,(011A)    ;
CODE_098AED:         sub   r11          ;
CODE_098AEE:         beq CODE_098AFC    ; if i == (011A)
CODE_098AF0:         from r11           ;
CODE_098AF1:         sub   #08          ;
CODE_098AF3:         bcs CODE_098AFA    ; if i >= 8, completely done
CODE_098AF5:         nop                ;
CODE_098AF6:         iwt   r15,#8A8C    ;
                     ; ibt   r12,#00xx
CODE_098AF9:         db $AC

CODE_098AFA:         stop               ;
CODE_098AFB:         nop                ;

CODE_098AFC:         lms   r8,(0092)    ;
CODE_098AFF:         iwt   r0,#00A0     ;
CODE_098B02:         add   r8           ;
CODE_098B03:         sbk                ;
CODE_098B04:         sms   (0118),r8    ;
CODE_098B07:         iwt   r15,#8A8C    ; continue outer loop
                     ; ibt   r12,#00xx
CODE_098B0A:         db $AC

; 00 drawing method
CODE_098B0B:         db $20, $13
                     ; iwt r0, #1320
CODE_098B0D:         add   r10          ; sprite state
CODE_098B0E:         ldw   (r0)         ;
CODE_098B0F:         add   r0           ; * 2
CODE_098B10:         iwt   r14,#0000    ;
CODE_098B13:         to r14             ;
CODE_098B14:         add   r14          ; 1A8000,ID
CODE_098B15:         getb               ;
CODE_098B16:         inc   r14          ;
CODE_098B17:         iwt   r6,#1002     ;
CODE_098B1A:         with r6            ;
CODE_098B1B:         add   r10          ; r6 = 1002,x
CODE_098B1C:         to r6              ;
CODE_098B1D:         ldw   (r6)         ; OAM bytes 3 & 4
CODE_098B1E:         getbh              ;
CODE_098B20:         add   r9           ; r14 = 1A8000,ID +
CODE_098B21:         to r14             ;
CODE_098B22:         add   r9           ; anim frame * 2
CODE_098B23:         iwt   r0,#13C0     ;
CODE_098B26:         add   r10          ; facing dir
CODE_098B27:         ldb   (r0)         ;
CODE_098B29:         add   r0           ;
CODE_098B2A:         add   r0           ; << 5
CODE_098B2B:         mult  #08          ; to shift into 7th bit (x flip)
CODE_098B2D:         xor   r6           ; ^ 1002,x
CODE_098B2F:         to r6              ;
CODE_098B30:         swap               ;
CODE_098B31:         with r6            ;
CODE_098B32:         getbl              ; r6 = oam 3 & 4
CODE_098B34:         inc   r14          ; t[0] = tile number
CODE_098B35:         iwt   r0,#10A0     ;
CODE_098B38:         add   r10          ;
CODE_098B39:         ldb   (r0)         ;
CODE_098B3B:         to r7              ;
CODE_098B3C:         swap               ; r7 = low x coord byte
CODE_098B3D:         getb               ; t[1] = byte 4 OAM
CODE_098B3E:         move  r4,r0        ; r4 = high table (size)
CODE_098B40:         iwt   r9,#00F1     ; mask away priority
CODE_098B43:         and   r9           ; this is for yxpp---t
CODE_098B44:         swap               ;
CODE_098B45:         to r6              ;
CODE_098B46:         xor   r6           ;
CODE_098B48:         ibt   r9,#0000     ;
CODE_098B4A:         from r4            ;
CODE_098B4B:         and   #02          ; this time, mask size
CODE_098B4D:         bne CODE_098B52    ;
CODE_098B4F:         nop                ;
CODE_098B50:         ibt   r9,#0004     ;
CODE_098B52:         to r7              ;
CODE_098B53:         xor   r7           ; r7 = size ^ MSB x
CODE_098B55:         iwt   r0,#1640     ; (high table)
CODE_098B58:         to r8              ;
CODE_098B59:         add   r10          ;
CODE_098B5A:         ldw   (r8)         ; OAM x
CODE_098B5B:         to r4              ;
CODE_098B5C:         add   r9           ; add size correction
CODE_098B5D:         inc   r8           ; (0 or 4)
CODE_098B5E:         inc   r8           ;
CODE_098B5F:         ldw   (r8)         ; OAM y
CODE_098B60:         to r5              ;
CODE_098B61:         add   r9           ; add size correction
CODE_098B62:         lms   r8,(0092)    ; (0 or 4)
CODE_098B65:         iwt   r0,#1322     ;
CODE_098B68:         add   r10          ;
CODE_098B69:         from r8            ;
CODE_098B6A:         stw   (r0)         ; set OAM buffer entry
CODE_098B6B:         from r4            ;
CODE_098B6C:         stw   (r8)         ; store OAM x
CODE_098B6D:         inc   r8           ;
CODE_098B6E:         inc   r8           ;
CODE_098B6F:         from r5            ;
CODE_098B70:         stw   (r8)         ; store OAM y
CODE_098B71:         inc   r8           ;
CODE_098B72:         inc   r8           ;
CODE_098B73:         lms   r0,(0000)    ;
CODE_098B76:         add   r6           ;
CODE_098B77:         stw   (r8)         ; store OAM 3 & 4
CODE_098B78:         inc   r8           ;
CODE_098B79:         inc   r8           ;
CODE_098B7A:         from r7            ;
CODE_098B7B:         stw   (r8)         ; store OAM high
CODE_098B7C:         inc   r8           ;
CODE_098B7D:         inc   r8           ;
CODE_098B7E:         sms   (0092),r8    ; update next free slot
CODE_098B81:         iwt   r15,#8AE5    ; return
CODE_098B84:         inc   r10          ;

; 01 drawing method
                     ; sms   (0058),r12
CODE_098B85:         db $AC, $2C        ; preserve outer loop counter
CODE_098B87:         iwt   r0,#1320     ;
CODE_098B8A:         add   r10          ; sprite ID
CODE_098B8B:         ldw   (r0)         ;
CODE_098B8C:         add   r0           ; * 2
CODE_098B8D:         iwt   r14,#048A    ; $1A848A,ID
CODE_098B90:         to r14             ;
CODE_098B91:         add   r14          ;
CODE_098B92:         iwt   r0,#1001     ;
CODE_098B95:         add   r10          ; OAM buffer byte count
CODE_098B96:         ldb   (r0)         ;
CODE_098B98:         iwt   r8,#00F8     ;
CODE_098B9B:         and   r8           ;
CODE_098B9C:         lsr                ; / 8, so:
CODE_098B9D:         lsr                ; OAM entry count
CODE_098B9E:         lsr                ;
CODE_098B9F:         move  r12,r0       ; loop through sprite's OAM entries
CODE_098BA1:         to r8              ;
CODE_098BA2:         getb               ;
CODE_098BA3:         inc   r14          ;
CODE_098BA4:         umult #05          ;
CODE_098BA6:         umult r9           ; r14 = word($1A848A,ID) +
CODE_098BA8:         with r8            ;
CODE_098BA9:         getbh              ; entry count * 5 * anim frame
CODE_098BAB:         to r14             ;
CODE_098BAC:         add   r8           ;
CODE_098BAD:         sms   (0042),r1    ;
CODE_098BB0:         sms   (0044),r2    ; preserve some registers
CODE_098BB3:         sms   (0054),r10   ;
CODE_098BB6:         sms   (005A),r13   ;
CODE_098BB9:         iwt   r0,#8AE4     ; return address
CODE_098BBC:         sms   (0060),r0    ;
CODE_098BBF:         iwt   r0,#1002     ;
CODE_098BC2:         add   r10          ; 1002,x
CODE_098BC3:         to r3              ;
CODE_098BC4:         ldb   (r0)         ;
CODE_098BC6:         iwt   r0,#13C0     ;
CODE_098BC9:         add   r10          ; face dir
CODE_098BCA:         ldb   (r0)         ;
CODE_098BCC:         add   r0           ;
CODE_098BCD:         add   r0           ; << 5
CODE_098BCE:         mult  #08          ; to shift into 7th bit (x flip)
CODE_098BD0:         xor   r3           ; ^ 1002,x
CODE_098BD2:         to r3              ;
CODE_098BD3:         swap               ; -> r3 high byte
CODE_098BD4:         lms   r4,(0092)    ; last (free) OAM buffer entry
CODE_098BD7:         iwt   r0,#1322     ;
CODE_098BDA:         add   r10          ; occupy the space and claim it
CODE_098BDB:         from r4            ;
CODE_098BDC:         stw   (r0)         ; in 1322,x
CODE_098BDD:         iwt   r0,#10A0     ;
CODE_098BE0:         add   r10          ; lowest byte of x coord
CODE_098BE1:         ldb   (r0)         ;
CODE_098BE3:         to r13             ;
CODE_098BE4:         swap               ; r13 = low byte << 8
CODE_098BE5:         ibt   r0,#003C     ;
CODE_098BE7:         sub   r10          ; if sprite slot <= 3C
CODE_098BE8:         bcs CODE_098BF7    ; aka first 16 sprites
CODE_098BEA:         sub   r0           ;
CODE_098BEB:         iwt   r0,#1D56     ; or
CODE_098BEE:         add   r10          ; if 1D56,x - 1 < 0
CODE_098BEF:         ldw   (r0)         ;
CODE_098BF0:         dec   r0           ; then make r0 FFFF
CODE_098BF1:         bmi CODE_098BF7    ;
CODE_098BF3:         sub   r0           ; otherwise r0 = F1FF
CODE_098BF4:         iwt   r0,#F200     ; this is for bitmasking
CODE_098BF7:         dec   r0           ; the OAM priority
CODE_098BF8:         sms   (004E),r0    ; store either one in (004E)
CODE_098BFB:         iwt   r0,#1640     ;
CODE_098BFE:         add   r10          ; r1 = OAM x
CODE_098BFF:         to r1              ;
CODE_098C00:         ldw   (r0)         ;
CODE_098C01:         inc   r0           ;
CODE_098C02:         inc   r0           ;
CODE_098C03:         to r2              ;
CODE_098C04:         ldw   (r0)         ; r2 = OAM y
CODE_098C05:         move  r10,r13      ; preserve low x coord byte
CODE_098C07:         move  r13,r15      ; begin loop here
CODE_098C09:         getbs              ; t[0] = byte 1 of ROM table
CODE_098C0B:         inc   r14          ; for current anim frame
CODE_098C0C:         iwt   r9,#4000     ; t[0] = x drawing offset
CODE_098C0F:         with r9            ;
CODE_098C10:         and   r3           ;
CODE_098C11:         beq CODE_098C18    ; test x flip
CODE_098C13:         nop                ; negate if needed
CODE_098C14:         not                ;
CODE_098C15:         inc   r0           ;
CODE_098C16:         ibt   r9,#0008     ;
CODE_098C18:         to r5              ;
CODE_098C19:         add   r1           ; r5 = OAM x +/- t[0]
CODE_098C1A:         getbs              ; t[1] = y drawing offset
CODE_098C1C:         inc   r14          ;
CODE_098C1D:         ibt   r8,#0000     ;
CODE_098C1F:         moves r3,r3        ; test y flip
CODE_098C21:         bpl CODE_098C28    ; negate if needed
CODE_098C23:         nop                ;
CODE_098C24:         not                ;
CODE_098C25:         inc   r0           ;
CODE_098C26:         ibt   r8,#0008     ;
CODE_098C28:         to r6              ;
CODE_098C29:         add   r2           ; r6 = OAM y +/- t[1]
CODE_098C2A:         getb               ;
CODE_098C2B:         inc   r14          ;
CODE_098C2C:         lms   r7,(004E)    ; F1FF or FFFF
CODE_098C2F:         getbh              ;
CODE_098C31:         inc   r14          ; word t[2] (includes t[3])
CODE_098C32:         and   r7           ;
CODE_098C33:         to r7              ;
CODE_098C34:         xor   r3           ; r7 = oam low bytes 3 & 4
CODE_098C36:         getb               ;
CODE_098C37:         and   #02          ; mask for size flag
CODE_098C39:         bne CODE_098C40    ;
CODE_098C3B:         nop                ;
CODE_098C3C:         with r5            ;
CODE_098C3D:         add   r9           ; size corrections to X/Y if
CODE_098C3E:         with r6            ;
CODE_098C3F:         add   r8           ; size flag not set
CODE_098C40:         getbh              ; t[4] = OAM high table
CODE_098C42:         inc   r14          ; just for size
CODE_098C43:         from r5            ;
CODE_098C44:         stw   (r4)         ; store OAM x coord
CODE_098C45:         inc   r4           ;
CODE_098C46:         inc   r4           ;
CODE_098C47:         to r5              ;
CODE_098C48:         xor   r10          ; r5 = size ^ low x byte
CODE_098C4A:         from r6            ;
CODE_098C4B:         stw   (r4)         ; store OAM y coord
CODE_098C4C:         inc   r4           ;
CODE_098C4D:         inc   r4           ;
CODE_098C4E:         lms   r0,(0000)    ;
CODE_098C51:         add   r7           ;
CODE_098C52:         stw   (r4)         ; store OAM 3 & 4
CODE_098C53:         inc   r4           ;
CODE_098C54:         inc   r4           ;
CODE_098C55:         from r5            ;
CODE_098C56:         stw   (r4)         ; store high table info
CODE_098C57:         inc   r4           ; size & ms x byte together
CODE_098C58:         loop               ;
CODE_098C59:         inc   r4           ;
CODE_098C5A:         sms   (0092),r4    ; store next free OAM slot
CODE_098C5D:         lms   r1,(0042)    ;
CODE_098C60:         lms   r2,(0044)    ;
CODE_098C63:         lms   r10,(0054)   ; restore registers
CODE_098C66:         lms   r12,(0058)   ; to get back to more sprites!
CODE_098C69:         lms   r13,(005A)   ;
CODE_098C6C:         lms   r15,(0060)   ;
CODE_098C6F:         nop                ;

; 02 drawing method
; this seems to not really do anything?
; used for not drawing a sprite?
                     ; iwt r0,#1001
CODE_098C70:         dw $1001           ;
CODE_098C72:         add   r10          ; OAM buffer byte count
CODE_098C73:         ldw   (r0)         ;
CODE_098C74:         iwt   r7,#00F8     ;
CODE_098C77:         and   r7           ;
CODE_098C78:         lms   r8,(0092)    ; next free slot
CODE_098C7B:         add   r8           ; add the byte count
CODE_098C7C:         sbk                ; update
CODE_098C7D:         iwt   r0,#1322     ;
CODE_098C80:         add   r10          ; set 1322,x with
CODE_098C81:         from r8            ;
CODE_098C82:         stw   (r0)         ; buffer entry
CODE_098C83:         iwt   r15,#8AE5    ; go to next sprite
CODE_098C86:         inc   r10          ;

; 8C83 in code (indexed by 4's, pairs of words)
; x, y thresholds for despawning sprites
DATA_098C87:         dw $0060, $0060
DATA_098C8B:         dw $0090, $0060
DATA_098C8F:         dw $0090, $00A0

; 03 drawing method
; this is the same as 01 except OAM byte count
; MSB flagged on - if it's greater than a byte
; use this index
                     ; sms   (0058),r12
CODE_098C93:         db $AC, $2C        ; preserve outer loop counter
CODE_098C95:         iwt   r0,#1320     ;
CODE_098C98:         add   r10          ; sprite ID
CODE_098C99:         ldw   (r0)         ;
CODE_098C9A:         add   r0           ; * 2
CODE_098C9B:         iwt   r14,#048A    ;
CODE_098C9E:         to r14             ;
CODE_098C9F:         add   r14          ; $1A848A[ID]
CODE_098CA0:         iwt   r0,#1001     ; OAM byte count
CODE_098CA3:         add   r10          ;
CODE_098CA4:         ldb   (r0)         ;
CODE_098CA6:         iwt   r8,#00F8     ;
CODE_098CA9:         and   r8           ;
CODE_098CAA:         iwt   r8,#0100     ; adds 256 to OAM byte count
CODE_098CAD:         iwt   r15,#8B9C    ; giving it 32 more entries
CODE_098CB0:         add   r8           ; then jump to OAM processing

; gsu routine
CODE_098CB1:         romb               ;
CODE_098CB3:         iwt   r0,#1322     ;
CODE_098CB6:         add   r10          ;
CODE_098CB7:         ldw   (r0)         ;
CODE_098CB8:         moves r4,r0        ;
CODE_098CBA:         bpl CODE_098CBF    ;
CODE_098CBC:         nop                ;
CODE_098CBD:         stop               ;
CODE_098CBE:         nop                ;
;
CODE_098CBF:         iwt   r0,#13C2     ;
CODE_098CC2:         add   r10          ;
CODE_098CC3:         ldb   (r0)         ;
CODE_098CC5:         add   r0           ;
CODE_098CC6:         to r14             ;
CODE_098CC7:         add   r14          ;
CODE_098CC8:         getb               ;
CODE_098CC9:         inc   r14          ;
CODE_098CCA:         to r14             ;
CODE_098CCB:         getbh              ;
CODE_098CCD:         iwt   r0,#1002     ;
CODE_098CD0:         add   r10          ;
CODE_098CD1:         to r3              ;
CODE_098CD2:         ldb   (r0)         ;
CODE_098CD4:         iwt   r0,#13C0     ;
CODE_098CD7:         add   r10          ;
CODE_098CD8:         ldb   (r0)         ;
CODE_098CDA:         add   r0           ;
CODE_098CDB:         add   r0           ;
CODE_098CDC:         mult  #08          ;
CODE_098CDE:         xor   r3           ;
CODE_098CE0:         to r3              ;
CODE_098CE1:         swap               ;
CODE_098CE2:         iwt   r0,#1640     ;
CODE_098CE5:         add   r10          ;
CODE_098CE6:         to r1              ;
CODE_098CE7:         ldw   (r0)         ;
CODE_098CE8:         inc   r0           ;
CODE_098CE9:         inc   r0           ;
CODE_098CEA:         to r2              ;
CODE_098CEB:         ldw   (r0)         ;
CODE_098CEC:         iwt   r0,#1140     ;
CODE_098CEF:         add   r10          ;
CODE_098CF0:         ldb   (r0)         ;
CODE_098CF2:         mult  #08          ;
CODE_098CF4:         sms   (0000),r0    ;
CODE_098CF7:         iwt   r0,#1001     ;
CODE_098CFA:         add   r10          ;
CODE_098CFB:         ldw   (r0)         ;
CODE_098CFC:         iwt   r8,#00F8     ;
CODE_098CFF:         and   r8           ;
CODE_098D00:         lsr                ;
CODE_098D01:         lsr                ;
CODE_098D02:         to r12             ;
CODE_098D03:         lsr                ;
CODE_098D04:         iwt   r0,#10A0     ;
CODE_098D07:         add   r10          ;
CODE_098D08:         ldb   (r0)         ;
CODE_098D0A:         to r10             ;
CODE_098D0B:         swap               ;
CODE_098D0C:         cache              ;
CODE_098D0D:         move  r13,r15      ; loop start
CODE_098D0F:         getbs              ;
CODE_098D11:         inc   r14          ;
CODE_098D12:         iwt   r9,#4000     ;
CODE_098D15:         with r9            ;
CODE_098D16:         and   r3           ;
CODE_098D17:         beq CODE_098D1E    ;
CODE_098D19:         nop                ;
CODE_098D1A:         not                ;
CODE_098D1B:         inc   r0           ;
CODE_098D1C:         ibt   r9,#0008     ;
CODE_098D1E:         to r5              ;
CODE_098D1F:         add   r1           ;
CODE_098D20:         getbs              ;
CODE_098D22:         inc   r14          ;
CODE_098D23:         ibt   r8,#0000     ;
CODE_098D25:         moves r3,r3        ;
CODE_098D27:         bpl CODE_098D2E    ;
CODE_098D29:         nop                ;
CODE_098D2A:         not                ;
CODE_098D2B:         inc   r0           ;
CODE_098D2C:         ibt   r8,#0008     ;
CODE_098D2E:         to r6              ;
CODE_098D2F:         add   r2           ;
CODE_098D30:         getb               ;
CODE_098D31:         inc   r14          ;
CODE_098D32:         getbh              ;
CODE_098D34:         inc   r14          ;
CODE_098D35:         to r7              ;
CODE_098D36:         xor   r3           ;
CODE_098D38:         getb               ;
CODE_098D39:         and   #02          ;
CODE_098D3B:         bne CODE_098D42    ;
CODE_098D3D:         nop                ;
CODE_098D3E:         with r5            ;
CODE_098D3F:         add   r9           ;
CODE_098D40:         with r6            ;
CODE_098D41:         add   r8           ;
CODE_098D42:         getbh              ;
CODE_098D44:         inc   r14          ;
CODE_098D45:         from r5            ;
CODE_098D46:         stw   (r4)         ;
CODE_098D47:         inc   r4           ;
CODE_098D48:         inc   r4           ;
CODE_098D49:         to r5              ;
CODE_098D4A:         xor   r10          ;
CODE_098D4C:         from r6            ;
CODE_098D4D:         stw   (r4)         ;
CODE_098D4E:         inc   r4           ;
CODE_098D4F:         inc   r4           ;
CODE_098D50:         lms   r0,(0000)    ;
CODE_098D53:         add   r7           ;
CODE_098D54:         stw   (r4)         ;
CODE_098D55:         inc   r4           ;
CODE_098D56:         inc   r4           ;
CODE_098D57:         from r5            ;
CODE_098D58:         stw   (r4)         ;
CODE_098D59:         inc   r4           ;
CODE_098D5A:         loop               ;
CODE_098D5B:         inc   r4           ;
CODE_098D5C:         stop               ;
CODE_098D5D:         nop                ;

CODE_098D5E:         ibt   r12,#0018    ;
CODE_098D60:         lms   r2,(0000)    ;
CODE_098D63:         from r2            ;
CODE_098D64:         lsr                ;
CODE_098D65:         lsr                ;
CODE_098D66:         from r12           ;
CODE_098D67:         to r1              ;
CODE_098D68:         sub   r0           ;
CODE_098D69:         iwt   r4,#1CD6     ;
CODE_098D6C:         from r2            ;
CODE_098D6D:         add   r4           ;
CODE_098D6E:         to r2              ;
CODE_098D6F:         ldw   (r0)         ;
CODE_098D70:         add   #02          ;
CODE_098D72:         to r3              ;
CODE_098D73:         ldw   (r0)         ;
CODE_098D74:         iwt   r5,#0F00     ;
CODE_098D77:         ibt   r6,#0010     ;
CODE_098D79:         iwt   r7,#0FA2     ;
CODE_098D7C:         iwt   r8,#6000     ;
CODE_098D7F:         ibt   r9,#FFFF     ;
CODE_098D81:         sms   (0000),r9    ;
CODE_098D84:         cache              ;
CODE_098D85:         iwt   r13,#8D89    ;
CODE_098D88:         from r1            ;
CODE_098D89:         sub   r12          ;
CODE_098D8A:         beq CODE_098DBF    ;
CODE_098D8C:         nop                ;
CODE_098D8D:         ldb   (r5)         ;
CODE_098D8F:         sub   r6           ;
CODE_098D90:         bne CODE_098DBF    ;
CODE_098D92:         nop                ;
CODE_098D93:         ldw   (r7)         ;
CODE_098D94:         and   r8           ;
CODE_098D95:         bne CODE_098DBF    ;
CODE_098D97:         nop                ;
CODE_098D98:         ldw   (r4)         ;
CODE_098D99:         sub   r2           ;
CODE_098D9A:         move  r11,r0       ;
CODE_098D9C:         bpl CODE_098DA1    ;
CODE_098D9E:         nop                ;
CODE_098D9F:         not                ;
CODE_098DA0:         inc   r0           ;
CODE_098DA1:         move  r10,r0       ;
CODE_098DA3:         from r4            ;
CODE_098DA4:         add   #02          ;
CODE_098DA6:         ldw   (r0)         ;
CODE_098DA7:         sub   r3           ;
CODE_098DA8:         move  r14,r0       ;
CODE_098DAA:         bpl CODE_098DAF    ;
CODE_098DAC:         nop                ;
CODE_098DAD:         not                ;
CODE_098DAE:         inc   r0           ;
CODE_098DAF:         add   r10          ;
CODE_098DB0:         sub   r9           ;
CODE_098DB1:         bcs CODE_098DBF    ;
CODE_098DB3:         add   r9           ;
CODE_098DB4:         move  r9,r0        ;
CODE_098DB6:         sms   (0000),r12   ;
CODE_098DB9:         sms   (0002),r11   ;
CODE_098DBC:         sms   (0004),r14   ;
CODE_098DBF:         ibt   r0,#0004     ;
CODE_098DC1:         to r5              ;
CODE_098DC2:         add   r5           ;
CODE_098DC3:         to r7              ;
CODE_098DC4:         add   r7           ;
CODE_098DC5:         to r4              ;
CODE_098DC6:         add   r4           ;
CODE_098DC7:         loop               ;
CODE_098DC8:         from r1            ;
CODE_098DC9:         lms   r1,(0000)    ;
CODE_098DCC:         inc   r1           ;
CODE_098DCD:         beq CODE_098DD8    ;
CODE_098DCF:         dec   r1           ;
CODE_098DD0:         ibt   r0,#0018     ;
CODE_098DD2:         sub   r1           ;
CODE_098DD3:         add   r0           ;
CODE_098DD4:         add   r0           ;
CODE_098DD5:         sms   (0000),r0    ;
CODE_098DD8:         stop               ;
CODE_098DD9:         nop                ;

CODE_098DDA:         iwt   r2,#0F00     ;
CODE_098DDD:         iwt   r3,#1CD6     ;
CODE_098DE0:         iwt   r4,#1CD8     ;
CODE_098DE3:         iwt   r5,#0FA2     ;
CODE_098DE6:         from r3            ;
CODE_098DE7:         add   r1           ;
CODE_098DE8:         to r6              ;
CODE_098DE9:         ldw   (r0)         ;
CODE_098DEA:         from r4            ;
CODE_098DEB:         add   r1           ;
CODE_098DEC:         to r7              ;
CODE_098DED:         ldw   (r0)         ;
CODE_098DEE:         ibt   r8,#FFFF     ;
CODE_098DF0:         move  r9,r8        ;
CODE_098DF2:         iwt   r11,#6000    ;
CODE_098DF5:         from r1            ;
CODE_098DF6:         lsr                ;
CODE_098DF7:         lsr                ;
CODE_098DF8:         ibt   r12,#0018    ;
CODE_098DFA:         from r12           ;
CODE_098DFB:         to r1              ;
CODE_098DFC:         sub   r0           ;
CODE_098DFD:         cache              ;
CODE_098DFE:         move  r13,r15      ;
CODE_098E00:         from r12           ;
CODE_098E01:         sub   r1           ;
CODE_098E02:         beq CODE_098E2B    ;
CODE_098E04:         nop                ;
CODE_098E05:         ldb   (r2)         ;
CODE_098E07:         sub   #0E          ;
CODE_098E09:         bcc CODE_098E2B    ;
CODE_098E0B:         nop                ;
CODE_098E0C:         ldw   (r5)         ;
CODE_098E0D:         and   r11          ;
CODE_098E0E:         sub   r11          ;
CODE_098E0F:         bne CODE_098E2B    ;
CODE_098E11:         nop                ;
CODE_098E12:         ldw   (r3)         ;
CODE_098E13:         sub   r6           ;
CODE_098E14:         bpl CODE_098E19    ;
CODE_098E16:         nop                ;
CODE_098E17:         not                ;
CODE_098E18:         inc   r0           ;
CODE_098E19:         move  r10,r0       ;
CODE_098E1B:         ldw   (r4)         ;
CODE_098E1C:         sub   r7           ;
CODE_098E1D:         bpl CODE_098E22    ;
CODE_098E1F:         nop                ;
CODE_098E20:         not                ;
CODE_098E21:         inc   r0           ;
CODE_098E22:         add   r10          ;
CODE_098E23:         sub   r8           ;
CODE_098E24:         bcs CODE_098E2B    ;
CODE_098E26:         add   r8           ;
CODE_098E27:         move  r8,r0        ;
CODE_098E29:         move  r9,r12       ;
CODE_098E2B:         ibt   r0,#0004     ;
CODE_098E2D:         to r2              ;
CODE_098E2E:         add   r2           ;
CODE_098E2F:         to r3              ;
CODE_098E30:         add   r3           ;
CODE_098E31:         to r4              ;
CODE_098E32:         add   r4           ;
CODE_098E33:         to r5              ;
CODE_098E34:         add   r5           ;
CODE_098E35:         loop               ;
CODE_098E36:         moves r1,r9        ;
CODE_098E39:         bmi CODE_098E42    ;
CODE_098E3B:         nop                ;
CODE_098E3C:         ibt   r0,#0018     ;
CODE_098E3E:         sub   r9           ;
CODE_098E3F:         add   r0           ;
CODE_098E40:         to r1              ;
CODE_098E41:         add   r0           ;
CODE_098E42:         stop               ;
CODE_098E43:         nop                ;

CODE_098E44:         iwt   r14,#00A1    ;
CODE_098E47:         iwt   r2,#0F00     ;
CODE_098E4A:         iwt   r3,#1CD6     ;
CODE_098E4D:         iwt   r4,#1CD8     ;
CODE_098E50:         iwt   r5,#1360     ;
CODE_098E53:         iwt   r11,#1A38    ;
CODE_098E56:         from r3            ;
CODE_098E57:         add   r1           ;
CODE_098E58:         to r6              ;
CODE_098E59:         ldw   (r0)         ;
CODE_098E5A:         from r4            ;
CODE_098E5B:         add   r1           ;
CODE_098E5C:         to r7              ;
CODE_098E5D:         ldw   (r0)         ;
CODE_098E5E:         ibt   r8,#FFFF     ;
CODE_098E60:         move  r9,r8        ;
CODE_098E62:         from r1            ;
CODE_098E63:         lsr                ;
CODE_098E64:         lsr                ;
CODE_098E65:         ibt   r12,#0018    ;
CODE_098E67:         from r12           ;
CODE_098E68:         to r1              ;
CODE_098E69:         sub   r0           ;
CODE_098E6A:         cache              ;
CODE_098E6B:         move  r13,r15      ;
CODE_098E6D:         from r12           ;
CODE_098E6E:         sub   r1           ;
CODE_098E6F:         beq CODE_098EA4    ;
CODE_098E71:         nop                ;
CODE_098E72:         ldb   (r2)         ;
CODE_098E74:         sub   #08          ;
CODE_098E76:         beq CODE_098E7E    ;
CODE_098E78:         nop                ;
CODE_098E79:         sub   #07          ;
CODE_098E7B:         bmi CODE_098EA4    ;
CODE_098E7D:         nop                ;
CODE_098E7E:         ldw   (r5)         ;
CODE_098E7F:         cmp   r14          ;
CODE_098E81:         bne CODE_098EA4    ;
CODE_098E83:         nop                ;
CODE_098E84:         ldb   (r11)        ;
CODE_098E86:         moves r0,r0        ;
CODE_098E88:         bne CODE_098EA4    ;
CODE_098E8A:         nop                ;
CODE_098E8B:         ldw   (r3)         ;
CODE_098E8C:         sub   r6           ;
CODE_098E8D:         bpl CODE_098E92    ;
CODE_098E8F:         nop                ;
CODE_098E90:         not                ;
CODE_098E91:         inc   r0           ;
CODE_098E92:         move  r10,r0       ;
CODE_098E94:         ldw   (r4)         ;
CODE_098E95:         sub   r7           ;
CODE_098E96:         bpl CODE_098E9B    ;
CODE_098E98:         nop                ;
CODE_098E99:         not                ;
CODE_098E9A:         inc   r0           ;
CODE_098E9B:         add   r10          ;
CODE_098E9C:         sub   r8           ;
CODE_098E9D:         bcs CODE_098EA4    ;
CODE_098E9F:         add   r8           ;
CODE_098EA0:         move  r8,r0        ;
CODE_098EA2:         move  r9,r12       ;
CODE_098EA4:         ibt   r0,#0004     ;
CODE_098EA6:         to r2              ;
CODE_098EA7:         add   r2           ;
CODE_098EA8:         to r3              ;
CODE_098EA9:         add   r3           ;
CODE_098EAA:         to r4              ;
CODE_098EAB:         add   r4           ;
CODE_098EAC:         to r5              ;
CODE_098EAD:         add   r5           ;
CODE_098EAE:         to r11             ;
CODE_098EAF:         add   r11          ;
CODE_098EB0:         loop               ;
CODE_098EB1:         moves r1,r9        ;
CODE_098EB4:         bmi CODE_098EBD    ;
CODE_098EB6:         nop                ;
CODE_098EB7:         ibt   r0,#0018     ;
CODE_098EB9:         sub   r9           ;
CODE_098EBA:         add   r0           ;
CODE_098EBB:         to r1              ;
CODE_098EBC:         add   r0           ;
CODE_098EBD:         stop               ;
CODE_098EBE:         nop                ;
CODE_098EBF:         move  r11,r14      ;
CODE_098EC1:         inc   r11          ;
CODE_098EC2:         iwt   r2,#0F00     ;
CODE_098EC5:         iwt   r3,#1CD6     ;
CODE_098EC8:         iwt   r4,#1CD8     ;
CODE_098ECB:         iwt   r5,#1360     ;
CODE_098ECE:         from r3            ;
CODE_098ECF:         add   r1           ;
CODE_098ED0:         to r6              ;
CODE_098ED1:         ldw   (r0)         ;
CODE_098ED2:         from r4            ;
CODE_098ED3:         add   r1           ;
CODE_098ED4:         to r7              ;
CODE_098ED5:         ldw   (r0)         ;
CODE_098ED6:         ibt   r8,#FFFF     ;
CODE_098ED8:         move  r9,r8        ;
CODE_098EDA:         from r1            ;
CODE_098EDB:         lsr                ;
CODE_098EDC:         lsr                ;
CODE_098EDD:         ibt   r12,#0018    ;
CODE_098EDF:         from r12           ;
CODE_098EE0:         to r1              ;
CODE_098EE1:         sub   r0           ;
CODE_098EE2:         cache              ;
CODE_098EE3:         move  r13,r15      ;
CODE_098EE5:         from r12           ;
CODE_098EE6:         sub   r1           ;
CODE_098EE7:         beq CODE_098F1A    ;
CODE_098EE9:         nop                ;
CODE_098EEA:         ldb   (r2)         ;
CODE_098EEC:         sub   #08          ;
CODE_098EEE:         beq CODE_098EF6    ;
CODE_098EF0:         nop                ;
CODE_098EF1:         sub   #07          ;
CODE_098EF3:         bmi CODE_098F1A    ;
CODE_098EF5:         nop                ;
CODE_098EF6:         ldw   (r5)         ;
CODE_098EF7:         cmp   r14          ;
CODE_098EF9:         bmi CODE_098F1A    ;
CODE_098EFB:         nop                ;
CODE_098EFC:         cmp   r11          ;
CODE_098EFE:         bpl CODE_098F1A    ;
CODE_098F00:         nop                ;
CODE_098F01:         ldw   (r3)         ;
CODE_098F02:         sub   r6           ;
CODE_098F03:         bpl CODE_098F08    ;
CODE_098F05:         nop                ;
CODE_098F06:         not                ;
CODE_098F07:         inc   r0           ;
CODE_098F08:         move  r10,r0       ;
CODE_098F0A:         ldw   (r4)         ;
CODE_098F0B:         sub   r7           ;
CODE_098F0C:         bpl CODE_098F11    ;
CODE_098F0E:         nop                ;
CODE_098F0F:         not                ;
CODE_098F10:         inc   r0           ;
CODE_098F11:         add   r10          ;
CODE_098F12:         sub   r8           ;
CODE_098F13:         bcs CODE_098F1A    ;
CODE_098F15:         add   r8           ;
CODE_098F16:         move  r8,r0        ;
CODE_098F18:         move  r9,r12       ;
CODE_098F1A:         ibt   r0,#0004     ;
CODE_098F1C:         to r2              ;
CODE_098F1D:         add   r2           ;
CODE_098F1E:         to r3              ;
CODE_098F1F:         add   r3           ;
CODE_098F20:         to r4              ;
CODE_098F21:         add   r4           ;
CODE_098F22:         to r5              ;
CODE_098F23:         add   r5           ;
CODE_098F24:         loop               ;
CODE_098F25:         moves r1,r9        ;
CODE_098F28:         bmi CODE_098F31    ;
CODE_098F2A:         nop                ;
CODE_098F2B:         ibt   r0,#0018     ;
CODE_098F2D:         sub   r9           ;
CODE_098F2E:         add   r0           ;
CODE_098F2F:         to r1              ;
CODE_098F30:         add   r0           ;
CODE_098F31:         stop               ;
CODE_098F32:         nop                ;

CODE_098F33:         iwt   r2,#0F00     ;
CODE_098F36:         iwt   r3,#1CD6     ;
CODE_098F39:         iwt   r4,#1CD8     ;
CODE_098F3C:         iwt   r5,#1D38     ;
CODE_098F3F:         from r3            ;
CODE_098F40:         add   r1           ;
CODE_098F41:         to r6              ;
CODE_098F42:         ldw   (r0)         ;
CODE_098F43:         from r4            ;
CODE_098F44:         add   r1           ;
CODE_098F45:         to r7              ;
CODE_098F46:         ldw   (r0)         ;
CODE_098F47:         ibt   r8,#FFFF     ;
CODE_098F49:         move  r9,r8        ;
CODE_098F4B:         from r1            ;
CODE_098F4C:         lsr                ;
CODE_098F4D:         lsr                ;
CODE_098F4E:         ibt   r12,#0018    ;
CODE_098F50:         from r12           ;
CODE_098F51:         to r1              ;
CODE_098F52:         sub   r0           ;
CODE_098F53:         cache              ;
CODE_098F54:         dec   r12          ;
CODE_098F55:         move  r13,r15      ;
CODE_098F57:         ibt   r0,#0004     ;
CODE_098F59:         to r2              ;
CODE_098F5A:         add   r2           ;
CODE_098F5B:         to r3              ;
CODE_098F5C:         add   r3           ;
CODE_098F5D:         to r4              ;
CODE_098F5E:         add   r4           ;
CODE_098F5F:         to r5              ;
CODE_098F60:         add   r5           ;
CODE_098F61:         from r12           ;
CODE_098F62:         sub   r1           ;
CODE_098F63:         beq CODE_098F8D    ;
CODE_098F65:         nop                ;
CODE_098F66:         ldb   (r2)         ;
CODE_098F68:         sub   #0E          ;
CODE_098F6A:         bcc CODE_098F8D    ;
CODE_098F6C:         nop                ;
CODE_098F6D:         ldw   (r5)         ;
CODE_098F6E:         sub   #00          ;
CODE_098F70:         beq CODE_098F8D    ;
CODE_098F72:         nop                ;
CODE_098F73:         ldw   (r3)         ;
CODE_098F74:         sub   r6           ;
CODE_098F75:         bpl CODE_098F7A    ;
CODE_098F77:         nop                ;
CODE_098F78:         not                ;
CODE_098F79:         inc   r0           ;
CODE_098F7A:         move  r10,r0       ;
CODE_098F7C:         ldw   (r4)         ;
CODE_098F7D:         sub   r7           ;
CODE_098F7E:         bpl CODE_098F83    ;
CODE_098F80:         nop                ;
CODE_098F81:         not                ;
CODE_098F82:         inc   r0           ;
CODE_098F83:         add   r10          ;
CODE_098F84:         cmp   r8           ;
CODE_098F86:         bcs CODE_098F8D    ;
CODE_098F88:         nop                ;
CODE_098F89:         move  r8,r0        ;
CODE_098F8B:         move  r9,r12       ;
CODE_098F8D:         loop               ;
CODE_098F8E:         moves r1,r9        ;
CODE_098F91:         bmi CODE_098F9A    ;
CODE_098F93:         nop                ;
CODE_098F94:         ibt   r0,#0018     ;
CODE_098F96:         sub   r9           ;
CODE_098F97:         add   r0           ;
CODE_098F98:         to r1              ;
CODE_098F99:         add   r0           ;
CODE_098F9A:         stop               ;
CODE_098F9B:         nop                ;

CODE_098F9C:         iwt   r9,#0F5C     ;
CODE_098F9F:         iwt   r10,#0FFF    ;
CODE_098FA2:         iwt   r11,#1D32    ;
CODE_098FA5:         iwt   r8,#1C12     ;
CODE_098FA8:         ibt   r2,#0004     ;
CODE_098FAA:         ibt   r14,#005C    ;
CODE_098FAC:         from r14           ;
CODE_098FAD:         to r7              ;
CODE_098FAE:         sub   r1           ;
CODE_098FAF:         from r11           ;
CODE_098FB0:         sub   r7           ;
CODE_098FB1:         to r3              ;
CODE_098FB2:         ldw   (r0)         ;
CODE_098FB3:         add   #02          ;
CODE_098FB5:         to r4              ;
CODE_098FB6:         ldw   (r0)         ;
CODE_098FB7:         from r8            ;
CODE_098FB8:         sub   r7           ;
CODE_098FB9:         to r5              ;
CODE_098FBA:         ldw   (r0)         ;
CODE_098FBB:         add   #02          ;
CODE_098FBD:         to r6              ;
CODE_098FBE:         ldw   (r0)         ;
CODE_098FBF:         ibt   r12,#0018    ;
CODE_098FC1:         cache              ;
CODE_098FC2:         move  r13,r15      ;
CODE_098FC4:         from r14           ;
CODE_098FC5:         sub   r1           ;
CODE_098FC6:         beq CODE_099003    ;
CODE_098FC8:         nop                ;
CODE_098FC9:         ldb   (r9)         ;
CODE_098FCB:         sub   #0E          ;
CODE_098FCD:         bcc CODE_099003    ;
CODE_098FCF:         nop                ;
CODE_098FD0:         ldb   (r10)        ;
CODE_098FD2:         and   #08          ;
CODE_098FD4:         beq CODE_099003    ;
CODE_098FD6:         to r7              ;
CODE_098FD7:         ldw   (r8)         ;
CODE_098FD8:         ldw   (r11)        ;
CODE_098FD9:         sub   r3           ;
CODE_098FDA:         sms   (0000),r8    ;
CODE_098FDD:         add   r5           ;
CODE_098FDE:         add   r7           ;
CODE_098FDF:         bmi CODE_099003    ;
CODE_098FE1:         sub   r7           ;
CODE_098FE2:         sub   r7           ;
CODE_098FE3:         sub   r5           ;
CODE_098FE4:         sub   r5           ;
CODE_098FE5:         bpl CODE_099002    ;
CODE_098FE7:         inc   r11          ;
CODE_098FE8:         inc   r11          ;
CODE_098FE9:         inc   r8           ;
CODE_098FEA:         inc   r8           ;
CODE_098FEB:         to r7              ;
CODE_098FEC:         ldw   (r8)         ;
CODE_098FED:         ldw   (r11)        ;
CODE_098FEE:         sub   r4           ;
CODE_098FEF:         sms   (0002),r0    ;
CODE_098FF2:         add   r6           ;
CODE_098FF3:         add   r7           ;
CODE_098FF4:         bmi CODE_098FFF    ;
CODE_098FF6:         sub   r7           ;
CODE_098FF7:         sub   r7           ;
CODE_098FF8:         sub   r6           ;
CODE_098FF9:         sub   r6           ;
CODE_098FFA:         bpl CODE_098FFF    ;
CODE_098FFC:         nop                ;
CODE_098FFD:         stop               ;
CODE_098FFE:         nop                ;

CODE_098FFF:         dec   r8           ;
CODE_099000:         dec   r8           ;
CODE_099001:         dec   r11          ;
CODE_099002:         dec   r11          ;
CODE_099003:         with r11           ;
CODE_099004:         sub   r2           ;
CODE_099005:         with r8            ;
CODE_099006:         sub   r2           ;
CODE_099007:         with r9            ;
CODE_099008:         sub   r2           ;
CODE_099009:         with r10           ;
CODE_09900A:         sub   r2           ;
CODE_09900B:         with r14           ;
CODE_09900C:         sub   r2           ;
CODE_09900D:         loop               ;
CODE_09900E:         from r14           ;
CODE_09900F:         stop               ;
CODE_099010:         nop                ;

CODE_099011:         iwt   r9,#0F5C     ;
CODE_099014:         iwt   r11,#1D32    ;
CODE_099017:         iwt   r8,#1C12     ;
CODE_09901A:         ibt   r2,#0004     ;
CODE_09901C:         ibt   r14,#005C    ;
CODE_09901E:         from r14           ;
CODE_09901F:         to r7              ;
CODE_099020:         sub   r1           ;
CODE_099021:         from r11           ;
CODE_099022:         sub   r7           ;
CODE_099023:         to r3              ;
CODE_099024:         ldw   (r0)         ;
CODE_099025:         add   #02          ;
CODE_099027:         to r4              ;
CODE_099028:         ldw   (r0)         ;
CODE_099029:         from r8            ;
CODE_09902A:         sub   r7           ;
CODE_09902B:         to r5              ;
CODE_09902C:         ldw   (r0)         ;
CODE_09902D:         add   #02          ;
CODE_09902F:         to r6              ;
CODE_099030:         ldw   (r0)         ;
CODE_099031:         ibt   r12,#0018    ;
CODE_099033:         cache              ;
CODE_099034:         move  r13,r15      ;
CODE_099036:         from r14           ;
CODE_099037:         sub   r1           ;
CODE_099038:         beq CODE_099070    ;
CODE_09903A:         nop                ;
CODE_09903B:         ldb   (r9)         ;
CODE_09903D:         sub   #0E          ;
CODE_09903F:         bcc CODE_099070    ;
CODE_099041:         to r7              ;
CODE_099042:         ldw   (r8)         ;
CODE_099043:         from r7            ;
CODE_099044:         add   r5           ;
CODE_099045:         to r10             ;
CODE_099046:         add   r0           ;
CODE_099047:         inc   r10          ;
CODE_099048:         ldw   (r11)        ;
CODE_099049:         sub   r3           ;
CODE_09904A:         sms   (0000),r0    ;
CODE_09904D:         add   r5           ;
CODE_09904E:         add   r7           ;
CODE_09904F:         cmp   r10          ;
CODE_099051:         bcs CODE_09906F    ;
CODE_099053:         inc   r11          ;
CODE_099054:         inc   r11          ;
CODE_099055:         inc   r8           ;
CODE_099056:         inc   r8           ;
CODE_099057:         to r7              ;
CODE_099058:         ldw   (r8)         ;
CODE_099059:         from r7            ;
CODE_09905A:         add   r6           ;
CODE_09905B:         to r10             ;
CODE_09905C:         add   r0           ;
CODE_09905D:         inc   r10          ;
CODE_09905E:         ldw   (r11)        ;
CODE_09905F:         sub   r4           ;
CODE_099060:         sms   (0002),r0    ;
CODE_099063:         add   r6           ;
CODE_099064:         add   r7           ;
CODE_099065:         cmp   r10          ;
CODE_099067:         bcs CODE_09906C    ;
CODE_099069:         nop                ;
CODE_09906A:         stop               ;
CODE_09906B:         nop                ;

CODE_09906C:         dec   r8           ;
CODE_09906D:         dec   r8           ;
CODE_09906E:         dec   r11          ;
CODE_09906F:         dec   r11          ;
CODE_099070:         with r11           ;
CODE_099071:         sub   r2           ;
CODE_099072:         with r8            ;
CODE_099073:         sub   r2           ;
CODE_099074:         with r9            ;
CODE_099075:         sub   r2           ;
CODE_099076:         with r14           ;
CODE_099077:         sub   r2           ;
CODE_099078:         loop               ;
CODE_099079:         from r14           ;
CODE_09907A:         stop               ;
CODE_09907B:         nop                ;

CODE_09907C:         from r1            ;
CODE_09907D:         sub   r3           ;
CODE_09907E:         move  r5,r0        ;
CODE_099080:         bpl CODE_099085    ;
CODE_099082:         nop                ;
CODE_099083:         not                ;
CODE_099084:         inc   r0           ;
CODE_099085:         move  r7,r0        ;
CODE_099087:         from r2            ;
CODE_099088:         sub   r4           ;
CODE_099089:         move  r8,r0        ;
CODE_09908B:         bpl CODE_099090    ;
CODE_09908D:         nop                ;
CODE_09908E:         not                ;
CODE_09908F:         inc   r0           ;
CODE_099090:         move  r9,r0        ;
CODE_099092:         sub   r7           ;
CODE_099093:         bcs CODE_09909C    ;
CODE_099095:         ror                ;
CODE_099096:         move  r0,r7        ;
CODE_099098:         move  r7,r9        ;
CODE_09909A:         move  r9,r0        ;
CODE_09909C:         move  r10,r0       ;
CODE_09909E:         with r7            ;
CODE_09909F:         lmult              ;
CODE_0990A1:         sub   r0           ;
CODE_0990A2:         move  r2,r0        ;
CODE_0990A4:         ibt   r12,#0020    ;
CODE_0990A6:         iwt   r13,#90AB    ;
CODE_0990A9:         cache              ;
CODE_0990AA:         with r2            ;
CODE_0990AB:         add   r2           ;
CODE_0990AC:         with r4            ;
CODE_0990AD:         add   r4           ;
CODE_0990AE:         with r7            ;
CODE_0990AF:         rol                ;
CODE_0990B0:         rol                ;
CODE_0990B1:         sub   r9           ;
CODE_0990B2:         bcc CODE_0990B7    ;
CODE_0990B4:         add   r9           ;
CODE_0990B5:         sub   r9           ;
CODE_0990B6:         inc   r2           ;
CODE_0990B7:         loop               ;
CODE_0990B8:         moves r10,r10      ;
CODE_0990BB:         bpl CODE_0990C4    ;
CODE_0990BD:         nop                ;
CODE_0990BE:         move  r0,r6        ;
CODE_0990C0:         move  r6,r2        ;
CODE_0990C2:         move  r2,r0        ;
CODE_0990C4:         move  r1,r6        ;
CODE_0990C6:         moves r5,r5        ;
CODE_0990C8:         bpl CODE_0990CD    ;
CODE_0990CA:         with r1            ;
CODE_0990CB:         not                ;
CODE_0990CC:         inc   r1           ;
CODE_0990CD:         moves r8,r8        ;
CODE_0990CF:         bpl CODE_0990D4    ;
CODE_0990D1:         with r2            ;
CODE_0990D2:         not                ;
CODE_0990D3:         inc   r2           ;
CODE_0990D4:         stop               ;
CODE_0990D5:         nop                ;

CODE_0990D6:         ibt   r0,#0008     ;
CODE_0990D8:         romb               ;
CODE_0990DA:         ibt   r2,#0006     ;
CODE_0990DC:         ibt   r9,#0055     ;
CODE_0990DE:         ibt   r10,#0040    ;
CODE_0990E0:         iwt   r11,#AE18    ;
CODE_0990E3:         from r11           ;
CODE_0990E4:         to r14             ;
CODE_0990E5:         add   r7           ;
CODE_0990E6:         cache              ;
CODE_0990E7:         iwt   r12,#0003    ;
CODE_0990EA:         iwt   r13,#90EE    ;
CODE_0990ED:         getb               ;
CODE_0990EE:         with r14           ;
CODE_0990EF:         add   r10          ;
CODE_0990F0:         mult  r8           ;
CODE_0990F1:         hib                ;
CODE_0990F2:         sex                ;
CODE_0990F3:         dec   r6           ;
CODE_0990F4:         bmi CODE_0990F9    ;
CODE_0990F6:         inc   r6           ;
CODE_0990F7:         not                ;
CODE_0990F8:         inc   r0           ;
CODE_0990F9:         add   r4           ;
CODE_0990FA:         stw   (r1)         ;
CODE_0990FB:         inc   r1           ;
CODE_0990FC:         inc   r1           ;
CODE_0990FD:         getb               ;
CODE_0990FE:         with r7            ;
CODE_0990FF:         add   r9           ;
CODE_099100:         with r7            ;
CODE_099101:         lob                ;
CODE_099102:         from r11           ;
CODE_099103:         to r14             ;
CODE_099104:         add   r7           ;
CODE_099105:         mult  r8           ;
CODE_099106:         hib                ;
CODE_099107:         sex                ;
CODE_099108:         add   r5           ;
CODE_099109:         stw   (r1)         ;
CODE_09910A:         with r1            ;
CODE_09910B:         add   r2           ;
CODE_09910C:         loop               ;
CODE_09910D:         getb               ;
CODE_09910E:         stop               ;
CODE_09910F:         nop                ;

DATA_099110:         dw $2A22, $2E2C, $2600, $0000
DATA_099118:         dw $0028, $0000, $0402, $0E0C
DATA_099120:         dw $0620, $0A08

CODE_099126:         ibt r7,#0010       ;
CODE_099128:         from r4            ;
CODE_099129:         sub   r7           ;
CODE_09912A:         lsr                ;
CODE_09912B:         with r2            ;
CODE_09912C:         sub   r0           ;
CODE_09912D:         from r5            ;
CODE_09912E:         sub   r7           ;
CODE_09912F:         lsr                ;
CODE_099130:         with r3            ;
CODE_099131:         sub   r0           ;
CODE_099132:         ibt   r0,#0009     ;
CODE_099134:         romb               ;
CODE_099136:         from r5            ;
CODE_099137:         sub   r7           ;
CODE_099138:         bne CODE_09914A    ;
CODE_09913A:         from r4            ;
CODE_09913B:         sub   r7           ;
CODE_09913C:         bne CODE_099145    ;
CODE_09913E:         iwt   r14,#9110    ;
CODE_099141:         bra CODE_099156    ;

CODE_099143:         nop                ;
CODE_099144:         iwt   r14,#9111    ;
CODE_099147:         bra CODE_099156    ;

CODE_099149:         nop                ;
CODE_09914A:         sub   r7           ;
CODE_09914B:         bne CODE_099154    ;
CODE_09914D:         iwt   r14,#9114    ;
CODE_099150:         bra CODE_099156    ;

CODE_099152:         nop                ;

CODE_099153:         iwt   r14,#911D    ;
CODE_099156:         ibt   r9,#0002     ;
CODE_099158:         iwt   r13,#8000    ;
CODE_09915B:         cache              ;
CODE_09915C:         link  #04          ;
CODE_09915D:         iwt   r15,#9188    ;
CODE_099160:         nop                ;
CODE_099161:         with r5            ;
CODE_099162:         sub   r7           ;
CODE_099163:         beq CODE_099186    ;
CODE_099165:         nop                ;
CODE_099166:         with r3            ;
CODE_099167:         add   r7           ;
CODE_099168:         with r5            ;
CODE_099169:         sub   r7           ;
CODE_09916A:         beq CODE_09917B    ;
CODE_09916C:         nop                ;
CODE_09916D:         link  #04          ;
CODE_09916E:         iwt   r15,#9188    ;
CODE_099171:         nop                ;
CODE_099172:         with r14           ;
CODE_099173:         sub   #03          ;
CODE_099175:         with r6            ;
CODE_099176:         xor   r13          ;
CODE_099178:         bra CODE_099167    ;

CODE_09917A:         with r3            ;
CODE_09917B:         with r14           ;
CODE_09917C:         add   #03          ;
CODE_09917E:         with r6            ;
CODE_09917F:         bic   r13          ;
CODE_099181:         link  #04          ;
CODE_099182:         iwt   r15,#9188    ;
CODE_099185:         nop                ;
CODE_099186:         stop               ;
CODE_099187:         nop                ;

CODE_099188:         move  r8,r2        ;
CODE_09918A:         move  r10,r4       ;
CODE_09918C:         from r8            ;
CODE_09918D:         stw   (r1)         ;
CODE_09918E:         inc   r1           ;
CODE_09918F:         inc   r1           ;
CODE_099190:         from r3            ;
CODE_099191:         stw   (r1)         ;
CODE_099192:         inc   r1           ;
CODE_099193:         inc   r1           ;
CODE_099194:         getb               ;
CODE_099195:         inc   r14          ;
CODE_099196:         add   r6           ;
CODE_099197:         stw   (r1)         ;
CODE_099198:         inc   r1           ;
CODE_099199:         inc   r1           ;
CODE_09919A:         from r9            ;
CODE_09919B:         stw   (r1)         ;
CODE_09919C:         with r10           ;
CODE_09919D:         sub   r7           ;
CODE_09919E:         beq CODE_0991D1    ;
CODE_0991A0:         inc   r1           ;
CODE_0991A1:         inc   r1           ;
CODE_0991A2:         getb               ;
CODE_0991A3:         inc   r14          ;
CODE_0991A4:         to r12             ;
CODE_0991A5:         add   r6           ;
CODE_0991A6:         with r8            ;
CODE_0991A7:         add   r7           ;
CODE_0991A8:         with r10           ;
CODE_0991A9:         sub   r7           ;
CODE_0991AA:         beq CODE_0991BE    ;
CODE_0991AC:         from r8            ;
CODE_0991AD:         stw   (r1)         ;
CODE_0991AE:         inc   r1           ;
CODE_0991AF:         inc   r1           ;
CODE_0991B0:         from r3            ;
CODE_0991B1:         stw   (r1)         ;
CODE_0991B2:         inc   r1           ;
CODE_0991B3:         inc   r1           ;
CODE_0991B4:         from r12           ;
CODE_0991B5:         stw   (r1)         ;
CODE_0991B6:         inc   r1           ;
CODE_0991B7:         inc   r1           ;
CODE_0991B8:         from r9            ;
CODE_0991B9:         stw   (r1)         ;
CODE_0991BA:         inc   r1           ;
CODE_0991BB:         bra CODE_0991A6    ;

CODE_0991BD:         inc   r1           ;

CODE_0991BE:         from r8            ;
CODE_0991BF:         stw   (r1)         ;
CODE_0991C0:         inc   r1           ;
CODE_0991C1:         inc   r1           ;
CODE_0991C2:         from r3            ;
CODE_0991C3:         stw   (r1)         ;
CODE_0991C4:         inc   r1           ;
CODE_0991C5:         inc   r1           ;
CODE_0991C6:         getb               ;
CODE_0991C7:         inc   r14          ;
CODE_0991C8:         add   r6           ;
CODE_0991C9:         stw   (r1)         ;
CODE_0991CA:         inc   r1           ;
CODE_0991CB:         inc   r1           ;
CODE_0991CC:         from r9            ;
CODE_0991CD:         stw   (r1)         ;
CODE_0991CE:         inc   r1           ;
CODE_0991CF:         jmp   r11          ;
CODE_0991D0:         inc   r1           ;

CODE_0991D1:         inc   r14          ;
CODE_0991D2:         inc   r14          ;
CODE_0991D3:         jmp   r11          ;
CODE_0991D4:         inc   r1           ;

CODE_0991D5:         iwt   r4,#0022     ;
CODE_0991D8:         iwt   r5,#002C     ;
CODE_0991DB:         ibt   r1,#0004     ;
CODE_0991DD:         iwt   r2,#0F00     ;
CODE_0991E0:         iwt   r3,#1360     ;
CODE_0991E3:         ibt   r6,#0000     ;
CODE_0991E5:         cache              ;
CODE_0991E6:         ibt   r12,#0018    ;
CODE_0991E8:         move  r13,r15      ;
CODE_0991EA:         ldw   (r2)         ;
CODE_0991EB:         sub   #00          ;
CODE_0991ED:         beq CODE_0991FC    ;
CODE_0991EF:         nop                ;
CODE_0991F0:         ldw   (r3)         ;
CODE_0991F1:         cmp   r4           ;
CODE_0991F3:         bcc CODE_0991FC    ;
CODE_0991F5:         nop                ;
CODE_0991F6:         cmp   r5           ;
CODE_0991F8:         bcs CODE_0991FC    ;
CODE_0991FA:         nop                ;
CODE_0991FB:         inc   r6           ;
CODE_0991FC:         with r2            ;
CODE_0991FD:         add   r1           ;
CODE_0991FE:         with r3            ;
CODE_0991FF:         add   r1           ;
CODE_099200:         loop               ;
CODE_099201:         nop                ;
CODE_099202:         stop               ;
CODE_099203:         nop                ;

CODE_099204:         iwt   r4,#0022     ;
CODE_099207:         iwt   r5,#002C     ;
CODE_09920A:         iwt   r7,#001E     ;
CODE_09920D:         iwt   r8,#0133     ;
CODE_099210:         iwt   r9,#019A     ;
CODE_099213:         iwt   r11,#00F3    ;
CODE_099216:         ibt   r1,#0004     ;
CODE_099218:         iwt   r2,#0F00     ;
CODE_09921B:         iwt   r3,#1360     ;
CODE_09921E:         ibt   r6,#0000     ;
CODE_099220:         cache              ;
CODE_099221:         ibt   r12,#0018    ;
CODE_099223:         move  r13,r15      ;
CODE_099225:         ldw   (r2)         ;
CODE_099226:         sub   #00          ;
CODE_099228:         beq CODE_09924B    ;
CODE_09922A:         nop                ;
CODE_09922B:         ldw   (r3)         ;
CODE_09922C:         cmp   r4           ;
CODE_09922E:         bcc CODE_099236    ;
CODE_099230:         nop                ;
CODE_099231:         cmp   r5           ;
CODE_099233:         bcc CODE_09924A    ;
CODE_099235:         nop                ;
CODE_099236:         cmp   r7           ;
CODE_099238:         beq CODE_09924A    ;
CODE_09923A:         nop                ;
CODE_09923B:         cmp   r8           ;
CODE_09923D:         beq CODE_09924A    ;
CODE_09923F:         nop                ;
CODE_099240:         cmp   r9           ;
CODE_099242:         beq CODE_09924A    ;
CODE_099244:         nop                ;
CODE_099245:         cmp   r11          ;
CODE_099247:         bne CODE_09924B    ;
CODE_099249:         nop                ;
CODE_09924A:         inc   r6           ;
CODE_09924B:         with r2            ;
CODE_09924C:         add   r1           ;
CODE_09924D:         with r3            ;
CODE_09924E:         add   r1           ;
CODE_09924F:         loop               ;
CODE_099250:         nop                ;
CODE_099251:         stop               ;
CODE_099252:         nop                ;

CODE_099253:         iwt   r5,#13BC     ;
CODE_099256:         iwt   r6,#0F5C     ;
CODE_099259:         iwt   r7,#1D32     ;
CODE_09925C:         iwt   r8,#1D34     ;
CODE_09925F:         iwt   r9,#0FFF     ;
CODE_099262:         from r10           ;
CODE_099263:         to r14             ;
CODE_099264:         add   r10          ;
CODE_099265:         cache              ;
CODE_099266:         ibt   r12,#0018    ;
CODE_099268:         move  r13,r15      ;
CODE_09926A:         ldb   (r6)         ;
CODE_09926C:         sub   #0F          ;
CODE_09926E:         bmi CODE_09927F    ;
CODE_099270:         nop                ;
CODE_099271:         ldw   (r7)         ;
CODE_099272:         sub   r1           ;
CODE_099273:         add   r10          ;
CODE_099274:         sub   r14          ;
CODE_099275:         bcs CODE_09927F    ;
CODE_099277:         nop                ;
CODE_099278:         ldw   (r8)         ;
CODE_099279:         sub   r2           ;
CODE_09927A:         add   r10          ;
CODE_09927B:         sub   r14          ;
CODE_09927C:         bcc CODE_099284    ;
CODE_09927E:         from r12           ;
CODE_09927F:         iwt   r15,#932B    ;
CODE_099282:         ibt   r0,#0004     ;
CODE_099284:         sub   #01          ;
CODE_099286:         add   r0           ;
CODE_099287:         sms   (004C),r6    ;
CODE_09928A:         to r6              ;
CODE_09928B:         add   r0           ;
CODE_09928C:         iwt   r3,#0108     ;
CODE_09928F:         ldw   (r5)         ;
CODE_099290:         cmp   r3           ;
CODE_099292:         beq CODE_0992A5    ;
CODE_099294:         nop                ;
CODE_099295:         iwt   r3,#9220     ;
CODE_099298:         cmp   r3           ;
CODE_09929A:         beq CODE_0992A5    ;
CODE_09929C:         nop                ;
CODE_09929D:         iwt   r3,#9220     ;
CODE_0992A0:         cmp   r3           ;
CODE_0992A2:         bne CODE_0992BE    ;
CODE_0992A4:         nop                ;
CODE_0992A5:         iwt   r0,#19D6     ;
CODE_0992A8:         add   r6           ;
CODE_0992A9:         ldw   (r0)         ;
CODE_0992AA:         sub   #00          ;
CODE_0992AC:         bne CODE_099327    ;
CODE_0992AE:         nop                ;
CODE_0992AF:         iwt   r0,#1040     ;
CODE_0992B2:         add   r6           ;
CODE_0992B3:         to r11             ;
CODE_0992B4:         ldw   (r0)         ;
CODE_0992B5:         iwt   r0,#1900     ;
CODE_0992B8:         add   r6           ;
CODE_0992B9:         from r11           ;
CODE_0992BA:         stw   (r0)         ;
CODE_0992BB:         bra CODE_0992E0    ;

CODE_0992BD:         nop                ;

CODE_0992BE:         iwt   r3,#0132     ;
CODE_0992C1:         cmp   r3           ;
CODE_0992C3:         bne CODE_0992D9    ;
CODE_0992C5:         nop                ;
CODE_0992C6:         iwt   r0,#19D6     ;
CODE_0992C9:         add   r6           ;
CODE_0992CA:         ldw   (r0)         ;
CODE_0992CB:         sub   #03          ;
CODE_0992CD:         beq CODE_099327    ;
CODE_0992CF:         nop                ;
CODE_0992D0:         dec   r0           ;
CODE_0992D1:         bne CODE_0992E0    ;
CODE_0992D3:         nop                ;
CODE_0992D4:         bra CODE_099328    ;

CODE_0992D6:         lms   r6,(004C)    ;
CODE_0992D9:         ldb   (r9)         ;
CODE_0992DB:         and   #08          ;
CODE_0992DD:         beq CODE_099327    ;
CODE_0992DF:         nop                ;
CODE_0992E0:         lms   r4,(0000)    ;
CODE_0992E3:         ldw   (r7)         ;
CODE_0992E4:         sub   r1           ;
CODE_0992E5:         bpl CODE_0992EB    ;
CODE_0992E7:         nop                ;
CODE_0992E8:         with r4            ;
CODE_0992E9:         not                ;
CODE_0992EA:         inc   r4           ;
CODE_0992EB:         iwt   r0,#1220     ;
CODE_0992EE:         add   r6           ;
CODE_0992EF:         from r4            ;
CODE_0992F0:         stw   (r0)         ;
CODE_0992F1:         lms   r4,(0002)    ;
CODE_0992F4:         iwt   r0,#1222     ;
CODE_0992F7:         add   r6           ;
CODE_0992F8:         from r4            ;
CODE_0992F9:         stw   (r0)         ;
CODE_0992FA:         with r4            ;
CODE_0992FB:         sub   r4           ;
CODE_0992FC:         iwt   r0,#1978     ;
CODE_0992FF:         add   r6           ;
CODE_099300:         from r4            ;
CODE_099301:         stw   (r0)         ;
CODE_099302:         iwt   r0,#1540     ;
CODE_099305:         add   r6           ;
CODE_099306:         from r4            ;
CODE_099307:         stw   (r0)         ;
CODE_099308:         inc   r4           ;
CODE_099309:         iwt   r0,#1D38     ;
CODE_09930C:         add   r6           ;
CODE_09930D:         from r4            ;
CODE_09930E:         stw   (r0)         ;
CODE_09930F:         ibt   r4,#0040     ;
CODE_099311:         iwt   r0,#1542     ;
CODE_099314:         add   r6           ;
CODE_099315:         from r4            ;
CODE_099316:         stw   (r0)         ;
CODE_099317:         iwt   r4,#FFFC     ;
CODE_09931A:         ldw   (r9)         ;
CODE_09931B:         and   r4           ;
CODE_09931C:         sbk                ;
CODE_09931D:         iwt   r4,#F9FF     ;
CODE_099320:         iwt   r0,#0FA0     ;
CODE_099323:         add   r6           ;
CODE_099324:         ldw   (r0)         ;
CODE_099325:         and   r4           ;
CODE_099326:         sbk                ;
CODE_099327:         lms   r6,(004C)    ;
CODE_09932A:         ibt   r0,#0004     ;
CODE_09932C:         with r5            ;
CODE_09932D:         sub   r0           ;
CODE_09932E:         with r6            ;
CODE_09932F:         sub   r0           ;
CODE_099330:         with r7            ;
CODE_099331:         sub   r0           ;
CODE_099332:         with r8            ;
CODE_099333:         sub   r0           ;
CODE_099334:         with r9            ;
CODE_099335:         sub   r0           ;
CODE_099336:         loop               ;
CODE_099337:         nop                ;
CODE_099338:         stop               ;
CODE_099339:         nop                ;

CODE_09933A:         cache              ;
CODE_09933B:         ibt   r12,#0018    ;
CODE_09933D:         move  r13,r15      ;
CODE_09933F:         iwt   r2,#0010     ;
CODE_099342:         from r12           ;
CODE_099343:         sub   #01          ;
CODE_099345:         add   r0           ;
CODE_099346:         to r1              ;
CODE_099347:         add   r0           ;
CODE_099348:         iwt   r0,#0F00     ;
CODE_09934B:         add   r1           ;
CODE_09934C:         ldw   (r0)         ;
CODE_09934D:         sub   r2           ;
CODE_09934E:         bne CODE_09939E    ;
CODE_099350:         nop                ;
CODE_099351:         iwt   r3,#0007     ;
CODE_099354:         ibt   r0,#0009     ;
CODE_099356:         romb               ;
CODE_099358:         iwt   r14,#93A5    ;
CODE_09935B:         getb               ;
CODE_09935C:         inc   r14          ;
CODE_09935D:         to r2              ;
CODE_09935E:         getbh              ;
CODE_099360:         iwt   r0,#1360     ;
CODE_099363:         add   r1           ;
CODE_099364:         ldw   (r0)         ;
CODE_099365:         sub   r2           ;
CODE_099366:         beq CODE_09936F    ;
CODE_099368:         dec   r3           ;
CODE_099369:         bne CODE_09935B    ;
CODE_09936B:         inc   r14          ;
CODE_09936C:         bra CODE_09939E    ;

CODE_09936E:         nop                ;

CODE_09936F:         iwt   r0,#1CD6     ;
CODE_099372:         add   r1           ;
CODE_099373:         ldw   (r0)         ;
CODE_099374:         to r2              ;
CODE_099375:         sub   r5           ;
CODE_099376:         bpl CODE_09937B    ;
CODE_099378:         with r2            ;
CODE_099379:         not                ;
CODE_09937A:         inc   r2           ;
CODE_09937B:         iwt   r0,#1BB6     ;
CODE_09937E:         add   r1           ;
CODE_09937F:         ldw   (r0)         ;
CODE_099380:         add   r7           ;
CODE_099381:         sub   r2           ;
CODE_099382:         bmi CODE_09939E    ;
CODE_099384:         nop                ;
CODE_099385:         iwt   r0,#1CD8     ;
CODE_099388:         add   r1           ;
CODE_099389:         ldw   (r0)         ;
CODE_09938A:         to r2              ;
CODE_09938B:         sub   r6           ;
CODE_09938C:         bpl CODE_099391    ;
CODE_09938E:         with r2            ;
CODE_09938F:         not                ;
CODE_099390:         inc   r2           ;
CODE_099391:         iwt   r0,#1BB8     ;
CODE_099394:         add   r1           ;
CODE_099395:         ldw   (r0)         ;
CODE_099396:         add   r7           ;
CODE_099397:         sub   r2           ;
CODE_099398:         bmi CODE_09939E    ;
CODE_09939A:         nop                ;
CODE_09939B:         bra CODE_0993A3    ;

CODE_09939D:         nop                ;

CODE_09939E:         loop               ;
CODE_09939F:         nop                ;
CODE_0993A0:         iwt   r1,#FFFF     ;
CODE_0993A3:         stop               ;
CODE_0993A4:         nop                ;

DATA_0993A5:         dw $00DE, $0089, $008A, $0185
DATA_0993AD:         dw $0186, $0189, $018A

CODE_0993B3:         lms   r1,(0094)    ;
CODE_0993B6:         lm    r0,(1E0C)    ;
CODE_0993BA:         to r2              ;
CODE_0993BB:         lob                ;
CODE_0993BC:         moves r6,r8        ;
CODE_0993BE:         beq CODE_0993D8    ;
CODE_0993C0:         from r2            ;
CODE_0993C1:         lmult              ;
CODE_0993C3:         with r4            ;
CODE_0993C4:         hib                ;
CODE_0993C5:         lob                ;
CODE_0993C6:         swap               ;
CODE_0993C7:         to r3              ;
CODE_0993C8:         or    r4           ;
CODE_0993C9:         from r1            ;
CODE_0993CA:         lmult              ;
CODE_0993CC:         with r4            ;
CODE_0993CD:         add   r3           ;
CODE_0993CE:         with r4            ;
CODE_0993CF:         hib                ;
CODE_0993D0:         adc   #00          ;
CODE_0993D2:         lob                ;
CODE_0993D3:         swap               ;
CODE_0993D4:         or    r4           ;
CODE_0993D5:         sms   (0096),r0    ;
CODE_0993D8:         moves r6,r10       ;
CODE_0993DA:         beq CODE_0993F4    ;
CODE_0993DC:         from r2            ;
CODE_0993DD:         lmult              ;
CODE_0993DF:         with r4            ;
CODE_0993E0:         hib                ;
CODE_0993E1:         lob                ;
CODE_0993E2:         swap               ;
CODE_0993E3:         to r3              ;
CODE_0993E4:         or    r4           ;
CODE_0993E5:         from r1            ;
CODE_0993E6:         lmult              ;
CODE_0993E8:         with r4            ;
CODE_0993E9:         add   r3           ;
CODE_0993EA:         with r4            ;
CODE_0993EB:         hib                ;
CODE_0993EC:         adc   #00          ;
CODE_0993EE:         lob                ;
CODE_0993EF:         swap               ;
CODE_0993F0:         or    r4           ;
CODE_0993F1:         sms   (0098),r0    ;
CODE_0993F4:         moves r6,r12       ;
CODE_0993F6:         beq CODE_099410    ;
CODE_0993F8:         from r2            ;
CODE_0993F9:         lmult              ;
CODE_0993FB:         with r4            ;
CODE_0993FC:         hib                ;
CODE_0993FD:         lob                ;
CODE_0993FE:         swap               ;
CODE_0993FF:         to r3              ;
CODE_099400:         or    r4           ;
CODE_099401:         from r1            ;
CODE_099402:         lmult              ;
CODE_099404:         with r4            ;
CODE_099405:         add   r3           ;
CODE_099406:         with r4            ;
CODE_099407:         hib                ;
CODE_099408:         adc   #00          ;
CODE_09940A:         lob                ;
CODE_09940B:         swap               ;
CODE_09940C:         or    r4           ;
CODE_09940D:         sms   (009A),r0    ;
CODE_099410:         iwt   r0,#070C     ;
CODE_099413:         lms   r5,(009C)    ;
CODE_099416:         to r1              ;
CODE_099417:         sub   r5           ;
CODE_099418:         lm    r0,(1E0E)    ;
CODE_09941C:         to r2              ;
CODE_09941D:         lob                ;
CODE_09941E:         moves r6,r9        ;
CODE_099420:         beq CODE_09944B    ;
CODE_099422:         nop                ;
CODE_099423:         bpl CODE_09942B    ;
CODE_099425:         move  r0,r5        ;
CODE_099428:         bra CODE_099448    ;

CODE_09942A:         nop                ;

CODE_09942B:         lmult              ;
CODE_09942D:         with r4            ;
CODE_09942E:         hib                ;
CODE_09942F:         lob                ;
CODE_099430:         swap               ;
CODE_099431:         to r3              ;
CODE_099432:         or    r4           ;
CODE_099433:         from r1            ;
CODE_099434:         lmult              ;
CODE_099436:         with r4            ;
CODE_099437:         add   r3           ;
CODE_099438:         with r4            ;
CODE_099439:         hib                ;
CODE_09943A:         adc   #00          ;
CODE_09943C:         lob                ;
CODE_09943D:         swap               ;
CODE_09943E:         to r3              ;
CODE_09943F:         or    r4           ;
CODE_099440:         iwt   r0,#0326     ;
CODE_099443:         sub   r3           ;
CODE_099444:         bpl CODE_099448    ;
CODE_099446:         nop                ;
CODE_099447:         sub   r0           ;
CODE_099448:         sms   (009E),r0    ;
CODE_09944B:         moves r6,r11       ;
CODE_09944D:         beq CODE_099478    ;
CODE_09944F:         nop                ;
CODE_099450:         bpl CODE_099458    ;
CODE_099452:         move  r0,r5        ;
CODE_099455:         bra CODE_099475    ;

CODE_099457:         nop                ;

CODE_099458:         lmult              ;
CODE_09945A:         with r4            ;
CODE_09945B:         hib                ;
CODE_09945C:         lob                ;
CODE_09945D:         swap               ;
CODE_09945E:         to r3              ;
CODE_09945F:         or    r4           ;
CODE_099460:         from r1            ;
CODE_099461:         lmult              ;
CODE_099463:         with r4            ;
CODE_099464:         add   r3           ;
CODE_099465:         with r4            ;
CODE_099466:         hib                ;
CODE_099467:         adc   #00          ;
CODE_099469:         lob                ;
CODE_09946A:         swap               ;
CODE_09946B:         to r3              ;
CODE_09946C:         or    r4           ;
CODE_09946D:         iwt   r0,#0126     ;
CODE_099470:         sub   r3           ;
CODE_099471:         bpl CODE_099475    ;
CODE_099473:         nop                ;
CODE_099474:         sub   r0           ;
CODE_099475:         sms   (00A0),r0    ;
CODE_099478:         moves r6,r13       ;
CODE_09947A:         beq CODE_0994A5    ;
CODE_09947C:         nop                ;
CODE_09947D:         bpl CODE_099485    ;
CODE_09947F:         move  r0,r5        ;
CODE_099482:         bra CODE_0994A2    ;

CODE_099484:         nop                ;

CODE_099485:         lmult              ;
CODE_099487:         with r4            ;
CODE_099488:         hib                ;
CODE_099489:         lob                ;
CODE_09948A:         swap               ;
CODE_09948B:         to r3              ;
CODE_09948C:         or    r4           ;
CODE_09948D:         from r1            ;
CODE_09948E:         lmult              ;
CODE_099490:         with r4            ;
CODE_099491:         add   r3           ;
CODE_099492:         with r4            ;
CODE_099493:         hib                ;
CODE_099494:         adc   #00          ;
CODE_099496:         lob                ;
CODE_099497:         swap               ;
CODE_099498:         to r3              ;
CODE_099499:         or    r4           ;
CODE_09949A:         iwt   r0,#0126     ;
CODE_09949D:         sub   r3           ;
CODE_09949E:         bpl CODE_0994A2    ;
CODE_0994A0:         nop                ;
CODE_0994A1:         sub   r0           ;
CODE_0994A2:         sms   (00A2),r0    ;
CODE_0994A5:         stop               ;
CODE_0994A6:         nop                ;

DATA_0994A7:         db $00, $00, $00, $06, $00, $00, $06, $00
DATA_0994AF:         db $00, $04, $00, $00, $06, $00, $00, $02
DATA_0994B7:         db $00, $00, $06, $00, $00, $01, $00, $00
DATA_0994BF:         db $06, $00, $00, $06, $00, $00, $02, $00
DATA_0994C7:         db $00, $01, $01, $00, $04, $00, $00, $01
DATA_0994CF:         db $00, $01, $01, $01, $01, $00, $00, $00

; update camera
CODE_0994D7:         lm    r0,(1E2A)    ;
CODE_0994DB:         sub   #00          ;
CODE_0994DD:         beq CODE_0994F9    ;
CODE_0994DF:         nop                ;
CODE_0994E0:         bmi CODE_0994F3    ;
CODE_0994E2:         sub   r0           ;
CODE_0994E3:         lm    r0,(1E36)    ;
CODE_0994E7:         to r1              ;
CODE_0994E8:         add   r0           ;
CODE_0994E9:         iwt   r13,#0000    ;
CODE_0994EC:         lm    r0,(1E2E)    ;
CODE_0994F0:         bra CODE_09951B    ;

CODE_0994F2:         nop                ;
CODE_0994F3:         ibt   r1,#0000     ;
CODE_0994F5:         iwt   r15,#958A    ;
CODE_0994F8:         nop                ;
CODE_0994F9:         lm    r0,(1E10)    ;
CODE_0994FD:         to r1              ;
CODE_0994FE:         lob                ;
CODE_0994FF:         lm    r0,(1E12)    ;
CODE_099503:         lob                ;
CODE_099504:         swap               ;
CODE_099505:         to r1              ;
CODE_099506:         or    r1           ;
CODE_099507:         lms   r0,(008A)    ;
CODE_09950A:         to r3              ;
CODE_09950B:         lob                ;
CODE_09950C:         lms   r0,(008C)    ;
CODE_09950F:         lob                ;
CODE_099510:         swap               ;
CODE_099511:         or    r3           ;
CODE_099512:         sub   r1           ;
CODE_099513:         to r1              ;
CODE_099514:         add   r0           ;
CODE_099515:         iwt   r13,#0100    ;
CODE_099518:         lms   r0,(008C)    ;
CODE_09951B:         lms   r3,(0094)    ;
CODE_09951E:         sub   r3           ;
CODE_09951F:         lm    r4,(1E20)    ;
CODE_099523:         sub   r4           ;
CODE_099524:         bmi CODE_09954F    ;
CODE_099526:         nop                ;
CODE_099527:         ibt   r3,#0018     ;
CODE_099529:         sub   r3           ;
CODE_09952A:         dec   r0           ;
CODE_09952B:         bpl CODE_09954F    ;
CODE_09952D:         inc   r0           ;
CODE_09952E:         ibt   r0,#0030     ;
CODE_099530:         lms   r3,(00C4)    ;
CODE_099533:         dec   r3           ;
CODE_099534:         bmi CODE_09953A    ;
CODE_099536:         nop                ;
CODE_099537:         iwt   r0,#00A8     ;
CODE_09953A:         sub   r4           ;
CODE_09953B:         ibt   r3,#0050     ;
CODE_09953D:         add   r3           ;
CODE_09953E:         bmi CODE_099547    ;
CODE_099540:         nop                ;
CODE_099541:         iwt   r3,#00A0     ;
CODE_099544:         sub   r3           ;
CODE_099545:         bcc CODE_09954C    ;
CODE_099547:         add   r4           ;
CODE_099548:         sm    (1E20),r0    ;
CODE_09954C:         bra CODE_09958A    ;

CODE_09954E:         sub   r0           ;
CODE_09954F:         moves r1,r1        ;
CODE_099551:         bne CODE_09955E    ;
CODE_099553:         nop                ;
CODE_099554:         move  r1,r13       ;
CODE_099556:         sub   #00          ;
CODE_099558:         bpl CODE_09955E    ;
CODE_09955A:         nop                ;
CODE_09955B:         with r1            ;
CODE_09955C:         not                ;
CODE_09955D:         inc   r1           ;
CODE_09955E:         to r3              ;
CODE_09955F:         xor   r1           ;
CODE_099561:         bpl CODE_099567    ;
CODE_099563:         to r4              ;
CODE_099564:         to    r4           ;
CODE_099564:         bra CODE_099588    ;

CODE_099566:         add   r4           ;
CODE_099567:         move  r3,r0        ;
CODE_099569:         move  r4,r13       ;
CODE_09956B:         moves r1,r1        ;
CODE_09956D:         bpl CODE_099573    ;
CODE_09956F:         nop                ;
CODE_099570:         with r4            ;
CODE_099571:         not                ;
CODE_099572:         inc   r4           ;
CODE_099573:         from r1            ;
CODE_099574:         sub   r4           ;
CODE_099575:         xor   r1           ;
CODE_099577:         bpl CODE_09957C    ;
CODE_099579:         nop                ;
CODE_09957A:         move  r1,r4        ;
CODE_09957C:         move  r0,r3        ;
CODE_09957E:         ibt   r4,#0030     ;
CODE_099580:         moves r1,r1        ;
CODE_099582:         bpl CODE_099589    ;
CODE_099584:         from r4            ;
CODE_099585:         iwt   r4,#00A8     ;
CODE_099588:         from r4            ;
CODE_099589:         sbk                ;
CODE_09958A:         to r3              ;
CODE_09958B:         add   #0A          ;
CODE_09958D:         bmi CODE_099596    ;
CODE_09958F:         nop                ;
CODE_099590:         to r3              ;
CODE_099591:         sub   #0A          ;
CODE_099593:         bmi CODE_099597    ;
CODE_099595:         nop                ;
CODE_099596:         sub   r3           ;
CODE_099597:         lob                ;
CODE_099598:         swap               ;
CODE_099599:         xor   r1           ;
CODE_09959B:         bpl CODE_09959F    ;
CODE_09959D:         nop                ;
CODE_09959E:         from r1            ;
CODE_09959F:         xor   r1           ;
CODE_0995A1:         sub   r1           ;
CODE_0995A2:         to r3              ;
CODE_0995A3:         xor   r1           ;
CODE_0995A5:         bpl CODE_0995AA    ;
CODE_0995A7:         add   r1           ;
CODE_0995A8:         move  r1,r0        ;
CODE_0995AA:         lm    r0,(1E0C)    ;
CODE_0995AE:         lob                ;
CODE_0995AF:         add   r1           ;
CODE_0995B0:         sbk                ;
CODE_0995B1:         hib                ;
CODE_0995B2:         sex                ;
CODE_0995B3:         lms   r1,(0094)    ;
CODE_0995B6:         add   r1           ;
CODE_0995B7:         lm    r1,(1E18)    ;
CODE_0995BB:         sub   r1           ;
CODE_0995BC:         bpl CODE_0995C6    ;
CODE_0995BE:         add   r1           ;
CODE_0995BF:         sub   r0           ;
CODE_0995C0:         sm    (1E0C),r0    ;
CODE_0995C4:         move  r0,r1        ;
CODE_0995C6:         lm    r1,(1E1A)    ;
CODE_0995CA:         sub   r1           ;
CODE_0995CB:         bmi CODE_0995D5    ;
CODE_0995CD:         add   r1           ;
CODE_0995CE:         sub   r0           ;
CODE_0995CF:         sm    (1E0C),r0    ;
CODE_0995D3:         move  r0,r1        ;
CODE_0995D5:         move  r1,r0        ;
CODE_0995D7:         lm    r0,(1E2A)    ;
CODE_0995DB:         sub   #00          ;
CODE_0995DD:         beq CODE_099600    ;
CODE_0995DF:         nop                ;
CODE_0995E0:         bmi CODE_0995F8    ;
CODE_0995E2:         nop                ;
CODE_0995E3:         lm    r2,(1E38)    ;
CODE_0995E7:         from r2            ;
CODE_0995E8:         div2               ;
CODE_0995EA:         div2               ;
CODE_0995EC:         to r2              ;
CODE_0995ED:         add   r2           ;
CODE_0995EE:         iwt   r13,#0000    ;
CODE_0995F1:         lm    r0,(1E30)    ;
CODE_0995F5:         bra CODE_099628    ;

CODE_0995F7:         nop                ;
CODE_0995F8:         ibt   r3,#0000     ;
CODE_0995FA:         ibt   r2,#0000     ;
CODE_0995FC:         iwt   r15,#970D    ;
CODE_0995FF:         nop                ;
CODE_099600:         lm    r0,(1E14)    ;
CODE_099604:         to r2              ;
CODE_099605:         lob                ;
CODE_099606:         lm    r0,(1E16)    ;
CODE_09960A:         lob                ;
CODE_09960B:         swap               ;
CODE_09960C:         to r2              ;
CODE_09960D:         or    r2           ;
CODE_09960E:         lms   r0,(008E)    ;
CODE_099611:         to r3              ;
CODE_099612:         lob                ;
CODE_099613:         lms   r0,(0090)    ;
CODE_099616:         lob                ;
CODE_099617:         swap               ;
CODE_099618:         or    r3           ;
CODE_099619:         sub   r2           ;
CODE_09961A:         move  r2,r0        ;
CODE_09961C:         div2               ;
CODE_09961E:         div2               ;
CODE_099620:         to r2              ;
CODE_099621:         add   r2           ;
CODE_099622:         iwt   r13,#0200    ;
CODE_099625:         lms   r0,(0090)    ;
CODE_099628:         lms   r3,(009C)    ;
CODE_09962B:         sub   r3           ;
CODE_09962C:         lm    r4,(1E22)    ;
CODE_099630:         to r3              ;
CODE_099631:         sub   r4           ;
CODE_099632:         bmi CODE_09963B    ;
CODE_099634:         with r3            ;
CODE_099635:         sub   #08          ;
CODE_099637:         bpl CODE_09963B    ;
CODE_099639:         to r3              ;
CODE_09963A:         sub   r0           ;
CODE_09963B:         lm    r0,(1E2A)    ;
CODE_09963F:         sub   #00          ;
CODE_099641:         beq CODE_099648    ;
CODE_099643:         nop                ;
CODE_099644:         iwt   r15,#970D    ;
CODE_099647:         nop                ;
CODE_099648:         lm    r5,(0071)    ;
CODE_09964C:         from r5            ;
CODE_09964D:         bic   #0C          ;
CODE_09964F:         lms   r14,(00A8)   ;
CODE_099652:         or    r14          ;
CODE_099653:         lms   r14,(00C0)   ;
CODE_099656:         or    r14          ;
CODE_099657:         bne CODE_09968A    ;
CODE_099659:         sub   r0           ;
CODE_09965A:         lms   r0,(00AE)    ;
CODE_09965D:         sub   #04          ;
CODE_09965F:         beq CODE_09968A    ;
CODE_099661:         from r5            ;
CODE_099662:         and   #0C          ;
CODE_099664:         beq CODE_099683    ;
CODE_099666:         sub   r0           ;
CODE_099667:         lm    r0,(1E24)    ;
CODE_09966B:         inc   r0           ;
CODE_09966C:         ibt   r4,#0010     ;
CODE_09966E:         sub   r4           ;
CODE_09966F:         bcc CODE_099683    ;
CODE_099671:         add   r4           ;
CODE_099672:         iwt   r4,#00A0     ;
CODE_099675:         from r5            ;
CODE_099676:         and   #08          ;
CODE_099678:         bne CODE_09967D    ;
CODE_09967A:         nop                ;
CODE_09967B:         ibt   r4,#0064     ;
CODE_09967D:         sub   r0           ;
CODE_09967E:         sbk                ;
CODE_09967F:         with r4            ;
CODE_099680:         with  r4           ;
CODE_099680:         bra CODE_09969C    ;

CODE_099682:         to r0              ;
CODE_099683:         sm    (1E24),r0    ;
CODE_099687:         bra CODE_0996A0    ;

CODE_099689:         nop                ;
CODE_09968A:         sm    (1E24),r0    ;
CODE_09968E:         moves r3,r3        ;
CODE_099690:         beq CODE_0996FA    ;
CODE_099692:         nop                ;
CODE_099693:         ibt   r0,#0064     ;
CODE_099695:         sub   r4           ;
CODE_099696:         to r5              ;
CODE_099697:         xor   r3           ;
CODE_099699:         bpl CODE_0996A0    ;
CODE_09969B:         add   r4           ;
CODE_09969C:         sm    (1E22),r0    ;
CODE_0996A0:         moves r3,r3        ;
CODE_0996A2:         bpl CODE_0996FA    ;
CODE_0996A4:         nop                ;
CODE_0996A5:         lms   r0,(00C0)    ;
CODE_0996A8:         sub   #00          ;
CODE_0996AA:         beq CODE_0996CF    ;
CODE_0996AC:         inc   r0           ;
CODE_0996AD:         lms   r0,(00D4)    ;
CODE_0996B0:         dec   r0           ;
CODE_0996B1:         bpl CODE_0996CF    ;
CODE_0996B3:         inc   r0           ;
CODE_0996B4:         lm    r0,(1E22)    ;
CODE_0996B8:         ibt   r4,#0050     ;
CODE_0996BA:         sub   r4           ;
CODE_0996BB:         to r4              ;
CODE_0996BC:         add   r3           ;
CODE_0996BD:         bpl CODE_0996DB    ;
CODE_0996BF:         nop                ;
CODE_0996C0:         lms   r0,(00D2)    ;
CODE_0996C3:         iwt   r5,#8002     ;
CODE_0996C6:         sub   r5           ;
CODE_0996C7:         bcc CODE_0996DB    ;
CODE_0996C9:         nop                ;
CODE_0996CA:         move  r3,r4        ;
CODE_0996CC:         bra CODE_09970E    ;

CODE_0996CE:         from r3            ;
CODE_0996CF:         sm    (1E0A),r0    ;
CODE_0996D3:         from r13           ;
CODE_0996D4:         not                ;
CODE_0996D5:         inc   r0           ;
CODE_0996D6:         sub   r2           ;
CODE_0996D7:         bpl CODE_0996DB    ;
CODE_0996D9:         to r2              ;
CODE_0996DA:         add   r2           ;
CODE_0996DB:         lm    r0,(1E0A)    ;
CODE_0996DF:         lms   r4,(00C6)    ;
CODE_0996E2:         or    r4           ;
CODE_0996E3:         lms   r4,(014E)    ;
CODE_0996E6:         or    r4           ;
CODE_0996E7:         lms   r4,(00DA)    ;
CODE_0996EA:         or    r4           ;
CODE_0996EB:         bne CODE_09970D    ;
CODE_0996ED:         nop                ;
CODE_0996EE:         lms   r0,(00AE)    ;
CODE_0996F1:         sub   #06          ;
CODE_0996F3:         beq CODE_09970D    ;
CODE_0996F5:         nop                ;
CODE_0996F6:         to r3              ;
CODE_0996F7:         to    r3           ;
CODE_0996F7:         bra CODE_09970D    ;

CODE_0996F9:         sub   r0           ;
CODE_0996FA:         lms   r0,(00C0)    ;
CODE_0996FD:         sub   #00          ;
CODE_0996FF:         bne CODE_09970D    ;
CODE_099701:         sub   r0           ;
CODE_099702:         sm    (1E0A),r0    ;
CODE_099706:         from r13           ;
CODE_099707:         sub   r2           ;
CODE_099708:         bmi CODE_09970D    ;
CODE_09970A:         add   r2           ;
CODE_09970B:         move  r2,r0        ;
CODE_09970D:         from r3            ;
CODE_09970E:         add   #0A          ;
CODE_099710:         bmi CODE_099718    ;
CODE_099712:         from r3            ;
CODE_099713:         sub   #0A          ;
CODE_099715:         bmi CODE_09971A    ;
CODE_099717:         nop                ;
CODE_099718:         with r3            ;
CODE_099719:         sub   r0           ;
CODE_09971A:         from r3            ;
CODE_09971B:         lob                ;
CODE_09971C:         lm    r3,(1E2A)    ;
CODE_099720:         moves r3,r3        ;
CODE_099722:         swap               ;
CODE_099723:         xor   r2           ;
CODE_099725:         bpl CODE_099729    ;
CODE_099727:         nop                ;
CODE_099728:         from r2            ;
CODE_099729:         xor   r2           ;
CODE_09972B:         sub   r2           ;
CODE_09972C:         to r3              ;
CODE_09972D:         xor   r2           ;
CODE_09972F:         bpl CODE_099734    ;
CODE_099731:         add   r2           ;
CODE_099732:         move  r2,r0        ;
CODE_099734:         lm    r0,(1E0E)    ;
CODE_099738:         lob                ;
CODE_099739:         add   r2           ;
CODE_09973A:         sbk                ;
CODE_09973B:         hib                ;
CODE_09973C:         sex                ;
CODE_09973D:         lms   r2,(009C)    ;
CODE_099740:         add   r2           ;
CODE_099741:         lm    r2,(1E1C)    ;
CODE_099745:         sub   r2           ;
CODE_099746:         bpl CODE_099750    ;
CODE_099748:         add   r2           ;
CODE_099749:         sub   r0           ;
CODE_09974A:         sm    (1E0E),r0    ;
CODE_09974E:         move  r0,r2        ;
CODE_099750:         lm    r2,(1E1E)    ;
CODE_099754:         sub   r2           ;
CODE_099755:         bmi CODE_09975F    ;
CODE_099757:         add   r2           ;
CODE_099758:         sub   r0           ;
CODE_099759:         sm    (1E0E),r0    ;
CODE_09975D:         move  r0,r2        ;
CODE_09975F:         ibt   r2,#000C     ;
CODE_099761:         to r2              ;
CODE_099762:         sub   r2           ;
CODE_099763:         ibt   r5,#0000     ;
CODE_099765:         iwt   r6,#0CAA     ;
CODE_099768:         iwt   r0,#00FF     ;
CODE_09976B:         to r3              ;
CODE_09976C:         add   r1           ;
CODE_09976D:         to r4              ;
CODE_09976E:         add   r2           ;
CODE_09976F:         moves r0,r2        ;
CODE_099771:         bpl CODE_099775    ;
CODE_099773:         hib                ;
CODE_099774:         sub   r0           ;
CODE_099775:         add   r0           ;
CODE_099776:         add   r0           ;
CODE_099777:         add   r0           ;
CODE_099778:         to r7              ;
CODE_099779:         add   r0           ;
CODE_09977A:         from r1            ;
CODE_09977B:         hib                ;
CODE_09977C:         or    r7           ;
CODE_09977D:         add   r6           ;
CODE_09977E:         ldb   (r0)         ;
CODE_099780:         sex                ;
CODE_099781:         bmi CODE_099786    ;
CODE_099783:         nop                ;
CODE_099784:         ibt   r5,#0002     ;
CODE_099786:         from r3            ;
CODE_099787:         hib                ;
CODE_099788:         or    r7           ;
CODE_099789:         add   r6           ;
CODE_09978A:         ldb   (r0)         ;
CODE_09978C:         sex                ;
CODE_09978D:         bmi CODE_099791    ;
CODE_09978F:         nop                ;
CODE_099790:         inc   r5           ;
CODE_099791:         with r5            ;
CODE_099792:         add   r5           ;
CODE_099793:         from r4            ;
CODE_099794:         hib                ;
CODE_099795:         add   r0           ;
CODE_099796:         add   r0           ;
CODE_099797:         add   r0           ;
CODE_099798:         to r7              ;
CODE_099799:         add   r0           ;
CODE_09979A:         from r1            ;
CODE_09979B:         hib                ;
CODE_09979C:         or    r7           ;
CODE_09979D:         add   r6           ;
CODE_09979E:         ldb   (r0)         ;
CODE_0997A0:         sex                ;
CODE_0997A1:         bmi CODE_0997A5    ;
CODE_0997A3:         nop                ;
CODE_0997A4:         inc   r5           ;
CODE_0997A5:         with r5            ;
CODE_0997A6:         add   r5           ;
CODE_0997A7:         from r3            ;
CODE_0997A8:         hib                ;
CODE_0997A9:         or    r7           ;
CODE_0997AA:         add   r6           ;
CODE_0997AB:         ldb   (r0)         ;
CODE_0997AD:         sex                ;
CODE_0997AE:         bmi CODE_0997B2    ;
CODE_0997B0:         nop                ;
CODE_0997B1:         inc   r5           ;
CODE_0997B2:         ibt   r0,#0009     ;
CODE_0997B4:         romb               ;
CODE_0997B6:         iwt   r0,#94A7     ;
CODE_0997B9:         add   r5           ;
CODE_0997BA:         add   r5           ;
CODE_0997BB:         to r14             ;
CODE_0997BC:         add   r5           ;
CODE_0997BD:         getb               ;
CODE_0997BE:         inc   r14          ;
CODE_0997BF:         dec   r0           ;
CODE_0997C0:         bpl CODE_0997C7    ;
CODE_0997C2:         inc   r0           ;
CODE_0997C3:         iwt   r15,#984E    ;
CODE_0997C6:         nop                ;
CODE_0997C7:         lsr                ;
CODE_0997C8:         bcs CODE_0997EE    ;
CODE_0997CA:         lsr                ;
CODE_0997CB:         bcc CODE_0997E0    ;
CODE_0997CD:         nop                ;
CODE_0997CE:         move  r6,r0        ;
CODE_0997D0:         sub   r0           ;
CODE_0997D1:         sm    (1E0C),r0    ;
CODE_0997D5:         iwt   r0,#0080     ;
CODE_0997D8:         add   r1           ;
CODE_0997D9:         hib                ;
CODE_0997DA:         to r1              ;
CODE_0997DB:         swap               ;
CODE_0997DC:         dec   r6           ;
CODE_0997DD:         bmi CODE_09984E    ;
CODE_0997DF:         nop                ;
CODE_0997E0:         sub   r0           ;
CODE_0997E1:         sm    (1E0E),r0    ;
CODE_0997E5:         iwt   r0,#0080     ;
CODE_0997E8:         add   r2           ;
CODE_0997E9:         hib                ;
CODE_0997EA:         to r2              ;
CODE_0997EB:         to    r2           ;
CODE_0997EB:         bra CODE_09984E    ;

CODE_0997ED:         swap               ;
CODE_0997EE:         to r3              ;
CODE_0997EF:         getb               ;
CODE_0997F0:         inc   r14          ;
CODE_0997F1:         move  r0,r1        ;
CODE_0997F3:         dec   r3           ;
CODE_0997F4:         bmi CODE_0997F8    ;
CODE_0997F6:         inc   r3           ;
CODE_0997F7:         not                ;
CODE_0997F8:         to r7              ;
CODE_0997F9:         lob                ;
CODE_0997FA:         to r5              ;
CODE_0997FB:         getb               ;
CODE_0997FC:         move  r0,r2        ;
CODE_0997FE:         dec   r5           ;
CODE_0997FF:         bmi CODE_099803    ;
CODE_099801:         inc   r5           ;
CODE_099802:         not                ;
CODE_099803:         lob                ;
CODE_099804:         move  r8,r0        ;
CODE_099806:         add   r7           ;
CODE_099807:         iwt   r6,#0100     ;
CODE_09980A:         sub   r6           ;
CODE_09980B:         bcs CODE_09984E    ;
CODE_09980D:         add   r6           ;
CODE_09980E:         add   r0           ;
CODE_09980F:         iwt   r6,#2200     ;
CODE_099812:         add   r6           ;
CODE_099813:         ldw   (r0)         ;
CODE_099814:         iwt   r6,#7F80     ;
CODE_099817:         lmult              ;
CODE_099819:         with r4            ;
CODE_09981A:         add   r4           ;
CODE_09981B:         rol                ;
CODE_09981C:         with r4            ;
CODE_09981D:         add   r4           ;
CODE_09981E:         to r6              ;
CODE_09981F:         adc   #00          ;
CODE_099821:         from r7            ;
CODE_099822:         lmult              ;
CODE_099824:         iwt   r0,#0080     ;
CODE_099827:         dec   r3           ;
CODE_099828:         bmi CODE_09982C    ;
CODE_09982A:         add   r4           ;
CODE_09982B:         not                ;
CODE_09982C:         to r7              ;
CODE_09982D:         hib                ;
CODE_09982E:         from r1            ;
CODE_09982F:         hib                ;
CODE_099830:         swap               ;
CODE_099831:         to r1              ;
CODE_099832:         or    r7           ;
CODE_099833:         from r8            ;
CODE_099834:         lmult              ;
CODE_099836:         iwt   r0,#0080     ;
CODE_099839:         dec   r5           ;
CODE_09983A:         bmi CODE_09983E    ;
CODE_09983C:         add   r4           ;
CODE_09983D:         not                ;
CODE_09983E:         to r8              ;
CODE_09983F:         hib                ;
CODE_099840:         from r2            ;
CODE_099841:         hib                ;
CODE_099842:         swap               ;
CODE_099843:         to r2              ;
CODE_099844:         or    r8           ;
CODE_099845:         sub   r0           ;
CODE_099846:         sm    (1E0C),r0    ;
CODE_09984A:         sm    (1E0E),r0    ;
CODE_09984E:         sms   (0094),r1    ;
CODE_099851:         sms   (009C),r2    ;
CODE_099854:         stop               ;
CODE_099855:         nop                ;

CODE_099856:         iwt   r1,#0167     ;
CODE_099859:         iwt   r2,#0169     ;
CODE_09985C:         ibt   r5,#0000     ;
CODE_09985E:         ibt   r6,#0010     ;
CODE_099860:         ibt   r8,#FFFF     ;
CODE_099862:         ibt   r9,#FFFF     ;
CODE_099864:         cache              ;
CODE_099865:         ibt   r12,#0018    ;
CODE_099867:         move  r13,r15      ;
CODE_099869:         iwt   r0,#0F00     ;
CODE_09986C:         add   r5           ;
CODE_09986D:         ldw   (r0)         ;
CODE_09986E:         sub   r6           ;
CODE_09986F:         bne CODE_0998AF    ;
CODE_099871:         nop                ;
CODE_099872:         iwt   r0,#1360     ;
CODE_099875:         add   r5           ;
CODE_099876:         ldw   (r0)         ;
CODE_099877:         cmp   r1           ;
CODE_099879:         bcc CODE_0998AF    ;
CODE_09987B:         nop                ;
CODE_09987C:         cmp   r2           ;
CODE_09987E:         bcs CODE_0998AF    ;
CODE_099880:         nop                ;
CODE_099881:         iwt   r0,#1D38     ;
CODE_099884:         add   r5           ;
CODE_099885:         ldw   (r0)         ;
CODE_099886:         sub   #00          ;
CODE_099888:         bne CODE_0998AF    ;
CODE_09988A:         nop                ;
CODE_09988B:         iwt   r0,#10E2     ;
CODE_09988E:         add   r5           ;
CODE_09988F:         ldw   (r0)         ;
CODE_099890:         from r3            ;
CODE_099891:         sub   r0           ;
CODE_099892:         bpl CODE_099897    ;
CODE_099894:         nop                ;
CODE_099895:         not                ;
CODE_099896:         inc   r0           ;
CODE_099897:         move  r7,r0        ;
CODE_099899:         iwt   r0,#1182     ;
CODE_09989C:         add   r5           ;
CODE_09989D:         ldw   (r0)         ;
CODE_09989E:         from r4            ;
CODE_09989F:         sub   r0           ;
CODE_0998A0:         bpl CODE_0998A5    ;
CODE_0998A2:         nop                ;
CODE_0998A3:         not                ;
CODE_0998A4:         inc   r0           ;
CODE_0998A5:         add   r7           ;
CODE_0998A6:         cmp   r8           ;
CODE_0998A8:         bcs CODE_0998AF    ;
CODE_0998AA:         nop                ;
CODE_0998AB:         move  r8,r0        ;
CODE_0998AD:         move  r9,r5        ;
CODE_0998AF:         with r5            ;
CODE_0998B0:         add   #04          ;
CODE_0998B2:         loop               ;
CODE_0998B3:         nop                ;
CODE_0998B4:         stop               ;
CODE_0998B5:         nop                ;

CODE_0998B6:         iwt   r0,#1362     ;
CODE_0998B9:         add   r1           ;
CODE_0998BA:         ldw   (r0)         ;
CODE_0998BB:         ibt   r2,#0030     ;
CODE_0998BD:         to r2              ;
CODE_0998BE:         add   r2           ;
CODE_0998BF:         iwt   r0,#19D6     ;
CODE_0998C2:         add   r1           ;
CODE_0998C3:         ldw   (r0)         ;
CODE_0998C4:         lsr                ;
CODE_0998C5:         to r3              ;
CODE_0998C6:         lsr                ;
CODE_0998C7:         iwt   r0,#19D8     ;
CODE_0998CA:         add   r1           ;
CODE_0998CB:         to r4              ;
CODE_0998CC:         ldw   (r0)         ;
CODE_0998CD:         iwt   r0,#1A36     ;
CODE_0998D0:         add   r1           ;
CODE_0998D1:         to r5              ;
CODE_0998D2:         ldw   (r0)         ;
CODE_0998D3:         iwt   r0,#1680     ;
CODE_0998D6:         add   r1           ;
CODE_0998D7:         to r9              ;
CODE_0998D8:         ldw   (r0)         ;
CODE_0998D9:         iwt   r0,#1682     ;
CODE_0998DC:         add   r1           ;
CODE_0998DD:         to r10             ;
CODE_0998DE:         ldw   (r0)         ;
CODE_0998DF:         ibt   r11,#0000    ;
CODE_0998E1:         iwt   r0,#1180     ;
CODE_0998E4:         add   r1           ;
CODE_0998E5:         ldb   (r0)         ;
CODE_0998E7:         mult  #08          ;
CODE_0998E9:         sms   (0000),r0    ;
CODE_0998EC:         ibt   r0,#0009     ;
CODE_0998EE:         romb               ;
CODE_0998F0:         cache              ;
CODE_0998F1:         with r5            ;
CODE_0998F2:         add   r5           ;
CODE_0998F3:         with r4            ;
CODE_0998F4:         rol                ;
CODE_0998F5:         rol                ;
CODE_0998F6:         with r5            ;
CODE_0998F7:         add   r5           ;
CODE_0998F8:         with r4            ;
CODE_0998F9:         rol                ;
CODE_0998FA:         rol                ;
CODE_0998FB:         with r5            ;
CODE_0998FC:         add   r5           ;
CODE_0998FD:         with r4            ;
CODE_0998FE:         rol                ;
CODE_0998FF:         rol                ;
CODE_099900:         and   #07          ;
CODE_099902:         with r3            ;
CODE_099903:         sub   #08          ;
CODE_099905:         bcc CODE_09996D    ;
CODE_099907:         nop                ;
CODE_099908:         add   #03          ;
CODE_09990A:         lsr                ;
CODE_09990B:         lsr                ;
CODE_09990C:         iwt   r14,#99D6    ;
CODE_09990F:         to r14             ;
CODE_099910:         add   r14          ;
CODE_099911:         to r12             ;
CODE_099912:         getb               ;
CODE_099913:         sms   (0048),r4    ;
CODE_099916:         add   r0           ;
CODE_099917:         iwt   r14,#99D9    ;
CODE_09991A:         to r14             ;
CODE_09991B:         add   r14          ;
CODE_09991C:         getb               ;
CODE_09991D:         inc   r14          ;
CODE_09991E:         to r14             ;
CODE_09991F:         getbh              ;
CODE_099921:         move  r13,r15      ;
CODE_099923:         getbs              ;
CODE_099925:         inc   r14          ;
CODE_099926:         moves r6,r11       ;
CODE_099928:         beq CODE_09992F    ;
CODE_09992A:         nop                ;
CODE_09992B:         not                ;
CODE_09992C:         inc   r0           ;
CODE_09992D:         ibt   r6,#0008     ;
CODE_09992F:         to r4              ;
CODE_099930:         add   r9           ;
CODE_099931:         getbs              ;
CODE_099933:         inc   r14          ;
CODE_099934:         to r7              ;
CODE_099935:         add   r10          ;
CODE_099936:         getb               ;
CODE_099937:         inc   r14          ;
CODE_099938:         getbh              ;
CODE_09993A:         inc   r14          ;
CODE_09993B:         to r8              ;
CODE_09993C:         xor   r11          ;
CODE_09993E:         getb               ;
CODE_09993F:         and   #02          ;
CODE_099941:         bne CODE_099946    ;
CODE_099943:         nop                ;
CODE_099944:         with r4            ;
CODE_099945:         add   r6           ;
CODE_099946:         from r4            ;
CODE_099947:         stw   (r2)         ;
CODE_099948:         inc   r2           ;
CODE_099949:         inc   r2           ;
CODE_09994A:         from r7            ;
CODE_09994B:         stw   (r2)         ;
CODE_09994C:         inc   r2           ;
CODE_09994D:         inc   r2           ;
CODE_09994E:         to r7              ;
CODE_09994F:         getbh              ;
CODE_099951:         inc   r14          ;
CODE_099952:         lms   r0,(0000)    ;
CODE_099955:         add   r8           ;
CODE_099956:         stw   (r2)         ;
CODE_099957:         inc   r2           ;
CODE_099958:         inc   r2           ;
CODE_099959:         from r7            ;
CODE_09995A:         stw   (r2)         ;
CODE_09995B:         inc   r2           ;
CODE_09995C:         loop               ;
CODE_09995D:         inc   r2           ;
CODE_09995E:         lms   r4,(0048)    ;
CODE_099961:         iwt   r0,#4000     ;
CODE_099964:         to r11             ;
CODE_099965:         xor   r11          ;
CODE_099967:         ibt   r0,#0020     ;
CODE_099969:         with r10           ;
CODE_09996A:         with  r10          ;
CODE_09996A:         bra CODE_0998F1    ;

CODE_09996C:         sub   r0           ;

CODE_09996D:         from r3            ;
CODE_09996E:         add   #08          ;
CODE_099970:         bne CODE_09997F    ;
CODE_099972:         nop                ;
CODE_099973:         iwt   r0,#1A38     ;
CODE_099976:         add   r1           ;
CODE_099977:         ldw   (r0)         ;
CODE_099978:         lsr                ;
CODE_099979:         lsr                ;
CODE_09997A:         beq CODE_09997F    ;
CODE_09997C:         nop                ;
CODE_09997D:         add   #07          ;
CODE_09997F:         iwt   r14,#99DF    ;
CODE_099982:         to r14             ;
CODE_099983:         add   r14          ;
CODE_099984:         to r12             ;
CODE_099985:         getb               ;
CODE_099986:         add   r0           ;
CODE_099987:         iwt   r14,#99EA    ;
CODE_09998A:         to r14             ;
CODE_09998B:         add   r14          ;
CODE_09998C:         getb               ;
CODE_09998D:         inc   r14          ;
CODE_09998E:         to r14             ;
CODE_09998F:         getbh              ;
CODE_099991:         iwt   r0,#1362     ;
CODE_099994:         add   r1           ;
CODE_099995:         to r2              ;
CODE_099996:         ldw   (r0)         ;
CODE_099997:         move  r13,r15      ;
CODE_099999:         getbs              ;
CODE_09999B:         inc   r14          ;
CODE_09999C:         moves r6,r11       ;
CODE_09999E:         beq CODE_0999A5    ;
CODE_0999A0:         nop                ;
CODE_0999A1:         not                ;
CODE_0999A2:         inc   r0           ;
CODE_0999A3:         ibt   r6,#0008     ;
CODE_0999A5:         to r4              ;
CODE_0999A6:         add   r9           ;
CODE_0999A7:         getbs              ;
CODE_0999A9:         inc   r14          ;
CODE_0999AA:         to r7              ;
CODE_0999AB:         add   r10          ;
CODE_0999AC:         getb               ;
CODE_0999AD:         inc   r14          ;
CODE_0999AE:         getbh              ;
CODE_0999B0:         inc   r14          ;
CODE_0999B1:         to r8              ;
CODE_0999B2:         xor   r11          ;
CODE_0999B4:         getb               ;
CODE_0999B5:         and   #02          ;
CODE_0999B7:         bne CODE_0999BC    ;
CODE_0999B9:         nop                ;
CODE_0999BA:         with r4            ;
CODE_0999BB:         add   r6           ;
CODE_0999BC:         from r4            ;
CODE_0999BD:         stw   (r2)         ;
CODE_0999BE:         inc   r2           ;
CODE_0999BF:         inc   r2           ;
CODE_0999C0:         from r7            ;
CODE_0999C1:         stw   (r2)         ;
CODE_0999C2:         inc   r2           ;
CODE_0999C3:         inc   r2           ;
CODE_0999C4:         to r7              ;
CODE_0999C5:         getbh              ;
CODE_0999C7:         inc   r14          ;
CODE_0999C8:         lms   r0,(0000)    ;
CODE_0999CB:         add   r8           ;
CODE_0999CC:         stw   (r2)         ;
CODE_0999CD:         inc   r2           ;
CODE_0999CE:         inc   r2           ;
CODE_0999CF:         from r7            ;
CODE_0999D0:         stw   (r2)         ;
CODE_0999D1:         inc   r2           ;
CODE_0999D2:         loop               ;
CODE_0999D3:         inc   r2           ;
CODE_0999D4:         stop               ;
CODE_0999D5:         nop                ;

DATA_0999D6:         db $04, $04, $04

DATA_0999D9:         dw $9AC3, $9AD7, $9AEB

DATA_0999DF:         db $01, $02, $02, $02, $03, $04, $04, $05
DATA_0999E7:         db $04, $06, $06

DATA_0999EA:         dw $9A00, $9A05, $9A0F, $9A19
DATA_0999F2:         dw $9A23, $9A32, $9A46, $9A5A
DATA_0999FA:         dw $9A73, $9A87, $9AA5

DATA_099A00:         db $01, $00, $0C, $22, $02

DATA_099A05:         db $04, $FC, $0C, $22, $02, $03, $00, $00
DATA_099A0D:         db $A2, $02, $05, $F8

DATA_099A11:         db $0C, $22, $02, $03, $00, $00, $A2, $02

DATA_099A19:         db $06, $F4, $0C, $22, $02, $03, $00, $00
DATA_099A21:         db $A2, $02

DATA_099A23:         db $07, $F0, $0C, $22, $02, $04, $FC, $1A
DATA_099A2B:         db $22, $00, $03, $00, $00, $A2, $02

DATA_099A32:         db $04, $FC, $0A, $22, $00, $03, $00, $00
DATA_099A3A:         db $A2, $02, $05, $EC, $0C, $62, $02, $0B
DATA_099A42:         db $F8, $11, $22, $00

DATA_099A46:         db $FB, $F7, $08, $22, $02, $03, $00, $00
DATA_099A4E:         db $A2, $02, $03, $E8, $0C, $62, $02, $03
DATA_099A56:         db $F0, $00, $22, $02

DATA_099A5A:         db $F3, $F7, $06, $22, $02, $FB, $F7, $08
DATA_099A62:         db $22, $02, $03, $00, $00, $A2, $02, $01
DATA_099A6A:         db $E4, $0C, $62, $02, $03, $F0, $00, $22
DATA_099A72:         db $02

DATA_099A73:         db $05, $04, $0E, $A2, $02, $05, $FC, $0E
DATA_099A7B:         db $22, $02, $FD, $FC, $0E, $62, $02, $FD
DATA_099A83:         db $04, $0E, $E2, $02

DATA_099A87:         db $07, $07, $1B, $22, $00, $03, $07, $1B
DATA_099A8F:         db $62, $00, $07, $06, $0E, $A2, $02, $07
DATA_099A97:         db $FA, $0E, $22, $02, $FB, $FA, $0E, $62
DATA_099A9F:         db $02, $FB, $06, $0E, $E2, $02

DATA_099AA5:         db $09, $08, $1B, $22, $00, $01, $08, $1B
DATA_099AAD:         db $62, $00, $09, $08, $0E, $A2, $02, $09
DATA_099AB5:         db $F8, $0E, $22, $02, $F9, $F8, $0E, $62
DATA_099ABD:         db $02, $F9, $08, $0E, $E2, $02

DATA_099AC3:         db $EC, $F7, $02, $22, $02, $FC, $F7, $04
DATA_099ACB:         db $22, $02, $03, $00, $00, $A2, $02, $03
DATA_099AD3:         db $F0, $00, $22, $02

DATA_099AD7:         db $EC, $F9, $02, $22, $02, $FC, $F8, $04
DATA_099ADF:         db $22, $02, $03, $00, $00, $A2, $02, $03
DATA_099AE7:         db $F0, $00, $22, $02

DATA_099AEB:         db $FC, $F9, $04, $22, $02, $EC, $FA, $02
DATA_099AF3:         db $22, $02, $03, $00, $00, $A2, $02, $03
DATA_099AFB:         db $F0, $00, $22, $02

DATA_099AFF:         db $00, $10, $20, $30, $30, $40, $50, $50
DATA_099B07:         db $60, $60, $70, $70, $70, $80, $80, $80
DATA_099B0F:         db $80, $80, $80, $80, $80, $80, $80, $80
DATA_099B17:         db $80, $70, $70, $60, $60, $50, $50, $40
DATA_099B1F:         db $40, $30, $20, $10

CODE_099B23:         sub   r0           ;
CODE_099B24:         sms   (0000),r0    ;
CODE_099B27:         iwt   r0,#19D6     ;
CODE_099B2A:         add   r1           ;
CODE_099B2B:         ldw   (r0)         ;
CODE_099B2C:         lsr                ;
CODE_099B2D:         lsr                ;
CODE_099B2E:         lsr                ;
CODE_099B2F:         lsr                ;
CODE_099B30:         to r2              ;
CODE_099B31:         lsr                ;
CODE_099B32:         iwt   r0,#19D8     ;
CODE_099B35:         add   r1           ;
CODE_099B36:         to r3              ;
CODE_099B37:         ldw   (r0)         ;
CODE_099B38:         iwt   r0,#1A36     ;
CODE_099B3B:         add   r1           ;
CODE_099B3C:         to r4              ;
CODE_099B3D:         ldw   (r0)         ;
CODE_099B3E:         iwt   r0,#1CD6     ;
CODE_099B41:         add   r1           ;
CODE_099B42:         ldw   (r0)         ;
CODE_099B43:         ibt   r5,#0020     ;
CODE_099B45:         to r5              ;
CODE_099B46:         sub   r5           ;
CODE_099B47:         iwt   r0,#1182     ;
CODE_099B4A:         add   r1           ;
CODE_099B4B:         ldw   (r0)         ;
CODE_099B4C:         to r6              ;
CODE_099B4D:         add   #04          ;
CODE_099B4F:         ibt   r7,#001C     ;
CODE_099B51:         ibt   r12,#0000    ;
CODE_099B53:         ibt   r13,#0001    ;
CODE_099B55:         ibt   r0,#0009     ;
CODE_099B57:         romb               ;
CODE_099B59:         cache              ;
CODE_099B5A:         with r4            ;
CODE_099B5B:         add   r4           ;
CODE_099B5C:         with r3            ;
CODE_099B5D:         rol                ;
CODE_099B5E:         rol                ;
CODE_099B5F:         with r4            ;
CODE_099B60:         add   r4           ;
CODE_099B61:         with r3            ;
CODE_099B62:         rol                ;
CODE_099B63:         rol                ;
CODE_099B64:         with r4            ;
CODE_099B65:         add   r4           ;
CODE_099B66:         with r3            ;
CODE_099B67:         rol                ;
CODE_099B68:         rol                ;
CODE_099B69:         to r11             ;
CODE_099B6A:         and   #07          ;
CODE_099B6C:         ibt   r0,#0010     ;
CODE_099B6E:         to r8              ;
CODE_099B6F:         sub   r11          ;
CODE_099B70:         lms   r0,(00AA)    ;
CODE_099B73:         sub   #00          ;
CODE_099B75:         bmi CODE_099BB7    ;
CODE_099B77:         nop                ;
CODE_099B78:         lms   r0,(011C)    ;
CODE_099B7B:         sub   r5           ;
CODE_099B7C:         bmi CODE_099BB7    ;
CODE_099B7E:         nop                ;
CODE_099B7F:         ibt   r9,#0024     ;
CODE_099B81:         sub   r9           ;
CODE_099B82:         bcs CODE_099BB7    ;
CODE_099B84:         add   r9           ;
CODE_099B85:         moves r7,r7        ;
CODE_099B87:         bmi CODE_099B8C    ;
CODE_099B89:         from r9            ;
CODE_099B8A:         sbc   r0           ;
CODE_099B8C:         iwt   r14,#9AFF    ;
CODE_099B8F:         to r14             ;
CODE_099B90:         add   r14          ;
CODE_099B91:         lms   r9,(0090)    ;
CODE_099B94:         ibt   r0,#0020     ;
CODE_099B96:         to r10             ;
CODE_099B97:         add   r9           ;
CODE_099B98:         getb               ;
CODE_099B99:         umult r8           ;
CODE_099B9B:         hib                ;
CODE_099B9C:         from r6            ;
CODE_099B9D:         sub   r0           ;
CODE_099B9E:         sub   r10          ;
CODE_099B9F:         bpl CODE_099BB7    ;
CODE_099BA1:         nop                ;
CODE_099BA2:         add   #09          ;
CODE_099BA4:         bmi CODE_099BB7    ;
CODE_099BA6:         nop                ;
CODE_099BA7:         sub   #08          ;
CODE_099BA9:         add   r9           ;
CODE_099BAA:         sbk                ;
CODE_099BAB:         iwt   r0,#0100     ;
CODE_099BAE:         sms   (00AA),r0    ;
CODE_099BB1:         sms   (01B4),r0    ;
CODE_099BB4:         with r11           ;
CODE_099BB5:         or    #08          ;
CODE_099BB7:         from r11           ;
CODE_099BB8:         and   #07          ;
CODE_099BBA:         sub   r11          ;
CODE_099BBB:         bne CODE_099BC4    ;
CODE_099BBD:         add   r11          ;
CODE_099BBE:         beq CODE_099BD4    ;
CODE_099BC0:         nop                ;
CODE_099BC1:         bra CODE_099BD4    ;

CODE_099BC3:         dec   r0           ;
CODE_099BC4:         to r9              ;
CODE_099BC5:         sub   #07          ;
CODE_099BC7:         bcs CODE_099BD4    ;
CODE_099BC9:         nop                ;
CODE_099BCA:         dec   r0           ;
CODE_099BCB:         bpl CODE_099BD3    ;
CODE_099BCD:         inc   r0           ;
CODE_099BCE:         ibt   r9,#001D     ;
CODE_099BD0:         sms   (0000),r9    ;
CODE_099BD3:         inc   r0           ;
CODE_099BD4:         mult  #08          ;
CODE_099BD6:         add   r0           ;
CODE_099BD7:         add   r0           ;
CODE_099BD8:         swap               ;
CODE_099BD9:         add   r0           ;
CODE_099BDA:         with r13           ;
CODE_099BDB:         rol                ;
CODE_099BDC:         with r12           ;
CODE_099BDD:         rol                ;
CODE_099BDE:         add   r0           ;
CODE_099BDF:         with r13           ;
CODE_099BE0:         rol                ;
CODE_099BE1:         with r12           ;
CODE_099BE2:         rol                ;
CODE_099BE3:         add   r0           ;
CODE_099BE4:         with r13           ;
CODE_099BE5:         rol                ;
CODE_099BE6:         with r12           ;
CODE_099BE7:         rol                ;
CODE_099BE8:         with r5            ;
CODE_099BE9:         add   r7           ;
CODE_099BEA:         ibt   r0,#FFE0     ;
CODE_099BEC:         to r6              ;
CODE_099BED:         add   r6           ;
CODE_099BEE:         with r7            ;
CODE_099BEF:         not                ;
CODE_099BF0:         dec   r2           ;
CODE_099BF1:         beq CODE_099BF8    ;
CODE_099BF3:         inc   r7           ;
CODE_099BF4:         iwt   r15,#9B5B    ;
CODE_099BF7:         with r4            ;
CODE_099BF8:         with r13           ;
CODE_099BF9:         add   r13          ;
CODE_099BFA:         with r12           ;
CODE_099BFB:         rol                ;
CODE_099BFC:         bcc CODE_099BF9    ;
CODE_099BFE:         with r13           ;
CODE_099BFF:         iwt   r0,#19D8     ;
CODE_099C02:         add   r1           ;
CODE_099C03:         from r12           ;
CODE_099C04:         stw   (r0)         ;
CODE_099C05:         iwt   r0,#1A36     ;
CODE_099C08:         add   r1           ;
CODE_099C09:         from r13           ;
CODE_099C0A:         stw   (r0)         ;
CODE_099C0B:         stop               ;
CODE_099C0C:         nop                ;

CODE_099C0D:         ibt   r0,#0008     ;
CODE_099C0F:         romb               ;
CODE_099C11:         lm    r1,(1972)    ;
CODE_099C15:         lms   r0,(003E)    ;
CODE_099C18:         to r5              ;
CODE_099C19:         hib                ;
CODE_099C1A:         iwt   r0,#AE18     ;
CODE_099C1D:         to r14             ;
CODE_099C1E:         add   r5           ;
CODE_099C1F:         iwt   r0,#1BB6     ;
CODE_099C22:         add   r1           ;
CODE_099C23:         to r2              ;
CODE_099C24:         ldw   (r0)         ;
CODE_099C25:         from r2            ;
CODE_099C26:         not                ;
CODE_099C27:         to r3              ;
CODE_099C28:         add   #01          ;
CODE_099C2A:         iwt   r0,#1BB8     ;
CODE_099C2D:         add   r1           ;
CODE_099C2E:         to r4              ;
CODE_099C2F:         ldw   (r0)         ;
CODE_099C30:         to r6              ;
CODE_099C31:         getb               ;
CODE_099C32:         iwt   r0,#AE58     ;
CODE_099C35:         to r14             ;
CODE_099C36:         add   r5           ;
CODE_099C37:         to r7              ;
CODE_099C38:         getb               ;
CODE_099C39:         from r4            ;
CODE_099C3A:         to r8              ;
CODE_099C3B:         mult  r6           ;
CODE_099C3C:         from r4            ;
CODE_099C3D:         to r9              ;
CODE_099C3E:         mult  r7           ;
CODE_099C3F:         iwt   r11,#0080    ;
CODE_099C42:         from r3            ;
CODE_099C43:         mult  r6           ;
CODE_099C44:         add   r9           ;
CODE_099C45:         add   r0           ;
CODE_099C46:         add   r0           ;
CODE_099C47:         add   r11          ;
CODE_099C48:         hib                ;
CODE_099C49:         to r10             ;
CODE_099C4A:         sex                ;
CODE_099C4B:         iwt   r0,#10E2     ;
CODE_099C4E:         add   r1           ;
CODE_099C4F:         ldw   (r0)         ;
CODE_099C50:         add   r10          ;
CODE_099C51:         sms   (0000),r0    ;
CODE_099C54:         from r3            ;
CODE_099C55:         mult  r7           ;
CODE_099C56:         from r8            ;
CODE_099C57:         sub   r0           ;
CODE_099C58:         add   r0           ;
CODE_099C59:         add   r0           ;
CODE_099C5A:         add   r11          ;
CODE_099C5B:         hib                ;
CODE_099C5C:         to r10             ;
CODE_099C5D:         sex                ;
CODE_099C5E:         iwt   r0,#1182     ;
CODE_099C61:         add   r1           ;
CODE_099C62:         ldw   (r0)         ;
CODE_099C63:         add   r10          ;
CODE_099C64:         sms   (0002),r0    ;
CODE_099C67:         from r2            ;
CODE_099C68:         mult  r6           ;
CODE_099C69:         add   r9           ;
CODE_099C6A:         add   r0           ;
CODE_099C6B:         add   r0           ;
CODE_099C6C:         add   r11          ;
CODE_099C6D:         hib                ;
CODE_099C6E:         to r10             ;
CODE_099C6F:         sex                ;
CODE_099C70:         iwt   r0,#10E2     ;
CODE_099C73:         add   r1           ;
CODE_099C74:         ldw   (r0)         ;
CODE_099C75:         add   r10          ;
CODE_099C76:         sms   (0004),r0    ;
CODE_099C79:         from r2            ;
CODE_099C7A:         mult  r7           ;
CODE_099C7B:         from r8            ;
CODE_099C7C:         sub   r0           ;
CODE_099C7D:         add   r0           ;
CODE_099C7E:         add   r0           ;
CODE_099C7F:         add   r11          ;
CODE_099C80:         hib                ;
CODE_099C81:         to r10             ;
CODE_099C82:         sex                ;
CODE_099C83:         iwt   r0,#1182     ;
CODE_099C86:         add   r1           ;
CODE_099C87:         ldw   (r0)         ;
CODE_099C88:         add   r10          ;
CODE_099C89:         sms   (0006),r0    ;
CODE_099C8C:         lms   r8,(0000)    ;
CODE_099C8F:         lms   r9,(0004)    ;
CODE_099C92:         lm    r10,(011C)   ;
CODE_099C96:         from r10           ;
CODE_099C97:         to r7              ;
CODE_099C98:         sub   r8           ;
CODE_099C99:         bmi CODE_099D18    ;
CODE_099C9B:         from r10           ;
CODE_099C9C:         sub   r9           ;
CODE_099C9D:         bpl CODE_099D18    ;
CODE_099C9F:         nop                ;
CODE_099CA0:         lm    r0,(00AA)    ;
CODE_099CA4:         sub   #00          ;
CODE_099CA6:         bmi CODE_099D18    ;
CODE_099CA8:         nop                ;
CODE_099CA9:         from r9            ;
CODE_099CAA:         sub   r8           ;
CODE_099CAB:         to r9              ;
CODE_099CAC:         add   r0           ;
CODE_099CAD:         iwt   r0,#2200     ;
CODE_099CB0:         add   r9           ;
CODE_099CB1:         to r6              ;
CODE_099CB2:         ldw   (r0)         ;
CODE_099CB3:         lms   r8,(0002)    ;
CODE_099CB6:         lms   r0,(0006)    ;
CODE_099CB9:         sub   r8           ;
CODE_099CBA:         lob                ;
CODE_099CBB:         swap               ;
CODE_099CBC:         to r6              ;
CODE_099CBD:         fmult              ;
CODE_099CBE:         from r7            ;
CODE_099CBF:         lob                ;
CODE_099CC0:         swap               ;
CODE_099CC1:         fmult              ;
CODE_099CC2:         to r8              ;
CODE_099CC3:         add   r8           ;
CODE_099CC4:         ibt   r6,#0020     ;
CODE_099CC6:         lm    r7,(0090)    ;
CODE_099CCA:         from r7            ;
CODE_099CCB:         add   r6           ;
CODE_099CCC:         sub   r8           ;
CODE_099CCD:         bmi CODE_099D18    ;
CODE_099CCF:         nop                ;
CODE_099CD0:         move  r8,r0        ;
CODE_099CD2:         sub   #09          ;
CODE_099CD4:         bpl CODE_099D18    ;
CODE_099CD6:         nop                ;
CODE_099CD7:         from r7            ;
CODE_099CD8:         sub   r8           ;
CODE_099CD9:         sm    (0090),r0    ;
CODE_099CDD:         ibt   r0,#0001     ;
CODE_099CDF:         sm    (01B4),r0    ;
CODE_099CE3:         iwt   r0,#0100     ;
CODE_099CE6:         sm    (00AA),r0    ;
CODE_099CEA:         iwt   r0,#19D8     ;
CODE_099CED:         add   r1           ;
CODE_099CEE:         to r6              ;
CODE_099CEF:         ldw   (r0)         ;
CODE_099CF0:         iwt   r0,#1978     ;
CODE_099CF3:         add   r1           ;
CODE_099CF4:         to r7              ;
CODE_099CF5:         ldw   (r0)         ;
CODE_099CF6:         lm    r0,(011C)    ;
CODE_099CFA:         sub   r7           ;
CODE_099CFB:         div2               ;
CODE_099CFD:         div2               ;
CODE_099CFF:         nop                ;
CODE_099D00:         nop                ;
CODE_099D01:         with r6            ;
CODE_099D02:         add   r0           ;
CODE_099D03:         iwt   r0,#19D8     ;
CODE_099D06:         add   r1           ;
CODE_099D07:         from r6            ;
CODE_099D08:         stw   (r0)         ;
CODE_099D09:         iwt   r0,#1976     ;
CODE_099D0C:         add   r1           ;
CODE_099D0D:         ldw   (r0)         ;
CODE_099D0E:         hib                ;
CODE_099D0F:         cmp   r5           ;
CODE_099D11:         bne CODE_099D1C    ;
CODE_099D13:         nop                ;
CODE_099D14:         ibt   r0,#0001     ;
CODE_099D16:         stop               ;
CODE_099D17:         nop                ;

CODE_099D18:         ibt   r0,#0000     ;
CODE_099D1A:         stop               ;
CODE_099D1B:         nop                ;

CODE_099D1C:         from r5            ;
CODE_099D1D:         not                ;
CODE_099D1E:         inc   r0           ;
CODE_099D1F:         to r5              ;
CODE_099D20:         lob                ;
CODE_099D21:         iwt   r0,#AE18     ;
CODE_099D24:         to r14             ;
CODE_099D25:         add   r5           ;
CODE_099D26:         lm    r8,(008C)    ;
CODE_099D2A:         iwt   r0,#10E2     ;
CODE_099D2D:         add   r1           ;
CODE_099D2E:         to r12             ;
CODE_099D2F:         ldw   (r0)         ;
CODE_099D30:         with r8            ;
CODE_099D31:         sub   r12          ;
CODE_099D32:         lm    r9,(0090)    ;
CODE_099D36:         iwt   r0,#1182     ;
CODE_099D39:         add   r1           ;
CODE_099D3A:         to r13             ;
CODE_099D3B:         ldw   (r0)         ;
CODE_099D3C:         with r9            ;
CODE_099D3D:         sub   r13          ;
CODE_099D3E:         to r6              ;
CODE_099D3F:         getb               ;
CODE_099D40:         iwt   r0,#AE58     ;
CODE_099D43:         to r14             ;
CODE_099D44:         add   r5           ;
CODE_099D45:         from r8            ;
CODE_099D46:         to r10             ;
CODE_099D47:         mult  r6           ;
CODE_099D48:         from r9            ;
CODE_099D49:         to r11             ;
CODE_099D4A:         mult  r6           ;
CODE_099D4B:         to r7              ;
CODE_099D4C:         getb               ;
CODE_099D4D:         iwt   r2,#0080     ;
CODE_099D50:         from r9            ;
CODE_099D51:         mult  r7           ;
CODE_099D52:         add   r10          ;
CODE_099D53:         add   r0           ;
CODE_099D54:         add   r0           ;
CODE_099D55:         add   r2           ;
CODE_099D56:         hib                ;
CODE_099D57:         to r10             ;
CODE_099D58:         sex                ;
CODE_099D59:         from r8            ;
CODE_099D5A:         mult  r7           ;
CODE_099D5B:         from r11           ;
CODE_099D5C:         sub   r0           ;
CODE_099D5D:         add   r0           ;
CODE_099D5E:         add   r0           ;
CODE_099D5F:         add   r2           ;
CODE_099D60:         hib                ;
CODE_099D61:         to r11             ;
CODE_099D62:         sex                ;
CODE_099D63:         iwt   r0,#1976     ;
CODE_099D66:         add   r1           ;
CODE_099D67:         ldw   (r0)         ;
CODE_099D68:         to r5              ;
CODE_099D69:         hib                ;
CODE_099D6A:         iwt   r0,#AE18     ;
CODE_099D6D:         to r14             ;
CODE_099D6E:         add   r5           ;
CODE_099D6F:         to r6              ;
CODE_099D70:         getb               ;
CODE_099D71:         iwt   r0,#AE58     ;
CODE_099D74:         to r14             ;
CODE_099D75:         add   r5           ;
CODE_099D76:         from r10           ;
CODE_099D77:         to r8              ;
CODE_099D78:         mult  r6           ;
CODE_099D79:         from r11           ;
CODE_099D7A:         to r9              ;
CODE_099D7B:         mult  r6           ;
CODE_099D7C:         to r7              ;
CODE_099D7D:         getb               ;
CODE_099D7E:         from r11           ;
CODE_099D7F:         mult  r7           ;
CODE_099D80:         add   r8           ;
CODE_099D81:         add   r0           ;
CODE_099D82:         add   r0           ;
CODE_099D83:         add   r2           ;
CODE_099D84:         hib                ;
CODE_099D85:         sex                ;
CODE_099D86:         add   r12          ;
CODE_099D87:         sm    (008C),r0    ;
CODE_099D8B:         from r10           ;
CODE_099D8C:         mult  r7           ;
CODE_099D8D:         from r9            ;
CODE_099D8E:         sub   r0           ;
CODE_099D8F:         add   r0           ;
CODE_099D90:         add   r0           ;
CODE_099D91:         add   r2           ;
CODE_099D92:         hib                ;
CODE_099D93:         sex                ;
CODE_099D94:         add   r13          ;
CODE_099D95:         sm    (0090),r0    ;
CODE_099D99:         ibt   r0,#0001     ;
CODE_099D9B:         stop               ;
CODE_099D9C:         nop                ;
CODE_099D9D:         ibt   r0,#0008     ;
CODE_099D9F:         romb               ;
CODE_099DA1:         lm    r1,(1972)    ;
CODE_099DA5:         lms   r0,(003E)    ;
CODE_099DA8:         to r5              ;
CODE_099DA9:         hib                ;
CODE_099DAA:         iwt   r0,#AE18     ;
CODE_099DAD:         to r14             ;
CODE_099DAE:         add   r5           ;
CODE_099DAF:         iwt   r0,#1BB6     ;
CODE_099DB2:         add   r1           ;
CODE_099DB3:         to r2              ;
CODE_099DB4:         ldw   (r0)         ;
CODE_099DB5:         from r2            ;
CODE_099DB6:         not                ;
CODE_099DB7:         to r3              ;
CODE_099DB8:         add   #01          ;
CODE_099DBA:         iwt   r0,#1BB8     ;
CODE_099DBD:         add   r1           ;
CODE_099DBE:         to r4              ;
CODE_099DBF:         ldw   (r0)         ;
CODE_099DC0:         to r6              ;
CODE_099DC1:         getb               ;
CODE_099DC2:         iwt   r0,#AE58     ;
CODE_099DC5:         to r14             ;
CODE_099DC6:         add   r5           ;
CODE_099DC7:         to r7              ;
CODE_099DC8:         getb               ;
CODE_099DC9:         from r4            ;
CODE_099DCA:         to r8              ;
CODE_099DCB:         mult  r6           ;
CODE_099DCC:         from r4            ;
CODE_099DCD:         to r9              ;
CODE_099DCE:         mult  r7           ;
CODE_099DCF:         iwt   r11,#0080    ;
CODE_099DD2:         from r3            ;
CODE_099DD3:         mult  r6           ;
CODE_099DD4:         add   r9           ;
CODE_099DD5:         add   r0           ;
CODE_099DD6:         add   r0           ;
CODE_099DD7:         add   r11          ;
CODE_099DD8:         hib                ;
CODE_099DD9:         to r10             ;
CODE_099DDA:         sex                ;
CODE_099DDB:         iwt   r0,#10E2     ;
CODE_099DDE:         add   r1           ;
CODE_099DDF:         ldw   (r0)         ;
CODE_099DE0:         add   r10          ;
CODE_099DE1:         sms   (0000),r0    ;
CODE_099DE4:         from r3            ;
CODE_099DE5:         mult  r7           ;
CODE_099DE6:         from r8            ;
CODE_099DE7:         sub   r0           ;
CODE_099DE8:         add   r0           ;
CODE_099DE9:         add   r0           ;
CODE_099DEA:         add   r11          ;
CODE_099DEB:         hib                ;
CODE_099DEC:         to r10             ;
CODE_099DED:         sex                ;
CODE_099DEE:         iwt   r0,#1182     ;
CODE_099DF1:         add   r1           ;
CODE_099DF2:         ldw   (r0)         ;
CODE_099DF3:         add   r10          ;
CODE_099DF4:         sms   (0002),r0    ;
CODE_099DF7:         from r2            ;
CODE_099DF8:         mult  r6           ;
CODE_099DF9:         add   r9           ;
CODE_099DFA:         add   r0           ;
CODE_099DFB:         add   r0           ;
CODE_099DFC:         add   r11          ;
CODE_099DFD:         hib                ;
CODE_099DFE:         to r10             ;
CODE_099DFF:         sex                ;
CODE_099E00:         iwt   r0,#10E2     ;
CODE_099E03:         add   r1           ;
CODE_099E04:         ldw   (r0)         ;
CODE_099E05:         add   r10          ;
CODE_099E06:         sms   (0004),r0    ;
CODE_099E09:         from r2            ;
CODE_099E0A:         mult  r7           ;
CODE_099E0B:         from r8            ;
CODE_099E0C:         sub   r0           ;
CODE_099E0D:         add   r0           ;
CODE_099E0E:         add   r0           ;
CODE_099E0F:         add   r11          ;
CODE_099E10:         hib                ;
CODE_099E11:         to r10             ;
CODE_099E12:         sex                ;
CODE_099E13:         iwt   r0,#1182     ;
CODE_099E16:         add   r1           ;
CODE_099E17:         ldw   (r0)         ;
CODE_099E18:         add   r10          ;
CODE_099E19:         sms   (0006),r0    ;
CODE_099E1C:         lms   r8,(0000)    ;
CODE_099E1F:         lms   r9,(0004)    ;
CODE_099E22:         lm    r10,(1CD6)   ;
CODE_099E26:         from r10           ;
CODE_099E27:         to r7              ;
CODE_099E28:         sub   r8           ;
CODE_099E29:         bmi CODE_099E9C    ;
CODE_099E2B:         from r10           ;
CODE_099E2C:         sub   r9           ;
CODE_099E2D:         bpl CODE_099E9C    ;
CODE_099E2F:         nop                ;
CODE_099E30:         lm    r0,(1222)    ;
CODE_099E34:         sub   #00          ;
CODE_099E36:         bmi CODE_099E9C    ;
CODE_099E38:         nop                ;
CODE_099E39:         from r9            ;
CODE_099E3A:         sub   r8           ;
CODE_099E3B:         to r9              ;
CODE_099E3C:         add   r0           ;
CODE_099E3D:         iwt   r0,#2200     ;
CODE_099E40:         add   r9           ;
CODE_099E41:         to r6              ;
CODE_099E42:         ldw   (r0)         ;
CODE_099E43:         lms   r8,(0002)    ;
CODE_099E46:         lms   r0,(0006)    ;
CODE_099E49:         sub   r8           ;
CODE_099E4A:         lob                ;
CODE_099E4B:         swap               ;
CODE_099E4C:         to r6              ;
CODE_099E4D:         fmult              ;
CODE_099E4E:         from r7            ;
CODE_099E4F:         lob                ;
CODE_099E50:         swap               ;
CODE_099E51:         fmult              ;
CODE_099E52:         to r8              ;
CODE_099E53:         add   r8           ;
CODE_099E54:         ibt   r6,#0020     ;
CODE_099E56:         lm    r7,(1182)    ;
CODE_099E5A:         from r7            ;
CODE_099E5B:         add   r6           ;
CODE_099E5C:         sub   r8           ;
CODE_099E5D:         bmi CODE_099E9C    ;
CODE_099E5F:         nop                ;
CODE_099E60:         move  r8,r0        ;
CODE_099E62:         sub   #09          ;
CODE_099E64:         bpl CODE_099E9C    ;
CODE_099E66:         nop                ;
CODE_099E67:         from r7            ;
CODE_099E68:         sub   r8           ;
CODE_099E69:         sm    (1182),r0    ;
CODE_099E6D:         iwt   r0,#0100     ;
CODE_099E70:         sm    (1222),r0    ;
CODE_099E74:         iwt   r0,#19D8     ;
CODE_099E77:         add   r1           ;
CODE_099E78:         to r6              ;
CODE_099E79:         ldw   (r0)         ;
CODE_099E7A:         iwt   r0,#1978     ;
CODE_099E7D:         add   r1           ;
CODE_099E7E:         to r7              ;
CODE_099E7F:         ldw   (r0)         ;
CODE_099E80:         lm    r0,(1CD6)    ;
CODE_099E84:         sub   r7           ;
CODE_099E85:         with r6            ;
CODE_099E86:         add   r0           ;
CODE_099E87:         iwt   r0,#19D8     ;
CODE_099E8A:         add   r1           ;
CODE_099E8B:         from r6            ;
CODE_099E8C:         stw   (r0)         ;
CODE_099E8D:         iwt   r0,#1976     ;
CODE_099E90:         add   r1           ;
CODE_099E91:         ldw   (r0)         ;
CODE_099E92:         hib                ;
CODE_099E93:         cmp   r5           ;
CODE_099E95:         bne CODE_099EA0    ;
CODE_099E97:         nop                ;
CODE_099E98:         ibt   r0,#0001     ;
CODE_099E9A:         stop               ;
CODE_099E9B:         nop                ;

CODE_099E9C:         ibt   r0,#0000     ;
CODE_099E9E:         stop               ;
CODE_099E9F:         nop                ;

CODE_099EA0:         from r5            ;
CODE_099EA1:         not                ;
CODE_099EA2:         inc   r0           ;
CODE_099EA3:         to r5              ;
CODE_099EA4:         lob                ;
CODE_099EA5:         iwt   r0,#AE18     ;
CODE_099EA8:         to r14             ;
CODE_099EA9:         add   r5           ;
CODE_099EAA:         lm    r8,(10E2)    ;
CODE_099EAE:         iwt   r0,#10E2     ;
CODE_099EB1:         add   r1           ;
CODE_099EB2:         to r12             ;
CODE_099EB3:         ldw   (r0)         ;
CODE_099EB4:         with r8            ;
CODE_099EB5:         sub   r12          ;
CODE_099EB6:         lm    r9,(1182)    ;
CODE_099EBA:         iwt   r0,#1182     ;
CODE_099EBD:         add   r1           ;
CODE_099EBE:         to r13             ;
CODE_099EBF:         ldw   (r0)         ;
CODE_099EC0:         with r9            ;
CODE_099EC1:         sub   r13          ;
CODE_099EC2:         to r6              ;
CODE_099EC3:         getb               ;
CODE_099EC4:         iwt   r0,#AE58     ;
CODE_099EC7:         to r14             ;
CODE_099EC8:         add   r5           ;
CODE_099EC9:         from r8            ;
CODE_099ECA:         to r10             ;
CODE_099ECB:         mult  r6           ;
CODE_099ECC:         from r9            ;
CODE_099ECD:         to r11             ;
CODE_099ECE:         mult  r6           ;
CODE_099ECF:         to r7              ;
CODE_099ED0:         getb               ;
CODE_099ED1:         iwt   r2,#0080     ;
CODE_099ED4:         from r9            ;
CODE_099ED5:         mult  r7           ;
CODE_099ED6:         add   r10          ;
CODE_099ED7:         add   r0           ;
CODE_099ED8:         add   r0           ;
CODE_099ED9:         add   r2           ;
CODE_099EDA:         hib                ;
CODE_099EDB:         to r10             ;
CODE_099EDC:         sex                ;
CODE_099EDD:         from r8            ;
CODE_099EDE:         mult  r7           ;
CODE_099EDF:         from r11           ;
CODE_099EE0:         sub   r0           ;
CODE_099EE1:         add   r0           ;
CODE_099EE2:         add   r0           ;
CODE_099EE3:         add   r2           ;
CODE_099EE4:         hib                ;
CODE_099EE5:         to r11             ;
CODE_099EE6:         sex                ;
CODE_099EE7:         iwt   r0,#1976     ;
CODE_099EEA:         add   r1           ;
CODE_099EEB:         ldw   (r0)         ;
CODE_099EEC:         to r5              ;
CODE_099EED:         hib                ;
CODE_099EEE:         iwt   r0,#AE18     ;
CODE_099EF1:         to r14             ;
CODE_099EF2:         add   r5           ;
CODE_099EF3:         to r6              ;
CODE_099EF4:         getb               ;
CODE_099EF5:         iwt   r0,#AE58     ;
CODE_099EF8:         to r14             ;
CODE_099EF9:         add   r5           ;
CODE_099EFA:         from r10           ;
CODE_099EFB:         to r8              ;
CODE_099EFC:         mult  r6           ;
CODE_099EFD:         from r11           ;
CODE_099EFE:         to r9              ;
CODE_099EFF:         mult  r6           ;
CODE_099F00:         to r7              ;
CODE_099F01:         getb               ;
CODE_099F02:         from r11           ;
CODE_099F03:         mult  r7           ;
CODE_099F04:         add   r8           ;
CODE_099F05:         add   r0           ;
CODE_099F06:         add   r0           ;
CODE_099F07:         add   r2           ;
CODE_099F08:         hib                ;
CODE_099F09:         sex                ;
CODE_099F0A:         add   r12          ;
CODE_099F0B:         sm    (10E2),r0    ;
CODE_099F0F:         from r10           ;
CODE_099F10:         mult  r7           ;
CODE_099F11:         from r9            ;
CODE_099F12:         sub   r0           ;
CODE_099F13:         add   r0           ;
CODE_099F14:         add   r0           ;
CODE_099F15:         add   r2           ;
CODE_099F16:         hib                ;
CODE_099F17:         sex                ;
CODE_099F18:         add   r13          ;
CODE_099F19:         sm    (1182),r0    ;
CODE_099F1D:         ibt   r0,#0001     ;
CODE_099F1F:         stop               ;
CODE_099F20:         nop                ;

CODE_099F21:         ibt   r0,#0008     ;
CODE_099F23:         romb               ;
CODE_099F25:         lm    r1,(1972)    ;
CODE_099F29:         iwt   r0,#1976     ;
CODE_099F2C:         add   r1           ;
CODE_099F2D:         ldw   (r0)         ;
CODE_099F2E:         to r2              ;
CODE_099F2F:         hib                ;
CODE_099F30:         iwt   r0,#AE18     ;
CODE_099F33:         to r14             ;
CODE_099F34:         add   r2           ;
CODE_099F35:         iwt   r0,#1A36     ;
CODE_099F38:         add   r1           ;
CODE_099F39:         to r3              ;
CODE_099F3A:         ldw   (r0)         ;
CODE_099F3B:         iwt   r0,#1978     ;
CODE_099F3E:         add   r1           ;
CODE_099F3F:         to r12             ;
CODE_099F40:         ldw   (r0)         ;
CODE_099F41:         with r3            ;
CODE_099F42:         sub   r12          ;
CODE_099F43:         iwt   r0,#1A38     ;
CODE_099F46:         add   r1           ;
CODE_099F47:         to r4              ;
CODE_099F48:         ldw   (r0)         ;
CODE_099F49:         iwt   r0,#19D6     ;
CODE_099F4C:         add   r1           ;
CODE_099F4D:         to r13             ;
CODE_099F4E:         ldw   (r0)         ;
CODE_099F4F:         with r4            ;
CODE_099F50:         sub   r13          ;
CODE_099F51:         to r5              ;
CODE_099F52:         getb               ;
CODE_099F53:         iwt   r0,#AE58     ;
CODE_099F56:         to r14             ;
CODE_099F57:         add   r2           ;
CODE_099F58:         from r3            ;
CODE_099F59:         to r8              ;
CODE_099F5A:         mult  r5           ;
CODE_099F5B:         from r4            ;
CODE_099F5C:         to r9              ;
CODE_099F5D:         mult  r5           ;
CODE_099F5E:         to r7              ;
CODE_099F5F:         getb               ;
CODE_099F60:         iwt   r10,#0080    ;
CODE_099F63:         from r4            ;
CODE_099F64:         mult  r7           ;
CODE_099F65:         add   r8           ;
CODE_099F66:         add   r0           ;
CODE_099F67:         add   r0           ;
CODE_099F68:         add   r10          ;
CODE_099F69:         hib                ;
CODE_099F6A:         sex                ;
CODE_099F6B:         to r10             ;
CODE_099F6C:         add   r12          ;
CODE_099F6D:         iwt   r0,#10E2     ;
CODE_099F70:         add   r1           ;
CODE_099F71:         ldw   (r0)         ;
CODE_099F72:         from r10           ;
CODE_099F73:         to r11             ;
CODE_099F74:         sub   r0           ;
CODE_099F75:         iwt   r0,#12C0     ;
CODE_099F78:         add   r1           ;
CODE_099F79:         from r11           ;
CODE_099F7A:         stw   (r0)         ;
CODE_099F7B:         iwt   r0,#10E2     ;
CODE_099F7E:         add   r1           ;
CODE_099F7F:         from r10           ;
CODE_099F80:         stw   (r0)         ;
CODE_099F81:         iwt   r10,#0080    ;
CODE_099F84:         from r3            ;
CODE_099F85:         mult  r7           ;
CODE_099F86:         from r9            ;
CODE_099F87:         sub   r0           ;
CODE_099F88:         add   r0           ;
CODE_099F89:         add   r0           ;
CODE_099F8A:         add   r10          ;
CODE_099F8B:         hib                ;
CODE_099F8C:         sex                ;
CODE_099F8D:         to r10             ;
CODE_099F8E:         add   r13          ;
CODE_099F8F:         iwt   r0,#1182     ;
CODE_099F92:         add   r1           ;
CODE_099F93:         ldw   (r0)         ;
CODE_099F94:         from r10           ;
CODE_099F95:         to r11             ;
CODE_099F96:         sub   r0           ;
CODE_099F97:         iwt   r0,#12C2     ;
CODE_099F9A:         add   r1           ;
CODE_099F9B:         from r11           ;
CODE_099F9C:         stw   (r0)         ;
CODE_099F9D:         iwt   r0,#1182     ;
CODE_099FA0:         add   r1           ;
CODE_099FA1:         from r10           ;
CODE_099FA2:         stw   (r0)         ;
CODE_099FA3:         stop               ;
CODE_099FA4:         nop                ;

CODE_099FA5:         ibt   r1,#FFFF     ;
CODE_099FA7:         iwt   r2,#0F00     ;
CODE_099FAA:         iwt   r3,#1360     ;
CODE_099FAD:         iwt   r4,#0010     ;
CODE_099FB0:         ibt   r5,#FFFF     ;
CODE_099FB2:         ibt   r6,#FFFF     ;
CODE_099FB4:         ibt   r7,#0000     ;
CODE_099FB6:         iwt   r0,#1CD6     ;
CODE_099FB9:         add   r10          ;
CODE_099FBA:         to r8              ;
CODE_099FBB:         ldw   (r0)         ;
CODE_099FBC:         iwt   r0,#1CD8     ;
CODE_099FBF:         add   r10          ;
CODE_099FC0:         to r9              ;
CODE_099FC1:         ldw   (r0)         ;
CODE_099FC2:         cache              ;
CODE_099FC3:         ibt   r12,#0018    ;
CODE_099FC5:         move  r13,r15      ;
CODE_099FC7:         ldw   (r2)         ;
CODE_099FC8:         sub   r4           ;
CODE_099FC9:         bne CODE_09A01D    ;
CODE_099FCB:         nop                ;
CODE_099FCC:         ldw   (r3)         ;
CODE_099FCD:         cmp   r14          ;
CODE_099FCF:         bcc CODE_09A01D    ;
CODE_099FD1:         nop                ;
CODE_099FD2:         cmp   r11          ;
CODE_099FD4:         bcs CODE_09A01D    ;
CODE_099FD6:         nop                ;
CODE_099FD7:         iwt   r0,#1D38     ;
CODE_099FDA:         add   r7           ;
CODE_099FDB:         ldw   (r0)         ;
CODE_099FDC:         sub   #00          ;
CODE_099FDE:         bne CODE_09A01D    ;
CODE_099FE0:         nop                ;
CODE_099FE1:         iwt   r0,#19D8     ;
CODE_099FE4:         add   r7           ;
CODE_099FE5:         ldb   (r0)         ;
CODE_099FE7:         sex                ;
CODE_099FE8:         bmi CODE_09A01D    ;
CODE_099FEA:         nop                ;
CODE_099FEB:         iwt   r0,#1A36     ;
CODE_099FEE:         add   r7           ;
CODE_099FEF:         ldw   (r0)         ;
CODE_099FF0:         sub   #00          ;
CODE_099FF2:         bne CODE_09A01D    ;
CODE_099FF4:         nop                ;
CODE_099FF5:         iwt   r0,#1CD6     ;
CODE_099FF8:         add   r7           ;
CODE_099FF9:         ldw   (r0)         ;
CODE_099FFA:         to r10             ;
CODE_099FFB:         sub   r8           ;
CODE_099FFC:         bpl CODE_09A002    ;
CODE_099FFE:         with r10           ;
CODE_099FFF:         not                ;
CODE_09A000:         inc   r10          ;
CODE_09A001:         from r10           ;
CODE_09A002:         cmp   r5           ;
CODE_09A004:         bcs CODE_09A01D    ;
CODE_09A006:         nop                ;
CODE_09A007:         iwt   r0,#1CD8     ;
CODE_09A00A:         add   r7           ;
CODE_09A00B:         ldw   (r0)         ;
CODE_09A00C:         sub   r9           ;
CODE_09A00D:         bpl CODE_09A012    ;
CODE_09A00F:         nop                ;
CODE_09A010:         not                ;
CODE_09A011:         inc   r0           ;
CODE_09A012:         cmp   r6           ;
CODE_09A014:         bcs CODE_09A01D    ;
CODE_09A016:         nop                ;
CODE_09A017:         move  r6,r0        ;
CODE_09A019:         move  r5,r10       ;
CODE_09A01B:         move  r1,r7        ;
CODE_09A01D:         with r2            ;
CODE_09A01E:         add   #04          ;
CODE_09A020:         with r3            ;
CODE_09A021:         add   #04          ;
CODE_09A023:         with r7            ;
CODE_09A024:         add   #04          ;
CODE_09A026:         loop               ;
CODE_09A027:         nop                ;
CODE_09A028:         stop               ;
CODE_09A029:         nop                ;

CODE_09A02A:         ibt   r4,#0006     ;
CODE_09A02C:         cache              ;
CODE_09A02D:         ibt   r12,#001D    ;
CODE_09A02F:         move  r13,r15      ;
CODE_09A031:         ldw   (r3)         ;
CODE_09A032:         add   r1           ;
CODE_09A033:         sbk                ;
CODE_09A034:         inc   r3           ;
CODE_09A035:         inc   r3           ;
CODE_09A036:         ldw   (r3)         ;
CODE_09A037:         add   r2           ;
CODE_09A038:         with r3            ;
CODE_09A039:         add   r4           ;
CODE_09A03A:         loop               ;
CODE_09A03B:         sbk                ;
CODE_09A03C:         stop               ;
CODE_09A03D:         nop                ;

DATA_09A03E:         db $04, $00, $F0, $F0, $00, $F0, $F0, $00
DATA_09A046:         db $00, $00, $00, $00, $F0, $00, $00, $F0
DATA_09A04E:         db $F0, $F0, $FC, $00, $00, $F0, $F0, $F0
DATA_09A056:         db $00, $00, $F0, $00, $F0, $00, $00, $00
DATA_09A05E:         db $F0, $F0, $00, $F0, $DB, $92, $0C, $00
DATA_09A066:         db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0
DATA_09A06E:         db $F4, $F0, $E4, $00, $F4, $00, $05, $8D
DATA_09A076:         db $F6, $8D, $19, $8D, $10, $9C, $F0, $F0
DATA_09A07E:         db $00, $F0, $F0, $00, $00, $00, $21, $C8
DATA_09A086:         db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00
DATA_09A08E:         db $2C, $00, $00, $6E, $DE, $92, $0C, $00
DATA_09A096:         db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0
DATA_09A09E:         db $F4, $F0, $E4, $00, $F4, $00, $05, $8D
DATA_09A0A6:         db $F6, $8D, $14, $8D, $18, $9C, $F0, $F0
DATA_09A0AE:         db $00, $F0, $F0, $00, $00, $00, $28, $C8
DATA_09A0B6:         db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00
DATA_09A0BE:         db $2C, $00, $00, $6E, $E4, $92, $0C, $00
DATA_09A0C6:         db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0
DATA_09A0CE:         db $F4, $F0, $E4, $00, $F4, $00, $06, $8D
DATA_09A0D6:         db $F7, $8D, $0B, $8D, $1E, $9C, $F0, $F0
DATA_09A0DE:         db $00, $F0, $F0, $00, $00, $00, $30, $C8
DATA_09A0E6:         db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00
DATA_09A0EE:         db $2C, $00, $00, $6E, $EE, $92, $0C, $00
DATA_09A0F6:         db $FC, $00, $0C, $F0, $FC, $F0, $E4, $F0
DATA_09A0FE:         db $F4, $F0, $E4, $00, $F4, $00, $07, $8D
DATA_09A106:         db $F8, $8D, $FF, $8D, $22, $9C, $F0, $F0
DATA_09A10E:         db $00, $F0, $F0, $00, $00, $00, $36, $C8
DATA_09A116:         db $F0, $F0, $2C, $00, $F0, $6E, $F0, $00
DATA_09A11E:         db $2C, $00, $00, $6E

CODE_09A122:         cache              ;
CODE_09A123:         lm    r1,(1972)    ;
CODE_09A127:         lms   r11,(0092)   ;
CODE_09A12A:         ibt   r0,#0008     ;
CODE_09A12C:         romb               ;
CODE_09A12E:         iwt   r0,#1976     ;
CODE_09A131:         add   r1           ;
CODE_09A132:         ldw   (r0)         ;
CODE_09A133:         not                ;
CODE_09A134:         inc   r0           ;
CODE_09A135:         to r4              ;
CODE_09A136:         hib                ;
CODE_09A137:         iwt   r0,#AE18     ;
CODE_09A13A:         to r14             ;
CODE_09A13B:         add   r4           ;
CODE_09A13C:         iwt   r5,#AE58     ;
CODE_09A13F:         getbs              ;
CODE_09A141:         from r5            ;
CODE_09A142:         to r14             ;
CODE_09A143:         add   r4           ;
CODE_09A144:         add   r0           ;
CODE_09A145:         to r2              ;
CODE_09A146:         add   r0           ;
CODE_09A147:         getbs              ;
CODE_09A149:         add   r0           ;
CODE_09A14A:         to r3              ;
CODE_09A14B:         add   r0           ;
CODE_09A14C:         ibt   r0,#0009     ;
CODE_09A14E:         romb               ;
CODE_09A150:         iwt   r14,#A03E    ;
CODE_09A153:         iwt   r0,#1A37     ;
CODE_09A156:         add   r1           ;
CODE_09A157:         to r9              ;
CODE_09A158:         ldb   (r0)         ;
CODE_09A15A:         iwt   r0,#1978     ;
CODE_09A15D:         add   r1           ;
CODE_09A15E:         to r6              ;
CODE_09A15F:         ldw   (r0)         ;
CODE_09A160:         iwt   r0,#1680     ;
CODE_09A163:         add   r1           ;
CODE_09A164:         to r4              ;
CODE_09A165:         ldw   (r0)         ;
CODE_09A166:         getb               ;
CODE_09A167:         inc   r14          ;
CODE_09A168:         swap               ;
CODE_09A169:         fmult              ;
CODE_09A16A:         to r4              ;
CODE_09A16B:         add   r4           ;
CODE_09A16C:         iwt   r0,#19D6     ;
CODE_09A16F:         add   r1           ;
CODE_09A170:         to r6              ;
CODE_09A171:         ldw   (r0)         ;
CODE_09A172:         iwt   r0,#1682     ;
CODE_09A175:         add   r1           ;
CODE_09A176:         to r5              ;
CODE_09A177:         ldw   (r0)         ;
CODE_09A178:         getb               ;
CODE_09A179:         inc   r14          ;
CODE_09A17A:         swap               ;
CODE_09A17B:         fmult              ;
CODE_09A17C:         to r5              ;
CODE_09A17D:         add   r5           ;
CODE_09A17E:         iwt   r6,#0C00     ;
CODE_09A181:         dec   r9           ;
CODE_09A182:         bmi CODE_09A18E    ;
CODE_09A184:         inc   r9           ;
CODE_09A185:         iwt   r0,#1978     ;
CODE_09A188:         add   r1           ;
CODE_09A189:         ldw   (r0)         ;
CODE_09A18A:         fmult              ;
CODE_09A18B:         lob                ;
CODE_09A18C:         to r6              ;
CODE_09A18D:         swap               ;
CODE_09A18E:         from r2            ;
CODE_09A18F:         fmult              ;
CODE_09A190:         to r7              ;
CODE_09A191:         add   r4           ;
CODE_09A192:         from r3            ;
CODE_09A193:         fmult              ;
CODE_09A194:         to r8              ;
CODE_09A195:         add   r5           ;
CODE_09A196:         iwt   r10,#0000    ;
CODE_09A199:         ibt   r12,#0004    ;
CODE_09A19B:         move  r13,r15      ;
CODE_09A19D:         getbs              ;
CODE_09A19F:         inc   r14          ;
CODE_09A1A0:         add   r7           ;
CODE_09A1A1:         stw   (r11)        ;
CODE_09A1A2:         inc   r11          ;
CODE_09A1A3:         inc   r11          ;
CODE_09A1A4:         getbs              ;
CODE_09A1A6:         inc   r14          ;
CODE_09A1A7:         add   r8           ;
CODE_09A1A8:         stw   (r11)        ;
CODE_09A1A9:         inc   r11          ;
CODE_09A1AA:         inc   r11          ;
CODE_09A1AB:         to r6              ;
CODE_09A1AC:         ldw   (r10)        ;
CODE_09A1AD:         inc   r10          ;
CODE_09A1AE:         inc   r10          ;
CODE_09A1AF:         iwt   r0,#3E00     ;
CODE_09A1B2:         or    r6           ;
CODE_09A1B3:         stw   (r11)        ;
CODE_09A1B4:         inc   r11          ;
CODE_09A1B5:         inc   r11          ;
CODE_09A1B6:         ibt   r0,#0002     ;
CODE_09A1B8:         stw   (r11)        ;
CODE_09A1B9:         inc   r11          ;
CODE_09A1BA:         loop               ;
CODE_09A1BB:         inc   r11          ;
CODE_09A1BC:         iwt   r6,#2400     ;
CODE_09A1BF:         dec   r9           ;
CODE_09A1C0:         bmi CODE_09A1CC    ;
CODE_09A1C2:         inc   r9           ;
CODE_09A1C3:         iwt   r0,#1978     ;
CODE_09A1C6:         add   r1           ;
CODE_09A1C7:         ldw   (r0)         ;
CODE_09A1C8:         fmult              ;
CODE_09A1C9:         lob                ;
CODE_09A1CA:         to r6              ;
CODE_09A1CB:         swap               ;
CODE_09A1CC:         from r2            ;
CODE_09A1CD:         fmult              ;
CODE_09A1CE:         to r7              ;
CODE_09A1CF:         add   r4           ;
CODE_09A1D0:         from r3            ;
CODE_09A1D1:         fmult              ;
CODE_09A1D2:         to r8              ;
CODE_09A1D3:         add   r5           ;
CODE_09A1D4:         iwt   r10,#0000    ;
CODE_09A1D7:         ibt   r12,#0004    ;
CODE_09A1D9:         move  r13,r15      ;
CODE_09A1DB:         getbs              ;
CODE_09A1DD:         inc   r14          ;
CODE_09A1DE:         add   r7           ;
CODE_09A1DF:         stw   (r11)        ;
CODE_09A1E0:         inc   r11          ;
CODE_09A1E1:         inc   r11          ;
CODE_09A1E2:         getbs              ;
CODE_09A1E4:         inc   r14          ;
CODE_09A1E5:         add   r8           ;
CODE_09A1E6:         stw   (r11)        ;
CODE_09A1E7:         inc   r11          ;
CODE_09A1E8:         inc   r11          ;
CODE_09A1E9:         to r6              ;
CODE_09A1EA:         ldw   (r10)        ;
CODE_09A1EB:         inc   r10          ;
CODE_09A1EC:         inc   r10          ;
CODE_09A1ED:         iwt   r0,#FC00     ;
CODE_09A1F0:         or    r6           ;
CODE_09A1F1:         stw   (r11)        ;
CODE_09A1F2:         inc   r11          ;
CODE_09A1F3:         inc   r11          ;
CODE_09A1F4:         ibt   r0,#0002     ;
CODE_09A1F6:         stw   (r11)        ;
CODE_09A1F7:         inc   r11          ;
CODE_09A1F8:         loop               ;
CODE_09A1F9:         inc   r11          ;
CODE_09A1FA:         with r2            ;
CODE_09A1FB:         not                ;
CODE_09A1FC:         inc   r2           ;
CODE_09A1FD:         iwt   r0,#1978     ;
CODE_09A200:         add   r1           ;
CODE_09A201:         to r6              ;
CODE_09A202:         ldw   (r0)         ;
CODE_09A203:         iwt   r0,#1680     ;
CODE_09A206:         add   r1           ;
CODE_09A207:         to r4              ;
CODE_09A208:         ldw   (r0)         ;
CODE_09A209:         getb               ;
CODE_09A20A:         inc   r14          ;
CODE_09A20B:         swap               ;
CODE_09A20C:         fmult              ;
CODE_09A20D:         to r4              ;
CODE_09A20E:         add   r4           ;
CODE_09A20F:         iwt   r0,#19D6     ;
CODE_09A212:         add   r1           ;
CODE_09A213:         to r6              ;
CODE_09A214:         ldw   (r0)         ;
CODE_09A215:         iwt   r0,#1682     ;
CODE_09A218:         add   r1           ;
CODE_09A219:         to r5              ;
CODE_09A21A:         ldw   (r0)         ;
CODE_09A21B:         getb               ;
CODE_09A21C:         inc   r14          ;
CODE_09A21D:         swap               ;
CODE_09A21E:         fmult              ;
CODE_09A21F:         to r5              ;
CODE_09A220:         add   r5           ;
CODE_09A221:         iwt   r6,#0C00     ;
CODE_09A224:         dec   r9           ;
CODE_09A225:         bmi CODE_09A231    ;
CODE_09A227:         inc   r9           ;
CODE_09A228:         iwt   r0,#1978     ;
CODE_09A22B:         add   r1           ;
CODE_09A22C:         ldw   (r0)         ;
CODE_09A22D:         fmult              ;
CODE_09A22E:         lob                ;
CODE_09A22F:         to r6              ;
CODE_09A230:         swap               ;
CODE_09A231:         from r2            ;
CODE_09A232:         fmult              ;
CODE_09A233:         to r7              ;
CODE_09A234:         add   r4           ;
CODE_09A235:         from r3            ;
CODE_09A236:         fmult              ;
CODE_09A237:         to r8              ;
CODE_09A238:         add   r5           ;
CODE_09A239:         iwt   r10,#0000    ;
CODE_09A23C:         ibt   r12,#0004    ;
CODE_09A23E:         move  r13,r15      ;
CODE_09A240:         getbs              ;
CODE_09A242:         inc   r14          ;
CODE_09A243:         add   r7           ;
CODE_09A244:         stw   (r11)        ;
CODE_09A245:         inc   r11          ;
CODE_09A246:         inc   r11          ;
CODE_09A247:         getbs              ;
CODE_09A249:         inc   r14          ;
CODE_09A24A:         add   r8           ;
CODE_09A24B:         stw   (r11)        ;
CODE_09A24C:         inc   r11          ;
CODE_09A24D:         inc   r11          ;
CODE_09A24E:         to r6              ;
CODE_09A24F:         ldw   (r10)        ;
CODE_09A250:         inc   r10          ;
CODE_09A251:         inc   r10          ;
CODE_09A252:         iwt   r0,#7E00     ;
CODE_09A255:         or    r6           ;
CODE_09A256:         stw   (r11)        ;
CODE_09A257:         inc   r11          ;
CODE_09A258:         inc   r11          ;
CODE_09A259:         ibt   r0,#0002     ;
CODE_09A25B:         stw   (r11)        ;
CODE_09A25C:         inc   r11          ;
CODE_09A25D:         loop               ;
CODE_09A25E:         inc   r11          ;
CODE_09A25F:         iwt   r6,#2400     ;
CODE_09A262:         dec   r9           ;
CODE_09A263:         bmi CODE_09A26F    ;
CODE_09A265:         inc   r9           ;
CODE_09A266:         iwt   r0,#1978     ;
CODE_09A269:         add   r1           ;
CODE_09A26A:         ldw   (r0)         ;
CODE_09A26B:         fmult              ;
CODE_09A26C:         lob                ;
CODE_09A26D:         to r6              ;
CODE_09A26E:         swap               ;
CODE_09A26F:         from r2            ;
CODE_09A270:         fmult              ;
CODE_09A271:         to r7              ;
CODE_09A272:         add   r4           ;
CODE_09A273:         from r3            ;
CODE_09A274:         fmult              ;
CODE_09A275:         to r8              ;
CODE_09A276:         add   r5           ;
CODE_09A277:         iwt   r10,#0000    ;
CODE_09A27A:         ibt   r12,#0004    ;
CODE_09A27C:         move  r13,r15      ;
CODE_09A27E:         getbs              ;
CODE_09A280:         inc   r14          ;
CODE_09A281:         add   r7           ;
CODE_09A282:         stw   (r11)        ;
CODE_09A283:         inc   r11          ;
CODE_09A284:         inc   r11          ;
CODE_09A285:         getbs              ;
CODE_09A287:         inc   r14          ;
CODE_09A288:         add   r8           ;
CODE_09A289:         stw   (r11)        ;
CODE_09A28A:         inc   r11          ;
CODE_09A28B:         inc   r11          ;
CODE_09A28C:         to r6              ;
CODE_09A28D:         ldw   (r10)        ;
CODE_09A28E:         inc   r10          ;
CODE_09A28F:         inc   r10          ;
CODE_09A290:         iwt   r0,#BC00     ;
CODE_09A293:         or    r6           ;
CODE_09A294:         stw   (r11)        ;
CODE_09A295:         inc   r11          ;
CODE_09A296:         inc   r11          ;
CODE_09A297:         ibt   r0,#0002     ;
CODE_09A299:         stw   (r11)        ;
CODE_09A29A:         inc   r11          ;
CODE_09A29B:         loop               ;
CODE_09A29C:         inc   r11          ;
CODE_09A29D:         iwt   r0,#1402     ;
CODE_09A2A0:         add   r1           ;
CODE_09A2A1:         to r6              ;
CODE_09A2A2:         ldw   (r0)         ;
CODE_09A2A3:         iwt   r0,#0030     ;
CODE_09A2A6:         mult  r6           ;
CODE_09A2A7:         to r14             ;
CODE_09A2A8:         add   r14          ;
CODE_09A2A9:         iwt   r0,#1400     ;
CODE_09A2AC:         add   r1           ;
CODE_09A2AD:         to r2              ;
CODE_09A2AE:         ldw   (r0)         ;
CODE_09A2AF:         iwt   r0,#1680     ;
CODE_09A2B2:         add   r1           ;
CODE_09A2B3:         to r3              ;
CODE_09A2B4:         ldw   (r0)         ;
CODE_09A2B5:         iwt   r0,#1682     ;
CODE_09A2B8:         add   r1           ;
CODE_09A2B9:         to r4              ;
CODE_09A2BA:         ldw   (r0)         ;
CODE_09A2BB:         iwt   r0,#1978     ;
CODE_09A2BE:         add   r1           ;
CODE_09A2BF:         to r6              ;
CODE_09A2C0:         ldw   (r0)         ;
CODE_09A2C1:         getb               ;
CODE_09A2C2:         inc   r14          ;
CODE_09A2C3:         swap               ;
CODE_09A2C4:         dec   r2           ;
CODE_09A2C5:         bmi CODE_09A2CA    ;
CODE_09A2C7:         inc   r2           ;
CODE_09A2C8:         not                ;
CODE_09A2C9:         inc   r0           ;
CODE_09A2CA:         to r7              ;
CODE_09A2CB:         fmult              ;
CODE_09A2CC:         iwt   r0,#19D6     ;
CODE_09A2CF:         add   r1           ;
CODE_09A2D0:         to r6              ;
CODE_09A2D1:         ldw   (r0)         ;
CODE_09A2D2:         getb               ;
CODE_09A2D3:         inc   r14          ;
CODE_09A2D4:         swap               ;
CODE_09A2D5:         to r8              ;
CODE_09A2D6:         fmult              ;
CODE_09A2D7:         iwt   r10,#0008    ;
CODE_09A2DA:         ibt   r12,#0004    ;
CODE_09A2DC:         move  r13,r15      ;
CODE_09A2DE:         getbs              ;
CODE_09A2E0:         inc   r14          ;
CODE_09A2E1:         dec   r2           ;
CODE_09A2E2:         bmi CODE_09A2E8    ;
CODE_09A2E4:         inc   r2           ;
CODE_09A2E5:         not                ;
CODE_09A2E6:         sub   #0F          ;
CODE_09A2E8:         add   r7           ;
CODE_09A2E9:         add   r3           ;
CODE_09A2EA:         stw   (r11)        ;
CODE_09A2EB:         inc   r11          ;
CODE_09A2EC:         inc   r11          ;
CODE_09A2ED:         getbs              ;
CODE_09A2EF:         inc   r14          ;
CODE_09A2F0:         add   r8           ;
CODE_09A2F1:         add   r4           ;
CODE_09A2F2:         stw   (r11)        ;
CODE_09A2F3:         inc   r11          ;
CODE_09A2F4:         inc   r11          ;
CODE_09A2F5:         to r6              ;
CODE_09A2F6:         ldw   (r10)        ;
CODE_09A2F7:         inc   r10          ;
CODE_09A2F8:         inc   r10          ;
CODE_09A2F9:         iwt   r0,#FE00     ;
CODE_09A2FC:         dec   r2           ;
CODE_09A2FD:         bmi CODE_09A303    ;
CODE_09A2FF:         inc   r2           ;
CODE_09A300:         iwt   r0,#BE00     ;
CODE_09A303:         or    r6           ;
CODE_09A304:         stw   (r11)        ;
CODE_09A305:         inc   r11          ;
CODE_09A306:         inc   r11          ;
CODE_09A307:         ibt   r0,#0002     ;
CODE_09A309:         stw   (r11)        ;
CODE_09A30A:         inc   r11          ;
CODE_09A30B:         loop               ;
CODE_09A30C:         inc   r11          ;
CODE_09A30D:         iwt   r10,#0008    ;
CODE_09A310:         ibt   r12,#0004    ;
CODE_09A312:         move  r13,r15      ;
CODE_09A314:         getbs              ;
CODE_09A316:         inc   r14          ;
CODE_09A317:         dec   r2           ;
CODE_09A318:         bmi CODE_09A31E    ;
CODE_09A31A:         inc   r2           ;
CODE_09A31B:         not                ;
CODE_09A31C:         sub   #0F          ;
CODE_09A31E:         add   r7           ;
CODE_09A31F:         add   r3           ;
CODE_09A320:         stw   (r11)        ;
CODE_09A321:         inc   r11          ;
CODE_09A322:         inc   r11          ;
CODE_09A323:         getbs              ;
CODE_09A325:         inc   r14          ;
CODE_09A326:         add   r8           ;
CODE_09A327:         add   r4           ;
CODE_09A328:         stw   (r11)        ;
CODE_09A329:         inc   r11          ;
CODE_09A32A:         inc   r11          ;
CODE_09A32B:         to r6              ;
CODE_09A32C:         ldw   (r10)        ;
CODE_09A32D:         inc   r10          ;
CODE_09A32E:         inc   r10          ;
CODE_09A32F:         iwt   r0,#3C00     ;
CODE_09A332:         dec   r2           ;
CODE_09A333:         bmi CODE_09A339    ;
CODE_09A335:         inc   r2           ;
CODE_09A336:         iwt   r0,#7C00     ;
CODE_09A339:         or    r6           ;
CODE_09A33A:         stw   (r11)        ;
CODE_09A33B:         inc   r11          ;
CODE_09A33C:         inc   r11          ;
CODE_09A33D:         ibt   r0,#0002     ;
CODE_09A33F:         stw   (r11)        ;
CODE_09A340:         inc   r11          ;
CODE_09A341:         loop               ;
CODE_09A342:         inc   r11          ;
CODE_09A343:         cache              ;
CODE_09A344:         iwt   r0,#1978     ;
CODE_09A347:         add   r1           ;
CODE_09A348:         to r6              ;
CODE_09A349:         ldw   (r0)         ;
CODE_09A34A:         getb               ;
CODE_09A34B:         inc   r14          ;
CODE_09A34C:         swap               ;
CODE_09A34D:         dec   r2           ;
CODE_09A34E:         bmi CODE_09A353    ;
CODE_09A350:         inc   r2           ;
CODE_09A351:         not                ;
CODE_09A352:         inc   r0           ;
CODE_09A353:         fmult              ;
CODE_09A354:         sub   #08          ;
CODE_09A356:         add   r3           ;
CODE_09A357:         stw   (r11)        ;
CODE_09A358:         inc   r11          ;
CODE_09A359:         inc   r11          ;
CODE_09A35A:         iwt   r0,#19D6     ;
CODE_09A35D:         add   r1           ;
CODE_09A35E:         to r6              ;
CODE_09A35F:         ldw   (r0)         ;
CODE_09A360:         getb               ;
CODE_09A361:         inc   r14          ;
CODE_09A362:         swap               ;
CODE_09A363:         fmult              ;
CODE_09A364:         sub   #0F          ;
CODE_09A366:         add   r4           ;
CODE_09A367:         stw   (r11)        ;
CODE_09A368:         inc   r11          ;
CODE_09A369:         inc   r11          ;
CODE_09A36A:         lms   r6,(0010)    ;
CODE_09A36D:         iwt   r0,#3C00     ;
CODE_09A370:         dec   r2           ;
CODE_09A371:         bmi CODE_09A377    ;
CODE_09A373:         inc   r2           ;
CODE_09A374:         iwt   r0,#7C00     ;
CODE_09A377:         or    r6           ;
CODE_09A378:         stw   (r11)        ;
CODE_09A379:         inc   r11          ;
CODE_09A37A:         inc   r11          ;
CODE_09A37B:         ibt   r0,#0002     ;
CODE_09A37D:         stw   (r11)        ;
CODE_09A37E:         inc   r11          ;
CODE_09A37F:         inc   r11          ;
CODE_09A380:         iwt   r0,#1978     ;
CODE_09A383:         add   r1           ;
CODE_09A384:         to r6              ;
CODE_09A385:         ldw   (r0)         ;
CODE_09A386:         getb               ;
CODE_09A387:         inc   r14          ;
CODE_09A388:         swap               ;
CODE_09A389:         dec   r2           ;
CODE_09A38A:         bmi CODE_09A38F    ;
CODE_09A38C:         inc   r2           ;
CODE_09A38D:         not                ;
CODE_09A38E:         inc   r0           ;
CODE_09A38F:         fmult              ;
CODE_09A390:         sub   #08          ;
CODE_09A392:         add   r3           ;
CODE_09A393:         stw   (r11)        ;
CODE_09A394:         inc   r11          ;
CODE_09A395:         inc   r11          ;
CODE_09A396:         iwt   r0,#19D6     ;
CODE_09A399:         add   r1           ;
CODE_09A39A:         to r6              ;
CODE_09A39B:         ldw   (r0)         ;
CODE_09A39C:         getb               ;
CODE_09A39D:         inc   r14          ;
CODE_09A39E:         swap               ;
CODE_09A39F:         fmult              ;
CODE_09A3A0:         sub   #0F          ;
CODE_09A3A2:         add   r4           ;
CODE_09A3A3:         stw   (r11)        ;
CODE_09A3A4:         inc   r11          ;
CODE_09A3A5:         inc   r11          ;
CODE_09A3A6:         lms   r6,(0010)    ;
CODE_09A3A9:         iwt   r0,#3C00     ;
CODE_09A3AC:         dec   r2           ;
CODE_09A3AD:         bmi CODE_09A3B3    ;
CODE_09A3AF:         inc   r2           ;
CODE_09A3B0:         iwt   r0,#7C00     ;
CODE_09A3B3:         or    r6           ;
CODE_09A3B4:         stw   (r11)        ;
CODE_09A3B5:         inc   r11          ;
CODE_09A3B6:         inc   r11          ;
CODE_09A3B7:         ibt   r0,#0002     ;
CODE_09A3B9:         stw   (r11)        ;
CODE_09A3BA:         inc   r11          ;
CODE_09A3BB:         inc   r11          ;
CODE_09A3BC:         iwt   r0,#1978     ;
CODE_09A3BF:         add   r1           ;
CODE_09A3C0:         to r6              ;
CODE_09A3C1:         ldw   (r0)         ;
CODE_09A3C2:         getb               ;
CODE_09A3C3:         inc   r14          ;
CODE_09A3C4:         swap               ;
CODE_09A3C5:         dec   r2           ;
CODE_09A3C6:         bmi CODE_09A3CB    ;
CODE_09A3C8:         inc   r2           ;
CODE_09A3C9:         not                ;
CODE_09A3CA:         inc   r0           ;
CODE_09A3CB:         fmult              ;
CODE_09A3CC:         sub   #08          ;
CODE_09A3CE:         add   r3           ;
CODE_09A3CF:         stw   (r11)        ;
CODE_09A3D0:         inc   r11          ;
CODE_09A3D1:         inc   r11          ;
CODE_09A3D2:         iwt   r0,#19D6     ;
CODE_09A3D5:         add   r1           ;
CODE_09A3D6:         to r6              ;
CODE_09A3D7:         ldw   (r0)         ;
CODE_09A3D8:         getb               ;
CODE_09A3D9:         inc   r14          ;
CODE_09A3DA:         swap               ;
CODE_09A3DB:         fmult              ;
CODE_09A3DC:         sub   #0F          ;
CODE_09A3DE:         add   r4           ;
CODE_09A3DF:         stw   (r11)        ;
CODE_09A3E0:         inc   r11          ;
CODE_09A3E1:         inc   r11          ;
CODE_09A3E2:         lms   r6,(0012)    ;
CODE_09A3E5:         iwt   r0,#1C00     ;
CODE_09A3E8:         dec   r2           ;
CODE_09A3E9:         bmi CODE_09A3EF    ;
CODE_09A3EB:         inc   r2           ;
CODE_09A3EC:         iwt   r0,#5C00     ;
CODE_09A3EF:         or    r6           ;
CODE_09A3F0:         stw   (r11)        ;
CODE_09A3F1:         inc   r11          ;
CODE_09A3F2:         inc   r11          ;
CODE_09A3F3:         ibt   r0,#0002     ;
CODE_09A3F5:         stw   (r11)        ;
CODE_09A3F6:         inc   r11          ;
CODE_09A3F7:         inc   r11          ;
CODE_09A3F8:         iwt   r0,#1978     ;
CODE_09A3FB:         add   r1           ;
CODE_09A3FC:         to r6              ;
CODE_09A3FD:         ldw   (r0)         ;
CODE_09A3FE:         getb               ;
CODE_09A3FF:         inc   r14          ;
CODE_09A400:         swap               ;
CODE_09A401:         dec   r2           ;
CODE_09A402:         bmi CODE_09A407    ;
CODE_09A404:         inc   r2           ;
CODE_09A405:         not                ;
CODE_09A406:         inc   r0           ;
CODE_09A407:         to r7              ;
CODE_09A408:         fmult              ;
CODE_09A409:         iwt   r0,#19D6     ;
CODE_09A40C:         add   r1           ;
CODE_09A40D:         to r6              ;
CODE_09A40E:         ldw   (r0)         ;
CODE_09A40F:         getb               ;
CODE_09A410:         inc   r14          ;
CODE_09A411:         swap               ;
CODE_09A412:         to r8              ;
CODE_09A413:         fmult              ;
CODE_09A414:         iwt   r10,#0014    ;
CODE_09A417:         ibt   r12,#0004    ;
CODE_09A419:         move  r13,r15      ;
CODE_09A41B:         getbs              ;
CODE_09A41D:         inc   r14          ;
CODE_09A41E:         dec   r2           ;
CODE_09A41F:         bmi CODE_09A425    ;
CODE_09A421:         inc   r2           ;
CODE_09A422:         not                ;
CODE_09A423:         sub   #0F          ;
CODE_09A425:         add   r7           ;
CODE_09A426:         add   r3           ;
CODE_09A427:         stw   (r11)        ;
CODE_09A428:         inc   r11          ;
CODE_09A429:         inc   r11          ;
CODE_09A42A:         getbs              ;
CODE_09A42C:         inc   r14          ;
CODE_09A42D:         add   r8           ;
CODE_09A42E:         add   r4           ;
CODE_09A42F:         stw   (r11)        ;
CODE_09A430:         inc   r11          ;
CODE_09A431:         inc   r11          ;
CODE_09A432:         to r6              ;
CODE_09A433:         ldw   (r10)        ;
CODE_09A434:         inc   r10          ;
CODE_09A435:         inc   r10          ;
CODE_09A436:         iwt   r0,#2C00     ;
CODE_09A439:         dec   r2           ;
CODE_09A43A:         bmi CODE_09A440    ;
CODE_09A43C:         inc   r2           ;
CODE_09A43D:         iwt   r0,#6C00     ;
CODE_09A440:         or    r6           ;
CODE_09A441:         stw   (r11)        ;
CODE_09A442:         inc   r11          ;
CODE_09A443:         inc   r11          ;
CODE_09A444:         ibt   r0,#0002     ;
CODE_09A446:         stw   (r11)        ;
CODE_09A447:         inc   r11          ;
CODE_09A448:         loop               ;
CODE_09A449:         inc   r11          ;
CODE_09A44A:         iwt   r0,#1978     ;
CODE_09A44D:         add   r1           ;
CODE_09A44E:         to r6              ;
CODE_09A44F:         ldw   (r0)         ;
CODE_09A450:         getb               ;
CODE_09A451:         inc   r14          ;
CODE_09A452:         swap               ;
CODE_09A453:         dec   r2           ;
CODE_09A454:         bmi CODE_09A459    ;
CODE_09A456:         inc   r2           ;
CODE_09A457:         not                ;
CODE_09A458:         inc   r0           ;
CODE_09A459:         to r7              ;
CODE_09A45A:         fmult              ;
CODE_09A45B:         iwt   r0,#19D6     ;
CODE_09A45E:         add   r1           ;
CODE_09A45F:         to r6              ;
CODE_09A460:         ldw   (r0)         ;
CODE_09A461:         getb               ;
CODE_09A462:         inc   r14          ;
CODE_09A463:         swap               ;
CODE_09A464:         to r8              ;
CODE_09A465:         fmult              ;
CODE_09A466:         iwt   r9,#4000     ;
CODE_09A469:         iwt   r10,#001C    ;
CODE_09A46C:         ibt   r12,#0004    ;
CODE_09A46E:         move  r13,r15      ;
CODE_09A470:         getbs              ;
CODE_09A472:         inc   r14          ;
CODE_09A473:         dec   r2           ;
CODE_09A474:         bmi CODE_09A47A    ;
CODE_09A476:         inc   r2           ;
CODE_09A477:         not                ;
CODE_09A478:         sub   #0F          ;
CODE_09A47A:         add   r7           ;
CODE_09A47B:         add   r3           ;
CODE_09A47C:         stw   (r11)        ;
CODE_09A47D:         inc   r11          ;
CODE_09A47E:         inc   r11          ;
CODE_09A47F:         getbs              ;
CODE_09A481:         inc   r14          ;
CODE_09A482:         add   r8           ;
CODE_09A483:         add   r4           ;
CODE_09A484:         stw   (r11)        ;
CODE_09A485:         inc   r11          ;
CODE_09A486:         inc   r11          ;
CODE_09A487:         to r6              ;
CODE_09A488:         ldw   (r10)        ;
CODE_09A489:         inc   r10          ;
CODE_09A48A:         inc   r10          ;
CODE_09A48B:         getb               ;
CODE_09A48C:         inc   r14          ;
CODE_09A48D:         swap               ;
CODE_09A48E:         dec   r2           ;
CODE_09A48F:         bmi CODE_09A494    ;
CODE_09A491:         inc   r2           ;
CODE_09A492:         xor   r9           ;
CODE_09A494:         or    r6           ;
CODE_09A495:         stw   (r11)        ;
CODE_09A496:         inc   r11          ;
CODE_09A497:         inc   r11          ;
CODE_09A498:         ibt   r0,#0002     ;
CODE_09A49A:         stw   (r11)        ;
CODE_09A49B:         inc   r11          ;
CODE_09A49C:         loop               ;
CODE_09A49D:         inc   r11          ;
CODE_09A49E:         sms   (0092),r11   ;
CODE_09A4A1:         cache              ;
CODE_09A4A2:         iwt   r1,#1003     ;
CODE_09A4A5:         iwt   r2,#3000     ;
CODE_09A4A8:         ibt   r3,#0004     ;
CODE_09A4AA:         iwt   r12,#0028    ;
CODE_09A4AD:         move  r13,r15      ;
CODE_09A4AF:         ldw   (r1)         ;
CODE_09A4B0:         or    r2           ;
CODE_09A4B1:         with r1            ;
CODE_09A4B2:         add   r3           ;
CODE_09A4B3:         loop               ;
CODE_09A4B4:         sbk                ;
CODE_09A4B5:         stop               ;
CODE_09A4B6:         nop                ;

DATA_09A4B7:         dw $F800, $9EFC, $002C, $FC00
DATA_09A4BF:         dw $6C9E, $F002, $C0E5, $022D
DATA_09A4C7:         dw $E500, $2DC2, $F002, $E0F5
DATA_09A4CF:         dw $022D, $F500, $2DE2, $F800
DATA_09A4D7:         dw $2EFD, $006C, $FD00, $2C2E
DATA_09A4DF:         dw $F002, $C0E5, $022D, $E500
DATA_09A4E7:         dw $2DC2, $F002, $E0F5, $022D
DATA_09A4EF:         dw $F500, $2DE2, $F800, $2F01
DATA_09A4F7:         dw $006C, $0100, $2C2F, $F002
DATA_09A4FF:         dw $C0E5, $022D, $E500, $2DC2
DATA_09A507:         dw $F002, $E0F5, $022D, $F500
DATA_09A50F:         dw $2DE2

CODE_09A511:         ibt   r0,#0009     ;
CODE_09A513:         romb               ;
CODE_09A515:         cache              ;
CODE_09A516:         lm    r1,(1972)    ;
CODE_09A51A:         iwt   r0,#1402     ;
CODE_09A51D:         add   r1           ;
CODE_09A51E:         to r6              ;
CODE_09A51F:         ldw   (r0)         ;
CODE_09A520:         ibt   r0,#001E     ;
CODE_09A522:         mult  r6           ;
CODE_09A523:         iwt   r2,#A4B7     ;
CODE_09A526:         to r14             ;
CODE_09A527:         add   r2           ;
CODE_09A528:         iwt   r0,#1680     ;
CODE_09A52B:         add   r1           ;
CODE_09A52C:         to r2              ;
CODE_09A52D:         ldw   (r0)         ;
CODE_09A52E:         iwt   r0,#1682     ;
CODE_09A531:         add   r1           ;
CODE_09A532:         to r3              ;
CODE_09A533:         ldw   (r0)         ;
CODE_09A534:         iwt   r0,#1400     ;
CODE_09A537:         add   r1           ;
CODE_09A538:         to r4              ;
CODE_09A539:         ldw   (r0)         ;
CODE_09A53A:         iwt   r5,#4000     ;
CODE_09A53D:         lms   r11,(0092)   ;
CODE_09A540:         ibt   r12,#0006    ;
CODE_09A542:         move  r13,r15      ;
CODE_09A544:         to r6              ;
CODE_09A545:         getb               ;
CODE_09A546:         inc   r14          ;
CODE_09A547:         getbs              ;
CODE_09A549:         inc   r14          ;
CODE_09A54A:         dec   r4           ;
CODE_09A54B:         bmi CODE_09A556    ;
CODE_09A54D:         inc   r4           ;
CODE_09A54E:         not                ;
CODE_09A54F:         inc   r0           ;
CODE_09A550:         dec   r6           ;
CODE_09A551:         bpl CODE_09A556    ;
CODE_09A553:         inc   r6           ;
CODE_09A554:         add   #08          ;
CODE_09A556:         add   r2           ;
CODE_09A557:         stw   (r11)        ;
CODE_09A558:         inc   r11          ;
CODE_09A559:         inc   r11          ;
CODE_09A55A:         getbs              ;
CODE_09A55C:         inc   r14          ;
CODE_09A55D:         add   r3           ;
CODE_09A55E:         stw   (r11)        ;
CODE_09A55F:         inc   r11          ;
CODE_09A560:         inc   r11          ;
CODE_09A561:         getb               ;
CODE_09A562:         inc   r14          ;
CODE_09A563:         getbh              ;
CODE_09A565:         inc   r14          ;
CODE_09A566:         dec   r4           ;
CODE_09A567:         bmi CODE_09A56C    ;
CODE_09A569:         inc   r4           ;
CODE_09A56A:         xor   r5           ;
CODE_09A56C:         stw   (r11)        ;
CODE_09A56D:         inc   r11          ;
CODE_09A56E:         inc   r11          ;
CODE_09A56F:         from r6            ;
CODE_09A570:         stw   (r11)        ;
CODE_09A571:         inc   r11          ;
CODE_09A572:         loop               ;
CODE_09A573:         inc   r11          ;
CODE_09A574:         iwt   r15,#A49E    ;
CODE_09A577:         nop                ;

CODE_09A578:         cache              ;
CODE_09A579:         ibt   r0,#0008     ;
CODE_09A57B:         romb               ;
CODE_09A57D:         iwt   r0,#00C0     ;
CODE_09A580:         add   r1           ;
CODE_09A581:         to r11             ;
CODE_09A582:         lob                ;
CODE_09A583:         iwt   r0,#AE18     ;
CODE_09A586:         to r14             ;
CODE_09A587:         add   r11          ;
CODE_09A588:         iwt   r3,#AE58     ;
CODE_09A58B:         getbs              ;
CODE_09A58D:         from r3            ;
CODE_09A58E:         to r14             ;
CODE_09A58F:         add   r11          ;
CODE_09A590:         add   r0           ;
CODE_09A591:         to r2              ;
CODE_09A592:         add   r0           ;
CODE_09A593:         iwt   r11,#AE18    ;
CODE_09A596:         getbs              ;
CODE_09A598:         from r11           ;
CODE_09A599:         to r14             ;
CODE_09A59A:         add   r1           ;
CODE_09A59B:         add   r0           ;
CODE_09A59C:         to r3              ;
CODE_09A59D:         add   r0           ;
CODE_09A59E:         iwt   r11,#AE58    ;
CODE_09A5A1:         getbs              ;
CODE_09A5A3:         from r11           ;
CODE_09A5A4:         to r14             ;
CODE_09A5A5:         add   r1           ;
CODE_09A5A6:         add   r0           ;
CODE_09A5A7:         add   r0           ;
CODE_09A5A8:         sms   (000C),r0    ;
CODE_09A5AB:         getbs              ;
CODE_09A5AD:         add   r0           ;
CODE_09A5AE:         add   r0           ;
CODE_09A5AF:         sms   (000E),r0    ;
CODE_09A5B2:         from r4            ;
CODE_09A5B3:         romb               ;
CODE_09A5B5:         from r7            ;
CODE_09A5B6:         umult r6           ;
CODE_09A5B8:         to r14             ;
CODE_09A5B9:         add   r5           ;
CODE_09A5BA:         lm    r1,(1972)    ;
CODE_09A5BE:         iwt   r0,#1400     ;
CODE_09A5C1:         add   r1           ;
CODE_09A5C2:         to r7              ;
CODE_09A5C3:         ldw   (r0)         ;
CODE_09A5C4:         lms   r11,(0092)   ;
CODE_09A5C7:         lms   r6,(0000)    ;
CODE_09A5CA:         from r8            ;
CODE_09A5CB:         fmult              ;
CODE_09A5CC:         lob                ;
CODE_09A5CD:         swap               ;
CODE_09A5CE:         move  r6,r2        ;
CODE_09A5D0:         to r9              ;
CODE_09A5D1:         fmult              ;
CODE_09A5D2:         dec   r7           ;
CODE_09A5D3:         bmi CODE_09A5D9    ;
CODE_09A5D5:         inc   r7           ;
CODE_09A5D6:         with r9            ;
CODE_09A5D7:         not                ;
CODE_09A5D8:         inc   r9           ;
CODE_09A5D9:         lms   r6,(0002)    ;
CODE_09A5DC:         from r8            ;
CODE_09A5DD:         fmult              ;
CODE_09A5DE:         lob                ;
CODE_09A5DF:         move  r5,r0        ;
CODE_09A5E1:         swap               ;
CODE_09A5E2:         move  r6,r3        ;
CODE_09A5E4:         fmult              ;
CODE_09A5E5:         to r10             ;
CODE_09A5E6:         sub   r5           ;
CODE_09A5E7:         lms   r2,(000C)    ;
CODE_09A5EA:         lms   r3,(000E)    ;
CODE_09A5ED:         getb               ;
CODE_09A5EE:         inc   r14          ;
CODE_09A5EF:         to r6              ;
CODE_09A5F0:         swap               ;
CODE_09A5F1:         move  r5,r6        ;
CODE_09A5F3:         lms   r8,(0004)    ;
CODE_09A5F6:         dec   r8           ;
CODE_09A5F7:         bmi CODE_09A601    ;
CODE_09A5F9:         inc   r8           ;
CODE_09A5FA:         lms   r0,(0000)    ;
CODE_09A5FD:         fmult              ;
CODE_09A5FE:         lob                ;
CODE_09A5FF:         to r6              ;
CODE_09A600:         swap               ;
CODE_09A601:         from r2            ;
CODE_09A602:         fmult              ;
CODE_09A603:         move  r4,r0        ;
CODE_09A605:         dec   r7           ;
CODE_09A606:         bmi CODE_09A60C    ;
CODE_09A608:         inc   r7           ;
CODE_09A609:         with r4            ;
CODE_09A60A:         not                ;
CODE_09A60B:         inc   r4           ;
CODE_09A60C:         move  r6,r5        ;
CODE_09A60E:         dec   r8           ;
CODE_09A60F:         bmi CODE_09A619    ;
CODE_09A611:         inc   r8           ;
CODE_09A612:         lms   r0,(0002)    ;
CODE_09A615:         fmult              ;
CODE_09A616:         lob                ;
CODE_09A617:         to r6              ;
CODE_09A618:         swap               ;
CODE_09A619:         from r3            ;
CODE_09A61A:         fmult              ;
CODE_09A61B:         move  r5,r0        ;
CODE_09A61D:         sms   (0006),r4    ;
CODE_09A620:         sms   (0008),r5    ;
CODE_09A623:         lms   r0,(0010)    ;
CODE_09A626:         add   r9           ;
CODE_09A627:         to r4              ;
CODE_09A628:         add   r4           ;
CODE_09A629:         lms   r0,(0012)    ;
CODE_09A62C:         add   r10          ;
CODE_09A62D:         to r5              ;
CODE_09A62E:         add   r5           ;
CODE_09A62F:         ibt   r12,#0004    ;
CODE_09A631:         from r15           ;
CODE_09A632:         add   #07          ;
CODE_09A634:         sms   (0060),r0    ;
CODE_09A637:         iwt   r15,#A769    ; sub
CODE_09A63A:         nop                ;

CODE_09A63B:         getb               ;
CODE_09A63C:         inc   r14          ;
CODE_09A63D:         to r6              ;
CODE_09A63E:         swap               ;
CODE_09A63F:         move  r5,r6        ;
CODE_09A641:         lms   r8,(0004)    ;
CODE_09A644:         dec   r8           ;
CODE_09A645:         bmi CODE_09A64F    ;
CODE_09A647:         inc   r8           ;
CODE_09A648:         lms   r0,(0000)    ;
CODE_09A64B:         fmult              ;
CODE_09A64C:         lob                ;
CODE_09A64D:         to r6              ;
CODE_09A64E:         swap               ;
CODE_09A64F:         from r2            ;
CODE_09A650:         fmult              ;
CODE_09A651:         move  r4,r0        ;
CODE_09A653:         dec   r7           ;
CODE_09A654:         bmi CODE_09A65A    ;
CODE_09A656:         inc   r7           ;
CODE_09A657:         with r4            ;
CODE_09A658:         not                ;
CODE_09A659:         inc   r4           ;
CODE_09A65A:         move  r6,r5        ;
CODE_09A65C:         dec   r8           ;
CODE_09A65D:         bmi CODE_09A667    ;
CODE_09A65F:         inc   r8           ;
CODE_09A660:         lms   r0,(0002)    ;
CODE_09A663:         fmult              ;
CODE_09A664:         lob                ;
CODE_09A665:         to r6              ;
CODE_09A666:         swap               ;
CODE_09A667:         from r3            ;
CODE_09A668:         fmult              ;
CODE_09A669:         move  r5,r0        ;
CODE_09A66B:         sms   (000A),r4    ;
CODE_09A66E:         sms   (000C),r5    ;
CODE_09A671:         lms   r0,(0010)    ;
CODE_09A674:         add   r9           ;
CODE_09A675:         to r4              ;
CODE_09A676:         add   r4           ;
CODE_09A677:         lms   r0,(0012)    ;
CODE_09A67A:         add   r10          ;
CODE_09A67B:         to r5              ;
CODE_09A67C:         add   r5           ;
CODE_09A67D:         ibt   r12,#0004    ;
CODE_09A67F:         from r15           ;
CODE_09A680:         add   #07          ;
CODE_09A682:         sms   (0060),r0    ;
CODE_09A685:         iwt   r15,#A769    ; sub
CODE_09A688:         nop                ;

CODE_09A689:         with r9            ;
CODE_09A68A:         not                ;
CODE_09A68B:         inc   r9           ;
CODE_09A68C:         lms   r0,(0006)    ;
CODE_09A68F:         to r4              ;
CODE_09A690:         not                ;
CODE_09A691:         inc   r4           ;
CODE_09A692:         lms   r5,(0008)    ;
CODE_09A695:         lms   r0,(0010)    ;
CODE_09A698:         add   r9           ;
CODE_09A699:         to r4              ;
CODE_09A69A:         add   r4           ;
CODE_09A69B:         lms   r0,(0012)    ;
CODE_09A69E:         add   r10          ;
CODE_09A69F:         to r5              ;
CODE_09A6A0:         add   r5           ;
CODE_09A6A1:         ibt   r12,#0004    ;
CODE_09A6A3:         from r15           ;
CODE_09A6A4:         add   #07          ; return after
CODE_09A6A6:         sms   (0060),r0    ; makes this a sub
CODE_09A6A9:         iwt   r15,#A769    ;
CODE_09A6AC:         nop                ;

CODE_09A6AD:         lms   r0,(000A)    ;
CODE_09A6B0:         to r4              ;
CODE_09A6B1:         not                ;
CODE_09A6B2:         inc   r4           ;
CODE_09A6B3:         lms   r5,(000C)    ;
CODE_09A6B6:         lms   r0,(0010)    ;
CODE_09A6B9:         add   r9           ;
CODE_09A6BA:         to r4              ;
CODE_09A6BB:         add   r4           ;
CODE_09A6BC:         lms   r0,(0012)    ;
CODE_09A6BF:         add   r10          ;
CODE_09A6C0:         to r5              ;
CODE_09A6C1:         add   r5           ;
CODE_09A6C2:         ibt   r12,#0004    ;
CODE_09A6C4:         from r15           ;
CODE_09A6C5:         add   #07          ;
CODE_09A6C7:         sms   (0060),r0    ;
CODE_09A6CA:         iwt   r15,#A769    ; sub
CODE_09A6CD:         nop                ;

CODE_09A6CE:         iwt   r0,#1402     ;
CODE_09A6D1:         add   r1           ;
CODE_09A6D2:         ldw   (r0)         ;
CODE_09A6D3:         sub   #09          ;
CODE_09A6D5:         bcs CODE_09A737    ;
CODE_09A6D7:         nop                ;
CODE_09A6D8:         getb               ;
CODE_09A6D9:         inc   r14          ;
CODE_09A6DA:         swap               ;
CODE_09A6DB:         lms   r6,(0000)    ;
CODE_09A6DE:         to r9              ;
CODE_09A6DF:         fmult              ;
CODE_09A6E0:         dec   r7           ;
CODE_09A6E1:         bmi CODE_09A6E7    ;
CODE_09A6E3:         inc   r7           ;
CODE_09A6E4:         with r9            ;
CODE_09A6E5:         not                ;
CODE_09A6E6:         inc   r9           ;
CODE_09A6E7:         getb               ;
CODE_09A6E8:         inc   r14          ;
CODE_09A6E9:         swap               ;
CODE_09A6EA:         lms   r6,(0002)    ;
CODE_09A6ED:         to r10             ;
CODE_09A6EE:         fmult              ;
CODE_09A6EF:         lms   r0,(0010)    ;
CODE_09A6F2:         to r4              ;
CODE_09A6F3:         add   r9           ;
CODE_09A6F4:         lms   r0,(0012)    ;
CODE_09A6F7:         to r5              ;
CODE_09A6F8:         add   r10          ;
CODE_09A6F9:         ibt   r12,#0008    ;
CODE_09A6FB:         from r15           ;
CODE_09A6FC:         add   #07          ;
CODE_09A6FE:         sms   (0060),r0    ;
CODE_09A701:         iwt   r15,#A769    ; sub
CODE_09A704:         nop                ;

CODE_09A705:         getb               ;
CODE_09A706:         inc   r14          ;
CODE_09A707:         swap               ;
CODE_09A708:         lms   r6,(0000)    ;
CODE_09A70B:         to r9              ;
CODE_09A70C:         fmult              ;
CODE_09A70D:         dec   r7           ;
CODE_09A70E:         bmi CODE_09A714    ;
CODE_09A710:         inc   r7           ;
CODE_09A711:         with r9            ;
CODE_09A712:         not                ;
CODE_09A713:         inc   r9           ;
CODE_09A714:         getb               ;
CODE_09A715:         inc   r14          ;
CODE_09A716:         swap               ;
CODE_09A717:         lms   r6,(0002)    ;
CODE_09A71A:         to r10             ;
CODE_09A71B:         fmult              ;
CODE_09A71C:         lms   r0,(0010)    ;
CODE_09A71F:         to r4              ;
CODE_09A720:         add   r9           ;
CODE_09A721:         lms   r0,(0012)    ;
CODE_09A724:         to r5              ;
CODE_09A725:         add   r10          ;
CODE_09A726:         ibt   r12,#0004    ;
CODE_09A728:         from r15           ;
CODE_09A729:         add   #07          ;
CODE_09A72B:         sms   (0060),r0    ;
CODE_09A72E:         iwt   r15,#A769    ; sub
CODE_09A731:         nop                ;

CODE_09A732:         sms   (0092),r11   ; update OAM pointer
CODE_09A735:         stop               ;
CODE_09A736:         nop                ;

CODE_09A737:         getb               ;
CODE_09A738:         inc   r14          ;
CODE_09A739:         swap               ;
CODE_09A73A:         lms   r6,(0000)    ;
CODE_09A73D:         to r9              ;
CODE_09A73E:         fmult              ;
CODE_09A73F:         dec   r7           ;
CODE_09A740:         bmi CODE_09A746    ;
CODE_09A742:         inc   r7           ;
CODE_09A743:         with r9            ;
CODE_09A744:         not                ;
CODE_09A745:         inc   r9           ;
CODE_09A746:         getb               ;
CODE_09A747:         inc   r14          ;
CODE_09A748:         swap               ;
CODE_09A749:         lms   r6,(0002)    ;
CODE_09A74C:         to r10             ;
CODE_09A74D:         fmult              ;
CODE_09A74E:         lms   r0,(0010)    ;
CODE_09A751:         to r4              ;
CODE_09A752:         add   r9           ;
CODE_09A753:         lms   r0,(0012)    ;
CODE_09A756:         to r5              ;
CODE_09A757:         add   r10          ;
CODE_09A758:         ibt   r12,#0010    ;
CODE_09A75A:         from r15           ;
CODE_09A75B:         add   #07          ;
CODE_09A75D:         sms   (0060),r0    ;
CODE_09A760:         iwt   r15,#A769    ; sub
CODE_09A763:         nop                ;

CODE_09A764:         sms   (0092),r11   ;
CODE_09A767:         stop               ;
CODE_09A768:         nop                ;

; OAM sub
CODE_09A769:         cache              ;
CODE_09A76A:         move  r13,r15      ;
CODE_09A76C:         to r6              ;
CODE_09A76D:         getb               ; size first in ROM
CODE_09A76E:         inc   r14          ;
CODE_09A76F:         ibt   r8,#0007     ;
CODE_09A771:         from r6            ;
CODE_09A772:         and   #02          ;
CODE_09A774:         beq CODE_09A779    ;
CODE_09A776:         nop                ;
CODE_09A777:         ibt   r8,#000F     ;
CODE_09A779:         getbs              ;
CODE_09A77B:         inc   r14          ;
CODE_09A77C:         dec   r7           ;
CODE_09A77D:         bmi CODE_09A782    ;
CODE_09A77F:         inc   r7           ;
CODE_09A780:         not                ;
CODE_09A781:         sub   r8           ;
CODE_09A782:         add   r4           ;
CODE_09A783:         stw   (r11)        ; X
CODE_09A784:         inc   r11          ;
CODE_09A785:         inc   r11          ;
CODE_09A786:         getbs              ;
CODE_09A788:         inc   r14          ;
CODE_09A789:         add   r5           ;
CODE_09A78A:         stw   (r11)        ; Y
CODE_09A78B:         inc   r11          ;
CODE_09A78C:         inc   r11          ;
CODE_09A78D:         getb               ;
CODE_09A78E:         inc   r14          ;
CODE_09A78F:         iwt   r8,#4000     ;
CODE_09A792:         getbh              ;
CODE_09A794:         inc   r14          ;
CODE_09A795:         dec   r7           ;
CODE_09A796:         bmi CODE_09A79B    ;
CODE_09A798:         inc   r7           ;
CODE_09A799:         xor   r8           ;
CODE_09A79B:         stw   (r11)        ; tile
CODE_09A79C:         inc   r11          ;
CODE_09A79D:         inc   r11          ;
CODE_09A79E:         from r6            ;
CODE_09A79F:         stw   (r11)        ; size last in buffer
CODE_09A7A0:         inc   r11          ;
CODE_09A7A1:         loop               ;
CODE_09A7A2:         inc   r11          ;
CODE_09A7A3:         lms   r15,(0060)   ;
CODE_09A7A6:         nop                ;

CODE_09A7A7:         romb               ;
CODE_09A7A9:         lm    r2,(1972)    ;
CODE_09A7AD:         iwt   r0,#1040     ;
CODE_09A7B0:         add   r2           ;
CODE_09A7B1:         ldw   (r0)         ;
CODE_09A7B2:         hib                ;
CODE_09A7B3:         lsr                ;
CODE_09A7B4:         lsr                ;
CODE_09A7B5:         to r12             ;
CODE_09A7B6:         lsr                ;
CODE_09A7B7:         iwt   r0,#1402     ;
CODE_09A7BA:         add   r2           ;
CODE_09A7BB:         ldw   (r0)         ;
CODE_09A7BC:         mult  r12          ;
CODE_09A7BD:         mult  #05          ;
CODE_09A7BF:         to r14             ;
CODE_09A7C0:         add   r1           ;
CODE_09A7C1:         iwt   r0,#1400     ;
CODE_09A7C4:         add   r2           ;
CODE_09A7C5:         to r3              ;
CODE_09A7C6:         ldw   (r0)         ;
CODE_09A7C7:         from r3            ;
CODE_09A7C8:         lsr                ;
CODE_09A7C9:         lsr                ;
CODE_09A7CA:         ror                ;
CODE_09A7CB:         to r4              ;
CODE_09A7CC:         lsr                ;
CODE_09A7CD:         iwt   r0,#1042     ;
CODE_09A7D0:         add   r2           ;
CODE_09A7D1:         ldw   (r0)         ;
CODE_09A7D2:         swap               ;
CODE_09A7D3:         to r4              ;
CODE_09A7D4:         xor   r4           ;
CODE_09A7D6:         iwt   r0,#1680     ;
CODE_09A7D9:         add   r2           ;
CODE_09A7DA:         to r5              ;
CODE_09A7DB:         ldw   (r0)         ;
CODE_09A7DC:         iwt   r0,#1682     ;
CODE_09A7DF:         add   r2           ;
CODE_09A7E0:         to r6              ;
CODE_09A7E1:         ldw   (r0)         ;
CODE_09A7E2:         iwt   r0,#1362     ;
CODE_09A7E5:         add   r2           ;
CODE_09A7E6:         to r7              ;
CODE_09A7E7:         ldw   (r0)         ;
CODE_09A7E8:         from r4            ;
CODE_09A7E9:         add   r4           ;
CODE_09A7EA:         rol                ;
CODE_09A7EB:         and   #01          ;
CODE_09A7ED:         to r8              ;
CODE_09A7EE:         add   r0           ;
CODE_09A7EF:         cache              ;
CODE_09A7F0:         move  r13,r15      ;
CODE_09A7F2:         to r1              ;
CODE_09A7F3:         getb               ;
CODE_09A7F4:         inc   r14          ;
CODE_09A7F5:         getbs              ;
CODE_09A7F7:         inc   r14          ;
CODE_09A7F8:         dec   r3           ;
CODE_09A7F9:         bmi CODE_09A804    ;
CODE_09A7FB:         inc   r3           ;
CODE_09A7FC:         not                ;
CODE_09A7FD:         inc   r0           ;
CODE_09A7FE:         dec   r1           ;
CODE_09A7FF:         bpl CODE_09A804    ;
CODE_09A801:         inc   r1           ;
CODE_09A802:         add   #08          ;
CODE_09A804:         add   r5           ;
CODE_09A805:         stw   (r7)         ;
CODE_09A806:         inc   r7           ;
CODE_09A807:         inc   r7           ;
CODE_09A808:         getbs              ;
CODE_09A80A:         inc   r14          ;
CODE_09A80B:         dec   r8           ;
CODE_09A80C:         bmi CODE_09A817    ;
CODE_09A80E:         inc   r8           ;
CODE_09A80F:         not                ;
CODE_09A810:         inc   r0           ;
CODE_09A811:         dec   r1           ;
CODE_09A812:         bpl CODE_09A817    ;
CODE_09A814:         inc   r1           ;
CODE_09A815:         add   #08          ;
CODE_09A817:         add   r6           ;
CODE_09A818:         stw   (r7)         ;
CODE_09A819:         inc   r7           ;
CODE_09A81A:         inc   r7           ;
CODE_09A81B:         getb               ;
CODE_09A81C:         inc   r14          ;
CODE_09A81D:         getbh              ;
CODE_09A81F:         inc   r14          ;
CODE_09A820:         xor   r4           ;
CODE_09A822:         stw   (r7)         ;
CODE_09A823:         inc   r7           ;
CODE_09A824:         inc   r7           ;
CODE_09A825:         from r1            ;
CODE_09A826:         stw   (r7)         ;
CODE_09A827:         inc   r7           ;
CODE_09A828:         loop               ;
CODE_09A829:         inc   r7           ;
CODE_09A82A:         stop               ;
CODE_09A82B:         nop                ;

CODE_09A82C:         sms   (0002),r1    ;
CODE_09A82F:         sms   (0004),r2    ;
CODE_09A832:         iwt   r3,#3A02     ;
CODE_09A835:         iwt   r4,#0009     ;
CODE_09A838:         from r4            ;
CODE_09A839:         romb               ;
CODE_09A83B:         iwt   r4,#00D2     ;
CODE_09A83E:         iwt   r5,#AADA     ;
CODE_09A841:         sub   #00          ;
CODE_09A843:         beq CODE_09A84A    ;
CODE_09A845:         nop                ;
CODE_09A846:         iwt   r15,#A974    ;
CODE_09A849:         nop                ;
CODE_09A84A:         cache              ;
CODE_09A84B:         ibt   r0,#0010     ;
CODE_09A84D:         from r2            ;
CODE_09A84E:         to r12             ;
CODE_09A84F:         sub   r0           ;
CODE_09A850:         bpl CODE_09A8AB    ;
CODE_09A852:         nop                ;
CODE_09A853:         ibt   r2,#0000     ;
CODE_09A855:         from r12           ;
CODE_09A856:         to r6              ;
CODE_09A857:         not                ;
CODE_09A858:         inc   r6           ;
CODE_09A859:         ibt   r0,#0020     ;
CODE_09A85B:         from r6            ;
CODE_09A85C:         sub   r0           ;
CODE_09A85D:         bpl CODE_09A893    ;
CODE_09A85F:         nop                ;
CODE_09A860:         from r6            ;
CODE_09A861:         add   r6           ;
CODE_09A862:         add   r0           ;
CODE_09A863:         add   r0           ;
CODE_09A864:         to r6              ;
CODE_09A865:         add   r0           ;
CODE_09A866:         iwt   r0,#0050     ;
CODE_09A869:         from r6            ;
CODE_09A86A:         sub   r0           ;
CODE_09A86B:         bmi CODE_09A8D5    ;
CODE_09A86D:         nop                ;
CODE_09A86E:         from r12           ;
CODE_09A86F:         not                ;
CODE_09A870:         inc   r0           ;
CODE_09A871:         iwt   r9,#0006     ;
CODE_09A874:         sub   r9           ;
CODE_09A875:         from r1            ;
CODE_09A876:         sub   r0           ;
CODE_09A877:         to r10             ;
CODE_09A878:         sub   #0B          ;
CODE_09A87A:         iwt   r0,#01B0     ;
CODE_09A87D:         from r6            ;
CODE_09A87E:         sub   r0           ;
CODE_09A87F:         bmi CODE_09A8D5    ;
CODE_09A881:         nop                ;
CODE_09A882:         from r12           ;
CODE_09A883:         not                ;
CODE_09A884:         inc   r0           ;
CODE_09A885:         iwt   r9,#001B     ;
CODE_09A888:         sub   r9           ;
CODE_09A889:         add   r1           ;
CODE_09A88A:         to r5              ;
CODE_09A88B:         add   #0B          ;
CODE_09A88D:         move  r6,r10       ;
CODE_09A88F:         iwt   r15,#A937    ;
CODE_09A892:         nop                ;
CODE_09A893:         ibt   r0,#0005     ;
CODE_09A895:         from r6            ;
CODE_09A896:         sub   r0           ;
CODE_09A897:         from r1            ;
CODE_09A898:         sub   r0           ;
CODE_09A899:         to r8              ;
CODE_09A89A:         sub   #0B          ;
CODE_09A89C:         ibt   r0,#001B     ;
CODE_09A89E:         from r6            ;
CODE_09A89F:         sub   r0           ;
CODE_09A8A0:         from r1            ;
CODE_09A8A1:         sub   r0           ;
CODE_09A8A2:         to r5              ;
CODE_09A8A3:         add   #0B          ;
CODE_09A8A5:         move  r6,r8        ;
CODE_09A8A7:         iwt   r15,#A937    ;
CODE_09A8AA:         nop                ;
CODE_09A8AB:         beq CODE_09A8C6    ;
CODE_09A8AD:         nop                ;
CODE_09A8AE:         ibt   r11,#0000    ;
CODE_09A8B0:         iwt   r0,#00FF     ;
CODE_09A8B3:         move  r13,r15      ;
CODE_09A8B5:         from r11           ;
CODE_09A8B6:         cmp   r4           ;
CODE_09A8B8:         bmi CODE_09A8BF    ;
CODE_09A8BA:         nop                ;
CODE_09A8BB:         iwt   r15,#A970    ;
CODE_09A8BE:         nop                ;
CODE_09A8BF:         stw   (r3)         ;
CODE_09A8C0:         inc   r3           ;
CODE_09A8C1:         inc   r3           ;
CODE_09A8C2:         inc   r3           ;
CODE_09A8C3:         inc   r3           ;
CODE_09A8C4:         loop               ;
CODE_09A8C5:         inc   r11          ;
CODE_09A8C6:         ibt   r6,#0000     ;
CODE_09A8C8:         ibt   r0,#0010     ;
CODE_09A8CA:         with r2            ;
CODE_09A8CB:         sub   r0           ;
CODE_09A8CC:         from r2            ;
CODE_09A8CD:         sub   r4           ;
CODE_09A8CE:         bmi CODE_09A8D5    ;
CODE_09A8D0:         nop                ;
CODE_09A8D1:         iwt   r15,#A970    ;
CODE_09A8D4:         nop                ;
CODE_09A8D5:         from r5            ;
CODE_09A8D6:         to r14             ;
CODE_09A8D7:         add   r6           ;
CODE_09A8D8:         getb               ;
CODE_09A8D9:         lsr                ;
CODE_09A8DA:         lsr                ;
CODE_09A8DB:         lsr                ;
CODE_09A8DC:         to r9              ;
CODE_09A8DD:         lsr                ;
CODE_09A8DE:         iwt   r0,#0050     ;
CODE_09A8E1:         from r6            ;
CODE_09A8E2:         sub   r0           ;
CODE_09A8E3:         bmi CODE_09A8F1    ;
CODE_09A8E5:         nop                ;
CODE_09A8E6:         iwt   r0,#01B0     ;
CODE_09A8E9:         from r6            ;
CODE_09A8EA:         sub   r0           ;
CODE_09A8EB:         bpl CODE_09A92C    ;
CODE_09A8ED:         nop                ;
CODE_09A8EE:         bra CODE_09A8F4    ;

CODE_09A8F0:         dec   r10          ;

CODE_09A8F1:         from r1            ;
CODE_09A8F2:         to r10             ;
CODE_09A8F3:         sub   r9           ;
CODE_09A8F4:         bpl CODE_09A8FD    ;
CODE_09A8F6:         nop                ;
CODE_09A8F7:         iwt   r0,#FF00     ;
CODE_09A8FA:         bra CODE_09A908    ;

CODE_09A8FC:         nop                ;

CODE_09A8FD:         from r10           ;
CODE_09A8FE:         hib                ;
CODE_09A8FF:         beq CODE_09A908    ;
CODE_09A901:         from r10           ;
CODE_09A902:         iwt   r0,#00FF     ;
CODE_09A905:         bra CODE_09A920    ;

CODE_09A907:         nop                ;

CODE_09A908:         to r8              ;
CODE_09A909:         swap               ;
CODE_09A90A:         from r1            ;
CODE_09A90B:         to r7              ;
CODE_09A90C:         add   r9           ;
CODE_09A90D:         bpl CODE_09A916    ;
CODE_09A90F:         from r7            ;
CODE_09A910:         iwt   r0,#00FF     ;
CODE_09A913:         bra CODE_09A920    ;

CODE_09A915:         nop                ;

CODE_09A916:         hib                ;
CODE_09A917:         beq CODE_09A91D    ;
CODE_09A919:         nop                ;
CODE_09A91A:         iwt   r7,#00FF     ;
CODE_09A91D:         with r7            ;
CODE_09A91E:         swap               ;
CODE_09A91F:         merge              ;
CODE_09A920:         stw   (r3)         ;
CODE_09A921:         inc   r3           ;
CODE_09A922:         inc   r3           ;
CODE_09A923:         inc   r3           ;
CODE_09A924:         inc   r3           ;
CODE_09A925:         ibt   r0,#0010     ;
CODE_09A927:         to r6              ;
CODE_09A928:         add   r6           ;
CODE_09A929:         bra CODE_09A8CC    ;

CODE_09A92B:         inc   r2           ;

CODE_09A92C:         iwt   r0,#000B     ;
CODE_09A92F:         to r5              ;
CODE_09A930:         add   r1           ;
CODE_09A931:         iwt   r0,#0021     ;
CODE_09A934:         from r1            ;
CODE_09A935:         to r6              ;
CODE_09A936:         sub   r0           ;
CODE_09A937:         from r2            ;
CODE_09A938:         sub   r4           ;
CODE_09A939:         bpl CODE_09A970    ;
CODE_09A93B:         nop                ;
CODE_09A93C:         from r6            ;
CODE_09A93D:         hib                ;
CODE_09A93E:         bpl CODE_09A947    ;
CODE_09A940:         nop                ;
CODE_09A941:         iwt   r0,#FF00     ;
CODE_09A944:         bra CODE_09A950    ;

CODE_09A946:         nop                ;

CODE_09A947:         beq CODE_09A950    ;
CODE_09A949:         from r6            ;
CODE_09A94A:         iwt   r0,#00FF     ;
CODE_09A94D:         bra CODE_09A966    ;

CODE_09A94F:         nop                ;

CODE_09A950:         to r8              ;
CODE_09A951:         swap               ;
CODE_09A952:         from r5            ;
CODE_09A953:         hib                ;
CODE_09A954:         bpl CODE_09A95D    ;
CODE_09A956:         nop                ;
CODE_09A957:         iwt   r0,#00FF     ;
CODE_09A95A:         bra CODE_09A966    ;

CODE_09A95C:         nop                ;

CODE_09A95D:         beq CODE_09A963    ;
CODE_09A95F:         from r5            ;
CODE_09A960:         iwt   r0,#00FF     ;
CODE_09A963:         to r7              ;
CODE_09A964:         swap               ;
CODE_09A965:         merge              ;
CODE_09A966:         stw   (r3)         ;
CODE_09A967:         inc   r3           ;
CODE_09A968:         inc   r3           ;
CODE_09A969:         inc   r3           ;
CODE_09A96A:         inc   r3           ;
CODE_09A96B:         dec   r5           ;
CODE_09A96C:         dec   r6           ;
CODE_09A96D:         bra CODE_09A937    ;

CODE_09A96F:         inc   r2           ;

CODE_09A970:         iwt   r15,#AA84    ;
CODE_09A973:         nop                ;
CODE_09A974:         cache              ;
CODE_09A975:         ibt   r0,#0010     ;
CODE_09A977:         add   r2           ;
CODE_09A978:         beq CODE_09A97E    ;
CODE_09A97A:         nop                ;
CODE_09A97B:         bpl CODE_09A985    ;
CODE_09A97D:         nop                ;
CODE_09A97E:         iwt   r12,#00D2    ;
CODE_09A981:         iwt   r15,#AA79    ;
CODE_09A984:         nop                ;
CODE_09A985:         iwt   r0,#000B     ;
CODE_09A988:         to r11             ;
CODE_09A989:         add   r2           ;
CODE_09A98A:         sms   (0006),r11   ;
CODE_09A98D:         bpl CODE_09A99F    ;
CODE_09A98F:         nop                ;
CODE_09A990:         iwt   r0,#0005     ;
CODE_09A993:         add   r11          ;
CODE_09A994:         add   r0           ;
CODE_09A995:         add   r0           ;
CODE_09A996:         add   r0           ;
CODE_09A997:         to r6              ;
CODE_09A998:         add   r0           ;
CODE_09A999:         ibt   r2,#0000     ;
CODE_09A99B:         iwt   r15,#AA22    ;
CODE_09A99E:         nop                ;
CODE_09A99F:         iwt   r0,#000B     ;
CODE_09A9A2:         add   r1           ;
CODE_09A9A3:         to r9              ;
CODE_09A9A4:         add   r11          ;
CODE_09A9A5:         iwt   r0,#000B     ;
CODE_09A9A8:         from r2            ;
CODE_09A9A9:         to r11             ;
CODE_09A9AA:         sub   r0           ;
CODE_09A9AB:         sms   (0008),r11   ;
CODE_09A9AE:         bpl CODE_09A9BD    ;
CODE_09A9B0:         nop                ;
CODE_09A9B1:         iwt   r0,#001B     ;
CODE_09A9B4:         add   r11          ;
CODE_09A9B5:         add   r0           ;
CODE_09A9B6:         add   r0           ;
CODE_09A9B7:         add   r0           ;
CODE_09A9B8:         to r6              ;
CODE_09A9B9:         add   r0           ;
CODE_09A9BA:         bra CODE_09A9C7    ;

CODE_09A9BC:         nop                ;

CODE_09A9BD:         iwt   r0,#000B     ;
CODE_09A9C0:         from r1            ;
CODE_09A9C1:         sub   r0           ;
CODE_09A9C2:         to r10             ;
CODE_09A9C3:         add   r11          ;
CODE_09A9C4:         iwt   r6,#01A0     ;
CODE_09A9C7:         ibt   r2,#0000     ;
CODE_09A9C9:         from r2            ;
CODE_09A9CA:         sub   r4           ;
CODE_09A9CB:         bmi CODE_09A9D2    ;
CODE_09A9CD:         nop                ;
CODE_09A9CE:         iwt   r15,#A970    ;
CODE_09A9D1:         nop                ;
CODE_09A9D2:         lms   r0,(0008)    ;
CODE_09A9D5:         from r2            ;
CODE_09A9D6:         sub   r0           ;
CODE_09A9D7:         bmi CODE_09A9F4    ;
CODE_09A9D9:         nop                ;
CODE_09A9DA:         lms   r0,(0006)    ;
CODE_09A9DD:         from r2            ;
CODE_09A9DE:         sub   r0           ;
CODE_09A9DF:         bpl CODE_09AA22    ;
CODE_09A9E1:         nop                ;
CODE_09A9E2:         from r6            ;
CODE_09A9E3:         to r14             ;
CODE_09A9E4:         add   r5           ;
CODE_09A9E5:         ibt   r0,#0010     ;
CODE_09A9E7:         with r6            ;
CODE_09A9E8:         sub   r0           ;
CODE_09A9E9:         getb               ;
CODE_09A9EA:         lsr                ;
CODE_09A9EB:         lsr                ;
CODE_09A9EC:         lsr                ;
CODE_09A9ED:         lsr                ;
CODE_09A9EE:         sms   (000A),r0    ;
CODE_09A9F1:         from r1            ;
CODE_09A9F2:         to r10             ;
CODE_09A9F3:         sub   r0           ;
CODE_09A9F4:         from r10           ;
CODE_09A9F5:         hib                ;
CODE_09A9F6:         beq CODE_09AA08    ;
CODE_09A9F8:         from r10           ;
CODE_09A9F9:         from  r10          ;
CODE_09A9F9:         bpl CODE_09AA02    ;
CODE_09A9FB:         nop                ;
CODE_09A9FC:         iwt   r0,#0000     ;
CODE_09A9FF:         bra CODE_09AA08    ;

CODE_09AA01:         nop                ;

CODE_09AA02:         iwt   r0,#00FF     ;
CODE_09AA05:         bra CODE_09AA18    ;

CODE_09AA07:         nop                ;

CODE_09AA08:         to r8              ;
CODE_09AA09:         swap               ;
CODE_09AA0A:         from r9            ;
CODE_09AA0B:         hib                ;
CODE_09AA0C:         beq CODE_09AA15    ;
CODE_09AA0E:         from r9            ;
CODE_09AA0F:         from  r9           ;
CODE_09AA0F:         bmi CODE_09AA02    ;
CODE_09AA11:         nop                ;
CODE_09AA12:         iwt   r0,#00FF     ;
CODE_09AA15:         to r7              ;
CODE_09AA16:         swap               ;
CODE_09AA17:         merge              ;
CODE_09AA18:         stw   (r3)         ;
CODE_09AA19:         inc   r3           ;
CODE_09AA1A:         inc   r3           ;
CODE_09AA1B:         inc   r3           ;
CODE_09AA1C:         inc   r3           ;
CODE_09AA1D:         dec   r9           ;
CODE_09AA1E:         dec   r10          ;
CODE_09AA1F:         bra CODE_09A9C9    ;

CODE_09AA21:         inc   r2           ;

CODE_09AA22:         from r2            ;
CODE_09AA23:         sub   r4           ;
CODE_09AA24:         bpl CODE_09AA84    ;
CODE_09AA26:         nop                ;
CODE_09AA27:         from r6            ;
CODE_09AA28:         to r14             ;
CODE_09AA29:         add   r5           ;
CODE_09AA2A:         getb               ;
CODE_09AA2B:         lsr                ;
CODE_09AA2C:         lsr                ;
CODE_09AA2D:         lsr                ;
CODE_09AA2E:         to r11             ;
CODE_09AA2F:         lsr                ;
CODE_09AA30:         from r1            ;
CODE_09AA31:         sub   r11          ;
CODE_09AA32:         from r1            ;
CODE_09AA33:         to r10             ;
CODE_09AA34:         sub   r11          ;
CODE_09AA35:         bpl CODE_09AA3D    ;
CODE_09AA37:         from r10           ;
CODE_09AA38:         ibt   r0,#0000     ;
CODE_09AA3A:         bra CODE_09AA47    ;

CODE_09AA3C:         nop                ;

CODE_09AA3D:         hib                ;
CODE_09AA3E:         beq CODE_09AA47    ;
CODE_09AA40:         from r10           ;
CODE_09AA41:         iwt   r0,#00FF     ;
CODE_09AA44:         bra CODE_09AA5E    ;

CODE_09AA46:         nop                ;
CODE_09AA47:         to r8              ;
CODE_09AA48:         swap               ;
CODE_09AA49:         from r1            ;
CODE_09AA4A:         to r10             ;
CODE_09AA4B:         add   r11          ;
CODE_09AA4C:         bpl CODE_09AA55    ;
CODE_09AA4E:         from r10           ;
CODE_09AA4F:         iwt   r0,#00FF     ;
CODE_09AA52:         bra CODE_09AA5E    ;

CODE_09AA54:         nop                ;

CODE_09AA55:         hib                ;
CODE_09AA56:         beq CODE_09AA5B    ;
CODE_09AA58:         from r10           ;
CODE_09AA59:         ibt   r0,#FFFF     ;
CODE_09AA5B:         to r7              ;
CODE_09AA5C:         swap               ;
CODE_09AA5D:         merge              ;
CODE_09AA5E:         stw   (r3)         ;
CODE_09AA5F:         inc   r3           ;
CODE_09AA60:         inc   r3           ;
CODE_09AA61:         inc   r3           ;
CODE_09AA62:         inc   r3           ;
CODE_09AA63:         ibt   r0,#0010     ;
CODE_09AA65:         with r6            ;
CODE_09AA66:         sub   r0           ;
CODE_09AA67:         bpl CODE_09AA22    ;
CODE_09AA69:         inc   r2           ;
CODE_09AA6A:         from r4            ;
CODE_09AA6B:         to r12             ;
CODE_09AA6C:         sub   r2           ;
CODE_09AA6D:         beq CODE_09AA84    ;
CODE_09AA6F:         nop                ;
CODE_09AA70:         bmi CODE_09AA84    ;
CODE_09AA72:         nop                ;
CODE_09AA73:         bra CODE_09AA79    ;

CODE_09AA75:         nop                ;

CODE_09AA76:         iwt   r12,#00D2    ;
CODE_09AA79:         iwt   r0,#00FF     ;
CODE_09AA7C:         move  r13,r15      ;
CODE_09AA7E:         stw   (r3)         ;
CODE_09AA7F:         inc   r3           ;
CODE_09AA80:         inc   r3           ;
CODE_09AA81:         inc   r3           ;
CODE_09AA82:         loop               ;
CODE_09AA83:         inc   r3           ;
CODE_09AA84:         cache              ;
CODE_09AA85:         lms   r1,(0002)    ;
CODE_09AA88:         lms   r2,(0004)    ;
CODE_09AA8B:         iwt   r3,#3A04     ;
CODE_09AA8E:         iwt   r12,#00D2    ;
CODE_09AA91:         ibt   r0,#0016     ;
CODE_09AA93:         add   r1           ;
CODE_09AA94:         to r1              ;
CODE_09AA95:         add   r2           ;
CODE_09AA96:         bpl CODE_09AA9F    ;
CODE_09AA98:         nop                ;
CODE_09AA99:         iwt   r0,#FF00     ;
CODE_09AA9C:         bra CODE_09AAD0    ;

CODE_09AA9E:         nop                ;

CODE_09AA9F:         iwt   r0,#01D2     ;
CODE_09AAA2:         from r1            ;
CODE_09AAA3:         sub   r0           ;
CODE_09AAA4:         bpl CODE_09AACD    ;
CODE_09AAA6:         nop                ;
CODE_09AAA7:         iwt   r7,#FF00     ;
CODE_09AAAA:         move  r13,r15      ;
CODE_09AAAC:         from r1            ;
CODE_09AAAD:         sub   #00          ;
CODE_09AAAF:         bpl CODE_09AAB8    ;
CODE_09AAB1:         from r1            ;
CODE_09AAB2:         iwt   r0,#FF00     ;
CODE_09AAB5:         bra CODE_09AAC4    ;

CODE_09AAB7:         nop                ;

CODE_09AAB8:         hib                ;
CODE_09AAB9:         beq CODE_09AAC2    ;
CODE_09AABB:         nop                ;
CODE_09AABC:         iwt   r0,#00FF     ;
CODE_09AABF:         bra CODE_09AAC4    ;

CODE_09AAC1:         nop                ;

CODE_09AAC2:         from r1            ;
CODE_09AAC3:         or    r7           ;
CODE_09AAC4:         stw   (r3)         ;
CODE_09AAC5:         inc   r3           ;
CODE_09AAC6:         inc   r3           ;
CODE_09AAC7:         inc   r3           ;
CODE_09AAC8:         inc   r3           ;
CODE_09AAC9:         loop               ;
CODE_09AACA:         dec   r1           ;
CODE_09AACB:         stop               ;
CODE_09AACC:         nop                ;
CODE_09AACD:         iwt   r0,#00FF     ;
CODE_09AAD0:         move  r13,r15      ;
CODE_09AAD2:         stw   (r3)         ;
CODE_09AAD3:         inc   r3           ;
CODE_09AAD4:         inc   r3           ;
CODE_09AAD5:         inc   r3           ;
CODE_09AAD6:         loop               ;
CODE_09AAD7:         inc   r3           ;
CODE_09AAD8:         stop               ;
CODE_09AAD9:         nop                ;

DATA_09AADA:         db $16, $1F, $27, $2D, $37, $3B, $3F, $43
DATA_09AAE2:         db $46, $4A, $4D, $50, $53, $56, $59, $5B
DATA_09AAEA:         db $5E, $60, $63, $65, $67, $6A, $6C, $6E
DATA_09AAF2:         db $70, $72, $74, $76, $78, $7A, $7B, $7D
DATA_09AAFA:         db $7F, $81, $82, $84, $86, $87, $89, $8A
DATA_09AB02:         db $8C, $8E, $8F, $90, $92, $93, $95, $96
DATA_09AB0A:         db $97, $99, $9A, $9B, $9D, $9E, $9F, $A1
DATA_09AB12:         db $A2, $A3, $A4, $A5, $A7, $A8, $A9, $AA
DATA_09AB1A:         db $AB, $AC, $AD, $AE, $AF, $B0, $B1, $B3
DATA_09AB22:         db $B4, $C1, $C2, $C2, $C3, $C4, $C5, $C6
DATA_09AB2A:         db $C7, $C7, $C8, $C9, $CA, $CA, $CB, $CC
DATA_09AB32:         db $CD, $CD, $CE, $CF, $D0, $D0, $D1, $D2
DATA_09AB3A:         db $D2, $D3, $D4, $D5, $D5, $D6, $D6, $D7
DATA_09AB42:         db $D8, $D8, $D9, $DA, $DA, $DB, $DB, $DC
DATA_09AB4A:         db $DD, $DD, $DE, $DE, $DF, $DF, $E0, $E1
DATA_09AB52:         db $E1, $E2, $E2, $E3, $E3, $E4, $E4, $E5
DATA_09AB5A:         db $E5, $E6, $E6, $E7, $E7, $E8, $E8, $E9
DATA_09AB62:         db $E9, $E9, $EA, $EA, $EB, $EB, $EC, $EC
DATA_09AB6A:         db $EC, $ED, $ED, $EE, $EE, $EE, $EF, $EF
DATA_09AB72:         db $F0, $F0, $F0, $F1, $F1, $F1, $F2, $F2
DATA_09AB7A:         db $F2, $F3, $F3, $F3, $F4, $F4, $F4, $F5
DATA_09AB82:         db $F5, $F5, $F5, $F6, $F6, $F6, $F7, $F7
DATA_09AB8A:         db $F7, $F7, $F8, $F8, $F8, $F8, $F9, $F9
DATA_09AB92:         db $F9, $F9, $FA, $FA, $FA, $FA, $FA, $FB
DATA_09AB9A:         db $FB, $FB, $FB, $FB, $FC, $FC, $FC, $FC
DATA_09ABA2:         db $FC, $FC, $FD, $FD, $FD, $FD, $FD, $FD
DATA_09ABAA:         db $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FE
DATA_09ABB2:         db $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
DATA_09ABBA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09ABC2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09ABCA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09ABD2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09ABDA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09ABE2:         db $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FE
DATA_09ABEA:         db $FE, $FE, $FD, $FD, $FD, $FD, $FD, $FD
DATA_09ABF2:         db $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC
DATA_09ABFA:         db $FB, $FB, $FB, $FB, $FB, $FA, $FA, $FA
DATA_09AC02:         db $FA, $FA, $F9, $F9, $F9, $F9, $F8, $F8
DATA_09AC0A:         db $F8, $F8, $F7, $F7, $F7, $F7, $F6, $F6
DATA_09AC12:         db $F6, $F5, $F5, $F5, $F5, $F4, $F4, $F4
DATA_09AC1A:         db $F3, $F3, $F3, $F2, $F2, $F2, $F1, $F1
DATA_09AC22:         db $F1, $F0, $F0, $F0, $EF, $EF, $EE, $EE
DATA_09AC2A:         db $EE, $ED, $ED, $EC, $EC, $EC, $EB, $EB
DATA_09AC32:         db $EA, $EA, $E9, $E9, $E9, $E8, $E8, $E7
DATA_09AC3A:         db $E7, $E6, $E6, $E5, $E5, $E4, $E4, $E3
DATA_09AC42:         db $E3, $E2, $E2, $E1, $E1, $E0, $DF, $DF
DATA_09AC4A:         db $DE, $DE, $DD, $DD, $DC, $DB, $DB, $DA
DATA_09AC52:         db $DA, $D9, $D8, $D8, $D7, $D6, $D6, $D5
DATA_09AC5A:         db $D5, $D4, $D3, $D2, $D2, $D1, $D0, $D0
DATA_09AC62:         db $CF, $CE, $CD, $CD, $CC, $CB, $CA, $CA
DATA_09AC6A:         db $C9, $C8, $C7, $C7, $C6, $C5, $C4, $C3
DATA_09AC72:         db $C2, $C2, $C1, $C0, $BF, $BE, $BD, $BC
DATA_09AC7A:         db $AD, $AC, $AB, $AA, $A9, $A8, $A7, $A5
DATA_09AC82:         db $A4, $A3, $A2, $A1, $9F, $9E, $9D, $9B
DATA_09AC8A:         db $9A, $99, $97, $96, $95, $93, $92, $90
DATA_09AC92:         db $8F, $8E, $8C, $8A, $89, $87, $86, $84
DATA_09AC9A:         db $82, $81, $7F, $7D, $7B, $7A, $78, $76
DATA_09ACA2:         db $74, $72, $70, $6E, $6C, $6A, $67, $65
DATA_09ACAA:         db $63, $60, $5E, $5B, $59, $56, $53, $50
DATA_09ACB2:         db $4D, $4A, $46, $43, $3F, $3B, $37, $32
DATA_09ACBA:         db $2D, $27, $1F, $16

CODE_09ACDA:         cache              ;
CODE_09ACDB:         lm    r1,(1972)    ;
CODE_09ACDF:         lm    r2,(0092)    ;
CODE_09ACE3:         iwt   r0,#1680     ;
CODE_09ACE6:         add   r1           ;
CODE_09ACE7:         to r3              ;
CODE_09ACE8:         ldw   (r0)         ;
CODE_09ACE9:         iwt   r0,#1682     ;
CODE_09ACEC:         add   r1           ;
CODE_09ACED:         to r4              ;
CODE_09ACEE:         ldw   (r0)         ;
CODE_09ACEF:         dec   r5           ;
CODE_09ACF0:         bmi CODE_09AD56    ;
CODE_09ACF2:         nop                ;
CODE_09ACF3:         iwt   r0,#0008     ;
CODE_09ACF6:         romb               ;
CODE_09ACF8:         iwt   r0,#AE58     ;
CODE_09ACFB:         to r14             ;
CODE_09ACFC:         add   r9           ;
CODE_09ACFD:         getbs              ;
CODE_09ACFF:         asr                ;
CODE_09AD00:         asr                ;
CODE_09AD01:         asr                ;
CODE_09AD02:         asr                ;
CODE_09AD03:         mult  r10          ;
CODE_09AD04:         add   r0           ;
CODE_09AD05:         add   r0           ;
CODE_09AD06:         hib                ;
CODE_09AD07:         sex                ;
CODE_09AD08:         to r8              ;
CODE_09AD09:         add   r4           ;
CODE_09AD0A:         iwt   r0,#0009     ;
CODE_09AD0D:         romb               ;
CODE_09AD0F:         iwt   r0,#AD5C     ;
CODE_09AD12:         add   r9           ;
CODE_09AD13:         to r9              ;
CODE_09AD14:         lob                ;
CODE_09AD15:         iwt   r0,#AD61     ;
CODE_09AD18:         to r14             ;
CODE_09AD19:         add   r5           ;
CODE_09AD1A:         getb               ;
CODE_09AD1B:         umult r6           ;
CODE_09AD1D:         add   r0           ;
CODE_09AD1E:         hib                ;
CODE_09AD1F:         from r3            ;
CODE_09AD20:         to r7              ;
CODE_09AD21:         sub   r0           ;
CODE_09AD22:         iwt   r0,#AD66     ;
CODE_09AD25:         to r14             ;
CODE_09AD26:         add   r5           ;
CODE_09AD27:         to r12             ;
CODE_09AD28:         getb               ;
CODE_09AD29:         iwt   r0,#AD6B     ;
CODE_09AD2C:         add   r5           ;
CODE_09AD2D:         to r14             ;
CODE_09AD2E:         add   r5           ;
CODE_09AD2F:         getb               ;
CODE_09AD30:         inc   r14          ;
CODE_09AD31:         getbh              ;
CODE_09AD33:         move  r14,r0       ;
CODE_09AD35:         move  r13,r15      ;
CODE_09AD37:         getbs              ;
CODE_09AD39:         inc   r14          ;
CODE_09AD3A:         add   r7           ;
CODE_09AD3B:         stw   (r2)         ;
CODE_09AD3C:         inc   r2           ;
CODE_09AD3D:         inc   r2           ;
CODE_09AD3E:         getbs              ;
CODE_09AD40:         inc   r14          ;
CODE_09AD41:         add   r8           ;
CODE_09AD42:         stw   (r2)         ;
CODE_09AD43:         inc   r2           ;
CODE_09AD44:         inc   r2           ;
CODE_09AD45:         getb               ;
CODE_09AD46:         inc   r14          ;
CODE_09AD47:         getbh              ;
CODE_09AD49:         inc   r14          ;
CODE_09AD4A:         stw   (r2)         ;
CODE_09AD4B:         inc   r2           ;
CODE_09AD4C:         inc   r2           ;
CODE_09AD4D:         getb               ;
CODE_09AD4E:         inc   r14          ;
CODE_09AD4F:         stw   (r2)         ;
CODE_09AD50:         inc   r2           ;
CODE_09AD51:         loop               ;
CODE_09AD52:         inc   r2           ;
CODE_09AD53:         bra CODE_09ACEF    ;

CODE_09AD55:         nop                ;

CODE_09AD56:         sm    (0092),r2    ;
CODE_09AD5A:         stop               ;
CODE_09AD5B:         nop                ;

CODE_09AD5C:         ibt   r0,#0010     ;
CODE_09AD5E:         inc   r0           ;
CODE_09AD5F:         ldw   (r0)         ;
CODE_09AD60:         stop               ;

CODE_09AD61:         stop               ;
CODE_09AD62:         with r8            ;
CODE_09AD63:         color              ;
CODE_09AD64:         and   r2           ;
CODE_09AD65:         jmp   r8           ;

CODE_09AD66:         bge CODE_09AD73    ;
CODE_09AD68:         bne CODE_09AD76    ;
CODE_09AD6A:         to r1              ;
CODE_09AD6B:         sub   r5           ;

DATA_09AD6B:         dw $AE65, $AE2E, $AE06, $ADCA
DATA_09AD73:         dw $AD75

DATA_09AD75:         db $20, $20, $BA, $37, $00, $20, $18, $BA
DATA_09AD7D:         db $37, $00, $1A, $10, $A3, $37, $00, $12
DATA_09AD85:         db $10, $A2, $37, $00, $18, $20, $B4, $37
DATA_09AD8D:         db $00, $10, $18, $B2, $37, $00, $18, $18
DATA_09AD95:         db $B3, $37, $00, $10, $20, $A2, $37, $00
DATA_09AD9D:         db $20, $28, $95, $37, $00, $00, $28, $BB
DATA_09ADA5:         db $37, $00, $18, $28, $94, $37, $00, $10
DATA_09ADAD:         db $28, $85, $37, $00, $08, $28, $84, $37
DATA_09ADB5:         db $00, $08, $00, $96, $37, $00, $10, $00
DATA_09ADBD:         db $82, $37, $02, $00, $18, $A0, $37, $02
DATA_09ADC5:         db $00, $08, $80, $37, $02

DATA_09ADCA:         db $18, $08, $80, $77, $02, $10, $20, $A2
DATA_09ADD2:         db $37, $00, $00, $28, $BB, $37, $00, $20
DATA_09ADDA:         db $28, $95, $37, $00, $18, $28, $94, $37
DATA_09ADE2:         db $00, $10, $28, $85, $37, $00, $08, $28
DATA_09ADEA:         db $84, $37, $00, $18, $18, $A4, $37, $02
DATA_09ADF2:         db $08, $00, $96, $37, $00, $10, $00, $82
DATA_09ADFA:         db $37, $02, $00, $08, $80, $37, $02, $00
DATA_09AE02:         db $18, $A0, $37, $02

DATA_09AE06:         db $0F, $00, $86, $37, $00, $17, $00, $87
DATA_09AE0E:         db $37, $00, $18, $08, $88, $37, $00, $18
DATA_09AE16:         db $20, $AB, $37, $02, $18, $10, $8B, $37
DATA_09AE1E:         db $02, $08, $08, $89, $37, $02, $08, $18
DATA_09AE26:         db $97, $37, $02, $00, $20, $A6, $37, $02

DATA_09AE2E:         db $08, $18, $B8, $37, $00, $08, $10, $B8
DATA_09AE36:         db $37, $00, $18, $20, $A2, $37, $00, $18
DATA_09AE3E:         db $28, $85, $37, $00, $20, $28, $BD, $37
DATA_09AE46:         db $00, $20, $20, $AD, $37, $00, $10, $10
DATA_09AE4E:         db $BA, $37, $00, $10, $18, $BA, $37, $00
DATA_09AE56:         db $08, $00, $A9, $37, $02, $08, $20, $8E
DATA_09AE5E:         db $37, $02, $00, $20, $8D, $37, $02

DATA_09AE65:         db $00, $18, $B8, $37, $00, $00, $10, $B8
DATA_09AE6D:         db $37, $00, $08, $10, $BA, $37, $00, $08
DATA_09AE75:         db $18, $BA, $37, $00, $00, $20, $AE, $37
DATA_09AE7D:         db $02, $00, $00, $A9, $37, $02

CODE_09AE83:         romb               ;
CODE_09AE85:         move  r14,r5       ;
CODE_09AE87:         cache              ;
CODE_09AE88:         lm    r1,(1972)    ;
CODE_09AE8C:         lm    r2,(0092)    ;
CODE_09AE90:         iwt   r0,#1680     ;
CODE_09AE93:         add   r1           ;
CODE_09AE94:         to r3              ;
CODE_09AE95:         ldw   (r0)         ;
CODE_09AE96:         iwt   r0,#1682     ;
CODE_09AE99:         add   r1           ;
CODE_09AE9A:         to r4              ;
CODE_09AE9B:         ldw   (r0)         ;
CODE_09AE9C:         move  r13,r15      ;
CODE_09AE9E:         getbs              ;
CODE_09AEA0:         inc   r14          ;
CODE_09AEA1:         add   r3           ;
CODE_09AEA2:         stw   (r2)         ;
CODE_09AEA3:         inc   r2           ;
CODE_09AEA4:         inc   r2           ;
CODE_09AEA5:         getbs              ;
CODE_09AEA7:         inc   r14          ;
CODE_09AEA8:         add   r4           ;
CODE_09AEA9:         stw   (r2)         ;
CODE_09AEAA:         inc   r2           ;
CODE_09AEAB:         inc   r2           ;
CODE_09AEAC:         getb               ;
CODE_09AEAD:         inc   r14          ;
CODE_09AEAE:         getbh              ;
CODE_09AEB0:         inc   r14          ;
CODE_09AEB1:         stw   (r2)         ;
CODE_09AEB2:         inc   r2           ;
CODE_09AEB3:         inc   r2           ;
CODE_09AEB4:         getb               ;
CODE_09AEB5:         inc   r14          ;
CODE_09AEB6:         stw   (r2)         ;
CODE_09AEB7:         inc   r2           ;
CODE_09AEB8:         inc   r2           ;
CODE_09AEB9:         loop               ;
CODE_09AEBA:         nop                ;
CODE_09AEBB:         sm    (0092),r2    ;
CODE_09AEBF:         stop               ;
CODE_09AEC0:         nop                ;

CODE_09AEC1:         romb               ;
CODE_09AEC3:         lm    r2,(1972)    ;
CODE_09AEC7:         iwt   r0,#1040     ;
CODE_09AECA:         add   r2           ;
CODE_09AECB:         ldw   (r0)         ;
CODE_09AECC:         hib                ;
CODE_09AECD:         lsr                ;
CODE_09AECE:         lsr                ;
CODE_09AECF:         to r12             ;
CODE_09AED0:         lsr                ;
CODE_09AED1:         iwt   r0,#1402     ;
CODE_09AED4:         add   r2           ;
CODE_09AED5:         ldw   (r0)         ;
CODE_09AED6:         mult  r12          ;
CODE_09AED7:         mult  #05          ;
CODE_09AED9:         to r14             ;
CODE_09AEDA:         add   r1           ;
CODE_09AEDB:         iwt   r0,#1400     ;
CODE_09AEDE:         add   r2           ;
CODE_09AEDF:         to r3              ;
CODE_09AEE0:         ldw   (r0)         ;
CODE_09AEE1:         from r3            ;
CODE_09AEE2:         lsr                ;
CODE_09AEE3:         lsr                ;
CODE_09AEE4:         ror                ;
CODE_09AEE5:         to r4              ;
CODE_09AEE6:         lsr                ;
CODE_09AEE7:         iwt   r0,#1680     ;
CODE_09AEEA:         add   r2           ;
CODE_09AEEB:         to r5              ;
CODE_09AEEC:         ldw   (r0)         ;
CODE_09AEED:         iwt   r0,#1682     ;
CODE_09AEF0:         add   r2           ;
CODE_09AEF1:         to r6              ;
CODE_09AEF2:         ldw   (r0)         ;
CODE_09AEF3:         iwt   r0,#1362     ;
CODE_09AEF6:         add   r2           ;
CODE_09AEF7:         to r7              ;
CODE_09AEF8:         ldw   (r0)         ;
CODE_09AEF9:         iwt   r0,#1042     ;
CODE_09AEFC:         add   r2           ;
CODE_09AEFD:         ldw   (r0)         ;
CODE_09AEFE:         to r8              ;
CODE_09AEFF:         swap               ;
CODE_09AF00:         iwt   r0,#CFFF     ;
CODE_09AF03:         and   r8           ;
CODE_09AF04:         to r4              ;
CODE_09AF05:         xor   r4           ;
CODE_09AF07:         iwt   r0,#3000     ;
CODE_09AF0A:         to r8              ;
CODE_09AF0B:         and   r8           ;
CODE_09AF0C:         ibt   r9,#0005     ;
CODE_09AF0E:         cache              ;
CODE_09AF0F:         move  r13,r15      ;
CODE_09AF11:         to r1              ;
CODE_09AF12:         getb               ;
CODE_09AF13:         inc   r14          ;
CODE_09AF14:         getbs              ;
CODE_09AF16:         inc   r14          ;
CODE_09AF17:         dec   r9           ;
CODE_09AF18:         bmi CODE_09AF27    ;
CODE_09AF1A:         inc   r9           ;
CODE_09AF1B:         dec   r3           ;
CODE_09AF1C:         bmi CODE_09AF27    ;
CODE_09AF1E:         inc   r3           ;
CODE_09AF1F:         not                ;
CODE_09AF20:         inc   r0           ;
CODE_09AF21:         dec   r1           ;
CODE_09AF22:         bpl CODE_09AF27    ;
CODE_09AF24:         inc   r1           ;
CODE_09AF25:         add   #08          ;
CODE_09AF27:         add   r5           ;
CODE_09AF28:         stw   (r7)         ;
CODE_09AF29:         inc   r7           ;
CODE_09AF2A:         inc   r7           ;
CODE_09AF2B:         getbs              ;
CODE_09AF2D:         inc   r14          ;
CODE_09AF2E:         add   r6           ;
CODE_09AF2F:         stw   (r7)         ;
CODE_09AF30:         inc   r7           ;
CODE_09AF31:         inc   r7           ;
CODE_09AF32:         getb               ;
CODE_09AF33:         inc   r14          ;
CODE_09AF34:         getbh              ;
CODE_09AF36:         inc   r14          ;
CODE_09AF37:         dec   r9           ;
CODE_09AF38:         bmi CODE_09AF3D    ;
CODE_09AF3A:         inc   r9           ;
CODE_09AF3B:         xor   r4           ;
CODE_09AF3D:         xor   r8           ;
CODE_09AF3F:         stw   (r7)         ;
CODE_09AF40:         inc   r7           ;
CODE_09AF41:         inc   r7           ;
CODE_09AF42:         from r1            ;
CODE_09AF43:         stw   (r7)         ;
CODE_09AF44:         inc   r7           ;
CODE_09AF45:         inc   r7           ;
CODE_09AF46:         loop               ;
CODE_09AF47:         dec   r9           ;
CODE_09AF48:         stop               ;
CODE_09AF49:         nop                ;

CODE_09AF4A:         cache              ;
CODE_09AF4B:         iwt   r1,#0F00     ;
CODE_09AF4E:         iwt   r2,#0FA2     ;
CODE_09AF51:         iwt   r3,#6000     ;
CODE_09AF54:         ibt   r4,#0004     ;
CODE_09AF56:         ibt   r11,#0000    ;
CODE_09AF58:         ibt   r12,#0018    ;
CODE_09AF5A:         move  r13,r15      ;
CODE_09AF5C:         ldw   (r1)         ;
CODE_09AF5D:         sub   #00          ;
CODE_09AF5F:         beq CODE_09AF67    ;
CODE_09AF61:         nop                ;
CODE_09AF62:         ldw   (r2)         ;
CODE_09AF63:         and   r3           ;
CODE_09AF64:         beq CODE_09AF6E    ;
CODE_09AF66:         nop                ;
CODE_09AF67:         with r1            ;
CODE_09AF68:         add   r4           ;
CODE_09AF69:         with r2            ;
CODE_09AF6A:         add   r4           ;
CODE_09AF6B:         loop               ;
CODE_09AF6C:         nop                ;
CODE_09AF6D:         dec   r11          ;
CODE_09AF6E:         stop               ;
CODE_09AF6F:         nop                ;

; freespace
DATA_09AF70:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AF78:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AF80:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AF88:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AF90:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AF98:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFA0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFA8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFB0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFB8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFC0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFC8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFD0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFD8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFE0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFE8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFF0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09AFF8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B000:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B008:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B010:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B018:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B020:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B028:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B030:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09B038:         db $01, $01, $01, $01, $01, $01

CODE_09B03E:         ibt   r0,#0009     ;
CODE_09B040:         romb               ;
CODE_09B042:         ibt   r0,#0000     ;
CODE_09B044:         cmode              ;
CODE_09B046:         ibt   r0,#0003     ;
CODE_09B048:         color              ;
CODE_09B049:         lm    r0,(406E)    ;
CODE_09B04D:         add   r0           ;
CODE_09B04E:         add   r0           ;
CODE_09B04F:         inc   r0           ;
CODE_09B050:         to r15             ;
CODE_09B051:         add   r15          ;
CODE_09B052:         iwt   r15,#B05F    ;
CODE_09B055:         nop                ;
CODE_09B056:         nop                ;
CODE_09B057:         fmult              ;
CODE_09B058:         from r0            ;
CODE_09B059:         nop                ;
CODE_09B05A:         nop                ;
CODE_09B05B:         dec   r1           ;
CODE_09B05C:         from r4            ;
CODE_09B05D:         nop                ;
CODE_09B05E:         nop                ;
CODE_09B05F:         ibt   r0,#0001     ;
CODE_09B061:         sm    (406E),r0    ;
CODE_09B065:         sub   r0           ;
CODE_09B066:         sm    (407E),r0    ;
CODE_09B06A:         sm    (4084),r0    ;
CODE_09B06E:         sm    (4088),r0    ;
CODE_09B072:         sm    (408A),r0    ;
CODE_09B076:         sm    (4080),r0    ;
CODE_09B07A:         sm    (4082),r0    ;
CODE_09B07E:         sm    (4094),r0    ;
CODE_09B082:         ibt   r0,#0010     ;
CODE_09B084:         sm    (4086),r0    ;
CODE_09B088:         lm    r0,(4096)    ;
CODE_09B08C:         sm    (407C),r0    ;
CODE_09B090:         iwt   r0,#00FF     ;
CODE_09B093:         iwt   r1,#4E00     ;
CODE_09B096:         iwt   r12,#0500    ;
CODE_09B099:         move  r13,r15      ;
CODE_09B09B:         stw   (r1)         ;
CODE_09B09C:         inc   r1           ;
CODE_09B09D:         loop               ;
CODE_09B09E:         inc   r1           ;
CODE_09B09F:         sub   r0           ;
CODE_09B0A0:         sms   (007A),r0    ;
CODE_09B0A3:         lm    r0,(4088)    ;
CODE_09B0A7:         dec   r0           ;
CODE_09B0A8:         bmi CODE_09B0AF    ;
CODE_09B0AA:         sbk                ;
CODE_09B0AB:         iwt   r15,#BA99    ;
CODE_09B0AE:         nop                ;
CODE_09B0AF:         lm    r0,(408A)    ;
CODE_09B0B3:         sm    (4088),r0    ;
CODE_09B0B7:         lm    r0,(4098)    ;
CODE_09B0BB:         romb               ;
CODE_09B0BD:         lm    r14,(407C)   ;
CODE_09B0C1:         getb               ;
CODE_09B0C2:         inc   r14          ;
CODE_09B0C3:         getbh              ;
CODE_09B0C5:         sm    (4072),r0    ;
CODE_09B0C9:         ibt   r1,#0009     ;
CODE_09B0CB:         from r1            ;
CODE_09B0CC:         romb               ;
CODE_09B0CE:         move  r1,r0        ;
CODE_09B0D0:         inc   r0           ;
CODE_09B0D1:         lob                ;
CODE_09B0D2:         beq CODE_09B0D9    ;
CODE_09B0D4:         nop                ;
CODE_09B0D5:         iwt   r15,#B4E3    ;
CODE_09B0D8:         nop                ;
CODE_09B0D9:         from r1            ;
CODE_09B0DA:         hib                ;
CODE_09B0DB:         add   r0           ;
CODE_09B0DC:         add   r0           ;
CODE_09B0DD:         inc   r0           ;
CODE_09B0DE:         to r15             ;
CODE_09B0DF:         add   r15          ;
CODE_09B0E0:         iwt   r15,#B657    ;
CODE_09B0E3:         nop                ;

DATA_09B0E4:         db $01, $60, $B6, $01
DATA_09B0E8:         db $01, $69, $B6, $01
DATA_09B0EC:         db $01, $72, $B6, $01
DATA_09B0F0:         db $01, $7B, $B6, $01
DATA_09B0F4:         db $01, $91, $B6, $01
DATA_09B0F8:         db $01, $A1, $B6, $01
DATA_09B0FC:         db $01, $B1, $B6, $01
DATA_09B100:         db $01, $C1, $B6, $01
DATA_09B104:         db $01, $D1, $B6, $01
DATA_09B108:         db $01, $E6, $B6, $01
DATA_09B10C:         db $01, $0C, $B7, $01
DATA_09B110:         db $01, $0C, $B7, $01
DATA_09B114:         db $01, $0C, $B7, $01
DATA_09B118:         db $01, $0C, $B7, $01
DATA_09B11C:         db $01, $F6, $B6, $01
DATA_09B120:         db $01, $2B, $B7, $01
DATA_09B124:         db $01, $54, $B7, $01
DATA_09B128:         db $01, $5B, $B7, $01
DATA_09B12C:         db $01, $61, $B7, $01
DATA_09B130:         db $01, $67, $B7, $01
DATA_09B134:         db $01, $6D, $B7, $01
DATA_09B138:         db $01, $6D, $B7, $01
DATA_09B13C:         db $01, $6D, $B7, $01
DATA_09B140:         db $01, $6D, $B7, $01
DATA_09B144:         db $01, $6D, $B7, $01
DATA_09B148:         db $01, $6D, $B7, $01
DATA_09B14C:         db $01, $6D, $B7, $01
DATA_09B150:         db $01, $6D, $B7, $01
DATA_09B154:         db $01, $6D, $B7, $01
DATA_09B158:         db $01, $6D, $B7, $01
DATA_09B15C:         db $01, $6D, $B7, $01
DATA_09B160:         db $01, $C2, $B7, $01
DATA_09B164:         db $01, $C2, $B7, $01
DATA_09B168:         db $01, $C2, $B7, $01
DATA_09B16C:         db $01, $C2, $B7, $01
DATA_09B170:         db $01, $C2, $B7, $01
DATA_09B174:         db $01, $C2, $B7, $01
DATA_09B178:         db $01, $C2, $B7, $01
DATA_09B17C:         db $01, $C2, $B7, $01
DATA_09B180:         db $01, $C2, $B7, $01
DATA_09B184:         db $01, $C2, $B7, $01
DATA_09B188:         db $01, $C2, $B7, $01
DATA_09B18C:         db $01, $C2, $B7, $01
DATA_09B190:         db $01, $C2, $B7, $01
DATA_09B194:         db $01, $C2, $B7, $01
DATA_09B198:         db $01, $C2, $B7, $01
DATA_09B19C:         db $01, $C2, $B7, $01
DATA_09B1A0:         db $01, $C2, $B7, $01
DATA_09B1A4:         db $01, $D0, $B7, $01
DATA_09B1A8:         db $01, $DE, $B7, $01
DATA_09B1AC:         db $01, $EC, $B7, $01
DATA_09B1B0:         db $01, $FA, $B7, $01
DATA_09B1B4:         db $01, $04, $B8, $01
DATA_09B1B8:         db $01, $0E, $B8, $01
DATA_09B1BC:         db $01, $18, $B8, $01
DATA_09B1C0:         db $01, $22, $B8, $01
DATA_09B1C4:         db $01, $2C, $B8, $01
DATA_09B1C8:         db $01, $36, $B8, $01
DATA_09B1CC:         db $01, $40, $B8, $01
DATA_09B1D0:         db $01, $4A, $B8, $01
DATA_09B1D4:         db $01, $4A, $B8, $01
DATA_09B1D8:         db $01, $77, $B8, $01
DATA_09B1DC:         db $01, $91, $B8, $01
DATA_09B1E0:         db $01, $AC, $B8, $01
DATA_09B1E4:         db $01, $AC, $B8, $01
DATA_09B1E8:         db $01, $AC, $B8, $01
DATA_09B1EC:         db $01, $AC, $B8, $01
DATA_09B1F0:         db $01, $AC, $B8, $01
DATA_09B1F4:         db $01, $AC, $B8, $01
DATA_09B1F8:         db $01, $AC, $B8, $01
DATA_09B1FC:         db $01, $AC, $B8, $01
DATA_09B200:         db $01, $AC, $B8, $01
DATA_09B204:         db $01, $AC, $B8, $01
DATA_09B208:         db $01, $AC, $B8, $01
DATA_09B20C:         db $01, $AC, $B8, $01
DATA_09B210:         db $01, $AC, $B8, $01
DATA_09B214:         db $01, $AC, $B8, $01
DATA_09B218:         db $01, $AC, $B8, $01
DATA_09B21C:         db $01, $AC, $B8, $01
DATA_09B220:         db $01, $BC, $B8, $01
DATA_09B224:         db $01, $BC, $B8, $01
DATA_09B228:         db $01, $CE, $B9, $01
DATA_09B22C:         db $01, $F0, $B9, $01
DATA_09B230:         db $01, $F0, $B9, $01
DATA_09B234:         db $01, $F0, $B9, $01
DATA_09B238:         db $01, $F0, $B9, $01
DATA_09B23C:         db $01, $F0, $B9, $01
DATA_09B240:         db $01, $F0, $B9, $01
DATA_09B244:         db $01, $F0, $B9, $01
DATA_09B248:         db $01, $F0, $B9, $01
DATA_09B24C:         db $01, $F0, $B9, $01
DATA_09B250:         db $01, $F0, $B9, $01
DATA_09B254:         db $01, $F0, $B9, $01
DATA_09B258:         db $01, $F0, $B9, $01
DATA_09B25C:         db $01, $F0, $B9, $01
DATA_09B260:         db $01, $F4, $B9, $01
DATA_09B264:         db $01, $84, $BA, $01
DATA_09B268:         db $01, $84, $BA, $01
DATA_09B26C:         db $01, $84, $BA, $01
DATA_09B270:         db $01, $84, $BA, $01
DATA_09B274:         db $01, $84, $BA, $01
DATA_09B278:         db $01, $84, $BA, $01
DATA_09B27C:         db $01, $84, $BA, $01
DATA_09B280:         db $01, $84, $BA, $01
DATA_09B284:         db $01, $84, $BA, $01
DATA_09B288:         db $01, $84, $BA, $01
DATA_09B28C:         db $01, $84, $BA, $01
DATA_09B290:         db $01, $84, $BA, $01
DATA_09B294:         db $01, $84, $BA, $01
DATA_09B298:         db $01, $84, $BA, $01
DATA_09B29C:         db $01, $84, $BA, $01
DATA_09B2A0:         db $01, $84, $BA, $01
DATA_09B2A4:         db $01, $84, $BA, $01
DATA_09B2A8:         db $01, $84, $BA, $01
DATA_09B2AC:         db $01, $84, $BA, $01
DATA_09B2B0:         db $01, $84, $BA, $01
DATA_09B2B4:         db $01, $84, $BA, $01
DATA_09B2B8:         db $01, $84, $BA, $01
DATA_09B2BC:         db $01, $84, $BA, $01
DATA_09B2C0:         db $01, $84, $BA, $01
DATA_09B2C4:         db $01, $84, $BA, $01
DATA_09B2C8:         db $01, $84, $BA, $01
DATA_09B2CC:         db $01, $84, $BA, $01
DATA_09B2D0:         db $01, $84, $BA, $01
DATA_09B2D4:         db $01, $84, $BA, $01
DATA_09B2D8:         db $01, $84, $BA, $01
DATA_09B2DC:         db $01, $84, $BA, $01
DATA_09B2E0:         db $01, $84, $BA, $01
DATA_09B2E4:         db $01, $84, $BA, $01
DATA_09B2E8:         db $01, $84, $BA, $01
DATA_09B2EC:         db $01, $84, $BA, $01
DATA_09B2F0:         db $01, $84, $BA, $01
DATA_09B2F4:         db $01, $84, $BA, $01
DATA_09B2F8:         db $01, $84, $BA, $01
DATA_09B2FC:         db $01, $84, $BA, $01
DATA_09B300:         db $01, $84, $BA, $01
DATA_09B304:         db $01, $84, $BA, $01
DATA_09B308:         db $01, $84, $BA, $01
DATA_09B30C:         db $01, $84, $BA, $01
DATA_09B310:         db $01, $84, $BA, $01
DATA_09B314:         db $01, $84, $BA, $01
DATA_09B318:         db $01, $84, $BA, $01
DATA_09B31C:         db $01, $84, $BA, $01
DATA_09B320:         db $01, $84, $BA, $01
DATA_09B324:         db $01, $84, $BA, $01
DATA_09B328:         db $01, $84, $BA, $01
DATA_09B32C:         db $01, $84, $BA, $01
DATA_09B330:         db $01, $84, $BA, $01
DATA_09B334:         db $01, $84, $BA, $01
DATA_09B338:         db $01, $84, $BA, $01
DATA_09B33C:         db $01, $84, $BA, $01
DATA_09B340:         db $01, $84, $BA, $01
DATA_09B344:         db $01, $84, $BA, $01
DATA_09B348:         db $01, $84, $BA, $01
DATA_09B34C:         db $01, $84, $BA, $01
DATA_09B350:         db $01, $84, $BA, $01
DATA_09B354:         db $01, $84, $BA, $01
DATA_09B358:         db $01, $84, $BA, $01
DATA_09B35C:         db $01, $84, $BA, $01
DATA_09B360:         db $01, $84, $BA, $01
DATA_09B364:         db $01, $84, $BA, $01
DATA_09B368:         db $01, $84, $BA, $01
DATA_09B36C:         db $01, $84, $BA, $01
DATA_09B370:         db $01, $84, $BA, $01
DATA_09B374:         db $01, $84, $BA, $01
DATA_09B378:         db $01, $84, $BA, $01
DATA_09B37C:         db $01, $84, $BA, $01
DATA_09B380:         db $01, $84, $BA, $01
DATA_09B384:         db $01, $84, $BA, $01
DATA_09B388:         db $01, $84, $BA, $01
DATA_09B38C:         db $01, $84, $BA, $01
DATA_09B390:         db $01, $84, $BA, $01
DATA_09B394:         db $01, $84, $BA, $01
DATA_09B398:         db $01, $84, $BA, $01
DATA_09B39C:         db $01, $84, $BA, $01
DATA_09B3A0:         db $01, $84, $BA, $01
DATA_09B3A4:         db $01, $84, $BA, $01
DATA_09B3A8:         db $01, $84, $BA, $01
DATA_09B3AC:         db $01, $84, $BA, $01
DATA_09B3B0:         db $01, $84, $BA, $01
DATA_09B3B4:         db $01, $84, $BA, $01
DATA_09B3B8:         db $01, $84, $BA, $01
DATA_09B3BC:         db $01, $84, $BA, $01
DATA_09B3C0:         db $01, $84, $BA, $01
DATA_09B3C4:         db $01, $84, $BA, $01
DATA_09B3C8:         db $01, $84, $BA, $01
DATA_09B3CC:         db $01, $84, $BA, $01
DATA_09B3D0:         db $01, $84, $BA, $01
DATA_09B3D4:         db $01, $84, $BA, $01
DATA_09B3D8:         db $01, $84, $BA, $01
DATA_09B3DC:         db $01, $84, $BA, $01
DATA_09B3E0:         db $01, $84, $BA, $01
DATA_09B3E4:         db $01, $84, $BA, $01
DATA_09B3E8:         db $01, $84, $BA, $01
DATA_09B3EC:         db $01, $84, $BA, $01
DATA_09B3F0:         db $01, $84, $BA, $01
DATA_09B3F4:         db $01, $84, $BA, $01
DATA_09B3F8:         db $01, $84, $BA, $01
DATA_09B3FC:         db $01, $84, $BA, $01
DATA_09B400:         db $01, $84, $BA, $01
DATA_09B404:         db $01, $84, $BA, $01
DATA_09B408:         db $01, $84, $BA, $01
DATA_09B40C:         db $01, $84, $BA, $01
DATA_09B410:         db $01, $84, $BA, $01
DATA_09B414:         db $01, $84, $BA, $01
DATA_09B418:         db $01, $84, $BA, $01
DATA_09B41C:         db $01, $84, $BA, $01
DATA_09B420:         db $01, $84, $BA, $01
DATA_09B424:         db $01, $84, $BA, $01
DATA_09B428:         db $01, $84, $BA, $01
DATA_09B42C:         db $01, $84, $BA, $01
DATA_09B430:         db $01, $84, $BA, $01
DATA_09B434:         db $01, $84, $BA, $01
DATA_09B438:         db $01, $84, $BA, $01
DATA_09B43C:         db $01, $84, $BA, $01
DATA_09B440:         db $01, $84, $BA, $01
DATA_09B444:         db $01, $84, $BA, $01
DATA_09B448:         db $01, $84, $BA, $01
DATA_09B44C:         db $01, $84, $BA, $01
DATA_09B450:         db $01, $84, $BA, $01
DATA_09B454:         db $01, $84, $BA, $01
DATA_09B458:         db $01, $84, $BA, $01
DATA_09B45C:         db $01, $84, $BA, $01
DATA_09B460:         db $01, $84, $BA, $01
DATA_09B464:         db $01, $84, $BA, $01
DATA_09B468:         db $01, $84, $BA, $01
DATA_09B46C:         db $01, $84, $BA, $01
DATA_09B470:         db $01, $84, $BA, $01
DATA_09B474:         db $01, $84, $BA, $01
DATA_09B478:         db $01, $84, $BA, $01
DATA_09B47C:         db $01, $84, $BA, $01
DATA_09B480:         db $01, $84, $BA, $01
DATA_09B484:         db $01, $84, $BA, $01
DATA_09B488:         db $01, $84, $BA, $01
DATA_09B48C:         db $01, $84, $BA, $01
DATA_09B490:         db $01, $84, $BA, $01
DATA_09B494:         db $01, $84, $BA, $01
DATA_09B498:         db $01, $84, $BA, $01
DATA_09B49C:         db $01, $84, $BA, $01
DATA_09B4A0:         db $01, $84, $BA, $01
DATA_09B4A4:         db $01, $84, $BA, $01
DATA_09B4A8:         db $01, $84, $BA, $01
DATA_09B4AC:         db $01, $84, $BA, $01
DATA_09B4B0:         db $01, $84, $BA, $01
DATA_09B4B4:         db $01, $84, $BA, $01
DATA_09B4B8:         db $01, $84, $BA, $01
DATA_09B4BC:         db $01, $84, $BA, $01
DATA_09B4C0:         db $01, $84, $BA, $01
DATA_09B4C4:         db $01, $84, $BA, $01
DATA_09B4C8:         db $01, $84, $BA, $01
DATA_09B4CC:         db $01, $84, $BA, $01
DATA_09B4D0:         db $01, $84, $BA, $01
DATA_09B4D4:         db $01, $84, $BA, $01
DATA_09B4D8:         db $01, $84, $BA, $01
DATA_09B4DC:         db $01, $84, $BA, $01
DATA_09B4E0:         db $01, $00, $01

CODE_09B4E3:         lm    r0,(4082)    ;
CODE_09B4E7:         add   r0           ;
CODE_09B4E8:         add   r0           ;
CODE_09B4E9:         lm    r1,(4080)    ;
CODE_09B4ED:         or    r1           ;
CODE_09B4EE:         add   r0           ;
CODE_09B4EF:         add   r0           ;
CODE_09B4F0:         inc   r0           ;
CODE_09B4F1:         to r15             ;
CODE_09B4F2:         add   r15          ;
CODE_09B4F3:         iwt   r15,#B534    ;
CODE_09B4F6:         nop                ;

DATA_09B4F7:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B4FF:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B507:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B50F:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B517:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B51F:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B527:         db $01, $C4, $B5, $01, $01, $C4, $B5, $01
DATA_09B52F:         db $01, $C4, $B5, $01, $01

CODE_09B534:         cache              ;
CODE_09B535:         lm    r0,(4072)    ;
CODE_09B539:         lob                ;
CODE_09B53A:         umult #0C          ;
CODE_09B53C:         iwt   r1,#BD2F     ;
CODE_09B53F:         to r14             ;
CODE_09B540:         add   r1           ;
CODE_09B541:         lm    r0,(4086)    ;
CODE_09B545:         to r2              ;
CODE_09B546:         add   #03          ;
CODE_09B548:         lm    r3,(4084)    ;
CODE_09B54C:         ibt   r12,#000C    ;
CODE_09B54E:         move  r13,r15      ;
CODE_09B550:         move  r1,r3        ;
CODE_09B552:         getb               ;
CODE_09B553:         inc   r14          ;
CODE_09B554:         swap               ;
CODE_09B555:         add   r0           ;
CODE_09B556:         bcc CODE_09B55B    ;
CODE_09B558:         inc   r1           ;
CODE_09B559:         dec   r1           ;
CODE_09B55A:         plot               ;
CODE_09B55B:         add   r0           ;
CODE_09B55C:         bcc CODE_09B561    ;
CODE_09B55E:         inc   r1           ;
CODE_09B55F:         dec   r1           ;
CODE_09B560:         plot               ;
CODE_09B561:         add   r0           ;
CODE_09B562:         bcc CODE_09B567    ;
CODE_09B564:         inc   r1           ;
CODE_09B565:         dec   r1           ;
CODE_09B566:         plot               ;
CODE_09B567:         add   r0           ;
CODE_09B568:         bcc CODE_09B56D    ;
CODE_09B56A:         inc   r1           ;
CODE_09B56B:         dec   r1           ;
CODE_09B56C:         plot               ;
CODE_09B56D:         add   r0           ;
CODE_09B56E:         bcc CODE_09B573    ;
CODE_09B570:         inc   r1           ;
CODE_09B571:         dec   r1           ;
CODE_09B572:         plot               ;
CODE_09B573:         add   r0           ;
CODE_09B574:         bcc CODE_09B579    ;
CODE_09B576:         inc   r1           ;
CODE_09B577:         dec   r1           ;
CODE_09B578:         plot               ;
CODE_09B579:         add   r0           ;
CODE_09B57A:         bcc CODE_09B57F    ;
CODE_09B57C:         inc   r1           ;
CODE_09B57D:         dec   r1           ;
CODE_09B57E:         plot               ;
CODE_09B57F:         add   r0           ;
CODE_09B580:         bcc CODE_09B585    ;
CODE_09B582:         inc   r1           ;
CODE_09B583:         dec   r1           ;
CODE_09B584:         plot               ;
CODE_09B585:         loop               ;
CODE_09B586:         inc   r2           ;
CODE_09B587:         rpix               ;
CODE_09B589:         lm    r0,(407C)    ;
CODE_09B58D:         inc   r0           ;
CODE_09B58E:         sbk                ;
CODE_09B58F:         lm    r0,(4072)    ;
CODE_09B593:         lob                ;
CODE_09B594:         iwt   r1,#BC2F     ;
CODE_09B597:         to r14             ;
CODE_09B598:         add   r1           ;
CODE_09B599:         getb               ;
CODE_09B59A:         to r1              ;
CODE_09B59B:         add   r3           ;
CODE_09B59C:         iwt   r0,#0082     ;
CODE_09B59F:         from r1            ;
CODE_09B5A0:         sub   r0           ;
CODE_09B5A1:         bcc CODE_09B5BC    ;
CODE_09B5A3:         nop                ;
CODE_09B5A4:         ibt   r1,#0000     ;
CODE_09B5A6:         lm    r0,(4086)    ;
CODE_09B5AA:         inc   r0           ;
CODE_09B5AB:         to r2              ;
CODE_09B5AC:         add   #0F          ;
CODE_09B5AE:         iwt   r0,#0040     ;
CODE_09B5B1:         from r2            ;
CODE_09B5B2:         sub   r0           ;
CODE_09B5B3:         bcc CODE_09B5B8    ;
CODE_09B5B5:         nop                ;
CODE_09B5B6:         ibt   r2,#0010     ;
CODE_09B5B8:         sm    (4086),r2    ;
CODE_09B5BC:         sm    (4084),r1    ;
CODE_09B5C0:         iwt   r15,#B09F    ;
CODE_09B5C3:         nop                ;
CODE_09B5C4:         cache              ;
CODE_09B5C5:         lm    r5,(4080)    ;
CODE_09B5C9:         inc   r5           ;
CODE_09B5CA:         lm    r6,(4082)    ;
CODE_09B5CE:         inc   r6           ;
CODE_09B5CF:         lm    r4,(4086)    ;
CODE_09B5D3:         from r6            ;
CODE_09B5D4:         umult #03          ;
CODE_09B5D6:         to r4              ;
CODE_09B5D7:         add   r4           ;
CODE_09B5D8:         lm    r9,(4084)    ;
CODE_09B5DC:         lm    r0,(4072)    ;
CODE_09B5E0:         lob                ;
CODE_09B5E1:         umult #0C          ;
CODE_09B5E3:         iwt   r1,#BD2F     ;
CODE_09B5E6:         to r14             ;
CODE_09B5E7:         add   r1           ;
CODE_09B5E8:         iwt   r13,#B5F5    ;
CODE_09B5EB:         ibt   r11,#000C    ;
CODE_09B5ED:         getb               ;
CODE_09B5EE:         inc   r14          ;
CODE_09B5EF:         to r10             ;
CODE_09B5F0:         swap               ;
CODE_09B5F1:         ibt   r12,#0008    ;
CODE_09B5F3:         ibt   r3,#0000     ;
CODE_09B5F5:         with r10           ;
CODE_09B5F6:         add   r10          ;
CODE_09B5F7:         bcc CODE_09B60D    ;
CODE_09B5F9:         nop                ;
CODE_09B5FA:         from r9            ;
CODE_09B5FB:         to r7              ;
CODE_09B5FC:         add   r3           ;
CODE_09B5FD:         move  r2,r4        ;
CODE_09B5FF:         move  r8,r6        ;
CODE_09B601:         move  r1,r7        ;
CODE_09B603:         move  r0,r5        ;
CODE_09B605:         dec   r0           ;
CODE_09B606:         bne CODE_09B605    ;
CODE_09B608:         plot               ;
CODE_09B609:         dec   r8           ;
CODE_09B60A:         bne CODE_09B601    ;
CODE_09B60C:         inc   r2           ;
CODE_09B60D:         with r3            ;
CODE_09B60E:         add   r5           ;
CODE_09B60F:         loop               ;
CODE_09B610:         nop                ;
CODE_09B611:         with r4            ;
CODE_09B612:         add   r6           ;
CODE_09B613:         dec   r11          ;
CODE_09B614:         bne CODE_09B5ED    ;
CODE_09B616:         nop                ;
CODE_09B617:         rpix               ;
CODE_09B619:         lm    r0,(407C)    ;
CODE_09B61D:         inc   r0           ;
CODE_09B61E:         sbk                ;
CODE_09B61F:         lm    r0,(4072)    ;
CODE_09B623:         lob                ;
CODE_09B624:         iwt   r1,#BC2F     ;
CODE_09B627:         to r14             ;
CODE_09B628:         add   r1           ;
CODE_09B629:         getb               ;
CODE_09B62A:         umult r5           ;
CODE_09B62C:         to r1              ;
CODE_09B62D:         add   r9           ;
CODE_09B62E:         iwt   r0,#0082     ;
CODE_09B631:         from r1            ;
CODE_09B632:         sub   r0           ;
CODE_09B633:         bcc CODE_09B64F    ;
CODE_09B635:         nop                ;
CODE_09B636:         ibt   r1,#0000     ;
CODE_09B638:         lm    r0,(4086)    ;
CODE_09B63C:         ibt   r2,#0010     ;
CODE_09B63E:         with r2            ;
CODE_09B63F:         umult r6           ;
CODE_09B641:         iwt   r0,#0040     ;
CODE_09B644:         from r2            ;
CODE_09B645:         sub   r0           ;
CODE_09B646:         bcc CODE_09B64B    ;
CODE_09B648:         nop                ;
CODE_09B649:         ibt   r2,#0010     ;
CODE_09B64B:         sm    (4086),r2    ;
CODE_09B64F:         sm    (4084),r1    ;
CODE_09B653:         iwt   r15,#B09F    ;
CODE_09B656:         nop                ;
CODE_09B657:         iwt   r1,#4E00     ;
CODE_09B65A:         iwt   r12,#0500    ;
CODE_09B65D:         bra CODE_09B684    ;

CODE_09B65F:         nop                ;

CODE_09B660:         iwt   r1,#4E00     ;
CODE_09B663:         iwt   r12,#0100    ;
CODE_09B666:         bra CODE_09B684    ;

CODE_09B668:         nop                ;

CODE_09B669:         iwt   r1,#5000     ;
CODE_09B66C:         iwt   r12,#0100    ;
CODE_09B66F:         bra CODE_09B684    ;

CODE_09B671:         nop                ;

CODE_09B672:         iwt   r1,#5200     ;
CODE_09B675:         iwt   r12,#0100    ;
CODE_09B678:         bra CODE_09B684    ;

CODE_09B67A:         nop                ;

CODE_09B67B:         iwt   r1,#5400     ;
CODE_09B67E:         iwt   r12,#0100    ;
CODE_09B681:         bra CODE_09B684    ;

CODE_09B683:         nop                ;

CODE_09B684:         iwt   r0,#00FF     ;
CODE_09B687:         move  r13,r15      ;
CODE_09B689:         stw   (r1)         ;
CODE_09B68A:         inc   r1           ;
CODE_09B68B:         loop               ;
CODE_09B68C:         inc   r1           ;
CODE_09B68D:         iwt   r15,#BA8E    ;
CODE_09B690:         nop                ;
CODE_09B691:         ibt   r0,#0000     ;
CODE_09B693:         sm    (4084),r0    ;
CODE_09B697:         ibt   r0,#0010     ;
CODE_09B699:         sm    (4086),r0    ;
CODE_09B69D:         iwt   r15,#BA8E    ;
CODE_09B6A0:         nop                ;
CODE_09B6A1:         ibt   r0,#0000     ;
CODE_09B6A3:         sm    (4084),r0    ;
CODE_09B6A7:         ibt   r0,#0020     ;
CODE_09B6A9:         sm    (4086),r0    ;
CODE_09B6AD:         iwt   r15,#BA8E    ;
CODE_09B6B0:         nop                ;
CODE_09B6B1:         ibt   r0,#0000     ;
CODE_09B6B3:         sm    (4084),r0    ;
CODE_09B6B7:         ibt   r0,#0030     ;
CODE_09B6B9:         sm    (4086),r0    ;
CODE_09B6BD:         iwt   r15,#BA8E    ;
CODE_09B6C0:         nop                ;
CODE_09B6C1:         ibt   r0,#0000     ;
CODE_09B6C3:         sm    (4084),r0    ;
CODE_09B6C7:         ibt   r0,#0040     ;
CODE_09B6C9:         sm    (4086),r0    ;
CODE_09B6CD:         iwt   r15,#BA8E    ;
CODE_09B6D0:         nop                ;
CODE_09B6D1:         lm    r0,(4086)    ;
CODE_09B6D5:         ibt   r1,#0040     ;
CODE_09B6D7:         inc   r0           ;
CODE_09B6D8:         add   #0F          ;
CODE_09B6DA:         cmp   r1           ;
CODE_09B6DC:         bcc CODE_09B6E1    ;
CODE_09B6DE:         nop                ;
CODE_09B6DF:         ibt   r0,#0010     ;
CODE_09B6E1:         sbk                ;
CODE_09B6E2:         iwt   r15,#BA8E    ;
CODE_09B6E5:         nop                ;
CODE_09B6E6:         iwt   r0,#04C0     ;
CODE_09B6E9:         lm    r1,(4076)    ;
CODE_09B6ED:         and   r1           ;
CODE_09B6EE:         beq CODE_09B6F6    ;
CODE_09B6F0:         nop                ;
CODE_09B6F1:         ibt   r0,#005C     ;
CODE_09B6F3:         sms   (007A),r0    ;
CODE_09B6F6:         iwt   r0,#04C0     ;
CODE_09B6F9:         lm    r1,(4076)    ;
CODE_09B6FD:         and   r1           ;
CODE_09B6FE:         beq CODE_09B708    ;
CODE_09B700:         nop                ;
CODE_09B701:         lm    r0,(407C)    ;
CODE_09B705:         inc   r0           ;
CODE_09B706:         inc   r0           ;
CODE_09B707:         sbk                ;
CODE_09B708:         iwt   r15,#B4E1    ;
CODE_09B70B:         nop                ;
CODE_09B70C:         iwt   r1,#5600     ;
CODE_09B70F:         iwt   r12,#0100    ;
CODE_09B712:         iwt   r0,#00FF     ;
CODE_09B715:         move  r13,r15      ;
CODE_09B717:         stw   (r1)         ;
CODE_09B718:         inc   r1           ;
CODE_09B719:         loop               ;
CODE_09B71A:         inc   r1           ;
CODE_09B71B:         ibt   r0,#0000     ;
CODE_09B71D:         sm    (4084),r0    ;
CODE_09B721:         ibt   r0,#0050     ;
CODE_09B723:         sm    (4086),r0    ;
CODE_09B727:         iwt   r15,#BA8E    ;
CODE_09B72A:         nop                ;
CODE_09B72B:         iwt   r12,#0100    ;
CODE_09B72E:         iwt   r1,#4E00     ;
CODE_09B731:         iwt   r2,#5000     ;
CODE_09B734:         iwt   r3,#5200     ;
CODE_09B737:         iwt   r4,#5400     ;
CODE_09B73A:         iwt   r5,#00FF     ;
CODE_09B73D:         move  r13,r15      ;
CODE_09B73F:         ldw   (r2)         ;
CODE_09B740:         stw   (r1)         ;
CODE_09B741:         inc   r1           ;
CODE_09B742:         inc   r1           ;
CODE_09B743:         ldw   (r3)         ;
CODE_09B744:         stw   (r2)         ;
CODE_09B745:         inc   r2           ;
CODE_09B746:         inc   r2           ;
CODE_09B747:         ldw   (r4)         ;
CODE_09B748:         stw   (r3)         ;
CODE_09B749:         inc   r3           ;
CODE_09B74A:         inc   r3           ;
CODE_09B74B:         from r5            ;
CODE_09B74C:         stw   (r4)         ;
CODE_09B74D:         inc   r4           ;
CODE_09B74E:         loop               ;
CODE_09B74F:         inc   r4           ;
CODE_09B750:         iwt   r15,#BA8E    ;
CODE_09B753:         nop                ;
CODE_09B754:         iwt   r0,#0001     ;
CODE_09B757:         iwt   r15,#B76D    ;
CODE_09B75A:         nop                ;
CODE_09B75B:         ibt   r0,#0002     ;
CODE_09B75D:         iwt   r15,#B76D    ;
CODE_09B760:         nop                ;
CODE_09B761:         ibt   r0,#0003     ;
CODE_09B763:         iwt   r15,#B76D    ;
CODE_09B766:         nop                ;
CODE_09B767:         ibt   r0,#0004     ;
CODE_09B769:         iwt   r15,#B76D    ;
CODE_09B76C:         nop                ;
CODE_09B76D:         adc   r0           ;
CODE_09B76F:         iwt   r1,#4E00     ;
CODE_09B772:         move  r2,r1        ;
CODE_09B774:         to r2              ;
CODE_09B775:         adc   r2           ;
CODE_09B777:         ibt   r5,#0010     ;
CODE_09B779:         iwt   r6,#5800     ;
CODE_09B77C:         iwt   r13,#B785    ;
CODE_09B77F:         move  r12,r5       ;
CODE_09B781:         move  r4,r2        ;
CODE_09B783:         move  r3,r1        ;
CODE_09B785:         ldw   (r4)         ;
CODE_09B786:         stw   (r3)         ;
CODE_09B787:         with r4            ;
CODE_09B788:         adc   r5           ;
CODE_09B78A:         with r3            ;
CODE_09B78B:         adc   r5           ;
CODE_09B78D:         loop               ;
CODE_09B78E:         nop                ;
CODE_09B78F:         inc   r2           ;
CODE_09B790:         inc   r2           ;
CODE_09B791:         from r5            ;
CODE_09B792:         and   r2           ;
CODE_09B793:         beq CODE_09B7A0    ;
CODE_09B795:         nop                ;
CODE_09B796:         iwt   r0,#FF00     ;
CODE_09B799:         and   r2           ;
CODE_09B79A:         iwt   r2,#0100     ;
CODE_09B79D:         to r2              ;
CODE_09B79E:         adc   r2           ;
CODE_09B7A0:         inc   r1           ;
CODE_09B7A1:         inc   r1           ;
CODE_09B7A2:         from r5            ;
CODE_09B7A3:         and   r1           ;
CODE_09B7A4:         beq CODE_09B7B1    ;
CODE_09B7A6:         nop                ;
CODE_09B7A7:         iwt   r0,#FF00     ;
CODE_09B7AA:         and   r1           ;
CODE_09B7AB:         iwt   r1,#0100     ;
CODE_09B7AE:         to r1              ;
CODE_09B7AF:         adc   r1           ;
CODE_09B7B1:         from r1            ;
CODE_09B7B2:         cmp   r6           ;
CODE_09B7B4:         bcc CODE_09B77F    ;
CODE_09B7B6:         nop                ;
CODE_09B7B7:         lm    r0,(407C)    ;
CODE_09B7BB:         inc   r0           ;
CODE_09B7BC:         inc   r0           ;
CODE_09B7BD:         sbk                ;
CODE_09B7BE:         iwt   r15,#B4E1    ;
CODE_09B7C1:         nop                ;
CODE_09B7C2:         ibt   r0,#0000     ;
CODE_09B7C4:         sm    (4080),r0    ;
CODE_09B7C8:         sm    (4082),r0    ;
CODE_09B7CC:         iwt   r15,#BA8E    ;
CODE_09B7CF:         nop                ;
CODE_09B7D0:         ibt   r0,#0001     ;
CODE_09B7D2:         sm    (4080),r0    ;
CODE_09B7D6:         sm    (4082),r0    ;
CODE_09B7DA:         iwt   r15,#BA8E    ;
CODE_09B7DD:         nop                ;
CODE_09B7DE:         ibt   r0,#0002     ;
CODE_09B7E0:         sm    (4080),r0    ;
CODE_09B7E4:         sm    (4082),r0    ;
CODE_09B7E8:         iwt   r15,#BA8E    ;
CODE_09B7EB:         nop                ;
CODE_09B7EC:         ibt   r0,#0003     ;
CODE_09B7EE:         sm    (4080),r0    ;
CODE_09B7F2:         sm    (4082),r0    ;
CODE_09B7F6:         iwt   r15,#BA8E    ;
CODE_09B7F9:         nop                ;
CODE_09B7FA:         ibt   r0,#0000     ;
CODE_09B7FC:         sm    (4082),r0    ;
CODE_09B800:         iwt   r15,#BA8E    ;
CODE_09B803:         nop                ;
CODE_09B804:         ibt   r0,#0001     ;
CODE_09B806:         sm    (4082),r0    ;
CODE_09B80A:         iwt   r15,#BA8E    ;
CODE_09B80D:         nop                ;
CODE_09B80E:         ibt   r0,#0002     ;
CODE_09B810:         sm    (4082),r0    ;
CODE_09B814:         iwt   r15,#BA8E    ;
CODE_09B817:         nop                ;
CODE_09B818:         ibt   r0,#0003     ;
CODE_09B81A:         sm    (4082),r0    ;
CODE_09B81E:         iwt   r15,#BA8E    ;
CODE_09B821:         nop                ;
CODE_09B822:         ibt   r0,#0000     ;
CODE_09B824:         sm    (4080),r0    ;
CODE_09B828:         iwt   r15,#BA8E    ;
CODE_09B82B:         nop                ;
CODE_09B82C:         ibt   r0,#0001     ;
CODE_09B82E:         sm    (4080),r0    ;
CODE_09B832:         iwt   r15,#BA8E    ;
CODE_09B835:         nop                ;
CODE_09B836:         ibt   r0,#0002     ;
CODE_09B838:         sm    (4080),r0    ;
CODE_09B83C:         iwt   r15,#BA8E    ;
CODE_09B83F:         nop                ;
CODE_09B840:         ibt   r0,#0003     ;
CODE_09B842:         sm    (4080),r0    ;
CODE_09B846:         iwt   r15,#BA8E    ;
CODE_09B849:         nop                ;
CODE_09B84A:         iwt   r6,#00A0     ;
CODE_09B84D:         iwt   r5,#00D0     ;
CODE_09B850:         ibt   r1,#0064     ;
CODE_09B852:         ibt   r2,#000A     ;
CODE_09B854:         ibt   r3,#0000     ;
CODE_09B856:         ibt   r4,#0000     ;
CODE_09B858:         lm    r0,(409A)    ;
CODE_09B85C:         sub   r1           ;
CODE_09B85D:         bpl CODE_09B85C    ;
CODE_09B85F:         inc   r3           ;
CODE_09B860:         add   r1           ;
CODE_09B861:         dec   r3           ;
CODE_09B862:         beq CODE_09B868    ;
CODE_09B864:         nop                ;
CODE_09B865:         from r6            ;
CODE_09B866:         to r5              ;
CODE_09B867:         add   r3           ;
CODE_09B868:         sub   r2           ;
CODE_09B869:         bpl CODE_09B868    ;
CODE_09B86B:         inc   r4           ;
CODE_09B86C:         dec   r4           ;
CODE_09B86D:         add   r2           ;
CODE_09B86E:         swap               ;
CODE_09B86F:         or    r4           ;
CODE_09B870:         sm    (409C),r0    ;
CODE_09B874:         bra CODE_09B89B    ;

CODE_09B876:         nop                ;

CODE_09B877:         lm    r0,(409C)    ;
CODE_09B87B:         iwt   r4,#00A0     ;
CODE_09B87E:         iwt   r5,#00D0     ;
CODE_09B881:         lm    r1,(409A)    ;
CODE_09B885:         ibt   r2,#000A     ;
CODE_09B887:         from r1            ;
CODE_09B888:         cmp   r2           ;
CODE_09B88A:         bcc CODE_09B89B    ;
CODE_09B88C:         to r5              ;
CODE_09B88D:         add   r4           ;
CODE_09B88E:         bra CODE_09B89B    ;

CODE_09B890:         nop                ;

CODE_09B891:         lm    r0,(409C)    ;
CODE_09B895:         hib                ;
CODE_09B896:         iwt   r4,#00A0     ;
CODE_09B899:         to r5              ;
CODE_09B89A:         add   r4           ;
CODE_09B89B:         sm    (4072),r5    ;
CODE_09B89F:         lm    r0,(407C)    ;
CODE_09B8A3:         inc   r0           ;
CODE_09B8A4:         sm    (407C),r0    ;
CODE_09B8A8:         iwt   r15,#B4E3    ;
CODE_09B8AB:         nop                ;
CODE_09B8AC:         iwt   r15,#B4E1    ;
CODE_09B8AF:         nop                ;

DATA_09B8B0:         dw $4007, $2002

DATA_09B8B4:         dw $4034, $3002

DATA_09B8B8:         dw $0802, $0401

CODE_09B8BC:         lm    r1,(4076)    ;
CODE_09B8C0:         with r1            ;
CODE_09B8C1:         swap               ;
CODE_09B8C2:         iwt   r0,#C0C0     ;
CODE_09B8C5:         and   r1           ;
CODE_09B8C6:         beq CODE_09B8EA    ;
CODE_09B8C8:         nop                ;
CODE_09B8C9:         ibt   r1,#0043     ;
CODE_09B8CB:         lm    r0,(4094)    ;
CODE_09B8CF:         and   #01          ;
CODE_09B8D1:         beq CODE_09B8DC    ;
CODE_09B8D3:         nop                ;
CODE_09B8D4:         ibt   r1,#002E     ;
CODE_09B8D6:         ibt   r0,#0002     ;
CODE_09B8D8:         sm    (406E),r0    ;
CODE_09B8DC:         sms   (007A),r1    ;
CODE_09B8DF:         lm    r0,(407C)    ;
CODE_09B8E3:         inc   r0           ;
CODE_09B8E4:         inc   r0           ;
CODE_09B8E5:         sbk                ;
CODE_09B8E6:         iwt   r15,#B4E1    ;
CODE_09B8E9:         nop                ;
CODE_09B8EA:         lm    r0,(4072)    ;
CODE_09B8EE:         swap               ;
CODE_09B8EF:         and   #01          ;
CODE_09B8F1:         iwt   r14,#B8B8    ;
CODE_09B8F4:         to r14             ;
CODE_09B8F5:         add   r14          ;
CODE_09B8F6:         getb               ;
CODE_09B8F7:         and   r1           ;
CODE_09B8F8:         beq CODE_09B95A    ;
CODE_09B8FA:         nop                ;
CODE_09B8FB:         ibt   r0,#005C     ;
CODE_09B8FD:         sms   (007A),r0    ;
CODE_09B900:         ibt   r0,#0000     ;
CODE_09B902:         sm    (4094),r0    ;
CODE_09B906:         iwt   r0,#00D4     ;
CODE_09B909:         sm    (4090),r0    ;
CODE_09B90D:         lm    r0,(4072)    ;
CODE_09B911:         swap               ;
CODE_09B912:         and   #01          ;
CODE_09B914:         add   r0           ;
CODE_09B915:         iwt   r14,#B8B0    ;
CODE_09B918:         to r14             ;
CODE_09B919:         add   r14          ;
CODE_09B91A:         getb               ;
CODE_09B91B:         sm    (408C),r0    ;
CODE_09B91F:         inc   r14          ;
CODE_09B920:         getb               ;
CODE_09B921:         sm    (408E),r0    ;
CODE_09B925:         iwt   r0,#B930     ;
CODE_09B928:         sm    (4092),r0    ;
CODE_09B92C:         iwt   r15,#BA9B    ;
CODE_09B92F:         nop                ;

CODE_09B930:         iwt   r0,#00D0     ;
CODE_09B933:         sm    (4090),r0    ;
CODE_09B937:         lm    r0,(4072)    ;
CODE_09B93B:         swap               ;
CODE_09B93C:         and   #01          ;
CODE_09B93E:         add   r0           ;
CODE_09B93F:         iwt   r14,#B8B4    ;
CODE_09B942:         to r14             ;
CODE_09B943:         add   r14          ;
CODE_09B944:         getb               ;
CODE_09B945:         sm    (408C),r0    ;
CODE_09B949:         inc   r14          ;
CODE_09B94A:         getb               ;
CODE_09B94B:         sm    (408E),r0    ;
CODE_09B94F:         iwt   r0,#B4E1     ;
CODE_09B952:         sm    (4092),r0    ;
CODE_09B956:         iwt   r15,#BA9B    ;
CODE_09B959:         nop                ;
CODE_09B95A:         lm    r0,(4072)    ;
CODE_09B95E:         swap               ;
CODE_09B95F:         and   #01          ;
CODE_09B961:         iwt   r14,#B8BA    ;
CODE_09B964:         to r14             ;
CODE_09B965:         add   r14          ;
CODE_09B966:         getb               ;
CODE_09B967:         and   r1           ;
CODE_09B968:         beq CODE_09B9CA    ;
CODE_09B96A:         nop                ;
CODE_09B96B:         ibt   r0,#005C     ;
CODE_09B96D:         sms   (007A),r0    ;
CODE_09B970:         ibt   r0,#0001     ;
CODE_09B972:         sm    (4094),r0    ;
CODE_09B976:         iwt   r0,#00D4     ;
CODE_09B979:         sm    (4090),r0    ;
CODE_09B97D:         lm    r0,(4072)    ;
CODE_09B981:         swap               ;
CODE_09B982:         and   #01          ;
CODE_09B984:         add   r0           ;
CODE_09B985:         iwt   r14,#B8B4    ;
CODE_09B988:         to r14             ;
CODE_09B989:         add   r14          ;
CODE_09B98A:         getb               ;
CODE_09B98B:         sm    (408C),r0    ;
CODE_09B98F:         inc   r14          ;
CODE_09B990:         getb               ;
CODE_09B991:         sm    (408E),r0    ;
CODE_09B995:         iwt   r0,#B9A0     ;
CODE_09B998:         sm    (4092),r0    ;
CODE_09B99C:         iwt   r15,#BA9B    ;
CODE_09B99F:         nop                ;
CODE_09B9A0:         iwt   r0,#00D0     ;
CODE_09B9A3:         sm    (4090),r0    ;
CODE_09B9A7:         lm    r0,(4072)    ;
CODE_09B9AB:         swap               ;
CODE_09B9AC:         and   #01          ;
CODE_09B9AE:         add   r0           ;
CODE_09B9AF:         iwt   r14,#B8B0    ;
CODE_09B9B2:         to r14             ;
CODE_09B9B3:         add   r14          ;
CODE_09B9B4:         getb               ;
CODE_09B9B5:         sm    (408C),r0    ;
CODE_09B9B9:         inc   r14          ;
CODE_09B9BA:         getb               ;
CODE_09B9BB:         sm    (408E),r0    ;
CODE_09B9BF:         iwt   r0,#B4E1     ;
CODE_09B9C2:         sm    (4092),r0    ;
CODE_09B9C6:         iwt   r15,#BA9B    ;
CODE_09B9C9:         nop                ;
CODE_09B9CA:         iwt   r15,#B4E1    ;
CODE_09B9CD:         nop                ;
CODE_09B9CE:         lm    r0,(4076)    ;
CODE_09B9D2:         iwt   r1,#C0C0     ;
CODE_09B9D5:         and   r1           ;
CODE_09B9D6:         beq CODE_09B9EC    ;
CODE_09B9D8:         nop                ;
CODE_09B9D9:         lm    r0,(4094)    ;
CODE_09B9DD:         and   #01          ;
CODE_09B9DF:         beq CODE_09B9EC    ;
CODE_09B9E1:         nop                ;
CODE_09B9E2:         lm    r0,(0082)    ;
CODE_09B9E6:         xor   #02          ;
CODE_09B9E8:         sm    (0082),r0    ;
CODE_09B9EC:         iwt   r15,#B8BC    ;
CODE_09B9EF:         nop                ;
CODE_09B9F0:         iwt   r15,#B4E1    ;
CODE_09B9F3:         nop                ;
CODE_09B9F4:         cache              ;
CODE_09B9F5:         lm    r0,(4098)    ;
CODE_09B9F9:         romb               ;
CODE_09B9FB:         lm    r0,(407C)    ;
CODE_09B9FF:         to r14             ;
CODE_09BA00:         add   #02          ;
CODE_09BA02:         getb               ;
CODE_09BA03:         inc   r14          ;
CODE_09BA04:         lsr                ;
CODE_09BA05:         lsr                ;
CODE_09BA06:         lsr                ;
CODE_09BA07:         move  r11,r0       ;
CODE_09BA09:         move  r10,r0       ;
CODE_09BA0B:         getb               ;
CODE_09BA0C:         inc   r14          ;
CODE_09BA0D:         getbh              ;
CODE_09BA0F:         inc   r14          ;
CODE_09BA10:         add   r0           ;
CODE_09BA11:         add   r0           ;
CODE_09BA12:         add   r0           ;
CODE_09BA13:         to r9              ;
CODE_09BA14:         add   r0           ;
CODE_09BA15:         getb               ;
CODE_09BA16:         inc   r14          ;
CODE_09BA17:         add   #07          ;
CODE_09BA19:         lsr                ;
CODE_09BA1A:         lsr                ;
CODE_09BA1B:         to r8              ;
CODE_09BA1C:         lsr                ;
CODE_09BA1D:         to r7              ;
CODE_09BA1E:         getb               ;
CODE_09BA1F:         inc   r14          ;
CODE_09BA20:         to r3              ;
CODE_09BA21:         getb               ;
CODE_09BA22:         inc   r14          ;
CODE_09BA23:         getb               ;
CODE_09BA24:         to r2              ;
CODE_09BA25:         add   #0F          ;
CODE_09BA27:         inc   r1           ;
CODE_09BA28:         ibt   r0,#0009     ;
CODE_09BA2A:         romb               ;
CODE_09BA2C:         move  r1,r3        ;
CODE_09BA2E:         move  r11,r10      ;
CODE_09BA30:         move  r12,r8       ;
CODE_09BA32:         move  r13,r15      ;
CODE_09BA34:         iwt   r0,#C92F     ;
CODE_09BA37:         add   r9           ;
CODE_09BA38:         to r14             ;
CODE_09BA39:         add   r11          ;
CODE_09BA3A:         getbh              ;
CODE_09BA3C:         add   r0           ;
CODE_09BA3D:         bcc CODE_09BA42    ;
CODE_09BA3F:         inc   r1           ;
CODE_09BA40:         dec   r1           ;
CODE_09BA41:         plot               ;
CODE_09BA42:         add   r0           ;
CODE_09BA43:         bcc CODE_09BA48    ;
CODE_09BA45:         inc   r1           ;
CODE_09BA46:         dec   r1           ;
CODE_09BA47:         plot               ;
CODE_09BA48:         add   r0           ;
CODE_09BA49:         bcc CODE_09BA4E    ;
CODE_09BA4B:         inc   r1           ;
CODE_09BA4C:         dec   r1           ;
CODE_09BA4D:         plot               ;
CODE_09BA4E:         add   r0           ;
CODE_09BA4F:         bcc CODE_09BA54    ;
CODE_09BA51:         inc   r1           ;
CODE_09BA52:         dec   r1           ;
CODE_09BA53:         plot               ;
CODE_09BA54:         add   r0           ;
CODE_09BA55:         bcc CODE_09BA5A    ;
CODE_09BA57:         inc   r1           ;
CODE_09BA58:         dec   r1           ;
CODE_09BA59:         plot               ;
CODE_09BA5A:         add   r0           ;
CODE_09BA5B:         bcc CODE_09BA60    ;
CODE_09BA5D:         inc   r1           ;
CODE_09BA5E:         dec   r1           ;
CODE_09BA5F:         plot               ;
CODE_09BA60:         add   r0           ;
CODE_09BA61:         bcc CODE_09BA66    ;
CODE_09BA63:         inc   r1           ;
CODE_09BA64:         dec   r1           ;
CODE_09BA65:         plot               ;
CODE_09BA66:         add   r0           ;
CODE_09BA67:         bcc CODE_09BA6C    ;
CODE_09BA69:         inc   r1           ;
CODE_09BA6A:         dec   r1           ;
CODE_09BA6B:         plot               ;
CODE_09BA6C:         loop               ;
CODE_09BA6D:         inc   r11          ;
CODE_09BA6E:         with r9            ;
CODE_09BA6F:         add   #0F          ;
CODE_09BA71:         inc   r9           ;
CODE_09BA72:         dec   r7           ;
CODE_09BA73:         bne CODE_09BA2C    ;
CODE_09BA75:         inc   r2           ;
CODE_09BA76:         lm    r0,(407C)    ;
CODE_09BA7A:         add   #09          ;
CODE_09BA7C:         sm    (407C),r0    ;
CODE_09BA80:         iwt   r15,#B4E1    ;
CODE_09BA83:         nop                ;
CODE_09BA84:         ibt   r0,#0002     ;
CODE_09BA86:         sm    (406E),r0    ;
CODE_09BA8A:         iwt   r15,#BA99    ;
CODE_09BA8D:         nop                ;
CODE_09BA8E:         lm    r0,(407C)    ;
CODE_09BA92:         inc   r0           ;
CODE_09BA93:         inc   r0           ;
CODE_09BA94:         sbk                ;
CODE_09BA95:         iwt   r15,#B09F    ;
CODE_09BA98:         nop                ;
CODE_09BA99:         stop               ;
CODE_09BA9A:         nop                ;

CODE_09BA9B:         ibt   r0,#0001     ;
CODE_09BA9D:         color              ;
CODE_09BA9E:         lm    r8,(408C)    ;
CODE_09BAA2:         lm    r2,(408E)    ;
CODE_09BAA6:         ibt   r0,#000A     ;
CODE_09BAA8:         lm    r1,(4080)    ;
CODE_09BAAC:         inc   r1           ;
CODE_09BAAD:         to r6              ;
CODE_09BAAE:         mult  r1           ;
CODE_09BAAF:         ibt   r0,#0010     ;
CODE_09BAB1:         lm    r1,(4082)    ;
CODE_09BAB5:         inc   r1           ;
CODE_09BAB6:         to r7              ;
CODE_09BAB7:         mult  r1           ;
CODE_09BAB8:         move  r1,r8        ;
CODE_09BABA:         move  r12,r6       ;
CODE_09BABC:         move  r13,r15      ;
CODE_09BABE:         loop               ;
CODE_09BABF:         plot               ;
CODE_09BAC0:         dec   r7           ;
CODE_09BAC1:         bne CODE_09BAB8    ;
CODE_09BAC3:         inc   r2           ;
CODE_09BAC4:         ibt   r0,#0003     ;
CODE_09BAC6:         color              ;
CODE_09BAC7:         lm    r0,(4082)    ;
CODE_09BACB:         add   r0           ;
CODE_09BACC:         add   r0           ;
CODE_09BACD:         lm    r1,(4080)    ;
CODE_09BAD1:         or    r1           ;
CODE_09BAD2:         add   r0           ;
CODE_09BAD3:         add   r0           ;
CODE_09BAD4:         inc   r0           ;
CODE_09BAD5:         to r15             ;
CODE_09BAD6:         add   r15          ;
CODE_09BAD7:         iwt   r15,#BB18    ;
CODE_09BADA:         nop                ;

DATA_09BADB:         db $01, $A2, $BB, $01
DATA_09BADF:         db $01, $A2, $BB, $01
DATA_09BAE3:         db $01, $A2, $BB, $01
DATA_09BAE7:         db $01, $A2, $BB, $01
DATA_09BAEB:         db $01, $A2, $BB, $01
DATA_09BAEF:         db $01, $A2, $BB, $01
DATA_09BAF3:         db $01, $A2, $BB, $01
DATA_09BAF7:         db $01, $A2, $BB, $01
DATA_09BAFB:         db $01, $A2, $BB, $01
DATA_09BAFF:         db $01, $A2, $BB, $01
DATA_09BB03:         db $01, $A2, $BB, $01
DATA_09BB07:         db $01, $A2, $BB, $01
DATA_09BB0B:         db $01, $A2, $BB, $01
DATA_09BB0F:         db $01, $A2, $BB, $01
DATA_09BB13:         db $01, $A2, $BB, $01
DATA_09BB17:         db $01

CODE_09BB18:         lm    r0,(4090)    ;
CODE_09BB1C:         lob                ;
CODE_09BB1D:         umult #0C          ;
CODE_09BB1F:         iwt   r1,#BD2F     ;
CODE_09BB22:         to r14             ;
CODE_09BB23:         add   r1           ;
CODE_09BB24:         lm    r0,(408E)    ;
CODE_09BB28:         to r2              ;
CODE_09BB29:         add   #03          ;
CODE_09BB2B:         lm    r3,(408C)    ;
CODE_09BB2F:         ibt   r12,#000C    ;
CODE_09BB31:         move  r13,r15      ;
CODE_09BB33:         move  r1,r3        ;
CODE_09BB35:         getb               ;
CODE_09BB36:         inc   r14          ;
CODE_09BB37:         swap               ;
CODE_09BB38:         add   r0           ;
CODE_09BB39:         bcc CODE_09BB3E    ;
CODE_09BB3B:         inc   r1           ;
CODE_09BB3C:         dec   r1           ;
CODE_09BB3D:         plot               ;
CODE_09BB3E:         add   r0           ;
CODE_09BB3F:         bcc CODE_09BB44    ;
CODE_09BB41:         inc   r1           ;
CODE_09BB42:         dec   r1           ;
CODE_09BB43:         plot               ;
CODE_09BB44:         add   r0           ;
CODE_09BB45:         bcc CODE_09BB4A    ;
CODE_09BB47:         inc   r1           ;
CODE_09BB48:         dec   r1           ;
CODE_09BB49:         plot               ;
CODE_09BB4A:         add   r0           ;
CODE_09BB4B:         bcc CODE_09BB50    ;
CODE_09BB4D:         inc   r1           ;
CODE_09BB4E:         dec   r1           ;
CODE_09BB4F:         plot               ;
CODE_09BB50:         add   r0           ;
CODE_09BB51:         bcc CODE_09BB56    ;
CODE_09BB53:         inc   r1           ;
CODE_09BB54:         dec   r1           ;
CODE_09BB55:         plot               ;
CODE_09BB56:         add   r0           ;
CODE_09BB57:         bcc CODE_09BB5C    ;
CODE_09BB59:         inc   r1           ;
CODE_09BB5A:         dec   r1           ;
CODE_09BB5B:         plot               ;
CODE_09BB5C:         add   r0           ;
CODE_09BB5D:         bcc CODE_09BB62    ;
CODE_09BB5F:         inc   r1           ;
CODE_09BB60:         dec   r1           ;
CODE_09BB61:         plot               ;
CODE_09BB62:         add   r0           ;
CODE_09BB63:         bcc CODE_09BB68    ;
CODE_09BB65:         inc   r1           ;
CODE_09BB66:         dec   r1           ;
CODE_09BB67:         plot               ;
CODE_09BB68:         loop               ;
CODE_09BB69:         inc   r2           ;
CODE_09BB6A:         rpix               ;
CODE_09BB6C:         lm    r0,(4090)    ;
CODE_09BB70:         lob                ;
CODE_09BB71:         iwt   r1,#BC2F     ;
CODE_09BB74:         to r14             ;
CODE_09BB75:         add   r1           ;
CODE_09BB76:         getb               ;
CODE_09BB77:         to r1              ;
CODE_09BB78:         add   r3           ;
CODE_09BB79:         iwt   r0,#0082     ;
CODE_09BB7C:         from r1            ;
CODE_09BB7D:         sub   r0           ;
CODE_09BB7E:         bcc CODE_09BB99    ;
CODE_09BB80:         nop                ;
CODE_09BB81:         ibt   r1,#0000     ;
CODE_09BB83:         lm    r0,(4086)    ;
CODE_09BB87:         inc   r0           ;
CODE_09BB88:         to r2              ;
CODE_09BB89:         add   #0F          ;
CODE_09BB8B:         iwt   r0,#0040     ;
CODE_09BB8E:         from r2            ;
CODE_09BB8F:         sub   r0           ;
CODE_09BB90:         bcc CODE_09BB95    ;
CODE_09BB92:         nop                ;
CODE_09BB93:         ibt   r2,#0010     ;
CODE_09BB95:         sm    (4086),r2    ;
CODE_09BB99:         sm    (4084),r1    ;
CODE_09BB9D:         lm    r15,(4092)   ;
CODE_09BBA1:         nop                ;
CODE_09BBA2:         lm    r5,(4080)    ;
CODE_09BBA6:         inc   r5           ;
CODE_09BBA7:         lm    r6,(4082)    ;
CODE_09BBAB:         inc   r6           ;
CODE_09BBAC:         lm    r4,(408E)    ;
CODE_09BBB0:         from r6            ;
CODE_09BBB1:         umult #03          ;
CODE_09BBB3:         to r4              ;
CODE_09BBB4:         add   r4           ;
CODE_09BBB5:         lm    r9,(408C)    ;
CODE_09BBB9:         lm    r0,(4090)    ;
CODE_09BBBD:         lob                ;
CODE_09BBBE:         umult #0C          ;
CODE_09BBC0:         iwt   r1,#BD2F     ;
CODE_09BBC3:         to r14             ;
CODE_09BBC4:         add   r1           ;
CODE_09BBC5:         iwt   r13,#BBD2    ;
CODE_09BBC8:         ibt   r11,#000C    ;
CODE_09BBCA:         getb               ;
CODE_09BBCB:         inc   r14          ;
CODE_09BBCC:         to r10             ;
CODE_09BBCD:         swap               ;
CODE_09BBCE:         ibt   r12,#0008    ;
CODE_09BBD0:         ibt   r3,#0000     ;
CODE_09BBD2:         with r10           ;
CODE_09BBD3:         add   r10          ;
CODE_09BBD4:         bcc CODE_09BBEA    ;
CODE_09BBD6:         nop                ;
CODE_09BBD7:         from r9            ;
CODE_09BBD8:         to r7              ;
CODE_09BBD9:         add   r3           ;
CODE_09BBDA:         move  r2,r4        ;
CODE_09BBDC:         move  r8,r6        ;
CODE_09BBDE:         move  r1,r7        ;
CODE_09BBE0:         move  r0,r5        ;
CODE_09BBE2:         dec   r0           ;
CODE_09BBE3:         bne CODE_09BBE2    ;
CODE_09BBE5:         plot               ;
CODE_09BBE6:         dec   r8           ;
CODE_09BBE7:         bne CODE_09BBDE    ;
CODE_09BBE9:         inc   r2           ;
CODE_09BBEA:         with r3            ;
CODE_09BBEB:         add   r5           ;
CODE_09BBEC:         loop               ;
CODE_09BBED:         nop                ;
CODE_09BBEE:         with r4            ;
CODE_09BBEF:         add   r6           ;
CODE_09BBF0:         dec   r11          ;
CODE_09BBF1:         bne CODE_09BBCA    ;
CODE_09BBF3:         nop                ;
CODE_09BBF4:         rpix               ;
CODE_09BBF6:         lm    r0,(4090)    ;
CODE_09BBFA:         lob                ;
CODE_09BBFB:         iwt   r1,#BC2F     ;
CODE_09BBFE:         to r14             ;
CODE_09BBFF:         add   r1           ;
CODE_09BC00:         getb               ;
CODE_09BC01:         umult r5           ;
CODE_09BC03:         to r1              ;
CODE_09BC04:         add   r9           ;
CODE_09BC05:         iwt   r0,#0082     ;
CODE_09BC08:         from r1            ;
CODE_09BC09:         sub   r0           ;
CODE_09BC0A:         bcc CODE_09BC26    ;
CODE_09BC0C:         nop                ;
CODE_09BC0D:         ibt   r1,#0000     ;
CODE_09BC0F:         lm    r0,(4086)    ;
CODE_09BC13:         ibt   r2,#0010     ;
CODE_09BC15:         with r2            ;
CODE_09BC16:         umult r6           ;
CODE_09BC18:         iwt   r0,#0040     ;
CODE_09BC1B:         from r2            ;
CODE_09BC1C:         sub   r0           ;
CODE_09BC1D:         bcc CODE_09BC22    ;
CODE_09BC1F:         nop                ;
CODE_09BC20:         ibt   r2,#0010     ;
CODE_09BC22:         sm    (4086),r2    ;
CODE_09BC26:         sm    (4084),r1    ;
CODE_09BC2A:         lm    r15,(4092)   ;
CODE_09BC2E:         nop                ;

; width of each character in the font (height is always $0C)
DATA_09BC2F:         db $08, $08, $08, $08, $08, $08, $05, $08
DATA_09BC37:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC3F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC47:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC4F:         db $08, $08, $08, $08, $08, $08, $04, $04
DATA_09BC57:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC5F:         db $08, $08, $08, $08, $08, $08, $08, $04
DATA_09BC67:         db $06, $03, $07, $06, $07, $06, $07, $03
DATA_09BC6F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC77:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC7F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC87:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC8F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC97:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BC9F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCA7:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCAF:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCB7:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCBF:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCC7:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCCF:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCD7:         db $08, $08, $08, $08, $08, $08, $07, $07
DATA_09BCDF:         db $08, $08, $05, $08, $08, $07, $08, $08
DATA_09BCE7:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCEF:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCF7:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BCFF:         db $04, $08, $08, $08, $08, $08, $08, $08
DATA_09BD07:         db $08, $08, $08, $08, $07, $07, $08, $08
DATA_09BD0F:         db $04, $07, $08, $04, $08, $08, $08, $08
DATA_09BD17:         db $08, $07, $08, $08, $08, $08, $08, $08
DATA_09BD1F:         db $08, $08, $08, $08, $08, $08, $08, $08
DATA_09BD27:         db $08, $08, $08, $08, $08, $08, $08, $08

; font graphics (1bpp)
DATA_09BD2F:         db $18, $04, $00, $1C, $02, $3A, $44, $4E
DATA_09BD37:         db $3B, $00, $00, $00, $0C, $16, $00, $1C
DATA_09BD3F:         db $02, $3A, $44, $4E, $3B, $00, $00, $00
DATA_09BD47:         db $00, $00, $00, $3C, $62, $40, $40, $63
DATA_09BD4F:         db $3E, $08, $04, $38, $18, $04, $00, $1C
DATA_09BD57:         db $22, $7E, $40, $62, $3C, $00, $00, $00
DATA_09BD5F:         db $0C, $10, $00, $1C, $22, $7E, $40, $62
DATA_09BD67:         db $3C, $00, $00, $00, $0C, $16, $00, $1C
DATA_09BD6F:         db $22, $7E, $40, $62, $3C, $00, $00, $00
DATA_09BD77:         db $30, $58, $00, $20, $20, $20, $40, $40
DATA_09BD7F:         db $20, $00, $00, $00, $0C, $16, $00, $3C
DATA_09BD87:         db $62, $41, $41, $23, $1E, $00, $00, $00
DATA_09BD8F:         db $18, $04, $00, $40, $42, $42, $42, $67
DATA_09BD97:         db $3D, $00, $00, $00, $0C, $16, $00, $40
DATA_09BD9F:         db $42, $42, $42, $67, $3D, $00, $00, $00
DATA_09BDA7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDAF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDB7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDBF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDC7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDCF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDD7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDDF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDE7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BDEF:         db $14, $14, $00, $1C, $02, $3A, $44, $4E
DATA_09BDF7:         db $3B, $00, $00, $00, $14, $14, $00, $3C
DATA_09BDFF:         db $62, $41, $41, $23, $1E, $00, $00, $00
DATA_09BE07:         db $14, $14, $00, $40, $42, $42, $42, $67
DATA_09BE0F:         db $3D, $00, $00, $00, $1C, $22, $22, $3C
DATA_09BE17:         db $22, $21, $21, $29, $26, $40, $00, $00
DATA_09BE1F:         db $14, $00, $1C, $26, $22, $43, $7F, $41
DATA_09BE27:         db $41, $41, $01, $00, $14, $00, $1C, $26
DATA_09BE2F:         db $43, $41, $41, $41, $23, $1E, $00, $00
DATA_09BE37:         db $14, $00, $22, $21, $41, $41, $41, $43
DATA_09BE3F:         db $66, $3C, $00, $00, $00, $00, $00, $00
DATA_09BE47:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BE4F:         db $03, $0F, $1C, $19, $39, $39, $38, $39
DATA_09BE57:         db $19, $19, $0F, $03, $C0, $F0, $38, $98
DATA_09BE5F:         db $9C, $9C, $1C, $9C, $98, $98, $F0, $C0
DATA_09BE67:         db $03, $0F, $18, $19, $39, $38, $39, $39
DATA_09BE6F:         db $19, $18, $0F, $03, $C0, $F0, $38, $98
DATA_09BE77:         db $9C, $3C, $DC, $CC, $88, $18, $F0, $C0
DATA_09BE7F:         db $03, $0F, $19, $19, $39, $3C, $3E, $3E
DATA_09BE87:         db $1E, $1E, $0F, $03, $C0, $F0, $98, $98
DATA_09BE8F:         db $9C, $3C, $7C, $7C, $78, $78, $F0, $C0
DATA_09BE97:         db $03, $0F, $19, $19, $38, $3C, $3E, $3D
DATA_09BE9F:         db $1B, $1B, $0F, $03, $C0, $F0, $D8, $D8
DATA_09BEA7:         db $BC, $7C, $3C, $1C, $98, $98, $F0, $C0
DATA_09BEAF:         db $00, $1F, $3F, $72, $76, $72, $7A, $72
DATA_09BEB7:         db $3F, $1F, $00, $00, $00, $FF, $FF, $59
DATA_09BEBF:         db $DB, $59, $DB, $49, $FF, $FF, $00, $00
DATA_09BEC7:         db $00, $FC, $FE, $23, $77, $77, $77, $37
DATA_09BECF:         db $FE, $FC, $00, $00, $00, $1F, $3F, $7F
DATA_09BED7:         db $7F, $7F, $7F, $7F, $3F, $1F, $00, $00
DATA_09BEDF:         db $00, $FF, $FF, $9F, $9F, $9F, $9F, $81
DATA_09BEE7:         db $FF, $FF, $00, $00, $00, $FC, $FE, $FF
DATA_09BEEF:         db $FF, $FF, $FF, $FF, $FE, $FC, $00, $00
DATA_09BEF7:         db $00, $00, $30, $30, $00, $00, $00, $30
DATA_09BEFF:         db $30, $00, $00, $00, $00, $00, $30, $30
DATA_09BF07:         db $00, $00, $30, $30, $10, $20, $00, $00
DATA_09BF0F:         db $00, $1F, $3F, $7F, $7F, $7F, $7F, $7F
DATA_09BF17:         db $3F, $1F, $00, $00, $00, $FF, $FF, $83
DATA_09BF1F:         db $99, $83, $99, $99, $FF, $FF, $00, $00
DATA_09BF27:         db $00, $FC, $FE, $FF, $FF, $FF, $FF, $FF
DATA_09BF2F:         db $FE, $FC, $00, $00, $30, $10, $20, $40
DATA_09BF37:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BF3F:         db $14, $22, $41, $77, $14, $14, $14, $14
DATA_09BF47:         db $14, $1C, $00, $00, $00, $04, $0C, $1F
DATA_09BF4F:         db $3F, $7F, $3F, $1F, $0C, $04, $00, $00
DATA_09BF57:         db $00, $20, $30, $F8, $FC, $FE, $FC, $F8
DATA_09BF5F:         db $30, $20, $00, $00, $00, $00, $08, $1C
DATA_09BF67:         db $3E, $7F, $3E, $3E, $3E, $3E, $00, $00
DATA_09BF6F:         db $00, $00, $3E, $3E, $3E, $3E, $7F, $3E
DATA_09BF77:         db $1C, $08, $00, $00, $00, $1F, $3F, $72
DATA_09BF7F:         db $77, $73, $7B, $73, $3F, $1F, $00, $00
DATA_09BF87:         db $00, $FF, $FF, $36, $6A, $62, $6A, $6A
DATA_09BF8F:         db $FF, $FF, $00, $00, $00, $FC, $FE, $63
DATA_09BF97:         db $B7, $77, $B7, $B7, $FE, $FC, $00, $00
DATA_09BF9F:         db $0D, $12, $21, $43, $47, $2F, $43, $43
DATA_09BFA7:         db $23, $18, $07, $00, $C0, $30, $88, $CC
DATA_09BFAF:         db $E2, $F2, $C2, $C4, $C4, $18, $E0, $00
DATA_09BFB7:         db $00, $00, $00, $3E, $00, $00, $3E, $00
DATA_09BFBF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09BFC7:         db $00, $00, $00, $00, $30, $10, $20, $40
DATA_09BFCF:         db $00, $00, $00, $18, $24, $7C, $40, $64
DATA_09BFD7:         db $38, $00, $00, $00, $00, $20, $00, $40
DATA_09BFDF:         db $40, $40, $40, $40, $20, $00, $00, $00
DATA_09BFE7:         db $00, $10, $20, $78, $20, $20, $20, $34
DATA_09BFEF:         db $18, $00, $00, $00, $00, $00, $00, $58
DATA_09BFF7:         db $34, $20, $20, $20, $20, $00, $00, $00
DATA_09BFFF:         db $40, $20, $20, $2C, $32, $22, $24, $24
DATA_09C007:         db $22, $00, $00, $00, $18, $30, $20, $78
DATA_09C00F:         db $20, $20, $20, $10, $10, $00, $00, $00
DATA_09C017:         db $00, $00, $00, $58, $2C, $24, $24, $24
DATA_09C01F:         db $22, $00, $00, $00, $00, $00, $00, $00
DATA_09C027:         db $00, $00, $00, $00, $60, $60, $00, $00
DATA_09C02F:         db $18, $06, $00, $1C, $26, $22, $43, $7F
DATA_09C037:         db $41, $41, $41, $01, $1C, $16, $00, $1C
DATA_09C03F:         db $26, $22, $43, $7F, $41, $41, $41, $01
DATA_09C047:         db $1C, $22, $40, $40, $40, $40, $41, $23
DATA_09C04F:         db $1E, $08, $04, $38, $1C, $06, $00, $3E
DATA_09C057:         db $40, $40, $7C, $40, $40, $40, $7F, $00
DATA_09C05F:         db $1C, $30, $00, $3E, $40, $40, $7C, $40
DATA_09C067:         db $40, $40, $7F, $00, $1C, $16, $00, $3E
DATA_09C06F:         db $40, $40, $7C, $40, $40, $40, $7F, $00
DATA_09C077:         db $38, $2C, $00, $38, $10, $10, $10, $20
DATA_09C07F:         db $20, $20, $70, $00, $1C, $16, $00, $1C
DATA_09C087:         db $26, $43, $41, $41, $41, $23, $1E, $00
DATA_09C08F:         db $06, $18, $00, $21, $21, $41, $41, $41
DATA_09C097:         db $43, $66, $3C, $00, $18, $06, $00, $21
DATA_09C09F:         db $21, $41, $41, $41, $43, $66, $3C, $00
DATA_09C0A7:         db $14, $00, $38, $10, $10, $20, $20, $20
DATA_09C0AF:         db $20, $70, $00, $00, $50, $50, $00, $20
DATA_09C0B7:         db $20, $20, $20, $30, $18, $00, $00, $00
DATA_09C0BF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0C7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0CF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0D7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0DF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0E7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0EF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0F7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C0FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C107:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C10F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C117:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C11F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C127:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C12F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C137:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C13F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C147:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C14F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C157:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C15F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C167:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C16F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C177:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C17F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C187:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C18F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C197:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C19F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1A7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1AF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1B7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1BF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1C7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1CF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1D7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1DF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1E7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1EF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1F7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C1FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C207:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C20F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C217:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C21F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C227:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C22F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C237:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C23F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C247:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C24F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C257:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C25F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C267:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C26F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C277:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C27F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C287:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C28F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C297:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C29F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2A7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2AF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2B7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2BF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2C7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2CF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2D7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2DF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2E7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2EF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2F7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C2FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C307:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C30F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C317:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C31F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C327:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C32F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C337:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C33F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C347:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C34F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C357:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C35F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C367:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C36F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C377:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C37F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C387:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C38F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C397:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C39F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3A7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3AF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3B7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3BF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3C7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3CF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3D7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3DF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3E7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3EF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3F7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C3FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C407:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C40F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C417:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C41F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C427:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C42F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C437:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C43F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C447:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C44F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C457:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C45F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C467:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C46F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C477:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C47F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C487:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C48F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C497:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C49F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C4A7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C4AF:         db $1C, $32, $21, $41, $41, $41, $41, $22
DATA_09C4B7:         db $1C, $00, $00, $00, $0C, $14, $04, $04
DATA_09C4BF:         db $04, $08, $08, $08, $1C, $00, $00, $00
DATA_09C4C7:         db $1E, $31, $21, $01, $06, $18, $20, $42
DATA_09C4CF:         db $7E, $00, $00, $00, $1C, $22, $02, $0C
DATA_09C4D7:         db $02, $01, $41, $63, $3E, $00, $00, $00
DATA_09C4DF:         db $22, $22, $44, $44, $64, $3F, $08, $08
DATA_09C4E7:         db $08, $00, $00, $00, $20, $3E, $20, $20
DATA_09C4EF:         db $3E, $03, $01, $43, $3E, $00, $00, $00
DATA_09C4F7:         db $1C, $20, $40, $5E, $63, $41, $41, $23
DATA_09C4FF:         db $1E, $00, $00, $00, $3F, $61, $42, $04
DATA_09C507:         db $04, $08, $08, $08, $08, $00, $00, $00
DATA_09C50F:         db $1C, $22, $22, $1C, $22, $41, $41, $63
DATA_09C517:         db $3E, $00, $00, $00, $3E, $61, $41, $42
DATA_09C51F:         db $3E, $04, $04, $08, $08, $00, $00, $00
DATA_09C527:         db $1C, $26, $22, $43, $7F, $41, $41, $41
DATA_09C52F:         db $01, $00, $00, $00, $7C, $22, $22, $3C
DATA_09C537:         db $22, $21, $21, $23, $3E, $00, $00, $00
DATA_09C53F:         db $1C, $22, $40, $40, $40, $40, $41, $23
DATA_09C547:         db $1E, $00, $00, $00, $7C, $26, $23, $21
DATA_09C54F:         db $21, $21, $21, $22, $7C, $00, $00, $00
DATA_09C557:         db $3E, $40, $40, $40, $7C, $40, $40, $40
DATA_09C55F:         db $7E, $00, $00, $00, $3E, $40, $40, $40
DATA_09C567:         db $7C, $40, $40, $40, $20, $00, $00, $00
DATA_09C56F:         db $1C, $22, $40, $40, $4F, $41, $41, $23
DATA_09C577:         db $1E, $00, $00, $00, $21, $41, $41, $41
DATA_09C57F:         db $7F, $41, $41, $41, $41, $00, $00, $00
DATA_09C587:         db $38, $10, $10, $10, $20, $20, $20, $20
DATA_09C58F:         db $70, $00, $00, $00, $01, $01, $01, $21
DATA_09C597:         db $41, $41, $41, $62, $3C, $00, $00, $00
DATA_09C59F:         db $42, $44, $48, $50, $70, $58, $4C, $46
DATA_09C5A7:         db $43, $00, $00, $00, $40, $40, $40, $40
DATA_09C5AF:         db $40, $40, $40, $40, $7E, $00, $00, $00
DATA_09C5B7:         db $20, $21, $73, $55, $49, $41, $41, $41
DATA_09C5BF:         db $21, $00, $00, $00, $42, $61, $61, $51
DATA_09C5C7:         db $51, $49, $49, $45, $43, $00, $00, $00
DATA_09C5CF:         db $1C, $26, $43, $41, $41, $41, $41, $23
DATA_09C5D7:         db $1E, $00, $00, $00, $7E, $43, $41, $43
DATA_09C5DF:         db $3E, $20, $20, $20, $20, $00, $00, $00
DATA_09C5E7:         db $1C, $26, $43, $41, $41, $41, $51, $2A
DATA_09C5EF:         db $1C, $02, $01, $00, $7C, $42, $41, $43
DATA_09C5F7:         db $7E, $48, $44, $42, $41, $00, $00, $00
DATA_09C5FF:         db $1C, $22, $20, $30, $1C, $02, $41, $43
DATA_09C607:         db $3E, $00, $00, $00, $3F, $48, $08, $08
DATA_09C60F:         db $08, $04, $04, $04, $04, $00, $00, $00
DATA_09C617:         db $22, $21, $41, $41, $41, $41, $43, $66
DATA_09C61F:         db $3C, $00, $00, $00, $40, $41, $21, $23
DATA_09C627:         db $22, $16, $14, $1C, $08, $00, $00, $00
DATA_09C62F:         db $42, $41, $41, $49, $49, $5D, $55, $77
DATA_09C637:         db $22, $00, $00, $00, $40, $41, $23, $16
DATA_09C63F:         db $0C, $1C, $32, $61, $41, $00, $00, $00
DATA_09C647:         db $41, $43, $26, $1C, $08, $08, $08, $08
DATA_09C64F:         db $08, $00, $00, $00, $70, $0F, $02, $04
DATA_09C657:         db $08, $10, $20, $40, $7F, $00, $00, $00
DATA_09C65F:         db $7E, $82, $BE, $A0, $A0, $A0, $E0, $00
DATA_09C667:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C66F:         db $00, $07, $05, $05, $05, $7D, $41, $7E
DATA_09C677:         db $3C, $62, $42, $06, $0C, $18, $10, $00
DATA_09C67F:         db $10, $10, $00, $00, $30, $30, $20, $60
DATA_09C687:         db $40, $40, $40, $00, $40, $40, $00, $00
DATA_09C68F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C697:         db $80, $C0, $60, $20, $00, $00, $00, $00
DATA_09C69F:         db $00, $7F, $00, $00, $00, $00, $00, $00
DATA_09C6A7:         db $03, $03, $03, $1F, $1F, $1E, $1F, $1F
DATA_09C6AF:         db $03, $03, $03, $00, $E0, $E0, $E0, $FC
DATA_09C6B7:         db $7C, $BC, $7C, $FC, $E0, $E0, $E0, $00
DATA_09C6BF:         db $00, $00, $00, $00, $2A, $2A, $00, $00
DATA_09C6C7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C6CF:         db $00, $00, $00, $00, $60, $90, $90, $60
DATA_09C6D7:         db $00, $00, $00, $00, $00, $30, $49, $06
DATA_09C6DF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C6E7:         db $00, $00, $00, $00, $30, $10, $20, $40
DATA_09C6EF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C6F7:         db $00, $00, $00, $00, $48, $48, $6C, $24
DATA_09C6FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C707:         db $24, $24, $6C, $48, $00, $00, $00, $00
DATA_09C70F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C717:         db $00, $18, $18, $00, $00, $00, $00, $00
DATA_09C71F:         db $60, $70, $78, $7C, $7E, $7F, $7E, $7C
DATA_09C727:         db $78, $70, $60, $00, $01, $1A, $27, $21
DATA_09C72F:         db $20, $11, $0E, $02, $01, $00, $00, $00
DATA_09C737:         db $80, $40, $60, $10, $10, $26, $3A, $12
DATA_09C73F:         db $84, $58, $F0, $00, $00, $00, $44, $68
DATA_09C747:         db $30, $18, $2C, $44, $00, $00, $00, $00
DATA_09C74F:         db $00, $00, $00, $1C, $02, $3A, $44, $4E
DATA_09C757:         db $3B, $00, $00, $00, $40, $20, $20, $2E
DATA_09C75F:         db $31, $21, $21, $33, $5E, $00, $00, $00
DATA_09C767:         db $00, $00, $00, $3C, $62, $40, $40, $63
DATA_09C76F:         db $3E, $00, $00, $00, $02, $01, $01, $39
DATA_09C777:         db $66, $42, $42, $46, $3B, $00, $00, $00
DATA_09C77F:         db $00, $00, $00, $1C, $22, $7E, $40, $62
DATA_09C787:         db $3C, $00, $00, $00, $0C, $1A, $10, $7E
DATA_09C78F:         db $10, $10, $10, $08, $08, $00, $00, $00
DATA_09C797:         db $00, $00, $02, $1E, $31, $23, $1E, $08
DATA_09C79F:         db $3E, $61, $43, $3E, $40, $20, $20, $2E
DATA_09C7A7:         db $31, $21, $22, $22, $21, $00, $00, $00
DATA_09C7AF:         db $00, $20, $00, $40, $40, $40, $40, $60
DATA_09C7B7:         db $30, $00, $00, $00, $00, $02, $00, $02
DATA_09C7BF:         db $02, $02, $02, $02, $46, $4C, $38, $00
DATA_09C7C7:         db $40, $40, $42, $64, $28, $38, $2C, $26
DATA_09C7CF:         db $23, $00, $00, $00, $20, $20, $40, $40
DATA_09C7D7:         db $40, $40, $40, $60, $30, $00, $00, $00
DATA_09C7DF:         db $00, $00, $40, $56, $6B, $49, $49, $49
DATA_09C7E7:         db $49, $00, $00, $00, $00, $00, $00, $5C
DATA_09C7EF:         db $26, $22, $22, $22, $21, $00, $00, $00
DATA_09C7F7:         db $00, $00, $00, $3C, $62, $41, $41, $23
DATA_09C7FF:         db $1E, $00, $00, $00, $00, $00, $00, $5E
DATA_09C807:         db $23, $21, $21, $13, $1E, $10, $10, $10
DATA_09C80F:         db $00, $00, $00, $1D, $22, $46, $44, $4C
DATA_09C817:         db $38, $08, $08, $04, $00, $00, $00, $5C
DATA_09C81F:         db $32, $22, $20, $20, $20, $00, $00, $00
DATA_09C827:         db $00, $00, $38, $44, $60, $3C, $06, $42
DATA_09C82F:         db $3C, $00, $00, $00, $00, $08, $10, $7C
DATA_09C837:         db $10, $10, $10, $19, $0E, $00, $00, $00
DATA_09C83F:         db $00, $00, $00, $40, $42, $42, $42, $67
DATA_09C847:         db $3D, $00, $00, $00, $00, $00, $01, $42
DATA_09C84F:         db $62, $24, $34, $18, $08, $00, $00, $00
DATA_09C857:         db $00, $00, $00, $21, $41, $49, $49, $5B
DATA_09C85F:         db $36, $00, $00, $00, $00, $00, $01, $62
DATA_09C867:         db $34, $18, $18, $2C, $43, $00, $00, $00
DATA_09C86F:         db $00, $00, $00, $41, $21, $22, $12, $16
DATA_09C877:         db $0C, $18, $30, $C0, $00, $00, $00, $3C
DATA_09C87F:         db $03, $06, $18, $30, $7C, $03, $00, $00
DATA_09C887:         db $03, $07, $0F, $1F, $3F, $7F, $3F, $1F
DATA_09C88F:         db $0F, $07, $03, $00, $00, $00, $00, $00
DATA_09C897:         db $00, $00, $00, $00, $60, $60, $00, $00
DATA_09C89F:         db $0D, $12, $20, $43, $44, $40, $41, $20
DATA_09C8A7:         db $11, $0C, $03, $00, $C0, $30, $08, $C4
DATA_09C8AF:         db $22, $E2, $82, $0C, $84, $18, $E0, $00
DATA_09C8B7:         db $00, $01, $02, $3C, $11, $09, $04, $04
DATA_09C8BF:         db $38, $3D, $1E, $00, $80, $40, $20, $1E
DATA_09C8C7:         db $44, $48, $10, $10, $8E, $5E, $3C, $00
DATA_09C8CF:         db $01, $06, $09, $11, $10, $20, $20, $20
DATA_09C8D7:         db $3F, $2B, $3F, $00, $C0, $30, $C8, $C4
DATA_09C8DF:         db $84, $02, $82, $02, $FE, $02, $FE, $00
DATA_09C8E7:         db $1C, $14, $14, $14, $14, $14, $77, $41
DATA_09C8EF:         db $22, $14, $08, $00, $00, $00, $00, $00
DATA_09C8F7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C8FF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C907:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C90F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C917:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C91F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C927:         db $00, $00, $00, $00, $00, $00, $00, $00

; message box pictures (1bpp)
DATA_09C930:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C938:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C940:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C948:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C950:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C958:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C960:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C968:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C970:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C978:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C980:         db $00, $00, $03, $F8, $00, $00, $00, $00
DATA_09C988:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C990:         db $00, $03, $0C, $0E, $00, $00, $00, $00
DATA_09C998:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C9A0:         db $00, $03, $98, $03, $00, $00, $00, $00
DATA_09C9A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09C9B0:         db $00, $1B, $B0, $01, $80, $00, $00, $00
DATA_09C9B8:         db $00, $00, $00, $00, $04, $08, $00, $00
DATA_09C9C0:         db $00, $19, $C0, $00, $C0, $00, $00, $00
DATA_09C9C8:         db $00, $00, $00, $00, $04, $10, $00, $00
DATA_09C9D0:         db $00, $1C, $C0, $00, $40, $00, $00, $00
DATA_09C9D8:         db $00, $00, $00, $00, $02, $10, $00, $00
DATA_09C9E0:         db $00, $0F, $00, $00, $60, $00, $00, $00
DATA_09C9E8:         db $00, $00, $00, $00, $03, $20, $00, $00
DATA_09C9F0:         db $00, $1F, $F8, $00, $20, $00, $00, $00
DATA_09C9F8:         db $00, $00, $00, $00, $01, $C0, $00, $00
DATA_09CA00:         db $00, $30, $0C, $00, $20, $1F, $F0, $00
DATA_09CA08:         db $00, $00, $00, $00, $00, $80, $00, $00
DATA_09CA10:         db $00, $60, $02, $00, $20, $1F, $F0, $00
DATA_09CA18:         db $00, $00, $00, $00, $02, $30, $00, $00
DATA_09CA20:         db $00, $40, $01, $00, $20, $1F, $B0, $00
DATA_09CA28:         db $00, $00, $00, $00, $03, $30, $00, $00
DATA_09CA30:         db $00, $C0, $00, $80, $20, $1F, $A0, $00
DATA_09CA38:         db $00, $00, $00, $00, $03, $33, $FF, $00
DATA_09CA40:         db $03, $80, $00, $C0, $20, $0F, $A0, $60
DATA_09CA48:         db $00, $00, $00, $01, $C3, $BE, $01, $C0
DATA_09CA50:         db $04, $80, $00, $40, $20, $0F, $E3, $E0
DATA_09CA58:         db $00, $00, $00, $03, $6F, $38, $00, $60
DATA_09CA60:         db $04, $80, $00, $40, $20, $0F, $FF, $E0
DATA_09CA68:         db $00, $00, $00, $02, $33, $30, $04, $30
DATA_09CA70:         db $04, $80, $00, $40, $67, $FF, $FF, $A0
DATA_09CA78:         db $00, $00, $00, $02, $30, $00, $48, $10
DATA_09CA80:         db $03, $C0, $00, $00, $47, $FC, $7F, $E0
DATA_09CA88:         db $00, $00, $00, $02, $64, $0C, $90, $08
DATA_09CA90:         db $01, $40, $00, $00, $C7, $F8, $3F, $A0
DATA_09CA98:         db $00, $00, $02, $02, $44, $19, $21, $08
DATA_09CAA0:         db $02, $40, $00, $00, $87, $F8, $3F, $A0
DATA_09CAA8:         db $00, $00, $03, $03, $4E, $32, $62, $08
DATA_09CAB0:         db $02, $60, $00, $03, $07, $F8, $3C, $20
DATA_09CAB8:         db $7C, $00, $05, $06, $4A, $26, $C2, $08
DATA_09CAC0:         db $02, $20, $00, $1C, $07, $3C, $7F, $E1
DATA_09CAC8:         db $C7, $00, $0C, $CC, $4A, $04, $00, $08
DATA_09CAD0:         db $01, $F0, $00, $04, $04, $FF, $C0, $03
DATA_09CAD8:         db $C1, $80, $08, $78, $44, $00, $00, $08
DATA_09CAE0:         db $00, $38, $00, $04, $07, $8F, $E0, $03
DATA_09CAE8:         db $C2, $80, $08, $4C, $40, $00, $00, $08
DATA_09CAF0:         db $00, $36, $04, $0C, $00, $0F, $E0, $07
DATA_09CAF8:         db $C1, $80, $10, $47, $A0, $00, $00, $08
DATA_09CB00:         db $00, $1E, $07, $F0, $00, $1F, $F0, $0F
DATA_09CB08:         db $87, $40, $10, $40, $B0, $00, $00, $10
DATA_09CB10:         db $00, $06, $06, $00, $00, $1F, $F0, $0F
DATA_09CB18:         db $8F, $C0, $10, $67, $F8, $00, $00, $30
DATA_09CB20:         db $00, $7C, $83, $C0, $00, $1F, $D0, $1E
DATA_09CB28:         db $0F, $C0, $10, $3C, $B8, $00, $00, $60
DATA_09CB30:         db $0F, $D9, $83, $60, $00, $1F, $10, $10
DATA_09CB38:         db $0F, $C0, $10, $60, $00, $00, $00, $80
DATA_09CB40:         db $08, $11, $01, $30, $00, $1F, $F0, $10
DATA_09CB48:         db $0F, $C0, $10, $40, $C0, $10, $03, $80
DATA_09CB50:         db $08, $23, $01, $10, $00, $00, $00, $10
DATA_09CB58:         db $07, $40, $10, $C0, $81, $08, $06, $00
DATA_09CB60:         db $08, $61, $81, $30, $00, $00, $00, $10
DATA_09CB68:         db $02, $C0, $18, $81, $03, $07, $F8, $00
DATA_09CB70:         db $04, $60, $43, $E0, $00, $00, $00, $1B
DATA_09CB78:         db $89, $C0, $28, $81, $02, $01, $80, $00
DATA_09CB80:         db $04, $20, $42, $C0, $00, $3F, $F0, $0F
DATA_09CB88:         db $E5, $80, $44, $82, $06, $00, $00, $00
DATA_09CB90:         db $02, $30, $C4, $00, $00, $1F, $E0, $0F
DATA_09CB98:         db $F3, $80, $92, $66, $18, $00, $00, $00
DATA_09CBA0:         db $01, $19, $88, $00, $00, $1F, $C0, $07
DATA_09CBA8:         db $F7, $00, $A1, $9C, $70, $00, $00, $00
DATA_09CBB0:         db $00, $CE, $10, $00, $00, $0F, $80, $03
DATA_09CBB8:         db $FE, $61, $20, $E0, $F8, $00, $00, $00
DATA_09CBC0:         db $00, $30, $60, $00, $00, $07, $00, $00
DATA_09CBC8:         db $F8, $11, $41, $FF, $BF, $00, $00, $00
DATA_09CBD0:         db $00, $FF, $BC, $00, $00, $07, $00, $00
DATA_09CBD8:         db $01, $8A, $47, $C0, $C0, $E0, $00, $00
DATA_09CBE0:         db $03, $1C, $03, $80, $00, $02, $00, $00
DATA_09CBE8:         db $00, $64, $8C, $31, $80, $10, $00, $00
DATA_09CBF0:         db $04, $02, $00, $C0, $00, $00, $00, $00
DATA_09CBF8:         db $00, $10, $98, $0D, $80, $10, $00, $00
DATA_09CC00:         db $08, $01, $00, $40, $00, $00, $00, $00
DATA_09CC08:         db $00, $09, $10, $04, $E0, $70, $00, $00
DATA_09CC10:         db $0C, $01, $FF, $C0, $00, $00, $00, $00
DATA_09CC18:         db $00, $00, $13, $FE, $1F, $C0, $00, $00
DATA_09CC20:         db $07, $FE, $00, $00, $00, $00, $00, $00
DATA_09CC28:         db $00, $00, $1C, $00, $00, $00, $00, $00
DATA_09CC30:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CC38:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CC40:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CC48:         db $00, $00, $00, $02, $00, $00, $00, $00
DATA_09CC50:         db $00, $00, $00, $18, $00, $00, $00, $00
DATA_09CC58:         db $00, $00, $00, $02, $00, $00, $00, $00
DATA_09CC60:         db $00, $00, $01, $9B, $E0, $00, $00, $00
DATA_09CC68:         db $00, $00, $21, $02, $00, $00, $00, $00
DATA_09CC70:         db $00, $00, $01, $9F, $F8, $00, $00, $00
DATA_09CC78:         db $00, $00, $20, $81, $00, $00, $00, $00
DATA_09CC80:         db $00, $00, $01, $CE, $0C, $00, $00, $00
DATA_09CC88:         db $00, $00, $20, $81, $00, $00, $00, $00
DATA_09CC90:         db $00, $00, $00, $D8, $06, $00, $00, $00
DATA_09CC98:         db $00, $00, $10, $81, $00, $00, $00, $00
DATA_09CCA0:         db $00, $00, $30, $D0, $02, $00, $00, $00
DATA_09CCA8:         db $00, $00, $08, $80, $80, $00, $00, $00
DATA_09CCB0:         db $00, $00, $4C, $10, $03, $00, $00, $00
DATA_09CCB8:         db $00, $00, $08, $40, $80, $00, $00, $00
DATA_09CCC0:         db $00, $00, $C3, $00, $03, $00, $00, $00
DATA_09CCC8:         db $00, $00, $08, $40, $80, $00, $00, $00
DATA_09CCD0:         db $00, $00, $8C, $80, $03, $00, $00, $00
DATA_09CCD8:         db $00, $00, $08, $40, $00, $00, $00, $00
DATA_09CCE0:         db $00, $00, $74, $00, $03, $00, $00, $00
DATA_09CCE8:         db $00, $00, $08, $40, $40, $00, $00, $00
DATA_09CCF0:         db $00, $00, $38, $00, $03, $00, $00, $00
DATA_09CCF8:         db $00, $00, $01, $E0, $E6, $00, $00, $00
DATA_09CD00:         db $00, $00, $28, $00, $02, $00, $00, $00
DATA_09CD08:         db $00, $00, $03, $30, $EE, $00, $00, $00
DATA_09CD10:         db $00, $00, $68, $40, $02, $00, $00, $00
DATA_09CD18:         db $00, $00, $02, $11, $CE, $00, $00, $00
DATA_09CD20:         db $00, $00, $78, $20, $0C, $00, $00, $00
DATA_09CD28:         db $00, $00, $02, $19, $9C, $00, $00, $00
DATA_09CD30:         db $00, $00, $3C, $30, $08, $00, $00, $00
DATA_09CD38:         db $00, $00, $03, $E0, $3F, $C0, $00, $00
DATA_09CD40:         db $00, $00, $3C, $1C, $30, $00, $00, $00
DATA_09CD48:         db $00, $00, $04, $C0, $00, $30, $00, $00
DATA_09CD50:         db $00, $00, $0F, $07, $E0, $00, $00, $00
DATA_09CD58:         db $00, $00, $09, $80, $00, $18, $00, $00
DATA_09CD60:         db $00, $00, $03, $F2, $00, $00, $00, $00
DATA_09CD68:         db $00, $00, $09, $00, $00, $08, $00, $00
DATA_09CD70:         db $00, $00, $00, $63, $00, $00, $01, $00
DATA_09CD78:         db $00, $00, $07, $0C, $00, $0C, $00, $00
DATA_09CD80:         db $00, $00, $00, $41, $00, $00, $03, $00
DATA_09CD88:         db $00, $00, $07, $18, $00, $04, $00, $00
DATA_09CD90:         db $00, $00, $00, $81, $00, $03, $03, $00
DATA_09CD98:         db $00, $00, $35, $88, $00, $04, $00, $00
DATA_09CDA0:         db $00, $00, $03, $C1, $00, $03, $C3, $80
DATA_09CDA8:         db $00, $00, $FB, $C8, $00, $04, $00, $00
DATA_09CDB0:         db $00, $00, $07, $40, $80, $03, $F7, $80
DATA_09CDB8:         db $00, $01, $09, $F8, $00, $04, $00, $00
DATA_09CDC0:         db $00, $00, $39, $40, $80, $03, $FF, $C0
DATA_09CDC8:         db $00, $01, $0F, $44, $00, $08, $00, $00
DATA_09CDD0:         db $00, $03, $C2, $71, $80, $07, $FF, $C0
DATA_09CDD8:         db $00, $01, $01, $C6, $00, $18, $00, $00
DATA_09CDE0:         db $00, $03, $06, $11, $00, $07, $FF, $E0
DATA_09CDE8:         db $00, $01, $80, $43, $00, $30, $00, $00
DATA_09CDF0:         db $00, $01, $06, $31, $00, $0F, $FF, $F0
DATA_09CDF8:         db $00, $00, $FE, $41, $80, $40, $00, $00
DATA_09CE00:         db $00, $00, $C3, $E3, $00, $0F, $FF, $F8
DATA_09CE08:         db $00, $40, $72, $C0, $E3, $80, $00, $00
DATA_09CE10:         db $00, $00, $E0, $06, $00, $07, $FF, $FC
DATA_09CE18:         db $00, $60, $03, $80, $DC, $00, $00, $00
DATA_09CE20:         db $00, $00, $30, $18, $00, $01, $FF, $F8
DATA_09CE28:         db $00, $78, $07, $00, $60, $04, $00, $00
DATA_09CE30:         db $00, $00, $0F, $F0, $00, $00, $1F, $E0
DATA_09CE38:         db $00, $20, $1C, $08, $20, $84, $00, $00
DATA_09CE40:         db $00, $00, $00, $00, $00, $00, $1F, $80
DATA_09CE48:         db $00, $20, $78, $3C, $21, $C3, $00, $00
DATA_09CE50:         db $00, $00, $0E, $70, $00, $00, $1E, $00
DATA_09CE58:         db $00, $20, $20, $3C, $23, $C0, $E0, $00
DATA_09CE60:         db $00, $00, $1E, $50, $00, $00, $3E, $00
DATA_09CE68:         db $00, $40, $20, $7C, $67, $C1, $80, $00
DATA_09CE70:         db $00, $02, $32, $90, $00, $00, $38, $00
DATA_09CE78:         db $00, $80, $30, $F8, $4F, $C2, $00, $00
DATA_09CE80:         db $00, $04, $26, $90, $00, $00, $30, $00
DATA_09CE88:         db $07, $C0, $19, $F8, $4F, $84, $00, $00
DATA_09CE90:         db $00, $04, $24, $90, $00, $00, $00, $00
DATA_09CE98:         db $00, $60, $0F, $E0, $9E, $0C, $00, $00
DATA_09CEA0:         db $00, $08, $28, $E0, $00, $00, $00, $00
DATA_09CEA8:         db $00, $10, $07, $E3, $1C, $08, $00, $00
DATA_09CEB0:         db $00, $18, $B0, $60, $00, $00, $00, $00
DATA_09CEB8:         db $00, $10, $03, $C6, $18, $38, $00, $00
DATA_09CEC0:         db $00, $11, $00, $00, $00, $00, $00, $00
DATA_09CEC8:         db $00, $3E, $03, $F8, $01, $CC, $00, $00
DATA_09CED0:         db $00, $11, $00, $00, $00, $00, $00, $00
DATA_09CED8:         db $00, $62, $E0, $00, $01, $02, $00, $00
DATA_09CEE0:         db $00, $11, $08, $00, $00, $00, $00, $00
DATA_09CEE8:         db $00, $C3, $B0, $00, $7A, $00, $00, $00
DATA_09CEF0:         db $00, $02, $10, $00, $00, $00, $00, $00
DATA_09CEF8:         db $00, $03, $17, $CF, $46, $00, $00, $00
DATA_09CF00:         db $00, $02, $10, $00, $00, $00, $00, $00
DATA_09CF08:         db $00, $04, $18, $69, $C3, $00, $00, $00
DATA_09CF10:         db $00, $02, $20, $00, $00, $00, $00, $00
DATA_09CF18:         db $00, $00, $08, $18, $41, $00, $00, $00
DATA_09CF20:         db $00, $02, $20, $00, $00, $00, $00, $00
DATA_09CF28:         db $00, $00, $00, $18, $00, $00, $00, $00
DATA_09CF30:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF38:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF40:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF48:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF50:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF58:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF60:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF68:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF70:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF78:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF80:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF88:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF90:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CF98:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFA0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFA8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFB0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFB8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFC0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFC8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFD0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFD8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFE0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFE8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFF0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09CFF8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D000:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D008:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D010:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D018:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D020:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D028:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D030:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D038:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D040:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D048:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D050:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D058:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D060:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D068:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D070:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D078:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D080:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D088:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D090:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D098:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D0F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D100:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D108:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D110:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D118:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D120:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D128:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D130:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D138:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D140:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D148:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D150:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D158:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D160:         db $00, $00, $00, $18, $00, $00, $00, $00
DATA_09D168:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D170:         db $00, $00, $00, $1C, $07, $C0, $00, $00
DATA_09D178:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D180:         db $00, $00, $01, $9C, $18, $38, $00, $00
DATA_09D188:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D190:         db $00, $00, $01, $8E, $60, $04, $00, $00
DATA_09D198:         db $00, $00, $01, $F8, $00, $00, $00, $00
DATA_09D1A0:         db $00, $00, $01, $CE, $C0, $02, $00, $00
DATA_09D1A8:         db $00, $00, $01, $04, $00, $07, $00, $00
DATA_09D1B0:         db $00, $00, $00, $C6, $80, $03, $00, $00
DATA_09D1B8:         db $00, $00, $03, $04, $00, $18, $C0, $00
DATA_09D1C0:         db $00, $00, $00, $E1, $00, $01, $00, $00
DATA_09D1C8:         db $70, $00, $03, $04, $00, $38, $20, $00
DATA_09D1D0:         db $00, $00, $00, $61, $00, $00, $80, $00
DATA_09D1D8:         db $90, $00, $01, $0B, $80, $7C, $10, $00
DATA_09D1E0:         db $00, $00, $00, $02, $00, $00, $80, $01
DATA_09D1E8:         db $8E, $00, $01, $00, $C3, $FC, $08, $00
DATA_09D1F0:         db $00, $00, $00, $72, $00, $00, $80, $03
DATA_09D1F8:         db $83, $00, $03, $40, $7C, $7C, $E8, $00
DATA_09D200:         db $00, $00, $06, $82, $00, $00, $80, $02
DATA_09D208:         db $03, $80, $02, $30, $E0, $F9, $F4, $00
DATA_09D210:         db $00, $00, $0F, $00, $00, $00, $80, $06
DATA_09D218:         db $20, $80, $07, $E0, $60, $D9, $F4, $00
DATA_09D220:         db $00, $00, $0A, $00, $00, $00, $80, $06
DATA_09D228:         db $20, $80, $7C, $20, $C0, $E1, $F4, $00
DATA_09D230:         db $00, $00, $0A, $00, $00, $00, $80, $03
DATA_09D238:         db $38, $CF, $84, $10, $C1, $C0, $E2, $00
DATA_09D240:         db $00, $00, $0A, $00, $00, $01, $80, $01
DATA_09D248:         db $0C, $F0, $06, $18, $3E, $B8, $02, $00
DATA_09D250:         db $00, $00, $0E, $00, $00, $03, $00, $03
DATA_09D258:         db $7C, $C0, $01, $18, $20, $FC, $02, $00
DATA_09D260:         db $00, $00, $0A, $00, $00, $02, $00, $0F
DATA_09D268:         db $84, $C0, $03, $F0, $30, $FE, $0E, $00
DATA_09D270:         db $00, $00, $0B, $07, $00, $0C, $00, $F1
DATA_09D278:         db $0C, $60, $3E, $10, $10, $FE, $1E, $00
DATA_09D280:         db $00, $00, $09, $01, $C0, $78, $00, $03
DATA_09D288:         db $18, $27, $C2, $10, $1F, $FC, $3C, $00
DATA_09D290:         db $00, $00, $0F, $C0, $7F, $E0, $00, $02
DATA_09D298:         db $18, $38, $02, $18, $30, $78, $3C, $00
DATA_09D2A0:         db $00, $00, $00, $79, $90, $D0, $00, $03
DATA_09D2A8:         db $BC, $10, $01, $FC, $60, $20, $38, $00
DATA_09D2B0:         db $00, $00, $00, $2F, $0C, $9F, $00, $07
DATA_09D2B8:         db $CC, $30, $7F, $E0, $20, $18, $30, $00
DATA_09D2C0:         db $00, $00, $00, $79, $87, $99, $80, $F8
DATA_09D2C8:         db $C8, $7F, $80, $28, $20, $07, $C0, $00
DATA_09D2D0:         db $00, $00, $00, $47, $FC, $00, $80, $00
DATA_09D2D8:         db $F8, $60, $00, $28, $20, $00, $00, $00
DATA_09D2E0:         db $00, $07, $61, $A1, $EC, $00, $80, $03
DATA_09D2E8:         db $E0, $60, $00, $1C, $20, $00, $00, $00
DATA_09D2F0:         db $00, $1C, $81, $01, $94, $00, $9C, $00
DATA_09D2F8:         db $16, $40, $00, $03, $C0, $00, $00, $00
DATA_09D300:         db $00, $31, $01, $07, $1A, $01, $E4, $00
DATA_09D308:         db $1E, $60, $00, $00, $00, $00, $00, $00
DATA_09D310:         db $00, $C6, $03, $8F, $0B, $FF, $84, $00
DATA_09D318:         db $07, $C0, $00, $00, $00, $00, $00, $00
DATA_09D320:         db $03, $88, $0E, $FB, $0A, $61, $04, $00
DATA_09D328:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D330:         db $06, $30, $30, $02, $0A, $22, $08, $00
DATA_09D338:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D340:         db $08, $40, $C0, $E2, $0A, $22, $18, $00
DATA_09D348:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D350:         db $10, $47, $03, $22, $14, $24, $30, $00
DATA_09D358:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D360:         db $20, $78, $0D, $17, $34, $68, $60, $00
DATA_09D368:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D370:         db $40, $00, $71, $0F, $E8, $69, $C0, $00
DATA_09D378:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D380:         db $40, $03, $81, $07, $F0, $4B, $00, $00
DATA_09D388:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D390:         db $60, $3E, $01, $82, $00, $CC, $00, $00
DATA_09D398:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3A0:         db $3F, $F0, $00, $81, $01, $C0, $00, $00
DATA_09D3A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3B0:         db $07, $80, $00, $C1, $C3, $00, $00, $00
DATA_09D3B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3C0:         db $00, $00, $00, $30, $FC, $00, $00, $00
DATA_09D3C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3D0:         db $00, $00, $00, $0F, $80, $00, $00, $00
DATA_09D3D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3E0:         db $00, $00, $00, $01, $80, $00, $00, $00
DATA_09D3E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D3F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D400:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D408:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D410:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D418:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D420:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D428:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D430:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D438:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D440:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D448:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D450:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D458:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D460:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D468:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D470:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D478:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D480:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D488:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D490:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D498:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4D0:         db $00, $00, $00, $00, $66, $00, $00, $00
DATA_09D4D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4E0:         db $00, $00, $00, $00, $66, $00, $00, $00
DATA_09D4E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D4F0:         db $00, $00, $00, $00, $66, $1F, $00, $00
DATA_09D4F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D500:         db $00, $00, $00, $00, $66, $71, $80, $00
DATA_09D508:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D510:         db $00, $00, $00, $00, $67, $80, $60, $00
DATA_09D518:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D520:         db $00, $00, $00, $00, $06, $00, $20, $00
DATA_09D528:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D530:         db $00, $00, $00, $00, $08, $00, $10, $00
DATA_09D538:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D540:         db $00, $00, $00, $00, $F0, $00, $10, $00
DATA_09D548:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D550:         db $00, $00, $00, $F3, $00, $00, $08, $00
DATA_09D558:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D560:         db $00, $00, $01, $9C, $00, $00, $08, $00
DATA_09D568:         db $00, $00, $00, $00, $30, $00, $00, $00
DATA_09D570:         db $00, $00, $02, $08, $00, $00, $08, $00
DATA_09D578:         db $00, $00, $00, $00, $50, $00, $00, $00
DATA_09D580:         db $00, $00, $02, $10, $00, $00, $08, $00
DATA_09D588:         db $00, $00, $00, $00, $97, $FC, $00, $00
DATA_09D590:         db $00, $00, $02, $10, $00, $00, $08, $00
DATA_09D598:         db $00, $00, $00, $00, $9F, $07, $00, $00
DATA_09D5A0:         db $00, $00, $01, $F0, $00, $00, $10, $00
DATA_09D5A8:         db $00, $00, $00, $00, $7B, $E1, $80, $00
DATA_09D5B0:         db $00, $00, $00, $F0, $00, $00, $10, $00
DATA_09D5B8:         db $00, $00, $00, $00, $3C, $F8, $40, $00
DATA_09D5C0:         db $00, $00, $00, $90, $03, $E0, $20, $00
DATA_09D5C8:         db $00, $00, $00, $00, $77, $1E, $60, $00
DATA_09D5D0:         db $00, $00, $00, $98, $0C, $1C, $60, $00
DATA_09D5D8:         db $00, $00, $00, $00, $53, $87, $30, $00
DATA_09D5E0:         db $00, $03, $00, $C8, $10, $07, $80, $00
DATA_09D5E8:         db $00, $00, $01, $FC, $D1, $C3, $B0, $00
DATA_09D5F0:         db $00, $03, $C3, $FC, $30, $00, $00, $00
DATA_09D5F8:         db $00, $00, $06, $06, $90, $E1, $90, $00
DATA_09D600:         db $00, $02, $6C, $66, $20, $00, $00, $00
DATA_09D608:         db $00, $00, $04, $03, $98, $F0, $D0, $00
DATA_09D610:         db $00, $02, $38, $23, $3F, $FF, $FF, $FF
DATA_09D618:         db $FF, $FF, $F8, $01, $98, $78, $D0, $00
DATA_09D620:         db $00, $02, $6F, $FF, $20, $00, $00, $00
DATA_09D628:         db $00, $00, $00, $01, $98, $3C, $D0, $00
DATA_09D630:         db $00, $02, $98, $7D, $20, $00, $00, $00
DATA_09D638:         db $00, $00, $00, $01, $9C, $1C, $50, $00
DATA_09D640:         db $00, $01, $81, $81, $BF, $FF, $FF, $FF
DATA_09D648:         db $FF, $FF, $FC, $03, $CC, $0E, $70, $00
DATA_09D650:         db $00, $01, $86, $02, $A0, $00, $00, $00
DATA_09D658:         db $00, $00, $03, $8E, $4F, $06, $20, $00
DATA_09D660:         db $00, $01, $84, $06, $A0, $00, $00, $00
DATA_09D668:         db $00, $00, $00, $78, $47, $83, $60, $00
DATA_09D670:         db $00, $00, $CC, $04, $B8, $00, $00, $00
DATA_09D678:         db $00, $00, $00, $00, $23, $E1, $C0, $00
DATA_09D680:         db $00, $00, $F8, $18, $86, $00, $00, $00
DATA_09D688:         db $00, $00, $00, $00, $18, $7D, $80, $00
DATA_09D690:         db $00, $00, $60, $EC, $42, $00, $00, $00
DATA_09D698:         db $00, $00, $00, $00, $06, $07, $00, $00
DATA_09D6A0:         db $00, $03, $FF, $FB, $66, $00, $00, $00
DATA_09D6A8:         db $00, $00, $00, $00, $01, $FE, $00, $00
DATA_09D6B0:         db $00, $04, $03, $E0, $BC, $00, $00, $00
DATA_09D6B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6C0:         db $00, $07, $FC, $3F, $80, $00, $00, $00
DATA_09D6C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D6F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D700:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D708:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D710:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D718:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D720:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D728:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D730:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D738:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D740:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D748:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D750:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D758:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D760:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D768:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D770:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D778:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D780:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D788:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D790:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D798:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D7F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D800:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D808:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D810:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D818:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D820:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D828:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D830:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D838:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D840:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D848:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D850:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D858:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D860:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D868:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D870:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D878:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D880:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D888:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D890:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D898:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D8F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D900:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D908:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D910:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D918:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D920:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D928:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09D930:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D938:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D940:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D948:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D950:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D958:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D960:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D968:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D970:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D978:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D980:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D988:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D990:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D998:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D9A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D9A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D9B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D9B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09D9C0:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D9C8:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09D9D0:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D9D8:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09D9E0:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D9E8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D9F0:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09D9F8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DA00:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA08:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA10:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DA18:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DA20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DA28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DA30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DA38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DA40:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DA48:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DA50:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA58:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA60:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DA68:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DA70:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DA78:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DA80:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA88:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DA90:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DA98:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DAA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DAA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DAB0:         db $00, $00, $00, $FF, $FF, $FF, $FF, $FF
DATA_09DAB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DAC0:         db $00, $00, $00, $BD, $BD, $BD, $BD, $BD
DATA_09DAC8:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DAD0:         db $00, $00, $00, $DB, $DB, $DB, $DB, $DB
DATA_09DAD8:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DAE0:         db $30, $00, $00, $E7, $E7, $E7, $E7, $E7
DATA_09DAE8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DAF0:         db $50, $00, $00, $E7, $E7, $E7, $E7, $E7
DATA_09DAF8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DB00:         db $90, $00, $00, $DB, $DB, $DB, $DB, $DB
DATA_09DB08:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DB10:         db $9F, $00, $00, $BD, $BD, $BD, $BD, $BD
DATA_09DB18:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DB20:         db $7D, $80, $00, $FF, $FF, $FF, $FF, $FF
DATA_09DB28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DB30:         db $6C, $FF, $00, $FF, $FF, $FF, $FF, $FF
DATA_09DB38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DB40:         db $48, $20, $C0, $BD, $BD, $BD, $BD, $BD
DATA_09DB48:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DB50:         db $48, $60, $60, $DB, $DB, $DB, $DB, $DB
DATA_09DB58:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DB60:         db $CC, $C0, $30, $E7, $E7, $E7, $E7, $E7
DATA_09DB68:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DB70:         db $87, $81, $10, $E7, $E7, $E7, $E7, $E7
DATA_09DB78:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DB80:         db $80, $03, $D0, $DB, $DB, $DB, $DB, $DB
DATA_09DB88:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DB90:         db $80, $04, $70, $BD, $BD, $BD, $BD, $BD
DATA_09DB98:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DBA0:         db $86, $08, $10, $FF, $FF, $FF, $FF, $FF
DATA_09DBA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DBB0:         db $99, $88, $10, $FF, $FF, $FF, $FF, $FF
DATA_09DBB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DBC0:         db $E0, $88, $10, $BD, $BD, $BD, $BD, $BD
DATA_09DBC8:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DBD0:         db $60, $C8, $20, $DB, $DB, $DB, $DB, $DB
DATA_09DBD8:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DBE0:         db $60, $4C, $60, $E7, $E7, $E7, $E7, $E7
DATA_09DBE8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DBF0:         db $60, $43, $C0, $E7, $E7, $E7, $E7, $E7
DATA_09DBF8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DC00:         db $30, $80, $80, $DB, $DB, $DB, $DB, $DB
DATA_09DC08:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DC10:         db $1F, $83, $00, $BD, $BD, $BD, $BD, $BD
DATA_09DC18:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DC20:         db $07, $FE, $00, $FF, $FF, $FF, $FF, $FF
DATA_09DC28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DC30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DC38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DC40:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DC48:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DC50:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DC58:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DC60:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DC68:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DC70:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DC78:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DC80:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DC88:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DC90:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DC98:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DCA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DCA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DCB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DCB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DCC0:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DCC8:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DCD0:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DCD8:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DCE0:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DCE8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DCF0:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DCF8:         db $E7, $E7, $E7, $E7, $E7, $E7, $E7, $E7
DATA_09DD00:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DD08:         db $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
DATA_09DD10:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DD18:         db $BD, $BD, $BD, $BD, $BD, $BD, $BD, $BD
DATA_09DD20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DD28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09DD30:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD38:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD40:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD48:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD50:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD58:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD60:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD68:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD70:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD78:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD80:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD88:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD90:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DD98:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDA0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDA8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDB0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDB8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDC0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDC8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDD0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDD8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDE0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDE8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDF0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DDF8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE00:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE08:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE10:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE18:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE20:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE28:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE30:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE38:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE40:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE48:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE50:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE58:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE60:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE68:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE70:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE78:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE80:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE88:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE90:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DE98:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEA0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEA8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEB0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEB8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEC0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEC8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DED0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DED8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEE0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEE8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEF0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DEF8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF00:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF08:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF10:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF18:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF20:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF28:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF30:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF38:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF40:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF48:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF50:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF58:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF60:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF68:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF70:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF78:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF80:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF88:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF90:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DF98:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFA0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFA8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFB0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFB8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFC0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFC8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFD0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFD8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFE0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFE8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFF0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09DFF8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E000:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E008:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E010:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E018:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E020:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E028:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E030:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E038:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E040:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E048:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E050:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E058:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E060:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E068:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E070:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E078:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E080:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E088:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E090:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E098:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0A0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0A8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E0F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E100:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E108:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E110:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E118:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E120:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E128:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E130:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E138:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E140:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E148:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E150:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E158:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E160:         db $00, $07, $E0, $00, $00, $05, $05, $00
DATA_09E168:         db $00, $05, $00, $0C, $0C, $00, $00, $00
DATA_09E170:         db $00, $04, $20, $10, $00, $05, $35, $00
DATA_09E178:         db $40, $05, $04, $08, $08, $00, $00, $00
DATA_09E180:         db $00, $04, $20, $10, $00, $00, $18, $00
DATA_09E188:         db $40, $80, $44, $08, $08, $00, $00, $00
DATA_09E190:         db $00, $3C, $3C, $FF, $00, $FE, $08, $00
DATA_09E198:         db $61, $84, $44, $18, $18, $00, $00, $00
DATA_09E1A0:         db $00, $21, $84, $10, $00, $0C, $08, $00
DATA_09E1A8:         db $27, $BF, $FF, $10, $10, $00, $00, $00
DATA_09E1B0:         db $00, $22, $44, $10, $00, $18, $18, $00
DATA_09E1B8:         db $3C, $82, $44, $10, $10, $00, $00, $00
DATA_09E1C0:         db $00, $22, $44, $10, $00, $30, $52, $7C
DATA_09E1C8:         db $30, $82, $44, $10, $10, $00, $00, $00
DATA_09E1D0:         db $00, $21, $84, $FF, $FF, $60, $DB, $C6
DATA_09E1D8:         db $60, $9E, $44, $10, $10, $00, $00, $00
DATA_09E1E0:         db $00, $3C, $3C, $08, $00, $40, $89, $02
DATA_09E1E8:         db $C0, $B3, $40, $00, $00, $00, $00, $00
DATA_09E1F0:         db $00, $04, $20, $08, $00, $40, $89, $06
DATA_09E1F8:         db $81, $A2, $40, $10, $10, $00, $00, $00
DATA_09E200:         db $00, $04, $20, $0C, $00, $63, $18, $0C
DATA_09E208:         db $C3, $B6, $63, $38, $38, $00, $00, $00
DATA_09E210:         db $00, $07, $E0, $04, $00, $3E, $30, $18
DATA_09E218:         db $7E, $1C, $3E, $30, $30, $00, $00, $00
DATA_09E220:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E228:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E230:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E238:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E240:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E248:         db $00, $00, $00, $02, $00, $00, $00, $00
DATA_09E250:         db $00, $00, $00, $18, $00, $00, $00, $00
DATA_09E258:         db $00, $00, $00, $02, $00, $00, $00, $00
DATA_09E260:         db $00, $00, $01, $9B, $E0, $00, $00, $00
DATA_09E268:         db $00, $00, $21, $02, $00, $00, $00, $00
DATA_09E270:         db $00, $00, $01, $9F, $F8, $00, $00, $00
DATA_09E278:         db $00, $00, $20, $81, $00, $00, $00, $00
DATA_09E280:         db $00, $00, $01, $CE, $0C, $00, $00, $00
DATA_09E288:         db $00, $00, $20, $81, $00, $00, $00, $00
DATA_09E290:         db $00, $00, $01, $D8, $06, $00, $00, $00
DATA_09E298:         db $00, $00, $10, $81, $00, $00, $00, $00
DATA_09E2A0:         db $00, $00, $30, $10, $02, $00, $00, $00
DATA_09E2A8:         db $00, $00, $08, $80, $80, $00, $00, $00
DATA_09E2B0:         db $00, $00, $4C, $10, $03, $00, $00, $00
DATA_09E2B8:         db $00, $00, $08, $40, $80, $00, $00, $00
DATA_09E2C0:         db $00, $00, $C3, $00, $03, $00, $00, $00
DATA_09E2C8:         db $00, $00, $08, $40, $80, $00, $00, $00
DATA_09E2D0:         db $00, $00, $8C, $80, $03, $00, $00, $00
DATA_09E2D8:         db $00, $00, $08, $40, $00, $00, $00, $00
DATA_09E2E0:         db $00, $00, $74, $00, $03, $00, $00, $00
DATA_09E2E8:         db $00, $00, $08, $40, $00, $00, $00, $00
DATA_09E2F0:         db $00, $00, $38, $00, $03, $00, $00, $00
DATA_09E2F8:         db $00, $00, $01, $E0, $0C, $00, $00, $00
DATA_09E300:         db $00, $00, $28, $00, $02, $00, $00, $00
DATA_09E308:         db $00, $00, $03, $31, $8C, $00, $00, $00
DATA_09E310:         db $00, $00, $68, $40, $02, $00, $00, $00
DATA_09E318:         db $00, $00, $02, $11, $98, $00, $00, $00
DATA_09E320:         db $00, $00, $78, $20, $0C, $00, $00, $00
DATA_09E328:         db $00, $00, $02, $1F, $B8, $00, $00, $00
DATA_09E330:         db $00, $00, $3C, $30, $08, $00, $00, $00
DATA_09E338:         db $00, $00, $03, $E3, $BF, $C0, $00, $00
DATA_09E340:         db $00, $00, $3C, $1C, $30, $00, $00, $00
DATA_09E348:         db $00, $00, $04, $C7, $10, $30, $00, $00
DATA_09E350:         db $00, $00, $0F, $07, $E0, $00, $00, $00
DATA_09E358:         db $00, $00, $09, $86, $20, $18, $00, $00
DATA_09E360:         db $00, $00, $03, $F2, $00, $00, $00, $00
DATA_09E368:         db $00, $00, $09, $02, $00, $08, $00, $00
DATA_09E370:         db $00, $00, $00, $63, $00, $00, $01, $00
DATA_09E378:         db $00, $00, $07, $0C, $00, $0C, $00, $00
DATA_09E380:         db $00, $00, $00, $41, $00, $00, $03, $00
DATA_09E388:         db $00, $00, $07, $18, $00, $04, $00, $00
DATA_09E390:         db $00, $00, $00, $81, $00, $03, $03, $00
DATA_09E398:         db $00, $00, $35, $88, $00, $04, $00, $00
DATA_09E3A0:         db $00, $00, $03, $C1, $00, $03, $C3, $80
DATA_09E3A8:         db $00, $00, $FB, $C8, $00, $04, $00, $00
DATA_09E3B0:         db $00, $00, $07, $40, $80, $03, $F7, $80
DATA_09E3B8:         db $00, $01, $09, $F8, $00, $04, $00, $00
DATA_09E3C0:         db $00, $00, $39, $40, $80, $03, $FF, $C0
DATA_09E3C8:         db $00, $01, $0F, $44, $00, $08, $00, $00
DATA_09E3D0:         db $00, $03, $C2, $71, $80, $07, $FF, $C0
DATA_09E3D8:         db $00, $01, $01, $C6, $00, $18, $00, $00
DATA_09E3E0:         db $00, $03, $06, $11, $00, $07, $FF, $E0
DATA_09E3E8:         db $00, $01, $80, $43, $00, $30, $00, $00
DATA_09E3F0:         db $00, $01, $06, $31, $00, $0F, $FF, $F0
DATA_09E3F8:         db $00, $00, $FE, $41, $80, $40, $00, $00
DATA_09E400:         db $00, $00, $C3, $E3, $00, $0F, $FF, $F8
DATA_09E408:         db $00, $40, $72, $C0, $E3, $80, $00, $00
DATA_09E410:         db $00, $00, $E0, $06, $00, $07, $FF, $FC
DATA_09E418:         db $00, $60, $03, $80, $DC, $00, $00, $00
DATA_09E420:         db $00, $00, $30, $18, $00, $01, $FF, $F8
DATA_09E428:         db $00, $78, $07, $00, $60, $04, $00, $00
DATA_09E430:         db $00, $00, $0F, $F0, $00, $00, $1F, $E0
DATA_09E438:         db $00, $20, $1C, $08, $20, $84, $00, $00
DATA_09E440:         db $00, $00, $00, $00, $00, $00, $1F, $80
DATA_09E448:         db $00, $20, $78, $3C, $21, $C3, $00, $00
DATA_09E450:         db $00, $00, $0E, $70, $00, $00, $1E, $00
DATA_09E458:         db $00, $20, $20, $3C, $23, $C0, $E0, $00
DATA_09E460:         db $00, $00, $1E, $50, $00, $00, $3E, $00
DATA_09E468:         db $00, $40, $20, $7C, $67, $C1, $80, $00
DATA_09E470:         db $00, $02, $32, $90, $00, $00, $38, $00
DATA_09E478:         db $00, $80, $30, $F8, $4F, $C2, $00, $00
DATA_09E480:         db $00, $04, $26, $90, $00, $00, $30, $00
DATA_09E488:         db $07, $C0, $19, $F8, $4F, $84, $00, $00
DATA_09E490:         db $00, $04, $24, $90, $00, $00, $00, $00
DATA_09E498:         db $00, $60, $0F, $E0, $9E, $0C, $00, $00
DATA_09E4A0:         db $00, $08, $28, $E0, $00, $00, $00, $00
DATA_09E4A8:         db $00, $10, $07, $E3, $1C, $08, $00, $00
DATA_09E4B0:         db $00, $18, $B0, $60, $00, $00, $00, $00
DATA_09E4B8:         db $00, $10, $03, $C6, $18, $38, $00, $00
DATA_09E4C0:         db $00, $11, $00, $00, $00, $00, $00, $00
DATA_09E4C8:         db $00, $3E, $03, $F8, $01, $CC, $00, $00
DATA_09E4D0:         db $00, $11, $00, $00, $00, $00, $00, $00
DATA_09E4D8:         db $00, $62, $E0, $00, $01, $02, $00, $00
DATA_09E4E0:         db $00, $11, $08, $00, $00, $00, $00, $00
DATA_09E4E8:         db $00, $C3, $B0, $00, $7A, $00, $00, $00
DATA_09E4F0:         db $00, $02, $10, $00, $00, $00, $00, $00
DATA_09E4F8:         db $00, $03, $17, $CF, $46, $00, $00, $00
DATA_09E500:         db $00, $02, $10, $00, $00, $00, $00, $00
DATA_09E508:         db $00, $04, $18, $69, $C3, $00, $00, $00
DATA_09E510:         db $00, $02, $20, $00, $00, $00, $00, $00
DATA_09E518:         db $00, $00, $08, $18, $41, $00, $00, $00
DATA_09E520:         db $00, $02, $20, $00, $00, $00, $00, $00
DATA_09E528:         db $00, $00, $00, $18, $00, $00, $00, $00
DATA_09E530:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E538:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E540:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E548:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E550:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E558:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E560:         db $00, $00, $05, $00, $00, $05, $00, $05
DATA_09E568:         db $00, $00, $00, $05, $0C, $0C, $00, $00
DATA_09E570:         db $00, $83, $15, $10, $00, $05, $20, $05
DATA_09E578:         db $30, $20, $FC, $05, $08, $08, $00, $00
DATA_09E580:         db $00, $C6, $10, $3E, $C0, $00, $26, $80
DATA_09E588:         db $1C, $20, $0C, $F8, $08, $08, $00, $00
DATA_09E590:         db $00, $6C, $FF, $63, $78, $FE, $F3, $84
DATA_09E598:         db $06, $AC, $18, $18, $18, $18, $00, $00
DATA_09E5A0:         db $00, $38, $10, $C1, $01, $0C, $41, $9F
DATA_09E5A8:         db $20, $BE, $30, $30, $10, $10, $00, $00
DATA_09E5B0:         db $00, $10, $10, $91, $01, $18, $C4, $82
DATA_09E5B8:         db $60, $B2, $3E, $60, $10, $10, $00, $00
DATA_09E5C0:         db $00, $10, $52, $1B, $03, $30, $84, $82
DATA_09E5C8:         db $3E, $A2, $03, $FF, $10, $10, $00, $00
DATA_09E5D0:         db $00, $30, $D2, $0E, $06, $60, $3C, $82
DATA_09E5D8:         db $03, $A6, $79, $18, $10, $10, $00, $00
DATA_09E5E0:         db $00, $20, $93, $06, $0C, $40, $66, $82
DATA_09E5E8:         db $01, $E4, $CD, $30, $00, $00, $00, $00
DATA_09E5F0:         db $00, $20, $91, $0C, $18, $40, $47, $C6
DATA_09E5F8:         db $03, $E6, $87, $20, $10, $10, $00, $00
DATA_09E600:         db $00, $20, $18, $18, $30, $63, $6D, $0C
DATA_09E608:         db $C6, $23, $C6, $33, $38, $38, $00, $00
DATA_09E610:         db $00, $20, $08, $30, $60, $3E, $38, $08
DATA_09E618:         db $7C, $20, $7C, $1E, $30, $30, $00, $00
DATA_09E620:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E628:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E630:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E638:         db $00, $00, $00, $07, $80, $00, $00, $00
DATA_09E640:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E648:         db $00, $80, $40, $18, $78, $00, $00, $00
DATA_09E650:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E658:         db $00, $86, $40, $20, $0F, $00, $00, $00
DATA_09E660:         db $00, $00, $00, $00, $00, $00, $00, $01
DATA_09E668:         db $C1, $1A, $C0, $00, $01, $80, $00, $00
DATA_09E670:         db $00, $00, $00, $00, $00, $00, $00, $01
DATA_09E678:         db $23, $08, $80, $00, $00, $C0, $00, $00
DATA_09E680:         db $00, $00, $00, $00, $00, $00, $00, $11
DATA_09E688:         db $25, $00, $00, $1F, $80, $60, $00, $00
DATA_09E690:         db $00, $00, $00, $00, $00, $00, $00, $13
DATA_09E698:         db $C9, $80, $00, $60, $60, $20, $00, $00
DATA_09E6A0:         db $00, $00, $00, $00, $00, $00, $00, $0C
DATA_09E6A8:         db $00, $80, $00, $40, $38, $00, $00, $00
DATA_09E6B0:         db $00, $00, $00, $00, $00, $00, $00, $18
DATA_09E6B8:         db $00, $80, $CC, $00, $0C, $0F, $C0, $00
DATA_09E6C0:         db $00, $00, $0D, $8F, $80, $00, $00, $29
DATA_09E6C8:         db $00, $00, $CC, $00, $06, $18, $E0, $00
DATA_09E6D0:         db $00, $00, $0D, $98, $C0, $00, $00, $45
DATA_09E6D8:         db $C0, $00, $CC, $01, $E0, $3C, $70, $00
DATA_09E6E0:         db $00, $00, $0F, $E0, $60, $00, $00, $12
DATA_09E6E8:         db $40, $33, $EC, $00, $18, $7C, $38, $00
DATA_09E6F0:         db $00, $00, $1D, $80, $20, $00, $00, $12
DATA_09E6F8:         db $00, $7E, $CD, $F8, $0C, $7C, $1C, $00
DATA_09E700:         db $00, $00, $2D, $80, $10, $00, $00, $18
DATA_09E708:         db $00, $88, $06, $0C, $04, $F8, $FC, $00
DATA_09E710:         db $00, $00, $E0, $00, $18, $00, $00, $00
DATA_09E718:         db $00, $90, $08, $02, $00, $C1, $EC, $00
DATA_09E720:         db $00, $01, $40, $00, $18, $00, $00, $00
DATA_09E728:         db $00, $B0, $10, $03, $00, $81, $EC, $00
DATA_09E730:         db $00, $01, $40, $80, $18, $00, $00, $00
DATA_09E738:         db $01, $E0, $00, $01, $00, $81, $EC, $00
DATA_09E740:         db $00, $0F, $C1, $80, $18, $02, $00, $00
DATA_09E748:         db $03, $20, $00, $01, $01, $B9, $CC, $00
DATA_09E750:         db $00, $3B, $43, $00, $18, $03, $00, $00
DATA_09E758:         db $02, $20, $00, $01, $01, $FC, $0C, $00
DATA_09E760:         db $00, $21, $E6, $00, $30, $03, $80, $00
DATA_09E768:         db $02, $20, $10, $01, $01, $DE, $1C, $00
DATA_09E770:         db $00, $71, $E2, $00, $30, $03, $80, $30
DATA_09E778:         db $03, $20, $70, $03, $00, $FE, $18, $00
DATA_09E780:         db $00, $79, $D3, $00, $60, $23, $80, $78
DATA_09E788:         db $C0, $F1, $C0, $02, $00, $FC, $70, $00
DATA_09E790:         db $00, $F9, $E9, $81, $C0, $7F, $C0, $49
DATA_09E798:         db $C0, $18, $C0, $06, $00, $7B, $E0, $00
DATA_09E7A0:         db $00, $F8, $FC, $E2, $60, $3F, $E0, $4D
DATA_09E7A8:         db $FF, $9C, $27, $84, $00, $1F, $C0, $00
DATA_09E7B0:         db $00, $B0, $2E, $3C, $90, $3F, $F0, $45
DATA_09E7B8:         db $7F, $F0, $3C, $8C, $00, $00, $00, $00
DATA_09E7C0:         db $00, $80, $24, $21, $30, $3F, $F8, $45
DATA_09E7C8:         db $20, $50, $78, $F8, $00, $00, $00, $00
DATA_09E7D0:         db $00, $80, $40, $99, $30, $3F, $FC, $43
DATA_09E7D8:         db $31, $A0, $00, $70, $00, $00, $00, $00
DATA_09E7E0:         db $00, $F0, $81, $0E, $30, $3F, $FC, $43
DATA_09E7E8:         db $3E, $60, $00, $18, $00, $00, $00, $00
DATA_09E7F0:         db $00, $7C, $82, $06, $70, $23, $F0, $63
DATA_09E7F8:         db $30, $41, $00, $08, $00, $00, $00, $00
DATA_09E800:         db $00, $7C, $CC, $02, $60, $03, $C0, $27
DATA_09E808:         db $1F, $81, $C0, $08, $00, $00, $00, $00
DATA_09E810:         db $00, $3C, $7C, $02, $60, $03, $80, $25
DATA_09E818:         db $80, $03, $FE, $18, $00, $00, $00, $00
DATA_09E820:         db $00, $1F, $C4, $01, $60, $03, $80, $2C
DATA_09E828:         db $80, $03, $03, $70, $00, $00, $00, $00
DATA_09E830:         db $00, $00, $04, $00, $C0, $03, $00, $30
DATA_09E838:         db $C0, $07, $00, $C0, $00, $00, $00, $00
DATA_09E840:         db $00, $00, $06, $00, $40, $02, $00, $00
DATA_09E848:         db $60, $06, $00, $00, $00, $00, $00, $00
DATA_09E850:         db $00, $00, $02, $00, $80, $00, $00, $00
DATA_09E858:         db $7C, $0C, $00, $00, $00, $00, $00, $00
DATA_09E860:         db $00, $00, $01, $07, $00, $00, $00, $00
DATA_09E868:         db $1F, $78, $00, $00, $00, $00, $00, $00
DATA_09E870:         db $00, $00, $07, $FC, $00, $00, $00, $00
DATA_09E878:         db $03, $C0, $00, $00, $00, $00, $00, $00
DATA_09E880:         db $00, $00, $1C, $20, $00, $00, $00, $00
DATA_09E888:         db $06, $3E, $00, $00, $00, $00, $00, $00
DATA_09E890:         db $00, $00, $20, $10, $00, $00, $00, $00
DATA_09E898:         db $0C, $01, $00, $00, $00, $00, $00, $00
DATA_09E8A0:         db $00, $00, $3F, $F0, $00, $00, $00, $00
DATA_09E8A8:         db $0F, $FF, $00, $00, $00, $00, $00, $00
DATA_09E8B0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8B8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8C0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8D8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8E0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8E8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8F0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E8F8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E900:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E908:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E910:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E918:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E920:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_09E928:         db $00, $00, $00, $00, $00, $00, $00

CODE_09E92F:         romb               ;
CODE_09E931:         from r14           ;
CODE_09E932:         add   r14          ;
CODE_09E933:         to r14             ;
CODE_09E934:         add   r10          ;
CODE_09E935:         to r10             ;
CODE_09E936:         getb               ;
CODE_09E937:         inc   r14          ;
CODE_09E938:         with r10           ;
CODE_09E939:         getbh              ;
CODE_09E93B:         ibt   r0,#0002     ;
CODE_09E93D:         color              ;
CODE_09E93E:         iwt   r13,#E988    ;
CODE_09E941:         cache              ;
CODE_09E942:         iwt   r3,#00FF     ;
CODE_09E945:         from r10           ;
CODE_09E946:         to r14             ;
CODE_09E947:         add   r11          ;
CODE_09E948:         getb               ;
CODE_09E949:         sms   (003E),r0    ;
CODE_09E94C:         cmp   r3           ;
CODE_09E94E:         beq CODE_09E963    ;
CODE_09E950:         dec   r3           ;
CODE_09E951:         cmp   r3           ;
CODE_09E953:         beq CODE_09E95F    ;
CODE_09E955:         dec   r3           ;
CODE_09E956:         cmp   r3           ;
CODE_09E958:         bne CODE_09E96A    ;
CODE_09E95A:         nop                ;
CODE_09E95B:         iwt   r15,#E9AD    ;
CODE_09E95E:         nop                ;
CODE_09E95F:         inc   r11          ;
CODE_09E960:         inc   r14          ;
CODE_09E961:         to r8              ;
CODE_09E962:         getb               ;
CODE_09E963:         inc   r11          ;
CODE_09E964:         inc   r14          ;
CODE_09E965:         to r9              ;
CODE_09E966:         getb               ;
CODE_09E967:         inc   r11          ;
CODE_09E968:         inc   r14          ;
CODE_09E969:         getb               ;
CODE_09E96A:         inc   r11          ;
CODE_09E96B:         ibt   r6,#000C     ;
CODE_09E96D:         lmult              ;
CODE_09E96F:         ibt   r0,#0009     ;
CODE_09E971:         romb               ;
CODE_09E973:         iwt   r0,#BD2F     ;
CODE_09E976:         to r14             ;
CODE_09E977:         add   r4           ;
CODE_09E978:         ibt   r3,#000C     ;
CODE_09E97A:         move  r2,r8        ;
CODE_09E97C:         ibt   r12,#0008    ;
CODE_09E97E:         move  r1,r9        ;
CODE_09E980:         ibt   r0,#0000     ;
CODE_09E982:         getbl              ;
CODE_09E984:         to r5              ;
CODE_09E985:         swap               ;
CODE_09E986:         beq CODE_09E994    ;
CODE_09E988:         with r5            ;
CODE_09E989:         rol                ;
CODE_09E98A:         bcc CODE_09E991    ;
CODE_09E98C:         nop                ;
CODE_09E98D:         plot               ;
CODE_09E98E:         bra CODE_09E992    ;

CODE_09E990:         nop                ;

CODE_09E991:         inc   r1           ;
CODE_09E992:         loop               ;
CODE_09E993:         nop                ;
CODE_09E994:         dec   r3           ;
CODE_09E995:         beq CODE_09E99C    ;
CODE_09E997:         inc   r2           ;
CODE_09E998:         inc   r14          ;
CODE_09E999:         bra CODE_09E97C    ;

CODE_09E99B:         nop                ;

CODE_09E99C:         rpix               ;
CODE_09E99E:         ibt   r0,#0009     ;
CODE_09E9A0:         romb               ;
CODE_09E9A2:         iwt   r14,#BC2F    ;
CODE_09E9A5:         lms   r0,(003E)    ;
CODE_09E9A8:         to r14             ;
CODE_09E9A9:         add   r14          ;
CODE_09E9AA:         getb               ;
CODE_09E9AB:         to r9              ;
CODE_09E9AC:         add   r9           ;
CODE_09E9AD:         stop               ;
CODE_09E9AE:         nop                ;

CODE_09E9AF:         cache              ;
CODE_09E9B0:         ibt   r0,#0000     ;
CODE_09E9B2:         cmode              ;
CODE_09E9B4:         sms   (00B0),r0    ;
CODE_09E9B7:         lms   r0,(00AA)    ;
CODE_09E9BA:         romb               ;
CODE_09E9BC:         lms   r14,(00A8)   ;
CODE_09E9BF:         to r11             ;
CODE_09E9C0:         getb               ;
CODE_09E9C1:         inc   r14          ;
CODE_09E9C2:         sms   (00A8),r14   ;
CODE_09E9C5:         move  r0,r11       ;
CODE_09E9C7:         sms   (003E),r0    ;
CODE_09E9CA:         iwt   r3,#00FF     ;
CODE_09E9CD:         cmp   r3           ;
CODE_09E9CF:         beq CODE_09EA06    ;
CODE_09E9D1:         dec   r3           ;
CODE_09E9D2:         cmp   r3           ;
CODE_09E9D4:         beq CODE_09E9F1    ;
CODE_09E9D6:         dec   r3           ;
CODE_09E9D7:         cmp   r3           ;
CODE_09E9D9:         beq CODE_09E9F1    ;
CODE_09E9DB:         dec   r3           ;
CODE_09E9DC:         cmp   r3           ;
CODE_09E9DE:         beq CODE_09E9F1    ;
CODE_09E9E0:         dec   r3           ;
CODE_09E9E1:         cmp   r3           ;
CODE_09E9E3:         beq CODE_09E9F1    ;
CODE_09E9E5:         dec   r3           ;
CODE_09E9E6:         ibt   r3,#FFFE     ;
CODE_09E9E8:         lms   r0,(00B0)    ;
CODE_09E9EB:         lob                ;
CODE_09E9EC:         beq CODE_09E9F1    ;
CODE_09E9EE:         nop                ;
CODE_09E9EF:         ibt   r3,#FFF9     ;
CODE_09E9F1:         inc   r3           ;
CODE_09E9F2:         ibt   r0,#0009     ;
CODE_09E9F4:         romb               ;
CODE_09E9F6:         from r3            ;
CODE_09E9F7:         sex                ;
CODE_09E9F8:         not                ;
CODE_09E9F9:         add   r0           ;
CODE_09E9FA:         iwt   r14,#EA08    ;
CODE_09E9FD:         to r14             ;
CODE_09E9FE:         add   r14          ;
CODE_09E9FF:         getb               ;
CODE_09EA00:         inc   r14          ;
CODE_09EA01:         getbh              ;
CODE_09EA03:         move  r15,r0       ;
CODE_09EA05:         nop                ;
CODE_09EA06:         stop               ;
CODE_09EA07:         nop                ;

DATA_09EA08:         dw $EA14
DATA_09EA0A:         dw $EA8D
DATA_09EA0C:         dw $EAB8
DATA_09EA0E:         dw $EACC
DATA_09EA10:         dw $EAE0
DATA_09EA12:         dw $EAE9

CODE_09EA14:         ibt   r0,#0009     ;
CODE_09EA16:         romb               ;
CODE_09EA18:         ibt   r6,#000C     ;
CODE_09EA1A:         from r11           ;
CODE_09EA1B:         lmult              ;
CODE_09EA1D:         iwt   r14,#BD2F    ;
CODE_09EA20:         from r14           ;
CODE_09EA21:         to r9              ;
CODE_09EA22:         add   r4           ;
CODE_09EA23:         lms   r5,(00AC)    ;
CODE_09EA26:         move  r2,r5        ;
CODE_09EA28:         ibt   r3,#0007     ;
CODE_09EA2A:         ibt   r4,#007F     ;
CODE_09EA2C:         iwt   r13,#EA47    ;
CODE_09EA2F:         move  r14,r9       ;
CODE_09EA31:         ibt   r12,#0008    ;
CODE_09EA33:         lms   r1,(00AE)    ;
CODE_09EA36:         getb               ;
CODE_09EA37:         to r10             ;
CODE_09EA38:         swap               ;
CODE_09EA39:         with r14           ;
CODE_09EA3A:         add   #08          ;
CODE_09EA3C:         getb               ;
CODE_09EA3D:         to r11             ;
CODE_09EA3E:         swap               ;
CODE_09EA3F:         from r3            ;
CODE_09EA40:         and   #04          ;
CODE_09EA42:         bne CODE_09EA47    ;
CODE_09EA44:         inc   r9           ;
CODE_09EA45:         ibt   r11,#0000    ;
CODE_09EA47:         ibt   r0,#0000     ;
CODE_09EA49:         with r11           ;
CODE_09EA4A:         rol                ;
CODE_09EA4B:         rol                ;
CODE_09EA4C:         with r10           ;
CODE_09EA4D:         rol                ;
CODE_09EA4E:         rol                ;
CODE_09EA4F:         color              ;
CODE_09EA50:         plot               ;
CODE_09EA51:         with r1            ;
CODE_09EA52:         and   r4           ;
CODE_09EA53:         bne CODE_09EA5A    ;
CODE_09EA55:         nop                ;
CODE_09EA56:         ibt   r0,#0020     ;
CODE_09EA58:         to r2              ;
CODE_09EA59:         add   r2           ;
CODE_09EA5A:         loop               ;
CODE_09EA5B:         nop                ;
CODE_09EA5C:         inc   r5           ;
CODE_09EA5D:         move  r2,r5        ;
CODE_09EA5F:         dec   r3           ;
CODE_09EA60:         bpl CODE_09EA2F    ;
CODE_09EA62:         nop                ;
CODE_09EA63:         iwt   r14,#BC2F    ;
CODE_09EA66:         lms   r0,(003E)    ;
CODE_09EA69:         to r14             ;
CODE_09EA6A:         add   r14          ;
CODE_09EA6B:         getb               ;
CODE_09EA6C:         lms   r1,(00AE)    ;
CODE_09EA6F:         add   r1           ;
CODE_09EA70:         sms   (00AE),r0    ;
CODE_09EA73:         ibt   r1,#007F     ;
CODE_09EA75:         cmp   r1           ;
CODE_09EA77:         bcc CODE_09EA87    ;
CODE_09EA79:         nop                ;
CODE_09EA7A:         and   r1           ;
CODE_09EA7B:         sms   (00AE),r0    ;
CODE_09EA7E:         ibt   r0,#0020     ;
CODE_09EA80:         lms   r1,(00AC)    ;
CODE_09EA83:         add   r1           ;
CODE_09EA84:         sms   (00AC),r0    ;
CODE_09EA87:         rpix               ;
CODE_09EA89:         iwt   r15,#E9B7    ;
CODE_09EA8C:         nop                ;

CODE_09EA8D:         lms   r0,(00AA)    ;
CODE_09EA90:         romb               ;
CODE_09EA92:         lms   r14,(00A8)   ;
CODE_09EA95:         getb               ;
CODE_09EA96:         swap               ;
CODE_09EA97:         inc   r14          ;
CODE_09EA98:         sms   (00A8),r14   ;
CODE_09EA9B:         iwt   r2,#0400     ;
CODE_09EA9E:         iwt   r1,#4C00     ;
CODE_09EAA1:         to r1              ;
CODE_09EAA2:         add   r1           ;
CODE_09EAA3:         with r2            ;
CODE_09EAA4:         add   r1           ;
CODE_09EAA5:         iwt   r12,#0080    ;
CODE_09EAA8:         iwt   r13,#EAAD    ;
CODE_09EAAB:         ibt   r0,#0000     ;
CODE_09EAAD:         stw   (r1)         ;
CODE_09EAAE:         inc   r1           ;
CODE_09EAAF:         inc   r1           ;
CODE_09EAB0:         stw   (r2)         ;
CODE_09EAB1:         inc   r2           ;
CODE_09EAB2:         loop               ;
CODE_09EAB3:         inc   r2           ;
CODE_09EAB4:         iwt   r15,#E9B7    ;
CODE_09EAB7:         nop                ;

CODE_09EAB8:         lms   r0,(00AA)    ;
CODE_09EABB:         romb               ;
CODE_09EABD:         lms   r14,(00A8)   ;
CODE_09EAC0:         getb               ;
CODE_09EAC1:         inc   r14          ;
CODE_09EAC2:         sms   (00A8),r14   ;
CODE_09EAC5:         sms   (00AC),r0    ;
CODE_09EAC8:         iwt   r15,#E9B7    ;
CODE_09EACB:         nop                ;

CODE_09EACC:         lms   r0,(00AA)    ;
CODE_09EACF:         romb               ;
CODE_09EAD1:         lms   r14,(00A8)   ;
CODE_09EAD4:         getb               ;
CODE_09EAD5:         inc   r14          ;
CODE_09EAD6:         sms   (00A8),r14   ;
CODE_09EAD9:         sms   (00AE),r0    ;
CODE_09EADC:         iwt   r15,#E9B7    ;
CODE_09EADF:         nop                ;

CODE_09EAE0:         ibt   r0,#0001     ;
CODE_09EAE2:         sms   (00B0),r0    ;
CODE_09EAE5:         iwt   r15,#E9B7    ;
CODE_09EAE8:         nop                ;

CODE_09EAE9:         ibt   r0,#0009     ;
CODE_09EAEB:         romb               ;
CODE_09EAED:         ibt   r6,#000C     ;
CODE_09EAEF:         from r11           ;
CODE_09EAF0:         lmult              ;
CODE_09EAF2:         iwt   r14,#BD2F    ;
CODE_09EAF5:         from r14           ;
CODE_09EAF6:         to r9              ;
CODE_09EAF7:         add   r4           ;
CODE_09EAF8:         lms   r5,(00AC)    ;
CODE_09EAFB:         ibt   r3,#0008     ;
CODE_09EAFD:         ibt   r4,#007F     ;
CODE_09EAFF:         iwt   r13,#EB14    ;
CODE_09EB02:         ibt   r12,#0008    ;
CODE_09EB04:         lms   r1,(00AE)    ;
CODE_09EB07:         move  r14,r9       ;
CODE_09EB09:         move  r2,r5        ;
CODE_09EB0B:         getb               ;
CODE_09EB0C:         to r10             ;
CODE_09EB0D:         swap               ;
CODE_09EB0E:         with r14           ;
CODE_09EB0F:         add   #04          ;
CODE_09EB11:         getb               ;
CODE_09EB12:         to r11             ;
CODE_09EB13:         swap               ;
CODE_09EB14:         ibt   r0,#0000     ;
CODE_09EB16:         with r11           ;
CODE_09EB17:         rol                ;
CODE_09EB18:         rol                ;
CODE_09EB19:         with r10           ;
CODE_09EB1A:         rol                ;
CODE_09EB1B:         rol                ;
CODE_09EB1C:         color              ;
CODE_09EB1D:         plot               ;
CODE_09EB1E:         plot               ;
CODE_09EB1F:         with r1            ;
CODE_09EB20:         and   r4           ;
CODE_09EB21:         bne CODE_09EB28    ;
CODE_09EB23:         nop                ;
CODE_09EB24:         ibt   r0,#0020     ;
CODE_09EB26:         to r2              ;
CODE_09EB27:         add   r2           ;
CODE_09EB28:         loop               ;
CODE_09EB29:         nop                ;
CODE_09EB2A:         dec   r3           ;
CODE_09EB2B:         beq CODE_09EB36    ;
CODE_09EB2D:         from r3            ;
CODE_09EB2E:         and   #01          ;
CODE_09EB30:         bne CODE_09EB02    ;
CODE_09EB32:         inc   r5           ;
CODE_09EB33:         bra CODE_09EB02    ;

CODE_09EB35:         inc   r9           ;

CODE_09EB36:         ibt   r0,#0001     ;
CODE_09EB38:         color              ;
CODE_09EB39:         inc   r5           ;
CODE_09EB3A:         inc   r9           ;
CODE_09EB3B:         inc   r9           ;
CODE_09EB3C:         inc   r9           ;
CODE_09EB3D:         inc   r9           ;
CODE_09EB3E:         inc   r9           ;
CODE_09EB3F:         ibt   r3,#0008     ;
CODE_09EB41:         iwt   r13,#EB50    ;
CODE_09EB44:         ibt   r12,#0008    ;
CODE_09EB46:         lms   r1,(00AE)    ;
CODE_09EB49:         move  r14,r9       ;
CODE_09EB4B:         move  r2,r5        ;
CODE_09EB4D:         getb               ;
CODE_09EB4E:         to r10             ;
CODE_09EB4F:         swap               ;
CODE_09EB50:         with r10           ;
CODE_09EB51:         rol                ;
CODE_09EB52:         bcc CODE_09EB59    ;
CODE_09EB54:         nop                ;
CODE_09EB55:         plot               ;
CODE_09EB56:         plot               ;
CODE_09EB57:         dec   r1           ;
CODE_09EB58:         dec   r1           ;
CODE_09EB59:         inc   r1           ;
CODE_09EB5A:         inc   r1           ;
CODE_09EB5B:         with r1            ;
CODE_09EB5C:         and   r4           ;
CODE_09EB5D:         bne CODE_09EB64    ;
CODE_09EB5F:         nop                ;
CODE_09EB60:         ibt   r0,#0020     ;
CODE_09EB62:         to r2              ;
CODE_09EB63:         add   r2           ;
CODE_09EB64:         loop               ;
CODE_09EB65:         nop                ;
CODE_09EB66:         dec   r3           ;
CODE_09EB67:         beq CODE_09EB72    ;
CODE_09EB69:         from r3            ;
CODE_09EB6A:         and   #01          ;
CODE_09EB6C:         bne CODE_09EB44    ;
CODE_09EB6E:         inc   r5           ;
CODE_09EB6F:         bra CODE_09EB44    ;

CODE_09EB71:         inc   r9           ;

CODE_09EB72:         iwt   r14,#BC2F    ;
CODE_09EB75:         lms   r0,(003E)    ;
CODE_09EB78:         to r14             ;
CODE_09EB79:         add   r14          ;
CODE_09EB7A:         to r1              ;
CODE_09EB7B:         getb               ;
CODE_09EB7C:         lms   r0,(00AE)    ;
CODE_09EB7F:         add   r1           ;
CODE_09EB80:         add   r1           ;
CODE_09EB81:         sms   (00AE),r0    ;
CODE_09EB84:         ibt   r1,#007F     ;
CODE_09EB86:         cmp   r1           ;
CODE_09EB88:         bcc CODE_09EB98    ;
CODE_09EB8A:         nop                ;
CODE_09EB8B:         and   r1           ;
CODE_09EB8C:         sms   (00AE),r0    ;
CODE_09EB8F:         ibt   r0,#0020     ;
CODE_09EB91:         lms   r1,(00AC)    ;
CODE_09EB94:         add   r1           ;
CODE_09EB95:         sms   (00AC),r0    ;
CODE_09EB98:         rpix               ;
CODE_09EB9A:         iwt   r15,#E9B7    ;
CODE_09EB9D:         nop                ;
CODE_09EB9E:         cache              ;
CODE_09EB9F:         ibt   r0,#0011     ;
CODE_09EBA1:         cmode              ;
CODE_09EBA3:         lms   r0,(0028)    ;
CODE_09EBA6:         color              ;
CODE_09EBA7:         ibt   r1,#0000     ;
CODE_09EBA9:         ibt   r2,#0000     ;
CODE_09EBAB:         ibt   r3,#007F     ;
CODE_09EBAD:         ibt   r12,#0010    ;
CODE_09EBAF:         iwt   r13,#EBB2    ;
CODE_09EBB2:         plot               ;
CODE_09EBB3:         with r1            ;
CODE_09EBB4:         and   r3           ;
CODE_09EBB5:         bne CODE_09EBB2    ;
CODE_09EBB7:         nop                ;
CODE_09EBB8:         loop               ;
CODE_09EBB9:         inc   r2           ;
CODE_09EBBA:         lms   r0,(002A)    ;
CODE_09EBBD:         color              ;
CODE_09EBBE:         ibt   r1,#0000     ;
CODE_09EBC0:         ibt   r2,#0000     ;
CODE_09EBC2:         plot               ;
CODE_09EBC3:         ibt   r1,#0000     ;
CODE_09EBC5:         ibt   r2,#000F     ;
CODE_09EBC7:         plot               ;
CODE_09EBC8:         ibt   r1,#0067     ;
CODE_09EBCA:         ibt   r2,#0000     ;
CODE_09EBCC:         plot               ;
CODE_09EBCD:         ibt   r1,#0067     ;
CODE_09EBCF:         ibt   r2,#000F     ;
CODE_09EBD1:         plot               ;
CODE_09EBD2:         lms   r0,(002C)    ;
CODE_09EBD5:         color              ;
CODE_09EBD6:         iwt   r13,#EC24    ;
CODE_09EBD9:         iwt   r1,#00FF     ;
CODE_09EBDC:         lms   r0,(0022)    ;
CODE_09EBDF:         romb               ;
CODE_09EBE1:         lms   r14,(0020)   ;
CODE_09EBE4:         getb               ;
CODE_09EBE5:         inc   r14          ;
CODE_09EBE6:         sms   (0020),r14   ;
CODE_09EBE9:         cmp   r1           ;
CODE_09EBEB:         bne CODE_09EC09    ;
CODE_09EBED:         nop                ;
CODE_09EBEE:         getb               ;
CODE_09EBEF:         inc   r14          ;
CODE_09EBF0:         sms   (0020),r14   ;
CODE_09EBF3:         cmp   r1           ;
CODE_09EBF5:         bne CODE_09EBFA    ;
CODE_09EBF7:         nop                ;
CODE_09EBF8:         stop               ;
CODE_09EBF9:         nop                ;

CODE_09EBFA:         sex                ;
CODE_09EBFB:         bmi CODE_09EC41    ;
CODE_09EBFD:         to r10             ;
CODE_09EBFE:         lob                ;
CODE_09EBFF:         getb               ;
CODE_09EC00:         to r11             ;
CODE_09EC01:         lob                ;
CODE_09EC02:         inc   r14          ;
CODE_09EC03:         sms   (0020),r14   ;
CODE_09EC06:         bra CODE_09EBD9    ;

CODE_09EC08:         nop                ;
CODE_09EC09:         sms   (003E),r0    ;
CODE_09EC0C:         ibt   r6,#000C     ;
CODE_09EC0E:         lmult              ;
CODE_09EC10:         ibt   r0,#0009     ;
CODE_09EC12:         romb               ;
CODE_09EC14:         iwt   r0,#BD2F     ;
CODE_09EC17:         to r14             ;
CODE_09EC18:         add   r4           ;
CODE_09EC19:         move  r2,r11       ;
CODE_09EC1B:         ibt   r12,#0008    ;
CODE_09EC1D:         getb               ;
CODE_09EC1E:         lob                ;
CODE_09EC1F:         to r3              ;
CODE_09EC20:         swap               ;
CODE_09EC21:         inc   r14          ;
CODE_09EC22:         move  r1,r10       ;
CODE_09EC24:         with r3            ;
CODE_09EC25:         rol                ;
CODE_09EC26:         bcc CODE_09EC2B    ;
CODE_09EC28:         nop                ;
CODE_09EC29:         plot               ;
CODE_09EC2A:         dec   r1           ;
CODE_09EC2B:         loop               ;
CODE_09EC2C:         inc   r1           ;
CODE_09EC2D:         dec   r6           ;
CODE_09EC2E:         bne CODE_09EC1B    ;
CODE_09EC30:         inc   r2           ;
CODE_09EC31:         rpix               ;
CODE_09EC33:         iwt   r14,#BC2F    ;
CODE_09EC36:         lms   r0,(003E)    ;
CODE_09EC39:         to r14             ;
CODE_09EC3A:         add   r14          ;
CODE_09EC3B:         getb               ;
CODE_09EC3C:         to r10             ;
CODE_09EC3D:         add   r10          ;
CODE_09EC3E:         bra CODE_09EBD9    ;

CODE_09EC40:         nop                ;

CODE_09EC41:         cache              ;
CODE_09EC42:         ibt   r0,#0011     ;
CODE_09EC44:         cmode              ;
CODE_09EC46:         lms   r0,(0024)    ;
CODE_09EC49:         color              ;
CODE_09EC4A:         ibt   r1,#0000     ;
CODE_09EC4C:         ibt   r2,#0010     ;
CODE_09EC4E:         ibt   r3,#007F     ;
CODE_09EC50:         ibt   r12,#0030    ;
CODE_09EC52:         iwt   r13,#EC55    ;
CODE_09EC55:         plot               ;
CODE_09EC56:         with r1            ;
CODE_09EC57:         and   r3           ;
CODE_09EC58:         bne CODE_09EC55    ;
CODE_09EC5A:         nop                ;
CODE_09EC5B:         loop               ;
CODE_09EC5C:         inc   r2           ;
CODE_09EC5D:         lms   r0,(0026)    ;
CODE_09EC60:         color              ;
CODE_09EC61:         iwt   r13,#ECAD    ;
CODE_09EC64:         iwt   r1,#00FF     ;
CODE_09EC67:         lms   r0,(0022)    ;
CODE_09EC6A:         romb               ;
CODE_09EC6C:         lms   r14,(0020)   ;
CODE_09EC6F:         getb               ;
CODE_09EC70:         inc   r14          ;
CODE_09EC71:         sms   (0020),r14   ;
CODE_09EC74:         cmp   r1           ;
CODE_09EC76:         bne CODE_09EC8E    ;
CODE_09EC78:         nop                ;
CODE_09EC79:         getb               ;
CODE_09EC7A:         inc   r14          ;
CODE_09EC7B:         sms   (0020),r14   ;
CODE_09EC7E:         cmp   r1           ;
CODE_09EC80:         beq CODE_09ECD6    ;
CODE_09EC82:         to r10             ;
CODE_09EC83:         lob                ;
CODE_09EC84:         getb               ;
CODE_09EC85:         to r11             ;
CODE_09EC86:         lob                ;
CODE_09EC87:         inc   r14          ;
CODE_09EC88:         sms   (0020),r14   ;
CODE_09EC8B:         bra CODE_09EC64    ;

CODE_09EC8D:         nop                ;

CODE_09EC8E:         sms   (003E),r0    ;
CODE_09EC91:         ibt   r6,#000C     ;
CODE_09EC93:         lmult              ;
CODE_09EC95:         ibt   r0,#0009     ;
CODE_09EC97:         romb               ;
CODE_09EC99:         iwt   r0,#BD2F     ;
CODE_09EC9C:         to r14             ;
CODE_09EC9D:         add   r4           ;
CODE_09EC9E:         move  r2,r11       ;
CODE_09ECA0:         move  r5,r2        ;
CODE_09ECA2:         move  r2,r5        ;
CODE_09ECA4:         ibt   r12,#0008    ;
CODE_09ECA6:         getb               ;
CODE_09ECA7:         lob                ;
CODE_09ECA8:         to r3              ;
CODE_09ECA9:         swap               ;
CODE_09ECAA:         inc   r14          ;
CODE_09ECAB:         move  r1,r10       ;
CODE_09ECAD:         with r3            ;
CODE_09ECAE:         rol                ;
CODE_09ECAF:         bcc CODE_09ECB4    ;
CODE_09ECB1:         nop                ;
CODE_09ECB2:         plot               ;
CODE_09ECB3:         dec   r1           ;
CODE_09ECB4:         inc   r1           ;
CODE_09ECB5:         ibt   r0,#007F     ;
CODE_09ECB7:         and   r1           ;
CODE_09ECB8:         bne CODE_09ECBF    ;
CODE_09ECBA:         nop                ;
CODE_09ECBB:         ibt   r0,#0010     ;
CODE_09ECBD:         to r2              ;
CODE_09ECBE:         add   r2           ;
CODE_09ECBF:         loop               ;
CODE_09ECC0:         nop                ;
CODE_09ECC1:         inc   r5           ;
CODE_09ECC2:         dec   r6           ;
CODE_09ECC3:         bne CODE_09ECA2    ;
CODE_09ECC5:         nop                ;
CODE_09ECC6:         rpix               ;
CODE_09ECC8:         iwt   r14,#BC2F    ;
CODE_09ECCB:         lms   r0,(003E)    ;
CODE_09ECCE:         to r14             ;
CODE_09ECCF:         add   r14          ;
CODE_09ECD0:         getb               ;
CODE_09ECD1:         to r10             ;
CODE_09ECD2:         add   r10          ;
CODE_09ECD3:         bra CODE_09EC64    ;

CODE_09ECD5:         nop                ;

CODE_09ECD6:         stop               ;
CODE_09ECD7:         nop                ;

CODE_09ECD8:         cache              ;
CODE_09ECD9:         ibt   r0,#0011     ;
CODE_09ECDB:         cmode              ;
CODE_09ECDD:         ibt   r0,#0009     ;
CODE_09ECDF:         romb               ;
CODE_09ECE1:         iwt   r14,#BD2F    ;
CODE_09ECE4:         ibt   r0,#0001     ;
CODE_09ECE6:         color              ;
CODE_09ECE7:         getb               ;
CODE_09ECE8:         swap               ;
CODE_09ECE9:         inc   r14          ;
CODE_09ECEA:         ibt   r3,#0000     ;
CODE_09ECEC:         ibt   r4,#0004     ;
CODE_09ECEE:         iwt   r11,#0008    ;
CODE_09ECF1:         iwt   r13,#ECF6    ;
CODE_09ECF4:         ibt   r12,#0008    ;
CODE_09ECF6:         ibt   r10,#000C    ;
CODE_09ECF8:         move  r2,r4        ;
CODE_09ECFA:         move  r1,r3        ;
CODE_09ECFC:         add   r0           ;
CODE_09ECFD:         bcc CODE_09ED02    ;
CODE_09ECFF:         inc   r1           ;
CODE_09ED00:         dec   r1           ;
CODE_09ED01:         plot               ;
CODE_09ED02:         moves r0,r0        ;
CODE_09ED04:         bne CODE_09ECFC    ;
CODE_09ED06:         nop                ;
CODE_09ED07:         getb               ;
CODE_09ED08:         swap               ;
CODE_09ED09:         inc   r14          ;
CODE_09ED0A:         inc   r2           ;
CODE_09ED0B:         dec   r10          ;
CODE_09ED0C:         bne CODE_09ECFB    ;
CODE_09ED0E:         with r3            ;
CODE_09ED0F:         add   #08          ;
CODE_09ED11:         loop               ;
CODE_09ED12:         with r4            ;
CODE_09ED13:         add   #0F          ;
CODE_09ED15:         inc   r4           ;
CODE_09ED16:         ibt   r3,#0000     ;
CODE_09ED18:         dec   r11          ;
CODE_09ED19:         bne CODE_09ECF4    ;
CODE_09ED1B:         nop                ;
CODE_09ED1C:         ibt   r3,#0040     ;
CODE_09ED1E:         ibt   r4,#0004     ;
CODE_09ED20:         iwt   r11,#0008    ;
CODE_09ED23:         iwt   r13,#ED28    ;
CODE_09ED26:         ibt   r12,#0008    ;
CODE_09ED28:         ibt   r10,#000C    ;
CODE_09ED2A:         move  r2,r4        ;
CODE_09ED2C:         move  r1,r3        ;
CODE_09ED2E:         add   r0           ;
CODE_09ED2F:         bcc CODE_09ED34    ;
CODE_09ED31:         inc   r1           ;
CODE_09ED32:         dec   r1           ;
CODE_09ED33:         plot               ;
CODE_09ED34:         moves r0,r0        ;
CODE_09ED36:         bne CODE_09ED2E    ;
CODE_09ED38:         nop                ;
CODE_09ED39:         getb               ;
CODE_09ED3A:         swap               ;
CODE_09ED3B:         inc   r14          ;
CODE_09ED3C:         inc   r2           ;
CODE_09ED3D:         dec   r10          ;
CODE_09ED3E:         bne CODE_09ED2D    ;
CODE_09ED40:         with r3            ;
CODE_09ED41:         add   #08          ;
CODE_09ED43:         loop               ;
CODE_09ED44:         with r4            ;
CODE_09ED45:         add   #0F          ;
CODE_09ED47:         inc   r4           ;
CODE_09ED48:         ibt   r3,#0040     ;
CODE_09ED4A:         dec   r11          ;
CODE_09ED4B:         bne CODE_09ED26    ;
CODE_09ED4D:         nop                ;
CODE_09ED4E:         iwt   r3,#0080     ;
CODE_09ED51:         ibt   r4,#0004     ;
CODE_09ED53:         iwt   r11,#0008    ;
CODE_09ED56:         iwt   r13,#ED5B    ;
CODE_09ED59:         ibt   r12,#0008    ;
CODE_09ED5B:         ibt   r10,#000C    ;
CODE_09ED5D:         move  r2,r4        ;
CODE_09ED5F:         move  r1,r3        ;
CODE_09ED61:         add   r0           ;
CODE_09ED62:         bcc CODE_09ED67    ;
CODE_09ED64:         inc   r1           ;
CODE_09ED65:         dec   r1           ;
CODE_09ED66:         plot               ;
CODE_09ED67:         moves r0,r0        ;
CODE_09ED69:         bne CODE_09ED61    ;
CODE_09ED6B:         nop                ;
CODE_09ED6C:         getb               ;
CODE_09ED6D:         swap               ;
CODE_09ED6E:         inc   r14          ;
CODE_09ED6F:         inc   r2           ;
CODE_09ED70:         dec   r10          ;
CODE_09ED71:         bne CODE_09ED60    ;
CODE_09ED73:         with r3            ;
CODE_09ED74:         add   #08          ;
CODE_09ED76:         loop               ;
CODE_09ED77:         with r4            ;
CODE_09ED78:         add   #0F          ;
CODE_09ED7A:         inc   r4           ;
CODE_09ED7B:         iwt   r3,#0080     ;
CODE_09ED7E:         dec   r11          ;
CODE_09ED7F:         bne CODE_09ED59    ;
CODE_09ED81:         nop                ;
CODE_09ED82:         iwt   r3,#00C0     ;
CODE_09ED85:         ibt   r4,#0004     ;
CODE_09ED87:         iwt   r11,#0008    ;
CODE_09ED8A:         iwt   r13,#ED8F    ;
CODE_09ED8D:         ibt   r12,#0008    ;
CODE_09ED8F:         ibt   r10,#000C    ;
CODE_09ED91:         move  r2,r4        ;
CODE_09ED93:         move  r1,r3        ;
CODE_09ED95:         add   r0           ;
CODE_09ED96:         bcc CODE_09ED9B    ;
CODE_09ED98:         inc   r1           ;
CODE_09ED99:         dec   r1           ;
CODE_09ED9A:         plot               ;
CODE_09ED9B:         moves r0,r0        ;
CODE_09ED9D:         bne CODE_09ED95    ;
CODE_09ED9F:         nop                ;
CODE_09EDA0:         getb               ;
CODE_09EDA1:         swap               ;
CODE_09EDA2:         inc   r14          ;
CODE_09EDA3:         inc   r2           ;
CODE_09EDA4:         dec   r10          ;
CODE_09EDA5:         bne CODE_09ED94    ;
CODE_09EDA7:         with r3            ;
CODE_09EDA8:         add   #08          ;
CODE_09EDAA:         loop               ;
CODE_09EDAB:         with r4            ;
CODE_09EDAC:         add   #0F          ;
CODE_09EDAE:         inc   r4           ;
CODE_09EDAF:         iwt   r3,#00C0     ;
CODE_09EDB2:         dec   r11          ;
CODE_09EDB3:         bne CODE_09ED8D    ;
CODE_09EDB5:         nop                ;
CODE_09EDB6:         rpix               ;
CODE_09EDB8:         iwt   r10,#1C01    ;
CODE_09EDBB:         iwt   r11,#3C00    ;
CODE_09EDBE:         iwt   r12,#2000    ;
CODE_09EDC1:         move  r13,r15      ;
CODE_09EDC3:         ldb   (r11)        ;
CODE_09EDC5:         stb   (r10)        ;
CODE_09EDC7:         inc   r11          ;
CODE_09EDC8:         inc   r11          ;
CODE_09EDC9:         inc   r10          ;
CODE_09EDCA:         loop               ;
CODE_09EDCB:         inc   r10          ;
CODE_09EDCC:         stop               ;
CODE_09EDCD:         nop                ;

; freespace
DATA_09EDCE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDD6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDDE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDE6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDEE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDF6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EDFE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE06:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE0E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE16:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE1E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE26:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE2E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE36:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE3E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE46:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE4E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE56:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE5E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE66:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE6E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE76:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE7E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE86:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE8E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE96:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EE9E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEA6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEAE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEB6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEBE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEC6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EECE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EED6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEDE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEE6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEEE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEF6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EEFE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF06:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF0E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF16:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF1E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF26:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF2E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF36:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF3E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF46:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF4E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF56:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF5E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF66:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF6E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF76:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF7E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF86:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF8E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF96:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EF9E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFA6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFAE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFB6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFBE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFC6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFCE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFD6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFDE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFE6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFEE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFF6:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09EFFE:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F006:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F00E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F016:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F01E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F026:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F02E:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F036:         db $01, $01, $01, $01, $01, $01, $01, $01

CODE_09F03E:         sub   r0           ;
CODE_09F03F:         cmode              ;
CODE_09F041:         sms   (0002),r1    ;
CODE_09F044:         sms   (0004),r2    ;
CODE_09F047:         sms   (0006),r3    ;
CODE_09F04A:         cache              ;
CODE_09F04B:         ldw   (r5)         ;
CODE_09F04C:         inc   r0           ;
CODE_09F04D:         bne CODE_09F054    ;
CODE_09F04F:         dec   r0           ;
CODE_09F050:         rpix               ;
CODE_09F052:         stop               ;
CODE_09F053:         nop                ;

CODE_09F054:         sub   r1           ;
CODE_09F055:         bmi CODE_09F05F    ;
CODE_09F057:         inc   r5           ;
CODE_09F058:         iwt   r6,#01C0     ;
CODE_09F05B:         sub   r6           ;
CODE_09F05C:         bcc CODE_09F065    ;
CODE_09F05E:         add   r6           ;
CODE_09F05F:         with r5            ;
CODE_09F060:         add   #05          ;
CODE_09F062:         bra CODE_09F04C    ;

CODE_09F064:         ldw   (r5)         ;

CODE_09F065:         move  r7,r0        ;
CODE_09F067:         iwt   r6,#0040     ;
CODE_09F06A:         add   r6           ;
CODE_09F06B:         add   r0           ;
CODE_09F06C:         iwt   r6,#1200     ;
CODE_09F06F:         add   r6           ;
CODE_09F070:         to r6              ;
CODE_09F071:         ldw   (r0)         ;
CODE_09F072:         inc   r5           ;
CODE_09F073:         ldb   (r5)         ;
CODE_09F075:         sex                ;
CODE_09F076:         sub   r3           ;
CODE_09F077:         lmult              ;
CODE_09F079:         with r4            ;
CODE_09F07A:         hib                ;
CODE_09F07B:         lob                ;
CODE_09F07C:         swap               ;
CODE_09F07D:         or    r4           ;
CODE_09F07E:         ibt   r4,#0060     ;
CODE_09F080:         to r3              ;
CODE_09F081:         add   r4           ;
CODE_09F082:         inc   r5           ;
CODE_09F083:         ldb   (r5)         ;
CODE_09F085:         sex                ;
CODE_09F086:         sub   r2           ;
CODE_09F087:         lmult              ;
CODE_09F089:         with r4            ;
CODE_09F08A:         hib                ;
CODE_09F08B:         lob                ;
CODE_09F08C:         swap               ;
CODE_09F08D:         or    r4           ;
CODE_09F08E:         ibt   r4,#0020     ;
CODE_09F090:         to r2              ;
CODE_09F091:         add   r4           ;
CODE_09F092:         inc   r5           ;
CODE_09F093:         ldb   (r5)         ;
CODE_09F095:         add   r0           ;
CODE_09F096:         add   r0           ;
CODE_09F097:         lmult              ;
CODE_09F099:         with r4            ;
CODE_09F09A:         hib                ;
CODE_09F09B:         lob                ;
CODE_09F09C:         swap               ;
CODE_09F09D:         to r6              ;
CODE_09F09E:         or    r4           ;
CODE_09F09F:         ibt   r0,#0009     ;
CODE_09F0A1:         romb               ;
CODE_09F0A3:         inc   r5           ;
CODE_09F0A4:         ldb   (r5)         ;
CODE_09F0A6:         sms   (004A),r5    ;
CODE_09F0A9:         iwt   r4,#00C0     ;
CODE_09F0AC:         to r5              ;
CODE_09F0AD:         and   r4           ;
CODE_09F0AE:         bic   r4           ;
CODE_09F0B0:         mult  #07          ;
CODE_09F0B2:         iwt   r14,#F43E    ;
CODE_09F0B5:         to r14             ;
CODE_09F0B6:         add   r14          ;
CODE_09F0B7:         from r7            ;
CODE_09F0B8:         lsr                ;
CODE_09F0B9:         lsr                ;
CODE_09F0BA:         lsr                ;
CODE_09F0BB:         ibt   r4,#0030     ;
CODE_09F0BD:         and   r4           ;
CODE_09F0BE:         to r5              ;
CODE_09F0BF:         or    r5           ;
CODE_09F0C0:         getb               ;
CODE_09F0C1:         inc   r14          ;
CODE_09F0C2:         swap               ;
CODE_09F0C3:         fmult              ;
CODE_09F0C4:         adc   r3           ;
CODE_09F0C6:         move  r3,r0        ;
CODE_09F0C8:         iwt   r1,#00C0     ;
CODE_09F0CB:         sub   r1           ;
CODE_09F0CC:         bpl CODE_09F0ED    ;
CODE_09F0CE:         getb               ;
CODE_09F0CF:         inc   r14          ;
CODE_09F0D0:         swap               ;
CODE_09F0D1:         fmult              ;
CODE_09F0D2:         adc   r2           ;
CODE_09F0D4:         move  r2,r0        ;
CODE_09F0D6:         iwt   r8,#0080     ;
CODE_09F0D9:         sub   r8           ;
CODE_09F0DA:         bpl CODE_09F0ED    ;
CODE_09F0DC:         getb               ;
CODE_09F0DD:         inc   r14          ;
CODE_09F0DE:         swap               ;
CODE_09F0DF:         fmult              ;
CODE_09F0E0:         to r9              ;
CODE_09F0E1:         add   r3           ;
CODE_09F0E2:         bmi CODE_09F0ED    ;
CODE_09F0E4:         getb               ;
CODE_09F0E5:         inc   r14          ;
CODE_09F0E6:         swap               ;
CODE_09F0E7:         fmult              ;
CODE_09F0E8:         to r10             ;
CODE_09F0E9:         add   r2           ;
CODE_09F0EA:         bpl CODE_09F0F3    ;
CODE_09F0EC:         getb               ;
CODE_09F0ED:         iwt   r15,#F180    ;
CODE_09F0F0:         lms   r1,(0002)    ;
CODE_09F0F3:         inc   r14          ;
CODE_09F0F4:         to r11             ;
CODE_09F0F5:         getbh              ;
CODE_09F0F7:         inc   r14          ;
CODE_09F0F8:         ibt   r7,#0001     ;
CODE_09F0FA:         sub   r0           ;
CODE_09F0FB:         move  r4,r0        ;
CODE_09F0FD:         ibt   r12,#0020    ;
CODE_09F0FF:         iwt   r13,#F103    ;
CODE_09F102:         with r4            ;
CODE_09F103:         add   r4           ;
CODE_09F104:         with r7            ;
CODE_09F105:         add   r7           ;
CODE_09F106:         rol                ;
CODE_09F107:         sub   r6           ;
CODE_09F108:         bcc CODE_09F10D    ;
CODE_09F10A:         add   r6           ;
CODE_09F10B:         sub   r6           ;
CODE_09F10C:         inc   r4           ;
CODE_09F10D:         loop               ;
CODE_09F10E:         move  r6,r4        ;
CODE_09F111:         getb               ;
CODE_09F112:         ibt   r4,#007F     ;
CODE_09F114:         and   r4           ;
CODE_09F115:         romb               ;
CODE_09F117:         getbs              ;
CODE_09F119:         iwt   r4,#8000     ;
CODE_09F11C:         and   r4           ;
CODE_09F11D:         to r5              ;
CODE_09F11E:         or    r5           ;
CODE_09F11F:         ibt   r7,#0000     ;
CODE_09F121:         moves r0,r2        ;
CODE_09F123:         bpl CODE_09F12D    ;
CODE_09F125:         not                ;
CODE_09F126:         inc   r0           ;
CODE_09F127:         lmult              ;
CODE_09F129:         move  r7,r4        ;
CODE_09F12B:         ibt   r2,#0000     ;
CODE_09F12D:         ibt   r4,#0000     ;
CODE_09F12F:         moves r0,r3        ;
CODE_09F131:         bpl CODE_09F139    ;
CODE_09F133:         not                ;
CODE_09F134:         inc   r0           ;
CODE_09F135:         lmult              ;
CODE_09F137:         ibt   r3,#0000     ;
CODE_09F139:         dec   r1           ;
CODE_09F13A:         from r1            ;
CODE_09F13B:         sub   r9           ;
CODE_09F13C:         bcc CODE_09F140    ;
CODE_09F13E:         add   r9           ;
CODE_09F13F:         from r9            ;
CODE_09F140:         to r9              ;
CODE_09F141:         sub   r3           ;
CODE_09F142:         inc   r9           ;
CODE_09F143:         dec   r8           ;
CODE_09F144:         from r8            ;
CODE_09F145:         sub   r10          ;
CODE_09F146:         bcc CODE_09F14A    ;
CODE_09F148:         add   r10          ;
CODE_09F149:         from r10           ;
CODE_09F14A:         to r10             ;
CODE_09F14B:         sub   r2           ;
CODE_09F14C:         inc   r10          ;
CODE_09F14D:         iwt   r13,#F156    ;
CODE_09F150:         move  r1,r3        ;
CODE_09F152:         move  r8,r4        ;
CODE_09F154:         move  r12,r9       ;
CODE_09F156:         merge              ;
CODE_09F157:         to r14             ;
CODE_09F158:         add   r11          ;
CODE_09F159:         with r8            ;
CODE_09F15A:         add   r6           ;
CODE_09F15B:         moves r5,r5        ;
CODE_09F15D:         bpl CODE_09F164    ;
CODE_09F15F:         getb               ;
CODE_09F160:         lsr                ;
CODE_09F161:         lsr                ;
CODE_09F162:         lsr                ;
CODE_09F163:         lsr                ;
CODE_09F164:         and   #0F          ;
CODE_09F166:         beq CODE_09F177    ;
CODE_09F168:         add   r5           ;
CODE_09F169:         color              ;
CODE_09F16A:         loop               ;
CODE_09F16B:         plot               ;
CODE_09F16C:         with r7            ;
CODE_09F16D:         add   r6           ;
CODE_09F16E:         dec   r10          ;
CODE_09F16F:         bne CODE_09F150    ;
CODE_09F171:         inc   r2           ;
CODE_09F172:         bra CODE_09F180    ;

CODE_09F174:         lms   r1,(0002)    ;
CODE_09F177:         loop               ;
CODE_09F178:         inc   r1           ;
CODE_09F179:         with r7            ;
CODE_09F17A:         add   r6           ;
CODE_09F17B:         dec   r10          ;
CODE_09F17C:         bne CODE_09F150    ;
CODE_09F17E:         inc   r2           ;
CODE_09F17F:         lms   r1,(0002)    ;
CODE_09F182:         lms   r2,(0004)    ;
CODE_09F185:         lms   r3,(0006)    ;
CODE_09F188:         lms   r5,(004A)    ;
CODE_09F18B:         iwt   r15,#F04B    ;
CODE_09F18E:         inc   r5           ;

; freespace
DATA_09F18F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F197:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F19F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1A7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1AF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1B7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1BF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1C7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1CF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1D7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1DF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1E7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1EF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1F7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F1FF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F207:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F20F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F217:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F21F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F227:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F22F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F237:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F23F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F247:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F24F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F257:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F25F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F267:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F26F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F277:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F27F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F287:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F28F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F297:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F29F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2A7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2AF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2B7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2BF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2C7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2CF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2D7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2DF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2E7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2EF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2F7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F2FF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F307:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F30F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F317:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F31F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F327:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F32F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F337:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F33F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F347:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F34F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F357:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F35F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F367:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F36F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F377:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F37F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F387:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F38F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F397:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F39F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3A7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3AF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3B7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3BF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3C7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3CF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3D7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3DF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3E7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3EF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3F7:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F3FF:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F407:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F40F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F417:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F41F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F427:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F42F:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_09F437:         db $01, $01, $01, $01, $01, $01, $01

DATA_09F43E:         db $F4, $F0, $18, $28, $00, $C0, $D5, $E8
DATA_09F446:         db $F3, $2F, $28, $18, $C0, $D5, $E4, $FA
DATA_09F44E:         db $37, $1F, $80, $80, $D5, $E0, $05, $3F
DATA_09F456:         db $0F, $40, $80, $D5, $E4, $04, $37, $17
DATA_09F45E:         db $30, $E8, $D5, $F0, $04, $1F, $1F, $60
DATA_09F466:         db $A0, $D5, $F0, $04, $20, $1F, $20, $80
DATA_09F46E:         db $D5, $F0, $01, $20, $1F, $00, $80, $D5
DATA_09F476:         db $E8, $05, $2F, $10, $40, $90, $D5, $E8
DATA_09F47E:         db $02, $2F, $17, $00, $E8, $D5, $E8, $FF
DATA_09F486:         db $30, $17, $30, $A0, $D5, $E8, $F9, $2F
DATA_09F48E:         db $1F, $00, $A0, $D5, $F4, $F0, $17, $28
DATA_09F496:         db $48, $C0, $D5, $E8, $C0, $2F, $3F, $00
DATA_09F49E:         db $80, $55, $F8, $E8, $0F, $17, $30, $A8
DATA_09F4A6:         db $55, $E8, $C0, $2F, $3F, $80, $80, $55
DATA_09F4AE:         db $E8, $E8, $2F, $27, $30, $80, $55, $F0
DATA_09F4B6:         db $D0, $1F, $2F, $60, $80, $55, $F0, $F4
DATA_09F4BE:         db $1F, $17, $40, $A8, $55, $F0, $F8, $1F
DATA_09F4C6:         db $0F, $60, $B0, $55, $C0, $C8, $7F, $37
DATA_09F4CE:         db $80, $C8, $D5, $D8, $C0, $4F, $47, $B0
DATA_09F4D6:         db $80, $55, $C0, $F8, $7F, $17, $80, $E8
DATA_09F4DE:         db $55, $D8, $E0, $50, $40, $30, $C0, $55
DATA_09F4E6:         db $E8, $E0, $2F, $3F, $00, $C0, $55, $DC
DATA_09F4EE:         db $DC, $47, $47, $B8, $80, $D5, $F8, $F4
DATA_09F4F6:         db $10, $18, $60, $C0, $D5, $F8, $F4, $10
DATA_09F4FE:         db $18, $70, $C0, $D5, $F8, $F4, $10, $18
DATA_09F506:         db $30, $A8, $55, $F4, $F4, $18, $18, $80
DATA_09F50E:         db $D0, $55, $F4, $F4, $18, $18, $98, $D0
DATA_09F516:         db $55, $F4, $F4, $18, $18, $68, $D8, $D5
DATA_09F51E:         db $F4, $F4, $18, $18, $80, $A0, $D5, $F8
DATA_09F526:         db $F8, $10, $10, $80, $C0, $55, $F8, $F8
DATA_09F52E:         db $10, $10, $90, $C0, $55, $F8, $F8, $10
DATA_09F536:         db $10, $A0, $C0, $55, $F8, $F8, $10, $10
DATA_09F53E:         db $B0, $C8, $55, $F8, $F8, $10, $10, $C0
DATA_09F546:         db $C8, $55, $F8, $F8, $10, $10, $D0, $C8
DATA_09F54E:         db $55, $F8, $F8, $10, $10, $E0, $C8, $55
DATA_09F556:         db $F8, $F8, $10, $10, $F0, $C8, $55, $F8
DATA_09F55E:         db $F8, $10, $10, $B0, $D8, $55, $F8, $F8
DATA_09F566:         db $10, $10, $C0, $D8, $55, $F8, $F8, $10
DATA_09F56E:         db $10, $D0, $D8, $55

CODE_09F572:         romb               ;
CODE_09F574:         move  r14,r14      ;
CODE_09F576:         link  #04          ;
CODE_09F577:         iwt   r15,#F5CA    ;
CODE_09F57A:         nop                ;
CODE_09F57B:         iwt   r8,#385E     ;
CODE_09F57E:         iwt   r9,#5800     ;
CODE_09F581:         iwt   r10,#58D2    ;
CODE_09F584:         cache              ;
CODE_09F585:         ibt   r12,#004F    ;
CODE_09F587:         move  r13,r15      ;
CODE_09F589:         from r1            ;
CODE_09F58A:         stw   (r8)         ;
CODE_09F58B:         inc   r8           ;
CODE_09F58C:         inc   r8           ;
CODE_09F58D:         from r2            ;
CODE_09F58E:         stb   (r9)         ;
CODE_09F590:         inc   r9           ;
CODE_09F591:         from r3            ;
CODE_09F592:         stw   (r10)        ;
CODE_09F593:         inc   r10          ;
CODE_09F594:         loop               ;
CODE_09F595:         inc   r10          ;
CODE_09F596:         ibt   r7,#000E     ;
CODE_09F598:         link  #04          ;
CODE_09F599:         iwt   r15,#F5CA    ;
CODE_09F59C:         nop                ;
CODE_09F59D:         ibt   r12,#0004    ;
CODE_09F59F:         move  r13,r15      ;
CODE_09F5A1:         from r1            ;
CODE_09F5A2:         stw   (r8)         ;
CODE_09F5A3:         inc   r8           ;
CODE_09F5A4:         inc   r8           ;
CODE_09F5A5:         from r2            ;
CODE_09F5A6:         stb   (r9)         ;
CODE_09F5A8:         inc   r9           ;
CODE_09F5A9:         from r3            ;
CODE_09F5AA:         stw   (r10)        ;
CODE_09F5AB:         inc   r10          ;
CODE_09F5AC:         loop               ;
CODE_09F5AD:         inc   r10          ;
CODE_09F5AE:         dec   r7           ;
CODE_09F5AF:         bne CODE_09F598    ;
CODE_09F5B1:         nop                ;
CODE_09F5B2:         link  #04          ;
CODE_09F5B3:         iwt   r15,#F5CA    ;
CODE_09F5B6:         nop                ;
CODE_09F5B7:         ibt   r12,#004A    ;
CODE_09F5B9:         move  r13,r15      ;
CODE_09F5BB:         from r1            ;
CODE_09F5BC:         stw   (r8)         ;
CODE_09F5BD:         inc   r8           ;
CODE_09F5BE:         inc   r8           ;
CODE_09F5BF:         from r2            ;
CODE_09F5C0:         stb   (r9)         ;
CODE_09F5C2:         inc   r9           ;
CODE_09F5C3:         from r3            ;
CODE_09F5C4:         stw   (r10)        ;
CODE_09F5C5:         inc   r10          ;
CODE_09F5C6:         loop               ;
CODE_09F5C7:         inc   r10          ;
CODE_09F5C8:         stop               ;
CODE_09F5C9:         nop                ;

CODE_09F5CA:         getb               ;
CODE_09F5CB:         inc   r14          ;
CODE_09F5CC:         getbh              ;
CODE_09F5CE:         inc   r14          ;
CODE_09F5CF:         move  r1,r0        ;
CODE_09F5D1:         ibt   r5,#001F     ;
CODE_09F5D3:         and   r5           ;
CODE_09F5D4:         ibt   r6,#0020     ;
CODE_09F5D6:         to r2              ;
CODE_09F5D7:         or    r6           ;
CODE_09F5D8:         from r1            ;
CODE_09F5D9:         lsr                ;
CODE_09F5DA:         lsr                ;
CODE_09F5DB:         lsr                ;
CODE_09F5DC:         lsr                ;
CODE_09F5DD:         lsr                ;
CODE_09F5DE:         move  r4,r0        ;
CODE_09F5E0:         and   r5           ;
CODE_09F5E1:         with r6            ;
CODE_09F5E2:         add   r6           ;
CODE_09F5E3:         to r3              ;
CODE_09F5E4:         or    r6           ;
CODE_09F5E5:         from r4            ;
CODE_09F5E6:         lsr                ;
CODE_09F5E7:         lsr                ;
CODE_09F5E8:         lsr                ;
CODE_09F5E9:         lsr                ;
CODE_09F5EA:         lsr                ;
CODE_09F5EB:         and   r5           ;
CODE_09F5EC:         with r6            ;
CODE_09F5ED:         add   r6           ;
CODE_09F5EE:         or    r6           ;
CODE_09F5EF:         swap               ;
CODE_09F5F0:         to r3              ;
CODE_09F5F1:         or    r3           ;
CODE_09F5F2:         jmp   r11          ;
CODE_09F5F3:         nop                ;

CODE_09F5F4:         from r1            ;
CODE_09F5F5:         sub   r3           ;
CODE_09F5F6:         iwt   r9,#0100     ;
CODE_09F5F9:         to r9              ;
CODE_09F5FA:         add   r9           ;
CODE_09F5FB:         ibt   r10,#0001    ;
CODE_09F5FD:         sub   r0           ;
CODE_09F5FE:         move  r6,r0        ;
CODE_09F600:         cache              ;
CODE_09F601:         ibt   r12,#0020    ;
CODE_09F603:         iwt   r13,#F607    ;
CODE_09F606:         with r6            ;
CODE_09F607:         add   r6           ;
CODE_09F608:         with r10           ;
CODE_09F609:         add   r10          ;
CODE_09F60A:         rol                ;
CODE_09F60B:         sub   r9           ;
CODE_09F60C:         bcc CODE_09F611    ;
CODE_09F60E:         add   r9           ;
CODE_09F60F:         sub   r9           ;
CODE_09F610:         inc   r6           ;
CODE_09F611:         loop               ;
CODE_09F612:         with r6            ;
CODE_09F613:         lms   r8,(0094)    ;
CODE_09F616:         iwt   r10,#0078    ;
CODE_09F619:         from r3            ;
CODE_09F61A:         sub   r8           ;
CODE_09F61B:         sub   r10          ;
CODE_09F61C:         lmult              ;
CODE_09F61E:         with r4            ;
CODE_09F61F:         hib                ;
CODE_09F620:         lob                ;
CODE_09F621:         swap               ;
CODE_09F622:         or    r4           ;
CODE_09F623:         add   r10          ;
CODE_09F624:         add   r8           ;
CODE_09F625:         to r1              ;
CODE_09F626:         sub   r1           ;
CODE_09F627:         lms   r8,(009C)    ;
CODE_09F62A:         iwt   r10,#0088    ;
CODE_09F62D:         from r2            ;
CODE_09F62E:         sub   r8           ;
CODE_09F62F:         sub   r10          ;
CODE_09F630:         lmult              ;
CODE_09F632:         with r4            ;
CODE_09F633:         hib                ;
CODE_09F634:         lob                ;
CODE_09F635:         swap               ;
CODE_09F636:         or    r4           ;
CODE_09F637:         add   r10          ;
CODE_09F638:         add   r8           ;
CODE_09F639:         to r2              ;
CODE_09F63A:         sub   r2           ;
CODE_09F63B:         ibt   r4,#0006     ;
CODE_09F63D:         move  r12,r7       ;
CODE_09F63F:         move  r13,r15      ;
CODE_09F641:         ldw   (r5)         ;
CODE_09F642:         add   r1           ;
CODE_09F643:         sbk                ;
CODE_09F644:         inc   r5           ;
CODE_09F645:         inc   r5           ;
CODE_09F646:         ldw   (r5)         ;
CODE_09F647:         add   r2           ;
CODE_09F648:         with r5            ;
CODE_09F649:         add   r4           ;
CODE_09F64A:         loop               ;
CODE_09F64B:         sbk                ;
CODE_09F64C:         stop               ;
CODE_09F64D:         nop                ;

CODE_09F64E:         cache              ;
CODE_09F64F:         ibt   r10,#001F    ;
CODE_09F651:         lm    r0,(11AA)    ;
CODE_09F655:         inc   r0           ;
CODE_09F656:         sbk                ;
CODE_09F657:         move  r6,r0        ;
CODE_09F659:         iwt   r12,#0100    ;
CODE_09F65C:         move  r13,r15      ;
CODE_09F65E:         ldw   (r1)         ;
CODE_09F65F:         to r8              ;
CODE_09F660:         and   r10          ;
CODE_09F661:         ldw   (r2)         ;
CODE_09F662:         to r9              ;
CODE_09F663:         and   r10          ;
CODE_09F664:         link  #04          ;
CODE_09F665:         iwt   r15,#F6A3    ;
CODE_09F668:         nop                ;
CODE_09F669:         move  r5,r0        ;
CODE_09F66B:         ldw   (r1)         ;
CODE_09F66C:         add   r0           ;
CODE_09F66D:         add   r0           ;
CODE_09F66E:         add   r0           ;
CODE_09F66F:         swap               ;
CODE_09F670:         to r8              ;
CODE_09F671:         and   r10          ;
CODE_09F672:         ldw   (r2)         ;
CODE_09F673:         add   r0           ;
CODE_09F674:         add   r0           ;
CODE_09F675:         add   r0           ;
CODE_09F676:         swap               ;
CODE_09F677:         to r9              ;
CODE_09F678:         and   r10          ;
CODE_09F679:         link  #04          ;
CODE_09F67A:         iwt   r15,#F6A3    ;
CODE_09F67D:         nop                ;
CODE_09F67E:         swap               ;
CODE_09F67F:         lsr                ;
CODE_09F680:         lsr                ;
CODE_09F681:         lsr                ;
CODE_09F682:         to r5              ;
CODE_09F683:         or    r5           ;
CODE_09F684:         ldw   (r1)         ;
CODE_09F685:         swap               ;
CODE_09F686:         lsr                ;
CODE_09F687:         lsr                ;
CODE_09F688:         to r8              ;
CODE_09F689:         and   r10          ;
CODE_09F68A:         ldw   (r2)         ;
CODE_09F68B:         swap               ;
CODE_09F68C:         lsr                ;
CODE_09F68D:         lsr                ;
CODE_09F68E:         to r9              ;
CODE_09F68F:         and   r10          ;
CODE_09F690:         link  #04          ;
CODE_09F691:         iwt   r15,#F6A3    ;
CODE_09F694:         nop                ;
CODE_09F695:         swap               ;
CODE_09F696:         add   r0           ;
CODE_09F697:         add   r0           ;
CODE_09F698:         or    r5           ;
CODE_09F699:         stw   (r3)         ;
CODE_09F69A:         inc   r1           ;
CODE_09F69B:         inc   r1           ;
CODE_09F69C:         inc   r2           ;
CODE_09F69D:         inc   r2           ;
CODE_09F69E:         inc   r3           ;
CODE_09F69F:         loop               ;
CODE_09F6A0:         inc   r3           ;
CODE_09F6A1:         stop               ;
CODE_09F6A2:         nop                ;

CODE_09F6A3:         from r9            ;
CODE_09F6A4:         sub   r8           ;
CODE_09F6A5:         mult  r6           ;
CODE_09F6A6:         asr                ;
CODE_09F6A7:         asr                ;
CODE_09F6A8:         asr                ;
CODE_09F6A9:         asr                ;
CODE_09F6AA:         asr                ;
CODE_09F6AB:         add   r8           ;
CODE_09F6AC:         and   r10          ;
CODE_09F6AD:         move  r15,r11      ;
CODE_09F6AF:         nop                ;
CODE_09F6B0:         iwt   r6,#0040     ;
CODE_09F6B3:         from r1            ;
CODE_09F6B4:         lmult              ;
CODE_09F6B6:         with r4            ;
CODE_09F6B7:         hib                ;
CODE_09F6B8:         lob                ;
CODE_09F6B9:         swap               ;
CODE_09F6BA:         to r9              ;
CODE_09F6BB:         or    r4           ;
CODE_09F6BC:         ibt   r10,#0001    ;
CODE_09F6BE:         sub   r0           ;
CODE_09F6BF:         move  r6,r0        ;
CODE_09F6C1:         cache              ;
CODE_09F6C2:         ibt   r12,#0020    ;
CODE_09F6C4:         iwt   r13,#F6C8    ;
CODE_09F6C7:         with r6            ;
CODE_09F6C8:         add   r6           ;
CODE_09F6C9:         with r10           ;
CODE_09F6CA:         add   r10          ;
CODE_09F6CB:         rol                ;
CODE_09F6CC:         sub   r1           ;
CODE_09F6CD:         bcc CODE_09F6D2    ;
CODE_09F6CF:         add   r1           ;
CODE_09F6D0:         sub   r1           ;
CODE_09F6D1:         inc   r6           ;
CODE_09F6D2:         loop               ;
CODE_09F6D3:         with r6            ;
CODE_09F6D4:         lms   r8,(0094)    ;
CODE_09F6D7:         iwt   r10,#0080    ;
CODE_09F6DA:         from r3            ;
CODE_09F6DB:         sub   r8           ;
CODE_09F6DC:         sub   r10          ;
CODE_09F6DD:         lmult              ;
CODE_09F6DF:         with r4            ;
CODE_09F6E0:         hib                ;
CODE_09F6E1:         lob                ;
CODE_09F6E2:         swap               ;
CODE_09F6E3:         or    r4           ;
CODE_09F6E4:         dec   r5           ;
CODE_09F6E5:         bpl CODE_09F6EA    ;
CODE_09F6E7:         inc   r5           ;
CODE_09F6E8:         not                ;
CODE_09F6E9:         inc   r0           ;
CODE_09F6EA:         iwt   r5,#0180     ;
CODE_09F6ED:         add   r5           ;
CODE_09F6EE:         sms   (0098),r0    ;
CODE_09F6F1:         lms   r8,(009C)    ;
CODE_09F6F4:         iwt   r10,#0090    ;
CODE_09F6F7:         from r2            ;
CODE_09F6F8:         sub   r8           ;
CODE_09F6F9:         sub   r10          ;
CODE_09F6FA:         lmult              ;
CODE_09F6FC:         with r4            ;
CODE_09F6FD:         hib                ;
CODE_09F6FE:         lob                ;
CODE_09F6FF:         swap               ;
CODE_09F700:         to r5              ;
CODE_09F701:         or    r4           ;
CODE_09F702:         iwt   r0,#0180     ;
CODE_09F705:         sub   r5           ;
CODE_09F706:         sms   (00A0),r0    ;
CODE_09F709:         stop               ;
CODE_09F70A:         nop                ;

CODE_09F70B:         iwt   r0,#1C16     ;
CODE_09F70E:         add   r1           ;
CODE_09F70F:         ldw   (r0)         ;
CODE_09F710:         dec   r0           ;
CODE_09F711:         bpl CODE_09F716    ;
CODE_09F713:         inc   r0           ;
CODE_09F714:         not                ;
CODE_09F715:         inc   r0           ;
CODE_09F716:         ibt   r4,#0040     ;
CODE_09F718:         sub   r4           ;
CODE_09F719:         bcs CODE_09F73F    ;
CODE_09F71B:         add   r4           ;
CODE_09F71C:         to r2              ;
CODE_09F71D:         umult r0           ;
CODE_09F71F:         iwt   r0,#1C18     ;
CODE_09F722:         add   r1           ;
CODE_09F723:         ldw   (r0)         ;
CODE_09F724:         dec   r0           ;
CODE_09F725:         bpl CODE_09F72A    ;
CODE_09F727:         inc   r0           ;
CODE_09F728:         not                ;
CODE_09F729:         inc   r0           ;
CODE_09F72A:         sub   r4           ;
CODE_09F72B:         bcs CODE_09F73F    ;
CODE_09F72D:         add   r4           ;
CODE_09F72E:         umult r0           ;
CODE_09F730:         to r2              ;
CODE_09F731:         add   r2           ;
CODE_09F732:         lms   r0,(0122)    ;
CODE_09F735:         umult r0           ;
CODE_09F737:         iwt   r3,#0790     ;
CODE_09F73A:         add   r3           ;
CODE_09F73B:         sub   r2           ;
CODE_09F73C:         bcs CODE_09F741    ;
CODE_09F73E:         sub   r0           ;
CODE_09F73F:         ibt   r0,#0001     ;
CODE_09F741:         stop               ;
CODE_09F742:         nop                ;

CODE_09F743:         ibt   r1,#0000     ;
CODE_09F745:         iwt   r2,#0F00     ;
CODE_09F748:         iwt   r3,#1360     ;
CODE_09F74B:         iwt   r4,#1D38     ;
CODE_09F74E:         iwt   r5,#00CD     ;
CODE_09F751:         iwt   r6,#0026     ;
CODE_09F754:         iwt   r7,#0004     ;
CODE_09F757:         cache              ;
CODE_09F758:         ibt   r12,#0018    ;
CODE_09F75A:         move  r13,r15      ;
CODE_09F75C:         ldw   (r2)         ;
CODE_09F75D:         lob                ;
CODE_09F75E:         beq CODE_09F771    ;
CODE_09F760:         nop                ;
CODE_09F761:         ldw   (r3)         ;
CODE_09F762:         sub   r5           ;
CODE_09F763:         beq CODE_09F770    ;
CODE_09F765:         add   r5           ;
CODE_09F766:         sub   r6           ;
CODE_09F767:         bne CODE_09F771    ;
CODE_09F769:         nop                ;
CODE_09F76A:         ldw   (r4)         ;
CODE_09F76B:         sub   #00          ;
CODE_09F76D:         bne CODE_09F771    ;
CODE_09F76F:         nop                ;
CODE_09F770:         inc   r1           ;
CODE_09F771:         with r2            ;
CODE_09F772:         add   r7           ;
CODE_09F773:         with r3            ;
CODE_09F774:         add   r7           ;
CODE_09F775:         with r4            ;
CODE_09F776:         add   r7           ;
CODE_09F777:         loop               ;
CODE_09F778:         nop                ;
CODE_09F779:         stop               ;
CODE_09F77A:         nop                ;

CODE_09F77B:         cache              ;
CODE_09F77C:         iwt   r3,#6800     ;
CODE_09F77F:         iwt   r0,#03CE     ;
CODE_09F782:         iwt   r12,#0400    ;
CODE_09F785:         move  r13,r15      ;
CODE_09F787:         stw   (r3)         ;
CODE_09F788:         inc   r3           ;
CODE_09F789:         loop               ;
CODE_09F78A:         inc   r3           ;
CODE_09F78B:         iwt   r1,#2000     ;
CODE_09F78E:         iwt   r2,#6C44     ;
CODE_09F791:         ibt   r4,#0010     ;
CODE_09F793:         ibt   r5,#000F     ;
CODE_09F795:         ibt   r7,#0028     ;
CODE_09F797:         ibt   r8,#0038     ;
CODE_09F799:         ibt   r10,#000B    ;
CODE_09F79B:         ibt   r11,#000C    ;
CODE_09F79D:         move  r0,r1        ;
CODE_09F79F:         move  r12,r11      ;
CODE_09F7A1:         move  r13,r15      ;
CODE_09F7A3:         stw   (r2)         ;
CODE_09F7A4:         inc   r0           ;
CODE_09F7A5:         inc   r0           ;
CODE_09F7A6:         to r14             ;
CODE_09F7A7:         and   r5           ;
CODE_09F7A8:         bne CODE_09F7AC    ;
CODE_09F7AA:         inc   r2           ;
CODE_09F7AB:         add   r4           ;
CODE_09F7AC:         loop               ;
CODE_09F7AD:         inc   r2           ;
CODE_09F7AE:         with r2            ;
CODE_09F7AF:         add   r7           ;
CODE_09F7B0:         from r1            ;
CODE_09F7B1:         add   r8           ;
CODE_09F7B2:         to r1              ;
CODE_09F7B3:         bic   r4           ;
CODE_09F7B5:         dec   r10          ;
CODE_09F7B6:         bne CODE_09F79E    ;
CODE_09F7B8:         move  r0,r1        ;
CODE_09F7BA:         stop               ;
CODE_09F7BB:         nop                ;

CODE_09F7BC:         cache              ;
CODE_09F7BD:         iwt   r5,#6800     ;
CODE_09F7C0:         sub   r0           ;
CODE_09F7C1:         iwt   r12,#0300    ;
CODE_09F7C4:         move  r13,r15      ;
CODE_09F7C6:         stw   (r5)         ;
CODE_09F7C7:         inc   r5           ;
CODE_09F7C8:         loop               ;
CODE_09F7C9:         inc   r5           ;
CODE_09F7CA:         ibt   r5,#0000     ;
CODE_09F7CC:         ibt   r6,#0000     ;
CODE_09F7CE:         iwt   r9,#0080     ;
CODE_09F7D1:         ibt   r10,#0010    ;
CODE_09F7D3:         from r3            ;
CODE_09F7D4:         romb               ;
CODE_09F7D6:         move  r14,r4       ;
CODE_09F7D8:         getb               ;
CODE_09F7D9:         inc   r14          ;
CODE_09F7DA:         iwt   r11,#00FF    ;
CODE_09F7DD:         sub   r11          ;
CODE_09F7DE:         bne CODE_09F7F1    ;
CODE_09F7E0:         add   r11          ;
CODE_09F7E1:         getb               ;
CODE_09F7E2:         inc   r14          ;
CODE_09F7E3:         to r11             ;
CODE_09F7E4:         sub   #0A          ;
CODE_09F7E6:         beq CODE_09F7EB    ;
CODE_09F7E8:         nop                ;
CODE_09F7E9:         stop               ;
CODE_09F7EA:         nop                ;

CODE_09F7EB:         getb               ;
CODE_09F7EC:         inc   r14          ;
CODE_09F7ED:         ibt   r5,#0040     ;
CODE_09F7EF:         ibt   r6,#0010     ;
CODE_09F7F1:         move  r4,r14       ;
CODE_09F7F3:         ibt   r14,#0009    ;
CODE_09F7F5:         from r14           ;
CODE_09F7F6:         romb               ;
CODE_09F7F8:         iwt   r14,#BC2F    ;
CODE_09F7FB:         to r14             ;
CODE_09F7FC:         add   r14          ;
CODE_09F7FD:         to r7              ;
CODE_09F7FE:         getb               ;
CODE_09F7FF:         umult #0C          ;
CODE_09F801:         iwt   r14,#BD2F    ;
CODE_09F804:         to r14             ;
CODE_09F805:         add   r14          ;
CODE_09F806:         ibt   r8,#000C     ;
CODE_09F808:         to r11             ;
CODE_09F809:         getbh              ;
CODE_09F80B:         inc   r14          ;
CODE_09F80C:         move  r1,r5        ;
CODE_09F80E:         move  r2,r6        ;
CODE_09F810:         move  r12,r7       ;
CODE_09F812:         move  r13,r15      ;
CODE_09F814:         with r11           ;
CODE_09F815:         add   r11          ;
CODE_09F816:         rol                ;
CODE_09F817:         and   #01          ;
CODE_09F819:         color              ;
CODE_09F81A:         from r1            ;
CODE_09F81B:         sub   r9           ;
CODE_09F81C:         bcc CODE_09F822    ;
CODE_09F81E:         with r2            ;
CODE_09F81F:         add   r10          ;
CODE_09F820:         move  r1,r0        ;
CODE_09F822:         loop               ;
CODE_09F823:         plot               ;
CODE_09F824:         dec   r8           ;
CODE_09F825:         bne CODE_09F808    ;
CODE_09F827:         inc   r6           ;
CODE_09F828:         with r6            ;
CODE_09F829:         sub   #0C          ;
CODE_09F82B:         with r5            ;
CODE_09F82C:         add   r7           ;
CODE_09F82D:         rpix               ;
CODE_09F82F:         from r5            ;
CODE_09F830:         sub   r9           ;
CODE_09F831:         bcc CODE_09F7D4    ;
CODE_09F833:         move  r5,r0        ;
CODE_09F836:         with r6            ;
CODE_09F837:         with  r6           ;
CODE_09F837:         bra CODE_09F7D3    ;

CODE_09F839:         add   r10          ;

CODE_09F83A:         ibt   r0,#0008     ;
CODE_09F83C:         romb               ;
CODE_09F83E:         iwt   r0,#AE18     ;
CODE_09F841:         to r14             ;
CODE_09F842:         add   r1           ;
CODE_09F843:         getbs              ;
CODE_09F845:         move  r1,r0        ;
CODE_09F847:         lms   r3,(0122)    ;
CODE_09F84A:         mult  r3           ;
CODE_09F84B:         add   r0           ;
CODE_09F84C:         add   r0           ;
CODE_09F84D:         hib                ;
CODE_09F84E:         sex                ;
CODE_09F84F:         not                ;
CODE_09F850:         add   r4           ;
CODE_09F851:         lms   r4,(0090)    ;
CODE_09F854:         add   r4           ;
CODE_09F855:         sms   (011E),r0    ;
CODE_09F858:         ibt   r0,#0040     ;
CODE_09F85A:         to r14             ;
CODE_09F85B:         add   r14          ;
CODE_09F85C:         getbs              ;
CODE_09F85E:         move  r2,r0        ;
CODE_09F860:         mult  r3           ;
CODE_09F861:         add   r0           ;
CODE_09F862:         add   r0           ;
CODE_09F863:         hib                ;
CODE_09F864:         sex                ;
CODE_09F865:         add   #08          ;
CODE_09F867:         lms   r4,(008C)    ;
CODE_09F86A:         add   r4           ;
CODE_09F86B:         sms   (011C),r0    ;
CODE_09F86E:         dec   r1           ;
CODE_09F86F:         bpl CODE_09F875    ;
CODE_09F871:         inc   r1           ;
CODE_09F872:         with r1            ;
CODE_09F873:         not                ;
CODE_09F874:         inc   r1           ;
CODE_09F875:         dec   r2           ;
CODE_09F876:         bpl CODE_09F87C    ;
CODE_09F878:         inc   r2           ;
CODE_09F879:         with r2            ;
CODE_09F87A:         not                ;
CODE_09F87B:         inc   r2           ;
CODE_09F87C:         lms   r0,(0120)    ;
CODE_09F87F:         to r5              ;
CODE_09F880:         mult  r1           ;
CODE_09F881:         to r6              ;
CODE_09F882:         mult  r2           ;
CODE_09F883:         from r3            ;
CODE_09F884:         mult  r2           ;
CODE_09F885:         add   r5           ;
CODE_09F886:         add   r0           ;
CODE_09F887:         add   r0           ;
CODE_09F888:         hib                ;
CODE_09F889:         sms   (0120),r0    ;
CODE_09F88C:         from r3            ;
CODE_09F88D:         mult  r1           ;
CODE_09F88E:         add   r6           ;
CODE_09F88F:         add   r0           ;
CODE_09F890:         add   r0           ;
CODE_09F891:         hib                ;
CODE_09F892:         sms   (0122),r0    ;
CODE_09F895:         stop               ;
CODE_09F896:         nop                ;
CODE_09F897:         lm    r0,(0002)    ;
CODE_09F89B:         add   r0           ;
CODE_09F89C:         mult  #08          ;
CODE_09F89E:         lm    r1,(0000)    ;
CODE_09F8A2:         add   r1           ;
CODE_09F8A3:         mult  #04          ;
CODE_09F8A5:         iwt   r1,#5800     ;
CODE_09F8A8:         to r14             ;
CODE_09F8A9:         add   r1           ;
CODE_09F8AA:         cache              ;
CODE_09F8AB:         iwt   r1,#063F     ;
CODE_09F8AE:         iwt   r3,#06FF     ;
CODE_09F8B1:         link  #04          ;
CODE_09F8B2:         iwt   r15,#F905    ;
CODE_09F8B5:         nop                ;
CODE_09F8B6:         iwt   r1,#061F     ;
CODE_09F8B9:         iwt   r3,#06BF     ;
CODE_09F8BC:         link  #04          ;
CODE_09F8BD:         iwt   r15,#F905    ;
CODE_09F8C0:         nop                ;
CODE_09F8C1:         iwt   r1,#043F     ;
CODE_09F8C4:         iwt   r3,#02FF     ;
CODE_09F8C7:         link  #04          ;
CODE_09F8C8:         iwt   r15,#F905    ;
CODE_09F8CB:         nop                ;
CODE_09F8CC:         iwt   r1,#041F     ;
CODE_09F8CF:         iwt   r3,#02BF     ;
CODE_09F8D2:         link  #04          ;
CODE_09F8D3:         iwt   r15,#F905    ;
CODE_09F8D6:         nop                ;
CODE_09F8D7:         iwt   r1,#023F     ;
CODE_09F8DA:         iwt   r3,#067F     ;
CODE_09F8DD:         link  #04          ;
CODE_09F8DE:         iwt   r15,#F905    ;
CODE_09F8E1:         nop                ;
CODE_09F8E2:         iwt   r1,#021F     ;
CODE_09F8E5:         iwt   r3,#063F     ;
CODE_09F8E8:         link  #04          ;
CODE_09F8E9:         iwt   r15,#F905    ;
CODE_09F8EC:         nop                ;
CODE_09F8ED:         iwt   r1,#003F     ;
CODE_09F8F0:         iwt   r3,#027F     ;
CODE_09F8F3:         link  #04          ;
CODE_09F8F4:         iwt   r15,#F905    ;
CODE_09F8F7:         nop                ;
CODE_09F8F8:         iwt   r1,#001F     ;
CODE_09F8FB:         iwt   r3,#023F     ;
CODE_09F8FE:         link  #04          ;
CODE_09F8FF:         iwt   r15,#F905    ;
CODE_09F902:         nop                ;
CODE_09F903:         stop               ;
CODE_09F904:         nop                ;

CODE_09F905:         with r1            ;
CODE_09F906:         add   r14          ;
CODE_09F907:         with r3            ;
CODE_09F908:         add   r14          ;
CODE_09F909:         ibt   r2,#0010     ;
CODE_09F90B:         from r1            ;
CODE_09F90C:         to r2              ;
CODE_09F90D:         sub   r2           ;
CODE_09F90E:         ibt   r4,#0020     ;
CODE_09F910:         from r3            ;
CODE_09F911:         to r4              ;
CODE_09F912:         sub   r4           ;
CODE_09F913:         from r3            ;
CODE_09F914:         to r5              ;
CODE_09F915:         sub   #02          ;
CODE_09F917:         from r4            ;
CODE_09F918:         to r6              ;
CODE_09F919:         sub   #02          ;
CODE_09F91B:         ibt   r10,#0002    ;
CODE_09F91D:         ibt   r12,#0004    ;
CODE_09F91F:         ibt   r13,#0002    ;
CODE_09F921:         to r7              ;
CODE_09F922:         ldb   (r1)         ;
CODE_09F924:         move  r8,r7        ;
CODE_09F926:         with r7            ;
CODE_09F927:         lsr                ;
CODE_09F928:         ror                ;
CODE_09F929:         with r8            ;
CODE_09F92A:         lsr                ;
CODE_09F92B:         ror                ;
CODE_09F92C:         with r7            ;
CODE_09F92D:         lsr                ;
CODE_09F92E:         ror                ;
CODE_09F92F:         with r8            ;
CODE_09F930:         lsr                ;
CODE_09F931:         ror                ;
CODE_09F932:         with r7            ;
CODE_09F933:         lsr                ;
CODE_09F934:         ror                ;
CODE_09F935:         with r8            ;
CODE_09F936:         lsr                ;
CODE_09F937:         ror                ;
CODE_09F938:         with r7            ;
CODE_09F939:         lsr                ;
CODE_09F93A:         ror                ;
CODE_09F93B:         with r8            ;
CODE_09F93C:         lsr                ;
CODE_09F93D:         ror                ;
CODE_09F93E:         swap               ;
CODE_09F93F:         stb   (r3)         ;
CODE_09F941:         dec   r3           ;
CODE_09F942:         stb   (r5)         ;
CODE_09F944:         dec   r5           ;
CODE_09F945:         with r7            ;
CODE_09F946:         lsr                ;
CODE_09F947:         ror                ;
CODE_09F948:         with r8            ;
CODE_09F949:         lsr                ;
CODE_09F94A:         ror                ;
CODE_09F94B:         with r7            ;
CODE_09F94C:         lsr                ;
CODE_09F94D:         ror                ;
CODE_09F94E:         with r8            ;
CODE_09F94F:         lsr                ;
CODE_09F950:         ror                ;
CODE_09F951:         with r7            ;
CODE_09F952:         lsr                ;
CODE_09F953:         ror                ;
CODE_09F954:         with r8            ;
CODE_09F955:         lsr                ;
CODE_09F956:         ror                ;
CODE_09F957:         with r7            ;
CODE_09F958:         lsr                ;
CODE_09F959:         ror                ;
CODE_09F95A:         with r8            ;
CODE_09F95B:         lsr                ;
CODE_09F95C:         ror                ;
CODE_09F95D:         swap               ;
CODE_09F95E:         stb   (r4)         ;
CODE_09F960:         dec   r4           ;
CODE_09F961:         stb   (r6)         ;
CODE_09F963:         dec   r6           ;
CODE_09F964:         dec   r13          ;
CODE_09F965:         bne CODE_09F921    ;
CODE_09F967:         dec   r1           ;
CODE_09F968:         with r3            ;
CODE_09F969:         sub   #02          ;
CODE_09F96B:         with r4            ;
CODE_09F96C:         sub   #02          ;
CODE_09F96E:         with r5            ;
CODE_09F96F:         sub   #02          ;
CODE_09F971:         with r6            ;
CODE_09F972:         sub   #02          ;
CODE_09F974:         dec   r12          ;
CODE_09F975:         bne CODE_09F91F    ;
CODE_09F977:         nop                ;
CODE_09F978:         ibt   r12,#0004    ;
CODE_09F97A:         ibt   r13,#0002    ;
CODE_09F97C:         to r7              ;
CODE_09F97D:         ldb   (r2)         ;
CODE_09F97F:         move  r8,r7        ;
CODE_09F981:         with r7            ;
CODE_09F982:         lsr                ;
CODE_09F983:         ror                ;
CODE_09F984:         with r8            ;
CODE_09F985:         lsr                ;
CODE_09F986:         ror                ;
CODE_09F987:         with r7            ;
CODE_09F988:         lsr                ;
CODE_09F989:         ror                ;
CODE_09F98A:         with r8            ;
CODE_09F98B:         lsr                ;
CODE_09F98C:         ror                ;
CODE_09F98D:         with r7            ;
CODE_09F98E:         lsr                ;
CODE_09F98F:         ror                ;
CODE_09F990:         with r8            ;
CODE_09F991:         lsr                ;
CODE_09F992:         ror                ;
CODE_09F993:         with r7            ;
CODE_09F994:         lsr                ;
CODE_09F995:         ror                ;
CODE_09F996:         with r8            ;
CODE_09F997:         lsr                ;
CODE_09F998:         ror                ;
CODE_09F999:         swap               ;
CODE_09F99A:         stb   (r3)         ;
CODE_09F99C:         dec   r3           ;
CODE_09F99D:         stb   (r5)         ;
CODE_09F99F:         dec   r5           ;
CODE_09F9A0:         with r7            ;
CODE_09F9A1:         lsr                ;
CODE_09F9A2:         ror                ;
CODE_09F9A3:         with r8            ;
CODE_09F9A4:         lsr                ;
CODE_09F9A5:         ror                ;
CODE_09F9A6:         with r7            ;
CODE_09F9A7:         lsr                ;
CODE_09F9A8:         ror                ;
CODE_09F9A9:         with r8            ;
CODE_09F9AA:         lsr                ;
CODE_09F9AB:         ror                ;
CODE_09F9AC:         with r7            ;
CODE_09F9AD:         lsr                ;
CODE_09F9AE:         ror                ;
CODE_09F9AF:         with r8            ;
CODE_09F9B0:         lsr                ;
CODE_09F9B1:         ror                ;
CODE_09F9B2:         with r7            ;
CODE_09F9B3:         lsr                ;
CODE_09F9B4:         ror                ;
CODE_09F9B5:         with r8            ;
CODE_09F9B6:         lsr                ;
CODE_09F9B7:         ror                ;
CODE_09F9B8:         swap               ;
CODE_09F9B9:         stb   (r4)         ;
CODE_09F9BB:         dec   r4           ;
CODE_09F9BC:         stb   (r6)         ;
CODE_09F9BE:         dec   r6           ;
CODE_09F9BF:         dec   r13          ;
CODE_09F9C0:         bne CODE_09F97C    ;
CODE_09F9C2:         dec   r2           ;
CODE_09F9C3:         with r3            ;
CODE_09F9C4:         sub   #02          ;
CODE_09F9C6:         with r4            ;
CODE_09F9C7:         sub   #02          ;
CODE_09F9C9:         with r5            ;
CODE_09F9CA:         sub   #02          ;
CODE_09F9CC:         with r6            ;
CODE_09F9CD:         sub   #02          ;
CODE_09F9CF:         dec   r12          ;
CODE_09F9D0:         bne CODE_09F97A    ;
CODE_09F9D2:         nop                ;
CODE_09F9D3:         iwt   r12,#01E0    ;
CODE_09F9D6:         with r3            ;
CODE_09F9D7:         sub   r12          ;
CODE_09F9D8:         with r4            ;
CODE_09F9D9:         sub   r12          ;
CODE_09F9DA:         with r5            ;
CODE_09F9DB:         sub   r12          ;
CODE_09F9DC:         with r6            ;
CODE_09F9DD:         sub   r12          ;
CODE_09F9DE:         dec   r10          ;
CODE_09F9DF:         beq CODE_09F9E6    ;
CODE_09F9E1:         nop                ;
CODE_09F9E2:         iwt   r15,#F91D    ;
CODE_09F9E5:         nop                ;
CODE_09F9E6:         jmp   r11          ;
CODE_09F9E7:         nop                ;

CODE_09F9E8:         iwt   r0,#409E     ;
CODE_09F9EB:         to r1              ;
CODE_09F9EC:         add   r1           ;
CODE_09F9ED:         to r2              ;
CODE_09F9EE:         add   r2           ;
CODE_09F9EF:         iwt   r0,#0DAA     ;
CODE_09F9F2:         to r4              ;
CODE_09F9F3:         add   r10          ;
CODE_09F9F4:         ibt   r0,#0040     ;
CODE_09F9F6:         to r5              ;
CODE_09F9F7:         add   r4           ;
CODE_09F9F8:         from r12           ;
CODE_09F9F9:         add   r12          ;
CODE_09F9FA:         add   r0           ;
CODE_09F9FB:         add   r10          ;
CODE_09F9FC:         ibt   r10,#003E    ;
CODE_09F9FE:         to r10             ;
CODE_09F9FF:         and   r10          ;
CODE_09FA00:         ibt   r0,#004C     ;
CODE_09FA02:         romb               ;
CODE_09FA04:         iwt   r6,#32A4     ;
CODE_09FA07:         iwt   r7,#33F2     ;
CODE_09FA0A:         ibt   r8,#0008     ;
CODE_09FA0C:         link  #04          ;
CODE_09FA0D:         iwt   r15,#FA28    ;
CODE_09FA10:         cache              ;
CODE_09FA11:         move  r1,r2        ;
CODE_09FA13:         moves r12,r3       ;
CODE_09FA15:         beq CODE_09FA26    ;
CODE_09FA17:         nop                ;
CODE_09FA18:         iwt   r0,#0DAA     ;
CODE_09FA1B:         to r4              ;
CODE_09FA1C:         add   r10          ;
CODE_09FA1D:         ibt   r0,#0040     ;
CODE_09FA1F:         to r5              ;
CODE_09FA20:         add   r4           ;
CODE_09FA21:         link  #04          ;
CODE_09FA22:         iwt   r15,#FA28    ;
CODE_09FA25:         nop                ;
CODE_09FA26:         stop               ;
CODE_09FA27:         nop                ;

CODE_09FA28:         move  r13,r15      ;
CODE_09FA2A:         ldw   (r1)         ;
CODE_09FA2B:         to r9              ;
CODE_09FA2C:         umult r8           ;
CODE_09FA2E:         hib                ;
CODE_09FA2F:         add   r0           ;
CODE_09FA30:         to r14             ;
CODE_09FA31:         add   r6           ;
CODE_09FA32:         getb               ;
CODE_09FA33:         inc   r14          ;
CODE_09FA34:         getbh              ;
CODE_09FA36:         add   r9           ;
CODE_09FA37:         to r14             ;
CODE_09FA38:         add   r7           ;
CODE_09FA39:         ibt   r9,#0040     ;
CODE_09FA3B:         with r1            ;
CODE_09FA3C:         add   r9           ;
CODE_09FA3D:         getb               ;
CODE_09FA3E:         inc   r14          ;
CODE_09FA3F:         stb   (r4)         ;
CODE_09FA41:         inc   r4           ;
CODE_09FA42:         getb               ;
CODE_09FA43:         inc   r14          ;
CODE_09FA44:         stb   (r4)         ;
CODE_09FA46:         inc   r4           ;
CODE_09FA47:         getb               ;
CODE_09FA48:         inc   r14          ;
CODE_09FA49:         stb   (r5)         ;
CODE_09FA4B:         inc   r5           ;
CODE_09FA4C:         getb               ;
CODE_09FA4D:         inc   r14          ;
CODE_09FA4E:         stb   (r5)         ;
CODE_09FA50:         inc   r5           ;
CODE_09FA51:         getb               ;
CODE_09FA52:         inc   r14          ;
CODE_09FA53:         stb   (r4)         ;
CODE_09FA55:         inc   r4           ;
CODE_09FA56:         getb               ;
CODE_09FA57:         inc   r14          ;
CODE_09FA58:         stb   (r4)         ;
CODE_09FA5A:         inc   r4           ;
CODE_09FA5B:         getb               ;
CODE_09FA5C:         inc   r14          ;
CODE_09FA5D:         stb   (r5)         ;
CODE_09FA5F:         inc   r5           ;
CODE_09FA60:         getb               ;
CODE_09FA61:         inc   r14          ;
CODE_09FA62:         stb   (r5)         ;
CODE_09FA64:         loop               ;
CODE_09FA65:         inc   r5           ;
CODE_09FA66:         jmp   r11          ;
CODE_09FA67:         nop                ;

CODE_09FA68:         iwt   r0,#409E     ;
CODE_09FA6B:         to r1              ;
CODE_09FA6C:         add   r1           ;
CODE_09FA6D:         to r2              ;
CODE_09FA6E:         add   r2           ;
CODE_09FA6F:         iwt   r4,#0E2A     ;
CODE_09FA72:         iwt   r5,#0E6E     ;
CODE_09FA75:         ibt   r0,#004C     ;
CODE_09FA77:         romb               ;
CODE_09FA79:         iwt   r6,#32A4     ;
CODE_09FA7C:         iwt   r7,#33F2     ;
CODE_09FA7F:         ibt   r8,#0008     ;
CODE_09FA81:         link  #04          ;
CODE_09FA82:         iwt   r15,#FA91    ;
CODE_09FA85:         cache              ;
CODE_09FA86:         move  r1,r2        ;
CODE_09FA88:         move  r12,r3       ;
CODE_09FA8A:         link  #04          ;
CODE_09FA8B:         iwt   r15,#FA91    ;
CODE_09FA8E:         nop                ;
CODE_09FA8F:         stop               ;
CODE_09FA90:         nop                ;

CODE_09FA91:         move  r13,r15      ;
CODE_09FA93:         ldw   (r1)         ;
CODE_09FA94:         to r9              ;
CODE_09FA95:         umult r8           ;
CODE_09FA97:         hib                ;
CODE_09FA98:         add   r0           ;
CODE_09FA99:         to r14             ;
CODE_09FA9A:         add   r6           ;
CODE_09FA9B:         getb               ;
CODE_09FA9C:         inc   r14          ;
CODE_09FA9D:         inc   r1           ;
CODE_09FA9E:         inc   r1           ;
CODE_09FA9F:         getbh              ;
CODE_09FAA1:         add   r9           ;
CODE_09FAA2:         to r14             ;
CODE_09FAA3:         add   r7           ;
CODE_09FAA4:         getb               ;
CODE_09FAA5:         inc   r14          ;
CODE_09FAA6:         stb   (r4)         ;
CODE_09FAA8:         inc   r4           ;
CODE_09FAA9:         getb               ;
CODE_09FAAA:         inc   r14          ;
CODE_09FAAB:         stb   (r4)         ;
CODE_09FAAD:         inc   r4           ;
CODE_09FAAE:         getb               ;
CODE_09FAAF:         inc   r14          ;
CODE_09FAB0:         stb   (r4)         ;
CODE_09FAB2:         inc   r4           ;
CODE_09FAB3:         getb               ;
CODE_09FAB4:         inc   r14          ;
CODE_09FAB5:         stb   (r4)         ;
CODE_09FAB7:         inc   r4           ;
CODE_09FAB8:         getb               ;
CODE_09FAB9:         inc   r14          ;
CODE_09FABA:         stb   (r5)         ;
CODE_09FABC:         inc   r5           ;
CODE_09FABD:         getb               ;
CODE_09FABE:         inc   r14          ;
CODE_09FABF:         stb   (r5)         ;
CODE_09FAC1:         inc   r5           ;
CODE_09FAC2:         getb               ;
CODE_09FAC3:         inc   r14          ;
CODE_09FAC4:         stb   (r5)         ;
CODE_09FAC6:         inc   r5           ;
CODE_09FAC7:         getb               ;
CODE_09FAC8:         inc   r14          ;
CODE_09FAC9:         stb   (r5)         ;
CODE_09FACB:         loop               ;
CODE_09FACC:         inc   r5           ;
CODE_09FACD:         jmp   r11          ;
CODE_09FACE:         nop                ;

; freespace
DATA_09FACF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FAD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FADF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FAE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FAEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FAF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FAFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FB9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FBFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FC9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FCFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FD9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FDFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FE9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FECF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FED7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FEFF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF07:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF0F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF17:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF1F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF27:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF2F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF37:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF3F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FF9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_09FFFF:         db $FF
