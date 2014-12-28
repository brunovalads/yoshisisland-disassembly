org $088000

CODE_088000:         stop               ;
CODE_088001:         nop                ;

CODE_088002:         ibt   r9,#0030     ;
CODE_088004:         from r6            ;
CODE_088005:         to r12             ;
CODE_088006:         sub   r9           ;
CODE_088007:         iwt   r0,#3A04     ;
CODE_08800A:         ibt   r7,#0004     ;
CODE_08800C:         iwt   r8,#00FF     ;
CODE_08800F:         cache              ;
CODE_088010:         dec   r12          ;
CODE_088011:         bmi CODE_08801A    ;
CODE_088013:         inc   r12          ;
CODE_088014:         move  r13,r15      ;
CODE_088016:         from r8            ;
CODE_088017:         stw   (r0)         ;
CODE_088018:         loop               ;
CODE_088019:         add   r7           ;
CODE_08801A:         move  r10,r0       ;
CODE_08801C:         ibt   r0,#0050     ;
CODE_08801E:         from r5            ;
CODE_08801F:         to r11             ;
CODE_088020:         sub   r0           ;
CODE_088021:         add   r5           ;
CODE_088022:         dec   r0           ;
CODE_088023:         swap               ;
CODE_088024:         to r11             ;
CODE_088025:         or    r11          ;
CODE_088026:         move  r0,r10       ;
CODE_088028:         ibt   r12,#0060    ;
CODE_08802A:         move  r13,r15      ;
CODE_08802C:         from r11           ;
CODE_08802D:         stw   (r0)         ;
CODE_08802E:         loop               ;
CODE_08802F:         add   r7           ;
CODE_088030:         move  r10,r0       ;
CODE_088032:         iwt   r0,#00D2     ;
CODE_088035:         sub   r6           ;
CODE_088036:         to r12             ;
CODE_088037:         sub   r9           ;
CODE_088038:         move  r0,r10       ;
CODE_08803A:         move  r13,r15      ;
CODE_08803C:         from r8            ;
CODE_08803D:         stw   (r0)         ;
CODE_08803E:         loop               ;
CODE_08803F:         add   r7           ;
CODE_088040:         sms   (0048),r4    ;
CODE_088043:         sms   (004A),r5    ;
CODE_088046:         sms   (004C),r6    ;
CODE_088049:         ibt   r0,#0008     ;
CODE_08804B:         romb               ;
CODE_08804D:         iwt   r0,#AE18     ;
CODE_088050:         to r14             ;
CODE_088051:         add   r1           ;
CODE_088052:         to r4              ;
CODE_088053:         getb               ;
CODE_088054:         to r14             ;
CODE_088055:         add   r2           ;
CODE_088056:         to r6              ;
CODE_088057:         getb               ;
CODE_088058:         to r14             ;
CODE_088059:         add   r3           ;
CODE_08805A:         to r8              ;
CODE_08805B:         getb               ;
CODE_08805C:         iwt   r0,#AE58     ;
CODE_08805F:         to r14             ;
CODE_088060:         add   r1           ;
CODE_088061:         to r5              ;
CODE_088062:         getb               ;
CODE_088063:         to r14             ;
CODE_088064:         add   r2           ;
CODE_088065:         to r7              ;
CODE_088066:         getb               ;
CODE_088067:         to r14             ;
CODE_088068:         add   r3           ;
CODE_088069:         to r9              ;
CODE_08806A:         getb               ;
CODE_08806B:         iwt   r14,#0080    ;
CODE_08806E:         from r5            ;
CODE_08806F:         mult  r7           ;
CODE_088070:         add   r0           ;
CODE_088071:         add   r0           ;
CODE_088072:         add   r14          ;
CODE_088073:         hib                ;
CODE_088074:         sex                ;
CODE_088075:         move  r10,r0       ;
CODE_088077:         to r1              ;
CODE_088078:         mult  r9           ;
CODE_088079:         from r6            ;
CODE_08807A:         mult  r8           ;
CODE_08807B:         add   r1           ;
CODE_08807C:         add   r0           ;
CODE_08807D:         add   r0           ;
CODE_08807E:         add   r14          ;
CODE_08807F:         hib                ;
CODE_088080:         to r1              ;
CODE_088081:         sex                ;
CODE_088082:         from r6            ;
CODE_088083:         to r2              ;
CODE_088084:         mult  r9           ;
CODE_088085:         from r10           ;
CODE_088086:         mult  r8           ;
CODE_088087:         sub   r2           ;
CODE_088088:         add   r0           ;
CODE_088089:         add   r0           ;
CODE_08808A:         add   r14          ;
CODE_08808B:         hib                ;
CODE_08808C:         to r2              ;
CODE_08808D:         sex                ;
CODE_08808E:         from r4            ;
CODE_08808F:         mult  r9           ;
CODE_088090:         add   r0           ;
CODE_088091:         add   r0           ;
CODE_088092:         add   r14          ;
CODE_088093:         hib                ;
CODE_088094:         to r3              ;
CODE_088095:         sex                ;
CODE_088096:         from r4            ;
CODE_088097:         mult  r8           ;
CODE_088098:         add   r0           ;
CODE_088099:         add   r0           ;
CODE_08809A:         add   r14          ;
CODE_08809B:         hib                ;
CODE_08809C:         to r10             ;
CODE_08809D:         sex                ;
CODE_08809E:         from r5            ;
CODE_08809F:         mult  r6           ;
CODE_0880A0:         add   r0           ;
CODE_0880A1:         add   r0           ;
CODE_0880A2:         add   r14          ;
CODE_0880A3:         hib                ;
CODE_0880A4:         sex                ;
CODE_0880A5:         move  r4,r0        ;
CODE_0880A7:         to r5              ;
CODE_0880A8:         mult  r8           ;
CODE_0880A9:         from r7            ;
CODE_0880AA:         mult  r9           ;
CODE_0880AB:         add   r5           ;
CODE_0880AC:         add   r0           ;
CODE_0880AD:         add   r0           ;
CODE_0880AE:         add   r14          ;
CODE_0880AF:         hib                ;
CODE_0880B0:         to r5              ;
CODE_0880B1:         sex                ;
CODE_0880B2:         with r7            ;
CODE_0880B3:         mult  r8           ;
CODE_0880B4:         from r4            ;
CODE_0880B5:         mult  r9           ;
CODE_0880B6:         sub   r7           ;
CODE_0880B7:         add   r0           ;
CODE_0880B8:         add   r0           ;
CODE_0880B9:         add   r14          ;
CODE_0880BA:         hib                ;
CODE_0880BB:         to r7              ;
CODE_0880BC:         sex                ;
CODE_0880BD:         ibt   r0,#0008     ;
CODE_0880BF:         romb               ;
CODE_0880C1:         iwt   r14,#81FD    ;
CODE_0880C4:         ibt   r11,#0000    ;
CODE_0880C6:         cache              ;
CODE_0880C7:         ibt   r12,#0004    ;
CODE_0880C9:         move  r13,r15      ;
CODE_0880CB:         getb               ;
CODE_0880CC:         inc   r14          ;
CODE_0880CD:         to r9              ;
CODE_0880CE:         mult  r1           ;
CODE_0880CF:         to r8              ;
CODE_0880D0:         mult  r3           ;
CODE_0880D1:         to r4              ;
CODE_0880D2:         mult  r7           ;
CODE_0880D3:         getb               ;
CODE_0880D4:         inc   r14          ;
CODE_0880D5:         move  r6,r0        ;
CODE_0880D7:         mult  r2           ;
CODE_0880D8:         add   r9           ;
CODE_0880D9:         add   r0           ;
CODE_0880DA:         to r9              ;
CODE_0880DB:         add   r0           ;
CODE_0880DC:         from r6            ;
CODE_0880DD:         mult  r10          ;
CODE_0880DE:         add   r8           ;
CODE_0880DF:         add   r0           ;
CODE_0880E0:         to r8              ;
CODE_0880E1:         add   r0           ;
CODE_0880E2:         from r6            ;
CODE_0880E3:         mult  r5           ;
CODE_0880E4:         add   r4           ;
CODE_0880E5:         add   r0           ;
CODE_0880E6:         add   r0           ;
CODE_0880E7:         hib                ;
CODE_0880E8:         sex                ;
CODE_0880E9:         add   r0           ;
CODE_0880EA:         iwt   r6,#2400     ;
CODE_0880ED:         add   r6           ;
CODE_0880EE:         to r6              ;
CODE_0880EF:         ldw   (r0)         ;
CODE_0880F0:         lms   r0,(0048)    ;
CODE_0880F3:         lmult              ;
CODE_0880F5:         swap               ;
CODE_0880F6:         with r4            ;
CODE_0880F7:         hib                ;
CODE_0880F8:         to r6              ;
CODE_0880F9:         or    r4           ;
CODE_0880FA:         from r8            ;
CODE_0880FB:         fmult              ;
CODE_0880FC:         lms   r8,(004C)    ;
CODE_0880FF:         to r8              ;
CODE_088100:         add   r8           ;
CODE_088101:         from r9            ;
CODE_088102:         fmult              ;
CODE_088103:         lms   r9,(004A)    ;
CODE_088106:         add   r9           ;
CODE_088107:         swap               ;
CODE_088108:         or    r8           ;
CODE_088109:         stw   (r11)        ;
CODE_08810A:         inc   r11          ;
CODE_08810B:         loop               ;
CODE_08810C:         inc   r11          ;
CODE_08810D:         dec   r11          ;
CODE_08810E:         dec   r11          ;
CODE_08810F:         sms   (0058),r11   ;
CODE_088112:         ibt   r1,#0000     ;
CODE_088114:         move  r3,r1        ;
CODE_088116:         to r2              ;
CODE_088117:         ldb   (r1)         ;
CODE_088119:         move  r4,r2        ;
CODE_08811B:         inc   r1           ;
CODE_08811C:         lms   r0,(0058)    ;
CODE_08811F:         to r12             ;
CODE_088120:         lsr                ;
CODE_088121:         move  r13,r15      ;
CODE_088123:         inc   r1           ;
CODE_088124:         ldb   (r1)         ;
CODE_088126:         sub   r2           ;
CODE_088127:         bpl CODE_08812E    ;
CODE_088129:         add   r2           ;
CODE_08812A:         move  r2,r0        ;
CODE_08812C:         move  r3,r1        ;
CODE_08812E:         sub   r4           ;
CODE_08812F:         bmi CODE_088134    ;
CODE_088131:         add   r4           ;
CODE_088132:         move  r4,r0        ;
CODE_088134:         loop               ;
CODE_088135:         inc   r1           ;
CODE_088136:         iwt   r0,#00D2     ;
CODE_088139:         to r12             ;
CODE_08813A:         sub   r4           ;
CODE_08813B:         iwt   r0,#3D46     ;
CODE_08813E:         iwt   r5,#00FF     ;
CODE_088141:         ibt   r6,#0004     ;
CODE_088143:         move  r13,r15      ;
CODE_088145:         from r5            ;
CODE_088146:         stw   (r0)         ;
CODE_088147:         loop               ;
CODE_088148:         sub   r6           ;
CODE_088149:         iwt   r0,#3A02     ;
CODE_08814C:         moves r12,r2       ;
CODE_08814E:         beq CODE_088157    ;
CODE_088150:         nop                ;
CODE_088151:         move  r13,r15      ;
CODE_088153:         from r5            ;
CODE_088154:         stw   (r0)         ;
CODE_088155:         loop               ;
CODE_088156:         add   r6           ;
CODE_088157:         move  r1,r0        ;
CODE_088159:         from r4            ;
CODE_08815A:         to r12             ;
CODE_08815B:         sub   r2           ;
CODE_08815C:         bne CODE_088163    ;
CODE_08815E:         move  r5,r3        ;
CODE_088160:         stop               ;
CODE_088161:         nop                ;
;
CODE_088162:         move  r5,r3        ;
CODE_088164:         to r10             ;
CODE_088165:         ldb   (r3)         ;
CODE_088167:         move  r11,r10      ;
CODE_088169:         move  r13,r15      ;
CODE_08816B:         from r2            ;
CODE_08816C:         sub   r10          ;
CODE_08816D:         bcc CODE_0881A3    ;
CODE_08816F:         move  r4,r3        ;
CODE_088172:         dec   r3           ;
CODE_088173:         bpl CODE_088179    ;
CODE_088175:         dec   r3           ;
CODE_088176:         lms   r3,(0058)    ;
CODE_088179:         ldb   (r3)         ;
CODE_08817B:         move  r10,r0       ;
CODE_08817D:         sub   r2           ;
CODE_08817E:         beq CODE_088170    ;
CODE_088180:         inc   r0           ;
CODE_088181:         add   r0           ;
CODE_088182:         iwt   r6,#2200     ;
CODE_088185:         add   r6           ;
CODE_088186:         ldw   (r0)         ;
CODE_088187:         to r6              ;
CODE_088188:         lsr                ;
CODE_088189:         inc   r4           ;
CODE_08818A:         to r8              ;
CODE_08818B:         ldb   (r4)         ;
CODE_08818D:         inc   r3           ;
CODE_08818E:         ldb   (r3)         ;
CODE_088190:         dec   r3           ;
CODE_088191:         sub   r8           ;
CODE_088192:         add   r0           ;
CODE_088193:         lmult              ;
CODE_088195:         lob                ;
CODE_088196:         swap               ;
CODE_088197:         with r4            ;
CODE_088198:         hib                ;
CODE_088199:         to r14             ;
CODE_08819A:         or    r4           ;
CODE_08819B:         with r8            ;
CODE_08819C:         swap               ;
CODE_08819D:         iwt   r0,#0080     ;
CODE_0881A0:         to r8              ;
CODE_0881A1:         add   r8           ;
CODE_0881A2:         with r8            ;
CODE_0881A3:         add   r14          ;
CODE_0881A4:         from r2            ;
CODE_0881A5:         sub   r11          ;
CODE_0881A6:         bcc CODE_0881DF    ;
CODE_0881A8:         move  r4,r5        ;
CODE_0881AB:         inc   r5           ;
CODE_0881AC:         lms   r0,(0058)    ;
CODE_0881AF:         sub   r5           ;
CODE_0881B0:         bpl CODE_0881B5    ;
CODE_0881B2:         inc   r5           ;
CODE_0881B3:         ibt   r5,#0000     ;
CODE_0881B5:         ldb   (r5)         ;
CODE_0881B7:         move  r11,r0       ;
CODE_0881B9:         sub   r2           ;
CODE_0881BA:         beq CODE_0881A9    ;
CODE_0881BC:         inc   r0           ;
CODE_0881BD:         add   r0           ;
CODE_0881BE:         iwt   r6,#2200     ;
CODE_0881C1:         add   r6           ;
CODE_0881C2:         ldw   (r0)         ;
CODE_0881C3:         to r6              ;
CODE_0881C4:         lsr                ;
CODE_0881C5:         inc   r4           ;
CODE_0881C6:         to r9              ;
CODE_0881C7:         ldb   (r4)         ;
CODE_0881C9:         inc   r5           ;
CODE_0881CA:         ldb   (r5)         ;
CODE_0881CC:         dec   r5           ;
CODE_0881CD:         sub   r9           ;
CODE_0881CE:         add   r0           ;
CODE_0881CF:         lmult              ;
CODE_0881D1:         lob                ;
CODE_0881D2:         swap               ;
CODE_0881D3:         with r4            ;
CODE_0881D4:         hib                ;
CODE_0881D5:         to r7              ;
CODE_0881D6:         or    r4           ;
CODE_0881D7:         with r9            ;
CODE_0881D8:         swap               ;
CODE_0881D9:         iwt   r0,#0080     ;
CODE_0881DC:         to r9              ;
CODE_0881DD:         add   r9           ;
CODE_0881DE:         with r9            ;
CODE_0881DF:         add   r7           ;
CODE_0881E0:         from r9            ;
CODE_0881E1:         hib                ;
CODE_0881E2:         move  r6,r0        ;
CODE_0881E4:         to r4              ;
CODE_0881E5:         swap               ;
CODE_0881E6:         from r8            ;
CODE_0881E7:         hib                ;
CODE_0881E8:         to r6              ;
CODE_0881E9:         sub   r6           ;
CODE_0881EA:         bcc CODE_0881F5    ;
CODE_0881EC:         or    r4           ;
CODE_0881ED:         moves r6,r6        ;
CODE_0881EF:         bne CODE_0881F5    ;
CODE_0881F1:         swap               ;
CODE_0881F2:         iwt   r0,#00FF     ;
CODE_0881F5:         stw   (r1)         ;
CODE_0881F6:         with r1            ;
CODE_0881F7:         add   #04          ;
CODE_0881F9:         loop               ;
CODE_0881FA:         inc   r2           ;
CODE_0881FB:         stop               ;
CODE_0881FC:         nop                ;

DATA_0881FD:         db $B0, $30, $4F, $30
DATA_088201:         db $4F, $D0, $B0, $D0

; drawing routine: 32x32, polar, $1000 offset
CODE_088205:         ibt   r1,#0001     ;
CODE_088207:         iwt   r0,#2200     ;
CODE_08820A:         add   r6           ;
CODE_08820B:         add   r6           ;
CODE_08820C:         to r6              ;
CODE_08820D:         ldw   (r0)         ;
CODE_08820E:         with r5            ;
CODE_08820F:         add   r5           ;
CODE_088210:         ibt   r0,#0008     ;
CODE_088212:         romb               ;
CODE_088214:         iwt   r0,#AB98     ;
CODE_088217:         to r14             ;
CODE_088218:         add   r5           ;
CODE_088219:         getb               ;
CODE_08821A:         inc   r14          ;
CODE_08821B:         getbh              ;
CODE_08821D:         lmult              ;
CODE_08821F:         with r4            ;
CODE_088220:         hib                ;
CODE_088221:         lob                ;
CODE_088222:         swap               ;
CODE_088223:         or    r4           ;
CODE_088224:         move  r9,r0        ;
CODE_088226:         not                ;
CODE_088227:         inc   r0           ;
CODE_088228:         add   r0           ;
CODE_088229:         add   r0           ;
CODE_08822A:         add   r0           ;
CODE_08822B:         to r11             ;
CODE_08822C:         add   r0           ;
CODE_08822D:         iwt   r0,#AC18     ;
CODE_088230:         to r14             ;
CODE_088231:         add   r5           ;
CODE_088232:         getb               ;
CODE_088233:         inc   r14          ;
CODE_088234:         getbh              ;
CODE_088236:         lmult              ;
CODE_088238:         with r4            ;
CODE_088239:         hib                ;
CODE_08823A:         lob                ;
CODE_08823B:         swap               ;
CODE_08823C:         or    r4           ;
CODE_08823D:         move  r4,r0        ;
CODE_08823F:         not                ;
CODE_088240:         inc   r0           ;
CODE_088241:         add   r0           ;
CODE_088242:         add   r0           ;
CODE_088243:         add   r0           ;
CODE_088244:         add   r0           ;
CODE_088245:         move  r5,r0        ;
CODE_088247:         add   r11          ;
CODE_088248:         iwt   r6,#1000     ;
CODE_08824B:         to r10             ;
CODE_08824C:         add   r6           ;
CODE_08824D:         from r11           ;
CODE_08824E:         sub   r5           ;
CODE_08824F:         to r11             ;
CODE_088250:         add   r6           ;
CODE_088251:         move  r0,r12       ;
CODE_088253:         lsr                ;
CODE_088254:         bcc CODE_08825A    ;
CODE_088256:         add   r0           ;
CODE_088257:         with r1            ;
CODE_088258:         or    #04          ;
CODE_08825A:         from r1            ;
CODE_08825B:         cmode              ;
CODE_08825D:         move  r6,r0        ;
CODE_08825F:         from r13           ;
CODE_088260:         romb               ;
CODE_088262:         iwt   r13,#8270    ;
CODE_088265:         ibt   r5,#0020     ;
CODE_088267:         cache              ;
CODE_088268:         move  r1,r3        ;
CODE_08826A:         move  r8,r10       ;
CODE_08826C:         move  r7,r11       ;
CODE_08826E:         ibt   r12,#0020    ;
CODE_088270:         merge              ;
CODE_088271:         bcs CODE_08827F    ;
CODE_088273:         to r14             ;
CODE_088274:         add   r6           ;
CODE_088275:         with r8            ;
CODE_088276:         add   r9           ;
CODE_088277:         with r7            ;
CODE_088278:         sub   r4           ;
CODE_088279:         getc               ;
CODE_08827A:         loop               ;
CODE_08827B:         plot               ;
CODE_08827C:         bra CODE_088288    ;

CODE_08827E:         with r10           ;
CODE_08827F:         with r8            ;
CODE_088280:         add   r9           ;
CODE_088281:         with r7            ;
CODE_088282:         sub   r4           ;
CODE_088283:         sub   r0           ;
CODE_088284:         color              ;
CODE_088285:         loop               ;
CODE_088286:         plot               ;
CODE_088287:         with r10           ;
CODE_088288:         add   r4           ;
CODE_088289:         with r11           ;
CODE_08828A:         add   r9           ;
CODE_08828B:         dec   r5           ;
CODE_08828C:         bne CODE_088268    ;
CODE_08828E:         inc   r2           ;
CODE_08828F:         rpix               ;
CODE_088291:         stop               ;
CODE_088292:         nop                ;

; drawing routine: 32x32, Cartesian
CODE_088293:         move  r11,r6       ;
CODE_088295:         ibt   r1,#0001     ;
CODE_088297:         iwt   r4,#2200     ;
CODE_08829A:         from r4            ;
CODE_08829B:         add   r6           ;
CODE_08829C:         add   r6           ;
CODE_08829D:         to r6              ;
CODE_08829E:         ldw   (r0)         ;
CODE_08829F:         from r4            ;
CODE_0882A0:         add   r11          ;
CODE_0882A1:         add   r11          ;
CODE_0882A2:         to r11             ;
CODE_0882A3:         ldw   (r0)         ;
CODE_0882A4:         move  r0,r8        ;
CODE_0882A6:         to r10             ;
CODE_0882A7:         swap               ;
CODE_0882A8:         not                ;
CODE_0882A9:         inc   r0           ;
CODE_0882AA:         lmult              ;
CODE_0882AC:         with r10           ;
CODE_0882AD:         add   r4           ;
CODE_0882AE:         move  r5,r6        ;
CODE_0882B0:         move  r6,r11       ;
CODE_0882B2:         move  r0,r9        ;
CODE_0882B4:         to r7              ;
CODE_0882B5:         swap               ;
CODE_0882B6:         not                ;
CODE_0882B7:         inc   r0           ;
CODE_0882B8:         lmult              ;
CODE_0882BA:         with r7            ;
CODE_0882BB:         add   r4           ;
CODE_0882BC:         move  r0,r12       ;
CODE_0882BE:         lsr                ;
CODE_0882BF:         bcc CODE_0882C5    ;
CODE_0882C1:         add   r0           ;
CODE_0882C2:         with r1            ;
CODE_0882C3:         or    #04          ;
CODE_0882C5:         from r1            ;
CODE_0882C6:         cmode              ;
CODE_0882C8:         move  r6,r0        ;
CODE_0882CA:         from r13           ;
CODE_0882CB:         romb               ;
CODE_0882CD:         iwt   r13,#82DB    ;
CODE_0882D0:         ibt   r4,#0020     ;
CODE_0882D2:         move  r9,r4        ;
CODE_0882D4:         cache              ;
CODE_0882D5:         move  r1,r3        ;
CODE_0882D7:         move  r8,r10       ;
CODE_0882D9:         move  r12,r9       ;
CODE_0882DB:         merge              ;
CODE_0882DC:         bcs CODE_0882E8    ;
CODE_0882DE:         to r14             ;
CODE_0882DF:         add   r6           ;
CODE_0882E0:         with r8            ;
CODE_0882E1:         add   r5           ;
CODE_0882E2:         getc               ;
CODE_0882E3:         loop               ;
CODE_0882E4:         plot               ;
CODE_0882E5:         bra CODE_0882EF    ;

CODE_0882E7:         with r7            ;
CODE_0882E8:         with r8            ;
CODE_0882E9:         add   r5           ;
CODE_0882EA:         sub   r0           ;
CODE_0882EB:         color              ;
CODE_0882EC:         loop               ;
CODE_0882ED:         plot               ;
CODE_0882EE:         with r7            ;
CODE_0882EF:         add   r11          ;
CODE_0882F0:         dec   r4           ;
CODE_0882F1:         bne CODE_0882D5    ;
CODE_0882F3:         inc   r2           ;
CODE_0882F4:         rpix               ;
CODE_0882F6:         stop               ;
CODE_0882F7:         nop                ;

; drawing routine: 32x32, Cartesian
CODE_0882F8:         move  r11,r6       ;
CODE_0882FA:         ibt   r1,#0001     ;
CODE_0882FC:         iwt   r4,#2200     ;
CODE_0882FF:         from r4            ;
CODE_088300:         add   r6           ;
CODE_088301:         add   r6           ;
CODE_088302:         to r6              ;
CODE_088303:         ldw   (r0)         ;
CODE_088304:         from r4            ;
CODE_088305:         add   r11          ;
CODE_088306:         add   r11          ;
CODE_088307:         to r11             ;
CODE_088308:         ldw   (r0)         ;
CODE_088309:         move  r0,r8        ;
CODE_08830B:         to r10             ;
CODE_08830C:         swap               ;
CODE_08830D:         add   r0           ;
CODE_08830E:         not                ;
CODE_08830F:         inc   r0           ;
CODE_088310:         lmult              ;
CODE_088312:         with r10           ;
CODE_088313:         add   r4           ;
CODE_088314:         move  r5,r6        ;
CODE_088316:         move  r6,r11       ;
CODE_088318:         move  r0,r9        ;
CODE_08831A:         to r7              ;
CODE_08831B:         swap               ;
CODE_08831C:         add   r0           ;
CODE_08831D:         not                ;
CODE_08831E:         inc   r0           ;
CODE_08831F:         lmult              ;
CODE_088321:         with r7            ;
CODE_088322:         add   r4           ;
CODE_088323:         move  r0,r12       ;
CODE_088325:         lsr                ;
CODE_088326:         bcc CODE_08832C    ;
CODE_088328:         add   r0           ;
CODE_088329:         with r1            ;
CODE_08832A:         or    #04          ;
CODE_08832C:         from r1            ;
CODE_08832D:         cmode              ;
CODE_08832F:         move  r6,r0        ;
CODE_088331:         from r13           ;
CODE_088332:         romb               ;
CODE_088334:         iwt   r13,#8342    ;
CODE_088337:         ibt   r4,#0020     ;
CODE_088339:         move  r9,r4        ;
CODE_08833B:         cache              ;
CODE_08833C:         move  r1,r3        ;
CODE_08833E:         move  r8,r10       ;
CODE_088340:         move  r12,r9       ;
CODE_088342:         merge              ;
CODE_088343:         beq CODE_08834F    ;
CODE_088345:         to r14             ;
CODE_088346:         add   r6           ;
CODE_088347:         with r8            ;
CODE_088348:         add   r5           ;
CODE_088349:         getc               ;
CODE_08834A:         loop               ;
CODE_08834B:         plot               ;
CODE_08834C:         bra CODE_088356    ;

CODE_08834E:         with r7            ;
CODE_08834F:         with r8            ;
CODE_088350:         add   r5           ;
CODE_088351:         sub   r0           ;
CODE_088352:         color              ;
CODE_088353:         loop               ;
CODE_088354:         plot               ;
CODE_088355:         with r7            ;
CODE_088356:         add   r11          ;
CODE_088357:         dec   r4           ;
CODE_088358:         bne CODE_08833C    ;
CODE_08835A:         inc   r2           ;
CODE_08835B:         rpix               ;
CODE_08835D:         stop               ;
CODE_08835E:         nop                ;

; drawing routine: polar, 32x32, $0800 offset
CODE_08835F:         ibt   r1,#0001     ;
CODE_088361:         iwt   r0,#2200     ;
CODE_088364:         add   r6           ;
CODE_088365:         add   r6           ;
CODE_088366:         to r6              ;
CODE_088367:         ldw   (r0)         ;
CODE_088368:         with r5            ;
CODE_088369:         add   r5           ;
CODE_08836A:         ibt   r0,#0008     ;
CODE_08836C:         romb               ;
CODE_08836E:         iwt   r0,#AB98     ;
CODE_088371:         to r14             ;
CODE_088372:         add   r5           ;
CODE_088373:         getb               ;
CODE_088374:         inc   r14          ;
CODE_088375:         getbh              ;
CODE_088377:         lmult              ;
CODE_088379:         with r4            ;
CODE_08837A:         hib                ;
CODE_08837B:         lob                ;
CODE_08837C:         swap               ;
CODE_08837D:         or    r4           ;
CODE_08837E:         move  r9,r0        ;
CODE_088380:         not                ;
CODE_088381:         inc   r0           ;
CODE_088382:         add   r0           ;
CODE_088383:         add   r0           ;
CODE_088384:         add   r0           ;
CODE_088385:         to r11             ;
CODE_088386:         add   r0           ;
CODE_088387:         iwt   r0,#AC18     ;
CODE_08838A:         to r14             ;
CODE_08838B:         add   r5           ;
CODE_08838C:         getb               ;
CODE_08838D:         inc   r14          ;
CODE_08838E:         getbh              ;
CODE_088390:         lmult              ;
CODE_088392:         with r4            ;
CODE_088393:         hib                ;
CODE_088394:         lob                ;
CODE_088395:         swap               ;
CODE_088396:         or    r4           ;
CODE_088397:         move  r4,r0        ;
CODE_088399:         not                ;
CODE_08839A:         inc   r0           ;
CODE_08839B:         add   r0           ;
CODE_08839C:         add   r0           ;
CODE_08839D:         add   r0           ;
CODE_08839E:         add   r0           ;
CODE_08839F:         move  r5,r0        ;
CODE_0883A1:         add   r11          ;
CODE_0883A2:         iwt   r6,#0800     ;
CODE_0883A5:         to r10             ;
CODE_0883A6:         add   r6           ;
CODE_0883A7:         from r11           ;
CODE_0883A8:         sub   r5           ;
CODE_0883A9:         to r11             ;
CODE_0883AA:         add   r6           ;
CODE_0883AB:         move  r0,r12       ;
CODE_0883AD:         lsr                ;
CODE_0883AE:         bcc CODE_0883B4    ;
CODE_0883B0:         add   r0           ;
CODE_0883B1:         with r1            ;
CODE_0883B2:         or    #04          ;
CODE_0883B4:         from r1            ;
CODE_0883B5:         cmode              ;
CODE_0883B7:         move  r6,r0        ;
CODE_0883B9:         from r13           ;
CODE_0883BA:         romb               ;
CODE_0883BC:         iwt   r13,#83CA    ;
CODE_0883BF:         ibt   r5,#0020     ;
CODE_0883C1:         cache              ;
CODE_0883C2:         move  r1,r3        ;
CODE_0883C4:         move  r8,r10       ;
CODE_0883C6:         move  r7,r11       ;
CODE_0883C8:         ibt   r12,#0020    ;
CODE_0883CA:         merge              ;
CODE_0883CB:         beq CODE_0883D9    ;
CODE_0883CD:         to r14             ;
CODE_0883CE:         add   r6           ;
CODE_0883CF:         with r8            ;
CODE_0883D0:         add   r9           ;
CODE_0883D1:         with r7            ;
CODE_0883D2:         sub   r4           ;
CODE_0883D3:         getc               ;
CODE_0883D4:         loop               ;
CODE_0883D5:         plot               ;
CODE_0883D6:         bra CODE_0883E2    ;

CODE_0883D8:         with r10           ;
CODE_0883D9:         with r8            ;
CODE_0883DA:         add   r9           ;
CODE_0883DB:         with r7            ;
CODE_0883DC:         sub   r4           ;
CODE_0883DD:         sub   r0           ;
CODE_0883DE:         color              ;
CODE_0883DF:         loop               ;
CODE_0883E0:         plot               ;
CODE_0883E1:         with r10           ;
CODE_0883E2:         add   r4           ;
CODE_0883E3:         with r11           ;
CODE_0883E4:         add   r9           ;
CODE_0883E5:         dec   r5           ;
CODE_0883E6:         bne CODE_0883C2    ;
CODE_0883E8:         inc   r2           ;
CODE_0883E9:         rpix               ;
CODE_0883EB:         stop               ;
CODE_0883EC:         nop                ;

; drawing routine: polar, 16x16, $0800 offset
CODE_0883ED:         ibt   r1,#0001     ;
CODE_0883EF:         iwt   r4,#2200     ;
CODE_0883F2:         from r4            ;
CODE_0883F3:         add   r6           ;
CODE_0883F4:         add   r6           ;
CODE_0883F5:         to r6              ;
CODE_0883F6:         ldw   (r0)         ;
CODE_0883F7:         from r4            ;
CODE_0883F8:         add   r11          ;
CODE_0883F9:         add   r11          ;
CODE_0883FA:         to r11             ;
CODE_0883FB:         ldw   (r0)         ;
CODE_0883FC:         with r5            ;
CODE_0883FD:         add   r5           ;
CODE_0883FE:         ibt   r0,#0008     ;
CODE_088400:         romb               ;
CODE_088402:         iwt   r0,#AB98     ;
CODE_088405:         to r14             ;
CODE_088406:         add   r5           ;
CODE_088407:         getb               ;
CODE_088408:         inc   r14          ;
CODE_088409:         getbh              ;
CODE_08840B:         move  r14,r0       ;
CODE_08840D:         lmult              ;
CODE_08840F:         with r4            ;
CODE_088410:         hib                ;
CODE_088411:         lob                ;
CODE_088412:         swap               ;
CODE_088413:         to r9              ;
CODE_088414:         or    r4           ;
CODE_088415:         move  r7,r6        ;
CODE_088417:         move  r6,r11       ;
CODE_088419:         from r14           ;
CODE_08841A:         lmult              ;
CODE_08841C:         with r4            ;
CODE_08841D:         hib                ;
CODE_08841E:         lob                ;
CODE_08841F:         swap               ;
CODE_088420:         to r8              ;
CODE_088421:         or    r4           ;
CODE_088422:         sms   (0000),r8    ;
CODE_088425:         iwt   r0,#AC18     ;
CODE_088428:         to r14             ;
CODE_088429:         add   r5           ;
CODE_08842A:         getb               ;
CODE_08842B:         inc   r14          ;
CODE_08842C:         getbh              ;
CODE_08842E:         move  r14,r0       ;
CODE_088430:         lmult              ;
CODE_088432:         with r4            ;
CODE_088433:         hib                ;
CODE_088434:         lob                ;
CODE_088435:         swap               ;
CODE_088436:         or    r4           ;
CODE_088437:         not                ;
CODE_088438:         inc   r0           ;
CODE_088439:         move  r5,r0        ;
CODE_08843B:         add   r8           ;
CODE_08843C:         not                ;
CODE_08843D:         inc   r0           ;
CODE_08843E:         add   r0           ;
CODE_08843F:         add   r0           ;
CODE_088440:         add   r0           ;
CODE_088441:         iwt   r10,#0800    ;
CODE_088444:         to r11             ;
CODE_088445:         add   r10          ;
CODE_088446:         move  r6,r7        ;
CODE_088448:         from r14           ;
CODE_088449:         lmult              ;
CODE_08844B:         with r4            ;
CODE_08844C:         hib                ;
CODE_08844D:         lob                ;
CODE_08844E:         swap               ;
CODE_08844F:         or    r4           ;
CODE_088450:         sms   (0002),r0    ;
CODE_088453:         add   r9           ;
CODE_088454:         not                ;
CODE_088455:         inc   r0           ;
CODE_088456:         add   r0           ;
CODE_088457:         add   r0           ;
CODE_088458:         add   r0           ;
CODE_088459:         to r10             ;
CODE_08845A:         add   r10          ;
CODE_08845B:         move  r0,r12       ;
CODE_08845D:         lsr                ;
CODE_08845E:         bcc CODE_088464    ;
CODE_088460:         add   r0           ;
CODE_088461:         with r1            ;
CODE_088462:         or    #04          ;
CODE_088464:         from r1            ;
CODE_088465:         cmode              ;
CODE_088467:         move  r6,r0        ;
CODE_088469:         from r13           ;
CODE_08846A:         romb               ;
CODE_08846C:         iwt   r13,#847A    ;
CODE_08846F:         ibt   r4,#0010     ;
CODE_088471:         cache              ;
CODE_088472:         move  r1,r3        ;
CODE_088474:         move  r8,r10       ;
CODE_088476:         move  r7,r11       ;
CODE_088478:         ibt   r12,#0010    ;
CODE_08847A:         merge              ;
CODE_08847B:         beq CODE_08848B    ;
CODE_08847D:         to r14             ;
CODE_08847E:         add   r6           ;
CODE_08847F:         with r8            ;
CODE_088480:         add   r9           ;
CODE_088481:         with r7            ;
CODE_088482:         add   r5           ;
CODE_088483:         getc               ;
CODE_088484:         loop               ;
CODE_088485:         plot               ;
CODE_088486:         bra CODE_088494    ;

CODE_088488:         lms   r0,(0002)    ;
CODE_08848B:         with r8            ;
CODE_08848C:         add   r9           ;
CODE_08848D:         with r7            ;
CODE_08848E:         add   r5           ;
CODE_08848F:         sub   r0           ;
CODE_088490:         color              ;
CODE_088491:         loop               ;
CODE_088492:         plot               ;
CODE_088493:         lms   r0,(0002)    ;
CODE_088496:         to r10             ;
CODE_088497:         add   r10          ;
CODE_088498:         lms   r0,(0000)    ;
CODE_08849B:         to r11             ;
CODE_08849C:         add   r11          ;
CODE_08849D:         dec   r4           ;
CODE_08849E:         bne CODE_088472    ;
CODE_0884A0:         inc   r2           ;
CODE_0884A1:         rpix               ;
CODE_0884A3:         stop               ;
CODE_0884A4:         nop                ;

; drawing routine: polar, 32x32, polar, $1000 offset
CODE_0884A5:         ibt   r1,#0001     ;
CODE_0884A7:         iwt   r4,#2200     ;
CODE_0884AA:         from r4            ;
CODE_0884AB:         add   r6           ;
CODE_0884AC:         add   r6           ; address = $2200 + r6 * 2
CODE_0884AD:         to r6              ;
CODE_0884AE:         ldw   (r0)         ; r6 = 1 / x scale
CODE_0884AF:         from r4            ;
CODE_0884B0:         add   r11          ;
CODE_0884B1:         add   r11          ;
CODE_0884B2:         to r11             ;
CODE_0884B3:         ldw   (r0)         ; r11 = 1 / y scale
CODE_0884B4:         with r5            ;
CODE_0884B5:         add   r5           ; \
CODE_0884B6:         ibt   r0,#0008     ;  |
CODE_0884B8:         romb               ;  |
CODE_0884BA:         iwt   r0,#AB98     ;  | 16-bit cosine
CODE_0884BD:         to r14             ;
CODE_0884BE:         add   r5           ;  | r5 * 2 is angle
CODE_0884BF:         getb               ;  |
CODE_0884C0:         inc   r14          ;  |
CODE_0884C1:         getbh              ; /
CODE_0884C3:         move  r14,r0       ; r14 = cos(angle)
CODE_0884C5:         lmult              ; \
CODE_0884C7:         with r4            ;
CODE_0884C8:         hib                ;  |
CODE_0884C9:         lob                ;  | r9 = cos(angle) / x scale
CODE_0884CA:         swap               ;  | row x step value
CODE_0884CB:         to r9              ;
CODE_0884CC:         or    r4           ; /
CODE_0884CD:         move  r7,r6        ; r7 = 1 / x scale
CODE_0884CF:         move  r6,r11       ; \
CODE_0884D1:         from r14           ;
CODE_0884D2:         lmult              ;  | r8 =
CODE_0884D4:         with r4            ;
CODE_0884D5:         hib                ;  | cos(angle) / y scale
CODE_0884D6:         lob                ;  |
CODE_0884D7:         swap               ;  |
CODE_0884D8:         to r8              ;
CODE_0884D9:         or    r4           ; /
CODE_0884DA:         sms   (0000),r8    ; column y step value
CODE_0884DD:         iwt   r0,#AC18     ; \
CODE_0884E0:         to r14             ;
CODE_0884E1:         add   r5           ;  |
CODE_0884E2:         getb               ;  |
CODE_0884E3:         inc   r14          ;  | 16-bit sine
CODE_0884E4:         getbh              ;  |
CODE_0884E6:         move  r14,r0       ;  | r14 = sin(angle)
CODE_0884E8:         lmult              ;  |
CODE_0884EA:         with r4            ;
CODE_0884EB:         hib                ;  |
CODE_0884EC:         lob                ;  | r0 = -sin(angle) / y scale
CODE_0884ED:         swap               ;  |
CODE_0884EE:         or    r4           ;  |
CODE_0884EF:         not                ;  |
CODE_0884F0:         inc   r0           ; /
CODE_0884F1:         move  r5,r0        ; r5 = row y step value
CODE_0884F3:         add   r8           ;
CODE_0884F4:         not                ;
CODE_0884F5:         inc   r0           ; sin(a) / y - cos(a) / y
CODE_0884F6:         add   r0           ;
CODE_0884F7:         add   r0           ; << 4
CODE_0884F8:         add   r0           ;
CODE_0884F9:         add   r0           ;
CODE_0884FA:         iwt   r10,#1000    ; r11 = $1000 + y result ^
CODE_0884FD:         to r11             ;
CODE_0884FE:         add   r10          ;
CODE_0884FF:         move  r6,r7        ; r6 = 1 / x scale
CODE_088501:         from r14           ;
CODE_088502:         lmult              ; \
CODE_088504:         with r4            ;
CODE_088505:         hib                ;  |
CODE_088506:         lob                ;  | r0 = sin(angle) / x scale
CODE_088507:         swap               ;  |
CODE_088508:         or    r4           ; /
CODE_088509:         sms   (0002),r0    ; column x step value
CODE_08850C:         add   r9           ;
CODE_08850D:         not                ;
CODE_08850E:         inc   r0           ; -cos(a) / x - sin(a) / x
CODE_08850F:         add   r0           ;
CODE_088510:         add   r0           ; << 4
CODE_088511:         add   r0           ;
CODE_088512:         add   r0           ;
CODE_088513:         to r10             ;
CODE_088514:         add   r10          ; r10 = $1000 + x result ^
CODE_088515:         move  r0,r12       ;
CODE_088517:         lsr                ; >> 1 to test bit 0
CODE_088518:         bcc CODE_08851E    ;
CODE_08851A:         add   r0           ; << 1 : clear bit 0 and put back
CODE_08851B:         with r1            ;
CODE_08851C:         or    #04          ; bit 0 is flag for high nibble of color data
CODE_08851E:         from r1            ;
CODE_08851F:         cmode              ;
CODE_088521:         move  r6,r0        ; r6 = address for pixel data
CODE_088523:         from r13           ;
CODE_088524:         romb               ; rom bank passed in as r13
CODE_088526:         iwt   r13,#8534    ;
CODE_088529:         ibt   r4,#0020     ;
CODE_08852B:         cache              ;
CODE_08852C:         move  r1,r3        ; nested loop starts here, goes $20 times
CODE_08852E:         move  r8,r10       ; \ these start off at the computed values above
CODE_088530:         move  r7,r11       ; / and then get stepped through
CODE_088532:         ibt   r12,#0020    ; \ inner loop: $20 times, so $400 total
CODE_088534:         merge              ; / starting here - implies 32x32
CODE_088535:         bcs CODE_088545    ; \ r0 = hib of y result followed by hib of x result
CODE_088537:         to r14             ;
CODE_088538:         add   r6           ; / offset this into rom character table
CODE_088539:         with r8            ;
CODE_08853A:         add   r9           ; \ go to next polar step along the row/line
CODE_08853B:         with r7            ;
CODE_08853C:         add   r5           ; / for both x and y
CODE_08853D:         getc               ;
CODE_08853E:         loop               ;
CODE_08853F:         plot               ;
CODE_088540:         bra CODE_08854E    ;

CODE_088542:         lms   r0,(0002)    ; dead code?
; other branch of the loop

CODE_088545:         with r8            ;
CODE_088546:         add   r9           ;
CODE_088547:         with r7            ;
CODE_088548:         add   r5           ;
CODE_088549:         sub   r0           ;
CODE_08854A:         color              ;
CODE_08854B:         loop               ;
CODE_08854C:         plot               ;
CODE_08854D:         lms   r0,(0002)    ; \
CODE_088550:         to r10             ;
CODE_088551:         add   r10          ;  | outer loop steps
CODE_088552:         lms   r0,(0000)    ;  | "next row" step values for x & y
CODE_088555:         to r11             ;
CODE_088556:         add   r11          ; /
CODE_088557:         dec   r4           ; \ loop counter
CODE_088558:         bne CODE_08852C    ; / end entire loop on 0
CODE_08855A:         inc   r2           ;
CODE_08855B:         rpix               ;
CODE_08855D:         stop               ;
CODE_08855E:         nop                ;

; gsu routine: 32x32, polar, $0800 offset
CODE_08855F:         ibt   r1,#0001     ;
CODE_088561:         iwt   r4,#2200     ;
CODE_088564:         from r4            ;
CODE_088565:         add   r6           ;
CODE_088566:         add   r6           ;
CODE_088567:         to r6              ;
CODE_088568:         ldw   (r0)         ;
CODE_088569:         from r4            ;
CODE_08856A:         add   r11          ;
CODE_08856B:         add   r11          ;
CODE_08856C:         to r11             ;
CODE_08856D:         ldw   (r0)         ;
CODE_08856E:         with r5            ;
CODE_08856F:         add   r5           ; \
CODE_088570:         ibt   r0,#0008     ;  |
CODE_088572:         romb               ;  |
CODE_088574:         iwt   r0,#AB98     ;  | 16-bit cosine
CODE_088577:         to r14             ;
CODE_088578:         add   r5           ;  | r5 * 2 is angle
CODE_088579:         getb               ;  |
CODE_08857A:         inc   r14          ;  |
CODE_08857B:         getbh              ; /
CODE_08857D:         move  r14,r0       ;
CODE_08857F:         lmult              ;
CODE_088581:         with r4            ;
CODE_088582:         hib                ;
CODE_088583:         lob                ;
CODE_088584:         swap               ;
CODE_088585:         to r9              ;
CODE_088586:         or    r4           ;
CODE_088587:         move  r7,r6        ;
CODE_088589:         move  r6,r11       ;
CODE_08858B:         from r14           ;
CODE_08858C:         lmult              ;
CODE_08858E:         with r4            ;
CODE_08858F:         hib                ;
CODE_088590:         lob                ;
CODE_088591:         swap               ;
CODE_088592:         to r8              ;
CODE_088593:         or    r4           ;
CODE_088594:         sms   (0000),r8    ;
CODE_088597:         iwt   r0,#AC18     ;
CODE_08859A:         to r14             ;
CODE_08859B:         add   r5           ;
CODE_08859C:         getb               ;
CODE_08859D:         inc   r14          ;
CODE_08859E:         getbh              ;
CODE_0885A0:         move  r14,r0       ;
CODE_0885A2:         lmult              ;
CODE_0885A4:         with r4            ;
CODE_0885A5:         hib                ;
CODE_0885A6:         lob                ;
CODE_0885A7:         swap               ;
CODE_0885A8:         or    r4           ;
CODE_0885A9:         not                ;
CODE_0885AA:         inc   r0           ;
CODE_0885AB:         move  r5,r0        ;
CODE_0885AD:         add   r8           ;
CODE_0885AE:         not                ;
CODE_0885AF:         inc   r0           ;
CODE_0885B0:         add   r0           ;
CODE_0885B1:         add   r0           ;
CODE_0885B2:         add   r0           ;
CODE_0885B3:         add   r0           ;
CODE_0885B4:         iwt   r10,#0800    ;
CODE_0885B7:         to r11             ;
CODE_0885B8:         add   r10          ;
CODE_0885B9:         move  r6,r7        ;
CODE_0885BB:         from r14           ;
CODE_0885BC:         lmult              ;
CODE_0885BE:         with r4            ;
CODE_0885BF:         hib                ;
CODE_0885C0:         lob                ;
CODE_0885C1:         swap               ;
CODE_0885C2:         or    r4           ;
CODE_0885C3:         sms   (0002),r0    ;
CODE_0885C6:         add   r9           ;
CODE_0885C7:         not                ;
CODE_0885C8:         inc   r0           ;
CODE_0885C9:         add   r0           ;
CODE_0885CA:         add   r0           ;
CODE_0885CB:         add   r0           ;
CODE_0885CC:         add   r0           ;
CODE_0885CD:         to r10             ;
CODE_0885CE:         add   r10          ;
CODE_0885CF:         move  r0,r12       ;
CODE_0885D1:         lsr                ;
CODE_0885D2:         bcc CODE_0885D8    ;
CODE_0885D4:         add   r0           ;
CODE_0885D5:         with r1            ;
CODE_0885D6:         or    #04          ;
CODE_0885D8:         from r1            ;
CODE_0885D9:         cmode              ;
CODE_0885DB:         move  r6,r0        ;
CODE_0885DD:         from r13           ;
CODE_0885DE:         romb               ;
CODE_0885E0:         iwt   r13,#85EE    ;
CODE_0885E3:         ibt   r4,#0020     ;
CODE_0885E5:         cache              ;
CODE_0885E6:         move  r1,r3        ;
CODE_0885E8:         move  r8,r10       ;
CODE_0885EA:         move  r7,r11       ;
CODE_0885EC:         ibt   r12,#0020    ;
CODE_0885EE:         merge              ;
CODE_0885EF:         beq CODE_0885FF    ;
CODE_0885F1:         to r14             ;
CODE_0885F2:         add   r6           ;
CODE_0885F3:         with r8            ;
CODE_0885F4:         add   r9           ;
CODE_0885F5:         with r7            ;
CODE_0885F6:         add   r5           ;
CODE_0885F7:         getc               ;
CODE_0885F8:         loop               ;
CODE_0885F9:         plot               ;
CODE_0885FA:         bra CODE_088608    ;

CODE_0885FC:         lms   r0,(0002)    ;
CODE_0885FF:         with r8            ;
CODE_088600:         add   r9           ;
CODE_088601:         with r7            ;
CODE_088602:         add   r5           ;
CODE_088603:         sub   r0           ;
CODE_088604:         color              ;
CODE_088605:         loop               ;
CODE_088606:         plot               ;
CODE_088607:         lms   r0,(0002)    ;
CODE_08860A:         to r10             ;
CODE_08860B:         add   r10          ;
CODE_08860C:         lms   r0,(0000)    ;
CODE_08860F:         to r11             ;
CODE_088610:         add   r11          ;
CODE_088611:         dec   r4           ;
CODE_088612:         bne CODE_0885E6    ;
CODE_088614:         inc   r2           ;
CODE_088615:         rpix               ;
CODE_088617:         stop               ;
CODE_088618:         nop                ;

; drawing routine: 16x16 Cartesian
CODE_088619:         move  r11,r6       ;
CODE_08861B:         ibt   r1,#0001     ;
CODE_08861D:         iwt   r4,#2200     ;
CODE_088620:         from r4            ;
CODE_088621:         add   r6           ;
CODE_088622:         add   r6           ;
CODE_088623:         to r6              ;
CODE_088624:         ldw   (r0)         ;
CODE_088625:         from r4            ;
CODE_088626:         add   r11          ;
CODE_088627:         add   r11          ;
CODE_088628:         to r11             ;
CODE_088629:         ldw   (r0)         ;
CODE_08862A:         move  r0,r8        ;
CODE_08862C:         to r10             ;
CODE_08862D:         swap               ;
CODE_08862E:         not                ;
CODE_08862F:         inc   r0           ;
CODE_088630:         lmult              ;
CODE_088632:         with r10           ;
CODE_088633:         add   r4           ;
CODE_088634:         move  r5,r6        ;
CODE_088636:         move  r6,r11       ;
CODE_088638:         move  r0,r9        ;
CODE_08863A:         to r7              ;
CODE_08863B:         swap               ;
CODE_08863C:         not                ;
CODE_08863D:         inc   r0           ;
CODE_08863E:         lmult              ;
CODE_088640:         with r7            ;
CODE_088641:         add   r4           ;
CODE_088642:         move  r0,r12       ;
CODE_088644:         lsr                ;
CODE_088645:         bcc CODE_08864B    ;
CODE_088647:         add   r0           ;
CODE_088648:         with r1            ;
CODE_088649:         or    #04          ;
CODE_08864B:         from r1            ;
CODE_08864C:         cmode              ;
CODE_08864E:         move  r6,r0        ;
CODE_088650:         from r13           ;
CODE_088651:         romb               ;
CODE_088653:         iwt   r13,#8661    ;
CODE_088656:         ibt   r4,#0010     ;
CODE_088658:         move  r9,r4        ;
CODE_08865A:         cache              ;
CODE_08865B:         move  r1,r3        ;
CODE_08865D:         move  r8,r10       ;
CODE_08865F:         move  r12,r9       ;
CODE_088661:         merge              ;
CODE_088662:         beq CODE_08866E    ;
CODE_088664:         to r14             ;
CODE_088665:         add   r6           ;
CODE_088666:         with r8            ;
CODE_088667:         add   r5           ;
CODE_088668:         getc               ;
CODE_088669:         loop               ;
CODE_08866A:         plot               ;
CODE_08866B:         bra CODE_088675    ;

CODE_08866D:         with r7            ;
CODE_08866E:         with r8            ;
CODE_08866F:         add   r5           ;
CODE_088670:         sub   r0           ;
CODE_088671:         color              ;
CODE_088672:         loop               ;
CODE_088673:         plot               ;
CODE_088674:         with r7            ;
CODE_088675:         add   r11          ;
CODE_088676:         dec   r4           ;
CODE_088677:         bne CODE_08865B    ;
CODE_088679:         inc   r2           ;
CODE_08867A:         rpix               ;
CODE_08867C:         stop               ;
CODE_08867D:         nop                ;

; drawing routine: 16x16, polar, $0800 offset
CODE_08867E:         ibt   r1,#0001     ;
CODE_088680:         iwt   r0,#2200     ;
CODE_088683:         add   r6           ;
CODE_088684:         add   r6           ;
CODE_088685:         to r6              ;
CODE_088686:         ldw   (r0)         ;
CODE_088687:         with r5            ;
CODE_088688:         add   r5           ;
CODE_088689:         ibt   r0,#0008     ;
CODE_08868B:         romb               ;
CODE_08868D:         iwt   r0,#AB98     ;
CODE_088690:         to r14             ;
CODE_088691:         add   r5           ;
CODE_088692:         getb               ;
CODE_088693:         inc   r14          ;
CODE_088694:         getbh              ;
CODE_088696:         lmult              ;
CODE_088698:         with r4            ;
CODE_088699:         hib                ;
CODE_08869A:         lob                ;
CODE_08869B:         swap               ;
CODE_08869C:         or    r4           ;
CODE_08869D:         move  r9,r0        ;
CODE_08869F:         not                ;
CODE_0886A0:         inc   r0           ;
CODE_0886A1:         add   r0           ;
CODE_0886A2:         add   r0           ;
CODE_0886A3:         to r11             ;
CODE_0886A4:         add   r0           ;
CODE_0886A5:         iwt   r0,#AC18     ;
CODE_0886A8:         to r14             ;
CODE_0886A9:         add   r5           ;
CODE_0886AA:         getb               ;
CODE_0886AB:         inc   r14          ;
CODE_0886AC:         getbh              ;
CODE_0886AE:         lmult              ;
CODE_0886B0:         with r4            ;
CODE_0886B1:         hib                ;
CODE_0886B2:         lob                ;
CODE_0886B3:         swap               ;
CODE_0886B4:         or    r4           ;
CODE_0886B5:         move  r4,r0        ;
CODE_0886B7:         not                ;
CODE_0886B8:         inc   r0           ;
CODE_0886B9:         add   r0           ;
CODE_0886BA:         add   r0           ;
CODE_0886BB:         add   r0           ;
CODE_0886BC:         move  r5,r0        ;
CODE_0886BE:         add   r11          ;
CODE_0886BF:         iwt   r6,#0800     ;
CODE_0886C2:         to r10             ;
CODE_0886C3:         add   r6           ;
CODE_0886C4:         from r11           ;
CODE_0886C5:         sub   r5           ;
CODE_0886C6:         to r11             ;
CODE_0886C7:         add   r6           ;
CODE_0886C8:         move  r0,r12       ;
CODE_0886CA:         lsr                ;
CODE_0886CB:         bcc CODE_0886D1    ;
CODE_0886CD:         add   r0           ;
CODE_0886CE:         with r1            ;
CODE_0886CF:         or    #04          ;
CODE_0886D1:         from r1            ;
CODE_0886D2:         cmode              ;
CODE_0886D4:         move  r6,r0        ;
CODE_0886D6:         from r13           ;
CODE_0886D7:         romb               ;
CODE_0886D9:         iwt   r13,#86E7    ;
CODE_0886DC:         ibt   r5,#0010     ;
CODE_0886DE:         cache              ;
CODE_0886DF:         move  r1,r3        ;
CODE_0886E1:         move  r8,r10       ;
CODE_0886E3:         move  r7,r11       ;
CODE_0886E5:         ibt   r12,#0010    ;
CODE_0886E7:         merge              ;
CODE_0886E8:         beq CODE_0886F6    ;
CODE_0886EA:         to r14             ;
CODE_0886EB:         add   r6           ;
CODE_0886EC:         with r8            ;
CODE_0886ED:         add   r9           ;
CODE_0886EE:         with r7            ;
CODE_0886EF:         sub   r4           ;
CODE_0886F0:         getc               ;
CODE_0886F1:         loop               ;
CODE_0886F2:         plot               ;
CODE_0886F3:         bra CODE_0886FF    ;

CODE_0886F5:         with r10           ;
CODE_0886F6:         with r8            ;
CODE_0886F7:         add   r9           ;
CODE_0886F8:         with r7            ;
CODE_0886F9:         sub   r4           ;
CODE_0886FA:         sub   r0           ;
CODE_0886FB:         color              ;
CODE_0886FC:         loop               ;
CODE_0886FD:         plot               ;
CODE_0886FE:         with r10           ;
CODE_0886FF:         add   r4           ;
CODE_088700:         with r11           ;
CODE_088701:         add   r9           ;
CODE_088702:         dec   r5           ;
CODE_088703:         bne CODE_0886DF    ;
CODE_088705:         inc   r2           ;
CODE_088706:         rpix               ;
CODE_088708:         stop               ;
CODE_088709:         nop                ;

; drawing routine: 32x32 Cartesian
CODE_08870A:         move  r11,r6       ;
CODE_08870C:         ibt   r1,#0001     ;
CODE_08870E:         iwt   r4,#2200     ;
CODE_088711:         from r4            ;
CODE_088712:         add   r6           ;
CODE_088713:         add   r6           ;
CODE_088714:         to r6              ;
CODE_088715:         ldw   (r0)         ;
CODE_088716:         from r4            ;
CODE_088717:         add   r11          ;
CODE_088718:         add   r11          ;
CODE_088719:         to r11             ;
CODE_08871A:         ldw   (r0)         ;
CODE_08871B:         move  r0,r8        ;
CODE_08871D:         to r10             ;
CODE_08871E:         swap               ;
CODE_08871F:         add   r0           ;
CODE_088720:         not                ;
CODE_088721:         inc   r0           ;
CODE_088722:         lmult              ;
CODE_088724:         with r10           ;
CODE_088725:         add   r4           ;
CODE_088726:         move  r5,r6        ;
CODE_088728:         move  r6,r11       ;
CODE_08872A:         move  r0,r9        ;
CODE_08872C:         to r7              ;
CODE_08872D:         swap               ;
CODE_08872E:         add   r0           ;
CODE_08872F:         not                ;
CODE_088730:         inc   r0           ;
CODE_088731:         lmult              ;
CODE_088733:         with r7            ;
CODE_088734:         add   r4           ;
CODE_088735:         move  r0,r12       ;
CODE_088737:         lsr                ;
CODE_088738:         bcc CODE_08873E    ;
CODE_08873A:         add   r0           ;
CODE_08873B:         with r1            ;
CODE_08873C:         or    #04          ;
CODE_08873E:         from r1            ;
CODE_08873F:         cmode              ;
CODE_088741:         move  r6,r0        ;
CODE_088743:         from r13           ;
CODE_088744:         romb               ;
CODE_088746:         iwt   r13,#8754    ;
CODE_088749:         ibt   r9,#0020     ;
CODE_08874B:         cache              ;
CODE_08874C:         ibt   r4,#0020     ;
CODE_08874E:         move  r1,r3        ;
CODE_088750:         move  r8,r10       ;
CODE_088752:         move  r12,r9       ;
CODE_088754:         merge              ;
CODE_088755:         bcs CODE_088761    ;
CODE_088757:         to r14             ;
CODE_088758:         add   r6           ;
CODE_088759:         with r8            ;
CODE_08875A:         add   r5           ;
CODE_08875B:         getc               ;
CODE_08875C:         loop               ;
CODE_08875D:         plot               ;
CODE_08875E:         bra CODE_088768    ;

CODE_088760:         with r7            ;
CODE_088761:         with r8            ;
CODE_088762:         add   r5           ;
CODE_088763:         sub   r0           ;
CODE_088764:         color              ;
CODE_088765:         loop               ;
CODE_088766:         plot               ;
CODE_088767:         with r7            ;
CODE_088768:         add   r11          ;
CODE_088769:         dec   r4           ;
CODE_08876A:         bne CODE_08874E    ;
CODE_08876C:         inc   r2           ;
CODE_08876D:         from r9            ;
CODE_08876E:         to r4              ;
CODE_08876F:         lsr                ;
CODE_088770:         with r2            ;
CODE_088771:         sub   r4           ;
CODE_088772:         with r3            ;
CODE_088773:         add   r9           ;
CODE_088774:         from r3            ;
CODE_088775:         swap               ;
CODE_088776:         bpl CODE_08874F    ;
CODE_088778:         move  r1,r3        ;
CODE_08877A:         rpix               ;
CODE_08877C:         stop               ;
CODE_08877D:         nop                ;

; drawing routine: 32x64, polar, $1000 offset
CODE_08877E:         ibt   r1,#0001     ;
CODE_088780:         iwt   r0,#2200     ;
CODE_088783:         add   r6           ;
CODE_088784:         add   r6           ;
CODE_088785:         to r6              ;
CODE_088786:         ldw   (r0)         ;
CODE_088787:         with r5            ;
CODE_088788:         add   r5           ;
CODE_088789:         ibt   r0,#0008     ;
CODE_08878B:         romb               ;
CODE_08878D:         iwt   r0,#AB98     ;
CODE_088790:         to r14             ;
CODE_088791:         add   r5           ;
CODE_088792:         getb               ;
CODE_088793:         inc   r14          ;
CODE_088794:         getbh              ;
CODE_088796:         lmult              ;
CODE_088798:         with r4            ;
CODE_088799:         hib                ;
CODE_08879A:         lob                ;
CODE_08879B:         swap               ;
CODE_08879C:         or    r4           ;
CODE_08879D:         move  r9,r0        ;
CODE_08879F:         not                ;
CODE_0887A0:         inc   r0           ;
CODE_0887A1:         add   r0           ;
CODE_0887A2:         add   r0           ;
CODE_0887A3:         add   r0           ;
CODE_0887A4:         add   r0           ;
CODE_0887A5:         to r11             ;
CODE_0887A6:         add   r0           ;
CODE_0887A7:         iwt   r0,#AC18     ;
CODE_0887AA:         to r14             ;
CODE_0887AB:         add   r5           ;
CODE_0887AC:         getb               ;
CODE_0887AD:         inc   r14          ;
CODE_0887AE:         getbh              ;
CODE_0887B0:         lmult              ;
CODE_0887B2:         with r4            ;
CODE_0887B3:         hib                ;
CODE_0887B4:         lob                ;
CODE_0887B5:         swap               ;
CODE_0887B6:         or    r4           ;
CODE_0887B7:         move  r4,r0        ;
CODE_0887B9:         not                ;
CODE_0887BA:         inc   r0           ;
CODE_0887BB:         add   r0           ;
CODE_0887BC:         add   r0           ;
CODE_0887BD:         add   r0           ;
CODE_0887BE:         add   r0           ;
CODE_0887BF:         add   r0           ;
CODE_0887C0:         move  r5,r0        ;
CODE_0887C2:         add   r11          ;
CODE_0887C3:         iwt   r6,#1000     ;
CODE_0887C6:         to r10             ;
CODE_0887C7:         add   r6           ;
CODE_0887C8:         from r11           ;
CODE_0887C9:         sub   r5           ;
CODE_0887CA:         to r11             ;
CODE_0887CB:         add   r6           ;
CODE_0887CC:         move  r0,r12       ;
CODE_0887CE:         lsr                ;
CODE_0887CF:         bcc CODE_0887D5    ;
CODE_0887D1:         add   r0           ;
CODE_0887D2:         with r1            ;
CODE_0887D3:         or    #04          ;
CODE_0887D5:         from r1            ;
CODE_0887D6:         cmode              ;
CODE_0887D8:         move  r6,r0        ;
CODE_0887DA:         from r13           ;
CODE_0887DB:         romb               ;
CODE_0887DD:         iwt   r13,#87EB    ;
CODE_0887E0:         cache              ;
CODE_0887E1:         ibt   r5,#0020     ;
CODE_0887E3:         move  r1,r3        ;
CODE_0887E5:         move  r8,r10       ;
CODE_0887E7:         move  r7,r11       ;
CODE_0887E9:         ibt   r12,#0040    ;
CODE_0887EB:         merge              ;
CODE_0887EC:         bcs CODE_0887FA    ;
CODE_0887EE:         to r14             ;
CODE_0887EF:         add   r6           ;
CODE_0887F0:         with r8            ;
CODE_0887F1:         add   r9           ;
CODE_0887F2:         with r7            ;
CODE_0887F3:         sub   r4           ;
CODE_0887F4:         getc               ;
CODE_0887F5:         loop               ;
CODE_0887F6:         plot               ;
CODE_0887F7:         bra CODE_088803    ;

CODE_0887F9:         with r10           ;
CODE_0887FA:         with r8            ;
CODE_0887FB:         add   r9           ;
CODE_0887FC:         with r7            ;
CODE_0887FD:         sub   r4           ;
CODE_0887FE:         sub   r0           ;
CODE_0887FF:         color              ;
CODE_088800:         loop               ;
CODE_088801:         plot               ;
CODE_088802:         with r10           ;
CODE_088803:         add   r4           ;
CODE_088804:         with r11           ;
CODE_088805:         add   r9           ;
CODE_088806:         dec   r5           ;
CODE_088807:         bne CODE_0887E3    ;
CODE_088809:         inc   r2           ;
CODE_08880A:         ibt   r5,#0020     ;
CODE_08880C:         with r2            ;
CODE_08880D:         sub   r5           ;
CODE_08880E:         from r5            ;
CODE_08880F:         add   r5           ;
CODE_088810:         add   r3           ;
CODE_088811:         move  r3,r0        ;
CODE_088813:         swap               ;
CODE_088814:         bpl CODE_0887E4    ;
CODE_088816:         move  r1,r3        ;
CODE_088818:         rpix               ;
CODE_08881A:         stop               ;
CODE_08881B:         nop                ;

; drawing routine: 32x64, polar, $2000 offset
CODE_08881C:         ibt   r1,#0001     ;
CODE_08881E:         iwt   r0,#2200     ;
CODE_088821:         add   r6           ;
CODE_088822:         add   r6           ;
CODE_088823:         to r6              ;
CODE_088824:         ldw   (r0)         ;
CODE_088825:         with r5            ;
CODE_088826:         add   r5           ;
CODE_088827:         ibt   r0,#0008     ;
CODE_088829:         romb               ;
CODE_08882B:         iwt   r0,#AB98     ;
CODE_08882E:         to r14             ;
CODE_08882F:         add   r5           ;
CODE_088830:         getb               ;
CODE_088831:         inc   r14          ;
CODE_088832:         getbh              ;
CODE_088834:         lmult              ;
CODE_088836:         with r4            ;
CODE_088837:         hib                ;
CODE_088838:         lob                ;
CODE_088839:         swap               ;
CODE_08883A:         or    r4           ;
CODE_08883B:         move  r9,r0        ;
CODE_08883D:         not                ;
CODE_08883E:         inc   r0           ;
CODE_08883F:         add   r0           ;
CODE_088840:         add   r0           ;
CODE_088841:         add   r0           ; << 5
CODE_088842:         add   r0           ;
CODE_088843:         to r11             ;
CODE_088844:         add   r0           ;
CODE_088845:         iwt   r0,#AC18     ;
CODE_088848:         to r14             ;
CODE_088849:         add   r5           ;
CODE_08884A:         getb               ;
CODE_08884B:         inc   r14          ;
CODE_08884C:         getbh              ;
CODE_08884E:         lmult              ;
CODE_088850:         with r4            ;
CODE_088851:         hib                ;
CODE_088852:         lob                ;
CODE_088853:         swap               ;
CODE_088854:         or    r4           ;
CODE_088855:         move  r4,r0        ;
CODE_088857:         not                ;
CODE_088858:         inc   r0           ;
CODE_088859:         add   r0           ;
CODE_08885A:         add   r0           ;
CODE_08885B:         add   r0           ; << 5
CODE_08885C:         add   r0           ;
CODE_08885D:         add   r0           ;
CODE_08885E:         move  r5,r0        ;
CODE_088860:         add   r11          ;
CODE_088861:         iwt   r6,#2000     ;
CODE_088864:         to r10             ;
CODE_088865:         add   r6           ;
CODE_088866:         from r11           ;
CODE_088867:         sub   r5           ;
CODE_088868:         to r11             ;
CODE_088869:         add   r6           ;
CODE_08886A:         move  r0,r12       ;
CODE_08886C:         lsr                ;
CODE_08886D:         bcc CODE_088873    ;
CODE_08886F:         add   r0           ;
CODE_088870:         with r1            ;
CODE_088871:         or    #04          ;
CODE_088873:         from r1            ;
CODE_088874:         cmode              ;
CODE_088876:         move  r6,r0        ;
CODE_088878:         from r13           ;
CODE_088879:         romb               ;
CODE_08887B:         iwt   r13,#8889    ;
CODE_08887E:         cache              ;
CODE_08887F:         ibt   r5,#0020     ;
CODE_088881:         move  r1,r3        ;
CODE_088883:         move  r8,r10       ;
CODE_088885:         move  r7,r11       ;
CODE_088887:         ibt   r12,#0040    ;
CODE_088889:         merge              ;
CODE_08888A:         bvs CODE_088898    ;
CODE_08888C:         to r14             ;
CODE_08888D:         add   r6           ;
CODE_08888E:         with r8            ;
CODE_08888F:         add   r9           ;
CODE_088890:         with r7            ;
CODE_088891:         sub   r4           ;
CODE_088892:         getc               ;
CODE_088893:         loop               ;
CODE_088894:         plot               ;
CODE_088895:         bra CODE_0888A1    ;

CODE_088897:         with r10           ;
CODE_088898:         with r8            ;
CODE_088899:         add   r9           ;
CODE_08889A:         with r7            ;
CODE_08889B:         sub   r4           ;
CODE_08889C:         sub   r0           ;
CODE_08889D:         color              ;
CODE_08889E:         loop               ;
CODE_08889F:         plot               ;
CODE_0888A0:         with r10           ;
CODE_0888A1:         add   r4           ;
CODE_0888A2:         with r11           ;
CODE_0888A3:         add   r9           ;
CODE_0888A4:         dec   r5           ;
CODE_0888A5:         bne CODE_088881    ;
CODE_0888A7:         inc   r2           ;
CODE_0888A8:         rpix               ;
CODE_0888AA:         stop               ;
CODE_0888AB:         nop                ;

; drawing routine: 32x64, polar, $1000 offset
CODE_0888AC:         ibt   r1,#0001     ;
CODE_0888AE:         with r5            ;
CODE_0888AF:         add   r5           ;
CODE_0888B0:         ibt   r0,#0008     ;
CODE_0888B2:         romb               ;
CODE_0888B4:         iwt   r0,#AB98     ;
CODE_0888B7:         to r14             ;
CODE_0888B8:         add   r5           ;
CODE_0888B9:         getb               ;
CODE_0888BA:         inc   r14          ;
CODE_0888BB:         getbh              ;
CODE_0888BD:         lmult              ;
CODE_0888BF:         with r4            ;
CODE_0888C0:         hib                ;
CODE_0888C1:         lob                ;
CODE_0888C2:         swap               ;
CODE_0888C3:         or    r4           ;
CODE_0888C4:         move  r9,r0        ;
CODE_0888C6:         not                ;
CODE_0888C7:         inc   r0           ;
CODE_0888C8:         add   r0           ;
CODE_0888C9:         add   r0           ;
CODE_0888CA:         add   r0           ; << 6
CODE_0888CB:         add   r0           ;
CODE_0888CC:         add   r0           ;
CODE_0888CD:         to r11             ;
CODE_0888CE:         add   r0           ;
CODE_0888CF:         iwt   r0,#AC18     ;
CODE_0888D2:         to r14             ;
CODE_0888D3:         add   r5           ;
CODE_0888D4:         getb               ;
CODE_0888D5:         inc   r14          ;
CODE_0888D6:         getbh              ;
CODE_0888D8:         lmult              ;
CODE_0888DA:         with r4            ;
CODE_0888DB:         hib                ;
CODE_0888DC:         lob                ;
CODE_0888DD:         swap               ;
CODE_0888DE:         or    r4           ;
CODE_0888DF:         move  r4,r0        ;
CODE_0888E1:         not                ;
CODE_0888E2:         inc   r0           ;
CODE_0888E3:         add   r0           ;
CODE_0888E4:         add   r0           ;
CODE_0888E5:         add   r0           ; << 6
CODE_0888E6:         add   r0           ;
CODE_0888E7:         add   r0           ;
CODE_0888E8:         add   r0           ;
CODE_0888E9:         move  r5,r0        ;
CODE_0888EB:         add   r11          ;
CODE_0888EC:         iwt   r6,#1000     ;
CODE_0888EF:         to r10             ;
CODE_0888F0:         add   r6           ;
CODE_0888F1:         from r11           ;
CODE_0888F2:         sub   r5           ;
CODE_0888F3:         to r11             ;
CODE_0888F4:         add   r6           ;
CODE_0888F5:         move  r0,r12       ;
CODE_0888F7:         lsr                ;
CODE_0888F8:         bcc CODE_0888FE    ;
CODE_0888FA:         add   r0           ;
CODE_0888FB:         with r1            ;
CODE_0888FC:         or    #04          ;
CODE_0888FE:         from r1            ;
CODE_0888FF:         cmode              ;
CODE_088901:         move  r6,r0        ;
CODE_088903:         from r13           ;
CODE_088904:         romb               ;
CODE_088906:         iwt   r13,#8914    ;
CODE_088909:         cache              ;
CODE_08890A:         ibt   r5,#0020     ;
CODE_08890C:         move  r1,r3        ;
CODE_08890E:         move  r8,r10       ;
CODE_088910:         move  r7,r11       ;
CODE_088912:         ibt   r12,#0040    ;
CODE_088914:         merge              ;
CODE_088915:         bcs CODE_088923    ;
CODE_088917:         to r14             ;
CODE_088918:         add   r6           ;
CODE_088919:         with r8            ;
CODE_08891A:         add   r9           ;
CODE_08891B:         with r7            ;
CODE_08891C:         sub   r4           ;
CODE_08891D:         getc               ;
CODE_08891E:         loop               ;
CODE_08891F:         plot               ;
CODE_088920:         bra CODE_08892C    ;

CODE_088922:         with r10           ;
CODE_088923:         with r8            ;
CODE_088924:         add   r9           ;
CODE_088925:         with r7            ;
CODE_088926:         sub   r4           ;
CODE_088927:         sub   r0           ;
CODE_088928:         color              ;
CODE_088929:         loop               ;
CODE_08892A:         plot               ;
CODE_08892B:         with r10           ;
CODE_08892C:         add   r4           ;
CODE_08892D:         with r11           ;
CODE_08892E:         add   r9           ;
CODE_08892F:         dec   r5           ;
CODE_088930:         bne CODE_08890C    ;
CODE_088932:         inc   r2           ;
CODE_088933:         ibt   r5,#0020     ;
CODE_088935:         with r2            ;
CODE_088936:         sub   r5           ;
CODE_088937:         from r5            ;
CODE_088938:         add   r5           ;
CODE_088939:         add   r3           ;
CODE_08893A:         move  r3,r0        ;
CODE_08893C:         swap               ;
CODE_08893D:         bpl CODE_08890D    ;
CODE_08893F:         move  r1,r3        ;
CODE_088941:         rpix               ;
CODE_088943:         stop               ;
CODE_088944:         nop                ;

; drawing routine: 32x64, polar, $1000 offset
CODE_088945:         ibt   r1,#0001     ;
CODE_088947:         iwt   r4,#2200     ;
CODE_08894A:         from r4            ;
CODE_08894B:         add   r6           ;
CODE_08894C:         add   r6           ;
CODE_08894D:         to r6              ;
CODE_08894E:         ldw   (r0)         ;
CODE_08894F:         from r4            ;
CODE_088950:         add   r11          ;
CODE_088951:         add   r11          ;
CODE_088952:         to r11             ;
CODE_088953:         ldw   (r0)         ;
CODE_088954:         with r5            ;
CODE_088955:         add   r5           ;
CODE_088956:         ibt   r0,#0008     ;
CODE_088958:         romb               ;
CODE_08895A:         iwt   r0,#AB98     ;
CODE_08895D:         to r14             ;
CODE_08895E:         add   r5           ;
CODE_08895F:         getb               ;
CODE_088960:         inc   r14          ;
CODE_088961:         getbh              ;
CODE_088963:         move  r14,r0       ;
CODE_088965:         lmult              ;
CODE_088967:         with r4            ;
CODE_088968:         hib                ;
CODE_088969:         lob                ;
CODE_08896A:         swap               ;
CODE_08896B:         to r9              ;
CODE_08896C:         or    r4           ;
CODE_08896D:         move  r7,r6        ;
CODE_08896F:         move  r6,r11       ;
CODE_088971:         from r14           ;
CODE_088972:         lmult              ;
CODE_088974:         with r4            ;
CODE_088975:         hib                ;
CODE_088976:         lob                ;
CODE_088977:         swap               ;
CODE_088978:         to r8              ;
CODE_088979:         or    r4           ;
CODE_08897A:         sms   (0000),r8    ;
CODE_08897D:         iwt   r0,#AC18     ;
CODE_088980:         to r14             ;
CODE_088981:         add   r5           ;
CODE_088982:         getb               ;
CODE_088983:         inc   r14          ;
CODE_088984:         getbh              ;
CODE_088986:         move  r14,r0       ;
CODE_088988:         lmult              ;
CODE_08898A:         with r4            ;
CODE_08898B:         hib                ;
CODE_08898C:         lob                ;
CODE_08898D:         swap               ;
CODE_08898E:         or    r4           ;
CODE_08898F:         not                ;
CODE_088990:         inc   r0           ;
CODE_088991:         move  r5,r0        ;
CODE_088993:         add   r8           ;
CODE_088994:         not                ;
CODE_088995:         inc   r0           ;
CODE_088996:         add   r0           ;
CODE_088997:         add   r0           ;
CODE_088998:         add   r0           ; << 5
CODE_088999:         add   r0           ;
CODE_08899A:         add   r0           ;
CODE_08899B:         iwt   r10,#1000    ;
CODE_08899E:         to r11             ;
CODE_08899F:         add   r10          ;
CODE_0889A0:         move  r6,r7        ;
CODE_0889A2:         from r14           ;
CODE_0889A3:         lmult              ;
CODE_0889A5:         with r4            ;
CODE_0889A6:         hib                ;
CODE_0889A7:         lob                ;
CODE_0889A8:         swap               ;
CODE_0889A9:         or    r4           ;
CODE_0889AA:         sms   (0002),r0    ;
CODE_0889AD:         add   r9           ;
CODE_0889AE:         not                ;
CODE_0889AF:         inc   r0           ;
CODE_0889B0:         add   r0           ;
CODE_0889B1:         add   r0           ;
CODE_0889B2:         add   r0           ; << 5
CODE_0889B3:         add   r0           ;
CODE_0889B4:         add   r0           ;
CODE_0889B5:         to r10             ;
CODE_0889B6:         add   r10          ;
CODE_0889B7:         move  r0,r12       ;
CODE_0889B9:         lsr                ;
CODE_0889BA:         bcc CODE_0889C0    ;
CODE_0889BC:         add   r0           ;
CODE_0889BD:         with r1            ;
CODE_0889BE:         or    #04          ;
CODE_0889C0:         from r1            ;
CODE_0889C1:         cmode              ;
CODE_0889C3:         move  r6,r0        ;
CODE_0889C5:         from r13           ;
CODE_0889C6:         romb               ;
CODE_0889C8:         iwt   r13,#89D6    ;
CODE_0889CB:         ibt   r4,#0020     ;
CODE_0889CD:         cache              ;
CODE_0889CE:         move  r1,r3        ;
CODE_0889D0:         move  r8,r10       ;
CODE_0889D2:         move  r7,r11       ;
CODE_0889D4:         ibt   r12,#0040    ;
CODE_0889D6:         merge              ;
CODE_0889D7:         bcs CODE_0889E7    ;
CODE_0889D9:         to r14             ;
CODE_0889DA:         add   r6           ;
CODE_0889DB:         with r8            ;
CODE_0889DC:         add   r9           ;
CODE_0889DD:         with r7            ;
CODE_0889DE:         add   r5           ;
CODE_0889DF:         getc               ;
CODE_0889E0:         loop               ;
CODE_0889E1:         plot               ;
CODE_0889E2:         bra CODE_0889F0    ;

CODE_0889E4:         lms   r0,(0002)    ;
CODE_0889E7:         with r8            ;
CODE_0889E8:         add   r9           ;
CODE_0889E9:         with r7            ;
CODE_0889EA:         add   r5           ;
CODE_0889EB:         sub   r0           ;
CODE_0889EC:         color              ;
CODE_0889ED:         loop               ;
CODE_0889EE:         plot               ;
CODE_0889EF:         lms   r0,(0002)    ;
CODE_0889F2:         to r10             ;
CODE_0889F3:         add   r10          ;
CODE_0889F4:         lms   r0,(0000)    ;
CODE_0889F7:         to r11             ;
CODE_0889F8:         add   r11          ;
CODE_0889F9:         dec   r4           ;
CODE_0889FA:         bne CODE_0889CE    ;
CODE_0889FC:         inc   r2           ;
CODE_0889FD:         ibt   r4,#0020     ;
CODE_0889FF:         with r2            ;
CODE_088A00:         sub   r4           ;
CODE_088A01:         from r4            ;
CODE_088A02:         add   r4           ;
CODE_088A03:         add   r3           ;
CODE_088A04:         move  r3,r0        ;
CODE_088A06:         swap               ;
CODE_088A07:         bpl CODE_0889CF    ;
CODE_088A09:         move  r1,r3        ;
CODE_088A0B:         rpix               ;
CODE_088A0D:         stop               ;
CODE_088A0E:         nop                ;

; drawing routine: 32x32, Cartesian
CODE_088A0F:         move  r11,r6       ;
CODE_088A11:         ibt   r1,#0001     ;
CODE_088A13:         iwt   r4,#2200     ;
CODE_088A16:         from r4            ;
CODE_088A17:         add   r6           ;
CODE_088A18:         add   r6           ;
CODE_088A19:         to r6              ;
CODE_088A1A:         ldw   (r0)         ;
CODE_088A1B:         from r4            ;
CODE_088A1C:         add   r11          ;
CODE_088A1D:         add   r11          ;
CODE_088A1E:         to r11             ;
CODE_088A1F:         ldw   (r0)         ;
CODE_088A20:         move  r0,r8        ;
CODE_088A22:         to r10             ;
CODE_088A23:         swap               ;
CODE_088A24:         add   r0           ;
CODE_088A25:         not                ;
CODE_088A26:         inc   r0           ;
CODE_088A27:         lmult              ;
CODE_088A29:         with r10           ;
CODE_088A2A:         add   r4           ;
CODE_088A2B:         move  r5,r6        ;
CODE_088A2D:         move  r6,r11       ;
CODE_088A2F:         move  r0,r9        ;
CODE_088A31:         to r7              ;
CODE_088A32:         swap               ;
CODE_088A33:         add   r0           ;
CODE_088A34:         not                ;
CODE_088A35:         inc   r0           ;
CODE_088A36:         lmult              ;
CODE_088A38:         with r7            ;
CODE_088A39:         add   r4           ;
CODE_088A3A:         move  r0,r12       ;
CODE_088A3C:         lsr                ;
CODE_088A3D:         bcc CODE_088A43    ;
CODE_088A3F:         add   r0           ;
CODE_088A40:         with r1            ;
CODE_088A41:         or    #04          ;
CODE_088A43:         from r1            ;
CODE_088A44:         cmode              ;
CODE_088A46:         move  r6,r0        ;
CODE_088A48:         from r13           ;
CODE_088A49:         romb               ;
CODE_088A4B:         iwt   r13,#8A59    ;
CODE_088A4E:         ibt   r9,#0002     ;
CODE_088A50:         cache              ;
CODE_088A51:         ibt   r4,#0020     ;
CODE_088A53:         move  r1,r3        ;
CODE_088A55:         move  r8,r10       ;
CODE_088A57:         ibt   r12,#0020    ;
CODE_088A59:         merge              ;
CODE_088A5A:         bcs CODE_088A66    ;
CODE_088A5C:         to r14             ;
CODE_088A5D:         add   r6           ;
CODE_088A5E:         with r8            ;
CODE_088A5F:         add   r5           ;
CODE_088A60:         getc               ;
CODE_088A61:         loop               ;
CODE_088A62:         plot               ;
CODE_088A63:         bra CODE_088A6D    ;

CODE_088A65:         with r7            ;
CODE_088A66:         with r8            ;
CODE_088A67:         add   r5           ;
CODE_088A68:         sub   r0           ;
CODE_088A69:         color              ;
CODE_088A6A:         loop               ;
CODE_088A6B:         plot               ;
CODE_088A6C:         with r7            ;
CODE_088A6D:         add   r11          ;
CODE_088A6E:         dec   r4           ;
CODE_088A6F:         bne CODE_088A53    ;
CODE_088A71:         inc   r2           ;
CODE_088A72:         ibt   r4,#0020     ;
CODE_088A74:         with r2            ;
CODE_088A75:         sub   r4           ;
CODE_088A76:         with r3            ;
CODE_088A77:         add   r4           ;
CODE_088A78:         dec   r9           ;
CODE_088A79:         bne CODE_088A54    ;
CODE_088A7B:         move  r1,r3        ;
CODE_088A7D:         rpix               ;
CODE_088A7F:         stop               ;
CODE_088A80:         nop                ;

; drawing routine: 32x64, polar, $1000 offset
CODE_088A81:         iwt   r4,#2200     ;
CODE_088A84:         from r4            ;
CODE_088A85:         add   r6           ;
CODE_088A86:         add   r6           ;
CODE_088A87:         to r6              ;
CODE_088A88:         ldw   (r0)         ;
CODE_088A89:         from r4            ;
CODE_088A8A:         add   r11          ;
CODE_088A8B:         add   r11          ;
CODE_088A8C:         to r11             ;
CODE_088A8D:         ldw   (r0)         ;
CODE_088A8E:         ibt   r0,#0008     ;
CODE_088A90:         romb               ;
CODE_088A92:         iwt   r0,#AB98     ;
CODE_088A95:         to r14             ;
CODE_088A96:         add   r5           ;
CODE_088A97:         getb               ;
CODE_088A98:         inc   r14          ;
CODE_088A99:         getbh              ;
CODE_088A9B:         move  r14,r0       ;
CODE_088A9D:         lmult              ;
CODE_088A9F:         with r4            ;
CODE_088AA0:         hib                ;
CODE_088AA1:         lob                ;
CODE_088AA2:         swap               ;
CODE_088AA3:         to r9              ;
CODE_088AA4:         or    r4           ;
CODE_088AA5:         sms   (0004),r9    ;
CODE_088AA8:         move  r7,r6        ;
CODE_088AAA:         move  r6,r11       ;
CODE_088AAC:         from r14           ;
CODE_088AAD:         lmult              ;
CODE_088AAF:         with r4            ;
CODE_088AB0:         hib                ;
CODE_088AB1:         lob                ;
CODE_088AB2:         swap               ;
CODE_088AB3:         to r8              ;
CODE_088AB4:         or    r4           ;
CODE_088AB5:         sms   (0000),r8    ;
CODE_088AB8:         iwt   r0,#AC18     ;
CODE_088ABB:         to r14             ;
CODE_088ABC:         add   r5           ;
CODE_088ABD:         getb               ;
CODE_088ABE:         inc   r14          ;
CODE_088ABF:         getbh              ;
CODE_088AC1:         move  r14,r0       ;
CODE_088AC3:         lmult              ;
CODE_088AC5:         with r4            ;
CODE_088AC6:         hib                ;
CODE_088AC7:         lob                ;
CODE_088AC8:         swap               ;
CODE_088AC9:         or    r4           ;
CODE_088ACA:         not                ;
CODE_088ACB:         inc   r0           ;
CODE_088ACC:         move  r5,r0        ;
CODE_088ACE:         sms   (0006),r5    ;
CODE_088AD1:         add   r8           ;
CODE_088AD2:         not                ;
CODE_088AD3:         inc   r0           ;
CODE_088AD4:         add   r0           ;
CODE_088AD5:         add   r0           ; << 6
CODE_088AD6:         add   r0           ;
CODE_088AD7:         add   r0           ;
CODE_088AD8:         add   r0           ;
CODE_088AD9:         iwt   r10,#1000    ;
CODE_088ADC:         to r11             ;
CODE_088ADD:         add   r10          ;
CODE_088ADE:         move  r6,r7        ;
CODE_088AE0:         from r14           ;
CODE_088AE1:         lmult              ;
CODE_088AE3:         with r4            ;
CODE_088AE4:         hib                ;
CODE_088AE5:         lob                ;
CODE_088AE6:         swap               ;
CODE_088AE7:         or    r4           ;
CODE_088AE8:         sms   (0002),r0    ;
CODE_088AEB:         add   r9           ;
CODE_088AEC:         not                ;
CODE_088AED:         inc   r0           ;
CODE_088AEE:         add   r0           ;
CODE_088AEF:         add   r0           ;
CODE_088AF0:         add   r0           ; << 6
CODE_088AF1:         add   r0           ;
CODE_088AF2:         add   r0           ;
CODE_088AF3:         to r10             ;
CODE_088AF4:         add   r10          ;
CODE_088AF5:         lms   r9,(0004)    ;
CODE_088AF8:         lms   r5,(0006)    ;
CODE_088AFB:         ibt   r1,#0001     ;
CODE_088AFD:         move  r0,r12       ;
CODE_088AFF:         lsr                ;
CODE_088B00:         bcc CODE_088B06    ;
CODE_088B02:         add   r0           ;
CODE_088B03:         with r1            ;
CODE_088B04:         or    #04          ;
CODE_088B06:         from r1            ;
CODE_088B07:         cmode              ;
CODE_088B09:         move  r6,r0        ;
CODE_088B0B:         from r13           ;
CODE_088B0C:         romb               ;
CODE_088B0E:         iwt   r13,#8B1C    ;
CODE_088B11:         ibt   r4,#0020     ;
CODE_088B13:         cache              ;
CODE_088B14:         move  r1,r3        ;
CODE_088B16:         move  r8,r10       ;
CODE_088B18:         move  r7,r11       ;
CODE_088B1A:         ibt   r12,#0040    ;
CODE_088B1C:         merge              ;
CODE_088B1D:         bcs CODE_088B2D    ;
CODE_088B1F:         to r14             ;
CODE_088B20:         add   r6           ;
CODE_088B21:         with r8            ;
CODE_088B22:         add   r9           ;
CODE_088B23:         with r7            ;
CODE_088B24:         add   r5           ;
CODE_088B25:         getc               ;
CODE_088B26:         loop               ;
CODE_088B27:         plot               ;
CODE_088B28:         bra CODE_088B36    ;

CODE_088B2A:         lms   r0,(0002)    ;
CODE_088B2D:         with r8            ;
CODE_088B2E:         add   r9           ;
CODE_088B2F:         with r7            ;
CODE_088B30:         add   r5           ;
CODE_088B31:         sub   r0           ;
CODE_088B32:         color              ;
CODE_088B33:         loop               ;
CODE_088B34:         plot               ;
CODE_088B35:         lms   r0,(0002)    ;
CODE_088B38:         to r10             ;
CODE_088B39:         add   r10          ;
CODE_088B3A:         lms   r0,(0000)    ;
CODE_088B3D:         to r11             ;
CODE_088B3E:         add   r11          ;
CODE_088B3F:         dec   r4           ;
CODE_088B40:         bne CODE_088B14    ;
CODE_088B42:         inc   r2           ;
CODE_088B43:         rpix               ;
CODE_088B45:         stop               ;
CODE_088B46:         nop                ;

; drawing routine: 32x64, polar, $2000 offset
CODE_088B47:         move  r11,r6       ;
CODE_088B49:         ibt   r1,#0001     ;
CODE_088B4B:         iwt   r4,#2200     ;
CODE_088B4E:         from r4            ;
CODE_088B4F:         add   r6           ;
CODE_088B50:         add   r6           ;
CODE_088B51:         to r6              ;
CODE_088B52:         ldw   (r0)         ;
CODE_088B53:         from r4            ;
CODE_088B54:         add   r11          ;
CODE_088B55:         add   r11          ;
CODE_088B56:         to r11             ;
CODE_088B57:         ldw   (r0)         ;
CODE_088B58:         with r5            ;
CODE_088B59:         add   r5           ;
CODE_088B5A:         ibt   r0,#0008     ;
CODE_088B5C:         romb               ;
CODE_088B5E:         iwt   r0,#AB98     ;
CODE_088B61:         to r14             ;
CODE_088B62:         add   r5           ;
CODE_088B63:         getb               ;
CODE_088B64:         inc   r14          ;
CODE_088B65:         getbh              ;
CODE_088B67:         move  r14,r0       ;
CODE_088B69:         lmult              ;
CODE_088B6B:         with r4            ;
CODE_088B6C:         hib                ;
CODE_088B6D:         lob                ;
CODE_088B6E:         swap               ;
CODE_088B6F:         to r9              ;
CODE_088B70:         or    r4           ;
CODE_088B71:         move  r7,r6        ;
CODE_088B73:         move  r6,r11       ;
CODE_088B75:         from r14           ;
CODE_088B76:         lmult              ;
CODE_088B78:         with r4            ;
CODE_088B79:         hib                ;
CODE_088B7A:         lob                ;
CODE_088B7B:         swap               ;
CODE_088B7C:         to r8              ;
CODE_088B7D:         or    r4           ;
CODE_088B7E:         sms   (0000),r8    ;
CODE_088B81:         iwt   r0,#AC18     ;
CODE_088B84:         to r14             ;
CODE_088B85:         add   r5           ;
CODE_088B86:         getb               ;
CODE_088B87:         inc   r14          ;
CODE_088B88:         getbh              ;
CODE_088B8A:         move  r14,r0       ;
CODE_088B8C:         lmult              ;
CODE_088B8E:         with r4            ;
CODE_088B8F:         hib                ;
CODE_088B90:         lob                ;
CODE_088B91:         swap               ;
CODE_088B92:         or    r4           ;
CODE_088B93:         not                ;
CODE_088B94:         inc   r0           ;
CODE_088B95:         move  r5,r0        ;
CODE_088B97:         add   r8           ;
CODE_088B98:         not                ;
CODE_088B99:         inc   r0           ;
CODE_088B9A:         add   r0           ;
CODE_088B9B:         add   r0           ;
CODE_088B9C:         add   r0           ;
CODE_088B9D:         add   r0           ;
CODE_088B9E:         add   r0           ;
CODE_088B9F:         iwt   r10,#2000    ;
CODE_088BA2:         to r11             ;
CODE_088BA3:         add   r10          ;
CODE_088BA4:         move  r6,r7        ;
CODE_088BA6:         from r14           ;
CODE_088BA7:         lmult              ;
CODE_088BA9:         with r4            ;
CODE_088BAA:         hib                ;
CODE_088BAB:         lob                ;
CODE_088BAC:         swap               ;
CODE_088BAD:         or    r4           ;
CODE_088BAE:         sms   (0002),r0    ;
CODE_088BB1:         add   r9           ;
CODE_088BB2:         not                ;
CODE_088BB3:         inc   r0           ;
CODE_088BB4:         add   r0           ;
CODE_088BB5:         add   r0           ;
CODE_088BB6:         add   r0           ; << 5
CODE_088BB7:         add   r0           ;
CODE_088BB8:         add   r0           ;
CODE_088BB9:         to r10             ;
CODE_088BBA:         add   r10          ;
CODE_088BBB:         move  r0,r12       ;
CODE_088BBD:         lsr                ;
CODE_088BBE:         bcc CODE_088BC4    ;
CODE_088BC0:         add   r0           ;
CODE_088BC1:         with r1            ;
CODE_088BC2:         or    #04          ;
CODE_088BC4:         from r1            ;
CODE_088BC5:         cmode              ;
CODE_088BC7:         move  r6,r0        ;
CODE_088BC9:         from r13           ;
CODE_088BCA:         romb               ;
CODE_088BCC:         iwt   r13,#8BDA    ;
CODE_088BCF:         ibt   r4,#0020     ;
CODE_088BD1:         cache              ;
CODE_088BD2:         move  r1,r3        ;
CODE_088BD4:         move  r8,r10       ;
CODE_088BD6:         move  r7,r11       ;
CODE_088BD8:         ibt   r12,#0040    ;
CODE_088BDA:         merge              ;
CODE_088BDB:         bvs CODE_088BEB    ;
CODE_088BDD:         to r14             ;
CODE_088BDE:         add   r6           ;
CODE_088BDF:         with r8            ;
CODE_088BE0:         add   r9           ;
CODE_088BE1:         with r7            ;
CODE_088BE2:         add   r5           ;
CODE_088BE3:         getc               ;
CODE_088BE4:         loop               ;
CODE_088BE5:         plot               ;
CODE_088BE6:         bra CODE_088BF4    ;

CODE_088BE8:         lms   r0,(0002)    ;
CODE_088BEB:         with r8            ;
CODE_088BEC:         add   r9           ;
CODE_088BED:         with r7            ;
CODE_088BEE:         add   r5           ;
CODE_088BEF:         sub   r0           ;
CODE_088BF0:         color              ;
CODE_088BF1:         loop               ;
CODE_088BF2:         plot               ;
CODE_088BF3:         lms   r0,(0002)    ;
CODE_088BF6:         to r10             ;
CODE_088BF7:         add   r10          ;
CODE_088BF8:         lms   r0,(0000)    ;
CODE_088BFB:         to r11             ;
CODE_088BFC:         add   r11          ;
CODE_088BFD:         dec   r4           ;
CODE_088BFE:         bne CODE_088BD2    ;
CODE_088C00:         inc   r2           ;
CODE_088C01:         ibt   r4,#0020     ;
CODE_088C03:         with r2            ;
CODE_088C04:         sub   r4           ;
CODE_088C05:         from r4            ;
CODE_088C06:         add   r4           ;
CODE_088C07:         add   r3           ;
CODE_088C08:         move  r3,r0        ;
CODE_088C0A:         swap               ;
CODE_088C0B:         bpl CODE_088BD3    ;
CODE_088C0D:         move  r1,r3        ;
CODE_088C0F:         rpix               ;
CODE_088C11:         stop               ;
CODE_088C12:         nop                ;

; drawing routine: 32x16, Cartesian
CODE_088C13:         move  r11,r6       ;
CODE_088C15:         ibt   r1,#0001     ;
CODE_088C17:         iwt   r4,#2200     ;
CODE_088C1A:         from r4            ;
CODE_088C1B:         add   r6           ;
CODE_088C1C:         add   r6           ;
CODE_088C1D:         to r6              ;
CODE_088C1E:         ldw   (r0)         ;
CODE_088C1F:         from r4            ;
CODE_088C20:         add   r11          ;
CODE_088C21:         add   r11          ;
CODE_088C22:         to r11             ;
CODE_088C23:         ldw   (r0)         ;
CODE_088C24:         move  r0,r8        ;
CODE_088C26:         to r10             ;
CODE_088C27:         swap               ;
CODE_088C28:         not                ;
CODE_088C29:         inc   r0           ;
CODE_088C2A:         lmult              ;
CODE_088C2C:         with r10           ;
CODE_088C2D:         add   r4           ;
CODE_088C2E:         move  r5,r6        ;
CODE_088C30:         move  r6,r11       ;
CODE_088C32:         move  r0,r9        ;
CODE_088C34:         to r7              ;
CODE_088C35:         swap               ;
CODE_088C36:         not                ;
CODE_088C37:         inc   r0           ;
CODE_088C38:         lmult              ;
CODE_088C3A:         with r7            ;
CODE_088C3B:         add   r4           ;
CODE_088C3C:         move  r0,r12       ;
CODE_088C3E:         lsr                ;
CODE_088C3F:         bcc CODE_088C45    ;
CODE_088C41:         add   r0           ;
CODE_088C42:         with r1            ;
CODE_088C43:         or    #04          ;
CODE_088C45:         from r1            ;
CODE_088C46:         cmode              ;
CODE_088C48:         move  r6,r0        ;
CODE_088C4A:         from r13           ;
CODE_088C4B:         romb               ;
CODE_088C4D:         iwt   r13,#8C5B    ;
CODE_088C50:         ibt   r4,#0020     ;
CODE_088C52:         ibt   r9,#0010     ;
CODE_088C54:         cache              ;
CODE_088C55:         move  r1,r3        ;
CODE_088C57:         move  r8,r10       ;
CODE_088C59:         move  r12,r9       ;
CODE_088C5B:         merge              ;
CODE_088C5C:         bcs CODE_088C68    ;
CODE_088C5E:         to r14             ;
CODE_088C5F:         add   r6           ;
CODE_088C60:         with r8            ;
CODE_088C61:         add   r5           ;
CODE_088C62:         getc               ;
CODE_088C63:         loop               ;
CODE_088C64:         plot               ;
CODE_088C65:         bra CODE_088C6F    ;

CODE_088C67:         with r7            ;
CODE_088C68:         with r8            ;
CODE_088C69:         add   r5           ;
CODE_088C6A:         sub   r0           ;
CODE_088C6B:         color              ;
CODE_088C6C:         loop               ;
CODE_088C6D:         plot               ;
CODE_088C6E:         with r7            ;
CODE_088C6F:         add   r11          ;
CODE_088C70:         dec   r4           ;
CODE_088C71:         bne CODE_088C55    ;
CODE_088C73:         inc   r2           ;
CODE_088C74:         rpix               ;
CODE_088C76:         stop               ;
CODE_088C77:         nop                ;

; drawing routine: 32x64, Cartesian
CODE_088C78:         ibt   r1,#0001     ;
CODE_088C7A:         iwt   r4,#2200     ;
CODE_088C7D:         from r4            ;
CODE_088C7E:         add   r6           ;
CODE_088C7F:         add   r6           ;
CODE_088C80:         to r6              ;
CODE_088C81:         ldw   (r0)         ;
CODE_088C82:         from r4            ;
CODE_088C83:         add   r11          ;
CODE_088C84:         add   r11          ;
CODE_088C85:         to r11             ;
CODE_088C86:         ldw   (r0)         ;
CODE_088C87:         move  r0,r8        ;
CODE_088C89:         to r10             ;
CODE_088C8A:         swap               ;
CODE_088C8B:         not                ;
CODE_088C8C:         inc   r0           ;
CODE_088C8D:         lmult              ;
CODE_088C8F:         with r10           ;
CODE_088C90:         add   r4           ;
CODE_088C91:         move  r5,r6        ;
CODE_088C93:         move  r6,r11       ;
CODE_088C95:         move  r0,r9        ;
CODE_088C97:         to r7              ;
CODE_088C98:         swap               ;
CODE_088C99:         not                ;
CODE_088C9A:         inc   r0           ;
CODE_088C9B:         lmult              ;
CODE_088C9D:         with r7            ;
CODE_088C9E:         add   r4           ;
CODE_088C9F:         move  r0,r12       ;
CODE_088CA1:         lsr                ;
CODE_088CA2:         bcc CODE_088CA8    ;
CODE_088CA4:         add   r0           ;
CODE_088CA5:         with r1            ;
CODE_088CA6:         or    #04          ;
CODE_088CA8:         from r1            ;
CODE_088CA9:         cmode              ;
CODE_088CAB:         move  r6,r0        ;
CODE_088CAD:         from r13           ;
CODE_088CAE:         romb               ;
CODE_088CB0:         iwt   r13,#8CBE    ;
CODE_088CB3:         ibt   r4,#0020     ;
CODE_088CB5:         ibt   r9,#0040     ;
CODE_088CB7:         cache              ;
CODE_088CB8:         move  r1,r3        ;
CODE_088CBA:         move  r8,r10       ;
CODE_088CBC:         move  r12,r9       ;
CODE_088CBE:         merge              ;
CODE_088CBF:         bvs CODE_088CCB    ;
CODE_088CC1:         to r14             ;
CODE_088CC2:         add   r6           ;
CODE_088CC3:         with r8            ;
CODE_088CC4:         add   r5           ;
CODE_088CC5:         getc               ;
CODE_088CC6:         loop               ;
CODE_088CC7:         plot               ;
CODE_088CC8:         bra CODE_088CD2    ;

CODE_088CCA:         with r7            ;
CODE_088CCB:         with r8            ;
CODE_088CCC:         add   r5           ;
CODE_088CCD:         sub   r0           ;
CODE_088CCE:         color              ;
CODE_088CCF:         loop               ;
CODE_088CD0:         plot               ;
CODE_088CD1:         with r7            ;
CODE_088CD2:         add   r11          ;
CODE_088CD3:         dec   r4           ;
CODE_088CD4:         bne CODE_088CB8    ;
CODE_088CD6:         inc   r2           ;
CODE_088CD7:         rpix               ;
CODE_088CD9:         stop               ;
CODE_088CDA:         nop                ;

; plotting routine
CODE_088CDB:         iwt   r0,#2000     ;
CODE_088CDE:         to r9              ;
CODE_088CDF:         fmult              ;
CODE_088CE0:         ibt   r0,#0001     ;
CODE_088CE2:         cmode              ;
CODE_088CE4:         move  r6,r12       ;
CODE_088CE6:         from r13           ;
CODE_088CE7:         romb               ;
CODE_088CE9:         ibt   r4,#0010     ;
CODE_088CEB:         iwt   r10,#0100    ;
CODE_088CEE:         cache              ;
CODE_088CEF:         move  r1,r3        ;
CODE_088CF1:         ibt   r0,#0010     ;
CODE_088CF3:         sub   r4           ;
CODE_088CF4:         to r7              ;
CODE_088CF5:         swap               ;
CODE_088CF6:         to r5              ;
CODE_088CF7:         sub   r0           ;
CODE_088CF8:         move  r8,r5        ;
CODE_088CFA:         moves r12,r11      ;
CODE_088CFC:         beq CODE_088D09    ;
CODE_088CFE:         merge              ;
CODE_088CFF:         to r14             ;
CODE_088D00:         add   r6           ;
CODE_088D01:         move  r13,r15      ;
CODE_088D03:         with r8            ;
CODE_088D04:         add   r10          ;
CODE_088D05:         getc               ;
CODE_088D06:         inc   r14          ;
CODE_088D07:         loop               ;
CODE_088D08:         plot               ;
CODE_088D09:         ibt   r12,#0008    ;
CODE_088D0B:         move  r13,r15      ;
CODE_088D0D:         merge              ;
CODE_088D0E:         bvs CODE_088D1F    ;
CODE_088D10:         to r14             ;
CODE_088D11:         add   r6           ;
CODE_088D12:         with r7            ;
CODE_088D13:         add   r5           ;
CODE_088D14:         with r5            ;
CODE_088D15:         sub   r9           ;
CODE_088D16:         with r8            ;
CODE_088D17:         add   r10          ;
CODE_088D18:         getc               ;
CODE_088D19:         loop               ;
CODE_088D1A:         plot               ;
CODE_088D1B:         bra CODE_088D2A    ;

CODE_088D1D:         ibt   r12,#0010    ;
CODE_088D1F:         with r7            ;
CODE_088D20:         add   r5           ;
CODE_088D21:         with r5            ;
CODE_088D22:         sub   r9           ;
CODE_088D23:         with r8            ;
CODE_088D24:         add   r10          ;
CODE_088D25:         sub   r0           ;
CODE_088D26:         color              ;
CODE_088D27:         loop               ;
CODE_088D28:         plot               ;
CODE_088D29:         ibt   r12,#0010    ;
CODE_088D2B:         move  r13,r15      ;
CODE_088D2D:         merge              ;
CODE_088D2E:         bvs CODE_088D3F    ;
CODE_088D30:         to r14             ;
CODE_088D31:         add   r6           ;
CODE_088D32:         with r7            ;
CODE_088D33:         add   r5           ;
CODE_088D34:         with r5            ;
CODE_088D35:         add   r9           ;
CODE_088D36:         with r8            ;
CODE_088D37:         add   r10          ;
CODE_088D38:         getc               ;
CODE_088D39:         loop               ;
CODE_088D3A:         plot               ;
CODE_088D3B:         bra CODE_088D4A    ;

CODE_088D3D:         ibt   r12,#0008    ;
CODE_088D3F:         with r7            ;
CODE_088D40:         add   r5           ;
CODE_088D41:         with r5            ;
CODE_088D42:         add   r9           ;
CODE_088D43:         with r8            ;
CODE_088D44:         add   r10          ;
CODE_088D45:         sub   r0           ;
CODE_088D46:         color              ;
CODE_088D47:         loop               ;
CODE_088D48:         plot               ;
CODE_088D49:         ibt   r12,#0008    ;
CODE_088D4B:         move  r13,r15      ;
CODE_088D4D:         merge              ;
CODE_088D4E:         bvs CODE_088D5F    ;
CODE_088D50:         to r14             ;
CODE_088D51:         add   r6           ;
CODE_088D52:         with r7            ;
CODE_088D53:         add   r5           ;
CODE_088D54:         with r5            ;
CODE_088D55:         sub   r9           ;
CODE_088D56:         with r8            ;
CODE_088D57:         add   r10          ;
CODE_088D58:         getc               ;
CODE_088D59:         loop               ;
CODE_088D5A:         plot               ;
CODE_088D5B:         bra CODE_088D6A    ;

CODE_088D5D:         ibt   r0,#0010     ;
CODE_088D5F:         with r7            ;
CODE_088D60:         add   r5           ;
CODE_088D61:         with r5            ;
CODE_088D62:         sub   r9           ;
CODE_088D63:         with r8            ;
CODE_088D64:         add   r10          ;
CODE_088D65:         sub   r0           ;
CODE_088D66:         color              ;
CODE_088D67:         loop               ;
CODE_088D68:         plot               ;
CODE_088D69:         ibt   r0,#0010     ;
CODE_088D6B:         to r12             ;
CODE_088D6C:         sub   r11          ;
CODE_088D6D:         move  r13,r15      ;
CODE_088D6F:         merge              ;
CODE_088D70:         to r14             ;
CODE_088D71:         add   r6           ;
CODE_088D72:         with r8            ;
CODE_088D73:         add   r10          ;
CODE_088D74:         getc               ;
CODE_088D75:         loop               ;
CODE_088D76:         plot               ;
CODE_088D77:         dec   r4           ;
CODE_088D78:         beq CODE_088D80    ;
CODE_088D7A:         inc   r2           ;
CODE_088D7B:         iwt   r15,#8CF0    ;
CODE_088D7E:         move  r1,r3        ;
CODE_088D80:         rpix               ;
CODE_088D82:         stop               ;
CODE_088D83:         nop                ;

; plotting routine
CODE_088D84:         from r11           ;
CODE_088D85:         swap               ;
CODE_088D86:         sms   (0000),r0    ;
CODE_088D89:         iwt   r0,#2000     ;
CODE_088D8C:         to r9              ;
CODE_088D8D:         fmult              ;
CODE_088D8E:         ibt   r0,#0005     ;
CODE_088D90:         cmode              ;
CODE_088D92:         move  r6,r12       ;
CODE_088D94:         from r13           ;
CODE_088D95:         romb               ;
CODE_088D97:         ibt   r4,#0000     ;
CODE_088D99:         iwt   r10,#0100    ;
CODE_088D9C:         iwt   r11,#1F00    ;
CODE_088D9F:         cache              ;
CODE_088DA0:         lms   r8,(0000)    ;
CODE_088DA3:         move  r7,r4        ;
CODE_088DA5:         ibt   r5,#0000     ;
CODE_088DA7:         ibt   r12,#0008    ;
CODE_088DA9:         move  r13,r15      ;
CODE_088DAB:         merge              ;
CODE_088DAC:         bvs CODE_088DC3    ;
CODE_088DAE:         to r14             ;
CODE_088DAF:         add   r6           ;
CODE_088DB0:         with r7            ;
CODE_088DB1:         add   r5           ;
CODE_088DB2:         with r5            ;
CODE_088DB3:         sub   r9           ;
CODE_088DB4:         from r8            ;
CODE_088DB5:         add   r10          ;
CODE_088DB6:         and   r11          ;
CODE_088DB7:         move  r8,r0        ;
CODE_088DB9:         hib                ;
CODE_088DBA:         to r1              ;
CODE_088DBB:         add   r3           ;
CODE_088DBC:         getc               ;
CODE_088DBD:         loop               ;
CODE_088DBE:         plot               ;
CODE_088DBF:         bra CODE_088DD4    ;

CODE_088DC1:         ibt   r12,#0010    ;
CODE_088DC3:         with r7            ;
CODE_088DC4:         add   r5           ;
CODE_088DC5:         with r5            ;
CODE_088DC6:         sub   r9           ;
CODE_088DC7:         from r8            ;
CODE_088DC8:         add   r10          ;
CODE_088DC9:         and   r11          ;
CODE_088DCA:         move  r8,r0        ;
CODE_088DCC:         hib                ;
CODE_088DCD:         to r1              ;
CODE_088DCE:         add   r3           ;
CODE_088DCF:         sub   r0           ;
CODE_088DD0:         color              ;
CODE_088DD1:         loop               ;
CODE_088DD2:         plot               ;
CODE_088DD3:         ibt   r12,#0010    ;
CODE_088DD5:         move  r13,r15      ;
CODE_088DD7:         merge              ;
CODE_088DD8:         bvs CODE_088DEF    ;
CODE_088DDA:         to r14             ;
CODE_088DDB:         add   r6           ;
CODE_088DDC:         with r7            ;
CODE_088DDD:         add   r5           ;
CODE_088DDE:         with r5            ;
CODE_088DDF:         add   r9           ;
CODE_088DE0:         from r8            ;
CODE_088DE1:         add   r10          ;
CODE_088DE2:         and   r11          ;
CODE_088DE3:         move  r8,r0        ;
CODE_088DE5:         hib                ;
CODE_088DE6:         to r1              ;
CODE_088DE7:         add   r3           ;
CODE_088DE8:         getc               ;
CODE_088DE9:         loop               ;
CODE_088DEA:         plot               ;
CODE_088DEB:         bra CODE_088E00    ;

CODE_088DED:         ibt   r12,#0008    ;
CODE_088DEF:         with r7            ;
CODE_088DF0:         add   r5           ;
CODE_088DF1:         with r5            ;
CODE_088DF2:         add   r9           ;
CODE_088DF3:         from r8            ;
CODE_088DF4:         add   r10          ;
CODE_088DF5:         and   r11          ;
CODE_088DF6:         move  r8,r0        ;
CODE_088DF8:         hib                ;
CODE_088DF9:         to r1              ;
CODE_088DFA:         add   r3           ;
CODE_088DFB:         sub   r0           ;
CODE_088DFC:         color              ;
CODE_088DFD:         loop               ;
CODE_088DFE:         plot               ;
CODE_088DFF:         ibt   r12,#0008    ;
CODE_088E01:         move  r13,r15      ;
CODE_088E03:         merge              ;
CODE_088E04:         bvs CODE_088E1A    ;
CODE_088E06:         to r14             ;
CODE_088E07:         add   r6           ;
CODE_088E08:         with r7            ;
CODE_088E09:         add   r5           ;
CODE_088E0A:         with r5            ;
CODE_088E0B:         sub   r9           ;
CODE_088E0C:         from r8            ;
CODE_088E0D:         add   r10          ;
CODE_088E0E:         and   r11          ;
CODE_088E0F:         move  r8,r0        ;
CODE_088E11:         hib                ;
CODE_088E12:         to r1              ;
CODE_088E13:         add   r3           ;
CODE_088E14:         getc               ;
CODE_088E15:         loop               ;
CODE_088E16:         plot               ;
CODE_088E17:         bra CODE_088E2B    ;

CODE_088E19:         from r4            ;
CODE_088E1A:         with r7            ;
CODE_088E1B:         add   r5           ;
CODE_088E1C:         with r5            ;
CODE_088E1D:         sub   r9           ;
CODE_088E1E:         from r8            ;
CODE_088E1F:         add   r10          ;
CODE_088E20:         and   r11          ;
CODE_088E21:         move  r8,r0        ;
CODE_088E23:         hib                ;
CODE_088E24:         to r1              ;
CODE_088E25:         add   r3           ;
CODE_088E26:         sub   r0           ;
CODE_088E27:         color              ;
CODE_088E28:         loop               ;
CODE_088E29:         plot               ;
CODE_088E2A:         from r4            ;
CODE_088E2B:         sub   r11          ;
CODE_088E2C:         bcs CODE_088E44    ;
CODE_088E2E:         inc   r2           ;
CODE_088E2F:         with r4            ;
CODE_088E30:         add   r10          ;
CODE_088E31:         from r2            ;
CODE_088E32:         and   #0F          ;
CODE_088E34:         bne CODE_088E3E    ;
CODE_088E36:         nop                ;
CODE_088E37:         ibt   r0,#0010     ;
CODE_088E39:         with r2            ;
CODE_088E3A:         sub   r0           ;
CODE_088E3B:         add   r0           ;
CODE_088E3C:         to r3              ;
CODE_088E3D:         add   r3           ;
CODE_088E3E:         iwt   r15,#8DA1    ;
CODE_088E41:         lms   r8,(0000)    ;
CODE_088E44:         rpix               ;
CODE_088E46:         stop               ;
CODE_088E47:         nop                ;

CODE_088E48:         ibt   r0,#0008     ;
CODE_088E4A:         romb               ;
CODE_088E4C:         iwt   r0,#8E9D     ;
CODE_088E4F:         with r1            ;
CODE_088E50:         add   r1           ;
CODE_088E51:         to r14             ;
CODE_088E52:         add   r1           ;
CODE_088E53:         to r10             ;
CODE_088E54:         getb               ;
CODE_088E55:         inc   r14          ;
CODE_088E56:         with r10           ;
CODE_088E57:         getbh              ;
CODE_088E59:         add   r2           ;
CODE_088E5A:         to r14             ;
CODE_088E5B:         add   r2           ;
CODE_088E5C:         getb               ;
CODE_088E5D:         inc   r14          ;
CODE_088E5E:         getbh              ;
CODE_088E60:         move  r11,r0       ;
CODE_088E62:         ibt   r1,#0000     ;
CODE_088E64:         move  r14,r10      ;
CODE_088E66:         cache              ;
CODE_088E67:         ibt   r12,#0008    ;
CODE_088E69:         move  r13,r15      ;
CODE_088E6B:         to r2              ;
CODE_088E6C:         getb               ;
CODE_088E6D:         inc   r14          ;
CODE_088E6E:         inc   r10          ;
CODE_088E6F:         inc   r10          ;
CODE_088E70:         to r3              ;
CODE_088E71:         getb               ;
CODE_088E72:         move  r14,r11      ;
CODE_088E74:         inc   r11          ;
CODE_088E75:         inc   r11          ;
CODE_088E76:         getb               ;
CODE_088E77:         inc   r14          ;
CODE_088E78:         sub   r2           ;
CODE_088E79:         lmult              ;
CODE_088E7B:         with r4            ;
CODE_088E7C:         hib                ;
CODE_088E7D:         lob                ;
CODE_088E7E:         swap               ;
CODE_088E7F:         or    r4           ;
CODE_088E80:         add   r2           ;
CODE_088E81:         to r2              ;
CODE_088E82:         swap               ;
CODE_088E83:         getb               ;
CODE_088E84:         sub   r3           ;
CODE_088E85:         lmult              ;
CODE_088E87:         with r4            ;
CODE_088E88:         hib                ;
CODE_088E89:         lob                ;
CODE_088E8A:         swap               ;
CODE_088E8B:         or    r4           ;
CODE_088E8C:         add   r3           ;
CODE_088E8D:         or    r2           ;
CODE_088E8E:         stw   (r1)         ;
CODE_088E8F:         move  r14,r10      ;
CODE_088E91:         inc   r1           ;
CODE_088E92:         loop               ;
CODE_088E93:         inc   r1           ;
CODE_088E94:         dec   r1           ;
CODE_088E95:         dec   r1           ;
CODE_088E96:         sms   (0058),r1    ;
CODE_088E99:         iwt   r15,#8112    ;
CODE_088E9C:         cache              ;
CODE_088E9D:         ibt   r3,#FF8E     ;
CODE_088E9F:         from r3            ;
CODE_088EA0:         mult  r14          ;
CODE_088EA1:         or    r3           ;
CODE_088EA2:         mult  r14          ;
CODE_088EA3:         mult  r0           ;
CODE_088EA4:         sub   r10          ;
CODE_088EA5:         mult  r0           ;
CODE_088EA6:         sub   r10          ;
CODE_088EA7:         mult  r0           ;
CODE_088EA8:         sub   r10          ;
CODE_088EA9:         mult  r0           ;
CODE_088EAA:         sub   r10          ;
CODE_088EAB:         mult  r0           ;
CODE_088EAC:         sub   r10          ;
CODE_088EAD:         mult  r0           ;
CODE_088EAE:         sub   r10          ;
CODE_088EAF:         mult  r0           ;
CODE_088EB0:         sub   r10          ;
CODE_088EB1:         mult  r0           ;
CODE_088EB2:         sub   r10          ;
CODE_088EB3:         mult  r0           ;
CODE_088EB4:         cache              ;
CODE_088EB5:         sbk                ;
CODE_088EB6:         add   r10          ;
CODE_088EB7:         iwt   r15,#906A    ;
CODE_088EBA:         and   r10          ;
CODE_088EBB:         mult  r0           ;
CODE_088EBC:         inc   r1           ;
CODE_088EBD:         merge              ;
CODE_088EBE:         and   r10          ;
CODE_088EBF:         stop               ;
CODE_088EC0:         sub   r10          ;
CODE_088EC1:         merge              ;
CODE_088EC2:         add   r10          ;
CODE_088EC3:         mult  r0           ;
CODE_088EC4:         cache              ;
CODE_088EC5:         iwt   r15,#FF02    ;
CODE_088EC8:         sub   r10          ;
CODE_088EC9:         iwt   r15,#80D1    ;
CODE_088ECC:         inc   r1           ;
CODE_088ECD:         stop               ;
CODE_088ECE:         inc   r1           ;

CODE_088ECF:         stop               ;
CODE_088ED0:         sub   r10          ;

CODE_088ED1:         stop               ;
CODE_088ED2:         cache              ;

CODE_088ED3:         ibt   r0,#0020     ;
CODE_088ED5:         to r2              ;
CODE_088ED6:         swap               ;
CODE_088ED7:         with r2            ;
CODE_088ED8:         fmult              ;
CODE_088ED9:         to r2              ;
CODE_088EDA:         sub   r2           ;
CODE_088EDB:         sms   (0000),r2    ;
CODE_088EDE:         ibt   r4,#0008     ;
CODE_088EE0:         cache              ;
CODE_088EE1:         ibt   r12,#0004    ;
CODE_088EE3:         move  r13,r15      ;
CODE_088EE5:         ldw   (r5)         ;
CODE_088EE6:         add   r2           ;
CODE_088EE7:         with r5            ;
CODE_088EE8:         add   r4           ;
CODE_088EE9:         loop               ;
CODE_088EEA:         sbk                ;
CODE_088EEB:         ibt   r0,#001E     ;
CODE_088EED:         add   r5           ;
CODE_088EEE:         sms   (0002),r0    ;
CODE_088EF1:         stop               ;
CODE_088EF2:         nop                ;

CODE_088EF3:         ibt   r0,#0008     ;
CODE_088EF5:         romb               ;
CODE_088EF7:         ibt   r0,#0008     ;
CODE_088EF9:         with r1            ;
CODE_088EFA:         sub   r0           ;
CODE_088EFB:         ibt   r2,#0004     ;
CODE_088EFD:         ibt   r3,#0020     ;
CODE_088EFF:         iwt   r4,#00FF     ;
CODE_088F02:         iwt   r5,#FF00     ;
CODE_088F05:         iwt   r6,#3A02     ;
CODE_088F08:         ibt   r7,#0004     ;
CODE_088F0A:         iwt   r8,#AE18     ;
CODE_088F0D:         ibt   r9,#0000     ;
CODE_088F0F:         move  r14,r8       ;
CODE_088F11:         getb               ;
CODE_088F12:         cache              ;
CODE_088F13:         iwt   r12,#00D2    ;
CODE_088F16:         move  r13,r15      ;
CODE_088F18:         with r9            ;
CODE_088F19:         add   r2           ;
CODE_088F1A:         with r9            ;
CODE_088F1B:         lob                ;
CODE_088F1C:         to r14             ;
CODE_088F1D:         from r8            ;
CODE_088F1E:         add   r9           ;
CODE_088F1F:         mult  r3           ;
CODE_088F20:         swap               ;
CODE_088F21:         sex                ;
CODE_088F22:         to r11             ;
CODE_088F23:         add   r1           ;
CODE_088F24:         bmi CODE_088F2D    ;
CODE_088F26:         from r4            ;
CODE_088F27:         sub   r11          ;
CODE_088F28:         bcc CODE_088F2D    ;
CODE_088F2A:         from r5            ;
CODE_088F2B:         from r11           ;
CODE_088F2C:         swap               ;
CODE_088F2D:         stw   (r6)         ;
CODE_088F2E:         with r6            ;
CODE_088F2F:         add   r7           ;
CODE_088F30:         loop               ;
CODE_088F31:         getb               ;
CODE_088F32:         stop               ;
CODE_088F33:         nop                ;

CODE_088F34:         from r3            ;
CODE_088F35:         asr                ;
CODE_088F36:         and   #0F          ;
CODE_088F38:         swap               ;
CODE_088F39:         asr                ;
CODE_088F3A:         asr                ;
CODE_088F3B:         asr                ;
CODE_088F3C:         to r11             ;
CODE_088F3D:         asr                ;
CODE_088F3E:         from r3            ;
CODE_088F3F:         asr                ;
CODE_088F40:         asr                ;
CODE_088F41:         asr                ;
CODE_088F42:         asr                ;
CODE_088F43:         to r5              ;
CODE_088F44:         and   #0F          ;
CODE_088F46:         ibt   r0,#000D     ;
CODE_088F48:         sub   r5           ;
CODE_088F49:         sms   (0000),r0    ;
CODE_088F4C:         move  r12,r3       ;
CODE_088F4E:         from r2            ;
CODE_088F4F:         sub   r12          ;
CODE_088F50:         add   r0           ;
CODE_088F51:         iwt   r5,#3A02     ;
CODE_088F54:         to r5              ;
CODE_088F55:         add   r5           ;
CODE_088F56:         sms   (0002),r5    ;
CODE_088F59:         sms   (0004),r3    ;
CODE_088F5C:         ibt   r7,#0000     ;
CODE_088F5E:         ibt   r6,#0000     ;
CODE_088F60:         iwt   r10,#00FF    ;
CODE_088F63:         cache              ;
CODE_088F64:         with r12           ;
CODE_088F65:         add   r12          ;
CODE_088F66:         moves r8,r3        ;
CODE_088F68:         bne CODE_088F6F    ;
CODE_088F6A:         nop                ;
CODE_088F6B:         iwt   r15,#9002    ;
CODE_088F6E:         nop                ;
CODE_088F6F:         iwt   r3,#2200     ;
CODE_088F72:         from r12           ;
CODE_088F73:         add   r3           ;
CODE_088F74:         to r3              ;
CODE_088F75:         ldw   (r0)         ;
CODE_088F76:         iwt   r13,#8F79    ;
CODE_088F79:         ibt   r0,#0001     ;
CODE_088F7B:         romb               ;
CODE_088F7D:         from r7            ;
CODE_088F7E:         to r14             ;
CODE_088F7F:         add   r4           ;
CODE_088F80:         getb               ;
CODE_088F81:         umult r8           ;
CODE_088F83:         to r9              ;
CODE_088F84:         hib                ;
CODE_088F85:         ibt   r0,#0008     ;
CODE_088F87:         romb               ;
CODE_088F89:         iwt   r14,#AE58    ;
CODE_088F8C:         with r14           ;
CODE_088F8D:         add   r11          ;
CODE_088F8E:         getbs              ;
CODE_088F90:         mult  #0A          ;
CODE_088F92:         asr                ;
CODE_088F93:         asr                ;
CODE_088F94:         asr                ;
CODE_088F95:         asr                ;
CODE_088F96:         asr                ;
CODE_088F97:         to r2              ;
CODE_088F98:         asr                ;
CODE_088F99:         from r1            ;
CODE_088F9A:         sub   r9           ;
CODE_088F9B:         add   r2           ;
CODE_088F9C:         bpl CODE_088FA0    ;
CODE_088F9E:         nop                ;
CODE_088F9F:         sub   r0           ;
CODE_088FA0:         stb   (r5)         ;
CODE_088FA2:         inc   r5           ;
CODE_088FA3:         from r1            ;
CODE_088FA4:         add   r9           ;
CODE_088FA5:         add   r2           ;
CODE_088FA6:         sub   r10          ;
CODE_088FA7:         bmi CODE_088FAB    ;
CODE_088FA9:         add   r10          ;
CODE_088FAA:         from r10           ;
CODE_088FAB:         stb   (r5)         ;
CODE_088FAD:         with r6            ;
CODE_088FAE:         add   r3           ;
CODE_088FAF:         from r6            ;
CODE_088FB0:         hib                ;
CODE_088FB1:         to r7              ;
CODE_088FB2:         add   r7           ;
CODE_088FB3:         iwt   r0,#01FF     ;
CODE_088FB6:         to r7              ;
CODE_088FB7:         and   r7           ;
CODE_088FB8:         lms   r2,(0000)    ;
CODE_088FBB:         with r11           ;
CODE_088FBC:         add   r2           ;
CODE_088FBD:         with r11           ;
CODE_088FBE:         and   r10          ;
CODE_088FBF:         with r6            ;
CODE_088FC0:         and   r10          ;
CODE_088FC1:         with r5            ;
CODE_088FC2:         add   #03          ;
CODE_088FC4:         iwt   r0,#3D46     ;
CODE_088FC7:         sub   r5           ;
CODE_088FC8:         bcs CODE_088FCE    ;
CODE_088FCA:         nop                ;
CODE_088FCB:         iwt   r5,#3D46     ;
CODE_088FCE:         loop               ;
CODE_088FCF:         nop                ;
CODE_088FD0:         lms   r6,(0002)    ;
CODE_088FD3:         lms   r1,(0004)    ;
CODE_088FD6:         from r1            ;
CODE_088FD7:         asr                ;
CODE_088FD8:         asr                ;
CODE_088FD9:         asr                ;
CODE_088FDA:         to r12             ;
CODE_088FDB:         asr                ;
CODE_088FDC:         from r1            ;
CODE_088FDD:         add   r0           ;
CODE_088FDE:         iwt   r14,#AE58    ;
CODE_088FE1:         to r14             ;
CODE_088FE2:         add   r14          ;
CODE_088FE3:         getbs              ;
CODE_088FE5:         mult  r12          ;
CODE_088FE6:         asr                ;
CODE_088FE7:         asr                ;
CODE_088FE8:         asr                ;
CODE_088FE9:         bpl CODE_088FED    ;
CODE_088FEB:         asr                ;
CODE_088FEC:         not                ;
CODE_088FED:         moves r12,r0       ;
CODE_088FEF:         beq CODE_089002    ;
CODE_088FF1:         nop                ;
CODE_088FF2:         iwt   r13,#8FFA    ;
CODE_088FF5:         iwt   r0,#00FF     ;
CODE_088FF8:         ibt   r3,#0004     ;
CODE_088FFA:         stw   (r5)         ;
CODE_088FFB:         stw   (r6)         ;
CODE_088FFC:         with r5            ;
CODE_088FFD:         sub   r3           ;
CODE_088FFE:         with r6            ;
CODE_088FFF:         add   r3           ;
CODE_089000:         loop               ;
CODE_089001:         nop                ;
CODE_089002:         stop               ;
CODE_089003:         nop                ;

CODE_089004:         iwt   r1,#5800     ;
CODE_089007:         sub   r0           ;
CODE_089008:         cache              ;
CODE_089009:         iwt   r12,#1000    ;
CODE_08900C:         move  r13,r15      ;
CODE_08900E:         stw   (r1)         ;
CODE_08900F:         inc   r1           ;
CODE_089010:         loop               ;
CODE_089011:         inc   r1           ;
CODE_089012:         ibt   r4,#0020     ;
CODE_089014:         sub   r0           ;
CODE_089015:         move  r7,r0        ;
CODE_089017:         ibt   r12,#0020    ;
CODE_089019:         iwt   r13,#901D    ;
CODE_08901C:         with r7            ;
CODE_08901D:         add   r7           ;
CODE_08901E:         with r4            ;
CODE_08901F:         add   r4           ;
CODE_089020:         rol                ;
CODE_089021:         sub   r6           ;
CODE_089022:         bcc CODE_089027    ;
CODE_089024:         add   r6           ;
CODE_089025:         sub   r6           ;
CODE_089026:         inc   r7           ;
CODE_089027:         loop               ;
CODE_089028:         with r7            ;
CODE_089029:         iwt   r0,#4000     ;
CODE_08902C:         sub   r7           ;
CODE_08902D:         to r3              ;
CODE_08902E:         hib                ;
CODE_08902F:         move  r2,r3        ;
CODE_089031:         from r7            ;
CODE_089032:         add   r7           ;
CODE_089033:         hib                ;
CODE_089034:         to r4              ;
CODE_089035:         mult  r0           ;
CODE_089036:         with r7            ;
CODE_089037:         lob                ;
CODE_089038:         move  r9,r7        ;
CODE_08903A:         ibt   r1,#0001     ;
CODE_08903C:         move  r0,r10       ;
CODE_08903E:         lsr                ;
CODE_08903F:         bcc CODE_089045    ;
CODE_089041:         add   r0           ;
CODE_089042:         with r1            ;
CODE_089043:         or    #04          ;
CODE_089045:         from r1            ;
CODE_089046:         cmode              ;
CODE_089048:         move  r10,r0       ;
CODE_08904A:         from r11           ;
CODE_08904B:         romb               ;
CODE_08904D:         move  r1,r3        ;
CODE_08904F:         move  r8,r9        ;
CODE_089051:         merge              ;
CODE_089052:         bvs CODE_089063    ;
CODE_089054:         to r14             ;
CODE_089055:         add   r10          ;
CODE_089056:         with r8            ;
CODE_089057:         add   r6           ;
CODE_089058:         getc               ;
CODE_089059:         plot               ;
CODE_08905A:         merge              ;
CODE_08905B:         bvc CODE_089055    ;
CODE_08905D:         to r14             ;
CODE_08905E:         with r7            ;
CODE_08905F:         add   r6           ;
CODE_089060:         bra CODE_08904D    ;

CODE_089062:         inc   r2           ;
CODE_089063:         rpix               ;
CODE_089065:         stop               ;
CODE_089066:         nop                ;

CODE_089067:         iwt   r1,#0205     ;
CODE_08906A:         ibt   r2,#0007     ;
CODE_08906C:         ibt   r3,#0001     ;
CODE_08906E:         cache              ;
CODE_08906F:         iwt   r12,#0080    ;
CODE_089072:         move  r13,r15      ;
CODE_089074:         ldb   (r1)         ;
CODE_089076:         and   r3           ;
CODE_089077:         bne CODE_08907D    ;
CODE_089079:         inc   r1           ;
CODE_08907A:         sub   r0           ;
CODE_08907B:         stb   (r1)         ;
CODE_08907D:         with r1            ;
CODE_08907E:         add   r2           ;
CODE_08907F:         loop               ;
CODE_089080:         nop                ;
CODE_089081:         stop               ;
CODE_089082:         nop                ;

CODE_089083:         iwt   r11,#3372    ;
CODE_089086:         ibt   r12,#0070    ;
CODE_089088:         iwt   r13,#908F    ;
CODE_08908B:         iwt   r14,#0100    ;
CODE_08908E:         cache              ;
CODE_08908F:         from r6            ;
CODE_089090:         hib                ;
CODE_089091:         sub   r10          ;
CODE_089092:         to r1              ;
CODE_089093:         and   r14          ;
CODE_089094:         beq CODE_089099    ;
CODE_089096:         nop                ;
CODE_089097:         ibt   r0,#0000     ;
CODE_089099:         stb   (r11)        ;
CODE_08909B:         inc   r11          ;
CODE_08909C:         from r7            ;
CODE_08909D:         hib                ;
CODE_08909E:         sub   r10          ;
CODE_08909F:         to r1              ;
CODE_0890A0:         and   r14          ;
CODE_0890A1:         beq CODE_0890A6    ;
CODE_0890A3:         nop                ;
CODE_0890A4:         ibt   r0,#0000     ;
CODE_0890A6:         stb   (r11)        ;
CODE_0890A8:         inc   r11          ;
CODE_0890A9:         from r8            ;
CODE_0890AA:         hib                ;
CODE_0890AB:         sub   r10          ;
CODE_0890AC:         to r1              ;
CODE_0890AD:         and   r14          ;
CODE_0890AE:         beq CODE_0890B3    ;
CODE_0890B0:         nop                ;
CODE_0890B1:         ibt   r0,#0000     ;
CODE_0890B3:         stb   (r11)        ;
CODE_0890B5:         inc   r11          ;
CODE_0890B6:         from r9            ;
CODE_0890B7:         hib                ;
CODE_0890B8:         sub   r10          ;
CODE_0890B9:         to r1              ;
CODE_0890BA:         and   r14          ;
CODE_0890BB:         beq CODE_0890C0    ;
CODE_0890BD:         nop                ;
CODE_0890BE:         ibt   r0,#0000     ;
CODE_0890C0:         stb   (r11)        ;
CODE_0890C2:         inc   r11          ;
CODE_0890C3:         with r6            ;
CODE_0890C4:         add   r2           ;
CODE_0890C5:         bcc CODE_0890CB    ;
CODE_0890C7:         nop                ;
CODE_0890C8:         iwt   r6,#FF00     ;
CODE_0890CB:         with r7            ;
CODE_0890CC:         add   r3           ;
CODE_0890CD:         bcc CODE_0890D3    ;
CODE_0890CF:         nop                ;
CODE_0890D0:         iwt   r7,#FF00     ;
CODE_0890D3:         with r8            ;
CODE_0890D4:         add   r4           ;
CODE_0890D5:         bcc CODE_0890DB    ;
CODE_0890D7:         nop                ;
CODE_0890D8:         iwt   r8,#FF00     ;
CODE_0890DB:         with r9            ;
CODE_0890DC:         add   r5           ;
CODE_0890DD:         bcc CODE_0890E3    ;
CODE_0890DF:         nop                ;
CODE_0890E0:         iwt   r9,#FF00     ;
CODE_0890E3:         loop               ;
CODE_0890E4:         nop                ;
CODE_0890E5:         stop               ;
CODE_0890E6:         nop                ;

CODE_0890E7:         romb               ;
CODE_0890E9:         move  r14,r1       ;
CODE_0890EB:         getb               ;
CODE_0890EC:         inc   r14          ;
CODE_0890ED:         getbh              ;
CODE_0890EF:         inc   r14          ;
CODE_0890F0:         ibt   r10,#001F    ;
CODE_0890F2:         to r3              ;
CODE_0890F3:         and   r10          ;
CODE_0890F4:         lsr                ;
CODE_0890F5:         lsr                ;
CODE_0890F6:         lsr                ;
CODE_0890F7:         lsr                ;
CODE_0890F8:         lsr                ;
CODE_0890F9:         to r4              ;
CODE_0890FA:         and   r10          ;
CODE_0890FB:         lsr                ;
CODE_0890FC:         lsr                ;
CODE_0890FD:         lsr                ;
CODE_0890FE:         lsr                ;
CODE_0890FF:         lsr                ;
CODE_089100:         to r5              ;
CODE_089101:         and   r10          ;
CODE_089102:         iwt   r1,#5D21     ;
CODE_089105:         iwt   r2,#59B5     ;
CODE_089108:         iwt   r13,#9135    ;
CODE_08910B:         ibt   r11,#0017    ;
CODE_08910D:         cache              ;
CODE_08910E:         getb               ;
CODE_08910F:         inc   r14          ;
CODE_089110:         move  r6,r0        ;
CODE_089112:         ibt   r10,#001F    ;
CODE_089114:         and   r10          ;
CODE_089115:         sub   r3           ;
CODE_089116:         lob                ;
CODE_089117:         to r7              ;
CODE_089118:         swap               ;
CODE_089119:         with r6            ;
CODE_08911A:         getbh              ;
CODE_08911C:         inc   r14          ;
CODE_08911D:         from r6            ;
CODE_08911E:         lsr                ;
CODE_08911F:         lsr                ;
CODE_089120:         lsr                ;
CODE_089121:         lsr                ;
CODE_089122:         lsr                ;
CODE_089123:         and   r10          ;
CODE_089124:         sub   r4           ;
CODE_089125:         lob                ;
CODE_089126:         to r8              ;
CODE_089127:         swap               ;
CODE_089128:         from r6            ;
CODE_089129:         swap               ;
CODE_08912A:         lsr                ;
CODE_08912B:         lsr                ;
CODE_08912C:         and   r10          ;
CODE_08912D:         sub   r5           ;
CODE_08912E:         lob                ;
CODE_08912F:         to r9              ;
CODE_089130:         swap               ;
CODE_089131:         ibt   r6,#0000     ;
CODE_089133:         ibt   r12,#0010    ;
CODE_089135:         from r7            ;
CODE_089136:         fmult              ;
CODE_089137:         add   r3           ;
CODE_089138:         ibt   r10,#0020    ;
CODE_08913A:         or    r10          ;
CODE_08913B:         stb   (r1)         ;
CODE_08913D:         dec   r1           ;
CODE_08913E:         from r8            ;
CODE_08913F:         fmult              ;
CODE_089140:         add   r4           ;
CODE_089141:         ibt   r10,#0040    ;
CODE_089143:         or    r10          ;
CODE_089144:         stb   (r1)         ;
CODE_089146:         dec   r1           ;
CODE_089147:         from r9            ;
CODE_089148:         fmult              ;
CODE_089149:         add   r5           ;
CODE_08914A:         ibt   r10,#FF80    ;
CODE_08914C:         or    r10          ;
CODE_08914D:         stb   (r2)         ;
CODE_08914F:         ibt   r0,#0010     ;
CODE_089151:         to r6              ;
CODE_089152:         add   r6           ;
CODE_089153:         loop               ;
CODE_089154:         dec   r2           ;
CODE_089155:         from r7            ;
CODE_089156:         swap               ;
CODE_089157:         to r3              ;
CODE_089158:         add   r3           ;
CODE_089159:         from r8            ;
CODE_08915A:         swap               ;
CODE_08915B:         to r4              ;
CODE_08915C:         add   r4           ;
CODE_08915D:         from r9            ;
CODE_08915E:         swap               ;
CODE_08915F:         to r5              ;
CODE_089160:         add   r5           ;
CODE_089161:         dec   r11          ;
CODE_089162:         bne CODE_08910F    ;
CODE_089164:         getb               ;
CODE_089165:         ibt   r0,#0020     ;
CODE_089167:         to r3              ;
CODE_089168:         or    r3           ;
CODE_089169:         ibt   r0,#0040     ;
CODE_08916B:         to r4              ;
CODE_08916C:         or    r4           ;
CODE_08916D:         ibt   r0,#FF80     ;
CODE_08916F:         or    r5           ;
CODE_089170:         iwt   r12,#0046    ;
CODE_089173:         move  r13,r15      ;
CODE_089175:         from r3            ;
CODE_089176:         stb   (r1)         ;
CODE_089178:         dec   r1           ;
CODE_089179:         from r4            ;
CODE_08917A:         stb   (r1)         ;
CODE_08917C:         dec   r1           ;
CODE_08917D:         stb   (r2)         ;
CODE_08917F:         loop               ;
CODE_089180:         dec   r2           ;
CODE_089181:         stop               ;
CODE_089182:         nop                ;

CODE_089183:         romb               ;
CODE_089185:         ibt   r5,#0000     ;
CODE_089187:         iwt   r7,#00E1     ;
CODE_08918A:         cache              ;
CODE_08918B:         ibt   r6,#0011     ;
CODE_08918D:         from r2            ;
CODE_08918E:         sub   r4           ;
CODE_08918F:         bcc CODE_089197    ;
CODE_089191:         nop                ;
CODE_089192:         move  r2,r0        ;
CODE_089194:         bra CODE_08918E    ;

CODE_089196:         move  r14,r13      ;
CODE_089199:         from r1            ;
CODE_08919A:         sub   r3           ;
CODE_08919B:         bcc CODE_0891A3    ;
CODE_08919D:         nop                ;
CODE_08919E:         move  r1,r0        ;
CODE_0891A0:         bra CODE_08919A    ;

CODE_0891A2:         from r1            ;
CODE_0891A3:         getb               ;
CODE_0891A4:         inc   r14          ;
CODE_0891A5:         move  r8,r0        ;
CODE_0891A7:         sex                ;
CODE_0891A8:         inc   r0           ;
CODE_0891A9:         beq CODE_0891FB    ;
CODE_0891AB:         from r8            ;
CODE_0891AC:         bic   #01          ;
CODE_0891AE:         sub   r8           ;
CODE_0891AF:         beq CODE_0891B3    ;
CODE_0891B1:         sub   r0           ;
CODE_0891B2:         inc   r0           ;
CODE_0891B3:         inc   r0           ;
CODE_0891B4:         to r9              ;
CODE_0891B5:         mult  #08          ;
CODE_0891B7:         getb               ;
CODE_0891B8:         inc   r14          ;
CODE_0891B9:         mult  #08          ;
CODE_0891BB:         sub   r1           ;
CODE_0891BC:         beq CODE_0891C5    ;
CODE_0891BE:         nop                ;
CODE_0891BF:         bpl CODE_0891F7    ;
CODE_0891C1:         add   r9           ;
CODE_0891C2:         bmi CODE_0891F7    ;
CODE_0891C4:         sub   r9           ;
CODE_0891C5:         to r12             ;
CODE_0891C6:         add   r5           ;
CODE_0891C7:         getb               ;
CODE_0891C8:         inc   r14          ;
CODE_0891C9:         mult  #08          ;
CODE_0891CB:         sub   r2           ;
CODE_0891CC:         add   #0F          ;
CODE_0891CE:         bpl CODE_0891D2    ;
CODE_0891D0:         nop                ;
CODE_0891D1:         add   r4           ;
CODE_0891D2:         sub   r7           ;
CODE_0891D3:         bpl CODE_0891F8    ;
CODE_0891D5:         add   r7           ;
CODE_0891D6:         sub   #0F          ;
CODE_0891D8:         from r12           ;
CODE_0891D9:         stw   (r10)        ;
CODE_0891DA:         inc   r10          ;
CODE_0891DB:         inc   r10          ;
CODE_0891DC:         stw   (r10)        ;
CODE_0891DD:         inc   r10          ;
CODE_0891DE:         inc   r10          ;
CODE_0891DF:         from r8            ;
CODE_0891E0:         bic   #01          ;
CODE_0891E2:         swap               ;
CODE_0891E3:         getbl              ;
CODE_0891E5:         inc   r14          ;
CODE_0891E6:         add   r11          ;
CODE_0891E7:         stw   (r10)        ;
CODE_0891E8:         inc   r10          ;
CODE_0891E9:         inc   r10          ;
CODE_0891EA:         from r8            ;
CODE_0891EB:         and   #01          ;
CODE_0891ED:         add   r0           ;
CODE_0891EE:         iwt   r12,#4000    ;
CODE_0891F1:         or    r12          ;
CODE_0891F2:         stw   (r10)        ;
CODE_0891F3:         inc   r10          ;
CODE_0891F4:         bra CODE_0891A3    ;

CODE_0891F6:         inc   r10          ;
CODE_0891F7:         inc   r14          ;
CODE_0891F8:         bra CODE_0891A3    ;

CODE_0891FA:         inc   r14          ;
CODE_0891FB:         ibt   r0,#0010     ;
CODE_0891FD:         to r1              ;
CODE_0891FE:         add   r1           ;
CODE_0891FF:         to r5              ;
CODE_089200:         add   r5           ;
CODE_089201:         dec   r6           ;
CODE_089202:         bne CODE_089198    ;
CODE_089204:         move  r14,r13      ;
CODE_089206:         stop               ;
CODE_089207:         nop                ;

CODE_089208:         ibt   r7,#0002     ;
CODE_08920A:         iwt   r12,#00D2    ;
CODE_08920D:         ibt   r0,#0008     ;
CODE_08920F:         romb               ;
CODE_089211:         ibt   r10,#0000    ;
CODE_089213:         iwt   r11,#AE18    ;
CODE_089216:         cache              ;
CODE_089217:         iwt   r13,#921B    ;
CODE_08921A:         from r2            ;
CODE_08921B:         lob                ;
CODE_08921C:         to r14             ;
CODE_08921D:         add   r11          ;
CODE_08921E:         with r2            ;
CODE_08921F:         add   r3           ;
CODE_089220:         with r10           ;
CODE_089221:         add   r5           ;
CODE_089222:         from r10           ;
CODE_089223:         div2               ;
CODE_089225:         div2               ;
CODE_089227:         div2               ;
CODE_089229:         to r9              ;
CODE_08922A:         div2               ;
CODE_08922C:         getb               ;
CODE_08922D:         mult  r4           ;
CODE_08922E:         add   r0           ;
CODE_08922F:         add   r0           ;
CODE_089230:         hib                ;
CODE_089231:         sex                ;
CODE_089232:         add   r1           ;
CODE_089233:         add   r9           ;
CODE_089234:         stw   (r6)         ;
CODE_089235:         with r6            ;
CODE_089236:         add   r7           ;
CODE_089237:         loop               ;
CODE_089238:         from r2            ;
CODE_089239:         stop               ;
CODE_08923A:         nop                ;

CODE_08923B:         romb               ;
CODE_08923D:         move  r14,r14      ;
CODE_08923F:         cache              ;
CODE_089240:         from r10           ;
CODE_089241:         to r3              ;
CODE_089242:         add   #04          ;
CODE_089244:         ibt   r0,#0020     ;
CODE_089246:         to r4              ;
CODE_089247:         add   r3           ;
CODE_089248:         ibt   r11,#0003    ;
CODE_08924A:         iwt   r13,#9251    ;
CODE_08924D:         move  r5,r3        ;
CODE_08924F:         ibt   r12,#0004    ;
CODE_089251:         ldw   (r5)         ;
CODE_089252:         stw   (r4)         ;
CODE_089253:         inc   r5           ;
CODE_089254:         inc   r5           ;
CODE_089255:         inc   r4           ;
CODE_089256:         inc   r4           ;
CODE_089257:         ldw   (r5)         ;
CODE_089258:         stw   (r4)         ;
CODE_089259:         with r5            ;
CODE_08925A:         add   #06          ;
CODE_08925C:         with r4            ;
CODE_08925D:         add   #06          ;
CODE_08925F:         loop               ;
CODE_089260:         nop                ;
CODE_089261:         dec   r11          ;
CODE_089262:         bne CODE_08924D    ;
CODE_089264:         nop                ;
CODE_089265:         iwt   r12,#0010    ;
CODE_089268:         move  r13,r15      ;
CODE_08926A:         getbs              ;
CODE_08926C:         inc   r14          ;
CODE_08926D:         add   r1           ;
CODE_08926E:         stw   (r10)        ;
CODE_08926F:         inc   r10          ;
CODE_089270:         inc   r10          ;
CODE_089271:         getbs              ;
CODE_089273:         inc   r14          ;
CODE_089274:         add   r2           ;
CODE_089275:         stw   (r10)        ;
CODE_089276:         inc   r10          ;
CODE_089277:         inc   r10          ;
CODE_089278:         inc   r10          ;
CODE_089279:         to r3              ;
CODE_08927A:         ldb   (r10)        ;
CODE_08927C:         getb               ;
CODE_08927D:         inc   r14          ;
CODE_08927E:         or    r3           ;
CODE_08927F:         stb   (r10)        ;
CODE_089281:         inc   r10          ;
CODE_089282:         inc   r10          ;
CODE_089283:         loop               ;
CODE_089284:         inc   r10          ;
CODE_089285:         stop               ;
CODE_089286:         nop                ;

CODE_089287:         iwt   r7,#1999     ;
CODE_08928A:         ibt   r8,#0000     ;
CODE_08928C:         ibt   r12,#000A    ;
CODE_08928E:         cache              ;
CODE_08928F:         move  r13,r15      ;
CODE_089291:         ibt   r0,#0008     ;
CODE_089293:         romb               ;
CODE_089295:         from r8            ;
CODE_089296:         to r11             ;
CODE_089297:         hib                ;
CODE_089298:         iwt   r0,#AE18     ;
CODE_08929B:         to r14             ;
CODE_08929C:         add   r11          ;
CODE_08929D:         getb               ;
CODE_08929E:         mult  r1           ;
CODE_08929F:         to r9              ;
CODE_0892A0:         hib                ;
CODE_0892A1:         iwt   r0,#AE58     ;
CODE_0892A4:         to r14             ;
CODE_0892A5:         add   r11          ;
CODE_0892A6:         getb               ;
CODE_0892A7:         mult  r2           ;
CODE_0892A8:         to r10             ;
CODE_0892A9:         hib                ;
CODE_0892AA:         iwt   r0,#AE18     ;
CODE_0892AD:         to r14             ;
CODE_0892AE:         add   r4           ;
CODE_0892AF:         getb               ;
CODE_0892B0:         mult  r9           ;
CODE_0892B1:         asr                ;
CODE_0892B2:         asr                ;
CODE_0892B3:         asr                ;
CODE_0892B4:         asr                ;
CODE_0892B5:         asr                ;
CODE_0892B6:         asr                ;
CODE_0892B7:         asr                ;
CODE_0892B8:         to r11             ;
CODE_0892B9:         asr                ;
CODE_0892BA:         iwt   r0,#AE58     ;
CODE_0892BD:         to r14             ;
CODE_0892BE:         add   r4           ;
CODE_0892BF:         getb               ;
CODE_0892C0:         mult  r10          ;
CODE_0892C1:         asr                ;
CODE_0892C2:         asr                ;
CODE_0892C3:         asr                ;
CODE_0892C4:         asr                ;
CODE_0892C5:         asr                ;
CODE_0892C6:         asr                ;
CODE_0892C7:         asr                ;
CODE_0892C8:         asr                ;
CODE_0892C9:         add   r11          ;
CODE_0892CA:         lm    r11,(0094)   ;
CODE_0892CE:         add   r11          ;
CODE_0892CF:         not                ;
CODE_0892D0:         inc   r0           ;
CODE_0892D1:         add   r5           ;
CODE_0892D2:         stw   (r3)         ;
CODE_0892D3:         inc   r3           ;
CODE_0892D4:         inc   r3           ;
CODE_0892D5:         iwt   r0,#AE58     ;
CODE_0892D8:         to r14             ;
CODE_0892D9:         add   r4           ;
CODE_0892DA:         getb               ;
CODE_0892DB:         mult  r9           ;
CODE_0892DC:         asr                ;
CODE_0892DD:         asr                ;
CODE_0892DE:         asr                ;
CODE_0892DF:         asr                ;
CODE_0892E0:         asr                ;
CODE_0892E1:         asr                ;
CODE_0892E2:         asr                ;
CODE_0892E3:         to r11             ;
CODE_0892E4:         asr                ;
CODE_0892E5:         iwt   r0,#AE18     ;
CODE_0892E8:         to r14             ;
CODE_0892E9:         add   r4           ;
CODE_0892EA:         getb               ;
CODE_0892EB:         mult  r10          ;
CODE_0892EC:         asr                ;
CODE_0892ED:         asr                ;
CODE_0892EE:         asr                ;
CODE_0892EF:         asr                ;
CODE_0892F0:         asr                ;
CODE_0892F1:         asr                ;
CODE_0892F2:         asr                ;
CODE_0892F3:         asr                ;
CODE_0892F4:         sub   r11          ;
CODE_0892F5:         lm    r11,(009C)   ;
CODE_0892F9:         add   r11          ;
CODE_0892FA:         add   r6           ;
CODE_0892FB:         stw   (r3)         ;
CODE_0892FC:         with r3            ;
CODE_0892FD:         add   #06          ;
CODE_0892FF:         with r8            ;
CODE_089300:         add   r7           ;
CODE_089301:         loop               ;
CODE_089302:         nop                ;
CODE_089303:         stop               ;
CODE_089304:         nop                ;

CODE_089305:         bne CODE_089307    ;
CODE_089307:         cache              ;
CODE_089308:         rol                ;
CODE_089309:         cache              ;
CODE_08930A:         iwt   r8,#0000     ;
CODE_08930D:         rol                ;
CODE_08930E:         cache              ;
CODE_08930F:         iwt   r8,#0000     ;
CODE_089312:         rol                ;
CODE_089313:         stop               ;
CODE_089314:         iwt   r9,#0400     ;
CODE_089317:         rol                ;
CODE_089318:         cache              ;
CODE_089319:         beq CODE_08931B    ;
CODE_08931B:         cache              ;
CODE_08931C:         rol                ;
CODE_08931D:         cache              ;
CODE_08931E:         beq CODE_089320    ;
CODE_089320:         cache              ;
CODE_089321:         rol                ;
CODE_089322:         stop               ;
CODE_089323:         iwt   r5,#0600     ;
CODE_089326:         rol                ;
CODE_089327:         cache              ;
CODE_089328:         iwt   r7,#0000     ;
CODE_08932B:         rol                ;
CODE_08932C:         cache              ;
CODE_08932D:         blt CODE_08932F    ;
CODE_08932F:         cache              ;
CODE_089330:         rol                ;
CODE_089331:         cache              ;
CODE_089332:         ibt   r0,#0008     ;
CODE_089334:         romb               ;
CODE_089336:         sms   (0000),r1    ;
CODE_089339:         sms   (0002),r2    ;
CODE_08933C:         sms   (0004),r3    ;
CODE_08933F:         sms   (0006),r4    ;
CODE_089342:         from r1            ;
CODE_089343:         to r2              ;
CODE_089344:         umult #0F          ;
CODE_089346:         iwt   r0,#9305     ;
CODE_089349:         to r14             ;
CODE_08934A:         add   r2           ;
CODE_08934B:         lm    r2,(1972)    ;
CODE_08934F:         iwt   r0,#1180     ;
CODE_089352:         add   r2           ;
CODE_089353:         to r1              ;
CODE_089354:         ldb   (r0)         ;
CODE_089356:         with r1            ;
CODE_089357:         umult #08          ;
CODE_089359:         iwt   r0,#1362     ;
CODE_08935C:         add   r2           ;
CODE_08935D:         to r3              ;
CODE_08935E:         ldw   (r0)         ;
CODE_08935F:         iwt   r0,#1400     ;
CODE_089362:         add   r2           ;
CODE_089363:         to r4              ;
CODE_089364:         ldw   (r0)         ;
CODE_089365:         from r4            ;
CODE_089366:         swap               ;
CODE_089367:         add   r0           ;
CODE_089368:         add   r0           ;
CODE_089369:         add   r0           ;
CODE_08936A:         add   r0           ;
CODE_08936B:         add   r0           ;
CODE_08936C:         sms   (0008),r0    ;
CODE_08936F:         iwt   r0,#1680     ;
CODE_089372:         add   r2           ;
CODE_089373:         to r5              ;
CODE_089374:         ldw   (r0)         ;
CODE_089375:         iwt   r0,#1682     ;
CODE_089378:         add   r2           ;
CODE_089379:         to r6              ;
CODE_08937A:         ldw   (r0)         ;
CODE_08937B:         iwt   r0,#1042     ;
CODE_08937E:         add   r2           ;
CODE_08937F:         to r7              ;
CODE_089380:         ldw   (r0)         ;
CODE_089381:         with r7            ;
CODE_089382:         swap               ;
CODE_089383:         cache              ;
CODE_089384:         ibt   r12,#0003    ;
CODE_089386:         move  r13,r15      ;
CODE_089388:         getbs              ;
CODE_08938A:         inc   r14          ;
CODE_08938B:         dec   r4           ;
CODE_08938C:         bmi CODE_089391    ;
CODE_08938E:         inc   r4           ;
CODE_08938F:         not                ;
CODE_089390:         inc   r0           ;
CODE_089391:         to r8              ;
CODE_089392:         add   r5           ;
CODE_089393:         getbs              ;
CODE_089395:         inc   r14          ;
CODE_089396:         to r9              ;
CODE_089397:         add   r6           ;
CODE_089398:         getb               ;
CODE_089399:         inc   r14          ;
CODE_08939A:         getbh              ;
CODE_08939C:         inc   r14          ;
CODE_08939D:         add   r1           ;
CODE_08939E:         to r10             ;
CODE_08939F:         xor   r7           ;
CODE_0893A1:         lms   r0,(0008)    ;
CODE_0893A4:         to r10             ;
CODE_0893A5:         xor   r10          ;
CODE_0893A7:         to r11             ;
CODE_0893A8:         getb               ;
CODE_0893A9:         inc   r14          ;
CODE_0893AA:         dec   r11          ;
CODE_0893AB:         bpl CODE_0893B5    ;
CODE_0893AD:         inc   r11          ;
CODE_0893AE:         dec   r4           ;
CODE_0893AF:         bmi CODE_0893B5    ;
CODE_0893B1:         inc   r4           ;
CODE_0893B2:         with r8            ;
CODE_0893B3:         add   #08          ;
CODE_0893B5:         from r8            ;
CODE_0893B6:         stw   (r3)         ;
CODE_0893B7:         inc   r3           ;
CODE_0893B8:         inc   r3           ;
CODE_0893B9:         from r9            ;
CODE_0893BA:         stw   (r3)         ;
CODE_0893BB:         inc   r3           ;
CODE_0893BC:         inc   r3           ;
CODE_0893BD:         from r10           ;
CODE_0893BE:         stw   (r3)         ;
CODE_0893BF:         inc   r3           ;
CODE_0893C0:         inc   r3           ;
CODE_0893C1:         from r11           ;
CODE_0893C2:         stw   (r3)         ;
CODE_0893C3:         inc   r3           ;
CODE_0893C4:         loop               ;
CODE_0893C5:         inc   r3           ;
CODE_0893C6:         ibt   r0,#0002     ;
CODE_0893C8:         sms   (000A),r0    ;
CODE_0893CB:         ibt   r0,#0008     ;
CODE_0893CD:         sms   (000C),r0    ;
CODE_0893D0:         iwt   r0,#060F     ;
CODE_0893D3:         sms   (000E),r0    ;
CODE_0893D6:         lms   r12,(0002)   ;
CODE_0893D9:         dec   r12          ;
CODE_0893DA:         bmi CODE_089434    ;
CODE_0893DC:         inc   r12          ;
CODE_0893DD:         cache              ;
CODE_0893DE:         lms   r0,(0006)    ;
CODE_0893E1:         romb               ;
CODE_0893E3:         lms   r14,(0004)   ;
CODE_0893E6:         move  r13,r15      ;
CODE_0893E8:         getbs              ;
CODE_0893EA:         inc   r14          ;
CODE_0893EB:         inc   r14          ;
CODE_0893EC:         dec   r4           ;
CODE_0893ED:         bmi CODE_0893F4    ;
CODE_0893EF:         inc   r4           ;
CODE_0893F0:         not                ;
CODE_0893F1:         inc   r0           ;
CODE_0893F2:         add   #08          ;
CODE_0893F4:         to r8              ;
CODE_0893F5:         add   r5           ;
CODE_0893F6:         getbs              ;
CODE_0893F8:         inc   r14          ;
CODE_0893F9:         inc   r14          ;
CODE_0893FA:         to r9              ;
CODE_0893FB:         add   r6           ;
CODE_0893FC:         lms   r0,(000E)    ;
CODE_0893FF:         add   r1           ;
CODE_089400:         to r10             ;
CODE_089401:         xor   r7           ;
CODE_089403:         lms   r0,(0008)    ;
CODE_089406:         to r10             ;
CODE_089407:         xor   r10          ;
CODE_089409:         from r12           ;
CODE_08940A:         and   #01          ;
CODE_08940C:         add   r0           ;
CODE_08940D:         umult #08          ;
CODE_08940F:         to r10             ;
CODE_089410:         add   r10          ;
CODE_089411:         lm    r0,(1974)    ;
CODE_089415:         lms   r2,(000A)    ;
CODE_089418:         and   r2           ;
CODE_089419:         lms   r2,(000C)    ;
CODE_08941C:         umult r2           ;
CODE_08941E:         to r10             ;
CODE_08941F:         xor   r10          ;
CODE_089421:         ibt   r11,#0000    ;
CODE_089423:         from r8            ;
CODE_089424:         stw   (r3)         ;
CODE_089425:         inc   r3           ;
CODE_089426:         inc   r3           ;
CODE_089427:         from r9            ;
CODE_089428:         stw   (r3)         ;
CODE_089429:         inc   r3           ;
CODE_08942A:         inc   r3           ;
CODE_08942B:         from r10           ;
CODE_08942C:         stw   (r3)         ;
CODE_08942D:         inc   r3           ;
CODE_08942E:         inc   r3           ;
CODE_08942F:         from r11           ;
CODE_089430:         stw   (r3)         ;
CODE_089431:         inc   r3           ;
CODE_089432:         loop               ;
CODE_089433:         inc   r3           ;
CODE_089434:         stop               ;
CODE_089435:         nop                ;

CODE_089436:         romb               ;
CODE_089438:         move  r14,r1       ;
CODE_08943A:         dec   r12          ;
CODE_08943B:         bmi CODE_089499    ;
CODE_08943D:         inc   r12          ;
CODE_08943E:         lm    r1,(1972)    ;
CODE_089442:         iwt   r0,#1400     ;
CODE_089445:         add   r1           ;
CODE_089446:         to r2              ;
CODE_089447:         ldw   (r0)         ;
CODE_089448:         iwt   r0,#10E2     ;
CODE_08944B:         add   r1           ;
CODE_08944C:         to r3              ;
CODE_08944D:         ldw   (r0)         ;
CODE_08944E:         iwt   r0,#1182     ;
CODE_089451:         add   r1           ;
CODE_089452:         to r4              ;
CODE_089453:         ldw   (r0)         ;
CODE_089454:         lm    r5,(011C)    ;
CODE_089458:         lm    r6,(011E)    ;
CODE_08945C:         lm    r7,(0120)    ;
CODE_089460:         lm    r8,(0122)    ;
CODE_089464:         cache              ;
CODE_089465:         ibt   r11,#0001    ;
CODE_089467:         move  r13,r15      ;
CODE_089469:         getbs              ;
CODE_08946B:         inc   r14          ;
CODE_08946C:         inc   r14          ;
CODE_08946D:         dec   r2           ;
CODE_08946E:         bmi CODE_089473    ;
CODE_089470:         inc   r2           ;
CODE_089471:         not                ;
CODE_089472:         inc   r0           ;
CODE_089473:         add   r3           ;
CODE_089474:         to r9              ;
CODE_089475:         add   #04          ;
CODE_089477:         getbs              ;
CODE_089479:         inc   r14          ;
CODE_08947A:         inc   r14          ;
CODE_08947B:         add   r4           ;
CODE_08947C:         to r10             ;
CODE_08947D:         add   #04          ;
CODE_08947F:         from r5            ;
CODE_089480:         sub   r9           ;
CODE_089481:         bpl CODE_089486    ;
CODE_089483:         nop                ;
CODE_089484:         not                ;
CODE_089485:         inc   r0           ;
CODE_089486:         from r7            ;
CODE_089487:         sub   r0           ;
CODE_089488:         bmi CODE_089497    ;
CODE_08948A:         nop                ;
CODE_08948B:         from r6            ;
CODE_08948C:         sub   r10          ;
CODE_08948D:         bpl CODE_089492    ;
CODE_08948F:         nop                ;
CODE_089490:         not                ;
CODE_089491:         inc   r0           ;
CODE_089492:         from r8            ;
CODE_089493:         sub   r0           ;
CODE_089494:         bpl CODE_08949B    ;
CODE_089496:         nop                ;
CODE_089497:         loop               ;
CODE_089498:         inc   r11          ;
CODE_089499:         ibt   r11,#FFFF    ;
CODE_08949B:         stop               ;
CODE_08949C:         nop                ;

CODE_08949D:         lm    r1,(1972)    ;
CODE_0894A1:         iwt   r0,#14A2     ;
CODE_0894A4:         add   r1           ;
CODE_0894A5:         ldb   (r0)         ;
CODE_0894A7:         sex                ;
CODE_0894A8:         bmi CODE_089516    ;
CODE_0894AA:         nop                ;
CODE_0894AB:         iwt   r0,#1041     ;
CODE_0894AE:         add   r1           ;
CODE_0894AF:         ldb   (r0)         ;
CODE_0894B1:         lsr                ;
CODE_0894B2:         lsr                ;
CODE_0894B3:         to r12             ;
CODE_0894B4:         lsr                ;
CODE_0894B5:         beq CODE_089516    ;
CODE_0894B7:         nop                ;
CODE_0894B8:         iwt   r0,#1362     ;
CODE_0894BB:         add   r1           ;
CODE_0894BC:         to r2              ;
CODE_0894BD:         ldw   (r0)         ;
CODE_0894BE:         with r2            ;
CODE_0894BF:         add   #04          ;
CODE_0894C1:         iwt   r0,#1042     ;
CODE_0894C4:         add   r1           ;
CODE_0894C5:         ldb   (r0)         ;
CODE_0894C7:         to r3              ;
CODE_0894C8:         and   #0E          ;
CODE_0894CA:         iwt   r4,#01FF     ;
CODE_0894CD:         iwt   r0,#1A36     ;
CODE_0894D0:         add   r1           ;
CODE_0894D1:         to r5              ;
CODE_0894D2:         ldb   (r0)         ;
CODE_0894D4:         iwt   r0,#1A37     ;
CODE_0894D7:         add   r1           ;
CODE_0894D8:         to r6              ;
CODE_0894D9:         ldb   (r0)         ;
CODE_0894DB:         iwt   r7,#FFF0     ;
CODE_0894DE:         iwt   r8,#0200     ;
CODE_0894E1:         iwt   r9,#F1FF     ;
CODE_0894E4:         iwt   r0,#1180     ;
CODE_0894E7:         add   r1           ;
CODE_0894E8:         ldb   (r0)         ;
CODE_0894EA:         to r11             ;
CODE_0894EB:         umult #08          ;
CODE_0894ED:         cache              ;
CODE_0894EE:         move  r13,r15      ;
CODE_0894F0:         to r10             ;
CODE_0894F1:         ldw   (r2)         ;
CODE_0894F2:         from r10           ;
CODE_0894F3:         swap               ;
CODE_0894F4:         and   #0E          ;
CODE_0894F6:         cmp   r3           ;
CODE_0894F8:         beq CODE_0894FE    ;
CODE_0894FA:         from r10           ;
CODE_0894FB:         and   r9           ;
CODE_0894FC:         to r10             ;
CODE_0894FD:         or    r8           ;
CODE_0894FE:         from r6            ;
CODE_0894FF:         sub   #00          ;
CODE_089501:         beq CODE_089510    ;
CODE_089503:         from r10           ;
CODE_089504:         and   r4           ;
CODE_089505:         sub   r11          ;
CODE_089506:         cmp   r5           ;
CODE_089508:         bne CODE_089510    ;
CODE_08950A:         from r10           ;
CODE_08950B:         and   r7           ;
CODE_08950C:         or    #04          ;
CODE_08950E:         and   r9           ;
CODE_08950F:         or    r8           ;
CODE_089510:         stw   (r2)         ;
CODE_089511:         with r2            ;
CODE_089512:         add   #08          ;
CODE_089514:         loop               ;
CODE_089515:         nop                ;
CODE_089516:         stop               ;
CODE_089517:         nop                ;

CODE_089518:         ibt   r0,#0008     ;
CODE_08951A:         romb               ;
CODE_08951C:         lms   r7,(0094)    ;
CODE_08951F:         lms   r8,(009C)    ;
CODE_089522:         iwt   r0,#2000     ;
CODE_089525:         or    r7           ;
CODE_089526:         sm    (1EEE),r0    ;
CODE_08952A:         iwt   r9,#1EF2     ;
CODE_08952D:         cache              ;
CODE_08952E:         ibt   r12,#0020    ;
CODE_089530:         move  r13,r15      ;
CODE_089532:         stw   (r9)         ;
CODE_089533:         inc   r9           ;
CODE_089534:         loop               ;
CODE_089535:         inc   r9           ;
CODE_089536:         with r2            ;
CODE_089537:         swap               ;
CODE_089538:         from r7            ;
CODE_089539:         lsr                ;
CODE_08953A:         lsr                ;
CODE_08953B:         lsr                ;
CODE_08953C:         add   r2           ;
CODE_08953D:         move  r3,r0        ;
CODE_08953F:         and   #0F          ;
CODE_089541:         move  r7,r0        ;
CODE_089543:         from r3            ;
CODE_089544:         lsr                ;
CODE_089545:         lsr                ;
CODE_089546:         lsr                ;
CODE_089547:         lsr                ;
CODE_089548:         to r5              ;
CODE_089549:         and   #07          ;
CODE_08954B:         iwt   r0,#AB90     ;
CODE_08954E:         to r14             ;
CODE_08954F:         add   r5           ;
CODE_089550:         getb               ;
CODE_089551:         move  r2,r0        ;
CODE_089553:         add   r0           ;
CODE_089554:         add   r0           ;
CODE_089555:         add   r0           ;
CODE_089556:         add   r0           ;
CODE_089557:         to r10             ;
CODE_089558:         umult r5           ;
CODE_08955A:         from r2            ;
CODE_08955B:         add   r2           ;
CODE_08955C:         iwt   r6,#2200     ;
CODE_08955F:         add   r6           ;
CODE_089560:         to r6              ;
CODE_089561:         ldw   (r0)         ;
CODE_089562:         from r1            ;
CODE_089563:         to r6              ;
CODE_089564:         fmult              ;
CODE_089565:         from r7            ;
CODE_089566:         umult r2           ;
CODE_089568:         to r4              ;
CODE_089569:         add   r10          ;
CODE_08956A:         iwt   r3,#AC18     ;
CODE_08956D:         iwt   r10,#2000    ;
CODE_089570:         iwt   r11,#1FFF    ;
CODE_089573:         ibt   r12,#0021    ;
CODE_089575:         iwt   r13,#9579    ;
CODE_089578:         from r4            ;
CODE_089579:         lob                ;
CODE_08957A:         add   r0           ;
CODE_08957B:         to r14             ;
CODE_08957C:         add   r3           ;
CODE_08957D:         getb               ;
CODE_08957E:         inc   r14          ;
CODE_08957F:         with r4            ;
CODE_089580:         add   r2           ;
CODE_089581:         inc   r7           ;
CODE_089582:         getbh              ;
CODE_089584:         fmult              ;
CODE_089585:         add   r8           ;
CODE_089586:         and   r11          ;
CODE_089587:         or    r10          ;
CODE_089588:         ibt   r14,#0021    ;
CODE_08958A:         with r14           ;
CODE_08958B:         sub   r12          ;
CODE_08958C:         bne CODE_089596    ;
CODE_08958E:         nop                ;
CODE_08958F:         sm    (1EF0),r0    ;
CODE_089593:         bra CODE_08959A    ;

CODE_089595:         with r7            ;
CODE_089596:         stw   (r9)         ;
CODE_089597:         inc   r9           ;
CODE_089598:         inc   r9           ;
CODE_089599:         with r7            ;
CODE_08959A:         and   #0F          ;
CODE_08959C:         bne CODE_0895B5    ;
CODE_08959E:         nop                ;
CODE_08959F:         inc   r5           ;
CODE_0895A0:         with r5            ;
CODE_0895A1:         and   #07          ;
CODE_0895A3:         iwt   r0,#AB90     ;
CODE_0895A6:         to r14             ;
CODE_0895A7:         add   r5           ;
CODE_0895A8:         getb               ;
CODE_0895A9:         move  r2,r0        ;
CODE_0895AB:         add   r0           ;
CODE_0895AC:         iwt   r6,#2200     ;
CODE_0895AF:         add   r6           ;
CODE_0895B0:         to r6              ;
CODE_0895B1:         ldw   (r0)         ;
CODE_0895B2:         from r1            ;
CODE_0895B3:         to r6              ;
CODE_0895B4:         fmult              ;
CODE_0895B5:         loop               ;
CODE_0895B6:         from r4            ;
CODE_0895B7:         stop               ;
CODE_0895B8:         nop                ;

CODE_0895B9:         lm    r1,(1972)    ;
CODE_0895BD:         iwt   r0,#14A2     ;
CODE_0895C0:         add   r1           ;
CODE_0895C1:         ldb   (r0)         ;
CODE_0895C3:         sex                ;
CODE_0895C4:         bmi CODE_0895F2    ;
CODE_0895C6:         nop                ;
CODE_0895C7:         iwt   r0,#1041     ;
CODE_0895CA:         add   r1           ;
CODE_0895CB:         ldb   (r0)         ;
CODE_0895CD:         lsr                ;
CODE_0895CE:         lsr                ;
CODE_0895CF:         to r12             ;
CODE_0895D0:         lsr                ;
CODE_0895D1:         beq CODE_0895F2    ;
CODE_0895D3:         nop                ;
CODE_0895D4:         iwt   r0,#1978     ;
CODE_0895D7:         add   r1           ;
CODE_0895D8:         to r0              ;
CODE_0895D9:         ldb   (r0)         ;
CODE_0895DB:         to r3              ;
CODE_0895DC:         swap               ;
CODE_0895DD:         iwt   r0,#1362     ;
CODE_0895E0:         add   r1           ;
CODE_0895E1:         to r2              ;
CODE_0895E2:         ldw   (r0)         ;
CODE_0895E3:         from r12           ;
CODE_0895E4:         sub   #01          ;
CODE_0895E6:         add   r0           ;
CODE_0895E7:         add   r0           ;
CODE_0895E8:         add   r0           ;
CODE_0895E9:         add   #04          ;
CODE_0895EB:         to r2              ;
CODE_0895EC:         add   r2           ;
CODE_0895ED:         ldw   (r2)         ;
CODE_0895EE:         or    r3           ;
CODE_0895EF:         xor   r4           ;
CODE_0895F1:         stw   (r2)         ;
CODE_0895F2:         stop               ;
CODE_0895F3:         nop                ;

CODE_0895F4:         romb               ;
CODE_0895F6:         move  r14,r7       ;
CODE_0895F8:         lm    r1,(1972)    ;
CODE_0895FC:         iwt   r0,#1041     ;
CODE_0895FF:         add   r1           ;
CODE_089600:         ldb   (r0)         ;
CODE_089602:         lsr                ;
CODE_089603:         lsr                ;
CODE_089604:         to r12             ;
CODE_089605:         lsr                ;
CODE_089606:         beq CODE_08967B    ;
CODE_089608:         nop                ;
CODE_089609:         iwt   r0,#1978     ;
CODE_08960C:         add   r1           ;
CODE_08960D:         ldb   (r0)         ;
CODE_08960F:         sms   (0000),r0    ;
CODE_089612:         iwt   r0,#1979     ;
CODE_089615:         add   r1           ;
CODE_089616:         ldb   (r0)         ;
CODE_089618:         sms   (0002),r0    ;
CODE_08961B:         iwt   r0,#19D6     ;
CODE_08961E:         add   r1           ;
CODE_08961F:         ldb   (r0)         ;
CODE_089621:         sms   (0004),r0    ;
CODE_089624:         iwt   r0,#1362     ;
CODE_089627:         add   r1           ;
CODE_089628:         to r2              ;
CODE_089629:         ldw   (r0)         ;
CODE_08962A:         from r12           ;
CODE_08962B:         sub   #01          ;
CODE_08962D:         add   r0           ;
CODE_08962E:         add   r0           ;
CODE_08962F:         add   r0           ;
CODE_089630:         add   #04          ;
CODE_089632:         to r2              ;
CODE_089633:         add   r2           ;
CODE_089634:         iwt   r0,#1680     ;
CODE_089637:         add   r1           ;
CODE_089638:         to r7              ;
CODE_089639:         ldw   (r0)         ;
CODE_08963A:         iwt   r0,#1682     ;
CODE_08963D:         add   r1           ;
CODE_08963E:         to r8              ;
CODE_08963F:         ldw   (r0)         ;
CODE_089640:         cache              ;
CODE_089641:         iwt   r5,#0000     ;
CODE_089644:         ibt   r6,#0003     ;
CODE_089646:         iwt   r0,#19D7     ;
CODE_089649:         add   r1           ;
CODE_08964A:         to r12             ;
CODE_08964B:         ldb   (r0)         ;
CODE_08964D:         move  r13,r15      ;
CODE_08964F:         ldb   (r5)         ;
CODE_089651:         inc   r5           ;
CODE_089652:         inc   r5           ;
CODE_089653:         swap               ;
CODE_089654:         bpl CODE_08965A    ;
CODE_089656:         dec   r6           ;
CODE_089657:         bne CODE_08964F    ;
CODE_089659:         nop                ;
CODE_08965A:         to r3              ;
CODE_08965B:         add   r0           ;
CODE_08965C:         ldw   (r2)         ;
CODE_08965D:         or    r3           ;
CODE_08965E:         xor   r4           ;
CODE_089660:         stw   (r2)         ;
CODE_089661:         dec   r2           ;
CODE_089662:         dec   r2           ;
CODE_089663:         ibt   r9,#0003     ;
CODE_089665:         getbs              ;
CODE_089667:         dec   r14          ;
CODE_089668:         add   r8           ;
CODE_089669:         stw   (r2)         ;
CODE_08966A:         dec   r2           ;
CODE_08966B:         dec   r2           ;
CODE_08966C:         getbs              ;
CODE_08966E:         dec   r14          ;
CODE_08966F:         add   r7           ;
CODE_089670:         stw   (r2)         ;
CODE_089671:         with r2            ;
CODE_089672:         sub   #06          ;
CODE_089674:         dec   r9           ;
CODE_089675:         bne CODE_089665    ;
CODE_089677:         nop                ;
CODE_089678:         inc   r2           ;
CODE_089679:         loop               ;
CODE_08967A:         inc   r2           ;
CODE_08967B:         stop               ;
CODE_08967C:         nop                ;

CODE_08967D:         ibt   r0,#0008     ;
CODE_08967F:         romb               ;
CODE_089681:         iwt   r10,#00FF    ;
CODE_089684:         iwt   r6,#3A02     ;
CODE_089687:         ibt   r7,#0004     ;
CODE_089689:         from r2            ;
CODE_08968A:         sub   r1           ;
CODE_08968B:         bpl CODE_08969E    ;
CODE_08968D:         nop                ;
CODE_08968E:         move  r0,r10       ;
CODE_089690:         cache              ;
CODE_089691:         iwt   r12,#00D2    ;
CODE_089694:         move  r13,r15      ;
CODE_089696:         stw   (r6)         ;
CODE_089697:         with r6            ;
CODE_089698:         adc   r7           ;
CODE_08969A:         loop               ;
CODE_08969B:         nop                ;
CODE_08969C:         stop               ;
CODE_08969D:         nop                ;

CODE_08969E:         add   r0           ;
CODE_08969F:         move  r3,r0        ;
CODE_0896A1:         from r2            ;
CODE_0896A2:         sub   r1           ;
CODE_0896A3:         lsr                ;
CODE_0896A4:         to r1              ;
CODE_0896A5:         adc   r1           ;
CODE_0896A7:         ibt   r2,#0004     ;
CODE_0896A9:         iwt   r5,#FF00     ;
CODE_0896AC:         iwt   r8,#AE18     ;
CODE_0896AF:         ibt   r9,#0000     ;
CODE_0896B1:         move  r14,r8       ;
CODE_0896B3:         getb               ;
CODE_0896B4:         cache              ;
CODE_0896B5:         iwt   r12,#00D2    ;
CODE_0896B8:         move  r13,r15      ;
CODE_0896BA:         with r9            ;
CODE_0896BB:         add   r2           ;
CODE_0896BC:         with r9            ;
CODE_0896BD:         lob                ;
CODE_0896BE:         to r14             ;
CODE_0896BF:         from r8            ;
CODE_0896C0:         add   r9           ;
CODE_0896C1:         move  r11,r6       ;
CODE_0896C3:         sex                ;
CODE_0896C4:         move  r6,r3        ;
CODE_0896C6:         lmult              ;
CODE_0896C8:         move  r6,r11       ;
CODE_0896CA:         from r4            ;
CODE_0896CB:         swap               ;
CODE_0896CC:         sex                ;
CODE_0896CD:         to r11             ;
CODE_0896CE:         add   r1           ;
CODE_0896CF:         bmi CODE_0896D8    ;
CODE_0896D1:         from r10           ;
CODE_0896D2:         sub   r11          ;
CODE_0896D3:         bcc CODE_0896D8    ;
CODE_0896D5:         from r5            ;
CODE_0896D6:         from r11           ;
CODE_0896D7:         swap               ;
CODE_0896D8:         stw   (r6)         ;
CODE_0896D9:         with r6            ;
CODE_0896DA:         add   r7           ;
CODE_0896DB:         loop               ;
CODE_0896DC:         getb               ;
CODE_0896DD:         stop               ;
CODE_0896DE:         nop                ;

CODE_0896DF:         ibt   r0,#0008     ;
CODE_0896E1:         romb               ;
CODE_0896E3:         lm    r1,(1972)    ;
CODE_0896E7:         iwt   r0,#1976     ;
CODE_0896EA:         add   r1           ;
CODE_0896EB:         ldw   (r0)         ;
CODE_0896EC:         to r2              ;
CODE_0896ED:         hib                ;
CODE_0896EE:         iwt   r0,#AE18     ;
CODE_0896F1:         to r14             ;
CODE_0896F2:         add   r2           ;
CODE_0896F3:         to r3              ;
CODE_0896F4:         getb               ;
CODE_0896F5:         iwt   r0,#AE58     ;
CODE_0896F8:         to r14             ;
CODE_0896F9:         add   r2           ;
CODE_0896FA:         to r4              ;
CODE_0896FB:         getb               ;
CODE_0896FC:         from r5            ;
CODE_0896FD:         romb               ;
CODE_0896FF:         iwt   r0,#19D6     ;
CODE_089702:         add   r1           ;
CODE_089703:         ldw   (r0)         ;
CODE_089704:         add   r0           ;
CODE_089705:         to r14             ;
CODE_089706:         add   r6           ;
CODE_089707:         cache              ;
CODE_089708:         ibt   r6,#0018     ;
CODE_08970A:         ibt   r7,#001F     ;
CODE_08970C:         iwt   r11,#0000    ;
CODE_08970F:         iwt   r0,#1978     ;
CODE_089712:         add   r1           ;
CODE_089713:         to r5              ;
CODE_089714:         ldw   (r0)         ;
CODE_089715:         iwt   r0,#1041     ;
CODE_089718:         add   r1           ;
CODE_089719:         ldb   (r0)         ;
CODE_08971B:         add   r0           ;
CODE_08971C:         add   r0           ;
CODE_08971D:         add   r0           ;
CODE_08971E:         add   r0           ;
CODE_08971F:         add   r0           ;
CODE_089720:         swap               ;
CODE_089721:         to r9              ;
CODE_089722:         and   r7           ;
CODE_089723:         move  r12,r9       ;
CODE_089725:         move  r13,r15      ;
CODE_089727:         from r5            ;
CODE_089728:         mult  r3           ;
CODE_089729:         add   r0           ;
CODE_08972A:         add   r0           ;
CODE_08972B:         hib                ;
CODE_08972C:         sex                ;
CODE_08972D:         stw   (r11)        ;
CODE_08972E:         inc   r11          ;
CODE_08972F:         inc   r11          ;
CODE_089730:         from r5            ;
CODE_089731:         mult  r4           ;
CODE_089732:         add   r0           ;
CODE_089733:         add   r0           ;
CODE_089734:         hib                ;
CODE_089735:         sex                ;
CODE_089736:         asr                ;
CODE_089737:         stw   (r11)        ;
CODE_089738:         inc   r11          ;
CODE_089739:         with r5            ;
CODE_08973A:         add   r6           ;
CODE_08973B:         loop               ;
CODE_08973C:         inc   r11          ;
CODE_08973D:         from r2            ;
CODE_08973E:         sex                ;
CODE_08973F:         bpl CODE_08974E    ;
CODE_089741:         nop                ;
CODE_089742:         with r11           ;
CODE_089743:         sub   #02          ;
CODE_089745:         from r11           ;
CODE_089746:         to r10             ;
CODE_089747:         sub   #02          ;
CODE_089749:         ibt   r7,#FFFC     ;
CODE_08974B:         bra CODE_089754    ;

CODE_08974D:         nop                ;
CODE_08974E:         ibt   r10,#0000    ;
CODE_089750:         ibt   r11,#0002    ;
CODE_089752:         ibt   r7,#0004     ;
CODE_089754:         to r6              ;
CODE_089755:         getb               ;
CODE_089756:         inc   r14          ;
CODE_089757:         iwt   r0,#1180     ;
CODE_08975A:         add   r1           ;
CODE_08975B:         ldb   (r0)         ;
CODE_08975D:         add   r0           ;
CODE_08975E:         add   r0           ;
CODE_08975F:         to r3              ;
CODE_089760:         add   r0           ;
CODE_089761:         iwt   r0,#1042     ;
CODE_089764:         add   r1           ;
CODE_089765:         ldb   (r0)         ;
CODE_089767:         swap               ;
CODE_089768:         to r3              ;
CODE_089769:         or    r3           ;
CODE_08976A:         from r6            ;
CODE_08976B:         getbh              ;
CODE_08976D:         to r6              ;
CODE_08976E:         add   r3           ;
CODE_08976F:         iwt   r0,#1680     ;
CODE_089772:         add   r1           ;
CODE_089773:         ldw   (r0)         ;
CODE_089774:         to r3              ;
CODE_089775:         add   #08          ;
CODE_089777:         iwt   r0,#1682     ;
CODE_08977A:         add   r1           ;
CODE_08977B:         ldw   (r0)         ;
CODE_08977C:         to r4              ;
CODE_08977D:         add   #08          ;
CODE_08977F:         iwt   r0,#1362     ;
CODE_089782:         add   r1           ;
CODE_089783:         to r5              ;
CODE_089784:         ldw   (r0)         ;
CODE_089785:         ibt   r8,#0000     ;
CODE_089787:         move  r12,r9       ;
CODE_089789:         move  r13,r15      ;
CODE_08978B:         ldw   (r11)        ;
CODE_08978C:         xor   r8           ;
CODE_08978E:         bpl CODE_089798    ;
CODE_089790:         nop                ;
CODE_089791:         lm    r5,(0092)    ;
CODE_089795:         to r8              ;
CODE_089796:         xor   r8           ;
CODE_089798:         ldw   (r10)        ;
CODE_089799:         add   r3           ;
CODE_08979A:         sub   #08          ;
CODE_08979C:         stw   (r5)         ;
CODE_08979D:         inc   r5           ;
CODE_08979E:         inc   r5           ;
CODE_08979F:         ldw   (r11)        ;
CODE_0897A0:         add   r4           ;
CODE_0897A1:         sub   #08          ;
CODE_0897A3:         stw   (r5)         ;
CODE_0897A4:         inc   r5           ;
CODE_0897A5:         inc   r5           ;
CODE_0897A6:         from r6            ;
CODE_0897A7:         stw   (r5)         ;
CODE_0897A8:         inc   r5           ;
CODE_0897A9:         inc   r5           ;
CODE_0897AA:         ibt   r0,#0002     ;
CODE_0897AC:         stw   (r5)         ;
CODE_0897AD:         inc   r5           ;
CODE_0897AE:         with r10           ;
CODE_0897AF:         add   r7           ;
CODE_0897B0:         with r11           ;
CODE_0897B1:         add   r7           ;
CODE_0897B2:         loop               ;
CODE_0897B3:         inc   r5           ;
CODE_0897B4:         from r8            ;
CODE_0897B5:         add   r8           ;
CODE_0897B6:         bcc CODE_0897BD    ;
CODE_0897B8:         nop                ;
CODE_0897B9:         sm    (0092),r5    ;
CODE_0897BD:         iwt   r0,#1CD6     ;
CODE_0897C0:         add   r1           ;
CODE_0897C1:         to r3              ;
CODE_0897C2:         ldw   (r0)         ;
CODE_0897C3:         iwt   r0,#1CD8     ;
CODE_0897C6:         add   r1           ;
CODE_0897C7:         ldw   (r0)         ;
CODE_0897C8:         to r4              ;
CODE_0897C9:         add   #03          ;
CODE_0897CB:         ibt   r10,#0000    ;
CODE_0897CD:         ibt   r11,#0002    ;
CODE_0897CF:         ibt   r8,#0010     ;
CODE_0897D1:         move  r12,r9       ;
CODE_0897D3:         move  r13,r15      ;
CODE_0897D5:         to r5              ;
CODE_0897D6:         ldw   (r11)        ;
CODE_0897D7:         from r5            ;
CODE_0897D8:         add   #08          ;
CODE_0897DA:         cmp   r8           ;
CODE_0897DC:         bcs CODE_08980D    ;
CODE_0897DE:         nop                ;
CODE_0897DF:         lm    r0,(0122)    ;
CODE_0897E3:         to r6              ;
CODE_0897E4:         add   #03          ;
CODE_0897E6:         lm    r7,(011E)    ;
CODE_0897EA:         from r5            ;
CODE_0897EB:         add   r4           ;
CODE_0897EC:         sub   r7           ;
CODE_0897ED:         bpl CODE_0897F2    ;
CODE_0897EF:         nop                ;
CODE_0897F0:         not                ;
CODE_0897F1:         inc   r0           ;
CODE_0897F2:         sub   r6           ;
CODE_0897F3:         bpl CODE_08980D    ;
CODE_0897F5:         nop                ;
CODE_0897F6:         lm    r0,(0120)    ;
CODE_0897FA:         to r6              ;
CODE_0897FB:         add   #04          ;
CODE_0897FD:         lm    r7,(011C)    ;
CODE_089801:         ldw   (r10)        ;
CODE_089802:         add   r3           ;
CODE_089803:         sub   r7           ;
CODE_089804:         bpl CODE_089809    ;
CODE_089806:         nop                ;
CODE_089807:         not                ;
CODE_089808:         inc   r0           ;
CODE_089809:         sub   r6           ;
CODE_08980A:         bmi CODE_089817    ;
CODE_08980C:         nop                ;
CODE_08980D:         with r10           ;
CODE_08980E:         add   #04          ;
CODE_089810:         with r11           ;
CODE_089811:         add   #04          ;
CODE_089813:         loop               ;
CODE_089814:         nop                ;
CODE_089815:         stop               ;
CODE_089816:         nop                ;

CODE_089817:         ibt   r2,#FFFF     ;
CODE_089819:         iwt   r0,#1D36     ;
CODE_08981C:         add   r1           ;
CODE_08981D:         from r2            ;
CODE_08981E:         stb   (r0)         ;
CODE_089820:         stop               ;
CODE_089821:         nop                ;

CODE_089822:         romb               ;
CODE_089824:         sms   (0000),r1    ;
CODE_089827:         sms   (0002),r2    ;
CODE_08982A:         sms   (0004),r3    ;
CODE_08982D:         sms   (0006),r4    ;
CODE_089830:         ibt   r6,#0012     ;
CODE_089832:         lm    r2,(1972)    ;
CODE_089836:         iwt   r0,#1041     ;
CODE_089839:         add   r2           ;
CODE_08983A:         ldb   (r0)         ;
CODE_08983C:         lsr                ;
CODE_08983D:         lsr                ;
CODE_08983E:         lsr                ;
CODE_08983F:         to r12             ;
CODE_089840:         sub   r6           ;
CODE_089841:         from r12           ;
CODE_089842:         umult #05          ;
CODE_089844:         umult r1           ;
CODE_089846:         to r14             ;
CODE_089847:         add   r5           ;
CODE_089848:         iwt   r0,#1180     ;
CODE_08984B:         add   r2           ;
CODE_08984C:         to r1              ;
CODE_08984D:         ldb   (r0)         ;
CODE_08984F:         with r1            ;
CODE_089850:         umult #08          ;
CODE_089852:         iwt   r0,#1362     ;
CODE_089855:         add   r2           ;
CODE_089856:         to r3              ;
CODE_089857:         ldw   (r0)         ;
CODE_089858:         iwt   r0,#1400     ;
CODE_08985B:         add   r2           ;
CODE_08985C:         to r4              ;
CODE_08985D:         ldw   (r0)         ;
CODE_08985E:         from r4            ;
CODE_08985F:         swap               ;
CODE_089860:         add   r0           ;
CODE_089861:         add   r0           ;
CODE_089862:         add   r0           ;
CODE_089863:         add   r0           ;
CODE_089864:         add   r0           ;
CODE_089865:         sms   (0008),r0    ;
CODE_089868:         iwt   r0,#1680     ;
CODE_08986B:         add   r2           ;
CODE_08986C:         to r5              ;
CODE_08986D:         ldw   (r0)         ;
CODE_08986E:         iwt   r0,#1682     ;
CODE_089871:         add   r2           ;
CODE_089872:         to r6              ;
CODE_089873:         ldw   (r0)         ;
CODE_089874:         iwt   r0,#1042     ;
CODE_089877:         add   r2           ;
CODE_089878:         to r7              ;
CODE_089879:         ldw   (r0)         ;
CODE_08987A:         with r7            ;
CODE_08987B:         swap               ;
CODE_08987C:         cache              ;
CODE_08987D:         move  r13,r15      ;
CODE_08987F:         getbs              ;
CODE_089881:         inc   r14          ;
CODE_089882:         dec   r4           ;
CODE_089883:         bmi CODE_089888    ;
CODE_089885:         inc   r4           ;
CODE_089886:         not                ;
CODE_089887:         inc   r0           ;
CODE_089888:         to r8              ;
CODE_089889:         add   r5           ;
CODE_08988A:         getbs              ;
CODE_08988C:         inc   r14          ;
CODE_08988D:         to r9              ;
CODE_08988E:         add   r6           ;
CODE_08988F:         getb               ;
CODE_089890:         inc   r14          ;
CODE_089891:         getbh              ;
CODE_089893:         inc   r14          ;
CODE_089894:         add   r1           ;
CODE_089895:         to r10             ;
CODE_089896:         xor   r7           ;
CODE_089898:         lms   r0,(0008)    ;
CODE_08989B:         to r10             ;
CODE_08989C:         xor   r10          ;
CODE_08989E:         to r11             ;
CODE_08989F:         getb               ;
CODE_0898A0:         inc   r14          ;
CODE_0898A1:         dec   r11          ;
CODE_0898A2:         bpl CODE_0898AC    ;
CODE_0898A4:         inc   r11          ;
CODE_0898A5:         dec   r4           ;
CODE_0898A6:         bmi CODE_0898AC    ;
CODE_0898A8:         inc   r4           ;
CODE_0898A9:         with r8            ;
CODE_0898AA:         add   #08          ;
CODE_0898AC:         from r8            ;
CODE_0898AD:         stw   (r3)         ;
CODE_0898AE:         inc   r3           ;
CODE_0898AF:         inc   r3           ;
CODE_0898B0:         from r9            ;
CODE_0898B1:         stw   (r3)         ;
CODE_0898B2:         inc   r3           ;
CODE_0898B3:         inc   r3           ;
CODE_0898B4:         from r10           ;
CODE_0898B5:         stw   (r3)         ;
CODE_0898B6:         inc   r3           ;
CODE_0898B7:         inc   r3           ;
CODE_0898B8:         from r11           ;
CODE_0898B9:         stw   (r3)         ;
CODE_0898BA:         inc   r3           ;
CODE_0898BB:         loop               ;
CODE_0898BC:         inc   r3           ;
CODE_0898BD:         iwt   r15,#93D6    ;
CODE_0898C0:         nop                ;
CODE_0898C1:         romb               ;
CODE_0898C3:         move  r14,r1       ;
CODE_0898C5:         lm    r1,(1972)    ;
CODE_0898C9:         iwt   r0,#1362     ;
CODE_0898CC:         add   r1           ;
CODE_0898CD:         to r3              ;
CODE_0898CE:         ldw   (r0)         ;
CODE_0898CF:         iwt   r0,#1680     ;
CODE_0898D2:         add   r1           ;
CODE_0898D3:         to r4              ;
CODE_0898D4:         ldw   (r0)         ;
CODE_0898D5:         iwt   r0,#1682     ;
CODE_0898D8:         add   r1           ;
CODE_0898D9:         to r5              ;
CODE_0898DA:         ldw   (r0)         ;
CODE_0898DB:         iwt   r0,#1400     ;
CODE_0898DE:         add   r1           ;
CODE_0898DF:         to r9              ;
CODE_0898E0:         ldw   (r0)         ;
CODE_0898E1:         iwt   r0,#1180     ;
CODE_0898E4:         add   r1           ;
CODE_0898E5:         ldb   (r0)         ;
CODE_0898E7:         add   r0           ;
CODE_0898E8:         add   r0           ;
CODE_0898E9:         to r7              ;
CODE_0898EA:         add   r0           ;
CODE_0898EB:         iwt   r0,#1042     ;
CODE_0898EE:         add   r1           ;
CODE_0898EF:         ldw   (r0)         ;
CODE_0898F0:         to r8              ;
CODE_0898F1:         swap               ;
CODE_0898F2:         from r9            ;
CODE_0898F3:         swap               ;
CODE_0898F4:         add   r0           ;
CODE_0898F5:         add   r0           ;
CODE_0898F6:         add   r0           ;
CODE_0898F7:         add   r0           ;
CODE_0898F8:         add   r0           ;
CODE_0898F9:         to r8              ;
CODE_0898FA:         xor   r8           ;
CODE_0898FC:         cache              ;
CODE_0898FD:         iwt   r0,#1402     ;
CODE_089900:         add   r1           ;
CODE_089901:         ldw   (r0)         ;
CODE_089902:         dec   r0           ;
CODE_089903:         bpl CODE_089932    ;
CODE_089905:         nop                ;
CODE_089906:         ibt   r12,#0002    ;
CODE_089908:         move  r13,r15      ;
CODE_08990A:         getbs              ;
CODE_08990C:         inc   r14          ;
CODE_08990D:         dec   r9           ;
CODE_08990E:         bmi CODE_089915    ;
CODE_089910:         inc   r9           ;
CODE_089911:         not                ;
CODE_089912:         inc   r0           ;
CODE_089913:         add   #08          ;
CODE_089915:         add   r4           ;
CODE_089916:         stw   (r3)         ;
CODE_089917:         inc   r3           ;
CODE_089918:         inc   r3           ;
CODE_089919:         getbs              ;
CODE_08991B:         inc   r14          ;
CODE_08991C:         add   r5           ;
CODE_08991D:         sub   #08          ;
CODE_08991F:         stw   (r3)         ;
CODE_089920:         inc   r3           ;
CODE_089921:         inc   r3           ;
CODE_089922:         getb               ;
CODE_089923:         inc   r14          ;
CODE_089924:         getbh              ;
CODE_089926:         inc   r14          ;
CODE_089927:         or    r7           ;
CODE_089928:         xor   r8           ;
CODE_08992A:         stw   (r3)         ;
CODE_08992B:         with r3            ;
CODE_08992C:         add   #04          ;
CODE_08992E:         loop               ;
CODE_08992F:         nop                ;
CODE_089930:         stop               ;
CODE_089931:         nop                ;

CODE_089932:         iwt   r0,#1976     ;
CODE_089935:         add   r1           ;
CODE_089936:         to r6              ;
CODE_089937:         ldw   (r0)         ;
CODE_089938:         ibt   r12,#0002    ;
CODE_08993A:         move  r13,r15      ;
CODE_08993C:         getbs              ;
CODE_08993E:         inc   r14          ;
CODE_08993F:         dec   r9           ;
CODE_089940:         bmi CODE_089947    ;
CODE_089942:         inc   r9           ;
CODE_089943:         not                ;
CODE_089944:         inc   r0           ;
CODE_089945:         add   #08          ;
CODE_089947:         add   r4           ;
CODE_089948:         stw   (r3)         ;
CODE_089949:         inc   r3           ;
CODE_08994A:         inc   r3           ;
CODE_08994B:         getb               ;
CODE_08994C:         inc   r14          ;
CODE_08994D:         swap               ;
CODE_08994E:         fmult              ;
CODE_08994F:         add   r5           ;
CODE_089950:         stw   (r3)         ;
CODE_089951:         inc   r3           ;
CODE_089952:         inc   r3           ;
CODE_089953:         getb               ;
CODE_089954:         inc   r14          ;
CODE_089955:         getbh              ;
CODE_089957:         inc   r14          ;
CODE_089958:         or    r7           ;
CODE_089959:         xor   r8           ;
CODE_08995B:         stw   (r3)         ;
CODE_08995C:         with r3            ;
CODE_08995D:         add   #04          ;
CODE_08995F:         loop               ;
CODE_089960:         nop                ;
CODE_089961:         iwt   r0,#FE00     ;
CODE_089964:         dec   r9           ;
CODE_089965:         bmi CODE_08996A    ;
CODE_089967:         inc   r9           ;
CODE_089968:         not                ;
CODE_089969:         inc   r0           ;
CODE_08996A:         fmult              ;
CODE_08996B:         add   r4           ;
CODE_08996C:         stw   (r3)         ;
CODE_08996D:         inc   r3           ;
CODE_08996E:         inc   r3           ;
CODE_08996F:         iwt   r0,#FB00     ;
CODE_089972:         fmult              ;
CODE_089973:         add   r5           ;
CODE_089974:         stw   (r3)         ;
CODE_089975:         inc   r3           ;
CODE_089976:         inc   r3           ;
CODE_089977:         iwt   r0,#0400     ;
CODE_08997A:         or    r7           ;
CODE_08997B:         or    r2           ;
CODE_08997C:         xor   r8           ;
CODE_08997E:         stw   (r3)         ;
CODE_08997F:         stop               ;
CODE_089980:         nop                ;

CODE_089981:         ibt   r0,#0008     ;
CODE_089983:         romb               ;
CODE_089985:         iwt   r6,#99E9     ;
CODE_089988:         from r6            ;
CODE_089989:         to r14             ;
CODE_08998A:         add   r5           ;
CODE_08998B:         ibt   r0,#0001     ;
CODE_08998D:         cmode              ;
CODE_08998F:         ibt   r8,#0007     ;
CODE_089991:         ibt   r9,#003F     ;
CODE_089993:         ibt   r11,#0008    ;
CODE_089995:         ibt   r0,#0000     ;
CODE_089997:         color              ;
CODE_089998:         cache              ;
CODE_089999:         move  r13,r15      ;
CODE_08999B:         to r7              ;
CODE_08999C:         getb               ;
CODE_08999D:         inc   r5           ;
CODE_08999E:         with r5            ;
CODE_08999F:         and   r9           ;
CODE_0899A0:         from r6            ;
CODE_0899A1:         to r14             ;
CODE_0899A2:         add   r5           ;
CODE_0899A3:         from r7            ;
CODE_0899A4:         lsr                ;
CODE_0899A5:         lsr                ;
CODE_0899A6:         lsr                ;
CODE_0899A7:         to r10             ;
CODE_0899A8:         add   r3           ;
CODE_0899A9:         from r7            ;
CODE_0899AA:         and   #07          ;
CODE_0899AC:         to r2              ;
CODE_0899AD:         add   r4           ;
CODE_0899AE:         move  r1,r10       ;
CODE_0899B0:         plot               ;
CODE_0899B1:         with r1            ;
CODE_0899B2:         add   r8           ;
CODE_0899B3:         plot               ;
CODE_0899B4:         with r1            ;
CODE_0899B5:         add   r8           ;
CODE_0899B6:         plot               ;
CODE_0899B7:         with r1            ;
CODE_0899B8:         add   r8           ;
CODE_0899B9:         plot               ;
CODE_0899BA:         move  r1,r10       ;
CODE_0899BC:         with r2            ;
CODE_0899BD:         add   r11          ;
CODE_0899BE:         plot               ;
CODE_0899BF:         with r1            ;
CODE_0899C0:         add   r8           ;
CODE_0899C1:         plot               ;
CODE_0899C2:         with r1            ;
CODE_0899C3:         add   r8           ;
CODE_0899C4:         plot               ;
CODE_0899C5:         with r1            ;
CODE_0899C6:         add   r8           ;
CODE_0899C7:         plot               ;
CODE_0899C8:         move  r1,r10       ;
CODE_0899CA:         with r2            ;
CODE_0899CB:         add   r11          ;
CODE_0899CC:         plot               ;
CODE_0899CD:         with r1            ;
CODE_0899CE:         add   r8           ;
CODE_0899CF:         plot               ;
CODE_0899D0:         with r1            ;
CODE_0899D1:         add   r8           ;
CODE_0899D2:         plot               ;
CODE_0899D3:         with r1            ;
CODE_0899D4:         add   r8           ;
CODE_0899D5:         plot               ;
CODE_0899D6:         move  r1,r10       ;
CODE_0899D8:         with r2            ;
CODE_0899D9:         add   r11          ;
CODE_0899DA:         plot               ;
CODE_0899DB:         with r1            ;
CODE_0899DC:         add   r8           ;
CODE_0899DD:         plot               ;
CODE_0899DE:         with r1            ;
CODE_0899DF:         add   r8           ;
CODE_0899E0:         plot               ;
CODE_0899E1:         with r1            ;
CODE_0899E2:         add   r8           ;
CODE_0899E3:         loop               ;
CODE_0899E4:         plot               ;
CODE_0899E5:         rpix               ;
CODE_0899E7:         stop               ;
CODE_0899E8:         nop                ;

CODE_0899E9:         bge CODE_089A1D    ;
CODE_0899EB:         nop                ;
CODE_0899EC:         bvc CODE_089A2C    ;
CODE_0899EE:         stw   (r3)         ;
CODE_0899EF:         stw   (r7)         ;
CODE_0899F0:         to r3              ;
CODE_0899F1:         to    r3           ;
CODE_0899F1:         to r12             ;
CODE_0899F2:         to    r12          ;
CODE_0899F2:         bvs CODE_089A23    ;
CODE_0899F4:         move  r0,r5        ;
CODE_0899F6:         bmi CODE_089A0C    ;
CODE_0899F8:         stw   (r8)         ;
CODE_0899F9:         stw   (r1)         ;
CODE_0899FA:         lsr                ;
CODE_0899FB:         rol                ;
CODE_0899FC:         move  r10,r2       ;
CODE_0899FE:         move  r11,r8       ;
CODE_089A00:         to r13             ;
CODE_089A01:         to r1              ;
CODE_089A02:         stw   (r4)         ;
CODE_089A03:         move  r2,r1        ;
CODE_089A05:         cache              ;
CODE_089A06:         stw   (r9)         ;
CODE_089A07:         beq CODE_089A32    ;
CODE_089A09:         blt CODE_089A45    ;
CODE_089A0B:         with r13           ;
CODE_089A0C:         stw   (r11)        ;
CODE_089A0D:         move  r6,r11       ;
CODE_089A11:         move  r7,r3        ;
CODE_089A15:         with r12           ;
CODE_089A16:         loop               ;
CODE_089A17:         stw   (r0)         ;
CODE_089A18:         bra CODE_089A50    ;

CODE_089A1A:         bpl CODE_089A31    ;
CODE_089A1C:         with r0            ;
CODE_089A1D:         stop               ;
CODE_089A1E:         to r15             ;
CODE_089A1F:         to    r15          ;
CODE_089A1F:         with r6            ;
CODE_089A20:         with  r6           ;
CODE_089A20:         with r14           ;
CODE_089A21:         with  r14          ;
CODE_089A21:         with r7            ;
CODE_089A22:         with  r7           ;
CODE_089A22:         bcs CODE_089A2C    ;
CODE_089A24:         to r14             ;
CODE_089A25:         stw   (r5)         ;
CODE_089A26:         to r9              ;
CODE_089A27:         to    r9           ;
CODE_089A27:         to r8              ;
CODE_089A28:         to    r8           ;
CODE_089A28:         bcc CODE_0899CA    ;
CODE_089A2A:         nop                ;
CODE_089A2B:         cmode              ;
CODE_089A2D:         move  r3,r1        ;
CODE_089A2F:         ibt   r4,#0000     ;
CODE_089A31:         ibt   r5,#001F     ;
CODE_089A33:         ibt   r0,#0000     ;
CODE_089A35:         color              ;
CODE_089A36:         plot               ;
CODE_089A37:         iwt   r12,#0400    ;
CODE_089A3A:         move  r13,r15      ;
CODE_089A3C:         inc   r4           ;
CODE_089A3D:         with r4            ;
CODE_089A3E:         and   r5           ;
CODE_089A3F:         bne CODE_089A45    ;
CODE_089A41:         nop                ;
CODE_089A42:         move  r1,r3        ;
CODE_089A44:         inc   r2           ;
CODE_089A45:         loop               ;
CODE_089A46:         plot               ;
CODE_089A47:         rpix               ;
CODE_089A49:         stop               ;
CODE_089A4A:         nop                ;

CODE_089A4B:         ibt   r0,#0004     ;
CODE_089A4D:         and   r8           ;
CODE_089A4E:         ibt   r1,#0001     ;
CODE_089A50:         or    r1           ;
CODE_089A51:         cmode              ;
CODE_089A53:         move  r8,r12       ;
CODE_089A55:         ibt   r9,#003F     ;
CODE_089A57:         ibt   r0,#0008     ;
CODE_089A59:         romb               ;
CODE_089A5B:         iwt   r10,#99E9    ;
CODE_089A5E:         from r10           ;
CODE_089A5F:         to r14             ;
CODE_089A60:         add   r5           ;
CODE_089A61:         ibt   r11,#0000    ;
CODE_089A63:         getb               ;
CODE_089A64:         cache              ;
CODE_089A65:         move  r13,r15      ;
CODE_089A67:         inc   r5           ;
CODE_089A68:         with r5            ;
CODE_089A69:         and   r9           ;
CODE_089A6A:         from r10           ;
CODE_089A6B:         to r14             ;
CODE_089A6C:         add   r5           ;
CODE_089A6D:         stb   (r11)        ;
CODE_089A6F:         inc   r11          ;
CODE_089A70:         loop               ;
CODE_089A71:         getb               ;
CODE_089A72:         from r7            ;
CODE_089A73:         romb               ;
CODE_089A75:         ibt   r10,#0007    ;
CODE_089A77:         ibt   r11,#0000    ;
CODE_089A79:         cache              ;
CODE_089A7A:         move  r12,r8       ;
CODE_089A7C:         move  r13,r15      ;
CODE_089A7E:         ibt   r5,#0003     ;
CODE_089A80:         to r9              ;
CODE_089A81:         ldb   (r11)        ;
CODE_089A83:         inc   r11          ;
CODE_089A84:         from r9            ;
CODE_089A85:         and   r10          ;
CODE_089A86:         to r8              ;
CODE_089A87:         swap               ;
CODE_089A88:         from r9            ;
CODE_089A89:         lsr                ;
CODE_089A8A:         lsr                ;
CODE_089A8B:         lsr                ;
CODE_089A8C:         or    r8           ;
CODE_089A8D:         move  r9,r0        ;
CODE_089A8F:         to r14             ;
CODE_089A90:         add   r6           ;
CODE_089A91:         from r9            ;
CODE_089A92:         lob                ;
CODE_089A93:         to r1              ;
CODE_089A94:         add   r3           ;
CODE_089A95:         from r9            ;
CODE_089A96:         hib                ;
CODE_089A97:         to r2              ;
CODE_089A98:         add   r4           ;
CODE_089A99:         getc               ;
CODE_089A9A:         plot               ;
CODE_089A9B:         with r14           ;
CODE_089A9C:         add   r10          ;
CODE_089A9D:         inc   r14          ;
CODE_089A9E:         with r1            ;
CODE_089A9F:         add   r10          ;
CODE_089AA0:         getc               ;
CODE_089AA1:         plot               ;
CODE_089AA2:         with r14           ;
CODE_089AA3:         add   r10          ;
CODE_089AA4:         inc   r14          ;
CODE_089AA5:         with r1            ;
CODE_089AA6:         add   r10          ;
CODE_089AA7:         getc               ;
CODE_089AA8:         plot               ;
CODE_089AA9:         with r14           ;
CODE_089AAA:         add   r10          ;
CODE_089AAB:         inc   r14          ;
CODE_089AAC:         with r1            ;
CODE_089AAD:         add   r10          ;
CODE_089AAE:         getc               ;
CODE_089AAF:         plot               ;
CODE_089AB0:         iwt   r0,#07E8     ;
CODE_089AB3:         with r14           ;
CODE_089AB4:         add   r0           ;
CODE_089AB5:         ibt   r0,#0019     ;
CODE_089AB7:         with r1            ;
CODE_089AB8:         sub   r0           ;
CODE_089AB9:         with r2            ;
CODE_089ABA:         add   r10          ;
CODE_089ABB:         inc   r2           ;
CODE_089ABC:         dec   r5           ;
CODE_089ABD:         bpl CODE_089A99    ;
CODE_089ABF:         nop                ;
CODE_089AC0:         loop               ;
CODE_089AC1:         nop                ;
CODE_089AC2:         rpix               ;
CODE_089AC4:         stop               ;
CODE_089AC5:         nop                ;

CODE_089AC6:         cache              ;
CODE_089AC7:         iwt   r0,#0008     ;
CODE_089ACA:         romb               ;
CODE_089ACC:         lm    r1,(1972)    ;
CODE_089AD0:         iwt   r0,#1977     ;
CODE_089AD3:         add   r1           ;
CODE_089AD4:         to r9              ;
CODE_089AD5:         ldb   (r0)         ;
CODE_089AD7:         from r9            ;
CODE_089AD8:         not                ;
CODE_089AD9:         to r2              ;
CODE_089ADA:         lob                ;
CODE_089ADB:         iwt   r0,#AE18     ;
CODE_089ADE:         to r14             ;
CODE_089ADF:         add   r2           ;
CODE_089AE0:         from r9            ;
CODE_089AE1:         lsr                ;
CODE_089AE2:         lsr                ;
CODE_089AE3:         to r9              ;
CODE_089AE4:         lsr                ;
CODE_089AE5:         iwt   r4,#AE58     ;
CODE_089AE8:         getbs              ;
CODE_089AEA:         from r4            ;
CODE_089AEB:         to r14             ;
CODE_089AEC:         add   r2           ;
CODE_089AED:         div2               ;
CODE_089AEF:         to r3              ;
CODE_089AF0:         div2               ;
CODE_089AF2:         getbs              ;
CODE_089AF4:         div2               ;
CODE_089AF6:         to r4              ;
CODE_089AF7:         div2               ;
CODE_089AF9:         iwt   r0,#1362     ;
CODE_089AFC:         add   r1           ;
CODE_089AFD:         to r2              ;
CODE_089AFE:         ldw   (r0)         ;
CODE_089AFF:         from r2            ;
CODE_089B00:         to r5              ;
CODE_089B01:         add   #04          ;
CODE_089B03:         iwt   r7,#FE00     ;
CODE_089B06:         lms   r6,(0008)    ;
CODE_089B09:         ldw   (r5)         ;
CODE_089B0A:         and   r7           ;
CODE_089B0B:         or    r6           ;
CODE_089B0C:         stw   (r5)         ;
CODE_089B0D:         with r5            ;
CODE_089B0E:         add   #08          ;
CODE_089B10:         lms   r6,(000A)    ;
CODE_089B13:         ldw   (r5)         ;
CODE_089B14:         and   r7           ;
CODE_089B15:         or    r6           ;
CODE_089B16:         stw   (r5)         ;
CODE_089B17:         with r5            ;
CODE_089B18:         add   #08          ;
CODE_089B1A:         ibt   r6,#0000     ;
CODE_089B1C:         ibt   r12,#0008    ;
CODE_089B1E:         move  r13,r15      ;
CODE_089B20:         with r6            ;
CODE_089B21:         and   #06          ;
CODE_089B23:         to r8              ;
CODE_089B24:         ldw   (r6)         ;
CODE_089B25:         ldw   (r5)         ;
CODE_089B26:         and   r7           ;
CODE_089B27:         or    r8           ;
CODE_089B28:         stw   (r5)         ;
CODE_089B29:         with r5            ;
CODE_089B2A:         add   #08          ;
CODE_089B2C:         inc   r6           ;
CODE_089B2D:         loop               ;
CODE_089B2E:         inc   r6           ;
CODE_089B2F:         from r2            ;
CODE_089B30:         to r5              ;
CODE_089B31:         add   #02          ;
CODE_089B33:         ldw   (r5)         ;
CODE_089B34:         add   r9           ;
CODE_089B35:         stw   (r5)         ;
CODE_089B36:         with r5            ;
CODE_089B37:         add   #08          ;
CODE_089B39:         ldw   (r5)         ;
CODE_089B3A:         add   r9           ;
CODE_089B3B:         stw   (r5)         ;
CODE_089B3C:         iwt   r0,#0010     ;
CODE_089B3F:         to r5              ;
CODE_089B40:         add   r2           ;
CODE_089B41:         iwt   r0,#0030     ;
CODE_089B44:         to r6              ;
CODE_089B45:         add   r2           ;
CODE_089B46:         ibt   r12,#0004    ;
CODE_089B48:         move  r13,r15      ;
CODE_089B4A:         ldw   (r5)         ;
CODE_089B4B:         sub   r4           ;
CODE_089B4C:         stw   (r5)         ;
CODE_089B4D:         inc   r5           ;
CODE_089B4E:         inc   r5           ;
CODE_089B4F:         ldw   (r5)         ;
CODE_089B50:         sub   r3           ;
CODE_089B51:         stw   (r5)         ;
CODE_089B52:         with r5            ;
CODE_089B53:         add   #06          ;
CODE_089B55:         ldw   (r6)         ;
CODE_089B56:         add   r4           ;
CODE_089B57:         stw   (r6)         ;
CODE_089B58:         inc   r6           ;
CODE_089B59:         inc   r6           ;
CODE_089B5A:         ldw   (r6)         ;
CODE_089B5B:         sub   r3           ;
CODE_089B5C:         stw   (r6)         ;
CODE_089B5D:         with r6            ;
CODE_089B5E:         add   #06          ;
CODE_089B60:         loop               ;
CODE_089B61:         nop                ;
CODE_089B62:         stop               ;
CODE_089B63:         nop                ;

CODE_089B64:         romb               ;
CODE_089B66:         move  r14,r10      ;
CODE_089B68:         cache              ;
CODE_089B69:         lm    r1,(1972)    ;
CODE_089B6D:         iwt   r0,#1362     ;
CODE_089B70:         add   r1           ;
CODE_089B71:         to r2              ;
CODE_089B72:         ldw   (r0)         ;
CODE_089B73:         iwt   r0,#1400     ;
CODE_089B76:         add   r1           ;
CODE_089B77:         to r3              ;
CODE_089B78:         ldw   (r0)         ;
CODE_089B79:         iwt   r0,#1042     ;
CODE_089B7C:         add   r1           ;
CODE_089B7D:         ldw   (r0)         ;
CODE_089B7E:         lsr                ;
CODE_089B7F:         lsr                ;
CODE_089B80:         lsr                ;
CODE_089B81:         lsr                ;
CODE_089B82:         lsr                ;
CODE_089B83:         lsr                ;
CODE_089B84:         to r4              ;
CODE_089B85:         and   #02          ;
CODE_089B87:         iwt   r0,#1976     ;
CODE_089B8A:         add   r1           ;
CODE_089B8B:         to r6              ;
CODE_089B8C:         ldw   (r0)         ;
CODE_089B8D:         iwt   r0,#1680     ;
CODE_089B90:         add   r1           ;
CODE_089B91:         to r7              ;
CODE_089B92:         ldw   (r0)         ;
CODE_089B93:         iwt   r0,#1682     ;
CODE_089B96:         add   r1           ;
CODE_089B97:         to r8              ;
CODE_089B98:         ldw   (r0)         ;
CODE_089B99:         iwt   r5,#0800     ;
CODE_089B9C:         move  r13,r15      ;
CODE_089B9E:         getb               ;
CODE_089B9F:         inc   r14          ;
CODE_089BA0:         swap               ;
CODE_089BA1:         dec   r3           ;
CODE_089BA2:         bmi CODE_089BA8    ;
CODE_089BA4:         inc   r3           ;
CODE_089BA5:         not                ;
CODE_089BA6:         inc   r0           ;
CODE_089BA7:         sub   r5           ;
CODE_089BA8:         fmult              ;
CODE_089BA9:         add   #08          ;
CODE_089BAB:         add   r7           ;
CODE_089BAC:         stw   (r2)         ;
CODE_089BAD:         inc   r2           ;
CODE_089BAE:         inc   r2           ;
CODE_089BAF:         getb               ;
CODE_089BB0:         inc   r14          ;
CODE_089BB1:         swap               ;
CODE_089BB2:         dec   r4           ;
CODE_089BB3:         bmi CODE_089BB9    ;
CODE_089BB5:         inc   r4           ;
CODE_089BB6:         not                ;
CODE_089BB7:         inc   r0           ;
CODE_089BB8:         sub   r5           ;
CODE_089BB9:         fmult              ;
CODE_089BBA:         add   #08          ;
CODE_089BBC:         add   r8           ;
CODE_089BBD:         stw   (r2)         ;
CODE_089BBE:         with r2            ;
CODE_089BBF:         add   #06          ;
CODE_089BC1:         loop               ;
CODE_089BC2:         nop                ;
CODE_089BC3:         stop               ;
CODE_089BC4:         nop                ;

CODE_089BC5:         ibt   r0,#0008     ;
CODE_089BC7:         romb               ;
CODE_089BC9:         move  r6,r11       ;
CODE_089BCB:         iwt   r0,#AB98     ;
CODE_089BCE:         add   r14          ;
CODE_089BCF:         to r14             ;
CODE_089BD0:         add   r14          ;
CODE_089BD1:         getb               ;
CODE_089BD2:         inc   r14          ;
CODE_089BD3:         getbh              ;
CODE_089BD5:         lmult              ;
CODE_089BD7:         with r4            ;
CODE_089BD8:         hib                ;
CODE_089BD9:         lob                ;
CODE_089BDA:         swap               ;
CODE_089BDB:         to r6              ;
CODE_089BDC:         or    r4           ;
CODE_089BDD:         iwt   r15,#8295    ;
CODE_089BE0:         nop                ;
CODE_089BE1:         sms   (005A),r13   ;
CODE_089BE4:         sms   (005C),r14   ;
CODE_089BE7:         sms   (0000),r0    ;
CODE_089BEA:         sms   (0002),r1    ;
CODE_089BED:         iwt   r6,#3000     ;
CODE_089BF0:         iwt   r0,#2200     ;
CODE_089BF3:         add   r3           ;
CODE_089BF4:         add   r3           ;
CODE_089BF5:         ldw   (r0)         ;
CODE_089BF6:         to r12             ;
CODE_089BF7:         lmult              ;
CODE_089BF9:         ibt   r0,#0008     ;
CODE_089BFB:         romb               ;
CODE_089BFD:         iwt   r0,#AB98     ;
CODE_089C00:         add   r2           ;
CODE_089C01:         to r14             ;
CODE_089C02:         add   r2           ;
CODE_089C03:         iwt   r0,#AC18     ;
CODE_089C06:         add   r2           ;
CODE_089C07:         to r2              ;
CODE_089C08:         add   r2           ;
CODE_089C09:         getb               ;
CODE_089C0A:         inc   r14          ;
CODE_089C0B:         getbh              ;
CODE_089C0D:         move  r14,r2       ;
CODE_089C0F:         ibt   r6,#0010     ;
CODE_089C11:         lmult              ;
CODE_089C13:         iwt   r6,#3000     ;
CODE_089C16:         from r4            ;
CODE_089C17:         to r10             ;
CODE_089C18:         fmult              ;
CODE_089C19:         getb               ;
CODE_089C1A:         inc   r14          ;
CODE_089C1B:         getbh              ;
CODE_089C1D:         iwt   r6,#1000     ;
CODE_089C20:         to r11             ;
CODE_089C21:         fmult              ;
CODE_089C22:         iwt   r3,#2200     ;
CODE_089C25:         from r12           ;
CODE_089C26:         add   r11          ;
CODE_089C27:         add   r0           ;
CODE_089C28:         add   r3           ;
CODE_089C29:         to r6              ;
CODE_089C2A:         ldw   (r0)         ;
CODE_089C2B:         from r10           ;
CODE_089C2C:         to r7              ;
CODE_089C2D:         lmult              ;
CODE_089C2F:         dec   r7           ;
CODE_089C30:         bmi CODE_089C34    ;
CODE_089C32:         inc   r7           ;
CODE_089C33:         dec   r7           ;
CODE_089C34:         iwt   r0,#0300     ;
CODE_089C37:         to r8              ;
CODE_089C38:         lmult              ;
CODE_089C3A:         from r12           ;
CODE_089C3B:         sub   r11          ;
CODE_089C3C:         add   r0           ;
CODE_089C3D:         add   r3           ;
CODE_089C3E:         to r6              ;
CODE_089C3F:         ldw   (r0)         ;
CODE_089C40:         from r10           ;
CODE_089C41:         not                ;
CODE_089C42:         inc   r0           ;
CODE_089C43:         to r3              ;
CODE_089C44:         lmult              ;
CODE_089C46:         dec   r3           ;
CODE_089C47:         bmi CODE_089C4B    ;
CODE_089C49:         inc   r3           ;
CODE_089C4A:         dec   r3           ;
CODE_089C4B:         iwt   r0,#0300     ;
CODE_089C4E:         to r5              ;
CODE_089C4F:         lmult              ;
CODE_089C51:         ibt   r9,#0000     ;
CODE_089C53:         from r7            ;
CODE_089C54:         sub   r3           ;
CODE_089C55:         bpl CODE_089C64    ;
CODE_089C57:         add   r3           ;
CODE_089C58:         move  r7,r3        ;
CODE_089C5A:         move  r3,r0        ;
CODE_089C5C:         move  r0,r8        ;
CODE_089C5E:         move  r8,r5        ;
CODE_089C60:         move  r5,r0        ;
CODE_089C62:         ibt   r9,#0001     ;
CODE_089C64:         nop                ;
CODE_089C65:         nop                ;
CODE_089C66:         ibt   r0,#0001     ;
CODE_089C68:         cmode              ;
CODE_089C6A:         lms   r1,(0000)    ;
CODE_089C6D:         lms   r2,(0002)    ;
CODE_089C70:         ibt   r12,#0020    ;
CODE_089C72:         ibt   r0,#0000     ;
CODE_089C74:         color              ;
CODE_089C75:         cache              ;
CODE_089C76:         move  r13,r15      ;
CODE_089C78:         ibt   r6,#0004     ;
CODE_089C7A:         plot               ;
CODE_089C7B:         plot               ;
CODE_089C7C:         plot               ;
CODE_089C7D:         plot               ;
CODE_089C7E:         plot               ;
CODE_089C7F:         plot               ;
CODE_089C80:         plot               ;
CODE_089C81:         dec   r6           ;
CODE_089C82:         bne CODE_089C7A    ;
CODE_089C84:         plot               ;
CODE_089C85:         iwt   r4,#0020     ;
CODE_089C88:         with r1            ;
CODE_089C89:         sub   r4           ;
CODE_089C8A:         loop               ;
CODE_089C8B:         inc   r2           ;
CODE_089C8C:         nop                ;
CODE_089C8D:         nop                ;
CODE_089C8E:         ibt   r4,#0010     ;
CODE_089C90:         lms   r0,(0000)    ;
CODE_089C93:         add   r4           ;
CODE_089C94:         sbk                ;
CODE_089C95:         lms   r0,(0002)    ;
CODE_089C98:         add   r4           ;
CODE_089C99:         sbk                ;
CODE_089C9A:         ibt   r0,#0000     ;
CODE_089C9C:         cmode              ;
CODE_089C9E:         ibt   r0,#0008     ;
CODE_089CA0:         romb               ;
CODE_089CA2:         iwt   r0,#9DAC     ;
CODE_089CA5:         to r14             ;
CODE_089CA6:         add   r9           ;
CODE_089CA7:         getbs              ;
CODE_089CA9:         sms   (0004),r0    ;
CODE_089CAC:         from r7            ;
CODE_089CAD:         to r13             ;
CODE_089CAE:         sub   r3           ;
CODE_089CAF:         iwt   r0,#2200     ;
CODE_089CB2:         add   r13          ;
CODE_089CB3:         add   r13          ;
CODE_089CB4:         to r6              ;
CODE_089CB5:         ldw   (r0)         ;
CODE_089CB6:         from r8            ;
CODE_089CB7:         sub   r5           ;
CODE_089CB8:         lob                ;
CODE_089CB9:         swap               ;
CODE_089CBA:         to r11             ;
CODE_089CBB:         lmult              ;
CODE_089CBD:         lms   r0,(005A)    ;
CODE_089CC0:         romb               ;
CODE_089CC2:         lms   r14,(005C)   ;
CODE_089CC5:         iwt   r0,#1F0F     ;
CODE_089CC8:         with r14           ;
CODE_089CC9:         add   r0           ;
CODE_089CCA:         sms   (0006),r14   ;
CODE_089CCD:         move  r0,r7        ;
CODE_089CCF:         inc   r0           ;
CODE_089CD0:         iwt   r4,#2200     ;
CODE_089CD3:         add   r0           ;
CODE_089CD4:         add   r4           ;
CODE_089CD5:         ldw   (r0)         ;
CODE_089CD6:         iwt   r6,#1000     ;
CODE_089CD9:         to r10             ;
CODE_089CDA:         fmult              ;
CODE_089CDB:         lms   r1,(0000)    ;
CODE_089CDE:         from r3            ;
CODE_089CDF:         to r13             ;
CODE_089CE0:         not                ;
CODE_089CE1:         sms   (000A),r13   ;
CODE_089CE4:         ibt   r9,#0000     ;
CODE_089CE6:         ibt   r12,#000F    ;
CODE_089CE8:         cache              ;
CODE_089CE9:         inc   r13          ;
CODE_089CEA:         sms   (0008),r14   ;
CODE_089CED:         move  r6,r11       ;
CODE_089CEF:         from r13           ;
CODE_089CF0:         lob                ;
CODE_089CF1:         swap               ;
CODE_089CF2:         fmult              ;
CODE_089CF3:         add   r5           ;
CODE_089CF4:         lms   r4,(0002)    ;
CODE_089CF7:         to r2              ;
CODE_089CF8:         add   r4           ;
CODE_089CF9:         inc   r0           ;
CODE_089CFA:         add   r0           ;
CODE_089CFB:         iwt   r4,#2200     ;
CODE_089CFE:         add   r0           ;
CODE_089CFF:         add   r4           ;
CODE_089D00:         ldw   (r0)         ;
CODE_089D01:         iwt   r6,#2000     ;
CODE_089D04:         to r8              ;
CODE_089D05:         fmult              ;
CODE_089D06:         ibt   r6,#001F     ;
CODE_089D08:         ibt   r7,#0000     ;
CODE_089D0A:         getc               ;
CODE_089D0B:         plot               ;
CODE_089D0C:         dec   r1           ;
CODE_089D0D:         dec   r2           ;
CODE_089D0E:         with r7            ;
CODE_089D0F:         add   r8           ;
CODE_089D10:         iwt   r4,#0100     ;
CODE_089D13:         from r7            ;
CODE_089D14:         sub   r4           ;
CODE_089D15:         bcc CODE_089D0A    ;
CODE_089D17:         nop                ;
CODE_089D18:         move  r7,r0        ;
CODE_089D1A:         with r14           ;
CODE_089D1B:         sub   r4           ;
CODE_089D1C:         dec   r6           ;
CODE_089D1D:         bpl CODE_089D13    ;
CODE_089D1F:         nop                ;
CODE_089D20:         lms   r14,(0008)   ;
CODE_089D23:         inc   r1           ;
CODE_089D24:         with r9            ;
CODE_089D25:         add   r10          ;
CODE_089D26:         iwt   r4,#0100     ;
CODE_089D29:         from r9            ;
CODE_089D2A:         sub   r4           ;
CODE_089D2B:         bcc CODE_089CE9    ;
CODE_089D2D:         nop                ;
CODE_089D2E:         move  r9,r0        ;
CODE_089D30:         lms   r0,(0004)    ;
CODE_089D33:         with r14           ;
CODE_089D34:         add   r0           ;
CODE_089D35:         dec   r12          ;
CODE_089D36:         bpl CODE_089D29    ;
CODE_089D38:         nop                ;
CODE_089D39:         lms   r14,(0006)   ;
CODE_089D3C:         from r3            ;
CODE_089D3D:         not                ;
CODE_089D3E:         bpl CODE_089D42    ;
CODE_089D40:         nop                ;
CODE_089D41:         inc   r0           ;
CODE_089D42:         iwt   r4,#2200     ;
CODE_089D45:         add   r0           ;
CODE_089D46:         add   r4           ;
CODE_089D47:         ldw   (r0)         ;
CODE_089D48:         iwt   r6,#1000     ;
CODE_089D4B:         to r10             ;
CODE_089D4C:         fmult              ;
CODE_089D4D:         lms   r1,(0000)    ;
CODE_089D50:         dec   r1           ;
CODE_089D51:         lms   r13,(000A)   ;
CODE_089D54:         inc   r13          ;
CODE_089D55:         ibt   r9,#0000     ;
CODE_089D57:         ibt   r12,#000F    ;
CODE_089D59:         cache              ;
CODE_089D5A:         dec   r13          ;
CODE_089D5B:         sms   (0008),r14   ;
CODE_089D5E:         move  r6,r11       ;
CODE_089D60:         from r13           ;
CODE_089D61:         lob                ;
CODE_089D62:         swap               ;
CODE_089D63:         fmult              ;
CODE_089D64:         add   r5           ;
CODE_089D65:         lms   r4,(0002)    ;
CODE_089D68:         to r2              ;
CODE_089D69:         add   r4           ;
CODE_089D6A:         inc   r0           ;
CODE_089D6B:         add   r0           ;
CODE_089D6C:         iwt   r4,#2200     ;
CODE_089D6F:         add   r0           ;
CODE_089D70:         add   r4           ;
CODE_089D71:         ldw   (r0)         ;
CODE_089D72:         iwt   r6,#2000     ;
CODE_089D75:         to r8              ;
CODE_089D76:         fmult              ;
CODE_089D77:         ibt   r6,#001F     ;
CODE_089D79:         ibt   r7,#0000     ;
CODE_089D7B:         getc               ;
CODE_089D7C:         plot               ;
CODE_089D7D:         dec   r1           ;
CODE_089D7E:         dec   r2           ;
CODE_089D7F:         with r7            ;
CODE_089D80:         add   r8           ;
CODE_089D81:         iwt   r4,#0100     ;
CODE_089D84:         from r7            ;
CODE_089D85:         sub   r4           ;
CODE_089D86:         bcc CODE_089D7B    ;
CODE_089D88:         nop                ;
CODE_089D89:         move  r7,r0        ;
CODE_089D8B:         with r14           ;
CODE_089D8C:         sub   r4           ;
CODE_089D8D:         dec   r6           ;
CODE_089D8E:         bpl CODE_089D84    ;
CODE_089D90:         nop                ;
CODE_089D91:         lms   r14,(0008)   ;
CODE_089D94:         dec   r1           ;
CODE_089D95:         with r9            ;
CODE_089D96:         add   r10          ;
CODE_089D97:         iwt   r4,#0100     ;
CODE_089D9A:         from r9            ;
CODE_089D9B:         sub   r4           ;
CODE_089D9C:         bcc CODE_089D5A    ;
CODE_089D9E:         nop                ;
CODE_089D9F:         move  r9,r0        ;
CODE_089DA1:         lms   r0,(0004)    ;
CODE_089DA4:         with r14           ;
CODE_089DA5:         sub   r0           ;
CODE_089DA6:         dec   r12          ;
CODE_089DA7:         bpl CODE_089D9A    ;
CODE_089DA9:         nop                ;
CODE_089DAA:         stop               ;
CODE_089DAB:         nop                ;
CODE_089DAC:         nop                ;
CODE_089DAD:         iwt   r15,#0302    ;
CODE_089DB0:         rol                ;
CODE_089DB1:         lsr                ;
CODE_089DB2:         cache              ;
CODE_089DB3:         lsr                ;
CODE_089DB4:         rol                ;
CODE_089DB5:         rol                ;
CODE_089DB6:         bra CODE_089DBE    ;

CODE_089DB8:         blt CODE_089DC2    ;
CODE_089DBA:         beq CODE_089DC6    ;
CODE_089DBC:         bmi CODE_089DC9    ;
CODE_089DBE:         bmi CODE_089DCB    ;
CODE_089DC0:         bpl CODE_089DCB    ;
CODE_089DC2:         bne CODE_089DCB    ;
CODE_089DC4:         bge CODE_089DCB    ;
CODE_089DC6:         rol                ;
CODE_089DC7:         bra CODE_089DCF    ;

CODE_089DC9:         blt CODE_089DD1    ;
CODE_089DCB:         bra CODE_089DD1    ;

CODE_089DCD:         lsr                ;

CODE_089DCE:         cache              ;
CODE_089DCF:         sms   (0000),r7    ;
CODE_089DD2:         sms   (0002),r8    ;
CODE_089DD5:         sms   (0004),r9    ;
CODE_089DD8:         iwt   r0,#2000     ;
CODE_089DDB:         to r3              ;
CODE_089DDC:         or    r8           ;
CODE_089DDD:         iwt   r2,#1EF2     ;
CODE_089DE0:         ibt   r0,#0000     ;
CODE_089DE2:         iwt   r5,#1FC2     ;
CODE_089DE5:         ibt   r12,#0020    ;
CODE_089DE7:         move  r13,r15      ;
CODE_089DE9:         stb   (r5)         ;
CODE_089DEB:         inc   r5           ;
CODE_089DEC:         from r3            ;
CODE_089DED:         stw   (r2)         ;
CODE_089DEE:         inc   r2           ;
CODE_089DEF:         loop               ;
CODE_089DF0:         inc   r2           ;
CODE_089DF1:         stb   (r5)         ;
CODE_089DF3:         iwt   r4,#1F72     ;
CODE_089DF6:         from r8            ;
CODE_089DF7:         lsr                ;
CODE_089DF8:         lsr                ;
CODE_089DF9:         lsr                ;
CODE_089DFA:         to r3              ;
CODE_089DFB:         lsr                ;
CODE_089DFC:         from r9            ;
CODE_089DFD:         lsr                ;
CODE_089DFE:         lsr                ;
CODE_089DFF:         lsr                ;
CODE_089E00:         to r10             ;
CODE_089E01:         lsr                ;
CODE_089E02:         ibt   r12,#0014    ;
CODE_089E04:         move  r13,r15      ;
CODE_089E06:         from r4            ;
CODE_089E07:         to r1              ;
CODE_089E08:         add   #03          ;
CODE_089E0A:         ldb   (r1)         ;
CODE_089E0C:         move  r11,r0       ;
CODE_089E0E:         to r6              ;
CODE_089E0F:         add   #0B          ;
CODE_089E11:         move  r1,r4        ;
CODE_089E13:         inc   r1           ;
CODE_089E14:         ldb   (r1)         ;
CODE_089E16:         sub   r10          ;
CODE_089E17:         add   r11          ;
CODE_089E18:         cmp   r6           ;
CODE_089E1A:         beq CODE_089E20    ;
CODE_089E1C:         nop                ;
CODE_089E1D:         bcs CODE_089E69    ;
CODE_089E1F:         nop                ;
CODE_089E20:         from r4            ;
CODE_089E21:         to r1              ;
CODE_089E22:         add   #02          ;
CODE_089E24:         ldb   (r1)         ;
CODE_089E26:         move  r11,r0       ;
CODE_089E28:         to r6              ;
CODE_089E29:         add   #0F          ;
CODE_089E2B:         inc   r6           ;
CODE_089E2C:         ldb   (r4)         ;
CODE_089E2E:         sub   r3           ;
CODE_089E2F:         move  r5,r0        ;
CODE_089E31:         add   r11          ;
CODE_089E32:         cmp   r6           ;
CODE_089E34:         beq CODE_089E3A    ;
CODE_089E36:         nop                ;
CODE_089E37:         bcs CODE_089E69    ;
CODE_089E39:         nop                ;
CODE_089E3A:         iwt   r0,#1FC2     ;
CODE_089E3D:         ibt   r1,#0020     ;
CODE_089E3F:         to r6              ;
CODE_089E40:         add   r1           ;
CODE_089E41:         dec   r5           ;
CODE_089E42:         with r5            ;
CODE_089E43:         add   r5           ;
CODE_089E44:         to r5              ;
CODE_089E45:         add   r5           ;
CODE_089E46:         inc   r11          ;
CODE_089E47:         with r11           ;
CODE_089E48:         add   r11          ;
CODE_089E49:         from r8            ;
CODE_089E4A:         and   #08          ;
CODE_089E4C:         bne CODE_089E50    ;
CODE_089E4E:         inc   r5           ;
CODE_089E4F:         inc   r5           ;
CODE_089E50:         dec   r11          ;
CODE_089E51:         bmi CODE_089E69    ;
CODE_089E53:         nop                ;
CODE_089E54:         iwt   r0,#1FC1     ;
CODE_089E57:         cmp   r5           ;
CODE_089E59:         beq CODE_089E5F    ;
CODE_089E5B:         nop                ;
CODE_089E5C:         bcs CODE_089E63    ;
CODE_089E5E:         nop                ;
CODE_089E5F:         ibt   r0,#0001     ;
CODE_089E61:         stb   (r5)         ;
CODE_089E63:         from r5            ;
CODE_089E64:         cmp   r6           ;
CODE_089E66:         bcc CODE_089E50    ;
CODE_089E68:         inc   r5           ;
CODE_089E69:         with r4            ;
CODE_089E6A:         add   #04          ;
CODE_089E6C:         loop               ;
CODE_089E6D:         nop                ;
CODE_089E6E:         iwt   r0,#2000     ;
CODE_089E71:         to r9              ;
CODE_089E72:         or    r9           ;
CODE_089E73:         ibt   r0,#FFF8     ;
CODE_089E75:         and   r8           ;
CODE_089E76:         add   r0           ;
CODE_089E77:         to r7              ;
CODE_089E78:         add   r7           ;
CODE_089E79:         iwt   r0,#00FF     ;
CODE_089E7C:         and   r7           ;
CODE_089E7D:         iwt   r5,#1FC2     ;
CODE_089E80:         ibt   r12,#0021    ;
CODE_089E82:         move  r13,r15      ;
CODE_089E84:         to r1              ;
CODE_089E85:         add   r0           ;
CODE_089E86:         ldb   (r5)         ;
CODE_089E88:         lob                ;
CODE_089E89:         bne CODE_089E91    ;
CODE_089E8B:         nop                ;
CODE_089E8C:         move  r10,r9       ;
CODE_089E8E:         bra CODE_089EBD    ;

CODE_089E90:         nop                ;

CODE_089E91:         iwt   r0,#0008     ;
CODE_089E94:         romb               ;
CODE_089E96:         iwt   r14,#AC18    ;
CODE_089E99:         with r14           ;
CODE_089E9A:         add   r1           ;
CODE_089E9B:         getb               ;
CODE_089E9C:         inc   r14          ;
CODE_089E9D:         to r6              ;
CODE_089E9E:         getbh              ;
CODE_089EA0:         iwt   r0,#0008     ;
CODE_089EA3:         romb               ;
CODE_089EA5:         from r7            ;
CODE_089EA6:         add   r7           ;
CODE_089EA7:         add   r0           ;
CODE_089EA8:         to r10             ;
CODE_089EA9:         swap               ;
CODE_089EAA:         ibt   r0,#001F     ;
CODE_089EAC:         and   r10          ;
CODE_089EAD:         iwt   r14,#9DAE    ;
CODE_089EB0:         to r14             ;
CODE_089EB1:         add   r14          ;
CODE_089EB2:         getb               ;
CODE_089EB3:         move  r10,r0       ;
CODE_089EB5:         lmult              ;
CODE_089EB7:         from r4            ;
CODE_089EB8:         hib                ;
CODE_089EB9:         add   r10          ;
CODE_089EBA:         lob                ;
CODE_089EBB:         to r10             ;
CODE_089EBC:         add   r9           ;
CODE_089EBD:         ibt   r0,#0021     ;
CODE_089EBF:         cmp   r12          ;
CODE_089EC1:         bne CODE_089ECB    ;
CODE_089EC3:         nop                ;
CODE_089EC4:         iwt   r0,#1EF0     ;
CODE_089EC7:         from r10           ;
CODE_089EC8:         stw   (r0)         ;
CODE_089EC9:         bra CODE_089ECF    ;

CODE_089ECB:         from r10           ;
CODE_089ECC:         stw   (r2)         ;
CODE_089ECD:         inc   r2           ;
CODE_089ECE:         inc   r2           ;
CODE_089ECF:         with r8            ;
CODE_089ED0:         add   #08          ;
CODE_089ED2:         with r7            ;
CODE_089ED3:         add   #0F          ;
CODE_089ED5:         inc   r7           ;
CODE_089ED6:         iwt   r0,#00FF     ;
CODE_089ED9:         and   r7           ;
CODE_089EDA:         loop               ;
CODE_089EDB:         inc   r5           ;
CODE_089EDC:         iwt   r5,#1FC2     ;
CODE_089EDF:         ibt   r0,#0000     ;
CODE_089EE1:         ibt   r12,#0020    ;
CODE_089EE3:         move  r13,r15      ;
CODE_089EE5:         stb   (r5)         ;
CODE_089EE7:         loop               ;
CODE_089EE8:         inc   r5           ;
CODE_089EE9:         stb   (r5)         ;
CODE_089EEB:         iwt   r4,#449E     ;
CODE_089EEE:         lms   r0,(0002)    ;
CODE_089EF1:         move  r8,r0        ;
CODE_089EF3:         lsr                ;
CODE_089EF4:         lsr                ;
CODE_089EF5:         lsr                ;
CODE_089EF6:         to r3              ;
CODE_089EF7:         lsr                ;
CODE_089EF8:         lms   r0,(0004)    ;
CODE_089EFB:         lsr                ;
CODE_089EFC:         lsr                ;
CODE_089EFD:         lsr                ;
CODE_089EFE:         to r10             ;
CODE_089EFF:         lsr                ;
CODE_089F00:         ibt   r12,#0014    ;
CODE_089F02:         move  r13,r15      ;
CODE_089F04:         from r4            ;
CODE_089F05:         to r1              ;
CODE_089F06:         add   #03          ;
CODE_089F08:         ldb   (r1)         ;
CODE_089F0A:         move  r11,r0       ;
CODE_089F0C:         to r6              ;
CODE_089F0D:         add   #0B          ;
CODE_089F0F:         move  r1,r4        ;
CODE_089F11:         inc   r1           ;
CODE_089F12:         ldb   (r1)         ;
CODE_089F14:         sub   r10          ;
CODE_089F15:         add   r11          ;
CODE_089F16:         cmp   r6           ;
CODE_089F18:         beq CODE_089F1E    ;
CODE_089F1A:         nop                ;
CODE_089F1B:         bcs CODE_089F6B    ;
CODE_089F1D:         nop                ;
CODE_089F1E:         from r4            ;
CODE_089F1F:         to r1              ;
CODE_089F20:         add   #02          ;
CODE_089F22:         ldb   (r1)         ;
CODE_089F24:         move  r11,r0       ;
CODE_089F26:         to r6              ;
CODE_089F27:         add   #0F          ;
CODE_089F29:         inc   r6           ;
CODE_089F2A:         ldb   (r4)         ;
CODE_089F2C:         sub   r3           ;
CODE_089F2D:         move  r5,r0        ;
CODE_089F2F:         add   r11          ;
CODE_089F30:         cmp   r6           ;
CODE_089F32:         beq CODE_089F38    ;
CODE_089F34:         nop                ;
CODE_089F35:         bcs CODE_089F6B    ;
CODE_089F37:         nop                ;
CODE_089F38:         iwt   r0,#1FC2     ;
CODE_089F3B:         ibt   r1,#0020     ;
CODE_089F3D:         to r6              ;
CODE_089F3E:         add   r1           ;
CODE_089F3F:         with r5            ;
CODE_089F40:         add   r5           ;
CODE_089F41:         to r5              ;
CODE_089F42:         add   r5           ;
CODE_089F43:         inc   r11          ;
CODE_089F44:         with r11           ;
CODE_089F45:         add   r11          ;
CODE_089F46:         from r8            ;
CODE_089F47:         and   #08          ;
CODE_089F49:         bne CODE_089F4D    ;
CODE_089F4B:         dec   r5           ;
CODE_089F4C:         inc   r5           ;
CODE_089F4D:         from r4            ;
CODE_089F4E:         add   #05          ;
CODE_089F50:         to r9              ;
CODE_089F51:         ldb   (r0)         ;
CODE_089F53:         dec   r11          ;
CODE_089F54:         bmi CODE_089F6B    ;
CODE_089F56:         nop                ;
CODE_089F57:         iwt   r0,#1FC1     ;
CODE_089F5A:         cmp   r5           ;
CODE_089F5C:         beq CODE_089F62    ;
CODE_089F5E:         nop                ;
CODE_089F5F:         bcs CODE_089F65    ;
CODE_089F61:         nop                ;
CODE_089F62:         from r9            ;
CODE_089F63:         stb   (r5)         ;
CODE_089F65:         from r5            ;
CODE_089F66:         cmp   r6           ;
CODE_089F68:         bcc CODE_089F53    ;
CODE_089F6A:         inc   r5           ;
CODE_089F6B:         with r4            ;
CODE_089F6C:         add   #06          ;
CODE_089F6E:         loop               ;
CODE_089F6F:         nop                ;
CODE_089F70:         ibt   r0,#0008     ;
CODE_089F72:         romb               ;
CODE_089F74:         lms   r1,(0000)    ;
CODE_089F77:         iwt   r0,#01FE     ;
CODE_089F7A:         and   r1           ;
CODE_089F7B:         iwt   r1,#AC18     ;
CODE_089F7E:         to r14             ;
CODE_089F7F:         add   r1           ;
CODE_089F80:         getb               ;
CODE_089F81:         inc   r14          ;
CODE_089F82:         to r6              ;
CODE_089F83:         getbh              ;
CODE_089F85:         ibt   r12,#0014    ;
CODE_089F87:         iwt   r0,#449E     ;
CODE_089F8A:         to r5              ;
CODE_089F8B:         add   #04          ;
CODE_089F8D:         move  r13,r15      ;
CODE_089F8F:         move  r1,r5        ;
CODE_089F91:         ldb   (r1)         ;
CODE_089F93:         sex                ;
CODE_089F94:         inc   r1           ;
CODE_089F95:         lmult              ;
CODE_089F97:         from r4            ;
CODE_089F98:         hib                ;
CODE_089F99:         sex                ;
CODE_089F9A:         stb   (r1)         ;
CODE_089F9C:         with r5            ;
CODE_089F9D:         add   #06          ;
CODE_089F9F:         loop               ;
CODE_089FA0:         nop                ;
CODE_089FA1:         iwt   r2,#1F30     ;
CODE_089FA4:         iwt   r5,#1FC2     ;
CODE_089FA7:         iwt   r3,#1EF0     ;
CODE_089FAA:         iwt   r0,#2000     ;
CODE_089FAD:         lms   r11,(0004)   ;
CODE_089FB0:         to r11             ;
CODE_089FB1:         or    r11          ;
CODE_089FB2:         ibt   r12,#0021    ;
CODE_089FB4:         move  r1,r12       ;
CODE_089FB6:         move  r13,r15      ;
CODE_089FB8:         ldb   (r5)         ;
CODE_089FBA:         sex                ;
CODE_089FBB:         beq CODE_089FCA    ;
CODE_089FBD:         to r10             ;
CODE_089FBE:         add   r11          ;
CODE_089FBF:         from r1            ;
CODE_089FC0:         cmp   r12          ;
CODE_089FC2:         bne CODE_089FC9    ;
CODE_089FC4:         from r10           ;
CODE_089FC5:         stw   (r3)         ;
CODE_089FC6:         bra CODE_089FCA    ;

CODE_089FC8:         nop                ;

CODE_089FC9:         stw   (r2)         ;
CODE_089FCA:         inc   r2           ;
CODE_089FCB:         inc   r2           ;
CODE_089FCC:         loop               ;
CODE_089FCD:         inc   r5           ;
CODE_089FCE:         stop               ;
CODE_089FCF:         nop                ;

; freespace
DATA_089FD0;         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_089FD8;         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_089FE0;         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_089FE8;         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_089FF0;         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_089FF8;         db $01, $01, $01, $01, $01, $01, $01, $01

CODE_08A000:         ibt   r0,#0008     ;
CODE_08A002:         romb               ;
CODE_08A004:         iwt   r5,#2200     ;
CODE_08A007:         from r6            ;
CODE_08A008:         add   r5           ;
CODE_08A009:         to r6              ;
CODE_08A00A:         ldw   (r0)         ;
CODE_08A00B:         sms   (0040),r6    ;
CODE_08A00E:         from r2            ;
CODE_08A00F:         add   r5           ;
CODE_08A010:         to r2              ;
CODE_08A011:         ldw   (r0)         ;
CODE_08A012:         sms   (0042),r2    ;
CODE_08A015:         iwt   r0,#AC18     ;
CODE_08A018:         to r14             ;
CODE_08A019:         add   r1           ;
CODE_08A01A:         iwt   r0,#AB98     ;
CODE_08A01D:         to r10             ;
CODE_08A01E:         add   r1           ;
CODE_08A01F:         getb               ;
CODE_08A020:         inc   r14          ;
CODE_08A021:         getbh              ;
CODE_08A023:         move  r7,r0        ;
CODE_08A025:         sms   (0044),r7    ;
CODE_08A028:         move  r14,r10      ;
CODE_08A02A:         getb               ;
CODE_08A02B:         inc   r14          ;
CODE_08A02C:         getbh              ;
CODE_08A02E:         move  r8,r0        ;
CODE_08A030:         sms   (0046),r8    ;
CODE_08A033:         from r7            ;
CODE_08A034:         lmult              ;
CODE_08A036:         with r4            ;
CODE_08A037:         hib                ;
CODE_08A038:         lob                ;
CODE_08A039:         swap               ;
CODE_08A03A:         to r3              ;
CODE_08A03B:         or    r4           ;
CODE_08A03C:         from r8            ;
CODE_08A03D:         lmult              ;
CODE_08A03F:         with r4            ;
CODE_08A040:         hib                ;
CODE_08A041:         lob                ;
CODE_08A042:         swap               ;
CODE_08A043:         to r5              ;
CODE_08A044:         or    r4           ;
CODE_08A045:         move  r6,r2        ;
CODE_08A047:         from r7            ;
CODE_08A048:         lmult              ;
CODE_08A04A:         with r4            ;
CODE_08A04B:         hib                ;
CODE_08A04C:         lob                ;
CODE_08A04D:         swap               ;
CODE_08A04E:         or    r4           ;
CODE_08A04F:         to r7              ;
CODE_08A050:         not                ;
CODE_08A051:         inc   r7           ;
CODE_08A052:         from r8            ;
CODE_08A053:         lmult              ;
CODE_08A055:         with r4            ;
CODE_08A056:         hib                ;
CODE_08A057:         lob                ;
CODE_08A058:         swap               ;
CODE_08A059:         to r8              ;
CODE_08A05A:         or    r4           ;
CODE_08A05B:         stop               ;
CODE_08A05C:         nop                ;

CODE_08A05D:         to r0              ;
CODE_08A05E:         to r8              ;
CODE_08A05F:         stop               ;
CODE_08A060:         bne CODE_08A082    ;
CODE_08A062:         romb               ;
CODE_08A064:         iwt   r0,#1362     ;
CODE_08A067:         add   r10          ;
CODE_08A068:         ldw   (r0)         ;
CODE_08A069:         sms   (0010),r0    ;
CODE_08A06C:         moves r0,r0        ;
CODE_08A06E:         bpl CODE_08A073    ;
CODE_08A070:         nop                ;
CODE_08A071:         stop               ;
CODE_08A072:         nop                ;

CODE_08A073:         iwt   r3,#0080     ;
CODE_08A076:         to r4              ;
CODE_08A077:         add   r3           ;
CODE_08A078:         with r14           ;
CODE_08A079:         add   r5           ;
CODE_08A07A:         getbl              ;
CODE_08A07C:         inc   r14          ;
CODE_08A07D:         to r14             ;
CODE_08A07E:         getbh              ;
CODE_08A080:         ibt   r12,#0005    ;
CODE_08A082:         link  #04          ;
CODE_08A083:         iwt   r15,#A183    ;
CODE_08A086:         nop                ;
CODE_08A087:         lms   r0,(001E)    ;
CODE_08A08A:         sub   #00          ;
CODE_08A08C:         beq CODE_08A0BE    ;
CODE_08A08E:         nop                ;
CODE_08A08F:         lms   r4,(0010)    ;
CODE_08A092:         iwt   r11,#8000    ;
CODE_08A095:         ibt   r12,#0010    ;
CODE_08A097:         cache              ;
CODE_08A098:         move  r13,r15      ;
CODE_08A09A:         from r11           ;
CODE_08A09B:         stw   (r4)         ;
CODE_08A09C:         with r4            ;
CODE_08A09D:         add   #08          ;
CODE_08A09F:         loop               ;
CODE_08A0A0:         nop                ;
CODE_08A0A1:         lms   r12,(001E)   ;
CODE_08A0A4:         iwt   r0,#0010     ;
CODE_08A0A7:         with r12           ;
CODE_08A0A8:         sub   r0           ;
CODE_08A0A9:         beq CODE_08A0BC    ;
CODE_08A0AB:         nop                ;
CODE_08A0AC:         ibt   r0,#0008     ;
CODE_08A0AE:         romb               ;
CODE_08A0B0:         iwt   r14,#A05D    ;
CODE_08A0B3:         cache              ;
CODE_08A0B4:         move  r13,r15      ;
CODE_08A0B6:         getb               ;
CODE_08A0B7:         add   r4           ;
CODE_08A0B8:         from r11           ;
CODE_08A0B9:         stw   (r0)         ;
CODE_08A0BA:         loop               ;
CODE_08A0BB:         inc   r14          ;
CODE_08A0BC:         stop               ;
CODE_08A0BD:         nop                ;

CODE_08A0BE:         ibt   r0,#0008     ;
CODE_08A0C0:         romb               ;
CODE_08A0C2:         lms   r4,(0008)    ;
CODE_08A0C5:         lms   r1,(0002)    ;
CODE_08A0C8:         iwt   r5,#01FE     ;
CODE_08A0CB:         with r4            ;
CODE_08A0CC:         and   r5           ;
CODE_08A0CD:         iwt   r0,#AC18     ;
CODE_08A0D0:         to r14             ;
CODE_08A0D1:         add   r4           ;
CODE_08A0D2:         to r3              ;
CODE_08A0D3:         add   r1           ;
CODE_08A0D4:         iwt   r0,#AB98     ;
CODE_08A0D7:         to r7              ;
CODE_08A0D8:         add   r4           ;
CODE_08A0D9:         to r9              ;
CODE_08A0DA:         add   r1           ;
CODE_08A0DB:         lms   r6,(0000)    ;
CODE_08A0DE:         getb               ;
CODE_08A0DF:         inc   r14          ;
CODE_08A0E0:         getbh              ;
CODE_08A0E2:         lmult              ;
CODE_08A0E4:         with r4            ;
CODE_08A0E5:         hib                ;
CODE_08A0E6:         lob                ;
CODE_08A0E7:         swap               ;
CODE_08A0E8:         to r6              ;
CODE_08A0E9:         or    r4           ;
CODE_08A0EA:         lms   r0,(000A)    ;
CODE_08A0ED:         lmult              ;
CODE_08A0EF:         with r4            ;
CODE_08A0F0:         hib                ;
CODE_08A0F1:         lob                ;
CODE_08A0F2:         swap               ;
CODE_08A0F3:         to r12             ;
CODE_08A0F4:         or    r4           ;
CODE_08A0F5:         lms   r6,(0000)    ;
CODE_08A0F8:         move  r14,r7       ;
CODE_08A0FA:         getb               ;
CODE_08A0FB:         inc   r14          ;
CODE_08A0FC:         getbh              ;
CODE_08A0FE:         lmult              ;
CODE_08A100:         with r4            ;
CODE_08A101:         hib                ;
CODE_08A102:         lob                ;
CODE_08A103:         swap               ;
CODE_08A104:         to r6              ;
CODE_08A105:         or    r4           ;
CODE_08A106:         lms   r0,(000C)    ;
CODE_08A109:         lmult              ;
CODE_08A10B:         with r4            ;
CODE_08A10C:         hib                ;
CODE_08A10D:         lob                ;
CODE_08A10E:         swap               ;
CODE_08A10F:         to r13             ;
CODE_08A110:         or    r4           ;
CODE_08A111:         move  r14,r3       ;
CODE_08A113:         getb               ;
CODE_08A114:         inc   r14          ;
CODE_08A115:         to r6              ;
CODE_08A116:         getbh              ;
CODE_08A118:         from r12           ;
CODE_08A119:         lmult              ;
CODE_08A11B:         with r4            ;
CODE_08A11C:         hib                ;
CODE_08A11D:         lob                ;
CODE_08A11E:         swap               ;
CODE_08A11F:         to r3              ;
CODE_08A120:         or    r4           ;
CODE_08A121:         from r13           ;
CODE_08A122:         lmult              ;
CODE_08A124:         with r4            ;
CODE_08A125:         hib                ;
CODE_08A126:         lob                ;
CODE_08A127:         swap               ;
CODE_08A128:         to r5              ;
CODE_08A129:         or    r4           ;
CODE_08A12A:         move  r14,r9       ;
CODE_08A12C:         getb               ;
CODE_08A12D:         inc   r14          ;
CODE_08A12E:         to r6              ;
CODE_08A12F:         getbh              ;
CODE_08A131:         lms   r7,(0006)    ;
CODE_08A134:         from r12           ;
CODE_08A135:         lmult              ;
CODE_08A137:         with r4            ;
CODE_08A138:         hib                ;
CODE_08A139:         lob                ;
CODE_08A13A:         swap               ;
CODE_08A13B:         or    r4           ;
CODE_08A13C:         add   r5           ;
CODE_08A13D:         not                ;
CODE_08A13E:         inc   r0           ;
CODE_08A13F:         to r2              ;
CODE_08A140:         add   r7           ;
CODE_08A141:         lms   r7,(0004)    ;
CODE_08A144:         from r13           ;
CODE_08A145:         lmult              ;
CODE_08A147:         with r4            ;
CODE_08A148:         hib                ;
CODE_08A149:         lob                ;
CODE_08A14A:         swap               ;
CODE_08A14B:         or    r4           ;
CODE_08A14C:         sub   r3           ;
CODE_08A14D:         moves r8,r8        ;
CODE_08A14F:         bne CODE_08A155    ;
CODE_08A151:         to r1              ;
CODE_08A152:         not                ;
CODE_08A153:         inc   r1           ;
CODE_08A154:         with r1            ;
CODE_08A155:         add   r7           ;
CODE_08A156:         lms   r4,(0010)    ;
CODE_08A159:         ibt   r12,#0010    ;
CODE_08A15B:         cache              ;
CODE_08A15C:         move  r13,r15      ;
CODE_08A15E:         ldw   (r4)         ;
CODE_08A15F:         add   r1           ;
CODE_08A160:         sbk                ;
CODE_08A161:         inc   r4           ;
CODE_08A162:         inc   r4           ;
CODE_08A163:         ldw   (r4)         ;
CODE_08A164:         add   r2           ;
CODE_08A165:         with r4            ;
CODE_08A166:         add   #06          ;
CODE_08A168:         loop               ;
CODE_08A169:         sbk                ;
CODE_08A16A:         stop               ;
CODE_08A16B:         nop                ;

CODE_08A16C:         romb               ;
CODE_08A16E:         move  r11,r4       ;
CODE_08A170:         from r12           ;
CODE_08A171:         umult r3           ;
CODE_08A173:         ibt   r6,#0005     ;
CODE_08A175:         lmult              ;
CODE_08A177:         from r4            ;
CODE_08A178:         to r14             ;
CODE_08A179:         add   r14          ;
CODE_08A17A:         move  r4,r11       ;
CODE_08A17C:         link  #04          ;
CODE_08A17D:         iwt   r15,#A183    ;
CODE_08A180:         nop                ;
CODE_08A181:         stop               ;
CODE_08A182:         nop                ;

CODE_08A183:         iwt   r0,#1042     ;
CODE_08A186:         add   r10          ;
CODE_08A187:         to r3              ;
CODE_08A188:         ldb   (r0)         ;
CODE_08A18A:         from r8            ;
CODE_08A18B:         add   r8           ;
CODE_08A18C:         add   r0           ;
CODE_08A18D:         mult  #08          ;
CODE_08A18F:         xor   r3           ;
CODE_08A191:         to r3              ;
CODE_08A192:         swap               ;
CODE_08A193:         iwt   r0,#1180     ;
CODE_08A196:         add   r10          ;
CODE_08A197:         ldb   (r0)         ;
CODE_08A199:         mult  #08          ;
CODE_08A19B:         sms   (0020),r0    ;
CODE_08A19E:         iwt   r0,#10E0     ;
CODE_08A1A1:         add   r10          ;
CODE_08A1A2:         ldb   (r0)         ;
CODE_08A1A4:         to r10             ;
CODE_08A1A5:         swap               ;
CODE_08A1A6:         cache              ;
CODE_08A1A7:         sms   (0060),r11   ;
CODE_08A1AA:         move  r13,r15      ;
CODE_08A1AC:         getbs              ;
CODE_08A1AE:         iwt   r9,#4000     ;
CODE_08A1B1:         with r9            ;
CODE_08A1B2:         and   r3           ;
CODE_08A1B3:         beq CODE_08A1BA    ;
CODE_08A1B5:         inc   r14          ;
CODE_08A1B6:         not                ;
CODE_08A1B7:         inc   r0           ;
CODE_08A1B8:         ibt   r9,#0008     ;
CODE_08A1BA:         to r5              ;
CODE_08A1BB:         add   r1           ;
CODE_08A1BC:         getbs              ;
CODE_08A1BE:         ibt   r11,#0000    ;
CODE_08A1C0:         moves r3,r3        ;
CODE_08A1C2:         bpl CODE_08A1C9    ;
CODE_08A1C4:         inc   r14          ;
CODE_08A1C5:         not                ;
CODE_08A1C6:         inc   r0           ;
CODE_08A1C7:         ibt   r11,#0008    ;
CODE_08A1C9:         to r6              ;
CODE_08A1CA:         add   r2           ;
CODE_08A1CB:         getb               ;
CODE_08A1CC:         inc   r14          ;
CODE_08A1CD:         getbh              ;
CODE_08A1CF:         inc   r14          ;
CODE_08A1D0:         to r7              ;
CODE_08A1D1:         xor   r3           ;
CODE_08A1D3:         getb               ;
CODE_08A1D4:         and   #02          ;
CODE_08A1D6:         bne CODE_08A1DD    ;
CODE_08A1D8:         nop                ;
CODE_08A1D9:         with r5            ;
CODE_08A1DA:         add   r9           ;
CODE_08A1DB:         with r6            ;
CODE_08A1DC:         add   r11          ;
CODE_08A1DD:         getbh              ;
CODE_08A1DF:         inc   r14          ;
CODE_08A1E0:         from r5            ;
CODE_08A1E1:         stw   (r4)         ;
CODE_08A1E2:         inc   r4           ;
CODE_08A1E3:         inc   r4           ;
CODE_08A1E4:         to r5              ;
CODE_08A1E5:         xor   r10          ;
CODE_08A1E7:         from r6            ;
CODE_08A1E8:         stw   (r4)         ;
CODE_08A1E9:         inc   r4           ;
CODE_08A1EA:         inc   r4           ;
CODE_08A1EB:         lms   r0,(0020)    ;
CODE_08A1EE:         add   r7           ;
CODE_08A1EF:         stw   (r4)         ;
CODE_08A1F0:         inc   r4           ;
CODE_08A1F1:         inc   r4           ;
CODE_08A1F2:         from r5            ;
CODE_08A1F3:         stw   (r4)         ;
CODE_08A1F4:         inc   r4           ;
CODE_08A1F5:         loop               ;
CODE_08A1F6:         inc   r4           ;
CODE_08A1F7:         lms   r11,(0060)   ;
CODE_08A1FA:         jmp   r11          ;
CODE_08A1FB:         nop                ;

CODE_08A1FC:         with r0            ;
CODE_08A1FD:         stop               ;
CODE_08A1FE:         to r8              ;
CODE_08A1FF:         to    r8           ;
CODE_08A1FF:         to r0              ;
CODE_08A200:         to    r0           ;
CODE_08A200:         bne CODE_08A241    ;
CODE_08A202:         getc               ;
CODE_08A203:         iwt   r0,#1362     ;
CODE_08A206:         add   r10          ;
CODE_08A207:         to r4              ;
CODE_08A208:         ldw   (r0)         ;
CODE_08A209:         moves r4,r4        ;
CODE_08A20B:         bpl CODE_08A210    ;
CODE_08A20D:         nop                ;
CODE_08A20E:         stop               ;
CODE_08A20F:         nop                ;

CODE_08A210:         sms   (0048),r4    ;
CODE_08A213:         iwt   r0,#1402     ;
CODE_08A216:         add   r10          ;
CODE_08A217:         ldb   (r0)         ;
CODE_08A219:         add   r0           ;
CODE_08A21A:         with r14           ;
CODE_08A21B:         add   r0           ;
CODE_08A21C:         getbl              ;
CODE_08A21E:         inc   r14          ;
CODE_08A21F:         to r14             ;
CODE_08A220:         getbh              ;
CODE_08A222:         link  #04          ;
CODE_08A223:         iwt   r15,#A183    ;
CODE_08A226:         nop                ;
CODE_08A227:         lms   r0,(001E)    ;
CODE_08A22A:         to r12             ;
CODE_08A22B:         sub   #00          ;
CODE_08A22D:         beq CODE_08A246    ;
CODE_08A22F:         nop                ;
CODE_08A230:         ibt   r0,#0008     ;
CODE_08A232:         romb               ;
CODE_08A234:         iwt   r14,#A1FC    ;
CODE_08A237:         iwt   r11,#8000    ;
CODE_08A23A:         lms   r4,(0048)    ;
CODE_08A23D:         cache              ;
CODE_08A23E:         move  r13,r15      ;
CODE_08A240:         getb               ;
CODE_08A241:         add   r4           ;
CODE_08A242:         from r11           ;
CODE_08A243:         stw   (r0)         ;
CODE_08A244:         loop               ;
CODE_08A245:         inc   r14          ;
CODE_08A246:         stop               ;
CODE_08A247:         nop                ;

CODE_08A248:         from r3            ;
CODE_08A249:         lmult              ;
CODE_08A24B:         with r4            ;
CODE_08A24C:         hib                ;
CODE_08A24D:         lob                ;
CODE_08A24E:         swap               ;
CODE_08A24F:         or    r4           ;
CODE_08A250:         moves r8,r8        ;
CODE_08A252:         beq CODE_08A257    ;
CODE_08A254:         nop                ;
CODE_08A255:         not                ;
CODE_08A256:         inc   r0           ;
CODE_08A257:         add   r1           ;
CODE_08A258:         to r1              ;
CODE_08A259:         sub   #08          ;
CODE_08A25B:         from r5            ;
CODE_08A25C:         lmult              ;
CODE_08A25E:         with r4            ;
CODE_08A25F:         hib                ;
CODE_08A260:         lob                ;
CODE_08A261:         swap               ;
CODE_08A262:         or    r4           ;
CODE_08A263:         add   r2           ;
CODE_08A264:         to r2              ;
CODE_08A265:         add   #08          ;
CODE_08A267:         iwt   r0,#1362     ;
CODE_08A26A:         add   r10          ;
CODE_08A26B:         to r4              ;
CODE_08A26C:         ldw   (r0)         ;
CODE_08A26D:         ibt   r12,#0002    ;
CODE_08A26F:         ibt   r3,#0010     ;
CODE_08A271:         iwt   r0,#1402     ;
CODE_08A274:         add   r10          ;
CODE_08A275:         ldb   (r0)         ;
CODE_08A277:         sub   #01          ;
CODE_08A279:         beq CODE_08A280    ;
CODE_08A27B:         with r2            ;
CODE_08A27C:         sub   r3           ;
CODE_08A27D:         ibt   r12,#0004    ;
CODE_08A27F:         with r2            ;
CODE_08A280:         sub   r3           ;
CODE_08A281:         moves r8,r8        ;
CODE_08A283:         beq CODE_08A28A    ;
CODE_08A285:         nop                ;
CODE_08A286:         with r1            ;
CODE_08A287:         add   r3           ;
CODE_08A288:         ibt   r3,#FFF0     ;
CODE_08A28A:         ibt   r5,#0002     ;
CODE_08A28C:         iwt   r11,#FF01    ;
CODE_08A28F:         iwt   r0,#1042     ;
CODE_08A292:         add   r10          ;
CODE_08A293:         to r7              ;
CODE_08A294:         ldb   (r0)         ;
CODE_08A296:         from r8            ;
CODE_08A297:         add   r8           ;
CODE_08A298:         add   r0           ;
CODE_08A299:         mult  #08          ;
CODE_08A29B:         to r7              ;
CODE_08A29C:         xor   r7           ;
CODE_08A29E:         cache              ;
CODE_08A29F:         move  r13,r15      ;
CODE_08A2A1:         move  r9,r1        ;
CODE_08A2A3:         from r9            ;
CODE_08A2A4:         stw   (r4)         ;
CODE_08A2A5:         inc   r4           ;
CODE_08A2A6:         inc   r4           ;
CODE_08A2A7:         from r2            ;
CODE_08A2A8:         stw   (r4)         ;
CODE_08A2A9:         inc   r4           ;
CODE_08A2AA:         inc   r4           ;
CODE_08A2AB:         inc   r4           ;
CODE_08A2AC:         ldw   (r4)         ;
CODE_08A2AD:         and   r11          ;
CODE_08A2AE:         or    r7           ;
CODE_08A2AF:         sbk                ;
CODE_08A2B0:         inc   r4           ;
CODE_08A2B1:         from r5            ;
CODE_08A2B2:         stw   (r4)         ;
CODE_08A2B3:         inc   r4           ;
CODE_08A2B4:         inc   r4           ;
CODE_08A2B5:         from r9            ;
CODE_08A2B6:         cmp   r1           ;
CODE_08A2B8:         bne CODE_08A2C0    ;
CODE_08A2BA:         with r2            ;
CODE_08A2BB:         with r9            ;
CODE_08A2BC:         add   r3           ;
CODE_08A2BD:         bra CODE_08A2A4    ;

CODE_08A2BF:         from r9            ;
CODE_08A2C0:         add   #0F          ;
CODE_08A2C2:         loop               ;
CODE_08A2C3:         inc   r2           ;
CODE_08A2C4:         stop               ;
CODE_08A2C5:         nop                ;

CODE_08A2C6:         romb               ;
CODE_08A2C8:         lms   r0,(0038)    ;
CODE_08A2CB:         sex                ;
CODE_08A2CC:         sbk                ;
CODE_08A2CD:         lms   r0,(003A)    ;
CODE_08A2D0:         sex                ;
CODE_08A2D1:         sbk                ;
CODE_08A2D2:         with r14           ;
CODE_08A2D3:         add   #00          ;
CODE_08A2D5:         sms   (0054),r10   ;
CODE_08A2D8:         link  #04          ;
CODE_08A2D9:         iwt   r15,#A183    ;
CODE_08A2DC:         nop                ;
CODE_08A2DD:         lms   r10,(0054)   ;
CODE_08A2E0:         lms   r0,(0026)    ;
CODE_08A2E3:         moves r14,r0       ;
CODE_08A2E5:         beq CODE_08A310    ;
CODE_08A2E7:         lms   r0,(0038)    ;
CODE_08A2EA:         lms   r7,(002A)    ;
CODE_08A2ED:         with r7            ;
CODE_08A2EE:         div2               ;
CODE_08A2F0:         sub   r7           ;
CODE_08A2F1:         sms   (003C),r0    ;
CODE_08A2F4:         lms   r7,(002C)    ;
CODE_08A2F7:         with r7            ;
CODE_08A2F8:         div2               ;
CODE_08A2FA:         lms   r0,(003A)    ;
CODE_08A2FD:         sub   r7           ;
CODE_08A2FE:         sms   (003E),r0    ;
CODE_08A301:         lms   r12,(0024)   ;
CODE_08A304:         sms   (0054),r10   ;
CODE_08A307:         link  #04          ;
CODE_08A308:         iwt   r15,#A183    ;
CODE_08A30B:         nop                ;
CODE_08A30C:         lms   r10,(0054)   ;
CODE_08A30F:         lms   r0,(0028)    ;
CODE_08A312:         moves r14,r0       ;
CODE_08A314:         beq CODE_08A31E    ;
CODE_08A316:         nop                ;
CODE_08A317:         ibt   r12,#0002    ;
CODE_08A319:         link  #04          ;
CODE_08A31A:         iwt   r15,#A183    ;
CODE_08A31D:         nop                ;
CODE_08A31E:         stop               ;
CODE_08A31F:         nop                ;

CODE_08A320:         iwt   r10,#0100    ;
CODE_08A323:         iwt   r11,#0200    ;
CODE_08A326:         iwt   r12,#01FE    ;
CODE_08A329:         from r1            ;
CODE_08A32A:         to r4              ;
CODE_08A32B:         sub   r7           ;
CODE_08A32C:         from r4            ;
CODE_08A32D:         add   r10          ;
CODE_08A32E:         cmp   r11          ;
CODE_08A330:         bcc CODE_08A33A    ;
CODE_08A332:         nop                ;
CODE_08A333:         bmi CODE_08A339    ;
CODE_08A335:         with r4            ;
CODE_08A336:         with  r4           ;
CODE_08A336:         bra CODE_08A33A    ;

CODE_08A338:         sub   r11          ;

CODE_08A339:         add   r11          ;
CODE_08A33A:         from r4            ;
CODE_08A33B:         lmult              ;
CODE_08A33D:         with r4            ;
CODE_08A33E:         hib                ;
CODE_08A33F:         lob                ;
CODE_08A340:         swap               ;
CODE_08A341:         or    r4           ;
CODE_08A342:         from r1            ;
CODE_08A343:         sub   r0           ;
CODE_08A344:         to r1              ;
CODE_08A345:         and   r12          ;
CODE_08A346:         from r2            ;
CODE_08A347:         sub   r8           ;
CODE_08A348:         lmult              ;
CODE_08A34A:         with r4            ;
CODE_08A34B:         hib                ;
CODE_08A34C:         lob                ;
CODE_08A34D:         swap               ;
CODE_08A34E:         or    r4           ;
CODE_08A34F:         with r2            ;
CODE_08A350:         sub   r0           ;
CODE_08A351:         from r3            ;
CODE_08A352:         to r4              ;
CODE_08A353:         sub   r9           ;
CODE_08A354:         from r4            ;
CODE_08A355:         add   r10          ;
CODE_08A356:         cmp   r11          ;
CODE_08A358:         bcc CODE_08A362    ;
CODE_08A35A:         nop                ;
CODE_08A35B:         bmi CODE_08A361    ;
CODE_08A35D:         with r4            ;
CODE_08A35E:         with  r4           ;
CODE_08A35E:         bra CODE_08A362    ;

CODE_08A360:         sub   r11          ;

CODE_08A361:         add   r11          ;
CODE_08A362:         from r4            ;
CODE_08A363:         lmult              ;
CODE_08A365:         with r4            ;
CODE_08A366:         hib                ;
CODE_08A367:         lob                ;
CODE_08A368:         swap               ;
CODE_08A369:         or    r4           ;
CODE_08A36A:         from r3            ;
CODE_08A36B:         sub   r0           ;
CODE_08A36C:         to r3              ;
CODE_08A36D:         and   r12          ;
CODE_08A36E:         stop               ;
CODE_08A36F:         nop                ;

CODE_08A370:         link  #04          ;
CODE_08A371:         iwt   r15,#A377    ;
CODE_08A374:         nop                ;
CODE_08A375:         stop               ;
CODE_08A376:         nop                ;

CODE_08A377:         ibt   r0,#0008     ;
CODE_08A379:         romb               ;
CODE_08A37B:         iwt   r0,#AC18     ;
CODE_08A37E:         to r14             ;
CODE_08A37F:         add   r1           ;
CODE_08A380:         iwt   r0,#AB98     ;
CODE_08A383:         to r9              ;
CODE_08A384:         add   r1           ;
CODE_08A385:         getb               ;
CODE_08A386:         inc   r14          ;
CODE_08A387:         getbh              ;
CODE_08A389:         move  r7,r0        ;
CODE_08A38B:         lmult              ;
CODE_08A38D:         with r4            ;
CODE_08A38E:         hib                ;
CODE_08A38F:         lob                ;
CODE_08A390:         swap               ;
CODE_08A391:         to r2              ;
CODE_08A392:         or    r4           ;
CODE_08A393:         move  r14,r9       ;
CODE_08A395:         getb               ;
CODE_08A396:         inc   r14          ;
CODE_08A397:         getbh              ;
CODE_08A399:         move  r8,r0        ;
CODE_08A39B:         lmult              ;
CODE_08A39D:         with r4            ;
CODE_08A39E:         hib                ;
CODE_08A39F:         lob                ;
CODE_08A3A0:         swap               ;
CODE_08A3A1:         to r3              ;
CODE_08A3A2:         or    r4           ;
CODE_08A3A3:         move  r6,r5        ;
CODE_08A3A5:         from r7            ;
CODE_08A3A6:         lmult              ;
CODE_08A3A8:         with r4            ;
CODE_08A3A9:         hib                ;
CODE_08A3AA:         lob                ;
CODE_08A3AB:         swap               ;
CODE_08A3AC:         or    r4           ;
CODE_08A3AD:         to r1              ;
CODE_08A3AE:         add   r3           ;
CODE_08A3AF:         from r8            ;
CODE_08A3B0:         lmult              ;
CODE_08A3B2:         with r4            ;
CODE_08A3B3:         hib                ;
CODE_08A3B4:         lob                ;
CODE_08A3B5:         swap               ;
CODE_08A3B6:         or    r4           ;
CODE_08A3B7:         add   r2           ;
CODE_08A3B8:         jmp   r11          ;
CODE_08A3B9:         nop                ;

; hookbill gsu routine
CODE_08A3BA:         iwt   r0,#1362     ; OAM buffer address
CODE_08A3BD:         add   r10          ;
CODE_08A3BE:         ldw   (r0)         ;
CODE_08A3BF:         moves r4,r0        ;
CODE_08A3C1:         bpl CODE_08A3C6    ;
CODE_08A3C3:         nop                ;
CODE_08A3C4:         stop               ;
CODE_08A3C5:         nop                ;
;
CODE_08A3C6:         sms   (0048),r4    ; OAM buffer starting address
CODE_08A3C9:         lms   r0,(0008)    ;
CODE_08A3CC:         sms   (003C),r0    ;
CODE_08A3CF:         lms   r7,(001E)    ; ROM table address
CODE_08A3D2:         ibt   r6,#0023     ; implies chunks of $23 bytes
CODE_08A3D4:         lms   r0,(0002)    ; index (chunk) - animation frame
CODE_08A3D7:         mult  r6           ;
CODE_08A3D8:         add   r7           ; fully computed address
CODE_08A3D9:         sbk                ; in ROM table -> 0002
CODE_08A3DA:         sms   (0042),r0    ; and -> 0042
CODE_08A3DD:         lms   r0,(0004)    ; another chunk index
CODE_08A3E0:         mult  r6           ;
CODE_08A3E1:         add   r7           ; fully computed address
CODE_08A3E2:         sbk                ; in ROM table -> 0004
CODE_08A3E3:         sms   (0044),r0    ; and -> 0044
CODE_08A3E6:         lms   r0,(000A)    ;
CODE_08A3E9:         sms   (004A),r0    ;
CODE_08A3EC:         link  #04          ;
CODE_08A3ED:         iwt   r15,#A660    ; apply movement to hookbill himself?
CODE_08A3F0:         nop                ;
CODE_08A3F1:         lms   r0,(0008)    ;
CODE_08A3F4:         sms   (003C),r0    ;
CODE_08A3F7:         lms   r0,(0042)    ;
CODE_08A3FA:         sms   (0002),r0    ;
CODE_08A3FD:         lms   r0,(0044)    ;
CODE_08A400:         sms   (0004),r0    ;
CODE_08A403:         lms   r0,(004A)    ;
CODE_08A406:         sms   (000A),r0    ;
CODE_08A409:         iwt   r0,#A526     ;
CODE_08A40C:         sms   (005E),r0    ;
CODE_08A40F:         ibt   r0,#0001     ;
CODE_08A411:         sms   (005A),r0    ;
CODE_08A414:         link  #04          ;
CODE_08A415:         iwt   r15,#A762    ; starting fresh from beginning of 018297 table
CODE_08A418:         nop                ; call A762 7 times
CODE_08A419:         link  #04          ; which goes through table
CODE_08A41A:         iwt   r15,#A52E    ; 5 bytes each, once per body part
CODE_08A41D:         nop                ; this one is hookbill's
CODE_08A41E:         lms   r0,(0024)    ;
CODE_08A421:         sms   (003E),r0    ;
CODE_08A424:         ibt   r12,#0004    ; sub A883 goes through 018B46 tables
CODE_08A426:         lms   r0,(0020)    ; simultaneously
CODE_08A429:         mult  r12          ; takes index from 018297 table entry
CODE_08A42A:         mult  #05          ; multiplies by 20 and computes full address
CODE_08A42C:         lms   r1,(0012)    ; within 018B46 table
CODE_08A42F:         to r14             ;
CODE_08A430:         add   r1           ;
CODE_08A431:         link  #04          ;
CODE_08A432:         iwt   r15,#A883    ;
CODE_08A435:         nop                ;
CODE_08A436:         link  #04          ;
CODE_08A437:         iwt   r15,#A762    ;
CODE_08A43A:         nop                ;
CODE_08A43B:         link  #04          ;
CODE_08A43C:         iwt   r15,#A52E    ;
CODE_08A43F:         nop                ;
CODE_08A440:         ibt   r12,#0004    ;
CODE_08A442:         lms   r0,(0020)    ;
CODE_08A445:         mult  r12          ;
CODE_08A446:         mult  #05          ;
CODE_08A448:         lms   r1,(0014)    ; 018B82 table
CODE_08A44B:         to r14             ;
CODE_08A44C:         add   r1           ;
CODE_08A44D:         link  #04          ;
CODE_08A44E:         iwt   r15,#A883    ;
CODE_08A451:         nop                ;
CODE_08A452:         link  #04          ;
CODE_08A453:         iwt   r15,#A762    ;
CODE_08A456:         nop                ;
CODE_08A457:         lms   r0,(005E)    ;
CODE_08A45A:         inc   r0           ;
CODE_08A45B:         inc   r0           ;
CODE_08A45C:         sbk                ;
CODE_08A45D:         lms   r0,(005A)    ;
CODE_08A460:         inc   r0           ;
CODE_08A461:         inc   r0           ;
CODE_08A462:         sbk                ;
CODE_08A463:         ibt   r12,#0001    ;
CODE_08A465:         lms   r0,(0020)    ;
CODE_08A468:         mult  r12          ;
CODE_08A469:         mult  #05          ;
CODE_08A46B:         lms   r1,(0016)    ; 018BFA table
CODE_08A46E:         to r14             ;
CODE_08A46F:         add   r1           ;
CODE_08A470:         link  #04          ;
CODE_08A471:         iwt   r15,#A883    ;
CODE_08A474:         nop                ;
CODE_08A475:         link  #04          ;
CODE_08A476:         iwt   r15,#A762    ;
CODE_08A479:         nop                ;
CODE_08A47A:         lms   r0,(004C)    ;
CODE_08A47D:         sms   (0040),r0    ;
CODE_08A480:         lms   r0,(004E)    ;
CODE_08A483:         sms   (0054),r0    ;
CODE_08A486:         link  #04          ;
CODE_08A487:         iwt   r15,#A52E    ;
CODE_08A48A:         nop                ;
CODE_08A48B:         ibt   r12,#0004    ;
CODE_08A48D:         lms   r0,(0020)    ;
CODE_08A490:         mult  r12          ;
CODE_08A491:         mult  #05          ;
CODE_08A493:         lms   r1,(0018)    ; 018BFF table
CODE_08A496:         to r14             ;
CODE_08A497:         add   r1           ;
CODE_08A498:         link  #04          ;
CODE_08A499:         iwt   r15,#A883    ;
CODE_08A49C:         nop                ;
CODE_08A49D:         link  #04          ;
CODE_08A49E:         iwt   r15,#A762    ;
CODE_08A4A1:         nop                ;
CODE_08A4A2:         ibt   r12,#0004    ;
CODE_08A4A4:         lms   r0,(0020)    ;
CODE_08A4A7:         mult  r12          ;
CODE_08A4A8:         mult  #05          ;
CODE_08A4AA:         lms   r1,(001A)    ; 018C13 table
CODE_08A4AD:         to r14             ;
CODE_08A4AE:         add   r1           ;
CODE_08A4AF:         link  #04          ;
CODE_08A4B0:         iwt   r15,#A883    ;
CODE_08A4B3:         nop                ;
CODE_08A4B4:         link  #04          ;
CODE_08A4B5:         iwt   r15,#A762    ;
CODE_08A4B8:         nop                ;
CODE_08A4B9:         lms   r1,(0024)    ;
CODE_08A4BC:         lms   r0,(003E)    ;
CODE_08A4BF:         sub   r1           ;
CODE_08A4C0:         bpl CODE_08A4C4    ;
CODE_08A4C2:         from r1            ;
CODE_08A4C3:         sbk                ;
CODE_08A4C4:         ibt   r12,#0004    ;
CODE_08A4C6:         lms   r0,(0020)    ;
CODE_08A4C9:         mult  r12          ;
CODE_08A4CA:         mult  #05          ;
CODE_08A4CC:         lms   r1,(001C)    ; 018C8B table
CODE_08A4CF:         to r14             ;
CODE_08A4D0:         add   r1           ;
CODE_08A4D1:         link  #04          ;
CODE_08A4D2:         iwt   r15,#A883    ;
CODE_08A4D5:         nop                ;
CODE_08A4D6:         link  #04          ;
CODE_08A4D7:         iwt   r15,#A762    ;
CODE_08A4DA:         nop                ;
CODE_08A4DB:         lms   r0,(0030)    ;
CODE_08A4DE:         sms   (003C),r0    ;
CODE_08A4E1:         lms   r7,(002E)    ;
CODE_08A4E4:         ibt   r6,#0005     ;
CODE_08A4E6:         lms   r0,(002A)    ;
CODE_08A4E9:         mult  r6           ;
CODE_08A4EA:         add   r7           ;
CODE_08A4EB:         sbk                ;
CODE_08A4EC:         lms   r0,(002C)    ;
CODE_08A4EF:         mult  r6           ;
CODE_08A4F0:         add   r7           ;
CODE_08A4F1:         sbk                ;
CODE_08A4F2:         lms   r0,(0000)    ;
CODE_08A4F5:         romb               ;
CODE_08A4F7:         link  #04          ;
CODE_08A4F8:         iwt   r15,#A905    ;
CODE_08A4FB:         cache              ;
CODE_08A4FC:         sms   (0034),r1    ;
CODE_08A4FF:         link  #04          ;
CODE_08A500:         iwt   r15,#A905    ;
CODE_08A503:         nop                ;
CODE_08A504:         sms   (0036),r1    ;
CODE_08A507:         link  #04          ;
CODE_08A508:         iwt   r15,#A905    ;
CODE_08A50B:         nop                ;
CODE_08A50C:         sms   (0038),r1    ;
CODE_08A50F:         link  #04          ;
CODE_08A510:         iwt   r15,#A905    ;
CODE_08A513:         nop                ;
CODE_08A514:         sms   (003A),r1    ;
CODE_08A517:         link  #04          ;
CODE_08A518:         iwt   r15,#A905    ;
CODE_08A51B:         nop                ;
CODE_08A51C:         sms   (003C),r1    ;
CODE_08A51F:         link  #04          ;
CODE_08A520:         iwt   r15,#A5A9    ;
CODE_08A523:         nop                ;
CODE_08A524:         stop               ;
CODE_08A525:         nop                ;

; x, y offsets
DATA_08A526:         db $08, $08, $06, $06
DATA_08A52A:         db $03, $03, $08, $08

; hookbill sub
CODE_08A52E:         sms   (005C),r14   ;
CODE_08A531:         lms   r0,(0046)    ;
CODE_08A534:         sub   #00          ;
CODE_08A536:         bne CODE_08A593    ;
CODE_08A538:         nop                ;
CODE_08A539:         iwt   r0,#0008     ;
CODE_08A53C:         romb               ;
CODE_08A53E:         iwt   r0,#1C16     ; sprite table
CODE_08A541:         add   r10          ; sprite index
CODE_08A542:         to r7              ;
CODE_08A543:         ldw   (r0)         ; -> r7
CODE_08A544:         lms   r0,(004C)    ;
CODE_08A547:         to r8              ;
CODE_08A548:         add   r7           ; r8 = computed x + sprite table (offset?)
CODE_08A549:         lms   r7,(0120)    ;
CODE_08A54C:         lms   r14,(005E)   ; $A526 table
CODE_08A54F:         lms   r6,(0050)    ;
CODE_08A552:         getb               ;
CODE_08A553:         lmult              ; \  lops off highest and lowest
CODE_08A555:         with r4            ;
CODE_08A556:         hib                ;  | bytes of multiplication result
CODE_08A557:         lob                ;  |
CODE_08A558:         swap               ;  | two middle bytes of table val * x scale
CODE_08A559:         or    r4           ; /
CODE_08A55A:         add   r7           ;
CODE_08A55B:         to r4              ;
CODE_08A55C:         add   r0           ; r4 = (x offset * x scale + 0120) * 2
CODE_08A55D:         add   r8           ;
CODE_08A55E:         cmp   r4           ;
CODE_08A560:         bcs CODE_08A593    ;
CODE_08A562:         nop                ;
CODE_08A563:         inc   r14          ; next slot in $A526 table
CODE_08A564:         iwt   r0,#1C18     ; sprite table
CODE_08A567:         add   r10          ; sprite index
CODE_08A568:         to r7              ;
CODE_08A569:         ldw   (r0)         ; -> r7
CODE_08A56A:         lms   r0,(004E)    ;
CODE_08A56D:         to r8              ;
CODE_08A56E:         add   r7           ;
CODE_08A56F:         sms   (0058),r8    ; $0058 = computed y + sprite table (offset?)
CODE_08A572:         lms   r7,(0122)    ;
CODE_08A575:         lms   r6,(0052)    ; y scale
CODE_08A578:         getb               ; $08/(005e)+1 -> r0
CODE_08A579:         lmult              ; \  lops off highest and lowest
CODE_08A57B:         with r4            ;
CODE_08A57C:         hib                ;  | bytes of multiplication result
CODE_08A57D:         lob                ;  |
CODE_08A57E:         swap               ;  | two middle bytes of table val * y scale
CODE_08A57F:         or    r4           ; /
CODE_08A580:         sms   (0056),r0    ; $0056 = y offset * y scale
CODE_08A583:         add   r7           ; 0056 + 0122
CODE_08A584:         to r4              ;
CODE_08A585:         add   r0           ;
CODE_08A586:         add   r8           ;
CODE_08A587:         cmp   r4           ;
CODE_08A589:         bcs CODE_08A593    ;
CODE_08A58B:         nop                ;
CODE_08A58C:         lms   r0,(005A)    ;
CODE_08A58F:         dec   r0           ;
CODE_08A590:         bra CODE_08A59F    ;

CODE_08A592:         sbk                ;
CODE_08A593:         lms   r0,(005E)    ; increment x,y offset table
CODE_08A596:         inc   r0           ; to next entry
CODE_08A597:         inc   r0           ;
CODE_08A598:         sbk                ;
CODE_08A599:         lms   r0,(005A)    ;
CODE_08A59C:         inc   r0           ;
CODE_08A59D:         inc   r0           ;
CODE_08A59E:         sbk                ;
CODE_08A59F:         lms   r0,(0000)    ;
CODE_08A5A2:         romb               ;
CODE_08A5A4:         lms   r14,(005C)   ; return
CODE_08A5A7:         jmp   r11          ;
CODE_08A5A8:         nop                ;

; hookbill sub
CODE_08A5A9:         lms   r0,(005A)    ;
CODE_08A5AC:         lsr                ;
CODE_08A5AD:         bcc CODE_08A5A7    ;
CODE_08A5AF:         nop                ;
CODE_08A5B0:         sms   (005C),r14   ; preserve r14
CODE_08A5B3:         sms   (0060),r11   ; and r11
CODE_08A5B6:         lms   r6,(0050)    ; x scale
CODE_08A5B9:         ibt   r0,#0016     ;
CODE_08A5BB:         lmult              ;
CODE_08A5BD:         with r4            ;
CODE_08A5BE:         hib                ;
CODE_08A5BF:         lob                ;
CODE_08A5C0:         swap               ;
CODE_08A5C1:         or    r4           ;
CODE_08A5C2:         sms   (0004),r0    ; radius = x scale * $16
CODE_08A5C5:         lms   r1,(003C)    ; angle
CODE_08A5C8:         link  #04          ;
CODE_08A5C9:         iwt   r15,#A81C    ; polars
CODE_08A5CC:         with r0            ;
CODE_08A5CD:         sub   #00          ;
CODE_08A5CF:         bpl CODE_08A5D4    ;
CODE_08A5D1:         nop                ;
CODE_08A5D2:         not                ; flip sign if negative
CODE_08A5D3:         inc   r0           ;
CODE_08A5D4:         sms   (0000),r0    ; 0000 = polar x
CODE_08A5D7:         from r1            ;
CODE_08A5D8:         sub   #00          ;
CODE_08A5DA:         bpl CODE_08A5DF    ;
CODE_08A5DC:         with r1            ;
CODE_08A5DD:         not                ; flip sign
CODE_08A5DE:         inc   r1           ;
CODE_08A5DF:         sms   (0002),r1    ; 0002 = polar y
CODE_08A5E2:         lms   r6,(0052)    ; y scale
CODE_08A5E5:         ibt   r0,#0014     ;
CODE_08A5E7:         lmult              ;
CODE_08A5E9:         with r4            ;
CODE_08A5EA:         hib                ;
CODE_08A5EB:         lob                ;
CODE_08A5EC:         swap               ;
CODE_08A5ED:         or    r4           ;
CODE_08A5EE:         sms   (0006),r0    ; radius = y scale * $14
CODE_08A5F1:         lms   r1,(003C)    ; same angle
CODE_08A5F4:         link  #04          ;
CODE_08A5F5:         iwt   r15,#A81C    ; polars
CODE_08A5F8:         with r0            ;
CODE_08A5F9:         sub   #00          ;
CODE_08A5FB:         bpl CODE_08A600    ;
CODE_08A5FD:         nop                ;
CODE_08A5FE:         not                ; flip sign if negative
CODE_08A5FF:         inc   r0           ;
CODE_08A600:         lms   r5,(0002)    ;
CODE_08A603:         cmp   r5           ;
CODE_08A605:         bmi CODE_08A609    ;
CODE_08A607:         nop                ;
CODE_08A608:         sbk                ;
CODE_08A609:         moves r0,r1        ;
CODE_08A60B:         bpl CODE_08A610    ;
CODE_08A60D:         from r1            ;
CODE_08A60E:         not                ;
CODE_08A60F:         inc   r0           ;
CODE_08A610:         lms   r5,(0000)    ;
CODE_08A613:         cmp   r5           ;
CODE_08A615:         bmi CODE_08A619    ;
CODE_08A617:         nop                ;
CODE_08A618:         sbk                ;
CODE_08A619:         lms   r11,(0060)   ;
CODE_08A61C:         iwt   r0,#1C16     ; sprite table
CODE_08A61F:         add   r10          ;
CODE_08A620:         to r7              ;
CODE_08A621:         ldw   (r0)         ;
CODE_08A622:         lms   r0,(004C)    ;
CODE_08A625:         to r8              ;
CODE_08A626:         add   r7           ;
CODE_08A627:         lms   r7,(0120)    ;
CODE_08A62A:         lms   r0,(0000)    ;
CODE_08A62D:         add   r7           ;
CODE_08A62E:         to r4              ;
CODE_08A62F:         add   r0           ;
CODE_08A630:         add   r8           ;
CODE_08A631:         cmp   r4           ;
CODE_08A633:         bcs CODE_08A65B    ;
CODE_08A635:         nop                ;
CODE_08A636:         iwt   r0,#1C18     ; sprite table
CODE_08A639:         add   r10          ;
CODE_08A63A:         to r7              ;
CODE_08A63B:         ldw   (r0)         ;
CODE_08A63C:         lms   r0,(004E)    ;
CODE_08A63F:         to r8              ;
CODE_08A640:         add   r7           ;
CODE_08A641:         sms   (0058),r8    ; 0058 = last polar y + 1C18,x (offset?)
CODE_08A644:         lms   r7,(0122)    ;
CODE_08A647:         lms   r0,(0002)    ;
CODE_08A64A:         sms   (0056),r0    ; 0056 = current polar y
CODE_08A64D:         add   r7           ;
CODE_08A64E:         to r4              ;
CODE_08A64F:         add   r0           ;
CODE_08A650:         add   r8           ;
CODE_08A651:         cmp   r4           ;
CODE_08A653:         bcs CODE_08A65B    ;
CODE_08A655:         nop                ;
CODE_08A656:         lms   r0,(005A)    ;
CODE_08A659:         dec   r0           ;
CODE_08A65A:         sbk                ;
CODE_08A65B:         lms   r14,(005C)   ;
CODE_08A65E:         jmp   r11          ;
CODE_08A65F:         nop                ;

; hookbill sub, applies rotational movement to x coordinate
CODE_08A660:         sms   (0060),r11   ;
CODE_08A663:         link  #04          ;
CODE_08A664:         iwt   r15,#A6DB    ;
CODE_08A667:         nop                ;
CODE_08A668:         sms   (0034),r7    ; x coord computed
CODE_08A66B:         sms   (0036),r8    ; y coord computed
CODE_08A66E:         ibt   r7,#0019     ; \
CODE_08A670:         lms   r0,(0002)    ;  |
CODE_08A673:         add   r7           ;  | jump ahead $19
CODE_08A674:         sbk                ;  | in the chunk
CODE_08A675:         lms   r0,(0004)    ;  |
CODE_08A678:         add   r7           ;  |
CODE_08A679:         sbk                ; /
CODE_08A67A:         ibt   r6,#0020     ;
CODE_08A67C:         lms   r0,(000A)    ;
CODE_08A67F:         lmult              ;
CODE_08A681:         from r4            ;
CODE_08A682:         sbk                ;
CODE_08A683:         iwt   r6,#0400     ;
CODE_08A686:         lms   r0,(003C)    ;
CODE_08A689:         lmult              ;
CODE_08A68B:         from r4            ;
CODE_08A68C:         sbk                ;
CODE_08A68D:         link  #04          ;
CODE_08A68E:         iwt   r15,#A6DB    ; convert polar coords again
CODE_08A691:         nop                ; with new indices
CODE_08A692:         lms   r0,(0032)    ; flag that controls whether movement
CODE_08A695:         sub   #00          ; happens
CODE_08A697:         beq CODE_08A6A8    ;
CODE_08A699:         lms   r0,(0034)    ; previous x coord
CODE_08A69C:         sms   (0026),r0    ;
CODE_08A69F:         sms   (0028),r7    ; new x coord
CODE_08A6A2:         lms   r11,(0060)   ; return
CODE_08A6A5:         jmp   r11          ;
CODE_08A6A6:         nop                ;
;
CODE_08A6A7:         lms   r0,(0036)    ;
CODE_08A6AA:         sub   r8           ;
CODE_08A6AB:         bpl CODE_08A6BE    ;
CODE_08A6AD:         nop                ;
CODE_08A6AE:         lms   r0,(0034)    ;
CODE_08A6B1:         sms   (0026),r0    ;
CODE_08A6B4:         lms   r1,(0028)    ;
CODE_08A6B7:         from r7            ;
CODE_08A6B8:         sbk                ;
CODE_08A6B9:         with r7            ;
CODE_08A6BA:         sub   r1           ;
CODE_08A6BB:         bra CODE_08A6CA    ;

CODE_08A6BD:         nop                ;
CODE_08A6BE:         sms   (0028),r7    ; new x coord
CODE_08A6C1:         lms   r0,(0034)    ;
CODE_08A6C4:         lms   r1,(0026)    ;
CODE_08A6C7:         sbk                ;
CODE_08A6C8:         to r7              ;
CODE_08A6C9:         sub   r1           ;
CODE_08A6CA:         iwt   r0,#10E2     ; \
CODE_08A6CD:         add   r10          ;  | apply the movement to
CODE_08A6CE:         ldw   (r0)         ;  | actual X coordinate
CODE_08A6CF:         sub   r7           ;  |
CODE_08A6D0:         sbk                ; /
CODE_08A6D1:         lms   r0,(000E)    ;
CODE_08A6D4:         sub   r7           ;
CODE_08A6D5:         sbk                ;
CODE_08A6D6:         lms   r11,(0060)   ; return
CODE_08A6D9:         jmp   r11          ;
CODE_08A6DA:         nop                ;

; hookbill sub, returns:
; r7 = x coord (scale * (x1 + x2))
; r8 = y coord (scale * (y1 + y2))
; takes:
; 0002 = index to read angle/radius values
; 0004 = another similar index
CODE_08A6DB:         sms   (0062),r11   ;
CODE_08A6DE:         lms   r0,(0000)    ;
CODE_08A6E1:         romb               ;
CODE_08A6E3:         lms   r14,(0004)   ; for this index within ROM table
CODE_08A6E6:         inc   r14          ; skip first byte, read next four bytes:
CODE_08A6E7:         to r1              ;
CODE_08A6E8:         getb               ; r1 = angle 1
CODE_08A6E9:         inc   r14          ;
CODE_08A6EA:         to r2              ;
CODE_08A6EB:         getb               ; r2 = radius 1
CODE_08A6EC:         inc   r14          ;
CODE_08A6ED:         to r3              ;
CODE_08A6EE:         getb               ; r3 = angle 2
CODE_08A6EF:         inc   r14          ;
CODE_08A6F0:         to r5              ;
CODE_08A6F1:         getb               ; r5 = radius 2
CODE_08A6F2:         lms   r6,(0006)    ;
CODE_08A6F5:         from r6            ;
CODE_08A6F6:         hib                ;
CODE_08A6F7:         bne CODE_08A723    ;
CODE_08A6F9:         nop                ;
CODE_08A6FA:         lms   r0,(000A)    ;
CODE_08A6FD:         add   r0           ;
CODE_08A6FE:         bcc CODE_08A723    ;
CODE_08A700:         nop                ;
CODE_08A701:         lms   r14,(0002)   ; \  for the other index
CODE_08A704:         inc   r14          ;  | these four calls read four values
CODE_08A705:         link  #04          ;  | in a similar fashion as above
CODE_08A706:         iwt   r15,#A83D    ;  |
CODE_08A709:         with r1            ;
CODE_08A70A:         with r1            ;  | with passed in for a move
CODE_08A70A:         to r1              ;
CODE_08A70B:         to r1              ;  | to returned for a different move
CODE_08A70B:         link  #04          ;  |
CODE_08A70C:         iwt   r15,#A874    ;  |
CODE_08A70F:         with r2            ;
CODE_08A710:         with r2            ;  |
CODE_08A710:         to r2              ;
CODE_08A711:         to r2              ;  |
CODE_08A711:         link  #04          ;  |
CODE_08A712:         iwt   r15,#A83D    ;  |
CODE_08A715:         with r3            ;
CODE_08A716:         with r3            ;  |
CODE_08A716:         to r3              ;
CODE_08A717:         to r3              ;  |
CODE_08A717:         link  #04          ;  |
CODE_08A718:         iwt   r15,#A874    ;  |
CODE_08A71B:         with r5            ;
CODE_08A71C:         with r5            ;  |
CODE_08A71C:         to r5              ;
CODE_08A71D:         to r5              ; /
CODE_08A71D:         lms   r0,(003C)    ;
CODE_08A720:         lsr                ;
CODE_08A721:         lsr                ;
CODE_08A722:         sbk                ;
CODE_08A723:         link  #04          ;
CODE_08A724:         iwt   r15,#A81C    ; grab polar coordinate computations
CODE_08A727:         with r2            ;
CODE_08A728:         with r2            ;
CODE_08A728:         move  r7,r0        ; r7 = x1 coord
CODE_08A72A:         move  r8,r1        ; r8 = y1 coord
CODE_08A72C:         move  r1,r3        ; new set of angle &
CODE_08A72E:         move  r6,r5        ; radius (3rd & 4th bytes)
CODE_08A730:         link  #04          ;
CODE_08A731:         iwt   r15,#A821    ; new polar coords computed (x2, y2)
CODE_08A734:         nop                ;
CODE_08A735:         to r7              ;
CODE_08A736:         add   r7           ; x1 + x2
CODE_08A737:         iwt   r0,#1400     ;
CODE_08A73A:         add   r10          ; 1400,x = facing direction
CODE_08A73B:         ldb   (r0)         ; test facing
CODE_08A73D:         sub   #00          ;
CODE_08A73F:         beq CODE_08A744    ;
CODE_08A741:         with r7            ;
CODE_08A742:         not                ; \ two's complement negation
CODE_08A743:         inc   r7           ; / if facing right
CODE_08A744:         lms   r6,(0050)    ; \
CODE_08A747:         from r7            ;
CODE_08A748:         lmult              ;  | x scale value
CODE_08A74A:         with r4            ;
CODE_08A74B:         hib                ;  | * (x1 + x2)
CODE_08A74C:         lob                ;  | two middle byte result
CODE_08A74D:         swap               ;  | -> r7
CODE_08A74E:         to r7              ;
CODE_08A74F:         or    r4           ; /
CODE_08A750:         from r8            ;
CODE_08A751:         add   r1           ; \
CODE_08A752:         lms   r6,(0052)    ;  | y scale value
CODE_08A755:         lmult              ;  | * (y1 + y2)
CODE_08A757:         with r4            ;
CODE_08A758:         hib                ;  | two middle byte result
CODE_08A759:         lob                ;  | -> r8
CODE_08A75A:         swap               ;  |
CODE_08A75B:         to r8              ;
CODE_08A75C:         or    r4           ; /
CODE_08A75D:         lms   r11,(0062)   ; return
CODE_08A760:         jmp   r11          ;
CODE_08A761:         nop                ;

; hookbill sub, similar to above but preserves index
; returns:
; 0022 = computed camera-relative x coord
; 0024 = y
CODE_08A762:         sms   (0060),r11   ;
CODE_08A765:         lms   r0,(0000)    ;
CODE_08A768:         romb               ;
CODE_08A76A:         lms   r14,(0004)   ;
CODE_08A76D:         getb               ; r0 = corresponding index
CODE_08A76E:         inc   r14          ; into 018B46 body part tables
CODE_08A76F:         sms   (0020),r0    ; store index into 0020
CODE_08A772:         to r1              ;
CODE_08A773:         getb               ; r1 = angle 1
CODE_08A774:         inc   r14          ;
CODE_08A775:         to r2              ;
CODE_08A776:         getb               ; r2 = radius 1
CODE_08A777:         inc   r14          ;
CODE_08A778:         to r3              ;
CODE_08A779:         getb               ; r3 = angle 2
CODE_08A77A:         inc   r14          ;
CODE_08A77B:         to r5              ;
CODE_08A77C:         getb               ; r5 = radius 2
CODE_08A77D:         inc   r14          ;
CODE_08A77E:         sms   (0004),r14   ; preserve index for subsequent calls
CODE_08A781:         lms   r6,(0006)    ;
CODE_08A784:         from r6            ;
CODE_08A785:         hib                ;
CODE_08A786:         bne CODE_08A7C4    ;
CODE_08A788:         nop                ;
CODE_08A789:         lms   r14,(0002)   ;
CODE_08A78C:         lms   r0,(000A)    ;
CODE_08A78F:         add   r0           ;
CODE_08A790:         bcs CODE_08A79E    ;
CODE_08A792:         sbk                ;
CODE_08A793:         with r14           ;
CODE_08A794:         add   #05          ;
CODE_08A796:         lms   r0,(003C)    ;
CODE_08A799:         add   r0           ;
CODE_08A79A:         add   r0           ;
CODE_08A79B:         bra CODE_08A7C1    ;

;
CODE_08A79D:         sbk                ;
CODE_08A79E:         to r4              ;
CODE_08A79F:         getb               ;
CODE_08A7A0:         inc   r14          ;
CODE_08A7A1:         from r6            ;
CODE_08A7A2:         sex                ;
CODE_08A7A3:         bmi CODE_08A7A9    ;
CODE_08A7A5:         nop                ;
CODE_08A7A6:         sms   (0020),r4    ; \
CODE_08A7A9:         link  #04          ;  |
CODE_08A7AA:         iwt   r15,#A83D    ;  |
CODE_08A7AD:         with  r1           ;  | with passed in for a move
CODE_08A7AE:         to    r1           ;  | to returned for a different move
CODE_08A7AF:         link  #04          ;  |
CODE_08A7B0:         iwt   r15,#A874    ;  |
CODE_08A7B3:         with  r2           ;  |
CODE_08A7B4:         to    r2           ;  |
CODE_08A7B5:         link  #04          ;  |
CODE_08A7B6:         iwt   r15,#A83D    ;  |
CODE_08A7B9:         with  r3           ;  |
CODE_08A7BA:         to    r3           ;  |
CODE_08A7BB:         link  #04          ;  |
CODE_08A7BC:         iwt   r15,#A874    ;  |
CODE_08A7BF:         with  r5           ;  |
CODE_08A7C0:         to    r5           ; /
CODE_08A7C1:         sms   (0002),r14   ; preserve index for subsequent calls
CODE_08A7C4:         lms   r12,(000E)   ;
CODE_08A7C7:         lms   r13,(0010)   ;
CODE_08A7CA:         link  #04          ;
CODE_08A7CB:         iwt   r15,#A81C    ; polar coordinates
CODE_08A7CE:         with r2            ;
CODE_08A7CF:         with  r2           ;
CODE_08A7CF:         move  r7,r0        ;
CODE_08A7D1:         move  r8,r1        ;
CODE_08A7D3:         move  r1,r3        ;
CODE_08A7D5:         move  r6,r5        ;
CODE_08A7D7:         link  #04          ;
CODE_08A7D8:         iwt   r15,#A821    ; more polar coords
CODE_08A7DB:         nop                ;
CODE_08A7DC:         to r7              ;
CODE_08A7DD:         add   r7           ;
CODE_08A7DE:         iwt   r0,#1400     ;
CODE_08A7E1:         add   r10          ;
CODE_08A7E2:         ldb   (r0)         ;
CODE_08A7E4:         sub   #00          ;
CODE_08A7E6:         beq CODE_08A7EB    ; if facing right
CODE_08A7E8:         with r7            ;
CODE_08A7E9:         not                ; negate
CODE_08A7EA:         inc   r7           ;
CODE_08A7EB:         lms   r6,(0050)    ;
CODE_08A7EE:         from r7            ;
CODE_08A7EF:         lmult              ;
CODE_08A7F1:         with r4            ;
CODE_08A7F2:         hib                ;
CODE_08A7F3:         lob                ;
CODE_08A7F4:         swap               ;
CODE_08A7F5:         to r7              ;
CODE_08A7F6:         or    r4           ; two middle bytes of r7 * r6 -> r7
CODE_08A7F7:         sms   (004C),r7    ;
CODE_08A7FA:         from r7            ;
CODE_08A7FB:         add   r12          ; add camera relative X
CODE_08A7FC:         sms   (0022),r0    ;
CODE_08A7FF:         from r1            ;
CODE_08A800:         add   r8           ;
CODE_08A801:         lms   r6,(0052)    ;
CODE_08A804:         lmult              ; \  lops off highest and lowest
CODE_08A806:         with r4            ;
CODE_08A807:         hib                ;  | bytes of multiplication result
CODE_08A808:         lob                ;  |
CODE_08A809:         swap               ;  | two middle bytes of r6 * r0 -> r0
CODE_08A80A:         or    r4           ; /
CODE_08A80B:         sms   (004E),r0    ; y coordinate computation
CODE_08A80E:         add   r13          ; add camera relative Y coord
CODE_08A80F:         sms   (0024),r0    ;
CODE_08A812:         lms   r0,(0000)    ;
CODE_08A815:         romb               ;
CODE_08A817:         lms   r11,(0060)   ;
CODE_08A81A:         jmp   r11          ;
CODE_08A81B:         nop                ;

; polar coordinates sub (for angular motion)
; parameters:
; with register -> r6: radius
; r1: angle (lookup value)
; returns:
; r0: x coordinate computed, r * cos(angle)
; r1: y coordinate computed, r * sin(angle)
;
CODE_08A81C:         to r6              ; pass in a with to pass in a reg value
CODE_08A81D:         ibt   r0,#0008     ;
CODE_08A81F:         romb               ;
CODE_08A821:         iwt   r0,#AE58     ;
CODE_08A824:         to r14             ;
CODE_08A825:         add   r1           ; table index
CODE_08A826:         iwt   r0,#AE18     ;
CODE_08A829:         to r2              ;
CODE_08A82A:         add   r1           ; table index
CODE_08A82B:         getbs              ; start with AE58, or sine
CODE_08A82D:         mult  r6           ;
CODE_08A82E:         add   r0           ;
CODE_08A82F:         add   r0           ; sine value * r * 4
CODE_08A830:         hib                ; asr >> 8
CODE_08A831:         to r1              ;
CODE_08A832:         sex                ; -> r1
CODE_08A833:         move  r14,r2       ; repeat for AE18 table (cosine)
CODE_08A835:         getbs              ;
CODE_08A837:         mult  r6           ;
CODE_08A838:         add   r0           ;
CODE_08A839:         add   r0           ;
CODE_08A83A:         hib                ;
CODE_08A83B:         jmp   r11          ; cosine value * r >> 6 -> r0
CODE_08A83C:         sex                ;

; hookbill sub, args:
; r7 = p, passed in value (reg)
; r6 = multiplier, (0006)
; r14 = table address
; returns (p - t) * (0006) + t via reg move
CODE_08A83D:         to r7              ; supposed to be a move, with passed in as p
CODE_08A83E:         to r8              ;
CODE_08A83F:         getb               ; r8 = table value (t)
CODE_08A840:         inc   r14          ;
CODE_08A841:         with r7            ;
CODE_08A842:         sub   r8           ; r7 = p - t
CODE_08A843:         move  r12,r7       ; r12 = p - t
CODE_08A845:         iwt   r9,#0080     ;
CODE_08A848:         from r7            ;
CODE_08A849:         add   r9           ; r0 = $80 + p - t
CODE_08A84A:         bne CODE_08A84F    ;
CODE_08A84B:         with  r9           ; just for the branch

CODE_08A84C:         dec   r0           ;
CODE_08A84E:         with r9            ;
CODE_08A84F:         add   r9           ; r9 = $0100
CODE_08A850:         cmp   r9           ;
CODE_08A852:         bcc CODE_08A85F    ; if $80 + p - t < $0100
CODE_08A854:         from r7            ;
CODE_08A855:         sub   #00          ;
CODE_08A857:         bpl CODE_08A85E    ;
CODE_08A859:         with r7            ;
CODE_08A85A:         add   r9           ;
CODE_08A85B:         bra CODE_08A85F    ;

CODE_08A85D:         nop                ;
CODE_08A85E:         sub   r9           ;
CODE_08A85F:         lms   r0,(003C)    ;
CODE_08A862:         add   r0           ;
CODE_08A863:         bcc CODE_08A868    ;
CODE_08A865:         sbk                ;
CODE_08A866:         move  r7,r12       ; restore r7 = p - t
CODE_08A868:         from r7            ;
CODE_08A869:         lmult              ; \
CODE_08A86B:         with r4            ;
CODE_08A86C:         hib                ;  | two middle bytes of r7 * r6
CODE_08A86D:         lob                ;  | -> r0
CODE_08A86E:         swap               ;  |
CODE_08A86F:         or    r4           ; /
CODE_08A870:         add   r8           ; r0 = (p - t) * (0006) + t
CODE_08A871:         lob                ; AND $#00FF
CODE_08A872:         jmp   r11          ;
CODE_08A873:         with r0            ; returns r0

; hookbill sub, p = passed in value (reg)
CODE_08A874:         to r0              ; supposed to be a move, with passed in
CODE_08A875:         to r8              ;
CODE_08A876:         getb               ;
CODE_08A877:         inc   r14          ;
CODE_08A878:         sub   r8           ; \
CODE_08A879:         lmult              ;  | p - table value
CODE_08A87B:         with r4            ;
CODE_08A87C:         hib                ;  | * r6
CODE_08A87D:         lob                ;  | middle bytes
CODE_08A87E:         swap               ;  | + table value
CODE_08A87F:         or    r4           ;  |
CODE_08A880:         add   r8           ; /
CODE_08A881:         jmp   r11          ;
CODE_08A882:         with r0            ; returns r0

; hookbill sub, takes:
; 0022 = current x coordinate computed
; 0024 = current y coordinate computed
; 0048 = current spot in OAM buffer
; this sub loads up OAM with the current computed shit
CODE_08A883:         lms   r0,(0022)    ;
CODE_08A886:         to r1              ;
CODE_08A887:         sub   #08          ; r1 = x - 8
CODE_08A889:         lms   r0,(0024)    ;
CODE_08A88C:         to r2              ;
CODE_08A88D:         sub   #08          ; r2 = y - 8
CODE_08A88F:         lms   r4,(0048)    ; OAM address
CODE_08A892:         iwt   r0,#1042     ;
CODE_08A895:         add   r10          ;
CODE_08A896:         to r3              ;
CODE_08A897:         ldb   (r0)         ;
CODE_08A899:         iwt   r0,#1400     ; facing
CODE_08A89C:         add   r10          ;
CODE_08A89D:         ldb   (r0)         ;
CODE_08A89F:         add   r0           ;
CODE_08A8A0:         add   r0           ;
CODE_08A8A1:         mult  #08          ;
CODE_08A8A3:         xor   r3           ;
CODE_08A8A5:         to r3              ;
CODE_08A8A6:         swap               ;
CODE_08A8A7:         iwt   r0,#10E0     ; sprite x coord
CODE_08A8AA:         add   r10          ;
CODE_08A8AB:         ldb   (r0)         ;
CODE_08A8AD:         to r8              ;
CODE_08A8AE:         swap               ;
CODE_08A8AF:         sms   (0060),r11   ;
CODE_08A8B2:         cache              ;
CODE_08A8B3:         move  r13,r15      ; loop start
CODE_08A8B5:         getbs              ;
CODE_08A8B7:         iwt   r9,#4000     ;
CODE_08A8BA:         with r9            ;
CODE_08A8BB:         and   r3           ;
CODE_08A8BC:         beq CODE_08A8C3    ;
CODE_08A8BE:         inc   r14          ;
CODE_08A8BF:         not                ;
CODE_08A8C0:         inc   r0           ;
CODE_08A8C1:         ibt   r9,#0008     ;
CODE_08A8C3:         to r5              ;
CODE_08A8C4:         add   r1           ; r5 = computed x coord + byte 1
CODE_08A8C5:         getbs              ;
CODE_08A8C7:         ibt   r11,#0000    ;
CODE_08A8C9:         moves r3,r3        ;
CODE_08A8CB:         bpl CODE_08A8D2    ;
CODE_08A8CD:         inc   r14          ;
CODE_08A8CE:         not                ;
CODE_08A8CF:         inc   r0           ;
CODE_08A8D0:         ibt   r11,#0008    ;
CODE_08A8D2:         to r6              ;
CODE_08A8D3:         add   r2           ; r6 = computed y + byte 2
CODE_08A8D4:         getb               ;
CODE_08A8D5:         inc   r14          ;
CODE_08A8D6:         getbh              ;
CODE_08A8D8:         inc   r14          ;
CODE_08A8D9:         to r7              ;
CODE_08A8DA:         xor   r3           ; r7 = OAM stuff (bytes 3 & 4)
CODE_08A8DC:         getb               ; last byte: size (00 or 02)
CODE_08A8DD:         and   #02          ; for high table
CODE_08A8DF:         bne CODE_08A8E6    ;
CODE_08A8E1:         nop                ;
CODE_08A8E2:         with r5            ;
CODE_08A8E3:         add   r9           ;
CODE_08A8E4:         with r6            ;
CODE_08A8E5:         add   r11          ;
CODE_08A8E6:         getbh              ;
CODE_08A8E8:         inc   r14          ;
CODE_08A8E9:         from r5            ;
CODE_08A8EA:         stw   (r4)         ; word 1: OAM x coord
CODE_08A8EB:         inc   r4           ;
CODE_08A8EC:         inc   r4           ;
CODE_08A8ED:         to r5              ;
CODE_08A8EE:         xor   r8           ;
CODE_08A8F0:         from r6            ;
CODE_08A8F1:         stw   (r4)         ; word 2: OAM y coord
CODE_08A8F2:         inc   r4           ;
CODE_08A8F3:         inc   r4           ;
CODE_08A8F4:         from r7            ;
CODE_08A8F5:         stw   (r4)         ; word 3: OAM low bytes 3 & 4
CODE_08A8F6:         inc   r4           ;
CODE_08A8F7:         inc   r4           ;
CODE_08A8F8:         from r5            ;
CODE_08A8F9:         stw   (r4)         ; word 4: high table
CODE_08A8FA:         inc   r4           ;
CODE_08A8FB:         loop               ;
CODE_08A8FC:         inc   r4           ;
CODE_08A8FD:         lms   r11,(0060)   ;
CODE_08A900:         sms   (0048),r4    ; preserve address for next call
CODE_08A903:         jmp   r11          ;
CODE_08A904:         nop                ;

; sub
; this sub gets a value from $018927 with the $002C index
; then calls $A83D with $002A index
; does math between the two values and returns that via r1
CODE_08A905:         sms   (0060),r11   ;
CODE_08A908:         lms   r14,(002C)   ;
CODE_08A90B:         to r1              ;
CODE_08A90C:         getb               ;
CODE_08A90D:         inc   r14          ;
CODE_08A90E:         from r14           ;
CODE_08A90F:         sbk                ; preserve address to step through entry 1
CODE_08A910:         lms   r6,(0006)    ;
CODE_08A913:         from r6            ;
CODE_08A914:         hib                ;
CODE_08A915:         bne CODE_08A924    ;
CODE_08A917:         nop                ;
CODE_08A918:         lms   r14,(002A)   ;
CODE_08A91B:         link  #04          ;
CODE_08A91C:         iwt   r15,#A83D    ; passing in r1 = 8927 table value
CODE_08A91F:         with r1            ;
CODE_08A920:         with  r1           ;
CODE_08A920:         to r1              ;
CODE_08A921:         to    r1           ; returns (0006) * (t1 - t2) + t2
CODE_08A921:         sms   (002A),r14   ; preserve address to step through entry 2
CODE_08A924:         lms   r11,(0060)   ;
CODE_08A927:         jmp   r11          ;
CODE_08A928:         nop                ;

CODE_08A929:         iwt   r0,#1400     ;
CODE_08A92C:         add   r10          ;
CODE_08A92D:         to r4              ;
CODE_08A92E:         ldw   (r0)         ;
CODE_08A92F:         with r1            ;
CODE_08A930:         sub   r3           ;
CODE_08A931:         moves r4,r4        ;
CODE_08A933:         bne CODE_08A939    ;
CODE_08A935:         nop                ;
CODE_08A936:         with r1            ;
CODE_08A937:         not                ;
CODE_08A938:         inc   r1           ;
CODE_08A939:         from r1            ;
CODE_08A93A:         sub   r2           ;
CODE_08A93B:         add   r0           ;
CODE_08A93C:         to r3              ;
CODE_08A93D:         lmult              ;
CODE_08A93F:         iwt   r0,#10E3     ;
CODE_08A942:         add   r10          ;
CODE_08A943:         to r5              ;
CODE_08A944:         ldb   (r0)         ;
CODE_08A946:         iwt   r0,#10E1     ;
CODE_08A949:         add   r10          ;
CODE_08A94A:         ldb   (r0)         ;
CODE_08A94C:         iwt   r2,#10E2     ;
CODE_08A94F:         with r2            ;
CODE_08A950:         add   r10          ;
CODE_08A951:         to r2              ;
CODE_08A952:         ldb   (r2)         ;
CODE_08A954:         with r2            ;
CODE_08A955:         swap               ;
CODE_08A956:         to r2              ;
CODE_08A957:         or    r2           ;
CODE_08A958:         from r3            ;
CODE_08A959:         sub   #00          ;
CODE_08A95B:         bmi CODE_08A965    ;
CODE_08A95D:         with r2            ;
CODE_08A95E:         add   r4           ;
CODE_08A95F:         from r5            ;
CODE_08A960:         adc   #00          ;
CODE_08A962:         bra CODE_08A96B    ;

CODE_08A964:         nop                ;
CODE_08A965:         add   r4           ;
CODE_08A966:         bcs CODE_08A96B    ;
CODE_08A968:         from r5            ;
CODE_08A969:         sub   #01          ;
CODE_08A96B:         lob                ;
CODE_08A96C:         to r6              ;
CODE_08A96D:         swap               ;
CODE_08A96E:         from r2            ;
CODE_08A96F:         hib                ;
CODE_08A970:         or    r6           ;
CODE_08A971:         sbk                ;
CODE_08A972:         iwt   r0,#10E1     ;
CODE_08A975:         add   r10          ;
CODE_08A976:         from r2            ;
CODE_08A977:         stb   (r0)         ;
CODE_08A979:         stop               ;
CODE_08A97A:         nop                ;

CODE_08A97B:         sub   r0           ;
CODE_08A97C:         ramb               ;
CODE_08A97E:         stop               ;
CODE_08A97F:         nop                ;

CODE_08A980:         from r4            ;
CODE_08A981:         romb               ;
CODE_08A983:         move  r14,r9       ;
CODE_08A985:         move  r9,r10       ;
CODE_08A987:         iwt   r5,#03FF     ;
CODE_08A98A:         ibt   r6,#001F     ;
CODE_08A98C:         iwt   r7,#00E0     ;
CODE_08A98F:         iwt   r8,#00FF     ;
CODE_08A992:         iwt   r11,#A997    ;
CODE_08A995:         cache              ;
CODE_08A996:         getb               ;
CODE_08A997:         inc   r14          ;
CODE_08A998:         bne CODE_08A9A3    ;
CODE_08A99A:         sub   r8           ;
CODE_08A99B:         add   r8           ;
CODE_08A99C:         inc   r4           ;
CODE_08A99D:         from r4            ;
CODE_08A99E:         romb               ;
CODE_08A9A0:         move  r14,r14      ;
CODE_08A9A2:         sub   r8           ;
CODE_08A9A3:         bne CODE_08A9A8    ;
CODE_08A9A5:         add   r8           ;
CODE_08A9A6:         stop               ;
CODE_08A9A7:         nop                ;

CODE_08A9A8:         to r2              ;
CODE_08A9A9:         and   r7           ;
CODE_08A9AA:         sub   r7           ;
CODE_08A9AB:         bpl CODE_08A9B2    ;
CODE_08A9AD:         add   r7           ;
CODE_08A9AE:         and   r6           ;
CODE_08A9AF:         bra CODE_08A9C9    ;

CODE_08A9B1:         inc   r0           ;
CODE_08A9B2:         move  r1,r0        ;
CODE_08A9B4:         add   r0           ;
CODE_08A9B5:         add   r0           ;
CODE_08A9B6:         add   r0           ;
CODE_08A9B7:         to r2              ;
CODE_08A9B8:         and   r7           ;
CODE_08A9B9:         getb               ;
CODE_08A9BA:         inc   r14          ;
CODE_08A9BB:         bne CODE_08A9C5    ;
CODE_08A9BD:         with r1            ;
CODE_08A9BE:         inc   r4           ;
CODE_08A9BF:         from r4            ;
CODE_08A9C0:         romb               ;
CODE_08A9C2:         move  r14,r14      ;
CODE_08A9C4:         with r1            ;
CODE_08A9C5:         swap               ;
CODE_08A9C6:         or    r1           ;
CODE_08A9C7:         and   r5           ;
CODE_08A9C8:         inc   r0           ;
CODE_08A9C9:         move  r12,r0       ;
CODE_08A9CB:         moves r0,r2        ;
CODE_08A9CD:         beq CODE_08A9EC    ;
CODE_08A9CF:         swap               ;
CODE_08A9D0:         bmi CODE_08A9FF    ;
CODE_08A9D2:         add   r0           ;
CODE_08A9D3:         bpl CODE_08AA27    ;
CODE_08A9D5:         add   r0           ;
CODE_08A9D6:         bpl CODE_08AA3A    ;
CODE_08A9D8:         getb               ;
CODE_08A9D9:         inc   r14          ;
CODE_08A9DA:         bne CODE_08A9E3    ;
CODE_08A9DC:         nop                ;
CODE_08A9DD:         inc   r4           ;
CODE_08A9DE:         from r4            ;
CODE_08A9DF:         romb               ;
CODE_08A9E1:         move  r14,r14      ;
CODE_08A9E3:         move  r13,r15      ;
CODE_08A9E5:         stb   (r10)        ;
CODE_08A9E7:         inc   r0           ;
CODE_08A9E8:         loop               ;
CODE_08A9E9:         inc   r10          ;
CODE_08A9EA:         jmp   r11          ;
CODE_08A9EB:         getb               ;
CODE_08A9EC:         move  r13,r15      ;
CODE_08A9EE:         getb               ;
CODE_08A9EF:         inc   r14          ;
CODE_08A9F0:         bne CODE_08A9F9    ;
CODE_08A9F2:         nop                ;
CODE_08A9F3:         inc   r4           ;
CODE_08A9F4:         from r4            ;
CODE_08A9F5:         romb               ;
CODE_08A9F7:         move  r14,r14      ;
CODE_08A9F9:         stb   (r10)        ;
CODE_08A9FB:         loop               ;
CODE_08A9FC:         inc   r10          ;
CODE_08A9FD:         jmp   r11          ;
CODE_08A9FE:         getb               ;
CODE_08A9FF:         with r1            ;
CODE_08AA00:         getb               ;
CODE_08AA01:         inc   r14          ;
CODE_08AA02:         bne CODE_08AA0C    ;
CODE_08AA04:         getb               ;
CODE_08AA05:         inc   r4           ;
CODE_08AA06:         from r4            ;
CODE_08AA07:         romb               ;
CODE_08AA09:         move  r14,r14      ;
CODE_08AA0B:         getb               ;
CODE_08AA0C:         inc   r14          ;
CODE_08AA0D:         bne CODE_08AA17    ;
CODE_08AA0F:         with r1            ;
CODE_08AA10:         inc   r4           ;
CODE_08AA11:         from r4            ;
CODE_08AA12:         romb               ;
CODE_08AA14:         move  r14,r14      ;
CODE_08AA16:         with r1            ;
CODE_08AA17:         swap               ;
CODE_08AA18:         to r2              ;
CODE_08AA19:         or    r1           ;
CODE_08AA1A:         with r2            ;
CODE_08AA1B:         add   r9           ;
CODE_08AA1C:         move  r13,r15      ;
CODE_08AA1E:         ldb   (r2)         ;
CODE_08AA20:         stb   (r10)        ;
CODE_08AA22:         inc   r2           ;
CODE_08AA23:         loop               ;
CODE_08AA24:         inc   r10          ;
CODE_08AA25:         jmp   r11          ;
CODE_08AA26:         getb               ;
CODE_08AA27:         getb               ;
CODE_08AA28:         inc   r14          ;
CODE_08AA29:         bne CODE_08AA32    ;
CODE_08AA2B:         nop                ;
CODE_08AA2C:         inc   r4           ;
CODE_08AA2D:         from r4            ;
CODE_08AA2E:         romb               ;
CODE_08AA30:         move  r14,r14      ;
CODE_08AA32:         move  r13,r15      ;
CODE_08AA34:         stb   (r10)        ;
CODE_08AA36:         loop               ;
CODE_08AA37:         inc   r10          ;
CODE_08AA38:         jmp   r11          ;
CODE_08AA39:         getb               ;
CODE_08AA3A:         inc   r14          ;
CODE_08AA3B:         bne CODE_08AA45    ;
CODE_08AA3D:         with r1            ;
CODE_08AA3E:         inc   r4           ;
CODE_08AA3F:         from r4            ;
CODE_08AA40:         romb               ;
CODE_08AA42:         move  r14,r14      ;
CODE_08AA44:         with r1            ;
CODE_08AA45:         getb               ;
CODE_08AA46:         inc   r14          ;
CODE_08AA47:         bne CODE_08AA50    ;
CODE_08AA49:         nop                ;
CODE_08AA4A:         inc   r4           ;
CODE_08AA4B:         from r4            ;
CODE_08AA4C:         romb               ;
CODE_08AA4E:         move  r14,r14      ;
CODE_08AA50:         move  r13,r15      ;
CODE_08AA52:         stb   (r10)        ;
CODE_08AA54:         inc   r10          ;
CODE_08AA55:         dec   r12          ;
CODE_08AA56:         beq CODE_08AA5D    ;
CODE_08AA58:         from r1            ;
CODE_08AA59:         stb   (r10)        ;
CODE_08AA5B:         loop               ;
CODE_08AA5C:         inc   r10          ;
CODE_08AA5D:         jmp   r11          ;
CODE_08AA5E:         getb               ;
CODE_08AA5F:         iwt   r1,#7000     ;
CODE_08AA62:         iwt   r2,#6800     ;
CODE_08AA65:         ibt   r3,#000F     ;
CODE_08AA67:         iwt   r4,#00F0     ;
CODE_08AA6A:         cache              ;
CODE_08AA6B:         move  r13,r15      ;
CODE_08AA6D:         ldb   (r1)         ;
CODE_08AA6F:         to r5              ;
CODE_08AA70:         and   r3           ;
CODE_08AA71:         and   r4           ;
CODE_08AA72:         lsr                ;
CODE_08AA73:         lsr                ;
CODE_08AA74:         lsr                ;
CODE_08AA75:         lsr                ;
CODE_08AA76:         swap               ;
CODE_08AA77:         or    r5           ;
CODE_08AA78:         stw   (r2)         ;
CODE_08AA79:         inc   r2           ;
CODE_08AA7A:         inc   r2           ;
CODE_08AA7B:         loop               ;
CODE_08AA7C:         inc   r1           ;
CODE_08AA7D:         stop               ;
CODE_08AA7E:         nop                ;

CODE_08AA7F:         cache              ;
CODE_08AA80:         move  r13,r15      ;
CODE_08AA82:         ldb   (r1)         ;
CODE_08AA84:         stb   (r2)         ;
CODE_08AA86:         inc   r1           ;
CODE_08AA87:         loop               ;
CODE_08AA88:         inc   r2           ;
CODE_08AA89:         stop               ;
CODE_08AA8A:         nop                ;

CODE_08AA8B:         cache              ;
CODE_08AA8C:         move  r13,r15      ;
CODE_08AA8E:         from r2            ;
CODE_08AA8F:         stw   (r0)         ;
CODE_08AA90:         loop               ;
CODE_08AA91:         add   r1           ;
CODE_08AA92:         stop               ;
CODE_08AA93:         nop                ;

CODE_08AA94:         lm    r0,(2684)    ;
CODE_08AA98:         link  #04          ;
CODE_08AA99:         iwt   r15,#AB76    ;
CODE_08AA9C:         nop                ;
CODE_08AA9D:         move  r1,r0        ;
CODE_08AA9F:         lm    r0,(2684)    ;
CODE_08AAA3:         link  #04          ;
CODE_08AAA4:         iwt   r15,#AB83    ;
CODE_08AAA7:         nop                ;
CODE_08AAA8:         move  r2,r0        ;
CODE_08AAAA:         lm    r3,(268A)    ;
CODE_08AAAE:         lm    r5,(268C)    ;
CODE_08AAB2:         lm    r11,(2686)   ;
CODE_08AAB6:         lm    r14,(2688)   ;
CODE_08AABA:         move  r6,r2        ;
CODE_08AABC:         move  r0,r3        ;
CODE_08AABE:         lmult              ;
CODE_08AAC0:         lob                ;
CODE_08AAC1:         to r7              ;
CODE_08AAC2:         swap               ;
CODE_08AAC3:         from r4            ;
CODE_08AAC4:         hib                ;
CODE_08AAC5:         to r7              ;
CODE_08AAC6:         or    r7           ;
CODE_08AAC7:         move  r6,r1        ;
CODE_08AAC9:         move  r0,r3        ;
CODE_08AACB:         lmult              ;
CODE_08AACD:         lob                ;
CODE_08AACE:         to r8              ;
CODE_08AACF:         swap               ;
CODE_08AAD0:         from r4            ;
CODE_08AAD1:         hib                ;
CODE_08AAD2:         to r8              ;
CODE_08AAD3:         or    r8           ;
CODE_08AAD4:         move  r6,r2        ;
CODE_08AAD6:         move  r0,r5        ;
CODE_08AAD8:         lmult              ;
CODE_08AADA:         lob                ;
CODE_08AADB:         to r9              ;
CODE_08AADC:         swap               ;
CODE_08AADD:         from r4            ;
CODE_08AADE:         hib                ;
CODE_08AADF:         to r9              ;
CODE_08AAE0:         or    r9           ;
CODE_08AAE1:         move  r6,r1        ;
CODE_08AAE3:         move  r0,r5        ;
CODE_08AAE5:         lmult              ;
CODE_08AAE7:         lob                ;
CODE_08AAE8:         to r10             ;
CODE_08AAE9:         swap               ;
CODE_08AAEA:         from r4            ;
CODE_08AAEB:         hib                ;
CODE_08AAEC:         to r10             ;
CODE_08AAED:         or    r10          ;
CODE_08AAEE:         iwt   r1,#0200     ;
CODE_08AAF1:         iwt   r12,#0100    ;
CODE_08AAF4:         cache              ;
CODE_08AAF5:         move  r13,r15      ;
CODE_08AAF7:         ldw   (r1)         ;
CODE_08AAF8:         iwt   r2,#8000     ;
CODE_08AAFB:         cmp   r2           ;
CODE_08AAFD:         bne CODE_08AB07    ;
CODE_08AAFF:         nop                ;
CODE_08AB00:         with r1            ;
CODE_08AB01:         add   #08          ;
CODE_08AB03:         loop               ;
CODE_08AB04:         nop                ;
CODE_08AB05:         stop               ;
CODE_08AB06:         nop                ;

CODE_08AB07:         to r2              ;
CODE_08AB08:         sub   r11          ;
CODE_08AB09:         move  r5,r1        ;
CODE_08AB0B:         inc   r5           ;
CODE_08AB0C:         inc   r5           ;
CODE_08AB0D:         ldw   (r5)         ;
CODE_08AB0E:         to r3              ;
CODE_08AB0F:         sub   r14          ;
CODE_08AB10:         with r5            ;
CODE_08AB11:         add   #04          ;
CODE_08AB13:         ldw   (r5)         ;
CODE_08AB14:         add   #00          ;
CODE_08AB16:         bpl CODE_08AB00    ;
CODE_08AB18:         nop                ;
CODE_08AB19:         move  r6,r7        ;
CODE_08AB1B:         move  r0,r2        ;
CODE_08AB1D:         lmult              ;
CODE_08AB1F:         sms   (0000),r4    ;
CODE_08AB22:         sms   (0002),r0    ;
CODE_08AB25:         move  r6,r8        ;
CODE_08AB27:         move  r0,r3        ;
CODE_08AB29:         lmult              ;
CODE_08AB2B:         sms   (0004),r0    ;
CODE_08AB2E:         lms   r0,(0000)    ;
CODE_08AB31:         to r5              ;
CODE_08AB32:         add   r4           ;
CODE_08AB33:         lms   r0,(0002)    ;
CODE_08AB36:         lms   r4,(0004)    ;
CODE_08AB39:         adc   r4           ;
CODE_08AB3B:         lob                ;
CODE_08AB3C:         to r4              ;
CODE_08AB3D:         swap               ;
CODE_08AB3E:         from r5            ;
CODE_08AB3F:         hib                ;
CODE_08AB40:         or    r4           ;
CODE_08AB41:         add   r11          ;
CODE_08AB42:         stw   (r1)         ;
CODE_08AB43:         inc   r1           ;
CODE_08AB44:         inc   r1           ;
CODE_08AB45:         move  r6,r9        ;
CODE_08AB47:         move  r0,r3        ;
CODE_08AB49:         lmult              ;
CODE_08AB4B:         sms   (0000),r4    ;
CODE_08AB4E:         sms   (0002),r0    ;
CODE_08AB51:         move  r6,r10       ;
CODE_08AB53:         move  r0,r2        ;
CODE_08AB55:         lmult              ;
CODE_08AB57:         sms   (0004),r0    ;
CODE_08AB5A:         lms   r0,(0000)    ;
CODE_08AB5D:         to r5              ;
CODE_08AB5E:         sub   r4           ;
CODE_08AB5F:         lms   r0,(0002)    ;
CODE_08AB62:         lms   r4,(0004)    ;
CODE_08AB65:         sbc   r4           ;
CODE_08AB67:         lob                ;
CODE_08AB68:         to r4              ;
CODE_08AB69:         swap               ;
CODE_08AB6A:         from r5            ;
CODE_08AB6B:         hib                ;
CODE_08AB6C:         or    r4           ;
CODE_08AB6D:         add   r14          ;
CODE_08AB6E:         stw   (r1)         ;
CODE_08AB6F:         with r1            ;
CODE_08AB70:         add   #06          ;
CODE_08AB72:         loop               ;
CODE_08AB73:         nop                ;
CODE_08AB74:         stop               ;
CODE_08AB75:         nop                ;

CODE_08AB76:         lob                ;
CODE_08AB77:         add   r0           ;
CODE_08AB78:         iwt   r14,#AC18    ;
CODE_08AB7B:         to r14             ;
CODE_08AB7C:         add   r14          ;
CODE_08AB7D:         getb               ;
CODE_08AB7E:         inc   r14          ;
CODE_08AB7F:         getbh              ;
CODE_08AB81:         jmp   r11          ;
CODE_08AB82:         nop                ;
CODE_08AB83:         lob                ;
CODE_08AB84:         add   r0           ;
CODE_08AB85:         iwt   r14,#AB98    ;
CODE_08AB88:         to r14             ;
CODE_08AB89:         add   r14          ;
CODE_08AB8A:         getb               ;
CODE_08AB8B:         inc   r14          ;
CODE_08AB8C:         getbh              ;
CODE_08AB8E:         jmp   r11          ;
CODE_08AB8F:         nop                ;

DATA_08AB90:         db $08, $08, $08, $08
DATA_08AB94:         db $08, $08, $10, $10

; 16-bit trig table: cosine starts
DATA_08AB98:         dw $0100, $0100, $0100, $00FF
DATA_08ABA0:         dw $00FF, $00FE, $00FD, $00FC
DATA_08ABA8:         dw $00FB, $00FA, $00F8, $00F7
DATA_08ABB0:         dw $00F5, $00F3, $00F1, $00EF
DATA_08ABB8:         dw $00ED, $00EA, $00E7, $00E5
DATA_08ABC0:         dw $00E2, $00DF, $00DC, $00D8
DATA_08ABC8:         dw $00D5, $00D1, $00CE, $00CA
DATA_08ABD0:         dw $00C6, $00C2, $00BE, $00B9
DATA_08ABD8:         dw $00B5, $00B1, $00AC, $00A7
DATA_08ABE0:         dw $00A2, $009D, $0098, $0093
DATA_08ABE8:         dw $008E, $0089, $0084, $007E
DATA_08ABF0:         dw $0079, $0073, $006D, $0068
DATA_08ABF8:         dw $0062, $005C, $0056, $0050
DATA_08AC00:         dw $004A, $0044, $003E, $0038
DATA_08AC08:         dw $0032, $002C, $0026, $001F
DATA_08AC10:         dw $0019, $0013, $000D, $0006
; sine starts here
DATA_08AC18:         dw $0000, $FFFA, $FFF3, $FFED
DATA_08AC20:         dw $FFE7, $FFE1, $FFDA, $FFD4
DATA_08AC28:         dw $FFCE, $FFC8, $FFC2, $FFBC
DATA_08AC30:         dw $FFB6, $FFB0, $FFAA, $FFA4
DATA_08AC38:         dw $FF9E, $FF98, $FF93, $FF8D
DATA_08AC40:         dw $FF87, $FF82, $FF7C, $FF77
DATA_08AC48:         dw $FF72, $FF6D, $FF68, $FF63
DATA_08AC50:         dw $FF5E, $FF59, $FF54, $FF4F
DATA_08AC58:         dw $FF4B, $FF47, $FF42, $FF3E
DATA_08AC60:         dw $FF3A, $FF36, $FF32, $FF2F
DATA_08AC68:         dw $FF2B, $FF28, $FF24, $FF21
DATA_08AC70:         dw $FF1E, $FF1B, $FF19, $FF16
DATA_08AC78:         dw $FF13, $FF11, $FF0F, $FF0D
DATA_08AC80:         dw $FF0B, $FF09, $FF08, $FF06
DATA_08AC88:         dw $FF05, $FF04, $FF03, $FF02
DATA_08AC90:         dw $FF01, $FF01, $FF00, $FF00
DATA_08AC98:         dw $FF00, $FF00, $FF00, $FF01
DATA_08ACA0:         dw $FF01, $FF02, $FF03, $FF04
DATA_08ACA8:         dw $FF05, $FF06, $FF08, $FF09
DATA_08ACB0:         dw $FF0B, $FF0D, $FF0F, $FF11
DATA_08ACB8:         dw $FF13, $FF16, $FF19, $FF1B
DATA_08ACC0:         dw $FF1E, $FF21, $FF24, $FF28
DATA_08ACC8:         dw $FF2B, $FF2F, $FF32, $FF36
DATA_08ACD0:         dw $FF3A, $FF3E, $FF42, $FF47
DATA_08ACD8:         dw $FF4B, $FF4F, $FF54, $FF59
DATA_08ACE0:         dw $FF5E, $FF63, $FF68, $FF6D
DATA_08ACE8:         dw $FF72, $FF77, $FF7C, $FF82
DATA_08ACF0:         dw $FF87, $FF8D, $FF93, $FF98
DATA_08ACF8:         dw $FF9E, $FFA4, $FFAA, $FFB0
DATA_08AD00:         dw $FFB6, $FFBC, $FFC2, $FFC8
DATA_08AD08:         dw $FFCE, $FFD4, $FFDA, $FFE1
DATA_08AD10:         dw $FFE7, $FFED, $FFF3, $FFFA
DATA_08AD18:         dw $0000, $0006, $000D, $0013
DATA_08AD20:         dw $0019, $001F, $0026, $002C
DATA_08AD28:         dw $0032, $0038, $003E, $0044
DATA_08AD30:         dw $004A, $0050, $0056, $005C
DATA_08AD38:         dw $0062, $0068, $006D, $0073
DATA_08AD40:         dw $0079, $007E, $0084, $0089
DATA_08AD48:         dw $008E, $0093, $0098, $009D
DATA_08AD50:         dw $00A2, $00A7, $00AC, $00B1
DATA_08AD58:         dw $00B5, $00B9, $00BE, $00C2
DATA_08AD60:         dw $00C6, $00CA, $00CE, $00D1
DATA_08AD68:         dw $00D5, $00D8, $00DC, $00DF
DATA_08AD70:         dw $00E2, $00E5, $00E7, $00EA
DATA_08AD78:         dw $00ED, $00EF, $00F1, $00F3
DATA_08AD80:         dw $00F5, $00F7, $00F8, $00FA
DATA_08AD88:         dw $00FB, $00FC, $00FD, $00FE
DATA_08AD90:         dw $00FF, $00FF, $0100, $0100
DATA_08AD98:         dw $0100, $0100, $0100, $00FF
DATA_08ADA0:         dw $00FF, $00FE, $00FD, $00FC
DATA_08ADA8:         dw $00FB, $00FA, $00F8, $00F7
DATA_08ADB0:         dw $00F5, $00F3, $00F1, $00EF
DATA_08ADB8:         dw $00ED, $00EA, $00E7, $00E5
DATA_08ADC0:         dw $00E2, $00DF, $00DC, $00D8
DATA_08ADC8:         dw $00D5, $00D1, $00CE, $00CA
DATA_08ADD0:         dw $00C6, $00C2, $00BE, $00B9
DATA_08ADD8:         dw $00B5, $00B1, $00AC, $00A7
DATA_08ADE0:         dw $00A2, $009D, $0098, $0093
DATA_08ADE8:         dw $008E, $0089, $0084, $007E
DATA_08ADF0:         dw $0079, $0073, $006D, $0068
DATA_08ADF8:         dw $0062, $005C, $0056, $0050
DATA_08AE00:         dw $004A, $0044, $003E, $0038
DATA_08AE08:         dw $0032, $002C, $0026, $001F
DATA_08AE10:         dw $0019, $0013, $000D, $0006

; 8-bit trig table: cosine starts here
DATA_08AE18:         db $40, $40, $40, $40, $40, $40, $3F, $3F
DATA_08AE20:         db $3F, $3E, $3E, $3E, $3D, $3D, $3C, $3C
DATA_08AE28:         db $3B, $3B, $3A, $39, $38, $38, $37, $36
DATA_08AE30:         db $35, $34, $33, $32, $31, $30, $2F, $2E
DATA_08AE38:         db $2D, $2C, $2B, $2A, $29, $27, $26, $25
DATA_08AE40:         db $24, $22, $21, $20, $1E, $1D, $1B, $1A
DATA_08AE48:         db $18, $17, $16, $14, $13, $11, $10, $0E
DATA_08AE50:         db $0C, $0B, $09, $08, $06, $05, $03, $02
; sine starts here
DATA_08AE58:         db $00, $FE, $FD, $FB, $FA, $F8, $F7, $F5
DATA_08AE60:         db $F4, $F2, $F0, $EF, $ED, $EC, $EA, $E9
DATA_08AE68:         db $E8, $E6, $E5, $E3, $E2, $E0, $DF, $DE
DATA_08AE70:         db $DC, $DB, $DA, $D9, $D7, $D6, $D5, $D4
DATA_08AE78:         db $D3, $D2, $D1, $D0, $CF, $CE, $CD, $CC
DATA_08AE80:         db $CB, $CA, $C9, $C8, $C8, $C7, $C6, $C5
DATA_08AE88:         db $C5, $C4, $C4, $C3, $C3, $C2, $C2, $C2
DATA_08AE90:         db $C1, $C1, $C1, $C0, $C0, $C0, $C0, $C0
DATA_08AE98:         db $C0, $C0, $C0, $C0, $C0, $C0, $C1, $C1
DATA_08AEA0:         db $C1, $C2, $C2, $C2, $C3, $C3, $C4, $C4
DATA_08AEA8:         db $C5, $C5, $C6, $C7, $C8, $C8, $C9, $CA
DATA_08AEB0:         db $CB, $CC, $CD, $CE, $CF, $D0, $D1, $D2
DATA_08AEB8:         db $D3, $D4, $D5, $D6, $D7, $D9, $DA, $DB
DATA_08AEC0:         db $DC, $DE, $DF, $E0, $E2, $E3, $E5, $E6
DATA_08AEC8:         db $E8, $E9, $EA, $EC, $ED, $EF, $F0, $F2
DATA_08AED0:         db $F4, $F5, $F7, $F8, $FA, $FB, $FD, $FE
DATA_08AED8:         db $00, $02, $03, $05, $06, $08, $09, $0B
DATA_08AEE0:         db $0C, $0E, $10, $11, $13, $14, $16, $17
DATA_08AEE8:         db $18, $1A, $1B, $1D, $1E, $20, $21, $22
DATA_08AEF0:         db $24, $25, $26, $27, $29, $2A, $2B, $2C
DATA_08AEF8:         db $2D, $2E, $2F, $30, $31, $32, $33, $34
DATA_08AF00:         db $35, $36, $37, $38, $38, $39, $3A, $3B
DATA_08AF08:         db $3B, $3C, $3C, $3D, $3D, $3E, $3E, $3E
DATA_08AF10:         db $3F, $3F, $3F, $40, $40, $40, $40, $40
DATA_08AF18:         db $40, $40, $40, $40, $40, $40, $3F, $3F
DATA_08AF20:         db $3F, $3E, $3E, $3E, $3D, $3D, $3C, $3C
DATA_08AF28:         db $3B, $3B, $3A, $39, $38, $38, $37, $36
DATA_08AF30:         db $35, $34, $33, $32, $31, $30, $2F, $2E
DATA_08AF38:         db $2D, $2C, $2B, $2A, $29, $27, $26, $25
DATA_08AF40:         db $24, $22, $21, $20, $1E, $1D, $1B, $1A
DATA_08AF48:         db $18, $17, $16, $14, $13, $11, $10, $0E
DATA_08AF50:         db $0C, $0B, $09, $08, $06, $05, $03, $02
DATA_08AF58:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_08AF60:         db $40, $40, $40, $3F, $3F, $3F, $3F, $3F
DATA_08AF68:         db $3F, $3F, $3E, $3E, $3E, $3E, $3E, $3D
DATA_08AF70:         db $3D, $3D, $3D, $3D, $3C, $3C, $3C, $3B
DATA_08AF78:         db $3B, $3B, $3B, $3A, $3A, $3A, $39, $39
DATA_08AF80:         db $38, $38, $38, $37, $37, $36, $36, $36
DATA_08AF88:         db $35, $35, $34, $34, $33, $33, $32, $32
DATA_08AF90:         db $31, $31, $30, $30, $2F, $2F, $2E, $2E
DATA_08AF98:         db $2D, $2D, $2C, $2C, $2B, $2A, $2A, $29
DATA_08AFA0:         db $29, $28, $27, $27, $26, $25, $25, $24
DATA_08AFA8:         db $24, $23, $22, $22, $21, $20, $20, $1F
DATA_08AFB0:         db $1E, $1D, $1D, $1C, $1B, $1B, $1A, $19
DATA_08AFB8:         db $18, $18, $17, $16, $16, $15, $14, $13
DATA_08AFC0:         db $13, $12, $11, $10, $10, $0F, $0E, $0D
DATA_08AFC8:         db $0C, $0C, $0B, $0A, $09, $09, $08, $07
DATA_08AFD0:         db $06, $05, $05, $04, $03, $02, $02, $01
DATA_08AFD8:         db $00, $FF, $FE, $FE, $FD, $FC, $FB, $FB
DATA_08AFE0:         db $FA, $F9, $F8, $F7, $F7, $F6, $F5, $F4
DATA_08AFE8:         db $F4, $F3, $F2, $F1, $F0, $F0, $EF, $EE
DATA_08AFF0:         db $ED, $ED, $EC, $EB, $EA, $EA, $E9, $E8
DATA_08AFF8:         db $E8, $E7, $E6, $E5, $E5, $E4, $E3, $E3
DATA_08B000:         db $E2, $E1, $E0, $E0, $DF, $DE, $DE, $DD
DATA_08B008:         db $DC, $DC, $DB, $DB, $DA, $D9, $D9, $D8
DATA_08B010:         db $D7, $D7, $D6, $D6, $D5, $D4, $D4, $D3
DATA_08B018:         db $D3, $D2, $D2, $D1, $D1, $D0, $D0, $CF
DATA_08B020:         db $CF, $CE, $CE, $CD, $CD, $CC, $CC, $CB
DATA_08B028:         db $CB, $CA, $CA, $CA, $C9, $C9, $C8, $C8
DATA_08B030:         db $C8, $C7, $C7, $C6, $C6, $C6, $C5, $C5
DATA_08B038:         db $C5, $C5, $C4, $C4, $C4, $C3, $C3, $C3
DATA_08B040:         db $C3, $C3, $C2, $C2, $C2, $C2, $C2, $C1
DATA_08B048:         db $C1, $C1, $C1, $C1, $C1, $C1, $C0, $C0
DATA_08B050:         db $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0
DATA_08B058:         db $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0
DATA_08B060:         db $C0, $C0, $C0, $C1, $C1, $C1, $C1, $C1
DATA_08B068:         db $C1, $C1, $C2, $C2, $C2, $C2, $C2, $C3
DATA_08B070:         db $C3, $C3, $C3, $C3, $C4, $C4, $C4, $C5
DATA_08B078:         db $C5, $C5, $C5, $C6, $C6, $C6, $C7, $C7
DATA_08B080:         db $C8, $C8, $C8, $C9, $C9, $CA, $CA, $CA
DATA_08B088:         db $CB, $CB, $CC, $CC, $CD, $CD, $CE, $CE
DATA_08B090:         db $CF, $CF, $D0, $D0, $D1, $D1, $D2, $D2
DATA_08B098:         db $D3, $D3, $D4, $D4, $D5, $D6, $D6, $D7
DATA_08B0A0:         db $D7, $D8, $D9, $D9, $DA, $DB, $DB, $DC
DATA_08B0A8:         db $DC, $DD, $DE, $DE, $DF, $E0, $E0, $E1
DATA_08B0B0:         db $E2, $E3, $E3, $E4, $E5, $E5, $E6, $E7
DATA_08B0B8:         db $E8, $E8, $E9, $EA, $EA, $EB, $EC, $ED
DATA_08B0C0:         db $ED, $EE, $EF, $F0, $F0, $F1, $F2, $F3
DATA_08B0C8:         db $F4, $F4, $F5, $F6, $F7, $F7, $F8, $F9
DATA_08B0D0:         db $FA, $FB, $FB, $FC, $FD, $FE, $FE, $FF
DATA_08B0D8:         db $00, $01, $02, $02, $03, $04, $05, $05
DATA_08B0E0:         db $06, $07, $08, $09, $09, $0A, $0B, $0C
DATA_08B0E8:         db $0C, $0D, $0E, $0F, $10, $10, $11, $12
DATA_08B0F0:         db $13, $13, $14, $15, $16, $16, $17, $18
DATA_08B0F8:         db $18, $19, $1A, $1B, $1B, $1C, $1D, $1D
DATA_08B100:         db $1E, $1F, $20, $20, $21, $22, $22, $23
DATA_08B108:         db $24, $24, $25, $25, $26, $27, $27, $28
DATA_08B110:         db $29, $29, $2A, $2A, $2B, $2C, $2C, $2D
DATA_08B118:         db $2D, $2E, $2E, $2F, $2F, $30, $30, $31
DATA_08B120:         db $31, $32, $32, $33, $33, $34, $34, $35
DATA_08B128:         db $35, $36, $36, $36, $37, $37, $38, $38
DATA_08B130:         db $38, $39, $39, $3A, $3A, $3A, $3B, $3B
DATA_08B138:         db $3B, $3B, $3C, $3C, $3C, $3D, $3D, $3D
DATA_08B140:         db $3D, $3D, $3E, $3E, $3E, $3E, $3E, $3F
DATA_08B148:         db $3F, $3F, $3F, $3F, $3F, $3F, $40, $40
DATA_08B150:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_08B158:         db $40, $40, $40, $40, $40, $40, $40, $40
DATA_08B160:         db $40, $40, $40, $3F, $3F, $3F, $3F, $3F
DATA_08B168:         db $3F, $3F, $3E, $3E, $3E, $3E, $3E, $3D
DATA_08B170:         db $3D, $3D, $3D, $3D, $3C, $3C, $3C, $3B
DATA_08B178:         db $3B, $3B, $3B, $3A, $3A, $3A, $39, $39
DATA_08B180:         db $38, $38, $38, $37, $37, $36, $36, $36
DATA_08B188:         db $35, $35, $34, $34, $33, $33, $32, $32
DATA_08B190:         db $31, $31, $30, $30, $2F, $2F, $2E, $2E
DATA_08B198:         db $2D, $2D, $2C, $2C, $2B, $2A, $2A, $29
DATA_08B1A0:         db $29, $28, $27, $27, $26, $25, $25, $24
DATA_08B1A8:         db $24, $23, $22, $22, $21, $20, $20, $1F
DATA_08B1B0:         db $1E, $1D, $1D, $1C, $1B, $1B, $1A, $19
DATA_08B1B8:         db $18, $18, $17, $16, $16, $15, $14, $13
DATA_08B1C0:         db $13, $12, $11, $10, $10, $0F, $0E, $0D
DATA_08B1C8:         db $0C, $0C, $0B, $0A, $09, $09, $08, $07
DATA_08B1D0:         db $06, $05, $05, $04, $03, $02, $02, $01

.clear_oam_buffer
CODE_08B1D8:         cache              ;
CODE_08B1D9:         iwt   r0,#0200     ; oam buffer table
CODE_08B1DC:         sms   (0092),r0    ;
CODE_08B1DF:         iwt   r1,#8000     ; value to clear with ($8000)
CODE_08B1E2:         ibt   r2,#0008     ;
CODE_08B1E4:         iwt   r12,#0100    ;
CODE_08B1E7:         move  r13,r15      ;
CODE_08B1E9:         from r1            ;
CODE_08B1EA:         stw   (r0)         ; \  loop through entire table
CODE_08B1EB:         loop               ;  | clearing X with $8000
CODE_08B1EC:         add   r2           ; /
CODE_08B1ED:         stop               ;
CODE_08B1EE:         nop                ;

.copy_oam_buffer
; start off by clearing first part of OAM mirror
CODE_08B1EF:         ibt   r12,#0010    ; \
CODE_08B1F1:         iwt   r0,#0A01     ;  | loop 0A01-0A3D
CODE_08B1F4:         ibt   r1,#0004     ;  | by 4's
CODE_08B1F6:         ibt   r2,#FFF0     ;  | y clear value
CODE_08B1F8:         cache              ;  |
CODE_08B1F9:         move  r13,r15      ;  |
CODE_08B1FB:         from r2            ;
CODE_08B1FC:         stb   (r0)         ;  | y = $F0, which clears it
CODE_08B1FE:         loop               ;  |
CODE_08B1FF:         add   r1           ; /

; copy OAM buffer values into low mirror / high buffer
CODE_08B200:         iwt   r2,#0A40     ; low table start (forward)
CODE_08B203:         iwt   r4,#0C30     ; high buffer start (forward)
CODE_08B206:         iwt   r1,#0200     ; oam buffer start
CODE_08B209:         iwt   r3,#0BFC     ; low table start (reverse)
CODE_08B20C:         iwt   r5,#0C9F     ; high buffer start (reverse)
CODE_08B20F:         ibt   r7,#FFF1     ; -15 for coordinate testing
CODE_08B211:         iwt   r12,#0100    ; loop $100 times by 8's
CODE_08B214:         move  r13,r15      ; loop starting here
CODE_08B216:         move  r6,r1        ;

; word 1: X coordinate
CODE_08B218:         ldw   (r6)         ; \
CODE_08B219:         cmp   r7           ;  | if X < -15
CODE_08B21B:         blt CODE_08B275    ;  | or
CODE_08B21D:         nop                ;  | X >= 256
CODE_08B21E:         iwt   r8,#0100     ;  | skip processing
CODE_08B221:         cmp   r8           ;  |
CODE_08B223:         bge CODE_08B275    ; /
CODE_08B225:         inc   r6           ;
CODE_08B226:         inc   r6           ;
CODE_08B227:         ibt   r9,#0000     ; \
CODE_08B229:         moves r11,r0       ;  | if X is negative
CODE_08B22B:         bpl CODE_08B22F    ;  | mark it by incrementing
CODE_08B22D:         nop                ;  | high table (9th x bit)
CODE_08B22E:         inc   r9           ; /

; word 2: Y coordinate
CODE_08B22F:         ldw   (r6)         ; \
CODE_08B230:         cmp   r7           ;  | if Y < -15
CODE_08B232:         blt CODE_08B275    ;  | or
CODE_08B234:         nop                ;  | Y >= 240
CODE_08B235:         iwt   r8,#00F0     ;  | skip processing
CODE_08B238:         cmp   r8           ;  |
CODE_08B23A:         bge CODE_08B275    ; /
CODE_08B23C:         inc   r6           ;
CODE_08B23D:         move  r14,r0       ;
CODE_08B23F:         inc   r6           ;

; word 3: OAM bytes 3 & 4
CODE_08B240:         to r10             ;
CODE_08B241:         ldw   (r6)         ;
CODE_08B242:         inc   r6           ;
CODE_08B243:         inc   r6           ;

; word 4: high table byte
CODE_08B244:         ldw   (r6)         ;
CODE_08B245:         to r9              ;
CODE_08B246:         or    r9           ; or with 9th x bit from above
CODE_08B247:         iwt   r8,#4000     ; \  if second highest bit of word 4 is on
CODE_08B24A:         and   r8           ;  | then we are starting from top of table
CODE_08B24B:         bne CODE_08B260    ; /  copy to reverse index

; copy to OAM slot (forward index)
CODE_08B24D:         from r11           ;
CODE_08B24E:         stb   (r2)         ; X = low byte of word 1
CODE_08B250:         inc   r2           ;
CODE_08B251:         dec   r14          ;
CODE_08B252:         from r14           ;
CODE_08B253:         stb   (r2)         ; Y = (low byte of word 2) - 1
CODE_08B255:         inc   r2           ;
CODE_08B256:         from r10           ;
CODE_08B257:         stw   (r2)         ; bytes 3 & 4 = direct copy of word 3
CODE_08B258:         inc   r2           ;
CODE_08B259:         inc   r2           ;
CODE_08B25A:         from r9            ;
CODE_08B25B:         stb   (r4)         ; high buffer byte = low byte of word 4
CODE_08B25D:         bra CODE_08B271    ;

CODE_08B25F:         inc   r4           ; high buffer index forward

; copy to OAM slot (reverse index)
CODE_08B260:         stb   (r3)         ; X = low byte of word 1
CODE_08B262:         inc   r3           ;
CODE_08B263:         dec   r14          ;
CODE_08B264:         from r14           ;
CODE_08B265:         stb   (r3)         ; Y = (low byte of word 2) - 1
CODE_08B267:         inc   r3           ;
CODE_08B268:         from r10           ;
CODE_08B269:         stw   (r3)         ; bytes 3 & 4 = direct copy of word 3
CODE_08B26A:         from r9            ;
CODE_08B26B:         stb   (r5)         ; high buffer byte = low byte of word 4
CODE_08B26D:         dec   r5           ; \
CODE_08B26E:         with r3            ;
CODE_08B26F:         sub   #06          ; / move indices one full entry backwards

CODE_08B271:         from r3            ;
CODE_08B272:         sub   r2           ; \ if forward & reverse indices
CODE_08B273:         bcc CODE_08B289    ; / run into each other, break
CODE_08B275:         with r1            ;
CODE_08B276:         add   #08          ; \ increment OAM buffer index
CODE_08B278:         loop               ; / and advance to next slot
CODE_08B279:         nop                ;

; cleanse any OAM low table mirror not processed (between forward & reverse)
CODE_08B27A:         ibt   r0,#FFF0     ; Y clear value (-16)
CODE_08B27C:         inc   r2           ; \ set forward & reverse indices
CODE_08B27D:         inc   r3           ; / to point to Y value
CODE_08B27E:         stb   (r2)         ; \
CODE_08B280:         with r2            ;
CODE_08B281:         add   #04          ;  | clear Y=$F0
CODE_08B283:         from r3            ;
CODE_08B284:         cmp   r2           ;  | loop forward index by 4's
CODE_08B286:         bcs CODE_08B27E    ;  | until forward >= reverse
CODE_08B288:         nop                ; /

; copy high buffer to high mirror
CODE_08B289:         cache              ;
CODE_08B28A:         iwt   r10,#0C9F    ; high buffer start (going backwards)
CODE_08B28D:         iwt   r8,#0C1F     ; high mirror start (going backwards)
CODE_08B290:         ibt   r12,#0020    ; loop by 1's $20 times
CODE_08B292:         move  r13,r15      ; start loop here
CODE_08B294:         ldb   (r10)        ; \
CODE_08B296:         dec   r10          ;  | pull byte from high buffer
CODE_08B297:         add   r0           ;  | shift lowest 2 bits << 2
CODE_08B298:         add   r0           ;  |
CODE_08B299:         to r1              ;
CODE_08B29A:         ldb   (r10)        ;  | repeat 3x
CODE_08B29C:         or    r1           ;  | totaling 4 bytes
CODE_08B29D:         dec   r10          ;  | format of r0 low byte afterward:
CODE_08B29E:         add   r0           ;  | 11223344
CODE_08B29F:         add   r0           ;  |
CODE_08B2A0:         to r1              ;
CODE_08B2A1:         ldb   (r10)        ;  |
CODE_08B2A3:         or    r1           ;  |
CODE_08B2A4:         dec   r10          ;  |
CODE_08B2A5:         add   r0           ;  |
CODE_08B2A6:         add   r0           ;  |
CODE_08B2A7:         to r1              ;
CODE_08B2A8:         ldb   (r10)        ;  |
CODE_08B2AA:         or    r1           ;  |
CODE_08B2AB:         dec   r10          ; /
CODE_08B2AC:         stb   (r8)         ; store 11223344 in high mirror
CODE_08B2AE:         loop               ; move onto next byte
CODE_08B2AF:         dec   r8           ; in high mirror (next 4 in high buffer)
CODE_08B2B0:         stop               ;
CODE_08B2B1:         nop                ;

CODE_08B2B2:         lmult              ;
CODE_08B2B4:         stop               ;
CODE_08B2B5:         nop                ;

CODE_08B2B6:         romb               ;
CODE_08B2B8:         from r2            ;
CODE_08B2B9:         add   r2           ;
CODE_08B2BA:         add   r0           ;
CODE_08B2BB:         iwt   r5,#3A02     ;
CODE_08B2BE:         add   r5           ;
CODE_08B2BF:         move  r6,r0        ;
CODE_08B2C1:         to r5              ;
CODE_08B2C2:         sub   #04          ;
CODE_08B2C4:         ibt   r7,#0000     ;
CODE_08B2C6:         moves r8,r12       ;
CODE_08B2C8:         beq CODE_08B319    ;
CODE_08B2CA:         from r12           ;
CODE_08B2CB:         add   r12          ;
CODE_08B2CC:         iwt   r3,#2200     ;
CODE_08B2CF:         add   r3           ;
CODE_08B2D0:         to r3              ;
CODE_08B2D1:         ldw   (r0)         ;
CODE_08B2D2:         iwt   r11,#3D49    ;
CODE_08B2D5:         iwt   r10,#00FF    ;
CODE_08B2D8:         cache              ;
CODE_08B2D9:         iwt   r13,#B2DD    ;
CODE_08B2DC:         from r7            ;
CODE_08B2DD:         hib                ;
CODE_08B2DE:         to r14             ;
CODE_08B2DF:         add   r4           ;
CODE_08B2E0:         getb               ;
CODE_08B2E1:         umult r8           ;
CODE_08B2E3:         to r9              ;
CODE_08B2E4:         hib                ;
CODE_08B2E5:         from r1            ;
CODE_08B2E6:         sub   r9           ;
CODE_08B2E7:         bpl CODE_08B2EB    ;
CODE_08B2E9:         nop                ;
CODE_08B2EA:         sub   r0           ;
CODE_08B2EB:         stb   (r5)         ;
CODE_08B2ED:         stb   (r6)         ;
CODE_08B2EF:         inc   r5           ;
CODE_08B2F0:         inc   r6           ;
CODE_08B2F1:         from r9            ;
CODE_08B2F2:         add   r1           ;
CODE_08B2F3:         sub   r10          ;
CODE_08B2F4:         bmi CODE_08B2F9    ;
CODE_08B2F6:         add   r10          ;
CODE_08B2F7:         move  r0,r10       ;
CODE_08B2F9:         stb   (r5)         ;
CODE_08B2FB:         stb   (r6)         ;
CODE_08B2FD:         with r7            ;
CODE_08B2FE:         add   r3           ;
CODE_08B2FF:         with r5            ;
CODE_08B300:         sub   #05          ;
CODE_08B302:         iwt   r0,#39FE     ;
CODE_08B305:         from r5            ;
CODE_08B306:         sub   r0           ;
CODE_08B307:         bcs CODE_08B30D    ;
CODE_08B309:         nop                ;
CODE_08B30A:         iwt   r5,#39FE     ;
CODE_08B30D:         with r6            ;
CODE_08B30E:         add   #03          ;
CODE_08B310:         from r6            ;
CODE_08B311:         sub   r11          ;
CODE_08B312:         bcc CODE_08B317    ;
CODE_08B314:         nop                ;
CODE_08B315:         move  r6,r11       ;
CODE_08B317:         loop               ;
CODE_08B318:         from r7            ;
CODE_08B319:         iwt   r0,#3A02     ;
CODE_08B31C:         from r5            ;
CODE_08B31D:         sub   r0           ;
CODE_08B31E:         bmi CODE_08B330    ;
CODE_08B320:         to r12             ;
CODE_08B321:         lsr                ;
CODE_08B322:         inc   r12          ;
CODE_08B323:         iwt   r9,#00FF     ;
CODE_08B326:         ibt   r10,#0004    ;
CODE_08B328:         move  r0,r5        ;
CODE_08B32A:         move  r13,r15      ;
CODE_08B32C:         from r9            ;
CODE_08B32D:         stw   (r0)         ;
CODE_08B32E:         loop               ;
CODE_08B32F:         sub   r10          ;
CODE_08B330:         iwt   r0,#3D46     ;
CODE_08B333:         sub   r6           ;
CODE_08B334:         bmi CODE_08B346    ;
CODE_08B336:         to r12             ;
CODE_08B337:         lsr                ;
CODE_08B338:         inc   r12          ;
CODE_08B339:         iwt   r9,#00FF     ;
CODE_08B33C:         ibt   r10,#0004    ;
CODE_08B33E:         move  r0,r6        ;
CODE_08B340:         move  r13,r15      ;
CODE_08B342:         from r9            ;
CODE_08B343:         stw   (r0)         ;
CODE_08B344:         loop               ;
CODE_08B345:         add   r10          ;
CODE_08B346:         stop               ;
CODE_08B347:         nop                ;

CODE_08B348:         romb               ;
CODE_08B34A:         from r2            ;
CODE_08B34B:         add   r2           ;
CODE_08B34C:         add   r0           ;
CODE_08B34D:         iwt   r5,#3A02     ;
CODE_08B350:         add   r5           ;
CODE_08B351:         add   r11          ;
CODE_08B352:         move  r6,r0        ;
CODE_08B354:         to r5              ;
CODE_08B355:         sub   #04          ;
CODE_08B357:         ibt   r7,#0000     ;
CODE_08B359:         moves r8,r12       ;
CODE_08B35B:         beq CODE_08B396    ;
CODE_08B35D:         from r12           ;
CODE_08B35E:         add   r12          ;
CODE_08B35F:         iwt   r3,#2200     ;
CODE_08B362:         add   r3           ;
CODE_08B363:         to r3              ;
CODE_08B364:         ldw   (r0)         ;
CODE_08B365:         iwt   r10,#00FF    ;
CODE_08B368:         cache              ;
CODE_08B369:         move  r13,r15      ;
CODE_08B36B:         from r7            ;
CODE_08B36C:         hib                ;
CODE_08B36D:         to r14             ;
CODE_08B36E:         add   r4           ;
CODE_08B36F:         getb               ;
CODE_08B370:         umult r8           ;
CODE_08B372:         to r9              ;
CODE_08B373:         hib                ;
CODE_08B374:         from r1            ;
CODE_08B375:         sub   r9           ;
CODE_08B376:         bpl CODE_08B37A    ;
CODE_08B378:         nop                ;
CODE_08B379:         sub   r0           ;
CODE_08B37A:         stb   (r5)         ;
CODE_08B37C:         stb   (r6)         ;
CODE_08B37E:         inc   r5           ;
CODE_08B37F:         inc   r6           ;
CODE_08B380:         from r9            ;
CODE_08B381:         add   r1           ;
CODE_08B382:         cmp   r10          ;
CODE_08B384:         bmi CODE_08B389    ;
CODE_08B386:         nop                ;
CODE_08B387:         move  r0,r10       ;
CODE_08B389:         stb   (r5)         ;
CODE_08B38B:         stb   (r6)         ;
CODE_08B38D:         with r7            ;
CODE_08B38E:         add   r3           ;
CODE_08B38F:         with r5            ;
CODE_08B390:         sub   #05          ;
CODE_08B392:         inc   r6           ;
CODE_08B393:         inc   r6           ;
CODE_08B394:         loop               ;
CODE_08B395:         inc   r6           ;
CODE_08B396:         stop               ;
CODE_08B397:         nop                ;

CODE_08B398:         iwt   r6,#3A02     ;
CODE_08B39B:         iwt   r1,#00B8     ;
CODE_08B39E:         iwt   r0,#00D7     ;
CODE_08B3A1:         sub   r5           ;
CODE_08B3A2:         cmp   r1           ;
CODE_08B3A4:         bne CODE_08B3AB    ;
CODE_08B3A6:         nop                ;
CODE_08B3A7:         iwt   r1,#00FF     ;
CODE_08B3AA:         sub   r0           ;
CODE_08B3AB:         move  r2,r0        ;
CODE_08B3AD:         iwt   r4,#00F7     ;
CODE_08B3B0:         iwt   r0,#00D8     ;
CODE_08B3B3:         add   r5           ;
CODE_08B3B4:         cmp   r4           ;
CODE_08B3B6:         bne CODE_08B3BE    ;
CODE_08B3B8:         nop                ;
CODE_08B3B9:         ibt   r4,#0000     ;
CODE_08B3BB:         iwt   r0,#00FF     ;
CODE_08B3BE:         move  r3,r0        ;
CODE_08B3C0:         iwt   r12,#00D2    ;
CODE_08B3C3:         cache              ;
CODE_08B3C4:         move  r13,r15      ;
CODE_08B3C6:         from r1            ;
CODE_08B3C7:         stb   (r6)         ;
CODE_08B3C9:         inc   r6           ;
CODE_08B3CA:         from r2            ;
CODE_08B3CB:         stb   (r6)         ;
CODE_08B3CD:         inc   r6           ;
CODE_08B3CE:         from r3            ;
CODE_08B3CF:         stb   (r6)         ;
CODE_08B3D1:         inc   r6           ;
CODE_08B3D2:         from r4            ;
CODE_08B3D3:         stb   (r6)         ;
CODE_08B3D5:         loop               ;
CODE_08B3D6:         inc   r6           ;
CODE_08B3D7:         stop               ;
CODE_08B3D8:         nop                ;

CODE_08B3D9:         iwt   r1,#3A02     ;
CODE_08B3DC:         iwt   r2,#3A04     ;
CODE_08B3DF:         iwt   r0,#00FF     ;
CODE_08B3E2:         iwt   r12,#00D2    ;
CODE_08B3E5:         cache              ;
CODE_08B3E6:         move  r13,r15      ;
CODE_08B3E8:         stw   (r1)         ;
CODE_08B3E9:         stw   (r2)         ;
CODE_08B3EA:         inc   r1           ;
CODE_08B3EB:         inc   r1           ;
CODE_08B3EC:         inc   r1           ;
CODE_08B3ED:         inc   r1           ;
CODE_08B3EE:         inc   r2           ;
CODE_08B3EF:         inc   r2           ;
CODE_08B3F0:         inc   r2           ;
CODE_08B3F1:         loop               ;
CODE_08B3F2:         inc   r2           ;
CODE_08B3F3:         stop               ;
CODE_08B3F4:         nop                ;

CODE_08B3F5:         iwt   r0,#00FF     ;
CODE_08B3F8:         iwt   r2,#3A02     ;
CODE_08B3FB:         iwt   r12,#00D2    ;
CODE_08B3FE:         cache              ;
CODE_08B3FF:         move  r13,r15      ;
CODE_08B401:         stw   (r2)         ;
CODE_08B402:         inc   r2           ;
CODE_08B403:         inc   r2           ;
CODE_08B404:         stw   (r2)         ;
CODE_08B405:         inc   r2           ;
CODE_08B406:         loop               ;
CODE_08B407:         inc   r2           ;
CODE_08B408:         iwt   r4,#3A02     ;
CODE_08B40B:         ibt   r0,#0063     ;
CODE_08B40D:         sub   r1           ;
CODE_08B40E:         add   r0           ;
CODE_08B40F:         add   r0           ;
CODE_08B410:         to r2              ;
CODE_08B411:         add   r4           ;
CODE_08B412:         iwt   r0,#0082     ;
CODE_08B415:         sub   r1           ;
CODE_08B416:         add   r0           ;
CODE_08B417:         add   r0           ;
CODE_08B418:         to r3              ;
CODE_08B419:         add   r4           ;
CODE_08B41A:         iwt   r4,#3D4A     ;
CODE_08B41D:         iwt   r5,#852E     ;
CODE_08B420:         ibt   r12,#0016    ;
CODE_08B422:         move  r13,r15      ;
CODE_08B424:         from r2            ;
CODE_08B425:         cmp   r4           ;
CODE_08B427:         bcs CODE_08B42C    ;
CODE_08B429:         nop                ;
CODE_08B42A:         from r5            ;
CODE_08B42B:         stw   (r2)         ;
CODE_08B42C:         dec   r2           ;
CODE_08B42D:         dec   r2           ;
CODE_08B42E:         dec   r2           ;
CODE_08B42F:         dec   r2           ;
CODE_08B430:         from r3            ;
CODE_08B431:         cmp   r4           ;
CODE_08B433:         bcs CODE_08B438    ;
CODE_08B435:         nop                ;
CODE_08B436:         from r5            ;
CODE_08B437:         stw   (r3)         ;
CODE_08B438:         inc   r3           ;
CODE_08B439:         inc   r3           ;
CODE_08B43A:         inc   r3           ;
CODE_08B43B:         loop               ;
CODE_08B43C:         inc   r3           ;
CODE_08B43D:         stop               ;
CODE_08B43E:         nop                ;

CODE_08B43F:         ibt   r12,#0010    ;
CODE_08B441:         sub   r0           ;
CODE_08B442:         move  r9,r0        ;
CODE_08B444:         move  r13,r15      ;
CODE_08B446:         with r9            ;
CODE_08B447:         add   r9           ;
CODE_08B448:         with r7            ;
CODE_08B449:         add   r7           ;
CODE_08B44A:         rol                ;
CODE_08B44B:         cmp   r8           ;
CODE_08B44D:         bcc CODE_08B452    ;
CODE_08B44F:         nop                ;
CODE_08B450:         sub   r8           ;
CODE_08B451:         inc   r9           ;
CODE_08B452:         loop               ;
CODE_08B453:         nop                ;
CODE_08B454:         jmp   r11          ;
CODE_08B455:         nop                ;
CODE_08B456:         cache              ;
CODE_08B457:         iwt   r12,#0100    ;
CODE_08B45A:         ibt   r3,#001F     ;
CODE_08B45C:         move  r13,r15      ;
CODE_08B45E:         ldw   (r1)         ;
CODE_08B45F:         to r7              ;
CODE_08B460:         and   r3           ;
CODE_08B461:         lsr                ;
CODE_08B462:         lsr                ;
CODE_08B463:         lsr                ;
CODE_08B464:         lsr                ;
CODE_08B465:         lsr                ;
CODE_08B466:         to r8              ;
CODE_08B467:         and   r3           ;
CODE_08B468:         lsr                ;
CODE_08B469:         lsr                ;
CODE_08B46A:         lsr                ;
CODE_08B46B:         lsr                ;
CODE_08B46C:         lsr                ;
CODE_08B46D:         and   r3           ;
CODE_08B46E:         add   r7           ;
CODE_08B46F:         add   r8           ;
CODE_08B470:         to r7              ;
CODE_08B471:         swap               ;
CODE_08B472:         sms   (0058),r12   ;
CODE_08B475:         sms   (005A),r13   ;
CODE_08B478:         ibt   r8,#0003     ;
CODE_08B47A:         link  #04          ;
CODE_08B47B:         iwt   r15,#B43F    ;
CODE_08B47E:         nop                ;
CODE_08B47F:         lms   r12,(0058)   ;
CODE_08B482:         lms   r13,(005A)   ;
CODE_08B485:         iwt   r0,#0080     ;
CODE_08B488:         add   r9           ;
CODE_08B489:         hib                ;
CODE_08B48A:         to r6              ;
CODE_08B48B:         swap               ;
CODE_08B48C:         from r5            ;
CODE_08B48D:         to r7              ;
CODE_08B48E:         fmult              ;
CODE_08B48F:         from r10           ;
CODE_08B490:         to r8              ;
CODE_08B491:         fmult              ;
CODE_08B492:         from r14           ;
CODE_08B493:         fmult              ;
CODE_08B494:         add   r0           ;
CODE_08B495:         add   r0           ;
CODE_08B496:         add   r0           ;
CODE_08B497:         add   r0           ;
CODE_08B498:         add   r0           ;
CODE_08B499:         or    r8           ;
CODE_08B49A:         add   r0           ;
CODE_08B49B:         add   r0           ;
CODE_08B49C:         add   r0           ;
CODE_08B49D:         add   r0           ;
CODE_08B49E:         add   r0           ;
CODE_08B49F:         or    r7           ;
CODE_08B4A0:         stw   (r2)         ;
CODE_08B4A1:         inc   r1           ;
CODE_08B4A2:         inc   r1           ;
CODE_08B4A3:         inc   r2           ;
CODE_08B4A4:         inc   r2           ;
CODE_08B4A5:         loop               ;
CODE_08B4A6:         nop                ;
CODE_08B4A7:         stop               ;
CODE_08B4A8:         nop                ;

CODE_08B4A9:         ibt   r0,#0008     ;
CODE_08B4AB:         romb               ;
CODE_08B4AD:         ibt   r1,#001F     ;
CODE_08B4AF:         lm    r0,(336C)    ;
CODE_08B4B3:         move  r11,r0       ;
CODE_08B4B5:         inc   r0           ;
CODE_08B4B6:         nop                ;
CODE_08B4B7:         nop                ;
CODE_08B4B8:         sbk                ;
CODE_08B4B9:         ibt   r10,#0020    ;
CODE_08B4BB:         iwt   r12,#0200    ;
CODE_08B4BE:         cache              ;
CODE_08B4BF:         move  r13,r15      ;
CODE_08B4C1:         lm    r0,(336E)    ;
CODE_08B4C5:         sub   #02          ;
CODE_08B4C7:         add   r12          ;
CODE_08B4C8:         ldw   (r0)         ;
CODE_08B4C9:         move  r2,r0        ;
CODE_08B4CB:         move  r1,r0        ;
CODE_08B4CD:         lsr                ;
CODE_08B4CE:         lsr                ;
CODE_08B4CF:         to r3              ;
CODE_08B4D0:         swap               ;
CODE_08B4D1:         from r2            ;
CODE_08B4D2:         add   r2           ;
CODE_08B4D3:         add   r0           ;
CODE_08B4D4:         add   r0           ;
CODE_08B4D5:         to r2              ;
CODE_08B4D6:         swap               ;
CODE_08B4D7:         ibt   r0,#001F     ;
CODE_08B4D9:         to r1              ;
CODE_08B4DA:         and   r1           ;
CODE_08B4DB:         to r2              ;
CODE_08B4DC:         and   r2           ;
CODE_08B4DD:         to r3              ;
CODE_08B4DE:         and   r3           ;
CODE_08B4DF:         lm    r0,(3370)    ;
CODE_08B4E3:         sub   #02          ;
CODE_08B4E5:         add   r12          ;
CODE_08B4E6:         ldw   (r0)         ;
CODE_08B4E7:         move  r5,r0        ;
CODE_08B4E9:         move  r4,r0        ;
CODE_08B4EB:         lsr                ;
CODE_08B4EC:         lsr                ;
CODE_08B4ED:         to r6              ;
CODE_08B4EE:         swap               ;
CODE_08B4EF:         from r5            ;
CODE_08B4F0:         add   r5           ;
CODE_08B4F1:         add   r0           ;
CODE_08B4F2:         add   r0           ;
CODE_08B4F3:         to r5              ;
CODE_08B4F4:         swap               ;
CODE_08B4F5:         ibt   r0,#001F     ;
CODE_08B4F7:         to r4              ;
CODE_08B4F8:         and   r4           ;
CODE_08B4F9:         to r5              ;
CODE_08B4FA:         and   r5           ;
CODE_08B4FB:         to r6              ;
CODE_08B4FC:         and   r6           ;
CODE_08B4FD:         iwt   r0,#1FFE     ;
CODE_08B500:         add   r12          ;
CODE_08B501:         ldw   (r0)         ;
CODE_08B502:         move  r8,r0        ;
CODE_08B504:         move  r7,r0        ;
CODE_08B506:         lsr                ;
CODE_08B507:         lsr                ;
CODE_08B508:         to r9              ;
CODE_08B509:         swap               ;
CODE_08B50A:         from r8            ;
CODE_08B50B:         add   r8           ;
CODE_08B50C:         add   r0           ;
CODE_08B50D:         add   r0           ;
CODE_08B50E:         to r8              ;
CODE_08B50F:         swap               ;
CODE_08B510:         ibt   r0,#001F     ;
CODE_08B512:         to r7              ;
CODE_08B513:         and   r7           ;
CODE_08B514:         to r8              ;
CODE_08B515:         and   r8           ;
CODE_08B516:         to r9              ;
CODE_08B517:         and   r9           ;
CODE_08B518:         from r3            ;
CODE_08B519:         sub   r6           ;
CODE_08B51A:         beq CODE_08B539    ;
CODE_08B51C:         nop                ;
CODE_08B51D:         bpl CODE_08B522    ;
CODE_08B51F:         nop                ;
CODE_08B520:         not                ;
CODE_08B521:         inc   r0           ;
CODE_08B522:         mult  r10          ;
CODE_08B523:         add   r11          ;
CODE_08B524:         iwt   r14,#B592    ;
CODE_08B527:         with r14           ;
CODE_08B528:         add   r0           ;
CODE_08B529:         from r9            ;
CODE_08B52A:         sub   r6           ;
CODE_08B52B:         beq CODE_08B539    ;
CODE_08B52D:         nop                ;
CODE_08B52E:         bpl CODE_08B536    ;
CODE_08B530:         nop                ;
CODE_08B531:         getb               ;
CODE_08B532:         with r9            ;
CODE_08B533:         with  r9           ;
CODE_08B533:         bra CODE_08B539    ;

CODE_08B535:         add   r0           ;
CODE_08B536:         getb               ;
CODE_08B537:         with r9            ;
CODE_08B538:         sub   r0           ;
CODE_08B539:         from r2            ;
CODE_08B53A:         sub   r5           ;
CODE_08B53B:         beq CODE_08B55A    ;
CODE_08B53D:         nop                ;
CODE_08B53E:         bpl CODE_08B543    ;
CODE_08B540:         nop                ;
CODE_08B541:         not                ;
CODE_08B542:         inc   r0           ;
CODE_08B543:         mult  r10          ;
CODE_08B544:         add   r11          ;
CODE_08B545:         iwt   r14,#B592    ;
CODE_08B548:         with r14           ;
CODE_08B549:         add   r0           ;
CODE_08B54A:         from r8            ;
CODE_08B54B:         sub   r5           ;
CODE_08B54C:         beq CODE_08B55A    ;
CODE_08B54E:         nop                ;
CODE_08B54F:         bpl CODE_08B557    ;
CODE_08B551:         nop                ;
CODE_08B552:         getb               ;
CODE_08B553:         with r8            ;
CODE_08B554:         with  r8           ;
CODE_08B554:         bra CODE_08B55A    ;

CODE_08B556:         add   r0           ;
CODE_08B557:         getb               ;
CODE_08B558:         with r8            ;
CODE_08B559:         sub   r0           ;
CODE_08B55A:         from r1            ;
CODE_08B55B:         sub   r4           ;
CODE_08B55C:         beq CODE_08B57B    ;
CODE_08B55E:         nop                ;
CODE_08B55F:         bpl CODE_08B564    ;
CODE_08B561:         nop                ;
CODE_08B562:         not                ;
CODE_08B563:         inc   r0           ;
CODE_08B564:         mult  r10          ;
CODE_08B565:         add   r11          ;
CODE_08B566:         iwt   r14,#B592    ;
CODE_08B569:         with r14           ;
CODE_08B56A:         add   r0           ;
CODE_08B56B:         from r7            ;
CODE_08B56C:         sub   r4           ;
CODE_08B56D:         beq CODE_08B57B    ;
CODE_08B56F:         nop                ;
CODE_08B570:         bpl CODE_08B578    ;
CODE_08B572:         nop                ;
CODE_08B573:         getb               ;
CODE_08B574:         with r7            ;
CODE_08B575:         with  r7           ;
CODE_08B575:         bra CODE_08B57B    ;

CODE_08B577:         add   r0           ;
CODE_08B578:         getb               ;
CODE_08B579:         with r7            ;
CODE_08B57A:         sub   r0           ;
CODE_08B57B:         from r8            ;
CODE_08B57C:         swap               ;
CODE_08B57D:         lsr                ;
CODE_08B57E:         lsr                ;
CODE_08B57F:         to r8              ;
CODE_08B580:         lsr                ;
CODE_08B581:         from r9            ;
CODE_08B582:         swap               ;
CODE_08B583:         add   r0           ;
CODE_08B584:         add   r0           ;
CODE_08B585:         or    r8           ;
CODE_08B586:         or    r7           ;
CODE_08B587:         iwt   r1,#1FFE     ;
CODE_08B58A:         with r1            ;
CODE_08B58B:         add   r12          ;
CODE_08B58C:         stw   (r1)         ;
CODE_08B58D:         dec   r12          ;
CODE_08B58E:         loop               ;
CODE_08B58F:         nop                ;
CODE_08B590:         stop               ;
CODE_08B591:         nop                ;

DATA_08B592:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B59A:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5A2:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5AA:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5B2:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5BA:         db $00, $00, $00, $00, $00, $00, $00, $01
DATA_08B5C2:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5CA:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5D2:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B5DA:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5E2:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B5EA:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B5F2:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B5FA:         db $00, $00, $01, $00, $00, $00, $00, $00
DATA_08B602:         db $00, $00, $00, $00, $00, $01, $00, $00
DATA_08B60A:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08B612:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B61A:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B622:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B62A:         db $01, $00, $00, $00, $00, $00, $00, $00
DATA_08B632:         db $01, $00, $00, $00, $00, $00, $01, $00
DATA_08B63A:         db $00, $00, $00, $00, $01, $00, $00, $00
DATA_08B642:         db $00, $00, $00, $01, $00, $00, $00, $00
DATA_08B64A:         db $00, $01, $00, $00, $00, $00, $00, $00
DATA_08B652:         db $01, $00, $00, $00, $00, $01, $00, $00
DATA_08B65A:         db $00, $00, $01, $00, $00, $00, $00, $00
DATA_08B662:         db $01, $00, $00, $00, $00, $01, $00, $00
DATA_08B66A:         db $00, $00, $01, $00, $00, $00, $00, $00
DATA_08B672:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B67A:         db $00, $01, $00, $00, $00, $01, $00, $00
DATA_08B682:         db $00, $00, $01, $00, $00, $00, $01, $00
DATA_08B68A:         db $00, $00, $00, $01, $00, $00, $00, $00
DATA_08B692:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B69A:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B6A2:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B6AA:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B6B2:         db $01, $00, $00, $01, $00, $00, $00, $01
DATA_08B6BA:         db $00, $00, $01, $00, $00, $00, $01, $00
DATA_08B6C2:         db $00, $01, $00, $00, $00, $01, $00, $00
DATA_08B6CA:         db $01, $00, $00, $00, $01, $00, $00, $00
DATA_08B6D2:         db $01, $00, $00, $01, $00, $00, $01, $00
DATA_08B6DA:         db $00, $01, $00, $00, $01, $00, $00, $00
DATA_08B6E2:         db $01, $00, $00, $01, $00, $00, $01, $00
DATA_08B6EA:         db $00, $01, $00, $00, $01, $00, $00, $00
DATA_08B6F2:         db $01, $00, $01, $00, $00, $01, $00, $00
DATA_08B6FA:         db $01, $00, $00, $01, $00, $00, $01, $00
DATA_08B702:         db $00, $01, $00, $00, $01, $00, $00, $01
DATA_08B70A:         db $00, $00, $01, $00, $00, $01, $00, $00
DATA_08B712:         db $01, $00, $01, $00, $00, $01, $00, $00
DATA_08B71A:         db $01, $00, $01, $00, $00, $01, $00, $00
DATA_08B722:         db $01, $00, $01, $00, $00, $01, $00, $00
DATA_08B72A:         db $01, $00, $01, $00, $00, $01, $00, $00
DATA_08B732:         db $01, $00, $01, $00, $01, $00, $00, $01
DATA_08B73A:         db $00, $01, $00, $00, $01, $00, $00, $01
DATA_08B742:         db $00, $01, $00, $01, $00, $00, $01, $00
DATA_08B74A:         db $01, $00, $00, $01, $00, $01, $00, $00
DATA_08B752:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B75A:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B762:         db $00, $01, $00, $01, $00, $00, $01, $00
DATA_08B76A:         db $01, $00, $00, $01, $00, $01, $00, $00
DATA_08B772:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B77A:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B782:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08B78A:         db $00, $01, $00, $01, $00, $01, $00, $00
DATA_08B792:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B79A:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7A2:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7AA:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7B2:         db $01, $01, $00, $01, $00, $01, $00, $01
DATA_08B7BA:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7C2:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7CA:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7D2:         db $01, $01, $00, $01, $00, $01, $00, $01
DATA_08B7DA:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7E2:         db $01, $01, $00, $01, $00, $01, $00, $01
DATA_08B7EA:         db $01, $00, $01, $00, $01, $00, $01, $00
DATA_08B7F2:         db $01, $01, $00, $01, $00, $01, $01, $00
DATA_08B7FA:         db $01, $00, $01, $01, $00, $01, $00, $01
DATA_08B802:         db $01, $00, $01, $00, $01, $01, $00, $01
DATA_08B80A:         db $00, $01, $01, $00, $01, $00, $01, $00
DATA_08B812:         db $01, $01, $00, $01, $01, $00, $01, $00
DATA_08B81A:         db $01, $01, $00, $01, $01, $00, $01, $00
DATA_08B822:         db $01, $01, $00, $01, $01, $00, $01, $00
DATA_08B82A:         db $01, $01, $00, $01, $01, $00, $01, $00
DATA_08B832:         db $01, $01, $00, $01, $01, $00, $01, $01
DATA_08B83A:         db $00, $01, $01, $00, $01, $01, $00, $01
DATA_08B842:         db $01, $00, $01, $01, $00, $01, $01, $00
DATA_08B84A:         db $01, $01, $00, $01, $01, $00, $01, $00
DATA_08B852:         db $01, $01, $01, $00, $01, $01, $00, $01
DATA_08B85A:         db $01, $00, $01, $01, $00, $01, $01, $00
DATA_08B862:         db $01, $01, $01, $00, $01, $01, $00, $01
DATA_08B86A:         db $01, $00, $01, $01, $00, $01, $01, $00
DATA_08B872:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B87A:         db $01, $01, $00, $01, $01, $01, $00, $01
DATA_08B882:         db $01, $00, $01, $01, $01, $00, $01, $01
DATA_08B88A:         db $00, $01, $01, $01, $00, $01, $01, $00
DATA_08B892:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B89A:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B8A2:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B8AA:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B8B2:         db $01, $01, $01, $01, $00, $01, $01, $01
DATA_08B8BA:         db $01, $00, $01, $01, $01, $00, $01, $01
DATA_08B8C2:         db $01, $01, $00, $01, $01, $01, $00, $01
DATA_08B8CA:         db $01, $01, $01, $00, $01, $01, $01, $00
DATA_08B8D2:         db $01, $01, $01, $01, $01, $00, $01, $01
DATA_08B8DA:         db $01, $01, $00, $01, $01, $01, $01, $00
DATA_08B8E2:         db $01, $01, $01, $01, $01, $00, $01, $01
DATA_08B8EA:         db $01, $01, $00, $01, $01, $01, $01, $00
DATA_08B8F2:         db $01, $01, $01, $01, $01, $01, $00, $01
DATA_08B8FA:         db $01, $01, $01, $01, $00, $01, $01, $01
DATA_08B902:         db $01, $01, $01, $00, $01, $01, $01, $01
DATA_08B90A:         db $01, $00, $01, $01, $01, $01, $01, $00
DATA_08B912:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B91A:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B922:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B92A:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B932:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B93A:         db $01, $01, $00, $01, $01, $01, $01, $01
DATA_08B942:         db $01, $01, $01, $01, $01, $00, $01, $01
DATA_08B94A:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B952:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B95A:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B962:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B96A:         db $01, $01, $01, $01, $01, $01, $01, $00
DATA_08B972:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B97A:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B982:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_08B98A:         db $01, $01, $01, $01, $01, $01, $01, $00

CODE_08B992:         romb               ;
CODE_08B994:         iwt   r4,#3D46     ;
CODE_08B997:         iwt   r0,#00D2     ;
CODE_08B99A:         sub   r9           ;
CODE_08B99B:         to r12             ;
CODE_08B99C:         add   r0           ;
CODE_08B99D:         iwt   r0,#00FF     ;
CODE_08B9A0:         cache              ;
CODE_08B9A1:         move  r13,r15      ;
CODE_08B9A3:         stw   (r4)         ;
CODE_08B9A4:         dec   r4           ;
CODE_08B9A5:         loop               ;
CODE_08B9A6:         dec   r4           ;
CODE_08B9A7:         move  r14,r1       ;
CODE_08B9A9:         inc   r1           ;
CODE_08B9AA:         iwt   r4,#2200     ;
CODE_08B9AD:         move  r6,r3        ;
CODE_08B9AF:         to r5              ;
CODE_08B9B0:         getb               ;
CODE_08B9B1:         move  r14,r2       ;
CODE_08B9B3:         inc   r2           ;
CODE_08B9B4:         to r7              ;
CODE_08B9B5:         getb               ;
CODE_08B9B6:         from r7            ;
CODE_08B9B7:         sub   r5           ;
CODE_08B9B8:         swap               ;
CODE_08B9B9:         fmult              ;
CODE_08B9BA:         add   r5           ;
CODE_08B9BB:         move  r12,r0       ;
CODE_08B9BD:         add   r0           ;
CODE_08B9BE:         add   r4           ;
CODE_08B9BF:         ldw   (r0)         ;
CODE_08B9C0:         to r6              ;
CODE_08B9C1:         lsr                ;
CODE_08B9C2:         from r5            ;
CODE_08B9C3:         swap               ;
CODE_08B9C4:         fmult              ;
CODE_08B9C5:         to r5              ;
CODE_08B9C6:         add   r0           ;
CODE_08B9C7:         from r7            ;
CODE_08B9C8:         swap               ;
CODE_08B9C9:         fmult              ;
CODE_08B9CA:         to r7              ;
CODE_08B9CB:         add   r0           ;
CODE_08B9CC:         move  r6,r3        ;
CODE_08B9CE:         iwt   r0,#3A02     ;
CODE_08B9D1:         add   r9           ;
CODE_08B9D2:         add   r9           ;
CODE_08B9D3:         add   r9           ;
CODE_08B9D4:         to r9              ;
CODE_08B9D5:         add   r9           ;
CODE_08B9D6:         dec   r9           ;
CODE_08B9D7:         ibt   r10,#0000    ;
CODE_08B9D9:         move  r11,r10      ;
CODE_08B9DB:         move  r13,r15      ;
CODE_08B9DD:         from r10           ;
CODE_08B9DE:         hib                ;
CODE_08B9DF:         add   r0           ;
CODE_08B9E0:         add   r0           ;
CODE_08B9E1:         to r14             ;
CODE_08B9E2:         add   r1           ;
CODE_08B9E3:         to r4              ;
CODE_08B9E4:         getbs              ;
CODE_08B9E6:         inc   r14          ;
CODE_08B9E7:         to r3              ;
CODE_08B9E8:         getbs              ;
CODE_08B9EA:         inc   r14          ;
CODE_08B9EB:         getbs              ;
CODE_08B9ED:         inc   r14          ;
CODE_08B9EE:         sms   (0002),r0    ;
CODE_08B9F1:         getbs              ;
CODE_08B9F3:         sms   (0000),r0    ;
CODE_08B9F6:         from r11           ;
CODE_08B9F7:         hib                ;
CODE_08B9F8:         add   r0           ;
CODE_08B9F9:         add   r0           ;
CODE_08B9FA:         to r14             ;
CODE_08B9FB:         add   r2           ;
CODE_08B9FC:         getbs              ;
CODE_08B9FE:         inc   r14          ;
CODE_08B9FF:         sub   r4           ;
CODE_08BA00:         swap               ;
CODE_08BA01:         fmult              ;
CODE_08BA02:         add   r4           ;
CODE_08BA03:         add   r8           ;
CODE_08BA04:         stb   (r9)         ;
CODE_08BA06:         dec   r9           ;
CODE_08BA07:         getbs              ;
CODE_08BA09:         inc   r14          ;
CODE_08BA0A:         sub   r3           ;
CODE_08BA0B:         swap               ;
CODE_08BA0C:         fmult              ;
CODE_08BA0D:         add   r3           ;
CODE_08BA0E:         add   r8           ;
CODE_08BA0F:         stb   (r9)         ;
CODE_08BA11:         dec   r9           ;
CODE_08BA12:         getbs              ;
CODE_08BA14:         inc   r14          ;
CODE_08BA15:         lms   r4,(0002)    ;
CODE_08BA18:         sub   r4           ;
CODE_08BA19:         swap               ;
CODE_08BA1A:         fmult              ;
CODE_08BA1B:         add   r4           ;
CODE_08BA1C:         add   r8           ;
CODE_08BA1D:         stb   (r9)         ;
CODE_08BA1F:         dec   r9           ;
CODE_08BA20:         getbs              ;
CODE_08BA22:         lms   r3,(0000)    ;
CODE_08BA25:         sub   r3           ;
CODE_08BA26:         swap               ;
CODE_08BA27:         fmult              ;
CODE_08BA28:         add   r3           ;
CODE_08BA29:         add   r8           ;
CODE_08BA2A:         stb   (r9)         ;
CODE_08BA2C:         with r10           ;
CODE_08BA2D:         add   r5           ;
CODE_08BA2E:         with r11           ;
CODE_08BA2F:         add   r7           ;
CODE_08BA30:         loop               ;
CODE_08BA31:         dec   r9           ;
CODE_08BA32:         iwt   r0,#39FE     ;
CODE_08BA35:         from r9            ;
CODE_08BA36:         sub   r0           ;
CODE_08BA37:         to r12             ;
CODE_08BA38:         lsr                ;
CODE_08BA39:         iwt   r0,#00FF     ;
CODE_08BA3C:         move  r13,r15      ;
CODE_08BA3E:         dec   r9           ;
CODE_08BA3F:         stw   (r9)         ;
CODE_08BA40:         loop               ;
CODE_08BA41:         dec   r9           ;
CODE_08BA42:         stop               ;
CODE_08BA43:         nop                ;

CODE_08BA44:         sms   (0040),r0    ;
CODE_08BA47:         romb               ;
CODE_08BA49:         sms   (0046),r3    ;
CODE_08BA4C:         sms   (0020),r4    ;
CODE_08BA4F:         sms   (0022),r5    ;
CODE_08BA52:         sub   r0           ;
CODE_08BA53:         cmode              ;
CODE_08BA55:         ibt   r0,#0040     ;
CODE_08BA57:         umult r5           ;
CODE_08BA59:         with r4            ;
CODE_08BA5A:         umult #04          ;
CODE_08BA5C:         add   r4           ;
CODE_08BA5D:         iwt   r4,#5800     ;
CODE_08BA60:         to r4              ;
CODE_08BA61:         add   r4           ;
CODE_08BA62:         ibt   r5,#0040     ;
CODE_08BA64:         iwt   r6,#0180     ;
CODE_08BA67:         iwt   r13,#BA70    ;
CODE_08BA6A:         ibt   r7,#0004     ;
CODE_08BA6C:         sub   r0           ;
CODE_08BA6D:         cache              ;
CODE_08BA6E:         move  r12,r5       ;
CODE_08BA70:         stw   (r4)         ;
CODE_08BA71:         inc   r4           ;
CODE_08BA72:         loop               ;
CODE_08BA73:         inc   r4           ;
CODE_08BA74:         with r4            ;
CODE_08BA75:         add   r6           ;
CODE_08BA76:         dec   r7           ;
CODE_08BA77:         bne CODE_08BA6F    ;
CODE_08BA79:         move  r14,r1       ;
CODE_08BA7C:         getb               ;
CODE_08BA7D:         inc   r14          ;
CODE_08BA7E:         getbh              ;
CODE_08BA80:         inc   r14          ;
CODE_08BA81:         sms   (0000),r0    ;
CODE_08BA84:         to r7              ;
CODE_08BA85:         getb               ;
CODE_08BA86:         inc   r14          ;
CODE_08BA87:         sms   (0018),r14   ;
CODE_08BA8A:         move  r14,r2       ;
CODE_08BA8C:         getb               ;
CODE_08BA8D:         inc   r14          ;
CODE_08BA8E:         getbh              ;
CODE_08BA90:         inc   r14          ;
CODE_08BA91:         sms   (0002),r0    ;
CODE_08BA94:         to r8              ;
CODE_08BA95:         getb               ;
CODE_08BA96:         inc   r14          ;
CODE_08BA97:         sms   (001A),r14   ;
CODE_08BA9A:         move  r6,r3        ;
CODE_08BA9C:         from r8            ;
CODE_08BA9D:         sub   r7           ;
CODE_08BA9E:         lob                ;
CODE_08BA9F:         swap               ;
CODE_08BAA0:         fmult              ;
CODE_08BAA1:         adc   r7           ;
CODE_08BAA3:         sms   (0058),r0    ;
CODE_08BAA6:         add   r0           ;
CODE_08BAA7:         iwt   r1,#2200     ;
CODE_08BAAA:         add   r1           ;
CODE_08BAAB:         to r6              ;
CODE_08BAAC:         ldw   (r0)         ;
CODE_08BAAD:         from r7            ;
CODE_08BAAE:         lob                ;
CODE_08BAAF:         swap               ;
CODE_08BAB0:         fmult              ;
CODE_08BAB1:         adc   #00          ;
CODE_08BAB3:         sms   (0014),r0    ;
CODE_08BAB6:         to r7              ;
CODE_08BAB7:         lsr                ;
CODE_08BAB8:         from r8            ;
CODE_08BAB9:         lob                ;
CODE_08BABA:         swap               ;
CODE_08BABB:         fmult              ;
CODE_08BABC:         adc   #00          ;
CODE_08BABE:         sms   (0016),r0    ;
CODE_08BAC1:         to r11             ;
CODE_08BAC2:         lsr                ;
CODE_08BAC3:         lms   r0,(0022)    ;
CODE_08BAC6:         ibt   r2,#001F     ;
CODE_08BAC8:         to r2              ;
CODE_08BAC9:         add   r2           ;
CODE_08BACA:         lms   r0,(0040)    ;
CODE_08BACD:         romb               ;
CODE_08BACF:         from r7            ;
CODE_08BAD0:         hib                ;
CODE_08BAD1:         add   r0           ;
CODE_08BAD2:         add   r0           ;
CODE_08BAD3:         lms   r4,(0018)    ;
CODE_08BAD6:         to r14             ;
CODE_08BAD7:         add   r4           ;
CODE_08BAD8:         to r13             ;
CODE_08BAD9:         getb               ;
CODE_08BADA:         inc   r14          ;
CODE_08BADB:         sms   (0004),r13   ;
CODE_08BADE:         getb               ;
CODE_08BADF:         inc   r14          ;
CODE_08BAE0:         sms   (0006),r0    ;
CODE_08BAE3:         sub   r13          ;
CODE_08BAE4:         sms   (0008),r0    ;
CODE_08BAE7:         getb               ;
CODE_08BAE8:         move  r1,r0        ;
CODE_08BAEA:         lob                ;
CODE_08BAEB:         to r8              ;
CODE_08BAEC:         swap               ;
CODE_08BAED:         inc   r14          ;
CODE_08BAEE:         to r12             ;
CODE_08BAEF:         getb               ;
CODE_08BAF0:         from r12           ;
CODE_08BAF1:         sub   r1           ;
CODE_08BAF2:         sms   (000A),r0    ;
CODE_08BAF5:         from r11           ;
CODE_08BAF6:         hib                ;
CODE_08BAF7:         add   r0           ;
CODE_08BAF8:         add   r0           ;
CODE_08BAF9:         lms   r5,(001A)    ;
CODE_08BAFC:         to r14             ;
CODE_08BAFD:         add   r5           ;
CODE_08BAFE:         to r13             ;
CODE_08BAFF:         getb               ;
CODE_08BB00:         inc   r14          ;
CODE_08BB01:         sms   (000C),r13   ;
CODE_08BB04:         getb               ;
CODE_08BB05:         inc   r14          ;
CODE_08BB06:         sms   (000E),r0    ;
CODE_08BB09:         sub   r13          ;
CODE_08BB0A:         sms   (0010),r0    ;
CODE_08BB0D:         getb               ;
CODE_08BB0E:         move  r13,r0       ;
CODE_08BB10:         lob                ;
CODE_08BB11:         to r9              ;
CODE_08BB12:         swap               ;
CODE_08BB13:         inc   r14          ;
CODE_08BB14:         getb               ;
CODE_08BB15:         to r6              ;
CODE_08BB16:         sub   r13          ;
CODE_08BB17:         sms   (0012),r6    ;
CODE_08BB1A:         sub   r12          ;
CODE_08BB1B:         lob                ;
CODE_08BB1C:         swap               ;
CODE_08BB1D:         lms   r6,(0046)    ;
CODE_08BB20:         fmult              ;
CODE_08BB21:         to r12             ;
CODE_08BB22:         adc   r12          ;
CODE_08BB24:         from r13           ;
CODE_08BB25:         sub   r1           ;
CODE_08BB26:         lob                ;
CODE_08BB27:         swap               ;
CODE_08BB28:         fmult              ;
CODE_08BB29:         adc   r1           ;
CODE_08BB2B:         with r12           ;
CODE_08BB2C:         sub   r0           ;
CODE_08BB2D:         lms   r1,(0020)    ;
CODE_08BB30:         to r1              ;
CODE_08BB31:         add   r1           ;
CODE_08BB32:         ibt   r0,#0054     ;
CODE_08BB34:         romb               ;
CODE_08BB36:         iwt   r0,#2200     ;
CODE_08BB39:         add   r12          ;
CODE_08BB3A:         add   r12          ;
CODE_08BB3B:         ldw   (r0)         ;
CODE_08BB3C:         moves r6,r0        ;
CODE_08BB3E:         lms   r0,(000A)    ;
CODE_08BB41:         bpl CODE_08BB48    ;
CODE_08BB43:         nop                ;
CODE_08BB44:         dec   r6           ;
CODE_08BB45:         bmi CODE_08BB4A    ;
CODE_08BB47:         nop                ;
CODE_08BB48:         swap               ;
CODE_08BB49:         fmult              ;
CODE_08BB4A:         move  r10,r0       ;
CODE_08BB4C:         lsr                ;
CODE_08BB4D:         to r8              ;
CODE_08BB4E:         add   r8           ;
CODE_08BB4F:         moves r6,r6        ;
CODE_08BB51:         lms   r0,(0012)    ;
CODE_08BB54:         bpl CODE_08BB5B    ;
CODE_08BB56:         nop                ;
CODE_08BB57:         dec   r6           ;
CODE_08BB58:         bmi CODE_08BB5D    ;
CODE_08BB5A:         nop                ;
CODE_08BB5B:         swap               ;
CODE_08BB5C:         fmult              ;
CODE_08BB5D:         move  r5,r0        ;
CODE_08BB5F:         lsr                ;
CODE_08BB60:         to r9              ;
CODE_08BB61:         add   r9           ;
CODE_08BB62:         lms   r6,(0046)    ;
CODE_08BB65:         inc   r12          ;
CODE_08BB66:         move  r13,r15      ;
CODE_08BB68:         from r7            ;
CODE_08BB69:         hib                ;
CODE_08BB6A:         swap               ;
CODE_08BB6B:         lms   r3,(0000)    ;
CODE_08BB6E:         with r3            ;
CODE_08BB6F:         sub   r0           ;
CODE_08BB70:         from r8            ;
CODE_08BB71:         hib                ;
CODE_08BB72:         to r14             ;
CODE_08BB73:         add   r3           ;
CODE_08BB74:         with r8            ;
CODE_08BB75:         add   r10          ;
CODE_08BB76:         getb               ;
CODE_08BB77:         to r4              ;
CODE_08BB78:         and   #0F          ;
CODE_08BB7A:         from r11           ;
CODE_08BB7B:         hib                ;
CODE_08BB7C:         swap               ;
CODE_08BB7D:         lms   r3,(0002)    ;
CODE_08BB80:         with r3            ;
CODE_08BB81:         sub   r0           ;
CODE_08BB82:         from r9            ;
CODE_08BB83:         hib                ;
CODE_08BB84:         to r14             ;
CODE_08BB85:         add   r3           ;
CODE_08BB86:         with r9            ;
CODE_08BB87:         add   r5           ;
CODE_08BB88:         getb               ;
CODE_08BB89:         and   #0F          ;
CODE_08BB8B:         sub   r4           ;
CODE_08BB8C:         swap               ;
CODE_08BB8D:         fmult              ;
CODE_08BB8E:         add   r4           ;
CODE_08BB8F:         color              ;
CODE_08BB90:         loop               ;
CODE_08BB91:         plot               ;
CODE_08BB92:         lms   r0,(000E)    ;
CODE_08BB95:         lms   r12,(0006)   ;
CODE_08BB98:         sub   r12          ;
CODE_08BB99:         lob                ;
CODE_08BB9A:         swap               ;
CODE_08BB9B:         lms   r6,(0046)    ;
CODE_08BB9E:         fmult              ;
CODE_08BB9F:         to r12             ;
CODE_08BBA0:         adc   r12          ;
CODE_08BBA2:         lms   r0,(000C)    ;
CODE_08BBA5:         to r9              ;
CODE_08BBA6:         lob                ;
CODE_08BBA7:         with r9            ;
CODE_08BBA8:         swap               ;
CODE_08BBA9:         lms   r1,(0004)    ;
CODE_08BBAC:         from r1            ;
CODE_08BBAD:         to r8              ;
CODE_08BBAE:         lob                ;
CODE_08BBAF:         with r8            ;
CODE_08BBB0:         swap               ;
CODE_08BBB1:         sub   r1           ;
CODE_08BBB2:         lob                ;
CODE_08BBB3:         swap               ;
CODE_08BBB4:         fmult              ;
CODE_08BBB5:         adc   r1           ;
CODE_08BBB7:         with r12           ;
CODE_08BBB8:         sub   r0           ;
CODE_08BBB9:         lms   r1,(0020)    ;
CODE_08BBBC:         to r1              ;
CODE_08BBBD:         add   r1           ;
CODE_08BBBE:         iwt   r0,#2200     ;
CODE_08BBC1:         add   r12          ;
CODE_08BBC2:         add   r12          ;
CODE_08BBC3:         ldw   (r0)         ;
CODE_08BBC4:         moves r6,r0        ;
CODE_08BBC6:         lms   r0,(0008)    ;
CODE_08BBC9:         bpl CODE_08BBD0    ;
CODE_08BBCB:         nop                ;
CODE_08BBCC:         dec   r6           ;
CODE_08BBCD:         bmi CODE_08BBD2    ;
CODE_08BBCF:         nop                ;
CODE_08BBD0:         swap               ;
CODE_08BBD1:         fmult              ;
CODE_08BBD2:         move  r10,r0       ;
CODE_08BBD4:         lsr                ;
CODE_08BBD5:         to r8              ;
CODE_08BBD6:         add   r8           ;
CODE_08BBD7:         moves r6,r6        ;
CODE_08BBD9:         lms   r0,(0010)    ;
CODE_08BBDC:         bpl CODE_08BBE3    ;
CODE_08BBDE:         nop                ;
CODE_08BBDF:         dec   r6           ;
CODE_08BBE0:         bmi CODE_08BBE5    ;
CODE_08BBE2:         nop                ;
CODE_08BBE3:         swap               ;
CODE_08BBE4:         fmult              ;
CODE_08BBE5:         move  r5,r0        ;
CODE_08BBE7:         lsr                ;
CODE_08BBE8:         to r9              ;
CODE_08BBE9:         add   r9           ;
CODE_08BBEA:         lms   r6,(0046)    ;
CODE_08BBED:         inc   r12          ;
CODE_08BBEE:         move  r13,r15      ;
CODE_08BBF0:         from r7            ;
CODE_08BBF1:         hib                ;
CODE_08BBF2:         swap               ;
CODE_08BBF3:         lms   r3,(0000)    ;
CODE_08BBF6:         with r3            ;
CODE_08BBF7:         sub   r0           ;
CODE_08BBF8:         from r8            ;
CODE_08BBF9:         hib                ;
CODE_08BBFA:         to r14             ;
CODE_08BBFB:         add   r3           ;
CODE_08BBFC:         with r8            ;
CODE_08BBFD:         add   r10          ;
CODE_08BBFE:         getb               ;
CODE_08BBFF:         to r4              ;
CODE_08BC00:         and   #0F          ;
CODE_08BC02:         from r11           ;
CODE_08BC03:         hib                ;
CODE_08BC04:         swap               ;
CODE_08BC05:         lms   r3,(0002)    ;
CODE_08BC08:         with r3            ;
CODE_08BC09:         sub   r0           ;
CODE_08BC0A:         from r9            ;
CODE_08BC0B:         hib                ;
CODE_08BC0C:         to r14             ;
CODE_08BC0D:         add   r3           ;
CODE_08BC0E:         with r9            ;
CODE_08BC0F:         add   r5           ;
CODE_08BC10:         getb               ;
CODE_08BC11:         and   #0F          ;
CODE_08BC13:         sub   r4           ;
CODE_08BC14:         swap               ;
CODE_08BC15:         fmult              ;
CODE_08BC16:         add   r4           ;
CODE_08BC17:         color              ;
CODE_08BC18:         loop               ;
CODE_08BC19:         plot               ;
CODE_08BC1A:         lms   r0,(0014)    ;
CODE_08BC1D:         to r7              ;
CODE_08BC1E:         add   r7           ;
CODE_08BC1F:         lms   r0,(0016)    ;
CODE_08BC22:         to r11             ;
CODE_08BC23:         add   r11          ;
CODE_08BC24:         lms   r0,(0058)    ;
CODE_08BC27:         dec   r0           ;
CODE_08BC28:         sms   (0058),r0    ;
CODE_08BC2B:         beq CODE_08BC32    ;
CODE_08BC2D:         dec   r2           ;
CODE_08BC2E:         iwt   r15,#BACA    ;
CODE_08BC31:         nop                ;
CODE_08BC32:         rpix               ;
CODE_08BC34:         stop               ;
CODE_08BC35:         nop                ;

CODE_08BC36:         iwt   r1,#0E2A     ;
CODE_08BC39:         iwt   r2,#2644     ;
CODE_08BC3C:         iwt   r3,#03FF     ;
CODE_08BC3F:         iwt   r4,#0180     ;
CODE_08BC42:         iwt   r5,#0080     ;
CODE_08BC45:         iwt   r9,#01CE     ;
CODE_08BC48:         ibt   r14,#003E    ;
CODE_08BC4A:         cache              ;
CODE_08BC4B:         ibt   r12,#0011    ;
CODE_08BC4D:         move  r13,r15      ;
CODE_08BC4F:         from r2            ;
CODE_08BC50:         to r10             ;
CODE_08BC51:         add   r8           ;
CODE_08BC52:         ldw   (r1)         ;
CODE_08BC53:         move  r11,r0       ;
CODE_08BC55:         and   r3           ;
CODE_08BC56:         sub   r4           ;
CODE_08BC57:         bcc CODE_08BC62    ;
CODE_08BC59:         sub   r5           ;
CODE_08BC5A:         bcs CODE_08BC63    ;
CODE_08BC5C:         from r9            ;
CODE_08BC5D:         from r11           ;
CODE_08BC5E:         and   r6           ;
CODE_08BC5F:         bra CODE_08BC63    ;

CODE_08BC61:         or    r7           ;
CODE_08BC62:         from r9            ;
CODE_08BC63:         stw   (r10)        ;
CODE_08BC64:         inc   r8           ;
CODE_08BC65:         inc   r8           ;
CODE_08BC66:         with r8            ;
CODE_08BC67:         and   r14          ;
CODE_08BC68:         inc   r1           ;
CODE_08BC69:         inc   r1           ;
CODE_08BC6A:         inc   r1           ;
CODE_08BC6B:         loop               ;
CODE_08BC6C:         inc   r1           ;
CODE_08BC6D:         iwt   r1,#0DAA     ;
CODE_08BC70:         iwt   r2,#2604     ;
CODE_08BC73:         iwt   r10,#2624    ;
CODE_08BC76:         ibt   r14,#0004    ;
CODE_08BC78:         ibt   r12,#0010    ;
CODE_08BC7A:         move  r13,r15      ;
CODE_08BC7C:         ldw   (r1)         ;
CODE_08BC7D:         move  r11,r0       ;
CODE_08BC7F:         and   r3           ;
CODE_08BC80:         sub   r4           ;
CODE_08BC81:         bcc CODE_08BC8B    ;
CODE_08BC83:         sub   r5           ;
CODE_08BC84:         bcs CODE_08BC8B    ;
CODE_08BC86:         from r11           ;
CODE_08BC87:         and   r6           ;
CODE_08BC88:         bra CODE_08BC8D    ;

CODE_08BC8A:         or    r7           ;
CODE_08BC8B:         move  r0,r9        ;
CODE_08BC8D:         stw   (r2)         ;
CODE_08BC8E:         stw   (r10)        ;
CODE_08BC8F:         with r1            ;
CODE_08BC90:         add   r14          ;
CODE_08BC91:         inc   r2           ;
CODE_08BC92:         inc   r2           ;
CODE_08BC93:         inc   r10          ;
CODE_08BC94:         loop               ;
CODE_08BC95:         inc   r10          ;
CODE_08BC96:         stop               ;
CODE_08BC97:         nop                ;

CODE_08BC98:         cache              ;
CODE_08BC99:         ibt   r4,#001F     ;
CODE_08BC9B:         from r3            ;
CODE_08BC9C:         to r5              ;
CODE_08BC9D:         and   r4           ;
CODE_08BC9E:         from r3            ;
CODE_08BC9F:         lsr                ;
CODE_08BCA0:         lsr                ;
CODE_08BCA1:         lsr                ;
CODE_08BCA2:         lsr                ;
CODE_08BCA3:         lsr                ;
CODE_08BCA4:         to r6              ;
CODE_08BCA5:         and   r4           ;
CODE_08BCA6:         from r3            ;
CODE_08BCA7:         swap               ;
CODE_08BCA8:         lsr                ;
CODE_08BCA9:         lsr                ;
CODE_08BCAA:         to r7              ;
CODE_08BCAB:         and   r4           ;
CODE_08BCAC:         move  r13,r15      ;
CODE_08BCAE:         ldb   (r1)         ;
CODE_08BCB0:         and   r4           ;
CODE_08BCB1:         sub   r5           ;
CODE_08BCB2:         bpl CODE_08BCB6    ;
CODE_08BCB4:         nop                ;
CODE_08BCB5:         sub   r0           ;
CODE_08BCB6:         move  r8,r0        ;
CODE_08BCB8:         ldw   (r1)         ;
CODE_08BCB9:         lsr                ;
CODE_08BCBA:         lsr                ;
CODE_08BCBB:         lsr                ;
CODE_08BCBC:         lsr                ;
CODE_08BCBD:         lsr                ;
CODE_08BCBE:         and   r4           ;
CODE_08BCBF:         sub   r6           ;
CODE_08BCC0:         bpl CODE_08BCC4    ;
CODE_08BCC2:         nop                ;
CODE_08BCC3:         sub   r0           ;
CODE_08BCC4:         ibt   r9,#0020     ;
CODE_08BCC6:         mult  r9           ;
CODE_08BCC7:         to r8              ;
CODE_08BCC8:         or    r8           ;
CODE_08BCC9:         ldw   (r1)         ;
CODE_08BCCA:         swap               ;
CODE_08BCCB:         lsr                ;
CODE_08BCCC:         lsr                ;
CODE_08BCCD:         and   r4           ;
CODE_08BCCE:         sub   r7           ;
CODE_08BCCF:         bpl CODE_08BCD3    ;
CODE_08BCD1:         nop                ;
CODE_08BCD2:         sub   r0           ;
CODE_08BCD3:         ibt   r9,#0004     ;
CODE_08BCD5:         swap               ;
CODE_08BCD6:         mult  r9           ;
CODE_08BCD7:         or    r8           ;
CODE_08BCD8:         stw   (r2)         ;
CODE_08BCD9:         inc   r1           ;
CODE_08BCDA:         inc   r1           ;
CODE_08BCDB:         inc   r2           ;
CODE_08BCDC:         loop               ;
CODE_08BCDD:         inc   r2           ;
CODE_08BCDE:         stop               ;
CODE_08BCDF:         nop                ;

CODE_08BCE0:         cache              ;
CODE_08BCE1:         ibt   r0,#0001     ;
CODE_08BCE3:         cmode              ;
CODE_08BCE5:         lm    r6,(0000)    ;
CODE_08BCE9:         lm    r3,(0002)    ;
CODE_08BCED:         ibt   r5,#0007     ;
CODE_08BCEF:         ibt   r0,#0040     ;
CODE_08BCF1:         to r4              ;
CODE_08BCF2:         add   r3           ;
CODE_08BCF3:         move  r1,r6        ;
CODE_08BCF5:         ibt   r12,#0010    ;
CODE_08BCF7:         move  r13,r15      ;
CODE_08BCF9:         move  r2,r3        ;
CODE_08BCFB:         rpix               ;
CODE_08BCFD:         color              ;
CODE_08BCFE:         move  r2,r4        ;
CODE_08BD00:         plot               ;
CODE_08BD01:         with r1            ;
CODE_08BD02:         add   #07          ;
CODE_08BD04:         loop               ;
CODE_08BD05:         nop                ;
CODE_08BD06:         with r3            ;
CODE_08BD07:         add   #08          ;
CODE_08BD09:         with r4            ;
CODE_08BD0A:         add   #08          ;
CODE_08BD0C:         move  r1,r6        ;
CODE_08BD0E:         dec   r5           ;
CODE_08BD0F:         bpl CODE_08BCF3    ;
CODE_08BD11:         nop                ;
CODE_08BD12:         rpix               ;
CODE_08BD14:         stop               ;
CODE_08BD15:         nop                ;

.clear_oam_mirror                        ;
CODE_08BD16:         cache              ;
CODE_08BD17:         iwt   r0,#0A00     ; OAM low table mirror
CODE_08BD1A:         iwt   r1,#F080     ; values to clear with (x=$80, y=$F0)
CODE_08BD1D:         ibt   r2,#0004     ;
CODE_08BD1F:         iwt   r12,#0080    ;
CODE_08BD22:         move  r13,r15      ;
CODE_08BD24:         from r1            ;
CODE_08BD25:         stw   (r0)         ; \  loop through entire table
CODE_08BD26:         loop               ;  | clearing x & y with $80 & $F0
CODE_08BD27:         add   r2           ; /
CODE_08BD28:         move  r1,r0        ;
CODE_08BD2A:         iwt   r0,#5555     ;
CODE_08BD2D:         ibt   r12,#0010    ;
CODE_08BD2F:         move  r13,r15      ;
CODE_08BD31:         stw   (r1)         ; \
CODE_08BD32:         inc   r1           ;  | move onto high table mirror
CODE_08BD33:         loop               ;  | clear with $55's
CODE_08BD34:         inc   r1           ; /
CODE_08BD35:         stop               ;
CODE_08BD36:         nop                ;

; #$000D -> r0
; #$D0B6 -> r5
; #$0047 -> r1
; #$0050 -> r2
; $7680,x + #$0006 -> r3
; #$0004 -> r4
; $18,x -> r6

CODE_08BD37:         romb               ;
CODE_08BD39:         from r4            ;
CODE_08BD3A:         add   r4           ;
CODE_08BD3B:         add   r0           ;
CODE_08BD3C:         iwt   r4,#3A02     ;
CODE_08BD3F:         add   r4           ;
CODE_08BD40:         move  r10,r0       ;
CODE_08BD42:         to r11             ;
CODE_08BD43:         add   #04          ;
CODE_08BD45:         cache              ;
CODE_08BD46:         moves r7,r6        ;
CODE_08BD48:         bne CODE_08BD4E    ;
CODE_08BD4A:         sub   r0           ;
CODE_08BD4B:         bra CODE_08BD4E    ;

CODE_08BD4D:         dec   r7           ;
CODE_08BD4E:         move  r7,r0        ;
CODE_08BD50:         inc   r0           ;
CODE_08BD51:         ibt   r12,#0011    ;
CODE_08BD53:         move  r13,r15      ;
CODE_08BD55:         with r7            ;
CODE_08BD56:         add   r7           ;
CODE_08BD57:         cmp   r6           ;
CODE_08BD59:         bcc CODE_08BD5E    ;
CODE_08BD5B:         nop                ;
CODE_08BD5C:         sub   r6           ;
CODE_08BD5D:         inc   r7           ;
CODE_08BD5E:         loop               ;
CODE_08BD5F:         add   r0           ;
CODE_08BD60:         move  r14,r5       ;
CODE_08BD62:         getb               ;
CODE_08BD63:         to r8              ;
CODE_08BD64:         swap               ;
CODE_08BD65:         inc   r5           ;
CODE_08BD66:         move  r0,r2        ;
CODE_08BD68:         with r2            ;
CODE_08BD69:         swap               ;
CODE_08BD6A:         add   #04          ;
CODE_08BD6C:         to r9              ;
CODE_08BD6D:         swap               ;
CODE_08BD6E:         iwt   r0,#3A02     ;
CODE_08BD71:         from r10           ;
CODE_08BD72:         sub   r0           ;
CODE_08BD73:         bmi CODE_08BDC2    ;
CODE_08BD75:         nop                ;
CODE_08BD76:         iwt   r4,#0348     ;
CODE_08BD79:         sub   r4           ;
CODE_08BD7A:         bpl CODE_08BDA2    ;
CODE_08BD7C:         nop                ;
CODE_08BD7D:         from r2            ;
CODE_08BD7E:         hib                ;
CODE_08BD7F:         add   r0           ;
CODE_08BD80:         add   r0           ;
CODE_08BD81:         to r14             ;
CODE_08BD82:         add   r5           ;
CODE_08BD83:         ibt   r12,#0004    ;
CODE_08BD85:         move  r13,r15      ;
CODE_08BD87:         getb               ;
CODE_08BD88:         sub   r1           ;
CODE_08BD89:         lmult              ;
CODE_08BD8B:         lob                ;
CODE_08BD8C:         swap               ;
CODE_08BD8D:         with r4            ;
CODE_08BD8E:         hib                ;
CODE_08BD8F:         or    r4           ;
CODE_08BD90:         add   r3           ;
CODE_08BD91:         bpl CODE_08BD95    ;
CODE_08BD93:         inc   r14          ;
CODE_08BD94:         sub   r0           ;
CODE_08BD95:         iwt   r4,#00FF     ;
CODE_08BD98:         cmp   r4           ;
CODE_08BD9A:         bcc CODE_08BD9E    ;
CODE_08BD9C:         nop                ;
CODE_08BD9D:         from r4            ;
CODE_08BD9E:         stb   (r10)        ;
CODE_08BDA0:         loop               ;
CODE_08BDA1:         inc   r10          ;
CODE_08BDA2:         with r10           ;
CODE_08BDA3:         sub   #08          ;
CODE_08BDA5:         with r2            ;
CODE_08BDA6:         sub   r7           ;
CODE_08BDA7:         from r2            ;
CODE_08BDA8:         sub   r8           ;
CODE_08BDA9:         bcc CODE_08BD6F    ;
CODE_08BDAB:         iwt   r0,#3A02     ;
CODE_08BDAE:         move  r4,r0        ;
CODE_08BDB0:         from r10           ;
CODE_08BDB1:         sub   r0           ;
CODE_08BDB2:         bmi CODE_08BDC2    ;
CODE_08BDB4:         lsr                ;
CODE_08BDB5:         lsr                ;
CODE_08BDB6:         inc   r0           ;
CODE_08BDB7:         to r12             ;
CODE_08BDB8:         add   r0           ;
CODE_08BDB9:         iwt   r0,#00FF     ;
CODE_08BDBC:         move  r13,r15      ;
CODE_08BDBE:         stw   (r4)         ;
CODE_08BDBF:         inc   r4           ;
CODE_08BDC0:         loop               ;
CODE_08BDC1:         inc   r4           ;
CODE_08BDC2:         iwt   r0,#3D46     ;
CODE_08BDC5:         sub   r11          ;
CODE_08BDC6:         bmi CODE_08BE10    ;
CODE_08BDC8:         nop                ;
CODE_08BDC9:         iwt   r4,#0348     ;
CODE_08BDCC:         sub   r4           ;
CODE_08BDCD:         bpl CODE_08BDF5    ;
CODE_08BDCF:         nop                ;
CODE_08BDD0:         from r9            ;
CODE_08BDD1:         hib                ;
CODE_08BDD2:         add   r0           ;
CODE_08BDD3:         add   r0           ;
CODE_08BDD4:         to r14             ;
CODE_08BDD5:         add   r5           ;
CODE_08BDD6:         ibt   r12,#0004    ;
CODE_08BDD8:         move  r13,r15      ;
CODE_08BDDA:         getb               ;
CODE_08BDDB:         sub   r1           ;
CODE_08BDDC:         lmult              ;
CODE_08BDDE:         lob                ;
CODE_08BDDF:         swap               ;
CODE_08BDE0:         with r4            ;
CODE_08BDE1:         hib                ;
CODE_08BDE2:         or    r4           ;
CODE_08BDE3:         add   r3           ;
CODE_08BDE4:         bpl CODE_08BDE8    ;
CODE_08BDE6:         inc   r14          ;
CODE_08BDE7:         sub   r0           ;
CODE_08BDE8:         iwt   r4,#00FF     ;
CODE_08BDEB:         cmp   r4           ;
CODE_08BDED:         bcc CODE_08BDF1    ;
CODE_08BDEF:         nop                ;
CODE_08BDF0:         from r4            ;
CODE_08BDF1:         stb   (r11)        ;
CODE_08BDF3:         loop               ;
CODE_08BDF4:         inc   r11          ;
CODE_08BDF5:         with r9            ;
CODE_08BDF6:         add   r7           ;
CODE_08BDF7:         from r9            ;
CODE_08BDF8:         sub   r8           ;
CODE_08BDF9:         bcc CODE_08BDC3    ;
CODE_08BDFB:         iwt   r0,#3D46     ;
CODE_08BDFE:         from r0            ;
CODE_08BDFF:         sub   r11          ;
CODE_08BE00:         bmi CODE_08BE10    ;
CODE_08BE02:         lsr                ;
CODE_08BE03:         lsr                ;
CODE_08BE04:         inc   r0           ;
CODE_08BE05:         to r12             ;
CODE_08BE06:         add   r0           ;
CODE_08BE07:         iwt   r0,#00FF     ;
CODE_08BE0A:         move  r13,r15      ;
CODE_08BE0C:         stw   (r11)        ;
CODE_08BE0D:         inc   r11          ;
CODE_08BE0E:         loop               ;
CODE_08BE0F:         inc   r11          ;
CODE_08BE10:         stop               ;
CODE_08BE11:         nop                ;

CODE_08BE12:         iwt   r1,#385E     ;
CODE_08BE15:         iwt   r3,#07F0     ;
CODE_08BE18:         iwt   r4,#0080     ;
CODE_08BE1B:         ibt   r5,#007F     ;
CODE_08BE1D:         ibt   r12,#0000    ;
CODE_08BE1F:         iwt   r13,#00D2    ;
CODE_08BE22:         iwt   r14,#0094    ;
CODE_08BE25:         from r2            ;
CODE_08BE26:         add   #09          ;
CODE_08BE28:         to r6              ;
CODE_08BE29:         and   #0F          ;
CODE_08BE2B:         and   r3           ;
CODE_08BE2C:         lsr                ;
CODE_08BE2D:         lsr                ;
CODE_08BE2E:         move  r7,r0        ;
CODE_08BE30:         lsr                ;
CODE_08BE31:         add   r7           ;
CODE_08BE32:         iwt   r7,#3D4A     ;
CODE_08BE35:         to r7              ;
CODE_08BE36:         add   r7           ;
CODE_08BE37:         ldw   (r7)         ;
CODE_08BE38:         move  r8,r0        ;
CODE_08BE3A:         sub   r6           ;
CODE_08BE3B:         bra CODE_08BE41    ;

CODE_08BE3D:         cache              ;
CODE_08BE3E:         ldw   (r7)         ;
CODE_08BE3F:         move  r8,r0        ;
CODE_08BE41:         move  r9,r0        ;
CODE_08BE43:         to r12             ;
CODE_08BE44:         add   r12          ;
CODE_08BE45:         from r13           ;
CODE_08BE46:         sub   r12          ;
CODE_08BE47:         bpl CODE_08BE4B    ;
CODE_08BE49:         to r9              ;
CODE_08BE4A:         add   r9           ;
CODE_08BE4B:         inc   r7           ;
CODE_08BE4C:         inc   r7           ;
CODE_08BE4D:         ldw   (r7)         ;
CODE_08BE4E:         to r10             ;
CODE_08BE4F:         add   r2           ;
CODE_08BE50:         inc   r7           ;
CODE_08BE51:         inc   r7           ;
CODE_08BE52:         ldw   (r7)         ;
CODE_08BE53:         add   r14          ;
CODE_08BE54:         to r11             ;
CODE_08BE55:         ldw   (r0)         ;
CODE_08BE56:         inc   r7           ;
CODE_08BE57:         inc   r7           ;
CODE_08BE58:         from r9            ;
CODE_08BE59:         sub   r4           ;
CODE_08BE5A:         bcc CODE_08BE76    ;
CODE_08BE5C:         from r5            ;
CODE_08BE5D:         stb   (r1)         ;
CODE_08BE5F:         inc   r1           ;
CODE_08BE60:         move  r0,r11       ;
CODE_08BE62:         stb   (r1)         ;
CODE_08BE64:         inc   r1           ;
CODE_08BE65:         swap               ;
CODE_08BE66:         stb   (r1)         ;
CODE_08BE68:         inc   r1           ;
CODE_08BE69:         move  r0,r10       ;
CODE_08BE6B:         stb   (r1)         ;
CODE_08BE6D:         inc   r1           ;
CODE_08BE6E:         swap               ;
CODE_08BE6F:         stb   (r1)         ;
CODE_08BE71:         with r9            ;
CODE_08BE72:         sub   r5           ;
CODE_08BE73:         bra CODE_08BE58    ;

CODE_08BE75:         inc   r1           ;
CODE_08BE76:         from r9            ;
CODE_08BE77:         stb   (r1)         ;
CODE_08BE79:         inc   r1           ;
CODE_08BE7A:         move  r0,r11       ;
CODE_08BE7C:         stb   (r1)         ;
CODE_08BE7E:         inc   r1           ;
CODE_08BE7F:         swap               ;
CODE_08BE80:         stb   (r1)         ;
CODE_08BE82:         inc   r1           ;
CODE_08BE83:         move  r0,r10       ;
CODE_08BE85:         stb   (r1)         ;
CODE_08BE87:         inc   r1           ;
CODE_08BE88:         swap               ;
CODE_08BE89:         stb   (r1)         ;
CODE_08BE8B:         inc   r1           ;
CODE_08BE8C:         dec   r8           ;
CODE_08BE8D:         from r8            ;
CODE_08BE8E:         and   r3           ;
CODE_08BE8F:         lsr                ;
CODE_08BE90:         lsr                ;
CODE_08BE91:         move  r8,r0        ;
CODE_08BE93:         lsr                ;
CODE_08BE94:         add   r8           ;
CODE_08BE95:         to r7              ;
CODE_08BE96:         add   r7           ;
CODE_08BE97:         from r13           ;
CODE_08BE98:         sub   r12          ;
CODE_08BE99:         dec   r0           ;
CODE_08BE9A:         bpl CODE_08BE3F    ;
CODE_08BE9C:         ldw   (r7)         ;
CODE_08BE9D:         stop               ;
CODE_08BE9E:         nop                ;

CODE_08BE9F:         with r2            ;
CODE_08BEA0:         sub   #08          ;
CODE_08BEA2:         iwt   r0,#00F0     ;
CODE_08BEA5:         to r5              ;
CODE_08BEA6:         add   r0           ;
CODE_08BEA7:         add   r1           ;
CODE_08BEA8:         sub   r5           ;
CODE_08BEA9:         bcc CODE_08BEB7    ;
CODE_08BEAB:         nop                ;
CODE_08BEAC:         iwt   r3,#3372     ;
CODE_08BEAF:         iwt   r12,#00D2    ;
CODE_08BEB2:         sub   r0           ;
CODE_08BEB3:         iwt   r15,#C03A    ;
CODE_08BEB6:         dec   r0           ;
CODE_08BEB7:         ibt   r0,#0008     ;
CODE_08BEB9:         romb               ;
CODE_08BEBB:         iwt   r0,#AB98     ;
CODE_08BEBE:         add   r4           ;
CODE_08BEBF:         to r14             ;
CODE_08BEC0:         add   r4           ;
CODE_08BEC1:         getb               ;
CODE_08BEC2:         inc   r14          ;
CODE_08BEC3:         getbh              ;
CODE_08BEC5:         move  r7,r0        ;
CODE_08BEC7:         iwt   r0,#AC18     ;
CODE_08BECA:         add   r4           ;
CODE_08BECB:         to r14             ;
CODE_08BECC:         add   r4           ;
CODE_08BECD:         getb               ;
CODE_08BECE:         inc   r14          ;
CODE_08BECF:         getbh              ;
CODE_08BED1:         move  r8,r0        ;
CODE_08BED3:         sms   (0048),r4    ;
CODE_08BED6:         from r12           ;
CODE_08BED7:         romb               ;
CODE_08BED9:         move  r14,r13      ;
CODE_08BEDB:         to r12             ;
CODE_08BEDC:         getb               ;
CODE_08BEDD:         inc   r14          ;
CODE_08BEDE:         sms   (0058),r12   ;
CODE_08BEE1:         iwt   r1,#2200     ;
CODE_08BEE4:         ibt   r5,#0000     ;
CODE_08BEE6:         cache              ;
CODE_08BEE7:         move  r13,r15      ;
CODE_08BEE9:         getbs              ;
CODE_08BEEB:         inc   r14          ;
CODE_08BEEC:         move  r9,r0        ;
CODE_08BEEE:         move  r6,r7        ;
CODE_08BEF0:         lmult              ;
CODE_08BEF2:         move  r10,r4       ;
CODE_08BEF4:         getbs              ;
CODE_08BEF6:         inc   r14          ;
CODE_08BEF7:         move  r11,r0       ;
CODE_08BEF9:         move  r6,r8        ;
CODE_08BEFB:         lmult              ;
CODE_08BEFD:         from r10           ;
CODE_08BEFE:         add   r4           ;
CODE_08BEFF:         hib                ;
CODE_08BF00:         sex                ;
CODE_08BF01:         add   r3           ;
CODE_08BF02:         add   r0           ;
CODE_08BF03:         add   r1           ;
CODE_08BF04:         to r10             ;
CODE_08BF05:         ldw   (r0)         ;
CODE_08BF06:         from r9            ;
CODE_08BF07:         lmult              ;
CODE_08BF09:         move  r9,r4        ;
CODE_08BF0B:         move  r6,r7        ;
CODE_08BF0D:         from r11           ;
CODE_08BF0E:         lmult              ;
CODE_08BF10:         from r4            ;
CODE_08BF11:         sub   r9           ;
CODE_08BF12:         hib                ;
CODE_08BF13:         sex                ;
CODE_08BF14:         move  r6,r10       ;
CODE_08BF16:         swap               ;
CODE_08BF17:         fmult              ;
CODE_08BF18:         add   r2           ;
CODE_08BF19:         stw   (r5)         ;
CODE_08BF1A:         inc   r5           ;
CODE_08BF1B:         inc   r5           ;
CODE_08BF1C:         getb               ;
CODE_08BF1D:         inc   r14          ;
CODE_08BF1E:         swap               ;
CODE_08BF1F:         fmult              ;
CODE_08BF20:         adc   #00          ;
CODE_08BF22:         stw   (r5)         ;
CODE_08BF23:         inc   r5           ;
CODE_08BF24:         loop               ;
CODE_08BF25:         inc   r5           ;
CODE_08BF26:         to r1              ;
CODE_08BF27:         getb               ;
CODE_08BF28:         inc   r14          ;
CODE_08BF29:         iwt   r11,#2200    ;
CODE_08BF2C:         to r2              ;
CODE_08BF2D:         getb               ;
CODE_08BF2E:         inc   r14          ;
CODE_08BF2F:         getb               ;
CODE_08BF30:         inc   r14          ;
CODE_08BF31:         add   r0           ;
CODE_08BF32:         to r8              ;
CODE_08BF33:         add   r0           ;
CODE_08BF34:         getb               ;
CODE_08BF35:         inc   r14          ;
CODE_08BF36:         add   r0           ;
CODE_08BF37:         to r9              ;
CODE_08BF38:         add   r0           ;
CODE_08BF39:         to r3              ;
CODE_08BF3A:         ldw   (r8)         ;
CODE_08BF3B:         ldw   (r9)         ;
CODE_08BF3C:         sub   r3           ;
CODE_08BF3D:         bpl CODE_08BF44    ;
CODE_08BF3F:         inc   r0           ;
CODE_08BF40:         iwt   r15,#BFF1    ;
CODE_08BF43:         dec   r1           ;
CODE_08BF44:         sms   (0054),r0    ;
CODE_08BF47:         inc   r8           ;
CODE_08BF48:         inc   r8           ;
CODE_08BF49:         to r7              ;
CODE_08BF4A:         ldw   (r8)         ;
CODE_08BF4B:         inc   r9           ;
CODE_08BF4C:         inc   r9           ;
CODE_08BF4D:         to r8              ;
CODE_08BF4E:         ldw   (r9)         ;
CODE_08BF4F:         iwt   r0,#00F0     ;
CODE_08BF52:         and   r2           ;
CODE_08BF53:         lms   r4,(0048)    ;
CODE_08BF56:         add   r4           ;
CODE_08BF57:         add   r0           ;
CODE_08BF58:         swap               ;
CODE_08BF59:         bpl CODE_08BF61    ;
CODE_08BF5B:         hib                ;
CODE_08BF5C:         iwt   r4,#00FF     ;
CODE_08BF5F:         from r4            ;
CODE_08BF60:         sub   r0           ;
CODE_08BF61:         to r4              ;
CODE_08BF62:         add   r0           ;
CODE_08BF63:         from r2            ;
CODE_08BF64:         and   #0F          ;
CODE_08BF66:         move  r2,r0        ;
CODE_08BF68:         add   r0           ;
CODE_08BF69:         add   r0           ;
CODE_08BF6A:         to r9              ;
CODE_08BF6B:         add   r0           ;
CODE_08BF6C:         iwt   r0,#2D6E     ;
CODE_08BF6F:         to r10             ;
CODE_08BF70:         add   r9           ;
CODE_08BF71:         iwt   r0,#2002     ;
CODE_08BF74:         to r9              ;
CODE_08BF75:         add   r9           ;
CODE_08BF76:         from r2            ;
CODE_08BF77:         umult #09          ;
CODE_08BF79:         iwt   r6,#404A     ;
CODE_08BF7C:         to r6              ;
CODE_08BF7D:         add   r6           ;
CODE_08BF7E:         ibt   r12,#0003    ;
CODE_08BF80:         move  r13,r15      ;
CODE_08BF82:         ldb   (r6)         ;
CODE_08BF84:         umult r4           ;
CODE_08BF86:         swap               ;
CODE_08BF87:         bpl CODE_08BF8B    ;
CODE_08BF89:         lob                ;
CODE_08BF8A:         inc   r0           ;
CODE_08BF8B:         add   r0           ;
CODE_08BF8C:         add   r0           ;
CODE_08BF8D:         add   r0           ;
CODE_08BF8E:         add   r0           ;
CODE_08BF8F:         to r5              ;
CODE_08BF90:         add   r0           ;
CODE_08BF91:         inc   r6           ;
CODE_08BF92:         ldb   (r6)         ;
CODE_08BF94:         umult r4           ;
CODE_08BF96:         swap               ;
CODE_08BF97:         bpl CODE_08BF9B    ;
CODE_08BF99:         lob                ;
CODE_08BF9A:         inc   r0           ;
CODE_08BF9B:         or    r5           ;
CODE_08BF9C:         add   r0           ;
CODE_08BF9D:         add   r0           ;
CODE_08BF9E:         add   r0           ;
CODE_08BF9F:         add   r0           ;
CODE_08BFA0:         to r5              ;
CODE_08BFA1:         add   r0           ;
CODE_08BFA2:         inc   r6           ;
CODE_08BFA3:         ldb   (r6)         ;
CODE_08BFA5:         umult r4           ;
CODE_08BFA7:         swap               ;
CODE_08BFA8:         bpl CODE_08BFAC    ;
CODE_08BFAA:         lob                ;
CODE_08BFAB:         inc   r0           ;
CODE_08BFAC:         or    r5           ;
CODE_08BFAD:         stw   (r10)        ;
CODE_08BFAE:         stw   (r9)         ;
CODE_08BFAF:         inc   r9           ;
CODE_08BFB0:         inc   r9           ;
CODE_08BFB1:         inc   r10          ;
CODE_08BFB2:         inc   r10          ;
CODE_08BFB3:         loop               ;
CODE_08BFB4:         inc   r6           ;
CODE_08BFB5:         lms   r12,(0054)   ;
CODE_08BFB8:         from r12           ;
CODE_08BFB9:         add   r12          ;
CODE_08BFBA:         add   r11          ;
CODE_08BFBB:         ldw   (r0)         ;
CODE_08BFBC:         to r6              ;
CODE_08BFBD:         lsr                ;
CODE_08BFBE:         from r8            ;
CODE_08BFBF:         sub   r7           ;
CODE_08BFC0:         lob                ;
CODE_08BFC1:         swap               ;
CODE_08BFC2:         fmult              ;
CODE_08BFC3:         to r8              ;
CODE_08BFC4:         rol                ;
CODE_08BFC5:         iwt   r4,#0080     ;
CODE_08BFC8:         iwt   r0,#3372     ;
CODE_08BFCB:         add   r3           ;
CODE_08BFCC:         to r10             ;
CODE_08BFCD:         add   r3           ;
CODE_08BFCE:         iwt   r9,#00D2     ;
CODE_08BFD1:         from r2            ;
CODE_08BFD2:         swap               ;
CODE_08BFD3:         to r2              ;
CODE_08BFD4:         lsr                ;
CODE_08BFD5:         move  r13,r15      ;
CODE_08BFD7:         moves r0,r3        ;
CODE_08BFD9:         bmi CODE_08BFE4    ;
CODE_08BFDB:         sub   r9           ;
CODE_08BFDC:         bpl CODE_08BFF0    ;
CODE_08BFDE:         from r2            ;
CODE_08BFDF:         sub   r3           ;
CODE_08BFE0:         add   r7           ;
CODE_08BFE1:         sub   #08          ;
CODE_08BFE3:         stw   (r10)        ;
CODE_08BFE4:         from r4            ;
CODE_08BFE5:         add   r8           ;
CODE_08BFE6:         to r4              ;
CODE_08BFE7:         lob                ;
CODE_08BFE8:         hib                ;
CODE_08BFE9:         sex                ;
CODE_08BFEA:         to r7              ;
CODE_08BFEB:         add   r7           ;
CODE_08BFEC:         inc   r10          ;
CODE_08BFED:         inc   r10          ;
CODE_08BFEE:         loop               ;
CODE_08BFEF:         inc   r3           ;
CODE_08BFF0:         dec   r1           ;
CODE_08BFF1:         beq CODE_08BFF8    ;
CODE_08BFF3:         nop                ;
CODE_08BFF4:         iwt   r15,#BF2D    ;
CODE_08BFF7:         to r2              ;
CODE_08BFF8:         iwt   r1,#00D1     ;
CODE_08BFFB:         move  r4,r1        ;
CODE_08BFFD:         ibt   r2,#FFFF     ;
CODE_08BFFF:         ibt   r3,#0000     ;
CODE_08C001:         lms   r12,(0058)   ;
CODE_08C004:         move  r13,r15      ;
CODE_08C006:         ldw   (r3)         ;
CODE_08C007:         sub   r1           ;
CODE_08C008:         bpl CODE_08C00D    ;
CODE_08C00A:         add   r1           ;
CODE_08C00B:         move  r1,r0        ;
CODE_08C00D:         sub   r2           ;
CODE_08C00E:         bmi CODE_08C013    ;
CODE_08C010:         add   r2           ;
CODE_08C011:         move  r2,r0        ;
CODE_08C013:         inc   r3           ;
CODE_08C014:         inc   r3           ;
CODE_08C015:         inc   r3           ;
CODE_08C016:         loop               ;
CODE_08C017:         inc   r3           ;
CODE_08C018:         iwt   r5,#3372     ;
CODE_08C01B:         move  r12,r1       ;
CODE_08C01D:         dec   r1           ;
CODE_08C01E:         bmi CODE_08C02D    ;
CODE_08C020:         move  r3,r5        ;
CODE_08C023:         ibt   r0,#FFF8     ;
CODE_08C025:         move  r13,r15      ;
CODE_08C027:         dec   r0           ;
CODE_08C028:         stw   (r3)         ;
CODE_08C029:         inc   r3           ;
CODE_08C02A:         loop               ;
CODE_08C02B:         inc   r3           ;
CODE_08C02C:         from r4            ;
CODE_08C02D:         sub   r2           ;
CODE_08C02E:         move  r12,r0       ;
CODE_08C030:         dec   r0           ;
CODE_08C031:         bmi CODE_08C043    ;
CODE_08C033:         inc   r2           ;
CODE_08C034:         from r5            ;
CODE_08C035:         add   r2           ;
CODE_08C036:         to r3              ;
CODE_08C037:         add   r2           ;
CODE_08C038:         from r2            ;
CODE_08C039:         not                ;
CODE_08C03A:         sub   #08          ;
CODE_08C03C:         move  r13,r15      ;
CODE_08C03E:         stw   (r3)         ;
CODE_08C03F:         inc   r3           ;
CODE_08C040:         inc   r3           ;
CODE_08C041:         loop               ;
CODE_08C042:         dec   r0           ;
CODE_08C043:         stop               ;
CODE_08C044:         nop                ;

CODE_08C045:         cache              ;
CODE_08C046:         sub   r0           ;
CODE_08C047:         cmode              ;
CODE_08C049:         iwt   r5,#6000     ;
CODE_08C04C:         iwt   r6,#0140     ;
CODE_08C04F:         iwt   r7,#0060     ;
CODE_08C052:         iwt   r13,#C05A    ;
CODE_08C055:         ibt   r8,#0004     ;
CODE_08C057:         sub   r0           ;
CODE_08C058:         move  r12,r7       ;
CODE_08C05A:         stw   (r5)         ;
CODE_08C05B:         inc   r5           ;
CODE_08C05C:         loop               ;
CODE_08C05D:         inc   r5           ;
CODE_08C05E:         with r5            ;
CODE_08C05F:         add   r6           ;
CODE_08C060:         dec   r8           ;
CODE_08C061:         bne CODE_08C059    ;
CODE_08C063:         move  r12,r7       ;
CODE_08C065:         ibt   r0,#0008     ;
CODE_08C067:         romb               ;
CODE_08C069:         with r4            ;
CODE_08C06A:         add   r4           ;
CODE_08C06B:         from r2            ;
CODE_08C06C:         to r6              ;
CODE_08C06D:         swap               ;
CODE_08C06E:         iwt   r0,#AB98     ;
CODE_08C071:         to r14             ;
CODE_08C072:         add   r4           ;
CODE_08C073:         getb               ;
CODE_08C074:         inc   r14          ;
CODE_08C075:         getbh              ;
CODE_08C077:         move  r7,r0        ;
CODE_08C079:         to r5              ;
CODE_08C07A:         fmult              ;
CODE_08C07B:         iwt   r0,#AC18     ;
CODE_08C07E:         to r14             ;
CODE_08C07F:         add   r4           ;
CODE_08C080:         getb               ;
CODE_08C081:         inc   r14          ;
CODE_08C082:         getbh              ;
CODE_08C084:         move  r8,r0        ;
CODE_08C086:         fmult              ;
CODE_08C087:         add   r3           ;
CODE_08C088:         add   r0           ;
CODE_08C089:         iwt   r13,#2200    ;
CODE_08C08C:         add   r13          ;
CODE_08C08D:         to r6              ;
CODE_08C08E:         ldw   (r0)         ;
CODE_08C08F:         iwt   r14,#1800    ;
CODE_08C092:         from r1            ;
CODE_08C093:         swap               ;
CODE_08C094:         to r9              ;
CODE_08C095:         fmult              ;
CODE_08C096:         from r5            ;
CODE_08C097:         swap               ;
CODE_08C098:         to r12             ;
CODE_08C099:         fmult              ;
CODE_08C09A:         sms   (0002),r12   ;
CODE_08C09D:         from r14           ;
CODE_08C09E:         fmult              ;
CODE_08C09F:         add   r0           ;
CODE_08C0A0:         add   r13          ;
CODE_08C0A1:         to r6              ;
CODE_08C0A2:         ldw   (r0)         ;
CODE_08C0A3:         iwt   r0,#2000     ;
CODE_08C0A6:         to r5              ;
CODE_08C0A7:         fmult              ;
CODE_08C0A8:         ibt   r0,#0018     ;
CODE_08C0AA:         add   r2           ;
CODE_08C0AB:         to r6              ;
CODE_08C0AC:         swap               ;
CODE_08C0AD:         from r7            ;
CODE_08C0AE:         fmult              ;
CODE_08C0AF:         move  r4,r0        ;
CODE_08C0B1:         from r8            ;
CODE_08C0B2:         fmult              ;
CODE_08C0B3:         add   r3           ;
CODE_08C0B4:         add   r0           ;
CODE_08C0B5:         add   r13          ;
CODE_08C0B6:         to r6              ;
CODE_08C0B7:         ldw   (r0)         ;
CODE_08C0B8:         from r1            ;
CODE_08C0B9:         swap               ;
CODE_08C0BA:         to r1              ;
CODE_08C0BB:         fmult              ;
CODE_08C0BC:         from r4            ;
CODE_08C0BD:         swap               ;
CODE_08C0BE:         to r2              ;
CODE_08C0BF:         fmult              ;
CODE_08C0C0:         from r14           ;
CODE_08C0C1:         fmult              ;
CODE_08C0C2:         add   r0           ;
CODE_08C0C3:         add   r13          ;
CODE_08C0C4:         to r6              ;
CODE_08C0C5:         ldw   (r0)         ;
CODE_08C0C6:         iwt   r0,#2000     ;
CODE_08C0C9:         fmult              ;
CODE_08C0CA:         to r3              ;
CODE_08C0CB:         sub   r5           ;
CODE_08C0CC:         from r2            ;
CODE_08C0CD:         sub   r12          ;
CODE_08C0CE:         dec   r0           ;
CODE_08C0CF:         move  r7,r0        ;
CODE_08C0D1:         bpl CODE_08C0D6    ;
CODE_08C0D3:         inc   r0           ;
CODE_08C0D4:         not                ;
CODE_08C0D5:         inc   r0           ;
CODE_08C0D6:         add   r0           ;
CODE_08C0D7:         add   r13          ;
CODE_08C0D8:         ldw   (r0)         ;
CODE_08C0D9:         to r6              ;
CODE_08C0DA:         lsr                ;
CODE_08C0DB:         from r3            ;
CODE_08C0DC:         lmult              ;
CODE_08C0DE:         to r3              ;
CODE_08C0DF:         adc   r0           ;
CODE_08C0E1:         ibt   r12,#0000    ;
CODE_08C0E3:         move  r2,r9        ;
CODE_08C0E5:         from r1            ;
CODE_08C0E6:         sub   r9           ;
CODE_08C0E7:         bpl CODE_08C0F0    ;
CODE_08C0E9:         to r12             ;
CODE_08C0EA:         not                ;
CODE_08C0EB:         inc   r12          ;
CODE_08C0EC:         with r12           ;
CODE_08C0ED:         swap               ;
CODE_08C0EE:         move  r2,r1        ;
CODE_08C0F0:         sms   (0000),r2    ;
CODE_08C0F3:         moves r7,r7        ;
CODE_08C0F5:         bmi CODE_08C134    ;
CODE_08C0F7:         lob                ;
CODE_08C0F8:         swap               ;
CODE_08C0F9:         fmult              ;
CODE_08C0FA:         to r13             ;
CODE_08C0FB:         adc   r0           ;
CODE_08C0FD:         iwt   r0,#2000     ;
CODE_08C100:         fmult              ;
CODE_08C101:         to r9              ;
CODE_08C102:         adc   r0           ;
CODE_08C104:         from r10           ;
CODE_08C105:         romb               ;
CODE_08C107:         move  r6,r11       ;
CODE_08C109:         move  r10,r12      ;
CODE_08C10B:         move  r11,r13      ;
CODE_08C10D:         ibt   r2,#0020     ;
CODE_08C10F:         move  r7,r2        ;
CODE_08C111:         iwt   r13,#C120    ;
CODE_08C114:         ibt   r4,#0020     ;
CODE_08C116:         ibt   r8,#0000     ;
CODE_08C118:         merge              ;
CODE_08C119:         bcs CODE_08C134    ;
CODE_08C11B:         from r10           ;
CODE_08C11C:         to r1              ;
CODE_08C11D:         hib                ;
CODE_08C11E:         ibt   r12,#002A    ;
CODE_08C120:         merge              ;
CODE_08C121:         bcs CODE_08C12A    ;
CODE_08C123:         to r14             ;
CODE_08C124:         add   r6           ;
CODE_08C125:         with r8            ;
CODE_08C126:         add   r5           ;
CODE_08C127:         getc               ;
CODE_08C128:         loop               ;
CODE_08C129:         plot               ;
CODE_08C12A:         with r10           ;
CODE_08C12B:         add   r11          ;
CODE_08C12C:         with r5            ;
CODE_08C12D:         add   r3           ;
CODE_08C12E:         with r7            ;
CODE_08C12F:         add   r9           ;
CODE_08C130:         dec   r4           ;
CODE_08C131:         bne CODE_08C116    ;
CODE_08C133:         inc   r2           ;
CODE_08C134:         stop               ;
CODE_08C135:         nop                ;

CODE_08C136:         cache              ;
CODE_08C137:         sub   r0           ;
CODE_08C138:         cmode              ;
CODE_08C13A:         sms   (0000),r11   ;
CODE_08C13D:         sms   (0002),r12   ;
CODE_08C140:         sms   (0004),r8    ;
CODE_08C143:         iwt   r5,#6000     ;
CODE_08C146:         iwt   r6,#0180     ;
CODE_08C149:         iwt   r7,#0040     ;
CODE_08C14C:         iwt   r13,#C154    ;
CODE_08C14F:         ibt   r8,#0008     ;
CODE_08C151:         sub   r0           ;
CODE_08C152:         move  r12,r7       ;
CODE_08C154:         stw   (r5)         ;
CODE_08C155:         inc   r5           ;
CODE_08C156:         loop               ;
CODE_08C157:         inc   r5           ;
CODE_08C158:         with r5            ;
CODE_08C159:         add   r6           ;
CODE_08C15A:         dec   r8           ;
CODE_08C15B:         bne CODE_08C153    ;
CODE_08C15D:         move  r12,r7       ;
CODE_08C15F:         from r9            ;
CODE_08C160:         add   r9           ;
CODE_08C161:         add   r0           ;
CODE_08C162:         iwt   r9,#C1CC     ;
CODE_08C165:         to r9              ;
CODE_08C166:         add   r9           ;
CODE_08C167:         ibt   r4,#0020     ;
CODE_08C169:         iwt   r5,#4800     ;
CODE_08C16C:         ibt   r7,#001F     ;
CODE_08C16E:         iwt   r13,#C1B6    ;
CODE_08C171:         ibt   r0,#0008     ;
CODE_08C173:         romb               ;
CODE_08C175:         move  r14,r9       ;
CODE_08C177:         to r3              ;
CODE_08C178:         getb               ;
CODE_08C179:         inc   r14          ;
CODE_08C17A:         ibt   r12,#0020    ;
CODE_08C17C:         iwt   r6,#2200     ;
CODE_08C17F:         from r5            ;
CODE_08C180:         to r2              ;
CODE_08C181:         hib                ;
CODE_08C182:         with r3            ;
CODE_08C183:         getbh              ;
CODE_08C185:         inc   r14          ;
CODE_08C186:         from r3            ;
CODE_08C187:         add   r3           ;
CODE_08C188:         add   r6           ;
CODE_08C189:         to r6              ;
CODE_08C18A:         ldw   (r0)         ;
CODE_08C18B:         to r8              ;
CODE_08C18C:         getb               ;
CODE_08C18D:         inc   r14          ;
CODE_08C18E:         from r12           ;
CODE_08C18F:         swap               ;
CODE_08C190:         fmult              ;
CODE_08C191:         from r12           ;
CODE_08C192:         sbc   r0           ;
CODE_08C194:         to r1              ;
CODE_08C195:         lsr                ;
CODE_08C196:         with r8            ;
CODE_08C197:         getbh              ;
CODE_08C199:         inc   r14          ;
CODE_08C19A:         move  r9,r14       ;
CODE_08C19C:         lms   r6,(0004)    ;
CODE_08C19F:         from r8            ;
CODE_08C1A0:         fmult              ;
CODE_08C1A1:         adc   r0           ;
CODE_08C1A3:         with r5            ;
CODE_08C1A4:         sub   r0           ;
CODE_08C1A5:         moves r8,r8        ;
CODE_08C1A7:         bpl CODE_08C1AC    ;
CODE_08C1A9:         sub   r0           ;
CODE_08C1AA:         inc   r0           ;
CODE_08C1AB:         inc   r0           ;
CODE_08C1AC:         to r11             ;
CODE_08C1AD:         ldw   (r0)         ;
CODE_08C1AE:         from r10           ;
CODE_08C1AF:         romb               ;
CODE_08C1B1:         sub   r0           ;
CODE_08C1B2:         move  r8,r0        ;
CODE_08C1B4:         with r7            ;
CODE_08C1B5:         swap               ;
CODE_08C1B6:         merge              ;
CODE_08C1B7:         bcs CODE_08C1C2    ;
CODE_08C1B9:         to r14             ;
CODE_08C1BA:         add   r11          ;
CODE_08C1BB:         with r8            ;
CODE_08C1BC:         add   r3           ;
CODE_08C1BD:         from r8            ;
CODE_08C1BE:         hib                ;
CODE_08C1BF:         getc               ;
CODE_08C1C0:         loop               ;
CODE_08C1C1:         plot               ;
CODE_08C1C2:         with r7            ;
CODE_08C1C3:         swap               ;
CODE_08C1C4:         dec   r4           ;
CODE_08C1C5:         bne CODE_08C171    ;
CODE_08C1C7:         dec   r7           ;
CODE_08C1C8:         rpix               ;
CODE_08C1CA:         stop               ;
CODE_08C1CB:         nop                ;

CODE_08C1CC:         add   r5           ;
CODE_08C1CD:         nop                ;
CODE_08C1CE:         hib                ;
CODE_08C1CF:         stop               ;
CODE_08C1D0:         add   r5           ;
CODE_08C1D1:         nop                ;

CODE_08C1D2:         hib                ;
CODE_08C1D3:         stop               ;
CODE_08C1D4:         add   r5           ;
CODE_08C1D5:         nop                ;

CODE_08C1D6:         hib                ;
CODE_08C1D7:         stop               ;
CODE_08C1D8:         add   r5           ;
CODE_08C1D9:         nop                ;

CODE_08C1DA:         hib                ;
CODE_08C1DB:         stop               ;
CODE_08C1DC:         add   r5           ;
CODE_08C1DD:         nop                ;

CODE_08C1DE:         hib                ;
CODE_08C1DF:         stop               ;
CODE_08C1E0:         add   r5           ;
CODE_08C1E1:         nop                ;

CODE_08C1E2:         hib                ;
CODE_08C1E3:         stop               ;
CODE_08C1E4:         add   r5           ;
CODE_08C1E5:         nop                ;

CODE_08C1E6:         hib                ;
CODE_08C1E7:         stop               ;
CODE_08C1E8:         add   r5           ;
CODE_08C1E9:         nop                ;

CODE_08C1EA:         hib                ;
CODE_08C1EB:         stop               ;
CODE_08C1EC:         add   r5           ;
CODE_08C1ED:         nop                ;

CODE_08C1EE:         hib                ;
CODE_08C1EF:         stop               ;
CODE_08C1F0:         add   r5           ;
CODE_08C1F1:         nop                ;

CODE_08C1F2:         hib                ;
CODE_08C1F3:         stop               ;
CODE_08C1F4:         add   r5           ;
CODE_08C1F5:         nop                ;

CODE_08C1F6:         hib                ;
CODE_08C1F7:         stop               ;
CODE_08C1F8:         add   r5           ;
CODE_08C1F9:         nop                ;

CODE_08C1FA:         hib                ;
CODE_08C1FB:         stop               ;
CODE_08C1FC:         add   r5           ;
CODE_08C1FD:         nop                ;

CODE_08C1FE:         hib                ;
CODE_08C1FF:         stop               ;
CODE_08C200:         add   r5           ;
CODE_08C201:         nop                ;

CODE_08C202:         hib                ;
CODE_08C203:         stop               ;
CODE_08C204:         add   r5           ;
CODE_08C205:         nop                ;

CODE_08C206:         hib                ;
CODE_08C207:         stop               ;
CODE_08C208:         add   r5           ;
CODE_08C209:         nop                ;

CODE_08C20A:         hib                ;
CODE_08C20B:         stop               ;
CODE_08C20C:         add   r5           ;
CODE_08C20D:         nop                ;

CODE_08C20E:         hib                ;
CODE_08C20F:         stop               ;
CODE_08C210:         add   r5           ;
CODE_08C211:         nop                ;

CODE_08C212:         hib                ;
CODE_08C213:         stop               ;
CODE_08C214:         add   r5           ;
CODE_08C215:         nop                ;

CODE_08C216:         hib                ;
CODE_08C217:         stop               ;
CODE_08C218:         add   r5           ;
CODE_08C219:         nop                ;

CODE_08C21A:         hib                ;
CODE_08C21B:         stop               ;
CODE_08C21C:         add   r5           ;
CODE_08C21D:         nop                ;

CODE_08C21E:         hib                ;
CODE_08C21F:         stop               ;
CODE_08C220:         add   r5           ;
CODE_08C221:         nop                ;

CODE_08C222:         hib                ;
CODE_08C223:         stop               ;
CODE_08C224:         add   r5           ;
CODE_08C225:         nop                ;

CODE_08C226:         hib                ;
CODE_08C227:         stop               ;
CODE_08C228:         add   r5           ;
CODE_08C229:         nop                ;

CODE_08C22A:         hib                ;
CODE_08C22B:         stop               ;
CODE_08C22C:         add   r5           ;
CODE_08C22D:         nop                ;

CODE_08C22E:         hib                ;
CODE_08C22F:         stop               ;
CODE_08C230:         add   r5           ;

CODE_08C231:         nop                ;
CODE_08C232:         hib                ;
CODE_08C233:         stop               ;
CODE_08C234:         add   r5           ;
CODE_08C235:         nop                ;

CODE_08C236:         hib                ;
CODE_08C237:         stop               ;
CODE_08C238:         add   r5           ;
CODE_08C239:         nop                ;

CODE_08C23A:         hib                ;
CODE_08C23B:         stop               ;
CODE_08C23C:         add   r5           ;
CODE_08C23D:         nop                ;

CODE_08C23E:         hib                ;
CODE_08C23F:         stop               ;
CODE_08C240:         add   r5           ;
CODE_08C241:         nop                ;

CODE_08C242:         hib                ;
CODE_08C243:         stop               ;
CODE_08C244:         add   r5           ;
CODE_08C245:         nop                ;

CODE_08C246:         hib                ;
CODE_08C247:         stop               ;
CODE_08C248:         add   r5           ;
CODE_08C249:         nop                ;

CODE_08C24A:         hib                ;
CODE_08C24B:         stop               ;
CODE_08C24C:         add   r5           ;
CODE_08C24D:         nop                ;

CODE_08C24E:         hib                ;
CODE_08C24F:         stop               ;
CODE_08C250:         add   r5           ;
CODE_08C251:         nop                ;

CODE_08C252:         hib                ;
CODE_08C253:         stop               ;
CODE_08C254:         add   r5           ;
CODE_08C255:         nop                ;

CODE_08C256:         from r14           ;
CODE_08C257:         stop               ;
CODE_08C258:         add   r5           ;
CODE_08C259:         nop                ;

CODE_08C25A:         from r12           ;
CODE_08C25B:         stop               ;
CODE_08C25C:         add   r5           ;
CODE_08C25D:         nop                ;

CODE_08C25E:         from r10           ;
CODE_08C25F:         stop               ;
CODE_08C260:         add   r4           ;
CODE_08C261:         nop                ;

CODE_08C262:         from r6            ;
CODE_08C263:         stop               ;
CODE_08C264:         add   r4           ;
CODE_08C265:         nop                ;

CODE_08C266:         from r2            ;
CODE_08C267:         stop               ;
CODE_08C268:         add   r3           ;
CODE_08C269:         nop                ;

CODE_08C26A:         ibt   r13,#0000    ;
CODE_08C26C:         add   r2           ;
CODE_08C26D:         nop                ;
CODE_08C26E:         ibt   r7,#0000     ;
CODE_08C270:         add   r2           ;
CODE_08C271:         nop                ;
CODE_08C272:         ibt   r0,#0000     ;
CODE_08C274:         add   r1           ;
CODE_08C275:         nop                ;
CODE_08C276:         jmp   r9           ;
CODE_08C277:         stop               ;
CODE_08C278:         add   r0           ;
CODE_08C279:         nop                ;

CODE_08C27A:         link  #01          ;
CODE_08C27B:         stop               ;
CODE_08C27C:         not                ;
CODE_08C27D:         nop                ;

CODE_08C27E:         mult  r8           ;
CODE_08C27F:         stop               ;
CODE_08C280:         color              ;
CODE_08C281:         nop                ;

CODE_08C282:         and   r15          ;
CODE_08C283:         stop               ;
CODE_08C284:         swap               ;
CODE_08C285:         nop                ;

CODE_08C286:         and   r5           ;
CODE_08C287:         stop               ;
CODE_08C288:         plot               ;
CODE_08C289:         nop                ;

CODE_08C28A:         sub   r11          ;
CODE_08C28B:         stop               ;
CODE_08C28C:         ldw   (r11)        ;
CODE_08C28D:         nop                ;

CODE_08C28E:         sub   r0           ;
CODE_08C28F:         stop               ;
CODE_08C290:         ldw   (r9)         ;
CODE_08C291:         nop                ;

CODE_08C292:         add   r4           ;
CODE_08C293:         stop               ;
CODE_08C294:         ldw   (r8)         ;
CODE_08C295:         nop                ;

CODE_08C296:         ldw   (r8)         ;
CODE_08C297:         stop               ;
CODE_08C298:         ldw   (r7)         ;
CODE_08C299:         nop                ;

CODE_08C29A:         loop               ;
CODE_08C29B:         stop               ;
CODE_08C29C:         ldw   (r5)         ;
CODE_08C29D:         nop                ;

CODE_08C29E:         with r15           ;
CODE_08C29F:         stop               ;
CODE_08C2A0:         ldw   (r4)         ;
CODE_08C2A1:         nop                ;

CODE_08C2A2:         with r2            ;
CODE_08C2A3:         stop               ;
CODE_08C2A4:         ldw   (r3)         ;
CODE_08C2A5:         nop                ;

CODE_08C2A6:         to r5              ;
CODE_08C2A7:         stop               ;
CODE_08C2A8:         ldw   (r1)         ;
CODE_08C2A9:         nop                ;

DATA_08C2AA:         db $08, $00, $40, $01, $FB, $FF, $3F, $01
DATA_08C2B2:         db $ED, $FF, $3D, $01, $E0, $FF, $3C, $01
DATA_08C2BA:         db $D2, $FF, $3A, $01, $C4, $FF, $39, $01
DATA_08C2C2:         db $B7, $FF, $38, $01, $AA, $FF, $37, $01
DATA_08C2CA:         db $9D, $FF, $35, $01, $90, $FF, $34, $01
DATA_08C2D2:         db $84, $FF, $33, $01, $78, $FF, $32, $01
DATA_08C2DA:         db $6D, $FF, $31, $01, $63, $FF, $30, $01
DATA_08C2E2:         db $59, $FF, $2F, $01, $50, $FF, $2F, $01
DATA_08C2EA:         db $47, $FF, $2E, $01, $40, $FF, $2D, $01
DATA_08C2F2:         db $39, $FF, $2D, $01, $34, $FF, $2C, $01
DATA_08C2FA:         db $2F, $FF, $2C, $01, $2B, $FF, $2C, $01
DATA_08C302:         db $29, $FF, $2C, $01, $27, $FF, $2C, $01
DATA_08C30A:         db $26, $FF, $2C, $01, $26, $FF, $2C, $01
DATA_08C312:         db $27, $FF, $2C, $01, $28, $FF, $2B, $01
DATA_08C31A:         db $2A, $FF, $2B, $01, $2D, $FF, $2B, $01
DATA_08C322:         db $30, $FF, $2A, $01, $34, $FF, $2A, $01
DATA_08C32A:         db $3A, $FF, $29, $01, $3F, $FF, $28, $01
DATA_08C332:         db $46, $FF, $28, $01, $4D, $FF, $27, $01
DATA_08C33A:         db $55, $FF, $26, $01, $5E, $FF, $25, $01
DATA_08C342:         db $67, $FF, $24, $01, $71, $FF, $23, $01
DATA_08C34A:         db $7C, $FF, $22, $01, $87, $FF, $20, $01
DATA_08C352:         db $92, $FF, $1F, $01, $9F, $FF, $1E, $01
DATA_08C35A:         db $AB, $FF, $1D, $01, $B8, $FF, $1B, $01
DATA_08C362:         db $C6, $FF, $1A, $01, $D4, $FF, $18, $01
DATA_08C36A:         db $E2, $FF, $17, $01, $F0, $FF, $16, $01
DATA_08C372:         db $FF, $FF, $14, $01, $0D, $00, $13, $01
DATA_08C37A:         db $1C, $00, $12, $01, $2B, $00, $10, $01
DATA_08C382:         db $3A, $00, $0F, $01, $48, $00, $0E, $01
DATA_08C38A:         db $57, $00, $0C, $01, $66, $00, $0B, $01
DATA_08C392:         db $74, $00, $0A, $01, $82, $00, $09, $01
DATA_08C39A:         db $8F, $00, $08, $01, $9C, $00, $07, $01
DATA_08C3A2:         db $A9, $00, $06, $01, $B5, $00, $05, $01
DATA_08C3AA:         db $C0, $00, $04, $01, $CA, $00, $03, $01
DATA_08C3B2:         db $D4, $00, $02, $01, $DD, $00, $02, $01
DATA_08C3BA:         db $E5, $00, $01, $01, $EC, $00, $00, $01
DATA_08C3C2:         db $F2, $00, $00, $01, $F7, $00, $00, $01
DATA_08C3CA:         db $FB, $00, $00, $01, $FE, $00, $00, $01

DATA_08C3D2:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C3DA:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C3E2:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C3EA:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C3F2:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C3FA:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C402:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C40A:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C412:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C41A:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C422:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C42A:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C432:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C43A:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C442:         db $00, $01, $00, $01, $00, $01, $00, $01
DATA_08C44A:         db $00, $01, $00, $01, $00, $01

CODE_08C450:         iwt   r4,#3372     ;
CODE_08C453:         ibt   r0,#FFF8     ;
CODE_08C455:         cache              ;
CODE_08C456:         iwt   r12,#00D2    ;
CODE_08C459:         move  r13,r15      ;
CODE_08C45B:         dec   r0           ;
CODE_08C45C:         stw   (r4)         ;
CODE_08C45D:         inc   r4           ;
CODE_08C45E:         loop               ;
CODE_08C45F:         inc   r4           ;
CODE_08C460:         iwt   r4,#3516     ;
CODE_08C463:         sub   r0           ;
CODE_08C464:         stb   (r4)         ;
CODE_08C466:         iwt   r4,#352E     ;
CODE_08C469:         stb   (r4)         ;
CODE_08C46B:         iwt   r4,#3576     ;
CODE_08C46E:         stb   (r4)         ;
CODE_08C470:         with r5            ;
CODE_08C471:         sub   #08          ;
CODE_08C473:         iwt   r0,#0100     ;
CODE_08C476:         iwt   r4,#0200     ;
CODE_08C479:         add   r8           ;
CODE_08C47A:         sub   r4           ;
CODE_08C47B:         bcs CODE_08C4D9    ;
CODE_08C47D:         nop                ;
CODE_08C47E:         ibt   r0,#0008     ;
CODE_08C480:         romb               ;
CODE_08C482:         iwt   r0,#AB98     ;
CODE_08C485:         add   r3           ;
CODE_08C486:         to r14             ;
CODE_08C487:         add   r3           ;
CODE_08C488:         getb               ;
CODE_08C489:         inc   r14          ;
CODE_08C48A:         getbh              ;
CODE_08C48C:         moves r6,r0        ;
CODE_08C48E:         bpl CODE_08C494    ;
CODE_08C490:         not                ;
CODE_08C491:         inc   r0           ;
CODE_08C492:         move  r6,r0        ;
CODE_08C494:         from r1            ;
CODE_08C495:         lmult              ;
CODE_08C497:         move  r1,r4        ;
CODE_08C499:         iwt   r0,#AC18     ;
CODE_08C49C:         move  r11,r0       ;
CODE_08C49E:         add   r3           ;
CODE_08C49F:         to r14             ;
CODE_08C4A0:         add   r3           ;
CODE_08C4A1:         getb               ;
CODE_08C4A2:         inc   r14          ;
CODE_08C4A3:         getbh              ;
CODE_08C4A5:         moves r6,r0        ;
CODE_08C4A7:         bpl CODE_08C4AD    ;
CODE_08C4A9:         not                ;
CODE_08C4AA:         inc   r0           ;
CODE_08C4AB:         move  r6,r0        ;
CODE_08C4AD:         from r2            ;
CODE_08C4AE:         lmult              ;
CODE_08C4B0:         from r4            ;
CODE_08C4B1:         add   r1           ;
CODE_08C4B2:         swap               ;
CODE_08C4B3:         bpl CODE_08C4B7    ;
CODE_08C4B5:         lob                ;
CODE_08C4B6:         inc   r0           ;
CODE_08C4B7:         to r1              ;
CODE_08C4B8:         sub   #08          ;
CODE_08C4BA:         iwt   r0,#0040     ;
CODE_08C4BD:         and   r3           ;
CODE_08C4BE:         add   r0           ;
CODE_08C4BF:         to r2              ;
CODE_08C4C0:         add   r0           ;
CODE_08C4C1:         move  r12,r7       ;
CODE_08C4C3:         moves r0,r5        ;
CODE_08C4C5:         bpl CODE_08C4D1    ;
CODE_08C4C7:         cache              ;
CODE_08C4C8:         to r12             ;
CODE_08C4C9:         add   r12          ;
CODE_08C4CA:         dec   r12          ;
CODE_08C4CB:         bmi CODE_08C4D9    ;
CODE_08C4CD:         inc   r12          ;
CODE_08C4CE:         bra CODE_08C4E2    ;

CODE_08C4D0:         sub   r0           ;

CODE_08C4D1:         iwt   r6,#00D2     ;
CODE_08C4D4:         to r6              ;
CODE_08C4D5:         sub   r6           ;
CODE_08C4D6:         bcc CODE_08C4DB    ;
CODE_08C4D8:         with r6            ;
CODE_08C4D9:         stop               ;
CODE_08C4DA:         nop                ;
CODE_08C4DB:         add   r12          ;
CODE_08C4DC:         dec   r6           ;
CODE_08C4DD:         bmi CODE_08C4E2    ;
CODE_08C4DF:         inc   r6           ;
CODE_08C4E0:         with r12           ;
CODE_08C4E1:         sub   r6           ;
CODE_08C4E2:         move  r4,r0        ;
CODE_08C4E4:         add   r0           ;
CODE_08C4E5:         iwt   r6,#3372     ;
CODE_08C4E8:         to r6              ;
CODE_08C4E9:         add   r6           ;
CODE_08C4EA:         from r2            ;
CODE_08C4EB:         sub   r4           ;
CODE_08C4EC:         add   r1           ;
CODE_08C4ED:         with r4            ;
CODE_08C4EE:         add   r12          ;
CODE_08C4EF:         move  r13,r15      ;
CODE_08C4F1:         stw   (r6)         ;
CODE_08C4F2:         inc   r6           ;
CODE_08C4F3:         inc   r6           ;
CODE_08C4F4:         loop               ;
CODE_08C4F5:         dec   r0           ;
CODE_08C4F6:         iwt   r6,#3516     ;
CODE_08C4F9:         ibt   r1,#0000     ;
CODE_08C4FB:         ldb   (r6)         ;
CODE_08C4FD:         moves r9,r0        ;
CODE_08C4FF:         beq CODE_08C50D    ;
CODE_08C501:         add   r1           ;
CODE_08C502:         sub   r4           ;
CODE_08C503:         bcs CODE_08C50D    ;
CODE_08C505:         add   r4           ;
CODE_08C506:         move  r1,r0        ;
CODE_08C508:         inc   r6           ;
CODE_08C509:         inc   r6           ;
CODE_08C50A:         bra CODE_08C4FB    ;

CODE_08C50C:         inc   r6           ;

CODE_08C50D:         iwt   r10,#3527    ;
CODE_08C510:         with r4            ;
CODE_08C511:         sub   r1           ;
CODE_08C512:         from r4            ;
CODE_08C513:         sub   r9           ;
CODE_08C514:         bne CODE_08C524    ;
CODE_08C516:         from r6            ;
CODE_08C517:         to r9              ;
CODE_08C518:         add   #03          ;
CODE_08C51A:         ldb   (r9)         ;
CODE_08C51C:         add   r4           ;
CODE_08C51D:         stb   (r9)         ;
CODE_08C51F:         inc   r10          ;
CODE_08C520:         inc   r10          ;
CODE_08C521:         bra CODE_08C538    ;

CODE_08C523:         inc   r10          ;

CODE_08C524:         moves r1,r1        ;
CODE_08C526:         beq CODE_08C538    ;
CODE_08C528:         from r4            ;
CODE_08C529:         sub   r9           ;
CODE_08C52A:         bcs CODE_08C538    ;
CODE_08C52C:         from r6            ;
CODE_08C52D:         to r9              ;
CODE_08C52E:         sub   #02          ;
CODE_08C530:         move  r0,r8        ;
CODE_08C532:         stb   (r9)         ;
CODE_08C534:         inc   r9           ;
CODE_08C535:         swap               ;
CODE_08C536:         stb   (r9)         ;
CODE_08C538:         ibt   r9,#007F     ;
CODE_08C53A:         from r9            ;
CODE_08C53B:         to r2              ;
CODE_08C53C:         sub   r4           ;
CODE_08C53D:         bpl CODE_08C548    ;
CODE_08C53F:         sub   r0           ;
CODE_08C540:         move  r4,r9        ;
CODE_08C542:         from r2            ;
CODE_08C543:         not                ;
CODE_08C544:         inc   r0           ;
CODE_08C545:         dec   r10          ;
CODE_08C546:         dec   r10          ;
CODE_08C547:         dec   r10          ;
CODE_08C548:         move  r2,r0        ;
CODE_08C54A:         iwt   r9,#352A     ;
CODE_08C54D:         to r12             ;
CODE_08C54E:         from r10           ;
CODE_08C54F:         sub   r6           ;
CODE_08C550:         inc   r12          ;
CODE_08C551:         move  r13,r15      ;
CODE_08C553:         ldb   (r10)        ;
CODE_08C555:         stb   (r9)         ;
CODE_08C557:         dec   r10          ;
CODE_08C558:         loop               ;
CODE_08C559:         dec   r9           ;
CODE_08C55A:         from r4            ;
CODE_08C55B:         stb   (r6)         ;
CODE_08C55D:         inc   r6           ;
CODE_08C55E:         move  r0,r8        ;
CODE_08C560:         stb   (r6)         ;
CODE_08C562:         inc   r6           ;
CODE_08C563:         swap               ;
CODE_08C564:         stb   (r6)         ;
CODE_08C566:         moves r0,r2        ;
CODE_08C568:         beq CODE_08C579    ;
CODE_08C56A:         inc   r6           ;
CODE_08C56B:         stb   (r6)         ;
CODE_08C56D:         move  r4,r0        ;
CODE_08C56F:         inc   r6           ;
CODE_08C570:         move  r0,r8        ;
CODE_08C572:         stb   (r6)         ;
CODE_08C574:         inc   r6           ;
CODE_08C575:         swap               ;
CODE_08C576:         stb   (r6)         ;
CODE_08C578:         inc   r6           ;
CODE_08C579:         ldb   (r6)         ;
CODE_08C57B:         sub   #00          ;
CODE_08C57D:         beq CODE_08C582    ;
CODE_08C57F:         sub   r4           ;
CODE_08C580:         stb   (r6)         ;
CODE_08C582:         sms   (0020),r5    ;
CODE_08C585:         sms   (0022),r7    ;
CODE_08C588:         iwt   r9,#404A     ;
CODE_08C58B:         ibt   r7,#007F     ;
CODE_08C58D:         ibt   r8,#0060     ;
CODE_08C58F:         iwt   r5,#00FF     ;
CODE_08C592:         ibt   r10,#0020    ;
CODE_08C594:         from r10           ;
CODE_08C595:         add   r3           ;
CODE_08C596:         ibt   r1,#0000     ;
CODE_08C598:         ibt   r2,#0002     ;
CODE_08C59A:         move  r3,r0        ;
CODE_08C59C:         and   r7           ;
CODE_08C59D:         sub   r8           ;
CODE_08C59E:         bcs CODE_08C5BE    ;
CODE_08C5A0:         sub   r0           ;
CODE_08C5A1:         from r3            ;
CODE_08C5A2:         lob                ;
CODE_08C5A3:         add   r0           ;
CODE_08C5A4:         to r14             ;
CODE_08C5A5:         add   r11          ;
CODE_08C5A6:         getb               ;
CODE_08C5A7:         inc   r14          ;
CODE_08C5A8:         iwt   r6,#00B0     ;
CODE_08C5AB:         getbh              ;
CODE_08C5AD:         dec   r0           ;
CODE_08C5AE:         bpl CODE_08C5B3    ;
CODE_08C5B0:         inc   r0           ;
CODE_08C5B1:         not                ;
CODE_08C5B2:         inc   r0           ;
CODE_08C5B3:         sub   r5           ;
CODE_08C5B4:         bcc CODE_08C5BA    ;
CODE_08C5B6:         add   r5           ;
CODE_08C5B7:         iwt   r6,#00E0     ;
CODE_08C5BA:         lmult              ;
CODE_08C5BC:         from r4            ;
CODE_08C5BD:         hib                ;
CODE_08C5BE:         to r6              ;
CODE_08C5BF:         add   r10          ;
CODE_08C5C0:         ibt   r12,#0003    ;
CODE_08C5C2:         move  r13,r15      ;
CODE_08C5C4:         ldb   (r9)         ;
CODE_08C5C6:         swap               ;
CODE_08C5C7:         fmult              ;
CODE_08C5C8:         adc   #00          ;
CODE_08C5CA:         add   r0           ;
CODE_08C5CB:         add   r0           ;
CODE_08C5CC:         add   r0           ;
CODE_08C5CD:         add   r0           ;
CODE_08C5CE:         to r4              ;
CODE_08C5CF:         add   r0           ;
CODE_08C5D0:         inc   r9           ;
CODE_08C5D1:         ldb   (r9)         ;
CODE_08C5D3:         swap               ;
CODE_08C5D4:         fmult              ;
CODE_08C5D5:         adc   r4           ;
CODE_08C5D7:         add   r0           ;
CODE_08C5D8:         add   r0           ;
CODE_08C5D9:         add   r0           ;
CODE_08C5DA:         add   r0           ;
CODE_08C5DB:         to r4              ;
CODE_08C5DC:         add   r0           ;
CODE_08C5DD:         inc   r9           ;
CODE_08C5DE:         ldb   (r9)         ;
CODE_08C5E0:         swap               ;
CODE_08C5E1:         fmult              ;
CODE_08C5E2:         adc   r4           ;
CODE_08C5E4:         stw   (r1)         ;
CODE_08C5E5:         with r1            ;
CODE_08C5E6:         add   #04          ;
CODE_08C5E8:         loop               ;
CODE_08C5E9:         inc   r9           ;
CODE_08C5EA:         with r1            ;
CODE_08C5EB:         sub   #0A          ;
CODE_08C5ED:         ibt   r0,#0040     ;
CODE_08C5EF:         add   r3           ;
CODE_08C5F0:         dec   r2           ;
CODE_08C5F1:         bne CODE_08C59A    ;
CODE_08C5F3:         nop                ;
CODE_08C5F4:         lms   r5,(0020)    ;
CODE_08C5F7:         lms   r7,(0022)    ;
CODE_08C5FA:         from r7            ;
CODE_08C5FB:         lsr                ;
CODE_08C5FC:         lsr                ;
CODE_08C5FD:         lsr                ;
CODE_08C5FE:         to r8              ;
CODE_08C5FF:         lsr                ;
CODE_08C600:         iwt   r3,#00D1     ;
CODE_08C603:         ibt   r4,#0010     ;
CODE_08C605:         ibt   r11,#0000    ;
CODE_08C607:         with r5            ;
CODE_08C608:         add   r4           ;
CODE_08C609:         dec   r5           ;
CODE_08C60A:         bpl CODE_08C612    ;
CODE_08C60C:         inc   r5           ;
CODE_08C60D:         inc   r11          ;
CODE_08C60E:         iwt   r15,#C6F7    ;
CODE_08C611:         inc   r11          ;
CODE_08C612:         from r3            ;
CODE_08C613:         sub   r5           ;
CODE_08C614:         bpl CODE_08C61C    ;
CODE_08C616:         add   r4           ;
CODE_08C617:         bpl CODE_08C61C    ;
CODE_08C619:         nop                ;
CODE_08C61A:         stop               ;
CODE_08C61B:         nop                ;

CODE_08C61C:         iwt   r6,#352E     ;
CODE_08C61F:         ibt   r1,#0000     ;
CODE_08C621:         ldb   (r6)         ;
CODE_08C623:         moves r9,r0        ;
CODE_08C625:         beq CODE_08C633    ;
CODE_08C627:         add   r1           ;
CODE_08C628:         sub   r5           ;
CODE_08C629:         bcs CODE_08C633    ;
CODE_08C62B:         add   r5           ;
CODE_08C62C:         move  r1,r0        ;
CODE_08C62E:         inc   r6           ;
CODE_08C62F:         inc   r6           ;
CODE_08C630:         bra CODE_08C621    ;

CODE_08C632:         inc   r6           ;

CODE_08C633:         iwt   r12,#3569    ;
CODE_08C636:         from r5            ;
CODE_08C637:         to r7              ;
CODE_08C638:         sub   r1           ;
CODE_08C639:         from r7            ;
CODE_08C63A:         sub   r9           ;
CODE_08C63B:         bne CODE_08C64B    ;
CODE_08C63D:         from r6            ;
CODE_08C63E:         to r9              ;
CODE_08C63F:         add   #03          ;
CODE_08C641:         ldb   (r9)         ;
CODE_08C643:         add   r7           ;
CODE_08C644:         stb   (r9)         ;
CODE_08C646:         inc   r12          ;
CODE_08C647:         inc   r12          ;
CODE_08C648:         bra CODE_08C66C    ;

CODE_08C64A:         inc   r12          ;

CODE_08C64B:         moves r1,r1        ;
CODE_08C64D:         beq CODE_08C66C    ;
CODE_08C64F:         from r7            ;
CODE_08C650:         sub   r4           ;
CODE_08C651:         bcs CODE_08C66C    ;
CODE_08C653:         from r6            ;
CODE_08C654:         to r10             ;
CODE_08C655:         sub   #02          ;
CODE_08C657:         ibt   r0,#0048     ;
CODE_08C659:         to r9              ;
CODE_08C65A:         add   r10          ;
CODE_08C65B:         ldw   (r11)        ;
CODE_08C65C:         stb   (r10)        ;
CODE_08C65E:         inc   r10          ;
CODE_08C65F:         swap               ;
CODE_08C660:         stb   (r10)        ;
CODE_08C662:         from r11           ;
CODE_08C663:         add   #02          ;
CODE_08C665:         ldw   (r0)         ;
CODE_08C666:         stb   (r9)         ;
CODE_08C668:         inc   r9           ;
CODE_08C669:         swap               ;
CODE_08C66A:         stb   (r9)         ;
CODE_08C66C:         move  r10,r12      ;
CODE_08C66E:         ibt   r9,#007F     ;
CODE_08C670:         from r9            ;
CODE_08C671:         to r2              ;
CODE_08C672:         sub   r7           ;
CODE_08C673:         bpl CODE_08C67E    ;
CODE_08C675:         sub   r0           ;
CODE_08C676:         move  r7,r9        ;
CODE_08C678:         from r2            ;
CODE_08C679:         not                ;
CODE_08C67A:         inc   r0           ;
CODE_08C67B:         dec   r10          ;
CODE_08C67C:         dec   r10          ;
CODE_08C67D:         dec   r10          ;
CODE_08C67E:         move  r2,r0        ;
CODE_08C680:         sms   (0046),r3    ;
CODE_08C683:         sms   (004A),r5    ;
CODE_08C686:         sms   (0050),r8    ;
CODE_08C689:         iwt   r9,#356C     ;
CODE_08C68C:         ibt   r0,#0048     ;
CODE_08C68E:         to r5              ;
CODE_08C68F:         add   r6           ;
CODE_08C690:         to r3              ;
CODE_08C691:         add   r9           ;
CODE_08C692:         to r8              ;
CODE_08C693:         add   r10          ;
CODE_08C694:         from r10           ;
CODE_08C695:         to r12             ;
CODE_08C696:         sub   r6           ;
CODE_08C697:         inc   r12          ;
CODE_08C698:         move  r13,r15      ;
CODE_08C69A:         ldb   (r10)        ;
CODE_08C69C:         stb   (r9)         ;
CODE_08C69E:         ldb   (r8)         ;
CODE_08C6A0:         stb   (r3)         ;
CODE_08C6A2:         dec   r10          ;
CODE_08C6A3:         dec   r9           ;
CODE_08C6A4:         dec   r8           ;
CODE_08C6A5:         loop               ;
CODE_08C6A6:         dec   r3           ;
CODE_08C6A7:         move  r0,r7        ;
CODE_08C6A9:         stb   (r6)         ;
CODE_08C6AB:         stb   (r5)         ;
CODE_08C6AD:         inc   r6           ;
CODE_08C6AE:         inc   r5           ;
CODE_08C6AF:         ldw   (r11)        ;
CODE_08C6B0:         move  r9,r0        ;
CODE_08C6B2:         stb   (r6)         ;
CODE_08C6B4:         inc   r6           ;
CODE_08C6B5:         swap               ;
CODE_08C6B6:         stb   (r6)         ;
CODE_08C6B8:         inc   r11          ;
CODE_08C6B9:         inc   r11          ;
CODE_08C6BA:         ldw   (r11)        ;
CODE_08C6BB:         move  r10,r0       ;
CODE_08C6BD:         stb   (r5)         ;
CODE_08C6BF:         inc   r5           ;
CODE_08C6C0:         swap               ;
CODE_08C6C1:         stb   (r5)         ;
CODE_08C6C3:         inc   r6           ;
CODE_08C6C4:         moves r0,r2        ;
CODE_08C6C6:         beq CODE_08C6E3    ;
CODE_08C6C8:         inc   r5           ;
CODE_08C6C9:         stb   (r6)         ;
CODE_08C6CB:         stb   (r5)         ;
CODE_08C6CD:         move  r7,r0        ;
CODE_08C6CF:         inc   r6           ;
CODE_08C6D0:         inc   r5           ;
CODE_08C6D1:         move  r0,r9        ;
CODE_08C6D3:         stb   (r6)         ;
CODE_08C6D5:         inc   r6           ;
CODE_08C6D6:         swap               ;
CODE_08C6D7:         stb   (r6)         ;
CODE_08C6D9:         move  r0,r10       ;
CODE_08C6DB:         stb   (r5)         ;
CODE_08C6DD:         inc   r5           ;
CODE_08C6DE:         swap               ;
CODE_08C6DF:         stb   (r5)         ;
CODE_08C6E1:         inc   r6           ;
CODE_08C6E2:         inc   r5           ;
CODE_08C6E3:         ldb   (r6)         ;
CODE_08C6E5:         sub   #00          ;
CODE_08C6E7:         beq CODE_08C6EE    ;
CODE_08C6E9:         sub   r7           ;
CODE_08C6EA:         stb   (r6)         ;
CODE_08C6EC:         stb   (r5)         ;
CODE_08C6EE:         lms   r3,(0046)    ;
CODE_08C6F1:         lms   r5,(004A)    ;
CODE_08C6F4:         lms   r8,(0050)    ;
CODE_08C6F7:         dec   r8           ;
CODE_08C6F8:         beq CODE_08C6FF    ;
CODE_08C6FA:         inc   r11          ;
CODE_08C6FB:         iwt   r15,#C607    ;
CODE_08C6FE:         inc   r11          ;
CODE_08C6FF:         stop               ;
CODE_08C700:         nop                ;
CODE_08C701:         iwt   r1,#2800     ;
CODE_08C704:         ibt   r0,#0000     ;
CODE_08C706:         iwt   r12,#2300    ;
CODE_08C709:         cache              ;
CODE_08C70A:         move  r13,r15      ;
CODE_08C70C:         stw   (r1)         ;
CODE_08C70D:         inc   r1           ;
CODE_08C70E:         loop               ;
CODE_08C70F:         inc   r1           ;
CODE_08C710:         stop               ;
CODE_08C711:         nop                ;

CODE_08C712:         romb               ;
CODE_08C714:         move  r14,r14      ;
CODE_08C716:         iwt   r8,#0260     ;
CODE_08C719:         ibt   r9,#0010     ;
CODE_08C71B:         iwt   r10,#6E00    ;
CODE_08C71E:         iwt   r13,#C732    ;
CODE_08C721:         cache              ;
CODE_08C722:         getb               ;
CODE_08C723:         inc   r14          ;
CODE_08C724:         move  r1,r0        ;
CODE_08C726:         lsr                ;
CODE_08C727:         bcs CODE_08C743    ;
CODE_08C729:         with r1            ;
CODE_08C72A:         getbh              ;
CODE_08C72C:         inc   r14          ;
CODE_08C72D:         to r2              ;
CODE_08C72E:         getb               ;
CODE_08C72F:         inc   r14          ;
CODE_08C730:         move  r12,r9       ;
CODE_08C732:         ldw   (r1)         ;
CODE_08C733:         stw   (r10)        ;
CODE_08C734:         inc   r1           ;
CODE_08C735:         inc   r1           ;
CODE_08C736:         inc   r10          ;
CODE_08C737:         loop               ;
CODE_08C738:         inc   r10          ;
CODE_08C739:         with r1            ;
CODE_08C73A:         add   r8           ;
CODE_08C73B:         dec   r2           ;
CODE_08C73C:         bne CODE_08C731    ;
CODE_08C73E:         move  r12,r9       ;
CODE_08C740:         bra CODE_08C723    ;

CODE_08C742:         getb               ;

CODE_08C743:         stop               ;
CODE_08C744:         nop                ;
CODE_08C745:         ibt   r0,#0008     ;
CODE_08C747:         romb               ;
CODE_08C749:         lm    r0,(0CA0)    ;
CODE_08C74D:         to r11             ;
CODE_08C74E:         add   r0           ;
CODE_08C74F:         iwt   r0,#AB98     ;
CODE_08C752:         to r14             ;
CODE_08C753:         add   r11          ;
CODE_08C754:         getb               ;
CODE_08C755:         inc   r14          ;
CODE_08C756:         iwt   r6,#00E8     ;
CODE_08C759:         getbh              ;
CODE_08C75B:         lmult              ;
CODE_08C75D:         lob                ;
CODE_08C75E:         swap               ;
CODE_08C75F:         with r4            ;
CODE_08C760:         hib                ;
CODE_08C761:         to r1              ;
CODE_08C762:         or    r4           ;
CODE_08C763:         iwt   r0,#AC18     ;
CODE_08C766:         to r14             ;
CODE_08C767:         add   r11          ;
CODE_08C768:         getb               ;
CODE_08C769:         inc   r14          ;
CODE_08C76A:         getbh              ;
CODE_08C76C:         lmult              ;
CODE_08C76E:         lob                ;
CODE_08C76F:         swap               ;
CODE_08C770:         with r4            ;
CODE_08C771:         hib                ;
CODE_08C772:         to r2              ;
CODE_08C773:         or    r4           ;
CODE_08C774:         ibt   r0,#0008     ;
CODE_08C776:         romb               ;
CODE_08C778:         iwt   r14,#D011    ;
CODE_08C77B:         iwt   r7,#0CA8     ;
CODE_08C77E:         iwt   r8,#0E66     ;
CODE_08C781:         ibt   r9,#0006     ;
CODE_08C783:         iwt   r11,#0300    ;
CODE_08C786:         ibt   r12,#0070    ;
CODE_08C788:         cache              ;
CODE_08C789:         move  r13,r15      ;
CODE_08C78B:         getb               ;
CODE_08C78C:         inc   r14          ;
CODE_08C78D:         inc   r7           ;
CODE_08C78E:         inc   r7           ;
CODE_08C78F:         with r8            ;
CODE_08C790:         add   r9           ;
CODE_08C791:         move  r6,r1        ;
CODE_08C793:         getbh              ;
CODE_08C795:         inc   r14          ;
CODE_08C796:         move  r5,r0        ;
CODE_08C798:         lmult              ;
CODE_08C79A:         lob                ;
CODE_08C79B:         swap               ;
CODE_08C79C:         with r4            ;
CODE_08C79D:         hib                ;
CODE_08C79E:         or    r4           ;
CODE_08C79F:         stw   (r7)         ;
CODE_08C7A0:         inc   r7           ;
CODE_08C7A1:         inc   r7           ;
CODE_08C7A2:         move  r6,r11       ;
CODE_08C7A4:         lmult              ;
CODE_08C7A6:         lob                ;
CODE_08C7A7:         swap               ;
CODE_08C7A8:         with r4            ;
CODE_08C7A9:         hib                ;
CODE_08C7AA:         or    r4           ;
CODE_08C7AB:         stw   (r8)         ;
CODE_08C7AC:         move  r0,r5        ;
CODE_08C7AE:         move  r6,r2        ;
CODE_08C7B0:         lmult              ;
CODE_08C7B2:         lob                ;
CODE_08C7B3:         swap               ;
CODE_08C7B4:         with r4            ;
CODE_08C7B5:         hib                ;
CODE_08C7B6:         or    r4           ;
CODE_08C7B7:         move  r6,r0        ;
CODE_08C7B9:         not                ;
CODE_08C7BA:         inc   r0           ;
CODE_08C7BB:         dec   r8           ;
CODE_08C7BC:         dec   r8           ;
CODE_08C7BD:         stw   (r8)         ;
CODE_08C7BE:         from r11           ;
CODE_08C7BF:         lmult              ;
CODE_08C7C1:         lob                ;
CODE_08C7C2:         swap               ;
CODE_08C7C3:         with r4            ;
CODE_08C7C4:         hib                ;
CODE_08C7C5:         or    r4           ;
CODE_08C7C6:         loop               ;
CODE_08C7C7:         stw   (r7)         ;
CODE_08C7C8:         stop               ;
CODE_08C7C9:         nop                ;

CODE_08C7CA:         ibt   r0,#0008     ;
CODE_08C7CC:         romb               ;
CODE_08C7CE:         lm    r0,(0CA0)    ;
CODE_08C7D2:         to r11             ;
CODE_08C7D3:         add   r0           ;
CODE_08C7D4:         iwt   r0,#AB98     ;
CODE_08C7D7:         to r14             ;
CODE_08C7D8:         add   r11          ;
CODE_08C7D9:         getb               ;
CODE_08C7DA:         inc   r14          ;
CODE_08C7DB:         getbh              ;
CODE_08C7DD:         move  r1,r0        ;
CODE_08C7DF:         iwt   r0,#AC18     ;
CODE_08C7E2:         to r14             ;
CODE_08C7E3:         add   r11          ;
CODE_08C7E4:         getb               ;
CODE_08C7E5:         inc   r14          ;
CODE_08C7E6:         getbh              ;
CODE_08C7E8:         move  r2,r0        ;
CODE_08C7EA:         ibt   r0,#0008     ;
CODE_08C7EC:         romb               ;
CODE_08C7EE:         iwt   r9,#102D     ;
CODE_08C7F1:         iwt   r10,#1284    ;
CODE_08C7F4:         iwt   r11,#14DC    ;
CODE_08C7F7:         lm    r12,(102A)   ;
CODE_08C7FB:         cache              ;
CODE_08C7FC:         move  r13,r15      ;
CODE_08C7FE:         move  r6,r1        ;
CODE_08C800:         ldb   (r9)         ;
CODE_08C802:         sex                ;
CODE_08C803:         inc   r9           ;
CODE_08C804:         move  r5,r0        ;
CODE_08C806:         lmult              ;
CODE_08C808:         move  r7,r4        ;
CODE_08C80A:         ldb   (r9)         ;
CODE_08C80C:         sex                ;
CODE_08C80D:         move  r3,r0        ;
CODE_08C80F:         lmult              ;
CODE_08C811:         move  r8,r4        ;
CODE_08C813:         move  r6,r2        ;
CODE_08C815:         from r3            ;
CODE_08C816:         lmult              ;
CODE_08C818:         from r4            ;
CODE_08C819:         add   r7           ;
CODE_08C81A:         iwt   r14,#0080    ;
CODE_08C81D:         add   r14          ;
CODE_08C81E:         swap               ;
CODE_08C81F:         to r3              ;
CODE_08C820:         sex                ;
CODE_08C821:         from r5            ;
CODE_08C822:         lmult              ;
CODE_08C824:         from r8            ;
CODE_08C825:         sub   r4           ;
CODE_08C826:         add   r14          ;
CODE_08C827:         swap               ;
CODE_08C828:         sex                ;
CODE_08C829:         iwt   r5,#0080     ;
CODE_08C82C:         add   r5           ;
CODE_08C82D:         stb   (r11)        ;
CODE_08C82F:         add   r0           ;
CODE_08C830:         iwt   r14,#D0F1    ;
CODE_08C833:         to r14             ;
CODE_08C834:         add   r14          ;
CODE_08C835:         inc   r9           ;
CODE_08C836:         ldb   (r9)         ;
CODE_08C838:         to r7              ;
CODE_08C839:         sex                ;
CODE_08C83A:         bpl CODE_08C841    ;
CODE_08C83C:         inc   r9           ;
CODE_08C83D:         from r7            ;
CODE_08C83E:         stb   (r11)        ;
CODE_08C840:         inc   r7           ;
CODE_08C841:         inc   r9           ;
CODE_08C842:         to r6              ;
CODE_08C843:         getb               ;
CODE_08C844:         inc   r14          ;
CODE_08C845:         lm    r0,(102A)    ;
CODE_08C849:         sub   r12          ;
CODE_08C84A:         inc   r11          ;
CODE_08C84B:         stb   (r11)        ;
CODE_08C84D:         inc   r11          ;
CODE_08C84E:         with r6            ;
CODE_08C84F:         getbh              ;
CODE_08C851:         from r3            ;
CODE_08C852:         lob                ;
CODE_08C853:         swap               ;
CODE_08C854:         fmult              ;
CODE_08C855:         ibt   r4,#0020     ;
CODE_08C857:         add   r4           ;
CODE_08C858:         add   r0           ;
CODE_08C859:         add   r0           ;
CODE_08C85A:         swap               ;
CODE_08C85B:         sex                ;
CODE_08C85C:         ibt   r4,#0070     ;
CODE_08C85E:         add   r4           ;
CODE_08C85F:         stb   (r10)        ;
CODE_08C861:         inc   r10          ;
CODE_08C862:         iwt   r0,#01B9     ;
CODE_08C865:         add   r0           ;
CODE_08C866:         add   r0           ;
CODE_08C867:         fmult              ;
CODE_08C868:         iwt   r4,#FEC0     ;
CODE_08C86B:         adc   r4           ;
CODE_08C86D:         sub   r7           ;
CODE_08C86E:         stb   (r10)        ;
CODE_08C870:         inc   r10          ;
CODE_08C871:         inc   r10          ;
CODE_08C872:         loop               ;
CODE_08C873:         inc   r10          ;
CODE_08C874:         iwt   r11,#1608    ;
CODE_08C877:         move  r12,r11      ;
CODE_08C879:         iwt   r1,#14DC     ;
CODE_08C87C:         lm    r0,(102A)    ;
CODE_08C880:         dec   r0           ;
CODE_08C881:         add   r0           ;
CODE_08C882:         to r2              ;
CODE_08C883:         add   r1           ;
CODE_08C884:         ldb   (r1)         ;
CODE_08C886:         dec   r0           ;
CODE_08C887:         sbk                ;
CODE_08C888:         move  r3,r1        ;
CODE_08C88A:         move  r4,r2        ;
CODE_08C88C:         from r1            ;
CODE_08C88D:         add   r2           ;
CODE_08C88E:         lsr                ;
CODE_08C88F:         lsr                ;
CODE_08C890:         add   r0           ;
CODE_08C891:         to r5              ;
CODE_08C892:         ldb   (r0)         ;
CODE_08C894:         to r7              ;
CODE_08C895:         ldb   (r3)         ;
CODE_08C897:         from r5            ;
CODE_08C898:         sub   r7           ;
CODE_08C899:         bcs CODE_08C8A5    ;
CODE_08C89B:         inc   r3           ;
CODE_08C89C:         inc   r3           ;
CODE_08C89D:         to r7              ;
CODE_08C89E:         ldb   (r3)         ;
CODE_08C8A0:         from r5            ;
CODE_08C8A1:         sub   r7           ;
CODE_08C8A2:         bcc CODE_08C89C    ;
CODE_08C8A4:         inc   r3           ;
CODE_08C8A5:         dec   r3           ;
CODE_08C8A6:         ldb   (r4)         ;
CODE_08C8A8:         sub   r5           ;
CODE_08C8A9:         bcs CODE_08C8B4    ;
CODE_08C8AB:         add   r5           ;
CODE_08C8AC:         dec   r4           ;
CODE_08C8AD:         dec   r4           ;
CODE_08C8AE:         ldb   (r4)         ;
CODE_08C8B0:         sub   r5           ;
CODE_08C8B1:         bcc CODE_08C8AC    ;
CODE_08C8B3:         add   r5           ;
CODE_08C8B4:         move  r6,r0        ;
CODE_08C8B6:         from r4            ;
CODE_08C8B7:         sub   r3           ;
CODE_08C8B8:         bcc CODE_08C8D4    ;
CODE_08C8BA:         from r7            ;
CODE_08C8BB:         stb   (r4)         ;
CODE_08C8BD:         from r6            ;
CODE_08C8BE:         stb   (r3)         ;
CODE_08C8C0:         inc   r3           ;
CODE_08C8C1:         inc   r4           ;
CODE_08C8C2:         to r8              ;
CODE_08C8C3:         ldb   (r4)         ;
CODE_08C8C5:         ldb   (r3)         ;
CODE_08C8C7:         stb   (r4)         ;
CODE_08C8C9:         from r8            ;
CODE_08C8CA:         stb   (r3)         ;
CODE_08C8CC:         inc   r3           ;
CODE_08C8CD:         dec   r4           ;
CODE_08C8CE:         dec   r4           ;
CODE_08C8CF:         dec   r4           ;
CODE_08C8D0:         from r4            ;
CODE_08C8D1:         sub   r3           ;
CODE_08C8D2:         bcs CODE_08C894    ;
CODE_08C8D4:         from r1            ;
CODE_08C8D5:         sub   r4           ;
CODE_08C8D6:         bcs CODE_08C8E0    ;
CODE_08C8D8:         from r1            ;
CODE_08C8D9:         stw   (r11)        ;
CODE_08C8DA:         inc   r11          ;
CODE_08C8DB:         inc   r11          ;
CODE_08C8DC:         from r4            ;
CODE_08C8DD:         stw   (r11)        ;
CODE_08C8DE:         inc   r11          ;
CODE_08C8DF:         inc   r11          ;
CODE_08C8E0:         from r3            ;
CODE_08C8E1:         sub   r2           ;
CODE_08C8E2:         bcs CODE_08C8EC    ;
CODE_08C8E4:         from r3            ;
CODE_08C8E5:         stw   (r11)        ;
CODE_08C8E6:         inc   r11          ;
CODE_08C8E7:         inc   r11          ;
CODE_08C8E8:         from r2            ;
CODE_08C8E9:         stw   (r11)        ;
CODE_08C8EA:         inc   r11          ;
CODE_08C8EB:         inc   r11          ;
CODE_08C8EC:         dec   r11          ;
CODE_08C8ED:         from r11           ;
CODE_08C8EE:         sub   r12          ;
CODE_08C8EF:         bcc CODE_08C8FC    ;
CODE_08C8F1:         dec   r11          ;
CODE_08C8F2:         to r2              ;
CODE_08C8F3:         ldw   (r11)        ;
CODE_08C8F4:         dec   r11          ;
CODE_08C8F5:         dec   r11          ;
CODE_08C8F6:         to r1              ;
CODE_08C8F7:         ldw   (r11)        ;
CODE_08C8F8:         bra CODE_08C889    ;

CODE_08C8FA:         move  r3,r1        ;
CODE_08C8FC:         iwt   r11,#14DD    ;
CODE_08C8FF:         lm    r12,(102A)   ;
CODE_08C903:         cache              ;
CODE_08C904:         move  r13,r15      ;
CODE_08C906:         ibt   r0,#0008     ;
CODE_08C908:         romb               ;
CODE_08C90A:         ldb   (r11)        ;
CODE_08C90C:         add   r0           ;
CODE_08C90D:         add   r0           ;
CODE_08C90E:         iwt   r1,#1284     ;
CODE_08C911:         to r1              ;
CODE_08C912:         add   r1           ;
CODE_08C913:         iwt   r2,#102C     ;
CODE_08C916:         add   r2           ;
CODE_08C917:         ldb   (r0)         ;
CODE_08C919:         dec   r0           ;
CODE_08C91A:         bpl CODE_08C921    ;
CODE_08C91C:         add   r0           ;
CODE_08C91D:         iwt   r15,#C9F9    ;
CODE_08C920:         inc   r11          ;
CODE_08C921:         iwt   r14,#CAC6    ;
CODE_08C924:         to r14             ;
CODE_08C925:         add   r14          ;
CODE_08C926:         getb               ;
CODE_08C927:         inc   r14          ;
CODE_08C928:         sms   (0056),r11   ;
CODE_08C92B:         sms   (0058),r12   ;
CODE_08C92E:         iwt   r7,#0080     ;
CODE_08C931:         getbh              ;
CODE_08C933:         move  r14,r0       ;
CODE_08C935:         to r11             ;
CODE_08C936:         ldb   (r1)         ;
CODE_08C938:         inc   r1           ;
CODE_08C939:         to r2              ;
CODE_08C93A:         ldb   (r1)         ;
CODE_08C93C:         getb               ;
CODE_08C93D:         inc   r14          ;
CODE_08C93E:         sbk                ;
CODE_08C93F:         inc   r1           ;
CODE_08C940:         ldw   (r1)         ;
CODE_08C941:         lsr                ;
CODE_08C942:         bne CODE_08C94B    ;
CODE_08C944:         to r6              ;
CODE_08C945:         iwt   r15,#C9F2    ;
CODE_08C948:         lms   r11,(0056)   ;
CODE_08C94B:         rol                ;
CODE_08C94C:         getb               ;
CODE_08C94D:         inc   r14          ;
CODE_08C94E:         swap               ;
CODE_08C94F:         fmult              ;
CODE_08C950:         to r2              ;
CODE_08C951:         adc   r2           ;
CODE_08C953:         iwt   r0,#2200     ;
CODE_08C956:         add   r6           ;
CODE_08C957:         add   r6           ;
CODE_08C958:         to r5              ;
CODE_08C959:         ldw   (r0)         ;
CODE_08C95A:         getb               ;
CODE_08C95B:         inc   r14          ;
CODE_08C95C:         to r3              ;
CODE_08C95D:         swap               ;
CODE_08C95E:         with r3            ;
CODE_08C95F:         or    r7           ;
CODE_08C960:         inc   r0           ;
CODE_08C961:         lsr                ;
CODE_08C962:         swap               ;
CODE_08C963:         fmult              ;
CODE_08C964:         from r11           ;
CODE_08C965:         to r12             ;
CODE_08C966:         sub   r0           ;
CODE_08C967:         getb               ;
CODE_08C968:         inc   r14          ;
CODE_08C969:         move  r9,r14       ;
CODE_08C96B:         swap               ;
CODE_08C96C:         to r7              ;
CODE_08C96D:         add   r7           ;
CODE_08C96E:         to r4              ;
CODE_08C96F:         getb               ;
CODE_08C970:         inc   r14          ;
CODE_08C971:         sub   r0           ;
CODE_08C972:         move  r8,r0        ;
CODE_08C974:         with r4            ;
CODE_08C975:         getbh              ;
CODE_08C977:         ibt   r0,#0056     ;
CODE_08C979:         romb               ;
CODE_08C97B:         from r4            ;
CODE_08C97C:         lsr                ;
CODE_08C97D:         bcc CODE_08C982    ;
CODE_08C97F:         add   r0           ;
CODE_08C980:         ibt   r8,#0004     ;
CODE_08C982:         from r8            ;
CODE_08C983:         cmode              ;
CODE_08C985:         moves r4,r0        ;
CODE_08C987:         bpl CODE_08C9CE    ;
CODE_08C989:         move  r1,r12       ;
CODE_08C98B:         add   r0           ;
CODE_08C98C:         to r4              ;
CODE_08C98D:         lsr                ;
CODE_08C98E:         beq CODE_08C9AA    ;
CODE_08C990:         sub   r0           ;
CODE_08C991:         move  r1,r12       ;
CODE_08C993:         iwt   r8,#0080     ;
CODE_08C996:         merge              ;
CODE_08C997:         to r14             ;
CODE_08C998:         add   r4           ;
CODE_08C999:         with r8            ;
CODE_08C99A:         add   r5           ;
CODE_08C99B:         from r3            ;
CODE_08C99C:         sub   r8           ;
CODE_08C99D:         getc               ;
CODE_08C99E:         bpl CODE_08C996    ;
CODE_08C9A0:         plot               ;
CODE_08C9A1:         with r7            ;
CODE_08C9A2:         sub   r5           ;
CODE_08C9A3:         bpl CODE_08C991    ;
CODE_08C9A5:         dec   r2           ;
CODE_08C9A6:         bra CODE_08C9E0    ;

CODE_08C9A8:         ibt   r0,#0008     ;
CODE_08C9AA:         color              ;
CODE_08C9AB:         inc   r0           ;
CODE_08C9AC:         cmode              ;
CODE_08C9AE:         move  r1,r12       ;
CODE_08C9B0:         move  r8,r3        ;
CODE_08C9B2:         merge              ;
CODE_08C9B3:         to r14             ;
CODE_08C9B4:         add   r4           ;
CODE_08C9B5:         with r8            ;
CODE_08C9B6:         sub   r5           ;
CODE_08C9B7:         getb               ;
CODE_08C9B8:         and   #0F          ;
CODE_08C9BA:         beq CODE_08C9BF    ;
CODE_08C9BC:         inc   r1           ;
CODE_08C9BD:         dec   r1           ;
CODE_08C9BE:         plot               ;
CODE_08C9BF:         moves r8,r8        ;
CODE_08C9C1:         bpl CODE_08C9B3    ;
CODE_08C9C3:         merge              ;
CODE_08C9C4:         with r7            ;
CODE_08C9C5:         sub   r5           ;
CODE_08C9C6:         bpl CODE_08C9AE    ;
CODE_08C9C8:         dec   r2           ;
CODE_08C9C9:         bra CODE_08C9E0    ;

CODE_08C9CB:         ibt   r0,#0008     ;
CODE_08C9CD:         move  r1,r12       ;
CODE_08C9CF:         move  r8,r3        ;
CODE_08C9D1:         merge              ;
CODE_08C9D2:         to r14             ;
CODE_08C9D3:         add   r4           ;
CODE_08C9D4:         with r8            ;
CODE_08C9D5:         sub   r5           ;
CODE_08C9D6:         getc               ;
CODE_08C9D7:         bpl CODE_08C9D1    ;
CODE_08C9D9:         plot               ;
CODE_08C9DA:         with r7            ;
CODE_08C9DB:         sub   r5           ;
CODE_08C9DC:         bpl CODE_08C9CD    ;
CODE_08C9DE:         dec   r2           ;
CODE_08C9DF:         ibt   r0,#0008     ;
CODE_08C9E1:         romb               ;
CODE_08C9E3:         move  r14,r9       ;
CODE_08C9E5:         inc   r14          ;
CODE_08C9E6:         inc   r14          ;
CODE_08C9E7:         getb               ;
CODE_08C9E8:         inc   r14          ;
CODE_08C9E9:         to r3              ;
CODE_08C9EA:         swap               ;
CODE_08C9EB:         bmi CODE_08C9F2    ;
CODE_08C9ED:         inc   r0           ;
CODE_08C9EE:         iwt   r15,#C962    ;
CODE_08C9F1:         lsr                ;
CODE_08C9F2:         lms   r11,(0056)   ;
CODE_08C9F5:         lms   r12,(0058)   ;
CODE_08C9F8:         inc   r11          ;
CODE_08C9F9:         loop               ;
CODE_08C9FA:         inc   r11          ;
CODE_08C9FB:         inc   r2           ;
CODE_08C9FC:         rpix               ;
CODE_08C9FE:         iwt   r1,#1030     ;
CODE_08CA01:         iwt   r2,#1031     ;
CODE_08CA04:         iwt   r5,#1033     ;
CODE_08CA07:         iwt   r3,#1289     ;
CODE_08CA0A:         lm    r0,(0CA4)    ;
CODE_08CA0E:         hib                ;
CODE_08CA0F:         to r10             ;
CODE_08CA10:         sex                ;
CODE_08CA11:         lm    r0,(0CA6)    ;
CODE_08CA15:         hib                ;
CODE_08CA16:         to r11             ;
CODE_08CA17:         sex                ;
CODE_08CA18:         lm    r12,(102A)   ;
CODE_08CA1C:         dec   r12          ;
CODE_08CA1D:         cache              ;
CODE_08CA1E:         move  r13,r15      ;
CODE_08CA20:         ldb   (r1)         ;
CODE_08CA22:         dec   r0           ;
CODE_08CA23:         bmi CODE_08CA54    ;
CODE_08CA25:         nop                ;
CODE_08CA26:         ldb   (r3)         ;
CODE_08CA28:         moves r6,r0        ;
CODE_08CA2A:         beq CODE_08CA54    ;
CODE_08CA2C:         nop                ;
CODE_08CA2D:         lmult              ;
CODE_08CA2F:         move  r7,r4        ;
CODE_08CA31:         ldb   (r2)         ;
CODE_08CA33:         sex                ;
CODE_08CA34:         sub   r10          ;
CODE_08CA35:         move  r8,r0        ;
CODE_08CA37:         move  r6,r0        ;
CODE_08CA39:         lmult              ;
CODE_08CA3B:         with r7            ;
CODE_08CA3C:         sub   r4           ;
CODE_08CA3D:         bcc CODE_08CA55    ;
CODE_08CA3F:         inc   r2           ;
CODE_08CA40:         move  r14,r4       ;
CODE_08CA42:         ldb   (r2)         ;
CODE_08CA44:         sex                ;
CODE_08CA45:         sub   r11          ;
CODE_08CA46:         move  r9,r0        ;
CODE_08CA48:         move  r6,r0        ;
CODE_08CA4A:         lmult              ;
CODE_08CA4C:         from r4            ;
CODE_08CA4D:         sub   r7           ;
CODE_08CA4E:         bcs CODE_08CA56    ;
CODE_08CA50:         inc   r2           ;
CODE_08CA51:         bra CODE_08CA63    ;

CODE_08CA53:         with r14           ;
CODE_08CA54:         inc   r2           ;

CODE_08CA55:         inc   r2           ;
CODE_08CA56:         inc   r2           ;
CODE_08CA57:         ibt   r0,#0004     ;
CODE_08CA59:         to r1              ;
CODE_08CA5A:         add   r1           ;
CODE_08CA5B:         to r5              ;
CODE_08CA5C:         add   r5           ;
CODE_08CA5D:         to r3              ;
CODE_08CA5E:         add   r3           ;
CODE_08CA5F:         loop               ;
CODE_08CA60:         inc   r2           ;
CODE_08CA61:         stop               ;
CODE_08CA62:         nop                ;

CODE_08CA63:         add   r4           ;
CODE_08CA64:         ldb   (r1)         ;
CODE_08CA66:         sub   #0E          ;
CODE_08CA68:         bne CODE_08CA78    ;
CODE_08CA6A:         sub   r0           ;
CODE_08CA6B:         lm    r0,(0CA2)    ;
CODE_08CA6F:         sub   #00          ;
CODE_08CA71:         bne CODE_08CA76    ;
CODE_08CA73:         inc   r0           ;
CODE_08CA74:         inc   r0           ;
CODE_08CA75:         sbk                ;
CODE_08CA76:         stop               ;
CODE_08CA77:         nop                ;

CODE_08CA78:         move  r6,r0        ;
CODE_08CA7A:         ibt   r5,#0002     ;
CODE_08CA7C:         ibt   r12,#0010    ;
CODE_08CA7E:         iwt   r13,#CA82    ;
CODE_08CA81:         with r6            ;
CODE_08CA82:         add   r6           ;
CODE_08CA83:         with r14           ;
CODE_08CA84:         add   r14          ;
CODE_08CA85:         rol                ;
CODE_08CA86:         with r14           ;
CODE_08CA87:         add   r14          ;
CODE_08CA88:         rol                ;
CODE_08CA89:         to r1              ;
CODE_08CA8A:         sbc   r6           ;
CODE_08CA8C:         bcc CODE_08CA92    ;
CODE_08CA8E:         with r6            ;
CODE_08CA8F:         add   r5           ;
CODE_08CA90:         move  r0,r1        ;
CODE_08CA92:         loop               ;
CODE_08CA93:         with r6            ;
CODE_08CA94:         lsr                ;
CODE_08CA95:         ldb   (r3)         ;
CODE_08CA97:         add   r0           ;
CODE_08CA98:         iwt   r3,#2200     ;
CODE_08CA9B:         add   r3           ;
CODE_08CA9C:         ldw   (r0)         ;
CODE_08CA9D:         fmult              ;
CODE_08CA9E:         add   r0           ;
CODE_08CA9F:         add   r3           ;
CODE_08CAA0:         to r6              ;
CODE_08CAA1:         ldw   (r0)         ;
CODE_08CAA2:         from r9            ;
CODE_08CAA3:         sex                ;
CODE_08CAA4:         swap               ;
CODE_08CAA5:         fmult              ;
CODE_08CAA6:         move  r1,r0        ;
CODE_08CAA8:         hib                ;
CODE_08CAA9:         sex                ;
CODE_08CAAA:         to r1              ;
CODE_08CAAB:         adc   r1           ;
CODE_08CAAD:         dec   r2           ;
CODE_08CAAE:         ldb   (r2)         ;
CODE_08CAB0:         sex                ;
CODE_08CAB1:         sub   r1           ;
CODE_08CAB2:         swap               ;
CODE_08CAB3:         from r8            ;
CODE_08CAB4:         sex                ;
CODE_08CAB5:         swap               ;
CODE_08CAB6:         fmult              ;
CODE_08CAB7:         move  r1,r0        ;
CODE_08CAB9:         hib                ;
CODE_08CABA:         sex                ;
CODE_08CABB:         to r1              ;
CODE_08CABC:         adc   r1           ;
CODE_08CABE:         dec   r2           ;
CODE_08CABF:         ldb   (r2)         ;
CODE_08CAC1:         sex                ;
CODE_08CAC2:         sub   r1           ;
CODE_08CAC3:         swap               ;
CODE_08CAC4:         stop               ;
CODE_08CAC5:         nop                ;

DATA_08CAC6:         db $E4, $CB, $FB, $CB, $0E, $CC, $1D, $CC
DATA_08CACE:         db $24, $CC, $2B, $CC, $32, $CC, $39, $CC
DATA_08CAD6:         db $40, $CC, $47, $CC, $4E, $CC, $55, $CC
DATA_08CADE:         db $5C, $CC, $63, $CC, $6A, $CC, $71, $CC
DATA_08CAE6:         db $78, $CC, $7F, $CC, $86, $CC, $8D, $CC
DATA_08CAEE:         db $94, $CC, $9B, $CC, $A2, $CC, $A9, $CC
DATA_08CAF6:         db $B0, $CC, $B7, $CC, $BE, $CC, $C5, $CC
DATA_08CAFE:         db $CC, $CC, $D3, $CC, $DA, $CC, $E1, $CC
DATA_08CB06:         db $E8, $CC, $EF, $CC, $F6, $CC, $FD, $CC
DATA_08CB0E:         db $04, $CD, $0B, $CD, $12, $CD, $19, $CD
DATA_08CB16:         db $20, $CD, $27, $CD, $2E, $CD, $35, $CD
DATA_08CB1E:         db $3C, $CD, $43, $CD, $4A, $CD, $51, $CD
DATA_08CB26:         db $58, $CD, $5F, $CD, $66, $CD, $6D, $CD
DATA_08CB2E:         db $74, $CD, $7B, $CD, $82, $CD, $89, $CD
DATA_08CB36:         db $90, $CD, $97, $CD, $9E, $CD, $A5, $CD
DATA_08CB3E:         db $AC, $CD, $B3, $CD, $BA, $CD, $C1, $CD
DATA_08CB46:         db $C8, $CD, $CF, $CD, $D6, $CD, $DD, $CD
DATA_08CB4E:         db $E4, $CD, $EB, $CD, $F2, $CD, $F9, $CD
DATA_08CB56:         db $00, $CE, $07, $CE, $0E, $CE, $15, $CE
DATA_08CB5E:         db $1C, $CE, $23, $CE, $2A, $CE, $31, $CE
DATA_08CB66:         db $38, $CE, $3F, $CE, $46, $CE, $4D, $CE
DATA_08CB6E:         db $54, $CE, $5B, $CE, $62, $CE, $69, $CE
DATA_08CB76:         db $70, $CE, $77, $CE, $7E, $CE, $85, $CE
DATA_08CB7E:         db $8C, $CE, $93, $CE, $9A, $CE, $A1, $CE
DATA_08CB86:         db $A8, $CE, $AF, $CE, $B6, $CE, $BD, $CE
DATA_08CB8E:         db $C4, $CE, $CB, $CE, $D2, $CE, $D9, $CE
DATA_08CB96:         db $E4, $CE, $F7, $CE, $0E, $CF, $15, $CF
DATA_08CB9E:         db $1C, $CF, $23, $CF, $2A, $CF, $31, $CF
DATA_08CBA6:         db $38, $CF, $3F, $CF, $46, $CF, $4D, $CF
DATA_08CBAE:         db $54, $CF, $5B, $CF, $62, $CF, $69, $CF
DATA_08CBB6:         db $70, $CF, $77, $CF, $7E, $CF, $85, $CF
DATA_08CBBE:         db $8C, $CF, $93, $CF, $9A, $CF, $A1, $CF
DATA_08CBC6:         db $A8, $CF, $AF, $CF, $B6, $CF, $BD, $CF
DATA_08CBCE:         db $C4, $CF, $CB, $CF, $D2, $CF, $D9, $CF
DATA_08CBD6:         db $E0, $CF, $E7, $CF, $EE, $CF, $F5, $CF
DATA_08CBDE:         db $FC, $CF, $03, $D0, $0A, $D0, $17, $06
DATA_08CBE6:         db $27, $1B, $00, $04, $27, $16, $00, $04
DATA_08CBEE:         db $27, $0F, $80, $18, $27, $17, $80, $00
DATA_08CBF6:         db $07, $08, $41, $36, $FF, $17, $06, $27
DATA_08CBFE:         db $1B, $00, $04, $27, $07, $00, $04, $27
DATA_08CC06:         db $0F, $80, $18, $27, $17, $80, $00, $FF
DATA_08CC0E:         db $17, $06, $27, $17, $00, $08, $27, $0F
DATA_08CC16:         db $80, $18, $27, $17, $80, $00, $FF, $09
DATA_08CC1E:         db $02, $0F, $1F, $B0, $80, $FF, $0B, $03
DATA_08CC26:         db $0F, $1F, $D0, $80, $FF, $12, $07, $1F
DATA_08CC2E:         db $1F, $C1, $80, $FF, $12, $05, $1F, $1A
DATA_08CC36:         db $81, $80, $FF, $12, $06, $1F, $1F, $21
DATA_08CC3E:         db $00, $FF, $07, $01, $07, $0F, $51, $80
DATA_08CC46:         db $FF, $0B, $02, $0F, $0F, $71, $A0, $FF
DATA_08CC4E:         db $09, $03, $0F, $0C, $41, $80, $FF, $04
DATA_08CC56:         db $00, $03, $03, $61, $1B, $FF, $08, $02
DATA_08CC5E:         db $0F, $0F, $61, $A0, $FF, $0C, $03, $1F
DATA_08CC66:         db $07, $01, $58, $FF, $07, $00, $0F, $0F
DATA_08CC6E:         db $B1, $30, $FF, $06, $00, $0F, $0F, $F0
DATA_08CC76:         db $20, $FF, $04, $00, $07, $0C, $71, $00
DATA_08CC7E:         db $FF, $04, $00, $08, $09, $71, $0E, $FF
DATA_08CC86:         db $07, $00, $0E, $1A, $61, $00, $FF, $09
DATA_08CC8E:         db $02, $0F, $0F, $E0, $A0, $FF, $00, $08
DATA_08CC96:         db $17, $0E, $E0, $30, $FF, $00, $0A, $1F
DATA_08CC9E:         db $17, $E0, $00, $FF, $00, $08, $06, $08
DATA_08CCA6:         db $79, $17, $FF, $00, $00, $06, $03, $65
DATA_08CCAE:         db $1B, $FF, $00, $00, $04, $05, $7B, $00
DATA_08CCB6:         db $FF, $06, $01, $05, $05, $7B, $06, $FF
DATA_08CCBE:         db $00, $01, $02, $02, $7B, $0C, $FF, $00
DATA_08CCC6:         db $00, $03, $02, $41, $1A, $FF, $00, $01
DATA_08CCCE:         db $05, $04, $45, $1A, $FF, $00, $02, $07
DATA_08CCD6:         db $06, $4B, $1A, $FF, $00, $02, $07, $06
DATA_08CCDE:         db $53, $1A, $FF, $00, $02, $07, $06, $41
DATA_08CCE6:         db $21, $FF, $00, $02, $07, $06, $49, $21
DATA_08CCEE:         db $FF, $00, $02, $07, $06, $51, $21, $FF
DATA_08CCF6:         db $00, $00, $07, $07, $E0, $18, $FF, $00
DATA_08CCFE:         db $00, $07, $07, $E8, $18, $FF, $00, $00
DATA_08CD06:         db $07, $07, $F0, $18, $FF, $00, $00, $07
DATA_08CD0E:         db $07, $F8, $18, $FF, $00, $00, $07, $07
DATA_08CD16:         db $41, $28, $FF, $00, $00, $07, $07, $49
DATA_08CD1E:         db $28, $FF, $00, $00, $07, $07, $51, $28
DATA_08CD26:         db $FF, $00, $00, $07, $07, $59, $28, $FF
DATA_08CD2E:         db $00, $00, $07, $07, $F1, $A0, $FF, $00
DATA_08CD36:         db $00, $09, $07, $EB, $80, $FF, $00, $00
DATA_08CD3E:         db $09, $07, $EB, $88, $FF, $00, $00, $09
DATA_08CD46:         db $07, $EB, $90, $FF, $00, $00, $09, $07
DATA_08CD4E:         db $EB, $98, $FF, $00, $00, $07, $07, $59
DATA_08CD56:         db $A0, $FF, $00, $00, $08, $07, $E1, $80
DATA_08CD5E:         db $FF, $00, $00, $08, $07, $E1, $88, $FF
DATA_08CD66:         db $00, $00, $08, $07, $E1, $90, $FF, $00
DATA_08CD6E:         db $00, $08, $07, $E1, $98, $FF, $00, $00
DATA_08CD76:         db $07, $07, $F1, $B0, $FF, $00, $00, $07
DATA_08CD7E:         db $07, $E1, $A0, $FF, $00, $00, $07, $07
DATA_08CD86:         db $E1, $A8, $FF, $00, $00, $07, $06, $E1
DATA_08CD8E:         db $B0, $FF, $00, $00, $07, $06, $E1, $B8
DATA_08CD96:         db $FF, $00, $00, $08, $07, $59, $20, $FF
DATA_08CD9E:         db $00, $00, $08, $07, $E1, $00, $FF, $00
DATA_08CDA6:         db $00, $08, $07, $E1, $08, $FF, $00, $00
DATA_08CDAE:         db $08, $07, $E1, $10, $FF, $00, $00, $08
DATA_08CDB6:         db $07, $E1, $18, $FF, $00, $00, $07, $07
DATA_08CDBE:         db $F1, $20, $FF, $00, $00, $09, $07, $EB
DATA_08CDC6:         db $00, $FF, $00, $00, $09, $07, $EB, $08
DATA_08CDCE:         db $FF, $00, $00, $09, $07, $EB, $10, $FF
DATA_08CDD6:         db $00, $00, $09, $07, $EB, $18, $FF, $00
DATA_08CDDE:         db $00, $07, $07, $F1, $A8, $FF, $00, $00
DATA_08CDE6:         db $08, $06, $F5, $80, $FF, $00, $00, $08
DATA_08CDEE:         db $06, $F5, $88, $FF, $00, $00, $08, $06
DATA_08CDF6:         db $F5, $8F, $FF, $00, $00, $08, $07, $F5
DATA_08CDFE:         db $97, $FF, $00, $00, $07, $07, $F1, $B8
DATA_08CE06:         db $FF, $00, $00, $07, $07, $E9, $A0, $FF
DATA_08CE0E:         db $00, $00, $07, $06, $E9, $A8, $FF, $00
DATA_08CE16:         db $00, $07, $06, $E9, $B0, $FF, $00, $00
DATA_08CE1E:         db $07, $06, $E9, $B8, $FF, $00, $00, $07
DATA_08CE26:         db $07, $F1, $28, $FF, $00, $00, $08, $06
DATA_08CE2E:         db $F5, $00, $FF, $00, $00, $08, $06, $F5
DATA_08CE36:         db $08, $FF, $00, $00, $08, $06, $F5, $0F
DATA_08CE3E:         db $FF, $00, $00, $08, $07, $F5, $17, $FF
DATA_08CE46:         db $00, $00, $07, $07, $E1, $20, $FF, $00
DATA_08CE4E:         db $00, $07, $07, $E1, $28, $FF, $00, $00
DATA_08CE56:         db $07, $07, $E1, $30, $FF, $00, $00, $07
DATA_08CE5E:         db $07, $E1, $38, $FF, $00, $00, $07, $07
DATA_08CE66:         db $E9, $20, $FF, $00, $00, $07, $07, $E9
DATA_08CE6E:         db $28, $FF, $00, $00, $07, $07, $E9, $30
DATA_08CE76:         db $FF, $00, $00, $07, $07, $E9, $38, $FF
DATA_08CE7E:         db $04, $00, $0F, $1F, $A1, $20, $FF, $03
DATA_08CE86:         db $00, $06, $0D, $A1, $12, $FF, $06, $00
DATA_08CE8E:         db $07, $0F, $F8, $30, $FF, $0B, $01, $0F
DATA_08CE96:         db $0F, $71, $30, $FF, $05, $00, $09, $08
DATA_08CE9E:         db $A7, $16, $FF, $04, $00, $07, $07, $71
DATA_08CEA6:         db $18, $FF, $06, $00, $07, $0A, $A9, $00
DATA_08CEAE:         db $FF, $04, $00, $04, $04, $4F, $30, $FF
DATA_08CEB6:         db $06, $00, $06, $05, $41, $30, $FF, $06
DATA_08CEBE:         db $00, $05, $05, $49, $30, $FF, $05, $00
DATA_08CEC6:         db $06, $07, $41, $36, $FF, $06, $00, $0F
DATA_08CECE:         db $0F, $B1, $18, $FF, $06, $00, $0F, $17
DATA_08CED6:         db $B1, $18, $FF, $06, $00, $0F, $07, $B1
DATA_08CEDE:         db $28, $0F, $17, $B1, $18, $FF, $06, $00
DATA_08CEE6:         db $0F, $07, $B1, $28, $0F, $07, $B1, $28
DATA_08CEEE:         db $0F, $07, $B1, $28, $0F, $17, $B1, $18
DATA_08CEF6:         db $FF, $06, $00, $0F, $07, $B1, $28, $0F
DATA_08CEFE:         db $07, $B1, $28, $0F, $07, $B1, $28, $0F
DATA_08CF06:         db $07, $B1, $28, $0F, $17, $B1, $18, $FF
DATA_08CF0E:         db $00, $05, $27, $1D, $00, $80, $FF, $00
DATA_08CF16:         db $00, $0F, $1F, $00, $40, $FF, $00, $00
DATA_08CF1E:         db $0F, $0F, $10, $50, $FF, $00, $00, $1F
DATA_08CF26:         db $1F, $E1, $40, $FF, $00, $00, $0F, $0F
DATA_08CF2E:         db $10, $40, $FF, $00, $00, $0F, $1F, $C0
DATA_08CF36:         db $00, $FF, $00, $00, $07, $15, $F9, $2A
DATA_08CF3E:         db $FF, $00, $00, $0F, $1F, $B0, $20, $FF
DATA_08CF46:         db $00, $00, $1F, $1F, $20, $40, $FF, $00
DATA_08CF4E:         db $00, $1F, $1F, $40, $00, $FF, $00, $00
DATA_08CF56:         db $1F, $1F, $01, $00, $FF, $00, $00, $1F
DATA_08CF5E:         db $1F, $01, $20, $FF, $00, $00, $1F, $1F
DATA_08CF66:         db $21, $20, $FF, $00, $00, $1F, $1F, $81
DATA_08CF6E:         db $20, $FF, $00, $00, $1F, $1F, $C1, $20
DATA_08CF76:         db $FF, $00, $00, $1F, $17, $01, $40, $FF
DATA_08CF7E:         db $00, $00, $1F, $17, $21, $40, $FF, $00
DATA_08CF86:         db $00, $0F, $0F, $80, $30, $FF, $00, $00
DATA_08CF8E:         db $0F, $0F, $90, $30, $FF, $00, $00, $1F
DATA_08CF96:         db $07, $80, $D8, $FF, $00, $00, $1F, $0F
DATA_08CF9E:         db $80, $C0, $FF, $00, $00, $1F, $17, $C0
DATA_08CFA6:         db $C8, $FF, $00, $00, $1F, $1F, $E0, $C0
DATA_08CFAE:         db $FF, $00, $00, $1F, $1F, $60, $C0, $FF
DATA_08CFB6:         db $00, $00, $1F, $1F, $40, $C0, $FF, $00
DATA_08CFBE:         db $00, $1F, $1F, $C0, $A0, $FF, $00, $00
DATA_08CFC6:         db $1F, $1F, $60, $80, $FF, $00, $00, $1F
DATA_08CFCE:         db $1F, $40, $A0, $FF, $00, $00, $1F, $1F
DATA_08CFD6:         db $60, $A0, $FF, $00, $00, $1F, $1F, $00
DATA_08CFDE:         db $A0, $FF, $00, $00, $1F, $1F, $20, $A0
DATA_08CFE6:         db $FF, $00, $0A, $1F, $17, $81, $40, $FF
DATA_08CFEE:         db $00, $00, $1F, $1F, $C1, $40, $FF, $00
DATA_08CFF6:         db $00, $1F, $1F, $A0, $40, $FF, $00, $00
DATA_08CFFE:         db $1F, $1F, $41, $40, $FF, $00, $00, $1F
DATA_08D006:         db $1F, $61, $40, $FF, $00, $00, $1F, $1F
DATA_08D00E:         db $A1, $40, $FF, $20, $01, $1F, $01, $1F
DATA_08D016:         db $01, $1E, $01, $1D, $01, $1C, $01, $1C
DATA_08D01E:         db $01, $1B, $01, $1A, $01, $1A, $01, $19
DATA_08D026:         db $01, $18, $01, $17, $01, $17, $01, $16
DATA_08D02E:         db $01, $15, $01, $15, $01, $14, $01, $13
DATA_08D036:         db $01, $13, $01, $12, $01, $11, $01, $11
DATA_08D03E:         db $01, $10, $01, $0F, $01, $0F, $01, $0E
DATA_08D046:         db $01, $0D, $01, $0D, $01, $0C, $01, $0C
DATA_08D04E:         db $01, $0B, $01, $0A, $01, $0A, $01, $09
DATA_08D056:         db $01, $08, $01, $08, $01, $07, $01, $07
DATA_08D05E:         db $01, $06, $01, $05, $01, $05, $01, $04
DATA_08D066:         db $01, $04, $01, $03, $01, $02, $01, $02
DATA_08D06E:         db $01, $01, $01, $01, $01, $00, $01, $FF
DATA_08D076:         db $00, $FF, $00, $FE, $00, $FE, $00, $FD
DATA_08D07E:         db $00, $FD, $00, $FC, $00, $FB, $00, $FB
DATA_08D086:         db $00, $FA, $00, $FA, $00, $F9, $00, $F9
DATA_08D08E:         db $00, $F8, $00, $F8, $00, $F7, $00, $F6
DATA_08D096:         db $00, $F6, $00, $F5, $00, $F5, $00, $F4
DATA_08D09E:         db $00, $F4, $00, $F3, $00, $F3, $00, $F2
DATA_08D0A6:         db $00, $F2, $00, $F1, $00, $F1, $00, $F0
DATA_08D0AE:         db $00, $F0, $00, $EF, $00, $EF, $00, $EE
DATA_08D0B6:         db $00, $EE, $00, $ED, $00, $ED, $00, $EC
DATA_08D0BE:         db $00, $EC, $00, $EB, $00, $EB, $00, $EA
DATA_08D0C6:         db $00, $EA, $00, $E9, $00, $E9, $00, $E8
DATA_08D0CE:         db $00, $E8, $00, $E7, $00, $E7, $00, $E6
DATA_08D0D6:         db $00, $E6, $00, $E5, $00, $E5, $00, $E5
DATA_08D0DE:         db $00, $E4, $00, $E4, $00, $E3, $00, $E3
DATA_08D0E6:         db $00, $E2, $00, $E2, $00, $E1, $00, $E1
DATA_08D0EE:         db $00, $E0, $00, $8F, $46, $80, $46, $72
DATA_08D0F6:         db $46, $63, $46, $54, $46, $45, $46, $37
DATA_08D0FE:         db $46, $28, $46, $19, $46, $0B, $46, $FC
DATA_08D106:         db $45, $EE, $45, $DF, $45, $D1, $45, $C2
DATA_08D10E:         db $45, $B4, $45, $A5, $45, $97, $45, $88
DATA_08D116:         db $45, $7A, $45, $6C, $45, $5D, $45, $4F
DATA_08D11E:         db $45, $41, $45, $33, $45, $24, $45, $16
DATA_08D126:         db $45, $08, $45, $FA, $44, $EC, $44, $DD
DATA_08D12E:         db $44, $CF, $44, $C1, $44, $B3, $44, $A5
DATA_08D136:         db $44, $97, $44, $89, $44, $7B, $44, $6D
DATA_08D13E:         db $44, $5F, $44, $51, $44, $44, $44, $36
DATA_08D146:         db $44, $28, $44, $1A, $44, $0C, $44, $FE
DATA_08D14E:         db $43, $F1, $43, $E3, $43, $D5, $43, $C8
DATA_08D156:         db $43, $BA, $43, $AC, $43, $9F, $43, $91
DATA_08D15E:         db $43, $83, $43, $76, $43, $68, $43, $5B
DATA_08D166:         db $43, $4D, $43, $40, $43, $32, $43, $25
DATA_08D16E:         db $43, $18, $43, $0A, $43, $FD, $42, $F0
DATA_08D176:         db $42, $E2, $42, $D5, $42, $C8, $42, $BA
DATA_08D17E:         db $42, $AD, $42, $A0, $42, $93, $42, $86
DATA_08D186:         db $42, $78, $42, $6B, $42, $5E, $42, $51
DATA_08D18E:         db $42, $44, $42, $37, $42, $2A, $42, $1D
DATA_08D196:         db $42, $10, $42, $03, $42, $F6, $41, $E9
DATA_08D19E:         db $41, $DC, $41, $CF, $41, $C2, $41, $B5
DATA_08D1A6:         db $41, $A9, $41, $9C, $41, $8F, $41, $82
DATA_08D1AE:         db $41, $75, $41, $69, $41, $5C, $41, $4F
DATA_08D1B6:         db $41, $43, $41, $36, $41, $29, $41, $1D
DATA_08D1BE:         db $41, $10, $41, $03, $41, $F7, $40, $EA
DATA_08D1C6:         db $40, $DE, $40, $D1, $40, $C5, $40, $B8
DATA_08D1CE:         db $40, $AC, $40, $9F, $40, $93, $40, $87
DATA_08D1D6:         db $40, $7A, $40, $6E, $40, $61, $40, $55
DATA_08D1DE:         db $40, $49, $40, $3D, $40, $30, $40, $24
DATA_08D1E6:         db $40, $18, $40, $0C, $40, $FF, $3F, $F3
DATA_08D1EE:         db $3F, $E7, $3F, $DB, $3F, $CF, $3F, $C3
DATA_08D1F6:         db $3F, $B7, $3F, $AA, $3F, $9E, $3F, $92
DATA_08D1FE:         db $3F, $86, $3F, $7A, $3F, $6E, $3F, $62
DATA_08D206:         db $3F, $56, $3F, $4B, $3F, $3F, $3F, $33
DATA_08D20E:         db $3F, $27, $3F, $1B, $3F, $0F, $3F, $03
DATA_08D216:         db $3F, $F7, $3E, $EC, $3E, $E0, $3E, $D4
DATA_08D21E:         db $3E, $C8, $3E, $BD, $3E, $B1, $3E, $A5
DATA_08D226:         db $3E, $9A, $3E, $8E, $3E, $82, $3E, $77
DATA_08D22E:         db $3E, $6B, $3E, $60, $3E, $54, $3E, $48
DATA_08D236:         db $3E, $3D, $3E, $31, $3E, $26, $3E, $1A
DATA_08D23E:         db $3E, $0F, $3E, $03, $3E, $F8, $3D, $ED
DATA_08D246:         db $3D, $E1, $3D, $D6, $3D, $CA, $3D, $BF
DATA_08D24E:         db $3D, $B4, $3D, $A8, $3D, $9D, $3D, $92
DATA_08D256:         db $3D, $87, $3D, $7B, $3D, $70, $3D, $65
DATA_08D25E:         db $3D, $5A, $3D, $4E, $3D, $43, $3D, $38
DATA_08D266:         db $3D, $2D, $3D, $22, $3D, $17, $3D, $0C
DATA_08D26E:         db $3D, $00, $3D, $F5, $3C, $EA, $3C, $DF
DATA_08D276:         db $3C, $D4, $3C, $C9, $3C, $BE, $3C, $B3
DATA_08D27E:         db $3C, $A8, $3C, $9D, $3C, $93, $3C, $88
DATA_08D286:         db $3C, $7D, $3C, $72, $3C, $67, $3C, $5C
DATA_08D28E:         db $3C, $51, $3C, $46, $3C, $3C, $3C, $31
DATA_08D296:         db $3C, $26, $3C, $1B, $3C, $11, $3C, $06
DATA_08D29E:         db $3C, $FB, $3B, $F0, $3B, $E6, $3B, $DB
DATA_08D2A6:         db $3B, $D0, $3B, $C6, $3B, $BB, $3B, $B1
DATA_08D2AE:         db $3B, $A6, $3B, $9B, $3B, $91, $3B, $86
DATA_08D2B6:         db $3B, $7C, $3B, $71, $3B, $67, $3B, $5C
DATA_08D2BE:         db $3B, $52, $3B, $47, $3B, $3D, $3B, $32
DATA_08D2C6:         db $3B, $28, $3B, $1E, $3B, $13, $3B, $09
DATA_08D2CE:         db $3B, $FE, $3A, $F4, $3A, $EA, $3A, $DF
DATA_08D2D6:         db $3A, $D5, $3A, $CB, $3A, $C0, $3A, $B6
DATA_08D2DE:         db $3A, $AC, $3A, $A2, $3A, $98, $3A, $8D
DATA_08D2E6:         db $3A, $83, $3A, $79, $3A, $6F, $3A, $65
DATA_08D2EE:         db $3A, $5A, $3A, $60

CODE_08D2F2:         cache              ;
CODE_08D2F3:         move  r13,r15      ;
CODE_08D2F5:         stw   (r1)         ;
CODE_08D2F6:         inc   r1           ;
CODE_08D2F7:         loop               ;
CODE_08D2F8:         inc   r1           ;
CODE_08D2F9:         stop               ;
CODE_08D2FA:         nop                ;

CODE_08D2FB:         iwt   r0,#0200     ;
CODE_08D2FE:         sub   r3           ;
CODE_08D2FF:         to r5              ;
CODE_08D300:         sub   r3           ;
CODE_08D301:         cache              ;
CODE_08D302:         iwt   r13,#D307    ;
CODE_08D305:         move  r12,r3       ;
CODE_08D307:         ldw   (r1)         ;
CODE_08D308:         stw   (r2)         ;
CODE_08D309:         inc   r1           ;
CODE_08D30A:         inc   r1           ;
CODE_08D30B:         inc   r2           ;
CODE_08D30C:         loop               ;
CODE_08D30D:         inc   r2           ;
CODE_08D30E:         with r1            ;
CODE_08D30F:         add   r5           ;
CODE_08D310:         dec   r4           ;
CODE_08D311:         bne CODE_08D306    ;
CODE_08D313:         move  r12,r3       ;
CODE_08D315:         stop               ;
CODE_08D316:         nop                ;

CODE_08D317:         romb               ;
CODE_08D319:         cache              ;
CODE_08D31A:         lm    r0,(0002)    ;
CODE_08D31E:         add   r0           ;
CODE_08D31F:         mult  #08          ;
CODE_08D321:         lm    r1,(0000)    ;
CODE_08D325:         add   r1           ;
CODE_08D326:         mult  #04          ;
CODE_08D328:         iwt   r1,#5800     ;
CODE_08D32B:         to r1              ;
CODE_08D32C:         add   r1           ;
CODE_08D32D:         iwt   r0,#0200     ;
CODE_08D330:         move  r2,r1        ;
CODE_08D332:         to r3              ;
CODE_08D333:         add   r2           ;
CODE_08D334:         to r4              ;
CODE_08D335:         add   r3           ;
CODE_08D336:         to r5              ;
CODE_08D337:         add   r4           ;
CODE_08D338:         sub   r0           ;
CODE_08D339:         iwt   r12,#0040    ;
CODE_08D33C:         move  r13,r15      ;
CODE_08D33E:         stw   (r2)         ;
CODE_08D33F:         inc   r2           ;
CODE_08D340:         inc   r2           ;
CODE_08D341:         stw   (r3)         ;
CODE_08D342:         inc   r3           ;
CODE_08D343:         inc   r3           ;
CODE_08D344:         stw   (r4)         ;
CODE_08D345:         inc   r4           ;
CODE_08D346:         inc   r4           ;
CODE_08D347:         stw   (r5)         ;
CODE_08D348:         inc   r5           ;
CODE_08D349:         loop               ;
CODE_08D34A:         inc   r5           ;
CODE_08D34B:         ibt   r0,#0008     ;
CODE_08D34D:         romb               ;
CODE_08D34F:         iwt   r1,#AB9A     ;
CODE_08D352:         iwt   r2,#2200     ;
CODE_08D355:         from r10           ;
CODE_08D356:         add   r10          ;
CODE_08D357:         to r14             ;
CODE_08D358:         add   r1           ;
CODE_08D359:         getb               ;
CODE_08D35A:         inc   r14          ;
CODE_08D35B:         getbh              ;
CODE_08D35D:         add   r0           ;
CODE_08D35E:         add   r2           ;
CODE_08D35F:         to r6              ;
CODE_08D360:         ldw   (r0)         ;
CODE_08D361:         from r9            ;
CODE_08D362:         lsr                ;
CODE_08D363:         bcc CODE_08D368    ;
CODE_08D365:         sub   r0           ;
CODE_08D366:         or    #04          ;
CODE_08D368:         cmode              ;
CODE_08D36A:         from r11           ;
CODE_08D36B:         romb               ;
CODE_08D36D:         iwt   r11,#0100    ;
CODE_08D370:         iwt   r13,#D387    ;
CODE_08D373:         lm    r2,(0002)    ;
CODE_08D377:         iwt   r0,#001F     ;
CODE_08D37A:         to r2              ;
CODE_08D37B:         add   r2           ;
CODE_08D37C:         iwt   r7,#1F00     ;
CODE_08D37F:         lm    r1,(0000)    ;
CODE_08D383:         ibt   r8,#0000     ;
CODE_08D385:         ibt   r12,#0010    ;
CODE_08D387:         merge              ;
CODE_08D388:         to r14             ;
CODE_08D389:         add   r9           ;
CODE_08D38A:         lob                ;
CODE_08D38B:         bic   #0F          ;
CODE_08D38D:         bne CODE_08D394    ;
CODE_08D38F:         getc               ;
CODE_08D390:         with r8            ;
CODE_08D391:         add   r6           ;
CODE_08D392:         loop               ;
CODE_08D393:         plot               ;
CODE_08D394:         dec   r1           ;
CODE_08D395:         ibt   r0,#0011     ;
CODE_08D397:         color              ;
CODE_08D398:         from r10           ;
CODE_08D399:         lsr                ;
CODE_08D39A:         lsr                ;
CODE_08D39B:         lsr                ;
CODE_08D39C:         lsr                ;
CODE_08D39D:         not                ;
CODE_08D39E:         and   #03          ;
CODE_08D3A0:         with r15           ;
CODE_08D3A1:         add   r0           ;
CODE_08D3A2:         plot               ;
CODE_08D3A3:         plot               ;
CODE_08D3A4:         plot               ;
CODE_08D3A5:         with r7            ;
CODE_08D3A6:         sub   r11          ;
CODE_08D3A7:         bpl CODE_08D37F    ;
CODE_08D3A9:         dec   r2           ;
CODE_08D3AA:         rpix               ;
CODE_08D3AC:         stop               ;
CODE_08D3AD:         nop                ;

DATA_08D3AE:         db $44, $54, $45, $55, $45, $54, $44, $54
DATA_08D3B6:         db $45, $55, $45, $54, $44, $54, $45, $55
DATA_08D3BE:         db $45, $54, $44, $55, $55, $55, $55, $55
DATA_08D3C6:         db $55, $55, $55, $55, $55, $55, $55, $55
DATA_08D3CE:         db $55, $45, $45, $45, $45, $45, $45, $45
DATA_08D3D6:         db $45, $45, $45, $45, $45, $45, $45, $54
DATA_08D3DE:         db $54, $54, $54, $54, $54, $54, $54, $54
DATA_08D3E6:         db $54, $54, $54, $54, $54, $44, $44, $44
DATA_08D3EE:         db $44, $44, $44, $44, $44, $44, $44, $44
DATA_08D3F6:         db $44, $44, $44

CODE_08D3F9:         iwt   r0,#D3AE     ;
CODE_08D3FC:         to r7              ;
CODE_08D3FD:         add   r4           ;
CODE_08D3FE:         iwt   r0,#1400     ;
CODE_08D401:         add   r1           ;
CODE_08D402:         ldw   (r0)         ;
CODE_08D403:         swap               ;
CODE_08D404:         add   r0           ;
CODE_08D405:         add   r0           ;
CODE_08D406:         add   r0           ;
CODE_08D407:         add   r0           ;
CODE_08D408:         to r11             ;
CODE_08D409:         add   r0           ;
CODE_08D40A:         iwt   r0,#1680     ;
CODE_08D40D:         add   r1           ;
CODE_08D40E:         ldw   (r0)         ;
CODE_08D40F:         to r4              ;
CODE_08D410:         add   #08          ;
CODE_08D412:         iwt   r0,#1682     ;
CODE_08D415:         add   r1           ;
CODE_08D416:         ldw   (r0)         ;
CODE_08D417:         to r5              ;
CODE_08D418:         add   #08          ;
CODE_08D41A:         with r6            ;
CODE_08D41B:         swap               ;
CODE_08D41C:         iwt   r8,#AB98     ;
CODE_08D41F:         iwt   r9,#AC18     ;
CODE_08D422:         iwt   r10,#1249    ;
CODE_08D425:         with r2            ;
CODE_08D426:         swap               ;
CODE_08D427:         ibt   r0,#0008     ;
CODE_08D429:         romb               ;
CODE_08D42B:         cache              ;
CODE_08D42C:         ibt   r12,#000E    ;
CODE_08D42E:         move  r13,r15      ;
CODE_08D430:         from r2            ;
CODE_08D431:         hib                ;
CODE_08D432:         add   r0           ;
CODE_08D433:         move  r1,r0        ;
CODE_08D435:         to r14             ;
CODE_08D436:         add   r9           ;
CODE_08D437:         getb               ;
CODE_08D438:         inc   r14          ;
CODE_08D439:         getbh              ;
CODE_08D43B:         fmult              ;
CODE_08D43C:         div2               ;
CODE_08D43E:         add   r4           ;
CODE_08D43F:         stw   (r3)         ;
CODE_08D440:         inc   r3           ;
CODE_08D441:         inc   r3           ;
CODE_08D442:         from r1            ;
CODE_08D443:         to r14             ;
CODE_08D444:         add   r8           ;
CODE_08D445:         getb               ;
CODE_08D446:         inc   r14          ;
CODE_08D447:         getbh              ;
CODE_08D449:         move  r14,r7       ;
CODE_08D44B:         fmult              ;
CODE_08D44C:         add   r5           ;
CODE_08D44D:         stw   (r3)         ;
CODE_08D44E:         inc   r3           ;
CODE_08D44F:         inc   r3           ;
CODE_08D450:         getb               ;
CODE_08D451:         stb   (r3)         ;
CODE_08D453:         inc   r3           ;
CODE_08D454:         ibt   r0,#0036     ;
CODE_08D456:         stb   (r3)         ;
CODE_08D458:         inc   r3           ;
CODE_08D459:         from r2            ;
CODE_08D45A:         lsr                ;
CODE_08D45B:         iwt   r1,#4000     ;
CODE_08D45E:         and   r1           ;
CODE_08D45F:         xor   r11          ;
CODE_08D461:         stw   (r3)         ;
CODE_08D462:         inc   r3           ;
CODE_08D463:         inc   r3           ;
CODE_08D464:         with r2            ;
CODE_08D465:         add   r10          ;
CODE_08D466:         loop               ;
CODE_08D467:         inc   r7           ;
CODE_08D468:         stop               ;
CODE_08D469:         nop                ;

CODE_08D46A:         ibt   r0,#0070     ;
CODE_08D46C:         ramb               ;
CODE_08D46E:         iwt   r1,#3372     ;
CODE_08D471:         iwt   r2,#3516     ;
CODE_08D474:         ibt   r0,#FFF7     ;
CODE_08D476:         iwt   r12,#00D2    ;
CODE_08D479:         cache              ;
CODE_08D47A:         move  r13,r15      ;
CODE_08D47C:         stw   (r1)         ;
CODE_08D47D:         stw   (r2)         ;
CODE_08D47E:         inc   r1           ;
CODE_08D47F:         inc   r1           ;
CODE_08D480:         inc   r2           ;
CODE_08D481:         inc   r2           ;
CODE_08D482:         loop               ;
CODE_08D483:         dec   r0           ;
CODE_08D484:         stop               ;
CODE_08D485:         nop                ;

CODE_08D486:         sms   (0040),r1    ;
CODE_08D489:         iwt   r0,#00F0     ;
CODE_08D48C:         to r5              ;
CODE_08D48D:         add   r0           ;
CODE_08D48E:         add   r1           ;
CODE_08D48F:         sub   r5           ;
CODE_08D490:         bcc CODE_08D495    ;
CODE_08D492:         nop                ;
CODE_08D493:         stop               ;
CODE_08D494:         nop                ;

CODE_08D495:         ibt   r0,#0008     ;
CODE_08D497:         romb               ;
CODE_08D499:         iwt   r0,#AB98     ;
CODE_08D49C:         add   r4           ;
CODE_08D49D:         to r14             ;
CODE_08D49E:         add   r4           ;
CODE_08D49F:         getb               ;
CODE_08D4A0:         inc   r14          ;
CODE_08D4A1:         getbh              ;
CODE_08D4A3:         move  r7,r0        ;
CODE_08D4A5:         iwt   r0,#AC18     ;
CODE_08D4A8:         add   r4           ;
CODE_08D4A9:         to r14             ;
CODE_08D4AA:         add   r4           ;
CODE_08D4AB:         getb               ;
CODE_08D4AC:         inc   r14          ;
CODE_08D4AD:         getbh              ;
CODE_08D4AF:         move  r8,r0        ;
CODE_08D4B1:         sms   (0048),r4    ;
CODE_08D4B4:         from r12           ;
CODE_08D4B5:         romb               ;
CODE_08D4B7:         move  r14,r13      ;
CODE_08D4B9:         to r12             ;
CODE_08D4BA:         getb               ;
CODE_08D4BB:         inc   r14          ;
CODE_08D4BC:         sms   (0058),r12   ;
CODE_08D4BF:         iwt   r1,#2200     ;
CODE_08D4C2:         ibt   r5,#0000     ;
CODE_08D4C4:         cache              ;
CODE_08D4C5:         move  r13,r15      ;
CODE_08D4C7:         getbs              ;
CODE_08D4C9:         inc   r14          ;
CODE_08D4CA:         move  r9,r0        ;
CODE_08D4CC:         move  r6,r7        ;
CODE_08D4CE:         lmult              ;
CODE_08D4D0:         move  r10,r4       ;
CODE_08D4D2:         getbs              ;
CODE_08D4D4:         inc   r14          ;
CODE_08D4D5:         move  r11,r0       ;
CODE_08D4D7:         move  r6,r8        ;
CODE_08D4D9:         lmult              ;
CODE_08D4DB:         from r10           ;
CODE_08D4DC:         add   r4           ;
CODE_08D4DD:         hib                ;
CODE_08D4DE:         sex                ;
CODE_08D4DF:         add   r3           ;
CODE_08D4E0:         add   r0           ;
CODE_08D4E1:         add   r1           ;
CODE_08D4E2:         to r10             ;
CODE_08D4E3:         ldw   (r0)         ;
CODE_08D4E4:         from r9            ;
CODE_08D4E5:         lmult              ;
CODE_08D4E7:         move  r9,r4        ;
CODE_08D4E9:         move  r6,r7        ;
CODE_08D4EB:         from r11           ;
CODE_08D4EC:         lmult              ;
CODE_08D4EE:         from r4            ;
CODE_08D4EF:         sub   r9           ;
CODE_08D4F0:         hib                ;
CODE_08D4F1:         sex                ;
CODE_08D4F2:         move  r6,r10       ;
CODE_08D4F4:         swap               ;
CODE_08D4F5:         fmult              ;
CODE_08D4F6:         add   r2           ;
CODE_08D4F7:         stw   (r5)         ;
CODE_08D4F8:         inc   r5           ;
CODE_08D4F9:         inc   r5           ;
CODE_08D4FA:         getb               ;
CODE_08D4FB:         inc   r14          ;
CODE_08D4FC:         swap               ;
CODE_08D4FD:         fmult              ;
CODE_08D4FE:         adc   #00          ;
CODE_08D500:         stw   (r5)         ;
CODE_08D501:         inc   r5           ;
CODE_08D502:         loop               ;
CODE_08D503:         inc   r5           ;
CODE_08D504:         to r1              ;
CODE_08D505:         getb               ;
CODE_08D506:         inc   r14          ;
CODE_08D507:         iwt   r11,#2200    ;
CODE_08D50A:         to r2              ;
CODE_08D50B:         getb               ;
CODE_08D50C:         inc   r14          ;
CODE_08D50D:         getb               ;
CODE_08D50E:         inc   r14          ;
CODE_08D50F:         add   r0           ;
CODE_08D510:         to r8              ;
CODE_08D511:         add   r0           ;
CODE_08D512:         getb               ;
CODE_08D513:         inc   r14          ;
CODE_08D514:         add   r0           ;
CODE_08D515:         to r9              ;
CODE_08D516:         add   r0           ;
CODE_08D517:         to r3              ;
CODE_08D518:         ldw   (r8)         ;
CODE_08D519:         ldw   (r9)         ;
CODE_08D51A:         sub   r3           ;
CODE_08D51B:         bpl CODE_08D522    ;
CODE_08D51D:         inc   r0           ;
CODE_08D51E:         iwt   r15,#D578    ;
CODE_08D521:         dec   r1           ;
CODE_08D522:         sms   (0054),r0    ;
CODE_08D525:         inc   r8           ;
CODE_08D526:         inc   r8           ;
CODE_08D527:         to r7              ;
CODE_08D528:         ldw   (r8)         ;
CODE_08D529:         inc   r9           ;
CODE_08D52A:         inc   r9           ;
CODE_08D52B:         to r8              ;
CODE_08D52C:         ldw   (r9)         ;
CODE_08D52D:         sms   (0056),r11   ;
CODE_08D530:         lms   r12,(0054)   ;
CODE_08D533:         from r12           ;
CODE_08D534:         add   r12          ;
CODE_08D535:         add   r11          ;
CODE_08D536:         ldw   (r0)         ;
CODE_08D537:         to r6              ;
CODE_08D538:         lsr                ;
CODE_08D539:         from r8            ;
CODE_08D53A:         sub   r7           ;
CODE_08D53B:         lob                ;
CODE_08D53C:         swap               ;
CODE_08D53D:         fmult              ;
CODE_08D53E:         to r8              ;
CODE_08D53F:         rol                ;
CODE_08D540:         iwt   r4,#0080     ;
CODE_08D543:         iwt   r0,#3372     ;
CODE_08D546:         add   r3           ;
CODE_08D547:         to r10             ;
CODE_08D548:         add   r3           ;
CODE_08D549:         iwt   r9,#00D2     ;
CODE_08D54C:         iwt   r0,#3516     ;
CODE_08D54F:         add   r3           ;
CODE_08D550:         to r11             ;
CODE_08D551:         add   r3           ;
CODE_08D552:         from r2            ;
CODE_08D553:         swap               ;
CODE_08D554:         to r2              ;
CODE_08D555:         lsr                ;
CODE_08D556:         move  r13,r15      ;
CODE_08D558:         moves r0,r3        ;
CODE_08D55A:         bmi CODE_08D569    ;
CODE_08D55C:         sub   r9           ;
CODE_08D55D:         bpl CODE_08D577    ;
CODE_08D55F:         from r2            ;
CODE_08D560:         sub   r3           ;
CODE_08D561:         add   r7           ;
CODE_08D562:         sub   #08          ;
CODE_08D564:         stw   (r10)        ;
CODE_08D565:         lms   r0,(0040)    ;
CODE_08D568:         stw   (r11)        ;
CODE_08D569:         from r4            ;
CODE_08D56A:         add   r8           ;
CODE_08D56B:         to r4              ;
CODE_08D56C:         lob                ;
CODE_08D56D:         hib                ;
CODE_08D56E:         sex                ;
CODE_08D56F:         to r7              ;
CODE_08D570:         add   r7           ;
CODE_08D571:         inc   r10          ;
CODE_08D572:         inc   r10          ;
CODE_08D573:         inc   r11          ;
CODE_08D574:         inc   r11          ;
CODE_08D575:         loop               ;
CODE_08D576:         inc   r3           ;
CODE_08D577:         dec   r1           ;
CODE_08D578:         beq CODE_08D582    ;
CODE_08D57A:         nop                ;
CODE_08D57B:         lms   r11,(0056)   ;
CODE_08D57E:         iwt   r15,#D50B    ;
CODE_08D581:         to r2              ;
CODE_08D582:         stop               ;
CODE_08D583:         nop                ;

CODE_08D584:         ibt   r0,#0005     ;
CODE_08D586:         cmode              ;
CODE_08D588:         ibt   r0,#0055     ;
CODE_08D58A:         romb               ;
CODE_08D58C:         iwt   r3,#0040     ;
CODE_08D58F:         cache              ;
CODE_08D590:         ibt   r5,#0009     ;
CODE_08D592:         move  r9,r2        ;
CODE_08D594:         iwt   r13,#D5A4    ;
CODE_08D597:         ibt   r10,#0020    ;
CODE_08D599:         lms   r1,(0000)    ;
CODE_08D59C:         with r8            ;
CODE_08D59D:         sub   r8           ;
CODE_08D59E:         move  r6,r8        ;
CODE_08D5A0:         move  r11,r8       ;
CODE_08D5A2:         ibt   r12,#0020    ;
CODE_08D5A4:         from r9            ;
CODE_08D5A5:         to r7              ;
CODE_08D5A6:         sub   r11          ;
CODE_08D5A7:         merge              ;
CODE_08D5A8:         bcc CODE_08D5C0    ;
CODE_08D5AA:         to r14             ;
CODE_08D5AB:         dec   r5           ;
CODE_08D5AC:         bne CODE_08D5B3    ;
CODE_08D5AE:         with r4            ;
CODE_08D5AF:         not                ;
CODE_08D5B0:         inc   r4           ;
CODE_08D5B1:         ibt   r5,#0010     ;
CODE_08D5B3:         with r6            ;
CODE_08D5B4:         add   r4           ;
CODE_08D5B5:         with r11           ;
CODE_08D5B6:         add   r6           ;
CODE_08D5B7:         iwt   r0,#0100     ;
CODE_08D5BA:         with r8            ;
CODE_08D5BB:         add   r0           ;
CODE_08D5BC:         sub   r0           ;
CODE_08D5BD:         bra CODE_08D5D3    ;

CODE_08D5BF:         color              ;

CODE_08D5C0:         add   r3           ;
CODE_08D5C1:         dec   r5           ;
CODE_08D5C2:         bne CODE_08D5C9    ;
CODE_08D5C4:         with r4            ;
CODE_08D5C5:         not                ;
CODE_08D5C6:         inc   r4           ;
CODE_08D5C7:         ibt   r5,#0010     ;
CODE_08D5C9:         with r6            ;
CODE_08D5CA:         add   r4           ;
CODE_08D5CB:         with r11           ;
CODE_08D5CC:         add   r6           ;
CODE_08D5CD:         iwt   r0,#0100     ;
CODE_08D5D0:         with r8            ;
CODE_08D5D1:         add   r0           ;
CODE_08D5D2:         getc               ;
CODE_08D5D3:         loop               ;
CODE_08D5D4:         plot               ;
CODE_08D5D5:         with r9            ;
CODE_08D5D6:         add   r0           ;
CODE_08D5D7:         iwt   r6,#00F0     ;
CODE_08D5DA:         from r4            ;
CODE_08D5DB:         lmult              ;
CODE_08D5DD:         with r4            ;
CODE_08D5DE:         hib                ;
CODE_08D5DF:         ibt   r0,#000F     ;
CODE_08D5E1:         from r4            ;
CODE_08D5E2:         cmp   r0           ;
CODE_08D5E4:         bpl CODE_08D5E9    ;
CODE_08D5E6:         nop                ;
CODE_08D5E7:         ibt   r4,#0000     ;
CODE_08D5E9:         dec   r10          ;
CODE_08D5EA:         bne CODE_08D599    ;
CODE_08D5EC:         inc   r2           ;
CODE_08D5ED:         rpix               ;
CODE_08D5EF:         stop               ;
CODE_08D5F0:         nop                ;

CODE_08D5F1:         to r11             ;
CODE_08D5F2:         fmult              ;
CODE_08D5F3:         ibt   r0,#0008     ;
CODE_08D5F5:         romb               ;
CODE_08D5F7:         iwt   r8,#AE58     ;
CODE_08D5FA:         from r1            ;
CODE_08D5FB:         to r14             ;
CODE_08D5FC:         add   r8           ;
CODE_08D5FD:         iwt   r8,#AE18     ;
CODE_08D600:         from r1            ;
CODE_08D601:         to r10             ;
CODE_08D602:         add   r8           ;
CODE_08D603:         getbs              ;
CODE_08D605:         move  r14,r10      ;
CODE_08D607:         mult  r11          ;
CODE_08D608:         add   r0           ;
CODE_08D609:         add   r0           ;
CODE_08D60A:         hib                ;
CODE_08D60B:         sex                ;
CODE_08D60C:         not                ;
CODE_08D60D:         inc   r0           ;
CODE_08D60E:         sms   (0020),r0    ;
CODE_08D611:         getbs              ;
CODE_08D613:         mult  r11          ;
CODE_08D614:         add   r0           ;
CODE_08D615:         add   r0           ;
CODE_08D616:         hib                ;
CODE_08D617:         sex                ;
CODE_08D618:         add   #04          ;
CODE_08D61A:         moves r7,r7        ;
CODE_08D61C:         bne CODE_08D621    ;
CODE_08D61E:         nop                ;
CODE_08D61F:         not                ;
CODE_08D620:         inc   r0           ;
CODE_08D621:         add   #08          ;
CODE_08D623:         sms   (0022),r0    ;
CODE_08D626:         move  r6,r4        ;
CODE_08D628:         iwt   r15,#8205    ;
CODE_08D62B:         nop                ;
CODE_08D62C:         from r11           ;
CODE_08D62D:         fmult              ;
CODE_08D62E:         sms   (0020),r0    ;
CODE_08D631:         moves r7,r7        ;
CODE_08D633:         bne CODE_08D638    ;
CODE_08D635:         with r4            ;
CODE_08D636:         stop               ;
CODE_08D637:         nop                ;
CODE_08D638:         moves r10,r10      ;
CODE_08D63B:         bne CODE_08D642    ;
CODE_08D63D:         iwt   r15,#82FA    ;
CODE_08D640:         nop                ;
CODE_08D641:         iwt   r15,#8295    ;
CODE_08D644:         nop                ;
CODE_08D645:         from r4            ;
CODE_08D646:         fmult              ;
CODE_08D647:         lob                ;
CODE_08D648:         to r6              ;
CODE_08D649:         swap               ;
CODE_08D64A:         ibt   r0,#0008     ;
CODE_08D64C:         romb               ;
CODE_08D64E:         iwt   r1,#AC18     ;
CODE_08D651:         from r11           ;
CODE_08D652:         to r14             ;
CODE_08D653:         add   r1           ;
CODE_08D654:         iwt   r1,#AB98     ;
CODE_08D657:         from r11           ;
CODE_08D658:         to r10             ;
CODE_08D659:         add   r1           ;
CODE_08D65A:         getb               ;
CODE_08D65B:         inc   r14          ;
CODE_08D65C:         getbh              ;
CODE_08D65E:         to r8              ;
CODE_08D65F:         fmult              ;
CODE_08D660:         move  r14,r10      ;
CODE_08D662:         getb               ;
CODE_08D663:         inc   r14          ;
CODE_08D664:         getbh              ;
CODE_08D666:         fmult              ;
CODE_08D667:         moves r9,r9        ;
CODE_08D669:         beq CODE_08D66E    ;
CODE_08D66B:         nop                ;
CODE_08D66C:         not                ;
CODE_08D66D:         inc   r0           ;
CODE_08D66E:         sms   (0020),r0    ;
CODE_08D671:         sms   (0022),r8    ;
CODE_08D674:         move  r6,r4        ;
CODE_08D676:         iwt   r15,#8205    ;
CODE_08D679:         nop                ;
CODE_08D67A:         from r4            ;
CODE_08D67B:         fmult              ;
CODE_08D67C:         move  r10,r0       ;
CODE_08D67E:         to r11             ;
CODE_08D67F:         add   r0           ;
CODE_08D680:         with r1            ;
CODE_08D681:         sub   r1           ;
CODE_08D682:         from r7            ;
CODE_08D683:         add   r10          ;
CODE_08D684:         cmp   r11          ;
CODE_08D686:         bcs CODE_08D696    ;
CODE_08D688:         from r8            ;
CODE_08D689:         add   r10          ;
CODE_08D68A:         cmp   r11          ;
CODE_08D68C:         bcs CODE_08D696    ;
CODE_08D68E:         nop                ;
CODE_08D68F:         inc   r1           ;
CODE_08D690:         moves r9,r9        ;
CODE_08D692:         bne CODE_08D696    ;
CODE_08D694:         nop                ;
CODE_08D695:         inc   r1           ;
CODE_08D696:         sms   (0020),r1    ;
CODE_08D699:         move  r6,r4        ;
CODE_08D69B:         iwt   r15,#8205    ;
CODE_08D69E:         nop                ;
CODE_08D69F:         from r4            ;
CODE_08D6A0:         to r11             ;
CODE_08D6A1:         fmult              ;
CODE_08D6A2:         move  r6,r10       ;
CODE_08D6A4:         from r4            ;
CODE_08D6A5:         fmult              ;
CODE_08D6A6:         add   r1           ;
CODE_08D6A7:         sms   (0024),r0    ;
CODE_08D6AA:         add   r0           ;
CODE_08D6AB:         sms   (0026),r0    ;
CODE_08D6AE:         from r4            ;
CODE_08D6AF:         fmult              ;
CODE_08D6B0:         add   r8           ;
CODE_08D6B1:         sms   (0028),r0    ;
CODE_08D6B4:         add   r0           ;
CODE_08D6B5:         sms   (002A),r0    ;
CODE_08D6B8:         ibt   r0,#0008     ;
CODE_08D6BA:         romb               ;
CODE_08D6BC:         iwt   r1,#AE58     ;
CODE_08D6BF:         from r5            ;
CODE_08D6C0:         to r14             ;
CODE_08D6C1:         add   r1           ;
CODE_08D6C2:         iwt   r1,#AE18     ;
CODE_08D6C5:         from r5            ;
CODE_08D6C6:         to r10             ;
CODE_08D6C7:         add   r1           ;
CODE_08D6C8:         getbs              ;
CODE_08D6CA:         move  r14,r10      ;
CODE_08D6CC:         mult  r11          ;
CODE_08D6CD:         add   r0           ;
CODE_08D6CE:         add   r0           ;
CODE_08D6CF:         hib                ;
CODE_08D6D0:         sex                ;
CODE_08D6D1:         sms   (0020),r0    ;
CODE_08D6D4:         getbs              ;
CODE_08D6D6:         mult  r11          ;
CODE_08D6D7:         add   r0           ;
CODE_08D6D8:         add   r0           ;
CODE_08D6D9:         hib                ;
CODE_08D6DA:         sex                ;
CODE_08D6DB:         moves r7,r7        ;
CODE_08D6DD:         beq CODE_08D6E2    ;
CODE_08D6DF:         nop                ;
CODE_08D6E0:         not                ;
CODE_08D6E1:         inc   r0           ;
CODE_08D6E2:         sms   (0022),r0    ;
CODE_08D6E5:         move  r6,r4        ;
CODE_08D6E7:         iwt   r15,#835F    ;
CODE_08D6EA:         nop                ;
CODE_08D6EB:         ibt   r0,#0008     ;
CODE_08D6ED:         romb               ;
CODE_08D6EF:         iwt   r1,#AE58     ;
CODE_08D6F2:         from r5            ;
CODE_08D6F3:         to r14             ;
CODE_08D6F4:         add   r1           ;
CODE_08D6F5:         iwt   r1,#AE18     ;
CODE_08D6F8:         from r5            ;
CODE_08D6F9:         to r11             ;
CODE_08D6FA:         add   r1           ;
CODE_08D6FB:         to r7              ;
CODE_08D6FC:         getbs              ;
CODE_08D6FE:         from r9            ;
CODE_08D6FF:         mult  r7           ;
CODE_08D700:         add   r0           ;
CODE_08D701:         add   r0           ;
CODE_08D702:         hib                ;
CODE_08D703:         to r1              ;
CODE_08D704:         sex                ;
CODE_08D705:         ibt   r0,#FF80     ;
CODE_08D707:         mult  r7           ;
CODE_08D708:         add   r0           ;
CODE_08D709:         add   r0           ;
CODE_08D70A:         hib                ;
CODE_08D70B:         sex                ;
CODE_08D70C:         add   r0           ;
CODE_08D70D:         add   r0           ;
CODE_08D70E:         sms   (0024),r0    ;
CODE_08D711:         from r10           ;
CODE_08D712:         mult  r7           ;
CODE_08D713:         add   r0           ;
CODE_08D714:         add   r0           ;
CODE_08D715:         hib                ;
CODE_08D716:         to r7              ;
CODE_08D717:         sex                ;
CODE_08D718:         move  r14,r11      ;
CODE_08D71A:         to r8              ;
CODE_08D71B:         getbs              ;
CODE_08D71D:         from r9            ;
CODE_08D71E:         mult  r8           ;
CODE_08D71F:         add   r0           ;
CODE_08D720:         add   r0           ;
CODE_08D721:         hib                ;
CODE_08D722:         to r9              ;
CODE_08D723:         sex                ;
CODE_08D724:         ibt   r0,#FF80     ;
CODE_08D726:         mult  r8           ;
CODE_08D727:         add   r0           ;
CODE_08D728:         add   r0           ;
CODE_08D729:         hib                ;
CODE_08D72A:         sex                ;
CODE_08D72B:         add   r0           ;
CODE_08D72C:         add   r0           ;
CODE_08D72D:         moves r4,r4        ;
CODE_08D72F:         beq CODE_08D734    ;
CODE_08D731:         nop                ;
CODE_08D732:         not                ;
CODE_08D733:         inc   r0           ;
CODE_08D734:         sms   (0026),r0    ;
CODE_08D737:         from r10           ;
CODE_08D738:         mult  r8           ;
CODE_08D739:         add   r0           ;
CODE_08D73A:         add   r0           ;
CODE_08D73B:         hib                ;
CODE_08D73C:         to r8              ;
CODE_08D73D:         sex                ;
CODE_08D73E:         from r9            ;
CODE_08D73F:         sub   r7           ;
CODE_08D740:         moves r4,r4        ;
CODE_08D742:         beq CODE_08D747    ;
CODE_08D744:         nop                ;
CODE_08D745:         not                ;
CODE_08D746:         inc   r0           ;
CODE_08D747:         sms   (0022),r0    ;
CODE_08D74A:         from r1            ;
CODE_08D74B:         add   r8           ;
CODE_08D74C:         sms   (0020),r0    ;
CODE_08D74F:         move  r11,r6       ;
CODE_08D751:         iwt   r6,#1000     ;
CODE_08D754:         from r11           ;
CODE_08D755:         fmult              ;
CODE_08D756:         sms   (0028),r0    ;
CODE_08D759:         add   r0           ;
CODE_08D75A:         sms   (002A),r0    ;
CODE_08D75D:         iwt   r6,#0800     ;
CODE_08D760:         from r11           ;
CODE_08D761:         fmult              ;
CODE_08D762:         sms   (002C),r0    ;
CODE_08D765:         move  r6,r11       ;
CODE_08D767:         iwt   r15,#835F    ;
CODE_08D76A:         nop                ;
CODE_08D76B:         from r11           ;
CODE_08D76C:         fmult              ;
CODE_08D76D:         sms   (0020),r0    ;
CODE_08D770:         move  r6,r4        ;
CODE_08D772:         iwt   r15,#82FA    ;
CODE_08D775:         nop                ;
CODE_08D776:         ibt   r0,#0000     ;
CODE_08D778:         ramb               ;
CODE_08D77A:         with r6            ;
CODE_08D77B:         sub   r6           ;
CODE_08D77C:         with r3            ;
CODE_08D77D:         mult  r3           ;
CODE_08D77E:         from r4            ;
CODE_08D77F:         mult  r4           ;
CODE_08D780:         add   r3           ;
CODE_08D781:         cmp   r5           ;
CODE_08D783:         bmi CODE_08D787    ;
CODE_08D785:         nop                ;
CODE_08D786:         inc   r6           ;
CODE_08D787:         sms   (003C),r6    ;
CODE_08D78A:         ibt   r12,#0004    ;
CODE_08D78C:         iwt   r4,#0020     ;
CODE_08D78F:         iwt   r5,#0028     ;
CODE_08D792:         cache              ;
CODE_08D793:         move  r13,r15      ;
CODE_08D795:         to r6              ;
CODE_08D796:         ldw   (r4)         ;
CODE_08D797:         from r6            ;
CODE_08D798:         sub   r1           ;
CODE_08D799:         bmi CODE_08D7A6    ;
CODE_08D79B:         inc   r4           ;
CODE_08D79C:         cmp   r10          ;
CODE_08D79E:         bmi CODE_08D7B2    ;
CODE_08D7A0:         inc   r4           ;
CODE_08D7A1:         from r1            ;
CODE_08D7A2:         add   r10          ;
CODE_08D7A3:         bra CODE_08D7AF    ;

CODE_08D7A5:         nop                ;

CODE_08D7A6:         not                ;
CODE_08D7A7:         inc   r0           ;
CODE_08D7A8:         cmp   r10          ;
CODE_08D7AA:         bmi CODE_08D7B2    ;
CODE_08D7AC:         inc   r4           ;
CODE_08D7AD:         from r1            ;
CODE_08D7AE:         sub   r10          ;
CODE_08D7AF:         sbk                ;
CODE_08D7B0:         move  r6,r0        ;
CODE_08D7B2:         move  r1,r6        ;
CODE_08D7B4:         to r6              ;
CODE_08D7B5:         ldw   (r5)         ;
CODE_08D7B6:         from r6            ;
CODE_08D7B7:         sub   r2           ;
CODE_08D7B8:         bmi CODE_08D7C6    ;
CODE_08D7BA:         inc   r5           ;
CODE_08D7BB:         from r2            ;
CODE_08D7BC:         add   r10          ;
CODE_08D7BD:         cmp   r9           ;
CODE_08D7BF:         bmi CODE_08D7D6    ;
CODE_08D7C1:         nop                ;
CODE_08D7C2:         with r9            ;
CODE_08D7C3:         with  r9           ;
CODE_08D7C3:         bra CODE_08D7D6    ;

CODE_08D7C5:         to r0              ;
CODE_08D7C6:         not                ;

CODE_08D7C7:         inc   r0           ;
CODE_08D7C8:         cmp   r10          ;
CODE_08D7CA:         bpl CODE_08D7D3    ;
CODE_08D7CC:         from r2            ;
CODE_08D7CD:         inc   r6           ;
CODE_08D7CE:         from r6            ;
CODE_08D7CF:         sbk                ;
CODE_08D7D0:         bra CODE_08D7D9    ;

CODE_08D7D2:         nop                ;
CODE_08D7D3:         sub   r10          ;
CODE_08D7D4:         inc   r0           ;
CODE_08D7D5:         inc   r0           ;
CODE_08D7D6:         sbk                ;
CODE_08D7D7:         move  r6,r0        ;
CODE_08D7D9:         move  r2,r6        ;
CODE_08D7DB:         loop               ;
CODE_08D7DC:         inc   r5           ;
CODE_08D7DD:         lms   r6,(004C)    ;
CODE_08D7E0:         lms   r11,(004C)   ;
CODE_08D7E3:         lms   r5,(004A)    ;
CODE_08D7E6:         lms   r13,(005A)   ;
CODE_08D7E9:         lms   r12,(0058)   ;
CODE_08D7EC:         ibt   r8,#0008     ;
CODE_08D7EE:         move  r9,r8        ;
CODE_08D7F0:         lms   r2,(0044)    ;
CODE_08D7F3:         lms   r3,(0046)    ;
CODE_08D7F6:         iwt   r15,#855F    ;
CODE_08D7F9:         nop                ;
CODE_08D7FA:         ibt   r0,#0000     ;
CODE_08D7FC:         ramb               ;
CODE_08D7FE:         with r6            ;
CODE_08D7FF:         sub   r6           ;
CODE_08D800:         with r3            ;
CODE_08D801:         mult  r3           ;
CODE_08D802:         from r4            ;
CODE_08D803:         mult  r4           ;
CODE_08D804:         add   r3           ;
CODE_08D805:         cmp   r5           ;
CODE_08D807:         bmi CODE_08D80B    ;
CODE_08D809:         nop                ;
CODE_08D80A:         inc   r6           ;
CODE_08D80B:         sms   (003C),r6    ;
CODE_08D80E:         iwt   r4,#0020     ;
CODE_08D811:         iwt   r5,#0028     ;
CODE_08D814:         with r1            ;
CODE_08D815:         add   #04          ;
CODE_08D817:         with r2            ;
CODE_08D818:         add   #04          ;
CODE_08D81A:         from r8            ;
CODE_08D81B:         sub   r1           ;
CODE_08D81C:         div2               ;
CODE_08D81E:         to r7              ;
CODE_08D81F:         div2               ;
CODE_08D821:         with r1            ;
CODE_08D822:         add   r7           ;
CODE_08D823:         from r9            ;
CODE_08D824:         sub   r2           ;
CODE_08D825:         div2               ;
CODE_08D827:         to r8              ;
CODE_08D828:         div2               ;
CODE_08D82A:         with r2            ;
CODE_08D82B:         add   r8           ;
CODE_08D82C:         ibt   r12,#0004    ;
CODE_08D82E:         cache              ;
CODE_08D82F:         move  r13,r15      ;
CODE_08D831:         to r6              ;
CODE_08D832:         ldw   (r4)         ;
CODE_08D833:         from r1            ;
CODE_08D834:         sub   r6           ;
CODE_08D835:         div2               ;
CODE_08D837:         add   r6           ;
CODE_08D838:         sbk                ;
CODE_08D839:         inc   r4           ;
CODE_08D83A:         inc   r4           ;
CODE_08D83B:         to r6              ;
CODE_08D83C:         ldw   (r5)         ;
CODE_08D83D:         from r2            ;
CODE_08D83E:         sub   r6           ;
CODE_08D83F:         div2               ;
CODE_08D841:         add   r6           ;
CODE_08D842:         sbk                ;
CODE_08D843:         with r1            ;
CODE_08D844:         add   r7           ;
CODE_08D845:         with r2            ;
CODE_08D846:         add   r8           ;
CODE_08D847:         inc   r5           ;
CODE_08D848:         loop               ;
CODE_08D849:         inc   r5           ;
CODE_08D84A:         lms   r6,(004C)    ;
CODE_08D84D:         lms   r11,(004C)   ;
CODE_08D850:         lms   r5,(004A)    ;
CODE_08D853:         lms   r13,(005A)   ;
CODE_08D856:         lms   r12,(0058)   ;
CODE_08D859:         lms   r2,(0044)    ;
CODE_08D85C:         lms   r3,(0046)    ;
CODE_08D85F:         lms   r1,(0042)    ;
CODE_08D862:         moves r1,r1        ;
CODE_08D864:         bne CODE_08D86F    ;
CODE_08D866:         nop                ;
CODE_08D867:         ibt   r8,#0008     ;
CODE_08D869:         move  r9,r8        ;
CODE_08D86B:         iwt   r15,#855F    ;
CODE_08D86E:         nop                ;
CODE_08D86F:         ibt   r8,#0010     ;
CODE_08D871:         move  r9,r8        ;
CODE_08D873:         lms   r0,(0040)    ;
CODE_08D876:         moves r0,r0        ;
CODE_08D878:         bne CODE_08D87F    ;
CODE_08D87A:         nop                ;
CODE_08D87B:         iwt   r15,#8293    ;
CODE_08D87E:         nop                ;
CODE_08D87F:         iwt   r15,#8A0F    ;
CODE_08D882:         nop                ;
CODE_08D883:         ibt   r0,#0000     ;
CODE_08D885:         ramb               ;
CODE_08D887:         with r6            ;
CODE_08D888:         sub   r6           ;
CODE_08D889:         with r3            ;
CODE_08D88A:         mult  r3           ;
CODE_08D88B:         from r4            ;
CODE_08D88C:         mult  r4           ;
CODE_08D88D:         add   r3           ;
CODE_08D88E:         cmp   r5           ;
CODE_08D890:         bmi CODE_08D894    ;
CODE_08D892:         nop                ;
CODE_08D893:         inc   r6           ;
CODE_08D894:         sms   (003C),r6    ;
CODE_08D897:         iwt   r4,#0020     ;
CODE_08D89A:         iwt   r5,#0028     ;
CODE_08D89D:         with r1            ;
CODE_08D89E:         add   #04          ;
CODE_08D8A0:         with r2            ;
CODE_08D8A1:         add   #04          ;
CODE_08D8A3:         from r8            ;
CODE_08D8A4:         sub   r1           ;
CODE_08D8A5:         div2               ;
CODE_08D8A7:         to r7              ;
CODE_08D8A8:         div2               ;
CODE_08D8AA:         with r1            ;
CODE_08D8AB:         add   r7           ;
CODE_08D8AC:         from r9            ;
CODE_08D8AD:         sub   r2           ;
CODE_08D8AE:         div2               ;
CODE_08D8B0:         to r8              ;
CODE_08D8B1:         div2               ;
CODE_08D8B3:         with r2            ;
CODE_08D8B4:         add   r8           ;
CODE_08D8B5:         ibt   r12,#0004    ;
CODE_08D8B7:         cache              ;
CODE_08D8B8:         move  r13,r15      ;
CODE_08D8BA:         to r6              ;
CODE_08D8BB:         ldw   (r4)         ;
CODE_08D8BC:         from r1            ;
CODE_08D8BD:         sub   r6           ;
CODE_08D8BE:         div2               ;
CODE_08D8C0:         add   r6           ;
CODE_08D8C1:         sbk                ;
CODE_08D8C2:         inc   r4           ;
CODE_08D8C3:         inc   r4           ;
CODE_08D8C4:         to r6              ;
CODE_08D8C5:         ldw   (r5)         ;
CODE_08D8C6:         from r2            ;
CODE_08D8C7:         sub   r6           ;
CODE_08D8C8:         div2               ;
CODE_08D8CA:         add   r6           ;
CODE_08D8CB:         sbk                ;
CODE_08D8CC:         with r1            ;
CODE_08D8CD:         add   r7           ;
CODE_08D8CE:         with r2            ;
CODE_08D8CF:         add   r8           ;
CODE_08D8D0:         inc   r5           ;
CODE_08D8D1:         loop               ;
CODE_08D8D2:         inc   r5           ;
CODE_08D8D3:         lms   r6,(004C)    ;
CODE_08D8D6:         lms   r11,(004C)   ;
CODE_08D8D9:         lms   r5,(004A)    ;
CODE_08D8DC:         lms   r13,(005A)   ;
CODE_08D8DF:         lms   r12,(0058)   ;
CODE_08D8E2:         ibt   r8,#0008     ;
CODE_08D8E4:         move  r9,r8        ;
CODE_08D8E6:         lms   r2,(0044)    ;
CODE_08D8E9:         lms   r3,(0046)    ;
CODE_08D8EC:         iwt   r15,#855F    ;
CODE_08D8EF:         nop                ;
CODE_08D8F0:         ibt   r0,#0000     ;
CODE_08D8F2:         ramb               ;
CODE_08D8F4:         with r6            ;
CODE_08D8F5:         sub   r6           ;
CODE_08D8F6:         with r3            ;
CODE_08D8F7:         mult  r3           ;
CODE_08D8F8:         from r4            ;
CODE_08D8F9:         mult  r4           ;
CODE_08D8FA:         add   r3           ;
CODE_08D8FB:         cmp   r5           ;
CODE_08D8FD:         bmi CODE_08D901    ;
CODE_08D8FF:         nop                ;
CODE_08D900:         inc   r6           ;
CODE_08D901:         sms   (003C),r6    ;
CODE_08D904:         with r2            ;
CODE_08D905:         add   #04          ;
CODE_08D907:         from r9            ;
CODE_08D908:         sub   r2           ;
CODE_08D909:         div2               ;
CODE_08D90B:         to r8              ;
CODE_08D90C:         div2               ;
CODE_08D90E:         with r2            ;
CODE_08D90F:         add   r8           ;
CODE_08D910:         ibt   r12,#0004    ;
CODE_08D912:         iwt   r4,#0020     ;
CODE_08D915:         iwt   r5,#0028     ;
CODE_08D918:         cache              ;
CODE_08D919:         move  r13,r15      ;
CODE_08D91B:         to r6              ;
CODE_08D91C:         ldw   (r4)         ;
CODE_08D91D:         from r6            ;
CODE_08D91E:         sub   r1           ;
CODE_08D91F:         bmi CODE_08D92C    ;
CODE_08D921:         inc   r4           ;
CODE_08D922:         cmp   r10          ;
CODE_08D924:         bmi CODE_08D938    ;
CODE_08D926:         inc   r4           ;
CODE_08D927:         from r1            ;
CODE_08D928:         add   r10          ;
CODE_08D929:         bra CODE_08D935    ;

CODE_08D92B:         nop                ;

CODE_08D92C:         not                ;
CODE_08D92D:         inc   r0           ;
CODE_08D92E:         cmp   r10          ;
CODE_08D930:         bmi CODE_08D938    ;
CODE_08D932:         inc   r4           ;
CODE_08D933:         from r1            ;
CODE_08D934:         sub   r10          ;
CODE_08D935:         sbk                ;
CODE_08D936:         move  r6,r0        ;
CODE_08D938:         move  r1,r6        ;
CODE_08D93A:         to r6              ;
CODE_08D93B:         ldw   (r5)         ;
CODE_08D93C:         from r2            ;
CODE_08D93D:         sub   r6           ;
CODE_08D93E:         div2               ;
CODE_08D940:         add   r6           ;
CODE_08D941:         sbk                ;
CODE_08D942:         with r2            ;
CODE_08D943:         add   r8           ;
CODE_08D944:         inc   r5           ;
CODE_08D945:         loop               ;
CODE_08D946:         inc   r5           ;
CODE_08D947:         lms   r6,(004C)    ;
CODE_08D94A:         lms   r11,(004C)   ;
CODE_08D94D:         lms   r5,(004A)    ;
CODE_08D950:         lms   r13,(005A)   ;
CODE_08D953:         lms   r12,(0058)   ;
CODE_08D956:         ibt   r8,#0008     ;
CODE_08D958:         move  r9,r8        ;
CODE_08D95A:         lms   r2,(0044)    ;
CODE_08D95D:         lms   r3,(0046)    ;
CODE_08D960:         iwt   r15,#855F    ;
CODE_08D963:         nop                ;

CODE_08D964:         to r7              ;
CODE_08D965:         fmult              ;
CODE_08D966:         iwt   r0,#1BB6     ;
CODE_08D969:         add   r10          ;
CODE_08D96A:         from r7            ;
CODE_08D96B:         stw   (r0)         ;
CODE_08D96C:         iwt   r0,#1BB8     ;
CODE_08D96F:         add   r10          ;
CODE_08D970:         from r7            ;
CODE_08D971:         stw   (r0)         ;
CODE_08D972:         iwt   r0,#F000     ;
CODE_08D975:         fmult              ;
CODE_08D976:         ibt   r7,#0010     ;
CODE_08D978:         to r7              ;
CODE_08D979:         add   r7           ;
CODE_08D97A:         iwt   r0,#1B58     ;
CODE_08D97D:         add   r10          ;
CODE_08D97E:         from r7            ;
CODE_08D97F:         stw   (r0)         ;
CODE_08D980:         iwt   r15,#8293    ;
CODE_08D983:         nop                ;

CODE_08D984:         fmult              ;
CODE_08D985:         sms   (0020),r0    ;
CODE_08D988:         move  r6,r11       ;
CODE_08D98A:         from r1            ;
CODE_08D98B:         fmult              ;
CODE_08D98C:         sms   (0022),r0    ;
CODE_08D98F:         move  r6,r4        ;
CODE_08D991:         iwt   r15,#8295    ;
CODE_08D994:         nop                ;

CODE_08D995:         ibt   r0,#0008     ;
CODE_08D997:         romb               ;
CODE_08D999:         iwt   r0,#DA16     ;
CODE_08D99C:         to r14             ;
CODE_08D99D:         add   r9           ;
CODE_08D99E:         getb               ;
CODE_08D99F:         inc   r14          ;
CODE_08D9A0:         to r8              ;
CODE_08D9A1:         getbh              ;
CODE_08D9A3:         ibt   r3,#0000     ;
CODE_08D9A5:         move  r4,r3        ;
CODE_08D9A7:         move  r5,r3        ;
CODE_08D9A9:         iwt   r13,#D9DB    ;
CODE_08D9AC:         ibt   r7,#000C     ;
CODE_08D9AE:         cache              ;
CODE_08D9AF:         lms   r0,(0000)    ;
CODE_08D9B2:         romb               ;
CODE_08D9B4:         lms   r14,(0002)   ;
CODE_08D9B7:         getb               ;
CODE_08D9B8:         cmode              ;
CODE_08D9BA:         inc   r14          ;
CODE_08D9BB:         sms   (0002),r14   ;
CODE_08D9BE:         ibt   r0,#0008     ;
CODE_08D9C0:         romb               ;
CODE_08D9C2:         move  r14,r8       ;
CODE_08D9C4:         getb               ;
CODE_08D9C5:         inc   r14          ;
CODE_08D9C6:         to r10             ;
CODE_08D9C7:         getbh              ;
CODE_08D9C9:         inc   r14          ;
CODE_08D9CA:         to r11             ;
CODE_08D9CB:         getb               ;
CODE_08D9CC:         ibt   r6,#0003     ;
CODE_08D9CE:         move  r9,r5        ;
CODE_08D9D0:         from r11           ;
CODE_08D9D1:         romb               ;
CODE_08D9D3:         move  r2,r9        ;
CODE_08D9D5:         move  r1,r3        ;
CODE_08D9D7:         ibt   r12,#0018    ;
CODE_08D9D9:         move  r14,r10      ;
CODE_08D9DB:         getc               ;
CODE_08D9DC:         plot               ;
CODE_08D9DD:         ibt   r0,#007F     ;
CODE_08D9DF:         to r1              ;
CODE_08D9E0:         and   r1           ;
CODE_08D9E1:         bne CODE_08D9E6    ;
CODE_08D9E3:         with r2            ;
CODE_08D9E4:         add   #08          ;
CODE_08D9E6:         loop               ;
CODE_08D9E7:         inc   r14          ;
CODE_08D9E8:         iwt   r0,#0100     ;
CODE_08D9EB:         to r10             ;
CODE_08D9EC:         add   r10          ;
CODE_08D9ED:         inc   r9           ;
CODE_08D9EE:         inc   r4           ;
CODE_08D9EF:         with r4            ;
CODE_08D9F0:         and   #07          ;
CODE_08D9F2:         bne CODE_08D9D0    ;
CODE_08D9F4:         nop                ;
CODE_08D9F5:         ibt   r0,#0018     ;
CODE_08D9F7:         to r3              ;
CODE_08D9F8:         add   r3           ;
CODE_08D9F9:         from r3            ;
CODE_08D9FA:         add   r3           ;
CODE_08D9FB:         swap               ;
CODE_08D9FC:         and   #01          ;
CODE_08D9FE:         beq CODE_08DA03    ;
CODE_08DA00:         with r5            ;
CODE_08DA01:         add   #08          ;
CODE_08DA03:         ibt   r0,#007F     ;
CODE_08DA05:         to r3              ;
CODE_08DA06:         and   r3           ;
CODE_08DA07:         dec   r6           ;
CODE_08DA08:         bne CODE_08D9CE    ;
CODE_08DA0A:         nop                ;
CODE_08DA0B:         inc   r8           ;
CODE_08DA0C:         inc   r8           ;
CODE_08DA0D:         inc   r8           ;
CODE_08DA0E:         dec   r7           ;
CODE_08DA0F:         bne CODE_08D9AF    ;
CODE_08DA11:         nop                ;
CODE_08DA12:         rpix               ;
CODE_08DA14:         stop               ;
CODE_08DA15:         nop                ;

; pointers to icon sets for each world
DATA_08DA16:         dw $DA2E, $DA52
DATA_08DA1A:         dw $DA76, $DA9A
DATA_08DA1E:         dw $DABE, $DAE2
DATA_08DA22:         dw $DB06, $DB2A
DATA_08DA26:         dw $DB4E, $DB72
DATA_08DA2A:         dw $DB96, $DBBA

; icon GFX pointers (super FX)
DATA_08DA2E:         dl $530404, $530420
DATA_08DA34:         dl $53043C, $530458
DATA_08DA3A:         dl $530474, $530490
DATA_08DA40:         dl $5304AC, $5304C8
DATA_08DA46:         dl $5304E4, $5344C8
DATA_08DA4C:         dl $536420, $536490
DATA_08DA52:         dl $532404, $532420
DATA_08DA58:         dl $53243C, $532458
DATA_08DA5E:         dl $532474, $532490
DATA_08DA64:         dl $5324AC, $5324C8
DATA_08DA6A:         dl $5324E4, $5344E4
DATA_08DA70:         dl $536420, $536490
DATA_08DA76:         dl $534404, $534420
DATA_08DA7C:         dl $53443C, $534458
DATA_08DA82:         dl $534474, $534490
DATA_08DA88:         dl $5344AC, $5344C8
DATA_08DA8E:         dl $5344E4, $536404
DATA_08DA94:         dl $536420, $536490
DATA_08DA9A:         dl $536404, $536420
DATA_08DAA0:         dl $53643C, $536458
DATA_08DAA6:         dl $536474, $536490
DATA_08DAAC:         dl $5364AC, $5364C8
DATA_08DAB2:         dl $5364E4, $5364AC
DATA_08DAB8:         dl $536420, $536490
DATA_08DABE:         dl $530404, $530420
DATA_08DAC4:         dl $53043C, $530458
DATA_08DACA:         dl $530474, $530490
DATA_08DAD0:         dl $5304AC, $5304C8
DATA_08DAD6:         dl $5304E4, $5364C8
DATA_08DADC:         dl $536420, $536490
DATA_08DAE2:         dl $532404, $532420
DATA_08DAE8:         dl $53243C, $532458
DATA_08DAEE:         dl $532474, $532490
DATA_08DAF4:         dl $5324AC, $5324C8
DATA_08DAFA:         dl $5324E4, $5364E4
DATA_08DB00:         dl $536420, $536490
DATA_08DB06:         dl $53643C, $536458
DATA_08DB0C:         dl $536474, $5324AC
DATA_08DB12:         dl $5324C8, $5324E4
DATA_08DB18:         dl $536404, $536420
DATA_08DB1E:         dl $5364C8, $536458
DATA_08DB24:         dl $53C43C, $534404
DATA_08DB2A:         dl $538404, $538420
DATA_08DB30:         dl $53843C, $538458
DATA_08DB36:         dl $538474, $538490
DATA_08DB3C:         dl $5384AC, $5384C8
DATA_08DB42:         dl $53A490, $53A4AC
DATA_08DB48:         dl $53A4C8, $53A4E4
DATA_08DB4E:         dl $534404, $534420
DATA_08DB54:         dl $53443C, $534458
DATA_08DB5A:         dl $534474, $534490
DATA_08DB60:         dl $5344AC, $53A4E4
DATA_08DB66:         dl $53A4E4, $536420
DATA_08DB6C:         dl $536420, $536490
DATA_08DB72:         dl $538404, $538420
DATA_08DB78:         dl $53843C, $538458
DATA_08DB7E:         dl $538474, $538490
DATA_08DB84:         dl $5384AC, $5384C8
DATA_08DB8A:         dl $5384E4, $53A404
DATA_08DB90:         dl $53A420, $53A43C
DATA_08DB96:         dl $53A458, $53A474
DATA_08DB9C:         dl $53A490, $53A4AC
DATA_08DBA2:         dl $53A4C8, $53A4E4
DATA_08DBA8:         dl $53A404, $53A420
DATA_08DBAE:         dl $53A43C, $53A458
DATA_08DBB4:         dl $53A474, $53A490
DATA_08DBBA:         dl $53A43C, $538420
DATA_08DBC0:         dl $53843C, $538458
DATA_08DBC6:         dl $538474, $538490
DATA_08DBCC:         dl $5384AC, $5384C8
DATA_08DBD2:         dl $5384E4, $53A404
DATA_08DBD8:         dl $53A420, $53A43C

CODE_08DBDE:         ibt   r0,#0008     ;
CODE_08DBE0:         romb               ;
CODE_08DBE2:         iwt   r0,#DA2E     ;
CODE_08DBE5:         add   r3           ;
CODE_08DBE6:         add   r3           ;
CODE_08DBE7:         to r14             ;
CODE_08DBE8:         add   r3           ;
CODE_08DBE9:         to r12             ;
CODE_08DBEA:         getb               ;
CODE_08DBEB:         inc   r14          ;
CODE_08DBEC:         with r12           ;
CODE_08DBED:         getbh              ;
CODE_08DBEF:         inc   r14          ;
CODE_08DBF0:         to r13             ;
CODE_08DBF1:         getb               ;
CODE_08DBF2:         iwt   r0,#0404     ;
CODE_08DBF5:         with r12           ;
CODE_08DBF6:         sub   r0           ;
CODE_08DBF7:         ibt   r2,#0000     ;
CODE_08DBF9:         move  r3,r2        ;
CODE_08DBFB:         ibt   r8,#0010     ;
CODE_08DBFD:         move  r9,r8        ;
CODE_08DBFF:         move  r11,r6       ;
CODE_08DC01:         iwt   r15,#8297    ;
CODE_08DC04:         nop                ;
CODE_08DC05:         ibt   r0,#0008     ;
CODE_08DC07:         romb               ;
CODE_08DC09:         iwt   r0,#DA2E     ;
CODE_08DC0C:         add   r3           ;
CODE_08DC0D:         add   r3           ;
CODE_08DC0E:         to r14             ;
CODE_08DC0F:         add   r3           ;
CODE_08DC10:         to r12             ;
CODE_08DC11:         getb               ;
CODE_08DC12:         inc   r14          ;
CODE_08DC13:         with r12           ;
CODE_08DC14:         getbh              ;
CODE_08DC16:         inc   r14          ;
CODE_08DC17:         to r13             ;
CODE_08DC18:         getb               ;
CODE_08DC19:         iwt   r0,#0404     ;
CODE_08DC1C:         with r12           ;
CODE_08DC1D:         sub   r0           ;
CODE_08DC1E:         ibt   r2,#0000     ;
CODE_08DC20:         move  r3,r2        ;
CODE_08DC22:         iwt   r15,#8207    ;
CODE_08DC25:         nop                ;
CODE_08DC26:         romb               ;
CODE_08DC28:         iwt   r12,#00D2    ;
CODE_08DC2B:         iwt   r13,#DC3F    ;
CODE_08DC2E:         cache              ;
CODE_08DC2F:         move  r14,r9       ;
CODE_08DC31:         getb               ;
CODE_08DC32:         inc   r14          ;
CODE_08DC33:         to r3              ;
CODE_08DC34:         getbh              ;
CODE_08DC36:         inc   r14          ;
CODE_08DC37:         getb               ;
CODE_08DC38:         inc   r14          ;
CODE_08DC39:         to r7              ;
CODE_08DC3A:         getbh              ;
CODE_08DC3C:         inc   r14          ;
CODE_08DC3D:         move  r9,r14       ;
CODE_08DC3F:         from r2            ;
CODE_08DC40:         cmp   r7           ;
CODE_08DC42:         bcs CODE_08DC2F    ;
CODE_08DC44:         nop                ;
CODE_08DC45:         from r3            ;
CODE_08DC46:         stw   (r10)        ;
CODE_08DC47:         inc   r10          ;
CODE_08DC48:         inc   r10          ;
CODE_08DC49:         loop               ;
CODE_08DC4A:         inc   r2           ;
CODE_08DC4B:         stop               ;
CODE_08DC4C:         nop                ;

CODE_08DC4D:         cache              ;
CODE_08DC4E:         iwt   r12,#00D2    ;
CODE_08DC51:         move  r5,r4        ;
CODE_08DC53:         lm    r7,(1FE4)    ;
CODE_08DC57:         moves r0,r11       ;
CODE_08DC59:         bne CODE_08DC65    ;
CODE_08DC5B:         inc   r7           ;
CODE_08DC5C:         inc   r7           ;
CODE_08DC5D:         iwt   r0,#01FE     ;
CODE_08DC60:         and   r7           ;
CODE_08DC61:         sm    (1FE4),r0    ;
CODE_08DC65:         ibt   r0,#0008     ;
CODE_08DC67:         romb               ;
CODE_08DC69:         iwt   r0,#DC74     ;
CODE_08DC6C:         to r14             ;
CODE_08DC6D:         add   r1           ;
CODE_08DC6E:         getb               ;
CODE_08DC6F:         inc   r14          ;
CODE_08DC70:         to r15             ;
CODE_08DC71:         getbh              ;
CODE_08DC73:         nop                ;
CODE_08DC74:         and   r8           ;
CODE_08DC75:         inc   r12          ;
CODE_08DC76:         from r6            ;
CODE_08DC77:         inc   r12          ;
CODE_08DC78:         from r5            ;
CODE_08DC79:         romb               ;
CODE_08DC7B:         iwt   r13,#DCA9    ;
CODE_08DC7E:         move  r14,r3       ;
CODE_08DC80:         getbs              ;
CODE_08DC82:         moves r11,r0       ;
CODE_08DC84:         bpl CODE_08DC8E    ;
CODE_08DC86:         inc   r3           ;
CODE_08DC87:         to r1              ;
CODE_08DC88:         and   #0F          ;
CODE_08DC8A:         iwt   r15,#DC65    ;
CODE_08DC8D:         nop                ;
CODE_08DC8E:         move  r14,r3       ;
CODE_08DC90:         getb               ;
CODE_08DC91:         inc   r14          ;
CODE_08DC92:         to r6              ;
CODE_08DC93:         getbh              ;
CODE_08DC95:         lms   r0,(0094)    ;
CODE_08DC98:         lmult              ;
CODE_08DC9A:         to r7              ;
CODE_08DC9B:         swap               ;
CODE_08DC9C:         move  r8,r4        ;
CODE_08DC9E:         to r11             ;
CODE_08DC9F:         merge              ;
CODE_08DCA0:         inc   r14          ;
CODE_08DCA1:         getb               ;
CODE_08DCA2:         inc   r14          ;
CODE_08DCA3:         to r9              ;
CODE_08DCA4:         getbh              ;
CODE_08DCA6:         with r3            ;
CODE_08DCA7:         add   #04          ;
CODE_08DCA9:         from r2            ;
CODE_08DCAA:         cmp   r9           ;
CODE_08DCAC:         bcs CODE_08DC7E    ;
CODE_08DCAE:         from r11           ;
CODE_08DCAF:         stw   (r10)        ;
CODE_08DCB0:         inc   r10          ;
CODE_08DCB1:         inc   r10          ;
CODE_08DCB2:         loop               ;
CODE_08DCB3:         inc   r2           ;
CODE_08DCB4:         stop               ;
CODE_08DCB5:         nop                ;

CODE_08DCB6:         lm    r7,(1FE4)    ;
CODE_08DCBA:         iwt   r13,#DCFC    ;
CODE_08DCBD:         from r2            ;
CODE_08DCBE:         add   r2           ;
CODE_08DCBF:         to r7              ;
CODE_08DCC0:         add   r7           ;
CODE_08DCC1:         from r5            ;
CODE_08DCC2:         romb               ;
CODE_08DCC4:         move  r14,r3       ;
CODE_08DCC6:         getbs              ;
CODE_08DCC8:         moves r11,r0       ;
CODE_08DCCA:         bpl CODE_08DCD4    ;
CODE_08DCCC:         inc   r3           ;
CODE_08DCCD:         to r1              ;
CODE_08DCCE:         and   #0F          ;
CODE_08DCD0:         iwt   r15,#DC65    ;
CODE_08DCD3:         nop                ;
CODE_08DCD4:         move  r9,r7        ;
CODE_08DCD6:         inc   r14          ;
CODE_08DCD7:         getb               ;
CODE_08DCD8:         inc   r14          ;
CODE_08DCD9:         to r6              ;
CODE_08DCDA:         getbh              ;
CODE_08DCDC:         lms   r0,(0094)    ;
CODE_08DCDF:         lmult              ;
CODE_08DCE1:         to r7              ;
CODE_08DCE2:         swap               ;
CODE_08DCE3:         move  r8,r4        ;
CODE_08DCE5:         to r11             ;
CODE_08DCE6:         merge              ;
CODE_08DCE7:         move  r7,r9        ;
CODE_08DCE9:         inc   r14          ;
CODE_08DCEA:         getb               ;
CODE_08DCEB:         inc   r14          ;
CODE_08DCEC:         to r9              ;
CODE_08DCED:         getbh              ;
CODE_08DCEF:         inc   r14          ;
CODE_08DCF0:         to r8              ;
CODE_08DCF1:         getb               ;
CODE_08DCF2:         with r3            ;
CODE_08DCF3:         add   #05          ;
CODE_08DCF5:         lms   r1,(0000)    ;
CODE_08DCF8:         ibt   r0,#0008     ;
CODE_08DCFA:         romb               ;
CODE_08DCFC:         iwt   r0,#01FE     ;
CODE_08DCFF:         to r7              ;
CODE_08DD00:         and   r7           ;
CODE_08DD01:         from r2            ;
CODE_08DD02:         cmp   r9           ;
CODE_08DD04:         bcs CODE_08DCC1    ;
CODE_08DD06:         nop                ;
CODE_08DD07:         iwt   r0,#AC18     ;
CODE_08DD0A:         to r14             ;
CODE_08DD0B:         add   r7           ;
CODE_08DD0C:         getb               ;
CODE_08DD0D:         inc   r14          ;
CODE_08DD0E:         to r6              ;
CODE_08DD0F:         getbh              ;
CODE_08DD11:         from r1            ;
CODE_08DD12:         lmult              ;
CODE_08DD14:         from r4            ;
CODE_08DD15:         hib                ;
CODE_08DD16:         to r4              ;
CODE_08DD17:         sex                ;
CODE_08DD18:         from r11           ;
CODE_08DD19:         add   r4           ;
CODE_08DD1A:         stw   (r10)        ;
CODE_08DD1B:         inc   r10          ;
CODE_08DD1C:         inc   r10          ;
CODE_08DD1D:         with r7            ;
CODE_08DD1E:         add   r8           ;
CODE_08DD1F:         loop               ;
CODE_08DD20:         inc   r2           ;
CODE_08DD21:         stop               ;
CODE_08DD22:         nop                ;

CODE_08DD23:         cache              ;
CODE_08DD24:         moves r0,r11       ;
CODE_08DD26:         bne CODE_08DD38    ;
CODE_08DD28:         nop                ;
CODE_08DD29:         lm    r11,(1FE6)   ;
CODE_08DD2D:         dec   r11          ;
CODE_08DD2E:         dec   r11          ;
CODE_08DD2F:         iwt   r0,#01FE     ;
CODE_08DD32:         to r11             ;
CODE_08DD33:         and   r11          ;
CODE_08DD34:         sm    (1FE6),r11   ;
CODE_08DD38:         move  r0,r2        ;
CODE_08DD3A:         move  r11,r10      ;
CODE_08DD3C:         iwt   r12,#00D2    ;
CODE_08DD3F:         move  r13,r15      ;
CODE_08DD41:         stw   (r11)        ;
CODE_08DD42:         inc   r11          ;
CODE_08DD43:         loop               ;
CODE_08DD44:         inc   r11          ;
CODE_08DD45:         ibt   r0,#0008     ;
CODE_08DD47:         romb               ;
CODE_08DD49:         iwt   r0,#DD54     ;
CODE_08DD4C:         to r14             ;
CODE_08DD4D:         add   r1           ;
CODE_08DD4E:         getb               ;
CODE_08DD4F:         inc   r14          ;
CODE_08DD50:         to r15             ;
CODE_08DD51:         getbh              ;
CODE_08DD53:         nop                ;
CODE_08DD54:         add   r8           ;
CODE_08DD55:         inc   r13          ;
CODE_08DD56:         from r5            ;
CODE_08DD57:         inc   r13          ;
CODE_08DD58:         move  r1,r2        ;
CODE_08DD5A:         iwt   r12,#00D2    ;
CODE_08DD5D:         iwt   r13,#DD85    ;
CODE_08DD60:         lm    r11,(1FE6)   ;
CODE_08DD64:         from r2            ;
CODE_08DD65:         add   r2           ;
CODE_08DD66:         add   r0           ;
CODE_08DD67:         to r11             ;
CODE_08DD68:         sub   r11          ;
CODE_08DD69:         iwt   r4,#00FF     ;
CODE_08DD6C:         from r8            ;
CODE_08DD6D:         romb               ;
CODE_08DD6F:         move  r14,r7       ;
CODE_08DD71:         getb               ;
CODE_08DD72:         cmp   r4           ;
CODE_08DD74:         beq CODE_08DDB3    ;
CODE_08DD76:         inc   r14          ;
CODE_08DD77:         move  r5,r0        ;
CODE_08DD79:         getb               ;
CODE_08DD7A:         inc   r14          ;
CODE_08DD7B:         to r9              ;
CODE_08DD7C:         getbh              ;
CODE_08DD7E:         inc   r14          ;
CODE_08DD7F:         move  r7,r14       ;
CODE_08DD81:         ibt   r0,#0008     ;
CODE_08DD83:         romb               ;
CODE_08DD85:         iwt   r0,#01FE     ;
CODE_08DD88:         to r11             ;
CODE_08DD89:         and   r11          ;
CODE_08DD8A:         from r2            ;
CODE_08DD8B:         cmp   r9           ;
CODE_08DD8D:         bcs CODE_08DD69    ;
CODE_08DD8F:         nop                ;
CODE_08DD90:         moves r0,r3        ;
CODE_08DD92:         beq CODE_08DDAD    ;
CODE_08DD94:         nop                ;
CODE_08DD95:         moves r0,r5        ;
CODE_08DD97:         beq CODE_08DDAD    ;
CODE_08DD99:         nop                ;
CODE_08DD9A:         iwt   r0,#AC18     ;
CODE_08DD9D:         to r14             ;
CODE_08DD9E:         add   r11          ;
CODE_08DD9F:         getb               ;
CODE_08DDA0:         inc   r14          ;
CODE_08DDA1:         to r6              ;
CODE_08DDA2:         getbh              ;
CODE_08DDA4:         from r3            ;
CODE_08DDA5:         lmult              ;
CODE_08DDA7:         from r4            ;
CODE_08DDA8:         hib                ;
CODE_08DDA9:         sex                ;
CODE_08DDAA:         with r11           ;
CODE_08DDAB:         add   #04          ;
CODE_08DDAD:         add   r1           ;
CODE_08DDAE:         stw   (r10)        ;
CODE_08DDAF:         inc   r10          ;
CODE_08DDB0:         inc   r10          ;
CODE_08DDB1:         loop               ;
CODE_08DDB2:         inc   r2           ;
CODE_08DDB3:         stop               ;
CODE_08DDB4:         nop                ;
CODE_08DDB5:         from r8            ;
CODE_08DDB6:         romb               ;
CODE_08DDB8:         move  r14,r7       ;
CODE_08DDBA:         getb               ;
CODE_08DDBB:         sms   (001E),r0    ;
CODE_08DDBE:         inc   r14          ;
CODE_08DDBF:         getb               ;
CODE_08DDC0:         inc   r14          ;
CODE_08DDC1:         sms   (001C),r0    ;
CODE_08DDC4:         sms   (0000),r14   ;
CODE_08DDC7:         iwt   r12,#00D2    ;
CODE_08DDCA:         iwt   r13,#DE11    ;
CODE_08DDCD:         move  r9,r2        ;
CODE_08DDCF:         from r2            ;
CODE_08DDD0:         to r3              ;
CODE_08DDD1:         add   r12          ;
CODE_08DDD2:         dec   r3           ;
CODE_08DDD3:         from r12           ;
CODE_08DDD4:         add   r12          ;
CODE_08DDD5:         to r10             ;
CODE_08DDD6:         add   r10          ;
CODE_08DDD7:         move  r2,r9        ;
CODE_08DDD9:         lms   r14,(0000)   ;
CODE_08DDDC:         getb               ;
CODE_08DDDD:         inc   r14          ;
CODE_08DDDE:         to r7              ;
CODE_08DDDF:         getbh              ;
CODE_08DDE1:         from r7            ;
CODE_08DDE2:         add   #01          ;
CODE_08DDE4:         beq CODE_08DE2A    ;
CODE_08DDE6:         inc   r14          ;
CODE_08DDE7:         getb               ;
CODE_08DDE8:         inc   r14          ;
CODE_08DDE9:         to r8              ;
CODE_08DDEA:         getbh              ;
CODE_08DDEC:         inc   r14          ;
CODE_08DDED:         sms   (0000),r14   ;
CODE_08DDF0:         iwt   r1,#7FFF     ;
CODE_08DDF3:         lm    r0,(1FE6)    ;
CODE_08DDF7:         to r11             ;
CODE_08DDF8:         and   r1           ;
CODE_08DDF9:         ibt   r4,#0000     ;
CODE_08DDFB:         iwt   r0,#00D2     ;
CODE_08DDFE:         add   r2           ;
CODE_08DDFF:         from r8            ;
CODE_08DE00:         sub   r0           ;
CODE_08DE01:         bmi CODE_08DE11    ;
CODE_08DE03:         move  r6,r11       ;
CODE_08DE05:         move  r1,r0        ;
CODE_08DE07:         lmult              ;
CODE_08DE09:         from r4            ;
CODE_08DE0A:         hib                ;
CODE_08DE0B:         from r1            ;
CODE_08DE0C:         sub   r0           ;
CODE_08DE0D:         with r2            ;
CODE_08DE0E:         sub   r0           ;
CODE_08DE0F:         with r4            ;
CODE_08DE10:         lob                ;
CODE_08DE11:         dec   r10          ;
CODE_08DE12:         dec   r10          ;
CODE_08DE13:         from r3            ;
CODE_08DE14:         cmp   r8           ;
CODE_08DE16:         bcs CODE_08DE28    ;
CODE_08DE18:         from r3            ;
CODE_08DE19:         cmp   r7           ;
CODE_08DE1B:         bcc CODE_08DDD7    ;
CODE_08DE1D:         from r4            ;
CODE_08DE1E:         add   r11          ;
CODE_08DE1F:         to r4              ;
CODE_08DE20:         lob                ;
CODE_08DE21:         hib                ;
CODE_08DE22:         bne CODE_08DE27    ;
CODE_08DE24:         move  r0,r2        ;
CODE_08DE26:         dec   r2           ;
CODE_08DE27:         stw   (r10)        ;
CODE_08DE28:         loop               ;
CODE_08DE29:         dec   r3           ;
CODE_08DE2A:         lms   r10,(001C)   ;
CODE_08DE2D:         lms   r1,(001E)    ;
CODE_08DE30:         lm    r0,(1FE6)    ;
CODE_08DE34:         moves r2,r0        ;
CODE_08DE36:         bmi CODE_08DE46    ;
CODE_08DE38:         nop                ;
CODE_08DE39:         sub   r1           ;
CODE_08DE3A:         bmi CODE_08DE42    ;
CODE_08DE3C:         nop                ;
CODE_08DE3D:         cmp   r10          ;
CODE_08DE3F:         bcs CODE_08DE53    ;
CODE_08DE41:         nop                ;
CODE_08DE42:         iwt   r0,#8000     ;
CODE_08DE45:         or    r10          ;
CODE_08DE46:         add   r1           ;
CODE_08DE47:         iwt   r3,#8100     ;
CODE_08DE4A:         cmp   r3           ;
CODE_08DE4C:         bcc CODE_08DE53    ;
CODE_08DE4E:         nop                ;
CODE_08DE4F:         iwt   r2,#7FFF     ;
CODE_08DE52:         and   r2           ;
CODE_08DE53:         sm    (1FE6),r0    ;
CODE_08DE57:         stop               ;
CODE_08DE58:         nop                ;

; r1 = table of init high scores ($108040)
; r2 = ROM data bank ($10)
; r10 = table of all high scores
CODE_08DE59:         cache              ;\ clear high scores from SRAM
CODE_08DE5A:         iwt   r12,#0034    ; |\ load number of high scores
CODE_08DE5D:         iwt   r13,#DE67    ; | | set loop address
CODE_08DE60:         from r2            ;
CODE_08DE61:         romb               ; | | set the ROM data bank to $10
CODE_08DE63:         move  r2,r10       ; | | move the address of r10 into r2
CODE_08DE65:         move  r14,r1       ; |/ set ROM buffer address register
CODE_08DE67:         getb               ; |\
CODE_08DE68:         inc   r14          ; | | load data from $108040
CODE_08DE69:         getbh              ; |/
CODE_08DE6B:         inc   r14          ; |\
CODE_08DE6C:         stw   (r2)         ; | | store re-initialized high score
CODE_08DE6D:         inc   r2           ; | | loop until every high score is re-initialized
CODE_08DE6E:         loop               ; | |
CODE_08DE6F:         inc   r2           ;/ /
CODE_08DE70:         bra CODE_08DE83    ;\ get new checksum

CODE_08DE72:         nop                ;/

; r1 = source table (dw $7C00, $7C68, $7CD0)
; r10 = desination table (dw $7D38, $7DA0, $7E08)
; indexed by save file
CODE_08DE73:         move  r2,r10       ; move desination into r2
CODE_08DE75:         cache              ;\ table copy loop
CODE_08DE76:         iwt   r12,#0034    ; | load number of high scores to save (number of levels total)
CODE_08DE79:         iwt   r13,#DE7C    ; | set loop address
CODE_08DE7C:         ldw   (r1)         ; |\ copy high score from source table to desination table
CODE_08DE7D:         stw   (r2)         ; |/
CODE_08DE7E:         inc   r1           ; |\
CODE_08DE7F:         inc   r1           ; | | loop until every high score is saved
CODE_08DE80:         inc   r2           ; | |
CODE_08DE81:         loop               ; |/
CODE_08DE82:         inc   r2           ;/
;
; r10 = high score table
CODE_08DE83:         cache              ;\ checksum loop
CODE_08DE84:         iwt   r12,#0034    ; | load number of high scores
CODE_08DE87:         iwt   r13,#DE8C    ; | set loop address
CODE_08DE8A:         ibt   r1,#00       ; |
CODE_08DE8C:         ldw   (r10)        ; | load high score table
CODE_08DE8D:         to r1              ;
CODE_08DE8E:         add   r1           ; | add score to r1
CODE_08DE8F:         inc   r10          ; |\
CODE_08DE90:         loop               ; | | loop through every index ($34 times)
CODE_08DE91:         inc   r10          ;/ /
CODE_08DE92:         iwt   r0,#7777     ;\ compute checksum
CODE_08DE95:         sub   r1           ;/ r0 = final checksum
CODE_08DE96:         stop               ;\ halt gsu processing
CODE_08DE97:         nop                ;/

CODE_08DE98:         from r1            ;
CODE_08DE99:         cmode              ;
CODE_08DE9B:         ibt   r0,#0008     ;
CODE_08DE9D:         romb               ;
CODE_08DE9F:         iwt   r0,#DA2E     ;
CODE_08DEA2:         add   r3           ;
CODE_08DEA3:         add   r3           ;
CODE_08DEA4:         to r14             ;
CODE_08DEA5:         add   r3           ;
CODE_08DEA6:         getb               ;
CODE_08DEA7:         inc   r14          ;
CODE_08DEA8:         to r9              ;
CODE_08DEA9:         getbh              ;
CODE_08DEAB:         inc   r14          ;
CODE_08DEAC:         to r10             ;
CODE_08DEAD:         getb               ;
CODE_08DEAE:         lms   r6,(0000)    ;
CODE_08DEB1:         moves r0,r6        ;
CODE_08DEB3:         beq CODE_08DEB7    ;
CODE_08DEB5:         move  r9,r6        ;
CODE_08DEB7:         iwt   r0,#0404     ;
CODE_08DEBA:         with r9            ;
CODE_08DEBB:         sub   r0           ;
CODE_08DEBC:         sms   (0000),r10   ;
CODE_08DEBF:         ibt   r0,#0008     ;
CODE_08DEC1:         romb               ;
CODE_08DEC3:         iwt   r0,#AB98     ;
CODE_08DEC6:         to r14             ;
CODE_08DEC7:         add   r2           ;
CODE_08DEC8:         getb               ;
CODE_08DEC9:         inc   r14          ;
CODE_08DECA:         to r6              ;
CODE_08DECB:         getbh              ;
CODE_08DECD:         iwt   r4,#2200     ;
CODE_08DED0:         from r4            ;
CODE_08DED1:         add   r6           ;
CODE_08DED2:         add   r6           ;
CODE_08DED3:         to r6              ;
CODE_08DED4:         ldw   (r0)         ;
CODE_08DED5:         from r4            ;
CODE_08DED6:         add   r11          ;
CODE_08DED7:         add   r11          ;
CODE_08DED8:         to r11             ;
CODE_08DED9:         ldw   (r0)         ;
CODE_08DEDA:         ibt   r0,#0010     ;
CODE_08DEDC:         to r8              ;
CODE_08DEDD:         swap               ;
CODE_08DEDE:         not                ;
CODE_08DEDF:         inc   r0           ;
CODE_08DEE0:         lmult              ;
CODE_08DEE2:         with r8            ;
CODE_08DEE3:         add   r4           ;
CODE_08DEE4:         move  r5,r6        ;
CODE_08DEE6:         move  r6,r11       ;
CODE_08DEE8:         ibt   r0,#0010     ;
CODE_08DEEA:         to r10             ;
CODE_08DEEB:         swap               ;
CODE_08DEEC:         not                ;
CODE_08DEED:         inc   r0           ;
CODE_08DEEE:         lmult              ;
CODE_08DEF0:         with r10           ;
CODE_08DEF1:         add   r4           ;
CODE_08DEF2:         move  r6,r9        ;
CODE_08DEF4:         ibt   r3,#0000     ;
CODE_08DEF6:         lms   r0,(0000)    ;
CODE_08DEF9:         romb               ;
CODE_08DEFB:         iwt   r13,#DF09    ;
CODE_08DEFE:         ibt   r4,#0020     ;
CODE_08DF00:         cache              ;
CODE_08DF01:         ibt   r12,#0020    ;
CODE_08DF03:         move  r1,r3        ;
CODE_08DF05:         ibt   r2,#0000     ;
CODE_08DF07:         move  r7,r10       ;
CODE_08DF09:         merge              ;
CODE_08DF0A:         bcs CODE_08DF18    ;
CODE_08DF0C:         to r14             ;
CODE_08DF0D:         add   r6           ;
CODE_08DF0E:         with r7            ;
CODE_08DF0F:         add   r11          ;
CODE_08DF10:         getc               ;
CODE_08DF11:         plot               ;
CODE_08DF12:         dec   r1           ;
CODE_08DF13:         loop               ;
CODE_08DF14:         inc   r2           ;
CODE_08DF15:         bra CODE_08DF20    ;

CODE_08DF17:         nop                ;

CODE_08DF18:         with r7            ;
CODE_08DF19:         add   r11          ;
CODE_08DF1A:         sub   r0           ;
CODE_08DF1B:         color              ;
CODE_08DF1C:         plot               ;
CODE_08DF1D:         inc   r2           ;
CODE_08DF1E:         loop               ;
CODE_08DF1F:         dec   r1           ;
CODE_08DF20:         with r8            ;
CODE_08DF21:         add   r5           ;
CODE_08DF22:         dec   r4           ;
CODE_08DF23:         bne CODE_08DF01    ;
CODE_08DF25:         inc   r3           ;
CODE_08DF26:         rpix               ;
CODE_08DF28:         stop               ;
CODE_08DF29:         nop                ;

CODE_08DF2A:         with r7            ;
CODE_08DF2B:         add   r7           ;
CODE_08DF2C:         with r8            ;
CODE_08DF2D:         add   r8           ;
CODE_08DF2E:         iwt   r10,#3388    ;
CODE_08DF31:         cache              ;
CODE_08DF32:         move  r1,r12       ;
CODE_08DF34:         iwt   r12,#0014    ;
CODE_08DF37:         iwt   r13,#DF3D    ;
CODE_08DF3A:         iwt   r0,#00FF     ;
CODE_08DF3D:         stw   (r10)        ;
CODE_08DF3E:         inc   r10          ;
CODE_08DF3F:         inc   r10          ;
CODE_08DF40:         inc   r10          ;
CODE_08DF41:         loop               ;
CODE_08DF42:         inc   r10          ;
CODE_08DF43:         iwt   r0,#0100     ;
CODE_08DF46:         to r9              ;
CODE_08DF47:         sub   r9           ;
CODE_08DF48:         move  r12,r1       ;
CODE_08DF4A:         iwt   r13,#DF4D    ;
CODE_08DF4D:         from r5            ;
CODE_08DF4E:         romb               ;
CODE_08DF50:         move  r14,r11      ;
CODE_08DF52:         getb               ;
CODE_08DF53:         inc   r14          ;
CODE_08DF54:         to r1              ;
CODE_08DF55:         getbh              ;
CODE_08DF57:         ibt   r0,#0008     ;
CODE_08DF59:         romb               ;
CODE_08DF5B:         iwt   r0,#AC18     ;
CODE_08DF5E:         to r14             ;
CODE_08DF5F:         add   r7           ;
CODE_08DF60:         getb               ;
CODE_08DF61:         inc   r14          ;
CODE_08DF62:         to r6              ;
CODE_08DF63:         getbh              ;
CODE_08DF65:         from r3            ;
CODE_08DF66:         lmult              ;
CODE_08DF68:         from r4            ;
CODE_08DF69:         hib                ;
CODE_08DF6A:         sex                ;
CODE_08DF6B:         add   r9           ;
CODE_08DF6C:         add   r1           ;
CODE_08DF6D:         stw   (r10)        ;
CODE_08DF6E:         with r7            ;
CODE_08DF6F:         add   r8           ;
CODE_08DF70:         iwt   r0,#01FF     ;
CODE_08DF73:         to r7              ;
CODE_08DF74:         and   r7           ;
CODE_08DF75:         inc   r10          ;
CODE_08DF76:         inc   r10          ;
CODE_08DF77:         inc   r10          ;
CODE_08DF78:         inc   r10          ;
CODE_08DF79:         inc   r11          ;
CODE_08DF7A:         loop               ;
CODE_08DF7B:         inc   r11          ;
CODE_08DF7C:         stop               ;
CODE_08DF7D:         nop                ;

CODE_08DF7E:         romb               ;
CODE_08DF80:         ibt   r0,#0001     ;
CODE_08DF82:         cmode              ;
CODE_08DF84:         cache              ;
CODE_08DF85:         ibt   r2,#0000     ;
CODE_08DF87:         ibt   r4,#0018     ;
CODE_08DF89:         ibt   r1,#0000     ;
CODE_08DF8B:         ibt   r12,#0018    ;
CODE_08DF8D:         move  r13,r15      ;
CODE_08DF8F:         from r3            ;
CODE_08DF90:         to r14             ;
CODE_08DF91:         add   r1           ;
CODE_08DF92:         getc               ;
CODE_08DF93:         loop               ;
CODE_08DF94:         plot               ;
CODE_08DF95:         iwt   r0,#0100     ;
CODE_08DF98:         with r3            ;
CODE_08DF99:         add   r0           ;
CODE_08DF9A:         dec   r4           ;
CODE_08DF9B:         bne CODE_08DF89    ;
CODE_08DF9D:         inc   r2           ;
CODE_08DF9E:         rpix               ;
CODE_08DFA0:         stop               ;
CODE_08DFA1:         nop                ;

CODE_08DFA2:         ibt   r0,#0001     ;
CODE_08DFA4:         cmode              ;
CODE_08DFA6:         ibt   r0,#0000     ;
CODE_08DFA8:         color              ;
CODE_08DFA9:         from r3            ;
CODE_08DFAA:         to r1              ;
CODE_08DFAB:         sub   #01          ;
CODE_08DFAD:         move  r2,r4        ;
CODE_08DFAF:         cache              ;
CODE_08DFB0:         ibt   r12,#0003    ;
CODE_08DFB2:         move  r13,r15      ;
CODE_08DFB4:         moves r0,r1        ;
CODE_08DFB6:         bmi CODE_08DFC1    ;
CODE_08DFB8:         nop                ;
CODE_08DFB9:         ibt   r0,#0018     ;
CODE_08DFBB:         from r1            ;
CODE_08DFBC:         sub   r0           ;
CODE_08DFBD:         bcs CODE_08DFC1    ;
CODE_08DFBF:         nop                ;
CODE_08DFC0:         plot               ;
CODE_08DFC1:         loop               ;
CODE_08DFC2:         nop                ;
CODE_08DFC3:         move  r1,r3        ;
CODE_08DFC5:         from r4            ;
CODE_08DFC6:         to r2              ;
CODE_08DFC7:         sub   #01          ;
CODE_08DFC9:         ibt   r12,#0003    ;
CODE_08DFCB:         iwt   r13,#DFCE    ;
CODE_08DFCE:         moves r0,r2        ;
CODE_08DFD0:         bmi CODE_08DFDC    ;
CODE_08DFD2:         nop                ;
CODE_08DFD3:         ibt   r0,#0018     ;
CODE_08DFD5:         from r2            ;
CODE_08DFD6:         sub   r0           ;
CODE_08DFD7:         bcs CODE_08DFDC    ;
CODE_08DFD9:         nop                ;
CODE_08DFDA:         plot               ;
CODE_08DFDB:         dec   r1           ;
CODE_08DFDC:         loop               ;
CODE_08DFDD:         inc   r2           ;
CODE_08DFDE:         rpix               ;
CODE_08DFE0:         stop               ;
CODE_08DFE1:         nop                ;

CODE_08DFE2:         cache              ;
CODE_08DFE3:         ibt   r0,#0001     ;
CODE_08DFE5:         cmode              ;
CODE_08DFE7:         ibt   r0,#0000     ;
CODE_08DFE9:         color              ;
CODE_08DFEA:         lms   r6,(0004)    ;
CODE_08DFED:         lms   r7,(0006)    ;
CODE_08DFF0:         lms   r8,(0000)    ;
CODE_08DFF3:         lms   r9,(0002)    ;
CODE_08DFF6:         ibt   r3,#0003     ;
CODE_08DFF8:         move  r4,r8        ;
CODE_08DFFA:         move  r5,r9        ;
CODE_08DFFC:         ibt   r12,#0003    ;
CODE_08DFFE:         move  r13,r15      ;
CODE_08E000:         move  r1,r4        ;
CODE_08E002:         move  r2,r6        ;
CODE_08E004:         plot               ;
CODE_08E005:         move  r1,r5        ;
CODE_08E007:         move  r2,r7        ;
CODE_08E009:         with r4            ;
CODE_08E00A:         add   #08          ;
CODE_08E00C:         with r5            ;
CODE_08E00D:         add   #08          ;
CODE_08E00F:         loop               ;
CODE_08E010:         plot               ;
CODE_08E011:         with r6            ;
CODE_08E012:         add   #08          ;
CODE_08E014:         with r7            ;
CODE_08E015:         add   #08          ;
CODE_08E017:         dec   r3           ;
CODE_08E018:         bne CODE_08DFF8    ;
CODE_08E01A:         nop                ;
CODE_08E01B:         rpix               ;
CODE_08E01D:         stop               ;
CODE_08E01E:         nop                ;

CODE_08E01F:         romb               ;
CODE_08E021:         ibt   r0,#0015     ;
CODE_08E023:         cmode              ;
CODE_08E025:         cache              ;
CODE_08E026:         move  r7,r4        ;
CODE_08E028:         ibt   r2,#0000     ;
CODE_08E02A:         ibt   r9,#000C     ;
CODE_08E02C:         from r7            ;
CODE_08E02D:         to r6              ;
CODE_08E02E:         swap               ;
CODE_08E02F:         ibt   r1,#0000     ;
CODE_08E031:         move  r8,r5        ;
CODE_08E033:         ibt   r12,#000C    ;
CODE_08E035:         move  r13,r15      ;
CODE_08E037:         from r6            ;
CODE_08E038:         add   r8           ;
CODE_08E039:         to r14             ;
CODE_08E03A:         add   r3           ;
CODE_08E03B:         from r7            ;
CODE_08E03C:         sub   #0C          ;
CODE_08E03E:         bcs CODE_08E04A    ;
CODE_08E040:         nop                ;
CODE_08E041:         from r8            ;
CODE_08E042:         sub   #0C          ;
CODE_08E044:         bcs CODE_08E04A    ;
CODE_08E046:         nop                ;
CODE_08E047:         bra CODE_08E04D    ;

CODE_08E049:         getc               ;

CODE_08E04A:         ibt   r0,#0000     ;
CODE_08E04C:         color              ;
CODE_08E04D:         inc   r8           ;
CODE_08E04E:         loop               ;
CODE_08E04F:         plot               ;
CODE_08E050:         dec   r8           ;
CODE_08E051:         ibt   r12,#000C    ;
CODE_08E053:         move  r13,r15      ;
CODE_08E055:         from r6            ;
CODE_08E056:         add   r8           ;
CODE_08E057:         to r14             ;
CODE_08E058:         add   r3           ;
CODE_08E059:         from r7            ;
CODE_08E05A:         sub   #0C          ;
CODE_08E05C:         bcs CODE_08E068    ;
CODE_08E05E:         nop                ;
CODE_08E05F:         from r8            ;
CODE_08E060:         sub   #0C          ;
CODE_08E062:         bcs CODE_08E068    ;
CODE_08E064:         nop                ;
CODE_08E065:         bra CODE_08E06B    ;

CODE_08E067:         getc               ;

CODE_08E068:         ibt   r0,#0000     ;
CODE_08E06A:         color              ;
CODE_08E06B:         dec   r8           ;
CODE_08E06C:         loop               ;
CODE_08E06D:         plot               ;
CODE_08E06E:         inc   r7           ;
CODE_08E06F:         dec   r9           ;
CODE_08E070:         bne CODE_08E02C    ;
CODE_08E072:         inc   r2           ;
CODE_08E073:         dec   r7           ;
CODE_08E074:         ibt   r9,#000C     ;
CODE_08E076:         from r7            ;
CODE_08E077:         to r6              ;
CODE_08E078:         swap               ;
CODE_08E079:         ibt   r1,#0000     ;
CODE_08E07B:         move  r8,r5        ;
CODE_08E07D:         ibt   r12,#000C    ;
CODE_08E07F:         move  r13,r15      ;
CODE_08E081:         from r6            ;
CODE_08E082:         add   r8           ;
CODE_08E083:         to r14             ;
CODE_08E084:         add   r3           ;
CODE_08E085:         from r7            ;
CODE_08E086:         sub   #0C          ;
CODE_08E088:         bcs CODE_08E094    ;
CODE_08E08A:         nop                ;
CODE_08E08B:         from r8            ;
CODE_08E08C:         sub   #0C          ;
CODE_08E08E:         bcs CODE_08E094    ;
CODE_08E090:         nop                ;
CODE_08E091:         bra CODE_08E097    ;

CODE_08E093:         getc               ;

CODE_08E094:         ibt   r0,#0000     ;
CODE_08E096:         color              ;
CODE_08E097:         inc   r8           ;
CODE_08E098:         loop               ;
CODE_08E099:         plot               ;
CODE_08E09A:         dec   r8           ;
CODE_08E09B:         ibt   r12,#000C    ;
CODE_08E09D:         move  r13,r15      ;
CODE_08E09F:         from r6            ;
CODE_08E0A0:         add   r8           ;
CODE_08E0A1:         to r14             ;
CODE_08E0A2:         add   r3           ;
CODE_08E0A3:         from r7            ;
CODE_08E0A4:         sub   #0C          ;
CODE_08E0A6:         bcs CODE_08E0B2    ;
CODE_08E0A8:         nop                ;
CODE_08E0A9:         from r8            ;
CODE_08E0AA:         sub   #0C          ;
CODE_08E0AC:         bcs CODE_08E0B2    ;
CODE_08E0AE:         nop                ;
CODE_08E0AF:         bra CODE_08E0B5    ;

CODE_08E0B1:         getc               ;

CODE_08E0B2:         ibt   r0,#0000     ;
CODE_08E0B4:         color              ;
CODE_08E0B5:         dec   r8           ;
CODE_08E0B6:         loop               ;
CODE_08E0B7:         plot               ;
CODE_08E0B8:         dec   r7           ;
CODE_08E0B9:         dec   r9           ;
CODE_08E0BA:         bne CODE_08E076    ;
CODE_08E0BC:         inc   r2           ;
CODE_08E0BD:         rpix               ;
CODE_08E0BF:         stop               ;
CODE_08E0C0:         nop                ;

CODE_08E0C1:         cmode              ;
CODE_08E0C3:         ibt   r0,#0000     ;
CODE_08E0C5:         color              ;
CODE_08E0C6:         ibt   r5,#0020     ;
CODE_08E0C8:         from r3            ;
CODE_08E0C9:         to r1              ;
CODE_08E0CA:         sub   #01          ;
CODE_08E0CC:         move  r2,r4        ;
CODE_08E0CE:         cache              ;
CODE_08E0CF:         ibt   r12,#0003    ;
CODE_08E0D1:         move  r13,r15      ;
CODE_08E0D3:         moves r0,r1        ;
CODE_08E0D5:         bmi CODE_08E0DD    ;
CODE_08E0D7:         from r1            ;
CODE_08E0D8:         sub   r5           ;
CODE_08E0D9:         bcs CODE_08E0DD    ;
CODE_08E0DB:         nop                ;
CODE_08E0DC:         plot               ;
CODE_08E0DD:         loop               ;
CODE_08E0DE:         nop                ;
CODE_08E0DF:         move  r1,r3        ;
CODE_08E0E1:         from r4            ;
CODE_08E0E2:         to r2              ;
CODE_08E0E3:         sub   #01          ;
CODE_08E0E5:         ibt   r12,#0003    ;
CODE_08E0E7:         move  r13,r15      ;
CODE_08E0E9:         moves r0,r2        ;
CODE_08E0EB:         bmi CODE_08E0F4    ;
CODE_08E0ED:         from r2            ;
CODE_08E0EE:         sub   r5           ;
CODE_08E0EF:         bcs CODE_08E0F4    ;
CODE_08E0F1:         nop                ;
CODE_08E0F2:         plot               ;
CODE_08E0F3:         dec   r1           ;
CODE_08E0F4:         loop               ;
CODE_08E0F5:         inc   r2           ;
CODE_08E0F6:         rpix               ;
CODE_08E0F8:         stop               ;
CODE_08E0F9:         nop                ;

CODE_08E0FA:         cmode              ;
CODE_08E0FC:         ibt   r0,#0053     ;
CODE_08E0FE:         romb               ;
CODE_08E100:         ibt   r3,#0000     ;
CODE_08E102:         ibt   r4,#0038     ;
CODE_08E104:         iwt   r13,#E112    ;
CODE_08E107:         ibt   r6,#0003     ;
CODE_08E109:         cache              ;
CODE_08E10A:         move  r2,r4        ;
CODE_08E10C:         move  r1,r3        ;
CODE_08E10E:         ibt   r12,#0018    ;
CODE_08E110:         move  r14,r10      ;
CODE_08E112:         getc               ;
CODE_08E113:         plot               ;
CODE_08E114:         loop               ;
CODE_08E115:         inc   r14          ;
CODE_08E116:         iwt   r0,#0100     ;
CODE_08E119:         to r10             ;
CODE_08E11A:         add   r10          ;
CODE_08E11B:         inc   r2           ;
CODE_08E11C:         from r2            ;
CODE_08E11D:         and   #07          ;
CODE_08E11F:         bne CODE_08E10C    ;
CODE_08E121:         nop                ;
CODE_08E122:         ibt   r0,#0018     ;
CODE_08E124:         to r3              ;
CODE_08E125:         add   r3           ;
CODE_08E126:         ibt   r0,#007F     ;
CODE_08E128:         to r3              ;
CODE_08E129:         and   r3           ;
CODE_08E12A:         dec   r6           ;
CODE_08E12B:         bne CODE_08E10A    ;
CODE_08E12D:         nop                ;
CODE_08E12E:         rpix               ;
CODE_08E130:         stop               ;
CODE_08E131:         nop                ;

CODE_08E132:         ibt   r0,#001F     ;
CODE_08E134:         to r3              ;
CODE_08E135:         and   r1           ;
CODE_08E136:         and   r2           ;
CODE_08E137:         sub   r3           ;
CODE_08E138:         lob                ;
CODE_08E139:         swap               ;
CODE_08E13A:         fmult              ;
CODE_08E13B:         to r3              ;
CODE_08E13C:         add   r3           ;
CODE_08E13D:         iwt   r0,#03E0     ;
CODE_08E140:         move  r7,r0        ;
CODE_08E142:         to r5              ;
CODE_08E143:         and   r1           ;
CODE_08E144:         and   r2           ;
CODE_08E145:         sub   r5           ;
CODE_08E146:         lmult              ;
CODE_08E148:         with r4            ;
CODE_08E149:         hib                ;
CODE_08E14A:         lob                ;
CODE_08E14B:         swap               ;
CODE_08E14C:         or    r4           ;
CODE_08E14D:         add   r5           ;
CODE_08E14E:         and   r7           ;
CODE_08E14F:         to r3              ;
CODE_08E150:         or    r3           ;
CODE_08E151:         iwt   r0,#7C00     ;
CODE_08E154:         move  r7,r0        ;
CODE_08E156:         to r5              ;
CODE_08E157:         and   r1           ;
CODE_08E158:         and   r2           ;
CODE_08E159:         sub   r5           ;
CODE_08E15A:         lmult              ;
CODE_08E15C:         with r4            ;
CODE_08E15D:         hib                ;
CODE_08E15E:         lob                ;
CODE_08E15F:         swap               ;
CODE_08E160:         or    r4           ;
CODE_08E161:         add   r5           ;
CODE_08E162:         and   r7           ;
CODE_08E163:         to r3              ;
CODE_08E164:         or    r3           ;
CODE_08E165:         stop               ;
CODE_08E166:         nop                ;

CODE_08E167:         romb               ;
CODE_08E169:         move  r14,r14      ;
CODE_08E16B:         iwt   r0,#2D6C     ;
CODE_08E16E:         add   r8           ;
CODE_08E16F:         to r9              ;
CODE_08E170:         add   r8           ;
CODE_08E171:         iwt   r0,#2000     ;
CODE_08E174:         add   r8           ;
CODE_08E175:         to r8              ;
CODE_08E176:         add   r8           ;
CODE_08E177:         ibt   r11,#001F    ;
CODE_08E179:         iwt   r7,#03E0     ;
CODE_08E17C:         iwt   r10,#7C00    ;
CODE_08E17F:         cache              ;
CODE_08E180:         move  r13,r15      ;
CODE_08E182:         getb               ;
CODE_08E183:         inc   r14          ;
CODE_08E184:         to r1              ;
CODE_08E185:         ldw   (r9)         ;
CODE_08E186:         inc   r9           ;
CODE_08E187:         inc   r9           ;
CODE_08E188:         to r2              ;
CODE_08E189:         getbh              ;
CODE_08E18B:         inc   r14          ;
CODE_08E18C:         move  r0,r11       ;
CODE_08E18E:         to r3              ;
CODE_08E18F:         and   r1           ;
CODE_08E190:         and   r2           ;
CODE_08E191:         sub   r3           ;
CODE_08E192:         lob                ;
CODE_08E193:         swap               ;
CODE_08E194:         fmult              ;
CODE_08E195:         to r3              ;
CODE_08E196:         add   r3           ;
CODE_08E197:         move  r0,r7        ;
CODE_08E199:         to r5              ;
CODE_08E19A:         and   r1           ;
CODE_08E19B:         and   r2           ;
CODE_08E19C:         sub   r5           ;
CODE_08E19D:         lmult              ;
CODE_08E19F:         with r4            ;
CODE_08E1A0:         hib                ;
CODE_08E1A1:         lob                ;
CODE_08E1A2:         swap               ;
CODE_08E1A3:         or    r4           ;
CODE_08E1A4:         add   r5           ;
CODE_08E1A5:         and   r7           ;
CODE_08E1A6:         to r3              ;
CODE_08E1A7:         or    r3           ;
CODE_08E1A8:         move  r0,r10       ;
CODE_08E1AA:         to r5              ;
CODE_08E1AB:         and   r1           ;
CODE_08E1AC:         and   r2           ;
CODE_08E1AD:         sub   r5           ;
CODE_08E1AE:         lmult              ;
CODE_08E1B0:         with r4            ;
CODE_08E1B1:         hib                ;
CODE_08E1B2:         lob                ;
CODE_08E1B3:         swap               ;
CODE_08E1B4:         or    r4           ;
CODE_08E1B5:         add   r5           ;
CODE_08E1B6:         and   r10          ;
CODE_08E1B7:         or    r3           ;
CODE_08E1B8:         stw   (r8)         ;
CODE_08E1B9:         inc   r8           ;
CODE_08E1BA:         loop               ;
CODE_08E1BB:         inc   r8           ;
CODE_08E1BC:         stop               ;
CODE_08E1BD:         nop                ;

CODE_08E1BE:         sms   (003E),r1    ;
CODE_08E1C1:         sub   r0           ;
CODE_08E1C2:         sms   (0000),r0    ;
CODE_08E1C5:         inc   r0           ;
CODE_08E1C6:         sms   (000A),r0    ;
CODE_08E1C9:         ibt   r0,#000E     ;
CODE_08E1CB:         sms   (003C),r0    ;
CODE_08E1CE:         ibt   r0,#0008     ;
CODE_08E1D0:         romb               ;
CODE_08E1D2:         iwt   r10,#2667    ;
CODE_08E1D5:         ibt   r12,#000A    ;
CODE_08E1D7:         move  r13,r15      ;
CODE_08E1D9:         lms   r11,(003C)   ;
CODE_08E1DC:         from r10           ;
CODE_08E1DD:         hib                ;
CODE_08E1DE:         iwt   r14,#AE18    ;
CODE_08E1E1:         to r14             ;
CODE_08E1E2:         add   r14          ;
CODE_08E1E3:         iwt   r0,#1999     ;
CODE_08E1E6:         with r10           ;
CODE_08E1E7:         sub   r0           ;
CODE_08E1E8:         with r8            ;
CODE_08E1E9:         lsr                ;
CODE_08E1EA:         bcc CODE_08E1F8    ;
CODE_08E1EC:         nop                ;
CODE_08E1ED:         from r11           ;
CODE_08E1EE:         add   #04          ;
CODE_08E1F0:         sbk                ;
CODE_08E1F1:         with r9            ;
CODE_08E1F2:         lsr                ;
CODE_08E1F3:         dec   r1           ;
CODE_08E1F4:         iwt   r15,#E296    ;
CODE_08E1F7:         loop               ;
CODE_08E1F8:         getbs              ;
CODE_08E1FA:         mult  #03          ;
CODE_08E1FC:         div2               ;
CODE_08E1FE:         ibt   r5,#0040     ;
CODE_08E200:         with r14           ;
CODE_08E201:         add   r5           ;
CODE_08E202:         fmult              ;
CODE_08E203:         add   r2           ;
CODE_08E204:         stw   (r1)         ;
CODE_08E205:         inc   r1           ;
CODE_08E206:         inc   r1           ;
CODE_08E207:         stw   (r11)        ;
CODE_08E208:         getbs              ;
CODE_08E20A:         add   r0           ;
CODE_08E20B:         add   r0           ;
CODE_08E20C:         fmult              ;
CODE_08E20D:         add   r3           ;
CODE_08E20E:         stw   (r1)         ;
CODE_08E20F:         inc   r11          ;
CODE_08E210:         inc   r11          ;
CODE_08E211:         stw   (r11)        ;
CODE_08E212:         inc   r11          ;
CODE_08E213:         inc   r11          ;
CODE_08E214:         sms   (003C),r11   ;
CODE_08E217:         move  r14,r4       ;
CODE_08E219:         with r9            ;
CODE_08E21A:         lsr                ;
CODE_08E21B:         bcc CODE_08E225    ;
CODE_08E21D:         inc   r1           ;
CODE_08E21E:         from r12           ;
CODE_08E21F:         lsr                ;
CODE_08E220:         bcc CODE_08E225    ;
CODE_08E222:         nop                ;
CODE_08E223:         inc   r14          ;
CODE_08E224:         inc   r14          ;
CODE_08E225:         from r12           ;
CODE_08E226:         sub   r7           ;
CODE_08E227:         bpl CODE_08E22C    ;
CODE_08E229:         inc   r1           ;
CODE_08E22A:         add   #0A          ;
CODE_08E22C:         lsr                ;
CODE_08E22D:         bne CODE_08E278    ;
CODE_08E22F:         nop                ;
CODE_08E230:         bcc CODE_08E245    ;
CODE_08E232:         nop                ;
CODE_08E233:         lms   r0,(000C)    ;
CODE_08E236:         dec   r0           ;
CODE_08E237:         bmi CODE_08E278    ;
CODE_08E239:         nop                ;
CODE_08E23A:         iwt   r5,#00CC     ;
CODE_08E23D:         from r14           ;
CODE_08E23E:         sub   r4           ;
CODE_08E23F:         beq CODE_08E250    ;
CODE_08E241:         nop                ;
CODE_08E242:         bra CODE_08E2B6    ;

CODE_08E244:         nop                ;
CODE_08E245:         iwt   r5,#0100     ;
CODE_08E248:         from r14           ;
CODE_08E249:         sub   r4           ;
CODE_08E24A:         sms   (0000),r0    ;
CODE_08E24D:         bne CODE_08E2B6    ;
CODE_08E24F:         nop                ;
CODE_08E250:         lms   r0,(000A)    ;
CODE_08E253:         dec   r0           ;
CODE_08E254:         sbk                ;
CODE_08E255:         bmi CODE_08E25A    ;
CODE_08E257:         sub   r0           ;
CODE_08E258:         ibt   r0,#0004     ;
CODE_08E25A:         to r11             ;
CODE_08E25B:         add   #02          ;
CODE_08E25D:         ibt   r0,#004A     ;
CODE_08E25F:         sub   r11          ;
CODE_08E260:         to r14             ;
CODE_08E261:         lsr                ;
CODE_08E262:         from r12           ;
CODE_08E263:         lsr                ;
CODE_08E264:         iwt   r0,#4010     ;
CODE_08E267:         bcs CODE_08E26D    ;
CODE_08E269:         nop                ;
CODE_08E26A:         iwt   r0,#3040     ;
CODE_08E26D:         from r5            ;
CODE_08E26E:         stw   (r11)        ;
CODE_08E26F:         inc   r11          ;
CODE_08E270:         inc   r11          ;
CODE_08E271:         stw   (r11)        ;
CODE_08E272:         ldw   (r1)         ;
CODE_08E273:         add   r4           ;
CODE_08E274:         add   r14          ;
CODE_08E275:         bra CODE_08E289    ;

CODE_08E277:         sbk                ;
CODE_08E278:         from r14           ;
CODE_08E279:         sub   r4           ;
CODE_08E27A:         bne CODE_08E286    ;
CODE_08E27C:         from r12           ;
CODE_08E27D:         lsr                ;
CODE_08E27E:         bcs CODE_08E286    ;
CODE_08E280:         nop                ;
CODE_08E281:         iwt   r0,#0220     ;
CODE_08E284:         to r14             ;
CODE_08E285:         add   r14          ;
CODE_08E286:         ldw   (r1)         ;
CODE_08E287:         add   r14          ;
CODE_08E288:         sbk                ;
CODE_08E289:         inc   r1           ;
CODE_08E28A:         inc   r1           ;
CODE_08E28B:         from r12           ;
CODE_08E28C:         sub   #05          ;
CODE_08E28E:         bcs CODE_08E295    ;
CODE_08E290:         inc   r1           ;
CODE_08E291:         ibt   r0,#0040     ;
CODE_08E293:         stb   (r1)         ;
CODE_08E295:         loop               ;
CODE_08E296:         inc   r1           ;
CODE_08E297:         lms   r0,(003E)    ;
CODE_08E29A:         ibt   r5,#0060     ;
CODE_08E29C:         add   r5           ;
CODE_08E29D:         sub   r1           ;
CODE_08E29E:         bmi CODE_08E2B4    ;
CODE_08E2A0:         lsr                ;
CODE_08E2A1:         lsr                ;
CODE_08E2A2:         to r12             ;
CODE_08E2A3:         lsr                ;
CODE_08E2A4:         inc   r12          ;
CODE_08E2A5:         move  r0,r1        ;
CODE_08E2A7:         ibt   r5,#0008     ;
CODE_08E2A9:         iwt   r1,#8000     ;
CODE_08E2AC:         iwt   r13,#E2B0    ;
CODE_08E2AF:         from r1            ;
CODE_08E2B0:         stw   (r0)         ;
CODE_08E2B1:         add   r5           ;
CODE_08E2B2:         loop               ;
CODE_08E2B3:         from r1            ;
CODE_08E2B4:         stop               ;
CODE_08E2B5:         nop                ;
CODE_08E2B6:         sms   (0002),r5    ;
CODE_08E2B9:         iwt   r0,#4020     ;
CODE_08E2BC:         sms   (0004),r0    ;
CODE_08E2BF:         ldw   (r1)         ;
CODE_08E2C0:         add   r4           ;
CODE_08E2C1:         add   #04          ;
CODE_08E2C3:         sbk                ;
CODE_08E2C4:         dec   r1           ;
CODE_08E2C5:         dec   r1           ;
CODE_08E2C6:         ldw   (r1)         ;
CODE_08E2C7:         sub   #08          ;
CODE_08E2C9:         sbk                ;
CODE_08E2CA:         move  r11,r0       ;
CODE_08E2CC:         dec   r1           ;
CODE_08E2CD:         dec   r1           ;
CODE_08E2CE:         ldw   (r1)         ;
CODE_08E2CF:         sub   #08          ;
CODE_08E2D1:         sbk                ;
CODE_08E2D2:         move  r14,r0       ;
CODE_08E2D4:         with r1            ;
CODE_08E2D5:         add   #0C          ;
CODE_08E2D7:         ldw   (r1)         ;
CODE_08E2D8:         add   r4           ;
CODE_08E2D9:         add   #06          ;
CODE_08E2DB:         sbk                ;
CODE_08E2DC:         dec   r1           ;
CODE_08E2DD:         dec   r1           ;
CODE_08E2DE:         from r11           ;
CODE_08E2DF:         stw   (r1)         ;
CODE_08E2E0:         dec   r1           ;
CODE_08E2E1:         dec   r1           ;
CODE_08E2E2:         ibt   r0,#0010     ;
CODE_08E2E4:         add   r14          ;
CODE_08E2E5:         stw   (r1)         ;
CODE_08E2E6:         with r1            ;
CODE_08E2E7:         add   #0C          ;
CODE_08E2E9:         ldw   (r1)         ;
CODE_08E2EA:         add   r4           ;
CODE_08E2EB:         ibt   r5,#0024     ;
CODE_08E2ED:         add   r5           ;
CODE_08E2EE:         sbk                ;
CODE_08E2EF:         dec   r1           ;
CODE_08E2F0:         dec   r1           ;
CODE_08E2F1:         ibt   r0,#0010     ;
CODE_08E2F3:         add   r11          ;
CODE_08E2F4:         move  r11,r0       ;
CODE_08E2F6:         stw   (r1)         ;
CODE_08E2F7:         dec   r1           ;
CODE_08E2F8:         dec   r1           ;
CODE_08E2F9:         from r14           ;
CODE_08E2FA:         stw   (r1)         ;
CODE_08E2FB:         with r1            ;
CODE_08E2FC:         add   #0C          ;
CODE_08E2FE:         ldw   (r1)         ;
CODE_08E2FF:         add   r4           ;
CODE_08E300:         ibt   r5,#0026     ;
CODE_08E302:         add   r5           ;
CODE_08E303:         sbk                ;
CODE_08E304:         dec   r1           ;
CODE_08E305:         dec   r1           ;
CODE_08E306:         from r11           ;
CODE_08E307:         stw   (r1)         ;
CODE_08E308:         dec   r1           ;
CODE_08E309:         dec   r1           ;
CODE_08E30A:         ibt   r0,#0010     ;
CODE_08E30C:         add   r14          ;
CODE_08E30D:         stw   (r1)         ;
CODE_08E30E:         with r1            ;
CODE_08E30F:         add   #06          ;
CODE_08E311:         iwt   r15,#E28C    ;
CODE_08E314:         from r12           ;
CODE_08E315:         romb               ;
CODE_08E317:         iwt   r12,#00D2    ;
CODE_08E31A:         ibt   r0,#FFF7     ;
CODE_08E31C:         lms   r10,(000C)   ;
CODE_08E31F:         lms   r11,(000A)   ;
CODE_08E322:         cache              ;
CODE_08E323:         move  r13,r15      ;
CODE_08E325:         stw   (r10)        ;
CODE_08E326:         inc   r10          ;
CODE_08E327:         inc   r10          ;
CODE_08E328:         loop               ;
CODE_08E329:         dec   r0           ;
CODE_08E32A:         iwt   r4,#0200     ;
CODE_08E32D:         iwt   r5,#0500     ;
CODE_08E330:         lms   r0,(0000)    ;
CODE_08E333:         add   r4           ;
CODE_08E334:         cmp   r5           ;
CODE_08E336:         bcs CODE_08E342    ;
CODE_08E338:         nop                ;
CODE_08E339:         lms   r0,(0002)    ;
CODE_08E33C:         add   r4           ;
CODE_08E33D:         cmp   r5           ;
CODE_08E33F:         bcc CODE_08E344    ;
CODE_08E341:         nop                ;
CODE_08E342:         stop               ;
CODE_08E343:         nop                ;
CODE_08E344:         move  r14,r1       ;
CODE_08E346:         getb               ;
CODE_08E347:         inc   r14          ;
CODE_08E348:         to r6              ;
CODE_08E349:         swap               ;
CODE_08E34A:         from r3            ;
CODE_08E34B:         fmult              ;
CODE_08E34C:         move  r1,r0        ;
CODE_08E34E:         div2               ;
CODE_08E350:         bne CODE_08E357    ;
CODE_08E352:         nop                ;
CODE_08E353:         iwt   r15,#E445    ;
CODE_08E356:         nop                ;
CODE_08E357:         lms   r5,(0002)    ;
CODE_08E35A:         iwt   r9,#FFFF     ;
CODE_08E35D:         from r5            ;
CODE_08E35E:         sub   r0           ;
CODE_08E35F:         sub   r9           ;
CODE_08E360:         to r9              ;
CODE_08E361:         add   r0           ;
CODE_08E362:         sms   (0008),r9    ;
CODE_08E365:         lms   r7,(000C)    ;
CODE_08E368:         lms   r8,(000A)    ;
CODE_08E36B:         ibt   r11,#0000    ;
CODE_08E36D:         iwt   r5,#2200     ;
CODE_08E370:         from r3            ;
CODE_08E371:         add   r3           ;
CODE_08E372:         add   r5           ;
CODE_08E373:         to r5              ;
CODE_08E374:         ldw   (r0)         ;
CODE_08E375:         iwt   r6,#0080     ;
CODE_08E378:         lms   r0,(0000)    ;
CODE_08E37B:         sub   r6           ;
CODE_08E37C:         not                ;
CODE_08E37D:         inc   r0           ;
CODE_08E37E:         sms   (0000),r0    ;
CODE_08E381:         getb               ;
CODE_08E382:         cache              ;
CODE_08E383:         move  r12,r1       ;
CODE_08E385:         move  r13,r15      ;
CODE_08E387:         iwt   r6,#01A4     ;
CODE_08E38A:         from r9            ;
CODE_08E38B:         cmp   r6           ;
CODE_08E38D:         bcs CODE_08E3B3    ;
CODE_08E38F:         nop                ;
CODE_08E390:         inc   r14          ;
CODE_08E391:         from r8            ;
CODE_08E392:         to r10             ;
CODE_08E393:         add   r9           ;
CODE_08E394:         to r6              ;
CODE_08E395:         swap               ;
CODE_08E396:         from r2            ;
CODE_08E397:         fmult              ;
CODE_08E398:         lms   r6,(0000)    ;
CODE_08E39B:         from r6            ;
CODE_08E39C:         add   r0           ;
CODE_08E39D:         stw   (r10)        ;
CODE_08E39E:         to r6              ;
CODE_08E39F:         getb               ;
CODE_08E3A0:         dec   r14          ;
CODE_08E3A1:         from r2            ;
CODE_08E3A2:         lmult              ;
CODE_08E3A4:         with r4            ;
CODE_08E3A5:         hib                ;
CODE_08E3A6:         lob                ;
CODE_08E3A7:         swap               ;
CODE_08E3A8:         or    r4           ;
CODE_08E3A9:         add   r0           ;
CODE_08E3AA:         from r7            ;
CODE_08E3AB:         to r10             ;
CODE_08E3AC:         add   r9           ;
CODE_08E3AD:         sub   r9           ;
CODE_08E3AE:         div2               ;
CODE_08E3B0:         sub   #09          ;
CODE_08E3B2:         stw   (r10)        ;
CODE_08E3B3:         with r11           ;
CODE_08E3B4:         add   r5           ;
CODE_08E3B5:         from r11           ;
CODE_08E3B6:         hib                ;
CODE_08E3B7:         add   r0           ;
CODE_08E3B8:         with r14           ;
CODE_08E3B9:         add   r0           ;
CODE_08E3BA:         with r11           ;
CODE_08E3BB:         lob                ;
CODE_08E3BC:         inc   r9           ;
CODE_08E3BD:         getb               ;
CODE_08E3BE:         loop               ;
CODE_08E3BF:         inc   r9           ;
CODE_08E3C0:         ibt   r0,#0008     ;
CODE_08E3C2:         romb               ;
CODE_08E3C4:         lms   r11,(0006)   ;
CODE_08E3C7:         iwt   r5,#2200     ;
CODE_08E3CA:         from r11           ;
CODE_08E3CB:         add   r11          ;
CODE_08E3CC:         add   r5           ;
CODE_08E3CD:         to r11             ;
CODE_08E3CE:         ldw   (r0)         ;
CODE_08E3CF:         iwt   r0,#00FF     ;
CODE_08E3D2:         lms   r2,(000E)    ;
CODE_08E3D5:         to r2              ;
CODE_08E3D6:         and   r2           ;
CODE_08E3D7:         from r1            ;
CODE_08E3D8:         to r6              ;
CODE_08E3D9:         div2               ;
CODE_08E3DB:         with r6            ;
CODE_08E3DC:         add   r2           ;
CODE_08E3DD:         from r11           ;
CODE_08E3DE:         lmult              ;
CODE_08E3E0:         with r4            ;
CODE_08E3E1:         hib                ;
CODE_08E3E2:         lob                ;
CODE_08E3E3:         swap               ;
CODE_08E3E4:         or    r4           ;
CODE_08E3E5:         not                ;
CODE_08E3E6:         inc   r0           ;
CODE_08E3E7:         to r10             ;
CODE_08E3E8:         lob                ;
CODE_08E3E9:         lms   r5,(000A)    ;
CODE_08E3EC:         lms   r3,(0008)    ;
CODE_08E3EF:         iwt   r2,#AE58     ;
CODE_08E3F2:         from r2            ;
CODE_08E3F3:         to r14             ;
CODE_08E3F4:         add   r10          ;
CODE_08E3F5:         ibt   r9,#0000     ;
CODE_08E3F7:         lms   r0,(0004)    ;
CODE_08E3FA:         to r6              ;
CODE_08E3FB:         add   r0           ;
CODE_08E3FC:         getb               ;
CODE_08E3FD:         cache              ;
CODE_08E3FE:         iwt   r8,#0200     ;
CODE_08E401:         move  r12,r1       ;
CODE_08E403:         move  r13,r15      ;
CODE_08E405:         sex                ;
CODE_08E406:         lmult              ;
CODE_08E408:         iwt   r1,#01A4     ;
CODE_08E40B:         from r3            ;
CODE_08E40C:         cmp   r1           ;
CODE_08E40E:         bcs CODE_08E435    ;
CODE_08E410:         nop                ;
CODE_08E411:         with r4            ;
CODE_08E412:         hib                ;
CODE_08E413:         lob                ;
CODE_08E414:         swap               ;
CODE_08E415:         to r7              ;
CODE_08E416:         or    r4           ;
CODE_08E417:         from r5            ;
CODE_08E418:         to r1              ;
CODE_08E419:         add   r3           ;
CODE_08E41A:         iwt   r14,#0100    ;
CODE_08E41D:         ldw   (r1)         ;
CODE_08E41E:         add   r7           ;
CODE_08E41F:         to r4              ;
CODE_08E420:         add   r14          ;
CODE_08E421:         from r4            ;
CODE_08E422:         cmp   r8           ;
CODE_08E424:         bcc CODE_08E434    ;
CODE_08E426:         nop                ;
CODE_08E427:         lms   r0,(000C)    ;
CODE_08E42A:         to r7              ;
CODE_08E42B:         add   r3           ;
CODE_08E42C:         from r3            ;
CODE_08E42D:         div2               ;
CODE_08E42F:         not                ;
CODE_08E430:         inc   r0           ;
CODE_08E431:         sub   #09          ;
CODE_08E433:         stw   (r7)         ;
CODE_08E434:         sbk                ;
CODE_08E435:         with r9            ;
CODE_08E436:         add   r11          ;
CODE_08E437:         from r9            ;
CODE_08E438:         hib                ;
CODE_08E439:         add   r10          ;
CODE_08E43A:         to r10             ;
CODE_08E43B:         lob                ;
CODE_08E43C:         from r2            ;
CODE_08E43D:         to r14             ;
CODE_08E43E:         add   r10          ;
CODE_08E43F:         with r9            ;
CODE_08E440:         lob                ;
CODE_08E441:         inc   r3           ;
CODE_08E442:         inc   r3           ;
CODE_08E443:         loop               ;
CODE_08E444:         getb               ;
CODE_08E445:         stop               ;
CODE_08E446:         nop                ;

CODE_08E447:         from r3            ;
CODE_08E448:         to r5              ;
CODE_08E449:         add   r3           ;
CODE_08E44A:         ibt   r0,#0008     ;
CODE_08E44C:         romb               ;
CODE_08E44E:         iwt   r0,#AC18     ;
CODE_08E451:         to r14             ;
CODE_08E452:         add   r5           ;
CODE_08E453:         getb               ;
CODE_08E454:         inc   r14          ;
CODE_08E455:         getbh              ;
CODE_08E457:         move  r7,r0        ;
CODE_08E459:         iwt   r0,#AB98     ;
CODE_08E45C:         to r14             ;
CODE_08E45D:         add   r5           ;
CODE_08E45E:         getb               ;
CODE_08E45F:         inc   r14          ;
CODE_08E460:         getbh              ;
CODE_08E462:         move  r8,r0        ;
CODE_08E464:         from r1            ;
CODE_08E465:         romb               ;
CODE_08E467:         move  r14,r2       ;
CODE_08E469:         to r1              ;
CODE_08E46A:         getb               ;
CODE_08E46B:         inc   r14          ;
CODE_08E46C:         iwt   r5,#449E     ;
CODE_08E46F:         sms   (0048),r5    ;
CODE_08E472:         from r1            ;
CODE_08E473:         add   r1           ;
CODE_08E474:         add   r0           ;
CODE_08E475:         add   r5           ;
CODE_08E476:         sub   #04          ;
CODE_08E478:         sms   (004A),r0    ;
CODE_08E47B:         cache              ;
CODE_08E47C:         move  r12,r1       ;
CODE_08E47E:         move  r13,r15      ;
CODE_08E480:         to r6              ;
CODE_08E481:         getbs              ;
CODE_08E483:         inc   r14          ;
CODE_08E484:         from r7            ;
CODE_08E485:         lmult              ;
CODE_08E487:         with r4            ;
CODE_08E488:         hib                ;
CODE_08E489:         lob                ;
CODE_08E48A:         swap               ;
CODE_08E48B:         to r9              ;
CODE_08E48C:         or    r4           ;
CODE_08E48D:         from r8            ;
CODE_08E48E:         lmult              ;
CODE_08E490:         with r4            ;
CODE_08E491:         hib                ;
CODE_08E492:         lob                ;
CODE_08E493:         swap               ;
CODE_08E494:         to r10             ;
CODE_08E495:         or    r4           ;
CODE_08E496:         to r6              ;
CODE_08E497:         getbs              ;
CODE_08E499:         inc   r14          ;
CODE_08E49A:         from r7            ;
CODE_08E49B:         lmult              ;
CODE_08E49D:         with r4            ;
CODE_08E49E:         hib                ;
CODE_08E49F:         lob                ;
CODE_08E4A0:         swap               ;
CODE_08E4A1:         or    r4           ;
CODE_08E4A2:         from r10           ;
CODE_08E4A3:         sub   r0           ;
CODE_08E4A4:         stw   (r5)         ;
CODE_08E4A5:         inc   r5           ;
CODE_08E4A6:         inc   r5           ;
CODE_08E4A7:         from r8            ;
CODE_08E4A8:         lmult              ;
CODE_08E4AA:         with r4            ;
CODE_08E4AB:         hib                ;
CODE_08E4AC:         lob                ;
CODE_08E4AD:         swap               ;
CODE_08E4AE:         or    r4           ;
CODE_08E4AF:         add   r9           ;
CODE_08E4B0:         stw   (r5)         ;
CODE_08E4B1:         inc   r5           ;
CODE_08E4B2:         loop               ;
CODE_08E4B3:         inc   r5           ;
CODE_08E4B4:         ibt   r0,#0001     ;
CODE_08E4B6:         sms   (005E),r0    ;
CODE_08E4B9:         iwt   r15,#E9E2    ;
CODE_08E4BC:         nop                ;
CODE_08E4BD:         iwt   r1,#49C6     ;
CODE_08E4C0:         iwt   r11,#449E    ;
CODE_08E4C3:         to r12             ;
CODE_08E4C4:         ldb   (r1)         ;
CODE_08E4C6:         sms   (004C),r12   ;
CODE_08E4C9:         sms   (0048),r11   ;
CODE_08E4CC:         inc   r1           ;
CODE_08E4CD:         move  r3,r1        ;
CODE_08E4CF:         from r12           ;
CODE_08E4D0:         add   r12          ;
CODE_08E4D1:         to r14             ;
CODE_08E4D2:         add   r1           ;
CODE_08E4D3:         dec   r14          ;
CODE_08E4D4:         to r4              ;
CODE_08E4D5:         ldb   (r1)         ;
CODE_08E4D7:         inc   r1           ;
CODE_08E4D8:         to r5              ;
CODE_08E4D9:         ldb   (r1)         ;
CODE_08E4DB:         inc   r1           ;
CODE_08E4DC:         to r7              ;
CODE_08E4DD:         ldb   (r1)         ;
CODE_08E4DF:         inc   r1           ;
CODE_08E4E0:         to r8              ;
CODE_08E4E1:         ldb   (r1)         ;
CODE_08E4E3:         inc   r1           ;
CODE_08E4E4:         to r9              ;
CODE_08E4E5:         ldb   (r1)         ;
CODE_08E4E7:         inc   r1           ;
CODE_08E4E8:         to r10             ;
CODE_08E4E9:         ldb   (r1)         ;
CODE_08E4EB:         inc   r1           ;
CODE_08E4EC:         from r1            ;
CODE_08E4ED:         sub   r14          ;
CODE_08E4EE:         bcc CODE_08E4F3    ;
CODE_08E4F0:         cache              ;
CODE_08E4F1:         move  r1,r3        ;
CODE_08E4F3:         move  r13,r15      ;
CODE_08E4F5:         ibt   r0,#0020     ;
CODE_08E4F7:         to r2              ;
CODE_08E4F8:         mult  r4           ;
CODE_08E4F9:         ibt   r6,#0020     ;
CODE_08E4FB:         from r7            ;
CODE_08E4FC:         mult  r6           ;
CODE_08E4FD:         add   r2           ;
CODE_08E4FE:         div2               ;
CODE_08E500:         div2               ;
CODE_08E502:         div2               ;
CODE_08E504:         div2               ;
CODE_08E506:         div2               ;
CODE_08E508:         div2               ;
CODE_08E50A:         adc   #00          ;
CODE_08E50C:         stw   (r11)        ;
CODE_08E50D:         inc   r11          ;
CODE_08E50E:         inc   r11          ;
CODE_08E50F:         from r8            ;
CODE_08E510:         to r2              ;
CODE_08E511:         mult  r6           ;
CODE_08E512:         ibt   r0,#0020     ;
CODE_08E514:         mult  r5           ;
CODE_08E515:         add   r2           ;
CODE_08E516:         div2               ;
CODE_08E518:         div2               ;
CODE_08E51A:         div2               ;
CODE_08E51C:         div2               ;
CODE_08E51E:         div2               ;
CODE_08E520:         div2               ;
CODE_08E522:         adc   #00          ;
CODE_08E524:         stw   (r11)        ;
CODE_08E525:         inc   r11          ;
CODE_08E526:         inc   r11          ;
CODE_08E527:         ibt   r0,#0015     ;
CODE_08E529:         to r2              ;
CODE_08E52A:         mult  r4           ;
CODE_08E52B:         ibt   r0,#002A     ;
CODE_08E52D:         mult  r7           ;
CODE_08E52E:         with r2            ;
CODE_08E52F:         add   r0           ;
CODE_08E530:         ibt   r6,#0001     ;
CODE_08E532:         from r9            ;
CODE_08E533:         mult  r6           ;
CODE_08E534:         add   r2           ;
CODE_08E535:         div2               ;
CODE_08E537:         div2               ;
CODE_08E539:         div2               ;
CODE_08E53B:         div2               ;
CODE_08E53D:         div2               ;
CODE_08E53F:         div2               ;
CODE_08E541:         adc   #00          ;
CODE_08E543:         stw   (r11)        ;
CODE_08E544:         inc   r11          ;
CODE_08E545:         inc   r11          ;
CODE_08E546:         from r10           ;
CODE_08E547:         to r2              ;
CODE_08E548:         mult  r6           ;
CODE_08E549:         ibt   r0,#002A     ;
CODE_08E54B:         mult  r8           ;
CODE_08E54C:         with r2            ;
CODE_08E54D:         add   r0           ;
CODE_08E54E:         ibt   r0,#0015     ;
CODE_08E550:         mult  r5           ;
CODE_08E551:         add   r2           ;
CODE_08E552:         div2               ;
CODE_08E554:         div2               ;
CODE_08E556:         div2               ;
CODE_08E558:         div2               ;
CODE_08E55A:         div2               ;
CODE_08E55C:         div2               ;
CODE_08E55E:         adc   #00          ;
CODE_08E560:         stw   (r11)        ;
CODE_08E561:         inc   r11          ;
CODE_08E562:         inc   r11          ;
CODE_08E563:         ibt   r0,#000C     ;
CODE_08E565:         to r2              ;
CODE_08E566:         mult  r4           ;
CODE_08E567:         ibt   r0,#002F     ;
CODE_08E569:         mult  r7           ;
CODE_08E56A:         with r2            ;
CODE_08E56B:         add   r0           ;
CODE_08E56C:         ibt   r6,#0005     ;
CODE_08E56E:         from r9            ;
CODE_08E56F:         mult  r6           ;
CODE_08E570:         add   r2           ;
CODE_08E571:         div2               ;
CODE_08E573:         div2               ;
CODE_08E575:         div2               ;
CODE_08E577:         div2               ;
CODE_08E579:         div2               ;
CODE_08E57B:         div2               ;
CODE_08E57D:         adc   #00          ;
CODE_08E57F:         stw   (r11)        ;
CODE_08E580:         inc   r11          ;
CODE_08E581:         inc   r11          ;
CODE_08E582:         from r10           ;
CODE_08E583:         to r2              ;
CODE_08E584:         mult  r6           ;
CODE_08E585:         ibt   r0,#002F     ;
CODE_08E587:         mult  r8           ;
CODE_08E588:         with r2            ;
CODE_08E589:         add   r0           ;
CODE_08E58A:         ibt   r6,#000C     ;
CODE_08E58C:         from r5            ;
CODE_08E58D:         mult  r6           ;
CODE_08E58E:         add   r2           ;
CODE_08E58F:         div2               ;
CODE_08E591:         div2               ;
CODE_08E593:         div2               ;
CODE_08E595:         div2               ;
CODE_08E597:         div2               ;
CODE_08E599:         div2               ;
CODE_08E59B:         adc   #00          ;
CODE_08E59D:         stw   (r11)        ;
CODE_08E59E:         inc   r11          ;
CODE_08E59F:         inc   r11          ;
CODE_08E5A0:         from r9            ;
CODE_08E5A1:         to r2              ;
CODE_08E5A2:         mult  r6           ;
CODE_08E5A3:         ibt   r0,#002F     ;
CODE_08E5A5:         mult  r7           ;
CODE_08E5A6:         with r2            ;
CODE_08E5A7:         add   r0           ;
CODE_08E5A8:         ibt   r6,#0005     ;
CODE_08E5AA:         from r4            ;
CODE_08E5AB:         mult  r6           ;
CODE_08E5AC:         add   r2           ;
CODE_08E5AD:         div2               ;
CODE_08E5AF:         div2               ;
CODE_08E5B1:         div2               ;
CODE_08E5B3:         div2               ;
CODE_08E5B5:         div2               ;
CODE_08E5B7:         div2               ;
CODE_08E5B9:         adc   #00          ;
CODE_08E5BB:         stw   (r11)        ;
CODE_08E5BC:         inc   r11          ;
CODE_08E5BD:         inc   r11          ;
CODE_08E5BE:         from r5            ;
CODE_08E5BF:         to r2              ;
CODE_08E5C0:         mult  r6           ;
CODE_08E5C1:         ibt   r0,#002F     ;
CODE_08E5C3:         mult  r8           ;
CODE_08E5C4:         with r2            ;
CODE_08E5C5:         add   r0           ;
CODE_08E5C6:         ibt   r0,#000C     ;
CODE_08E5C8:         mult  r10          ;
CODE_08E5C9:         add   r2           ;
CODE_08E5CA:         div2               ;
CODE_08E5CC:         div2               ;
CODE_08E5CE:         div2               ;
CODE_08E5D0:         div2               ;
CODE_08E5D2:         div2               ;
CODE_08E5D4:         div2               ;
CODE_08E5D6:         adc   #00          ;
CODE_08E5D8:         stw   (r11)        ;
CODE_08E5D9:         inc   r11          ;
CODE_08E5DA:         inc   r11          ;
CODE_08E5DB:         ibt   r0,#0001     ;
CODE_08E5DD:         to r2              ;
CODE_08E5DE:         mult  r4           ;
CODE_08E5DF:         ibt   r0,#002A     ;
CODE_08E5E1:         mult  r7           ;
CODE_08E5E2:         with r2            ;
CODE_08E5E3:         add   r0           ;
CODE_08E5E4:         ibt   r6,#0015     ;
CODE_08E5E6:         from r9            ;
CODE_08E5E7:         mult  r6           ;
CODE_08E5E8:         add   r2           ;
CODE_08E5E9:         div2               ;
CODE_08E5EB:         div2               ;
CODE_08E5ED:         div2               ;
CODE_08E5EF:         div2               ;
CODE_08E5F1:         div2               ;
CODE_08E5F3:         div2               ;
CODE_08E5F5:         adc   #00          ;
CODE_08E5F7:         stw   (r11)        ;
CODE_08E5F8:         inc   r11          ;
CODE_08E5F9:         inc   r11          ;
CODE_08E5FA:         from r10           ;
CODE_08E5FB:         to r2              ;
CODE_08E5FC:         mult  r6           ;
CODE_08E5FD:         ibt   r0,#002A     ;
CODE_08E5FF:         mult  r8           ;
CODE_08E600:         with r2            ;
CODE_08E601:         add   r0           ;
CODE_08E602:         ibt   r0,#0001     ;
CODE_08E604:         mult  r5           ;
CODE_08E605:         add   r2           ;
CODE_08E606:         div2               ;
CODE_08E608:         div2               ;
CODE_08E60A:         div2               ;
CODE_08E60C:         div2               ;
CODE_08E60E:         div2               ;
CODE_08E610:         div2               ;
CODE_08E612:         adc   #00          ;
CODE_08E614:         stw   (r11)        ;
CODE_08E615:         move  r4,r7        ;
CODE_08E617:         move  r5,r8        ;
CODE_08E619:         move  r7,r9        ;
CODE_08E61B:         move  r8,r10       ;
CODE_08E61D:         to r9              ;
CODE_08E61E:         ldb   (r1)         ;
CODE_08E620:         inc   r1           ;
CODE_08E621:         to r10             ;
CODE_08E622:         ldb   (r1)         ;
CODE_08E624:         inc   r1           ;
CODE_08E625:         from r1            ;
CODE_08E626:         sub   r14          ;
CODE_08E627:         bcc CODE_08E62C    ;
CODE_08E629:         inc   r11          ;
CODE_08E62A:         move  r1,r3        ;
CODE_08E62C:         loop               ;
CODE_08E62D:         inc   r11          ;
CODE_08E62E:         lms   r2,(0048)    ;
CODE_08E631:         lms   r1,(004C)    ;
CODE_08E634:         from r1            ;
CODE_08E635:         add   r1           ;
CODE_08E636:         add   r0           ;
CODE_08E637:         add   r1           ;
CODE_08E638:         move  r1,r0        ;
CODE_08E63A:         add   r0           ;
CODE_08E63B:         add   r0           ;
CODE_08E63C:         add   r2           ;
CODE_08E63D:         sub   #04          ;
CODE_08E63F:         sms   (004A),r0    ;
CODE_08E642:         ibt   r0,#0001     ;
CODE_08E644:         sms   (005E),r0    ;
CODE_08E647:         iwt   r15,#E9E2    ;
CODE_08E64A:         nop                ;
CODE_08E64B:         iwt   r1,#49C6     ;
CODE_08E64E:         iwt   r0,#449E     ;
CODE_08E651:         link  #04          ;
CODE_08E652:         iwt   r15,#E66D    ;
CODE_08E655:         nop                ;
CODE_08E656:         ibt   r0,#0001     ;
CODE_08E658:         sms   (005E),r0    ;
CODE_08E65B:         iwt   r15,#E9E2    ;
CODE_08E65E:         nop                ;
CODE_08E65F:         nop                ;
CODE_08E660:         iwt   r1,#49C6     ;
CODE_08E663:         iwt   r0,#449E     ;
CODE_08E666:         link  #04          ;
CODE_08E667:         iwt   r15,#E66D    ;
CODE_08E66A:         nop                ;
CODE_08E66B:         stop               ;
CODE_08E66C:         nop                ;

CODE_08E66D:         sms   (0056),r11   ;
CODE_08E670:         move  r11,r0       ;
CODE_08E672:         move  r12,r2       ;
CODE_08E674:         sms   (004C),r12   ;
CODE_08E677:         sms   (0048),r11   ;
CODE_08E67A:         move  r3,r1        ;
CODE_08E67C:         from r12           ;
CODE_08E67D:         add   r12          ;
CODE_08E67E:         add   r0           ;
CODE_08E67F:         to r14             ;
CODE_08E680:         add   r1           ;
CODE_08E681:         dec   r14          ;
CODE_08E682:         dec   r14          ;
CODE_08E683:         to r4              ;
CODE_08E684:         ldw   (r1)         ;
CODE_08E685:         inc   r1           ;
CODE_08E686:         inc   r1           ;
CODE_08E687:         to r5              ;
CODE_08E688:         ldw   (r1)         ;
CODE_08E689:         inc   r1           ;
CODE_08E68A:         inc   r1           ;
CODE_08E68B:         to r7              ;
CODE_08E68C:         ldw   (r1)         ;
CODE_08E68D:         inc   r1           ;
CODE_08E68E:         inc   r1           ;
CODE_08E68F:         to r8              ;
CODE_08E690:         ldw   (r1)         ;
CODE_08E691:         inc   r1           ;
CODE_08E692:         inc   r1           ;
CODE_08E693:         to r9              ;
CODE_08E694:         ldw   (r1)         ;
CODE_08E695:         inc   r1           ;
CODE_08E696:         inc   r1           ;
CODE_08E697:         to r10             ;
CODE_08E698:         ldw   (r1)         ;
CODE_08E699:         inc   r1           ;
CODE_08E69A:         inc   r1           ;
CODE_08E69B:         from r1            ;
CODE_08E69C:         sub   r14          ;
CODE_08E69D:         bcc CODE_08E6A2    ;
CODE_08E69F:         cache              ;
CODE_08E6A0:         move  r1,r3        ;
CODE_08E6A2:         move  r13,r15      ;
CODE_08E6A4:         ibt   r0,#0020     ;
CODE_08E6A6:         to r2              ;
CODE_08E6A7:         mult  r4           ;
CODE_08E6A8:         ibt   r6,#0020     ;
CODE_08E6AA:         from r7            ;
CODE_08E6AB:         mult  r6           ;
CODE_08E6AC:         add   r2           ;
CODE_08E6AD:         div2               ;
CODE_08E6AF:         div2               ;
CODE_08E6B1:         div2               ;
CODE_08E6B3:         div2               ;
CODE_08E6B5:         div2               ;
CODE_08E6B7:         div2               ;
CODE_08E6B9:         adc   #00          ;
CODE_08E6BB:         stw   (r11)        ;
CODE_08E6BC:         inc   r11          ;
CODE_08E6BD:         inc   r11          ;
CODE_08E6BE:         from r8            ;
CODE_08E6BF:         to r2              ;
CODE_08E6C0:         mult  r6           ;
CODE_08E6C1:         ibt   r0,#0020     ;
CODE_08E6C3:         mult  r5           ;
CODE_08E6C4:         add   r2           ;
CODE_08E6C5:         div2               ;
CODE_08E6C7:         div2               ;
CODE_08E6C9:         div2               ;
CODE_08E6CB:         div2               ;
CODE_08E6CD:         div2               ;
CODE_08E6CF:         div2               ;
CODE_08E6D1:         adc   #00          ;
CODE_08E6D3:         stw   (r11)        ;
CODE_08E6D4:         inc   r11          ;
CODE_08E6D5:         inc   r11          ;
CODE_08E6D6:         ibt   r0,#0015     ;
CODE_08E6D8:         to r2              ;
CODE_08E6D9:         mult  r4           ;
CODE_08E6DA:         ibt   r0,#002A     ;
CODE_08E6DC:         mult  r7           ;
CODE_08E6DD:         with r2            ;
CODE_08E6DE:         add   r0           ;
CODE_08E6DF:         ibt   r6,#0001     ;
CODE_08E6E1:         from r9            ;
CODE_08E6E2:         mult  r6           ;
CODE_08E6E3:         add   r2           ;
CODE_08E6E4:         div2               ;
CODE_08E6E6:         div2               ;
CODE_08E6E8:         div2               ;
CODE_08E6EA:         div2               ;
CODE_08E6EC:         div2               ;
CODE_08E6EE:         div2               ;
CODE_08E6F0:         adc   #00          ;
CODE_08E6F2:         stw   (r11)        ;
CODE_08E6F3:         inc   r11          ;
CODE_08E6F4:         inc   r11          ;
CODE_08E6F5:         from r10           ;
CODE_08E6F6:         to r2              ;
CODE_08E6F7:         mult  r6           ;
CODE_08E6F8:         ibt   r0,#002A     ;
CODE_08E6FA:         mult  r8           ;
CODE_08E6FB:         with r2            ;
CODE_08E6FC:         add   r0           ;
CODE_08E6FD:         ibt   r0,#0015     ;
CODE_08E6FF:         mult  r5           ;
CODE_08E700:         add   r2           ;
CODE_08E701:         div2               ;
CODE_08E703:         div2               ;
CODE_08E705:         div2               ;
CODE_08E707:         div2               ;
CODE_08E709:         div2               ;
CODE_08E70B:         div2               ;
CODE_08E70D:         adc   #00          ;
CODE_08E70F:         stw   (r11)        ;
CODE_08E710:         inc   r11          ;
CODE_08E711:         inc   r11          ;
CODE_08E712:         ibt   r0,#000C     ;
CODE_08E714:         to r2              ;
CODE_08E715:         mult  r4           ;
CODE_08E716:         ibt   r0,#002F     ;
CODE_08E718:         mult  r7           ;
CODE_08E719:         with r2            ;
CODE_08E71A:         add   r0           ;
CODE_08E71B:         ibt   r6,#0005     ;
CODE_08E71D:         from r9            ;
CODE_08E71E:         mult  r6           ;
CODE_08E71F:         add   r2           ;
CODE_08E720:         div2               ;
CODE_08E722:         div2               ;
CODE_08E724:         div2               ;
CODE_08E726:         div2               ;
CODE_08E728:         div2               ;
CODE_08E72A:         div2               ;
CODE_08E72C:         adc   #00          ;
CODE_08E72E:         stw   (r11)        ;
CODE_08E72F:         inc   r11          ;
CODE_08E730:         inc   r11          ;
CODE_08E731:         from r10           ;
CODE_08E732:         to r2              ;
CODE_08E733:         mult  r6           ;
CODE_08E734:         ibt   r0,#002F     ;
CODE_08E736:         mult  r8           ;
CODE_08E737:         with r2            ;
CODE_08E738:         add   r0           ;
CODE_08E739:         ibt   r6,#000C     ;
CODE_08E73B:         from r5            ;
CODE_08E73C:         mult  r6           ;
CODE_08E73D:         add   r2           ;
CODE_08E73E:         div2               ;
CODE_08E740:         div2               ;
CODE_08E742:         div2               ;
CODE_08E744:         div2               ;
CODE_08E746:         div2               ;
CODE_08E748:         div2               ;
CODE_08E74A:         adc   #00          ;
CODE_08E74C:         stw   (r11)        ;
CODE_08E74D:         inc   r11          ;
CODE_08E74E:         inc   r11          ;
CODE_08E74F:         from r9            ;
CODE_08E750:         to r2              ;
CODE_08E751:         mult  r6           ;
CODE_08E752:         ibt   r0,#002F     ;
CODE_08E754:         mult  r7           ;
CODE_08E755:         with r2            ;
CODE_08E756:         add   r0           ;
CODE_08E757:         ibt   r6,#0005     ;
CODE_08E759:         from r4            ;
CODE_08E75A:         mult  r6           ;
CODE_08E75B:         add   r2           ;
CODE_08E75C:         div2               ;
CODE_08E75E:         div2               ;
CODE_08E760:         div2               ;
CODE_08E762:         div2               ;
CODE_08E764:         div2               ;
CODE_08E766:         div2               ;
CODE_08E768:         adc   #00          ;
CODE_08E76A:         stw   (r11)        ;
CODE_08E76B:         inc   r11          ;
CODE_08E76C:         inc   r11          ;
CODE_08E76D:         from r5            ;
CODE_08E76E:         to r2              ;
CODE_08E76F:         mult  r6           ;
CODE_08E770:         ibt   r0,#002F     ;
CODE_08E772:         mult  r8           ;
CODE_08E773:         with r2            ;
CODE_08E774:         add   r0           ;
CODE_08E775:         ibt   r0,#000C     ;
CODE_08E777:         mult  r10          ;
CODE_08E778:         add   r2           ;
CODE_08E779:         div2               ;
CODE_08E77B:         div2               ;
CODE_08E77D:         div2               ;
CODE_08E77F:         div2               ;
CODE_08E781:         div2               ;
CODE_08E783:         div2               ;
CODE_08E785:         adc   #00          ;
CODE_08E787:         stw   (r11)        ;
CODE_08E788:         inc   r11          ;
CODE_08E789:         inc   r11          ;
CODE_08E78A:         ibt   r0,#0001     ;
CODE_08E78C:         to r2              ;
CODE_08E78D:         mult  r4           ;
CODE_08E78E:         ibt   r0,#002A     ;
CODE_08E790:         mult  r7           ;
CODE_08E791:         with r2            ;
CODE_08E792:         add   r0           ;
CODE_08E793:         ibt   r6,#0015     ;
CODE_08E795:         from r9            ;
CODE_08E796:         mult  r6           ;
CODE_08E797:         add   r2           ;
CODE_08E798:         div2               ;
CODE_08E79A:         div2               ;
CODE_08E79C:         div2               ;
CODE_08E79E:         div2               ;
CODE_08E7A0:         div2               ;
CODE_08E7A2:         div2               ;
CODE_08E7A4:         adc   #00          ;
CODE_08E7A6:         stw   (r11)        ;
CODE_08E7A7:         inc   r11          ;
CODE_08E7A8:         inc   r11          ;
CODE_08E7A9:         from r10           ;
CODE_08E7AA:         to r2              ;
CODE_08E7AB:         mult  r6           ;
CODE_08E7AC:         ibt   r0,#002A     ;
CODE_08E7AE:         mult  r8           ;
CODE_08E7AF:         with r2            ;
CODE_08E7B0:         add   r0           ;
CODE_08E7B1:         ibt   r0,#0001     ;
CODE_08E7B3:         mult  r5           ;
CODE_08E7B4:         add   r2           ;
CODE_08E7B5:         div2               ;
CODE_08E7B7:         div2               ;
CODE_08E7B9:         div2               ;
CODE_08E7BB:         div2               ;
CODE_08E7BD:         div2               ;
CODE_08E7BF:         div2               ;
CODE_08E7C1:         adc   #00          ;
CODE_08E7C3:         stw   (r11)        ;
CODE_08E7C4:         move  r4,r7        ;
CODE_08E7C6:         move  r5,r8        ;
CODE_08E7C8:         move  r7,r9        ;
CODE_08E7CA:         move  r8,r10       ;
CODE_08E7CC:         to r9              ;
CODE_08E7CD:         ldw   (r1)         ;
CODE_08E7CE:         inc   r1           ;
CODE_08E7CF:         inc   r1           ;
CODE_08E7D0:         to r10             ;
CODE_08E7D1:         ldw   (r1)         ;
CODE_08E7D2:         inc   r1           ;
CODE_08E7D3:         inc   r1           ;
CODE_08E7D4:         from r1            ;
CODE_08E7D5:         sub   r14          ;
CODE_08E7D6:         bcc CODE_08E7DB    ;
CODE_08E7D8:         inc   r11          ;
CODE_08E7D9:         move  r1,r3        ;
CODE_08E7DB:         loop               ;
CODE_08E7DC:         inc   r11          ;
CODE_08E7DD:         lms   r2,(0048)    ;
CODE_08E7E0:         lms   r1,(004C)    ;
CODE_08E7E3:         from r1            ;
CODE_08E7E4:         add   r1           ;
CODE_08E7E5:         add   r0           ;
CODE_08E7E6:         add   r1           ;
CODE_08E7E7:         move  r1,r0        ;
CODE_08E7E9:         add   r0           ;
CODE_08E7EA:         add   r0           ;
CODE_08E7EB:         add   r2           ;
CODE_08E7EC:         sub   #04          ;
CODE_08E7EE:         sms   (004A),r0    ;
CODE_08E7F1:         lms   r11,(0056)   ;
CODE_08E7F4:         jmp   r11          ;
CODE_08E7F5:         nop                ;

CODE_08E7F6:         ibt   r10,#0000    ;
CODE_08E7F8:         sms   (0044),r10   ;
CODE_08E7FB:         ibt   r11,#0000    ;
CODE_08E7FD:         sms   (0046),r11   ;
CODE_08E800:         link  #04          ;
CODE_08E801:         iwt   r15,#E824    ;
CODE_08E804:         nop                ;
CODE_08E805:         link  #04          ;
CODE_08E806:         iwt   r15,#E8DA    ;
CODE_08E809:         nop                ;
CODE_08E80A:         iwt   r15,#E9E2    ;
CODE_08E80D:         nop                ;
CODE_08E80E:         ibt   r10,#0000    ;
CODE_08E810:         sms   (0044),r10   ;
CODE_08E813:         ibt   r11,#0000    ;
CODE_08E815:         sms   (0046),r11   ;
CODE_08E818:         link  #04          ;
CODE_08E819:         iwt   r15,#E824    ;
CODE_08E81C:         nop                ;
CODE_08E81D:         link  #04          ;
CODE_08E81E:         iwt   r15,#E8DA    ;
CODE_08E821:         nop                ;
CODE_08E822:         stop               ;
CODE_08E823:         nop                ;

CODE_08E824:         sms   (0056),r11   ;
CODE_08E827:         lms   r10,(0044)   ;
CODE_08E82A:         lms   r11,(0046)   ;
CODE_08E82D:         romb               ;
CODE_08E82F:         move  r9,r1        ;
CODE_08E831:         move  r14,r14      ;
CODE_08E833:         move  r12,r3       ;
CODE_08E835:         getb               ;
CODE_08E836:         cache              ;
CODE_08E837:         move  r13,r15      ;
CODE_08E839:         inc   r14          ;
CODE_08E83A:         add   r10          ;
CODE_08E83B:         stw   (r9)         ;
CODE_08E83C:         inc   r9           ;
CODE_08E83D:         inc   r9           ;
CODE_08E83E:         getb               ;
CODE_08E83F:         inc   r14          ;
CODE_08E840:         add   r11          ;
CODE_08E841:         stw   (r9)         ;
CODE_08E842:         inc   r9           ;
CODE_08E843:         inc   r9           ;
CODE_08E844:         loop               ;
CODE_08E845:         getb               ;
CODE_08E846:         from r8            ;
CODE_08E847:         romb               ;
CODE_08E849:         move  r9,r2        ;
CODE_08E84B:         move  r14,r7       ;
CODE_08E84D:         move  r12,r3       ;
CODE_08E84F:         getb               ;
CODE_08E850:         cache              ;
CODE_08E851:         move  r13,r15      ;
CODE_08E853:         inc   r14          ;
CODE_08E854:         add   r10          ;
CODE_08E855:         stw   (r9)         ;
CODE_08E856:         inc   r9           ;
CODE_08E857:         inc   r9           ;
CODE_08E858:         getb               ;
CODE_08E859:         inc   r14          ;
CODE_08E85A:         add   r11          ;
CODE_08E85B:         stw   (r9)         ;
CODE_08E85C:         inc   r9           ;
CODE_08E85D:         inc   r9           ;
CODE_08E85E:         loop               ;
CODE_08E85F:         getb               ;
CODE_08E860:         lms   r11,(0056)   ;
CODE_08E863:         jmp   r11          ;
CODE_08E864:         nop                ;

CODE_08E865:         ibt   r10,#0000    ;
CODE_08E867:         sms   (0044),r10   ;
CODE_08E86A:         ibt   r11,#0000    ;
CODE_08E86C:         sms   (0046),r11   ;
CODE_08E86F:         link  #04          ;
CODE_08E870:         iwt   r15,#E87D    ;
CODE_08E873:         nop                ;
CODE_08E874:         link  #04          ;
CODE_08E875:         iwt   r15,#E8DA    ;
CODE_08E878:         nop                ;
CODE_08E879:         iwt   r15,#E9E2    ;
CODE_08E87C:         nop                ;
CODE_08E87D:         sms   (0056),r11   ;
CODE_08E880:         lms   r10,(0044)   ;
CODE_08E883:         lms   r11,(0046)   ;
CODE_08E886:         romb               ;
CODE_08E888:         move  r9,r1        ;
CODE_08E88A:         move  r14,r14      ;
CODE_08E88C:         move  r12,r3       ;
CODE_08E88E:         getb               ;
CODE_08E88F:         cache              ;
CODE_08E890:         move  r13,r15      ;
CODE_08E892:         inc   r14          ;
CODE_08E893:         getbh              ;
CODE_08E895:         inc   r14          ;
CODE_08E896:         add   r10          ;
CODE_08E897:         stw   (r9)         ;
CODE_08E898:         inc   r9           ;
CODE_08E899:         inc   r9           ;
CODE_08E89A:         getb               ;
CODE_08E89B:         inc   r14          ;
CODE_08E89C:         getbh              ;
CODE_08E89E:         inc   r14          ;
CODE_08E89F:         add   r11          ;
CODE_08E8A0:         stw   (r9)         ;
CODE_08E8A1:         inc   r9           ;
CODE_08E8A2:         inc   r9           ;
CODE_08E8A3:         loop               ;
CODE_08E8A4:         getb               ;
CODE_08E8A5:         from r8            ;
CODE_08E8A6:         romb               ;
CODE_08E8A8:         move  r9,r2        ;
CODE_08E8AA:         move  r14,r7       ;
CODE_08E8AC:         move  r12,r3       ;
CODE_08E8AE:         getb               ;
CODE_08E8AF:         cache              ;
CODE_08E8B0:         move  r13,r15      ;
CODE_08E8B2:         inc   r14          ;
CODE_08E8B3:         getbh              ;
CODE_08E8B5:         inc   r14          ;
CODE_08E8B6:         add   r10          ;
CODE_08E8B7:         stw   (r9)         ;
CODE_08E8B8:         inc   r9           ;
CODE_08E8B9:         inc   r9           ;
CODE_08E8BA:         getb               ;
CODE_08E8BB:         inc   r14          ;
CODE_08E8BC:         getbh              ;
CODE_08E8BE:         inc   r14          ;
CODE_08E8BF:         add   r11          ;
CODE_08E8C0:         stw   (r9)         ;
CODE_08E8C1:         inc   r9           ;
CODE_08E8C2:         inc   r9           ;
CODE_08E8C3:         loop               ;
CODE_08E8C4:         getb               ;
CODE_08E8C5:         lms   r11,(0056)   ;
CODE_08E8C8:         jmp   r11          ;
CODE_08E8C9:         nop                ;

CODE_08E8CA:         link  #04          ;
CODE_08E8CB:         iwt   r15,#E8DA    ;
CODE_08E8CE:         nop                ;
CODE_08E8CF:         iwt   r15,#E9E2    ;
CODE_08E8D2:         nop                ;
CODE_08E8D3:         link  #04          ;
CODE_08E8D4:         iwt   r15,#E8DA    ;
CODE_08E8D7:         nop                ;
CODE_08E8D8:         stop               ;
CODE_08E8D9:         nop                ;

CODE_08E8DA:         sms   (0056),r11   ;
CODE_08E8DD:         sms   (0044),r3    ;
CODE_08E8E0:         sms   (0048),r5    ;
CODE_08E8E3:         from r3            ;
CODE_08E8E4:         add   r3           ;
CODE_08E8E5:         add   r0           ;
CODE_08E8E6:         add   r5           ;
CODE_08E8E7:         sub   #04          ;
CODE_08E8E9:         sms   (004A),r0    ;
CODE_08E8EC:         from r4            ;
CODE_08E8ED:         add   r4           ;
CODE_08E8EE:         add   r0           ;
CODE_08E8EF:         to r8              ;
CODE_08E8F0:         add   r1           ;
CODE_08E8F1:         to r9              ;
CODE_08E8F2:         add   r2           ;
CODE_08E8F3:         to r7              ;
CODE_08E8F4:         ldw   (r8)         ;
CODE_08E8F5:         inc   r8           ;
CODE_08E8F6:         inc   r8           ;
CODE_08E8F7:         ldw   (r9)         ;
CODE_08E8F8:         inc   r9           ;
CODE_08E8F9:         inc   r9           ;
CODE_08E8FA:         to r10             ;
CODE_08E8FB:         sub   r7           ;
CODE_08E8FC:         to r7              ;
CODE_08E8FD:         ldw   (r8)         ;
CODE_08E8FE:         ldw   (r9)         ;
CODE_08E8FF:         to r11             ;
CODE_08E900:         sub   r7           ;
CODE_08E901:         move  r12,r3       ;
CODE_08E903:         move  r13,r15      ;
CODE_08E905:         to r7              ;
CODE_08E906:         ldw   (r1)         ;
CODE_08E907:         inc   r1           ;
CODE_08E908:         inc   r1           ;
CODE_08E909:         ldw   (r2)         ;
CODE_08E90A:         inc   r2           ;
CODE_08E90B:         inc   r2           ;
CODE_08E90C:         sub   r7           ;
CODE_08E90D:         sub   r10          ;
CODE_08E90E:         lmult              ;
CODE_08E910:         with r4            ;
CODE_08E911:         hib                ;
CODE_08E912:         lob                ;
CODE_08E913:         swap               ;
CODE_08E914:         or    r4           ;
CODE_08E915:         add   r7           ;
CODE_08E916:         stw   (r5)         ;
CODE_08E917:         inc   r5           ;
CODE_08E918:         inc   r5           ;
CODE_08E919:         to r7              ;
CODE_08E91A:         ldw   (r1)         ;
CODE_08E91B:         inc   r1           ;
CODE_08E91C:         inc   r1           ;
CODE_08E91D:         ldw   (r2)         ;
CODE_08E91E:         inc   r2           ;
CODE_08E91F:         inc   r2           ;
CODE_08E920:         sub   r7           ;
CODE_08E921:         sub   r11          ;
CODE_08E922:         lmult              ;
CODE_08E924:         with r4            ;
CODE_08E925:         hib                ;
CODE_08E926:         lob                ;
CODE_08E927:         swap               ;
CODE_08E928:         or    r4           ;
CODE_08E929:         add   r7           ;
CODE_08E92A:         stw   (r5)         ;
CODE_08E92B:         inc   r5           ;
CODE_08E92C:         loop               ;
CODE_08E92D:         inc   r5           ;
CODE_08E92E:         lms   r1,(0044)    ;
CODE_08E931:         ibt   r0,#0000     ;
CODE_08E933:         sms   (005E),r0    ;
CODE_08E936:         lms   r11,(0056)   ;
CODE_08E939:         jmp   r11          ;
CODE_08E93A:         nop                ;
CODE_08E93B:         link  #04          ;
CODE_08E93C:         iwt   r15,#E944    ;
CODE_08E93F:         nop                ;
CODE_08E940:         iwt   r15,#E9E2    ;
CODE_08E943:         nop                ;
CODE_08E944:         sms   (004C),r11   ;
CODE_08E947:         romb               ;
CODE_08E949:         sms   (0044),r3    ;
CODE_08E94C:         sms   (0048),r5    ;
CODE_08E94F:         from r3            ;
CODE_08E950:         add   r3           ;
CODE_08E951:         add   r0           ;
CODE_08E952:         add   r5           ;
CODE_08E953:         sub   #04          ;
CODE_08E955:         sms   (004A),r0    ;
CODE_08E958:         from r4            ;
CODE_08E959:         add   r4           ;
CODE_08E95A:         to r8              ;
CODE_08E95B:         add   r1           ;
CODE_08E95C:         move  r14,r8       ;
CODE_08E95E:         to r9              ;
CODE_08E95F:         add   r2           ;
CODE_08E960:         to r7              ;
CODE_08E961:         getbs              ;
CODE_08E963:         move  r14,r9       ;
CODE_08E965:         inc   r8           ;
CODE_08E966:         getbs              ;
CODE_08E968:         inc   r9           ;
CODE_08E969:         to r10             ;
CODE_08E96A:         sub   r7           ;
CODE_08E96B:         move  r14,r8       ;
CODE_08E96D:         to r7              ;
CODE_08E96E:         getb               ;
CODE_08E96F:         dec   r7           ;
CODE_08E970:         bmi CODE_08E978    ;
CODE_08E972:         inc   r7           ;
CODE_08E973:         iwt   r0,#FF00     ;
CODE_08E976:         to r7              ;
CODE_08E977:         or    r7           ;
CODE_08E978:         move  r14,r9       ;
CODE_08E97A:         getb               ;
CODE_08E97B:         dec   r0           ;
CODE_08E97C:         bmi CODE_08E983    ;
CODE_08E97E:         inc   r0           ;
CODE_08E97F:         iwt   r11,#FF00    ;
CODE_08E982:         or    r11          ;
CODE_08E983:         to r11             ;
CODE_08E984:         sub   r7           ;
CODE_08E985:         move  r12,r3       ;
CODE_08E987:         move  r13,r15      ;
CODE_08E989:         move  r14,r1       ;
CODE_08E98B:         to r7              ;
CODE_08E98C:         getbs              ;
CODE_08E98E:         move  r14,r2       ;
CODE_08E990:         inc   r1           ;
CODE_08E991:         getbs              ;
CODE_08E993:         move  r14,r1       ;
CODE_08E995:         inc   r2           ;
CODE_08E996:         sub   r7           ;
CODE_08E997:         sub   r10          ;
CODE_08E998:         lmult              ;
CODE_08E99A:         with r4            ;
CODE_08E99B:         swap               ;
CODE_08E99C:         from r4            ;
CODE_08E99D:         to r3              ;
CODE_08E99E:         add   r4           ;
CODE_08E99F:         with r4            ;
CODE_08E9A0:         lob                ;
CODE_08E9A1:         lob                ;
CODE_08E9A2:         swap               ;
CODE_08E9A3:         or    r4           ;
CODE_08E9A4:         adc   r7           ;
CODE_08E9A6:         stw   (r5)         ;
CODE_08E9A7:         inc   r5           ;
CODE_08E9A8:         inc   r5           ;
CODE_08E9A9:         to r7              ;
CODE_08E9AA:         getb               ;
CODE_08E9AB:         dec   r7           ;
CODE_08E9AC:         bmi CODE_08E9B4    ;
CODE_08E9AE:         inc   r7           ;
CODE_08E9AF:         iwt   r0,#FF00     ;
CODE_08E9B2:         to r7              ;
CODE_08E9B3:         or    r7           ;
CODE_08E9B4:         move  r14,r2       ;
CODE_08E9B6:         inc   r1           ;
CODE_08E9B7:         getb               ;
CODE_08E9B8:         dec   r0           ;
CODE_08E9B9:         bmi CODE_08E9C0    ;
CODE_08E9BB:         inc   r0           ;
CODE_08E9BC:         iwt   r4,#FF00     ;
CODE_08E9BF:         or    r4           ;
CODE_08E9C0:         inc   r2           ;
CODE_08E9C1:         sub   r7           ;
CODE_08E9C2:         sub   r11          ;
CODE_08E9C3:         lmult              ;
CODE_08E9C5:         with r4            ;
CODE_08E9C6:         swap               ;
CODE_08E9C7:         from r4            ;
CODE_08E9C8:         to r3              ;
CODE_08E9C9:         add   r4           ;
CODE_08E9CA:         with r4            ;
CODE_08E9CB:         lob                ;
CODE_08E9CC:         lob                ;
CODE_08E9CD:         swap               ;
CODE_08E9CE:         or    r4           ;
CODE_08E9CF:         adc   r7           ;
CODE_08E9D1:         stw   (r5)         ;
CODE_08E9D2:         inc   r5           ;
CODE_08E9D3:         loop               ;
CODE_08E9D4:         inc   r5           ;
CODE_08E9D5:         lms   r1,(0044)    ;
CODE_08E9D8:         ibt   r0,#0001     ;
CODE_08E9DA:         sms   (005E),r0    ;
CODE_08E9DD:         lms   r11,(004C)   ;
CODE_08E9E0:         jmp   r11          ;
CODE_08E9E1:         nop                ;
CODE_08E9E2:         iwt   r12,#00D2    ;
CODE_08E9E5:         ibt   r0,#FFF7     ;
CODE_08E9E7:         iwt   r10,#3372    ;
CODE_08E9EA:         cache              ;
CODE_08E9EB:         move  r13,r15      ;
CODE_08E9ED:         stw   (r10)        ;
CODE_08E9EE:         inc   r10          ;
CODE_08E9EF:         inc   r10          ;
CODE_08E9F0:         loop               ;
CODE_08E9F1:         dec   r0           ;
CODE_08E9F2:         lms   r0,(005E)    ;
CODE_08E9F5:         moves r0,r0        ;
CODE_08E9F7:         beq CODE_08EA18    ;
CODE_08E9F9:         nop                ;
CODE_08E9FA:         lms   r8,(0040)    ;
CODE_08E9FD:         iwt   r0,#0080     ;
CODE_08EA00:         iwt   r9,#0200     ;
CODE_08EA03:         add   r8           ;
CODE_08EA04:         sub   r9           ;
CODE_08EA05:         bcs CODE_08EA16    ;
CODE_08EA07:         nop                ;
CODE_08EA08:         lms   r8,(0042)    ;
CODE_08EA0B:         iwt   r0,#0100     ;
CODE_08EA0E:         iwt   r9,#02D2     ;
CODE_08EA11:         add   r8           ;
CODE_08EA12:         sub   r9           ;
CODE_08EA13:         bcc CODE_08EA18    ;
CODE_08EA15:         nop                ;
CODE_08EA16:         stop               ;
CODE_08EA17:         nop                ;

CODE_08EA18:         lms   r0,(0042)    ;
CODE_08EA1B:         sub   #09          ;
CODE_08EA1D:         sbk                ;
CODE_08EA1E:         cache              ;
CODE_08EA1F:         lms   r0,(0048)    ;
CODE_08EA22:         to r5              ;
CODE_08EA23:         add   #02          ;
CODE_08EA25:         iwt   r11,#07FF    ;
CODE_08EA28:         iwt   r8,#F800     ;
CODE_08EA2B:         ldw   (r5)         ;
CODE_08EA2C:         move  r12,r1       ;
CODE_08EA2E:         move  r13,r15      ;
CODE_08EA30:         cmp   r11          ;
CODE_08EA32:         beq CODE_08EA38    ;
CODE_08EA34:         nop                ;
CODE_08EA35:         bpl CODE_08EA3C    ;
CODE_08EA37:         nop                ;
CODE_08EA38:         move  r11,r0       ;
CODE_08EA3A:         move  r1,r5        ;
CODE_08EA3C:         cmp   r8           ;
CODE_08EA3E:         bmi CODE_08EA43    ;
CODE_08EA40:         nop                ;
CODE_08EA41:         move  r8,r0        ;
CODE_08EA43:         with r5            ;
CODE_08EA44:         add   #04          ;
CODE_08EA46:         loop               ;
CODE_08EA47:         ldw   (r5)         ;
CODE_08EA48:         sms   (0046),r8    ;
CODE_08EA4B:         from r11           ;
CODE_08EA4C:         sub   r8           ;
CODE_08EA4D:         bne CODE_08EA52    ;
CODE_08EA4F:         nop                ;
CODE_08EA50:         stop               ;
CODE_08EA51:         nop                ;

CODE_08EA52:         with r1            ;
CODE_08EA53:         add   #02          ;
CODE_08EA55:         sms   (0050),r1    ;
CODE_08EA58:         from r1            ;
CODE_08EA59:         sub   #08          ;
CODE_08EA5B:         sms   (0052),r0    ;
CODE_08EA5E:         ibt   r14,#0003    ;
CODE_08EA60:         cache              ;
CODE_08EA61:         from r14           ;
CODE_08EA62:         and   #02          ;
CODE_08EA64:         beq CODE_08EACC    ;
CODE_08EA66:         nop                ;
CODE_08EA67:         lms   r5,(0048)    ;
CODE_08EA6A:         lms   r1,(0050)    ;
CODE_08EA6D:         with r1            ;
CODE_08EA6E:         sub   #04          ;
CODE_08EA70:         from r1            ;
CODE_08EA71:         sub   r5           ;
CODE_08EA72:         bcs CODE_08EA78    ;
CODE_08EA74:         nop                ;
CODE_08EA75:         lms   r1,(004A)    ;
CODE_08EA78:         from r1            ;
CODE_08EA79:         to r2              ;
CODE_08EA7A:         sub   #04          ;
CODE_08EA7C:         from r2            ;
CODE_08EA7D:         sub   r5           ;
CODE_08EA7E:         bcs CODE_08EA84    ;
CODE_08EA80:         nop                ;
CODE_08EA81:         lms   r2,(004A)    ;
CODE_08EA84:         sms   (0050),r1    ;
CODE_08EA87:         to r7              ;
CODE_08EA88:         ldw   (r1)         ;
CODE_08EA89:         move  r1,r11       ;
CODE_08EA8B:         to r9              ;
CODE_08EA8C:         ldw   (r2)         ;
CODE_08EA8D:         from r2            ;
CODE_08EA8E:         add   #02          ;
CODE_08EA90:         to r2              ;
CODE_08EA91:         ldw   (r0)         ;
CODE_08EA92:         move  r12,r2       ;
CODE_08EA94:         from r14           ;
CODE_08EA95:         and   #04          ;
CODE_08EA97:         beq CODE_08EAA3    ;
CODE_08EA99:         nop                ;
CODE_08EA9A:         move  r9,r7        ;
CODE_08EA9C:         move  r2,r1        ;
CODE_08EA9E:         ibt   r0,#0000     ;
CODE_08EAA0:         bra CODE_08EAAB    ;

CODE_08EAA2:         nop                ;

CODE_08EAA3:         from r2            ;
CODE_08EAA4:         sub   r1           ;
CODE_08EAA5:         beq CODE_08EA67    ;
CODE_08EAA7:         nop                ;
CODE_08EAA8:         bmi CODE_08EA67    ;
CODE_08EAAA:         nop                ;
CODE_08EAAB:         from r7            ;
CODE_08EAAC:         to r6              ;
CODE_08EAAD:         sub   r9           ;
CODE_08EAAE:         add   r0           ;
CODE_08EAAF:         iwt   r5,#2200     ;
CODE_08EAB2:         add   r5           ;
CODE_08EAB3:         ldw   (r0)         ;
CODE_08EAB4:         lsr                ;
CODE_08EAB5:         move  r5,r4        ;
CODE_08EAB7:         lmult              ;
CODE_08EAB9:         from r4            ;
CODE_08EABA:         to r2              ;
CODE_08EABB:         add   r4           ;
CODE_08EABC:         to r1              ;
CODE_08EABD:         adc   r0           ;
CODE_08EABF:         move  r4,r5        ;
CODE_08EAC1:         lms   r0,(0040)    ;
CODE_08EAC4:         with r7            ;
CODE_08EAC5:         add   r0           ;
CODE_08EAC6:         iwt   r9,#8000     ;
CODE_08EAC9:         with r14           ;
CODE_08EACA:         bic   #02          ;
CODE_08EACC:         from r14           ;
CODE_08EACD:         and   #01          ;
CODE_08EACF:         beq CODE_08EB36    ;
CODE_08EAD1:         nop                ;
CODE_08EAD2:         lms   r0,(004A)    ;
CODE_08EAD5:         inc   r0           ;
CODE_08EAD6:         inc   r0           ;
CODE_08EAD7:         lms   r3,(0052)    ;
CODE_08EADA:         with r3            ;
CODE_08EADB:         add   #04          ;
CODE_08EADD:         from r3            ;
CODE_08EADE:         cmp   r0           ;
CODE_08EAE0:         bcc CODE_08EAE6    ;
CODE_08EAE2:         nop                ;
CODE_08EAE3:         lms   r3,(0048)    ;
CODE_08EAE6:         from r3            ;
CODE_08EAE7:         to r4              ;
CODE_08EAE8:         add   #04          ;
CODE_08EAEA:         from r4            ;
CODE_08EAEB:         cmp   r0           ;
CODE_08EAED:         bcc CODE_08EAF3    ;
CODE_08EAEF:         nop                ;
CODE_08EAF0:         lms   r4,(0048)    ;
CODE_08EAF3:         sms   (0052),r3    ;
CODE_08EAF6:         to r8              ;
CODE_08EAF7:         ldw   (r3)         ;
CODE_08EAF8:         move  r3,r11       ;
CODE_08EAFA:         to r10             ;
CODE_08EAFB:         ldw   (r4)         ;
CODE_08EAFC:         from r4            ;
CODE_08EAFD:         add   #02          ;
CODE_08EAFF:         to r4              ;
CODE_08EB00:         ldw   (r0)         ;
CODE_08EB01:         move  r13,r4       ;
CODE_08EB03:         from r14           ;
CODE_08EB04:         and   #04          ;
CODE_08EB06:         beq CODE_08EB12    ;
CODE_08EB08:         nop                ;
CODE_08EB09:         move  r10,r8       ;
CODE_08EB0B:         move  r4,r3        ;
CODE_08EB0D:         ibt   r0,#0000     ;
CODE_08EB0F:         bra CODE_08EB1A    ;

CODE_08EB11:         nop                ;

CODE_08EB12:         from r4            ;
CODE_08EB13:         sub   r3           ;
CODE_08EB14:         beq CODE_08EAD2    ;
CODE_08EB16:         nop                ;
CODE_08EB17:         bmi CODE_08EAD2    ;
CODE_08EB19:         nop                ;
CODE_08EB1A:         from r10           ;
CODE_08EB1B:         to r6              ;
CODE_08EB1C:         sub   r8           ;
CODE_08EB1D:         add   r0           ;
CODE_08EB1E:         iwt   r5,#2200     ;
CODE_08EB21:         add   r5           ;
CODE_08EB22:         ldw   (r0)         ;
CODE_08EB23:         lsr                ;
CODE_08EB24:         lmult              ;
CODE_08EB26:         with r4            ;
CODE_08EB27:         add   r4           ;
CODE_08EB28:         to r3              ;
CODE_08EB29:         adc   r0           ;
CODE_08EB2B:         lms   r0,(0040)    ;
CODE_08EB2E:         with r8            ;
CODE_08EB2F:         add   r0           ;
CODE_08EB30:         iwt   r10,#8000    ;
CODE_08EB33:         with r14           ;
CODE_08EB34:         bic   #01          ;
CODE_08EB36:         from r8            ;
CODE_08EB37:         to r6              ;
CODE_08EB38:         sub   r7           ;
CODE_08EB39:         bmi CODE_08EB6E    ;
CODE_08EB3B:         nop                ;
CODE_08EB3C:         iwt   r0,#00FF     ;
CODE_08EB3F:         sub   r6           ;
CODE_08EB40:         bcs CODE_08EB45    ;
CODE_08EB42:         inc   r6           ;
CODE_08EB43:         move  r6,r0        ;
CODE_08EB45:         iwt   r5,#00D2     ;
CODE_08EB48:         lms   r0,(0042)    ;
CODE_08EB4B:         add   r11          ;
CODE_08EB4C:         bmi CODE_08EB6E    ;
CODE_08EB4E:         sub   r5           ;
CODE_08EB4F:         bcs CODE_08EB6E    ;
CODE_08EB51:         add   r5           ;
CODE_08EB52:         to r5              ;
CODE_08EB53:         add   r0           ;
CODE_08EB54:         from r6            ;
CODE_08EB55:         sub   r0           ;
CODE_08EB56:         to r6              ;
CODE_08EB57:         sub   #09          ;
CODE_08EB59:         iwt   r0,#3372     ;
CODE_08EB5C:         add   r5           ;
CODE_08EB5D:         from r6            ;
CODE_08EB5E:         stw   (r0)         ;
CODE_08EB5F:         from r8            ;
CODE_08EB60:         add   r7           ;
CODE_08EB61:         div2               ;
CODE_08EB63:         iwt   r6,#0080     ;
CODE_08EB66:         with r6            ;
CODE_08EB67:         sub   r0           ;
CODE_08EB68:         iwt   r0,#3516     ;
CODE_08EB6B:         add   r5           ;
CODE_08EB6C:         from r6            ;
CODE_08EB6D:         stw   (r0)         ;
CODE_08EB6E:         with r9            ;
CODE_08EB6F:         sub   r2           ;
CODE_08EB70:         with r7            ;
CODE_08EB71:         sbc   r1           ;
CODE_08EB73:         with r10           ;
CODE_08EB74:         add   r4           ;
CODE_08EB75:         with r8            ;
CODE_08EB76:         adc   r3           ;
CODE_08EB78:         lms   r0,(0046)    ;
CODE_08EB7B:         sub   r11          ;
CODE_08EB7C:         beq CODE_08EB9B    ;
CODE_08EB7E:         add   r11          ;
CODE_08EB7F:         inc   r11          ;
CODE_08EB80:         sub   r11          ;
CODE_08EB81:         bne CODE_08EB87    ;
CODE_08EB83:         nop                ;
CODE_08EB84:         with r14           ;
CODE_08EB85:         or    #04          ;
CODE_08EB87:         from r12           ;
CODE_08EB88:         sub   r11          ;
CODE_08EB89:         bne CODE_08EB8F    ;
CODE_08EB8B:         nop                ;
CODE_08EB8C:         with r14           ;
CODE_08EB8D:         or    #02          ;
CODE_08EB8F:         from r13           ;
CODE_08EB90:         sub   r11          ;
CODE_08EB91:         bne CODE_08EB97    ;
CODE_08EB93:         nop                ;
CODE_08EB94:         with r14           ;
CODE_08EB95:         or    #01          ;
CODE_08EB97:         iwt   r15,#EA61    ;
CODE_08EB9A:         nop                ;
CODE_08EB9B:         stop               ;
CODE_08EB9C:         nop                ;

CODE_08EB9D:         from r3            ;
CODE_08EB9E:         sub   r1           ;
CODE_08EB9F:         lmult              ;
CODE_08EBA1:         with r4            ;
CODE_08EBA2:         hib                ;
CODE_08EBA3:         lob                ;
CODE_08EBA4:         swap               ;
CODE_08EBA5:         or    r4           ;
CODE_08EBA6:         to r7              ;
CODE_08EBA7:         add   r1           ;
CODE_08EBA8:         from r5            ;
CODE_08EBA9:         sub   r2           ;
CODE_08EBAA:         lmult              ;
CODE_08EBAC:         with r4            ;
CODE_08EBAD:         hib                ;
CODE_08EBAE:         lob                ;
CODE_08EBAF:         swap               ;
CODE_08EBB0:         or    r4           ;
CODE_08EBB1:         to r8              ;
CODE_08EBB2:         add   r2           ;
CODE_08EBB3:         stop               ;
CODE_08EBB4:         nop                ;

CODE_08EBB5:         romb               ;
CODE_08EBB7:         iwt   r10,#59B6    ;
CODE_08EBBA:         iwt   r11,#5800    ;
CODE_08EBBD:         cache              ;
CODE_08EBBE:         move  r14,r9       ;
CODE_08EBC0:         getb               ;
CODE_08EBC1:         inc   r14          ;
CODE_08EBC2:         getbh              ;
CODE_08EBC4:         inc   r14          ;
CODE_08EBC5:         ibt   r1,#FFFF     ;
CODE_08EBC7:         cmp   r1           ;
CODE_08EBC9:         bne CODE_08EBD0    ;
CODE_08EBCB:         nop                ;
CODE_08EBCC:         iwt   r15,#ECED    ;
CODE_08EBCF:         nop                ;
CODE_08EBD0:         ibt   r12,#001F    ;
CODE_08EBD2:         to r1              ;
CODE_08EBD3:         and   r12          ;
CODE_08EBD4:         sms   (0000),r1    ;
CODE_08EBD7:         lsr                ;
CODE_08EBD8:         lsr                ;
CODE_08EBD9:         lsr                ;
CODE_08EBDA:         lsr                ;
CODE_08EBDB:         lsr                ;
CODE_08EBDC:         to r2              ;
CODE_08EBDD:         and   r12          ;
CODE_08EBDE:         sms   (0002),r2    ;
CODE_08EBE1:         lsr                ;
CODE_08EBE2:         lsr                ;
CODE_08EBE3:         lsr                ;
CODE_08EBE4:         lsr                ;
CODE_08EBE5:         lsr                ;
CODE_08EBE6:         to r3              ;
CODE_08EBE7:         and   r12          ;
CODE_08EBE8:         sms   (0004),r3    ;
CODE_08EBEB:         getb               ;
CODE_08EBEC:         inc   r14          ;
CODE_08EBED:         getbh              ;
CODE_08EBEF:         inc   r14          ;
CODE_08EBF0:         to r1              ;
CODE_08EBF1:         and   r12          ;
CODE_08EBF2:         lsr                ;
CODE_08EBF3:         lsr                ;
CODE_08EBF4:         lsr                ;
CODE_08EBF5:         lsr                ;
CODE_08EBF6:         lsr                ;
CODE_08EBF7:         to r2              ;
CODE_08EBF8:         and   r12          ;
CODE_08EBF9:         lsr                ;
CODE_08EBFA:         lsr                ;
CODE_08EBFB:         lsr                ;
CODE_08EBFC:         lsr                ;
CODE_08EBFD:         lsr                ;
CODE_08EBFE:         to r3              ;
CODE_08EBFF:         and   r12          ;
CODE_08EC00:         getb               ;
CODE_08EC01:         inc   r14          ;
CODE_08EC02:         to r12             ;
CODE_08EC03:         getbh              ;
CODE_08EC05:         inc   r14          ;
CODE_08EC06:         move  r9,r14       ;
CODE_08EC08:         iwt   r14,#FFFF    ;
CODE_08EC0B:         lms   r0,(0000)    ;
CODE_08EC0E:         sub   r1           ;
CODE_08EC0F:         to r6              ;
CODE_08EC10:         xor   r14          ;
CODE_08EC12:         inc   r6           ;
CODE_08EC13:         from r12           ;
CODE_08EC14:         lsr                ;
CODE_08EC15:         lmult              ;
CODE_08EC17:         sms   (0008),r4    ;
CODE_08EC1A:         sms   (000A),r0    ;
CODE_08EC1D:         sms   (0014),r4    ;
CODE_08EC20:         sms   (0016),r0    ;
CODE_08EC23:         lob                ;
CODE_08EC24:         swap               ;
CODE_08EC25:         with r4            ;
CODE_08EC26:         hib                ;
CODE_08EC27:         to r1              ;
CODE_08EC28:         or    r4           ;
CODE_08EC29:         lms   r0,(0002)    ;
CODE_08EC2C:         sub   r2           ;
CODE_08EC2D:         to r6              ;
CODE_08EC2E:         xor   r14          ;
CODE_08EC30:         inc   r6           ;
CODE_08EC31:         from r12           ;
CODE_08EC32:         lsr                ;
CODE_08EC33:         lmult              ;
CODE_08EC35:         sms   (000C),r4    ;
CODE_08EC38:         sms   (000E),r0    ;
CODE_08EC3B:         sms   (0018),r4    ;
CODE_08EC3E:         sms   (001A),r0    ;
CODE_08EC41:         lob                ;
CODE_08EC42:         swap               ;
CODE_08EC43:         with r4            ;
CODE_08EC44:         hib                ;
CODE_08EC45:         to r2              ;
CODE_08EC46:         or    r4           ;
CODE_08EC47:         lms   r0,(0004)    ;
CODE_08EC4A:         sub   r3           ;
CODE_08EC4B:         to r6              ;
CODE_08EC4C:         xor   r14          ;
CODE_08EC4E:         inc   r6           ;
CODE_08EC4F:         from r12           ;
CODE_08EC50:         lsr                ;
CODE_08EC51:         lmult              ;
CODE_08EC53:         sms   (0010),r4    ;
CODE_08EC56:         sms   (0012),r0    ;
CODE_08EC59:         sms   (001C),r4    ;
CODE_08EC5C:         sms   (001E),r0    ;
CODE_08EC5F:         lob                ;
CODE_08EC60:         swap               ;
CODE_08EC61:         with r4            ;
CODE_08EC62:         hib                ;
CODE_08EC63:         to r3              ;
CODE_08EC64:         or    r4           ;
CODE_08EC65:         ibt   r5,#0008     ;
CODE_08EC67:         dec   r12          ;
CODE_08EC68:         bne CODE_08EC6F    ;
CODE_08EC6A:         nop                ;
CODE_08EC6B:         iwt   r15,#EBBE    ;
CODE_08EC6E:         nop                ;
CODE_08EC6F:         ibt   r4,#0020     ;
CODE_08EC71:         ibt   r6,#001F     ;
CODE_08EC73:         lms   r0,(0000)    ;
CODE_08EC76:         add   r1           ;
CODE_08EC77:         and   r6           ;
CODE_08EC78:         or    r4           ;
CODE_08EC79:         stb   (r10)        ;
CODE_08EC7B:         inc   r10          ;
CODE_08EC7C:         with r4            ;
CODE_08EC7D:         add   r4           ;
CODE_08EC7E:         lms   r0,(0002)    ;
CODE_08EC81:         add   r2           ;
CODE_08EC82:         and   r6           ;
CODE_08EC83:         or    r4           ;
CODE_08EC84:         stb   (r10)        ;
CODE_08EC86:         inc   r10          ;
CODE_08EC87:         with r4            ;
CODE_08EC88:         add   r4           ;
CODE_08EC89:         lms   r0,(0004)    ;
CODE_08EC8C:         add   r3           ;
CODE_08EC8D:         and   r6           ;
CODE_08EC8E:         or    r4           ;
CODE_08EC8F:         stb   (r11)        ;
CODE_08EC91:         dec   r5           ;
CODE_08EC92:         bne CODE_08EC67    ;
CODE_08EC94:         inc   r11          ;
CODE_08EC95:         lms   r4,(0008)    ;
CODE_08EC98:         lms   r0,(0014)    ;
CODE_08EC9B:         to r4              ;
CODE_08EC9C:         add   r4           ;
CODE_08EC9D:         sms   (0014),r4    ;
CODE_08ECA0:         lms   r1,(000A)    ;
CODE_08ECA3:         lms   r0,(0016)    ;
CODE_08ECA6:         adc   r1           ;
CODE_08ECA8:         sms   (0016),r0    ;
CODE_08ECAB:         lob                ;
CODE_08ECAC:         swap               ;
CODE_08ECAD:         with r4            ;
CODE_08ECAE:         hib                ;
CODE_08ECAF:         to r1              ;
CODE_08ECB0:         or    r4           ;
CODE_08ECB1:         lms   r4,(000C)    ;
CODE_08ECB4:         lms   r0,(0018)    ;
CODE_08ECB7:         to r4              ;
CODE_08ECB8:         add   r4           ;
CODE_08ECB9:         sms   (0018),r4    ;
CODE_08ECBC:         lms   r2,(000E)    ;
CODE_08ECBF:         lms   r0,(001A)    ;
CODE_08ECC2:         adc   r2           ;
CODE_08ECC4:         sms   (001A),r0    ;
CODE_08ECC7:         lob                ;
CODE_08ECC8:         swap               ;
CODE_08ECC9:         with r4            ;
CODE_08ECCA:         hib                ;
CODE_08ECCB:         to r2              ;
CODE_08ECCC:         or    r4           ;
CODE_08ECCD:         lms   r4,(0010)    ;
CODE_08ECD0:         lms   r0,(001C)    ;
CODE_08ECD3:         to r4              ;
CODE_08ECD4:         add   r4           ;
CODE_08ECD5:         sms   (001C),r4    ;
CODE_08ECD8:         lms   r3,(0012)    ;
CODE_08ECDB:         lms   r0,(001E)    ;
CODE_08ECDE:         adc   r3           ;
CODE_08ECE0:         sms   (001E),r0    ;
CODE_08ECE3:         lob                ;
CODE_08ECE4:         swap               ;
CODE_08ECE5:         with r4            ;
CODE_08ECE6:         hib                ;
CODE_08ECE7:         to r3              ;
CODE_08ECE8:         or    r4           ;
CODE_08ECE9:         iwt   r15,#EC65    ;
CODE_08ECEC:         nop                ;
CODE_08ECED:         stop               ;
CODE_08ECEE:         nop                ;
CODE_08ECEF:         ibt   r4,#0000     ;
CODE_08ECF1:         iwt   r3,#0100     ;
CODE_08ECF4:         moves r1,r1        ;
CODE_08ECF6:         bmi CODE_08ED04    ;
CODE_08ECF8:         nop                ;
CODE_08ECF9:         from r1            ;
CODE_08ECFA:         sub   r3           ;
CODE_08ECFB:         bmi CODE_08ED06    ;
CODE_08ECFD:         nop                ;
CODE_08ECFE:         iwt   r1,#00FF     ;
CODE_08ED01:         bra CODE_08ED06    ;

CODE_08ED03:         nop                ;

CODE_08ED04:         ibt   r1,#0000     ;
CODE_08ED06:         moves r7,r7        ;
CODE_08ED08:         bmi CODE_08ED18    ;
CODE_08ED0A:         nop                ;
CODE_08ED0B:         from r7            ;
CODE_08ED0C:         sub   r3           ;
CODE_08ED0D:         bmi CODE_08ED1A    ;
CODE_08ED0F:         nop                ;
CODE_08ED10:         iwt   r7,#00FF     ;
CODE_08ED13:         ibt   r4,#0001     ;
CODE_08ED15:         bra CODE_08ED1A    ;

CODE_08ED17:         nop                ;

CODE_08ED18:         ibt   r7,#0000     ;
CODE_08ED1A:         iwt   r3,#00D2     ;
CODE_08ED1D:         moves r2,r2        ;
CODE_08ED1F:         bmi CODE_08ED2D    ;
CODE_08ED21:         nop                ;
CODE_08ED22:         from r2            ;
CODE_08ED23:         sub   r3           ;
CODE_08ED24:         bmi CODE_08ED2F    ;
CODE_08ED26:         nop                ;
CODE_08ED27:         iwt   r2,#00D1     ;
CODE_08ED2A:         bra CODE_08ED2F    ;

CODE_08ED2C:         nop                ;

CODE_08ED2D:         ibt   r1,#0000     ;
CODE_08ED2F:         moves r8,r8        ;
CODE_08ED31:         bmi CODE_08ED3F    ;
CODE_08ED33:         nop                ;
CODE_08ED34:         from r8            ;
CODE_08ED35:         sub   r3           ;
CODE_08ED36:         bmi CODE_08ED41    ;
CODE_08ED38:         nop                ;
CODE_08ED39:         iwt   r8,#00D1     ;
CODE_08ED3C:         bra CODE_08ED41    ;

CODE_08ED3E:         nop                ;

CODE_08ED3F:         ibt   r7,#0000     ;
CODE_08ED41:         moves r4,r4        ;
CODE_08ED43:         beq CODE_08ED68    ;
CODE_08ED45:         nop                ;
CODE_08ED46:         from r2            ;
CODE_08ED47:         to r3              ;
CODE_08ED48:         sub   #08          ;
CODE_08ED4A:         iwt   r9,#00FF     ;
CODE_08ED4D:         iwt   r4,#3D46     ;
CODE_08ED50:         ibt   r5,#0004     ;
CODE_08ED52:         iwt   r6,#FF00     ;
CODE_08ED55:         cache              ;
CODE_08ED56:         iwt   r12,#00D2    ;
CODE_08ED59:         move  r13,r15      ;
CODE_08ED5B:         from r12           ;
CODE_08ED5C:         sub   r3           ;
CODE_08ED5D:         bne CODE_08ED63    ;
CODE_08ED5F:         move  r9,r6        ;
CODE_08ED62:         from r9            ;
CODE_08ED63:         stw   (r4)         ;
CODE_08ED64:         with r4            ;
CODE_08ED65:         sub   r5           ;
CODE_08ED66:         loop               ;
CODE_08ED67:         nop                ;
CODE_08ED68:         from r7            ;
CODE_08ED69:         to r9              ;
CODE_08ED6A:         sub   r1           ;
CODE_08ED6B:         nop                ;
CODE_08ED6C:         from r8            ;
CODE_08ED6D:         to r10             ;
CODE_08ED6E:         sub   r2           ;
CODE_08ED6F:         inc   r10          ;
CODE_08ED70:         iwt   r0,#2200     ;
CODE_08ED73:         add   r10          ;
CODE_08ED74:         add   r10          ;
CODE_08ED75:         ldw   (r0)         ;
CODE_08ED76:         to r6              ;
CODE_08ED77:         lsr                ;
CODE_08ED78:         from r9            ;
CODE_08ED79:         sub   #00          ;
CODE_08ED7B:         swap               ;
CODE_08ED7C:         fmult              ;
CODE_08ED7D:         to r11             ;
CODE_08ED7E:         rol                ;
CODE_08ED7F:         with r1            ;
CODE_08ED80:         swap               ;
CODE_08ED81:         from r2            ;
CODE_08ED82:         sub   #09          ;
CODE_08ED84:         add   r0           ;
CODE_08ED85:         add   r0           ;
CODE_08ED86:         iwt   r5,#3A02     ;
CODE_08ED89:         to r5              ;
CODE_08ED8A:         add   r5           ;
CODE_08ED8B:         iwt   r4,#FF00     ;
CODE_08ED8E:         ibt   r6,#0004     ;
CODE_08ED90:         cache              ;
CODE_08ED91:         iwt   r9,#0080     ;
CODE_08ED94:         move  r12,r10      ;
CODE_08ED96:         move  r13,r15      ;
CODE_08ED98:         from r1            ;
CODE_08ED99:         add   r9           ;
CODE_08ED9A:         swap               ;
CODE_08ED9B:         or    r4           ;
CODE_08ED9C:         stw   (r5)         ;
CODE_08ED9D:         with r5            ;
CODE_08ED9E:         add   r6           ;
CODE_08ED9F:         with r1            ;
CODE_08EDA0:         add   r11          ;
CODE_08EDA1:         bcc CODE_08EDA8    ;
CODE_08EDA3:         nop                ;
CODE_08EDA4:         iwt   r0,#00FF     ;
CODE_08EDA7:         stw   (r5)         ;
CODE_08EDA8:         loop               ;
CODE_08EDA9:         nop                ;
CODE_08EDAA:         stop               ;
CODE_08EDAB:         nop                ;

CODE_08EDAC:         iwt   r0,#2200     ;
CODE_08EDAF:         add   r5           ;
CODE_08EDB0:         add   r5           ;
CODE_08EDB1:         ldw   (r0)         ;
CODE_08EDB2:         to r6              ;
CODE_08EDB3:         lsr                ;
CODE_08EDB4:         from r1            ;
CODE_08EDB5:         hib                ;
CODE_08EDB6:         lsr                ;
CODE_08EDB7:         to r7              ;
CODE_08EDB8:         lsr                ;
CODE_08EDB9:         from r2            ;
CODE_08EDBA:         hib                ;
CODE_08EDBB:         lsr                ;
CODE_08EDBC:         lsr                ;
CODE_08EDBD:         sub   r7           ;
CODE_08EDBE:         inc   r0           ;
CODE_08EDBF:         lmult              ;
CODE_08EDC1:         from r4            ;
CODE_08EDC2:         to r12             ;
CODE_08EDC3:         add   r4           ;
CODE_08EDC4:         to r13             ;
CODE_08EDC5:         adc   r0           ;
CODE_08EDC7:         sms   (0040),r12   ;
CODE_08EDCA:         sms   (0042),r13   ;
CODE_08EDCD:         ibt   r14,#001F    ;
CODE_08EDCF:         from r1            ;
CODE_08EDD0:         lsr                ;
CODE_08EDD1:         lsr                ;
CODE_08EDD2:         lsr                ;
CODE_08EDD3:         lsr                ;
CODE_08EDD4:         lsr                ;
CODE_08EDD5:         to r9              ;
CODE_08EDD6:         and   r14          ;
CODE_08EDD7:         from r2            ;
CODE_08EDD8:         lsr                ;
CODE_08EDD9:         lsr                ;
CODE_08EDDA:         lsr                ;
CODE_08EDDB:         lsr                ;
CODE_08EDDC:         lsr                ;
CODE_08EDDD:         and   r14          ;
CODE_08EDDE:         sub   r9           ;
CODE_08EDDF:         inc   r0           ;
CODE_08EDE0:         lmult              ;
CODE_08EDE2:         from r4            ;
CODE_08EDE3:         to r12             ;
CODE_08EDE4:         add   r4           ;
CODE_08EDE5:         to r13             ;
CODE_08EDE6:         adc   r0           ;
CODE_08EDE8:         sms   (0044),r12   ;
CODE_08EDEB:         sms   (0046),r13   ;
CODE_08EDEE:         from r1            ;
CODE_08EDEF:         to r11             ;
CODE_08EDF0:         and   r14          ;
CODE_08EDF1:         from r2            ;
CODE_08EDF2:         and   r14          ;
CODE_08EDF3:         sub   r11          ;
CODE_08EDF4:         inc   r0           ;
CODE_08EDF5:         lmult              ;
CODE_08EDF7:         from r4            ;
CODE_08EDF8:         to r12             ;
CODE_08EDF9:         add   r4           ;
CODE_08EDFA:         to r13             ;
CODE_08EDFB:         adc   r0           ;
CODE_08EDFD:         sms   (0048),r12   ;
CODE_08EE00:         sms   (004A),r13   ;
CODE_08EE03:         ibt   r6,#0000     ;
CODE_08EE05:         ibt   r8,#0000     ;
CODE_08EE07:         ibt   r10,#0000    ;
CODE_08EE09:         ibt   r4,#001F     ;
CODE_08EE0B:         cache              ;
CODE_08EE0C:         move  r12,r5       ;
CODE_08EE0E:         move  r13,r15      ;
CODE_08EE10:         from r7            ;
CODE_08EE11:         and   r4           ;
CODE_08EE12:         swap               ;
CODE_08EE13:         rol                ;
CODE_08EE14:         to r5              ;
CODE_08EE15:         rol                ;
CODE_08EE16:         from r9            ;
CODE_08EE17:         and   r4           ;
CODE_08EE18:         rol                ;
CODE_08EE19:         rol                ;
CODE_08EE1A:         rol                ;
CODE_08EE1B:         rol                ;
CODE_08EE1C:         rol                ;
CODE_08EE1D:         or    r5           ;
CODE_08EE1E:         with r11           ;
CODE_08EE1F:         and   r4           ;
CODE_08EE20:         or    r11          ;
CODE_08EE21:         stw   (r3)         ;
CODE_08EE22:         inc   r3           ;
CODE_08EE23:         inc   r3           ;
CODE_08EE24:         lms   r1,(0040)    ;
CODE_08EE27:         lms   r2,(0042)    ;
CODE_08EE2A:         with r6            ;
CODE_08EE2B:         add   r1           ;
CODE_08EE2C:         with r7            ;
CODE_08EE2D:         adc   r2           ;
CODE_08EE2F:         lms   r1,(0044)    ;
CODE_08EE32:         lms   r2,(0046)    ;
CODE_08EE35:         with r8            ;
CODE_08EE36:         add   r1           ;
CODE_08EE37:         with r9            ;
CODE_08EE38:         adc   r2           ;
CODE_08EE3A:         lms   r1,(0048)    ;
CODE_08EE3D:         lms   r2,(004A)    ;
CODE_08EE40:         with r10           ;
CODE_08EE41:         add   r1           ;
CODE_08EE42:         with r11           ;
CODE_08EE43:         adc   r2           ;
CODE_08EE45:         loop               ;
CODE_08EE46:         nop                ;
CODE_08EE47:         stop               ;
CODE_08EE48:         nop                ;

CODE_08EE49:         ibt   r4,#0000     ;
CODE_08EE4B:         iwt   r3,#0100     ;
CODE_08EE4E:         moves r1,r1        ;
CODE_08EE50:         bmi CODE_08EE5E    ;
CODE_08EE52:         nop                ;
CODE_08EE53:         from r1            ;
CODE_08EE54:         sub   r3           ;
CODE_08EE55:         bmi CODE_08EE60    ;
CODE_08EE57:         nop                ;
CODE_08EE58:         iwt   r1,#00FF     ;
CODE_08EE5B:         bra CODE_08EE60    ;

CODE_08EE5D:         nop                ;

CODE_08EE5E:         ibt   r1,#0000     ;
CODE_08EE60:         moves r7,r7        ;
CODE_08EE62:         bmi CODE_08EE70    ;
CODE_08EE64:         nop                ;
CODE_08EE65:         from r7            ;
CODE_08EE66:         sub   r3           ;
CODE_08EE67:         bmi CODE_08EE74    ;
CODE_08EE69:         nop                ;
CODE_08EE6A:         iwt   r7,#00FF     ;
CODE_08EE6D:         bra CODE_08EE74    ;

CODE_08EE6F:         nop                ;

CODE_08EE70:         ibt   r4,#0001     ;
CODE_08EE72:         ibt   r7,#0000     ;
CODE_08EE74:         iwt   r3,#00D2     ;
CODE_08EE77:         moves r2,r2        ;
CODE_08EE79:         bmi CODE_08EE87    ;
CODE_08EE7B:         nop                ;
CODE_08EE7C:         from r2            ;
CODE_08EE7D:         sub   r3           ;
CODE_08EE7E:         bmi CODE_08EE89    ;
CODE_08EE80:         nop                ;
CODE_08EE81:         iwt   r2,#00D1     ;
CODE_08EE84:         bra CODE_08EE89    ;

CODE_08EE86:         nop                ;

CODE_08EE87:         ibt   r1,#0000     ;
CODE_08EE89:         moves r8,r8        ;
CODE_08EE8B:         bmi CODE_08EE99    ;
CODE_08EE8D:         nop                ;
CODE_08EE8E:         from r8            ;
CODE_08EE8F:         sub   r3           ;
CODE_08EE90:         bmi CODE_08EE9B    ;
CODE_08EE92:         nop                ;
CODE_08EE93:         iwt   r8,#00D1     ;
CODE_08EE96:         bra CODE_08EE9B    ;

CODE_08EE98:         nop                ;

CODE_08EE99:         ibt   r7,#0000     ;
CODE_08EE9B:         moves r4,r4        ;
CODE_08EE9D:         beq CODE_08EEC2    ;
CODE_08EE9F:         nop                ;
CODE_08EEA0:         from r2            ;
CODE_08EEA1:         to r3              ;
CODE_08EEA2:         sub   #08          ;
CODE_08EEA4:         iwt   r9,#00FF     ;
CODE_08EEA7:         iwt   r4,#3D46     ;
CODE_08EEAA:         ibt   r5,#0004     ;
CODE_08EEAC:         iwt   r6,#FF00     ;
CODE_08EEAF:         cache              ;
CODE_08EEB0:         iwt   r12,#00D2    ;
CODE_08EEB3:         move  r13,r15      ;
CODE_08EEB5:         from r12           ;
CODE_08EEB6:         sub   r3           ;
CODE_08EEB7:         bne CODE_08EEBD    ;
CODE_08EEB9:         move  r9,r6        ;
CODE_08EEBC:         from r9            ;
CODE_08EEBD:         stw   (r4)         ;
CODE_08EEBE:         with r4            ;
CODE_08EEBF:         sub   r5           ;
CODE_08EEC0:         loop               ;
CODE_08EEC1:         nop                ;
CODE_08EEC2:         from r1            ;
CODE_08EEC3:         to r9              ;
CODE_08EEC4:         sub   r7           ;
CODE_08EEC5:         nop                ;
CODE_08EEC6:         from r8            ;
CODE_08EEC7:         to r10             ;
CODE_08EEC8:         sub   r2           ;
CODE_08EEC9:         inc   r10          ;
CODE_08EECA:         iwt   r0,#2200     ;
CODE_08EECD:         add   r10          ;
CODE_08EECE:         add   r10          ;
CODE_08EECF:         ldw   (r0)         ;
CODE_08EED0:         to r6              ;
CODE_08EED1:         lsr                ;
CODE_08EED2:         from r9            ;
CODE_08EED3:         sub   #00          ;
CODE_08EED5:         swap               ;
CODE_08EED6:         fmult              ;
CODE_08EED7:         to r11             ;
CODE_08EED8:         rol                ;
CODE_08EED9:         with r1            ;
CODE_08EEDA:         swap               ;
CODE_08EEDB:         from r2            ;
CODE_08EEDC:         sub   #09          ;
CODE_08EEDE:         add   r0           ;
CODE_08EEDF:         add   r0           ;
CODE_08EEE0:         iwt   r5,#3A02     ;
CODE_08EEE3:         to r5              ;
CODE_08EEE4:         add   r5           ;
CODE_08EEE5:         iwt   r4,#FF00     ;
CODE_08EEE8:         ibt   r6,#0004     ;
CODE_08EEEA:         cache              ;
CODE_08EEEB:         iwt   r9,#0080     ;
CODE_08EEEE:         move  r12,r10      ;
CODE_08EEF0:         move  r13,r15      ;
CODE_08EEF2:         from r1            ;
CODE_08EEF3:         add   r9           ;
CODE_08EEF4:         bcc CODE_08EEFA    ;
CODE_08EEF6:         nop                ;
CODE_08EEF7:         iwt   r0,#FF00     ;
CODE_08EEFA:         and   r4           ;
CODE_08EEFB:         stw   (r5)         ;
CODE_08EEFC:         with r5            ;
CODE_08EEFD:         add   r6           ;
CODE_08EEFE:         with r1            ;
CODE_08EEFF:         sub   r11          ;
CODE_08EF00:         bcs CODE_08EF07    ;
CODE_08EF02:         nop                ;
CODE_08EF03:         iwt   r0,#00FF     ;
CODE_08EF06:         stw   (r5)         ;
CODE_08EF07:         loop               ;
CODE_08EF08:         nop                ;
CODE_08EF09:         stop               ;
CODE_08EF0A:         nop                ;

CODE_08EF0B:         iwt   r10,#44A0    ;
CODE_08EF0E:         to r1              ;
CODE_08EF0F:         ldw   (r10)        ;
CODE_08EF10:         iwt   r0,#44A2     ;
CODE_08EF13:         to r11             ;
CODE_08EF14:         ldw   (r0)         ;
CODE_08EF15:         iwt   r0,#449E     ;
CODE_08EF18:         ldw   (r0)         ;
CODE_08EF19:         sub   #09          ;
CODE_08EF1B:         move  r8,r0        ;
CODE_08EF1D:         add   r0           ;
CODE_08EF1E:         iwt   r2,#3372     ;
CODE_08EF21:         to r2              ;
CODE_08EF22:         add   r2           ;
CODE_08EF23:         iwt   r5,#0100     ;
CODE_08EF26:         iwt   r9,#44A8     ;
CODE_08EF29:         to r3              ;
CODE_08EF2A:         ldw   (r9)         ;
CODE_08EF2B:         from r3            ;
CODE_08EF2C:         sub   r5           ;
CODE_08EF2D:         bmi CODE_08EF32    ;
CODE_08EF2F:         nop                ;
CODE_08EF30:         move  r3,r5        ;
CODE_08EF32:         iwt   r0,#44AA     ;
CODE_08EF35:         to r5              ;
CODE_08EF36:         ldw   (r0)         ;
CODE_08EF37:         iwt   r0,#44AC     ;
CODE_08EF3A:         to r6              ;
CODE_08EF3B:         ldw   (r0)         ;
CODE_08EF3C:         iwt   r0,#00D2     ;
CODE_08EF3F:         to r12             ;
CODE_08EF40:         sub   r8           ;
CODE_08EF41:         iwt   r8,#0100     ;
CODE_08EF44:         cache              ;
CODE_08EF45:         move  r13,r15      ;
CODE_08EF47:         from r1            ;
CODE_08EF48:         stw   (r2)         ;
CODE_08EF49:         inc   r2           ;
CODE_08EF4A:         inc   r2           ;
CODE_08EF4B:         from r3            ;
CODE_08EF4C:         lob                ;
CODE_08EF4D:         swap               ;
CODE_08EF4E:         with r11           ;
CODE_08EF4F:         sub   r0           ;
CODE_08EF50:         from r3            ;
CODE_08EF51:         hib                ;
CODE_08EF52:         sex                ;
CODE_08EF53:         with r1            ;
CODE_08EF54:         sbc   r0           ;
CODE_08EF56:         iwt   r4,#00E0     ;
CODE_08EF59:         with r3            ;
CODE_08EF5A:         add   r5           ;
CODE_08EF5B:         from r3            ;
CODE_08EF5C:         sub   r4           ;
CODE_08EF5D:         bcc CODE_08EF62    ;
CODE_08EF5F:         add   r4           ;
CODE_08EF60:         move  r3,r4        ;
CODE_08EF62:         from r3            ;
CODE_08EF63:         sub   r8           ;
CODE_08EF64:         bmi CODE_08EF69    ;
CODE_08EF66:         add   r8           ;
CODE_08EF67:         move  r3,r8        ;
CODE_08EF69:         with r5            ;
CODE_08EF6A:         add   r6           ;
CODE_08EF6B:         loop               ;
CODE_08EF6C:         nop                ;
CODE_08EF6D:         iwt   r8,#44A2     ;
CODE_08EF70:         to r6              ;
CODE_08EF71:         ldw   (r8)         ;
CODE_08EF72:         iwt   r7,#44A4     ;
CODE_08EF75:         to r1              ;
CODE_08EF76:         ldw   (r7)         ;
CODE_08EF77:         from r1            ;
CODE_08EF78:         lob                ;
CODE_08EF79:         to r2              ;
CODE_08EF7A:         swap               ;
CODE_08EF7B:         from r1            ;
CODE_08EF7C:         hib                ;
CODE_08EF7D:         to r3              ;
CODE_08EF7E:         sex                ;
CODE_08EF7F:         from r6            ;
CODE_08EF80:         add   r2           ;
CODE_08EF81:         stw   (r8)         ;
CODE_08EF82:         ldw   (r10)        ;
CODE_08EF83:         adc   r3           ;
CODE_08EF85:         stw   (r10)        ;
CODE_08EF86:         iwt   r0,#44A6     ;
CODE_08EF89:         ldw   (r0)         ;
CODE_08EF8A:         add   r1           ;
CODE_08EF8B:         stw   (r7)         ;
CODE_08EF8C:         iwt   r2,#44AE     ;
CODE_08EF8F:         to r1              ;
CODE_08EF90:         ldw   (r2)         ;
CODE_08EF91:         from r1            ;
CODE_08EF92:         to r3              ;
CODE_08EF93:         hib                ;
CODE_08EF94:         with r3            ;
CODE_08EF95:         lsr                ;
CODE_08EF96:         with r3            ;
CODE_08EF97:         lsr                ;
CODE_08EF98:         with r3            ;
CODE_08EF99:         lsr                ;
CODE_08EF9A:         with r3            ;
CODE_08EF9B:         lsr                ;
CODE_08EF9C:         ldw   (r9)         ;
CODE_08EF9D:         add   r3           ;
CODE_08EF9E:         stw   (r9)         ;
CODE_08EF9F:         iwt   r0,#44B0     ;
CODE_08EFA2:         ldw   (r0)         ;
CODE_08EFA3:         from r1            ;
CODE_08EFA4:         add   r0           ;
CODE_08EFA5:         stw   (r2)         ;
CODE_08EFA6:         iwt   r1,#36BA     ;
CODE_08EFA9:         ibt   r0,#0000     ;
CODE_08EFAB:         cache              ;
CODE_08EFAC:         iwt   r12,#00D2    ;
CODE_08EFAF:         move  r13,r15      ;
CODE_08EFB1:         stw   (r1)         ;
CODE_08EFB2:         inc   r1           ;
CODE_08EFB3:         inc   r1           ;
CODE_08EFB4:         loop               ;
CODE_08EFB5:         nop                ;
CODE_08EFB6:         iwt   r0,#00D2     ;
CODE_08EFB9:         iwt   r2,#44F2     ;
CODE_08EFBC:         to r2              ;
CODE_08EFBD:         ldw   (r2)         ;
CODE_08EFBE:         with r2            ;
CODE_08EFBF:         hib                ;
CODE_08EFC0:         to r12             ;
CODE_08EFC1:         sub   r2           ;
CODE_08EFC2:         iwt   r0,#36BA     ;
CODE_08EFC5:         add   r2           ;
CODE_08EFC6:         to r1              ;
CODE_08EFC7:         add   r2           ;
CODE_08EFC8:         iwt   r0,#44F8     ;
CODE_08EFCB:         to r3              ;
CODE_08EFCC:         ldw   (r0)         ;
CODE_08EFCD:         move  r10,r3       ;
CODE_08EFCF:         iwt   r0,#44FE     ;
CODE_08EFD2:         to r4              ;
CODE_08EFD3:         ldw   (r0)         ;
CODE_08EFD4:         iwt   r0,#4500     ;
CODE_08EFD7:         to r5              ;
CODE_08EFD8:         ldw   (r0)         ;
CODE_08EFD9:         iwt   r0,#4502     ;
CODE_08EFDC:         ldw   (r0)         ;
CODE_08EFDD:         moves r0,r0        ;
CODE_08EFDF:         bpl CODE_08EFE4    ;
CODE_08EFE1:         nop                ;
CODE_08EFE2:         ibt   r0,#0000     ;
CODE_08EFE4:         hib                ;
CODE_08EFE5:         add   r0           ;
CODE_08EFE6:         iwt   r14,#44B2    ;
CODE_08EFE9:         to r11             ;
CODE_08EFEA:         add   r14          ;
CODE_08EFEB:         iwt   r6,#44F0     ;
CODE_08EFEE:         iwt   r7,#0000     ;
CODE_08EFF1:         to r9              ;
CODE_08EFF2:         ldw   (r11)        ;
CODE_08EFF3:         cache              ;
CODE_08EFF4:         move  r13,r15      ;
CODE_08EFF6:         from r9            ;
CODE_08EFF7:         stw   (r1)         ;
CODE_08EFF8:         inc   r1           ;
CODE_08EFF9:         inc   r1           ;
CODE_08EFFA:         with r7            ;
CODE_08EFFB:         add   r3           ;
CODE_08EFFC:         bcc CODE_08F010    ;
CODE_08EFFE:         nop                ;
CODE_08EFFF:         inc   r11          ;
CODE_08F000:         inc   r11          ;
CODE_08F001:         from r11           ;
CODE_08F002:         sub   r6           ;
CODE_08F003:         bcc CODE_08F008    ;
CODE_08F005:         add   r6           ;
CODE_08F006:         move  r11,r6       ;
CODE_08F008:         to r9              ;
CODE_08F009:         ldw   (r11)        ;
CODE_08F00A:         with r10           ;
CODE_08F00B:         add   r4           ;
CODE_08F00C:         move  r3,r10       ;
CODE_08F00E:         with r4            ;
CODE_08F00F:         add   r5           ;
CODE_08F010:         loop               ;
CODE_08F011:         nop                ;
CODE_08F012:         iwt   r2,#44FA     ;
CODE_08F015:         to r3              ;
CODE_08F016:         ldw   (r2)         ;
CODE_08F017:         iwt   r1,#44F8     ;
CODE_08F01A:         ldw   (r1)         ;
CODE_08F01B:         sub   r3           ;
CODE_08F01C:         bcc CODE_08F028    ;
CODE_08F01E:         nop                ;
CODE_08F01F:         stw   (r1)         ;
CODE_08F020:         iwt   r0,#44FC     ;
CODE_08F023:         to r4              ;
CODE_08F024:         ldw   (r0)         ;
CODE_08F025:         from r3            ;
CODE_08F026:         add   r4           ;
CODE_08F027:         stw   (r2)         ;
CODE_08F028:         iwt   r4,#0000     ;
CODE_08F02B:         iwt   r2,#4504     ;
CODE_08F02E:         to r3              ;
CODE_08F02F:         ldw   (r2)         ;
CODE_08F030:         iwt   r1,#4502     ;
CODE_08F033:         ldw   (r1)         ;
CODE_08F034:         sub   r3           ;
CODE_08F035:         bcs CODE_08F03A    ;
CODE_08F037:         nop                ;
CODE_08F038:         move  r0,r4        ;
CODE_08F03A:         stw   (r1)         ;
CODE_08F03B:         iwt   r0,#4506     ;
CODE_08F03E:         to r4              ;
CODE_08F03F:         ldw   (r0)         ;
CODE_08F040:         from r3            ;
CODE_08F041:         add   r4           ;
CODE_08F042:         stw   (r2)         ;
CODE_08F043:         iwt   r4,#D100     ;
CODE_08F046:         iwt   r1,#44F4     ;
CODE_08F049:         to r2              ;
CODE_08F04A:         ldw   (r1)         ;
CODE_08F04B:         iwt   r5,#44F2     ;
CODE_08F04E:         ldw   (r5)         ;
CODE_08F04F:         add   r2           ;
CODE_08F050:         sub   r4           ;
CODE_08F051:         bcs CODE_08F055    ;
CODE_08F053:         add   r4           ;
CODE_08F054:         stw   (r5)         ;
CODE_08F055:         iwt   r0,#44F6     ;
CODE_08F058:         to r2              ;
CODE_08F059:         ldw   (r0)         ;
CODE_08F05A:         ldw   (r1)         ;
CODE_08F05B:         add   r2           ;
CODE_08F05C:         stw   (r1)         ;
CODE_08F05D:         stop               ;
CODE_08F05E:         nop                ;

CODE_08F05F:         romb               ;
CODE_08F061:         move  r14,r14      ;
CODE_08F063:         iwt   r9,#00FF     ;
CODE_08F066:         iwt   r10,#FF00    ;
CODE_08F069:         iwt   r0,#2200     ;
CODE_08F06C:         add   r6           ;
CODE_08F06D:         add   r6           ;
CODE_08F06E:         to r11             ;
CODE_08F06F:         ldw   (r0)         ;
CODE_08F070:         from r7            ;
CODE_08F071:         lob                ;
CODE_08F072:         swap               ;
CODE_08F073:         fmult              ;
CODE_08F074:         not                ;
CODE_08F075:         inc   r0           ;
CODE_08F076:         add   r1           ;
CODE_08F077:         sms   (0000),r0    ;
CODE_08F07A:         bpl CODE_08F084    ;
CODE_08F07C:         nop                ;
CODE_08F07D:         move  r3,r9        ;
CODE_08F07F:         move  r4,r10       ;
CODE_08F081:         bra CODE_08F096    ;

CODE_08F083:         nop                ;

CODE_08F084:         iwt   r5,#0100     ;
CODE_08F087:         sub   r5           ;
CODE_08F088:         bcc CODE_08F092    ;
CODE_08F08A:         add   r5           ;
CODE_08F08B:         move  r3,r10       ;
CODE_08F08D:         move  r4,r9        ;
CODE_08F08F:         bra CODE_08F096    ;

CODE_08F091:         nop                ;
CODE_08F092:         to r3              ;
CODE_08F093:         swap               ;
CODE_08F094:         to r4              ;
CODE_08F095:         or    r10          ;
CODE_08F096:         iwt   r5,#3A02     ;
CODE_08F099:         iwt   r12,#00D2    ;
CODE_08F09C:         cache              ;
CODE_08F09D:         move  r13,r15      ;
CODE_08F09F:         from r3            ;
CODE_08F0A0:         stw   (r5)         ;
CODE_08F0A1:         inc   r5           ;
CODE_08F0A2:         inc   r5           ;
CODE_08F0A3:         from r4            ;
CODE_08F0A4:         stw   (r5)         ;
CODE_08F0A5:         inc   r5           ;
CODE_08F0A6:         loop               ;
CODE_08F0A7:         inc   r5           ;
CODE_08F0A8:         from r8            ;
CODE_08F0A9:         lmult              ;
CODE_08F0AB:         with r4            ;
CODE_08F0AC:         hib                ;
CODE_08F0AD:         lob                ;
CODE_08F0AE:         swap               ;
CODE_08F0AF:         or    r4           ;
CODE_08F0B0:         not                ;
CODE_08F0B1:         inc   r0           ;
CODE_08F0B2:         add   r2           ;
CODE_08F0B3:         add   r0           ;
CODE_08F0B4:         add   r0           ;
CODE_08F0B5:         iwt   r4,#3A02     ;
CODE_08F0B8:         to r7              ;
CODE_08F0B9:         add   r4           ;
CODE_08F0BA:         iwt   r5,#0000     ;
CODE_08F0BD:         iwt   r1,#0100     ;
CODE_08F0C0:         ibt   r12,#0000    ;
CODE_08F0C2:         to r2              ;
CODE_08F0C3:         getb               ;
CODE_08F0C4:         inc   r14          ;
CODE_08F0C5:         cache              ;
CODE_08F0C6:         to r5              ;
CODE_08F0C7:         getbs              ;
CODE_08F0C9:         with r12           ;
CODE_08F0CA:         add   r11          ;
CODE_08F0CB:         from r12           ;
CODE_08F0CC:         hib                ;
CODE_08F0CD:         with r2            ;
CODE_08F0CE:         sub   r0           ;
CODE_08F0CF:         bmi CODE_08F106    ;
CODE_08F0D1:         nop                ;
CODE_08F0D2:         to r14             ;
CODE_08F0D3:         add   r14          ;
CODE_08F0D4:         with r12           ;
CODE_08F0D5:         lob                ;
CODE_08F0D6:         from r5            ;
CODE_08F0D7:         lob                ;
CODE_08F0D8:         swap               ;
CODE_08F0D9:         to r5              ;
CODE_08F0DA:         fmult              ;
CODE_08F0DB:         move  r4,r9        ;
CODE_08F0DD:         lms   r0,(0000)    ;
CODE_08F0E0:         sub   r5           ;
CODE_08F0E1:         bmi CODE_08F0EC    ;
CODE_08F0E3:         nop                ;
CODE_08F0E4:         move  r4,r10       ;
CODE_08F0E6:         sub   r1           ;
CODE_08F0E7:         bcs CODE_08F0EC    ;
CODE_08F0E9:         add   r1           ;
CODE_08F0EA:         to r4              ;
CODE_08F0EB:         swap               ;
CODE_08F0EC:         from r4            ;
CODE_08F0ED:         stw   (r7)         ;
CODE_08F0EE:         inc   r7           ;
CODE_08F0EF:         move  r4,r10       ;
CODE_08F0F1:         lms   r0,(0000)    ;
CODE_08F0F4:         add   r5           ;
CODE_08F0F5:         bmi CODE_08F100    ;
CODE_08F0F7:         inc   r7           ;
CODE_08F0F8:         move  r4,r9        ;
CODE_08F0FA:         sub   r1           ;
CODE_08F0FB:         bcs CODE_08F100    ;
CODE_08F0FD:         add   r1           ;
CODE_08F0FE:         to r4              ;
CODE_08F0FF:         or    r10          ;
CODE_08F100:         from r4            ;
CODE_08F101:         stw   (r7)         ;
CODE_08F102:         inc   r7           ;
CODE_08F103:         bra CODE_08F0C6    ;

CODE_08F105:         inc   r7           ;

CODE_08F106:         stop               ;
CODE_08F107:         nop                ;

CODE_08F108:         cache              ;
CODE_08F109:         from r5            ;
CODE_08F10A:         add   r5           ;
CODE_08F10B:         mult  #08          ;
CODE_08F10D:         add   r4           ;
CODE_08F10E:         add   r0           ;
CODE_08F10F:         add   r0           ;
CODE_08F110:         iwt   r7,#5800     ;
CODE_08F113:         to r7              ;
CODE_08F114:         add   r7           ;
CODE_08F115:         iwt   r0,#0200     ;
CODE_08F118:         move  r8,r7        ;
CODE_08F11A:         to r9              ;
CODE_08F11B:         add   r8           ;
CODE_08F11C:         to r10             ;
CODE_08F11D:         add   r9           ;
CODE_08F11E:         to r11             ;
CODE_08F11F:         add   r10          ;
CODE_08F120:         sub   r0           ;
CODE_08F121:         iwt   r12,#0040    ;
CODE_08F124:         move  r13,r15      ;
CODE_08F126:         stw   (r8)         ;
CODE_08F127:         inc   r8           ;
CODE_08F128:         inc   r8           ;
CODE_08F129:         stw   (r9)         ;
CODE_08F12A:         inc   r9           ;
CODE_08F12B:         inc   r9           ;
CODE_08F12C:         stw   (r10)        ;
CODE_08F12D:         inc   r10          ;
CODE_08F12E:         inc   r10          ;
CODE_08F12F:         stw   (r11)        ;
CODE_08F130:         inc   r11          ;
CODE_08F131:         loop               ;
CODE_08F132:         inc   r11          ;
CODE_08F133:         ibt   r0,#0010     ;
CODE_08F135:         with r4            ;
CODE_08F136:         add   r0           ;
CODE_08F137:         with r5            ;
CODE_08F138:         add   r0           ;
CODE_08F139:         bra CODE_08F166    ;

CODE_08F13B:         sms   (003C),r4    ;
CODE_08F13E:         cache              ;
CODE_08F13F:         from r5            ;
CODE_08F140:         add   r5           ;
CODE_08F141:         mult  #08          ;
CODE_08F143:         add   r4           ;
CODE_08F144:         add   r0           ;
CODE_08F145:         add   r0           ;
CODE_08F146:         iwt   r7,#5800     ;
CODE_08F149:         to r7              ;
CODE_08F14A:         add   r7           ;
CODE_08F14B:         iwt   r0,#0200     ;
CODE_08F14E:         move  r8,r7        ;
CODE_08F150:         to r9              ;
CODE_08F151:         add   r8           ;
CODE_08F152:         sub   r0           ;
CODE_08F153:         iwt   r12,#0020    ;
CODE_08F156:         move  r13,r15      ;
CODE_08F158:         stw   (r8)         ;
CODE_08F159:         inc   r8           ;
CODE_08F15A:         inc   r8           ;
CODE_08F15B:         stw   (r9)         ;
CODE_08F15C:         inc   r9           ;
CODE_08F15D:         loop               ;
CODE_08F15E:         inc   r9           ;
CODE_08F15F:         with r4            ;
CODE_08F160:         add   #08          ;
CODE_08F162:         with r5            ;
CODE_08F163:         add   #08          ;
CODE_08F165:         sms   (003C),r4    ;
CODE_08F168:         sms   (003E),r5    ;
CODE_08F16B:         sms   (003A),r6    ;
CODE_08F16E:         sub   r0           ;
CODE_08F16F:         cmode              ;
CODE_08F171:         ibt   r0,#0008     ;
CODE_08F173:         romb               ;
CODE_08F175:         ibt   r6,#0010     ;
CODE_08F177:         iwt   r13,#AE18    ;
CODE_08F17A:         from r13           ;
CODE_08F17B:         to r14             ;
CODE_08F17C:         add   r2           ;
CODE_08F17D:         getb               ;
CODE_08F17E:         sms   (0000),r0    ;
CODE_08F181:         move  r9,r0        ;
CODE_08F183:         from r13           ;
CODE_08F184:         to r14             ;
CODE_08F185:         add   r3           ;
CODE_08F186:         getb               ;
CODE_08F187:         sms   (0002),r0    ;
CODE_08F18A:         move  r7,r0        ;
CODE_08F18C:         mult  r6           ;
CODE_08F18D:         sms   (0004),r0    ;
CODE_08F190:         iwt   r13,#AE58    ;
CODE_08F193:         from r13           ;
CODE_08F194:         to r14             ;
CODE_08F195:         add   r2           ;
CODE_08F196:         getb               ;
CODE_08F197:         sms   (0006),r0    ;
CODE_08F19A:         move  r10,r0       ;
CODE_08F19C:         from r13           ;
CODE_08F19D:         to r14             ;
CODE_08F19E:         add   r3           ;
CODE_08F19F:         getb               ;
CODE_08F1A0:         sms   (0008),r0    ;
CODE_08F1A3:         move  r8,r0        ;
CODE_08F1A5:         mult  r6           ;
CODE_08F1A6:         sms   (000A),r0    ;
CODE_08F1A9:         iwt   r14,#F49A    ;
CODE_08F1AC:         ibt   r4,#0020     ;
CODE_08F1AE:         ibt   r12,#0005    ;
CODE_08F1B0:         cache              ;
CODE_08F1B1:         move  r13,r15      ;
CODE_08F1B3:         getbs              ;
CODE_08F1B5:         inc   r14          ;
CODE_08F1B6:         to r11             ;
CODE_08F1B7:         mult  r8           ;
CODE_08F1B8:         getbs              ;
CODE_08F1BA:         inc   r14          ;
CODE_08F1BB:         mult  r7           ;
CODE_08F1BC:         sub   r11          ;
CODE_08F1BD:         add   r0           ;
CODE_08F1BE:         add   r0           ;
CODE_08F1BF:         hib                ;
CODE_08F1C0:         sex                ;
CODE_08F1C1:         to r11             ;
CODE_08F1C2:         mult  r9           ;
CODE_08F1C3:         getbs              ;
CODE_08F1C5:         mult  r10          ;
CODE_08F1C6:         add   r11          ;
CODE_08F1C7:         bpl CODE_08F1CC    ;
CODE_08F1C9:         inc   r14          ;
CODE_08F1CA:         not                ;
CODE_08F1CB:         inc   r0           ;
CODE_08F1CC:         hib                ;
CODE_08F1CD:         lsr                ;
CODE_08F1CE:         to r11             ;
CODE_08F1CF:         lsr                ;
CODE_08F1D0:         getb               ;
CODE_08F1D1:         inc   r14          ;
CODE_08F1D2:         add   r11          ;
CODE_08F1D3:         stb   (r4)         ;
CODE_08F1D5:         loop               ;
CODE_08F1D6:         inc   r4           ;
CODE_08F1D7:         iwt   r0,#F4AE     ;
CODE_08F1DA:         add   r1           ;
CODE_08F1DB:         to r14             ;
CODE_08F1DC:         add   r1           ;
CODE_08F1DD:         getb               ;
CODE_08F1DE:         inc   r14          ;
CODE_08F1DF:         getbh              ;
CODE_08F1E1:         move  r14,r0       ;
CODE_08F1E3:         iwt   r1,#2AF6     ;
CODE_08F1E6:         to r12             ;
CODE_08F1E7:         getb               ;
CODE_08F1E8:         inc   r14          ;
CODE_08F1E9:         move  r13,r15      ;
CODE_08F1EB:         getb               ;
CODE_08F1EC:         inc   r14          ;
CODE_08F1ED:         move  r4,r0        ;
CODE_08F1EF:         lms   r0,(0002)    ;
CODE_08F1F2:         mult  r4           ;
CODE_08F1F3:         move  r2,r0        ;
CODE_08F1F5:         lms   r5,(000A)    ;
CODE_08F1F8:         sub   r5           ;
CODE_08F1F9:         add   r0           ;
CODE_08F1FA:         to r7              ;
CODE_08F1FB:         add   r0           ;
CODE_08F1FC:         from r2            ;
CODE_08F1FD:         add   r5           ;
CODE_08F1FE:         add   r0           ;
CODE_08F1FF:         to r8              ;
CODE_08F200:         add   r0           ;
CODE_08F201:         lms   r0,(0008)    ;
CODE_08F204:         mult  r4           ;
CODE_08F205:         not                ;
CODE_08F206:         inc   r0           ;
CODE_08F207:         move  r3,r0        ;
CODE_08F209:         lms   r5,(0004)    ;
CODE_08F20C:         sub   r5           ;
CODE_08F20D:         add   r0           ;
CODE_08F20E:         add   r0           ;
CODE_08F20F:         hib                ;
CODE_08F210:         to r2              ;
CODE_08F211:         sex                ;
CODE_08F212:         from r5            ;
CODE_08F213:         add   r3           ;
CODE_08F214:         add   r0           ;
CODE_08F215:         add   r0           ;
CODE_08F216:         hib                ;
CODE_08F217:         to r3              ;
CODE_08F218:         sex                ;
CODE_08F219:         getb               ;
CODE_08F21A:         inc   r14          ;
CODE_08F21B:         move  r6,r0        ;
CODE_08F21D:         lms   r5,(0006)    ;
CODE_08F220:         mult  r5           ;
CODE_08F221:         move  r4,r0        ;
CODE_08F223:         lms   r11,(0000)   ;
CODE_08F226:         from r2            ;
CODE_08F227:         mult  r11          ;
CODE_08F228:         add   r4           ;
CODE_08F229:         add   r0           ;
CODE_08F22A:         add   r0           ;
CODE_08F22B:         hib                ;
CODE_08F22C:         to r9              ;
CODE_08F22D:         sex                ;
CODE_08F22E:         from r3            ;
CODE_08F22F:         mult  r11          ;
CODE_08F230:         add   r4           ;
CODE_08F231:         add   r0           ;
CODE_08F232:         add   r0           ;
CODE_08F233:         hib                ;
CODE_08F234:         to r10             ;
CODE_08F235:         sex                ;
CODE_08F236:         from r6            ;
CODE_08F237:         mult  r11          ;
CODE_08F238:         move  r4,r0        ;
CODE_08F23A:         from r2            ;
CODE_08F23B:         mult  r5           ;
CODE_08F23C:         from r4            ;
CODE_08F23D:         sub   r0           ;
CODE_08F23E:         add   r0           ;
CODE_08F23F:         to r11             ;
CODE_08F240:         add   r0           ;
CODE_08F241:         from r3            ;
CODE_08F242:         mult  r5           ;
CODE_08F243:         from r4            ;
CODE_08F244:         sub   r0           ;
CODE_08F245:         add   r0           ;
CODE_08F246:         to r5              ;
CODE_08F247:         add   r0           ;
CODE_08F248:         lms   r2,(003A)    ;
CODE_08F24B:         from r2            ;
CODE_08F24C:         mult  r9           ;
CODE_08F24D:         hib                ;
CODE_08F24E:         to r6              ;
CODE_08F24F:         sex                ;
CODE_08F250:         iwt   r9,#2400     ;
CODE_08F253:         from r9            ;
CODE_08F254:         add   r6           ;
CODE_08F255:         add   r6           ;
CODE_08F256:         to r6              ;
CODE_08F257:         ldw   (r0)         ;
CODE_08F258:         from r11           ;
CODE_08F259:         fmult              ;
CODE_08F25A:         mult  r2           ;
CODE_08F25B:         swap               ;
CODE_08F25C:         lm    r11,(003E)   ;
CODE_08F260:         add   r11          ;
CODE_08F261:         stb   (r1)         ;
CODE_08F263:         inc   r1           ;
CODE_08F264:         from r7            ;
CODE_08F265:         fmult              ;
CODE_08F266:         mult  r2           ;
CODE_08F267:         swap               ;
CODE_08F268:         lm    r7,(003C)    ;
CODE_08F26C:         add   r7           ;
CODE_08F26D:         stb   (r1)         ;
CODE_08F26F:         inc   r1           ;
CODE_08F270:         from r2            ;
CODE_08F271:         mult  r10          ;
CODE_08F272:         hib                ;
CODE_08F273:         to r6              ;
CODE_08F274:         sex                ;
CODE_08F275:         from r9            ;
CODE_08F276:         add   r6           ;
CODE_08F277:         add   r6           ;
CODE_08F278:         to r6              ;
CODE_08F279:         ldw   (r0)         ;
CODE_08F27A:         from r5            ;
CODE_08F27B:         fmult              ;
CODE_08F27C:         mult  r2           ;
CODE_08F27D:         swap               ;
CODE_08F27E:         add   r11          ;
CODE_08F27F:         stb   (r1)         ;
CODE_08F281:         inc   r1           ;
CODE_08F282:         from r8            ;
CODE_08F283:         fmult              ;
CODE_08F284:         mult  r2           ;
CODE_08F285:         swap               ;
CODE_08F286:         add   r7           ;
CODE_08F287:         stb   (r1)         ;
CODE_08F289:         loop               ;
CODE_08F28A:         inc   r1           ;
CODE_08F28B:         iwt   r1,#2BBE     ;
CODE_08F28E:         iwt   r2,#2C0E     ;
CODE_08F291:         ibt   r3,#0000     ;
CODE_08F293:         ibt   r4,#0004     ;
CODE_08F295:         ibt   r5,#0002     ;
CODE_08F297:         ibt   r9,#0020     ;
CODE_08F299:         to r11             ;
CODE_08F29A:         getb               ;
CODE_08F29B:         inc   r14          ;
CODE_08F29C:         sms   (003E),r11   ;
CODE_08F29F:         from r2            ;
CODE_08F2A0:         stw   (r1)         ;
CODE_08F2A1:         inc   r1           ;
CODE_08F2A2:         inc   r1           ;
CODE_08F2A3:         from r3            ;
CODE_08F2A4:         stb   (r1)         ;
CODE_08F2A6:         inc   r1           ;
CODE_08F2A7:         getb               ;
CODE_08F2A8:         inc   r14          ;
CODE_08F2A9:         to r6              ;
CODE_08F2AA:         add   r2           ;
CODE_08F2AB:         inc   r6           ;
CODE_08F2AC:         inc   r6           ;
CODE_08F2AD:         stb   (r2)         ;
CODE_08F2AF:         inc   r2           ;
CODE_08F2B0:         stb   (r6)         ;
CODE_08F2B2:         inc   r6           ;
CODE_08F2B3:         move  r8,r0        ;
CODE_08F2B5:         move  r12,r0       ;
CODE_08F2B7:         add   r5           ;
CODE_08F2B8:         stb   (r1)         ;
CODE_08F2BA:         inc   r1           ;
CODE_08F2BB:         to r3              ;
CODE_08F2BC:         add   r3           ;
CODE_08F2BD:         move  r0,r9        ;
CODE_08F2BF:         stb   (r2)         ;
CODE_08F2C1:         inc   r2           ;
CODE_08F2C2:         move  r7,r2        ;
CODE_08F2C4:         stb   (r6)         ;
CODE_08F2C6:         with r6            ;
CODE_08F2C7:         add   r8           ;
CODE_08F2C8:         move  r13,r15      ;
CODE_08F2CA:         getb               ;
CODE_08F2CB:         inc   r14          ;
CODE_08F2CC:         stb   (r2)         ;
CODE_08F2CE:         inc   r0           ;
CODE_08F2CF:         stb   (r6)         ;
CODE_08F2D1:         inc   r2           ;
CODE_08F2D2:         loop               ;
CODE_08F2D3:         dec   r6           ;
CODE_08F2D4:         with r2            ;
CODE_08F2D5:         add   r8           ;
CODE_08F2D6:         inc   r2           ;
CODE_08F2D7:         inc   r2           ;
CODE_08F2D8:         ldb   (r7)         ;
CODE_08F2DA:         move  r6,r0        ;
CODE_08F2DC:         move  r12,r8       ;
CODE_08F2DE:         dec   r12          ;
CODE_08F2DF:         move  r13,r15      ;
CODE_08F2E1:         from r4            ;
CODE_08F2E2:         stb   (r2)         ;
CODE_08F2E4:         inc   r2           ;
CODE_08F2E5:         to r8              ;
CODE_08F2E6:         getb               ;
CODE_08F2E7:         inc   r14          ;
CODE_08F2E8:         from r8            ;
CODE_08F2E9:         stb   (r2)         ;
CODE_08F2EB:         inc   r2           ;
CODE_08F2EC:         inc   r7           ;
CODE_08F2ED:         stb   (r2)         ;
CODE_08F2EF:         inc   r2           ;
CODE_08F2F0:         inc   r0           ;
CODE_08F2F1:         stb   (r2)         ;
CODE_08F2F3:         inc   r2           ;
CODE_08F2F4:         ldb   (r7)         ;
CODE_08F2F6:         inc   r0           ;
CODE_08F2F7:         stb   (r2)         ;
CODE_08F2F9:         inc   r2           ;
CODE_08F2FA:         dec   r0           ;
CODE_08F2FB:         stb   (r2)         ;
CODE_08F2FD:         loop               ;
CODE_08F2FE:         inc   r2           ;
CODE_08F2FF:         from r4            ;
CODE_08F300:         stb   (r2)         ;
CODE_08F302:         inc   r2           ;
CODE_08F303:         to r8              ;
CODE_08F304:         getb               ;
CODE_08F305:         inc   r14          ;
CODE_08F306:         from r8            ;
CODE_08F307:         stb   (r2)         ;
CODE_08F309:         inc   r2           ;
CODE_08F30A:         stb   (r2)         ;
CODE_08F30C:         inc   r2           ;
CODE_08F30D:         inc   r0           ;
CODE_08F30E:         stb   (r2)         ;
CODE_08F310:         inc   r2           ;
CODE_08F311:         move  r0,r6        ;
CODE_08F313:         inc   r0           ;
CODE_08F314:         stb   (r2)         ;
CODE_08F316:         inc   r2           ;
CODE_08F317:         from r6            ;
CODE_08F318:         stb   (r2)         ;
CODE_08F31A:         dec   r11          ;
CODE_08F31B:         bne CODE_08F29F    ;
CODE_08F31D:         inc   r2           ;
CODE_08F31E:         move  r12,r3       ;
CODE_08F320:         iwt   r1,#2C0E     ;
CODE_08F323:         iwt   r2,#2D3A     ;
CODE_08F326:         iwt   r3,#2AF6     ;
CODE_08F329:         move  r13,r15      ;
CODE_08F32B:         ldb   (r1)         ;
CODE_08F32D:         inc   r1           ;
CODE_08F32E:         inc   r1           ;
CODE_08F32F:         to r4              ;
CODE_08F330:         add   r1           ;
CODE_08F331:         ldb   (r1)         ;
CODE_08F333:         inc   r1           ;
CODE_08F334:         add   r0           ;
CODE_08F335:         to r5              ;
CODE_08F336:         add   r3           ;
CODE_08F337:         ldb   (r1)         ;
CODE_08F339:         inc   r1           ;
CODE_08F33A:         add   r0           ;
CODE_08F33B:         to r6              ;
CODE_08F33C:         add   r3           ;
CODE_08F33D:         ldb   (r1)         ;
CODE_08F33F:         add   r0           ;
CODE_08F340:         to r7              ;
CODE_08F341:         add   r3           ;
CODE_08F342:         to r8              ;
CODE_08F343:         ldb   (r5)         ;
CODE_08F345:         inc   r5           ;
CODE_08F346:         ldb   (r6)         ;
CODE_08F348:         inc   r6           ;
CODE_08F349:         move  r9,r0        ;
CODE_08F34B:         to r8              ;
CODE_08F34C:         sub   r8           ;
CODE_08F34D:         ldb   (r7)         ;
CODE_08F34F:         inc   r7           ;
CODE_08F350:         to r9              ;
CODE_08F351:         sub   r9           ;
CODE_08F352:         ldb   (r6)         ;
CODE_08F354:         move  r11,r0       ;
CODE_08F356:         to r10             ;
CODE_08F357:         ldb   (r5)         ;
CODE_08F359:         sub   r10          ;
CODE_08F35A:         to r9              ;
CODE_08F35B:         mult  r9           ;
CODE_08F35C:         ldb   (r7)         ;
CODE_08F35E:         sub   r11          ;
CODE_08F35F:         mult  r8           ;
CODE_08F360:         sub   r9           ;
CODE_08F361:         swap               ;
CODE_08F362:         stb   (r2)         ;
CODE_08F364:         move  r1,r4        ;
CODE_08F366:         loop               ;
CODE_08F367:         inc   r2           ;
CODE_08F368:         iwt   r1,#2D3A     ;
CODE_08F36B:         getb               ;
CODE_08F36C:         inc   r14          ;
CODE_08F36D:         add   r1           ;
CODE_08F36E:         ldb   (r0)         ;
CODE_08F370:         sex                ;
CODE_08F371:         add   r0           ;
CODE_08F372:         to r2              ;
CODE_08F373:         rol                ;
CODE_08F374:         getb               ;
CODE_08F375:         inc   r14          ;
CODE_08F376:         add   r1           ;
CODE_08F377:         ldb   (r0)         ;
CODE_08F379:         sex                ;
CODE_08F37A:         add   r0           ;
CODE_08F37B:         with r2            ;
CODE_08F37C:         rol                ;
CODE_08F37D:         getb               ;
CODE_08F37E:         inc   r14          ;
CODE_08F37F:         add   r1           ;
CODE_08F380:         ldb   (r0)         ;
CODE_08F382:         sex                ;
CODE_08F383:         add   r0           ;
CODE_08F384:         from r2            ;
CODE_08F385:         rol                ;
CODE_08F386:         and   #07          ;
CODE_08F388:         to r14             ;
CODE_08F389:         add   r14          ;
CODE_08F38A:         cache              ;
CODE_08F38B:         getb               ;
CODE_08F38C:         with r14           ;
CODE_08F38D:         add   #08          ;
CODE_08F38F:         add   r0           ;
CODE_08F390:         add   r0           ;
CODE_08F391:         iwt   r3,#2BBE     ;
CODE_08F394:         to r3              ;
CODE_08F395:         add   r3           ;
CODE_08F396:         to r4              ;
CODE_08F397:         ldw   (r3)         ;
CODE_08F398:         inc   r3           ;
CODE_08F399:         inc   r3           ;
CODE_08F39A:         ldb   (r3)         ;
CODE_08F39C:         inc   r3           ;
CODE_08F39D:         iwt   r5,#2D3A     ;
CODE_08F3A0:         to r5              ;
CODE_08F3A1:         add   r5           ;
CODE_08F3A2:         ldb   (r3)         ;
CODE_08F3A4:         sms   (003C),r0    ;
CODE_08F3A7:         to r12             ;
CODE_08F3A8:         ldb   (r4)         ;
CODE_08F3AA:         inc   r4           ;
CODE_08F3AB:         to r6              ;
CODE_08F3AC:         ldb   (r4)         ;
CODE_08F3AE:         ldb   (r5)         ;
CODE_08F3B0:         sex                ;
CODE_08F3B1:         bpl CODE_08F3B8    ;
CODE_08F3B3:         inc   r5           ;
CODE_08F3B4:         dec   r6           ;
CODE_08F3B5:         bpl CODE_08F3BE    ;
CODE_08F3B7:         inc   r6           ;
CODE_08F3B8:         with r4            ;
CODE_08F3B9:         add   r12          ;
CODE_08F3BA:         iwt   r15,#F47F    ;
CODE_08F3BD:         inc   r4           ;
CODE_08F3BE:         inc   r4           ;
CODE_08F3BF:         ldb   (r6)         ;
CODE_08F3C1:         color              ;
CODE_08F3C2:         iwt   r6,#2AF6     ;
CODE_08F3C5:         ibt   r7,#0000     ;
CODE_08F3C7:         move  r0,r12       ;
CODE_08F3C9:         dec   r0           ;
CODE_08F3CA:         to r10             ;
CODE_08F3CB:         add   r0           ;
CODE_08F3CC:         ibt   r2,#FFFF     ;
CODE_08F3CE:         ibt   r9,#0000     ;
CODE_08F3D0:         move  r13,r15      ;
CODE_08F3D2:         ldb   (r4)         ;
CODE_08F3D4:         add   r0           ;
CODE_08F3D5:         add   r6           ;
CODE_08F3D6:         ldw   (r0)         ;
CODE_08F3D7:         stw   (r7)         ;
CODE_08F3D8:         lob                ;
CODE_08F3D9:         sub   r2           ;
CODE_08F3DA:         bcs CODE_08F3E1    ;
CODE_08F3DC:         add   r2           ;
CODE_08F3DD:         move  r2,r0        ;
CODE_08F3DF:         move  r11,r7       ;
CODE_08F3E1:         sub   r9           ;
CODE_08F3E2:         bcc CODE_08F3E7    ;
CODE_08F3E4:         add   r9           ;
CODE_08F3E5:         move  r9,r0        ;
CODE_08F3E7:         inc   r7           ;
CODE_08F3E8:         inc   r7           ;
CODE_08F3E9:         loop               ;
CODE_08F3EA:         inc   r4           ;
CODE_08F3EB:         sms   (0048),r4    ;
CODE_08F3EE:         sms   (004A),r5    ;
CODE_08F3F1:         sms   (0038),r11   ;
CODE_08F3F4:         sms   (003A),r11   ;
CODE_08F3F7:         move  r7,r2        ;
CODE_08F3F9:         move  r8,r2        ;
CODE_08F3FB:         from r9            ;
CODE_08F3FC:         to r11             ;
CODE_08F3FD:         sub   r2           ;
CODE_08F3FE:         from r2            ;
CODE_08F3FF:         sub   r7           ;
CODE_08F400:         bcc CODE_08F42F    ;
CODE_08F402:         nop                ;
CODE_08F403:         lms   r1,(0038)    ;
CODE_08F406:         inc   r1           ;
CODE_08F407:         ldb   (r1)         ;
CODE_08F409:         to r3              ;
CODE_08F40A:         swap               ;
CODE_08F40B:         dec   r1           ;
CODE_08F40C:         dec   r1           ;
CODE_08F40D:         bpl CODE_08F412    ;
CODE_08F40F:         dec   r1           ;
CODE_08F410:         move  r1,r10       ;
CODE_08F412:         sms   (0038),r1    ;
CODE_08F415:         ldb   (r1)         ;
CODE_08F417:         to r6              ;
CODE_08F418:         sub   r7           ;
CODE_08F419:         beq CODE_08F407    ;
CODE_08F41B:         inc   r1           ;
CODE_08F41C:         move  r7,r0        ;
CODE_08F41E:         iwt   r0,#2200     ;
CODE_08F421:         add   r6           ;
CODE_08F422:         add   r6           ;
CODE_08F423:         ldw   (r0)         ;
CODE_08F424:         to r6              ;
CODE_08F425:         lsr                ;
CODE_08F426:         ldb   (r1)         ;
CODE_08F428:         swap               ;
CODE_08F429:         sub   r3           ;
CODE_08F42A:         fmult              ;
CODE_08F42B:         to r3              ;
CODE_08F42C:         add   r3           ;
CODE_08F42D:         to r5              ;
CODE_08F42E:         add   r0           ;
CODE_08F42F:         from r2            ;
CODE_08F430:         sub   r8           ;
CODE_08F431:         bcc CODE_08F460    ;
CODE_08F433:         nop                ;
CODE_08F434:         lms   r1,(003A)    ;
CODE_08F437:         inc   r1           ;
CODE_08F438:         ldb   (r1)         ;
CODE_08F43A:         to r4              ;
CODE_08F43B:         swap               ;
CODE_08F43C:         from r1            ;
CODE_08F43D:         sub   r10          ;
CODE_08F43E:         bcc CODE_08F443    ;
CODE_08F440:         inc   r1           ;
CODE_08F441:         ibt   r1,#0000     ;
CODE_08F443:         sms   (003A),r1    ;
CODE_08F446:         ldb   (r1)         ;
CODE_08F448:         to r6              ;
CODE_08F449:         sub   r8           ;
CODE_08F44A:         beq CODE_08F438    ;
CODE_08F44C:         inc   r1           ;
CODE_08F44D:         move  r8,r0        ;
CODE_08F44F:         iwt   r0,#2200     ;
CODE_08F452:         add   r6           ;
CODE_08F453:         add   r6           ;
CODE_08F454:         ldw   (r0)         ;
CODE_08F455:         to r6              ;
CODE_08F456:         lsr                ;
CODE_08F457:         ldb   (r1)         ;
CODE_08F459:         swap               ;
CODE_08F45A:         sub   r4           ;
CODE_08F45B:         fmult              ;
CODE_08F45C:         to r4              ;
CODE_08F45D:         add   r4           ;
CODE_08F45E:         to r9              ;
CODE_08F45F:         rol                ;
CODE_08F460:         from r3            ;
CODE_08F461:         to r1              ;
CODE_08F462:         hib                ;
CODE_08F463:         from r4            ;
CODE_08F464:         hib                ;
CODE_08F465:         to r12             ;
CODE_08F466:         sub   r1           ;
CODE_08F467:         bmi CODE_08F471    ;
CODE_08F469:         nop                ;
CODE_08F46A:         beq CODE_08F471    ;
CODE_08F46C:         nop                ;
CODE_08F46D:         move  r13,r15      ;
CODE_08F46F:         loop               ;
CODE_08F470:         plot               ;
CODE_08F471:         with r3            ;
CODE_08F472:         add   r5           ;
CODE_08F473:         with r4            ;
CODE_08F474:         add   r9           ;
CODE_08F475:         dec   r11          ;
CODE_08F476:         bpl CODE_08F3FE    ;
CODE_08F478:         inc   r2           ;
CODE_08F479:         lms   r4,(0048)    ;
CODE_08F47C:         lms   r5,(004A)    ;
CODE_08F47F:         lms   r0,(003C)    ;
CODE_08F482:         dec   r0           ;
CODE_08F483:         beq CODE_08F48A    ;
CODE_08F485:         nop                ;
CODE_08F486:         iwt   r15,#F3A7    ;
CODE_08F489:         sbk                ;
CODE_08F48A:         lms   r0,(003E)    ;
CODE_08F48D:         dec   r0           ;
CODE_08F48E:         beq CODE_08F495    ;
CODE_08F490:         nop                ;
CODE_08F491:         iwt   r15,#F38B    ;
CODE_08F494:         sbk                ;
CODE_08F495:         inc   r2           ;
CODE_08F496:         rpix               ;
CODE_08F498:         stop               ;
CODE_08F499:         nop                ;

DATA_08F49A:         db $2D, $20, $E0, $0C, $00, $2D, $2D, $08
DATA_08F4A2:         db $2D, $E0, $20, $08, $20, $CA, $F7, $08
DATA_08F4AA:         db $E0, $F7, $CA, $08, $E2, $F4, $38, $F5
DATA_08F4B2:         db $8C, $F5, $DC, $F5, $24, $F6, $FD, $FC
DATA_08F4BA:         db $67, $FD, $89, $F6, $EC, $F6, $0A, $F7
DATA_08F4C2:         db $56, $F7, $B3, $F7, $18, $F8, $8E, $F8
DATA_08F4CA:         db $F3, $F8, $3B, $F9, $DD, $F9, $3E, $FA
DATA_08F4D2:         db $71, $FA, $E5, $FA, $DC, $FD, $1C, $FB
DATA_08F4DA:         db $8C, $FB, $8F, $FC, $ED, $FB, $26, $FC
DATA_08F4E2:         db $0C, $10, $C0, $E7, $CC, $D0, $D0, $30
DATA_08F4EA:         db $D0, $ED, $E0, $10, $E0, $30, $F0, $F4
DATA_08F4F2:         db $F8, $20, $00, $FE, $10, $E0, $40, $10
DATA_08F4FA:         db $40, $03, $04, $02, $16, $14, $04, $22
DATA_08F502:         db $21, $22, $21, $05, $00, $06, $0A, $08
DATA_08F50A:         db $02, $23, $00, $21, $00, $21, $06, $06
DATA_08F512:         db $0C, $10, $12, $0E, $0A, $22, $24, $21
DATA_08F51A:         db $00, $24, $00, $00, $02, $09, $02, $01
DATA_08F522:         db $00, $00, $02, $01, $00, $00, $01, $02
DATA_08F52A:         db $02, $01, $01, $02, $02, $01, $00, $00
DATA_08F532:         db $01, $02, $00, $00, $01, $02, $0C, $F0
DATA_08F53A:         db $C0, $00, $C4, $10, $C8, $00, $F0, $FA
DATA_08F542:         db $10, $09, $10, $F3, $30, $12, $30, $D0
DATA_08F54A:         db $40, $F4, $40, $0F, $40, $30, $40, $03
DATA_08F552:         db $05, $00, $02, $06, $12, $10, $21, $00
DATA_08F55A:         db $22, $21, $22, $04, $08, $0A, $0E, $0C
DATA_08F562:         db $21, $00, $21, $00, $05, $02, $04, $16
DATA_08F56A:         db $14, $06, $21, $22, $21, $22, $00, $03
DATA_08F572:         db $04, $12, $01, $02, $00, $02, $01, $02
DATA_08F57A:         db $00, $00, $02, $01, $01, $00, $00, $01
DATA_08F582:         db $01, $02, $00, $00, $02, $01, $02, $00
DATA_08F58A:         db $02, $01, $0A, $D0, $D0, $F8, $D0, $10
DATA_08F592:         db $E0, $30, $E0, $D7, $20, $F0, $20, $00
DATA_08F59A:         db $28, $20, $30, $F0, $40, $00, $40, $03
DATA_08F5A2:         db $04, $00, $02, $0A, $08, $21, $22, $00
DATA_08F5AA:         db $22, $05, $08, $0A, $0C, $12, $10, $00
DATA_08F5B2:         db $23, $00, $21, $23, $05, $04, $06, $0E
DATA_08F5BA:         db $12, $0C, $21, $22, $24, $00, $22, $00
DATA_08F5C2:         db $0A, $04, $02, $02, $01, $00, $02, $02
DATA_08F5CA:         db $01, $00, $01, $00, $00, $01, $01, $00
DATA_08F5D2:         db $00, $01, $00, $01, $02, $02, $00, $01
DATA_08F5DA:         db $02, $02, $08, $00, $C0, $20, $E0, $E0
DATA_08F5E2:         db $F0, $10, $F0, $00, $10, $20, $10, $E0
DATA_08F5EA:         db $20, $00, $40, $03, $04, $00, $02, $06
DATA_08F5F2:         db $04, $23, $24, $00, $24, $04, $04, $06
DATA_08F5FA:         db $0A, $08, $00, $23, $00, $23, $04, $08
DATA_08F602:         db $0A, $0E, $0C, $00, $24, $23, $24, $00
DATA_08F60A:         db $0A, $04, $02, $02, $01, $00, $02, $02
DATA_08F612:         db $01, $00, $01, $00, $02, $01, $01, $00
DATA_08F61A:         db $02, $01, $00, $01, $00, $02, $00, $01
DATA_08F622:         db $00, $02, $0E, $E0, $D0, $00, $C8, $20
DATA_08F62A:         db $C0, $FC, $E8, $20, $E0, $FC, $F8, $20
DATA_08F632:         db $F0, $00, $10, $18, $10, $FC, $28, $20
DATA_08F63A:         db $20, $E0, $40, $00, $40, $20, $40, $04
DATA_08F642:         db $04, $00, $02, $18, $16, $21, $22, $21
DATA_08F64A:         db $22, $04, $02, $04, $08, $06, $21, $22
DATA_08F652:         db $21, $00, $04, $0A, $0C, $10, $0E, $21
DATA_08F65A:         db $22, $21, $00, $04, $12, $14, $1A, $18
DATA_08F662:         db $21, $22, $21, $00, $00, $03, $04, $03
DATA_08F66A:         db $01, $00, $00, $03, $01, $00, $00, $02
DATA_08F672:         db $02, $03, $01, $02, $02, $03, $01, $01
DATA_08F67A:         db $03, $02, $02, $01, $03, $02, $02, $00
DATA_08F682:         db $00, $01, $03, $00, $00, $01, $03, $0B
DATA_08F68A:         db $10, $C0, $30, $E0, $30, $10, $00, $40
DATA_08F692:         db $E0, $30, $D0, $00, $F0, $D0, $FC, $E0
DATA_08F69A:         db $20, $F0, $00, $20, $F0, $00, $04, $04
DATA_08F6A2:         db $00, $02, $10, $0E, $23, $00, $23, $00
DATA_08F6AA:         db $05, $10, $02, $04, $06, $12, $00, $22
DATA_08F6B2:         db $24, $00, $24, $05, $12, $06, $08, $0A
DATA_08F6BA:         db $14, $00, $23, $23, $00, $23, $04, $0C
DATA_08F6C2:         db $00, $14, $0A, $24, $24, $00, $24, $00
DATA_08F6CA:         db $17, $18, $01, $00, $02, $03, $01, $00
DATA_08F6D2:         db $02, $03, $00, $03, $03, $00, $00, $03
DATA_08F6DA:         db $03, $00, $02, $01, $01, $02, $02, $01
DATA_08F6E2:         db $01, $02, $03, $02, $00, $01, $03, $02
DATA_08F6EA:         db $00, $01, $04, $00, $C0, $20, $D0, $10
DATA_08F6F2:         db $40, $E0, $30, $01, $04, $00, $02, $04
DATA_08F6FA:         db $06, $23, $24, $23, $24, $00, $02, $03
DATA_08F702:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08F70A:         db $0A, $F0, $C0, $20, $E0, $30, $00, $F6
DATA_08F712:         db $20, $20, $20, $30, $40, $D0, $40, $D0
DATA_08F71A:         db $30, $14, $F0, $D0, $E0, $03, $04, $00
DATA_08F722:         db $02, $10, $12, $23, $00, $23, $24, $04
DATA_08F72A:         db $0E, $02, $04, $0C, $24, $23, $24, $22
DATA_08F732:         db $04, $06, $08, $0A, $0C, $21, $23, $21
DATA_08F73A:         db $00, $00, $08, $10, $00, $00, $02, $01
DATA_08F742:         db $01, $00, $02, $00, $01, $01, $01, $00
DATA_08F74A:         db $02, $01, $01, $01, $02, $02, $00, $02
DATA_08F752:         db $00, $02, $00, $02, $0A, $F0, $C0, $40
DATA_08F75A:         db $E0, $20, $00, $30, $10, $00, $40, $D0
DATA_08F762:         db $30, $10, $10, $00, $00, $10, $F0, $E0
DATA_08F76A:         db $E0, $04, $04, $00, $02, $10, $12, $23
DATA_08F772:         db $00, $23, $24, $04, $02, $04, $0E, $10
DATA_08F77A:         db $24, $00, $24, $00, $04, $04, $06, $0C
DATA_08F782:         db $0E, $23, $00, $23, $00, $04, $0C, $06
DATA_08F78A:         db $08, $0A, $00, $24, $23, $24, $00, $15
DATA_08F792:         db $16, $03, $00, $00, $00, $03, $00, $00
DATA_08F79A:         db $00, $02, $01, $01, $01, $02, $01, $01
DATA_08F7A2:         db $01, $01, $02, $03, $02, $01, $02, $02
DATA_08F7AA:         db $02, $00, $03, $02, $03, $00, $03, $03
DATA_08F7B2:         db $03, $0E, $E0, $C0, $10, $C0, $F0, $10
DATA_08F7BA:         db $05, $16, $15, $D0, $30, $D0, $26, $16
DATA_08F7C2:         db $30, $10, $30, $30, $22, $2A, $20, $40
DATA_08F7CA:         db $FB, $40, $00, $2C, $D0, $2D, $04, $04
DATA_08F7D2:         db $00, $02, $04, $1A, $21, $24, $00, $24
DATA_08F7DA:         db $04, $08, $0A, $0C, $06, $21, $24, $00
DATA_08F7E2:         db $24, $04, $04, $0E, $10, $1A, $21, $22
DATA_08F7EA:         db $23, $00, $04, $18, $12, $14, $16, $00
DATA_08F7F2:         db $24, $21, $24, $00, $0F, $10, $03, $01
DATA_08F7FA:         db $00, $00, $03, $01, $03, $00, $02, $00
DATA_08F802:         db $03, $01, $02, $00, $02, $01, $01, $02
DATA_08F80A:         db $02, $02, $01, $02, $01, $02, $00, $03
DATA_08F812:         db $01, $03, $00, $03, $00, $03, $0E, $00
DATA_08F81A:         db $C0, $24, $C0, $18, $CC, $40, $C0, $40
DATA_08F822:         db $E0, $08, $E0, $04, $F0, $20, $00, $20
DATA_08F82A:         db $30, $E0, $40, $D0, $20, $00, $20, $00
DATA_08F832:         db $10, $E0, $00, $05, $04, $00, $02, $0C
DATA_08F83A:         db $1A, $21, $24, $00, $24, $04, $04, $06
DATA_08F842:         db $08, $0A, $24, $22, $21, $00, $04, $0C
DATA_08F84A:         db $0E, $18, $1A, $23, $00, $23, $00, $04
DATA_08F852:         db $0E, $10, $16, $18, $22, $00, $22, $00
DATA_08F85A:         db $04, $16, $10, $12, $14, $00, $24, $23
DATA_08F862:         db $21, $00, $03, $0A, $04, $01, $04, $00
DATA_08F86A:         db $04, $01, $04, $00, $03, $00, $03, $01
DATA_08F872:         db $03, $00, $03, $01, $02, $03, $02, $02
DATA_08F87A:         db $02, $02, $02, $02, $01, $02, $00, $03
DATA_08F882:         db $01, $03, $00, $03, $00, $04, $01, $04
DATA_08F88A:         db $00, $04, $01, $04, $0C, $00, $C0, $30
DATA_08F892:         db $D0, $08, $F6, $30, $00, $30, $20, $06
DATA_08F89A:         db $40, $E0, $30, $D0, $00, $FC, $FF, $10
DATA_08F8A2:         db $10, $00, $20, $F8, $10, $04, $04, $00
DATA_08F8AA:         db $02, $16, $0E, $23, $24, $00, $24, $04
DATA_08F8B2:         db $04, $06, $12, $10, $23, $00, $23, $00
DATA_08F8BA:         db $05, $06, $08, $0A, $14, $12, $22, $24
DATA_08F8C2:         db $00, $24, $00, $05, $14, $0A, $0C, $0E
DATA_08F8CA:         db $16, $00, $23, $23, $00, $23, $00, $03
DATA_08F8D2:         db $0A, $03, $01, $03, $00, $02, $02, $00
DATA_08F8DA:         db $00, $02, $02, $00, $01, $01, $01, $03
DATA_08F8E2:         db $01, $01, $00, $01, $02, $03, $00, $01
DATA_08F8EA:         db $02, $00, $03, $02, $03, $00, $03, $02
DATA_08F8F2:         db $03, $08, $E0, $C0, $40, $E0, $20, $00
DATA_08F8FA:         db $00, $40, $D0, $40, $F0, $10, $10, $F0
DATA_08F902:         db $D0, $E0, $03, $04, $00, $02, $0C, $0E
DATA_08F90A:         db $23, $00, $23, $24, $04, $02, $04, $0A
DATA_08F912:         db $0C, $24, $00, $24, $00, $04, $04, $06
DATA_08F91A:         db $08, $0A, $24, $21, $24, $00, $00, $03
DATA_08F922:         db $04, $02, $00, $00, $00, $02, $00, $00
DATA_08F92A:         db $00, $01, $01, $02, $02, $01, $01, $02
DATA_08F932:         db $01, $00, $02, $01, $01, $00, $02, $01
DATA_08F93A:         db $02, $12, $20, $C0, $40, $E0, $20, $00
DATA_08F942:         db $30, $30, $00, $40, $C0, $20, $D0, $00
DATA_08F94A:         db $F0, $F0, $E0, $E0, $E0, $D0, $0C, $CE
DATA_08F952:         db $20, $DE, $10, $F8, $FC, $E0, $02, $FC
DATA_08F95A:         db $12, $0E, $00, $20, $F0, $10, $07, $04
DATA_08F962:         db $00, $02, $16, $14, $23, $00, $23, $00
DATA_08F96A:         db $04, $02, $04, $18, $16, $24, $00, $24
DATA_08F972:         db $00, $04, $04, $06, $0E, $1A, $23, $23
DATA_08F97A:         db $00, $23, $04, $1E, $06, $08, $20, $00
DATA_08F982:         db $24, $00, $24, $05, $22, $20, $08, $0A
DATA_08F98A:         db $0C, $23, $00, $23, $24, $00, $04, $0E
DATA_08F992:         db $1C, $22, $0C, $00, $24, $00, $24, $04
DATA_08F99A:         db $00, $0E, $10, $12, $24, $23, $22, $24
DATA_08F9A2:         db $00, $27, $0F, $04, $00, $04, $06, $04
DATA_08F9AA:         db $00, $04, $06, $03, $01, $03, $00, $03
DATA_08F9B2:         db $01, $05, $00, $05, $02, $05, $02, $05
DATA_08F9BA:         db $02, $03, $02, $02, $06, $06, $05, $02
DATA_08F9C2:         db $03, $06, $05, $01, $03, $02, $01, $01
DATA_08F9CA:         db $06, $02, $04, $00, $05, $00, $04, $00
DATA_08F9D2:         db $05, $01, $01, $06, $04, $01, $03, $06
DATA_08F9DA:         db $04, $00, $03, $0B, $20, $C0, $40, $00
DATA_08F9E2:         db $10, $40, $E0, $30, $02, $10, $F0, $10
DATA_08F9EA:         db $D0, $E0, $10, $E0, $20, $F0, $12, $00
DATA_08F9F2:         db $00, $F0, $04, $04, $10, $0E, $00, $02
DATA_08F9FA:         db $23, $00, $23, $00, $04, $10, $02, $04
DATA_08FA02:         db $06, $00, $24, $23, $24, $05, $14, $12
DATA_08FA0A:         db $08, $0A, $0C, $23, $00, $21, $23, $00
DATA_08FA12:         db $04, $0E, $14, $0C, $00, $24, $00, $24
DATA_08FA1A:         db $00, $00, $18, $02, $01, $01, $02, $00
DATA_08FA22:         db $01, $00, $02, $03, $02, $00, $03, $02
DATA_08FA2A:         db $00, $01, $03, $00, $00, $03, $01, $03
DATA_08FA32:         db $02, $03, $00, $02, $03, $02, $00, $01
DATA_08FA3A:         db $03, $02, $01, $01, $06, $E0, $CB, $10
DATA_08FA42:         db $C0, $FB, $18, $28, $15, $30, $40, $D0
DATA_08FA4A:         db $40, $02, $04, $04, $0A, $00, $02, $00
DATA_08FA52:         db $22, $21, $22, $04, $04, $06, $08, $0A
DATA_08FA5A:         db $21, $22, $21, $00, $00, $03, $04, $00
DATA_08FA62:         db $01, $00, $01, $00, $01, $00, $01, $01
DATA_08FA6A:         db $00, $01, $00, $01, $00, $01, $00, $0D
DATA_08FA72:         db $00, $C0, $27, $C9, $34, $DC, $15, $F0
DATA_08FA7A:         db $12, $DC, $F0, $FC, $F0, $10, $08, $20
DATA_08FA82:         db $29, $11, $2E, $35, $00, $40, $D0, $20
DATA_08FA8A:         db $D0, $F0, $05, $04, $02, $04, $06, $00
DATA_08FA92:         db $23, $24, $23, $21, $04, $00, $08, $0A
DATA_08FA9A:         db $18, $00, $24, $00, $24, $04, $0A, $0C
DATA_08FAA2:         db $16, $18, $22, $00, $22, $00, $04, $0C
DATA_08FAAA:         db $0E, $14, $16, $23, $00, $23, $00, $04
DATA_08FAB2:         db $0E, $10, $12, $14, $21, $22, $21, $00
DATA_08FABA:         db $00, $10, $1C, $03, $00, $00, $00, $03
DATA_08FAC2:         db $00, $04, $00, $04, $01, $04, $01, $04
DATA_08FACA:         db $01, $03, $01, $02, $02, $03, $02, $02
DATA_08FAD2:         db $02, $00, $02, $01, $03, $01, $04, $01
DATA_08FADA:         db $03, $02, $04, $00, $04, $02, $03, $00
DATA_08FAE2:         db $04, $01, $03, $08, $D0, $C0, $30, $C0
DATA_08FAEA:         db $30, $E0, $D9, $EB, $F0, $E5, $11, $E0
DATA_08FAF2:         db $15, $40, $F0, $40, $02, $04, $00, $02
DATA_08FAFA:         db $04, $06, $21, $22, $21, $22, $04, $08
DATA_08FB02:         db $0A, $0C, $0E, $00, $22, $21, $22, $00
DATA_08FB0A:         db $0B, $02, $00, $01, $00, $01, $00, $01
DATA_08FB12:         db $00, $01, $01, $00, $01, $00, $01, $00
DATA_08FB1A:         db $01, $00, $0D, $00, $C0, $20, $E0, $E0
DATA_08FB22:         db $00, $04, $24, $10, $10, $00, $00, $20
DATA_08FB2A:         db $00, $30, $00, $40, $40, $20, $40, $20
DATA_08FB32:         db $30, $E0, $40, $C0, $00, $05, $04, $00
DATA_08FB3A:         db $02, $04, $18, $23, $24, $00, $24, $04
DATA_08FB42:         db $04, $06, $16, $18, $23, $00, $23, $00
DATA_08FB4A:         db $03, $0C, $14, $16, $00, $21, $24, $03
DATA_08FB52:         db $0A, $0C, $08, $21, $00, $23, $04, $0C
DATA_08FB5A:         db $0E, $10, $12, $21, $22, $21, $22, $00
DATA_08FB62:         db $18, $19, $00, $00, $04, $02, $00, $00
DATA_08FB6A:         db $04, $02, $04, $03, $02, $01, $04, $04
DATA_08FB72:         db $02, $01, $02, $01, $03, $04, $03, $03
DATA_08FB7A:         db $03, $03, $03, $02, $01, $03, $02, $02
DATA_08FB82:         db $01, $00, $01, $04, $00, $00, $01, $01
DATA_08FB8A:         db $00, $04, $0C, $E0, $D0, $F0, $E0, $00
DATA_08FB92:         db $F0, $18, $E0, $30, $C0, $40, $40, $10
DATA_08FB9A:         db $40, $10, $00, $00, $40, $F0, $10, $F0
DATA_08FBA2:         db $40, $C0, $40, $04, $04, $00, $02, $14
DATA_08FBAA:         db $16, $23, $22, $21, $22, $04, $02, $04
DATA_08FBB2:         db $10, $12, $23, $00, $23, $00, $04, $04
DATA_08FBBA:         db $06, $0E, $10, $24, $00, $24, $00, $04
DATA_08FBC2:         db $06, $08, $0A, $0C, $24, $22, $21, $22
DATA_08FBCA:         db $00, $03, $04, $03, $03, $00, $00, $03
DATA_08FBD2:         db $03, $00, $00, $02, $02, $01, $01, $02
DATA_08FBDA:         db $02, $01, $01, $01, $01, $02, $02, $01
DATA_08FBE2:         db $01, $02, $02, $00, $00, $03, $03, $00
DATA_08FBEA:         db $00, $03, $03, $08, $F0, $C0, $EE, $20
DATA_08FBF2:         db $20, $C0, $40, $E0, $00, $40, $F0, $40
DATA_08FBFA:         db $E0, $40, $C0, $D0, $02, $04, $00, $0A
DATA_08FC02:         db $0C, $0E, $22, $21, $23, $24, $05, $02
DATA_08FC0A:         db $04, $06, $08, $0A, $24, $23, $24, $21
DATA_08FC12:         db $22, $00, $02, $03, $01, $01, $00, $00
DATA_08FC1A:         db $01, $01, $00, $00, $00, $00, $01, $01
DATA_08FC22:         db $00, $00, $01, $01, $0E, $00, $C0, $20
DATA_08FC2A:         db $D0, $30, $F0, $1A, $FC, $40, $20, $20
DATA_08FC32:         db $40, $00, $10, $F0, $10, $00, $40, $D0
DATA_08FC3A:         db $40, $C0, $D0, $E0, $E0, $10, $E0, $ED
DATA_08FC42:         db $00, $04, $05, $00, $02, $18, $16, $14
DATA_08FC4A:         db $23, $00, $21, $00, $21, $04, $16, $10
DATA_08FC52:         db $12, $14, $23, $21, $22, $00, $05, $02
DATA_08FC5A:         db $04, $0C, $0E, $1A, $23, $24, $21, $00
DATA_08FC62:         db $24, $04, $06, $08, $0A, $0C, $23, $24
DATA_08FC6A:         db $23, $00, $00, $0A, $0B, $01, $03, $00
DATA_08FC72:         db $02, $01, $03, $00, $02, $03, $02, $01
DATA_08FC7A:         db $03, $02, $02, $01, $00, $02, $01, $02
DATA_08FC82:         db $00, $00, $01, $02, $03, $00, $00, $03
DATA_08FC8A:         db $01, $03, $00, $03, $01, $0A, $00, $C0
DATA_08FC92:         db $40, $E0, $30, $30, $10, $40, $E0, $40
DATA_08FC9A:         db $C0, $00, $F0, $F0, $10, $EA, $20, $10
DATA_08FCA2:         db $F0, $20, $05, $04, $0C, $00, $02, $0E
DATA_08FCAA:         db $00, $23, $00, $21, $04, $10, $0E, $02
DATA_08FCB2:         db $04, $23, $00, $22, $00, $05, $10, $04
DATA_08FCBA:         db $06, $08, $12, $00, $24, $21, $00, $21
DATA_08FCC2:         db $04, $08, $0A, $0C, $12, $23, $00, $22
DATA_08FCCA:         db $00, $03, $00, $0C, $0A, $00, $00, $24
DATA_08FCD2:         db $00, $0A, $10, $02, $00, $04, $04, $01
DATA_08FCDA:         db $01, $04, $04, $03, $04, $03, $00, $02
DATA_08FCE2:         db $00, $03, $03, $01, $01, $00, $03, $03
DATA_08FCEA:         db $02, $02, $00, $00, $03, $02, $01, $00
DATA_08FCF2:         db $04, $00, $01, $04, $02, $01, $02, $04
DATA_08FCFA:         db $03, $01, $02, $09, $00, $C0, $30, $E0
DATA_08FD02:         db $30, $20, $E0, $40, $D0, $D0, $F0, $E0
DATA_08FD0A:         db $10, $F0, $10, $08, $F0, $20, $05, $04
DATA_08FD12:         db $0A, $00, $02, $0C, $00, $23, $00, $23
DATA_08FD1A:         db $04, $0E, $0C, $02, $04, $22, $00, $22
DATA_08FD22:         db $00, $04, $0E, $04, $06, $10, $00, $24
DATA_08FD2A:         db $00, $24, $04, $08, $0A, $10, $06, $00
DATA_08FD32:         db $22, $00, $22, $03, $00, $0A, $08, $00
DATA_08FD3A:         db $00, $24, $00, $0A, $0F, $02, $04, $03
DATA_08FD42:         db $04, $01, $00, $02, $04, $03, $00, $02
DATA_08FD4A:         db $03, $02, $04, $03, $03, $01, $03, $01
DATA_08FD52:         db $00, $03, $01, $04, $00, $04, $01, $04
DATA_08FD5A:         db $01, $00, $02, $01, $01, $00, $02, $00
DATA_08FD62:         db $02, $04, $03, $00, $02, $13, $F0, $C0
DATA_08FD6A:         db $00, $D0, $E0, $10, $D0, $F0, $D0, $D0
DATA_08FD72:         db $E0, $20, $F0, $30, $E0, $40, $D0, $30
DATA_08FD7A:         db $20, $C0, $30, $D0, $30, $E0, $10, $10
DATA_08FD82:         db $00, $E0, $10, $20, $20, $20, $20, $30
DATA_08FD8A:         db $10, $40, $00, $30, $04, $05, $00, $02
DATA_08FD92:         db $04, $06, $08, $23, $24, $23, $22, $24
DATA_08FD9A:         db $04, $0A, $0C, $0E, $10, $23, $24, $23
DATA_08FDA2:         db $24, $05, $1A, $12, $14, $16, $18, $24
DATA_08FDAA:         db $23, $22, $24, $23, $05, $1C, $1E, $20
DATA_08FDB2:         db $22, $24, $21, $22, $24, $23, $24, $00
DATA_08FDBA:         db $05, $19, $01, $01, $03, $03, $00, $00
DATA_08FDC2:         db $02, $02, $00, $00, $01, $01, $02, $02
DATA_08FDCA:         db $00, $00, $03, $03, $02, $02, $01, $01
DATA_08FDD2:         db $03, $03, $02, $02, $00, $00, $03, $03
DATA_08FDDA:         db $01, $01, $03, $00, $00, $00, $00, $00
DATA_08FDE2:         db $00, $01, $03, $00, $02, $04, $00, $00
DATA_08FDEA:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_08FDF2:         db $00, $00, $00, $00

; freespace
DATA_08FDF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FDFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FE9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FECE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FED6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FEFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FF9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFCE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_08FFFE:         db $FF, $FF
