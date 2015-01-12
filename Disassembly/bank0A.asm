org $0A8000

CODE_0A8000:         romb               ;
CODE_0A8002:         sm    (0080),r0    ;
CODE_0A8006:         move  r14,r1       ;
CODE_0A8008:         ibt   r0,#0011     ;
CODE_0A800A:         cmode              ;
CODE_0A800C:         ibt   r2,#0000     ;
CODE_0A800E:         iwt   r4,#0F0F     ;
CODE_0A8011:         getb               ;
CODE_0A8012:         add   r0           ;
CODE_0A8013:         add   r0           ;
CODE_0A8014:         add   r0           ;
CODE_0A8015:         to r6              ;
CODE_0A8016:         add   r0           ;
CODE_0A8017:         link  #04          ;
CODE_0A8018:         iwt   r15,#81B3    ;
CODE_0A801B:         getb               ;
CODE_0A801C:         rol                ;
CODE_0A801D:         or    r6           ;
CODE_0A801E:         to r6              ;
CODE_0A801F:         and   r4           ;
CODE_0A8020:         getb               ;
CODE_0A8021:         add   r0           ;
CODE_0A8022:         add   r0           ;
CODE_0A8023:         add   r0           ;
CODE_0A8024:         to r7              ;
CODE_0A8025:         add   r0           ;
CODE_0A8026:         link  #04          ;
CODE_0A8027:         iwt   r15,#81B3    ;
CODE_0A802A:         getb               ;
CODE_0A802B:         rol                ;
CODE_0A802C:         or    r7           ;
CODE_0A802D:         to r7              ;
CODE_0A802E:         and   r4           ;
CODE_0A802F:         getb               ;
CODE_0A8030:         add   r0           ;
CODE_0A8031:         add   r0           ;
CODE_0A8032:         add   r0           ;
CODE_0A8033:         to r8              ;
CODE_0A8034:         add   r0           ;
CODE_0A8035:         link  #04          ;
CODE_0A8036:         iwt   r15,#81B3    ;
CODE_0A8039:         getb               ;
CODE_0A803A:         rol                ;
CODE_0A803B:         or    r8           ;
CODE_0A803C:         to r8              ;
CODE_0A803D:         and   r4           ;
CODE_0A803E:         getb               ;
CODE_0A803F:         to r9              ;
CODE_0A8040:         and   r4           ;
CODE_0A8041:         sub   r0           ;
CODE_0A8042:         ibt   r1,#0000     ;
CODE_0A8044:         ibt   r12,#0040    ;
CODE_0A8046:         cache              ;
CODE_0A8047:         move  r13,r15      ;
CODE_0A8049:         stw   (r1)         ;
CODE_0A804A:         inc   r1           ;
CODE_0A804B:         loop               ;
CODE_0A804C:         inc   r1           ;
CODE_0A804D:         dec   r1           ;
CODE_0A804E:         link  #04          ;
CODE_0A804F:         iwt   r15,#81B3    ;
CODE_0A8052:         getb               ;
CODE_0A8053:         ibt   r10,#0005    ;
CODE_0A8055:         lsr                ;
CODE_0A8056:         lsr                ;
CODE_0A8057:         iwt   r15,#8116    ;
CODE_0A805A:         lsr                ;
CODE_0A805B:         bne CODE_0A8063    ;
CODE_0A805D:         lsr                ;
CODE_0A805E:         link  #04          ;
CODE_0A805F:         iwt   r15,#81B3    ;
CODE_0A8062:         getb               ;
CODE_0A8063:         move  r4,r0        ;
CODE_0A8065:         to r5              ;
CODE_0A8066:         ldb   (r1)         ;
CODE_0A8068:         bcs CODE_0A8085    ;
CODE_0A806A:         dec   r1           ;
CODE_0A806B:         ldb   (r1)         ;
CODE_0A806D:         cmp   r5           ;
CODE_0A806F:         beq CODE_0A806B    ;
CODE_0A8071:         dec   r1           ;
CODE_0A8072:         inc   r1           ;
CODE_0A8073:         move  r13,r15      ;
CODE_0A8075:         from r5            ;
CODE_0A8076:         stb   (r1)         ;
CODE_0A8078:         loop               ;
CODE_0A8079:         dec   r1           ;
CODE_0A807A:         bpl CODE_0A8092    ;
CODE_0A807C:         nop                ;
CODE_0A807E:         bra CODE_0A80EC    ;

CODE_0A8080:         inc   r1           ;
CODE_0A8081:         and   r1           ;
CODE_0A8082:         bra CODE_0A808F    ;

CODE_0A8084:         sub   r0           ;
CODE_0A8085:         bmi CODE_0A8081    ;
CODE_0A8087:         ldb   (r1)         ;
CODE_0A8089:         cmp   r5           ;
CODE_0A808B:         beq CODE_0A8085    ;
CODE_0A808D:         dec   r1           ;
CODE_0A808E:         inc   r1           ;
CODE_0A808F:         with r1            ;
CODE_0A8090:         add   r12          ;
CODE_0A8091:         stb   (r1)         ;
CODE_0A8093:         move  r0,r4        ;
CODE_0A8095:         ibt   r12,#0000    ;
CODE_0A8097:         ibt   r4,#0001     ;
CODE_0A8099:         bra CODE_0A80AC    ;

CODE_0A809B:         dec   r10          ;

CODE_0A809C:         dec   r10          ;
CODE_0A809D:         bne CODE_0A80A5    ;
CODE_0A809F:         lsr                ;
CODE_0A80A0:         link  #04          ;
CODE_0A80A1:         iwt   r15,#81B3    ;
CODE_0A80A4:         getb               ;
CODE_0A80A5:         bcc CODE_0A80A9    ;
CODE_0A80A7:         with r12           ;
CODE_0A80A8:         or    r4           ;
CODE_0A80A9:         with r4            ;
CODE_0A80AA:         add   r4           ;
CODE_0A80AB:         dec   r10          ;
CODE_0A80AC:         bne CODE_0A80B4    ;
CODE_0A80AE:         lsr                ;
CODE_0A80AF:         link  #04          ;
CODE_0A80B0:         iwt   r15,#81B3    ;
CODE_0A80B3:         getb               ;
CODE_0A80B4:         bcs CODE_0A809C    ;
CODE_0A80B6:         with r12           ;
CODE_0A80B7:         or    r4           ;
CODE_0A80B8:         moves r9,r9        ;
CODE_0A80BA:         bpl CODE_0A8128    ;
CODE_0A80BC:         dec   r10          ;
CODE_0A80BD:         bne CODE_0A80C5    ;
CODE_0A80BF:         lsr                ;
CODE_0A80C0:         link  #04          ;
CODE_0A80C1:         iwt   r15,#81B3    ;
CODE_0A80C4:         getb               ;
CODE_0A80C5:         bcs CODE_0A805B    ;
CODE_0A80C7:         dec   r10          ;
CODE_0A80C8:         bne CODE_0A80D0    ;
CODE_0A80CA:         lsr                ;
CODE_0A80CB:         link  #04          ;
CODE_0A80CC:         iwt   r15,#81B3    ;
CODE_0A80CF:         getb               ;
CODE_0A80D0:         bcs CODE_0A8127    ;
CODE_0A80D2:         move  r4,r0        ;
CODE_0A80D4:         move  r13,r15      ;
CODE_0A80D6:         to r5              ;
CODE_0A80D7:         ldb   (r1)         ;
CODE_0A80D9:         dec   r1           ;
CODE_0A80DA:         bmi CODE_0A80EB    ;
CODE_0A80DC:         ldb   (r1)         ;
CODE_0A80DE:         cmp   r5           ;
CODE_0A80E0:         beq CODE_0A80DA    ;
CODE_0A80E2:         dec   r1           ;
CODE_0A80E3:         loop               ;
CODE_0A80E4:         inc   r1           ;
CODE_0A80E5:         move  r0,r4        ;
CODE_0A80E7:         bra CODE_0A8096    ;

CODE_0A80E9:         ibt   r12,#0014    ;
CODE_0A80EB:         inc   r1           ;
CODE_0A80EC:         iwt   r12,#0080    ;
CODE_0A80EF:         move  r13,r15      ;
CODE_0A80F1:         ldb   (r1)         ;
CODE_0A80F3:         color              ;
CODE_0A80F4:         loop               ;
CODE_0A80F5:         plot               ;
CODE_0A80F6:         inc   r2           ;
CODE_0A80F7:         from r2            ;
CODE_0A80F8:         cmp   r3           ;
CODE_0A80FA:         bcc CODE_0A8114    ;
CODE_0A80FC:         dec   r1           ;
CODE_0A80FD:         rpix               ;
CODE_0A80FF:         stop               ;
CODE_0A8100:         nop                ;

CODE_0A8101:         to r5              ;
CODE_0A8102:         swap               ;
CODE_0A8103:         with r5            ;
CODE_0A8104:         and   #0F          ;
CODE_0A8106:         move  r13,r15      ;
CODE_0A8108:         from r5            ;
CODE_0A8109:         stb   (r1)         ;
CODE_0A810B:         loop               ;
CODE_0A810C:         dec   r1           ;
CODE_0A810D:         bpl CODE_0A8096    ;
CODE_0A810F:         ibt   r12,#0000    ;
CODE_0A8111:         bra CODE_0A80EA    ;

CODE_0A8113:         move  r0,r4        ;
CODE_0A8116:         with r9            ;
CODE_0A8117:         rol                ;
CODE_0A8118:         dec   r10          ;
CODE_0A8119:         bne CODE_0A8121    ;
CODE_0A811B:         lsr                ;
CODE_0A811C:         link  #04          ;
CODE_0A811D:         iwt   r15,#81B3    ;
CODE_0A8120:         getb               ;
CODE_0A8121:         with r9            ;
CODE_0A8122:         ror                ;
CODE_0A8123:         iwt   r15,#8096    ;
CODE_0A8126:         ibt   r12,#FFEA    ;
CODE_0A8128:         bne CODE_0A8130    ;
CODE_0A812A:         lsr                ;
CODE_0A812B:         link  #04          ;
CODE_0A812C:         iwt   r15,#81B3    ;
CODE_0A812F:         getb               ;
CODE_0A8130:         bcs CODE_0A814C    ;
CODE_0A8132:         dec   r10          ;
CODE_0A8133:         bne CODE_0A813A    ;
CODE_0A8135:         lsr                ;
CODE_0A8136:         link  #03          ;
CODE_0A8137:         bra CODE_0A81B3    ;

CODE_0A8139:         getb               ;

CODE_0A813A:         bcs CODE_0A8165    ;
CODE_0A813C:         dec   r10          ;
CODE_0A813D:         bne CODE_0A8144    ;
CODE_0A813F:         lsr                ;
CODE_0A8140:         link  #03          ;
CODE_0A8141:         bra CODE_0A81B3    ;

CODE_0A8143:         getb               ;

CODE_0A8144:         bcs CODE_0A8101    ;
CODE_0A8146:         from r6            ;
CODE_0A8147:         from  r6           ;
CODE_0A8147:         to r5              ;
CODE_0A8148:         to    r5           ;
CODE_0A8148:         alt2               ;
CODE_0A8149:         bra CODE_0A8106    ;

CODE_0A814B:         and   r15          ;

CODE_0A814C:         bne CODE_0A8153    ;
CODE_0A814E:         lsr                ;
CODE_0A814F:         link  #03          ;
CODE_0A8150:         bra CODE_0A81B3    ;

CODE_0A8152:         getb               ;

CODE_0A8153:         bcs CODE_0A8174    ;
CODE_0A8155:         dec   r10          ;
CODE_0A8156:         bne CODE_0A815D    ;
CODE_0A8158:         lsr                ;
CODE_0A8159:         link  #03          ;
CODE_0A815A:         bra CODE_0A81B3    ;

CODE_0A815C:         getb               ;

CODE_0A815D:         bcs CODE_0A8101    ;
CODE_0A815F:         from r8            ;
CODE_0A8160:         from  r8           ;
CODE_0A8160:         to r5              ;
CODE_0A8161:         to    r5           ;
CODE_0A8161:         alt2               ;
CODE_0A8162:         bra CODE_0A8106    ;

CODE_0A8164:         and   r15          ;

CODE_0A8165:         bne CODE_0A816C    ;
CODE_0A8167:         lsr                ;
CODE_0A8168:         link  #03          ;
CODE_0A8169:         bra CODE_0A81B3    ;

CODE_0A816B:         getb               ;

CODE_0A816C:         bcs CODE_0A8101    ;
CODE_0A816E:         from r7            ;
CODE_0A816F:         from  r7           ;
CODE_0A816F:         to r5              ;
CODE_0A8170:         to    r5           ;
CODE_0A8170:         alt2               ;
CODE_0A8171:         bra CODE_0A8106    ;

CODE_0A8173:         and   r15          ;

CODE_0A8174:         bne CODE_0A817B    ;
CODE_0A8176:         lsr                ;
CODE_0A8177:         link  #03          ;
CODE_0A8178:         bra CODE_0A81B3    ;

CODE_0A817A:         getb               ;
CODE_0A817B:         bcs CODE_0A8185    ;
CODE_0A817D:         from r9            ;
CODE_0A817E:         to r5              ;
CODE_0A817F:         and   #0F          ;
CODE_0A8181:         iwt   r15,#8107    ;
CODE_0A8184:         with r15           ;
CODE_0A8185:         ibt   r5,#0000     ;
CODE_0A8187:         dec   r10          ;
CODE_0A8188:         bne CODE_0A818F    ;
CODE_0A818A:         lsr                ;
CODE_0A818B:         link  #03          ;
CODE_0A818C:         bra CODE_0A81B3    ;

CODE_0A818E:         getb               ;

CODE_0A818F:         with r5            ;
CODE_0A8190:         rol                ;
CODE_0A8191:         dec   r10          ;
CODE_0A8192:         bne CODE_0A8199    ;
CODE_0A8194:         lsr                ;
CODE_0A8195:         link  #03          ;
CODE_0A8196:         bra CODE_0A81B3    ;

CODE_0A8198:         getb               ;

CODE_0A8199:         with r5            ;
CODE_0A819A:         rol                ;
CODE_0A819B:         dec   r10          ;
CODE_0A819C:         bne CODE_0A81A3    ;
CODE_0A819E:         lsr                ;
CODE_0A819F:         link  #03          ;
CODE_0A81A0:         bra CODE_0A81B3    ;

CODE_0A81A2:         getb               ;

CODE_0A81A3:         with r5            ;
CODE_0A81A4:         rol                ;
CODE_0A81A5:         dec   r10          ;
CODE_0A81A6:         bne CODE_0A81AD    ;
CODE_0A81A8:         lsr                ;
CODE_0A81A9:         link  #03          ;
CODE_0A81AA:         bra CODE_0A81B3    ;

CODE_0A81AC:         getb               ;

CODE_0A81AD:         with r5            ;
CODE_0A81AE:         rol                ;
CODE_0A81AF:         iwt   r15,#8107    ;
CODE_0A81B2:         with r15           ;
CODE_0A81B3:         inc   r14          ;
CODE_0A81B4:         bne CODE_0A81C5    ;
CODE_0A81B6:         ibt   r10,#0008    ;
CODE_0A81B8:         lm    r10,(0080)   ;
CODE_0A81BC:         inc   r10          ;
CODE_0A81BD:         from r10           ;
CODE_0A81BE:         sbk                ;
CODE_0A81BF:         from r10           ;
CODE_0A81C0:         romb               ;
CODE_0A81C2:         ibt   r14,#0000    ;
CODE_0A81C4:         ibt   r10,#0008    ;
CODE_0A81C6:         move  r15,r11      ;
CODE_0A81C8:         lsr                ;

CODE_0A81C9:         with r2            ;
CODE_0A81CA:         sub   #08          ;
CODE_0A81CC:         with r3            ;
CODE_0A81CD:         sub   #08          ;
CODE_0A81CF:         ibt   r0,#000A     ;
CODE_0A81D1:         romb               ;
CODE_0A81D3:         iwt   r14,#860E    ;
CODE_0A81D6:         getb               ;
CODE_0A81D7:         sms   (0020),r0    ;
CODE_0A81DA:         to r10             ;
CODE_0A81DB:         swap               ;
CODE_0A81DC:         iwt   r9,#00D1     ;
CODE_0A81DF:         lms   r0,(0002)    ;
CODE_0A81E2:         to r1              ;
CODE_0A81E3:         sub   #08          ;
CODE_0A81E5:         iwt   r0,#2200     ;
CODE_0A81E8:         lms   r8,(0006)    ;
CODE_0A81EB:         add   r8           ;
CODE_0A81EC:         add   r8           ;
CODE_0A81ED:         to r8              ;
CODE_0A81EE:         ldw   (r0)         ;
CODE_0A81EF:         sms   (0022),r8    ;
CODE_0A81F2:         cache              ;
CODE_0A81F3:         lms   r0,(0000)    ;
CODE_0A81F6:         sms   (0024),r0    ;
CODE_0A81F9:         ibt   r11,#0060    ;
CODE_0A81FB:         add   r11          ;
CODE_0A81FC:         iwt   r11,#01C0    ;
CODE_0A81FF:         sub   r11          ;
CODE_0A8200:         bcc CODE_0A820E    ;
CODE_0A8202:         nop                ;
CODE_0A8203:         ibt   r0,#FF80     ;
CODE_0A8205:         sms   (0024),r0    ;
CODE_0A8208:         iwt   r15,#82FD    ;
CODE_0A820B:         lms   r0,(0020)    ;
CODE_0A820E:         iwt   r11,#3514    ;
CODE_0A8211:         iwt   r13,#00D0    ;
CODE_0A8214:         from r13           ;
CODE_0A8215:         sub   r1           ;
CODE_0A8216:         bpl CODE_0A8223    ;
CODE_0A8218:         to r6              ;
CODE_0A8219:         not                ;
CODE_0A821A:         inc   r6           ;
CODE_0A821B:         from r8            ;
CODE_0A821C:         lmult              ;
CODE_0A821E:         with r10           ;
CODE_0A821F:         sub   r4           ;
CODE_0A8220:         bra CODE_0A8242    ;

CODE_0A8222:         inc   r14          ;

CODE_0A8223:         move  r12,r0       ;
CODE_0A8225:         from r13           ;
CODE_0A8226:         sub   r12          ;
CODE_0A8227:         bpl CODE_0A822D    ;
CODE_0A8229:         inc   r12          ;
CODE_0A822A:         move  r12,r13      ;
CODE_0A822C:         inc   r12          ;
CODE_0A822D:         with r9            ;
CODE_0A822E:         sub   r12          ;
CODE_0A822F:         iwt   r0,#FF26     ;
CODE_0A8232:         move  r13,r15      ;
CODE_0A8234:         stw   (r11)        ;
CODE_0A8235:         dec   r11          ;
CODE_0A8236:         dec   r11          ;
CODE_0A8237:         loop               ;
CODE_0A8238:         inc   r0           ;
CODE_0A8239:         bne CODE_0A8242    ;
CODE_0A823B:         inc   r14          ;
CODE_0A823C:         iwt   r15,#82FD    ;
CODE_0A823F:         lms   r0,(0020)    ;
CODE_0A8242:         lms   r6,(0004)    ;
CODE_0A8245:         move  r7,r14       ;
CODE_0A8247:         from r9            ;
CODE_0A8248:         to r12             ;
CODE_0A8249:         sub   r2           ;
CODE_0A824A:         inc   r12          ;
CODE_0A824B:         move  r13,r15      ;
CODE_0A824D:         with r10           ;
CODE_0A824E:         sub   r8           ;
CODE_0A824F:         bmi CODE_0A8270    ;
CODE_0A8251:         from r10           ;
CODE_0A8252:         hib                ;
CODE_0A8253:         to r14             ;
CODE_0A8254:         add   r7           ;
CODE_0A8255:         getb               ;
CODE_0A8256:         swap               ;
CODE_0A8257:         fmult              ;
CODE_0A8258:         inc   r0           ;
CODE_0A8259:         lsr                ;
CODE_0A825A:         move  r5,r0        ;
CODE_0A825C:         sub   r9           ;
CODE_0A825D:         sub   #08          ;
CODE_0A825F:         stw   (r11)        ;
CODE_0A8260:         dec   r11          ;
CODE_0A8261:         dec   r11          ;
CODE_0A8262:         loop               ;
CODE_0A8263:         dec   r9           ;
CODE_0A8264:         bpl CODE_0A826D    ;
CODE_0A8266:         nop                ;
CODE_0A8267:         iwt   r15,#82FD    ;
CODE_0A826A:         lms   r0,(0020)    ;
CODE_0A826D:         bra CODE_0A8289    ;

CODE_0A826F:         from r2            ;
CODE_0A8270:         from r9            ;
CODE_0A8271:         not                ;
CODE_0A8272:         sub   #08          ;
CODE_0A8274:         with r9            ;
CODE_0A8275:         sub   r12          ;
CODE_0A8276:         move  r13,r15      ;
CODE_0A8278:         stw   (r11)        ;
CODE_0A8279:         dec   r11          ;
CODE_0A827A:         dec   r11          ;
CODE_0A827B:         loop               ;
CODE_0A827C:         inc   r0           ;
CODE_0A827D:         bne CODE_0A8286    ;
CODE_0A827F:         nop                ;
CODE_0A8280:         iwt   r15,#82FD    ;
CODE_0A8283:         lms   r0,(0020)    ;
CODE_0A8286:         ibt   r5,#0000     ;
CODE_0A8288:         from r2            ;
CODE_0A8289:         sub   r3           ;
CODE_0A828A:         move  r13,r0       ;
CODE_0A828C:         bpl CODE_0A8291    ;
CODE_0A828E:         nop                ;
CODE_0A828F:         not                ;
CODE_0A8290:         inc   r0           ;
CODE_0A8291:         move  r12,r0       ;
CODE_0A8293:         iwt   r14,#866F    ;
CODE_0A8296:         ibt   r0,#0022     ;
CODE_0A8298:         cmp   r12          ;
CODE_0A829A:         bcs CODE_0A829F    ;
CODE_0A829C:         move  r12,r0       ;
CODE_0A829F:         sub   r9           ;
CODE_0A82A0:         bcc CODE_0A82A6    ;
CODE_0A82A2:         inc   r12          ;
CODE_0A82A3:         move  r12,r9       ;
CODE_0A82A5:         inc   r12          ;
CODE_0A82A6:         with r14           ;
CODE_0A82A7:         add   r12          ;
CODE_0A82A8:         to r4              ;
CODE_0A82A9:         getb               ;
CODE_0A82AA:         with r5            ;
CODE_0A82AB:         sub   r4           ;
CODE_0A82AC:         ibt   r10,#FFFF    ;
CODE_0A82AE:         moves r13,r13      ;
CODE_0A82B0:         bpl CODE_0A82BF    ;
CODE_0A82B2:         dec   r14          ;
CODE_0A82B3:         inc   r14          ;
CODE_0A82B4:         ibt   r0,#0023     ;
CODE_0A82B6:         to r12             ;
CODE_0A82B7:         sub   r12          ;
CODE_0A82B8:         bne CODE_0A82DE    ;
CODE_0A82BA:         inc   r14          ;
CODE_0A82BB:         dec   r14          ;
CODE_0A82BC:         bra CODE_0A82DE    ;

CODE_0A82BE:         inc   r12          ;

CODE_0A82BF:         move  r13,r15      ;
CODE_0A82C1:         getb               ;
CODE_0A82C2:         dec   r14          ;
CODE_0A82C3:         add   r5           ;
CODE_0A82C4:         bpl CODE_0A82C9    ;
CODE_0A82C6:         nop                ;
CODE_0A82C7:         move  r0,r10       ;
CODE_0A82C9:         sub   r9           ;
CODE_0A82CA:         sub   #08          ;
CODE_0A82CC:         stw   (r11)        ;
CODE_0A82CD:         dec   r11          ;
CODE_0A82CE:         dec   r11          ;
CODE_0A82CF:         loop               ;
CODE_0A82D0:         dec   r9           ;
CODE_0A82D1:         bmi CODE_0A82FC    ;
CODE_0A82D3:         inc   r14          ;
CODE_0A82D4:         ibt   r12,#0023    ;
CODE_0A82D6:         from r12           ;
CODE_0A82D7:         sub   r9           ;
CODE_0A82D8:         bcc CODE_0A82DE    ;
CODE_0A82DA:         inc   r12          ;
CODE_0A82DB:         move  r12,r9       ;
CODE_0A82DD:         inc   r12          ;
CODE_0A82DE:         move  r13,r15      ;
CODE_0A82E0:         getb               ;
CODE_0A82E1:         inc   r14          ;
CODE_0A82E2:         add   r5           ;
CODE_0A82E3:         bpl CODE_0A82E8    ;
CODE_0A82E5:         nop                ;
CODE_0A82E6:         move  r0,r10       ;
CODE_0A82E8:         sub   r9           ;
CODE_0A82E9:         sub   #08          ;
CODE_0A82EB:         stw   (r11)        ;
CODE_0A82EC:         dec   r11          ;
CODE_0A82ED:         dec   r11          ;
CODE_0A82EE:         loop               ;
CODE_0A82EF:         dec   r9           ;
CODE_0A82F0:         bmi CODE_0A82FC    ;
CODE_0A82F2:         inc   r9           ;
CODE_0A82F3:         move  r12,r9       ;
CODE_0A82F5:         move  r13,r15      ;
CODE_0A82F7:         inc   r0           ;
CODE_0A82F8:         stw   (r11)        ;
CODE_0A82F9:         dec   r11          ;
CODE_0A82FA:         loop               ;
CODE_0A82FB:         dec   r11          ;
CODE_0A82FC:         lms   r0,(0020)    ;
CODE_0A82FF:         swap               ;
CODE_0A8300:         lms   r6,(0006)    ;
CODE_0A8303:         to r12             ;
CODE_0A8304:         fmult              ;
CODE_0A8305:         iwt   r7,#3516     ;
CODE_0A8308:         lms   r0,(0002)    ;
CODE_0A830B:         sub   #08          ;
CODE_0A830D:         move  r9,r0        ;
CODE_0A830F:         add   r7           ;
CODE_0A8310:         to r1              ;
CODE_0A8311:         add   r9           ;
CODE_0A8312:         lms   r0,(0008)    ;
CODE_0A8315:         to r2              ;
CODE_0A8316:         swap               ;
CODE_0A8317:         lms   r0,(000C)    ;
CODE_0A831A:         lms   r6,(0022)    ;
CODE_0A831D:         lmult              ;
CODE_0A831F:         lob                ;
CODE_0A8320:         swap               ;
CODE_0A8321:         with r4            ;
CODE_0A8322:         hib                ;
CODE_0A8323:         to r3              ;
CODE_0A8324:         or    r4           ;
CODE_0A8325:         lms   r0,(000A)    ;
CODE_0A8328:         lms   r6,(0004)    ;
CODE_0A832B:         lmult              ;
CODE_0A832D:         move  r6,r4        ;
CODE_0A832F:         iwt   r11,#AC18    ;
CODE_0A8332:         iwt   r0,#0080     ;
CODE_0A8335:         lms   r5,(0024)    ;
CODE_0A8338:         to r5              ;
CODE_0A8339:         sub   r5           ;
CODE_0A833A:         move  r8,r5        ;
CODE_0A833C:         ibt   r0,#0008     ;
CODE_0A833E:         romb               ;
CODE_0A8340:         move  r10,r9       ;
CODE_0A8342:         iwt   r4,#00D2     ;
CODE_0A8345:         move  r13,r15      ;
CODE_0A8347:         moves r0,r10       ;
CODE_0A8349:         bmi CODE_0A8360    ;
CODE_0A834B:         sub   r4           ;
CODE_0A834C:         bcs CODE_0A835A    ;
CODE_0A834E:         from r2            ;
CODE_0A834F:         hib                ;
CODE_0A8350:         add   r0           ;
CODE_0A8351:         to r14             ;
CODE_0A8352:         add   r11          ;
CODE_0A8353:         getb               ;
CODE_0A8354:         inc   r14          ;
CODE_0A8355:         getbh              ;
CODE_0A8357:         fmult              ;
CODE_0A8358:         add   r5           ;
CODE_0A8359:         stw   (r1)         ;
CODE_0A835A:         with r2            ;
CODE_0A835B:         add   r3           ;
CODE_0A835C:         dec   r1           ;
CODE_0A835D:         dec   r1           ;
CODE_0A835E:         loop               ;
CODE_0A835F:         dec   r10          ;
CODE_0A8360:         lms   r0,(000E)    ;
CODE_0A8363:         swap               ;
CODE_0A8364:         lms   r6,(0004)    ;
CODE_0A8367:         fmult              ;
CODE_0A8368:         to r2              ;
CODE_0A8369:         adc   #00          ;
CODE_0A836B:         lms   r0,(0010)    ;
CODE_0A836E:         swap               ;
CODE_0A836F:         lms   r6,(0006)    ;
CODE_0A8372:         fmult              ;
CODE_0A8373:         adc   #00          ;
CODE_0A8375:         sms   (0010),r0    ;
CODE_0A8378:         add   r9           ;
CODE_0A8379:         move  r1,r0        ;
CODE_0A837B:         sub   r4           ;
CODE_0A837C:         bcs CODE_0A8386    ;
CODE_0A837E:         sub   r0           ;
CODE_0A837F:         from r7            ;
CODE_0A8380:         add   r1           ;
CODE_0A8381:         add   r1           ;
CODE_0A8382:         ldw   (r0)         ;
CODE_0A8383:         sub   r8           ;
CODE_0A8384:         not                ;
CODE_0A8385:         inc   r0           ;
CODE_0A8386:         add   r2           ;
CODE_0A8387:         sms   (000E),r0    ;
CODE_0A838A:         iwt   r0,#85E4     ;
CODE_0A838D:         sms   (0020),r0    ;

CODE_0A8390:         link  #04          ;
CODE_0A8391:         iwt   r15,#84F2    ;
CODE_0A8394:         cache              ;
CODE_0A8395:         iwt   r1,#0F00     ;
CODE_0A8398:         iwt   r2,#1D38     ;
CODE_0A839B:         iwt   r3,#1CD6     ;
CODE_0A839E:         iwt   r0,#1D37     ;
CODE_0A83A1:         lms   r4,(0012)    ;
CODE_0A83A4:         add   r4           ;
CODE_0A83A5:         ldb   (r0)         ;
CODE_0A83A7:         add   r0           ;
CODE_0A83A8:         to r4              ;
CODE_0A83A9:         add   r0           ;
CODE_0A83AA:         lm    r10,(0094)   ;
CODE_0A83AE:         ibt   r12,#0018    ;
CODE_0A83B0:         lm    r0,(009C)    ;
CODE_0A83B4:         to r11             ;
CODE_0A83B5:         add   #08          ;
CODE_0A83B7:         cache              ;
CODE_0A83B8:         iwt   r13,#83BC    ;
CODE_0A83BB:         with r4            ;
CODE_0A83BC:         sub   #04          ;
CODE_0A83BE:         bpl CODE_0A83C4    ;
CODE_0A83C0:         from r1            ;
CODE_0A83C1:         ibt   r4,#005C     ;
CODE_0A83C3:         from r1            ;
CODE_0A83C4:         add   r4           ;
CODE_0A83C5:         ldb   (r0)         ;
CODE_0A83C7:         sub   #0E          ;
CODE_0A83C9:         bcc CODE_0A8400    ;
CODE_0A83CB:         from r2            ;
CODE_0A83CC:         add   r4           ;
CODE_0A83CD:         ldw   (r0)         ;
CODE_0A83CE:         sub   #00          ;
CODE_0A83D0:         beq CODE_0A8400    ;
CODE_0A83D2:         from r3            ;
CODE_0A83D3:         add   r4           ;
CODE_0A83D4:         to r14             ;
CODE_0A83D5:         ldw   (r0)         ;
CODE_0A83D6:         with r14           ;
CODE_0A83D7:         sub   r10          ;
CODE_0A83D8:         inc   r0           ;
CODE_0A83D9:         inc   r0           ;
CODE_0A83DA:         ldw   (r0)         ;
CODE_0A83DB:         sub   r11          ;
CODE_0A83DC:         sub   r5           ;
CODE_0A83DD:         bcs CODE_0A8400    ;
CODE_0A83DF:         add   r5           ;
CODE_0A83E0:         move  r9,r0        ;
CODE_0A83E2:         add   r0           ;
CODE_0A83E3:         add   r6           ;
CODE_0A83E4:         ldw   (r0)         ;
CODE_0A83E5:         add   r9           ;
CODE_0A83E6:         add   #09          ;
CODE_0A83E8:         to r8              ;
CODE_0A83E9:         lob                ;
CODE_0A83EA:         from r7            ;
CODE_0A83EB:         add   r9           ;
CODE_0A83EC:         add   r9           ;
CODE_0A83ED:         to r9              ;
CODE_0A83EE:         ldw   (r0)         ;
CODE_0A83EF:         iwt   r0,#0080     ;
CODE_0A83F2:         sub   r9           ;
CODE_0A83F3:         sub   r14          ;
CODE_0A83F4:         move  r14,r0       ;
CODE_0A83F6:         bpl CODE_0A83FB    ;
CODE_0A83F8:         nop                ;
CODE_0A83F9:         not                ;
CODE_0A83FA:         inc   r0           ;
CODE_0A83FB:         add   r0           ;
CODE_0A83FC:         sub   r8           ;
CODE_0A83FD:         bcc CODE_0A8412    ;
CODE_0A83FF:         nop                ;
CODE_0A8400:         loop               ;
CODE_0A8401:         with r4            ;
CODE_0A8402:         lms   r0,(0012)    ;
CODE_0A8405:         iwt   r1,#1D36     ;
CODE_0A8408:         to r1              ;
CODE_0A8409:         add   r1           ;
CODE_0A840A:         sub   r0           ;
CODE_0A840B:         stb   (r1)         ;
CODE_0A840D:         bra CODE_0A8431    ;

CODE_0A840F:         lms   r0,(0000)    ;
CODE_0A8412:         lms   r1,(0012)    ;
CODE_0A8415:         iwt   r0,#1C76     ;
CODE_0A8418:         add   r1           ;
CODE_0A8419:         with r14           ;
CODE_0A841A:         not                ;
CODE_0A841B:         inc   r14          ;
CODE_0A841C:         from r14           ;
CODE_0A841D:         stw   (r0)         ;
CODE_0A841E:         iwt   r0,#1D37     ;
CODE_0A8421:         to r2              ;
CODE_0A8422:         add   r1           ;
CODE_0A8423:         from r4            ;
CODE_0A8424:         lsr                ;
CODE_0A8425:         lsr                ;
CODE_0A8426:         stb   (r2)         ;
CODE_0A8428:         iwt   r0,#1D36     ;
CODE_0A842B:         add   r1           ;
CODE_0A842C:         inc   r4           ;
CODE_0A842D:         from r4            ;
CODE_0A842E:         stb   (r0)         ;
CODE_0A8430:         lms   r0,(0000)    ;
CODE_0A8433:         lm    r10,(0094)   ;
CODE_0A8437:         to r10             ;
CODE_0A8438:         add   r10          ;
CODE_0A8439:         lms   r9,(0012)    ;
CODE_0A843C:         iwt   r0,#1720     ;
CODE_0A843F:         add   r9           ;
CODE_0A8440:         ldw   (r0)         ;
CODE_0A8441:         lms   r9,(0002)    ;
CODE_0A8444:         add   r9           ;
CODE_0A8445:         lm    r9,(009C)    ;
CODE_0A8449:         to r9              ;
CODE_0A844A:         add   r9           ;
CODE_0A844B:         lms   r12,(0004)   ;
CODE_0A844E:         lms   r13,(0006)   ;
CODE_0A8451:         ibt   r0,#000A     ;
CODE_0A8453:         romb               ;
CODE_0A8455:         lms   r14,(0020)   ;
CODE_0A8458:         ibt   r2,#0000     ;
CODE_0A845A:         link  #04          ;
CODE_0A845B:         iwt   r15,#84BB    ;
CODE_0A845E:         getb               ;
CODE_0A845F:         and   #02          ;
CODE_0A8461:         beq CODE_0A8465    ;
CODE_0A8463:         nop                ;
CODE_0A8464:         inc   r2           ;
CODE_0A8465:         with r2            ;
CODE_0A8466:         add   r2           ;
CODE_0A8467:         link  #04          ;
CODE_0A8468:         iwt   r15,#84BB    ;
CODE_0A846B:         getb               ;
CODE_0A846C:         and   #02          ;
CODE_0A846E:         beq CODE_0A8472    ;
CODE_0A8470:         nop                ;
CODE_0A8471:         inc   r2           ;
CODE_0A8472:         with r2            ;
CODE_0A8473:         add   r2           ;
CODE_0A8474:         link  #04          ;
CODE_0A8475:         iwt   r15,#84BB    ;
CODE_0A8478:         getb               ;
CODE_0A8479:         and   #02          ;
CODE_0A847B:         beq CODE_0A847F    ;
CODE_0A847D:         nop                ;
CODE_0A847E:         inc   r2           ;
CODE_0A847F:         with r2            ;
CODE_0A8480:         add   r2           ;
CODE_0A8481:         link  #04          ;
CODE_0A8482:         iwt   r15,#84BB    ;
CODE_0A8485:         getb               ;
CODE_0A8486:         and   #02          ;
CODE_0A8488:         beq CODE_0A848C    ;
CODE_0A848A:         nop                ;
CODE_0A848B:         inc   r2           ;
CODE_0A848C:         with r2            ;
CODE_0A848D:         add   r2           ;
CODE_0A848E:         link  #04          ;
CODE_0A848F:         iwt   r15,#84BB    ;
CODE_0A8492:         getb               ;
CODE_0A8493:         and   #02          ;
CODE_0A8495:         beq CODE_0A8499    ;
CODE_0A8497:         nop                ;
CODE_0A8498:         inc   r2           ;
CODE_0A8499:         lms   r0,(0002)    ;
CODE_0A849C:         sms   (0020),r0    ;
CODE_0A849F:         with r2            ;
CODE_0A84A0:         add   r2           ;
CODE_0A84A1:         iwt   r13,#0100    ;
CODE_0A84A4:         link  #04          ;
CODE_0A84A5:         iwt   r15,#84BB    ;
CODE_0A84A8:         getb               ;
CODE_0A84A9:         and   #03          ;
CODE_0A84AB:         beq CODE_0A84AF    ;
CODE_0A84AD:         nop                ;
CODE_0A84AE:         inc   r2           ;
CODE_0A84AF:         iwt   r0,#1860     ;
CODE_0A84B2:         lms   r1,(0012)    ;
CODE_0A84B5:         add   r1           ;
CODE_0A84B6:         from r2            ;
CODE_0A84B7:         stw   (r0)         ;
CODE_0A84B8:         sub   r0           ;
CODE_0A84B9:         stop               ;
CODE_0A84BA:         nop                ;

CODE_0A84BB:         inc   r14          ;
CODE_0A84BC:         swap               ;
CODE_0A84BD:         move  r6,r12       ;
CODE_0A84BF:         fmult              ;
CODE_0A84C0:         to r8              ;
CODE_0A84C1:         add   r10          ;
CODE_0A84C2:         getb               ;
CODE_0A84C3:         inc   r14          ;
CODE_0A84C4:         swap               ;
CODE_0A84C5:         move  r6,r13       ;
CODE_0A84C7:         fmult              ;
CODE_0A84C8:         add   r9           ;
CODE_0A84C9:         move  r7,r0        ;
CODE_0A84CB:         lm    r6,(009C)    ;
CODE_0A84CF:         sub   r6           ;
CODE_0A84D0:         sub   #08          ;
CODE_0A84D2:         iwt   r6,#00D2     ;
CODE_0A84D5:         cmp   r6           ;
CODE_0A84D7:         bcs CODE_0A84EC    ;
CODE_0A84D9:         from r8            ;
CODE_0A84DA:         iwt   r6,#3516     ;
CODE_0A84DD:         add   r0           ;
CODE_0A84DE:         add   r6           ;
CODE_0A84DF:         to r6              ;
CODE_0A84E0:         ldw   (r0)         ;
CODE_0A84E1:         iwt   r0,#0080     ;
CODE_0A84E4:         sub   r6           ;
CODE_0A84E5:         lms   r6,(0024)    ;
CODE_0A84E8:         sub   r6           ;
CODE_0A84E9:         add   r8           ;
CODE_0A84EA:         move  r8,r0        ;
CODE_0A84EC:         move  r0,r7        ;
CODE_0A84EE:         iwt   r15,#D096    ;
CODE_0A84F1:         to r7              ;
CODE_0A84F2:         iwt   r0,#00FF     ;
CODE_0A84F5:         sms   (0060),r11   ;
CODE_0A84F8:         move  r11,r0       ;
CODE_0A84FA:         ibt   r0,#000A     ;
CODE_0A84FC:         romb               ;
CODE_0A84FE:         iwt   r14,#85F0    ;
CODE_0A8501:         lms   r0,(0018)    ;
CODE_0A8504:         sub   #00          ;
CODE_0A8506:         beq CODE_0A850B    ;
CODE_0A8508:         with r14           ;
CODE_0A8509:         add   #0A          ;
CODE_0A850B:         lms   r1,(0014)    ;
CODE_0A850E:         lms   r0,(0016)    ;
CODE_0A8511:         to r2              ;
CODE_0A8512:         sub   #08          ;
CODE_0A8514:         iwt   r5,#00D2     ;
CODE_0A8517:         iwt   r6,#3372     ;
CODE_0A851A:         iwt   r7,#3516     ;
CODE_0A851D:         iwt   r3,#0080     ;
CODE_0A8520:         ibt   r10,#0000    ;
CODE_0A8522:         ibt   r12,#0005    ;
CODE_0A8524:         iwt   r13,#8528    ;
CODE_0A8527:         with r10           ;
CODE_0A8528:         add   r10          ;
CODE_0A8529:         getbs              ;
CODE_0A852B:         inc   r14          ;
CODE_0A852C:         to r4              ;
CODE_0A852D:         add   r1           ;
CODE_0A852E:         getbs              ;
CODE_0A8530:         inc   r14          ;
CODE_0A8531:         add   r2           ;
CODE_0A8532:         sub   r5           ;
CODE_0A8533:         bcs CODE_0A8552    ;
CODE_0A8535:         add   r5           ;
CODE_0A8536:         move  r9,r0        ;
CODE_0A8538:         add   r0           ;
CODE_0A8539:         add   r6           ;
CODE_0A853A:         ldw   (r0)         ;
CODE_0A853B:         add   r9           ;
CODE_0A853C:         add   #09          ;
CODE_0A853E:         to r8              ;
CODE_0A853F:         and   r11          ;
CODE_0A8540:         from r7            ;
CODE_0A8541:         add   r9           ;
CODE_0A8542:         add   r9           ;
CODE_0A8543:         ldw   (r0)         ;
CODE_0A8544:         from r3            ;
CODE_0A8545:         sub   r0           ;
CODE_0A8546:         sub   r4           ;
CODE_0A8547:         bpl CODE_0A854C    ;
CODE_0A8549:         nop                ;
CODE_0A854A:         not                ;
CODE_0A854B:         inc   r0           ;
CODE_0A854C:         add   r0           ;
CODE_0A854D:         sub   r8           ;
CODE_0A854E:         bcs CODE_0A8552    ;
CODE_0A8550:         nop                ;
CODE_0A8551:         inc   r10          ;
CODE_0A8552:         loop               ;
CODE_0A8553:         with r10           ;
CODE_0A8554:         sms   (0014),r10   ;
CODE_0A8557:         from r10           ;
CODE_0A8558:         lsr                ;
CODE_0A8559:         bcc CODE_0A85AB    ;
CODE_0A855B:         sub   r0           ;
CODE_0A855C:         move  r1,r0        ;
CODE_0A855E:         dec   r9           ;
CODE_0A855F:         bmi CODE_0A8582    ;
CODE_0A8561:         from r1            ;
CODE_0A8562:         add   #0A          ;
CODE_0A8564:         bmi CODE_0A8582    ;
CODE_0A8566:         from r9            ;
CODE_0A8567:         add   r9           ;
CODE_0A8568:         add   r6           ;
CODE_0A8569:         ldw   (r0)         ;
CODE_0A856A:         add   r9           ;
CODE_0A856B:         add   #09          ;
CODE_0A856D:         to r8              ;
CODE_0A856E:         and   r11          ;
CODE_0A856F:         from r7            ;
CODE_0A8570:         add   r9           ;
CODE_0A8571:         add   r9           ;
CODE_0A8572:         ldw   (r0)         ;
CODE_0A8573:         from r3            ;
CODE_0A8574:         sub   r0           ;
CODE_0A8575:         sub   r4           ;
CODE_0A8576:         move  r2,r0        ;
CODE_0A8578:         bpl CODE_0A857D    ;
CODE_0A857A:         nop                ;
CODE_0A857B:         not                ;
CODE_0A857C:         inc   r0           ;
CODE_0A857D:         add   r0           ;
CODE_0A857E:         sub   r8           ;
CODE_0A857F:         bcc CODE_0A855E    ;
CODE_0A8581:         dec   r1           ;
CODE_0A8582:         sms   (0016),r1    ;
CODE_0A8585:         from r9            ;
CODE_0A8586:         add   #02          ;
CODE_0A8588:         cmp   r5           ;
CODE_0A858A:         bcs CODE_0A8595    ;
CODE_0A858C:         from r8            ;
CODE_0A858D:         from r0            ;
CODE_0A858E:         add   r0           ;
CODE_0A858F:         add   r6           ;
CODE_0A8590:         ldw   (r0)         ;
CODE_0A8591:         add   r9           ;
CODE_0A8592:         add   #09          ;
CODE_0A8594:         and   r11          ;
CODE_0A8595:         sub   r8           ;
CODE_0A8596:         lsr                ;
CODE_0A8597:         ibt   r3,#0004     ;
CODE_0A8599:         cmp   r3           ;
CODE_0A859B:         bcc CODE_0A85A0    ;
CODE_0A859D:         nop                ;
CODE_0A859E:         move  r0,r3        ;
CODE_0A85A0:         moves r2,r2        ;
CODE_0A85A2:         bpl CODE_0A85A7    ;
CODE_0A85A4:         nop                ;
CODE_0A85A5:         add   #05          ;
CODE_0A85A7:         add   r0           ;
CODE_0A85A8:         sms   (0018),r0    ;
CODE_0A85AB:         iwt   r0,#8604     ;
CODE_0A85AE:         sub   r14          ;
CODE_0A85AF:         bcc CODE_0A85DF    ;
CODE_0A85B1:         to r14             ;
CODE_0A85B2:         add   r14          ;
CODE_0A85B3:         lms   r0,(0014)    ;
CODE_0A85B6:         sms   (001A),r0    ;
CODE_0A85B9:         lms   r0,(0016)    ;
CODE_0A85BC:         sms   (001C),r0    ;
CODE_0A85BF:         lms   r0,(0018)    ;
CODE_0A85C2:         sms   (001E),r0    ;
CODE_0A85C5:         lms   r0,(01CC)    ;
CODE_0A85C8:         sub   #00          ;
CODE_0A85CA:         beq CODE_0A85D3    ;
CODE_0A85CC:         sub   r0           ;
CODE_0A85CD:         sms   (0014),r0    ;
CODE_0A85D0:         bra CODE_0A85DF    ;

CODE_0A85D2:         nop                ;

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

CODE_0A8693:         ibt   r0,#000A     ;
CODE_0A8695:         romb               ;
CODE_0A8697:         sms   (0004),r5    ;
CODE_0A869A:         with r4            ;
CODE_0A869B:         sub   #08          ;
CODE_0A869D:         iwt   r5,#00D1     ;
CODE_0A86A0:         iwt   r9,#3514     ;
CODE_0A86A3:         iwt   r7,#36B8     ;
CODE_0A86A6:         cache              ;
CODE_0A86A7:         from r5            ;
CODE_0A86A8:         to r12             ;
CODE_0A86A9:         sub   r4           ;
CODE_0A86AA:         bpl CODE_0A86B5    ;
CODE_0A86AC:         from r12           ;
CODE_0A86AD:         not                ;
CODE_0A86AE:         inc   r0           ;
CODE_0A86AF:         to r5              ;
CODE_0A86B0:         add   r5           ;
CODE_0A86B1:         bra CODE_0A86CE    ;

CODE_0A86B3:         move  r14,r1       ;
CODE_0A86B5:         sub   r5           ;
CODE_0A86B6:         bcc CODE_0A86BD    ;
CODE_0A86B8:         inc   r12          ;
CODE_0A86B9:         iwt   r15,#874A    ;
CODE_0A86BC:         inc   r5           ;
CODE_0A86BD:         with r5            ;
CODE_0A86BE:         sub   r12          ;
CODE_0A86BF:         from r7            ;
CODE_0A86C0:         sub   r12          ;
CODE_0A86C1:         to r7              ;
CODE_0A86C2:         sub   r12          ;
CODE_0A86C3:         iwt   r0,#FF26     ;
CODE_0A86C6:         move  r13,r15      ;
CODE_0A86C8:         stw   (r9)         ;
CODE_0A86C9:         dec   r9           ;
CODE_0A86CA:         dec   r9           ;
CODE_0A86CB:         loop               ;
CODE_0A86CC:         inc   r0           ;
CODE_0A86CD:         move  r14,r1       ;
CODE_0A86CF:         inc   r1           ;
CODE_0A86D0:         iwt   r10,#2200    ;
CODE_0A86D3:         move  r6,r3        ;
CODE_0A86D5:         to r4              ;
CODE_0A86D6:         getb               ;
CODE_0A86D7:         move  r14,r2       ;
CODE_0A86D9:         inc   r2           ;
CODE_0A86DA:         to r8              ;
CODE_0A86DB:         getb               ;
CODE_0A86DC:         from r8            ;
CODE_0A86DD:         sub   r4           ;
CODE_0A86DE:         swap               ;
CODE_0A86DF:         fmult              ;
CODE_0A86E0:         adc   r4           ;
CODE_0A86E2:         moves r12,r0       ;
CODE_0A86E4:         beq CODE_0A8749    ;
CODE_0A86E6:         add   r0           ;
CODE_0A86E7:         add   r10          ;
CODE_0A86E8:         to r6              ;
CODE_0A86E9:         ldw   (r0)         ;
CODE_0A86EA:         from r4            ;
CODE_0A86EB:         swap               ;
CODE_0A86EC:         fmult              ;
CODE_0A86ED:         to r4              ;
CODE_0A86EE:         adc   #00          ;
CODE_0A86F0:         from r8            ;
CODE_0A86F1:         swap               ;
CODE_0A86F2:         fmult              ;
CODE_0A86F3:         to r8              ;
CODE_0A86F4:         adc   #00          ;
CODE_0A86F6:         move  r6,r3        ;
CODE_0A86F8:         ibt   r10,#0000    ;
CODE_0A86FA:         move  r11,r10      ;
CODE_0A86FC:         from r5            ;
CODE_0A86FD:         sub   r12          ;
CODE_0A86FE:         inc   r0           ;
CODE_0A86FF:         bpl CODE_0A8703    ;
CODE_0A8701:         to r12             ;
CODE_0A8702:         add   r12          ;
CODE_0A8703:         move  r13,r15      ;
CODE_0A8705:         iwt   r0,#00B1     ;
CODE_0A8708:         sub   r5           ;
CODE_0A8709:         bmi CODE_0A8741    ;
CODE_0A870B:         from r10           ;
CODE_0A870C:         hib                ;
CODE_0A870D:         add   r0           ;
CODE_0A870E:         to r14             ;
CODE_0A870F:         add   r1           ;
CODE_0A8710:         getbs              ;
CODE_0A8712:         inc   r14          ;
CODE_0A8713:         sms   (0000),r0    ;
CODE_0A8716:         to r3              ;
CODE_0A8717:         getb               ;
CODE_0A8718:         from r11           ;
CODE_0A8719:         hib                ;
CODE_0A871A:         add   r0           ;
CODE_0A871B:         to r14             ;
CODE_0A871C:         add   r2           ;
CODE_0A871D:         getbs              ;
CODE_0A871F:         inc   r14          ;
CODE_0A8720:         sms   (0002),r0    ;
CODE_0A8723:         getb               ;
CODE_0A8724:         sub   r3           ;
CODE_0A8725:         swap               ;
CODE_0A8726:         fmult              ;
CODE_0A8727:         adc   r3           ;
CODE_0A8729:         sub   r5           ;
CODE_0A872A:         sub   #08          ;
CODE_0A872C:         stw   (r9)         ;
CODE_0A872D:         lms   r3,(0000)    ;
CODE_0A8730:         lms   r0,(0002)    ;
CODE_0A8733:         sub   r3           ;
CODE_0A8734:         swap               ;
CODE_0A8735:         fmult              ;
CODE_0A8736:         adc   r3           ;
CODE_0A8738:         lms   r3,(0004)    ;
CODE_0A873B:         add   r3           ;
CODE_0A873C:         stw   (r7)         ;
CODE_0A873D:         dec   r9           ;
CODE_0A873E:         dec   r9           ;
CODE_0A873F:         dec   r7           ;
CODE_0A8740:         dec   r7           ;
CODE_0A8741:         with r10           ;
CODE_0A8742:         add   r4           ;
CODE_0A8743:         with r11           ;
CODE_0A8744:         add   r8           ;
CODE_0A8745:         loop               ;
CODE_0A8746:         dec   r5           ;
CODE_0A8747:         bmi CODE_0A875F    ;
CODE_0A8749:         inc   r5           ;
CODE_0A874A:         iwt   r0,#00D2     ;
CODE_0A874D:         sub   r5           ;
CODE_0A874E:         bpl CODE_0A8752    ;
CODE_0A8750:         to r5              ;
CODE_0A8751:         add   r5           ;
CODE_0A8752:         move  r12,r5       ;
CODE_0A8754:         from r5            ;
CODE_0A8755:         not                ;
CODE_0A8756:         sub   #07          ;
CODE_0A8758:         move  r13,r15      ;
CODE_0A875A:         stw   (r9)         ;
CODE_0A875B:         dec   r9           ;
CODE_0A875C:         dec   r9           ;
CODE_0A875D:         loop               ;
CODE_0A875E:         inc   r0           ;
CODE_0A875F:         link  #04          ;
CODE_0A8760:         iwt   r15,#84F2    ;
CODE_0A8763:         cache              ;
CODE_0A8764:         stop               ;
CODE_0A8765:         nop                ;

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

CODE_0A8974:         iwt   r0,#8A38     ;
CODE_0A8977:         bra CODE_0A897D    ;

CODE_0A8979:         nop                ;

CODE_0A897A:         iwt   r0,#8A44     ;
CODE_0A897D:         sms   (0020),r0    ;
CODE_0A8980:         sms   (0000),r2    ;
CODE_0A8983:         sms   (0024),r2    ;
CODE_0A8986:         sms   (0002),r3    ;
CODE_0A8989:         sms   (0004),r5    ;
CODE_0A898C:         sms   (0006),r7    ;
CODE_0A898F:         ibt   r0,#000A     ;
CODE_0A8991:         romb               ;
CODE_0A8993:         iwt   r14,#8A50    ;
CODE_0A8996:         getb               ;
CODE_0A8997:         to r10             ;
CODE_0A8998:         swap               ;
CODE_0A8999:         with r3            ;
CODE_0A899A:         sub   #08          ;
CODE_0A899C:         iwt   r0,#2200     ;
CODE_0A899F:         add   r7           ;
CODE_0A89A0:         add   r7           ;
CODE_0A89A1:         to r8              ;
CODE_0A89A2:         ldw   (r0)         ;
CODE_0A89A3:         iwt   r9,#00D1     ;
CODE_0A89A6:         cache              ;
CODE_0A89A7:         ibt   r0,#0060     ;
CODE_0A89A9:         add   r2           ;
CODE_0A89AA:         iwt   r11,#01C0    ;
CODE_0A89AD:         sub   r11          ;
CODE_0A89AE:         bcc CODE_0A89B7    ;
CODE_0A89B0:         nop                ;
CODE_0A89B1:         ibt   r2,#FF80     ;
CODE_0A89B3:         iwt   r15,#8A24    ;
CODE_0A89B6:         nop                ;
CODE_0A89B7:         iwt   r11,#3514    ;
CODE_0A89BA:         iwt   r13,#00D0    ;
CODE_0A89BD:         from r13           ;
CODE_0A89BE:         sub   r3           ;
CODE_0A89BF:         bpl CODE_0A89D5    ;
CODE_0A89C1:         to r6              ;
CODE_0A89C2:         not                ;
CODE_0A89C3:         inc   r6           ;
CODE_0A89C4:         from r8            ;
CODE_0A89C5:         lmult              ;
CODE_0A89C7:         adc   #00          ;
CODE_0A89C9:         beq CODE_0A89CE    ;
CODE_0A89CB:         nop                ;
CODE_0A89CC:         move  r4,r10       ;
CODE_0A89CE:         with r10           ;
CODE_0A89CF:         sub   r4           ;
CODE_0A89D0:         move  r12,r9       ;
CODE_0A89D2:         bra CODE_0A89F3    ;

CODE_0A89D4:         inc   r14          ;
CODE_0A89D5:         move  r12,r0       ;
CODE_0A89D7:         from r13           ;
CODE_0A89D8:         sub   r12          ;
CODE_0A89D9:         bpl CODE_0A89DF    ;
CODE_0A89DB:         inc   r12          ;
CODE_0A89DC:         move  r12,r13      ;
CODE_0A89DE:         inc   r12          ;
CODE_0A89DF:         with r9            ;
CODE_0A89E0:         sub   r12          ;
CODE_0A89E1:         iwt   r0,#FF26     ;
CODE_0A89E4:         move  r13,r15      ;
CODE_0A89E6:         stw   (r11)        ;
CODE_0A89E7:         dec   r11          ;
CODE_0A89E8:         dec   r11          ;
CODE_0A89E9:         loop               ;
CODE_0A89EA:         inc   r0           ;
CODE_0A89EB:         moves r12,r9       ;
CODE_0A89ED:         bpl CODE_0A89F3    ;
CODE_0A89EF:         inc   r14          ;
CODE_0A89F0:         iwt   r15,#8A24    ;
CODE_0A89F3:         move  r6,r5        ;
CODE_0A89F5:         move  r7,r14       ;
CODE_0A89F7:         inc   r12          ;
CODE_0A89F8:         move  r13,r15      ;
CODE_0A89FA:         with r10           ;
CODE_0A89FB:         sub   r8           ;
CODE_0A89FC:         bmi CODE_0A8A19    ;
CODE_0A89FE:         from r10           ;
CODE_0A89FF:         hib                ;
CODE_0A8A00:         to r14             ;
CODE_0A8A01:         add   r7           ;
CODE_0A8A02:         iwt   r5,#0100     ;
CODE_0A8A05:         sub   r1           ;
CODE_0A8A06:         bcs CODE_0A8A0B    ;
CODE_0A8A08:         nop                ;
CODE_0A8A09:         with r5            ;
CODE_0A8A0A:         add   r5           ;
CODE_0A8A0B:         getb               ;
CODE_0A8A0C:         swap               ;
CODE_0A8A0D:         fmult              ;
CODE_0A8A0E:         sub   r12          ;
CODE_0A8A0F:         sub   #08          ;
CODE_0A8A11:         add   r5           ;
CODE_0A8A12:         stw   (r11)        ;
CODE_0A8A13:         dec   r11          ;
CODE_0A8A14:         loop               ;
CODE_0A8A15:         dec   r11          ;
CODE_0A8A16:         iwt   r15,#8A24    ;
CODE_0A8A19:         from r12           ;
CODE_0A8A1A:         not                ;
CODE_0A8A1B:         sub   #07          ;
CODE_0A8A1D:         move  r13,r15      ;
CODE_0A8A1F:         stw   (r11)        ;
CODE_0A8A20:         dec   r11          ;
CODE_0A8A21:         dec   r11          ;
CODE_0A8A22:         loop               ;
CODE_0A8A23:         inc   r0           ;
CODE_0A8A24:         iwt   r0,#0080     ;
CODE_0A8A27:         sub   r2           ;
CODE_0A8A28:         iwt   r11,#3516    ;
CODE_0A8A2B:         iwt   r12,#00D2    ;
CODE_0A8A2E:         move  r13,r15      ;
CODE_0A8A30:         stw   (r11)        ;
CODE_0A8A31:         inc   r11          ;
CODE_0A8A32:         loop               ;
CODE_0A8A33:         inc   r11          ;
CODE_0A8A34:         iwt   r15,#8390    ;
CODE_0A8A37:         nop                ;

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

CODE_0A8AD0:         link  #04          ;
CODE_0A8AD1:         iwt   r15,#8B5E    ;
CODE_0A8AD4:         cache              ;
CODE_0A8AD5:         iwt   r1,#0F00     ;
CODE_0A8AD8:         iwt   r2,#1D38     ;
CODE_0A8ADB:         iwt   r3,#1CD6     ;
CODE_0A8ADE:         iwt   r0,#1D37     ;
CODE_0A8AE1:         lms   r4,(0012)    ;
CODE_0A8AE4:         add   r4           ;
CODE_0A8AE5:         ldb   (r0)         ;
CODE_0A8AE7:         add   r0           ;
CODE_0A8AE8:         to r4              ;
CODE_0A8AE9:         add   r0           ;
CODE_0A8AEA:         lm    r10,(0094)   ;
CODE_0A8AEE:         ibt   r12,#0018    ;
CODE_0A8AF0:         lm    r0,(009C)    ;
CODE_0A8AF4:         to r11             ;
CODE_0A8AF5:         add   #08          ;
CODE_0A8AF7:         cache              ;
CODE_0A8AF8:         iwt   r13,#8AFC    ;
CODE_0A8AFB:         with r4            ;
CODE_0A8AFC:         sub   #04          ;
CODE_0A8AFE:         bpl CODE_0A8B04    ;
CODE_0A8B00:         from r1            ;
CODE_0A8B01:         ibt   r4,#005C     ;
CODE_0A8B03:         from r1            ;
CODE_0A8B04:         add   r4           ;
CODE_0A8B05:         ldb   (r0)         ;
CODE_0A8B07:         sub   #0E          ;
CODE_0A8B09:         bcc CODE_0A8B3E    ;
CODE_0A8B0B:         from r2            ;
CODE_0A8B0C:         add   r4           ;
CODE_0A8B0D:         ldw   (r0)         ;
CODE_0A8B0E:         sub   #00          ;
CODE_0A8B10:         beq CODE_0A8B3E    ;
CODE_0A8B12:         from r3            ;
CODE_0A8B13:         add   r4           ;
CODE_0A8B14:         to r14             ;
CODE_0A8B15:         ldw   (r0)         ;
CODE_0A8B16:         with r14           ;
CODE_0A8B17:         sub   r10          ;
CODE_0A8B18:         inc   r0           ;
CODE_0A8B19:         inc   r0           ;
CODE_0A8B1A:         ldw   (r0)         ;
CODE_0A8B1B:         sub   r11          ;
CODE_0A8B1C:         sub   r5           ;
CODE_0A8B1D:         bcs CODE_0A8B47    ;
CODE_0A8B1F:         add   r5           ;
CODE_0A8B20:         move  r9,r0        ;
CODE_0A8B22:         add   r0           ;
CODE_0A8B23:         add   r6           ;
CODE_0A8B24:         ldw   (r0)         ;
CODE_0A8B25:         add   r9           ;
CODE_0A8B26:         add   #09          ;
CODE_0A8B28:         to r8              ;
CODE_0A8B29:         lob                ;
CODE_0A8B2A:         from r7            ;
CODE_0A8B2B:         add   r9           ;
CODE_0A8B2C:         add   r9           ;
CODE_0A8B2D:         to r9              ;
CODE_0A8B2E:         ldw   (r0)         ;
CODE_0A8B2F:         iwt   r0,#0080     ;
CODE_0A8B32:         sub   r9           ;
CODE_0A8B33:         sub   r14          ;
CODE_0A8B34:         bpl CODE_0A8B39    ;
CODE_0A8B36:         nop                ;
CODE_0A8B37:         not                ;
CODE_0A8B38:         inc   r0           ;
CODE_0A8B39:         add   r0           ;
CODE_0A8B3A:         sub   r8           ;
CODE_0A8B3B:         bcs CODE_0A8B47    ;
CODE_0A8B3D:         nop                ;
CODE_0A8B3E:         loop               ;
CODE_0A8B3F:         with r4            ;
CODE_0A8B40:         lms   r1,(0012)    ;
CODE_0A8B43:         to r4              ;
CODE_0A8B44:         to    r4           ;
CODE_0A8B44:         bra CODE_0A8B55    ;

CODE_0A8B46:         sub   r0           ;

CODE_0A8B47:         lms   r1,(0012)    ;
CODE_0A8B4A:         iwt   r0,#1D37     ;
CODE_0A8B4D:         to r2              ;
CODE_0A8B4E:         add   r1           ;
CODE_0A8B4F:         from r4            ;
CODE_0A8B50:         lsr                ;
CODE_0A8B51:         lsr                ;
CODE_0A8B52:         stb   (r2)         ;
CODE_0A8B54:         inc   r4           ;
CODE_0A8B55:         iwt   r0,#1D36     ;
CODE_0A8B58:         add   r1           ;
CODE_0A8B59:         from r4            ;
CODE_0A8B5A:         stb   (r0)         ;
CODE_0A8B5C:         stop               ;
CODE_0A8B5D:         nop                ;

CODE_0A8B5E:         ibt   r0,#FFFF     ;
CODE_0A8B60:         sms   (0060),r11   ;
CODE_0A8B63:         move  r11,r0       ;
CODE_0A8B65:         ibt   r0,#000A     ;
CODE_0A8B67:         romb               ;
CODE_0A8B69:         iwt   r14,#85F0    ;
CODE_0A8B6C:         lms   r0,(0018)    ;
CODE_0A8B6F:         sub   #00          ;
CODE_0A8B71:         beq CODE_0A8B76    ;
CODE_0A8B73:         with r14           ;
CODE_0A8B74:         add   #0A          ;
CODE_0A8B76:         lms   r1,(0014)    ;
CODE_0A8B79:         lms   r0,(0016)    ;
CODE_0A8B7C:         to r2              ;
CODE_0A8B7D:         sub   #08          ;
CODE_0A8B7F:         iwt   r5,#00D2     ;
CODE_0A8B82:         iwt   r6,#3372     ;
CODE_0A8B85:         iwt   r7,#3516     ;
CODE_0A8B88:         iwt   r3,#0080     ;
CODE_0A8B8B:         ibt   r10,#0000    ;
CODE_0A8B8D:         ibt   r12,#0005    ;
CODE_0A8B8F:         iwt   r13,#8B93    ;
CODE_0A8B92:         with r10           ;
CODE_0A8B93:         add   r10          ;
CODE_0A8B94:         getbs              ;
CODE_0A8B96:         inc   r14          ;
CODE_0A8B97:         to r4              ;
CODE_0A8B98:         add   r1           ;
CODE_0A8B99:         getbs              ;
CODE_0A8B9B:         inc   r14          ;
CODE_0A8B9C:         add   r2           ;
CODE_0A8B9D:         move  r9,r0        ;
CODE_0A8B9F:         sub   r5           ;
CODE_0A8BA0:         bcs CODE_0A8BBC    ;
CODE_0A8BA2:         add   r5           ;
CODE_0A8BA3:         add   r0           ;
CODE_0A8BA4:         add   r6           ;
CODE_0A8BA5:         ldw   (r0)         ;
CODE_0A8BA6:         add   r9           ;
CODE_0A8BA7:         add   #09          ;
CODE_0A8BA9:         to r8              ;
CODE_0A8BAA:         and   r11          ;
CODE_0A8BAB:         from r7            ;
CODE_0A8BAC:         add   r9           ;
CODE_0A8BAD:         add   r9           ;
CODE_0A8BAE:         ldw   (r0)         ;
CODE_0A8BAF:         from r3            ;
CODE_0A8BB0:         sub   r0           ;
CODE_0A8BB1:         sub   r4           ;
CODE_0A8BB2:         bpl CODE_0A8BB7    ;
CODE_0A8BB4:         nop                ;
CODE_0A8BB5:         not                ;
CODE_0A8BB6:         inc   r0           ;
CODE_0A8BB7:         add   r0           ;
CODE_0A8BB8:         sub   r8           ;
CODE_0A8BB9:         bcc CODE_0A8BBD    ;
CODE_0A8BBB:         nop                ;
CODE_0A8BBC:         inc   r10          ;
CODE_0A8BBD:         loop               ;
CODE_0A8BBE:         with r10           ;
CODE_0A8BBF:         sms   (0014),r10   ;
CODE_0A8BC2:         from r10           ;
CODE_0A8BC3:         lsr                ;
CODE_0A8BC4:         bcc CODE_0A8C1D    ;
CODE_0A8BC6:         sub   r0           ;
CODE_0A8BC7:         move  r1,r0        ;
CODE_0A8BC9:         dec   r9           ;
CODE_0A8BCA:         bmi CODE_0A8BF4    ;
CODE_0A8BCC:         from r1            ;
CODE_0A8BCD:         add   #0A          ;
CODE_0A8BCF:         bmi CODE_0A8BF4    ;
CODE_0A8BD1:         from r9            ;
CODE_0A8BD2:         sub   r5           ;
CODE_0A8BD3:         bcc CODE_0A8BD9    ;
CODE_0A8BD5:         add   r5           ;
CODE_0A8BD6:         bra CODE_0A8BC9    ;

CODE_0A8BD8:         dec   r1           ;

CODE_0A8BD9:         add   r0           ;
CODE_0A8BDA:         add   r6           ;
CODE_0A8BDB:         ldw   (r0)         ;
CODE_0A8BDC:         add   r9           ;
CODE_0A8BDD:         add   #09          ;
CODE_0A8BDF:         to r8              ;
CODE_0A8BE0:         and   r11          ;
CODE_0A8BE1:         from r7            ;
CODE_0A8BE2:         add   r9           ;
CODE_0A8BE3:         add   r9           ;
CODE_0A8BE4:         ldw   (r0)         ;
CODE_0A8BE5:         from r3            ;
CODE_0A8BE6:         sub   r0           ;
CODE_0A8BE7:         sub   r4           ;
CODE_0A8BE8:         move  r2,r0        ;
CODE_0A8BEA:         bpl CODE_0A8BEF    ;
CODE_0A8BEC:         nop                ;
CODE_0A8BED:         not                ;
CODE_0A8BEE:         inc   r0           ;
CODE_0A8BEF:         add   r0           ;
CODE_0A8BF0:         sub   r8           ;
CODE_0A8BF1:         bcs CODE_0A8BC9    ;
CODE_0A8BF3:         dec   r1           ;
CODE_0A8BF4:         sms   (0016),r1    ;
CODE_0A8BF7:         from r9            ;
CODE_0A8BF8:         add   #02          ;
CODE_0A8BFA:         cmp   r5           ;
CODE_0A8BFC:         bcs CODE_0A8C07    ;
CODE_0A8BFE:         from r8            ;
CODE_0A8BFF:         from r0            ;
CODE_0A8C00:         add   r0           ;
CODE_0A8C01:         add   r6           ;
CODE_0A8C02:         ldw   (r0)         ;
CODE_0A8C03:         add   r9           ;
CODE_0A8C04:         add   #09          ;
CODE_0A8C06:         and   r11          ;
CODE_0A8C07:         sub   r8           ;
CODE_0A8C08:         lsr                ;
CODE_0A8C09:         ibt   r3,#0004     ;
CODE_0A8C0B:         cmp   r3           ;
CODE_0A8C0D:         bcc CODE_0A8C12    ;
CODE_0A8C0F:         nop                ;
CODE_0A8C10:         move  r0,r3        ;
CODE_0A8C12:         moves r2,r2        ;
CODE_0A8C14:         bpl CODE_0A8C19    ;
CODE_0A8C16:         nop                ;
CODE_0A8C17:         add   #05          ;
CODE_0A8C19:         add   r0           ;
CODE_0A8C1A:         sms   (0018),r0    ;
CODE_0A8C1D:         iwt   r0,#8604     ;
CODE_0A8C20:         sub   r14          ;
CODE_0A8C21:         bcc CODE_0A8C43    ;
CODE_0A8C23:         to r14             ;
CODE_0A8C24:         add   r14          ;
CODE_0A8C25:         lms   r0,(0014)    ;
CODE_0A8C28:         sms   (001A),r0    ;
CODE_0A8C2B:         lms   r0,(0016)    ;
CODE_0A8C2E:         sms   (001C),r0    ;
CODE_0A8C31:         lms   r0,(0018)    ;
CODE_0A8C34:         sms   (001E),r0    ;
CODE_0A8C37:         lm    r1,(1680)    ;
CODE_0A8C3B:         lm    r0,(1682)    ;
CODE_0A8C3F:         iwt   r15,#8B7D    ;
CODE_0A8C42:         to r2              ;
CODE_0A8C43:         lms   r11,(0060)   ;
CODE_0A8C46:         jmp   r11          ;
CODE_0A8C47:         nop                ;

CODE_0A8C48:         ibt   r0,#000A     ;
CODE_0A8C4A:         romb               ;
CODE_0A8C4C:         ibt   r11,#0000    ;
CODE_0A8C4E:         ibt   r12,#0018    ;
CODE_0A8C50:         cache              ;
CODE_0A8C51:         move  r13,r15      ;
CODE_0A8C53:         ibt   r10,#0000    ;
CODE_0A8C55:         iwt   r0,#0F00     ;
CODE_0A8C58:         add   r11          ;
CODE_0A8C59:         ldw   (r0)         ;
CODE_0A8C5A:         sub   #0E          ;
CODE_0A8C5C:         bcc CODE_0A8C74    ;
CODE_0A8C5E:         nop                ;
CODE_0A8C5F:         iwt   r0,#1D38     ;
CODE_0A8C62:         add   r11          ;
CODE_0A8C63:         ldw   (r0)         ;
CODE_0A8C64:         sub   #00          ;
CODE_0A8C66:         bne CODE_0A8C74    ;
CODE_0A8C68:         nop                ;
CODE_0A8C69:         iwt   r0,#0FA2     ;
CODE_0A8C6C:         add   r11          ;
CODE_0A8C6D:         ldw   (r0)         ;
CODE_0A8C6E:         ibt   r1,#001F     ;
CODE_0A8C70:         and   r1           ;
CODE_0A8C71:         bne CODE_0A8C78    ;
CODE_0A8C73:         add   r0           ;
CODE_0A8C74:         iwt   r15,#8D7F    ;
CODE_0A8C77:         inc   r11          ;
CODE_0A8C78:         ibt   r3,#0004     ;
CODE_0A8C7A:         iwt   r2,#CF0B     ;
CODE_0A8C7D:         ibt   r1,#0038     ;
CODE_0A8C7F:         sub   r1           ;
CODE_0A8C80:         bcc CODE_0A8C87    ;
CODE_0A8C82:         add   r1           ;
CODE_0A8C83:         ibt   r3,#0001     ;
CODE_0A8C85:         dec   r2           ;
CODE_0A8C86:         dec   r2           ;
CODE_0A8C87:         iwt   r14,#CECA    ;
CODE_0A8C8A:         to r14             ;
CODE_0A8C8B:         add   r14          ;
CODE_0A8C8C:         getb               ;
CODE_0A8C8D:         add   r0           ;
CODE_0A8C8E:         to r14             ;
CODE_0A8C8F:         add   r2           ;
CODE_0A8C90:         iwt   r0,#1680     ;
CODE_0A8C93:         add   r11          ;
CODE_0A8C94:         to r1              ;
CODE_0A8C95:         ldw   (r0)         ;
CODE_0A8C96:         iwt   r0,#1682     ;
CODE_0A8C99:         add   r11          ;
CODE_0A8C9A:         ldw   (r0)         ;
CODE_0A8C9B:         to r2              ;
CODE_0A8C9C:         sub   #08          ;
CODE_0A8C9E:         iwt   r5,#00D2     ;
CODE_0A8CA1:         iwt   r6,#3372     ;
CODE_0A8CA4:         iwt   r7,#3516     ;
CODE_0A8CA7:         sms   (0058),r12   ;
CODE_0A8CAA:         sms   (005A),r13   ;
CODE_0A8CAD:         move  r12,r3       ;
CODE_0A8CAF:         iwt   r3,#0080     ;
CODE_0A8CB2:         iwt   r13,#8CB6    ;
CODE_0A8CB5:         with r10           ;
CODE_0A8CB6:         add   r10          ;
CODE_0A8CB7:         getbs              ;
CODE_0A8CB9:         inc   r14          ;
CODE_0A8CBA:         to r4              ;
CODE_0A8CBB:         add   r1           ;
CODE_0A8CBC:         getbs              ;
CODE_0A8CBE:         inc   r14          ;
CODE_0A8CBF:         add   r2           ;
CODE_0A8CC0:         move  r9,r0        ;
CODE_0A8CC2:         sub   r5           ;
CODE_0A8CC3:         bcs CODE_0A8CDF    ;
CODE_0A8CC5:         add   r5           ;
CODE_0A8CC6:         add   r0           ;
CODE_0A8CC7:         add   r6           ;
CODE_0A8CC8:         ldw   (r0)         ;
CODE_0A8CC9:         add   r9           ;
CODE_0A8CCA:         add   #09          ;
CODE_0A8CCC:         to r8              ;
CODE_0A8CCD:         lob                ;
CODE_0A8CCE:         from r7            ;
CODE_0A8CCF:         add   r9           ;
CODE_0A8CD0:         add   r9           ;
CODE_0A8CD1:         ldw   (r0)         ;
CODE_0A8CD2:         from r3            ;
CODE_0A8CD3:         sub   r0           ;
CODE_0A8CD4:         sub   r4           ;
CODE_0A8CD5:         bpl CODE_0A8CDA    ;
CODE_0A8CD7:         nop                ;
CODE_0A8CD8:         not                ;
CODE_0A8CD9:         inc   r0           ;
CODE_0A8CDA:         add   r0           ;
CODE_0A8CDB:         sub   r8           ;
CODE_0A8CDC:         bcc CODE_0A8CE0    ;
CODE_0A8CDE:         nop                ;
CODE_0A8CDF:         inc   r10          ;
CODE_0A8CE0:         loop               ;
CODE_0A8CE1:         with r10           ;
CODE_0A8CE2:         lms   r12,(0058)   ;
CODE_0A8CE5:         lms   r13,(005A)   ;
CODE_0A8CE8:         from r10           ;
CODE_0A8CE9:         lsr                ;
CODE_0A8CEA:         bcc CODE_0A8D30    ;
CODE_0A8CEC:         sub   r0           ;
CODE_0A8CED:         move  r1,r0        ;
CODE_0A8CEF:         from r10           ;
CODE_0A8CF0:         and   #02          ;
CODE_0A8CF2:         beq CODE_0A8CFE    ;
CODE_0A8CF4:         from r9            ;
CODE_0A8CF5:         sex                ;
CODE_0A8CF6:         bmi CODE_0A8CFE    ;
CODE_0A8CF8:         with r10           ;
CODE_0A8CF9:         bic   #01          ;
CODE_0A8CFB:         bra CODE_0A8D31    ;

CODE_0A8CFD:         from r10           ;
CODE_0A8CFE:         dec   r9           ;

CODE_0A8CFF:         bmi CODE_0A8D29    ;
CODE_0A8D01:         from r1            ;
CODE_0A8D02:         add   #0A          ;
CODE_0A8D04:         bmi CODE_0A8D29    ;
CODE_0A8D06:         from r9            ;
CODE_0A8D07:         sub   r5           ;
CODE_0A8D08:         bcc CODE_0A8D0E    ;
CODE_0A8D0A:         add   r5           ;
CODE_0A8D0B:         bra CODE_0A8CFE    ;

CODE_0A8D0D:         dec   r1           ;

CODE_0A8D0E:         add   r0           ;
CODE_0A8D0F:         add   r6           ;
CODE_0A8D10:         ldw   (r0)         ;
CODE_0A8D11:         add   r9           ;
CODE_0A8D12:         add   #09          ;
CODE_0A8D14:         to r8              ;
CODE_0A8D15:         lob                ;
CODE_0A8D16:         from r7            ;
CODE_0A8D17:         add   r9           ;
CODE_0A8D18:         add   r9           ;
CODE_0A8D19:         ldw   (r0)         ;
CODE_0A8D1A:         from r3            ;
CODE_0A8D1B:         sub   r0           ;
CODE_0A8D1C:         sub   r4           ;
CODE_0A8D1D:         move  r2,r0        ;
CODE_0A8D1F:         bpl CODE_0A8D24    ;
CODE_0A8D21:         nop                ;
CODE_0A8D22:         not                ;
CODE_0A8D23:         inc   r0           ;
CODE_0A8D24:         add   r0           ;
CODE_0A8D25:         sub   r8           ;
CODE_0A8D26:         bcs CODE_0A8CFE    ;
CODE_0A8D28:         dec   r1           ;
CODE_0A8D29:         iwt   r0,#1182     ;
CODE_0A8D2C:         add   r11          ;
CODE_0A8D2D:         ldw   (r0)         ;
CODE_0A8D2E:         add   r1           ;
CODE_0A8D2F:         sbk                ;
CODE_0A8D30:         from r10           ;
CODE_0A8D31:         and   #0C          ;
CODE_0A8D33:         beq CODE_0A8D67    ;
CODE_0A8D35:         from r4            ;
CODE_0A8D36:         sex                ;
CODE_0A8D37:         ibt   r4,#0001     ;
CODE_0A8D39:         bpl CODE_0A8D3E    ;
CODE_0A8D3B:         nop                ;
CODE_0A8D3C:         ibt   r4,#FFFF     ;
CODE_0A8D3E:         iwt   r0,#10E2     ;
CODE_0A8D41:         add   r11          ;
CODE_0A8D42:         ldw   (r0)         ;
CODE_0A8D43:         add   r4           ;
CODE_0A8D44:         sbk                ;
CODE_0A8D45:         iwt   r0,#15E0     ;
CODE_0A8D48:         add   r11          ;
CODE_0A8D49:         ldw   (r0)         ;
CODE_0A8D4A:         to r2              ;
CODE_0A8D4B:         xor   r4           ;
CODE_0A8D4D:         bpl CODE_0A8D53    ;
CODE_0A8D4F:         nop                ;
CODE_0A8D50:         not                ;
CODE_0A8D51:         inc   r0           ;
CODE_0A8D52:         sbk                ;
CODE_0A8D53:         iwt   r0,#1220     ;
CODE_0A8D56:         add   r11          ;
CODE_0A8D57:         ldw   (r0)         ;
CODE_0A8D58:         to r2              ;
CODE_0A8D59:         xor   r4           ;
CODE_0A8D5B:         bpl CODE_0A8D61    ;
CODE_0A8D5D:         inc   r4           ;
CODE_0A8D5E:         not                ;
CODE_0A8D5F:         inc   r0           ;
CODE_0A8D60:         sbk                ;
CODE_0A8D61:         iwt   r0,#1400     ;
CODE_0A8D64:         add   r11          ;
CODE_0A8D65:         from r4            ;
CODE_0A8D66:         stw   (r0)         ;
CODE_0A8D67:         from r10           ;
CODE_0A8D68:         and   #02          ;
CODE_0A8D6A:         beq CODE_0A8D7E    ;
CODE_0A8D6C:         nop                ;
CODE_0A8D6D:         iwt   r0,#1222     ;
CODE_0A8D70:         add   r11          ;
CODE_0A8D71:         ldw   (r0)         ;
CODE_0A8D72:         sub   #00          ;
CODE_0A8D74:         bpl CODE_0A8D7E    ;
CODE_0A8D76:         to r2              ;
CODE_0A8D77:         sub   r0           ;
CODE_0A8D78:         iwt   r0,#1222     ;
CODE_0A8D7B:         add   r11          ;
CODE_0A8D7C:         from r2            ;
CODE_0A8D7D:         stw   (r0)         ;
CODE_0A8D7E:         inc   r11          ;
CODE_0A8D7F:         iwt   r0,#185F     ;
CODE_0A8D82:         add   r11          ;
CODE_0A8D83:         from r10           ;
CODE_0A8D84:         stw   (r0)         ;
CODE_0A8D85:         inc   r11          ;
CODE_0A8D86:         inc   r11          ;
CODE_0A8D87:         loop               ;
CODE_0A8D88:         inc   r11          ;
CODE_0A8D89:         stop               ;
CODE_0A8D8A:         nop                ;

CODE_0A8D8B:         romb               ;
CODE_0A8D8D:         move  r14,r14      ;
CODE_0A8D8F:         iwt   r1,#49C6     ;
CODE_0A8D92:         to r12             ;
CODE_0A8D93:         ldb   (r1)         ;
CODE_0A8D95:         inc   r1           ;
CODE_0A8D96:         cache              ;
CODE_0A8D97:         move  r13,r15      ;
CODE_0A8D99:         ldb   (r1)         ;
CODE_0A8D9B:         to r2              ;
CODE_0A8D9C:         sex                ;
CODE_0A8D9D:         getbs              ;
CODE_0A8D9F:         sub   r2           ;
CODE_0A8DA0:         beq CODE_0A8DAB    ;
CODE_0A8DA2:         inc   r14          ;
CODE_0A8DA3:         asr                ;
CODE_0A8DA4:         asr                ;
CODE_0A8DA5:         asr                ;
CODE_0A8DA6:         asr                ;
CODE_0A8DA7:         bne CODE_0A8DAB    ;
CODE_0A8DA9:         nop                ;
CODE_0A8DAA:         inc   r0           ;
CODE_0A8DAB:         add   r2           ;
CODE_0A8DAC:         stb   (r1)         ;
CODE_0A8DAE:         inc   r1           ;
CODE_0A8DAF:         ldb   (r1)         ;
CODE_0A8DB1:         to r2              ;
CODE_0A8DB2:         sex                ;
CODE_0A8DB3:         getbs              ;
CODE_0A8DB5:         sub   r2           ;
CODE_0A8DB6:         beq CODE_0A8DC1    ;
CODE_0A8DB8:         inc   r14          ;
CODE_0A8DB9:         asr                ;
CODE_0A8DBA:         asr                ;
CODE_0A8DBB:         asr                ;
CODE_0A8DBC:         asr                ;
CODE_0A8DBD:         bne CODE_0A8DC1    ;
CODE_0A8DBF:         nop                ;
CODE_0A8DC0:         inc   r0           ;
CODE_0A8DC1:         add   r2           ;
CODE_0A8DC2:         stb   (r1)         ;
CODE_0A8DC4:         loop               ;
CODE_0A8DC5:         inc   r1           ;
CODE_0A8DC6:         stop               ;
CODE_0A8DC7:         nop                ;

CODE_0A8DC8:         sms   (0000),r1    ;
CODE_0A8DCB:         sms   (0002),r2    ;
CODE_0A8DCE:         link  #04          ;
CODE_0A8DCF:         iwt   r15,#8EFC    ;
CODE_0A8DD2:         nop                ;
CODE_0A8DD3:         move  r3,r1        ;
CODE_0A8DD5:         lms   r4,(0004)    ;
CODE_0A8DD8:         from r4            ;
CODE_0A8DD9:         to r5              ;
CODE_0A8DDA:         mult  r4           ;
CODE_0A8DDB:         lms   r1,(0000)    ;
CODE_0A8DDE:         from r1            ;
CODE_0A8DDF:         to r6              ;
CODE_0A8DE0:         mult  r1           ;
CODE_0A8DE1:         lms   r2,(0002)    ;
CODE_0A8DE4:         from r2            ;
CODE_0A8DE5:         mult  r2           ;
CODE_0A8DE6:         add   r6           ;
CODE_0A8DE7:         sub   r5           ;
CODE_0A8DE8:         bcc CODE_0A8E10    ;
CODE_0A8DEA:         nop                ;
CODE_0A8DEB:         ibt   r0,#0008     ;
CODE_0A8DED:         romb               ;
CODE_0A8DEF:         iwt   r0,#AE18     ;
CODE_0A8DF2:         to r14             ;
CODE_0A8DF3:         add   r3           ;
CODE_0A8DF4:         getb               ;
CODE_0A8DF5:         mult  r4           ;
CODE_0A8DF6:         add   r0           ;
CODE_0A8DF7:         add   r0           ;
CODE_0A8DF8:         hib                ;
CODE_0A8DF9:         sex                ;
CODE_0A8DFA:         to r1              ;
CODE_0A8DFB:         not                ;
CODE_0A8DFC:         inc   r1           ;
CODE_0A8DFD:         sms   (0000),r1    ;
CODE_0A8E00:         ibt   r0,#0040     ;
CODE_0A8E02:         to r14             ;
CODE_0A8E03:         add   r14          ;
CODE_0A8E04:         getb               ;
CODE_0A8E05:         mult  r4           ;
CODE_0A8E06:         add   r0           ;
CODE_0A8E07:         add   r0           ;
CODE_0A8E08:         hib                ;
CODE_0A8E09:         sex                ;
CODE_0A8E0A:         to r2              ;
CODE_0A8E0B:         not                ;
CODE_0A8E0C:         inc   r2           ;
CODE_0A8E0D:         sms   (0002),r2    ;
CODE_0A8E10:         ibt   r0,#007F     ;
CODE_0A8E12:         xor   r3           ;
CODE_0A8E14:         inc   r0           ;
CODE_0A8E15:         lob                ;
CODE_0A8E16:         add   #08          ;
CODE_0A8E18:         lsr                ;
CODE_0A8E19:         lsr                ;
CODE_0A8E1A:         lsr                ;
CODE_0A8E1B:         lsr                ;
CODE_0A8E1C:         sms   (0004),r0    ;
CODE_0A8E1F:         move  r4,r0        ;
CODE_0A8E21:         add   r0           ;
CODE_0A8E22:         iwt   r3,#49C7     ;
CODE_0A8E25:         to r3              ;
CODE_0A8E26:         add   r3           ;
CODE_0A8E27:         from r1            ;
CODE_0A8E28:         stb   (r3)         ;
CODE_0A8E2A:         inc   r3           ;
CODE_0A8E2B:         from r2            ;
CODE_0A8E2C:         stb   (r3)         ;
CODE_0A8E2E:         from r4            ;
CODE_0A8E2F:         sub   #02          ;
CODE_0A8E31:         and   #0F          ;
CODE_0A8E33:         add   r0           ;
CODE_0A8E34:         iwt   r3,#49C7     ;
CODE_0A8E37:         to r3              ;
CODE_0A8E38:         add   r3           ;
CODE_0A8E39:         ldb   (r3)         ;
CODE_0A8E3B:         sex                ;
CODE_0A8E3C:         to r1              ;
CODE_0A8E3D:         sub   r1           ;
CODE_0A8E3E:         inc   r3           ;
CODE_0A8E3F:         ldb   (r3)         ;
CODE_0A8E41:         sex                ;
CODE_0A8E42:         to r2              ;
CODE_0A8E43:         sub   r2           ;
CODE_0A8E44:         link  #04          ;
CODE_0A8E45:         iwt   r15,#8EDE    ;
CODE_0A8E48:         nop                ;
CODE_0A8E49:         lms   r0,(0004)    ;
CODE_0A8E4C:         dec   r0           ;
CODE_0A8E4D:         and   #0F          ;
CODE_0A8E4F:         add   r0           ;
CODE_0A8E50:         iwt   r4,#49C7     ;
CODE_0A8E53:         to r4              ;
CODE_0A8E54:         add   r4           ;
CODE_0A8E55:         ldb   (r4)         ;
CODE_0A8E57:         move  r6,r0        ;
CODE_0A8E59:         lms   r1,(0000)    ;
CODE_0A8E5C:         sub   r1           ;
CODE_0A8E5D:         to r5              ;
CODE_0A8E5E:         mult  r3           ;
CODE_0A8E5F:         inc   r4           ;
CODE_0A8E60:         ldb   (r4)         ;
CODE_0A8E62:         move  r7,r0        ;
CODE_0A8E64:         lms   r1,(0002)    ;
CODE_0A8E67:         sub   r1           ;
CODE_0A8E68:         mult  r2           ;
CODE_0A8E69:         from r5            ;
CODE_0A8E6A:         sub   r0           ;
CODE_0A8E6B:         add   r0           ;
CODE_0A8E6C:         add   r0           ;
CODE_0A8E6D:         hib                ;
CODE_0A8E6E:         move  r5,r0        ;
CODE_0A8E70:         mult  r2           ;
CODE_0A8E71:         add   r0           ;
CODE_0A8E72:         add   r0           ;
CODE_0A8E73:         hib                ;
CODE_0A8E74:         add   r7           ;
CODE_0A8E75:         stb   (r4)         ;
CODE_0A8E77:         from r5            ;
CODE_0A8E78:         mult  r3           ;
CODE_0A8E79:         add   r0           ;
CODE_0A8E7A:         add   r0           ;
CODE_0A8E7B:         hib                ;
CODE_0A8E7C:         from r6            ;
CODE_0A8E7D:         sub   r0           ;
CODE_0A8E7E:         dec   r4           ;
CODE_0A8E7F:         stb   (r4)         ;
CODE_0A8E81:         lms   r0,(0004)    ;
CODE_0A8E84:         add   #02          ;
CODE_0A8E86:         and   #0F          ;
CODE_0A8E88:         add   r0           ;
CODE_0A8E89:         iwt   r3,#49C7     ;
CODE_0A8E8C:         to r3              ;
CODE_0A8E8D:         add   r3           ;
CODE_0A8E8E:         ldb   (r3)         ;
CODE_0A8E90:         sex                ;
CODE_0A8E91:         lms   r1,(0000)    ;
CODE_0A8E94:         to r1              ;
CODE_0A8E95:         sub   r1           ;
CODE_0A8E96:         inc   r3           ;
CODE_0A8E97:         ldb   (r3)         ;
CODE_0A8E99:         sex                ;
CODE_0A8E9A:         lms   r2,(0002)    ;
CODE_0A8E9D:         to r2              ;
CODE_0A8E9E:         sub   r2           ;
CODE_0A8E9F:         link  #04          ;
CODE_0A8EA0:         iwt   r15,#8EDE    ;
CODE_0A8EA3:         nop                ;
CODE_0A8EA4:         lms   r0,(0004)    ;
CODE_0A8EA7:         inc   r0           ;
CODE_0A8EA8:         and   #0F          ;
CODE_0A8EAA:         add   r0           ;
CODE_0A8EAB:         iwt   r4,#49C7     ;
CODE_0A8EAE:         to r4              ;
CODE_0A8EAF:         add   r4           ;
CODE_0A8EB0:         ldb   (r4)         ;
CODE_0A8EB2:         move  r6,r0        ;
CODE_0A8EB4:         lms   r1,(0000)    ;
CODE_0A8EB7:         sub   r1           ;
CODE_0A8EB8:         to r5              ;
CODE_0A8EB9:         mult  r3           ;
CODE_0A8EBA:         inc   r4           ;
CODE_0A8EBB:         ldb   (r4)         ;
CODE_0A8EBD:         move  r7,r0        ;
CODE_0A8EBF:         lms   r1,(0002)    ;
CODE_0A8EC2:         sub   r1           ;
CODE_0A8EC3:         mult  r2           ;
CODE_0A8EC4:         from r5            ;
CODE_0A8EC5:         sub   r0           ;
CODE_0A8EC6:         add   r0           ;
CODE_0A8EC7:         add   r0           ;
CODE_0A8EC8:         hib                ;
CODE_0A8EC9:         move  r5,r0        ;
CODE_0A8ECB:         mult  r2           ;
CODE_0A8ECC:         add   r0           ;
CODE_0A8ECD:         add   r0           ;
CODE_0A8ECE:         hib                ;
CODE_0A8ECF:         add   r7           ;
CODE_0A8ED0:         stb   (r4)         ;
CODE_0A8ED2:         from r5            ;
CODE_0A8ED3:         mult  r3           ;
CODE_0A8ED4:         add   r0           ;
CODE_0A8ED5:         add   r0           ;
CODE_0A8ED6:         hib                ;
CODE_0A8ED7:         from r6            ;
CODE_0A8ED8:         sub   r0           ;
CODE_0A8ED9:         dec   r4           ;
CODE_0A8EDA:         stb   (r4)         ;
CODE_0A8EDC:         stop               ;
CODE_0A8EDD:         nop                ;

CODE_0A8EDE:         sms   (0062),r11   ;
CODE_0A8EE1:         link  #04          ;
CODE_0A8EE2:         iwt   r15,#8EFC    ;
CODE_0A8EE5:         nop                ;
CODE_0A8EE6:         ibt   r0,#0008     ;
CODE_0A8EE8:         romb               ;
CODE_0A8EEA:         iwt   r0,#AE18     ;
CODE_0A8EED:         to r14             ;
CODE_0A8EEE:         add   r1           ;
CODE_0A8EEF:         to r2              ;
CODE_0A8EF0:         getb               ;
CODE_0A8EF1:         ibt   r0,#0040     ;
CODE_0A8EF3:         to r14             ;
CODE_0A8EF4:         add   r14          ;
CODE_0A8EF5:         to r3              ;
CODE_0A8EF6:         getb               ;
CODE_0A8EF7:         lms   r11,(0062)   ;
CODE_0A8EFA:         jmp   r11          ;
CODE_0A8EFB:         nop                ;

CODE_0A8EFC:         sms   (0060),r11   ;
CODE_0A8EFF:         iwt   r0,#BC74     ;
CODE_0A8F02:         ibt   r8,#000B     ;
CODE_0A8F04:         ibt   r5,#000A     ;
CODE_0A8F06:         move  r11,r15      ;
CODE_0A8F08:         ljmp  r8           ;
CODE_0A8F0A:         nop                ;

CODE_0A8F0B:         lms   r11,(0060)   ;
CODE_0A8F0E:         jmp   r11          ;
CODE_0A8F0F:         nop                ;

CODE_0A8F10:         cache              ;
CODE_0A8F11:         ibt   r0,#0008     ;
CODE_0A8F13:         romb               ;
CODE_0A8F15:         with r3            ;
CODE_0A8F16:         lob                ;
CODE_0A8F17:         with r9            ;
CODE_0A8F18:         lob                ;
CODE_0A8F19:         iwt   r12,#00D2    ;
CODE_0A8F1C:         move  r13,r15      ;
CODE_0A8F1E:         with r1            ;
CODE_0A8F1F:         lob                ;
CODE_0A8F20:         iwt   r0,#AC18     ;
CODE_0A8F23:         add   r1           ;
CODE_0A8F24:         to r14             ;
CODE_0A8F25:         add   r1           ;
CODE_0A8F26:         getb               ;
CODE_0A8F27:         inc   r14          ;
CODE_0A8F28:         getbh              ;
CODE_0A8F2A:         move  r6,r2        ;
CODE_0A8F2C:         lmult              ;
CODE_0A8F2E:         with r4            ;
CODE_0A8F2F:         hib                ;
CODE_0A8F30:         lob                ;
CODE_0A8F31:         swap               ;
CODE_0A8F32:         or    r4           ;
CODE_0A8F33:         add   r10          ;
CODE_0A8F34:         stw   (r5)         ;
CODE_0A8F35:         inc   r5           ;
CODE_0A8F36:         inc   r5           ;
CODE_0A8F37:         with r1            ;
CODE_0A8F38:         add   r3           ;
CODE_0A8F39:         with r7            ;
CODE_0A8F3A:         lob                ;
CODE_0A8F3B:         iwt   r0,#AC18     ;
CODE_0A8F3E:         add   r7           ;
CODE_0A8F3F:         to r14             ;
CODE_0A8F40:         add   r7           ;
CODE_0A8F41:         getb               ;
CODE_0A8F42:         inc   r14          ;
CODE_0A8F43:         getbh              ;
CODE_0A8F45:         move  r6,r8        ;
CODE_0A8F47:         lmult              ;
CODE_0A8F49:         with r4            ;
CODE_0A8F4A:         hib                ;
CODE_0A8F4B:         lob                ;
CODE_0A8F4C:         swap               ;
CODE_0A8F4D:         or    r4           ;
CODE_0A8F4E:         add   r11          ;
CODE_0A8F4F:         stw   (r5)         ;
CODE_0A8F50:         with r7            ;
CODE_0A8F51:         add   r9           ;
CODE_0A8F52:         inc   r5           ;
CODE_0A8F53:         loop               ;
CODE_0A8F54:         inc   r5           ;
CODE_0A8F55:         stop               ;
CODE_0A8F56:         nop                ;

CODE_0A8F57:         romb               ;
CODE_0A8F59:         move  r14,r14      ;
CODE_0A8F5B:         iwt   r1,#49C6     ;
CODE_0A8F5E:         ldb   (r1)         ;
CODE_0A8F60:         inc   r1           ;
CODE_0A8F61:         move  r12,r0       ;
CODE_0A8F63:         to r11             ;
CODE_0A8F64:         add   r0           ;
CODE_0A8F65:         getb               ;
CODE_0A8F66:         inc   r14          ;
CODE_0A8F67:         swap               ;
CODE_0A8F68:         fmult              ;
CODE_0A8F69:         stb   (r1)         ;
CODE_0A8F6B:         inc   r1           ;
CODE_0A8F6C:         getb               ;
CODE_0A8F6D:         inc   r14          ;
CODE_0A8F6E:         swap               ;
CODE_0A8F6F:         fmult              ;
CODE_0A8F70:         stb   (r1)         ;
CODE_0A8F72:         inc   r1           ;
CODE_0A8F73:         iwt   r2,#FF81     ;
CODE_0A8F76:         to r2              ;
CODE_0A8F77:         add   r2           ;
CODE_0A8F78:         ibt   r3,#0000     ;
CODE_0A8F7A:         dec   r12          ;
CODE_0A8F7B:         cache              ;
CODE_0A8F7C:         move  r13,r15      ;
CODE_0A8F7E:         getb               ;
CODE_0A8F7F:         inc   r14          ;
CODE_0A8F80:         swap               ;
CODE_0A8F81:         fmult              ;
CODE_0A8F82:         stb   (r1)         ;
CODE_0A8F84:         getb               ;
CODE_0A8F85:         swap               ;
CODE_0A8F86:         fmult              ;
CODE_0A8F87:         to r4              ;
CODE_0A8F88:         sub   r2           ;
CODE_0A8F89:         bpl CODE_0A8FA1    ;
CODE_0A8F8B:         inc   r14          ;
CODE_0A8F8C:         from r2            ;
CODE_0A8F8D:         sub   r3           ;
CODE_0A8F8E:         bpl CODE_0A8F9F    ;
CODE_0A8F90:         from r1            ;
CODE_0A8F91:         to r5              ;
CODE_0A8F92:         sub   #02          ;
CODE_0A8F94:         to r3              ;
CODE_0A8F95:         ldb   (r5)         ;
CODE_0A8F97:         from r4            ;
CODE_0A8F98:         not                ;
CODE_0A8F99:         inc   r0           ;
CODE_0A8F9A:         lsr                ;
CODE_0A8F9B:         lsr                ;
CODE_0A8F9C:         add   r3           ;
CODE_0A8F9D:         stb   (r5)         ;
CODE_0A8F9F:         move  r0,r2        ;
CODE_0A8FA1:         inc   r1           ;
CODE_0A8FA2:         stb   (r1)         ;
CODE_0A8FA4:         move  r3,r0        ;
CODE_0A8FA6:         loop               ;
CODE_0A8FA7:         inc   r1           ;
CODE_0A8FA8:         iwt   r1,#49C7     ;
CODE_0A8FAB:         iwt   r2,#4C76     ;
CODE_0A8FAE:         move  r12,r11      ;
CODE_0A8FB0:         move  r13,r15      ;
CODE_0A8FB2:         ldb   (r1)         ;
CODE_0A8FB4:         stb   (r2)         ;
CODE_0A8FB6:         inc   r1           ;
CODE_0A8FB7:         loop               ;
CODE_0A8FB8:         inc   r2           ;
CODE_0A8FB9:         stop               ;
CODE_0A8FBA:         nop                ;

CODE_0A8FBB:         iwt   r3,#4C76     ;
CODE_0A8FBE:         iwt   r1,#49C6     ;
CODE_0A8FC1:         to r12             ;
CODE_0A8FC2:         ldb   (r1)         ;
CODE_0A8FC4:         inc   r1           ;
CODE_0A8FC5:         cache              ;
CODE_0A8FC6:         move  r13,r15      ;
CODE_0A8FC8:         ldb   (r1)         ;
CODE_0A8FCA:         to r2              ;
CODE_0A8FCB:         sex                ;
CODE_0A8FCC:         ldb   (r3)         ;
CODE_0A8FCE:         inc   r3           ;
CODE_0A8FCF:         sex                ;
CODE_0A8FD0:         sub   r2           ;
CODE_0A8FD1:         beq CODE_0A8FDD    ;
CODE_0A8FD3:         inc   r3           ;
CODE_0A8FD4:         hib                ;
CODE_0A8FD5:         sex                ;
CODE_0A8FD6:         bmi CODE_0A8FDA    ;
CODE_0A8FD8:         nop                ;
CODE_0A8FD9:         inc   r0           ;
CODE_0A8FDA:         add   r2           ;
CODE_0A8FDB:         stb   (r1)         ;
CODE_0A8FDD:         inc   r1           ;
CODE_0A8FDE:         loop               ;
CODE_0A8FDF:         inc   r1           ;
CODE_0A8FE0:         stop               ;
CODE_0A8FE1:         nop                ;

CODE_0A8FE2:         iwt   r10,#4C76    ;
CODE_0A8FE5:         iwt   r1,#49C6     ;
CODE_0A8FE8:         to r12             ;
CODE_0A8FE9:         ldb   (r1)         ;
CODE_0A8FEB:         inc   r1           ;
CODE_0A8FEC:         inc   r1           ;
CODE_0A8FED:         to r3              ;
CODE_0A8FEE:         ldb   (r1)         ;
CODE_0A8FF0:         dec   r1           ;
CODE_0A8FF1:         iwt   r2,#4C96     ;
CODE_0A8FF4:         cache              ;
CODE_0A8FF5:         move  r13,r15      ;
CODE_0A8FF7:         to r5              ;
CODE_0A8FF8:         ldb   (r1)         ;
CODE_0A8FFA:         move  r7,r1        ;
CODE_0A8FFC:         inc   r1           ;
CODE_0A8FFD:         ldb   (r1)         ;
CODE_0A8FFF:         inc   r1           ;
CODE_0A9000:         sex                ;
CODE_0A9001:         sub   r3           ;
CODE_0A9002:         lmult              ;
CODE_0A9004:         with r4            ;
CODE_0A9005:         hib                ;
CODE_0A9006:         lob                ;
CODE_0A9007:         swap               ;
CODE_0A9008:         or    r4           ;
CODE_0A9009:         to r8              ;
CODE_0A900A:         ldw   (r2)         ;
CODE_0A900B:         inc   r2           ;
CODE_0A900C:         inc   r2           ;
CODE_0A900D:         sbk                ;
CODE_0A900E:         sub   r8           ;
CODE_0A900F:         move  r8,r0        ;
CODE_0A9011:         add   r5           ;
CODE_0A9012:         stb   (r7)         ;
CODE_0A9014:         ldb   (r10)        ;
CODE_0A9016:         add   r8           ;
CODE_0A9017:         stb   (r10)        ;
CODE_0A9019:         inc   r10          ;
CODE_0A901A:         loop               ;
CODE_0A901B:         inc   r10          ;
CODE_0A901C:         stop               ;
CODE_0A901D:         nop                ;

DATA_0A901E:         db $C8, $14, $02, $C8, $38, $02, $80, $26
DATA_0A9026:         db $01, $9C, $68, $08, $54, $54, $02, $40
DATA_0A902E:         db $64, $01, $E8, $08, $05, $E0, $76, $05
DATA_0A9036:         db $C0, $8E, $01

CODE_0A9039:         ibt   r0,#000A     ;
CODE_0A903B:         romb               ;
CODE_0A903D:         iwt   r14,#901E    ;
CODE_0A9040:         with r2            ;
CODE_0A9041:         sub   #08          ;
CODE_0A9043:         with r3            ;
CODE_0A9044:         sex                ;
CODE_0A9045:         with r4            ;
CODE_0A9046:         sex                ;
CODE_0A9047:         from r4            ;
CODE_0A9048:         to r3              ;
CODE_0A9049:         sub   r3           ;
CODE_0A904A:         iwt   r8,#3372     ;
CODE_0A904D:         iwt   r9,#3516     ;
CODE_0A9050:         cache              ;
CODE_0A9051:         ibt   r7,#0009     ;
CODE_0A9053:         getb               ;
CODE_0A9054:         inc   r14          ;
CODE_0A9055:         umult r3           ;
CODE_0A9057:         hib                ;
CODE_0A9058:         to r10             ;
CODE_0A9059:         sub   r4           ;
CODE_0A905A:         from r2            ;
CODE_0A905B:         sub   r10          ;
CODE_0A905C:         move  r11,r0       ;
CODE_0A905E:         add   r0           ;
CODE_0A905F:         add   r8           ;
CODE_0A9060:         ldw   (r0)         ;
CODE_0A9061:         add   r11          ;
CODE_0A9062:         add   #09          ;
CODE_0A9064:         to r12             ;
CODE_0A9065:         lob                ;
CODE_0A9066:         getbs              ;
CODE_0A9068:         move  r13,r0       ;
CODE_0A906A:         inc   r14          ;
CODE_0A906B:         umult r12          ;
CODE_0A906D:         add   r0           ;
CODE_0A906E:         hib                ;
CODE_0A906F:         add   r0           ;
CODE_0A9070:         sub   r12          ;
CODE_0A9071:         to r12             ;
CODE_0A9072:         div2               ;
CODE_0A9074:         from r9            ;
CODE_0A9075:         add   r11          ;
CODE_0A9076:         add   r11          ;
CODE_0A9077:         to r11             ;
CODE_0A9078:         ldw   (r0)         ;
CODE_0A9079:         iwt   r0,#0080     ;
CODE_0A907C:         sub   r11          ;
CODE_0A907D:         add   r12          ;
CODE_0A907E:         to r11             ;
CODE_0A907F:         sub   r1           ;
CODE_0A9080:         ibt   r0,#0040     ;
CODE_0A9082:         sub   r13          ;
CODE_0A9083:         bcs CODE_0A908C    ;
CODE_0A9085:         add   r13          ;
CODE_0A9086:         add   r0           ;
CODE_0A9087:         to r13             ;
CODE_0A9088:         sub   r13          ;
CODE_0A9089:         bcc CODE_0A908D    ;
CODE_0A908B:         sub   r0           ;
CODE_0A908C:         from r13           ;
CODE_0A908D:         umult r6           ;
CODE_0A908F:         add   r0           ;
CODE_0A9090:         hib                ;
CODE_0A9091:         with r10           ;
CODE_0A9092:         sub   r0           ;
CODE_0A9093:         to r12             ;
CODE_0A9094:         getb               ;
CODE_0A9095:         inc   r14          ;
CODE_0A9096:         move  r13,r15      ;
CODE_0A9098:         ldw   (r5)         ;
CODE_0A9099:         add   r11          ;
CODE_0A909A:         sbk                ;
CODE_0A909B:         inc   r5           ;
CODE_0A909C:         inc   r5           ;
CODE_0A909D:         ldw   (r5)         ;
CODE_0A909E:         sub   r10          ;
CODE_0A909F:         with r5            ;
CODE_0A90A0:         add   #06          ;
CODE_0A90A2:         loop               ;
CODE_0A90A3:         sbk                ;
CODE_0A90A4:         dec   r7           ;
CODE_0A90A5:         bne CODE_0A9054    ;
CODE_0A90A7:         getb               ;
CODE_0A90A8:         lms   r6,(0002)    ;
CODE_0A90AB:         iwt   r0,#2A00     ;
CODE_0A90AE:         to r7              ;
CODE_0A90AF:         fmult              ;
CODE_0A90B0:         ibt   r0,#0058     ;
CODE_0A90B2:         with r5            ;
CODE_0A90B3:         sub   r0           ;
CODE_0A90B4:         ldw   (r5)         ;
CODE_0A90B5:         sub   r7           ;
CODE_0A90B6:         sbk                ;
CODE_0A90B7:         ibt   r0,#0028     ;
CODE_0A90B9:         to r5              ;
CODE_0A90BA:         add   r5           ;
CODE_0A90BB:         ldw   (r5)         ;
CODE_0A90BC:         add   r7           ;
CODE_0A90BD:         ibt   r7,#0010     ;
CODE_0A90BF:         sub   r7           ;
CODE_0A90C0:         sbk                ;
CODE_0A90C1:         lms   r0,(0000)    ;
CODE_0A90C4:         sub   #00          ;
CODE_0A90C6:         bmi CODE_0A90FD    ;
CODE_0A90C8:         nop                ;
CODE_0A90C9:         ibt   r0,#0030     ;
CODE_0A90CB:         to r5              ;
CODE_0A90CC:         add   r5           ;
CODE_0A90CD:         iwt   r0,#008F     ;
CODE_0A90D0:         lmult              ;
CODE_0A90D2:         iwt   r0,#0080     ;
CODE_0A90D5:         add   r4           ;
CODE_0A90D6:         to r10             ;
CODE_0A90D7:         hib                ;
CODE_0A90D8:         from r8            ;
CODE_0A90D9:         add   r2           ;
CODE_0A90DA:         add   r2           ;
CODE_0A90DB:         ldw   (r0)         ;
CODE_0A90DC:         add   r2           ;
CODE_0A90DD:         add   #09          ;
CODE_0A90DF:         sub   r10          ;
CODE_0A90E0:         to r10             ;
CODE_0A90E1:         div2               ;
CODE_0A90E3:         from r9            ;
CODE_0A90E4:         add   r2           ;
CODE_0A90E5:         add   r2           ;
CODE_0A90E6:         to r11             ;
CODE_0A90E7:         ldw   (r0)         ;
CODE_0A90E8:         iwt   r0,#0080     ;
CODE_0A90EB:         sub   r11          ;
CODE_0A90EC:         sub   r1           ;
CODE_0A90ED:         to r11             ;
CODE_0A90EE:         add   r10          ;
CODE_0A90EF:         sms   (0000),r11   ;
CODE_0A90F2:         ibt   r12,#0004    ;
CODE_0A90F4:         move  r13,r15      ;
CODE_0A90F6:         ldw   (r5)         ;
CODE_0A90F7:         add   r11          ;
CODE_0A90F8:         with r5            ;
CODE_0A90F9:         add   #08          ;
CODE_0A90FB:         loop               ;
CODE_0A90FC:         sbk                ;
CODE_0A90FD:         stop               ;
CODE_0A90FE:         nop                ;

CODE_0A90FF:         romb               ;
CODE_0A9101:         with r14           ;
CODE_0A9102:         add   #04          ;
CODE_0A9104:         iwt   r1,#49CB     ;
CODE_0A9107:         ibt   r12,#000D    ;
CODE_0A9109:         iwt   r0,#0100     ;
CODE_0A910C:         sub   r7           ;
CODE_0A910D:         bmi CODE_0A9112    ;
CODE_0A910F:         add   r7           ;
CODE_0A9110:         move  r0,r7        ;
CODE_0A9112:         move  r8,r0        ;
CODE_0A9114:         from r7            ;
CODE_0A9115:         lsr                ;
CODE_0A9116:         lsr                ;
CODE_0A9117:         lsr                ;
CODE_0A9118:         to r7              ;
CODE_0A9119:         lsr                ;
CODE_0A911A:         ibt   r2,#FFB4     ;
CODE_0A911C:         ibt   r3,#0000     ;
CODE_0A911E:         ibt   r9,#0038     ;
CODE_0A9120:         cache              ;
CODE_0A9121:         move  r13,r15      ;
CODE_0A9123:         getb               ;
CODE_0A9124:         inc   r14          ;
CODE_0A9125:         swap               ;
CODE_0A9126:         move  r6,r8        ;
CODE_0A9128:         fmult              ;
CODE_0A9129:         stb   (r1)         ;
CODE_0A912B:         getbs              ;
CODE_0A912D:         sub   r9           ;
CODE_0A912E:         move  r6,r7        ;
CODE_0A9130:         lmult              ;
CODE_0A9132:         with r4            ;
CODE_0A9133:         hib                ;
CODE_0A9134:         lob                ;
CODE_0A9135:         swap               ;
CODE_0A9136:         or    r4           ;
CODE_0A9137:         add   r9           ;
CODE_0A9138:         to r4              ;
CODE_0A9139:         sub   r2           ;
CODE_0A913A:         bpl CODE_0A9152    ;
CODE_0A913C:         inc   r14          ;
CODE_0A913D:         from r2            ;
CODE_0A913E:         sub   r3           ;
CODE_0A913F:         bpl CODE_0A9150    ;
CODE_0A9141:         from r1            ;
CODE_0A9142:         to r5              ;
CODE_0A9143:         sub   #02          ;
CODE_0A9145:         to r3              ;
CODE_0A9146:         ldb   (r5)         ;
CODE_0A9148:         from r4            ;
CODE_0A9149:         not                ;
CODE_0A914A:         inc   r0           ;
CODE_0A914B:         lsr                ;
CODE_0A914C:         lsr                ;
CODE_0A914D:         add   r3           ;
CODE_0A914E:         stb   (r5)         ;
CODE_0A9150:         move  r0,r2        ;
CODE_0A9152:         inc   r1           ;
CODE_0A9153:         stb   (r1)         ;
CODE_0A9155:         move  r3,r0        ;
CODE_0A9157:         loop               ;
CODE_0A9158:         inc   r1           ;
CODE_0A9159:         iwt   r10,#0100    ;
CODE_0A915C:         from r10           ;
CODE_0A915D:         sub   r7           ;
CODE_0A915E:         add   r0           ;
CODE_0A915F:         add   r0           ;
CODE_0A9160:         sub   r10          ;
CODE_0A9161:         bcc CODE_0A9166    ;
CODE_0A9163:         add   r10          ;
CODE_0A9164:         move  r0,r10       ;
CODE_0A9166:         move  r6,r0        ;
CODE_0A9168:         iwt   r0,#4700     ;
CODE_0A916B:         fmult              ;
CODE_0A916C:         ibt   r3,#0038     ;
CODE_0A916E:         add   r3           ;
CODE_0A916F:         iwt   r1,#49C8     ;
CODE_0A9172:         stb   (r1)         ;
CODE_0A9174:         iwt   r0,#0800     ;
CODE_0A9177:         fmult              ;
CODE_0A9178:         to r3              ;
CODE_0A9179:         add   r3           ;
CODE_0A917A:         iwt   r0,#0100     ;
CODE_0A917D:         sub   r8           ;
CODE_0A917E:         iwt   r6,#1000     ;
CODE_0A9181:         fmult              ;
CODE_0A9182:         add   r3           ;
CODE_0A9183:         inc   r1           ;
CODE_0A9184:         inc   r1           ;
CODE_0A9185:         stb   (r1)         ;
CODE_0A9187:         iwt   r2,#49E6     ;
CODE_0A918A:         stb   (r2)         ;
CODE_0A918C:         ibt   r0,#0020     ;
CODE_0A918E:         sub   r8           ;
CODE_0A918F:         bpl CODE_0A9194    ;
CODE_0A9191:         add   r8           ;
CODE_0A9192:         move  r0,r8        ;
CODE_0A9194:         iwt   r6,#4000     ;
CODE_0A9197:         fmult              ;
CODE_0A9198:         dec   r2           ;
CODE_0A9199:         stb   (r2)         ;
CODE_0A919B:         not                ;
CODE_0A919C:         inc   r0           ;
CODE_0A919D:         dec   r1           ;
CODE_0A919E:         stb   (r1)         ;
CODE_0A91A0:         stop               ;
CODE_0A91A1:         nop                ;

CODE_0A91A2:         with r2            ;
CODE_0A91A3:         sub   #08          ;
CODE_0A91A5:         from r2            ;
CODE_0A91A6:         add   r2           ;
CODE_0A91A7:         iwt   r8,#3372     ;
CODE_0A91AA:         add   r8           ;
CODE_0A91AB:         ldw   (r0)         ;
CODE_0A91AC:         add   r2           ;
CODE_0A91AD:         add   #09          ;
CODE_0A91AF:         lob                ;
CODE_0A91B0:         move  r12,r0       ;
CODE_0A91B2:         umult r3           ;
CODE_0A91B4:         hib                ;
CODE_0A91B5:         add   r0           ;
CODE_0A91B6:         sub   r12          ;
CODE_0A91B7:         to r12             ;
CODE_0A91B8:         div2               ;
CODE_0A91BA:         iwt   r0,#3516     ;
CODE_0A91BD:         add   r2           ;
CODE_0A91BE:         add   r2           ;
CODE_0A91BF:         to r11             ;
CODE_0A91C0:         ldw   (r0)         ;
CODE_0A91C1:         iwt   r0,#0080     ;
CODE_0A91C4:         sub   r11          ;
CODE_0A91C5:         add   r12          ;
CODE_0A91C6:         sub   r1           ;
CODE_0A91C7:         stop               ;
CODE_0A91C8:         nop                ;

CODE_0A91C9:         sub   r0           ;
CODE_0A91CA:         move  r7,r0        ;
CODE_0A91CC:         ibt   r12,#0020    ;
CODE_0A91CE:         iwt   r13,#91D2    ;
CODE_0A91D1:         with r7            ;
CODE_0A91D2:         add   r7           ;
CODE_0A91D3:         with r4            ;
CODE_0A91D4:         add   r4           ;
CODE_0A91D5:         rol                ;
CODE_0A91D6:         sub   r6           ;
CODE_0A91D7:         bcc CODE_0A91DC    ;
CODE_0A91D9:         add   r6           ;
CODE_0A91DA:         sub   r6           ;
CODE_0A91DB:         inc   r7           ;
CODE_0A91DC:         loop               ;
CODE_0A91DD:         with r7            ;
CODE_0A91DE:         stop               ;
CODE_0A91DF:         nop                ;

CODE_0A91E0:         ibt   r0,#0008     ;
CODE_0A91E2:         romb               ;
CODE_0A91E4:         from r1            ;
CODE_0A91E5:         lsr                ;
CODE_0A91E6:         lsr                ;
CODE_0A91E7:         lsr                ;
CODE_0A91E8:         lsr                ;
CODE_0A91E9:         lob                ;
CODE_0A91EA:         to r7              ;
CODE_0A91EB:         umult r2           ;
CODE_0A91ED:         from r1            ;
CODE_0A91EE:         and   #0F          ;
CODE_0A91F0:         add   r0           ;
CODE_0A91F1:         umult #08          ;
CODE_0A91F3:         iwt   r14,#AE18    ;
CODE_0A91F6:         to r14             ;
CODE_0A91F7:         add   r14          ;
CODE_0A91F8:         getbs              ;
CODE_0A91FA:         add   r0           ;
CODE_0A91FB:         to r6              ;
CODE_0A91FC:         add   r0           ;
CODE_0A91FD:         from r7            ;
CODE_0A91FE:         to r1              ;
CODE_0A91FF:         fmult              ;
CODE_0A9200:         from r5            ;
CODE_0A9201:         lmult              ;
CODE_0A9203:         with r4            ;
CODE_0A9204:         hib                ;
CODE_0A9205:         lob                ;
CODE_0A9206:         swap               ;
CODE_0A9207:         to r3              ;
CODE_0A9208:         or    r4           ;
CODE_0A9209:         ibt   r0,#0040     ;
CODE_0A920B:         to r14             ;
CODE_0A920C:         add   r14          ;
CODE_0A920D:         getbs              ;
CODE_0A920F:         add   r0           ;
CODE_0A9210:         to r6              ;
CODE_0A9211:         add   r0           ;
CODE_0A9212:         from r7            ;
CODE_0A9213:         to r2              ;
CODE_0A9214:         fmult              ;
CODE_0A9215:         from r5            ;
CODE_0A9216:         lmult              ;
CODE_0A9218:         with r4            ;
CODE_0A9219:         hib                ;
CODE_0A921A:         lob                ;
CODE_0A921B:         swap               ;
CODE_0A921C:         to r4              ;
CODE_0A921D:         or    r4           ;
CODE_0A921E:         stop               ;
CODE_0A921F:         nop                ;

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

CODE_0ACD1E:         ibt   r0,#000A     ;
CODE_0ACD20:         romb               ;
CODE_0ACD22:         move  r8,r1        ;
CODE_0ACD24:         move  r0,r2        ;
CODE_0ACD26:         link  #04          ;
CODE_0ACD27:         iwt   r15,#D095    ;
CODE_0ACD2A:         cache              ;
CODE_0ACD2B:         from r6            ;
CODE_0ACD2C:         lob                ;
CODE_0ACD2D:         iwt   r3,#CD0A     ;
CODE_0ACD30:         to r14             ;
CODE_0ACD31:         add   r3           ;
CODE_0ACD32:         getb               ;
CODE_0ACD33:         to r14             ;
CODE_0ACD34:         and   #04          ;
CODE_0ACD36:         beq CODE_0ACD89    ;
CODE_0ACD38:         nop                ;
CODE_0ACD39:         ibt   r9,#0000     ;
CODE_0ACD3B:         ibt   r10,#0000    ;
CODE_0ACD3D:         ibt   r4,#0010     ;
CODE_0ACD3F:         to r14             ;
CODE_0ACD40:         and   #08          ;
CODE_0ACD42:         beq CODE_0ACD46    ;
CODE_0ACD44:         nop                ;
CODE_0ACD45:         dec   r10          ;
CODE_0ACD46:         and   #03          ;
CODE_0ACD48:         bne CODE_0ACD6F    ;
CODE_0ACD4A:         dec   r0           ;
CODE_0ACD4B:         with r9            ;
CODE_0ACD4C:         add   r4           ;
CODE_0ACD4D:         from r1            ;
CODE_0ACD4E:         to r8              ;
CODE_0ACD4F:         add   r9           ;
CODE_0ACD50:         move  r0,r2        ;
CODE_0ACD52:         link  #04          ;
CODE_0ACD53:         iwt   r15,#D096    ;
CODE_0ACD56:         lm    r0,(F800)    ;
CODE_0ACD5A:         and   r7           ;
CODE_0ACD5B:         iwt   r7,#7000     ;
CODE_0ACD5E:         sub   r7           ;
CODE_0ACD5F:         bne CODE_0ACD89    ;
CODE_0ACD61:         from r6            ;
CODE_0ACD62:         lob                ;
CODE_0ACD63:         to r14             ;
CODE_0ACD64:         add   r3           ;
CODE_0ACD65:         getb               ;
CODE_0ACD66:         and   #02          ;
CODE_0ACD68:         beq CODE_0ACD4C    ;
CODE_0ACD6A:         with r9            ;
CODE_0ACD6B:         with  r9           ;
CODE_0ACD6B:         with r1            ;
CODE_0ACD6C:         with  r1           ;
CODE_0ACD6C:         bra CODE_0ACD9D    ;

CODE_0ACD6E:         add   r9           ;

CODE_0ACD6F:         bne CODE_0ACD9A    ;
CODE_0ACD71:         dec   r0           ;
CODE_0ACD72:         with r9            ;
CODE_0ACD73:         add   r4           ;
CODE_0ACD74:         from r1            ;
CODE_0ACD75:         to r8              ;
CODE_0ACD76:         add   r9           ;
CODE_0ACD77:         move  r0,r2        ;
CODE_0ACD79:         link  #04          ;
CODE_0ACD7A:         iwt   r15,#D096    ;
CODE_0ACD7D:         lm    r0,(F800)    ;
CODE_0ACD81:         and   r7           ;
CODE_0ACD82:         iwt   r7,#7000     ;
CODE_0ACD85:         sub   r7           ;
CODE_0ACD86:         beq CODE_0ACD8E    ;
CODE_0ACD88:         from r6            ;
CODE_0ACD89:         ibt   r9,#0000     ;
CODE_0ACD8B:         sub   r0           ;
CODE_0ACD8C:         stop               ;
CODE_0ACD8D:         nop                ;
CODE_0ACD8E:         lob                ;
CODE_0ACD8F:         to r14             ;
CODE_0ACD90:         add   r3           ;
CODE_0ACD91:         getb               ;
CODE_0ACD92:         and   #02          ;
CODE_0ACD94:         beq CODE_0ACD73    ;
CODE_0ACD96:         with r9            ;
CODE_0ACD97:         with  r9           ;
CODE_0ACD97:         bra CODE_0ACDBF    ;

CODE_0ACD99:         nop                ;
CODE_0ACD9A:         bne CODE_0ACDBF    ;
CODE_0ACD9C:         nop                ;
CODE_0ACD9D:         with r9            ;
CODE_0ACD9E:         add   r4           ;
CODE_0ACD9F:         from r1            ;
CODE_0ACDA0:         to r8              ;
CODE_0ACDA1:         sub   r9           ;
CODE_0ACDA2:         move  r0,r2        ;
CODE_0ACDA4:         link  #04          ;
CODE_0ACDA5:         iwt   r15,#D096    ;
CODE_0ACDA8:         lm    r0,(F800)    ;
CODE_0ACDAC:         and   r7           ;
CODE_0ACDAD:         iwt   r7,#7000     ;
CODE_0ACDB0:         sub   r7           ;
CODE_0ACDB1:         bne CODE_0ACD89    ;
CODE_0ACDB3:         from r6            ;
CODE_0ACDB4:         lob                ;
CODE_0ACDB5:         to r14             ;
CODE_0ACDB6:         add   r3           ;
CODE_0ACDB7:         getb               ;
CODE_0ACDB8:         and   #01          ;
CODE_0ACDBA:         beq CODE_0ACD9E    ;
CODE_0ACDBC:         with r9            ;
CODE_0ACDBD:         with r1            ;
CODE_0ACDBE:         sub   r9           ;
CODE_0ACDBF:         inc   r10          ;
CODE_0ACDC0:         beq CODE_0ACDE3    ;
CODE_0ACDC2:         nop                ;
CODE_0ACDC3:         dec   r10          ;
CODE_0ACDC4:         with r10           ;
CODE_0ACDC5:         add   r4           ;
CODE_0ACDC6:         move  r8,r1        ;
CODE_0ACDC8:         from r2            ;
CODE_0ACDC9:         add   r10          ;
CODE_0ACDCA:         link  #04          ;
CODE_0ACDCB:         iwt   r15,#D096    ;
CODE_0ACDCE:         lm    r0,(F800)    ;
CODE_0ACDD2:         and   r7           ;
CODE_0ACDD3:         iwt   r7,#7000     ;
CODE_0ACDD6:         sub   r7           ;
CODE_0ACDD7:         bne CODE_0ACD89    ;
CODE_0ACDD9:         from r6            ;
CODE_0ACDDA:         lob                ;
CODE_0ACDDB:         to r14             ;
CODE_0ACDDC:         add   r3           ;
CODE_0ACDDD:         getb               ;
CODE_0ACDDE:         and   #08          ;
CODE_0ACDE0:         beq CODE_0ACDC4    ;
CODE_0ACDE2:         nop                ;
CODE_0ACDE3:         from r9            ;
CODE_0ACDE4:         lsr                ;
CODE_0ACDE5:         to r1              ;
CODE_0ACDE6:         add   r1           ;
CODE_0ACDE7:         from r10           ;
CODE_0ACDE8:         lsr                ;
CODE_0ACDE9:         to r2              ;
CODE_0ACDEA:         add   r2           ;
CODE_0ACDEB:         with r9            ;
CODE_0ACDEC:         add   r4           ;
CODE_0ACDED:         with r10           ;
CODE_0ACDEE:         add   r4           ;
CODE_0ACDEF:         move  r6,r10       ;
CODE_0ACDF1:         from r9            ;
CODE_0ACDF2:         lmult              ;
CODE_0ACDF4:         from r4            ;
CODE_0ACDF5:         to r3              ;
CODE_0ACDF6:         hib                ;
CODE_0ACDF7:         sub   r0           ;
CODE_0ACDF8:         stop               ;
CODE_0ACDF9:         nop                ;

CODE_0ACDFA:         ibt   r0,#000A     ;
CODE_0ACDFC:         romb               ;
CODE_0ACDFE:         from r1            ;
CODE_0ACDFF:         to r8              ;
CODE_0ACE00:         add   r3           ;
CODE_0ACE01:         from r2            ;
CODE_0ACE02:         add   r4           ;
CODE_0ACE03:         link  #04          ;
CODE_0ACE04:         iwt   r15,#D095    ;
CODE_0ACE07:         cache              ;
CODE_0ACE08:         and   #02          ;
CODE_0ACE0A:         bne CODE_0ACE28    ;
CODE_0ACE0C:         nop                ;
CODE_0ACE0D:         ibt   r12,#000F    ;
CODE_0ACE0F:         move  r13,r15      ;
CODE_0ACE11:         lms   r1,(0000)    ;
CODE_0ACE14:         from r1            ;
CODE_0ACE15:         to r8              ;
CODE_0ACE16:         add   r3           ;
CODE_0ACE17:         lms   r2,(0002)    ;
CODE_0ACE1A:         from r2            ;
CODE_0ACE1B:         add   r4           ;
CODE_0ACE1C:         link  #04          ;
CODE_0ACE1D:         iwt   r15,#D096    ;
CODE_0ACE20:         and   #02          ;
CODE_0ACE23:         bne CODE_0ACE2C    ;
CODE_0ACE25:         nop                ;
CODE_0ACE26:         loop               ;
CODE_0ACE27:         nop                ;
CODE_0ACE28:         ibt   r1,#FFFF     ;
CODE_0ACE2A:         ibt   r2,#FFFF     ;
CODE_0ACE2C:         sub   r0           ;
CODE_0ACE2D:         stop               ;
CODE_0ACE2E:         nop                ;

CODE_0ACE2F:         ibt   r7,#000A     ;
CODE_0ACE31:         from r7            ;
CODE_0ACE32:         romb               ;
CODE_0ACE34:         link  #04          ;
CODE_0ACE35:         iwt   r15,#D096    ;
CODE_0ACE38:         and   #02          ;
CODE_0ACE3C:         sub   r0           ;
CODE_0ACE3D:         stop               ;
CODE_0ACE3E:         nop                ;

CODE_0ACE3F:         ibt   r0,#000A     ;
CODE_0ACE41:         romb               ;
CODE_0ACE43:         cache              ;
CODE_0ACE44:         ibt   r12,#0007    ;
CODE_0ACE46:         move  r13,r15      ;
CODE_0ACE48:         move  r8,r2        ;
CODE_0ACE4A:         move  r0,r3        ;
CODE_0ACE4C:         link  #04          ;
CODE_0ACE4D:         iwt   r15,#D096    ;
CODE_0ACE50:         and   #03          ;
CODE_0ACE53:         bne CODE_0ACE76    ;
CODE_0ACE55:         nop                ;
CODE_0ACE56:         with r3            ;
CODE_0ACE57:         sub   #0F          ;
CODE_0ACE59:         dec   r3           ;
CODE_0ACE5A:         with r14           ;
CODE_0ACE5B:         add   #0F          ;
CODE_0ACE5D:         loop               ;
CODE_0ACE5E:         inc   r14          ;
CODE_0ACE5F:         lms   r0,(0020)    ;
CODE_0ACE62:         dec   r0           ;
CODE_0ACE63:         beq CODE_0ACE71    ;
CODE_0ACE65:         sbk                ;
CODE_0ACE66:         ibt   r3,#0004     ;
CODE_0ACE68:         from r3            ;
CODE_0ACE69:         to r14             ;
CODE_0ACE6A:         sub   r0           ;
CODE_0ACE6B:         with r2            ;
CODE_0ACE6C:         add   r4           ;
CODE_0ACE6D:         with r10           ;
CODE_0ACE6E:         with  r10          ;
CODE_0ACE6E:         bra CODE_0ACE44    ;

CODE_0ACE70:         to r3              ;
CODE_0ACE71:         ibt   r14,#FFF0    ;
CODE_0ACE73:         sub   r0           ;
CODE_0ACE74:         stop               ;
CODE_0ACE75:         nop                ;

CODE_0ACE76:         move  r13,r15      ;
CODE_0ACE78:         with r3            ;
CODE_0ACE79:         sub   #0F          ;
CODE_0ACE7B:         dec   r3           ;
CODE_0ACE7C:         move  r8,r2        ;
CODE_0ACE7E:         move  r0,r3        ;
CODE_0ACE80:         link  #04          ;
CODE_0ACE81:         iwt   r15,#D096    ;
CODE_0ACE84:         and   #02          ;
CODE_0ACE87:         beq CODE_0ACE74    ;
CODE_0ACE89:         sub   r0           ;
CODE_0ACE8A:         with r14           ;
CODE_0ACE8B:         add   #0F          ;
CODE_0ACE8D:         loop               ;
CODE_0ACE8E:         inc   r14          ;
CODE_0ACE8F:         bra CODE_0ACE5F    ;

CODE_0ACE91:         nop                ;

CODE_0ACE92:         ibt   r0,#000A     ;
CODE_0ACE94:         romb               ;
CODE_0ACE96:         cache              ;
CODE_0ACE97:         move  r13,r15      ;
CODE_0ACE99:         move  r8,r2        ;
CODE_0ACE9B:         move  r0,r3        ;
CODE_0ACE9D:         link  #04          ;
CODE_0ACE9E:         iwt   r15,#D096    ;
CODE_0ACEA1:         and   #02          ;
CODE_0ACEA4:         beq CODE_0ACEC9    ;
CODE_0ACEA6:         with r3            ;
CODE_0ACEA7:         add   r4           ;
CODE_0ACEA8:         loop               ;
CODE_0ACEA9:         inc   r14          ;
CODE_0ACEAA:         ibt   r14,#0010    ;
CODE_0ACEAC:         lms   r12,(0058)   ;
CODE_0ACEAF:         dec   r12          ;
CODE_0ACEB0:         move  r2,r9        ;
CODE_0ACEB2:         move  r3,r10       ;
CODE_0ACEB4:         move  r13,r15      ;
CODE_0ACEB6:         move  r8,r2        ;
CODE_0ACEB8:         move  r0,r3        ;
CODE_0ACEBA:         link  #04          ;
CODE_0ACEBB:         iwt   r15,#D096    ;
CODE_0ACEBE:         and   #01          ;
CODE_0ACEC1:         bne CODE_0ACEC9    ;
CODE_0ACEC3:         with r3            ;
CODE_0ACEC4:         add   r4           ;
CODE_0ACEC5:         loop               ;
CODE_0ACEC6:         inc   r14          ;
CODE_0ACEC7:         ibt   r14,#FFF0    ;
CODE_0ACEC9:         stop               ;
CODE_0ACECA:         nop                ;

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

CODE_0ACFED:         ibt   r0,#000A     ;
CODE_0ACFEF:         romb               ;
CODE_0ACFF1:         ibt   r1,#0000     ;
CODE_0ACFF3:         ibt   r12,#0028    ;
CODE_0ACFF5:         cache              ;
CODE_0ACFF6:         move  r13,r15      ;
CODE_0ACFF8:         iwt   r0,#0EC3     ;
CODE_0ACFFB:         add   r1           ;
CODE_0ACFFC:         ldb   (r0)         ;
CODE_0ACFFE:         moves r2,r0        ;
CODE_0AD000:         beq CODE_0AD00D    ;
CODE_0AD002:         nop                ;
CODE_0AD003:         iwt   r0,#1820     ;
CODE_0AD006:         add   r1           ;
CODE_0AD007:         ldw   (r0)         ;
CODE_0AD008:         bic   #01          ;
CODE_0AD00A:         sbk                ;
CODE_0AD00B:         ibt   r2,#0000     ;
CODE_0AD00D:         iwt   r0,#0EC2     ;
CODE_0AD010:         add   r1           ;
CODE_0AD011:         from r2            ;
CODE_0AD012:         stw   (r0)         ;
CODE_0AD013:         iwt   r0,#0EC0     ;
CODE_0AD016:         add   r1           ;
CODE_0AD017:         ldw   (r0)         ;
CODE_0AD018:         sub   #0E          ;
CODE_0AD01A:         bcc CODE_0AD07E    ;
CODE_0AD01C:         nop                ;
CODE_0AD01D:         iwt   r0,#0F62     ;
CODE_0AD020:         add   r1           ;
CODE_0AD021:         ldw   (r0)         ;
CODE_0AD022:         ibt   r7,#001F     ;
CODE_0AD024:         and   r7           ;
CODE_0AD025:         beq CODE_0AD07E    ;
CODE_0AD027:         add   r0           ;
CODE_0AD028:         iwt   r14,#CEC9    ;
CODE_0AD02B:         to r14             ;
CODE_0AD02C:         add   r14          ;
CODE_0AD02D:         iwt   r0,#10A2     ;
CODE_0AD030:         add   r1           ;
CODE_0AD031:         to r9              ;
CODE_0AD032:         ldw   (r0)         ;
CODE_0AD033:         to r7              ;
CODE_0AD034:         getb               ;
CODE_0AD035:         inc   r14          ;
CODE_0AD036:         iwt   r0,#1142     ;
CODE_0AD039:         add   r1           ;
CODE_0AD03A:         to r10             ;
CODE_0AD03B:         ldw   (r0)         ;
CODE_0AD03C:         iwt   r0,#16E0     ;
CODE_0AD03F:         add   r1           ;
CODE_0AD040:         ldw   (r0)         ;
CODE_0AD041:         to r10             ;
CODE_0AD042:         add   r10          ;
CODE_0AD043:         getb               ;
CODE_0AD044:         add   r0           ;
CODE_0AD045:         iwt   r14,#CF09    ;
CODE_0AD048:         to r14             ;
CODE_0AD049:         add   r14          ;
CODE_0AD04A:         from r7            ;
CODE_0AD04B:         add   r7           ;
CODE_0AD04C:         add   r7           ;
CODE_0AD04D:         inc   r0           ;
CODE_0AD04E:         to r15             ;
CODE_0AD04F:         add   r15          ;
CODE_0AD050:         iwt   r15,#D642    ;
CODE_0AD053:         nop                ;

DATA_0AD054:         db $1C, $D5, $01, $1B, $D6, $01, $4B, $D6
DATA_0AD05C:         db $01, $69, $D6, $01, $0F, $E2, $01, $59
DATA_0AD064:         db $E4, $01, $C5, $E3, $01, $BA, $E4, $01
DATA_0AD06C:         db $9F, $DD, $01, $79, $D6, $01, $91, $DD
DATA_0AD074:         db $01, $85, $E3, $01, $48, $E1, $01, $80
DATA_0AD07C:         db $E5, $01, $D1

CODE_0AD07F:         iwt   r0,#181F     ;
CODE_0AD082:         add   r1           ;
CODE_0AD083:         from r2            ;
CODE_0AD084:         stw   (r0)         ;
CODE_0AD085:         inc   r1           ;
CODE_0AD086:         inc   r1           ;
CODE_0AD087:         loop               ;
CODE_0AD088:         inc   r1           ;
CODE_0AD089:         sub   r0           ;
CODE_0AD08A:         stop               ;
CODE_0AD08B:         nop                ;

CODE_0AD08C:         getbs              ;
CODE_0AD08E:         inc   r14          ;
CODE_0AD08F:         to r8              ;
CODE_0AD090:         add   r9           ;
CODE_0AD091:         getbs              ;
CODE_0AD093:         inc   r14          ;
CODE_0AD094:         add   r10          ;
CODE_0AD095:         lms   r6,(01CA)    ;
CODE_0AD098:         dec   r6           ;
CODE_0AD099:         to r7              ;
CODE_0AD09A:         to    r7           ;
CODE_0AD09A:         bmi CODE_0AD0A1    ;
CODE_0AD09C:         add   r0           ;
CODE_0AD09D:         iwt   r15,#D134    ;
CODE_0AD0A0:         nop                ;
CODE_0AD0A1:         lms   r5,(00A6)    ;
CODE_0AD0A4:         sub   r5           ;
CODE_0AD0A5:         iwt   r5,#00E0     ;
CODE_0AD0A8:         sub   r5           ;
CODE_0AD0A9:         lms   r5,(00A4)    ;
CODE_0AD0AC:         bcs CODE_0AD0C8    ;
CODE_0AD0AE:         from r8            ;
CODE_0AD0AF:         sub   r5           ;
CODE_0AD0B0:         hib                ;
CODE_0AD0B1:         bne CODE_0AD0C8    ;
CODE_0AD0B3:         from r8            ;
CODE_0AD0B4:         lsr                ;
CODE_0AD0B5:         lsr                ;
CODE_0AD0B6:         lsr                ;
CODE_0AD0B7:         ibt   r5,#003E     ;
CODE_0AD0B9:         to r5              ;
CODE_0AD0BA:         and   r5           ;
CODE_0AD0BB:         iwt   r0,#01E0     ;
CODE_0AD0BE:         and   r7           ;
CODE_0AD0BF:         add   r0           ;
CODE_0AD0C0:         or    r5           ;
CODE_0AD0C1:         iwt   r5,#409E     ;
CODE_0AD0C4:         add   r5           ;
CODE_0AD0C5:         bra CODE_0AD0F2    ;

CODE_0AD0C7:         ldw   (r0)         ;

CODE_0AD0C8:         merge              ;
CODE_0AD0C9:         beq CODE_0AD12F    ;
CODE_0AD0CB:         to r6              ;
CODE_0AD0CC:         lob                ;
CODE_0AD0CD:         hib                ;
CODE_0AD0CE:         and   #0E          ;
CODE_0AD0D0:         umult #08          ;
CODE_0AD0D2:         or    r6           ;
CODE_0AD0D3:         iwt   r6,#0CAA     ;
CODE_0AD0D6:         add   r6           ;
CODE_0AD0D7:         ldb   (r0)         ;
CODE_0AD0D9:         ibt   r6,#003F     ;
CODE_0AD0DB:         and   r6           ;
CODE_0AD0DC:         to r6              ;
CODE_0AD0DD:         swap               ;
CODE_0AD0DE:         iwt   r0,#01E0     ;
CODE_0AD0E1:         to r5              ;
CODE_0AD0E2:         and   r7           ;
CODE_0AD0E3:         from r8            ;
CODE_0AD0E4:         lob                ;
CODE_0AD0E5:         lsr                ;
CODE_0AD0E6:         lsr                ;
CODE_0AD0E7:         lsr                ;
CODE_0AD0E8:         or    r5           ;
CODE_0AD0E9:         lsr                ;
CODE_0AD0EA:         or    r6           ;
CODE_0AD0EB:         add   r0           ;
CODE_0AD0EC:         iwt   r6,#8000     ;
CODE_0AD0EF:         add   r6           ;
CODE_0AD0F0:         stop               ;
CODE_0AD0F1:         nop                ;

CODE_0AD0F2:         move  r6,r0        ;
CODE_0AD0F4:         hib                ;
CODE_0AD0F5:         umult #03          ;
CODE_0AD0F7:         move  r5,r14       ;
CODE_0AD0F9:         iwt   r14,#BB12    ;
CODE_0AD0FC:         to r14             ;
CODE_0AD0FD:         add   r14          ;
CODE_0AD0FE:         sms   (0000),r8    ;
CODE_0AD101:         getb               ;
CODE_0AD102:         inc   r14          ;
CODE_0AD103:         with r7            ;
CODE_0AD104:         asr                ;
CODE_0AD105:         sms   (0002),r7    ;
CODE_0AD108:         ibt   r8,#FFF8     ;
CODE_0AD10A:         getbh              ;
CODE_0AD10C:         inc   r14          ;
CODE_0AD10D:         move  r7,r0        ;
CODE_0AD10F:         hib                ;
CODE_0AD110:         and   r8           ;
CODE_0AD111:         ibt   r8,#0072     ;
CODE_0AD113:         sub   r8           ;
CODE_0AD114:         sub   #0F          ;
CODE_0AD116:         bcs CODE_0AD128    ;
CODE_0AD118:         to r8              ;
CODE_0AD119:         ibt   r8,#0011     ;
CODE_0AD11B:         add   r8           ;
CODE_0AD11C:         lm    r8,(1E08)    ;
CODE_0AD120:         and   r8           ;
CODE_0AD121:         beq CODE_0AD128    ;
CODE_0AD123:         to r8              ;
CODE_0AD124:         with r7            ;
CODE_0AD125:         or    #02          ;
CODE_0AD127:         to r8              ;
CODE_0AD128:         getb               ;
CODE_0AD129:         move  r0,r7        ;
CODE_0AD12B:         move  r14,r5       ;
CODE_0AD12D:         jmp   r11          ;
CODE_0AD12E:         nop                ;

CODE_0AD12F:         ibt   r6,#0001     ;
CODE_0AD131:         bra CODE_0AD0F7    ;

CODE_0AD133:         sub   r0           ;

CODE_0AD134:         lm    r0,(0094)    ;
CODE_0AD138:         bic   #07          ;
CODE_0AD13A:         from r8            ;
CODE_0AD13B:         sub   r0           ;
CODE_0AD13C:         bpl CODE_0AD140    ;
CODE_0AD13E:         lsr                ;
CODE_0AD13F:         sub   r0           ;
CODE_0AD140:         lsr                ;
CODE_0AD141:         ibt   r5,#0042     ;
CODE_0AD143:         sub   r5           ;
CODE_0AD144:         bcc CODE_0AD149    ;
CODE_0AD146:         add   r5           ;
CODE_0AD147:         ibt   r0,#0040     ;
CODE_0AD149:         lsr                ;
CODE_0AD14A:         bne CODE_0AD154    ;
CODE_0AD14C:         add   r0           ;
CODE_0AD14D:         lm    r0,(1EF0)    ;
CODE_0AD151:         bra CODE_0AD15A    ;

CODE_0AD153:         iwt   r5,#30F5     ;
CODE_0AD156:         to r15             ;
CODE_0AD157:         add   r5           ;
CODE_0AD158:         ldw   (r0)         ;
CODE_0AD159:         iwt   r5,#1FFF     ;
CODE_0AD15C:         and   r5           ;
CODE_0AD15D:         lm    r5,(009C)    ;
CODE_0AD161:         sub   r5           ;
CODE_0AD162:         add   r0           ;
CODE_0AD163:         to r7              ;
CODE_0AD164:         add   r7           ;
CODE_0AD165:         iwt   r15,#D0A2    ;
CODE_0AD168:         lms   r11,(0060)   ;
CODE_0AD16B:         iwt   r0,#11E2     ;
CODE_0AD16E:         add   r1           ;
CODE_0AD16F:         ldw   (r0)         ;
CODE_0AD170:         xor   r3           ;
CODE_0AD172:         bmi CODE_0AD177    ;
CODE_0AD174:         nop                ;
CODE_0AD175:         jmp   r11          ;
CODE_0AD176:         nop                ;
CODE_0AD177:         moves r3,r3        ;
CODE_0AD179:         bmi CODE_0AD17F    ;
CODE_0AD17B:         sub   r0           ;
CODE_0AD17C:         iwt   r0,#0080     ;
CODE_0AD17F:         sms   (0010),r0    ;
CODE_0AD182:         from r9            ;
CODE_0AD183:         to r8              ;
CODE_0AD184:         add   #08          ;
CODE_0AD186:         iwt   r6,#0F00     ;
CODE_0AD189:         iwt   r5,#0040     ;
CODE_0AD18C:         from r1            ;
CODE_0AD18D:         to r5              ;
CODE_0AD18E:         sub   r5           ;
CODE_0AD18F:         iwt   r0,#1A36     ;
CODE_0AD192:         add   r5           ;
CODE_0AD193:         ldw   (r0)         ;
CODE_0AD194:         lsr                ;
CODE_0AD195:         lsr                ;
CODE_0AD196:         lsr                ;
CODE_0AD197:         fmult              ;
CODE_0AD198:         add   r10          ;
CODE_0AD199:         add   #08          ;
CODE_0AD19B:         link  #04          ;
CODE_0AD19C:         iwt   r15,#D096    ;
CODE_0AD19F:         alt1               ;
CODE_0AD1A0:         bra CODE_0AD1C7    ;

CODE_0AD1A2:         nop                ;
CODE_0AD1A3:         ibt   r11,#0030    ;
CODE_0AD1A5:         iwt   r0,#11E2     ;
CODE_0AD1A8:         add   r1           ;
CODE_0AD1A9:         ldw   (r0)         ;
CODE_0AD1AA:         xor   r3           ;
CODE_0AD1AC:         bmi CODE_0AD1B7    ;
CODE_0AD1AE:         nop                ;
CODE_0AD1AF:         inc   r14          ;
CODE_0AD1B0:         inc   r14          ;
CODE_0AD1B1:         ibt   r7,#0000     ;
CODE_0AD1B3:         jmp   r11          ;
CODE_0AD1B4:         nop                ;
CODE_0AD1B5:         ibt   r11,#0030    ;
CODE_0AD1B7:         moves r3,r3        ;
CODE_0AD1B9:         bmi CODE_0AD1BF    ;
CODE_0AD1BB:         sub   r0           ;
CODE_0AD1BC:         iwt   r0,#0080     ;
CODE_0AD1BF:         sms   (0010),r0    ;
CODE_0AD1C2:         link  #04          ;
CODE_0AD1C3:         iwt   r15,#D08D    ;
CODE_0AD1C6:         lms   r0,(0002)    ;
CODE_0AD1CA:         to r4              ;
CODE_0AD1CB:         and   #0F          ;
CODE_0AD1CD:         sms   (0048),r4    ;
CODE_0AD1D0:         ibt   r5,#0005     ;
CODE_0AD1D2:         moves r3,r3        ;
CODE_0AD1D4:         bpl CODE_0AD1D9    ;
CODE_0AD1D6:         nop                ;
CODE_0AD1D7:         ibt   r5,#0004     ;
CODE_0AD1D9:         from r7            ;
CODE_0AD1DA:         and   r5           ;
CODE_0AD1DB:         sub   r5           ;
CODE_0AD1DC:         sms   (0040),r0    ;
CODE_0AD1DF:         beq CODE_0AD20B    ;
CODE_0AD1E1:         nop                ;
CODE_0AD1E2:         sms   (0004),r6    ;
CODE_0AD1E5:         sms   (0006),r7    ;
CODE_0AD1E8:         sms   (0008),r8    ;
CODE_0AD1EB:         lms   r8,(0000)    ;
CODE_0AD1EE:         sms   (000A),r8    ;
CODE_0AD1F1:         lms   r7,(0002)    ;
CODE_0AD1F4:         sms   (000C),r7    ;
CODE_0AD1F7:         sms   (000E),r5    ;
CODE_0AD1FA:         from r3            ;
CODE_0AD1FB:         add   r7           ;
CODE_0AD1FC:         link  #04          ;
CODE_0AD1FD:         iwt   r15,#D096    ;
CODE_0AD200:         lms   r5,(000E)    ;
CODE_0AD204:         and   r5           ;
CODE_0AD205:         sub   r5           ;
CODE_0AD206:         bne CODE_0AD26F    ;
CODE_0AD208:         nop                ;
CODE_0AD209:         with r4            ;
CODE_0AD20A:         sub   r3           ;
CODE_0AD20B:         sms   (005C),r14   ;
CODE_0AD20E:         from r8            ;
CODE_0AD20F:         swap               ;
CODE_0AD210:         moves r3,r3        ;
CODE_0AD212:         bpl CODE_0AD217    ;
CODE_0AD214:         lsr                ;
CODE_0AD215:         inc   r0           ;
CODE_0AD216:         inc   r0           ;
CODE_0AD217:         iwt   r14,#BD0E    ;
CODE_0AD21A:         to r14             ;
CODE_0AD21B:         add   r14          ;
CODE_0AD21C:         lms   r0,(0000)    ;
CODE_0AD21F:         and   #0F          ;
CODE_0AD221:         add   r0           ;
CODE_0AD222:         add   r0           ;
CODE_0AD223:         add   r0           ;
CODE_0AD224:         to r14             ;
CODE_0AD225:         add   r14          ;
CODE_0AD226:         to r5              ;
CODE_0AD227:         getb               ;
CODE_0AD228:         inc   r14          ;
CODE_0AD229:         getbs              ;
CODE_0AD22B:         lms   r14,(005C)   ;
CODE_0AD22E:         sub   r4           ;
CODE_0AD22F:         xor   r3           ;
CODE_0AD231:         bmi CODE_0AD267    ;
CODE_0AD233:         to r4              ;
CODE_0AD234:         xor   r3           ;
CODE_0AD236:         inc   r4           ;
CODE_0AD237:         sms   (0010),r5    ;
CODE_0AD23A:         moves r3,r3        ;
CODE_0AD23C:         bpl CODE_0AD295    ;
CODE_0AD23E:         from r4            ;
CODE_0AD23F:         add   #0A          ;
CODE_0AD241:         bmi CODE_0AD267    ;
CODE_0AD243:         nop                ;
CODE_0AD244:         iwt   r0,#11E2     ;
CODE_0AD247:         add   r1           ;
CODE_0AD248:         ldw   (r0)         ;
CODE_0AD249:         add   r0           ;
CODE_0AD24A:         bcc CODE_0AD2B8    ;
CODE_0AD24C:         inc   r2           ;
CODE_0AD24D:         iwt   r0,#268E     ;
CODE_0AD250:         add   r1           ;
CODE_0AD251:         ldw   (r0)         ;
CODE_0AD252:         lob                ;
CODE_0AD253:         bne CODE_0AD266    ;
CODE_0AD255:         nop                ;
CODE_0AD256:         iwt   r0,#11E1     ;
CODE_0AD259:         add   r1           ;
CODE_0AD25A:         ldw   (r0)         ;
CODE_0AD25B:         xor   r5           ;
CODE_0AD25D:         sex                ;
CODE_0AD25E:         bmi CODE_0AD266    ;
CODE_0AD260:         sub   r0           ;
CODE_0AD261:         sms   (0010),r0    ;
CODE_0AD264:         with r10           ;
CODE_0AD265:         add   r4           ;
CODE_0AD266:         dec   r2           ;
CODE_0AD267:         lms   r0,(0040)    ;
CODE_0AD26A:         sub   #00          ;
CODE_0AD26C:         beq CODE_0AD2B1    ;
CODE_0AD26E:         nop                ;
CODE_0AD26F:         lms   r4,(0048)    ;
CODE_0AD272:         lms   r6,(0004)    ;
CODE_0AD275:         lms   r7,(0006)    ;
CODE_0AD278:         lms   r8,(0008)    ;
CODE_0AD27B:         lms   r0,(000A)    ;
CODE_0AD27E:         sms   (0000),r0    ;
CODE_0AD281:         lms   r0,(000C)    ;
CODE_0AD284:         sms   (0002),r0    ;
CODE_0AD287:         moves r3,r3        ;
CODE_0AD289:         bmi CODE_0AD29A    ;
CODE_0AD28B:         from r7            ;
CODE_0AD28C:         and   #02          ;
CODE_0AD28E:         beq CODE_0AD2FB    ;
CODE_0AD290:         nop                ;
CODE_0AD291:         ibt   r0,#0010     ;
CODE_0AD293:         to r4              ;
CODE_0AD294:         sub   r4           ;
CODE_0AD295:         with r10           ;
CODE_0AD296:         add   r4           ;
CODE_0AD297:         bra CODE_0AD2B3    ;

CODE_0AD299:         inc   r2           ;
CODE_0AD29A:         and   #03          ;
CODE_0AD29C:         beq CODE_0AD2B3    ;
CODE_0AD29E:         nop                ;
CODE_0AD29F:         iwt   r0,#11E2     ;
CODE_0AD2A2:         add   r1           ;
CODE_0AD2A3:         ldw   (r0)         ;
CODE_0AD2A4:         add   r0           ;
CODE_0AD2A5:         bcs CODE_0AD2B1    ;
CODE_0AD2A7:         with r4            ;
CODE_0AD2A8:         not                ;
CODE_0AD2A9:         inc   r4           ;
CODE_0AD2AA:         from r4            ;
CODE_0AD2AB:         add   #0A          ;
CODE_0AD2AD:         bpl CODE_0AD2B8    ;
CODE_0AD2AF:         inc   r2           ;
CODE_0AD2B0:         dec   r2           ;
CODE_0AD2B1:         ibt   r4,#0020     ;
CODE_0AD2B3:         lms   r11,(0060)   ;
CODE_0AD2B6:         jmp   r11          ;
CODE_0AD2B7:         nop                ;

CODE_0AD2B8:         iwt   r0,#F800     ;
CODE_0AD2BB:         and   r7           ;
CODE_0AD2BC:         iwt   r5,#9800     ;
CODE_0AD2BF:         sub   r5           ;
CODE_0AD2C0:         bne CODE_0AD2F6    ;
CODE_0AD2C2:         nop                ;
CODE_0AD2C3:         lms   r0,(0010)    ;
CODE_0AD2C6:         swap               ;
CODE_0AD2C7:         beq CODE_0AD2D3    ;
CODE_0AD2C9:         nop                ;
CODE_0AD2CA:         ibt   r5,#FFD0     ;
CODE_0AD2CC:         bpl CODE_0AD2E4    ;
CODE_0AD2CE:         with r5            ;
CODE_0AD2CF:         not                ;
CODE_0AD2D0:         bra CODE_0AD2E4    ;

CODE_0AD2D2:         inc   r5           ;

CODE_0AD2D3:         from r6            ;
CODE_0AD2D4:         hib                ;
CODE_0AD2D5:         iwt   r5,#0082     ;
CODE_0AD2D8:         sub   r5           ;
CODE_0AD2D9:         bmi CODE_0AD2EB    ;
CODE_0AD2DB:         nop                ;
CODE_0AD2DC:         iwt   r5,#0FF0     ;
CODE_0AD2DF:         beq CODE_0AD2E4    ;
CODE_0AD2E1:         with r5            ;
CODE_0AD2E2:         not                ;
CODE_0AD2E3:         inc   r5           ;
CODE_0AD2E4:         iwt   r0,#0EC3     ;
CODE_0AD2E7:         add   r1           ;
CODE_0AD2E8:         from r5            ;
CODE_0AD2E9:         stb   (r0)         ;
CODE_0AD2EB:         iwt   r0,#1781     ;
CODE_0AD2EE:         add   r1           ;
CODE_0AD2EF:         ldb   (r0)         ;
CODE_0AD2F1:         sub   #00          ;
CODE_0AD2F3:         beq CODE_0AD312    ;
CODE_0AD2F5:         nop                ;
CODE_0AD2F6:         lms   r11,(0060)   ;
CODE_0AD2F9:         jmp   r11          ;
CODE_0AD2FA:         nop                ;

CODE_0AD2FB:         iwt   r0,#F800     ;
CODE_0AD2FE:         and   r7           ;
CODE_0AD2FF:         iwt   r5,#9800     ;
CODE_0AD302:         sub   r5           ;
CODE_0AD303:         bne CODE_0AD2F6    ;
CODE_0AD305:         from r1            ;
CODE_0AD306:         lsr                ;
CODE_0AD307:         lsr                ;
CODE_0AD308:         lm    r5,(1974)    ;
CODE_0AD30C:         add   r5           ;
CODE_0AD30D:         and   #07          ;
CODE_0AD30F:         beq CODE_0AD2F6    ;
CODE_0AD311:         nop                ;
CODE_0AD312:         sms   (0048),r4    ;
CODE_0AD315:         ibt   r5,#0008     ;
CODE_0AD317:         iwt   r0,#1781     ;
CODE_0AD31A:         add   r1           ;
CODE_0AD31B:         from r5            ;
CODE_0AD31C:         stb   (r0)         ;
CODE_0AD31E:         ibt   r0,#0037     ;
CODE_0AD320:         sms   (007A),r0    ;
CODE_0AD323:         iwt   r5,#0201     ;
CODE_0AD326:         link  #04          ;
CODE_0AD327:         iwt   r15,#DFE3    ;
CODE_0AD32A:         nop                ;
CODE_0AD32B:         iwt   r0,#10A2     ;
CODE_0AD32E:         add   r4           ;
CODE_0AD32F:         from r9            ;
CODE_0AD330:         stw   (r0)         ;
CODE_0AD331:         lms   r5,(0002)    ;
CODE_0AD334:         iwt   r0,#1142     ;
CODE_0AD337:         add   r4           ;
CODE_0AD338:         from r5            ;
CODE_0AD339:         stw   (r0)         ;
CODE_0AD33A:         ibt   r5,#0005     ;
CODE_0AD33C:         iwt   r0,#13C2     ;
CODE_0AD33F:         add   r4           ;
CODE_0AD340:         from r5            ;
CODE_0AD341:         stw   (r0)         ;
CODE_0AD342:         ibt   r5,#0002     ;
CODE_0AD344:         iwt   r0,#1782     ;
CODE_0AD347:         add   r4           ;
CODE_0AD348:         from r5            ;
CODE_0AD349:         stw   (r0)         ;
CODE_0AD34A:         lms   r4,(0048)    ;
CODE_0AD34D:         lms   r11,(0060)   ;
CODE_0AD350:         jmp   r11          ;
CODE_0AD351:         nop                ;

CODE_0AD352:         to r3              ;
CODE_0AD353:         link  #04          ;
CODE_0AD354:         iwt   r15,#D08D    ;
CODE_0AD357:         and   #02          ;
CODE_0AD35A:         beq CODE_0AD35E    ;
CODE_0AD35C:         nop                ;
CODE_0AD35D:         inc   r2           ;
CODE_0AD35E:         move  r11,r3       ;
CODE_0AD360:         jmp   r11          ;
CODE_0AD361:         nop                ;

CODE_0AD362:         to r3              ;
CODE_0AD363:         link  #04          ;
CODE_0AD364:         iwt   r15,#D08D    ;
CODE_0AD367:         and   #03          ;
CODE_0AD36A:         beq CODE_0AD36E    ;
CODE_0AD36C:         nop                ;
CODE_0AD36D:         inc   r2           ;
CODE_0AD36E:         move  r11,r3       ;
CODE_0AD370:         jmp   r11          ;
CODE_0AD371:         nop                ;

CODE_0AD372:         to r3              ;
CODE_0AD373:         link  #04          ;
CODE_0AD374:         iwt   r15,#D08D    ;
CODE_0AD377:         and   #02          ;
CODE_0AD37A:         beq CODE_0AD37E    ;
CODE_0AD37C:         nop                ;
CODE_0AD37D:         inc   r2           ;
CODE_0AD37E:         link  #04          ;
CODE_0AD37F:         iwt   r15,#D401    ;
CODE_0AD382:         ibt   r0,#0023     ;
CODE_0AD384:         to r11             ;
CODE_0AD385:         jmp   r11          ;
CODE_0AD386:         nop                ;

CODE_0AD387:         ibt   r11,#0030    ;
CODE_0AD389:         iwt   r6,#0F00     ;
CODE_0AD38C:         iwt   r5,#0040     ;
CODE_0AD38F:         from r1            ;
CODE_0AD390:         to r5              ;
CODE_0AD391:         sub   r5           ;
CODE_0AD392:         iwt   r0,#1A36     ;
CODE_0AD395:         add   r5           ;
CODE_0AD396:         ldw   (r0)         ;
CODE_0AD397:         lsr                ;
CODE_0AD398:         lsr                ;
CODE_0AD399:         lsr                ;
CODE_0AD39A:         fmult              ;
CODE_0AD39B:         moves r3,r3        ;
CODE_0AD39D:         bmi CODE_0AD3A2    ;
CODE_0AD39F:         nop                ;
CODE_0AD3A0:         not                ;
CODE_0AD3A1:         inc   r0           ;
CODE_0AD3A2:         add   r9           ;
CODE_0AD3A3:         to r8              ;
CODE_0AD3A4:         add   #08          ;
CODE_0AD3A6:         move  r0,r10       ;
CODE_0AD3A8:         link  #04          ;
CODE_0AD3A9:         iwt   r15,#D096    ;
CODE_0AD3AC:         alt1               ;
CODE_0AD3AD:         bra CODE_0AD3B7    ;

CODE_0AD3AF:         nop                ;

CODE_0AD3B0:         ibt   r11,#0030    ;
CODE_0AD3B2:         link  #04          ;
CODE_0AD3B3:         iwt   r15,#D08D    ;
CODE_0AD3B6:         and   #02          ;
CODE_0AD3B9:         beq CODE_0AD3FC    ;
CODE_0AD3BB:         from r2            ;
CODE_0AD3BC:         and   #02          ;
CODE_0AD3BE:         bne CODE_0AD3FC    ;
CODE_0AD3C0:         with r9            ;
CODE_0AD3C1:         add   r3           ;
CODE_0AD3C2:         iwt   r0,#11E0     ;
CODE_0AD3C5:         to r4              ;
CODE_0AD3C6:         add   r1           ;
CODE_0AD3C7:         iwt   r0,#0F62     ;
CODE_0AD3CA:         add   r1           ;
CODE_0AD3CB:         to r5              ;
CODE_0AD3CC:         ldw   (r0)         ;
CODE_0AD3CD:         iwt   r0,#00C0     ;
CODE_0AD3D0:         and   r5           ;
CODE_0AD3D1:         beq CODE_0AD3FC    ;
CODE_0AD3D3:         inc   r2           ;
CODE_0AD3D4:         swap               ;
CODE_0AD3D5:         bmi CODE_0AD3FB    ;
CODE_0AD3D7:         sub   r0           ;
CODE_0AD3D8:         ldw   (r4)         ;
CODE_0AD3D9:         to r11             ;
CODE_0AD3DA:         xor   r3           ;
CODE_0AD3DC:         bpl CODE_0AD3FC    ;
CODE_0AD3DE:         not                ;
CODE_0AD3DF:         with r5            ;
CODE_0AD3E0:         swap               ;
CODE_0AD3E1:         with r5            ;
CODE_0AD3E2:         and   #04          ;
CODE_0AD3E4:         beq CODE_0AD3E8    ;
CODE_0AD3E6:         inc   r0           ;
CODE_0AD3E7:         sub   r0           ;
CODE_0AD3E8:         sbk                ;
CODE_0AD3E9:         iwt   r0,#13C0     ;
CODE_0AD3EC:         add   r1           ;
CODE_0AD3ED:         ldw   (r0)         ;
CODE_0AD3EE:         xor   #02          ;
CODE_0AD3F0:         sbk                ;
CODE_0AD3F1:         iwt   r0,#15A0     ;
CODE_0AD3F4:         add   r1           ;
CODE_0AD3F5:         ldw   (r0)         ;
CODE_0AD3F6:         not                ;
CODE_0AD3F7:         inc   r0           ;
CODE_0AD3F8:         bra CODE_0AD3FC    ;

CODE_0AD3FA:         sbk                ;

CODE_0AD3FB:         stw   (r4)         ;
CODE_0AD3FC:         lms   r11,(0060)   ;
CODE_0AD3FF:         jmp   r11          ;
CODE_0AD400:         nop                ;

CODE_0AD401:         to r8              ;
CODE_0AD402:         and   r7           ;
CODE_0AD403:         bne CODE_0AD412    ;
CODE_0AD405:         nop                ;
CODE_0AD406:         lms   r0,(0002)    ;
CODE_0AD409:         lms   r5,(01BC)    ;
CODE_0AD40C:         sub   r5           ;
CODE_0AD40D:         bmi CODE_0AD412    ;
CODE_0AD40F:         sub   r0           ;
CODE_0AD410:         ibt   r0,#0008     ;
CODE_0AD412:         move  r5,r0        ;
CODE_0AD414:         iwt   r0,#1822     ;
CODE_0AD417:         add   r1           ;
CODE_0AD418:         ldb   (r0)         ;
CODE_0AD41A:         sub   r5           ;
CODE_0AD41B:         bne CODE_0AD46E    ;
CODE_0AD41D:         add   r5           ;
CODE_0AD41E:         beq CODE_0AD46C    ;
CODE_0AD420:         nop                ;
CODE_0AD421:         lm    r5,(1974)    ;
CODE_0AD425:         ibt   r0,#007F     ;
CODE_0AD427:         to r5              ;
CODE_0AD428:         and   r5           ;
CODE_0AD429:         and   r1           ;
CODE_0AD42A:         sub   r5           ;
CODE_0AD42B:         bne CODE_0AD46C    ;
CODE_0AD42D:         nop                ;
CODE_0AD42E:         ibt   r0,#0010     ;
CODE_0AD430:         and   r7           ;
CODE_0AD431:         bne CODE_0AD46C    ;
CODE_0AD433:         nop                ;
CODE_0AD434:         sms   (0060),r11   ;
CODE_0AD437:         iwt   r5,#01BC     ;
CODE_0AD43A:         link  #04          ;
CODE_0AD43B:         iwt   r15,#DFE3    ;
CODE_0AD43E:         nop                ;
CODE_0AD43F:         lms   r0,(0000)    ;
CODE_0AD442:         to r5              ;
CODE_0AD443:         sub   #08          ;
CODE_0AD445:         iwt   r0,#10A2     ;
CODE_0AD448:         add   r4           ;
CODE_0AD449:         from r5            ;
CODE_0AD44A:         stw   (r0)         ;
CODE_0AD44B:         lms   r0,(0002)    ;
CODE_0AD44E:         to r5              ;
CODE_0AD44F:         sub   #08          ;
CODE_0AD451:         iwt   r0,#1142     ;
CODE_0AD454:         add   r4           ;
CODE_0AD455:         from r5            ;
CODE_0AD456:         stw   (r0)         ;
CODE_0AD457:         lm    r5,(1970)    ;
CODE_0AD45B:         iwt   r0,#1E4C     ;
CODE_0AD45E:         add   r4           ;
CODE_0AD45F:         from r5            ;
CODE_0AD460:         stw   (r0)         ;
CODE_0AD461:         ibt   r5,#FFFF     ;
CODE_0AD463:         iwt   r0,#1782     ;
CODE_0AD466:         add   r4           ;
CODE_0AD467:         from r5            ;
CODE_0AD468:         stw   (r0)         ;
CODE_0AD469:         lms   r11,(0060)   ;
CODE_0AD46C:         jmp   r11          ;
CODE_0AD46D:         nop                ;

CODE_0AD46E:         move  r4,r0        ;
CODE_0AD470:         iwt   r0,#1822     ;
CODE_0AD473:         add   r1           ;
CODE_0AD474:         from r5            ;
CODE_0AD475:         stb   (r0)         ;
CODE_0AD477:         from r4            ;
CODE_0AD478:         swap               ;
CODE_0AD479:         bmi CODE_0AD4C4    ;
CODE_0AD47B:         from r7            ;
CODE_0AD47C:         and   #02          ;
CODE_0AD47E:         bne CODE_0AD4C4    ;
CODE_0AD480:         from r4            ;
CODE_0AD481:         or    r7           ;
CODE_0AD482:         ibt   r4,#0010     ;
CODE_0AD484:         and   r4           ;
CODE_0AD485:         bne CODE_0AD4C6    ;
CODE_0AD487:         sms   (0060),r11   ;
CODE_0AD48A:         ibt   r0,#005F     ;
CODE_0AD48C:         sms   (007A),r0    ;
CODE_0AD48F:         iwt   r5,#01BA     ;
CODE_0AD492:         link  #04          ;
CODE_0AD493:         iwt   r15,#DFE3    ;
CODE_0AD496:         nop                ;
CODE_0AD497:         lms   r0,(0000)    ;
CODE_0AD49A:         to r5              ;
CODE_0AD49B:         sub   #08          ;
CODE_0AD49D:         iwt   r0,#10A2     ;
CODE_0AD4A0:         add   r4           ;
CODE_0AD4A1:         from r5            ;
CODE_0AD4A2:         stw   (r0)         ;
CODE_0AD4A3:         lms   r0,(0002)    ;
CODE_0AD4A6:         sub   #08          ;
CODE_0AD4A8:         to r5              ;
CODE_0AD4A9:         bic   #0F          ;
CODE_0AD4AB:         iwt   r0,#1142     ;
CODE_0AD4AE:         add   r4           ;
CODE_0AD4AF:         from r5            ;
CODE_0AD4B0:         stw   (r0)         ;
CODE_0AD4B1:         ibt   r5,#001A     ;
CODE_0AD4B3:         iwt   r0,#1E4C     ;
CODE_0AD4B6:         add   r4           ;
CODE_0AD4B7:         from r5            ;
CODE_0AD4B8:         stw   (r0)         ;
CODE_0AD4B9:         ibt   r5,#0003     ;
CODE_0AD4BB:         iwt   r0,#1782     ;
CODE_0AD4BE:         add   r4           ;
CODE_0AD4BF:         from r5            ;
CODE_0AD4C0:         stw   (r0)         ;
CODE_0AD4C1:         lms   r11,(0060)   ;
CODE_0AD4C4:         jmp   r11          ;
CODE_0AD4C5:         nop                ;

CODE_0AD4C6:         sms   (0060),r11   ;
CODE_0AD4C9:         iwt   r5,#01C7     ;
CODE_0AD4CC:         link  #04          ;
CODE_0AD4CD:         iwt   r15,#DFE3    ;
CODE_0AD4D0:         nop                ;
CODE_0AD4D1:         iwt   r0,#1140     ;
CODE_0AD4D4:         add   r4           ;
CODE_0AD4D5:         ldb   (r0)         ;
CODE_0AD4D7:         lob                ;
CODE_0AD4D8:         bne CODE_0AD4EC    ;
CODE_0AD4DA:         to r5              ;
CODE_0AD4DB:         sub   r0           ;
CODE_0AD4DC:         iwt   r0,#0EC0     ;
CODE_0AD4DF:         add   r4           ;
CODE_0AD4E0:         from r5            ;
CODE_0AD4E1:         stw   (r0)         ;
CODE_0AD4E2:         dec   r5           ;
CODE_0AD4E3:         iwt   r0,#1462     ;
CODE_0AD4E6:         add   r4           ;
CODE_0AD4E7:         from r5            ;
CODE_0AD4E8:         stw   (r0)         ;
CODE_0AD4E9:         bra CODE_0AD517    ;

CODE_0AD4EB:         nop                ;

CODE_0AD4EC:         lms   r0,(0000)    ;
CODE_0AD4EF:         to r5              ;
CODE_0AD4F0:         sub   #08          ;
CODE_0AD4F2:         iwt   r0,#10A2     ;
CODE_0AD4F5:         add   r4           ;
CODE_0AD4F6:         from r5            ;
CODE_0AD4F7:         stw   (r0)         ;
CODE_0AD4F8:         lms   r0,(0002)    ;
CODE_0AD4FB:         sub   #08          ;
CODE_0AD4FD:         to r5              ;
CODE_0AD4FE:         bic   #0F          ;
CODE_0AD500:         iwt   r0,#1142     ;
CODE_0AD503:         add   r4           ;
CODE_0AD504:         from r5            ;
CODE_0AD505:         stw   (r0)         ;
CODE_0AD506:         iwt   r5,#FF40     ;
CODE_0AD509:         iwt   r0,#1E4C     ;
CODE_0AD50C:         add   r4           ;
CODE_0AD50D:         from r5            ;
CODE_0AD50E:         stw   (r0)         ;
CODE_0AD50F:         ibt   r5,#0030     ;
CODE_0AD511:         iwt   r0,#1782     ;
CODE_0AD514:         add   r4           ;
CODE_0AD515:         from r5            ;
CODE_0AD516:         stw   (r0)         ;
CODE_0AD517:         lms   r11,(0060)   ;
CODE_0AD51A:         jmp   r11          ;
CODE_0AD51B:         nop                ;

CODE_0AD51C:         link  #04          ;
CODE_0AD51D:         iwt   r15,#D372    ;
CODE_0AD520:         with r11           ;
CODE_0AD521:         with r2            ;
CODE_0AD522:         add   r2           ;
CODE_0AD523:         with r2            ;
CODE_0AD524:         add   r2           ;
CODE_0AD525:         iwt   r0,#11E0     ;
CODE_0AD528:         add   r1           ;
CODE_0AD529:         ldw   (r0)         ;
CODE_0AD52A:         dec   r0           ;
CODE_0AD52B:         bpl CODE_0AD545    ;
CODE_0AD52D:         nop                ;
CODE_0AD52E:         ibt   r3,#0001     ;
CODE_0AD530:         link  #04          ;
CODE_0AD531:         iwt   r15,#D3B0    ;
CODE_0AD534:         sm    (11E0),r0    ;
CODE_0AD538:         add   r1           ;
CODE_0AD539:         ldw   (r0)         ;
CODE_0AD53A:         sub   #00          ;
CODE_0AD53C:         beq CODE_0AD548    ;
CODE_0AD53E:         with r2            ;
CODE_0AD53F:         add   r2           ;
CODE_0AD540:         inc   r14          ;
CODE_0AD541:         inc   r14          ;
CODE_0AD542:         bra CODE_0AD551    ;

CODE_0AD544:         with r2            ;
CODE_0AD545:         inc   r14          ;
CODE_0AD546:         inc   r14          ;
CODE_0AD547:         with r2            ;
CODE_0AD548:         add   r2           ;
CODE_0AD549:         ibt   r3,#FFFF     ;
CODE_0AD54B:         link  #04          ;
CODE_0AD54C:         iwt   r15,#D3B0    ;
CODE_0AD54F:         add   #02          ;
CODE_0AD552:         ibt   r3,#0010     ;
CODE_0AD554:         link  #04          ;
CODE_0AD555:         iwt   r15,#D1A3    ;
CODE_0AD558:         lsr                ;
CODE_0AD55B:         bcc CODE_0AD566    ;
CODE_0AD55D:         nop                ;
CODE_0AD55E:         inc   r10          ;
CODE_0AD55F:         iwt   r0,#11E2     ;
CODE_0AD562:         to r4              ;
CODE_0AD563:         add   r1           ;
CODE_0AD564:         sub   r0           ;
CODE_0AD565:         stw   (r4)         ;
CODE_0AD566:         with r2            ;
CODE_0AD567:         add   r2           ;
CODE_0AD568:         ibt   r3,#FFF0     ;
CODE_0AD56A:         link  #04          ;
CODE_0AD56B:         iwt   r15,#D1B5    ;
CODE_0AD56E:         lsr                ;
CODE_0AD571:         bcs CODE_0AD5C4    ;
CODE_0AD573:         nop                ;
CODE_0AD574:         iwt   r0,#1820     ;
CODE_0AD577:         add   r1           ;
CODE_0AD578:         ldw   (r0)         ;
CODE_0AD579:         lsr                ;
CODE_0AD57A:         bcc CODE_0AD5FB    ;
CODE_0AD57C:         nop                ;
CODE_0AD57D:         iwt   r0,#0F63     ;
CODE_0AD580:         add   r1           ;
CODE_0AD581:         to r6              ;
CODE_0AD582:         ldb   (r0)         ;
CODE_0AD584:         from r6            ;
CODE_0AD585:         and   #03          ;
CODE_0AD587:         beq CODE_0AD5FB    ;
CODE_0AD589:         lsr                ;
CODE_0AD58A:         iwt   r5,#11E0     ;
CODE_0AD58D:         with r5            ;
CODE_0AD58E:         add   r1           ;
CODE_0AD58F:         to r5              ;
CODE_0AD590:         ldw   (r5)         ;
CODE_0AD591:         with r5            ;
CODE_0AD592:         not                ;
CODE_0AD593:         lsr                ;
CODE_0AD594:         bcs CODE_0AD5B7    ;
CODE_0AD596:         inc   r5           ;
CODE_0AD597:         from r6            ;
CODE_0AD598:         and   #04          ;
CODE_0AD59A:         bne CODE_0AD59E    ;
CODE_0AD59C:         sub   r0           ;
CODE_0AD59D:         from r5            ;
CODE_0AD59E:         sbk                ;
CODE_0AD59F:         ibt   r6,#0000     ;
CODE_0AD5A1:         iwt   r0,#10A1     ;
CODE_0AD5A4:         add   r1           ;
CODE_0AD5A5:         from r6            ;
CODE_0AD5A6:         stb   (r0)         ;
CODE_0AD5A8:         iwt   r0,#13C0     ;
CODE_0AD5AB:         add   r1           ;
CODE_0AD5AC:         ldw   (r0)         ;
CODE_0AD5AD:         xor   #02          ;
CODE_0AD5AF:         sbk                ;
CODE_0AD5B0:         iwt   r0,#15A0     ;
CODE_0AD5B3:         add   r1           ;
CODE_0AD5B4:         ldw   (r0)         ;
CODE_0AD5B5:         not                ;
CODE_0AD5B6:         inc   r0           ;
CODE_0AD5B7:         sbk                ;
CODE_0AD5B8:         iwt   r0,#272E     ;
CODE_0AD5BB:         add   r1           ;
CODE_0AD5BC:         to r9              ;
CODE_0AD5BD:         ldw   (r0)         ;
CODE_0AD5BE:         inc   r0           ;
CODE_0AD5BF:         inc   r0           ;
CODE_0AD5C0:         to r10             ;
CODE_0AD5C1:         to    r10          ;
CODE_0AD5C1:         bra CODE_0AD5D9    ;

CODE_0AD5C3:         ldw   (r0)         ;

CODE_0AD5C4:         with r10           ;
CODE_0AD5C5:         add   r4           ;
CODE_0AD5C6:         ibt   r6,#FFFF     ;
CODE_0AD5C8:         iwt   r0,#1141     ;
CODE_0AD5CB:         add   r1           ;
CODE_0AD5CC:         from r6            ;
CODE_0AD5CD:         stb   (r0)         ;
CODE_0AD5CF:         iwt   r0,#272E     ;
CODE_0AD5D2:         add   r1           ;
CODE_0AD5D3:         from r9            ;
CODE_0AD5D4:         stw   (r0)         ;
CODE_0AD5D5:         inc   r0           ;
CODE_0AD5D6:         inc   r0           ;
CODE_0AD5D7:         from r10           ;
CODE_0AD5D8:         stw   (r0)         ;
CODE_0AD5D9:         lms   r6,(0010)    ;
CODE_0AD5DC:         iwt   r0,#0EC2     ;
CODE_0AD5DF:         add   r1           ;
CODE_0AD5E0:         from r6            ;
CODE_0AD5E1:         stb   (r0)         ;
CODE_0AD5E3:         sub   r0           ;
CODE_0AD5E4:         sms   (0010),r0    ;
CODE_0AD5E7:         iwt   r0,#0F62     ;
CODE_0AD5EA:         add   r1           ;
CODE_0AD5EB:         ldw   (r0)         ;
CODE_0AD5EC:         ibt   r6,#0020     ;
CODE_0AD5EE:         and   r6           ;
CODE_0AD5EF:         bne CODE_0AD5FB    ;
CODE_0AD5F1:         nop                ;
CODE_0AD5F2:         iwt   r0,#11E2     ;
CODE_0AD5F5:         to r4              ;
CODE_0AD5F6:         add   r1           ;
CODE_0AD5F7:         iwt   r0,#0100     ;
CODE_0AD5FA:         stw   (r4)         ;
CODE_0AD5FB:         lms   r5,(0010)    ;
CODE_0AD5FE:         iwt   r0,#268E     ;
CODE_0AD601:         add   r1           ;
CODE_0AD602:         from r5            ;
CODE_0AD603:         stw   (r0)         ;
CODE_0AD604:         iwt   r0,#10A2     ;
CODE_0AD607:         add   r1           ;
CODE_0AD608:         from r9            ;
CODE_0AD609:         stw   (r0)         ;
CODE_0AD60A:         iwt   r0,#16E0     ;
CODE_0AD60D:         add   r1           ;
CODE_0AD60E:         ldw   (r0)         ;
CODE_0AD60F:         with r10           ;
CODE_0AD610:         sub   r0           ;
CODE_0AD611:         iwt   r0,#1142     ;
CODE_0AD614:         add   r1           ;
CODE_0AD615:         from r10           ;
CODE_0AD616:         stw   (r0)         ;
CODE_0AD617:         iwt   r15,#D07F    ;
CODE_0AD61A:         inc   r1           ;
CODE_0AD61B:         link  #04          ;
CODE_0AD61C:         iwt   r15,#D372    ;
CODE_0AD61F:         with r11           ;
CODE_0AD620:         with r2            ;
CODE_0AD621:         add   r2           ;
CODE_0AD622:         with r2            ;
CODE_0AD623:         add   r2           ;
CODE_0AD624:         link  #04          ;
CODE_0AD625:         iwt   r15,#D352    ;
CODE_0AD628:         with r11           ;
CODE_0AD629:         with r2            ;
CODE_0AD62A:         add   r2           ;
CODE_0AD62B:         link  #04          ;
CODE_0AD62C:         iwt   r15,#D352    ;
CODE_0AD62F:         with r11           ;
CODE_0AD630:         with r2            ;
CODE_0AD631:         add   r2           ;
CODE_0AD632:         link  #04          ;
CODE_0AD633:         iwt   r15,#D352    ;
CODE_0AD636:         with r11           ;
CODE_0AD637:         with r2            ;
CODE_0AD638:         add   r2           ;
CODE_0AD639:         link  #04          ;
CODE_0AD63A:         iwt   r15,#D352    ;
CODE_0AD63D:         with r11           ;
CODE_0AD63E:         iwt   r15,#D07F    ;
CODE_0AD641:         inc   r1           ;
CODE_0AD642:         link  #04          ;
CODE_0AD643:         iwt   r15,#D372    ;
CODE_0AD646:         with r11           ;
CODE_0AD647:         iwt   r15,#D07F    ;
CODE_0AD64A:         inc   r1           ;
CODE_0AD64B:         link  #04          ;
CODE_0AD64C:         iwt   r15,#D352    ;
CODE_0AD64F:         with r11           ;
CODE_0AD650:         with r2            ;
CODE_0AD651:         add   r2           ;
CODE_0AD652:         link  #04          ;
CODE_0AD653:         iwt   r15,#D352    ;
CODE_0AD656:         with r11           ;
CODE_0AD657:         with r2            ;
CODE_0AD658:         add   r2           ;
CODE_0AD659:         link  #04          ;
CODE_0AD65A:         iwt   r15,#D352    ;
CODE_0AD65D:         with r11           ;
CODE_0AD65E:         with r2            ;
CODE_0AD65F:         add   r2           ;
CODE_0AD660:         link  #04          ;
CODE_0AD661:         iwt   r15,#D352    ;
CODE_0AD664:         with r11           ;
CODE_0AD665:         iwt   r15,#D07F    ;
CODE_0AD668:         inc   r1           ;
CODE_0AD669:         link  #04          ;
CODE_0AD66A:         iwt   r15,#D352    ;
CODE_0AD66D:         with r11           ;
CODE_0AD66E:         with r2            ;
CODE_0AD66F:         add   r2           ;
CODE_0AD670:         link  #04          ;
CODE_0AD671:         iwt   r15,#D352    ;
CODE_0AD674:         with r11           ;
CODE_0AD675:         iwt   r15,#D07F    ;
CODE_0AD678:         inc   r1           ;
CODE_0AD679:         link  #04          ;
CODE_0AD67A:         iwt   r15,#D372    ;
CODE_0AD67D:         with r11           ;
CODE_0AD67E:         link  #04          ;
CODE_0AD67F:         iwt   r15,#DD15    ;
CODE_0AD682:         nop                ;
CODE_0AD683:         with r2            ;
CODE_0AD684:         add   r2           ;
CODE_0AD685:         with r2            ;
CODE_0AD686:         add   r2           ;
CODE_0AD687:         iwt   r0,#11E0     ;
CODE_0AD68A:         add   r1           ;
CODE_0AD68B:         ldw   (r0)         ;
CODE_0AD68C:         dec   r0           ;
CODE_0AD68D:         bpl CODE_0AD6B3    ;
CODE_0AD68F:         nop                ;
CODE_0AD690:         ibt   r3,#0010     ;
CODE_0AD692:         link  #04          ;
CODE_0AD693:         iwt   r15,#D80B    ;
CODE_0AD696:         jmp r4             ;
CODE_0AD698:         iwt   r15,#D90D    ;
CODE_0AD69B:         nop                ;
CODE_0AD69C:         from r2            ;
CODE_0AD69D:         lsr                ;
CODE_0AD69E:         bcc CODE_0AD6A3    ;
CODE_0AD6A0:         nop                ;
CODE_0AD6A1:         with r9            ;
CODE_0AD6A2:         add   r4           ;
CODE_0AD6A3:         iwt   r0,#11E0     ;
CODE_0AD6A6:         add   r1           ;
CODE_0AD6A7:         ldw   (r0)         ;
CODE_0AD6A8:         sub   #00          ;
CODE_0AD6AA:         beq CODE_0AD6B6    ;
CODE_0AD6AC:         with r2            ;
CODE_0AD6AD:         add   r2           ;
CODE_0AD6AE:         inc   r14          ;
CODE_0AD6AF:         inc   r14          ;
CODE_0AD6B0:         bra CODE_0AD6CB    ;

CODE_0AD6B2:         with r2            ;
CODE_0AD6B3:         inc   r14          ;
CODE_0AD6B4:         inc   r14          ;
CODE_0AD6B5:         with r2            ;
CODE_0AD6B6:         add   r2           ;
CODE_0AD6B7:         ibt   r3,#FFF0     ;
CODE_0AD6B9:         link  #04          ;
CODE_0AD6BA:         iwt   r15,#D80B    ;
CODE_0AD6BD:         jmp r4             ;
CODE_0AD6BF:         iwt   r15,#D90D    ;
CODE_0AD6C2:         nop                ;
CODE_0AD6C3:         from r2            ;
CODE_0AD6C4:         lsr                ;
CODE_0AD6C5:         bcc CODE_0AD6CA    ;
CODE_0AD6C7:         nop                ;
CODE_0AD6C8:         with r9            ;
CODE_0AD6C9:         add   r4           ;
CODE_0AD6CA:         with r2            ;
CODE_0AD6CB:         add   r2           ;
CODE_0AD6CC:         ibt   r3,#0010     ;
CODE_0AD6CE:         link  #04          ;
CODE_0AD6CF:         iwt   r15,#D1A3    ;
CODE_0AD6D2:         jmp r4             ;
CODE_0AD6D4:         iwt   r15,#D912    ;
CODE_0AD6D7:         nop                ;
CODE_0AD6D8:         from r2            ;
CODE_0AD6D9:         lsr                ;
CODE_0AD6DA:         bcc CODE_0AD6DF    ;
CODE_0AD6DC:         nop                ;
CODE_0AD6DD:         with r10           ;
CODE_0AD6DE:         add   r4           ;
CODE_0AD6DF:         with r2            ;
CODE_0AD6E0:         add   r2           ;
CODE_0AD6E1:         ibt   r3,#FFF0     ;
CODE_0AD6E3:         iwt   r0,#1502     ;
CODE_0AD6E6:         add   r1           ;
CODE_0AD6E7:         ldw   (r0)         ;
CODE_0AD6E8:         ibt   r5,#0040     ;
CODE_0AD6EA:         sub   r5           ;
CODE_0AD6EB:         bcs CODE_0AD6F7    ;
CODE_0AD6ED:         nop                ;
CODE_0AD6EE:         iwt   r0,#11E2     ;
CODE_0AD6F1:         add   r1           ;
CODE_0AD6F2:         ldw   (r0)         ;
CODE_0AD6F3:         add   r0           ;
CODE_0AD6F4:         bcs CODE_0AD748    ;
CODE_0AD6F6:         nop                ;
CODE_0AD6F7:         link  #04          ;
CODE_0AD6F8:         iwt   r15,#D1B5    ;
CODE_0AD6FB:         jmp r4             ;
CODE_0AD6FD:         iwt   r15,#D912    ;
CODE_0AD700:         nop                ;
CODE_0AD701:         from r2            ;
CODE_0AD702:         lsr                ;
CODE_0AD703:         bcc CODE_0AD74C    ;
CODE_0AD705:         nop                ;
CODE_0AD706:         with r10           ;
CODE_0AD707:         add   r4           ;
CODE_0AD708:         iwt   r0,#1502     ;
CODE_0AD70B:         add   r1           ;
CODE_0AD70C:         ldw   (r0)         ;
CODE_0AD70D:         ibt   r5,#0040     ;
CODE_0AD70F:         sub   r5           ;
CODE_0AD710:         bcc CODE_0AD748    ;
CODE_0AD712:         nop                ;
CODE_0AD713:         ibt   r6,#FFFF     ;
CODE_0AD715:         iwt   r0,#1141     ;
CODE_0AD718:         add   r1           ;
CODE_0AD719:         from r6            ;
CODE_0AD71A:         stb   (r0)         ;
CODE_0AD71C:         iwt   r0,#272E     ;
CODE_0AD71F:         add   r1           ;
CODE_0AD720:         from r9            ;
CODE_0AD721:         stw   (r0)         ;
CODE_0AD722:         inc   r0           ;
CODE_0AD723:         inc   r0           ;
CODE_0AD724:         from r10           ;
CODE_0AD725:         stw   (r0)         ;
CODE_0AD726:         lms   r6,(0010)    ;
CODE_0AD729:         iwt   r0,#0EC2     ;
CODE_0AD72C:         add   r1           ;
CODE_0AD72D:         from r6            ;
CODE_0AD72E:         stb   (r0)         ;
CODE_0AD730:         sub   r0           ;
CODE_0AD731:         sms   (0010),r0    ;
CODE_0AD734:         iwt   r0,#0F62     ;
CODE_0AD737:         add   r1           ;
CODE_0AD738:         ldw   (r0)         ;
CODE_0AD739:         ibt   r6,#0020     ;
CODE_0AD73B:         and   r6           ;
CODE_0AD73C:         bne CODE_0AD748    ;
CODE_0AD73E:         nop                ;
CODE_0AD73F:         iwt   r0,#11E2     ;
CODE_0AD742:         to r4              ;
CODE_0AD743:         add   r1           ;
CODE_0AD744:         iwt   r0,#0100     ;
CODE_0AD747:         stw   (r4)         ;
CODE_0AD748:         iwt   r15,#D7EB    ;
CODE_0AD74B:         nop                ;
CODE_0AD74C:         iwt   r0,#1502     ;
CODE_0AD74F:         add   r1           ;
CODE_0AD750:         ldw   (r0)         ;
CODE_0AD751:         ibt   r5,#0040     ;
CODE_0AD753:         sub   r5           ;
CODE_0AD754:         bcs CODE_0AD748    ;
CODE_0AD756:         from r7            ;
CODE_0AD757:         and   #08          ;
CODE_0AD759:         bne CODE_0AD766    ;
CODE_0AD75B:         nop                ;
CODE_0AD75C:         lms   r0,(0002)    ;
CODE_0AD75F:         lms   r5,(01BC)    ;
CODE_0AD762:         sub   r5           ;
CODE_0AD763:         bmi CODE_0AD748    ;
CODE_0AD765:         nop                ;
CODE_0AD766:         iwt   r0,#1822     ;
CODE_0AD769:         add   r1           ;
CODE_0AD76A:         ldb   (r0)         ;
CODE_0AD76C:         dec   r0           ;
CODE_0AD76D:         bpl CODE_0AD748    ;
CODE_0AD76F:         nop                ;
CODE_0AD770:         ibt   r0,#0037     ;
CODE_0AD772:         sms   (007A),r0    ;
CODE_0AD775:         iwt   r5,#0201     ;
CODE_0AD778:         link  #04          ;
CODE_0AD779:         iwt   r15,#DFE3    ;
CODE_0AD77C:         nop                ;
CODE_0AD77D:         iwt   r0,#10A2     ;
CODE_0AD780:         add   r4           ;
CODE_0AD781:         from r9            ;
CODE_0AD782:         stw   (r0)         ;
CODE_0AD783:         lms   r0,(0002)    ;
CODE_0AD786:         to r5              ;
CODE_0AD787:         bic   #0F          ;
CODE_0AD789:         iwt   r0,#1142     ;
CODE_0AD78C:         add   r4           ;
CODE_0AD78D:         from r5            ;
CODE_0AD78E:         stw   (r0)         ;
CODE_0AD78F:         ibt   r5,#0005     ;
CODE_0AD791:         iwt   r0,#13C2     ;
CODE_0AD794:         add   r4           ;
CODE_0AD795:         from r5            ;
CODE_0AD796:         stw   (r0)         ;
CODE_0AD797:         ibt   r5,#0002     ;
CODE_0AD799:         iwt   r0,#1782     ;
CODE_0AD79C:         add   r4           ;
CODE_0AD79D:         from r5            ;
CODE_0AD79E:         stw   (r0)         ;
CODE_0AD79F:         ibt   r4,#0014     ;
CODE_0AD7A1:         iwt   r0,#11E2     ;
CODE_0AD7A4:         add   r1           ;
CODE_0AD7A5:         to r5              ;
CODE_0AD7A6:         ldw   (r0)         ;
CODE_0AD7A7:         iwt   r0,#11E0     ;
CODE_0AD7AA:         add   r1           ;
CODE_0AD7AB:         to r6              ;
CODE_0AD7AC:         ldw   (r0)         ;
CODE_0AD7AD:         move  r0,r5        ;
CODE_0AD7AF:         moves r6,r6        ;
CODE_0AD7B1:         bmi CODE_0AD7B6    ;
CODE_0AD7B3:         nop                ;
CODE_0AD7B4:         not                ;
CODE_0AD7B5:         inc   r0           ;
CODE_0AD7B6:         add   r6           ;
CODE_0AD7B7:         to r6              ;
CODE_0AD7B8:         xor   r6           ;
CODE_0AD7BA:         bpl CODE_0AD7C0    ;
CODE_0AD7BC:         nop                ;
CODE_0AD7BD:         ibt   r4,#0040     ;
CODE_0AD7BF:         sub   r0           ;
CODE_0AD7C0:         to r6              ;
CODE_0AD7C1:         div2               ;
CODE_0AD7C3:         add   r6           ;
CODE_0AD7C4:         sbk                ;
CODE_0AD7C5:         dec   r0           ;
CODE_0AD7C6:         bmi CODE_0AD7CB    ;
CODE_0AD7C8:         inc   r0           ;
CODE_0AD7C9:         not                ;
CODE_0AD7CA:         inc   r0           ;
CODE_0AD7CB:         iwt   r5,#FF00     ;
CODE_0AD7CE:         sub   r5           ;
CODE_0AD7CF:         bmi CODE_0AD7DF    ;
CODE_0AD7D1:         add   r5           ;
CODE_0AD7D2:         move  r5,r0        ;
CODE_0AD7D4:         iwt   r0,#FFC0     ;
CODE_0AD7D7:         sub   r5           ;
CODE_0AD7D8:         bpl CODE_0AD7DF    ;
CODE_0AD7DA:         nop                ;
CODE_0AD7DB:         ibt   r4,#0040     ;
CODE_0AD7DD:         ibt   r5,#0000     ;
CODE_0AD7DF:         iwt   r0,#11E2     ;
CODE_0AD7E2:         add   r1           ;
CODE_0AD7E3:         from r5            ;
CODE_0AD7E4:         stw   (r0)         ;
CODE_0AD7E5:         iwt   r0,#1502     ;
CODE_0AD7E8:         add   r1           ;
CODE_0AD7E9:         from r4            ;
CODE_0AD7EA:         stw   (r0)         ;
CODE_0AD7EB:         lms   r5,(0010)    ;
CODE_0AD7EE:         iwt   r0,#268E     ;
CODE_0AD7F1:         add   r1           ;
CODE_0AD7F2:         from r5            ;
CODE_0AD7F3:         stw   (r0)         ;
CODE_0AD7F4:         iwt   r0,#10A2     ;
CODE_0AD7F7:         add   r1           ;
CODE_0AD7F8:         from r9            ;
CODE_0AD7F9:         stw   (r0)         ;
CODE_0AD7FA:         iwt   r0,#16E0     ;
CODE_0AD7FD:         add   r1           ;
CODE_0AD7FE:         ldw   (r0)         ;
CODE_0AD7FF:         with r10           ;
CODE_0AD800:         sub   r0           ;
CODE_0AD801:         iwt   r0,#1142     ;
CODE_0AD804:         add   r1           ;
CODE_0AD805:         from r10           ;
CODE_0AD806:         stw   (r0)         ;
CODE_0AD807:         iwt   r15,#D07F    ;
CODE_0AD80A:         inc   r1           ;
CODE_0AD80B:         ibt   r11,#0030    ;
CODE_0AD80D:         iwt   r0,#1502     ;
CODE_0AD810:         add   r1           ;
CODE_0AD811:         ldw   (r0)         ;
CODE_0AD812:         ibt   r5,#0040     ;
CODE_0AD814:         sub   r5           ;
CODE_0AD815:         bcc CODE_0AD849    ;
CODE_0AD817:         nop                ;
CODE_0AD818:         link  #04          ;
CODE_0AD819:         iwt   r15,#D08D    ;
CODE_0AD81C:         and   #02          ;
CODE_0AD81F:         beq CODE_0AD844    ;
CODE_0AD821:         from r2            ;
CODE_0AD822:         and   #02          ;
CODE_0AD824:         bne CODE_0AD844    ;
CODE_0AD826:         from r3            ;
CODE_0AD827:         sex                ;
CODE_0AD828:         bmi CODE_0AD82C    ;
CODE_0AD82A:         hib                ;
CODE_0AD82B:         inc   r0           ;
CODE_0AD82C:         to r4              ;
CODE_0AD82D:         sex                ;
CODE_0AD82E:         iwt   r0,#11E0     ;
CODE_0AD831:         add   r1           ;
CODE_0AD832:         ldw   (r0)         ;
CODE_0AD833:         to r5              ;
CODE_0AD834:         xor   r3           ;
CODE_0AD836:         bpl CODE_0AD844    ;
CODE_0AD838:         inc   r2           ;
CODE_0AD839:         not                ;
CODE_0AD83A:         inc   r0           ;
CODE_0AD83B:         sbk                ;
CODE_0AD83C:         iwt   r0,#13C0     ;
CODE_0AD83F:         add   r1           ;
CODE_0AD840:         ldw   (r0)         ;
CODE_0AD841:         xor   #02          ;
CODE_0AD843:         sbk                ;
CODE_0AD844:         lms   r11,(0060)   ;
CODE_0AD847:         jmp   r11          ;
CODE_0AD848:         nop                ;

CODE_0AD849:         iwt   r0,#00C0     ;
CODE_0AD84C:         moves r3,r3        ;
CODE_0AD84E:         bpl CODE_0AD853    ;
CODE_0AD850:         nop                ;
CODE_0AD851:         ibt   r0,#0040     ;
CODE_0AD853:         sms   (0010),r0    ;
CODE_0AD856:         iwt   r0,#11E0     ;
CODE_0AD859:         add   r1           ;
CODE_0AD85A:         ldw   (r0)         ;
CODE_0AD85B:         xor   r3           ;
CODE_0AD85D:         bmi CODE_0AD866    ;
CODE_0AD85F:         nop                ;
CODE_0AD860:         inc   r14          ;
CODE_0AD861:         inc   r14          ;
CODE_0AD862:         ibt   r7,#0000     ;
CODE_0AD864:         jmp   r11          ;
CODE_0AD865:         nop                ;

CODE_0AD866:         link  #04          ;
CODE_0AD867:         iwt   r15,#D08D    ;
CODE_0AD86A:         lms   r0,(0000)    ;
CODE_0AD86E:         to r4              ;
CODE_0AD86F:         and   #0F          ;
CODE_0AD871:         sms   (0048),r4    ;
CODE_0AD874:         from r7            ;
CODE_0AD875:         and   #04          ;
CODE_0AD877:         sms   (0040),r0    ;
CODE_0AD87A:         bne CODE_0AD8A0    ;
CODE_0AD87C:         nop                ;
CODE_0AD87D:         sms   (0004),r6    ;
CODE_0AD880:         sms   (0006),r7    ;
CODE_0AD883:         sms   (0008),r8    ;
CODE_0AD886:         lms   r0,(0000)    ;
CODE_0AD889:         sms   (000A),r0    ;
CODE_0AD88C:         to r8              ;
CODE_0AD88D:         add   r3           ;
CODE_0AD88E:         lms   r0,(0002)    ;
CODE_0AD891:         sms   (000C),r0    ;
CODE_0AD894:         link  #04          ;
CODE_0AD895:         iwt   r15,#D096    ;
CODE_0AD898:         and   #04          ;
CODE_0AD89B:         beq CODE_0AD8E1    ;
CODE_0AD89D:         nop                ;
CODE_0AD89E:         with r4            ;
CODE_0AD89F:         sub   r3           ;
CODE_0AD8A0:         sms   (005C),r14   ;
CODE_0AD8A3:         from r8            ;
CODE_0AD8A4:         swap               ;
CODE_0AD8A5:         moves r3,r3        ;
CODE_0AD8A7:         bpl CODE_0AD8AC    ;
CODE_0AD8A9:         lsr                ;
CODE_0AD8AA:         inc   r0           ;
CODE_0AD8AB:         inc   r0           ;
CODE_0AD8AC:         iwt   r14,#BD0A    ;
CODE_0AD8AF:         to r14             ;
CODE_0AD8B0:         add   r14          ;
CODE_0AD8B1:         lms   r0,(0002)    ;
CODE_0AD8B4:         and   #0F          ;
CODE_0AD8B6:         add   r0           ;
CODE_0AD8B7:         add   r0           ;
CODE_0AD8B8:         add   r0           ;
CODE_0AD8B9:         to r14             ;
CODE_0AD8BA:         add   r14          ;
CODE_0AD8BB:         to r5              ;
CODE_0AD8BC:         getb               ;
CODE_0AD8BD:         inc   r14          ;
CODE_0AD8BE:         getbs              ;
CODE_0AD8C0:         lms   r14,(005C)   ;
CODE_0AD8C3:         sub   r4           ;
CODE_0AD8C4:         xor   r3           ;
CODE_0AD8C6:         bmi CODE_0AD8D9    ;
CODE_0AD8C8:         to r4              ;
CODE_0AD8C9:         xor   r3           ;
CODE_0AD8CB:         inc   r4           ;
CODE_0AD8CC:         sms   (0010),r5    ;
CODE_0AD8CF:         from r4            ;
CODE_0AD8D0:         add   #08          ;
CODE_0AD8D2:         ibt   r5,#0011     ;
CODE_0AD8D4:         sub   r5           ;
CODE_0AD8D5:         bcc CODE_0AD908    ;
CODE_0AD8D7:         inc   r2           ;
CODE_0AD8D8:         dec   r2           ;
CODE_0AD8D9:         lms   r0,(0040)    ;
CODE_0AD8DC:         sub   #04          ;
CODE_0AD8DE:         beq CODE_0AD908    ;
CODE_0AD8E0:         nop                ;
CODE_0AD8E1:         lms   r4,(0048)    ;
CODE_0AD8E4:         lms   r6,(0004)    ;
CODE_0AD8E7:         lms   r7,(0006)    ;
CODE_0AD8EA:         lms   r8,(0008)    ;
CODE_0AD8ED:         lms   r0,(000A)    ;
CODE_0AD8F0:         sms   (0000),r0    ;
CODE_0AD8F3:         lms   r0,(000C)    ;
CODE_0AD8F6:         sms   (0002),r0    ;
CODE_0AD8F9:         from r7            ;
CODE_0AD8FA:         and   #02          ;
CODE_0AD8FC:         beq CODE_0AD908    ;
CODE_0AD8FE:         nop                ;
CODE_0AD8FF:         inc   r2           ;
CODE_0AD900:         moves r0,r3        ;
CODE_0AD902:         bpl CODE_0AD906    ;
CODE_0AD904:         nop                ;
CODE_0AD905:         sub   r0           ;
CODE_0AD906:         to r4              ;
CODE_0AD907:         sub   r4           ;
CODE_0AD908:         lms   r11,(0060)   ;
CODE_0AD90B:         jmp   r11          ;
CODE_0AD90C:         nop                ;

CODE_0AD90D:         ibt   r3,#0000     ;
CODE_0AD90F:         bra CODE_0AD915    ;

CODE_0AD911:         from r2            ;
CODE_0AD912:         ibt   r3,#0001     ;
CODE_0AD914:         from r2            ;
CODE_0AD915:         lsr                ;
CODE_0AD916:         bcs CODE_0AD91D    ;
CODE_0AD918:         nop                ;
CODE_0AD919:         iwt   r15,#DD15    ;
CODE_0AD91C:         nop                ;
CODE_0AD91D:         iwt   r0,#1502     ;
CODE_0AD920:         add   r1           ;
CODE_0AD921:         ldw   (r0)         ;
CODE_0AD922:         ibt   r5,#0040     ;
CODE_0AD924:         sub   r5           ;
CODE_0AD925:         bcc CODE_0AD942    ;
CODE_0AD927:         nop                ;
CODE_0AD928:         iwt   r0,#1938     ;
CODE_0AD92B:         add   r1           ;
CODE_0AD92C:         ldw   (r0)         ;
CODE_0AD92D:         sub   #00          ;
CODE_0AD92F:         bne CODE_0AD940    ;
CODE_0AD931:         inc   r0           ;
CODE_0AD932:         sbk                ;
CODE_0AD933:         from r6            ;
CODE_0AD934:         hib                ;
CODE_0AD935:         iwt   r5,#008E     ;
CODE_0AD938:         sub   r5           ;
CODE_0AD939:         bne CODE_0AD940    ;
CODE_0AD93B:         nop                ;
CODE_0AD93C:         iwt   r15,#DCAC    ;
CODE_0AD93F:         nop                ;
CODE_0AD940:         jmp   r11          ;
CODE_0AD941:         nop                ;

CODE_0AD942:         iwt   r0,#F800     ;
CODE_0AD945:         and   r7           ;
CODE_0AD946:         iwt   r5,#4000     ;
CODE_0AD949:         sub   r5           ;
CODE_0AD94A:         beq CODE_0AD98E    ;
CODE_0AD94C:         nop                ;
CODE_0AD94D:         from r6            ;
CODE_0AD94E:         hib                ;
CODE_0AD94F:         ibt   r5,#007A     ;
CODE_0AD951:         sub   r5           ;
CODE_0AD952:         bne CODE_0AD959    ;
CODE_0AD954:         add   r5           ;
CODE_0AD955:         iwt   r15,#DB08    ;
CODE_0AD958:         nop                ;
CODE_0AD959:         ibt   r5,#007B     ;
CODE_0AD95B:         sub   r5           ;
CODE_0AD95C:         bne CODE_0AD963    ;
CODE_0AD95E:         add   r5           ;
CODE_0AD95F:         iwt   r15,#DBA0    ;
CODE_0AD962:         nop                ;
CODE_0AD963:         ibt   r5,#007C     ;
CODE_0AD965:         sub   r5           ;
CODE_0AD966:         bne CODE_0AD96D    ;
CODE_0AD968:         add   r5           ;
CODE_0AD969:         iwt   r15,#DC5B    ;
CODE_0AD96C:         nop                ;
CODE_0AD96D:         iwt   r5,#008E     ;
CODE_0AD970:         sub   r5           ;
CODE_0AD971:         bne CODE_0AD978    ;
CODE_0AD973:         nop                ;
CODE_0AD974:         iwt   r15,#DCAC    ;
CODE_0AD977:         nop                ;
CODE_0AD978:         iwt   r0,#1320     ;
CODE_0AD97B:         add   r1           ;
CODE_0AD97C:         ldw   (r0)         ;
CODE_0AD97D:         iwt   r5,#0107     ;
CODE_0AD980:         sub   r5           ;
CODE_0AD981:         ibt   r5,#001F     ;
CODE_0AD983:         beq CODE_0AD987    ;
CODE_0AD985:         nop                ;
CODE_0AD986:         inc   r5           ;
CODE_0AD987:         sms   (007A),r5    ;
CODE_0AD98A:         iwt   r15,#DA1A    ;
CODE_0AD98D:         nop                ;
CODE_0AD98E:         ibt   r5,#0002     ;
CODE_0AD990:         iwt   r0,#1502     ;
CODE_0AD993:         add   r1           ;
CODE_0AD994:         from r5            ;
CODE_0AD995:         stw   (r0)         ;
CODE_0AD996:         ibt   r0,#001C     ;
CODE_0AD998:         sms   (007A),r0    ;
CODE_0AD99B:         sms   (0060),r11   ;
CODE_0AD99E:         sms   (0048),r4    ;
CODE_0AD9A1:         sms   (004C),r6    ;
CODE_0AD9A4:         iwt   r5,#01C3     ;
CODE_0AD9A7:         link  #04          ;
CODE_0AD9A8:         iwt   r15,#DFE3    ;
CODE_0AD9AB:         nop                ;
CODE_0AD9AC:         lms   r0,(0000)    ;
CODE_0AD9AF:         to r5              ;
CODE_0AD9B0:         bic   #0F          ;
CODE_0AD9B2:         iwt   r0,#10A2     ;
CODE_0AD9B5:         add   r4           ;
CODE_0AD9B6:         from r5            ;
CODE_0AD9B7:         stw   (r0)         ;
CODE_0AD9B8:         lms   r0,(0002)    ;
CODE_0AD9BB:         to r5              ;
CODE_0AD9BC:         bic   #0F          ;
CODE_0AD9BE:         iwt   r0,#1142     ;
CODE_0AD9C1:         add   r4           ;
CODE_0AD9C2:         from r5            ;
CODE_0AD9C3:         stw   (r0)         ;
CODE_0AD9C4:         iwt   r0,#11E0     ;
CODE_0AD9C7:         add   r1           ;
CODE_0AD9C8:         ldw   (r0)         ;
CODE_0AD9C9:         not                ;
CODE_0AD9CA:         inc   r0           ;
CODE_0AD9CB:         div2               ;
CODE_0AD9CD:         div2               ;
CODE_0AD9CF:         div2               ;
CODE_0AD9D1:         to r5              ;
CODE_0AD9D2:         div2               ;
CODE_0AD9D4:         iwt   r0,#11E0     ;
CODE_0AD9D7:         add   r4           ;
CODE_0AD9D8:         from r5            ;
CODE_0AD9D9:         stw   (r0)         ;
CODE_0AD9DA:         iwt   r0,#11E2     ;
CODE_0AD9DD:         add   r1           ;
CODE_0AD9DE:         ldw   (r0)         ;
CODE_0AD9DF:         div2               ;
CODE_0AD9E1:         div2               ;
CODE_0AD9E3:         div2               ;
CODE_0AD9E5:         to r5              ;
CODE_0AD9E6:         div2               ;
CODE_0AD9E8:         iwt   r0,#11E2     ;
CODE_0AD9EB:         add   r4           ;
CODE_0AD9EC:         from r5            ;
CODE_0AD9ED:         stw   (r0)         ;
CODE_0AD9EE:         ibt   r5,#000A     ;
CODE_0AD9F0:         iwt   r0,#13C2     ;
CODE_0AD9F3:         add   r4           ;
CODE_0AD9F4:         from r5            ;
CODE_0AD9F5:         stw   (r0)         ;
CODE_0AD9F6:         ibt   r5,#0002     ;
CODE_0AD9F8:         iwt   r0,#1782     ;
CODE_0AD9FB:         add   r4           ;
CODE_0AD9FC:         from r5            ;
CODE_0AD9FD:         stw   (r0)         ;
CODE_0AD9FE:         ibt   r5,#0008     ;
CODE_0ADA00:         iwt   r0,#1502     ;
CODE_0ADA03:         add   r4           ;
CODE_0ADA04:         from r5            ;
CODE_0ADA05:         stw   (r0)         ;
CODE_0ADA06:         iwt   r5,#0400     ;
CODE_0ADA09:         iwt   r0,#15A2     ;
CODE_0ADA0C:         add   r4           ;
CODE_0ADA0D:         from r5            ;
CODE_0ADA0E:         stw   (r0)         ;
CODE_0ADA0F:         ibt   r0,#0004     ;
CODE_0ADA11:         stop               ;
CODE_0ADA12:         nop                ;

CODE_0ADA13:         lms   r11,(0060)   ;
CODE_0ADA16:         iwt   r15,#DAFA    ;
CODE_0ADA19:         nop                ;
CODE_0ADA1A:         sms   (0048),r4    ;
CODE_0ADA1D:         sms   (004C),r6    ;
CODE_0ADA20:         iwt   r0,#1502     ;
CODE_0ADA23:         add   r1           ;
CODE_0ADA24:         ldw   (r0)         ;
CODE_0ADA25:         to r5              ;
CODE_0ADA26:         sub   #03          ; number of times an egg will ricochet
CODE_0ADA28:         bcc CODE_0ADA60    ;
CODE_0ADA2A:         inc   r0           ; change to 01 to make eggs bounce infinitely
CODE_0ADA2B:         iwt   r0,#009E     ; sound eggs make when they die
CODE_0ADA2E:         sms   (007A),r0    ;
CODE_0ADA31:         ibt   r5,#000E     ;
CODE_0ADA33:         iwt   r0,#0EC0     ; change to #0000 to make eggs collectible after the final hit, rather than having them fall away
CODE_0ADA36:         add   r1           ;
CODE_0ADA37:         from r5            ;
CODE_0ADA38:         stw   (r0)         ;
CODE_0ADA39:         ibt   r5,#0000     ;
CODE_0ADA3B:         iwt   r0,#1CF8     ;
CODE_0ADA3E:         add   r1           ;
CODE_0ADA3F:         from r5            ;
CODE_0ADA40:         stw   (r0)         ;
CODE_0ADA41:         iwt   r0,#11E0     ; how far the egg falls away horizontally after the last ricochet
CODE_0ADA44:         add   r1           ;
CODE_0ADA45:         ldw   (r0)         ;
CODE_0ADA46:         div2               ;
CODE_0ADA48:         div2               ;
CODE_0ADA4A:         sbk                ;
CODE_0ADA4B:         iwt   r0,#11E2     ; how far the egg falls away vertically after the last ricochet
CODE_0ADA4E:         add   r1           ;
CODE_0ADA4F:         ldw   (r0)         ;
CODE_0ADA50:         div2               ;
CODE_0ADA52:         div2               ;
CODE_0ADA54:         sbk                ;
CODE_0ADA55:         ibt   r5,#0040     ;
CODE_0ADA57:         iwt   r0,#1502     ;
CODE_0ADA5A:         add   r1           ;
CODE_0ADA5B:         from r5            ;
CODE_0ADA5C:         stw   (r0)         ;
CODE_0ADA5D:         bra CODE_0ADA8B    ;

CODE_0ADA5F:         nop                ;

CODE_0ADA60:         sbk                ;
CODE_0ADA61:         iwt   r0,#1320     ; change to #0000 to make eggs stay green during ricochets
CODE_0ADA64:         add   r1           ;
CODE_0ADA65:         ldw   (r0)         ;
CODE_0ADA66:         iwt   r5,#0024     ;
CODE_0ADA69:         sub   r5           ;
CODE_0ADA6A:         bcc CODE_0ADA8B    ;
CODE_0ADA6C:         add   r5           ;
CODE_0ADA6D:         iwt   r5,#0026     ;
CODE_0ADA70:         sub   r5           ;
CODE_0ADA71:         bcs CODE_0ADA8B    ;
CODE_0ADA73:         add   r5           ;
CODE_0ADA74:         dec   r0           ;
CODE_0ADA75:         sbk                ;
CODE_0ADA76:         move  r5,r14       ;
CODE_0ADA78:         add   r0           ;
CODE_0ADA79:         iwt   r14,#9F1B    ;
CODE_0ADA7C:         to r14             ;
CODE_0ADA7D:         add   r14          ;
CODE_0ADA7E:         to r14             ;
CODE_0ADA7F:         getb               ;
CODE_0ADA80:         iwt   r0,#1002     ;
CODE_0ADA83:         add   r1           ;
CODE_0ADA84:         ldw   (r0)         ;
CODE_0ADA85:         bic   #0E          ;
CODE_0ADA87:         or    r14          ;
CODE_0ADA88:         sbk                ;
CODE_0ADA89:         move  r14,r5       ;
CODE_0ADA8B:         sms   (004E),r7    ;
CODE_0ADA8E:         sms   (0050),r8    ;
CODE_0ADA91:         sms   (005C),r14   ;
CODE_0ADA94:         dec   r3           ;
CODE_0ADA95:         bpl CODE_0ADAA0    ;
CODE_0ADA97:         inc   r3           ;
CODE_0ADA98:         iwt   r0,#13C0     ;
CODE_0ADA9B:         add   r1           ;
CODE_0ADA9C:         ldw   (r0)         ;
CODE_0ADA9D:         xor   #02          ;
CODE_0ADA9F:         sbk                ;
CODE_0ADAA0:         ibt   r0,#0008     ;
CODE_0ADAA2:         romb               ;
CODE_0ADAA4:         lms   r0,(0010)    ;
CODE_0ADAA7:         add   r0           ;
CODE_0ADAA8:         lob                ;
CODE_0ADAA9:         iwt   r14,#AE18    ;
CODE_0ADAAC:         to r14             ;
CODE_0ADAAD:         add   r14          ;
CODE_0ADAAE:         getb               ;
CODE_0ADAAF:         to r6              ;
CODE_0ADAB0:         swap               ;
CODE_0ADAB1:         iwt   r0,#11E0     ;
CODE_0ADAB4:         add   r1           ;
CODE_0ADAB5:         to r4              ;
CODE_0ADAB6:         ldw   (r0)         ;
CODE_0ADAB7:         from r4            ;
CODE_0ADAB8:         fmult              ;
CODE_0ADAB9:         to r7              ;
CODE_0ADABA:         rol                ;
CODE_0ADABB:         iwt   r0,#11E2     ;
CODE_0ADABE:         add   r1           ;
CODE_0ADABF:         to r5              ;
CODE_0ADAC0:         ldw   (r0)         ;
CODE_0ADAC1:         from r5            ;
CODE_0ADAC2:         fmult              ;
CODE_0ADAC3:         to r8              ;
CODE_0ADAC4:         rol                ;
CODE_0ADAC5:         ibt   r0,#0040     ;
CODE_0ADAC7:         to r14             ;
CODE_0ADAC8:         add   r14          ;
CODE_0ADAC9:         getb               ;
CODE_0ADACA:         to r6              ;
CODE_0ADACB:         swap               ;
CODE_0ADACC:         ibt   r0,#000A     ;
CODE_0ADACE:         romb               ;
CODE_0ADAD0:         from r5            ;
CODE_0ADAD1:         fmult              ;
CODE_0ADAD2:         rol                ;
CODE_0ADAD3:         add   r7           ;
CODE_0ADAD4:         to r5              ;
CODE_0ADAD5:         add   r0           ;
CODE_0ADAD6:         iwt   r0,#11E0     ;
CODE_0ADAD9:         add   r1           ;
CODE_0ADADA:         from r5            ;
CODE_0ADADB:         stw   (r0)         ;
CODE_0ADADC:         from r4            ;
CODE_0ADADD:         fmult              ;
CODE_0ADADE:         rol                ;
CODE_0ADADF:         sub   r8           ;
CODE_0ADAE0:         to r4              ;
CODE_0ADAE1:         add   r0           ;
CODE_0ADAE2:         iwt   r0,#11E2     ;
CODE_0ADAE5:         add   r1           ;
CODE_0ADAE6:         from r4            ;
CODE_0ADAE7:         stw   (r0)         ;
CODE_0ADAE8:         lms   r7,(004E)    ;
CODE_0ADAEB:         lms   r8,(0050)    ;
CODE_0ADAEE:         lms   r14,(005C)   ;
CODE_0ADAF1:         ibt   r5,#0001     ;
CODE_0ADAF3:         iwt   r0,#18C2     ;
CODE_0ADAF6:         add   r1           ;
CODE_0ADAF7:         from r5            ;
CODE_0ADAF8:         stb   (r0)         ;
CODE_0ADAFA:         lms   r4,(0048)    ;
CODE_0ADAFD:         lms   r6,(004C)    ;
CODE_0ADB00:         jmp   r11          ;
CODE_0ADB01:         nop                ;

DATA_0ADB02:         dw $7A02, $7A04, $0000

CODE_0ADB08:         ibt   r5,#0000     ;
CODE_0ADB0A:         iwt   r0,#1502     ;
CODE_0ADB0D:         add   r1           ;
CODE_0ADB0E:         from r5            ;
CODE_0ADB0F:         stw   (r0)         ;
CODE_0ADB10:         inc   r5           ;
CODE_0ADB11:         iwt   r0,#18C2     ;
CODE_0ADB14:         add   r1           ;
CODE_0ADB15:         from r5            ;
CODE_0ADB16:         stw   (r0)         ;
CODE_0ADB17:         sms   (0048),r4    ;
CODE_0ADB1A:         sms   (004C),r6    ;
CODE_0ADB1D:         from r6            ;
CODE_0ADB1E:         lob                ;
CODE_0ADB1F:         lsr                ;
CODE_0ADB20:         lms   r6,(0000)    ;
CODE_0ADB23:         bcc CODE_0ADB2C    ;
CODE_0ADB25:         add   r0           ;
CODE_0ADB26:         ibt   r5,#0010     ;
CODE_0ADB28:         with r6            ;
CODE_0ADB29:         sub   r5           ;
CODE_0ADB2A:         from r6            ;
CODE_0ADB2B:         sbk                ;
CODE_0ADB2C:         move  r4,r14       ;
CODE_0ADB2E:         iwt   r14,#DB02    ;
CODE_0ADB31:         to r14             ;
CODE_0ADB32:         add   r14          ;
CODE_0ADB33:         getb               ;
CODE_0ADB34:         inc   r14          ;
CODE_0ADB35:         to r5              ;
CODE_0ADB36:         getbh              ;
CODE_0ADB38:         move  r14,r4       ;
CODE_0ADB3A:         ibt   r0,#000E     ;
CODE_0ADB3C:         stop               ;
CODE_0ADB3D:         nop                ;

CODE_0ADB3E:         ibt   r0,#0010     ;
CODE_0ADB40:         add   r6           ;
CODE_0ADB41:         sms   (0000),r0    ;
CODE_0ADB44:         moves r5,r5        ;
CODE_0ADB46:         beq CODE_0ADB51    ;
CODE_0ADB48:         nop                ;
CODE_0ADB49:         ibt   r0,#0008     ;
CODE_0ADB4B:         sms   (007A),r0    ;
CODE_0ADB4E:         bra CODE_0ADB94    ;

CODE_0ADB50:         inc   r5           ;

CODE_0ADB51:         ibt   r0,#0032     ;
CODE_0ADB53:         sms   (007A),r0    ;
CODE_0ADB56:         move  r6,r11       ;
CODE_0ADB58:         iwt   r5,#020A     ;
CODE_0ADB5B:         link  #04          ;
CODE_0ADB5C:         iwt   r15,#DFE3    ;
CODE_0ADB5F:         nop                ;
CODE_0ADB60:         lms   r0,(0000)    ;
CODE_0ADB63:         bic   #0F          ;
CODE_0ADB65:         to r5              ;
CODE_0ADB66:         sub   #08          ;
CODE_0ADB68:         iwt   r0,#10A2     ;
CODE_0ADB6B:         add   r4           ;
CODE_0ADB6C:         from r5            ;
CODE_0ADB6D:         stw   (r0)         ;
CODE_0ADB6E:         lms   r0,(0002)    ;
CODE_0ADB71:         to r5              ;
CODE_0ADB72:         bic   #0F          ;
CODE_0ADB74:         iwt   r0,#1142     ;
CODE_0ADB77:         add   r4           ;
CODE_0ADB78:         from r5            ;
CODE_0ADB79:         stw   (r0)         ;
CODE_0ADB7A:         ibt   r5,#0004     ;
CODE_0ADB7C:         iwt   r0,#13C2     ;
CODE_0ADB7F:         add   r4           ;
CODE_0ADB80:         from r5            ;
CODE_0ADB81:         stw   (r0)         ;
CODE_0ADB82:         iwt   r0,#1E4C     ;
CODE_0ADB85:         add   r4           ;
CODE_0ADB86:         from r5            ;
CODE_0ADB87:         stw   (r0)         ;
CODE_0ADB88:         ibt   r5,#0008     ;
CODE_0ADB8A:         iwt   r0,#1782     ;
CODE_0ADB8D:         add   r4           ;
CODE_0ADB8E:         from r5            ;
CODE_0ADB8F:         stw   (r0)         ;
CODE_0ADB90:         move  r11,r6       ;
CODE_0ADB92:         ibt   r5,#0000     ;
CODE_0ADB94:         ibt   r0,#000E     ;
CODE_0ADB96:         stop               ;
CODE_0ADB97:         nop                ;

CODE_0ADB98:         iwt   r15,#DA8B    ;
CODE_0ADB9B:         nop                ;

DATA_0ADB9C:         dw $7B04, $0000

CODE_0ADBA0:         ibt   r5,#0000     ;
CODE_0ADBA2:         iwt   r0,#1502     ;
CODE_0ADBA5:         add   r1           ;
CODE_0ADBA6:         from r5            ;
CODE_0ADBA7:         stw   (r0)         ;
CODE_0ADBA8:         inc   r5           ;
CODE_0ADBA9:         iwt   r0,#18C2     ;
CODE_0ADBAC:         add   r1           ;
CODE_0ADBAD:         from r5            ;
CODE_0ADBAE:         stw   (r0)         ;
CODE_0ADBAF:         sms   (0048),r4    ;
CODE_0ADBB2:         sms   (004C),r6    ;
CODE_0ADBB5:         sms   (004E),r7    ;
CODE_0ADBB8:         from r6            ;
CODE_0ADBB9:         lob                ;
CODE_0ADBBA:         lsr                ;
CODE_0ADBBB:         lms   r7,(0000)    ;
CODE_0ADBBE:         bcc CODE_0ADBC7    ;
CODE_0ADBC0:         nop                ;
CODE_0ADBC1:         ibt   r5,#0010     ;
CODE_0ADBC3:         with r7            ;
CODE_0ADBC4:         sub   r5           ;
CODE_0ADBC5:         from r7            ;
CODE_0ADBC6:         sbk                ;
CODE_0ADBC7:         lsr                ;
CODE_0ADBC8:         lms   r6,(0002)    ;
CODE_0ADBCB:         bcc CODE_0ADBD4    ;
CODE_0ADBCD:         add   r0           ;
CODE_0ADBCE:         ibt   r5,#0010     ;
CODE_0ADBD0:         with r6            ;
CODE_0ADBD1:         sub   r5           ;
CODE_0ADBD2:         from r6            ;
CODE_0ADBD3:         sbk                ;
CODE_0ADBD4:         move  r4,r14       ;
CODE_0ADBD6:         iwt   r14,#DB9C    ;
CODE_0ADBD9:         to r14             ;
CODE_0ADBDA:         add   r14          ;
CODE_0ADBDB:         getb               ;
CODE_0ADBDC:         inc   r14          ;
CODE_0ADBDD:         to r5              ;
CODE_0ADBDE:         getbh              ;
CODE_0ADBE0:         move  r14,r4       ;
CODE_0ADBE2:         moves r5,r5        ;
CODE_0ADBE4:         bne CODE_0ADC2A    ;
CODE_0ADBE6:         nop                ;
CODE_0ADBE7:         ibt   r0,#000C     ;
CODE_0ADBE9:         stop               ;
CODE_0ADBEA:         nop                ;

CODE_0ADBEB:         sms   (0060),r11   ;
CODE_0ADBEE:         ibt   r0,#0048     ;
CODE_0ADBF0:         sms   (007A),r0    ;
CODE_0ADBF3:         iwt   r5,#020C     ;
CODE_0ADBF6:         link  #04          ;
CODE_0ADBF7:         iwt   r15,#DFE3    ;
CODE_0ADBFA:         nop                ;
CODE_0ADBFB:         from r7            ;
CODE_0ADBFC:         bic   #0F          ;
CODE_0ADBFE:         to r5              ;
CODE_0ADBFF:         add   #08          ;
CODE_0ADC01:         iwt   r0,#10A2     ;
CODE_0ADC04:         add   r4           ;
CODE_0ADC05:         from r5            ;
CODE_0ADC06:         stw   (r0)         ;
CODE_0ADC07:         from r6            ;
CODE_0ADC08:         bic   #0F          ;
CODE_0ADC0A:         to r5              ;
CODE_0ADC0B:         add   #08          ;
CODE_0ADC0D:         iwt   r0,#1142     ;
CODE_0ADC10:         add   r4           ;
CODE_0ADC11:         from r5            ;
CODE_0ADC12:         stw   (r0)         ;
CODE_0ADC13:         ibt   r5,#000D     ;
CODE_0ADC15:         iwt   r0,#13C2     ;
CODE_0ADC18:         add   r4           ;
CODE_0ADC19:         from r5            ;
CODE_0ADC1A:         stw   (r0)         ;
CODE_0ADC1B:         ibt   r5,#0002     ;
CODE_0ADC1D:         iwt   r0,#1782     ;
CODE_0ADC20:         add   r4           ;
CODE_0ADC21:         from r5            ;
CODE_0ADC22:         stw   (r0)         ;
CODE_0ADC23:         lms   r11,(0060)   ;
CODE_0ADC26:         iwt   r15,#DA8E    ;
CODE_0ADC29:         nop                ;
CODE_0ADC2A:         ibt   r0,#000A     ;
CODE_0ADC2C:         sms   (007A),r0    ;
CODE_0ADC2F:         ibt   r0,#000E     ;
CODE_0ADC31:         stop               ;
CODE_0ADC32:         nop                ;

CODE_0ADC33:         ibt   r0,#0010     ;
CODE_0ADC35:         add   r7           ;
CODE_0ADC36:         sms   (0000),r0    ;
CODE_0ADC39:         inc   r5           ;
CODE_0ADC3A:         ibt   r0,#000E     ;
CODE_0ADC3C:         stop               ;
CODE_0ADC3D:         nop                ;

CODE_0ADC3E:         sms   (0000),r7    ;
CODE_0ADC41:         ibt   r0,#0010     ;
CODE_0ADC43:         add   r6           ;
CODE_0ADC44:         sms   (0002),r0    ;
CODE_0ADC47:         inc   r5           ;
CODE_0ADC48:         ibt   r0,#000E     ;
CODE_0ADC4A:         stop               ;
CODE_0ADC4B:         nop                ;

CODE_0ADC4C:         ibt   r0,#0010     ;
CODE_0ADC4E:         add   r7           ;
CODE_0ADC4F:         sms   (0000),r0    ;
CODE_0ADC52:         inc   r5           ;
CODE_0ADC53:         ibt   r0,#000E     ;
CODE_0ADC55:         stop               ;
CODE_0ADC56:         nop                ;

CODE_0ADC57:         iwt   r15,#DA8E    ;
CODE_0ADC5A:         nop                ;

CODE_0ADC5B:         ibt   r5,#0001     ;
CODE_0ADC5D:         iwt   r0,#18C2     ;
CODE_0ADC60:         add   r1           ;
CODE_0ADC61:         from r5            ;
CODE_0ADC62:         stw   (r0)         ;
CODE_0ADC63:         ibt   r0,#0004     ;
CODE_0ADC65:         sms   (007A),r0    ;
CODE_0ADC68:         sms   (0060),r11   ;
CODE_0ADC6B:         sms   (0048),r4    ;
CODE_0ADC6E:         sms   (004C),r6    ;
CODE_0ADC71:         iwt   r5,#020B     ;
CODE_0ADC74:         link  #04          ;
CODE_0ADC75:         iwt   r15,#DFE3    ;
CODE_0ADC78:         nop                ;
CODE_0ADC79:         lms   r0,(0000)    ;
CODE_0ADC7C:         to r5              ;
CODE_0ADC7D:         bic   #0F          ;
CODE_0ADC7F:         iwt   r0,#10A2     ;
CODE_0ADC82:         add   r4           ;
CODE_0ADC83:         from r5            ;
CODE_0ADC84:         stw   (r0)         ;
CODE_0ADC85:         lms   r0,(0002)    ;
CODE_0ADC88:         to r5              ;
CODE_0ADC89:         bic   #0F          ;
CODE_0ADC8B:         iwt   r0,#1142     ;
CODE_0ADC8E:         add   r4           ;
CODE_0ADC8F:         from r5            ;
CODE_0ADC90:         stw   (r0)         ;
CODE_0ADC91:         ibt   r5,#000C     ;
CODE_0ADC93:         iwt   r0,#13C2     ;
CODE_0ADC96:         add   r4           ;
CODE_0ADC97:         from r5            ;
CODE_0ADC98:         stw   (r0)         ;
CODE_0ADC99:         ibt   r5,#0002     ;
CODE_0ADC9B:         iwt   r0,#1782     ;
CODE_0ADC9E:         add   r4           ;
CODE_0ADC9F:         from r5            ;
CODE_0ADCA0:         stw   (r0)         ;
CODE_0ADCA1:         ibt   r0,#0018     ;
CODE_0ADCA3:         stop               ;
CODE_0ADCA4:         nop                ;

CODE_0ADCA5:         lms   r11,(0060)   ;
CODE_0ADCA8:         iwt   r15,#DA20    ;
CODE_0ADCAB:         nop                ;

CODE_0ADCAC:         ibt   r5,#0001     ;
CODE_0ADCAE:         iwt   r0,#18C2     ;
CODE_0ADCB1:         add   r1           ;
CODE_0ADCB2:         from r5            ;
CODE_0ADCB3:         stw   (r0)         ;
CODE_0ADCB4:         ibt   r0,#0004     ;
CODE_0ADCB6:         sms   (007A),r0    ;
CODE_0ADCB9:         sms   (0060),r11   ;
CODE_0ADCBC:         sms   (0048),r4    ;
CODE_0ADCBF:         sms   (004C),r6    ;
CODE_0ADCC2:         iwt   r5,#0190     ;
CODE_0ADCC5:         link  #04          ;
CODE_0ADCC6:         iwt   r15,#DE1C    ;
CODE_0ADCC9:         nop                ;
CODE_0ADCCA:         lms   r11,(0060)   ;
CODE_0ADCCD:         bmi CODE_0ADD11    ;
CODE_0ADCCF:         nop                ;
CODE_0ADCD0:         lms   r0,(0000)    ;
CODE_0ADCD3:         to r5              ;
CODE_0ADCD4:         bic   #0F          ;
CODE_0ADCD6:         iwt   r0,#10E2     ;
CODE_0ADCD9:         add   r4           ;
CODE_0ADCDA:         from r5            ;
CODE_0ADCDB:         stw   (r0)         ;
CODE_0ADCDC:         lms   r0,(0002)    ;
CODE_0ADCDF:         to r5              ;
CODE_0ADCE0:         bic   #0F          ;
CODE_0ADCE2:         iwt   r0,#1182     ;
CODE_0ADCE5:         add   r4           ;
CODE_0ADCE6:         from r5            ;
CODE_0ADCE7:         stw   (r0)         ;
CODE_0ADCE8:         ibt   r5,#0002     ;
CODE_0ADCEA:         iwt   r0,#1976     ;
CODE_0ADCED:         add   r4           ;
CODE_0ADCEE:         from r5            ;
CODE_0ADCEF:         stw   (r0)         ;
CODE_0ADCF0:         iwt   r0,#1502     ;
CODE_0ADCF3:         add   r1           ;
CODE_0ADCF4:         to r0              ;
CODE_0ADCF5:         ldw   (r0)         ;
CODE_0ADCF6:         ibt   r5,#0040     ;
CODE_0ADCF8:         sub   r5           ;
CODE_0ADCF9:         bcs CODE_0ADD09    ;
CODE_0ADCFB:         add   r5           ;
CODE_0ADCFC:         to r5              ;
CODE_0ADCFD:         sub   #03          ;
CODE_0ADCFF:         bcc CODE_0ADD04    ;
CODE_0ADD01:         inc   r0           ;
CODE_0ADD02:         ibt   r0,#0040     ;
CODE_0ADD04:         sbk                ;
CODE_0ADD05:         iwt   r15,#DAFA    ;
CODE_0ADD08:         nop                ;
CODE_0ADD09:         ibt   r5,#0030     ;
CODE_0ADD0B:         iwt   r0,#1978     ;
CODE_0ADD0E:         add   r4           ;
CODE_0ADD0F:         from r5            ;
CODE_0ADD10:         stw   (r0)         ;
CODE_0ADD11:         iwt   r15,#DA20    ;
CODE_0ADD14:         nop                ;
CODE_0ADD15:         iwt   r0,#F800     ;
CODE_0ADD18:         and   r7           ;
CODE_0ADD19:         iwt   r5,#3000     ;
CODE_0ADD1C:         sub   r5           ;
CODE_0ADD1D:         beq CODE_0ADD86    ;
CODE_0ADD1F:         add   r5           ;
CODE_0ADD20:         iwt   r5,#B000     ;
CODE_0ADD23:         sub   r5           ;
CODE_0ADD24:         beq CODE_0ADD7D    ;
CODE_0ADD26:         add   r5           ;
CODE_0ADD27:         iwt   r5,#A800     ;
CODE_0ADD2A:         sub   r5           ;
CODE_0ADD2B:         bne CODE_0ADD7B    ;
CODE_0ADD2D:         nop                ;
CODE_0ADD2E:         iwt   r0,#1AB6     ;
CODE_0ADD31:         add   r1           ;
CODE_0ADD32:         ldw   (r0)         ;
CODE_0ADD33:         sub   #00          ;
CODE_0ADD35:         bne CODE_0ADD7B    ;
CODE_0ADD37:         nop                ;
CODE_0ADD38:         ibt   r5,#0008     ;
CODE_0ADD3A:         iwt   r0,#1AB6     ;
CODE_0ADD3D:         add   r1           ;
CODE_0ADD3E:         from r5            ;
CODE_0ADD3F:         stw   (r0)         ;
CODE_0ADD40:         ibt   r0,#0007     ;
CODE_0ADD42:         sms   (007A),r0    ;
CODE_0ADD45:         sms   (0060),r11   ;
CODE_0ADD48:         iwt   r5,#0214     ;
CODE_0ADD4B:         link  #04          ;
CODE_0ADD4C:         iwt   r15,#DFE3    ;
CODE_0ADD4F:         nop                ;
CODE_0ADD50:         lms   r11,(0060)   ;
CODE_0ADD53:         lms   r0,(0000)    ;
CODE_0ADD56:         to r5              ;
CODE_0ADD57:         bic   #0F          ;
CODE_0ADD59:         iwt   r0,#10A2     ;
CODE_0ADD5C:         add   r4           ;
CODE_0ADD5D:         from r5            ;
CODE_0ADD5E:         stw   (r0)         ;
CODE_0ADD5F:         lms   r0,(0002)    ;
CODE_0ADD62:         to r5              ;
CODE_0ADD63:         bic   #0F          ;
CODE_0ADD65:         iwt   r0,#1142     ;
CODE_0ADD68:         add   r4           ;
CODE_0ADD69:         from r5            ;
CODE_0ADD6A:         stw   (r0)         ;
CODE_0ADD6B:         ibt   r5,#000E     ;
CODE_0ADD6D:         iwt   r0,#13C2     ;
CODE_0ADD70:         add   r4           ;
CODE_0ADD71:         from r5            ;
CODE_0ADD72:         stw   (r0)         ;
CODE_0ADD73:         ibt   r5,#0004     ;
CODE_0ADD75:         iwt   r0,#1782     ;
CODE_0ADD78:         add   r4           ;
CODE_0ADD79:         from r5            ;
CODE_0ADD7A:         stw   (r0)         ;
CODE_0ADD7B:         jmp   r11          ;
CODE_0ADD7C:         nop                ;

CODE_0ADD7D:         lm    r0,(1E08)    ;
CODE_0ADD81:         and   #08          ;
CODE_0ADD83:         beq CODE_0ADD8F    ;
CODE_0ADD85:         nop                ;
CODE_0ADD86:         ibt   r0,#0009     ;
CODE_0ADD88:         sms   (007A),r0    ;
CODE_0ADD8B:         ibt   r0,#0002     ;
CODE_0ADD8D:         stop               ;
CODE_0ADD8E:         nop                ;

CODE_0ADD8F:         jmp   r11          ;
CODE_0ADD90:         nop                ;

CODE_0ADD91:         link  #04          ;
CODE_0ADD92:         iwt   r15,#D372    ;
CODE_0ADD95:         with r11           ;
CODE_0ADD96:         link  #04          ;
CODE_0ADD97:         iwt   r15,#D90D    ;
CODE_0ADD9A:         nop                ;
CODE_0ADD9B:         iwt   r15,#D07F    ;
CODE_0ADD9E:         inc   r1           ;
CODE_0ADD9F:         link  #04          ;
CODE_0ADDA0:         iwt   r15,#D372    ;
CODE_0ADDA3:         with r11           ;
CODE_0ADDA4:         with r2            ;
CODE_0ADDA5:         add   r2           ;
CODE_0ADDA6:         with r2            ;
CODE_0ADDA7:         add   r2           ;
CODE_0ADDA8:         iwt   r0,#11E0     ;
CODE_0ADDAB:         add   r1           ;
CODE_0ADDAC:         ldw   (r0)         ;
CODE_0ADDAD:         dec   r0           ;
CODE_0ADDAE:         bpl CODE_0ADDC8    ;
CODE_0ADDB0:         nop                ;
CODE_0ADDB1:         ibt   r3,#0001     ;
CODE_0ADDB3:         link  #04          ;
CODE_0ADDB4:         iwt   r15,#D3B0    ;
CODE_0ADDB7:         sm    (11E0),r0    ;
CODE_0ADDBB:         add   r1           ;
CODE_0ADDBC:         ldw   (r0)         ;
CODE_0ADDBD:         sub   #00          ;
CODE_0ADDBF:         beq CODE_0ADDCB    ;
CODE_0ADDC1:         with r2            ;
CODE_0ADDC2:         add   r2           ;
CODE_0ADDC3:         inc   r14          ;
CODE_0ADDC4:         inc   r14          ;
CODE_0ADDC5:         bra CODE_0ADDD4    ;

CODE_0ADDC7:         with r2            ;
CODE_0ADDC8:         inc   r14          ;
CODE_0ADDC9:         inc   r14          ;
CODE_0ADDCA:         with r2            ;
CODE_0ADDCB:         add   r2           ;
CODE_0ADDCC:         ibt   r3,#FFFF     ;
CODE_0ADDCE:         link  #04          ;
CODE_0ADDCF:         iwt   r15,#D3B0    ;
CODE_0ADDD2:         add   #02          ;
CODE_0ADDD5:         link  #04          ;
CODE_0ADDD6:         iwt   r15,#D352    ;
CODE_0ADDD9:         with r11           ;
CODE_0ADDDA:         with r2            ;
CODE_0ADDDB:         add   r2           ;
CODE_0ADDDC:         link  #04          ;
CODE_0ADDDD:         iwt   r15,#D352    ;
CODE_0ADDE0:         moves r11,r2       ;
CODE_0ADDE2:         and   #03          ;
CODE_0ADDE4:         sub   #03          ;
CODE_0ADDE6:         beq CODE_0ADDEC    ;
CODE_0ADDE8:         with r2            ;
CODE_0ADDE9:         bic   #03          ;
CODE_0ADDEB:         with r2            ;
CODE_0ADDEC:         lsr                ;
CODE_0ADDED:         from r2            ;
CODE_0ADDEE:         lsr                ;
CODE_0ADDEF:         bcc CODE_0ADDFA    ;
CODE_0ADDF1:         nop                ;
CODE_0ADDF2:         inc   r10          ;
CODE_0ADDF3:         iwt   r0,#11E2     ;
CODE_0ADDF6:         to r4              ;
CODE_0ADDF7:         add   r1           ;
CODE_0ADDF8:         sub   r0           ;
CODE_0ADDF9:         stw   (r4)         ;
CODE_0ADDFA:         with r2            ;
CODE_0ADDFB:         add   r2           ;
CODE_0ADDFC:         ibt   r3,#FFF0     ;
CODE_0ADDFE:         link  #04          ;
CODE_0ADDFF:         iwt   r15,#D1B5    ;
CODE_0ADE02:         add   #02          ;
CODE_0ADE05:         ibt   r3,#FFF0     ;
CODE_0ADE07:         link  #04          ;
CODE_0ADE08:         iwt   r15,#D1B5    ;
CODE_0ADE0B:         and   #03          ;
CODE_0ADE0F:         sub   #03          ;
CODE_0ADE11:         beq CODE_0ADE17    ;
CODE_0ADE13:         with r2            ;
CODE_0ADE14:         bic   #03          ;
CODE_0ADE16:         with r2            ;
CODE_0ADE17:         lsr                ;
CODE_0ADE18:         iwt   r15,#D570    ;
CODE_0ADE1B:         from r2            ;
CODE_0ADE1C:         sms   (0058),r12   ;
CODE_0ADE1F:         sms   (005A),r13   ;
CODE_0ADE22:         iwt   r4,#0F5C     ;
CODE_0ADE25:         ibt   r12,#0012    ;
CODE_0ADE27:         move  r13,r15      ;
CODE_0ADE29:         ldb   (r4)         ;
CODE_0ADE2B:         sub   #00          ;
CODE_0ADE2D:         beq CODE_0ADE3D    ;
CODE_0ADE2F:         dec   r4           ;
CODE_0ADE30:         dec   r4           ;
CODE_0ADE31:         dec   r4           ;
CODE_0ADE32:         loop               ;
CODE_0ADE33:         dec   r4           ;
CODE_0ADE34:         dec   r12          ;
CODE_0ADE35:         lms   r12,(0058)   ;
CODE_0ADE38:         lms   r13,(005A)   ;
CODE_0ADE3B:         jmp   r11          ;
CODE_0ADE3C:         nop                ;

CODE_0ADE3D:         from r12           ;
CODE_0ADE3E:         add   #05          ;
CODE_0ADE40:         add   r0           ;
CODE_0ADE41:         to r4              ;
CODE_0ADE42:         add   r0           ;
CODE_0ADE43:         ibt   r12,#0010    ;
CODE_0ADE45:         iwt   r0,#0F00     ;
CODE_0ADE48:         add   r4           ;
CODE_0ADE49:         from r12           ;
CODE_0ADE4A:         stw   (r0)         ;
CODE_0ADE4B:         iwt   r12,#00FF    ;
CODE_0ADE4E:         iwt   r0,#14A0     ;
CODE_0ADE51:         add   r4           ;
CODE_0ADE52:         from r12           ;
CODE_0ADE53:         stw   (r0)         ;
CODE_0ADE54:         ibt   r12,#0000    ;
CODE_0ADE56:         iwt   r0,#1D96     ;
CODE_0ADE59:         add   r4           ;
CODE_0ADE5A:         from r12           ;
CODE_0ADE5B:         stw   (r0)         ;
CODE_0ADE5C:         iwt   r0,#1220     ;
CODE_0ADE5F:         add   r4           ;
CODE_0ADE60:         from r12           ;
CODE_0ADE61:         stw   (r0)         ;
CODE_0ADE62:         iwt   r0,#1222     ;
CODE_0ADE65:         add   r4           ;
CODE_0ADE66:         from r12           ;
CODE_0ADE67:         stw   (r0)         ;
CODE_0ADE68:         iwt   r0,#1976     ;
CODE_0ADE6B:         add   r4           ;
CODE_0ADE6C:         from r12           ;
CODE_0ADE6D:         stw   (r0)         ;
CODE_0ADE6E:         iwt   r0,#1400     ;
CODE_0ADE71:         add   r4           ;
CODE_0ADE72:         from r12           ;
CODE_0ADE73:         stw   (r0)         ;
CODE_0ADE74:         iwt   r0,#10E0     ;
CODE_0ADE77:         add   r4           ;
CODE_0ADE78:         from r12           ;
CODE_0ADE79:         stw   (r0)         ;
CODE_0ADE7A:         iwt   r0,#1D36     ;
CODE_0ADE7D:         add   r4           ;
CODE_0ADE7E:         from r12           ;
CODE_0ADE7F:         stw   (r0)         ;
CODE_0ADE80:         iwt   r0,#1978     ;
CODE_0ADE83:         add   r4           ;
CODE_0ADE84:         from r12           ;
CODE_0ADE85:         stw   (r0)         ;
CODE_0ADE86:         iwt   r0,#19D6     ;
CODE_0ADE89:         add   r4           ;
CODE_0ADE8A:         from r12           ;
CODE_0ADE8B:         stw   (r0)         ;
CODE_0ADE8C:         iwt   r0,#19D8     ;
CODE_0ADE8F:         add   r4           ;
CODE_0ADE90:         from r12           ;
CODE_0ADE91:         stw   (r0)         ;
CODE_0ADE92:         iwt   r0,#1A36     ;
CODE_0ADE95:         add   r4           ;
CODE_0ADE96:         from r12           ;
CODE_0ADE97:         stw   (r0)         ;
CODE_0ADE98:         iwt   r0,#1A38     ;
CODE_0ADE9B:         add   r4           ;
CODE_0ADE9C:         from r12           ;
CODE_0ADE9D:         stw   (r0)         ;
CODE_0ADE9E:         iwt   r0,#1A96     ;
CODE_0ADEA1:         add   r4           ;
CODE_0ADEA2:         from r12           ;
CODE_0ADEA3:         stw   (r0)         ;
CODE_0ADEA4:         iwt   r0,#1A98     ;
CODE_0ADEA7:         add   r4           ;
CODE_0ADEA8:         from r12           ;
CODE_0ADEA9:         stw   (r0)         ;
CODE_0ADEAA:         iwt   r0,#1AF6     ;
CODE_0ADEAD:         add   r4           ;
CODE_0ADEAE:         from r12           ;
CODE_0ADEAF:         stw   (r0)         ;
CODE_0ADEB0:         iwt   r0,#1AF8     ;
CODE_0ADEB3:         add   r4           ;
CODE_0ADEB4:         from r12           ;
CODE_0ADEB5:         stw   (r0)         ;
CODE_0ADEB6:         iwt   r0,#1402     ;
CODE_0ADEB9:         add   r4           ;
CODE_0ADEBA:         from r12           ;
CODE_0ADEBB:         stw   (r0)         ;
CODE_0ADEBC:         iwt   r0,#1860     ;
CODE_0ADEBF:         add   r4           ;
CODE_0ADEC0:         from r12           ;
CODE_0ADEC1:         stw   (r0)         ;
CODE_0ADEC2:         iwt   r0,#0F02     ;
CODE_0ADEC5:         add   r4           ;
CODE_0ADEC6:         from r12           ;
CODE_0ADEC7:         stw   (r0)         ;
CODE_0ADEC8:         iwt   r0,#1D38     ;
CODE_0ADECB:         add   r4           ;
CODE_0ADECC:         from r12           ;
CODE_0ADECD:         stw   (r0)         ;
CODE_0ADECE:         iwt   r0,#1720     ;
CODE_0ADED1:         add   r4           ;
CODE_0ADED2:         from r12           ;
CODE_0ADED3:         stw   (r0)         ;
CODE_0ADED4:         iwt   r0,#1680     ;
CODE_0ADED7:         add   r4           ;
CODE_0ADED8:         from r12           ;
CODE_0ADED9:         stw   (r0)         ;
CODE_0ADEDA:         iwt   r0,#1682     ;
CODE_0ADEDD:         add   r4           ;
CODE_0ADEDE:         from r12           ;
CODE_0ADEDF:         stw   (r0)         ;
CODE_0ADEE0:         iwt   r0,#1540     ;
CODE_0ADEE3:         add   r4           ;
CODE_0ADEE4:         from r12           ;
CODE_0ADEE5:         stw   (r0)         ;
CODE_0ADEE6:         iwt   r0,#15E0     ;
CODE_0ADEE9:         add   r4           ;
CODE_0ADEEA:         from r12           ;
CODE_0ADEEB:         stw   (r0)         ;
CODE_0ADEEC:         iwt   r0,#17C0     ;
CODE_0ADEEF:         add   r4           ;
CODE_0ADEF0:         from r12           ;
CODE_0ADEF1:         stw   (r0)         ;
CODE_0ADEF2:         dec   r12          ;
CODE_0ADEF3:         iwt   r0,#1362     ;
CODE_0ADEF6:         add   r4           ;
CODE_0ADEF7:         from r12           ;
CODE_0ADEF8:         stw   (r0)         ;
CODE_0ADEF9:         iwt   r0,#1722     ;
CODE_0ADEFC:         add   r4           ;
CODE_0ADEFD:         from r12           ;
CODE_0ADEFE:         stw   (r0)         ;
CODE_0ADEFF:         iwt   r12,#1FFF    ;
CODE_0ADF02:         iwt   r0,#1862     ;
CODE_0ADF05:         add   r4           ;
CODE_0ADF06:         from r12           ;
CODE_0ADF07:         stw   (r0)         ;
CODE_0ADF08:         iwt   r0,#1360     ;
CODE_0ADF0B:         add   r4           ;
CODE_0ADF0C:         from r5            ;
CODE_0ADF0D:         stw   (r0)         ;
CODE_0ADF0E:         from r5            ;
CODE_0ADF0F:         to r12             ;
CODE_0ADF10:         add   r5           ;
CODE_0ADF11:         sms   (005C),r14   ;
CODE_0ADF14:         iwt   r0,#A716     ;
CODE_0ADF17:         to r14             ;
CODE_0ADF18:         add   r12          ;
CODE_0ADF19:         to r13             ;
CODE_0ADF1A:         getb               ;
CODE_0ADF1B:         iwt   r5,#0EBB     ;
CODE_0ADF1E:         ibt   r14,#0006    ;
CODE_0ADF20:         ldb   (r5)         ;
CODE_0ADF22:         sub   r13          ;
CODE_0ADF23:         beq CODE_0ADF2D    ;
CODE_0ADF25:         dec   r14          ;
CODE_0ADF26:         bne CODE_0ADF20    ;
CODE_0ADF28:         dec   r5           ;
CODE_0ADF29:         to r5              ;
CODE_0ADF2A:         to    r5           ;
CODE_0ADF2A:         bra CODE_0ADF33    ;

CODE_0ADF2C:         sub   r0           ;

CODE_0ADF2D:         from r14           ;
CODE_0ADF2E:         add   #08          ;
CODE_0ADF30:         add   r0           ;
CODE_0ADF31:         to r5              ;
CODE_0ADF32:         add   r0           ;
CODE_0ADF33:         iwt   r0,#1180     ;
CODE_0ADF36:         add   r4           ;
CODE_0ADF37:         from r5            ;
CODE_0ADF38:         stw   (r0)         ;
CODE_0ADF39:         iwt   r0,#9F1A     ;
CODE_0ADF3C:         to r14             ;
CODE_0ADF3D:         add   r12          ;
CODE_0ADF3E:         to r5              ;
CODE_0ADF3F:         getb               ;
CODE_0ADF40:         inc   r14          ;
CODE_0ADF41:         iwt   r0,#14A2     ;
CODE_0ADF44:         add   r4           ;
CODE_0ADF45:         from r5            ;
CODE_0ADF46:         stw   (r0)         ;
CODE_0ADF47:         getb               ;
CODE_0ADF48:         ibt   r5,#0020     ;
CODE_0ADF4A:         to r5              ;
CODE_0ADF4B:         xor   r5           ;
CODE_0ADF4D:         iwt   r0,#1042     ;
CODE_0ADF50:         add   r4           ;
CODE_0ADF51:         from r5            ;
CODE_0ADF52:         stw   (r0)         ;
CODE_0ADF53:         iwt   r0,#A318     ;
CODE_0ADF56:         to r14             ;
CODE_0ADF57:         add   r12          ;
CODE_0ADF58:         to r5              ;
CODE_0ADF59:         getbs              ;
CODE_0ADF5B:         inc   r14          ;
CODE_0ADF5C:         iwt   r0,#1542     ;
CODE_0ADF5F:         add   r4           ;
CODE_0ADF60:         from r5            ;
CODE_0ADF61:         stw   (r0)         ;
CODE_0ADF62:         getbs              ;
CODE_0ADF64:         mult  #08          ;
CODE_0ADF66:         to r5              ;
CODE_0ADF67:         add   r0           ;
CODE_0ADF68:         iwt   r0,#15E2     ;
CODE_0ADF6B:         add   r4           ;
CODE_0ADF6C:         from r5            ;
CODE_0ADF6D:         stw   (r0)         ;
CODE_0ADF6E:         iwt   r0,#971E     ;
CODE_0ADF71:         to r14             ;
CODE_0ADF72:         add   r12          ;
CODE_0ADF73:         getb               ;
CODE_0ADF74:         inc   r14          ;
CODE_0ADF75:         to r5              ;
CODE_0ADF76:         getbh              ;
CODE_0ADF78:         iwt   r0,#0FA2     ;
CODE_0ADF7B:         add   r4           ;
CODE_0ADF7C:         from r5            ;
CODE_0ADF7D:         stw   (r0)         ;
CODE_0ADF7E:         iwt   r0,#9B1C     ;
CODE_0ADF81:         to r14             ;
CODE_0ADF82:         add   r12          ;
CODE_0ADF83:         getb               ;
CODE_0ADF84:         inc   r14          ;
CODE_0ADF85:         to r5              ;
CODE_0ADF86:         getbh              ;
CODE_0ADF88:         iwt   r0,#1040     ;
CODE_0ADF8B:         add   r4           ;
CODE_0ADF8C:         from r5            ;
CODE_0ADF8D:         stw   (r0)         ;
CODE_0ADF8E:         iwt   r0,#9320     ;
CODE_0ADF91:         to r14             ;
CODE_0ADF92:         add   r12          ;
CODE_0ADF93:         getb               ;
CODE_0ADF94:         inc   r14          ;
CODE_0ADF95:         to r5              ;
CODE_0ADF96:         getbh              ;
CODE_0ADF98:         iwt   r0,#0FA0     ;
CODE_0ADF9B:         add   r4           ;
CODE_0ADF9C:         from r5            ;
CODE_0ADF9D:         stw   (r0)         ;
CODE_0ADF9E:         ibt   r0,#001F     ;
CODE_0ADFA0:         and   r5           ;
CODE_0ADFA1:         add   r0           ;
CODE_0ADFA2:         add   r0           ;
CODE_0ADFA3:         add   r0           ;
CODE_0ADFA4:         iwt   r14,#9220    ;
CODE_0ADFA7:         to r14             ;
CODE_0ADFA8:         add   r14          ;
CODE_0ADFA9:         getb               ;
CODE_0ADFAA:         inc   r14          ;
CODE_0ADFAB:         to r5              ;
CODE_0ADFAC:         getbh              ;
CODE_0ADFAE:         inc   r14          ;
CODE_0ADFAF:         iwt   r0,#1B56     ;
CODE_0ADFB2:         add   r4           ;
CODE_0ADFB3:         from r5            ;
CODE_0ADFB4:         stw   (r0)         ;
CODE_0ADFB5:         getb               ;
CODE_0ADFB6:         inc   r14          ;
CODE_0ADFB7:         to r5              ;
CODE_0ADFB8:         getbh              ;
CODE_0ADFBA:         inc   r14          ;
CODE_0ADFBB:         iwt   r0,#1B58     ;
CODE_0ADFBE:         add   r4           ;
CODE_0ADFBF:         from r5            ;
CODE_0ADFC0:         stw   (r0)         ;
CODE_0ADFC1:         getb               ;
CODE_0ADFC2:         inc   r14          ;
CODE_0ADFC3:         to r5              ;
CODE_0ADFC4:         getbh              ;
CODE_0ADFC6:         inc   r14          ;
CODE_0ADFC7:         iwt   r0,#1BB6     ;
CODE_0ADFCA:         add   r4           ;
CODE_0ADFCB:         from r5            ;
CODE_0ADFCC:         stw   (r0)         ;
CODE_0ADFCD:         getb               ;
CODE_0ADFCE:         inc   r14          ;
CODE_0ADFCF:         to r5              ;
CODE_0ADFD0:         getbh              ;
CODE_0ADFD2:         iwt   r0,#1BB8     ;
CODE_0ADFD5:         add   r4           ;
CODE_0ADFD6:         from r5            ;
CODE_0ADFD7:         stw   (r0)         ;
CODE_0ADFD8:         lms   r14,(005C)   ;
CODE_0ADFDB:         lms   r12,(0058)   ;
CODE_0ADFDE:         lms   r13,(005A)   ;
CODE_0ADFE1:         jmp   r11          ;
CODE_0ADFE2:         sub   r0           ;

CODE_0ADFE3:         sms   (0058),r12   ;
CODE_0ADFE6:         sms   (005A),r13   ;
CODE_0ADFE9:         iwt   r4,#0EFC     ;
CODE_0ADFEC:         ibt   r12,#0010    ;
CODE_0ADFEE:         move  r13,r15      ;
CODE_0ADFF0:         ldb   (r4)         ;
CODE_0ADFF2:         sub   #00          ;
CODE_0ADFF4:         beq CODE_0AE00D    ;
CODE_0ADFF6:         dec   r4           ;
CODE_0ADFF7:         dec   r4           ;
CODE_0ADFF8:         dec   r4           ;
CODE_0ADFF9:         loop               ;
CODE_0ADFFA:         dec   r4           ;
CODE_0ADFFB:         lm    r0,(1E4A)    ;
CODE_0ADFFF:         dec   r0           ;
CODE_0AE000:         dec   r0           ;
CODE_0AE001:         dec   r0           ;
CODE_0AE002:         dec   r0           ;
CODE_0AE003:         bpl CODE_0AE008    ;
CODE_0AE005:         nop                ;
CODE_0AE006:         ibt   r0,#003C     ;
CODE_0AE008:         sbk                ;
CODE_0AE009:         lsr                ;
CODE_0AE00A:         to r12             ;
CODE_0AE00B:         lsr                ;
CODE_0AE00C:         inc   r12          ;
CODE_0AE00D:         dec   r12          ;
CODE_0AE00E:         from r12           ;
CODE_0AE00F:         add   r12          ;
CODE_0AE010:         to r4              ;
CODE_0AE011:         add   r0           ;
CODE_0AE012:         ibt   r12,#000E    ;
CODE_0AE014:         iwt   r0,#0EC0     ;
CODE_0AE017:         add   r4           ;
CODE_0AE018:         from r12           ;
CODE_0AE019:         stw   (r0)         ;
CODE_0AE01A:         iwt   r12,#00FF    ;
CODE_0AE01D:         iwt   r0,#1460     ;
CODE_0AE020:         add   r4           ;
CODE_0AE021:         from r12           ;
CODE_0AE022:         stw   (r0)         ;
CODE_0AE023:         ibt   r12,#0000    ;
CODE_0AE025:         iwt   r0,#11E0     ;
CODE_0AE028:         add   r4           ;
CODE_0AE029:         from r12           ;
CODE_0AE02A:         stw   (r0)         ;
CODE_0AE02B:         iwt   r0,#11E2     ;
CODE_0AE02E:         add   r4           ;
CODE_0AE02F:         from r12           ;
CODE_0AE030:         stw   (r0)         ;
CODE_0AE031:         iwt   r0,#13C0     ;
CODE_0AE034:         add   r4           ;
CODE_0AE035:         from r12           ;
CODE_0AE036:         stw   (r0)         ;
CODE_0AE037:         iwt   r0,#10A0     ;
CODE_0AE03A:         add   r4           ;
CODE_0AE03B:         from r12           ;
CODE_0AE03C:         stw   (r0)         ;
CODE_0AE03D:         iwt   r0,#1E4C     ;
CODE_0AE040:         add   r4           ;
CODE_0AE041:         from r12           ;
CODE_0AE042:         stw   (r0)         ;
CODE_0AE043:         iwt   r0,#1E4E     ;
CODE_0AE046:         add   r4           ;
CODE_0AE047:         from r12           ;
CODE_0AE048:         stw   (r0)         ;
CODE_0AE049:         iwt   r0,#1E8C     ;
CODE_0AE04C:         add   r4           ;
CODE_0AE04D:         from r12           ;
CODE_0AE04E:         stw   (r0)         ;
CODE_0AE04F:         iwt   r0,#1782     ;
CODE_0AE052:         add   r4           ;
CODE_0AE053:         from r12           ;
CODE_0AE054:         stw   (r0)         ;
CODE_0AE055:         iwt   r0,#1E8E     ;
CODE_0AE058:         add   r4           ;
CODE_0AE059:         from r12           ;
CODE_0AE05A:         stw   (r0)         ;
CODE_0AE05B:         iwt   r0,#13C2     ;
CODE_0AE05E:         add   r4           ;
CODE_0AE05F:         from r12           ;
CODE_0AE060:         stw   (r0)         ;
CODE_0AE061:         iwt   r0,#1820     ;
CODE_0AE064:         add   r4           ;
CODE_0AE065:         from r12           ;
CODE_0AE066:         stw   (r0)         ;
CODE_0AE067:         iwt   r0,#0EC2     ;
CODE_0AE06A:         add   r4           ;
CODE_0AE06B:         from r12           ;
CODE_0AE06C:         stw   (r0)         ;
CODE_0AE06D:         iwt   r0,#16E0     ;
CODE_0AE070:         add   r4           ;
CODE_0AE071:         from r12           ;
CODE_0AE072:         stw   (r0)         ;
CODE_0AE073:         iwt   r0,#1640     ;
CODE_0AE076:         add   r4           ;
CODE_0AE077:         from r12           ;
CODE_0AE078:         stw   (r0)         ;
CODE_0AE079:         iwt   r0,#1642     ;
CODE_0AE07C:         add   r4           ;
CODE_0AE07D:         from r12           ;
CODE_0AE07E:         stw   (r0)         ;
CODE_0AE07F:         iwt   r0,#1500     ;
CODE_0AE082:         add   r4           ;
CODE_0AE083:         from r12           ;
CODE_0AE084:         stw   (r0)         ;
CODE_0AE085:         iwt   r0,#15A0     ;
CODE_0AE088:         add   r4           ;
CODE_0AE089:         from r12           ;
CODE_0AE08A:         stw   (r0)         ;
CODE_0AE08B:         iwt   r0,#1780     ;
CODE_0AE08E:         add   r4           ;
CODE_0AE08F:         from r12           ;
CODE_0AE090:         stw   (r0)         ;
CODE_0AE091:         dec   r12          ;
CODE_0AE092:         iwt   r0,#1322     ;
CODE_0AE095:         add   r4           ;
CODE_0AE096:         from r12           ;
CODE_0AE097:         stw   (r0)         ;
CODE_0AE098:         iwt   r0,#16E2     ;
CODE_0AE09B:         add   r4           ;
CODE_0AE09C:         from r12           ;
CODE_0AE09D:         stw   (r0)         ;
CODE_0AE09E:         iwt   r12,#1FFF    ;
CODE_0AE0A1:         iwt   r0,#1822     ;
CODE_0AE0A4:         add   r4           ;
CODE_0AE0A5:         from r12           ;
CODE_0AE0A6:         stw   (r0)         ;
CODE_0AE0A7:         iwt   r0,#1320     ;
CODE_0AE0AA:         add   r4           ;
CODE_0AE0AB:         from r5            ;
CODE_0AE0AC:         stw   (r0)         ;
CODE_0AE0AD:         from r5            ;
CODE_0AE0AE:         to r12             ;
CODE_0AE0AF:         add   r5           ;
CODE_0AE0B0:         sms   (005C),r14   ;
CODE_0AE0B3:         iwt   r0,#B59E     ;
CODE_0AE0B6:         to r14             ;
CODE_0AE0B7:         add   r12          ;
CODE_0AE0B8:         to r13             ;
CODE_0AE0B9:         getb               ;
CODE_0AE0BA:         iwt   r5,#0EBB     ;
CODE_0AE0BD:         ibt   r14,#0006    ;
CODE_0AE0BF:         ldb   (r5)         ;
CODE_0AE0C1:         sub   r13          ;
CODE_0AE0C2:         beq CODE_0AE0CC    ;
CODE_0AE0C4:         dec   r14          ;
CODE_0AE0C5:         bne CODE_0AE0BF    ;
CODE_0AE0C7:         dec   r5           ;
CODE_0AE0C8:         to r5              ;
CODE_0AE0C9:         to    r5           ;
CODE_0AE0C9:         bra CODE_0AE0D2    ;

CODE_0AE0CB:         sub   r0           ;

CODE_0AE0CC:         from r14           ;
CODE_0AE0CD:         add   #08          ;
CODE_0AE0CF:         add   r0           ;
CODE_0AE0D0:         to r5              ;
CODE_0AE0D1:         add   r0           ;
CODE_0AE0D2:         iwt   r0,#1140     ;
CODE_0AE0D5:         add   r4           ;
CODE_0AE0D6:         from r5            ;
CODE_0AE0D7:         stw   (r0)         ;
CODE_0AE0D8:         iwt   r0,#B19E     ;
CODE_0AE0DB:         to r14             ;
CODE_0AE0DC:         add   r12          ;
CODE_0AE0DD:         to r5              ;
CODE_0AE0DE:         getb               ;
CODE_0AE0DF:         inc   r14          ;
CODE_0AE0E0:         iwt   r0,#1462     ;
CODE_0AE0E3:         add   r4           ;
CODE_0AE0E4:         from r5            ;
CODE_0AE0E5:         stw   (r0)         ;
CODE_0AE0E6:         getb               ;
CODE_0AE0E7:         ibt   r5,#0030     ;
CODE_0AE0E9:         to r5              ;
CODE_0AE0EA:         xor   r5           ;
CODE_0AE0EC:         iwt   r0,#1002     ;
CODE_0AE0EF:         add   r4           ;
CODE_0AE0F0:         from r5            ;
CODE_0AE0F1:         stw   (r0)         ;
CODE_0AE0F2:         iwt   r0,#B39E     ;
CODE_0AE0F5:         to r14             ;
CODE_0AE0F6:         add   r12          ;
CODE_0AE0F7:         to r5              ;
CODE_0AE0F8:         getbs              ;
CODE_0AE0FA:         inc   r14          ;
CODE_0AE0FB:         iwt   r0,#1502     ;
CODE_0AE0FE:         add   r4           ;
CODE_0AE0FF:         from r5            ;
CODE_0AE100:         stw   (r0)         ;
CODE_0AE101:         getbs              ;
CODE_0AE103:         mult  #08          ;
CODE_0AE105:         to r5              ;
CODE_0AE106:         add   r0           ;
CODE_0AE107:         iwt   r0,#15A2     ;
CODE_0AE10A:         add   r4           ;
CODE_0AE10B:         from r5            ;
CODE_0AE10C:         stw   (r0)         ;
CODE_0AE10D:         iwt   r0,#AB9E     ;
CODE_0AE110:         to r14             ;
CODE_0AE111:         add   r12          ;
CODE_0AE112:         getb               ;
CODE_0AE113:         inc   r14          ;
CODE_0AE114:         to r5              ;
CODE_0AE115:         getbh              ;
CODE_0AE117:         iwt   r0,#0F60     ;
CODE_0AE11A:         add   r4           ;
CODE_0AE11B:         from r5            ;
CODE_0AE11C:         stw   (r0)         ;
CODE_0AE11D:         iwt   r0,#AD9E     ;
CODE_0AE120:         to r14             ;
CODE_0AE121:         add   r12          ;
CODE_0AE122:         getb               ;
CODE_0AE123:         inc   r14          ;
CODE_0AE124:         to r5              ;
CODE_0AE125:         getbh              ;
CODE_0AE127:         iwt   r0,#0F62     ;
CODE_0AE12A:         add   r4           ;
CODE_0AE12B:         from r5            ;
CODE_0AE12C:         stw   (r0)         ;
CODE_0AE12D:         iwt   r0,#AF9E     ;
CODE_0AE130:         to r14             ;
CODE_0AE131:         add   r12          ;
CODE_0AE132:         getb               ;
CODE_0AE133:         inc   r14          ;
CODE_0AE134:         to r5              ;
CODE_0AE135:         getbh              ;
CODE_0AE137:         iwt   r0,#1000     ;
CODE_0AE13A:         add   r4           ;
CODE_0AE13B:         from r5            ;
CODE_0AE13C:         stw   (r0)         ;
CODE_0AE13D:         lms   r14,(005C)   ;
CODE_0AE140:         lms   r12,(0058)   ;
CODE_0AE143:         lms   r13,(005A)   ;
CODE_0AE146:         jmp   r11          ;
CODE_0AE147:         nop                ;

CODE_0AE148:         link  #04          ;
CODE_0AE149:         iwt   r15,#D372    ;
CODE_0AE14C:         with r11           ;
CODE_0AE14D:         lm    r3,(29CA)    ;
CODE_0AE151:         iwt   r0,#18C2     ;
CODE_0AE154:         add   r1           ;
CODE_0AE155:         from r3            ;
CODE_0AE156:         stw   (r0)         ;
CODE_0AE157:         lms   r0,(0000)    ;
CODE_0AE15A:         stw   (r3)         ;
CODE_0AE15B:         inc   r3           ;
CODE_0AE15C:         inc   r3           ;
CODE_0AE15D:         lms   r0,(0002)    ;
CODE_0AE160:         stw   (r3)         ;
CODE_0AE161:         inc   r3           ;
CODE_0AE162:         inc   r3           ;
CODE_0AE163:         from r7            ;
CODE_0AE164:         stw   (r3)         ;
CODE_0AE165:         inc   r3           ;
CODE_0AE166:         inc   r3           ;
CODE_0AE167:         from r6            ;
CODE_0AE168:         stw   (r3)         ;
CODE_0AE169:         inc   r3           ;
CODE_0AE16A:         inc   r3           ;
CODE_0AE16B:         sm    (29CA),r3    ;
CODE_0AE16F:         with r2            ;
CODE_0AE170:         add   r2           ;
CODE_0AE171:         with r2            ;
CODE_0AE172:         add   r2           ;
CODE_0AE173:         link  #04          ;
CODE_0AE174:         iwt   r15,#D352    ;
CODE_0AE177:         with r11           ;
CODE_0AE178:         lm    r3,(29CA)    ;
CODE_0AE17C:         lms   r0,(0000)    ;
CODE_0AE17F:         stw   (r3)         ;
CODE_0AE180:         inc   r3           ;
CODE_0AE181:         inc   r3           ;
CODE_0AE182:         lms   r0,(0002)    ;
CODE_0AE185:         stw   (r3)         ;
CODE_0AE186:         inc   r3           ;
CODE_0AE187:         inc   r3           ;
CODE_0AE188:         from r7            ;
CODE_0AE189:         stw   (r3)         ;
CODE_0AE18A:         inc   r3           ;
CODE_0AE18B:         inc   r3           ;
CODE_0AE18C:         from r6            ;
CODE_0AE18D:         stw   (r3)         ;
CODE_0AE18E:         inc   r3           ;
CODE_0AE18F:         inc   r3           ;
CODE_0AE190:         sm    (29CA),r3    ;
CODE_0AE194:         with r2            ;
CODE_0AE195:         add   r2           ;
CODE_0AE196:         link  #04          ;
CODE_0AE197:         iwt   r15,#D352    ;
CODE_0AE19A:         with r11           ;
CODE_0AE19B:         lm    r3,(29CA)    ;
CODE_0AE19F:         lms   r0,(0000)    ;
CODE_0AE1A2:         stw   (r3)         ;
CODE_0AE1A3:         inc   r3           ;
CODE_0AE1A4:         inc   r3           ;
CODE_0AE1A5:         lms   r0,(0002)    ;
CODE_0AE1A8:         stw   (r3)         ;
CODE_0AE1A9:         inc   r3           ;
CODE_0AE1AA:         inc   r3           ;
CODE_0AE1AB:         from r7            ;
CODE_0AE1AC:         stw   (r3)         ;
CODE_0AE1AD:         inc   r3           ;
CODE_0AE1AE:         inc   r3           ;
CODE_0AE1AF:         from r6            ;
CODE_0AE1B0:         stw   (r3)         ;
CODE_0AE1B1:         inc   r3           ;
CODE_0AE1B2:         inc   r3           ;
CODE_0AE1B3:         sm    (29CA),r3    ;
CODE_0AE1B7:         with r2            ;
CODE_0AE1B8:         add   r2           ;
CODE_0AE1B9:         iwt   r0,#11E0     ;
CODE_0AE1BC:         to r4              ;
CODE_0AE1BD:         add   r1           ;
CODE_0AE1BE:         to r7              ;
CODE_0AE1BF:         ldw   (r4)         ;
CODE_0AE1C0:         from r2            ;
CODE_0AE1C1:         and   #06          ;
CODE_0AE1C3:         beq CODE_0AE20B    ;
CODE_0AE1C5:         nop                ;
CODE_0AE1C6:         ibt   r3,#0001     ;
CODE_0AE1C8:         sub   #04          ;
CODE_0AE1CA:         bpl CODE_0AE1CF    ;
CODE_0AE1CC:         nop                ;
CODE_0AE1CD:         ibt   r3,#FFFF     ;
CODE_0AE1CF:         xor   r7           ;
CODE_0AE1D1:         bpl CODE_0AE20B    ;
CODE_0AE1D3:         nop                ;
CODE_0AE1D4:         with r9            ;
CODE_0AE1D5:         add   r3           ;
CODE_0AE1D6:         iwt   r0,#0F62     ;
CODE_0AE1D9:         add   r1           ;
CODE_0AE1DA:         to r5              ;
CODE_0AE1DB:         ldw   (r0)         ;
CODE_0AE1DC:         iwt   r0,#00C0     ;
CODE_0AE1DF:         and   r5           ;
CODE_0AE1E0:         beq CODE_0AE20B    ;
CODE_0AE1E2:         inc   r2           ;
CODE_0AE1E3:         swap               ;
CODE_0AE1E4:         bmi CODE_0AE20A    ;
CODE_0AE1E6:         sub   r0           ;
CODE_0AE1E7:         ldw   (r4)         ;
CODE_0AE1E8:         to r11             ;
CODE_0AE1E9:         xor   r3           ;
CODE_0AE1EB:         bpl CODE_0AE20B    ;
CODE_0AE1ED:         not                ;
CODE_0AE1EE:         with r5            ;
CODE_0AE1EF:         swap               ;
CODE_0AE1F0:         with r5            ;
CODE_0AE1F1:         and   #04          ;
CODE_0AE1F3:         beq CODE_0AE1F7    ;
CODE_0AE1F5:         inc   r0           ;
CODE_0AE1F6:         sub   r0           ;
CODE_0AE1F7:         sbk                ;
CODE_0AE1F8:         iwt   r0,#13C0     ;
CODE_0AE1FB:         add   r1           ;
CODE_0AE1FC:         ldw   (r0)         ;
CODE_0AE1FD:         xor   #02          ;
CODE_0AE1FF:         sbk                ;
CODE_0AE200:         iwt   r0,#15A0     ;
CODE_0AE203:         add   r1           ;
CODE_0AE204:         ldw   (r0)         ;
CODE_0AE205:         not                ;
CODE_0AE206:         inc   r0           ;
CODE_0AE207:         bra CODE_0AE20B    ;

CODE_0AE209:         sbk                ;

CODE_0AE20A:         stw   (r4)         ;
CODE_0AE20B:         iwt   r15,#E284    ;
CODE_0AE20E:         nop                ;
CODE_0AE20F:         link  #04          ;
CODE_0AE210:         iwt   r15,#D372    ;
CODE_0AE213:         with r11           ;
CODE_0AE214:         lm    r3,(29CA)    ;
CODE_0AE218:         iwt   r0,#18C2     ;
CODE_0AE21B:         add   r1           ;
CODE_0AE21C:         from r3            ;
CODE_0AE21D:         stw   (r0)         ;
CODE_0AE21E:         lms   r0,(0000)    ;
CODE_0AE221:         stw   (r3)         ;
CODE_0AE222:         inc   r3           ;
CODE_0AE223:         inc   r3           ;
CODE_0AE224:         lms   r0,(0002)    ;
CODE_0AE227:         stw   (r3)         ;
CODE_0AE228:         inc   r3           ;
CODE_0AE229:         inc   r3           ;
CODE_0AE22A:         from r7            ;
CODE_0AE22B:         stw   (r3)         ;
CODE_0AE22C:         inc   r3           ;
CODE_0AE22D:         inc   r3           ;
CODE_0AE22E:         from r6            ;
CODE_0AE22F:         stw   (r3)         ;
CODE_0AE230:         inc   r3           ;
CODE_0AE231:         inc   r3           ;
CODE_0AE232:         sm    (29CA),r3    ;
CODE_0AE236:         with r2            ;
CODE_0AE237:         add   r2           ;
CODE_0AE238:         with r2            ;
CODE_0AE239:         add   r2           ;
CODE_0AE23A:         ibt   r3,#0001     ;
CODE_0AE23C:         link  #04          ;
CODE_0AE23D:         iwt   r15,#D3B0    ;
CODE_0AE240:         lm    r3,(29CA)    ;
CODE_0AE245:         lms   r0,(0000)    ;
CODE_0AE248:         stw   (r3)         ;
CODE_0AE249:         inc   r3           ;
CODE_0AE24A:         inc   r3           ;
CODE_0AE24B:         lms   r0,(0002)    ;
CODE_0AE24E:         stw   (r3)         ;
CODE_0AE24F:         inc   r3           ;
CODE_0AE250:         inc   r3           ;
CODE_0AE251:         from r7            ;
CODE_0AE252:         stw   (r3)         ;
CODE_0AE253:         inc   r3           ;
CODE_0AE254:         inc   r3           ;
CODE_0AE255:         from r6            ;
CODE_0AE256:         stw   (r3)         ;
CODE_0AE257:         inc   r3           ;
CODE_0AE258:         inc   r3           ;
CODE_0AE259:         sm    (29CA),r3    ;
CODE_0AE25D:         with r2            ;
CODE_0AE25E:         add   r2           ;
CODE_0AE25F:         ibt   r3,#FFFF     ;
CODE_0AE261:         link  #04          ;
CODE_0AE262:         iwt   r15,#D3B0    ;
CODE_0AE265:         lm    r3,(29CA)    ;
CODE_0AE26A:         lms   r0,(0000)    ;
CODE_0AE26D:         stw   (r3)         ;
CODE_0AE26E:         inc   r3           ;
CODE_0AE26F:         inc   r3           ;
CODE_0AE270:         lms   r0,(0002)    ;
CODE_0AE273:         stw   (r3)         ;
CODE_0AE274:         inc   r3           ;
CODE_0AE275:         inc   r3           ;
CODE_0AE276:         from r7            ;
CODE_0AE277:         stw   (r3)         ;
CODE_0AE278:         inc   r3           ;
CODE_0AE279:         inc   r3           ;
CODE_0AE27A:         from r6            ;
CODE_0AE27B:         stw   (r3)         ;
CODE_0AE27C:         inc   r3           ;
CODE_0AE27D:         inc   r3           ;
CODE_0AE27E:         sm    (29CA),r3    ;
CODE_0AE282:         with r2            ;
CODE_0AE283:         add   r2           ;
CODE_0AE284:         ibt   r3,#0010     ;
CODE_0AE286:         link  #04          ;
CODE_0AE287:         iwt   r15,#D1B5    ;
CODE_0AE28A:         lm    r3,(29CA)    ;
CODE_0AE28F:         lms   r0,(0000)    ;
CODE_0AE292:         stw   (r3)         ;
CODE_0AE293:         inc   r3           ;
CODE_0AE294:         inc   r3           ;
CODE_0AE295:         lms   r0,(0002)    ;
CODE_0AE298:         stw   (r3)         ;
CODE_0AE299:         inc   r3           ;
CODE_0AE29A:         inc   r3           ;
CODE_0AE29B:         from r7            ;
CODE_0AE29C:         stw   (r3)         ;
CODE_0AE29D:         inc   r3           ;
CODE_0AE29E:         inc   r3           ;
CODE_0AE29F:         from r6            ;
CODE_0AE2A0:         stw   (r3)         ;
CODE_0AE2A1:         inc   r3           ;
CODE_0AE2A2:         inc   r3           ;
CODE_0AE2A3:         sm    (29CA),r3    ;
CODE_0AE2A7:         from r2            ;
CODE_0AE2A8:         lsr                ;
CODE_0AE2A9:         bcc CODE_0AE2B4    ;
CODE_0AE2AB:         nop                ;
CODE_0AE2AC:         inc   r10          ;
CODE_0AE2AD:         iwt   r0,#11E2     ;
CODE_0AE2B0:         to r4              ;
CODE_0AE2B1:         add   r1           ;
CODE_0AE2B2:         sub   r0           ;
CODE_0AE2B3:         stw   (r4)         ;
CODE_0AE2B4:         with r2            ;
CODE_0AE2B5:         add   r2           ;
CODE_0AE2B6:         ibt   r3,#FFF0     ;
CODE_0AE2B8:         link  #04          ;
CODE_0AE2B9:         iwt   r15,#D1B5    ;
CODE_0AE2BC:         lm    r3,(29CA)    ;
CODE_0AE2C1:         lms   r0,(0000)    ;
CODE_0AE2C4:         stw   (r3)         ;
CODE_0AE2C5:         inc   r3           ;
CODE_0AE2C6:         inc   r3           ;
CODE_0AE2C7:         lms   r0,(0002)    ;
CODE_0AE2CA:         stw   (r3)         ;
CODE_0AE2CB:         inc   r3           ;
CODE_0AE2CC:         inc   r3           ;
CODE_0AE2CD:         from r7            ;
CODE_0AE2CE:         stw   (r3)         ;
CODE_0AE2CF:         inc   r3           ;
CODE_0AE2D0:         inc   r3           ;
CODE_0AE2D1:         from r6            ;
CODE_0AE2D2:         stw   (r3)         ;
CODE_0AE2D3:         inc   r3           ;
CODE_0AE2D4:         inc   r3           ;
CODE_0AE2D5:         sm    (29CA),r3    ;
CODE_0AE2D9:         from r2            ;
CODE_0AE2DA:         lsr                ;
CODE_0AE2DB:         bcs CODE_0AE32E    ;
CODE_0AE2DD:         nop                ;
CODE_0AE2DE:         iwt   r0,#1820     ;
CODE_0AE2E1:         add   r1           ;
CODE_0AE2E2:         ldw   (r0)         ;
CODE_0AE2E3:         lsr                ;
CODE_0AE2E4:         bcc CODE_0AE365    ;
CODE_0AE2E6:         nop                ;
CODE_0AE2E7:         iwt   r0,#0F63     ;
CODE_0AE2EA:         add   r1           ;
CODE_0AE2EB:         to r6              ;
CODE_0AE2EC:         ldb   (r0)         ;
CODE_0AE2EE:         from r6            ;
CODE_0AE2EF:         and   #03          ;
CODE_0AE2F1:         beq CODE_0AE365    ;
CODE_0AE2F3:         lsr                ;
CODE_0AE2F4:         iwt   r5,#11E0     ;
CODE_0AE2F7:         with r5            ;
CODE_0AE2F8:         add   r1           ;
CODE_0AE2F9:         to r5              ;
CODE_0AE2FA:         ldw   (r5)         ;
CODE_0AE2FB:         with r5            ;
CODE_0AE2FC:         not                ;
CODE_0AE2FD:         lsr                ;
CODE_0AE2FE:         bcs CODE_0AE321    ;
CODE_0AE300:         inc   r5           ;
CODE_0AE301:         from r6            ;
CODE_0AE302:         and   #04          ;
CODE_0AE304:         bne CODE_0AE308    ;
CODE_0AE306:         sub   r0           ;
CODE_0AE307:         from r5            ;
CODE_0AE308:         sbk                ;
CODE_0AE309:         ibt   r6,#0000     ;
CODE_0AE30B:         iwt   r0,#10A1     ;
CODE_0AE30E:         add   r1           ;
CODE_0AE30F:         from r6            ;
CODE_0AE310:         stb   (r0)         ;
CODE_0AE312:         iwt   r0,#13C0     ;
CODE_0AE315:         add   r1           ;
CODE_0AE316:         ldw   (r0)         ;
CODE_0AE317:         xor   #02          ;
CODE_0AE319:         sbk                ;
CODE_0AE31A:         iwt   r0,#15A0     ;
CODE_0AE31D:         add   r1           ;
CODE_0AE31E:         ldw   (r0)         ;
CODE_0AE31F:         not                ;
CODE_0AE320:         inc   r0           ;
CODE_0AE321:         sbk                ;
CODE_0AE322:         iwt   r0,#272E     ;
CODE_0AE325:         add   r1           ;
CODE_0AE326:         to r9              ;
CODE_0AE327:         ldw   (r0)         ;
CODE_0AE328:         inc   r0           ;
CODE_0AE329:         inc   r0           ;
CODE_0AE32A:         to r10             ;
CODE_0AE32B:         to    r10          ;
CODE_0AE32B:         bra CODE_0AE343    ;

CODE_0AE32D:         ldw   (r0)         ;

CODE_0AE32E:         with r10           ;
CODE_0AE32F:         add   r4           ;
CODE_0AE330:         ibt   r6,#FFFF     ;
CODE_0AE332:         iwt   r0,#1141     ;
CODE_0AE335:         add   r1           ;
CODE_0AE336:         from r6            ;
CODE_0AE337:         stb   (r0)         ;
CODE_0AE339:         iwt   r0,#272E     ;
CODE_0AE33C:         add   r1           ;
CODE_0AE33D:         from r9            ;
CODE_0AE33E:         stw   (r0)         ;
CODE_0AE33F:         inc   r0           ;
CODE_0AE340:         inc   r0           ;
CODE_0AE341:         from r10           ;
CODE_0AE342:         stw   (r0)         ;
CODE_0AE343:         lms   r6,(0010)    ;
CODE_0AE346:         iwt   r0,#0EC2     ;
CODE_0AE349:         add   r1           ;
CODE_0AE34A:         from r6            ;
CODE_0AE34B:         stb   (r0)         ;
CODE_0AE34D:         sub   r0           ;
CODE_0AE34E:         sms   (0010),r0    ;
CODE_0AE351:         iwt   r0,#0F62     ;
CODE_0AE354:         add   r1           ;
CODE_0AE355:         ldw   (r0)         ;
CODE_0AE356:         ibt   r6,#0020     ;
CODE_0AE358:         and   r6           ;
CODE_0AE359:         bne CODE_0AE365    ;
CODE_0AE35B:         nop                ;
CODE_0AE35C:         iwt   r0,#11E2     ;
CODE_0AE35F:         to r4              ;
CODE_0AE360:         add   r1           ;
CODE_0AE361:         iwt   r0,#0100     ;
CODE_0AE364:         stw   (r4)         ;
CODE_0AE365:         lms   r5,(0010)    ;
CODE_0AE368:         iwt   r0,#268E     ;
CODE_0AE36B:         add   r1           ;
CODE_0AE36C:         from r5            ;
CODE_0AE36D:         stw   (r0)         ;
CODE_0AE36E:         iwt   r0,#10A2     ;
CODE_0AE371:         add   r1           ;
CODE_0AE372:         from r9            ;
CODE_0AE373:         stw   (r0)         ;
CODE_0AE374:         iwt   r0,#16E0     ;
CODE_0AE377:         add   r1           ;
CODE_0AE378:         ldw   (r0)         ;
CODE_0AE379:         with r10           ;
CODE_0AE37A:         sub   r0           ;
CODE_0AE37B:         iwt   r0,#1142     ;
CODE_0AE37E:         add   r1           ;
CODE_0AE37F:         from r10           ;
CODE_0AE380:         stw   (r0)         ;
CODE_0AE381:         iwt   r15,#D07F    ;
CODE_0AE384:         inc   r1           ;
CODE_0AE385:         link  #04          ;
CODE_0AE386:         iwt   r15,#D362    ;
CODE_0AE389:         move  r3,r11       ;
CODE_0AE38C:         link  #04          ;
CODE_0AE38D:         iwt   r15,#D401    ;
CODE_0AE390:         ibt   r0,#0023     ;
CODE_0AE392:         to r11             ;
CODE_0AE393:         lm    r3,(29CA)    ;
CODE_0AE397:         iwt   r0,#18C2     ;
CODE_0AE39A:         add   r1           ;
CODE_0AE39B:         from r3            ;
CODE_0AE39C:         stw   (r0)         ;
CODE_0AE39D:         lms   r0,(0000)    ;
CODE_0AE3A0:         stw   (r3)         ;
CODE_0AE3A1:         inc   r3           ;
CODE_0AE3A2:         inc   r3           ;
CODE_0AE3A3:         lms   r0,(0002)    ;
CODE_0AE3A6:         stw   (r3)         ;
CODE_0AE3A7:         inc   r3           ;
CODE_0AE3A8:         inc   r3           ;
CODE_0AE3A9:         from r7            ;
CODE_0AE3AA:         stw   (r3)         ;
CODE_0AE3AB:         inc   r3           ;
CODE_0AE3AC:         inc   r3           ;
CODE_0AE3AD:         from r6            ;
CODE_0AE3AE:         stw   (r3)         ;
CODE_0AE3AF:         inc   r3           ;
CODE_0AE3B0:         inc   r3           ;
CODE_0AE3B1:         sm    (29CA),r3    ;
CODE_0AE3B5:         with r2            ;
CODE_0AE3B6:         add   r2           ;
CODE_0AE3B7:         with r2            ;
CODE_0AE3B8:         add   r2           ;
CODE_0AE3B9:         link  #04          ;
CODE_0AE3BA:         iwt   r15,#D362    ;
CODE_0AE3BD:         with r11           ;
CODE_0AE3BE:         lm    r3,(29CA)    ;
CODE_0AE3C2:         bra CODE_0AE3D4    ;

CODE_0AE3C4:         nop                ;

CODE_0AE3C5:         link  #04          ;
CODE_0AE3C6:         iwt   r15,#D362    ;
CODE_0AE3C9:         with r11           ;
CODE_0AE3CA:         lm    r3,(29CA)    ;
CODE_0AE3CE:         iwt   r0,#18C2     ;
CODE_0AE3D1:         add   r1           ;
CODE_0AE3D2:         from r3            ;
CODE_0AE3D3:         stw   (r0)         ;
CODE_0AE3D4:         lms   r0,(0000)    ;
CODE_0AE3D7:         stw   (r3)         ;
CODE_0AE3D8:         inc   r3           ;
CODE_0AE3D9:         inc   r3           ;
CODE_0AE3DA:         lms   r0,(0002)    ;
CODE_0AE3DD:         stw   (r3)         ;
CODE_0AE3DE:         inc   r3           ;
CODE_0AE3DF:         inc   r3           ;
CODE_0AE3E0:         from r7            ;
CODE_0AE3E1:         stw   (r3)         ;
CODE_0AE3E2:         inc   r3           ;
CODE_0AE3E3:         inc   r3           ;
CODE_0AE3E4:         from r6            ;
CODE_0AE3E5:         stw   (r3)         ;
CODE_0AE3E6:         inc   r3           ;
CODE_0AE3E7:         inc   r3           ;
CODE_0AE3E8:         sm    (29CA),r3    ;
CODE_0AE3EC:         with r2            ;
CODE_0AE3ED:         add   r2           ;
CODE_0AE3EE:         link  #04          ;
CODE_0AE3EF:         iwt   r15,#D362    ;
CODE_0AE3F2:         with r11           ;
CODE_0AE3F3:         lm    r3,(29CA)    ;
CODE_0AE3F7:         lms   r0,(0000)    ;
CODE_0AE3FA:         stw   (r3)         ;
CODE_0AE3FB:         inc   r3           ;
CODE_0AE3FC:         inc   r3           ;
CODE_0AE3FD:         lms   r0,(0002)    ;
CODE_0AE400:         stw   (r3)         ;
CODE_0AE401:         inc   r3           ;
CODE_0AE402:         inc   r3           ;
CODE_0AE403:         from r7            ;
CODE_0AE404:         stw   (r3)         ;
CODE_0AE405:         inc   r3           ;
CODE_0AE406:         inc   r3           ;
CODE_0AE407:         from r6            ;
CODE_0AE408:         stw   (r3)         ;
CODE_0AE409:         inc   r3           ;
CODE_0AE40A:         inc   r3           ;
CODE_0AE40B:         sm    (29CA),r3    ;
CODE_0AE40F:         with r2            ;
CODE_0AE410:         add   r2           ;
CODE_0AE411:         link  #04          ;
CODE_0AE412:         iwt   r15,#D362    ;
CODE_0AE415:         with r11           ;
CODE_0AE416:         lm    r3,(29CA)    ;
CODE_0AE41A:         lms   r0,(0000)    ;
CODE_0AE41D:         stw   (r3)         ;
CODE_0AE41E:         inc   r3           ;
CODE_0AE41F:         inc   r3           ;
CODE_0AE420:         lms   r0,(0002)    ;
CODE_0AE423:         stw   (r3)         ;
CODE_0AE424:         inc   r3           ;
CODE_0AE425:         inc   r3           ;
CODE_0AE426:         from r7            ;
CODE_0AE427:         stw   (r3)         ;
CODE_0AE428:         inc   r3           ;
CODE_0AE429:         inc   r3           ;
CODE_0AE42A:         from r6            ;
CODE_0AE42B:         stw   (r3)         ;
CODE_0AE42C:         inc   r3           ;
CODE_0AE42D:         inc   r3           ;
CODE_0AE42E:         sm    (29CA),r3    ;
CODE_0AE432:         with r2            ;
CODE_0AE433:         add   r2           ;
CODE_0AE434:         link  #04          ;
CODE_0AE435:         iwt   r15,#D362    ;
CODE_0AE438:         with r11           ;
CODE_0AE439:         lm    r3,(29CA)    ;
CODE_0AE43D:         lms   r0,(0000)    ;
CODE_0AE440:         stw   (r3)         ;
CODE_0AE441:         inc   r3           ;
CODE_0AE442:         inc   r3           ;
CODE_0AE443:         lms   r0,(0002)    ;
CODE_0AE446:         stw   (r3)         ;
CODE_0AE447:         inc   r3           ;
CODE_0AE448:         inc   r3           ;
CODE_0AE449:         from r7            ;
CODE_0AE44A:         stw   (r3)         ;
CODE_0AE44B:         inc   r3           ;
CODE_0AE44C:         inc   r3           ;
CODE_0AE44D:         from r6            ;
CODE_0AE44E:         stw   (r3)         ;
CODE_0AE44F:         inc   r3           ;
CODE_0AE450:         inc   r3           ;
CODE_0AE451:         sm    (29CA),r3    ;
CODE_0AE455:         iwt   r15,#D07F    ;
CODE_0AE458:         inc   r1           ;
CODE_0AE459:         link  #04          ;
CODE_0AE45A:         iwt   r15,#D372    ;
CODE_0AE45D:         with r11           ;
CODE_0AE45E:         lm    r3,(29CA)    ;
CODE_0AE462:         iwt   r0,#18C2     ;
CODE_0AE465:         add   r1           ;
CODE_0AE466:         from r3            ;
CODE_0AE467:         stw   (r0)         ;
CODE_0AE468:         lms   r0,(0000)    ;
CODE_0AE46B:         stw   (r3)         ;
CODE_0AE46C:         inc   r3           ;
CODE_0AE46D:         inc   r3           ;
CODE_0AE46E:         lms   r0,(0002)    ;
CODE_0AE471:         stw   (r3)         ;
CODE_0AE472:         inc   r3           ;
CODE_0AE473:         inc   r3           ;
CODE_0AE474:         from r7            ;
CODE_0AE475:         stw   (r3)         ;
CODE_0AE476:         inc   r3           ;
CODE_0AE477:         inc   r3           ;
CODE_0AE478:         from r6            ;
CODE_0AE479:         stw   (r3)         ;
CODE_0AE47A:         inc   r3           ;
CODE_0AE47B:         inc   r3           ;
CODE_0AE47C:         sm    (29CA),r3    ;
CODE_0AE480:         iwt   r15,#D07F    ;
CODE_0AE483:         inc   r1           ;
CODE_0AE484:         from r6            ;
CODE_0AE485:         hib                ;
CODE_0AE486:         ibt   r5,#007A     ;
CODE_0AE488:         sub   r5           ;
CODE_0AE489:         bne CODE_0AE4B8    ;
CODE_0AE48B:         nop                ;
CODE_0AE48C:         iwt   r4,#0400     ;
CODE_0AE48F:         iwt   r5,#FC00     ;
CODE_0AE492:         lms   r0,(003E)    ;
CODE_0AE495:         not                ;
CODE_0AE496:         inc   r0           ;
CODE_0AE497:         add   r0           ;
CODE_0AE498:         cmp   r4           ;
CODE_0AE49A:         bmi CODE_0AE49F    ;
CODE_0AE49C:         nop                ;
CODE_0AE49D:         move  r0,r4        ;
CODE_0AE49F:         cmp   r5           ;
CODE_0AE4A1:         bpl CODE_0AE4A6    ;
CODE_0AE4A3:         nop                ;
CODE_0AE4A4:         move  r0,r5        ;
CODE_0AE4A6:         sbk                ;
CODE_0AE4A7:         moves r3,r3        ;
CODE_0AE4A9:         bne CODE_0AE4B1    ;
CODE_0AE4AB:         sm    (1220),r0    ;
CODE_0AE4AF:         jmp   r11          ;
CODE_0AE4B0:         nop                ;

CODE_0AE4B1:         sm    (1222),r0    ;
CODE_0AE4B5:         with r2            ;
CODE_0AE4B6:         bic   #01          ;
CODE_0AE4B8:         jmp   r11          ;
CODE_0AE4B9:         nop                ;

CODE_0AE4BA:         link  #04          ;
CODE_0AE4BB:         iwt   r15,#D372    ;
CODE_0AE4BE:         with r11           ;
CODE_0AE4BF:         with r2            ;
CODE_0AE4C0:         add   r2           ;
CODE_0AE4C1:         with r2            ;
CODE_0AE4C2:         add   r2           ;
CODE_0AE4C3:         lm    r0,(1220)    ;
CODE_0AE4C7:         sms   (003E),r0    ;
CODE_0AE4CA:         dec   r0           ;
CODE_0AE4CB:         bpl CODE_0AE4EB    ;
CODE_0AE4CD:         nop                ;
CODE_0AE4CE:         ibt   r3,#0001     ;
CODE_0AE4D0:         link  #04          ;
CODE_0AE4D1:         iwt   r15,#D3B0    ;
CODE_0AE4D4:         sms   (0000),r3    ;
CODE_0AE4D7:         link  #04          ;
CODE_0AE4D8:         iwt   r15,#E484    ;
CODE_0AE4DB:         nop                ;
CODE_0AE4DC:         lm    r0,(1220)    ;
CODE_0AE4E0:         sub   #00          ;
CODE_0AE4E2:         beq CODE_0AE4EE    ;
CODE_0AE4E4:         with r2            ;
CODE_0AE4E5:         add   r2           ;
CODE_0AE4E6:         inc   r14          ;
CODE_0AE4E7:         inc   r14          ;
CODE_0AE4E8:         bra CODE_0AE4FE    ;

CODE_0AE4EA:         with r2            ;
CODE_0AE4EB:         inc   r14          ;
CODE_0AE4EC:         inc   r14          ;
CODE_0AE4ED:         with r2            ;
CODE_0AE4EE:         add   r2           ;
CODE_0AE4EF:         ibt   r3,#FFFF     ;
CODE_0AE4F1:         link  #04          ;
CODE_0AE4F2:         iwt   r15,#D3B0    ;
CODE_0AE4F5:         sms   (0000),r3    ;
CODE_0AE4F8:         link  #04          ;
CODE_0AE4F9:         iwt   r15,#E484    ;
CODE_0AE4FC:         nop                ;
CODE_0AE4FD:         with r2            ;
CODE_0AE4FE:         add   r2           ;
CODE_0AE4FF:         lm    r0,(1222)    ;
CODE_0AE503:         sms   (003E),r0    ;
CODE_0AE506:         ibt   r3,#0010     ;
CODE_0AE508:         link  #04          ;
CODE_0AE509:         iwt   r15,#D1A3    ;
CODE_0AE50C:         lsr                ;
CODE_0AE50F:         bcc CODE_0AE51F    ;
CODE_0AE511:         nop                ;
CODE_0AE512:         inc   r10          ;
CODE_0AE513:         sub   r0           ;
CODE_0AE514:         sm    (1222),r0    ;
CODE_0AE518:         ibt   r3,#0001     ;
CODE_0AE51A:         link  #04          ;
CODE_0AE51B:         iwt   r15,#E484    ;
CODE_0AE51E:         nop                ;
CODE_0AE51F:         with r2            ;
CODE_0AE520:         add   r2           ;
CODE_0AE521:         ibt   r3,#FFF0     ;
CODE_0AE523:         link  #04          ;
CODE_0AE524:         iwt   r15,#D1B5    ;
CODE_0AE527:         lsr                ;
CODE_0AE52A:         bcc CODE_0AE534    ;
CODE_0AE52C:         from r7            ;
CODE_0AE52D:         and   #01          ;
CODE_0AE52F:         beq CODE_0AE537    ;
CODE_0AE531:         with r2            ;
CODE_0AE532:         bic   #01          ;
CODE_0AE534:         bra CODE_0AE565    ;

CODE_0AE536:         nop                ;
CODE_0AE537:         with r10           ;
CODE_0AE538:         add   r4           ;
CODE_0AE539:         ibt   r3,#FFFF     ;
CODE_0AE53B:         iwt   r0,#1141     ;
CODE_0AE53E:         add   r1           ;
CODE_0AE53F:         from r3            ;
CODE_0AE540:         stb   (r0)         ;
CODE_0AE542:         iwt   r0,#272E     ;
CODE_0AE545:         add   r1           ;
CODE_0AE546:         from r9            ;
CODE_0AE547:         stw   (r0)         ;
CODE_0AE548:         inc   r0           ;
CODE_0AE549:         inc   r0           ;
CODE_0AE54A:         from r10           ;
CODE_0AE54B:         stw   (r0)         ;
CODE_0AE54C:         lms   r3,(0010)    ;
CODE_0AE54F:         sm    (0F02),r3    ;
CODE_0AE553:         sub   r0           ;
CODE_0AE554:         sms   (0010),r0    ;
CODE_0AE557:         iwt   r0,#0100     ;
CODE_0AE55A:         sm    (1222),r0    ;
CODE_0AE55E:         ibt   r3,#0001     ;
CODE_0AE560:         link  #04          ;
CODE_0AE561:         iwt   r15,#E484    ;
CODE_0AE564:         nop                ;
CODE_0AE565:         lms   r5,(0010)    ;
CODE_0AE568:         iwt   r0,#268E     ;
CODE_0AE56B:         add   r1           ;
CODE_0AE56C:         from r5            ;
CODE_0AE56D:         stw   (r0)         ;
CODE_0AE56E:         sm    (10E2),r9    ;
CODE_0AE572:         lm    r0,(1720)    ;
CODE_0AE576:         with r10           ;
CODE_0AE577:         sub   r0           ;
CODE_0AE578:         sm    (1182),r10   ;
CODE_0AE57C:         iwt   r15,#D07F    ;
CODE_0AE57F:         inc   r1           ;
CODE_0AE580:         iwt   r0,#11E0     ;
CODE_0AE583:         add   r1           ;
CODE_0AE584:         ldw   (r0)         ;
CODE_0AE585:         dec   r0           ;
CODE_0AE586:         bpl CODE_0AE59F    ;
CODE_0AE588:         with r2            ;
CODE_0AE589:         ibt   r3,#0001     ;
CODE_0AE58B:         link  #04          ;
CODE_0AE58C:         iwt   r15,#D387    ;
CODE_0AE58F:         sm    (11E0),r0    ;
CODE_0AE593:         add   r1           ;
CODE_0AE594:         ldw   (r0)         ;
CODE_0AE595:         sub   #00          ;
CODE_0AE597:         beq CODE_0AE59F    ;
CODE_0AE599:         with r2            ;
CODE_0AE59A:         add   r2           ;
CODE_0AE59B:         bra CODE_0AE5A8    ;

CODE_0AE59D:         with r2            ;
CODE_0AE59E:         with r2            ;
CODE_0AE59F:         add   r2           ;
CODE_0AE5A0:         ibt   r3,#FFFF     ;
CODE_0AE5A2:         link  #04          ;
CODE_0AE5A3:         iwt   r15,#D387    ;
CODE_0AE5A6:         add   #02          ;
CODE_0AE5A9:         with r2            ;
CODE_0AE5AA:         add   r2           ;
CODE_0AE5AB:         ibt   r3,#FFF0     ;
CODE_0AE5AD:         link  #04          ;
CODE_0AE5AE:         iwt   r15,#D169    ;
CODE_0AE5B1:         lsr                ;
CODE_0AE5B4:         bcc CODE_0AE5E2    ;
CODE_0AE5B6:         with r10           ;
CODE_0AE5B7:         add   r4           ;
CODE_0AE5B8:         ibt   r3,#FFFF     ;
CODE_0AE5BA:         iwt   r0,#1141     ;
CODE_0AE5BD:         add   r1           ;
CODE_0AE5BE:         from r3            ;
CODE_0AE5BF:         stb   (r0)         ;
CODE_0AE5C1:         iwt   r0,#272E     ;
CODE_0AE5C4:         add   r1           ;
CODE_0AE5C5:         from r9            ;
CODE_0AE5C6:         stw   (r0)         ;
CODE_0AE5C7:         inc   r0           ;
CODE_0AE5C8:         inc   r0           ;
CODE_0AE5C9:         from r10           ;
CODE_0AE5CA:         stw   (r0)         ;
CODE_0AE5CB:         lms   r3,(0010)    ;
CODE_0AE5CE:         iwt   r0,#0EC2     ;
CODE_0AE5D1:         add   r1           ;
CODE_0AE5D2:         from r3            ;
CODE_0AE5D3:         stb   (r0)         ;
CODE_0AE5D5:         sub   r0           ;
CODE_0AE5D6:         sms   (0010),r0    ;
CODE_0AE5D9:         iwt   r3,#0100     ;
CODE_0AE5DC:         iwt   r0,#1222     ;
CODE_0AE5DF:         add   r1           ;
CODE_0AE5E0:         from r3            ;
CODE_0AE5E1:         stw   (r0)         ;
CODE_0AE5E2:         lms   r5,(0010)    ;
CODE_0AE5E5:         iwt   r0,#268E     ;
CODE_0AE5E8:         add   r1           ;
CODE_0AE5E9:         from r5            ;
CODE_0AE5EA:         stw   (r0)         ;
CODE_0AE5EB:         iwt   r0,#10A2     ;
CODE_0AE5EE:         add   r1           ;
CODE_0AE5EF:         from r9            ;
CODE_0AE5F0:         stw   (r0)         ;
CODE_0AE5F1:         iwt   r0,#16E0     ;
CODE_0AE5F4:         add   r1           ;
CODE_0AE5F5:         ldw   (r0)         ;
CODE_0AE5F6:         with r10           ;
CODE_0AE5F7:         sub   r0           ;
CODE_0AE5F8:         iwt   r0,#1142     ;
CODE_0AE5FB:         add   r1           ;
CODE_0AE5FC:         from r10           ;
CODE_0AE5FD:         stw   (r0)         ;
CODE_0AE5FE:         iwt   r15,#D07F    ;
CODE_0AE601:         inc   r1           ;
CODE_0AE602:         ibt   r0,#000B     ;
CODE_0AE604:         romb               ;
CODE_0AE606:         iwt   r0,#1860     ;
CODE_0AE609:         add   r10          ;
CODE_0AE60A:         to r6              ;
CODE_0AE60B:         ldw   (r0)         ;
CODE_0AE60C:         from r6            ;
CODE_0AE60D:         and   r7           ;
CODE_0AE60E:         bne CODE_0AE629    ;
CODE_0AE610:         from r6            ;
CODE_0AE611:         and   #0F          ;
CODE_0AE613:         beq CODE_0AE61E    ;
CODE_0AE615:         link  #04          ;
CODE_0AE616:         iwt   r15,#E694    ;
CODE_0AE619:         nop                ;
CODE_0AE61A:         sub   r0           ;
CODE_0AE61B:         stop               ;
CODE_0AE61C:         nop                ;

CODE_0AE61D:         link  #04          ;
CODE_0AE61E:         iwt   r15,#E6B5    ;
CODE_0AE621:         nop                ;
CODE_0AE622:         with r4            ;
CODE_0AE623:         add   #0A          ;
CODE_0AE625:         ibt   r0,#000B     ;
CODE_0AE627:         romb               ;
CODE_0AE629:         ibt   r6,#0000     ;
CODE_0AE62B:         iwt   r0,#19D7     ;
CODE_0AE62E:         add   r10          ;
CODE_0AE62F:         from r6            ;
CODE_0AE630:         stb   (r0)         ;
CODE_0AE632:         iwt   r0,#8843     ;
CODE_0AE635:         to r14             ;
CODE_0AE636:         add   r4           ;
CODE_0AE637:         to r6              ;
CODE_0AE638:         getbs              ;
CODE_0AE63A:         iwt   r0,#1220     ;
CODE_0AE63D:         add   r10          ;
CODE_0AE63E:         from r6            ;
CODE_0AE63F:         stw   (r0)         ;
CODE_0AE640:         iwt   r0,#886B     ;
CODE_0AE643:         to r14             ;
CODE_0AE644:         add   r4           ;
CODE_0AE645:         to r6              ;
CODE_0AE646:         getbs              ;
CODE_0AE648:         iwt   r0,#1222     ;
CODE_0AE64B:         add   r10          ;
CODE_0AE64C:         from r6            ;
CODE_0AE64D:         stw   (r0)         ;
CODE_0AE64E:         iwt   r0,#8893     ;
CODE_0AE651:         to r14             ;
CODE_0AE652:         add   r4           ;
CODE_0AE653:         to r6              ;
CODE_0AE654:         getb               ;
CODE_0AE655:         iwt   r0,#1902     ;
CODE_0AE658:         add   r10          ;
CODE_0AE659:         from r6            ;
CODE_0AE65A:         stw   (r0)         ;
CODE_0AE65B:         iwt   r0,#88BB     ;
CODE_0AE65E:         to r14             ;
CODE_0AE65F:         add   r4           ;
CODE_0AE660:         getb               ;
CODE_0AE661:         to r6              ;
CODE_0AE662:         and   #01          ;
CODE_0AE664:         beq CODE_0AE66A    ;
CODE_0AE666:         nop                ;
CODE_0AE667:         swap               ;
CODE_0AE668:         inc   r0           ;
CODE_0AE669:         swap               ;
CODE_0AE66A:         bic   #01          ;
CODE_0AE66C:         sms   (0018),r0    ;
CODE_0AE66F:         iwt   r0,#88E3     ;
CODE_0AE672:         to r14             ;
CODE_0AE673:         add   r4           ;
CODE_0AE674:         to r6              ;
CODE_0AE675:         getbs              ;
CODE_0AE677:         iwt   r0,#10E2     ;
CODE_0AE67A:         add   r10          ;
CODE_0AE67B:         ldw   (r0)         ;
CODE_0AE67C:         bic   #0F          ;
CODE_0AE67E:         add   r6           ;
CODE_0AE67F:         sbk                ;
CODE_0AE680:         iwt   r0,#890B     ;
CODE_0AE683:         to r14             ;
CODE_0AE684:         add   r4           ;
CODE_0AE685:         to r6              ;
CODE_0AE686:         getbs              ;
CODE_0AE688:         iwt   r0,#1182     ;
CODE_0AE68B:         add   r10          ;
CODE_0AE68C:         ldw   (r0)         ;
CODE_0AE68D:         bic   #0F          ;
CODE_0AE68F:         add   r6           ;
CODE_0AE690:         sbk                ;
CODE_0AE691:         sub   r0           ;
CODE_0AE692:         stop               ;
CODE_0AE693:         nop                ;

CODE_0AE694:         from r3            ;
CODE_0AE695:         sub   #0B          ;
CODE_0AE697:         beq CODE_0AE6BB    ;
CODE_0AE699:         sub   r0           ;
CODE_0AE69A:         sms   (001C),r0    ;
CODE_0AE69D:         sms   (0008),r4    ;
CODE_0AE6A0:         iwt   r0,#8997     ;
CODE_0AE6A3:         to r14             ;
CODE_0AE6A4:         add   r4           ;
CODE_0AE6A5:         getb               ;
CODE_0AE6A6:         iwt   r6,#10E2     ;
CODE_0AE6A9:         with r6            ;
CODE_0AE6AA:         add   r10          ;
CODE_0AE6AB:         to r6              ;
CODE_0AE6AC:         ldw   (r6)         ;
CODE_0AE6AD:         to r8              ;
CODE_0AE6AE:         add   r6           ;
CODE_0AE6AF:         iwt   r0,#89A1     ;
CODE_0AE6B2:         bra CODE_0AE6D9    ;

CODE_0AE6B4:         to r14             ;
CODE_0AE6B5:         from r3            ;
CODE_0AE6B6:         sub   #01          ;
CODE_0AE6B8:         beq CODE_0AE69A    ;
CODE_0AE6BA:         sub   r0           ;
CODE_0AE6BB:         ibt   r0,#000A     ;
CODE_0AE6BD:         sms   (001C),r0    ;
CODE_0AE6C0:         sms   (0008),r4    ;
CODE_0AE6C3:         from r7            ;
CODE_0AE6C4:         to r4              ;
CODE_0AE6C5:         asr                ;
CODE_0AE6C6:         iwt   r0,#89AB     ;
CODE_0AE6C9:         to r14             ;
CODE_0AE6CA:         add   r4           ;
CODE_0AE6CB:         getb               ;
CODE_0AE6CC:         iwt   r6,#10E2     ;
CODE_0AE6CF:         with r6            ;
CODE_0AE6D0:         add   r10          ;
CODE_0AE6D1:         to r6              ;
CODE_0AE6D2:         ldw   (r6)         ;
CODE_0AE6D3:         to r8              ;
CODE_0AE6D4:         add   r6           ;
CODE_0AE6D5:         iwt   r0,#89B0     ;
CODE_0AE6D8:         to r14             ;
CODE_0AE6D9:         add   r4           ;
CODE_0AE6DA:         getb               ;
CODE_0AE6DB:         iwt   r6,#1182     ;
CODE_0AE6DE:         with r6            ;
CODE_0AE6DF:         add   r10          ;
CODE_0AE6E0:         to r6              ;
CODE_0AE6E1:         ldw   (r6)         ;
CODE_0AE6E2:         add   r6           ;
CODE_0AE6E3:         sms   (0020),r10   ;
CODE_0AE6E6:         sms   (006A),r11   ;
CODE_0AE6E9:         ibt   r6,#000A     ;
CODE_0AE6EB:         from r6            ;
CODE_0AE6EC:         romb               ;
CODE_0AE6EE:         link  #04          ;
CODE_0AE6EF:         iwt   r15,#D096    ;
CODE_0AE6F2:         lms   r0,(0016)    ;
CODE_0AE6F5:         romb               ;
CODE_0AE6F7:         lms   r11,(006A)   ;
CODE_0AE6FA:         lms   r10,(0020)   ;
CODE_0AE6FD:         lms   r4,(0008)    ;
CODE_0AE700:         from r7            ;
CODE_0AE701:         and   #04          ;
CODE_0AE703:         bne CODE_0AE70A    ;
CODE_0AE705:         nop                ;
CODE_0AE706:         iwt   r15,#E7AC    ;
CODE_0AE709:         nop                ;
CODE_0AE70A:         lms   r0,(001C)    ;
CODE_0AE70D:         with r4            ;
CODE_0AE70E:         add   r0           ;
CODE_0AE70F:         iwt   r0,#8933     ;
CODE_0AE712:         to r14             ;
CODE_0AE713:         add   r4           ;
CODE_0AE714:         to r6              ;
CODE_0AE715:         getbs              ;
CODE_0AE717:         iwt   r0,#1220     ;
CODE_0AE71A:         add   r10          ;
CODE_0AE71B:         from r6            ;
CODE_0AE71C:         stw   (r0)         ;
CODE_0AE71D:         iwt   r0,#8947     ;
CODE_0AE720:         to r14             ;
CODE_0AE721:         add   r4           ;
CODE_0AE722:         to r6              ;
CODE_0AE723:         getbs              ;
CODE_0AE725:         iwt   r0,#1222     ;
CODE_0AE728:         add   r10          ;
CODE_0AE729:         from r6            ;
CODE_0AE72A:         stw   (r0)         ;
CODE_0AE72B:         iwt   r0,#895B     ;
CODE_0AE72E:         to r14             ;
CODE_0AE72F:         add   r4           ;
CODE_0AE730:         getb               ;
CODE_0AE731:         to r6              ;
CODE_0AE732:         and   #01          ;
CODE_0AE734:         beq CODE_0AE73A    ;
CODE_0AE736:         nop                ;
CODE_0AE737:         swap               ;
CODE_0AE738:         inc   r0           ;
CODE_0AE739:         swap               ;
CODE_0AE73A:         bic   #01          ;
CODE_0AE73C:         sms   (0018),r0    ;
CODE_0AE73F:         iwt   r0,#19D7     ;
CODE_0AE742:         add   r10          ;
CODE_0AE743:         ldb   (r0)         ;
CODE_0AE745:         sub   #00          ;
CODE_0AE747:         bne CODE_0AE7AA    ;
CODE_0AE749:         sub   r0           ;
CODE_0AE74A:         iwt   r0,#896F     ;
CODE_0AE74D:         to r14             ;
CODE_0AE74E:         add   r4           ;
CODE_0AE74F:         to r6              ;
CODE_0AE750:         getb               ;
CODE_0AE751:         iwt   r0,#10E2     ;
CODE_0AE754:         add   r10          ;
CODE_0AE755:         ldw   (r0)         ;
CODE_0AE756:         bic   #0F          ;
CODE_0AE758:         or    r6           ;
CODE_0AE759:         sbk                ;
CODE_0AE75A:         iwt   r0,#8983     ;
CODE_0AE75D:         to r14             ;
CODE_0AE75E:         add   r4           ;
CODE_0AE75F:         to r6              ;
CODE_0AE760:         getb               ;
CODE_0AE761:         iwt   r0,#1182     ;
CODE_0AE764:         add   r10          ;
CODE_0AE765:         ldw   (r0)         ;
CODE_0AE766:         bic   #0F          ;
CODE_0AE768:         or    r6           ;
CODE_0AE769:         sbk                ;
CODE_0AE76A:         ibt   r6,#0000     ;
CODE_0AE76C:         iwt   r0,#10E1     ;
CODE_0AE76F:         add   r10          ;
CODE_0AE770:         from r6            ;
CODE_0AE771:         stb   (r0)         ;
CODE_0AE773:         iwt   r0,#1181     ;
CODE_0AE776:         add   r10          ;
CODE_0AE777:         from r6            ;
CODE_0AE778:         stb   (r0)         ;
CODE_0AE77A:         ibt   r6,#FFFF     ;
CODE_0AE77C:         iwt   r0,#1220     ;
CODE_0AE77F:         add   r10          ;
CODE_0AE780:         ldw   (r0)         ;
CODE_0AE781:         sub   #00          ;
CODE_0AE783:         bpl CODE_0AE78D    ;
CODE_0AE785:         nop                ;
CODE_0AE786:         iwt   r0,#10E1     ;
CODE_0AE789:         add   r10          ;
CODE_0AE78A:         from r6            ;
CODE_0AE78B:         stb   (r0)         ;
CODE_0AE78D:         iwt   r0,#1222     ;
CODE_0AE790:         add   r10          ;
CODE_0AE791:         ldw   (r0)         ;
CODE_0AE792:         sub   #00          ;
CODE_0AE794:         bpl CODE_0AE79E    ;
CODE_0AE796:         nop                ;
CODE_0AE797:         iwt   r0,#1181     ;
CODE_0AE79A:         add   r10          ;
CODE_0AE79B:         from r6            ;
CODE_0AE79C:         stb   (r0)         ;
CODE_0AE79E:         lms   r6,(001C)    ;
CODE_0AE7A1:         inc   r6           ;
CODE_0AE7A2:         iwt   r0,#19D7     ;
CODE_0AE7A5:         add   r10          ;
CODE_0AE7A6:         from r6            ;
CODE_0AE7A7:         stb   (r0)         ;
CODE_0AE7A9:         sub   r0           ;
CODE_0AE7AA:         stop               ;
CODE_0AE7AB:         nop                ;

CODE_0AE7AC:         iwt   r0,#19D7     ;
CODE_0AE7AF:         add   r10          ;
CODE_0AE7B0:         to r3              ;
CODE_0AE7B1:         ldb   (r0)         ;
CODE_0AE7B3:         moves r3,r3        ;
CODE_0AE7B5:         beq CODE_0AE816    ;
CODE_0AE7B7:         nop                ;
CODE_0AE7B8:         dec   r3           ;
CODE_0AE7B9:         beq CODE_0AE807    ;
CODE_0AE7BB:         nop                ;
CODE_0AE7BC:         iwt   r0,#19D9     ;
CODE_0AE7BF:         add   r10          ;
CODE_0AE7C0:         to r6              ;
CODE_0AE7C1:         ldb   (r0)         ;
CODE_0AE7C3:         iwt   r0,#1860     ;
CODE_0AE7C6:         add   r10          ;
CODE_0AE7C7:         ldw   (r0)         ;
CODE_0AE7C8:         moves r6,r6        ;
CODE_0AE7CA:         beq CODE_0AE7D0    ;
CODE_0AE7CC:         nop                ;
CODE_0AE7CD:         add   #0F          ;
CODE_0AE7CF:         inc   r0           ;
CODE_0AE7D0:         iwt   r6,#89B5     ;
CODE_0AE7D3:         to r14             ;
CODE_0AE7D4:         add   r6           ;
CODE_0AE7D5:         to r4              ;
CODE_0AE7D6:         getbs              ;
CODE_0AE7D8:         moves r4,r4        ;
CODE_0AE7DA:         bmi CODE_0AE7AA    ;
CODE_0AE7DC:         sub   r0           ;
CODE_0AE7DD:         from r4            ;
CODE_0AE7DE:         add   r4           ;
CODE_0AE7DF:         sex                ;
CODE_0AE7E0:         bmi CODE_0AE807    ;
CODE_0AE7E2:         nop                ;
CODE_0AE7E3:         iwt   r0,#89D5     ;
CODE_0AE7E6:         to r14             ;
CODE_0AE7E7:         add   r4           ;
CODE_0AE7E8:         getbs              ;
CODE_0AE7EA:         iwt   r6,#10E2     ;
CODE_0AE7ED:         with r6            ;
CODE_0AE7EE:         add   r10          ;
CODE_0AE7EF:         to r6              ;
CODE_0AE7F0:         ldw   (r6)         ;
CODE_0AE7F1:         add   r6           ;
CODE_0AE7F2:         sbk                ;
CODE_0AE7F3:         iwt   r0,#89DF     ;
CODE_0AE7F6:         to r14             ;
CODE_0AE7F7:         add   r4           ;
CODE_0AE7F8:         getbs              ;
CODE_0AE7FA:         iwt   r6,#1182     ;
CODE_0AE7FD:         with r6            ;
CODE_0AE7FE:         add   r10          ;
CODE_0AE7FF:         to r6              ;
CODE_0AE800:         ldw   (r6)         ;
CODE_0AE801:         add   r6           ;
CODE_0AE802:         sbk                ;
CODE_0AE803:         iwt   r15,#E62A    ;
CODE_0AE806:         ibt   r6,#003D     ;
CODE_0AE808:         ibt   r0,#000E     ;
CODE_0AE80A:         to r4              ;
CODE_0AE80B:         xor   #0A          ;
CODE_0AE80D:         lms   r0,(0008)    ;
CODE_0AE810:         with r4            ;
CODE_0AE811:         add   r0           ;
CODE_0AE812:         iwt   r15,#E623    ;
CODE_0AE815:         with r4            ;
CODE_0AE816:         lms   r4,(0008)    ;
CODE_0AE819:         jmp   r11          ;
CODE_0AE81A:         nop                ;

CODE_0AE81B:         ibt   r0,#000B     ;
CODE_0AE81D:         romb               ;
CODE_0AE81F:         iwt   r0,#8893     ;
CODE_0AE822:         to r14             ;
CODE_0AE823:         add   r4           ;
CODE_0AE824:         to r4              ;
CODE_0AE825:         getb               ;
CODE_0AE826:         iwt   r0,#1902     ;
CODE_0AE829:         add   r10          ;
CODE_0AE82A:         from r4            ;
CODE_0AE82B:         stw   (r0)         ;
CODE_0AE82C:         with r4            ;
CODE_0AE82D:         lsr                ;
CODE_0AE82E:         iwt   r0,#8933     ;
CODE_0AE831:         to r14             ;
CODE_0AE832:         add   r4           ;
CODE_0AE833:         to r6              ;
CODE_0AE834:         getbs              ;
CODE_0AE836:         iwt   r0,#1220     ;
CODE_0AE839:         add   r10          ;
CODE_0AE83A:         from r6            ;
CODE_0AE83B:         stw   (r0)         ;
CODE_0AE83C:         iwt   r0,#8947     ;
CODE_0AE83F:         to r14             ;
CODE_0AE840:         add   r4           ;
CODE_0AE841:         to r6              ;
CODE_0AE842:         getbs              ;
CODE_0AE844:         iwt   r0,#1222     ;
CODE_0AE847:         add   r10          ;
CODE_0AE848:         from r6            ;
CODE_0AE849:         stw   (r0)         ;
CODE_0AE84A:         iwt   r0,#895B     ;
CODE_0AE84D:         to r14             ;
CODE_0AE84E:         add   r4           ;
CODE_0AE84F:         getb               ;
CODE_0AE850:         to r6              ;
CODE_0AE851:         and   #01          ;
CODE_0AE853:         beq CODE_0AE859    ;
CODE_0AE855:         nop                ;
CODE_0AE856:         swap               ;
CODE_0AE857:         inc   r0           ;
CODE_0AE858:         swap               ;
CODE_0AE859:         bic   #01          ;
CODE_0AE85B:         sms   (0018),r0    ;
CODE_0AE85E:         stop               ;
CODE_0AE85F:         nop                ;

DATA_0AE860:         dw $9EE3, $3449

CODE_0AE864:         ibt   r0,#000A     ;
CODE_0AE866:         romb               ;
CODE_0AE868:         ibt   r2,#0000     ;
CODE_0AE86A:         with r5            ;
CODE_0AE86B:         sex                ;
CODE_0AE86C:         bmi CODE_0AE877    ;
CODE_0AE86E:         nop                ;
CODE_0AE86F:         lms   r0,(0028)    ;
CODE_0AE872:         not                ;
CODE_0AE873:         inc   r0           ;
CODE_0AE874:         sbk                ;
CODE_0AE875:         ibt   r2,#0002     ;
CODE_0AE877:         ibt   r3,#0020     ;
CODE_0AE879:         iwt   r1,#E860     ;
CODE_0AE87C:         from r6            ;
CODE_0AE87D:         hib                ;
CODE_0AE87E:         sub   r3           ;
CODE_0AE87F:         lob                ;
CODE_0AE880:         add   r0           ;
CODE_0AE881:         add   r0           ;
CODE_0AE882:         hib                ;
CODE_0AE883:         add   r2           ;
CODE_0AE884:         and   #03          ;
CODE_0AE886:         to r14             ;
CODE_0AE887:         add   r1           ;
CODE_0AE888:         getb               ;
CODE_0AE889:         sms   (003A),r0    ;
CODE_0AE88C:         ibt   r7,#000A     ;
CODE_0AE88E:         from r7            ;
CODE_0AE88F:         romb               ;
CODE_0AE891:         lms   r1,(003A)    ;
CODE_0AE894:         link  #04          ;
CODE_0AE895:         iwt   r15,#E8AB    ;
CODE_0AE898:         nop                ;
CODE_0AE899:         lms   r0,(003A)    ;
CODE_0AE89C:         lsr                ;
CODE_0AE89D:         lsr                ;
CODE_0AE89E:         lsr                ;
CODE_0AE89F:         to r1              ;
CODE_0AE8A0:         lsr                ;
CODE_0AE8A1:         link  #04          ;
CODE_0AE8A2:         iwt   r15,#E8AB    ;
CODE_0AE8A5:         nop                ;
CODE_0AE8A6:         sub   r0           ;
CODE_0AE8A7:         move  r1,r0        ;
CODE_0AE8A9:         stop               ;
CODE_0AE8AA:         nop                ;

CODE_0AE8AB:         sms   (0062),r11   ;
CODE_0AE8AE:         lms   r2,(003C)    ;
CODE_0AE8B1:         from r1            ;
CODE_0AE8B2:         and   #01          ;
CODE_0AE8B4:         beq CODE_0AE8BA    ;
CODE_0AE8B6:         nop                ;
CODE_0AE8B7:         lms   r2,(003E)    ;
CODE_0AE8BA:         from r1            ;
CODE_0AE8BB:         and   #02          ;
CODE_0AE8BD:         beq CODE_0AE8C3    ;
CODE_0AE8BF:         nop                ;
CODE_0AE8C0:         with r2            ;
CODE_0AE8C1:         not                ;
CODE_0AE8C2:         inc   r2           ;
CODE_0AE8C3:         lms   r3,(0028)    ;
CODE_0AE8C6:         lms   r0,(002A)    ;
CODE_0AE8C9:         add   r2           ;
CODE_0AE8CA:         to r8              ;
CODE_0AE8CB:         add   r3           ;
CODE_0AE8CC:         sms   (0020),r8    ;
CODE_0AE8CF:         lms   r2,(003C)    ;
CODE_0AE8D2:         from r1            ;
CODE_0AE8D3:         and   #04          ;
CODE_0AE8D5:         beq CODE_0AE8DB    ;
CODE_0AE8D7:         nop                ;
CODE_0AE8D8:         lms   r2,(003E)    ;
CODE_0AE8DB:         from r1            ;
CODE_0AE8DC:         and   #08          ;
CODE_0AE8DE:         beq CODE_0AE8E4    ;
CODE_0AE8E0:         nop                ;
CODE_0AE8E1:         with r2            ;
CODE_0AE8E2:         not                ;
CODE_0AE8E3:         inc   r2           ;
CODE_0AE8E4:         lms   r0,(002C)    ;
CODE_0AE8E7:         add   r2           ;
CODE_0AE8E8:         sms   (0022),r0    ;
CODE_0AE8EB:         link  #04          ;
CODE_0AE8EC:         iwt   r15,#D095    ;
CODE_0AE8EF:         cache              ;
CODE_0AE8F0:         from r7            ;
CODE_0AE8F1:         and   #02          ;
CODE_0AE8F3:         bne CODE_0AE918    ;
CODE_0AE8F5:         sub   r0           ;
CODE_0AE8F6:         lms   r8,(0020)    ;
CODE_0AE8F9:         ibt   r0,#0006     ;
CODE_0AE8FB:         lms   r1,(002A)    ;
CODE_0AE8FE:         from r1            ;
CODE_0AE8FF:         cmp   r8           ;
CODE_0AE901:         bpl CODE_0AE906    ;
CODE_0AE903:         nop                ;
CODE_0AE904:         not                ;
CODE_0AE905:         inc   r0           ;
CODE_0AE906:         to r8              ;
CODE_0AE907:         add   r8           ;
CODE_0AE908:         lms   r0,(0022)    ;
CODE_0AE90B:         add   #08          ;
CODE_0AE90D:         link  #04          ;
CODE_0AE90E:         iwt   r15,#D096    ;
CODE_0AE911:         and   #03          ;
CODE_0AE915:         beq CODE_0AE91C    ;
CODE_0AE917:         sub   r0           ;
CODE_0AE918:         ibt   r1,#0001     ;
CODE_0AE91A:         stop               ;
CODE_0AE91B:         nop                ;

CODE_0AE91C:         lms   r11,(0062)   ;
CODE_0AE91F:         jmp   r11          ;
CODE_0AE920:         nop                ;

CODE_0AE921:         ibt   r0,#000A     ;
CODE_0AE923:         romb               ;
CODE_0AE925:         ibt   r3,#0000     ;
CODE_0AE927:         ibt   r4,#0010     ;
CODE_0AE929:         ibt   r9,#FFF0     ;
CODE_0AE92B:         lms   r0,(009C)    ;
CODE_0AE92E:         to r9              ;
CODE_0AE92F:         and   r9           ;
CODE_0AE930:         iwt   r10,#00F0    ;
CODE_0AE933:         ibt   r12,#0008    ;
CODE_0AE935:         move  r8,r1        ;
CODE_0AE937:         from r2            ;
CODE_0AE938:         add   r9           ;
CODE_0AE939:         link  #04          ;
CODE_0AE93A:         iwt   r15,#D095    ;
CODE_0AE93D:         cache              ;
CODE_0AE93E:         and   #03          ;
CODE_0AE940:         bne CODE_0AE946    ;
CODE_0AE942:         nop                ;
CODE_0AE943:         bra CODE_0AE94C    ;

CODE_0AE945:         inc   r3           ;

CODE_0AE946:         and   #02          ;
CODE_0AE948:         bne CODE_0AE94C    ;
CODE_0AE94A:         nop                ;
CODE_0AE94B:         inc   r3           ;
CODE_0AE94C:         dec   r12          ;
CODE_0AE94D:         move  r13,r15      ;
CODE_0AE94F:         from r2            ;
CODE_0AE950:         add   r4           ;
CODE_0AE951:         cmp   r10          ;
CODE_0AE953:         bcc CODE_0AE959    ;
CODE_0AE955:         nop                ;
CODE_0AE956:         sub   r0           ;
CODE_0AE957:         move  r3,r0        ;
CODE_0AE959:         move  r2,r0        ;
CODE_0AE95B:         move  r8,r1        ;
CODE_0AE95D:         from r2            ;
CODE_0AE95E:         add   r9           ;
CODE_0AE95F:         link  #04          ;
CODE_0AE960:         iwt   r15,#D096    ;
CODE_0AE963:         and   #03          ;
CODE_0AE967:         bne CODE_0AE96D    ;
CODE_0AE969:         nop                ;
CODE_0AE96A:         bra CODE_0AE9A7    ;

CODE_0AE96C:         inc   r3           ;

CODE_0AE96D:         from r3            ;
CODE_0AE96E:         sub   #02          ;
CODE_0AE970:         bcc CODE_0AE99C    ;
CODE_0AE972:         nop                ;
CODE_0AE973:         with r2            ;
CODE_0AE974:         add   r9           ;
CODE_0AE975:         lms   r11,(0020)   ;
CODE_0AE978:         lm    r0,(008C)    ;
CODE_0AE97C:         sub   r1           ;
CODE_0AE97D:         bpl CODE_0AE982    ;
CODE_0AE97F:         nop                ;
CODE_0AE980:         not                ;
CODE_0AE981:         inc   r0           ;
CODE_0AE982:         sub   r11          ;
CODE_0AE983:         bpl CODE_0AE998    ;
CODE_0AE985:         nop                ;
CODE_0AE986:         lm    r0,(0090)    ;
CODE_0AE98A:         sub   r2           ;
CODE_0AE98B:         bpl CODE_0AE990    ;
CODE_0AE98D:         nop                ;
CODE_0AE98E:         not                ;
CODE_0AE98F:         inc   r0           ;
CODE_0AE990:         sub   r11          ;
CODE_0AE991:         bpl CODE_0AE998    ;
CODE_0AE993:         nop                ;
CODE_0AE994:         with r2            ;
CODE_0AE995:         with  r2           ;
CODE_0AE995:         bra CODE_0AE99C    ;

CODE_0AE997:         sub   r9           ;

CODE_0AE998:         to r10             ;
CODE_0AE999:         to    r10          ;
CODE_0AE999:         bra CODE_0AE9AB    ;

CODE_0AE99B:         sub   r0           ;

CODE_0AE99C:         from r5            ;
CODE_0AE99D:         and   #02          ;
CODE_0AE99F:         bne CODE_0AE9A5    ;
CODE_0AE9A1:         nop                ;
CODE_0AE9A2:         bra CODE_0AE9A7    ;

CODE_0AE9A4:         inc   r3           ;

CODE_0AE9A5:         to r3              ;
CODE_0AE9A6:         sub   r0           ;
CODE_0AE9A7:         loop               ;
CODE_0AE9A8:         nop                ;
CODE_0AE9A9:         ibt   r10,#FFFF    ;
CODE_0AE9AB:         sub   r0           ;
CODE_0AE9AC:         stop               ;
CODE_0AE9AD:         nop                ;

CODE_0AE9AE:         romb               ;
CODE_0AE9B0:         to r10             ;
CODE_0AE9B1:         sub   r0           ;
CODE_0AE9B2:         iwt   r0,#0006     ;
CODE_0AE9B5:         add   r3           ;
CODE_0AE9B6:         to r4              ;
CODE_0AE9B7:         ldw   (r0)         ;
CODE_0AE9B8:         link  #04          ;
CODE_0AE9B9:         iwt   r15,#E9F8    ;
CODE_0AE9BC:         nop                ;
CODE_0AE9BD:         or    r10          ;
CODE_0AE9BE:         to r10             ;
CODE_0AE9BF:         add   r0           ;
CODE_0AE9C0:         iwt   r0,#000E     ;
CODE_0AE9C3:         add   r3           ;
CODE_0AE9C4:         to r4              ;
CODE_0AE9C5:         ldw   (r0)         ;
CODE_0AE9C6:         link  #04          ;
CODE_0AE9C7:         iwt   r15,#E9F8    ;
CODE_0AE9CA:         nop                ;
CODE_0AE9CB:         or    r10          ;
CODE_0AE9CC:         to r10             ;
CODE_0AE9CD:         add   r0           ;
CODE_0AE9CE:         iwt   r0,#0016     ;
CODE_0AE9D1:         add   r3           ;
CODE_0AE9D2:         to r4              ;
CODE_0AE9D3:         ldw   (r0)         ;
CODE_0AE9D4:         link  #04          ;
CODE_0AE9D5:         iwt   r15,#E9F8    ;
CODE_0AE9D8:         nop                ;
CODE_0AE9D9:         or    r10          ;
CODE_0AE9DA:         to r10             ;
CODE_0AE9DB:         add   r0           ;
CODE_0AE9DC:         iwt   r0,#001E     ;
CODE_0AE9DF:         add   r3           ;
CODE_0AE9E0:         to r4              ;
CODE_0AE9E1:         ldw   (r0)         ;
CODE_0AE9E2:         link  #04          ;
CODE_0AE9E3:         iwt   r15,#E9F8    ;
CODE_0AE9E6:         nop                ;
CODE_0AE9E7:         or    r10          ;
CODE_0AE9E8:         to r10             ;
CODE_0AE9E9:         add   r0           ;
CODE_0AE9EA:         iwt   r0,#0026     ;
CODE_0AE9ED:         add   r3           ;
CODE_0AE9EE:         to r4              ;
CODE_0AE9EF:         ldw   (r0)         ;
CODE_0AE9F0:         link  #04          ;
CODE_0AE9F1:         iwt   r15,#E9F8    ;
CODE_0AE9F4:         nop                ;
CODE_0AE9F5:         or    r10          ;
CODE_0AE9F6:         stop               ;
CODE_0AE9F7:         nop                ;

CODE_0AE9F8:         cache              ;
CODE_0AE9F9:         move  r14,r1       ;
CODE_0AE9FB:         move  r12,r2       ;
CODE_0AE9FD:         move  r13,r15      ;
CODE_0AE9FF:         iwt   r0,#FF00     ;
CODE_0AEA02:         getbl              ;
CODE_0AEA04:         inc   r14          ;
CODE_0AEA05:         to r5              ;
CODE_0AEA06:         and   r4           ;
CODE_0AEA07:         getb               ;
CODE_0AEA08:         inc   r14          ;
CODE_0AEA09:         getbh              ;
CODE_0AEA0B:         inc   r14          ;
CODE_0AEA0C:         cmp   r5           ;
CODE_0AEA0E:         beq CODE_0AEA16    ;
CODE_0AEA10:         sub   r0           ;
CODE_0AEA11:         loop               ;
CODE_0AEA12:         nop                ;
CODE_0AEA13:         bra CODE_0AEA17    ;

CODE_0AEA15:         nop                ;

CODE_0AEA16:         inc   r0           ;
CODE_0AEA17:         jmp   r11          ;
CODE_0AEA18:         nop                ;

CODE_0AEA19:         ibt   r10,#0001    ;
CODE_0AEA1B:         moves r12,r12      ;
CODE_0AEA1D:         beq CODE_0AEA71    ;
CODE_0AEA1F:         nop                ;
CODE_0AEA20:         bpl CODE_0AEA27    ;
CODE_0AEA22:         with r12           ;
CODE_0AEA23:         not                ;
CODE_0AEA24:         inc   r12          ;
CODE_0AEA25:         ibt   r10,#FFFF    ;
CODE_0AEA27:         iwt   r0,#0020     ;
CODE_0AEA2A:         iwt   r13,#0024    ;
CODE_0AEA2D:         moves r9,r9        ;
CODE_0AEA2F:         beq CODE_0AEA38    ;
CODE_0AEA31:         nop                ;
CODE_0AEA32:         iwt   r0,#0022     ;
CODE_0AEA35:         iwt   r13,#0026    ;
CODE_0AEA38:         sms   (0028),r0    ;
CODE_0AEA3B:         sms   (002A),r13   ;
CODE_0AEA3E:         ibt   r0,#000A     ;
CODE_0AEA40:         romb               ;
CODE_0AEA42:         move  r13,r15      ;
CODE_0AEA44:         lms   r8,(0020)    ;
CODE_0AEA47:         lms   r0,(0022)    ;
CODE_0AEA4A:         link  #04          ;
CODE_0AEA4B:         iwt   r15,#D096    ;
CODE_0AEA4E:         and   #02          ;
CODE_0AEA51:         bne CODE_0AEA72    ;
CODE_0AEA53:         sub   r0           ;
CODE_0AEA54:         lms   r8,(0024)    ;
CODE_0AEA57:         lms   r0,(0026)    ;
CODE_0AEA5A:         link  #04          ;
CODE_0AEA5B:         iwt   r15,#D096    ;
CODE_0AEA5E:         and   #02          ;
CODE_0AEA61:         bne CODE_0AEA72    ;
CODE_0AEA63:         sub   r0           ;
CODE_0AEA64:         lms   r0,(0028)    ;
CODE_0AEA67:         ldw   (r0)         ;
CODE_0AEA68:         add   r10          ;
CODE_0AEA69:         sbk                ;
CODE_0AEA6A:         lms   r0,(002A)    ;
CODE_0AEA6D:         ldw   (r0)         ;
CODE_0AEA6E:         add   r10          ;
CODE_0AEA6F:         loop               ;
CODE_0AEA70:         sbk                ;
CODE_0AEA71:         sub   r0           ;
CODE_0AEA72:         stop               ;
CODE_0AEA73:         nop                ;

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
