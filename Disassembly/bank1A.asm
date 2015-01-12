; sprite pointer table
; these are pointers to words
; in bank 4D (that's this bank & 1B together)
; this table is for the 00 drawing method
; containing OAM information
org $1A8000

DATA_1A8000:         dw $0000    ; Log, floating on water / lava
DATA_1A8002:         dw $0000    ; Closed door
DATA_1A8004:         dw $0000    ; Naval Piranha's stalk
DATA_1A8006:         dw $0000    ; Crate, key
DATA_1A8008:         dw $09E4    ; Item from Star Mario block
DATA_1A800A:         dw $092E    ; Icy watermelon
DATA_1A800C:         dw $0938    ; Chill
DATA_1A800E:         dw $0940    ; Watermelon
DATA_1A8010:         dw $0944    ; Rubble
DATA_1A8012:         dw $0946    ; Fire watermelon
DATA_1A8014:         dw $0000    ; Kaboomba
DATA_1A8016:         dw $0948    ; Cannonball of Kaboomba
DATA_1A8018:         dw $0000    ; Raphael the Raven
DATA_1A801A:         dw $0000    ; Goal
DATA_1A801C:         dw $0000    ; G O A L !
DATA_1A801E:         dw $0000    ; BONUS CHALLENGE
DATA_1A8020:         dw $0000    ; Caged Ghost, round mound
DATA_1A8022:         dw $0000    ; Item Card
DATA_1A8024:         dw $0000    ; Boss Door
DATA_1A8026:         dw $0000    ; Boss Explosion
DATA_1A8028:         dw $0000    ; Key from defeated boss
DATA_1A802A:         dw $094A    ; Torpedo of Yoshi Submarine
DATA_1A802C:         dw $0000    ; Bigger Boo
DATA_1A802E:         dw $0000    ; Frog Pirate
DATA_1A8030:         dw $094C    ; Flame of Red Watermelon
DATA_1A8032:         dw $0954    ; Bubble
DATA_1A8034:         dw $0000    ; Ski lift
DATA_1A8036:         dw $0000    ; Vertical log, floating on lava
DATA_1A8038:         dw $0000    ; Dr. Freezegood, nothing / 6 stars / 1-up / Bumpty
DATA_1A803A:         dw $0000    ; Dr. Freezegood, with ski lift
DATA_1A803C:         dw $0000    ; Shy Guy, green / red / yellow / purple
DATA_1A803E:         dw $0000    ; Rotating Doors
DATA_1A8040:         dw $0000    ; Bandit
DATA_1A8042:         dw $0000    ; ? bucket
DATA_1A8044:         dw $0964    ; Flashing Egg
DATA_1A8046:         dw $0964    ; Red Egg
DATA_1A8048:         dw $0964    ; Yellow Egg
DATA_1A804A:         dw $0964    ; Green Egg
DATA_1A804C:         dw $0000    ; Giant Egg, for battle with Bowser
DATA_1A804E:         dw $096E    ; Key
DATA_1A8050:         dw $0000    ; Huffin' Puffin, running away
DATA_1A8052:         dw $0000    ; Giant Egg, for battle with Prince Froggy?
DATA_1A8054:         dw $0000    ; Red Giant Egg
DATA_1A8056:         dw $0000    ; Green Giant Egg
DATA_1A8058:         dw $0000    ; Lunge Fish
DATA_1A805A:         dw $0000    ; Salvo the Slime
DATA_1A805C:         dw $0000    ; Salve the Slime's eyes
DATA_1A805E:         dw $09E8    ; Little Mouser's Nest
DATA_1A8060:         dw $0000    ; Little Mouser
DATA_1A8062:         dw $0970    ; Potted Spiked Fun Guy
DATA_1A8064:         dw $0000    ; Little Mouser, looking around, in nest / behind stuff
DATA_1A8066:         dw $0000    ; Little Mouser, from nest
DATA_1A8068:         dw $0000    ; Rogger the Potted Ghost
DATA_1A806A:         dw $0000    ; Falling down Rogger the Potted Ghost?
DATA_1A806C:         dw $0000    ; (BG3) Falling down wall
DATA_1A806E:         dw $0974    ; Grim Leecher
DATA_1A8070:         dw $097C    ; Flame spat by Rogger the Potted Ghost
DATA_1A8072:         dw $0000    ; (BG3) Spinning wooden platform
DATA_1A8074:         dw $0000    ; 3 Mini-Ravens
DATA_1A8076:         dw $0000    ; Mini-Raven
DATA_1A8078:         dw $0000    ; Tap-Tap the Red Nose
DATA_1A807A:         dw $0000    ; (BG3) Seesaw
DATA_1A807C:         dw $0000    ; Skinny platform
DATA_1A807E:         dw $0000    ; Slime
DATA_1A8080:         dw $0000    ; Baby Luigi
DATA_1A8082:         dw $0000    ; Stork
DATA_1A8084:         dw $0000    ; Vertical pipe entrance
DATA_1A8086:         dw $0000    ; Red Giant Shy Guy
DATA_1A8088:         dw $0000    ; Green Giant Shy Guy
DATA_1A808A:         dw $0000    ; Prince Froggy, throat / before fight / throat with uvu
DATA_1A808C:         dw $0000    ; Burt the Bashful
DATA_1A808E:         dw $0000    ; Shy Guy for Rogger the Potted Ghost
DATA_1A8090:         dw $0000    ; Kamek, for scenes before boss fights
DATA_1A8092:         dw $0000    ; The head of fire of the Thunder Lakitu
DATA_1A8094:         dw $0000    ; Fire of Thunder Lakitu
DATA_1A8096:         dw $0000    ; Hypocenter of the thunder.
DATA_1A8098:         dw $0000    ; Upside down Blow Hard
DATA_1A809A:         dw $0000    ; unknown
DATA_1A809C:         dw $0000    ; Locked door
DATA_1A809E:         dw $0000    ; Middle ring
DATA_1A80A0:         dw $0000    ; (BG3) Board
DATA_1A80A2:         dw $0000    ; (BG3) Large log
DATA_1A80A4:         dw $0000    ; Balloon
DATA_1A80A6:         dw $0000    ; Kamek, says \OH MY!!!\""
DATA_1A80A8:         dw $0000    ; Upside down Wild Piranha
DATA_1A80AA:         dw $0000    ; Green Pinwheel
DATA_1A80AC:         dw $0000    ; Pink Pinwheel
DATA_1A80AE:         dw $0000    ; (BG3) Sewer ghost with Flatbed Ferry on its head
DATA_1A80B0:         dw $0000    ; Green Solo Toady
DATA_1A80B2:         dw $09AA    ; Continuous Super Star
DATA_1A80B4:         dw $0A0A    ; Spark of Raphael the Raven.
DATA_1A80B6:         dw $0000    ; Coin Bandit
DATA_1A80B8:         dw $0000    ; Pink Toadie
DATA_1A80BA:         dw $09A8    ; [CRASH]
DATA_1A80BC:         dw $0000    ; (BG3) Plank
DATA_1A80BE:         dw $0000    ; (BG3) Plank
DATA_1A80C0:         dw $09AC    ; Bomb
DATA_1A80C2:         dw $0000    ; Baby Mario
DATA_1A80C4:         dw $0000    ; Goomba
DATA_1A80C6:         dw $0000    ; Muddy Buddy
DATA_1A80C8:         dw $0000    ; Pink Pinwheel, (X: direction) (Y: size)
DATA_1A80CA:         dw $0A00    ; Red coin
DATA_1A80CC:         dw $0000    ; Wild Piranha
DATA_1A80CE:         dw $0000    ; Hidden Winged Cloud, stars / seed / flower / 1-up
DATA_1A80D0:         dw $0000    ; Flashing Egg Block
DATA_1A80D2:         dw $0000    ; Red Egg Block
DATA_1A80D4:         dw $0000    ; Yellow Egg Block
DATA_1A80D6:         dw $09A8    ; Hit green Egg Block
DATA_1A80D8:         dw $0000    ; Large Spring Ball
DATA_1A80DA:         dw $0000    ; Hootie the Blue Fish, clockwise
DATA_1A80DC:         dw $0000    ; Hootie the Blue Fish, anticlockwise
DATA_1A80DE:         dw $0000    ; Spring Ball
DATA_1A80E0:         dw $0000    ; Clawdaddy
DATA_1A80E2:         dw $09F2    ; Big Boo with 3 Boos / Big Boo / Big Boo with 3 Boos /
DATA_1A80E4:         dw $0990    ; Train Bandit
DATA_1A80E6:         dw $0000    ; (BG3) Balloon Pumper with red balloon
DATA_1A80E8:         dw $099C    ; Spike
DATA_1A80EA:         dw $0000    ; Spiked ball
DATA_1A80EC:         dw $0000    ; Piro Dangle, clockwise
DATA_1A80EE:         dw $0000    ; Piro Dangle, anticlockwise
DATA_1A80F0:         dw $0000    ; Biting Bullet Bill Blaster
DATA_1A80F2:         dw $0000    ; Bouncing Bullet Bill Blaster
DATA_1A80F4:         dw $0000    ; Bullet Bill Blaster
DATA_1A80F6:         dw $0000    ; Biting Bullet Bill
DATA_1A80F8:         dw $0000    ; Bouncing Bullet Bill
DATA_1A80FA:         dw $0000    ; Bullet Bill
DATA_1A80FC:         dw $0000    ; Dent of castella
DATA_1A80FE:         dw $0000    ; Log seesaw
DATA_1A8100:         dw $0000    ; Lava Bubble
DATA_1A8102:         dw $0000    ; Lava Bubble, jumps across
DATA_1A8104:         dw $0000    ; Chain Chomp
DATA_1A8106:         dw $0000    ; Cloud
DATA_1A8108:         dw $0000    ; Teleport sprite
DATA_1A810A:         dw $09C6    ; Harry Hedgehog
DATA_1A810C:         dw $0000    ; [CRASH]
DATA_1A810E:         dw $0964    ; Red Egg, gives 1-up
DATA_1A8110:         dw $09AA    ; Super Star
DATA_1A8112:         dw $0000    ; Red Flatbed Ferry, moving horizontally
DATA_1A8114:         dw $0000    ; Pink Flatbed Ferry, moving vertically
DATA_1A8116:         dw $0000    ; Mock Up, green / red
DATA_1A8118:         dw $0000    ; Yoshi, at the Goal
DATA_1A811A:         dw $0000    ; Fly Guy, 5 stars / red coin / 1-up / 1-up
DATA_1A811C:         dw $0000    ; Kamek, at Bowser's room
DATA_1A811E:         dw $0000    ; Swing of Grinders
DATA_1A8120:         dw $0000    ; (BG3) Dangling Ghost
DATA_1A8122:         dw $0000    ; 4 Toadies
DATA_1A8124:         dw $0000    ; Melon Bug
DATA_1A8126:         dw $0000    ; Door
DATA_1A8128:         dw $0000    ; Expansion Block
DATA_1A812A:         dw $0000    ; Blue checkered block
DATA_1A812C:         dw $0000    ; Red checkered block
DATA_1A812E:         dw $0000    ; POW
DATA_1A8130:         dw $0000    ; Yoshi Block
DATA_1A8132:         dw $09C2    ; Spiny Egg
DATA_1A8134:         dw $0000    ; Chained green Flatbed Ferry
DATA_1A8136:         dw $0A1A    ; Mace Guy
DATA_1A8138:         dw $0000    ; Mace
DATA_1A813A:         dw $0000    ; !-switch
DATA_1A813C:         dw $0000    ; Chomp Rock
DATA_1A813E:         dw $0000    ; Wild Ptooie Piranha, spits 1 / 3 Needlenose
DATA_1A8140:         dw $0000    ; Tulip
DATA_1A8142:         dw $09AE    ; Pot of Potted Spiked Fun Guy
DATA_1A8144:         dw $0000    ; Fireball of Thunder Lakitu
DATA_1A8146:         dw $0000    ; Bandit, getting under cover, left
DATA_1A8148:         dw $0000    ; Bandit, getting under cover, right
DATA_1A814A:         dw $0000    ; Nep-Enut / Gargantua Blargg
DATA_1A814C:         dw $0000    ; Incoming Chomp
DATA_1A814E:         dw $0000    ; Flock of Incoming Chomps
DATA_1A8150:         dw $0000    ; Falling Incoming Chomp
DATA_1A8152:         dw $0000    ; Shadow of falling Incoming Chomp
DATA_1A8154:         dw $0000    ; Shy Guy in background
DATA_1A8156:         dw $0964    ; Fill Eggs
DATA_1A8158:         dw $0000    ; Sign Arrow and Shadow
DATA_1A815A:         dw $0000    ; Hint Block
DATA_1A815C:         dw $0000    ; Hookbill the Koopa
DATA_1A815E:         dw $092C    ; Morph Bubble, Car
DATA_1A8160:         dw $092C    ; Morph Bubble, Mole Tank
DATA_1A8162:         dw $092C    ; Morph Bubble, Helicopter
DATA_1A8164:         dw $092C    ; Morph Bubble, Train
DATA_1A8166:         dw $0000    ; Wind of Fuzzy
DATA_1A8168:         dw $092C    ; Morph Bubble, Submarine
DATA_1A816A:         dw $0000    ; Hidden Winged Cloud, 1-up / 5 stars / !-switch / 5 sta
DATA_1A816C:         dw $0000    ; Winged Cloud, 8 coins
DATA_1A816E:         dw $0000    ; Winged Cloud, bubbled 1-up
DATA_1A8170:         dw $0000    ; Winged Cloud, flower
DATA_1A8172:         dw $0000    ; Winged Cloud, POW
DATA_1A8174:         dw $092C    ; Winged Cloud, stairs, right / left
DATA_1A8176:         dw $092C    ; Winged Cloud, platform, right / left
DATA_1A8178:         dw $0000    ; Winged Cloud, Bandit
DATA_1A817A:         dw $0000    ; Winged Cloud, coin (object)
DATA_1A817C:         dw $0000    ; Winged Cloud, 1-up
DATA_1A817E:         dw $0000    ; Winged Cloud, key
DATA_1A8180:         dw $0000    ; Winged Cloud, 3 stars
DATA_1A8182:         dw $0000    ; Winged Cloud, 5 stars
DATA_1A8184:         dw $0000    ; Winged Cloud, door
DATA_1A8186:         dw $0000    ; Winged Cloud, ground eater
DATA_1A8188:         dw $0000    ; Winged Cloud, watermelon
DATA_1A818A:         dw $0000    ; Winged Cloud, fire watermelon
DATA_1A818C:         dw $0000    ; Winged Cloud, icy watermelon
DATA_1A818E:         dw $09CA    ; Winged Cloud, seed of sunflower with 3 leaves
DATA_1A8190:         dw $09CA    ; Winged Cloud, seed of sunflower with 6 leaves
DATA_1A8192:         dw $0000    ; Winged Cloud, [CRASH]
DATA_1A8194:         dw $0000    ; Boss Door of Bowser's room
DATA_1A8196:         dw $0000    ; Winged Cloud, random item.
DATA_1A8198:         dw $0000    ; Winged Cloud, !-switch / !-switch
DATA_1A819A:         dw $0000    ; Baron Von Zeppelin, Giant Egg
DATA_1A819C:         dw $0000    ; Bowser's flame
DATA_1A819E:         dw $0000    ; Bowser's quake
DATA_1A81A0:         dw $0000    ; Horizontal entrance, towards right
DATA_1A81A2:         dw $0000    ; Hidden entrance, revealed by an ! switch
DATA_1A81A4:         dw $0000    ; Marching Milde
DATA_1A81A6:         dw $0000    ; Giant Milde
DATA_1A81A8:         dw $0000    ; Large Milde
DATA_1A81AA:         dw $0000    ; Moutain backgrounds at fight with Hookbill the Koopa
DATA_1A81AC:         dw $0000    ; (BG3) Ghost with Flatbed Ferry on its head
DATA_1A81AE:         dw $0000    ; Sluggy the Unshaven
DATA_1A81B0:         dw $0000    ; Chomp signboard.
DATA_1A81B2:         dw $0000    ; Fishin' Lakitu
DATA_1A81B4:         dw $0000    ; Flower pot, key / 6 stars / 6 coins / nothing
DATA_1A81B6:         dw $0000    ; (BG3) Soft thing
DATA_1A81B8:         dw $0000    ; Snowball
DATA_1A81BA:         dw $0000    ; Closer, in Naval Piranha's room
DATA_1A81BC:         dw $0000    ; Falling Rock
DATA_1A81BE:         dw $0000    ; Piscatory Pete, Blue / Gold
DATA_1A81C0:         dw $09EA    ; Preying Mantas
DATA_1A81C2:         dw $0000    ; Loch Nestor
DATA_1A81C4:         dw $0000    ; Boo Blah, normal / upside down
DATA_1A81C6:         dw $0000    ; Boo Blah with Piro Dangle, normal / upside down
DATA_1A81C8:         dw $0000    ; Heading cactus
DATA_1A81CA:         dw $09B2    ; Green Needlenose
DATA_1A81CC:         dw $0000    ; Gusty, left / right / infinite right / infinite left
DATA_1A81CE:         dw $0000    ; Burt, two / one
DATA_1A81D0:         dw $0000    ; Goonie, right / towards Yoshi / generator right / gene
DATA_1A81D2:         dw $0000    ; 3 Flightless Goonies
DATA_1A81D4:         dw $0000    ; Cloud Drop, moving vertically
DATA_1A81D6:         dw $0000    ; Cloud Drop, moving horizontally
DATA_1A81D8:         dw $0000    ; Flamer Guy, jumping around
DATA_1A81DA:         dw $0000    ; Flamer Guy, walking around
DATA_1A81DC:         dw $0000    ; Eggo-Dil
DATA_1A81DE:         dw $0000    ; Eggo-Dil's face
DATA_1A81E0:         dw $09B4    ; Petal of Eggo-Dil
DATA_1A81E2:         dw $0000    ; Bubble-Plant
DATA_1A81E4:         dw $0000    ; Stilt Guy, green / red / yellow / purple
DATA_1A81E6:         dw $09F8    ; Woozy Guy, green / red / yellow / purple
DATA_1A81E8:         dw $0000    ; Egg-Plant / Needlenose-Plant
DATA_1A81EA:         dw $0000    ; Slugger
DATA_1A81EC:         dw $0000    ; Parent and children of Huffin' Puffins
DATA_1A81EE:         dw $0000    ; Barney Bubble
DATA_1A81F0:         dw $0000    ; Blow Hard
DATA_1A81F2:         dw $09B6    ; Yellow Needlenose
DATA_1A81F4:         dw $0000    ; Flower
DATA_1A81F6:         dw $0000    ; Spear Guy, long spear
DATA_1A81F8:         dw $0000    ; Spear Guy, short spear
DATA_1A81FA:         dw $0000    ; Zeus Guy
DATA_1A81FC:         dw $0000    ; Energy of Zeus Guy
DATA_1A81FE:         dw $0000    ; Poochy
DATA_1A8200:         dw $0000    ; Bubbled 1-up
DATA_1A8202:         dw $0000    ; Spiky mace
DATA_1A8204:         dw $0000    ; Spiky mace, double-ended
DATA_1A8206:         dw $0000    ; Boo Guys spinning spiky mace
DATA_1A8208:         dw $0000    ; Jean de Fillet, right / left
DATA_1A820A:         dw $0000    ; Boo Guys, carrying bombs towards left.
DATA_1A820C:         dw $0000    ; Boo Guys, carrying bombs towards right
DATA_1A820E:         dw $09B8    ; Seed of watermelon
DATA_1A8210:         dw $0000    ; Milde
DATA_1A8212:         dw $0000    ; Tap-Tap
DATA_1A8214:         dw $0000    ; Tap-Tap, stays on ledges
DATA_1A8216:         dw $0000    ; Hopping Tap-tap
DATA_1A8218:         dw $0000    ; Chained spike ball, controlled by Boo Guy
DATA_1A821A:         dw $0000    ; Boo Guy, rotating a pulley, right / left
DATA_1A821C:         dw $0000    ; Crate, 6 stars
DATA_1A821E:         dw $0000    ; Boo Man Bluff
DATA_1A8220:         dw $0000    ; Flower
DATA_1A8222:         dw $0000    ; Georgette Jelly
DATA_1A8224:         dw $09BA    ; Splashed Georgette Jelly
DATA_1A8226:         dw $0000    ; Snifit
DATA_1A8228:         dw $0000    ; Bullet, shot by Snifit
DATA_1A822A:         dw $0A00    ; Coin, gravity affected
DATA_1A822C:         dw $0000    ; Floating round platform on water
DATA_1A822E:         dw $09C0    ; Donut Lift
DATA_1A8230:         dw $0000    ; Giant Donut Lift
DATA_1A8232:         dw $0000    ; Spooky
DATA_1A8234:         dw $0000    ; Green Glove
DATA_1A8236:         dw $0000    ; Lakitu, one / two
DATA_1A8238:         dw $0000    ; Lakitu's cloud
DATA_1A823A:         dw $09C2    ; Spiny Egg
DATA_1A823C:         dw $0000    ; Brown Arrow Wheel
DATA_1A823E:         dw $0000    ; Blue Arrow Wheel
DATA_1A8240:         dw $0000    ; Double-ended arrow lift
DATA_1A8242:         dw $0000    ; Explosion of Number Platform
DATA_1A8244:         dw $0000    ; ? bucket, Bandit
DATA_1A8246:         dw $0000    ; ? bucket, 5 coins
DATA_1A8248:         dw $0000    ; Stretch, green / red / yellow / purple
DATA_1A824A:         dw $0000    ; Kamek, for the ending scene / flying and chases
DATA_1A824C:         dw $0000    ; Spiked log held by chain and pulley
DATA_1A824E:         dw $0000    ; ? Pulley
DATA_1A8250:         dw $0000    ; Ground shake
DATA_1A8252:         dw $0000    ; Fuzzy
DATA_1A8254:         dw $0000    ; Shy Guy, with Bandit hidden
DATA_1A8256:         dw $0000    ; Fat Guy, red / green
DATA_1A8258:         dw $0000    ; Fly Guy carrying red coin / Whirly Fly Guy
DATA_1A825A:         dw $0000    ; Yoshi, in the intro scene
DATA_1A825C:         dw $0000    ; unknown
DATA_1A825E:         dw $0000    ; Lava Drop, moving horizontally
DATA_1A8260:         dw $0000    ; Lava Drop, moving vertically
DATA_1A8262:         dw $0000    ; Locked door
DATA_1A8264:         dw $0000    ; Lemon Drop
DATA_1A8266:         dw $0000    ; Lantern Ghost
DATA_1A8268:         dw $0000    ; Baby Bowser
DATA_1A826A:         dw $0000    ; Raven, always circling, anticlockwise / clockwise
DATA_1A826C:         dw $0000    ; Raven, anticlockwise / clockwise initially
DATA_1A826E:         dw $0000    ; 3x6 Falling Rock
DATA_1A8270:         dw $0000    ; 3x3 Falling Rock
DATA_1A8272:         dw $0000    ; 3x9 Falling Rock
DATA_1A8274:         dw $0000    ; 6x3 Falling Rock
DATA_1A8276:         dw $0AF4    ; Stomach Acid
DATA_1A8278:         dw $0000    ; Flipper, downwards
DATA_1A827A:         dw $0000    ; Fang, dangling
DATA_1A827C:         dw $0000    ; Fang, flying wavily
DATA_1A827E:         dw $0000    ; Flopsy Fish, swimming around
DATA_1A8280:         dw $0000    ; Flopsy Fish, swimming and occasionally jumps verticall
DATA_1A8282:         dw $0000    ; Flopsy Fish, swimming and jumps in an arc
DATA_1A8284:         dw $0000    ; Flopsy Fish, jumps 3 times in an arc, right / left
DATA_1A8286:         dw $0000    ; Spray Fish
DATA_1A8288:         dw $0000    ; Flipper, rightwards / leftwards
DATA_1A828A:         dw $0000    ; Blue Sluggy, falling down / crawing ceiling
DATA_1A828C:         dw $0000    ; Pink Sluggy, falling down / crawing ceiling but doesn'
DATA_1A828E:         dw $0000    ; Horizontal entrance, towards left
DATA_1A8290:         dw $0000    ; Large Spring Ball
DATA_1A8292:         dw $0000    ; Arrow cloud, up
DATA_1A8294:         dw $0000    ; Arrow cloud, up right
DATA_1A8296:         dw $0000    ; Arrow cloud, right
DATA_1A8298:         dw $0000    ; Arrow cloud, down right
DATA_1A829A:         dw $0000    ; Arrow cloud, down
DATA_1A829C:         dw $0000    ; Arrow cloud, down left
DATA_1A829E:         dw $0000    ; Arrow cloud, left
DATA_1A82A0:         dw $0000    ; Arrow cloud, up left
DATA_1A82A2:         dw $0000    ; Arrow cloud, rotating
DATA_1A82A4:         dw $0000    ; Flutter
DATA_1A82A6:         dw $0000    ; Goonie with Shy Guy
DATA_1A82A8:         dw $0000    ; Shark Chomp
DATA_1A82AA:         dw $0000    ; Very Goonie
DATA_1A82AC:         dw $0000    ; Cactus Jack, one / three
DATA_1A82AE:         dw $0000    ; Wall Lakitu
DATA_1A82B0:         dw $0000    ; Bowling Goonie
DATA_1A82B2:         dw $0000    ; Grunt, walking
DATA_1A82B4:         dw $0000    ; Grunt, running
DATA_1A82B6:         dw $0000    ; Dancing Spear Guy
DATA_1A82B8:         dw $09C4    ; Green switch for green spiked platform
DATA_1A82BA:         dw $09C4    ; Red switch for red spiked platform
DATA_1A82BC:         dw $0000    ; Pink Pinwheel with Shy Guys, clockwise / anticlockwise
DATA_1A82BE:         dw $0000    ; Green spiked platform
DATA_1A82C0:         dw $0000    ; Red spiked platform
DATA_1A82C2:         dw $0000    ; Bonus Item, red coin / key / flower / door
DATA_1A82C4:         dw $0000    ; Two spiked platforms with one switch in the center
DATA_1A82C6:         dw $09D6    ; Bouncing green Needlenose
DATA_1A82C8:         dw $0000    ; Nipper Plant
DATA_1A82CA:         dw $0000    ; Nipper Spore
DATA_1A82CC:         dw $0000    ; Thunder Lakitu, one / two
DATA_1A82CE:         dw $09CC    ; Green Koopa shell
DATA_1A82D0:         dw $09CC    ; Red Koopa shell
DATA_1A82D2:         dw $0000    ; Green Beach Koopa
DATA_1A82D4:         dw $0000    ; Red Beach Koopa
DATA_1A82D6:         dw $09CC    ; Green Koopa
DATA_1A82D8:         dw $09CC    ; Red Koopa
DATA_1A82DA:         dw $09D4    ; Green Para Koopa, jumping forth.
DATA_1A82DC:         dw $09D4    ; Red Para Koopa, flying horizontally
DATA_1A82DE:         dw $09D4    ; Red Para Koopa, flying vertically
DATA_1A82E0:         dw $0000    ; Aqua Lakitu
DATA_1A82E2:         dw $0000    ; Naval Piranha
DATA_1A82E4:         dw $0000    ; Naval Bud
DATA_1A82E6:         dw $0000    ; Baron Von Zeppelin, red Suy Guy
DATA_1A82E8:         dw $0000    ; Baron Von Zeppelin, Needlenose
DATA_1A82EA:         dw $0000    ; Baron Von Zeppelin, bomb
DATA_1A82EC:         dw $0000    ; Baron Von Zeppelin, Bandit
DATA_1A82EE:         dw $0000    ; Baron Von Zeppelin, large Spring Ball
DATA_1A82F0:         dw $0000    ; Baron Von Zeppelin, 1-up
DATA_1A82F2:         dw $0000    ; Baron Von Zeppelin, key
DATA_1A82F4:         dw $0000    ; Baron Von Zeppelin, 5 coins
DATA_1A82F6:         dw $0000    ; Baron Von Zeppelin, watermelon
DATA_1A82F8:         dw $0000    ; Baron Von Zeppelin, fire watermelon
DATA_1A82FA:         dw $0000    ; Baron Von Zeppelin, icy watermelon
DATA_1A82FC:         dw $0000    ; Baron Von Zeppelin, crate, 6 stars.
DATA_1A82FE:         dw $0000    ; Baron Von Zeppelin
DATA_1A8300:         dw $0000    ; Spinning Log
DATA_1A8302:         dw $0000    ; Crazee Dayzee
DATA_1A8304:         dw $09D8    ; Dragonfly
DATA_1A8306:         dw $09DC    ; Butterfly
DATA_1A8308:         dw $0000    ; Bumpty
DATA_1A830A:         dw $0000    ; Active line guided green Flatbed Ferry, left
DATA_1A830C:         dw $0000    ; Active line guided green Flatbed Ferry, right
DATA_1A830E:         dw $0000    ; Active line guided yellow Flatbed Ferry, left
DATA_1A8310:         dw $0000    ; Active line guided yellow Flatbed Ferry, right
DATA_1A8312:         dw $0000    ; Line guided green Flatbed Ferry, left
DATA_1A8314:         dw $0000    ; Line guided green Flatbed Ferry, right
DATA_1A8316:         dw $0000    ; Line guided yellow Flatbed Ferry, left
DATA_1A8318:         dw $0000    ; Line guided yellow Flatbed Ferry, right
DATA_1A831A:         dw $0000    ; Line guided red Flatbed Ferry, left
DATA_1A831C:         dw $0000    ; Line guided red Flatbed Ferry, right
DATA_1A831E:         dw $0000    ; Whirling lift
DATA_1A8320:         dw $0000    ; Falling icicle
DATA_1A8322:         dw $09E0    ; Sparrow
DATA_1A8324:         dw $0000    ; Muti Guy, green / red / yellow / purple
DATA_1A8326:         dw $0000    ; Caged Ghost, squeezing in sewer
DATA_1A8328:         dw $0000    ; Blargg
DATA_1A832A:         dw $0000    ; unknown
DATA_1A832C:         dw $0000    ; Unbalanced snowy platform
DATA_1A832E:         dw $0000    ; Arrow sign, up / right / left / down
DATA_1A8330:         dw $0000    ; Diagonal arrow sign, up left / up right / down left /
DATA_1A8332:         dw $0000    ; Dizzy Dandy
DATA_1A8334:         dw $09E6    ; Boo Guy
DATA_1A8336:         dw $0000    ; Bumpty, tackles at Yoshi
DATA_1A8338:         dw $0000    ; Flying Bumpty, flying aronnd / flying straightly
DATA_1A833A:         dw $0000    ; Skeleton Goonie
DATA_1A833C:         dw $0000    ; Flightless Skeleton Goonie
DATA_1A833E:         dw $0000    ; Skeleton Goonie with a bomb
DATA_1A8340:         dw $0000    ; Firebar, double-ended, clockwise / anticlockwise
DATA_1A8342:         dw $0000    ; Firebar, clockwise / anticlockwise
DATA_1A8344:         dw $0000    ; Star
DATA_1A8346:         dw $0000    ; Little Skull Mouser
DATA_1A8348:         dw $0000    ; Cork, seals 3D pipe
DATA_1A834A:         dw $0000    ; Grinder, runs away
DATA_1A834C:         dw $0000    ; Grinder, spits seeds of watermelon
DATA_1A834E:         dw $0000    ; Short Fuse / Seedy Sally, right / left
DATA_1A8350:         dw $0000    ; Grinder, grasps Baby Mario
DATA_1A8352:         dw $0000    ; Grinder, climbing, spits seeds of watermelon
DATA_1A8354:         dw $0000    ; Hot Lips
DATA_1A8356:         dw $0000    ; Boo Balloon, coin / !-switch
DATA_1A8358:         dw $0000    ; Frog
DATA_1A835A:         dw $0000    ; Kamek, shoots magic at Yoshi.
DATA_1A835C:         dw $0000    ; Kamek's magic
DATA_1A835E:         dw $0A00    ; Coin
DATA_1A8360:         dw $0A08    ; (BG3) Balloon
DATA_1A8362:         dw $0000    ; Coin Cannon for Mini Battle
DATA_1A8364:         dw $0A00    ; Coin for Mini Battle
DATA_1A8366:         dw $0000    ; Bandit for Mini Battle
DATA_1A8368:         dw $0000    ; Checkered Platform for Mini Battle
DATA_1A836A:         dw $0000    ; Bandit for Mini Battle
DATA_1A836C:         dw $0000    ; Red Balloon for Mini Battle
DATA_1A836E:         dw $0000    ; Bandit for Mini Battle
DATA_1A8370:         dw $0000    ; Watermelon Pot for Mini Battle
DATA_1A8372:         dw $0000    ; possibly Bandit for Mini Battle

; same table still? unused sprites?
DATA_1A8374:         dw $0000
DATA_1A8376:         dw $0A22
DATA_1A8378:         dw $0A24
DATA_1A837A:         dw $0A26
DATA_1A837C:         dw $0000
DATA_1A837E:         dw $0000
DATA_1A8380:         dw $0A28
DATA_1A8382:         dw $0000
DATA_1A8384:         dw $0000
DATA_1A8386:         dw $0000
DATA_1A8388:         dw $0000
DATA_1A838A:         dw $0000
DATA_1A838C:         dw $0A2E
DATA_1A838E:         dw $0A3A
DATA_1A8390:         dw $0A3E
DATA_1A8392:         dw $0A44
DATA_1A8394:         dw $095E
DATA_1A8396:         dw $0000
DATA_1A8398:         dw $0000
DATA_1A839A:         dw $0000
DATA_1A839C:         dw $0A48
DATA_1A839E:         dw $0A4C
DATA_1A83A0:         dw $0000
DATA_1A83A2:         dw $0000
DATA_1A83A4:         dw $0000
DATA_1A83A6:         dw $0000
DATA_1A83A8:         dw $0000
DATA_1A83AA:         dw $0000
DATA_1A83AC:         dw $0A50
DATA_1A83AE:         dw $0A58
DATA_1A83B0:         dw $0A5A
DATA_1A83B2:         dw $0A62
DATA_1A83B4:         dw $0A68
DATA_1A83B6:         dw $0000
DATA_1A83B8:         dw $0000
DATA_1A83BA:         dw $0A70
DATA_1A83BC:         dw $0A68
DATA_1A83BE:         dw $0A7A
DATA_1A83C0:         dw $0000
DATA_1A83C2:         dw $0000
DATA_1A83C4:         dw $0000
DATA_1A83C6:         dw $0000
DATA_1A83C8:         dw $0000
DATA_1A83CA:         dw $0A86
DATA_1A83CC:         dw $0000
DATA_1A83CE:         dw $0000
DATA_1A83D0:         dw $0000
DATA_1A83D2:         dw $0000
DATA_1A83D4:         dw $0000
DATA_1A83D6:         dw $0000
DATA_1A83D8:         dw $0A90
DATA_1A83DA:         dw $0000
DATA_1A83DC:         dw $0000
DATA_1A83DE:         dw $0000
DATA_1A83E0:         dw $0A70
DATA_1A83E2:         dw $0000
DATA_1A83E4:         dw $0000
DATA_1A83E6:         dw $0A92
DATA_1A83E8:         dw $0000
DATA_1A83EA:         dw $0000
DATA_1A83EC:         dw $0000
DATA_1A83EE:         dw $0000
DATA_1A83F0:         dw $0A94
DATA_1A83F2:         dw $0000
DATA_1A83F4:         dw $0A9A
DATA_1A83F6:         dw $0AA2
DATA_1A83F8:         dw $0AAA
DATA_1A83FA:         dw $0000
DATA_1A83FC:         dw $0000
DATA_1A83FE:         dw $0AAC
DATA_1A8400:         dw $0AAE
DATA_1A8402:         dw $0000
DATA_1A8404:         dw $0ABE
DATA_1A8406:         dw $0AC0
DATA_1A8408:         dw $0000
DATA_1A840A:         dw $0ACE
DATA_1A840C:         dw $0AD4
DATA_1A840E:         dw $0ADA
DATA_1A8410:         dw $0000
DATA_1A8412:         dw $0000
DATA_1A8414:         dw $0000
DATA_1A8416:         dw $0000
DATA_1A8418:         dw $0000
DATA_1A841A:         dw $0000
DATA_1A841C:         dw $0000
DATA_1A841E:         dw $0000
DATA_1A8420:         dw $0000
DATA_1A8422:         dw $0000
DATA_1A8424:         dw $0AF2
DATA_1A8426:         dw $0000
DATA_1A8428:         dw $0000
DATA_1A842A:         dw $0AAC
DATA_1A842C:         dw $0AE2
DATA_1A842E:         dw $0AEA
DATA_1A8430:         dw $0000
DATA_1A8432:         dw $0AE2
DATA_1A8434:         dw $0000
DATA_1A8436:         dw $0AD4
DATA_1A8438:         dw $0000
DATA_1A843A:         dw $0000
DATA_1A843C:         dw $0000
DATA_1A843E:         dw $0000
DATA_1A8440:         dw $0000
DATA_1A8442:         dw $0000
DATA_1A8444:         dw $0000
DATA_1A8446:         dw $0ADC
DATA_1A8448:         dw $0000
DATA_1A844A:         dw $0000
DATA_1A844C:         dw $0A00
DATA_1A844E:         dw $0AF8
DATA_1A8450:         dw $0000
DATA_1A8452:         dw $09B8
DATA_1A8454:         dw $0000
DATA_1A8456:         dw $0000
DATA_1A8458:         dw $0000
DATA_1A845A:         dw $0000
DATA_1A845C:         dw $0000
DATA_1A845E:         dw $0000
DATA_1A8460:         dw $0000
DATA_1A8462:         dw $0000
DATA_1A8464:         dw $0000
DATA_1A8466:         dw $0000
DATA_1A8468:         dw $0000
DATA_1A846A:         dw $0AFA
DATA_1A846C:         dw $0000
DATA_1A846E:         dw $0000
DATA_1A8470:         dw $0AFE
DATA_1A8472:         dw $0000
DATA_1A8474:         dw $0000
DATA_1A8476:         dw $0000
DATA_1A8478:         dw $0B00
DATA_1A847A:         dw $0000
DATA_1A847C:         dw $0000
DATA_1A847E:         dw $0000
DATA_1A8480:         dw $0000
DATA_1A8482:         dw $0000
DATA_1A8484:         dw $0000
DATA_1A8486:         dw $0000
DATA_1A8488:         dw $0000

; sprite pointer table
; these are pointers to tables
; in bank 4D (that's this bank & 1B together)
; this table is for 01 & 03 drawing methods
; the tables contain OAM information for the sprite
DATA_1A848A:         dw $1040    ; Log, floating on water / lava
DATA_1A848C:         dw $9407    ; Closed door
DATA_1A848E:         dw $C03A    ; Naval Piranha's stalk
DATA_1A8490:         dw $209E    ; Crate, key
DATA_1A8492:         dw $0000    ; Item from Star Mario block
DATA_1A8494:         dw $0000    ; Icy watermelon
DATA_1A8496:         dw $0000    ; Chill
DATA_1A8498:         dw $0000    ; Watermelon
DATA_1A849A:         dw $F933    ; Rubble
DATA_1A849C:         dw $0000    ; Fire watermelon
DATA_1A849E:         dw $0C3A    ; Kaboomba
DATA_1A84A0:         dw $0000    ; Cannonball of Kaboomba
DATA_1A84A2:         dw $CDBE    ; Raphael the Raven
DATA_1A84A4:         dw $AFAF    ; Goal
DATA_1A84A6:         dw $0000    ; G O A L !
DATA_1A84A8:         dw $0000    ; BONUS CHALLENGE
DATA_1A84AA:         dw $DD22    ; Caged Ghost, round mound
DATA_1A84AC:         dw $1040    ; Item Card
DATA_1A84AE:         dw $9407    ; Boss Door
DATA_1A84B0:         dw $0000    ; Boss Explosion
DATA_1A84B2:         dw $1040    ; Key from defeated boss
DATA_1A84B4:         dw $0000    ; Torpedo of Yoshi Submarine
DATA_1A84B6:         dw $D502    ; Bigger Boo
DATA_1A84B8:         dw $0000    ; Frog Pirate
DATA_1A84BA:         dw $0000    ; Flame of Red Watermelon
DATA_1A84BC:         dw $0000    ; Bubble
DATA_1A84BE:         dw $10E0    ; Ski lift
DATA_1A84C0:         dw $1108    ; Vertical log, floating on lava
DATA_1A84C2:         dw $1040    ; Dr. Freezegood, nothing / 6 stars / 1-u
DATA_1A84C4:         dw $10E0    ; Dr. Freezegood, with ski lift
DATA_1A84C6:         dw $9605    ; Shy Guy, green / red / yellow / purple
DATA_1A84C8:         dw $FA37    ; Rotating Doors
DATA_1A84CA:         dw $247C    ; Bandit
DATA_1A84CC:         dw $8D9F    ; ? bucket
DATA_1A84CE:         dw $0000    ; Flashing Egg
DATA_1A84D0:         dw $0000    ; Red Egg
DATA_1A84D2:         dw $0000    ; Yellow Egg
DATA_1A84D4:         dw $0000    ; Green Egg
DATA_1A84D6:         dw $F447    ; Giant Egg, for battle with Bowser
DATA_1A84D8:         dw $096E    ; Key
DATA_1A84DA:         dw $5B09    ; Huffin' Puffin, running away
DATA_1A84DC:         dw $B71B    ; Giant Egg, for battle with Prince Frogg
DATA_1A84DE:         dw $B77F    ; Red Giant Egg
DATA_1A84E0:         dw $B77F    ; Green Giant Egg
DATA_1A84E2:         dw $1496    ; Lunge Fish
DATA_1A84E4:         dw $1040    ; Salvo the Slime
DATA_1A84E6:         dw $2D78    ; Salve the Slime's eyes
DATA_1A84E8:         dw $0000    ; Little Mouser's Nest
DATA_1A84EA:         dw $1608    ; Little Mouser
DATA_1A84EC:         dw $0000    ; Potted Spiked Fun Guy
DATA_1A84EE:         dw $1973    ; Little Mouser, looking around, in nest
DATA_1A84F0:         dw $1608    ; Little Mouser, from nest
DATA_1A84F2:         dw $D6E2    ; Rogger the Potted Ghost
DATA_1A84F4:         dw $D6FB    ; Falling down Rogger the Potted Ghost?
DATA_1A84F6:         dw $0000    ; (BG3) Falling down wall
DATA_1A84F8:         dw $0000    ; Grim Leecher
DATA_1A84FA:         dw $0000    ; Flame spat by Rogger the Potted Ghost
DATA_1A84FC:         dw $0000    ; (BG3) Spinning wooden platform
DATA_1A84FE:         dw $AEBF    ; 3 Mini-Ravens
DATA_1A8500:         dw $AEBF    ; Mini-Raven
DATA_1A8502:         dw $702B    ; Tap-Tap the Red Nose
DATA_1A8504:         dw $0000    ; (BG3) Seesaw
DATA_1A8506:         dw $2ABC    ; Skinny platform
DATA_1A8508:         dw $0000    ; Slime
DATA_1A850A:         dw $F5AF    ; Baby Luigi
DATA_1A850C:         dw $F6A9    ; Stork
DATA_1A850E:         dw $0000    ; Vertical pipe entrance
DATA_1A8510:         dw $E36C    ; Red Giant Shy Guy
DATA_1A8512:         dw $E36C    ; Green Giant Shy Guy
DATA_1A8514:         dw $EB19    ; Prince Froggy, throat / before fight /
DATA_1A8516:         dw $0000    ; Burt the Bashful
DATA_1A8518:         dw $D5DE    ; Shy Guy for Rogger the Potted Ghost
DATA_1A851A:         dw $E231    ; Kamek, for scenes before boss fights
DATA_1A851C:         dw $0000    ; The head of fire of the Thunder Lakitu
DATA_1A851E:         dw $B1E4    ; Fire of Thunder Lakitu
DATA_1A8520:         dw $B1E4    ; Hypocenter of the thunder.
DATA_1A8522:         dw $5D11    ; Upside down Blow Hard
DATA_1A8524:         dw $1040    ; unknown
DATA_1A8526:         dw $9407    ; Locked door
DATA_1A8528:         dw $0000    ; Middle ring
DATA_1A852A:         dw $0000    ; (BG3) Board
DATA_1A852C:         dw $0000    ; (BG3) Large log
DATA_1A852E:         dw $1040    ; Balloon
DATA_1A8530:         dw $E231    ; Kamek, says \OH MY!!!\""
DATA_1A8532:         dw $1FF4    ; Upside down Wild Piranha
DATA_1A8534:         dw $BCDE    ; Green Pinwheel
DATA_1A8536:         dw $BCDE    ; Pink Pinwheel
DATA_1A8538:         dw $F109    ; (BG3) Sewer ghost with Flatbed Ferry on
DATA_1A853A:         dw $2DD2    ; Green Solo Toady
DATA_1A853C:         dw $0000    ; Continuous Super Star
DATA_1A853E:         dw $F95B    ; Spark of Raphael the Raven.
DATA_1A8540:         dw $247C    ; Coin Bandit
DATA_1A8542:         dw $2DD2    ; Pink Toadie
DATA_1A8544:         dw $0000    ; [CRASH]
DATA_1A8546:         dw $0000    ; (BG3) Plank
DATA_1A8548:         dw $0000    ; (BG3) Plank
DATA_1A854A:         dw $0000    ; Bomb
DATA_1A854C:         dw $1B9E    ; Baby Mario
DATA_1A854E:         dw $BD33    ; Goomba
DATA_1A8550:         dw $5C3F    ; Muddy Buddy
DATA_1A8552:         dw $BCDE    ; Pink Pinwheel, (X: direction) (Y: size)
DATA_1A8554:         dw $0000    ; Red coin
DATA_1A8556:         dw $1FF4    ; Wild Piranha
DATA_1A8558:         dw $0000    ; Hidden Winged Cloud, stars / seed / flo
DATA_1A855A:         dw $2184    ; Flashing Egg Block
DATA_1A855C:         dw $2184    ; Red Egg Block
DATA_1A855E:         dw $2184    ; Yellow Egg Block
DATA_1A8560:         dw $1040    ; Hit green Egg Block
DATA_1A8562:         dw $203A    ; Large Spring Ball
DATA_1A8564:         dw $1040    ; Hootie the Blue Fish, clockwise
DATA_1A8566:         dw $1040    ; Hootie the Blue Fish, anticlockwise
DATA_1A8568:         dw $203A    ; Spring Ball
DATA_1A856A:         dw $20B2    ; Clawdaddy
DATA_1A856C:         dw $D502    ; Big Boo with 3 Boos / Big Boo / Big Boo
DATA_1A856E:         dw $0000    ; Train Bandit
DATA_1A8570:         dw $286E    ; (BG3) Balloon Pumper with red balloon
DATA_1A8572:         dw $0000    ; Spike
DATA_1A8574:         dw $1040    ; Spiked ball
DATA_1A8576:         dw $210C    ; Piro Dangle, clockwise
DATA_1A8578:         dw $210C    ; Piro Dangle, anticlockwise
DATA_1A857A:         dw $225B    ; Biting Bullet Bill Blaster
DATA_1A857C:         dw $225B    ; Bouncing Bullet Bill Blaster
DATA_1A857E:         dw $225B    ; Bullet Bill Blaster
DATA_1A8580:         dw $1040    ; Biting Bullet Bill
DATA_1A8582:         dw $1040    ; Bouncing Bullet Bill
DATA_1A8584:         dw $F587    ; Bullet Bill
DATA_1A8586:         dw $0000    ; Dent of castella
DATA_1A8588:         dw $28B9    ; Log seesaw
DATA_1A858A:         dw $1040    ; Lava Bubble
DATA_1A858C:         dw $1040    ; Lava Bubble, jumps across
DATA_1A858E:         dw $2274    ; Chain Chomp
DATA_1A8590:         dw $F40B    ; Cloud
DATA_1A8592:         dw $0000    ; Teleport sprite
DATA_1A8594:         dw $285A    ; Harry Hedgehog
DATA_1A8596:         dw $1040    ; [CRASH]
DATA_1A8598:         dw $0000    ; Red Egg, gives 1-up
DATA_1A859A:         dw $0000    ; Super Star
DATA_1A859C:         dw $28AA    ; Red Flatbed Ferry, moving horizontally
DATA_1A859E:         dw $28AA    ; Pink Flatbed Ferry, moving vertically
DATA_1A85A0:         dw $F59B    ; Mock Up, green / red
DATA_1A85A2:         dw $1040    ; Yoshi, at the Goal
DATA_1A85A4:         dw $0000    ; Fly Guy, 5 stars / red coin / 1-up / 1-
DATA_1A85A6:         dw $D0F2    ; Kamek, at Bowser's room
DATA_1A85A8:         dw $28B9    ; Swing of Grinders
DATA_1A85AA:         dw $DD22    ; (BG3) Dangling Ghost
DATA_1A85AC:         dw $2E36    ; 4 Toadies
DATA_1A85AE:         dw $2909    ; Melon Bug
DATA_1A85B0:         dw $9407    ; Door
DATA_1A85B2:         dw $209E    ; Expansion Block
DATA_1A85B4:         dw $1040    ; Blue checkered block
DATA_1A85B6:         dw $1040    ; Red checkered block
DATA_1A85B8:         dw $209E    ; POW
DATA_1A85BA:         dw $209E    ; Yoshi Block
DATA_1A85BC:         dw $0000    ; Spiny Egg
DATA_1A85BE:         dw $2DB4    ; Chained green Flatbed Ferry
DATA_1A85C0:         dw $0000    ; Mace Guy
DATA_1A85C2:         dw $1040    ; Mace
DATA_1A85C4:         dw $209E    ; !-switch
DATA_1A85C6:         dw $1040    ; Chomp Rock
DATA_1A85C8:         dw $1FF4    ; Wild Ptooie Piranha, spits 1 / 3 Needle
DATA_1A85CA:         dw $D386    ; Tulip
DATA_1A85CC:         dw $0000    ; Pot of Potted Spiked Fun Guy
DATA_1A85CE:         dw $B16C    ; Fireball of Thunder Lakitu
DATA_1A85D0:         dw $247C    ; Bandit, getting under cover, left
DATA_1A85D2:         dw $247C    ; Bandit, getting under cover, right
DATA_1A85D4:         dw $D44E    ; Nep-Enut / Gargantua Blargg
DATA_1A85D6:         dw $233C    ; Incoming Chomp
DATA_1A85D8:         dw $2440    ; Flock of Incoming Chomps
DATA_1A85DA:         dw $233C    ; Falling Incoming Chomp
DATA_1A85DC:         dw $23DC    ; Shadow of falling Incoming Chomp
DATA_1A85DE:         dw $2472    ; Shy Guy in background
DATA_1A85E0:         dw $0000    ; Fill Eggs
DATA_1A85E2:         dw $F9AB    ; Sign Arrow and Shadow
DATA_1A85E4:         dw $2184    ; Hint Block
DATA_1A85E6:         dw $AA9B    ; Hookbill the Koopa
DATA_1A85E8:         dw $4D58    ; Morph Bubble, Car
DATA_1A85EA:         dw $4D58    ; Morph Bubble, Mole Tank
DATA_1A85EC:         dw $4D58    ; Morph Bubble, Helicopter
DATA_1A85EE:         dw $4D58    ; Morph Bubble, Train
DATA_1A85F0:         dw $0000    ; Wind of Fuzzy
DATA_1A85F2:         dw $4D58    ; Morph Bubble, Submarine
DATA_1A85F4:         dw $0000    ; Hidden Winged Cloud, 1-up / 5 stars / !
DATA_1A85F6:         dw $4D58    ; Winged Cloud, 8 coins
DATA_1A85F8:         dw $4D58    ; Winged Cloud, bubbled 1-up
DATA_1A85FA:         dw $4D58    ; Winged Cloud, flower
DATA_1A85FC:         dw $4D58    ; Winged Cloud, POW
DATA_1A85FE:         dw $4D58    ; Winged Cloud, stairs, right / left
DATA_1A8600:         dw $4D58    ; Winged Cloud, platform, right / left
DATA_1A8602:         dw $4D58    ; Winged Cloud, Bandit
DATA_1A8604:         dw $4D58    ; Winged Cloud, coin (object)
DATA_1A8606:         dw $4D58    ; Winged Cloud, 1-up
DATA_1A8608:         dw $4D58    ; Winged Cloud, key
DATA_1A860A:         dw $4D58    ; Winged Cloud, 3 stars
DATA_1A860C:         dw $4D58    ; Winged Cloud, 5 stars
DATA_1A860E:         dw $4D58    ; Winged Cloud, door
DATA_1A8610:         dw $4D58    ; Winged Cloud, ground eater
DATA_1A8612:         dw $4D58    ; Winged Cloud, watermelon
DATA_1A8614:         dw $4D58    ; Winged Cloud, fire watermelon
DATA_1A8616:         dw $4D58    ; Winged Cloud, icy watermelon
DATA_1A8618:         dw $4D58    ; Winged Cloud, seed of sunflower with 3
DATA_1A861A:         dw $4D58    ; Winged Cloud, seed of sunflower with 6
DATA_1A861C:         dw $4D58    ; Winged Cloud, [CRASH]
DATA_1A861E:         dw $FB8B    ; Boss Door of Bowser's room
DATA_1A8620:         dw $4D58    ; Winged Cloud, random item.
DATA_1A8622:         dw $4D58    ; Winged Cloud, !-switch / !-switch
DATA_1A8624:         dw $F875    ; Baron Von Zeppelin, Giant Egg
DATA_1A8626:         dw $F7C1    ; Bowser's flame
DATA_1A8628:         dw $CDBE    ; Bowser's quake
DATA_1A862A:         dw $0000    ; Horizontal entrance, towards right
DATA_1A862C:         dw $0000    ; Hidden entrance, revealed by an ! switc
DATA_1A862E:         dw $6FB3    ; Marching Milde
DATA_1A8630:         dw $E434    ; Giant Milde
DATA_1A8632:         dw $EA8D    ; Large Milde
DATA_1A8634:         dw $F898    ; Moutain backgrounds at fight with Hookb
DATA_1A8636:         dw $F046    ; (BG3) Ghost with Flatbed Ferry on its h
DATA_1A8638:         dw $ECA9    ; Sluggy the Unshaven
DATA_1A863A:         dw $1040    ; Chomp signboard.
DATA_1A863C:         dw $0000    ; Fishin' Lakitu
DATA_1A863E:         dw $EDA8    ; Flower pot, key / 6 stars / 6 coins / n
DATA_1A8640:         dw $0000    ; (BG3) Soft thing
DATA_1A8642:         dw $22D8    ; Snowball
DATA_1A8644:         dw $0000    ; Closer, in Naval Piranha's room
DATA_1A8646:         dw $0000    ; Falling Rock
DATA_1A8648:         dw $D3B8    ; Piscatory Pete, Blue / Gold
DATA_1A864A:         dw $0000    ; Preying Mantas
DATA_1A864C:         dw $D3D6    ; Loch Nestor
DATA_1A864E:         dw $4439    ; Boo Blah, normal / upside down
DATA_1A8650:         dw $4439    ; Boo Blah with Piro Dangle, normal / ups
DATA_1A8652:         dw $4637    ; Heading cactus
DATA_1A8654:         dw $0000    ; Green Needlenose
DATA_1A8656:         dw $4682    ; Gusty, left / right / infinite right /
DATA_1A8658:         dw $46E6    ; Burt, two / one
DATA_1A865A:         dw $4844    ; Goonie, right / towards Yoshi / generat
DATA_1A865C:         dw $4844    ; 3 Flightless Goonies
DATA_1A865E:         dw $4B6E    ; Cloud Drop, moving vertically
DATA_1A8660:         dw $4CB8    ; Cloud Drop, moving horizontally
DATA_1A8662:         dw $4E39    ; Flamer Guy, jumping around
DATA_1A8664:         dw $4E39    ; Flamer Guy, walking around
DATA_1A8666:         dw $50AF    ; Eggo-Dil
DATA_1A8668:         dw $1040    ; Eggo-Dil's face
DATA_1A866A:         dw $0000    ; Petal of Eggo-Dil
DATA_1A866C:         dw $50CD    ; Bubble-Plant
DATA_1A866E:         dw $5172    ; Stilt Guy, green / red / yellow / purpl
DATA_1A8670:         dw $0000    ; Woozy Guy, green / red / yellow / purpl
DATA_1A8672:         dw $50CD    ; Egg-Plant / Needlenose-Plant
DATA_1A8674:         dw $56B3    ; Slugger
DATA_1A8676:         dw $59FB    ; Parent and children of Huffin' Puffins
DATA_1A8678:         dw $5B95    ; Barney Bubble
DATA_1A867A:         dw $5D11    ; Blow Hard
DATA_1A867C:         dw $0000    ; Yellow Needlenose
DATA_1A867E:         dw $1040    ; Flower
DATA_1A8680:         dw $5E83    ; Spear Guy, long spear
DATA_1A8682:         dw $5F91    ; Spear Guy, short spear
DATA_1A8684:         dw $609F    ; Zeus Guy
DATA_1A8686:         dw $FA9B    ; Energy of Zeus Guy
DATA_1A8688:         dw $7C6F    ; Poochy
DATA_1A868A:         dw $5D4D    ; Bubbled 1-up
DATA_1A868C:         dw $5E0B    ; Spiky mace
DATA_1A868E:         dw $5E0B    ; Spiky mace, double-ended
DATA_1A8690:         dw $5DD9    ; Boo Guys spinning spiky mace
DATA_1A8692:         dw $CDAA    ; Jean de Fillet, right / left
DATA_1A8694:         dw $66A3    ; Boo Guys, carrying bombs towards left.
DATA_1A8696:         dw $66A3    ; Boo Guys, carrying bombs towards right
DATA_1A8698:         dw $0000    ; Seed of watermelon
DATA_1A869A:         dw $6FB3    ; Milde
DATA_1A869C:         dw $70C1    ; Tap-Tap
DATA_1A869E:         dw $70C1    ; Tap-Tap, stays on ledges
DATA_1A86A0:         dw $70C1    ; Hopping Tap-tap
DATA_1A86A2:         dw $72FB    ; Chained spike ball, controlled by Boo G
DATA_1A86A4:         dw $7350    ; Boo Guy, rotating a pulley, right / lef
DATA_1A86A6:         dw $209E    ; Crate, 6 stars
DATA_1A86A8:         dw $7503    ; Boo Man Bluff
DATA_1A86AA:         dw $EBAF    ; Flower
DATA_1A86AC:         dw $7661    ; Georgette Jelly
DATA_1A86AE:         dw $0000    ; Splashed Georgette Jelly
DATA_1A86B0:         dw $7A76    ; Snifit
DATA_1A86B2:         dw $7C65    ; Bullet, shot by Snifit
DATA_1A86B4:         dw $0000    ; Coin, gravity affected
DATA_1A86B6:         dw $7F08    ; Floating round platform on water
DATA_1A86B8:         dw $0000    ; Donut Lift
DATA_1A86BA:         dw $7F1C    ; Giant Donut Lift
DATA_1A86BC:         dw $7F30    ; Spooky
DATA_1A86BE:         dw $7FC6    ; Green Glove
DATA_1A86C0:         dw $83E0    ; Lakitu, one / two
DATA_1A86C2:         dw $8570    ; Lakitu's cloud
DATA_1A86C4:         dw $0000    ; Spiny Egg
DATA_1A86C6:         dw $1040    ; Brown Arrow Wheel
DATA_1A86C8:         dw $1040    ; Blue Arrow Wheel
DATA_1A86CA:         dw $1040    ; Double-ended arrow lift
DATA_1A86CC:         dw $0000    ; Explosion of Number Platform
DATA_1A86CE:         dw $8D9F    ; ? bucket, Bandit
DATA_1A86D0:         dw $8D9F    ; ? bucket, 5 coins
DATA_1A86D2:         dw $2062    ; Stretch, green / red / yellow / purple
DATA_1A86D4:         dw $E20E    ; Kamek, for the ending scene / flying an
DATA_1A86D6:         dw $8DB8    ; Spiked log held by chain and pulley
DATA_1A86D8:         dw $1040    ; ? Pulley
DATA_1A86DA:         dw $0000    ; Ground shake
DATA_1A86DC:         dw $8DFE    ; Fuzzy
DATA_1A86DE:         dw $9605    ; Shy Guy, with Bandit hidden
DATA_1A86E0:         dw $8E85    ; Fat Guy, red / green
DATA_1A86E2:         dw $0000    ; Fly Guy carrying red coin / Whirly Fly
DATA_1A86E4:         dw $F172    ; Yoshi, in the intro scene
DATA_1A86E6:         dw $0000    ; unknown
DATA_1A86E8:         dw $9245    ; Lava Drop, moving horizontally
DATA_1A86EA:         dw $92DB    ; Lava Drop, moving vertically
DATA_1A86EC:         dw $9407    ; Locked door
DATA_1A86EE:         dw $950B    ; Lemon Drop
DATA_1A86F0:         dw $956F    ; Lantern Ghost
DATA_1A86F2:         dw $0000    ; Baby Bowser
DATA_1A86F4:         dw $1040    ; Raven, always circling, anticlockwise /
DATA_1A86F6:         dw $1040    ; Raven, anticlockwise / clockwise initia
DATA_1A86F8:         dw $0000    ; 3x6 Falling Rock
DATA_1A86FA:         dw $0000    ; 3x3 Falling Rock
DATA_1A86FC:         dw $0000    ; 3x9 Falling Rock
DATA_1A86FE:         dw $0000    ; 6x3 Falling Rock
DATA_1A8700:         dw $0000    ; Stomach Acid
DATA_1A8702:         dw $1040    ; Flipper, downwards
DATA_1A8704:         dw $966E    ; Fang, dangling
DATA_1A8706:         dw $966E    ; Fang, flying wavily
DATA_1A8708:         dw $96B9    ; Flopsy Fish, swimming around
DATA_1A870A:         dw $96B9    ; Flopsy Fish, swimming and occasionally
DATA_1A870C:         dw $96B9    ; Flopsy Fish, swimming and jumps in an a
DATA_1A870E:         dw $96B9    ; Flopsy Fish, jumps 3 times in an arc, r
DATA_1A8710:         dw $0000    ; Spray Fish
DATA_1A8712:         dw $1040    ; Flipper, rightwards / leftwards
DATA_1A8714:         dw $ED4E    ; Blue Sluggy, falling down / crawing cei
DATA_1A8716:         dw $ED4E    ; Pink Sluggy, falling down / crawing cei
DATA_1A8718:         dw $0000    ; Horizontal entrance, towards left
DATA_1A871A:         dw $203A    ; Large Spring Ball
DATA_1A871C:         dw $9CB3    ; Arrow cloud, up
DATA_1A871E:         dw $9C59    ; Arrow cloud, up right
DATA_1A8720:         dw $9BFF    ; Arrow cloud, right
DATA_1A8722:         dw $9BA5    ; Arrow cloud, down right
DATA_1A8724:         dw $9B4B    ; Arrow cloud, down
DATA_1A8726:         dw $9AF1    ; Arrow cloud, down left
DATA_1A8728:         dw $9A97    ; Arrow cloud, left
DATA_1A872A:         dw $9A3D    ; Arrow cloud, up left
DATA_1A872C:         dw $9A3D    ; Arrow cloud, rotating
DATA_1A872E:         dw $9DC1    ; Flutter
DATA_1A8730:         dw $4844    ; Goonie with Shy Guy
DATA_1A8732:         dw $9F47    ; Shark Chomp
DATA_1A8734:         dw $9F7E    ; Very Goonie
DATA_1A8736:         dw $1040    ; Cactus Jack, one / three
DATA_1A8738:         dw $9FE2    ; Wall Lakitu
DATA_1A873A:         dw $9F7E    ; Bowling Goonie
DATA_1A873C:         dw $A0E1    ; Grunt, walking
DATA_1A873E:         dw $A0E1    ; Grunt, running
DATA_1A8740:         dw $A39D    ; Dancing Spear Guy
DATA_1A8742:         dw $0000    ; Green switch for green spiked platform
DATA_1A8744:         dw $0000    ; Red switch for red spiked platform
DATA_1A8746:         dw $BCDE    ; Pink Pinwheel with Shy Guys, clockwise
DATA_1A8748:         dw $A9E2    ; Green spiked platform
DATA_1A874A:         dw $A9E2    ; Red spiked platform
DATA_1A874C:         dw $0000    ; Bonus Item, red coin / key / flower / d
DATA_1A874E:         dw $A9E2    ; Two spiked platforms with one switch in
DATA_1A8750:         dw $0000    ; Bouncing green Needlenose
DATA_1A8752:         dw $B53B    ; Nipper Plant
DATA_1A8754:         dw $B53B    ; Nipper Spore
DATA_1A8756:         dw $B41E    ; Thunder Lakitu, one / two
DATA_1A8758:         dw $0000    ; Green Koopa shell
DATA_1A875A:         dw $0000    ; Red Koopa shell
DATA_1A875C:         dw $AA9B    ; Green Beach Koopa
DATA_1A875E:         dw $AA9B    ; Red Beach Koopa
DATA_1A8760:         dw $AA9B    ; Green Koopa
DATA_1A8762:         dw $AA9B    ; Red Koopa
DATA_1A8764:         dw $AC99    ; Green Para Koopa, jumping forth.
DATA_1A8766:         dw $AC99    ; Red Para Koopa, flying horizontally
DATA_1A8768:         dw $AC99    ; Red Para Koopa, flying vertically
DATA_1A876A:         dw $AFF0    ; Aqua Lakitu
DATA_1A876C:         dw $B4D2    ; Naval Piranha
DATA_1A876E:         dw $0000    ; Naval Bud
DATA_1A8770:         dw $B5B3    ; Baron Von Zeppelin, red Suy Guy
DATA_1A8772:         dw $B5D1    ; Baron Von Zeppelin, Needlenose
DATA_1A8774:         dw $B5E5    ; Baron Von Zeppelin, bomb
DATA_1A8776:         dw $B5F9    ; Baron Von Zeppelin, Bandit
DATA_1A8778:         dw $B621    ; Baron Von Zeppelin, large Spring Ball
DATA_1A877A:         dw $B644    ; Baron Von Zeppelin, 1-up
DATA_1A877C:         dw $B667    ; Baron Von Zeppelin, key
DATA_1A877E:         dw $B67B    ; Baron Von Zeppelin, 5 coins
DATA_1A8780:         dw $B68F    ; Baron Von Zeppelin, watermelon
DATA_1A8782:         dw $B6A3    ; Baron Von Zeppelin, fire watermelon
DATA_1A8784:         dw $B6B7    ; Baron Von Zeppelin, icy watermelon
DATA_1A8786:         dw $B6CB    ; Baron Von Zeppelin, crate, 6 stars.
DATA_1A8788:         dw $B70C    ; Baron Von Zeppelin
DATA_1A878A:         dw $1040    ; Spinning Log
DATA_1A878C:         dw $B7E3    ; Crazee Dayzee
DATA_1A878E:         dw $0000    ; Dragonfly
DATA_1A8790:         dw $0000    ; Butterfly
DATA_1A8792:         dw $BA72    ; Bumpty
DATA_1A8794:         dw $28AA    ; Active line guided green Flatbed Ferry,
DATA_1A8796:         dw $28AA    ; Active line guided green Flatbed Ferry,
DATA_1A8798:         dw $28AA    ; Active line guided yellow Flatbed Ferry
DATA_1A879A:         dw $28AA    ; Active line guided yellow Flatbed Ferry
DATA_1A879C:         dw $28AA    ; Line guided green Flatbed Ferry, left
DATA_1A879E:         dw $28AA    ; Line guided green Flatbed Ferry, right
DATA_1A87A0:         dw $28AA    ; Line guided yellow Flatbed Ferry, left
DATA_1A87A2:         dw $28AA    ; Line guided yellow Flatbed Ferry, right
DATA_1A87A4:         dw $28AA    ; Line guided red Flatbed Ferry, left
DATA_1A87A6:         dw $28AA    ; Line guided red Flatbed Ferry, right
DATA_1A87A8:         dw $1040    ; Whirling lift
DATA_1A87AA:         dw $BBC1    ; Falling icicle
DATA_1A87AC:         dw $BF31    ; Sparrow
DATA_1A87AE:         dw $BBFD    ; Muti Guy, green / red / yellow / purple
DATA_1A87B0:         dw $DD22    ; Caged Ghost, squeezing in sewer
DATA_1A87B2:         dw $C08A    ; Blargg
DATA_1A87B4:         dw $BF95    ; unknown
DATA_1A87B6:         dw $BF45    ; Unbalanced snowy platform
DATA_1A87B8:         dw $BFA9    ; Arrow sign, up / right / left / down
DATA_1A87BA:         dw $BFA9    ; Diagonal arrow sign, up left / up right
DATA_1A87BC:         dw $BFD6    ; Dizzy Dandy
DATA_1A87BE:         dw $BFEA    ; Boo Guy
DATA_1A87C0:         dw $BA72    ; Bumpty, tackles at Yoshi
DATA_1A87C2:         dw $BB44    ; Flying Bumpty, flying aronnd / flying s
DATA_1A87C4:         dw $C1F2    ; Skeleton Goonie
DATA_1A87C6:         dw $C35A    ; Flightless Skeleton Goonie
DATA_1A87C8:         dw $C396    ; Skeleton Goonie with a bomb
DATA_1A87CA:         dw $0000    ; Firebar, double-ended, clockwise / anti
DATA_1A87CC:         dw $0000    ; Firebar, clockwise / anticlockwise
DATA_1A87CE:         dw $C4FE    ; Star
DATA_1A87D0:         dw $C558    ; Little Skull Mouser
DATA_1A87D2:         dw $CD8C    ; Cork, seals 3D pipe
DATA_1A87D4:         dw $C5F8    ; Grinder, runs away
DATA_1A87D6:         dw $C5F8    ; Grinder, spits seeds of watermelon
DATA_1A87D8:         dw $C5F8    ; Short Fuse / Seedy Sally, right / left
DATA_1A87DA:         dw $C5F8    ; Grinder, grasps Baby Mario
DATA_1A87DC:         dw $C5F8    ; Grinder, climbing, spits seeds of water
DATA_1A87DE:         dw $0000    ; Hot Lips
DATA_1A87E0:         dw $D016    ; Boo Balloon, coin / !-switch
DATA_1A87E2:         dw $D0D4    ; Frog
DATA_1A87E4:         dw $D0F2    ; Kamek, shoots magic at Yoshi.
DATA_1A87E6:         dw $D2D2    ; Kamek's magic
DATA_1A87E8:         dw $0000    ; Coin
DATA_1A87EA:         dw $0000    ; (BG3) Balloon
DATA_1A87EC:         dw $672F    ; Coin Cannon for Mini Battle
DATA_1A87EE:         dw $0000    ; Coin for Mini Battle
DATA_1A87F0:         dw $247C    ; Bandit for Mini Battle
DATA_1A87F2:         dw $6775    ; Checkered Platform for Mini Battle
DATA_1A87F4:         dw $247C    ; Bandit for Mini Battle
DATA_1A87F6:         dw $677F    ; Red Balloon for Mini Battle
DATA_1A87F8:         dw $6793    ; Bandit for Mini Battle
DATA_1A87FA:         dw $0000    ; Watermelon Pot for Mini Battle
DATA_1A87FC:         dw $6793    ; possibly Bandit for Mini Battle

; same table - unused sprites?
DATA_1A87FE:         dw $0B04
DATA_1A8800:         dw $0000
DATA_1A8802:         dw $0000
DATA_1A8804:         dw $0000
DATA_1A8806:         dw $0B72
DATA_1A8808:         dw $0BEA
DATA_1A880A:         dw $0DDE
DATA_1A880C:         dw $0DF2
DATA_1A880E:         dw $0E10
DATA_1A8810:         dw $2E81
DATA_1A8812:         dw $0FF0
DATA_1A8814:         dw $1054
DATA_1A8816:         dw $0000
DATA_1A8818:         dw $0000
DATA_1A881A:         dw $0000
DATA_1A881C:         dw $0000
DATA_1A881E:         dw $0000
DATA_1A8820:         dw $11C6
DATA_1A8822:         dw $1112
DATA_1A8824:         dw $12B6
DATA_1A8826:         dw $0000
DATA_1A8828:         dw $0000
DATA_1A882A:         dw $152C
DATA_1A882C:         dw $0000
DATA_1A882E:         dw $9493
DATA_1A8830:         dw $2FA8
DATA_1A8832:         dw $19FA
DATA_1A8834:         dw $21AC
DATA_1A8836:         dw $0000
DATA_1A8838:         dw $0000
DATA_1A883A:         dw $0000
DATA_1A883C:         dw $0000
DATA_1A883E:         dw $0000
DATA_1A8840:         dw $55D7
DATA_1A8842:         dw $2945
DATA_1A8844:         dw $0000
DATA_1A8846:         dw $0000
DATA_1A8848:         dw $0000
DATA_1A884A:         dw $2A71
DATA_1A884C:         dw $2AE4
DATA_1A884E:         dw $2F94
DATA_1A8850:         dw $2FBC
DATA_1A8852:         dw $4335
DATA_1A8854:         dw $0000
DATA_1A8856:         dw $4704
DATA_1A8858:         dw $4704
DATA_1A885A:         dw $5663
DATA_1A885C:         dw $5C2B
DATA_1A885E:         dw $6095
DATA_1A8860:         dw $6081
DATA_1A8862:         dw $0000
DATA_1A8864:         dw $6B67
DATA_1A8866:         dw $6D97
DATA_1A8868:         dw $7283
DATA_1A886A:         dw $0000
DATA_1A886C:         dw $748B
DATA_1A886E:         dw $0000
DATA_1A8870:         dw $0000
DATA_1A8872:         dw $78B4
DATA_1A8874:         dw $7BA2
DATA_1A8876:         dw $7BB1
DATA_1A8878:         dw $7EE5
DATA_1A887A:         dw $0000
DATA_1A887C:         dw $8584
DATA_1A887E:         dw $0000
DATA_1A8880:         dw $0000
DATA_1A8882:         dw $0000
DATA_1A8884:         dw $987B
DATA_1A8886:         dw $996B
DATA_1A8888:         dw $0000
DATA_1A888A:         dw $0000
DATA_1A888C:         dw $9D0D
DATA_1A888E:         dw $0000
DATA_1A8890:         dw $0000
DATA_1A8892:         dw $9F1F
DATA_1A8894:         dw $0000
DATA_1A8896:         dw $0000
DATA_1A8898:         dw $0000
DATA_1A889A:         dw $A5F0
DATA_1A889C:         dw $A988
DATA_1A889E:         dw $AA37
DATA_1A88A0:         dw $0000
DATA_1A88A2:         dw $0000
DATA_1A88A4:         dw $B16C
DATA_1A88A6:         dw $0E10
DATA_1A88A8:         dw $B16C
DATA_1A88AA:         dw $0000
DATA_1A88AC:         dw $0000
DATA_1A88AE:         dw $0000
DATA_1A88B0:         dw $B8DD
DATA_1A88B2:         dw $0000
DATA_1A88B4:         dw $0000
DATA_1A88B6:         dw $0000
DATA_1A88B8:         dw $0000
DATA_1A88BA:         dw $0000
DATA_1A88BC:         dw $0000
DATA_1A88BE:         dw $CC42
DATA_1A88C0:         dw $0000
DATA_1A88C2:         dw $CE22
DATA_1A88C4:         dw $CF4E
DATA_1A88C6:         dw $9F33
DATA_1A88C8:         dw $D05C
DATA_1A88CA:         dw $D552
DATA_1A88CC:         dw $EB37
DATA_1A88CE:         dw $EEB6
DATA_1A88D0:         dw $0000
DATA_1A88D2:         dw $EFF6
DATA_1A88D4:         dw $0B04
DATA_1A88D6:         dw $0000
DATA_1A88D8:         dw $0000
DATA_1A88DA:         dw $FA9B
DATA_1A88DC:         dw $0000
DATA_1A88DE:         dw $8638
DATA_1A88E0:         dw $8700
DATA_1A88E2:         dw $8877
DATA_1A88E4:         dw $88EF
DATA_1A88E6:         dw $8BBF
DATA_1A88E8:         dw $2FD0
DATA_1A88EA:         dw $2FD0
DATA_1A88EC:         dw $30E3
DATA_1A88EE:         dw $313D
DATA_1A88F0:         dw $36DD
DATA_1A88F2:         dw $3719
DATA_1A88F4:         dw $0000
DATA_1A88F6:         dw $372D
DATA_1A88F8:         dw $377D
DATA_1A88FA:         dw $0000
DATA_1A88FC:         dw $372D
DATA_1A88FE:         dw $381D
DATA_1A8900:         dw $3845
DATA_1A8902:         dw $0000
DATA_1A8904:         dw $3E35
DATA_1A8906:         dw $3E49
DATA_1A8908:         dw $3E71
DATA_1A890A:         dw $3F39
DATA_1A890C:         dw $40C9
DATA_1A890E:         dw $4119
DATA_1A8910:         dw $4155
DATA_1A8912:         dw $40C9

; drawing method 00 OAM information tables
; one word per sprite per animation frame
; format of the words:
; high byte: yxpp--st: y/x = flip, p=priority, s=size, t=msb tile
; note: the size bit here is packed into this byte versus
; being its own separate byte like in other OAM tables
; this is because palette is unneeded here
; low byte: VRAM tile number
DATA_1A8914:         dw $0916, $0200
DATA_1A8918:         dw $F8F8, $0000
DATA_1A891C:         dw $0802, $00F8
DATA_1A8920:         dw $0200, $08F8
DATA_1A8924:         dw $0000, $0802
DATA_1A8928:         dw $0008, $0200
DATA_1A892C:         dw $02C8, $0268
DATA_1A8930:         dw $02CA, $02CC
DATA_1A8934:         dw $02EA, $02CC
DATA_1A8938:         dw $0226, $0224
DATA_1A893C:         dw $0222, $0220
DATA_1A8940:         dw $0268, $0208
DATA_1A8944:         dw $03D9, $0268
DATA_1A8948:         dw $020C, $0200
DATA_1A894C:         dw $0220, $0222
DATA_1A8950:         dw $0224, $0226
DATA_1A8954:         dw $02A6, $02A4
DATA_1A8958:         dw $02A2, $0246
DATA_1A895C:         dw $00F9, $02E3
DATA_1A8960:         dw $02E5, $02E7
DATA_1A8964:         dw $0282, $0280
DATA_1A8968:         dw $0284, $0246
DATA_1A896C:         dw $0284, $02EE
DATA_1A8970:         dw $0208, $020A
DATA_1A8974:         dw $020A, $020C
DATA_1A8978:         dw $020A, $020E
DATA_1A897C:         dw $001F, $001E
DATA_1A8980:         dw $000F, $000E
DATA_1A8984:         dw $0246, $024B
DATA_1A8988:         dw $02CA, $02CC
DATA_1A898C:         dw $02EA, $03C0
DATA_1A8990:         dw $0208, $020A
DATA_1A8994:         dw $020C, $420C
DATA_1A8998:         dw $020E, $420E
DATA_1A899C:         dw $0200, $0202
DATA_1A89A0:         dw $0204, $0206
DATA_1A89A4:         dw $0208, $020A
DATA_1A89A8:         dw $02C0, $0262
DATA_1A89AC:         dw $02EC, $020E
DATA_1A89B0:         dw $020C, $028A
DATA_1A89B4:         dw $0208, $028A
DATA_1A89B8:         dw $00BC, $000C
DATA_1A89BC:         dw $000B, $001C
DATA_1A89C0:         dw $0208, $020E
DATA_1A89C4:         dw $020E, $020A
DATA_1A89C8:         dw $020C, $000B
DATA_1A89CC:         dw $020C, $020E
DATA_1A89D0:         dw $420E, $420C
DATA_1A89D4:         dw $022C, $028A
DATA_1A89D8:         dw $0002, $0012
DATA_1A89DC:         dw $0003, $0013
DATA_1A89E0:         dw $0010, $0011
DATA_1A89E4:         dw $02C0, $0200
DATA_1A89E8:         dw $0206, $0206
DATA_1A89EC:         dw $0204, $0202
DATA_1A89F0:         dw $0200, $0226
DATA_1A89F4:         dw $022E, $022E
DATA_1A89F8:         dw $0200, $0202
DATA_1A89FC:         dw $0204, $0206
DATA_1A8A00:         dw $02A0, $025C
DATA_1A8A04:         dw $0260, $425C
DATA_1A8A08:         dw $020E, $024E
DATA_1A8A0C:         dw $020D, $824E
DATA_1A8A10:         dw $420D, $000F
DATA_1A8A14:         dw $001F, $800F
DATA_1A8A18:         dw $401F, $020C
DATA_1A8A1C:         dw $020E, $420E
DATA_1A8A20:         dw $420C, $02E0
DATA_1A8A24:         dw $00F9, $00E9
DATA_1A8A28:         dw $02E3, $02E5
DATA_1A8A2C:         dw $02E7, $02E7
DATA_1A8A30:         dw $0059, $02E5
DATA_1A8A34:         dw $0058, $02E3
DATA_1A8A38:         dw $00E2, $0200
DATA_1A8A3C:         dw $0202, $00E1
DATA_1A8A40:         dw $00F1, $0054
DATA_1A8A44:         dw $00F9, $0059
DATA_1A8A48:         dw $0200, $0220
DATA_1A8A4C:         dw $000C, $001C
DATA_1A8A50:         dw $00AE, $00BE
DATA_1A8A54:         dw $00AF, $00BF
DATA_1A8A58:         dw $0047, $0058
DATA_1A8A5C:         dw $0059, $00F7
DATA_1A8A60:         dw $00E1, $02E3
DATA_1A8A64:         dw $02E5, $02E7
DATA_1A8A68:         dw $0055, $0045
DATA_1A8A6C:         dw $0054, $0044
DATA_1A8A70:         dw $0055, $0045
DATA_1A8A74:         dw $0054, $0044
DATA_1A8A78:         dw $00E1, $00E2
DATA_1A8A7C:         dw $0058, $00F1
DATA_1A8A80:         dw $00E1, $02E5
DATA_1A8A84:         dw $02E3, $0002
DATA_1A8A88:         dw $0011, $0010
DATA_1A8A8C:         dw $0001, $0000
DATA_1A8A90:         dw $1054, $03C0
DATA_1A8A94:         dw $0006, $001C
DATA_1A8A98:         dw $000C, $001F
DATA_1A8A9C:         dw $000F, $001E
DATA_1A8AA0:         dw $001D, $001F
DATA_1A8AA4:         dw $000F, $000E
DATA_1A8AA8:         dw $000D, $0044
DATA_1A8AAC:         dw $0000, $420C
DATA_1A8AB0:         dw $420E, $C20C
DATA_1A8AB4:         dw $820A, $820C
DATA_1A8AB8:         dw $020E, $020C
DATA_1A8ABC:         dw $020A, $001F
DATA_1A8AC0:         dw $00E1, $00F1
DATA_1A8AC4:         dw $00F0, $00E2
DATA_1A8AC8:         dw $00F0, $00F1
DATA_1A8ACC:         dw $00E1, $001C
DATA_1A8AD0:         dw $000D, $000C
DATA_1A8AD4:         dw $001D, $000E
DATA_1A8AD8:         dw $001E, $03A4
DATA_1A8ADC:         dw $03C2, $03E0
DATA_1A8AE0:         dw $03E2, $4009
DATA_1A8AE4:         dw $4019, $0019
DATA_1A8AE8:         dw $0009, $0200
DATA_1A8AEC:         dw $0012, $000C
DATA_1A8AF0:         dw $001C, $001B
DATA_1A8AF4:         dw $020C, $020E
DATA_1A8AF8:         dw $00BC, $03CE
DATA_1A8AFC:         dw $0290, $03CC
DATA_1A8B00:         dw $0220, $0222

; drawing method 01 & 03 OAM tables
; for each sprite, each animation frame,
; and for each OAM entry:
; 5 byte format:
; bytes 1 & 2: OAM x & y drawing offsets
; bytes 3 & 4: VRAM tile number
; byte 5: size (00 or 02)
DATA_1A8B04:         db $FB, $00, $E0, $00, $02
DATA_1A8B09:         db $05, $00, $E0, $40, $02
DATA_1A8B0E:         db $FA, $FE, $E0, $00, $02
DATA_1A8B13:         db $06, $FE, $E0, $40, $02
DATA_1A8B18:         db $F9, $FD, $E0, $00, $02
DATA_1A8B1D:         db $07, $FD, $E0, $40, $02
DATA_1A8B22:         db $F8, $FD, $E0, $00, $02
DATA_1A8B27:         db $08, $FD, $E0, $40, $02
DATA_1A8B2C:         db $F7, $FE, $E0, $00, $02
DATA_1A8B31:         db $09, $FE, $E0, $40, $02
DATA_1A8B36:         db $F6, $00, $E0, $00, $02
DATA_1A8B3B:         db $0A, $00, $E0, $40, $02
DATA_1A8B40:         db $F5, $03, $E0, $00, $02
DATA_1A8B45:         db $0B, $03, $E0, $40, $02
DATA_1A8B4A:         db $04, $09, $F2, $00, $00
DATA_1A8B4F:         db $04, $09, $F2, $00, $00
DATA_1A8B54:         db $04, $06, $F2, $00, $00
DATA_1A8B59:         db $04, $06, $F2, $00, $00
DATA_1A8B5E:         db $04, $04, $F2, $00, $00
DATA_1A8B63:         db $04, $04, $F2, $00, $00
DATA_1A8B68:         db $04, $03, $F2, $00, $00
DATA_1A8B6D:         db $04, $03, $F2, $00, $00
DATA_1A8B72:         db $02, $02, $55, $00, $00
DATA_1A8B77:         db $06, $02, $55, $00, $00
DATA_1A8B7C:         db $02, $06, $55, $00, $00
DATA_1A8B81:         db $06, $06, $55, $00, $00
DATA_1A8B86:         db $01, $01, $55, $00, $00
DATA_1A8B8B:         db $07, $01, $55, $00, $00
DATA_1A8B90:         db $01, $07, $55, $00, $00
DATA_1A8B95:         db $07, $07, $55, $00, $00
DATA_1A8B9A:         db $00, $00, $55, $00, $00
DATA_1A8B9F:         db $08, $00, $55, $00, $00
DATA_1A8BA4:         db $00, $08, $55, $00, $00
DATA_1A8BA9:         db $08, $08, $55, $00, $00
DATA_1A8BAE:         db $FF, $FF, $45, $00, $00
DATA_1A8BB3:         db $09, $FF, $45, $00, $00
DATA_1A8BB8:         db $FF, $09, $45, $00, $00
DATA_1A8BBD:         db $09, $09, $45, $00, $00
DATA_1A8BC2:         db $FE, $FE, $54, $00, $00
DATA_1A8BC7:         db $0A, $FE, $54, $00, $00
DATA_1A8BCC:         db $FE, $0A, $54, $00, $00
DATA_1A8BD1:         db $0A, $0A, $54, $00, $00
DATA_1A8BD6:         db $FD, $FD, $44, $00, $00
DATA_1A8BDB:         db $0B, $FD, $44, $00, $00
DATA_1A8BE0:         db $FD, $0B, $44, $00, $00
DATA_1A8BE5:         db $0B, $0B, $44, $00, $00
DATA_1A8BEA:         db $FF, $00, $49, $02, $00
DATA_1A8BEF:         db $01, $00, $6E, $02, $00
DATA_1A8BF4:         db $09, $00, $6F, $02, $00
DATA_1A8BF9:         db $09, $00, $6F, $02, $00
DATA_1A8BFE:         db $FF, $00, $4A, $02, $00
DATA_1A8C03:         db $02, $00, $6E, $02, $00
DATA_1A8C08:         db $0A, $00, $6F, $02, $00
DATA_1A8C0D:         db $0A, $00, $6F, $02, $00
DATA_1A8C12:         db $FF, $00, $4B, $02, $00
DATA_1A8C17:         db $02, $00, $6E, $02, $00
DATA_1A8C1C:         db $0A, $00, $6F, $02, $00
DATA_1A8C21:         db $0A, $00, $6F, $02, $00
DATA_1A8C26:         db $00, $00, $5F, $04, $00
DATA_1A8C2B:         db $08, $00, $49, $04, $00
DATA_1A8C30:         db $00, $00, $5F, $04, $00
DATA_1A8C35:         db $08, $00, $49, $04, $00
DATA_1A8C3A:         db $00, $F8, $03, $00, $00
DATA_1A8C3F:         db $00, $08, $0F, $04, $00
DATA_1A8C44:         db $00, $F8, $03, $00, $00
DATA_1A8C49:         db $F8, $00, $00, $00, $02
DATA_1A8C4E:         db $00, $00, $01, $00, $02
DATA_1A8C53:         db $04, $0C, $0F, $04, $00
DATA_1A8C58:         db $00, $F6, $03, $00, $00
DATA_1A8C5D:         db $FD, $07, $0E, $04, $00
DATA_1A8C62:         db $00, $F6, $03, $00, $00
DATA_1A8C67:         db $F8, $FE, $00, $00, $02
DATA_1A8C6C:         db $00, $FE, $01, $00, $02
DATA_1A8C71:         db $09, $0C, $1E, $04, $00
DATA_1A8C76:         db $00, $F7, $03, $00, $00
DATA_1A8C7B:         db $0B, $0C, $1E, $04, $00
DATA_1A8C80:         db $00, $F7, $03, $00, $00
DATA_1A8C85:         db $F8, $FF, $00, $00, $02
DATA_1A8C8A:         db $00, $FF, $01, $00, $02
DATA_1A8C8F:         db $FC, $07, $04, $04, $00
DATA_1A8C94:         db $00, $F8, $03, $00, $00
DATA_1A8C99:         db $0C, $0C, $1E, $04, $00
DATA_1A8C9E:         db $00, $F8, $03, $00, $00
DATA_1A8CA3:         db $F8, $00, $00, $00, $02
DATA_1A8CA8:         db $00, $00, $01, $00, $02
DATA_1A8CAD:         db $FB, $06, $04, $04, $00
DATA_1A8CB2:         db $00, $F9, $03, $00, $00
DATA_1A8CB7:         db $0C, $0C, $1F, $04, $00
DATA_1A8CBC:         db $00, $F9, $03, $00, $00
DATA_1A8CC1:         db $F8, $01, $00, $00, $02
DATA_1A8CC6:         db $00, $01, $01, $00, $02
DATA_1A8CCB:         db $FA, $0B, $0E, $04, $00
DATA_1A8CD0:         db $00, $FC, $03, $00, $00
DATA_1A8CD5:         db $0D, $0C, $1F, $04, $00
DATA_1A8CDA:         db $00, $FC, $03, $00, $00
DATA_1A8CDF:         db $F8, $04, $00, $00, $02
DATA_1A8CE4:         db $00, $04, $01, $00, $02
DATA_1A8CE9:         db $FA, $0C, $0F, $04, $00
DATA_1A8CEE:         db $00, $FA, $03, $00, $00
DATA_1A8CF3:         db $09, $0B, $1F, $04, $00
DATA_1A8CF8:         db $00, $FA, $03, $00, $00
DATA_1A8CFD:         db $F8, $02, $00, $00, $02
DATA_1A8D02:         db $00, $02, $01, $00, $02
DATA_1A8D07:         db $FE, $0C, $0F, $04, $00
DATA_1A8D0C:         db $00, $F9, $03, $00, $00
DATA_1A8D11:         db $05, $0B, $1E, $04, $00
DATA_1A8D16:         db $00, $F9, $03, $00, $00
DATA_1A8D1B:         db $F8, $01, $00, $00, $02
DATA_1A8D20:         db $00, $01, $01, $00, $02
DATA_1A8D25:         db $02, $0C, $0F, $04, $00
DATA_1A8D2A:         db $00, $F9, $03, $00, $00
DATA_1A8D2F:         db $02, $0C, $0F, $04, $00
DATA_1A8D34:         db $00, $F9, $03, $00, $00
DATA_1A8D39:         db $F8, $01, $00, $00, $02
DATA_1A8D3E:         db $00, $01, $01, $00, $02
DATA_1A8D43:         db $00, $0C, $0F, $04, $00
DATA_1A8D48:         db $09, $FA, $14, $00, $00
DATA_1A8D4D:         db $02, $0C, $0F, $04, $00
DATA_1A8D52:         db $01, $FA, $13, $00, $00
DATA_1A8D57:         db $F9, $02, $05, $00, $02
DATA_1A8D5C:         db $01, $02, $06, $00, $02
DATA_1A8D61:         db $00, $0C, $0F, $04, $00
DATA_1A8D66:         db $FF, $F8, $0B, $00, $00
DATA_1A8D6B:         db $F7, $F8, $0A, $00, $00
DATA_1A8D70:         db $02, $0C, $0F, $04, $00
DATA_1A8D75:         db $F7, $F8, $0A, $00, $02
DATA_1A8D7A:         db $FF, $00, $08, $00, $02
DATA_1A8D7F:         db $00, $0C, $0F, $04, $00
DATA_1A8D84:         db $FD, $F6, $0B, $00, $00
DATA_1A8D89:         db $F5, $F6, $0A, $00, $00
DATA_1A8D8E:         db $02, $0C, $0F, $04, $00
DATA_1A8D93:         db $F5, $F6, $0A, $00, $02
DATA_1A8D98:         db $FF, $00, $08, $00, $02
DATA_1A8D9D:         db $00, $0C, $0F, $04, $00
DATA_1A8DA2:         db $09, $FB, $14, $00, $00
DATA_1A8DA7:         db $02, $0C, $0F, $04, $00
DATA_1A8DAC:         db $01, $FB, $13, $00, $00
DATA_1A8DB1:         db $F9, $03, $05, $00, $02
DATA_1A8DB6:         db $01, $03, $06, $00, $02
DATA_1A8DBB:         db $00, $0C, $0F, $04, $00
DATA_1A8DC0:         db $08, $FE, $14, $00, $00
DATA_1A8DC5:         db $02, $0C, $0F, $04, $00
DATA_1A8DCA:         db $00, $FE, $13, $00, $00
DATA_1A8DCF:         db $F8, $05, $05, $00, $02
DATA_1A8DD4:         db $02, $04, $0C, $00, $02
DATA_1A8DD9:         db $00, $0C, $0F, $04, $00
DATA_1A8DDE:         db $F8, $F8, $6A, $00, $02
DATA_1A8DE3:         db $08, $F8, $6A, $40, $02
DATA_1A8DE8:         db $F8, $08, $6A, $80, $02
DATA_1A8DED:         db $08, $08, $6A, $C0, $02
DATA_1A8DF2:         db $00, $FE, $59, $00, $00
DATA_1A8DF7:         db $07, $FE, $59, $00, $00
DATA_1A8DFC:         db $00, $FE, $58, $00, $00
DATA_1A8E01:         db $07, $FE, $58, $00, $00
DATA_1A8E06:         db $00, $FE, $E2, $00, $00
DATA_1A8E0B:         db $07, $FE, $E2, $00, $00
DATA_1A8E10:         db $07, $F4, $E1, $00, $00
DATA_1A8E15:         db $F9, $FC, $F1, $00, $00
DATA_1A8E1A:         db $00, $00, $40, $00, $02
DATA_1A8E1F:         db $F2, $02, $E2, $00, $00
DATA_1A8E24:         db $E5, $06, $E1, $00, $00
DATA_1A8E29:         db $0C, $0A, $E2, $00, $00
DATA_1A8E2E:         db $E9, $0D, $F1, $00, $00
DATA_1A8E33:         db $F0, $10, $E2, $00, $00
DATA_1A8E38:         db $F5, $16, $40, $00, $02
DATA_1A8E3D:         db $E2, $1E, $E1, $00, $00
DATA_1A8E42:         db $13, $22, $E1, $00, $00
DATA_1A8E47:         db $FF, $23, $E1, $00, $00
DATA_1A8E4C:         db $08, $F2, $E1, $00, $00
DATA_1A8E51:         db $F9, $F9, $F1, $00, $00
DATA_1A8E56:         db $F9, $FA, $40, $00, $02
DATA_1A8E5B:         db $F0, $00, $E2, $00, $00
DATA_1A8E60:         db $E3, $05, $E1, $00, $00
DATA_1A8E65:         db $EC, $08, $40, $00, $02
DATA_1A8E6A:         db $0F, $09, $F1, $00, $00
DATA_1A8E6F:         db $E6, $0F, $F1, $00, $00
DATA_1A8E74:         db $F4, $18, $E2, $00, $00
DATA_1A8E79:         db $F8, $18, $E2, $00, $00
DATA_1A8E7E:         db $E0, $20, $E1, $00, $00
DATA_1A8E83:         db $00, $25, $E1, $00, $00
DATA_1A8E88:         db $09, $F0, $E1, $00, $00
DATA_1A8E8D:         db $F8, $F6, $E1, $00, $00
DATA_1A8E92:         db $EE, $FE, $F1, $00, $00
DATA_1A8E97:         db $FF, $02, $E2, $00, $00
DATA_1A8E9C:         db $F8, $08, $40, $00, $02
DATA_1A8EA1:         db $12, $09, $F1, $00, $00
DATA_1A8EA6:         db $F2, $0D, $E2, $00, $00
DATA_1A8EAB:         db $E3, $0F, $E1, $00, $00
DATA_1A8EB0:         db $F0, $14, $E2, $00, $00
DATA_1A8EB5:         db $FD, $18, $40, $00, $02
DATA_1A8EBA:         db $F3, $1A, $F1, $00, $00
DATA_1A8EBF:         db $00, $27, $E1, $00, $00
DATA_1A8EC4:         db $F9, $F3, $E1, $00, $00
DATA_1A8EC9:         db $EC, $FC, $F1, $00, $00
DATA_1A8ECE:         db $00, $00, $E2, $00, $00
DATA_1A8ED3:         db $04, $04, $E2, $00, $00
DATA_1A8ED8:         db $15, $09, $E1, $00, $00
DATA_1A8EDD:         db $F0, $0C, $E2, $00, $00
DATA_1A8EE2:         db $E0, $10, $E1, $00, $00
DATA_1A8EE7:         db $F0, $10, $40, $00, $02
DATA_1A8EEC:         db $EE, $15, $E2, $00, $00
DATA_1A8EF1:         db $FE, $18, $E2, $00, $00
DATA_1A8EF6:         db $00, $28, $E1, $00, $00
DATA_1A8EFB:         db $00, $28, $E1, $00, $00
DATA_1A8F00:         db $F8, $F0, $E1, $00, $00
DATA_1A8F05:         db $EA, $FA, $E1, $00, $00
DATA_1A8F0A:         db $01, $FD, $E2, $00, $00
DATA_1A8F0F:         db $F0, $00, $40, $00, $02
DATA_1A8F14:         db $07, $01, $F1, $00, $00
DATA_1A8F19:         db $00, $08, $40, $00, $02
DATA_1A8F1E:         db $18, $09, $E1, $00, $00
DATA_1A8F23:         db $EE, $0B, $F1, $00, $00
DATA_1A8F28:         db $EC, $16, $E2, $00, $00
DATA_1A8F2D:         db $FE, $1A, $E2, $00, $00
DATA_1A8F32:         db $0A, $1A, $F1, $00, $00
DATA_1A8F37:         db $F1, $1E, $E1, $00, $00
DATA_1A8F3C:         db $F8, $EE, $E1, $00, $00
DATA_1A8F41:         db $E8, $F8, $E1, $00, $00
DATA_1A8F46:         db $03, $FB, $F1, $00, $00
DATA_1A8F4B:         db $0A, $FE, $E1, $00, $00
DATA_1A8F50:         db $F0, $00, $E2, $00, $00
DATA_1A8F55:         db $FB, $05, $40, $00, $02
DATA_1A8F5A:         db $EB, $09, $40, $00, $02
DATA_1A8F5F:         db $EC, $0A, $E2, $00, $00
DATA_1A8F64:         db $EA, $18, $F1, $00, $00
DATA_1A8F69:         db $FF, $1C, $F0, $00, $00
DATA_1A8F6E:         db $0C, $1C, $F1, $00, $00
DATA_1A8F73:         db $F0, $20, $E1, $00, $00
DATA_1A8F78:         db $E7, $F7, $E1, $00, $00
DATA_1A8F7D:         db $04, $F8, $F1, $00, $00
DATA_1A8F82:         db $0D, $FB, $E1, $00, $00
DATA_1A8F87:         db $00, $00, $40, $00, $02
DATA_1A8F8C:         db $FA, $02, $F0, $00, $00
DATA_1A8F91:         db $EA, $09, $E1, $00, $00
DATA_1A8F96:         db $03, $0C, $40, $00, $02
DATA_1A8F9B:         db $F5, $0D, $F0, $00, $00
DATA_1A8FA0:         db $E7, $1B, $F1, $00, $00
DATA_1A8FA5:         db $FF, $1E, $F1, $00, $00
DATA_1A8FAA:         db $0E, $1E, $E1, $00, $00
DATA_1A8FAF:         db $EF, $22, $E1, $00, $00
DATA_1A8FB4:         db $05, $F6, $F1, $00, $00
DATA_1A8FB9:         db $0F, $F9, $E1, $00, $00
DATA_1A8FBE:         db $EE, $FE, $40, $00, $02
DATA_1A8FC3:         db $FA, $FF, $F0, $00, $00
DATA_1A8FC8:         db $E8, $08, $E1, $00, $00
DATA_1A8FCD:         db $09, $0A, $F0, $00, $00
DATA_1A8FD2:         db $EC, $0D, $F0, $00, $00
DATA_1A8FD7:         db $F6, $14, $E2, $00, $00
DATA_1A8FDC:         db $EF, $15, $40, $00, $02
DATA_1A8FE1:         db $E4, $1D, $E1, $00, $00
DATA_1A8FE6:         db $10, $20, $E1, $00, $00
DATA_1A8FEB:         db $FF, $21, $F1, $00, $00
DATA_1A8FF0:         db $F8, $F8, $6A, $00, $02
DATA_1A8FF5:         db $08, $F8, $6A, $40, $02
DATA_1A8FFA:         db $F8, $08, $6A, $80, $02
DATA_1A8FFF:         db $08, $08, $6A, $C0, $02
DATA_1A9004:         db $00, $00, $E3, $00, $02
DATA_1A9009:         db $00, $00, $E3, $00, $02
DATA_1A900E:         db $00, $00, $E3, $00, $02
DATA_1A9013:         db $00, $00, $E3, $00, $02
DATA_1A9018:         db $00, $00, $E5, $00, $02
DATA_1A901D:         db $00, $00, $E5, $00, $02
DATA_1A9022:         db $00, $00, $E5, $00, $02
DATA_1A9027:         db $00, $00, $E5, $00, $02
DATA_1A902C:         db $00, $00, $E7, $00, $02
DATA_1A9031:         db $00, $00, $E7, $00, $02
DATA_1A9036:         db $00, $00, $E7, $00, $02
DATA_1A903B:         db $00, $00, $E7, $00, $02
DATA_1A9040:         db $F8, $F8, $80, $01, $02
DATA_1A9045:         db $08, $F8, $82, $01, $02
DATA_1A904A:         db $F8, $08, $A0, $01, $02
DATA_1A904F:         db $08, $08, $A2, $01, $02
DATA_1A9054:         db $FB, $00, $E1, $00, $00
DATA_1A9059:         db $0C, $00, $E1, $00, $00
DATA_1A905E:         db $FB, $0F, $E1, $00, $00
DATA_1A9063:         db $0C, $0F, $E1, $00, $00
DATA_1A9068:         db $FB, $FF, $44, $00, $00
DATA_1A906D:         db $0C, $FF, $44, $00, $00
DATA_1A9072:         db $FB, $0E, $44, $00, $00
DATA_1A9077:         db $0C, $0E, $44, $00, $00
DATA_1A907C:         db $FB, $FE, $54, $00, $00
DATA_1A9081:         db $0C, $FE, $54, $00, $00
DATA_1A9086:         db $FB, $0D, $54, $00, $00
DATA_1A908B:         db $0C, $0D, $54, $00, $00
DATA_1A9090:         db $FC, $FD, $54, $00, $00
DATA_1A9095:         db $0C, $FD, $54, $00, $00
DATA_1A909A:         db $FC, $0B, $54, $00, $00
DATA_1A909F:         db $0C, $0B, $54, $00, $00
DATA_1A90A4:         db $FE, $FD, $45, $00, $00
DATA_1A90A9:         db $0A, $FD, $45, $00, $00
DATA_1A90AE:         db $FE, $0A, $45, $00, $00
DATA_1A90B3:         db $0A, $0A, $45, $00, $00
DATA_1A90B8:         db $FF, $FE, $55, $00, $00
DATA_1A90BD:         db $09, $FE, $55, $00, $00
DATA_1A90C2:         db $FF, $09, $55, $00, $00
DATA_1A90C7:         db $09, $09, $55, $00, $00
DATA_1A90CC:         db $00, $00, $E3, $00, $02
DATA_1A90D1:         db $00, $00, $E3, $00, $02
DATA_1A90D6:         db $00, $00, $E3, $00, $02
DATA_1A90DB:         db $00, $00, $E3, $00, $02
DATA_1A90E0:         db $00, $02, $00, $00, $02
DATA_1A90E5:         db $08, $12, $04, $00, $02
DATA_1A90EA:         db $F8, $22, $02, $00, $02
DATA_1A90EF:         db $08, $22, $02, $40, $02
DATA_1A90F4:         db $00, $02, $00, $00, $02
DATA_1A90F9:         db $04, $12, $06, $00, $02
DATA_1A90FE:         db $FC, $22, $02, $00, $02
DATA_1A9103:         db $06, $22, $02, $40, $02
DATA_1A9108:         db $00, $F8, $04, $00, $02
DATA_1A910D:         db $00, $08, $04, $80, $02
DATA_1A9112:         db $FE, $F8, $E3, $00, $02
DATA_1A9117:         db $01, $FA, $E3, $00, $02
DATA_1A911C:         db $FE, $04, $E3, $00, $02
DATA_1A9121:         db $01, $04, $E3, $00, $02
DATA_1A9126:         db $FD, $F8, $E3, $00, $02
DATA_1A912B:         db $02, $FA, $E3, $00, $02
DATA_1A9130:         db $FC, $04, $E3, $00, $02
DATA_1A9135:         db $05, $04, $E3, $00, $02
DATA_1A913A:         db $FC, $F9, $E3, $00, $02
DATA_1A913F:         db $05, $FB, $E3, $00, $02
DATA_1A9144:         db $FB, $07, $E3, $00, $02
DATA_1A9149:         db $04, $07, $E3, $00, $02
DATA_1A914E:         db $FC, $FA, $E5, $00, $02
DATA_1A9153:         db $05, $FA, $E5, $00, $02
DATA_1A9158:         db $FB, $07, $E5, $00, $02
DATA_1A915D:         db $04, $07, $E5, $00, $02
DATA_1A9162:         db $FC, $FB, $E5, $00, $02
DATA_1A9167:         db $05, $FD, $E5, $00, $02
DATA_1A916C:         db $FB, $08, $E5, $00, $02
DATA_1A9171:         db $04, $08, $E5, $00, $02
DATA_1A9176:         db $FC, $FC, $E5, $00, $02
DATA_1A917B:         db $05, $FE, $E5, $00, $02
DATA_1A9180:         db $FB, $09, $E5, $00, $02
DATA_1A9185:         db $04, $09, $E5, $00, $02
DATA_1A918A:         db $FC, $FD, $E7, $00, $02
DATA_1A918F:         db $05, $FF, $E7, $00, $02
DATA_1A9194:         db $FB, $0A, $E7, $00, $02
DATA_1A9199:         db $04, $0A, $E7, $00, $02
DATA_1A919E:         db $FC, $FE, $E7, $40, $02
DATA_1A91A3:         db $05, $00, $E7, $40, $02
DATA_1A91A8:         db $FB, $0B, $E7, $40, $02
DATA_1A91AD:         db $04, $0B, $E7, $40, $02
DATA_1A91B2:         db $FC, $FF, $E7, $00, $02
DATA_1A91B7:         db $05, $01, $E7, $00, $02
DATA_1A91BC:         db $FB, $0C, $E7, $00, $02
DATA_1A91C1:         db $04, $0C, $E7, $00, $02
DATA_1A91C6:         db $00, $F8, $E3, $00, $02
DATA_1A91CB:         db $FB, $FB, $E3, $00, $02
DATA_1A91D0:         db $05, $FB, $E3, $00, $02
DATA_1A91D5:         db $F8, $01, $E3, $00, $02
DATA_1A91DA:         db $08, $01, $E3, $00, $02
DATA_1A91DF:         db $FB, $07, $E3, $00, $02
DATA_1A91E4:         db $06, $07, $E3, $00, $02
DATA_1A91E9:         db $00, $08, $E3, $00, $02
DATA_1A91EE:         db $00, $F8, $E5, $00, $02
DATA_1A91F3:         db $FB, $FB, $E5, $00, $02
DATA_1A91F8:         db $05, $FB, $E5, $00, $02
DATA_1A91FD:         db $F8, $01, $E5, $00, $02
DATA_1A9202:         db $08, $01, $E5, $00, $02
DATA_1A9207:         db $FB, $07, $E5, $00, $02
DATA_1A920C:         db $06, $07, $E5, $00, $02
DATA_1A9211:         db $00, $08, $E5, $00, $02
DATA_1A9216:         db $00, $F8, $E5, $C0, $02
DATA_1A921B:         db $FB, $FB, $E5, $C0, $02
DATA_1A9220:         db $05, $FB, $E5, $C0, $02
DATA_1A9225:         db $F8, $01, $E5, $C0, $02
DATA_1A922A:         db $08, $01, $E5, $C0, $02
DATA_1A922F:         db $FB, $06, $E5, $C0, $02
DATA_1A9234:         db $06, $06, $E5, $C0, $02
DATA_1A9239:         db $00, $08, $E5, $04, $02
DATA_1A923E:         db $00, $F8, $E7, $00, $02
DATA_1A9243:         db $FB, $FB, $E7, $00, $02
DATA_1A9248:         db $05, $FB, $E7, $00, $02
DATA_1A924D:         db $F8, $01, $E7, $00, $02
DATA_1A9252:         db $08, $01, $E7, $00, $02
DATA_1A9257:         db $FB, $07, $E7, $00, $02
DATA_1A925C:         db $06, $07, $E7, $00, $02
DATA_1A9261:         db $00, $08, $E7, $00, $02
DATA_1A9266:         db $00, $F8, $E7, $C0, $02
DATA_1A926B:         db $FB, $FB, $E7, $C0, $02
DATA_1A9270:         db $05, $FB, $E7, $C0, $02
DATA_1A9275:         db $F8, $01, $E7, $80, $02
DATA_1A927A:         db $08, $01, $E7, $C0, $02
DATA_1A927F:         db $FB, $07, $E7, $C0, $02
DATA_1A9284:         db $06, $07, $E7, $C0, $02
DATA_1A9289:         db $00, $08, $E7, $C0, $02
DATA_1A928E:         db $00, $F8, $E7, $00, $02
DATA_1A9293:         db $FB, $FB, $E7, $00, $02
DATA_1A9298:         db $05, $FB, $E7, $00, $02
DATA_1A929D:         db $F8, $01, $E7, $00, $02
DATA_1A92A2:         db $08, $01, $E7, $00, $02
DATA_1A92A7:         db $FB, $06, $E7, $00, $02
DATA_1A92AC:         db $06, $07, $E7, $00, $02
DATA_1A92B1:         db $00, $08, $E7, $00, $02
DATA_1A92B6:         db $F8, $F8, $6A, $00, $02
DATA_1A92BB:         db $08, $F8, $6A, $40, $02
DATA_1A92C0:         db $F8, $08, $6A, $80, $02
DATA_1A92C5:         db $08, $08, $6A, $C0, $02
DATA_1A92CA:         db $F8, $F8, $6A, $00, $02
DATA_1A92CF:         db $08, $F8, $6A, $40, $02
DATA_1A92D4:         db $F8, $08, $6A, $80, $02
DATA_1A92D9:         db $08, $08, $6A, $C0, $02
DATA_1A92DE:         db $00, $00, $40, $00, $02
DATA_1A92E3:         db $00, $00, $40, $00, $02
DATA_1A92E8:         db $00, $00, $40, $00, $02
DATA_1A92ED:         db $00, $00, $40, $00, $02
DATA_1A92F2:         db $00, $00, $40, $00, $02
DATA_1A92F7:         db $00, $00, $40, $00, $02
DATA_1A92FC:         db $00, $00, $40, $00, $02
DATA_1A9301:         db $00, $00, $40, $00, $02
DATA_1A9306:         db $00, $F8, $55, $00, $00
DATA_1A930B:         db $08, $F8, $55, $00, $00
DATA_1A9310:         db $F8, $00, $55, $00, $00
DATA_1A9315:         db $F8, $08, $55, $00, $00
DATA_1A931A:         db $10, $00, $55, $00, $00
DATA_1A931F:         db $10, $08, $55, $00, $00
DATA_1A9324:         db $00, $10, $55, $00, $00
DATA_1A9329:         db $08, $10, $55, $00, $00
DATA_1A932E:         db $FC, $F0, $55, $00, $00
DATA_1A9333:         db $0C, $F0, $55, $00, $00
DATA_1A9338:         db $F0, $FC, $55, $00, $00
DATA_1A933D:         db $F0, $0C, $55, $00, $00
DATA_1A9342:         db $18, $FC, $55, $00, $00
DATA_1A9347:         db $18, $0C, $55, $00, $00
DATA_1A934C:         db $FC, $18, $55, $00, $00
DATA_1A9351:         db $0C, $18, $55, $00, $00
DATA_1A9356:         db $FA, $EC, $55, $00, $00
DATA_1A935B:         db $0E, $EC, $55, $00, $00
DATA_1A9360:         db $EC, $FA, $55, $00, $00
DATA_1A9365:         db $EC, $0E, $55, $00, $00
DATA_1A936A:         db $1C, $FA, $55, $00, $00
DATA_1A936F:         db $1C, $0E, $55, $00, $00
DATA_1A9374:         db $FA, $1C, $55, $00, $00
DATA_1A9379:         db $0E, $1C, $55, $00, $00
DATA_1A937E:         db $F9, $EB, $55, $00, $00
DATA_1A9383:         db $0F, $EB, $55, $00, $00
DATA_1A9388:         db $EA, $FA, $55, $00, $00
DATA_1A938D:         db $EA, $10, $55, $00, $00
DATA_1A9392:         db $1E, $FA, $55, $00, $00
DATA_1A9397:         db $1E, $10, $55, $00, $00
DATA_1A939C:         db $F9, $1D, $55, $00, $00
DATA_1A93A1:         db $0F, $1D, $55, $00, $00
DATA_1A93A6:         db $F8, $EB, $55, $00, $00
DATA_1A93AB:         db $10, $EB, $55, $00, $00
DATA_1A93B0:         db $E8, $FA, $55, $00, $00
DATA_1A93B5:         db $E8, $13, $55, $00, $00
DATA_1A93BA:         db $20, $FA, $55, $00, $00
DATA_1A93BF:         db $20, $13, $55, $00, $00
DATA_1A93C4:         db $F8, $23, $55, $00, $00
DATA_1A93C9:         db $10, $23, $55, $00, $00
DATA_1A93CE:         db $F7, $EB, $55, $00, $00
DATA_1A93D3:         db $11, $EB, $55, $00, $00
DATA_1A93D8:         db $E5, $FB, $55, $00, $00
DATA_1A93DD:         db $E5, $16, $55, $00, $00
DATA_1A93E2:         db $22, $FB, $55, $00, $00
DATA_1A93E7:         db $22, $16, $55, $00, $00
DATA_1A93EC:         db $F7, $27, $55, $00, $00
DATA_1A93F1:         db $11, $27, $55, $00, $00
DATA_1A93F6:         db $F6, $EB, $55, $00, $00
DATA_1A93FB:         db $12, $EB, $55, $00, $00
DATA_1A9400:         db $E4, $FC, $55, $00, $00
DATA_1A9405:         db $E4, $19, $55, $00, $00
DATA_1A940A:         db $24, $FC, $55, $00, $00
DATA_1A940F:         db $24, $19, $55, $00, $00
DATA_1A9414:         db $F6, $2B, $55, $00, $00
DATA_1A9419:         db $12, $2B, $55, $00, $00
DATA_1A941E:         db $F5, $EC, $45, $00, $00
DATA_1A9423:         db $13, $EC, $45, $00, $00
DATA_1A9428:         db $E2, $FF, $45, $00, $00
DATA_1A942D:         db $E2, $1C, $45, $00, $00
DATA_1A9432:         db $26, $FF, $45, $00, $00
DATA_1A9437:         db $26, $1C, $45, $00, $00
DATA_1A943C:         db $F5, $2F, $45, $00, $00
DATA_1A9441:         db $13, $2F, $45, $00, $00
DATA_1A9446:         db $F5, $ED, $54, $00, $00
DATA_1A944B:         db $13, $ED, $54, $00, $00
DATA_1A9450:         db $E1, $00, $54, $00, $00
DATA_1A9455:         db $E1, $1E, $54, $00, $00
DATA_1A945A:         db $27, $00, $54, $00, $00
DATA_1A945F:         db $27, $1E, $54, $00, $00
DATA_1A9464:         db $F5, $31, $54, $00, $00
DATA_1A9469:         db $13, $31, $54, $00, $00
DATA_1A946E:         db $F5, $EF, $44, $00, $00
DATA_1A9473:         db $13, $EF, $44, $00, $00
DATA_1A9478:         db $E0, $03, $44, $00, $00
DATA_1A947D:         db $E0, $20, $44, $00, $00
DATA_1A9482:         db $28, $03, $44, $00, $00
DATA_1A9487:         db $28, $20, $44, $00, $00
DATA_1A948C:         db $F5, $34, $44, $00, $00
DATA_1A9491:         db $13, $34, $44, $00, $00
DATA_1A9496:         db $F0, $F0, $06, $00, $02
DATA_1A949B:         db $00, $F0, $08, $00, $02
DATA_1A94A0:         db $10, $F0, $0A, $00, $02
DATA_1A94A5:         db $F0, $00, $26, $00, $02
DATA_1A94AA:         db $00, $00, $28, $00, $02
DATA_1A94AF:         db $10, $00, $2A, $00, $02
DATA_1A94B4:         db $F0, $10, $46, $00, $02
DATA_1A94B9:         db $00, $10, $48, $00, $02
DATA_1A94BE:         db $10, $10, $4A, $00, $02
DATA_1A94C3:         db $10, $10, $4A, $00, $02
DATA_1A94C8:         db $00, $F0, $02, $00, $02
DATA_1A94CD:         db $00, $F0, $02, $00, $02
DATA_1A94D2:         db $10, $F0, $04, $00, $02
DATA_1A94D7:         db $00, $00, $22, $00, $02
DATA_1A94DC:         db $00, $00, $22, $00, $02
DATA_1A94E1:         db $10, $00, $24, $00, $02
DATA_1A94E6:         db $F0, $10, $40, $00, $02
DATA_1A94EB:         db $00, $10, $42, $00, $02
DATA_1A94F0:         db $10, $10, $44, $00, $02
DATA_1A94F5:         db $10, $10, $44, $00, $02
DATA_1A94FA:         db $00, $F0, $02, $00, $02
DATA_1A94FF:         db $10, $F8, $4C, $00, $02
DATA_1A9504:         db $00, $F0, $02, $00, $02
DATA_1A9509:         db $10, $F0, $04, $00, $02
DATA_1A950E:         db $00, $00, $22, $00, $02
DATA_1A9513:         db $00, $00, $22, $00, $02
DATA_1A9518:         db $10, $00, $24, $00, $02
DATA_1A951D:         db $F0, $10, $40, $00, $02
DATA_1A9522:         db $00, $10, $42, $00, $02
DATA_1A9527:         db $10, $10, $44, $00, $02
DATA_1A952C:         db $F8, $F8, $6A, $00, $02
DATA_1A9531:         db $08, $F8, $6A, $40, $02
DATA_1A9536:         db $F8, $08, $6A, $80, $02
DATA_1A953B:         db $08, $08, $6A, $C0, $02
DATA_1A9540:         db $FC, $FB, $F9, $00, $00
DATA_1A9545:         db $0C, $FB, $F9, $00, $00
DATA_1A954A:         db $FC, $08, $F9, $00, $00
DATA_1A954F:         db $0C, $08, $F9, $00, $00
DATA_1A9554:         db $FB, $F9, $F9, $00, $00
DATA_1A9559:         db $0D, $F9, $F9, $00, $00
DATA_1A955E:         db $FB, $08, $F9, $00, $00
DATA_1A9563:         db $0D, $08, $F9, $00, $00
DATA_1A9568:         db $FA, $F8, $F9, $00, $00
DATA_1A956D:         db $0E, $F8, $F9, $00, $00
DATA_1A9572:         db $FA, $09, $F9, $00, $00
DATA_1A9577:         db $0E, $09, $F9, $00, $00
DATA_1A957C:         db $F9, $F8, $F9, $00, $00
DATA_1A9581:         db $0F, $F8, $F9, $00, $00
DATA_1A9586:         db $F9, $0A, $F9, $00, $00
DATA_1A958B:         db $0F, $0A, $F9, $00, $00
DATA_1A9590:         db $F8, $F9, $F9, $00, $00
DATA_1A9595:         db $10, $F9, $F9, $00, $00
DATA_1A959A:         db $F8, $0C, $F9, $00, $00
DATA_1A959F:         db $10, $0C, $F9, $00, $00
DATA_1A95A4:         db $F7, $FA, $F9, $00, $00
DATA_1A95A9:         db $11, $FA, $F9, $00, $00
DATA_1A95AE:         db $F7, $0E, $F9, $00, $00
DATA_1A95B3:         db $11, $0E, $F9, $00, $00
DATA_1A95B8:         db $F7, $FB, $E2, $00, $00
DATA_1A95BD:         db $11, $FB, $E2, $00, $00
DATA_1A95C2:         db $F7, $0F, $E2, $00, $00
DATA_1A95C7:         db $11, $0F, $E2, $00, $00
DATA_1A95CC:         db $F7, $FC, $59, $00, $00
DATA_1A95D1:         db $11, $FC, $59, $00, $00
DATA_1A95D6:         db $F7, $10, $59, $00, $00
DATA_1A95DB:         db $11, $10, $59, $00, $00
DATA_1A95E0:         db $F7, $FD, $F8, $00, $00
DATA_1A95E5:         db $11, $FD, $F8, $00, $00
DATA_1A95EA:         db $F7, $11, $F8, $00, $00
DATA_1A95EF:         db $11, $11, $F8, $00, $00
DATA_1A95F4:         db $F7, $FE, $F7, $00, $00
DATA_1A95F9:         db $11, $FE, $F7, $00, $00
DATA_1A95FE:         db $F7, $12, $F7, $00, $00
DATA_1A9603:         db $11, $12, $F7, $00, $00
DATA_1A9608:         db $FE, $FF, $2C, $04, $00
DATA_1A960D:         db $08, $08, $02, $0C, $00
DATA_1A9612:         db $0E, $04, $14, $0C, $00
DATA_1A9617:         db $FE, $FF, $00, $0C, $02
DATA_1A961C:         db $00, $08, $02, $0C, $00
DATA_1A9621:         db $04, $00, $04, $04, $00
DATA_1A9626:         db $00, $FF, $08, $0C, $00
DATA_1A962B:         db $00, $08, $02, $0C, $00
DATA_1A9630:         db $08, $08, $02, $0C, $00
DATA_1A9635:         db $00, $FF, $08, $0C, $02
DATA_1A963A:         db $FE, $FE, $2C, $04, $00
DATA_1A963F:         db $FD, $06, $12, $4C, $00
DATA_1A9644:         db $0A, $06, $12, $0C, $00
DATA_1A9649:         db $0E, $03, $14, $0C, $00
DATA_1A964E:         db $FE, $FE, $00, $0C, $02
DATA_1A9653:         db $FE, $FE, $2C, $04, $00
DATA_1A9658:         db $FF, $07, $03, $4C, $00
DATA_1A965D:         db $08, $07, $03, $0C, $00
DATA_1A9662:         db $0E, $03, $14, $0C, $00
DATA_1A9667:         db $FE, $FE, $00, $0C, $02
DATA_1A966C:         db $FE, $FE, $2C, $04, $00
DATA_1A9671:         db $FE, $FE, $00, $0C, $00
DATA_1A9676:         db $03, $08, $02, $0C, $00
DATA_1A967B:         db $0E, $03, $14, $0C, $00
DATA_1A9680:         db $FE, $FE, $00, $0C, $02
DATA_1A9685:         db $04, $02, $15, $0C, $00
DATA_1A968A:         db $04, $02, $15, $0C, $00
DATA_1A968F:         db $00, $00, $06, $0C, $02
DATA_1A9694:         db $00, $08, $16, $0C, $00
DATA_1A9699:         db $08, $08, $17, $0C, $00
DATA_1A969E:         db $04, $FD, $05, $04, $00
DATA_1A96A3:         db $08, $FD, $0B, $0C, $00
DATA_1A96A8:         db $00, $FD, $0A, $0C, $00
DATA_1A96AD:         db $04, $02, $15, $0C, $00
DATA_1A96B2:         db $00, $00, $06, $0C, $02
DATA_1A96B7:         db $04, $00, $05, $04, $00
DATA_1A96BC:         db $04, $10, $13, $0C, $00
DATA_1A96C1:         db $04, $10, $13, $0C, $00
DATA_1A96C6:         db $04, $10, $13, $0C, $00
DATA_1A96CB:         db $00, $00, $0A, $0C, $02
DATA_1A96D0:         db $00, $00, $0E, $0C, $00
DATA_1A96D5:         db $04, $10, $13, $0C, $00
DATA_1A96DA:         db $04, $10, $13, $0C, $00
DATA_1A96DF:         db $04, $10, $13, $0C, $00
DATA_1A96E4:         db $00, $00, $0E, $0C, $02
DATA_1A96E9:         db $04, $0C, $13, $0C, $00
DATA_1A96EE:         db $08, $00, $0F, $0C, $00
DATA_1A96F3:         db $00, $00, $0E, $0C, $00
DATA_1A96F8:         db $04, $0C, $13, $0C, $00
DATA_1A96FD:         db $00, $00, $0E, $0C, $02
DATA_1A9702:         db $00, $08, $0E, $8C, $00
DATA_1A9707:         db $08, $00, $1F, $8C, $00
DATA_1A970C:         db $00, $00, $1E, $8C, $00
DATA_1A9711:         db $08, $08, $0F, $8C, $00
DATA_1A9716:         db $00, $08, $0E, $8C, $00
DATA_1A971B:         db $FE, $FE, $2C, $04, $00
DATA_1A9720:         db $08, $08, $12, $0C, $00
DATA_1A9725:         db $00, $08, $12, $4C, $00
DATA_1A972A:         db $0A, $01, $14, $0C, $00
DATA_1A972F:         db $FE, $FE, $00, $0C, $02
DATA_1A9734:         db $04, $01, $04, $04, $00
DATA_1A9739:         db $08, $08, $19, $0C, $00
DATA_1A973E:         db $00, $08, $18, $0C, $00
DATA_1A9743:         db $08, $00, $09, $0C, $00
DATA_1A9748:         db $00, $00, $08, $0C, $00
DATA_1A974D:         db $04, $07, $04, $04, $00
DATA_1A9752:         db $08, $08, $1D, $0C, $00
DATA_1A9757:         db $00, $08, $1C, $0C, $00
DATA_1A975C:         db $08, $00, $0D, $0C, $00
DATA_1A9761:         db $00, $00, $0C, $0C, $00
DATA_1A9766:         db $04, $07, $05, $04, $00
DATA_1A976B:         db $04, $F8, $13, $0C, $00
DATA_1A9770:         db $04, $F8, $13, $0C, $00
DATA_1A9775:         db $04, $F8, $13, $0C, $00
DATA_1A977A:         db $00, $00, $0A, $8C, $02
DATA_1A977F:         db $08, $FC, $1F, $8C, $00
DATA_1A9784:         db $00, $FC, $1E, $8C, $00
DATA_1A9789:         db $04, $01, $15, $0C, $00
DATA_1A978E:         db $00, $00, $06, $0C, $02
DATA_1A9793:         db $08, $08, $17, $0C, $00
DATA_1A9798:         db $04, $01, $15, $8C, $00
DATA_1A979D:         db $04, $01, $15, $8C, $00
DATA_1A97A2:         db $00, $00, $06, $0C, $02
DATA_1A97A7:         db $08, $08, $17, $0C, $00
DATA_1A97AC:         db $00, $08, $16, $0C, $00
DATA_1A97B1:         db $04, $01, $04, $04, $00
DATA_1A97B6:         db $08, $00, $1D, $8C, $00
DATA_1A97BB:         db $00, $00, $1C, $8C, $00
DATA_1A97C0:         db $08, $08, $0D, $8C, $00
DATA_1A97C5:         db $00, $08, $0C, $8C, $00
DATA_1A97CA:         db $04, $0B, $13, $0C, $00
DATA_1A97CF:         db $04, $0B, $13, $0C, $00
DATA_1A97D4:         db $08, $07, $1F, $0C, $00
DATA_1A97D9:         db $00, $07, $1E, $0C, $00
DATA_1A97DE:         db $04, $04, $15, $8C, $00
DATA_1A97E3:         db $04, $04, $15, $0C, $00
DATA_1A97E8:         db $04, $04, $15, $0C, $00
DATA_1A97ED:         db $00, $00, $06, $0C, $02
DATA_1A97F2:         db $00, $08, $16, $0C, $00
DATA_1A97F7:         db $08, $00, $07, $0C, $00
DATA_1A97FC:         db $04, $04, $15, $8C, $00
DATA_1A9801:         db $04, $04, $15, $8C, $00
DATA_1A9806:         db $00, $00, $06, $0C, $02
DATA_1A980B:         db $00, $08, $16, $0C, $00
DATA_1A9810:         db $08, $00, $07, $0C, $00
DATA_1A9815:         db $04, $08, $04, $04, $00
DATA_1A981A:         db $08, $09, $1D, $0C, $00
DATA_1A981F:         db $00, $09, $1C, $0C, $00
DATA_1A9824:         db $04, $04, $15, $8C, $00
DATA_1A9829:         db $00, $00, $06, $0C, $02
DATA_1A982E:         db $04, $04, $04, $04, $00
DATA_1A9833:         db $08, $08, $17, $0C, $00
DATA_1A9838:         db $00, $08, $16, $0C, $00
DATA_1A983D:         db $08, $00, $07, $0C, $00
DATA_1A9842:         db $00, $00, $06, $0C, $00
DATA_1A9847:         db $FE, $01, $2C, $04, $00
DATA_1A984C:         db $08, $08, $02, $0C, $00
DATA_1A9851:         db $0C, $06, $14, $0C, $00
DATA_1A9856:         db $FE, $01, $00, $0C, $02
DATA_1A985B:         db $00, $08, $02, $0C, $00
DATA_1A9860:         db $FE, $FB, $2C, $04, $00
DATA_1A9865:         db $08, $08, $12, $4C, $00
DATA_1A986A:         db $0E, $00, $14, $0C, $00
DATA_1A986F:         db $FE, $FB, $00, $0C, $02
DATA_1A9874:         db $01, $08, $12, $0C, $00
DATA_1A9879:         db $FE, $FD, $2C, $04, $00
DATA_1A987E:         db $08, $0B, $03, $8C, $00
DATA_1A9883:         db $0E, $02, $14, $0C, $00
DATA_1A9888:         db $FE, $FD, $00, $0C, $02
DATA_1A988D:         db $00, $0B, $03, $CC, $00
DATA_1A9892:         db $FE, $FF, $2C, $04, $00
DATA_1A9897:         db $09, $08, $02, $0C, $00
DATA_1A989C:         db $0E, $02, $14, $0C, $00
DATA_1A98A1:         db $FE, $FF, $00, $0C, $02
DATA_1A98A6:         db $FF, $08, $02, $0C, $00
DATA_1A98AB:         db $FE, $00, $2C, $04, $00
DATA_1A98B0:         db $09, $08, $03, $0C, $00
DATA_1A98B5:         db $0E, $01, $14, $0C, $00
DATA_1A98BA:         db $FE, $00, $00, $0C, $02
DATA_1A98BF:         db $FF, $08, $03, $4C, $00
DATA_1A98C4:         db $FE, $00, $2C, $04, $00
DATA_1A98C9:         db $0B, $09, $12, $CC, $00
DATA_1A98CE:         db $0E, $02, $14, $0C, $00
DATA_1A98D3:         db $FE, $00, $00, $0C, $02
DATA_1A98D8:         db $FC, $09, $12, $8C, $00
DATA_1A98DD:         db $FE, $01, $2C, $04, $00
DATA_1A98E2:         db $08, $08, $02, $0C, $00
DATA_1A98E7:         db $0E, $08, $14, $0C, $00
DATA_1A98EC:         db $FE, $01, $00, $0C, $02
DATA_1A98F1:         db $00, $08, $02, $0C, $00
DATA_1A98F6:         db $04, $04, $05, $04, $00
DATA_1A98FB:         db $08, $08, $17, $0C, $00
DATA_1A9900:         db $00, $08, $16, $0C, $00
DATA_1A9905:         db $08, $00, $07, $0C, $00
DATA_1A990A:         db $00, $00, $06, $0C, $00
DATA_1A990F:         db $02, $04, $04, $04, $00
DATA_1A9914:         db $08, $08, $17, $0C, $00
DATA_1A9919:         db $00, $08, $16, $0C, $00
DATA_1A991E:         db $08, $00, $07, $0C, $00
DATA_1A9923:         db $00, $00, $06, $0C, $00
DATA_1A9928:         db $01, $04, $04, $04, $00
DATA_1A992D:         db $08, $08, $17, $0C, $00
DATA_1A9932:         db $00, $08, $16, $0C, $00
DATA_1A9937:         db $08, $00, $07, $0C, $00
DATA_1A993C:         db $00, $00, $06, $0C, $00
DATA_1A9941:         db $06, $04, $04, $04, $00
DATA_1A9946:         db $08, $08, $17, $0C, $00
DATA_1A994B:         db $00, $08, $16, $0C, $00
DATA_1A9950:         db $08, $00, $07, $0C, $00
DATA_1A9955:         db $00, $00, $06, $0C, $00
DATA_1A995A:         db $07, $04, $04, $04, $00
DATA_1A995F:         db $08, $08, $17, $0C, $00
DATA_1A9964:         db $00, $08, $16, $0C, $00
DATA_1A9969:         db $08, $00, $07, $0C, $00
DATA_1A996E:         db $00, $00, $06, $0C, $00
DATA_1A9973:         db $00, $00, $06, $0C, $00
DATA_1A9978:         db $08, $08, $17, $0C, $00
DATA_1A997D:         db $00, $00, $06, $0C, $02
DATA_1A9982:         db $04, $04, $04, $04, $00
DATA_1A9987:         db $04, $04, $04, $04, $00
DATA_1A998C:         db $00, $00, $06, $0C, $02
DATA_1A9991:         db $04, $04, $05, $04, $00
DATA_1A9996:         db $04, $04, $05, $04, $00
DATA_1A999B:         db $00, $00, $06, $0C, $02
DATA_1A99A0:         db $02, $04, $04, $04, $00
DATA_1A99A5:         db $02, $04, $04, $04, $00
DATA_1A99AA:         db $00, $00, $06, $0C, $02
DATA_1A99AF:         db $01, $04, $04, $04, $00
DATA_1A99B4:         db $01, $04, $04, $04, $00
DATA_1A99B9:         db $00, $00, $06, $0C, $02
DATA_1A99BE:         db $06, $04, $04, $04, $00
DATA_1A99C3:         db $06, $04, $04, $04, $00
DATA_1A99C8:         db $00, $00, $06, $0C, $02
DATA_1A99CD:         db $07, $04, $04, $04, $00
DATA_1A99D2:         db $07, $04, $04, $04, $00
DATA_1A99D7:         db $00, $00, $06, $0C, $02
DATA_1A99DC:         db $FE, $FF, $2C, $24, $00
DATA_1A99E1:         db $0E, $04, $14, $2C, $00
DATA_1A99E6:         db $FE, $FF, $00, $2C, $02
DATA_1A99EB:         db $04, $00, $04, $24, $00
DATA_1A99F0:         db $08, $08, $02, $2C, $00
DATA_1A99F5:         db $00, $FF, $08, $2C, $02
DATA_1A99FA:         db $08, $00, $E2, $00, $00
DATA_1A99FF:         db $01, $01, $E2, $00, $00
DATA_1A9A04:         db $0D, $02, $E2, $00, $00
DATA_1A9A09:         db $FC, $03, $E2, $00, $00
DATA_1A9A0E:         db $03, $05, $E2, $00, $00
DATA_1A9A13:         db $00, $08, $E2, $00, $00
DATA_1A9A18:         db $09, $08, $E2, $00, $00
DATA_1A9A1D:         db $09, $FF, $E2, $00, $00
DATA_1A9A22:         db $00, $00, $E2, $00, $00
DATA_1A9A27:         db $0E, $02, $E2, $00, $00
DATA_1A9A2C:         db $FB, $03, $F0, $00, $00
DATA_1A9A31:         db $03, $05, $E2, $00, $00
DATA_1A9A36:         db $FF, $08, $E2, $00, $00
DATA_1A9A3B:         db $0A, $08, $E2, $00, $00
DATA_1A9A40:         db $0A, $FF, $E2, $00, $00
DATA_1A9A45:         db $00, $00, $E2, $00, $00
DATA_1A9A4A:         db $FA, $02, $F0, $00, $00
DATA_1A9A4F:         db $0F, $02, $E2, $00, $00
DATA_1A9A54:         db $03, $04, $E2, $00, $00
DATA_1A9A59:         db $FE, $08, $E2, $00, $00
DATA_1A9A5E:         db $0B, $08, $F0, $00, $00
DATA_1A9A63:         db $0B, $FF, $E2, $00, $00
DATA_1A9A68:         db $00, $00, $E2, $00, $00
DATA_1A9A6D:         db $F9, $02, $F0, $00, $00
DATA_1A9A72:         db $0F, $02, $E2, $00, $00
DATA_1A9A77:         db $03, $03, $F1, $00, $00
DATA_1A9A7C:         db $FE, $08, $E2, $00, $00
DATA_1A9A81:         db $0B, $08, $F0, $00, $00
DATA_1A9A86:         db $00, $FF, $E2, $00, $00
DATA_1A9A8B:         db $0B, $FF, $F0, $00, $00
DATA_1A9A90:         db $F9, $02, $F1, $00, $00
DATA_1A9A95:         db $0F, $02, $E2, $00, $00
DATA_1A9A9A:         db $03, $03, $F1, $00, $00
DATA_1A9A9F:         db $FD, $08, $F0, $00, $00
DATA_1A9AA4:         db $0C, $08, $F0, $00, $00
DATA_1A9AA9:         db $00, $FF, $F0, $00, $00
DATA_1A9AAE:         db $0B, $FF, $F1, $00, $00
DATA_1A9AB3:         db $F9, $02, $F1, $00, $00
DATA_1A9AB8:         db $0F, $02, $E2, $00, $00
DATA_1A9ABD:         db $03, $03, $F1, $00, $00
DATA_1A9AC2:         db $FD, $08, $F1, $00, $00
DATA_1A9AC7:         db $0C, $08, $F0, $00, $00
DATA_1A9ACC:         db $00, $FF, $F0, $00, $00
DATA_1A9AD1:         db $0B, $FF, $F1, $00, $00
DATA_1A9AD6:         db $F9, $02, $F1, $00, $00
DATA_1A9ADB:         db $0F, $02, $F0, $00, $00
DATA_1A9AE0:         db $03, $03, $F1, $00, $00
DATA_1A9AE5:         db $FD, $08, $F1, $00, $00
DATA_1A9AEA:         db $0C, $08, $F1, $00, $00
DATA_1A9AEF:         db $FF, $FF, $F1, $00, $00
DATA_1A9AF4:         db $0B, $FF, $F1, $00, $00
DATA_1A9AF9:         db $F8, $02, $F1, $00, $00
DATA_1A9AFE:         db $10, $02, $F1, $00, $00
DATA_1A9B03:         db $03, $03, $E1, $00, $00
DATA_1A9B08:         db $FD, $08, $E1, $00, $00
DATA_1A9B0D:         db $0C, $08, $F1, $00, $00
DATA_1A9B12:         db $FE, $FF, $F1, $00, $00
DATA_1A9B17:         db $0B, $FF, $F1, $00, $00
DATA_1A9B1C:         db $F8, $02, $F1, $00, $00
DATA_1A9B21:         db $03, $02, $E1, $00, $00
DATA_1A9B26:         db $10, $02, $E1, $00, $00
DATA_1A9B2B:         db $FD, $08, $E1, $00, $00
DATA_1A9B30:         db $0C, $08, $F1, $00, $00
DATA_1A9B35:         db $0B, $FE, $F1, $00, $00
DATA_1A9B3A:         db $FE, $FF, $E1, $00, $00
DATA_1A9B3F:         db $F7, $02, $F1, $00, $00
DATA_1A9B44:         db $10, $02, $E1, $00, $00
DATA_1A9B49:         db $FD, $07, $E1, $00, $00
DATA_1A9B4E:         db $0C, $08, $E1, $00, $00
DATA_1A9B53:         db $0C, $08, $E1, $00, $00
DATA_1A9B58:         db $0B, $FE, $E1, $00, $00
DATA_1A9B5D:         db $F7, $01, $E1, $00, $00
DATA_1A9B62:         db $FD, $07, $E1, $00, $00
DATA_1A9B67:         db $0D, $08, $E1, $00, $00
DATA_1A9B6C:         db $F7, $01, $E1, $00, $00
DATA_1A9B71:         db $FD, $07, $E1, $00, $00
DATA_1A9B76:         db $0D, $08, $E1, $00, $00
DATA_1A9B7B:         db $0D, $07, $E1, $00, $00
DATA_1A9B80:         db $F7, $00, $E1, $00, $00
DATA_1A9B85:         db $0D, $07, $E1, $00, $00
DATA_1A9B8A:         db $F7, $00, $E1, $00, $00
DATA_1A9B8F:         db $F7, $00, $E1, $00, $00
DATA_1A9B94:         db $0D, $07, $E1, $00, $00
DATA_1A9B99:         db $F7, $00, $E1, $00, $00
DATA_1A9B9E:         db $FD, $FC, $62, $00, $02
DATA_1A9BA3:         db $FD, $FC, $62, $00, $00
DATA_1A9BA8:         db $00, $03, $64, $00, $02
DATA_1A9BAD:         db $FD, $FC, $62, $00, $02
DATA_1A9BB2:         db $FD, $FC, $62, $00, $00
DATA_1A9BB7:         db $00, $03, $64, $00, $02
DATA_1A9BBC:         db $FD, $FC, $62, $00, $02
DATA_1A9BC1:         db $FD, $FC, $62, $00, $00
DATA_1A9BC6:         db $00, $03, $64, $00, $02
DATA_1A9BCB:         db $FE, $FC, $62, $00, $02
DATA_1A9BD0:         db $FE, $FC, $62, $00, $00
DATA_1A9BD5:         db $00, $03, $64, $00, $02
DATA_1A9BDA:         db $01, $FA, $62, $00, $02
DATA_1A9BDF:         db $01, $FA, $62, $00, $00
DATA_1A9BE4:         db $00, $03, $64, $00, $02
DATA_1A9BE9:         db $FE, $FC, $62, $00, $02
DATA_1A9BEE:         db $FE, $FC, $62, $00, $00
DATA_1A9BF3:         db $00, $03, $64, $00, $02
DATA_1A9BF8:         db $FF, $FB, $62, $00, $02
DATA_1A9BFD:         db $FF, $FB, $62, $00, $00
DATA_1A9C02:         db $00, $03, $64, $00, $02
DATA_1A9C07:         db $01, $F9, $62, $00, $02
DATA_1A9C0C:         db $01, $F9, $62, $00, $00
DATA_1A9C11:         db $00, $03, $64, $00, $02
DATA_1A9C16:         db $FF, $FC, $62, $00, $02
DATA_1A9C1B:         db $FF, $FC, $62, $00, $00
DATA_1A9C20:         db $00, $03, $64, $00, $02
DATA_1A9C25:         db $FF, $FD, $62, $00, $02
DATA_1A9C2A:         db $FF, $FD, $62, $00, $00
DATA_1A9C2F:         db $00, $03, $64, $00, $02
DATA_1A9C34:         db $00, $FA, $62, $00, $02
DATA_1A9C39:         db $00, $FA, $62, $00, $00
DATA_1A9C3E:         db $00, $03, $64, $00, $02
DATA_1A9C43:         db $02, $FB, $62, $00, $02
DATA_1A9C48:         db $02, $FB, $62, $00, $00
DATA_1A9C4D:         db $00, $03, $64, $00, $02
DATA_1A9C52:         db $01, $FA, $62, $00, $02
DATA_1A9C57:         db $01, $FA, $62, $00, $00
DATA_1A9C5C:         db $00, $03, $64, $00, $02
DATA_1A9C61:         db $01, $FA, $62, $00, $02
DATA_1A9C66:         db $01, $FA, $62, $00, $00
DATA_1A9C6B:         db $00, $03, $64, $00, $02
DATA_1A9C70:         db $01, $F9, $62, $00, $02
DATA_1A9C75:         db $01, $F9, $62, $00, $00
DATA_1A9C7A:         db $00, $03, $64, $00, $02
DATA_1A9C7F:         db $01, $FB, $62, $00, $02
DATA_1A9C84:         db $01, $FB, $62, $00, $00
DATA_1A9C89:         db $00, $03, $64, $00, $02
DATA_1A9C8E:         db $00, $FA, $62, $40, $02
DATA_1A9C93:         db $00, $FA, $63, $40, $00
DATA_1A9C98:         db $00, $03, $64, $00, $02
DATA_1A9C9D:         db $00, $FA, $62, $40, $02
DATA_1A9CA2:         db $00, $FA, $63, $40, $00
DATA_1A9CA7:         db $00, $03, $64, $00, $02
DATA_1A9CAC:         db $01, $FB, $62, $00, $02
DATA_1A9CB1:         db $01, $FB, $62, $00, $00
DATA_1A9CB6:         db $00, $03, $64, $00, $02
DATA_1A9CBB:         db $00, $00, $62, $00, $02
DATA_1A9CC0:         db $00, $00, $62, $00, $00
DATA_1A9CC5:         db $00, $00, $62, $00, $00
DATA_1A9CCA:         db $00, $00, $64, $00, $02
DATA_1A9CCF:         db $00, $00, $64, $00, $00
DATA_1A9CD4:         db $00, $00, $64, $00, $00
DATA_1A9CD9:         db $00, $F3, $62, $00, $02
DATA_1A9CDE:         db $00, $F3, $62, $00, $00
DATA_1A9CE3:         db $00, $03, $64, $00, $02
DATA_1A9CE8:         db $00, $F3, $62, $00, $02
DATA_1A9CED:         db $00, $F3, $62, $00, $00
DATA_1A9CF2:         db $00, $03, $64, $00, $02
DATA_1A9CF7:         db $00, $F3, $62, $00, $02
DATA_1A9CFC:         db $00, $F3, $62, $00, $00
DATA_1A9D01:         db $00, $03, $64, $00, $02
DATA_1A9D06:         db $00, $F4, $62, $00, $02
DATA_1A9D0B:         db $00, $04, $64, $00, $02
DATA_1A9D10:         db $00, $04, $64, $00, $00
DATA_1A9D15:         db $00, $04, $64, $00, $02
DATA_1A9D1A:         db $00, $F4, $62, $00, $02
DATA_1A9D1F:         db $00, $F4, $62, $00, $00
DATA_1A9D24:         db $00, $04, $64, $00, $02
DATA_1A9D29:         db $00, $F4, $62, $00, $02
DATA_1A9D2E:         db $00, $F4, $62, $00, $00
DATA_1A9D33:         db $00, $FB, $62, $00, $02
DATA_1A9D38:         db $00, $04, $64, $00, $02
DATA_1A9D3D:         db $00, $04, $64, $00, $00
DATA_1A9D42:         db $00, $FB, $62, $00, $02
DATA_1A9D47:         db $00, $04, $64, $00, $02
DATA_1A9D4C:         db $00, $04, $64, $00, $00
DATA_1A9D51:         db $00, $F9, $62, $00, $02
DATA_1A9D56:         db $00, $04, $64, $00, $02
DATA_1A9D5B:         db $00, $04, $64, $00, $00
DATA_1A9D60:         db $00, $FB, $62, $00, $02
DATA_1A9D65:         db $00, $04, $64, $00, $02
DATA_1A9D6A:         db $00, $04, $64, $00, $00
DATA_1A9D6F:         db $00, $F3, $62, $00, $02
DATA_1A9D74:         db $00, $03, $64, $00, $02
DATA_1A9D79:         db $00, $03, $64, $00, $00
DATA_1A9D7E:         db $00, $FB, $62, $00, $02
DATA_1A9D83:         db $00, $03, $64, $00, $02
DATA_1A9D88:         db $00, $03, $64, $00, $00
DATA_1A9D8D:         db $00, $FB, $62, $00, $02
DATA_1A9D92:         db $00, $03, $64, $00, $02
DATA_1A9D97:         db $00, $03, $64, $00, $00
DATA_1A9D9C:         db $00, $FB, $62, $00, $02
DATA_1A9DA1:         db $00, $03, $64, $00, $02
DATA_1A9DA6:         db $00, $03, $64, $00, $00
DATA_1A9DAB:         db $00, $FB, $62, $00, $02
DATA_1A9DB0:         db $00, $03, $64, $00, $02
DATA_1A9DB5:         db $00, $03, $64, $00, $00
DATA_1A9DBA:         db $00, $FB, $62, $00, $02
DATA_1A9DBF:         db $00, $03, $64, $00, $02
DATA_1A9DC4:         db $00, $03, $64, $00, $00
DATA_1A9DC9:         db $00, $FB, $62, $00, $02
DATA_1A9DCE:         db $00, $03, $64, $00, $02
DATA_1A9DD3:         db $00, $03, $64, $00, $00
DATA_1A9DD8:         db $00, $FB, $62, $00, $02
DATA_1A9DDD:         db $00, $03, $64, $00, $02
DATA_1A9DE2:         db $00, $03, $64, $00, $00
DATA_1A9DE7:         db $00, $FB, $62, $00, $02
DATA_1A9DEC:         db $00, $03, $64, $00, $02
DATA_1A9DF1:         db $00, $03, $64, $00, $00
DATA_1A9DF6:         db $FB, $FE, $62, $00, $02
DATA_1A9DFB:         db $00, $03, $64, $00, $02
DATA_1A9E00:         db $00, $03, $64, $00, $00
DATA_1A9E05:         db $FE, $01, $62, $00, $02
DATA_1A9E0A:         db $00, $00, $64, $00, $02
DATA_1A9E0F:         db $00, $00, $64, $00, $00
DATA_1A9E14:         db $00, $0D, $62, $00, $02
DATA_1A9E19:         db $00, $FD, $64, $00, $02
DATA_1A9E1E:         db $00, $FD, $64, $00, $00
DATA_1A9E23:         db $00, $FA, $62, $00, $02
DATA_1A9E28:         db $00, $03, $64, $00, $02
DATA_1A9E2D:         db $00, $03, $64, $00, $00
DATA_1A9E32:         db $00, $FA, $62, $00, $02
DATA_1A9E37:         db $00, $03, $64, $00, $02
DATA_1A9E3C:         db $00, $03, $64, $00, $00
DATA_1A9E41:         db $00, $FA, $62, $00, $02
DATA_1A9E46:         db $00, $03, $64, $00, $02
DATA_1A9E4B:         db $00, $03, $64, $00, $00
DATA_1A9E50:         db $00, $FA, $62, $40, $02
DATA_1A9E55:         db $00, $03, $64, $00, $02
DATA_1A9E5A:         db $00, $03, $64, $00, $00
DATA_1A9E5F:         db $00, $FA, $62, $40, $02
DATA_1A9E64:         db $00, $03, $64, $00, $02
DATA_1A9E69:         db $00, $03, $64, $00, $00
DATA_1A9E6E:         db $00, $FA, $62, $40, $02
DATA_1A9E73:         db $00, $03, $64, $00, $02
DATA_1A9E78:         db $00, $03, $64, $00, $00
DATA_1A9E7D:         db $00, $F3, $62, $00, $02
DATA_1A9E82:         db $00, $03, $64, $00, $02
DATA_1A9E87:         db $00, $03, $64, $00, $00
DATA_1A9E8C:         db $00, $F3, $62, $00, $02
DATA_1A9E91:         db $00, $03, $64, $00, $02
DATA_1A9E96:         db $00, $03, $64, $00, $00
DATA_1A9E9B:         db $00, $F3, $62, $00, $02
DATA_1A9EA0:         db $00, $03, $64, $00, $02
DATA_1A9EA5:         db $00, $03, $64, $00, $00
DATA_1A9EAA:         db $00, $FC, $62, $00, $02
DATA_1A9EAF:         db $00, $03, $64, $00, $02
DATA_1A9EB4:         db $00, $03, $64, $00, $00
DATA_1A9EB9:         db $00, $FB, $62, $00, $02
DATA_1A9EBE:         db $00, $03, $64, $00, $02
DATA_1A9EC3:         db $00, $03, $64, $00, $00
DATA_1A9EC8:         db $00, $03, $A2, $02, $02
DATA_1A9ECD:         db $00, $FD, $62, $00, $02
DATA_1A9ED2:         db $00, $05, $64, $00, $00
DATA_1A9ED7:         db $08, $05, $65, $00, $00
DATA_1A9EDC:         db $00, $0D, $74, $00, $00
DATA_1A9EE1:         db $08, $0D, $75, $00, $00
DATA_1A9EE6:         db $FA, $FA, $9C, $02, $02
DATA_1A9EEB:         db $FA, $06, $7E, $C2, $02
DATA_1A9EF0:         db $05, $06, $7E, $82, $02
DATA_1A9EF5:         db $05, $FA, $7E, $02, $02
DATA_1A9EFA:         db $00, $FD, $62, $00, $02
DATA_1A9EFF:         db $00, $05, $64, $00, $02
DATA_1A9F04:         db $FA, $F5, $9C, $02, $02
DATA_1A9F09:         db $FB, $05, $7E, $C2, $02
DATA_1A9F0E:         db $05, $05, $7E, $82, $02
DATA_1A9F13:         db $06, $F5, $7E, $02, $02
DATA_1A9F18:         db $00, $FD, $62, $00, $02
DATA_1A9F1D:         db $00, $05, $64, $00, $02
DATA_1A9F22:         db $F8, $F8, $9C, $02, $02
DATA_1A9F27:         db $F8, $04, $7E, $C2, $02
DATA_1A9F2C:         db $08, $04, $7E, $82, $02
DATA_1A9F31:         db $08, $F8, $7E, $02, $02
DATA_1A9F36:         db $00, $FD, $62, $00, $02
DATA_1A9F3B:         db $00, $05, $64, $00, $02
DATA_1A9F40:         db $F9, $F7, $9C, $02, $02
DATA_1A9F45:         db $F9, $05, $7E, $C2, $02
DATA_1A9F4A:         db $07, $05, $7E, $82, $02
DATA_1A9F4F:         db $07, $F7, $7E, $02, $02
DATA_1A9F54:         db $00, $FD, $62, $00, $02
DATA_1A9F59:         db $00, $05, $64, $00, $02
DATA_1A9F5E:         db $FA, $F6, $9C, $02, $02
DATA_1A9F63:         db $FA, $06, $7E, $C2, $02
DATA_1A9F68:         db $06, $06, $7E, $82, $02
DATA_1A9F6D:         db $06, $F6, $7E, $02, $02
DATA_1A9F72:         db $00, $FD, $62, $00, $02
DATA_1A9F77:         db $00, $05, $64, $00, $02
DATA_1A9F7C:         db $F8, $F8, $9C, $02, $02
DATA_1A9F81:         db $F8, $04, $7E, $C2, $02
DATA_1A9F86:         db $08, $04, $7E, $82, $02
DATA_1A9F8B:         db $08, $F8, $7E, $02, $02
DATA_1A9F90:         db $00, $FD, $62, $00, $02
DATA_1A9F95:         db $00, $05, $64, $00, $02
DATA_1A9F9A:         db $08, $08, $7E, $82, $02
DATA_1A9F9F:         db $F8, $08, $7E, $C2, $02
DATA_1A9FA4:         db $08, $F8, $7E, $02, $02
DATA_1A9FA9:         db $F8, $F8, $9C, $02, $02
DATA_1A9FAE:         db $00, $09, $64, $00, $02
DATA_1A9FB3:         db $00, $F9, $62, $00, $02
DATA_1A9FB8:         db $F8, $08, $7E, $C2, $02
DATA_1A9FBD:         db $08, $08, $7E, $82, $02
DATA_1A9FC2:         db $08, $F8, $7E, $02, $02
DATA_1A9FC7:         db $F8, $F8, $9C, $02, $02
DATA_1A9FCC:         db $00, $09, $64, $00, $02
DATA_1A9FD1:         db $00, $F9, $62, $00, $02
DATA_1A9FD6:         db $08, $08, $7E, $82, $02
DATA_1A9FDB:         db $F8, $08, $7E, $C2, $02
DATA_1A9FE0:         db $08, $F8, $7E, $02, $02
DATA_1A9FE5:         db $F8, $F8, $9C, $02, $02
DATA_1A9FEA:         db $00, $09, $64, $00, $02
DATA_1A9FEF:         db $00, $F9, $62, $00, $02
DATA_1A9FF4:         db $F8, $F8, $00, $00, $02
DATA_1A9FF9:         db $08, $F8, $00, $00, $02
DATA_1A9FFE:         db $F8, $08, $00, $00, $02
DATA_1AA003:         db $08, $08, $00, $00, $02
DATA_1AA008:         db $04, $00, $0A, $00, $00
DATA_1AA00D:         db $00, $08, $1A, $00, $00
DATA_1AA012:         db $08, $08, $1A, $40, $00
DATA_1AA017:         db $00, $00, $08, $00, $00
DATA_1AA01C:         db $08, $00, $09, $00, $00
DATA_1AA021:         db $00, $08, $18, $00, $00
DATA_1AA026:         db $08, $08, $19, $00, $00
DATA_1AA02B:         db $00, $00, $08, $00, $00
DATA_1AA030:         db $08, $00, $09, $00, $00
DATA_1AA035:         db $00, $08, $18, $00, $00
DATA_1AA03A:         db $00, $00, $C2, $00, $00
DATA_1AA03F:         db $08, $00, $C3, $00, $00
DATA_1AA044:         db $00, $08, $D2, $00, $00
DATA_1AA049:         db $08, $08, $D3, $00, $00
DATA_1AA04E:         db $F8, $F0, $80, $01, $02
DATA_1AA053:         db $08, $F0, $82, $01, $02
DATA_1AA058:         db $F8, $00, $A0, $01, $02
DATA_1AA05D:         db $08, $00, $A2, $01, $02
DATA_1AA062:         db $00, $F9, $08, $00, $02
DATA_1AA067:         db $00, $08, $0A, $00, $02
DATA_1AA06C:         db $00, $F8, $08, $00, $02
DATA_1AA071:         db $00, $08, $0C, $00, $02
DATA_1AA076:         db $00, $F9, $08, $00, $02
DATA_1AA07B:         db $00, $08, $0E, $00, $02
DATA_1AA080:         db $00, $F8, $08, $00, $02
DATA_1AA085:         db $00, $08, $0C, $00, $02
DATA_1AA08A:         db $F8, $F8, $00, $00, $02
DATA_1AA08F:         db $08, $F8, $00, $00, $02
DATA_1AA094:         db $F8, $08, $00, $00, $02
DATA_1AA099:         db $08, $08, $00, $00, $02
DATA_1AA09E:         db $F8, $F0, $00, $00, $02
DATA_1AA0A3:         db $08, $F0, $00, $00, $02
DATA_1AA0A8:         db $F8, $00, $00, $00, $02
DATA_1AA0AD:         db $08, $00, $00, $00, $02
DATA_1AA0B2:         db $F8, $F8, $08, $00, $00
DATA_1AA0B7:         db $F8, $00, $18, $00, $00
DATA_1AA0BC:         db $00, $F8, $09, $00, $00
DATA_1AA0C1:         db $00, $00, $19, $00, $00
DATA_1AA0C6:         db $00, $F8, $09, $00, $00
DATA_1AA0CB:         db $00, $F8, $09, $00, $00
DATA_1AA0D0:         db $08, $F8, $0A, $00, $02
DATA_1AA0D5:         db $F8, $08, $0C, $00, $02
DATA_1AA0DA:         db $08, $08, $0E, $00, $02
DATA_1AA0DF:         db $F8, $F8, $00, $00, $02
DATA_1AA0E4:         db $08, $F8, $00, $00, $02
DATA_1AA0E9:         db $F8, $08, $00, $00, $02
DATA_1AA0EE:         db $08, $08, $00, $00, $02
DATA_1AA0F3:         db $00, $F8, $09, $00, $00
DATA_1AA0F8:         db $00, $00, $19, $00, $00
DATA_1AA0FD:         db $08, $F8, $0A, $00, $02
DATA_1AA102:         db $F8, $08, $0C, $00, $02
DATA_1AA107:         db $08, $08, $0E, $00, $02
DATA_1AA10C:         db $00, $04, $02, $00, $00
DATA_1AA111:         db $08, $04, $02, $40, $00
DATA_1AA116:         db $00, $00, $00, $00, $02
DATA_1AA11B:         db $00, $00, $00, $00, $02
DATA_1AA120:         db $00, $00, $00, $00, $02
DATA_1AA125:         db $00, $00, $00, $00, $02
DATA_1AA12A:         db $00, $05, $02, $00, $00
DATA_1AA12F:         db $08, $04, $02, $40, $00
DATA_1AA134:         db $00, $00, $00, $00, $02
DATA_1AA139:         db $00, $00, $00, $00, $02
DATA_1AA13E:         db $00, $00, $00, $00, $02
DATA_1AA143:         db $00, $00, $00, $00, $02
DATA_1AA148:         db $00, $04, $02, $00, $00
DATA_1AA14D:         db $08, $04, $02, $40, $00
DATA_1AA152:         db $00, $00, $00, $00, $02
DATA_1AA157:         db $00, $00, $00, $00, $02
DATA_1AA15C:         db $00, $00, $00, $00, $02
DATA_1AA161:         db $00, $00, $00, $00, $02
DATA_1AA166:         db $00, $04, $02, $00, $00
DATA_1AA16B:         db $08, $05, $02, $40, $00
DATA_1AA170:         db $00, $00, $00, $00, $02
DATA_1AA175:         db $00, $00, $00, $00, $02
DATA_1AA17A:         db $00, $00, $00, $00, $02
DATA_1AA17F:         db $00, $00, $00, $00, $02
DATA_1AA184:         db $00, $00, $C0, $00, $00
DATA_1AA189:         db $08, $00, $C1, $00, $00
DATA_1AA18E:         db $00, $08, $D0, $00, $00
DATA_1AA193:         db $08, $08, $D1, $00, $00
DATA_1AA198:         db $F8, $F8, $00, $01, $02
DATA_1AA19D:         db $08, $F8, $00, $01, $02
DATA_1AA1A2:         db $F8, $08, $00, $01, $02
DATA_1AA1A7:         db $08, $08, $00, $01, $02
DATA_1AA1AC:         db $00, $00, $40, $00, $00
DATA_1AA1B1:         db $08, $00, $41, $00, $00
DATA_1AA1B6:         db $00, $08, $50, $00, $00
DATA_1AA1BB:         db $08, $08, $51, $00, $00
DATA_1AA1C0:         db $00, $00, $40, $00, $00
DATA_1AA1C5:         db $F8, $F8, $6A, $00, $02
DATA_1AA1CA:         db $08, $F8, $6A, $40, $02
DATA_1AA1CF:         db $F8, $08, $6A, $80, $02
DATA_1AA1D4:         db $08, $08, $6A, $C0, $02
DATA_1AA1D9:         db $F8, $F8, $6A, $00, $02
DATA_1AA1DE:         db $FB, $FB, $6A, $00, $02
DATA_1AA1E3:         db $05, $FB, $6A, $40, $02
DATA_1AA1E8:         db $FB, $05, $6A, $80, $02
DATA_1AA1ED:         db $05, $05, $6A, $C0, $02
DATA_1AA1F2:         db $FB, $FB, $6A, $00, $02
DATA_1AA1F7:         db $F8, $F8, $E3, $00, $02
DATA_1AA1FC:         db $08, $F8, $E3, $00, $02
DATA_1AA201:         db $F8, $08, $E3, $00, $02
DATA_1AA206:         db $08, $08, $E3, $00, $02
DATA_1AA20B:         db $00, $00, $E3, $00, $02
DATA_1AA210:         db $F8, $F8, $E5, $00, $02
DATA_1AA215:         db $08, $F8, $E5, $00, $02
DATA_1AA21A:         db $F8, $08, $E5, $00, $02
DATA_1AA21F:         db $08, $08, $E5, $00, $02
DATA_1AA224:         db $00, $00, $E3, $00, $02
DATA_1AA229:         db $F8, $F8, $E7, $00, $02
DATA_1AA22E:         db $08, $F8, $E7, $00, $02
DATA_1AA233:         db $F8, $08, $E7, $00, $02
DATA_1AA238:         db $08, $08, $E7, $00, $02
DATA_1AA23D:         db $00, $00, $E5, $00, $02
DATA_1AA242:         db $00, $00, $E7, $00, $02
DATA_1AA247:         db $00, $00, $E7, $00, $02
DATA_1AA24C:         db $00, $00, $E7, $00, $02
DATA_1AA251:         db $00, $00, $E7, $00, $02
DATA_1AA256:         db $00, $00, $E7, $00, $02
DATA_1AA25B:         db $00, $00, $00, $00, $02
DATA_1AA260:         db $00, $F8, $02, $00, $00
DATA_1AA265:         db $08, $F8, $03, $00, $00
DATA_1AA26A:         db $00, $00, $12, $00, $00
DATA_1AA26F:         db $08, $00, $13, $00, $00
DATA_1AA274:         db $F8, $F8, $C0, $01, $02
DATA_1AA279:         db $08, $F8, $C2, $01, $02
DATA_1AA27E:         db $F8, $08, $E0, $01, $02
DATA_1AA283:         db $08, $08, $E2, $01, $02
DATA_1AA288:         db $00, $00, $BD, $00, $00
DATA_1AA28D:         db $00, $00, $BD, $00, $00
DATA_1AA292:         db $00, $00, $BD, $00, $00
DATA_1AA297:         db $00, $00, $BD, $00, $00
DATA_1AA29C:         db $08, $E8, $00, $00, $02
DATA_1AA2A1:         db $18, $E8, $00, $00, $02
DATA_1AA2A6:         db $08, $F8, $00, $00, $02
DATA_1AA2AB:         db $18, $F8, $00, $00, $02
DATA_1AA2B0:         db $E8, $08, $00, $00, $02
DATA_1AA2B5:         db $F8, $08, $00, $00, $02
DATA_1AA2BA:         db $E8, $18, $00, $00, $02
DATA_1AA2BF:         db $F8, $18, $00, $00, $02
DATA_1AA2C4:         db $08, $08, $00, $00, $02
DATA_1AA2C9:         db $18, $08, $00, $00, $02
DATA_1AA2CE:         db $08, $18, $00, $00, $02
DATA_1AA2D3:         db $18, $18, $00, $00, $02
DATA_1AA2D8:         db $E8, $E8, $00, $00, $02
DATA_1AA2DD:         db $F8, $E8, $00, $00, $02
DATA_1AA2E2:         db $E8, $F8, $00, $00, $02
DATA_1AA2E7:         db $F8, $F8, $00, $00, $02
DATA_1AA2EC:         db $08, $E8, $00, $00, $02
DATA_1AA2F1:         db $18, $E8, $00, $00, $02
DATA_1AA2F6:         db $08, $F8, $00, $00, $02
DATA_1AA2FB:         db $18, $F8, $00, $00, $02
DATA_1AA300:         db $E8, $08, $00, $00, $02
DATA_1AA305:         db $F8, $08, $00, $00, $02
DATA_1AA30A:         db $E8, $18, $00, $00, $02
DATA_1AA30F:         db $F8, $18, $00, $00, $02
DATA_1AA314:         db $08, $08, $00, $00, $02
DATA_1AA319:         db $18, $08, $00, $00, $02
DATA_1AA31E:         db $08, $18, $00, $00, $02
DATA_1AA323:         db $18, $18, $00, $00, $02
DATA_1AA328:         db $00, $00, $BD, $00, $00
DATA_1AA32D:         db $00, $00, $BD, $00, $00
DATA_1AA332:         db $00, $00, $BD, $00, $00
DATA_1AA337:         db $00, $00, $BD, $00, $00
DATA_1AA33C:         db $00, $00, $05, $00, $03
DATA_1AA341:         db $00, $00, $07, $00, $03
DATA_1AA346:         db $00, $00, $00, $00, $00
DATA_1AA34B:         db $00, $00, $00, $00, $00
DATA_1AA350:         db $00, $00, $00, $00, $00
DATA_1AA355:         db $00, $00, $00, $00, $00
DATA_1AA35A:         db $00, $00, $00, $00, $00
DATA_1AA35F:         db $00, $00, $00, $00, $00
DATA_1AA364:         db $00, $00, $00, $00, $00
DATA_1AA369:         db $00, $00, $00, $00, $00
DATA_1AA36E:         db $00, $00, $00, $00, $00
DATA_1AA373:         db $00, $00, $00, $00, $00
DATA_1AA378:         db $00, $00, $00, $00, $00
DATA_1AA37D:         db $00, $00, $00, $00, $00
DATA_1AA382:         db $00, $00, $00, $00, $00
DATA_1AA387:         db $00, $00, $00, $00, $00
DATA_1AA38C:         db $E8, $E8, $00, $00, $42
DATA_1AA391:         db $F8, $E8, $00, $00, $42
DATA_1AA396:         db $E8, $F8, $00, $00, $42
DATA_1AA39B:         db $F8, $F8, $00, $00, $42
DATA_1AA3A0:         db $08, $E8, $00, $00, $42
DATA_1AA3A5:         db $18, $E8, $00, $00, $42
DATA_1AA3AA:         db $08, $F8, $00, $00, $42
DATA_1AA3AF:         db $18, $F8, $00, $00, $42
DATA_1AA3B4:         db $E8, $08, $00, $00, $42
DATA_1AA3B9:         db $F8, $08, $00, $00, $42
DATA_1AA3BE:         db $E8, $18, $00, $00, $42
DATA_1AA3C3:         db $F8, $18, $00, $00, $42
DATA_1AA3C8:         db $08, $08, $00, $00, $42
DATA_1AA3CD:         db $18, $08, $00, $00, $42
DATA_1AA3D2:         db $08, $18, $00, $00, $42
DATA_1AA3D7:         db $18, $18, $00, $00, $42
DATA_1AA3DC:         db $E8, $E8, $00, $00, $02
DATA_1AA3E1:         db $F8, $E8, $00, $00, $02
DATA_1AA3E6:         db $E8, $F8, $00, $00, $02
DATA_1AA3EB:         db $F8, $F8, $00, $00, $02
DATA_1AA3F0:         db $08, $E8, $00, $00, $02
DATA_1AA3F5:         db $18, $E8, $00, $00, $02
DATA_1AA3FA:         db $08, $F8, $00, $00, $02
DATA_1AA3FF:         db $18, $F8, $00, $00, $02
DATA_1AA404:         db $E8, $08, $00, $00, $02
DATA_1AA409:         db $F8, $08, $00, $00, $02
DATA_1AA40E:         db $E8, $18, $00, $00, $02
DATA_1AA413:         db $F8, $18, $00, $00, $02
DATA_1AA418:         db $08, $08, $00, $00, $02
DATA_1AA41D:         db $18, $08, $00, $00, $02
DATA_1AA422:         db $08, $18, $00, $00, $02
DATA_1AA427:         db $18, $18, $00, $00, $02
DATA_1AA42C:         db $E8, $01, $00, $00, $02
DATA_1AA431:         db $F8, $01, $02, $00, $02
DATA_1AA436:         db $08, $01, $02, $40, $02
DATA_1AA43B:         db $18, $01, $00, $40, $02
DATA_1AA440:         db $00, $00, $05, $00, $42
DATA_1AA445:         db $00, $00, $05, $00, $42
DATA_1AA44A:         db $00, $00, $05, $00, $42
DATA_1AA44F:         db $00, $00, $05, $00, $42
DATA_1AA454:         db $00, $00, $05, $00, $42
DATA_1AA459:         db $00, $00, $07, $00, $42
DATA_1AA45E:         db $00, $00, $05, $00, $42
DATA_1AA463:         db $00, $00, $05, $00, $42
DATA_1AA468:         db $00, $00, $05, $00, $42
DATA_1AA46D:         db $00, $00, $05, $00, $42
DATA_1AA472:         db $04, $00, $04, $00, $40
DATA_1AA477:         db $04, $00, $14, $00, $40
DATA_1AA47C:         db $08, $03, $0B, $00, $00
DATA_1AA481:         db $00, $03, $0A, $00, $00
DATA_1AA486:         db $02, $F4, $08, $00, $02
DATA_1AA48B:         db $05, $08, $1E, $00, $00
DATA_1AA490:         db $0E, $05, $1B, $40, $00
DATA_1AA495:         db $FD, $05, $1B, $00, $00
DATA_1AA49A:         db $08, $04, $0B, $00, $00
DATA_1AA49F:         db $00, $04, $0A, $00, $00
DATA_1AA4A4:         db $02, $F5, $08, $00, $02
DATA_1AA4A9:         db $00, $08, $1A, $00, $00
DATA_1AA4AE:         db $0A, $08, $1A, $40, $00
DATA_1AA4B3:         db $0A, $08, $1A, $40, $00
DATA_1AA4B8:         db $FE, $F8, $08, $00, $02
DATA_1AA4BD:         db $FE, $05, $1B, $00, $00
DATA_1AA4C2:         db $0B, $09, $1B, $40, $00
DATA_1AA4C7:         db $08, $05, $0B, $00, $00
DATA_1AA4CC:         db $00, $05, $0A, $00, $00
DATA_1AA4D1:         db $00, $05, $0A, $00, $00
DATA_1AA4D6:         db $FE, $F9, $08, $00, $02
DATA_1AA4DB:         db $00, $07, $1A, $00, $00
DATA_1AA4E0:         db $0D, $08, $1B, $00, $00
DATA_1AA4E5:         db $08, $04, $0B, $00, $00
DATA_1AA4EA:         db $00, $04, $0A, $00, $00
DATA_1AA4EF:         db $00, $04, $0A, $00, $00
DATA_1AA4F4:         db $FE, $FA, $08, $00, $02
DATA_1AA4F9:         db $0A, $07, $1B, $00, $00
DATA_1AA4FE:         db $03, $08, $1E, $00, $00
DATA_1AA503:         db $08, $05, $0B, $00, $00
DATA_1AA508:         db $00, $05, $0A, $00, $00
DATA_1AA50D:         db $00, $05, $0A, $00, $00
DATA_1AA512:         db $FD, $F9, $08, $00, $02
DATA_1AA517:         db $06, $07, $1B, $40, $00
DATA_1AA51C:         db $04, $08, $1E, $00, $00
DATA_1AA521:         db $08, $05, $0B, $00, $00
DATA_1AA526:         db $00, $05, $0A, $00, $00
DATA_1AA52B:         db $00, $05, $0A, $00, $00
DATA_1AA530:         db $FE, $F8, $08, $00, $02
DATA_1AA535:         db $03, $09, $1A, $80, $00
DATA_1AA53A:         db $08, $08, $1E, $00, $00
DATA_1AA53F:         db $08, $06, $0B, $00, $00
DATA_1AA544:         db $00, $06, $0A, $00, $00
DATA_1AA549:         db $00, $06, $0A, $00, $00
DATA_1AA54E:         db $FE, $F7, $08, $00, $02
DATA_1AA553:         db $01, $07, $1A, $00, $00
DATA_1AA558:         db $0A, $08, $1A, $40, $00
DATA_1AA55D:         db $08, $06, $0B, $00, $00
DATA_1AA562:         db $00, $06, $0A, $00, $00
DATA_1AA567:         db $00, $06, $0A, $00, $00
DATA_1AA56C:         db $00, $F5, $08, $00, $02
DATA_1AA571:         db $FE, $05, $1B, $00, $00
DATA_1AA576:         db $0A, $09, $1B, $40, $00
DATA_1AA57B:         db $08, $04, $0B, $00, $00
DATA_1AA580:         db $00, $04, $0A, $00, $00
DATA_1AA585:         db $00, $04, $0A, $00, $00
DATA_1AA58A:         db $00, $F6, $08, $00, $02
DATA_1AA58F:         db $00, $08, $1E, $00, $00
DATA_1AA594:         db $0B, $08, $1E, $00, $00
DATA_1AA599:         db $08, $05, $0B, $00, $00
DATA_1AA59E:         db $00, $05, $0A, $00, $00
DATA_1AA5A3:         db $00, $05, $0A, $00, $00
DATA_1AA5A8:         db $FF, $F6, $08, $40, $02
DATA_1AA5AD:         db $00, $08, $1E, $00, $00
DATA_1AA5B2:         db $0B, $08, $1E, $00, $00
DATA_1AA5B7:         db $08, $05, $0B, $00, $00
DATA_1AA5BC:         db $00, $05, $0A, $00, $00
DATA_1AA5C1:         db $00, $05, $0A, $00, $00
DATA_1AA5C6:         db $FF, $F6, $08, $00, $02
DATA_1AA5CB:         db $00, $08, $1E, $00, $00
DATA_1AA5D0:         db $0B, $08, $1E, $00, $00
DATA_1AA5D5:         db $08, $05, $0B, $00, $00
DATA_1AA5DA:         db $00, $05, $0A, $00, $00
DATA_1AA5DF:         db $00, $05, $0A, $00, $00
DATA_1AA5E4:         db $FE, $F7, $08, $00, $02
DATA_1AA5E9:         db $00, $08, $1E, $00, $00
DATA_1AA5EE:         db $0B, $08, $1E, $00, $00
DATA_1AA5F3:         db $08, $05, $0B, $00, $00
DATA_1AA5F8:         db $00, $05, $0A, $00, $00
DATA_1AA5FD:         db $00, $05, $0A, $00, $00
DATA_1AA602:         db $FE, $F7, $08, $00, $02
DATA_1AA607:         db $00, $08, $1E, $00, $00
DATA_1AA60C:         db $0D, $08, $1E, $00, $00
DATA_1AA611:         db $09, $05, $0B, $00, $00
DATA_1AA616:         db $01, $05, $0A, $00, $00
DATA_1AA61B:         db $01, $05, $0A, $00, $00
DATA_1AA620:         db $FE, $F7, $08, $00, $02
DATA_1AA625:         db $00, $08, $1E, $00, $00
DATA_1AA62A:         db $0F, $08, $1E, $00, $00
DATA_1AA62F:         db $09, $05, $0B, $00, $00
DATA_1AA634:         db $01, $05, $0A, $00, $00
DATA_1AA639:         db $01, $05, $0A, $00, $00
DATA_1AA63E:         db $00, $F7, $08, $00, $02
DATA_1AA643:         db $00, $08, $1E, $00, $00
DATA_1AA648:         db $0F, $08, $1E, $00, $00
DATA_1AA64D:         db $0A, $05, $0B, $00, $00
DATA_1AA652:         db $02, $05, $0A, $00, $00
DATA_1AA657:         db $02, $05, $0A, $00, $00
DATA_1AA65C:         db $01, $F7, $08, $00, $02
DATA_1AA661:         db $00, $08, $1E, $00, $00
DATA_1AA666:         db $0F, $08, $1E, $00, $00
DATA_1AA66B:         db $0B, $05, $0B, $00, $00
DATA_1AA670:         db $03, $05, $0A, $00, $00
DATA_1AA675:         db $03, $05, $0A, $00, $00
DATA_1AA67A:         db $01, $F7, $08, $00, $02
DATA_1AA67F:         db $03, $08, $1E, $00, $00
DATA_1AA684:         db $0F, $08, $1E, $00, $00
DATA_1AA689:         db $0B, $05, $0B, $00, $00
DATA_1AA68E:         db $03, $05, $0A, $00, $00
DATA_1AA693:         db $03, $05, $0A, $00, $00
DATA_1AA698:         db $02, $09, $1B, $00, $00
DATA_1AA69D:         db $FE, $09, $1B, $00, $00
DATA_1AA6A2:         db $FD, $FD, $08, $00, $02
DATA_1AA6A7:         db $06, $08, $0B, $00, $00
DATA_1AA6AC:         db $00, $08, $0A, $00, $00
DATA_1AA6B1:         db $00, $08, $0A, $00, $00
DATA_1AA6B6:         db $01, $09, $1B, $00, $00
DATA_1AA6BB:         db $FD, $09, $1B, $00, $00
DATA_1AA6C0:         db $FD, $FC, $08, $00, $02
DATA_1AA6C5:         db $07, $08, $0B, $00, $00
DATA_1AA6CA:         db $00, $08, $0A, $00, $00
DATA_1AA6CF:         db $00, $08, $0A, $00, $00
DATA_1AA6D4:         db $01, $09, $1B, $00, $00
DATA_1AA6D9:         db $FC, $09, $1B, $00, $00
DATA_1AA6DE:         db $FE, $FB, $08, $00, $02
DATA_1AA6E3:         db $08, $08, $0B, $00, $00
DATA_1AA6E8:         db $00, $08, $0A, $00, $00
DATA_1AA6ED:         db $00, $08, $0A, $00, $00
DATA_1AA6F2:         db $01, $09, $1B, $00, $00
DATA_1AA6F7:         db $FC, $09, $1B, $00, $00
DATA_1AA6FC:         db $FF, $FA, $08, $00, $02
DATA_1AA701:         db $08, $08, $0B, $00, $00
DATA_1AA706:         db $00, $08, $0A, $00, $00
DATA_1AA70B:         db $00, $08, $0A, $00, $00
DATA_1AA710:         db $01, $09, $1B, $00, $00
DATA_1AA715:         db $FC, $09, $1B, $00, $00
DATA_1AA71A:         db $FF, $FA, $08, $40, $02
DATA_1AA71F:         db $08, $08, $0B, $00, $00
DATA_1AA724:         db $00, $08, $0A, $00, $00
DATA_1AA729:         db $00, $08, $0A, $00, $00
DATA_1AA72E:         db $09, $08, $1B, $40, $00
DATA_1AA733:         db $04, $08, $1B, $40, $00
DATA_1AA738:         db $08, $01, $0B, $00, $00
DATA_1AA73D:         db $00, $01, $0A, $00, $00
DATA_1AA742:         db $02, $F2, $08, $00, $02
DATA_1AA747:         db $02, $F2, $08, $00, $02
DATA_1AA74C:         db $00, $F3, $08, $00, $02
DATA_1AA751:         db $08, $08, $1A, $80, $00
DATA_1AA756:         db $03, $08, $1A, $80, $00
DATA_1AA75B:         db $08, $01, $0B, $00, $00
DATA_1AA760:         db $00, $01, $0A, $00, $00
DATA_1AA765:         db $00, $01, $0A, $00, $00
DATA_1AA76A:         db $05, $0B, $1E, $00, $00
DATA_1AA76F:         db $00, $0B, $1E, $00, $00
DATA_1AA774:         db $FF, $FC, $08, $00, $02
DATA_1AA779:         db $08, $09, $0B, $00, $00
DATA_1AA77E:         db $00, $09, $0A, $00, $00
DATA_1AA783:         db $00, $09, $0A, $00, $00
DATA_1AA788:         db $04, $0A, $1A, $00, $00
DATA_1AA78D:         db $FF, $0A, $1A, $00, $00
DATA_1AA792:         db $FF, $FC, $08, $00, $02
DATA_1AA797:         db $08, $09, $0B, $00, $00
DATA_1AA79C:         db $00, $09, $0A, $00, $00
DATA_1AA7A1:         db $00, $09, $0A, $00, $00
DATA_1AA7A6:         db $03, $09, $1B, $00, $00
DATA_1AA7AB:         db $FE, $09, $1B, $00, $00
DATA_1AA7B0:         db $FF, $FC, $08, $00, $02
DATA_1AA7B5:         db $08, $09, $0B, $00, $00
DATA_1AA7BA:         db $00, $09, $0A, $00, $00
DATA_1AA7BF:         db $00, $09, $0A, $00, $00
DATA_1AA7C4:         db $FE, $FC, $08, $00, $02
DATA_1AA7C9:         db $00, $08, $1E, $00, $00
DATA_1AA7CE:         db $0B, $08, $1E, $00, $00
DATA_1AA7D3:         db $08, $08, $0B, $00, $00
DATA_1AA7D8:         db $00, $08, $0A, $00, $00
DATA_1AA7DD:         db $00, $08, $0A, $00, $00
DATA_1AA7E2:         db $FE, $FA, $08, $00, $02
DATA_1AA7E7:         db $00, $08, $1E, $00, $00
DATA_1AA7EC:         db $0B, $08, $1E, $00, $00
DATA_1AA7F1:         db $08, $07, $0B, $00, $00
DATA_1AA7F6:         db $00, $07, $0A, $00, $00
DATA_1AA7FB:         db $00, $07, $0A, $00, $00
DATA_1AA800:         db $00, $08, $1E, $20, $00
DATA_1AA805:         db $0B, $08, $1E, $20, $00
DATA_1AA80A:         db $08, $05, $0B, $20, $00
DATA_1AA80F:         db $00, $05, $0A, $20, $00
DATA_1AA814:         db $00, $F6, $08, $00, $02
DATA_1AA819:         db $00, $F6, $08, $00, $02
DATA_1AA81E:         db $00, $08, $1E, $20, $00
DATA_1AA823:         db $0B, $08, $1E, $20, $00
DATA_1AA828:         db $08, $05, $0B, $20, $00
DATA_1AA82D:         db $00, $05, $0A, $20, $00
DATA_1AA832:         db $FF, $F6, $08, $40, $02
DATA_1AA837:         db $FF, $F6, $08, $40, $02
DATA_1AA83C:         db $04, $08, $1E, $20, $00
DATA_1AA841:         db $0F, $08, $1E, $20, $00
DATA_1AA846:         db $0C, $05, $0B, $20, $00
DATA_1AA84B:         db $04, $05, $0A, $20, $00
DATA_1AA850:         db $04, $F6, $08, $20, $02
DATA_1AA855:         db $04, $F6, $08, $20, $02
DATA_1AA85A:         db $F8, $F0, $00, $00, $02
DATA_1AA85F:         db $08, $F0, $00, $00, $02
DATA_1AA864:         db $F8, $00, $00, $00, $02
DATA_1AA869:         db $08, $00, $00, $00, $02
DATA_1AA86E:         db $F8, $E4, $3E, $00, $00
DATA_1AA873:         db $00, $E4, $3F, $00, $00
DATA_1AA878:         db $08, $E4, $3F, $40, $00
DATA_1AA87D:         db $10, $E4, $3E, $40, $00
DATA_1AA882:         db $F8, $08, $3E, $00, $00
DATA_1AA887:         db $00, $08, $3F, $00, $00
DATA_1AA88C:         db $08, $08, $3F, $40, $00
DATA_1AA891:         db $10, $08, $3E, $40, $00
DATA_1AA896:         db $F8, $EA, $00, $02, $02
DATA_1AA89B:         db $08, $EA, $00, $02, $02
DATA_1AA8A0:         db $F8, $FA, $00, $02, $02
DATA_1AA8A5:         db $08, $FA, $00, $02, $02
DATA_1AA8AA:         db $F0, $00, $28, $00, $02
DATA_1AA8AF:         db $00, $00, $29, $00, $02
DATA_1AA8B4:         db $10, $00, $2A, $00, $02
DATA_1AA8B9:         db $F8, $F8, $C4, $01, $02
DATA_1AA8BE:         db $08, $F8, $C6, $01, $02
DATA_1AA8C3:         db $F8, $08, $E4, $01, $02
DATA_1AA8C8:         db $08, $08, $E6, $01, $02
DATA_1AA8CD:         db $F8, $F8, $C4, $01, $02
DATA_1AA8D2:         db $08, $F8, $C6, $01, $02
DATA_1AA8D7:         db $F8, $08, $E4, $01, $02
DATA_1AA8DC:         db $08, $08, $E6, $01, $02
DATA_1AA8E1:         db $F8, $F8, $C4, $01, $02
DATA_1AA8E6:         db $08, $F8, $C6, $01, $02
DATA_1AA8EB:         db $F8, $08, $E4, $01, $02
DATA_1AA8F0:         db $08, $08, $E6, $01, $02
DATA_1AA8F5:         db $F8, $F8, $C0, $01, $02
DATA_1AA8FA:         db $08, $F8, $C2, $01, $02
DATA_1AA8FF:         db $F8, $08, $E0, $01, $02
DATA_1AA904:         db $08, $08, $E2, $01, $02
DATA_1AA909:         db $00, $F8, $00, $00, $02
DATA_1AA90E:         db $00, $08, $04, $00, $00
DATA_1AA913:         db $08, $08, $05, $00, $00
DATA_1AA918:         db $00, $F8, $02, $00, $02
DATA_1AA91D:         db $00, $08, $14, $00, $00
DATA_1AA922:         db $08, $08, $15, $00, $00
DATA_1AA927:         db $00, $00, $06, $00, $02
DATA_1AA92C:         db $00, $00, $06, $00, $02
DATA_1AA931:         db $00, $00, $06, $00, $02
DATA_1AA936:         db $00, $00, $08, $00, $02
DATA_1AA93B:         db $00, $00, $08, $00, $02
DATA_1AA940:         db $00, $00, $08, $00, $02
DATA_1AA945:         db $F8, $00, $42, $04, $02
DATA_1AA94A:         db $08, $00, $42, $44, $02
DATA_1AA94F:         db $F8, $00, $42, $04, $02
DATA_1AA954:         db $08, $00, $42, $44, $02
DATA_1AA959:         db $08, $00, $42, $44, $02
DATA_1AA95E:         db $F8, $08, $42, $04, $00
DATA_1AA963:         db $00, $08, $43, $04, $00
DATA_1AA968:         db $10, $08, $42, $44, $00
DATA_1AA96D:         db $08, $08, $43, $44, $00
DATA_1AA972:         db $08, $08, $43, $44, $00
DATA_1AA977:         db $FC, $08, $55, $00, $00
DATA_1AA97C:         db $00, $08, $55, $00, $00
DATA_1AA981:         db $04, $08, $55, $40, $00
DATA_1AA986:         db $08, $08, $55, $40, $00
DATA_1AA98B:         db $0C, $08, $55, $40, $00
DATA_1AA990:         db $F7, $08, $55, $00, $00
DATA_1AA995:         db $FE, $07, $55, $00, $00
DATA_1AA99A:         db $0A, $07, $55, $00, $00
DATA_1AA99F:         db $11, $08, $55, $00, $00
DATA_1AA9A4:         db $11, $08, $55, $00, $00
DATA_1AA9A9:         db $F2, $08, $45, $00, $00
DATA_1AA9AE:         db $FC, $05, $45, $00, $00
DATA_1AA9B3:         db $0C, $05, $45, $00, $00
DATA_1AA9B8:         db $16, $08, $45, $00, $00
DATA_1AA9BD:         db $16, $08, $45, $00, $00
DATA_1AA9C2:         db $F0, $08, $45, $00, $00
DATA_1AA9C7:         db $FA, $03, $45, $00, $00
DATA_1AA9CC:         db $0E, $03, $45, $00, $00
DATA_1AA9D1:         db $18, $08, $45, $00, $00
DATA_1AA9D6:         db $18, $08, $45, $00, $00
DATA_1AA9DB:         db $EE, $08, $54, $00, $00
DATA_1AA9E0:         db $F9, $02, $54, $00, $00
DATA_1AA9E5:         db $0F, $02, $54, $00, $00
DATA_1AA9EA:         db $1A, $08, $54, $00, $00
DATA_1AA9EF:         db $1A, $08, $54, $00, $00
DATA_1AA9F4:         db $EC, $08, $54, $00, $00
DATA_1AA9F9:         db $F8, $01, $54, $00, $00
DATA_1AA9FE:         db $10, $01, $54, $00, $00
DATA_1AAA03:         db $1C, $08, $54, $00, $00
DATA_1AAA08:         db $1C, $08, $54, $00, $00
DATA_1AAA0D:         db $EA, $08, $54, $00, $00
DATA_1AAA12:         db $F7, $01, $54, $00, $00
DATA_1AAA17:         db $11, $01, $54, $00, $00
DATA_1AAA1C:         db $1E, $08, $54, $00, $00
DATA_1AAA21:         db $1E, $08, $54, $00, $00
DATA_1AAA26:         db $E8, $08, $44, $00, $00
DATA_1AAA2B:         db $F6, $00, $44, $00, $00
DATA_1AAA30:         db $12, $00, $44, $00, $00
DATA_1AAA35:         db $20, $08, $44, $00, $00
DATA_1AAA3A:         db $20, $08, $44, $00, $00
DATA_1AAA3F:         db $E6, $08, $44, $00, $00
DATA_1AAA44:         db $F5, $FF, $44, $00, $00
DATA_1AAA49:         db $13, $FF, $44, $00, $00
DATA_1AAA4E:         db $22, $08, $44, $00, $00
DATA_1AAA53:         db $22, $08, $44, $00, $00
DATA_1AAA58:         db $E4, $08, $E1, $00, $00
DATA_1AAA5D:         db $F4, $FF, $E1, $00, $00
DATA_1AAA62:         db $14, $FF, $E1, $00, $00
DATA_1AAA67:         db $24, $08, $E1, $00, $00
DATA_1AAA6C:         db $24, $08, $E1, $00, $00
DATA_1AAA71:         db $00, $00, $E2, $00, $00
DATA_1AAA76:         db $00, $00, $E2, $00, $00
DATA_1AAA7B:         db $00, $00, $E2, $00, $00
DATA_1AAA80:         db $00, $00, $F1, $00, $00
DATA_1AAA85:         db $00, $00, $F1, $00, $00
DATA_1AAA8A:         db $05, $FF, $E2, $00, $00
DATA_1AAA8F:         db $00, $00, $E1, $00, $00
DATA_1AAA94:         db $05, $FF, $F1, $00, $00
DATA_1AAA99:         db $0A, $FE, $E2, $00, $00
DATA_1AAA9E:         db $05, $FF, $E1, $00, $00
DATA_1AAAA3:         db $05, $FF, $E1, $00, $00
DATA_1AAAA8:         db $0A, $FE, $F1, $00, $00
DATA_1AAAAD:         db $0A, $FE, $E1, $00, $00
DATA_1AAAB2:         db $0A, $FE, $E1, $00, $00
DATA_1AAAB7:         db $0A, $FE, $E1, $00, $00
DATA_1AAABC:         db $E0, $00, $66, $00, $00
DATA_1AAAC1:         db $E8, $00, $67, $00, $00
DATA_1AAAC6:         db $F0, $00, $67, $00, $00
DATA_1AAACB:         db $F8, $00, $67, $00, $00
DATA_1AAAD0:         db $00, $00, $67, $00, $00
DATA_1AAAD5:         db $08, $00, $67, $00, $00
DATA_1AAADA:         db $10, $00, $67, $00, $00
DATA_1AAADF:         db $18, $00, $66, $40, $00
DATA_1AAAE4:         db $F0, $F0, $6A, $00, $02
DATA_1AAAE9:         db $00, $F0, $6A, $40, $02
DATA_1AAAEE:         db $F0, $00, $6A, $80, $02
DATA_1AAAF3:         db $00, $00, $6A, $C0, $02
DATA_1AAAF8:         db $F0, $F0, $6A, $00, $02
DATA_1AAAFD:         db $00, $F0, $6A, $40, $02
DATA_1AAB02:         db $F0, $00, $6A, $80, $02
DATA_1AAB07:         db $00, $00, $6A, $C0, $02
DATA_1AAB0C:         db $F0, $F0, $6A, $00, $02
DATA_1AAB11:         db $00, $F0, $6A, $40, $02
DATA_1AAB16:         db $F0, $00, $6A, $80, $02
DATA_1AAB1B:         db $00, $00, $6A, $C0, $02
DATA_1AAB20:         db $F8, $F0, $55, $00, $00
DATA_1AAB25:         db $00, $F0, $55, $00, $00
DATA_1AAB2A:         db $F0, $F8, $55, $00, $00
DATA_1AAB2F:         db $F0, $00, $55, $00, $00
DATA_1AAB34:         db $F8, $08, $55, $00, $00
DATA_1AAB39:         db $00, $08, $55, $00, $00
DATA_1AAB3E:         db $08, $00, $55, $00, $00
DATA_1AAB43:         db $08, $F8, $55, $00, $00
DATA_1AAB48:         db $F3, $F3, $55, $00, $00
DATA_1AAB4D:         db $05, $F3, $55, $00, $00
DATA_1AAB52:         db $F3, $05, $55, $00, $00
DATA_1AAB57:         db $05, $05, $55, $00, $00
DATA_1AAB5C:         db $F7, $EC, $55, $00, $00
DATA_1AAB61:         db $01, $EC, $55, $00, $00
DATA_1AAB66:         db $EC, $F7, $55, $00, $00
DATA_1AAB6B:         db $EC, $01, $55, $00, $00
DATA_1AAB70:         db $F7, $0C, $55, $00, $00
DATA_1AAB75:         db $01, $0C, $55, $00, $00
DATA_1AAB7A:         db $0C, $01, $55, $00, $00
DATA_1AAB7F:         db $0C, $F7, $55, $00, $00
DATA_1AAB84:         db $EF, $EF, $55, $00, $00
DATA_1AAB89:         db $09, $EF, $55, $00, $00
DATA_1AAB8E:         db $EF, $09, $55, $00, $00
DATA_1AAB93:         db $09, $09, $55, $00, $00
DATA_1AAB98:         db $F6, $E8, $45, $00, $00
DATA_1AAB9D:         db $02, $E8, $45, $00, $00
DATA_1AABA2:         db $E8, $F6, $45, $00, $00
DATA_1AABA7:         db $E8, $02, $45, $00, $00
DATA_1AABAC:         db $F6, $10, $45, $00, $00
DATA_1AABB1:         db $02, $10, $45, $00, $00
DATA_1AABB6:         db $10, $02, $45, $00, $00
DATA_1AABBB:         db $10, $F6, $45, $00, $00
DATA_1AABC0:         db $EC, $EC, $45, $00, $00
DATA_1AABC5:         db $0C, $EC, $45, $00, $00
DATA_1AABCA:         db $EC, $0C, $45, $00, $00
DATA_1AABCF:         db $0C, $0C, $45, $00, $00
DATA_1AABD4:         db $F5, $E4, $45, $00, $00
DATA_1AABD9:         db $03, $E4, $45, $00, $00
DATA_1AABDE:         db $E4, $F5, $45, $00, $00
DATA_1AABE3:         db $E4, $03, $45, $00, $00
DATA_1AABE8:         db $F5, $14, $45, $00, $00
DATA_1AABED:         db $03, $14, $45, $00, $00
DATA_1AABF2:         db $14, $03, $45, $00, $00
DATA_1AABF7:         db $14, $F5, $45, $00, $00
DATA_1AABFC:         db $E9, $E9, $45, $00, $00
DATA_1AAC01:         db $0F, $E9, $45, $00, $00
DATA_1AAC06:         db $E9, $0F, $45, $00, $00
DATA_1AAC0B:         db $0F, $0F, $45, $00, $00
DATA_1AAC10:         db $F4, $E1, $54, $00, $00
DATA_1AAC15:         db $04, $E1, $54, $00, $00
DATA_1AAC1A:         db $E0, $F5, $54, $00, $00
DATA_1AAC1F:         db $E0, $05, $54, $00, $00
DATA_1AAC24:         db $F4, $19, $54, $00, $00
DATA_1AAC29:         db $04, $19, $54, $00, $00
DATA_1AAC2E:         db $18, $05, $54, $00, $00
DATA_1AAC33:         db $18, $F5, $54, $00, $00
DATA_1AAC38:         db $E7, $E8, $54, $00, $00
DATA_1AAC3D:         db $11, $E8, $54, $00, $00
DATA_1AAC42:         db $E7, $12, $54, $00, $00
DATA_1AAC47:         db $11, $12, $54, $00, $00
DATA_1AAC4C:         db $F3, $DF, $54, $00, $00
DATA_1AAC51:         db $05, $DF, $54, $00, $00
DATA_1AAC56:         db $DD, $F5, $54, $00, $00
DATA_1AAC5B:         db $DD, $07, $54, $00, $00
DATA_1AAC60:         db $F3, $1D, $54, $00, $00
DATA_1AAC65:         db $05, $1D, $54, $00, $00
DATA_1AAC6A:         db $1B, $07, $54, $00, $00
DATA_1AAC6F:         db $1B, $F5, $54, $00, $00
DATA_1AAC74:         db $E5, $E7, $54, $00, $00
DATA_1AAC79:         db $13, $E7, $54, $00, $00
DATA_1AAC7E:         db $E5, $15, $54, $00, $00
DATA_1AAC83:         db $13, $15, $54, $00, $00
DATA_1AAC88:         db $F2, $DD, $44, $00, $00
DATA_1AAC8D:         db $06, $DD, $44, $00, $00
DATA_1AAC92:         db $DA, $F5, $44, $00, $00
DATA_1AAC97:         db $DA, $09, $44, $00, $00
DATA_1AAC9C:         db $F2, $21, $44, $00, $00
DATA_1AACA1:         db $06, $21, $44, $00, $00
DATA_1AACA6:         db $1E, $09, $44, $00, $00
DATA_1AACAB:         db $1E, $F5, $44, $00, $00
DATA_1AACB0:         db $E6, $E6, $44, $00, $00
DATA_1AACB5:         db $15, $E6, $44, $00, $00
DATA_1AACBA:         db $E6, $18, $44, $00, $00
DATA_1AACBF:         db $15, $18, $44, $00, $00
DATA_1AACC4:         db $F1, $DE, $44, $00, $00
DATA_1AACC9:         db $07, $DE, $44, $00, $00
DATA_1AACCE:         db $D9, $F6, $44, $00, $00
DATA_1AACD3:         db $D9, $0C, $44, $00, $00
DATA_1AACD8:         db $F1, $24, $44, $00, $00
DATA_1AACDD:         db $07, $24, $44, $00, $00
DATA_1AACE2:         db $1F, $0C, $44, $00, $00
DATA_1AACE7:         db $1F, $F6, $44, $00, $00
DATA_1AACEC:         db $E2, $E7, $44, $00, $00
DATA_1AACF1:         db $16, $E7, $44, $00, $00
DATA_1AACF6:         db $E2, $1B, $44, $00, $00
DATA_1AACFB:         db $16, $1B, $44, $00, $00
DATA_1AAD00:         db $F1, $DF, $44, $00, $00
DATA_1AAD05:         db $07, $DF, $44, $00, $00
DATA_1AAD0A:         db $D8, $F8, $44, $00, $00
DATA_1AAD0F:         db $D8, $0E, $44, $00, $00
DATA_1AAD14:         db $F1, $27, $44, $00, $00
DATA_1AAD19:         db $07, $27, $44, $00, $00
DATA_1AAD1E:         db $20, $0E, $44, $00, $00
DATA_1AAD23:         db $20, $F9, $44, $00, $00
DATA_1AAD28:         db $E1, $E8, $44, $00, $00
DATA_1AAD2D:         db $17, $E8, $44, $00, $00
DATA_1AAD32:         db $E1, $1E, $44, $00, $00
DATA_1AAD37:         db $17, $1E, $44, $00, $00
DATA_1AAD3C:         db $F0, $F0, $9C, $00, $02
DATA_1AAD41:         db $00, $F0, $7E, $00, $02
DATA_1AAD46:         db $F0, $00, $7E, $C0, $02
DATA_1AAD4B:         db $00, $00, $7E, $80, $02
DATA_1AAD50:         db $F0, $F0, $9C, $00, $02
DATA_1AAD55:         db $00, $F0, $7E, $00, $02
DATA_1AAD5A:         db $F0, $00, $7E, $C0, $02
DATA_1AAD5F:         db $00, $00, $7E, $80, $02
DATA_1AAD64:         db $F0, $F0, $9C, $00, $02
DATA_1AAD69:         db $00, $F0, $7E, $00, $02
DATA_1AAD6E:         db $F0, $00, $7E, $C0, $02
DATA_1AAD73:         db $00, $00, $7E, $80, $02
DATA_1AAD78:         db $00, $08, $1F, $00, $00
DATA_1AAD7D:         db $00, $08, $1F, $00, $00
DATA_1AAD82:         db $08, $08, $1F, $00, $00
DATA_1AAD87:         db $08, $08, $1F, $00, $00
DATA_1AAD8C:         db $00, $00, $0E, $00, $00
DATA_1AAD91:         db $00, $08, $1E, $00, $00
DATA_1AAD96:         db $08, $00, $0E, $00, $00
DATA_1AAD9B:         db $08, $08, $1E, $00, $00
DATA_1AADA0:         db $00, $00, $0D, $00, $00
DATA_1AADA5:         db $00, $08, $1D, $00, $00
DATA_1AADAA:         db $08, $00, $0D, $00, $00
DATA_1AADAF:         db $08, $08, $1D, $00, $00
DATA_1AADB4:         db $00, $00, $C0, $00, $02
DATA_1AADB9:         db $00, $00, $BD, $00, $00
DATA_1AADBE:         db $00, $00, $BD, $00, $00
DATA_1AADC3:         db $00, $00, $BD, $00, $00
DATA_1AADC8:         db $00, $00, $28, $00, $02
DATA_1AADCD:         db $00, $00, $2A, $00, $02
DATA_1AADD2:         db $00, $00, $0E, $00, $02
DATA_1AADD7:         db $01, $0E, $2F, $40, $00
DATA_1AADDC:         db $06, $0E, $2F, $40, $00
DATA_1AADE1:         db $08, $FA, $2C, $40, $00
DATA_1AADE6:         db $00, $FA, $2C, $00, $00
DATA_1AADEB:         db $00, $00, $0E, $00, $02
DATA_1AADF0:         db $01, $0E, $2F, $40, $00
DATA_1AADF5:         db $06, $0E, $2F, $40, $00
DATA_1AADFA:         db $08, $FA, $2D, $40, $00
DATA_1AADFF:         db $00, $FA, $2D, $00, $00
DATA_1AAE04:         db $00, $00, $0E, $00, $02
DATA_1AAE09:         db $01, $0E, $2F, $40, $00
DATA_1AAE0E:         db $06, $0E, $2F, $40, $00
DATA_1AAE13:         db $08, $FA, $3C, $40, $00
DATA_1AAE18:         db $00, $FA, $3C, $00, $00
DATA_1AAE1D:         db $00, $00, $0E, $00, $02
DATA_1AAE22:         db $01, $0E, $2F, $40, $00
DATA_1AAE27:         db $06, $0E, $2F, $40, $00
DATA_1AAE2C:         db $08, $FA, $3D, $40, $00
DATA_1AAE31:         db $00, $FA, $3D, $00, $00
DATA_1AAE36:         db $00, $00, $0E, $00, $02
DATA_1AAE3B:         db $00, $F8, $00, $00, $00
DATA_1AAE40:         db $08, $F8, $00, $40, $00
DATA_1AAE45:         db $00, $00, $0E, $00, $02
DATA_1AAE4A:         db $00, $F8, $00, $00, $00
DATA_1AAE4F:         db $08, $F8, $00, $40, $00
DATA_1AAE54:         db $00, $00, $0E, $00, $02
DATA_1AAE59:         db $00, $F8, $00, $00, $00
DATA_1AAE5E:         db $08, $F8, $00, $40, $00
DATA_1AAE63:         db $00, $00, $0E, $00, $02
DATA_1AAE68:         db $00, $F8, $00, $00, $00
DATA_1AAE6D:         db $08, $F8, $00, $40, $00
DATA_1AAE72:         db $00, $00, $0E, $00, $02
DATA_1AAE77:         db $00, $F8, $2C, $00, $00
DATA_1AAE7C:         db $08, $F8, $2C, $40, $00
DATA_1AAE81:         db $05, $0E, $4F, $40, $00
DATA_1AAE86:         db $00, $13, $4F, $80, $00
DATA_1AAE8B:         db $08, $13, $4F, $40, $00
DATA_1AAE90:         db $08, $0B, $4F, $40, $00
DATA_1AAE95:         db $00, $0B, $4F, $00, $00
DATA_1AAE9A:         db $05, $0D, $4F, $40, $00
DATA_1AAE9F:         db $00, $12, $4F, $80, $00
DATA_1AAEA4:         db $08, $12, $4F, $40, $00
DATA_1AAEA9:         db $08, $0A, $4F, $40, $00
DATA_1AAEAE:         db $00, $0A, $4F, $00, $00
DATA_1AAEB3:         db $05, $0C, $4E, $40, $00
DATA_1AAEB8:         db $00, $11, $4E, $80, $00
DATA_1AAEBD:         db $08, $11, $4E, $40, $00
DATA_1AAEC2:         db $08, $09, $4E, $40, $00
DATA_1AAEC7:         db $00, $09, $4E, $00, $00
DATA_1AAECC:         db $05, $0B, $4E, $40, $00
DATA_1AAED1:         db $00, $10, $4E, $80, $00
DATA_1AAED6:         db $08, $10, $4E, $40, $00
DATA_1AAEDB:         db $08, $08, $4E, $40, $00
DATA_1AAEE0:         db $00, $08, $4E, $00, $00
DATA_1AAEE5:         db $05, $0A, $4D, $40, $00
DATA_1AAEEA:         db $00, $0F, $4D, $80, $00
DATA_1AAEEF:         db $08, $0F, $4D, $40, $00
DATA_1AAEF4:         db $08, $07, $4D, $40, $00
DATA_1AAEF9:         db $00, $07, $4D, $00, $00
DATA_1AAEFE:         db $05, $09, $4D, $40, $00
DATA_1AAF03:         db $00, $0E, $4D, $80, $00
DATA_1AAF08:         db $08, $0E, $4D, $40, $00
DATA_1AAF0D:         db $08, $06, $4D, $40, $00
DATA_1AAF12:         db $00, $06, $4D, $00, $00
DATA_1AAF17:         db $05, $08, $4C, $00, $00
DATA_1AAF1C:         db $00, $0D, $4C, $00, $00
DATA_1AAF21:         db $08, $0D, $4C, $00, $00
DATA_1AAF26:         db $08, $05, $4C, $00, $00
DATA_1AAF2B:         db $00, $05, $4C, $00, $00
DATA_1AAF30:         db $05, $07, $4C, $00, $00
DATA_1AAF35:         db $00, $0C, $4C, $00, $00
DATA_1AAF3A:         db $08, $0C, $4C, $00, $00
DATA_1AAF3F:         db $08, $04, $4C, $00, $00
DATA_1AAF44:         db $00, $04, $4C, $00, $00
DATA_1AAF49:         db $05, $06, $4C, $00, $00
DATA_1AAF4E:         db $00, $0B, $4C, $00, $00
DATA_1AAF53:         db $08, $0B, $4C, $00, $00
DATA_1AAF58:         db $08, $03, $4C, $00, $00
DATA_1AAF5D:         db $00, $03, $4C, $00, $00
DATA_1AAF62:         db $05, $05, $4C, $00, $00
DATA_1AAF67:         db $00, $0B, $4C, $00, $00
DATA_1AAF6C:         db $09, $0A, $4C, $00, $00
DATA_1AAF71:         db $08, $01, $4C, $00, $00
DATA_1AAF76:         db $FF, $02, $4C, $00, $00
DATA_1AAF7B:         db $05, $04, $4C, $00, $00
DATA_1AAF80:         db $FF, $09, $4C, $00, $00
DATA_1AAF85:         db $09, $09, $4C, $00, $00
DATA_1AAF8A:         db $09, $00, $4C, $00, $00
DATA_1AAF8F:         db $FF, $00, $4C, $00, $00
DATA_1AAF94:         db $00, $00, $9F, $00, $00
DATA_1AAF99:         db $08, $00, $9F, $40, $00
DATA_1AAF9E:         db $00, $08, $9F, $80, $00
DATA_1AAFA3:         db $08, $08, $9F, $C0, $00
DATA_1AAFA8:         db $F8, $F8, $4E, $81, $02
DATA_1AAFAD:         db $08, $F8, $4E, $C1, $02
DATA_1AAFB2:         db $F8, $08, $4E, $01, $02
DATA_1AAFB7:         db $08, $08, $4E, $41, $02
DATA_1AAFBC:         db $03, $00, $C4, $00, $00
DATA_1AAFC1:         db $05, $00, $C4, $40, $00
DATA_1AAFC6:         db $00, $08, $C5, $C0, $00
DATA_1AAFCB:         db $08, $08, $C5, $80, $00
DATA_1AAFD0:         db $01, $E3, $C4, $0C, $02
DATA_1AAFD5:         db $10, $10, $44, $0C, $02
DATA_1AAFDA:         db $00, $10, $42, $0C, $02
DATA_1AAFDF:         db $F0, $10, $40, $0C, $02
DATA_1AAFE4:         db $10, $00, $24, $0C, $02
DATA_1AAFE9:         db $00, $00, $22, $0C, $02
DATA_1AAFEE:         db $F0, $00, $20, $0C, $02
DATA_1AAFF3:         db $10, $F0, $04, $0C, $02
DATA_1AAFF8:         db $00, $F0, $02, $0C, $02
DATA_1AAFFD:         db $F0, $F0, $00, $0C, $02
DATA_1AB002:         db $F0, $F0, $00, $0C, $02
DATA_1AB007:         db $01, $E3, $C4, $0C, $02
DATA_1AB00C:         db $10, $10, $4A, $0C, $02
DATA_1AB011:         db $00, $10, $48, $0C, $02
DATA_1AB016:         db $F0, $10, $46, $0C, $02
DATA_1AB01B:         db $10, $00, $2A, $0C, $02
DATA_1AB020:         db $00, $00, $28, $0C, $02
DATA_1AB025:         db $F0, $00, $26, $0C, $02
DATA_1AB02A:         db $10, $F0, $0A, $0C, $02
DATA_1AB02F:         db $00, $F0, $08, $0C, $02
DATA_1AB034:         db $F0, $F0, $06, $0C, $02
DATA_1AB039:         db $F0, $F0, $06, $0C, $02
DATA_1AB03E:         db $01, $E3, $C4, $0C, $02
DATA_1AB043:         db $10, $10, $6E, $0C, $02
DATA_1AB048:         db $00, $10, $4E, $0C, $02
DATA_1AB04D:         db $F0, $10, $4C, $0C, $02
DATA_1AB052:         db $10, $00, $8C, $0C, $02
DATA_1AB057:         db $00, $00, $2E, $0C, $02
DATA_1AB05C:         db $F0, $00, $2C, $0C, $02
DATA_1AB061:         db $10, $F0, $6C, $0C, $02
DATA_1AB066:         db $00, $F0, $0E, $0C, $02
DATA_1AB06B:         db $F0, $F0, $0C, $0C, $02
DATA_1AB070:         db $F0, $F0, $0C, $0C, $02
DATA_1AB075:         db $01, $E3, $C4, $0C, $02
DATA_1AB07A:         db $08, $04, $8E, $0C, $02
DATA_1AB07F:         db $10, $10, $A4, $0C, $02
DATA_1AB084:         db $00, $10, $A2, $0C, $02
DATA_1AB089:         db $F0, $10, $A0, $0C, $02
DATA_1AB08E:         db $10, $00, $84, $0C, $02
DATA_1AB093:         db $00, $00, $82, $0C, $02
DATA_1AB098:         db $F0, $00, $80, $0C, $02
DATA_1AB09D:         db $10, $F0, $64, $0C, $02
DATA_1AB0A2:         db $00, $F0, $62, $0C, $02
DATA_1AB0A7:         db $F0, $F0, $60, $0C, $02
DATA_1AB0AC:         db $01, $E4, $C4, $0C, $02
DATA_1AB0B1:         db $08, $06, $8E, $0C, $02
DATA_1AB0B6:         db $10, $11, $A4, $0C, $02
DATA_1AB0BB:         db $00, $11, $A2, $0C, $02
DATA_1AB0C0:         db $F0, $11, $A0, $0C, $02
DATA_1AB0C5:         db $10, $01, $84, $0C, $02
DATA_1AB0CA:         db $00, $01, $82, $0C, $02
DATA_1AB0CF:         db $F0, $01, $80, $0C, $02
DATA_1AB0D4:         db $10, $F1, $64, $0C, $02
DATA_1AB0D9:         db $00, $F1, $62, $0C, $02
DATA_1AB0DE:         db $F0, $F1, $60, $0C, $02
DATA_1AB0E3:         db $10, $10, $AA, $0E, $02
DATA_1AB0E8:         db $00, $10, $A8, $0E, $02
DATA_1AB0ED:         db $F0, $10, $A6, $0E, $02
DATA_1AB0F2:         db $10, $00, $8A, $0E, $02
DATA_1AB0F7:         db $00, $00, $88, $0E, $02
DATA_1AB0FC:         db $F0, $00, $86, $0E, $02
DATA_1AB101:         db $10, $F0, $6A, $0E, $02
DATA_1AB106:         db $00, $F0, $68, $0E, $02
DATA_1AB10B:         db $F0, $F0, $66, $0E, $02
DATA_1AB110:         db $10, $10, $AA, $0E, $02
DATA_1AB115:         db $00, $10, $AE, $0E, $02
DATA_1AB11A:         db $F0, $10, $AC, $0E, $02
DATA_1AB11F:         db $10, $00, $EE, $0E, $02
DATA_1AB124:         db $00, $00, $E2, $0E, $02
DATA_1AB129:         db $F0, $00, $E0, $0E, $02
DATA_1AB12E:         db $10, $F0, $CE, $0E, $02
DATA_1AB133:         db $00, $F0, $C2, $0E, $02
DATA_1AB138:         db $F0, $F0, $C0, $0E, $02
DATA_1AB13D:         db $16, $F7, $AE, $41, $02
DATA_1AB142:         db $0F, $F7, $AC, $01, $02
DATA_1AB147:         db $F4, $EA, $7E, $01, $02
DATA_1AB14C:         db $E4, $EA, $7C, $01, $02
DATA_1AB151:         db $10, $F0, $DA, $01, $02
DATA_1AB156:         db $00, $F0, $D8, $01, $02
DATA_1AB15B:         db $F0, $F0, $D6, $01, $02
DATA_1AB160:         db $E0, $F0, $D4, $01, $02
DATA_1AB165:         db $7F, $7F, $00, $00, $00
DATA_1AB16A:         db $7F, $7F, $00, $00, $00
DATA_1AB16F:         db $7F, $7F, $00, $00, $00
DATA_1AB174:         db $7F, $7F, $00, $00, $00
DATA_1AB179:         db $0F, $F6, $AC, $01, $02
DATA_1AB17E:         db $0C, $F6, $AE, $01, $02
DATA_1AB183:         db $E9, $E0, $D0, $01, $02
DATA_1AB188:         db $E9, $E8, $E0, $01, $02
DATA_1AB18D:         db $F1, $E0, $D1, $01, $02
DATA_1AB192:         db $F1, $E8, $E1, $01, $02
DATA_1AB197:         db $10, $F0, $DA, $01, $02
DATA_1AB19C:         db $00, $F0, $D8, $01, $02
DATA_1AB1A1:         db $F0, $F0, $D6, $01, $02
DATA_1AB1A6:         db $E0, $F0, $D4, $01, $02
DATA_1AB1AB:         db $7F, $7F, $00, $00, $00
DATA_1AB1B0:         db $7F, $7F, $00, $00, $00
DATA_1AB1B5:         db $0A, $F7, $AE, $01, $02
DATA_1AB1BA:         db $09, $F7, $CC, $01, $02
DATA_1AB1BF:         db $E9, $E8, $23, $01, $02
DATA_1AB1C4:         db $E9, $D8, $03, $01, $02
DATA_1AB1C9:         db $F1, $E8, $24, $01, $02
DATA_1AB1CE:         db $F1, $D8, $04, $01, $02
DATA_1AB1D3:         db $10, $F0, $DA, $01, $02
DATA_1AB1D8:         db $00, $F0, $D8, $01, $02
DATA_1AB1DD:         db $F0, $F0, $D6, $01, $02
DATA_1AB1E2:         db $E0, $F0, $D4, $01, $02
DATA_1AB1E7:         db $7F, $7F, $00, $00, $00
DATA_1AB1EC:         db $7F, $7F, $00, $00, $00
DATA_1AB1F1:         db $07, $F6, $CC, $01, $02
DATA_1AB1F6:         db $09, $F8, $CC, $01, $02
DATA_1AB1FB:         db $EA, $CF, $09, $01, $02
DATA_1AB200:         db $EA, $E7, $39, $01, $02
DATA_1AB205:         db $EA, $D7, $19, $01, $02
DATA_1AB20A:         db $F2, $CF, $0A, $01, $02
DATA_1AB20F:         db $F2, $E7, $3A, $01, $02
DATA_1AB214:         db $F2, $D7, $1A, $01, $02
DATA_1AB219:         db $10, $F1, $BA, $01, $02
DATA_1AB21E:         db $00, $F1, $B8, $01, $02
DATA_1AB223:         db $F0, $F1, $B6, $01, $02
DATA_1AB228:         db $E0, $F1, $B4, $01, $02
DATA_1AB22D:         db $05, $F5, $CC, $01, $02
DATA_1AB232:         db $09, $F7, $CC, $01, $02
DATA_1AB237:         db $EA, $CF, $00, $01, $02
DATA_1AB23C:         db $F2, $CF, $01, $01, $02
DATA_1AB241:         db $EA, $E7, $30, $01, $02
DATA_1AB246:         db $EA, $D7, $10, $01, $02
DATA_1AB24B:         db $F2, $E7, $31, $01, $02
DATA_1AB250:         db $F2, $D7, $11, $01, $02
DATA_1AB255:         db $10, $F2, $9A, $01, $02
DATA_1AB25A:         db $00, $F2, $98, $01, $02
DATA_1AB25F:         db $F0, $F2, $96, $01, $02
DATA_1AB264:         db $E0, $F2, $94, $01, $02
DATA_1AB269:         db $05, $F6, $CC, $01, $02
DATA_1AB26E:         db $0A, $F8, $CC, $01, $02
DATA_1AB273:         db $F4, $E7, $72, $01, $02
DATA_1AB278:         db $E4, $E7, $70, $01, $02
DATA_1AB27D:         db $F4, $D7, $52, $01, $02
DATA_1AB282:         db $E4, $D7, $50, $01, $02
DATA_1AB287:         db $10, $F2, $9A, $01, $02
DATA_1AB28C:         db $00, $F2, $98, $01, $02
DATA_1AB291:         db $F0, $F2, $96, $01, $02
DATA_1AB296:         db $E0, $F2, $94, $01, $02
DATA_1AB29B:         db $7F, $7F, $00, $00, $00
DATA_1AB2A0:         db $7F, $7F, $00, $00, $00
DATA_1AB2A5:         db $06, $F7, $CC, $01, $02
DATA_1AB2AA:         db $0C, $F9, $AE, $01, $02
DATA_1AB2AF:         db $F3, $EB, $5E, $01, $02
DATA_1AB2B4:         db $E3, $EB, $5C, $01, $02
DATA_1AB2B9:         db $10, $F2, $9A, $01, $02
DATA_1AB2BE:         db $00, $F2, $98, $01, $02
DATA_1AB2C3:         db $F0, $F2, $96, $01, $02
DATA_1AB2C8:         db $E0, $F2, $94, $01, $02
DATA_1AB2CD:         db $7F, $7F, $00, $00, $00
DATA_1AB2D2:         db $7F, $7F, $00, $00, $00
DATA_1AB2D7:         db $7F, $7F, $00, $00, $00
DATA_1AB2DC:         db $7F, $7F, $00, $00, $00
DATA_1AB2E1:         db $08, $F8, $AE, $01, $02
DATA_1AB2E6:         db $0F, $F8, $AC, $01, $02
DATA_1AB2EB:         db $E5, $F4, $58, $01, $02
DATA_1AB2F0:         db $F5, $F4, $5A, $01, $02
DATA_1AB2F5:         db $E0, $F1, $B4, $01, $02
DATA_1AB2FA:         db $00, $F1, $B8, $01, $02
DATA_1AB2FF:         db $F0, $F1, $B6, $01, $02
DATA_1AB304:         db $F5, $04, $7A, $01, $02
DATA_1AB309:         db $E5, $04, $78, $01, $02
DATA_1AB30E:         db $10, $F1, $BA, $01, $02
DATA_1AB313:         db $7F, $7F, $00, $00, $00
DATA_1AB318:         db $7F, $7F, $00, $00, $00
DATA_1AB31D:         db $0D, $F8, $AC, $01, $02
DATA_1AB322:         db $14, $F8, $AE, $41, $02
DATA_1AB327:         db $E5, $F5, $44, $01, $02
DATA_1AB32C:         db $F5, $F5, $46, $01, $02
DATA_1AB331:         db $00, $F1, $B8, $01, $02
DATA_1AB336:         db $E0, $F1, $B4, $01, $02
DATA_1AB33B:         db $F0, $F1, $B6, $01, $02
DATA_1AB340:         db $E5, $FD, $54, $01, $02
DATA_1AB345:         db $F5, $0D, $76, $01, $02
DATA_1AB34A:         db $E5, $0D, $74, $01, $02
DATA_1AB34F:         db $F5, $FD, $56, $01, $02
DATA_1AB354:         db $10, $F1, $BA, $01, $02
DATA_1AB359:         db $14, $F9, $AE, $41, $02
DATA_1AB35E:         db $17, $F7, $CC, $41, $02
DATA_1AB363:         db $F5, $F4, $0E, $01, $02
DATA_1AB368:         db $F5, $FC, $1E, $01, $02
DATA_1AB36D:         db $E5, $F4, $0C, $01, $02
DATA_1AB372:         db $00, $F0, $D8, $01, $02
DATA_1AB377:         db $F0, $F0, $D6, $01, $02
DATA_1AB37C:         db $E0, $F0, $D4, $01, $02
DATA_1AB381:         db $E5, $FC, $1C, $01, $02
DATA_1AB386:         db $F5, $0C, $3E, $01, $02
DATA_1AB38B:         db $E5, $0C, $3C, $01, $02
DATA_1AB390:         db $10, $F0, $DA, $01, $02
DATA_1AB395:         db $16, $F7, $CC, $41, $02
DATA_1AB39A:         db $17, $F6, $CC, $41, $02
DATA_1AB39F:         db $F2, $F3, $07, $01, $02
DATA_1AB3A4:         db $EA, $F3, $06, $01, $02
DATA_1AB3A9:         db $00, $F0, $D8, $01, $02
DATA_1AB3AE:         db $F0, $F0, $D6, $01, $02
DATA_1AB3B3:         db $E0, $F0, $D4, $01, $02
DATA_1AB3B8:         db $EA, $03, $26, $01, $02
DATA_1AB3BD:         db $F2, $03, $27, $01, $02
DATA_1AB3C2:         db $10, $F0, $DA, $01, $02
DATA_1AB3C7:         db $7F, $7F, $00, $00, $00
DATA_1AB3CC:         db $7F, $7F, $00, $00, $00
DATA_1AB3D1:         db $18, $F6, $CC, $41, $02
DATA_1AB3D6:         db $13, $F7, $AE, $41, $02
DATA_1AB3DB:         db $E6, $FA, $B0, $01, $02
DATA_1AB3E0:         db $E6, $EA, $90, $01, $02
DATA_1AB3E5:         db $F6, $FA, $B2, $01, $02
DATA_1AB3EA:         db $F6, $EA, $92, $01, $02
DATA_1AB3EF:         db $00, $F0, $D8, $01, $02
DATA_1AB3F4:         db $E0, $F0, $D4, $01, $02
DATA_1AB3F9:         db $F0, $F0, $D6, $01, $02
DATA_1AB3FE:         db $10, $F0, $DA, $01, $02
DATA_1AB403:         db $7F, $7F, $00, $00, $00
DATA_1AB408:         db $7F, $7F, $00, $00, $00
DATA_1AB40D:         db $07, $F3, $AE, $01, $02
DATA_1AB412:         db $E5, $07, $40, $00, $02
DATA_1AB417:         db $ED, $FF, $31, $00, $02
DATA_1AB41C:         db $F5, $EF, $12, $00, $02
DATA_1AB421:         db $E5, $EF, $10, $00, $02
DATA_1AB426:         db $05, $E7, $04, $00, $02
DATA_1AB42B:         db $F5, $E7, $02, $00, $02
DATA_1AB430:         db $7F, $7F, $00, $00, $00
DATA_1AB435:         db $7F, $7F, $00, $00, $00
DATA_1AB43A:         db $7F, $7F, $00, $00, $00
DATA_1AB43F:         db $7F, $7F, $00, $00, $00
DATA_1AB444:         db $7F, $7F, $00, $00, $00
DATA_1AB449:         db $08, $F0, $AC, $01, $02
DATA_1AB44E:         db $F3, $04, $48, $00, $02
DATA_1AB453:         db $F3, $F4, $28, $00, $02
DATA_1AB458:         db $E3, $F4, $26, $00, $02
DATA_1AB45D:         db $03, $E4, $0A, $00, $02
DATA_1AB462:         db $F3, $E4, $08, $00, $02
DATA_1AB467:         db $E3, $E4, $06, $00, $02
DATA_1AB46C:         db $7F, $7F, $00, $00, $00
DATA_1AB471:         db $7F, $7F, $00, $00, $00
DATA_1AB476:         db $7F, $7F, $00, $00, $00
DATA_1AB47B:         db $7F, $7F, $00, $00, $00
DATA_1AB480:         db $7F, $7F, $00, $00, $00
DATA_1AB485:         db $EE, $F4, $4E, $00, $02
DATA_1AB48A:         db $0A, $E6, $AE, $41, $02
DATA_1AB48F:         db $FE, $F4, $0E, $00, $02
DATA_1AB494:         db $EE, $EC, $3E, $00, $02
DATA_1AB499:         db $DE, $EC, $3C, $00, $02
DATA_1AB49E:         db $CE, $EC, $3A, $00, $02
DATA_1AB4A3:         db $FE, $E4, $0C, $00, $02
DATA_1AB4A8:         db $EE, $E4, $2E, $00, $02
DATA_1AB4AD:         db $DE, $E4, $2C, $00, $02
DATA_1AB4B2:         db $CE, $E4, $2A, $00, $02
DATA_1AB4B7:         db $7F, $7F, $00, $00, $00
DATA_1AB4BC:         db $7F, $7F, $00, $00, $00
DATA_1AB4C1:         db $14, $E8, $CC, $41, $02
DATA_1AB4C6:         db $06, $F0, $CE, $00, $02
DATA_1AB4CB:         db $F6, $F0, $CC, $00, $02
DATA_1AB4D0:         db $E6, $F0, $CA, $00, $02
DATA_1AB4D5:         db $D6, $F0, $C8, $00, $02
DATA_1AB4DA:         db $06, $E0, $AE, $00, $02
DATA_1AB4DF:         db $F6, $E0, $AC, $00, $02
DATA_1AB4E4:         db $E6, $E0, $AA, $00, $02
DATA_1AB4E9:         db $D6, $E0, $A8, $00, $02
DATA_1AB4EE:         db $7F, $7F, $00, $00, $00
DATA_1AB4F3:         db $7F, $7F, $00, $00, $00
DATA_1AB4F8:         db $7F, $7F, $00, $00, $00
DATA_1AB4FD:         db $08, $E8, $7C, $40, $02
DATA_1AB502:         db $18, $E8, $7A, $40, $02
DATA_1AB507:         db $08, $F0, $8C, $40, $02
DATA_1AB50C:         db $18, $F0, $8A, $40, $02
DATA_1AB511:         db $F8, $F0, $8E, $00, $02
DATA_1AB516:         db $E8, $F0, $8C, $00, $02
DATA_1AB51B:         db $D8, $F0, $8A, $00, $02
DATA_1AB520:         db $F8, $E0, $6E, $00, $02
DATA_1AB525:         db $E8, $E8, $7C, $00, $02
DATA_1AB52A:         db $D8, $E8, $7A, $00, $02
DATA_1AB52F:         db $7F, $7F, $00, $00, $00
DATA_1AB534:         db $7F, $7F, $00, $00, $00
DATA_1AB539:         db $EC, $F0, $CE, $40, $02
DATA_1AB53E:         db $FC, $F0, $CC, $40, $02
DATA_1AB543:         db $0C, $F0, $CA, $40, $02
DATA_1AB548:         db $1C, $F0, $C8, $40, $02
DATA_1AB54D:         db $EC, $E0, $AE, $40, $02
DATA_1AB552:         db $FC, $E0, $AC, $40, $02
DATA_1AB557:         db $0C, $E0, $AA, $40, $02
DATA_1AB55C:         db $1C, $E0, $A8, $40, $02
DATA_1AB561:         db $7F, $7F, $00, $00, $00
DATA_1AB566:         db $7F, $7F, $00, $00, $00
DATA_1AB56B:         db $7F, $7F, $00, $00, $00
DATA_1AB570:         db $7F, $7F, $00, $00, $00
DATA_1AB575:         db $F8, $F0, $4E, $40, $02
DATA_1AB57A:         db $E8, $F0, $0E, $40, $02
DATA_1AB57F:         db $F8, $E8, $3E, $40, $02
DATA_1AB584:         db $08, $E8, $3C, $40, $02
DATA_1AB589:         db $18, $E8, $3A, $40, $02
DATA_1AB58E:         db $E8, $E0, $0C, $40, $02
DATA_1AB593:         db $F8, $E0, $2E, $40, $02
DATA_1AB598:         db $08, $E0, $2C, $40, $02
DATA_1AB59D:         db $18, $E0, $2A, $40, $02
DATA_1AB5A2:         db $7F, $7F, $00, $00, $00
DATA_1AB5A7:         db $7F, $7F, $00, $00, $00
DATA_1AB5AC:         db $7F, $7F, $00, $00, $00
DATA_1AB5B1:         db $E7, $F0, $C6, $40, $02
DATA_1AB5B6:         db $E7, $E0, $A6, $40, $02
DATA_1AB5BB:         db $F7, $F0, $84, $40, $02
DATA_1AB5C0:         db $07, $F0, $82, $40, $02
DATA_1AB5C5:         db $17, $E8, $70, $40, $02
DATA_1AB5CA:         db $F7, $E0, $64, $40, $02
DATA_1AB5CF:         db $07, $E0, $62, $40, $02
DATA_1AB5D4:         db $17, $E0, $60, $40, $02
DATA_1AB5D9:         db $7F, $7F, $00, $00, $00
DATA_1AB5DE:         db $7F, $7F, $00, $00, $00
DATA_1AB5E3:         db $7F, $7F, $00, $00, $00
DATA_1AB5E8:         db $7F, $7F, $00, $00, $00
DATA_1AB5ED:         db $00, $F0, $C4, $40, $02
DATA_1AB5F2:         db $10, $F0, $C2, $40, $02
DATA_1AB5F7:         db $20, $F0, $C0, $40, $02
DATA_1AB5FC:         db $00, $E0, $A4, $40, $02
DATA_1AB601:         db $10, $E0, $A2, $40, $02
DATA_1AB606:         db $20, $E8, $B0, $40, $02
DATA_1AB60B:         db $F0, $F0, $C4, $00, $02
DATA_1AB610:         db $E0, $F0, $C2, $00, $02
DATA_1AB615:         db $D0, $F0, $C0, $00, $02
DATA_1AB61A:         db $F0, $E0, $A4, $00, $02
DATA_1AB61F:         db $E0, $E0, $A2, $00, $02
DATA_1AB624:         db $D0, $E8, $B0, $00, $02
DATA_1AB629:         db $07, $F0, $C6, $00, $02
DATA_1AB62E:         db $07, $E0, $A6, $00, $02
DATA_1AB633:         db $F7, $F0, $84, $00, $02
DATA_1AB638:         db $E7, $F0, $82, $00, $02
DATA_1AB63D:         db $D7, $E8, $70, $00, $02
DATA_1AB642:         db $F7, $E0, $64, $00, $02
DATA_1AB647:         db $E7, $E0, $62, $00, $02
DATA_1AB64C:         db $D7, $E0, $60, $00, $02
DATA_1AB651:         db $7F, $7F, $00, $00, $00
DATA_1AB656:         db $7F, $7F, $00, $00, $00
DATA_1AB65B:         db $7F, $7F, $00, $00, $00
DATA_1AB660:         db $7F, $7F, $00, $00, $00
DATA_1AB665:         db $F8, $F0, $4E, $00, $02
DATA_1AB66A:         db $08, $F0, $0E, $00, $02
DATA_1AB66F:         db $F8, $E8, $3E, $00, $02
DATA_1AB674:         db $E8, $E8, $3C, $00, $02
DATA_1AB679:         db $D8, $E8, $3A, $00, $02
DATA_1AB67E:         db $08, $E0, $0C, $00, $02
DATA_1AB683:         db $F8, $E0, $2E, $00, $02
DATA_1AB688:         db $E8, $E0, $2C, $00, $02
DATA_1AB68D:         db $D8, $E0, $2A, $00, $02
DATA_1AB692:         db $7F, $7F, $00, $00, $00
DATA_1AB697:         db $7F, $7F, $00, $00, $00
DATA_1AB69C:         db $7F, $7F, $00, $00, $00
DATA_1AB6A1:         db $06, $F0, $CE, $00, $02
DATA_1AB6A6:         db $F6, $F0, $CC, $00, $02
DATA_1AB6AB:         db $E6, $F0, $CA, $00, $02
DATA_1AB6B0:         db $D6, $F0, $C8, $00, $02
DATA_1AB6B5:         db $06, $E0, $AE, $00, $02
DATA_1AB6BA:         db $F6, $E0, $AC, $00, $02
DATA_1AB6BF:         db $E6, $E0, $AA, $00, $02
DATA_1AB6C4:         db $D6, $E0, $A8, $00, $02
DATA_1AB6C9:         db $7F, $7F, $00, $00, $00
DATA_1AB6CE:         db $7F, $7F, $00, $00, $00
DATA_1AB6D3:         db $7F, $7F, $00, $00, $00
DATA_1AB6D8:         db $7F, $7F, $00, $00, $00
DATA_1AB6DD:         db $10, $F8, $5A, $00, $02
DATA_1AB6E2:         db $00, $F8, $68, $00, $02
DATA_1AB6E7:         db $F0, $F8, $66, $00, $02
DATA_1AB6EC:         db $10, $08, $5C, $00, $02
DATA_1AB6F1:         db $00, $08, $88, $00, $02
DATA_1AB6F6:         db $F0, $08, $86, $00, $02
DATA_1AB6FB:         db $10, $F8, $E4, $00, $02
DATA_1AB700:         db $00, $F8, $E2, $00, $02
DATA_1AB705:         db $F0, $F8, $E0, $00, $02
DATA_1AB70A:         db $10, $08, $EA, $00, $02
DATA_1AB70F:         db $00, $08, $E8, $00, $02
DATA_1AB714:         db $F0, $08, $E6, $00, $02
DATA_1AB719:         db $F8, $00, $EC, $01, $02
DATA_1AB71E:         db $08, $00, $EE, $01, $02
DATA_1AB723:         db $F8, $00, $EC, $00, $02
DATA_1AB728:         db $00, $00, $ED, $00, $02
DATA_1AB72D:         db $C8, $C8, $00, $01, $02
DATA_1AB732:         db $E8, $C8, $04, $01, $02
DATA_1AB737:         db $08, $C8, $08, $01, $02
DATA_1AB73C:         db $28, $C8, $0C, $01, $02
DATA_1AB741:         db $C8, $E8, $40, $01, $02
DATA_1AB746:         db $E8, $E8, $44, $01, $02
DATA_1AB74B:         db $08, $E8, $48, $01, $02
DATA_1AB750:         db $28, $E8, $4C, $01, $02
DATA_1AB755:         db $C8, $08, $80, $01, $02
DATA_1AB75A:         db $E8, $08, $84, $01, $02
DATA_1AB75F:         db $08, $08, $88, $01, $02
DATA_1AB764:         db $28, $08, $8C, $01, $02
DATA_1AB769:         db $C8, $28, $C0, $01, $02
DATA_1AB76E:         db $E8, $28, $C4, $01, $02
DATA_1AB773:         db $08, $28, $C8, $01, $02
DATA_1AB778:         db $28, $28, $CC, $01, $02
DATA_1AB77D:         db $00, $F8, $F6, $03, $00
DATA_1AB782:         db $F8, $F8, $F5, $03, $00
DATA_1AB787:         db $F0, $F8, $F4, $03, $00
DATA_1AB78C:         db $E8, $F8, $F3, $03, $00
DATA_1AB791:         db $00, $00, $46, $02, $02
DATA_1AB796:         db $F0, $00, $44, $02, $02
DATA_1AB79B:         db $E0, $00, $42, $02, $02
DATA_1AB7A0:         db $7F, $7F, $00, $00, $00
DATA_1AB7A5:         db $EA, $08, $AC, $01, $02
DATA_1AB7AA:         db $00, $F8, $F6, $03, $00
DATA_1AB7AF:         db $F8, $F8, $F5, $03, $00
DATA_1AB7B4:         db $F0, $F8, $F4, $03, $00
DATA_1AB7B9:         db $E8, $F8, $F3, $03, $00
DATA_1AB7BE:         db $00, $00, $46, $02, $02
DATA_1AB7C3:         db $F0, $00, $44, $02, $02
DATA_1AB7C8:         db $E0, $00, $42, $02, $02
DATA_1AB7CD:         db $F0, $08, $AE, $41, $02
DATA_1AB7D2:         db $00, $F8, $F6, $03, $00
DATA_1AB7D7:         db $F8, $F8, $F5, $03, $00
DATA_1AB7DC:         db $F0, $F8, $F4, $03, $00
DATA_1AB7E1:         db $E8, $F8, $F3, $03, $00
DATA_1AB7E6:         db $00, $00, $46, $02, $02
DATA_1AB7EB:         db $F0, $00, $44, $02, $02
DATA_1AB7F0:         db $E0, $00, $42, $02, $02
DATA_1AB7F5:         db $F4, $08, $CC, $41, $02
DATA_1AB7FA:         db $00, $F8, $F6, $03, $00
DATA_1AB7FF:         db $F8, $F8, $F5, $03, $00
DATA_1AB804:         db $F0, $F8, $F4, $03, $00
DATA_1AB809:         db $E8, $F8, $F3, $03, $00
DATA_1AB80E:         db $00, $00, $46, $02, $02
DATA_1AB813:         db $F0, $00, $44, $02, $02
DATA_1AB818:         db $E0, $00, $42, $02, $02
DATA_1AB81D:         db $08, $08, $35, $02, $00
DATA_1AB822:         db $00, $08, $34, $02, $00
DATA_1AB827:         db $08, $00, $25, $02, $00
DATA_1AB82C:         db $00, $00, $24, $02, $00
DATA_1AB831:         db $08, $08, $FA, $03, $00
DATA_1AB836:         db $00, $08, $F9, $03, $00
DATA_1AB83B:         db $08, $00, $F8, $03, $00
DATA_1AB840:         db $00, $00, $F7, $03, $00
DATA_1AB845:         db $FB, $06, $4C, $07, $02
DATA_1AB84A:         db $EC, $FC, $48, $09, $02
DATA_1AB84F:         db $E0, $F0, $44, $09, $02
DATA_1AB854:         db $F0, $F0, $46, $09, $02
DATA_1AB859:         db $FC, $FC, $4A, $09, $02
DATA_1AB85E:         db $E8, $01, $4E, $07, $02
DATA_1AB863:         db $F0, $E8, $42, $09, $02
DATA_1AB868:         db $E0, $E8, $40, $09, $02
DATA_1AB86D:         db $F9, $06, $4C, $07, $02
DATA_1AB872:         db $FC, $FC, $4A, $09, $02
DATA_1AB877:         db $EC, $FC, $48, $09, $02
DATA_1AB87C:         db $EE, $04, $4E, $07, $02
DATA_1AB881:         db $E0, $F0, $44, $09, $02
DATA_1AB886:         db $F0, $F0, $46, $09, $02
DATA_1AB88B:         db $F0, $E8, $42, $09, $02
DATA_1AB890:         db $E0, $E8, $40, $09, $02
DATA_1AB895:         db $FC, $FC, $4A, $09, $02
DATA_1AB89A:         db $EC, $FC, $48, $09, $02
DATA_1AB89F:         db $F2, $06, $4C, $07, $02
DATA_1AB8A4:         db $F0, $03, $4E, $07, $02
DATA_1AB8A9:         db $F0, $E8, $42, $09, $02
DATA_1AB8AE:         db $E0, $E8, $40, $09, $02
DATA_1AB8B3:         db $F0, $F0, $46, $09, $02
DATA_1AB8B8:         db $E0, $F0, $44, $09, $02
DATA_1AB8BD:         db $EE, $06, $4C, $07, $02
DATA_1AB8C2:         db $EC, $FC, $48, $09, $02
DATA_1AB8C7:         db $FC, $FC, $4A, $09, $02
DATA_1AB8CC:         db $F8, $03, $4E, $07, $02
DATA_1AB8D1:         db $F0, $E8, $42, $09, $02
DATA_1AB8D6:         db $E0, $E8, $40, $09, $02
DATA_1AB8DB:         db $F0, $F0, $46, $09, $02
DATA_1AB8E0:         db $E0, $F0, $44, $09, $02
DATA_1AB8E5:         db $FC, $FC, $4A, $09, $02
DATA_1AB8EA:         db $FD, $01, $4C, $07, $02
DATA_1AB8EF:         db $E9, $06, $4E, $07, $02
DATA_1AB8F4:         db $EC, $FC, $48, $09, $02
DATA_1AB8F9:         db $F0, $E8, $42, $09, $02
DATA_1AB8FE:         db $E0, $E8, $40, $09, $02
DATA_1AB903:         db $F0, $F0, $46, $09, $02
DATA_1AB908:         db $E0, $F0, $44, $09, $02
DATA_1AB90D:         db $EB, $07, $4C, $07, $02
DATA_1AB912:         db $EC, $FC, $48, $09, $02
DATA_1AB917:         db $FC, $FC, $4A, $09, $02
DATA_1AB91C:         db $F8, $03, $4E, $07, $02
DATA_1AB921:         db $F0, $E8, $42, $09, $02
DATA_1AB926:         db $E0, $E8, $40, $09, $02
DATA_1AB92B:         db $F0, $F0, $46, $09, $02
DATA_1AB930:         db $E0, $F0, $44, $09, $02
DATA_1AB935:         db $E0, $F0, $44, $09, $02
DATA_1AB93A:         db $F0, $F0, $46, $09, $02
DATA_1AB93F:         db $EC, $FC, $48, $09, $02
DATA_1AB944:         db $FC, $FC, $4A, $09, $02
DATA_1AB949:         db $F4, $07, $4C, $07, $02
DATA_1AB94E:         db $F3, $02, $4E, $07, $02
DATA_1AB953:         db $F0, $E8, $42, $09, $02
DATA_1AB958:         db $E0, $E8, $40, $09, $02
DATA_1AB95D:         db $E0, $F0, $44, $09, $02
DATA_1AB962:         db $F0, $F0, $46, $09, $02
DATA_1AB967:         db $F8, $06, $4C, $07, $02
DATA_1AB96C:         db $EC, $FC, $48, $09, $02
DATA_1AB971:         db $EA, $01, $4E, $07, $02
DATA_1AB976:         db $FC, $FC, $4A, $09, $02
DATA_1AB97B:         db $F0, $E8, $42, $09, $02
DATA_1AB980:         db $E0, $E8, $40, $09, $02
DATA_1AB985:         db $E0, $F0, $44, $09, $02
DATA_1AB98A:         db $F0, $F0, $46, $09, $02
DATA_1AB98F:         db $EC, $FC, $48, $09, $02
DATA_1AB994:         db $FC, $FC, $4A, $09, $02
DATA_1AB999:         db $F4, $07, $4C, $07, $02
DATA_1AB99E:         db $F3, $02, $4E, $07, $02
DATA_1AB9A3:         db $F0, $E8, $42, $09, $02
DATA_1AB9A8:         db $E0, $E8, $40, $09, $02
DATA_1AB9AD:         db $F3, $E6, $42, $09, $02
DATA_1AB9B2:         db $E3, $E6, $40, $09, $02
DATA_1AB9B7:         db $F3, $EE, $46, $09, $02
DATA_1AB9BC:         db $E3, $EE, $44, $09, $02
DATA_1AB9C1:         db $FC, $FC, $4A, $09, $02
DATA_1AB9C6:         db $EC, $FC, $48, $09, $02
DATA_1AB9CB:         db $F4, $07, $4C, $07, $02
DATA_1AB9D0:         db $F3, $02, $4E, $07, $02
DATA_1AB9D5:         db $EC, $04, $4C, $07, $02
DATA_1AB9DA:         db $DC, $F0, $40, $09, $02
DATA_1AB9DF:         db $FC, $F0, $44, $09, $02
DATA_1AB9E4:         db $FC, $F0, $44, $09, $02
DATA_1AB9E9:         db $EC, $F0, $42, $09, $02
DATA_1AB9EE:         db $FC, $F8, $4A, $09, $02
DATA_1AB9F3:         db $EC, $F8, $48, $09, $02
DATA_1AB9F8:         db $EA, $02, $4E, $07, $02
DATA_1AB9FD:         db $EA, $FD, $4C, $07, $02
DATA_1ABA02:         db $DD, $FA, $40, $09, $02
DATA_1ABA07:         db $FD, $FA, $44, $09, $02
DATA_1ABA0C:         db $FD, $FA, $44, $09, $02
DATA_1ABA11:         db $ED, $FA, $42, $09, $02
DATA_1ABA16:         db $FC, $F8, $4A, $09, $02
DATA_1ABA1B:         db $EC, $F8, $48, $09, $02
DATA_1ABA20:         db $E8, $FA, $4E, $07, $02
DATA_1ABA25:         db $EA, $FE, $4C, $07, $02
DATA_1ABA2A:         db $DA, $F8, $40, $09, $02
DATA_1ABA2F:         db $FA, $F8, $44, $09, $02
DATA_1ABA34:         db $FA, $F8, $44, $09, $02
DATA_1ABA39:         db $EA, $F8, $42, $09, $02
DATA_1ABA3E:         db $FC, $FA, $4A, $09, $02
DATA_1ABA43:         db $EC, $FA, $48, $09, $02
DATA_1ABA48:         db $E8, $FB, $4E, $07, $02
DATA_1ABA4D:         db $EA, $03, $4C, $07, $02
DATA_1ABA52:         db $DE, $F5, $40, $09, $02
DATA_1ABA57:         db $EE, $FD, $46, $09, $02
DATA_1ABA5C:         db $DE, $FD, $44, $09, $02
DATA_1ABA61:         db $FC, $FF, $4A, $09, $02
DATA_1ABA66:         db $EC, $FF, $48, $09, $02
DATA_1ABA6B:         db $ED, $F5, $42, $09, $02
DATA_1ABA70:         db $E8, $00, $4E, $07, $02
DATA_1ABA75:         db $EA, $05, $4C, $07, $02
DATA_1ABA7A:         db $ED, $F3, $42, $09, $02
DATA_1ABA7F:         db $DD, $F3, $40, $09, $02
DATA_1ABA84:         db $ED, $FB, $46, $09, $02
DATA_1ABA89:         db $DD, $FB, $44, $09, $02
DATA_1ABA8E:         db $FB, $02, $4A, $09, $02
DATA_1ABA93:         db $EB, $02, $48, $09, $02
DATA_1ABA98:         db $E8, $02, $4E, $07, $02
DATA_1ABA9D:         db $EA, $06, $4C, $07, $02
DATA_1ABAA2:         db $DE, $F2, $40, $09, $02
DATA_1ABAA7:         db $EE, $FA, $46, $09, $02
DATA_1ABAAC:         db $DE, $FA, $44, $09, $02
DATA_1ABAB1:         db $FC, $04, $4A, $09, $02
DATA_1ABAB6:         db $EC, $04, $48, $09, $02
DATA_1ABABB:         db $EE, $F3, $42, $09, $02
DATA_1ABAC0:         db $E8, $04, $4E, $07, $02
DATA_1ABAC5:         db $DE, $F0, $40, $09, $02
DATA_1ABACA:         db $DE, $F8, $44, $09, $02
DATA_1ABACF:         db $EE, $F0, $42, $09, $02
DATA_1ABAD4:         db $EE, $F8, $46, $09, $02
DATA_1ABAD9:         db $EA, $06, $4C, $07, $02
DATA_1ABADE:         db $FC, $05, $4A, $09, $02
DATA_1ABAE3:         db $EC, $05, $48, $09, $02
DATA_1ABAE8:         db $E8, $04, $4E, $07, $02
DATA_1ABAED:         db $EA, $05, $4C, $07, $02
DATA_1ABAF2:         db $EF, $ED, $42, $09, $02
DATA_1ABAF7:         db $DF, $ED, $40, $09, $02
DATA_1ABAFC:         db $EF, $F5, $46, $09, $02
DATA_1ABB01:         db $DF, $F5, $44, $09, $02
DATA_1ABB06:         db $FC, $04, $4A, $09, $02
DATA_1ABB0B:         db $EC, $04, $48, $09, $02
DATA_1ABB10:         db $E8, $02, $4E, $07, $02
DATA_1ABB15:         db $EA, $05, $4C, $07, $02
DATA_1ABB1A:         db $F0, $EE, $42, $09, $02
DATA_1ABB1F:         db $E0, $EE, $40, $09, $02
DATA_1ABB24:         db $F0, $F6, $46, $09, $02
DATA_1ABB29:         db $E0, $F6, $44, $09, $02
DATA_1ABB2E:         db $FC, $03, $4A, $09, $02
DATA_1ABB33:         db $EC, $03, $48, $09, $02
DATA_1ABB38:         db $E8, $02, $4E, $07, $02
DATA_1ABB3D:         db $EA, $05, $4C, $07, $02
DATA_1ABB42:         db $F1, $EF, $42, $09, $02
DATA_1ABB47:         db $E1, $EF, $40, $09, $02
DATA_1ABB4C:         db $F1, $F7, $46, $09, $02
DATA_1ABB51:         db $E1, $F7, $44, $09, $02
DATA_1ABB56:         db $FC, $04, $4A, $09, $02
DATA_1ABB5B:         db $EC, $04, $48, $09, $02
DATA_1ABB60:         db $E8, $02, $4E, $07, $02
DATA_1ABB65:         db $EA, $04, $4C, $07, $02
DATA_1ABB6A:         db $F2, $EF, $42, $09, $02
DATA_1ABB6F:         db $E2, $EF, $40, $09, $02
DATA_1ABB74:         db $F2, $F7, $46, $09, $02
DATA_1ABB79:         db $E2, $F7, $44, $09, $02
DATA_1ABB7E:         db $FC, $05, $4A, $09, $02
DATA_1ABB83:         db $EC, $05, $48, $09, $02
DATA_1ABB88:         db $E8, $01, $4E, $07, $02
DATA_1ABB8D:         db $EA, $05, $4C, $07, $02
DATA_1ABB92:         db $F2, $F1, $42, $09, $02
DATA_1ABB97:         db $E2, $F1, $40, $09, $02
DATA_1ABB9C:         db $F2, $F9, $46, $09, $02
DATA_1ABBA1:         db $E2, $F9, $44, $09, $02
DATA_1ABBA6:         db $FC, $04, $4A, $09, $02
DATA_1ABBAB:         db $EC, $04, $48, $09, $02
DATA_1ABBB0:         db $E8, $02, $4E, $07, $02
DATA_1ABBB5:         db $EA, $06, $4C, $07, $02
DATA_1ABBBA:         db $F1, $F3, $42, $09, $02
DATA_1ABBBF:         db $E1, $F3, $40, $09, $02
DATA_1ABBC4:         db $F1, $FB, $46, $09, $02
DATA_1ABBC9:         db $E1, $FB, $44, $09, $02
DATA_1ABBCE:         db $FC, $03, $4A, $09, $02
DATA_1ABBD3:         db $EC, $03, $48, $09, $02
DATA_1ABBD8:         db $E8, $03, $4E, $07, $02
DATA_1ABBDD:         db $EA, $07, $4C, $07, $02
DATA_1ABBE2:         db $F1, $F3, $42, $09, $02
DATA_1ABBE7:         db $E1, $F3, $40, $09, $02
DATA_1ABBEC:         db $F1, $FB, $46, $09, $02
DATA_1ABBF1:         db $E1, $FB, $44, $09, $02
DATA_1ABBF6:         db $FC, $04, $4A, $09, $02
DATA_1ABBFB:         db $EC, $04, $48, $09, $02
DATA_1ABC00:         db $E8, $04, $4E, $07, $02
DATA_1ABC05:         db $EA, $07, $4C, $07, $02
DATA_1ABC0A:         db $F1, $F1, $42, $09, $02
DATA_1ABC0F:         db $E1, $F1, $40, $09, $02
DATA_1ABC14:         db $F1, $F9, $46, $09, $02
DATA_1ABC19:         db $E1, $F9, $44, $09, $02
DATA_1ABC1E:         db $FC, $04, $4A, $09, $02
DATA_1ABC23:         db $EC, $04, $48, $09, $02
DATA_1ABC28:         db $E8, $04, $4E, $07, $02
DATA_1ABC2D:         db $EA, $07, $4C, $07, $02
DATA_1ABC32:         db $F1, $F0, $42, $09, $02
DATA_1ABC37:         db $E1, $F0, $40, $09, $02
DATA_1ABC3C:         db $F1, $F8, $46, $09, $02
DATA_1ABC41:         db $E1, $F8, $44, $09, $02
DATA_1ABC46:         db $FC, $05, $4A, $09, $02
DATA_1ABC4B:         db $EC, $05, $48, $09, $02
DATA_1ABC50:         db $E8, $04, $4E, $07, $02
DATA_1ABC55:         db $EA, $07, $4C, $07, $02
DATA_1ABC5A:         db $F1, $F2, $42, $09, $02
DATA_1ABC5F:         db $E1, $F2, $40, $09, $02
DATA_1ABC64:         db $F1, $FA, $46, $09, $02
DATA_1ABC69:         db $E1, $FA, $44, $09, $02
DATA_1ABC6E:         db $FC, $05, $4A, $09, $02
DATA_1ABC73:         db $EC, $05, $48, $09, $02
DATA_1ABC78:         db $E8, $04, $4E, $07, $02
DATA_1ABC7D:         db $EA, $07, $4C, $07, $02
DATA_1ABC82:         db $F1, $F2, $42, $09, $02
DATA_1ABC87:         db $E1, $F2, $40, $09, $02
DATA_1ABC8C:         db $F1, $FA, $46, $09, $02
DATA_1ABC91:         db $E1, $FA, $44, $09, $02
DATA_1ABC96:         db $FC, $05, $4A, $09, $02
DATA_1ABC9B:         db $EC, $05, $48, $09, $02
DATA_1ABCA0:         db $E8, $04, $4E, $07, $02
DATA_1ABCA5:         db $EB, $F2, $42, $09, $02
DATA_1ABCAA:         db $EB, $FA, $46, $09, $02
DATA_1ABCAF:         db $E3, $F2, $40, $09, $02
DATA_1ABCB4:         db $E3, $FA, $44, $09, $02
DATA_1ABCB9:         db $EA, $07, $4C, $07, $02
DATA_1ABCBE:         db $FC, $05, $4A, $09, $02
DATA_1ABCC3:         db $EC, $05, $48, $09, $02
DATA_1ABCC8:         db $E8, $04, $4E, $07, $02
DATA_1ABCCD:         db $ED, $F2, $42, $09, $02
DATA_1ABCD2:         db $ED, $FA, $46, $09, $02
DATA_1ABCD7:         db $E5, $F2, $40, $09, $02
DATA_1ABCDC:         db $E5, $FA, $44, $09, $02
DATA_1ABCE1:         db $EA, $07, $4C, $07, $02
DATA_1ABCE6:         db $FC, $05, $4A, $09, $02
DATA_1ABCEB:         db $EC, $05, $48, $09, $02
DATA_1ABCF0:         db $E8, $04, $4E, $07, $02
DATA_1ABCF5:         db $ED, $F2, $42, $09, $02
DATA_1ABCFA:         db $ED, $FA, $46, $09, $02
DATA_1ABCFF:         db $E5, $F2, $40, $09, $02
DATA_1ABD04:         db $E5, $FA, $44, $09, $02
DATA_1ABD09:         db $EA, $07, $4C, $07, $02
DATA_1ABD0E:         db $FC, $05, $4A, $09, $02
DATA_1ABD13:         db $EC, $05, $48, $09, $02
DATA_1ABD18:         db $E8, $04, $4E, $07, $02
DATA_1ABD1D:         db $ED, $FA, $42, $09, $02
DATA_1ABD22:         db $ED, $02, $46, $09, $02
DATA_1ABD27:         db $E5, $FA, $40, $09, $02
DATA_1ABD2C:         db $E5, $02, $44, $09, $02
DATA_1ABD31:         db $EA, $07, $4C, $07, $02
DATA_1ABD36:         db $FC, $05, $4A, $09, $02
DATA_1ABD3B:         db $EC, $05, $48, $09, $02
DATA_1ABD40:         db $E8, $04, $4E, $07, $02
DATA_1ABD45:         db $ED, $FB, $42, $09, $02
DATA_1ABD4A:         db $ED, $03, $46, $09, $02
DATA_1ABD4F:         db $E5, $FB, $40, $09, $02
DATA_1ABD54:         db $E5, $03, $44, $09, $02
DATA_1ABD59:         db $EA, $07, $4C, $07, $02
DATA_1ABD5E:         db $FC, $05, $4A, $09, $02
DATA_1ABD63:         db $EC, $05, $48, $09, $02
DATA_1ABD68:         db $E8, $04, $4E, $07, $02
DATA_1ABD6D:         db $ED, $F3, $42, $09, $02
DATA_1ABD72:         db $ED, $FB, $46, $09, $02
DATA_1ABD77:         db $E5, $F3, $40, $09, $02
DATA_1ABD7C:         db $E5, $FB, $44, $09, $02
DATA_1ABD81:         db $EA, $07, $4C, $07, $02
DATA_1ABD86:         db $FC, $05, $4A, $09, $02
DATA_1ABD8B:         db $EC, $05, $48, $09, $02
DATA_1ABD90:         db $E8, $04, $4E, $07, $02
DATA_1ABD95:         db $ED, $F0, $42, $09, $02
DATA_1ABD9A:         db $ED, $F8, $46, $09, $02
DATA_1ABD9F:         db $E5, $F0, $40, $09, $02
DATA_1ABDA4:         db $E5, $F8, $44, $09, $02
DATA_1ABDA9:         db $EA, $07, $4C, $07, $02
DATA_1ABDAE:         db $FC, $05, $4A, $09, $02
DATA_1ABDB3:         db $EC, $05, $48, $09, $02
DATA_1ABDB8:         db $E8, $04, $4E, $07, $02
DATA_1ABDBD:         db $E7, $F6, $42, $09, $02
DATA_1ABDC2:         db $E7, $FE, $46, $09, $02
DATA_1ABDC7:         db $DF, $F6, $40, $09, $02
DATA_1ABDCC:         db $DF, $FE, $44, $09, $02
DATA_1ABDD1:         db $EA, $07, $4C, $07, $02
DATA_1ABDD6:         db $FC, $05, $4A, $09, $02
DATA_1ABDDB:         db $EC, $05, $48, $09, $02
DATA_1ABDE0:         db $E8, $04, $4E, $07, $02
DATA_1ABDE5:         db $EB, $07, $4C, $07, $02
DATA_1ABDEA:         db $EC, $F8, $42, $09, $02
DATA_1ABDEF:         db $EC, $00, $46, $09, $02
DATA_1ABDF4:         db $DC, $F8, $40, $09, $02
DATA_1ABDF9:         db $DC, $00, $44, $09, $02
DATA_1ABDFE:         db $FD, $05, $4A, $09, $02
DATA_1ABE03:         db $ED, $05, $48, $09, $02
DATA_1ABE08:         db $E9, $04, $4E, $07, $02
DATA_1ABE0D:         db $EC, $07, $4C, $07, $02
DATA_1ABE12:         db $EC, $FB, $42, $09, $02
DATA_1ABE17:         db $EC, $03, $46, $09, $02
DATA_1ABE1C:         db $DC, $FB, $40, $09, $02
DATA_1ABE21:         db $DC, $03, $44, $09, $02
DATA_1ABE26:         db $FE, $05, $4A, $09, $02
DATA_1ABE2B:         db $EE, $05, $48, $09, $02
DATA_1ABE30:         db $EA, $04, $4E, $07, $02
DATA_1ABE35:         db $F0, $F0, $00, $01, $02
DATA_1ABE3A:         db $00, $F0, $02, $01, $02
DATA_1ABE3F:         db $F0, $00, $20, $01, $02
DATA_1ABE44:         db $00, $00, $22, $01, $02
DATA_1ABE49:         db $F0, $F8, $04, $01, $02
DATA_1ABE4E:         db $00, $F8, $06, $01, $02
DATA_1ABE53:         db $F0, $F8, $04, $01, $02
DATA_1ABE58:         db $00, $F8, $06, $01, $02
DATA_1ABE5D:         db $F0, $F0, $04, $01, $02
DATA_1ABE62:         db $00, $F0, $06, $01, $02
DATA_1ABE67:         db $F0, $00, $24, $01, $02
DATA_1ABE6C:         db $00, $00, $26, $01, $02
DATA_1ABE71:         db $EB, $F2, $42, $09, $02
DATA_1ABE76:         db $EB, $FA, $46, $09, $02
DATA_1ABE7B:         db $E3, $F2, $40, $09, $02
DATA_1ABE80:         db $E3, $FA, $44, $09, $02
DATA_1ABE85:         db $ED, $F2, $42, $09, $02
DATA_1ABE8A:         db $ED, $FA, $46, $09, $02
DATA_1ABE8F:         db $E5, $F2, $40, $09, $02
DATA_1ABE94:         db $E5, $FA, $44, $09, $02
DATA_1ABE99:         db $ED, $F2, $42, $09, $02
DATA_1ABE9E:         db $ED, $FA, $46, $09, $02
DATA_1ABEA3:         db $E5, $F2, $40, $09, $02
DATA_1ABEA8:         db $E5, $FA, $44, $09, $02
DATA_1ABEAD:         db $ED, $FA, $42, $09, $02
DATA_1ABEB2:         db $ED, $02, $46, $09, $02
DATA_1ABEB7:         db $E5, $FA, $40, $09, $02
DATA_1ABEBC:         db $E5, $02, $44, $09, $02
DATA_1ABEC1:         db $ED, $FB, $42, $09, $02
DATA_1ABEC6:         db $ED, $03, $46, $09, $02
DATA_1ABECB:         db $E5, $FB, $40, $09, $02
DATA_1ABED0:         db $E5, $03, $44, $09, $02
DATA_1ABED5:         db $ED, $F3, $42, $09, $02
DATA_1ABEDA:         db $ED, $FB, $46, $09, $02
DATA_1ABEDF:         db $E5, $F3, $40, $09, $02
DATA_1ABEE4:         db $E5, $FB, $44, $09, $02
DATA_1ABEE9:         db $ED, $F0, $42, $09, $02
DATA_1ABEEE:         db $ED, $F8, $46, $09, $02
DATA_1ABEF3:         db $E5, $F0, $40, $09, $02
DATA_1ABEF8:         db $E5, $F8, $44, $09, $02
DATA_1ABEFD:         db $E7, $F6, $42, $09, $02
DATA_1ABF02:         db $E7, $FE, $46, $09, $02
DATA_1ABF07:         db $DF, $F6, $40, $09, $02
DATA_1ABF0C:         db $DF, $FE, $44, $09, $02
DATA_1ABF11:         db $EC, $F8, $42, $09, $02
DATA_1ABF16:         db $EC, $00, $46, $09, $02
DATA_1ABF1B:         db $DC, $F8, $40, $09, $02
DATA_1ABF20:         db $DC, $00, $44, $09, $02
DATA_1ABF25:         db $EC, $FB, $42, $09, $02
DATA_1ABF2A:         db $EC, $03, $46, $09, $02
DATA_1ABF2F:         db $DC, $FB, $40, $09, $02
DATA_1ABF34:         db $DC, $03, $44, $09, $02
DATA_1ABF39:         db $00, $E8, $B2, $0C, $02
DATA_1ABF3E:         db $00, $F8, $D2, $0C, $00
DATA_1ABF43:         db $00, $D8, $92, $0C, $02
DATA_1ABF48:         db $E8, $E0, $D3, $0C, $00
DATA_1ABF4D:         db $E8, $E8, $83, $0C, $00
DATA_1ABF52:         db $E0, $E8, $82, $0C, $00
DATA_1ABF57:         db $00, $E0, $A2, $0C, $02
DATA_1ABF5C:         db $F0, $F0, $C0, $0C, $02
DATA_1ABF61:         db $F0, $E0, $A0, $0C, $02
DATA_1ABF66:         db $F0, $D0, $80, $0C, $02
DATA_1ABF6B:         db $E8, $E8, $87, $0C, $00
DATA_1ABF70:         db $E8, $E0, $D7, $0C, $00
DATA_1ABF75:         db $E8, $D8, $C7, $0C, $00
DATA_1ABF7A:         db $00, $D8, $96, $0C, $02
DATA_1ABF7F:         db $00, $E0, $A6, $0C, $02
DATA_1ABF84:         db $F8, $F0, $C5, $0C, $02
DATA_1ABF89:         db $F0, $F0, $C4, $0C, $02
DATA_1ABF8E:         db $F0, $E0, $A4, $0C, $02
DATA_1ABF93:         db $F0, $D0, $84, $0C, $02
DATA_1ABF98:         db $F0, $D0, $84, $0C, $02
DATA_1ABF9D:         db $E8, $D8, $8B, $0C, $00
DATA_1ABFA2:         db $E8, $E8, $DB, $0C, $00
DATA_1ABFA7:         db $E8, $E0, $CB, $0C, $00
DATA_1ABFAC:         db $F8, $F0, $C9, $0C, $02
DATA_1ABFB1:         db $00, $D8, $9A, $0C, $02
DATA_1ABFB6:         db $00, $E0, $AA, $0C, $02
DATA_1ABFBB:         db $F0, $F0, $C8, $0C, $02
DATA_1ABFC0:         db $F0, $E0, $A8, $0C, $02
DATA_1ABFC5:         db $F0, $D0, $88, $0C, $02
DATA_1ABFCA:         db $F0, $D0, $88, $0C, $02
DATA_1ABFCF:         db $E8, $F0, $DF, $0C, $00
DATA_1ABFD4:         db $E8, $E8, $9F, $0C, $00
DATA_1ABFD9:         db $E8, $E0, $8F, $0C, $00
DATA_1ABFDE:         db $00, $F8, $DE, $0C, $00
DATA_1ABFE3:         db $00, $D8, $9E, $0C, $00
DATA_1ABFE8:         db $00, $E0, $AE, $0C, $02
DATA_1ABFED:         db $00, $E8, $BE, $0C, $02
DATA_1ABFF2:         db $F0, $F0, $CC, $0C, $02
DATA_1ABFF7:         db $F0, $E0, $AC, $0C, $02
DATA_1ABFFC:         db $F0, $D0, $8C, $0C, $02
DATA_1AC001:         db $02, $F9, $72, $0C, $00
DATA_1AC006:         db $EA, $F9, $73, $0C, $00
DATA_1AC00B:         db $EA, $F1, $FF, $0C, $00
DATA_1AC010:         db $EA, $E9, $EF, $0C, $00
DATA_1AC015:         db $02, $D9, $FE, $0C, $00
DATA_1AC01A:         db $F2, $D1, $EC, $0C, $02
DATA_1AC01F:         db $02, $E1, $42, $0C, $02
DATA_1AC024:         db $02, $E9, $52, $0C, $02
DATA_1AC029:         db $F2, $F1, $60, $0C, $02
DATA_1AC02E:         db $F2, $E1, $40, $0C, $02
DATA_1AC033:         db $02, $F9, $76, $0C, $00
DATA_1AC038:         db $EA, $F9, $47, $0C, $00
DATA_1AC03D:         db $EA, $F1, $37, $0C, $00
DATA_1AC042:         db $EA, $E9, $27, $0C, $00
DATA_1AC047:         db $FA, $D9, $35, $0C, $02
DATA_1AC04C:         db $02, $E9, $56, $0C, $02
DATA_1AC051:         db $F2, $F1, $64, $0C, $02
DATA_1AC056:         db $F2, $E1, $44, $0C, $02
DATA_1AC05B:         db $F2, $D1, $24, $0C, $02
DATA_1AC060:         db $F2, $D1, $24, $0C, $02
DATA_1AC065:         db $02, $F9, $7A, $0C, $00
DATA_1AC06A:         db $EA, $F9, $4B, $0C, $00
DATA_1AC06F:         db $EA, $F1, $3B, $0C, $00
DATA_1AC074:         db $EA, $E9, $2B, $0C, $00
DATA_1AC079:         db $02, $E9, $5A, $0C, $02
DATA_1AC07E:         db $F2, $F1, $68, $0C, $02
DATA_1AC083:         db $F2, $E1, $48, $0C, $02
DATA_1AC088:         db $F2, $D1, $28, $0C, $02
DATA_1AC08D:         db $FA, $D9, $39, $0C, $02
DATA_1AC092:         db $FA, $D9, $39, $0C, $02
DATA_1AC097:         db $EA, $F9, $4F, $0C, $00
DATA_1AC09C:         db $EA, $F1, $3F, $0C, $00
DATA_1AC0A1:         db $EA, $E9, $2F, $0C, $00
DATA_1AC0A6:         db $02, $F9, $7E, $0C, $00
DATA_1AC0AB:         db $02, $E9, $5E, $0C, $02
DATA_1AC0B0:         db $F2, $F1, $6C, $0C, $02
DATA_1AC0B5:         db $F2, $E1, $4C, $0C, $02
DATA_1AC0BA:         db $F2, $D1, $2C, $0C, $02
DATA_1AC0BF:         db $FA, $D9, $3D, $0C, $02
DATA_1AC0C4:         db $FA, $D9, $3D, $0C, $02
DATA_1AC0C9:         db $F0, $F0, $00, $01, $02
DATA_1AC0CE:         db $00, $F0, $02, $01, $02
DATA_1AC0D3:         db $F0, $00, $20, $01, $02
DATA_1AC0D8:         db $00, $00, $22, $01, $02
DATA_1AC0DD:         db $F0, $F0, $04, $01, $02
DATA_1AC0E2:         db $00, $F0, $06, $01, $02
DATA_1AC0E7:         db $F0, $00, $24, $01, $02
DATA_1AC0EC:         db $00, $00, $26, $01, $02
DATA_1AC0F1:         db $F0, $F0, $08, $01, $02
DATA_1AC0F6:         db $00, $F0, $0A, $01, $02
DATA_1AC0FB:         db $F0, $00, $28, $01, $02
DATA_1AC100:         db $00, $00, $2A, $01, $02
DATA_1AC105:         db $F0, $F0, $0C, $01, $02
DATA_1AC10A:         db $00, $F0, $0E, $01, $02
DATA_1AC10F:         db $F0, $00, $2C, $01, $02
DATA_1AC114:         db $00, $00, $2E, $01, $02
DATA_1AC119:         db $08, $00, $A2, $05, $02
DATA_1AC11E:         db $F8, $00, $A0, $05, $02
DATA_1AC123:         db $08, $F0, $82, $05, $02
DATA_1AC128:         db $F8, $F0, $80, $05, $02
DATA_1AC12D:         db $08, $00, $A6, $05, $02
DATA_1AC132:         db $F8, $00, $A4, $05, $02
DATA_1AC137:         db $08, $F0, $86, $05, $02
DATA_1AC13C:         db $F8, $F0, $84, $05, $02
DATA_1AC141:         db $08, $00, $AA, $05, $02
DATA_1AC146:         db $F8, $00, $A8, $05, $02
DATA_1AC14B:         db $08, $F0, $8A, $05, $02
DATA_1AC150:         db $F8, $F0, $88, $05, $02
DATA_1AC155:         db $FF, $F6, $04, $0A, $02
DATA_1AC15A:         db $F7, $F6, $03, $0A, $02
DATA_1AC15F:         db $FF, $E6, $01, $0A, $02
DATA_1AC164:         db $F7, $E6, $00, $0A, $02
DATA_1AC169:         db $FB, $06, $4C, $07, $02
DATA_1AC16E:         db $EC, $FC, $48, $09, $02
DATA_1AC173:         db $E0, $F0, $44, $09, $02
DATA_1AC178:         db $F0, $F0, $46, $09, $02
DATA_1AC17D:         db $FC, $FC, $4A, $09, $02
DATA_1AC182:         db $E8, $01, $4E, $07, $02
DATA_1AC187:         db $F0, $E8, $42, $09, $02
DATA_1AC18C:         db $E0, $E8, $40, $09, $02
DATA_1AC191:         db $FF, $F5, $0A, $0A, $02
DATA_1AC196:         db $F7, $F5, $09, $0A, $02
DATA_1AC19B:         db $FF, $E5, $07, $0A, $02
DATA_1AC1A0:         db $F7, $E5, $06, $0A, $02
DATA_1AC1A5:         db $F9, $06, $4C, $07, $02
DATA_1AC1AA:         db $FC, $FC, $4A, $09, $02
DATA_1AC1AF:         db $EC, $FC, $48, $09, $02
DATA_1AC1B4:         db $EE, $04, $4E, $07, $02
DATA_1AC1B9:         db $E0, $F0, $44, $09, $02
DATA_1AC1BE:         db $F0, $F0, $46, $09, $02
DATA_1AC1C3:         db $F0, $E8, $42, $09, $02
DATA_1AC1C8:         db $E0, $E8, $40, $09, $02
DATA_1AC1CD:         db $FF, $F5, $E4, $0A, $02
DATA_1AC1D2:         db $F7, $F5, $E3, $0A, $02
DATA_1AC1D7:         db $FF, $E5, $E1, $0A, $02
DATA_1AC1DC:         db $F7, $E5, $E0, $0A, $02
DATA_1AC1E1:         db $FC, $FC, $4A, $09, $02
DATA_1AC1E6:         db $EC, $FC, $48, $09, $02
DATA_1AC1EB:         db $F2, $06, $4C, $07, $02
DATA_1AC1F0:         db $F0, $03, $4E, $07, $02
DATA_1AC1F5:         db $F0, $E8, $42, $09, $02
DATA_1AC1FA:         db $E0, $E8, $40, $09, $02
DATA_1AC1FF:         db $F0, $F0, $46, $09, $02
DATA_1AC204:         db $E0, $F0, $44, $09, $02
DATA_1AC209:         db $FF, $F6, $EA, $0A, $02
DATA_1AC20E:         db $F7, $F6, $E9, $0A, $02
DATA_1AC213:         db $FF, $E6, $E7, $0A, $02
DATA_1AC218:         db $F7, $E6, $E6, $0A, $02
DATA_1AC21D:         db $EE, $06, $4C, $07, $02
DATA_1AC222:         db $EC, $FC, $48, $09, $02
DATA_1AC227:         db $FC, $FC, $4A, $09, $02
DATA_1AC22C:         db $F8, $03, $4E, $07, $02
DATA_1AC231:         db $F0, $E8, $42, $09, $02
DATA_1AC236:         db $E0, $E8, $40, $09, $02
DATA_1AC23B:         db $F0, $F0, $46, $09, $02
DATA_1AC240:         db $E0, $F0, $44, $09, $02
DATA_1AC245:         db $00, $F7, $04, $0A, $02
DATA_1AC24A:         db $F8, $F7, $03, $0A, $02
DATA_1AC24F:         db $00, $E7, $01, $0A, $02
DATA_1AC254:         db $F8, $E7, $00, $0A, $02
DATA_1AC259:         db $FC, $FC, $4A, $09, $02
DATA_1AC25E:         db $FD, $01, $4C, $07, $02
DATA_1AC263:         db $E9, $06, $4E, $07, $02
DATA_1AC268:         db $EC, $FC, $48, $09, $02
DATA_1AC26D:         db $F0, $E8, $42, $09, $02
DATA_1AC272:         db $E0, $E8, $40, $09, $02
DATA_1AC277:         db $F0, $F0, $46, $09, $02
DATA_1AC27C:         db $E0, $F0, $44, $09, $02
DATA_1AC281:         db $FF, $F6, $0A, $0A, $02
DATA_1AC286:         db $F7, $F6, $09, $0A, $02
DATA_1AC28B:         db $FF, $E6, $07, $0A, $02
DATA_1AC290:         db $F7, $E6, $06, $0A, $02
DATA_1AC295:         db $EB, $07, $4C, $07, $02
DATA_1AC29A:         db $EC, $FC, $48, $09, $02
DATA_1AC29F:         db $FC, $FC, $4A, $09, $02
DATA_1AC2A4:         db $F8, $03, $4E, $07, $02
DATA_1AC2A9:         db $F0, $E8, $42, $09, $02
DATA_1AC2AE:         db $E0, $E8, $40, $09, $02
DATA_1AC2B3:         db $F0, $F0, $46, $09, $02
DATA_1AC2B8:         db $E0, $F0, $44, $09, $02
DATA_1AC2BD:         db $00, $F6, $E4, $0A, $02
DATA_1AC2C2:         db $F8, $F6, $E3, $0A, $02
DATA_1AC2C7:         db $00, $E6, $E1, $0A, $02
DATA_1AC2CC:         db $F8, $E6, $E0, $0A, $02
DATA_1AC2D1:         db $E0, $F0, $44, $09, $02
DATA_1AC2D6:         db $F0, $F0, $46, $09, $02
DATA_1AC2DB:         db $EC, $FC, $48, $09, $02
DATA_1AC2E0:         db $FC, $FC, $4A, $09, $02
DATA_1AC2E5:         db $F4, $07, $4C, $07, $02
DATA_1AC2EA:         db $F3, $02, $4E, $07, $02
DATA_1AC2EF:         db $F0, $E8, $42, $09, $02
DATA_1AC2F4:         db $E0, $E8, $40, $09, $02
DATA_1AC2F9:         db $00, $F6, $EA, $0A, $02
DATA_1AC2FE:         db $F8, $F6, $E9, $0A, $02
DATA_1AC303:         db $00, $E6, $E7, $0A, $02
DATA_1AC308:         db $F8, $E6, $E6, $0A, $02
DATA_1AC30D:         db $E0, $F0, $44, $09, $02
DATA_1AC312:         db $F0, $F0, $46, $09, $02
DATA_1AC317:         db $F8, $06, $4C, $07, $02
DATA_1AC31C:         db $EC, $FC, $48, $09, $02
DATA_1AC321:         db $EA, $01, $4E, $07, $02
DATA_1AC326:         db $FC, $FC, $4A, $09, $02
DATA_1AC32B:         db $F0, $E8, $42, $09, $02
DATA_1AC330:         db $E0, $E8, $40, $09, $02
DATA_1AC335:         db $14, $0B, $44, $00, $00
DATA_1AC33A:         db $09, $0D, $44, $00, $00
DATA_1AC33F:         db $F4, $0B, $44, $00, $00
DATA_1AC344:         db $FF, $0D, $44, $00, $00
DATA_1AC349:         db $13, $07, $44, $00, $00
DATA_1AC34E:         db $09, $08, $44, $00, $00
DATA_1AC353:         db $F5, $07, $44, $00, $00
DATA_1AC358:         db $FF, $08, $44, $00, $00
DATA_1AC35D:         db $12, $04, $44, $00, $00
DATA_1AC362:         db $08, $04, $44, $00, $00
DATA_1AC367:         db $F6, $04, $44, $00, $00
DATA_1AC36C:         db $00, $04, $44, $00, $00
DATA_1AC371:         db $10, $02, $44, $00, $00
DATA_1AC376:         db $08, $01, $44, $00, $00
DATA_1AC37B:         db $F8, $02, $44, $00, $00
DATA_1AC380:         db $00, $01, $44, $00, $00
DATA_1AC385:         db $0F, $01, $44, $00, $00
DATA_1AC38A:         db $07, $FF, $44, $00, $00
DATA_1AC38F:         db $F9, $01, $44, $00, $00
DATA_1AC394:         db $01, $FF, $44, $00, $00
DATA_1AC399:         db $0D, $01, $44, $00, $00
DATA_1AC39E:         db $07, $FE, $44, $00, $00
DATA_1AC3A3:         db $FB, $01, $44, $00, $00
DATA_1AC3A8:         db $01, $FE, $44, $00, $00
DATA_1AC3AD:         db $0C, $01, $54, $00, $00
DATA_1AC3B2:         db $06, $FD, $54, $00, $00
DATA_1AC3B7:         db $FC, $01, $54, $00, $00
DATA_1AC3BC:         db $02, $FD, $54, $00, $00
DATA_1AC3C1:         db $0A, $01, $45, $00, $00
DATA_1AC3C6:         db $06, $FD, $45, $00, $00
DATA_1AC3CB:         db $FE, $01, $45, $00, $00
DATA_1AC3D0:         db $02, $FD, $45, $00, $00
DATA_1AC3D5:         db $09, $01, $55, $00, $00
DATA_1AC3DA:         db $05, $FE, $55, $00, $00
DATA_1AC3DF:         db $FF, $01, $55, $00, $00
DATA_1AC3E4:         db $03, $FE, $55, $00, $00
DATA_1AC3E9:         db $06, $01, $45, $00, $00
DATA_1AC3EE:         db $05, $FF, $45, $00, $00
DATA_1AC3F3:         db $01, $01, $45, $00, $00
DATA_1AC3F8:         db $03, $FF, $45, $00, $00
DATA_1AC3FD:         db $06, $02, $54, $00, $00
DATA_1AC402:         db $04, $01, $54, $00, $00
DATA_1AC407:         db $02, $02, $54, $00, $00
DATA_1AC40C:         db $04, $01, $44, $00, $00
DATA_1AC411:         db $04, $04, $44, $00, $00
DATA_1AC416:         db $04, $04, $44, $00, $00
DATA_1AC41B:         db $04, $04, $44, $00, $00
DATA_1AC420:         db $04, $04, $44, $00, $00
DATA_1AC425:         db $00, $00, $D4, $02, $00
DATA_1AC42A:         db $07, $07, $D4, $C2, $00
DATA_1AC42F:         db $00, $07, $D4, $82, $00
DATA_1AC434:         db $07, $00, $D4, $42, $00
DATA_1AC439:         db $F8, $00, $00, $00, $00
DATA_1AC43E:         db $00, $00, $01, $00, $00
DATA_1AC443:         db $08, $00, $02, $00, $00
DATA_1AC448:         db $F8, $08, $10, $00, $00
DATA_1AC44D:         db $00, $08, $11, $00, $00
DATA_1AC452:         db $08, $08, $12, $00, $00
DATA_1AC457:         db $F8, $00, $03, $00, $00
DATA_1AC45C:         db $00, $00, $04, $00, $00
DATA_1AC461:         db $08, $00, $05, $00, $00
DATA_1AC466:         db $F8, $08, $13, $00, $00
DATA_1AC46B:         db $00, $08, $14, $00, $00
DATA_1AC470:         db $08, $08, $15, $00, $00
DATA_1AC475:         db $F8, $00, $06, $00, $00
DATA_1AC47A:         db $00, $00, $07, $00, $00
DATA_1AC47F:         db $08, $00, $08, $00, $00
DATA_1AC484:         db $F8, $08, $16, $00, $00
DATA_1AC489:         db $00, $08, $17, $00, $00
DATA_1AC48E:         db $08, $08, $18, $00, $00
DATA_1AC493:         db $F8, $00, $03, $00, $00
DATA_1AC498:         db $00, $00, $04, $00, $00
DATA_1AC49D:         db $08, $00, $05, $00, $00
DATA_1AC4A2:         db $F8, $08, $13, $00, $00
DATA_1AC4A7:         db $00, $08, $14, $00, $00
DATA_1AC4AC:         db $08, $08, $15, $00, $00
DATA_1AC4B1:         db $F8, $F8, $09, $00, $02
DATA_1AC4B6:         db $00, $F8, $0A, $00, $02
DATA_1AC4BB:         db $F8, $00, $22, $00, $02
DATA_1AC4C0:         db $00, $00, $23, $00, $02
DATA_1AC4C5:         db $F6, $F0, $0C, $00, $02
DATA_1AC4CA:         db $00, $F0, $20, $00, $02
DATA_1AC4CF:         db $F8, $F4, $09, $00, $02
DATA_1AC4D4:         db $00, $F4, $0A, $00, $02
DATA_1AC4D9:         db $F8, $00, $22, $00, $02
DATA_1AC4DE:         db $00, $00, $23, $00, $02
DATA_1AC4E3:         db $00, $EA, $20, $00, $02
DATA_1AC4E8:         db $F6, $EA, $0C, $00, $02
DATA_1AC4ED:         db $F8, $F2, $09, $00, $02
DATA_1AC4F2:         db $00, $F2, $0A, $00, $02
DATA_1AC4F7:         db $F8, $00, $22, $00, $02
DATA_1AC4FC:         db $00, $00, $23, $00, $02
DATA_1AC501:         db $00, $E6, $20, $00, $02
DATA_1AC506:         db $F6, $E6, $0C, $00, $02
DATA_1AC50B:         db $F8, $F1, $09, $00, $02
DATA_1AC510:         db $00, $F1, $0A, $00, $02
DATA_1AC515:         db $F8, $00, $25, $00, $02
DATA_1AC51A:         db $00, $00, $26, $00, $02
DATA_1AC51F:         db $00, $E3, $20, $00, $02
DATA_1AC524:         db $F6, $E3, $0C, $00, $02
DATA_1AC529:         db $F8, $F0, $09, $00, $02
DATA_1AC52E:         db $00, $F0, $0A, $00, $02
DATA_1AC533:         db $F8, $00, $28, $00, $02
DATA_1AC538:         db $00, $00, $29, $00, $02
DATA_1AC53D:         db $00, $E0, $20, $00, $02
DATA_1AC542:         db $F6, $E0, $0C, $00, $02
DATA_1AC547:         db $FE, $F7, $20, $00, $02
DATA_1AC54C:         db $F8, $00, $00, $00, $02
DATA_1AC551:         db $00, $00, $01, $00, $02
DATA_1AC556:         db $F4, $F7, $0C, $00, $02
DATA_1AC55B:         db $00, $00, $01, $00, $00
DATA_1AC560:         db $F4, $F7, $0C, $00, $00
DATA_1AC565:         db $F8, $F0, $09, $00, $02
DATA_1AC56A:         db $00, $F0, $0A, $00, $02
DATA_1AC56F:         db $F8, $00, $28, $00, $02
DATA_1AC574:         db $00, $00, $29, $00, $02
DATA_1AC579:         db $00, $E0, $20, $00, $02
DATA_1AC57E:         db $F6, $E0, $0E, $00, $02
DATA_1AC583:         db $F8, $F0, $09, $00, $02
DATA_1AC588:         db $00, $F0, $0A, $00, $02
DATA_1AC58D:         db $F8, $00, $28, $00, $02
DATA_1AC592:         db $00, $00, $29, $00, $02
DATA_1AC597:         db $00, $E0, $0C, $00, $02
DATA_1AC59C:         db $F6, $E0, $0C, $00, $02
DATA_1AC5A1:         db $F8, $F0, $09, $00, $02
DATA_1AC5A6:         db $00, $F0, $0A, $00, $02
DATA_1AC5AB:         db $F8, $00, $28, $00, $02
DATA_1AC5B0:         db $00, $00, $29, $00, $02
DATA_1AC5B5:         db $00, $E0, $0E, $00, $02
DATA_1AC5BA:         db $F6, $E0, $20, $00, $02
DATA_1AC5BF:         db $FC, $00, $2B, $00, $00
DATA_1AC5C4:         db $04, $00, $2C, $00, $00
DATA_1AC5C9:         db $FC, $08, $3B, $00, $00
DATA_1AC5CE:         db $04, $08, $3C, $00, $00
DATA_1AC5D3:         db $04, $00, $2B, $40, $02
DATA_1AC5D8:         db $0C, $00, $2B, $40, $00
DATA_1AC5DD:         db $06, $00, $2B, $40, $02
DATA_1AC5E2:         db $FA, $00, $2B, $00, $00
DATA_1AC5E7:         db $02, $00, $2C, $00, $00
DATA_1AC5EC:         db $FA, $08, $3B, $00, $00
DATA_1AC5F1:         db $02, $08, $3C, $00, $00
DATA_1AC5F6:         db $FA, $00, $2B, $00, $00
DATA_1AC5FB:         db $06, $00, $2D, $40, $02
DATA_1AC600:         db $FA, $00, $2D, $00, $00
DATA_1AC605:         db $02, $00, $2E, $00, $00
DATA_1AC60A:         db $FA, $08, $3D, $00, $00
DATA_1AC60F:         db $02, $08, $3E, $00, $00
DATA_1AC614:         db $FA, $00, $2D, $00, $00
DATA_1AC619:         db $08, $00, $2D, $40, $02
DATA_1AC61E:         db $F8, $00, $2D, $00, $00
DATA_1AC623:         db $00, $00, $2E, $00, $00
DATA_1AC628:         db $F8, $08, $3D, $00, $00
DATA_1AC62D:         db $00, $08, $3E, $00, $00
DATA_1AC632:         db $F8, $00, $2D, $00, $00
DATA_1AC637:         db $00, $00, $00, $00, $02
DATA_1AC63C:         db $00, $00, $00, $00, $00
DATA_1AC641:         db $08, $08, $11, $00, $00
DATA_1AC646:         db $00, $00, $02, $00, $02
DATA_1AC64B:         db $00, $F8, $04, $00, $00
DATA_1AC650:         db $08, $F8, $05, $00, $00
DATA_1AC655:         db $00, $00, $0E, $00, $02
DATA_1AC65A:         db $00, $F8, $14, $00, $00
DATA_1AC65F:         db $08, $F8, $15, $00, $00
DATA_1AC664:         db $00, $00, $08, $00, $02
DATA_1AC669:         db $00, $F0, $06, $00, $02
DATA_1AC66E:         db $00, $F0, $06, $00, $02
DATA_1AC673:         db $00, $00, $0C, $00, $02
DATA_1AC678:         db $00, $F0, $0A, $00, $02
DATA_1AC67D:         db $00, $F0, $0A, $00, $02
DATA_1AC682:         db $08, $08, $18, $04, $00
DATA_1AC687:         db $08, $00, $08, $04, $00
DATA_1AC68C:         db $10, $09, $19, $04, $00
DATA_1AC691:         db $10, $01, $09, $04, $00
DATA_1AC696:         db $F8, $FF, $06, $04, $02
DATA_1AC69B:         db $08, $07, $18, $04, $00
DATA_1AC6A0:         db $08, $FF, $08, $04, $00
DATA_1AC6A5:         db $10, $08, $1A, $04, $00
DATA_1AC6AA:         db $10, $00, $0A, $04, $00
DATA_1AC6AF:         db $F8, $00, $06, $04, $02
DATA_1AC6B4:         db $08, $08, $18, $04, $00
DATA_1AC6B9:         db $08, $00, $08, $04, $00
DATA_1AC6BE:         db $10, $07, $1B, $04, $00
DATA_1AC6C3:         db $10, $FF, $0B, $04, $00
DATA_1AC6C8:         db $F8, $01, $06, $04, $02
DATA_1AC6CD:         db $08, $09, $18, $04, $00
DATA_1AC6D2:         db $08, $01, $08, $04, $00
DATA_1AC6D7:         db $10, $08, $1C, $04, $00
DATA_1AC6DC:         db $10, $00, $0C, $04, $00
DATA_1AC6E1:         db $F8, $00, $06, $04, $02
DATA_1AC6E6:         db $00, $08, $00, $40, $00
DATA_1AC6EB:         db $08, $08, $00, $00, $00
DATA_1AC6F0:         db $F8, $F0, $00, $00, $02
DATA_1AC6F5:         db $08, $F0, $00, $00, $02
DATA_1AC6FA:         db $F8, $00, $00, $00, $02
DATA_1AC6FF:         db $08, $00, $00, $00, $02
DATA_1AC704:         db $E8, $08, $E7, $00, $02
DATA_1AC709:         db $08, $08, $E7, $00, $02
DATA_1AC70E:         db $08, $E8, $E7, $00, $02
DATA_1AC713:         db $E8, $E8, $E7, $00, $02
DATA_1AC718:         db $F8, $0D, $E7, $00, $02
DATA_1AC71D:         db $0D, $F8, $E7, $00, $02
DATA_1AC722:         db $E3, $F8, $E7, $00, $02
DATA_1AC727:         db $F8, $E3, $E7, $00, $02
DATA_1AC72C:         db $EB, $EB, $E5, $00, $02
DATA_1AC731:         db $05, $EB, $E5, $00, $02
DATA_1AC736:         db $05, $05, $E5, $00, $02
DATA_1AC73B:         db $EB, $05, $E5, $00, $02
DATA_1AC740:         db $F8, $0A, $E5, $00, $02
DATA_1AC745:         db $F8, $E6, $E5, $00, $02
DATA_1AC74A:         db $0A, $F8, $E5, $00, $02
DATA_1AC74F:         db $E6, $F8, $E5, $00, $02
DATA_1AC754:         db $02, $02, $E3, $00, $02
DATA_1AC759:         db $EE, $02, $E3, $00, $02
DATA_1AC75E:         db $02, $EE, $E3, $00, $02
DATA_1AC763:         db $EE, $EE, $E3, $00, $02
DATA_1AC768:         db $F8, $07, $E3, $00, $02
DATA_1AC76D:         db $07, $F8, $E3, $00, $02
DATA_1AC772:         db $E9, $F8, $E3, $00, $02
DATA_1AC777:         db $F8, $E9, $E3, $00, $02
DATA_1AC77C:         db $00, $00, $E3, $00, $02
DATA_1AC781:         db $F0, $00, $E3, $00, $02
DATA_1AC786:         db $F0, $F0, $E3, $00, $02
DATA_1AC78B:         db $00, $F0, $E3, $00, $02
DATA_1AC790:         db $04, $F8, $E3, $00, $02
DATA_1AC795:         db $ED, $F8, $E3, $00, $02
DATA_1AC79A:         db $F8, $04, $E3, $00, $02
DATA_1AC79F:         db $F8, $EC, $E3, $00, $02
DATA_1AC7A4:         db $F8, $00, $E3, $00, $02
DATA_1AC7A9:         db $F8, $F0, $E3, $00, $02
DATA_1AC7AE:         db $00, $F8, $E3, $00, $02
DATA_1AC7B3:         db $F0, $F8, $E3, $00, $00
DATA_1AC7B8:         db $F8, $F8, $E4, $00, $00
DATA_1AC7BD:         db $F0, $00, $F3, $00, $00
DATA_1AC7C2:         db $F8, $00, $F4, $00, $00
DATA_1AC7C7:         db $F8, $00, $F4, $00, $00
DATA_1AC7CC:         db $F8, $FC, $E3, $00, $02
DATA_1AC7D1:         db $FC, $F8, $E3, $00, $02
DATA_1AC7D6:         db $F8, $F4, $E3, $00, $02
DATA_1AC7DB:         db $F4, $F8, $E3, $00, $00
DATA_1AC7E0:         db $FC, $F8, $E4, $00, $00
DATA_1AC7E5:         db $F4, $00, $F3, $00, $00
DATA_1AC7EA:         db $FC, $00, $F4, $00, $00
DATA_1AC7EF:         db $FC, $00, $F4, $00, $00
DATA_1AC7F4:         db $F8, $F8, $E3, $00, $00
DATA_1AC7F9:         db $00, $F8, $E4, $00, $00
DATA_1AC7FE:         db $F8, $00, $F3, $00, $00
DATA_1AC803:         db $00, $00, $F4, $00, $00
DATA_1AC808:         db $F8, $F8, $E3, $00, $00
DATA_1AC80D:         db $00, $F8, $E4, $00, $00
DATA_1AC812:         db $F8, $00, $F3, $00, $00
DATA_1AC817:         db $00, $00, $F4, $00, $00
DATA_1AC81C:         db $00, $00, $42, $C4, $02
DATA_1AC821:         db $F0, $00, $42, $84, $02
DATA_1AC826:         db $00, $F0, $42, $44, $02
DATA_1AC82B:         db $F0, $F0, $42, $04, $02
DATA_1AC830:         db $F0, $F0, $42, $04, $00
DATA_1AC835:         db $F0, $F8, $52, $04, $00
DATA_1AC83A:         db $F0, $00, $52, $84, $00
DATA_1AC83F:         db $F0, $08, $42, $84, $00
DATA_1AC844:         db $0B, $FF, $27, $04, $00
DATA_1AC849:         db $0B, $EF, $25, $04, $02
DATA_1AC84E:         db $F8, $00, $00, $04, $02
DATA_1AC853:         db $08, $00, $02, $04, $02
DATA_1AC858:         db $FB, $EF, $25, $44, $02
DATA_1AC85D:         db $03, $FF, $27, $44, $00
DATA_1AC862:         db $01, $E8, $2D, $44, $00
DATA_1AC867:         db $0D, $E8, $2D, $04, $00
DATA_1AC86C:         db $0D, $E8, $2D, $04, $00
DATA_1AC871:         db $0C, $F6, $28, $04, $02
DATA_1AC876:         db $F8, $00, $00, $04, $02
DATA_1AC87B:         db $08, $00, $04, $04, $02
DATA_1AC880:         db $08, $00, $04, $04, $00
DATA_1AC885:         db $FA, $F6, $28, $44, $02
DATA_1AC88A:         db $FD, $F1, $2D, $44, $00
DATA_1AC88F:         db $11, $F1, $2D, $04, $00
DATA_1AC894:         db $11, $F1, $2D, $04, $00
DATA_1AC899:         db $11, $F1, $2D, $04, $00
DATA_1AC89E:         db $0E, $00, $2A, $04, $00
DATA_1AC8A3:         db $16, $00, $2B, $04, $00
DATA_1AC8A8:         db $0E, $08, $3A, $04, $00
DATA_1AC8AD:         db $16, $08, $3B, $04, $00
DATA_1AC8B2:         db $08, $00, $06, $04, $02
DATA_1AC8B7:         db $F8, $00, $00, $04, $02
DATA_1AC8BC:         db $F8, $00, $00, $04, $00
DATA_1AC8C1:         db $F8, $00, $00, $04, $00
DATA_1AC8C6:         db $F8, $00, $2A, $44, $02
DATA_1AC8CB:         db $0D, $08, $2C, $04, $00
DATA_1AC8D0:         db $15, $08, $2D, $04, $00
DATA_1AC8D5:         db $0D, $10, $3C, $04, $00
DATA_1AC8DA:         db $15, $10, $3D, $04, $00
DATA_1AC8DF:         db $08, $00, $02, $04, $02
DATA_1AC8E4:         db $F8, $00, $00, $04, $02
DATA_1AC8E9:         db $F8, $00, $00, $04, $00
DATA_1AC8EE:         db $F8, $00, $00, $04, $00
DATA_1AC8F3:         db $F9, $08, $2C, $44, $02
DATA_1AC8F8:         db $0C, $08, $37, $04, $00
DATA_1AC8FD:         db $0C, $10, $2E, $04, $02
DATA_1AC902:         db $0C, $10, $2E, $04, $00
DATA_1AC907:         db $F8, $00, $00, $04, $02
DATA_1AC90C:         db $F8, $00, $00, $04, $00
DATA_1AC911:         db $08, $00, $04, $04, $02
DATA_1AC916:         db $08, $00, $04, $04, $02
DATA_1AC91B:         db $02, $08, $37, $44, $00
DATA_1AC920:         db $FA, $10, $2E, $44, $02
DATA_1AC925:         db $0C, $0A, $28, $84, $02
DATA_1AC92A:         db $08, $00, $06, $04, $02
DATA_1AC92F:         db $F8, $00, $00, $04, $02
DATA_1AC934:         db $F8, $00, $00, $04, $00
DATA_1AC939:         db $F8, $00, $00, $04, $00
DATA_1AC93E:         db $FA, $0A, $28, $C4, $02
DATA_1AC943:         db $11, $17, $2D, $84, $00
DATA_1AC948:         db $11, $17, $2D, $84, $00
DATA_1AC94D:         db $FD, $17, $2D, $C4, $00
DATA_1AC952:         db $0E, $00, $2A, $84, $02
DATA_1AC957:         db $08, $00, $02, $04, $00
DATA_1AC95C:         db $10, $00, $03, $04, $00
DATA_1AC961:         db $08, $08, $12, $04, $00
DATA_1AC966:         db $10, $08, $13, $04, $00
DATA_1AC96B:         db $F8, $00, $00, $04, $02
DATA_1AC970:         db $F8, $00, $00, $04, $00
DATA_1AC975:         db $F8, $00, $00, $04, $00
DATA_1AC97A:         db $F8, $00, $2A, $C4, $02
DATA_1AC97F:         db $0D, $F8, $2C, $84, $02
DATA_1AC984:         db $08, $00, $04, $04, $00
DATA_1AC989:         db $10, $00, $04, $04, $00
DATA_1AC98E:         db $08, $08, $14, $04, $00
DATA_1AC993:         db $10, $08, $15, $04, $00
DATA_1AC998:         db $F8, $00, $00, $04, $02
DATA_1AC99D:         db $F8, $00, $00, $04, $00
DATA_1AC9A2:         db $F8, $00, $00, $04, $00
DATA_1AC9A7:         db $F9, $F8, $2C, $C4, $02
DATA_1AC9AC:         db $0C, $00, $37, $84, $00
DATA_1AC9B1:         db $0C, $F0, $2E, $84, $02
DATA_1AC9B6:         db $0C, $F0, $3E, $84, $00
DATA_1AC9BB:         db $F8, $00, $00, $04, $02
DATA_1AC9C0:         db $F8, $00, $00, $04, $00
DATA_1AC9C5:         db $08, $00, $06, $04, $02
DATA_1AC9CA:         db $08, $00, $06, $04, $02
DATA_1AC9CF:         db $02, $00, $37, $C4, $00
DATA_1AC9D4:         db $FA, $F0, $2E, $C4, $02
DATA_1AC9D9:         db $17, $00, $22, $04, $02
DATA_1AC9DE:         db $0F, $04, $34, $04, $00
DATA_1AC9E3:         db $F8, $00, $00, $04, $02
DATA_1AC9E8:         db $27, $00, $24, $04, $00
DATA_1AC9ED:         db $27, $00, $24, $04, $00
DATA_1AC9F2:         db $00, $04, $34, $44, $00
DATA_1AC9F7:         db $E8, $00, $24, $44, $00
DATA_1AC9FC:         db $F0, $00, $22, $44, $02
DATA_1ACA01:         db $08, $00, $02, $04, $02
DATA_1ACA06:         db $17, $00, $22, $04, $02
DATA_1ACA0B:         db $0F, $04, $34, $04, $00
DATA_1ACA10:         db $F8, $00, $00, $04, $02
DATA_1ACA15:         db $27, $00, $24, $04, $00
DATA_1ACA1A:         db $00, $04, $34, $44, $00
DATA_1ACA1F:         db $E8, $00, $24, $44, $00
DATA_1ACA24:         db $F0, $00, $22, $44, $02
DATA_1ACA29:         db $08, $00, $04, $04, $02
DATA_1ACA2E:         db $08, $00, $04, $04, $02
DATA_1ACA33:         db $17, $00, $22, $04, $02
DATA_1ACA38:         db $0F, $04, $34, $04, $00
DATA_1ACA3D:         db $F8, $00, $00, $04, $02
DATA_1ACA42:         db $27, $00, $24, $04, $00
DATA_1ACA47:         db $00, $04, $34, $44, $00
DATA_1ACA4C:         db $E8, $00, $24, $44, $00
DATA_1ACA51:         db $F0, $00, $22, $44, $02
DATA_1ACA56:         db $08, $00, $06, $04, $02
DATA_1ACA5B:         db $08, $00, $06, $04, $02
DATA_1ACA60:         db $03, $07, $08, $04, $02
DATA_1ACA65:         db $03, $07, $08, $04, $00
DATA_1ACA6A:         db $08, $FF, $02, $04, $00
DATA_1ACA6F:         db $08, $FF, $02, $04, $00
DATA_1ACA74:         db $F8, $FF, $00, $04, $00
DATA_1ACA79:         db $00, $FF, $01, $04, $00
DATA_1ACA7E:         db $F8, $07, $10, $04, $00
DATA_1ACA83:         db $00, $07, $11, $04, $00
DATA_1ACA88:         db $00, $07, $11, $04, $00
DATA_1ACA8D:         db $03, $06, $0A, $04, $02
DATA_1ACA92:         db $03, $06, $0A, $04, $00
DATA_1ACA97:         db $08, $FE, $04, $04, $00
DATA_1ACA9C:         db $08, $FE, $04, $04, $00
DATA_1ACAA1:         db $F8, $FE, $00, $04, $00
DATA_1ACAA6:         db $00, $FE, $01, $04, $00
DATA_1ACAAB:         db $F8, $06, $10, $04, $00
DATA_1ACAB0:         db $00, $06, $11, $04, $00
DATA_1ACAB5:         db $00, $06, $11, $04, $00
DATA_1ACABA:         db $03, $06, $0C, $04, $02
DATA_1ACABF:         db $03, $06, $0C, $04, $00
DATA_1ACAC4:         db $08, $FE, $06, $04, $00
DATA_1ACAC9:         db $08, $FE, $06, $04, $00
DATA_1ACACE:         db $F8, $FE, $00, $04, $00
DATA_1ACAD3:         db $00, $FE, $01, $04, $00
DATA_1ACAD8:         db $F8, $06, $10, $04, $00
DATA_1ACADD:         db $00, $06, $11, $04, $00
DATA_1ACAE2:         db $00, $06, $11, $04, $00
DATA_1ACAE7:         db $17, $00, $22, $04, $02
DATA_1ACAEC:         db $0F, $04, $34, $04, $00
DATA_1ACAF1:         db $03, $08, $0C, $04, $02
DATA_1ACAF6:         db $F8, $00, $00, $04, $02
DATA_1ACAFB:         db $27, $00, $24, $04, $00
DATA_1ACB00:         db $00, $04, $34, $44, $00
DATA_1ACB05:         db $E8, $00, $24, $44, $00
DATA_1ACB0A:         db $F0, $00, $22, $44, $02
DATA_1ACB0F:         db $08, $00, $02, $04, $00
DATA_1ACB14:         db $17, $00, $22, $04, $02
DATA_1ACB19:         db $0F, $04, $34, $04, $00
DATA_1ACB1E:         db $03, $08, $0C, $04, $02
DATA_1ACB23:         db $F8, $00, $00, $04, $02
DATA_1ACB28:         db $27, $00, $24, $04, $00
DATA_1ACB2D:         db $00, $04, $34, $44, $00
DATA_1ACB32:         db $E8, $00, $24, $44, $00
DATA_1ACB37:         db $F0, $00, $22, $44, $02
DATA_1ACB3C:         db $08, $00, $04, $04, $00
DATA_1ACB41:         db $17, $00, $22, $04, $02
DATA_1ACB46:         db $0F, $04, $34, $04, $00
DATA_1ACB4B:         db $03, $08, $0C, $04, $02
DATA_1ACB50:         db $F8, $00, $00, $04, $02
DATA_1ACB55:         db $27, $00, $24, $04, $00
DATA_1ACB5A:         db $00, $04, $34, $44, $00
DATA_1ACB5F:         db $E8, $00, $24, $44, $00
DATA_1ACB64:         db $F0, $00, $22, $44, $02
DATA_1ACB69:         db $08, $00, $06, $04, $00
DATA_1ACB6E:         db $03, $01, $1C, $04, $00
DATA_1ACB73:         db $04, $10, $0C, $04, $00
DATA_1ACB78:         db $00, $00, $00, $04, $02
DATA_1ACB7D:         db $04, $FF, $1D, $04, $00
DATA_1ACB82:         db $03, $0D, $0C, $04, $00
DATA_1ACB87:         db $00, $00, $02, $04, $02
DATA_1ACB8C:         db $00, $08, $14, $04, $00
DATA_1ACB91:         db $05, $FE, $1D, $04, $00
DATA_1ACB96:         db $00, $00, $04, $04, $02
DATA_1ACB9B:         db $00, $08, $16, $04, $00
DATA_1ACBA0:         db $00, $00, $06, $04, $00
DATA_1ACBA5:         db $00, $00, $06, $04, $02
DATA_1ACBAA:         db $00, $00, $0A, $04, $00
DATA_1ACBAF:         db $05, $0A, $1D, $04, $00
DATA_1ACBB4:         db $00, $00, $0A, $04, $02
DATA_1ACBB9:         db $04, $0C, $1D, $04, $00
DATA_1ACBBE:         db $04, $FE, $0C, $C4, $00
DATA_1ACBC3:         db $00, $04, $02, $84, $02
DATA_1ACBC8:         db $04, $10, $1C, $04, $00
DATA_1ACBCD:         db $04, $00, $0C, $C4, $00
DATA_1ACBD2:         db $00, $08, $00, $84, $02
DATA_1ACBD7:         db $04, $10, $1C, $04, $00
DATA_1ACBDC:         db $04, $00, $0C, $C4, $00
DATA_1ACBE1:         db $00, $08, $00, $84, $02
DATA_1ACBE6:         db $04, $10, $1D, $04, $00
DATA_1ACBEB:         db $04, $02, $0C, $C4, $00
DATA_1ACBF0:         db $00, $08, $02, $84, $02
DATA_1ACBF5:         db $00, $08, $15, $C4, $00
DATA_1ACBFA:         db $03, $10, $1D, $04, $00
DATA_1ACBFF:         db $00, $08, $04, $C4, $02
DATA_1ACC04:         db $03, $0D, $1C, $04, $00
DATA_1ACC09:         db $08, $08, $09, $04, $00
DATA_1ACC0E:         db $00, $08, $08, $04, $02
DATA_1ACC13:         db $03, $09, $1C, $04, $00
DATA_1ACC18:         db $08, $10, $0A, $C4, $00
DATA_1ACC1D:         db $00, $08, $0A, $C4, $02
DATA_1ACC22:         db $03, $05, $1C, $04, $00
DATA_1ACC27:         db $04, $12, $0C, $04, $00
DATA_1ACC2C:         db $00, $04, $02, $44, $02
DATA_1ACC31:         db $03, $01, $1C, $04, $00
DATA_1ACC36:         db $04, $10, $0C, $04, $00
DATA_1ACC3B:         db $00, $00, $00, $04, $02
DATA_1ACC40:         db $03, $10, $0D, $04, $00
DATA_1ACC45:         db $04, $00, $0C, $84, $00
DATA_1ACC4A:         db $00, $08, $00, $84, $02
DATA_1ACC4F:         db $00, $10, $0D, $44, $00
DATA_1ACC54:         db $03, $00, $0C, $84, $00
DATA_1ACC59:         db $00, $08, $0E, $04, $02
DATA_1ACC5E:         db $00, $10, $1F, $44, $00
DATA_1ACC63:         db $05, $00, $0C, $C4, $00
DATA_1ACC68:         db $00, $08, $0E, $44, $02
DATA_1ACC6D:         db $00, $10, $01, $C4, $00
DATA_1ACC72:         db $04, $00, $0C, $C4, $00
DATA_1ACC77:         db $00, $08, $00, $C4, $02
DATA_1ACC7C:         db $00, $10, $00, $84, $00
DATA_1ACC81:         db $04, $00, $0C, $84, $00
DATA_1ACC86:         db $00, $08, $00, $84, $02
DATA_1ACC8B:         db $00, $10, $1E, $04, $00
DATA_1ACC90:         db $03, $00, $0C, $84, $00
DATA_1ACC95:         db $00, $08, $0E, $04, $02
DATA_1ACC9A:         db $08, $10, $0D, $04, $00
DATA_1ACC9F:         db $05, $00, $0C, $C4, $00
DATA_1ACCA4:         db $00, $08, $0E, $44, $02
DATA_1ACCA9:         db $05, $10, $0D, $44, $00
DATA_1ACCAE:         db $04, $00, $0C, $C4, $00
DATA_1ACCB3:         db $00, $08, $00, $C4, $02
DATA_1ACCB8:         db $0C, $05, $1B, $04, $00
DATA_1ACCBD:         db $FC, $00, $00, $04, $02
DATA_1ACCC2:         db $FC, $00, $02, $04, $02
DATA_1ACCC7:         db $0A, $02, $1B, $84, $00
DATA_1ACCCC:         db $FC, $00, $04, $04, $00
DATA_1ACCD1:         db $FC, $00, $04, $04, $02
DATA_1ACCD6:         db $04, $00, $07, $04, $00
DATA_1ACCDB:         db $FC, $00, $06, $04, $02
DATA_1ACCE0:         db $F8, $04, $1A, $04, $00
DATA_1ACCE5:         db $00, $00, $08, $04, $02
DATA_1ACCEA:         db $FC, $05, $1B, $44, $00
DATA_1ACCEF:         db $04, $00, $00, $44, $02
DATA_1ACCF4:         db $00, $00, $0C, $04, $00
DATA_1ACCF9:         db $00, $00, $0C, $04, $02
DATA_1ACCFE:         db $00, $08, $1E, $04, $00
DATA_1ACD03:         db $00, $00, $0E, $04, $02
DATA_1ACD08:         db $08, $08, $0C, $C4, $00
DATA_1ACD0D:         db $00, $00, $0C, $C4, $02
DATA_1ACD12:         db $08, $00, $1E, $C4, $00
DATA_1ACD17:         db $00, $00, $0E, $C4, $02
DATA_1ACD1C:         db $FC, $05, $1B, $44, $00
DATA_1ACD21:         db $04, $00, $00, $44, $02
DATA_1ACD26:         db $04, $00, $02, $44, $02
DATA_1ACD2B:         db $FE, $02, $1B, $C4, $00
DATA_1ACD30:         db $0C, $00, $04, $44, $00
DATA_1ACD35:         db $04, $00, $04, $44, $02
DATA_1ACD3A:         db $04, $00, $07, $44, $00
DATA_1ACD3F:         db $04, $00, $06, $44, $02
DATA_1ACD44:         db $10, $04, $1A, $44, $00
DATA_1ACD49:         db $00, $00, $08, $44, $02
DATA_1ACD4E:         db $0C, $05, $1B, $04, $00
DATA_1ACD53:         db $FC, $00, $00, $04, $02
DATA_1ACD58:         db $F8, $F8, $80, $01, $02
DATA_1ACD5D:         db $08, $F8, $82, $01, $02
DATA_1ACD62:         db $F8, $08, $A0, $01, $02
DATA_1ACD67:         db $08, $08, $A2, $01, $02
DATA_1ACD6C:         db $00, $00, $7C, $04, $00
DATA_1ACD71:         db $00, $00, $7D, $02, $00
DATA_1ACD76:         db $00, $00, $8C, $06, $00
DATA_1ACD7B:         db $00, $00, $00, $00, $00
DATA_1ACD80:         db $00, $00, $00, $00, $00
DATA_1ACD85:         db $00, $00, $00, $00, $00
DATA_1ACD8A:         db $00, $00, $CA, $00, $02
DATA_1ACD8F:         db $F9, $F9, $C6, $40, $00
DATA_1ACD94:         db $F9, $01, $D6, $40, $00
DATA_1ACD99:         db $0F, $F9, $C6, $00, $00
DATA_1ACD9E:         db $0F, $01, $D6, $00, $00
DATA_1ACDA3:         db $00, $FF, $CC, $00, $02
DATA_1ACDA8:         db $F9, $01, $D7, $40, $00
DATA_1ACDAD:         db $F6, $FE, $C7, $40, $00
DATA_1ACDB2:         db $0F, $01, $D7, $00, $00
DATA_1ACDB7:         db $12, $FE, $C7, $00, $00
DATA_1ACDBC:         db $00, $FE, $EA, $00, $02
DATA_1ACDC1:         db $F9, $04, $CE, $40, $00
DATA_1ACDC6:         db $F1, $04, $DE, $40, $00
DATA_1ACDCB:         db $17, $04, $DE, $00, $00
DATA_1ACDD0:         db $0F, $04, $CE, $00, $00
DATA_1ACDD5:         db $00, $FD, $CC, $00, $02
DATA_1ACDDA:         db $F9, $04, $CF, $40, $00
DATA_1ACDDF:         db $0F, $04, $CF, $00, $00
DATA_1ACDE4:         db $F7, $08, $DF, $40, $00
DATA_1ACDE9:         db $11, $08, $DF, $00, $00
DATA_1ACDEE:         db $07, $07, $7E, $80, $02
DATA_1ACDF3:         db $F9, $07, $7E, $C0, $02
DATA_1ACDF8:         db $07, $F9, $7E, $00, $02
DATA_1ACDFD:         db $F9, $F9, $9C, $00, $02
DATA_1ACE02:         db $00, $00, $DD, $0B, $02
DATA_1ACE07:         db $06, $08, $7E, $80, $02
DATA_1ACE0C:         db $FA, $08, $7E, $C0, $02
DATA_1ACE11:         db $06, $F8, $7E, $00, $02
DATA_1ACE16:         db $FA, $F8, $9C, $00, $02
DATA_1ACE1B:         db $00, $00, $DD, $0B, $02
DATA_1ACE20:         db $08, $06, $7E, $80, $02
DATA_1ACE25:         db $F8, $06, $7E, $C0, $02
DATA_1ACE2A:         db $08, $FA, $7E, $00, $02
DATA_1ACE2F:         db $F8, $FA, $9C, $00, $02
DATA_1ACE34:         db $00, $00, $DD, $0B, $02
DATA_1ACE39:         db $08, $08, $9E, $00, $00
DATA_1ACE3E:         db $00, $08, $9E, $00, $00
DATA_1ACE43:         db $FF, $FB, $AE, $03, $02
DATA_1ACE48:         db $08, $FC, $E2, $03, $02
DATA_1ACE4D:         db $F8, $FC, $E0, $03, $02
DATA_1ACE52:         db $08, $EC, $C2, $03, $02
DATA_1ACE57:         db $F8, $EC, $C0, $03, $02
DATA_1ACE5C:         db $08, $08, $9E, $00, $00
DATA_1ACE61:         db $00, $08, $9E, $00, $00
DATA_1ACE66:         db $FE, $FC, $AE, $03, $02
DATA_1ACE6B:         db $08, $FC, $E6, $03, $02
DATA_1ACE70:         db $F8, $FC, $E4, $03, $02
DATA_1ACE75:         db $08, $EC, $C6, $03, $02
DATA_1ACE7A:         db $F8, $EC, $C4, $03, $02
DATA_1ACE7F:         db $08, $08, $9E, $00, $00
DATA_1ACE84:         db $00, $08, $9E, $00, $00
DATA_1ACE89:         db $FE, $FD, $AE, $03, $02
DATA_1ACE8E:         db $F8, $FC, $E2, $03, $02
DATA_1ACE93:         db $08, $FC, $E0, $03, $02
DATA_1ACE98:         db $F8, $EC, $C2, $03, $02
DATA_1ACE9D:         db $08, $EC, $C0, $03, $02
DATA_1ACEA2:         db $08, $08, $9E, $00, $00
DATA_1ACEA7:         db $00, $08, $9E, $00, $00
DATA_1ACEAC:         db $FF, $FC, $AE, $03, $02
DATA_1ACEB1:         db $F8, $FC, $E6, $03, $02
DATA_1ACEB6:         db $08, $FC, $E4, $03, $02
DATA_1ACEBB:         db $F8, $EC, $C6, $03, $02
DATA_1ACEC0:         db $08, $EC, $C4, $03, $02
DATA_1ACEC5:         db $0A, $09, $2F, $00, $00
DATA_1ACECA:         db $FA, $02, $2F, $40, $00
DATA_1ACECF:         db $FF, $FA, $AE, $03, $02
DATA_1ACED4:         db $08, $FB, $E2, $03, $02
DATA_1ACED9:         db $F8, $FB, $E0, $03, $02
DATA_1ACEDE:         db $08, $EB, $C2, $03, $02
DATA_1ACEE3:         db $F8, $EB, $C0, $03, $02
DATA_1ACEE8:         db $0C, $09, $2F, $00, $00
DATA_1ACEED:         db $FC, $05, $2F, $00, $00
DATA_1ACEF2:         db $FF, $FA, $AE, $03, $02
DATA_1ACEF7:         db $08, $FB, $E2, $03, $02
DATA_1ACEFC:         db $F8, $FB, $E0, $03, $02
DATA_1ACF01:         db $08, $EB, $C2, $03, $02
DATA_1ACF06:         db $F8, $EB, $C0, $03, $02
DATA_1ACF0B:         db $0D, $07, $2F, $00, $00
DATA_1ACF10:         db $FE, $08, $2E, $00, $00
DATA_1ACF15:         db $FE, $FB, $AE, $03, $02
DATA_1ACF1A:         db $07, $FC, $E2, $03, $02
DATA_1ACF1F:         db $F7, $FC, $E0, $03, $02
DATA_1ACF24:         db $07, $EC, $C2, $03, $02
DATA_1ACF29:         db $F7, $EC, $C0, $03, $02
DATA_1ACF2E:         db $0B, $08, $2E, $C0, $00
DATA_1ACF33:         db $00, $08, $9E, $00, $00
DATA_1ACF38:         db $FE, $FC, $AE, $03, $02
DATA_1ACF3D:         db $07, $FD, $E2, $03, $02
DATA_1ACF42:         db $F7, $FD, $E0, $03, $02
DATA_1ACF47:         db $07, $ED, $C2, $03, $02
DATA_1ACF4C:         db $F7, $ED, $C0, $03, $02
DATA_1ACF51:         db $09, $08, $2F, $00, $00
DATA_1ACF56:         db $03, $08, $9E, $00, $00
DATA_1ACF5B:         db $FF, $FD, $AE, $03, $02
DATA_1ACF60:         db $08, $FE, $E2, $03, $02
DATA_1ACF65:         db $F8, $FE, $E0, $03, $02
DATA_1ACF6A:         db $08, $EE, $C2, $03, $02
DATA_1ACF6F:         db $F8, $EE, $C0, $03, $02
DATA_1ACF74:         db $04, $08, $2F, $40, $00
DATA_1ACF79:         db $05, $08, $9E, $00, $00
DATA_1ACF7E:         db $FF, $FC, $AE, $03, $02
DATA_1ACF83:         db $08, $FD, $E2, $03, $02
DATA_1ACF88:         db $F8, $FD, $E0, $03, $02
DATA_1ACF8D:         db $08, $ED, $C2, $03, $02
DATA_1ACF92:         db $F8, $ED, $C0, $03, $02
DATA_1ACF97:         db $01, $07, $2E, $40, $00
DATA_1ACF9C:         db $07, $08, $2E, $40, $00
DATA_1ACFA1:         db $FF, $FB, $AE, $03, $02
DATA_1ACFA6:         db $08, $FC, $E2, $03, $02
DATA_1ACFAB:         db $F8, $FC, $E0, $03, $02
DATA_1ACFB0:         db $08, $EC, $C2, $03, $02
DATA_1ACFB5:         db $F8, $EC, $C0, $03, $02
DATA_1ACFBA:         db $FD, $04, $2E, $00, $00
DATA_1ACFBF:         db $08, $08, $2E, $40, $00
DATA_1ACFC4:         db $FF, $FA, $AE, $03, $02
DATA_1ACFC9:         db $08, $FB, $E2, $03, $02
DATA_1ACFCE:         db $F8, $FB, $E0, $03, $02
DATA_1ACFD3:         db $08, $EB, $C2, $03, $02
DATA_1ACFD8:         db $F8, $EB, $C0, $03, $02
DATA_1ACFDD:         db $00, $09, $2F, $40, $00
DATA_1ACFE2:         db $08, $09, $2F, $00, $00
DATA_1ACFE7:         db $FF, $F7, $AE, $03, $02
DATA_1ACFEC:         db $08, $F8, $E2, $03, $02
DATA_1ACFF1:         db $F8, $F8, $E0, $03, $02
DATA_1ACFF6:         db $08, $E8, $C2, $03, $02
DATA_1ACFFB:         db $F8, $E8, $C0, $03, $02
DATA_1AD000:         db $FD, $05, $2E, $40, $00
DATA_1AD005:         db $0B, $05, $2E, $00, $00
DATA_1AD00A:         db $FF, $F7, $AE, $03, $02
DATA_1AD00F:         db $08, $F8, $E2, $03, $02
DATA_1AD014:         db $F8, $F8, $E0, $03, $02
DATA_1AD019:         db $08, $E8, $C2, $03, $02
DATA_1AD01E:         db $F8, $E8, $C0, $03, $02
DATA_1AD023:         db $FE, $02, $9E, $00, $00
DATA_1AD028:         db $0B, $02, $9E, $00, $00
DATA_1AD02D:         db $FF, $F7, $AE, $03, $02
DATA_1AD032:         db $08, $F8, $E2, $03, $02
DATA_1AD037:         db $F8, $F8, $E0, $03, $02
DATA_1AD03C:         db $08, $E8, $C2, $03, $02
DATA_1AD041:         db $F8, $E8, $C0, $03, $02
DATA_1AD046:         db $FD, $01, $2E, $00, $00
DATA_1AD04B:         db $0B, $01, $2E, $40, $00
DATA_1AD050:         db $FF, $F7, $AE, $03, $02
DATA_1AD055:         db $08, $F8, $E2, $03, $02
DATA_1AD05A:         db $F8, $F8, $E0, $03, $02
DATA_1AD05F:         db $08, $E8, $C2, $03, $02
DATA_1AD064:         db $F8, $E8, $C0, $03, $02
DATA_1AD069:         db $FB, $01, $2F, $00, $00
DATA_1AD06E:         db $0D, $01, $2F, $40, $00
DATA_1AD073:         db $FF, $F7, $AE, $03, $02
DATA_1AD078:         db $08, $F8, $E2, $03, $02
DATA_1AD07D:         db $F8, $F8, $E0, $03, $02
DATA_1AD082:         db $08, $E8, $C2, $03, $02
DATA_1AD087:         db $F8, $E8, $C0, $03, $02
DATA_1AD08C:         db $00, $0D, $2E, $00, $00
DATA_1AD091:         db $08, $0D, $2E, $40, $00
DATA_1AD096:         db $00, $FD, $AE, $03, $02
DATA_1AD09B:         db $08, $F8, $E2, $03, $02
DATA_1AD0A0:         db $F8, $F8, $E0, $03, $02
DATA_1AD0A5:         db $08, $E8, $C2, $03, $02
DATA_1AD0AA:         db $F8, $E8, $C0, $03, $02
DATA_1AD0AF:         db $F8, $00, $00, $00, $02
DATA_1AD0B4:         db $08, $00, $00, $40, $02
DATA_1AD0B9:         db $F8, $00, $02, $00, $02
DATA_1AD0BE:         db $08, $00, $04, $40, $02
DATA_1AD0C3:         db $F8, $00, $04, $00, $02
DATA_1AD0C8:         db $08, $00, $02, $40, $02
DATA_1AD0CD:         db $00, $F9, $06, $08, $02
DATA_1AD0D2:         db $08, $08, $0A, $02, $00
DATA_1AD0D7:         db $00, $08, $1A, $02, $00
DATA_1AD0DC:         db $00, $F9, $00, $08, $02
DATA_1AD0E1:         db $08, $08, $0A, $02, $00
DATA_1AD0E6:         db $00, $08, $1A, $02, $00
DATA_1AD0EB:         db $00, $F9, $02, $08, $02
DATA_1AD0F0:         db $08, $08, $0A, $02, $00
DATA_1AD0F5:         db $00, $08, $1A, $02, $00
DATA_1AD0FA:         db $00, $F8, $04, $08, $02
DATA_1AD0FF:         db $08, $08, $0A, $02, $00
DATA_1AD104:         db $00, $08, $1A, $02, $00
DATA_1AD109:         db $00, $F9, $08, $08, $02
DATA_1AD10E:         db $08, $08, $0A, $02, $00
DATA_1AD113:         db $00, $08, $1A, $02, $00
DATA_1AD118:         db $00, $F9, $04, $08, $02
DATA_1AD11D:         db $08, $08, $0A, $02, $00
DATA_1AD122:         db $00, $08, $1A, $02, $00
DATA_1AD127:         db $00, $FA, $06, $08, $02
DATA_1AD12C:         db $08, $08, $0A, $02, $00
DATA_1AD131:         db $00, $08, $1A, $02, $00
DATA_1AD136:         db $00, $FA, $08, $08, $02
DATA_1AD13B:         db $08, $08, $0A, $02, $00
DATA_1AD140:         db $00, $08, $1A, $02, $00
DATA_1AD145:         db $00, $F8, $04, $08, $02
DATA_1AD14A:         db $08, $08, $0A, $02, $00
DATA_1AD14F:         db $00, $08, $1A, $02, $00
DATA_1AD154:         db $00, $F9, $06, $08, $02
DATA_1AD159:         db $08, $08, $0A, $02, $00
DATA_1AD15E:         db $00, $08, $1A, $02, $00
DATA_1AD163:         db $00, $F9, $08, $08, $02
DATA_1AD168:         db $08, $08, $0A, $02, $00
DATA_1AD16D:         db $00, $08, $1A, $02, $00
DATA_1AD172:         db $FD, $08, $07, $00, $00
DATA_1AD177:         db $0C, $EB, $06, $00, $00
DATA_1AD17C:         db $01, $DA, $0A, $00, $02
DATA_1AD181:         db $01, $E9, $0A, $00, $02
DATA_1AD186:         db $03, $E0, $00, $00, $02
DATA_1AD18B:         db $00, $EB, $06, $00, $00
DATA_1AD190:         db $09, $08, $17, $00, $00
DATA_1AD195:         db $FD, $08, $07, $00, $00
DATA_1AD19A:         db $01, $F8, $0A, $00, $02
DATA_1AD19F:         db $0B, $E9, $06, $00, $00
DATA_1AD1A4:         db $09, $D7, $08, $00, $00
DATA_1AD1A9:         db $01, $DA, $0D, $40, $02
DATA_1AD1AE:         db $01, $E9, $0D, $40, $02
DATA_1AD1B3:         db $03, $DF, $00, $00, $02
DATA_1AD1B8:         db $01, $EB, $06, $00, $00
DATA_1AD1BD:         db $08, $05, $17, $00, $00
DATA_1AD1C2:         db $FE, $08, $07, $00, $00
DATA_1AD1C7:         db $01, $F8, $0D, $40, $02
DATA_1AD1CC:         db $09, $E8, $06, $00, $00
DATA_1AD1D1:         db $07, $D5, $08, $00, $00
DATA_1AD1D6:         db $00, $DA, $0C, $00, $02
DATA_1AD1DB:         db $00, $E9, $0C, $00, $02
DATA_1AD1E0:         db $03, $DE, $00, $00, $02
DATA_1AD1E5:         db $01, $EB, $06, $00, $00
DATA_1AD1EA:         db $06, $03, $17, $00, $00
DATA_1AD1EF:         db $FE, $08, $07, $00, $00
DATA_1AD1F4:         db $00, $F8, $0C, $00, $02
DATA_1AD1F9:         db $08, $E7, $06, $00, $00
DATA_1AD1FE:         db $06, $D4, $08, $00, $00
DATA_1AD203:         db $00, $DA, $0B, $40, $02
DATA_1AD208:         db $00, $E9, $0B, $40, $02
DATA_1AD20D:         db $03, $DD, $02, $00, $02
DATA_1AD212:         db $02, $EB, $06, $00, $00
DATA_1AD217:         db $05, $02, $17, $00, $00
DATA_1AD21C:         db $FF, $08, $07, $00, $00
DATA_1AD221:         db $00, $F8, $0B, $40, $02
DATA_1AD226:         db $06, $E6, $06, $00, $00
DATA_1AD22B:         db $04, $D3, $08, $00, $00
DATA_1AD230:         db $FF, $DA, $0E, $00, $02
DATA_1AD235:         db $FF, $E9, $0E, $00, $02
DATA_1AD23A:         db $02, $EB, $06, $00, $00
DATA_1AD23F:         db $03, $DC, $02, $00, $02
DATA_1AD244:         db $03, $01, $07, $00, $00
DATA_1AD249:         db $FF, $08, $07, $00, $00
DATA_1AD24E:         db $FF, $F8, $0E, $00, $02
DATA_1AD253:         db $05, $E6, $06, $00, $00
DATA_1AD258:         db $03, $D3, $08, $00, $00
DATA_1AD25D:         db $FF, $DA, $09, $40, $02
DATA_1AD262:         db $FF, $E9, $09, $40, $02
DATA_1AD267:         db $03, $EB, $06, $00, $00
DATA_1AD26C:         db $03, $DC, $02, $00, $02
DATA_1AD271:         db $02, $00, $07, $00, $00
DATA_1AD276:         db $00, $08, $07, $00, $00
DATA_1AD27B:         db $FF, $F8, $09, $40, $02
DATA_1AD280:         db $03, $E6, $06, $00, $00
DATA_1AD285:         db $03, $DC, $04, $00, $02
DATA_1AD28A:         db $01, $D3, $08, $00, $00
DATA_1AD28F:         db $FF, $DA, $09, $40, $02
DATA_1AD294:         db $FF, $E9, $09, $40, $02
DATA_1AD299:         db $05, $EB, $06, $00, $00
DATA_1AD29E:         db $00, $00, $07, $00, $00
DATA_1AD2A3:         db $02, $08, $07, $00, $00
DATA_1AD2A8:         db $FF, $F8, $09, $40, $02
DATA_1AD2AD:         db $02, $E6, $06, $00, $00
DATA_1AD2B2:         db $03, $DC, $04, $00, $02
DATA_1AD2B7:         db $00, $D3, $08, $00, $00
DATA_1AD2BC:         db $FF, $DA, $0E, $00, $02
DATA_1AD2C1:         db $FF, $E9, $0E, $00, $02
DATA_1AD2C6:         db $06, $EB, $06, $00, $00
DATA_1AD2CB:         db $FF, $01, $07, $00, $00
DATA_1AD2D0:         db $03, $08, $07, $00, $00
DATA_1AD2D5:         db $FF, $F8, $0E, $00, $02
DATA_1AD2DA:         db $02, $E7, $06, $00, $00
DATA_1AD2DF:         db $03, $DD, $04, $00, $02
DATA_1AD2E4:         db $00, $D4, $08, $00, $00
DATA_1AD2E9:         db $00, $DA, $0B, $40, $02
DATA_1AD2EE:         db $00, $E9, $0B, $40, $02
DATA_1AD2F3:         db $08, $EB, $06, $00, $00
DATA_1AD2F8:         db $FF, $02, $18, $00, $00
DATA_1AD2FD:         db $05, $08, $07, $00, $00
DATA_1AD302:         db $00, $F8, $0B, $40, $02
DATA_1AD307:         db $01, $E8, $06, $00, $00
DATA_1AD30C:         db $03, $DE, $04, $00, $02
DATA_1AD311:         db $FF, $D6, $08, $00, $00
DATA_1AD316:         db $00, $DA, $0C, $00, $02
DATA_1AD31B:         db $00, $E9, $0C, $00, $02
DATA_1AD320:         db $09, $EB, $06, $00, $00
DATA_1AD325:         db $FE, $03, $18, $00, $00
DATA_1AD32A:         db $06, $08, $07, $00, $00
DATA_1AD32F:         db $00, $F8, $0C, $00, $02
DATA_1AD334:         db $01, $E9, $06, $00, $00
DATA_1AD339:         db $03, $DF, $04, $00, $02
DATA_1AD33E:         db $FF, $D7, $08, $00, $00
DATA_1AD343:         db $01, $DA, $0D, $40, $02
DATA_1AD348:         db $01, $E9, $0D, $40, $02
DATA_1AD34D:         db $0B, $EB, $06, $00, $00
DATA_1AD352:         db $FE, $05, $18, $00, $00
DATA_1AD357:         db $08, $08, $07, $00, $00
DATA_1AD35C:         db $01, $F8, $0D, $40, $02
DATA_1AD361:         db $FD, $08, $18, $00, $00
DATA_1AD366:         db $00, $EB, $06, $00, $00
DATA_1AD36B:         db $03, $E0, $04, $00, $02
DATA_1AD370:         db $01, $DA, $0A, $00, $02
DATA_1AD375:         db $01, $E9, $0A, $00, $02
DATA_1AD37A:         db $0C, $EB, $06, $00, $00
DATA_1AD37F:         db $09, $08, $07, $00, $00
DATA_1AD384:         db $FD, $08, $18, $00, $00
DATA_1AD389:         db $01, $F8, $0A, $00, $02
DATA_1AD38E:         db $FD, $08, $07, $00, $00
DATA_1AD393:         db $00, $EB, $06, $00, $00
DATA_1AD398:         db $03, $E0, $04, $00, $02
DATA_1AD39D:         db $01, $DA, $0A, $00, $02
DATA_1AD3A2:         db $01, $E9, $0A, $00, $02
DATA_1AD3A7:         db $0C, $EB, $06, $00, $00
DATA_1AD3AC:         db $09, $08, $17, $00, $00
DATA_1AD3B1:         db $FD, $08, $07, $00, $00
DATA_1AD3B6:         db $01, $F8, $0A, $00, $02
DATA_1AD3BB:         db $01, $EB, $06, $00, $00
DATA_1AD3C0:         db $09, $D7, $08, $00, $00
DATA_1AD3C5:         db $03, $DF, $04, $00, $02
DATA_1AD3CA:         db $01, $DA, $0D, $40, $02
DATA_1AD3CF:         db $01, $E9, $0D, $40, $02
DATA_1AD3D4:         db $0B, $E9, $06, $00, $00
DATA_1AD3D9:         db $08, $05, $17, $00, $00
DATA_1AD3DE:         db $FE, $08, $07, $00, $00
DATA_1AD3E3:         db $01, $F8, $0D, $40, $02
DATA_1AD3E8:         db $01, $EB, $06, $00, $00
DATA_1AD3ED:         db $03, $DE, $04, $00, $02
DATA_1AD3F2:         db $07, $D5, $08, $00, $00
DATA_1AD3F7:         db $00, $DA, $0C, $00, $02
DATA_1AD3FC:         db $00, $E9, $0C, $00, $02
DATA_1AD401:         db $09, $E8, $06, $00, $00
DATA_1AD406:         db $06, $03, $17, $00, $00
DATA_1AD40B:         db $FE, $08, $07, $00, $00
DATA_1AD410:         db $00, $F8, $0C, $00, $02
DATA_1AD415:         db $05, $02, $17, $00, $00
DATA_1AD41A:         db $02, $EB, $06, $00, $00
DATA_1AD41F:         db $03, $DD, $04, $00, $02
DATA_1AD424:         db $06, $D4, $08, $00, $00
DATA_1AD429:         db $00, $DA, $0B, $40, $02
DATA_1AD42E:         db $00, $E9, $0B, $40, $02
DATA_1AD433:         db $05, $02, $17, $00, $00
DATA_1AD438:         db $FF, $08, $07, $00, $00
DATA_1AD43D:         db $00, $F8, $0B, $40, $02
DATA_1AD442:         db $03, $01, $07, $00, $00
DATA_1AD447:         db $02, $EB, $06, $00, $00
DATA_1AD44C:         db $03, $DC, $04, $00, $02
DATA_1AD451:         db $04, $D3, $08, $00, $00
DATA_1AD456:         db $FF, $DA, $0E, $00, $02
DATA_1AD45B:         db $FF, $E9, $0E, $00, $02
DATA_1AD460:         db $03, $01, $07, $00, $00
DATA_1AD465:         db $FF, $08, $07, $00, $00
DATA_1AD46A:         db $FF, $F8, $0E, $00, $02
DATA_1AD46F:         db $01, $00, $07, $00, $00
DATA_1AD474:         db $02, $EB, $06, $00, $00
DATA_1AD479:         db $03, $DC, $04, $00, $02
DATA_1AD47E:         db $02, $D3, $08, $00, $00
DATA_1AD483:         db $FE, $DA, $09, $40, $02
DATA_1AD488:         db $FE, $E9, $09, $40, $02
DATA_1AD48D:         db $01, $00, $07, $00, $00
DATA_1AD492:         db $FF, $08, $07, $00, $00
DATA_1AD497:         db $FE, $F8, $09, $40, $02
DATA_1AD49C:         db $04, $EB, $06, $00, $00
DATA_1AD4A1:         db $00, $D3, $08, $00, $00
DATA_1AD4A6:         db $FE, $DA, $09, $40, $02
DATA_1AD4AB:         db $FE, $E9, $09, $40, $02
DATA_1AD4B0:         db $FF, $00, $07, $00, $00
DATA_1AD4B5:         db $FE, $F8, $09, $40, $02
DATA_1AD4BA:         db $02, $DC, $02, $00, $02
DATA_1AD4BF:         db $02, $E6, $06, $00, $00
DATA_1AD4C4:         db $01, $08, $07, $00, $00
DATA_1AD4C9:         db $06, $EB, $06, $00, $00
DATA_1AD4CE:         db $00, $D3, $08, $00, $00
DATA_1AD4D3:         db $FF, $DA, $0E, $00, $02
DATA_1AD4D8:         db $FF, $E9, $0E, $00, $02
DATA_1AD4DD:         db $03, $DC, $02, $00, $02
DATA_1AD4E2:         db $02, $E6, $06, $00, $00
DATA_1AD4E7:         db $FF, $01, $07, $00, $00
DATA_1AD4EC:         db $03, $08, $07, $00, $00
DATA_1AD4F1:         db $FF, $F8, $0E, $00, $02
DATA_1AD4F6:         db $08, $EB, $06, $00, $00
DATA_1AD4FB:         db $00, $D4, $08, $00, $00
DATA_1AD500:         db $00, $DA, $0B, $40, $02
DATA_1AD505:         db $00, $E9, $0B, $40, $02
DATA_1AD50A:         db $03, $DD, $02, $00, $02
DATA_1AD50F:         db $02, $E7, $06, $00, $00
DATA_1AD514:         db $FF, $02, $18, $00, $00
DATA_1AD519:         db $05, $08, $07, $00, $00
DATA_1AD51E:         db $00, $F8, $0B, $40, $02
DATA_1AD523:         db $09, $EB, $06, $00, $00
DATA_1AD528:         db $FF, $D6, $08, $00, $00
DATA_1AD52D:         db $00, $DA, $0C, $00, $02
DATA_1AD532:         db $00, $E9, $0C, $00, $02
DATA_1AD537:         db $03, $DE, $02, $00, $02
DATA_1AD53C:         db $01, $E8, $06, $00, $00
DATA_1AD541:         db $FE, $03, $18, $00, $00
DATA_1AD546:         db $06, $08, $07, $00, $00
DATA_1AD54B:         db $00, $F8, $0C, $00, $02
DATA_1AD550:         db $0B, $EB, $06, $00, $00
DATA_1AD555:         db $FF, $D7, $08, $00, $00
DATA_1AD55A:         db $01, $DA, $0D, $40, $02
DATA_1AD55F:         db $01, $E9, $0D, $40, $02
DATA_1AD564:         db $03, $DF, $00, $00, $02
DATA_1AD569:         db $01, $E9, $06, $00, $00
DATA_1AD56E:         db $FE, $05, $18, $00, $00
DATA_1AD573:         db $08, $08, $07, $00, $00
DATA_1AD578:         db $01, $F8, $0D, $40, $02
DATA_1AD57D:         db $09, $08, $07, $00, $00
DATA_1AD582:         db $01, $DA, $0A, $00, $02
DATA_1AD587:         db $0C, $EB, $06, $00, $00
DATA_1AD58C:         db $01, $E9, $0A, $00, $02
DATA_1AD591:         db $03, $E0, $00, $00, $02
DATA_1AD596:         db $00, $EB, $06, $00, $00
DATA_1AD59B:         db $09, $08, $07, $00, $00
DATA_1AD5A0:         db $FD, $08, $18, $00, $00
DATA_1AD5A5:         db $01, $F8, $0A, $00, $02
DATA_1AD5AA:         db $00, $DA, $0C, $00, $00
DATA_1AD5AF:         db $FE, $08, $18, $00, $00
DATA_1AD5B4:         db $09, $EC, $06, $00, $00
DATA_1AD5B9:         db $00, $DA, $0C, $00, $02
DATA_1AD5BE:         db $00, $E9, $0C, $00, $02
DATA_1AD5C3:         db $01, $EC, $06, $00, $00
DATA_1AD5C8:         db $06, $08, $18, $00, $00
DATA_1AD5CD:         db $FE, $08, $18, $00, $00
DATA_1AD5D2:         db $00, $F8, $0C, $00, $02
DATA_1AD5D7:         db $00, $00, $E3, $00, $00
DATA_1AD5DC:         db $08, $00, $E4, $00, $00
DATA_1AD5E1:         db $00, $08, $F3, $00, $00
DATA_1AD5E6:         db $08, $08, $F4, $00, $00
DATA_1AD5EB:         db $00, $00, $E3, $00, $00
DATA_1AD5F0:         db $08, $00, $E4, $00, $00
DATA_1AD5F5:         db $00, $08, $F3, $00, $00
DATA_1AD5FA:         db $00, $00, $E5, $00, $00
DATA_1AD5FF:         db $08, $00, $E6, $00, $00
DATA_1AD604:         db $00, $08, $F5, $00, $00
DATA_1AD609:         db $08, $08, $F6, $00, $00
DATA_1AD60E:         db $06, $F7, $77, $00, $00
DATA_1AD613:         db $FA, $04, $77, $00, $00
DATA_1AD618:         db $0C, $0C, $77, $00, $00
DATA_1AD61D:         db $00, $00, $46, $00, $00
DATA_1AD622:         db $08, $00, $47, $00, $00
DATA_1AD627:         db $00, $08, $56, $00, $00
DATA_1AD62C:         db $08, $08, $57, $00, $00
DATA_1AD631:         db $07, $F6, $77, $00, $00
DATA_1AD636:         db $F7, $09, $77, $00, $00
DATA_1AD63B:         db $0F, $0E, $77, $00, $00
DATA_1AD640:         db $09, $F5, $44, $00, $00
DATA_1AD645:         db $F3, $0C, $44, $00, $00
DATA_1AD64A:         db $13, $13, $44, $00, $00
DATA_1AD64F:         db $09, $F5, $44, $00, $00
DATA_1AD654:         db $F3, $0C, $44, $00, $00
DATA_1AD659:         db $13, $13, $44, $00, $00
DATA_1AD65E:         db $09, $F5, $44, $00, $00
DATA_1AD663:         db $00, $00, $E7, $00, $00
DATA_1AD668:         db $08, $00, $E8, $00, $00
DATA_1AD66D:         db $00, $08, $F7, $00, $00
DATA_1AD672:         db $08, $08, $F8, $00, $00
DATA_1AD677:         db $00, $00, $E5, $00, $00
DATA_1AD67C:         db $08, $00, $E6, $00, $00
DATA_1AD681:         db $00, $08, $F5, $00, $00
DATA_1AD686:         db $08, $08, $F6, $00, $00
DATA_1AD68B:         db $00, $00, $E3, $00, $00
DATA_1AD690:         db $08, $00, $E4, $00, $00
DATA_1AD695:         db $00, $08, $F3, $00, $00
DATA_1AD69A:         db $08, $08, $F4, $00, $00
DATA_1AD69F:         db $F8, $F8, $42, $04, $02
DATA_1AD6A4:         db $08, $F8, $42, $44, $02
DATA_1AD6A9:         db $F8, $08, $42, $84, $02
DATA_1AD6AE:         db $08, $08, $42, $C4, $02
DATA_1AD6B3:         db $06, $FA, $48, $09, $02
DATA_1AD6B8:         db $FD, $F8, $40, $05, $02
DATA_1AD6BD:         db $FE, $08, $2E, $00, $00
DATA_1AD6C2:         db $07, $05, $55, $05, $00
DATA_1AD6C7:         db $FF, $05, $54, $05, $00
DATA_1AD6CC:         db $0B, $05, $2F, $00, $00
DATA_1AD6D1:         db $06, $F9, $48, $09, $02
DATA_1AD6D6:         db $FE, $F7, $40, $05, $02
DATA_1AD6DB:         db $FF, $04, $54, $05, $00
DATA_1AD6E0:         db $07, $04, $55, $05, $00
DATA_1AD6E5:         db $01, $08, $9E, $00, $00
DATA_1AD6EA:         db $01, $08, $9E, $00, $00
DATA_1AD6EF:         db $04, $08, $9E, $00, $00
DATA_1AD6F4:         db $06, $F8, $48, $09, $02
DATA_1AD6F9:         db $04, $08, $9E, $00, $00
DATA_1AD6FE:         db $07, $04, $55, $05, $00
DATA_1AD703:         db $FF, $04, $54, $05, $00
DATA_1AD708:         db $FE, $F6, $40, $05, $02
DATA_1AD70D:         db $07, $F9, $48, $09, $02
DATA_1AD712:         db $07, $08, $2E, $40, $00
DATA_1AD717:         db $FD, $F7, $40, $05, $02
DATA_1AD71C:         db $07, $08, $2E, $40, $00
DATA_1AD721:         db $06, $05, $55, $05, $00
DATA_1AD726:         db $FE, $05, $54, $05, $00
DATA_1AD72B:         db $FC, $06, $2F, $00, $00
DATA_1AD730:         db $0B, $08, $2F, $80, $00
DATA_1AD735:         db $06, $FB, $48, $09, $02
DATA_1AD73A:         db $FD, $F8, $40, $05, $02
DATA_1AD73F:         db $06, $06, $55, $05, $00
DATA_1AD744:         db $FE, $06, $54, $05, $00
DATA_1AD749:         db $07, $F7, $46, $49, $02
DATA_1AD74E:         db $FE, $08, $9E, $00, $00
DATA_1AD753:         db $0C, $08, $9E, $00, $00
DATA_1AD758:         db $FE, $F8, $40, $05, $02
DATA_1AD75D:         db $08, $06, $55, $05, $00
DATA_1AD762:         db $00, $06, $54, $05, $00
DATA_1AD767:         db $0B, $F7, $46, $49, $02
DATA_1AD76C:         db $00, $F7, $40, $05, $02
DATA_1AD771:         db $01, $07, $2E, $40, $00
DATA_1AD776:         db $09, $05, $55, $05, $00
DATA_1AD77B:         db $01, $05, $54, $05, $00
DATA_1AD780:         db $0C, $08, $9E, $00, $00
DATA_1AD785:         db $0D, $F5, $46, $49, $02
DATA_1AD78A:         db $01, $F6, $40, $05, $02
DATA_1AD78F:         db $05, $05, $2E, $40, $00
DATA_1AD794:         db $0B, $03, $55, $05, $00
DATA_1AD799:         db $03, $03, $54, $05, $00
DATA_1AD79E:         db $0C, $08, $9E, $00, $00
DATA_1AD7A3:         db $09, $04, $2E, $40, $00
DATA_1AD7A8:         db $0C, $08, $9E, $00, $00
DATA_1AD7AD:         db $0A, $F2, $46, $09, $02
DATA_1AD7B2:         db $02, $F5, $40, $05, $02
DATA_1AD7B7:         db $0D, $02, $55, $05, $00
DATA_1AD7BC:         db $05, $02, $54, $05, $00
DATA_1AD7C1:         db $FE, $F8, $40, $05, $02
DATA_1AD7C6:         db $FE, $08, $9E, $00, $00
DATA_1AD7CB:         db $0C, $08, $9E, $00, $00
DATA_1AD7D0:         db $0B, $FA, $48, $09, $02
DATA_1AD7D5:         db $08, $06, $55, $05, $00
DATA_1AD7DA:         db $00, $06, $54, $05, $00
DATA_1AD7DF:         db $04, $07, $48, $89, $02
DATA_1AD7E4:         db $FF, $F8, $40, $05, $02
DATA_1AD7E9:         db $0C, $08, $2E, $40, $00
DATA_1AD7EE:         db $FD, $08, $9E, $00, $00
DATA_1AD7F3:         db $06, $06, $55, $05, $00
DATA_1AD7F8:         db $FE, $06, $54, $05, $00
DATA_1AD7FD:         db $F1, $02, $48, $C9, $02
DATA_1AD802:         db $00, $F8, $42, $05, $02
DATA_1AD807:         db $05, $06, $55, $05, $00
DATA_1AD80C:         db $FD, $06, $54, $05, $00
DATA_1AD811:         db $0C, $08, $2F, $80, $00
DATA_1AD816:         db $FC, $08, $2E, $00, $00
DATA_1AD81B:         db $01, $F7, $42, $05, $02
DATA_1AD820:         db $F2, $F6, $48, $49, $02
DATA_1AD825:         db $05, $06, $55, $05, $00
DATA_1AD82A:         db $FD, $06, $54, $05, $00
DATA_1AD82F:         db $0C, $08, $2F, $80, $00
DATA_1AD834:         db $FB, $08, $2E, $00, $00
DATA_1AD839:         db $FF, $F7, $42, $05, $02
DATA_1AD83E:         db $F9, $F1, $46, $49, $02
DATA_1AD843:         db $0B, $08, $2F, $80, $00
DATA_1AD848:         db $04, $05, $55, $05, $00
DATA_1AD84D:         db $FC, $05, $54, $05, $00
DATA_1AD852:         db $FB, $08, $2E, $00, $00
DATA_1AD857:         db $FD, $F6, $42, $05, $02
DATA_1AD85C:         db $04, $F1, $48, $09, $02
DATA_1AD861:         db $09, $08, $2F, $80, $00
DATA_1AD866:         db $03, $05, $55, $05, $00
DATA_1AD86B:         db $FB, $05, $54, $05, $00
DATA_1AD870:         db $FB, $08, $2E, $00, $00
DATA_1AD875:         db $FC, $F6, $42, $05, $02
DATA_1AD87A:         db $05, $F3, $48, $09, $02
DATA_1AD87F:         db $08, $08, $2F, $80, $00
DATA_1AD884:         db $03, $05, $55, $05, $00
DATA_1AD889:         db $FB, $05, $54, $05, $00
DATA_1AD88E:         db $FA, $08, $9E, $00, $00
DATA_1AD893:         db $FC, $F6, $42, $05, $02
DATA_1AD898:         db $01, $F0, $46, $49, $02
DATA_1AD89D:         db $09, $08, $2F, $80, $00
DATA_1AD8A2:         db $03, $05, $55, $05, $00
DATA_1AD8A7:         db $FB, $05, $54, $05, $00
DATA_1AD8AC:         db $FA, $08, $9E, $00, $00
DATA_1AD8B1:         db $FC, $F7, $42, $05, $02
DATA_1AD8B6:         db $0A, $08, $2F, $80, $00
DATA_1AD8BB:         db $FB, $08, $9E, $00, $00
DATA_1AD8C0:         db $04, $05, $55, $05, $00
DATA_1AD8C5:         db $FC, $05, $54, $05, $00
DATA_1AD8CA:         db $F8, $F0, $46, $09, $02
DATA_1AD8CF:         db $FD, $F7, $42, $05, $02
DATA_1AD8D4:         db $F0, $FA, $48, $49, $02
DATA_1AD8D9:         db $0A, $08, $2E, $40, $00
DATA_1AD8DE:         db $FC, $08, $9E, $00, $00
DATA_1AD8E3:         db $05, $05, $55, $05, $00
DATA_1AD8E8:         db $FD, $05, $54, $05, $00
DATA_1AD8ED:         db $F2, $06, $48, $C9, $02
DATA_1AD8F2:         db $FD, $F8, $42, $05, $02
DATA_1AD8F7:         db $0B, $08, $2E, $40, $00
DATA_1AD8FC:         db $FD, $08, $9E, $00, $00
DATA_1AD901:         db $05, $06, $55, $05, $00
DATA_1AD906:         db $FD, $06, $54, $05, $00
DATA_1AD90B:         db $00, $09, $46, $C9, $02
DATA_1AD910:         db $0C, $08, $9E, $00, $00
DATA_1AD915:         db $FD, $F8, $40, $05, $02
DATA_1AD91A:         db $FD, $08, $9E, $00, $00
DATA_1AD91F:         db $06, $06, $55, $05, $00
DATA_1AD924:         db $FE, $06, $54, $05, $00
DATA_1AD929:         db $0B, $04, $48, $89, $02
DATA_1AD92E:         db $0C, $08, $9E, $00, $00
DATA_1AD933:         db $FE, $F8, $40, $05, $02
DATA_1AD938:         db $FE, $08, $9E, $00, $00
DATA_1AD93D:         db $07, $06, $55, $05, $00
DATA_1AD942:         db $FF, $06, $54, $05, $00
DATA_1AD947:         db $03, $00, $48, $09, $02
DATA_1AD94C:         db $FD, $09, $2F, $00, $00
DATA_1AD951:         db $F9, $09, $2F, $00, $00
DATA_1AD956:         db $FB, $FD, $40, $05, $02
DATA_1AD95B:         db $04, $08, $55, $05, $00
DATA_1AD960:         db $FC, $08, $54, $05, $00
DATA_1AD965:         db $04, $FF, $48, $09, $02
DATA_1AD96A:         db $FC, $09, $2F, $00, $00
DATA_1AD96F:         db $F8, $09, $2F, $00, $00
DATA_1AD974:         db $FC, $F9, $40, $05, $02
DATA_1AD979:         db $04, $08, $55, $05, $00
DATA_1AD97E:         db $FC, $08, $54, $05, $00
DATA_1AD983:         db $04, $FF, $48, $09, $02
DATA_1AD988:         db $FC, $09, $2F, $00, $00
DATA_1AD98D:         db $F8, $09, $2F, $00, $00
DATA_1AD992:         db $FA, $F9, $42, $05, $02
DATA_1AD997:         db $04, $08, $55, $05, $00
DATA_1AD99C:         db $FC, $08, $54, $05, $00
DATA_1AD9A1:         db $04, $FF, $48, $09, $02
DATA_1AD9A6:         db $FC, $09, $2F, $00, $00
DATA_1AD9AB:         db $F8, $09, $2F, $00, $00
DATA_1AD9B0:         db $FC, $F9, $40, $45, $02
DATA_1AD9B5:         db $04, $08, $55, $05, $00
DATA_1AD9BA:         db $FC, $08, $54, $05, $00
DATA_1AD9BF:         db $04, $FC, $48, $09, $02
DATA_1AD9C4:         db $04, $08, $9E, $00, $00
DATA_1AD9C9:         db $00, $08, $9E, $00, $00
DATA_1AD9CE:         db $FB, $FA, $40, $05, $02
DATA_1AD9D3:         db $07, $06, $55, $05, $00
DATA_1AD9D8:         db $FF, $06, $54, $05, $00
DATA_1AD9DD:         db $05, $F8, $48, $09, $02
DATA_1AD9E2:         db $FC, $F4, $40, $05, $02
DATA_1AD9E7:         db $04, $02, $55, $05, $00
DATA_1AD9EC:         db $FC, $02, $54, $05, $00
DATA_1AD9F1:         db $05, $08, $2F, $80, $00
DATA_1AD9F6:         db $01, $08, $2F, $80, $00
DATA_1AD9FB:         db $F8, $F1, $C0, $03, $02
DATA_1ADA00:         db $08, $F1, $C2, $03, $02
DATA_1ADA05:         db $F8, $01, $E0, $03, $02
DATA_1ADA0A:         db $08, $01, $E2, $03, $02
DATA_1ADA0F:         db $F6, $01, $2F, $02, $00
DATA_1ADA14:         db $0C, $0C, $2E, $42, $00
DATA_1ADA19:         db $12, $0E, $2F, $42, $00
DATA_1ADA1E:         db $F5, $07, $2F, $02, $00
DATA_1ADA23:         db $F8, $F3, $C0, $03, $02
DATA_1ADA28:         db $08, $F3, $C2, $03, $02
DATA_1ADA2D:         db $F8, $03, $E0, $03, $02
DATA_1ADA32:         db $08, $03, $E2, $03, $02
DATA_1ADA37:         db $F7, $0C, $2F, $02, $00
DATA_1ADA3C:         db $F8, $F4, $C4, $03, $02
DATA_1ADA41:         db $08, $F4, $C6, $03, $02
DATA_1ADA46:         db $F8, $04, $E4, $03, $02
DATA_1ADA4B:         db $08, $04, $E6, $03, $02
DATA_1ADA50:         db $14, $0A, $2F, $02, $00
DATA_1ADA55:         db $FB, $0C, $2E, $02, $00
DATA_1ADA5A:         db $FB, $0C, $2E, $02, $00
DATA_1ADA5F:         db $F8, $F3, $C4, $03, $02
DATA_1ADA64:         db $08, $F3, $C6, $03, $02
DATA_1ADA69:         db $F8, $03, $E4, $03, $02
DATA_1ADA6E:         db $08, $03, $E6, $03, $02
DATA_1ADA73:         db $00, $0C, $9E, $02, $00
DATA_1ADA78:         db $00, $0C, $9E, $02, $00
DATA_1ADA7D:         db $F8, $F1, $C4, $03, $02
DATA_1ADA82:         db $08, $F1, $C6, $03, $02
DATA_1ADA87:         db $F8, $01, $E4, $03, $02
DATA_1ADA8C:         db $08, $01, $E6, $03, $02
DATA_1ADA91:         db $06, $0C, $9E, $02, $00
DATA_1ADA96:         db $06, $0C, $9E, $02, $00
DATA_1ADA9B:         db $F8, $F0, $C0, $03, $02
DATA_1ADAA0:         db $08, $F0, $C2, $03, $02
DATA_1ADAA5:         db $F8, $00, $E0, $03, $02
DATA_1ADAAA:         db $08, $00, $E2, $03, $02
DATA_1ADAAF:         db $06, $09, $2F, $02, $00
DATA_1ADAB4:         db $05, $09, $2F, $02, $00
DATA_1ADAB9:         db $F8, $F4, $C4, $03, $02
DATA_1ADABE:         db $08, $F4, $C6, $03, $02
DATA_1ADAC3:         db $F8, $04, $E4, $03, $02
DATA_1ADAC8:         db $08, $04, $E6, $03, $02
DATA_1ADACD:         db $06, $0C, $2E, $02, $00
DATA_1ADAD2:         db $FB, $0C, $2E, $02, $00
DATA_1ADAD7:         db $F8, $F4, $C8, $03, $02
DATA_1ADADC:         db $08, $F4, $CA, $03, $02
DATA_1ADAE1:         db $F8, $04, $E8, $03, $02
DATA_1ADAE6:         db $08, $04, $EA, $03, $02
DATA_1ADAEB:         db $F8, $ED, $C0, $03, $02
DATA_1ADAF0:         db $08, $ED, $C2, $03, $02
DATA_1ADAF5:         db $F8, $FD, $E0, $03, $02
DATA_1ADAFA:         db $08, $FD, $E2, $03, $02
DATA_1ADAFF:         db $0B, $0C, $2F, $42, $00
DATA_1ADB04:         db $05, $0C, $2F, $42, $00
DATA_1ADB09:         db $00, $FE, $00, $03, $02
DATA_1ADB0E:         db $0D, $08, $2F, $82, $00
DATA_1ADB13:         db $FC, $06, $2F, $02, $00
DATA_1ADB18:         db $FC, $06, $2F, $02, $00
DATA_1ADB1D:         db $00, $FD, $02, $03, $02
DATA_1ADB22:         db $0C, $04, $2F, $02, $00
DATA_1ADB27:         db $FF, $08, $2E, $02, $00
DATA_1ADB2C:         db $FF, $08, $2E, $02, $00
DATA_1ADB31:         db $04, $08, $9E, $02, $00
DATA_1ADB36:         db $04, $08, $9E, $02, $00
DATA_1ADB3B:         db $04, $08, $9E, $02, $00
DATA_1ADB40:         db $00, $FC, $02, $03, $02
DATA_1ADB45:         db $00, $FD, $00, $03, $02
DATA_1ADB4A:         db $FD, $03, $2F, $02, $00
DATA_1ADB4F:         db $08, $08, $2E, $42, $00
DATA_1ADB54:         db $08, $08, $2E, $42, $00
DATA_1ADB59:         db $0B, $F8, $F7, $80, $00
DATA_1ADB5E:         db $04, $08, $9E, $02, $00
DATA_1ADB63:         db $0D, $05, $2F, $42, $00
DATA_1ADB68:         db $00, $FC, $02, $03, $02
DATA_1ADB6D:         db $FE, $08, $2E, $02, $00
DATA_1ADB72:         db $0A, $08, $2E, $42, $00
DATA_1ADB77:         db $00, $FE, $02, $03, $02
DATA_1ADB7C:         db $00, $FE, $02, $03, $02
DATA_1ADB81:         db $00, $FB, $00, $03, $02
DATA_1ADB86:         db $03, $09, $2F, $42, $00
DATA_1ADB8B:         db $08, $09, $2F, $42, $00
DATA_1ADB90:         db $08, $09, $2F, $42, $00
DATA_1ADB95:         db $0B, $0A, $9E, $00, $00
DATA_1ADB9A:         db $00, $FF, $4E, $09, $00
DATA_1ADB9F:         db $08, $FF, $4F, $09, $00
DATA_1ADBA4:         db $00, $07, $5E, $09, $00
DATA_1ADBA9:         db $08, $07, $5F, $09, $00
DATA_1ADBAE:         db $FD, $08, $2F, $00, $00
DATA_1ADBB3:         db $0C, $07, $2E, $40, $00
DATA_1ADBB8:         db $00, $00, $4E, $09, $00
DATA_1ADBBD:         db $08, $00, $4F, $09, $00
DATA_1ADBC2:         db $00, $08, $5E, $09, $00
DATA_1ADBC7:         db $08, $08, $5F, $09, $00
DATA_1ADBCC:         db $FE, $07, $2E, $00, $00
DATA_1ADBD1:         db $0B, $06, $2F, $40, $00
DATA_1ADBD6:         db $FF, $00, $4E, $09, $00
DATA_1ADBDB:         db $07, $00, $4F, $09, $00
DATA_1ADBE0:         db $FF, $08, $5E, $09, $00
DATA_1ADBE5:         db $07, $08, $5F, $09, $00
DATA_1ADBEA:         db $00, $0A, $9E, $00, $00
DATA_1ADBEF:         db $0A, $09, $9E, $00, $00
DATA_1ADBF4:         db $00, $00, $4E, $09, $00
DATA_1ADBF9:         db $08, $00, $4F, $09, $00
DATA_1ADBFE:         db $00, $08, $5E, $09, $00
DATA_1ADC03:         db $08, $08, $5F, $09, $00
DATA_1ADC08:         db $01, $09, $9E, $00, $00
DATA_1ADC0D:         db $0C, $08, $2E, $40, $00
DATA_1ADC12:         db $F8, $F0, $00, $08, $02
DATA_1ADC17:         db $08, $F0, $00, $08, $02
DATA_1ADC1C:         db $F8, $00, $00, $08, $02
DATA_1ADC21:         db $08, $00, $00, $08, $02
DATA_1ADC26:         db $FE, $08, $2E, $00, $00
DATA_1ADC2B:         db $F0, $F0, $42, $00, $02
DATA_1ADC30:         db $00, $F0, $42, $40, $02
DATA_1ADC35:         db $F0, $00, $42, $80, $02
DATA_1ADC3A:         db $00, $00, $42, $C0, $02
DATA_1ADC3F:         db $F8, $EF, $C0, $01, $02
DATA_1ADC44:         db $08, $EF, $C2, $01, $02
DATA_1ADC49:         db $F8, $FF, $E0, $01, $02
DATA_1ADC4E:         db $08, $FF, $E2, $01, $02
DATA_1ADC53:         db $00, $09, $9E, $00, $00
DATA_1ADC58:         db $08, $09, $9E, $00, $00
DATA_1ADC5D:         db $F8, $EE, $C0, $01, $02
DATA_1ADC62:         db $08, $EE, $C2, $01, $02
DATA_1ADC67:         db $F8, $FE, $E0, $01, $02
DATA_1ADC6C:         db $08, $FE, $E2, $01, $02
DATA_1ADC71:         db $00, $07, $2E, $00, $00
DATA_1ADC76:         db $08, $08, $9E, $00, $00
DATA_1ADC7B:         db $F8, $EF, $C0, $01, $02
DATA_1ADC80:         db $08, $EF, $C2, $01, $02
DATA_1ADC85:         db $F8, $FF, $E0, $01, $02
DATA_1ADC8A:         db $08, $FF, $E2, $01, $02
DATA_1ADC8F:         db $FE, $07, $2F, $00, $00
DATA_1ADC94:         db $09, $08, $2E, $40, $00
DATA_1ADC99:         db $F8, $F0, $C0, $01, $02
DATA_1ADC9E:         db $08, $F0, $C2, $01, $02
DATA_1ADCA3:         db $F8, $00, $E0, $01, $02
DATA_1ADCA8:         db $08, $00, $E2, $01, $02
DATA_1ADCAD:         db $FF, $08, $2E, $00, $00
DATA_1ADCB2:         db $0B, $09, $2F, $40, $00
DATA_1ADCB7:         db $F8, $EF, $C0, $01, $02
DATA_1ADCBC:         db $08, $EF, $C2, $01, $02
DATA_1ADCC1:         db $F8, $FF, $E0, $01, $02
DATA_1ADCC6:         db $08, $FF, $E2, $01, $02
DATA_1ADCCB:         db $02, $08, $9E, $00, $00
DATA_1ADCD0:         db $08, $08, $2F, $40, $00
DATA_1ADCD5:         db $F8, $EE, $C0, $01, $02
DATA_1ADCDA:         db $08, $EE, $C2, $01, $02
DATA_1ADCDF:         db $F8, $FE, $E0, $01, $02
DATA_1ADCE4:         db $08, $FE, $E2, $01, $02
DATA_1ADCE9:         db $03, $08, $9E, $00, $00
DATA_1ADCEE:         db $05, $08, $2F, $40, $00
DATA_1ADCF3:         db $F8, $EE, $C0, $01, $02
DATA_1ADCF8:         db $08, $EE, $C2, $01, $02
DATA_1ADCFD:         db $F8, $FE, $E0, $01, $02
DATA_1ADD02:         db $08, $FE, $E2, $01, $02
DATA_1ADD07:         db $02, $08, $2E, $80, $00
DATA_1ADD0C:         db $06, $08, $9E, $00, $00
DATA_1ADD11:         db $EA, $00, $04, $00, $02
DATA_1ADD16:         db $FA, $00, $06, $00, $02
DATA_1ADD1B:         db $FA, $00, $06, $00, $00
DATA_1ADD20:         db $FA, $08, $16, $00, $00
DATA_1ADD25:         db $F8, $00, $00, $00, $02
DATA_1ADD2A:         db $08, $00, $02, $00, $02
DATA_1ADD2F:         db $EE, $EA, $00, $00, $02
DATA_1ADD34:         db $FE, $EA, $02, $00, $02
DATA_1ADD39:         db $EE, $FA, $20, $00, $02
DATA_1ADD3E:         db $FE, $FA, $22, $00, $02
DATA_1ADD43:         db $F8, $00, $00, $00, $02
DATA_1ADD48:         db $08, $00, $02, $00, $02
DATA_1ADD4D:         db $F9, $F9, $9C, $00, $02
DATA_1ADD52:         db $F9, $07, $7E, $C0, $02
DATA_1ADD57:         db $07, $07, $7E, $80, $02
DATA_1ADD5C:         db $07, $F9, $7E, $00, $02
DATA_1ADD61:         db $FF, $04, $49, $02, $00
DATA_1ADD66:         db $01, $04, $6E, $02, $00
DATA_1ADD6B:         db $09, $04, $6F, $02, $00
DATA_1ADD70:         db $FA, $F8, $9C, $00, $02
DATA_1ADD75:         db $FA, $08, $7E, $C0, $02
DATA_1ADD7A:         db $06, $08, $7E, $80, $02
DATA_1ADD7F:         db $06, $F8, $7E, $00, $02
DATA_1ADD84:         db $FF, $04, $49, $02, $00
DATA_1ADD89:         db $01, $04, $6E, $02, $00
DATA_1ADD8E:         db $09, $04, $6F, $02, $00
DATA_1ADD93:         db $F9, $F9, $9C, $00, $02
DATA_1ADD98:         db $F9, $07, $7E, $C0, $02
DATA_1ADD9D:         db $07, $07, $7E, $80, $02
DATA_1ADDA2:         db $07, $F9, $7E, $00, $02
DATA_1ADDA7:         db $FF, $04, $49, $02, $00
DATA_1ADDAC:         db $01, $04, $6E, $02, $00
DATA_1ADDB1:         db $09, $04, $6F, $02, $00
DATA_1ADDB6:         db $F8, $FA, $9C, $00, $02
DATA_1ADDBB:         db $F8, $06, $7E, $C0, $02
DATA_1ADDC0:         db $08, $06, $7E, $80, $02
DATA_1ADDC5:         db $08, $FA, $7E, $00, $02
DATA_1ADDCA:         db $FF, $04, $49, $02, $00
DATA_1ADDCF:         db $01, $04, $6E, $02, $00
DATA_1ADDD4:         db $09, $04, $6F, $02, $00
DATA_1ADDD9:         db $FC, $00, $08, $00, $02
DATA_1ADDDE:         db $0C, $00, $00, $00, $02
DATA_1ADDE3:         db $F9, $00, $0A, $00, $02
DATA_1ADDE8:         db $0A, $00, $02, $00, $02
DATA_1ADDED:         db $F6, $00, $0C, $00, $02
DATA_1ADDF2:         db $07, $00, $04, $00, $02
DATA_1ADDF7:         db $F4, $00, $0E, $00, $02
DATA_1ADDFC:         db $04, $00, $06, $00, $02
DATA_1ADE01:         db $00, $00, $06, $00, $02
DATA_1ADE06:         db $00, $00, $06, $00, $00
DATA_1ADE0B:         db $00, $00, $00, $00, $02
DATA_1ADE10:         db $00, $00, $00, $00, $02
DATA_1ADE15:         db $00, $00, $00, $00, $02
DATA_1ADE1A:         db $00, $00, $00, $00, $02
DATA_1ADE1F:         db $00, $00, $00, $00, $02
DATA_1ADE24:         db $00, $00, $00, $00, $02
DATA_1ADE29:         db $00, $00, $00, $00, $02
DATA_1ADE2E:         db $00, $00, $00, $00, $02
DATA_1ADE33:         db $00, $00, $00, $00, $02
DATA_1ADE38:         db $00, $00, $00, $00, $02
DATA_1ADE3D:         db $00, $00, $00, $00, $02
DATA_1ADE42:         db $00, $00, $00, $00, $02
DATA_1ADE47:         db $00, $00, $00, $00, $02
DATA_1ADE4C:         db $00, $00, $00, $00, $02
DATA_1ADE51:         db $00, $00, $00, $00, $02
DATA_1ADE56:         db $00, $00, $00, $00, $02
DATA_1ADE5B:         db $00, $00, $00, $00, $02
DATA_1ADE60:         db $00, $00, $00, $00, $02
DATA_1ADE65:         db $00, $00, $00, $00, $02
DATA_1ADE6A:         db $00, $00, $00, $00, $02
DATA_1ADE6F:         db $00, $00, $00, $00, $02
DATA_1ADE74:         db $00, $00, $00, $00, $02
DATA_1ADE79:         db $00, $00, $00, $00, $02
DATA_1ADE7E:         db $00, $00, $00, $00, $02
DATA_1ADE83:         db $05, $E5, $06, $02, $00
DATA_1ADE88:         db $07, $ED, $16, $02, $00
DATA_1ADE8D:         db $05, $F5, $07, $02, $00
DATA_1ADE92:         db $0A, $F5, $04, $02, $00
DATA_1ADE97:         db $00, $FD, $00, $02, $02
DATA_1ADE9C:         db $FC, $06, $15, $02, $00
DATA_1ADEA1:         db $FB, $03, $17, $82, $00
DATA_1ADEA6:         db $FB, $FB, $17, $02, $00
DATA_1ADEAB:         db $08, $0B, $14, $42, $00
DATA_1ADEB0:         db $06, $E7, $06, $02, $00
DATA_1ADEB5:         db $08, $EF, $16, $02, $00
DATA_1ADEBA:         db $06, $F6, $07, $02, $00
DATA_1ADEBF:         db $0B, $F6, $04, $02, $00
DATA_1ADEC4:         db $00, $FE, $02, $02, $02
DATA_1ADEC9:         db $FD, $0B, $14, $02, $00
DATA_1ADECE:         db $FB, $04, $17, $82, $00
DATA_1ADED3:         db $FB, $FC, $17, $02, $00
DATA_1ADED8:         db $0B, $09, $15, $42, $00
DATA_1ADEDD:         db $06, $E6, $06, $02, $00
DATA_1ADEE2:         db $08, $EE, $16, $02, $00
DATA_1ADEE7:         db $06, $F5, $07, $02, $00
DATA_1ADEEC:         db $0A, $F5, $04, $02, $00
DATA_1ADEF1:         db $00, $FD, $02, $02, $02
DATA_1ADEF6:         db $FC, $05, $17, $82, $00
DATA_1ADEFB:         db $FC, $FD, $17, $02, $00
DATA_1ADF00:         db $0D, $06, $15, $02, $00
DATA_1ADF05:         db $FF, $0C, $05, $02, $00
DATA_1ADF0A:         db $05, $E5, $06, $02, $00
DATA_1ADF0F:         db $07, $ED, $16, $02, $00
DATA_1ADF14:         db $05, $F5, $07, $02, $00
DATA_1ADF19:         db $0A, $F4, $04, $02, $00
DATA_1ADF1E:         db $00, $FC, $00, $02, $02
DATA_1ADF23:         db $FC, $04, $17, $82, $00
DATA_1ADF28:         db $FC, $FC, $17, $02, $00
DATA_1ADF2D:         db $02, $0C, $05, $02, $00
DATA_1ADF32:         db $08, $09, $14, $42, $00
DATA_1ADF37:         db $05, $E4, $06, $02, $00
DATA_1ADF3C:         db $07, $EC, $16, $02, $00
DATA_1ADF41:         db $05, $F4, $07, $02, $00
DATA_1ADF46:         db $0A, $F4, $04, $02, $00
DATA_1ADF4B:         db $00, $FC, $00, $02, $02
DATA_1ADF50:         db $FC, $03, $17, $82, $00
DATA_1ADF55:         db $FC, $FB, $17, $02, $00
DATA_1ADF5A:         db $05, $0C, $05, $02, $00
DATA_1ADF5F:         db $02, $0A, $05, $02, $00
DATA_1ADF64:         db $F8, $04, $17, $82, $00
DATA_1ADF69:         db $F8, $FC, $17, $02, $00
DATA_1ADF6E:         db $06, $EC, $06, $02, $00
DATA_1ADF73:         db $08, $F4, $16, $02, $00
DATA_1ADF78:         db $06, $F7, $07, $02, $00
DATA_1ADF7D:         db $0A, $F7, $04, $02, $00
DATA_1ADF82:         db $00, $FF, $02, $02, $02
DATA_1ADF87:         db $0D, $08, $15, $C2, $00
DATA_1ADF8C:         db $FF, $0C, $05, $02, $00
DATA_1ADF91:         db $05, $F1, $06, $02, $00
DATA_1ADF96:         db $07, $F9, $16, $02, $00
DATA_1ADF9B:         db $0A, $F5, $04, $02, $00
DATA_1ADFA0:         db $00, $FD, $00, $02, $02
DATA_1ADFA5:         db $FC, $06, $15, $02, $00
DATA_1ADFAA:         db $FB, $03, $17, $82, $00
DATA_1ADFAF:         db $FB, $FB, $17, $02, $00
DATA_1ADFB4:         db $08, $0B, $14, $42, $00
DATA_1ADFB9:         db $06, $F3, $06, $02, $00
DATA_1ADFBE:         db $08, $FB, $16, $02, $00
DATA_1ADFC3:         db $0B, $F6, $04, $02, $00
DATA_1ADFC8:         db $00, $FE, $02, $02, $02
DATA_1ADFCD:         db $FD, $0B, $14, $02, $00
DATA_1ADFD2:         db $FB, $04, $17, $82, $00
DATA_1ADFD7:         db $FB, $FC, $17, $02, $00
DATA_1ADFDC:         db $0B, $09, $15, $42, $00
DATA_1ADFE1:         db $06, $F2, $06, $02, $00
DATA_1ADFE6:         db $08, $FA, $16, $02, $00
DATA_1ADFEB:         db $0A, $F5, $04, $02, $00
DATA_1ADFF0:         db $00, $FD, $02, $02, $02
DATA_1ADFF5:         db $FC, $05, $17, $82, $00
DATA_1ADFFA:         db $FC, $FD, $17, $02, $00
DATA_1ADFFF:         db $0D, $06, $15, $02, $00
DATA_1AE004:         db $FF, $0C, $05, $02, $00
DATA_1AE009:         db $05, $F1, $06, $02, $00
DATA_1AE00E:         db $07, $F9, $16, $02, $00
DATA_1AE013:         db $0A, $F4, $04, $02, $00
DATA_1AE018:         db $00, $FC, $00, $02, $02
DATA_1AE01D:         db $FC, $04, $17, $82, $00
DATA_1AE022:         db $FC, $FC, $17, $02, $00
DATA_1AE027:         db $02, $0C, $05, $02, $00
DATA_1AE02C:         db $08, $09, $14, $42, $00
DATA_1AE031:         db $05, $F0, $06, $02, $00
DATA_1AE036:         db $07, $F8, $16, $02, $00
DATA_1AE03B:         db $0A, $F4, $04, $02, $00
DATA_1AE040:         db $00, $FC, $00, $02, $02
DATA_1AE045:         db $FC, $03, $17, $82, $00
DATA_1AE04A:         db $FC, $FB, $17, $02, $00
DATA_1AE04F:         db $05, $0C, $05, $02, $00
DATA_1AE054:         db $02, $0A, $05, $02, $00
DATA_1AE059:         db $F8, $04, $17, $82, $00
DATA_1AE05E:         db $F8, $FC, $17, $02, $00
DATA_1AE063:         db $06, $F6, $06, $02, $00
DATA_1AE068:         db $08, $FE, $16, $02, $00
DATA_1AE06D:         db $0A, $F7, $04, $02, $00
DATA_1AE072:         db $00, $FF, $02, $02, $02
DATA_1AE077:         db $0D, $08, $15, $C2, $00
DATA_1AE07C:         db $FF, $0C, $05, $02, $00
DATA_1AE081:         db $04, $F0, $06, $02, $00
DATA_1AE086:         db $06, $F8, $16, $02, $00
DATA_1AE08B:         db $03, $00, $07, $02, $00
DATA_1AE090:         db $02, $08, $07, $02, $00
DATA_1AE095:         db $04, $00, $17, $82, $00
DATA_1AE09A:         db $04, $F8, $17, $02, $00
DATA_1AE09F:         db $00, $F9, $20, $01, $00
DATA_1AE0A4:         db $05, $04, $26, $05, $00
DATA_1AE0A9:         db $FB, $03, $26, $05, $00
DATA_1AE0AE:         db $00, $F9, $20, $01, $02
DATA_1AE0B3:         db $0B, $0C, $36, $03, $00
DATA_1AE0B8:         db $00, $0C, $36, $03, $00
DATA_1AE0BD:         db $02, $02, $24, $05, $02
DATA_1AE0C2:         db $FE, $F9, $20, $01, $00
DATA_1AE0C7:         db $00, $02, $24, $05, $02
DATA_1AE0CC:         db $FC, $03, $27, $05, $00
DATA_1AE0D1:         db $FE, $F9, $20, $01, $02
DATA_1AE0D6:         db $00, $0C, $36, $03, $00
DATA_1AE0DB:         db $0B, $0C, $36, $03, $00
DATA_1AE0E0:         db $FE, $07, $26, $85, $00
DATA_1AE0E5:         db $FC, $F9, $22, $01, $00
DATA_1AE0EA:         db $01, $03, $2C, $05, $00
DATA_1AE0EF:         db $F6, $03, $27, $05, $00
DATA_1AE0F4:         db $FC, $F9, $22, $01, $02
DATA_1AE0F9:         db $FE, $02, $24, $05, $02
DATA_1AE0FE:         db $00, $0C, $36, $03, $00
DATA_1AE103:         db $0B, $0C, $37, $03, $00
DATA_1AE108:         db $F9, $F9, $22, $01, $00
DATA_1AE10D:         db $EE, $03, $27, $05, $00
DATA_1AE112:         db $F4, $03, $44, $06, $00
DATA_1AE117:         db $FD, $02, $2C, $05, $02
DATA_1AE11C:         db $F9, $F9, $22, $01, $02
DATA_1AE121:         db $00, $0C, $36, $03, $00
DATA_1AE126:         db $0B, $0C, $37, $03, $00
DATA_1AE12B:         db $03, $F7, $20, $01, $00
DATA_1AE130:         db $06, $02, $26, $05, $00
DATA_1AE135:         db $FD, $03, $26, $05, $00
DATA_1AE13A:         db $03, $F7, $20, $01, $02
DATA_1AE13F:         db $0A, $0C, $37, $03, $00
DATA_1AE144:         db $FD, $0C, $37, $C3, $00
DATA_1AE149:         db $04, $01, $24, $05, $02
DATA_1AE14E:         db $04, $F6, $20, $01, $00
DATA_1AE153:         db $FD, $08, $37, $C3, $00
DATA_1AE158:         db $08, $01, $26, $05, $00
DATA_1AE15D:         db $FE, $03, $26, $05, $00
DATA_1AE162:         db $04, $F6, $20, $01, $02
DATA_1AE167:         db $0A, $0C, $37, $03, $00
DATA_1AE16C:         db $05, $00, $24, $05, $02
DATA_1AE171:         db $05, $F5, $20, $01, $00
DATA_1AE176:         db $FB, $01, $39, $03, $00
DATA_1AE17B:         db $FF, $04, $27, $05, $00
DATA_1AE180:         db $0C, $00, $26, $05, $00
DATA_1AE185:         db $05, $F5, $20, $01, $02
DATA_1AE18A:         db $07, $0C, $37, $43, $00
DATA_1AE18F:         db $04, $01, $2A, $05, $02
DATA_1AE194:         db $06, $F6, $20, $01, $00
DATA_1AE199:         db $0D, $00, $26, $05, $00
DATA_1AE19E:         db $06, $F6, $20, $01, $02
DATA_1AE1A3:         db $03, $01, $2A, $05, $02
DATA_1AE1A8:         db $07, $0C, $37, $43, $00
DATA_1AE1AD:         db $01, $05, $27, $05, $00
DATA_1AE1B2:         db $F9, $FE, $39, $03, $00
DATA_1AE1B7:         db $07, $F7, $20, $01, $00
DATA_1AE1BC:         db $FC, $00, $42, $CA, $00
DATA_1AE1C1:         db $0E, $01, $26, $05, $00
DATA_1AE1C6:         db $07, $F7, $20, $01, $02
DATA_1AE1CB:         db $02, $01, $2A, $05, $02
DATA_1AE1D0:         db $07, $0C, $37, $43, $00
DATA_1AE1D5:         db $F7, $FB, $38, $03, $00
DATA_1AE1DA:         db $08, $F8, $20, $01, $00
DATA_1AE1DF:         db $FA, $FE, $42, $CA, $00
DATA_1AE1E4:         db $0E, $03, $26, $05, $00
DATA_1AE1E9:         db $08, $F8, $20, $01, $02
DATA_1AE1EE:         db $01, $00, $2A, $05, $02
DATA_1AE1F3:         db $07, $0C, $37, $43, $00
DATA_1AE1F8:         db $F4, $F8, $38, $03, $00
DATA_1AE1FD:         db $06, $F9, $20, $41, $00
DATA_1AE202:         db $09, $07, $26, $45, $00
DATA_1AE207:         db $FE, $03, $26, $45, $00
DATA_1AE20C:         db $FE, $F9, $20, $41, $02
DATA_1AE211:         db $0B, $0C, $36, $03, $00
DATA_1AE216:         db $00, $0C, $37, $03, $00
DATA_1AE21B:         db $FE, $02, $24, $45, $02
DATA_1AE220:         db $04, $F9, $22, $41, $00
DATA_1AE225:         db $08, $07, $26, $C5, $00
DATA_1AE22A:         db $00, $03, $26, $45, $00
DATA_1AE22F:         db $FC, $F9, $22, $41, $02
DATA_1AE234:         db $0B, $0C, $36, $03, $00
DATA_1AE239:         db $FD, $0C, $37, $43, $00
DATA_1AE23E:         db $FB, $02, $24, $45, $02
DATA_1AE243:         db $FA, $F9, $2F, $41, $00
DATA_1AE248:         db $02, $F9, $2E, $41, $00
DATA_1AE24D:         db $05, $08, $26, $C5, $00
DATA_1AE252:         db $FA, $F9, $2E, $41, $02
DATA_1AE257:         db $02, $0C, $37, $43, $00
DATA_1AE25C:         db $FD, $0C, $37, $43, $00
DATA_1AE261:         db $F8, $03, $2C, $45, $02
DATA_1AE266:         db $F8, $F8, $2E, $01, $00
DATA_1AE26B:         db $FA, $02, $2C, $05, $00
DATA_1AE270:         db $F2, $03, $26, $05, $00
DATA_1AE275:         db $F6, $02, $2A, $05, $02
DATA_1AE27A:         db $01, $05, $26, $05, $00
DATA_1AE27F:         db $F8, $F8, $2E, $01, $02
DATA_1AE284:         db $FD, $0C, $37, $43, $00
DATA_1AE289:         db $00, $F6, $23, $01, $00
DATA_1AE28E:         db $F8, $F6, $22, $01, $00
DATA_1AE293:         db $F7, $04, $27, $05, $00
DATA_1AE298:         db $F8, $F6, $22, $01, $02
DATA_1AE29D:         db $F6, $01, $2A, $05, $02
DATA_1AE2A2:         db $FD, $0C, $37, $43, $00
DATA_1AE2A7:         db $FD, $0C, $37, $43, $00
DATA_1AE2AC:         db $00, $F6, $21, $01, $00
DATA_1AE2B1:         db $F8, $F6, $20, $01, $00
DATA_1AE2B6:         db $FB, $07, $26, $85, $00
DATA_1AE2BB:         db $F8, $F6, $20, $01, $02
DATA_1AE2C0:         db $F6, $01, $2A, $05, $02
DATA_1AE2C5:         db $FD, $0C, $37, $43, $00
DATA_1AE2CA:         db $FD, $0C, $37, $43, $00
DATA_1AE2CF:         db $02, $F6, $21, $01, $00
DATA_1AE2D4:         db $FA, $F6, $20, $01, $00
DATA_1AE2D9:         db $F3, $FF, $39, $03, $00
DATA_1AE2DE:         db $02, $07, $26, $85, $00
DATA_1AE2E3:         db $FA, $F6, $20, $01, $02
DATA_1AE2E8:         db $F8, $01, $2A, $05, $02
DATA_1AE2ED:         db $FD, $0C, $37, $43, $00
DATA_1AE2F2:         db $FA, $F6, $20, $01, $00
DATA_1AE2F7:         db $F3, $FF, $42, $CA, $00
DATA_1AE2FC:         db $EF, $FB, $38, $03, $00
DATA_1AE301:         db $02, $07, $26, $85, $00
DATA_1AE306:         db $FA, $F6, $20, $01, $02
DATA_1AE30B:         db $FA, $01, $2A, $05, $02
DATA_1AE310:         db $00, $0C, $37, $03, $00
DATA_1AE315:         db $03, $F6, $21, $01, $00
DATA_1AE31A:         db $FB, $F6, $20, $01, $00
DATA_1AE31F:         db $EF, $F6, $38, $03, $00
DATA_1AE324:         db $06, $06, $26, $C5, $00
DATA_1AE329:         db $FB, $F6, $20, $01, $02
DATA_1AE32E:         db $FB, $01, $2A, $05, $02
DATA_1AE333:         db $00, $0C, $37, $03, $00
DATA_1AE338:         db $F5, $F6, $42, $0A, $00
DATA_1AE33D:         db $FB, $FA, $38, $03, $00
DATA_1AE342:         db $04, $05, $26, $85, $00
DATA_1AE347:         db $FC, $F6, $20, $01, $02
DATA_1AE34C:         db $FC, $01, $24, $05, $02
DATA_1AE351:         db $00, $0C, $37, $03, $00
DATA_1AE356:         db $F8, $01, $26, $05, $00
DATA_1AE35B:         db $FD, $F6, $20, $01, $00
DATA_1AE360:         db $06, $04, $39, $03, $00
DATA_1AE365:         db $03, $03, $26, $05, $00
DATA_1AE36A:         db $FD, $F6, $20, $01, $02
DATA_1AE36F:         db $FD, $01, $24, $05, $02
DATA_1AE374:         db $00, $0C, $37, $03, $00
DATA_1AE379:         db $F9, $01, $26, $05, $00
DATA_1AE37E:         db $FE, $F7, $20, $01, $00
DATA_1AE383:         db $0A, $0C, $38, $C3, $00
DATA_1AE388:         db $04, $03, $26, $05, $00
DATA_1AE38D:         db $FE, $F7, $20, $01, $02
DATA_1AE392:         db $FE, $01, $24, $05, $02
DATA_1AE397:         db $00, $0C, $37, $03, $00
DATA_1AE39C:         db $FA, $01, $26, $05, $00
DATA_1AE3A1:         db $FF, $F9, $20, $01, $00
DATA_1AE3A6:         db $0A, $0C, $37, $43, $00
DATA_1AE3AB:         db $05, $05, $26, $05, $00
DATA_1AE3B0:         db $FF, $F9, $20, $01, $02
DATA_1AE3B5:         db $FF, $02, $24, $05, $02
DATA_1AE3BA:         db $00, $0C, $37, $03, $00
DATA_1AE3BF:         db $FB, $03, $26, $05, $00
DATA_1AE3C4:         db $00, $FB, $20, $01, $00
DATA_1AE3C9:         db $0B, $0C, $36, $03, $00
DATA_1AE3CE:         db $06, $06, $26, $05, $00
DATA_1AE3D3:         db $00, $FB, $20, $01, $02
DATA_1AE3D8:         db $00, $04, $24, $05, $02
DATA_1AE3DD:         db $00, $0C, $36, $03, $00
DATA_1AE3E2:         db $FC, $04, $26, $05, $00
DATA_1AE3E7:         db $02, $FA, $20, $01, $00
DATA_1AE3EC:         db $07, $07, $26, $05, $00
DATA_1AE3F1:         db $02, $07, $26, $45, $00
DATA_1AE3F6:         db $02, $FA, $20, $01, $02
DATA_1AE3FB:         db $0B, $0C, $36, $03, $00
DATA_1AE400:         db $00, $0C, $36, $03, $00
DATA_1AE405:         db $04, $03, $24, $05, $02
DATA_1AE40A:         db $02, $FB, $20, $01, $00
DATA_1AE40F:         db $0A, $09, $28, $05, $00
DATA_1AE414:         db $05, $09, $28, $45, $00
DATA_1AE419:         db $02, $FB, $20, $01, $02
DATA_1AE41E:         db $0B, $0C, $36, $03, $00
DATA_1AE423:         db $00, $0C, $36, $03, $00
DATA_1AE428:         db $04, $04, $24, $05, $02
DATA_1AE42D:         db $03, $FC, $20, $01, $00
DATA_1AE432:         db $0A, $0B, $28, $45, $00
DATA_1AE437:         db $0F, $09, $28, $05, $00
DATA_1AE43C:         db $03, $FC, $20, $01, $02
DATA_1AE441:         db $0B, $0C, $36, $03, $00
DATA_1AE446:         db $00, $0C, $36, $03, $00
DATA_1AE44B:         db $05, $05, $24, $05, $02
DATA_1AE450:         db $04, $FC, $20, $01, $00
DATA_1AE455:         db $0D, $0B, $28, $45, $00
DATA_1AE45A:         db $11, $08, $28, $05, $00
DATA_1AE45F:         db $04, $FC, $20, $01, $02
DATA_1AE464:         db $0B, $0C, $36, $03, $00
DATA_1AE469:         db $00, $0C, $36, $03, $00
DATA_1AE46E:         db $06, $05, $24, $05, $02
DATA_1AE473:         db $FB, $F9, $20, $01, $00
DATA_1AE478:         db $F6, $07, $28, $05, $00
DATA_1AE47D:         db $F5, $02, $28, $85, $00
DATA_1AE482:         db $FB, $F9, $20, $01, $02
DATA_1AE487:         db $0B, $0C, $37, $03, $00
DATA_1AE48C:         db $00, $0C, $36, $03, $00
DATA_1AE491:         db $FD, $03, $24, $05, $02
DATA_1AE496:         db $FF, $F9, $20, $01, $00
DATA_1AE49B:         db $04, $04, $26, $05, $00
DATA_1AE4A0:         db $FA, $03, $26, $05, $00
DATA_1AE4A5:         db $FF, $F9, $20, $01, $02
DATA_1AE4AA:         db $0B, $0C, $36, $03, $00
DATA_1AE4AF:         db $FC, $0C, $36, $03, $00
DATA_1AE4B4:         db $01, $02, $24, $05, $02
DATA_1AE4B9:         db $FF, $F9, $20, $01, $00
DATA_1AE4BE:         db $04, $04, $26, $05, $00
DATA_1AE4C3:         db $FA, $03, $26, $05, $00
DATA_1AE4C8:         db $FF, $F9, $20, $01, $02
DATA_1AE4CD:         db $0E, $0C, $36, $03, $00
DATA_1AE4D2:         db $FE, $0C, $36, $03, $00
DATA_1AE4D7:         db $01, $02, $24, $05, $02
DATA_1AE4DC:         db $FF, $F9, $20, $01, $00
DATA_1AE4E1:         db $04, $04, $26, $05, $00
DATA_1AE4E6:         db $FA, $03, $26, $05, $00
DATA_1AE4EB:         db $FF, $F9, $20, $01, $02
DATA_1AE4F0:         db $0C, $0C, $36, $03, $00
DATA_1AE4F5:         db $FE, $0C, $36, $03, $00
DATA_1AE4FA:         db $01, $02, $24, $05, $02
DATA_1AE4FF:         db $09, $0C, $38, $83, $00
DATA_1AE504:         db $00, $F4, $20, $01, $02
DATA_1AE509:         db $09, $0C, $38, $83, $00
DATA_1AE50E:         db $FE, $04, $38, $03, $00
DATA_1AE513:         db $02, $FE, $24, $05, $02
DATA_1AE518:         db $0F, $F9, $26, $45, $00
DATA_1AE51D:         db $FC, $F8, $26, $05, $00
DATA_1AE522:         db $00, $FB, $20, $01, $00
DATA_1AE527:         db $05, $05, $26, $05, $00
DATA_1AE52C:         db $FB, $04, $26, $05, $00
DATA_1AE531:         db $00, $FB, $20, $01, $02
DATA_1AE536:         db $0B, $0C, $36, $03, $00
DATA_1AE53B:         db $00, $0C, $36, $03, $00
DATA_1AE540:         db $02, $03, $24, $05, $02
DATA_1AE545:         db $00, $F4, $20, $01, $00
DATA_1AE54A:         db $09, $0C, $38, $83, $00
DATA_1AE54F:         db $00, $F4, $20, $01, $02
DATA_1AE554:         db $02, $0C, $38, $83, $00
DATA_1AE559:         db $02, $FE, $24, $05, $02
DATA_1AE55E:         db $0F, $FE, $26, $C5, $00
DATA_1AE563:         db $FC, $FE, $26, $85, $00
DATA_1AE568:         db $FF, $F5, $20, $01, $00
DATA_1AE56D:         db $07, $0A, $36, $03, $00
DATA_1AE572:         db $FF, $F5, $20, $01, $02
DATA_1AE577:         db $00, $0A, $36, $03, $00
DATA_1AE57C:         db $02, $FE, $24, $05, $02
DATA_1AE581:         db $0E, $FB, $26, $45, $00
DATA_1AE586:         db $FC, $FA, $26, $05, $00
DATA_1AE58B:         db $FF, $F5, $20, $01, $00
DATA_1AE590:         db $04, $05, $38, $03, $00
DATA_1AE595:         db $FF, $F5, $20, $01, $02
DATA_1AE59A:         db $FD, $05, $38, $03, $00
DATA_1AE59F:         db $02, $FE, $24, $05, $02
DATA_1AE5A4:         db $0D, $F7, $26, $45, $00
DATA_1AE5A9:         db $FD, $F6, $26, $05, $00
DATA_1AE5AE:         db $FF, $F5, $20, $01, $00
DATA_1AE5B3:         db $04, $03, $38, $03, $00
DATA_1AE5B8:         db $FF, $F5, $20, $01, $02
DATA_1AE5BD:         db $FD, $03, $38, $03, $00
DATA_1AE5C2:         db $02, $FE, $24, $05, $02
DATA_1AE5C7:         db $0C, $F6, $26, $45, $00
DATA_1AE5CC:         db $FE, $F5, $26, $05, $00
DATA_1AE5D1:         db $FC, $01, $20, $01, $00
DATA_1AE5D6:         db $0C, $0C, $26, $C5, $00
DATA_1AE5DB:         db $04, $0D, $38, $03, $00
DATA_1AE5E0:         db $FC, $01, $20, $01, $02
DATA_1AE5E5:         db $FD, $0D, $38, $03, $00
DATA_1AE5EA:         db $02, $05, $24, $05, $02
DATA_1AE5EF:         db $F9, $0B, $26, $85, $00
DATA_1AE5F4:         db $FC, $03, $20, $01, $00
DATA_1AE5F9:         db $0C, $0C, $26, $C5, $00
DATA_1AE5FE:         db $04, $0D, $38, $03, $00
DATA_1AE603:         db $FC, $03, $20, $01, $02
DATA_1AE608:         db $FD, $0D, $38, $03, $00
DATA_1AE60D:         db $02, $05, $24, $05, $02
DATA_1AE612:         db $F9, $0B, $26, $85, $00
DATA_1AE617:         db $FD, $FF, $20, $01, $00
DATA_1AE61C:         db $0B, $0C, $26, $C5, $00
DATA_1AE621:         db $04, $0D, $38, $03, $00
DATA_1AE626:         db $FD, $FF, $20, $01, $02
DATA_1AE62B:         db $FD, $0D, $38, $03, $00
DATA_1AE630:         db $02, $05, $24, $05, $02
DATA_1AE635:         db $FA, $0C, $26, $85, $00
DATA_1AE63A:         db $FE, $FC, $20, $01, $00
DATA_1AE63F:         db $0B, $0B, $26, $C5, $00
DATA_1AE644:         db $04, $0D, $38, $03, $00
DATA_1AE649:         db $FE, $FC, $20, $01, $02
DATA_1AE64E:         db $FD, $0D, $38, $03, $00
DATA_1AE653:         db $02, $05, $24, $05, $02
DATA_1AE658:         db $FB, $0B, $26, $85, $00
DATA_1AE65D:         db $00, $FC, $20, $01, $00
DATA_1AE662:         db $0B, $0A, $26, $C5, $00
DATA_1AE667:         db $04, $0D, $38, $03, $00
DATA_1AE66C:         db $00, $FC, $20, $01, $02
DATA_1AE671:         db $FD, $0D, $38, $03, $00
DATA_1AE676:         db $02, $05, $24, $05, $02
DATA_1AE67B:         db $FC, $0A, $26, $85, $00
DATA_1AE680:         db $08, $FC, $20, $41, $00
DATA_1AE685:         db $0B, $09, $26, $C5, $00
DATA_1AE68A:         db $04, $0D, $38, $03, $00
DATA_1AE68F:         db $00, $FC, $20, $41, $02
DATA_1AE694:         db $FD, $0D, $38, $03, $00
DATA_1AE699:         db $02, $05, $24, $05, $02
DATA_1AE69E:         db $FC, $09, $26, $85, $00
DATA_1AE6A3:         db $00, $00, $EC, $08, $02
DATA_1AE6A8:         db $00, $00, $EC, $08, $02
DATA_1AE6AD:         db $00, $00, $EC, $08, $02
DATA_1AE6B2:         db $00, $00, $EC, $08, $02
DATA_1AE6B7:         db $00, $00, $EC, $08, $02
DATA_1AE6BC:         db $00, $00, $EC, $08, $02
DATA_1AE6C1:         db $00, $00, $EC, $08, $02
DATA_1AE6C6:         db $00, $00, $EC, $08, $02
DATA_1AE6CB:         db $00, $00, $60, $01, $02
DATA_1AE6D0:         db $00, $00, $60, $01, $02
DATA_1AE6D5:         db $00, $00, $60, $01, $02
DATA_1AE6DA:         db $00, $00, $60, $01, $02
DATA_1AE6DF:         db $00, $00, $60, $01, $02
DATA_1AE6E4:         db $00, $00, $60, $01, $02
DATA_1AE6E9:         db $00, $00, $60, $01, $02
DATA_1AE6EE:         db $00, $00, $60, $01, $02
DATA_1AE6F3:         db $00, $00, $60, $01, $02
DATA_1AE6F8:         db $00, $00, $60, $01, $02
DATA_1AE6FD:         db $00, $00, $60, $01, $02
DATA_1AE702:         db $00, $00, $60, $01, $02
DATA_1AE707:         db $00, $00, $60, $01, $02
DATA_1AE70C:         db $00, $00, $60, $01, $02
DATA_1AE711:         db $00, $00, $60, $01, $02
DATA_1AE716:         db $00, $00, $60, $01, $02
DATA_1AE71B:         db $00, $00, $60, $01, $02
DATA_1AE720:         db $00, $00, $60, $01, $02
DATA_1AE725:         db $00, $00, $60, $01, $02
DATA_1AE72A:         db $00, $00, $60, $01, $02
DATA_1AE72F:         db $08, $08, $20, $01, $00
DATA_1AE734:         db $10, $08, $20, $41, $00
DATA_1AE739:         db $08, $10, $21, $01, $00
DATA_1AE73E:         db $10, $10, $21, $41, $00
DATA_1AE743:         db $00, $18, $30, $01, $00
DATA_1AE748:         db $08, $18, $31, $01, $00
DATA_1AE74D:         db $10, $18, $31, $41, $00
DATA_1AE752:         db $18, $18, $30, $41, $00
DATA_1AE757:         db $00, $20, $22, $01, $02
DATA_1AE75C:         db $10, $20, $22, $C1, $02
DATA_1AE761:         db $00, $00, $C0, $01, $02
DATA_1AE766:         db $10, $00, $C2, $01, $02
DATA_1AE76B:         db $00, $10, $E0, $01, $02
DATA_1AE770:         db $10, $10, $E2, $01, $02
DATA_1AE775:         db $00, $00, $22, $01, $02
DATA_1AE77A:         db $10, $00, $22, $C1, $02
DATA_1AE77F:         db $00, $00, $C0, $01, $02
DATA_1AE784:         db $10, $00, $C2, $01, $02
DATA_1AE789:         db $00, $10, $E0, $01, $02
DATA_1AE78E:         db $10, $10, $E2, $01, $02
DATA_1AE793:         db $F8, $F7, $0E, $0B, $02
DATA_1AE798:         db $08, $F7, $2E, $0B, $02
DATA_1AE79D:         db $0B, $08, $9E, $00, $00
DATA_1AE7A2:         db $FE, $08, $9E, $00, $00
DATA_1AE7A7:         db $00, $05, $8A, $01, $00
DATA_1AE7AC:         db $08, $05, $8B, $01, $00
DATA_1AE7B1:         db $08, $05, $8B, $01, $00
DATA_1AE7B6:         db $0B, $08, $9E, $00, $00
DATA_1AE7BB:         db $F2, $FB, $0E, $0B, $02
DATA_1AE7C0:         db $02, $FB, $2E, $0B, $02
DATA_1AE7C5:         db $FD, $08, $9E, $00, $00
DATA_1AE7CA:         db $FF, $06, $8A, $01, $00
DATA_1AE7CF:         db $07, $06, $8B, $01, $00
DATA_1AE7D4:         db $07, $06, $8B, $01, $00
DATA_1AE7D9:         db $08, $F7, $2E, $0B, $02
DATA_1AE7DE:         db $F8, $F7, $0E, $0B, $02
DATA_1AE7E3:         db $FD, $05, $2F, $00, $00
DATA_1AE7E8:         db $0A, $09, $2F, $40, $00
DATA_1AE7ED:         db $07, $05, $8B, $01, $00
DATA_1AE7F2:         db $FF, $05, $8A, $01, $00
DATA_1AE7F7:         db $FF, $05, $8A, $01, $00
DATA_1AE7FC:         db $08, $F8, $2E, $0B, $02
DATA_1AE801:         db $F8, $F8, $0E, $0B, $02
DATA_1AE806:         db $FF, $07, $2E, $00, $00
DATA_1AE80B:         db $0C, $08, $2F, $00, $00
DATA_1AE810:         db $07, $04, $8B, $01, $00
DATA_1AE815:         db $FF, $04, $8A, $01, $00
DATA_1AE81A:         db $FF, $04, $8A, $01, $00
DATA_1AE81F:         db $08, $F9, $2E, $0B, $02
DATA_1AE824:         db $F8, $F9, $0E, $0B, $02
DATA_1AE829:         db $09, $07, $2F, $00, $00
DATA_1AE82E:         db $02, $08, $9E, $00, $00
DATA_1AE833:         db $07, $05, $8B, $01, $00
DATA_1AE838:         db $FF, $05, $8A, $01, $00
DATA_1AE83D:         db $FF, $05, $8A, $01, $00
DATA_1AE842:         db $08, $F8, $2E, $0B, $02
DATA_1AE847:         db $F8, $F8, $0E, $0B, $02
DATA_1AE84C:         db $06, $07, $2F, $40, $00
DATA_1AE851:         db $04, $08, $9E, $00, $00
DATA_1AE856:         db $08, $05, $8B, $01, $00
DATA_1AE85B:         db $00, $05, $8A, $01, $00
DATA_1AE860:         db $00, $05, $8A, $01, $00
DATA_1AE865:         db $08, $F6, $2E, $0B, $02
DATA_1AE86A:         db $F8, $F6, $0E, $0B, $02
DATA_1AE86F:         db $02, $08, $2E, $80, $00
DATA_1AE874:         db $07, $07, $9E, $00, $00
DATA_1AE879:         db $07, $05, $8B, $01, $00
DATA_1AE87E:         db $FF, $05, $8A, $01, $00
DATA_1AE883:         db $FF, $05, $8A, $01, $00
DATA_1AE888:         db $08, $F6, $2E, $0B, $02
DATA_1AE88D:         db $F8, $F6, $0E, $0B, $02
DATA_1AE892:         db $00, $07, $2E, $00, $00
DATA_1AE897:         db $09, $08, $2E, $40, $00
DATA_1AE89C:         db $07, $06, $8B, $01, $00
DATA_1AE8A1:         db $FF, $06, $8A, $01, $00
DATA_1AE8A6:         db $FF, $06, $8A, $01, $00
DATA_1AE8AB:         db $08, $F6, $2E, $0B, $02
DATA_1AE8B0:         db $07, $05, $8B, $01, $00
DATA_1AE8B5:         db $FF, $05, $8A, $01, $00
DATA_1AE8BA:         db $F8, $F6, $0E, $0B, $02
DATA_1AE8BF:         db $04, $0A, $9E, $00, $00
DATA_1AE8C4:         db $0D, $07, $2F, $40, $00
DATA_1AE8C9:         db $FC, $07, $2F, $00, $00
DATA_1AE8CE:         db $08, $F5, $2E, $0B, $02
DATA_1AE8D3:         db $07, $04, $8B, $01, $00
DATA_1AE8D8:         db $FF, $04, $8A, $01, $00
DATA_1AE8DD:         db $F8, $F5, $0E, $0B, $02
DATA_1AE8E2:         db $FF, $08, $9E, $00, $00
DATA_1AE8E7:         db $09, $08, $9E, $40, $00
DATA_1AE8EC:         db $09, $08, $8E, $40, $00
DATA_1AE8F1:         db $08, $F6, $2E, $0B, $02
DATA_1AE8F6:         db $F8, $F6, $0E, $0B, $02
DATA_1AE8FB:         db $FF, $08, $9E, $00, $00
DATA_1AE900:         db $0A, $08, $9E, $00, $00
DATA_1AE905:         db $07, $05, $8B, $01, $00
DATA_1AE90A:         db $FF, $05, $8A, $01, $00
DATA_1AE90F:         db $FF, $05, $8A, $01, $00
DATA_1AE914:         db $F8, $F6, $2E, $4B, $02
DATA_1AE919:         db $08, $F6, $0E, $4B, $02
DATA_1AE91E:         db $FE, $08, $9E, $00, $00
DATA_1AE923:         db $09, $08, $9E, $00, $00
DATA_1AE928:         db $06, $05, $8B, $01, $00
DATA_1AE92D:         db $FE, $05, $8A, $01, $00
DATA_1AE932:         db $FE, $05, $8A, $01, $00
DATA_1AE937:         db $08, $F2, $2E, $0B, $02
DATA_1AE93C:         db $07, $08, $2F, $40, $00
DATA_1AE941:         db $02, $08, $2F, $40, $00
DATA_1AE946:         db $06, $01, $8B, $01, $00
DATA_1AE94B:         db $FE, $01, $8A, $01, $00
DATA_1AE950:         db $F8, $F2, $0E, $0B, $02
DATA_1AE955:         db $F8, $F2, $0E, $0B, $02
DATA_1AE95A:         db $08, $F3, $2E, $0B, $02
DATA_1AE95F:         db $F8, $F3, $0E, $0B, $02
DATA_1AE964:         db $08, $08, $2E, $80, $00
DATA_1AE969:         db $03, $08, $2E, $80, $00
DATA_1AE96E:         db $08, $01, $8B, $01, $00
DATA_1AE973:         db $00, $01, $8A, $01, $00
DATA_1AE978:         db $00, $01, $8A, $01, $00
DATA_1AE97D:         db $08, $F2, $2E, $0B, $02
DATA_1AE982:         db $05, $01, $9E, $00, $00
DATA_1AE987:         db $00, $01, $9E, $00, $00
DATA_1AE98C:         db $F8, $F2, $0E, $0B, $02
DATA_1AE991:         db $08, $FF, $8B, $01, $00
DATA_1AE996:         db $00, $FF, $8A, $01, $00
DATA_1AE99B:         db $00, $FF, $8A, $01, $00
DATA_1AE9A0:         db $08, $F2, $2E, $0B, $02
DATA_1AE9A5:         db $05, $00, $2E, $00, $00
DATA_1AE9AA:         db $00, $00, $2E, $00, $00
DATA_1AE9AF:         db $F8, $F2, $0E, $0B, $02
DATA_1AE9B4:         db $09, $FF, $8B, $01, $00
DATA_1AE9B9:         db $01, $FF, $8A, $01, $00
DATA_1AE9BE:         db $01, $FF, $8A, $01, $00
DATA_1AE9C3:         db $08, $F2, $2E, $0B, $02
DATA_1AE9C8:         db $04, $FF, $2F, $00, $00
DATA_1AE9CD:         db $FF, $FF, $2F, $00, $00
DATA_1AE9D2:         db $F8, $F2, $0E, $0B, $02
DATA_1AE9D7:         db $09, $FF, $8B, $01, $00
DATA_1AE9DC:         db $01, $FF, $8A, $01, $00
DATA_1AE9E1:         db $01, $FF, $8A, $01, $00
DATA_1AE9E6:         db $05, $FC, $2E, $0B, $02
DATA_1AE9EB:         db $F5, $FC, $0E, $0B, $02
DATA_1AE9F0:         db $FF, $08, $9E, $00, $00
DATA_1AE9F5:         db $0A, $08, $9E, $00, $00
DATA_1AE9FA:         db $07, $08, $8B, $01, $00
DATA_1AE9FF:         db $FF, $08, $8A, $01, $00
DATA_1AEA04:         db $FF, $08, $8A, $01, $00
DATA_1AEA09:         db $05, $FA, $2E, $0B, $02
DATA_1AEA0E:         db $F5, $FA, $0E, $0B, $02
DATA_1AEA13:         db $FF, $08, $9E, $00, $00
DATA_1AEA18:         db $0A, $08, $9E, $00, $00
DATA_1AEA1D:         db $07, $07, $8B, $01, $00
DATA_1AEA22:         db $FF, $07, $8A, $01, $00
DATA_1AEA27:         db $FF, $07, $8A, $01, $00
DATA_1AEA2C:         db $07, $F6, $2E, $0B, $02
DATA_1AEA31:         db $F7, $F6, $0E, $0B, $02
DATA_1AEA36:         db $FF, $08, $9E, $00, $00
DATA_1AEA3B:         db $0A, $08, $9E, $00, $00
DATA_1AEA40:         db $07, $05, $8B, $01, $00
DATA_1AEA45:         db $FF, $05, $8A, $01, $00
DATA_1AEA4A:         db $FF, $05, $8A, $01, $00
DATA_1AEA4F:         db $04, $F7, $2E, $0B, $02
DATA_1AEA54:         db $F4, $F7, $0E, $0B, $02
DATA_1AEA59:         db $FE, $08, $9E, $00, $00
DATA_1AEA5E:         db $0B, $08, $9E, $00, $00
DATA_1AEA63:         db $07, $05, $8B, $01, $00
DATA_1AEA68:         db $FF, $05, $8A, $01, $00
DATA_1AEA6D:         db $FF, $05, $8A, $01, $00
DATA_1AEA72:         db $03, $F7, $2E, $0B, $02
DATA_1AEA77:         db $F3, $F7, $0E, $0B, $02
DATA_1AEA7C:         db $FD, $08, $9E, $00, $00
DATA_1AEA81:         db $0C, $08, $9E, $00, $00
DATA_1AEA86:         db $06, $05, $8B, $01, $00
DATA_1AEA8B:         db $FE, $05, $8A, $01, $00
DATA_1AEA90:         db $FE, $05, $8A, $01, $00
DATA_1AEA95:         db $05, $F7, $2E, $0B, $02
DATA_1AEA9A:         db $F5, $F7, $0E, $0B, $02
DATA_1AEA9F:         db $FD, $08, $9E, $00, $00
DATA_1AEAA4:         db $0C, $08, $9E, $00, $00
DATA_1AEAA9:         db $07, $05, $8B, $01, $00
DATA_1AEAAE:         db $FF, $05, $8A, $01, $00
DATA_1AEAB3:         db $FF, $05, $8A, $01, $00
DATA_1AEAB8:         db $06, $F7, $2E, $0B, $02
DATA_1AEABD:         db $F6, $F7, $0E, $0B, $02
DATA_1AEAC2:         db $FD, $08, $9E, $00, $00
DATA_1AEAC7:         db $0C, $08, $9E, $00, $00
DATA_1AEACC:         db $08, $05, $8B, $01, $00
DATA_1AEAD1:         db $00, $05, $8A, $01, $00
DATA_1AEAD6:         db $00, $05, $8A, $01, $00
DATA_1AEADB:         db $04, $F7, $2E, $0B, $02
DATA_1AEAE0:         db $F4, $F7, $0E, $0B, $02
DATA_1AEAE5:         db $FE, $08, $9E, $00, $00
DATA_1AEAEA:         db $0A, $08, $9E, $00, $00
DATA_1AEAEF:         db $06, $05, $8B, $01, $00
DATA_1AEAF4:         db $FE, $05, $8A, $01, $00
DATA_1AEAF9:         db $FE, $05, $8A, $01, $00
DATA_1AEAFE:         db $0B, $08, $9E, $00, $00
DATA_1AEB03:         db $FE, $08, $9E, $00, $00
DATA_1AEB08:         db $09, $F7, $2E, $0B, $02
DATA_1AEB0D:         db $F9, $F7, $0E, $0B, $02
DATA_1AEB12:         db $00, $05, $8A, $01, $00
DATA_1AEB17:         db $08, $05, $8B, $01, $00
DATA_1AEB1C:         db $08, $05, $8B, $01, $00
DATA_1AEB21:         db $FD, $08, $9E, $00, $00
DATA_1AEB26:         db $05, $FA, $2E, $0B, $02
DATA_1AEB2B:         db $F5, $FA, $0E, $0B, $02
DATA_1AEB30:         db $FF, $05, $8A, $01, $00
DATA_1AEB35:         db $0B, $08, $9E, $00, $00
DATA_1AEB3A:         db $07, $05, $8B, $01, $00
DATA_1AEB3F:         db $07, $05, $8B, $01, $00
DATA_1AEB44:         db $FD, $08, $9E, $00, $00
DATA_1AEB49:         db $03, $FC, $2E, $0B, $02
DATA_1AEB4E:         db $F3, $FC, $0E, $0B, $02
DATA_1AEB53:         db $FF, $06, $8A, $01, $00
DATA_1AEB58:         db $0C, $08, $9E, $00, $00
DATA_1AEB5D:         db $07, $06, $8B, $01, $00
DATA_1AEB62:         db $07, $06, $8B, $01, $00
DATA_1AEB67:         db $03, $EE, $59, $06, $00
DATA_1AEB6C:         db $EE, $E8, $59, $06, $00
DATA_1AEB71:         db $FC, $F7, $E7, $06, $02
DATA_1AEB76:         db $0B, $F2, $E7, $06, $00
DATA_1AEB7B:         db $13, $F2, $E8, $06, $00
DATA_1AEB80:         db $0B, $FA, $F7, $06, $00
DATA_1AEB85:         db $13, $FA, $F8, $06, $00
DATA_1AEB8A:         db $13, $FA, $F8, $06, $00
DATA_1AEB8F:         db $00, $EB, $E7, $06, $02
DATA_1AEB94:         db $F5, $DD, $F7, $86, $00
DATA_1AEB99:         db $FC, $F9, $E7, $06, $02
DATA_1AEB9E:         db $0A, $F4, $E5, $06, $02
DATA_1AEBA3:         db $EA, $E6, $E7, $06, $00
DATA_1AEBA8:         db $F2, $E6, $E8, $06, $00
DATA_1AEBAD:         db $EA, $EE, $F7, $06, $00
DATA_1AEBB2:         db $F2, $EE, $F8, $06, $00
DATA_1AEBB7:         db $00, $EE, $E5, $06, $02
DATA_1AEBBC:         db $00, $F6, $59, $06, $00
DATA_1AEBC1:         db $0E, $E0, $59, $06, $00
DATA_1AEBC6:         db $F6, $E1, $59, $06, $00
DATA_1AEBCB:         db $FD, $FB, $E5, $06, $02
DATA_1AEBD0:         db $09, $F6, $E5, $06, $02
DATA_1AEBD5:         db $EA, $E8, $E7, $06, $02
DATA_1AEBDA:         db $EA, $E8, $E7, $06, $00
DATA_1AEBDF:         db $01, $F1, $E3, $06, $02
DATA_1AEBE4:         db $FD, $F3, $59, $06, $00
DATA_1AEBE9:         db $0E, $E2, $59, $06, $00
DATA_1AEBEE:         db $F6, $E3, $59, $06, $00
DATA_1AEBF3:         db $FE, $FD, $E5, $06, $02
DATA_1AEBF8:         db $08, $F8, $E3, $06, $02
DATA_1AEBFD:         db $EB, $EA, $E5, $06, $02
DATA_1AEC02:         db $F3, $F6, $E7, $06, $02
DATA_1AEC07:         db $02, $F4, $E3, $06, $02
DATA_1AEC0C:         db $FF, $FF, $E3, $06, $02
DATA_1AEC11:         db $07, $FA, $E3, $06, $02
DATA_1AEC16:         db $FB, $F3, $E7, $06, $02
DATA_1AEC1B:         db $EC, $EC, $E5, $06, $02
DATA_1AEC20:         db $F1, $F8, $E7, $06, $02
DATA_1AEC25:         db $0A, $E0, $E7, $06, $02
DATA_1AEC2A:         db $F2, $E1, $E7, $06, $02
DATA_1AEC2F:         db $0A, $06, $42, $C2, $02
DATA_1AEC34:         db $FA, $06, $42, $82, $02
DATA_1AEC39:         db $0A, $F6, $42, $42, $02
DATA_1AEC3E:         db $FA, $F6, $42, $02, $02
DATA_1AEC43:         db $F2, $FA, $E5, $06, $02
DATA_1AEC48:         db $ED, $EE, $E3, $06, $02
DATA_1AEC4D:         db $0A, $E2, $E7, $06, $02
DATA_1AEC52:         db $F2, $E3, $E7, $06, $02
DATA_1AEC57:         db $FB, $F9, $E5, $06, $02
DATA_1AEC5C:         db $F3, $FC, $E5, $06, $02
DATA_1AEC61:         db $EE, $F0, $E3, $06, $02
DATA_1AEC66:         db $0A, $E4, $E7, $06, $02
DATA_1AEC6B:         db $FA, $DF, $E7, $06, $02
DATA_1AEC70:         db $F3, $E5, $E5, $06, $02
DATA_1AEC75:         db $EB, $ED, $E7, $06, $02
DATA_1AEC7A:         db $EB, $ED, $E7, $06, $00
DATA_1AEC7F:         db $F6, $F8, $42, $C2, $02
DATA_1AEC84:         db $E6, $F8, $42, $82, $02
DATA_1AEC89:         db $F6, $E8, $42, $42, $02
DATA_1AEC8E:         db $E6, $E8, $42, $02, $02
DATA_1AEC93:         db $FB, $FB, $E5, $06, $02
DATA_1AEC98:         db $F3, $FF, $E3, $06, $02
DATA_1AEC9D:         db $09, $E6, $E5, $06, $02
DATA_1AECA2:         db $FA, $E1, $E7, $06, $02
DATA_1AECA7:         db $FB, $FD, $E3, $06, $02
DATA_1AECAC:         db $F4, $01, $E3, $06, $02
DATA_1AECB1:         db $08, $E8, $E5, $06, $02
DATA_1AECB6:         db $FB, $E3, $E5, $06, $02
DATA_1AECBB:         db $FB, $F6, $E7, $06, $02
DATA_1AECC0:         db $03, $ED, $E7, $06, $02
DATA_1AECC5:         db $F4, $E9, $E5, $06, $02
DATA_1AECCA:         db $EC, $F1, $E5, $06, $02
DATA_1AECCF:         db $02, $0A, $42, $C2, $02
DATA_1AECD4:         db $F2, $0A, $42, $82, $02
DATA_1AECD9:         db $02, $FA, $42, $42, $02
DATA_1AECDE:         db $F2, $FA, $42, $02, $02
DATA_1AECE3:         db $08, $EA, $E3, $06, $02
DATA_1AECE8:         db $FB, $E5, $E5, $06, $02
DATA_1AECED:         db $F4, $EB, $E3, $06, $02
DATA_1AECF2:         db $EC, $F3, $E5, $06, $02
DATA_1AECF7:         db $07, $EC, $E3, $06, $02
DATA_1AECFC:         db $FC, $E7, $E3, $06, $02
DATA_1AED01:         db $04, $00, $4F, $40, $00
DATA_1AED06:         db $F4, $F8, $4F, $80, $00
DATA_1AED0B:         db $FB, $FA, $E5, $06, $02
DATA_1AED10:         db $02, $F1, $E5, $06, $02
DATA_1AED15:         db $F5, $ED, $E3, $06, $02
DATA_1AED1A:         db $ED, $F5, $E3, $06, $02
DATA_1AED1F:         db $08, $F2, $42, $C2, $02
DATA_1AED24:         db $08, $E2, $42, $42, $02
DATA_1AED29:         db $F8, $F2, $42, $82, $02
DATA_1AED2E:         db $F8, $E2, $42, $02, $02
DATA_1AED33:         db $FB, $FC, $E5, $06, $02
DATA_1AED38:         db $01, $F3, $E3, $06, $02
DATA_1AED3D:         db $F5, $F0, $E3, $06, $02
DATA_1AED42:         db $EE, $F7, $E3, $06, $02
DATA_1AED47:         db $F4, $F4, $4E, $80, $00
DATA_1AED4C:         db $04, $F4, $4F, $00, $00
DATA_1AED51:         db $04, $04, $4E, $40, $00
DATA_1AED56:         db $F4, $04, $4F, $C0, $00
DATA_1AED5B:         db $FA, $FE, $E3, $06, $02
DATA_1AED60:         db $00, $F5, $E3, $06, $02
DATA_1AED65:         db $F6, $F2, $E3, $06, $02
DATA_1AED6A:         db $EF, $F9, $E3, $06, $02
DATA_1AED6F:         db $F8, $00, $4E, $C0, $00
DATA_1AED74:         db $F8, $F8, $4D, $80, $00
DATA_1AED79:         db $00, $00, $4D, $40, $00
DATA_1AED7E:         db $00, $F8, $4E, $00, $00
DATA_1AED83:         db $00, $00, $42, $C2, $02
DATA_1AED88:         db $F0, $00, $42, $82, $02
DATA_1AED8D:         db $00, $F0, $42, $42, $02
DATA_1AED92:         db $F0, $F0, $42, $02, $02
DATA_1AED97:         db $18, $F8, $42, $C2, $02
DATA_1AED9C:         db $08, $F8, $42, $82, $02
DATA_1AEDA1:         db $18, $E8, $42, $42, $02
DATA_1AEDA6:         db $08, $E8, $42, $02, $02
DATA_1AEDAB:         db $10, $1B, $44, $06, $00
DATA_1AEDB0:         db $E8, $1B, $44, $06, $00
DATA_1AEDB5:         db $CC, $06, $44, $06, $00
DATA_1AEDBA:         db $2C, $06, $44, $06, $00
DATA_1AEDBF:         db $2C, $F1, $44, $06, $00
DATA_1AEDC4:         db $10, $DE, $44, $06, $00
DATA_1AEDC9:         db $E8, $DE, $44, $06, $00
DATA_1AEDCE:         db $CC, $F1, $44, $06, $00
DATA_1AEDD3:         db $10, $10, $42, $C2, $02
DATA_1AEDD8:         db $00, $10, $42, $82, $02
DATA_1AEDDD:         db $10, $00, $42, $42, $02
DATA_1AEDE2:         db $00, $00, $42, $02, $02
DATA_1AEDE7:         db $0D, $17, $54, $06, $00
DATA_1AEDEC:         db $EA, $17, $54, $06, $00
DATA_1AEDF1:         db $D0, $05, $54, $06, $00
DATA_1AEDF6:         db $29, $05, $54, $06, $00
DATA_1AEDFB:         db $29, $F3, $54, $06, $00
DATA_1AEE00:         db $0E, $E1, $54, $06, $00
DATA_1AEE05:         db $EA, $E1, $54, $06, $00
DATA_1AEE0A:         db $D0, $F3, $54, $06, $00
DATA_1AEE0F:         db $EF, $0C, $42, $C2, $02
DATA_1AEE14:         db $DF, $0C, $42, $82, $02
DATA_1AEE19:         db $EF, $FC, $42, $42, $02
DATA_1AEE1E:         db $DF, $FC, $42, $02, $02
DATA_1AEE23:         db $0B, $13, $45, $06, $00
DATA_1AEE28:         db $EE, $13, $45, $06, $00
DATA_1AEE2D:         db $D5, $05, $45, $06, $00
DATA_1AEE32:         db $27, $05, $45, $06, $00
DATA_1AEE37:         db $27, $F3, $45, $06, $00
DATA_1AEE3C:         db $0B, $E5, $45, $06, $00
DATA_1AEE41:         db $EE, $E5, $45, $06, $00
DATA_1AEE46:         db $D5, $F3, $45, $06, $00
DATA_1AEE4B:         db $03, $F2, $42, $C2, $02
DATA_1AEE50:         db $F3, $F2, $42, $82, $02
DATA_1AEE55:         db $03, $E2, $42, $42, $02
DATA_1AEE5A:         db $F3, $E2, $42, $02, $02
DATA_1AEE5F:         db $09, $11, $55, $06, $00
DATA_1AEE64:         db $ED, $11, $55, $06, $00
DATA_1AEE69:         db $D9, $04, $55, $06, $00
DATA_1AEE6E:         db $1F, $04, $55, $06, $00
DATA_1AEE73:         db $1F, $F4, $55, $06, $00
DATA_1AEE78:         db $09, $E7, $55, $06, $00
DATA_1AEE7D:         db $EF, $E7, $55, $06, $00
DATA_1AEE82:         db $D9, $F4, $55, $06, $00
DATA_1AEE87:         db $FB, $F3, $42, $C2, $02
DATA_1AEE8C:         db $EB, $F3, $42, $82, $02
DATA_1AEE91:         db $FB, $E3, $42, $42, $02
DATA_1AEE96:         db $EB, $E3, $42, $02, $02
DATA_1AEE9B:         db $08, $0D, $55, $06, $00
DATA_1AEEA0:         db $F0, $0D, $55, $06, $00
DATA_1AEEA5:         db $DD, $03, $55, $06, $00
DATA_1AEEAA:         db $1B, $03, $55, $06, $00
DATA_1AEEAF:         db $1B, $F5, $55, $06, $00
DATA_1AEEB4:         db $08, $EB, $55, $06, $00
DATA_1AEEB9:         db $F0, $EB, $55, $06, $00
DATA_1AEEBE:         db $DD, $F5, $55, $06, $00
DATA_1AEEC3:         db $00, $00, $42, $C2, $02
DATA_1AEEC8:         db $F0, $00, $42, $82, $02
DATA_1AEECD:         db $00, $F0, $42, $42, $02
DATA_1AEED2:         db $F0, $F0, $42, $02, $02
DATA_1AEED7:         db $06, $0A, $55, $06, $00
DATA_1AEEDC:         db $F2, $0A, $55, $06, $00
DATA_1AEEE1:         db $E3, $02, $55, $06, $00
DATA_1AEEE6:         db $15, $02, $55, $06, $00
DATA_1AEEEB:         db $15, $F6, $55, $06, $00
DATA_1AEEF0:         db $06, $EE, $55, $06, $00
DATA_1AEEF5:         db $F2, $EE, $55, $06, $00
DATA_1AEEFA:         db $E3, $F6, $55, $06, $00
DATA_1AEEFF:         db $00, $00, $42, $C2, $02
DATA_1AEF04:         db $F0, $00, $42, $82, $02
DATA_1AEF09:         db $00, $F0, $42, $42, $02
DATA_1AEF0E:         db $F0, $F0, $42, $02, $02
DATA_1AEF13:         db $04, $06, $55, $06, $00
DATA_1AEF18:         db $F4, $06, $55, $06, $00
DATA_1AEF1D:         db $E9, $00, $55, $06, $00
DATA_1AEF22:         db $0F, $00, $55, $06, $00
DATA_1AEF27:         db $0F, $F8, $55, $06, $00
DATA_1AEF2C:         db $04, $F2, $55, $06, $00
DATA_1AEF31:         db $F4, $F2, $55, $06, $00
DATA_1AEF36:         db $E9, $F8, $55, $06, $00
DATA_1AEF3B:         db $01, $01, $55, $06, $00
DATA_1AEF40:         db $F7, $01, $55, $06, $00
DATA_1AEF45:         db $F7, $01, $55, $06, $00
DATA_1AEF4A:         db $F1, $FF, $55, $06, $00
DATA_1AEF4F:         db $07, $FF, $55, $06, $00
DATA_1AEF54:         db $07, $FF, $55, $06, $00
DATA_1AEF59:         db $07, $F9, $55, $06, $00
DATA_1AEF5E:         db $07, $F9, $55, $06, $00
DATA_1AEF63:         db $01, $F7, $55, $06, $00
DATA_1AEF68:         db $F7, $F7, $55, $06, $00
DATA_1AEF6D:         db $F7, $F7, $55, $06, $00
DATA_1AEF72:         db $F1, $F9, $55, $06, $00
DATA_1AEF77:         db $00, $00, $42, $C2, $02
DATA_1AEF7C:         db $00, $00, $42, $C2, $00
DATA_1AEF81:         db $F0, $00, $52, $82, $00
DATA_1AEF86:         db $F8, $00, $53, $82, $00
DATA_1AEF8B:         db $F0, $08, $42, $82, $00
DATA_1AEF90:         db $F8, $08, $43, $82, $00
DATA_1AEF95:         db $00, $F0, $42, $42, $02
DATA_1AEF9A:         db $00, $F0, $42, $42, $00
DATA_1AEF9F:         db $F0, $F0, $42, $02, $00
DATA_1AEFA4:         db $F8, $F0, $43, $02, $00
DATA_1AEFA9:         db $F0, $F8, $52, $02, $00
DATA_1AEFAE:         db $F8, $F8, $53, $02, $00
DATA_1AEFB3:         db $08, $08, $10, $48, $00
DATA_1AEFB8:         db $08, $00, $00, $48, $00
DATA_1AEFBD:         db $00, $08, $10, $08, $00
DATA_1AEFC2:         db $00, $00, $00, $08, $00
DATA_1AEFC7:         db $08, $08, $13, $08, $00
DATA_1AEFCC:         db $00, $08, $12, $08, $00
DATA_1AEFD1:         db $08, $00, $03, $08, $00
DATA_1AEFD6:         db $00, $00, $02, $08, $00
DATA_1AEFDB:         db $08, $08, $15, $08, $00
DATA_1AEFE0:         db $00, $08, $14, $08, $00
DATA_1AEFE5:         db $08, $00, $05, $08, $00
DATA_1AEFEA:         db $00, $00, $04, $08, $00
DATA_1AEFEF:         db $08, $00, $07, $08, $00
DATA_1AEFF4:         db $00, $00, $06, $08, $00
DATA_1AEFF9:         db $08, $08, $13, $08, $00
DATA_1AEFFE:         db $00, $08, $12, $08, $00
DATA_1AF003:         db $08, $00, $17, $08, $00
DATA_1AF008:         db $00, $00, $16, $08, $00
DATA_1AF00D:         db $08, $08, $10, $48, $00
DATA_1AF012:         db $00, $08, $10, $08, $00
DATA_1AF017:         db $08, $08, $01, $08, $00
DATA_1AF01C:         db $00, $08, $01, $48, $00
DATA_1AF021:         db $08, $08, $11, $08, $00
DATA_1AF026:         db $00, $08, $11, $48, $00
DATA_1AF02B:         db $00, $00, $4E, $01, $02
DATA_1AF030:         db $F8, $F8, $CC, $01, $02
DATA_1AF035:         db $08, $F8, $CE, $01, $02
DATA_1AF03A:         db $F8, $08, $EC, $01, $02
DATA_1AF03F:         db $08, $08, $EE, $01, $02
DATA_1AF044:         db $F8, $F8, $CC, $01, $02
DATA_1AF049:         db $08, $F8, $CE, $01, $02
DATA_1AF04E:         db $F8, $08, $EC, $01, $02
DATA_1AF053:         db $08, $08, $EE, $01, $02
DATA_1AF058:         db $F8, $F8, $C8, $01, $02
DATA_1AF05D:         db $08, $F8, $CA, $01, $02
DATA_1AF062:         db $F8, $08, $E8, $01, $02
DATA_1AF067:         db $08, $08, $EA, $01, $02
DATA_1AF06C:         db $E8, $E8, $C0, $01, $02
DATA_1AF071:         db $F8, $E8, $C2, $01, $02
DATA_1AF076:         db $08, $E8, $C4, $01, $02
DATA_1AF07B:         db $18, $E8, $C6, $01, $02
DATA_1AF080:         db $E8, $F8, $E0, $01, $02
DATA_1AF085:         db $F8, $F8, $E2, $01, $02
DATA_1AF08A:         db $08, $F8, $E4, $01, $02
DATA_1AF08F:         db $18, $F8, $E6, $01, $02
DATA_1AF094:         db $E8, $08, $E6, $C1, $02
DATA_1AF099:         db $F8, $08, $E4, $C1, $02
DATA_1AF09E:         db $08, $08, $E2, $C1, $02
DATA_1AF0A3:         db $18, $08, $E0, $C1, $02
DATA_1AF0A8:         db $E8, $18, $C6, $C1, $02
DATA_1AF0AD:         db $F8, $18, $C4, $C1, $02
DATA_1AF0B2:         db $08, $18, $C2, $C1, $02
DATA_1AF0B7:         db $18, $18, $C0, $C1, $02
DATA_1AF0BC:         db $00, $00, $00, $00, $00
DATA_1AF0C1:         db $0A, $08, $2E, $40, $00
DATA_1AF0C6:         db $FB, $05, $2F, $00, $00
DATA_1AF0CB:         db $00, $FE, $AB, $01, $00
DATA_1AF0D0:         db $00, $06, $BB, $01, $00
DATA_1AF0D5:         db $00, $FE, $AB, $01, $02
DATA_1AF0DA:         db $0D, $09, $2F, $00, $00
DATA_1AF0DF:         db $FD, $08, $2E, $00, $00
DATA_1AF0E4:         db $00, $00, $AB, $01, $00
DATA_1AF0E9:         db $00, $08, $BB, $01, $00
DATA_1AF0EE:         db $00, $00, $AB, $01, $02
DATA_1AF0F3:         db $0D, $09, $2F, $00, $00
DATA_1AF0F8:         db $00, $08, $9E, $00, $00
DATA_1AF0FD:         db $00, $FF, $AB, $01, $00
DATA_1AF102:         db $00, $07, $BB, $01, $00
DATA_1AF107:         db $00, $FF, $AB, $01, $02
DATA_1AF10C:         db $0C, $09, $2F, $00, $00
DATA_1AF111:         db $FF, $08, $9E, $00, $00
DATA_1AF116:         db $00, $FE, $AB, $01, $00
DATA_1AF11B:         db $00, $06, $BB, $01, $00
DATA_1AF120:         db $00, $FE, $AB, $01, $02
DATA_1AF125:         db $0A, $08, $2F, $00, $00
DATA_1AF12A:         db $FF, $08, $9E, $00, $00
DATA_1AF12F:         db $00, $FE, $AB, $01, $00
DATA_1AF134:         db $00, $06, $BB, $01, $00
DATA_1AF139:         db $00, $FE, $AB, $01, $02
DATA_1AF13E:         db $07, $08, $2F, $00, $00
DATA_1AF143:         db $03, $08, $9E, $00, $00
DATA_1AF148:         db $00, $FD, $AB, $01, $00
DATA_1AF14D:         db $00, $05, $BB, $01, $00
DATA_1AF152:         db $00, $FD, $AB, $01, $02
DATA_1AF157:         db $01, $08, $2F, $40, $00
DATA_1AF15C:         db $06, $08, $2E, $40, $00
DATA_1AF161:         db $00, $FD, $AB, $01, $00
DATA_1AF166:         db $00, $05, $BB, $01, $00
DATA_1AF16B:         db $00, $FD, $AB, $01, $02
DATA_1AF170:         db $00, $08, $2E, $80, $00
DATA_1AF175:         db $07, $08, $2E, $40, $00
DATA_1AF17A:         db $00, $FD, $AB, $01, $00
DATA_1AF17F:         db $00, $05, $BB, $01, $00
DATA_1AF184:         db $00, $FD, $AB, $01, $02
DATA_1AF189:         db $FE, $04, $2E, $00, $00
DATA_1AF18E:         db $08, $08, $2E, $40, $00
DATA_1AF193:         db $00, $FD, $AB, $01, $00
DATA_1AF198:         db $00, $05, $BB, $01, $00
DATA_1AF19D:         db $00, $FD, $AB, $01, $02
DATA_1AF1A2:         db $FE, $04, $2E, $00, $00
DATA_1AF1A7:         db $08, $08, $2E, $40, $00
DATA_1AF1AC:         db $00, $FD, $AB, $01, $00
DATA_1AF1B1:         db $00, $05, $BB, $01, $00
DATA_1AF1B6:         db $00, $FD, $AB, $01, $02
DATA_1AF1BB:         db $08, $09, $2F, $00, $00
DATA_1AF1C0:         db $FF, $09, $2F, $00, $00
DATA_1AF1C5:         db $00, $01, $AD, $01, $00
DATA_1AF1CA:         db $00, $09, $BD, $01, $00
DATA_1AF1CF:         db $00, $01, $AD, $01, $02
DATA_1AF1D4:         db $08, $09, $2F, $00, $00
DATA_1AF1D9:         db $FF, $09, $2F, $00, $00
DATA_1AF1DE:         db $04, $09, $BF, $01, $00
DATA_1AF1E3:         db $04, $01, $AF, $01, $00
DATA_1AF1E8:         db $00, $01, $AD, $01, $02
DATA_1AF1ED:         db $08, $08, $9E, $00, $00
DATA_1AF1F2:         db $00, $08, $9E, $00, $00
DATA_1AF1F7:         db $00, $00, $AD, $01, $00
DATA_1AF1FC:         db $00, $08, $BD, $01, $00
DATA_1AF201:         db $00, $00, $AD, $01, $02
DATA_1AF206:         db $08, $08, $9E, $00, $00
DATA_1AF20B:         db $00, $08, $9E, $00, $00
DATA_1AF210:         db $00, $FF, $AB, $01, $00
DATA_1AF215:         db $00, $07, $BB, $01, $00
DATA_1AF21A:         db $00, $FF, $AB, $01, $02
DATA_1AF21F:         db $00, $00, $00, $00, $02
DATA_1AF224:         db $00, $00, $00, $00, $02
DATA_1AF229:         db $00, $00, $00, $00, $02
DATA_1AF22E:         db $00, $00, $00, $00, $02
DATA_1AF233:         db $00, $00, $00, $00, $02
DATA_1AF238:         db $07, $08, $9E, $00, $00
DATA_1AF23D:         db $02, $08, $9E, $00, $00
DATA_1AF242:         db $00, $FE, $AB, $01, $00
DATA_1AF247:         db $00, $06, $BB, $01, $00
DATA_1AF24C:         db $00, $FE, $AB, $01, $02
DATA_1AF251:         db $01, $06, $2F, $40, $00
DATA_1AF256:         db $06, $06, $2F, $40, $00
DATA_1AF25B:         db $00, $F8, $AB, $01, $00
DATA_1AF260:         db $00, $00, $BB, $01, $00
DATA_1AF265:         db $00, $F8, $AB, $01, $02
DATA_1AF26A:         db $07, $08, $9E, $00, $00
DATA_1AF26F:         db $02, $08, $9E, $00, $00
DATA_1AF274:         db $00, $00, $AB, $01, $00
DATA_1AF279:         db $00, $08, $BB, $01, $00
DATA_1AF27E:         db $00, $00, $AB, $01, $02
DATA_1AF283:         db $0A, $0A, $44, $00, $00
DATA_1AF288:         db $EE, $0A, $44, $00, $00
DATA_1AF28D:         db $0A, $EE, $44, $00, $00
DATA_1AF292:         db $EE, $EE, $44, $00, $00
DATA_1AF297:         db $08, $08, $54, $00, $00
DATA_1AF29C:         db $F0, $08, $54, $00, $00
DATA_1AF2A1:         db $08, $F0, $54, $00, $00
DATA_1AF2A6:         db $F0, $F0, $54, $00, $00
DATA_1AF2AB:         db $06, $06, $45, $00, $00
DATA_1AF2B0:         db $F2, $06, $45, $00, $00
DATA_1AF2B5:         db $06, $F2, $45, $00, $00
DATA_1AF2BA:         db $F2, $F2, $45, $00, $00
DATA_1AF2BF:         db $03, $03, $55, $00, $00
DATA_1AF2C4:         db $F5, $03, $55, $00, $00
DATA_1AF2C9:         db $03, $F5, $55, $00, $00
DATA_1AF2CE:         db $F5, $F5, $55, $00, $00
DATA_1AF2D3:         db $00, $00, $55, $00, $00
DATA_1AF2D8:         db $F8, $00, $55, $00, $00
DATA_1AF2DD:         db $00, $F8, $55, $00, $00
DATA_1AF2E2:         db $F8, $F8, $55, $00, $00
DATA_1AF2E7:         db $00, $00, $42, $C4, $02
DATA_1AF2EC:         db $00, $F0, $42, $44, $02
DATA_1AF2F1:         db $F0, $00, $42, $84, $02
DATA_1AF2F6:         db $F0, $F0, $42, $04, $02
DATA_1AF2FB:         db $F8, $00, $C0, $20, $02
DATA_1AF300:         db $08, $00, $C0, $20, $02
DATA_1AF305:         db $F8, $F8, $00, $00, $02
DATA_1AF30A:         db $08, $F8, $00, $00, $02
DATA_1AF30F:         db $F8, $08, $00, $00, $02
DATA_1AF314:         db $08, $08, $00, $00, $02
DATA_1AF319:         db $04, $00, $0B, $00, $00
DATA_1AF31E:         db $04, $00, $0B, $00, $00
DATA_1AF323:         db $04, $00, $0B, $00, $00
DATA_1AF328:         db $04, $00, $0B, $00, $00
DATA_1AF32D:         db $04, $00, $0B, $00, $00
DATA_1AF332:         db $04, $00, $0B, $00, $00
DATA_1AF337:         db $04, $00, $0B, $00, $00
DATA_1AF33C:         db $04, $00, $0B, $00, $00
DATA_1AF341:         db $04, $00, $0B, $00, $00
DATA_1AF346:         db $04, $00, $0B, $00, $00
DATA_1AF34B:         db $04, $00, $0B, $00, $00
DATA_1AF350:         db $FC, $08, $1B, $00, $00
DATA_1AF355:         db $F8, $00, $00, $00, $02
DATA_1AF35A:         db $00, $00, $0C, $00, $02
DATA_1AF35F:         db $FC, $08, $1B, $00, $00
DATA_1AF364:         db $F6, $00, $00, $00, $02
DATA_1AF369:         db $00, $00, $0E, $00, $02
DATA_1AF36E:         db $FC, $08, $1A, $00, $00
DATA_1AF373:         db $F5, $00, $02, $00, $02
DATA_1AF378:         db $00, $00, $0C, $80, $02
DATA_1AF37D:         db $FC, $08, $1A, $00, $00
DATA_1AF382:         db $F4, $00, $02, $00, $02
DATA_1AF387:         db $00, $00, $0E, $40, $02
DATA_1AF38C:         db $FC, $08, $1A, $00, $00
DATA_1AF391:         db $F5, $00, $02, $00, $02
DATA_1AF396:         db $00, $00, $0C, $00, $02
DATA_1AF39B:         db $FC, $08, $1A, $00, $00
DATA_1AF3A0:         db $F6, $00, $04, $00, $02
DATA_1AF3A5:         db $00, $00, $0E, $00, $02
DATA_1AF3AA:         db $FC, $08, $1B, $00, $00
DATA_1AF3AF:         db $F8, $00, $04, $00, $02
DATA_1AF3B4:         db $00, $00, $0C, $80, $02
DATA_1AF3B9:         db $FC, $08, $1B, $00, $00
DATA_1AF3BE:         db $FA, $00, $04, $00, $02
DATA_1AF3C3:         db $00, $00, $0E, $40, $02
DATA_1AF3C8:         db $FC, $08, $1A, $40, $00
DATA_1AF3CD:         db $FB, $00, $04, $00, $02
DATA_1AF3D2:         db $00, $00, $0C, $00, $02
DATA_1AF3D7:         db $FC, $08, $1A, $40, $00
DATA_1AF3DC:         db $FC, $00, $02, $00, $02
DATA_1AF3E1:         db $00, $00, $0E, $00, $02
DATA_1AF3E6:         db $FC, $08, $1A, $40, $00
DATA_1AF3EB:         db $FB, $00, $02, $00, $02
DATA_1AF3F0:         db $00, $00, $0C, $80, $02
DATA_1AF3F5:         db $FC, $08, $1B, $00, $00
DATA_1AF3FA:         db $FA, $00, $00, $00, $02
DATA_1AF3FF:         db $00, $00, $0E, $40, $02
DATA_1AF404:         db $F6, $00, $06, $00, $02
DATA_1AF409:         db $00, $00, $0C, $00, $02
DATA_1AF40E:         db $00, $00, $0C, $00, $00
DATA_1AF413:         db $F6, $00, $06, $00, $02
DATA_1AF418:         db $00, $00, $0E, $40, $02
DATA_1AF41D:         db $00, $00, $0F, $40, $00
DATA_1AF422:         db $F6, $00, $06, $00, $02
DATA_1AF427:         db $00, $00, $0E, $00, $02
DATA_1AF42C:         db $00, $00, $0E, $00, $00
DATA_1AF431:         db $F6, $00, $06, $00, $02
DATA_1AF436:         db $00, $00, $0C, $00, $02
DATA_1AF43B:         db $00, $00, $0C, $00, $00
DATA_1AF440:         db $F6, $00, $08, $00, $02
DATA_1AF445:         db $00, $00, $0E, $40, $02
DATA_1AF44A:         db $F6, $00, $08, $00, $00
DATA_1AF44F:         db $F6, $00, $08, $00, $02
DATA_1AF454:         db $00, $00, $0C, $80, $02
DATA_1AF459:         db $F6, $00, $08, $00, $00
DATA_1AF45E:         db $F6, $00, $08, $00, $02
DATA_1AF463:         db $00, $00, $0E, $00, $02
DATA_1AF468:         db $F6, $00, $08, $00, $00
DATA_1AF46D:         db $F6, $00, $08, $00, $02
DATA_1AF472:         db $00, $00, $0C, $00, $02
DATA_1AF477:         db $F6, $00, $08, $00, $00
DATA_1AF47C:         db $FB, $05, $0A, $00, $00
DATA_1AF481:         db $F6, $00, $08, $00, $02
DATA_1AF486:         db $00, $00, $0C, $00, $02
DATA_1AF48B:         db $08, $EC, $4F, $00, $00
DATA_1AF490:         db $E5, $F3, $4F, $00, $00
DATA_1AF495:         db $13, $F5, $4F, $00, $00
DATA_1AF49A:         db $13, $F5, $4F, $00, $00
DATA_1AF49F:         db $06, $EE, $4E, $00, $00
DATA_1AF4A4:         db $F5, $EA, $4F, $40, $00
DATA_1AF4A9:         db $E8, $F3, $4E, $00, $00
DATA_1AF4AE:         db $10, $F5, $4E, $00, $00
DATA_1AF4B3:         db $04, $F1, $4D, $00, $00
DATA_1AF4B8:         db $F6, $ED, $4E, $40, $00
DATA_1AF4BD:         db $EB, $F4, $4D, $00, $00
DATA_1AF4C2:         db $0D, $F6, $4D, $00, $00
DATA_1AF4C7:         db $02, $F4, $4C, $00, $00
DATA_1AF4CC:         db $F7, $F1, $4D, $40, $00
DATA_1AF4D1:         db $EE, $F5, $4C, $00, $00
DATA_1AF4D6:         db $0A, $F7, $4C, $00, $00
DATA_1AF4DB:         db $00, $F8, $4C, $00, $00
DATA_1AF4E0:         db $F8, $F5, $4C, $00, $00
DATA_1AF4E5:         db $F1, $F8, $4C, $00, $00
DATA_1AF4EA:         db $07, $F9, $4C, $00, $00
DATA_1AF4EF:         db $FE, $FC, $4C, $00, $00
DATA_1AF4F4:         db $F9, $FA, $4C, $00, $00
DATA_1AF4F9:         db $F4, $FB, $4C, $00, $00
DATA_1AF4FE:         db $04, $FB, $4C, $00, $00
DATA_1AF503:         db $03, $0A, $09, $06, $00
DATA_1AF508:         db $00, $FE, $0B, $06, $00
DATA_1AF50D:         db $04, $FC, $01, $06, $02
DATA_1AF512:         db $FC, $FC, $00, $06, $02
DATA_1AF517:         db $0C, $0C, $08, $06, $00
DATA_1AF51C:         db $04, $0C, $07, $06, $00
DATA_1AF521:         db $FC, $0C, $06, $06, $00
DATA_1AF526:         db $03, $FE, $1B, $06, $00
DATA_1AF52B:         db $FC, $FC, $03, $06, $02
DATA_1AF530:         db $04, $FC, $04, $06, $02
DATA_1AF535:         db $0C, $0C, $18, $06, $00
DATA_1AF53A:         db $FC, $0C, $16, $06, $00
DATA_1AF53F:         db $04, $0A, $0A, $06, $00
DATA_1AF544:         db $04, $0C, $17, $06, $00
DATA_1AF549:         db $03, $0A, $19, $06, $00
DATA_1AF54E:         db $FC, $0C, $06, $06, $00
DATA_1AF553:         db $FF, $FF, $0C, $06, $00
DATA_1AF558:         db $FC, $FC, $00, $06, $02
DATA_1AF55D:         db $04, $0C, $07, $06, $00
DATA_1AF562:         db $0C, $0C, $08, $06, $00
DATA_1AF567:         db $04, $FC, $01, $06, $02
DATA_1AF56C:         db $00, $FF, $1B, $06, $00
DATA_1AF571:         db $03, $0A, $1C, $06, $00
DATA_1AF576:         db $FC, $0C, $06, $06, $00
DATA_1AF57B:         db $04, $0C, $07, $06, $00
DATA_1AF580:         db $0C, $0C, $08, $06, $00
DATA_1AF585:         db $04, $FC, $01, $06, $02
DATA_1AF58A:         db $FC, $FC, $00, $06, $02
DATA_1AF58F:         db $00, $FF, $0B, $46, $00
DATA_1AF594:         db $02, $0A, $0A, $06, $00
DATA_1AF599:         db $FC, $0C, $06, $06, $00
DATA_1AF59E:         db $04, $0C, $07, $06, $00
DATA_1AF5A3:         db $0C, $0C, $08, $06, $00
DATA_1AF5A8:         db $04, $FC, $01, $06, $02
DATA_1AF5AD:         db $FC, $FC, $00, $06, $02
DATA_1AF5B2:         db $04, $0A, $0A, $06, $00
DATA_1AF5B7:         db $03, $FE, $0B, $46, $00
DATA_1AF5BC:         db $FC, $0C, $16, $06, $00
DATA_1AF5C1:         db $04, $0C, $17, $06, $00
DATA_1AF5C6:         db $0C, $0C, $18, $06, $00
DATA_1AF5CB:         db $04, $FC, $04, $06, $02
DATA_1AF5D0:         db $FC, $FC, $03, $06, $02
DATA_1AF5D5:         db $03, $0A, $1A, $06, $00
DATA_1AF5DA:         db $03, $00, $0C, $06, $00
DATA_1AF5DF:         db $FC, $0C, $16, $06, $00
DATA_1AF5E4:         db $04, $0C, $17, $06, $00
DATA_1AF5E9:         db $0C, $0C, $18, $06, $00
DATA_1AF5EE:         db $04, $FC, $04, $06, $02
DATA_1AF5F3:         db $FC, $FC, $03, $06, $02
DATA_1AF5F8:         db $02, $0A, $1A, $06, $00
DATA_1AF5FD:         db $FF, $00, $0C, $06, $00
DATA_1AF602:         db $FC, $0C, $06, $06, $00
DATA_1AF607:         db $04, $0C, $07, $06, $00
DATA_1AF60C:         db $0C, $0C, $08, $06, $00
DATA_1AF611:         db $04, $FC, $01, $06, $02
DATA_1AF616:         db $FC, $FC, $00, $06, $02
DATA_1AF61B:         db $FF, $FE, $0C, $06, $00
DATA_1AF620:         db $FC, $FC, $00, $06, $02
DATA_1AF625:         db $04, $FC, $01, $06, $02
DATA_1AF62A:         db $03, $0A, $1C, $06, $00
DATA_1AF62F:         db $0C, $0C, $08, $06, $00
DATA_1AF634:         db $04, $0C, $07, $06, $00
DATA_1AF639:         db $FC, $0C, $06, $06, $00
DATA_1AF63E:         db $04, $0A, $1C, $06, $00
DATA_1AF643:         db $03, $FE, $0C, $06, $00
DATA_1AF648:         db $FC, $0C, $16, $06, $00
DATA_1AF64D:         db $04, $0C, $17, $06, $00
DATA_1AF652:         db $0C, $0C, $18, $06, $00
DATA_1AF657:         db $04, $FC, $04, $06, $02
DATA_1AF65C:         db $FC, $FC, $03, $06, $02
DATA_1AF661:         db $0F, $08, $14, $00, $00
DATA_1AF666:         db $F9, $08, $04, $00, $00
DATA_1AF66B:         db $00, $00, $00, $00, $00
DATA_1AF670:         db $00, $00, $00, $00, $00
DATA_1AF675:         db $08, $00, $01, $00, $00
DATA_1AF67A:         db $00, $08, $10, $00, $00
DATA_1AF67F:         db $08, $08, $11, $00, $00
DATA_1AF684:         db $10, $08, $14, $00, $00
DATA_1AF689:         db $F8, $08, $04, $00, $00
DATA_1AF68E:         db $00, $00, $02, $00, $00
DATA_1AF693:         db $00, $00, $02, $00, $00
DATA_1AF698:         db $08, $00, $03, $00, $00
DATA_1AF69D:         db $00, $08, $12, $00, $00
DATA_1AF6A2:         db $08, $08, $13, $00, $00
DATA_1AF6A7:         db $00, $00, $05, $00, $00
DATA_1AF6AC:         db $00, $00, $05, $00, $00
DATA_1AF6B1:         db $08, $00, $06, $00, $00
DATA_1AF6B6:         db $00, $08, $15, $00, $00
DATA_1AF6BB:         db $08, $08, $16, $00, $00
DATA_1AF6C0:         db $0E, $08, $18, $00, $00
DATA_1AF6C5:         db $F9, $08, $07, $00, $00
DATA_1AF6CA:         db $08, $08, $17, $00, $00
DATA_1AF6CF:         db $00, $08, $08, $00, $00
DATA_1AF6D4:         db $10, $08, $18, $00, $00
DATA_1AF6D9:         db $F8, $08, $07, $00, $00
DATA_1AF6DE:         db $00, $08, $08, $00, $00
DATA_1AF6E3:         db $10, $08, $18, $00, $00
DATA_1AF6E8:         db $F8, $08, $07, $00, $00
DATA_1AF6ED:         db $01, $00, $0D, $00, $00
DATA_1AF6F2:         db $00, $00, $0E, $00, $00
DATA_1AF6F7:         db $08, $00, $0F, $00, $00
DATA_1AF6FC:         db $00, $08, $1E, $00, $00
DATA_1AF701:         db $08, $08, $1F, $00, $00
DATA_1AF706:         db $00, $08, $1E, $00, $00
DATA_1AF70B:         db $08, $08, $1F, $00, $00
DATA_1AF710:         db $01, $01, $0D, $00, $00
DATA_1AF715:         db $00, $00, $1E, $80, $00
DATA_1AF71A:         db $08, $00, $1F, $80, $00
DATA_1AF71F:         db $00, $08, $0E, $80, $00
DATA_1AF724:         db $08, $08, $0F, $80, $00
DATA_1AF729:         db $00, $08, $0E, $80, $00
DATA_1AF72E:         db $08, $08, $0F, $80, $00
DATA_1AF733:         db $01, $00, $0D, $00, $00
DATA_1AF738:         db $00, $00, $1F, $C0, $00
DATA_1AF73D:         db $08, $00, $1E, $C0, $00
DATA_1AF742:         db $00, $08, $0F, $C0, $00
DATA_1AF747:         db $08, $08, $0E, $C0, $00
DATA_1AF74C:         db $00, $08, $0F, $C0, $00
DATA_1AF751:         db $08, $08, $0E, $C0, $00
DATA_1AF756:         db $01, $01, $0D, $00, $00
DATA_1AF75B:         db $00, $00, $0F, $40, $00
DATA_1AF760:         db $08, $00, $0E, $40, $00
DATA_1AF765:         db $00, $08, $1F, $40, $00
DATA_1AF76A:         db $08, $08, $1E, $40, $00
DATA_1AF76F:         db $00, $08, $1F, $40, $00
DATA_1AF774:         db $08, $08, $1E, $40, $00
DATA_1AF779:         db $06, $08, $1D, $00, $00
DATA_1AF77E:         db $01, $08, $18, $00, $00
DATA_1AF783:         db $F8, $08, $1D, $00, $00
DATA_1AF788:         db $F9, $08, $09, $00, $00
DATA_1AF78D:         db $09, $08, $07, $00, $00
DATA_1AF792:         db $11, $08, $0A, $00, $00
DATA_1AF797:         db $11, $08, $0A, $00, $00
DATA_1AF79C:         db $F7, $08, $1D, $00, $00
DATA_1AF7A1:         db $00, $08, $0A, $00, $00
DATA_1AF7A6:         db $FA, $08, $09, $00, $00
DATA_1AF7AB:         db $07, $08, $1D, $00, $00
DATA_1AF7B0:         db $0A, $08, $09, $00, $00
DATA_1AF7B5:         db $10, $08, $0A, $00, $00
DATA_1AF7BA:         db $10, $08, $0A, $00, $00
DATA_1AF7BF:         db $F6, $08, $1D, $00, $00
DATA_1AF7C4:         db $01, $08, $0A, $00, $00
DATA_1AF7C9:         db $F9, $08, $07, $00, $00
DATA_1AF7CE:         db $08, $08, $1D, $00, $00
DATA_1AF7D3:         db $09, $08, $09, $00, $00
DATA_1AF7D8:         db $11, $08, $18, $00, $00
DATA_1AF7DD:         db $11, $08, $18, $00, $00
DATA_1AF7E2:         db $03, $08, $0A, $00, $00
DATA_1AF7E7:         db $07, $08, $09, $00, $00
DATA_1AF7EC:         db $F9, $08, $1D, $00, $00
DATA_1AF7F1:         db $FD, $08, $09, $00, $00
DATA_1AF7F6:         db $0F, $08, $18, $00, $00
DATA_1AF7FB:         db $08, $08, $17, $00, $00
DATA_1AF800:         db $00, $08, $08, $00, $00
DATA_1AF805:         db $02, $08, $0A, $00, $00
DATA_1AF80A:         db $FA, $08, $07, $00, $00
DATA_1AF80F:         db $0E, $08, $0A, $00, $00
DATA_1AF814:         db $00, $00, $05, $00, $02
DATA_1AF819:         db $08, $08, $19, $00, $00
DATA_1AF81E:         db $00, $08, $0A, $00, $00
DATA_1AF823:         db $00, $08, $0A, $00, $00
DATA_1AF828:         db $01, $08, $09, $00, $00
DATA_1AF82D:         db $07, $08, $0A, $00, $00
DATA_1AF832:         db $01, $FC, $0D, $00, $00
DATA_1AF837:         db $00, $FC, $0E, $00, $00
DATA_1AF83C:         db $08, $FC, $0F, $00, $00
DATA_1AF841:         db $00, $04, $1E, $00, $00
DATA_1AF846:         db $08, $04, $1F, $00, $00
DATA_1AF84B:         db $01, $08, $07, $00, $00
DATA_1AF850:         db $07, $08, $18, $00, $00
DATA_1AF855:         db $01, $FA, $0D, $00, $00
DATA_1AF85A:         db $00, $F9, $1E, $80, $00
DATA_1AF85F:         db $08, $F9, $1F, $80, $00
DATA_1AF864:         db $00, $01, $0E, $80, $00
DATA_1AF869:         db $08, $01, $0F, $80, $00
DATA_1AF86E:         db $08, $08, $14, $00, $00
DATA_1AF873:         db $00, $08, $04, $00, $00
DATA_1AF878:         db $01, $F7, $0D, $00, $00
DATA_1AF87D:         db $00, $F7, $1F, $C0, $00
DATA_1AF882:         db $08, $F7, $1E, $C0, $00
DATA_1AF887:         db $00, $FF, $0F, $C0, $00
DATA_1AF88C:         db $08, $FF, $0E, $C0, $00
DATA_1AF891:         db $00, $08, $04, $00, $00
DATA_1AF896:         db $08, $08, $14, $00, $00
DATA_1AF89B:         db $01, $F7, $0D, $00, $00
DATA_1AF8A0:         db $00, $F6, $0F, $40, $00
DATA_1AF8A5:         db $08, $F6, $0E, $40, $00
DATA_1AF8AA:         db $00, $FE, $1F, $40, $00
DATA_1AF8AF:         db $08, $FE, $1E, $40, $00
DATA_1AF8B4:         db $19, $FD, $1B, $00, $00
DATA_1AF8B9:         db $18, $F3, $1B, $00, $00
DATA_1AF8BE:         db $DD, $FA, $1B, $00, $00
DATA_1AF8C3:         db $D0, $FF, $1B, $00, $00
DATA_1AF8C8:         db $E4, $F2, $1B, $00, $00
DATA_1AF8CD:         db $2B, $01, $1B, $00, $00
DATA_1AF8D2:         db $DD, $FA, $1B, $00, $00
DATA_1AF8D7:         db $D0, $FF, $1B, $00, $00
DATA_1AF8DC:         db $E4, $F2, $1B, $00, $00
DATA_1AF8E1:         db $2B, $01, $1B, $00, $00
DATA_1AF8E6:         db $EE, $F6, $1B, $00, $00
DATA_1AF8EB:         db $0C, $F8, $1B, $00, $00
DATA_1AF8F0:         db $0F, $FF, $1B, $00, $00
DATA_1AF8F5:         db $E8, $FC, $1B, $00, $00
DATA_1AF8FA:         db $18, $FC, $1B, $00, $00
DATA_1AF8FF:         db $17, $F3, $1A, $00, $00
DATA_1AF904:         db $DE, $FA, $1B, $00, $00
DATA_1AF909:         db $D1, $FF, $1A, $00, $00
DATA_1AF90E:         db $E5, $F2, $1A, $00, $00
DATA_1AF913:         db $2A, $00, $1B, $00, $00
DATA_1AF918:         db $EF, $F6, $1B, $00, $00
DATA_1AF91D:         db $0B, $F7, $1A, $00, $00
DATA_1AF922:         db $0E, $FF, $1B, $00, $00
DATA_1AF927:         db $E9, $FC, $1B, $00, $00
DATA_1AF92C:         db $17, $FC, $1A, $00, $00
DATA_1AF931:         db $16, $F4, $19, $00, $00
DATA_1AF936:         db $DF, $FB, $1A, $00, $00
DATA_1AF93B:         db $D2, $01, $19, $00, $00
DATA_1AF940:         db $E6, $F3, $19, $00, $00
DATA_1AF945:         db $29, $00, $1A, $00, $00
DATA_1AF94A:         db $0A, $F6, $1A, $00, $00
DATA_1AF94F:         db $F0, $F6, $1B, $00, $00
DATA_1AF954:         db $EA, $FC, $1A, $00, $00
DATA_1AF959:         db $0D, $FE, $1A, $00, $00
DATA_1AF95E:         db $16, $FB, $1A, $00, $00
DATA_1AF963:         db $15, $F4, $19, $00, $00
DATA_1AF968:         db $E0, $FA, $1A, $00, $00
DATA_1AF96D:         db $D4, $00, $19, $00, $00
DATA_1AF972:         db $E7, $F3, $19, $00, $00
DATA_1AF977:         db $27, $FF, $1A, $00, $00
DATA_1AF97C:         db $09, $F7, $19, $00, $00
DATA_1AF981:         db $F1, $F6, $1A, $00, $00
DATA_1AF986:         db $EB, $FC, $1A, $00, $00
DATA_1AF98B:         db $0C, $FE, $1A, $00, $00
DATA_1AF990:         db $14, $FB, $1A, $00, $00
DATA_1AF995:         db $14, $F5, $19, $00, $00
DATA_1AF99A:         db $E2, $FA, $1A, $00, $00
DATA_1AF99F:         db $D7, $00, $19, $00, $00
DATA_1AF9A4:         db $E8, $F4, $19, $00, $00
DATA_1AF9A9:         db $24, $FE, $1A, $00, $00
DATA_1AF9AE:         db $08, $F7, $19, $00, $00
DATA_1AF9B3:         db $0A, $FE, $1A, $00, $00
DATA_1AF9B8:         db $ED, $FD, $1A, $00, $00
DATA_1AF9BD:         db $F2, $F7, $1A, $00, $00
DATA_1AF9C2:         db $11, $FB, $1A, $00, $00
DATA_1AF9C7:         db $12, $F6, $19, $00, $00
DATA_1AF9CC:         db $E5, $FA, $1A, $00, $00
DATA_1AF9D1:         db $DB, $FF, $19, $00, $00
DATA_1AF9D6:         db $EA, $F5, $19, $00, $00
DATA_1AF9DB:         db $20, $FE, $1A, $00, $00
DATA_1AF9E0:         db $06, $F9, $19, $00, $00
DATA_1AF9E5:         db $F0, $FE, $1A, $00, $00
DATA_1AF9EA:         db $F4, $F9, $1A, $00, $00
DATA_1AF9EF:         db $07, $FF, $1A, $00, $00
DATA_1AF9F4:         db $0D, $FD, $1A, $00, $00
DATA_1AF9F9:         db $0F, $F8, $19, $00, $00
DATA_1AF9FE:         db $E9, $FC, $1A, $00, $00
DATA_1AFA03:         db $E0, $FF, $19, $00, $00
DATA_1AFA08:         db $ED, $F6, $19, $00, $00
DATA_1AFA0D:         db $1B, $FE, $1A, $00, $00
DATA_1AFA12:         db $F4, $FF, $1A, $00, $00
DATA_1AFA17:         db $F7, $FC, $1A, $00, $00
DATA_1AFA1C:         db $03, $FC, $19, $00, $00
DATA_1AFA21:         db $03, $00, $1A, $00, $00
DATA_1AFA26:         db $08, $FF, $1A, $00, $00
DATA_1AFA2B:         db $0B, $FB, $19, $00, $00
DATA_1AFA30:         db $EE, $FE, $1A, $00, $00
DATA_1AFA35:         db $E6, $00, $19, $00, $00
DATA_1AFA3A:         db $F1, $F9, $19, $00, $00
DATA_1AFA3F:         db $15, $FF, $1A, $00, $00
DATA_1AFA44:         db $F9, $01, $1A, $00, $00
DATA_1AFA49:         db $FB, $FF, $1A, $00, $00
DATA_1AFA4E:         db $FF, $FF, $19, $00, $00
DATA_1AFA53:         db $02, $01, $1A, $00, $00
DATA_1AFA58:         db $06, $FE, $19, $00, $00
DATA_1AFA5D:         db $F4, $00, $1A, $00, $00
DATA_1AFA62:         db $ED, $01, $19, $00, $00
DATA_1AFA67:         db $F6, $FC, $19, $00, $00
DATA_1AFA6C:         db $0E, $00, $1A, $00, $00
DATA_1AFA71:         db $0E, $00, $1A, $00, $00
DATA_1AFA76:         db $FC, $FE, $00, $04, $02
DATA_1AFA7B:         db $0C, $0E, $0C, $44, $00
DATA_1AFA80:         db $FE, $0E, $0C, $04, $00
DATA_1AFA85:         db $09, $0A, $0E, $80, $00
DATA_1AFA8A:         db $01, $0A, $1E, $00, $00
DATA_1AFA8F:         db $03, $FE, $06, $40, $02
DATA_1AFA94:         db $FC, $FD, $00, $04, $02
DATA_1AFA99:         db $0B, $0D, $0C, $44, $00
DATA_1AFA9E:         db $01, $10, $1C, $04, $00
DATA_1AFAA3:         db $09, $09, $0E, $80, $00
DATA_1AFAA8:         db $01, $09, $1E, $00, $00
DATA_1AFAAD:         db $03, $FD, $06, $00, $02
DATA_1AFAB2:         db $FC, $FC, $00, $04, $02
DATA_1AFAB7:         db $04, $10, $1C, $04, $00
DATA_1AFABC:         db $09, $0C, $0C, $44, $00
DATA_1AFAC1:         db $09, $08, $0E, $80, $00
DATA_1AFAC6:         db $02, $08, $1E, $00, $00
DATA_1AFACB:         db $03, $FC, $06, $00, $02
DATA_1AFAD0:         db $FC, $FC, $00, $04, $02
DATA_1AFAD5:         db $07, $10, $1C, $04, $00
DATA_1AFADA:         db $02, $0C, $0C, $04, $00
DATA_1AFADF:         db $09, $08, $0E, $80, $00
DATA_1AFAE4:         db $02, $08, $1E, $00, $00
DATA_1AFAE9:         db $03, $FC, $06, $40, $02
DATA_1AFAEE:         db $FC, $FD, $00, $04, $02
DATA_1AFAF3:         db $0A, $10, $1C, $04, $00
DATA_1AFAF8:         db $FE, $0C, $0C, $04, $00
DATA_1AFAFD:         db $09, $09, $0E, $80, $00
DATA_1AFB02:         db $01, $08, $1E, $00, $00
DATA_1AFB07:         db $03, $FD, $06, $40, $02
DATA_1AFB0C:         db $FC, $FD, $00, $04, $02
DATA_1AFB11:         db $09, $10, $1C, $04, $00
DATA_1AFB16:         db $01, $10, $1C, $04, $00
DATA_1AFB1B:         db $09, $09, $0E, $80, $00
DATA_1AFB20:         db $01, $09, $1E, $00, $00
DATA_1AFB25:         db $03, $FD, $06, $40, $02
DATA_1AFB2A:         db $FD, $FC, $02, $04, $02
DATA_1AFB2F:         db $09, $10, $1C, $04, $00
DATA_1AFB34:         db $01, $10, $1C, $04, $00
DATA_1AFB39:         db $09, $08, $0E, $80, $00
DATA_1AFB3E:         db $01, $08, $1E, $00, $00
DATA_1AFB43:         db $04, $FC, $06, $00, $02
DATA_1AFB48:         db $F8, $FD, $04, $04, $02
DATA_1AFB4D:         db $09, $0E, $0C, $44, $00
DATA_1AFB52:         db $02, $0E, $0C, $44, $00
DATA_1AFB57:         db $06, $08, $0E, $80, $00
DATA_1AFB5C:         db $FE, $08, $1E, $00, $00
DATA_1AFB61:         db $FF, $FD, $0D, $40, $02
DATA_1AFB66:         db $FC, $FD, $04, $04, $02
DATA_1AFB6B:         db $09, $10, $1C, $04, $00
DATA_1AFB70:         db $02, $10, $1C, $04, $00
DATA_1AFB75:         db $0A, $08, $0E, $80, $00
DATA_1AFB7A:         db $02, $08, $1E, $00, $00
DATA_1AFB7F:         db $03, $FD, $0D, $40, $02
DATA_1AFB84:         db $FD, $FD, $04, $04, $02
DATA_1AFB89:         db $05, $0D, $0C, $04, $00
DATA_1AFB8E:         db $FF, $0E, $0C, $04, $00
DATA_1AFB93:         db $0A, $08, $0E, $80, $00
DATA_1AFB98:         db $02, $08, $1E, $00, $00
DATA_1AFB9D:         db $04, $FD, $0D, $40, $02
DATA_1AFBA2:         db $FB, $01, $E2, $00, $00
DATA_1AFBA7:         db $FE, $05, $F1, $00, $00
DATA_1AFBAC:         db $00, $06, $44, $00, $00
DATA_1AFBB1:         db $F9, $05, $E2, $00, $00
DATA_1AFBB6:         db $F8, $02, $E2, $00, $00
DATA_1AFBBB:         db $F8, $09, $E2, $80, $00
DATA_1AFBC0:         db $F9, $05, $E2, $00, $00
DATA_1AFBC5:         db $F8, $02, $E2, $00, $00
DATA_1AFBCA:         db $F8, $09, $E2, $80, $00
DATA_1AFBCF:         db $FA, $05, $E2, $40, $00
DATA_1AFBD4:         db $F6, $03, $E2, $00, $00
DATA_1AFBD9:         db $F6, $08, $E2, $80, $00
DATA_1AFBDE:         db $F8, $00, $E2, $00, $00
DATA_1AFBE3:         db $F8, $0B, $E2, $C0, $00
DATA_1AFBE8:         db $F8, $0B, $E2, $C0, $00
DATA_1AFBED:         db $FD, $09, $E2, $00, $00
DATA_1AFBF2:         db $FD, $02, $E2, $80, $00
DATA_1AFBF7:         db $F3, $09, $E2, $40, $00
DATA_1AFBFC:         db $F8, $0D, $E2, $80, $00
DATA_1AFC01:         db $F3, $02, $E2, $C0, $00
DATA_1AFC06:         db $F8, $FD, $E2, $00, $00
DATA_1AFC0B:         db $FE, $01, $F0, $80, $00
DATA_1AFC10:         db $FE, $0A, $F0, $00, $00
DATA_1AFC15:         db $F2, $0A, $F0, $00, $00
DATA_1AFC1A:         db $F8, $0F, $F0, $80, $00
DATA_1AFC1F:         db $F2, $01, $F0, $80, $00
DATA_1AFC24:         db $F8, $FB, $F0, $00, $00
DATA_1AFC29:         db $FF, $00, $F1, $80, $00
DATA_1AFC2E:         db $FF, $0B, $F1, $00, $00
DATA_1AFC33:         db $F1, $0B, $F1, $40, $00
DATA_1AFC38:         db $F8, $11, $F1, $80, $00
DATA_1AFC3D:         db $F1, $00, $F1, $C0, $00
DATA_1AFC42:         db $F8, $F9, $F1, $00, $00
DATA_1AFC47:         db $00, $FF, $E1, $00, $00
DATA_1AFC4C:         db $00, $0C, $E1, $00, $00
DATA_1AFC51:         db $F0, $0C, $E1, $00, $00
DATA_1AFC56:         db $F8, $12, $E1, $00, $00
DATA_1AFC5B:         db $F0, $FF, $E1, $00, $00
DATA_1AFC60:         db $F8, $F8, $E1, $00, $00
DATA_1AFC65:         db $08, $04, $0F, $04, $00
DATA_1AFC6A:         db $00, $04, $1F, $04, $00
DATA_1AFC6F:         db $F6, $FA, $3F, $02, $00
DATA_1AFC74:         db $0F, $FB, $3C, $42, $00
DATA_1AFC79:         db $FA, $02, $04, $02, $02
DATA_1AFC7E:         db $FD, $0C, $0C, $02, $00
DATA_1AFC83:         db $05, $04, $0A, $02, $02
DATA_1AFC88:         db $00, $F9, $02, $02, $02
DATA_1AFC8D:         db $F0, $F9, $00, $02, $02
DATA_1AFC92:         db $F6, $FB, $3F, $02, $00
DATA_1AFC97:         db $0F, $FB, $3D, $02, $00
DATA_1AFC9C:         db $FA, $03, $06, $02, $02
DATA_1AFCA1:         db $FD, $0C, $0C, $02, $00
DATA_1AFCA6:         db $05, $04, $0A, $02, $02
DATA_1AFCAB:         db $00, $FA, $02, $02, $02
DATA_1AFCB0:         db $F0, $FA, $00, $02, $02
DATA_1AFCB5:         db $F6, $FC, $3F, $02, $00
DATA_1AFCBA:         db $0F, $FC, $3E, $02, $00
DATA_1AFCBF:         db $FA, $04, $08, $02, $02
DATA_1AFCC4:         db $FD, $0C, $0C, $02, $00
DATA_1AFCC9:         db $05, $04, $0A, $02, $02
DATA_1AFCCE:         db $00, $FB, $02, $02, $02
DATA_1AFCD3:         db $F0, $FB, $00, $02, $02
DATA_1AFCD8:         db $0A, $0C, $31, $02, $00
DATA_1AFCDD:         db $F5, $FB, $3F, $02, $00
DATA_1AFCE2:         db $0E, $FB, $3C, $42, $00
DATA_1AFCE7:         db $02, $04, $20, $02, $02
DATA_1AFCEC:         db $F9, $03, $06, $02, $02
DATA_1AFCF1:         db $FF, $FA, $02, $02, $02
DATA_1AFCF6:         db $EF, $FA, $00, $02, $02
DATA_1AFCFB:         db $F3, $FA, $3F, $02, $00
DATA_1AFD00:         db $FE, $09, $1C, $02, $00
DATA_1AFD05:         db $F7, $02, $04, $02, $02
DATA_1AFD0A:         db $0C, $FA, $3D, $02, $00
DATA_1AFD0F:         db $06, $02, $22, $02, $02
DATA_1AFD14:         db $FD, $F9, $02, $02, $02
DATA_1AFD19:         db $ED, $F9, $00, $02, $02
DATA_1AFD1E:         db $F6, $FB, $3F, $02, $00
DATA_1AFD23:         db $0F, $FC, $3E, $02, $00
DATA_1AFD28:         db $FA, $03, $06, $02, $02
DATA_1AFD2D:         db $FC, $0C, $0C, $02, $00
DATA_1AFD32:         db $04, $04, $24, $02, $02
DATA_1AFD37:         db $00, $FA, $02, $02, $02
DATA_1AFD3C:         db $F0, $FA, $00, $02, $02
DATA_1AFD41:         db $09, $0D, $37, $02, $00
DATA_1AFD46:         db $F5, $FC, $3F, $02, $00
DATA_1AFD4B:         db $0E, $FC, $3D, $02, $00
DATA_1AFD50:         db $F9, $04, $08, $02, $02
DATA_1AFD55:         db $01, $05, $26, $02, $02
DATA_1AFD5A:         db $FF, $FB, $02, $02, $02
DATA_1AFD5F:         db $EF, $FB, $00, $02, $02
DATA_1AFD64:         db $F8, $0C, $1D, $02, $00
DATA_1AFD69:         db $12, $FB, $3C, $42, $00
DATA_1AFD6E:         db $04, $04, $28, $02, $02
DATA_1AFD73:         db $04, $FC, $02, $02, $02
DATA_1AFD78:         db $F4, $FC, $00, $02, $02
DATA_1AFD7D:         db $F8, $0C, $1D, $02, $00
DATA_1AFD82:         db $FC, $0A, $0D, $02, $00
DATA_1AFD87:         db $F8, $0C, $1D, $02, $00
DATA_1AFD8C:         db $12, $FB, $3D, $02, $00
DATA_1AFD91:         db $04, $04, $28, $02, $02
DATA_1AFD96:         db $04, $FC, $02, $02, $02
DATA_1AFD9B:         db $F4, $FC, $00, $02, $02
DATA_1AFDA0:         db $F8, $0C, $1D, $02, $00
DATA_1AFDA5:         db $FC, $0A, $0D, $02, $00
DATA_1AFDAA:         db $F8, $0C, $1D, $02, $00
DATA_1AFDAF:         db $12, $FC, $3E, $02, $00
DATA_1AFDB4:         db $04, $04, $28, $02, $02
DATA_1AFDB9:         db $04, $FC, $02, $02, $02
DATA_1AFDBE:         db $F4, $FC, $00, $02, $02
DATA_1AFDC3:         db $F8, $0C, $1D, $02, $00
DATA_1AFDC8:         db $FC, $0A, $0D, $02, $00
DATA_1AFDCD:         db $04, $04, $28, $02, $02
DATA_1AFDD2:         db $12, $FB, $3C, $42, $00
DATA_1AFDD7:         db $F4, $FC, $00, $02, $02
DATA_1AFDDC:         db $F8, $07, $0D, $82, $00
DATA_1AFDE1:         db $04, $FC, $02, $02, $02
DATA_1AFDE6:         db $FC, $0A, $0D, $02, $00
DATA_1AFDEB:         db $F0, $02, $1C, $82, $00
DATA_1AFDF0:         db $04, $04, $28, $02, $02
DATA_1AFDF5:         db $12, $FB, $3D, $02, $00
DATA_1AFDFA:         db $F4, $FC, $00, $02, $02
DATA_1AFDFF:         db $F8, $07, $0D, $82, $00
DATA_1AFE04:         db $04, $FC, $02, $02, $02
DATA_1AFE09:         db $FC, $0A, $0D, $02, $00
DATA_1AFE0E:         db $F1, $07, $1C, $02, $00
DATA_1AFE13:         db $F5, $0C, $0C, $02, $00
DATA_1AFE18:         db $04, $04, $28, $02, $02
DATA_1AFE1D:         db $12, $FC, $3E, $02, $00
DATA_1AFE22:         db $F5, $0C, $0C, $02, $00
DATA_1AFE27:         db $F4, $FC, $00, $02, $02
DATA_1AFE2C:         db $04, $FC, $02, $02, $02
DATA_1AFE31:         db $FC, $0A, $0D, $02, $00
DATA_1AFE36:         db $08, $F5, $3D, $42, $00
DATA_1AFE3B:         db $03, $0D, $1C, $02, $00
DATA_1AFE40:         db $07, $04, $2A, $02, $02
DATA_1AFE45:         db $06, $FD, $2C, $02, $02
DATA_1AFE4A:         db $F7, $01, $00, $02, $02
DATA_1AFE4F:         db $F3, $0D, $1C, $02, $00
DATA_1AFE54:         db $FB, $0C, $0D, $82, $00
DATA_1AFE59:         db $08, $F5, $3C, $02, $00
DATA_1AFE5E:         db $03, $0D, $1C, $02, $00
DATA_1AFE63:         db $07, $04, $2A, $02, $02
DATA_1AFE68:         db $06, $FD, $2C, $02, $02
DATA_1AFE6D:         db $F7, $01, $00, $02, $02
DATA_1AFE72:         db $F3, $0D, $1C, $02, $00
DATA_1AFE77:         db $FB, $0C, $0D, $82, $00
DATA_1AFE7C:         db $11, $F5, $3C, $42, $00
DATA_1AFE81:         db $03, $0D, $1C, $02, $00
DATA_1AFE86:         db $07, $04, $2A, $02, $02
DATA_1AFE8B:         db $07, $FD, $2C, $02, $02
DATA_1AFE90:         db $F7, $01, $00, $02, $02
DATA_1AFE95:         db $F3, $0D, $1C, $02, $00
DATA_1AFE9A:         db $FB, $0C, $0D, $82, $00
DATA_1AFE9F:         db $11, $F5, $3D, $02, $00
DATA_1AFEA4:         db $03, $0D, $1C, $02, $00
DATA_1AFEA9:         db $07, $04, $2A, $02, $02
DATA_1AFEAE:         db $07, $FD, $2C, $02, $02
DATA_1AFEB3:         db $F7, $01, $00, $02, $02
DATA_1AFEB8:         db $F3, $0D, $1C, $02, $00
DATA_1AFEBD:         db $FB, $0C, $0D, $82, $00
DATA_1AFEC2:         db $00, $FF, $1E, $42, $02
DATA_1AFEC7:         db $F8, $F7, $0E, $02, $02
DATA_1AFECC:         db $F8, $07, $2E, $02, $00
DATA_1AFED1:         db $04, $04, $0A, $02, $02
DATA_1AFED6:         db $0F, $FC, $3C, $42, $00
DATA_1AFEDB:         db $08, $F7, $0E, $42, $00
DATA_1AFEE0:         db $FC, $0C, $0C, $02, $00
DATA_1AFEE5:         db $09, $EC, $06, $00, $00
DATA_1AFEEA:         db $00, $DA, $0C, $00, $02
DATA_1AFEEF:         db $00, $E9, $0C, $00, $02
DATA_1AFEF4:         db $01, $EC, $06, $00, $00
DATA_1AFEF9:         db $06, $08, $18, $00, $00
DATA_1AFEFE:         db $FE, $08, $18, $00, $00
DATA_1AFF03:         db $00, $F8, $0C, $00, $02
DATA_1AFF08:         db $F8, $F8, $00, $00, $02
DATA_1AFF0D:         db $08, $F8, $02, $00, $02
DATA_1AFF12:         db $F8, $08, $04, $00, $02
DATA_1AFF17:         db $08, $08, $06, $00, $02
DATA_1AFF1C:         db $F8, $F8, $0A, $00, $02
DATA_1AFF21:         db $08, $F8, $0C, $00, $02
DATA_1AFF26:         db $F8, $08, $0E, $00, $02
DATA_1AFF2B:         db $08, $08, $0E, $40, $02
DATA_1AFF30:         db $F8, $F8, $00, $00, $02
DATA_1AFF35:         db $08, $F8, $00, $00, $02
DATA_1AFF3A:         db $F8, $08, $00, $00, $02
DATA_1AFF3F:         db $08, $08, $00, $00, $02
DATA_1AFF44:         db $08, $08, $00, $00, $02
DATA_1AFF49:         db $FA, $F8, $06, $00, $02
DATA_1AFF4E:         db $08, $F8, $08, $00, $02
DATA_1AFF53:         db $F3, $04, $00, $00, $02
DATA_1AFF58:         db $FA, $06, $02, $00, $02
DATA_1AFF5D:         db $08, $08, $04, $00, $02
DATA_1AFF62:         db $F8, $F9, $06, $00, $02
DATA_1AFF67:         db $08, $F9, $08, $00, $02
DATA_1AFF6C:         db $E8, $04, $00, $00, $02
DATA_1AFF71:         db $F8, $06, $02, $00, $02
DATA_1AFF76:         db $08, $06, $04, $00, $02
DATA_1AFF7B:         db $F0, $04, $00, $00, $02
DATA_1AFF80:         db $00, $04, $02, $00, $02
DATA_1AFF85:         db $00, $04, $02, $00, $00
DATA_1AFF8A:         db $10, $04, $04, $00, $02
DATA_1AFF8F:         db $10, $04, $04, $00, $00
DATA_1AFF94:         db $00, $04, $02, $00, $00
DATA_1AFF99:         db $08, $04, $03, $00, $00
DATA_1AFF9E:         db $00, $0C, $12, $00, $00
DATA_1AFFA3:         db $08, $0C, $13, $00, $00
DATA_1AFFA8:         db $10, $04, $04, $00, $02
DATA_1AFFAD:         db $10, $04, $04, $00, $00
DATA_1AFFB2:         db $10, $04, $04, $00, $00
DATA_1AFFB7:         db $18, $04, $05, $00, $00
DATA_1AFFBC:         db $10, $0C, $14, $00, $00
DATA_1AFFC1:         db $18, $0C, $15, $00, $00
DATA_1AFFC6:         db $05, $F8, $41, $01, $00
DATA_1AFFCB:         db $FD, $F8, $40, $01, $00
DATA_1AFFD0:         db $03, $02, $4A, $C9, $02
DATA_1AFFD5:         db $FD, $F8, $40, $01, $02
DATA_1AFFDA:         db $FE, $08, $2E, $00, $00
DATA_1AFFDF:         db $07, $05, $55, $01, $00
DATA_1AFFE4:         db $FF, $05, $54, $01, $00
DATA_1AFFE9:         db $06, $F7, $41, $01, $00
DATA_1AFFEE:         db $FE, $F7, $40, $01, $00
DATA_1AFFF3:         db $03, $03, $4A, $C9, $02
DATA_1AFFF8:         db $FE, $F7, $40, $01, $02
DATA_1AFFFD:         db $07, $04, $55
; table continues in bank 1B
; $4D mirror allows seamless crossbank access
