; bank begins with 4 sprite routine address tables, each having a different purpose
; note about these 4 tables: they are only for up to 0x1BA (442) total sprites.
; the ID's beyond 0x1B9 are "special sprites", handled elsewhere

org $038000

; sprite init routine table: $8000 - $852D
sprite_inits:
DATA_038000:         dl $02E1EB    ; Log, floating on water / lava
DATA_038003:         dl $02A0E7    ; Closed door
DATA_038006:         dl $02F8FD    ; Naval Piranha's stalk
DATA_038009:         dl $0D8E60    ; Crate, key
DATA_03800C:         dl $02ACFC    ; Item from Star Mario block
DATA_03800F:         dl $048002    ; Icy watermelon
DATA_038012:         dl $048428    ; Chill
DATA_038015:         dl $048002    ; Watermelon
DATA_038018:         dl $0DFB93    ; Rubble
DATA_03801B:         dl $048002    ; Fire watermelon
DATA_03801E:         dl $03F2FE    ; Kaboomba
DATA_038021:         dl $0E8002    ; Cannonball of Kaboomba
DATA_038024:         dl $0FAD1F    ; Raphael the Raven
DATA_038027:         dl $02A52C    ; Goal
DATA_03802A:         dl $0F8000    ; G O A L !
DATA_03802D:         dl $0F8135    ; BONUS CHALLENGE
DATA_038030:         dl $06E02B    ; Caged Ghost, round mound
DATA_038033:         dl $11C8F0    ; Item Card
DATA_038036:         dl $02A125    ; Boss Door
DATA_038039:         dl $02DF55    ; Boss Explosion
DATA_03803C:         dl $02D9B8    ; Key from defeated boss
DATA_03803F:         dl $048140    ; Torpedo of Yoshi Submarine
DATA_038042:         dl $04B354    ; Bigger Boo
DATA_038045:         dl $0EDFDE    ; Frog Pirate
DATA_038048:         dl $04832C    ; Flame of Red Watermelon
DATA_03804B:         dl $0484C0    ; Bubble
DATA_03804E:         dl $04868A    ; Ski lift
DATA_038051:         dl $0488BC    ; Vertical log, floating on lava
DATA_038054:         dl $05CB0B    ; Dr. Freezegood, nothing / 6 stars / 1-up / Bumpty
DATA_038057:         dl $048655    ; Dr. Freezegood, with ski lift
DATA_03805A:         dl $0489C0    ; Shy Guy, green / red / yellow / purple
DATA_03805D:         dl $0F86EB    ; Rotating Doors
DATA_038060:         dl $0EC987    ; Bandit
DATA_038063:         dl $05C46B    ; ? bucket
DATA_038066:         dl $03B742    ; Flashing Egg
DATA_038069:         dl $03B746    ; Red Egg
DATA_03806C:         dl $03B746    ; Yellow Egg
DATA_03806F:         dl $03B759    ; Green Egg
DATA_038072:         dl $0DF8EA    ; Giant Egg, for battle with Bowser
DATA_038075:         dl $029FE4    ; Key
DATA_038078:         dl $0EA77F    ; Huffin' Puffin, running away
DATA_03807B:         dl $03B759    ; Giant Egg, for battle with Prince Froggy?
DATA_03807E:         dl $03B759    ; Red Giant Egg
DATA_038081:         dl $03B759    ; Green Giant Egg
DATA_038084:         dl $0496CC    ; Lunge Fish
DATA_038087:         dl $0681EF    ; Salvo the Slime
DATA_03808A:         dl $0692E5    ; Salvo the Slime's eyes
DATA_03808D:         dl $0CA07E    ; Little Mouser's Nest
DATA_038090:         dl $0CA21C    ; Little Mouser
DATA_038093:         dl $049BAA    ; Potted Spiked Fun Guy
DATA_038096:         dl $0CA087    ; Little Mouser, looking around, in nest / behind stuff
DATA_038099:         dl $0CA918    ; Little Mouser, from nest
DATA_03809C:         dl $02848C    ; Rogger the Potted Ghost
DATA_03809F:         dl $0285EA    ; Falling down Rogger the Potted Ghost?
DATA_0380A2:         dl $02812D    ; (BG3) Falling down wall
DATA_0380A5:         dl $049E15    ; Grim Leecher
DATA_0380A8:         dl $02908D    ; Flame spat by Rogger the Potted Ghost
DATA_0380AB:         dl $0291C3    ; (BG3) Spinning wooden platform
DATA_0380AE:         dl $0DB8CA    ; 3 Mini-Ravens
DATA_0380B1:         dl $0DB8CA    ; Mini-Raven
DATA_0380B4:         dl $0F9C0B    ; Tap-Tap the Red Nose
DATA_0380B7:         dl $04B11C    ; (BG3) Seesaw
DATA_0380BA:         dl $00878A    ; Skinny platform
DATA_0380BD:         dl $068000    ; Slime
DATA_0380C0:         dl $0F8D2F    ; Baby Luigi
DATA_0380C3:         dl $0F864B    ; Stork
DATA_0380C6:         dl $02D8C8    ; Vertical pipe entrance
DATA_0380C9:         dl $02CF72    ; Red Giant Shy Guy
DATA_0380CC:         dl $02CF72    ; Green Giant Shy Guy
DATA_0380CF:         dl $02C7F4    ; Prince Froggy, throat / before fight / throat with uvula / after fight
DATA_0380D2:         dl $069760    ; Burt the Bashful
DATA_0380D5:         dl $0CE5E9    ; Shy Guy for Rogger the Potted Ghost
DATA_0380D8:         dl $0CDB06    ; Kamek, for scenes before boss fights
DATA_0380DB:         dl $04CA61    ; The head of fire of the Thunder Lakitu
DATA_0380DE:         dl $04CA61    ; Fire of Thunder Lakitu
DATA_0380E1:         dl $04CA61    ; Hypocenter of the thunder.
DATA_0380E4:         dl $0EAAC5    ; Upside down Blow Hard
DATA_0380E7:         dl $029381    ; unknown
DATA_0380EA:         dl $02A0BC    ; Locked door
DATA_0380ED:         dl $029383    ; Middle ring
DATA_0380F0:         dl $04A197    ; (BG3) Board
DATA_0380F3:         dl $04A31F    ; (BG3) Large log
DATA_0380F6:         dl $05B421    ; Balloon
DATA_0380F9:         dl $0085DC    ; Kamek, says \OH MY!!!\""
DATA_0380FC:         dl $059F9F    ; Upside down Wild Piranha
DATA_0380FF:         dl $04C2B8    ; Green Pinwheel
DATA_038102:         dl $04C2B8    ; Pink Pinwheel
DATA_038105:         dl $06F08F    ; (BG3) Sewer ghost with Flatbed Ferry on its head
DATA_038108:         dl $0EDAFC    ; Green Solo Toady
DATA_03810B:         dl $029880    ; Continuous Super Star
DATA_03810E:         dl $0FABD7    ; Spark of Raphael the Raven.
DATA_038111:         dl $0ED847    ; Coin Bandit
DATA_038114:         dl $0EDAFC    ; Pink Toadie
DATA_038117:         dl $05FFC4    ; [CRASH]
DATA_03811A:         dl $04A4B1    ; (BG3) Plank
DATA_03811D:         dl $04A4B1    ; (BG3) Plank
DATA_038120:         dl $0E8002    ; Bomb
DATA_038123:         dl $06BCC8    ; Baby Mario
DATA_038126:         dl $0C8364    ; Goomba
DATA_038129:         dl $05E31D    ; Muddy Buddy
DATA_03812C:         dl $04C2A7    ; Pink Pinwheel, (X: direction) (Y: size)
DATA_03812F:         dl $0CEA06    ; Red coin
DATA_038132:         dl $059F9F    ; Wild Piranha
DATA_038135:         dl $0F8EAE    ; Hidden Winged Cloud, stars / seed / flower / 1-up
DATA_038138:         dl $0580C4    ; Flashing Egg Block
DATA_03813B:         dl $0580C4    ; Red Egg Block
DATA_03813E:         dl $0580C4    ; Yellow Egg Block
DATA_038141:         dl $05FE1F    ; Hit green Egg Block
DATA_038144:         dl $0582B5    ; Large Spring Ball
DATA_038147:         dl $0DB2EF    ; Hootie the Blue Fish, clockwise
DATA_03814A:         dl $0DB2E9    ; Hootie the Blue Fish, anticlockwise
DATA_03814D:         dl $0582F7    ; Spring Ball
DATA_038150:         dl $058627    ; Clawdaddy
DATA_038153:         dl $0CD4F5    ; Big Boo with 3 Boos / Big Boo / Big Boo with 3 Boos / Boo
DATA_038156:         dl $0CF18C    ; Train Bandit
DATA_038159:         dl $0CEFC4    ; (BG3) Balloon Pumper with red balloon
DATA_03815C:         dl $04CCB1    ; Spike
DATA_03815F:         dl $04CE5E    ; Spiked ball
DATA_038162:         dl $0DAF50    ; Piro Dangle, clockwise
DATA_038165:         dl $0DAF4C    ; Piro Dangle, anticlockwise
DATA_038168:         dl $05D1D7    ; Biting Bullet Bill Blaster
DATA_03816B:         dl $05D1D7    ; Bouncing Bullet Bill Blaster
DATA_03816E:         dl $05D1D7    ; Bullet Bill Blaster
DATA_038171:         dl $05D661    ; Biting Bullet Bill
DATA_038174:         dl $05D8DA    ; Bouncing Bullet Bill
DATA_038177:         dl $05D664    ; Bullet Bill
DATA_03817A:         dl $0295BB    ; Dent of castella
DATA_03817D:         dl $04ACB9    ; Log seesaw
DATA_038180:         dl $058CC6    ; Lava Bubble
DATA_038183:         dl $058E1B    ; Lava Bubble, jumps across
DATA_038186:         dl $05917D    ; Chain Chomp
DATA_038189:         dl $04DB19    ; Cloud
DATA_03818C:         dl $02A517    ; Teleport sprite
DATA_03818F:         dl $01AAE7    ; Harry Hedgehog
DATA_038192:         dl $05FFC4    ; [CRASH]
DATA_038195:         dl $0F90BF    ; Red Egg, gives 1-up
DATA_038198:         dl $029895    ; Super Star
DATA_03819B:         dl $04A6AE    ; Red Flatbed Ferry, moving horizontally
DATA_03819E:         dl $04A725    ; Pink Flatbed Ferry, moving vertically
DATA_0381A1:         dl $03E8D0    ; Mock Up, green / red
DATA_0381A4:         dl $02AC75    ; Yoshi, at the Goal
DATA_0381A7:         dl $03ECCB    ; Fly Guy, 5 stars / red coin / 1-up / 1-up
DATA_0381AA:         dl $0DEAD3    ; Kamek, at Bowser's room
DATA_0381AD:         dl $05974C    ; Swing of Grinders
DATA_0381B0:         dl $06D1A1    ; (BG3) Dangling Ghost
DATA_0381B3:         dl $04D5E9    ; 4 Toadies
DATA_0381B6:         dl $05F97A    ; Melon Bug
DATA_0381B9:         dl $02A125    ; Door
DATA_0381BC:         dl $059B30    ; Expansion Block
DATA_0381BF:         dl $059D95    ; Blue checkered block
DATA_0381C2:         dl $059D95    ; Red checkered block
DATA_0381C5:         dl $05F5AD    ; POW
DATA_0381C8:         dl $05B6DE    ; Yoshi Block
DATA_0381CB:         dl $0EB1B2    ; Spiny Egg
DATA_0381CE:         dl $0E81C0    ; Chained green Flatbed Ferry
DATA_0381D1:         dl $04D1C3    ; Mace Guy
DATA_0381D4:         dl $04D2A5    ; Mace
DATA_0381D7:         dl $0EB5DC    ; !-switch
DATA_0381DA:         dl $0EBE94    ; Chomp Rock
DATA_0381DD:         dl $05A87C    ; Wild Ptooie Piranha, spits 1 / 3 Needlenose
DATA_0381E0:         dl $0CC8E3    ; Tulip
DATA_0381E3:         dl $049CE0    ; Pot of Potted Spiked Fun Guy
DATA_0381E6:         dl $0EB1B2    ; Fireball of Thunder Lakitu
DATA_0381E9:         dl $0EC967    ; Bandit, getting under cover, left
DATA_0381EC:         dl $0EC967    ; Bandit, getting under cover, right
DATA_0381EF:         dl $02BF00    ; Nep-Enut / Gargantua Blargg
DATA_0381F2:         dl $0E8395    ; Incoming Chomp
DATA_0381F5:         dl $0E83A5    ; Flock of Incoming Chomps
DATA_0381F8:         dl $0E8436    ; Falling Incoming Chomp
DATA_0381FB:         dl $0E8DFE    ; Shadow of falling Incoming Chomp
DATA_0381FE:         dl $0086E9    ; Shy Guy in background
DATA_038201:         dl $029A57    ; Fill Eggs
DATA_038204:         dl $0DFBC1    ; Sign Arrow and Shadow
DATA_038207:         dl $05DA98    ; Hint Block
DATA_03820A:         dl $018002    ; Hookbill the Koopa
DATA_03820D:         dl $03C183    ; Morph Bubble, Car
DATA_038210:         dl $03C183    ; Morph Bubble, Mole Tank
DATA_038213:         dl $03C183    ; Morph Bubble, Helicopter
DATA_038216:         dl $03C183    ; Morph Bubble, Train
DATA_038219:         dl $039A6B    ; Wind of Fuzzy
DATA_03821C:         dl $03C183    ; Morph Bubble, Submarine
DATA_03821F:         dl $03C07F    ; Hidden Winged Cloud, 1-up / 5 stars / !-switch / 5 stars
DATA_038222:         dl $03C179    ; Winged Cloud, 8 coins
DATA_038225:         dl $03C179    ; Winged Cloud, bubbled 1-up
DATA_038228:         dl $03C179    ; Winged Cloud, flower
DATA_03822B:         dl $03C1C0    ; Winged Cloud, POW
DATA_03822E:         dl $03C1C0    ; Winged Cloud, stairs, right / left
DATA_038231:         dl $03C1C0    ; Winged Cloud, platform, right / left
DATA_038234:         dl $03C1C0    ; Winged Cloud, Bandit
DATA_038237:         dl $03C179    ; Winged Cloud, coin (object)
DATA_03823A:         dl $03C1A2    ; Winged Cloud, 1-up
DATA_03823D:         dl $03C179    ; Winged Cloud, key
DATA_038240:         dl $03C179    ; Winged Cloud, 3 stars
DATA_038243:         dl $03C179    ; Winged Cloud, 5 stars
DATA_038246:         dl $03C1C0    ; Winged Cloud, door
DATA_038249:         dl $03C1C0    ; Winged Cloud, ground eater
DATA_03824C:         dl $03C1C0    ; Winged Cloud, watermelon
DATA_03824F:         dl $03C1C0    ; Winged Cloud, fire watermelon
DATA_038252:         dl $03C1C0    ; Winged Cloud, icy watermelon
DATA_038255:         dl $03C1C0    ; Winged Cloud, seed of sunflower with 3 leaves
DATA_038258:         dl $03C1C0    ; Winged Cloud, seed of sunflower with 6 leaves
DATA_03825B:         dl $03C1C0    ; Winged Cloud, [CRASH]
DATA_03825E:         dl $02A09E    ; Boss Door of Bowser's room
DATA_038261:         dl $03C1C4    ; Winged Cloud, random item.
DATA_038264:         dl $03C179    ; Winged Cloud, !-switch / !-switch
DATA_038267:         dl $07F1CB    ; Baron Von Zeppelin, Giant Egg
DATA_03826A:         dl $0DFAC2    ; Bowser's flame
DATA_03826D:         dl $0DF637    ; Bowser's quake
DATA_038270:         dl $02D926    ; Horizontal entrance, towards right
DATA_038273:         dl $02D8C8    ; Hidden entrance, revealed by an ! switch
DATA_038276:         dl $06AA29    ; Marching Milde
DATA_038279:         dl $0F9328    ; Giant Milde
DATA_03827C:         dl $0F98BC    ; Large Milde
DATA_03827F:         dl $029B3C    ; Moutain backgrounds at fight with Hookbill the Koopa
DATA_038282:         dl $06E517    ; (BG3) Ghost with Flatbed Ferry on its head
DATA_038285:         dl $02D149    ; Sluggy the Unshaven
DATA_038288:         dl $029C47    ; Chomp signboard.
DATA_03828B:         dl $0EF83C    ; Fishin' Lakitu
DATA_03828E:         dl $0DBB52    ; Flower pot, key / 6 stars / 6 coins / nothing
DATA_038291:         dl $06E944    ; (BG3) Soft thing
DATA_038294:         dl $0EC8D7    ; Snowball
DATA_038297:         dl $01A248    ; Closer, in Naval Piranha's room
DATA_03829A:         dl $029C8B    ; Falling Rock
DATA_03829D:         dl $0CCE4D    ; Piscatory Pete, Blue / Gold
DATA_0382A0:         dl $0CD064    ; Preying Mantas
DATA_0382A3:         dl $0CD122    ; Loch Nestor
DATA_0382A6:         dl $0E8E91    ; Boo Blah, normal / upside down
DATA_0382A9:         dl $0E8E91    ; Boo Blah with Piro Dangle, normal / upside down
DATA_0382AC:         dl $05E0F8    ; Heading cactus
DATA_0382AF:         dl $0EB1B2    ; Green Needlenose
DATA_0382B2:         dl $01AC8E    ; Gusty, left / right / infinite right / infinite left
DATA_0382B5:         dl $05ABB2    ; Burt, two / one
DATA_0382B8:         dl $0E93E2    ; Goonie, right / towards Yoshi / generator right / generator left
DATA_0382BB:         dl $0E936E    ; 3 Flightless Goonies
DATA_0382BE:         dl $06B9DA    ; Cloud Drop, moving vertically
DATA_0382C1:         dl $06BB7A    ; Cloud Drop, moving horizontally
DATA_0382C4:         dl $05BE69    ; Flamer Guy, jumping around
DATA_0382C7:         dl $05BE69    ; Flamer Guy, walking around
DATA_0382CA:         dl $05B99F    ; Eggo-Dil
DATA_0382CD:         dl $05B9EE    ; Eggo-Dil's face
DATA_0382D0:         dl $05BE02    ; Petal of Eggo-Dil
DATA_0382D3:         dl $078000    ; Bubble-Plant
DATA_0382D6:         dl $078540    ; Stilt Guy, green / red / yellow / purple
DATA_0382D9:         dl $0CFB8F    ; Woozy Guy, green / red / yellow / purple
DATA_0382DC:         dl $0780C3    ; Egg-Plant / Needlenose-Plant
DATA_0382DF:         dl $0788A7    ; Slugger
DATA_0382E2:         dl $0EA472    ; Parent and children of Huffin' Puffins
DATA_0382E5:         dl $0EA131    ; Barney Bubble
DATA_0382E8:         dl $0EAAC5    ; Blow Hard
DATA_0382EB:         dl $0EB1B2    ; Yellow Needlenose
DATA_0382EE:         dl $0EB36A    ; Flower
DATA_0382F1:         dl $079025    ; Spear Guy, long spear
DATA_0382F4:         dl $07902F    ; Spear Guy, short spear
DATA_0382F7:         dl $07CE9D    ; Zeus Guy
DATA_0382FA:         dl $07D8D4    ; Energy of Zeus Guy
DATA_0382FD:         dl $079628    ; Poochy
DATA_038300:         dl $04C89A    ; Bubbled 1-up
DATA_038303:         dl $0D8002    ; Spiky mace
DATA_038306:         dl $0D8002    ; Spiky mace, double-ended
DATA_038309:         dl $04DAE9    ; Boo Guys spinning spiky mace
DATA_03830C:         dl $0CB636    ; Jean de Fillet, right / left
DATA_03830F:         dl $0D834D    ; Boo Guys, carrying bombs towards left.
DATA_038312:         dl $0D8352    ; Boo Guys, carrying bombs towards right
DATA_038315:         dl $01AE18    ; Seed of watermelon
DATA_038318:         dl $04CFDD    ; Milde
DATA_03831B:         dl $0DC171    ; Tap-Tap
DATA_03831E:         dl $0DC171    ; Tap-Tap, stays on ledges
DATA_038321:         dl $0DC171    ; Hopping Tap-Tap
DATA_038324:         dl $0D89FF    ; Chained spike ball, controlled by Boo Guy
DATA_038327:         dl $01AE76    ; Boo Guy, rotating a pulley, right / left
DATA_03832A:         dl $0D8E60    ; Crate, 6 stars
DATA_03832D:         dl $05DC74    ; Boo Man Bluff
DATA_038330:         dl $0EB54E    ; Flower
DATA_038333:         dl $01A5C9    ; Georgette Jelly
DATA_038336:         dl $01AA9D    ; Splashed Georgette Jelly
DATA_038339:         dl $0793FA    ; Snifit
DATA_03833C:         dl $079591    ; Bullet, shot by Snifit
DATA_03833F:         dl $04C968    ; Coin, gravity affected
DATA_038342:         dl $04AF9E    ; Floating round platform on water
DATA_038345:         dl $04CB46    ; Donut Lift
DATA_038348:         dl $04CB46    ; Giant Donut Lift
DATA_03834B:         dl $05EA0A    ; Spooky
DATA_03834E:         dl $079FD0    ; Green Glove
DATA_038351:         dl $07A67A    ; Lakitu, one / two
DATA_038354:         dl $0DBD3B    ; Lakitu's cloud
DATA_038357:         dl $0EB1B2    ; Spiny Egg
DATA_03835A:         dl $05F07F    ; Brown Arrow Wheel
DATA_03835D:         dl $05F07F    ; Blue Arrow Wheel
DATA_038360:         dl $05F3F0    ; Double-ended arrow lift
DATA_038363:         dl $04CC24    ; Explosion of Number Platform
DATA_038366:         dl $05C46B    ; ? bucket, Bandit
DATA_038369:         dl $05C46B    ; ? bucket, 5 coins
DATA_03836C:         dl $0490F1    ; Stretch, green / red / yellow / purple
DATA_03836F:         dl $03E3B7    ; Kamek, for the ending scene / flying and chases
DATA_038372:         dl $0D9439    ; Spiked log held by chain and pulley
DATA_038375:         dl $0D9770    ; ? Pulley
DATA_038378:         dl $0DF037    ; Ground shake
DATA_03837B:         dl $03F59E    ; Fuzzy
DATA_03837E:         dl $0489B3    ; Shy Guy, with Bandit hidden
DATA_038381:         dl $07ADD7    ; Fat Guy, red / green
DATA_038384:         dl $0CF38B    ; Fly Guy carrying red coin / Whirly Fly Guy
DATA_038387:         dl $0CFA4B    ; Yoshi, in the intro scene
DATA_03838A:         dl $06B933    ; unknown
DATA_03838D:         dl $07AB51    ; Lava Drop, moving horizontally
DATA_038390:         dl $07AC5F    ; Lava Drop, moving vertically
DATA_038393:         dl $02A0D4    ; Locked door
DATA_038396:         dl $0693E6    ; Lemon Drop
DATA_038399:         dl $0489C0    ; Lantern Ghost
DATA_03839C:         dl $0DC50C    ; Baby Bowser
DATA_03839F:         dl $0D983D    ; Raven, always circling, anticlockwise / clockwise
DATA_0383A2:         dl $0D983D    ; Raven, anticlockwise / clockwise initially
DATA_0383A5:         dl $029E55    ; 3x6 Falling Rock
DATA_0383A8:         dl $029E55    ; 3x3 Falling Rock
DATA_0383AB:         dl $029E55    ; 3x9 Falling Rock
DATA_0383AE:         dl $029E55    ; 6x3 Falling Rock
DATA_0383B1:         dl $02D03F    ; Stomach Acid
DATA_0383B4:         dl $0D9A1A    ; Flipper, downwards
DATA_0383B7:         dl $07B052    ; Fang, dangling
DATA_0383BA:         dl $07B1B6    ; Fang, flying wavily
DATA_0383BD:         dl $07B28E    ; Flopsy Fish, swimming around
DATA_0383C0:         dl $07B28E    ; Flopsy Fish, swimming and occasionally jumps vertically
DATA_0383C3:         dl $05F6DE    ; Flopsy Fish, swimming and jumps in an arc
DATA_0383C6:         dl $05F6DE    ; Flopsy Fish, jumps 3 times in an arc, right / left
DATA_0383C9:         dl $07BE90    ; Spray Fish
DATA_0383CC:         dl $0D9D2E    ; Flipper, rightwards / leftwards
DATA_0383CF:         dl $07B6A3    ; Blue Sluggy, falling down / crawing ceiling
DATA_0383D2:         dl $07B6AC    ; Pink Sluggy, falling down / crawing ceiling but doesn't move
DATA_0383D5:         dl $02D922    ; Horizontal entrance, towards left
DATA_0383D8:         dl $0582B5    ; Large Spring Ball
DATA_0383DB:         dl $07B9A4    ; Arrow cloud, up
DATA_0383DE:         dl $07B9A9    ; Arrow cloud, up right
DATA_0383E1:         dl $07B9AE    ; Arrow cloud, right
DATA_0383E4:         dl $07B9B3    ; Arrow cloud, down right
DATA_0383E7:         dl $07B9B8    ; Arrow cloud, down
DATA_0383EA:         dl $07B9BD    ; Arrow cloud, down left
DATA_0383ED:         dl $07B9C2    ; Arrow cloud, left
DATA_0383F0:         dl $07B9C7    ; Arrow cloud, up left
DATA_0383F3:         dl $07B9EE    ; Arrow cloud, rotating
DATA_0383F6:         dl $07BB20    ; Flutter
DATA_0383F9:         dl $0E942D    ; Goonie with Shy Guy
DATA_0383FC:         dl $0DA097    ; Shark Chomp
DATA_0383FF:         dl $0E9A9B    ; Very Fat Goonie
DATA_038402:         dl $0EB839    ; Cactus Jack, one / three
DATA_038405:         dl $07C2D6    ; Wall Lakitu
DATA_038408:         dl $0E9AA1    ; Bowling Goonie
DATA_03840B:         dl $07C6A6    ; Grunt, walking
DATA_03840E:         dl $07C6CB    ; Grunt, running
DATA_038411:         dl $07C968    ; Dancing Spear Guy
DATA_038414:         dl $0DA513    ; Green switch for green spiked platform
DATA_038417:         dl $0DA513    ; Red switch for red spiked platform
DATA_03841A:         dl $04C244    ; Pink Pinwheel with Shy Guys, clockwise / anticlockwise
DATA_03841D:         dl $0DA560    ; Green spiked platform
DATA_038420:         dl $0DA560    ; Red spiked platform
DATA_038423:         dl $0F927C    ; Bonus Item, red coin / key / flower / door
DATA_038426:         dl $0DA8C7    ; Two spiked platforms with one switch in the center
DATA_038429:         dl $0F9111    ; Bouncing green Needlenose
DATA_03842C:         dl $0F8B5B    ; Nipper Plant
DATA_03842F:         dl $0F8B36    ; Nipper Spore
DATA_038432:         dl $07EB4C    ; Thunder Lakitu, one / two
DATA_038435:         dl $07D956    ; Green Koopa shell
DATA_038438:         dl $07D956    ; Red Koopa shell
DATA_03843B:         dl $07DD52    ; Green Beach Koopa
DATA_03843E:         dl $07DD52    ; Red Beach Koopa
DATA_038441:         dl $07DD78    ; Green Koopa
DATA_038444:         dl $07DD78    ; Red Koopa
DATA_038447:         dl $07E487    ; Green Para Koopa, jumping forth.
DATA_03844A:         dl $07E4D1    ; Red Para Koopa, flying horizontally
DATA_03844D:         dl $07E520    ; Red Para Koopa, flying vertically
DATA_038450:         dl $07E7B5    ; Aqua Lakitu
DATA_038453:         dl $02E494    ; Naval Piranha
DATA_038456:         dl $02F37F    ; Naval Bud
DATA_038459:         dl $07F19B    ; Baron Von Zeppelin, red Suy Guy
DATA_03845C:         dl $07F196    ; Baron Von Zeppelin, Needlenose
DATA_03845F:         dl $07F191    ; Baron Von Zeppelin, bomb
DATA_038462:         dl $07F18C    ; Baron Von Zeppelin, Bandit
DATA_038465:         dl $07F139    ; Baron Von Zeppelin, large Spring Ball
DATA_038468:         dl $07F125    ; Baron Von Zeppelin, 1-up
DATA_03846B:         dl $07F11D    ; Baron Von Zeppelin, key
DATA_03846E:         dl $07F118    ; Baron Von Zeppelin, 5 coins
DATA_038471:         dl $07F187    ; Baron Von Zeppelin, watermelon
DATA_038474:         dl $07F182    ; Baron Von Zeppelin, fire watermelon
DATA_038477:         dl $07F17D    ; Baron Von Zeppelin, icy watermelon
DATA_03847A:         dl $07F1FB    ; Baron Von Zeppelin, crate, 6 stars.
DATA_03847D:         dl $07FB24    ; Baron Von Zeppelin
DATA_038480:         dl $0DBA11    ; Spinning Log
DATA_038483:         dl $0F8370    ; Crazee Dayzee
DATA_038486:         dl $0F89F9    ; Dragonfly
DATA_038489:         dl $0F8A93    ; Butterfly
DATA_03848C:         dl $0C9306    ; Bumpty
DATA_03848F:         dl $04A872    ; Active line guided green Flatbed Ferry, left
DATA_038492:         dl $04A872    ; Active line guided green Flatbed Ferry, right
DATA_038495:         dl $04A872    ; Active line guided yellow Flatbed Ferry, left
DATA_038498:         dl $04A872    ; Active line guided yellow Flatbed Ferry, right
DATA_03849B:         dl $04A88A    ; Line guided green Flatbed Ferry, left
DATA_03849E:         dl $04A88A    ; Line guided green Flatbed Ferry, right
DATA_0384A1:         dl $04A88A    ; Line guided yellow Flatbed Ferry, left
DATA_0384A4:         dl $04A88A    ; Line guided yellow Flatbed Ferry, right
DATA_0384A7:         dl $04A88A    ; Line guided red Flatbed Ferry, left
DATA_0384AA:         dl $04A88A    ; Line guided red Flatbed Ferry, right
DATA_0384AD:         dl $04AA24    ; Whirling lift
DATA_0384B0:         dl $0C800C    ; Falling icicle
DATA_0384B3:         dl $0F8F53    ; Sparrow
DATA_0384B6:         dl $049481    ; Muti Guy, green / red / yellow / purple
DATA_0384B9:         dl $06D9C0    ; Caged Ghost, squeezing in sewer
DATA_0384BC:         dl $0C905A    ; Blargg
DATA_0384BF:         dl $0C863E    ; unknown
DATA_0384C2:         dl $0C8671    ; Unbalanced snowy platform
DATA_0384C5:         dl $0F899D    ; Arrow sign, up / right / left / down
DATA_0384C8:         dl $0F8972    ; Diagonal arrow sign, up left / up right / down left / down right
DATA_0384CB:         dl $0C88E6    ; Dizzy Dandy
DATA_0384CE:         dl $0C8B61    ; Boo Guy
DATA_0384D1:         dl $0C970A    ; Bumpty, tackles at Yoshi
DATA_0384D4:         dl $0C99B5    ; Flying Bumpty, flying aronnd / flying straightly
DATA_0384D7:         dl $0C9B6C    ; Skeleton Goonie
DATA_0384DA:         dl $0C9CF3    ; Flightless Skeleton Goonie
DATA_0384DD:         dl $0C9D6C    ; Skeleton Goonie with a bomb
DATA_0384E0:         dl $0CA00F    ; Firebar, double-ended, clockwise / anticlockwise
DATA_0384E3:         dl $0CA00F    ; Firebar, clockwise / anticlockwise
DATA_0384E6:         dl $0CB530    ; Star
DATA_0384E9:         dl $0CB304    ; Little Skull Mouser
DATA_0384EC:         dl $07FDBF    ; Cork, seals 3D pipe
DATA_0384EF:         dl $02AD90    ; Grinder, runs away
DATA_0384F2:         dl $02ADF7    ; Grinder, spits seeds of watermelon
DATA_0384F5:         dl $02AE2B    ; Short Fuse / Seedy Sally, right / left
DATA_0384F8:         dl $02AE70    ; Grinder, grasps Baby Mario
DATA_0384FB:         dl $02AE07    ; Grinder, climbing, spits seeds of watermelon
DATA_0384FE:         dl $0CB914    ; Hot Lips
DATA_038501:         dl $0CBE98    ; Boo Balloon, coin / !-switch
DATA_038504:         dl $0F917C    ; Frog
DATA_038507:         dl $0CC369    ; Kamek, shoots magic at Yoshi.
DATA_03850A:         dl $0CC796    ; Kamek's magic
DATA_03850D:         dl $0CE961    ; Coin
DATA_038510:         dl $0CEB10    ; (BG3) Balloon
DATA_038513:         dl $11B088    ; Coin Cannon for Mini Battle
DATA_038516:         dl $11B23B    ; Coin for Mini Battle
DATA_038519:         dl $11B317    ; Bandit for Mini Battle
DATA_03851C:         dl $11A08D    ; Checkered Platform for Mini Battle
DATA_03851F:         dl $11A77A    ; Bandit for Mini Battle
DATA_038522:         dl $11A0E6    ; Red Balloon for Mini Battle
DATA_038525:         dl $11BA69    ; Bandit for Mini Battle
DATA_038528:         dl $11C44B    ; Watermelon Pot for Mini Battle
DATA_03852B:         dl $11C640    ; possibly Bandit for Mini Battle
; end init routine table

; sprite main routine table: $852E - 8A5B
sprite_mains:
DATA_03852E:         dl $02E26A    ; Log, floating on water / lava
DATA_038531:         dl $02A330    ; Closed door
DATA_038534:         dl $02F912    ; Naval Piranha's stalk
DATA_038537:         dl $0D8EBE    ; Crate, key
DATA_03853A:         dl $02AD0A    ; Item from Star Mario block
DATA_03853D:         dl $048031    ; Icy watermelon
DATA_038540:         dl $048429    ; Chill
DATA_038543:         dl $048031    ; Watermelon
DATA_038546:         dl $0DFB94    ; Rubble
DATA_038549:         dl $048031    ; Fire watermelon
DATA_03854C:         dl $03F331    ; Kaboomba
DATA_03854F:         dl $0E8019    ; Cannonball of Kaboomba
DATA_038552:         dl $0FAD27    ; Raphael the Raven
DATA_038555:         dl $02A617    ; Goal
DATA_038558:         dl $0F8019    ; G O A L !
DATA_03855B:         dl $0F8174    ; BONUS CHALLENGE
DATA_03855E:         dl $06E047    ; Caged Ghost, round mound
DATA_038561:         dl $11C9A0    ; Item Card
DATA_038564:         dl $02A330    ; Boss Door
DATA_038567:         dl $02DF7A    ; Boss Explosion
DATA_03856A:         dl $02DA0E    ; Key from defeated boss
DATA_03856D:         dl $04816B    ; Torpedo of Yoshi Submarine
DATA_038570:         dl $04B4EA    ; Bigger Boo
DATA_038573:         dl $0EE023    ; Frog Pirate
DATA_038576:         dl $04833D    ; Flame of Red Watermelon
DATA_038579:         dl $04850D    ; Bubble
DATA_03857C:         dl $048707    ; Ski lift
DATA_03857F:         dl $0488DC    ; Vertical log, floating on lava
DATA_038582:         dl $05CB64    ; Dr. Freezegood, nothing / 6 stars / 1-up / Bumpty
DATA_038585:         dl $048707    ; Dr. Freezegood, with ski lift
DATA_038588:         dl $048A58    ; Shy Guy, green / red / yellow / purple
DATA_03858B:         dl $0F8797    ; Rotating Doors
DATA_03858E:         dl $0EC9AD    ; Bandit
DATA_038591:         dl $05C8B6    ; ? bucket
DATA_038594:         dl $03B86E    ; Flashing Egg
DATA_038597:         dl $03B872    ; Red Egg
DATA_03859A:         dl $03B872    ; Yellow Egg
DATA_03859D:         dl $03B872    ; Green Egg
DATA_0385A0:         dl $0DF8FB    ; Giant Egg, for battle with Bowser
DATA_0385A3:         dl $02A04A    ; Key
DATA_0385A6:         dl $0EA792    ; Huffin' Puffin, running away
DATA_0385A9:         dl $03B7B4    ; Giant Egg, for battle with Prince Froggy?
DATA_0385AC:         dl $03B872    ; Red Giant Egg
DATA_0385AF:         dl $03B872    ; Green Giant Egg
DATA_0385B2:         dl $0496FA    ; Lunge Fish
DATA_0385B5:         dl $0683CA    ; Salvo the Slime
DATA_0385B8:         dl $0692E6    ; Salvo the Slime's eyes
DATA_0385BB:         dl $0CA082    ; Little Mouser's Nest
DATA_0385BE:         dl $0CA2C7    ; Little Mouser
DATA_0385C1:         dl $049C0A    ; Potted Spiked Fun Guy
DATA_0385C4:         dl $0CA0B4    ; Little Mouser, looking around, in nest / behind stuff
DATA_0385C7:         dl $0CA98E    ; Little Mouser, from nest
DATA_0385CA:         dl $0284F6    ; Rogger the Potted Ghost
DATA_0385CD:         dl $0285EB    ; Falling down Rogger the Potted Ghost?
DATA_0385D0:         dl $028209    ; (BG3) Falling down wall
DATA_0385D3:         dl $049E30    ; Grim Leecher
DATA_0385D6:         dl $0290E6    ; Flame spat by Rogger the Potted Ghost
DATA_0385D9:         dl $029235    ; (BG3) Spinning wooden platform
DATA_0385DC:         dl $0DB918    ; 3 Mini-Ravens
DATA_0385DF:         dl $0DB918    ; Mini-Raven
DATA_0385E2:         dl $0F9C58    ; Tap-Tap the Red Nose
DATA_0385E5:         dl $04B15B    ; (BG3) Seesaw
DATA_0385E8:         dl $00878E    ; Skinny platform
DATA_0385EB:         dl $0683CA    ; Slime
DATA_0385EE:         dl $0F8DB1    ; Baby Luigi
DATA_0385F1:         dl $0F865F    ; Stork
DATA_0385F4:         dl $02D8E7    ; Vertical pipe entrance
DATA_0385F7:         dl $02CFA6    ; Red Giant Shy Guy
DATA_0385FA:         dl $02CFA6    ; Green Giant Shy Guy
DATA_0385FD:         dl $02C950    ; Prince Froggy, throat / before fight / throat with uvula / after fight
DATA_038600:         dl $0699DC    ; Burt the Bushful
DATA_038603:         dl $0CE658    ; Shy Guy for Rogger the Potted Ghost
DATA_038606:         dl $0CDB6C    ; Kamek, for scenes before boss fights
DATA_038609:         dl $04CA62    ; The head of fire of the Thunder Lakitu
DATA_03860C:         dl $04CAFE    ; Fire of Thunder Lakitu
DATA_03860F:         dl $04CAFE    ; Hypocenter of the thunder.
DATA_038612:         dl $0EAAF0    ; Upside down Blow Hard
DATA_038615:         dl $029382    ; unknown
DATA_038618:         dl $02A330    ; Locked door
DATA_03861B:         dl $02938E    ; Middle ring
DATA_03861E:         dl $04A1B4    ; (BG3) Board
DATA_038621:         dl $04A342    ; (BG3) Large log
DATA_038624:         dl $05B4CC    ; Balloon
DATA_038627:         dl $0085E5    ; Kamek, says \OH MY!!!\""
DATA_03862A:         dl $059FE6    ; Upside down Wild Piranha
DATA_03862D:         dl $04C2F6    ; Green Pinwheel
DATA_038630:         dl $04C2F6    ; Pink Pinwheel
DATA_038633:         dl $06F0C2    ; (BG3) Sewer ghost with Flatbed Ferry on its head
DATA_038636:         dl $0EDB40    ; Green Solo Toady
DATA_038639:         dl $0298F4    ; Continuous Super Star
DATA_03863C:         dl $0FABE5    ; Spark of Raphael the Raven.
DATA_03863F:         dl $0ED8B9    ; Coin Bandit
DATA_038642:         dl $0EDB40    ; Pink Toadie
DATA_038645:         dl $05FFC4    ; [CRASH]
DATA_038648:         dl $04A4D5    ; (BG3) Plank
DATA_03864B:         dl $04A4D5    ; (BG3) Plank
DATA_03864E:         dl $0E8023    ; Bomb
DATA_038651:         dl $06BCEC    ; Baby Mario
DATA_038654:         dl $0C8369    ; Goomba
DATA_038657:         dl $05E346    ; Muddy Buddy
DATA_03865A:         dl $04C2F6    ; Pink Pinwheel, (X: direction) (Y: size)
DATA_03865D:         dl $0CEA40    ; Red coin
DATA_038660:         dl $059FE6    ; Wild Piranha
DATA_038663:         dl $0F8EEB    ; Hidden Winged Cloud, stars / seed / flower / 1-up
DATA_038666:         dl $0580DD    ; Flashing Egg Block
DATA_038669:         dl $0580E1    ; Red Egg Block
DATA_03866C:         dl $0580E1    ; Yellow Egg Block
DATA_03866F:         dl $05FE6E    ; Hit green Egg Block
DATA_038672:         dl $058325    ; Large Spring Ball
DATA_038675:         dl $0DB316    ; Hootie the Blue Fish, clockwise
DATA_038678:         dl $0DB316    ; Hootie the Blue Fish, anticlockwise
DATA_03867B:         dl $058320    ; Spring Ball
DATA_03867E:         dl $058648    ; Clawdaddy
DATA_038681:         dl $0CD545    ; Big Boo with 3 Boos / Big Boo / Big Boo with 3 Boos / Boo
DATA_038684:         dl $0CF1D5    ; Train Bandit
DATA_038687:         dl $0CF005    ; (BG3) Balloon Pumper with red balloon
DATA_03868A:         dl $04CCD3    ; Spike
DATA_03868D:         dl $04CE70    ; Spiked ball
DATA_038690:         dl $0DAF7E    ; Piro Dangle, clockwise
DATA_038693:         dl $0DAF7E    ; Piro Dangle, anticlockwise
DATA_038696:         dl $05D246    ; Biting Bullet Bill Blaster
DATA_038699:         dl $05D246    ; Bouncing Bullet Bill Blaster
DATA_03869C:         dl $05D246    ; Bullet Bill Blaster
DATA_03869F:         dl $05D665    ; Biting Bullet Bill
DATA_0386A2:         dl $05D8E6    ; Bouncing Bullet Bill
DATA_0386A5:         dl $05D6ED    ; Bullet Bill
DATA_0386A8:         dl $0295D3    ; Dent of castella
DATA_0386AB:         dl $04ACD3    ; Log seesaw
DATA_0386AE:         dl $058CDA    ; Lava Bubble
DATA_0386B1:         dl $058CDA    ; Lava Bubble, jumps across
DATA_0386B4:         dl $0591DA    ; Chain Chomp
DATA_0386B7:         dl $04DB2B    ; Cloud
DATA_0386BA:         dl $02A518    ; Teleport sprite
DATA_0386BD:         dl $01AAEC    ; Harry Hedgehog
DATA_0386C0:         dl $05FFC4    ; [CRASH]
DATA_0386C3:         dl $0F90C0    ; Red Egg, gives 1-up
DATA_0386C6:         dl $0298F4    ; Super Star
DATA_0386C9:         dl $04A6F8    ; Red Flatbed Ferry, moving horizontally
DATA_0386CC:         dl $04A752    ; Pink Flatbed Ferry, moving vertically
DATA_0386CF:         dl $03E925    ; Mock Up, green / red
DATA_0386D2:         dl $02AC86    ; Yoshi, at the Goal
DATA_0386D5:         dl $03ED20    ; Fly Guy, 5 stars / red coin / 1-up / 1-up
DATA_0386D8:         dl $0DEB70    ; Kamek, at Bowser's room
DATA_0386DB:         dl $059775    ; Swing of Grinders
DATA_0386DE:         dl $06D1C7    ; (BG3) Dangling Ghost
DATA_0386E1:         dl $04D5FC    ; 4 Toadies
DATA_0386E4:         dl $05F981    ; Melon Bug
DATA_0386E7:         dl $02A330    ; Door
DATA_0386EA:         dl $059B4E    ; Expansion Block
DATA_0386ED:         dl $059DBC    ; Blue checkered block
DATA_0386F0:         dl $059DBC    ; Red checkered block
DATA_0386F3:         dl $05F5D2    ; POW
DATA_0386F6:         dl $05B75A    ; Yoshi Block
DATA_0386F9:         dl $0EB1B3    ; Spiny Egg
DATA_0386FC:         dl $0E81D1    ; Chained green Flatbed Ferry
DATA_0386FF:         dl $04D20C    ; Mace Guy
DATA_038702:         dl $04D2B1    ; Mace
DATA_038705:         dl $0EB601    ; !-switch
DATA_038708:         dl $0EBED5    ; Chomp Rock
DATA_03870B:         dl $05A8B3    ; Wild Ptooie Piranha, spits 1 / 3 Needlenose
DATA_03870E:         dl $0CC91D    ; Tulip
DATA_038711:         dl $049CE5    ; Pot of Potted Spiked Fun Guy
DATA_038714:         dl $0EB1BE    ; Fireball of Thunder Lakitu
DATA_038717:         dl $0EC9AD    ; Bandit, getting under cover, left
DATA_03871A:         dl $0EC9AD    ; Bandit, getting under cover, right
DATA_03871D:         dl $02BF91    ; Nep-Enut / Gargantua Blargg
DATA_038720:         dl $0E8456    ; Incoming Chomp
DATA_038723:         dl $0E8BE4    ; Flcok of Incoming Chomps
DATA_038726:         dl $0E8456    ; Falling Incoming Chomp
DATA_038729:         dl $0E8E08    ; Shadow of falling Incoming Chomp
DATA_03872C:         dl $00872A    ; Shy Guy in background
DATA_03872F:         dl $029A58    ; Fill Eggs
DATA_038732:         dl $0DFBC2    ; Sign Arrow and Shadow
DATA_038735:         dl $05DAC3    ; Hint Block
DATA_038738:         dl $018A14    ; Hookbill the Koopa
DATA_03873B:         dl $03C2BF    ; Morph Bubble, Car
DATA_03873E:         dl $03C2BF    ; Morph Bubble, Mole Tank
DATA_038741:         dl $03C2BF    ; Morph Bubble, Helicopter
DATA_038744:         dl $03C2BF    ; Morph Bubble, Train
DATA_038747:         dl $039F4E    ; Wind of Fuzzy
DATA_03874A:         dl $03C2BF    ; Morph Bubble, Submarine
DATA_03874D:         dl $03C08C    ; Hidden Winged Cloud, 1-up / 5 stars / !-switch / 5 stars
DATA_038750:         dl $03C2BF    ; Winged Cloud, 8 coins
DATA_038753:         dl $03C2BF    ; Winged Cloud, bubbled 1-up
DATA_038756:         dl $03C2BF    ; Winged Cloud, flower
DATA_038759:         dl $03C2BF    ; Winged Cloud, POW
DATA_03875C:         dl $03C2BF    ; Winged Cloud, stairs, right / left
DATA_03875F:         dl $03C2BF    ; Winged Cloud, platform, right / left
DATA_038762:         dl $03C2BF    ; Winged Cloud, Bandit
DATA_038765:         dl $03C2BF    ; Winged Cloud, coin (object)
DATA_038768:         dl $03C2BF    ; Winged Cloud, 1-up
DATA_03876B:         dl $03C2BF    ; Winged Cloud, key
DATA_03876E:         dl $03C2BF    ; Winged Cloud, 3 stars
DATA_038771:         dl $03C2BF    ; Winged Cloud, 5 stars
DATA_038774:         dl $03C2BF    ; Winged Cloud, door
DATA_038777:         dl $03C2BF    ; Winged Cloud, ground eater
DATA_03877A:         dl $03C2BF    ; Winged Cloud, watermelon
DATA_03877D:         dl $03C2BF    ; Winged Cloud, fire watermelon
DATA_038780:         dl $03C2BF    ; Winged Cloud, icy watermelon
DATA_038783:         dl $03C2BF    ; Winged Cloud, seed of sunflower with 3 leaves
DATA_038786:         dl $03C2BF    ; Winged Cloud, seed of sunflower with 6 leaves
DATA_038789:         dl $03C2BF    ; Winged Cloud, [CRASH]
DATA_03878C:         dl $02A330    ; Boss Door of Bowser's room
DATA_03878F:         dl $03C2BF    ; Winged Cloud, random item.
DATA_038792:         dl $03C2BF    ; Winged Cloud, !-switch / !-switch
DATA_038795:         dl $07F2F1    ; Baron Von Zeppelin, Giant Egg
DATA_038798:         dl $0DFB1D    ; Bowser's flame
DATA_03879B:         dl $0DF6FE    ; Bowser's quake
DATA_03879E:         dl $02D95C    ; Horizontal entrance, towards right
DATA_0387A1:         dl $02D8DE    ; Hidden entrance, revealed by an ! switch
DATA_0387A4:         dl $06AA8B    ; Marching Milde
DATA_0387A7:         dl $0F933F    ; Giant Milde
DATA_0387AA:         dl $0F98BD    ; Large Milde
DATA_0387AD:         dl $029B45    ; Moutain backgrounds at fight with Hookbill the Koopa
DATA_0387B0:         dl $06E530    ; (BG3) Ghost with Flatbed Ferry on its head
DATA_0387B3:         dl $02D195    ; Sluggy the Unshaven
DATA_0387B6:         dl $029C87    ; Chomp signboard.
DATA_0387B9:         dl $0EF86F    ; Fishin' Lakitu
DATA_0387BC:         dl $0DBB80    ; Flower pot, key / 6 stars / 6 coins / nothing
DATA_0387BF:         dl $06E961    ; (BG3) Soft thing
DATA_0387C2:         dl $0EC8F2    ; Snowball
DATA_0387C5:         dl $01A2D5    ; Closer, in Naval Piranha's room
DATA_0387C8:         dl $029CEB    ; Falling Rock
DATA_0387CB:         dl $0CCE83    ; Piscatory Pete, Blue / Gold
DATA_0387CE:         dl $0CD093    ; Preying Mantas
DATA_0387D1:         dl $0CD154    ; Loch Nestor
DATA_0387D4:         dl $0E8F79    ; Boo Blah, normal / upside down
DATA_0387D7:         dl $0E8F79    ; Boo Blah with Piro Dangle, normal / upside down
DATA_0387DA:         dl $05E13D    ; Heading cactus
DATA_0387DD:         dl $0EB1B3    ; Green Needlenose
DATA_0387E0:         dl $01AD17    ; Gusty, left / right / infinite right / infinite left
DATA_0387E3:         dl $05ACAE    ; Burt, two / one
DATA_0387E6:         dl $0E951E    ; Goonie, right / towards Yoshi / generator right / generator left
DATA_0387E9:         dl $0E951E    ; 3 Flightless Goonies
DATA_0387EC:         dl $06BA33    ; Cloud Drop, moving vertically
DATA_0387EF:         dl $06BBD3    ; Cloud Drop, moving horizontally
DATA_0387F2:         dl $05BEB2    ; Flamer Guy, jumping around
DATA_0387F5:         dl $05BEB2    ; Flamer Guy, walking around
DATA_0387F8:         dl $05B9C8    ; Eggo-Dil
DATA_0387FB:         dl $05B9FC    ; Eggo-Dil's face
DATA_0387FE:         dl $05BE03    ; Petal of Eggo-Dil
DATA_038801:         dl $078020    ; Bubble-Plant
DATA_038804:         dl $07858F    ; Stilt Guy, green / red / yellow / purple
DATA_038807:         dl $0CFC37    ; Woozy Guy, green / red / yellow / purple
DATA_03880A:         dl $0780F3    ; Egg-Plant / Needlenose-Plant
DATA_03880D:         dl $0788D3    ; Slugger
DATA_038810:         dl $0EA4F5    ; Parent and children of Huffin' Puffins
DATA_038813:         dl $0EA140    ; Barney Bubble
DATA_038816:         dl $0EAAF0    ; Blow Hard
DATA_038819:         dl $0EB1B3    ; Yellow Needlenose
DATA_03881C:         dl $0EB3AC    ; Flower
DATA_03881F:         dl $079090    ; Spear Guy, long spear
DATA_038822:         dl $079090    ; Spear Guy, short spear
DATA_038825:         dl $07CEB0    ; Zeus Guy
DATA_038828:         dl $07D8F3    ; Energy of Zeus Guy
DATA_03882B:         dl $079635    ; Poochy
DATA_03882E:         dl $04C89B    ; Bubbled 1-up
DATA_038831:         dl $0D8031    ; Spiky mace
DATA_038834:         dl $0D8031    ; Spiky mace, double-ended
DATA_038837:         dl $04DAF6    ; Boo Guys spinning spiky mace
DATA_03883A:         dl $0CB6AC    ; Jean de Fillet, right / left
DATA_03883D:         dl $0D84AB    ; Boo Guys, carrying bombs towards left.
DATA_038840:         dl $0D84AB    ; Boo Guys, carrying bombs towards right
DATA_038843:         dl $01AE19    ; Seed of watermelon
DATA_038846:         dl $04CFF9    ; Milde
DATA_038849:         dl $0DC1A5    ; Tap-Tap
DATA_03884C:         dl $0DC1A5    ; Tap-Tap, stays on ledges
DATA_03884F:         dl $0DC1A5    ; Hopping Tap-Tap
DATA_038852:         dl $0D8AF1    ; Chained spike ball, controlled by Boo Guy
DATA_038855:         dl $01AE95    ; Boo Guy, rotating a pulley, right / left
DATA_038858:         dl $0D8EBE    ; Crate, 6 stars
DATA_03885B:         dl $05DCBE    ; Boo Man Bluff
DATA_03885E:         dl $0EB55F    ; Flower
DATA_038861:         dl $01A5EC    ; Georgette Jelly
DATA_038864:         dl $01AA9E    ; Splashed Georgette Jelly
DATA_038867:         dl $079410    ; Snifit
DATA_03886A:         dl $07959B    ; Bullet, shot by Snifit
DATA_03886D:         dl $04C97B    ; Coin, gravity affected
DATA_038870:         dl $04AFC0    ; Floating round platform on water
DATA_038873:         dl $04CB7C    ; Donut Lift
DATA_038876:         dl $04CB7C    ; Giant Donut Lift
DATA_038879:         dl $05EA2B    ; Spooky
DATA_03887C:         dl $079FDC    ; Green Glove
DATA_03887F:         dl $07A702    ; Lakitu, one / two
DATA_038882:         dl $0DBD50    ; Lakitu's cloud
DATA_038885:         dl $0EB1B3    ; Spiny Egg
DATA_038888:         dl $05F09F    ; Brown Arrow Wheel
DATA_03888B:         dl $05F09F    ; Blue Arrow Wheel
DATA_03888E:         dl $05F436    ; Double-ended arrow lift
DATA_038891:         dl $04CC45    ; Explosion of Number Platform
DATA_038894:         dl $05C4AD    ; ? bucket, Bandit
DATA_038897:         dl $05C4AD    ; ? bucket, 5 coins
DATA_03889A:         dl $049147    ; Stretch, green / red / yellow / purple
DATA_03889D:         dl $03E409    ; Kamek, for the ending scene / flying and chases
DATA_0388A0:         dl $0D94F5    ; Spiked log held by chain and pulley
DATA_0388A3:         dl $0D9771    ; ? Pulley
DATA_0388A6:         dl $0DF038    ; Ground shake
DATA_0388A9:         dl $03F5B7    ; Fuzzy
DATA_0388AC:         dl $048A58    ; Shy Guy, with Bandit hidden
DATA_0388AF:         dl $07AE68    ; Fat Guy, red / green
DATA_0388B2:         dl $0CF42B    ; Fly Guy carrying red coin / Whirly Fly Guy
DATA_0388B5:         dl $0CFA6E    ; Yoshi, in the intro scene
DATA_0388B8:         dl $06B950    ; unknown
DATA_0388BB:         dl $07AB9C    ; Lava Drop, moving horizontally
DATA_0388BE:         dl $07ACD2    ; Lava Drop, moving vertically
DATA_0388C1:         dl $02A330    ; Locked door
DATA_0388C4:         dl $069401    ; Lemon Drop
DATA_0388C7:         dl $048A58    ; Lantern Ghost
DATA_0388CA:         dl $0DC55B    ; Baby Bowser
DATA_0388CD:         dl $0D9879    ; Raven, always circling, anticlockwise / clockwise
DATA_0388D0:         dl $0D9879    ; Raven, anticlockwise / clockwise initially
DATA_0388D3:         dl $029E8F    ; 3x6 Falling Rock
DATA_0388D6:         dl $029E8F    ; 3x3 Falling Rock
DATA_0388D9:         dl $029E8F    ; 3x9 Falling Rock
DATA_0388DC:         dl $029E8F    ; 6x3 Falling Rock
DATA_0388DF:         dl $02D040    ; Stomach Acid
DATA_0388E2:         dl $0D9A25    ; Flipper, downwards
DATA_0388E5:         dl $07B059    ; Fang, dangling
DATA_0388E8:         dl $07B1FC    ; Fang, flying wavily
DATA_0388EB:         dl $07B2F3    ; Flopsy Fish, swimming around
DATA_0388EE:         dl $07B310    ; Flopsy Fish, swimming and occasionally jumps vertically
DATA_0388F1:         dl $05F74E    ; Flopsy Fish, swimming and jumps in an arc
DATA_0388F4:         dl $05F74E    ; Flopsy Fish, jumps 3 times in an arc, right / left
DATA_0388F7:         dl $07BEFC    ; Spray Fish
DATA_0388FA:         dl $0D9D49    ; Flipper, rightwards / leftwards
DATA_0388FD:         dl $07B6DC    ; Blue Sluggy, falling down / crawing ceiling
DATA_038900:         dl $07B6DC    ; Pink Sluggy, falling down / crawing ceiling but doesn't move
DATA_038903:         dl $02D95C    ; Horizontal entrance, towards left
DATA_038906:         dl $058325    ; Large Spring Ball
DATA_038909:         dl $07BA31    ; Arrow cloud, up
DATA_03890C:         dl $07BA31    ; Arrow cloud, up right
DATA_03890F:         dl $07BA31    ; Arrow cloud, right
DATA_038912:         dl $07BA31    ; Arrow cloud, down right
DATA_038915:         dl $07BA31    ; Arrow cloud, down
DATA_038918:         dl $07BA31    ; Arrow cloud, down left
DATA_03891B:         dl $07BA31    ; Arrow cloud, left
DATA_03891E:         dl $07BA31    ; Arrow cloud, up left
DATA_038921:         dl $07BA3D    ; Arrow cloud, rotating
DATA_038924:         dl $07BB61    ; Flutter
DATA_038927:         dl $0E951E    ; Goonie with Shy Guy
DATA_03892A:         dl $0DA0FE    ; Shark Chomp
DATA_03892D:         dl $0E9B38    ; Very Fat Goonie
DATA_038930:         dl $0EB92E    ; Cactus Jack, one / three
DATA_038933:         dl $07C344    ; Wall Lakitu
DATA_038936:         dl $0E9B38    ; Bowling Goonie
DATA_038939:         dl $07C6EC    ; Grunt, walking
DATA_03893C:         dl $07C700    ; Grunt, running
DATA_03893F:         dl $07C9C8    ; Dancing Spear Guy
DATA_038942:         dl $0DA527    ; Green switch for green spiked platform
DATA_038945:         dl $0DA527    ; Red switch for red spiked platform
DATA_038948:         dl $04C2F6    ; Pink Pinwheel with Shy Guys, clockwise / anticlockwise
DATA_03894B:         dl $0DA5BA    ; Green spiked platform
DATA_03894E:         dl $0DA5BA    ; Red spiked platform
DATA_038951:         dl $0F92A1    ; Bonus Item, red coin / key / flower / door
DATA_038954:         dl $0DA8F1    ; Two spiked platforms with one switch in the center
DATA_038957:         dl $0F9116    ; Bouncing green Needlenose
DATA_03895A:         dl $0F8BA9    ; Nipper Plant
DATA_03895D:         dl $0F8B8D    ; Nipper Spore
DATA_038960:         dl $07EBAE    ; Thunder Lakitu, one / two
DATA_038963:         dl $07D964    ; Green Koopa shell
DATA_038966:         dl $07D964    ; Red Koopa shell
DATA_038969:         dl $07DDA1    ; Green Beach Koopa
DATA_03896C:         dl $07DDA1    ; Red Beach Koopa
DATA_03896F:         dl $07DDD9    ; Green Koopa
DATA_038972:         dl $07DDD9    ; Red Koopa
DATA_038975:         dl $07E55A    ; Green Para Koopa, jumping forth.
DATA_038978:         dl $07E5D9    ; Red Para Koopa, flying horizontally
DATA_03897B:         dl $07E64F    ; Red Para Koopa, flying vertically
DATA_03897E:         dl $07E7D6    ; Aqua Lakitu
DATA_038981:         dl $02E57F    ; Naval Piranha
DATA_038984:         dl $02F3A4    ; Naval Bud
DATA_038987:         dl $07F2B2    ; Baron Von Zeppelin, red Suy Guy
DATA_03898A:         dl $07F2B2    ; Baron Von Zeppelin, Needlenose
DATA_03898D:         dl $07F2B2    ; Baron Von Zeppelin, bomb
DATA_038990:         dl $07F2B2    ; Baron Von Zeppelin, Bandit
DATA_038993:         dl $07F2D1    ; Baron Von Zeppelin, large Spring Ball
DATA_038996:         dl $07F333    ; Baron Von Zeppelin, 1-up
DATA_038999:         dl $07F333    ; Baron Von Zeppelin, key
DATA_03899C:         dl $07F333    ; Baron Von Zeppelin, 5 coins
DATA_03899F:         dl $07F2F1    ; Baron Von Zeppelin, watermelon
DATA_0389A2:         dl $07F2F1    ; Baron Von Zeppelin, fire watermelon
DATA_0389A5:         dl $07F310    ; Baron Von Zeppelin, icy watermelon
DATA_0389A8:         dl $07F391    ; Baron Von Zeppelin, crate, 6 stars.
DATA_0389AB:         dl $07FB3D    ; Baron Von Zeppelin
DATA_0389AE:         dl $0DBA26    ; Spinning Log
DATA_0389B1:         dl $0F839E    ; Crazee Dayzee
DATA_0389B4:         dl $0F8A17    ; Dragonfly
DATA_0389B7:         dl $0F8AE9    ; Butterfly
DATA_0389BA:         dl $0C930E    ; Bumpty
DATA_0389BD:         dl $04A8B8    ; Active line guided green Flatbed Ferry, left
DATA_0389C0:         dl $04A8B8    ; Active line guided green Flatbed Ferry, right
DATA_0389C3:         dl $04A8B8    ; Active line guided yellow Flatbed Ferry, left
DATA_0389C6:         dl $04A8B8    ; Active line guided yellow Flatbed Ferry, right
DATA_0389C9:         dl $04A8B8    ; Line guided green Flatbed Ferry, left
DATA_0389CC:         dl $04A8B8    ; Line guided green Flatbed Ferry, right
DATA_0389CF:         dl $04A8B8    ; Line guided yellow Flatbed Ferry, left
DATA_0389D2:         dl $04A8B8    ; Line guided yellow Flatbed Ferry, right
DATA_0389D5:         dl $04A8B8    ; Line guided red Flatbed Ferry, left
DATA_0389D8:         dl $04A8B8    ; Line guided red Flatbed Ferry, right
DATA_0389DB:         dl $04AA32    ; Whirling lift
DATA_0389DE:         dl $0C8016    ; Falling icicle
DATA_0389E1:         dl $0F8F64    ; Sparrow
DATA_0389E4:         dl $049490    ; Mufti Guy, green / red / yellow / purple
DATA_0389E7:         dl $06D9CD    ; Caged Ghost, squeezing in sewer
DATA_0389EA:         dl $0C9080    ; Blargg
DATA_0389ED:         dl $0C86BD    ; unknown
DATA_0389F0:         dl $0C87D1    ; Unbalanced snowy platform
DATA_0389F3:         dl $0F89E4    ; Arrow sign, up / right / left / down
DATA_0389F6:         dl $0F89E4    ; Diagonal arrow sign, up left / up right / down left / down right
DATA_0389F9:         dl $0C890B    ; Dizzy Dandy
DATA_0389FC:         dl $0C8BAF    ; Boo Guy
DATA_0389FF:         dl $0C971D    ; Bumpty, tackles at Yoshi
DATA_038A02:         dl $0C9A13    ; Flying Bumpty, flying aronnd / flying straightly
DATA_038A05:         dl $0C9B8A    ; Skeleton Goonie
DATA_038A08:         dl $0C9CFD    ; Flightless Skeleton Goonie
DATA_038A0B:         dl $0C9DF4    ; Skeleton Goonie with a bomb
DATA_038A0E:         dl $0CA03C    ; Firebar, double-ended, clockwise / anticlockwise
DATA_038A11:         dl $0CA03C    ; Firebar, clockwise / anticlockwise
DATA_038A14:         dl $0CB537    ; Star
DATA_038A17:         dl $0CB36A    ; Little Skull Mouser
DATA_038A1A:         dl $07FDE4    ; Cork, seals 3D pipe
DATA_038A1D:         dl $02AF11    ; Grinder, runs away
DATA_038A20:         dl $02AF11    ; Grinder, spits seeds of watermelon
DATA_038A23:         dl $02AF11    ; Short Fuse / Seedy Sally, right / left
DATA_038A26:         dl $02AF11    ; Grinder, grasps Baby Mario
DATA_038A29:         dl $02AF11    ; Grinder, climbing, spits seeds of watermelon
DATA_038A2C:         dl $0CBA2C    ; Hot Lips
DATA_038A2F:         dl $0CBED6    ; Boo Balloon, coin / !-switch
DATA_038A32:         dl $0F918C    ; Frog
DATA_038A35:         dl $0CC39B    ; Kamek, shoots magic at Yoshi.
DATA_038A38:         dl $0CC797    ; Kamek's magic
DATA_038A3B:         dl $0CE98B    ; Coin
DATA_038A3E:         dl $0CEBBA    ; (BG3) Balloon
DATA_038A41:         dl $11B125    ; Coin Cannon for Mini Battle
DATA_038A44:         dl $11B24D    ; Coin for Mini Battle
DATA_038A47:         dl $11B32A    ; Bandit for Mini Battle
DATA_038A4A:         dl $11A111    ; Checkered Platform for Mini Battle
DATA_038A4D:         dl $11A790    ; Bandit for Mini Battle
DATA_038A50:         dl $11A175    ; Red Balloon for Mini Battle
DATA_038A53:         dl $11BB10    ; Bandit for Mini Battle
DATA_038A56:         dl $11C460    ; Watermelon Pot for Mini Battle
DATA_038A59:         dl $11C679    ; possibly Bandit for Mini Battle
; end main table

; sprite head_bops routine table: $8A5C - $8F89
head_bops:
DATA_038A5C:         dl $039A6B    ; Log, floating on water / lava
DATA_038A5F:         dl $039A6B    ; Closed door
DATA_038A62:         dl $039A6B    ; Naval Piranha's stalk
DATA_038A65:         dl $039A6B    ; Crate, key
DATA_038A68:         dl $039A6B    ; Item from Star Mario block
DATA_038A6B:         dl $039F9F    ; Icy watermelon
DATA_038A6E:         dl $039A6B    ; Chill
DATA_038A71:         dl $039F9F    ; Watermelon
DATA_038A74:         dl $039A6B    ; Rubble
DATA_038A77:         dl $039F9F    ; Fire watermelon
DATA_038A7A:         dl $039A6B    ; Kaboomba
DATA_038A7D:         dl $039A6B    ; Cannonball of Kaboomba
DATA_038A80:         dl $039A6B    ; Raphael the Raven
DATA_038A83:         dl $039A6B    ; Goal
DATA_038A86:         dl $039A6B    ; G O A L !
DATA_038A89:         dl $039A6B    ; BONUS CHALLENGE
DATA_038A8C:         dl $039A6B    ; Caged Ghost, round mound
DATA_038A8F:         dl $039A6B    ; Item Card
DATA_038A92:         dl $039A6B    ; Boss Door
DATA_038A95:         dl $039A6B    ; Boss Explosion
DATA_038A98:         dl $039A6B    ; Key from defeated boss
DATA_038A9B:         dl $039A6B    ; Torpedo of Yoshi Submarine
DATA_038A9E:         dl $039A6B    ; Bigger Boo
DATA_038AA1:         dl $0EF7CE    ; Frog Pirate
DATA_038AA4:         dl $039A6B    ; Flame of Red Watermelon
DATA_038AA7:         dl $039A6B    ; Bubble
DATA_038AAA:         dl $039A6B    ; Ski lift
DATA_038AAD:         dl $039A6B    ; Vertical log, floating on lava
DATA_038AB0:         dl $039A6B    ; Dr. Freezegood, nothing / 6 stars / 1-up / Bumpty
DATA_038AB3:         dl $039A6B    ; Dr. Freezegood, with ski lift
DATA_038AB6:         dl $049087    ; Shy Guy, green / red / yellow / purple
DATA_038AB9:         dl $039A6B    ; Rotating Doors
DATA_038ABC:         dl $0ED83D    ; Bandit
DATA_038ABF:         dl $039A6B    ; ? bucket
DATA_038AC2:         dl $039F9B    ; Flashing Egg
DATA_038AC5:         dl $039F9F    ; Red Egg
DATA_038AC8:         dl $039F9F    ; Yellow Egg
DATA_038ACB:         dl $039F9F    ; Green Egg
DATA_038ACE:         dl $039A6B    ; Giant Egg, for battle with Bowser
DATA_038AD1:         dl $039F9F    ; Key
DATA_038AD4:         dl $039F9F    ; Huffin' Puffin, running away
DATA_038AD7:         dl $039F9F    ; Giant Egg, for battle with Prince Froggy?
DATA_038ADA:         dl $039F9F    ; Red Giant Egg
DATA_038ADD:         dl $039F9F    ; Green Giant Egg
DATA_038AE0:         dl $039A6B    ; Lunge Fish
DATA_038AE3:         dl $039A6B    ; Salvo the Slime
DATA_038AE6:         dl $039A6B    ; Salvo the Slime's eyes
DATA_038AE9:         dl $039A6B    ; Little Mouser's Nest
DATA_038AEC:         dl $039F9F    ; Little Mouser
DATA_038AEF:         dl $039A6B    ; Potted Spiked Fun Guy
DATA_038AF2:         dl $039A6B    ; Little Mouser, looking around, in nest / behind stuff
DATA_038AF5:         dl $039F9F    ; Little Mouser, from nest
DATA_038AF8:         dl $039A6B    ; Rogger the Potted Ghost
DATA_038AFB:         dl $039A6B    ; Falling down Rogger the Potted Ghost?
DATA_038AFE:         dl $039A6B    ; (BG3) Falling down wall
DATA_038B01:         dl $039A6B    ; Grim Leecher
DATA_038B04:         dl $039A6B    ; Flame spat by Rogger the Potted Ghost
DATA_038B07:         dl $039A6B    ; (BG3) Spinning wooden platform
DATA_038B0A:         dl $039A6B    ; 3 Mini-Ravens
DATA_038B0D:         dl $039A6B    ; Mini-Raven
DATA_038B10:         dl $039A6B    ; Tap-Tap the Red Nose
DATA_038B13:         dl $039A6B    ; (BG3) Seesaw
DATA_038B16:         dl $039A6B    ; Skinny platform
DATA_038B19:         dl $039A6B    ; Slime
DATA_038B1C:         dl $039A6B    ; Baby Luigi
DATA_038B1F:         dl $039A6B    ; Stork
DATA_038B22:         dl $039A6B    ; Vertical pipe entrance
DATA_038B25:         dl $039F9F    ; Red Giant Shy Guy
DATA_038B28:         dl $039F9F    ; Green Giant Shy Guy
DATA_038B2B:         dl $039A6B    ; Prince Froggy, throat / before fight / throat with uvula / after fight
DATA_038B2E:         dl $039A6B    ; Burt the Bushful
DATA_038B31:         dl $039A6B    ; Shy Guy for Rogger the Potted Ghost
DATA_038B34:         dl $039A6B    ; Kamek, for scenes before boss fights
DATA_038B37:         dl $039A6B    ; The head of fire of the Thunder Lakitu
DATA_038B3A:         dl $039A6B    ; Fire of Thunder Lakitu
DATA_038B3D:         dl $039A6B    ; Hypocenter of the thunder.
DATA_038B40:         dl $039A6B    ; Upside down Blow Hard
DATA_038B43:         dl $039A6B    ; unknown
DATA_038B46:         dl $039A6B    ; Locked door
DATA_038B49:         dl $039A6B    ; Middle ring
DATA_038B4C:         dl $039A6B    ; (BG3) Board
DATA_038B4F:         dl $039A6B    ; (BG3) Large log
DATA_038B52:         dl $039A6B    ; Balloon
DATA_038B55:         dl $039A6B    ; Kamek, says \OH MY!!!\""
DATA_038B58:         dl $039A6B    ; Upside down Wild Piranha
DATA_038B5B:         dl $039A6B    ; Green Pinwheel
DATA_038B5E:         dl $039A6B    ; Pink Pinwheel
DATA_038B61:         dl $039A6B    ; (BG3) Sewer ghost with Flatbed Ferry on its head
DATA_038B64:         dl $039F9F    ; Green Solo Toady
DATA_038B67:         dl $039A6B    ; Continuous Super Star
DATA_038B6A:         dl $039A6B    ; Spark of Raphael the Raven.
DATA_038B6D:         dl $0ED83D    ; Coin Bandit
DATA_038B70:         dl $039F9F    ; Pink Toadie
DATA_038B73:         dl $039A6B    ; [CRASH]
DATA_038B76:         dl $039A6B    ; (BG3) Plank
DATA_038B79:         dl $039A6B    ; (BG3) Plank
DATA_038B7C:         dl $039A6B    ; Bomb
DATA_038B7F:         dl $039A6B    ; Baby Mario
DATA_038B82:         dl $0C858D    ; Goomba
DATA_038B85:         dl $039A6B    ; Muddy Buddy
DATA_038B88:         dl $039A6B    ; Pink Pinwheel, (X: direction) (Y: size)
DATA_038B8B:         dl $039A6B    ; Red coin
DATA_038B8E:         dl $039A6B    ; Wild Piranha
DATA_038B91:         dl $039A6B    ; Hidden Winged Cloud, stars / seed / flower / 1-up
DATA_038B94:         dl $039A6B    ; Flashing Egg Block
DATA_038B97:         dl $039A6B    ; Red Egg Block
DATA_038B9A:         dl $039A6B    ; Yellow Egg Block
DATA_038B9D:         dl $039A6B    ; Hit green Egg Block
DATA_038BA0:         dl $039A6B    ; Large Spring Ball
DATA_038BA3:         dl $039A6B    ; Hootie the Blue Fish, clockwise
DATA_038BA6:         dl $039A6B    ; Hootie the Blue Fish, anticlockwise
DATA_038BA9:         dl $039A6B    ; Spring Ball
DATA_038BAC:         dl $039A6B    ; Clawdaddy
DATA_038BAF:         dl $039A6B    ; Big Boo with 3 Boos / Big Boo / Big Boo with 3 Boos / Boo
DATA_038BB2:         dl $039A6B    ; Train Bandit
DATA_038BB5:         dl $039A6B    ; (BG3) Balloon Pumper with red balloon
DATA_038BB8:         dl $039A6B    ; Spike
DATA_038BBB:         dl $039A6B    ; Spiked ball
DATA_038BBE:         dl $039A6B    ; Piro Dangle, clockwise
DATA_038BC1:         dl $039A6B    ; Piro Dangle, anticlockwise
DATA_038BC4:         dl $039A6B    ; Biting Bullet Bill Blaster
DATA_038BC7:         dl $039A6B    ; Bouncing Bullet Bill Blaster
DATA_038BCA:         dl $039A6B    ; Bullet Bill Blaster
DATA_038BCD:         dl $05D8B6    ; Biting Bullet Bill
DATA_038BD0:         dl $05D8B6    ; Bouncing Bullet Bill
DATA_038BD3:         dl $05D8D6    ; Bullet Bill
DATA_038BD6:         dl $039A6B    ; Dent of castella
DATA_038BD9:         dl $039A6B    ; Log seesaw
DATA_038BDC:         dl $039A6B    ; Lava Bubble
DATA_038BDF:         dl $039A6B    ; Lava Bubble, jumps across
DATA_038BE2:         dl $039A6B    ; Chain Chomp
DATA_038BE5:         dl $039A6B    ; Cloud
DATA_038BE8:         dl $039A6B    ; Teleport sprite
DATA_038BEB:         dl $039A6B    ; Harry Hedgehog
DATA_038BEE:         dl $039A6B    ; [CRASH]
DATA_038BF1:         dl $039A6B    ; Red Egg, gives 1-up
DATA_038BF4:         dl $039A6B    ; Super Star
DATA_038BF7:         dl $039A6B    ; Red Flatbed Ferry, moving horizontally
DATA_038BFA:         dl $039A6B    ; Pink Flatbed Ferry, moving vertically
DATA_038BFD:         dl $039A6B    ; Mock Up, green / red
DATA_038C00:         dl $039A6B    ; Yoshi, at the Goal
DATA_038C03:         dl $039A6B    ; Fly Guy, 5 stars / red coin / 1-up / 1-up
DATA_038C06:         dl $039A6B    ; Kamek, at Bowser's room
DATA_038C09:         dl $039A6B    ; Swing of Grinders
DATA_038C0C:         dl $039A6B    ; (BG3) Dangling Ghost
DATA_038C0F:         dl $039FED    ; 4 Toadies
DATA_038C12:         dl $039A6B    ; Melon Bug
DATA_038C15:         dl $039A6B    ; Door
DATA_038C18:         dl $039A6B    ; Expansion Block
DATA_038C1B:         dl $039A6B    ; Blue checkered block
DATA_038C1E:         dl $039A6B    ; Red checkered block
DATA_038C21:         dl $039A6B    ; POW
DATA_038C24:         dl $039A6B    ; Yoshi Block
DATA_038C27:         dl $039A6B    ; Spiny Egg
DATA_038C2A:         dl $039A6B    ; Chained green Flatbed Ferry
DATA_038C2D:         dl $039A6B    ; Mace Guy
DATA_038C30:         dl $039A6B    ; Mace
DATA_038C33:         dl $039A6B    ; !-switch
DATA_038C36:         dl $039A6B    ; Chomp Rock
DATA_038C39:         dl $039A6B    ; Wild Ptooie Piranha, spits 1 / 3 Needlenose
DATA_038C3C:         dl $039A6B    ; Tulip
DATA_038C3F:         dl $039A6B    ; Pot of Potted Spiked Fun Guy
DATA_038C42:         dl $039A6B    ; Fireball of Thunder Lakitu
DATA_038C45:         dl $0ED83D    ; Bandit, getting under cover, left
DATA_038C48:         dl $0ED83D    ; Bandit, getting under cover, right
DATA_038C4B:         dl $039A6B    ; Nep-Enut / Gargantua Blargg
DATA_038C4E:         dl $039A6B    ; Incoming Chomp
DATA_038C51:         dl $039A6B    ; Flcok of Incoming Chomps
DATA_038C54:         dl $039A6B    ; Falling Incoming Chomp
DATA_038C57:         dl $039A6B    ; Shadow of falling Incoming Chomp
DATA_038C5A:         dl $039A6B    ; Shy Guy in background
DATA_038C5D:         dl $039A6B    ; Fill Eggs
DATA_038C60:         dl $039A6B    ; Sign Arrow and Shadow
DATA_038C63:         dl $039A6B    ; Hint Block
DATA_038C66:         dl $039A6B    ; Hookbill the Koopa
DATA_038C69:         dl $039A6B    ; Morph Bubble, Car
DATA_038C6C:         dl $039A6B    ; Morph Bubble, Mole Tank
DATA_038C6F:         dl $039A6B    ; Morph Bubble, Helicopter
DATA_038C72:         dl $039A6B    ; Morph Bubble, Train
DATA_038C75:         dl $039A6B    ; Wind of Fuzzy
DATA_038C78:         dl $039A6B    ; Morph Bubble, Submarine
DATA_038C7B:         dl $039A6B    ; Hidden Winged Cloud, 1-up / 5 stars / !-switch / 5 stars
DATA_038C7E:         dl $039A6B    ; Winged Cloud, 8 coins
DATA_038C81:         dl $039A6B    ; Winged Cloud, bubbled 1-up
DATA_038C84:         dl $039A6B    ; Winged Cloud, flower
DATA_038C87:         dl $039A6B    ; Winged Cloud, POW
DATA_038C8A:         dl $039A6B    ; Winged Cloud, stairs, right / left
DATA_038C8D:         dl $039A6B    ; Winged Cloud, platform, right / left
DATA_038C90:         dl $039A6B    ; Winged Cloud, Bandit
DATA_038C93:         dl $039A6B    ; Winged Cloud, coin (object)
DATA_038C96:         dl $039A6B    ; Winged Cloud, 1-up
DATA_038C99:         dl $039A6B    ; Winged Cloud, key
DATA_038C9C:         dl $039A6B    ; Winged Cloud, 3 stars
DATA_038C9F:         dl $039A6B    ; Winged Cloud, 5 stars
DATA_038CA2:         dl $039A6B    ; Winged Cloud, door
DATA_038CA5:         dl $039A6B    ; Winged Cloud, ground eater
DATA_038CA8:         dl $039A6B    ; Winged Cloud, watermelon
DATA_038CAB:         dl $039A6B    ; Winged Cloud, fire watermelon
DATA_038CAE:         dl $039A6B    ; Winged Cloud, icy watermelon
DATA_038CB1:         dl $039A6B    ; Winged Cloud, seed of sunflower with 3 leaves
DATA_038CB4:         dl $039A6B    ; Winged Cloud, seed of sunflower with 6 leaves
DATA_038CB7:         dl $039A6B    ; Winged Cloud, [CRASH]
DATA_038CBA:         dl $039A6B    ; Boss Door of Bowser's room
DATA_038CBD:         dl $039A6B    ; Winged Cloud, random item.
DATA_038CC0:         dl $039A6B    ; Winged Cloud, !-switch / !-switch
DATA_038CC3:         dl $039A6B    ; Baron Von Zeppelin, Giant Egg
DATA_038CC6:         dl $039A6B    ; Bowser's flame
DATA_038CC9:         dl $039A6B    ; Bowser's quake
DATA_038CCC:         dl $039A6B    ; Horizontal entrance, towards right
DATA_038CCF:         dl $039A6B    ; Hidden entrance, revealed by an ! switch
DATA_038CD2:         dl $039A6B    ; Marching Milde
DATA_038CD5:         dl $0F933F    ; Giant Milde
DATA_038CD8:         dl $0F98BD    ; Large Milde
DATA_038CDB:         dl $039A6B    ; Moutain backgrounds at fight with Hookbill the Koopa
DATA_038CDE:         dl $039A6B    ; (BG3) Ghost with Flatbed Ferry on its head
DATA_038CE1:         dl $039A6B    ; Sluggy the Unshaven
DATA_038CE4:         dl $039A6B    ; Chomp signboard.
DATA_038CE7:         dl $0EFF20    ; Fishin' Lakitu
DATA_038CEA:         dl $039A6B    ; Flower pot, key / 6 stars / 6 coins / nothing
DATA_038CED:         dl $039A6B    ; (BG3) Soft thing
DATA_038CF0:         dl $039A6B    ; Snowball
DATA_038CF3:         dl $039A6B    ; Closer, in Naval Piranha's room
DATA_038CF6:         dl $039A6B    ; Falling Rock
DATA_038CF9:         dl $039A6B    ; Piscatory Pete, Blue / Gold
DATA_038CFC:         dl $039A6B    ; Perying Mantas
DATA_038CFF:         dl $039A6B    ; Loch Nestor
DATA_038D02:         dl $039A6B    ; Boo Blah, normal / upside down
DATA_038D05:         dl $039A6B    ; Boo Blah with Piro Dangle, normal / upside down
DATA_038D08:         dl $039A6B    ; Heading cactus
DATA_038D0B:         dl $039A6B    ; Green Needlenose
DATA_038D0E:         dl $039A6B    ; Gusty, left / right / infinite right / infinite left
DATA_038D11:         dl $039A6B    ; Burt, two / one
DATA_038D14:         dl $039A6B    ; Goonie, right / towards Yoshi / generator right / generator left
DATA_038D17:         dl $039A6B    ; 3 Flightless Goonies
DATA_038D1A:         dl $06BB3E    ; Cloud Drop, moving vertically
DATA_038D1D:         dl $06BC9A    ; Cloud Drop, moving horizontally
DATA_038D20:         dl $039A6B    ; Flamer Guy, jumping around
DATA_038D23:         dl $039A6B    ; Flamer Guy, walking around
DATA_038D26:         dl $039A6B    ; Eggo-Dil
DATA_038D29:         dl $039A6B    ; Eggo-Dil's face
DATA_038D2C:         dl $039A6B    ; Petal of Eggo-Dil
DATA_038D2F:         dl $039A6B    ; Bubble-Plant
DATA_038D32:         dl $07882D    ; Stilt Guy, green / red / yellow / purple
DATA_038D35:         dl $039F9F    ; Woozy Guy, green / red / yellow / purple
DATA_038D38:         dl $039A6B    ; Egg-Plant / Needlenose-Plant
DATA_038D3B:         dl $039A6B    ; Slugger
DATA_038D3E:         dl $039A6B    ; Parent and children of Huffin' Puffins
DATA_038D41:         dl $039A6B    ; Barney Bubble
DATA_038D44:         dl $039A6B    ; Blow Hard
DATA_038D47:         dl $039A6B    ; Yellow Needlenose
DATA_038D4A:         dl $039A6B    ; Flower
DATA_038D4D:         dl $039A6B    ; Spear Guy, long spear
DATA_038D50:         dl $039A6B    ; Spear Guy, short spear
DATA_038D53:         dl $07D857    ; Zeus Guy
DATA_038D56:         dl $039A6B    ; Energy of Zeus Guy
DATA_038D59:         dl $039A6B    ; Poochy
DATA_038D5C:         dl $039A6B    ; Bubbled 1-up
DATA_038D5F:         dl $039A6B    ; Spiky mace
DATA_038D62:         dl $039A6B    ; Spiky mace, double-ended
DATA_038D65:         dl $039A6B    ; Boo Guys spinning spiky mace
DATA_038D68:         dl $039A6B    ; Jean de Fillet, right / left
DATA_038D6B:         dl $039A6B    ; Boo Guys, carrying bombs towards left.
DATA_038D6E:         dl $039A6B    ; Boo Guys, carrying bombs towards right
DATA_038D71:         dl $039F9F    ; Seed of watermelon
DATA_038D74:         dl $039A6B    ; Milde
DATA_038D77:         dl $039A6B    ; Tap-Tap
DATA_038D7A:         dl $039A6B    ; Tap-Tap, stays on ledges
DATA_038D7D:         dl $039A6B    ; Hopping Tap-Tap
DATA_038D80:         dl $039A6B    ; Chained spike ball, controlled by Boo Guy
DATA_038D83:         dl $039A6B    ; Boo Guy, rotating a pulley, right / left
DATA_038D86:         dl $039A6B    ; Crate, 6 stars
DATA_038D89:         dl $039A6B    ; Boo Man Bluff
DATA_038D8C:         dl $039A6B    ; Flower
DATA_038D8F:         dl $039A6B    ; Georgette Jelly
DATA_038D92:         dl $039A6B    ; Splashed Georgette Jelly
DATA_038D95:         dl $039A6B    ; Snifit
DATA_038D98:         dl $039A6B    ; Bullet, shot by Snifit
DATA_038D9B:         dl $039A6B    ; Coin, gravity affected
DATA_038D9E:         dl $039A6B    ; Floating round platform on water
DATA_038DA1:         dl $039A6B    ; Donut Lift
DATA_038DA4:         dl $039A6B    ; Giant Donut Lift
DATA_038DA7:         dl $039A6B    ; Spooky
DATA_038DAA:         dl $039A6B    ; Green Glove
DATA_038DAD:         dl $07AAEC    ; Lakitu, one / two
DATA_038DB0:         dl $039A6B    ; Lakitu's cloud
DATA_038DB3:         dl $039A6B    ; Spiny Egg
DATA_038DB6:         dl $039A6B    ; Brown Arrow Wheel
DATA_038DB9:         dl $039A6B    ; Blue Arrow Wheel
DATA_038DBC:         dl $039A6B    ; Double-ended arrow lift
DATA_038DBF:         dl $039A6B    ; Explosion of Number Platform
DATA_038DC2:         dl $039A6B    ; ? bucket, Bandit
DATA_038DC5:         dl $039A6B    ; ? bucket, 5 coins
DATA_038DC8:         dl $039F9F    ; Stretch, green / red / yellow / purple
DATA_038DCB:         dl $039A6B    ; Kamek, for the ending scene / flying and chases
DATA_038DCE:         dl $039A6B    ; Spiked log held by chain and pulley
DATA_038DD1:         dl $039A6B    ; ? Pulley
DATA_038DD4:         dl $039A6B    ; Ground shake
DATA_038DD7:         dl $039A6B    ; Fuzzy
DATA_038DDA:         dl $039A6B    ; Shy Guy, with Bandit hidden
DATA_038DDD:         dl $039A6B    ; Fat Guy, red / green
DATA_038DE0:         dl $0CF848    ; Fly Guy carrying red coin / Whirly Fly Guy
DATA_038DE3:         dl $039A6B    ; Yoshi, in the intro scene
DATA_038DE6:         dl $039A6B    ; unknown
DATA_038DE9:         dl $039A6B    ; Lava Drop, moving horizontally
DATA_038DEC:         dl $039A6B    ; Lava Drop, moving vertically
DATA_038DEF:         dl $039A6B    ; Locked door
DATA_038DF2:         dl $039A6B    ; Lemon Drop
DATA_038DF5:         dl $049087    ; Lantern Ghost
DATA_038DF8:         dl $039A6B    ; Baby Bowser
DATA_038DFB:         dl $039A6B    ; Raven, always circling, anticlockwise / clockwise
DATA_038DFE:         dl $039A6B    ; Raven, anticlockwise / clockwise initially
DATA_038E01:         dl $039A6B    ; 3x6 Falling Rock
DATA_038E04:         dl $039A6B    ; 3x3 Falling Rock
DATA_038E07:         dl $039A6B    ; 3x9 Falling Rock
DATA_038E0A:         dl $039A6B    ; 6x3 Falling Rock
DATA_038E0D:         dl $039A6B    ; Stomach Acid
DATA_038E10:         dl $039A6B    ; Flipper, downwards
DATA_038E13:         dl $039A6B    ; Fang, dangling
DATA_038E16:         dl $039A6B    ; Fang, flying wavily
DATA_038E19:         dl $039A6B    ; Flopsy Fish, swimming around
DATA_038E1C:         dl $039A6B    ; Flopsy Fish, swimming and occasionally jumps vertically
DATA_038E1F:         dl $039A6B    ; Flopsy Fish, swimming and jumps in an arc
DATA_038E22:         dl $039A6B    ; Flopsy Fish, jumps 3 times in an arc, right / left
DATA_038E25:         dl $039A6B    ; Spray Fish
DATA_038E28:         dl $039A6B    ; Flipper, rightwards / leftwards
DATA_038E2B:         dl $07B8B9    ; Blue Sluggy, falling down / crawing ceiling
DATA_038E2E:         dl $07B8B9    ; Pink Sluggy, falling down / crawing ceiling but doesn't move
DATA_038E31:         dl $039A6B    ; Horizontal entrance, towards left
DATA_038E34:         dl $039A6B    ; Large Spring Ball
DATA_038E37:         dl $039A6B    ; Arrow cloud, up
DATA_038E3A:         dl $039A6B    ; Arrow cloud, up right
DATA_038E3D:         dl $039A6B    ; Arrow cloud, right
DATA_038E40:         dl $039A6B    ; Arrow cloud, down right
DATA_038E43:         dl $039A6B    ; Arrow cloud, down
DATA_038E46:         dl $039A6B    ; Arrow cloud, down left
DATA_038E49:         dl $039A6B    ; Arrow cloud, left
DATA_038E4C:         dl $039A6B    ; Arrow cloud, up left
DATA_038E4F:         dl $039A6B    ; Arrow cloud, rotating
DATA_038E52:         dl $039A6B    ; Flutter
DATA_038E55:         dl $039A6B    ; Goonie with Shy Guy
DATA_038E58:         dl $039A6B    ; Shark Chomp
DATA_038E5B:         dl $039A6B    ; Very Fat Goonie
DATA_038E5E:         dl $039A6B    ; Cactus Jack, one / three
DATA_038E61:         dl $07C689    ; Wall Lakitu
DATA_038E64:         dl $039A6B    ; Bowling Goonie
DATA_038E67:         dl $039A6B    ; Grunt, walking
DATA_038E6A:         dl $039A6B    ; Grunt, running
DATA_038E6D:         dl $039A6B    ; Dancing Spear Guy
DATA_038E70:         dl $039A6B    ; Green switch for green spiked platform
DATA_038E73:         dl $039A6B    ; Red switch for red spiked platform
DATA_038E76:         dl $039A6B    ; Pink Pinwheel with Shy Guys, clockwise / anticlockwise
DATA_038E79:         dl $039A6B    ; Green spiked platform
DATA_038E7C:         dl $039A6B    ; Red spiked platform
DATA_038E7F:         dl $039A6B    ; Bonus Item, red coin / key / flower / door
DATA_038E82:         dl $039A6B    ; Two spiked platforms with one switch in the center
DATA_038E85:         dl $039A6B    ; Bouncing green Needlenose
DATA_038E88:         dl $039A6B    ; Nipper Plant
DATA_038E8B:         dl $039A6B    ; Nipper Spore
DATA_038E8E:         dl $07F03E    ; Thunder Lakitu, one / two
DATA_038E91:         dl $07E3C8    ; Green Koopa shell
DATA_038E94:         dl $07E3C8    ; Red Koopa shell
DATA_038E97:         dl $07E3BD    ; Green Beach Koopa
DATA_038E9A:         dl $07E3BD    ; Red Beach Koopa
DATA_038E9D:         dl $07E3DF    ; Green Koopa
DATA_038EA0:         dl $07E3F9    ; Red Koopa
DATA_038EA3:         dl $07E730    ; Green Para Koopa, jumping forth.
DATA_038EA6:         dl $07E74D    ; Red Para Koopa, flying horizontally
DATA_038EA9:         dl $07E74D    ; Red Para Koopa, flying vertically
DATA_038EAC:         dl $07EB45    ; Aqua Lakitu
DATA_038EAF:         dl $039A6B    ; Naval Piranha
DATA_038EB2:         dl $039A6B    ; Naval Bud
DATA_038EB5:         dl $039A6B    ; Baron Von Zeppelin, red Suy Guy
DATA_038EB8:         dl $039A6B    ; Baron Von Zeppelin, Needlenose
DATA_038EBB:         dl $039A6B    ; Baron Von Zeppelin, bomb
DATA_038EBE:         dl $039A6B    ; Baron Von Zeppelin, Bandit
DATA_038EC1:         dl $039A6B    ; Baron Von Zeppelin, large Spring Ball
DATA_038EC4:         dl $039A6B    ; Baron Von Zeppelin, 1-up
DATA_038EC7:         dl $039A6B    ; Baron Von Zeppelin, key
DATA_038ECA:         dl $039A6B    ; Baron Von Zeppelin, 5 coins
DATA_038ECD:         dl $039A6B    ; Baron Von Zeppelin, watermelon
DATA_038ED0:         dl $039A6B    ; Baron Von Zeppelin, fire watermelon
DATA_038ED3:         dl $039A6B    ; Baron Von Zeppelin, icy watermelon
DATA_038ED6:         dl $039A6B    ; Baron Von Zeppelin, crate, 6 stars.
DATA_038ED9:         dl $039A6B    ; Baron Von Zeppelin
DATA_038EDC:         dl $039A6B    ; Spinning Log
DATA_038EDF:         dl $0F8636    ; Crazee Dayzee
DATA_038EE2:         dl $039A6B    ; Dragonfly
DATA_038EE5:         dl $039A6B    ; Butterfly
DATA_038EE8:         dl $039F9F    ; Bumpty
DATA_038EEB:         dl $039A6B    ; Active line guided green Flatbed Ferry, left
DATA_038EEE:         dl $039A6B    ; Active line guided green Flatbed Ferry, right
DATA_038EF1:         dl $039A6B    ; Active line guided yellow Flatbed Ferry, left
DATA_038EF4:         dl $039A6B    ; Active line guided yellow Flatbed Ferry, right
DATA_038EF7:         dl $039A6B    ; Line guided green Flatbed Ferry, left
DATA_038EFA:         dl $039A6B    ; Line guided green Flatbed Ferry, right
DATA_038EFD:         dl $039A6B    ; Line guided yellow Flatbed Ferry, left
DATA_038F00:         dl $039A6B    ; Line guided yellow Flatbed Ferry, right
DATA_038F03:         dl $039A6B    ; Line guided red Flatbed Ferry, left
DATA_038F06:         dl $039A6B    ; Line guided red Flatbed Ferry, right
DATA_038F09:         dl $039A6B    ; Whirling lift
DATA_038F0C:         dl $039A6B    ; Falling icicle
DATA_038F0F:         dl $039A6B    ; Sparrow
DATA_038F12:         dl $039A6B    ; Mufti Guy, green / red / yellow / purple
DATA_038F15:         dl $039A6B    ; Caged Ghost, squeezing in sewer
DATA_038F18:         dl $039A6B    ; Blargg
DATA_038F1B:         dl $039A6B    ; unknown
DATA_038F1E:         dl $039A6B    ; Unbalanced snowy platform
DATA_038F21:         dl $039A6B    ; Arrow sign, up / right / left / down
DATA_038F24:         dl $039A6B    ; Diagonal arrow sign, up left / up right / down left / down right
DATA_038F27:         dl $039A6B    ; Dizzy Dandy
DATA_038F2A:         dl $0C8FE3    ; Boo Guy
DATA_038F2D:         dl $039F9F    ; Bumpty, tackles at Yoshi
DATA_038F30:         dl $039F9F    ; Flying Bumpty, flying aronnd / flying straightly
DATA_038F33:         dl $0C9C48    ; Skeleton Goonie
DATA_038F36:         dl $039A6B    ; Flightless Skeleton Goonie
DATA_038F39:         dl $0C9FDE    ; Skeleton Goonie with a bomb
DATA_038F3C:         dl $039A6B    ; Firebar, double-ended, clockwise / anticlockwise
DATA_038F3F:         dl $039A6B    ; Firebar, clockwise / anticlockwise
DATA_038F42:         dl $039A6B    ; Star
DATA_038F45:         dl $039A6B    ; Little Skull Mouser
DATA_038F48:         dl $039A6B    ; Cork, seals 3D pipe
DATA_038F4B:         dl $039F9F    ; Grinder, runs away
DATA_038F4E:         dl $039F9F    ; Grinder, spits seeds of watermelon
DATA_038F51:         dl $039F9F    ; Short Fuse / Seedy Sally, right / left
DATA_038F54:         dl $039F9F    ; Grinder, grasps Baby Mario
DATA_038F57:         dl $039F9F    ; Grinder, climbing, spits seeds of watermelon
DATA_038F5A:         dl $039A6B    ; Hot Lips
DATA_038F5D:         dl $0CC2A4    ; Boo Balloon, coin / !-switch
DATA_038F60:         dl $039A6B    ; Frog
DATA_038F63:         dl $0CC795    ; Kamek, shoots magic at Yoshi.
DATA_038F66:         dl $039A6B    ; Kamek's magic
DATA_038F69:         dl $039A6B    ; Coin
DATA_038F6C:         dl $039A6B    ; (BG3) Balloon
DATA_038F6F:         dl $039A6B    ; Coin Cannon for Mini Battle
DATA_038F72:         dl $039A6B    ; Coin for Mini Battle
DATA_038F75:         dl $039A6B    ; Bandit for Mini Battle
DATA_038F78:         dl $039A6B    ; Checkered Platform for Mini Battle
DATA_038F7B:         dl $039A6B    ; Bandit for Mini Battle
DATA_038F7E:         dl $039A6B    ; Red Balloon for Mini Battle
DATA_038F81:         dl $039F9F    ; Bandit for Mini Battle
DATA_038F84:         dl $039A6B    ; Watermelon Pot for Mini Battle
DATA_038F87:         dl $039A6B    ; possibly Bandit for Mini Battle
; end sprite head_bops table

; sprite riding_yoshi routine table: $8F8A - 94B7
; only 4 are even used, the rest go straight to RTL
; the 4 used are:
; $037: grim leecher
; $061: baby mario
; $12A: bandit shyguy
; $134: baby bowser
sprite_ridings:
DATA_038F8A:         dl $039A6B
DATA_038F8D:         dl $039A6B
DATA_038F90:         dl $039A6B
DATA_038F93:         dl $039A6B
DATA_038F96:         dl $039A6B
DATA_038F99:         dl $039A6B
DATA_038F9C:         dl $039A6B
DATA_038F9F:         dl $039A6B
DATA_038FA2:         dl $039A6B
DATA_038FA5:         dl $039A6B
DATA_038FA8:         dl $039A6B
DATA_038FAB:         dl $039A6B
DATA_038FAE:         dl $039A6B
DATA_038FB1:         dl $039A6B
DATA_038FB4:         dl $039A6B
DATA_038FB7:         dl $039A6B
DATA_038FBA:         dl $039A6B
DATA_038FBD:         dl $039A6B
DATA_038FC0:         dl $039A6B
DATA_038FC3:         dl $039A6B
DATA_038FC6:         dl $039A6B
DATA_038FC9:         dl $039A6B
DATA_038FCC:         dl $039A6B
DATA_038FCF:         dl $039A6B
DATA_038FD2:         dl $039A6B
DATA_038FD5:         dl $039A6B
DATA_038FD8:         dl $039A6B
DATA_038FDB:         dl $039A6B
DATA_038FDE:         dl $039A6B
DATA_038FE1:         dl $039A6B
DATA_038FE4:         dl $039A6B
DATA_038FE7:         dl $039A6B
DATA_038FEA:         dl $039A6B
DATA_038FED:         dl $039A6B
DATA_038FF0:         dl $039A6B
DATA_038FF3:         dl $039A6B
DATA_038FF6:         dl $039A6B
DATA_038FF9:         dl $039A6B
DATA_038FFC:         dl $039A6B
DATA_038FFF:         dl $039A6B
DATA_039002:         dl $039A6B
DATA_039005:         dl $039A6B
DATA_039008:         dl $039A6B
DATA_03900B:         dl $039A6B
DATA_03900E:         dl $039A6B
DATA_039011:         dl $039A6B
DATA_039014:         dl $039A6B
DATA_039017:         dl $039A6B
DATA_03901A:         dl $039A6B
DATA_03901D:         dl $039A6B
DATA_039020:         dl $039A6B
DATA_039023:         dl $039A6B
DATA_039026:         dl $039A6B
DATA_039029:         dl $039A6B
DATA_03902C:         dl $039A6B
DATA_03902F:         dl $04A0AB    ; grim leecher
DATA_039032:         dl $039A6B
DATA_039035:         dl $039A6B
DATA_039038:         dl $039A6B
DATA_03903B:         dl $039A6B
DATA_03903E:         dl $039A6B
DATA_039041:         dl $039A6B
DATA_039044:         dl $039A6B
DATA_039047:         dl $039A6B
DATA_03904A:         dl $039A6B
DATA_03904D:         dl $039A6B
DATA_039050:         dl $039A6B
DATA_039053:         dl $039A6B
DATA_039056:         dl $039A6B
DATA_039059:         dl $039A6B
DATA_03905C:         dl $039A6B
DATA_03905F:         dl $039A6B
DATA_039062:         dl $039A6B
DATA_039065:         dl $039A6B
DATA_039068:         dl $039A6B
DATA_03906B:         dl $039A6B
DATA_03906E:         dl $039A6B
DATA_039071:         dl $039A6B
DATA_039074:         dl $039A6B
DATA_039077:         dl $039A6B
DATA_03907A:         dl $039A6B
DATA_03907D:         dl $039A6B
DATA_039080:         dl $039A6B
DATA_039083:         dl $039A6B
DATA_039086:         dl $039A6B
DATA_039089:         dl $039A6B
DATA_03908C:         dl $039A6B
DATA_03908F:         dl $039A6B
DATA_039092:         dl $039A6B
DATA_039095:         dl $039A6B
DATA_039098:         dl $039A6B
DATA_03909B:         dl $039A6B
DATA_03909E:         dl $039A6B
DATA_0390A1:         dl $039A6B
DATA_0390A4:         dl $039A6B
DATA_0390A7:         dl $039A6B
DATA_0390AA:         dl $039A6B
DATA_0390AD:         dl $06CF1A    ; baby mario
DATA_0390B0:         dl $039A6B
DATA_0390B3:         dl $039A6B
DATA_0390B6:         dl $039A6B
DATA_0390B9:         dl $039A6B
DATA_0390BC:         dl $039A6B
DATA_0390BF:         dl $039A6B
DATA_0390C2:         dl $039A6B
DATA_0390C5:         dl $039A6B
DATA_0390C8:         dl $039A6B
DATA_0390CB:         dl $039A6B
DATA_0390CE:         dl $039A6B
DATA_0390D1:         dl $039A6B
DATA_0390D4:         dl $039A6B
DATA_0390D7:         dl $039A6B
DATA_0390DA:         dl $039A6B
DATA_0390DD:         dl $039A6B
DATA_0390E0:         dl $039A6B
DATA_0390E3:         dl $039A6B
DATA_0390E6:         dl $039A6B
DATA_0390E9:         dl $039A6B
DATA_0390EC:         dl $039A6B
DATA_0390EF:         dl $039A6B
DATA_0390F2:         dl $039A6B
DATA_0390F5:         dl $039A6B
DATA_0390F8:         dl $039A6B
DATA_0390FB:         dl $039A6B
DATA_0390FE:         dl $039A6B
DATA_039101:         dl $039A6B
DATA_039104:         dl $039A6B
DATA_039107:         dl $039A6B
DATA_03910A:         dl $039A6B
DATA_03910D:         dl $039A6B
DATA_039110:         dl $039A6B
DATA_039113:         dl $039A6B
DATA_039116:         dl $039A6B
DATA_039119:         dl $039A6B
DATA_03911C:         dl $039A6B
DATA_03911F:         dl $039A6B
DATA_039122:         dl $039A6B
DATA_039125:         dl $039A6B
DATA_039128:         dl $039A6B
DATA_03912B:         dl $039A6B
DATA_03912E:         dl $039A6B
DATA_039131:         dl $039A6B
DATA_039134:         dl $039A6B
DATA_039137:         dl $039A6B
DATA_03913A:         dl $039A6B
DATA_03913D:         dl $039A6B
DATA_039140:         dl $039A6B
DATA_039143:         dl $039A6B
DATA_039146:         dl $039A6B
DATA_039149:         dl $039A6B
DATA_03914C:         dl $039A6B
DATA_03914F:         dl $039A6B
DATA_039152:         dl $039A6B
DATA_039155:         dl $039A6B
DATA_039158:         dl $039A6B
DATA_03915B:         dl $039A6B
DATA_03915E:         dl $039A6B
DATA_039161:         dl $039A6B
DATA_039164:         dl $039A6B
DATA_039167:         dl $039A6B
DATA_03916A:         dl $039A6B
DATA_03916D:         dl $039A6B
DATA_039170:         dl $039A6B
DATA_039173:         dl $039A6B
DATA_039176:         dl $039A6B
DATA_039179:         dl $039A6B
DATA_03917C:         dl $039A6B
DATA_03917F:         dl $039A6B
DATA_039182:         dl $039A6B
DATA_039185:         dl $039A6B
DATA_039188:         dl $039A6B
DATA_03918B:         dl $039A6B
DATA_03918E:         dl $039A6B
DATA_039191:         dl $039A6B
DATA_039194:         dl $039A6B
DATA_039197:         dl $039A6B
DATA_03919A:         dl $039A6B
DATA_03919D:         dl $039A6B
DATA_0391A0:         dl $039A6B
DATA_0391A3:         dl $039A6B
DATA_0391A6:         dl $039A6B
DATA_0391A9:         dl $039A6B
DATA_0391AC:         dl $039A6B
DATA_0391AF:         dl $039A6B
DATA_0391B2:         dl $039A6B
DATA_0391B5:         dl $039A6B
DATA_0391B8:         dl $039A6B
DATA_0391BB:         dl $039A6B
DATA_0391BE:         dl $039A6B
DATA_0391C1:         dl $039A6B
DATA_0391C4:         dl $039A6B
DATA_0391C7:         dl $039A6B
DATA_0391CA:         dl $039A6B
DATA_0391CD:         dl $039A6B
DATA_0391D0:         dl $039A6B
DATA_0391D3:         dl $039A6B
DATA_0391D6:         dl $039A6B
DATA_0391D9:         dl $039A6B
DATA_0391DC:         dl $039A6B
DATA_0391DF:         dl $039A6B
DATA_0391E2:         dl $039A6B
DATA_0391E5:         dl $039A6B
DATA_0391E8:         dl $039A6B
DATA_0391EB:         dl $039A6B
DATA_0391EE:         dl $039A6B
DATA_0391F1:         dl $039A6B
DATA_0391F4:         dl $039A6B
DATA_0391F7:         dl $039A6B
DATA_0391FA:         dl $039A6B
DATA_0391FD:         dl $039A6B
DATA_039200:         dl $039A6B
DATA_039203:         dl $039A6B
DATA_039206:         dl $039A6B
DATA_039209:         dl $039A6B
DATA_03920C:         dl $039A6B
DATA_03920F:         dl $039A6B
DATA_039212:         dl $039A6B
DATA_039215:         dl $039A6B
DATA_039218:         dl $039A6B
DATA_03921B:         dl $039A6B
DATA_03921E:         dl $039A6B
DATA_039221:         dl $039A6B
DATA_039224:         dl $039A6B
DATA_039227:         dl $039A6B
DATA_03922A:         dl $039A6B
DATA_03922D:         dl $039A6B
DATA_039230:         dl $039A6B
DATA_039233:         dl $039A6B
DATA_039236:         dl $039A6B
DATA_039239:         dl $039A6B
DATA_03923C:         dl $039A6B
DATA_03923F:         dl $039A6B
DATA_039242:         dl $039A6B
DATA_039245:         dl $039A6B
DATA_039248:         dl $039A6B
DATA_03924B:         dl $039A6B
DATA_03924E:         dl $039A6B
DATA_039251:         dl $039A6B
DATA_039254:         dl $039A6B
DATA_039257:         dl $039A6B
DATA_03925A:         dl $039A6B
DATA_03925D:         dl $039A6B
DATA_039260:         dl $039A6B
DATA_039263:         dl $039A6B
DATA_039266:         dl $039A6B
DATA_039269:         dl $039A6B
DATA_03926C:         dl $039A6B
DATA_03926F:         dl $039A6B
DATA_039272:         dl $039A6B
DATA_039275:         dl $039A6B
DATA_039278:         dl $039A6B
DATA_03927B:         dl $039A6B
DATA_03927E:         dl $039A6B
DATA_039281:         dl $039A6B
DATA_039284:         dl $039A6B
DATA_039287:         dl $039A6B
DATA_03928A:         dl $039A6B
DATA_03928D:         dl $039A6B
DATA_039290:         dl $039A6B
DATA_039293:         dl $039A6B
DATA_039296:         dl $039A6B
DATA_039299:         dl $039A6B
DATA_03929C:         dl $039A6B
DATA_03929F:         dl $039A6B
DATA_0392A2:         dl $039A6B
DATA_0392A5:         dl $039A6B
DATA_0392A8:         dl $039A6B
DATA_0392AB:         dl $039A6B
DATA_0392AE:         dl $039A6B
DATA_0392B1:         dl $039A6B
DATA_0392B4:         dl $039A6B
DATA_0392B7:         dl $039A6B
DATA_0392BA:         dl $039A6B
DATA_0392BD:         dl $039A6B
DATA_0392C0:         dl $039A6B
DATA_0392C3:         dl $039A6B
DATA_0392C6:         dl $039A6B
DATA_0392C9:         dl $039A6B
DATA_0392CC:         dl $039A6B
DATA_0392CF:         dl $039A6B
DATA_0392D2:         dl $039A6B
DATA_0392D5:         dl $039A6B
DATA_0392D8:         dl $039A6B
DATA_0392DB:         dl $039A6B
DATA_0392DE:         dl $039A6B
DATA_0392E1:         dl $039A6B
DATA_0392E4:         dl $039A6B
DATA_0392E7:         dl $039A6B
DATA_0392EA:         dl $039A6B
DATA_0392ED:         dl $039A6B
DATA_0392F0:         dl $039A6B
DATA_0392F3:         dl $039A6B
DATA_0392F6:         dl $039A6B
DATA_0392F9:         dl $039A6B
DATA_0392FC:         dl $039A6B
DATA_0392FF:         dl $039A6B
DATA_039302:         dl $039A6B
DATA_039305:         dl $039A6B
DATA_039308:         dl $049094    ; bandit shyguy
DATA_03930B:         dl $039A6B
DATA_03930E:         dl $039A6B
DATA_039311:         dl $039A6B
DATA_039314:         dl $039A6B
DATA_039317:         dl $039A6B
DATA_03931A:         dl $039A6B
DATA_03931D:         dl $039A6B
DATA_039320:         dl $039A6B
DATA_039323:         dl $039A6B
DATA_039326:         dl $0DE9F9    ; Baby Bowser
DATA_039329:         dl $039A6B
DATA_03932C:         dl $039A6B
DATA_03932F:         dl $039A6B
DATA_039332:         dl $039A6B
DATA_039335:         dl $039A6B
DATA_039338:         dl $039A6B
DATA_03933B:         dl $039A6B
DATA_03933E:         dl $039A6B
DATA_039341:         dl $039A6B
DATA_039344:         dl $039A6B
DATA_039347:         dl $039A6B
DATA_03934A:         dl $039A6B
DATA_03934D:         dl $039A6B
DATA_039350:         dl $039A6B
DATA_039353:         dl $039A6B
DATA_039356:         dl $039A6B
DATA_039359:         dl $039A6B
DATA_03935C:         dl $039A6B
DATA_03935F:         dl $039A6B
DATA_039362:         dl $039A6B
DATA_039365:         dl $039A6B
DATA_039368:         dl $039A6B
DATA_03936B:         dl $039A6B
DATA_03936E:         dl $039A6B
DATA_039371:         dl $039A6B
DATA_039374:         dl $039A6B
DATA_039377:         dl $039A6B
DATA_03937A:         dl $039A6B
DATA_03937D:         dl $039A6B
DATA_039380:         dl $039A6B
DATA_039383:         dl $039A6B
DATA_039386:         dl $039A6B
DATA_039389:         dl $039A6B
DATA_03938C:         dl $039A6B
DATA_03938F:         dl $039A6B
DATA_039392:         dl $039A6B
DATA_039395:         dl $039A6B
DATA_039398:         dl $039A6B
DATA_03939B:         dl $039A6B
DATA_03939E:         dl $039A6B
DATA_0393A1:         dl $039A6B
DATA_0393A4:         dl $039A6B
DATA_0393A7:         dl $039A6B
DATA_0393AA:         dl $039A6B
DATA_0393AD:         dl $039A6B
DATA_0393B0:         dl $039A6B
DATA_0393B3:         dl $039A6B
DATA_0393B6:         dl $039A6B
DATA_0393B9:         dl $039A6B
DATA_0393BC:         dl $039A6B
DATA_0393BF:         dl $039A6B
DATA_0393C2:         dl $039A6B
DATA_0393C5:         dl $039A6B
DATA_0393C8:         dl $039A6B
DATA_0393CB:         dl $039A6B
DATA_0393CE:         dl $039A6B
DATA_0393D1:         dl $039A6B
DATA_0393D4:         dl $039A6B
DATA_0393D7:         dl $039A6B
DATA_0393DA:         dl $039A6B
DATA_0393DD:         dl $039A6B
DATA_0393E0:         dl $039A6B
DATA_0393E3:         dl $039A6B
DATA_0393E6:         dl $039A6B
DATA_0393E9:         dl $039A6B
DATA_0393EC:         dl $039A6B
DATA_0393EF:         dl $039A6B
DATA_0393F2:         dl $039A6B
DATA_0393F5:         dl $039A6B
DATA_0393F8:         dl $039A6B
DATA_0393FB:         dl $039A6B
DATA_0393FE:         dl $039A6B
DATA_039401:         dl $039A6B
DATA_039404:         dl $039A6B
DATA_039407:         dl $039A6B
DATA_03940A:         dl $039A6B
DATA_03940D:         dl $039A6B
DATA_039410:         dl $039A6B
DATA_039413:         dl $039A6B
DATA_039416:         dl $039A6B
DATA_039419:         dl $039A6B
DATA_03941C:         dl $039A6B
DATA_03941F:         dl $039A6B
DATA_039422:         dl $039A6B
DATA_039425:         dl $039A6B
DATA_039428:         dl $039A6B
DATA_03942B:         dl $039A6B
DATA_03942E:         dl $039A6B
DATA_039431:         dl $039A6B
DATA_039434:         dl $039A6B
DATA_039437:         dl $039A6B
DATA_03943A:         dl $039A6B
DATA_03943D:         dl $039A6B
DATA_039440:         dl $039A6B
DATA_039443:         dl $039A6B
DATA_039446:         dl $039A6B
DATA_039449:         dl $039A6B
DATA_03944C:         dl $039A6B
DATA_03944F:         dl $039A6B
DATA_039452:         dl $039A6B
DATA_039455:         dl $039A6B
DATA_039458:         dl $039A6B
DATA_03945B:         dl $039A6B
DATA_03945E:         dl $039A6B
DATA_039461:         dl $039A6B
DATA_039464:         dl $039A6B
DATA_039467:         dl $039A6B
DATA_03946A:         dl $039A6B
DATA_03946D:         dl $039A6B
DATA_039470:         dl $039A6B
DATA_039473:         dl $039A6B
DATA_039476:         dl $039A6B
DATA_039479:         dl $039A6B
DATA_03947C:         dl $039A6B
DATA_03947F:         dl $039A6B
DATA_039482:         dl $039A6B
DATA_039485:         dl $039A6B
DATA_039488:         dl $039A6B
DATA_03948B:         dl $039A6B
DATA_03948E:         dl $039A6B
DATA_039491:         dl $039A6B
DATA_039494:         dl $039A6B
DATA_039497:         dl $039A6B
DATA_03949A:         dl $039A6B
DATA_03949D:         dl $039A6B
DATA_0394A0:         dl $039A6B
DATA_0394A3:         dl $039A6B
DATA_0394A6:         dl $039A6B
DATA_0394A9:         dl $039A6B
DATA_0394AC:         dl $039A6B
DATA_0394AF:         dl $039A6B
DATA_0394B2:         dl $039A6B
DATA_0394B5:         dl $039A6B
; end sprite_ridings table

; l sub
  REP #$30                        ; $0394B8 |
  LDX #$009C                      ; $0394BA |
  LDA #$00FF                      ; $0394BD |

CODE_0394C0:
  STZ $6EC0,x                     ; $0394C0 |
  STA $7462,x                     ; $0394C3 |
  DEX                             ; $0394C6 |
  DEX                             ; $0394C7 |
  DEX                             ; $0394C8 |
  DEX                             ; $0394C9 |
  BPL CODE_0394C0                 ; $0394CA |
  SEP #$30                        ; $0394CC |
  RTL                             ; $0394CE |
  REP #$20                        ; $0394CF |
  BRA CODE_0394F3                 ; $0394D1 |  -- continue to sub below

; l sub
  LDA $7E2A                       ; $0394D3 |
  BNE CODE_039505                 ; $0394D6 |
  REP #$20                        ; $0394D8 |
  LDA $021A                       ; $0394DA |
  CMP #$000B                      ; $0394DD |
  BEQ CODE_0394F6                 ; $0394E0 |
  CMP #$0032                      ; $0394E2 |
  BEQ CODE_0394EC                 ; $0394E5 |
  CMP #$0038                      ; $0394E7 |
  BNE CODE_0394F3                 ; $0394EA |

CODE_0394EC:
  LDY $60AE                       ; $0394EC |
  CPY #$0E                        ; $0394EF |
  BEQ CODE_0394F6                 ; $0394F1 |

CODE_0394F3:
  LDA #$0000                      ; $0394F3 |  -- entry point here

CODE_0394F6:
  STA $3006                       ; $0394F6 | r3
  LDX #$09                        ; $0394F9 |
  LDA #$8925                      ; $0394FB |
  JSL $7EDECF                     ; $0394FE | draw & despawn sprites
  SEP #$20                        ; $039502 |
  RTL                             ; $039504 |

CODE_039505:
  SEP #$20                        ; $039505 |
  LDX #$17                        ; $039507 |
  LDY #$5C                        ; $039509 |

CODE_03950B:
  LDA $0C98,x                     ; $03950B |
  BEQ CODE_03951A                 ; $03950E |
  LDA $7040,y                     ; $039510 |
  STA $00,x                       ; $039513 |
  AND #$F3                        ; $039515 | set drawing method to 00
  STA $7040,y                     ; $039517 |

CODE_03951A:
  DEY                             ; $03951A |
  DEY                             ; $03951B |
  DEY                             ; $03951C |
  DEY                             ; $03951D |
  DEX                             ; $03951E |
  BPL CODE_03950B                 ; $03951F |
  REP #$20                        ; $039521 |
  LDA $021A                       ; $039523 |
  SEC                             ; $039526 |
  SBC #$000B                      ; $039527 |
  STA $3006                       ; $03952A |
  LDX #$09                        ; $03952D |
  LDA #$8925                      ; $03952F |
  JSL $7EDECF                     ; $039532 | draw & despawn sprites
  SEP #$20                        ; $039536 |
  LDX #$17                        ; $039538 |
  LDY #$5C                        ; $03953A |

CODE_03953C:
  LDA $0C98,x                     ; $03953C |
  BEQ CODE_039546                 ; $03953F |
  LDA $00,x                       ; $039541 |
  STA $7040,y                     ; $039543 |

CODE_039546:
  DEY                             ; $039546 |
  DEY                             ; $039547 |
  DEY                             ; $039548 |
  DEY                             ; $039549 |
  DEX                             ; $03954A |
  BPL CODE_03953C                 ; $03954B |
  RTL                             ; $03954D |

; checks new sprites for the entire screen
check_newspr_screen:
  PHB                             ; $03954E |
  PHK                             ; $03954F |
  PLB                             ; $039550 |
  PHD                             ; $039551 |
  REP #$20                        ; $039552 |
  LDA #$7960                      ; $039554 |
  TCD                             ; $039557 |
  LDY #$3C                        ; $039558 |
  STY $7E4A                       ; $03955A |
  LDA $0039                       ; $03955D |\
  STA $0E                         ; $039560 | |
  SEC                             ; $039562 | | the main loop
  SBC #$0160                      ; $039563 | | checks a region 0x160 wide
  STA $0039                       ; $039566 | | or, the entire screen for new sprites
  STZ $0073                       ; $039569 | | x goes up 0x10 (one tile) at a time

CODE_03956C:
  LDA $0039                       ; $03956C | | and then it checks the column there
  CLC                             ; $03956F | | this is used during new area loading
  ADC #$0010                      ; $039570 | | it checks/loads all sprites nearby
  STA $0039                       ; $039573 | | it sets the x offset to +0x120
  JSR CODE_039596                 ; $039576 | | so really it checks x - 64 to x + 288
  LDA $0039                       ; $039579 | |
  CMP $0E                         ; $03957C | |
  BNE CODE_03956C                 ; $03957E |/
  LDA #$4000                      ; $039580 |
  STA $60A4                       ; $039583 |
  STA $60A6                       ; $039586 |
  SEP #$20                        ; $039589 |
  PLD                             ; $03958B |
  PLB                             ; $03958C |
  RTL                             ; $03958D |

; camera x offset
check_newspr_xoffset:
DATA_03958E:         dw $0120, $FFD0

; camera y offset
check_newspr_yoffset:
DATA_039592:         dw $0110, $FFE0

; builds the table of newly discovered sprites for new entries
; checks one single column at $0039 (camera x) plus offset
; if it's a special sprite, just calls init_special_sprite straight away
; otherwise, for regular sprites, initializes slots for this sprite
; in all the sprite tables and sets state to inited for later handling
check_newspr_column:

CODE_039596:
  LDX $0073                       ; $039596 |
  LDA $0039                       ; $039599 |
  CLC                             ; $03959C |
  ADC $958E,x                     ; $03959D | camera x offset: 288 right or 48 left
  STA $3002                       ; $0395A0 | r1 = camera x + offset
  LDA $003B                       ; $0395A3 |
  SEC                             ; $0395A6 |
  SBC #$0020                      ; $0395A7 |
  STA $3004                       ; $0395AA | r2 = camera y - 32
  LDX $0075                       ; $0395AD |
  LDA $003B                       ; $0395B0 |
  CLC                             ; $0395B3 |
  ADC $9592,x                     ; $0395B4 | camera y offset: 272 down or 32 up
  STA $3006                       ; $0395B7 | r3 = camera y + offset
  LDA $0039                       ; $0395BA |
  SEC                             ; $0395BD |
  SBC #$0030                      ; $0395BE |
  STA $3008                       ; $0395C1 | r4 = camera x - 48
  LDX #$09                        ; $0395C4 |
  LDA #$8000                      ; $0395C6 |
  JSL $7EDE44                     ; $0395C9 | GSU init
  REP #$10                        ; $0395CD |
  LDX #$0000                      ; $0395CF |\  begin a loop of

CODE_0395D2:
  LDA $7027CE,x                   ; $0395D2 | | new sprite table, by 8's
  BPL CODE_0395DB                 ; $0395D6 | | first 2-byte slot is sprite ID
  SEP #$10                        ; $0395D8 | | if negative, done processing
  RTS                             ; $0395DA |/

; check special sprite
CODE_0395DB:
  SEC                             ; $0395DB |\  if we've gotten here we know we have a
  SBC #$01BA                      ; $0395DC | | new sprite to load!
  BCC CODE_0395E9                 ; $0395DF | | if (sprite ID - 0x1BA) < 0
  JSR CODE_03979E                 ; $0395E1 | | it's a special sprite
  BCC CODE_039640                 ; $0395E4 | | special routine for initing
  JMP CODE_03977F                 ; $0395E6 |/

; check regular sprite
CODE_0395E9:
  LDA $7E2A                       ; $0395E9 |\  if we're in a special pause event
  BEQ CODE_03962F                 ; $0395EC |/  continue with following checks
  TXY                             ; $0395EE |\
  LDA $7027CE,x                   ; $0395EF | | take sprite ID
  ASL A                           ; $0395F3 | | multiply by 2
  TAX                             ; $0395F4 | |
  LDA $0A971E,x                   ; $0395F5 | | index into data table
  TYX                             ; $0395F9 | | grab data there
  AND #$6000                      ; $0395FA | | and with $6000
  BNE CODE_03962F                 ; $0395FD |/  if nonzero, skip further checks
  LDA $7E2A                       ; $0395FF |\
  INC A                           ; $039602 | | if flag + 1 == 0
  BEQ CODE_039640                 ; $039603 |/  cleanup & return
  LDA $7027D0,x                   ; $039605 |\
  ASL A                           ; $039609 | |
  ASL A                           ; $03960A | |
  ASL A                           ; $03960B | |
  ASL A                           ; $03960C | | check
  SEC                             ; $03960D | |
  SBC $608C                       ; $03960E | |
  CLC                             ; $039611 | |
  ADC #$0060                      ; $039612 | |
  CMP #$00C1                      ; $039615 | |
  BCS CODE_03962F                 ; $039618 |/
  LDA $7027D2,x                   ; $03961A | |
  ASL A                           ; $03961E | |
  ASL A                           ; $03961F | |
  ASL A                           ; $039620 | |
  ASL A                           ; $039621 | |
  SEC                             ; $039622 | |
  SBC $6090                       ; $039623 | |
  CLC                             ; $039626 | |
  ADC #$0060                      ; $039627 | |
  CMP #$00C1                      ; $03962A | |
  BCC CODE_039640                 ; $03962D |/

CODE_03962F:
  LDY #$005C                      ; $03962F |\

CODE_039632:
  LDA $6F00,y                     ; $039632 | |
  BEQ CODE_039654                 ; $039635 | | loop through sprites' states
  DEY                             ; $039637 | | once we reach table index < $18 we break this loop (reserved)
  DEY                             ; $039638 | | first zero value can be used
  DEY                             ; $039639 | | means it's free in table
  DEY                             ; $03963A | |
  CPY #$0018                      ; $03963B | |
  BCS CODE_039632                 ; $03963E |/

CODE_039640:
  TXY                             ; $039640 |
  SEP #$30                        ; $039641 |
  LDA $7027D4,x                   ; $039643 |
  TAX                             ; $039647 |
  LDA #$00                        ; $039648 |
  STA $7028CA,x                   ; $03964A |
  REP #$30                        ; $03964E |
  TYX                             ; $039650 |
  JMP CODE_03977F                 ; $039651 |

CODE_039654:
  LDA $7027D0,x                   ; $039654 |\
  ASL A                           ; $039658 | | load X tile coordinate
  ASL A                           ; $039659 | | from new sprite
  ASL A                           ; $03965A | | * 16 = x position
  ASL A                           ; $03965B | | store in x position table
  STA $70E2,y                     ; $03965C |/
  LDA $7027D2,x                   ; $03965F |\
  ASL A                           ; $039663 | | load Y tile coordinate
  ASL A                           ; $039664 | | from new sprite
  ASL A                           ; $039665 | | * 16 = y position
  ASL A                           ; $039666 | | store in y position table
  STA $7182,y                     ; $039667 |/
  LDA #$0000                      ; $03966A |
  STA $7D96,y                     ; $03966D |
  STA $7220,y                     ; $039670 |
  STA $7222,y                     ; $039673 |
  STA $7976,y                     ; $039676 |
  STA $70E0,y                     ; $039679 |
  STA $7D36,y                     ; $03967C |
  STA $7978,y                     ; $03967F |
  STA $79D6,y                     ; $039682 |
  STA $79D8,y                     ; $039685 |
  STA $7A36,y                     ; $039688 |
  STA $7A38,y                     ; $03968B |
  STA $7900,y                     ; $03968E |
  STA $7902,y                     ; $039691 |
  STA $7A96,y                     ; $039694 |
  STA $7A98,y                     ; $039697 |
  STA $7AF6,y                     ; $03969A |
  STA $7AF8,y                     ; $03969D |
  STA $7402,y                     ; $0396A0 |
  STA $7860,y                     ; $0396A3 |
  STA $6F02,y                     ; $0396A6 |
  STA $7D38,y                     ; $0396A9 |
  STA $7720,y                     ; $0396AC |
  STA $7680,y                     ; $0396AF |
  STA $7682,y                     ; $0396B2 |
  STA $7540,y                     ; $0396B5 |
  STA $75E0,y                     ; $0396B8 |
  STA $77C0,y                     ; $0396BB |
  DEC A                           ; $0396BE |
  STA $7362,y                     ; $0396BF |
  STA $7722,y                     ; $0396C2 |
  LDA #$1FFF                      ; $0396C5 |
  STA $7862,y                     ; $0396C8 |
  LDA $7027CE,x                   ; $0396CB |\
  STA $7360,y                     ; $0396CF |/  store sprite ID
  PHX                             ; $0396D2 |
  ASL A                           ; $0396D3 |
  TAX                             ; $0396D4 |
  SEP #$20                        ; $0396D5 |
  PHY                             ; $0396D7 |
  LDA $0AA716,x                   ; $0396D8 |
  LDY #$0006                      ; $0396DC |\

CODE_0396DF:
  CMP $6EB5,y                     ; $0396DF | | loop through this table
  BEQ CODE_0396EA                 ; $0396E2 | | checking for a $00 byte
  DEY                             ; $0396E4 | |
  BNE CODE_0396DF                 ; $0396E5 |/
  TYA                             ; $0396E7 |
  BRA CODE_0396EF                 ; $0396E8 |

CODE_0396EA:
  TYA                             ; $0396EA |
  ADC #$06                        ; $0396EB |\  if table had any $00
  ASL A                           ; $0396ED | | A = (A + 6) * 4
  ASL A                           ; $0396EE |/

CODE_0396EF:
  REP #$20                        ; $0396EF |
  AND #$00FF                      ; $0396F1 |
  PLY                             ; $0396F4 |
  STA $7180,y                     ; $0396F5 |
  LDA $0A9F1B,x                   ; $0396F8 |
  AND #$00FF                      ; $0396FC |
  EOR #$0020                      ; $0396FF |
  STA $7042,y                     ; $039702 |
  LDA $0A9F1A,x                   ; $039705 |
  AND #$00FF                      ; $039709 |
  STA $74A2,y                     ; $03970C |
  LDA $0AA317,x                   ; $03970F |
  AND #$FF00                      ; $039713 |
  BPL CODE_03971B                 ; $039716 |
  ORA #$00FF                      ; $039718 |

CODE_03971B:
  XBA                             ; $03971B |
  STA $7542,y                     ; $03971C |
  LDA $0AA318,x                   ; $03971F |
  AND #$FF00                      ; $039723 |
  BPL CODE_03972B                 ; $039726 |
  ORA #$00FF                      ; $039728 |

CODE_03972B:
  XBA                             ; $03972B |
  ASL A                           ; $03972C |
  ASL A                           ; $03972D |
  ASL A                           ; $03972E |
  ASL A                           ; $03972F |
  STA $75E2,y                     ; $039730 |
  LDA $0A9B1C,x                   ; $039733 |
  STA $7040,y                     ; $039737 |
  LDA $0A971E,x                   ; $03973A |
  STA $6FA2,y                     ; $03973E |
  LDA $0A9320,x                   ; $039741 |
  STA $6FA0,y                     ; $039745 |
  AND #$001F                      ; $039748 |
  ASL A                           ; $03974B |
  ASL A                           ; $03974C |
  ASL A                           ; $03974D |
  TAX                             ; $03974E |
  LDA $0A9220,x                   ; $03974F |\
  STA $7B56,y                     ; $039753 | |
  LDA $0A9222,x                   ; $039756 | |
  STA $7B58,y                     ; $03975A | | set clipping
  LDA $0A9224,x                   ; $03975D | |
  STA $7BB6,y                     ; $039761 | |
  LDA $0A9226,x                   ; $039764 | |
  STA $7BB8,y                     ; $039768 |/
  PLX                             ; $03976B |
  LDA $0073                       ; $03976C |
  STA $7400,y                     ; $03976F |
  LDA #$0002                      ; $039772 |\
  STA $6F00,y                     ; $039775 |/ sprite state = 2 (newly inited)
  LDA $7027D4,x                   ; $039778 |
  STA $74A0,y                     ; $03977C |

CODE_03977F:
  TXA                             ; $03977F |
  CLC                             ; $039780 |\
  ADC #$0008                      ; $039781 | | continue loop of new sprites table
  TAX                             ; $039784 | | increment by 8
  JMP CODE_0395D2                 ; $039785 |/

; end check_newspr_column

; something to do with special sprites
  PHB                             ; $039788 |
  PHK                             ; $039789 |
  PLB                             ; $03978A |
  SEC                             ; $03978B |
  SBC #$01BA                      ; $03978C |
  REP #$10                        ; $03978F |
  JSR CODE_03979E                 ; $039791 |
  SEP #$10                        ; $039794 |
  LDA #$00FF                      ; $039796 |
  STA $0C0C,y                     ; $039799 |
  PLB                             ; $03979C |
  RTL                             ; $03979D |

init_special_sprite:

CODE_03979E:
  PHX                             ; $03979E |
  LDY #$0006                      ; $03979F |

CODE_0397A2:
  LDX $0C04,y                     ; $0397A2 |
  BEQ CODE_0397AE                 ; $0397A5 |
  DEY                             ; $0397A7 |
  DEY                             ; $0397A8 |
  BPL CODE_0397A2                 ; $0397A9 |
  PLX                             ; $0397AB |
  CLC                             ; $0397AC |
  RTS                             ; $0397AD |

CODE_0397AE:
  INC A                           ; $0397AE |\
  STA $0C04,y                     ; $0397AF |/  increment and store special sprite ID in table
  ASL A                           ; $0397B2 | multiplying by 2 gives the index into routine tables
  PLX                             ; $0397B3 |
  PHX                             ; $0397B4 |
  PHA                             ; $0397B5 |
  LDA $7027D4,x                   ; $0397B6 |
  STA $0C0C,y                     ; $0397BA |
  LDA $7027D0,x                   ; $0397BD |
  STA $7960                       ; $0397C1 |
  LDA $7027D2,x                   ; $0397C4 |
  STA $7962                       ; $0397C8 |
  PLA                             ; $0397CB |
  TAX                             ; $0397CC |
  JSR ($D46D,x)                   ; $0397CD | sub table for special sprite inits
  PLX                             ; $0397D0 |
  SEC                             ; $0397D1 |
  RTS                             ; $0397D2 |

handle_sprites:
  PHB                             ; $0397D3 |
  PHK                             ; $0397D4 |
  PLB                             ; $0397D5 |
  PHD                             ; $0397D6 |
  REP #$20                        ; $0397D7 |
  LDA #$7960                      ; $0397D9 | set DP for all sprite code
  TCD                             ; $0397DC |
  BRA CODE_0397EC                 ; $0397DD |
  PHB                             ; $0397DF |\
  PHK                             ; $0397E0 | | another entry point
  PLB                             ; $0397E1 | |
  PHD                             ; $0397E2 | |
  REP #$20                        ; $0397E3 | |
  LDA #$7960                      ; $0397E5 | |
  TCD                             ; $0397E8 | |
  JSR CODE_039596                 ; $0397E9 |/

CODE_0397EC:
  LDA $61B0                       ; $0397EC |
  ORA $0B55                       ; $0397EF |
  ORA $0398                       ; $0397F2 |
  BNE CODE_039802                 ; $0397F5 |
  INC $14                         ; $0397F7 |
  LDX #$09                        ; $0397F9 |
  LDA #$884C                      ; $0397FB |
  JSL $7EDE44                     ; $0397FE | GSU init

CODE_039802:
  STZ $607A                       ; $039802 |
  LDA #$29CC                      ; $039805 |
  STA $7029CA                     ; $039808 |
  LDX #$0A                        ; $03980C |
  LDA #$CFED                      ; $03980E |
  JSL $7EDECF                     ; $039811 | GSU init
  LDA #$0008                      ; $039815 |
  STA $6120                       ; $039818 |
  CLC                             ; $03981B |
  ADC $608C                       ; $03981C |
  STA $611C                       ; $03981F |
  LDA #$000C                      ; $039822 |
  LDX $60AE                       ; $039825 |
  CPX #$08                        ; $039828 |
  BNE CODE_03984D                 ; $03982A |
  LDY $6180                       ; $03982C |
  BEQ CODE_039855                 ; $03982F |
  LDA #$0004                      ; $039831 |
  STA $6120                       ; $039834 |
  STA $6122                       ; $039837 |
  LDA #$00FF                      ; $03983A |
  LDY $60C4                       ; $03983D |
  BEQ CODE_039843                 ; $039840 |
  LSR A                           ; $039842 |

CODE_039843:
  EOR $617E                       ; $039843 |
  INC A                           ; $039846 |
  TAY                             ; $039847 |
  LDA #$0015                      ; $039848 |
  BRA CODE_039874                 ; $03984B |

CODE_03984D:
  LDY $60C2                       ; $03984D |
  BEQ CODE_039855                 ; $039850 |
  LDA #$0006                      ; $039852 |

CODE_039855:
  STA $6122                       ; $039855 |
  CPX #$10                        ; $039858 |
  BNE CODE_039886                 ; $03985A |
  LDY $6180                       ; $03985C |
  BEQ CODE_039886                 ; $03985F |
  INC $6122                       ; $039861 |
  LDA $617E                       ; $039864 |
  LDY $60C4                       ; $039867 |
  BNE CODE_039870                 ; $03986A |
  EOR #$00FF                      ; $03986C |
  INC A                           ; $03986F |

CODE_039870:
  TAY                             ; $039870 |
  LDA #$0021                      ; $039871 |

CODE_039874:
  STA $3008                       ; $039874 |
  TYA                             ; $039877 |
  STA $3002                       ; $039878 |
  LDX #$09                        ; $03987B |
  LDA #$F83A                      ; $03987D |
  JSL $7EDE44                     ; $039880 | GSU init
  BRA CODE_039895                 ; $039884 |

CODE_039886:
  SEC                             ; $039886 |
  SBC #$0020                      ; $039887 |
  EOR #$FFFF                      ; $03988A |
  INC A                           ; $03988D |
  CLC                             ; $03988E |
  ADC $6090                       ; $03988F |
  STA $611E                       ; $039892 |

CODE_039895:
  LDX #$09                        ; $039895 |
  LDA #$8084                      ; $039897 |
  JSL $7EDE44                     ; $03989A | GSU init
  LDA $607A                       ; $03989E |\
  BEQ CODE_0398A7                 ; $0398A1 | | play sound
  JSL $0085D2                     ; $0398A3 |/

CODE_0398A7:
  JSL $008AB6                     ; $0398A7 |
  LDA $7E2A                       ; $0398AB |
  DEC A                           ; $0398AE |
  BMI CODE_0398B7                 ; $0398AF |
  LDA #$FFF8                      ; $0398B1 |
  STA $7E2A                       ; $0398B4 |

CODE_0398B7:
  STZ $0CC2                       ; $0398B7 |
  STZ $61BA                       ; $0398BA |
  LDA #$FFFF                      ; $0398BD |
  STA $0D96                       ; $0398C0 |
  LDX #$5C                        ; $0398C3 |

CODE_0398C5:
  LDA $6F00,x                     ; $0398C5 |\
  BEQ CODE_0398DF                 ; $0398C8 | | sprite table loop
  STX $12                         ; $0398CA | | goes from $6F00-6F60
  PHB                             ; $0398CC | | increment in 4's
  LDY $2137                       ; $0398CD | |
  LDY $213F                       ; $0398D0 | |
  LDA $213C                       ; $0398D3 | |
  ADC $10                         ; $0398D6 | | adds horizontal scanline -> RNG
  STA $10                         ; $0398D8 | | this way each sprite gets fresh value
  JSL $039A12                     ; $0398DA | |
  PLB                             ; $0398DE | |

CODE_0398DF:
  DEX                             ; $0398DF | |
  DEX                             ; $0398E0 | |
  DEX                             ; $0398E1 | |
  DEX                             ; $0398E2 | |
  BPL CODE_0398C5                 ; $0398E3 |/
  LDY $0C50                       ; $0398E5 |
  BEQ CODE_0398F7                 ; $0398E8 |
  LDY $0C54                       ; $0398EA |
  CPY #$30                        ; $0398ED |
  BMI CODE_0398F4                 ; $0398EF |
  STZ $0C54                       ; $0398F1 |

CODE_0398F4:
  INC $0C54                       ; $0398F4 |

CODE_0398F7:
  REP #$10                        ; $0398F7 |\
  LDY #$0006                      ; $0398F9 | |

CODE_0398FC:
  LDA $0C04,y                     ; $0398FC | | loops through special sprite ID table
  BEQ CODE_039906                 ; $0398FF | | 4 max, $0C04-$0C0C
  ASL A                           ; $039901 | | ID's in this table are stored as:
  TAX                             ; $039902 | | sprite ID - 0x1B9
  JSR ($D4E3,x)                   ; $039903 | | which is half the index into the init & main routine tables

CODE_039906:
  DEY                             ; $039906 | | an ID of 0 is skipped, so ID's start at 1
  DEY                             ; $039907 | | this mains each special sprite
  BPL CODE_0398FC                 ; $039908 |/
  SEP #$10                        ; $03990A |
  LDA $7E2A                       ; $03990C |
  BPL CODE_039953                 ; $03990F |
  LDA $0D0F                       ; $039911 |
  BNE CODE_039938                 ; $039914 |
  INC $7E2A                       ; $039916 |
  BPL CODE_039956                 ; $039919 |
  LDA $60B0                       ; $03991B |
  CMP #$0038                      ; $03991E |
  BMI CODE_039938                 ; $039921 |
  CMP #$00B8                      ; $039923 |
  BPL CODE_039938                 ; $039926 |
  LDA $60B2                       ; $039928 |
  CMP #$0040                      ; $03992B |
  BMI CODE_039938                 ; $03992E |
  CMP #$0080                      ; $039930 |
  BPL CODE_039938                 ; $039933 |
  JMP CODE_0399BF                 ; $039935 |

CODE_039938:
  LDA #$0001                      ; $039938 |
  STA $61AE                       ; $03993B |
  STA $61B0                       ; $03993E |
  STA $0C1E                       ; $039941 |
  STA $0C20                       ; $039944 |
  LDA $0039                       ; $039947 |
  STA $0C23                       ; $03994A |
  LDA $003B                       ; $03994D |
  STA $0C27                       ; $039950 |

CODE_039953:
  JMP CODE_0399CE                 ; $039953 |

CODE_039956:
  DEC $7E2A                       ; $039956 |
  LDA $0C94                       ; $039959 |
  STA $3002                       ; $03995C |
  LDA $0C96                       ; $03995F |
  STA $3004                       ; $039962 |
  LDA $0C23                       ; $039965 |
  STA $3006                       ; $039968 |
  LDA $0C27                       ; $03996B |
  STA $3008                       ; $03996E |
  LDA #$0600                      ; $039971 |
  STA $300C                       ; $039974 |
  LDX #$09                        ; $039977 |
  LDA #$907C                      ; $039979 |
  JSL $7EDE44                     ; $03997C | GSU init
  LDA $3002                       ; $039980 |
  STA $0C2A                       ; $039983 |
  LDA $3004                       ; $039986 |
  STA $0C2C                       ; $039989 |
  REP #$10                        ; $03998C |
  JSR CODE_03D997                 ; $03998E |
  SEP #$10                        ; $039991 |
  LDA $0C94                       ; $039993 |
  SEC                             ; $039996 |
  SBC $0C23                       ; $039997 |
  BEQ CODE_0399A7                 ; $03999A |
  EOR $0C2A                       ; $03999C |
  BPL CODE_0399CE                 ; $03999F |
  LDA $0C94                       ; $0399A1 |
  STA $0C23                       ; $0399A4 |

CODE_0399A7:
  LDA $0C96                       ; $0399A7 |
  SEC                             ; $0399AA |
  SBC $0C27                       ; $0399AB |
  BEQ CODE_0399BB                 ; $0399AE |
  EOR $0C2C                       ; $0399B0 |
  BPL CODE_0399CE                 ; $0399B3 |
  LDA $0C96                       ; $0399B5 |
  STA $0C27                       ; $0399B8 |

CODE_0399BB:
  JSL $04DCF9                     ; $0399BB |

CODE_0399BF:
  STZ $7E2A                       ; $0399BF |
  STZ $61AE                       ; $0399C2 |
  STZ $61B0                       ; $0399C5 |
  STZ $0C1E                       ; $0399C8 |
  STZ $0C20                       ; $0399CB |

CODE_0399CE:
  SEP #$20                        ; $0399CE |
  PLD                             ; $0399D0 |
  PLB                             ; $0399D1 |
  RTL                             ; $0399D2 |

; sub
  LDA $7E35                       ; $0399D3 |
  AND #$FF00                      ; $0399D6 |
  CLC                             ; $0399D9 |
  ADC $7E32                       ; $0399DA |
  STA $7E32                       ; $0399DD |
  LDA $7E36                       ; $0399E0 |
  AND #$FF00                      ; $0399E3 |
  BPL CODE_0399EB                 ; $0399E6 |
  ORA #$00FF                      ; $0399E8 |

CODE_0399EB:
  XBA                             ; $0399EB |
  ADC $7E2E                       ; $0399EC |
  STA $7E2E                       ; $0399EF |
  LDA $7E37                       ; $0399F2 |
  AND #$FF00                      ; $0399F5 |
  CLC                             ; $0399F8 |
  ADC $7E34                       ; $0399F9 |
  STA $7E34                       ; $0399FC |
  LDA $7E38                       ; $0399FF |
  AND #$FF00                      ; $039A02 |
  BPL CODE_039A0A                 ; $039A05 |
  ORA #$00FF                      ; $039A07 |

CODE_039A0A:
  XBA                             ; $039A0A |
  ADC $7E30                       ; $039A0B |
  STA $7E30                       ; $039A0E |
  RTS                             ; $039A11 |

; does a high-level handling of sprite based on state
handle_sprite:
  LDA $70E2,x                     ; $039A12 |
  STA $6EBC                       ; $039A15 |
  LDA $7182,x                     ; $039A18 |
  STA $6EBE                       ; $039A1B |
  LDA $61B0                       ; $039A1E |
  ORA $0B55                       ; $039A21 |
  ORA $0398                       ; $039A24 |
  BNE CODE_039A49                 ; $039A27 |
  LDA $7A96,x                     ; $039A29 |
  BEQ CODE_039A31                 ; $039A2C |
  DEC $7A96,x                     ; $039A2E |

CODE_039A31:
  LDA $7A98,x                     ; $039A31 |
  BEQ CODE_039A39                 ; $039A34 |
  DEC $7A98,x                     ; $039A36 |

CODE_039A39:
  LDA $7AF6,x                     ; $039A39 |
  BEQ CODE_039A41                 ; $039A3C |
  DEC $7AF6,x                     ; $039A3E |

CODE_039A41:
  LDA $7AF8,x                     ; $039A41 |
  BEQ CODE_039A49                 ; $039A44 |
  DEC $7AF8,x                     ; $039A46 |

CODE_039A49:
  LDY $77C1,x                     ; $039A49 |
  BEQ CODE_039A51                 ; $039A4C |
  DEC $77C1,x                     ; $039A4E |

CODE_039A51:
  LDY $6F00,x                     ; $039A51 |\
  LDA $9A57,y                     ; $039A54 | | indexes into table based on sprite state
  PHA                             ; $039A57 | | effectively jumps to address in table + 1
  RTS                             ; $039A58 |/

; table of addresses used just above, pushed onto stack before RTS'ing
sprite_state_routines:
DATA_039A59:         dw $9A6D, $9A6D, $A246
DATA_039A5F:         dw $9AC7, $A11C, $9F8C
DATA_039A65:         dw $A084, $9A8F, $A00A

; this gets jumped to as a routine for many sprites - insta-return (do nothing)
  RTL                             ; $039A6B |

; perhaps another entry point to init_sprite
  PHK                             ; $039A6C |
  PLB                             ; $039A6D |

; sprite states $02 and $04: newly inited, needs initing
init_sprite:
  LDA #$0010                      ; $039A6E |\
  STA $6F00,x                     ; $039A71 |/  change sprite state to active
  LDA $7360,x                     ; $039A74 |\  grab sprite ID
  ASL A                           ; $039A77 | |
  ADC $7360,x                     ; $039A78 | | multiply by 3
  REP #$10                        ; $039A7B | |
  TAY                             ; $039A7D | | index into table, giving us:
  LDA $8000,y                     ; $039A7E |/  initing routine address
  STA $00                         ; $039A81 |
  LDA $8002,y                     ; $039A83 |
  STA $02                         ; $039A86 |
  SEP #$10                        ; $039A88 |
  TAY                             ; $039A8A |
  PHY                             ; $039A8B |
  PLB                             ; $039A8C |
  JML [$7960]                     ; $039A8D | this should contain the initing routine address loaded just above

; sprite state $10: sprite is alive / active, needs updating
main_sprite:
  LDA $7360,x                     ; $039A90 |
  ASL A                           ; $039A93 |
  ADC $7360,x                     ; $039A94 |
  REP #$10                        ; $039A97 |
  PHX                             ; $039A99 |
  TAX                             ; $039A9A |
  LDA $03852E,x                   ; $039A9B | main routine address
  STA $00                         ; $039A9F |
  LDA $038530,x                   ; $039AA1 |
  STA $02                         ; $039AA5 |
  PLX                             ; $039AA7 |
  SEP #$10                        ; $039AA8 |
  TAY                             ; $039AAA |
  PHY                             ; $039AAB |
  PLB                             ; $039AAC |
  JML [$7960]                     ; $039AAD | this should contain the main routine address loaded just above

; data table
DATA_039AB0:         dw $FF00, $0100
DATA_039AB4:         dw $FFFE, $0002
DATA_039AB8:         dw $000C, $FFF4
DATA_039ABC:         dw $0000, $0000
DATA_039AC0:         dw $FFFC, $FFFC
DATA_039AC4:         dw $FFFA, $FFFA

; sprite state $08 - in yoshi's tongue and/or mouth
tongued_sprite:
  JSL $039A90                     ; $039AC8 |
  LDA $7040,x                     ; $039ACC |
  AND #$FFF3                      ; $039ACF |
  STA $7040,x                     ; $039AD2 |
  PHK                             ; $039AD5 |
  PLB                             ; $039AD6 |
  LDA $61B0                       ; $039AD7 |
  ORA $0B55                       ; $039ADA |
  ORA $0398                       ; $039ADD |
  BEQ CODE_039AE3                 ; $039AE0 |
  RTL                             ; $039AE2 |

CODE_039AE3:
  LDY #$00                        ; $039AE3 |
  LDA $6164                       ; $039AE5 |
  BEQ CODE_039AFD                 ; $039AE8 |
  BPL CODE_039AEE                 ; $039AEA |
  LDY #$02                        ; $039AEC |

CODE_039AEE:
  CLC                             ; $039AEE |
  ADC $9AB4,y                     ; $039AEF |
  STA $6164                       ; $039AF2 |
  EOR $9AB4,y                     ; $039AF5 |
  BMI CODE_039AFD                 ; $039AF8 |
  STZ $6164                       ; $039AFA |

CODE_039AFD:
  LDY #$00                        ; $039AFD |
  LDA $6166                       ; $039AFF |
  BEQ CODE_039B17                 ; $039B02 |
  BPL CODE_039B08                 ; $039B04 |
  LDY #$02                        ; $039B06 |

CODE_039B08:
  CLC                             ; $039B08 |
  ADC $9AB4,y                     ; $039B09 |
  STA $6166                       ; $039B0C |
  EOR $9AB4,y                     ; $039B0F |
  BMI CODE_039B17                 ; $039B12 |
  STZ $6166                       ; $039B14 |

CODE_039B17:
  LDA $615A                       ; $039B17 |
  CLC                             ; $039B1A |
  ADC $6164                       ; $039B1B |
  SEC                             ; $039B1E |
  SBC #$0008                      ; $039B1F |
  STA $70E2,x                     ; $039B22 |
  LDA $615C                       ; $039B25 |
  CLC                             ; $039B28 |
  ADC $6166                       ; $039B29 |
  SEC                             ; $039B2C |
  SBC #$0008                      ; $039B2D |
  STA $7182,x                     ; $039B30 |
  LDA $6152                       ; $039B33 |
  ORA $6154                       ; $039B36 |
  BEQ CODE_039B3C                 ; $039B39 |

CODE_039B3B:
  RTL                             ; $039B3B |

CODE_039B3C:
  SEP #$20                        ; $039B3C |
  LDA #$FF                        ; $039B3E |
  STA $74A2,x                     ; $039B40 |
  LDA $6168                       ; $039B43 |
  BNE CODE_039B4B                 ; $039B46 |
  JMP CODE_039DA7                 ; $039B48 |

CODE_039B4B:
  REP #$20                        ; $039B4B |
  LDA $6162                       ; $039B4D |
  BNE CODE_039B55                 ; $039B50 |
  JMP CODE_039BBC                 ; $039B52 |

CODE_039B55:
  LDA $7360,x                     ; $039B55 |
  CMP #$0022                      ; $039B58 |
  BCC CODE_039B66                 ; $039B5B |
  CMP #$002C                      ; $039B5D |
  BCS CODE_039B66                 ; $039B60 |
  JML $03BF87                     ; $039B62 |

CODE_039B66:
  LDY #$01                        ; $039B66 |
  CMP #$0009                      ; $039B68 |
  BEQ CODE_039B98                 ; $039B6B |
  CMP #$00EC                      ; $039B6D |
  BEQ CODE_039B81                 ; $039B70 |
  CMP #$00ED                      ; $039B72 |
  BEQ CODE_039B81                 ; $039B75 |
  CMP #$0080                      ; $039B77 |
  BEQ CODE_039B81                 ; $039B7A |
  CMP #$0081                      ; $039B7C |
  BNE CODE_039B86                 ; $039B7F |

CODE_039B81:
  STZ $7402,x                     ; $039B81 |
  BRA CODE_039B98                 ; $039B84 |

CODE_039B86:
  INY                             ; $039B86 |
  CMP #$0019                      ; $039B87 |
  BEQ CODE_039B98                 ; $039B8A |
  INY                             ; $039B8C |
  CMP #$0007                      ; $039B8D |
  BEQ CODE_039B98                 ; $039B90 |
  INY                             ; $039B92 |
  CMP #$0005                      ; $039B93 |
  BNE CODE_039B3B                 ; $039B96 |

CODE_039B98:
  STY $616A                       ; $039B98 |
  LDA #$001E                      ; $039B9B |
  LDY $7402,x                     ; $039B9E |
  BEQ CODE_039BA6                 ; $039BA1 |
  LDA #$000A                      ; $039BA3 |

CODE_039BA6:
  STA $6170                       ; $039BA6 |
  STZ $616C                       ; $039BA9 |
  LDA #$0010                      ; $039BAC |
  STA $616E                       ; $039BAF |
  STA $61AE                       ; $039BB2 |
  STA $61B0                       ; $039BB5 |
  JML $03A32E                     ; $039BB8 |

CODE_039BBC:
  LDA $61E0                       ; $039BBC |
  CMP #$0003                      ; $039BBF |
  BCC CODE_039BC7                 ; $039BC2 |
  JMP CODE_039DA6                 ; $039BC4 |

CODE_039BC7:
  LDA $6150                       ; $039BC7 |
  DEC A                           ; $039BCA |
  ASL A                           ; $039BCB |
  ORA $60C4                       ; $039BCC |
  TAY                             ; $039BCF |
  LDA $70E2,x                     ; $039BD0 |
  CLC                             ; $039BD3 |
  ADC $9AB8,y                     ; $039BD4 |
  STA $70E2,x                     ; $039BD7 |
  CLC                             ; $039BDA |
  ADC #$0008                      ; $039BDB |
  STA $3010                       ; $039BDE |
  LDA $7182,x                     ; $039BE1 |
  CLC                             ; $039BE4 |
  ADC $9AC0,y                     ; $039BE5 |
  STA $7182,x                     ; $039BE8 |
  CLC                             ; $039BEB |
  ADC #$0008                      ; $039BEC |
  STA $3000                       ; $039BEF |
  PHY                             ; $039BF2 |
  LDX #$0A                        ; $039BF3 |
  LDA #$CE2F                      ; $039BF5 |
  JSL $7EDE91                     ; $039BF8 | GSU init
  PLY                             ; $039BFC |
  LDX $12                         ; $039BFD |
  LDA $300E                       ; $039BFF |
  AND #$0006                      ; $039C02 |
  BEQ CODE_039C11                 ; $039C05 |
  LDA $6168                       ; $039C07 |
  STA $6162                       ; $039C0A |
  STZ $6150                       ; $039C0D |
  RTL                             ; $039C10 |

CODE_039C11:
  STZ $6150                       ; $039C11 |
  STZ $6168                       ; $039C14 |
  LDA $7360,x                     ; $039C17 |
  CMP #$001E                      ; $039C1A |
  BEQ CODE_039C2E                 ; $039C1D |
  CMP #$0133                      ; $039C1F |
  BEQ CODE_039C2E                 ; $039C22 |
  CMP #$012A                      ; $039C24 |
  BEQ CODE_039C2E                 ; $039C27 |
  CMP #$0074                      ; $039C29 |
  BNE CODE_039C58                 ; $039C2C |

CODE_039C2E:
  CPY #$04                        ; $039C2E |
  BCS CODE_039C45                 ; $039C30 |
  LDA $60C4                       ; $039C32 |
  EOR #$0002                      ; $039C35 |
  STA $7400,x                     ; $039C38 |
  STZ $7220,x                     ; $039C3B |
  JSL $048B73                     ; $039C3E |
  JMP CODE_039D2E                 ; $039C42 |

CODE_039C45:
  LDA #$0E81                      ; $039C45 |
  STA $6FA2,x                     ; $039C48 |
  LDA $7042,x                     ; $039C4B |
  ORA #$0020                      ; $039C4E |
  STA $7042,x                     ; $039C51 |
  STZ $76,x                       ; $039C54 |
  BRA CODE_039CCD                 ; $039C56 |

CODE_039C58:
  CMP #$0017                      ; $039C58 |
  BNE CODE_039C64                 ; $039C5B |
  JSL $0EE0DE                     ; $039C5D |
  JMP CODE_039D2E                 ; $039C61 |

CODE_039C64:
  CMP #$0092                      ; $039C64 |
  BNE CODE_039C7D                 ; $039C67 |
  STZ $7D38,x                     ; $039C69 |
  LDA #$0010                      ; $039C6C |
  STA $7AF6,x                     ; $039C6F |
  LDA #$0002                      ; $039C72 |
  STA $7402,x                     ; $039C75 |
  STA $76,x                       ; $039C78 |
  JMP CODE_039D2E                 ; $039C7A |

CODE_039C7D:
  CPY #$04                        ; $039C7D |
  BCS CODE_039CCD                 ; $039C7F |
  CMP #$019A                      ; $039C81 |
  BNE CODE_039CB0                 ; $039C84 |
  PHY                             ; $039C86 |
  JSL $039D28                     ; $039C87 |
  PLY                             ; $039C8B |
  STY $00                         ; $039C8C |
  JSL $03AF0D                     ; $039C8E |
  JSL $03AD24                     ; $039C92 |
  LDY #$00                        ; $039C96 |
  STY $78,x                       ; $039C98 |
  LDY $00                         ; $039C9A |
  PHB                             ; $039C9C |
  LDA #$000C                      ; $039C9D |
  XBA                             ; $039CA0 |
  PHA                             ; $039CA1 |
  PLB                             ; $039CA2 |
  PLB                             ; $039CA3 |
  PHY                             ; $039CA4 |
  JSL $0C8E07                     ; $039CA5 |
  PLY                             ; $039CA9 |
  JSL $0C8D6A                     ; $039CAA |
  PLB                             ; $039CAE |
  RTL                             ; $039CAF |

CODE_039CB0:
  CMP #$00F3                      ; $039CB0 |
  BNE CODE_039CCD                 ; $039CB3 |
  PHY                             ; $039CB5 |
  JSL $039D28                     ; $039CB6 |
  PLY                             ; $039CBA |
  PHB                             ; $039CBB |
  LDY #$0C                        ; $039CBC |
  PHY                             ; $039CBE |
  PLB                             ; $039CBF |
  JSL $0CFEDD                     ; $039CC0 |
  PLB                             ; $039CC4 |
  SEP #$20                        ; $039CC5 |
  STZ $7901,x                     ; $039CC7 |
  REP #$20                        ; $039CCA |
  RTL                             ; $039CCC |

CODE_039CCD:
  REP #$10                        ; $039CCD |
  LDA $7360,x                     ; $039CCF |
  ASL A                           ; $039CD2 |
  TAX                             ; $039CD3 |
  LDA $0AAB14,x                   ; $039CD4 |
  SEP #$10                        ; $039CD8 |
  LDX $12                         ; $039CDA |
  CMP #$0000                      ; $039CDC |
  BEQ CODE_039D09                 ; $039CDF |
  PHP                             ; $039CE1 |
  JSL $03AF0D                     ; $039CE2 |
  PLP                             ; $039CE6 |
  BMI CODE_039CFA                 ; $039CE7 |
  JSL $03AD24                     ; $039CE9 |
  BCC CODE_039D09                 ; $039CED |
  LDA #$0100                      ; $039CEF |
  ORA $7402,x                     ; $039CF2 |
  STA $7402,x                     ; $039CF5 |
  BRA CODE_039D09                 ; $039CF8 |

CODE_039CFA:
  JSL $03AD74                     ; $039CFA |
  BCC CODE_039D09                 ; $039CFE |
  LDA #$0200                      ; $039D00 |
  ORA $7402,x                     ; $039D03 |
  STA $7402,x                     ; $039D06 |

CODE_039D09:
  STZ $18,x                       ; $039D09 |
  STZ $16,x                       ; $039D0B |
  LDA #$0400                      ; $039D0D |
  STA $75E2,x                     ; $039D10 |
  LDA #$0040                      ; $039D13 |
  STA $7542,x                     ; $039D16 |
  STZ $7540,x                     ; $039D19 |
  LDA $6FA2,x                     ; $039D1C |
  AND #$F83F                      ; $039D1F |
  ORA #$0040                      ; $039D22 |
  STA $6FA2,x                     ; $039D25 |
  LDA #$0020                      ; $039D28 | -- entry point
  STA $7D38,x                     ; $039D2B |

CODE_039D2E:
  LDX $12                         ; $039D2E |
  LDA $60E4                       ; $039D30 |
  EOR $60A8                       ; $039D33 |
  ASL A                           ; $039D36 |
  LDA $60E4                       ; $039D37 |
  BCS CODE_039D3F                 ; $039D3A |
  ADC $60A8                       ; $039D3C |

CODE_039D3F:
  STA $7220,x                     ; $039D3F |
  LDA $60E6                       ; $039D42 |
  SEC                             ; $039D45 |
  SBC #$0300                      ; $039D46 |
  BPL CODE_039D4E                 ; $039D49 |
  LDA #$0000                      ; $039D4B |

CODE_039D4E:
  SEC                             ; $039D4E |
  SBC #$0200                      ; $039D4F |
  ADC $60E6                       ; $039D52 |
  STA $7222,x                     ; $039D55 |
  LDA $60C4                       ; $039D58 |
  EOR #$0002                      ; $039D5B |
  STA $7400,x                     ; $039D5E |
  LDA #$0004                      ; $039D61 |\ play sound #$0004
  JSL $0085D2                     ; $039D64 |/
  LDA #$0010                      ; $039D68 |
  STA $6F00,x                     ; $039D6B |
  LDA #$00FF                      ; $039D6E |
  ORA $7862,x                     ; $039D71 |
  STA $7862,x                     ; $039D74 |
  TXY                             ; $039D77 |
  REP #$10                        ; $039D78 |
  LDA $7360,y                     ; $039D7A |
  ASL A                           ; $039D7D |
  TAX                             ; $039D7E |
  LDA $0A9F1A,x                   ; $039D7F |
  AND #$00FF                      ; $039D83 |
  STA $74A2,y                     ; $039D86 |
  LDA $7360,y                     ; $039D89 |
  CMP #$0108                      ; $039D8C |
  BNE CODE_039D96                 ; $039D8F |
  LDA $7900,y                     ; $039D91 |
  BNE CODE_039D9A                 ; $039D94 |

CODE_039D96:
  LDA $0A9B1C,x                   ; $039D96 |

CODE_039D9A:
  AND #$000C                      ; $039D9A |
  ORA $7040,y                     ; $039D9D |
  STA $7040,y                     ; $039DA0 |
  SEP #$10                        ; $039DA3 |
  TYX                             ; $039DA5 |

CODE_039DA6:
  RTL                             ; $039DA6 |

CODE_039DA7:
  REP #$20                        ; $039DA7 |
  LDA $0B57                       ; $039DA9 |
  ORA $0B59                       ; $039DAC |
  BEQ CODE_039DB5                 ; $039DAF |
  JML $03A32E                     ; $039DB1 |

CODE_039DB5:
  PHB                             ; $039DB5 |
  PHK                             ; $039DB6 |
  PLB                             ; $039DB7 |
  LDA $6150                       ; $039DB8 |
  BEQ CODE_039DC5                 ; $039DBB |
  CMP #$0043                      ; $039DBD |
  BCS CODE_039DC5                 ; $039DC0 |
  JMP CODE_039ECE                 ; $039DC2 |

CODE_039DC5:
  LDA $6FA2,x                     ; $039DC5 |
  BPL CODE_039DCD                 ; $039DC8 |
  JMP CODE_039E4E                 ; $039DCA |

CODE_039DCD:
  JSL $04D1B6                     ; $039DCD |
  LDA #$003B                      ; $039DD1 |
  JSL $03B212                     ; $039DD4 |
  JSL $03AF0D                     ; $039DD8 |
  LDA $7360,x                     ; $039DDC |
  CMP #$008B                      ; $039DDF |
  BNE CODE_039E01                 ; $039DE2 |
  JSL $03A32E                     ; $039DE4 |
  LDA #$0087                      ; $039DE8 |
  TXY                             ; $039DEB |
  JSL $03A366                     ; $039DEC |
  LDY $60C4                       ; $039DF0 |
  LDA $9AB0,y                     ; $039DF3 |
  STA $7220,x                     ; $039DF6 |
  LDA #$FE00                      ; $039DF9 |
  STA $7222,x                     ; $039DFC |
  BRA CODE_039E36                 ; $039DFF |

CODE_039E01:
  CMP #$0129                      ; $039E01 |
  BNE CODE_039E09                 ; $039E04 |
  JMP CODE_039ED4                 ; $039E06 |

CODE_039E09:
  CMP #$012B                      ; $039E09 |
  BEQ CODE_039E1C                 ; $039E0C |
  JSL $05AD01                     ; $039E0E |
  LDA #$0025                      ; $039E12 |
  LDY $0146                       ; $039E15 |
  CPY #$0D                        ; $039E18 |
  BNE CODE_039E1F                 ; $039E1A |

CODE_039E1C:
  LDA #$002B                      ; $039E1C |

CODE_039E1F:
  STZ $6F00,x                     ; $039E1F |
  TXY                             ; $039E22 |
  JSL $03A366                     ; $039E23 | get sprite slot
  LDA #$0010                      ; $039E27 |\
  STA $6F00,x                     ; $039E2A |/ create sprite
  JSL $03BEB9                     ; $039E2D |
  LDA #$FFA2                      ; $039E31 |
  STA $76,x                       ; $039E34 |

CODE_039E36:
  LDA $608C                       ; $039E36 |
  STA $70E2,x                     ; $039E39 |
  LDA $6090                       ; $039E3C |
  CLC                             ; $039E3F |
  ADC #$0010                      ; $039E40 |
  STA $7182,x                     ; $039E43 |
  LDA $60C4                       ; $039E46 |
  STA $7400,x                     ; $039E49 |
  PLB                             ; $039E4C |
  RTL                             ; $039E4D |

CODE_039E4E:
  LDA $7360,x                     ; $039E4E |
  CMP #$01A2                      ; $039E51 |
  BNE CODE_039E85                 ; $039E54 |
  LDA #$0009                      ; $039E56 |\ play sound #$0009
  JSL $0085D2                     ; $039E59 |/
  LDA $70E2,x                     ; $039E5D |
  STA $0000                       ; $039E60 |
  LDA $7182,x                     ; $039E63 |
  STA $0002                       ; $039E66 |
  LDA #$0003                      ; $039E69 |
  STA $0004                       ; $039E6C |
  JSL $03A4C3                     ; $039E6F |
  LDA $0396                       ; $039E73 |
  CLC                             ; $039E76 |
  ADC #$000A                      ; $039E77 |
  STA $0396                       ; $039E7A |
  LDA #$0082                      ; $039E7D |
  STA $0B7F                       ; $039E80 |
  BRA CODE_039EC6                 ; $039E83 |

CODE_039E85:
  CMP #$0115                      ; $039E85 |
  BNE CODE_039EB7                 ; $039E88 |
  LDA $7042,x                     ; $039E8A |
  BIT #$0002                      ; $039E8D |
  BEQ CODE_039EA6                 ; $039E90 |
  LDA #$0093                      ; $039E92 |
  INC $03B4                       ; $039E95 |
  LDY $03B4                       ; $039E98 |
  CPY #$14                        ; $039E9B |
  BMI CODE_039EA0                 ; $039E9D |
  INC A                           ; $039E9F |

CODE_039EA0:
  JSL $0085D2                     ; $039EA0 |
  BRA CODE_039EAD                 ; $039EA4 |

CODE_039EA6:
  LDA #$0009                      ; $039EA6 |\ play sound #$0009
  JSL $0085D2                     ; $039EA9 |/

CODE_039EAD:
  JSL $03A520                     ; $039EAD |
  JSL $0CF957                     ; $039EB1 |
  BRA CODE_039ECA                 ; $039EB5 |

CODE_039EB7:
  CMP #$01B2                      ; $039EB7 |
  BNE CODE_039EC6                 ; $039EBA |
  LDA #$0009                      ; $039EBC |\ play sound #$0009
  JSL $0085D2                     ; $039EBF |/
  INC $03BA                       ; $039EC3 |

CODE_039EC6:
  JSL $03B288                     ; $039EC6 |

CODE_039ECA:
  JSL $03A32E                     ; $039ECA |

CODE_039ECE:
  PLB                             ; $039ECE |
  RTL                             ; $039ECF |
; data table
DATA_039ED0:         dw $FFF8
DATA_039ED2:         dw $0018
; continue tongued_sprite
CODE_039ED4:
  LDA #$0021                      ; $039ED4 |
  JSL $0085D2                     ; $039ED7 |
  LDA #$0400                      ; $039EDB |
  STA $7FE8                       ; $039EDE |
  LDA #$0003                      ; $039EE1 |
  STA $61CA                       ; $039EE4 |
  LDA #$0010                      ; $039EE7 |
  STA $0B55                       ; $039EEA |
  JSL $03A31E                     ; $039EED |
  LDA #$00B3                      ; $039EF1 |
  TXY                             ; $039EF4 |
  JSL $03A366                     ; $039EF5 |
  LDA #$0040                      ; $039EF9 |
  STA $7A96,x                     ; $039EFC |
  LDA #$0001                      ; $039EFF |
  STA $7D38,x                     ; $039F02 |
  LDY $60C4                       ; $039F05 |
  LDA $608C                       ; $039F08 |
  CLC                             ; $039F0B |
  ADC $9ED0,y                     ; $039F0C |
  STA $7CD6,x                     ; $039F0F |
  SEC                             ; $039F12 |
  SBC #$0008                      ; $039F13 |
  STA $70E2,x                     ; $039F16 |
  LDA $6090                       ; $039F19 |
  CLC                             ; $039F1C |
  ADC #$0010                      ; $039F1D |
  STA $7CD8,x                     ; $039F20 |
  SEC                             ; $039F23 |
  SBC #$0008                      ; $039F24 |
  STA $7182,x                     ; $039F27 |
  PLB                             ; $039F2A |
  LDA #$01E6                      ; $039F2B | entry point
  JSL $008B21                     ; $039F2E |
  LDA $7CD6,x                     ; $039F32 |
  STA $70A2,y                     ; $039F35 |
  LDA $7CD8,x                     ; $039F38 |
  STA $7142,y                     ; $039F3B |
  LDA #$0004                      ; $039F3E |
  STA $7782,y                     ; $039F41 |
  LDA #$0006                      ; $039F44 |
  STA $73C2,y                     ; $039F47 |
  STA $7E4C,y                     ; $039F4A |
  RTL                             ; $039F4D |
; end tongued_sprite

main_fuzzy_wind:
  LDA $61B0                       ; $039F4E |
  ORA $0B55                       ; $039F51 |
  ORA $0398                       ; $039F54 |
  BEQ CODE_039F5A                 ; $039F57 |
  RTL                             ; $039F59 |

CODE_039F5A:
  LDA $7A96,x                     ; $039F5A |
  BNE CODE_039F62                 ; $039F5D |
  JMP CODE_03A31E                 ; $039F5F |

CODE_039F62:
  LDY $7D36,x                     ; $039F62 |
  DEY                             ; $039F65 |
  BMI CODE_039F8C                 ; $039F66 |
  LDA $6F00,y                     ; $039F68 |
  CMP #$0010                      ; $039F6B |
  BNE CODE_039F8C                 ; $039F6E |
  LDA $7D96,y                     ; $039F70 |
  BEQ CODE_039F7D                 ; $039F73 |
  TYX                             ; $039F75 |
  JSL $03B595                     ; $039F76 |
  LDX $12                         ; $039F7A |
  RTL                             ; $039F7C |

CODE_039F7D:
  LDA $6FA0,y                     ; $039F7D |
  AND #$0020                      ; $039F80 |
  BNE CODE_039F8C                 ; $039F83 |
  TYX                             ; $039F85 |
  JSL $03B25B                     ; $039F86 |
  LDX $12                         ; $039F8A |

CODE_039F8C:
  RTL                             ; $039F8C |

; sprite state $0C: dying from collision
  JSL $039A90                     ; $039F8D |
  JSL $03A31E                     ; $039F91 |
  TXY                             ; $039F95 |
  JML $03B4D6                     ; $039F96 |

; random RTL, might be unused
  RTL                             ; $039F9A |

head_bop_flashing_egg:
  JSL $03B75E                     ; $039F9B |

; a very common head bop routine for many sprites
; list includes:
; watermelons, seeds, eggs, keys, chickens, mice, giant shy guys,
; toadies, woozy guys, stretch guys, penguins, monkeys
head_bop_common:
  JSL $039A90                     ; $039F9F |
  LDA $7040,x                     ; $039FA3 |
  AND #$FFF3                      ; $039FA6 |
  ORA #$0004                      ; $039FA9 |
  STA $7040,x                     ; $039FAC |
  LDA $7042,x                     ; $039FAF |
  ORA #$0080                      ; $039FB2 |
  AND #$00CF                      ; $039FB5 |
  ORA #$0020                      ; $039FB8 |
  LDY $7862,x                     ; $039FBB |
  DEY                             ; $039FBE |
  BPL CODE_039FC4                 ; $039FBF |
  ORA #$0030                      ; $039FC1 |

CODE_039FC4:
  STA $7042,x                     ; $039FC4 |
  STZ $74A2,x                     ; $039FC7 |
  LDA #$0040                      ; $039FCA |
  STA $7542,x                     ; $039FCD |
  LDA #$0400                      ; $039FD0 |
  STA $75E2,x                     ; $039FD3 |
  LDA $6FA0,x                     ; $039FD6 |
  AND #$F9FF                      ; $039FD9 |
  STA $6FA0,x                     ; $039FDC |
  LDA $6FA2,x                     ; $039FDF |
  AND #$FFE0                      ; $039FE2 |
  STA $6FA2,x                     ; $039FE5 |
  RTL                             ; $039FE8 |

; data table
DATA_039FE9:         dw $FF80
DATA_039FEB:         dw $0080

; pack of 4 toadies that chase Baby Mario
head_bop_4_toadies:
  LDA $7682,x                     ; $039FED |
  CMP #$00F0                      ; $039FF0 |
  BMI CODE_039FF9                 ; $039FF3 |
  JML $03A31E                     ; $039FF5 |

CODE_039FF9:
  LDY #$00                        ; $039FF9 |
  LDA $70E2,x                     ; $039FFB |
  CMP $18,x                       ; $039FFE |
  BPL CODE_03A004                 ; $03A000 |
  LDY #$02                        ; $03A002 |

CODE_03A004:
  LDA $9FE9,y                     ; $03A004 |
  STA $75E0,x                     ; $03A007 |
  RTL                             ; $03A00A |

; sprite state $12: burning to death
  JSL $039A90                     ; $03A00B | call $10 first
  LDA #$0060                      ; $03A00F |
  STA $6FA0,x                     ; $03A012 |
  LDA $6FA2,x                     ; $03A015 |
  AND #$FFE0                      ; $03A018 |
  STA $6FA2,x                     ; $03A01B |
  LDA $7040,x                     ; $03A01E |\
  AND #$FFF3                      ; $03A021 | | set drawing method
  ORA #$0004                      ; $03A024 | | to $01
  STA $7040,x                     ; $03A027 |/
  LDA $7042,x                     ; $03A02A |
  AND #$00CF                      ; $03A02D |
  ORA #$0020                      ; $03A030 |
  LDY $7862,x                     ; $03A033 |
  DEY                             ; $03A036 |
  BPL CODE_03A03C                 ; $03A037 |
  ORA #$0030                      ; $03A039 |

CODE_03A03C:
  STA $7042,x                     ; $03A03C |
  STZ $74A2,x                     ; $03A03F |
  LDA #$0040                      ; $03A042 |
  STA $7542,x                     ; $03A045 |
  LDA #$0400                      ; $03A048 |
  STA $75E2,x                     ; $03A04B |
  LDA $7A96,x                     ; $03A04E |
  BNE CODE_03A084                 ; $03A051 |
  LDA #$0008                      ; $03A053 |
  STA $7A96,x                     ; $03A056 |
  LDA #$01DF                      ; $03A059 |
  JSL $008B21                     ; $03A05C |
  LDA $70E2,x                     ; $03A060 |
  STA $70A2,y                     ; $03A063 |
  LDA $7182,x                     ; $03A066 |
  STA $7142,y                     ; $03A069 |
  LDA #$0005                      ; $03A06C |
  STA $7E4C,y                     ; $03A06F |
  LDA #$0005                      ; $03A072 |
  STA $73C2,y                     ; $03A075 |
  LDA #$0004                      ; $03A078 |
  STA $7782,y                     ; $03A07B |
  LDA #$FE80                      ; $03A07E |
  STA $71E2,y                     ; $03A081 |

CODE_03A084:
  RTL                             ; $03A084 |

; sprite state $0E: on head bop
sprite_on_head_bop:
  LDA $7360,x                     ; $03A085 |
  ASL A                           ; $03A088 |
  ADC $7360,x                     ; $03A089 |
  REP #$10                        ; $03A08C |
  TAY                             ; $03A08E |
  LDA $8A5C,y                     ; $03A08F | head_bops routine address
  STA $00                         ; $03A092 |
  LDA $8A5E,y                     ; $03A094 |
  STA $02                         ; $03A097 |
  SEP #$10                        ; $03A099 |
  TAY                             ; $03A09B |
  PHY                             ; $03A09C |
  PLB                             ; $03A09D |
  JML [$7960]                     ; $03A09E | this should contain the head_bops routine address loaded just above

; sub
  LDA $0CCE                       ; $03A0A1 |
  BNE CODE_03A0E4                 ; $03A0A4 |
  LDA #$0010                      ; $03A0A6 |
  STA $0CCE                       ; $03A0A9 |
  LDA #$000C                      ; $03A0AC |\ play sound #$000C
  JSL $0085D2                     ; $03A0AF |/
  LDA #$01BE                      ; $03A0B3 |
  JSL $008B21                     ; $03A0B6 |
  LDA $7C76,x                     ; $03A0BA |
  CMP #$8000                      ; $03A0BD |
  ROR A                           ; $03A0C0 |
  CLC                             ; $03A0C1 |
  ADC $7CD6,x                     ; $03A0C2 |
  SEC                             ; $03A0C5 |
  SBC #$0008                      ; $03A0C6 |
  STA $70A2,y                     ; $03A0C9 |
  LDA $7C78,x                     ; $03A0CC |
  CMP #$8000                      ; $03A0CF |
  ROR A                           ; $03A0D2 |
  CLC                             ; $03A0D3 |
  ADC $7CD8,x                     ; $03A0D4 |
  SEC                             ; $03A0D7 |
  SBC #$0008                      ; $03A0D8 |

CODE_03A0DB:
  STA $7142,y                     ; $03A0DB |
  LDA #$0005                      ; $03A0DE |
  STA $7782,y                     ; $03A0E1 |

CODE_03A0E4:
  RTL                             ; $03A0E4 |
  LDY #$0C                        ; $03A0E5 |
  LDA $0CCE                       ; $03A0E7 |
  BNE CODE_03A0E4                 ; $03A0EA |
  TYA                             ; $03A0EC |
  JSL $0085D2                     ; $03A0ED |
  LDA #$0010                      ; $03A0F1 |
  STA $0CCE                       ; $03A0F4 |
  LDA #$01BE                      ; $03A0F7 |
  JSL $008B21                     ; $03A0FA |
  LDA $7C16,x                     ; $03A0FE |
  CMP #$8000                      ; $03A101 |
  ROR A                           ; $03A104 |
  CLC                             ; $03A105 |
  ADC $608C                       ; $03A106 |
  STA $70A2,y                     ; $03A109 |
  LDA $7C18,x                     ; $03A10C |
  CMP #$8000                      ; $03A10F |
  ROR A                           ; $03A112 |
  CLC                             ; $03A113 |
  ADC $6122                       ; $03A114 |
  CLC                             ; $03A117 |
  ADC $6090                       ; $03A118 |
  BRA CODE_03A0DB                 ; $03A11B |

; sprite state $0A: riding yoshi
sprite_riding_yoshi:
  JSL $039A90                     ; $03A11D |
  PHK                             ; $03A121 |
  PLB                             ; $03A122 |
  STZ $7220,x                     ; $03A123 |
  STZ $7222,x                     ; $03A126 |
  LDA $7AF8,x                     ; $03A129 |
  BEQ CODE_03A147                 ; $03A12C |
  LDA #$0010                      ; $03A12E |
  SEC                             ; $03A131 |
  SBC $7AF8,x                     ; $03A132 |
  LSR A                           ; $03A135 |
  INC A                           ; $03A136 |
  CMP #$0004                      ; $03A137 |
  BCC CODE_03A13F                 ; $03A13A |
  LDA #$0003                      ; $03A13C |

CODE_03A13F:
  CMP $60C2                       ; $03A13F |
  BCC CODE_03A147                 ; $03A142 |
  STA $60C2                       ; $03A144 |

CODE_03A147:
  REP #$10                        ; $03A147 |
  LDY $60BE                       ; $03A149 |
  LDA $F8E1,y                     ; $03A14C |
  AND #$FF00                      ; $03A14F |
  BPL CODE_03A157                 ; $03A152 |
  ORA #$00FF                      ; $03A154 |

CODE_03A157:
  XBA                             ; $03A157 |
  CLC                             ; $03A158 |
  ADC $6090                       ; $03A159 |
  STA $7182,x                     ; $03A15C |
  LDA $F6DE,y                     ; $03A15F |
  LDY $611A                       ; $03A162 |
  DEY                             ; $03A165 |
  BMI CODE_03A173                 ; $03A166 |
  LDY #$0004                      ; $03A168 |
  AND #$0040                      ; $03A16B |
  BEQ CODE_03A173                 ; $03A16E |
  LDY #$0002                      ; $03A170 |

CODE_03A173:
  SEP #$20                        ; $03A173 |
  TYA                             ; $03A175 |
  STA $74A2,x                     ; $03A176 |
  REP #$20                        ; $03A179 |
  LDY $60BE                       ; $03A17B |
  LDA $F6DD,y                     ; $03A17E |
  AND #$BF00                      ; $03A181 |
  BPL CODE_03A189                 ; $03A184 |
  ORA #$40FF                      ; $03A186 |

CODE_03A189:
  XBA                             ; $03A189 |
  LDY $60C4                       ; $03A18A |
  BNE CODE_03A193                 ; $03A18D |
  EOR #$FFFF                      ; $03A18F |
  INC A                           ; $03A192 |

CODE_03A193:
  CLC                             ; $03A193 |
  ADC $608C                       ; $03A194 |
  STA $70E2,x                     ; $03A197 |
  LDA $60C4                       ; $03A19A |
  STA $7400,x                     ; $03A19D |
  SEP #$10                        ; $03A1A0 |
  LDA $7360,x                     ; $03A1A2 |
  ASL A                           ; $03A1A5 |
  ADC $7360,x                     ; $03A1A6 |
  REP #$10                        ; $03A1A9 |
  TAY                             ; $03A1AB |
  LDA $8F8A,y                     ; $03A1AC | riding_yoshi routine address
  STA $00                         ; $03A1AF |
  LDA $8F8C,y                     ; $03A1B1 |
  STA $02                         ; $03A1B4 |
  SEP #$10                        ; $03A1B6 |
  TAY                             ; $03A1B8 |
  PHY                             ; $03A1B9 |
  PLB                             ; $03A1BA |
  JML [$7960]                     ; $03A1BB | this should contain the riding_yoshi routine address loaded just above

; sub
  LDY $7D36,x                     ; $03A1BE |
  BPL CODE_03A1CB                 ; $03A1C1 |
  JSL $03D35D                     ; $03A1C3 |
  TYX                             ; $03A1C7 |
  JSR ($A1CC,x)                   ; $03A1C8 |

CODE_03A1CB:
  RTL                             ; $03A1CB |

; sub address table (referenced just above)
DATA_03A1CC:         dw $A1D4, $A1D4
DATA_03A1D0:         dw $A209, $A22E

; one of the $A1CC table subs
  LDX $12                         ; $03A1D4 |

CODE_03A1D6:
  STZ $7540,x                     ; $03A1D6 | entry point
  LDA $60A8                       ; $03A1D9 |
  CMP #$8000                      ; $03A1DC |
  ROR A                           ; $03A1DF |
  STA $60A8                       ; $03A1E0 |
  LDA $60A8                       ; $03A1E3 |
  CMP #$8000                      ; $03A1E6 |
  ROR A                           ; $03A1E9 |
  STA $7220,x                     ; $03A1EA |
  BMI CODE_03A1F3                 ; $03A1ED |
  EOR #$FFFF                      ; $03A1EF |
  INC A                           ; $03A1F2 |

CODE_03A1F3:
  CLC                             ; $03A1F3 |
  ADC #$FCC0                      ; $03A1F4 |
  STA $7222,x                     ; $03A1F7 |

CODE_03A1FA:
  LDA $7D96,x                     ; $03A1FA |
  BNE CODE_03A204                 ; $03A1FD |
  JSL $03B51F                     ; $03A1FF |
  RTS                             ; $03A203 |

CODE_03A204:
  JSL $03B595                     ; $03A204 |
  RTS                             ; $03A208 |

; one of the $A1CC table subs
  LDX $12                         ; $03A209 |
  STZ $7540,x                     ; $03A20B |
  LDA $7C16,x                     ; $03A20E |
  ASL A                           ; $03A211 |
  ASL A                           ; $03A212 |
  ASL A                           ; $03A213 |
  ASL A                           ; $03A214 |
  ASL A                           ; $03A215 |
  STA $7220,x                     ; $03A216 |
  LDA $60AA                       ; $03A219 |
  BPL CODE_03A221                 ; $03A21C |
  STZ $60AA                       ; $03A21E |

CODE_03A221:
  CMP #$FC00                      ; $03A221 |
  BMI CODE_03A229                 ; $03A224 |
  LDA #$FC00                      ; $03A226 |

CODE_03A229:
  STA $7222,x                     ; $03A229 |
  BRA CODE_03A1FA                 ; $03A22C |

; one of the $A1CC table subs
  LDX $12                         ; $03A22E |
  STZ $7540,x                     ; $03A230 |
  STZ $7220,x                     ; $03A233 |
  STZ $7222,x                     ; $03A236 |
  LDA #$FC00                      ; $03A239 |
  STA $60AA                       ; $03A23C |
  LDA #$8001                      ; $03A23F |
  STA $60D2                       ; $03A242 |
  BRA CODE_03A1FA                 ; $03A245 |

; sprite state $06: turning into a star
  JSL $02808C                     ; $03A247 |
  JSL $039A90                     ; $03A24B |
  PHK                             ; $03A24F |
  PLB                             ; $03A250 |
  LDA #$003B                      ; $03A251 |\ play sound #$003B
  JSL $0085D2                     ; $03A254 | play sound/
  SEP #$20                        ; $03A258 |
  LDA $74A0,x                     ; $03A25A |
  PHA                             ; $03A25D |
  LDA #$FF                        ; $03A25E |
  STA $74A0,x                     ; $03A260 |
  REP #$20                        ; $03A263 |
  JSL $03A31E                     ; $03A265 |
  LDA $0B91,x                     ; $03A269 |
  BPL CODE_03A27D                 ; $03A26C |
  LDA #$0004                      ; $03A26E |
  JSL $03A4E9                     ; $03A271 |
  PLY                             ; $03A275 |
  LDA #$0009                      ; $03A276 |
  JML $0085D2                     ; $03A279 |

CODE_03A27D:
  TXY                             ; $03A27D |
  JSL $03A34E                     ; $03A27E |
  SEP #$20                        ; $03A282 |
  PLA                             ; $03A284 |
  STA $74A0,x                     ; $03A285 |
  REP #$20                        ; $03A288 |
  LDA $7360,x                     ; $03A28A |
  CMP #$0115                      ; $03A28D |
  BNE CODE_03A298                 ; $03A290 |
  LDA #$FD00                      ; $03A292 |
  STA $7222,x                     ; $03A295 |

CODE_03A298:
  RTL                             ; $03A298 |

; l sub
  LDA $7680,x                     ; $03A299 |
  CLC                             ; $03A29C |
  ADC #$0100                      ; $03A29D |
  CMP #$0300                      ; $03A2A0 |
  BCS CODE_03A2AF                 ; $03A2A3 |
  LDA $7682,x                     ; $03A2A5 |
  CLC                             ; $03A2A8 |
  ADC #$0100                      ; $03A2A9 |
  CMP #$02E0                      ; $03A2AC |

CODE_03A2AF:
  RTL                             ; $03A2AF |

; l sub
  LDA $7680,x                     ; $03A2B0 |
  CLC                             ; $03A2B3 |
  ADC #$0080                      ; $03A2B4 |
  CMP #$0200                      ; $03A2B7 |
  BCS CODE_03A2C6                 ; $03A2BA |
  LDA $7682,x                     ; $03A2BC |
  CLC                             ; $03A2BF |
  ADC #$0080                      ; $03A2C0 |
  CMP #$01E0                      ; $03A2C3 |

CODE_03A2C6:
  RTL                             ; $03A2C6 |

; l sub
  LDA $7680,x                     ; $03A2C7 |
  CLC                             ; $03A2CA |
  ADC #$0040                      ; $03A2CB |
  CMP #$0180                      ; $03A2CE |
  BCS CODE_03A2DD                 ; $03A2D1 |
  LDA $7682,x                     ; $03A2D3 |
  CLC                             ; $03A2D6 |
  ADC #$0040                      ; $03A2D7 |
  CMP #$0160                      ; $03A2DA |

CODE_03A2DD:
  RTL                             ; $03A2DD |

; seems to be sprite despawn
  LDA $7680,x                     ; $03A2DE |
  CLC                             ; $03A2E1 |
  ADC #$0080                      ; $03A2E2 |
  CMP #$0200                      ; $03A2E5 |
  BCS CODE_03A310                 ; $03A2E8 |
  LDA $7682,x                     ; $03A2EA |
  CLC                             ; $03A2ED |
  ADC #$0080                      ; $03A2EE |
  CMP #$01E0                      ; $03A2F1 |
  BCS CODE_03A310                 ; $03A2F4 |
  BRA CODE_03A34B                 ; $03A2F6 |
  LDA $7680,x                     ; $03A2F8 |
  CLC                             ; $03A2FB |
  ADC #$0040                      ; $03A2FC |
  CMP #$0180                      ; $03A2FF |
  BCS CODE_03A310                 ; $03A302 |
  LDA $7682,x                     ; $03A304 |
  CLC                             ; $03A307 |
  ADC #$0040                      ; $03A308 |
  CMP #$0160                      ; $03A30B |
  BCC CODE_03A34B                 ; $03A30E |

CODE_03A310:
  LDA $7E2A                       ; $03A310 |
  BEQ CODE_03A31E                 ; $03A313 |
  TXA                             ; $03A315 |
  LSR A                           ; $03A316 |
  LSR A                           ; $03A317 |
  TAY                             ; $03A318 |
  LDA $0C98,y                     ; $03A319 |
  BNE CODE_03A34B                 ; $03A31C |

CODE_03A31E:
  SEP #$20                        ; $03A31E | common entry point
  PHX                             ; $03A320 |
  LDA $74A0,x                     ; $03A321 |
  TAX                             ; $03A324 |
  LDA #$00                        ; $03A325 |
  STA $7028CA,x                   ; $03A327 |
  PLX                             ; $03A32B |
  REP #$20                        ; $03A32C |

CODE_03A32E:
  STZ $6F00,x                     ; $03A32E | entry point
  LDA #$00FF                      ; $03A331 | entry point
  STA $74A2,x                     ; $03A334 |
  LDY $7722,x                     ; $03A337 |
  BMI CODE_03A342                 ; $03A33A |
  LDA $7ECE,y                     ; $03A33C |
  TRB $7ECC                       ; $03A33F |

CODE_03A342:
  CPX $61B6                       ; $03A342 |
  BNE CODE_03A34A                 ; $03A345 |
  STZ $61B6                       ; $03A347 |

CODE_03A34A:
  SEC                             ; $03A34A |

CODE_03A34B:
  RTL                             ; $03A34B |

; this routine finds a free slot in the sprite table
; and then calls init_sprite with the passed in ID
; (via accumulator)
spawn_sprite_freeslot:
  LDY #$5C                        ; $03A34C |
  PHA                             ; $03A34E | -- entry point

CODE_03A34F:
  LDA $6F00,y                     ; $03A34F |
  BEQ CODE_03A35F                 ; $03A352 |
  DEY                             ; $03A354 |
  DEY                             ; $03A355 |
  DEY                             ; $03A356 |
  DEY                             ; $03A357 |
  CPY #$18                        ; $03A358 |
  BCS CODE_03A34F                 ; $03A35A |
  PLA                             ; $03A35C |
  CLC                             ; $03A35D |
  RTL                             ; $03A35E |

CODE_03A35F:
  LDA #$0002                      ; $03A35F |
  BRA CODE_03A37D                 ; $03A362 |

; very similar to above, except loads
; $10 for sprite state, instantly making it active/alive
; note: this skips init processing! pretty much a shortcut
spawn_sprite_freeslot_skipinit:
  LDY #$5C                        ; $03A364 |
  PHA                             ; $03A366 |

CODE_03A367:
  LDA $6F00,y                     ; $03A367 |
  BEQ CODE_03A37A                 ; $03A36A |
  DEY                             ; $03A36C |
  DEY                             ; $03A36D |
  DEY                             ; $03A36E |
  DEY                             ; $03A36F |
  CPY #$18                        ; $03A370 |
  BCS CODE_03A367                 ; $03A372 |
  PLA                             ; $03A374 |
  CLC                             ; $03A375 |
  RTL                             ; $03A376 |

; takes in sprite ID via accumulator
init_sprite_data:
  PHA                             ; $03A377 |
  BRA CODE_03A395                 ; $03A378 |

CODE_03A37A:
  LDA #$0010                      ; $03A37A |

CODE_03A37D:
  STA $6F00,y                     ; $03A37D |
  LDA #$00FF                      ; $03A380 |
  STA $74A0,y                     ; $03A383 |
  LDA #$0000                      ; $03A386 |
  STA $7400,y                     ; $03A389 |
  STA $7D96,y                     ; $03A38C |
  STA $7900,y                     ; $03A38F |
  STA $7902,y                     ; $03A392 |

CODE_03A395:
  LDA #$0000                      ; $03A395 |
  STA $7220,y                     ; $03A398 |
  STA $7222,y                     ; $03A39B |
  STA $7976,y                     ; $03A39E |
  STA $70E0,y                     ; $03A3A1 |
  STA $7D36,y                     ; $03A3A4 |
  STA $7978,y                     ; $03A3A7 |
  STA $79D6,y                     ; $03A3AA |
  STA $79D8,y                     ; $03A3AD |
  STA $7A36,y                     ; $03A3B0 |
  STA $7A38,y                     ; $03A3B3 |
  STA $7A96,y                     ; $03A3B6 |
  STA $7A98,y                     ; $03A3B9 |
  STA $7AF6,y                     ; $03A3BC |
  STA $7AF8,y                     ; $03A3BF |
  STA $7402,y                     ; $03A3C2 |
  STA $7860,y                     ; $03A3C5 |
  STA $6F02,y                     ; $03A3C8 |
  STA $7D38,y                     ; $03A3CB |
  STA $7720,y                     ; $03A3CE |
  STA $7680,y                     ; $03A3D1 |
  STA $7682,y                     ; $03A3D4 |
  STA $7540,y                     ; $03A3D7 |
  STA $75E0,y                     ; $03A3DA |
  STA $77C0,y                     ; $03A3DD |
  DEC A                           ; $03A3E0 |
  STA $7362,y                     ; $03A3E1 |
  STA $7722,y                     ; $03A3E4 |
  LDA #$1FFF                      ; $03A3E7 |
  STA $7862,y                     ; $03A3EA |
  PLA                             ; $03A3ED |
  STA $7360,y                     ; $03A3EE | stores passed-in sprite ID
  PHX                             ; $03A3F1 |
  ASL A                           ; $03A3F2 |
  REP #$10                        ; $03A3F3 |
  TAX                             ; $03A3F5 |
  SEP #$20                        ; $03A3F6 |
  PHY                             ; $03A3F8 |
  LDA $0AA716,x                   ; $03A3F9 |
  LDY #$0006                      ; $03A3FD |

CODE_03A400:
  CMP $6EB5,y                     ; $03A400 |
  BEQ CODE_03A40B                 ; $03A403 |
  DEY                             ; $03A405 |
  BNE CODE_03A400                 ; $03A406 |
  TYA                             ; $03A408 |
  BRA CODE_03A410                 ; $03A409 |

CODE_03A40B:
  TYA                             ; $03A40B |
  ADC #$06                        ; $03A40C |
  ASL A                           ; $03A40E |
  ASL A                           ; $03A40F |

CODE_03A410:
  REP #$20                        ; $03A410 |
  AND #$00FF                      ; $03A412 |
  PLY                             ; $03A415 |
  STA $7180,y                     ; $03A416 |
  LDA $0A9F1B,x                   ; $03A419 |
  AND #$00FF                      ; $03A41D |
  EOR #$0020                      ; $03A420 |
  STA $7042,y                     ; $03A423 |
  LDA $0A9F1A,x                   ; $03A426 |
  AND #$00FF                      ; $03A42A |
  STA $74A2,y                     ; $03A42D |
  LDA $0AA317,x                   ; $03A430 |
  AND #$FF00                      ; $03A434 |
  BPL CODE_03A43C                 ; $03A437 |
  ORA #$00FF                      ; $03A439 |

CODE_03A43C:
  XBA                             ; $03A43C |
  STA $7542,y                     ; $03A43D |
  LDA $0AA318,x                   ; $03A440 |
  AND #$FF00                      ; $03A444 |
  BPL CODE_03A44C                 ; $03A447 |
  ORA #$00FF                      ; $03A449 |

CODE_03A44C:
  XBA                             ; $03A44C |
  ASL A                           ; $03A44D |
  ASL A                           ; $03A44E |
  ASL A                           ; $03A44F |
  ASL A                           ; $03A450 |
  STA $75E2,y                     ; $03A451 |
  LDA $0A9B1C,x                   ; $03A454 |
  STA $7040,y                     ; $03A458 |
  LDA $0A971E,x                   ; $03A45B |
  STA $6FA2,y                     ; $03A45F |
  LDA $0A9320,x                   ; $03A462 |
  STA $6FA0,y                     ; $03A466 |
  AND #$001F                      ; $03A469 |
  ASL A                           ; $03A46C |
  ASL A                           ; $03A46D |
  ASL A                           ; $03A46E |
  TAX                             ; $03A46F |
  LDA $0A9220,x                   ; $03A470 |
  STA $7B56,y                     ; $03A474 |
  LDA $0A9222,x                   ; $03A477 |
  STA $7B58,y                     ; $03A47B |
  LDA $0A9224,x                   ; $03A47E |
  STA $7BB6,y                     ; $03A482 |
  LDA $0A9226,x                   ; $03A485 |
  STA $7BB8,y                     ; $03A489 |
  SEP #$10                        ; $03A48C |
  PLX                             ; $03A48E |
  SEC                             ; $03A48F |
  RTL                             ; $03A490 |

; seems to be another entry point to below sub but I can't find it being called
  LDA #$0003                      ; $03A491 |
  BRA CODE_03A4A5                 ; $03A494 |

; l sub
  LDA $70E2,x                     ; $03A496 |
  STA $0000                       ; $03A499 |
  LDA $7182,x                     ; $03A49C |
  STA $0002                       ; $03A49F |

; 1-up routine
  LDA #$0001                      ; $03A4A2 | entry point here

CODE_03A4A5:
  STA $0004                       ; $03A4A5 | entry point
  CLC                             ; $03A4A8 |
  ADC $0379                       ; $03A4A9 |
  STA $0379                       ; $03A4AC |
  LDA $0004                       ; $03A4AF |
  CLC                             ; $03A4B2 |
  ADC $037F                       ; $03A4B3 |
  STA $037F                       ; $03A4B6 |
  LDA #$0008                      ; $03A4B9 |\ play sound #$0008
  JSL $0085D2                     ; $03A4BC |/
  LSR $0004                       ; $03A4C0 |

CODE_03A4C3:
  LDA #$01BF                      ; $03A4C3 |
  JSL $008B21                     ; $03A4C6 |
  LDA $0000                       ; $03A4CA |
  STA $70A2,y                     ; $03A4CD |
  LDA $0002                       ; $03A4D0 |
  STA $7142,y                     ; $03A4D3 |
  LDA $0004                       ; $03A4D6 |
  STA $73C2,y                     ; $03A4D9 |
  LDA #$0040                      ; $03A4DC |
  STA $7782,y                     ; $03A4DF |
  LDA #$FF00                      ; $03A4E2 |
  STA $71E2,y                     ; $03A4E5 |
  RTL                             ; $03A4E8 |

; l sub
  STA $0006                       ; $03A4E9 |
  LDA $70E2,x                     ; $03A4EC |
  STA $0000                       ; $03A4EF |
  LDA $7182,x                     ; $03A4F2 |
  STA $0002                       ; $03A4F5 |
  LDA #$0226                      ; $03A4F8 |
  JSL $008B21                     ; $03A4FB |
  LDA $0000                       ; $03A4FF |
  STA $70A2,y                     ; $03A502 |
  LDA $0002                       ; $03A505 |
  STA $7142,y                     ; $03A508 |
  LDA $7002,y                     ; $03A50B |
  ORA $0006                       ; $03A50E |
  STA $7002,y                     ; $03A511 |
  LDA #$0040                      ; $03A514 |
  STA $7782,y                     ; $03A517 |
  LDA #$FE80                      ; $03A51A |
  STA $71E2,y                     ; $03A51D |
  INC $037B                       ; $03A520 | -- entry point
  LDA $037B                       ; $03A523 |
  CMP #$0064                      ; $03A526 |
  BCC CODE_03A538                 ; $03A529 |
  JSL $03A4A2                     ; $03A52B |
  LDA #$FE40                      ; $03A52F |
  STA $71E2,y                     ; $03A532 |
  STZ $037B                       ; $03A535 |

CODE_03A538:
  RTL                             ; $03A538 |

; l sub
  LDA $70E2,y                     ; $03A539 |
  LDY #$00                        ; $03A53C |
  SEC                             ; $03A53E |
  SBC $70E2,x                     ; $03A53F |
  STA $08                         ; $03A542 |
  BPL CODE_03A54C                 ; $03A544 |
  EOR #$FFFF                      ; $03A546 |
  INC A                           ; $03A549 |
  LDY #$02                        ; $03A54A |

CODE_03A54C:
  STA $06                         ; $03A54C |
  TYA                             ; $03A54E |
  RTL                             ; $03A54F |

; l sub
  LDY #$00                        ; $03A550 |
  LDA $7182,y                     ; $03A552 |
  SEC                             ; $03A555 |
  SBC $7182,x                     ; $03A556 |
  STA $0E                         ; $03A559 |
  BPL CODE_03A563                 ; $03A55B |
  EOR #$FFFF                      ; $03A55D |
  INC A                           ; $03A560 |
  LDY #$02                        ; $03A561 |

CODE_03A563:
  STA $0C                         ; $03A563 |
  TYA                             ; $03A565 |
  RTL                             ; $03A566 |

; l sub
  PHY                             ; $03A567 |
  JSL $03A550                     ; $03A568 |
  STY $0A                         ; $03A56C |
  PLY                             ; $03A56E |
  JSL $03A539                     ; $03A56F |
  STY $04                         ; $03A573 |
  LDA $06                         ; $03A575 |
  CMP $0C                         ; $03A577 |
  BCS CODE_03A581                 ; $03A579 |
  LDY $0A                         ; $03A57B |
  INY                             ; $03A57D |
  INY                             ; $03A57E |
  INY                             ; $03A57F |
  INY                             ; $03A580 |

CODE_03A581:
  TYA                             ; $03A581 |
  RTL                             ; $03A582 |

; table used just below, value gets added
DATA_03A583:         dw $FF40, $00C0
DATA_03A587:         dw $FFA0, $0060

; sub
  TXY                             ; $03A58B |
  LDX #$04                        ; $03A58C |
  BRA CODE_03A593                 ; $03A58E |
  TXY                             ; $03A590 | entry point into the sub, loads in 0 instead of 4
  LDX #$00                        ; $03A591 |

CODE_03A593:
  LDA $7220,y                     ; $03A593 | this is some kind of data about a sprite
  BEQ CODE_03A5B0                 ; $03A596 |
  BPL CODE_03A59C                 ; $03A598 |
  INX                             ; $03A59A |
  INX                             ; $03A59B |

CODE_03A59C:
  CLC                             ; $03A59C |
  ADC $03A583,x                   ; $03A59D |
  STA $7220,y                     ; $03A5A1 |
  EOR $03A583,x                   ; $03A5A4 |
  BMI CODE_03A5B0                 ; $03A5A8 |
  LDA #$0000                      ; $03A5AA |
  STA $7220,y                     ; $03A5AD |

CODE_03A5B0:
  TYX                             ; $03A5B0 |
  RTL                             ; $03A5B1 |

; all this does is call two lines below then return....
  JSL $03A5B7                     ; $03A5B2 |
  RTL                             ; $03A5B6 |

; l sub
  LDY $7D36,x                     ; $03A5B7 |
  BEQ CODE_03A5F0                 ; $03A5BA |
  BPL CODE_03A62E                 ; $03A5BC |
  LDA $7D96,x                     ; $03A5BE | -- entry point
  BEQ CODE_03A5C9                 ; $03A5C1 |
  PLA                             ; $03A5C3 |
  PLY                             ; $03A5C4 |
  JML $03B595                     ; $03A5C5 |

CODE_03A5C9:
  LDA $7C18,x                     ; $03A5C9 |
  SEC                             ; $03A5CC |
  SBC $6122                       ; $03A5CD |
  SEC                             ; $03A5D0 |
  SBC $7BB8,x                     ; $03A5D1 |
  CMP #$FFF6                      ; $03A5D4 |
  BCC CODE_03A5F9                 ; $03A5D7 |
  TXY                             ; $03A5D9 |
  LDX #$0C                        ; $03A5DA |
  LDA $60AA                       ; $03A5DC |
  BMI CODE_03A5EA                 ; $03A5DF |
  LDA $6FA1,y                     ; $03A5E1 |
  AND #$0038                      ; $03A5E4 |
  LSR A                           ; $03A5E7 |
  LSR A                           ; $03A5E8 |
  TAX                             ; $03A5E9 |

CODE_03A5EA:
  JSR ($A655,x)                   ; $03A5EA | table sub
  PLA                             ; $03A5ED |
  PLY                             ; $03A5EE |
  RTL                             ; $03A5EF |

CODE_03A5F0:
  CPX $61B6                       ; $03A5F0 |
  BNE CODE_03A5F8                 ; $03A5F3 |
  STZ $61B6                       ; $03A5F5 |

CODE_03A5F8:
  RTL                             ; $03A5F8 |

CODE_03A5F9:
  LDA $6FA0,x                     ; $03A5F9 |
  AND #$3800                      ; $03A5FC |
  CMP #$2800                      ; $03A5FF |
  BEQ CODE_03A61D                 ; $03A602 |
  LDA $60D8                       ; $03A604 |
  BNE CODE_03A61D                 ; $03A607 |
  LDA $60A8                       ; $03A609 |
  BPL CODE_03A612                 ; $03A60C |
  EOR #$FFFF                      ; $03A60E |
  INC A                           ; $03A611 |

CODE_03A612:
  CMP #$0400                      ; $03A612 |
  BCC CODE_03A61D                 ; $03A615 |
  PLA                             ; $03A617 |
  PLY                             ; $03A618 |
  JSR CODE_03A1D6                 ; $03A619 |
  RTL                             ; $03A61C |

CODE_03A61D:
  LDA $6FA0,x                     ; $03A61D |
  AND #$C000                      ; $03A620 |
  ASL A                           ; $03A623 |
  ROL A                           ; $03A624 |
  ROL A                           ; $03A625 |
  ASL A                           ; $03A626 |
  TAX                             ; $03A627 |
  JSR ($A665,x)                   ; $03A628 | jumps to a sub in an address table (see below)
  PLA                             ; $03A62B |
  PLY                             ; $03A62C |
  RTL                             ; $03A62D |

CODE_03A62E:
  CPX $61B6                       ; $03A62E |
  BNE CODE_03A636                 ; $03A631 |
  STZ $61B6                       ; $03A633 |

CODE_03A636:
  RTL                             ; $03A636 |
  LDA $7400,x                     ; $03A637 |
  EOR #$0002                      ; $03A63A |
  STA $7400,x                     ; $03A63D |
  LDA $7220,x                     ; $03A640 |
  EOR #$FFFF                      ; $03A643 |
  INC A                           ; $03A646 |
  STA $7220,x                     ; $03A647 |
  RTL                             ; $03A64A |
  LDA $7400,x                     ; $03A64B |
  EOR #$0002                      ; $03A64E |
  STA $7400,x                     ; $03A651 |
  RTL                             ; $03A654 |

; table of subs
DATA_03A655:         dw $A66D, $A6B5, $A6B5, $A6B5
DATA_03A65D:         dw $A6D6, $A7A4, $A6F5, $A789

; table of subs
DATA_03A665:         dw $A7AB, $A7A4, $A806, $A80B

; one of the $A655 table subs
  LDA $60C0                       ; $03A66D |
  BNE CODE_03A675                 ; $03A670 |
  JMP CODE_03A7A4                 ; $03A672 |

CODE_03A675:
  LDX $12                         ; $03A675 |
  LDA $7C16,x                     ; $03A677 |
  ASL A                           ; $03A67A |
  ASL A                           ; $03A67B |
  ASL A                           ; $03A67C |
  ASL A                           ; $03A67D |
  STA $7220,x                     ; $03A67E |
  STZ $7540,x                     ; $03A681 |
  STZ $7222,x                     ; $03A684 |
  LDA #$0400                      ; $03A687 |
  STA $75E2,x                     ; $03A68A |
  LDA #$0040                      ; $03A68D |
  STA $7542,x                     ; $03A690 |
  LDA #$FC00                      ; $03A693 |
  STA $60AA                       ; $03A696 |
  LDA #$8001                      ; $03A699 |
  STA $60D2                       ; $03A69C |
  LDA #$000E                      ; $03A69F |
  STA $6F00,x                     ; $03A6A2 |
  JSL $03B288                     ; $03A6A5 |
  LDY $0146                       ; $03A6A9 |
  CPY #$09                        ; $03A6AC |
  BEQ CODE_03A6B4                 ; $03A6AE |
  JSL $03B523                     ; $03A6B0 |

CODE_03A6B4:
  RTS                             ; $03A6B4 |

; one of the $A655 table subs
  LDX $12                         ; $03A6B5 |
  LDY #$3A                        ; $03A6B7 |
  JSL $03A0E7                     ; $03A6B9 |
  LDA #$000E                      ; $03A6BD |
  STA $6F00,x                     ; $03A6C0 |
  STZ $7220,x                     ; $03A6C3 |
  STZ $7222,x                     ; $03A6C6 |
  LDA #$FC00                      ; $03A6C9 |
  STA $60AA                       ; $03A6CC |
  LDA #$8001                      ; $03A6CF |
  STA $60D2                       ; $03A6D2 |
  RTS                             ; $03A6D5 |

; one of the $A655 table subs
  LDA #$FC00                      ; $03A6D6 |
  STA $60AA                       ; $03A6D9 |
  LDA #$8001                      ; $03A6DC |
  STA $60D2                       ; $03A6DF |
  LDX $12                         ; $03A6E2 |
  JSL $03B4D6                     ; $03A6E4 |
  JSL $03B288                     ; $03A6E8 |
  JSL $03A31E                     ; $03A6EC |
  RTS                             ; $03A6F0 |

DATA_03A6F1:         db $80, $01, $60, $00

; one of the $A655 table subs
  LDX $12                         ; $03A6F5 |
  LDA $60D4                       ; $03A6F7 |
  BEQ CODE_03A707                 ; $03A6FA |
  LDA $6FA2,x                     ; $03A6FC |
  AND #$6000                      ; $03A6FF |
  BNE CODE_03A707                 ; $03A702 |
  JMP CODE_03A789                 ; $03A704 |

CODE_03A707:
  LDA $0D94                       ; $03A707 |
  BEQ CODE_03A716                 ; $03A70A |
  CPX $61B6                       ; $03A70C |
  BNE CODE_03A787                 ; $03A70F |
  STZ $61B6                       ; $03A711 |
  BRA CODE_03A787                 ; $03A714 |

CODE_03A716:
  LDA $6FA0,x                     ; $03A716 |
  AND #$3800                      ; $03A719 |
  CMP #$3000                      ; $03A71C |
  BNE CODE_03A731                 ; $03A71F |
  CPX $61B6                       ; $03A721 |
  BEQ CODE_03A72E                 ; $03A724 |
  LDA $61B6                       ; $03A726 |
  AND #$00FF                      ; $03A729 |
  BNE CODE_03A787                 ; $03A72C |

CODE_03A72E:
  STX $61B6                       ; $03A72E |

CODE_03A731:
  LDA $60FC                       ; $03A731 |
  AND #$0018                      ; $03A734 |
  BNE CODE_03A759                 ; $03A737 |
  LDA $7C18,x                     ; $03A739 |
  SEC                             ; $03A73C |
  SBC $6122                       ; $03A73D |
  SEC                             ; $03A740 |
  SBC $7BB8,x                     ; $03A741 |
  SEC                             ; $03A744 |
  ADC $6090                       ; $03A745 |
  STA $6090                       ; $03A748 |
  LDA $7182,x                     ; $03A74B |
  SEC                             ; $03A74E |
  SBC $6EBE                       ; $03A74F |
  SEC                             ; $03A752 |
  ADC $6090                       ; $03A753 |
  STA $6090                       ; $03A756 |

CODE_03A759:
  LDA $60AA                       ; $03A759 |
  BMI CODE_03A787                 ; $03A75C |
  LDA $7222,x                     ; $03A75E |
  BPL CODE_03A766                 ; $03A761 |
  LDA #$0000                      ; $03A763 |

CODE_03A766:
  STA $60AA                       ; $03A766 |
  LDY #$00                        ; $03A769 |
  LDA $72C0,x                     ; $03A76B |
  BMI CODE_03A772                 ; $03A76E |
  LDY #$02                        ; $03A770 |

CODE_03A772:
  LDA $60FC                       ; $03A772 |
  AND $A6F1,y                     ; $03A775 |
  BNE CODE_03A784                 ; $03A778 |
  LDA $72C0,x                     ; $03A77A |
  CLC                             ; $03A77D |
  ADC $608C                       ; $03A77E |
  STA $608C                       ; $03A781 |

CODE_03A784:
  INC $61B4                       ; $03A784 |

CODE_03A787:
  PLA                             ; $03A787 |
  RTL                             ; $03A788 |

; one of the $A655 table subs
CODE_03A789:
  LDX $12                         ; $03A789 |
  JSL $03B51F                     ; $03A78B |
  LDA #$FC00                      ; $03A78F |
  STA $60AA                       ; $03A792 |
  LDA #$8001                      ; $03A795 |
  STA $60D2                       ; $03A798 |

CODE_03A79B:
  RTS                             ; $03A79B | -- a common entry in $D46D table: insta-return

; calls above sub but returns long
  JSR CODE_03A789                 ; $03A79C |
  RTL                             ; $03A79F |

; data
  db $00, $01, $00, $FF            ; $03A7A0 |

; one of the $A655 table subs
CODE_03A7A4:
  LDX $12                         ; $03A7A4 |
  JSL $03A858                     ; $03A7A6 |
  RTS                             ; $03A7AA |

; one of the $A655 table subs
  LDX $12                         ; $03A7AB |
  LDA $60A8                       ; $03A7AD |
  ORA $7220,x                     ; $03A7B0 |
  BEQ CODE_03A79B                 ; $03A7B3 |
  REP #$10                        ; $03A7B5 |
  LDA $60A8                       ; $03A7B7 |
  EOR $7220,x                     ; $03A7BA |
  ASL A                           ; $03A7BD |
  LDA $60A8                       ; $03A7BE |
  PHA                             ; $03A7C1 |
  LDA $7220,x                     ; $03A7C2 |
  TAY                             ; $03A7C5 |
  EOR $7C16,x                     ; $03A7C6 |
  BMI CODE_03A7D2                 ; $03A7C9 |
  BCS CODE_03A7E1                 ; $03A7CB |
  STZ $60A8                       ; $03A7CD |
  BRA CODE_03A7E1                 ; $03A7D0 |

CODE_03A7D2:
  BCS CODE_03A7DE                 ; $03A7D2 |
  TYA                             ; $03A7D4 |
  SEC                             ; $03A7D5 |
  SBC $60A8                       ; $03A7D6 |
  EOR $60A8                       ; $03A7D9 |
  BMI CODE_03A7E1                 ; $03A7DC |

CODE_03A7DE:
  STY $60A8                       ; $03A7DE |

CODE_03A7E1:
  PLA                             ; $03A7E1 |
  TAY                             ; $03A7E2 |
  EOR $7C16,x                     ; $03A7E3 |
  BPL CODE_03A7EF                 ; $03A7E6 |
  BCS CODE_03A7FF                 ; $03A7E8 |
  STZ $7220,x                     ; $03A7EA |
  BRA CODE_03A7FF                 ; $03A7ED |

CODE_03A7EF:
  BCS CODE_03A7FB                 ; $03A7EF |
  TYA                             ; $03A7F1 |
  SEC                             ; $03A7F2 |
  SBC $7220,x                     ; $03A7F3 |
  EOR $7220,x                     ; $03A7F6 |
  BMI CODE_03A7FF                 ; $03A7F9 |

CODE_03A7FB:
  TYA                             ; $03A7FB |
  STA $7220,x                     ; $03A7FC |

CODE_03A7FF:
  SEP #$10                        ; $03A7FF |
  JSL $03A0E5                     ; $03A801 |
  RTS                             ; $03A805 |

; one of the $A655 table subs
  LDX $12                         ; $03A806 |
  JMP CODE_03A1D6                 ; $03A808 |

; one of the $A655 table subs
  LDX $12                         ; $03A80B |
  PLA                             ; $03A80D |
  RTL                             ; $03A80E |

; data table
DATA_03A80F:         dw $0100
DATA_03A811:         dw $FF00

; l sub
  LDX $12                         ; $03A813 |
  LDA $61D6                       ; $03A815 |
  BNE CODE_03A850                 ; $03A818 |
  LDA $6FA2,x                     ; $03A81A |
  AND #$6000                      ; $03A81D |
  BNE CODE_03A84A                 ; $03A820 |
  INC $7D38,x                     ; $03A822 |
  STZ $18,x                       ; $03A825 |
  LDA #$0400                      ; $03A827 |
  STA $75E2,x                     ; $03A82A |
  LDA #$0040                      ; $03A82D |
  STA $7542,x                     ; $03A830 |
  STZ $7540,x                     ; $03A833 |
  STZ $7860,x                     ; $03A836 |
  TXY                             ; $03A839 |
  LDX $77C2,y                     ; $03A83A |
  LDA $03A7A0,x                   ; $03A83D |
  STA $7220,y                     ; $03A841 |
  LDA #$FE00                      ; $03A844 |
  STA $7222,y                     ; $03A847 |

CODE_03A84A:
  LDX $12                         ; $03A84A |
  JSL $03A858                     ; $03A84C |

CODE_03A850:
  PLA                             ; $03A850 |
  PLY                             ; $03A851 |
  RTL                             ; $03A852 |

; l sub
  STZ $7972                       ; $03A853 |
  BRA CODE_03A865                 ; $03A856 |
  LDA $7E04                       ; $03A858 | entry point
  BEQ CODE_03A865                 ; $03A85B |
  LDY $7972                       ; $03A85D |
  BEQ CODE_03A899                 ; $03A860 |
  JMP CODE_03B25B                 ; $03A862 |

CODE_03A865:
  LDA $61D6                       ; $03A865 |
  ORA $61AE                       ; $03A868 |
  ORA $10DA                       ; $03A86B |
  BNE CODE_03A899                 ; $03A86E |
  LDA $60AC                       ; $03A870 |
  CMP #$0003                      ; $03A873 |
  BCS CODE_03A899                 ; $03A876 |
  LDA $60B2                       ; $03A878 |
  CLC                             ; $03A87B |
  ADC #$0010                      ; $03A87C |
  CMP #$00E9                      ; $03A87F |
  BCS CODE_03A899                 ; $03A882 |
  LDA #$0017                      ; $03A884 |\ play sound #$0017
  JSL $0085D2                     ; $03A887 |/
  STA $607A                       ; $03A88B |
  STZ $60D4                       ; $03A88E |
  LDX $60AE                       ; $03A891 |
  JSR ($A89A,x)                   ; $03A894 | table address
  LDX $12                         ; $03A897 |

CODE_03A899:
  RTL                             ; $03A899 |

; address table
DATA_03A89A:         dw $A8CF
DATA_03A89C:         dw $A8FC
DATA_03A89E:         dw $A936
DATA_03A8A0:         dw $A8AE
DATA_03A8A2:         dw $A8C1
DATA_03A8A4:         dw $A94A
DATA_03A8A6:         dw $A940
DATA_03A8A8:         dw $A94B
DATA_03A8AA:         dw $A901
DATA_03A8AC:         dw $A8D3

; $A89A table sub
  LDA #$0068                      ; $03A8AE |
  STA $61D6                       ; $03A8B1 |
  STZ $60A8                       ; $03A8B4 |
  STZ $60B4                       ; $03A8B7 |
  LDA #$1000                      ; $03A8BA |
  STA $6180                       ; $03A8BD |
  RTS                             ; $03A8C0 |

; $A89A table sub
  LDA #$0090                      ; $03A8C1 |
  STA $61D6                       ; $03A8C4 |
  STZ $618E                       ; $03A8C7 |
  RTS                             ; $03A8CA |

; data table
DATA_03A8CB:         dw $FE00
DATA_03A8CD:         dw $0200

; $A89A table sub
  JSL $04F74A                     ; $03A8CF |
  LDA $61B2                       ; $03A8D3 | entry point in address table
  BMI CODE_03A8F7                 ; $03A8D6 |
  LDA $0390                       ; $03A8D8 |
  BMI CODE_03A8F7                 ; $03A8DB |
  LDA $60A8                       ; $03A8DD |
  CLC                             ; $03A8E0 |
  ADC #$02C0                      ; $03A8E1 |
  CMP #$0581                      ; $03A8E4 |
  LDA #$0180                      ; $03A8E7 |
  BCC CODE_03A8EF                 ; $03A8EA |
  LDA #$0240                      ; $03A8EC |

CODE_03A8EF:
  STA $614A                       ; $03A8EF |
  LDA #$0080                      ; $03A8F2 |
  BRA CODE_03A904                 ; $03A8F5 |

CODE_03A8F7:
  LDA #$00A0                      ; $03A8F7 |
  BRA CODE_03A904                 ; $03A8FA |
  LDA #$0040                      ; $03A8FC | entry point in address table
  BRA CODE_03A904                 ; $03A8FF |
  LDA #$0068                      ; $03A901 | entry point in address table

CODE_03A904:
  STA $61D6                       ; $03A904 |
  LDY $7972                       ; $03A907 |
  BEQ CODE_03A917                 ; $03A90A |
  LDX $77C2,y                     ; $03A90C |
  LDA $03A8CB,x                   ; $03A90F |
  TYX                             ; $03A913 |
  STA $60B4                       ; $03A914 |

CODE_03A917:
  LDY $60AE                       ; $03A917 |
  CPY #$02                        ; $03A91A |
  BEQ CODE_03A923                 ; $03A91C |
  LDA $60C0                       ; $03A91E |
  BNE CODE_03A92F                 ; $03A921 |

CODE_03A923:
  LDA #$0008                      ; $03A923 |
  STA $60C0                       ; $03A926 |
  LDA #$FC00                      ; $03A929 |
  STA $60AA                       ; $03A92C |

CODE_03A92F:
  LDA #$0008                      ; $03A92F |
  STA $0CCC                       ; $03A932 |
  RTS                             ; $03A935 |

; $A89A table sub
  LDA #$0090                      ; $03A936 |
  STA $61D6                       ; $03A939 |
  STZ $6194                       ; $03A93C |
  RTS                             ; $03A93F |

; $A89A table sub
  LDA #$00D0                      ; $03A940 |
  STA $61D6                       ; $03A943 |
  STZ $6180                       ; $03A946 |
  RTS                             ; $03A949 |

; $A89A table sub
  RTS                             ; $03A94A |

; $A89A table sub
  LDA $6180                       ; $03A94B |
  BNE CODE_03A965                 ; $03A94E |
  LDA #$0080                      ; $03A950 |
  STA $6180                       ; $03A953 |
  LDA #$0080                      ; $03A956 |
  STA $61F6                       ; $03A959 |
  LDA #$FE00                      ; $03A95C |
  STA $60AA                       ; $03A95F |
  STZ $617E                       ; $03A962 |

CODE_03A965:
  RTS                             ; $03A965 |

; data table
DATA_03A966:         dw $0000
DATA_03A968:         dw $8040
DATA_03A96A:         dw $8000
DATA_03A96C:         dw $00C0
DATA_03A96E:         dw $8080
DATA_03A970:         dw $0040
DATA_03A972:         dw $0080
DATA_03A974:         dw $80C0

; l sub
  PHX                             ; $03A976 |
  LDY #$00                        ; $03A977 |
  LDA $00                         ; $03A979 |
  BPL CODE_03A983                 ; $03A97B |
  LDY #$04                        ; $03A97D |
  EOR #$FFFF                      ; $03A97F |
  INC A                           ; $03A982 |

CODE_03A983:
  STA $04                         ; $03A983 |
  TAX                             ; $03A985 |
  LDA $02                         ; $03A986 |
  BPL CODE_03A990                 ; $03A988 |
  INY                             ; $03A98A |
  INY                             ; $03A98B |
  EOR #$FFFF                      ; $03A98C |
  INC A                           ; $03A98F |

CODE_03A990:
  CMP $04                         ; $03A990 |
  BCC CODE_03A998                 ; $03A992 |
  INY                             ; $03A994 |
  TAX                             ; $03A995 |
  LDA $04                         ; $03A996 |

CODE_03A998:
  XBA                             ; $03A998 |
  STA $4204                       ; $03A999 |
  STX $4206                       ; $03A99C |
  TYA                             ; $03A99F |
  ASL A                           ; $03A9A0 |
  TAX                             ; $03A9A1 |
  NOP                             ; $03A9A2 |
  NOP                             ; $03A9A3 |
  NOP                             ; $03A9A4 |
  NOP                             ; $03A9A5 |
  REP #$10                        ; $03A9A6 |
  LDA $4214                       ; $03A9A8 |
  ASL A                           ; $03A9AB |
  TAY                             ; $03A9AC |
  CPY #$0202                      ; $03A9AD |
  BCC CODE_03A9B5                 ; $03A9B0 |
  LDY #$0200                      ; $03A9B2 |

CODE_03A9B5:
  LDA $03A966,x                   ; $03A9B5 |
  ASL A                           ; $03A9B9 |
  STA $04                         ; $03A9BA |
  TYX                             ; $03A9BC |
  LDA $0BB810,x                   ; $03A9BD |
  BCC CODE_03A9C7                 ; $03A9C1 |
  EOR #$FFFF                      ; $03A9C3 |
  INC A                           ; $03A9C6 |

CODE_03A9C7:
  CLC                             ; $03A9C7 |
  ADC $04                         ; $03A9C8 |
  SEP #$10                        ; $03A9CA |
  PLX                             ; $03A9CC |
  RTL                             ; $03A9CD |

; data table
DATA_03A9CE:         dw $0000, $0010
DATA_03A9D2:         dw $0000, $0010
DATA_03A9D6:         dw $0020, $0030
DATA_03A9DA:         dw $0020, $0030
DATA_03A9DE:         dw $0040, $0050
DATA_03A9E2:         dw $0040, $0050
DATA_03A9E6:         dw $0060, $0070
DATA_03A9EA:         dw $0060, $0070

; data table
DATA_03A9EE:         dw $0000, $0000
DATA_03A9F2:         dw $0010, $0010
DATA_03A9F6:         dw $0000, $0000
DATA_03A9FA:         dw $0010, $0010
DATA_03A9FE:         dw $0000, $0000
DATA_03AA02:         dw $0010, $0010
DATA_03AA06:         dw $0000, $0000
DATA_03AA0A:         dw $0010, $0010

; data table
DATA_03AA0E:         dw $01C0, $01C2
DATA_03AA12:         dw $01E0, $01E2
DATA_03AA16:         dw $01C4, $01C6
DATA_03AA1A:         dw $01E4, $01E6
DATA_03AA1E:         dw $01C8, $01CA
DATA_03AA22:         dw $01E8, $01EA
DATA_03AA26:         dw $01CC, $01CE
DATA_03AA2A:         dw $01EC, $01EE

; l sub
  LDY $74A2,x                     ; $03AA2E |
  CPY #$FF                        ; $03AA31 |
  BEQ CODE_03AA51                 ; $03AA33 |
  REP #$10                        ; $03AA35 |
  LDY $7362,x                     ; $03AA37 |
  BMI CODE_03AA4F                 ; $03AA3A |
  PHX                             ; $03AA3C | entry point
  LDA $7722,x                     ; $03AA3D |
  TAX                             ; $03AA40 |
  LDA $6004,y                     ; $03AA41 |
  AND #$FE00                      ; $03AA44 |
  ORA $03AA0E,x                   ; $03AA47 |
  STA $6004,y                     ; $03AA4B |
  PLX                             ; $03AA4E |

CODE_03AA4F:
  SEP #$10                        ; $03AA4F |

CODE_03AA51:
  RTL                             ; $03AA51 |

; sub
  LDY $74A2,x                     ; $03AA52 |
  CPY #$FF                        ; $03AA55 |
  BEQ CODE_03AA9C                 ; $03AA57 |
  REP #$10                        ; $03AA59 |
  LDY $7362,x                     ; $03AA5B |
  BMI CODE_03AA9A                 ; $03AA5E |
  PHX                             ; $03AA60 |
  LDA $7722,x                     ; $03AA61 |
  TAX                             ; $03AA64 |
  LDA $6004,y                     ; $03AA65 |
  AND #$FE00                      ; $03AA68 |
  ORA $03AA0E,x                   ; $03AA6B |
  STA $6004,y                     ; $03AA6F |
  LDA $600C,y                     ; $03AA72 |
  AND #$FE00                      ; $03AA75 |
  ORA $03AA10,x                   ; $03AA78 |
  STA $600C,y                     ; $03AA7C |
  LDA $6014,y                     ; $03AA7F |
  AND #$FE00                      ; $03AA82 |
  ORA $03AA12,x                   ; $03AA85 |
  STA $6014,y                     ; $03AA89 |
  LDA $601C,y                     ; $03AA8C |
  AND #$FE00                      ; $03AA8F |
  ORA $03AA14,x                   ; $03AA92 |
  STA $601C,y                     ; $03AA96 |
  PLX                             ; $03AA99 |

CODE_03AA9A:
  SEP #$10                        ; $03AA9A |

CODE_03AA9C:
  RTL                             ; $03AA9C |

; l sub
  LDY $74A2,x                     ; $03AA9D |
  CPY #$FF                        ; $03AAA0 |
  BEQ CODE_03AB1B                 ; $03AAA2 |
  REP #$10                        ; $03AAA4 |
  LDY $7362,x                     ; $03AAA6 |
  BMI CODE_03AB19                 ; $03AAA9 |
  PHX                             ; $03AAAB |
  LDA $7722,x                     ; $03AAAC |
  TAX                             ; $03AAAF |
  LDA $6004,y                     ; $03AAB0 |
  AND #$FE00                      ; $03AAB3 |
  ORA $03AA0E,x                   ; $03AAB6 |
  STA $6004,y                     ; $03AABA |
  LDA $600C,y                     ; $03AABD |
  AND #$FE00                      ; $03AAC0 |
  ORA $03AA10,x                   ; $03AAC3 |
  STA $600C,y                     ; $03AAC7 |
  LDA $6014,y                     ; $03AACA |
  AND #$FE00                      ; $03AACD |
  ORA $03AA12,x                   ; $03AAD0 |
  STA $6014,y                     ; $03AAD4 |
  LDA $601C,y                     ; $03AAD7 |
  AND #$FE00                      ; $03AADA |
  ORA $03AA14,x                   ; $03AADD |
  STA $601C,y                     ; $03AAE1 |
  LDA $6024,y                     ; $03AAE4 |
  AND #$FE00                      ; $03AAE7 |
  ORA $03AA16,x                   ; $03AAEA |
  STA $6024,y                     ; $03AAEE |
  LDA $602C,y                     ; $03AAF1 |
  AND #$FE00                      ; $03AAF4 |
  ORA $03AA18,x                   ; $03AAF7 |
  STA $602C,y                     ; $03AAFB |
  LDA $6034,y                     ; $03AAFE |
  AND #$FE00                      ; $03AB01 |
  ORA $03AA1A,x                   ; $03AB04 |
  STA $6034,y                     ; $03AB08 |
  LDA $603C,y                     ; $03AB0B |
  AND #$FE00                      ; $03AB0E |
  ORA $03AA1C,x                   ; $03AB11 |
  STA $603C,y                     ; $03AB15 |
  PLX                             ; $03AB18 |

CODE_03AB19:
  SEP #$10                        ; $03AB19 |

CODE_03AB1B:
  RTL                             ; $03AB1B |

; l sub
  LDY $74A2,x                     ; $03AB1C |
  CPY #$FF                        ; $03AB1F |
  BEQ CODE_03AB1B                 ; $03AB21 |
  REP #$10                        ; $03AB23 |
  LDY $7362,x                     ; $03AB25 |
  BPL CODE_03AB2D                 ; $03AB28 |
  JMP CODE_03ABF7                 ; $03AB2A |

CODE_03AB2D:
  PHX                             ; $03AB2D |
  PHB                             ; $03AB2E |
  PHK                             ; $03AB2F |
  PLB                             ; $03AB30 |
  LDA $7722,x                     ; $03AB31 |
  TAX                             ; $03AB34 |
  LDA $6004,y                     ; $03AB35 |
  AND #$FE00                      ; $03AB38 |
  ORA $AA0E,x                     ; $03AB3B |
  STA $6004,y                     ; $03AB3E |
  LDA $600C,y                     ; $03AB41 |
  AND #$FE00                      ; $03AB44 |
  ORA $AA10,x                     ; $03AB47 |
  STA $600C,y                     ; $03AB4A |
  LDA $6014,y                     ; $03AB4D |
  AND #$FE00                      ; $03AB50 |
  ORA $AA12,x                     ; $03AB53 |
  STA $6014,y                     ; $03AB56 |
  LDA $601C,y                     ; $03AB59 |
  AND #$FE00                      ; $03AB5C |
  ORA $AA14,x                     ; $03AB5F |
  STA $601C,y                     ; $03AB62 |
  LDA $6024,y                     ; $03AB65 |
  AND #$FE00                      ; $03AB68 |
  ORA $AA16,x                     ; $03AB6B |
  STA $6024,y                     ; $03AB6E |
  LDA $602C,y                     ; $03AB71 |
  AND #$FE00                      ; $03AB74 |
  ORA $AA18,x                     ; $03AB77 |
  STA $602C,y                     ; $03AB7A |
  LDA $6034,y                     ; $03AB7D |
  AND #$FE00                      ; $03AB80 |
  ORA $AA1A,x                     ; $03AB83 |
  STA $6034,y                     ; $03AB86 |
  LDA $603C,y                     ; $03AB89 |
  AND #$FE00                      ; $03AB8C |
  ORA $AA1C,x                     ; $03AB8F |
  STA $603C,y                     ; $03AB92 |
  LDA $6044,y                     ; $03AB95 |
  AND #$FE00                      ; $03AB98 |
  ORA $AA1E,x                     ; $03AB9B |
  STA $6044,y                     ; $03AB9E |
  LDA $604C,y                     ; $03ABA1 |
  AND #$FE00                      ; $03ABA4 |
  ORA $AA20,x                     ; $03ABA7 |
  STA $604C,y                     ; $03ABAA |
  LDA $6054,y                     ; $03ABAD |
  AND #$FE00                      ; $03ABB0 |
  ORA $AA22,x                     ; $03ABB3 |
  STA $6054,y                     ; $03ABB6 |
  LDA $605C,y                     ; $03ABB9 |
  AND #$FE00                      ; $03ABBC |
  ORA $AA24,x                     ; $03ABBF |
  STA $605C,y                     ; $03ABC2 |
  LDA $6064,y                     ; $03ABC5 |
  AND #$FE00                      ; $03ABC8 |
  ORA $AA26,x                     ; $03ABCB |
  STA $6064,y                     ; $03ABCE |
  LDA $606C,y                     ; $03ABD1 |
  AND #$FE00                      ; $03ABD4 |
  ORA $AA28,x                     ; $03ABD7 |
  STA $606C,y                     ; $03ABDA |
  LDA $6074,y                     ; $03ABDD |
  AND #$FE00                      ; $03ABE0 |
  ORA $AA2A,x                     ; $03ABE3 |
  STA $6074,y                     ; $03ABE6 |
  LDA $607C,y                     ; $03ABE9 |
  AND #$FE00                      ; $03ABEC |
  ORA $AA2C,x                     ; $03ABEF |
  STA $607C,y                     ; $03ABF2 |
  PLB                             ; $03ABF5 |
  PLX                             ; $03ABF6 |

CODE_03ABF7:
  SEP #$10                        ; $03ABF7 |

CODE_03ABF9:
  RTL                             ; $03ABF9 |

; l sub
  LDY $74A2,x                     ; $03ABFA |
  CPY #$FF                        ; $03ABFD |
  BEQ CODE_03ABF9                 ; $03ABFF |
  REP #$10                        ; $03AC01 |
  LDY $7362,x                     ; $03AC03 |
  BPL CODE_03AC0B                 ; $03AC06 |
  JMP CODE_03ACED                 ; $03AC08 |

CODE_03AC0B:
  PHX                             ; $03AC0B |
  PHB                             ; $03AC0C |
  PHK                             ; $03AC0D |
  PLB                             ; $03AC0E |
  LDA $7722,x                     ; $03AC0F |
  TAX                             ; $03AC12 |
  LDA $6004,y                     ; $03AC13 |
  AND #$FE00                      ; $03AC16 |
  ORA $AA0E,x                     ; $03AC19 |
  STA $6004,y                     ; $03AC1C |
  LDA $600C,y                     ; $03AC1F |
  AND #$FE00                      ; $03AC22 |
  ORA $AA10,x                     ; $03AC25 |
  STA $600C,y                     ; $03AC28 |
  LDA $6014,y                     ; $03AC2B |
  AND #$FE00                      ; $03AC2E |
  ORA $AA12,x                     ; $03AC31 |
  STA $6014,y                     ; $03AC34 |
  LDA $601C,y                     ; $03AC37 |
  AND #$FE00                      ; $03AC3A |
  ORA $AA14,x                     ; $03AC3D |
  STA $601C,y                     ; $03AC40 |
  LDA $6024,y                     ; $03AC43 |
  AND #$FE00                      ; $03AC46 |
  EOR #$4000                      ; $03AC49 |
  ORA $AA10,x                     ; $03AC4C |
  STA $6024,y                     ; $03AC4F |
  LDA $602C,y                     ; $03AC52 |
  AND #$FE00                      ; $03AC55 |
  EOR #$4000                      ; $03AC58 |
  ORA $AA0E,x                     ; $03AC5B |
  STA $602C,y                     ; $03AC5E |
  LDA $6034,y                     ; $03AC61 |
  AND #$FE00                      ; $03AC64 |
  EOR #$4000                      ; $03AC67 |
  ORA $AA14,x                     ; $03AC6A |
  STA $6034,y                     ; $03AC6D |
  LDA $603C,y                     ; $03AC70 |
  AND #$FE00                      ; $03AC73 |
  EOR #$4000                      ; $03AC76 |
  ORA $AA12,x                     ; $03AC79 |
  STA $603C,y                     ; $03AC7C |
  LDA $6044,y                     ; $03AC7F |
  AND #$FE00                      ; $03AC82 |
  ORA $AA16,x                     ; $03AC85 |
  STA $6044,y                     ; $03AC88 |
  LDA $604C,y                     ; $03AC8B |
  AND #$FE00                      ; $03AC8E |
  ORA $AA18,x                     ; $03AC91 |
  STA $604C,y                     ; $03AC94 |
  LDA $6054,y                     ; $03AC97 |
  AND #$FE00                      ; $03AC9A |
  ORA $AA1A,x                     ; $03AC9D |
  STA $6054,y                     ; $03ACA0 |
  LDA $605C,y                     ; $03ACA3 |
  AND #$FE00                      ; $03ACA6 |
  ORA $AA1C,x                     ; $03ACA9 |
  STA $605C,y                     ; $03ACAC |
  LDA $6064,y                     ; $03ACAF |
  AND #$FE00                      ; $03ACB2 |
  EOR #$4000                      ; $03ACB5 |
  ORA $AA18,x                     ; $03ACB8 |
  STA $6064,y                     ; $03ACBB |
  LDA $606C,y                     ; $03ACBE |
  AND #$FE00                      ; $03ACC1 |
  EOR #$4000                      ; $03ACC4 |
  ORA $AA16,x                     ; $03ACC7 |
  STA $606C,y                     ; $03ACCA |
  LDA $6074,y                     ; $03ACCD |
  AND #$FE00                      ; $03ACD0 |
  EOR #$4000                      ; $03ACD3 |
  ORA $AA1C,x                     ; $03ACD6 |
  STA $6074,y                     ; $03ACD9 |
  LDA $607C,y                     ; $03ACDC |
  AND #$FE00                      ; $03ACDF |
  EOR #$4000                      ; $03ACE2 |
  ORA $AA1A,x                     ; $03ACE5 |
  STA $607C,y                     ; $03ACE8 |
  PLB                             ; $03ACEB |
  PLX                             ; $03ACEC |

CODE_03ACED:
  SEP #$10                        ; $03ACED |
  RTL                             ; $03ACEF |

; data table
DATA_03ACF0:         dw $FF00
DATA_03ACF2:         dw $0FF0
DATA_03ACF4:         dw $00FF

; data table
DATA_03ACF6:         dw $F000
DATA_03ACF8:         dw $0F00
DATA_03ACFA:         dw $00F0
DATA_03ACFC:         dw $000F

; data table
DATA_03ACFE:         dw $FA00
DATA_03AD00:         dw $0FA0
DATA_03AD02:         dw $00FA

; data table: stores each bit place
DATA_03AD04:         dw $8000
DATA_03AD06:         dw $4000
DATA_03AD08:         dw $2000
DATA_03AD0A:         dw $1000
DATA_03AD0C:         dw $0800
DATA_03AD0E:         dw $0400
DATA_03AD10:         dw $0200
DATA_03AD12:         dw $0100
DATA_03AD14:         dw $0080
DATA_03AD16:         dw $0040
DATA_03AD18:         dw $0020
DATA_03AD1A:         dw $0010
DATA_03AD1C:         dw $0008
DATA_03AD1E:         dw $0004
DATA_03AD20:         dw $0002
DATA_03AD22:         dw $0001

; l sub
  PHX                             ; $03AD24 |
  PHB                             ; $03AD25 |
  PHK                             ; $03AD26 |
  PLB                             ; $03AD27 |
  SEC                             ; $03AD28 |
  ROR $0000                       ; $03AD29 |
  LDX #$06                        ; $03AD2C |

CODE_03AD2E:
  LDA $7ECC                       ; $03AD2E |
  AND $ACF6,x                     ; $03AD31 |
  BNE CODE_03AD3B                 ; $03AD34 |
  STX $0001                       ; $03AD36 |
  BRA CODE_03AD40                 ; $03AD39 |

CODE_03AD3B:
  CMP $ACF6,x                     ; $03AD3B |
  BNE CODE_03AD49                 ; $03AD3E |

CODE_03AD40:
  DEX                             ; $03AD40 |
  DEX                             ; $03AD41 |
  BPL CODE_03AD2E                 ; $03AD42 |
  LDX $0001                       ; $03AD44 |
  BMI CODE_03AD5C                 ; $03AD47 |

CODE_03AD49:
  TXA                             ; $03AD49 |
  ASL A                           ; $03AD4A |
  ASL A                           ; $03AD4B |
  TAX                             ; $03AD4C |
  LDA $7ECC                       ; $03AD4D |
  LDY #$04                        ; $03AD50 |

CODE_03AD52:
  BIT $AD04,x                     ; $03AD52 |
  BEQ CODE_03AD60                 ; $03AD55 |
  INX                             ; $03AD57 |
  INX                             ; $03AD58 |
  DEY                             ; $03AD59 |
  BNE CODE_03AD52                 ; $03AD5A |

CODE_03AD5C:
  PLB                             ; $03AD5C |
  PLX                             ; $03AD5D |
  CLC                             ; $03AD5E |
  RTL                             ; $03AD5F |

CODE_03AD60:
  LDA $AD04,x                     ; $03AD60 |
  STA $7ECE,x                     ; $03AD63 |
  TSB $7ECC                       ; $03AD66 |
  TXA                             ; $03AD69 |
  AND #$00FF                      ; $03AD6A |
  PLB                             ; $03AD6D |
  PLX                             ; $03AD6E |
  STA $7722,x                     ; $03AD6F |
  SEC                             ; $03AD72 |
  RTL                             ; $03AD73 |

; l sub
  PHX                             ; $03AD74 |
  PHB                             ; $03AD75 |
  PHK                             ; $03AD76 |
  PLB                             ; $03AD77 |
  LDA $7ECC                       ; $03AD78 |
  LDX #$06                        ; $03AD7B |

CODE_03AD7D:
  BIT $ACF6,x                     ; $03AD7D |
  BEQ CODE_03AD8A                 ; $03AD80 |
  DEX                             ; $03AD82 |
  DEX                             ; $03AD83 |
  BPL CODE_03AD7D                 ; $03AD84 |
  PLB                             ; $03AD86 |
  PLX                             ; $03AD87 |
  CLC                             ; $03AD88 |
  RTL                             ; $03AD89 |

CODE_03AD8A:
  TXA                             ; $03AD8A |
  ASL A                           ; $03AD8B |
  ASL A                           ; $03AD8C |
  TAY                             ; $03AD8D |
  LDA $ACF6,x                     ; $03AD8E |
  STA $7ECE,y                     ; $03AD91 |
  TSB $7ECC                       ; $03AD94 |
  TYA                             ; $03AD97 |
  AND #$00FF                      ; $03AD98 |
  PLB                             ; $03AD9B |
  PLX                             ; $03AD9C |
  STA $7722,x                     ; $03AD9D |
  SEC                             ; $03ADA0 |
  RTL                             ; $03ADA1 |

; l sub
  PHX                             ; $03ADA2 |
  PHB                             ; $03ADA3 |
  PHK                             ; $03ADA4 |
  PLB                             ; $03ADA5 |
  LDA $7ECC                       ; $03ADA6 |
  LDX #$04                        ; $03ADA9 |

CODE_03ADAB:
  BIT $ACFE,x                     ; $03ADAB |
  BEQ CODE_03ADB8                 ; $03ADAE |
  DEX                             ; $03ADB0 |
  DEX                             ; $03ADB1 |
  BPL CODE_03ADAB                 ; $03ADB2 |
  PLB                             ; $03ADB4 |
  PLX                             ; $03ADB5 |
  CLC                             ; $03ADB6 |
  RTL                             ; $03ADB7 |

CODE_03ADB8:
  TXA                             ; $03ADB8 |
  ASL A                           ; $03ADB9 |
  ASL A                           ; $03ADBA |
  TAY                             ; $03ADBB |
  LDA $ACFE,x                     ; $03ADBC |
  STA $7ECE,y                     ; $03ADBF |
  TSB $7ECC                       ; $03ADC2 |
  TYA                             ; $03ADC5 |
  AND #$00FF                      ; $03ADC6 |
  PLB                             ; $03ADC9 |
  PLX                             ; $03ADCA |
  STA $7722,x                     ; $03ADCB |
  SEC                             ; $03ADCE |
  RTL                             ; $03ADCF |

; l sub
  PHX                             ; $03ADD0 |
  PHB                             ; $03ADD1 |
  PHK                             ; $03ADD2 |
  PLB                             ; $03ADD3 |
  LDA $7ECC                       ; $03ADD4 |
  LDX #$04                        ; $03ADD7 |

CODE_03ADD9:
  BIT $ACF0,x                     ; $03ADD9 |
  BEQ CODE_03ADE6                 ; $03ADDC |
  DEX                             ; $03ADDE |
  DEX                             ; $03ADDF |
  BPL CODE_03ADD9                 ; $03ADE0 |
  PLB                             ; $03ADE2 |
  PLX                             ; $03ADE3 |

CODE_03ADE4:
  CLC                             ; $03ADE4 |
  RTL                             ; $03ADE5 |

CODE_03ADE6:
  TXA                             ; $03ADE6 |
  ASL A                           ; $03ADE7 |
  ASL A                           ; $03ADE8 |
  TAY                             ; $03ADE9 |
  LDA $ACF0,x                     ; $03ADEA |
  STA $7ECE,y                     ; $03ADED |
  TSB $7ECC                       ; $03ADF0 |
  TYA                             ; $03ADF3 |
  AND #$00FF                      ; $03ADF4 |
  PLB                             ; $03ADF7 |
  PLX                             ; $03ADF8 |
  STA $7722,x                     ; $03ADF9 |
  SEC                             ; $03ADFC |
  RTL                             ; $03ADFD |

; l sub
  LDA $7ECC                       ; $03ADFE |
  BNE CODE_03ADE4                 ; $03AE01 |
  LDA #$FFFF                      ; $03AE03 |
  STA $7ECE                       ; $03AE06 |
  STA $7ECC                       ; $03AE09 |
  STZ $7722,x                     ; $03AE0C |
  SEC                             ; $03AE0F |
  RTL                             ; $03AE10 |

; l sub
  PHX                             ; $03AE11 |
  PHB                             ; $03AE12 |
  PHK                             ; $03AE13 |
  PLB                             ; $03AE14 |
  SEC                             ; $03AE15 |
  ROR $0000                       ; $03AE16 |
  LDX #$06                        ; $03AE19 |

CODE_03AE1B:
  LDA $7ECC                       ; $03AE1B |
  AND $ACF6,x                     ; $03AE1E |
  BNE CODE_03AE28                 ; $03AE21 |
  STX $0001                       ; $03AE23 |
  BRA CODE_03AE2D                 ; $03AE26 |

CODE_03AE28:
  CMP $ACF6,x                     ; $03AE28 |
  BNE CODE_03AE36                 ; $03AE2B |

CODE_03AE2D:
  DEX                             ; $03AE2D |
  DEX                             ; $03AE2E |
  BPL CODE_03AE1B                 ; $03AE2F |
  LDX $0001                       ; $03AE31 |
  BMI CODE_03AE49                 ; $03AE34 |

CODE_03AE36:
  TXA                             ; $03AE36 |
  ASL A                           ; $03AE37 |
  ASL A                           ; $03AE38 |
  TAX                             ; $03AE39 |
  LDA $7ECC                       ; $03AE3A |
  LDY #$04                        ; $03AE3D |

CODE_03AE3F:
  BIT $AD04,x                     ; $03AE3F |
  BEQ CODE_03AE4D                 ; $03AE42 |
  INX                             ; $03AE44 |
  INX                             ; $03AE45 |
  DEY                             ; $03AE46 |
  BNE CODE_03AE3F                 ; $03AE47 |

CODE_03AE49:
  PLB                             ; $03AE49 |
  PLX                             ; $03AE4A |
  BRA CODE_03AEA1                 ; $03AE4B |

CODE_03AE4D:
  LDA $AD04,x                     ; $03AE4D |
  STA $7ECE,x                     ; $03AE50 |
  TSB $7ECC                       ; $03AE53 |
  TXA                             ; $03AE56 |
  AND #$00FF                      ; $03AE57 |
  PLB                             ; $03AE5A |
  PLX                             ; $03AE5B |
  STA $7722,x                     ; $03AE5C |
  RTL                             ; $03AE5F |

; l sub
  PHX                             ; $03AE60 |
  PHB                             ; $03AE61 |
  PHK                             ; $03AE62 |
  PLB                             ; $03AE63 |
  LDA $7ECC                       ; $03AE64 |
  LDX #$06                        ; $03AE67 |

CODE_03AE69:
  BIT $ACF6,x                     ; $03AE69 |
  BEQ CODE_03AE76                 ; $03AE6C |
  DEX                             ; $03AE6E |
  DEX                             ; $03AE6F |
  BPL CODE_03AE69                 ; $03AE70 |
  PLB                             ; $03AE72 |
  PLX                             ; $03AE73 |
  BRA CODE_03AEA1                 ; $03AE74 |

CODE_03AE76:
  TXA                             ; $03AE76 |
  ASL A                           ; $03AE77 |
  ASL A                           ; $03AE78 |
  TAY                             ; $03AE79 |
  LDA $ACF6,x                     ; $03AE7A |
  STA $7ECE,y                     ; $03AE7D |
  TSB $7ECC                       ; $03AE80 |
  TYA                             ; $03AE83 |
  AND #$00FF                      ; $03AE84 |
  PLB                             ; $03AE87 |
  PLX                             ; $03AE88 |
  STA $7722,x                     ; $03AE89 |
  RTL                             ; $03AE8C |
  PHX                             ; $03AE8D |
  PHB                             ; $03AE8E |
  PHK                             ; $03AE8F |
  PLB                             ; $03AE90 |
  LDA $7ECC                       ; $03AE91 |
  LDX #$04                        ; $03AE94 |

CODE_03AE96:
  BIT $ACFE,x                     ; $03AE96 |
  BEQ CODE_03AEA7                 ; $03AE99 |
  DEX                             ; $03AE9B |
  DEX                             ; $03AE9C |
  BPL CODE_03AE96                 ; $03AE9D |
  PLB                             ; $03AE9F |
  PLX                             ; $03AEA0 |

CODE_03AEA1:
  PLA                             ; $03AEA1 |
  PLY                             ; $03AEA2 |
  JML $03A31E                     ; $03AEA3 |

CODE_03AEA7:
  TXA                             ; $03AEA7 |
  ASL A                           ; $03AEA8 |
  ASL A                           ; $03AEA9 |
  TAY                             ; $03AEAA |
  LDA $ACFE,x                     ; $03AEAB |
  STA $7ECE,y                     ; $03AEAE |
  TSB $7ECC                       ; $03AEB1 |
  TYA                             ; $03AEB4 |
  AND #$00FF                      ; $03AEB5 |
  PLB                             ; $03AEB8 |
  PLX                             ; $03AEB9 |
  STA $7722,x                     ; $03AEBA |
  RTL                             ; $03AEBD |

; l sub
  PHX                             ; $03AEBE |
  PHB                             ; $03AEBF |
  PHK                             ; $03AEC0 |
  PLB                             ; $03AEC1 |
  LDA $7ECC                       ; $03AEC2 |
  LDX #$04                        ; $03AEC5 |

CODE_03AEC7:
  BIT $ACF0,x                     ; $03AEC7 |
  BEQ CODE_03AED4                 ; $03AECA |
  DEX                             ; $03AECC |
  DEX                             ; $03AECD |
  BPL CODE_03AEC7                 ; $03AECE |
  PLB                             ; $03AED0 |
  PLX                             ; $03AED1 |
  BRA CODE_03AEA1                 ; $03AED2 |

CODE_03AED4:
  TXA                             ; $03AED4 |
  ASL A                           ; $03AED5 |
  ASL A                           ; $03AED6 |
  TAY                             ; $03AED7 |
  LDA $ACF0,x                     ; $03AED8 |
  STA $7ECE,y                     ; $03AEDB |
  TSB $7ECC                       ; $03AEDE |
  TYA                             ; $03AEE1 |
  AND #$00FF                      ; $03AEE2 |
  PLB                             ; $03AEE5 |
  PLX                             ; $03AEE6 |
  STA $7722,x                     ; $03AEE7 |
  RTL                             ; $03AEEA |

; l sub
  LDA $7ECC                       ; $03AEEB |
  BNE CODE_03AEA1                 ; $03AEEE |
  LDA #$FFFF                      ; $03AEF0 |
  STA $7ECE                       ; $03AEF3 |
  STA $7ECC                       ; $03AEF6 |
  STZ $7722,x                     ; $03AEF9 |
  RTL                             ; $03AEFC |

; l sub
  LDY $7722,x                     ; $03AEFD |
  LDA $7ECE,y                     ; $03AF00 |
  TRB $7ECC                       ; $03AF03 |
  LDA #$FFFF                      ; $03AF06 |
  STA $7722,x                     ; $03AF09 |
  RTL                             ; $03AF0C |

; l sub
  LDY $7722,x                     ; $03AF0D |
  BMI CODE_03AF1E                 ; $03AF10 |
  LDA $7ECE,y                     ; $03AF12 |
  TRB $7ECC                       ; $03AF15 |
  LDA #$FFFF                      ; $03AF18 |
  STA $7722,x                     ; $03AF1B |

CODE_03AF1E:
  RTL                             ; $03AF1E |

; gsu routine addresses
DATA_03AF1F:         dw $867E, $8205

; sub $AF23
  LDA $7D38,x                     ; $03AF23 |
  BEQ CODE_03AF42                 ; $03AF26 |
  LDY $7722,x                     ; $03AF28 |
  BMI CODE_03AF42                 ; $03AF2B |
  LDA $7403,x                     ; $03AF2D |
  AND #$00FF                      ; $03AF30 |
  BEQ CODE_03AF42                 ; $03AF33 |
  DEC A                           ; $03AF35 |
  BNE CODE_03AF3E                 ; $03AF36 |
  JSL $03AA2E                     ; $03AF38 |
  BRA CODE_03AF42                 ; $03AF3C |

CODE_03AF3E:
  JSL $03AA52                     ; $03AF3E |

CODE_03AF42:
  LDY $6F00,x                     ; $03AF42 |
  CPY #$10                        ; $03AF45 |
  BNE CODE_03AF54                 ; $03AF47 |
  LDA $61B0                       ; $03AF49 | entry point
  ORA $0B55                       ; $03AF4C |
  ORA $0398                       ; $03AF4F |
  BEQ CODE_03AF57                 ; $03AF52 |

CODE_03AF54:
  PLA                             ; $03AF54 |
  PLY                             ; $03AF55 |
  RTL                             ; $03AF56 |

CODE_03AF57:
  LDA $7D96,x                     ; $03AF57 |
  BEQ CODE_03AFB0                 ; $03AF5A |
  CMP #$0020                      ; $03AF5C |
  BCS CODE_03AF76                 ; $03AF5F |
  LSR A                           ; $03AF61 |
  BNE CODE_03AF6B                 ; $03AF62 |
  LDA #$0077                      ; $03AF64 |\ play sound #$0077
  JSL $0085D2                     ; $03AF67 |/

CODE_03AF6B:
  AND #$0001                      ; $03AF6B |
  ASL A                           ; $03AF6E |
  DEC A                           ; $03AF6F |
  ADC $70E2,x                     ; $03AF70 |
  STA $70E2,x                     ; $03AF73 |

CODE_03AF76:
  LDA $7042,x                     ; $03AF76 |
  AND #$00F1                      ; $03AF79 |
  ORA #$0006                      ; $03AF7C |
  STA $7042,x                     ; $03AF7F |
  LDA $7A98,x                     ; $03AF82 |
  BNE CODE_03AF91                 ; $03AF85 |
  LDA #$000C                      ; $03AF87 |
  STA $7A98,x                     ; $03AF8A |
  JSL $03B5C3                     ; $03AF8D |

CODE_03AF91:
  LDA $7D38,x                     ; $03AF91 | spat
  BNE CODE_03AFB6                 ; $03AF94 |
  DEC $7D96,x                     ; $03AF96 |
  BNE CODE_03AFA9                 ; $03AF99 |
  JSL $04849E                     ; $03AF9B |
  JSL $03B078                     ; $03AF9F |
  LDA #$FD00                      ; $03AFA3 |
  STA $7222,x                     ; $03AFA6 |

CODE_03AFA9:
  JSL $03A1BE                     ; $03AFA9 |
  PLA                             ; $03AFAD |
  PLY                             ; $03AFAE |
  RTL                             ; $03AFAF |

CODE_03AFB0:
  LDA $7D38,x                     ; $03AFB0 | spat
  BNE CODE_03AFB6                 ; $03AFB3 |
  RTL                             ; $03AFB5 |
; this code handles being spat
CODE_03AFB6:
  DEC A                           ; $03AFB6 |\  only decrement
  BEQ CODE_03AFBC                 ; $03AFB7 | | if > $01
  DEC $7D38,x                     ; $03AFB9 |/

CODE_03AFBC:
  LDY $7722,x                     ; $03AFBC |
  BMI CODE_03AFF0                 ; $03AFBF |
  LDA $7403,x                     ; $03AFC1 |
  AND #$00FF                      ; $03AFC4 |
  BEQ CODE_03AFF0                 ; $03AFC7 |
  LDA $16,x                       ; $03AFC9 |
  CLC                             ; $03AFCB |
  ADC #$0010                      ; $03AFCC |
  AND #$00FF                      ; $03AFCF |
  STA $16,x                       ; $03AFD2 |
  STA $300A                       ; $03AFD4 |
  LDA #$0100                      ; $03AFD7 |
  STA $300C                       ; $03AFDA |
  JSL $03B631                     ; $03AFDD |
  LDA $03AF1F,x                   ; $03AFE1 | table $AF1F access
  LDX #$08                        ; $03AFE5 |
  JSL $7EDE44                     ; $03AFE7 | gsu code: DATA_08xxxx:         (table value)

  INC $0CF9                       ; $03AFEB |
  LDX $12                         ; $03AFEE |

CODE_03AFF0:
  LDA $7860,x                     ; $03AFF0 |
  AND #$000C                      ; $03AFF3 |
  BEQ CODE_03B02B                 ; $03AFF6 |
  LDA $7542,x                     ; $03AFF8 |
  CMP #$0040                      ; $03AFFB |
  BCS CODE_03B005                 ; $03AFFE |
  JSR CODE_03B11B                 ; $03B000 |
  BRA CODE_03B02B                 ; $03B003 |

CODE_03B005:
  LDA $7220,x                     ; $03B005 |
  CMP #$8000                      ; $03B008 |
  ROR A                           ; $03B00B |
  CMP #$8000                      ; $03B00C |
  ROR A                           ; $03B00F |
  STA $7220,x                     ; $03B010 |
  LDA #$0040                      ; $03B013 |
  STA $7542,x                     ; $03B016 |
  LDA $7D96,x                     ; $03B019 |
  BEQ CODE_03B024                 ; $03B01C |
  PLA                             ; $03B01E |
  PLY                             ; $03B01F |
  JML $03B595                     ; $03B020 |

CODE_03B024:
  LDA #$001F                      ; $03B024 |
  JSL $03B212                     ; $03B027 |

CODE_03B02B:
  LDA $7860,x                     ; $03B02B |
  BIT #$0001                      ; $03B02E |
  BNE CODE_03B04D                 ; $03B031 |
  AND #$0002                      ; $03B033 |
  BEQ CODE_03B058                 ; $03B036 |
  LDA $7542,x                     ; $03B038 |
  CMP #$0040                      ; $03B03B |
  BCC CODE_03B055                 ; $03B03E |
  STZ $7222,x                     ; $03B040 |
  LDA #$001F                      ; $03B043 |
  JSL $03B212                     ; $03B046 |
  JMP CODE_03B0C1                 ; $03B04A |

CODE_03B04D:
  LDA $7542,x                     ; $03B04D |
  CMP #$0040                      ; $03B050 |
  BCS CODE_03B05B                 ; $03B053 |

CODE_03B055:
  JSR CODE_03B11B                 ; $03B055 |

CODE_03B058:
  JMP CODE_03B0C1                 ; $03B058 |

CODE_03B05B:
  LDA #$001F                      ; $03B05B |
  JSL $03B212                     ; $03B05E |
  JSL $03A58B                     ; $03B062 |
  LDA $18,x                       ; $03B066 |
  CMP #$0003                      ; $03B068 |
  BCC CODE_03B0AC                 ; $03B06B |
  LDA $6FA2,x                     ; $03B06D |
  AND #$6000                      ; $03B070 |
  BNE CODE_03B078                 ; $03B073 |
  STZ $7220,x                     ; $03B075 |

CODE_03B078:
  JSL $03AF0D                     ; $03B078 | entry point
  TXY                             ; $03B07C |
  LDA $7360,x                     ; $03B07D |
  JSL $03A377                     ; $03B080 |
  LDA $77C2,x                     ; $03B084 |
  AND #$00FF                      ; $03B087 |
  STA $7400,x                     ; $03B08A |
  JSL $039A6C                     ; $03B08D |
  LDA $7D96,x                     ; $03B091 |
  BEQ CODE_03B0A5                 ; $03B094 |
  STZ $7220,x                     ; $03B096 |
  LDA $7042,x                     ; $03B099 |
  AND #$00F1                      ; $03B09C |
  ORA #$0006                      ; $03B09F |
  STA $7042,x                     ; $03B0A2 |

CODE_03B0A5:
  RTL                             ; $03B0A5 |

; table (data) - starts at $B0A4 in code
DATA_03B0A6:         dw $FD80, $FDC0
DATA_03B0AA:         dw $FE00

; continuation of sub
CODE_03B0AC:
  INC $18,x                       ; $03B0AC |
  LDA $18,x                       ; $03B0AE |
  ASL A                           ; $03B0B0 |
  TXY                             ; $03B0B1 |
  TAX                             ; $03B0B2 |
  LDA $03B0A4,x                   ; $03B0B3 |
  TYX                             ; $03B0B7 |
  STA $7222,x                     ; $03B0B8 |
  LDA #$0040                      ; $03B0BB |
  STA $7542,x                     ; $03B0BE |

CODE_03B0C1:
  LDY $7D36,x                     ; $03B0C1 |
  DEY                             ; $03B0C4 |
  BMI CODE_03B118                 ; $03B0C5 |
  LDA $6F00,y                     ; $03B0C7 |
  CMP #$0010                      ; $03B0CA |
  BNE CODE_03B118                 ; $03B0CD |
  LDA $7D96,y                     ; $03B0CF |
  BEQ CODE_03B0DF                 ; $03B0D2 |
  PHY                             ; $03B0D4 |
  TYX                             ; $03B0D5 |
  JSL $03B595                     ; $03B0D6 |
  PLY                             ; $03B0DA |
  LDX $12                         ; $03B0DB |
  BRA CODE_03B0EE                 ; $03B0DD |

CODE_03B0DF:
  LDA $6FA0,y                     ; $03B0DF |
  AND #$0020                      ; $03B0E2 |
  BNE CODE_03B118                 ; $03B0E5 |
  TYX                             ; $03B0E7 |
  JSL $03B24B                     ; $03B0E8 |
  BCS CODE_03B118                 ; $03B0EC |

CODE_03B0EE:
  LDA $7542,x                     ; $03B0EE |
  CMP #$0040                      ; $03B0F1 |
  BCS CODE_03B10B                 ; $03B0F4 |
  LDA $7360,x                     ; $03B0F6 |
  CMP #$0022                      ; $03B0F9 |
  BCC CODE_03B10B                 ; $03B0FC |
  CMP #$002C                      ; $03B0FE |
  BCS CODE_03B10B                 ; $03B101 |
  LDA #$0004                      ; $03B103 |
  STA $7542,x                     ; $03B106 |
  BRA CODE_03B118                 ; $03B109 |

CODE_03B10B:
  LDA $7D96,x                     ; $03B10B |
  BEQ CODE_03B114                 ; $03B10E |
  JML $03B595                     ; $03B110 |

CODE_03B114:
  JSL $03B24B                     ; $03B114 |

CODE_03B118:
  PLA                             ; $03B118 |
  PLY                             ; $03B119 |
  RTL                             ; $03B11A |
; end $AF23

; sub
CODE_03B11B:
  CMP #$0002                      ; $03B11B |
  BCS CODE_03B123                 ; $03B11E |
  LDA #$FFCE                      ; $03B120 |

CODE_03B123:
  ADC #$0099                      ; $03B123 |
  CMP #$009F                      ; $03B126 |
  BCC CODE_03B12E                 ; $03B129 |
  LDA #$009E                      ; $03B12B |

CODE_03B12E:
  JSL $03B212                     ; $03B12E |
  RTS                             ; $03B132 |

; l sub
  LDY $7D36,x                     ; $03B133 |
  BPL CODE_03B140                 ; $03B136 |
  JSL $03D35D                     ; $03B138 |
  TYX                             ; $03B13C |
  JSR ($B141,x)                   ; $03B13D | jumps to address in table

CODE_03B140:
  RTL                             ; $03B140 |

; sub table
DATA_03B141:         dw $B149, $B149
DATA_03B145:         dw $B18B, $B1C4

; $B141 table sub
  LDX $12                         ; $03B149 |
  LDA $7C16,x                     ; $03B14B |
  EOR $7220,x                     ; $03B14E |
  BPL CODE_03B18A                 ; $03B151 |
  LDA #$001C                      ; $03B153 |\ play sound #$001C
  JSL $0085D2                     ; $03B156 |/
  LDA #$FE00                      ; $03B15A |
  LDY $77C2,x                     ; $03B15D |
  BEQ CODE_03B165                 ; $03B160 |
  LDA #$0200                      ; $03B162 |

CODE_03B165:
  STA $60B4                       ; $03B165 |
  STA $60A8                       ; $03B168 |
  EOR #$FFFF                      ; $03B16B |
  INC A                           ; $03B16E |
  STA $7220,x                     ; $03B16F |
  LDA #$FD00                      ; $03B172 |
  STA $60AA                       ; $03B175 |
  LDA #$0008                      ; $03B178 |
  STA $60C0                       ; $03B17B |
  LDA #$FD00                      ; $03B17E |
  STA $7222,x                     ; $03B181 |
  LDA #$0040                      ; $03B184 |
  STA $7542,x                     ; $03B187 |

CODE_03B18A:
  RTS                             ; $03B18A |

; $B141 table sub
  LDX $12                         ; $03B18B |
  LDA $7C18,x                     ; $03B18D |
  EOR $7222,x                     ; $03B190 |
  BPL CODE_03B1C3                 ; $03B193 |
  LDA #$001C                      ; $03B195 |\ play sound #$001C
  JSL $0085D2                     ; $03B198 |/
  LDA $7222,x                     ; $03B19C |
  BPL CODE_03B1A4                 ; $03B19F |
  LDA #$0000                      ; $03B1A1 |

CODE_03B1A4:
  BIT $60AA                       ; $03B1A4 |
  BMI CODE_03B1AE                 ; $03B1A7 |
  CMP $60AA                       ; $03B1A9 |
  BMI CODE_03B1B1                 ; $03B1AC |

CODE_03B1AE:
  STA $60AA                       ; $03B1AE |

CODE_03B1B1:
  LDA #$0005                      ; $03B1B1 |
  STA $60C2                       ; $03B1B4 |
  LDA #$FC00                      ; $03B1B7 |
  STA $7222,x                     ; $03B1BA |
  LDA #$0040                      ; $03B1BD |
  STA $7542,x                     ; $03B1C0 |

CODE_03B1C3:
  RTS                             ; $03B1C3 |

; $B141 table sub
  LDX $12                         ; $03B1C4 |
  LDA $7C18,x                     ; $03B1C6 |
  EOR $7222,x                     ; $03B1C9 |
  BPL CODE_03B20A                 ; $03B1CC |
  LDA #$001C                      ; $03B1CE |\ play sound #$001C
  JSL $0085D2                     ; $03B1D1 |/
  LDA $60AA                       ; $03B1D5 |
  BPL CODE_03B1DD                 ; $03B1D8 |
  LDA #$0000                      ; $03B1DA |

CODE_03B1DD:
  BIT $7222,x                     ; $03B1DD |
  BMI CODE_03B1E7                 ; $03B1E0 |
  CMP $7222,x                     ; $03B1E2 |
  BMI CODE_03B1F0                 ; $03B1E5 |

CODE_03B1E7:
  STA $7222,x                     ; $03B1E7 |
  LDA #$0040                      ; $03B1EA |
  STA $7542,x                     ; $03B1ED |

CODE_03B1F0:
  LDA $60FC                       ; $03B1F0 | -- entry point
  AND #$0018                      ; $03B1F3 |
  BNE CODE_03B1FE                 ; $03B1F6 |
  LDA #$FC00                      ; $03B1F8 |
  STA $60AA                       ; $03B1FB |

CODE_03B1FE:
  LDA #$0008                      ; $03B1FE |
  STA $60C0                       ; $03B201 |
  LDA #$8001                      ; $03B204 |
  STA $60D2                       ; $03B207 |

CODE_03B20A:
  RTS                             ; $03B20A |

; l sub - pretty much calls above at the entry point
  STZ $60D4                       ; $03B20B |
  JSR CODE_03B1F0                 ; $03B20E |
  RTL                             ; $03B211 |

; l sub
  JSL $0085D2                     ; $03B212 |
  LDA #$0040                      ; $03B216 |
  STA $61F2                       ; $03B219 |
  LDA $70E2,x                     ; $03B21C |
  STA $6EB2                       ; $03B21F |
  LDA $7182,x                     ; $03B222 |
  STA $6EB4                       ; $03B225 |
  RTL                             ; $03B228 |

; table - actually starts at $B223 but probably is meant for this
DATA_03B229:         dw $0001, $0003
DATA_03B22D:         dw $0005

; l sub
  LDY $7D36,x                     ; $03B22F |
  BEQ CODE_03B248                 ; $03B232 |
  BPL CODE_03B23B                 ; $03B234 |
  JSL $03A5BE                     ; $03B236 |
  RTL                             ; $03B23A |

CODE_03B23B:
  LDA $6EFF,y                     ; $03B23B |
  CMP #$0010                      ; $03B23E |
  BNE CODE_03B248                 ; $03B241 |
  LDA $7D37,y                     ; $03B243 |
  BNE CODE_03B249                 ; $03B246 |

CODE_03B248:
  RTL                             ; $03B248 |

CODE_03B249:
  DEY                             ; $03B249 |
  TYX                             ; $03B24A |
  JSL $04906C                     ; $03B24B | entry point
  BEQ CODE_03B257                 ; $03B24F |
  JSL $0EBE8D                     ; $03B251 |
  BNE CODE_03B25B                 ; $03B255 |

CODE_03B257:
  LDX $12                         ; $03B257 |
  SEC                             ; $03B259 |
  RTL                             ; $03B25A |

CODE_03B25B:
  LDA $7360,x                     ; $03B25B | entry point
  CMP #$0028                      ; $03B25E |
  BNE CODE_03B266                 ; $03B261 |

CODE_03B263:
  JMP CODE_03B34C                 ; $03B263 |

CODE_03B266:
  CMP #$002B                      ; $03B266 |
  BNE CODE_03B273                 ; $03B269 |
  LDA $75E2,x                     ; $03B26B |
  CMP #$0401                      ; $03B26E |
  BCS CODE_03B263                 ; $03B271 |

CODE_03B273:
  LDA #$000C                      ; $03B273 | entry point
  STA $6F00,x                     ; $03B276 |
  STZ $7222,x                     ; $03B279 |
  LDA #$0400                      ; $03B27C |
  STA $75E2,x                     ; $03B27F |
  STZ $7220,x                     ; $03B282 |
  STZ $7540,x                     ; $03B285 |
  LDA $7360,x                     ; $03B288 | entry point
  CMP #$0022                      ; $03B28B |
  BCC CODE_03B2D0                 ; $03B28E |
  CMP #$002C                      ; $03B290 |
  BCS CODE_03B2D0                 ; $03B293 |
  CMP #$0026                      ; $03B295 |
  BCC CODE_03B2BF                 ; $03B298 |
  CMP #$0027                      ; $03B29A |
  BEQ CODE_03B2AF                 ; $03B29D |
  LDA $7542,x                     ; $03B29F |
  CMP #$0040                      ; $03B2A2 |
  BCC CODE_03B313                 ; $03B2A5 |
  LDA $7360,x                     ; $03B2A7 |
  CMP #$0029                      ; $03B2AA |
  BCS CODE_03B313                 ; $03B2AD |

CODE_03B2AF:
  LDA #$0001                      ; $03B2AF |
  STA $18,x                       ; $03B2B2 |
  LDA #$0040                      ; $03B2B4 |
  STA $7542,x                     ; $03B2B7 |
  STZ $7D38,x                     ; $03B2BA |
  BRA CODE_03B30B                 ; $03B2BD |

CODE_03B2BF:
  JSR CODE_03B3C2                 ; $03B2BF |
  LDA #$0040                      ; $03B2C2 |
  STA $7542,x                     ; $03B2C5 |

CODE_03B2C8:
  LDA #$0010                      ; $03B2C8 |
  STA $6F00,x                     ; $03B2CB |
  BRA CODE_03B31C                 ; $03B2CE |

CODE_03B2D0:
  CMP #$0107                      ; $03B2D0 |
  BNE CODE_03B2DC                 ; $03B2D3 |
  JSL $01AE1E                     ; $03B2D5 |
  JMP CODE_03B3BE                 ; $03B2D9 |

CODE_03B2DC:
  LDA #$0040                      ; $03B2DC |
  STA $7542,x                     ; $03B2DF |
  LDA $7360,x                     ; $03B2E2 |
  CMP #$01A5                      ; $03B2E5 |
  BCC CODE_03B34E                 ; $03B2E8 |
  CMP #$01AA                      ; $03B2EA |
  BCS CODE_03B34E                 ; $03B2ED |
  LDA $7A98,x                     ; $03B2EF |
  BNE CODE_03B34C                 ; $03B2F2 |
  LDY $12                         ; $03B2F4 |
  PHY                             ; $03B2F6 |
  STX $12                         ; $03B2F7 |
  JSL $02B2BB                     ; $03B2F9 |
  PLY                             ; $03B2FD |
  STY $12                         ; $03B2FE |
  LDA $7360,y                     ; $03B300 |
  CMP #$0199                      ; $03B303 |
  BNE CODE_03B30B                 ; $03B306 |
  JMP CODE_03B3AD                 ; $03B308 |

CODE_03B30B:
  LDA #$0010                      ; $03B30B |
  STA $6F00,x                     ; $03B30E |
  BRA CODE_03B31C                 ; $03B311 |

CODE_03B313:
  LDA #$000E                      ; $03B313 |
  STA $6F00,x                     ; $03B316 |
  STZ $7D38,x                     ; $03B319 |

CODE_03B31C:
  LDY $12                         ; $03B31C |
  LDA $7C76,y                     ; $03B31E |
  BNE CODE_03B328                 ; $03B321 |
  CPX $7972                       ; $03B323 |
  BRA CODE_03B331                 ; $03B326 |

CODE_03B328:
  CPX $12                         ; $03B328 |
  BEQ CODE_03B330                 ; $03B32A |
  EOR #$FFFF                      ; $03B32C |
  INC A                           ; $03B32F |

CODE_03B330:
  ASL A                           ; $03B330 |

CODE_03B331:
  LDA #$FF00                      ; $03B331 |
  BCC CODE_03B339                 ; $03B334 |
  LDA #$0100                      ; $03B336 |

CODE_03B339:
  STA $7220,x                     ; $03B339 |
  LDA #$FE00                      ; $03B33C |
  STA $7222,x                     ; $03B33F |
  LDA #$0040                      ; $03B342 |
  STA $7542,x                     ; $03B345 |
  JSL $03A0A1                     ; $03B348 |

CODE_03B34C:
  BRA CODE_03B3B6                 ; $03B34C |

CODE_03B34E:
  CMP #$0115                      ; $03B34E |
  BNE CODE_03B380                 ; $03B351 |
  LDA $7042,x                     ; $03B353 |
  BIT #$0002                      ; $03B356 |
  BEQ CODE_03B373                 ; $03B359 |
  JSL $03A4E9                     ; $03B35B |
  LDA #$0093                      ; $03B35F |
  INC $03B4                       ; $03B362 |
  LDY $03B4                       ; $03B365 |
  CPY #$14                        ; $03B368 |
  BMI CODE_03B36D                 ; $03B36A |
  INC A                           ; $03B36C |

CODE_03B36D:
  JSL $0085D2                     ; $03B36D |
  BRA CODE_03B3BE                 ; $03B371 |

CODE_03B373:
  JSL $03A520                     ; $03B373 |
  LDA #$0009                      ; $03B377 |\ play sound #$0009
  JSL $0085D2                     ; $03B37A |/
  BRA CODE_03B3BE                 ; $03B37E |

CODE_03B380:
  CMP #$0100                      ; $03B380 |
  BNE CODE_03B39C                 ; $03B383 |
  LDA $70E2,x                     ; $03B385 |
  STA $0000                       ; $03B388 |
  LDA $7182,x                     ; $03B38B |
  SEC                             ; $03B38E |
  SBC #$0004                      ; $03B38F |
  STA $0002                       ; $03B392 |
  LDA $18,x                       ; $03B395 |
  INC A                           ; $03B397 |
  JSL $03A4A5                     ; $03B398 |

CODE_03B39C:
  LDY $12                         ; $03B39C |
  LDA $7360,y                     ; $03B39E |
  CMP #$0107                      ; $03B3A1 |
  BNE CODE_03B3AD                 ; $03B3A4 |
  TXY                             ; $03B3A6 |
  JSR CODE_03B42F                 ; $03B3A7 |
  JMP CODE_03B2C8                 ; $03B3AA |

CODE_03B3AD:
  SEP #$20                        ; $03B3AD |
  LDA #$FF                        ; $03B3AF |
  STA $74A0,x                     ; $03B3B1 |
  REP #$20                        ; $03B3B4 |

CODE_03B3B6:
  CPX $61B6                       ; $03B3B6 |
  BNE CODE_03B3BE                 ; $03B3B9 |
  STZ $61B6                       ; $03B3BB |

CODE_03B3BE:
  LDX $12                         ; $03B3BE |
  CLC                             ; $03B3C0 |
  RTL                             ; $03B3C1 |
; end $B22F

; sub
CODE_03B3C2:
  LDA $70E2,x                     ; $03B3C2 |
  STA $0000                       ; $03B3C5 |
  LDA $7182,x                     ; $03B3C8 |
  STA $0002                       ; $03B3CB |
  LDA $7042,x                     ; $03B3CE |
  STA $0004                       ; $03B3D1 |
  PHX                             ; $03B3D4 |
  JSL $04F88E                     ; $03B3D5 |
  PLX                             ; $03B3D9 |
  TXY                             ; $03B3DA |
  LDA $7360,x                     ; $03B3DB |
  SEC                             ; $03B3DE |
  SBC #$0022                      ; $03B3DF |
  ASL A                           ; $03B3E2 |
  TAX                             ; $03B3E3 |
  JSR ($B3E9,x)                   ; $03B3E4 | table address
  TYX                             ; $03B3E7 |
  RTS                             ; $03B3E8 |

; sub address table (used just above)
DATA_03B3E9:         dw $B3FA, $B42A
DATA_03B3ED:         dw $B41D, $B3F1

; $B3E9 table address
  TYX                             ; $03B3F1 |
  PLA                             ; $03B3F2 | these two pulls effectively get rid of
  PLA                             ; $03B3F3 | the return address
  JSL $03A31E                     ; $03B3F4 |
; this branch leads to an RTL which means it's going all the way back to wherever $B3C2 was called
  BRA CODE_03B3BE                 ; $03B3F8 |

; $B3E9 table address
  LDA #$0115                      ; $03B3FA |
  JSL $03A377                     ; $03B3FD |
  LDA $7042,y                     ; $03B401 |
  EOR #$0006                      ; $03B404 |
  STA $7042,y                     ; $03B407 |

CODE_03B40A:
  LDA #$0100                      ; $03B40A | entry point
  STA $7A96,y                     ; $03B40D |
  LDA #$0140                      ; $03B410 |
  STA $7A98,y                     ; $03B413 |
  LDA #$0010                      ; $03B416 |
  STA $7AF6,y                     ; $03B419 |
  RTS                             ; $03B41C |

; creates a coin
  LDA #$0115                      ; $03B41D |
  JSL $03A377                     ; $03B420 |
  BRA CODE_03B40A                 ; $03B424 |

; I have no idea where this is ever called from, perhaps from another bank or a table I haven't reached yet
  JSR CODE_03B42F                 ; $03B426 |
  RTL                             ; $03B429 |

; $B3E9 table address
  LDA #$0001                      ; $03B42A |
  BRA CODE_03B432                 ; $03B42D |

CODE_03B42F:
  LDA #$0000                      ; $03B42F | entry point - loads 0 instead of 1

CODE_03B432:
  STA $08                         ; $03B432 |
  LDA $03B6                       ; $03B434 |
  CMP #$012C                      ; $03B437 |
  LDA #$01A2                      ; $03B43A |
  BCC CODE_03B442                 ; $03B43D |
  LDA #$0115                      ; $03B43F |

CODE_03B442:
  JSL $03A377                     ; $03B442 |
  LDA #$0000                      ; $03B446 |
  STA $7D96,y                     ; $03B449 |
  LDA $03B6                       ; $03B44C |
  CMP #$012C                      ; $03B44F |
  BCC CODE_03B459                 ; $03B452 |
  JSR CODE_03B40A                 ; $03B454 |
  BRA CODE_03B468                 ; $03B457 |

CODE_03B459:
  LDA #$0180                      ; $03B459 |
  STA $7A96,y                     ; $03B45C |
  SEP #$20                        ; $03B45F |
  LDA #$FF                        ; $03B461 |
  STA $74A0,y                     ; $03B463 |
  REP #$20                        ; $03B466 |

CODE_03B468:
  LDA $08                         ; $03B468 |
  BEQ CODE_03B479                 ; $03B46A |
  PHY                             ; $03B46C |
  LDA $03B6                       ; $03B46D |
  CLC                             ; $03B470 |
  ADC #$000A                      ; $03B471 |
  JSL $03C793                     ; $03B474 |
  PLY                             ; $03B478 |

CODE_03B479:
  RTS                             ; $03B479 |

; l sub
  LDY $03BA                       ; $03B47A |
  CPY #$1E                        ; $03B47D |
  BCS CODE_03B49D                 ; $03B47F |
  PHX                             ; $03B481 |
  STA $04                         ; $03B482 |
  ASL A                           ; $03B484 |
  TAX                             ; $03B485 |
  LDA $03BA                       ; $03B486 |
  CLC                             ; $03B489 |
  ADC $03B223,x                   ; $03B48A |
  CMP #$001E                      ; $03B48E |
  BCC CODE_03B496                 ; $03B491 |
  LDA #$001E                      ; $03B493 |

CODE_03B496:
  STA $03BA                       ; $03B496 |
  PLX                             ; $03B499 |
  JMP CODE_03A4C3                 ; $03B49A |

CODE_03B49D:
  LDA #$0115                      ; $03B49D |
  TXY                             ; $03B4A0 |
  JSL $03A364                     ; $03B4A1 |
  BCC CODE_03B4D5                 ; $03B4A5 |
  LDA $00                         ; $03B4A7 |
  STA $70E2,y                     ; $03B4A9 |
  LDA $02                         ; $03B4AC |
  STA $7182,y                     ; $03B4AE |
  LDA #$0030                      ; $03B4B1 |
  STA $7A96,y                     ; $03B4B4 |
  STA $7A98,y                     ; $03B4B7 |
  STA $7AF6,y                     ; $03B4BA |
  STA $79D8,y                     ; $03B4BD |
  LDA #$FE80                      ; $03B4C0 |
  STA $7222,y                     ; $03B4C3 |
  LDA #$0008                      ; $03B4C6 |
  STA $7542,y                     ; $03B4C9 |
  LDA $6FA2,y                     ; $03B4CC |
  AND #$FFE0                      ; $03B4CF |
  STA $6FA2,y                     ; $03B4D2 |

CODE_03B4D5:
  RTL                             ; $03B4D5 |

; l sub
  PHY                             ; $03B4D6 |
  LDA #$003B                      ; $03B4D7 |
  JSL $03B212                     ; $03B4DA |
  PLY                             ; $03B4DE |
  LDA $70E2,y                     ; $03B4DF |
  STA $00                         ; $03B4E2 |
  LDA $7182,y                     ; $03B4E4 |
  STA $02                         ; $03B4E7 |
  LDA #$0208                      ; $03B4E9 |
  JSL $008B21                     ; $03B4EC |
  LDA $00                         ; $03B4F0 |
  STA $70A2,y                     ; $03B4F2 |
  LDA $02                         ; $03B4F5 |
  STA $7142,y                     ; $03B4F7 |
  LDA #$0003                      ; $03B4FA |
  STA $7782,y                     ; $03B4FD |
  LDA #$0016                      ; $03B500 |
  STA $73C2,y                     ; $03B503 |
  RTL                             ; $03B506 |

; l sub
  JSL $03B25B                     ; $03B507 |
  LDA $70E2,x                     ; $03B50B |
  CLC                             ; $03B50E |
  ADC #$0008                      ; $03B50F |
  STA $00                         ; $03B512 |
  LDA $7182,x                     ; $03B514 |
  CLC                             ; $03B517 |
  ADC #$0008                      ; $03B518 |
  STA $02                         ; $03B51B |
  BRA CODE_03B56B                 ; $03B51D |
  JSL $03B25B                     ; $03B51F |
  LDA $70E2,x                     ; $03B523 |
  CLC                             ; $03B526 |
  ADC $608C                       ; $03B527 |
  CMP #$8000                      ; $03B52A |
  ROR A                           ; $03B52D |
  CLC                             ; $03B52E |
  ADC #$0008                      ; $03B52F |
  STA $00                         ; $03B532 |
  LDA $7182,x                     ; $03B534 |
  CLC                             ; $03B537 |
  ADC $6090                       ; $03B538 |
  BRA CODE_03B555                 ; $03B53B |
  LDA $70E2,x                     ; $03B53D |
  CLC                             ; $03B540 |
  ADC $70E2,y                     ; $03B541 |
  CMP #$8000                      ; $03B544 |
  ROR A                           ; $03B547 |
  CLC                             ; $03B548 |
  ADC #$0008                      ; $03B549 |
  STA $00                         ; $03B54C |
  LDA $7182,x                     ; $03B54E |
  CLC                             ; $03B551 |
  ADC $7182,y                     ; $03B552 |

CODE_03B555:
  CMP #$8000                      ; $03B555 |
  ROR A                           ; $03B558 |
  CLC                             ; $03B559 |
  ADC #$0002                      ; $03B55A |
  STA $02                         ; $03B55D |
  LDA $0CCE                       ; $03B55F |
  BEQ CODE_03B565                 ; $03B562 |
  RTL                             ; $03B564 |

CODE_03B565:
  LDA #$0010                      ; $03B565 |
  STA $0CCE                       ; $03B568 |

CODE_03B56B:
  LDA #$01E6                      ; $03B56B |
  PHA                             ; $03B56E | entry point - lets you pass in A
  LDA #$001C                      ; $03B56F |
  JSL $03B212                     ; $03B572 |
  PLA                             ; $03B576 |
  JSL $008B21                     ; $03B577 |
  LDA $00                         ; $03B57B |
  STA $70A2,y                     ; $03B57D |
  LDA $02                         ; $03B580 |
  STA $7142,y                     ; $03B582 |
  LDA #$0004                      ; $03B585 |
  STA $7782,y                     ; $03B588 |
  LDA #$0007                      ; $03B58B |
  STA $73C2,y                     ; $03B58E |
  STA $7E4C,y                     ; $03B591 |
  RTL                             ; $03B594 |

; l sub
  LDA #$00A1                      ; $03B595 |\ play sound #$00A1
  JSL $0085D2                     ; $03B598 |/
  LDA #$01F2                      ; $03B59C |
  JSL $008B21                     ; $03B59F |
  LDA $70E2,x                     ; $03B5A3 |
  STA $70A2,y                     ; $03B5A6 |
  LDA $7182,x                     ; $03B5A9 |
  STA $7142,y                     ; $03B5AC |
  LDA #$000B                      ; $03B5AF |
  STA $73C2,y                     ; $03B5B2 |
  LDA #$0004                      ; $03B5B5 |
  STA $7782,y                     ; $03B5B8 |
  JSL $03B288                     ; $03B5BB |
  JML $03A31E                     ; $03B5BF |

; l sub
  JSL $008408                     ; $03B5C3 |
  LDA $796F                       ; $03B5C7 |
  AND #$FF00                      ; $03B5CA |
  ORA $7BB8,x                     ; $03B5CD |
  STA $4202                       ; $03B5D0 |
  LDA $7971                       ; $03B5D3 |
  LSR A                           ; $03B5D6 |
  NOP                             ; $03B5D7 |
  NOP                             ; $03B5D8 |
  LDA $4217                       ; $03B5D9 |
  AND #$00FF                      ; $03B5DC |
  BCC CODE_03B5E4                 ; $03B5DF |
  EOR #$FFFF                      ; $03B5E1 |

CODE_03B5E4:
  ADC $70E2,x                     ; $03B5E4 |
  STA $00                         ; $03B5E7 |
  JSL $008408                     ; $03B5E9 |
  LDA $796F                       ; $03B5ED |
  AND #$FF00                      ; $03B5F0 |
  ORA $7BB6,x                     ; $03B5F3 |
  STA $4202                       ; $03B5F6 |
  LDA $7971                       ; $03B5F9 |
  LSR A                           ; $03B5FC |
  NOP                             ; $03B5FD |
  NOP                             ; $03B5FE |
  LDA $4217                       ; $03B5FF |
  AND #$00FF                      ; $03B602 |
  BCC CODE_03B60A                 ; $03B605 |
  EOR #$FFFF                      ; $03B607 |

CODE_03B60A:
  ADC $7182,x                     ; $03B60A |
  STA $02                         ; $03B60D |
  LDA #$01F0                      ; $03B60F |
  JSL $008B21                     ; $03B612 |
  LDA $00                         ; $03B616 |
  STA $70A2,y                     ; $03B618 |
  LDA $02                         ; $03B61B |
  SEC                             ; $03B61D |
  SBC #$0004                      ; $03B61E |
  STA $7142,y                     ; $03B621 |
  LDA #$0006                      ; $03B624 |
  STA $7E4C,y                     ; $03B627 |
  LDA #$0004                      ; $03B62A |
  STA $7782,y                     ; $03B62D |
  RTL                             ; $03B630 |

; l sub
  REP #$10                        ; $03B631 |
  TYX                             ; $03B633 |
  LDA $03A9EE,x                   ; $03B634 |
  STA $3004                       ; $03B638 |
  LDA $03A9CE,x                   ; $03B63B |
  STA $3006                       ; $03B63F |
  LDX $12                         ; $03B642 |
  LDA #$0054                      ; $03B644 |
  STA $301A                       ; $03B647 |
  LDA $7403,x                     ; $03B64A |
  AND #$00FF                      ; $03B64D |
  DEC A                           ; $03B650 |
  ASL A                           ; $03B651 |
  TAY                             ; $03B652 |
  LDA $7360,x                     ; $03B653 |
  ASL A                           ; $03B656 |
  TAX                             ; $03B657 |
  LDA $0AAB14,x                   ; $03B658 |
  TAX                             ; $03B65C |
  AND #$0400                      ; $03B65D |
  BEQ CODE_03B665                 ; $03B660 |
  LDA #$8000                      ; $03B662 |

CODE_03B665:
  STA $00                         ; $03B665 |
  TXA                             ; $03B667 |
  BIT #$0200                      ; $03B668 |
  BEQ CODE_03B66F                 ; $03B66B |
  INC $00                         ; $03B66D |

CODE_03B66F:
  BIT #$0100                      ; $03B66F |
  BEQ CODE_03B67A                 ; $03B672 |
  LDA #$4000                      ; $03B674 |
  TSB $00                         ; $03B677 |
  TXA                             ; $03B679 |

CODE_03B67A:
  AND #$0080                      ; $03B67A |
  TSB $00                         ; $03B67D |
  TXA                             ; $03B67F |
  AND #$0070                      ; $03B680 |
  XBA                             ; $03B683 |
  LSR A                           ; $03B684 |
  TSB $00                         ; $03B685 |
  TXA                             ; $03B687 |
  AND #$000F                      ; $03B688 |
  ASL A                           ; $03B68B |
  ASL A                           ; $03B68C |
  ASL A                           ; $03B68D |
  ORA $00                         ; $03B68E |
  STA $3018                       ; $03B690 | r12
  SEP #$10                        ; $03B693 |
  TYX                             ; $03B695 |
  RTL                             ; $03B696 |

; l sub
  LDA $7860,x                     ; $03B697 |
  LSR A                           ; $03B69A |
  BCS CODE_03B6D9                 ; $03B69B |
  LDA $75E2,x                     ; $03B69D |
  SEC                             ; $03B6A0 |
  SBC $7222,x                     ; $03B6A1 |
  ASL A                           ; $03B6A4 |
  LDA $7542,x                     ; $03B6A5 |
  BCC CODE_03B6AE                 ; $03B6A8 |
  EOR #$FFFF                      ; $03B6AA |
  INC A                           ; $03B6AD |

CODE_03B6AE:
  CLC                             ; $03B6AE |
  ADC $7222,x                     ; $03B6AF |
  STA $7222,x                     ; $03B6B2 |
  AND #$00FF                      ; $03B6B5 |
  XBA                             ; $03B6B8 |
  CLC                             ; $03B6B9 |
  ADC $7180,x                     ; $03B6BA |
  STA $7180,x                     ; $03B6BD |
  LDA $7222,x                     ; $03B6C0 |
  AND #$FF00                      ; $03B6C3 |
  BPL CODE_03B6CB                 ; $03B6C6 |
  ORA #$00FF                      ; $03B6C8 |

CODE_03B6CB:
  XBA                             ; $03B6CB |
  ADC #$0000                      ; $03B6CC |
  STA $72C2,x                     ; $03B6CF |
  CLC                             ; $03B6D2 |
  ADC $7182,x                     ; $03B6D3 |
  STA $7182,x                     ; $03B6D6 |

CODE_03B6D9:
  LDA $75E0,x                     ; $03B6D9 |
  SEC                             ; $03B6DC |
  SBC $7220,x                     ; $03B6DD |
  ASL A                           ; $03B6E0 |
  LDA $7540,x                     ; $03B6E1 |
  BCC CODE_03B6EA                 ; $03B6E4 |
  EOR #$FFFF                      ; $03B6E6 |
  INC A                           ; $03B6E9 |

CODE_03B6EA:
  CLC                             ; $03B6EA |
  ADC $7220,x                     ; $03B6EB |
  STA $7220,x                     ; $03B6EE |
  AND #$00FF                      ; $03B6F1 |
  XBA                             ; $03B6F4 |
  CLC                             ; $03B6F5 |
  ADC $70E0,x                     ; $03B6F6 |
  STA $70E0,x                     ; $03B6F9 |
  LDA $7220,x                     ; $03B6FC |
  AND #$FF00                      ; $03B6FF |
  BPL CODE_03B707                 ; $03B702 |
  ORA #$00FF                      ; $03B704 |

CODE_03B707:
  XBA                             ; $03B707 |
  ADC #$0000                      ; $03B708 |
  STA $72C0,x                     ; $03B70B |
  CLC                             ; $03B70E |
  ADC $70E2,x                     ; $03B70F |
  STA $70E2,x                     ; $03B712 |
  RTL                             ; $03B715 |

; l sub
  LDA $61B0                       ; $03B716 |
  ORA $0B55                       ; $03B719 |
  ORA $0398                       ; $03B71C |
  BEQ CODE_03B741                 ; $03B71F |
  LDA $7A96,x                     ; $03B721 |
  BEQ CODE_03B729                 ; $03B724 |
  DEC $7A96,x                     ; $03B726 |

CODE_03B729:
  LDA $7A98,x                     ; $03B729 |
  BEQ CODE_03B731                 ; $03B72C |
  DEC $7A98,x                     ; $03B72E |

CODE_03B731:
  LDA $7AF6,x                     ; $03B731 |
  BEQ CODE_03B739                 ; $03B734 |
  DEC $7AF6,x                     ; $03B736 |

CODE_03B739:
  LDA $7AF8,x                     ; $03B739 |
  BEQ CODE_03B741                 ; $03B73C |
  DEC $7AF8,x                     ; $03B73E |

CODE_03B741:
  RTL                             ; $03B741 |

init_flashing_egg:
  JSL $03B75E                     ; $03B742 |

init_egg:
  LDA $7902,x                     ; $03B746 |
  BNE CODE_03B759                 ; $03B749 |
  JSL $03D3F8                     ; $03B74B |
  BEQ CODE_03B755                 ; $03B74F |
  JML $03A32E                     ; $03B751 |

CODE_03B755:
  JSL $0ED844                     ; $03B755 |

CODE_03B759:
  RTL                             ; $03B759 | do nothing special on green & giant eggs

; data table
DATA_03B75A:         db $00, $02, $04, $08

; flashing egg init
  TXY                             ; $03B75E |
  LDA $0030                       ; $03B75F |
  AND #$0003                      ; $03B762 |
  TAX                             ; $03B765 |
  LDA $7042,y                     ; $03B766 |
  AND #$00F1                      ; $03B769 |
  ORA $03B75A,x                   ; $03B76C |
  AND #$00FF                      ; $03B770 | only one byte from table
  STA $7042,y                     ; $03B773 |
  TYX                             ; $03B776 |
  RTL                             ; $03B777 |

; data table
DATA_03B778:         dw $0002
DATA_03B77A:         dw $0018
DATA_03B77C:         dw $002C
DATA_03B77E:         dw $0040
DATA_03B780:         dw $0054
DATA_03B782:         dw $0068
DATA_03B784:         dw $007C
DATA_03B786:         dw $0002
DATA_03B788:         dw $FFFE
DATA_03B78A:         dw $0000
DATA_03B78C:         dw $0000
DATA_03B78E:         dw $FFFF
DATA_03B790:         dw $FFFE
DATA_03B792:         dw $FFFE
DATA_03B794:         dw $FFFD
DATA_03B796:         dw $FFFD
DATA_03B798:         dw $FFFD
DATA_03B79A:         dw $FFFD
DATA_03B79C:         dw $FFFE
DATA_03B79E:         dw $FFFE
DATA_03B7A0:         dw $FFFF
DATA_03B7A2:         dw $FFFF
DATA_03B7A4:         dw $0000
DATA_03B7A6:         dw $0000
DATA_03B7A8:         dw $0000
DATA_03B7AA:         dw $0001
DATA_03B7AC:         dw $0000
DATA_03B7AE:         dw $0002
DATA_03B7B0:         dw $0003
DATA_03B7B2:         dw $0003

; might be the giant eggs used in frog fight, not the regular ones
main_giant_egg_frog:
  LDA $7AF8,x                     ; $03B7B4 |
  BNE CODE_03B7BC                 ; $03B7B7 |
  JMP CODE_03B83C                 ; $03B7B9 |

CODE_03B7BC:
  DEC $7AF8,x                     ; $03B7BC |
  BEQ CODE_03B7CD                 ; $03B7BF |
  CMP #$0002                      ; $03B7C1 |
  BNE CODE_03B83B                 ; $03B7C4 |
  LDA #$00FF                      ; $03B7C6 |
  STA $74A2,x                     ; $03B7C9 |
  RTL                             ; $03B7CC |

CODE_03B7CD:
  LDX #$0B                        ; $03B7CD |
  LDA #$C6B7                      ; $03B7CF |
  JSL $7EDE44                     ; $03B7D2 | GSU init
  LDA #$0010                      ; $03B7D6 |
  TRB $7E08                       ; $03B7D9 |
  STZ $60AE                       ; $03B7DC |
  JSL $04EF27                     ; $03B7DF |
  LDA $6090                       ; $03B7E3 |
  CLC                             ; $03B7E6 |
  ADC #$0004                      ; $03B7E7 |
  STA $6090                       ; $03B7EA |
  LDA #$0008                      ; $03B7ED |
  STA $60BE                       ; $03B7F0 |
  STA $60C0                       ; $03B7F3 |
  LDA #$FC00                      ; $03B7F6 |
  STA $60AA                       ; $03B7F9 |
  STZ $60B4                       ; $03B7FC |
  STZ $60D2                       ; $03B7FF |
  LDX $12                         ; $03B802 |
  JSL $03BF87                     ; $03B804 |
  JSL $03A32E                     ; $03B808 |
  LDA #$0061                      ; $03B80C |
  TXY                             ; $03B80F |
  JSL $03A377                     ; $03B810 |
  LDA #$0002                      ; $03B814 |
  STA $6F00,x                     ; $03B817 |
  LDA $6090                       ; $03B81A |
  STA $7182                       ; $03B81D |
  LDA $608C                       ; $03B820 |
  STA $70E2                       ; $03B823 |
  LDA #$BC00                      ; $03B826 |
  STA $6114                       ; $03B829 |
  STZ $61AE                       ; $03B82C |
  STZ $61B0                       ; $03B82F |
  STZ $004D                       ; $03B832 |
  JSL $01B25E                     ; $03B835 |
  LDX $12                         ; $03B839 |

CODE_03B83B:
  RTL                             ; $03B83B |

CODE_03B83C:
  JSL $03B9DD                     ; $03B83C |
  LDA $7E04                       ; $03B840 |
  DEC A                           ; $03B843 |
  BNE CODE_03B876                 ; $03B844 |
  LDA $611C                       ; $03B846 |
  CLC                             ; $03B849 |
  ADC $7CD6                       ; $03B84A |
  LSR A                           ; $03B84D |
  STA $00                         ; $03B84E |
  LDA $611E                       ; $03B850 |
  CLC                             ; $03B853 |
  ADC $7CD8                       ; $03B854 |
  LSR A                           ; $03B857 |
  STA $02                         ; $03B858 |
  LDA #$01E7                      ; $03B85A |
  JSL $03B56E                     ; $03B85D |
  LDA #$0012                      ; $03B861 |
  STA $7AF8,x                     ; $03B864 |
  STA $61AE                       ; $03B867 |
  STA $61B0                       ; $03B86A |
  RTL                             ; $03B86D |

main_flashing_egg:
  JSL $03B75E                     ; $03B86E |

main_egg:
  JSL $03B9DD                     ; $03B872 |

CODE_03B876:
  LDA $78,x                       ; $03B876 |
  BEQ CODE_03B87D                 ; $03B878 |
  JMP CODE_03B96D                 ; $03B87A |

CODE_03B87D:
  LDA $7A36,x                     ; $03B87D |
  BPL CODE_03B883                 ; $03B880 |

CODE_03B882:
  RTL                             ; $03B882 |

CODE_03B883:
  LSR A                           ; $03B883 |
  BEQ CODE_03B88E                 ; $03B884 |
  LDA $7222,x                     ; $03B886 |
  BMI CODE_03B882                 ; $03B889 |
  JMP CODE_03B95E                 ; $03B88B |

CODE_03B88E:
  INC $16,x                       ; $03B88E |
  STZ $7402,x                     ; $03B890 |
  LDA $18,x                       ; $03B893 |
  BNE CODE_03B8FE                 ; $03B895 |
  LDY $7860,x                     ; $03B897 |
  BNE CODE_03B8DA                 ; $03B89A |
  LDA #$0040                      ; $03B89C |
  STA $7542,x                     ; $03B89F |
  LDA #$0400                      ; $03B8A2 |
  STA $75E2,x                     ; $03B8A5 |
  INC $18,x                       ; $03B8A8 |
  LDA $7042,x                     ; $03B8AA |
  ORA #$0020                      ; $03B8AD |
  STA $7042,x                     ; $03B8B0 |
  LDA $6FA0,x                     ; $03B8B3 |
  AND #$FFBF                      ; $03B8B6 |
  ORA #$0200                      ; $03B8B9 |
  STA $6FA0,x                     ; $03B8BC |
  LDY #$01                        ; $03B8BF |
  LDA $7360,x                     ; $03B8C1 |
  CMP #$0029                      ; $03B8C4 |
  BCC CODE_03B8CB                 ; $03B8C7 |
  LDY #$1A                        ; $03B8C9 |

CODE_03B8CB:
  TYA                             ; $03B8CB |
  STA $00                         ; $03B8CC |
  LDA $6FA2,x                     ; $03B8CE |
  AND #$FFC0                      ; $03B8D1 |
  ORA $00                         ; $03B8D4 |
  STA $6FA2,x                     ; $03B8D6 |
  RTL                             ; $03B8D9 |

CODE_03B8DA:
  LDA $7042,x                     ; $03B8DA |
  AND #$00CF                      ; $03B8DD |
  STA $7042,x                     ; $03B8E0 |
  RTL                             ; $03B8E3 |

; sub can continue below

; data table
DATA_03B8E4:         dw $0001, $0001
DATA_03B8E8:         dw $0002, $0002
DATA_03B8EC:         dw $0004, $0004
DATA_03B8F0:         dw $0008, $0008

; data table
DATA_03B8F4:         dw $0101, $0000
DATA_03B8F8:         dw $0404, $0202
DATA_03B8FC:         dw $0404

; continue main_egg
CODE_03B8FE:
  LDA $7AF6,x                     ; $03B8FE |
  BEQ CODE_03B92A                 ; $03B901 |
  LSR A                           ; $03B903 |
  BNE CODE_03B90F                 ; $03B904 |
  TXY                             ; $03B906 |
  JSL $03B4D6                     ; $03B907 |
  JML $03A31E                     ; $03B90B |

CODE_03B90F:
  CMP #$0040                      ; $03B90F |
  BCS CODE_03B92A                 ; $03B912 |
  LSR A                           ; $03B914 |
  LSR A                           ; $03B915 |
  AND #$000E                      ; $03B916 |
  TAY                             ; $03B919 |
  LDA $B8E4,y                     ; $03B91A |
  LDY #$05                        ; $03B91D |
  AND $7AF6,x                     ; $03B91F |
  BEQ CODE_03B926                 ; $03B922 |
  LDY #$FF                        ; $03B924 |

CODE_03B926:
  TYA                             ; $03B926 |
  STA $74A2,x                     ; $03B927 |

CODE_03B92A:
  LDA $7860,x                     ; $03B92A |
  LSR A                           ; $03B92D |
  BCS CODE_03B940                 ; $03B92E |
  LDA #$000A                      ; $03B930 |
  STA $7A98,x                     ; $03B933 |
  LDA $7222,x                     ; $03B936 |
  BPL CODE_03B95E                 ; $03B939 |
  INC $7402,x                     ; $03B93B |
  BRA CODE_03B96C                 ; $03B93E |

CODE_03B940:
  JSL $03A590                     ; $03B940 |
  LDY $7A98,x                     ; $03B944 |
  BEQ CODE_03B954                 ; $03B947 |
  LDA $B8F4,y                     ; $03B949 |
  AND #$00FF                      ; $03B94C |
  STA $7402,x                     ; $03B94F |
  BRA CODE_03B95E                 ; $03B952 |

CODE_03B954:
  LDA $16,x                       ; $03B954 |
  AND #$0010                      ; $03B956 |
  BEQ CODE_03B95E                 ; $03B959 |
  INC $7402,x                     ; $03B95B |

CODE_03B95E:
  LDY $7D36,x                     ; $03B95E |
  BPL CODE_03B96C                 ; $03B961 |
  LDA $60AE                       ; $03B963 |
  BNE CODE_03B96C                 ; $03B966 |
  JSL $03BEB9                     ; $03B968 |

CODE_03B96C:
  RTL                             ; $03B96C |

CODE_03B96D:
  JSL $03BB1D                     ; $03B96D |
  STZ $7402,x                     ; $03B971 |
  LDA $0812,y                     ; $03B974 |
  AND #$FF00                      ; $03B977 |
  BEQ CODE_03B983                 ; $03B97A |
  BPL CODE_03B9BC                 ; $03B97C |
  INC $7402,x                     ; $03B97E |
  BRA CODE_03B9BC                 ; $03B981 |

CODE_03B983:
  LDA $6EBC                       ; $03B983 |
  SEC                             ; $03B986 |
  SBC $70E2,x                     ; $03B987 |
  STA $00                         ; $03B98A |
  ORA $60A8                       ; $03B98C |
  BEQ CODE_03B9AC                 ; $03B98F |
  LDA $16,x                       ; $03B991 |
  AND #$000F                      ; $03B993 |
  ASL A                           ; $03B996 |
  TAY                             ; $03B997 |
  LDA $B78A,y                     ; $03B998 |
  BEQ CODE_03B9A0                 ; $03B99B |
  INC $7402,x                     ; $03B99D |

CODE_03B9A0:
  LDA $00                         ; $03B9A0 |
  BEQ CODE_03B9C3                 ; $03B9A2 |
  BPL CODE_03B9C6                 ; $03B9A4 |
  EOR #$FFFF                      ; $03B9A6 |
  INC A                           ; $03B9A9 |
  BNE CODE_03B9C6                 ; $03B9AA |

CODE_03B9AC:
  LDA $16,x                       ; $03B9AC |
  CLC                             ; $03B9AE |
  ADC #$0010                      ; $03B9AF |
  STA $16,x                       ; $03B9B2 |
  AND #$0100                      ; $03B9B4 |
  BEQ CODE_03B9BC                 ; $03B9B7 |
  INC $7402,x                     ; $03B9B9 |

CODE_03B9BC:
  LDA $16,x                       ; $03B9BC |
  AND #$000F                      ; $03B9BE |
  BEQ CODE_03B9C6                 ; $03B9C1 |

CODE_03B9C3:
  LDA #$0001                      ; $03B9C3 |

CODE_03B9C6:
  SEP #$10                        ; $03B9C6 |
  CLC                             ; $03B9C8 |
  ADC $16,x                       ; $03B9C9 |
  STA $16,x                       ; $03B9CB |
  AND #$000F                      ; $03B9CD |
  ASL A                           ; $03B9D0 |
  TAY                             ; $03B9D1 |
  LDA $7182,x                     ; $03B9D2 |
  CLC                             ; $03B9D5 |
  ADC $B78A,y                     ; $03B9D6 |
  STA $7182,x                     ; $03B9D9 |
  RTL                             ; $03B9DC |
; end main_egg

; l sub
  LDY $6F00,x                     ; $03B9DD |
  CPY #$08                        ; $03B9E0 |
  BNE CODE_03BA43                 ; $03B9E2 |
  LDA $6152                       ; $03B9E4 |
  CLC                             ; $03B9E7 |
  ADC $6154                       ; $03B9E8 |
  CLC                             ; $03B9EB |
  ADC #$0010                      ; $03B9EC |
  CMP #$0021                      ; $03B9EF |
  BCS CODE_03BA43                 ; $03B9F2 |
  STZ $6168                       ; $03B9F4 |
  LDA #$0010                      ; $03B9F7 |
  STA $6F00,x                     ; $03B9FA |
  STZ $7D38,x                     ; $03B9FD |
  STZ $7860,x                     ; $03BA00 |
  STZ $7A96,x                     ; $03BA03 |
  LDA $7360,x                     ; $03BA06 |
  CMP #$0027                      ; $03BA09 |
  BEQ CODE_03BA17                 ; $03BA0C |
  LDA $7040,x                     ; $03BA0E |
  ORA #$0004                      ; $03BA11 |
  STA $7040,x                     ; $03BA14 |

CODE_03BA17:
  LDA #$0040                      ; $03BA17 |
  STA $7542,x                     ; $03BA1A |
  LDA #$FBC0                      ; $03BA1D |
  STA $7222,x                     ; $03BA20 |
  LDA $7C16,x                     ; $03BA23 |
  PHP                             ; $03BA26 |
  BPL CODE_03BA2D                 ; $03BA27 |
  EOR #$FFFF                      ; $03BA29 |
  INC A                           ; $03BA2C |

CODE_03BA2D:
  CLC                             ; $03BA2D |
  ADC #$0100                      ; $03BA2E |
  PLP                             ; $03BA31 |
  BMI CODE_03BA38                 ; $03BA32 |
  EOR #$FFFF                      ; $03BA34 |
  INC A                           ; $03BA37 |

CODE_03BA38:
  CLC                             ; $03BA38 |
  ADC $60A8                       ; $03BA39 |
  STA $7220,x                     ; $03BA3C |
  PLA                             ; $03BA3F |
  PLA                             ; $03BA40 |
  PLA                             ; $03BA41 |
  RTL                             ; $03BA42 |

CODE_03BA43:
  LDA $7D38,x                     ; $03BA43 |
  BNE CODE_03BA57                 ; $03BA46 |
  LDA $78,x                       ; $03BA48 |
  DEC A                           ; $03BA4A |
  BMI CODE_03BA53                 ; $03BA4B |
  LDA $61AE                       ; $03BA4D |
  BNE CODE_03BA53                 ; $03BA50 |
  RTL                             ; $03BA52 |

CODE_03BA53:
  JML $03AF23                     ; $03BA53 |

CODE_03BA57:
  LDY #$34                        ; $03BA57 |
  LDA $7360,x                     ; $03BA59 |
  CMP #$0029                      ; $03BA5C |
  BCC CODE_03BA84                 ; $03BA5F |
  LDA $7860,x                     ; $03BA61 |
  LSR A                           ; $03BA64 |
  BCC CODE_03BA82                 ; $03BA65 |
  LDA #$0060                      ; $03BA67 |
  STA $61C6                       ; $03BA6A |
  JSL $0294B4                     ; $03BA6D |
  JSL $03B273                     ; $03BA71 |
  STZ $7220,x                     ; $03BA75 |
  LDA #$0047                      ; $03BA78 |\ play sound #$0047
  JSL $0085D2                     ; $03BA7B |/
  PLA                             ; $03BA7F |
  PLY                             ; $03BA80 |
  RTL                             ; $03BA81 |

CODE_03BA82:
  LDY #$3A                        ; $03BA82 |

CODE_03BA84:
  TYA                             ; $03BA84 |
  STA $00                         ; $03BA85 |
  LDA $6FA2,x                     ; $03BA87 |
  AND #$FFC0                      ; $03BA8A |
  ORA $00                         ; $03BA8D |
  STA $6FA2,x                     ; $03BA8F |
  LDA $6FA0,x                     ; $03BA92 |
  ORA #$0600                      ; $03BA95 |
  STA $6FA0,x                     ; $03BA98 |
  LDY $7542,x                     ; $03BA9B |
  CPY #$40                        ; $03BA9E |
  BCS CODE_03BA53                 ; $03BAA0 |
  LDA $7A36,x                     ; $03BAA2 |
  DEC A                           ; $03BAA5 |
  BNE CODE_03BAAC                 ; $03BAA6 |
  JSL $03B133                     ; $03BAA8 |

CODE_03BAAC:
  LDY $77C0,x                     ; $03BAAC |
  BNE CODE_03BADF                 ; $03BAAF |
  LDA $7A96,x                     ; $03BAB1 |
  BNE CODE_03BAD0                 ; $03BAB4 |
  LDA $60B0                       ; $03BAB6 |
  CMP #$FFF8                      ; $03BAB9 |
  BMI CODE_03BAD6                 ; $03BABC |
  CMP #$00F8                      ; $03BABE |
  BPL CODE_03BAD6                 ; $03BAC1 |
  LDA $60B2                       ; $03BAC3 |
  CMP #$0000                      ; $03BAC6 |
  BMI CODE_03BAD6                 ; $03BAC9 |
  CMP #$00C0                      ; $03BACB |
  BPL CODE_03BAD6                 ; $03BACE |

CODE_03BAD0:
  JSL $03CD07                     ; $03BAD0 |
  BRA CODE_03BADF                 ; $03BAD4 |

CODE_03BAD6:
  SEP #$20                        ; $03BAD6 |
  LDA #$01                        ; $03BAD8 |
  STA $77C0,x                     ; $03BADA |
  REP #$20                        ; $03BADD |

CODE_03BADF:
  LDA $14                         ; $03BADF |
  AND #$0001                      ; $03BAE1 |
  ORA $61B0                       ; $03BAE4 |
  BNE CODE_03BB19                 ; $03BAE7 |
  LDA #$01DF                      ; $03BAE9 |
  JSL $008B21                     ; $03BAEC |
  LDA $70E2,x                     ; $03BAF0 |
  STA $70A2,y                     ; $03BAF3 |
  LDA $7182,x                     ; $03BAF6 |
  STA $7142,y                     ; $03BAF9 |
  LDA $7042,x                     ; $03BAFC |
  AND #$0030                      ; $03BAFF |
  ORA #$0006                      ; $03BB02 |
  STA $7002,y                     ; $03BB05 |
  LDA #$0006                      ; $03BB08 |
  STA $7462,y                     ; $03BB0B |
  DEC A                           ; $03BB0E |
  STA $7E4C,y                     ; $03BB0F |
  STA $73C2,y                     ; $03BB12 |
  DEC A                           ; $03BB15 |
  STA $7782,y                     ; $03BB16 |

CODE_03BB19:
  JML $03AF23                     ; $03BB19 |

; end B9DD

; l sub
  STZ $7220,x                     ; $03BB1D |
  STZ $7222,x                     ; $03BB20 |
  LDY $78,x                       ; $03BB23 |
  BMI CODE_03BB2A                 ; $03BB25 |
  JMP CODE_03BDA1                 ; $03BB27 |

CODE_03BB2A:
  PLA                             ; $03BB2A |
  PLY                             ; $03BB2B |
  STZ $7402,x                     ; $03BB2C |
  LDA $0B57                       ; $03BB2F |
  BNE CODE_03BB39                 ; $03BB32 |
  LDY $60DE                       ; $03BB34 |
  BNE CODE_03BB6B                 ; $03BB37 |

CODE_03BB39:
  STZ $78,x                       ; $03BB39 |
  INC $18,x                       ; $03BB3B |
  LDA #$0040                      ; $03BB3D |
  STA $7542,x                     ; $03BB40 |
  LDA $7360,x                     ; $03BB43 |
  CMP #$0028                      ; $03BB46 |
  BNE CODE_03BB62                 ; $03BB49 |
  LDA #$FFFF                      ; $03BB4B |
  STA $18,x                       ; $03BB4E |
  LDA $0B57                       ; $03BB50 |
  BNE CODE_03BB5C                 ; $03BB53 |
  LDA $10                         ; $03BB55 |
  AND #$0003                      ; $03BB57 |
  BNE CODE_03BB62                 ; $03BB5A |

CODE_03BB5C:
  LDA #$0030                      ; $03BB5C |
  STA $7AF6,x                     ; $03BB5F |

CODE_03BB62:
  LDA $7FE8                       ; $03BB62 |
  BPL CODE_03BB6A                 ; $03BB65 |
  STZ $7FE8                       ; $03BB67 |

CODE_03BB6A:
  RTL                             ; $03BB6A |

CODE_03BB6B:
  CPY #$06                        ; $03BB6B |
  BCS CODE_03BB89                 ; $03BB6D |
  LDY #$00                        ; $03BB6F |
  LDA $60E4                       ; $03BB71 |
  SEC                             ; $03BB74 |
  SBC $70E2,x                     ; $03BB75 |
  BEQ CODE_03BB82                 ; $03BB78 |
  BPL CODE_03BB7E                 ; $03BB7A |
  LDY #$02                        ; $03BB7C |

CODE_03BB7E:
  TYA                             ; $03BB7E |
  STA $60C4                       ; $03BB7F |

CODE_03BB82:
  LDY $60DE                       ; $03BB82 |
  CPY #$02                        ; $03BB85 |
  BEQ CODE_03BB8C                 ; $03BB87 |

CODE_03BB89:
  JMP CODE_03BD2E                 ; $03BB89 |

CODE_03BB8C:
  STZ $7A36,x                     ; $03BB8C |
  STZ $78,x                       ; $03BB8F |
  LDA #$0020                      ; $03BB91 |
  STA $7D38,x                     ; $03BB94 |
  LDA $60C4                       ; $03BB97 |
  EOR #$0002                      ; $03BB9A |
  STA $7400,x                     ; $03BB9D |
  LDY #$34                        ; $03BBA0 |
  LDA $7360,x                     ; $03BBA2 |
  CMP #$0029                      ; $03BBA5 |
  BCC CODE_03BBB4                 ; $03BBA8 |
  LDY #$3A                        ; $03BBAA |
  LDA $7FE8                       ; $03BBAC |
  BPL CODE_03BBB4                 ; $03BBAF |
  STZ $7FE8                       ; $03BBB1 |

CODE_03BBB4:
  TYA                             ; $03BBB4 |
  STA $00                         ; $03BBB5 |
  LDA $6FA2,x                     ; $03BBB7 |
  AND #$FFC0                      ; $03BBBA |
  ORA $00                         ; $03BBBD |
  STA $6FA2,x                     ; $03BBBF |
  STZ $18,x                       ; $03BBC2 |
  STZ $16,x                       ; $03BBC4 |
  LDA $7360,x                     ; $03BBC6 |
  CMP #$0029                      ; $03BBC9 |
  BCC CODE_03BBE4                 ; $03BBCC |
  LDY $0146                       ; $03BBCE |
  CPY #$0D                        ; $03BBD1 |
  BEQ CODE_03BBE4                 ; $03BBD3 |
  LDA #$0060                      ; $03BBD5 |
  STA $7542,x                     ; $03BBD8 |
  LDA #$0600                      ; $03BBDB |
  STA $75E2,x                     ; $03BBDE |
  JMP CODE_03BCD9                 ; $03BBE1 |

CODE_03BBE4:
  STZ $7542,x                     ; $03BBE4 |
  LDA $7360,x                     ; $03BBE7 |
  CMP #$0028                      ; $03BBEA |
  BNE CODE_03BC53                 ; $03BBED |
  LDA $70E2,x                     ; $03BBEF |
  SEC                             ; $03BBF2 |
  SBC $60E4                       ; $03BBF3 |
  STA $3002                       ; $03BBF6 |
  LDA $7182,x                     ; $03BBF9 |
  SEC                             ; $03BBFC |
  SBC $60E6                       ; $03BBFD |
  STA $3004                       ; $03BC00 |
  LDX #$0B                        ; $03BC03 |
  LDA #$BCF8                      ; $03BC05 |
  JSL $7EDE44                     ; $03BC08 | GSU init
  LDX $12                         ; $03BC0C |
  LDA $3000                       ; $03BC0E |
  LDY $7400,x                     ; $03BC11 |
  BNE CODE_03BC1A                 ; $03BC14 |
  EOR #$00FF                      ; $03BC16 |
  INC A                           ; $03BC19 |

CODE_03BC1A:
  SEC                             ; $03BC1A |
  SBC #$0018                      ; $03BC1B |
  AND #$01FE                      ; $03BC1E |
  PHA                             ; $03BC21 |
  LDY $7400,x                     ; $03BC22 |
  BEQ CODE_03BC2A                 ; $03BC25 |
  ORA #$8000                      ; $03BC27 |

CODE_03BC2A:
  STA $7900,x                     ; $03BC2A |
  REP #$10                        ; $03BC2D |
  PLX                             ; $03BC2F |
  LDA $00E9D4,x                   ; $03BC30 |
  ASL A                           ; $03BC34 |
  ASL A                           ; $03BC35 |
  ASL A                           ; $03BC36 |
  STA $3004                       ; $03BC37 |
  LDA $00E954,x                   ; $03BC3A |
  ASL A                           ; $03BC3E |
  ASL A                           ; $03BC3F |
  ASL A                           ; $03BC40 |
  SEP #$10                        ; $03BC41 |
  LDX $12                         ; $03BC43 |
  LDY $7400,x                     ; $03BC45 |
  BNE CODE_03BC4E                 ; $03BC48 |
  EOR #$FFFF                      ; $03BC4A |
  INC A                           ; $03BC4D |

CODE_03BC4E:
  STA $3002                       ; $03BC4E |
  BRA CODE_03BCBB                 ; $03BC51 |

CODE_03BC53:
  CMP #$0026                      ; $03BC53 |
  BNE CODE_03BC92                 ; $03BC56 |
  LDA $70E2,x                     ; $03BC58 |
  STA $7902,x                     ; $03BC5B |
  LDA #$000C                      ; $03BC5E |
  STA $7542,x                     ; $03BC61 |
  LDA #$0005                      ; $03BC64 |
  STA $74A2,x                     ; $03BC67 |
  LDA #$0060                      ; $03BC6A |
  STA $6FA0,x                     ; $03BC6D |
  LDA #$2000                      ; $03BC70 |
  STA $6FA2,x                     ; $03BC73 |
  LDA $7040,x                     ; $03BC76 |
  AND #$FFF3                      ; $03BC79 |
  STA $7040,x                     ; $03BC7C |
  LDA $60E4                       ; $03BC7F |
  SEC                             ; $03BC82 |
  SBC $70E2,x                     ; $03BC83 |
  BPL CODE_03BC92                 ; $03BC86 |
  EOR #$FFFF                      ; $03BC88 |
  SEC                             ; $03BC8B |
  ADC $70E2,x                     ; $03BC8C |
  STA $60E4                       ; $03BC8F |

CODE_03BC92:
  LDA $60E4                       ; $03BC92 |
  STA $3002                       ; $03BC95 |
  LDA $60E6                       ; $03BC98 |
  STA $3004                       ; $03BC9B |
  LDA $70E2,x                     ; $03BC9E |
  STA $3006                       ; $03BCA1 |
  LDA $7182,x                     ; $03BCA4 |
  STA $3008                       ; $03BCA7 |
  LDA #$07F0                      ; $03BCAA |
  STA $300C                       ; $03BCAD |
  LDX #$09                        ; $03BCB0 |
  LDA #$907C                      ; $03BCB2 |
  JSL $7EDE44                     ; $03BCB5 | GSU init
  LDX $12                         ; $03BCB9 |

CODE_03BCBB:
  LDA #$0020                      ; $03BCBB |\ play sound #$0020
  JSL $0085D2                     ; $03BCBE |/
  SEP #$20                        ; $03BCC2 |
  LDA #$01                        ; $03BCC4 |
  STA $77C0,x                     ; $03BCC6 |
  REP #$20                        ; $03BCC9 |
  STZ $7A96,x                     ; $03BCCB |
  LDA $3002                       ; $03BCCE |
  STA $7220,x                     ; $03BCD1 |
  LDA $3004                       ; $03BCD4 |
  BRA CODE_03BD27                 ; $03BCD7 |

CODE_03BCD9:
  LDA $60E4                       ; $03BCD9 |
  STA $3002                       ; $03BCDC |
  LDA $60E6                       ; $03BCDF |
  STA $3004                       ; $03BCE2 |
  LDA $70E2,x                     ; $03BCE5 |
  STA $3006                       ; $03BCE8 |
  LDA $7182,x                     ; $03BCEB |
  STA $3008                       ; $03BCEE |
  LDA #$0400                      ; $03BCF1 |
  STA $300C                       ; $03BCF4 |
  LDX #$09                        ; $03BCF7 |
  LDA #$907C                      ; $03BCF9 |
  JSL $7EDE44                     ; $03BCFC | GSU init
  LDX $12                         ; $03BD00 |
  LDA $3002                       ; $03BD02 |
  EOR $60A8                       ; $03BD05 |
  ASL A                           ; $03BD08 |
  LDA $3002                       ; $03BD09 |
  BCS CODE_03BD11                 ; $03BD0C |
  ADC $60A8                       ; $03BD0E |

CODE_03BD11:
  STA $7220,x                     ; $03BD11 |
  LDA $3004                       ; $03BD14 |
  SEC                             ; $03BD17 |
  SBC #$0300                      ; $03BD18 |
  BPL CODE_03BD20                 ; $03BD1B |
  LDA #$0000                      ; $03BD1D |

CODE_03BD20:
  SEC                             ; $03BD20 |
  SBC #$0100                      ; $03BD21 |
  ADC $3004                       ; $03BD24 |

CODE_03BD27:
  STA $7222,x                     ; $03BD27 |
  STZ $60E0                       ; $03BD2A |
  RTL                             ; $03BD2D |

CODE_03BD2E:
  CPY #$06                        ; $03BD2E |
  BNE CODE_03BD40                 ; $03BD30 |
  LDA $7360,x                     ; $03BD32 |
  CMP #$0029                      ; $03BD35 |
  BCC CODE_03BD40                 ; $03BD38 |
  LDA #$FFFF                      ; $03BD3A |
  STA $7FE8                       ; $03BD3D |

CODE_03BD40:
  PHB                             ; $03BD40 |
  PHK                             ; $03BD41 |
  PLB                             ; $03BD42 |
  REP #$10                        ; $03BD43 |
  LDY $60BE                       ; $03BD45 | current yoshi animation frame index
  LDA $FCE9,y                     ; $03BD48 |
  AND #$FF00                      ; $03BD4B | only high byte of table entry
  BPL CODE_03BD53                 ; $03BD4E |
  ORA #$00FF                      ; $03BD50 |

CODE_03BD53:
  XBA                             ; $03BD53 |
  CLC                             ; $03BD54 |
  ADC $6090                       ; $03BD55 |
  STA $7182,x                     ; $03BD58 |
  LDA #$0002                      ; $03BD5B |
  STA $74A2,x                     ; $03BD5E |
  LDA $FAE5,y                     ; $03BD61 |
  AND #$BF00                      ; $03BD64 | only high byte of table entry
  BPL CODE_03BD6C                 ; $03BD67 |
  ORA #$40FF                      ; $03BD69 |

CODE_03BD6C:
  XBA                             ; $03BD6C |
  LDY $60C4                       ; $03BD6D |
  BNE CODE_03BD76                 ; $03BD70 |
  EOR #$FFFF                      ; $03BD72 |
  INC A                           ; $03BD75 |

CODE_03BD76:
  CLC                             ; $03BD76 |
  ADC $608C                       ; $03BD77 |
  STA $70E2,x                     ; $03BD7A |
  SEP #$10                        ; $03BD7D |
  PLB                             ; $03BD7F |
  RTL                             ; $03BD80 |
; end BB1D

; data table
DATA_03BD81:         dw $0010
DATA_03BD83:         dw $000D
DATA_03BD85:         dw $000B
DATA_03BD87:         dw $0009
DATA_03BD89:         dw $0008
DATA_03BD8B:         dw $0007
DATA_03BD8D:         dw $0007
DATA_03BD8F:         dw $0006
DATA_03BD91:         dw $0006
DATA_03BD93:         dw $0006
DATA_03BD95:         dw $0007
DATA_03BD97:         dw $0007
DATA_03BD99:         dw $0008
DATA_03BD9B:         dw $0009
DATA_03BD9D:         dw $000B
DATA_03BD9F:         dw $000D

CODE_03BDA1:
  PHB                             ; $03BDA1 |
  PHK                             ; $03BDA2 |
  PLB                             ; $03BDA3 |
  LDA $61B8                       ; $03BDA4 |
  BEQ CODE_03BDAB                 ; $03BDA7 |
  LDY #$00                        ; $03BDA9 |

CODE_03BDAB:
  LDA $B778,y                     ; $03BDAB |
  STA $00                         ; $03BDAE |
  LDY #$00                        ; $03BDB0 |
  CMP $76,x                       ; $03BDB2 |
  BEQ CODE_03BE1D                 ; $03BDB4 |
  BPL CODE_03BDBA                 ; $03BDB6 |
  INY                             ; $03BDB8 |
  INY                             ; $03BDB9 |

CODE_03BDBA:
  LDA $76,x                       ; $03BDBA |
  CLC                             ; $03BDBC |
  ADC $B786,y                     ; $03BDBD |
  CMP #$0004                      ; $03BDC0 |
  BPL CODE_03BDF9                 ; $03BDC3 |
  STA $76,x                       ; $03BDC5 |
  DEC A                           ; $03BDC7 |
  DEC A                           ; $03BDC8 |
  EOR #$FFFF                      ; $03BDC9 |
  INC A                           ; $03BDCC |
  CMP #$0040                      ; $03BDCD |
  BCS CODE_03BDD5                 ; $03BDD0 |
  JMP CODE_03BE48                 ; $03BDD2 |

CODE_03BDD5:
  TAY                             ; $03BDD5 |
  LDA $BD41,y                     ; $03BDD6 |
  CLC                             ; $03BDD9 |
  ADC $6090                       ; $03BDDA |
  STA $7182,x                     ; $03BDDD |
  LDA #$0060                      ; $03BDE0 |
  CLC                             ; $03BDE3 |
  ADC $76,x                       ; $03BDE4 |
  LSR A                           ; $03BDE6 |
  LDY $7400,x                     ; $03BDE7 |
  BNE CODE_03BDF0                 ; $03BDEA |
  EOR #$FFFF                      ; $03BDEC |
  INC A                           ; $03BDEF |

CODE_03BDF0:
  CLC                             ; $03BDF0 |
  ADC $608C                       ; $03BDF1 |
  STA $70E2,x                     ; $03BDF4 |
  PLB                             ; $03BDF7 |
  RTL                             ; $03BDF8 |

CODE_03BDF9:
  CPY #$00                        ; $03BDF9 |
  BNE CODE_03BE1B                 ; $03BDFB |
  STA $00                         ; $03BDFD |
  LDA $05C0                       ; $03BDFF |
  SBC $00                         ; $03BE02 |
  BPL CODE_03BE0A                 ; $03BE04 |
  CLC                             ; $03BE06 |
  ADC #$0128                      ; $03BE07 |

CODE_03BE0A:
  REP #$10                        ; $03BE0A |
  TAY                             ; $03BE0C |
  LDA $0813,y                     ; $03BE0D |
  AND #$00FF                      ; $03BE10 |
  BNE CODE_03BE1D                 ; $03BE13 |
  LDA $00                         ; $03BE15 |
  STA $76,x                       ; $03BE17 |
  BRA CODE_03BE2C                 ; $03BE19 |

CODE_03BE1B:
  STA $76,x                       ; $03BE1B |

CODE_03BE1D:
  LDA $05C0                       ; $03BE1D |
  SEC                             ; $03BE20 |
  SBC $76,x                       ; $03BE21 |
  BPL CODE_03BE29                 ; $03BE23 |
  CLC                             ; $03BE25 |
  ADC #$0128                      ; $03BE26 |

CODE_03BE29:
  REP #$10                        ; $03BE29 |
  TAY                             ; $03BE2B |

CODE_03BE2C:
  PLB                             ; $03BE2C |
  LDA $05C2,y                     ; $03BE2D |
  STA $70E2,x                     ; $03BE30 |
  LDA $06EA,y                     ; $03BE33 |
  STA $7182,x                     ; $03BE36 |
  LDA $7042,x                     ; $03BE39 |
  AND #$00CF                      ; $03BE3C |
  ORA $0812,y                     ; $03BE3F |
  STA $7042,x                     ; $03BE42 |
  SEP #$10                        ; $03BE45 |
  RTL                             ; $03BE47 |

CODE_03BE48:
  ASL A                           ; $03BE48 |
  ASL A                           ; $03BE49 |
  STA $02                         ; $03BE4A |
  LDA #$0100                      ; $03BE4C |
  SEC                             ; $03BE4F |
  SBC $02                         ; $03BE50 |
  STA $300C                       ; $03BE52 |
  CMP #$0100                      ; $03BE55 |
  BCC CODE_03BE5E                 ; $03BE58 |
  LDA $00                         ; $03BE5A |
  STA $76,x                       ; $03BE5C |

CODE_03BE5E:
  LDA $05C0                       ; $03BE5E |
  SEC                             ; $03BE61 |
  SBC $00                         ; $03BE62 |
  BPL CODE_03BE6A                 ; $03BE64 |
  CLC                             ; $03BE66 |
  ADC #$0128                      ; $03BE67 |

CODE_03BE6A:
  REP #$10                        ; $03BE6A |
  TAY                             ; $03BE6C |
  LDA $05C2,y                     ; $03BE6D |
  SEC                             ; $03BE70 |
  SBC $70E2,x                     ; $03BE71 |
  STA $3000                       ; $03BE74 |
  LDA $06EA,y                     ; $03BE77 |
  SEC                             ; $03BE7A |
  SBC $7182,x                     ; $03BE7B |
  STA $3002                       ; $03BE7E |
  SEP #$10                        ; $03BE81 |
  LDX #$0B                        ; $03BE83 |
  LDA #$86B6                      ; $03BE85 |
  JSL $7EDE44                     ; $03BE88 | GSU init
  LDX $12                         ; $03BE8C |
  LDA $70E2,x                     ; $03BE8E |
  CLC                             ; $03BE91 |
  ADC $3000                       ; $03BE92 |
  STA $70E2,x                     ; $03BE95 |
  LDA $3002                       ; $03BE98 |
  STA $3000                       ; $03BE9B |
  LDX #$0B                        ; $03BE9E |
  LDA #$86B6                      ; $03BEA0 |
  JSL $7EDE44                     ; $03BEA3 | GSU init
  LDX $12                         ; $03BEA7 |
  LDA $7182,x                     ; $03BEA9 |
  CLC                             ; $03BEAC |
  ADC $3000                       ; $03BEAD |
  STA $7182,x                     ; $03BEB0 |
  PLB                             ; $03BEB3 |
  RTL                             ; $03BEB4 |

; data table
DATA_03BEB5:         dw $0100, $FF00

; l sub
  JSL $0CF957                     ; $03BEB9 |
  LDA #$0003                      ; $03BEBD |\ play sound #$0003
  JSL $0085D2                     ; $03BEC0 |/
  LDA $7DF6                       ; $03BEC4 |
  INC A                           ; $03BEC7 |
  INC A                           ; $03BEC8 |
  CMP #$000E                      ; $03BEC9 |
  BCC CODE_03BF15                 ; $03BECC |
  PHB                             ; $03BECE |
  PHK                             ; $03BECF |
  PLB                             ; $03BED0 |
  LDX $7DF8                       ; $03BED1 |\
  LDA #$000E                      ; $03BED4 | |
  STA $6F00,x                     ; $03BED7 | |
  STZ $78,x                       ; $03BEDA | |
  STZ $18,x                       ; $03BEDC | |
  STZ $76,x                       ; $03BEDE | |
  STZ $7A36,x                     ; $03BEE0 | |
  STZ $7A38,x                     ; $03BEE3 | |
  STZ $7D38,x                     ; $03BEE6 | | kill old item's interaction
  LDY $77C2,x                     ; $03BEE9 | |
  LDA $BEB5,y                     ; $03BEEC | |
  STA $7220,x                     ; $03BEEF | |
  LDA #$FC00                      ; $03BEF2 | |
  STA $7222,x                     ; $03BEF5 | |
  LDA #$0040                      ; $03BEF8 | |
  STA $7542,x                     ; $03BEFB |/
  PLB                             ; $03BEFE |\
  LDY #$02                        ; $03BEFF | |

CODE_03BF01:
  LDA $7DF8,y                     ; $03BF01 | |
  STA $7DF6,y                     ; $03BF04 | |
  TAX                             ; $03BF07 | | rotates the new egg in
  TYA                             ; $03BF08 | |
  STA $78,x                       ; $03BF09 | |
  INY                             ; $03BF0B | |
  INY                             ; $03BF0C | |
  CPY $7DF6                       ; $03BF0D | |
  BCC CODE_03BF01                 ; $03BF10 |/
  LDX $12                         ; $03BF12 |
  TYA                             ; $03BF14 |

CODE_03BF15:
  STA $7DF6                       ; $03BF15 |
  REP #$10                        ; $03BF18 |
  TAY                             ; $03BF1A |
  CPY #$0004                      ; $03BF1B |
  BCC CODE_03BF40                 ; $03BF1E |

CODE_03BF20:
  LDX $7DF4,y                     ; $03BF20 |
  LDA $7360,x                     ; $03BF23 |
  CMP #$0027                      ; $03BF26 |
  BEQ CODE_03BF30                 ; $03BF29 |
  CMP #$0029                      ; $03BF2B |
  BNE CODE_03BF3E                 ; $03BF2E |

CODE_03BF30:
  TYA                             ; $03BF30 |
  STA $78,x                       ; $03BF31 |
  TXA                             ; $03BF33 |
  STA $7DF6,y                     ; $03BF34 |
  DEY                             ; $03BF37 |
  DEY                             ; $03BF38 |
  CPY #$0004                      ; $03BF39 |
  BCS CODE_03BF20                 ; $03BF3C |

CODE_03BF3E:
  LDX $12                         ; $03BF3E |

CODE_03BF40:
  TYA                             ; $03BF40 |
  SEP #$10                        ; $03BF41 |
  STA $78,x                       ; $03BF43 |
  LDA #$0002                      ; $03BF45 |
  STA $76,x                       ; $03BF48 |
  LDA $12                         ; $03BF4A |
  STA $7DF6,y                     ; $03BF4C |
  LDA $7040,x                     ; $03BF4F |
  AND #$FFF3                      ; $03BF52 |
  STA $7040,x                     ; $03BF55 |
  LDA $6FA0,x                     ; $03BF58 |
  AND #$F9FF                      ; $03BF5B |
  ORA #$0040                      ; $03BF5E |
  LDY $0146                       ; $03BF61 |
  CPY #$0D                        ; $03BF64 |
  BNE CODE_03BF6B                 ; $03BF66 |
  ORA #$0200                      ; $03BF68 |

CODE_03BF6B:
  STA $6FA0,x                     ; $03BF6B |
  LDA $6FA2,x                     ; $03BF6E |
  AND #$FFC0                      ; $03BF71 |
  STA $6FA2,x                     ; $03BF74 |
  LDA #$0005                      ; $03BF77 |
  STA $74A2,x                     ; $03BF7A |
  STZ $7AF6,x                     ; $03BF7D |
  STZ $7542,x                     ; $03BF80 |
  STZ $7D38,x                     ; $03BF83 |
  RTL                             ; $03BF86 |

; l sub
  LDY $79D8,x                     ; $03BF87 |
  BEQ CODE_03BFF6                 ; $03BF8A |
  BMI CODE_03BFF6                 ; $03BF8C |
  PHP                             ; $03BF8E | entry point
  SEP #$10                        ; $03BF8F |
  STZ $79D8,x                     ; $03BF91 |
  STZ $7978,x                     ; $03BF94 |
  STZ $79D6,x                     ; $03BF97 |
  STZ $7A36,x                     ; $03BF9A |
  STZ $7A38,x                     ; $03BF9D |
  LDA $7360,x                     ; $03BFA0 |
  CMP #$0028                      ; $03BFA3 |
  BEQ CODE_03BFB4                 ; $03BFA6 |
  LDA $6FA0,x                     ; $03BFA8 |
  AND #$FFBF                      ; $03BFAB |
  ORA #$0200                      ; $03BFAE |
  STA $6FA0,x                     ; $03BFB1 |

CODE_03BFB4:
  PHY                             ; $03BFB4 |
  LDY #$01                        ; $03BFB5 |
  LDA $7360,x                     ; $03BFB7 |
  CMP #$0029                      ; $03BFBA |
  BCC CODE_03BFC1                 ; $03BFBD |
  LDY #$1A                        ; $03BFBF |

CODE_03BFC1:
  TYA                             ; $03BFC1 |
  STA $00                         ; $03BFC2 |
  LDA $6FA2,x                     ; $03BFC4 |
  AND #$FFC0                      ; $03BFC7 |
  ORA $00                         ; $03BFCA |
  STA $6FA2,x                     ; $03BFCC |
  LDA $7040,x                     ; $03BFCF |
  ORA #$0004                      ; $03BFD2 |
  STA $7040,x                     ; $03BFD5 |
  PLY                             ; $03BFD8 |
  PHX                             ; $03BFD9 |

CODE_03BFDA:
  CPY $7DF6                       ; $03BFDA |
  BCS CODE_03BFEE                 ; $03BFDD |
  LDA $7DF8,y                     ; $03BFDF |
  STA $7DF6,y                     ; $03BFE2 |
  TAX                             ; $03BFE5 |
  TYA                             ; $03BFE6 |
  STA $79D8,x                     ; $03BFE7 |
  INY                             ; $03BFEA |
  INY                             ; $03BFEB |
  BRA CODE_03BFDA                 ; $03BFEC |

CODE_03BFEE:
  DEC $7DF6                       ; $03BFEE |
  DEC $7DF6                       ; $03BFF1 |
  PLX                             ; $03BFF4 |
  PLP                             ; $03BFF5 |

CODE_03BFF6:
  RTL                             ; $03BFF6 |

; l sub
  PHX                             ; $03BFF7 |

CODE_03BFF8:
  LDY $7DF6                       ; $03BFF8 |
  BEQ CODE_03C03E                 ; $03BFFB |
  LDX $7DF8                       ; $03BFFD |
  LDA $7360,x                     ; $03C000 |
  CMP #$0027                      ; $03C003 |
  BEQ CODE_03C03E                 ; $03C006 |
  CMP #$0029                      ; $03C008 |
  BEQ CODE_03C03E                 ; $03C00B |
  LDY $79D8,x                     ; $03C00D |
  JSL $03BF8E                     ; $03C010 |
  LDA $70E2,x                     ; $03C014 |
  SEC                             ; $03C017 |
  SBC $608C                       ; $03C018 |
  ASL A                           ; $03C01B |
  ASL A                           ; $03C01C |
  ASL A                           ; $03C01D |
  STA $7220,x                     ; $03C01E |
  LDA #$FC00                      ; $03C021 |
  STA $7222,x                     ; $03C024 |
  STZ $79D8,x                     ; $03C027 |
  STZ $7978,x                     ; $03C02A |
  STZ $79D6,x                     ; $03C02D |
  STZ $7A36,x                     ; $03C030 |
  STZ $7A38,x                     ; $03C033 |
  LDA #$0200                      ; $03C036 |
  STA $7AF6,x                     ; $03C039 |
  BRA CODE_03BFF8                 ; $03C03C |

CODE_03C03E:
  PLX                             ; $03C03E |
  RTL                             ; $03C03F |

; l sub
  JSL $03A31E                     ; $03C040 |
  JSL $03BF87                     ; $03C044 |
  LDA $70E2,x                     ; $03C048 |
  STA $7960                       ; $03C04B |
  LDA $7182,x                     ; $03C04E |
  STA $7962                       ; $03C051 |
  LDA $7042,x                     ; $03C054 |
  AND #$000E                      ; $03C057 |
  STA $7964                       ; $03C05A |
  LDA #$01BE                      ; $03C05D |
  JSL $008B21                     ; $03C060 |
  LDA $7960                       ; $03C064 |
  CLC                             ; $03C067 |
  ADC #$0008                      ; $03C068 |
  STA $70A2,y                     ; $03C06B |
  LDA $7962                       ; $03C06E |
  CLC                             ; $03C071 |
  ADC #$0008                      ; $03C072 |
  STA $7142,y                     ; $03C075 |
  LDA #$0005                      ; $03C078 |
  STA $7782,y                     ; $03C07B |
  RTL                             ; $03C07E |

init_special_winged_cloud:
  JSL $03D406                     ; $03C07F |
  RTL                             ; $03C083 |

; data table
DATA_03C084:         dw $00BE
DATA_03C086:         dw $00C1
DATA_03C088:         dw $00CC
DATA_03C08A:         dw $00C1

main_hidden_winged_cloud_B:
  LDA $7E06                       ; $03C08C |
  BNE CODE_03C0CC                 ; $03C08F |
  LDY $7D36,x                     ; $03C091 |
  BMI CODE_03C0CC                 ; $03C094 |
  DEY                             ; $03C096 |
  BMI CODE_03C0FC                 ; $03C097 |
  LDA $6F00,y                     ; $03C099 |
  CMP #$0010                      ; $03C09C |
  BNE CODE_03C0FC                 ; $03C09F |
  LDA $7D38,y                     ; $03C0A1 |
  BNE CODE_03C0B3                 ; $03C0A4 |
  LDA $7360,y                     ; $03C0A6 |
  CMP #$0018                      ; $03C0A9 |
  BEQ CODE_03C0B3                 ; $03C0AC |
  CMP #$0006                      ; $03C0AE |
  BNE CODE_03C0FC                 ; $03C0B1 |

CODE_03C0B3:
  LDA $7680,x                     ; $03C0B3 |
  CLC                             ; $03C0B6 |
  ADC #$0008                      ; $03C0B7 |
  CMP #$0101                      ; $03C0BA |
  BCS CODE_03C0FC                 ; $03C0BD |
  LDA $7682,x                     ; $03C0BF |
  CMP #$00CC                      ; $03C0C2 |
  BCS CODE_03C0FC                 ; $03C0C5 |
  TYX                             ; $03C0C7 |
  JSL $03B25B                     ; $03C0C8 |

CODE_03C0CC:
  LDA #$0027                      ; $03C0CC |\ play sound #$0027
  JSL $0085D2                     ; $03C0CF |/
  LDA $70E2,x                     ; $03C0D3 |
  AND #$0010                      ; $03C0D6 |
  LSR A                           ; $03C0D9 |
  STA $00                         ; $03C0DA |
  LDA $7182,x                     ; $03C0DC |
  AND #$0010                      ; $03C0DF |
  ORA $00                         ; $03C0E2 |
  LSR A                           ; $03C0E4 |
  LSR A                           ; $03C0E5 |
  TAY                             ; $03C0E6 |
  LDA $C084,y                     ; $03C0E7 |
  TXY                             ; $03C0EA |
  JSL $03A377                     ; $03C0EB |
  LDA #$0002                      ; $03C0EF |
  STA $6F00,x                     ; $03C0F2 |
  INC $77C0,x                     ; $03C0F5 |
  JSL $03B50B                     ; $03C0F8 |

CODE_03C0FC:
  RTL                             ; $03C0FC |

; data
DATA_03C0FD:         db $FF, $00, $FF, $00
DATA_03C101:         db $FF, $00, $FF, $00
DATA_03C105:         db $00, $00, $FF, $00
DATA_03C109:         db $00, $00, $08, $08
DATA_03C10D:         db $08, $08, $08, $08
DATA_03C111:         db $FF, $FF, $FF, $FF
DATA_03C115:         db $FF, $FF, $08, $08
DATA_03C119:         db $FF, $FF, $FF, $FF
DATA_03C11D:         db $FF, $FF, $08, $08
DATA_03C121:         db $FF, $FF, $FF, $FF
DATA_03C125:         db $FF, $FF, $08, $08
DATA_03C129:         db $08, $08, $08, $08
DATA_03C12D:         db $FF, $FF, $FF, $FF
DATA_03C131:         db $08, $08, $00, $00
DATA_03C135:         db $FF, $FF, $FF, $00
DATA_03C139:         db $04, $04, $04, $04
DATA_03C13D:         db $04, $04, $04, $04
DATA_03C141:         db $00, $00, $04, $04
DATA_03C145:         db $00, $00, $04, $04
DATA_03C149:         db $04, $04, $04, $04
DATA_03C14D:         db $04, $04, $08, $08
DATA_03C151:         db $08, $08, $04, $04
DATA_03C155:         db $04, $04, $04, $04
DATA_03C159:         db $08, $08, $04, $04
DATA_03C15D:         db $FF, $FF, $08, $08
DATA_03C161:         db $04, $04, $04, $04
DATA_03C165:         db $04, $04, $04, $04
DATA_03C169:         db $08, $08, $08, $08
DATA_03C16D:         db $04, $04, $00, $00
DATA_03C171:         db $04, $04, $04, $04

; data table
DATA_03C175:         dw $FF80, $0080

; 0B6 - 8 coins
; 0B7 - bubbled 1up
; 0B8 - flower
; 0BD - coin (object)
; 0BF - key
; 0C0 - 3 stars
; 0C1 - 5 stars
; 0CC - ! switch
init_winged_cloud_A:
  JSL $03D406                     ; $03C179 |
  JSL $03C236                     ; $03C17D |
  BRA CODE_03C1C0                 ; $03C181 |

init_transform_bubble:
  JSL $03C236                     ; $03C183 |
  LDA $7182,x                     ; $03C187 |
  AND #$0010                      ; $03C18A |
  BEQ CODE_03C1C4                 ; $03C18D |
  LDA $70E2,x                     ; $03C18F |
  AND #$0010                      ; $03C192 |
  BNE CODE_03C1B2                 ; $03C195 |
  INC $7A38,x                     ; $03C197 |
  LDA #$00FF                      ; $03C19A |
  STA $74A2,x                     ; $03C19D |
  BRA CODE_03C1C4                 ; $03C1A0 |

init_winged_cloud_1up:
  JSL $03D406                     ; $03C1A2 |
  JSL $03C236                     ; $03C1A6 |
  LDA $70E2,x                     ; $03C1AA |
  AND #$0010                      ; $03C1AD |
  BEQ CODE_03C1C4                 ; $03C1B0 |

CODE_03C1B2:
  LDY $7400,x                     ; $03C1B2 |
  LDA $C175,y                     ; $03C1B5 |
  STA $75E0,x                     ; $03C1B8 |
  STA $7220,x                     ; $03C1BB |
  BRA CODE_03C1C4                 ; $03C1BE |

; 0B9 - POW
; 0BA - stairs
; 0BB - platform
; 0BC - bandit
; 0C2 - door
; 0C3 - ground eater
; 0C4 - green watermelon
; 0C5 - red watermelon
; 0C6 - blue watermelon
; 0C7 - 3-leaf sunflower vine
; 0C8 - 6-leaf sunflower vine
; 0C9 - *crashes the game*
init_winged_cloud_B:

CODE_03C1C0:
  JSL $03C236                     ; $03C1C0 |

init_winged_cloud_item:

CODE_03C1C4:
  LDA $7360,x                     ; $03C1C4 |
  SEC                             ; $03C1C7 |
  SBC #$00AF                      ; $03C1C8 |
  ASL A                           ; $03C1CB |
  STA $00                         ; $03C1CC |
  LDA $70E2,x                     ; $03C1CE |
  STA $7900,x                     ; $03C1D1 |
  AND #$0010                      ; $03C1D4 |
  LSR A                           ; $03C1D7 |
  LSR A                           ; $03C1D8 |
  LSR A                           ; $03C1D9 |
  LSR A                           ; $03C1DA |
  ORA $00                         ; $03C1DB |
  TAY                             ; $03C1DD |
  LDA $C0FC,y                     ; $03C1DE |
  BMI CODE_03C207                 ; $03C1E1 |
  XBA                             ; $03C1E3 |
  AND #$00FF                      ; $03C1E4 | one byte from table
  BNE CODE_03C1FB                 ; $03C1E7 |
  JSR CODE_03C271                 ; $03C1E9 |
  LDA $7182,x                     ; $03C1EC |
  STA $7902,x                     ; $03C1EF |
  LDA #$0003                      ; $03C1F2 |
  STA $18,x                       ; $03C1F5 |
  JML $03C476                     ; $03C1F7 |

CODE_03C1FB:
  CLC                             ; $03C1FB |
  ADC $70E2,x                     ; $03C1FC |
  STA $78,x                       ; $03C1FF |
  LDA #$0002                      ; $03C201 |
  STA $7540,x                     ; $03C204 |

CODE_03C207:
  LDA $7182,x                     ; $03C207 |
  STA $7902,x                     ; $03C20A |
  AND #$0010                      ; $03C20D |
  LSR A                           ; $03C210 |
  LSR A                           ; $03C211 |
  LSR A                           ; $03C212 |
  LSR A                           ; $03C213 |
  ORA $00                         ; $03C214 |
  TAY                             ; $03C216 |
  LDA $C138,y                     ; $03C217 |
  BMI CODE_03C22C                 ; $03C21A |
  XBA                             ; $03C21C |
  AND #$00FF                      ; $03C21D |
  CLC                             ; $03C220 |
  ADC $7182,x                     ; $03C221 |
  STA $76,x                       ; $03C224 |
  LDA #$0002                      ; $03C226 |
  STA $7542,x                     ; $03C229 |

CODE_03C22C:
  STZ $7400,x                     ; $03C22C |
  LDA #$0002                      ; $03C22F |
  STA $7402,x                     ; $03C232 |
  RTL                             ; $03C235 |

; l sub
  LDA $70E2,x                     ; $03C236 |
  AND #$FFF0                      ; $03C239 |
  ORA #$0008                      ; $03C23C |
  STA $3010                       ; $03C23F |
  LDA $7182,x                     ; $03C242 |
  AND #$FFF0                      ; $03C245 |
  ORA #$0008                      ; $03C248 |
  STA $3000                       ; $03C24B |
  LDX #$0A                        ; $03C24E |
  LDA #$CE2F                      ; $03C250 |
  JSL $7EDE91                     ; $03C253 | GSU init
  LDX $12                         ; $03C257 |
  LDA $300E                       ; $03C259 |
  AND #$0002                      ; $03C25C |
  BEQ CODE_03C26A                 ; $03C25F |
  LDY #$02                        ; $03C261 |
  JSL $02D985                     ; $03C263 |
  PLY                             ; $03C267 |\ sets the stack right for the
  BRA CODE_03C2A5                 ; $03C268 |/ intended double-return, continue below

CODE_03C26A:
  LDA #$0002                      ; $03C26A |
  STA $74A2,x                     ; $03C26D |
  RTL                             ; $03C270 |

; sub
CODE_03C271:
  LDY $0BF1                       ; $03C271 |
  BEQ CODE_03C285                 ; $03C274 |
  SEP #$20                        ; $03C276 |
  LDA $74A0,x                     ; $03C278 |

CODE_03C27B:
  CMP $0BF1,y                     ; $03C27B |
  BEQ CODE_03C29E                 ; $03C27E |
  DEY                             ; $03C280 |
  BNE CODE_03C27B                 ; $03C281 |
  REP #$20                        ; $03C283 |

CODE_03C285:
  LDY $18,x                       ; $03C285 |
  BEQ CODE_03C29D                 ; $03C287 |
  LDA $7A96,x                     ; $03C289 |
  BNE CODE_03C29A                 ; $03C28C |
  JSL $02808C                     ; $03C28E |
  LDA #$0040                      ; $03C292 |
  STA $7A96,x                     ; $03C295 |
  BRA CODE_03C2A5                 ; $03C298 |

CODE_03C29A:
  DEC A                           ; $03C29A |
  BNE CODE_03C2A5                 ; $03C29B |

CODE_03C29D:
  RTS                             ; $03C29D |

CODE_03C29E:
  REP #$20                        ; $03C29E |
  LDA #$0001                      ; $03C2A0 |
  STA $18,x                       ; $03C2A3 |

CODE_03C2A5:
  LDA #$0002                      ; $03C2A5 | continues here
  STA $6F00,x                     ; $03C2A8 |
  LDA #$00FF                      ; $03C2AB |
  STA $74A2,x                     ; $03C2AE |
  PLA                             ; $03C2B1 |\
  RTL                             ; $03C2B2 |/ hack: all the way out of init

; data table
DATA_03C2B3:         dw $FF00, $0100

; data table
DATA_03C2B7:         dw $FFFF, $0001
DATA_03C2BB:         dw $0002, $0005

main_winged_cloud:
  LDA $18,x                       ; $03C2BF |
  BEQ CODE_03C2C6                 ; $03C2C1 |
  JMP CODE_03C3DF                 ; $03C2C3 |

CODE_03C2C6:
  STZ $7400,x                     ; $03C2C6 |
  LDA $7A38,x                     ; $03C2C9 |
  BEQ CODE_03C2DE                 ; $03C2CC |
  LDY #$02                        ; $03C2CE |
  JSL $02D985                     ; $03C2D0 |
  LDY #$FF                        ; $03C2D4 |
  BCC CODE_03C2DA                 ; $03C2D6 |
  LDY #$02                        ; $03C2D8 |

CODE_03C2DA:
  TYA                             ; $03C2DA |
  STA $74A2,x                     ; $03C2DB |

CODE_03C2DE:
  LDY $77C0,x                     ; $03C2DE |
  BEQ CODE_03C2F3                 ; $03C2E1 |
  LDY #$02                        ; $03C2E3 |
  LDA $0030                       ; $03C2E5 |
  AND #$0001                      ; $03C2E8 |
  BEQ CODE_03C2EF                 ; $03C2EB |
  LDY #$FF                        ; $03C2ED |

CODE_03C2EF:
  TYA                             ; $03C2EF |
  STA $74A2,x                     ; $03C2F0 |

CODE_03C2F3:
  JSL $03AF23                     ; $03C2F3 |
  LDA $76,x                       ; $03C2F7 |
  BEQ CODE_03C30A                 ; $03C2F9 |
  LDY #$00                        ; $03C2FB |
  CMP $7182,x                     ; $03C2FD |
  BMI CODE_03C304                 ; $03C300 |
  LDY #$02                        ; $03C302 |

CODE_03C304:
  LDA $C2B3,y                     ; $03C304 |
  STA $75E2,x                     ; $03C307 |

CODE_03C30A:
  LDA $78,x                       ; $03C30A |
  BEQ CODE_03C31F                 ; $03C30C |
  LDY #$00                        ; $03C30E |
  LDA $78,x                       ; $03C310 |
  CMP $70E2,x                     ; $03C312 |
  BMI CODE_03C319                 ; $03C315 |
  LDY #$02                        ; $03C317 |

CODE_03C319:
  LDA $C2B3,y                     ; $03C319 |
  STA $75E0,x                     ; $03C31C |

CODE_03C31F:
  JSR CODE_03C4F1                 ; $03C31F |
  LDA $7A38,x                     ; $03C322 |
  BNE CODE_03C32D                 ; $03C325 |
  LDY $7D36,x                     ; $03C327 |
  DEY                             ; $03C32A |
  BPL CODE_03C32E                 ; $03C32B |

CODE_03C32D:
  RTL                             ; $03C32D |

CODE_03C32E:
  LDA $6F00,y                     ; $03C32E |
  CMP #$0010                      ; $03C331 |
  BNE CODE_03C32D                 ; $03C334 |
  LDA $7D38,y                     ; $03C336 |
  BNE CODE_03C348                 ; $03C339 |
  LDA $7360,y                     ; $03C33B |
  CMP #$0018                      ; $03C33E |
  BEQ CODE_03C348                 ; $03C341 |
  CMP #$0006                      ; $03C343 |
  BNE CODE_03C32D                 ; $03C346 |

CODE_03C348:
  LDA $7680,x                     ; $03C348 |
  CLC                             ; $03C34B |
  ADC #$0018                      ; $03C34C |
  CMP #$0121                      ; $03C34F |
  BCS CODE_03C32D                 ; $03C352 |
  LDA $7682,x                     ; $03C354 |
  CLC                             ; $03C357 |
  ADC #$0010                      ; $03C358 |
  CMP #$00F1                      ; $03C35B |
  BCC CODE_03C363                 ; $03C35E |
  JMP CODE_03C3DE                 ; $03C360 |

CODE_03C363:
  TYX                             ; $03C363 |
  LDA #$0032                      ; $03C364 |
  JSL $03B212                     ; $03C367 |
  JSL $03B25B                     ; $03C36B |
  LDA #$0002                      ; $03C36F |
  STA $74A2,x                     ; $03C372 |
  JSL $03CC6B                     ; $03C375 |
  STZ $7E36                       ; $03C379 |
  STZ $7E38                       ; $03C37C |
  LDA $7360,x                     ; $03C37F |
  SEC                             ; $03C382 |
  SBC #$00BA                      ; $03C383 |
  LSR A                           ; $03C386 |
  BEQ CODE_03C398                 ; $03C387 |
  STZ $7222,x                     ; $03C389 |
  STZ $7542,x                     ; $03C38C |
  STZ $75E2,x                     ; $03C38F |
  JSL $03C48B                     ; $03C392 |
  BRA CODE_03C3CF                 ; $03C396 |

CODE_03C398:
  LDA $7040,x                     ; $03C398 |
  SEC                             ; $03C39B |
  SBC #$2001                      ; $03C39C |
  STA $7040,x                     ; $03C39F |
  LDA $6FA2,x                     ; $03C3A2 |
  ORA #$0001                      ; $03C3A5 |
  STA $6FA2,x                     ; $03C3A8 |
  LDA $7900,x                     ; $03C3AB |
  AND #$0010                      ; $03C3AE |
  EOR #$0010                      ; $03C3B1 |
  BNE CODE_03C3B9                 ; $03C3B4 |
  LDA #$FFF0                      ; $03C3B6 |

CODE_03C3B9:
  STA $76,x                       ; $03C3B9 |
  LDA #$FC00                      ; $03C3BB | entry point
  STA $7222,x                     ; $03C3BE |
  LDA #$0040                      ; $03C3C1 |
  STA $7542,x                     ; $03C3C4 |
  LDA #$0400                      ; $03C3C7 |
  STA $75E2,x                     ; $03C3CA |
  INC $18,x                       ; $03C3CD |

CODE_03C3CF:
  LDA #$0002                      ; $03C3CF |
  STA $74A2,x                     ; $03C3D2 |
  STZ $7220,x                     ; $03C3D5 |
  STZ $75E0,x                     ; $03C3D8 |
  STZ $7540,x                     ; $03C3DB |

CODE_03C3DE:
  RTL                             ; $03C3DE |

CODE_03C3DF:
  DEC A                           ; $03C3DF |
  BNE CODE_03C42D                 ; $03C3E0 |
  JSL $03AF23                     ; $03C3E2 |
  JSL $03CC6B                     ; $03C3E6 |
  JSR CODE_03C4F1                 ; $03C3EA |
  LDA $7860,x                     ; $03C3ED |
  AND #$0001                      ; $03C3F0 |
  ORA $7862,x                     ; $03C3F3 |
  AND #$00FF                      ; $03C3F6 |
  BNE CODE_03C41E                 ; $03C3F9 |
  LDA $7CD6,x                     ; $03C3FB |
  STA $3010                       ; $03C3FE |
  LDA $7182,x                     ; $03C401 |
  CLC                             ; $03C404 |
  ADC #$0010                      ; $03C405 |
  STA $3000                       ; $03C408 |
  LDX #$0A                        ; $03C40B |
  LDA #$CE2F                      ; $03C40D |
  JSL $7EDE91                     ; $03C410 | GSU init
  LDX $12                         ; $03C414 |
  LDA $300C                       ; $03C416 |
  CMP $1DAE                       ; $03C419 |
  BNE CODE_03C42C                 ; $03C41C |

CODE_03C41E:
  LDA $7040,x                     ; $03C41E |
  CLC                             ; $03C421 |
  ADC #$2001                      ; $03C422 |
  STA $7040,x                     ; $03C425 |
  JSL $03C48B                     ; $03C428 |

CODE_03C42C:
  RTL                             ; $03C42C |

CODE_03C42D:
  DEC A                           ; $03C42D |
  BNE CODE_03C481                 ; $03C42E |
  JSL $03AA52                     ; $03C430 |
  JSL $03AF23                     ; $03C434 |
  JSL $03CC6B                     ; $03C438 |
  JSL $03C4AE                     ; $03C43C |
  STZ $7220,x                     ; $03C440 |
  STZ $7222,x                     ; $03C443 |
  LDA $7A38,x                     ; $03C446 |
  CLC                             ; $03C449 |
  ADC #$0018                      ; $03C44A |
  STA $7A38,x                     ; $03C44D |
  CMP #$0370                      ; $03C450 |
  BCC CODE_03C480                 ; $03C453 |
  JSL $03AEFD                     ; $03C455 |

CODE_03C459:
  LDA #$003B                      ; $03C459 |\ play sound #$003B
  JSL $0085D2                     ; $03C45C |/
  INC $18,x                       ; $03C460 |
  LDA #$0003                      ; $03C462 |
  STA $7402,x                     ; $03C465 |
  LDA $7040,x                     ; $03C468 |
  CLC                             ; $03C46B |
  ADC #$0800                      ; $03C46C |
  STA $7040,x                     ; $03C46F |
  JSL $04849E                     ; $03C472 |
  REP #$10                        ; $03C476 |
  LDA $7360,x                     ; $03C478 |
  ASL A                           ; $03C47B |
  TAX                             ; $03C47C |
  JMP ($C3BC,x)                   ; $03C47D | table address for popping the cloud

CODE_03C480:
  RTL                             ; $03C480 |

CODE_03C481:
  REP #$10                        ; $03C481 |
  LDA $7360,x                     ; $03C483 |
  ASL A                           ; $03C486 |
  TAX                             ; $03C487 |
  JMP ($C78F,x)                   ; $03C488 | table address: special cloud event that needs updating

; l sub
  LDA #$0002                      ; $03C48B |
  STA $18,x                       ; $03C48E |
  JSL $03AD74                     ; $03C490 |
  BCS CODE_03C49B                 ; $03C494 |
  PLA                             ; $03C496 |
  PLY                             ; $03C497 |
  JMP CODE_03C459                 ; $03C498 |

CODE_03C49B:
  STZ $7402,x                     ; $03C49B |
  LDA $7040,x                     ; $03C49E |
  SEC                             ; $03C4A1 |
  SBC #$0800                      ; $03C4A2 |
  STA $7040,x                     ; $03C4A5 |
  LDA #$0100                      ; $03C4A8 |
  STA $7A38,x                     ; $03C4AB |
  LDA $7A38,x                     ; $03C4AE |
  CMP #$01F0                      ; $03C4B1 |
  BCC CODE_03C4B9                 ; $03C4B4 |
  LDA #$01F0                      ; $03C4B6 |

CODE_03C4B9:
  STA $300C                       ; $03C4B9 |
  LDA #$0008                      ; $03C4BC |
  STA $3010                       ; $03C4BF |
  STA $3012                       ; $03C4C2 |
  LDA #$70E0                      ; $03C4C5 |
  STA $3018                       ; $03C4C8 |
  LDA #$0055                      ; $03C4CB |
  STA $301A                       ; $03C4CE |
  LDY $7722,x                     ; $03C4D1 |
  TYX                             ; $03C4D4 |
  LDA $03A9EE,x                   ; $03C4D5 |
  STA $3004                       ; $03C4D9 |
  LDA $A9CE,x                     ; $03C4DC |
  STA $3006                       ; $03C4DF |
  LDX #$08                        ; $03C4E2 |
  LDA #$82F8                      ; $03C4E4 |
  JSL $7EDE44                     ; $03C4E7 | GSU init
  INC $0CF9                       ; $03C4EB |
  LDX $12                         ; $03C4EE |
  RTL                             ; $03C4F0 |

; s sub
CODE_03C4F1:
  LDA $7A96,x                     ; $03C4F1 |
  BNE CODE_03C519                 ; $03C4F4 |
  LDY $7A36,x                     ; $03C4F6 |
  LDA $7402,x                     ; $03C4F9 |
  CMP $C2BB,y                     ; $03C4FC |
  BNE CODE_03C50C                 ; $03C4FF |
  TYA                             ; $03C501 |
  EOR #$0002                      ; $03C502 |
  STA $7A36,x                     ; $03C505 |
  TAY                             ; $03C508 |
  LDA $7402,x                     ; $03C509 |

CODE_03C50C:
  CLC                             ; $03C50C |
  ADC $C2B7,y                     ; $03C50D |
  STA $7402,x                     ; $03C510 |
  LDA #$0004                      ; $03C513 |
  STA $7A96,x                     ; $03C516 |

CODE_03C519:
  RTS                             ; $03C519 |

; routines that are called upon popping the cloud / bubble
; code starts from $C3BC but relies on sprite ID * 2 as index
; ends up starting here, goes from ID $0AF - $0CC
winged_clouds_bubbles_pops:
DATA_03C51A:         dw $C562               ; morph bubble: car
DATA_03C51C:         dw $C562               ; morph bubble: mole
DATA_03C51E:         dw $C562               ; morph bubble: helicopter
DATA_03C520:         dw $C562               ; morph bubble: train
DATA_03C522:         dw $0000               ; (N/A) wind of fuzzy
DATA_03C524:         dw $C562               ; morph bubble: sub
DATA_03C526:         dw $0000               ; (N/A) hidden cloud
DATA_03C528:         dw $C60B               ; cloud: 8 coins
DATA_03C52A:         dw $C654               ; cloud: 1up bubbled
DATA_03C52C:         dw $C681               ; cloud: flower
DATA_03C52E:         dw $C6A3               ; cloud: POW
DATA_03C530:         dw $C6B6               ; cloud: stairs
DATA_03C532:         dw $C6B6               ; cloud: platform
DATA_03C534:         dw $C6E3               ; cloud: bandit
DATA_03C536:         dw $C70B               ; cloud: coin
DATA_03C538:         dw $C725               ; cloud: 1up
DATA_03C53A:         dw $C735               ; cloud: key
DATA_03C53C:         dw $C76C               ; cloud: 3 stars
DATA_03C53E:         dw $C7F5               ; cloud: 5 stars
DATA_03C540:         dw $C7FB               ; cloud: door
DATA_03C542:         dw $C5E5               ; cloud: ground eater
DATA_03C544:         dw $C81E               ; cloud: green watermelon
DATA_03C546:         dw $C81E               ; cloud: red watermelon
DATA_03C548:         dw $C81E               ; cloud: blue watermelon
DATA_03C54A:         dw $C83E               ; cloud: 3-leaf flower vine
DATA_03C54C:         dw $C83E               ; cloud: 6-leaf flower vine
DATA_03C54E:         dw $0000               ; (N/A) cloud: unused
DATA_03C550:         dw $0000               ; (N/A) Bowser Boss Door
DATA_03C552:         dw $C8A4               ; cloud: random item
DATA_03C554:         dw $C8C9               ; cloud: !-switch

; data table
DATA_03C556:         dw $6061               ; morph bubble: car
DATA_03C558:         dw $6071               ; morph bubble: mole
DATA_03C55A:         dw $7061               ; morph bubble: helicopter
DATA_03C55C:         dw $7071               ; morph bubble: train
DATA_03C55E:         dw $0000               ; (N/A) wind of fuzzy
DATA_03C560:         dw $70F0               ; morph bubble: sub

pop_transform_bubble:
  SEP #$10                        ; $03C562 |
  LDX $12                         ; $03C564 |
  JSL $03AD24                     ; $03C566 |
  BCS CODE_03C570                 ; $03C56A |
  JML $03A31E                     ; $03C56C |

CODE_03C570:
  LDA $7402,x                     ; $03C570 |
  STA $78,x                       ; $03C573 |
  BEQ CODE_03C57D                 ; $03C575 |
  LDA #$0100                      ; $03C577 |
  STA $7222,x                     ; $03C57A |

CODE_03C57D:
  LDA #$0007                      ; $03C57D |
  STA $7402,x                     ; $03C580 |
  STZ $7A36,x                     ; $03C583 |
  LDA $6FA2,x                     ; $03C586 |
  ORA #$0001                      ; $03C589 |
  STA $6FA2,x                     ; $03C58C |
  LDA #$0002                      ; $03C58F |
  STA $7542,x                     ; $03C592 |
  LDA #$FFC0                      ; $03C595 |
  STA $75E2,x                     ; $03C598 |
  LDA #$0020                      ; $03C59B |
  STA $7A96,x                     ; $03C59E |
  LDA #$0100                      ; $03C5A1 |
  STA $300C                       ; $03C5A4 |
  LDA #$0008                      ; $03C5A7 |
  STA $3010                       ; $03C5AA |
  STA $3012                       ; $03C5AD |
  LDA $7360,x                     ; $03C5B0 |
  SEC                             ; $03C5B3 |
  SBC #$00AF                      ; $03C5B4 |
  ASL A                           ; $03C5B7 |
  TAY                             ; $03C5B8 |
  LDA $C556,y                     ; $03C5B9 | table (which transform)
  STA $3018                       ; $03C5BC |
  LDA #$0055                      ; $03C5BF |
  STA $301A                       ; $03C5C2 |
  LDY $7722,x                     ; $03C5C5 |
  TYX                             ; $03C5C8 |
  LDA $03A9EE,x                   ; $03C5C9 |
  STA $3004                       ; $03C5CD |
  LDA $A9CE,x                     ; $03C5D0 |
  STA $3006                       ; $03C5D3 |
  LDX #$08                        ; $03C5D6 |
  LDA #$8619                      ; $03C5D8 |
  JSL $7EDE44                     ; $03C5DB | GSU init
  INC $0CF9                       ; $03C5DF |
  LDX $12                         ; $03C5E2 |
  RTL                             ; $03C5E4 |

pop_ground_eater:
  LDX $12                         ; $03C5E5 |
  LDA $7680,x                     ; $03C5E7 |
  SEC                             ; $03C5EA |
  SBC #$0080                      ; $03C5EB |
  ASL A                           ; $03C5EE |
  LDA #$0000                      ; $03C5EF |
  BCS CODE_03C5F7                 ; $03C5F2 |
  LDA #$0040                      ; $03C5F4 |

CODE_03C5F7:
  PHA                             ; $03C5F7 |
  CLC                             ; $03C5F8 |
  ADC $70E2,x                     ; $03C5F9 |
  STA $70E2,x                     ; $03C5FC |
  PLA                             ; $03C5FF |
  SEC                             ; $03C600 |
  SBC #$0020                      ; $03C601 |
  STA $78,x                       ; $03C604 |
  LDA #$0090                      ; $03C606 |
  BRA CODE_03C616                 ; $03C609 |

pop_8_coins:
  SEP #$10                        ; $03C60B |
  LDX $12                         ; $03C60D |
  JSL $03C640                     ; $03C60F |
  LDA #$0040                      ; $03C613 |

CODE_03C616:
  SEP #$10                        ; $03C616 | entry point
  STA $7A96,x                     ; $03C618 |
  LDA $7182,x                     ; $03C61B |
  AND #$FFF0                      ; $03C61E |
  STA $7182,x                     ; $03C621 |

CODE_03C624:
  LDA $6FA2,x                     ; $03C624 | entry point
  AND #$FFE0                      ; $03C627 |
  STA $6FA2,x                     ; $03C62A |
  STZ $7040,x                     ; $03C62D |
  LDA #$00FF                      ; $03C630 |
  STA $74A2,x                     ; $03C633 |
  STZ $7542,x                     ; $03C636 |
  STZ $7220,x                     ; $03C639 |
  STZ $7222,x                     ; $03C63C |
  RTL                             ; $03C63F |

; l sub
  LDA $7900,x                     ; $03C640 |
  STA $04                         ; $03C643 |
  LDA $7902,x                     ; $03C645 |
  JML $03D3F3                     ; $03C648 |

DATA_03C64C:         dw $FF80, $0080
DATA_03C650:         dw $0110, $FFE0

pop_1up_bubbled:
  SEP #$10                        ; $03C654 |
  LDX $12                         ; $03C656 |
  JSL $03A331                     ; $03C658 |
  LDA #$0100                      ; $03C65C |
  TXY                             ; $03C65F |
  JSL $03A377                     ; $03C660 |
  LDA $7900,x                     ; $03C664 |
  STA $79D8,x                     ; $03C667 |
  LDA $7902,x                     ; $03C66A |
  STA $7A36,x                     ; $03C66D |
  LDA #$0002                      ; $03C670 |
  LDY $03A3                       ; $03C673 |
  CPY #$03                        ; $03C676 |
  BEQ CODE_03C67D                 ; $03C678 |
  LDA #$0000                      ; $03C67A |

CODE_03C67D:
  STA $7978,x                     ; $03C67D |
  RTL                             ; $03C680 |

pop_flower:
  SEP #$10                        ; $03C681 |
  LDX $12                         ; $03C683 |
  JSL $03A331                     ; $03C685 |
  LDY #$71                        ; $03C689 |
  JSL $03C878                     ; $03C68B |
  LDA #$0110                      ; $03C68F |
  BCC CODE_03C697                 ; $03C692 |
  LDA #$00FA                      ; $03C694 |

CODE_03C697:
  TXY                             ; $03C697 |
  JSL $03A377                     ; $03C698 |
  LDA #$0002                      ; $03C69C |
  STA $6F00,x                     ; $03C69F |
  RTL                             ; $03C6A2 |

pop_pow:
  SEP #$10                        ; $03C6A3 |
  LDX $12                         ; $03C6A5 |
  LDA #$0047                      ; $03C6A7 |\ play sound #$0047
  JSL $0085D2                     ; $03C6AA |/
  JSL $0294B4                     ; $03C6AE |
  JML $03A32E                     ; $03C6B2 |

; also does platform
pop_stairs:
  SEP #$10                        ; $03C6B6 |
  LDX $12                         ; $03C6B8 |
  JSL $03C624                     ; $03C6BA |
  LDA $7CD6,x                     ; $03C6BE |
  STA $70E2,x                     ; $03C6C1 |
  LDA $7860,x                     ; $03C6C4 |
  LSR A                           ; $03C6C7 |
  LDA $7182,x                     ; $03C6C8 |
  BCS CODE_03C6D0                 ; $03C6CB |
  SBC #$0004                      ; $03C6CD |

CODE_03C6D0:
  AND #$FFF0                      ; $03C6D0 |
  SEC                             ; $03C6D3 |
  SBC #$0010                      ; $03C6D4 |
  STA $7182,x                     ; $03C6D7 |
  LDA #$0060                      ; $03C6DA |
  STA $7A96,x                     ; $03C6DD |
  STZ $78,x                       ; $03C6E0 |
  RTL                             ; $03C6E2 |

pop_bandit:
  SEP #$10                        ; $03C6E3 |
  LDX $12                         ; $03C6E5 |
  JSL $03A331                     ; $03C6E7 |
  LDA #$0020                      ; $03C6EB |
  TXY                             ; $03C6EE |
  JSL $03A377                     ; $03C6EF |
  LDA #$0002                      ; $03C6F3 |
  STA $6F00,x                     ; $03C6F6 |
  LDA #$000C                      ; $03C6F9 |
  STA $76,x                       ; $03C6FC |
  LDA #$FD00                      ; $03C6FE |
  STA $7222,x                     ; $03C701 |
  LDA #$0017                      ; $03C704 |
  STA $7402,x                     ; $03C707 |
  RTL                             ; $03C70A |

pop_one_coin:
  SEP #$10                        ; $03C70B |
  LDX $12                         ; $03C70D |
  JSL $03C640                     ; $03C70F |
  LDA #$0040                      ; $03C713 |
  STA $7A96,x                     ; $03C716 |
  LDA $7182,x                     ; $03C719 |
  AND #$FFF0                      ; $03C71C |
  STA $7182,x                     ; $03C71F |
  JMP CODE_03C624                 ; $03C722 |

pop_1up:
  SEP #$10                        ; $03C725 |
  LDX $12                         ; $03C727 |
  JSL $03C640                     ; $03C729 |
  JSL $03A496                     ; $03C72D |
  JML $03A32E                     ; $03C731 |

pop_key:
  SEP #$10                        ; $03C735 |
  LDX $12                         ; $03C737 |
  JSL $03A331                     ; $03C739 |
  LDA #$0027                      ; $03C73D |
  TXY                             ; $03C740 |
  JSL $03A377                     ; $03C741 |
  LDA #$FD00                      ; $03C745 |
  STA $7222,x                     ; $03C748 |
  RTL                             ; $03C74B |

; data table
DATA_03C74C:         dw $0040, $FF00
DATA_03C750:         dw $0080, $FF80
DATA_03C754:         dw $00C0, $FF40
DATA_03C758:         dw $0020, $FFE0

; data table
DATA_03C75C:         dw $FE00, $FC00
DATA_03C760:         dw $FC80, $FE80
DATA_03C764:         dw $FD00, $FD80
DATA_03C768:         dw $FF00, $FF80

pop_3_stars:
  LDA #$0003                      ; $03C76C |
pop_stars:
  STA $08                         ; $03C76F |
  LDA #$0030                      ; $03C771 |\ play sound #$0030
  JSL $0085D2                     ; $03C774 |/
  SEP #$10                        ; $03C778 |
  LDX $12                         ; $03C77A |
  JSL $03C640                     ; $03C77C |
  LDA $70E2,x                     ; $03C780 |
  STA $0000                       ; $03C783 |
  LDA $7182,x                     ; $03C786 |
  STA $0002                       ; $03C789 |
  JSL $03A32E                     ; $03C78C |
  LDA $03B6                       ; $03C790 |

CODE_03C793:
  STA $04                         ; $03C793 | entry point
  CMP #$012C                      ; $03C795 |
  LDA #$01A2                      ; $03C798 |
  BCC CODE_03C7A0                 ; $03C79B |
  LDA #$0115                      ; $03C79D |

CODE_03C7A0:
  JSL $03A364                     ; $03C7A0 |
  BCC CODE_03C7F2                 ; $03C7A4 |
  LDA $0000                       ; $03C7A6 |
  STA $70E2,y                     ; $03C7A9 |
  LDA $0002                       ; $03C7AC |
  STA $7182,y                     ; $03C7AF |
  LDA $04                         ; $03C7B2 |
  CMP #$012C                      ; $03C7B4 |
  BCC CODE_03C7BE                 ; $03C7B7 |
  JSR CODE_03B40A                 ; $03C7B9 |
  BRA CODE_03C7C4                 ; $03C7BC |

CODE_03C7BE:
  LDA #$0180                      ; $03C7BE |
  STA $7A96,y                     ; $03C7C1 |

CODE_03C7C4:
  JSL $008408                     ; $03C7C4 |
  LDA $7970                       ; $03C7C8 |
  AND #$000E                      ; $03C7CB |
  TAX                             ; $03C7CE |
  LDA $03C74C,x                   ; $03C7CF |
  STA $7220,y                     ; $03C7D3 |
  LDA $7970                       ; $03C7D6 |
  LSR A                           ; $03C7D9 |
  LSR A                           ; $03C7DA |
  LSR A                           ; $03C7DB |
  LSR A                           ; $03C7DC |
  AND #$000E                      ; $03C7DD |
  TAX                             ; $03C7E0 |
  LDA $03C75C,x                   ; $03C7E1 |
  STA $7222,y                     ; $03C7E5 |
  LDA $04                         ; $03C7E8 |
  CLC                             ; $03C7EA |
  ADC #$000A                      ; $03C7EB |
  DEC $08                         ; $03C7EE |
  BNE CODE_03C793                 ; $03C7F0 |

CODE_03C7F2:
  LDX $12                         ; $03C7F2 |
  RTL                             ; $03C7F4 |

pop_5_stars:
  LDA #$0005                      ; $03C7F5 |
  JMP pop_stars                   ; $03C7F8 |

pop_door:
  SEP #$10                        ; $03C7FB |
  LDX $12                         ; $03C7FD |
  JSL $03A331                     ; $03C7FF |
  LDA #$0093                      ; $03C803 |
  TXY                             ; $03C806 |
  JSL $03A377                     ; $03C807 |
  LDA #$0002                      ; $03C80B |
  STA $6F00,x                     ; $03C80E |
  LDA #$0040                      ; $03C811 |
  STA $7542,x                     ; $03C814 |
  RTL                             ; $03C817 |

DATA_03C818:         dw $0007
DATA_03C81A:         dw $0009
DATA_03C81C:         dw $0005

pop_watermelon:
  SEP #$10                        ; $03C81E |
  LDX $12                         ; $03C820 |
  JSL $03A331                     ; $03C822 |
  LDA $7360,x                     ; $03C826 |
  SEC                             ; $03C829 |
  SBC #$00C4                      ; $03C82A |
  ASL A                           ; $03C82D |
  TAY                             ; $03C82E |
  LDA $C818,y                     ; $03C82F |
  TXY                             ; $03C832 |
  JSL $03A377                     ; $03C833 |
  STZ $7902,x                     ; $03C837 |
  JML $048060                     ; $03C83A |

; 3 or 6 leaf
pop_flower_vine:
  SEP #$10                        ; $03C83E |
  LDX $12                         ; $03C840 |
  STZ $7402,x                     ; $03C842 |
  LDA $7040,x                     ; $03C845 |
  SEC                             ; $03C848 |
  SBC #$2001                      ; $03C849 |
  STA $7040,x                     ; $03C84C |
  LDA $6FA2,x                     ; $03C84F |
  ORA #$0001                      ; $03C852 |
  STA $6FA2,x                     ; $03C855 |
  LDA $7042,x                     ; $03C858 |
  ORA #$0002                      ; $03C85B |
  STA $7042,x                     ; $03C85E |
  LDA #$FFFC                      ; $03C861 |
  STA $7720,x                     ; $03C864 |
  LDY #$5C                        ; $03C867 |
  JSL $03C878                     ; $03C869 |
  JSL $03C3BB                     ; $03C86D |
  LDA #$0007                      ; $03C871 |
  STA $74A2,x                     ; $03C874 |
  RTL                             ; $03C877 |

; l sub
  SEP #$20                        ; $03C878 |
  TYA                             ; $03C87A |
  LDY #$06                        ; $03C87B |

CODE_03C87D:
  CMP $6EB5,y                     ; $03C87D |
  BEQ CODE_03C889                 ; $03C880 |
  DEY                             ; $03C882 |
  BNE CODE_03C87D                 ; $03C883 |
  SEC                             ; $03C885 |
  TYA                             ; $03C886 |
  BRA CODE_03C88E                 ; $03C887 |

CODE_03C889:
  TYA                             ; $03C889 |
  ADC #$06                        ; $03C88A |
  ASL A                           ; $03C88C |
  ASL A                           ; $03C88D |

CODE_03C88E:
  STA $7180,x                     ; $03C88E |
  REP #$20                        ; $03C891 |
  RTL                             ; $03C893 |

; data table: indices into $C8B8 table
DATA_03C894:         db $00, $00, $02, $00
DATA_03C898:         db $00, $00, $04, $00
DATA_03C89C:         db $00, $00, $02, $00
DATA_03C8A0:         db $00, $00, $00, $00

pop_random_item:
  SEP #$10                        ; $03C8A4 |
  LDA $7970                       ; $03C8A6 |\
  AND #$0007                      ; $03C8A9 | | rand(0, 8) * 2
  ASL A                           ; $03C8AC | |
  TAY                             ; $03C8AD |/
  LDX $C894,y                     ; $03C8AE | table of indices into sub table
  LDY $12                         ; $03C8B1 |
  JSR ($C8B8,x)                   ; $03C8B3 | table sub
  TYX                             ; $03C8B6 |
  RTL                             ; $03C8B7 |

random_item_inits:
DATA_03C8B8:         dw $B41D                ; coin
DATA_03C8BA:         dw $B42F                ; star
DATA_03C8BC:         dw $C8BE                ; 1up

item_1up:
  TYX                             ; $03C8BE |
  JSL $03A496                     ; $03C8BF |
  JSL $03A32E                     ; $03C8C3 |
  TXY                             ; $03C8C7 |
  RTS                             ; $03C8C8 |

pop_switch:
  SEP #$10                        ; $03C8C9 |
  LDX $12                         ; $03C8CB |
  JSL $03C640                     ; $03C8CD |
  JSL $03A331                     ; $03C8D1 |
  LDA #$009D                      ; $03C8D5 |
  TXY                             ; $03C8D8 |
  JSL $03A377                     ; $03C8D9 |
  LDA #$0002                      ; $03C8DD |
  STA $6F00,x                     ; $03C8E0 |
  SEP #$20                        ; $03C8E3 |
  LDA #$FF                        ; $03C8E5 |
  STA $74A0,x                     ; $03C8E7 |
  REP #$20                        ; $03C8EA |
  RTL                             ; $03C8EC |

; these get called upon a special event that needs updating every frame
; from the winged cloud / transform bubble
; code starts from $C3BC but relies on sprite ID * 2 as index
; ends up starting here, goes from ID $0AF - $0CC
winged_clouds_bubbles_mains:
DATA_03C8ED:         dw $C92D               ; morph bubble: car
DATA_03C8EF:         dw $C92D               ; morph bubble: mole
DATA_03C8F1:         dw $C92D               ; morph bubble: helicopter
DATA_03C8F3:         dw $C92D               ; morph bubble: train
DATA_03C8F5:         dw $0000               ; (N/A) wind of fuzzy
DATA_03C8F7:         dw $C92D               ; morph bubble: sub
DATA_03C8F9:         dw $0000               ; (N/A) hidden cloud
DATA_03C8FB:         dw $CAF8               ; cloud: 8 coins
DATA_03C8FD:         dw $CB66               ; cloud: 1up bubbled
DATA_03C8FF:         dw $CB66               ; cloud: flower
DATA_03C901:         dw $CB66               ; cloud: POW
DATA_03C903:         dw $CB6B               ; cloud: stairs
DATA_03C905:         dw $CD4F               ; cloud: platform
DATA_03C907:         dw $CB66               ; cloud: bandit
DATA_03C909:         dw $CDF2               ; cloud: coin
DATA_03C90B:         dw $CB66               ; cloud: 1up
DATA_03C90D:         dw $CB66               ; cloud: key
DATA_03C90F:         dw $CB66               ; cloud: 3 stars
DATA_03C911:         dw $CB66               ; cloud: 5 stars
DATA_03C913:         dw $CB66               ; cloud: door
DATA_03C915:         dw $CE91               ; cloud: ground eater
DATA_03C917:         dw $CB66               ; cloud: green watermelon
DATA_03C919:         dw $CB66               ; cloud: red watermelon
DATA_03C91B:         dw $CB66               ; cloud: blue watermelon
DATA_03C91D:         dw $CF58               ; cloud: 3-leaf flower vine
DATA_03C91F:         dw $CF58               ; cloud: 6-leaf flower vine
DATA_03C921:         dw $0000               ; (N/A) cloud: unused
DATA_03C923:         dw $0000               ; (N/A) Bowser Boss Door
DATA_03C925:         dw $CB66               ; cloud: random item
DATA_03C927:         dw $CB66               ; cloud: !-switch

; data table
DATA_03C929:         db $07, $06, $08, $06

main_transform_bubble:
  LDX $12                         ; $03C92D |
  LDA $18,x                       ; $03C92F |
  CMP #$0003                      ; $03C931 |
  BEQ CODE_03C93B                 ; $03C934 |
  SEP #$10                        ; $03C936 |
  JMP CODE_03CA65                 ; $03C938 |

CODE_03C93B:
  LDA $7362,x                     ; $03C93B |
  CLC                             ; $03C93E |
  ADC #$0020                      ; $03C93F |
  TAY                             ; $03C942 |
  JSL $03AA3C                     ; $03C943 |
  LDA $0D0F                       ; $03C947 |
  BEQ CODE_03C94D                 ; $03C94A |
  RTL                             ; $03C94C |

CODE_03C94D:
  JSL $03AF23                     ; $03C94D |
  LDA $7222,x                     ; $03C951 |
  CMP #$0100                      ; $03C954 |
  BPL CODE_03C966                 ; $03C957 |
  LDA $7A36,x                     ; $03C959 |
  CLC                             ; $03C95C |
  ADC #$0020                      ; $03C95D |
  AND #$03FF                      ; $03C960 |
  STA $7A36,x                     ; $03C963 |

CODE_03C966:
  LDY $7A37,x                     ; $03C966 |
  LDA $C929,y                     ; $03C969 |
  AND #$00FF                      ; $03C96C | (one byte)
  STA $7402,x                     ; $03C96F |
  LDA $7860,x                     ; $03C972 |
  AND #$0001                      ; $03C975 |
  BEQ CODE_03C97D                 ; $03C978 |
  STZ $7222,x                     ; $03C97A |

CODE_03C97D:
  LDA $7222,x                     ; $03C97D |
  SEC                             ; $03C980 |
  SBC $75E2,x                     ; $03C981 |
  BEQ CODE_03C98B                 ; $03C984 |
  EOR $75E2,x                     ; $03C986 |
  BMI CODE_03C995                 ; $03C989 |

CODE_03C98B:
  LDA $75E2,x                     ; $03C98B |
  EOR #$FFFF                      ; $03C98E |
  INC A                           ; $03C991 |
  STA $75E2,x                     ; $03C992 |

CODE_03C995:
  LDA $14                         ; $03C995 |
  AND #$000F                      ; $03C997 |
  BNE CODE_03C9A3                 ; $03C99A |
  LDA #$0808                      ; $03C99C |
  JSL $029BD9                     ; $03C99F |

CODE_03C9A3:
  LDA $7A96,x                     ; $03C9A3 |
  BNE CODE_03C9EC                 ; $03C9A6 |
  LDY $7D36,x                     ; $03C9A8 |
  BPL CODE_03C9EC                 ; $03C9AB |
  LDA $7360,x                     ; $03C9AD |
  SEC                             ; $03C9B0 |
  SBC #$00AE                      ; $03C9B1 |
  ASL A                           ; $03C9B4 |
  STA $0C88                       ; $03C9B5 |
  LDA $0C8A                       ; $03C9B8 |
  BEQ CODE_03C9D0                 ; $03C9BB |
  CMP $0C88                       ; $03C9BD |
  BNE CODE_03C9F1                 ; $03C9C0 |
  LDA #$0500                      ; $03C9C2 |
  STA $61F4                       ; $03C9C5 |
  TXY                             ; $03C9C8 |
  JSL $03B4D6                     ; $03C9C9 |
  JMP CODE_03CA8B                 ; $03C9CD |

CODE_03C9D0:
  LDA $61B2                       ; $03C9D0 |
  BPL CODE_03C9EC                 ; $03C9D3 |
  LDA $6150                       ; $03C9D5 |
  BEQ CODE_03C9ED                 ; $03C9D8 |
  LDA $6162                       ; $03C9DA |
  BEQ CODE_03C9ED                 ; $03C9DD |
  LDA $616A                       ; $03C9DF |
  CMP #$0001                      ; $03C9E2 |
  BEQ CODE_03C9EC                 ; $03C9E5 |
  CMP #$0004                      ; $03C9E7 |
  BNE CODE_03C9ED                 ; $03C9EA |

CODE_03C9EC:
  RTL                             ; $03C9EC |

CODE_03C9ED:
  JSL $04F74A                     ; $03C9ED |

CODE_03C9F1:
  LDA #$0036                      ; $03C9F1 |\ play sound #$0036
  JSL $0085D2                     ; $03C9F4 |/
  LDA #$0010                      ; $03C9F8 |
  STA $60AC                       ; $03C9FB |
  STZ $614E                       ; $03C9FE |
  LDA #$0000                      ; $03CA01 |
  STA $70336C                     ; $03CA04 |
  LDA #$2D6C                      ; $03CA08 |
  STA $3002                       ; $03CA0B |
  LDA #$2F6C                      ; $03CA0E |
  STA $3004                       ; $03CA11 |
  LDA #$65E9                      ; $03CA14 |
  STA $3006                       ; $03CA17 |
  LDA #$0100                      ; $03CA1A |
  STA $3018                       ; $03CA1D |
  LDX #$08                        ; $03CA20 |
  LDA #$BC98                      ; $03CA22 |
  JSL $7EDE44                     ; $03CA25 | GSU init
  REP #$10                        ; $03CA29 |
  LDA #$7FFF                      ; $03CA2B |
  STA $703070                     ; $03CA2E |
  LDX #$001C                      ; $03CA32 |

CODE_03CA35:
  LDA $5FCB2C,x                   ; $03CA35 | mirror of $3F
  STA $70310E,x                   ; $03CA39 |
  DEX                             ; $03CA3D |
  DEX                             ; $03CA3E |
  BPL CODE_03CA35                 ; $03CA3F |
  SEP #$10                        ; $03CA41 |
  LDX $12                         ; $03CA43 |
  LDA $0C8A                       ; $03CA45 |
  BEQ CODE_03CA53                 ; $03CA48 |
  LDA #$0003                      ; $03CA4A |
  STA $614E                       ; $03CA4D |
  JMP CODE_03CA8B                 ; $03CA50 |

CODE_03CA53:
  INC $18,x                       ; $03CA53 |
  LDA #$00FF                      ; $03CA55 |
  STA $74A2,x                     ; $03CA58 |
  LDA #$0030                      ; $03CA5B |
  STA $7A96,x                     ; $03CA5E |
  STZ $614E                       ; $03CA61 |
  RTL                             ; $03CA64 |

CODE_03CA65:
  LDA $0D0F                       ; $03CA65 |
  BNE CODE_03CA72                 ; $03CA68 |
  LDY $614E                       ; $03CA6A |
  BNE CODE_03CA73                 ; $03CA6D |
  INC $614E                       ; $03CA6F |

CODE_03CA72:
  RTL                             ; $03CA72 |

CODE_03CA73:
  DEC $7A96,x                     ; $03CA73 |
  BPL CODE_03CA8A                 ; $03CA76 |
  INC $614E                       ; $03CA78 |
  LDA #$0164                      ; $03CA7B |
  STA $60BE                       ; $03CA7E |
  LDA #$B800                      ; $03CA81 |
  STA $6114                       ; $03CA84 |
  JMP CODE_03CA8B                 ; $03CA87 |

CODE_03CA8A:
  RTL                             ; $03CA8A |

CODE_03CA8B:
  LDA $78,x                       ; $03CA8B |
  BNE CODE_03CAC4                 ; $03CA8D |
  SEP #$20                        ; $03CA8F |
  INC $0BF1                       ; $03CA91 |
  LDY $0BF1                       ; $03CA94 |
  LDA $74A0,x                     ; $03CA97 |
  STA $0BF1,y                     ; $03CA9A |
  REP #$20                        ; $03CA9D |
  JSL $03AF0D                     ; $03CA9F |
  LDA $7360,x                     ; $03CAA3 |
  TXY                             ; $03CAA6 |
  JSL $03A377                     ; $03CAA7 |
  LDA #$0002                      ; $03CAAB |
  STA $6F00,x                     ; $03CAAE |
  LDA $7900,x                     ; $03CAB1 |
  STA $70E2,x                     ; $03CAB4 |
  LDA $7902,x                     ; $03CAB7 |
  STA $7182,x                     ; $03CABA |
  LDA #$00FF                      ; $03CABD |
  STA $74A2,x                     ; $03CAC0 |
  RTL                             ; $03CAC3 |

CODE_03CAC4:
  JML $03A32E                     ; $03CAC4 |

; data table
DATA_03CAC8:         dw $0004
DATA_03CACA:         dw $000C
DATA_03CACC:         dw $000D
DATA_03CACE:         dw $000E
DATA_03CAD0:         dw $000F
DATA_03CAD2:         dw $0010
DATA_03CAD4:         dw $0011
DATA_03CAD6:         dw $0012

; data table
DATA_03CAD8:         dw $FFF0
DATA_03CADA:         dw $0020
DATA_03CADC:         dw $0010
DATA_03CADE:         dw $0000
DATA_03CAE0:         dw $FFF0
DATA_03CAE2:         dw $FFE0
DATA_03CAE4:         dw $FFF0
DATA_03CAE6:         dw $0000

; data table
DATA_03CAE8:         dw $FFE0
DATA_03CAEA:         dw $0000
DATA_03CAEC:         dw $0010
DATA_03CAEE:         dw $0020
DATA_03CAF0:         dw $0010
DATA_03CAF2:         dw $0000
DATA_03CAF4:         dw $FFF0
DATA_03CAF6:         dw $FFE0

main_8_coin_cloud:
  SEP #$10                        ; $03CAF8 |
  LDX $12                         ; $03CAFA |
  LDA $0D0F                       ; $03CAFC |
  BNE $08                         ; $03CAFF |
  LDA $7A96,x                     ; $03CB01 |
  BEQ CODE_03CB0A                 ; $03CB04 |
  DEC $7A96,x                     ; $03CB06 |
  RTL                             ; $03CB09 |

CODE_03CB0A:
  LDA #$0001                      ; $03CB0A |
  STA $61AE                       ; $03CB0D |
  STA $61B0                       ; $03CB10 |
  LDA #$0004                      ; $03CB13 |
  STA $7A96,x                     ; $03CB16 |
  LDY $18,x                       ; $03CB19 |
  LDA $CAC5,y                     ; $03CB1B |
  PHY                             ; $03CB1E |
  JSL $0085D2                     ; $03CB1F |
  PLY                             ; $03CB23 |
  LDA $70E2,x                     ; $03CB24 |
  CLC                             ; $03CB27 |
  ADC $CAD5,y                     ; $03CB28 |
  STA $70E2,x                     ; $03CB2B |
  STA $0091                       ; $03CB2E |
  LDA $7182,x                     ; $03CB31 |
  CLC                             ; $03CB34 |
  ADC $CAE5,y                     ; $03CB35 |
  STA $7182,x                     ; $03CB38 |
  STA $0093                       ; $03CB3B |
  INY                             ; $03CB3E |
  INY                             ; $03CB3F |
  STY $18,x                       ; $03CB40 |
  CPY #$13                        ; $03CB42 |
  BCC CODE_03CB50                 ; $03CB44 |
  STZ $61AE                       ; $03CB46 |
  STZ $61B0                       ; $03CB49 |
  JSL $03A32E                     ; $03CB4C |

CODE_03CB50:
  LDA #$0005                      ; $03CB50 |
  STA $008F                       ; $03CB53 |
  LDA #$6000                      ; $03CB56 |
  STA $0095                       ; $03CB59 |
  JSL $109295                     ; $03CB5C |
  LDX $12                         ; $03CB60 |
  JML $0280AC                     ; $03CB62 |

; most clouds that simply init something: pretty much does nothing
; because they don't require updating
main_item_clouds:
  SEP #$10                        ; $03CB66 |
  LDX $12                         ; $03CB68 |

CODE_03CB6A:
  RTL                             ; $03CB6A |

main_stairs:
  SEP #$10                        ; $03CB6B |
  LDX $12                         ; $03CB6D |
  LDA $0D0F                       ; $03CB6F |
  BNE CODE_03CB6A                 ; $03CB72 |
  LDA $18,x                       ; $03CB74 |
  CMP #$0003                      ; $03CB76 |
  BEQ CODE_03CB7E                 ; $03CB79 |
  JMP CODE_03CD5F                 ; $03CB7B |

CODE_03CB7E:
  LDA $7A96,x                     ; $03CB7E |
  BEQ CODE_03CB92                 ; $03CB81 |
  DEC $7A96,x                     ; $03CB83 |
  CMP #$0010                      ; $03CB86 |
  BCC CODE_03CB8F                 ; $03CB89 |
  JML $03CC6B                     ; $03CB8B |

CODE_03CB8F:
  JMP CODE_03CC3C                 ; $03CB8F |

CODE_03CB92:
  LDA $70E2,x                     ; $03CB92 |
  STA $3010                       ; $03CB95 |
  LDA $7182,x                     ; $03CB98 |
  STA $3000                       ; $03CB9B |
  LDX #$0A                        ; $03CB9E |
  LDA #$CE2F                      ; $03CBA0 |
  JSL $7EDE91                     ; $03CBA3 | GSU init
  LDX $12                         ; $03CBA7 |
  JSR CODE_03CD3F                 ; $03CBA9 |
  BCS CODE_03CBCD                 ; $03CBAC |
  LDA $70E2,x                     ; $03CBAE |
  CLC                             ; $03CBB1 |
  ADC $76,x                       ; $03CBB2 |
  STA $3010                       ; $03CBB4 |
  LDA $7182,x                     ; $03CBB7 |
  STA $3000                       ; $03CBBA |
  LDX #$0A                        ; $03CBBD |
  LDA #$CE2F                      ; $03CBBF |
  JSL $7EDE91                     ; $03CBC2 | GSU init
  LDX $12                         ; $03CBC6 |
  JSR CODE_03CD3F                 ; $03CBC8 |
  BCC CODE_03CBD7                 ; $03CBCB |

CODE_03CBCD:
  INC $18,x                       ; $03CBCD |
  LDA #$0030                      ; $03CBCF |
  STA $7A96,x                     ; $03CBD2 |
  BRA CODE_03CC3C                 ; $03CBD5 |

CODE_03CBD7:
  JSR CODE_03CD23                 ; $03CBD7 |
  LDA $70E2,x                     ; $03CBDA |
  STA $0091                       ; $03CBDD |
  LDA $7182,x                     ; $03CBE0 |
  STA $0093                       ; $03CBE3 |
  LDA #$0001                      ; $03CBE6 |
  STA $008F                       ; $03CBE9 |
  LDA #$3D59                      ; $03CBEC |
  LDY $77,x                       ; $03CBEF |
  BPL CODE_03CBF6                 ; $03CBF1 |
  LDA #$3D5A                      ; $03CBF3 |

CODE_03CBF6:
  STA $0095                       ; $03CBF6 |
  JSL $109295                     ; $03CBF9 |
  LDX $12                         ; $03CBFD |
  LDA $0091                       ; $03CBFF |
  CLC                             ; $03CC02 |
  ADC $76,x                       ; $03CC03 |
  STA $0091                       ; $03CC05 |
  LDA #$6600                      ; $03CC08 |
  LDY $77,x                       ; $03CC0B |
  BPL CODE_03CC12                 ; $03CC0D |
  LDA #$6700                      ; $03CC0F |

CODE_03CC12:
  STA $0095                       ; $03CC12 |
  JSL $109295                     ; $03CC15 |
  LDX $12                         ; $03CC19 |
  LDA $70E2,x                     ; $03CC1B |
  CLC                             ; $03CC1E |
  ADC $76,x                       ; $03CC1F |
  STA $70E2,x                     ; $03CC21 |
  LDA $7182,x                     ; $03CC24 |
  SEC                             ; $03CC27 |
  SBC #$0010                      ; $03CC28 |
  STA $7182,x                     ; $03CC2B |
  JSL $0280AC                     ; $03CC2E |
  LDA $7142,y                     ; $03CC32 |
  CLC                             ; $03CC35 |
  ADC #$0010                      ; $03CC36 |
  STA $7142,y                     ; $03CC39 |

CODE_03CC3C:
  LDA $7680,x                     ; $03CC3C |
  SEC                             ; $03CC3F |
  SBC #$0080                      ; $03CC40 |
  ASL A                           ; $03CC43 |
  LDA #$FF00                      ; $03CC44 |
  BCS CODE_03CC4C                 ; $03CC47 |
  LDA #$0100                      ; $03CC49 |

CODE_03CC4C:
  STA $7E36                       ; $03CC4C |
  LDA $7682,x                     ; $03CC4F |
  SEC                             ; $03CC52 |
  SBC #$0060                      ; $03CC53 |
  ASL A                           ; $03CC56 |
  LDA #$FF00                      ; $03CC57 |
  BCS CODE_03CC5F                 ; $03CC5A |
  LDA #$0100                      ; $03CC5C |

CODE_03CC5F:
  STA $7E38                       ; $03CC5F |
  LDA #$0001                      ; $03CC62 | entry point
  STA $61AE                       ; $03CC65 |
  STA $61B0                       ; $03CC68 |
  LDA $7E2A                       ; $03CC6B | entry point
  BNE CODE_03CCBA                 ; $03CC6E |
  LDA $0C1E                       ; $03CC70 |\
  ORA $0C20                       ; $03CC73 | | return now if autoscrolling
  BEQ CODE_03CC79                 ; $03CC76 | |
  RTL                             ; $03CC78 |/

CODE_03CC79:
  LDA $7680,x                     ; $03CC79 |
  SEC                             ; $03CC7C |
  SBC #$0010                      ; $03CC7D |
  CMP #$00D1                      ; $03CC80 |
  BCS CODE_03CC91                 ; $03CC83 |
  LDA $7682,x                     ; $03CC85 |
  SEC                             ; $03CC88 |
  SBC #$0010                      ; $03CC89 |
  CMP #$00B1                      ; $03CC8C |
  BCC CODE_03CD06                 ; $03CC8F |

CODE_03CC91:
  LDA $0039                       ; $03CC91 |
  STA $0C94                       ; $03CC94 |
  LDA $003B                       ; $03CC97 |
  STA $0C96                       ; $03CC9A |
  SEP #$20                        ; $03CC9D |
  LDY #$17                        ; $03CC9F |
  LDX #$5C                        ; $03CCA1 |

CODE_03CCA3:
  LDA $6F00,x                     ; $03CCA3 |
  CPX $12                         ; $03CCA6 |
  BNE CODE_03CCAC                 ; $03CCA8 |
  LDA #$00                        ; $03CCAA |

CODE_03CCAC:
  STA $0C98,y                     ; $03CCAC |
  DEX                             ; $03CCAF |
  DEX                             ; $03CCB0 |
  DEX                             ; $03CCB1 |
  DEX                             ; $03CCB2 |
  DEY                             ; $03CCB3 |
  BPL CODE_03CCA3                 ; $03CCB4 |
  LDX $12                         ; $03CCB6 |
  REP #$20                        ; $03CCB8 |

CODE_03CCBA:
  LDA #$0001                      ; $03CCBA |
  STA $7E2A                       ; $03CCBD |
  STX $1E2C                       ; $03CCC0 |
  LDA $70E2,x                     ; $03CCC3 |
  STA $7E2E                       ; $03CCC6 |
  LDA $7182,x                     ; $03CCC9 |
  STA $7E30                       ; $03CCCC |
  LDA $0039                       ; $03CCCF |
  STA $0C23                       ; $03CCD2 |
  LDA $003B                       ; $03CCD5 |
  STA $0C27                       ; $03CCD8 |
  LDA $60B0                       ; $03CCDB |
  CMP #$0008                      ; $03CCDE |
  BMI CODE_03CCF5                 ; $03CCE1 |
  CMP #$00E8                      ; $03CCE3 |
  BPL CODE_03CCF5                 ; $03CCE6 |
  LDA $60B2                       ; $03CCE8 |
  CMP #$0010                      ; $03CCEB |
  BMI CODE_03CCF5                 ; $03CCEE |
  CMP #$00B0                      ; $03CCF0 |
  BMI CODE_03CD06                 ; $03CCF3 |

CODE_03CCF5:
  LDA #$0001                      ; $03CCF5 |
  STA $61AE                       ; $03CCF8 |
  LDA #$0002                      ; $03CCFB |
  CMP $61D6                       ; $03CCFE |
  BCC CODE_03CD06                 ; $03CD01 |
  STA $61D6                       ; $03CD03 |

CODE_03CD06:
  RTL                             ; $03CD06 |

; l sub
  LDA $7E2A                       ; $03CD07 |
  BEQ CODE_03CD12                 ; $03CD0A |
  CPX $1E2C                       ; $03CD0C |
  BEQ CODE_03CD12                 ; $03CD0F |
  RTL                             ; $03CD11 |

CODE_03CD12:
  JSL $03CC6B                     ; $03CD12 |
  LDA $7220,x                     ; $03CD16 |
  STA $7E36                       ; $03CD19 |
  LDA $7222,x                     ; $03CD1C |
  STA $7E38                       ; $03CD1F |
  RTL                             ; $03CD22 |

; s sub
CODE_03CD23:
  LDA #$0008                      ; $03CD23 |
  STA $7A96,x                     ; $03CD26 |
  LDA $78,x                       ; $03CD29 |
  INC A                           ; $03CD2B |
  CMP #$0006                      ; $03CD2C |
  BCC CODE_03CD34                 ; $03CD2F |
  LDA #$0001                      ; $03CD31 |

CODE_03CD34:
  STA $78,x                       ; $03CD34 |
  CLC                             ; $03CD36 |
  ADC #$004A                      ; $03CD37 |
  JSL $0085D2                     ; $03CD3A |
  RTS                             ; $03CD3E |

; s sub
CODE_03CD3F:
  LDA $300C                       ; $03CD3F |
  CMP #$0000                      ; $03CD42 |
  CLC                             ; $03CD45 |
  BEQ CODE_03CD4E                 ; $03CD46 |
  SBC #$96D0                      ; $03CD48 |
  CMP #$0009                      ; $03CD4B |

CODE_03CD4E:
  RTS                             ; $03CD4E |

main_cloud_platform:
  SEP #$10                        ; $03CD4F |
  LDX $12                         ; $03CD51 |
  LDA $0D0F                       ; $03CD53 |
  BNE CODE_03CD71                 ; $03CD56 |
  LDA $18,x                       ; $03CD58 |
  CMP #$0003                      ; $03CD5A |
  BEQ CODE_03CD80                 ; $03CD5D |

CODE_03CD5F:
  LDA $7A96,x                     ; $03CD5F | entry point (from stairs)
  BEQ CODE_03CD72                 ; $03CD62 |
  DEC $7A96,x                     ; $03CD64 |
  JSL $03CC62                     ; $03CD67 |
  STZ $7E36                       ; $03CD6B |
  STZ $7E38                       ; $03CD6E |

CODE_03CD71:
  RTL                             ; $03CD71 |

CODE_03CD72:
  LDA $7E2A                       ; $03CD72 |
  BNE CODE_03CD7D                 ; $03CD75 |
  STZ $61AE                       ; $03CD77 |
  STZ $61B0                       ; $03CD7A |

CODE_03CD7D:
  JMP CODE_03A32E                 ; $03CD7D |

CODE_03CD80:
  LDA $7A96,x                     ; $03CD80 |
  BEQ CODE_03CD91                 ; $03CD83 |
  DEC $7A96,x                     ; $03CD85 |
  CMP #$0010                      ; $03CD88 |
  BCC CODE_03CDEF                 ; $03CD8B |
  JML $03CC6B                     ; $03CD8D |

CODE_03CD91:
  LDA $70E2,x                     ; $03CD91 |
  STA $3010                       ; $03CD94 |
  LDA $7182,x                     ; $03CD97 |
  STA $3000                       ; $03CD9A |
  LDX #$0A                        ; $03CD9D |
  LDA #$CE2F                      ; $03CD9F |
  JSL $7EDE91                     ; $03CDA2 | GSU init
  LDX $12                         ; $03CDA6 |
  JSR CODE_03CD3F                 ; $03CDA8 |
  BCC CODE_03CDB7                 ; $03CDAB |
  INC $18,x                       ; $03CDAD |
  LDA #$0030                      ; $03CDAF |
  STA $7A96,x                     ; $03CDB2 |
  BRA CODE_03CDEF                 ; $03CDB5 |

CODE_03CDB7:
  JSR CODE_03CD23                 ; $03CDB7 |
  LDA $70E2,x                     ; $03CDBA |
  STA $0091                       ; $03CDBD |
  LDA $7182,x                     ; $03CDC0 |
  STA $0093                       ; $03CDC3 |
  LDA #$0001                      ; $03CDC6 |
  STA $008F                       ; $03CDC9 |
  LDA #$1512                      ; $03CDCC |
  STA $0095                       ; $03CDCF |
  JSL $109295                     ; $03CDD2 |
  LDX $12                         ; $03CDD6 |
  JSL $0280AC                     ; $03CDD8 |
  LDA $7142,y                     ; $03CDDC |
  SEC                             ; $03CDDF |
  SBC #$0004                      ; $03CDE0 |
  STA $7142,y                     ; $03CDE3 |
  LDA $70E2,x                     ; $03CDE6 |
  CLC                             ; $03CDE9 |
  ADC $76,x                       ; $03CDEA |
  STA $70E2,x                     ; $03CDEC |

CODE_03CDEF:
  JMP CODE_03CC3C                 ; $03CDEF |

main_1_coin_cloud:
  SEP #$10                        ; $03CDF2 |
  LDX $12                         ; $03CDF4 |
  LDA $0D0F                       ; $03CDF6 |
  BNE CODE_03CE03                 ; $03CDF9 |
  LDA $7A96,x                     ; $03CDFB |
  BEQ CODE_03CE04                 ; $03CDFE |
  DEC $7A96,x                     ; $03CE00 |

CODE_03CE03:
  RTL                             ; $03CE03 |

CODE_03CE04:
  LDA #$0004                      ; $03CE04 |\ play sound #$0004
  JSL $0085D2                     ; $03CE07 |/
  LDA $70E2,x                     ; $03CE0B |
  STA $0091                       ; $03CE0E |
  LDA $7182,x                     ; $03CE11 |
  STA $0093                       ; $03CE14 |
  JSL $03A32E                     ; $03CE17 |
  LDA #$0005                      ; $03CE1B |
  STA $008F                       ; $03CE1E |
  LDA #$6000                      ; $03CE21 |
  STA $0095                       ; $03CE24 |
  JSL $109295                     ; $03CE27 |
  LDX $12                         ; $03CE2B |
  JML $0280AC                     ; $03CE2D |

; table of RAM addresses
DATA_03CE31:         dw $0000
DATA_03CE33:         dw $0000
DATA_03CE35:         dw $0000
DATA_03CE37:         dw $0000
DATA_03CE39:         dw $0000
DATA_03CE3B:         dw $1D24
DATA_03CE3D:         dw $1D06
DATA_03CE3F:         dw $1D08
DATA_03CE41:         dw $1D06
DATA_03CE43:         dw $1D26
DATA_03CE45:         dw $1D28
DATA_03CE47:         dw $1D0A
DATA_03CE49:         dw $1D02
DATA_03CE4B:         dw $1D0C
DATA_03CE4D:         dw $1D2A
DATA_03CE4F:         dw $1D12
DATA_03CE51:         dw $1C5C
DATA_03CE53:         dw $1C5E
DATA_03CE55:         dw $1C5C
DATA_03CE57:         dw $1D14
DATA_03CE59:         dw $1D16
DATA_03CE5B:         dw $1CD0
DATA_03CE5D:         dw $1CB6
DATA_03CE5F:         dw $1CD2
DATA_03CE61:         dw $1D18
DATA_03CE63:         dw $0000
DATA_03CE65:         dw $1CD4
DATA_03CE67:         dw $1CBA
DATA_03CE69:         dw $1CD6
DATA_03CE6B:         dw $0000
DATA_03CE6D:         dw $1D12
DATA_03CE6F:         dw $1C5C
DATA_03CE71:         dw $1C5E
DATA_03CE73:         dw $1C5C
DATA_03CE75:         dw $1D14
DATA_03CE77:         dw $1D16
DATA_03CE79:         dw $1CD0
DATA_03CE7B:         dw $1CB6
DATA_03CE7D:         dw $1CD2
DATA_03CE7F:         dw $1D18
DATA_03CE81:         dw $1C5C
DATA_03CE83:         dw $1CFE
DATA_03CE85:         dw $1CBA
DATA_03CE87:         dw $1D00
DATA_03CE89:         dw $1C5C
DATA_03CE8B:         dw $1E00
DATA_03CE8D:         dw $1E00
DATA_03CE8F:         dw $3C00

main_ground_eater:
  SEP #$10                        ; $03CE91 |
  LDX $12                         ; $03CE93 |
  LDA $0D0F                       ; $03CE95 |
  BEQ CODE_03CE9B                 ; $03CE98 |
  RTL                             ; $03CE9A |

CODE_03CE9B:
  LDA $7A96,x                     ; $03CE9B |
  BEQ CODE_03CEAF                 ; $03CE9E |
  DEC $7A96,x                     ; $03CEA0 |
  CMP #$0040                      ; $03CEA3 |
  BCC CODE_03CEAC                 ; $03CEA6 |
  JML $03CC6B                     ; $03CEA8 |

CODE_03CEAC:
  JMP CODE_03CC3C                 ; $03CEAC |

CODE_03CEAF:
  LDA #$0001                      ; $03CEAF |
  STA $61AE                       ; $03CEB2 |
  STA $61B0                       ; $03CEB5 |
  LDA #$0010                      ; $03CEB8 |
  STA $7A96,x                     ; $03CEBB |
  LDA #$0010                      ; $03CEBE |
  STA $61C6                       ; $03CEC1 |
  LDA $70E2,x                     ; $03CEC4 |
  SEC                             ; $03CEC7 |
  SBC $78,x                       ; $03CEC8 |
  STA $04                         ; $03CECA |
  LDA $7182,x                     ; $03CECC |
  SEC                             ; $03CECF |
  SBC #$0010                      ; $03CED0 |
  STA $0093                       ; $03CED3 |
  LDY $18,x                       ; $03CED6 |
  INY                             ; $03CED8 |
  CPY #$0A                        ; $03CED9 |
  BCC CODE_03CEE7                 ; $03CEDB |
  STZ $61AE                       ; $03CEDD |
  STZ $61B0                       ; $03CEE0 |
  JML $03A32E                     ; $03CEE3 |

CODE_03CEE7:
  STY $18,x                       ; $03CEE7 |
  LDA $CE87,y                     ; $03CEE9 |
  TAY                             ; $03CEEC |
  BNE CODE_03CEF9                 ; $03CEED |
  LDA $7182,x                     ; $03CEEF |
  CLC                             ; $03CEF2 |
  ADC #$0010                      ; $03CEF3 |
  STA $7182,x                     ; $03CEF6 |

CODE_03CEF9:
  PHY                             ; $03CEF9 |
  LDA #$0047                      ; $03CEFA |\ play sound #$0047
  JSL $0085D2                     ; $03CEFD |/
  PLY                             ; $03CF01 |
  REP #$10                        ; $03CF02 |
  LDA #$0003                      ; $03CF04 |
  STA $00                         ; $03CF07 |

CODE_03CF09:
  LDA $04                         ; $03CF09 |
  STA $0091                       ; $03CF0B |
  LDA #$0005                      ; $03CF0E |
  STA $02                         ; $03CF11 |

CODE_03CF13:
  LDA $CE31,y                     ; $03CF13 |\
  BEQ CODE_03CF1C                 ; $03CF16 | | table of RAM addresses
  TAX                             ; $03CF18 | | stores value at address
  LDA $0000,x                     ; $03CF19 | | into $0095

CODE_03CF1C:
  STA $0095                       ; $03CF1C |/
  LDA #$0001                      ; $03CF1F |
  STA $008F                       ; $03CF22 |
  PHY                             ; $03CF25 |
  JSL $109295                     ; $03CF26 |
  PLY                             ; $03CF2A |
  LDA $0091                       ; $03CF2B |
  CLC                             ; $03CF2E |
  ADC #$0010                      ; $03CF2F |
  STA $0091                       ; $03CF32 |
  INY                             ; $03CF35 |
  INY                             ; $03CF36 |
  DEC $02                         ; $03CF37 |
  BNE CODE_03CF13                 ; $03CF39 |
  LDA $0093                       ; $03CF3B |
  CLC                             ; $03CF3E |
  ADC #$0010                      ; $03CF3F |
  STA $0093                       ; $03CF42 |
  DEC $00                         ; $03CF45 |
  BNE CODE_03CF09                 ; $03CF47 |
  SEP #$10                        ; $03CF49 |
  LDX $12                         ; $03CF4B |
  JMP CODE_03CC3C                 ; $03CF4D |

; data table
DATA_03CF50:         dw $8802
DATA_03CF52:         dw $E802
DATA_03CF54:         dw $0060
DATA_03CF56:         dw $00C0

main_flower_vine:
  SEP #$10                        ; $03CF58 |
  LDX $12                         ; $03CF5A |
  LDA $18,x                       ; $03CF5C |
  CMP #$0004                      ; $03CF5E |
  BEQ CODE_03CF66                 ; $03CF61 |
  JMP CODE_03CFDF                 ; $03CF63 |

CODE_03CF66:
  LDA $0D0F                       ; $03CF66 |
  BNE CODE_03CF81                 ; $03CF69 |
  JSL $03AF23                     ; $03CF6B |
  JSL $03CC6B                     ; $03CF6F |
  LDA $7860,x                     ; $03CF73 |
  AND #$0001                      ; $03CF76 |
  BNE CODE_03CF82                 ; $03CF79 |
  LDA #$0020                      ; $03CF7B |
  STA $7A96,x                     ; $03CF7E |

CODE_03CF81:
  RTL                             ; $03CF81 |

CODE_03CF82:
  LDY $7A96,x                     ; $03CF82 |
  BEQ CODE_03CFAB                 ; $03CF85 |
  CPY #$10                        ; $03CF87 |
  BCS CODE_03CFAA                 ; $03CF89 |
  TYA                             ; $03CF8B |
  AND #$0001                      ; $03CF8C |
  EOR $70E2,x                     ; $03CF8F |
  STA $70E2,x                     ; $03CF92 |
  CPY #$04                        ; $03CF95 |
  BNE CODE_03CFAA                 ; $03CF97 |
  LDA $7CD6,x                     ; $03CF99 |
  STA $00                         ; $03CF9C |
  LDA $7CD8,x                     ; $03CF9E |
  STA $02                         ; $03CFA1 |
  LDA #$01E7                      ; $03CFA3 |
  JSL $03B56E                     ; $03CFA6 |

CODE_03CFAA:
  RTL                             ; $03CFAA |

CODE_03CFAB:
  INC $18,x                       ; $03CFAB |
  LDA #$0001                      ; $03CFAD |
  STA $61AE                       ; $03CFB0 |
  STA $61B0                       ; $03CFB3 |
  LDA $7360,x                     ; $03CFB6 |
  SEC                             ; $03CFB9 |
  SBC #$00C7                      ; $03CFBA |
  ASL A                           ; $03CFBD |
  TAY                             ; $03CFBE |
  LDA $7040,x                     ; $03CFBF |
  CLC                             ; $03CFC2 |
  ADC $CF50,y                     ; $03CFC3 |
  AND #$FFF3                      ; $03CFC6 |
  STA $7040,x                     ; $03CFC9 |
  LDA $CF54,y                     ; $03CFCC |
  STA $16,x                       ; $03CFCF |
  STZ $76,x                       ; $03CFD1 |
  STZ $78,x                       ; $03CFD3 |
  STZ $7A36,x                     ; $03CFD5 |
  STZ $7A38,x                     ; $03CFD8 |
  STZ $7720,x                     ; $03CFDB |
  RTL                             ; $03CFDE |

CODE_03CFDF:
  TXA                             ; $03CFDF |
  STA $3002                       ; $03CFE0 |
  LDX #$09                        ; $03CFE3 |
  LDA #$98B6                      ; $03CFE5 |
  JSL $7EDE44                     ; $03CFE8 | GSU init
  LDX $12                         ; $03CFEC |
  LDA $0D0F                       ; $03CFEE |
  BNE CODE_03D02A                 ; $03CFF1 |
  LDA $18,x                       ; $03CFF3 |
  CMP #$0005                      ; $03CFF5 |
  BNE CODE_03D040                 ; $03CFF8 |
  LDA $7182,x                     ; $03CFFA |
  PHA                             ; $03CFFD |
  SEC                             ; $03CFFE |
  SBC $76,x                       ; $03CFFF |
  STA $7182,x                     ; $03D001 |
  SEC                             ; $03D004 |
  SBC $003B                       ; $03D005 |
  STA $7682,x                     ; $03D008 |
  JSL $03CC3C                     ; $03D00B |
  PLA                             ; $03D00F |
  STA $7182,x                     ; $03D010 |
  LDA $76,x                       ; $03D013 |
  CMP $16,x                       ; $03D015 |
  BCS CODE_03D02B                 ; $03D017 |
  INC $76,x                       ; $03D019 |
  SBC #$0015                      ; $03D01B |
  AND #$001F                      ; $03D01E |
  BNE CODE_03D02A                 ; $03D021 |
  LDA #$0005                      ; $03D023 |\ play sound #$0005
  JSL $0085D2                     ; $03D026 |/

CODE_03D02A:
  RTL                             ; $03D02A |

CODE_03D02B:
  LDA $7A38,x                     ; $03D02B |
  CMP #$000F                      ; $03D02E |
  BCS CODE_03D037                 ; $03D031 |
  INC $7A38,x                     ; $03D033 |
  RTL                             ; $03D036 |

CODE_03D037:
  INC $18,x                       ; $03D037 |
  STZ $61AE                       ; $03D039 |
  STZ $61B0                       ; $03D03C |
  RTL                             ; $03D03F |

CODE_03D040:
  JSL $03AF23                     ; $03D040 |
  TXA                             ; $03D044 |
  STA $3002                       ; $03D045 |
  LDX #$09                        ; $03D048 |
  LDA #$9B23                      ; $03D04A |
  JSL $7EDE44                     ; $03D04D | GSU init
  LDA $6000                       ; $03D051 |
  BEQ CODE_03D05A                 ; $03D054 |
  JSL $0085D2                     ; $03D056 |

CODE_03D05A:
  LDX $12                         ; $03D05A |
  RTL                             ; $03D05C |
  STZ $0E                         ; $03D05D |
  LDY $7D36,x                     ; $03D05F |
  BMI CODE_03D066                 ; $03D062 |
  CLC                             ; $03D064 |
  RTL                             ; $03D065 |

CODE_03D066:
  LDA $6122                       ; $03D066 |
  CLC                             ; $03D069 |
  ADC $7BB8,x                     ; $03D06A |
  STA $00                         ; $03D06D |
  CLC                             ; $03D06F |
  ADC $7C18,x                     ; $03D070 |
  STA $08                         ; $03D073 |
  LDA $7C18,x                     ; $03D075 |
  SEC                             ; $03D078 |
  SBC $00                         ; $03D079 |
  STA $0A                         ; $03D07B |
  LDY #$00                        ; $03D07D |
  CLC                             ; $03D07F |
  ADC $08                         ; $03D080 |
  BMI CODE_03D086                 ; $03D082 |
  LDY #$02                        ; $03D084 |

CODE_03D086:
  STY $0C                         ; $03D086 |
  LDA $6120                       ; $03D088 |
  CLC                             ; $03D08B |
  ADC $7BB6,x                     ; $03D08C |
  STA $00                         ; $03D08F |
  CLC                             ; $03D091 |
  ADC $7C16,x                     ; $03D092 |
  STA $02                         ; $03D095 |
  LDA $7C16,x                     ; $03D097 |
  SEC                             ; $03D09A |
  SBC $00                         ; $03D09B |
  STA $04                         ; $03D09D |
  LDY #$00                        ; $03D09F |
  CLC                             ; $03D0A1 |
  ADC $02                         ; $03D0A2 |
  BMI CODE_03D0A8                 ; $03D0A4 |
  LDY #$02                        ; $03D0A6 |

CODE_03D0A8:
  STY $06                         ; $03D0A8 |
  LDA $7962,y                     ; $03D0AA |
  BPL CODE_03D0B3                 ; $03D0AD |
  EOR #$FFFF                      ; $03D0AF |
  INC A                           ; $03D0B2 |

CODE_03D0B3:
  STA $00                         ; $03D0B3 |
  LDY $0C                         ; $03D0B5 |
  LDA $7968,y                     ; $03D0B7 |
  BPL CODE_03D0C0                 ; $03D0BA |
  EOR #$FFFF                      ; $03D0BC |
  INC A                           ; $03D0BF |

CODE_03D0C0:
  CMP $00                         ; $03D0C0 |
  BCC CODE_03D0DD                 ; $03D0C2 |
  LDA $7968,y                     ; $03D0C4 |
  BMI CODE_03D0DA                 ; $03D0C7 |
  LDA $00                         ; $03D0C9 |
  CMP #$000A                      ; $03D0CB |
  BCC CODE_03D0DA                 ; $03D0CE |
  REP #$10                        ; $03D0D0 |
  JSL $04AC9C                     ; $03D0D2 |
  SEP #$10                        ; $03D0D6 |
  BRA CODE_03D111                 ; $03D0D8 |

CODE_03D0DA:
  JMP CODE_03D208                 ; $03D0DA |

CODE_03D0DD:
  LDA $7968,y                     ; $03D0DD |
  BPL CODE_03D0E5                 ; $03D0E0 |
  JMP CODE_03D1C4                 ; $03D0E2 |

CODE_03D0E5:
  LDA $60C2                       ; $03D0E5 |
  BEQ CODE_03D0F4                 ; $03D0E8 |
  LDA $7968,y                     ; $03D0EA |
  CLC                             ; $03D0ED |
  ADC #$000C                      ; $03D0EE |
  STA $7968,y                     ; $03D0F1 |

CODE_03D0F4:
  LDA $7968,y                     ; $03D0F4 |
  CMP #$000A                      ; $03D0F7 |
  BCC CODE_03D111                 ; $03D0FA |
  CMP #$0012                      ; $03D0FC |
  BCC CODE_03D10B                 ; $03D0FF |
  REP #$10                        ; $03D101 |
  JSL $04AC9C                     ; $03D103 |
  SEP #$10                        ; $03D107 |
  BRA CODE_03D111                 ; $03D109 |

CODE_03D10B:
  LDA #$0005                      ; $03D10B |
  STA $60C2                       ; $03D10E |

CODE_03D111:
  LDA $60C0                       ; $03D111 |
  BEQ CODE_03D120                 ; $03D114 |
  LDA $6090                       ; $03D116 |
  CLC                             ; $03D119 |
  ADC $72C2,x                     ; $03D11A |
  STA $6090                       ; $03D11D |

CODE_03D120:
  JMP CODE_03D1FB                 ; $03D120 |

; data table
DATA_03D123:         dw $0001
DATA_03D125:         dw $FFFF

; l sub
  STZ $0E                         ; $03D127 |
  LDY $7D36,x                     ; $03D129 |
  BMI CODE_03D130                 ; $03D12C |
  CLC                             ; $03D12E |
  RTL                             ; $03D12F |

CODE_03D130:
  LDA $6122                       ; $03D130 |
  CLC                             ; $03D133 |
  ADC $7BB8,x                     ; $03D134 |
  STA $00                         ; $03D137 |
  CLC                             ; $03D139 |
  ADC $7C18,x                     ; $03D13A |
  STA $08                         ; $03D13D |
  LDA $7C18,x                     ; $03D13F |
  SEC                             ; $03D142 |
  SBC $00                         ; $03D143 |
  STA $0A                         ; $03D145 |
  LDY #$00                        ; $03D147 |
  CLC                             ; $03D149 |
  ADC $08                         ; $03D14A |
  BMI CODE_03D150                 ; $03D14C |
  LDY #$02                        ; $03D14E |

CODE_03D150:
  STY $0C                         ; $03D150 |
  LDA $6120                       ; $03D152 |
  CLC                             ; $03D155 |
  ADC $7BB6,x                     ; $03D156 |
  STA $00                         ; $03D159 |
  CLC                             ; $03D15B |
  ADC $7C16,x                     ; $03D15C |
  STA $02                         ; $03D15F |
  LDA $7C16,x                     ; $03D161 |
  SEC                             ; $03D164 |
  SBC $00                         ; $03D165 |
  STA $04                         ; $03D167 |
  LDY #$00                        ; $03D169 |
  CLC                             ; $03D16B |
  ADC $02                         ; $03D16C |
  BMI CODE_03D172                 ; $03D16E |
  LDY #$02                        ; $03D170 |

CODE_03D172:
  STY $06                         ; $03D172 |
  LDA $7962,y                     ; $03D174 |
  BPL CODE_03D17D                 ; $03D177 |
  EOR #$FFFF                      ; $03D179 |
  INC A                           ; $03D17C |

CODE_03D17D:
  STA $00                         ; $03D17D |
  LDY $0C                         ; $03D17F |
  LDA $7968,y                     ; $03D181 |
  BPL CODE_03D18A                 ; $03D184 |
  EOR #$FFFF                      ; $03D186 |
  INC A                           ; $03D189 |

CODE_03D18A:
  CMP $00                         ; $03D18A |
  BCC CODE_03D191                 ; $03D18C |
  JMP CODE_03D208                 ; $03D18E |

CODE_03D191:
  LDA $7968,y                     ; $03D191 |
  BMI CODE_03D1C4                 ; $03D194 |
  LDA $60C2                       ; $03D196 |
  BEQ CODE_03D1A5                 ; $03D199 |
  LDA $7968,y                     ; $03D19B |
  CLC                             ; $03D19E |
  ADC #$000C                      ; $03D19F |
  STA $7968,y                     ; $03D1A2 |

CODE_03D1A5:
  LDA $7968,y                     ; $03D1A5 |
  CMP #$000A                      ; $03D1A8 |
  BCC CODE_03D1B3                 ; $03D1AB |
  LDA #$0005                      ; $03D1AD |
  STA $60C2                       ; $03D1B0 |

CODE_03D1B3:
  BRA CODE_03D1FB                 ; $03D1B3 |
  LDA $7968,y                     ; $03D1B5 |
  CLC                             ; $03D1B8 |
  ADC $6090                       ; $03D1B9 |
  STA $6090                       ; $03D1BC |
  STZ $60D2                       ; $03D1BF |
  BRA CODE_03D1FB                 ; $03D1C2 |

CODE_03D1C4:
  CMP #$FFF5                      ; $03D1C4 |
  BMI CODE_03D208                 ; $03D1C7 |
  SEC                             ; $03D1C9 |
  ADC $6090                       ; $03D1CA |
  STA $6090                       ; $03D1CD |
  LDA $7182,x                     ; $03D1D0 |
  SEC                             ; $03D1D3 |
  SBC $6EBE                       ; $03D1D4 |
  SEC                             ; $03D1D7 |
  ADC $6090                       ; $03D1D8 |
  STA $6090                       ; $03D1DB |
  LDY $60AB                       ; $03D1DE |
  BMI CODE_03D22B                 ; $03D1E1 |
  LDA $70E2,x                     ; $03D1E3 |
  SEC                             ; $03D1E6 |
  SBC $6EBC                       ; $03D1E7 |
  CLC                             ; $03D1EA |
  ADC $608C                       ; $03D1EB |
  STA $608C                       ; $03D1EE |
  INC $61B4                       ; $03D1F1 |
  INC $0E                         ; $03D1F4 |
  LDA $60AA                       ; $03D1F6 |
  STA $0C                         ; $03D1F9 |

CODE_03D1FB:
  SEC                             ; $03D1FB | entry point from main_flower_vine
  LDA $7222,x                     ; $03D1FC |
  BPL CODE_03D204                 ; $03D1FF |
  LDA #$0000                      ; $03D201 |

CODE_03D204:
  STA $60AA                       ; $03D204 |
  RTL                             ; $03D207 |

CODE_03D208:
  LDX $06                         ; $03D208 |
  LDA $00                         ; $03D20A |
  LSR A                           ; $03D20C |
  BEQ CODE_03D21A                 ; $03D20D |
  LDA $608C                       ; $03D20F |
  CLC                             ; $03D212 |
  ADC $03D123,x                   ; $03D213 |
  STA $608C                       ; $03D217 |

CODE_03D21A:
  LDA $60B4                       ; $03D21A |
  EOR $03D123,x                   ; $03D21D |
  BPL CODE_03D229                 ; $03D221 |
  STZ $60A8                       ; $03D223 |
  STZ $60B4                       ; $03D226 |

CODE_03D229:
  LDX $12                         ; $03D229 |

CODE_03D22B:
  CLC                             ; $03D22B |
  RTL                             ; $03D22C |

; l sub
  LDY $7D36,x                     ; $03D22D |
  BMI CODE_03D233                 ; $03D230 |

CODE_03D232:
  RTL                             ; $03D232 |

CODE_03D233:
  LDA $6090                       ; $03D233 |
  STA $00                         ; $03D236 |
  LDA $7CD8,x                     ; $03D238 |
  SEC                             ; $03D23B |
  SBC $611E                       ; $03D23C |
  SEC                             ; $03D23F |
  SBC $6122                       ; $03D240 |
  SEC                             ; $03D243 |
  SBC $7BB8,x                     ; $03D244 |
  CMP #$FFF6                      ; $03D247 |
  BCC CODE_03D232                 ; $03D24A |
  SEC                             ; $03D24C |
  ADC $6090                       ; $03D24D |
  STA $6090                       ; $03D250 |
  LDA $7182,x                     ; $03D253 |
  SEC                             ; $03D256 |
  SBC $6EBE                       ; $03D257 |
  SEC                             ; $03D25A |
  ADC $6090                       ; $03D25B |
  STA $6090                       ; $03D25E |
  SEC                             ; $03D261 |
  SBC $00                         ; $03D262 |
  CLC                             ; $03D264 |
  ADC $611E                       ; $03D265 |
  STA $611E                       ; $03D268 |
  LDY $60AB                       ; $03D26B |
  BMI CODE_03D232                 ; $03D26E |
  LDA $70E2,x                     ; $03D270 |
  SEC                             ; $03D273 |
  SBC $6EBC                       ; $03D274 |
  CLC                             ; $03D277 |
  ADC $608C                       ; $03D278 |
  STA $608C                       ; $03D27B |
  INC $61B4                       ; $03D27E |
  LDA $7222,x                     ; $03D281 |
  BPL CODE_03D289                 ; $03D284 |
  LDA #$0000                      ; $03D286 |

CODE_03D289:
  STA $60AA                       ; $03D289 |
  RTL                             ; $03D28C |

; data table
DATA_03D28D:         dw $0001
DATA_03D28F:         dw $FFFF

; l sub
  STZ $0E                         ; $03D291 |
  LDA $61B2                       ; $03D293 |
  AND #$C000                      ; $03D296 |
  ORA $61CC                       ; $03D299 |
  BNE CODE_03D2D6                 ; $03D29C |
  LDA $7BB6,x                     ; $03D29E |
  CLC                             ; $03D2A1 |
  ADC $7BB6                       ; $03D2A2 |
  STA $00                         ; $03D2A5 |
  ASL A                           ; $03D2A7 |
  STA $02                         ; $03D2A8 |
  LDA $7CD6,x                     ; $03D2AA |
  SEC                             ; $03D2AD |
  SBC $7CD6                       ; $03D2AE |
  STA $04                         ; $03D2B1 |
  CLC                             ; $03D2B3 |
  ADC $00                         ; $03D2B4 |
  CMP $02                         ; $03D2B6 |
  BCS CODE_03D2D6                 ; $03D2B8 |
  LDA $7BB8,x                     ; $03D2BA |
  CLC                             ; $03D2BD |
  ADC $7BB8                       ; $03D2BE |
  STA $06                         ; $03D2C1 |
  ASL A                           ; $03D2C3 |
  STA $08                         ; $03D2C4 |
  LDA $7CD8,x                     ; $03D2C6 |
  SEC                             ; $03D2C9 |
  SBC $7CD8                       ; $03D2CA |
  STA $0A                         ; $03D2CD |
  CLC                             ; $03D2CF |
  ADC $06                         ; $03D2D0 |
  CMP $08                         ; $03D2D2 |
  BCC CODE_03D2D8                 ; $03D2D4 |

CODE_03D2D6:
  CLC                             ; $03D2D6 |
  RTL                             ; $03D2D7 |

CODE_03D2D8:
  LDA $0A                         ; $03D2D8 |
  CLC                             ; $03D2DA |
  ADC $06                         ; $03D2DB |
  STA $08                         ; $03D2DD |
  LDA $0A                         ; $03D2DF |
  SEC                             ; $03D2E1 |
  SBC $06                         ; $03D2E2 |
  STA $0A                         ; $03D2E4 |
  LDY #$00                        ; $03D2E6 |
  CLC                             ; $03D2E8 |
  ADC $08                         ; $03D2E9 |
  BMI CODE_03D2EF                 ; $03D2EB |
  LDY #$02                        ; $03D2ED |

CODE_03D2EF:
  STY $0C                         ; $03D2EF |
  LDA $04                         ; $03D2F1 |
  CLC                             ; $03D2F3 |
  ADC $00                         ; $03D2F4 |
  STA $02                         ; $03D2F6 |
  LDA $04                         ; $03D2F8 |
  SEC                             ; $03D2FA |
  SBC $00                         ; $03D2FB |
  STA $04                         ; $03D2FD |
  LDY #$00                        ; $03D2FF |
  CLC                             ; $03D301 |
  ADC $02                         ; $03D302 |
  BMI CODE_03D308                 ; $03D304 |
  LDY #$02                        ; $03D306 |

CODE_03D308:
  STY $06                         ; $03D308 |
  LDA $7962,y                     ; $03D30A |
  BPL CODE_03D313                 ; $03D30D |
  EOR #$FFFF                      ; $03D30F |
  INC A                           ; $03D312 |

CODE_03D313:
  STA $00                         ; $03D313 |
  LDY $0C                         ; $03D315 |
  LDA $7968,y                     ; $03D317 |
  BPL CODE_03D320                 ; $03D31A |
  EOR #$FFFF                      ; $03D31C |
  INC A                           ; $03D31F |

CODE_03D320:
  CMP $00                         ; $03D320 |
  BCS CODE_03D339                 ; $03D322 |
  CMP #$0009                      ; $03D324 |
  BCS CODE_03D339                 ; $03D327 |
  LDA $7968,y                     ; $03D329 |
  PHP                             ; $03D32C |
  LDA #$0001                      ; $03D32D |
  PLP                             ; $03D330 |
  BMI CODE_03D334                 ; $03D331 |
  ASL A                           ; $03D333 |

CODE_03D334:
  TSB $7860                       ; $03D334 |
  SEC                             ; $03D337 |
  RTL                             ; $03D338 |

CODE_03D339:
  LDX $06                         ; $03D339 |
  LDA $70E2                       ; $03D33B |
  CLC                             ; $03D33E |
  ADC $03D28D,x                   ; $03D33F |
  STA $70E2                       ; $03D343 |
  LDA $7220                       ; $03D346 |
  EOR $03D28D,x                   ; $03D349 |
  BPL CODE_03D359                 ; $03D34D |
  LDA $7220                       ; $03D34F |
  EOR #$FFFF                      ; $03D352 |
  INC A                           ; $03D355 |
  STA $7220                       ; $03D356 |

CODE_03D359:
  LDX $12                         ; $03D359 |
  CLC                             ; $03D35B |
  RTL                             ; $03D35C |

; l sub
  LDA $6122                       ; $03D35D |
  CLC                             ; $03D360 |
  ADC $7BB8,x                     ; $03D361 |
  STA $00                         ; $03D364 |
  CLC                             ; $03D366 |
  ADC $7C18,x                     ; $03D367 |
  STA $08                         ; $03D36A |
  LDA $7C18,x                     ; $03D36C |
  SEC                             ; $03D36F |
  SBC $00                         ; $03D370 |
  STA $0A                         ; $03D372 |
  LDY #$04                        ; $03D374 |
  CLC                             ; $03D376 |
  ADC $08                         ; $03D377 |
  BMI CODE_03D37D                 ; $03D379 |
  LDY #$06                        ; $03D37B |

CODE_03D37D:
  STY $0C                         ; $03D37D |
  LDA $6120                       ; $03D37F |
  CLC                             ; $03D382 |
  ADC $7BB6,x                     ; $03D383 |
  STA $00                         ; $03D386 |
  CLC                             ; $03D388 |
  ADC $7C16,x                     ; $03D389 |
  STA $02                         ; $03D38C |
  LDA $7C16,x                     ; $03D38E |
  SEC                             ; $03D391 |
  SBC $00                         ; $03D392 |
  STA $04                         ; $03D394 |
  LDY #$00                        ; $03D396 |
  CLC                             ; $03D398 |
  ADC $02                         ; $03D399 |
  BMI CODE_03D39F                 ; $03D39B |
  LDY #$02                        ; $03D39D |

CODE_03D39F:
  STY $06                         ; $03D39F |
  LDA $7962,y                     ; $03D3A1 |
  BPL CODE_03D3AA                 ; $03D3A4 |
  EOR #$FFFF                      ; $03D3A6 |
  INC A                           ; $03D3A9 |

CODE_03D3AA:
  STA $00                         ; $03D3AA |
  LDY $0C                         ; $03D3AC |
  LDA $7964,y                     ; $03D3AE |
  BPL CODE_03D3B7                 ; $03D3B1 |
  EOR #$FFFF                      ; $03D3B3 |
  INC A                           ; $03D3B6 |

CODE_03D3B7:
  CMP $00                         ; $03D3B7 |
  BCS CODE_03D3C0                 ; $03D3B9 |
  CMP #$0008                      ; $03D3BB |
  BCC CODE_03D3C2                 ; $03D3BE |

CODE_03D3C0:
  LDY $06                         ; $03D3C0 |

CODE_03D3C2:
  RTL                             ; $03D3C2 |

; table (data)
DATA_03D3C3:         dw $03C0, $0440
DATA_03D3C7:         dw $04C0, $0540

; table (data)
DATA_03D3CB:         dw $8000, $4000
DATA_03D3CF:         dw $2000, $1000
DATA_03D3D3:         dw $0800, $0400
DATA_03D3D7:         dw $0200, $0100
DATA_03D3DB:         dw $0080, $0040
DATA_03D3DF:         dw $0020, $0010
DATA_03D3E3:         dw $0008, $0004
DATA_03D3E7:         dw $0002, $0001

; l sub - called in many places
  LDA $70E2,x                     ; $03D3EB |
  STA $04                         ; $03D3EE |
  LDA $7182,x                     ; $03D3F0 |
  STA $06                         ; $03D3F3 | entry point
  SEC                             ; $03D3F5 |
  BRA CODE_03D415                 ; $03D3F6 |
  LDA $70E2,x                     ; $03D3F8 | entry point
  STA $04                         ; $03D3FB |
  LDA $7182,x                     ; $03D3FD |
  STA $06                         ; $03D400 |
  LDY #$02                        ; $03D402 |
  BRA CODE_03D412                 ; $03D404 |
  LDA $70E2,x                     ; $03D406 | entry point
  STA $04                         ; $03D409 |
  LDA $7182,x                     ; $03D40B |
  STA $06                         ; $03D40E |
  LDY #$00                        ; $03D410 |

CODE_03D412:
  STY $0E                         ; $03D412 |
  CLC                             ; $03D414 |

CODE_03D415:
  PHP                             ; $03D415 |
  REP #$10                        ; $03D416 |
  PHX                             ; $03D418 |
  LDA $04                         ; $03D419 |
  AND #$00F0                      ; $03D41B |
  LSR A                           ; $03D41E |
  LSR A                           ; $03D41F |
  LSR A                           ; $03D420 |
  TAX                             ; $03D421 |
  LDA $03D3CB,x                   ; $03D422 |
  STA $0C                         ; $03D426 |
  PLX                             ; $03D428 |
  PHX                             ; $03D429 |
  LDA $0150                       ; $03D42A |
  ASL A                           ; $03D42D |
  TAY                             ; $03D42E |
  LDA $06                         ; $03D42F |
  AND #$0700                      ; $03D431 |
  LSR A                           ; $03D434 |
  LSR A                           ; $03D435 |
  LSR A                           ; $03D436 |
  LSR A                           ; $03D437 |
  STA $00                         ; $03D438 |
  LDA $05                         ; $03D43A |
  AND #$000F                      ; $03D43C |
  ORA $00                         ; $03D43F |
  TAX                             ; $03D441 |
  LDA $6CAA,x                     ; $03D442 |
  AND #$003F                      ; $03D445 |
  ASL A                           ; $03D448 |
  TYX                             ; $03D449 |
  CLC                             ; $03D44A |
  ADC $03D3C3,x                   ; $03D44B |
  STA $02                         ; $03D44F |
  LDA ($02)                       ; $03D451 |
  PLX                             ; $03D453 |
  SEP #$10                        ; $03D454 |
  PLP                             ; $03D456 |
  BCS CODE_03D46A                 ; $03D457 |
  AND $0C                         ; $03D459 |
  BEQ CODE_03D469                 ; $03D45B |
  LDY $0E                         ; $03D45D |
  BNE CODE_03D469                 ; $03D45F |
  JSL $03A32E                     ; $03D461 |
  PLY                             ; $03D465 |
  PLA                             ; $03D466 |
  LDY #$02                        ; $03D467 |

CODE_03D469:
  RTL                             ; $03D469 |

CODE_03D46A:
  ORA $0C                         ; $03D46A |
  STA ($02)                       ; $03D46C |
  RTL                             ; $03D46E |

; table of routines for special sprites BEYOND ID 0x1B9
; these sprites are loaders, generators, etc. not true game entities
; table starts from $D46D in code but probably actually begins here
special_sprite_inits:
DATA_03D46F:         dw $D55B, $D55B
DATA_03D473:         dw $D55B, $D55B
DATA_03D477:         dw $D55B, $D55B
DATA_03D47B:         dw $D55B, $D55B
DATA_03D47F:         dw $D55B, $D55B
DATA_03D483:         dw $D55B, $D55B
DATA_03D487:         dw $D55B, $D55B
DATA_03D48B:         dw $D55B, $D55B
DATA_03D48F:         dw $D83D, $D83D
DATA_03D493:         dw $D83D, $D83D
DATA_03D497:         dw $D83D, $D83D
DATA_03D49B:         dw $D83D, $D83D
DATA_03D49F:         dw $D83D, $D83D
DATA_03D4A3:         dw $D83D, $E3B1
DATA_03D4A7:         dw $E2B5, $D9CA
DATA_03D4AB:         dw $DA58, $DA5E
DATA_03D4AF:         dw $DA64, $DA6A
DATA_03D4B3:         dw $DA70, $DB85
DATA_03D4B7:         dw $DA70, $DB85
DATA_03D4BB:         dw $DB8B, $DC2E
DATA_03D4BF:         dw $DC38, $DDA3
DATA_03D4C3:         dw $DDB8, $DDBE
DATA_03D4C7:         dw $DE5A, $DE60
DATA_03D4CB:         dw $DF0C, $DF12
DATA_03D4CF:         dw $DFF0, $DFF6
DATA_03D4D3:         dw $E0AD, $E0B3
DATA_03D4D7:         dw $E124, $E142
DATA_03D4DB:         dw $E1E2, $E2A1
DATA_03D4DF:         dw $E2A7, $E2C6
DATA_03D4E3:         dw $E2CC

; these are the mains for the "special" sprites
; table once again starts from $D4E3 in code so requires +2
special_sprite_mains:
DATA_03D4E5:         dw $D615, $D615
DATA_03D4E9:         dw $D615, $D615
DATA_03D4ED:         dw $D615, $D615
DATA_03D4F1:         dw $D615, $D615
DATA_03D4F5:         dw $D615, $D615
DATA_03D4F9:         dw $D615, $D615
DATA_03D4FD:         dw $D615, $D615
DATA_03D501:         dw $D615, $D615
DATA_03D505:         dw $D8D7, $D8D7
DATA_03D509:         dw $D8D7, $D8D7
DATA_03D50D:         dw $D8D7, $D8D7
DATA_03D511:         dw $D8D7, $D8D7
DATA_03D515:         dw $D8D7, $D8D7
DATA_03D519:         dw $D8D7, $A79B
DATA_03D51D:         dw $A79B, $D9E6
DATA_03D521:         dw $A79B, $A79B
DATA_03D525:         dw $A79B, $A79B
DATA_03D529:         dw $DA80, $A79B
DATA_03D52D:         dw $DAEB, $A79B
DATA_03D531:         dw $DBB7, $A79B
DATA_03D535:         dw $DCEC, $A79B
DATA_03D539:         dw $A79B, $DDDA
DATA_03D53D:         dw $A79B, $DE94
DATA_03D541:         dw $A79B, $DF2E
DATA_03D545:         dw $A79B, $E002
DATA_03D549:         dw $A79B, $E0BF
DATA_03D54D:         dw $A79B, $E190
DATA_03D551:         dw $E1FB, $A79B
DATA_03D555:         dw $A79B, $A79B
DATA_03D559:         dw $E30E

; inits palette changer special sprite
init_palette_spr:
  LDA $7960                       ; $03D55B |
  LSR A                           ; $03D55E |
  BCS CODE_03D57E                 ; $03D55F |
  LDA $0C04,y                     ; $03D561 |
  SEC                             ; $03D564 |
  SBC #$0001                      ; $03D565 |
  CMP $0136                       ; $03D568 |
  BNE CODE_03D570                 ; $03D56B |
  JMP CODE_03D62C                 ; $03D56D |

CODE_03D570:
  STA $0136                       ; $03D570 |
  JSL $03D5E4                     ; $03D573 |
  STZ $0C14                       ; $03D577 |
  STZ $0C16                       ; $03D57A |
  RTS                             ; $03D57D |

CODE_03D57E:
  LDA $0C04,y                     ; $03D57E |
  SEC                             ; $03D581 |
  SBC #$0001                      ; $03D582 |
  CMP $0138                       ; $03D585 |
  BEQ CODE_03D5E1                 ; $03D588 |
  STA $0138                       ; $03D58A |
  ASL A                           ; $03D58D |
  TAX                             ; $03D58E |
  LDA $00B874,x                   ; $03D58F |
  TAX                             ; $03D593 |
  PHY                             ; $03D594 |
  PHB                             ; $03D595 |
  PEA $7020                       ; $03D596 |
  PLB                             ; $03D599 |
  PLB                             ; $03D59A |
  LDY #$001C                      ; $03D59B |

CODE_03D59E:
  LDA $5FA01C,x                   ; $03D59E |
  STA $2082,y                     ; $03D5A2 |
  STA $2DEE,y                     ; $03D5A5 |
  LDA $5FA03A,x                   ; $03D5A8 |
  STA $20A2,y                     ; $03D5AC |
  STA $2E0E,y                     ; $03D5AF |
  DEX                             ; $03D5B2 |
  DEX                             ; $03D5B3 |
  DEY                             ; $03D5B4 |
  DEY                             ; $03D5B5 |
  BPL CODE_03D59E                 ; $03D5B6 |
  LDY #$0006                      ; $03D5B8 |

CODE_03D5BB:
  LDA $5FA060,x                   ; $03D5BB |
  STA $2038,y                     ; $03D5BF |
  STA $2DA4,y                     ; $03D5C2 |
  LDA $5FA068,x                   ; $03D5C5 |
  STA $2058,y                     ; $03D5C9 |
  STA $2DC4,y                     ; $03D5CC |
  LDA $5FA070,x                   ; $03D5CF |
  STA $2078,y                     ; $03D5D3 |
  STA $2DE4,y                     ; $03D5D6 |
  DEX                             ; $03D5D9 |
  DEX                             ; $03D5DA |
  DEY                             ; $03D5DB |
  DEY                             ; $03D5DC |
  BPL CODE_03D5BB                 ; $03D5DD |
  PLB                             ; $03D5DF |
  PLY                             ; $03D5E0 |

CODE_03D5E1:
  JMP CODE_03D62C                 ; $03D5E1 |

; l sub
  PHX                             ; $03D5E4 |
  PHY                             ; $03D5E5 |
  PHP                             ; $03D5E6 |
  REP #$20                        ; $03D5E7 |
  SEP #$10                        ; $03D5E9 |
  LDX #$5C                        ; $03D5EB |

CODE_03D5ED:
  LDA $6F00,x                     ; $03D5ED |
  BEQ CODE_03D5FF                 ; $03D5F0 | active sprites
  JSL $03AF0D                     ; $03D5F2 |
  LDA $7402,x                     ; $03D5F6 |
  AND #$00FF                      ; $03D5F9 |
  STA $7402,x                     ; $03D5FC |

CODE_03D5FF:
  DEX                             ; $03D5FF |
  DEX                             ; $03D600 |
  DEX                             ; $03D601 |
  DEX                             ; $03D602 |
  BPL CODE_03D5ED                 ; $03D603 |
  LDA #$FFFF                      ; $03D605 |
  STA $7ECC                       ; $03D608 |
  PLP                             ; $03D60B |
  PLY                             ; $03D60C |
  PLX                             ; $03D60D |
  RTL                             ; $03D60E |

; table (data)
DATA_03D60F:         dw $0000, $0800
DATA_03D613:         dw $7000

; main routine for special sprite palette changer
main_palette_spr:
  PHY                             ; $03D615 |
  LDA #$0800                      ; $03D616 |
  STA $00                         ; $03D619 |
  LDA $0C16                       ; $03D61B |
  BNE CODE_03D66A                 ; $03D61E |
  LDA $0C14                       ; $03D620 |
  CMP #$0003                      ; $03D623 |
  BNE CODE_03D640                 ; $03D626 |
  PLY                             ; $03D628 |
  STZ $7ECC                       ; $03D629 |
; gets rid of a special sprite
remove_special_spr:

CODE_03D62C:
  SEP #$30                        ; $03D62C |
  LDX $0C0C,y                     ; $03D62E |
  LDA #$00                        ; $03D631 |
  STA $7028CA,x                   ; $03D633 |
  REP #$30                        ; $03D637 |

CODE_03D639:
  LDA #$0000                      ; $03D639 | -- entry point
  STA $0C04,y                     ; $03D63C | sets ID to 0 effectively removing it
  RTS                             ; $03D63F |

; continues on with palette sprite
CODE_03D640:
  ASL A                           ; $03D640 |
  TAX                             ; $03D641 |
  LDA $D60F,x                     ; $03D642 |
  STA $0C18                       ; $03D645 |
  LDA #$6800                      ; $03D648 |
  STA $0C1A                       ; $03D64B |
  LDA $0136                       ; $03D64E |
  ASL A                           ; $03D651 |
  ADC $0136                       ; $03D652 |
  ADC $0C14                       ; $03D655 |
  TAX                             ; $03D658 |
  LDA $00AF39,x                   ; $03D659 |
  AND #$00FF                      ; $03D65D |
  JSL $00B753                     ; $03D660 | decompress LC_LZ1
  STA $0C16                       ; $03D664 |
  INC $0C14                       ; $03D667 |

CODE_03D66A:
  SEC                             ; $03D66A |
  SBC #$0800                      ; $03D66B |
  BCS CODE_03D678                 ; $03D66E |
  ADC #$0800                      ; $03D670 |
  STA $00                         ; $03D673 |
  LDA #$0000                      ; $03D675 |

CODE_03D678:
  STA $0C16                       ; $03D678 |
  LDX $0C1A                       ; $03D67B |
  TXA                             ; $03D67E |
  CLC                             ; $03D67F |
  ADC $00                         ; $03D680 |
  STA $0C1A                       ; $03D682 |
  LDA #$0070                      ; $03D685 |
  STA $0001                       ; $03D688 |
  LDY $0C18                       ; $03D68B |
  LDA $00                         ; $03D68E |
  JSL $00BEA6                     ; $03D690 |
  LDA $00                         ; $03D694 |
  LSR A                           ; $03D696 |
  CLC                             ; $03D697 |
  ADC $0C18                       ; $03D698 |
  STA $0C18                       ; $03D69B |
  PLY                             ; $03D69E |
  RTS                             ; $03D69F |

main_autoscrolls:
  PHB                             ; $03D6A0 |
  PHK                             ; $03D6A1 |
  PLB                             ; $03D6A2 |
  LDA $0C1C                       ; $03D6A3 |
  ASL A                           ; $03D6A6 |
  TAX                             ; $03D6A7 |
  JSR ($D4E3,x)                   ; $03D6A8 | will call the autoscroll main
  PLB                             ; $03D6AB |
  RTL                             ; $03D6AC |

; data table - these are offsets into the table below
autoscroller_indices:
DATA_03D6AD:         dw $0000, $000D
DATA_03D6B1:         dw $0028, $008C
DATA_03D6B5:         dw $00AF, $003E
DATA_03D6B9:         dw $0090, $00BC
DATA_03D6BD:         dw $00F0, $00F7
DATA_03D6C1:         dw $012E, $0138

; this is a table of autoscroller data
; it is split up by each autoscroll section in the game
; the structure is as follows:
; 3-byte chunks representing each checkpoint
; until it hits FE or FF, then entire section stops
; byte 1 = checkpoint X tile value (x / 16)
; byte 2 = checkpoint Y tile value (y / 16)
; byte 3 = camera speed
autoscroller_values:
; autoscroller $1CA - 6-8 kamek section
DATA_03D6C5:         db $20, $00, $04, $30
DATA_03D6C9:         db $00, $04, $40, $00
DATA_03D6CD:         db $04, $80, $00, $04
DATA_03D6D1:         db $FF

; autoscroller $1CB - begin 1-5
DATA_03D6D2:         db $6E, $60, $06
DATA_03D6D5:         db $63, $6A, $08, $5B
DATA_03D6D9:         db $6C, $08, $3C, $6C
DATA_03D6DD:         db $06, $1E, $6C, $05
DATA_03D6E1:         db $16, $69, $05, $10
DATA_03D6E5:         db $65, $05, $0C, $60
DATA_03D6E9:         db $05, $09, $57, $05
; autoscroller $1CC (midring section starts from here)
DATA_03D6ED:         db $0A, $4D, $05, $10
DATA_03D6F1:         db $45, $05, $1A, $36
DATA_03D6F5:         db $05, $21, $2D, $05
DATA_03D6F9:         db $30, $2B, $08, $40
DATA_03D6FD:         db $2E, $06, $50, $2F
DATA_03D701:         db $05, $FF

; autoscroller $1CF - begin 6-5 first screen
DATA_03D703:         db $0B, $30
DATA_03D705:         db $08, $13, $36, $08
DATA_03D709:         db $1B, $37, $08, $23
DATA_03D70D:         db $39, $08, $2A, $3B
DATA_03D711:         db $08, $41, $3D, $08
DATA_03D715:         db $4B, $3E, $08, $60
DATA_03D719:         db $4A, $08, $64, $52
DATA_03D71D:         db $08, $66, $5D, $08
DATA_03D721:         db $6E, $61, $08, $71
DATA_03D725:         db $67, $08, $6E, $6D
DATA_03D729:         db $08, $64, $70, $08
DATA_03D72D:         db $54, $70, $06, $4B
DATA_03D731:         db $70, $04, $46, $68
DATA_03D735:         db $04, $41, $5E, $04
DATA_03D739:         db $41, $53, $04, $43
DATA_03D73D:         db $4D, $04, $48, $4B
DATA_03D741:         db $06, $51, $4C, $08
DATA_03D745:         db $61, $51, $08, $70
DATA_03D749:         db $55, $08, $82, $58
DATA_03D74D:         db $06, $8B, $59, $04
; autoscroller $1CD (reentering door starts here)
DATA_03D751:         db $A0, $59, $08, $FF

; autoscroller $1D0 - 6-5 second screen
DATA_03D755:         db $11, $5C, $10, $18
DATA_03D759:         db $5C, $18, $1F, $5D
DATA_03D75D:         db $20, $23, $5F, $1D
DATA_03D761:         db $30, $62, $14, $50
DATA_03D765:         db $69, $12, $71, $6A
DATA_03D769:         db $12, $8F, $64, $12
DATA_03D76D:         db $AA, $5F, $12, $E0
DATA_03D771:         db $5F, $15, $FF

; autoscroller $1CE - 6-5 bonus door room
DATA_03D774:         db $10
DATA_03D775:         db $70, $05, $40, $70
DATA_03D779:         db $07, $70, $70, $09
DATA_03D77D:         db $A0, $70, $0B, $FF

; autoscroller $1D1 - 5-6 first screen
DATA_03D781:         db $1A, $50, $05, $20
DATA_03D785:         db $4E, $05, $2C, $50
DATA_03D789:         db $05, $39, $4E, $05
DATA_03D78D:         db $42, $4A, $05, $4D
DATA_03D791:         db $49, $05, $58, $48
DATA_03D795:         db $05, $63, $4B, $05
DATA_03D799:         db $6E, $4E, $05, $7E
DATA_03D79D:         db $4A, $05, $8A, $47
DATA_03D7A1:         db $05, $95, $44, $05
DATA_03D7A5:         db $A2, $43, $05, $AE
DATA_03D7A9:         db $41, $05, $B9, $3F
DATA_03D7AD:         db $05, $C0, $3E, $05
DATA_03D7B1:         db $E0, $3E, $05, $FF

; autoscroller $1D2 - unsure
DATA_03D7B5:         db $02, $20, $02, $02
DATA_03D7B9:         db $19, $03, $FE

; autoscroller $1D3 - door 3 tap tap section
DATA_03D7BC:         db $CB
DATA_03D7BD:         db $5A, $06, $C0, $5D
DATA_03D7C1:         db $08, $B0, $5F, $08
DATA_03D7C5:         db $AA, $5D, $08, $A6
DATA_03D7C9:         db $5F, $08, $98, $6C
DATA_03D7CD:         db $08, $88, $6E, $08
DATA_03D7D1:         db $80, $67, $06, $79
DATA_03D7D5:         db $60, $08, $6B, $60
DATA_03D7D9:         db $08, $4B, $5A, $08
DATA_03D7DD:         db $40, $5D, $08, $30
DATA_03D7E1:         db $5F, $08, $2A, $5D
DATA_03D7E5:         db $08, $26, $5F, $08
DATA_03D7E9:         db $18, $6C, $08, $08
DATA_03D7ED:         db $6E, $08, $00, $67
DATA_03D7F1:         db $08, $FE

; autoscroller $1D4 - 1-E
DATA_03D7F3:         db $20, $6F
DATA_03D7F5:         db $08, $80, $6F, $08
DATA_03D7F9:         db $D8, $6F, $08, $FF

; autoscroller $1D5 - unused in game?
DATA_03D7FD:         db $0C, $70, $08, $14
DATA_03D801:         db $6E, $08, $1E, $70
DATA_03D805:         db $08, $2A, $6A, $08
DATA_03D809:         db $2E, $6A, $08, $3B
DATA_03D80D:         db $70, $08, $53, $70
DATA_03D811:         db $0A, $71, $70, $0A
DATA_03D815:         db $8F, $70, $08, $98
DATA_03D819:         db $67, $04, $8F, $5B
DATA_03D81D:         db $06, $90, $2E, $03
DATA_03D821:         db $94, $2C, $08, $9D
DATA_03D825:         db $2C, $08, $A6, $2C
DATA_03D829:         db $08, $AD, $2F, $0A
DATA_03D82D:         db $B6, $36, $08, $CA
DATA_03D831:         db $36, $08, $D4, $3A
DATA_03D835:         db $04, $E2, $43, $08
DATA_03D839:         db $F0, $3F, $08, $FF

init_autoscroller:
  LDA $0C1C                       ; $03D83D |\
  BEQ CODE_03D845                 ; $03D840 | | if there's already an active autoscroller,
  JMP CODE_03D639                 ; $03D842 |/  remove this one

CODE_03D845:
  LDA $0C04,y                     ; $03D845 |\
  STA $0C1C                       ; $03D848 | |  store autoscroll sprite ID
  STA $0C1E                       ; $03D84B |/
  CMP #$001B                      ; $03D84E |\
  BEQ CODE_03D85B                 ; $03D851 | | 6-8 & 1-E
  CMP #$0011                      ; $03D853 | | do not use $0C20
  BEQ CODE_03D85B                 ; $03D856 | | likely a boolean for Y autoscroll
  STA $0C20                       ; $03D858 |/

CODE_03D85B:
  SEC                             ; $03D85B |
  SBC #$0011                      ; $03D85C |
  ASL A                           ; $03D85F |
  TAX                             ; $03D860 |
  LDA $D6AD,x                     ; $03D861 |  loads offset into autoscroll data based on section #
  STA $0C2E                       ; $03D864 |
  JSR CODE_03D639                 ; $03D867 |
  LDA $6093                       ; $03D86A |
  AND #$FF00                      ; $03D86D |
  STA $0C22                       ; $03D870 |
  LDA $6095                       ; $03D873 |
  AND #$00FF                      ; $03D876 |
  STA $0C24                       ; $03D879 |
  LDA $609B                       ; $03D87C |
  AND #$FF00                      ; $03D87F |
  STA $0C26                       ; $03D882 |
  LDA $609D                       ; $03D885 |
  AND #$00FF                      ; $03D888 |
  STA $0C28                       ; $03D88B |
  STZ $0C2A                       ; $03D88E |
  STZ $0C2C                       ; $03D891 |
  LDX $0C2E                       ; $03D894 |

CODE_03D897:
  LDA $D6C5,x                     ; $03D897 |\  -- also entry point
  AND #$00FF                      ; $03D89A | | loads first byte of checkpoint at current position
  ASL A                           ; $03D89D | | byte 1: checkpoint x tile coordinate of camera
  ASL A                           ; $03D89E | |
  ASL A                           ; $03D89F | |
  ASL A                           ; $03D8A0 | | multiplies by 16 to get to world coords
  STA $0C30                       ; $03D8A1 | | stores in first memory slot ($03C0)
  SEC                             ; $03D8A4 | |
  SBC $0C23                       ; $03D8A5 | | middle 16 bits (ignores subpixel) of current camera x
  STA $0C36                       ; $03D8A8 |/  keeps checkpoint x - current x in $0C36
  LDA $D6C6,x                     ; $03D8AB |\
  AND #$00FF                      ; $03D8AE | | loads next byte of checkpoint at current position
  ASL A                           ; $03D8B1 | | byte 2: checkpoint y tile coordinate of camera
  ASL A                           ; $03D8B2 | |
  ASL A                           ; $03D8B3 | |
  ASL A                           ; $03D8B4 | | multiplies by 16 to get to world coords
  CLC                             ; $03D8B5 | |
  ADC #$001C                      ; $03D8B6 | | then adds $1C
  STA $0C32                       ; $03D8B9 | | stores 16-bit result in next memory location ($0C32)
  SEC                             ; $03D8BC | |
  SBC $0C27                       ; $03D8BD | | middle 16 bits (ignores subpixel) of current camera y
  STA $0C38                       ; $03D8C0 |/  keeps checkpoint y - current y in $0C38
  LDA $D6C6,x                     ; $03D8C3 |\
  AND #$FF00                      ; $03D8C6 | | loads next byte from table at current position (byte 3: speed in tiles per second?)
  BPL CODE_03D8CE                 ; $03D8C9 | | if speed is negative
  ORA #$00FF                      ; $03D8CB | | retain by padding FF on the beginning

CODE_03D8CE:
  XBA                             ; $03D8CE | | (swapping accumulator to put it in the correct order)
  ASL A                           ; $03D8CF | |
  ASL A                           ; $03D8D0 | |
  ASL A                           ; $03D8D1 | |
  ASL A                           ; $03D8D2 | | multiplies by 16, meaning pixels per second(?)
  STA $0C34                       ; $03D8D3 |/  stores 16-bit result in next memory location ($0C34)
  RTS                             ; $03D8D6 |

main_autoscroller:
  LDA $61B0                       ; $03D8D7 |
  ORA $0B55                       ; $03D8DA |
  ORA $0398                       ; $03D8DD |
  BNE CODE_03D93D                 ; $03D8E0 |
  JSR CODE_03D942                 ; $03D8E2 |
  LDA $0C23                       ; $03D8E5 |
  SEC                             ; $03D8E8 |
  SBC $0C30                       ; $03D8E9 |
  BEQ CODE_03D8F9                 ; $03D8EC |
  EOR $0C36                       ; $03D8EE |
  BMI CODE_03D8F9                 ; $03D8F1 |
  LDA $0C30                       ; $03D8F3 |
  STA $0C23                       ; $03D8F6 |

CODE_03D8F9:
  STA $0000                       ; $03D8F9 |
  LDA $0C27                       ; $03D8FC |
  SEC                             ; $03D8FF |
  SBC $0C32                       ; $03D900 |
  BEQ CODE_03D910                 ; $03D903 |
  EOR $0C38                       ; $03D905 |
  BMI CODE_03D910                 ; $03D908 |
  LDA $0C32                       ; $03D90A |
  STA $0C27                       ; $03D90D |

CODE_03D910:
  ORA $0000                       ; $03D910 |
  BMI CODE_03D93D                 ; $03D913 |
  LDX $0C2E                       ; $03D915 |
  LDA $D6C8,x                     ; $03D918 |\
  AND #$00FF                      ; $03D91B | | checks next checkpoint
  CMP #$00FE                      ; $03D91E | | if FE or FF, jump down to end autoscrolling
  BCS CODE_03D92C                 ; $03D921 |/
  INX                             ; $03D923 |\
  INX                             ; $03D924 | |
  INX                             ; $03D925 | | moves up 3 into autoscroll table (next checkpoint)
  STX $0C2E                       ; $03D926 | | then reinitializes auto-scroll with new checkpoint
  JMP CODE_03D897                 ; $03D929 |/

CODE_03D92C:
  BNE CODE_03D934                 ; $03D92C |\  if FE or FF, done with this autoscroll section
  STZ $0C1E                       ; $03D92E | | - FE: also clears another special flag
  STZ $0C20                       ; $03D931 | | and camera Y flag

CODE_03D934:
  STZ $0C1C                       ; $03D934 | | - FF & FE: clear autoscroll values
  STZ $0C2A                       ; $03D937 | | effectively stopping the autoscroll
  STZ $0C2C                       ; $03D93A |/

CODE_03D93D:
  RTS                             ; $03D93D |

; data (-1 and 1)
DATA_03D93E:         dw $FFFF, $0001

; sub
CODE_03D942:
  LDA $0C30                       ; $03D942 |
  STA $3002                       ; $03D945 |
  LDA $0C32                       ; $03D948 |
  STA $3004                       ; $03D94B |
  LDA $0C23                       ; $03D94E |
  STA $3006                       ; $03D951 |
  LDA $0C27                       ; $03D954 |
  STA $3008                       ; $03D957 |
  LDA $0C34                       ; $03D95A |
  STA $300C                       ; $03D95D |
  SEP #$10                        ; $03D960 |
  LDX #$09                        ; $03D962 | SFX program bank
  LDA #$907C                      ; $03D964 | SFX program counter
  JSL $7EDE44                     ; $03D967 |
  LDX #$00                        ; $03D96B |
  LDA $0C2A                       ; $03D96D |
  CMP $3002                       ; $03D970 |
  BEQ CODE_03D980                 ; $03D973 |
  BPL CODE_03D979                 ; $03D975 |
  LDX #$02                        ; $03D977 |

CODE_03D979:
  CLC                             ; $03D979 |
  ADC $D93E,x                     ; $03D97A | add 1 or -1 to x velocity (dampening value)
  STA $0C2A                       ; $03D97D |

CODE_03D980:
  LDX #$00                        ; $03D980 |
  LDA $0C2C                       ; $03D982 |
  CMP $3004                       ; $03D985 |
  BEQ CODE_03D995                 ; $03D988 |
  BPL CODE_03D98E                 ; $03D98A |
  LDX #$02                        ; $03D98C |

CODE_03D98E:
  CLC                             ; $03D98E |
  ADC $D93E,x                     ; $03D98F | add 1 or -1 to y velocity (dampening value)
  STA $0C2C                       ; $03D992 |

CODE_03D995:
  REP #$10                        ; $03D995 |

CODE_03D997:
  LDX #$0000                      ; $03D997 |\  -- entry point
  LDA $0C2A                       ; $03D99A | | if velocity is negative
  BPL CODE_03D9A0                 ; $03D99D | | carry bit works other way around
  DEX                             ; $03D99F |/  so subtract 1 for high 16 bits

CODE_03D9A0:
  CLC                             ; $03D9A0 |\
  ADC $0C22                       ; $03D9A1 | |
  STA $0C22                       ; $03D9A4 | | add x velocity
  TXA                             ; $03D9A7 | | 32-bit result
  ADC $0C24                       ; $03D9A8 | | retains carry on second add
  STA $0C24                       ; $03D9AB |/
  LDX #$0000                      ; $03D9AE |\
  LDA $0C2C                       ; $03D9B1 | | if velocity is negative
  BPL CODE_03D9B7                 ; $03D9B4 | | carry bit works other way around
  DEX                             ; $03D9B6 |/  so subtract 1 for high 16 bits

CODE_03D9B7:
  CLC                             ; $03D9B7 |\
  ADC $0C26                       ; $03D9B8 | |
  STA $0C26                       ; $03D9BB | | add y velocity
  TXA                             ; $03D9BE | | 32-bit result
  ADC $0C28                       ; $03D9BF | | retains carry on second add
  STA $0C28                       ; $03D9C2 |/
  RTS                             ; $03D9C5 |

; l sub
  JSR CODE_03D997                 ; $03D9C6 |
  RTL                             ; $03D9C9 |

init_gusty_gen:
  LDA $0C3A                       ; $03D9CA | if gusty generator flag
  BEQ CODE_03D9D2                 ; $03D9CD | is off
  JMP CODE_03D62C                 ; $03D9CF |

CODE_03D9D2:
  INC $0C3A                       ; $03D9D2 | turn gusty generator flag on
  RTS                             ; $03D9D5 |

; table (data)
DATA_03D9D6:         dw $0110, $FFE0
DATA_03D9DA:         dw $FE00, $0200
DATA_03D9DE:         dw $FD00, $0300
DATA_03D9E2:         dw $0004, $0006

main_gusty_gen:
  LDA $0C3A                       ; $03D9E6 |
  BNE CODE_03D9EE                 ; $03D9E9 |
  JMP CODE_03D62C                 ; $03D9EB |

CODE_03D9EE:
  LDA $61B0                       ; $03D9EE |
  ORA $0B55                       ; $03D9F1 |
  ORA $0398                       ; $03D9F4 |
  BNE CODE_03DA57                 ; $03D9F7 | if the game is inactive
  LDA $0CD2                       ; $03D9F9 |
  BNE CODE_03DA57                 ; $03D9FC |
  LDA #$0030                      ; $03D9FE |
  STA $0CD2                       ; $03DA01 |
  SEP #$10                        ; $03DA04 |
  PHY                             ; $03DA06 |
  LDA #$00E6                      ; $03DA07 | spawn gusty
  JSL $03A364                     ; $03DA0A |
  BCC CODE_03DA54                 ; $03DA0E |
  LDA $10                         ; $03DA10 |
  AND #$001E                      ; $03DA12 |
  ASL A                           ; $03DA15 |
  ASL A                           ; $03DA16 |
  ASL A                           ; $03DA17 |
  CLC                             ; $03DA18 |
  ADC $003B                       ; $03DA19 |
  SEC                             ; $03DA1C |
  SBC #$001B                      ; $03DA1D |
  STA $7182,y                     ; $03DA20 |
  LDA $10                         ; $03DA23 |
  AND #$0001                      ; $03DA25 |
  ASL A                           ; $03DA28 |
  STA $7400,y                     ; $03DA29 |
  STA $00                         ; $03DA2C |
  TAX                             ; $03DA2E |
  LDA $0039                       ; $03DA2F |
  CLC                             ; $03DA32 |
  ADC $D9D6,x                     ; $03DA33 |
  STA $70E2,y                     ; $03DA36 |
  LDA $10                         ; $03DA39 |
  AND #$0002                      ; $03DA3B |
  STA $79D8,y                     ; $03DA3E |
  TAX                             ; $03DA41 |
  LDA $D9E2,x                     ; $03DA42 |
  STA $7540,y                     ; $03DA45 |
  TXA                             ; $03DA48 |
  ASL A                           ; $03DA49 |
  CLC                             ; $03DA4A |
  ADC $00                         ; $03DA4B |
  TAX                             ; $03DA4D |
  LDA $D9DA,x                     ; $03DA4E |
  STA $75E0,y                     ; $03DA51 |

CODE_03DA54:
  PLY                             ; $03DA54 |
  REP #$10                        ; $03DA55 |

CODE_03DA57:
  RTS                             ; $03DA57 |

init_gusty_stop:
  STZ $0C3A                       ; $03DA58 | turn off gusty gen flag
  JMP CODE_03D62C                 ; $03DA5B |

init_lakitu_stop:
  STZ $0C3C                       ; $03DA5E | turn off lakitu flag
  JMP CODE_03D62C                 ; $03DA61 |

init_fuzzy_stop:
  STZ $0C3E                       ; $03DA64 | turn off fuzzy gen flag
  JMP CODE_03D62C                 ; $03DA67 |

init_unknown_stop:
  STZ $0C46                       ; $03DA6A | turn off unknown gen flag
  JMP CODE_03D62C                 ; $03DA6D |

init_bat_gen:
  LDA $0C48                       ; $03DA70 | if bat gen flag
  BEQ CODE_03DA78                 ; $03DA73 | is off
  JMP CODE_03D62C                 ; $03DA75 |

CODE_03DA78:
  INC $0C48                       ; $03DA78 | turn on bat gen flag
  RTS                             ; $03DA7B |

; data
DATA_03DA7C:         dw $0110, $FFE0

main_bat_gen_r:
  LDA $0C48                       ; $03DA80 |
  BNE CODE_03DA88                 ; $03DA83 |
  JMP CODE_03D62C                 ; $03DA85 |

CODE_03DA88:
  LDA $61B0                       ; $03DA88 |
  ORA $0B55                       ; $03DA8B |
  ORA $0398                       ; $03DA8E |
  BNE CODE_03DAEA                 ; $03DA91 |
  LDA $0CD4                       ; $03DA93 |
  BNE CODE_03DAEA                 ; $03DA96 |
  LDA $0C4A                       ; $03DA98 |
  CMP #$0003                      ; $03DA9B |
  BCS CODE_03DAEA                 ; $03DA9E |
  LDA #$0030                      ; $03DAA0 |
  STA $0CD4                       ; $03DAA3 |
  SEP #$10                        ; $03DAA6 |
  PHY                             ; $03DAA8 |
  LDA #$013E                      ; $03DAA9 |
  JSL $03A364                     ; $03DAAC |
  BCC CODE_03DAE7                 ; $03DAB0 |
  INC $0C4A                       ; $03DAB2 |
  LDA $10                         ; $03DAB5 |
  AND #$000E                      ; $03DAB7 |
  ASL A                           ; $03DABA |
  ASL A                           ; $03DABB |
  ASL A                           ; $03DABC |
  CLC                             ; $03DABD |
  ADC $003B                       ; $03DABE |
  CLC                             ; $03DAC1 |
  ADC #$0030                      ; $03DAC2 |
  STA $7182,y                     ; $03DAC5 |
  LDA $0073                       ; $03DAC8 |
  STA $7400,y                     ; $03DACB |
  TAX                             ; $03DACE |
  LDA $0039                       ; $03DACF |
  CLC                             ; $03DAD2 |
  ADC $DA7C,x                     ; $03DAD3 |
  STA $70E2,y                     ; $03DAD6 |
  PHB                             ; $03DAD9 |
  LDX #$07                        ; $03DADA |
  PHX                             ; $03DADC |
  PLB                             ; $03DADD |
  TYX                             ; $03DADE |
  JSL $07B1B6                     ; $03DADF |
  PLB                             ; $03DAE3 |
  INC $7A36,x                     ; $03DAE4 |

CODE_03DAE7:
  PLY                             ; $03DAE7 |
  REP #$10                        ; $03DAE8 |

CODE_03DAEA:
  RTS                             ; $03DAEA |

; bat generator on both sides
main_bat_gen_rl:
  LDA $0C48                       ; $03DAEB |
  BNE CODE_03DAF3                 ; $03DAEE |
  JMP CODE_03D62C                 ; $03DAF0 |

CODE_03DAF3:
  LDA $61B0                       ; $03DAF3 |
  ORA $0B55                       ; $03DAF6 |
  ORA $0398                       ; $03DAF9 |
  BNE CODE_03DAEA                 ; $03DAFC |
  LDA $0CD4                       ; $03DAFE |
  BNE CODE_03DAEA                 ; $03DB01 |
  LDA #$0003                      ; $03DB03 |
  STA $00                         ; $03DB06 |
  LDA $021A                       ; $03DB08 |
  CMP #$000F                      ; $03DB0B |
  BNE CODE_03DB30                 ; $03DB0E |
  SEP #$10                        ; $03DB10 |
  LDX #$09                        ; $03DB12 |
  LDA #$91D5                      ; $03DB14 |
  JSL $7EDE44                     ; $03DB17 | GSU init
  LDX $12                         ; $03DB1B |
  REP #$10                        ; $03DB1D |
  LDA $300C                       ; $03DB1F |
  CMP #$0003                      ; $03DB22 |
  BCC CODE_03DB30                 ; $03DB25 |
  DEC $00                         ; $03DB27 |
  CMP #$0005                      ; $03DB29 |
  BCC CODE_03DB30                 ; $03DB2C |
  DEC $00                         ; $03DB2E |

CODE_03DB30:
  LDA $0C4A                       ; $03DB30 |
  CMP $00                         ; $03DB33 |
  BCS CODE_03DB84                 ; $03DB35 |
  LDA #$0030                      ; $03DB37 |
  STA $0CD4                       ; $03DB3A |
  SEP #$10                        ; $03DB3D |
  PHY                             ; $03DB3F |
  LDA #$013E                      ; $03DB40 |
  JSL $03A364                     ; $03DB43 |
  BCC CODE_03DB81                 ; $03DB47 |
  INC $0C4A                       ; $03DB49 |
  LDA $10                         ; $03DB4C |
  AND #$000E                      ; $03DB4E |
  ASL A                           ; $03DB51 |
  ASL A                           ; $03DB52 |
  ASL A                           ; $03DB53 |
  CLC                             ; $03DB54 |
  ADC $003B                       ; $03DB55 |
  CLC                             ; $03DB58 |
  ADC #$0030                      ; $03DB59 |
  STA $7182,y                     ; $03DB5C |
  LDA $10                         ; $03DB5F |
  AND #$0001                      ; $03DB61 |
  ASL A                           ; $03DB64 |
  STA $7400,y                     ; $03DB65 |
  TAX                             ; $03DB68 |
  LDA $0039                       ; $03DB69 |
  CLC                             ; $03DB6C |
  ADC $DA7C,x                     ; $03DB6D |
  STA $70E2,y                     ; $03DB70 |
  PHB                             ; $03DB73 |
  LDX #$07                        ; $03DB74 |
  PHX                             ; $03DB76 |
  PLB                             ; $03DB77 |
  TYX                             ; $03DB78 |
  JSL $07B1B6                     ; $03DB79 |
  PLB                             ; $03DB7D |
  INC $7A36,x                     ; $03DB7E |

CODE_03DB81:
  PLY                             ; $03DB81 |
  REP #$10                        ; $03DB82 |

CODE_03DB84:
  RTS                             ; $03DB84 |

init_fang_stop:
  STZ $0C48                       ; $03DB85 |
  JMP CODE_03D62C                 ; $03DB88 |

init_unknown2_gen:
  LDA $0C4C                       ; $03DB8B |
  BEQ CODE_03DB93                 ; $03DB8E |
  JMP CODE_03D62C                 ; $03DB90 |

CODE_03DB93:
  INC $0C4C                       ; $03DB93 |
  RTS                             ; $03DB96 |

; table (data)
DATA_03DB97:         dw $0020, $0030
DATA_03DB9B:         dw $0050, $0060
DATA_03DB9F:         dw $0090, $0090
DATA_03DBA3:         dw $00C0, $00D0
DATA_03DBA7:         dw $0030, $0060
DATA_03DBAB:         dw $0020, $0050
DATA_03DBAF:         dw $0040, $0070
DATA_03DBB3:         dw $0060, $0030

main_unknown2_gen:
  LDA $61B0                       ; $03DBB7 |
  ORA $0B55                       ; $03DBBA |
  ORA $0398                       ; $03DBBD |
  BNE CODE_03DC2D                 ; $03DBC0 |
  LDA $0CD6                       ; $03DBC2 |
  BNE CODE_03DC2D                 ; $03DBC5 |
  LDA $0C4E                       ; $03DBC7 |
  CMP #$0001                      ; $03DBCA |
  BCS CODE_03DC2D                 ; $03DBCD |
  PHY                             ; $03DBCF |
  SEP #$10                        ; $03DBD0 |
  LDA $10                         ; $03DBD2 |
  AND #$0007                      ; $03DBD4 |
  ASL A                           ; $03DBD7 |
  TAY                             ; $03DBD8 |
  LDA $0039                       ; $03DBD9 |
  AND #$FF00                      ; $03DBDC |
  CLC                             ; $03DBDF |
  ADC $DB97,y                     ; $03DBE0 | add value in table
  CMP $0039                       ; $03DBE3 |
  BPL CODE_03DBEC                 ; $03DBE6 |
  CLC                             ; $03DBE8 |
  ADC #$0100                      ; $03DBE9 |

CODE_03DBEC:
  STA $00                         ; $03DBEC |
  STA $3010                       ; $03DBEE |
  LDA $003B                       ; $03DBF1 |
  AND #$FF00                      ; $03DBF4 |
  CLC                             ; $03DBF7 |
  ADC $DBA7,y                     ; $03DBF8 |
  CMP $003B                       ; $03DBFB |
  BPL CODE_03DC04                 ; $03DBFE |
  CLC                             ; $03DC00 |
  ADC #$0100                      ; $03DC01 |

CODE_03DC04:
  STA $02                         ; $03DC04 |
  STA $3000                       ; $03DC06 |
  LDX #$0A                        ; $03DC09 |
  LDA #$CE2F                      ; $03DC0B |
  JSL $7EDE91                     ; $03DC0E | GSU init
  LDA $300C                       ; $03DC12 |
  CMP #$0010                      ; $03DC15 |
  BNE CODE_03DC2A                 ; $03DC18 |
  LDA #$0157                      ; $03DC1A |
  JSL $03A364                     ; $03DC1D |
  BCC CODE_03DC2A                 ; $03DC21 |
  INC $0C4E                       ; $03DC23 |
  JSL $07C30B                     ; $03DC26 |

CODE_03DC2A:
  REP #$10                        ; $03DC2A |
  PLY                             ; $03DC2C |

CODE_03DC2D:
  RTS                             ; $03DC2D |

init_unknown2_stop:
  STZ $0C4C                       ; $03DC2E |
  JMP CODE_03D62C                 ; $03DC31 |

; data table
DATA_03DC34:         dw $0901
DATA_03DC36:         dw $1911

init_speardance_trigger:
  LDA $00                         ; $03DC38 |
  AND #$0001                      ; $03DC3A |
  STA $00                         ; $03DC3D |
  LDA $02                         ; $03DC3F |
  AND #$0001                      ; $03DC41 |
  ASL A                           ; $03DC44 |
  ORA $00                         ; $03DC45 |
  TAX                             ; $03DC47 |
  LDA $DC34,x                     ; $03DC48 | load value in table
  AND #$00FF                      ; $03DC4B |
  STA $00                         ; $03DC4E |
  CMP $0C50                       ; $03DC50 |
  BNE CODE_03DC58                 ; $03DC53 |

CODE_03DC55:
  JMP CODE_03D62C                 ; $03DC55 |

CODE_03DC58:
  STA $0C50                       ; $03DC58 |
  LDA $0C52                       ; $03DC5B |
  BNE CODE_03DC55                 ; $03DC5E |
  STZ $0C54                       ; $03DC60 |
  STZ $0C5C                       ; $03DC63 |
  INC $0C52                       ; $03DC66 |
  RTS                             ; $03DC69 |

; data table - starts from $DC69 in code, might include the $60 there (though doubtful)
DATA_03DC6A:         db $04, $06, $0E
DATA_03DC6D:         db $08, $0A, $08, $0C
DATA_03DC71:         db $06, $0C, $0E, $10
DATA_03DC75:         db $00, $0E, $0C, $10
DATA_03DC79:         db $02, $0A, $04, $0C
DATA_03DC7D:         db $06, $0A, $04, $0E
DATA_03DC81:         db $08, $0E, $08, $10
DATA_03DC85:         db $00, $0E, $08, $04

; data table
DATA_03DC89:         db $00, $0A, $08, $0C
DATA_03DC8D:         db $06, $04, $06, $0E
DATA_03DC91:         db $08, $0E, $0C, $10
DATA_03DC95:         db $02, $0C, $0E, $10
DATA_03DC99:         db $00, $0A, $04, $0E
DATA_03DC9D:         db $08, $0A, $04, $0C
DATA_03DCA1:         db $06, $0E, $08, $04
DATA_03DCA5:         db $00, $0E, $08, $10

; data table
DATA_03DCA9:         db $00, $00, $F0, $F0
DATA_03DCAD:         db $00, $00, $10, $10
DATA_03DCB1:         db $00, $00, $00, $00
DATA_03DCB5:         db $E0, $E0, $E0, $E0
DATA_03DCB9:         db $00, $00, $00, $00
DATA_03DCBD:         db $F0, $F0, $F0, $F0
DATA_03DCC1:         db $00, $00, $10, $10
DATA_03DCC5:         db $F0, $F0, $00, $00

; data table
DATA_03DCC9:         db $E0, $00, $10, $10
DATA_03DCCD:         db $00, $00, $F0, $F0
DATA_03DCD1:         db $00, $00, $00, $00
DATA_03DCD5:         db $20, $20, $20, $20
DATA_03DCD9:         db $00, $00, $00, $00
DATA_03DCDD:         db $10, $10, $10, $10
DATA_03DCE1:         db $00, $00, $10, $10
DATA_03DCE5:         db $F0, $F0, $00, $00
DATA_03DCE9:         db $E0

; data table
DATA_03DCEA:         db $68, $69

main_speardance:
  LDA $0C54                       ; $03DCEC |
  DEC A                           ; $03DCEF |
  BNE CODE_03DD00                 ; $03DCF0 |
  LDA $61B0                       ; $03DCF2 |
  ORA $0B55                       ; $03DCF5 |
  ORA $0398                       ; $03DCF8 |
  BEQ CODE_03DD04                 ; $03DCFB |
  STA $0C56                       ; $03DCFD |

CODE_03DD00:
  STZ $0C66                       ; $03DD00 |
  RTS                             ; $03DD03 |

CODE_03DD04:
  LDA $0C56                       ; $03DD04 |
  BEQ CODE_03DD0D                 ; $03DD07 |
  STZ $0C56                       ; $03DD09 |
  RTS                             ; $03DD0C |

CODE_03DD0D:
  LDA $0C5C                       ; $03DD0D |
  INC A                           ; $03DD10 |
  AND #$0007                      ; $03DD11 |
  STA $0C5C                       ; $03DD14 |
  LDA $0C50                       ; $03DD17 |
  CLC                             ; $03DD1A |
  ADC $0C5C                       ; $03DD1B |
  TAX                             ; $03DD1E |
  LDA $DC69,x                     ; $03DD1F |\
  AND #$00FF                      ; $03DD22 | | store only first 8 bits of table value, effectively
  STA $0C58                       ; $03DD25 |/
  LDA $DC89,x                     ; $03DD28 |\
  AND #$00FF                      ; $03DD2B | | store 1 byte of table
  STA $0C5A                       ; $03DD2E |/
  PHY                             ; $03DD31 |
  LDY $0C66                       ; $03DD32 |
  BEQ CODE_03DD4E                 ; $03DD35 |
  LDY #$0000                      ; $03DD37 |
  CMP #$000A                      ; $03DD3A |
  BEQ CODE_03DD45                 ; $03DD3D |
  CMP #$0003                      ; $03DD3F |
  BMI CODE_03DD45                 ; $03DD42 |
  INY                             ; $03DD44 |

CODE_03DD45:
  LDA $DCEA,y                     ; $03DD45 | load table value
  TAY                             ; $03DD48 |
  TYA                             ; $03DD49 |
  JSL $0085D2                     ; $03DD4A |

CODE_03DD4E:
  PLY                             ; $03DD4E |
  LDA $DCA9,x                     ; $03DD4F |\
  AND #$00FF                      ; $03DD52 | | cmp 1 byte of table
  CMP #$0080                      ; $03DD55 |/
  BMI CODE_03DD5D                 ; $03DD58 |
  ORA #$FF00                      ; $03DD5A |

CODE_03DD5D:
  STA $0C5E                       ; $03DD5D |
  LDA $DCC9,x                     ; $03DD60 |\
  AND #$00FF                      ; $03DD63 | | cmp 1 byte of table
  CMP #$0080                      ; $03DD66 |/
  BMI CODE_03DD6E                 ; $03DD69 |
  ORA #$FF00                      ; $03DD6B |

CODE_03DD6E:
  STA $0C60                       ; $03DD6E |
  TXA                             ; $03DD71 |
  DEC A                           ; $03DD72 |
  AND #$0007                      ; $03DD73 |
  TAX                             ; $03DD76 |
  LDA $DCA9,x                     ; $03DD77 |\
  AND #$00FF                      ; $03DD7A | | cmp 1 byte of table
  CMP #$0080                      ; $03DD7D |/
  BMI CODE_03DD85                 ; $03DD80 |
  ORA #$FF00                      ; $03DD82 |

CODE_03DD85:
  STA $0C62                       ; $03DD85 |
  LDA $DCC9,x                     ; $03DD88 |\
  AND #$00FF                      ; $03DD8B | | cmp 1 byte of table
  CMP #$0080                      ; $03DD8E |/
  BMI CODE_03DD96                 ; $03DD91 |
  ORA #$FF00                      ; $03DD93 |

CODE_03DD96:
  STA $0C64                       ; $03DD96 |
  LDX #$0002                      ; $03DD99 |
  STX $0CD8                       ; $03DD9C |
  STZ $0C66                       ; $03DD9F |
  RTS                             ; $03DDA2 |

init_speardance_stop:
  STZ $0C50                       ; $03DDA3 |
  STZ $0C52                       ; $03DDA6 |
  STZ $0CD8                       ; $03DDA9 |
  STZ $0C58                       ; $03DDAC |
  STZ $0C5A                       ; $03DDAF |
  STZ $0C66                       ; $03DDB2 |
  JMP CODE_03D62C                 ; $03DDB5 |

init_firelakitu_stop:
  STZ $0C68                       ; $03DDB8 |
  JMP CODE_03D62C                 ; $03DDBB |

init_butterfly_gen:
  LDA $0C6A                       ; $03DDBE |
  BEQ CODE_03DDC6                 ; $03DDC1 |
  JMP CODE_03D62C                 ; $03DDC3 |

CODE_03DDC6:
  INC $0C6A                       ; $03DDC6 |
  RTS                             ; $03DDC9 |

; data table
DATA_03DDCA:         dw $0120, $0130
DATA_03DDCE:         dw $FFD0, $FFC0

; data table
DATA_03DDD2:         dw $0020, $0060
DATA_03DDD6:         dw $00A0, $00E0

main_butterfly_gen:
  LDA $0C6A                       ; $03DDDA |
  BNE CODE_03DDE2                 ; $03DDDD |
  JMP CODE_03D62C                 ; $03DDDF |

CODE_03DDE2:
  LDA $61B0                       ; $03DDE2 |
  ORA $0B55                       ; $03DDE5 |
  ORA $0398                       ; $03DDE8 |
  BNE CODE_03DE59                 ; $03DDEB |
  LDA $0CDA                       ; $03DDED |
  BNE CODE_03DE59                 ; $03DDF0 |
  LDA $0C6C                       ; $03DDF2 |
  CMP #$0004                      ; $03DDF5 |
  BCS CODE_03DE59                 ; $03DDF8 |
  LDA #$0030                      ; $03DDFA |
  STA $0CDA                       ; $03DDFD |
  SEP #$10                        ; $03DE00 |
  PHY                             ; $03DE02 |
  LDA #$0152                      ; $03DE03 |
  JSL $03A364                     ; $03DE06 |
  BCC CODE_03DE56                 ; $03DE0A |
  INC $0C6C                       ; $03DE0C |
  LDA $0073                       ; $03DE0F |
  STA $7400,y                     ; $03DE12 |
  ASL A                           ; $03DE15 |
  STA $00                         ; $03DE16 |
  LDA $10                         ; $03DE18 |
  AND #$0001                      ; $03DE1A |
  ASL A                           ; $03DE1D |
  ORA $00                         ; $03DE1E |
  TAX                             ; $03DE20 |
  LDA $0039                       ; $03DE21 |
  CLC                             ; $03DE24 |
  ADC $DDCA,x                     ; $03DE25 | add value in table
  STA $70E2,y                     ; $03DE28 |
  LDA $10                         ; $03DE2B |
  AND #$0003                      ; $03DE2D |
  ASL A                           ; $03DE30 |
  TAX                             ; $03DE31 |
  LDA $003B                       ; $03DE32 |
  CLC                             ; $03DE35 |
  ADC $DDD2,x                     ; $03DE36 | add value in table
  STA $7182,y                     ; $03DE39 |
  PHB                             ; $03DE3C |
  LDX #$07                        ; $03DE3D |
  PHX                             ; $03DE3F |
  PLB                             ; $03DE40 |
  TYX                             ; $03DE41 |
  JSL $07BB20                     ; $03DE42 |
  PLB                             ; $03DE46 |
  LDA $7040,x                     ; $03DE47 |
  AND #$FFF3                      ; $03DE4A |
  STA $7040,x                     ; $03DE4D |
  LDA #$0001                      ; $03DE50 |
  STA $7A36,x                     ; $03DE53 |

CODE_03DE56:
  PLY                             ; $03DE56 |
  REP #$10                        ; $03DE57 |

CODE_03DE59:
  RTS                             ; $03DE59 |

init_butterfly_stop:
  STZ $0C6A                       ; $03DE5A |
  JMP CODE_03D62C                 ; $03DE5D |

init_spore_gen:
  LDA $0C6E                       ; $03DE60 |
  BEQ CODE_03DE68                 ; $03DE63 |
  JMP CODE_03D62C                 ; $03DE65 |

CODE_03DE68:
  INC $0C6E                       ; $03DE68 |
  RTS                             ; $03DE6B |

; data table
DATA_03DE6C:         dw $0000, $0010
DATA_03DE70:         dw $0020, $0030
DATA_03DE74:         dw $0040, $0050
DATA_03DE78:         dw $0060, $0070
DATA_03DE7C:         dw $0080, $0090
DATA_03DE80:         dw $00A0, $00B0
DATA_03DE84:         dw $00C0, $00D0
DATA_03DE88:         dw $00E0, $00F0

; data table
DATA_03DE8C:         dw $FFF0, $FFE0
DATA_03DE90:         dw $FFD0, $FFC0

main_spore_gen:
  LDA $0C6E                       ; $03DE94 |
  BNE CODE_03DE9C                 ; $03DE97 |
  JMP CODE_03D62C                 ; $03DE99 |

CODE_03DE9C:
  LDA $61B0                       ; $03DE9C |
  ORA $0B55                       ; $03DE9F |
  ORA $0398                       ; $03DEA2 |
  BNE CODE_03DF0B                 ; $03DEA5 |
  LDA $0CDC                       ; $03DEA7 |
  BNE CODE_03DF0B                 ; $03DEAA |
  SEP #$10                        ; $03DEAC |
  PHY                             ; $03DEAE |
  LDA #$0165                      ; $03DEAF |
  STA $3008                       ; $03DEB2 |
  LDA #$0166                      ; $03DEB5 |
  STA $300A                       ; $03DEB8 |
  LDX #$09                        ; $03DEBB |
  LDA #$91DB                      ; $03DEBD |
  JSL $7EDE44                     ; $03DEC0 | GSU init
  LDA $300C                       ; $03DEC4 |
  CMP #$0004                      ; $03DEC7 |
  BCS CODE_03DF08                 ; $03DECA |
  LDA #$0020                      ; $03DECC |
  STA $0CDC                       ; $03DECF |
  LDA #$0165                      ; $03DED2 |
  JSL $03A364                     ; $03DED5 |
  BCC CODE_03DF08                 ; $03DED9 |
  LDA $10                         ; $03DEDB |
  AND #$000F                      ; $03DEDD |
  ASL A                           ; $03DEE0 |
  TAX                             ; $03DEE1 |
  LDA $0039                       ; $03DEE2 |
  CLC                             ; $03DEE5 |
  ADC $DE6C,x                     ; $03DEE6 | add table value
  STA $70E2,y                     ; $03DEE9 |
  LDA $10                         ; $03DEEC |
  AND #$0003                      ; $03DEEE |
  ASL A                           ; $03DEF1 |
  TAX                             ; $03DEF2 |
  LDA $003B                       ; $03DEF3 |
  CLC                             ; $03DEF6 |
  ADC $DE8C,x                     ; $03DEF7 | add table value
  STA $7182,y                     ; $03DEFA |
  PHB                             ; $03DEFD |
  LDX #$0F                        ; $03DEFE |
  PHX                             ; $03DF00 |
  PLB                             ; $03DF01 |
  TYX                             ; $03DF02 |
  JSL $0F8B36                     ; $03DF03 |
  PLB                             ; $03DF07 |

CODE_03DF08:
  PLY                             ; $03DF08 |
  REP #$10                        ; $03DF09 |

CODE_03DF0B:
  RTS                             ; $03DF0B |

init_spore_stop:
  STZ $0C6E                       ; $03DF0C |
  JMP CODE_03D62C                 ; $03DF0F |

init_balloonpokey_gen:
  LDA $0C70                       ; $03DF12 |
  BEQ CODE_03DF1A                 ; $03DF15 |
  JMP CODE_03D62C                 ; $03DF17 |

CODE_03DF1A:
  INC $0C70                       ; $03DF1A |
  RTS                             ; $03DF1D |

; data table
DATA_03DF1E:         dw $0110, $0120
DATA_03DF22:         dw $FFE0, $FFD0

; data table
DATA_03DF26:         dw $0010, $0020
DATA_03DF2A:         dw $0030, $0040

main_balloonpokey_gen:
  JSL $008408                     ; $03DF2E |
  LDA $0C70                       ; $03DF32 |
  BNE CODE_03DF3A                 ; $03DF35 |
  JMP CODE_03D62C                 ; $03DF37 |

CODE_03DF3A:
  LDA $61B0                       ; $03DF3A |
  ORA $0B55                       ; $03DF3D |
  ORA $0398                       ; $03DF40 |
  BNE CODE_03DF4A                 ; $03DF43 |
  LDA $0CDE                       ; $03DF45 |
  BEQ CODE_03DF4B                 ; $03DF48 |

CODE_03DF4A:
  RTS                             ; $03DF4A |

CODE_03DF4B:
  SEP #$10                        ; $03DF4B |
  PHY                             ; $03DF4D |
  LDA #$0174                      ; $03DF4E |
  STA $3008                       ; $03DF51 |
  LDA #$0175                      ; $03DF54 |
  STA $300A                       ; $03DF57 |
  LDX #$09                        ; $03DF5A |
  LDA #$91DB                      ; $03DF5C |
  JSL $7EDE44                     ; $03DF5F | GSU init
  LDA $300C                       ; $03DF63 |
  PHA                             ; $03DF66 |
  LDA #$017F                      ; $03DF67 |
  STA $3008                       ; $03DF6A |
  LDA #$0180                      ; $03DF6D |
  STA $300A                       ; $03DF70 |
  LDX #$09                        ; $03DF73 |
  LDA #$91DB                      ; $03DF75 |
  JSL $7EDE44                     ; $03DF78 | GSU init
  PLA                             ; $03DF7C |
  CLC                             ; $03DF7D |
  ADC $300C                       ; $03DF7E |
  CMP #$0004                      ; $03DF81 |
  BCS CODE_03DFEC                 ; $03DF84 |
  LDA $10                         ; $03DF86 |
  AND #$0004                      ; $03DF88 |
  LSR A                           ; $03DF8B |
  STA $00                         ; $03DF8C |
  LDA $0073                       ; $03DF8E |
  STA $7400,x                     ; $03DF91 |
  ASL A                           ; $03DF94 |
  ORA $00                         ; $03DF95 |
  TAY                             ; $03DF97 |
  LDA $0039                       ; $03DF98 |
  CLC                             ; $03DF9B |
  ADC $DF1E,y                     ; $03DF9C | add table value
  STA $00                         ; $03DF9F |
  STA $3010                       ; $03DFA1 |
  LDA $10                         ; $03DFA4 |
  AND #$0003                      ; $03DFA6 |
  ASL A                           ; $03DFA9 |
  TAY                             ; $03DFAA |
  LDA $003B                       ; $03DFAB |
  CLC                             ; $03DFAE |
  ADC $DF26,y                     ; $03DFAF | add table value
  STA $02                         ; $03DFB2 |
  STA $3000                       ; $03DFB4 |
  LDX #$0A                        ; $03DFB7 |
  LDA #$CE2F                      ; $03DFB9 |
  JSL $7EDE91                     ; $03DFBC | GSU init
  LDA $300E                       ; $03DFC0 |
  BIT #$0002                      ; $03DFC3 |
  BNE CODE_03DFEC                 ; $03DFC6 |
  LDA #$00C0                      ; $03DFC8 |
  STA $0CDE                       ; $03DFCB |
  LDA #$0174                      ; $03DFCE |
  JSL $03A364                     ; $03DFD1 |
  BCC CODE_03DFEC                 ; $03DFD5 |
  TYX                             ; $03DFD7 |
  LDA $00                         ; $03DFD8 |
  STA $70E2,x                     ; $03DFDA |
  LDA $02                         ; $03DFDD |
  STA $7182,x                     ; $03DFDF |
  PHB                             ; $03DFE2 |
  LDY #$07                        ; $03DFE3 |
  PHY                             ; $03DFE5 |
  PLB                             ; $03DFE6 |
  JSL $07F196                     ; $03DFE7 |
  PLB                             ; $03DFEB |

CODE_03DFEC:
  PLY                             ; $03DFEC |
  REP #$10                        ; $03DFED |
  RTS                             ; $03DFEF |

init_balloonpokey_stop:
  STZ $0C70                       ; $03DFF0 |
  JMP CODE_03D62C                 ; $03DFF3 |

init_balloonmissile_gen:
  LDA $0C72                       ; $03DFF6 |
  BEQ CODE_03DFFE                 ; $03DFF9 |
  JMP CODE_03D62C                 ; $03DFFB |

CODE_03DFFE:
  INC $0C72                       ; $03DFFE |
  RTS                             ; $03E001 |

main_balloonmissile_gen:
  JSL $008408                     ; $03E002 |
  LDA $0C72                       ; $03E006 |
  BNE CODE_03E00E                 ; $03E009 |
  JMP CODE_03D62C                 ; $03E00B |

CODE_03E00E:
  LDA $61B0                       ; $03E00E |
  ORA $0B55                       ; $03E011 |
  ORA $0398                       ; $03E014 |
  BNE CODE_03E01E                 ; $03E017 |
  LDA $0CE0                       ; $03E019 |
  BEQ CODE_03E01F                 ; $03E01C |

CODE_03E01E:
  RTS                             ; $03E01E |

CODE_03E01F:
  SEP #$10                        ; $03E01F |
  PHY                             ; $03E021 |
  LDA #$0175                      ; $03E022 |
  STA $3008                       ; $03E025 |
  LDA #$0176                      ; $03E028 |
  STA $300A                       ; $03E02B |
  LDX #$09                        ; $03E02E |
  LDA #$91DB                      ; $03E030 |
  JSL $7EDE44                     ; $03E033 | GSU init
  LDA $300C                       ; $03E037 |
  PHA                             ; $03E03A |
  LDA #$017F                      ; $03E03B |
  STA $3008                       ; $03E03E |
  LDA #$0180                      ; $03E041 |
  STA $300A                       ; $03E044 |
  LDX #$09                        ; $03E047 |
  LDA #$91DB                      ; $03E049 |
  JSL $7EDE44                     ; $03E04C | GSU init
  PLA                             ; $03E050 |
  CLC                             ; $03E051 |
  ADC $300C                       ; $03E052 |
  CMP #$0004                      ; $03E055 |
  BCS CODE_03E0A9                 ; $03E058 |
  LDA $10                         ; $03E05A |
  AND #$0004                      ; $03E05C |
  LSR A                           ; $03E05F |
  STA $00                         ; $03E060 |
  LDA $0073                       ; $03E062 |
  STA $7400,x                     ; $03E065 |
  ASL A                           ; $03E068 |
  ORA $00                         ; $03E069 |
  TAY                             ; $03E06B |
  LDA $0039                       ; $03E06C |
  CLC                             ; $03E06F |
  ADC $DF1E,y                     ; $03E070 |
  STA $00                         ; $03E073 |
  LDA $10                         ; $03E075 |
  AND #$0003                      ; $03E077 |
  ASL A                           ; $03E07A |
  TAY                             ; $03E07B |
  LDA $003B                       ; $03E07C |
  CLC                             ; $03E07F |
  ADC $DF26,y                     ; $03E080 |
  STA $02                         ; $03E083 |
  LDA #$00C0                      ; $03E085 |
  STA $0CE0                       ; $03E088 |
  LDA #$0175                      ; $03E08B |
  JSL $03A364                     ; $03E08E |
  BCC CODE_03E0A9                 ; $03E092 |
  TYX                             ; $03E094 |
  LDA $00                         ; $03E095 |
  STA $70E2,x                     ; $03E097 |
  LDA $02                         ; $03E09A |
  STA $7182,x                     ; $03E09C |
  PHB                             ; $03E09F |
  LDY #$07                        ; $03E0A0 |
  PHY                             ; $03E0A2 |
  PLB                             ; $03E0A3 |
  JSL $07F191                     ; $03E0A4 |
  PLB                             ; $03E0A8 |

CODE_03E0A9:
  PLY                             ; $03E0A9 |
  REP #$10                        ; $03E0AA |
  RTS                             ; $03E0AC |

init_balloonmissile_stop:
  STZ $0C72                       ; $03E0AD |
  JMP CODE_03D62C                 ; $03E0B0 |

init_balloon_gen:
  LDA $0C74                       ; $03E0B3 |
  BEQ CODE_03E0BB                 ; $03E0B6 |
  JMP CODE_03D62C                 ; $03E0B8 |

CODE_03E0BB:
  INC $0C74                       ; $03E0BB |
  RTS                             ; $03E0BE |

main_balloon_gen:
  LDA $0C74                       ; $03E0BF |
  BNE CODE_03E0C7                 ; $03E0C2 |
  JMP CODE_03D62C                 ; $03E0C4 |

CODE_03E0C7:
  LDA $61B0                       ; $03E0C7 |
  ORA $0B55                       ; $03E0CA |
  ORA $0398                       ; $03E0CD |
  BNE CODE_03E123                 ; $03E0D0 |
  LDA $0CE2                       ; $03E0D2 |
  BNE CODE_03E123                 ; $03E0D5 |
  LDA #$0060                      ; $03E0D7 |
  STA $0CE2                       ; $03E0DA |
  LDA $0FED                       ; $03E0DD |
  CMP #$000C                      ; $03E0E0 |
  BPL CODE_03E123                 ; $03E0E3 |
  SEP #$10                        ; $03E0E5 |
  PHY                             ; $03E0E7 |
  LDA #$0052                      ; $03E0E8 |
  JSL $03A34C                     ; $03E0EB |
  BCC CODE_03E120                 ; $03E0EF |
  LDA $003B                       ; $03E0F1 |
  CLC                             ; $03E0F4 |
  ADC #$0110                      ; $03E0F5 |
  STA $7182,y                     ; $03E0F8 |
  LDA $60A8                       ; $03E0FB |
  BNE CODE_03E108                 ; $03E0FE |
  LDA $60C4                       ; $03E100 |
  DEC A                           ; $03E103 |
  EOR #$FFFF                      ; $03E104 |
  INC A                           ; $03E107 |

CODE_03E108:
  BPL CODE_03E10F                 ; $03E108 |
  LDA #$FFA0                      ; $03E10A |
  BRA CODE_03E112                 ; $03E10D |

CODE_03E10F:
  LDA #$0060                      ; $03E10F |

CODE_03E112:
  STA $00                         ; $03E112 |
  LDA $608C                       ; $03E114 |
  CLC                             ; $03E117 |
  ADC $00                         ; $03E118 |
  AND #$FFE0                      ; $03E11A |
  STA $70E2,y                     ; $03E11D |

CODE_03E120:
  PLY                             ; $03E120 |
  REP #$10                        ; $03E121 |

CODE_03E123:
  RTS                             ; $03E123 |

init_balloon_stop:
  STZ $0C74                       ; $03E124 |
  JMP CODE_03D62C                 ; $03E127 |

; data table
DATA_03E12A:         dw $0620, $06A0
DATA_03E12E:         dw $0630, $05B0

; data table
DATA_03E132:         dw $0140, $01B0
DATA_03E136:         dw $0230, $01B0

; data table
DATA_03E13A:         dw $0188, $0188
DATA_03E13E:         dw $0187, $0188

init_yellowplatform_gen:
  LDA $0C76                       ; $03E142 |
  BEQ CODE_03E14A                 ; $03E145 |
  JMP CODE_03D62C                 ; $03E147 |

CODE_03E14A:
  INC $0C76                       ; $03E14A |
  PHY                             ; $03E14D |
  SEP #$10                        ; $03E14E |
  LDY #$00                        ; $03E150 |

CODE_03E152:
  STY $00                         ; $03E152 |
  LDA $E12A,y                     ; $03E154 |
  STA $02                         ; $03E157 |
  LDA $E132,y                     ; $03E159 |
  STA $04                         ; $03E15C |
  LDA $E13A,y                     ; $03E15E |
  JSL $03A34C                     ; $03E161 |
  BCC CODE_03E18C                 ; $03E165 |
  LDA $02                         ; $03E167 |
  STA $70E2,y                     ; $03E169 |
  LDA $04                         ; $03E16C |
  STA $7182,y                     ; $03E16E |
  LDA $7040,y                     ; $03E171 |
  AND #$FFF3                      ; $03E174 |
  STA $7040,y                     ; $03E177 |
  INC $0FF7                       ; $03E17A |
  INC $0FF7                       ; $03E17D |
  TYA                             ; $03E180 |
  LDY $00                         ; $03E181 |
  STA $0FEF,y                     ; $03E183 |
  INY                             ; $03E186 |
  INY                             ; $03E187 |
  CPY #$08                        ; $03E188 |
  BMI CODE_03E152                 ; $03E18A |

CODE_03E18C:
  REP #$10                        ; $03E18C |
  PLY                             ; $03E18E |
  RTS                             ; $03E18F |

main_yellowplatform_gen:
  PHY                             ; $03E190 |
  SEP #$10                        ; $03E191 |
  LDY $0FF7                       ; $03E193 |

CODE_03E196:
  STY $00                         ; $03E196 |
  LDA $0FED,y                     ; $03E198 |
  TAY                             ; $03E19B |
  LDA $7680,y                     ; $03E19C |
  CLC                             ; $03E19F |
  ADC #$0100                      ; $03E1A0 |
  CMP #$0300                      ; $03E1A3 |
  BCS CODE_03E1B4                 ; $03E1A6 |
  LDA $7682,y                     ; $03E1A8 |
  CLC                             ; $03E1AB |
  ADC #$0100                      ; $03E1AC |
  CMP #$0300                      ; $03E1AF |
  BCC CODE_03E1DE                 ; $03E1B2 |

CODE_03E1B4:
  LDY $00                         ; $03E1B4 |
  DEY                             ; $03E1B6 |
  DEY                             ; $03E1B7 |
  BNE CODE_03E196                 ; $03E1B8 |
  LDY $0FF7                       ; $03E1BA |

CODE_03E1BD:
  STY $00                         ; $03E1BD |
  LDX $0FED,y                     ; $03E1BF |
  JSL $03A31E                     ; $03E1C2 |
  LDY $00                         ; $03E1C6 |
  LDA #$0000                      ; $03E1C8 |
  STA $0FED,y                     ; $03E1CB |
  DEY                             ; $03E1CE |
  DEY                             ; $03E1CF |
  BNE CODE_03E1BD                 ; $03E1D0 |
  STZ $0C76                       ; $03E1D2 |
  STZ $0FF7                       ; $03E1D5 |
  REP #$10                        ; $03E1D8 |
  PLY                             ; $03E1DA |
  JMP CODE_03D62C                 ; $03E1DB |

CODE_03E1DE:
  REP #$10                        ; $03E1DE |
  PLY                             ; $03E1E0 |
  RTS                             ; $03E1E1 |

init_minisalvo_gen:
  LDA $0C78                       ; $03E1E2 |
  BEQ CODE_03E1EA                 ; $03E1E5 |
  JMP CODE_03D62C                 ; $03E1E7 |

CODE_03E1EA:
  INC $0C78                       ; $03E1EA |
  LDA $02                         ; $03E1ED |
  ASL A                           ; $03E1EF |
  ASL A                           ; $03E1F0 |
  ASL A                           ; $03E1F1 |
  ASL A                           ; $03E1F2 |
  STA $0C7A                       ; $03E1F3 |
  RTS                             ; $03E1F6 |

; data
DATA_03E1F7:         dw $0020, $FFE0

main_minisalvo_gen:
  LDA $0C78                       ; $03E1FB |
  BNE CODE_03E203                 ; $03E1FE |
  JMP CODE_03D62C                 ; $03E200 |

CODE_03E203:
  PHY                             ; $03E203 |
  SEP #$10                        ; $03E204 |
  LDA $61B0                       ; $03E206 |
  ORA $0B55                       ; $03E209 |
  ORA $0398                       ; $03E20C |
  BNE CODE_03E216                 ; $03E20F |
  LDA $0CE4                       ; $03E211 |
  BEQ CODE_03E219                 ; $03E214 |

CODE_03E216:
  JMP CODE_03E29D                 ; $03E216 |

CODE_03E219:
  LDX #$09                        ; $03E219 |
  LDA #$91D5                      ; $03E21B |
  JSL $7EDE44                     ; $03E21E | GSU init
  LDA #$0008                      ; $03E222 |
  SEC                             ; $03E225 |
  SBC $300C                       ; $03E226 |
  CMP #$0005                      ; $03E229 |
  BMI CODE_03E231                 ; $03E22C |
  LDA #$0005                      ; $03E22E |

CODE_03E231:
  STA $00                         ; $03E231 |
  LDA #$0132                      ; $03E233 |
  STA $3008                       ; $03E236 |
  INC A                           ; $03E239 |
  STA $300A                       ; $03E23A |
  LDX #$09                        ; $03E23D |
  LDA #$91DB                      ; $03E23F |
  JSL $7EDE44                     ; $03E242 | GSU init
  LDY $300C                       ; $03E246 |
  CPY $00                         ; $03E249 |
  BPL CODE_03E29D                 ; $03E24B |
  LDA #$0132                      ; $03E24D |
  JSL $03A34C                     ; $03E250 |
  BCC CODE_03E29D                 ; $03E254 |
  PHY                             ; $03E256 |
  LDY #$00                        ; $03E257 |
  LDA $10                         ; $03E259 |
  AND #$007F                      ; $03E25B |
  SEC                             ; $03E25E |
  SBC #$0040                      ; $03E25F |
  STA $00                         ; $03E262 |
  BPL CODE_03E268                 ; $03E264 |
  INY                             ; $03E266 |
  INY                             ; $03E267 |

CODE_03E268:
  CLC                             ; $03E268 |
  ADC $E1F7,y                     ; $03E269 |
  CLC                             ; $03E26C |
  ADC $608C                       ; $03E26D |
  PLY                             ; $03E270 |
  STA $70E2,y                     ; $03E271 |
  LDA $0C7A                       ; $03E274 |
  CLC                             ; $03E277 |
  ADC #$0010                      ; $03E278 |
  STA $7182,y                     ; $03E27B |
  LDA #$0007                      ; $03E27E |
  STA $7402,y                     ; $03E281 |
  INC A                           ; $03E284 |
  STA $7A98,y                     ; $03E285 |
  LDA #$0000                      ; $03E288 |
  STA $7900,y                     ; $03E28B |
  STA $7902,y                     ; $03E28E |
  LDA #$0002                      ; $03E291 |
  STA $74A2,y                     ; $03E294 |
  LDA #$0060                      ; $03E297 |
  STA $0CE4                       ; $03E29A |

CODE_03E29D:
  REP #$10                        ; $03E29D |
  PLY                             ; $03E29F |
  RTS                             ; $03E2A0 |

init_minisalvo_stop:
  STZ $0C78                       ; $03E2A1 |
  JMP CODE_03D62C                 ; $03E2A4 |

init_dizzy_stop:
  LDA $7FE8                       ; $03E2A7 |
  BEQ CODE_03E2B2                 ; $03E2AA |
  LDA #$0001                      ; $03E2AC |
  STA $7FE8                       ; $03E2AF |

CODE_03E2B2:
  JMP CODE_03D62C                 ; $03E2B2 |

init_hscroll_lock:
  LDA $7960                       ; $03E2B5 |
  ASL A                           ; $03E2B8 |
  ASL A                           ; $03E2B9 |
  ASL A                           ; $03E2BA |
  ASL A                           ; $03E2BB |
  SEC                             ; $03E2BC |
  SBC #$0100                      ; $03E2BD |
  STA $7E1A                       ; $03E2C0 |
  JMP CODE_03D639                 ; $03E2C3 |

init_unknown3_stop:
  STZ $0C7C                       ; $03E2C6 |
  JMP CODE_03D62C                 ; $03E2C9 |

init_fuzzy_gen:
  LDA $0C3E                       ; $03E2CC |
  BEQ CODE_03E2D4                 ; $03E2CF |
  JMP CODE_03D62C                 ; $03E2D1 |

CODE_03E2D4:
  INC $0C3E                       ; $03E2D4 |
  LDA $0039                       ; $03E2D7 |
  STA $0C44                       ; $03E2DA |
  RTS                             ; $03E2DD |

; data table
DATA_03E2DE:         dw $0120, $FFE0
DATA_03E2E2:         dw $0130, $FFD0
DATA_03E2E6:         dw $0140, $FFC0
DATA_03E2EA:         dw $0150, $FFB0

; data table
DATA_03E2EE:         dw $0000, $0020
DATA_03E2F2:         dw $0040, $0060
DATA_03E2F6:         dw $0080, $00A0
DATA_03E2FA:         dw $00C0, $00E0

; data table
DATA_03E2FE:         dw $0001, $0002
DATA_03E302:         dw $0004, $0008
DATA_03E306:         dw $0010, $0020
DATA_03E30A:         dw $0040, $0080

main_fuzzy_gen:
  LDA $0C3E                       ; $03E30E |
  BNE CODE_03E316                 ; $03E311 |
  JMP CODE_03D62C                 ; $03E313 |

CODE_03E316:
  LDA $61B0                       ; $03E316 |
  ORA $0B55                       ; $03E319 |
  ORA $0398                       ; $03E31C |
  BEQ CODE_03E322                 ; $03E31F |

CODE_03E321:
  RTS                             ; $03E321 |

CODE_03E322:
  LDA $0C40                       ; $03E322 |
  CMP #$0008                      ; $03E325 |
  BCS CODE_03E321                 ; $03E328 |
  LDA $0C44                       ; $03E32A |
  SEC                             ; $03E32D |
  SBC $0039                       ; $03E32E |
  CLC                             ; $03E331 |
  ADC #$0020                      ; $03E332 |
  CMP #$0040                      ; $03E335 |
  BCS CODE_03E33F                 ; $03E338 |
  LDA $0CEA                       ; $03E33A |
  BNE CODE_03E3B0                 ; $03E33D |

CODE_03E33F:
  LDA $10                         ; $03E33F |
  AND #$0007                      ; $03E341 |
  ASL A                           ; $03E344 |
  TAX                             ; $03E345 |
  LDA $003B                       ; $03E346 |
  AND #$FFE0                      ; $03E349 |
  CLC                             ; $03E34C |
  ADC $E2EE,x                     ; $03E34D |
  STA $02                         ; $03E350 |
  LSR A                           ; $03E352 |
  LSR A                           ; $03E353 |
  LSR A                           ; $03E354 |
  LSR A                           ; $03E355 |
  AND #$000E                      ; $03E356 |
  TAX                             ; $03E359 |
  LDA $0C42                       ; $03E35A |
  AND $E2FE,x                     ; $03E35D |
  BNE CODE_03E3B0                 ; $03E360 |
  LDA $E2FE,x                     ; $03E362 |
  STA $00                         ; $03E365 |
  JSL $008408                     ; $03E367 |
  SEP #$10                        ; $03E36B |
  PHY                             ; $03E36D |
  LDA #$0129                      ; $03E36E |
  JSL $03A34C                     ; $03E371 |
  BCC CODE_03E3AD                 ; $03E375 |
  LDA #$0080                      ; $03E377 |
  STA $0CEA                       ; $03E37A |
  LDA $00                         ; $03E37D |
  TSB $0C42                       ; $03E37F |
  INC $0C40                       ; $03E382 |
  LDA $0073                       ; $03E385 |
  STA $7400,y                     ; $03E388 |
  LDA $10                         ; $03E38B |
  AND #$0003                      ; $03E38D |
  ASL A                           ; $03E390 |
  ASL A                           ; $03E391 |
  ORA $7400,y                     ; $03E392 |
  TAX                             ; $03E395 |
  LDA $0039                       ; $03E396 |
  STA $0C44                       ; $03E399 |
  CLC                             ; $03E39C |
  ADC $E2DE,x                     ; $03E39D |
  STA $70E2,y                     ; $03E3A0 |
  LDA $02                         ; $03E3A3 |
  STA $7182,y                     ; $03E3A5 |
  LDA $00                         ; $03E3A8 |
  STA $79D8,y                     ; $03E3AA |

CODE_03E3AD:
  PLY                             ; $03E3AD |
  REP #$10                        ; $03E3AE |

CODE_03E3B0:
  RTS                             ; $03E3B0 |

init_horizontal_scroll_stop:
  STZ $0C7E                       ; $03E3B1 |
  JMP CODE_03D62C                 ; $03E3B4 |

init_kamek:
  LDY $7900,x                     ; $03E3B7 |
  BNE CODE_03E3CD                 ; $03E3BA |
  SEP #$20                        ; $03E3BC |
  LDA $70E2,x                     ; $03E3BE |
  AND #$10                        ; $03E3C1 |
  LSR A                           ; $03E3C3 |
  LSR A                           ; $03E3C4 |
  LSR A                           ; $03E3C5 |
  INC A                           ; $03E3C6 |
  STA $7900,x                     ; $03E3C7 |
  TAY                             ; $03E3CA |
  REP #$20                        ; $03E3CB |

CODE_03E3CD:
  DEY                             ; $03E3CD |
  TYX                             ; $03E3CE |
  JMP ($E3D2,x)                   ; $03E3CF | table address

; address table
DATA_03E3D2:         dw $E3D6, $E3F7

; $E3D2 table address
  LDX $12                         ; $03E3D6 |
  JSL $03AE60                     ; $03E3D8 |
  SEP #$20                        ; $03E3DC |
  LDA #$3C                        ; $03E3DE |
  STA $7180,x                     ; $03E3E0 |
  LDA #$FF                        ; $03E3E3 |
  STA $74A2,x                     ; $03E3E5 |
  REP #$20                        ; $03E3E8 |
  LDA #$0001                      ; $03E3EA |
  STA $7402,x                     ; $03E3ED |
  LDA #$0040                      ; $03E3F0 |
  STA $7A96,x                     ; $03E3F3 |
  RTL                             ; $03E3F6 |

; $E3D2 table address
  LDX $12                         ; $03E3F7 |
  LDA $6FA0,x                     ; $03E3F9 |
  ORA #$6800                      ; $03E3FC |
  STA $6FA0,x                     ; $03E3FF |
  LDA #$0001                      ; $03E402 |
  STA $7402,x                     ; $03E405 |
  RTL                             ; $03E408 |

main_kamek:
  LDY $7900,x                     ; $03E409 |
  DEY                             ; $03E40C |
  TYX                             ; $03E40D |
  JMP ($E411,x)                   ; $03E40E | pointer table

; pointer table
DATA_03E411:         dw $E415
DATA_03E413:         dw $E78F

; $E411 table sub
  LDX $12                         ; $03E415 |
  LDA $7402,x                     ; $03E417 |
  BNE CODE_03E423                 ; $03E41A |
  JSL $03AA52                     ; $03E41C |
  JSR CODE_03E70C                 ; $03E420 |

CODE_03E423:
  JSL $03AF23                     ; $03E423 |
  LDY $16,x                       ; $03E427 |
  TYX                             ; $03E429 |
  JMP ($E42D,x)                   ; $03E42A | pointer table

; pointer table
DATA_03E42D:         dw $E43F
DATA_03E42F:         dw $E479
DATA_03E431:         dw $E4F4
DATA_03E433:         dw $E53E
DATA_03E435:         dw $E571
DATA_03E437:         dw $E58B
DATA_03E439:         dw $E67B
DATA_03E43B:         dw $E6AE
DATA_03E43D:         dw $E6F6

; $E42D table sub
  LDX $12                         ; $03E43F |
  LDA $7A96,x                     ; $03E441 |
  BNE CODE_03E478                 ; $03E444 |
  LDA $0039                       ; $03E446 |
  CLC                             ; $03E449 |
  ADC #$0130                      ; $03E44A |
  STA $70E2,x                     ; $03E44D |
  LDA $003B                       ; $03E450 |
  CLC                             ; $03E453 |
  ADC #$0040                      ; $03E454 |
  STA $7182,x                     ; $03E457 |
  STA $7A36,x                     ; $03E45A |
  SEP #$20                        ; $03E45D |
  LDA #$01                        ; $03E45F |
  STA $74A2,x                     ; $03E461 |
  REP #$20                        ; $03E464 |
  LDA #$FE00                      ; $03E466 |
  STA $7220,x                     ; $03E469 |
  LDA #$0004                      ; $03E46C |
  STA $7A98,x                     ; $03E46F |
  LDY $16,x                       ; $03E472 |
  INY                             ; $03E474 |
  INY                             ; $03E475 |
  STY $16,x                       ; $03E476 |

CODE_03E478:
  RTL                             ; $03E478 |

; $E42D table sub
  LDX $12                         ; $03E479 |
  JSL $0CE4E9                     ; $03E47B |
  LDA $7680,x                     ; $03E47F |
  CMP #$00F4                      ; $03E482 |
  BMI CODE_03E49C                 ; $03E485 |
  LDA $7A98,x                     ; $03E487 |
  BNE CODE_03E49B                 ; $03E48A |
  LDA $7402,x                     ; $03E48C |
  EOR #$0003                      ; $03E48F |
  STA $7402,x                     ; $03E492 |
  LDA #$0004                      ; $03E495 |
  STA $7A98,x                     ; $03E498 |

CODE_03E49B:
  RTL                             ; $03E49B |

CODE_03E49C:
  LDA #$0006                      ; $03E49C |
  STA $7402,x                     ; $03E49F |
  LDA #$0020                      ; $03E4A2 |
  STA $7540,x                     ; $03E4A5 |
  LDA $7220,x                     ; $03E4A8 |
  BMI CODE_03E49B                 ; $03E4AB |
  STZ $7220,x                     ; $03E4AD |
  STZ $7540,x                     ; $03E4B0 |
  SEP #$20                        ; $03E4B3 |
  LDY #$13                        ; $03E4B5 |
  STY $17,x                       ; $03E4B7 |
  LDA $E4CC,y                     ; $03E4B9 |
  STA $7402,x                     ; $03E4BC |
  LDA $E4E0,y                     ; $03E4BF |
  STA $7A98,x                     ; $03E4C2 |
  INC $16,x                       ; $03E4C5 |
  INC $16,x                       ; $03E4C7 |
  REP #$20                        ; $03E4C9 |
  RTL                             ; $03E4CB |

; data table
DATA_03E4CC:         db $05, $05, $04, $03
DATA_03E4D0:         db $04, $05, $04, $03
DATA_03E4D4:         db $04, $05, $04, $03
DATA_03E4D8:         db $04, $05, $04, $03
DATA_03E4DC:         db $04, $05, $04, $03

; data table
DATA_03E4E0:         db $02, $06, $02, $06
DATA_03E4E4:         db $02, $06, $02, $06
DATA_03E4E8:         db $02, $06, $02, $06
DATA_03E4EC:         db $02, $06, $02, $06
DATA_03E4F0:         db $02, $06, $02, $06

; $E42D table sub
  LDX $12                         ; $03E4F4 |
  JSL $0CE4E9                     ; $03E4F6 |
  LDA $7A98,x                     ; $03E4FA |
  BNE CODE_03E526                 ; $03E4FD |
  LDY $17,x                       ; $03E4FF |
  DEY                             ; $03E501 |
  BMI CODE_03E527                 ; $03E502 |
  STY $17,x                       ; $03E504 |
  SEP #$20                        ; $03E506 |
  LDA $E4CC,y                     ; $03E508 |
  STA $7402,x                     ; $03E50B |
  LDA $E4E0,y                     ; $03E50E |
  STA $7A98,x                     ; $03E511 |
  REP #$20                        ; $03E514 |
  TYA                             ; $03E516 |
  AND #$0007                      ; $03E517 |
  CMP #$0007                      ; $03E51A |
  BNE CODE_03E526                 ; $03E51D |
  LDA #$005B                      ; $03E51F |\ play sound #$005B
  JSL $0085D2                     ; $03E522 |/

CODE_03E526:
  RTL                             ; $03E526 |

CODE_03E527:
  LDA #$0004                      ; $03E527 |
  STA $7402,x                     ; $03E52A |
  LDA #$0115                      ; $03E52D |
  STA $704070                     ; $03E530 |
  INC $0D0F                       ; $03E534 |
  LDY $16,x                       ; $03E537 |
  INY                             ; $03E539 |
  INY                             ; $03E53A |
  STY $16,x                       ; $03E53B |
  RTL                             ; $03E53D |

; $E42D table sub
  LDX $12                         ; $03E53E |
  LDA #$0001                      ; $03E540 |
  STA $7402,x                     ; $03E543 |
  LDA #$F800                      ; $03E546 |
  STA $75E0,x                     ; $03E549 |
  LDA #$0040                      ; $03E54C |
  STA $7540,x                     ; $03E54F |
  LDA #$0800                      ; $03E552 |
  STA $75E2,x                     ; $03E555 |
  LDA #$0010                      ; $03E558 |
  STA $7542,x                     ; $03E55B |
  LDA #$FF00                      ; $03E55E |
  STA $7222,x                     ; $03E561 |
  LDA #$0009                      ; $03E564 |
  STA $004D                       ; $03E567 |
  LDY $16,x                       ; $03E56A |
  INY                             ; $03E56C |
  INY                             ; $03E56D |

CODE_03E56E:
  STY $16,x                       ; $03E56E |
  RTL                             ; $03E570 |

; $E42D table sub
  LDX $12                         ; $03E571 |
  LDA $7680,x                     ; $03E573 |
  CMP #$0080                      ; $03E576 |
  BMI CODE_03E57E                 ; $03E579 |
  JMP CODE_03E640                 ; $03E57B |

CODE_03E57E:
  LDA #$0800                      ; $03E57E |
  STA $75E0,x                     ; $03E581 |
  LDY $16,x                       ; $03E584 |
  INY                             ; $03E586 |
  INY                             ; $03E587 |
  STY $16,x                       ; $03E588 |
  RTL                             ; $03E58A |

; $E42D table sub
  LDX $12                         ; $03E58B |
  LDA $7680,x                     ; $03E58D |
  CMP #$0140                      ; $03E590 |
  BCC CODE_03E5F1                 ; $03E593 |
  LDX #$1C                        ; $03E595 |

CODE_03E597:
  LDA $5FF556,x                   ; $03E597 |
  STA $702F2E,x                   ; $03E59B |
  STA $7021C2,x                   ; $03E59F |
  DEX                             ; $03E5A3 |
  DEX                             ; $03E5A4 |
  BPL CODE_03E597                 ; $03E5A5 |
  LDX $12                         ; $03E5A7 |
  SEP #$20                        ; $03E5A9 |
  LDY $105E                       ; $03E5AB |
  LDA #$FF                        ; $03E5AE |
  STA $74A2,y                     ; $03E5B0 |
  REP #$20                        ; $03E5B3 |
  STZ $7402,x                     ; $03E5B5 |
  STZ $7400,x                     ; $03E5B8 |
  LDA $7042,x                     ; $03E5BB |
  AND #$FFF1                      ; $03E5BE |
  ORA #$000C                      ; $03E5C1 |
  STA $7042,x                     ; $03E5C4 |
  LDA $7040,x                     ; $03E5C7 |
  AND #$07FF                      ; $03E5CA |
  ORA #$2000                      ; $03E5CD |
  STA $7040,x                     ; $03E5D0 |
  LDA #$0100                      ; $03E5D3 |
  STA $76,x                       ; $03E5D6 |
  STZ $7220,x                     ; $03E5D8 |
  STZ $7222,x                     ; $03E5DB |
  STZ $7540,x                     ; $03E5DE |
  STZ $7542,x                     ; $03E5E1 |
  LDA #$0020                      ; $03E5E4 |
  STA $7A98,x                     ; $03E5E7 |
  LDY $16,x                       ; $03E5EA |
  INY                             ; $03E5EC |
  INY                             ; $03E5ED |
  STY $16,x                       ; $03E5EE |
  RTL                             ; $03E5F0 |

CODE_03E5F1:
  LDY #$00                        ; $03E5F1 |
  LDA $7220,x                     ; $03E5F3 |
  BMI CODE_03E5FA                 ; $03E5F6 |
  INY                             ; $03E5F8 |
  INY                             ; $03E5F9 |

CODE_03E5FA:
  TYA                             ; $03E5FA |
  STA $7400,x                     ; $03E5FB |
  LDA $7222,x                     ; $03E5FE |
  BMI CODE_03E611                 ; $03E601 |
  LDA $7682,x                     ; $03E603 |
  CMP #$0060                      ; $03E606 |
  BCC CODE_03E611                 ; $03E609 |
  LDA #$F800                      ; $03E60B |
  STA $75E2,x                     ; $03E60E |

CODE_03E611:
  LDA $7220,x                     ; $03E611 |
  CLC                             ; $03E614 |
  ADC #$0080                      ; $03E615 |
  CMP #$0100                      ; $03E618 |
  BCS CODE_03E622                 ; $03E61B |
  LDA #$0007                      ; $03E61D |
  BRA CODE_03E63C                 ; $03E620 |

CODE_03E622:
  CLC                             ; $03E622 |
  ADC #$0100                      ; $03E623 |
  CMP #$0300                      ; $03E626 |
  BCS CODE_03E630                 ; $03E629 |
  LDA #$0006                      ; $03E62B |
  BRA CODE_03E63C                 ; $03E62E |

CODE_03E630:
  CLC                             ; $03E630 |
  ADC #$0100                      ; $03E631 |
  CMP #$0500                      ; $03E634 |
  BCS CODE_03E640                 ; $03E637 |
  LDA #$0003                      ; $03E639 |

CODE_03E63C:
  STA $7402,x                     ; $03E63C |
  RTL                             ; $03E63F |

CODE_03E640:
  LDA $14                         ; $03E640 | entry point
  LSR A                           ; $03E642 |
  LSR A                           ; $03E643 |
  AND #$0001                      ; $03E644 |
  INC A                           ; $03E647 |
  STA $7402,x                     ; $03E648 |
  LDA $7400,x                     ; $03E64B |
  BEQ CODE_03E67A                 ; $03E64E |
  LDY $105E                       ; $03E650 |
  LDA $70E2,x                     ; $03E653 |
  CMP $70E2,y                     ; $03E656 |
  BCC CODE_03E67A                 ; $03E659 |
  LDA #$002F                      ; $03E65B |
  STA $7402,y                     ; $03E65E |
  LDA #$0000                      ; $03E661 |
  STA $7542,y                     ; $03E664 |
  STA $7222,y                     ; $03E667 |
  LDA $70E2,x                     ; $03E66A |
  STA $70E2,y                     ; $03E66D |
  LDA $7182,x                     ; $03E670 |
  CLC                             ; $03E673 |
  ADC #$0010                      ; $03E674 |
  STA $7182,y                     ; $03E677 |

CODE_03E67A:
  RTL                             ; $03E67A |

; $E42D table sub
  LDX $12                         ; $03E67B |
  LDA $7A98,x                     ; $03E67D |
  BNE CODE_03E6AD                 ; $03E680 |
  LDA $76,x                       ; $03E682 |
  ASL A                           ; $03E684 |
  ASL A                           ; $03E685 |
  EOR #$FFFF                      ; $03E686 |
  INC A                           ; $03E689 |
  STA $7220,x                     ; $03E68A |
  LDA #$FFF0                      ; $03E68D |
  STA $7222,x                     ; $03E690 |
  LDA $0039                       ; $03E693 |
  CLC                             ; $03E696 |
  ADC #$0110                      ; $03E697 |
  STA $70E2,x                     ; $03E69A |
  LDA $003B                       ; $03E69D |
  CLC                             ; $03E6A0 |
  ADC #$0038                      ; $03E6A1 |
  STA $7182,x                     ; $03E6A4 |
  LDY $16,x                       ; $03E6A7 |
  INY                             ; $03E6A9 |
  INY                             ; $03E6AA |
  STY $16,x                       ; $03E6AB |

CODE_03E6AD:
  RTL                             ; $03E6AD |

; $E42D table sub
  LDX $12                         ; $03E6AE |
  LDA $7680,x                     ; $03E6B0 |
  CMP #$00E0                      ; $03E6B3 |
  BPL CODE_03E6E5                 ; $03E6B6 |
  LDA $76,x                       ; $03E6B8 |
  SEC                             ; $03E6BA |
  SBC #$0003                      ; $03E6BB |
  BMI CODE_03E6D0                 ; $03E6BE |
  STA $76,x                       ; $03E6C0 |
  ASL A                           ; $03E6C2 |
  ASL A                           ; $03E6C3 |
  EOR #$FFFF                      ; $03E6C4 |
  INC A                           ; $03E6C7 |
  STA $7220,x                     ; $03E6C8 |
  JSR CODE_03E762                 ; $03E6CB |
  BRA CODE_03E6E5                 ; $03E6CE |

CODE_03E6D0:
  LDA $7680,x                     ; $03E6D0 |
  CMP #$0020                      ; $03E6D3 |
  BPL CODE_03E6E5                 ; $03E6D6 |
  STZ $7220,x                     ; $03E6D8 |
  STZ $7222,x                     ; $03E6DB |
  LDY $16,x                       ; $03E6DE |
  INY                             ; $03E6E0 |
  INY                             ; $03E6E1 |
  STY $16,x                       ; $03E6E2 |
  RTL                             ; $03E6E4 |

CODE_03E6E5:
  LDA $7220,x                     ; $03E6E5 |
  BEQ CODE_03E6EF                 ; $03E6E8 |
  CMP #$FFF0                      ; $03E6EA |
  BCC CODE_03E6F5                 ; $03E6ED |

CODE_03E6EF:
  LDA #$FFF0                      ; $03E6EF |
  STA $7220,x                     ; $03E6F2 |

CODE_03E6F5:
  RTL                             ; $03E6F5 |

; $E42D table sub
  LDX $12                         ; $03E6F6 |
  LDY $105E                       ; $03E6F8 |
  LDA $79D6,y                     ; $03E6FB |
  INC A                           ; $03E6FE |
  STA $79D6,y                     ; $03E6FF |
  LDA #$0040                      ; $03E702 |
  STA $7A96,y                     ; $03E705 |
  JML $03A31E                     ; $03E708 |

CODE_03E70C:
  LDY $74A2,x                     ; $03E70C |
  CMP #$00FF                      ; $03E70F |
  BEQ CODE_03E761                 ; $03E712 |
  LDA $0D0F                       ; $03E714 |
  BNE CODE_03E761                 ; $03E717 |
  LDA $7722,x                     ; $03E719 |
  BMI CODE_03E761                 ; $03E71C |
  REP #$10                        ; $03E71E |
  LDA #$0000                      ; $03E720 |
  STA $300A                       ; $03E723 |
  LDA $76,x                       ; $03E726 |
  CMP #$0018                      ; $03E728 |
  BPL CODE_03E730                 ; $03E72B |
  LDA #$0018                      ; $03E72D |

CODE_03E730:
  STA $300C                       ; $03E730 |
  LDA #$A080                      ; $03E733 |
  STA $3018                       ; $03E736 |
  LDA #$0054                      ; $03E739 |
  STA $301A                       ; $03E73C |
  LDY $7722,x                     ; $03E73F |
  TYX                             ; $03E742 |
  LDA $03A9CE,x                   ; $03E743 |
  STA $3006                       ; $03E747 |
  LDA $03A9EE,x                   ; $03E74A |
  STA $3004                       ; $03E74E |
  SEP #$10                        ; $03E751 |
  LDX #$08                        ; $03E753 |
  LDA #$8205                      ; $03E755 |
  JSL $7EDE44                     ; $03E758 | GSU init
  INC $0CF9                       ; $03E75C |
  LDX $12                         ; $03E75F |

CODE_03E761:
  RTS                             ; $03E761 |

; s sub
CODE_03E762:
  LDA #$5574                      ; $03E762 |
  STA $301C                       ; $03E765 |
  LDA #$0000                      ; $03E768 |
  STA $3000                       ; $03E76B |
  LDA #$0100                      ; $03E76E |
  SEC                             ; $03E771 |
  SBC $76,x                       ; $03E772 |
  STA $300C                       ; $03E774 |
  LDA #$00E1                      ; $03E777 |
  STA $3010                       ; $03E77A |
  LDA #$000F                      ; $03E77D |
  STA $3018                       ; $03E780 |
  LDX #$08                        ; $03E783 |
  LDA #$E167                      ; $03E785 |
  JSL $7EDE44                     ; $03E788 | GSU init
  LDX $12                         ; $03E78C |
  RTS                             ; $03E78E |

; $E411 table sub
  LDX $12                         ; $03E78F |
  JSL $03AF23                     ; $03E791 |
  LDY $16,x                       ; $03E795 |
  TYX                             ; $03E797 |
  JMP ($E79B,x)                   ; $03E798 | pointer table

; pointer table
DATA_03E79B:         dw $E7A7
DATA_03E79D:         dw $E7F8
DATA_03E79F:         dw $E827
DATA_03E7A1:         dw $E88E

; data constant
DATA_03E7A3:         dw $0120

; data constant
DATA_03E7A5:         dw $FFD0

; $E79B table sub
  LDX $12                         ; $03E7A7 |
  LDA $7A96,x                     ; $03E7A9 |
  BNE CODE_03E7F7                 ; $03E7AC |
  STZ $7400,x                     ; $03E7AE |
  LDA $0039                       ; $03E7B1 |
  CLC                             ; $03E7B4 |
  ADC $E7A3                       ; $03E7B5 | constant
  STA $70E2,x                     ; $03E7B8 |
  LDA $003B                       ; $03E7BB |
  CLC                             ; $03E7BE |
  ADC #$0030                      ; $03E7BF |
  STA $7182,x                     ; $03E7C2 |
  LDA #$FE00                      ; $03E7C5 |
  STA $7220,x                     ; $03E7C8 |
  LDA $021A                       ; $03E7CB |
  CMP #$0038                      ; $03E7CE |
  BEQ CODE_03E7DE                 ; $03E7D1 |
  LDA $7042,x                     ; $03E7D3 |
  EOR #$0020                      ; $03E7D6 |
  STA $7042,x                     ; $03E7D9 |
  BRA CODE_03E7E7                 ; $03E7DC |

CODE_03E7DE:
  LDA $7042,x                     ; $03E7DE |
  EOR #$0020                      ; $03E7E1 |
  STA $7042,x                     ; $03E7E4 |

CODE_03E7E7:
  SEP #$20                        ; $03E7E7 |
  STZ $74A2,x                     ; $03E7E9 |
  LDA #$40                        ; $03E7EC |
  STA $70E0,x                     ; $03E7EE |
  INC $16,x                       ; $03E7F1 |
  INC $16,x                       ; $03E7F3 |
  REP #$20                        ; $03E7F5 |

CODE_03E7F7:
  RTL                             ; $03E7F7 |

; $E79B table sub
  LDX $12                         ; $03E7F8 |
  LDA $14                         ; $03E7FA |
  LSR A                           ; $03E7FC |
  LSR A                           ; $03E7FD |
  AND #$0001                      ; $03E7FE |
  CLC                             ; $03E801 |
  ADC #$0008                      ; $03E802 |
  STA $7402,x                     ; $03E805 |
  LDA $7680,x                     ; $03E808 |
  CMP #$FFD0                      ; $03E80B |
  BPL CODE_03E826                 ; $03E80E |
  STZ $7220,x                     ; $03E810 |
  LDA #$003C                      ; $03E813 |
  STA $7A96,x                     ; $03E816 |
  SEP #$20                        ; $03E819 |
  LDA #$FF                        ; $03E81B |
  STA $74A2,x                     ; $03E81D |
  INC $16,x                       ; $03E820 |
  INC $16,x                       ; $03E822 |
  REP #$20                        ; $03E824 |

CODE_03E826:
  RTL                             ; $03E826 |

; $E79B table sub
  LDX $12                         ; $03E827 |
  LDA $7A96,x                     ; $03E829 |
  BNE CODE_03E881                 ; $03E82C |
  LDA #$0002                      ; $03E82E |
  STA $7400,x                     ; $03E831 |
  LDA $0039                       ; $03E834 |
  CLC                             ; $03E837 |
  ADC $E7A5                       ; $03E838 | constant
  STA $70E2,x                     ; $03E83B |
  LDA $6090                       ; $03E83E |
  CLC                             ; $03E841 |
  ADC #$0010                      ; $03E842 |
  STA $7182,x                     ; $03E845 |
  LDA #$0480                      ; $03E848 |
  STA $7220,x                     ; $03E84B |
  LDA $021A                       ; $03E84E |
  CMP #$0038                      ; $03E851 |
  BEQ CODE_03E861                 ; $03E854 |
  LDA $7042,x                     ; $03E856 |
  EOR #$0020                      ; $03E859 |
  STA $7042,x                     ; $03E85C |
  BRA CODE_03E86A                 ; $03E85F |

CODE_03E861:
  LDA $7042,x                     ; $03E861 |
  EOR #$0020                      ; $03E864 |
  STA $7042,x                     ; $03E867 |

CODE_03E86A:
  SEP #$20                        ; $03E86A |
  LDA #$02                        ; $03E86C |
  STA $74A2,x                     ; $03E86E |
  STZ $70E0,x                     ; $03E871 |
  INC $16,x                       ; $03E874 |
  INC $16,x                       ; $03E876 |
  REP #$20                        ; $03E878 |
  LDA #$009A                      ; $03E87A |
  JML $0085D2                     ; $03E87D |

CODE_03E881:
  CMP #$0020                      ; $03E881 |
  BNE CODE_03E88D                 ; $03E884 |
  LDA #$005B                      ; $03E886 |
  JML $0085D2                     ; $03E889 |

CODE_03E88D:
  RTL                             ; $03E88D |

; $E79B table sub
  LDX $12                         ; $03E88E |
  JSL $03A5B7                     ; $03E890 |
  LDA $14                         ; $03E894 |
  LSR A                           ; $03E896 |
  LSR A                           ; $03E897 |
  AND #$0001                      ; $03E898 |
  INC A                           ; $03E89B |
  STA $7402,x                     ; $03E89C |
  LDA $7680,x                     ; $03E89F |
  CMP #$0120                      ; $03E8A2 |
  BMI CODE_03E8BB                 ; $03E8A5 |
  LDA #$003C                      ; $03E8A7 |
  STA $7A96,x                     ; $03E8AA |
  STZ $7220,x                     ; $03E8AD |
  SEP #$20                        ; $03E8B0 |
  LDA #$FF                        ; $03E8B2 |
  STA $74A2,x                     ; $03E8B4 |
  STZ $16,x                       ; $03E8B7 |
  REP #$20                        ; $03E8B9 |

CODE_03E8BB:
  RTL                             ; $03E8BB |

; address table
DATA_03E8BC:         dw $E954
DATA_03E8BE:         dw $E993
DATA_03E8C0:         dw $E9A2
DATA_03E8C2:         dw $EA62
DATA_03E8C4:         dw $EB50
DATA_03E8C6:         dw $E9CC
DATA_03E8C8:         dw $E9E4
DATA_03E8CA:         dw $E9F5

; data table
DATA_03E8CC:         dw $0000, $0002

; the 1up balloon thing
init_inflating_balloon:
  JSL $03D3F8                     ; $03E8D0 |
  BEQ CODE_03E8DA                 ; $03E8D4 |
  JML $03A31E                     ; $03E8D6 |

CODE_03E8DA:
  LDA $70E2,x                     ; $03E8DA |
  STA $7A36,x                     ; $03E8DD |
  LDA $7182,x                     ; $03E8E0 |
  STA $7A38,x                     ; $03E8E3 |
  JSL $03AE60                     ; $03E8E6 |
  LDY $7900,x                     ; $03E8EA |
  BNE CODE_03E90A                 ; $03E8ED |
  SEP #$20                        ; $03E8EF |
  LDA #$20                        ; $03E8F1 |
  STA $7901,x                     ; $03E8F3 |
  LDA #$02                        ; $03E8F6 |
  STA $7902,x                     ; $03E8F8 |
  LDA $70E2,x                     ; $03E8FB |
  AND #$10                        ; $03E8FE |
  LSR A                           ; $03E900 |
  LSR A                           ; $03E901 |
  LSR A                           ; $03E902 |
  INC A                           ; $03E903 |
  STA $7900,x                     ; $03E904 |
  TAY                             ; $03E907 |
  REP #$20                        ; $03E908 |

CODE_03E90A:
  DEY                             ; $03E90A |
  BEQ CODE_03E915                 ; $03E90B |
  LDY #$0A                        ; $03E90D |
  STY $18,x                       ; $03E90F |
  LDY $7900,x                     ; $03E911 |
  DEY                             ; $03E914 |

CODE_03E915:
  LDA $7042,x                     ; $03E915 |
  ORA $E8CC,y                     ; $03E918 |
  STA $7042,x                     ; $03E91B |
  JSR CODE_03EC0B                 ; $03E91E |
  RTL                             ; $03E921 |

; small sub, possibly unused
  LDX $12                         ; $03E922 |
  RTS                             ; $03E924 |

main_inflating_balloon:
  JSL $03AA52                     ; $03E925 |
  JSR CODE_03EC0B                 ; $03E929 |
  LDA $6F00,x                     ; $03E92C |
  CMP #$0008                      ; $03E92F |
  BNE CODE_03E940                 ; $03E932 |
  LDA $7A36,x                     ; $03E934 |
  STA $04                         ; $03E937 |
  LDA $7A38,x                     ; $03E939 |
  JSL $03D3F3                     ; $03E93C |

CODE_03E940:
  JSL $03AF23                     ; $03E940 |
  LDY $18,x                       ; $03E944 |
  CMP #$0008                      ; $03E946 |
  BEQ CODE_03E94E                 ; $03E949 |
  JSR CODE_03EB95                 ; $03E94B |

CODE_03E94E:
  LDY $18,x                       ; $03E94E |
  TYX                             ; $03E950 |
  JMP ($E8BC,x)                   ; $03E951 | table address

; $E8BC table address
  LDX $12                         ; $03E954 |
  JSR CODE_03EC91                 ; $03E956 |
  LDA $7860,x                     ; $03E959 |
  AND #$0001                      ; $03E95C |
  BNE CODE_03E98E                 ; $03E95F |
  LDA $70E2,x                     ; $03E961 |
  SEC                             ; $03E964 |
  SBC $608C                       ; $03E965 |
  CLC                             ; $03E968 |
  ADC #$0060                      ; $03E969 |
  CMP #$00C0                      ; $03E96C |
  BCS CODE_03E98D                 ; $03E96F |
  LDA $7182,x                     ; $03E971 |
  SEC                             ; $03E974 |
  SBC $6090                       ; $03E975 |
  CLC                             ; $03E978 |
  ADC #$0060                      ; $03E979 |
  CMP #$00C0                      ; $03E97C |
  BCS CODE_03E98D                 ; $03E97F |
  LDA #$0040                      ; $03E981 |
  STA $7542,x                     ; $03E984 |
  LDA #$0400                      ; $03E987 |
  STA $75E2,x                     ; $03E98A |

CODE_03E98D:
  RTL                             ; $03E98D |

CODE_03E98E:
  LDY #$02                        ; $03E98E |
  STY $18,x                       ; $03E990 |
  RTL                             ; $03E992 |

; $E8BC table address
  LDX $12                         ; $03E993 |
  JSR CODE_03EC91                 ; $03E995 |
  JSR CODE_03EA3B                 ; $03E998 |
  BCS CODE_03E9A1                 ; $03E99B |
  LDY #$04                        ; $03E99D |
  STY $18,x                       ; $03E99F |

CODE_03E9A1:
  RTL                             ; $03E9A1 |

; $E8BC table address
CODE_03E9A2:
  LDX $12                         ; $03E9A2 |
  SEP #$20                        ; $03E9A4 |
  LDA $7901,x                     ; $03E9A6 |
  CLC                             ; $03E9A9 |
  ADC #$02                        ; $03E9AA |
  BCS CODE_03E9B4                 ; $03E9AC |
  STA $7901,x                     ; $03E9AE |
  REP #$20                        ; $03E9B1 |
  RTL                             ; $03E9B3 |

CODE_03E9B4:
  LDA #$FF                        ; $03E9B4 |
  STA $7901,x                     ; $03E9B6 |
  LDA #$06                        ; $03E9B9 |
  STA $18,x                       ; $03E9BB |
  LDA #$08                        ; $03E9BD |
  STA $7A96,x                     ; $03E9BF |
  REP #$20                        ; $03E9C2 |
  LDA #$0050                      ; $03E9C4 |\ play sound #$0050
  JSL $0085D2                     ; $03E9C7 |/
  RTL                             ; $03E9CB |

; $E8BC table address
  LDX $12                         ; $03E9CC |
  JSR CODE_03EC91                 ; $03E9CE |
  JSR CODE_03EA3B                 ; $03E9D1 |
  BCS CODE_03E9E3                 ; $03E9D4 |
  LDA #$0010                      ; $03E9D6 |
  STA $7540,x                     ; $03E9D9 |
  STA $7542,x                     ; $03E9DC |
  LDY #$0C                        ; $03E9DF |
  STY $18,x                       ; $03E9E1 |

CODE_03E9E3:
  RTL                             ; $03E9E3 |

; $E8BC table address
  LDX $12                         ; $03E9E4 |
  JSR CODE_03EC91                 ; $03E9E6 |
  LDY $7901,x                     ; $03E9E9 |
  CPY #$80                        ; $03E9EC |
  BNE CODE_03E9F4                 ; $03E9EE |
  LDY #$0E                        ; $03E9F0 |
  STY $18,x                       ; $03E9F2 |

CODE_03E9F4:
  RTL                             ; $03E9F4 |

; $E8BC table address
  LDX $12                         ; $03E9F5 |
  JSR CODE_03E9FD                 ; $03E9F7 |
  JMP CODE_03E9A2                 ; $03E9FA |

; s sub
CODE_03E9FD:
  LDA $611C                       ; $03E9FD |
  STA $3002                       ; $03EA00 |
  LDA $611E                       ; $03EA03 |
  STA $3004                       ; $03EA06 |
  LDA $7CD6,x                     ; $03EA09 |
  STA $3006                       ; $03EA0C |
  LDA $7CD8,x                     ; $03EA0F |
  STA $3008                       ; $03EA12 |
  LDA #$0080                      ; $03EA15 |
  STA $300C                       ; $03EA18 |
  LDX #$09                        ; $03EA1B |
  LDA #$907C                      ; $03EA1D |
  JSL $7EDE44                     ; $03EA20 | GSU init
  LDX $12                         ; $03EA24 |
  LDA $3002                       ; $03EA26 |
  EOR #$FFFF                      ; $03EA29 |
  INC A                           ; $03EA2C |
  STA $75E0,x                     ; $03EA2D |
  LDA $3004                       ; $03EA30 |
  EOR #$FFFF                      ; $03EA33 |
  INC A                           ; $03EA36 |
  STA $75E2,x                     ; $03EA37 |
  RTS                             ; $03EA3A |

; s sub
CODE_03EA3B:
  LDA $70E2,x                     ; $03EA3B |
  SEC                             ; $03EA3E |
  SBC $608C                       ; $03EA3F |
  CLC                             ; $03EA42 |
  ADC #$0060                      ; $03EA43 |
  CMP #$00C0                      ; $03EA46 |
  BCS CODE_03EA59                 ; $03EA49 |
  LDA $7182,x                     ; $03EA4B |
  SEC                             ; $03EA4E |
  SBC $6090                       ; $03EA4F |
  CLC                             ; $03EA52 |
  ADC #$0060                      ; $03EA53 |
  CMP #$00C0                      ; $03EA56 |

CODE_03EA59:
  RTS                             ; $03EA59 |

; data table
DATA_03EA5A:         dw $0000
DATA_03EA5C:         dw $0002
DATA_03EA5E:         dw $0004
DATA_03EA60:         dw $0008

; $E8BC table address
  LDX $12                         ; $03EA62 |
  LDA $7A96,x                     ; $03EA64 |
  BEQ CODE_03EA89                 ; $03EA67 |
  BIT #$000F                      ; $03EA69 |
  BNE CODE_03EA77                 ; $03EA6C |
  PHA                             ; $03EA6E |
  LDA #$0050                      ; $03EA6F |\ play sound #$0050
  JSL $0085D2                     ; $03EA72 |/
  PLA                             ; $03EA76 |

CODE_03EA77:
  AND #$000C                      ; $03EA77 |
  LSR A                           ; $03EA7A |
  TAY                             ; $03EA7B |
  LDA $7042,x                     ; $03EA7C |
  AND #$FFF1                      ; $03EA7F |
  ORA $EA5A,y                     ; $03EA82 |
  STA $7042,x                     ; $03EA85 |
  RTL                             ; $03EA88 |

CODE_03EA89:
  LDA #$01EE                      ; $03EA89 |
  JSL $008B21                     ; $03EA8C |
  LDA $7CD6,x                     ; $03EA90 |
  STA $70A2,y                     ; $03EA93 |
  LDA $7CD8,x                     ; $03EA96 |
  STA $7142,y                     ; $03EA99 |
  LDA #$0002                      ; $03EA9C |
  STA $7782,y                     ; $03EA9F |
  LDA #$0008                      ; $03EAA2 |
  STA $73C2,y                     ; $03EAA5 |
  LDA #$003B                      ; $03EAA8 |\ play sound #$003B
  JSL $0085D2                     ; $03EAAB |/
  SEP #$20                        ; $03EAAF |
  LDA #$FF                        ; $03EAB1 |
  STA $74A0,x                     ; $03EAB3 |
  REP #$20                        ; $03EAB6 |
  LDA $7CD6,x                     ; $03EAB8 |
  SEC                             ; $03EABB |
  SBC $611C                       ; $03EABC |
  CLC                             ; $03EABF |
  ADC #$0028                      ; $03EAC0 |
  CMP #$0050                      ; $03EAC3 |
  BCS CODE_03EADC                 ; $03EAC6 |
  LDA $7CD8,x                     ; $03EAC8 |
  SEC                             ; $03EACB |
  SBC $611E                       ; $03EACC |
  CLC                             ; $03EACF |
  ADC #$0028                      ; $03EAD0 |
  CMP #$0050                      ; $03EAD3 |
  BCS CODE_03EADC                 ; $03EAD6 |
  JSL $03A858                     ; $03EAD8 |

CODE_03EADC:
  LDA $7A36,x                     ; $03EADC |
  STA $04                         ; $03EADF |
  LDA $7A38,x                     ; $03EAE1 |
  JSL $03D3F3                     ; $03EAE4 |
  JSL $03A31E                     ; $03EAE8 |
  LDY $7900,x                     ; $03EAEC |
  DEY                             ; $03EAEF |
  LDA $E8CC,y                     ; $03EAF0 |
  INC A                           ; $03EAF3 |
  STA $00                         ; $03EAF4 |
  LDA #$008D                      ; $03EAF6 |
  JSL $03A364                     ; $03EAF9 |
  BCC CODE_03EB4B                 ; $03EAFD |
  LDA $70E2,x                     ; $03EAFF |
  STA $70E2,y                     ; $03EB02 |
  LDA $7182,x                     ; $03EB05 |
  STA $7182,y                     ; $03EB08 |
  LDA #$FC00                      ; $03EB0B |
  STA $75E2,y                     ; $03EB0E |
  LDA #$0040                      ; $03EB11 |
  STA $7542,y                     ; $03EB14 |
  LDA #$0000                      ; $03EB17 |
  STA $7220,y                     ; $03EB1A |
  STA $79D6,y                     ; $03EB1D |
  LDA $7040,y                     ; $03EB20 |
  AND #$07FF                      ; $03EB23 |
  ORA #$2800                      ; $03EB26 |
  STA $7040,y                     ; $03EB29 |
  LDA $00                         ; $03EB2C |
  STA $7902,y                     ; $03EB2E |
  DEC A                           ; $03EB31 |
  ORA $7042,y                     ; $03EB32 |
  STA $7042,y                     ; $03EB35 |
  SEP #$20                        ; $03EB38 |
  LDA #$05                        ; $03EB3A |
  STA $74A2,y                     ; $03EB3C |
  LDA #$02                        ; $03EB3F |
  STA $7900,y                     ; $03EB41 |
  LDA #$02                        ; $03EB44 |
  STA $7AF8,y                     ; $03EB46 |
  REP #$20                        ; $03EB49 |

CODE_03EB4B:
  RTL                             ; $03EB4B |

; data table
DATA_03EB4C:         dw $0800
DATA_03EB4E:         dw $F800

; $E8BC table address
  LDX $12                         ; $03EB50 |
  LDA $7220,x                     ; $03EB52 |
  EOR $76,x                       ; $03EB55 |
  BMI CODE_03EB6B                 ; $03EB57 |
  LDY $7D36,x                     ; $03EB59 |
  BMI CODE_03EB8A                 ; $03EB5C |
  DEY                             ; $03EB5E |
  BMI CODE_03EB6E                 ; $03EB5F |
  BEQ CODE_03EB6E                 ; $03EB61 |
  LDA $6F00,y                     ; $03EB63 |
  CMP #$0010                      ; $03EB66 |
  BNE CODE_03EB6E                 ; $03EB69 |

CODE_03EB6B:
  JMP CODE_03EA89                 ; $03EB6B |

CODE_03EB6E:
  SEP #$20                        ; $03EB6E |
  LDA #$00                        ; $03EB70 |
  LDY $7221,x                     ; $03EB72 |
  BMI CODE_03EB79                 ; $03EB75 |
  INC A                           ; $03EB77 |
  INC A                           ; $03EB78 |

CODE_03EB79:
  EOR $7400,x                     ; $03EB79 |
  TAY                             ; $03EB7C |
  REP #$20                        ; $03EB7D |
  LDA $7976,x                     ; $03EB7F |
  CLC                             ; $03EB82 |
  ADC $EB4C,y                     ; $03EB83 |
  STA $7976,x                     ; $03EB86 |
  RTL                             ; $03EB89 |

CODE_03EB8A:
  JSL $03A858                     ; $03EB8A |
  JMP CODE_03EA89                 ; $03EB8E |

; data table
DATA_03EB91:         dw $FE00
DATA_03EB93:         dw $0200

; s sub
CODE_03EB95:
  LDY $7D36,x                     ; $03EB95 |
  BPL CODE_03EB9B                 ; $03EB98 |
  RTS                             ; $03EB9A |

CODE_03EB9B:
  DEY                             ; $03EB9B |
  BMI CODE_03EBE6                 ; $03EB9C |
  BEQ CODE_03EBE6                 ; $03EB9E |
  LDA $6F00,y                     ; $03EBA0 |
  CMP #$0010                      ; $03EBA3 |
  BNE CODE_03EBE6                 ; $03EBA6 |
  LDA $7D38,y                     ; $03EBA8 |
  BEQ CODE_03EBE6                 ; $03EBAB |
  LDA $70E2,y                     ; $03EBAD |
  STA $00                         ; $03EBB0 |
  TYX                             ; $03EBB2 |
  JSL $03B24B                     ; $03EBB3 |
  LDX $12                         ; $03EBB7 |
  LDA #$0067                      ; $03EBB9 |\ play sound #$0067
  JSL $0085D2                     ; $03EBBC |/
  LDY #$00                        ; $03EBC0 |
  LDA $70E2,x                     ; $03EBC2 |
  SEC                             ; $03EBC5 |
  SBC $00                         ; $03EBC6 |
  BMI CODE_03EBCC                 ; $03EBC8 |
  INY                             ; $03EBCA |
  INY                             ; $03EBCB |

CODE_03EBCC:
  LDA $EB91,y                     ; $03EBCC |
  STA $7220,x                     ; $03EBCF |
  STA $76,x                       ; $03EBD2 |
  LDA #$0040                      ; $03EBD4 |
  STA $7542,x                     ; $03EBD7 |
  LDA #$0400                      ; $03EBDA |
  STA $75E2,x                     ; $03EBDD |
  LDY #$08                        ; $03EBE0 |
  STY $18,x                       ; $03EBE2 |
  PLA                             ; $03EBE4 |\
  RTL                             ; $03EBE5 |/ hack: all the way out of main

CODE_03EBE6:
  RTS                             ; $03EBE6 |

; data table
DATA_03EBE7:         dw $000F, $000F
DATA_03EBEB:         dw $000E, $000D
DATA_03EBEF:         dw $000C, $000B
DATA_03EBF3:         dw $000A, $0009
DATA_03EBF7:         dw $0008, $0007
DATA_03EBFB:         dw $0006, $0005
DATA_03EBFF:         dw $0004, $0003
DATA_03EC03:         dw $0002, $0001
DATA_03EC07:         dw $0000, $0000

CODE_03EC0B:
  LDY $74A2,x                     ; $03EC0B |
  BPL CODE_03EC11                 ; $03EC0E |
  RTS                             ; $03EC10 |

CODE_03EC11:
  LDY $7901,x                     ; $03EC11 |
  TYA                             ; $03EC14 |
  INC A                           ; $03EC15 |
  LSR A                           ; $03EC16 |
  LSR A                           ; $03EC17 |
  LSR A                           ; $03EC18 |
  AND #$00FE                      ; $03EC19 |
  TAY                             ; $03EC1C |
  LDA $EBE7,y                     ; $03EC1D |
  STA $00                         ; $03EC20 |
  REP #$10                        ; $03EC22 |
  LDY $7362,x                     ; $03EC24 |
  LDA $6002,y                     ; $03EC27 |
  CLC                             ; $03EC2A |
  ADC $00                         ; $03EC2B |
  STA $6002,y                     ; $03EC2D |
  LDA $600A,y                     ; $03EC30 |
  CLC                             ; $03EC33 |
  ADC $00                         ; $03EC34 |
  STA $600A,y                     ; $03EC36 |
  LDA $6012,y                     ; $03EC39 |
  CLC                             ; $03EC3C |
  ADC $00                         ; $03EC3D |
  STA $6012,y                     ; $03EC3F |
  LDA $601A,y                     ; $03EC42 |
  CLC                             ; $03EC45 |
  ADC $00                         ; $03EC46 |
  STA $601A,y                     ; $03EC48 |
  SEP #$10                        ; $03EC4B |
  LDA $0D0F                       ; $03EC4D |
  BNE CODE_03EC90                 ; $03EC50 |
  LDY $17,x                       ; $03EC52 |
  TYA                             ; $03EC54 |
  STA $300A                       ; $03EC55 |
  LDY $7901,x                     ; $03EC58 |
  TYA                             ; $03EC5B |
  INC A                           ; $03EC5C |
  STA $300C                       ; $03EC5D |
  REP #$10                        ; $03EC60 |
  LDY $7722,x                     ; $03EC62 |
  TYX                             ; $03EC65 |
  LDA $03A9EE,x                   ; $03EC66 |
  STA $3004                       ; $03EC6A |
  LDA $03A9CE,x                   ; $03EC6D |
  STA $3006                       ; $03EC71 |
  LDA #$C041                      ; $03EC74 |
  STA $3018                       ; $03EC77 |
  LDA #$0054                      ; $03EC7A |
  STA $301A                       ; $03EC7D |
  SEP #$10                        ; $03EC80 |
  LDX #$08                        ; $03EC82 |
  LDA #$8205                      ; $03EC84 |
  JSL $7EDE44                     ; $03EC87 | GSU init
  INC $0CF9                       ; $03EC8B |
  LDX $12                         ; $03EC8E |

CODE_03EC90:
  RTS                             ; $03EC90 |

; s sub
CODE_03EC91:
  SEP #$20                        ; $03EC91 |
  LDA $7901,x                     ; $03EC93 |
  CMP #$80                        ; $03EC96 |
  BCC CODE_03ECA1                 ; $03EC98 |
  LDA #$80                        ; $03EC9A |
  STA $7901,x                     ; $03EC9C |
  BRA CODE_03ECA8                 ; $03EC9F |

CODE_03ECA1:
  CLC                             ; $03ECA1 |
  ADC $7902,x                     ; $03ECA2 |
  STA $7901,x                     ; $03ECA5 |

CODE_03ECA8:
  REP #$20                        ; $03ECA8 |
  RTS                             ; $03ECAA |

; bitmask table
DATA_03ECAB:         dw $3000, $3000
DATA_03ECAF:         dw $4800, $4800

; address table
DATA_03ECB3:         dw $EF92, $EF11
DATA_03ECB7:         dw $EF0A, $EF0A

; data table
DATA_03ECBB:         dw $0003, $000C
DATA_03ECBF:         dw $0003, $0003

; table
DATA_03ECC3:         dw $F258, $F87B
DATA_03ECC7:         dw $F1A4, $F1A4

; most (all?) flying shy guys
init_flyguy:
  JSL $03D3F8                     ; $03ECCB |
  BEQ CODE_03ECD5                 ; $03ECCF |
  JML $03A31E                     ; $03ECD1 |

CODE_03ECD5:
  LDY $7901,x                     ; $03ECD5 |
  BNE CODE_03ECF6                 ; $03ECD8 |
  SEP #$20                        ; $03ECDA |
  LDA $70E2,x                     ; $03ECDC |
  AND #$10                        ; $03ECDF |
  LSR A                           ; $03ECE1 |
  LSR A                           ; $03ECE2 |
  LSR A                           ; $03ECE3 |
  STA $00                         ; $03ECE4 |
  LDA $7182,x                     ; $03ECE6 |
  AND #$10                        ; $03ECE9 |
  LSR A                           ; $03ECEB |
  LSR A                           ; $03ECEC |
  ORA $00                         ; $03ECED |
  INC A                           ; $03ECEF |
  STA $7901,x                     ; $03ECF0 |
  TAY                             ; $03ECF3 |
  REP #$20                        ; $03ECF4 |

CODE_03ECF6:
  DEY                             ; $03ECF6 |
  LDA $7040,x                     ; $03ECF7 |
  ORA $ECAB,y                     ; $03ECFA |
  STA $7040,x                     ; $03ECFD |
  LDA #$001E                      ; $03ED00 |
  STA $7A96,x                     ; $03ED03 |
  LDA $70E2,x                     ; $03ED06 |
  STA $7A36,x                     ; $03ED09 |
  LDA $7182,x                     ; $03ED0C |
  STA $7A38,x                     ; $03ED0F |
  LDA #$0003                      ; $03ED12 |
  STA $7902,x                     ; $03ED15 |
  DEC A                           ; $03ED18 |
  ORA $7042,x                     ; $03ED19 |
  STA $7042,x                     ; $03ED1C |
  RTL                             ; $03ED1F |

main_flyguy:
  LDY $7900,x                     ; $03ED20 |
  TYX                             ; $03ED23 |
  JMP ($ED27,x)                   ; $03ED24 | jump to table address

; address table
DATA_03ED27:         dw $ED2B, $F0D1

; $ED27 table address
  LDX $12                         ; $03ED2B |
  JSR CODE_03F183                 ; $03ED2D |
  JSR CODE_03EECA                 ; $03ED30 |
  JSL $03AF23                     ; $03ED33 |
  JSL $03A5B7                     ; $03ED37 |
  JSR CODE_03F07F                 ; $03ED3B |
  LDA $14                         ; $03ED3E |
  AND #$0003                      ; $03ED40 |
  STA $7402,x                     ; $03ED43 |
  LDY $18,x                       ; $03ED46 |
  TYX                             ; $03ED48 |
  JMP ($ED4C,x)                   ; $03ED49 | jump to table address

; address table
DATA_03ED4C:         dw $ED5A, $ED95
DATA_03ED50:         dw $EE0B, $EE56
DATA_03ED54:         dw $EEB3

; data table
DATA_03ED56:         dw $0120, $FFD0

; $ED4C table address
  LDX $12                         ; $03ED5A |
  LDA $7A96,x                     ; $03ED5C |
  BNE CODE_03ED94                 ; $03ED5F |
  SEP #$20                        ; $03ED61 |
  INC $18,x                       ; $03ED63 |
  INC $18,x                       ; $03ED65 |
  LDA #$05                        ; $03ED67 |
  STA $74A2,x                     ; $03ED69 |
  REP #$20                        ; $03ED6C |
  LDA $0073                       ; $03ED6E |
  STA $7400,x                     ; $03ED71 |
  TAY                             ; $03ED74 |
  LDA $0039                       ; $03ED75 |
  CLC                             ; $03ED78 |
  ADC $ED56,y                     ; $03ED79 |
  STA $70E2,x                     ; $03ED7C |
  LDA $003B                       ; $03ED7F |
  CLC                             ; $03ED82 |
  ADC #$FFC0                      ; $03ED83 |
  STA $7182,x                     ; $03ED86 |
  LDA #$0020                      ; $03ED89 |
  STA $7540,x                     ; $03ED8C |
  STA $7542,x                     ; $03ED8F |
  BRA CODE_03EDAB                 ; $03ED92 |

CODE_03ED94:
  RTL                             ; $03ED94 |

; $ED4C table address
  LDX $12                         ; $03ED95 |
  LDY #$00                        ; $03ED97 |
  LDA $7220,x                     ; $03ED99 |
  BMI CODE_03EDA0                 ; $03ED9C |
  INY                             ; $03ED9E |
  INY                             ; $03ED9F |

CODE_03EDA0:
  TYA                             ; $03EDA0 |
  CMP $7400,x                     ; $03EDA1 |
  BEQ CODE_03EDAB                 ; $03EDA4 |
  LDA $7222,x                     ; $03EDA6 |
  BMI CODE_03EDE1                 ; $03EDA9 |

CODE_03EDAB:
  LDA $7A36,x                     ; $03EDAB |
  STA $3002                       ; $03EDAE |
  LDA $7A38,x                     ; $03EDB1 |
  STA $3004                       ; $03EDB4 |
  LDA $70E2,x                     ; $03EDB7 |
  STA $3006                       ; $03EDBA |
  LDA $7182,x                     ; $03EDBD |
  STA $3008                       ; $03EDC0 |
  LDA #$0200                      ; $03EDC3 |
  STA $300C                       ; $03EDC6 |
  LDX #$09                        ; $03EDC9 |
  LDA #$907C                      ; $03EDCB |
  JSL $7EDE44                     ; $03EDCE | GSU init
  LDX $12                         ; $03EDD2 |
  LDA $3002                       ; $03EDD4 |
  STA $75E0,x                     ; $03EDD7 |
  LDA $3004                       ; $03EDDA |
  STA $75E2,x                     ; $03EDDD |
  RTL                             ; $03EDE0 |

CODE_03EDE1:
  STZ $7540,x                     ; $03EDE1 |
  STZ $7542,x                     ; $03EDE4 |
  STZ $7220,x                     ; $03EDE7 |
  STZ $7222,x                     ; $03EDEA |
  LDA $7182,x                     ; $03EDED |
  STA $78,x                       ; $03EDF0 |
  LDA #$0078                      ; $03EDF2 |
  STA $7A96,x                     ; $03EDF5 |
  LDA $7A36,x                     ; $03EDF8 |
  STA $04                         ; $03EDFB |
  LDA $7A38,x                     ; $03EDFD |
  JSL $03D3F3                     ; $03EE00 |
  LDY $18,x                       ; $03EE04 |
  INY                             ; $03EE06 |
  INY                             ; $03EE07 |
  STY $18,x                       ; $03EE08 |
  RTL                             ; $03EE0A |

; $ED4C table address
  LDX $12                         ; $03EE0B |
  LDA $7A96,x                     ; $03EE0D |
  BEQ CODE_03EE45                 ; $03EE10 |
  TXY                             ; $03EE12 |
  REP #$10                        ; $03EE13 |
  LDX $76,y                       ; $03EE15 |
  LDA $00E9D4,x                   ; $03EE17 |
  CMP #$8000                      ; $03EE1B |
  ROR A                           ; $03EE1E |
  CMP #$8000                      ; $03EE1F |
  ROR A                           ; $03EE22 |
  CMP #$8000                      ; $03EE23 |
  ROR A                           ; $03EE26 |
  CMP #$8000                      ; $03EE27 |
  ROR A                           ; $03EE2A |
  CMP #$8000                      ; $03EE2B |
  ROR A                           ; $03EE2E |
  CLC                             ; $03EE2F |
  ADC $79D8,y                     ; $03EE30 |
  STA $7182,y                     ; $03EE33 |
  TXA                             ; $03EE36 |
  CLC                             ; $03EE37 |
  ADC #$0002                      ; $03EE38 |
  AND #$01FE                      ; $03EE3B |
  STA $79D6,y                     ; $03EE3E |
  SEP #$10                        ; $03EE41 |
  TYX                             ; $03EE43 |
  RTL                             ; $03EE44 |

CODE_03EE45:
  LDA #$0000                      ; $03EE45 |
  STA $76,x                       ; $03EE48 |
  LDY $7400,x                     ; $03EE4A |
  STY $19,x                       ; $03EE4D |
  LDY $18,x                       ; $03EE4F |
  INY                             ; $03EE51 |
  INY                             ; $03EE52 |
  STY $18,x                       ; $03EE53 |
  RTL                             ; $03EE55 |

; $ED4C table address
  LDX $12                         ; $03EE56 |
  LDA $79D6,x                     ; $03EE58 |
  CMP #$0250                      ; $03EE5B |
  BCS CODE_03EEA2                 ; $03EE5E |
  TXY                             ; $03EE60 |
  REP #$10                        ; $03EE61 |
  AND #$01FE                      ; $03EE63 |
  TAX                             ; $03EE66 |
  LDA $00E9D4,x                   ; $03EE67 |
  ASL A                           ; $03EE6B |
  STA $7222,y                     ; $03EE6C |
  LDA $00E954,x                   ; $03EE6F |
  ASL A                           ; $03EE73 |
  PHA                             ; $03EE74 |
  LDA $7979,y                     ; $03EE75 |
  AND #$00FF                      ; $03EE78 |
  BNE CODE_03EE83                 ; $03EE7B |
  PLA                             ; $03EE7D |
  EOR #$FFFF                      ; $03EE7E |
  INC A                           ; $03EE81 |
  PHA                             ; $03EE82 |

CODE_03EE83:
  PLA                             ; $03EE83 |
  STA $7220,y                     ; $03EE84 |
  LDA $79D6,y                     ; $03EE87 |
  CLC                             ; $03EE8A |
  ADC #$0008                      ; $03EE8B |
  STA $79D6,y                     ; $03EE8E |
  SEP #$10                        ; $03EE91 |
  LDX #$00                        ; $03EE93 |
  LDA $7220,y                     ; $03EE95 |
  BMI CODE_03EE9C                 ; $03EE98 |
  INX                             ; $03EE9A |
  INX                             ; $03EE9B |

CODE_03EE9C:
  TXA                             ; $03EE9C |
  STA $7400,y                     ; $03EE9D |
  TYX                             ; $03EEA0 |
  RTL                             ; $03EEA1 |

CODE_03EEA2:
  LDA #$0010                      ; $03EEA2 |
  STA $7A96,x                     ; $03EEA5 |
  LDY #$00                        ; $03EEA8 |
  STY $19,x                       ; $03EEAA |
  LDY $18,x                       ; $03EEAC |
  INY                             ; $03EEAE |
  INY                             ; $03EEAF |
  STY $18,x                       ; $03EEB0 |
  RTL                             ; $03EEB2 |

; $ED4C table address
  LDX $12                         ; $03EEB3 |
  LDA $7A96,x                     ; $03EEB5 |
  BNE CODE_03EEC9                 ; $03EEB8 |
  LDY $19,x                       ; $03EEBA |
  BNE CODE_03EEC9                 ; $03EEBC |
  LDA #$006E                      ; $03EEBE |\ play sound #$006E
  JSL $0085D2                     ; $03EEC1 |/
  LDY #$01                        ; $03EEC5 |
  STY $19,x                       ; $03EEC7 |

CODE_03EEC9:
  RTL                             ; $03EEC9 |

; sub
CODE_03EECA:
  LDA $6F00,x                     ; $03EECA |
  CMP #$0008                      ; $03EECD |
  BNE CODE_03EEE8                 ; $03EED0 |
  JSR CODE_03EEF6                 ; $03EED2 |
  LDA #$001E                      ; $03EED5 |
  TXY                             ; $03EED8 |
  JSL $03A377                     ; $03EED9 |
  LDA $7902,x                     ; $03EEDD |
  DEC A                           ; $03EEE0 |
  ORA $7042,x                     ; $03EEE1 |
  STA $7042,x                     ; $03EEE4 |
  RTS                             ; $03EEE7 |

CODE_03EEE8:
  CMP #$0010                      ; $03EEE8 |
  BEQ CODE_03EEF5                 ; $03EEEB |
  CMP #$000E                      ; $03EEED |
  BEQ CODE_03EEF5                 ; $03EEF0 |
  JSR CODE_03EEF6                 ; $03EEF2 |

CODE_03EEF5:
  RTS                             ; $03EEF5 |

; sub
CODE_03EEF6:
  LDA $7A36,x                     ; $03EEF6 |
  STA $04                         ; $03EEF9 |
  LDA $7A38,x                     ; $03EEFB |
  JSL $03D3F3                     ; $03EEFE |
  LDY $7901,x                     ; $03EF02 |
  DEY                             ; $03EF05 |
  TYX                             ; $03EF06 |
  JMP ($ECB3,x)                   ; $03EF07 | table address

; $ECB3 table address
  LDX $12                         ; $03EF0A |
  JSL $03A496                     ; $03EF0C |
  RTS                             ; $03EF10 |

; $ECB3 table address
  LDX $12                         ; $03EF11 |
  LDA $7A38,x                     ; $03EF13 |
  ASL A                           ; $03EF16 |
  ASL A                           ; $03EF17 |
  ASL A                           ; $03EF18 |
  ASL A                           ; $03EF19 |
  AND #$FF00                      ; $03EF1A |
  ORA #$8000                      ; $03EF1D |
  STA $00                         ; $03EF20 |
  LDA $7A36,x                     ; $03EF22 |
  LSR A                           ; $03EF25 |
  LSR A                           ; $03EF26 |
  LSR A                           ; $03EF27 |
  LSR A                           ; $03EF28 |
  AND #$00FF                      ; $03EF29 |
  ORA $00                         ; $03EF2C |
  STA $0E                         ; $03EF2E |
  LDA #$0009                      ; $03EF30 |\ play sound #$0009
  JSL $0085D2                     ; $03EF33 |/
  LDA #$0115                      ; $03EF37 |
  JSL $03A34C                     ; $03EF3A |
  BCC CODE_03EF62                 ; $03EF3E |
  LDA $70E2,x                     ; $03EF40 |
  STA $70E2,y                     ; $03EF43 |
  LDA $7182,x                     ; $03EF46 |
  CLC                             ; $03EF49 |
  ADC #$0010                      ; $03EF4A |
  STA $7182,y                     ; $03EF4D |
  LDA $7042,x                     ; $03EF50 |
  AND #$FFF1                      ; $03EF53 |
  ORA #$0002                      ; $03EF56 |
  STA $7042,y                     ; $03EF59 |
  LDA $0E                         ; $03EF5C |
  STA $7902,y                     ; $03EF5E |
  RTS                             ; $03EF61 |

CODE_03EF62:
  JSL $0CFF61                     ; $03EF62 |
  LDA #$0115                      ; $03EF66 |
  TXY                             ; $03EF69 |
  JSL $03A377                     ; $03EF6A |
  LDA $7182,x                     ; $03EF6E |
  CLC                             ; $03EF71 |
  ADC #$0010                      ; $03EF72 |
  STA $7182,x                     ; $03EF75 |
  LDA $7042,x                     ; $03EF78 |
  AND #$FFF1                      ; $03EF7B |
  ORA #$0002                      ; $03EF7E |
  STA $7042,x                     ; $03EF81 |
  LDA $0E                         ; $03EF84 |
  STA $7902,x                     ; $03EF86 |
  LDA #$0002                      ; $03EF89 |
  STA $6F00,x                     ; $03EF8C |
  PLA                             ; $03EF8F |\
  PLA                             ; $03EF90 | | ugly hack to exit fully out of updating sprite
  RTL                             ; $03EF91 |/

; $ECB3 table address
  LDX $12                         ; $03EF92 |
  LDA #$0030                      ; $03EF94 |\ play sound #$0030
  JSL $0085D2                     ; $03EF97 |/
  LDA $03B6                       ; $03EF9B |\
  BEQ CODE_03EFB3                 ; $03EF9E | |
  STA $4204                       ; $03EFA0 | |
  LDY #$0A                        ; $03EFA3 | |
  STY $4206                       ; $03EFA5 | |
  NOP                             ; $03EFA8 | | 29 - (star count / 10)
  NOP                             ; $03EFA9 | | store result in $00 (DP)
  NOP                             ; $03EFAA | |
  NOP                             ; $03EFAB | |
  NOP                             ; $03EFAC | |
  NOP                             ; $03EFAD | |
  NOP                             ; $03EFAE | |
  NOP                             ; $03EFAF | |
  LDA $4214                       ; $03EFB0 | |

CODE_03EFB3:
  STA $00                         ; $03EFB3 | |
  LDA #$001D                      ; $03EFB5 | |
  SEC                             ; $03EFB8 | |
  SBC $00                         ; $03EFB9 | |
  STA $00                         ; $03EFBB |/
  LDA #$0004                      ; $03EFBD |
  STA $02                         ; $03EFC0 |

CODE_03EFC2:
  LDA $00                         ; $03EFC2 |
  BPL CODE_03EFDA                 ; $03EFC4 |
  LDA #$0100                      ; $03EFC6 |
  STA $04                         ; $03EFC9 |
  LDA #$0140                      ; $03EFCB |
  STA $06                         ; $03EFCE |
  LDA #$0010                      ; $03EFD0 |
  STA $08                         ; $03EFD3 |
  LDA #$0115                      ; $03EFD5 |
  BRA CODE_03EFE6                 ; $03EFD8 |

CODE_03EFDA:
  LDA #$0180                      ; $03EFDA |
  STA $04                         ; $03EFDD |
  STZ $06                         ; $03EFDF |
  STZ $08                         ; $03EFE1 |
  LDA #$01A2                      ; $03EFE3 |

CODE_03EFE6:
  STA $0A                         ; $03EFE6 |
  JSL $03A364                     ; $03EFE8 |
  BCC CODE_03F038                 ; $03EFEC |
  LDA $70E2,x                     ; $03EFEE |
  STA $70E2,y                     ; $03EFF1 |
  LDA $7182,x                     ; $03EFF4 |
  CLC                             ; $03EFF7 |
  ADC #$0010                      ; $03EFF8 |
  STA $7182,y                     ; $03EFFB |
  JSL $008408                     ; $03EFFE |
  LDA $10                         ; $03F002 |
  AND #$000E                      ; $03F004 |
  TAX                             ; $03F007 |
  LDA $03C74C,x                   ; $03F008 |
  STA $7220,y                     ; $03F00C |
  LDA $10                         ; $03F00F |
  LSR A                           ; $03F011 |
  LSR A                           ; $03F012 |
  LSR A                           ; $03F013 |
  LSR A                           ; $03F014 |
  AND #$000E                      ; $03F015 |
  TAX                             ; $03F018 |
  LDA $03C75C,x                   ; $03F019 |
  STA $7222,y                     ; $03F01D |
  LDX $12                         ; $03F020 |
  LDA $04                         ; $03F022 |
  STA $7A96,y                     ; $03F024 |
  LDA $06                         ; $03F027 |
  STA $7A98,y                     ; $03F029 |
  LDA $08                         ; $03F02C |
  STA $7AF6,y                     ; $03F02E |
  DEC $00                         ; $03F031 |
  DEC $02                         ; $03F033 |
  BPL CODE_03EFC2                 ; $03F035 |
  RTS                             ; $03F037 |

CODE_03F038:
  JSL $0CFF61                     ; $03F038 |
  LDA $0A                         ; $03F03C |
  TXY                             ; $03F03E |
  JSL $03A377                     ; $03F03F |
  LDA $7182,x                     ; $03F043 |
  CLC                             ; $03F046 |
  ADC #$0010                      ; $03F047 |
  STA $7182,y                     ; $03F04A |
  LDA $10                         ; $03F04D |
  AND #$000E                      ; $03F04F |
  TAX                             ; $03F052 |
  LDA $03C74C,x                   ; $03F053 |
  STA $7220,y                     ; $03F057 |
  LDA $10                         ; $03F05A |
  LSR A                           ; $03F05C |
  LSR A                           ; $03F05D |
  LSR A                           ; $03F05E |
  LSR A                           ; $03F05F |
  AND #$000E                      ; $03F060 |
  TAX                             ; $03F063 |
  LDA $03C75C,x                   ; $03F064 |
  STA $7222,y                     ; $03F068 |
  LDX $12                         ; $03F06B |
  LDA $04                         ; $03F06D |
  STA $7A96,y                     ; $03F06F |
  LDA $06                         ; $03F072 |
  STA $7A98,y                     ; $03F074 |
  LDA $08                         ; $03F077 |
  STA $7AF6,y                     ; $03F079 |
  PLA                             ; $03F07C |\
  PLA                             ; $03F07D | | hack: all the way out of main
  RTL                             ; $03F07E |/

; sub
CODE_03F07F:
  LDY $7D36,x                     ; $03F07F |
  DEY                             ; $03F082 |
  BMI CODE_03F0D0                 ; $03F083 |
  BEQ CODE_03F0D0                 ; $03F085 |
  LDA $6F00,y                     ; $03F087 |
  CMP #$0010                      ; $03F08A |
  BNE CODE_03F0D0                 ; $03F08D |
  LDA $7D38,y                     ; $03F08F |
  BEQ CODE_03F0D0                 ; $03F092 |
  TYX                             ; $03F094 |
  JSL $03B24B                     ; $03F095 |
  LDX $12                         ; $03F099 |
  JSR CODE_03EEF6                 ; $03F09B |
  SEP #$20                        ; $03F09E |
  LDA #$FF                        ; $03F0A0 |
  STA $74A0,x                     ; $03F0A2 |
  LDA #$02                        ; $03F0A5 |
  STA $7900,x                     ; $03F0A7 |
  LDA #$02                        ; $03F0AA |
  STA $7AF8,x                     ; $03F0AC |
  REP #$20                        ; $03F0AF |
  LDA #$FE00                      ; $03F0B1 |
  STA $75E2,x                     ; $03F0B4 |
  LDA #$0040                      ; $03F0B7 |
  STA $7542,x                     ; $03F0BA |
  STZ $7220,x                     ; $03F0BD |
  STZ $76,x                       ; $03F0C0 |
  LDA $7040,x                     ; $03F0C2 |
  AND #$07FF                      ; $03F0C5 |
  ORA #$2800                      ; $03F0C8 |
  STA $7040,x                     ; $03F0CB |
  PLA                             ; $03F0CE |\
  RTL                             ; $03F0CF |/ hack: all the way out of main

CODE_03F0D0:
  RTS                             ; $03F0D0 | this one legit returns

; $ED27 table address
  LDX $12                         ; $03F0D1 |
  LDY $74A2,x                     ; $03F0D3 |
  BMI CODE_03F0EF                 ; $03F0D6 |
  LDA #$000C                      ; $03F0D8 |
  STA $3000                       ; $03F0DB |
  LDA #$F8F3                      ; $03F0DE |
  STA $3002                       ; $03F0E1 |
  LDX #$09                        ; $03F0E4 |
  LDA #$AEC1                      ; $03F0E6 |
  JSL $7EDE44                     ; $03F0E9 | GSU init
  LDX $12                         ; $03F0ED |

CODE_03F0EF:
  JSR CODE_03F142                 ; $03F0EF |
  JSL $03AF23                     ; $03F0F2 |
  LDA $7AF8,x                     ; $03F0F6 |
  CMP #$0001                      ; $03F0F9 |
  BNE CODE_03F105                 ; $03F0FC |
  LDA #$006E                      ; $03F0FE |\ play sound #$006E
  JSL $0085D2                     ; $03F101 |/

CODE_03F105:
  JSL $03A5B7                     ; $03F105 |
  JSR CODE_03F15D                 ; $03F109 |
  LDA $14                         ; $03F10C |
  AND #$0003                      ; $03F10E |
  STA $7402,x                     ; $03F111 |
  TXY                             ; $03F114 |
  REP #$10                        ; $03F115 |
  LDX $76,y                       ; $03F117 |
  LDA $00E954,x                   ; $03F119 | foreign table
  CMP #$8000                      ; $03F11D |
  ROR A                           ; $03F120 |
  STA $7220,y                     ; $03F121 |
  LDA $79D6,y                     ; $03F124 |
  CLC                             ; $03F127 |
  ADC #$0002                      ; $03F128 |
  AND #$01FE                      ; $03F12B |
  STA $79D6,y                     ; $03F12E |
  SEP #$10                        ; $03F131 |
  TYX                             ; $03F133 |
  LDY #$00                        ; $03F134 |
  LDA $7220,x                     ; $03F136 |
  BMI CODE_03F13D                 ; $03F139 |
  INY                             ; $03F13B |
  INY                             ; $03F13C |

CODE_03F13D:
  TYA                             ; $03F13D |
  STA $7400,x                     ; $03F13E |
  RTL                             ; $03F141 |

; s sub
CODE_03F142:
  LDA $6F00,x                     ; $03F142 |
  CMP #$0008                      ; $03F145 |
  BNE CODE_03F15C                 ; $03F148 |
  LDA #$001E                      ; $03F14A |
  TXY                             ; $03F14D |
  JSL $03A377                     ; $03F14E |
  LDA $7902,x                     ; $03F152 |
  DEC A                           ; $03F155 |
  ORA $7042,x                     ; $03F156 |
  STA $7042,x                     ; $03F159 |

CODE_03F15C:
  RTS                             ; $03F15C |

; s sub
CODE_03F15D:
  LDY $7D36,x                     ; $03F15D |
  DEY                             ; $03F160 |
  BMI CODE_03F182                 ; $03F161 |
  BEQ CODE_03F182                 ; $03F163 |
  LDA $6F00,y                     ; $03F165 |
  CMP #$0010                      ; $03F168 |
  BNE CODE_03F182                 ; $03F16B |
  LDA $7D38,y                     ; $03F16D |
  BEQ CODE_03F182                 ; $03F170 |
  TYX                             ; $03F172 |
  JSL $03B24B                     ; $03F173 |
  LDX $12                         ; $03F177 |
  JSL $0CFF61                     ; $03F179 |
  PLA                             ; $03F17D |
  JML $03A32E                     ; $03F17E |

CODE_03F182:
  RTS                             ; $03F182 |

; s sub
CODE_03F183:
  LDY $74A2,x                     ; $03F183 |
  BMI CODE_03F1A3                 ; $03F186 |
  LDY $7901,x                     ; $03F188 |
  DEY                             ; $03F18B |
  LDA $ECBB,y                     ; $03F18C |
  STA $3000                       ; $03F18F |
  LDA $ECC3,y                     ; $03F192 |
  STA $3002                       ; $03F195 |
  LDX #$09                        ; $03F198 |
  LDA #$AEC1                      ; $03F19A |
  JSL $7EDE44                     ; $03F19D | GSU init
  LDX $12                         ; $03F1A1 |

CODE_03F1A3:
  RTS                             ; $03F1A3 |

; data table used by sfx
; 5 byte sections
DATA_03F1A4:         db $02, $00, $00, $88, $00
DATA_03F1A9:         db $00, $01, $0E, $2F, $40
DATA_03F1AE:         db $00, $06, $0E, $2F, $40
DATA_03F1B3:         db $00, $08, $FA, $2C, $40
DATA_03F1B8:         db $00, $00, $FA, $2C, $00
DATA_03F1BD:         db $00, $FE, $16, $49, $02
DATA_03F1C2:         db $00, $08, $16, $6F, $02
DATA_03F1C7:         db $00, $00, $16, $6E, $02
DATA_03F1CC:         db $02, $00, $11, $E3, $06
DATA_03F1D1:         db $02, $00, $00, $88, $00
DATA_03F1D6:         db $00, $01, $0E, $2F, $40
DATA_03F1DB:         db $00, $06, $0E, $2F, $40
DATA_03F1E0:         db $00, $08, $FA, $2D, $40
DATA_03F1E5:         db $00, $00, $FA, $2D, $00
DATA_03F1EA:         db $00, $FE, $16, $49, $02
DATA_03F1EF:         db $00, $08, $16, $6F, $02
DATA_03F1F4:         db $00, $00, $16, $6E, $02
DATA_03F1F9:         db $02, $00, $11, $E3, $06
DATA_03F1FE:         db $02, $00, $00, $88, $00
DATA_03F203:         db $00, $01, $0E, $2F, $40
DATA_03F208:         db $00, $06, $0E, $2F, $40
DATA_03F20D:         db $00, $08, $FA, $3C, $40
DATA_03F212:         db $00, $00, $FA, $3C, $00
DATA_03F217:         db $00, $FE, $16, $49, $02
DATA_03F21C:         db $00, $08, $16, $6F, $02
DATA_03F221:         db $00, $00, $16, $6E, $02
DATA_03F226:         db $02, $00, $11, $E3, $06
DATA_03F22B:         db $02, $00, $00, $88, $00
DATA_03F230:         db $00, $01, $0E, $2F, $40
DATA_03F235:         db $00, $06, $0E, $2F, $40
DATA_03F23A:         db $00, $08, $FA, $3D, $40
DATA_03F23F:         db $00, $00, $FA, $3D, $00
DATA_03F244:         db $00, $FE, $16, $49, $02
DATA_03F249:         db $00, $08, $16, $6F, $02
DATA_03F24E:         db $00, $00, $16, $6E, $02
DATA_03F253:         db $02, $00, $11, $E3, $06

; data table used by sfx
; 5 byte sections
DATA_03F258:         db $02, $00, $00, $88, $00
DATA_03F25D:         db $00, $01, $0E, $2F, $40
DATA_03F262:         db $00, $06, $0E, $2F, $40
DATA_03F267:         db $00, $08, $FA, $2C, $40
DATA_03F26C:         db $00, $00, $FA, $2C, $00
DATA_03F271:         db $02, $00, $10, $EA, $00
DATA_03F276:         db $02, $00, $00, $88, $00
DATA_03F27B:         db $00, $01, $0E, $2F, $40
DATA_03F280:         db $00, $06, $0E, $2F, $40
DATA_03F285:         db $00, $08, $FA, $2D, $40
DATA_03F28A:         db $00, $00, $FA, $2D, $00
DATA_03F28F:         db $02, $00, $10, $EA, $00
DATA_03F294:         db $02, $00, $00, $88, $00
DATA_03F299:         db $00, $01, $0E, $2F, $40
DATA_03F29E:         db $00, $06, $0E, $2F, $40
DATA_03F2A3:         db $00, $08, $FA, $3C, $40
DATA_03F2A8:         db $00, $00, $FA, $3C, $00
DATA_03F2AD:         db $02, $00, $10, $EA, $00
DATA_03F2B2:         db $02, $00, $00, $88, $00
DATA_03F2B7:         db $00, $01, $0E, $2F, $40
DATA_03F2BC:         db $00, $06, $0E, $2F, $40
DATA_03F2C1:         db $00, $08, $FA, $3D, $40
DATA_03F2C6:         db $00, $00, $FA, $3D, $00
DATA_03F2CB:         db $02, $00, $10, $EA, $00

; data table
DATA_03F2D0:         db $08, $06, $07, $08
DATA_03F2D4:         db $09, $0C, $0A, $09
DATA_03F2D8:         db $09, $0A, $08, $08
DATA_03F2DC:         db $0B, $0D

; data table
DATA_03F2DE:         dw $FFE8
DATA_03F2E0:         dw $FFE6, $FFE7
DATA_03F2E4:         dw $FFE8, $FFE9
DATA_03F2E8:         dw $FFEC, $FFEA
DATA_03F2EC:         dw $FFE9, $FFE9
DATA_03F2F0:         dw $FFEA, $FFE8
DATA_03F2F4:         dw $FFE8, $FFEB
DATA_03F2F8:         dw $FFED

; data table
DATA_03F2FA:         dw $FF80, $0080

; walking cannon enemy things
init_kaboomba:
  LDA #$0007                      ; $03F2FE |
  STA $18,x                       ; $03F301 |
  SEP #$20                        ; $03F303 |
  TAY                             ; $03F305 |
  LDA $F396,y                     ; $03F306 |
  STA $7A96,x                     ; $03F309 |
  LDA $F38E,y                     ; $03F30C |
  STA $7402,x                     ; $03F30F |
  TAY                             ; $03F312 |
  LDA $F2D0,y                     ; $03F313 |
  STA $7B58,x                     ; $03F316 |
  REP #$20                        ; $03F319 |
  LDA #$0004                      ; $03F31B |
  STA $7BB8,x                     ; $03F31E |
  LDA #$0004                      ; $03F321 |
  STA $7BB6,x                     ; $03F324 |
  LDY $7400,x                     ; $03F327 |
  LDA $F2FA,y                     ; $03F32A |
  STA $7220,x                     ; $03F32D |
  RTL                             ; $03F330 |

main_kaboomba:
  JSL $03AF23                     ; $03F331 |
  LDA $16,x                       ; $03F335 |
  TAX                             ; $03F337 |
  JSR ($F388,x)                   ; $03F338 | table address
  LDA $76,x                       ; $03F33B |
  STA $7902,x                     ; $03F33D |
  STZ $76,x                       ; $03F340 |
  JSL $03A5B7                     ; $03F342 |
  LDY $7D36,x                     ; $03F346 |
  BPL CODE_03F35E                 ; $03F349 |
  LDA $60C0                       ; $03F34B |
  BNE CODE_03F35D                 ; $03F34E |
  LDA $60AA                       ; $03F350 |
  BMI CODE_03F35D                 ; $03F353 |
  LDA $7902,x                     ; $03F355 |
  BNE CODE_03F35B                 ; $03F358 |
  INC A                           ; $03F35A |

CODE_03F35B:
  STA $76,x                       ; $03F35B |

CODE_03F35D:
  RTL                             ; $03F35D |

CODE_03F35E:
  DEY                             ; $03F35E |
  BMI CODE_03F35D                 ; $03F35F |
  BEQ CODE_03F35D                 ; $03F361 |
  LDA $6F00,y                     ; $03F363 |
  CMP #$0010                      ; $03F366 |
  BNE CODE_03F35D                 ; $03F369 |
  LDA $7D38,y                     ; $03F36B |
  BEQ CODE_03F35D                 ; $03F36E |
  LDA $7542,y                     ; $03F370 |
  CMP #$0040                      ; $03F373 |
  BCS CODE_03F380                 ; $03F376 |
  JSL $0CFF61                     ; $03F378 |
  JML $03B24B                     ; $03F37C |

CODE_03F380:
  PHX                             ; $03F380 |
  TYX                             ; $03F381 |
  JSL $03B24B                     ; $03F382 |
  PLX                             ; $03F386 |
  RTL                             ; $03F387 |

; sub table
DATA_03F388:         dw $F39E
DATA_03F38A:         dw $F422
DATA_03F38C:         dw $F4A9

; data table
DATA_03F38E:         db $07, $06, $05, $04
DATA_03F392:         db $03, $02, $01, $00

; data table
DATA_03F396:         db $04, $04, $03, $02
DATA_03F39A:         db $02, $03, $04, $04

; $F388 table sub
  LDX $12                         ; $03F39E |
  JSR CODE_03F531                 ; $03F3A0 |
  LDA $10                         ; $03F3A3 |
  AND #$003F                      ; $03F3A5 |
  BEQ CODE_03F3E3                 ; $03F3A8 |
  LDA $7A96,x                     ; $03F3AA |
  BNE CODE_03F3E2                 ; $03F3AD |
  DEC $18,x                       ; $03F3AF |
  BPL CODE_03F3B8                 ; $03F3B1 |
  LDA #$0007                      ; $03F3B3 |
  STA $18,x                       ; $03F3B6 |

CODE_03F3B8:
  SEP #$20                        ; $03F3B8 |
  LDY $18,x                       ; $03F3BA |
  LDA $F396,y                     ; $03F3BC |
  STA $7A96,x                     ; $03F3BF |
  LDA $F38E,y                     ; $03F3C2 |
  STA $7402,x                     ; $03F3C5 |
  TAY                             ; $03F3C8 |
  LDA $F2D0,y                     ; $03F3C9 |
  STA $7B58,x                     ; $03F3CC |
  REP #$20                        ; $03F3CF |
  LDA $76,x                       ; $03F3D1 |
  BEQ CODE_03F3E2                 ; $03F3D3 |
  TYA                             ; $03F3D5 |
  ASL A                           ; $03F3D6 |
  TAY                             ; $03F3D7 |
  LDA $7182,x                     ; $03F3D8 |
  CLC                             ; $03F3DB |
  ADC $F2DE,y                     ; $03F3DC |
  STA $6090                       ; $03F3DF |

CODE_03F3E2:
  RTS                             ; $03F3E2 |

CODE_03F3E3:
  STZ $7220,x                     ; $03F3E3 |
  LDA #$0005                      ; $03F3E6 |
  STA $18,x                       ; $03F3E9 |
  SEP #$20                        ; $03F3EB |
  TAY                             ; $03F3ED |
  LDA $F49B,y                     ; $03F3EE |
  STA $7A96,x                     ; $03F3F1 |
  LDA $F495,y                     ; $03F3F4 |
  STA $7402,x                     ; $03F3F7 |
  TAY                             ; $03F3FA |
  LDA $F2D0,y                     ; $03F3FB |
  STA $7B58,x                     ; $03F3FE |
  REP #$20                        ; $03F401 |
  LDA $76,x                       ; $03F403 |
  BEQ CODE_03F414                 ; $03F405 |
  TYA                             ; $03F407 |
  ASL A                           ; $03F408 |
  TAY                             ; $03F409 |
  LDA $7182,x                     ; $03F40A |
  CLC                             ; $03F40D |
  ADC $F2DE,y                     ; $03F40E |
  STA $6090                       ; $03F411 |

CODE_03F414:
  LDA #$0004                      ; $03F414 |
  STA $16,x                       ; $03F417 |
  RTS                             ; $03F419 |

; data table
DATA_03F41A:         db $08, $0C, $0D, $0C

; data table
DATA_03F41E:         db $10, $02, $04, $02

; $F388 table sub
  LDX $12                         ; $03F422 |
  LDA $7A96,x                     ; $03F424 |
  BNE CODE_03F457                 ; $03F427 |
  DEC $18,x                       ; $03F429 |
  BMI CODE_03F458                 ; $03F42B |
  SEP #$20                        ; $03F42D |
  LDY $18,x                       ; $03F42F |
  LDA $F41E,y                     ; $03F431 |
  STA $7A96,x                     ; $03F434 |
  LDA $F41A,y                     ; $03F437 |
  STA $7402,x                     ; $03F43A |
  TAY                             ; $03F43D |
  LDA $F2D0,y                     ; $03F43E |
  STA $7B58,x                     ; $03F441 |
  REP #$20                        ; $03F444 |
  LDA $76,x                       ; $03F446 |
  BEQ CODE_03F457                 ; $03F448 |
  TYA                             ; $03F44A |
  ASL A                           ; $03F44B |
  TAY                             ; $03F44C |
  LDA $7182,x                     ; $03F44D |
  CLC                             ; $03F450 |
  ADC $F2DE,y                     ; $03F451 |
  STA $6090                       ; $03F454 |

CODE_03F457:
  RTS                             ; $03F457 |

CODE_03F458:
  LDY $7400,x                     ; $03F458 |
  LDA $F2FA,y                     ; $03F45B |
  STA $7220,x                     ; $03F45E |
  LDA #$0007                      ; $03F461 |
  STA $18,x                       ; $03F464 |
  SEP #$20                        ; $03F466 |
  TAY                             ; $03F468 |
  LDA $F396,y                     ; $03F469 |
  STA $7A96,x                     ; $03F46C |
  LDA $F38E,y                     ; $03F46F |
  STA $7402,x                     ; $03F472 |
  TAY                             ; $03F475 |
  LDA $F2D0,y                     ; $03F476 |
  STA $7B58,x                     ; $03F479 |
  REP #$20                        ; $03F47C |
  LDA $76,x                       ; $03F47E |
  BEQ CODE_03F48F                 ; $03F480 |
  TYA                             ; $03F482 |
  ASL A                           ; $03F483 |
  TAY                             ; $03F484 |
  LDA $7182,x                     ; $03F485 |
  CLC                             ; $03F488 |
  ADC $F2DE,y                     ; $03F489 |
  STA $6090                       ; $03F48C |

CODE_03F48F:
  LDA #$0000                      ; $03F48F |
  STA $16,x                       ; $03F492 |

CODE_03F494:
  RTS                             ; $03F494 |

; data table
DATA_03F495:         db $08, $09, $0B, $0A
DATA_03F499:         db $09, $08

; data table
DATA_03F49B:         db $10, $04, $04, $02
DATA_03F49F:         db $10, $20

; data table
DATA_03F4A1:         dw $FFF0
DATA_03F4A3:         dw $0010

; data table
DATA_03F4A5:         dw $FE00
DATA_03F4A7:         dw $0200

; $F388 table sub
  LDX $12                         ; $03F4A9 |
  LDA $7A96,x                     ; $03F4AB |
  BNE CODE_03F494                 ; $03F4AE |
  DEC $18,x                       ; $03F4B0 |
  BMI CODE_03F458                 ; $03F4B2 |
  SEP #$20                        ; $03F4B4 |
  LDY $18,x                       ; $03F4B6 |
  LDA $F49B,y                     ; $03F4B8 |
  STA $7A96,x                     ; $03F4BB |
  LDA $F495,y                     ; $03F4BE |
  STA $7402,x                     ; $03F4C1 |
  TAY                             ; $03F4C4 |
  LDA $F2D0,y                     ; $03F4C5 |
  STA $7B58,x                     ; $03F4C8 |
  REP #$20                        ; $03F4CB |
  LDA $76,x                       ; $03F4CD |
  BEQ CODE_03F4DE                 ; $03F4CF |
  TYA                             ; $03F4D1 |
  ASL A                           ; $03F4D2 |
  TAY                             ; $03F4D3 |
  LDA $7182,x                     ; $03F4D4 |
  CLC                             ; $03F4D7 |
  ADC $F2DE,y                     ; $03F4D8 |
  STA $6090                       ; $03F4DB |

CODE_03F4DE:
  LDA $18,x                       ; $03F4DE |
  CMP #$0003                      ; $03F4E0 |
  BNE CODE_03F530                 ; $03F4E3 |
  LDY $7400,x                     ; $03F4E5 |
  LDA $70E2,x                     ; $03F4E8 |
  CLC                             ; $03F4EB |
  ADC $F4A1,y                     ; $03F4EC |
  STA $00                         ; $03F4EF |
  LDA $F4A5,y                     ; $03F4F1 |
  STA $02                         ; $03F4F4 |
  LDA #$000B                      ; $03F4F6 |
  JSL $03A364                     ; $03F4F9 |
  BCC CODE_03F529                 ; $03F4FD |
  LDA $7960                       ; $03F4FF |
  STA $70E2,y                     ; $03F502 |
  LDA $7182,x                     ; $03F505 |
  SEC                             ; $03F508 |
  SBC #$0010                      ; $03F509 |
  STA $7182,y                     ; $03F50C |
  LDA $02                         ; $03F50F |
  STA $7220,y                     ; $03F511 |
  LDA #$FE00                      ; $03F514 |
  STA $7222,y                     ; $03F517 |
  LDA #$0001                      ; $03F51A |
  STA $7D38,y                     ; $03F51D |
  LDA #$0047                      ; $03F520 |\ play sound #$0047
  JSL $0085D2                     ; $03F523 |/
  BRA CODE_03F530                 ; $03F527 |

CODE_03F529:
  LDA #$0042                      ; $03F529 |\ play sound #$0042
  JSL $0085D2                     ; $03F52C |/

CODE_03F530:
  RTS                             ; $03F530 |

; s sub
CODE_03F531:
  LDA $76,x                       ; $03F531 |
  CMP #$0001                      ; $03F533 |
  BNE CODE_03F571                 ; $03F536 |
  STZ $7220,x                     ; $03F538 |
  LDA #$0003                      ; $03F53B |
  STA $18,x                       ; $03F53E |
  SEP #$20                        ; $03F540 |
  TAY                             ; $03F542 |
  LDA $F41E,y                     ; $03F543 |
  STA $7A96,x                     ; $03F546 |
  LDA $F41A,y                     ; $03F549 |
  STA $7402,x                     ; $03F54C |
  TAY                             ; $03F54F |
  LDA $F2D0,y                     ; $03F550 |
  STA $7B58,x                     ; $03F553 |
  REP #$20                        ; $03F556 |
  LDA $76,x                       ; $03F558 |
  BEQ CODE_03F569                 ; $03F55A |
  TYA                             ; $03F55C |
  ASL A                           ; $03F55D |
  TAY                             ; $03F55E |
  LDA $7182,x                     ; $03F55F |
  CLC                             ; $03F562 |
  ADC $F2DE,y                     ; $03F563 |
  STA $6090                       ; $03F566 |

CODE_03F569:
  INC $76,x                       ; $03F569 |
  LDA #$0002                      ; $03F56B |
  STA $16,x                       ; $03F56E |
  PLA                             ; $03F570 |

CODE_03F571:
  RTS                             ; $03F571 |

; data table
DATA_03F572:         dw $FF40
DATA_03F574:         dw $00C0
DATA_03F576:         dw $0020
DATA_03F578:         dw $FFE0

; data table
DATA_03F57A:         dw $FFC0, $0040
DATA_03F57E:         dw $0120, $FFE0
DATA_03F582:         dw $0130, $FFD0
DATA_03F586:         dw $0140, $FFC0
DATA_03F58A:         dw $0150, $FFB0
DATA_03F58E:         dw $0020, $0060
DATA_03F592:         dw $00A0, $00E0
DATA_03F596:         dw $0000, $0040
DATA_03F59A:         dw $0080, $00C0

init_fuzzy:
  LDA #$FF40                      ; $03F59E |
  STA $75E2,x                     ; $03F5A1 |
  LDY $7400,x                     ; $03F5A4 |
  LDA $7182,x                     ; $03F5A7 |
  CLC                             ; $03F5AA |
  ADC #$0020                      ; $03F5AB |
  STA $18,x                       ; $03F5AE |
  LDA $F57A,y                     ; $03F5B0 |
  STA $7220,x                     ; $03F5B3 |
  RTL                             ; $03F5B6 |

main_fuzzy:
  LDA $6F00,x                     ; $03F5B7 |
  CMP #$0010                      ; $03F5BA |
  BEQ CODE_03F5CF                 ; $03F5BD |

CODE_03F5BF:
  LDA $78,x                       ; $03F5BF |
  BEQ CODE_03F5D4                 ; $03F5C1 |
  DEC $0C40                       ; $03F5C3 |
  LDA $78,x                       ; $03F5C6 |
  TRB $0C42                       ; $03F5C8 |
  STZ $78,x                       ; $03F5CB |
  BRA CODE_03F604                 ; $03F5CD |

CODE_03F5CF:
  LDY $7D96,x                     ; $03F5CF |
  BNE CODE_03F5BF                 ; $03F5D2 |

CODE_03F5D4:
  LDA $7D38,x                     ; $03F5D4 |
  BEQ CODE_03F616                 ; $03F5D7 |
  STZ $7D38,x                     ; $03F5D9 |
  LDA #$0040                      ; $03F5DC |
  STA $7542,x                     ; $03F5DF |
  STA $7540,x                     ; $03F5E2 |
  LDA #$0100                      ; $03F5E5 |
  STA $75E2,x                     ; $03F5E8 |
  LDA #$0100                      ; $03F5EB |
  LDY $7221,x                     ; $03F5EE |
  BPL CODE_03F5F6                 ; $03F5F1 |
  LDA #$FF00                      ; $03F5F3 |

CODE_03F5F6:
  STA $75E0,x                     ; $03F5F6 |
  LDA $61B0                       ; $03F5F9 |
  ORA $0B55                       ; $03F5FC |
  ORA $0398                       ; $03F5FF |
  BNE CODE_03F616                 ; $03F602 |

CODE_03F604:
  LDA $6FA0,x                     ; $03F604 |
  ORA #$0060                      ; $03F607 |
  STA $6FA0,x                     ; $03F60A |
  LDA $7040,x                     ; $03F60D |
  ORA #$0004                      ; $03F610 |
  STA $7040,x                     ; $03F613 |

CODE_03F616:
  JSL $03AF23                     ; $03F616 |
  LDA $78,x                       ; $03F61A |
  BEQ CODE_03F677                 ; $03F61C |
  JSR CODE_03F6B8                 ; $03F61E |
  LDA $76,x                       ; $03F621 |
  BEQ CODE_03F632                 ; $03F623 |
  LDA $7A96,x                     ; $03F625 |
  BNE CODE_03F62F                 ; $03F628 |
  STZ $76,x                       ; $03F62A |
  JMP CODE_03F6D2                 ; $03F62C |

CODE_03F62F:
  JSR CODE_03F6B1                 ; $03F62F |

CODE_03F632:
  JSR CODE_03F678                 ; $03F632 |
  LDY #$00                        ; $03F635 |
  LDA $18,x                       ; $03F637 |
  CMP $7182,x                     ; $03F639 |
  BMI CODE_03F640                 ; $03F63C |
  LDY #$02                        ; $03F63E |

CODE_03F640:
  LDA $F572,y                     ; $03F640 |
  STA $75E2,x                     ; $03F643 |
  LDY #$00                        ; $03F646 |
  LDA $7222,x                     ; $03F648 |
  EOR $75E2,x                     ; $03F64B |
  BMI CODE_03F668                 ; $03F64E |
  LDA $7222,x                     ; $03F650 |
  CLC                             ; $03F653 |
  ADC #$0060                      ; $03F654 |
  CMP #$00C0                      ; $03F657 |
  BCC CODE_03F676                 ; $03F65A |
  LDA $7222,x                     ; $03F65C |
  CLC                             ; $03F65F |
  ADC #$00A0                      ; $03F660 |
  CMP #$0140                      ; $03F663 |
  BCC CODE_03F66F                 ; $03F666 |

CODE_03F668:
  INY                             ; $03F668 |
  LDA $7222,x                     ; $03F669 |
  BMI CODE_03F66F                 ; $03F66C |
  INY                             ; $03F66E |

CODE_03F66F:
  TYA                             ; $03F66F |
  AND #$00FF                      ; $03F670 |
  STA $7402,x                     ; $03F673 |

CODE_03F676:
  RTL                             ; $03F676 |

CODE_03F677:
  RTL                             ; $03F677 |

; s sub
CODE_03F678:
  LDY $7D36,x                     ; $03F678 |
  BPL CODE_03F698                 ; $03F67B |
  LDA #$0021                      ; $03F67D |\ play sound #$0021
  JSL $0085D2                     ; $03F680 |/
  LDA #$0400                      ; $03F684 |
  STA $7FE8                       ; $03F687 |
  LDA #$0003                      ; $03F68A |
  STA $61CA                       ; $03F68D |
  LDA #$0010                      ; $03F690 |
  STA $0B55                       ; $03F693 |
  BRA CODE_03F6B1                 ; $03F696 |

CODE_03F698:
  DEY                             ; $03F698 |
  BMI CODE_03F6B7                 ; $03F699 |
  BEQ CODE_03F6B7                 ; $03F69B |
  LDA $6F00,y                     ; $03F69D |
  CMP #$0010                      ; $03F6A0 |
  BNE CODE_03F6B7                 ; $03F6A3 |
  LDA $7D38,y                     ; $03F6A5 |
  BEQ CODE_03F6B7                 ; $03F6A8 |
  LDA #$003A                      ; $03F6AA |\ play sound #$003A
  JSL $0085D2                     ; $03F6AD |/

CODE_03F6B1:
  JSL $039F2B                     ; $03F6B1 | entry point
  BRA CODE_03F6D1                 ; $03F6B5 |

CODE_03F6B7:
  RTS                             ; $03F6B7 |

; s sub
CODE_03F6B8:
  LDA $7680,x                     ; $03F6B8 |
  CLC                             ; $03F6BB |
  ADC #$0080                      ; $03F6BC |
  CMP #$0200                      ; $03F6BF |
  BCS CODE_03F6D1                 ; $03F6C2 |
  LDA $7682,x                     ; $03F6C4 |
  CLC                             ; $03F6C7 |
  ADC #$0040                      ; $03F6C8 |
  CMP #$0140                      ; $03F6CB |
  BCS CODE_03F6D1                 ; $03F6CE |
  RTS                             ; $03F6D0 |

CODE_03F6D1:
  PLA                             ; $03F6D1 | entry point

CODE_03F6D2:
  DEC $0C40                       ; $03F6D2 | entry point
  LDA $78,x                       ; $03F6D5 |
  TRB $0C42                       ; $03F6D7 |
  JML $03A31E                     ; $03F6DA |

DATA_03F6DE:         db $06, $06, $06, $06
DATA_03F6E2:         db $06, $06, $06, $06
DATA_03F6E6:         db $06, $06, $06, $06
DATA_03F6EA:         db $06, $06, $06, $06
DATA_03F6EE:         db $06, $06, $06, $06
DATA_03F6F2:         db $06, $06, $06, $06
DATA_03F6F6:         db $06, $06, $BC, $BC
DATA_03F6FA:         db $BC, $09, $09, $09
DATA_03F6FE:         db $09, $04, $04, $04
DATA_03F702:         db $04, $04, $04, $04
DATA_03F706:         db $05, $05, $05, $06
DATA_03F70A:         db $03, $BE, $00, $00
DATA_03F70E:         db $03, $01, $07, $00
DATA_03F712:         db $00, $01, $00, $00
DATA_03F716:         db $BE, $BE, $BE, $01
DATA_03F71A:         db $01, $01, $02, $02
DATA_03F71E:         db $05, $05, $06, $05
DATA_03F722:         db $05, $04, $05, $05
DATA_03F726:         db $46, $06, $06, $05
DATA_03F72A:         db $06, $06, $BC, $BB
DATA_03F72E:         db $BB, $BD, $BD, $BD
DATA_03F732:         db $BD, $05, $06, $06
DATA_03F736:         db $06, $06, $06, $06
DATA_03F73A:         db $06, $06, $06, $06
DATA_03F73E:         db $05, $05, $00, $00
DATA_03F742:         db $00, $00, $00, $00
DATA_03F746:         db $00, $00, $00, $00
DATA_03F74A:         db $00, $00, $00, $00
DATA_03F74E:         db $00, $00, $00, $00
DATA_03F752:         db $00, $00, $00, $00
DATA_03F756:         db $00, $05, $05, $05
DATA_03F75A:         db $07, $46, $44, $40
DATA_03F75E:         db $FF, $FF, $40, $40
DATA_03F762:         db $40, $40, $40, $40
DATA_03F766:         db $06, $06, $07, $06
DATA_03F76A:         db $08, $08, $08, $08
DATA_03F76E:         db $04, $04, $05, $05
DATA_03F772:         db $06, $06, $04, $06
DATA_03F776:         db $06, $06, $06, $06
DATA_03F77A:         db $04, $42, $FD, $FD
DATA_03F77E:         db $FD, $FD, $FD, $FD
DATA_03F782:         db $06, $05, $04, $03
DATA_03F786:         db $02, $01, $BF, $BD
DATA_03F78A:         db $BC, $BC, $BC, $BC
DATA_03F78E:         db $BB, $BB, $06, $07
DATA_03F792:         db $08, $0A, $0C, $0D
DATA_03F796:         db $10, $10, $10, $10
DATA_03F79A:         db $10, $10, $10, $BC
DATA_03F79E:         db $BB, $BA, $BA, $B9
DATA_03F7A2:         db $B8, $B6, $B4, $B2
DATA_03F7A6:         db $B3, $B5, $B4, $B5
DATA_03F7AA:         db $B5, $BD, $BD, $BD
DATA_03F7AE:         db $BF, $00, $00, $01
DATA_03F7B2:         db $02, $02, $02, $02
DATA_03F7B6:         db $02, $02, $00, $00
DATA_03F7BA:         db $00, $00, $00, $00
DATA_03F7BE:         db $00, $06, $06, $05
DATA_03F7C2:         db $05, $06, $06, $07
DATA_03F7C6:         db $08, $08, $08, $07
DATA_03F7CA:         db $07, $07, $07, $07
DATA_03F7CE:         db $07, $06, $05, $05
DATA_03F7D2:         db $05, $06, $07, $07
DATA_03F7D6:         db $08, $06, $05, $05
DATA_03F7DA:         db $05, $06, $07, $07
DATA_03F7DE:         db $08, $03, $03, $03
DATA_03F7E2:         db $02, $01, $02, $02
DATA_03F7E6:         db $03, $04, $04, $03
DATA_03F7EA:         db $04, $02, $01, $04
DATA_03F7EE:         db $00, $00, $00, $00
DATA_03F7F2:         db $00, $00, $00, $00
DATA_03F7F6:         db $00, $00, $00, $00
DATA_03F7FA:         db $00, $00, $00, $00
DATA_03F7FE:         db $00, $00, $00, $00
DATA_03F802:         db $00, $06, $06, $06
DATA_03F806:         db $06, $06, $06, $06
DATA_03F80A:         db $06, $05, $05, $05
DATA_03F80E:         db $06, $00, $00, $00
DATA_03F812:         db $00, $00, $00, $00
DATA_03F816:         db $00, $00, $00, $00
DATA_03F81A:         db $00, $00, $00, $00
DATA_03F81E:         db $00, $00, $00, $00
DATA_03F822:         db $00, $00, $00, $00
DATA_03F826:         db $00, $00, $00, $00
DATA_03F82A:         db $00, $00, $00, $00
DATA_03F82E:         db $00, $00, $00, $00
DATA_03F832:         db $00, $00, $00, $00
DATA_03F836:         db $00, $00, $00, $00
DATA_03F83A:         db $00, $00, $00, $00
DATA_03F83E:         db $00, $00, $06, $06
DATA_03F842:         db $00, $00, $00, $00
DATA_03F846:         db $00, $00, $00, $00
DATA_03F84A:         db $00, $00, $00, $00
DATA_03F84E:         db $00, $00, $00, $00
DATA_03F852:         db $00, $00, $00, $00
DATA_03F856:         db $00, $00, $00, $00
DATA_03F85A:         db $00, $00, $00, $00
DATA_03F85E:         db $00, $00, $00, $00
DATA_03F862:         db $00, $00, $00, $00
DATA_03F866:         db $00, $00, $00, $00
DATA_03F86A:         db $00, $00, $00, $00
DATA_03F86E:         db $00, $00, $00, $00
DATA_03F872:         db $00, $00, $00, $00
DATA_03F876:         db $00, $00, $00, $00
DATA_03F87A:         db $00, $00, $00, $00
DATA_03F87E:         db $00, $02, $01, $06
DATA_03F882:         db $01, $42, $05, $05
DATA_03F886:         db $06, $06, $00, $00
DATA_03F88A:         db $06, $06, $00, $02
DATA_03F88E:         db $46, $46, $46, $46
DATA_03F892:         db $46, $06, $46, $06
DATA_03F896:         db $06, $06, $06, $46
DATA_03F89A:         db $02, $06, $06, $46
DATA_03F89E:         db $46, $46, $06, $06
DATA_03F8A2:         db $02, $02, $02, $06
DATA_03F8A6:         db $06, $BC, $BC, $BC
DATA_03F8AA:         db $49, $49, $49, $49
DATA_03F8AE:         db $04, $04, $04, $04
DATA_03F8B2:         db $04, $04, $44, $44
DATA_03F8B6:         db $44, $44, $FC, $FD
DATA_03F8BA:         db $FE, $FD, $FB, $FB
DATA_03F8BE:         db $FD, $03, $44, $04
DATA_03F8C2:         db $FC, $FC, $FC, $F7
DATA_03F8C6:         db $F7, $F7, $01, $01
DATA_03F8CA:         db $01, $02, $02, $02
DATA_03F8CE:         db $02, $02, $02, $02
DATA_03F8D2:         db $02, $02, $02, $02
DATA_03F8D6:         db $06, $06, $05, $02
DATA_03F8DA:         db $02, $FC, $FB, $FB
DATA_03F8DE:         db $FD, $FD, $BD, $FD

DATA_03F8E2:         db $05, $05, $06, $06
DATA_03F8E6:         db $05, $05, $04, $04
DATA_03F8EA:         db $04, $05, $06, $05
DATA_03F8EE:         db $04, $04, $04, $04
DATA_03F8F2:         db $03, $06, $08, $04
DATA_03F8F6:         db $04, $04, $04, $04
DATA_03F8FA:         db $03, $04, $00, $FF
DATA_03F8FE:         db $FE, $02, $02, $02
DATA_03F902:         db $02, $F8, $F8, $F8
DATA_03F906:         db $F8, $FB, $FE, $00
DATA_03F90A:         db $06, $06, $06, $06
DATA_03F90E:         db $06, $01, $00, $FE
DATA_03F912:         db $03, $FF, $06, $01
DATA_03F916:         db $00, $02, $01, $00
DATA_03F91A:         db $FF, $FF, $FF, $06
DATA_03F91E:         db $06, $07, $07, $06
DATA_03F922:         db $04, $04, $04, $04
DATA_03F926:         db $04, $03, $04, $03
DATA_03F92A:         db $08, $04, $04, $04
DATA_03F92E:         db $04, $04, $03, $03
DATA_03F932:         db $04, $05, $05, $05
DATA_03F936:         db $04, $04, $04, $04
DATA_03F93A:         db $04, $04, $04, $04
DATA_03F93E:         db $05, $04, $04, $04
DATA_03F942:         db $04, $04, $00, $00
DATA_03F946:         db $00, $00, $00, $00
DATA_03F94A:         db $00, $00, $00, $00
DATA_03F94E:         db $00, $00, $00, $00
DATA_03F952:         db $00, $00, $00, $00
DATA_03F956:         db $00, $00, $00, $00
DATA_03F95A:         db $00, $04, $FE, $01
DATA_03F95E:         db $01, $04, $04, $07
DATA_03F962:         db $07, $05, $06, $07
DATA_03F966:         db $05, $06, $07, $00
DATA_03F96A:         db $04, $04, $04, $04
DATA_03F96E:         db $04, $04, $05, $05
DATA_03F972:         db $02, $02, $02, $02
DATA_03F976:         db $05, $05, $04, $04
DATA_03F97A:         db $04, $04, $04, $04
DATA_03F97E:         db $01, $FD, $FE, $FE
DATA_03F982:         db $FE, $FE, $FE, $FE
DATA_03F986:         db $03, $03, $03, $02
DATA_03F98A:         db $02, $02, $02, $01
DATA_03F98E:         db $00, $02, $02, $02
DATA_03F992:         db $02, $01, $01, $00
DATA_03F996:         db $00, $00, $01, $02
DATA_03F99A:         db $03, $04, $03, $03
DATA_03F99E:         db $04, $05, $04, $05
DATA_03F9A2:         db $06, $06, $07, $07
DATA_03F9A6:         db $06, $04, $04, $04
DATA_03F9AA:         db $03, $02, $03, $05
DATA_03F9AE:         db $04, $04, $03, $02
DATA_03F9B2:         db $02, $02, $03, $04
DATA_03F9B6:         db $05, $05, $05, $07
DATA_03F9BA:         db $06, $05, $00, $00
DATA_03F9BE:         db $00, $00, $00, $00
DATA_03F9C2:         db $00, $01, $01, $00
DATA_03F9C6:         db $00, $01, $01, $02
DATA_03F9CA:         db $02, $02, $02, $00
DATA_03F9CE:         db $00, $01, $01, $01
DATA_03F9D2:         db $01, $05, $05, $04
DATA_03F9D6:         db $04, $04, $04, $06
DATA_03F9DA:         db $06, $05, $05, $04
DATA_03F9DE:         db $04, $05, $05, $06
DATA_03F9E2:         db $07, $0A, $09, $0A
DATA_03F9E6:         db $0A, $0B, $0B, $0A
DATA_03F9EA:         db $0A, $0A, $0A, $0A
DATA_03F9EE:         db $06, $0B, $0C, $08
DATA_03F9F2:         db $05, $05, $05, $05
DATA_03F9F6:         db $04, $05, $00, $00
DATA_03F9FA:         db $00, $00, $00, $00
DATA_03F9FE:         db $00, $00, $00, $00
DATA_03FA02:         db $00, $00, $00, $00
DATA_03FA06:         db $00, $05, $05, $05
DATA_03FA0A:         db $05, $05, $05, $05
DATA_03FA0E:         db $05, $03, $04, $02
DATA_03FA12:         db $07, $00, $00, $00
DATA_03FA16:         db $00, $00, $00, $00
DATA_03FA1A:         db $00, $00, $00, $00
DATA_03FA1E:         db $00, $00, $00, $00
DATA_03FA22:         db $00, $00, $00, $00
DATA_03FA26:         db $00, $00, $00, $00
DATA_03FA2A:         db $00, $00, $00, $00
DATA_03FA2E:         db $00, $00, $00, $00
DATA_03FA32:         db $00, $00, $00, $00
DATA_03FA36:         db $00, $00, $00, $00
DATA_03FA3A:         db $00, $00, $00, $00
DATA_03FA3E:         db $00, $00, $00, $00
DATA_03FA42:         db $00, $00, $05, $05
DATA_03FA46:         db $00, $00, $00, $00
DATA_03FA4A:         db $00, $00, $00, $00
DATA_03FA4E:         db $00, $00, $00, $00
DATA_03FA52:         db $00, $00, $00, $00
DATA_03FA56:         db $00, $00, $00, $00
DATA_03FA5A:         db $00, $00, $00, $00
DATA_03FA5E:         db $00, $00, $00, $00
DATA_03FA62:         db $00, $00, $00, $00
DATA_03FA66:         db $00, $00, $00, $00
DATA_03FA6A:         db $00, $00, $00, $00
DATA_03FA6E:         db $00, $00, $00, $00
DATA_03FA72:         db $00, $00, $00, $00
DATA_03FA76:         db $00, $00, $00, $00
DATA_03FA7A:         db $00, $00, $00, $00
DATA_03FA7E:         db $00, $00, $00, $00
DATA_03FA82:         db $00, $01, $FB, $03
DATA_03FA86:         db $FB, $FE, $04, $04
DATA_03FA8A:         db $04, $04, $00, $00
DATA_03FA8E:         db $06, $08, $00, $05
DATA_03FA92:         db $05, $06, $06, $05
DATA_03FA96:         db $05, $04, $04, $04
DATA_03FA9A:         db $05, $06, $05, $04
DATA_03FA9E:         db $05, $04, $04, $03
DATA_03FAA2:         db $06, $08, $04, $04
DATA_03FAA6:         db $05, $05, $05, $03
DATA_03FAAA:         db $04, $04, $03, $02
DATA_03FAAE:         db $02, $02, $02, $01
DATA_03FAB2:         db $F8, $F8, $F8, $F8
DATA_03FAB6:         db $FB, $FE, $00, $05
DATA_03FABA:         db $07, $09, $04, $00
DATA_03FABE:         db $03, $03, $04, $06
DATA_03FAC2:         db $04, $04, $02, $02
DATA_03FAC6:         db $04, $03, $02, $02
DATA_03FACA:         db $02, $01, $06, $06
DATA_03FACE:         db $07, $07, $06, $05
DATA_03FAD2:         db $05, $05, $05, $05
DATA_03FAD6:         db $03, $05, $03, $08
DATA_03FADA:         db $04, $04, $04, $05
DATA_03FADE:         db $05, $03, $03, $04
DATA_03FAE2:         db $05, $05, $04, $05

DATA_03FAE6:         db $00, $00, $00, $00
DATA_03FAEA:         db $00, $00, $00, $00
DATA_03FAEE:         db $00, $00, $00, $00
DATA_03FAF2:         db $00, $00, $00, $00
DATA_03FAF6:         db $00, $00, $00, $00
DATA_03FAFA:         db $00, $00, $00, $00
DATA_03FAFE:         db $00, $00, $00, $00
DATA_03FB02:         db $00, $00, $00, $00
DATA_03FB06:         db $00, $00, $00, $00
DATA_03FB0A:         db $00, $00, $00, $00
DATA_03FB0E:         db $00, $00, $00, $00
DATA_03FB12:         db $00, $0D, $0B, $07
DATA_03FB16:         db $0A, $03, $BA, $AC
DATA_03FB1A:         db $00, $0D, $0D, $0D
DATA_03FB1E:         db $0D, $0D, $0D, $00
DATA_03FB22:         db $00, $00, $00, $00
DATA_03FB26:         db $00, $00, $00, $00
DATA_03FB2A:         db $00, $00, $00, $00
DATA_03FB2E:         db $40, $00, $00, $00
DATA_03FB32:         db $00, $00, $07, $06
DATA_03FB36:         db $06, $07, $08, $07
DATA_03FB3A:         db $07, $00, $00, $00
DATA_03FB3E:         db $00, $00, $00, $00
DATA_03FB42:         db $00, $00, $00, $00
DATA_03FB46:         db $00, $00, $00, $00
DATA_03FB4A:         db $00, $00, $00, $00
DATA_03FB4E:         db $00, $00, $00, $00
DATA_03FB52:         db $00, $00, $00, $00
DATA_03FB56:         db $00, $00, $00, $00
DATA_03FB5A:         db $00, $00, $00, $00
DATA_03FB5E:         db $00, $00, $00, $00
DATA_03FB62:         db $00, $40, $40, $40
DATA_03FB66:         db $40, $40, $40, $40
DATA_03FB6A:         db $40, $40, $40, $40
DATA_03FB6E:         db $00, $00, $00, $00
DATA_03FB72:         db $00, $00, $00, $00
DATA_03FB76:         db $00, $00, $00, $00
DATA_03FB7A:         db $00, $00, $00, $00
DATA_03FB7E:         db $00, $00, $00, $00
DATA_03FB82:         db $00, $40, $40, $40
DATA_03FB86:         db $40, $40, $40, $40
DATA_03FB8A:         db $00, $00, $00, $00
DATA_03FB8E:         db $00, $00, $00, $00
DATA_03FB92:         db $00, $00, $00, $00
DATA_03FB96:         db $00, $00, $00, $00
DATA_03FB9A:         db $00, $00, $00, $00
DATA_03FB9E:         db $00, $00, $00, $00
DATA_03FBA2:         db $00, $00, $00, $0A
DATA_03FBA6:         db $09, $08, $07, $06
DATA_03FBAA:         db $05, $04, $02, $00
DATA_03FBAE:         db $01, $03, $03, $03
DATA_03FBB2:         db $03, $0B, $0C, $0D
DATA_03FBB6:         db $0E, $0F, $10, $11
DATA_03FBBA:         db $12, $12, $12, $12
DATA_03FBBE:         db $12, $12, $00, $00
DATA_03FBC2:         db $00, $00, $00, $00
DATA_03FBC6:         db $00, $00, $00, $00
DATA_03FBCA:         db $00, $00, $00, $00
DATA_03FBCE:         db $00, $00, $00, $00
DATA_03FBD2:         db $00, $00, $00, $00
DATA_03FBD6:         db $00, $00, $00, $00
DATA_03FBDA:         db $00, $00, $00, $00
DATA_03FBDE:         db $00, $00, $00, $00
DATA_03FBE2:         db $00, $00, $00, $00
DATA_03FBE6:         db $00, $00, $00, $00
DATA_03FBEA:         db $00, $00, $00, $00
DATA_03FBEE:         db $00, $00, $00, $00
DATA_03FBF2:         db $00, $00, $00, $00
DATA_03FBF6:         db $00, $00, $00, $00
DATA_03FBFA:         db $00, $00, $00, $00
DATA_03FBFE:         db $00, $00, $00, $00
DATA_03FC02:         db $00, $00, $00, $00
DATA_03FC06:         db $00, $00, $00, $00
DATA_03FC0A:         db $00, $00, $00, $00
DATA_03FC0E:         db $00, $00, $00, $00
DATA_03FC12:         db $00, $00, $00, $00
DATA_03FC16:         db $00, $00, $00, $00
DATA_03FC1A:         db $00, $00, $00, $00
DATA_03FC1E:         db $00, $00, $00, $00
DATA_03FC22:         db $00, $00, $00, $00
DATA_03FC26:         db $00, $00, $00, $00
DATA_03FC2A:         db $00, $00, $00, $00
DATA_03FC2E:         db $00, $00, $00, $00
DATA_03FC32:         db $00, $00, $00, $00
DATA_03FC36:         db $00, $00, $00, $00
DATA_03FC3A:         db $00, $00, $00, $00
DATA_03FC3E:         db $00, $00, $00, $00
DATA_03FC42:         db $00, $00, $00, $00
DATA_03FC46:         db $00, $00, $00, $00
DATA_03FC4A:         db $00, $00, $00, $00
DATA_03FC4E:         db $00, $00, $00, $00
DATA_03FC52:         db $00, $00, $00, $00
DATA_03FC56:         db $00, $00, $00, $00
DATA_03FC5A:         db $00, $00, $00, $00
DATA_03FC5E:         db $00, $00, $00, $00
DATA_03FC62:         db $00, $00, $00, $00
DATA_03FC66:         db $00, $00, $00, $00
DATA_03FC6A:         db $00, $00, $00, $00
DATA_03FC6E:         db $00, $00, $00, $00
DATA_03FC72:         db $00, $00, $00, $00
DATA_03FC76:         db $00, $00, $00, $00
DATA_03FC7A:         db $00, $00, $00, $00
DATA_03FC7E:         db $00, $00, $00, $00
DATA_03FC82:         db $00, $00, $00, $00
DATA_03FC86:         db $00, $00, $00, $00
DATA_03FC8A:         db $00, $40, $00, $00
DATA_03FC8E:         db $00, $00, $00, $00
DATA_03FC92:         db $00, $00, $00, $00
DATA_03FC96:         db $40, $40, $40, $40
DATA_03FC9A:         db $40, $00, $40, $00
DATA_03FC9E:         db $00, $00, $00, $40
DATA_03FCA2:         db $00, $00, $00, $40
DATA_03FCA6:         db $40, $40, $00, $00
DATA_03FCAA:         db $00, $00, $00, $00
DATA_03FCAE:         db $00, $00, $00, $00
DATA_03FCB2:         db $40, $40, $40, $40
DATA_03FCB6:         db $00, $00, $00, $00
DATA_03FCBA:         db $00, $00, $40, $40
DATA_03FCBE:         db $40, $40, $40, $40
DATA_03FCC2:         db $4D, $4B, $49, $4A
DATA_03FCC6:         db $4A, $07, $48, $08
DATA_03FCCA:         db $49, $4B, $4A, $49
DATA_03FCCE:         db $49, $4A, $00, $00
DATA_03FCD2:         db $00, $00, $00, $00
DATA_03FCD6:         db $00, $00, $00, $00
DATA_03FCDA:         db $00, $00, $00, $00
DATA_03FCDE:         db $00, $00, $00, $00
DATA_03FCE2:         db $00, $47, $46, $46
DATA_03FCE6:         db $47, $48, $07, $47

DATA_03FCEA:         db $00, $00, $00, $00
DATA_03FCEE:         db $00, $00, $00, $00
DATA_03FCF2:         db $00, $00, $00, $00
DATA_03FCF6:         db $00, $00, $00, $00
DATA_03FCFA:         db $00, $00, $00, $00
DATA_03FCFE:         db $00, $00, $00, $00
DATA_03FD02:         db $00, $00, $00, $00
DATA_03FD06:         db $00, $00, $00, $00
DATA_03FD0A:         db $00, $00, $00, $00
DATA_03FD0E:         db $00, $00, $00, $00
DATA_03FD12:         db $00, $00, $00, $00
DATA_03FD16:         db $00, $0F, $0D, $0A
DATA_03FD1A:         db $04, $00, $00, $00
DATA_03FD1E:         db $00, $0A, $09, $08
DATA_03FD22:         db $04, $04, $04, $00
DATA_03FD26:         db $00, $00, $00, $00
DATA_03FD2A:         db $00, $00, $00, $00
DATA_03FD2E:         db $00, $00, $00, $00
DATA_03FD32:         db $00, $00, $00, $00
DATA_03FD36:         db $00, $00, $09, $09
DATA_03FD3A:         db $0A, $0B, $0A, $0A
DATA_03FD3E:         db $09, $00, $00, $00
DATA_03FD42:         db $00, $00, $00, $00
DATA_03FD46:         db $00, $00, $00, $00
DATA_03FD4A:         db $00, $00, $00, $00
DATA_03FD4E:         db $00, $00, $00, $00
DATA_03FD52:         db $00, $00, $00, $00
DATA_03FD56:         db $00, $00, $00, $00
DATA_03FD5A:         db $00, $00, $00, $00
DATA_03FD5E:         db $00, $00, $00, $00
DATA_03FD62:         db $00, $00, $00, $00
DATA_03FD66:         db $00, $00, $00, $00
DATA_03FD6A:         db $00, $00, $00, $00
DATA_03FD6E:         db $00, $00, $00, $00
DATA_03FD72:         db $00, $00, $00, $00
DATA_03FD76:         db $00, $00, $00, $00
DATA_03FD7A:         db $00, $00, $00, $00
DATA_03FD7E:         db $00, $00, $00, $00
DATA_03FD82:         db $00, $00, $00, $00
DATA_03FD86:         db $00, $00, $00, $00
DATA_03FD8A:         db $00, $00, $00, $00
DATA_03FD8E:         db $00, $00, $00, $00
DATA_03FD92:         db $00, $00, $00, $00
DATA_03FD96:         db $00, $00, $00, $00
DATA_03FD9A:         db $00, $00, $00, $00
DATA_03FD9E:         db $00, $00, $00, $00
DATA_03FDA2:         db $00, $00, $00, $00
DATA_03FDA6:         db $00, $00, $00, $0B
DATA_03FDAA:         db $0B, $0C, $0C, $0C
DATA_03FDAE:         db $0B, $0A, $0A, $0A
DATA_03FDB2:         db $08, $07, $08, $09
DATA_03FDB6:         db $08, $0A, $09, $08
DATA_03FDBA:         db $08, $08, $09, $0A
DATA_03FDBE:         db $0A, $0A, $0B, $0C
DATA_03FDC2:         db $0B, $0A, $00, $00
DATA_03FDC6:         db $00, $00, $00, $00
DATA_03FDCA:         db $00, $00, $00, $00
DATA_03FDCE:         db $00, $00, $00, $00
DATA_03FDD2:         db $00, $00, $00, $00
DATA_03FDD6:         db $00, $00, $00, $00
DATA_03FDDA:         db $00, $00, $00, $00
DATA_03FDDE:         db $00, $00, $00, $00
DATA_03FDE2:         db $00, $00, $00, $00
DATA_03FDE6:         db $00, $00, $00, $00
DATA_03FDEA:         db $00, $00, $00, $00
DATA_03FDEE:         db $00, $00, $00, $00
DATA_03FDF2:         db $00, $00, $00, $00
DATA_03FDF6:         db $00, $00, $00, $00
DATA_03FDFA:         db $00, $00, $00, $00
DATA_03FDFE:         db $00, $00, $00, $00
DATA_03FE02:         db $00, $00, $00, $00
DATA_03FE06:         db $00, $00, $00, $00
DATA_03FE0A:         db $00, $00, $00, $00
DATA_03FE0E:         db $00, $00, $00, $00
DATA_03FE12:         db $00, $00, $00, $00
DATA_03FE16:         db $00, $00, $00, $00
DATA_03FE1A:         db $00, $00, $00, $00
DATA_03FE1E:         db $00, $00, $00, $00
DATA_03FE22:         db $00, $00, $00, $00
DATA_03FE26:         db $00, $00, $00, $00
DATA_03FE2A:         db $00, $00, $00, $00
DATA_03FE2E:         db $00, $00, $00, $00
DATA_03FE32:         db $00, $00, $00, $00
DATA_03FE36:         db $00, $00, $00, $00
DATA_03FE3A:         db $00, $00, $00, $00
DATA_03FE3E:         db $00, $00, $00, $00
DATA_03FE42:         db $00, $00, $00, $00
DATA_03FE46:         db $00, $00, $00, $00
DATA_03FE4A:         db $00, $00, $00, $00
DATA_03FE4E:         db $00, $00, $00, $00
DATA_03FE52:         db $00, $00, $00, $00
DATA_03FE56:         db $00, $00, $00, $00
DATA_03FE5A:         db $00, $00, $00, $00
DATA_03FE5E:         db $00, $00, $00, $00
DATA_03FE62:         db $00, $00, $00, $00
DATA_03FE66:         db $00, $00, $00, $00
DATA_03FE6A:         db $00, $00, $00, $00
DATA_03FE6E:         db $00, $00, $00, $00
DATA_03FE72:         db $00, $00, $00, $00
DATA_03FE76:         db $00, $00, $00, $00
DATA_03FE7A:         db $00, $00, $00, $00
DATA_03FE7E:         db $00, $00, $00, $00
DATA_03FE82:         db $00, $00, $00, $00
DATA_03FE86:         db $00, $00, $00, $00
DATA_03FE8A:         db $00, $00, $00, $00
DATA_03FE8E:         db $00, $00, $00, $00
DATA_03FE92:         db $00, $00, $00, $00
DATA_03FE96:         db $00, $00, $00, $00
DATA_03FE9A:         db $00, $00, $00, $00
DATA_03FE9E:         db $00, $00, $00, $00
DATA_03FEA2:         db $00, $00, $00, $00
DATA_03FEA6:         db $00, $00, $00, $00
DATA_03FEAA:         db $00, $00, $00, $00
DATA_03FEAE:         db $00, $00, $00, $00
DATA_03FEB2:         db $00, $00, $00, $00
DATA_03FEB6:         db $00, $00, $00, $00
DATA_03FEBA:         db $00, $00, $00, $00
DATA_03FEBE:         db $00, $00, $00, $00
DATA_03FEC2:         db $00, $00, $00, $00
DATA_03FEC6:         db $0F, $0D, $0A, $03
DATA_03FECA:         db $F9, $EB, $E2, $D8
DATA_03FECE:         db $09, $09, $08, $FE
DATA_03FED2:         db $FF, $00, $00, $00
DATA_03FED6:         db $00, $00, $00, $00
DATA_03FEDA:         db $00, $00, $00, $00
DATA_03FEDE:         db $00, $00, $00, $00
DATA_03FEE2:         db $00, $00, $00, $00
DATA_03FEE6:         db $00, $09, $09, $0A
DATA_03FEEA:         db $0B, $0A, $0C, $0B

; freespace
DATA_03FEEE:         db $FF, $FF, $FF, $FF
DATA_03FEF2:         db $FF, $FF, $FF, $FF
DATA_03FEF6:         db $FF, $FF, $FF, $FF
DATA_03FEFA:         db $FF, $FF, $FF, $FF
DATA_03FEFE:         db $FF, $FF, $FF, $FF
DATA_03FF02:         db $FF, $FF, $FF, $FF
DATA_03FF06:         db $FF, $FF, $FF, $FF
DATA_03FF0A:         db $FF, $FF, $FF, $FF
DATA_03FF0E:         db $FF, $FF, $FF, $FF
DATA_03FF12:         db $FF, $FF, $FF, $FF
DATA_03FF16:         db $FF, $FF, $FF, $FF
DATA_03FF1A:         db $FF, $FF, $FF, $FF
DATA_03FF1E:         db $FF, $FF, $FF, $FF
DATA_03FF22:         db $FF, $FF, $FF, $FF
DATA_03FF26:         db $FF, $FF, $FF, $FF
DATA_03FF2A:         db $FF, $FF, $FF, $FF
DATA_03FF2E:         db $FF, $FF, $FF, $FF
DATA_03FF32:         db $FF, $FF, $FF, $FF
DATA_03FF36:         db $FF, $FF, $FF, $FF
DATA_03FF3A:         db $FF, $FF, $FF, $FF
DATA_03FF3E:         db $FF, $FF, $FF, $FF
DATA_03FF42:         db $FF, $FF, $FF, $FF
DATA_03FF46:         db $FF, $FF, $FF, $FF
DATA_03FF4A:         db $FF, $FF, $FF, $FF
DATA_03FF4E:         db $FF, $FF, $FF, $FF
DATA_03FF52:         db $FF, $FF, $FF, $FF
DATA_03FF56:         db $FF, $FF, $FF, $FF
DATA_03FF5A:         db $FF, $FF, $FF, $FF
DATA_03FF5E:         db $FF, $FF, $FF, $FF
DATA_03FF62:         db $FF, $FF, $FF, $FF
DATA_03FF66:         db $FF, $FF, $FF, $FF
DATA_03FF6A:         db $FF, $FF, $FF, $FF
DATA_03FF6E:         db $FF, $FF, $FF, $FF
DATA_03FF72:         db $FF, $FF, $FF, $FF
DATA_03FF76:         db $FF, $FF, $FF, $FF
DATA_03FF7A:         db $FF, $FF, $FF, $FF
DATA_03FF7E:         db $FF, $FF, $FF, $FF
DATA_03FF82:         db $FF, $FF, $FF, $FF
DATA_03FF86:         db $FF, $FF, $FF, $FF
DATA_03FF8A:         db $FF, $FF, $FF, $FF
DATA_03FF8E:         db $FF, $FF, $FF, $FF
DATA_03FF92:         db $FF, $FF, $FF, $FF
DATA_03FF96:         db $FF, $FF, $FF, $FF
DATA_03FF9A:         db $FF, $FF, $FF, $FF
DATA_03FF9E:         db $FF, $FF, $FF, $FF
DATA_03FFA2:         db $FF, $FF, $FF, $FF
DATA_03FFA6:         db $FF, $FF, $FF, $FF
DATA_03FFAA:         db $FF, $FF, $FF, $FF
DATA_03FFAE:         db $FF, $FF, $FF, $FF
DATA_03FFB2:         db $FF, $FF, $FF, $FF
DATA_03FFB6:         db $FF, $FF, $FF, $FF
DATA_03FFBA:         db $FF, $FF, $FF, $FF
DATA_03FFBE:         db $FF, $FF, $FF, $FF
DATA_03FFC2:         db $FF, $FF, $FF, $FF
DATA_03FFC6:         db $FF, $FF, $FF, $FF
DATA_03FFCA:         db $FF, $FF, $FF, $FF
DATA_03FFCE:         db $FF, $FF, $FF, $FF
DATA_03FFD2:         db $FF, $FF, $FF, $FF
DATA_03FFD6:         db $FF, $FF, $FF, $FF
DATA_03FFDA:         db $FF, $FF, $FF, $FF
DATA_03FFDE:         db $FF, $FF, $FF, $FF
DATA_03FFE2:         db $FF, $FF, $FF, $FF
DATA_03FFE6:         db $FF, $FF, $FF, $FF
DATA_03FFEA:         db $FF, $FF, $FF, $FF
DATA_03FFEE:         db $FF, $FF, $FF, $FF
DATA_03FFF2:         db $FF, $FF, $FF, $FF
DATA_03FFF6:         db $FF, $FF, $FF, $FF
DATA_03FFFA:         db $FF, $FF, $FF, $FF
DATA_03FFFE:         db $FF, $FF
