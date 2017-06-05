; sprite pointer table
; these are pointers to words
; in bank 4D (that's this bank & 1B together)
; this table is for the 00 drawing method
; containing OAM information
org $1A8000

  dw $0000                                  ; $1A8000 | Log, floating on water / lava
  dw $0000                                  ; $1A8002 | Closed door
  dw $0000                                  ; $1A8004 | Naval Piranha's stalk
  dw $0000                                  ; $1A8006 | Crate, key
  dw $09E4                                  ; $1A8008 | Item from Star Mario block
  dw $092E                                  ; $1A800A | Icy watermelon
  dw $0938                                  ; $1A800C | Chill
  dw $0940                                  ; $1A800E | Watermelon
  dw $0944                                  ; $1A8010 | Rubble
  dw $0946                                  ; $1A8012 | Fire watermelon
  dw $0000                                  ; $1A8014 | Kaboomba
  dw $0948                                  ; $1A8016 | Cannonball of Kaboomba
  dw $0000                                  ; $1A8018 | Raphael the Raven
  dw $0000                                  ; $1A801A | Goal
  dw $0000                                  ; $1A801C | G O A L !
  dw $0000                                  ; $1A801E | BONUS CHALLENGE
  dw $0000                                  ; $1A8020 | Caged Ghost, round mound
  dw $0000                                  ; $1A8022 | Item Card
  dw $0000                                  ; $1A8024 | Boss Door
  dw $0000                                  ; $1A8026 | Boss Explosion
  dw $0000                                  ; $1A8028 | Key from defeated boss
  dw $094A                                  ; $1A802A | Torpedo of Yoshi Submarine
  dw $0000                                  ; $1A802C | Bigger Boo
  dw $0000                                  ; $1A802E | Frog Pirate
  dw $094C                                  ; $1A8030 | Flame of Red Watermelon
  dw $0954                                  ; $1A8032 | Bubble
  dw $0000                                  ; $1A8034 | Ski lift
  dw $0000                                  ; $1A8036 | Vertical log, floating on lava
  dw $0000                                  ; $1A8038 | Dr. Freezegood, nothing / 6 stars / 1-up / Bumpty
  dw $0000                                  ; $1A803A | Dr. Freezegood, with ski lift
  dw $0000                                  ; $1A803C | Shy Guy, green / red / yellow / purple
  dw $0000                                  ; $1A803E | Rotating Doors
  dw $0000                                  ; $1A8040 | Bandit
  dw $0000                                  ; $1A8042 | ? bucket
  dw $0964                                  ; $1A8044 | Flashing Egg
  dw $0964                                  ; $1A8046 | Red Egg
  dw $0964                                  ; $1A8048 | Yellow Egg
  dw $0964                                  ; $1A804A | Green Egg
  dw $0000                                  ; $1A804C | Giant Egg, for battle with Bowser
  dw $096E                                  ; $1A804E | Key
  dw $0000                                  ; $1A8050 | Huffin' Puffin, running away
  dw $0000                                  ; $1A8052 | Giant Egg, for battle with Prince Froggy?
  dw $0000                                  ; $1A8054 | Red Giant Egg
  dw $0000                                  ; $1A8056 | Green Giant Egg
  dw $0000                                  ; $1A8058 | Lunge Fish
  dw $0000                                  ; $1A805A | Salvo the Slime
  dw $0000                                  ; $1A805C | Salve the Slime's eyes
  dw $09E8                                  ; $1A805E | Little Mouser's Nest
  dw $0000                                  ; $1A8060 | Little Mouser
  dw $0970                                  ; $1A8062 | Potted Spiked Fun Guy
  dw $0000                                  ; $1A8064 | Little Mouser, looking around, in nest / behind stuff
  dw $0000                                  ; $1A8066 | Little Mouser, from nest
  dw $0000                                  ; $1A8068 | Rogger the Potted Ghost
  dw $0000                                  ; $1A806A | Falling down Rogger the Potted Ghost?
  dw $0000                                  ; $1A806C | (BG3) Falling down wall
  dw $0974                                  ; $1A806E | Grim Leecher
  dw $097C                                  ; $1A8070 | Flame spat by Rogger the Potted Ghost
  dw $0000                                  ; $1A8072 | (BG3) Spinning wooden platform
  dw $0000                                  ; $1A8074 | 3 Mini-Ravens
  dw $0000                                  ; $1A8076 | Mini-Raven
  dw $0000                                  ; $1A8078 | Tap-Tap the Red Nose
  dw $0000                                  ; $1A807A | (BG3) Seesaw
  dw $0000                                  ; $1A807C | Skinny platform
  dw $0000                                  ; $1A807E | Slime
  dw $0000                                  ; $1A8080 | Baby Luigi
  dw $0000                                  ; $1A8082 | Stork
  dw $0000                                  ; $1A8084 | Vertical pipe entrance
  dw $0000                                  ; $1A8086 | Red Giant Shy Guy
  dw $0000                                  ; $1A8088 | Green Giant Shy Guy
  dw $0000                                  ; $1A808A | Prince Froggy, throat / before fight / throat with uvu
  dw $0000                                  ; $1A808C | Burt the Bashful
  dw $0000                                  ; $1A808E | Shy Guy for Rogger the Potted Ghost
  dw $0000                                  ; $1A8090 | Kamek, for scenes before boss fights
  dw $0000                                  ; $1A8092 | The head of fire of the Thunder Lakitu
  dw $0000                                  ; $1A8094 | Fire of Thunder Lakitu
  dw $0000                                  ; $1A8096 | Hypocenter of the thunder.
  dw $0000                                  ; $1A8098 | Upside down Blow Hard
  dw $0000                                  ; $1A809A | unknown
  dw $0000                                  ; $1A809C | Locked door
  dw $0000                                  ; $1A809E | Middle ring
  dw $0000                                  ; $1A80A0 | (BG3) Board
  dw $0000                                  ; $1A80A2 | (BG3) Large log
  dw $0000                                  ; $1A80A4 | Balloon
  dw $0000                                  ; $1A80A6 | Kamek, says \OH MY!!!\""
  dw $0000                                  ; $1A80A8 | Upside down Wild Piranha
  dw $0000                                  ; $1A80AA | Green Pinwheel
  dw $0000                                  ; $1A80AC | Pink Pinwheel
  dw $0000                                  ; $1A80AE | (BG3) Sewer ghost with Flatbed Ferry on its head
  dw $0000                                  ; $1A80B0 | Green Solo Toady
  dw $09AA                                  ; $1A80B2 | Continuous Super Star
  dw $0A0A                                  ; $1A80B4 | Spark of Raphael the Raven.
  dw $0000                                  ; $1A80B6 | Coin Bandit
  dw $0000                                  ; $1A80B8 | Pink Toadie
  dw $09A8                                  ; $1A80BA | [CRASH]
  dw $0000                                  ; $1A80BC | (BG3) Plank
  dw $0000                                  ; $1A80BE | (BG3) Plank
  dw $09AC                                  ; $1A80C0 | Bomb
  dw $0000                                  ; $1A80C2 | Baby Mario
  dw $0000                                  ; $1A80C4 | Goomba
  dw $0000                                  ; $1A80C6 | Muddy Buddy
  dw $0000                                  ; $1A80C8 | Pink Pinwheel, (X: direction) (Y: size)
  dw $0A00                                  ; $1A80CA | Red coin
  dw $0000                                  ; $1A80CC | Wild Piranha
  dw $0000                                  ; $1A80CE | Hidden Winged Cloud, stars / seed / flower / 1-up
  dw $0000                                  ; $1A80D0 | Flashing Egg Block
  dw $0000                                  ; $1A80D2 | Red Egg Block
  dw $0000                                  ; $1A80D4 | Yellow Egg Block
  dw $09A8                                  ; $1A80D6 | Hit green Egg Block
  dw $0000                                  ; $1A80D8 | Large Spring Ball
  dw $0000                                  ; $1A80DA | Hootie the Blue Fish, clockwise
  dw $0000                                  ; $1A80DC | Hootie the Blue Fish, anticlockwise
  dw $0000                                  ; $1A80DE | Spring Ball
  dw $0000                                  ; $1A80E0 | Clawdaddy
  dw $09F2                                  ; $1A80E2 | Big Boo with 3 Boos / Big Boo / Big Boo with 3 Boos /
  dw $0990                                  ; $1A80E4 | Train Bandit
  dw $0000                                  ; $1A80E6 | (BG3) Balloon Pumper with red balloon
  dw $099C                                  ; $1A80E8 | Spike
  dw $0000                                  ; $1A80EA | Spiked ball
  dw $0000                                  ; $1A80EC | Piro Dangle, clockwise
  dw $0000                                  ; $1A80EE | Piro Dangle, anticlockwise
  dw $0000                                  ; $1A80F0 | Biting Bullet Bill Blaster
  dw $0000                                  ; $1A80F2 | Bouncing Bullet Bill Blaster
  dw $0000                                  ; $1A80F4 | Bullet Bill Blaster
  dw $0000                                  ; $1A80F6 | Biting Bullet Bill
  dw $0000                                  ; $1A80F8 | Bouncing Bullet Bill
  dw $0000                                  ; $1A80FA | Bullet Bill
  dw $0000                                  ; $1A80FC | Dent of castella
  dw $0000                                  ; $1A80FE | Log seesaw
  dw $0000                                  ; $1A8100 | Lava Bubble
  dw $0000                                  ; $1A8102 | Lava Bubble, jumps across
  dw $0000                                  ; $1A8104 | Chain Chomp
  dw $0000                                  ; $1A8106 | Cloud
  dw $0000                                  ; $1A8108 | Teleport sprite
  dw $09C6                                  ; $1A810A | Harry Hedgehog
  dw $0000                                  ; $1A810C | [CRASH]
  dw $0964                                  ; $1A810E | Red Egg, gives 1-up
  dw $09AA                                  ; $1A8110 | Super Star
  dw $0000                                  ; $1A8112 | Red Flatbed Ferry, moving horizontally
  dw $0000                                  ; $1A8114 | Pink Flatbed Ferry, moving vertically
  dw $0000                                  ; $1A8116 | Mock Up, green / red
  dw $0000                                  ; $1A8118 | Yoshi, at the Goal
  dw $0000                                  ; $1A811A | Fly Guy, 5 stars / red coin / 1-up / 1-up
  dw $0000                                  ; $1A811C | Kamek, at Bowser's room
  dw $0000                                  ; $1A811E | Swing of Grinders
  dw $0000                                  ; $1A8120 | (BG3) Dangling Ghost
  dw $0000                                  ; $1A8122 | 4 Toadies
  dw $0000                                  ; $1A8124 | Melon Bug
  dw $0000                                  ; $1A8126 | Door
  dw $0000                                  ; $1A8128 | Expansion Block
  dw $0000                                  ; $1A812A | Blue checkered block
  dw $0000                                  ; $1A812C | Red checkered block
  dw $0000                                  ; $1A812E | POW
  dw $0000                                  ; $1A8130 | Yoshi Block
  dw $09C2                                  ; $1A8132 | Spiny Egg
  dw $0000                                  ; $1A8134 | Chained green Flatbed Ferry
  dw $0A1A                                  ; $1A8136 | Mace Guy
  dw $0000                                  ; $1A8138 | Mace
  dw $0000                                  ; $1A813A | !-switch
  dw $0000                                  ; $1A813C | Chomp Rock
  dw $0000                                  ; $1A813E | Wild Ptooie Piranha, spits 1 / 3 Needlenose
  dw $0000                                  ; $1A8140 | Tulip
  dw $09AE                                  ; $1A8142 | Pot of Potted Spiked Fun Guy
  dw $0000                                  ; $1A8144 | Fireball of Thunder Lakitu
  dw $0000                                  ; $1A8146 | Bandit, getting under cover, left
  dw $0000                                  ; $1A8148 | Bandit, getting under cover, right
  dw $0000                                  ; $1A814A | Nep-Enut / Gargantua Blargg
  dw $0000                                  ; $1A814C | Incoming Chomp
  dw $0000                                  ; $1A814E | Flock of Incoming Chomps
  dw $0000                                  ; $1A8150 | Falling Incoming Chomp
  dw $0000                                  ; $1A8152 | Shadow of falling Incoming Chomp
  dw $0000                                  ; $1A8154 | Shy Guy in background
  dw $0964                                  ; $1A8156 | Fill Eggs
  dw $0000                                  ; $1A8158 | Sign Arrow and Shadow
  dw $0000                                  ; $1A815A | Hint Block
  dw $0000                                  ; $1A815C | Hookbill the Koopa
  dw $092C                                  ; $1A815E | Morph Bubble, Car
  dw $092C                                  ; $1A8160 | Morph Bubble, Mole Tank
  dw $092C                                  ; $1A8162 | Morph Bubble, Helicopter
  dw $092C                                  ; $1A8164 | Morph Bubble, Train
  dw $0000                                  ; $1A8166 | Wind of Fuzzy
  dw $092C                                  ; $1A8168 | Morph Bubble, Submarine
  dw $0000                                  ; $1A816A | Hidden Winged Cloud, 1-up / 5 stars / !-switch / 5 sta
  dw $0000                                  ; $1A816C | Winged Cloud, 8 coins
  dw $0000                                  ; $1A816E | Winged Cloud, bubbled 1-up
  dw $0000                                  ; $1A8170 | Winged Cloud, flower
  dw $0000                                  ; $1A8172 | Winged Cloud, POW
  dw $092C                                  ; $1A8174 | Winged Cloud, stairs, right / left
  dw $092C                                  ; $1A8176 | Winged Cloud, platform, right / left
  dw $0000                                  ; $1A8178 | Winged Cloud, Bandit
  dw $0000                                  ; $1A817A | Winged Cloud, coin (object)
  dw $0000                                  ; $1A817C | Winged Cloud, 1-up
  dw $0000                                  ; $1A817E | Winged Cloud, key
  dw $0000                                  ; $1A8180 | Winged Cloud, 3 stars
  dw $0000                                  ; $1A8182 | Winged Cloud, 5 stars
  dw $0000                                  ; $1A8184 | Winged Cloud, door
  dw $0000                                  ; $1A8186 | Winged Cloud, ground eater
  dw $0000                                  ; $1A8188 | Winged Cloud, watermelon
  dw $0000                                  ; $1A818A | Winged Cloud, fire watermelon
  dw $0000                                  ; $1A818C | Winged Cloud, icy watermelon
  dw $09CA                                  ; $1A818E | Winged Cloud, seed of sunflower with 3 leaves
  dw $09CA                                  ; $1A8190 | Winged Cloud, seed of sunflower with 6 leaves
  dw $0000                                  ; $1A8192 | Winged Cloud, [CRASH]
  dw $0000                                  ; $1A8194 | Boss Door of Bowser's room
  dw $0000                                  ; $1A8196 | Winged Cloud, random item.
  dw $0000                                  ; $1A8198 | Winged Cloud, !-switch / !-switch
  dw $0000                                  ; $1A819A | Baron Von Zeppelin, Giant Egg
  dw $0000                                  ; $1A819C | Bowser's flame
  dw $0000                                  ; $1A819E | Bowser's quake
  dw $0000                                  ; $1A81A0 | Horizontal entrance, towards right
  dw $0000                                  ; $1A81A2 | Hidden entrance, revealed by an ! switch
  dw $0000                                  ; $1A81A4 | Marching Milde
  dw $0000                                  ; $1A81A6 | Giant Milde
  dw $0000                                  ; $1A81A8 | Large Milde
  dw $0000                                  ; $1A81AA | Moutain backgrounds at fight with Hookbill the Koopa
  dw $0000                                  ; $1A81AC | (BG3) Ghost with Flatbed Ferry on its head
  dw $0000                                  ; $1A81AE | Sluggy the Unshaven
  dw $0000                                  ; $1A81B0 | Chomp signboard.
  dw $0000                                  ; $1A81B2 | Fishin' Lakitu
  dw $0000                                  ; $1A81B4 | Flower pot, key / 6 stars / 6 coins / nothing
  dw $0000                                  ; $1A81B6 | (BG3) Soft thing
  dw $0000                                  ; $1A81B8 | Snowball
  dw $0000                                  ; $1A81BA | Closer, in Naval Piranha's room
  dw $0000                                  ; $1A81BC | Falling Rock
  dw $0000                                  ; $1A81BE | Piscatory Pete, Blue / Gold
  dw $09EA                                  ; $1A81C0 | Preying Mantas
  dw $0000                                  ; $1A81C2 | Loch Nestor
  dw $0000                                  ; $1A81C4 | Boo Blah, normal / upside down
  dw $0000                                  ; $1A81C6 | Boo Blah with Piro Dangle, normal / upside down
  dw $0000                                  ; $1A81C8 | Heading cactus
  dw $09B2                                  ; $1A81CA | Green Needlenose
  dw $0000                                  ; $1A81CC | Gusty, left / right / infinite right / infinite left
  dw $0000                                  ; $1A81CE | Burt, two / one
  dw $0000                                  ; $1A81D0 | Goonie, right / towards Yoshi / generator right / gene
  dw $0000                                  ; $1A81D2 | 3 Flightless Goonies
  dw $0000                                  ; $1A81D4 | Cloud Drop, moving vertically
  dw $0000                                  ; $1A81D6 | Cloud Drop, moving horizontally
  dw $0000                                  ; $1A81D8 | Flamer Guy, jumping around
  dw $0000                                  ; $1A81DA | Flamer Guy, walking around
  dw $0000                                  ; $1A81DC | Eggo-Dil
  dw $0000                                  ; $1A81DE | Eggo-Dil's face
  dw $09B4                                  ; $1A81E0 | Petal of Eggo-Dil
  dw $0000                                  ; $1A81E2 | Bubble-Plant
  dw $0000                                  ; $1A81E4 | Stilt Guy, green / red / yellow / purple
  dw $09F8                                  ; $1A81E6 | Woozy Guy, green / red / yellow / purple
  dw $0000                                  ; $1A81E8 | Egg-Plant / Needlenose-Plant
  dw $0000                                  ; $1A81EA | Slugger
  dw $0000                                  ; $1A81EC | Parent and children of Huffin' Puffins
  dw $0000                                  ; $1A81EE | Barney Bubble
  dw $0000                                  ; $1A81F0 | Blow Hard
  dw $09B6                                  ; $1A81F2 | Yellow Needlenose
  dw $0000                                  ; $1A81F4 | Flower
  dw $0000                                  ; $1A81F6 | Spear Guy, long spear
  dw $0000                                  ; $1A81F8 | Spear Guy, short spear
  dw $0000                                  ; $1A81FA | Zeus Guy
  dw $0000                                  ; $1A81FC | Energy of Zeus Guy
  dw $0000                                  ; $1A81FE | Poochy
  dw $0000                                  ; $1A8200 | Bubbled 1-up
  dw $0000                                  ; $1A8202 | Spiky mace
  dw $0000                                  ; $1A8204 | Spiky mace, double-ended
  dw $0000                                  ; $1A8206 | Boo Guys spinning spiky mace
  dw $0000                                  ; $1A8208 | Jean de Fillet, right / left
  dw $0000                                  ; $1A820A | Boo Guys, carrying bombs towards left.
  dw $0000                                  ; $1A820C | Boo Guys, carrying bombs towards right
  dw $09B8                                  ; $1A820E | Seed of watermelon
  dw $0000                                  ; $1A8210 | Milde
  dw $0000                                  ; $1A8212 | Tap-Tap
  dw $0000                                  ; $1A8214 | Tap-Tap, stays on ledges
  dw $0000                                  ; $1A8216 | Hopping Tap-tap
  dw $0000                                  ; $1A8218 | Chained spike ball, controlled by Boo Guy
  dw $0000                                  ; $1A821A | Boo Guy, rotating a pulley, right / left
  dw $0000                                  ; $1A821C | Crate, 6 stars
  dw $0000                                  ; $1A821E | Boo Man Bluff
  dw $0000                                  ; $1A8220 | Flower
  dw $0000                                  ; $1A8222 | Georgette Jelly
  dw $09BA                                  ; $1A8224 | Splashed Georgette Jelly
  dw $0000                                  ; $1A8226 | Snifit
  dw $0000                                  ; $1A8228 | Bullet, shot by Snifit
  dw $0A00                                  ; $1A822A | Coin, gravity affected
  dw $0000                                  ; $1A822C | Floating round platform on water
  dw $09C0                                  ; $1A822E | Donut Lift
  dw $0000                                  ; $1A8230 | Giant Donut Lift
  dw $0000                                  ; $1A8232 | Spooky
  dw $0000                                  ; $1A8234 | Green Glove
  dw $0000                                  ; $1A8236 | Lakitu, one / two
  dw $0000                                  ; $1A8238 | Lakitu's cloud
  dw $09C2                                  ; $1A823A | Spiny Egg
  dw $0000                                  ; $1A823C | Brown Arrow Wheel
  dw $0000                                  ; $1A823E | Blue Arrow Wheel
  dw $0000                                  ; $1A8240 | Double-ended arrow lift
  dw $0000                                  ; $1A8242 | Explosion of Number Platform
  dw $0000                                  ; $1A8244 | ? bucket, Bandit
  dw $0000                                  ; $1A8246 | ? bucket, 5 coins
  dw $0000                                  ; $1A8248 | Stretch, green / red / yellow / purple
  dw $0000                                  ; $1A824A | Kamek, for the ending scene / flying and chases
  dw $0000                                  ; $1A824C | Spiked log held by chain and pulley
  dw $0000                                  ; $1A824E | ? Pulley
  dw $0000                                  ; $1A8250 | Ground shake
  dw $0000                                  ; $1A8252 | Fuzzy
  dw $0000                                  ; $1A8254 | Shy Guy, with Bandit hidden
  dw $0000                                  ; $1A8256 | Fat Guy, red / green
  dw $0000                                  ; $1A8258 | Fly Guy carrying red coin / Whirly Fly Guy
  dw $0000                                  ; $1A825A | Yoshi, in the intro scene
  dw $0000                                  ; $1A825C | unknown
  dw $0000                                  ; $1A825E | Lava Drop, moving horizontally
  dw $0000                                  ; $1A8260 | Lava Drop, moving vertically
  dw $0000                                  ; $1A8262 | Locked door
  dw $0000                                  ; $1A8264 | Lemon Drop
  dw $0000                                  ; $1A8266 | Lantern Ghost
  dw $0000                                  ; $1A8268 | Baby Bowser
  dw $0000                                  ; $1A826A | Raven, always circling, anticlockwise / clockwise
  dw $0000                                  ; $1A826C | Raven, anticlockwise / clockwise initially
  dw $0000                                  ; $1A826E | 3x6 Falling Rock
  dw $0000                                  ; $1A8270 | 3x3 Falling Rock
  dw $0000                                  ; $1A8272 | 3x9 Falling Rock
  dw $0000                                  ; $1A8274 | 6x3 Falling Rock
  dw $0AF4                                  ; $1A8276 | Stomach Acid
  dw $0000                                  ; $1A8278 | Flipper, downwards
  dw $0000                                  ; $1A827A | Fang, dangling
  dw $0000                                  ; $1A827C | Fang, flying wavily
  dw $0000                                  ; $1A827E | Flopsy Fish, swimming around
  dw $0000                                  ; $1A8280 | Flopsy Fish, swimming and occasionally jumps verticall
  dw $0000                                  ; $1A8282 | Flopsy Fish, swimming and jumps in an arc
  dw $0000                                  ; $1A8284 | Flopsy Fish, jumps 3 times in an arc, right / left
  dw $0000                                  ; $1A8286 | Spray Fish
  dw $0000                                  ; $1A8288 | Flipper, rightwards / leftwards
  dw $0000                                  ; $1A828A | Blue Sluggy, falling down / crawing ceiling
  dw $0000                                  ; $1A828C | Pink Sluggy, falling down / crawing ceiling but doesn'
  dw $0000                                  ; $1A828E | Horizontal entrance, towards left
  dw $0000                                  ; $1A8290 | Large Spring Ball
  dw $0000                                  ; $1A8292 | Arrow cloud, up
  dw $0000                                  ; $1A8294 | Arrow cloud, up right
  dw $0000                                  ; $1A8296 | Arrow cloud, right
  dw $0000                                  ; $1A8298 | Arrow cloud, down right
  dw $0000                                  ; $1A829A | Arrow cloud, down
  dw $0000                                  ; $1A829C | Arrow cloud, down left
  dw $0000                                  ; $1A829E | Arrow cloud, left
  dw $0000                                  ; $1A82A0 | Arrow cloud, up left
  dw $0000                                  ; $1A82A2 | Arrow cloud, rotating
  dw $0000                                  ; $1A82A4 | Flutter
  dw $0000                                  ; $1A82A6 | Goonie with Shy Guy
  dw $0000                                  ; $1A82A8 | Shark Chomp
  dw $0000                                  ; $1A82AA | Very Goonie
  dw $0000                                  ; $1A82AC | Cactus Jack, one / three
  dw $0000                                  ; $1A82AE | Wall Lakitu
  dw $0000                                  ; $1A82B0 | Bowling Goonie
  dw $0000                                  ; $1A82B2 | Grunt, walking
  dw $0000                                  ; $1A82B4 | Grunt, running
  dw $0000                                  ; $1A82B6 | Dancing Spear Guy
  dw $09C4                                  ; $1A82B8 | Green switch for green spiked platform
  dw $09C4                                  ; $1A82BA | Red switch for red spiked platform
  dw $0000                                  ; $1A82BC | Pink Pinwheel with Shy Guys, clockwise / anticlockwise
  dw $0000                                  ; $1A82BE | Green spiked platform
  dw $0000                                  ; $1A82C0 | Red spiked platform
  dw $0000                                  ; $1A82C2 | Bonus Item, red coin / key / flower / door
  dw $0000                                  ; $1A82C4 | Two spiked platforms with one switch in the center
  dw $09D6                                  ; $1A82C6 | Bouncing green Needlenose
  dw $0000                                  ; $1A82C8 | Nipper Plant
  dw $0000                                  ; $1A82CA | Nipper Spore
  dw $0000                                  ; $1A82CC | Thunder Lakitu, one / two
  dw $09CC                                  ; $1A82CE | Green Koopa shell
  dw $09CC                                  ; $1A82D0 | Red Koopa shell
  dw $0000                                  ; $1A82D2 | Green Beach Koopa
  dw $0000                                  ; $1A82D4 | Red Beach Koopa
  dw $09CC                                  ; $1A82D6 | Green Koopa
  dw $09CC                                  ; $1A82D8 | Red Koopa
  dw $09D4                                  ; $1A82DA | Green Para Koopa, jumping forth.
  dw $09D4                                  ; $1A82DC | Red Para Koopa, flying horizontally
  dw $09D4                                  ; $1A82DE | Red Para Koopa, flying vertically
  dw $0000                                  ; $1A82E0 | Aqua Lakitu
  dw $0000                                  ; $1A82E2 | Naval Piranha
  dw $0000                                  ; $1A82E4 | Naval Bud
  dw $0000                                  ; $1A82E6 | Baron Von Zeppelin, red Suy Guy
  dw $0000                                  ; $1A82E8 | Baron Von Zeppelin, Needlenose
  dw $0000                                  ; $1A82EA | Baron Von Zeppelin, bomb
  dw $0000                                  ; $1A82EC | Baron Von Zeppelin, Bandit
  dw $0000                                  ; $1A82EE | Baron Von Zeppelin, large Spring Ball
  dw $0000                                  ; $1A82F0 | Baron Von Zeppelin, 1-up
  dw $0000                                  ; $1A82F2 | Baron Von Zeppelin, key
  dw $0000                                  ; $1A82F4 | Baron Von Zeppelin, 5 coins
  dw $0000                                  ; $1A82F6 | Baron Von Zeppelin, watermelon
  dw $0000                                  ; $1A82F8 | Baron Von Zeppelin, fire watermelon
  dw $0000                                  ; $1A82FA | Baron Von Zeppelin, icy watermelon
  dw $0000                                  ; $1A82FC | Baron Von Zeppelin, crate, 6 stars.
  dw $0000                                  ; $1A82FE | Baron Von Zeppelin
  dw $0000                                  ; $1A8300 | Spinning Log
  dw $0000                                  ; $1A8302 | Crazee Dayzee
  dw $09D8                                  ; $1A8304 | Dragonfly
  dw $09DC                                  ; $1A8306 | Butterfly
  dw $0000                                  ; $1A8308 | Bumpty
  dw $0000                                  ; $1A830A | Active line guided green Flatbed Ferry, left
  dw $0000                                  ; $1A830C | Active line guided green Flatbed Ferry, right
  dw $0000                                  ; $1A830E | Active line guided yellow Flatbed Ferry, left
  dw $0000                                  ; $1A8310 | Active line guided yellow Flatbed Ferry, right
  dw $0000                                  ; $1A8312 | Line guided green Flatbed Ferry, left
  dw $0000                                  ; $1A8314 | Line guided green Flatbed Ferry, right
  dw $0000                                  ; $1A8316 | Line guided yellow Flatbed Ferry, left
  dw $0000                                  ; $1A8318 | Line guided yellow Flatbed Ferry, right
  dw $0000                                  ; $1A831A | Line guided red Flatbed Ferry, left
  dw $0000                                  ; $1A831C | Line guided red Flatbed Ferry, right
  dw $0000                                  ; $1A831E | Whirling lift
  dw $0000                                  ; $1A8320 | Falling icicle
  dw $09E0                                  ; $1A8322 | Sparrow
  dw $0000                                  ; $1A8324 | Muti Guy, green / red / yellow / purple
  dw $0000                                  ; $1A8326 | Caged Ghost, squeezing in sewer
  dw $0000                                  ; $1A8328 | Blargg
  dw $0000                                  ; $1A832A | unknown
  dw $0000                                  ; $1A832C | Unbalanced snowy platform
  dw $0000                                  ; $1A832E | Arrow sign, up / right / left / down
  dw $0000                                  ; $1A8330 | Diagonal arrow sign, up left / up right / down left /
  dw $0000                                  ; $1A8332 | Dizzy Dandy
  dw $09E6                                  ; $1A8334 | Boo Guy
  dw $0000                                  ; $1A8336 | Bumpty, tackles at Yoshi
  dw $0000                                  ; $1A8338 | Flying Bumpty, flying aronnd / flying straightly
  dw $0000                                  ; $1A833A | Skeleton Goonie
  dw $0000                                  ; $1A833C | Flightless Skeleton Goonie
  dw $0000                                  ; $1A833E | Skeleton Goonie with a bomb
  dw $0000                                  ; $1A8340 | Firebar, double-ended, clockwise / anticlockwise
  dw $0000                                  ; $1A8342 | Firebar, clockwise / anticlockwise
  dw $0000                                  ; $1A8344 | Star
  dw $0000                                  ; $1A8346 | Little Skull Mouser
  dw $0000                                  ; $1A8348 | Cork, seals 3D pipe
  dw $0000                                  ; $1A834A | Grinder, runs away
  dw $0000                                  ; $1A834C | Grinder, spits seeds of watermelon
  dw $0000                                  ; $1A834E | Short Fuse / Seedy Sally, right / left
  dw $0000                                  ; $1A8350 | Grinder, grasps Baby Mario
  dw $0000                                  ; $1A8352 | Grinder, climbing, spits seeds of watermelon
  dw $0000                                  ; $1A8354 | Hot Lips
  dw $0000                                  ; $1A8356 | Boo Balloon, coin / !-switch
  dw $0000                                  ; $1A8358 | Frog
  dw $0000                                  ; $1A835A | Kamek, shoots magic at Yoshi.
  dw $0000                                  ; $1A835C | Kamek's magic
  dw $0A00                                  ; $1A835E | Coin
  dw $0A08                                  ; $1A8360 | (BG3) Balloon
  dw $0000                                  ; $1A8362 | Coin Cannon for Mini Battle
  dw $0A00                                  ; $1A8364 | Coin for Mini Battle
  dw $0000                                  ; $1A8366 | Bandit for Mini Battle
  dw $0000                                  ; $1A8368 | Checkered Platform for Mini Battle
  dw $0000                                  ; $1A836A | Bandit for Mini Battle
  dw $0000                                  ; $1A836C | Red Balloon for Mini Battle
  dw $0000                                  ; $1A836E | Bandit for Mini Battle
  dw $0000                                  ; $1A8370 | Watermelon Pot for Mini Battle
  dw $0000                                  ; $1A8372 | possibly Bandit for Mini Battle

; ambient sprites
  dw $0000                                  ; $1A8374 |
  dw $0A22                                  ; $1A8376 |
  dw $0A24                                  ; $1A8378 |
  dw $0A26                                  ; $1A837A |
  dw $0000                                  ; $1A837C |
  dw $0000                                  ; $1A837E |
  dw $0A28                                  ; $1A8380 |
  dw $0000                                  ; $1A8382 |
  dw $0000                                  ; $1A8384 |
  dw $0000                                  ; $1A8386 |
  dw $0000                                  ; $1A8388 |
  dw $0000                                  ; $1A838A |
  dw $0A2E                                  ; $1A838C |
  dw $0A3A                                  ; $1A838E |
  dw $0A3E                                  ; $1A8390 |
  dw $0A44                                  ; $1A8392 |
  dw $095E                                  ; $1A8394 |
  dw $0000                                  ; $1A8396 |
  dw $0000                                  ; $1A8398 |
  dw $0000                                  ; $1A839A |
  dw $0A48                                  ; $1A839C |
  dw $0A4C                                  ; $1A839E |
  dw $0000                                  ; $1A83A0 |
  dw $0000                                  ; $1A83A2 |
  dw $0000                                  ; $1A83A4 |
  dw $0000                                  ; $1A83A6 |
  dw $0000                                  ; $1A83A8 |
  dw $0000                                  ; $1A83AA |
  dw $0A50                                  ; $1A83AC |
  dw $0A58                                  ; $1A83AE |
  dw $0A5A                                  ; $1A83B0 |
  dw $0A62                                  ; $1A83B2 |
  dw $0A68                                  ; $1A83B4 |
  dw $0000                                  ; $1A83B6 |
  dw $0000                                  ; $1A83B8 |
  dw $0A70                                  ; $1A83BA |
  dw $0A68                                  ; $1A83BC |
  dw $0A7A                                  ; $1A83BE |
  dw $0000                                  ; $1A83C0 |
  dw $0000                                  ; $1A83C2 |
  dw $0000                                  ; $1A83C4 |
  dw $0000                                  ; $1A83C6 |
  dw $0000                                  ; $1A83C8 |
  dw $0A86                                  ; $1A83CA |
  dw $0000                                  ; $1A83CC |
  dw $0000                                  ; $1A83CE |
  dw $0000                                  ; $1A83D0 |
  dw $0000                                  ; $1A83D2 |
  dw $0000                                  ; $1A83D4 |
  dw $0000                                  ; $1A83D6 |
  dw $0A90                                  ; $1A83D8 |
  dw $0000                                  ; $1A83DA |
  dw $0000                                  ; $1A83DC |
  dw $0000                                  ; $1A83DE |
  dw $0A70                                  ; $1A83E0 |
  dw $0000                                  ; $1A83E2 |
  dw $0000                                  ; $1A83E4 |
  dw $0A92                                  ; $1A83E6 |
  dw $0000                                  ; $1A83E8 |
  dw $0000                                  ; $1A83EA |
  dw $0000                                  ; $1A83EC |
  dw $0000                                  ; $1A83EE |
  dw $0A94                                  ; $1A83F0 |
  dw $0000                                  ; $1A83F2 |
  dw $0A9A                                  ; $1A83F4 |
  dw $0AA2                                  ; $1A83F6 |
  dw $0AAA                                  ; $1A83F8 |
  dw $0000                                  ; $1A83FA |
  dw $0000                                  ; $1A83FC |
  dw $0AAC                                  ; $1A83FE |
  dw $0AAE                                  ; $1A8400 |
  dw $0000                                  ; $1A8402 |
  dw $0ABE                                  ; $1A8404 |
  dw $0AC0                                  ; $1A8406 |
  dw $0000                                  ; $1A8408 |
  dw $0ACE                                  ; $1A840A |
  dw $0AD4                                  ; $1A840C |
  dw $0ADA                                  ; $1A840E |
  dw $0000                                  ; $1A8410 |
  dw $0000                                  ; $1A8412 |
  dw $0000                                  ; $1A8414 |
  dw $0000                                  ; $1A8416 |
  dw $0000                                  ; $1A8418 |
  dw $0000                                  ; $1A841A |
  dw $0000                                  ; $1A841C |
  dw $0000                                  ; $1A841E |
  dw $0000                                  ; $1A8420 |
  dw $0000                                  ; $1A8422 |
  dw $0AF2                                  ; $1A8424 |
  dw $0000                                  ; $1A8426 |
  dw $0000                                  ; $1A8428 |
  dw $0AAC                                  ; $1A842A |
  dw $0AE2                                  ; $1A842C |
  dw $0AEA                                  ; $1A842E |
  dw $0000                                  ; $1A8430 |
  dw $0AE2                                  ; $1A8432 |
  dw $0000                                  ; $1A8434 |
  dw $0AD4                                  ; $1A8436 |
  dw $0000                                  ; $1A8438 |
  dw $0000                                  ; $1A843A |
  dw $0000                                  ; $1A843C |
  dw $0000                                  ; $1A843E |
  dw $0000                                  ; $1A8440 |
  dw $0000                                  ; $1A8442 |
  dw $0000                                  ; $1A8444 |
  dw $0ADC                                  ; $1A8446 |
  dw $0000                                  ; $1A8448 |
  dw $0000                                  ; $1A844A |
  dw $0A00                                  ; $1A844C |
  dw $0AF8                                  ; $1A844E |
  dw $0000                                  ; $1A8450 |
  dw $09B8                                  ; $1A8452 |
  dw $0000                                  ; $1A8454 |
  dw $0000                                  ; $1A8456 |
  dw $0000                                  ; $1A8458 |
  dw $0000                                  ; $1A845A |
  dw $0000                                  ; $1A845C |
  dw $0000                                  ; $1A845E |
  dw $0000                                  ; $1A8460 |
  dw $0000                                  ; $1A8462 |
  dw $0000                                  ; $1A8464 |
  dw $0000                                  ; $1A8466 |
  dw $0000                                  ; $1A8468 |
  dw $0AFA                                  ; $1A846A |
  dw $0000                                  ; $1A846C |
  dw $0000                                  ; $1A846E |
  dw $0AFE                                  ; $1A8470 |
  dw $0000                                  ; $1A8472 |
  dw $0000                                  ; $1A8474 |
  dw $0000                                  ; $1A8476 |
  dw $0B00                                  ; $1A8478 |
  dw $0000                                  ; $1A847A |
  dw $0000                                  ; $1A847C |
  dw $0000                                  ; $1A847E |
  dw $0000                                  ; $1A8480 |
  dw $0000                                  ; $1A8482 |
  dw $0000                                  ; $1A8484 |
  dw $0000                                  ; $1A8486 |
  dw $0000                                  ; $1A8488 |

; sprite pointer table
; these are pointers to tables
; in bank 4D (that's this bank & 1B together)
; this table is for 01 & 03 drawing methods
; the tables contain OAM information for the sprite
  dw $1040                                  ; $1A848A | Log, floating on water / lava
  dw $9407                                  ; $1A848C | Closed door
  dw $C03A                                  ; $1A848E | Naval Piranha's stalk
  dw $209E                                  ; $1A8490 | Crate, key
  dw $0000                                  ; $1A8492 | Item from Star Mario block
  dw $0000                                  ; $1A8494 | Icy watermelon
  dw $0000                                  ; $1A8496 | Chill
  dw $0000                                  ; $1A8498 | Watermelon
  dw $F933                                  ; $1A849A | Rubble
  dw $0000                                  ; $1A849C | Fire watermelon
  dw $0C3A                                  ; $1A849E | Kaboomba
  dw $0000                                  ; $1A84A0 | Cannonball of Kaboomba
  dw $CDBE                                  ; $1A84A2 | Raphael the Raven
  dw $AFAF                                  ; $1A84A4 | Goal
  dw $0000                                  ; $1A84A6 | G O A L !
  dw $0000                                  ; $1A84A8 | BONUS CHALLENGE
  dw $DD22                                  ; $1A84AA | Caged Ghost, round mound
  dw $1040                                  ; $1A84AC | Item Card
  dw $9407                                  ; $1A84AE | Boss Door
  dw $0000                                  ; $1A84B0 | Boss Explosion
  dw $1040                                  ; $1A84B2 | Key from defeated boss
  dw $0000                                  ; $1A84B4 | Torpedo of Yoshi Submarine
  dw $D502                                  ; $1A84B6 | Bigger Boo
  dw $0000                                  ; $1A84B8 | Frog Pirate
  dw $0000                                  ; $1A84BA | Flame of Red Watermelon
  dw $0000                                  ; $1A84BC | Bubble
  dw $10E0                                  ; $1A84BE | Ski lift
  dw $1108                                  ; $1A84C0 | Vertical log, floating on lava
  dw $1040                                  ; $1A84C2 | Dr. Freezegood, nothing / 6 stars / 1-u
  dw $10E0                                  ; $1A84C4 | Dr. Freezegood, with ski lift
  dw $9605                                  ; $1A84C6 | Shy Guy, green / red / yellow / purple
  dw $FA37                                  ; $1A84C8 | Rotating Doors
  dw $247C                                  ; $1A84CA | Bandit
  dw $8D9F                                  ; $1A84CC | ? bucket
  dw $0000                                  ; $1A84CE | Flashing Egg
  dw $0000                                  ; $1A84D0 | Red Egg
  dw $0000                                  ; $1A84D2 | Yellow Egg
  dw $0000                                  ; $1A84D4 | Green Egg
  dw $F447                                  ; $1A84D6 | Giant Egg, for battle with Bowser
  dw $096E                                  ; $1A84D8 | Key
  dw $5B09                                  ; $1A84DA | Huffin' Puffin, running away
  dw $B71B                                  ; $1A84DC | Giant Egg, for battle with Prince Frogg
  dw $B77F                                  ; $1A84DE | Red Giant Egg
  dw $B77F                                  ; $1A84E0 | Green Giant Egg
  dw $1496                                  ; $1A84E2 | Lunge Fish
  dw $1040                                  ; $1A84E4 | Salvo the Slime
  dw $2D78                                  ; $1A84E6 | Salve the Slime's eyes
  dw $0000                                  ; $1A84E8 | Little Mouser's Nest
  dw $1608                                  ; $1A84EA | Little Mouser
  dw $0000                                  ; $1A84EC | Potted Spiked Fun Guy
  dw $1973                                  ; $1A84EE | Little Mouser, looking around, in nest
  dw $1608                                  ; $1A84F0 | Little Mouser, from nest
  dw $D6E2                                  ; $1A84F2 | Rogger the Potted Ghost
  dw $D6FB                                  ; $1A84F4 | Falling down Rogger the Potted Ghost?
  dw $0000                                  ; $1A84F6 | (BG3) Falling down wall
  dw $0000                                  ; $1A84F8 | Grim Leecher
  dw $0000                                  ; $1A84FA | Flame spat by Rogger the Potted Ghost
  dw $0000                                  ; $1A84FC | (BG3) Spinning wooden platform
  dw $AEBF                                  ; $1A84FE | 3 Mini-Ravens
  dw $AEBF                                  ; $1A8500 | Mini-Raven
  dw $702B                                  ; $1A8502 | Tap-Tap the Red Nose
  dw $0000                                  ; $1A8504 | (BG3) Seesaw
  dw $2ABC                                  ; $1A8506 | Skinny platform
  dw $0000                                  ; $1A8508 | Slime
  dw $F5AF                                  ; $1A850A | Baby Luigi
  dw $F6A9                                  ; $1A850C | Stork
  dw $0000                                  ; $1A850E | Vertical pipe entrance
  dw $E36C                                  ; $1A8510 | Red Giant Shy Guy
  dw $E36C                                  ; $1A8512 | Green Giant Shy Guy
  dw $EB19                                  ; $1A8514 | Prince Froggy, throat / before fight /
  dw $0000                                  ; $1A8516 | Burt the Bashful
  dw $D5DE                                  ; $1A8518 | Shy Guy for Rogger the Potted Ghost
  dw $E231                                  ; $1A851A | Kamek, for scenes before boss fights
  dw $0000                                  ; $1A851C | The head of fire of the Thunder Lakitu
  dw $B1E4                                  ; $1A851E | Fire of Thunder Lakitu
  dw $B1E4                                  ; $1A8520 | Hypocenter of the thunder.
  dw $5D11                                  ; $1A8522 | Upside down Blow Hard
  dw $1040                                  ; $1A8524 | unknown
  dw $9407                                  ; $1A8526 | Locked door
  dw $0000                                  ; $1A8528 | Middle ring
  dw $0000                                  ; $1A852A | (BG3) Board
  dw $0000                                  ; $1A852C | (BG3) Large log
  dw $1040                                  ; $1A852E | Balloon
  dw $E231                                  ; $1A8530 | Kamek, says \OH MY!!!\""
  dw $1FF4                                  ; $1A8532 | Upside down Wild Piranha
  dw $BCDE                                  ; $1A8534 | Green Pinwheel
  dw $BCDE                                  ; $1A8536 | Pink Pinwheel
  dw $F109                                  ; $1A8538 | (BG3) Sewer ghost with Flatbed Ferry on
  dw $2DD2                                  ; $1A853A | Green Solo Toady
  dw $0000                                  ; $1A853C | Continuous Super Star
  dw $F95B                                  ; $1A853E | Spark of Raphael the Raven.
  dw $247C                                  ; $1A8540 | Coin Bandit
  dw $2DD2                                  ; $1A8542 | Pink Toadie
  dw $0000                                  ; $1A8544 | [CRASH]
  dw $0000                                  ; $1A8546 | (BG3) Plank
  dw $0000                                  ; $1A8548 | (BG3) Plank
  dw $0000                                  ; $1A854A | Bomb
  dw $1B9E                                  ; $1A854C | Baby Mario
  dw $BD33                                  ; $1A854E | Goomba
  dw $5C3F                                  ; $1A8550 | Muddy Buddy
  dw $BCDE                                  ; $1A8552 | Pink Pinwheel, (X: direction) (Y: size)
  dw $0000                                  ; $1A8554 | Red coin
  dw $1FF4                                  ; $1A8556 | Wild Piranha
  dw $0000                                  ; $1A8558 | Hidden Winged Cloud, stars / seed / flo
  dw $2184                                  ; $1A855A | Flashing Egg Block
  dw $2184                                  ; $1A855C | Red Egg Block
  dw $2184                                  ; $1A855E | Yellow Egg Block
  dw $1040                                  ; $1A8560 | Hit green Egg Block
  dw $203A                                  ; $1A8562 | Large Spring Ball
  dw $1040                                  ; $1A8564 | Hootie the Blue Fish, clockwise
  dw $1040                                  ; $1A8566 | Hootie the Blue Fish, anticlockwise
  dw $203A                                  ; $1A8568 | Spring Ball
  dw $20B2                                  ; $1A856A | Clawdaddy
  dw $D502                                  ; $1A856C | Big Boo with 3 Boos / Big Boo / Big Boo
  dw $0000                                  ; $1A856E | Train Bandit
  dw $286E                                  ; $1A8570 | (BG3) Balloon Pumper with red balloon
  dw $0000                                  ; $1A8572 | Spike
  dw $1040                                  ; $1A8574 | Spiked ball
  dw $210C                                  ; $1A8576 | Piro Dangle, clockwise
  dw $210C                                  ; $1A8578 | Piro Dangle, anticlockwise
  dw $225B                                  ; $1A857A | Biting Bullet Bill Blaster
  dw $225B                                  ; $1A857C | Bouncing Bullet Bill Blaster
  dw $225B                                  ; $1A857E | Bullet Bill Blaster
  dw $1040                                  ; $1A8580 | Biting Bullet Bill
  dw $1040                                  ; $1A8582 | Bouncing Bullet Bill
  dw $F587                                  ; $1A8584 | Bullet Bill
  dw $0000                                  ; $1A8586 | Dent of castella
  dw $28B9                                  ; $1A8588 | Log seesaw
  dw $1040                                  ; $1A858A | Lava Bubble
  dw $1040                                  ; $1A858C | Lava Bubble, jumps across
  dw $2274                                  ; $1A858E | Chain Chomp
  dw $F40B                                  ; $1A8590 | Cloud
  dw $0000                                  ; $1A8592 | Teleport sprite
  dw $285A                                  ; $1A8594 | Harry Hedgehog
  dw $1040                                  ; $1A8596 | [CRASH]
  dw $0000                                  ; $1A8598 | Red Egg, gives 1-up
  dw $0000                                  ; $1A859A | Super Star
  dw $28AA                                  ; $1A859C | Red Flatbed Ferry, moving horizontally
  dw $28AA                                  ; $1A859E | Pink Flatbed Ferry, moving vertically
  dw $F59B                                  ; $1A85A0 | Mock Up, green / red
  dw $1040                                  ; $1A85A2 | Yoshi, at the Goal
  dw $0000                                  ; $1A85A4 | Fly Guy, 5 stars / red coin / 1-up / 1-
  dw $D0F2                                  ; $1A85A6 | Kamek, at Bowser's room
  dw $28B9                                  ; $1A85A8 | Swing of Grinders
  dw $DD22                                  ; $1A85AA | (BG3) Dangling Ghost
  dw $2E36                                  ; $1A85AC | 4 Toadies
  dw $2909                                  ; $1A85AE | Melon Bug
  dw $9407                                  ; $1A85B0 | Door
  dw $209E                                  ; $1A85B2 | Expansion Block
  dw $1040                                  ; $1A85B4 | Blue checkered block
  dw $1040                                  ; $1A85B6 | Red checkered block
  dw $209E                                  ; $1A85B8 | POW
  dw $209E                                  ; $1A85BA | Yoshi Block
  dw $0000                                  ; $1A85BC | Spiny Egg
  dw $2DB4                                  ; $1A85BE | Chained green Flatbed Ferry
  dw $0000                                  ; $1A85C0 | Mace Guy
  dw $1040                                  ; $1A85C2 | Mace
  dw $209E                                  ; $1A85C4 | !-switch
  dw $1040                                  ; $1A85C6 | Chomp Rock
  dw $1FF4                                  ; $1A85C8 | Wild Ptooie Piranha, spits 1 / 3 Needle
  dw $D386                                  ; $1A85CA | Tulip
  dw $0000                                  ; $1A85CC | Pot of Potted Spiked Fun Guy
  dw $B16C                                  ; $1A85CE | Fireball of Thunder Lakitu
  dw $247C                                  ; $1A85D0 | Bandit, getting under cover, left
  dw $247C                                  ; $1A85D2 | Bandit, getting under cover, right
  dw $D44E                                  ; $1A85D4 | Nep-Enut / Gargantua Blargg
  dw $233C                                  ; $1A85D6 | Incoming Chomp
  dw $2440                                  ; $1A85D8 | Flock of Incoming Chomps
  dw $233C                                  ; $1A85DA | Falling Incoming Chomp
  dw $23DC                                  ; $1A85DC | Shadow of falling Incoming Chomp
  dw $2472                                  ; $1A85DE | Shy Guy in background
  dw $0000                                  ; $1A85E0 | Fill Eggs
  dw $F9AB                                  ; $1A85E2 | Sign Arrow and Shadow
  dw $2184                                  ; $1A85E4 | Hint Block
  dw $AA9B                                  ; $1A85E6 | Hookbill the Koopa
  dw $4D58                                  ; $1A85E8 | Morph Bubble, Car
  dw $4D58                                  ; $1A85EA | Morph Bubble, Mole Tank
  dw $4D58                                  ; $1A85EC | Morph Bubble, Helicopter
  dw $4D58                                  ; $1A85EE | Morph Bubble, Train
  dw $0000                                  ; $1A85F0 | Wind of Fuzzy
  dw $4D58                                  ; $1A85F2 | Morph Bubble, Submarine
  dw $0000                                  ; $1A85F4 | Hidden Winged Cloud, 1-up / 5 stars / !
  dw $4D58                                  ; $1A85F6 | Winged Cloud, 8 coins
  dw $4D58                                  ; $1A85F8 | Winged Cloud, bubbled 1-up
  dw $4D58                                  ; $1A85FA | Winged Cloud, flower
  dw $4D58                                  ; $1A85FC | Winged Cloud, POW
  dw $4D58                                  ; $1A85FE | Winged Cloud, stairs, right / left
  dw $4D58                                  ; $1A8600 | Winged Cloud, platform, right / left
  dw $4D58                                  ; $1A8602 | Winged Cloud, Bandit
  dw $4D58                                  ; $1A8604 | Winged Cloud, coin (object)
  dw $4D58                                  ; $1A8606 | Winged Cloud, 1-up
  dw $4D58                                  ; $1A8608 | Winged Cloud, key
  dw $4D58                                  ; $1A860A | Winged Cloud, 3 stars
  dw $4D58                                  ; $1A860C | Winged Cloud, 5 stars
  dw $4D58                                  ; $1A860E | Winged Cloud, door
  dw $4D58                                  ; $1A8610 | Winged Cloud, ground eater
  dw $4D58                                  ; $1A8612 | Winged Cloud, watermelon
  dw $4D58                                  ; $1A8614 | Winged Cloud, fire watermelon
  dw $4D58                                  ; $1A8616 | Winged Cloud, icy watermelon
  dw $4D58                                  ; $1A8618 | Winged Cloud, seed of sunflower with 3
  dw $4D58                                  ; $1A861A | Winged Cloud, seed of sunflower with 6
  dw $4D58                                  ; $1A861C | Winged Cloud, [CRASH]
  dw $FB8B                                  ; $1A861E | Boss Door of Bowser's room
  dw $4D58                                  ; $1A8620 | Winged Cloud, random item.
  dw $4D58                                  ; $1A8622 | Winged Cloud, !-switch / !-switch
  dw $F875                                  ; $1A8624 | Baron Von Zeppelin, Giant Egg
  dw $F7C1                                  ; $1A8626 | Bowser's flame
  dw $CDBE                                  ; $1A8628 | Bowser's quake
  dw $0000                                  ; $1A862A | Horizontal entrance, towards right
  dw $0000                                  ; $1A862C | Hidden entrance, revealed by an ! switc
  dw $6FB3                                  ; $1A862E | Marching Milde
  dw $E434                                  ; $1A8630 | Giant Milde
  dw $EA8D                                  ; $1A8632 | Large Milde
  dw $F898                                  ; $1A8634 | Moutain backgrounds at fight with Hookb
  dw $F046                                  ; $1A8636 | (BG3) Ghost with Flatbed Ferry on its h
  dw $ECA9                                  ; $1A8638 | Sluggy the Unshaven
  dw $1040                                  ; $1A863A | Chomp signboard.
  dw $0000                                  ; $1A863C | Fishin' Lakitu
  dw $EDA8                                  ; $1A863E | Flower pot, key / 6 stars / 6 coins / n
  dw $0000                                  ; $1A8640 | (BG3) Soft thing
  dw $22D8                                  ; $1A8642 | Snowball
  dw $0000                                  ; $1A8644 | Closer, in Naval Piranha's room
  dw $0000                                  ; $1A8646 | Falling Rock
  dw $D3B8                                  ; $1A8648 | Piscatory Pete, Blue / Gold
  dw $0000                                  ; $1A864A | Preying Mantas
  dw $D3D6                                  ; $1A864C | Loch Nestor
  dw $4439                                  ; $1A864E | Boo Blah, normal / upside down
  dw $4439                                  ; $1A8650 | Boo Blah with Piro Dangle, normal / ups
  dw $4637                                  ; $1A8652 | Heading cactus
  dw $0000                                  ; $1A8654 | Green Needlenose
  dw $4682                                  ; $1A8656 | Gusty, left / right / infinite right /
  dw $46E6                                  ; $1A8658 | Burt, two / one
  dw $4844                                  ; $1A865A | Goonie, right / towards Yoshi / generat
  dw $4844                                  ; $1A865C | 3 Flightless Goonies
  dw $4B6E                                  ; $1A865E | Cloud Drop, moving vertically
  dw $4CB8                                  ; $1A8660 | Cloud Drop, moving horizontally
  dw $4E39                                  ; $1A8662 | Flamer Guy, jumping around
  dw $4E39                                  ; $1A8664 | Flamer Guy, walking around
  dw $50AF                                  ; $1A8666 | Eggo-Dil
  dw $1040                                  ; $1A8668 | Eggo-Dil's face
  dw $0000                                  ; $1A866A | Petal of Eggo-Dil
  dw $50CD                                  ; $1A866C | Bubble-Plant
  dw $5172                                  ; $1A866E | Stilt Guy, green / red / yellow / purpl
  dw $0000                                  ; $1A8670 | Woozy Guy, green / red / yellow / purpl
  dw $50CD                                  ; $1A8672 | Egg-Plant / Needlenose-Plant
  dw $56B3                                  ; $1A8674 | Slugger
  dw $59FB                                  ; $1A8676 | Parent and children of Huffin' Puffins
  dw $5B95                                  ; $1A8678 | Barney Bubble
  dw $5D11                                  ; $1A867A | Blow Hard
  dw $0000                                  ; $1A867C | Yellow Needlenose
  dw $1040                                  ; $1A867E | Flower
  dw $5E83                                  ; $1A8680 | Spear Guy, long spear
  dw $5F91                                  ; $1A8682 | Spear Guy, short spear
  dw $609F                                  ; $1A8684 | Zeus Guy
  dw $FA9B                                  ; $1A8686 | Energy of Zeus Guy
  dw $7C6F                                  ; $1A8688 | Poochy
  dw $5D4D                                  ; $1A868A | Bubbled 1-up
  dw $5E0B                                  ; $1A868C | Spiky mace
  dw $5E0B                                  ; $1A868E | Spiky mace, double-ended
  dw $5DD9                                  ; $1A8690 | Boo Guys spinning spiky mace
  dw $CDAA                                  ; $1A8692 | Jean de Fillet, right / left
  dw $66A3                                  ; $1A8694 | Boo Guys, carrying bombs towards left.
  dw $66A3                                  ; $1A8696 | Boo Guys, carrying bombs towards right
  dw $0000                                  ; $1A8698 | Seed of watermelon
  dw $6FB3                                  ; $1A869A | Milde
  dw $70C1                                  ; $1A869C | Tap-Tap
  dw $70C1                                  ; $1A869E | Tap-Tap, stays on ledges
  dw $70C1                                  ; $1A86A0 | Hopping Tap-tap
  dw $72FB                                  ; $1A86A2 | Chained spike ball, controlled by Boo G
  dw $7350                                  ; $1A86A4 | Boo Guy, rotating a pulley, right / lef
  dw $209E                                  ; $1A86A6 | Crate, 6 stars
  dw $7503                                  ; $1A86A8 | Boo Man Bluff
  dw $EBAF                                  ; $1A86AA | Flower
  dw $7661                                  ; $1A86AC | Georgette Jelly
  dw $0000                                  ; $1A86AE | Splashed Georgette Jelly
  dw $7A76                                  ; $1A86B0 | Snifit
  dw $7C65                                  ; $1A86B2 | Bullet, shot by Snifit
  dw $0000                                  ; $1A86B4 | Coin, gravity affected
  dw $7F08                                  ; $1A86B6 | Floating round platform on water
  dw $0000                                  ; $1A86B8 | Donut Lift
  dw $7F1C                                  ; $1A86BA | Giant Donut Lift
  dw $7F30                                  ; $1A86BC | Spooky
  dw $7FC6                                  ; $1A86BE | Green Glove
  dw $83E0                                  ; $1A86C0 | Lakitu, one / two
  dw $8570                                  ; $1A86C2 | Lakitu's cloud
  dw $0000                                  ; $1A86C4 | Spiny Egg
  dw $1040                                  ; $1A86C6 | Brown Arrow Wheel
  dw $1040                                  ; $1A86C8 | Blue Arrow Wheel
  dw $1040                                  ; $1A86CA | Double-ended arrow lift
  dw $0000                                  ; $1A86CC | Explosion of Number Platform
  dw $8D9F                                  ; $1A86CE | ? bucket, Bandit
  dw $8D9F                                  ; $1A86D0 | ? bucket, 5 coins
  dw $2062                                  ; $1A86D2 | Stretch, green / red / yellow / purple
  dw $E20E                                  ; $1A86D4 | Kamek, for the ending scene / flying an
  dw $8DB8                                  ; $1A86D6 | Spiked log held by chain and pulley
  dw $1040                                  ; $1A86D8 | ? Pulley
  dw $0000                                  ; $1A86DA | Ground shake
  dw $8DFE                                  ; $1A86DC | Fuzzy
  dw $9605                                  ; $1A86DE | Shy Guy, with Bandit hidden
  dw $8E85                                  ; $1A86E0 | Fat Guy, red / green
  dw $0000                                  ; $1A86E2 | Fly Guy carrying red coin / Whirly Fly
  dw $F172                                  ; $1A86E4 | Yoshi, in the intro scene
  dw $0000                                  ; $1A86E6 | unknown
  dw $9245                                  ; $1A86E8 | Lava Drop, moving horizontally
  dw $92DB                                  ; $1A86EA | Lava Drop, moving vertically
  dw $9407                                  ; $1A86EC | Locked door
  dw $950B                                  ; $1A86EE | Lemon Drop
  dw $956F                                  ; $1A86F0 | Lantern Ghost
  dw $0000                                  ; $1A86F2 | Baby Bowser
  dw $1040                                  ; $1A86F4 | Raven, always circling, anticlockwise /
  dw $1040                                  ; $1A86F6 | Raven, anticlockwise / clockwise initia
  dw $0000                                  ; $1A86F8 | 3x6 Falling Rock
  dw $0000                                  ; $1A86FA | 3x3 Falling Rock
  dw $0000                                  ; $1A86FC | 3x9 Falling Rock
  dw $0000                                  ; $1A86FE | 6x3 Falling Rock
  dw $0000                                  ; $1A8700 | Stomach Acid
  dw $1040                                  ; $1A8702 | Flipper, downwards
  dw $966E                                  ; $1A8704 | Fang, dangling
  dw $966E                                  ; $1A8706 | Fang, flying wavily
  dw $96B9                                  ; $1A8708 | Flopsy Fish, swimming around
  dw $96B9                                  ; $1A870A | Flopsy Fish, swimming and occasionally
  dw $96B9                                  ; $1A870C | Flopsy Fish, swimming and jumps in an a
  dw $96B9                                  ; $1A870E | Flopsy Fish, jumps 3 times in an arc, r
  dw $0000                                  ; $1A8710 | Spray Fish
  dw $1040                                  ; $1A8712 | Flipper, rightwards / leftwards
  dw $ED4E                                  ; $1A8714 | Blue Sluggy, falling down / crawing cei
  dw $ED4E                                  ; $1A8716 | Pink Sluggy, falling down / crawing cei
  dw $0000                                  ; $1A8718 | Horizontal entrance, towards left
  dw $203A                                  ; $1A871A | Large Spring Ball
  dw $9CB3                                  ; $1A871C | Arrow cloud, up
  dw $9C59                                  ; $1A871E | Arrow cloud, up right
  dw $9BFF                                  ; $1A8720 | Arrow cloud, right
  dw $9BA5                                  ; $1A8722 | Arrow cloud, down right
  dw $9B4B                                  ; $1A8724 | Arrow cloud, down
  dw $9AF1                                  ; $1A8726 | Arrow cloud, down left
  dw $9A97                                  ; $1A8728 | Arrow cloud, left
  dw $9A3D                                  ; $1A872A | Arrow cloud, up left
  dw $9A3D                                  ; $1A872C | Arrow cloud, rotating
  dw $9DC1                                  ; $1A872E | Flutter
  dw $4844                                  ; $1A8730 | Goonie with Shy Guy
  dw $9F47                                  ; $1A8732 | Shark Chomp
  dw $9F7E                                  ; $1A8734 | Very Goonie
  dw $1040                                  ; $1A8736 | Cactus Jack, one / three
  dw $9FE2                                  ; $1A8738 | Wall Lakitu
  dw $9F7E                                  ; $1A873A | Bowling Goonie
  dw $A0E1                                  ; $1A873C | Grunt, walking
  dw $A0E1                                  ; $1A873E | Grunt, running
  dw $A39D                                  ; $1A8740 | Dancing Spear Guy
  dw $0000                                  ; $1A8742 | Green switch for green spiked platform
  dw $0000                                  ; $1A8744 | Red switch for red spiked platform
  dw $BCDE                                  ; $1A8746 | Pink Pinwheel with Shy Guys, clockwise
  dw $A9E2                                  ; $1A8748 | Green spiked platform
  dw $A9E2                                  ; $1A874A | Red spiked platform
  dw $0000                                  ; $1A874C | Bonus Item, red coin / key / flower / d
  dw $A9E2                                  ; $1A874E | Two spiked platforms with one switch in
  dw $0000                                  ; $1A8750 | Bouncing green Needlenose
  dw $B53B                                  ; $1A8752 | Nipper Plant
  dw $B53B                                  ; $1A8754 | Nipper Spore
  dw $B41E                                  ; $1A8756 | Thunder Lakitu, one / two
  dw $0000                                  ; $1A8758 | Green Koopa shell
  dw $0000                                  ; $1A875A | Red Koopa shell
  dw $AA9B                                  ; $1A875C | Green Beach Koopa
  dw $AA9B                                  ; $1A875E | Red Beach Koopa
  dw $AA9B                                  ; $1A8760 | Green Koopa
  dw $AA9B                                  ; $1A8762 | Red Koopa
  dw $AC99                                  ; $1A8764 | Green Para Koopa, jumping forth.
  dw $AC99                                  ; $1A8766 | Red Para Koopa, flying horizontally
  dw $AC99                                  ; $1A8768 | Red Para Koopa, flying vertically
  dw $AFF0                                  ; $1A876A | Aqua Lakitu
  dw $B4D2                                  ; $1A876C | Naval Piranha
  dw $0000                                  ; $1A876E | Naval Bud
  dw $B5B3                                  ; $1A8770 | Baron Von Zeppelin, red Suy Guy
  dw $B5D1                                  ; $1A8772 | Baron Von Zeppelin, Needlenose
  dw $B5E5                                  ; $1A8774 | Baron Von Zeppelin, bomb
  dw $B5F9                                  ; $1A8776 | Baron Von Zeppelin, Bandit
  dw $B621                                  ; $1A8778 | Baron Von Zeppelin, large Spring Ball
  dw $B644                                  ; $1A877A | Baron Von Zeppelin, 1-up
  dw $B667                                  ; $1A877C | Baron Von Zeppelin, key
  dw $B67B                                  ; $1A877E | Baron Von Zeppelin, 5 coins
  dw $B68F                                  ; $1A8780 | Baron Von Zeppelin, watermelon
  dw $B6A3                                  ; $1A8782 | Baron Von Zeppelin, fire watermelon
  dw $B6B7                                  ; $1A8784 | Baron Von Zeppelin, icy watermelon
  dw $B6CB                                  ; $1A8786 | Baron Von Zeppelin, crate, 6 stars.
  dw $B70C                                  ; $1A8788 | Baron Von Zeppelin
  dw $1040                                  ; $1A878A | Spinning Log
  dw $B7E3                                  ; $1A878C | Crazee Dayzee
  dw $0000                                  ; $1A878E | Dragonfly
  dw $0000                                  ; $1A8790 | Butterfly
  dw $BA72                                  ; $1A8792 | Bumpty
  dw $28AA                                  ; $1A8794 | Active line guided green Flatbed Ferry,
  dw $28AA                                  ; $1A8796 | Active line guided green Flatbed Ferry,
  dw $28AA                                  ; $1A8798 | Active line guided yellow Flatbed Ferry
  dw $28AA                                  ; $1A879A | Active line guided yellow Flatbed Ferry
  dw $28AA                                  ; $1A879C | Line guided green Flatbed Ferry, left
  dw $28AA                                  ; $1A879E | Line guided green Flatbed Ferry, right
  dw $28AA                                  ; $1A87A0 | Line guided yellow Flatbed Ferry, left
  dw $28AA                                  ; $1A87A2 | Line guided yellow Flatbed Ferry, right
  dw $28AA                                  ; $1A87A4 | Line guided red Flatbed Ferry, left
  dw $28AA                                  ; $1A87A6 | Line guided red Flatbed Ferry, right
  dw $1040                                  ; $1A87A8 | Whirling lift
  dw $BBC1                                  ; $1A87AA | Falling icicle
  dw $BF31                                  ; $1A87AC | Sparrow
  dw $BBFD                                  ; $1A87AE | Muti Guy, green / red / yellow / purple
  dw $DD22                                  ; $1A87B0 | Caged Ghost, squeezing in sewer
  dw $C08A                                  ; $1A87B2 | Blargg
  dw $BF95                                  ; $1A87B4 | unknown
  dw $BF45                                  ; $1A87B6 | Unbalanced snowy platform
  dw $BFA9                                  ; $1A87B8 | Arrow sign, up / right / left / down
  dw $BFA9                                  ; $1A87BA | Diagonal arrow sign, up left / up right
  dw $BFD6                                  ; $1A87BC | Dizzy Dandy
  dw $BFEA                                  ; $1A87BE | Boo Guy
  dw $BA72                                  ; $1A87C0 | Bumpty, tackles at Yoshi
  dw $BB44                                  ; $1A87C2 | Flying Bumpty, flying aronnd / flying s
  dw $C1F2                                  ; $1A87C4 | Skeleton Goonie
  dw $C35A                                  ; $1A87C6 | Flightless Skeleton Goonie
  dw $C396                                  ; $1A87C8 | Skeleton Goonie with a bomb
  dw $0000                                  ; $1A87CA | Firebar, double-ended, clockwise / anti
  dw $0000                                  ; $1A87CC | Firebar, clockwise / anticlockwise
  dw $C4FE                                  ; $1A87CE | Star
  dw $C558                                  ; $1A87D0 | Little Skull Mouser
  dw $CD8C                                  ; $1A87D2 | Cork, seals 3D pipe
  dw $C5F8                                  ; $1A87D4 | Grinder, runs away
  dw $C5F8                                  ; $1A87D6 | Grinder, spits seeds of watermelon
  dw $C5F8                                  ; $1A87D8 | Short Fuse / Seedy Sally, right / left
  dw $C5F8                                  ; $1A87DA | Grinder, grasps Baby Mario
  dw $C5F8                                  ; $1A87DC | Grinder, climbing, spits seeds of water
  dw $0000                                  ; $1A87DE | Hot Lips
  dw $D016                                  ; $1A87E0 | Boo Balloon, coin / !-switch
  dw $D0D4                                  ; $1A87E2 | Frog
  dw $D0F2                                  ; $1A87E4 | Kamek, shoots magic at Yoshi.
  dw $D2D2                                  ; $1A87E6 | Kamek's magic
  dw $0000                                  ; $1A87E8 | Coin
  dw $0000                                  ; $1A87EA | (BG3) Balloon
  dw $672F                                  ; $1A87EC | Coin Cannon for Mini Battle
  dw $0000                                  ; $1A87EE | Coin for Mini Battle
  dw $247C                                  ; $1A87F0 | Bandit for Mini Battle
  dw $6775                                  ; $1A87F2 | Checkered Platform for Mini Battle
  dw $247C                                  ; $1A87F4 | Bandit for Mini Battle
  dw $677F                                  ; $1A87F6 | Red Balloon for Mini Battle
  dw $6793                                  ; $1A87F8 | Bandit for Mini Battle
  dw $0000                                  ; $1A87FA | Watermelon Pot for Mini Battle
  dw $6793                                  ; $1A87FC | possibly Bandit for Mini Battle

; ambient sprites
  dw $0B04                                  ; $1A87FE |
  dw $0000                                  ; $1A8800 |
  dw $0000                                  ; $1A8802 |
  dw $0000                                  ; $1A8804 |
  dw $0B72                                  ; $1A8806 |
  dw $0BEA                                  ; $1A8808 |
  dw $0DDE                                  ; $1A880A |
  dw $0DF2                                  ; $1A880C |
  dw $0E10                                  ; $1A880E |
  dw $2E81                                  ; $1A8810 |
  dw $0FF0                                  ; $1A8812 |
  dw $1054                                  ; $1A8814 |
  dw $0000                                  ; $1A8816 |
  dw $0000                                  ; $1A8818 |
  dw $0000                                  ; $1A881A |
  dw $0000                                  ; $1A881C |
  dw $0000                                  ; $1A881E |
  dw $11C6                                  ; $1A8820 |
  dw $1112                                  ; $1A8822 |
  dw $12B6                                  ; $1A8824 |
  dw $0000                                  ; $1A8826 |
  dw $0000                                  ; $1A8828 |
  dw $152C                                  ; $1A882A |
  dw $0000                                  ; $1A882C |
  dw $9493                                  ; $1A882E |
  dw $2FA8                                  ; $1A8830 |
  dw $19FA                                  ; $1A8832 |
  dw $21AC                                  ; $1A8834 |
  dw $0000                                  ; $1A8836 |
  dw $0000                                  ; $1A8838 |
  dw $0000                                  ; $1A883A |
  dw $0000                                  ; $1A883C |
  dw $0000                                  ; $1A883E |
  dw $55D7                                  ; $1A8840 |
  dw $2945                                  ; $1A8842 |
  dw $0000                                  ; $1A8844 |
  dw $0000                                  ; $1A8846 |
  dw $0000                                  ; $1A8848 |
  dw $2A71                                  ; $1A884A |
  dw $2AE4                                  ; $1A884C |
  dw $2F94                                  ; $1A884E |
  dw $2FBC                                  ; $1A8850 |
  dw $4335                                  ; $1A8852 |
  dw $0000                                  ; $1A8854 |
  dw $4704                                  ; $1A8856 |
  dw $4704                                  ; $1A8858 |
  dw $5663                                  ; $1A885A |
  dw $5C2B                                  ; $1A885C |
  dw $6095                                  ; $1A885E |
  dw $6081                                  ; $1A8860 |
  dw $0000                                  ; $1A8862 |
  dw $6B67                                  ; $1A8864 |
  dw $6D97                                  ; $1A8866 |
  dw $7283                                  ; $1A8868 |
  dw $0000                                  ; $1A886A |
  dw $748B                                  ; $1A886C |
  dw $0000                                  ; $1A886E |
  dw $0000                                  ; $1A8870 |
  dw $78B4                                  ; $1A8872 |
  dw $7BA2                                  ; $1A8874 |
  dw $7BB1                                  ; $1A8876 |
  dw $7EE5                                  ; $1A8878 |
  dw $0000                                  ; $1A887A |
  dw $8584                                  ; $1A887C |
  dw $0000                                  ; $1A887E |
  dw $0000                                  ; $1A8880 |
  dw $0000                                  ; $1A8882 |
  dw $987B                                  ; $1A8884 |
  dw $996B                                  ; $1A8886 |
  dw $0000                                  ; $1A8888 |
  dw $0000                                  ; $1A888A |
  dw $9D0D                                  ; $1A888C |
  dw $0000                                  ; $1A888E |
  dw $0000                                  ; $1A8890 |
  dw $9F1F                                  ; $1A8892 |
  dw $0000                                  ; $1A8894 |
  dw $0000                                  ; $1A8896 |
  dw $0000                                  ; $1A8898 |
  dw $A5F0                                  ; $1A889A |
  dw $A988                                  ; $1A889C |
  dw $AA37                                  ; $1A889E |
  dw $0000                                  ; $1A88A0 |
  dw $0000                                  ; $1A88A2 |
  dw $B16C                                  ; $1A88A4 |
  dw $0E10                                  ; $1A88A6 |
  dw $B16C                                  ; $1A88A8 |
  dw $0000                                  ; $1A88AA |
  dw $0000                                  ; $1A88AC |
  dw $0000                                  ; $1A88AE |
  dw $B8DD                                  ; $1A88B0 |
  dw $0000                                  ; $1A88B2 |
  dw $0000                                  ; $1A88B4 |
  dw $0000                                  ; $1A88B6 |
  dw $0000                                  ; $1A88B8 |
  dw $0000                                  ; $1A88BA |
  dw $0000                                  ; $1A88BC |
  dw $CC42                                  ; $1A88BE |
  dw $0000                                  ; $1A88C0 |
  dw $CE22                                  ; $1A88C2 |
  dw $CF4E                                  ; $1A88C4 |
  dw $9F33                                  ; $1A88C6 |
  dw $D05C                                  ; $1A88C8 |
  dw $D552                                  ; $1A88CA |
  dw $EB37                                  ; $1A88CC |
  dw $EEB6                                  ; $1A88CE |
  dw $0000                                  ; $1A88D0 |
  dw $EFF6                                  ; $1A88D2 |
  dw $0B04                                  ; $1A88D4 |
  dw $0000                                  ; $1A88D6 |
  dw $0000                                  ; $1A88D8 |
  dw $FA9B                                  ; $1A88DA |
  dw $0000                                  ; $1A88DC |
  dw $8638                                  ; $1A88DE |
  dw $8700                                  ; $1A88E0 |
  dw $8877                                  ; $1A88E2 |
  dw $88EF                                  ; $1A88E4 |
  dw $8BBF                                  ; $1A88E6 |
  dw $2FD0                                  ; $1A88E8 |
  dw $2FD0                                  ; $1A88EA |
  dw $30E3                                  ; $1A88EC |
  dw $313D                                  ; $1A88EE |
  dw $36DD                                  ; $1A88F0 |
  dw $3719                                  ; $1A88F2 |
  dw $0000                                  ; $1A88F4 |
  dw $372D                                  ; $1A88F6 |
  dw $377D                                  ; $1A88F8 |
  dw $0000                                  ; $1A88FA |
  dw $372D                                  ; $1A88FC |
  dw $381D                                  ; $1A88FE |
  dw $3845                                  ; $1A8900 |
  dw $0000                                  ; $1A8902 |
  dw $3E35                                  ; $1A8904 |
  dw $3E49                                  ; $1A8906 |
  dw $3E71                                  ; $1A8908 |
  dw $3F39                                  ; $1A890A |
  dw $40C9                                  ; $1A890C |
  dw $4119                                  ; $1A890E |
  dw $4155                                  ; $1A8910 |
  dw $40C9                                  ; $1A8912 |

; hardcoded data for animation frame high byte == $01
; pointer, drawing method 00 word (see below for format)
  dw $0916, $0200                           ; $1A8914 |

; hardcoded data for animation frame high byte > $01
; see drawing method 01 table for format
  db $F8, $F8, $00, $00, $02                ; $1A8918 |
  db $08, $F8, $00, $00, $02                ; $1A891D |
  db $F8, $08, $00, $00, $02                ; $1A8922 |
  db $08, $08, $00, $00, $02                ; $1A8927 |

; drawing method 00 OAM information tables
; one word per sprite per animation frame
; format of the words:
; high byte: yxpp--st: y/x = flip, p=priority, s=size, t=msb tile
; note: the size bit here is packed into this byte versus
; being its own separate byte like in other OAM tables
; this is because palette is unneeded here
; low byte: VRAM tile number
  dw $02C8, $0268                           ; $1A892C |
  dw $02CA, $02CC                           ; $1A8930 |
  dw $02EA, $02CC                           ; $1A8934 |
  dw $0226, $0224                           ; $1A8938 |
  dw $0222, $0220                           ; $1A893C |
  dw $0268, $0208                           ; $1A8940 |
  dw $03D9, $0268                           ; $1A8944 |
  dw $020C, $0200                           ; $1A8948 |
  dw $0220, $0222                           ; $1A894C |
  dw $0224, $0226                           ; $1A8950 |
  dw $02A6, $02A4                           ; $1A8954 |
  dw $02A2, $0246                           ; $1A8958 |
  dw $00F9, $02E3                           ; $1A895C |
  dw $02E5, $02E7                           ; $1A8960 |
  dw $0282, $0280                           ; $1A8964 |
  dw $0284, $0246                           ; $1A8968 |
  dw $0284, $02EE                           ; $1A896C |
  dw $0208, $020A                           ; $1A8970 |
  dw $020A, $020C                           ; $1A8974 |
  dw $020A, $020E                           ; $1A8978 |
  dw $001F, $001E                           ; $1A897C |
  dw $000F, $000E                           ; $1A8980 |
  dw $0246, $024B                           ; $1A8984 |
  dw $02CA, $02CC                           ; $1A8988 |
  dw $02EA, $03C0                           ; $1A898C |
  dw $0208, $020A                           ; $1A8990 |
  dw $020C, $420C                           ; $1A8994 |
  dw $020E, $420E                           ; $1A8998 |
  dw $0200, $0202                           ; $1A899C |
  dw $0204, $0206                           ; $1A89A0 |
  dw $0208, $020A                           ; $1A89A4 |
  dw $02C0, $0262                           ; $1A89A8 |
  dw $02EC, $020E                           ; $1A89AC |
  dw $020C, $028A                           ; $1A89B0 |
  dw $0208, $028A                           ; $1A89B4 |
  dw $00BC, $000C                           ; $1A89B8 |
  dw $000B, $001C                           ; $1A89BC |
  dw $0208, $020E                           ; $1A89C0 |
  dw $020E, $020A                           ; $1A89C4 |
  dw $020C, $000B                           ; $1A89C8 |
  dw $020C, $020E                           ; $1A89CC |
  dw $420E, $420C                           ; $1A89D0 |
  dw $022C, $028A                           ; $1A89D4 |
  dw $0002, $0012                           ; $1A89D8 |
  dw $0003, $0013                           ; $1A89DC |
  dw $0010, $0011                           ; $1A89E0 |
  dw $02C0, $0200                           ; $1A89E4 |
  dw $0206, $0206                           ; $1A89E8 |
  dw $0204, $0202                           ; $1A89EC |
  dw $0200, $0226                           ; $1A89F0 |
  dw $022E, $022E                           ; $1A89F4 |
  dw $0200, $0202                           ; $1A89F8 |
  dw $0204, $0206                           ; $1A89FC |
  dw $02A0, $025C                           ; $1A8A00 |
  dw $0260, $425C                           ; $1A8A04 |
  dw $020E, $024E                           ; $1A8A08 |
  dw $020D, $824E                           ; $1A8A0C |
  dw $420D, $000F                           ; $1A8A10 |
  dw $001F, $800F                           ; $1A8A14 |
  dw $401F, $020C                           ; $1A8A18 |
  dw $020E, $420E                           ; $1A8A1C |
  dw $420C, $02E0                           ; $1A8A20 |
  dw $00F9, $00E9                           ; $1A8A24 |
  dw $02E3, $02E5                           ; $1A8A28 |
  dw $02E7, $02E7                           ; $1A8A2C |
  dw $0059, $02E5                           ; $1A8A30 |
  dw $0058, $02E3                           ; $1A8A34 |
  dw $00E2, $0200                           ; $1A8A38 |
  dw $0202, $00E1                           ; $1A8A3C |
  dw $00F1, $0054                           ; $1A8A40 |
  dw $00F9, $0059                           ; $1A8A44 |
  dw $0200, $0220                           ; $1A8A48 |
  dw $000C, $001C                           ; $1A8A4C |
  dw $00AE, $00BE                           ; $1A8A50 |
  dw $00AF, $00BF                           ; $1A8A54 |
  dw $0047, $0058                           ; $1A8A58 |
  dw $0059, $00F7                           ; $1A8A5C |
  dw $00E1, $02E3                           ; $1A8A60 |
  dw $02E5, $02E7                           ; $1A8A64 |
  dw $0055, $0045                           ; $1A8A68 |
  dw $0054, $0044                           ; $1A8A6C |
  dw $0055, $0045                           ; $1A8A70 |
  dw $0054, $0044                           ; $1A8A74 |
  dw $00E1, $00E2                           ; $1A8A78 |
  dw $0058, $00F1                           ; $1A8A7C |
  dw $00E1, $02E5                           ; $1A8A80 |
  dw $02E3, $0002                           ; $1A8A84 |
  dw $0011, $0010                           ; $1A8A88 |
  dw $0001, $0000                           ; $1A8A8C |
  dw $1054, $03C0                           ; $1A8A90 |
  dw $0006, $001C                           ; $1A8A94 |
  dw $000C, $001F                           ; $1A8A98 |
  dw $000F, $001E                           ; $1A8A9C |
  dw $001D, $001F                           ; $1A8AA0 |
  dw $000F, $000E                           ; $1A8AA4 |
  dw $000D, $0044                           ; $1A8AA8 |
  dw $0000, $420C                           ; $1A8AAC |
  dw $420E, $C20C                           ; $1A8AB0 |
  dw $820A, $820C                           ; $1A8AB4 |
  dw $020E, $020C                           ; $1A8AB8 |
  dw $020A, $001F                           ; $1A8ABC |
  dw $00E1, $00F1                           ; $1A8AC0 |
  dw $00F0, $00E2                           ; $1A8AC4 |
  dw $00F0, $00F1                           ; $1A8AC8 |
  dw $00E1, $001C                           ; $1A8ACC |
  dw $000D, $000C                           ; $1A8AD0 |
  dw $001D, $000E                           ; $1A8AD4 |
  dw $001E, $03A4                           ; $1A8AD8 |
  dw $03C2, $03E0                           ; $1A8ADC |
  dw $03E2, $4009                           ; $1A8AE0 |
  dw $4019, $0019                           ; $1A8AE4 |
  dw $0009, $0200                           ; $1A8AE8 |
  dw $0012, $000C                           ; $1A8AEC |
  dw $001C, $001B                           ; $1A8AF0 |
  dw $020C, $020E                           ; $1A8AF4 |
  dw $00BC, $03CE                           ; $1A8AF8 |
  dw $0290, $03CC                           ; $1A8AFC |
  dw $0220, $0222                           ; $1A8B00 |

; drawing method 01 & 03 OAM tables
; for each sprite, each animation frame,
; and for each OAM entry:
; 5 byte format:
; bytes 1 & 2: OAM x & y drawing offsets
; bytes 3 & 4: VRAM tile number
; byte 5: size (00 or 02)
  db $FB, $00, $E0, $00, $02                ; $1A8B04 |
  db $05, $00, $E0, $40, $02                ; $1A8B09 |
  db $FA, $FE, $E0, $00, $02                ; $1A8B0E |
  db $06, $FE, $E0, $40, $02                ; $1A8B13 |
  db $F9, $FD, $E0, $00, $02                ; $1A8B18 |
  db $07, $FD, $E0, $40, $02                ; $1A8B1D |
  db $F8, $FD, $E0, $00, $02                ; $1A8B22 |
  db $08, $FD, $E0, $40, $02                ; $1A8B27 |
  db $F7, $FE, $E0, $00, $02                ; $1A8B2C |
  db $09, $FE, $E0, $40, $02                ; $1A8B31 |
  db $F6, $00, $E0, $00, $02                ; $1A8B36 |
  db $0A, $00, $E0, $40, $02                ; $1A8B3B |
  db $F5, $03, $E0, $00, $02                ; $1A8B40 |
  db $0B, $03, $E0, $40, $02                ; $1A8B45 |
  db $04, $09, $F2, $00, $00                ; $1A8B4A |
  db $04, $09, $F2, $00, $00                ; $1A8B4F |
  db $04, $06, $F2, $00, $00                ; $1A8B54 |
  db $04, $06, $F2, $00, $00                ; $1A8B59 |
  db $04, $04, $F2, $00, $00                ; $1A8B5E |
  db $04, $04, $F2, $00, $00                ; $1A8B63 |
  db $04, $03, $F2, $00, $00                ; $1A8B68 |
  db $04, $03, $F2, $00, $00                ; $1A8B6D |
  db $02, $02, $55, $00, $00                ; $1A8B72 |
  db $06, $02, $55, $00, $00                ; $1A8B77 |
  db $02, $06, $55, $00, $00                ; $1A8B7C |
  db $06, $06, $55, $00, $00                ; $1A8B81 |
  db $01, $01, $55, $00, $00                ; $1A8B86 |
  db $07, $01, $55, $00, $00                ; $1A8B8B |
  db $01, $07, $55, $00, $00                ; $1A8B90 |
  db $07, $07, $55, $00, $00                ; $1A8B95 |
  db $00, $00, $55, $00, $00                ; $1A8B9A |
  db $08, $00, $55, $00, $00                ; $1A8B9F |
  db $00, $08, $55, $00, $00                ; $1A8BA4 |
  db $08, $08, $55, $00, $00                ; $1A8BA9 |
  db $FF, $FF, $45, $00, $00                ; $1A8BAE |
  db $09, $FF, $45, $00, $00                ; $1A8BB3 |
  db $FF, $09, $45, $00, $00                ; $1A8BB8 |
  db $09, $09, $45, $00, $00                ; $1A8BBD |
  db $FE, $FE, $54, $00, $00                ; $1A8BC2 |
  db $0A, $FE, $54, $00, $00                ; $1A8BC7 |
  db $FE, $0A, $54, $00, $00                ; $1A8BCC |
  db $0A, $0A, $54, $00, $00                ; $1A8BD1 |
  db $FD, $FD, $44, $00, $00                ; $1A8BD6 |
  db $0B, $FD, $44, $00, $00                ; $1A8BDB |
  db $FD, $0B, $44, $00, $00                ; $1A8BE0 |
  db $0B, $0B, $44, $00, $00                ; $1A8BE5 |
  db $FF, $00, $49, $02, $00                ; $1A8BEA |
  db $01, $00, $6E, $02, $00                ; $1A8BEF |
  db $09, $00, $6F, $02, $00                ; $1A8BF4 |
  db $09, $00, $6F, $02, $00                ; $1A8BF9 |
  db $FF, $00, $4A, $02, $00                ; $1A8BFE |
  db $02, $00, $6E, $02, $00                ; $1A8C03 |
  db $0A, $00, $6F, $02, $00                ; $1A8C08 |
  db $0A, $00, $6F, $02, $00                ; $1A8C0D |
  db $FF, $00, $4B, $02, $00                ; $1A8C12 |
  db $02, $00, $6E, $02, $00                ; $1A8C17 |
  db $0A, $00, $6F, $02, $00                ; $1A8C1C |
  db $0A, $00, $6F, $02, $00                ; $1A8C21 |
  db $00, $00, $5F, $04, $00                ; $1A8C26 |
  db $08, $00, $49, $04, $00                ; $1A8C2B |
  db $00, $00, $5F, $04, $00                ; $1A8C30 |
  db $08, $00, $49, $04, $00                ; $1A8C35 |
  db $00, $F8, $03, $00, $00                ; $1A8C3A |
  db $00, $08, $0F, $04, $00                ; $1A8C3F |
  db $00, $F8, $03, $00, $00                ; $1A8C44 |
  db $F8, $00, $00, $00, $02                ; $1A8C49 |
  db $00, $00, $01, $00, $02                ; $1A8C4E |
  db $04, $0C, $0F, $04, $00                ; $1A8C53 |
  db $00, $F6, $03, $00, $00                ; $1A8C58 |
  db $FD, $07, $0E, $04, $00                ; $1A8C5D |
  db $00, $F6, $03, $00, $00                ; $1A8C62 |
  db $F8, $FE, $00, $00, $02                ; $1A8C67 |
  db $00, $FE, $01, $00, $02                ; $1A8C6C |
  db $09, $0C, $1E, $04, $00                ; $1A8C71 |
  db $00, $F7, $03, $00, $00                ; $1A8C76 |
  db $0B, $0C, $1E, $04, $00                ; $1A8C7B |
  db $00, $F7, $03, $00, $00                ; $1A8C80 |
  db $F8, $FF, $00, $00, $02                ; $1A8C85 |
  db $00, $FF, $01, $00, $02                ; $1A8C8A |
  db $FC, $07, $04, $04, $00                ; $1A8C8F |
  db $00, $F8, $03, $00, $00                ; $1A8C94 |
  db $0C, $0C, $1E, $04, $00                ; $1A8C99 |
  db $00, $F8, $03, $00, $00                ; $1A8C9E |
  db $F8, $00, $00, $00, $02                ; $1A8CA3 |
  db $00, $00, $01, $00, $02                ; $1A8CA8 |
  db $FB, $06, $04, $04, $00                ; $1A8CAD |
  db $00, $F9, $03, $00, $00                ; $1A8CB2 |
  db $0C, $0C, $1F, $04, $00                ; $1A8CB7 |
  db $00, $F9, $03, $00, $00                ; $1A8CBC |
  db $F8, $01, $00, $00, $02                ; $1A8CC1 |
  db $00, $01, $01, $00, $02                ; $1A8CC6 |
  db $FA, $0B, $0E, $04, $00                ; $1A8CCB |
  db $00, $FC, $03, $00, $00                ; $1A8CD0 |
  db $0D, $0C, $1F, $04, $00                ; $1A8CD5 |
  db $00, $FC, $03, $00, $00                ; $1A8CDA |
  db $F8, $04, $00, $00, $02                ; $1A8CDF |
  db $00, $04, $01, $00, $02                ; $1A8CE4 |
  db $FA, $0C, $0F, $04, $00                ; $1A8CE9 |
  db $00, $FA, $03, $00, $00                ; $1A8CEE |
  db $09, $0B, $1F, $04, $00                ; $1A8CF3 |
  db $00, $FA, $03, $00, $00                ; $1A8CF8 |
  db $F8, $02, $00, $00, $02                ; $1A8CFD |
  db $00, $02, $01, $00, $02                ; $1A8D02 |
  db $FE, $0C, $0F, $04, $00                ; $1A8D07 |
  db $00, $F9, $03, $00, $00                ; $1A8D0C |
  db $05, $0B, $1E, $04, $00                ; $1A8D11 |
  db $00, $F9, $03, $00, $00                ; $1A8D16 |
  db $F8, $01, $00, $00, $02                ; $1A8D1B |
  db $00, $01, $01, $00, $02                ; $1A8D20 |
  db $02, $0C, $0F, $04, $00                ; $1A8D25 |
  db $00, $F9, $03, $00, $00                ; $1A8D2A |
  db $02, $0C, $0F, $04, $00                ; $1A8D2F |
  db $00, $F9, $03, $00, $00                ; $1A8D34 |
  db $F8, $01, $00, $00, $02                ; $1A8D39 |
  db $00, $01, $01, $00, $02                ; $1A8D3E |
  db $00, $0C, $0F, $04, $00                ; $1A8D43 |
  db $09, $FA, $14, $00, $00                ; $1A8D48 |
  db $02, $0C, $0F, $04, $00                ; $1A8D4D |
  db $01, $FA, $13, $00, $00                ; $1A8D52 |
  db $F9, $02, $05, $00, $02                ; $1A8D57 |
  db $01, $02, $06, $00, $02                ; $1A8D5C |
  db $00, $0C, $0F, $04, $00                ; $1A8D61 |
  db $FF, $F8, $0B, $00, $00                ; $1A8D66 |
  db $F7, $F8, $0A, $00, $00                ; $1A8D6B |
  db $02, $0C, $0F, $04, $00                ; $1A8D70 |
  db $F7, $F8, $0A, $00, $02                ; $1A8D75 |
  db $FF, $00, $08, $00, $02                ; $1A8D7A |
  db $00, $0C, $0F, $04, $00                ; $1A8D7F |
  db $FD, $F6, $0B, $00, $00                ; $1A8D84 |
  db $F5, $F6, $0A, $00, $00                ; $1A8D89 |
  db $02, $0C, $0F, $04, $00                ; $1A8D8E |
  db $F5, $F6, $0A, $00, $02                ; $1A8D93 |
  db $FF, $00, $08, $00, $02                ; $1A8D98 |
  db $00, $0C, $0F, $04, $00                ; $1A8D9D |
  db $09, $FB, $14, $00, $00                ; $1A8DA2 |
  db $02, $0C, $0F, $04, $00                ; $1A8DA7 |
  db $01, $FB, $13, $00, $00                ; $1A8DAC |
  db $F9, $03, $05, $00, $02                ; $1A8DB1 |
  db $01, $03, $06, $00, $02                ; $1A8DB6 |
  db $00, $0C, $0F, $04, $00                ; $1A8DBB |
  db $08, $FE, $14, $00, $00                ; $1A8DC0 |
  db $02, $0C, $0F, $04, $00                ; $1A8DC5 |
  db $00, $FE, $13, $00, $00                ; $1A8DCA |
  db $F8, $05, $05, $00, $02                ; $1A8DCF |
  db $02, $04, $0C, $00, $02                ; $1A8DD4 |
  db $00, $0C, $0F, $04, $00                ; $1A8DD9 |
  db $F8, $F8, $6A, $00, $02                ; $1A8DDE |
  db $08, $F8, $6A, $40, $02                ; $1A8DE3 |
  db $F8, $08, $6A, $80, $02                ; $1A8DE8 |
  db $08, $08, $6A, $C0, $02                ; $1A8DED |
  db $00, $FE, $59, $00, $00                ; $1A8DF2 |
  db $07, $FE, $59, $00, $00                ; $1A8DF7 |
  db $00, $FE, $58, $00, $00                ; $1A8DFC |
  db $07, $FE, $58, $00, $00                ; $1A8E01 |
  db $00, $FE, $E2, $00, $00                ; $1A8E06 |
  db $07, $FE, $E2, $00, $00                ; $1A8E0B |
  db $07, $F4, $E1, $00, $00                ; $1A8E10 |
  db $F9, $FC, $F1, $00, $00                ; $1A8E15 |
  db $00, $00, $40, $00, $02                ; $1A8E1A |
  db $F2, $02, $E2, $00, $00                ; $1A8E1F |
  db $E5, $06, $E1, $00, $00                ; $1A8E24 |
  db $0C, $0A, $E2, $00, $00                ; $1A8E29 |
  db $E9, $0D, $F1, $00, $00                ; $1A8E2E |
  db $F0, $10, $E2, $00, $00                ; $1A8E33 |
  db $F5, $16, $40, $00, $02                ; $1A8E38 |
  db $E2, $1E, $E1, $00, $00                ; $1A8E3D |
  db $13, $22, $E1, $00, $00                ; $1A8E42 |
  db $FF, $23, $E1, $00, $00                ; $1A8E47 |
  db $08, $F2, $E1, $00, $00                ; $1A8E4C |
  db $F9, $F9, $F1, $00, $00                ; $1A8E51 |
  db $F9, $FA, $40, $00, $02                ; $1A8E56 |
  db $F0, $00, $E2, $00, $00                ; $1A8E5B |
  db $E3, $05, $E1, $00, $00                ; $1A8E60 |
  db $EC, $08, $40, $00, $02                ; $1A8E65 |
  db $0F, $09, $F1, $00, $00                ; $1A8E6A |
  db $E6, $0F, $F1, $00, $00                ; $1A8E6F |
  db $F4, $18, $E2, $00, $00                ; $1A8E74 |
  db $F8, $18, $E2, $00, $00                ; $1A8E79 |
  db $E0, $20, $E1, $00, $00                ; $1A8E7E |
  db $00, $25, $E1, $00, $00                ; $1A8E83 |
  db $09, $F0, $E1, $00, $00                ; $1A8E88 |
  db $F8, $F6, $E1, $00, $00                ; $1A8E8D |
  db $EE, $FE, $F1, $00, $00                ; $1A8E92 |
  db $FF, $02, $E2, $00, $00                ; $1A8E97 |
  db $F8, $08, $40, $00, $02                ; $1A8E9C |
  db $12, $09, $F1, $00, $00                ; $1A8EA1 |
  db $F2, $0D, $E2, $00, $00                ; $1A8EA6 |
  db $E3, $0F, $E1, $00, $00                ; $1A8EAB |
  db $F0, $14, $E2, $00, $00                ; $1A8EB0 |
  db $FD, $18, $40, $00, $02                ; $1A8EB5 |
  db $F3, $1A, $F1, $00, $00                ; $1A8EBA |
  db $00, $27, $E1, $00, $00                ; $1A8EBF |
  db $F9, $F3, $E1, $00, $00                ; $1A8EC4 |
  db $EC, $FC, $F1, $00, $00                ; $1A8EC9 |
  db $00, $00, $E2, $00, $00                ; $1A8ECE |
  db $04, $04, $E2, $00, $00                ; $1A8ED3 |
  db $15, $09, $E1, $00, $00                ; $1A8ED8 |
  db $F0, $0C, $E2, $00, $00                ; $1A8EDD |
  db $E0, $10, $E1, $00, $00                ; $1A8EE2 |
  db $F0, $10, $40, $00, $02                ; $1A8EE7 |
  db $EE, $15, $E2, $00, $00                ; $1A8EEC |
  db $FE, $18, $E2, $00, $00                ; $1A8EF1 |
  db $00, $28, $E1, $00, $00                ; $1A8EF6 |
  db $00, $28, $E1, $00, $00                ; $1A8EFB |
  db $F8, $F0, $E1, $00, $00                ; $1A8F00 |
  db $EA, $FA, $E1, $00, $00                ; $1A8F05 |
  db $01, $FD, $E2, $00, $00                ; $1A8F0A |
  db $F0, $00, $40, $00, $02                ; $1A8F0F |
  db $07, $01, $F1, $00, $00                ; $1A8F14 |
  db $00, $08, $40, $00, $02                ; $1A8F19 |
  db $18, $09, $E1, $00, $00                ; $1A8F1E |
  db $EE, $0B, $F1, $00, $00                ; $1A8F23 |
  db $EC, $16, $E2, $00, $00                ; $1A8F28 |
  db $FE, $1A, $E2, $00, $00                ; $1A8F2D |
  db $0A, $1A, $F1, $00, $00                ; $1A8F32 |
  db $F1, $1E, $E1, $00, $00                ; $1A8F37 |
  db $F8, $EE, $E1, $00, $00                ; $1A8F3C |
  db $E8, $F8, $E1, $00, $00                ; $1A8F41 |
  db $03, $FB, $F1, $00, $00                ; $1A8F46 |
  db $0A, $FE, $E1, $00, $00                ; $1A8F4B |
  db $F0, $00, $E2, $00, $00                ; $1A8F50 |
  db $FB, $05, $40, $00, $02                ; $1A8F55 |
  db $EB, $09, $40, $00, $02                ; $1A8F5A |
  db $EC, $0A, $E2, $00, $00                ; $1A8F5F |
  db $EA, $18, $F1, $00, $00                ; $1A8F64 |
  db $FF, $1C, $F0, $00, $00                ; $1A8F69 |
  db $0C, $1C, $F1, $00, $00                ; $1A8F6E |
  db $F0, $20, $E1, $00, $00                ; $1A8F73 |
  db $E7, $F7, $E1, $00, $00                ; $1A8F78 |
  db $04, $F8, $F1, $00, $00                ; $1A8F7D |
  db $0D, $FB, $E1, $00, $00                ; $1A8F82 |
  db $00, $00, $40, $00, $02                ; $1A8F87 |
  db $FA, $02, $F0, $00, $00                ; $1A8F8C |
  db $EA, $09, $E1, $00, $00                ; $1A8F91 |
  db $03, $0C, $40, $00, $02                ; $1A8F96 |
  db $F5, $0D, $F0, $00, $00                ; $1A8F9B |
  db $E7, $1B, $F1, $00, $00                ; $1A8FA0 |
  db $FF, $1E, $F1, $00, $00                ; $1A8FA5 |
  db $0E, $1E, $E1, $00, $00                ; $1A8FAA |
  db $EF, $22, $E1, $00, $00                ; $1A8FAF |
  db $05, $F6, $F1, $00, $00                ; $1A8FB4 |
  db $0F, $F9, $E1, $00, $00                ; $1A8FB9 |
  db $EE, $FE, $40, $00, $02                ; $1A8FBE |
  db $FA, $FF, $F0, $00, $00                ; $1A8FC3 |
  db $E8, $08, $E1, $00, $00                ; $1A8FC8 |
  db $09, $0A, $F0, $00, $00                ; $1A8FCD |
  db $EC, $0D, $F0, $00, $00                ; $1A8FD2 |
  db $F6, $14, $E2, $00, $00                ; $1A8FD7 |
  db $EF, $15, $40, $00, $02                ; $1A8FDC |
  db $E4, $1D, $E1, $00, $00                ; $1A8FE1 |
  db $10, $20, $E1, $00, $00                ; $1A8FE6 |
  db $FF, $21, $F1, $00, $00                ; $1A8FEB |
  db $F8, $F8, $6A, $00, $02                ; $1A8FF0 |
  db $08, $F8, $6A, $40, $02                ; $1A8FF5 |
  db $F8, $08, $6A, $80, $02                ; $1A8FFA |
  db $08, $08, $6A, $C0, $02                ; $1A8FFF |
  db $00, $00, $E3, $00, $02                ; $1A9004 |
  db $00, $00, $E3, $00, $02                ; $1A9009 |
  db $00, $00, $E3, $00, $02                ; $1A900E |
  db $00, $00, $E3, $00, $02                ; $1A9013 |
  db $00, $00, $E5, $00, $02                ; $1A9018 |
  db $00, $00, $E5, $00, $02                ; $1A901D |
  db $00, $00, $E5, $00, $02                ; $1A9022 |
  db $00, $00, $E5, $00, $02                ; $1A9027 |
  db $00, $00, $E7, $00, $02                ; $1A902C |
  db $00, $00, $E7, $00, $02                ; $1A9031 |
  db $00, $00, $E7, $00, $02                ; $1A9036 |
  db $00, $00, $E7, $00, $02                ; $1A903B |
  db $F8, $F8, $80, $01, $02                ; $1A9040 |
  db $08, $F8, $82, $01, $02                ; $1A9045 |
  db $F8, $08, $A0, $01, $02                ; $1A904A |
  db $08, $08, $A2, $01, $02                ; $1A904F |
  db $FB, $00, $E1, $00, $00                ; $1A9054 |
  db $0C, $00, $E1, $00, $00                ; $1A9059 |
  db $FB, $0F, $E1, $00, $00                ; $1A905E |
  db $0C, $0F, $E1, $00, $00                ; $1A9063 |
  db $FB, $FF, $44, $00, $00                ; $1A9068 |
  db $0C, $FF, $44, $00, $00                ; $1A906D |
  db $FB, $0E, $44, $00, $00                ; $1A9072 |
  db $0C, $0E, $44, $00, $00                ; $1A9077 |
  db $FB, $FE, $54, $00, $00                ; $1A907C |
  db $0C, $FE, $54, $00, $00                ; $1A9081 |
  db $FB, $0D, $54, $00, $00                ; $1A9086 |
  db $0C, $0D, $54, $00, $00                ; $1A908B |
  db $FC, $FD, $54, $00, $00                ; $1A9090 |
  db $0C, $FD, $54, $00, $00                ; $1A9095 |
  db $FC, $0B, $54, $00, $00                ; $1A909A |
  db $0C, $0B, $54, $00, $00                ; $1A909F |
  db $FE, $FD, $45, $00, $00                ; $1A90A4 |
  db $0A, $FD, $45, $00, $00                ; $1A90A9 |
  db $FE, $0A, $45, $00, $00                ; $1A90AE |
  db $0A, $0A, $45, $00, $00                ; $1A90B3 |
  db $FF, $FE, $55, $00, $00                ; $1A90B8 |
  db $09, $FE, $55, $00, $00                ; $1A90BD |
  db $FF, $09, $55, $00, $00                ; $1A90C2 |
  db $09, $09, $55, $00, $00                ; $1A90C7 |
  db $00, $00, $E3, $00, $02                ; $1A90CC |
  db $00, $00, $E3, $00, $02                ; $1A90D1 |
  db $00, $00, $E3, $00, $02                ; $1A90D6 |
  db $00, $00, $E3, $00, $02                ; $1A90DB |
  db $00, $02, $00, $00, $02                ; $1A90E0 |
  db $08, $12, $04, $00, $02                ; $1A90E5 |
  db $F8, $22, $02, $00, $02                ; $1A90EA |
  db $08, $22, $02, $40, $02                ; $1A90EF |
  db $00, $02, $00, $00, $02                ; $1A90F4 |
  db $04, $12, $06, $00, $02                ; $1A90F9 |
  db $FC, $22, $02, $00, $02                ; $1A90FE |
  db $06, $22, $02, $40, $02                ; $1A9103 |
  db $00, $F8, $04, $00, $02                ; $1A9108 |
  db $00, $08, $04, $80, $02                ; $1A910D |
  db $FE, $F8, $E3, $00, $02                ; $1A9112 |
  db $01, $FA, $E3, $00, $02                ; $1A9117 |
  db $FE, $04, $E3, $00, $02                ; $1A911C |
  db $01, $04, $E3, $00, $02                ; $1A9121 |
  db $FD, $F8, $E3, $00, $02                ; $1A9126 |
  db $02, $FA, $E3, $00, $02                ; $1A912B |
  db $FC, $04, $E3, $00, $02                ; $1A9130 |
  db $05, $04, $E3, $00, $02                ; $1A9135 |
  db $FC, $F9, $E3, $00, $02                ; $1A913A |
  db $05, $FB, $E3, $00, $02                ; $1A913F |
  db $FB, $07, $E3, $00, $02                ; $1A9144 |
  db $04, $07, $E3, $00, $02                ; $1A9149 |
  db $FC, $FA, $E5, $00, $02                ; $1A914E |
  db $05, $FA, $E5, $00, $02                ; $1A9153 |
  db $FB, $07, $E5, $00, $02                ; $1A9158 |
  db $04, $07, $E5, $00, $02                ; $1A915D |
  db $FC, $FB, $E5, $00, $02                ; $1A9162 |
  db $05, $FD, $E5, $00, $02                ; $1A9167 |
  db $FB, $08, $E5, $00, $02                ; $1A916C |
  db $04, $08, $E5, $00, $02                ; $1A9171 |
  db $FC, $FC, $E5, $00, $02                ; $1A9176 |
  db $05, $FE, $E5, $00, $02                ; $1A917B |
  db $FB, $09, $E5, $00, $02                ; $1A9180 |
  db $04, $09, $E5, $00, $02                ; $1A9185 |
  db $FC, $FD, $E7, $00, $02                ; $1A918A |
  db $05, $FF, $E7, $00, $02                ; $1A918F |
  db $FB, $0A, $E7, $00, $02                ; $1A9194 |
  db $04, $0A, $E7, $00, $02                ; $1A9199 |
  db $FC, $FE, $E7, $40, $02                ; $1A919E |
  db $05, $00, $E7, $40, $02                ; $1A91A3 |
  db $FB, $0B, $E7, $40, $02                ; $1A91A8 |
  db $04, $0B, $E7, $40, $02                ; $1A91AD |
  db $FC, $FF, $E7, $00, $02                ; $1A91B2 |
  db $05, $01, $E7, $00, $02                ; $1A91B7 |
  db $FB, $0C, $E7, $00, $02                ; $1A91BC |
  db $04, $0C, $E7, $00, $02                ; $1A91C1 |
  db $00, $F8, $E3, $00, $02                ; $1A91C6 |
  db $FB, $FB, $E3, $00, $02                ; $1A91CB |
  db $05, $FB, $E3, $00, $02                ; $1A91D0 |
  db $F8, $01, $E3, $00, $02                ; $1A91D5 |
  db $08, $01, $E3, $00, $02                ; $1A91DA |
  db $FB, $07, $E3, $00, $02                ; $1A91DF |
  db $06, $07, $E3, $00, $02                ; $1A91E4 |
  db $00, $08, $E3, $00, $02                ; $1A91E9 |
  db $00, $F8, $E5, $00, $02                ; $1A91EE |
  db $FB, $FB, $E5, $00, $02                ; $1A91F3 |
  db $05, $FB, $E5, $00, $02                ; $1A91F8 |
  db $F8, $01, $E5, $00, $02                ; $1A91FD |
  db $08, $01, $E5, $00, $02                ; $1A9202 |
  db $FB, $07, $E5, $00, $02                ; $1A9207 |
  db $06, $07, $E5, $00, $02                ; $1A920C |
  db $00, $08, $E5, $00, $02                ; $1A9211 |
  db $00, $F8, $E5, $C0, $02                ; $1A9216 |
  db $FB, $FB, $E5, $C0, $02                ; $1A921B |
  db $05, $FB, $E5, $C0, $02                ; $1A9220 |
  db $F8, $01, $E5, $C0, $02                ; $1A9225 |
  db $08, $01, $E5, $C0, $02                ; $1A922A |
  db $FB, $06, $E5, $C0, $02                ; $1A922F |
  db $06, $06, $E5, $C0, $02                ; $1A9234 |
  db $00, $08, $E5, $04, $02                ; $1A9239 |
  db $00, $F8, $E7, $00, $02                ; $1A923E |
  db $FB, $FB, $E7, $00, $02                ; $1A9243 |
  db $05, $FB, $E7, $00, $02                ; $1A9248 |
  db $F8, $01, $E7, $00, $02                ; $1A924D |
  db $08, $01, $E7, $00, $02                ; $1A9252 |
  db $FB, $07, $E7, $00, $02                ; $1A9257 |
  db $06, $07, $E7, $00, $02                ; $1A925C |
  db $00, $08, $E7, $00, $02                ; $1A9261 |
  db $00, $F8, $E7, $C0, $02                ; $1A9266 |
  db $FB, $FB, $E7, $C0, $02                ; $1A926B |
  db $05, $FB, $E7, $C0, $02                ; $1A9270 |
  db $F8, $01, $E7, $80, $02                ; $1A9275 |
  db $08, $01, $E7, $C0, $02                ; $1A927A |
  db $FB, $07, $E7, $C0, $02                ; $1A927F |
  db $06, $07, $E7, $C0, $02                ; $1A9284 |
  db $00, $08, $E7, $C0, $02                ; $1A9289 |
  db $00, $F8, $E7, $00, $02                ; $1A928E |
  db $FB, $FB, $E7, $00, $02                ; $1A9293 |
  db $05, $FB, $E7, $00, $02                ; $1A9298 |
  db $F8, $01, $E7, $00, $02                ; $1A929D |
  db $08, $01, $E7, $00, $02                ; $1A92A2 |
  db $FB, $06, $E7, $00, $02                ; $1A92A7 |
  db $06, $07, $E7, $00, $02                ; $1A92AC |
  db $00, $08, $E7, $00, $02                ; $1A92B1 |
  db $F8, $F8, $6A, $00, $02                ; $1A92B6 |
  db $08, $F8, $6A, $40, $02                ; $1A92BB |
  db $F8, $08, $6A, $80, $02                ; $1A92C0 |
  db $08, $08, $6A, $C0, $02                ; $1A92C5 |
  db $F8, $F8, $6A, $00, $02                ; $1A92CA |
  db $08, $F8, $6A, $40, $02                ; $1A92CF |
  db $F8, $08, $6A, $80, $02                ; $1A92D4 |
  db $08, $08, $6A, $C0, $02                ; $1A92D9 |
  db $00, $00, $40, $00, $02                ; $1A92DE |
  db $00, $00, $40, $00, $02                ; $1A92E3 |
  db $00, $00, $40, $00, $02                ; $1A92E8 |
  db $00, $00, $40, $00, $02                ; $1A92ED |
  db $00, $00, $40, $00, $02                ; $1A92F2 |
  db $00, $00, $40, $00, $02                ; $1A92F7 |
  db $00, $00, $40, $00, $02                ; $1A92FC |
  db $00, $00, $40, $00, $02                ; $1A9301 |
  db $00, $F8, $55, $00, $00                ; $1A9306 |
  db $08, $F8, $55, $00, $00                ; $1A930B |
  db $F8, $00, $55, $00, $00                ; $1A9310 |
  db $F8, $08, $55, $00, $00                ; $1A9315 |
  db $10, $00, $55, $00, $00                ; $1A931A |
  db $10, $08, $55, $00, $00                ; $1A931F |
  db $00, $10, $55, $00, $00                ; $1A9324 |
  db $08, $10, $55, $00, $00                ; $1A9329 |
  db $FC, $F0, $55, $00, $00                ; $1A932E |
  db $0C, $F0, $55, $00, $00                ; $1A9333 |
  db $F0, $FC, $55, $00, $00                ; $1A9338 |
  db $F0, $0C, $55, $00, $00                ; $1A933D |
  db $18, $FC, $55, $00, $00                ; $1A9342 |
  db $18, $0C, $55, $00, $00                ; $1A9347 |
  db $FC, $18, $55, $00, $00                ; $1A934C |
  db $0C, $18, $55, $00, $00                ; $1A9351 |
  db $FA, $EC, $55, $00, $00                ; $1A9356 |
  db $0E, $EC, $55, $00, $00                ; $1A935B |
  db $EC, $FA, $55, $00, $00                ; $1A9360 |
  db $EC, $0E, $55, $00, $00                ; $1A9365 |
  db $1C, $FA, $55, $00, $00                ; $1A936A |
  db $1C, $0E, $55, $00, $00                ; $1A936F |
  db $FA, $1C, $55, $00, $00                ; $1A9374 |
  db $0E, $1C, $55, $00, $00                ; $1A9379 |
  db $F9, $EB, $55, $00, $00                ; $1A937E |
  db $0F, $EB, $55, $00, $00                ; $1A9383 |
  db $EA, $FA, $55, $00, $00                ; $1A9388 |
  db $EA, $10, $55, $00, $00                ; $1A938D |
  db $1E, $FA, $55, $00, $00                ; $1A9392 |
  db $1E, $10, $55, $00, $00                ; $1A9397 |
  db $F9, $1D, $55, $00, $00                ; $1A939C |
  db $0F, $1D, $55, $00, $00                ; $1A93A1 |
  db $F8, $EB, $55, $00, $00                ; $1A93A6 |
  db $10, $EB, $55, $00, $00                ; $1A93AB |
  db $E8, $FA, $55, $00, $00                ; $1A93B0 |
  db $E8, $13, $55, $00, $00                ; $1A93B5 |
  db $20, $FA, $55, $00, $00                ; $1A93BA |
  db $20, $13, $55, $00, $00                ; $1A93BF |
  db $F8, $23, $55, $00, $00                ; $1A93C4 |
  db $10, $23, $55, $00, $00                ; $1A93C9 |
  db $F7, $EB, $55, $00, $00                ; $1A93CE |
  db $11, $EB, $55, $00, $00                ; $1A93D3 |
  db $E5, $FB, $55, $00, $00                ; $1A93D8 |
  db $E5, $16, $55, $00, $00                ; $1A93DD |
  db $22, $FB, $55, $00, $00                ; $1A93E2 |
  db $22, $16, $55, $00, $00                ; $1A93E7 |
  db $F7, $27, $55, $00, $00                ; $1A93EC |
  db $11, $27, $55, $00, $00                ; $1A93F1 |
  db $F6, $EB, $55, $00, $00                ; $1A93F6 |
  db $12, $EB, $55, $00, $00                ; $1A93FB |
  db $E4, $FC, $55, $00, $00                ; $1A9400 |
  db $E4, $19, $55, $00, $00                ; $1A9405 |
  db $24, $FC, $55, $00, $00                ; $1A940A |
  db $24, $19, $55, $00, $00                ; $1A940F |
  db $F6, $2B, $55, $00, $00                ; $1A9414 |
  db $12, $2B, $55, $00, $00                ; $1A9419 |
  db $F5, $EC, $45, $00, $00                ; $1A941E |
  db $13, $EC, $45, $00, $00                ; $1A9423 |
  db $E2, $FF, $45, $00, $00                ; $1A9428 |
  db $E2, $1C, $45, $00, $00                ; $1A942D |
  db $26, $FF, $45, $00, $00                ; $1A9432 |
  db $26, $1C, $45, $00, $00                ; $1A9437 |
  db $F5, $2F, $45, $00, $00                ; $1A943C |
  db $13, $2F, $45, $00, $00                ; $1A9441 |
  db $F5, $ED, $54, $00, $00                ; $1A9446 |
  db $13, $ED, $54, $00, $00                ; $1A944B |
  db $E1, $00, $54, $00, $00                ; $1A9450 |
  db $E1, $1E, $54, $00, $00                ; $1A9455 |
  db $27, $00, $54, $00, $00                ; $1A945A |
  db $27, $1E, $54, $00, $00                ; $1A945F |
  db $F5, $31, $54, $00, $00                ; $1A9464 |
  db $13, $31, $54, $00, $00                ; $1A9469 |
  db $F5, $EF, $44, $00, $00                ; $1A946E |
  db $13, $EF, $44, $00, $00                ; $1A9473 |
  db $E0, $03, $44, $00, $00                ; $1A9478 |
  db $E0, $20, $44, $00, $00                ; $1A947D |
  db $28, $03, $44, $00, $00                ; $1A9482 |
  db $28, $20, $44, $00, $00                ; $1A9487 |
  db $F5, $34, $44, $00, $00                ; $1A948C |
  db $13, $34, $44, $00, $00                ; $1A9491 |
  db $F0, $F0, $06, $00, $02                ; $1A9496 |
  db $00, $F0, $08, $00, $02                ; $1A949B |
  db $10, $F0, $0A, $00, $02                ; $1A94A0 |
  db $F0, $00, $26, $00, $02                ; $1A94A5 |
  db $00, $00, $28, $00, $02                ; $1A94AA |
  db $10, $00, $2A, $00, $02                ; $1A94AF |
  db $F0, $10, $46, $00, $02                ; $1A94B4 |
  db $00, $10, $48, $00, $02                ; $1A94B9 |
  db $10, $10, $4A, $00, $02                ; $1A94BE |
  db $10, $10, $4A, $00, $02                ; $1A94C3 |
  db $00, $F0, $02, $00, $02                ; $1A94C8 |
  db $00, $F0, $02, $00, $02                ; $1A94CD |
  db $10, $F0, $04, $00, $02                ; $1A94D2 |
  db $00, $00, $22, $00, $02                ; $1A94D7 |
  db $00, $00, $22, $00, $02                ; $1A94DC |
  db $10, $00, $24, $00, $02                ; $1A94E1 |
  db $F0, $10, $40, $00, $02                ; $1A94E6 |
  db $00, $10, $42, $00, $02                ; $1A94EB |
  db $10, $10, $44, $00, $02                ; $1A94F0 |
  db $10, $10, $44, $00, $02                ; $1A94F5 |
  db $00, $F0, $02, $00, $02                ; $1A94FA |
  db $10, $F8, $4C, $00, $02                ; $1A94FF |
  db $00, $F0, $02, $00, $02                ; $1A9504 |
  db $10, $F0, $04, $00, $02                ; $1A9509 |
  db $00, $00, $22, $00, $02                ; $1A950E |
  db $00, $00, $22, $00, $02                ; $1A9513 |
  db $10, $00, $24, $00, $02                ; $1A9518 |
  db $F0, $10, $40, $00, $02                ; $1A951D |
  db $00, $10, $42, $00, $02                ; $1A9522 |
  db $10, $10, $44, $00, $02                ; $1A9527 |
  db $F8, $F8, $6A, $00, $02                ; $1A952C |
  db $08, $F8, $6A, $40, $02                ; $1A9531 |
  db $F8, $08, $6A, $80, $02                ; $1A9536 |
  db $08, $08, $6A, $C0, $02                ; $1A953B |
  db $FC, $FB, $F9, $00, $00                ; $1A9540 |
  db $0C, $FB, $F9, $00, $00                ; $1A9545 |
  db $FC, $08, $F9, $00, $00                ; $1A954A |
  db $0C, $08, $F9, $00, $00                ; $1A954F |
  db $FB, $F9, $F9, $00, $00                ; $1A9554 |
  db $0D, $F9, $F9, $00, $00                ; $1A9559 |
  db $FB, $08, $F9, $00, $00                ; $1A955E |
  db $0D, $08, $F9, $00, $00                ; $1A9563 |
  db $FA, $F8, $F9, $00, $00                ; $1A9568 |
  db $0E, $F8, $F9, $00, $00                ; $1A956D |
  db $FA, $09, $F9, $00, $00                ; $1A9572 |
  db $0E, $09, $F9, $00, $00                ; $1A9577 |
  db $F9, $F8, $F9, $00, $00                ; $1A957C |
  db $0F, $F8, $F9, $00, $00                ; $1A9581 |
  db $F9, $0A, $F9, $00, $00                ; $1A9586 |
  db $0F, $0A, $F9, $00, $00                ; $1A958B |
  db $F8, $F9, $F9, $00, $00                ; $1A9590 |
  db $10, $F9, $F9, $00, $00                ; $1A9595 |
  db $F8, $0C, $F9, $00, $00                ; $1A959A |
  db $10, $0C, $F9, $00, $00                ; $1A959F |
  db $F7, $FA, $F9, $00, $00                ; $1A95A4 |
  db $11, $FA, $F9, $00, $00                ; $1A95A9 |
  db $F7, $0E, $F9, $00, $00                ; $1A95AE |
  db $11, $0E, $F9, $00, $00                ; $1A95B3 |
  db $F7, $FB, $E2, $00, $00                ; $1A95B8 |
  db $11, $FB, $E2, $00, $00                ; $1A95BD |
  db $F7, $0F, $E2, $00, $00                ; $1A95C2 |
  db $11, $0F, $E2, $00, $00                ; $1A95C7 |
  db $F7, $FC, $59, $00, $00                ; $1A95CC |
  db $11, $FC, $59, $00, $00                ; $1A95D1 |
  db $F7, $10, $59, $00, $00                ; $1A95D6 |
  db $11, $10, $59, $00, $00                ; $1A95DB |
  db $F7, $FD, $F8, $00, $00                ; $1A95E0 |
  db $11, $FD, $F8, $00, $00                ; $1A95E5 |
  db $F7, $11, $F8, $00, $00                ; $1A95EA |
  db $11, $11, $F8, $00, $00                ; $1A95EF |
  db $F7, $FE, $F7, $00, $00                ; $1A95F4 |
  db $11, $FE, $F7, $00, $00                ; $1A95F9 |
  db $F7, $12, $F7, $00, $00                ; $1A95FE |
  db $11, $12, $F7, $00, $00                ; $1A9603 |
  db $FE, $FF, $2C, $04, $00                ; $1A9608 |
  db $08, $08, $02, $0C, $00                ; $1A960D |
  db $0E, $04, $14, $0C, $00                ; $1A9612 |
  db $FE, $FF, $00, $0C, $02                ; $1A9617 |
  db $00, $08, $02, $0C, $00                ; $1A961C |
  db $04, $00, $04, $04, $00                ; $1A9621 |
  db $00, $FF, $08, $0C, $00                ; $1A9626 |
  db $00, $08, $02, $0C, $00                ; $1A962B |
  db $08, $08, $02, $0C, $00                ; $1A9630 |
  db $00, $FF, $08, $0C, $02                ; $1A9635 |
  db $FE, $FE, $2C, $04, $00                ; $1A963A |
  db $FD, $06, $12, $4C, $00                ; $1A963F |
  db $0A, $06, $12, $0C, $00                ; $1A9644 |
  db $0E, $03, $14, $0C, $00                ; $1A9649 |
  db $FE, $FE, $00, $0C, $02                ; $1A964E |
  db $FE, $FE, $2C, $04, $00                ; $1A9653 |
  db $FF, $07, $03, $4C, $00                ; $1A9658 |
  db $08, $07, $03, $0C, $00                ; $1A965D |
  db $0E, $03, $14, $0C, $00                ; $1A9662 |
  db $FE, $FE, $00, $0C, $02                ; $1A9667 |
  db $FE, $FE, $2C, $04, $00                ; $1A966C |
  db $FE, $FE, $00, $0C, $00                ; $1A9671 |
  db $03, $08, $02, $0C, $00                ; $1A9676 |
  db $0E, $03, $14, $0C, $00                ; $1A967B |
  db $FE, $FE, $00, $0C, $02                ; $1A9680 |
  db $04, $02, $15, $0C, $00                ; $1A9685 |
  db $04, $02, $15, $0C, $00                ; $1A968A |
  db $00, $00, $06, $0C, $02                ; $1A968F |
  db $00, $08, $16, $0C, $00                ; $1A9694 |
  db $08, $08, $17, $0C, $00                ; $1A9699 |
  db $04, $FD, $05, $04, $00                ; $1A969E |
  db $08, $FD, $0B, $0C, $00                ; $1A96A3 |
  db $00, $FD, $0A, $0C, $00                ; $1A96A8 |
  db $04, $02, $15, $0C, $00                ; $1A96AD |
  db $00, $00, $06, $0C, $02                ; $1A96B2 |
  db $04, $00, $05, $04, $00                ; $1A96B7 |
  db $04, $10, $13, $0C, $00                ; $1A96BC |
  db $04, $10, $13, $0C, $00                ; $1A96C1 |
  db $04, $10, $13, $0C, $00                ; $1A96C6 |
  db $00, $00, $0A, $0C, $02                ; $1A96CB |
  db $00, $00, $0E, $0C, $00                ; $1A96D0 |
  db $04, $10, $13, $0C, $00                ; $1A96D5 |
  db $04, $10, $13, $0C, $00                ; $1A96DA |
  db $04, $10, $13, $0C, $00                ; $1A96DF |
  db $00, $00, $0E, $0C, $02                ; $1A96E4 |
  db $04, $0C, $13, $0C, $00                ; $1A96E9 |
  db $08, $00, $0F, $0C, $00                ; $1A96EE |
  db $00, $00, $0E, $0C, $00                ; $1A96F3 |
  db $04, $0C, $13, $0C, $00                ; $1A96F8 |
  db $00, $00, $0E, $0C, $02                ; $1A96FD |
  db $00, $08, $0E, $8C, $00                ; $1A9702 |
  db $08, $00, $1F, $8C, $00                ; $1A9707 |
  db $00, $00, $1E, $8C, $00                ; $1A970C |
  db $08, $08, $0F, $8C, $00                ; $1A9711 |
  db $00, $08, $0E, $8C, $00                ; $1A9716 |
  db $FE, $FE, $2C, $04, $00                ; $1A971B |
  db $08, $08, $12, $0C, $00                ; $1A9720 |
  db $00, $08, $12, $4C, $00                ; $1A9725 |
  db $0A, $01, $14, $0C, $00                ; $1A972A |
  db $FE, $FE, $00, $0C, $02                ; $1A972F |
  db $04, $01, $04, $04, $00                ; $1A9734 |
  db $08, $08, $19, $0C, $00                ; $1A9739 |
  db $00, $08, $18, $0C, $00                ; $1A973E |
  db $08, $00, $09, $0C, $00                ; $1A9743 |
  db $00, $00, $08, $0C, $00                ; $1A9748 |
  db $04, $07, $04, $04, $00                ; $1A974D |
  db $08, $08, $1D, $0C, $00                ; $1A9752 |
  db $00, $08, $1C, $0C, $00                ; $1A9757 |
  db $08, $00, $0D, $0C, $00                ; $1A975C |
  db $00, $00, $0C, $0C, $00                ; $1A9761 |
  db $04, $07, $05, $04, $00                ; $1A9766 |
  db $04, $F8, $13, $0C, $00                ; $1A976B |
  db $04, $F8, $13, $0C, $00                ; $1A9770 |
  db $04, $F8, $13, $0C, $00                ; $1A9775 |
  db $00, $00, $0A, $8C, $02                ; $1A977A |
  db $08, $FC, $1F, $8C, $00                ; $1A977F |
  db $00, $FC, $1E, $8C, $00                ; $1A9784 |
  db $04, $01, $15, $0C, $00                ; $1A9789 |
  db $00, $00, $06, $0C, $02                ; $1A978E |
  db $08, $08, $17, $0C, $00                ; $1A9793 |
  db $04, $01, $15, $8C, $00                ; $1A9798 |
  db $04, $01, $15, $8C, $00                ; $1A979D |
  db $00, $00, $06, $0C, $02                ; $1A97A2 |
  db $08, $08, $17, $0C, $00                ; $1A97A7 |
  db $00, $08, $16, $0C, $00                ; $1A97AC |
  db $04, $01, $04, $04, $00                ; $1A97B1 |
  db $08, $00, $1D, $8C, $00                ; $1A97B6 |
  db $00, $00, $1C, $8C, $00                ; $1A97BB |
  db $08, $08, $0D, $8C, $00                ; $1A97C0 |
  db $00, $08, $0C, $8C, $00                ; $1A97C5 |
  db $04, $0B, $13, $0C, $00                ; $1A97CA |
  db $04, $0B, $13, $0C, $00                ; $1A97CF |
  db $08, $07, $1F, $0C, $00                ; $1A97D4 |
  db $00, $07, $1E, $0C, $00                ; $1A97D9 |
  db $04, $04, $15, $8C, $00                ; $1A97DE |
  db $04, $04, $15, $0C, $00                ; $1A97E3 |
  db $04, $04, $15, $0C, $00                ; $1A97E8 |
  db $00, $00, $06, $0C, $02                ; $1A97ED |
  db $00, $08, $16, $0C, $00                ; $1A97F2 |
  db $08, $00, $07, $0C, $00                ; $1A97F7 |
  db $04, $04, $15, $8C, $00                ; $1A97FC |
  db $04, $04, $15, $8C, $00                ; $1A9801 |
  db $00, $00, $06, $0C, $02                ; $1A9806 |
  db $00, $08, $16, $0C, $00                ; $1A980B |
  db $08, $00, $07, $0C, $00                ; $1A9810 |
  db $04, $08, $04, $04, $00                ; $1A9815 |
  db $08, $09, $1D, $0C, $00                ; $1A981A |
  db $00, $09, $1C, $0C, $00                ; $1A981F |
  db $04, $04, $15, $8C, $00                ; $1A9824 |
  db $00, $00, $06, $0C, $02                ; $1A9829 |
  db $04, $04, $04, $04, $00                ; $1A982E |
  db $08, $08, $17, $0C, $00                ; $1A9833 |
  db $00, $08, $16, $0C, $00                ; $1A9838 |
  db $08, $00, $07, $0C, $00                ; $1A983D |
  db $00, $00, $06, $0C, $00                ; $1A9842 |
  db $FE, $01, $2C, $04, $00                ; $1A9847 |
  db $08, $08, $02, $0C, $00                ; $1A984C |
  db $0C, $06, $14, $0C, $00                ; $1A9851 |
  db $FE, $01, $00, $0C, $02                ; $1A9856 |
  db $00, $08, $02, $0C, $00                ; $1A985B |
  db $FE, $FB, $2C, $04, $00                ; $1A9860 |
  db $08, $08, $12, $4C, $00                ; $1A9865 |
  db $0E, $00, $14, $0C, $00                ; $1A986A |
  db $FE, $FB, $00, $0C, $02                ; $1A986F |
  db $01, $08, $12, $0C, $00                ; $1A9874 |
  db $FE, $FD, $2C, $04, $00                ; $1A9879 |
  db $08, $0B, $03, $8C, $00                ; $1A987E |
  db $0E, $02, $14, $0C, $00                ; $1A9883 |
  db $FE, $FD, $00, $0C, $02                ; $1A9888 |
  db $00, $0B, $03, $CC, $00                ; $1A988D |
  db $FE, $FF, $2C, $04, $00                ; $1A9892 |
  db $09, $08, $02, $0C, $00                ; $1A9897 |
  db $0E, $02, $14, $0C, $00                ; $1A989C |
  db $FE, $FF, $00, $0C, $02                ; $1A98A1 |
  db $FF, $08, $02, $0C, $00                ; $1A98A6 |
  db $FE, $00, $2C, $04, $00                ; $1A98AB |
  db $09, $08, $03, $0C, $00                ; $1A98B0 |
  db $0E, $01, $14, $0C, $00                ; $1A98B5 |
  db $FE, $00, $00, $0C, $02                ; $1A98BA |
  db $FF, $08, $03, $4C, $00                ; $1A98BF |
  db $FE, $00, $2C, $04, $00                ; $1A98C4 |
  db $0B, $09, $12, $CC, $00                ; $1A98C9 |
  db $0E, $02, $14, $0C, $00                ; $1A98CE |
  db $FE, $00, $00, $0C, $02                ; $1A98D3 |
  db $FC, $09, $12, $8C, $00                ; $1A98D8 |
  db $FE, $01, $2C, $04, $00                ; $1A98DD |
  db $08, $08, $02, $0C, $00                ; $1A98E2 |
  db $0E, $08, $14, $0C, $00                ; $1A98E7 |
  db $FE, $01, $00, $0C, $02                ; $1A98EC |
  db $00, $08, $02, $0C, $00                ; $1A98F1 |
  db $04, $04, $05, $04, $00                ; $1A98F6 |
  db $08, $08, $17, $0C, $00                ; $1A98FB |
  db $00, $08, $16, $0C, $00                ; $1A9900 |
  db $08, $00, $07, $0C, $00                ; $1A9905 |
  db $00, $00, $06, $0C, $00                ; $1A990A |
  db $02, $04, $04, $04, $00                ; $1A990F |
  db $08, $08, $17, $0C, $00                ; $1A9914 |
  db $00, $08, $16, $0C, $00                ; $1A9919 |
  db $08, $00, $07, $0C, $00                ; $1A991E |
  db $00, $00, $06, $0C, $00                ; $1A9923 |
  db $01, $04, $04, $04, $00                ; $1A9928 |
  db $08, $08, $17, $0C, $00                ; $1A992D |
  db $00, $08, $16, $0C, $00                ; $1A9932 |
  db $08, $00, $07, $0C, $00                ; $1A9937 |
  db $00, $00, $06, $0C, $00                ; $1A993C |
  db $06, $04, $04, $04, $00                ; $1A9941 |
  db $08, $08, $17, $0C, $00                ; $1A9946 |
  db $00, $08, $16, $0C, $00                ; $1A994B |
  db $08, $00, $07, $0C, $00                ; $1A9950 |
  db $00, $00, $06, $0C, $00                ; $1A9955 |
  db $07, $04, $04, $04, $00                ; $1A995A |
  db $08, $08, $17, $0C, $00                ; $1A995F |
  db $00, $08, $16, $0C, $00                ; $1A9964 |
  db $08, $00, $07, $0C, $00                ; $1A9969 |
  db $00, $00, $06, $0C, $00                ; $1A996E |
  db $00, $00, $06, $0C, $00                ; $1A9973 |
  db $08, $08, $17, $0C, $00                ; $1A9978 |
  db $00, $00, $06, $0C, $02                ; $1A997D |
  db $04, $04, $04, $04, $00                ; $1A9982 |
  db $04, $04, $04, $04, $00                ; $1A9987 |
  db $00, $00, $06, $0C, $02                ; $1A998C |
  db $04, $04, $05, $04, $00                ; $1A9991 |
  db $04, $04, $05, $04, $00                ; $1A9996 |
  db $00, $00, $06, $0C, $02                ; $1A999B |
  db $02, $04, $04, $04, $00                ; $1A99A0 |
  db $02, $04, $04, $04, $00                ; $1A99A5 |
  db $00, $00, $06, $0C, $02                ; $1A99AA |
  db $01, $04, $04, $04, $00                ; $1A99AF |
  db $01, $04, $04, $04, $00                ; $1A99B4 |
  db $00, $00, $06, $0C, $02                ; $1A99B9 |
  db $06, $04, $04, $04, $00                ; $1A99BE |
  db $06, $04, $04, $04, $00                ; $1A99C3 |
  db $00, $00, $06, $0C, $02                ; $1A99C8 |
  db $07, $04, $04, $04, $00                ; $1A99CD |
  db $07, $04, $04, $04, $00                ; $1A99D2 |
  db $00, $00, $06, $0C, $02                ; $1A99D7 |
  db $FE, $FF, $2C, $24, $00                ; $1A99DC |
  db $0E, $04, $14, $2C, $00                ; $1A99E1 |
  db $FE, $FF, $00, $2C, $02                ; $1A99E6 |
  db $04, $00, $04, $24, $00                ; $1A99EB |
  db $08, $08, $02, $2C, $00                ; $1A99F0 |
  db $00, $FF, $08, $2C, $02                ; $1A99F5 |
  db $08, $00, $E2, $00, $00                ; $1A99FA |
  db $01, $01, $E2, $00, $00                ; $1A99FF |
  db $0D, $02, $E2, $00, $00                ; $1A9A04 |
  db $FC, $03, $E2, $00, $00                ; $1A9A09 |
  db $03, $05, $E2, $00, $00                ; $1A9A0E |
  db $00, $08, $E2, $00, $00                ; $1A9A13 |
  db $09, $08, $E2, $00, $00                ; $1A9A18 |
  db $09, $FF, $E2, $00, $00                ; $1A9A1D |
  db $00, $00, $E2, $00, $00                ; $1A9A22 |
  db $0E, $02, $E2, $00, $00                ; $1A9A27 |
  db $FB, $03, $F0, $00, $00                ; $1A9A2C |
  db $03, $05, $E2, $00, $00                ; $1A9A31 |
  db $FF, $08, $E2, $00, $00                ; $1A9A36 |
  db $0A, $08, $E2, $00, $00                ; $1A9A3B |
  db $0A, $FF, $E2, $00, $00                ; $1A9A40 |
  db $00, $00, $E2, $00, $00                ; $1A9A45 |
  db $FA, $02, $F0, $00, $00                ; $1A9A4A |
  db $0F, $02, $E2, $00, $00                ; $1A9A4F |
  db $03, $04, $E2, $00, $00                ; $1A9A54 |
  db $FE, $08, $E2, $00, $00                ; $1A9A59 |
  db $0B, $08, $F0, $00, $00                ; $1A9A5E |
  db $0B, $FF, $E2, $00, $00                ; $1A9A63 |
  db $00, $00, $E2, $00, $00                ; $1A9A68 |
  db $F9, $02, $F0, $00, $00                ; $1A9A6D |
  db $0F, $02, $E2, $00, $00                ; $1A9A72 |
  db $03, $03, $F1, $00, $00                ; $1A9A77 |
  db $FE, $08, $E2, $00, $00                ; $1A9A7C |
  db $0B, $08, $F0, $00, $00                ; $1A9A81 |
  db $00, $FF, $E2, $00, $00                ; $1A9A86 |
  db $0B, $FF, $F0, $00, $00                ; $1A9A8B |
  db $F9, $02, $F1, $00, $00                ; $1A9A90 |
  db $0F, $02, $E2, $00, $00                ; $1A9A95 |
  db $03, $03, $F1, $00, $00                ; $1A9A9A |
  db $FD, $08, $F0, $00, $00                ; $1A9A9F |
  db $0C, $08, $F0, $00, $00                ; $1A9AA4 |
  db $00, $FF, $F0, $00, $00                ; $1A9AA9 |
  db $0B, $FF, $F1, $00, $00                ; $1A9AAE |
  db $F9, $02, $F1, $00, $00                ; $1A9AB3 |
  db $0F, $02, $E2, $00, $00                ; $1A9AB8 |
  db $03, $03, $F1, $00, $00                ; $1A9ABD |
  db $FD, $08, $F1, $00, $00                ; $1A9AC2 |
  db $0C, $08, $F0, $00, $00                ; $1A9AC7 |
  db $00, $FF, $F0, $00, $00                ; $1A9ACC |
  db $0B, $FF, $F1, $00, $00                ; $1A9AD1 |
  db $F9, $02, $F1, $00, $00                ; $1A9AD6 |
  db $0F, $02, $F0, $00, $00                ; $1A9ADB |
  db $03, $03, $F1, $00, $00                ; $1A9AE0 |
  db $FD, $08, $F1, $00, $00                ; $1A9AE5 |
  db $0C, $08, $F1, $00, $00                ; $1A9AEA |
  db $FF, $FF, $F1, $00, $00                ; $1A9AEF |
  db $0B, $FF, $F1, $00, $00                ; $1A9AF4 |
  db $F8, $02, $F1, $00, $00                ; $1A9AF9 |
  db $10, $02, $F1, $00, $00                ; $1A9AFE |
  db $03, $03, $E1, $00, $00                ; $1A9B03 |
  db $FD, $08, $E1, $00, $00                ; $1A9B08 |
  db $0C, $08, $F1, $00, $00                ; $1A9B0D |
  db $FE, $FF, $F1, $00, $00                ; $1A9B12 |
  db $0B, $FF, $F1, $00, $00                ; $1A9B17 |
  db $F8, $02, $F1, $00, $00                ; $1A9B1C |
  db $03, $02, $E1, $00, $00                ; $1A9B21 |
  db $10, $02, $E1, $00, $00                ; $1A9B26 |
  db $FD, $08, $E1, $00, $00                ; $1A9B2B |
  db $0C, $08, $F1, $00, $00                ; $1A9B30 |
  db $0B, $FE, $F1, $00, $00                ; $1A9B35 |
  db $FE, $FF, $E1, $00, $00                ; $1A9B3A |
  db $F7, $02, $F1, $00, $00                ; $1A9B3F |
  db $10, $02, $E1, $00, $00                ; $1A9B44 |
  db $FD, $07, $E1, $00, $00                ; $1A9B49 |
  db $0C, $08, $E1, $00, $00                ; $1A9B4E |
  db $0C, $08, $E1, $00, $00                ; $1A9B53 |
  db $0B, $FE, $E1, $00, $00                ; $1A9B58 |
  db $F7, $01, $E1, $00, $00                ; $1A9B5D |
  db $FD, $07, $E1, $00, $00                ; $1A9B62 |
  db $0D, $08, $E1, $00, $00                ; $1A9B67 |
  db $F7, $01, $E1, $00, $00                ; $1A9B6C |
  db $FD, $07, $E1, $00, $00                ; $1A9B71 |
  db $0D, $08, $E1, $00, $00                ; $1A9B76 |
  db $0D, $07, $E1, $00, $00                ; $1A9B7B |
  db $F7, $00, $E1, $00, $00                ; $1A9B80 |
  db $0D, $07, $E1, $00, $00                ; $1A9B85 |
  db $F7, $00, $E1, $00, $00                ; $1A9B8A |
  db $F7, $00, $E1, $00, $00                ; $1A9B8F |
  db $0D, $07, $E1, $00, $00                ; $1A9B94 |
  db $F7, $00, $E1, $00, $00                ; $1A9B99 |
  db $FD, $FC, $62, $00, $02                ; $1A9B9E |
  db $FD, $FC, $62, $00, $00                ; $1A9BA3 |
  db $00, $03, $64, $00, $02                ; $1A9BA8 |
  db $FD, $FC, $62, $00, $02                ; $1A9BAD |
  db $FD, $FC, $62, $00, $00                ; $1A9BB2 |
  db $00, $03, $64, $00, $02                ; $1A9BB7 |
  db $FD, $FC, $62, $00, $02                ; $1A9BBC |
  db $FD, $FC, $62, $00, $00                ; $1A9BC1 |
  db $00, $03, $64, $00, $02                ; $1A9BC6 |
  db $FE, $FC, $62, $00, $02                ; $1A9BCB |
  db $FE, $FC, $62, $00, $00                ; $1A9BD0 |
  db $00, $03, $64, $00, $02                ; $1A9BD5 |
  db $01, $FA, $62, $00, $02                ; $1A9BDA |
  db $01, $FA, $62, $00, $00                ; $1A9BDF |
  db $00, $03, $64, $00, $02                ; $1A9BE4 |
  db $FE, $FC, $62, $00, $02                ; $1A9BE9 |
  db $FE, $FC, $62, $00, $00                ; $1A9BEE |
  db $00, $03, $64, $00, $02                ; $1A9BF3 |
  db $FF, $FB, $62, $00, $02                ; $1A9BF8 |
  db $FF, $FB, $62, $00, $00                ; $1A9BFD |
  db $00, $03, $64, $00, $02                ; $1A9C02 |
  db $01, $F9, $62, $00, $02                ; $1A9C07 |
  db $01, $F9, $62, $00, $00                ; $1A9C0C |
  db $00, $03, $64, $00, $02                ; $1A9C11 |
  db $FF, $FC, $62, $00, $02                ; $1A9C16 |
  db $FF, $FC, $62, $00, $00                ; $1A9C1B |
  db $00, $03, $64, $00, $02                ; $1A9C20 |
  db $FF, $FD, $62, $00, $02                ; $1A9C25 |
  db $FF, $FD, $62, $00, $00                ; $1A9C2A |
  db $00, $03, $64, $00, $02                ; $1A9C2F |
  db $00, $FA, $62, $00, $02                ; $1A9C34 |
  db $00, $FA, $62, $00, $00                ; $1A9C39 |
  db $00, $03, $64, $00, $02                ; $1A9C3E |
  db $02, $FB, $62, $00, $02                ; $1A9C43 |
  db $02, $FB, $62, $00, $00                ; $1A9C48 |
  db $00, $03, $64, $00, $02                ; $1A9C4D |
  db $01, $FA, $62, $00, $02                ; $1A9C52 |
  db $01, $FA, $62, $00, $00                ; $1A9C57 |
  db $00, $03, $64, $00, $02                ; $1A9C5C |
  db $01, $FA, $62, $00, $02                ; $1A9C61 |
  db $01, $FA, $62, $00, $00                ; $1A9C66 |
  db $00, $03, $64, $00, $02                ; $1A9C6B |
  db $01, $F9, $62, $00, $02                ; $1A9C70 |
  db $01, $F9, $62, $00, $00                ; $1A9C75 |
  db $00, $03, $64, $00, $02                ; $1A9C7A |
  db $01, $FB, $62, $00, $02                ; $1A9C7F |
  db $01, $FB, $62, $00, $00                ; $1A9C84 |
  db $00, $03, $64, $00, $02                ; $1A9C89 |
  db $00, $FA, $62, $40, $02                ; $1A9C8E |
  db $00, $FA, $63, $40, $00                ; $1A9C93 |
  db $00, $03, $64, $00, $02                ; $1A9C98 |
  db $00, $FA, $62, $40, $02                ; $1A9C9D |
  db $00, $FA, $63, $40, $00                ; $1A9CA2 |
  db $00, $03, $64, $00, $02                ; $1A9CA7 |
  db $01, $FB, $62, $00, $02                ; $1A9CAC |
  db $01, $FB, $62, $00, $00                ; $1A9CB1 |
  db $00, $03, $64, $00, $02                ; $1A9CB6 |
  db $00, $00, $62, $00, $02                ; $1A9CBB |
  db $00, $00, $62, $00, $00                ; $1A9CC0 |
  db $00, $00, $62, $00, $00                ; $1A9CC5 |
  db $00, $00, $64, $00, $02                ; $1A9CCA |
  db $00, $00, $64, $00, $00                ; $1A9CCF |
  db $00, $00, $64, $00, $00                ; $1A9CD4 |
  db $00, $F3, $62, $00, $02                ; $1A9CD9 |
  db $00, $F3, $62, $00, $00                ; $1A9CDE |
  db $00, $03, $64, $00, $02                ; $1A9CE3 |
  db $00, $F3, $62, $00, $02                ; $1A9CE8 |
  db $00, $F3, $62, $00, $00                ; $1A9CED |
  db $00, $03, $64, $00, $02                ; $1A9CF2 |
  db $00, $F3, $62, $00, $02                ; $1A9CF7 |
  db $00, $F3, $62, $00, $00                ; $1A9CFC |
  db $00, $03, $64, $00, $02                ; $1A9D01 |
  db $00, $F4, $62, $00, $02                ; $1A9D06 |
  db $00, $04, $64, $00, $02                ; $1A9D0B |
  db $00, $04, $64, $00, $00                ; $1A9D10 |
  db $00, $04, $64, $00, $02                ; $1A9D15 |
  db $00, $F4, $62, $00, $02                ; $1A9D1A |
  db $00, $F4, $62, $00, $00                ; $1A9D1F |
  db $00, $04, $64, $00, $02                ; $1A9D24 |
  db $00, $F4, $62, $00, $02                ; $1A9D29 |
  db $00, $F4, $62, $00, $00                ; $1A9D2E |
  db $00, $FB, $62, $00, $02                ; $1A9D33 |
  db $00, $04, $64, $00, $02                ; $1A9D38 |
  db $00, $04, $64, $00, $00                ; $1A9D3D |
  db $00, $FB, $62, $00, $02                ; $1A9D42 |
  db $00, $04, $64, $00, $02                ; $1A9D47 |
  db $00, $04, $64, $00, $00                ; $1A9D4C |
  db $00, $F9, $62, $00, $02                ; $1A9D51 |
  db $00, $04, $64, $00, $02                ; $1A9D56 |
  db $00, $04, $64, $00, $00                ; $1A9D5B |
  db $00, $FB, $62, $00, $02                ; $1A9D60 |
  db $00, $04, $64, $00, $02                ; $1A9D65 |
  db $00, $04, $64, $00, $00                ; $1A9D6A |
  db $00, $F3, $62, $00, $02                ; $1A9D6F |
  db $00, $03, $64, $00, $02                ; $1A9D74 |
  db $00, $03, $64, $00, $00                ; $1A9D79 |
  db $00, $FB, $62, $00, $02                ; $1A9D7E |
  db $00, $03, $64, $00, $02                ; $1A9D83 |
  db $00, $03, $64, $00, $00                ; $1A9D88 |
  db $00, $FB, $62, $00, $02                ; $1A9D8D |
  db $00, $03, $64, $00, $02                ; $1A9D92 |
  db $00, $03, $64, $00, $00                ; $1A9D97 |
  db $00, $FB, $62, $00, $02                ; $1A9D9C |
  db $00, $03, $64, $00, $02                ; $1A9DA1 |
  db $00, $03, $64, $00, $00                ; $1A9DA6 |
  db $00, $FB, $62, $00, $02                ; $1A9DAB |
  db $00, $03, $64, $00, $02                ; $1A9DB0 |
  db $00, $03, $64, $00, $00                ; $1A9DB5 |
  db $00, $FB, $62, $00, $02                ; $1A9DBA |
  db $00, $03, $64, $00, $02                ; $1A9DBF |
  db $00, $03, $64, $00, $00                ; $1A9DC4 |
  db $00, $FB, $62, $00, $02                ; $1A9DC9 |
  db $00, $03, $64, $00, $02                ; $1A9DCE |
  db $00, $03, $64, $00, $00                ; $1A9DD3 |
  db $00, $FB, $62, $00, $02                ; $1A9DD8 |
  db $00, $03, $64, $00, $02                ; $1A9DDD |
  db $00, $03, $64, $00, $00                ; $1A9DE2 |
  db $00, $FB, $62, $00, $02                ; $1A9DE7 |
  db $00, $03, $64, $00, $02                ; $1A9DEC |
  db $00, $03, $64, $00, $00                ; $1A9DF1 |
  db $FB, $FE, $62, $00, $02                ; $1A9DF6 |
  db $00, $03, $64, $00, $02                ; $1A9DFB |
  db $00, $03, $64, $00, $00                ; $1A9E00 |
  db $FE, $01, $62, $00, $02                ; $1A9E05 |
  db $00, $00, $64, $00, $02                ; $1A9E0A |
  db $00, $00, $64, $00, $00                ; $1A9E0F |
  db $00, $0D, $62, $00, $02                ; $1A9E14 |
  db $00, $FD, $64, $00, $02                ; $1A9E19 |
  db $00, $FD, $64, $00, $00                ; $1A9E1E |
  db $00, $FA, $62, $00, $02                ; $1A9E23 |
  db $00, $03, $64, $00, $02                ; $1A9E28 |
  db $00, $03, $64, $00, $00                ; $1A9E2D |
  db $00, $FA, $62, $00, $02                ; $1A9E32 |
  db $00, $03, $64, $00, $02                ; $1A9E37 |
  db $00, $03, $64, $00, $00                ; $1A9E3C |
  db $00, $FA, $62, $00, $02                ; $1A9E41 |
  db $00, $03, $64, $00, $02                ; $1A9E46 |
  db $00, $03, $64, $00, $00                ; $1A9E4B |
  db $00, $FA, $62, $40, $02                ; $1A9E50 |
  db $00, $03, $64, $00, $02                ; $1A9E55 |
  db $00, $03, $64, $00, $00                ; $1A9E5A |
  db $00, $FA, $62, $40, $02                ; $1A9E5F |
  db $00, $03, $64, $00, $02                ; $1A9E64 |
  db $00, $03, $64, $00, $00                ; $1A9E69 |
  db $00, $FA, $62, $40, $02                ; $1A9E6E |
  db $00, $03, $64, $00, $02                ; $1A9E73 |
  db $00, $03, $64, $00, $00                ; $1A9E78 |
  db $00, $F3, $62, $00, $02                ; $1A9E7D |
  db $00, $03, $64, $00, $02                ; $1A9E82 |
  db $00, $03, $64, $00, $00                ; $1A9E87 |
  db $00, $F3, $62, $00, $02                ; $1A9E8C |
  db $00, $03, $64, $00, $02                ; $1A9E91 |
  db $00, $03, $64, $00, $00                ; $1A9E96 |
  db $00, $F3, $62, $00, $02                ; $1A9E9B |
  db $00, $03, $64, $00, $02                ; $1A9EA0 |
  db $00, $03, $64, $00, $00                ; $1A9EA5 |
  db $00, $FC, $62, $00, $02                ; $1A9EAA |
  db $00, $03, $64, $00, $02                ; $1A9EAF |
  db $00, $03, $64, $00, $00                ; $1A9EB4 |
  db $00, $FB, $62, $00, $02                ; $1A9EB9 |
  db $00, $03, $64, $00, $02                ; $1A9EBE |
  db $00, $03, $64, $00, $00                ; $1A9EC3 |
  db $00, $03, $A2, $02, $02                ; $1A9EC8 |
  db $00, $FD, $62, $00, $02                ; $1A9ECD |
  db $00, $05, $64, $00, $00                ; $1A9ED2 |
  db $08, $05, $65, $00, $00                ; $1A9ED7 |
  db $00, $0D, $74, $00, $00                ; $1A9EDC |
  db $08, $0D, $75, $00, $00                ; $1A9EE1 |
  db $FA, $FA, $9C, $02, $02                ; $1A9EE6 |
  db $FA, $06, $7E, $C2, $02                ; $1A9EEB |
  db $05, $06, $7E, $82, $02                ; $1A9EF0 |
  db $05, $FA, $7E, $02, $02                ; $1A9EF5 |
  db $00, $FD, $62, $00, $02                ; $1A9EFA |
  db $00, $05, $64, $00, $02                ; $1A9EFF |
  db $FA, $F5, $9C, $02, $02                ; $1A9F04 |
  db $FB, $05, $7E, $C2, $02                ; $1A9F09 |
  db $05, $05, $7E, $82, $02                ; $1A9F0E |
  db $06, $F5, $7E, $02, $02                ; $1A9F13 |
  db $00, $FD, $62, $00, $02                ; $1A9F18 |
  db $00, $05, $64, $00, $02                ; $1A9F1D |
  db $F8, $F8, $9C, $02, $02                ; $1A9F22 |
  db $F8, $04, $7E, $C2, $02                ; $1A9F27 |
  db $08, $04, $7E, $82, $02                ; $1A9F2C |
  db $08, $F8, $7E, $02, $02                ; $1A9F31 |
  db $00, $FD, $62, $00, $02                ; $1A9F36 |
  db $00, $05, $64, $00, $02                ; $1A9F3B |
  db $F9, $F7, $9C, $02, $02                ; $1A9F40 |
  db $F9, $05, $7E, $C2, $02                ; $1A9F45 |
  db $07, $05, $7E, $82, $02                ; $1A9F4A |
  db $07, $F7, $7E, $02, $02                ; $1A9F4F |
  db $00, $FD, $62, $00, $02                ; $1A9F54 |
  db $00, $05, $64, $00, $02                ; $1A9F59 |
  db $FA, $F6, $9C, $02, $02                ; $1A9F5E |
  db $FA, $06, $7E, $C2, $02                ; $1A9F63 |
  db $06, $06, $7E, $82, $02                ; $1A9F68 |
  db $06, $F6, $7E, $02, $02                ; $1A9F6D |
  db $00, $FD, $62, $00, $02                ; $1A9F72 |
  db $00, $05, $64, $00, $02                ; $1A9F77 |
  db $F8, $F8, $9C, $02, $02                ; $1A9F7C |
  db $F8, $04, $7E, $C2, $02                ; $1A9F81 |
  db $08, $04, $7E, $82, $02                ; $1A9F86 |
  db $08, $F8, $7E, $02, $02                ; $1A9F8B |
  db $00, $FD, $62, $00, $02                ; $1A9F90 |
  db $00, $05, $64, $00, $02                ; $1A9F95 |
  db $08, $08, $7E, $82, $02                ; $1A9F9A |
  db $F8, $08, $7E, $C2, $02                ; $1A9F9F |
  db $08, $F8, $7E, $02, $02                ; $1A9FA4 |
  db $F8, $F8, $9C, $02, $02                ; $1A9FA9 |
  db $00, $09, $64, $00, $02                ; $1A9FAE |
  db $00, $F9, $62, $00, $02                ; $1A9FB3 |
  db $F8, $08, $7E, $C2, $02                ; $1A9FB8 |
  db $08, $08, $7E, $82, $02                ; $1A9FBD |
  db $08, $F8, $7E, $02, $02                ; $1A9FC2 |
  db $F8, $F8, $9C, $02, $02                ; $1A9FC7 |
  db $00, $09, $64, $00, $02                ; $1A9FCC |
  db $00, $F9, $62, $00, $02                ; $1A9FD1 |
  db $08, $08, $7E, $82, $02                ; $1A9FD6 |
  db $F8, $08, $7E, $C2, $02                ; $1A9FDB |
  db $08, $F8, $7E, $02, $02                ; $1A9FE0 |
  db $F8, $F8, $9C, $02, $02                ; $1A9FE5 |
  db $00, $09, $64, $00, $02                ; $1A9FEA |
  db $00, $F9, $62, $00, $02                ; $1A9FEF |
  db $F8, $F8, $00, $00, $02                ; $1A9FF4 |
  db $08, $F8, $00, $00, $02                ; $1A9FF9 |
  db $F8, $08, $00, $00, $02                ; $1A9FFE |
  db $08, $08, $00, $00, $02                ; $1AA003 |
  db $04, $00, $0A, $00, $00                ; $1AA008 |
  db $00, $08, $1A, $00, $00                ; $1AA00D |
  db $08, $08, $1A, $40, $00                ; $1AA012 |
  db $00, $00, $08, $00, $00                ; $1AA017 |
  db $08, $00, $09, $00, $00                ; $1AA01C |
  db $00, $08, $18, $00, $00                ; $1AA021 |
  db $08, $08, $19, $00, $00                ; $1AA026 |
  db $00, $00, $08, $00, $00                ; $1AA02B |
  db $08, $00, $09, $00, $00                ; $1AA030 |
  db $00, $08, $18, $00, $00                ; $1AA035 |
  db $00, $00, $C2, $00, $00                ; $1AA03A |
  db $08, $00, $C3, $00, $00                ; $1AA03F |
  db $00, $08, $D2, $00, $00                ; $1AA044 |
  db $08, $08, $D3, $00, $00                ; $1AA049 |
  db $F8, $F0, $80, $01, $02                ; $1AA04E |
  db $08, $F0, $82, $01, $02                ; $1AA053 |
  db $F8, $00, $A0, $01, $02                ; $1AA058 |
  db $08, $00, $A2, $01, $02                ; $1AA05D |
  db $00, $F9, $08, $00, $02                ; $1AA062 |
  db $00, $08, $0A, $00, $02                ; $1AA067 |
  db $00, $F8, $08, $00, $02                ; $1AA06C |
  db $00, $08, $0C, $00, $02                ; $1AA071 |
  db $00, $F9, $08, $00, $02                ; $1AA076 |
  db $00, $08, $0E, $00, $02                ; $1AA07B |
  db $00, $F8, $08, $00, $02                ; $1AA080 |
  db $00, $08, $0C, $00, $02                ; $1AA085 |
  db $F8, $F8, $00, $00, $02                ; $1AA08A |
  db $08, $F8, $00, $00, $02                ; $1AA08F |
  db $F8, $08, $00, $00, $02                ; $1AA094 |
  db $08, $08, $00, $00, $02                ; $1AA099 |
  db $F8, $F0, $00, $00, $02                ; $1AA09E |
  db $08, $F0, $00, $00, $02                ; $1AA0A3 |
  db $F8, $00, $00, $00, $02                ; $1AA0A8 |
  db $08, $00, $00, $00, $02                ; $1AA0AD |
  db $F8, $F8, $08, $00, $00                ; $1AA0B2 |
  db $F8, $00, $18, $00, $00                ; $1AA0B7 |
  db $00, $F8, $09, $00, $00                ; $1AA0BC |
  db $00, $00, $19, $00, $00                ; $1AA0C1 |
  db $00, $F8, $09, $00, $00                ; $1AA0C6 |
  db $00, $F8, $09, $00, $00                ; $1AA0CB |
  db $08, $F8, $0A, $00, $02                ; $1AA0D0 |
  db $F8, $08, $0C, $00, $02                ; $1AA0D5 |
  db $08, $08, $0E, $00, $02                ; $1AA0DA |
  db $F8, $F8, $00, $00, $02                ; $1AA0DF |
  db $08, $F8, $00, $00, $02                ; $1AA0E4 |
  db $F8, $08, $00, $00, $02                ; $1AA0E9 |
  db $08, $08, $00, $00, $02                ; $1AA0EE |
  db $00, $F8, $09, $00, $00                ; $1AA0F3 |
  db $00, $00, $19, $00, $00                ; $1AA0F8 |
  db $08, $F8, $0A, $00, $02                ; $1AA0FD |
  db $F8, $08, $0C, $00, $02                ; $1AA102 |
  db $08, $08, $0E, $00, $02                ; $1AA107 |
  db $00, $04, $02, $00, $00                ; $1AA10C |
  db $08, $04, $02, $40, $00                ; $1AA111 |
  db $00, $00, $00, $00, $02                ; $1AA116 |
  db $00, $00, $00, $00, $02                ; $1AA11B |
  db $00, $00, $00, $00, $02                ; $1AA120 |
  db $00, $00, $00, $00, $02                ; $1AA125 |
  db $00, $05, $02, $00, $00                ; $1AA12A |
  db $08, $04, $02, $40, $00                ; $1AA12F |
  db $00, $00, $00, $00, $02                ; $1AA134 |
  db $00, $00, $00, $00, $02                ; $1AA139 |
  db $00, $00, $00, $00, $02                ; $1AA13E |
  db $00, $00, $00, $00, $02                ; $1AA143 |
  db $00, $04, $02, $00, $00                ; $1AA148 |
  db $08, $04, $02, $40, $00                ; $1AA14D |
  db $00, $00, $00, $00, $02                ; $1AA152 |
  db $00, $00, $00, $00, $02                ; $1AA157 |
  db $00, $00, $00, $00, $02                ; $1AA15C |
  db $00, $00, $00, $00, $02                ; $1AA161 |
  db $00, $04, $02, $00, $00                ; $1AA166 |
  db $08, $05, $02, $40, $00                ; $1AA16B |
  db $00, $00, $00, $00, $02                ; $1AA170 |
  db $00, $00, $00, $00, $02                ; $1AA175 |
  db $00, $00, $00, $00, $02                ; $1AA17A |
  db $00, $00, $00, $00, $02                ; $1AA17F |
  db $00, $00, $C0, $00, $00                ; $1AA184 |
  db $08, $00, $C1, $00, $00                ; $1AA189 |
  db $00, $08, $D0, $00, $00                ; $1AA18E |
  db $08, $08, $D1, $00, $00                ; $1AA193 |
  db $F8, $F8, $00, $01, $02                ; $1AA198 |
  db $08, $F8, $00, $01, $02                ; $1AA19D |
  db $F8, $08, $00, $01, $02                ; $1AA1A2 |
  db $08, $08, $00, $01, $02                ; $1AA1A7 |
  db $00, $00, $40, $00, $00                ; $1AA1AC |
  db $08, $00, $41, $00, $00                ; $1AA1B1 |
  db $00, $08, $50, $00, $00                ; $1AA1B6 |
  db $08, $08, $51, $00, $00                ; $1AA1BB |
  db $00, $00, $40, $00, $00                ; $1AA1C0 |
  db $F8, $F8, $6A, $00, $02                ; $1AA1C5 |
  db $08, $F8, $6A, $40, $02                ; $1AA1CA |
  db $F8, $08, $6A, $80, $02                ; $1AA1CF |
  db $08, $08, $6A, $C0, $02                ; $1AA1D4 |
  db $F8, $F8, $6A, $00, $02                ; $1AA1D9 |
  db $FB, $FB, $6A, $00, $02                ; $1AA1DE |
  db $05, $FB, $6A, $40, $02                ; $1AA1E3 |
  db $FB, $05, $6A, $80, $02                ; $1AA1E8 |
  db $05, $05, $6A, $C0, $02                ; $1AA1ED |
  db $FB, $FB, $6A, $00, $02                ; $1AA1F2 |
  db $F8, $F8, $E3, $00, $02                ; $1AA1F7 |
  db $08, $F8, $E3, $00, $02                ; $1AA1FC |
  db $F8, $08, $E3, $00, $02                ; $1AA201 |
  db $08, $08, $E3, $00, $02                ; $1AA206 |
  db $00, $00, $E3, $00, $02                ; $1AA20B |
  db $F8, $F8, $E5, $00, $02                ; $1AA210 |
  db $08, $F8, $E5, $00, $02                ; $1AA215 |
  db $F8, $08, $E5, $00, $02                ; $1AA21A |
  db $08, $08, $E5, $00, $02                ; $1AA21F |
  db $00, $00, $E3, $00, $02                ; $1AA224 |
  db $F8, $F8, $E7, $00, $02                ; $1AA229 |
  db $08, $F8, $E7, $00, $02                ; $1AA22E |
  db $F8, $08, $E7, $00, $02                ; $1AA233 |
  db $08, $08, $E7, $00, $02                ; $1AA238 |
  db $00, $00, $E5, $00, $02                ; $1AA23D |
  db $00, $00, $E7, $00, $02                ; $1AA242 |
  db $00, $00, $E7, $00, $02                ; $1AA247 |
  db $00, $00, $E7, $00, $02                ; $1AA24C |
  db $00, $00, $E7, $00, $02                ; $1AA251 |
  db $00, $00, $E7, $00, $02                ; $1AA256 |
  db $00, $00, $00, $00, $02                ; $1AA25B |
  db $00, $F8, $02, $00, $00                ; $1AA260 |
  db $08, $F8, $03, $00, $00                ; $1AA265 |
  db $00, $00, $12, $00, $00                ; $1AA26A |
  db $08, $00, $13, $00, $00                ; $1AA26F |
  db $F8, $F8, $C0, $01, $02                ; $1AA274 |
  db $08, $F8, $C2, $01, $02                ; $1AA279 |
  db $F8, $08, $E0, $01, $02                ; $1AA27E |
  db $08, $08, $E2, $01, $02                ; $1AA283 |
  db $00, $00, $BD, $00, $00                ; $1AA288 |
  db $00, $00, $BD, $00, $00                ; $1AA28D |
  db $00, $00, $BD, $00, $00                ; $1AA292 |
  db $00, $00, $BD, $00, $00                ; $1AA297 |
  db $08, $E8, $00, $00, $02                ; $1AA29C |
  db $18, $E8, $00, $00, $02                ; $1AA2A1 |
  db $08, $F8, $00, $00, $02                ; $1AA2A6 |
  db $18, $F8, $00, $00, $02                ; $1AA2AB |
  db $E8, $08, $00, $00, $02                ; $1AA2B0 |
  db $F8, $08, $00, $00, $02                ; $1AA2B5 |
  db $E8, $18, $00, $00, $02                ; $1AA2BA |
  db $F8, $18, $00, $00, $02                ; $1AA2BF |
  db $08, $08, $00, $00, $02                ; $1AA2C4 |
  db $18, $08, $00, $00, $02                ; $1AA2C9 |
  db $08, $18, $00, $00, $02                ; $1AA2CE |
  db $18, $18, $00, $00, $02                ; $1AA2D3 |
  db $E8, $E8, $00, $00, $02                ; $1AA2D8 |
  db $F8, $E8, $00, $00, $02                ; $1AA2DD |
  db $E8, $F8, $00, $00, $02                ; $1AA2E2 |
  db $F8, $F8, $00, $00, $02                ; $1AA2E7 |
  db $08, $E8, $00, $00, $02                ; $1AA2EC |
  db $18, $E8, $00, $00, $02                ; $1AA2F1 |
  db $08, $F8, $00, $00, $02                ; $1AA2F6 |
  db $18, $F8, $00, $00, $02                ; $1AA2FB |
  db $E8, $08, $00, $00, $02                ; $1AA300 |
  db $F8, $08, $00, $00, $02                ; $1AA305 |
  db $E8, $18, $00, $00, $02                ; $1AA30A |
  db $F8, $18, $00, $00, $02                ; $1AA30F |
  db $08, $08, $00, $00, $02                ; $1AA314 |
  db $18, $08, $00, $00, $02                ; $1AA319 |
  db $08, $18, $00, $00, $02                ; $1AA31E |
  db $18, $18, $00, $00, $02                ; $1AA323 |
  db $00, $00, $BD, $00, $00                ; $1AA328 |
  db $00, $00, $BD, $00, $00                ; $1AA32D |
  db $00, $00, $BD, $00, $00                ; $1AA332 |
  db $00, $00, $BD, $00, $00                ; $1AA337 |
  db $00, $00, $05, $00, $03                ; $1AA33C |
  db $00, $00, $07, $00, $03                ; $1AA341 |
  db $00, $00, $00, $00, $00                ; $1AA346 |
  db $00, $00, $00, $00, $00                ; $1AA34B |
  db $00, $00, $00, $00, $00                ; $1AA350 |
  db $00, $00, $00, $00, $00                ; $1AA355 |
  db $00, $00, $00, $00, $00                ; $1AA35A |
  db $00, $00, $00, $00, $00                ; $1AA35F |
  db $00, $00, $00, $00, $00                ; $1AA364 |
  db $00, $00, $00, $00, $00                ; $1AA369 |
  db $00, $00, $00, $00, $00                ; $1AA36E |
  db $00, $00, $00, $00, $00                ; $1AA373 |
  db $00, $00, $00, $00, $00                ; $1AA378 |
  db $00, $00, $00, $00, $00                ; $1AA37D |
  db $00, $00, $00, $00, $00                ; $1AA382 |
  db $00, $00, $00, $00, $00                ; $1AA387 |
  db $E8, $E8, $00, $00, $42                ; $1AA38C |
  db $F8, $E8, $00, $00, $42                ; $1AA391 |
  db $E8, $F8, $00, $00, $42                ; $1AA396 |
  db $F8, $F8, $00, $00, $42                ; $1AA39B |
  db $08, $E8, $00, $00, $42                ; $1AA3A0 |
  db $18, $E8, $00, $00, $42                ; $1AA3A5 |
  db $08, $F8, $00, $00, $42                ; $1AA3AA |
  db $18, $F8, $00, $00, $42                ; $1AA3AF |
  db $E8, $08, $00, $00, $42                ; $1AA3B4 |
  db $F8, $08, $00, $00, $42                ; $1AA3B9 |
  db $E8, $18, $00, $00, $42                ; $1AA3BE |
  db $F8, $18, $00, $00, $42                ; $1AA3C3 |
  db $08, $08, $00, $00, $42                ; $1AA3C8 |
  db $18, $08, $00, $00, $42                ; $1AA3CD |
  db $08, $18, $00, $00, $42                ; $1AA3D2 |
  db $18, $18, $00, $00, $42                ; $1AA3D7 |
  db $E8, $E8, $00, $00, $02                ; $1AA3DC |
  db $F8, $E8, $00, $00, $02                ; $1AA3E1 |
  db $E8, $F8, $00, $00, $02                ; $1AA3E6 |
  db $F8, $F8, $00, $00, $02                ; $1AA3EB |
  db $08, $E8, $00, $00, $02                ; $1AA3F0 |
  db $18, $E8, $00, $00, $02                ; $1AA3F5 |
  db $08, $F8, $00, $00, $02                ; $1AA3FA |
  db $18, $F8, $00, $00, $02                ; $1AA3FF |
  db $E8, $08, $00, $00, $02                ; $1AA404 |
  db $F8, $08, $00, $00, $02                ; $1AA409 |
  db $E8, $18, $00, $00, $02                ; $1AA40E |
  db $F8, $18, $00, $00, $02                ; $1AA413 |
  db $08, $08, $00, $00, $02                ; $1AA418 |
  db $18, $08, $00, $00, $02                ; $1AA41D |
  db $08, $18, $00, $00, $02                ; $1AA422 |
  db $18, $18, $00, $00, $02                ; $1AA427 |
  db $E8, $01, $00, $00, $02                ; $1AA42C |
  db $F8, $01, $02, $00, $02                ; $1AA431 |
  db $08, $01, $02, $40, $02                ; $1AA436 |
  db $18, $01, $00, $40, $02                ; $1AA43B |
  db $00, $00, $05, $00, $42                ; $1AA440 |
  db $00, $00, $05, $00, $42                ; $1AA445 |
  db $00, $00, $05, $00, $42                ; $1AA44A |
  db $00, $00, $05, $00, $42                ; $1AA44F |
  db $00, $00, $05, $00, $42                ; $1AA454 |
  db $00, $00, $07, $00, $42                ; $1AA459 |
  db $00, $00, $05, $00, $42                ; $1AA45E |
  db $00, $00, $05, $00, $42                ; $1AA463 |
  db $00, $00, $05, $00, $42                ; $1AA468 |
  db $00, $00, $05, $00, $42                ; $1AA46D |
  db $04, $00, $04, $00, $40                ; $1AA472 |
  db $04, $00, $14, $00, $40                ; $1AA477 |
  db $08, $03, $0B, $00, $00                ; $1AA47C |
  db $00, $03, $0A, $00, $00                ; $1AA481 |
  db $02, $F4, $08, $00, $02                ; $1AA486 |
  db $05, $08, $1E, $00, $00                ; $1AA48B |
  db $0E, $05, $1B, $40, $00                ; $1AA490 |
  db $FD, $05, $1B, $00, $00                ; $1AA495 |
  db $08, $04, $0B, $00, $00                ; $1AA49A |
  db $00, $04, $0A, $00, $00                ; $1AA49F |
  db $02, $F5, $08, $00, $02                ; $1AA4A4 |
  db $00, $08, $1A, $00, $00                ; $1AA4A9 |
  db $0A, $08, $1A, $40, $00                ; $1AA4AE |
  db $0A, $08, $1A, $40, $00                ; $1AA4B3 |
  db $FE, $F8, $08, $00, $02                ; $1AA4B8 |
  db $FE, $05, $1B, $00, $00                ; $1AA4BD |
  db $0B, $09, $1B, $40, $00                ; $1AA4C2 |
  db $08, $05, $0B, $00, $00                ; $1AA4C7 |
  db $00, $05, $0A, $00, $00                ; $1AA4CC |
  db $00, $05, $0A, $00, $00                ; $1AA4D1 |
  db $FE, $F9, $08, $00, $02                ; $1AA4D6 |
  db $00, $07, $1A, $00, $00                ; $1AA4DB |
  db $0D, $08, $1B, $00, $00                ; $1AA4E0 |
  db $08, $04, $0B, $00, $00                ; $1AA4E5 |
  db $00, $04, $0A, $00, $00                ; $1AA4EA |
  db $00, $04, $0A, $00, $00                ; $1AA4EF |
  db $FE, $FA, $08, $00, $02                ; $1AA4F4 |
  db $0A, $07, $1B, $00, $00                ; $1AA4F9 |
  db $03, $08, $1E, $00, $00                ; $1AA4FE |
  db $08, $05, $0B, $00, $00                ; $1AA503 |
  db $00, $05, $0A, $00, $00                ; $1AA508 |
  db $00, $05, $0A, $00, $00                ; $1AA50D |
  db $FD, $F9, $08, $00, $02                ; $1AA512 |
  db $06, $07, $1B, $40, $00                ; $1AA517 |
  db $04, $08, $1E, $00, $00                ; $1AA51C |
  db $08, $05, $0B, $00, $00                ; $1AA521 |
  db $00, $05, $0A, $00, $00                ; $1AA526 |
  db $00, $05, $0A, $00, $00                ; $1AA52B |
  db $FE, $F8, $08, $00, $02                ; $1AA530 |
  db $03, $09, $1A, $80, $00                ; $1AA535 |
  db $08, $08, $1E, $00, $00                ; $1AA53A |
  db $08, $06, $0B, $00, $00                ; $1AA53F |
  db $00, $06, $0A, $00, $00                ; $1AA544 |
  db $00, $06, $0A, $00, $00                ; $1AA549 |
  db $FE, $F7, $08, $00, $02                ; $1AA54E |
  db $01, $07, $1A, $00, $00                ; $1AA553 |
  db $0A, $08, $1A, $40, $00                ; $1AA558 |
  db $08, $06, $0B, $00, $00                ; $1AA55D |
  db $00, $06, $0A, $00, $00                ; $1AA562 |
  db $00, $06, $0A, $00, $00                ; $1AA567 |
  db $00, $F5, $08, $00, $02                ; $1AA56C |
  db $FE, $05, $1B, $00, $00                ; $1AA571 |
  db $0A, $09, $1B, $40, $00                ; $1AA576 |
  db $08, $04, $0B, $00, $00                ; $1AA57B |
  db $00, $04, $0A, $00, $00                ; $1AA580 |
  db $00, $04, $0A, $00, $00                ; $1AA585 |
  db $00, $F6, $08, $00, $02                ; $1AA58A |
  db $00, $08, $1E, $00, $00                ; $1AA58F |
  db $0B, $08, $1E, $00, $00                ; $1AA594 |
  db $08, $05, $0B, $00, $00                ; $1AA599 |
  db $00, $05, $0A, $00, $00                ; $1AA59E |
  db $00, $05, $0A, $00, $00                ; $1AA5A3 |
  db $FF, $F6, $08, $40, $02                ; $1AA5A8 |
  db $00, $08, $1E, $00, $00                ; $1AA5AD |
  db $0B, $08, $1E, $00, $00                ; $1AA5B2 |
  db $08, $05, $0B, $00, $00                ; $1AA5B7 |
  db $00, $05, $0A, $00, $00                ; $1AA5BC |
  db $00, $05, $0A, $00, $00                ; $1AA5C1 |
  db $FF, $F6, $08, $00, $02                ; $1AA5C6 |
  db $00, $08, $1E, $00, $00                ; $1AA5CB |
  db $0B, $08, $1E, $00, $00                ; $1AA5D0 |
  db $08, $05, $0B, $00, $00                ; $1AA5D5 |
  db $00, $05, $0A, $00, $00                ; $1AA5DA |
  db $00, $05, $0A, $00, $00                ; $1AA5DF |
  db $FE, $F7, $08, $00, $02                ; $1AA5E4 |
  db $00, $08, $1E, $00, $00                ; $1AA5E9 |
  db $0B, $08, $1E, $00, $00                ; $1AA5EE |
  db $08, $05, $0B, $00, $00                ; $1AA5F3 |
  db $00, $05, $0A, $00, $00                ; $1AA5F8 |
  db $00, $05, $0A, $00, $00                ; $1AA5FD |
  db $FE, $F7, $08, $00, $02                ; $1AA602 |
  db $00, $08, $1E, $00, $00                ; $1AA607 |
  db $0D, $08, $1E, $00, $00                ; $1AA60C |
  db $09, $05, $0B, $00, $00                ; $1AA611 |
  db $01, $05, $0A, $00, $00                ; $1AA616 |
  db $01, $05, $0A, $00, $00                ; $1AA61B |
  db $FE, $F7, $08, $00, $02                ; $1AA620 |
  db $00, $08, $1E, $00, $00                ; $1AA625 |
  db $0F, $08, $1E, $00, $00                ; $1AA62A |
  db $09, $05, $0B, $00, $00                ; $1AA62F |
  db $01, $05, $0A, $00, $00                ; $1AA634 |
  db $01, $05, $0A, $00, $00                ; $1AA639 |
  db $00, $F7, $08, $00, $02                ; $1AA63E |
  db $00, $08, $1E, $00, $00                ; $1AA643 |
  db $0F, $08, $1E, $00, $00                ; $1AA648 |
  db $0A, $05, $0B, $00, $00                ; $1AA64D |
  db $02, $05, $0A, $00, $00                ; $1AA652 |
  db $02, $05, $0A, $00, $00                ; $1AA657 |
  db $01, $F7, $08, $00, $02                ; $1AA65C |
  db $00, $08, $1E, $00, $00                ; $1AA661 |
  db $0F, $08, $1E, $00, $00                ; $1AA666 |
  db $0B, $05, $0B, $00, $00                ; $1AA66B |
  db $03, $05, $0A, $00, $00                ; $1AA670 |
  db $03, $05, $0A, $00, $00                ; $1AA675 |
  db $01, $F7, $08, $00, $02                ; $1AA67A |
  db $03, $08, $1E, $00, $00                ; $1AA67F |
  db $0F, $08, $1E, $00, $00                ; $1AA684 |
  db $0B, $05, $0B, $00, $00                ; $1AA689 |
  db $03, $05, $0A, $00, $00                ; $1AA68E |
  db $03, $05, $0A, $00, $00                ; $1AA693 |
  db $02, $09, $1B, $00, $00                ; $1AA698 |
  db $FE, $09, $1B, $00, $00                ; $1AA69D |
  db $FD, $FD, $08, $00, $02                ; $1AA6A2 |
  db $06, $08, $0B, $00, $00                ; $1AA6A7 |
  db $00, $08, $0A, $00, $00                ; $1AA6AC |
  db $00, $08, $0A, $00, $00                ; $1AA6B1 |
  db $01, $09, $1B, $00, $00                ; $1AA6B6 |
  db $FD, $09, $1B, $00, $00                ; $1AA6BB |
  db $FD, $FC, $08, $00, $02                ; $1AA6C0 |
  db $07, $08, $0B, $00, $00                ; $1AA6C5 |
  db $00, $08, $0A, $00, $00                ; $1AA6CA |
  db $00, $08, $0A, $00, $00                ; $1AA6CF |
  db $01, $09, $1B, $00, $00                ; $1AA6D4 |
  db $FC, $09, $1B, $00, $00                ; $1AA6D9 |
  db $FE, $FB, $08, $00, $02                ; $1AA6DE |
  db $08, $08, $0B, $00, $00                ; $1AA6E3 |
  db $00, $08, $0A, $00, $00                ; $1AA6E8 |
  db $00, $08, $0A, $00, $00                ; $1AA6ED |
  db $01, $09, $1B, $00, $00                ; $1AA6F2 |
  db $FC, $09, $1B, $00, $00                ; $1AA6F7 |
  db $FF, $FA, $08, $00, $02                ; $1AA6FC |
  db $08, $08, $0B, $00, $00                ; $1AA701 |
  db $00, $08, $0A, $00, $00                ; $1AA706 |
  db $00, $08, $0A, $00, $00                ; $1AA70B |
  db $01, $09, $1B, $00, $00                ; $1AA710 |
  db $FC, $09, $1B, $00, $00                ; $1AA715 |
  db $FF, $FA, $08, $40, $02                ; $1AA71A |
  db $08, $08, $0B, $00, $00                ; $1AA71F |
  db $00, $08, $0A, $00, $00                ; $1AA724 |
  db $00, $08, $0A, $00, $00                ; $1AA729 |
  db $09, $08, $1B, $40, $00                ; $1AA72E |
  db $04, $08, $1B, $40, $00                ; $1AA733 |
  db $08, $01, $0B, $00, $00                ; $1AA738 |
  db $00, $01, $0A, $00, $00                ; $1AA73D |
  db $02, $F2, $08, $00, $02                ; $1AA742 |
  db $02, $F2, $08, $00, $02                ; $1AA747 |
  db $00, $F3, $08, $00, $02                ; $1AA74C |
  db $08, $08, $1A, $80, $00                ; $1AA751 |
  db $03, $08, $1A, $80, $00                ; $1AA756 |
  db $08, $01, $0B, $00, $00                ; $1AA75B |
  db $00, $01, $0A, $00, $00                ; $1AA760 |
  db $00, $01, $0A, $00, $00                ; $1AA765 |
  db $05, $0B, $1E, $00, $00                ; $1AA76A |
  db $00, $0B, $1E, $00, $00                ; $1AA76F |
  db $FF, $FC, $08, $00, $02                ; $1AA774 |
  db $08, $09, $0B, $00, $00                ; $1AA779 |
  db $00, $09, $0A, $00, $00                ; $1AA77E |
  db $00, $09, $0A, $00, $00                ; $1AA783 |
  db $04, $0A, $1A, $00, $00                ; $1AA788 |
  db $FF, $0A, $1A, $00, $00                ; $1AA78D |
  db $FF, $FC, $08, $00, $02                ; $1AA792 |
  db $08, $09, $0B, $00, $00                ; $1AA797 |
  db $00, $09, $0A, $00, $00                ; $1AA79C |
  db $00, $09, $0A, $00, $00                ; $1AA7A1 |
  db $03, $09, $1B, $00, $00                ; $1AA7A6 |
  db $FE, $09, $1B, $00, $00                ; $1AA7AB |
  db $FF, $FC, $08, $00, $02                ; $1AA7B0 |
  db $08, $09, $0B, $00, $00                ; $1AA7B5 |
  db $00, $09, $0A, $00, $00                ; $1AA7BA |
  db $00, $09, $0A, $00, $00                ; $1AA7BF |
  db $FE, $FC, $08, $00, $02                ; $1AA7C4 |
  db $00, $08, $1E, $00, $00                ; $1AA7C9 |
  db $0B, $08, $1E, $00, $00                ; $1AA7CE |
  db $08, $08, $0B, $00, $00                ; $1AA7D3 |
  db $00, $08, $0A, $00, $00                ; $1AA7D8 |
  db $00, $08, $0A, $00, $00                ; $1AA7DD |
  db $FE, $FA, $08, $00, $02                ; $1AA7E2 |
  db $00, $08, $1E, $00, $00                ; $1AA7E7 |
  db $0B, $08, $1E, $00, $00                ; $1AA7EC |
  db $08, $07, $0B, $00, $00                ; $1AA7F1 |
  db $00, $07, $0A, $00, $00                ; $1AA7F6 |
  db $00, $07, $0A, $00, $00                ; $1AA7FB |
  db $00, $08, $1E, $20, $00                ; $1AA800 |
  db $0B, $08, $1E, $20, $00                ; $1AA805 |
  db $08, $05, $0B, $20, $00                ; $1AA80A |
  db $00, $05, $0A, $20, $00                ; $1AA80F |
  db $00, $F6, $08, $00, $02                ; $1AA814 |
  db $00, $F6, $08, $00, $02                ; $1AA819 |
  db $00, $08, $1E, $20, $00                ; $1AA81E |
  db $0B, $08, $1E, $20, $00                ; $1AA823 |
  db $08, $05, $0B, $20, $00                ; $1AA828 |
  db $00, $05, $0A, $20, $00                ; $1AA82D |
  db $FF, $F6, $08, $40, $02                ; $1AA832 |
  db $FF, $F6, $08, $40, $02                ; $1AA837 |
  db $04, $08, $1E, $20, $00                ; $1AA83C |
  db $0F, $08, $1E, $20, $00                ; $1AA841 |
  db $0C, $05, $0B, $20, $00                ; $1AA846 |
  db $04, $05, $0A, $20, $00                ; $1AA84B |
  db $04, $F6, $08, $20, $02                ; $1AA850 |
  db $04, $F6, $08, $20, $02                ; $1AA855 |
  db $F8, $F0, $00, $00, $02                ; $1AA85A |
  db $08, $F0, $00, $00, $02                ; $1AA85F |
  db $F8, $00, $00, $00, $02                ; $1AA864 |
  db $08, $00, $00, $00, $02                ; $1AA869 |
  db $F8, $E4, $3E, $00, $00                ; $1AA86E |
  db $00, $E4, $3F, $00, $00                ; $1AA873 |
  db $08, $E4, $3F, $40, $00                ; $1AA878 |
  db $10, $E4, $3E, $40, $00                ; $1AA87D |
  db $F8, $08, $3E, $00, $00                ; $1AA882 |
  db $00, $08, $3F, $00, $00                ; $1AA887 |
  db $08, $08, $3F, $40, $00                ; $1AA88C |
  db $10, $08, $3E, $40, $00                ; $1AA891 |
  db $F8, $EA, $00, $02, $02                ; $1AA896 |
  db $08, $EA, $00, $02, $02                ; $1AA89B |
  db $F8, $FA, $00, $02, $02                ; $1AA8A0 |
  db $08, $FA, $00, $02, $02                ; $1AA8A5 |
  db $F0, $00, $28, $00, $02                ; $1AA8AA |
  db $00, $00, $29, $00, $02                ; $1AA8AF |
  db $10, $00, $2A, $00, $02                ; $1AA8B4 |
  db $F8, $F8, $C4, $01, $02                ; $1AA8B9 |
  db $08, $F8, $C6, $01, $02                ; $1AA8BE |
  db $F8, $08, $E4, $01, $02                ; $1AA8C3 |
  db $08, $08, $E6, $01, $02                ; $1AA8C8 |
  db $F8, $F8, $C4, $01, $02                ; $1AA8CD |
  db $08, $F8, $C6, $01, $02                ; $1AA8D2 |
  db $F8, $08, $E4, $01, $02                ; $1AA8D7 |
  db $08, $08, $E6, $01, $02                ; $1AA8DC |
  db $F8, $F8, $C4, $01, $02                ; $1AA8E1 |
  db $08, $F8, $C6, $01, $02                ; $1AA8E6 |
  db $F8, $08, $E4, $01, $02                ; $1AA8EB |
  db $08, $08, $E6, $01, $02                ; $1AA8F0 |
  db $F8, $F8, $C0, $01, $02                ; $1AA8F5 |
  db $08, $F8, $C2, $01, $02                ; $1AA8FA |
  db $F8, $08, $E0, $01, $02                ; $1AA8FF |
  db $08, $08, $E2, $01, $02                ; $1AA904 |
  db $00, $F8, $00, $00, $02                ; $1AA909 |
  db $00, $08, $04, $00, $00                ; $1AA90E |
  db $08, $08, $05, $00, $00                ; $1AA913 |
  db $00, $F8, $02, $00, $02                ; $1AA918 |
  db $00, $08, $14, $00, $00                ; $1AA91D |
  db $08, $08, $15, $00, $00                ; $1AA922 |
  db $00, $00, $06, $00, $02                ; $1AA927 |
  db $00, $00, $06, $00, $02                ; $1AA92C |
  db $00, $00, $06, $00, $02                ; $1AA931 |
  db $00, $00, $08, $00, $02                ; $1AA936 |
  db $00, $00, $08, $00, $02                ; $1AA93B |
  db $00, $00, $08, $00, $02                ; $1AA940 |
  db $F8, $00, $42, $04, $02                ; $1AA945 |
  db $08, $00, $42, $44, $02                ; $1AA94A |
  db $F8, $00, $42, $04, $02                ; $1AA94F |
  db $08, $00, $42, $44, $02                ; $1AA954 |
  db $08, $00, $42, $44, $02                ; $1AA959 |
  db $F8, $08, $42, $04, $00                ; $1AA95E |
  db $00, $08, $43, $04, $00                ; $1AA963 |
  db $10, $08, $42, $44, $00                ; $1AA968 |
  db $08, $08, $43, $44, $00                ; $1AA96D |
  db $08, $08, $43, $44, $00                ; $1AA972 |
  db $FC, $08, $55, $00, $00                ; $1AA977 |
  db $00, $08, $55, $00, $00                ; $1AA97C |
  db $04, $08, $55, $40, $00                ; $1AA981 |
  db $08, $08, $55, $40, $00                ; $1AA986 |
  db $0C, $08, $55, $40, $00                ; $1AA98B |
  db $F7, $08, $55, $00, $00                ; $1AA990 |
  db $FE, $07, $55, $00, $00                ; $1AA995 |
  db $0A, $07, $55, $00, $00                ; $1AA99A |
  db $11, $08, $55, $00, $00                ; $1AA99F |
  db $11, $08, $55, $00, $00                ; $1AA9A4 |
  db $F2, $08, $45, $00, $00                ; $1AA9A9 |
  db $FC, $05, $45, $00, $00                ; $1AA9AE |
  db $0C, $05, $45, $00, $00                ; $1AA9B3 |
  db $16, $08, $45, $00, $00                ; $1AA9B8 |
  db $16, $08, $45, $00, $00                ; $1AA9BD |
  db $F0, $08, $45, $00, $00                ; $1AA9C2 |
  db $FA, $03, $45, $00, $00                ; $1AA9C7 |
  db $0E, $03, $45, $00, $00                ; $1AA9CC |
  db $18, $08, $45, $00, $00                ; $1AA9D1 |
  db $18, $08, $45, $00, $00                ; $1AA9D6 |
  db $EE, $08, $54, $00, $00                ; $1AA9DB |
  db $F9, $02, $54, $00, $00                ; $1AA9E0 |
  db $0F, $02, $54, $00, $00                ; $1AA9E5 |
  db $1A, $08, $54, $00, $00                ; $1AA9EA |
  db $1A, $08, $54, $00, $00                ; $1AA9EF |
  db $EC, $08, $54, $00, $00                ; $1AA9F4 |
  db $F8, $01, $54, $00, $00                ; $1AA9F9 |
  db $10, $01, $54, $00, $00                ; $1AA9FE |
  db $1C, $08, $54, $00, $00                ; $1AAA03 |
  db $1C, $08, $54, $00, $00                ; $1AAA08 |
  db $EA, $08, $54, $00, $00                ; $1AAA0D |
  db $F7, $01, $54, $00, $00                ; $1AAA12 |
  db $11, $01, $54, $00, $00                ; $1AAA17 |
  db $1E, $08, $54, $00, $00                ; $1AAA1C |
  db $1E, $08, $54, $00, $00                ; $1AAA21 |
  db $E8, $08, $44, $00, $00                ; $1AAA26 |
  db $F6, $00, $44, $00, $00                ; $1AAA2B |
  db $12, $00, $44, $00, $00                ; $1AAA30 |
  db $20, $08, $44, $00, $00                ; $1AAA35 |
  db $20, $08, $44, $00, $00                ; $1AAA3A |
  db $E6, $08, $44, $00, $00                ; $1AAA3F |
  db $F5, $FF, $44, $00, $00                ; $1AAA44 |
  db $13, $FF, $44, $00, $00                ; $1AAA49 |
  db $22, $08, $44, $00, $00                ; $1AAA4E |
  db $22, $08, $44, $00, $00                ; $1AAA53 |
  db $E4, $08, $E1, $00, $00                ; $1AAA58 |
  db $F4, $FF, $E1, $00, $00                ; $1AAA5D |
  db $14, $FF, $E1, $00, $00                ; $1AAA62 |
  db $24, $08, $E1, $00, $00                ; $1AAA67 |
  db $24, $08, $E1, $00, $00                ; $1AAA6C |
  db $00, $00, $E2, $00, $00                ; $1AAA71 |
  db $00, $00, $E2, $00, $00                ; $1AAA76 |
  db $00, $00, $E2, $00, $00                ; $1AAA7B |
  db $00, $00, $F1, $00, $00                ; $1AAA80 |
  db $00, $00, $F1, $00, $00                ; $1AAA85 |
  db $05, $FF, $E2, $00, $00                ; $1AAA8A |
  db $00, $00, $E1, $00, $00                ; $1AAA8F |
  db $05, $FF, $F1, $00, $00                ; $1AAA94 |
  db $0A, $FE, $E2, $00, $00                ; $1AAA99 |
  db $05, $FF, $E1, $00, $00                ; $1AAA9E |
  db $05, $FF, $E1, $00, $00                ; $1AAAA3 |
  db $0A, $FE, $F1, $00, $00                ; $1AAAA8 |
  db $0A, $FE, $E1, $00, $00                ; $1AAAAD |
  db $0A, $FE, $E1, $00, $00                ; $1AAAB2 |
  db $0A, $FE, $E1, $00, $00                ; $1AAAB7 |
  db $E0, $00, $66, $00, $00                ; $1AAABC |
  db $E8, $00, $67, $00, $00                ; $1AAAC1 |
  db $F0, $00, $67, $00, $00                ; $1AAAC6 |
  db $F8, $00, $67, $00, $00                ; $1AAACB |
  db $00, $00, $67, $00, $00                ; $1AAAD0 |
  db $08, $00, $67, $00, $00                ; $1AAAD5 |
  db $10, $00, $67, $00, $00                ; $1AAADA |
  db $18, $00, $66, $40, $00                ; $1AAADF |
  db $F0, $F0, $6A, $00, $02                ; $1AAAE4 |
  db $00, $F0, $6A, $40, $02                ; $1AAAE9 |
  db $F0, $00, $6A, $80, $02                ; $1AAAEE |
  db $00, $00, $6A, $C0, $02                ; $1AAAF3 |
  db $F0, $F0, $6A, $00, $02                ; $1AAAF8 |
  db $00, $F0, $6A, $40, $02                ; $1AAAFD |
  db $F0, $00, $6A, $80, $02                ; $1AAB02 |
  db $00, $00, $6A, $C0, $02                ; $1AAB07 |
  db $F0, $F0, $6A, $00, $02                ; $1AAB0C |
  db $00, $F0, $6A, $40, $02                ; $1AAB11 |
  db $F0, $00, $6A, $80, $02                ; $1AAB16 |
  db $00, $00, $6A, $C0, $02                ; $1AAB1B |
  db $F8, $F0, $55, $00, $00                ; $1AAB20 |
  db $00, $F0, $55, $00, $00                ; $1AAB25 |
  db $F0, $F8, $55, $00, $00                ; $1AAB2A |
  db $F0, $00, $55, $00, $00                ; $1AAB2F |
  db $F8, $08, $55, $00, $00                ; $1AAB34 |
  db $00, $08, $55, $00, $00                ; $1AAB39 |
  db $08, $00, $55, $00, $00                ; $1AAB3E |
  db $08, $F8, $55, $00, $00                ; $1AAB43 |
  db $F3, $F3, $55, $00, $00                ; $1AAB48 |
  db $05, $F3, $55, $00, $00                ; $1AAB4D |
  db $F3, $05, $55, $00, $00                ; $1AAB52 |
  db $05, $05, $55, $00, $00                ; $1AAB57 |
  db $F7, $EC, $55, $00, $00                ; $1AAB5C |
  db $01, $EC, $55, $00, $00                ; $1AAB61 |
  db $EC, $F7, $55, $00, $00                ; $1AAB66 |
  db $EC, $01, $55, $00, $00                ; $1AAB6B |
  db $F7, $0C, $55, $00, $00                ; $1AAB70 |
  db $01, $0C, $55, $00, $00                ; $1AAB75 |
  db $0C, $01, $55, $00, $00                ; $1AAB7A |
  db $0C, $F7, $55, $00, $00                ; $1AAB7F |
  db $EF, $EF, $55, $00, $00                ; $1AAB84 |
  db $09, $EF, $55, $00, $00                ; $1AAB89 |
  db $EF, $09, $55, $00, $00                ; $1AAB8E |
  db $09, $09, $55, $00, $00                ; $1AAB93 |
  db $F6, $E8, $45, $00, $00                ; $1AAB98 |
  db $02, $E8, $45, $00, $00                ; $1AAB9D |
  db $E8, $F6, $45, $00, $00                ; $1AABA2 |
  db $E8, $02, $45, $00, $00                ; $1AABA7 |
  db $F6, $10, $45, $00, $00                ; $1AABAC |
  db $02, $10, $45, $00, $00                ; $1AABB1 |
  db $10, $02, $45, $00, $00                ; $1AABB6 |
  db $10, $F6, $45, $00, $00                ; $1AABBB |
  db $EC, $EC, $45, $00, $00                ; $1AABC0 |
  db $0C, $EC, $45, $00, $00                ; $1AABC5 |
  db $EC, $0C, $45, $00, $00                ; $1AABCA |
  db $0C, $0C, $45, $00, $00                ; $1AABCF |
  db $F5, $E4, $45, $00, $00                ; $1AABD4 |
  db $03, $E4, $45, $00, $00                ; $1AABD9 |
  db $E4, $F5, $45, $00, $00                ; $1AABDE |
  db $E4, $03, $45, $00, $00                ; $1AABE3 |
  db $F5, $14, $45, $00, $00                ; $1AABE8 |
  db $03, $14, $45, $00, $00                ; $1AABED |
  db $14, $03, $45, $00, $00                ; $1AABF2 |
  db $14, $F5, $45, $00, $00                ; $1AABF7 |
  db $E9, $E9, $45, $00, $00                ; $1AABFC |
  db $0F, $E9, $45, $00, $00                ; $1AAC01 |
  db $E9, $0F, $45, $00, $00                ; $1AAC06 |
  db $0F, $0F, $45, $00, $00                ; $1AAC0B |
  db $F4, $E1, $54, $00, $00                ; $1AAC10 |
  db $04, $E1, $54, $00, $00                ; $1AAC15 |
  db $E0, $F5, $54, $00, $00                ; $1AAC1A |
  db $E0, $05, $54, $00, $00                ; $1AAC1F |
  db $F4, $19, $54, $00, $00                ; $1AAC24 |
  db $04, $19, $54, $00, $00                ; $1AAC29 |
  db $18, $05, $54, $00, $00                ; $1AAC2E |
  db $18, $F5, $54, $00, $00                ; $1AAC33 |
  db $E7, $E8, $54, $00, $00                ; $1AAC38 |
  db $11, $E8, $54, $00, $00                ; $1AAC3D |
  db $E7, $12, $54, $00, $00                ; $1AAC42 |
  db $11, $12, $54, $00, $00                ; $1AAC47 |
  db $F3, $DF, $54, $00, $00                ; $1AAC4C |
  db $05, $DF, $54, $00, $00                ; $1AAC51 |
  db $DD, $F5, $54, $00, $00                ; $1AAC56 |
  db $DD, $07, $54, $00, $00                ; $1AAC5B |
  db $F3, $1D, $54, $00, $00                ; $1AAC60 |
  db $05, $1D, $54, $00, $00                ; $1AAC65 |
  db $1B, $07, $54, $00, $00                ; $1AAC6A |
  db $1B, $F5, $54, $00, $00                ; $1AAC6F |
  db $E5, $E7, $54, $00, $00                ; $1AAC74 |
  db $13, $E7, $54, $00, $00                ; $1AAC79 |
  db $E5, $15, $54, $00, $00                ; $1AAC7E |
  db $13, $15, $54, $00, $00                ; $1AAC83 |
  db $F2, $DD, $44, $00, $00                ; $1AAC88 |
  db $06, $DD, $44, $00, $00                ; $1AAC8D |
  db $DA, $F5, $44, $00, $00                ; $1AAC92 |
  db $DA, $09, $44, $00, $00                ; $1AAC97 |
  db $F2, $21, $44, $00, $00                ; $1AAC9C |
  db $06, $21, $44, $00, $00                ; $1AACA1 |
  db $1E, $09, $44, $00, $00                ; $1AACA6 |
  db $1E, $F5, $44, $00, $00                ; $1AACAB |
  db $E6, $E6, $44, $00, $00                ; $1AACB0 |
  db $15, $E6, $44, $00, $00                ; $1AACB5 |
  db $E6, $18, $44, $00, $00                ; $1AACBA |
  db $15, $18, $44, $00, $00                ; $1AACBF |
  db $F1, $DE, $44, $00, $00                ; $1AACC4 |
  db $07, $DE, $44, $00, $00                ; $1AACC9 |
  db $D9, $F6, $44, $00, $00                ; $1AACCE |
  db $D9, $0C, $44, $00, $00                ; $1AACD3 |
  db $F1, $24, $44, $00, $00                ; $1AACD8 |
  db $07, $24, $44, $00, $00                ; $1AACDD |
  db $1F, $0C, $44, $00, $00                ; $1AACE2 |
  db $1F, $F6, $44, $00, $00                ; $1AACE7 |
  db $E2, $E7, $44, $00, $00                ; $1AACEC |
  db $16, $E7, $44, $00, $00                ; $1AACF1 |
  db $E2, $1B, $44, $00, $00                ; $1AACF6 |
  db $16, $1B, $44, $00, $00                ; $1AACFB |
  db $F1, $DF, $44, $00, $00                ; $1AAD00 |
  db $07, $DF, $44, $00, $00                ; $1AAD05 |
  db $D8, $F8, $44, $00, $00                ; $1AAD0A |
  db $D8, $0E, $44, $00, $00                ; $1AAD0F |
  db $F1, $27, $44, $00, $00                ; $1AAD14 |
  db $07, $27, $44, $00, $00                ; $1AAD19 |
  db $20, $0E, $44, $00, $00                ; $1AAD1E |
  db $20, $F9, $44, $00, $00                ; $1AAD23 |
  db $E1, $E8, $44, $00, $00                ; $1AAD28 |
  db $17, $E8, $44, $00, $00                ; $1AAD2D |
  db $E1, $1E, $44, $00, $00                ; $1AAD32 |
  db $17, $1E, $44, $00, $00                ; $1AAD37 |
  db $F0, $F0, $9C, $00, $02                ; $1AAD3C |
  db $00, $F0, $7E, $00, $02                ; $1AAD41 |
  db $F0, $00, $7E, $C0, $02                ; $1AAD46 |
  db $00, $00, $7E, $80, $02                ; $1AAD4B |
  db $F0, $F0, $9C, $00, $02                ; $1AAD50 |
  db $00, $F0, $7E, $00, $02                ; $1AAD55 |
  db $F0, $00, $7E, $C0, $02                ; $1AAD5A |
  db $00, $00, $7E, $80, $02                ; $1AAD5F |
  db $F0, $F0, $9C, $00, $02                ; $1AAD64 |
  db $00, $F0, $7E, $00, $02                ; $1AAD69 |
  db $F0, $00, $7E, $C0, $02                ; $1AAD6E |
  db $00, $00, $7E, $80, $02                ; $1AAD73 |
  db $00, $08, $1F, $00, $00                ; $1AAD78 |
  db $00, $08, $1F, $00, $00                ; $1AAD7D |
  db $08, $08, $1F, $00, $00                ; $1AAD82 |
  db $08, $08, $1F, $00, $00                ; $1AAD87 |
  db $00, $00, $0E, $00, $00                ; $1AAD8C |
  db $00, $08, $1E, $00, $00                ; $1AAD91 |
  db $08, $00, $0E, $00, $00                ; $1AAD96 |
  db $08, $08, $1E, $00, $00                ; $1AAD9B |
  db $00, $00, $0D, $00, $00                ; $1AADA0 |
  db $00, $08, $1D, $00, $00                ; $1AADA5 |
  db $08, $00, $0D, $00, $00                ; $1AADAA |
  db $08, $08, $1D, $00, $00                ; $1AADAF |
  db $00, $00, $C0, $00, $02                ; $1AADB4 |
  db $00, $00, $BD, $00, $00                ; $1AADB9 |
  db $00, $00, $BD, $00, $00                ; $1AADBE |
  db $00, $00, $BD, $00, $00                ; $1AADC3 |
  db $00, $00, $28, $00, $02                ; $1AADC8 |
  db $00, $00, $2A, $00, $02                ; $1AADCD |
  db $00, $00, $0E, $00, $02                ; $1AADD2 |
  db $01, $0E, $2F, $40, $00                ; $1AADD7 |
  db $06, $0E, $2F, $40, $00                ; $1AADDC |
  db $08, $FA, $2C, $40, $00                ; $1AADE1 |
  db $00, $FA, $2C, $00, $00                ; $1AADE6 |
  db $00, $00, $0E, $00, $02                ; $1AADEB |
  db $01, $0E, $2F, $40, $00                ; $1AADF0 |
  db $06, $0E, $2F, $40, $00                ; $1AADF5 |
  db $08, $FA, $2D, $40, $00                ; $1AADFA |
  db $00, $FA, $2D, $00, $00                ; $1AADFF |
  db $00, $00, $0E, $00, $02                ; $1AAE04 |
  db $01, $0E, $2F, $40, $00                ; $1AAE09 |
  db $06, $0E, $2F, $40, $00                ; $1AAE0E |
  db $08, $FA, $3C, $40, $00                ; $1AAE13 |
  db $00, $FA, $3C, $00, $00                ; $1AAE18 |
  db $00, $00, $0E, $00, $02                ; $1AAE1D |
  db $01, $0E, $2F, $40, $00                ; $1AAE22 |
  db $06, $0E, $2F, $40, $00                ; $1AAE27 |
  db $08, $FA, $3D, $40, $00                ; $1AAE2C |
  db $00, $FA, $3D, $00, $00                ; $1AAE31 |
  db $00, $00, $0E, $00, $02                ; $1AAE36 |
  db $00, $F8, $00, $00, $00                ; $1AAE3B |
  db $08, $F8, $00, $40, $00                ; $1AAE40 |
  db $00, $00, $0E, $00, $02                ; $1AAE45 |
  db $00, $F8, $00, $00, $00                ; $1AAE4A |
  db $08, $F8, $00, $40, $00                ; $1AAE4F |
  db $00, $00, $0E, $00, $02                ; $1AAE54 |
  db $00, $F8, $00, $00, $00                ; $1AAE59 |
  db $08, $F8, $00, $40, $00                ; $1AAE5E |
  db $00, $00, $0E, $00, $02                ; $1AAE63 |
  db $00, $F8, $00, $00, $00                ; $1AAE68 |
  db $08, $F8, $00, $40, $00                ; $1AAE6D |
  db $00, $00, $0E, $00, $02                ; $1AAE72 |
  db $00, $F8, $2C, $00, $00                ; $1AAE77 |
  db $08, $F8, $2C, $40, $00                ; $1AAE7C |
  db $05, $0E, $4F, $40, $00                ; $1AAE81 |
  db $00, $13, $4F, $80, $00                ; $1AAE86 |
  db $08, $13, $4F, $40, $00                ; $1AAE8B |
  db $08, $0B, $4F, $40, $00                ; $1AAE90 |
  db $00, $0B, $4F, $00, $00                ; $1AAE95 |
  db $05, $0D, $4F, $40, $00                ; $1AAE9A |
  db $00, $12, $4F, $80, $00                ; $1AAE9F |
  db $08, $12, $4F, $40, $00                ; $1AAEA4 |
  db $08, $0A, $4F, $40, $00                ; $1AAEA9 |
  db $00, $0A, $4F, $00, $00                ; $1AAEAE |
  db $05, $0C, $4E, $40, $00                ; $1AAEB3 |
  db $00, $11, $4E, $80, $00                ; $1AAEB8 |
  db $08, $11, $4E, $40, $00                ; $1AAEBD |
  db $08, $09, $4E, $40, $00                ; $1AAEC2 |
  db $00, $09, $4E, $00, $00                ; $1AAEC7 |
  db $05, $0B, $4E, $40, $00                ; $1AAECC |
  db $00, $10, $4E, $80, $00                ; $1AAED1 |
  db $08, $10, $4E, $40, $00                ; $1AAED6 |
  db $08, $08, $4E, $40, $00                ; $1AAEDB |
  db $00, $08, $4E, $00, $00                ; $1AAEE0 |
  db $05, $0A, $4D, $40, $00                ; $1AAEE5 |
  db $00, $0F, $4D, $80, $00                ; $1AAEEA |
  db $08, $0F, $4D, $40, $00                ; $1AAEEF |
  db $08, $07, $4D, $40, $00                ; $1AAEF4 |
  db $00, $07, $4D, $00, $00                ; $1AAEF9 |
  db $05, $09, $4D, $40, $00                ; $1AAEFE |
  db $00, $0E, $4D, $80, $00                ; $1AAF03 |
  db $08, $0E, $4D, $40, $00                ; $1AAF08 |
  db $08, $06, $4D, $40, $00                ; $1AAF0D |
  db $00, $06, $4D, $00, $00                ; $1AAF12 |
  db $05, $08, $4C, $00, $00                ; $1AAF17 |
  db $00, $0D, $4C, $00, $00                ; $1AAF1C |
  db $08, $0D, $4C, $00, $00                ; $1AAF21 |
  db $08, $05, $4C, $00, $00                ; $1AAF26 |
  db $00, $05, $4C, $00, $00                ; $1AAF2B |
  db $05, $07, $4C, $00, $00                ; $1AAF30 |
  db $00, $0C, $4C, $00, $00                ; $1AAF35 |
  db $08, $0C, $4C, $00, $00                ; $1AAF3A |
  db $08, $04, $4C, $00, $00                ; $1AAF3F |
  db $00, $04, $4C, $00, $00                ; $1AAF44 |
  db $05, $06, $4C, $00, $00                ; $1AAF49 |
  db $00, $0B, $4C, $00, $00                ; $1AAF4E |
  db $08, $0B, $4C, $00, $00                ; $1AAF53 |
  db $08, $03, $4C, $00, $00                ; $1AAF58 |
  db $00, $03, $4C, $00, $00                ; $1AAF5D |
  db $05, $05, $4C, $00, $00                ; $1AAF62 |
  db $00, $0B, $4C, $00, $00                ; $1AAF67 |
  db $09, $0A, $4C, $00, $00                ; $1AAF6C |
  db $08, $01, $4C, $00, $00                ; $1AAF71 |
  db $FF, $02, $4C, $00, $00                ; $1AAF76 |
  db $05, $04, $4C, $00, $00                ; $1AAF7B |
  db $FF, $09, $4C, $00, $00                ; $1AAF80 |
  db $09, $09, $4C, $00, $00                ; $1AAF85 |
  db $09, $00, $4C, $00, $00                ; $1AAF8A |
  db $FF, $00, $4C, $00, $00                ; $1AAF8F |
  db $00, $00, $9F, $00, $00                ; $1AAF94 |
  db $08, $00, $9F, $40, $00                ; $1AAF99 |
  db $00, $08, $9F, $80, $00                ; $1AAF9E |
  db $08, $08, $9F, $C0, $00                ; $1AAFA3 |
  db $F8, $F8, $4E, $81, $02                ; $1AAFA8 |
  db $08, $F8, $4E, $C1, $02                ; $1AAFAD |
  db $F8, $08, $4E, $01, $02                ; $1AAFB2 |
  db $08, $08, $4E, $41, $02                ; $1AAFB7 |
  db $03, $00, $C4, $00, $00                ; $1AAFBC |
  db $05, $00, $C4, $40, $00                ; $1AAFC1 |
  db $00, $08, $C5, $C0, $00                ; $1AAFC6 |
  db $08, $08, $C5, $80, $00                ; $1AAFCB |
  db $01, $E3, $C4, $0C, $02                ; $1AAFD0 |
  db $10, $10, $44, $0C, $02                ; $1AAFD5 |
  db $00, $10, $42, $0C, $02                ; $1AAFDA |
  db $F0, $10, $40, $0C, $02                ; $1AAFDF |
  db $10, $00, $24, $0C, $02                ; $1AAFE4 |
  db $00, $00, $22, $0C, $02                ; $1AAFE9 |
  db $F0, $00, $20, $0C, $02                ; $1AAFEE |
  db $10, $F0, $04, $0C, $02                ; $1AAFF3 |
  db $00, $F0, $02, $0C, $02                ; $1AAFF8 |
  db $F0, $F0, $00, $0C, $02                ; $1AAFFD |
  db $F0, $F0, $00, $0C, $02                ; $1AB002 |
  db $01, $E3, $C4, $0C, $02                ; $1AB007 |
  db $10, $10, $4A, $0C, $02                ; $1AB00C |
  db $00, $10, $48, $0C, $02                ; $1AB011 |
  db $F0, $10, $46, $0C, $02                ; $1AB016 |
  db $10, $00, $2A, $0C, $02                ; $1AB01B |
  db $00, $00, $28, $0C, $02                ; $1AB020 |
  db $F0, $00, $26, $0C, $02                ; $1AB025 |
  db $10, $F0, $0A, $0C, $02                ; $1AB02A |
  db $00, $F0, $08, $0C, $02                ; $1AB02F |
  db $F0, $F0, $06, $0C, $02                ; $1AB034 |
  db $F0, $F0, $06, $0C, $02                ; $1AB039 |
  db $01, $E3, $C4, $0C, $02                ; $1AB03E |
  db $10, $10, $6E, $0C, $02                ; $1AB043 |
  db $00, $10, $4E, $0C, $02                ; $1AB048 |
  db $F0, $10, $4C, $0C, $02                ; $1AB04D |
  db $10, $00, $8C, $0C, $02                ; $1AB052 |
  db $00, $00, $2E, $0C, $02                ; $1AB057 |
  db $F0, $00, $2C, $0C, $02                ; $1AB05C |
  db $10, $F0, $6C, $0C, $02                ; $1AB061 |
  db $00, $F0, $0E, $0C, $02                ; $1AB066 |
  db $F0, $F0, $0C, $0C, $02                ; $1AB06B |
  db $F0, $F0, $0C, $0C, $02                ; $1AB070 |
  db $01, $E3, $C4, $0C, $02                ; $1AB075 |
  db $08, $04, $8E, $0C, $02                ; $1AB07A |
  db $10, $10, $A4, $0C, $02                ; $1AB07F |
  db $00, $10, $A2, $0C, $02                ; $1AB084 |
  db $F0, $10, $A0, $0C, $02                ; $1AB089 |
  db $10, $00, $84, $0C, $02                ; $1AB08E |
  db $00, $00, $82, $0C, $02                ; $1AB093 |
  db $F0, $00, $80, $0C, $02                ; $1AB098 |
  db $10, $F0, $64, $0C, $02                ; $1AB09D |
  db $00, $F0, $62, $0C, $02                ; $1AB0A2 |
  db $F0, $F0, $60, $0C, $02                ; $1AB0A7 |
  db $01, $E4, $C4, $0C, $02                ; $1AB0AC |
  db $08, $06, $8E, $0C, $02                ; $1AB0B1 |
  db $10, $11, $A4, $0C, $02                ; $1AB0B6 |
  db $00, $11, $A2, $0C, $02                ; $1AB0BB |
  db $F0, $11, $A0, $0C, $02                ; $1AB0C0 |
  db $10, $01, $84, $0C, $02                ; $1AB0C5 |
  db $00, $01, $82, $0C, $02                ; $1AB0CA |
  db $F0, $01, $80, $0C, $02                ; $1AB0CF |
  db $10, $F1, $64, $0C, $02                ; $1AB0D4 |
  db $00, $F1, $62, $0C, $02                ; $1AB0D9 |
  db $F0, $F1, $60, $0C, $02                ; $1AB0DE |
  db $10, $10, $AA, $0E, $02                ; $1AB0E3 |
  db $00, $10, $A8, $0E, $02                ; $1AB0E8 |
  db $F0, $10, $A6, $0E, $02                ; $1AB0ED |
  db $10, $00, $8A, $0E, $02                ; $1AB0F2 |
  db $00, $00, $88, $0E, $02                ; $1AB0F7 |
  db $F0, $00, $86, $0E, $02                ; $1AB0FC |
  db $10, $F0, $6A, $0E, $02                ; $1AB101 |
  db $00, $F0, $68, $0E, $02                ; $1AB106 |
  db $F0, $F0, $66, $0E, $02                ; $1AB10B |
  db $10, $10, $AA, $0E, $02                ; $1AB110 |
  db $00, $10, $AE, $0E, $02                ; $1AB115 |
  db $F0, $10, $AC, $0E, $02                ; $1AB11A |
  db $10, $00, $EE, $0E, $02                ; $1AB11F |
  db $00, $00, $E2, $0E, $02                ; $1AB124 |
  db $F0, $00, $E0, $0E, $02                ; $1AB129 |
  db $10, $F0, $CE, $0E, $02                ; $1AB12E |
  db $00, $F0, $C2, $0E, $02                ; $1AB133 |
  db $F0, $F0, $C0, $0E, $02                ; $1AB138 |
  db $16, $F7, $AE, $41, $02                ; $1AB13D |
  db $0F, $F7, $AC, $01, $02                ; $1AB142 |
  db $F4, $EA, $7E, $01, $02                ; $1AB147 |
  db $E4, $EA, $7C, $01, $02                ; $1AB14C |
  db $10, $F0, $DA, $01, $02                ; $1AB151 |
  db $00, $F0, $D8, $01, $02                ; $1AB156 |
  db $F0, $F0, $D6, $01, $02                ; $1AB15B |
  db $E0, $F0, $D4, $01, $02                ; $1AB160 |
  db $7F, $7F, $00, $00, $00                ; $1AB165 |
  db $7F, $7F, $00, $00, $00                ; $1AB16A |
  db $7F, $7F, $00, $00, $00                ; $1AB16F |
  db $7F, $7F, $00, $00, $00                ; $1AB174 |
  db $0F, $F6, $AC, $01, $02                ; $1AB179 |
  db $0C, $F6, $AE, $01, $02                ; $1AB17E |
  db $E9, $E0, $D0, $01, $02                ; $1AB183 |
  db $E9, $E8, $E0, $01, $02                ; $1AB188 |
  db $F1, $E0, $D1, $01, $02                ; $1AB18D |
  db $F1, $E8, $E1, $01, $02                ; $1AB192 |
  db $10, $F0, $DA, $01, $02                ; $1AB197 |
  db $00, $F0, $D8, $01, $02                ; $1AB19C |
  db $F0, $F0, $D6, $01, $02                ; $1AB1A1 |
  db $E0, $F0, $D4, $01, $02                ; $1AB1A6 |
  db $7F, $7F, $00, $00, $00                ; $1AB1AB |
  db $7F, $7F, $00, $00, $00                ; $1AB1B0 |
  db $0A, $F7, $AE, $01, $02                ; $1AB1B5 |
  db $09, $F7, $CC, $01, $02                ; $1AB1BA |
  db $E9, $E8, $23, $01, $02                ; $1AB1BF |
  db $E9, $D8, $03, $01, $02                ; $1AB1C4 |
  db $F1, $E8, $24, $01, $02                ; $1AB1C9 |
  db $F1, $D8, $04, $01, $02                ; $1AB1CE |
  db $10, $F0, $DA, $01, $02                ; $1AB1D3 |
  db $00, $F0, $D8, $01, $02                ; $1AB1D8 |
  db $F0, $F0, $D6, $01, $02                ; $1AB1DD |
  db $E0, $F0, $D4, $01, $02                ; $1AB1E2 |
  db $7F, $7F, $00, $00, $00                ; $1AB1E7 |
  db $7F, $7F, $00, $00, $00                ; $1AB1EC |
  db $07, $F6, $CC, $01, $02                ; $1AB1F1 |
  db $09, $F8, $CC, $01, $02                ; $1AB1F6 |
  db $EA, $CF, $09, $01, $02                ; $1AB1FB |
  db $EA, $E7, $39, $01, $02                ; $1AB200 |
  db $EA, $D7, $19, $01, $02                ; $1AB205 |
  db $F2, $CF, $0A, $01, $02                ; $1AB20A |
  db $F2, $E7, $3A, $01, $02                ; $1AB20F |
  db $F2, $D7, $1A, $01, $02                ; $1AB214 |
  db $10, $F1, $BA, $01, $02                ; $1AB219 |
  db $00, $F1, $B8, $01, $02                ; $1AB21E |
  db $F0, $F1, $B6, $01, $02                ; $1AB223 |
  db $E0, $F1, $B4, $01, $02                ; $1AB228 |
  db $05, $F5, $CC, $01, $02                ; $1AB22D |
  db $09, $F7, $CC, $01, $02                ; $1AB232 |
  db $EA, $CF, $00, $01, $02                ; $1AB237 |
  db $F2, $CF, $01, $01, $02                ; $1AB23C |
  db $EA, $E7, $30, $01, $02                ; $1AB241 |
  db $EA, $D7, $10, $01, $02                ; $1AB246 |
  db $F2, $E7, $31, $01, $02                ; $1AB24B |
  db $F2, $D7, $11, $01, $02                ; $1AB250 |
  db $10, $F2, $9A, $01, $02                ; $1AB255 |
  db $00, $F2, $98, $01, $02                ; $1AB25A |
  db $F0, $F2, $96, $01, $02                ; $1AB25F |
  db $E0, $F2, $94, $01, $02                ; $1AB264 |
  db $05, $F6, $CC, $01, $02                ; $1AB269 |
  db $0A, $F8, $CC, $01, $02                ; $1AB26E |
  db $F4, $E7, $72, $01, $02                ; $1AB273 |
  db $E4, $E7, $70, $01, $02                ; $1AB278 |
  db $F4, $D7, $52, $01, $02                ; $1AB27D |
  db $E4, $D7, $50, $01, $02                ; $1AB282 |
  db $10, $F2, $9A, $01, $02                ; $1AB287 |
  db $00, $F2, $98, $01, $02                ; $1AB28C |
  db $F0, $F2, $96, $01, $02                ; $1AB291 |
  db $E0, $F2, $94, $01, $02                ; $1AB296 |
  db $7F, $7F, $00, $00, $00                ; $1AB29B |
  db $7F, $7F, $00, $00, $00                ; $1AB2A0 |
  db $06, $F7, $CC, $01, $02                ; $1AB2A5 |
  db $0C, $F9, $AE, $01, $02                ; $1AB2AA |
  db $F3, $EB, $5E, $01, $02                ; $1AB2AF |
  db $E3, $EB, $5C, $01, $02                ; $1AB2B4 |
  db $10, $F2, $9A, $01, $02                ; $1AB2B9 |
  db $00, $F2, $98, $01, $02                ; $1AB2BE |
  db $F0, $F2, $96, $01, $02                ; $1AB2C3 |
  db $E0, $F2, $94, $01, $02                ; $1AB2C8 |
  db $7F, $7F, $00, $00, $00                ; $1AB2CD |
  db $7F, $7F, $00, $00, $00                ; $1AB2D2 |
  db $7F, $7F, $00, $00, $00                ; $1AB2D7 |
  db $7F, $7F, $00, $00, $00                ; $1AB2DC |
  db $08, $F8, $AE, $01, $02                ; $1AB2E1 |
  db $0F, $F8, $AC, $01, $02                ; $1AB2E6 |
  db $E5, $F4, $58, $01, $02                ; $1AB2EB |
  db $F5, $F4, $5A, $01, $02                ; $1AB2F0 |
  db $E0, $F1, $B4, $01, $02                ; $1AB2F5 |
  db $00, $F1, $B8, $01, $02                ; $1AB2FA |
  db $F0, $F1, $B6, $01, $02                ; $1AB2FF |
  db $F5, $04, $7A, $01, $02                ; $1AB304 |
  db $E5, $04, $78, $01, $02                ; $1AB309 |
  db $10, $F1, $BA, $01, $02                ; $1AB30E |
  db $7F, $7F, $00, $00, $00                ; $1AB313 |
  db $7F, $7F, $00, $00, $00                ; $1AB318 |
  db $0D, $F8, $AC, $01, $02                ; $1AB31D |
  db $14, $F8, $AE, $41, $02                ; $1AB322 |
  db $E5, $F5, $44, $01, $02                ; $1AB327 |
  db $F5, $F5, $46, $01, $02                ; $1AB32C |
  db $00, $F1, $B8, $01, $02                ; $1AB331 |
  db $E0, $F1, $B4, $01, $02                ; $1AB336 |
  db $F0, $F1, $B6, $01, $02                ; $1AB33B |
  db $E5, $FD, $54, $01, $02                ; $1AB340 |
  db $F5, $0D, $76, $01, $02                ; $1AB345 |
  db $E5, $0D, $74, $01, $02                ; $1AB34A |
  db $F5, $FD, $56, $01, $02                ; $1AB34F |
  db $10, $F1, $BA, $01, $02                ; $1AB354 |
  db $14, $F9, $AE, $41, $02                ; $1AB359 |
  db $17, $F7, $CC, $41, $02                ; $1AB35E |
  db $F5, $F4, $0E, $01, $02                ; $1AB363 |
  db $F5, $FC, $1E, $01, $02                ; $1AB368 |
  db $E5, $F4, $0C, $01, $02                ; $1AB36D |
  db $00, $F0, $D8, $01, $02                ; $1AB372 |
  db $F0, $F0, $D6, $01, $02                ; $1AB377 |
  db $E0, $F0, $D4, $01, $02                ; $1AB37C |
  db $E5, $FC, $1C, $01, $02                ; $1AB381 |
  db $F5, $0C, $3E, $01, $02                ; $1AB386 |
  db $E5, $0C, $3C, $01, $02                ; $1AB38B |
  db $10, $F0, $DA, $01, $02                ; $1AB390 |
  db $16, $F7, $CC, $41, $02                ; $1AB395 |
  db $17, $F6, $CC, $41, $02                ; $1AB39A |
  db $F2, $F3, $07, $01, $02                ; $1AB39F |
  db $EA, $F3, $06, $01, $02                ; $1AB3A4 |
  db $00, $F0, $D8, $01, $02                ; $1AB3A9 |
  db $F0, $F0, $D6, $01, $02                ; $1AB3AE |
  db $E0, $F0, $D4, $01, $02                ; $1AB3B3 |
  db $EA, $03, $26, $01, $02                ; $1AB3B8 |
  db $F2, $03, $27, $01, $02                ; $1AB3BD |
  db $10, $F0, $DA, $01, $02                ; $1AB3C2 |
  db $7F, $7F, $00, $00, $00                ; $1AB3C7 |
  db $7F, $7F, $00, $00, $00                ; $1AB3CC |
  db $18, $F6, $CC, $41, $02                ; $1AB3D1 |
  db $13, $F7, $AE, $41, $02                ; $1AB3D6 |
  db $E6, $FA, $B0, $01, $02                ; $1AB3DB |
  db $E6, $EA, $90, $01, $02                ; $1AB3E0 |
  db $F6, $FA, $B2, $01, $02                ; $1AB3E5 |
  db $F6, $EA, $92, $01, $02                ; $1AB3EA |
  db $00, $F0, $D8, $01, $02                ; $1AB3EF |
  db $E0, $F0, $D4, $01, $02                ; $1AB3F4 |
  db $F0, $F0, $D6, $01, $02                ; $1AB3F9 |
  db $10, $F0, $DA, $01, $02                ; $1AB3FE |
  db $7F, $7F, $00, $00, $00                ; $1AB403 |
  db $7F, $7F, $00, $00, $00                ; $1AB408 |
  db $07, $F3, $AE, $01, $02                ; $1AB40D |
  db $E5, $07, $40, $00, $02                ; $1AB412 |
  db $ED, $FF, $31, $00, $02                ; $1AB417 |
  db $F5, $EF, $12, $00, $02                ; $1AB41C |
  db $E5, $EF, $10, $00, $02                ; $1AB421 |
  db $05, $E7, $04, $00, $02                ; $1AB426 |
  db $F5, $E7, $02, $00, $02                ; $1AB42B |
  db $7F, $7F, $00, $00, $00                ; $1AB430 |
  db $7F, $7F, $00, $00, $00                ; $1AB435 |
  db $7F, $7F, $00, $00, $00                ; $1AB43A |
  db $7F, $7F, $00, $00, $00                ; $1AB43F |
  db $7F, $7F, $00, $00, $00                ; $1AB444 |
  db $08, $F0, $AC, $01, $02                ; $1AB449 |
  db $F3, $04, $48, $00, $02                ; $1AB44E |
  db $F3, $F4, $28, $00, $02                ; $1AB453 |
  db $E3, $F4, $26, $00, $02                ; $1AB458 |
  db $03, $E4, $0A, $00, $02                ; $1AB45D |
  db $F3, $E4, $08, $00, $02                ; $1AB462 |
  db $E3, $E4, $06, $00, $02                ; $1AB467 |
  db $7F, $7F, $00, $00, $00                ; $1AB46C |
  db $7F, $7F, $00, $00, $00                ; $1AB471 |
  db $7F, $7F, $00, $00, $00                ; $1AB476 |
  db $7F, $7F, $00, $00, $00                ; $1AB47B |
  db $7F, $7F, $00, $00, $00                ; $1AB480 |
  db $EE, $F4, $4E, $00, $02                ; $1AB485 |
  db $0A, $E6, $AE, $41, $02                ; $1AB48A |
  db $FE, $F4, $0E, $00, $02                ; $1AB48F |
  db $EE, $EC, $3E, $00, $02                ; $1AB494 |
  db $DE, $EC, $3C, $00, $02                ; $1AB499 |
  db $CE, $EC, $3A, $00, $02                ; $1AB49E |
  db $FE, $E4, $0C, $00, $02                ; $1AB4A3 |
  db $EE, $E4, $2E, $00, $02                ; $1AB4A8 |
  db $DE, $E4, $2C, $00, $02                ; $1AB4AD |
  db $CE, $E4, $2A, $00, $02                ; $1AB4B2 |
  db $7F, $7F, $00, $00, $00                ; $1AB4B7 |
  db $7F, $7F, $00, $00, $00                ; $1AB4BC |
  db $14, $E8, $CC, $41, $02                ; $1AB4C1 |
  db $06, $F0, $CE, $00, $02                ; $1AB4C6 |
  db $F6, $F0, $CC, $00, $02                ; $1AB4CB |
  db $E6, $F0, $CA, $00, $02                ; $1AB4D0 |
  db $D6, $F0, $C8, $00, $02                ; $1AB4D5 |
  db $06, $E0, $AE, $00, $02                ; $1AB4DA |
  db $F6, $E0, $AC, $00, $02                ; $1AB4DF |
  db $E6, $E0, $AA, $00, $02                ; $1AB4E4 |
  db $D6, $E0, $A8, $00, $02                ; $1AB4E9 |
  db $7F, $7F, $00, $00, $00                ; $1AB4EE |
  db $7F, $7F, $00, $00, $00                ; $1AB4F3 |
  db $7F, $7F, $00, $00, $00                ; $1AB4F8 |
  db $08, $E8, $7C, $40, $02                ; $1AB4FD |
  db $18, $E8, $7A, $40, $02                ; $1AB502 |
  db $08, $F0, $8C, $40, $02                ; $1AB507 |
  db $18, $F0, $8A, $40, $02                ; $1AB50C |
  db $F8, $F0, $8E, $00, $02                ; $1AB511 |
  db $E8, $F0, $8C, $00, $02                ; $1AB516 |
  db $D8, $F0, $8A, $00, $02                ; $1AB51B |
  db $F8, $E0, $6E, $00, $02                ; $1AB520 |
  db $E8, $E8, $7C, $00, $02                ; $1AB525 |
  db $D8, $E8, $7A, $00, $02                ; $1AB52A |
  db $7F, $7F, $00, $00, $00                ; $1AB52F |
  db $7F, $7F, $00, $00, $00                ; $1AB534 |
  db $EC, $F0, $CE, $40, $02                ; $1AB539 |
  db $FC, $F0, $CC, $40, $02                ; $1AB53E |
  db $0C, $F0, $CA, $40, $02                ; $1AB543 |
  db $1C, $F0, $C8, $40, $02                ; $1AB548 |
  db $EC, $E0, $AE, $40, $02                ; $1AB54D |
  db $FC, $E0, $AC, $40, $02                ; $1AB552 |
  db $0C, $E0, $AA, $40, $02                ; $1AB557 |
  db $1C, $E0, $A8, $40, $02                ; $1AB55C |
  db $7F, $7F, $00, $00, $00                ; $1AB561 |
  db $7F, $7F, $00, $00, $00                ; $1AB566 |
  db $7F, $7F, $00, $00, $00                ; $1AB56B |
  db $7F, $7F, $00, $00, $00                ; $1AB570 |
  db $F8, $F0, $4E, $40, $02                ; $1AB575 |
  db $E8, $F0, $0E, $40, $02                ; $1AB57A |
  db $F8, $E8, $3E, $40, $02                ; $1AB57F |
  db $08, $E8, $3C, $40, $02                ; $1AB584 |
  db $18, $E8, $3A, $40, $02                ; $1AB589 |
  db $E8, $E0, $0C, $40, $02                ; $1AB58E |
  db $F8, $E0, $2E, $40, $02                ; $1AB593 |
  db $08, $E0, $2C, $40, $02                ; $1AB598 |
  db $18, $E0, $2A, $40, $02                ; $1AB59D |
  db $7F, $7F, $00, $00, $00                ; $1AB5A2 |
  db $7F, $7F, $00, $00, $00                ; $1AB5A7 |
  db $7F, $7F, $00, $00, $00                ; $1AB5AC |
  db $E7, $F0, $C6, $40, $02                ; $1AB5B1 |
  db $E7, $E0, $A6, $40, $02                ; $1AB5B6 |
  db $F7, $F0, $84, $40, $02                ; $1AB5BB |
  db $07, $F0, $82, $40, $02                ; $1AB5C0 |
  db $17, $E8, $70, $40, $02                ; $1AB5C5 |
  db $F7, $E0, $64, $40, $02                ; $1AB5CA |
  db $07, $E0, $62, $40, $02                ; $1AB5CF |
  db $17, $E0, $60, $40, $02                ; $1AB5D4 |
  db $7F, $7F, $00, $00, $00                ; $1AB5D9 |
  db $7F, $7F, $00, $00, $00                ; $1AB5DE |
  db $7F, $7F, $00, $00, $00                ; $1AB5E3 |
  db $7F, $7F, $00, $00, $00                ; $1AB5E8 |
  db $00, $F0, $C4, $40, $02                ; $1AB5ED |
  db $10, $F0, $C2, $40, $02                ; $1AB5F2 |
  db $20, $F0, $C0, $40, $02                ; $1AB5F7 |
  db $00, $E0, $A4, $40, $02                ; $1AB5FC |
  db $10, $E0, $A2, $40, $02                ; $1AB601 |
  db $20, $E8, $B0, $40, $02                ; $1AB606 |
  db $F0, $F0, $C4, $00, $02                ; $1AB60B |
  db $E0, $F0, $C2, $00, $02                ; $1AB610 |
  db $D0, $F0, $C0, $00, $02                ; $1AB615 |
  db $F0, $E0, $A4, $00, $02                ; $1AB61A |
  db $E0, $E0, $A2, $00, $02                ; $1AB61F |
  db $D0, $E8, $B0, $00, $02                ; $1AB624 |
  db $07, $F0, $C6, $00, $02                ; $1AB629 |
  db $07, $E0, $A6, $00, $02                ; $1AB62E |
  db $F7, $F0, $84, $00, $02                ; $1AB633 |
  db $E7, $F0, $82, $00, $02                ; $1AB638 |
  db $D7, $E8, $70, $00, $02                ; $1AB63D |
  db $F7, $E0, $64, $00, $02                ; $1AB642 |
  db $E7, $E0, $62, $00, $02                ; $1AB647 |
  db $D7, $E0, $60, $00, $02                ; $1AB64C |
  db $7F, $7F, $00, $00, $00                ; $1AB651 |
  db $7F, $7F, $00, $00, $00                ; $1AB656 |
  db $7F, $7F, $00, $00, $00                ; $1AB65B |
  db $7F, $7F, $00, $00, $00                ; $1AB660 |
  db $F8, $F0, $4E, $00, $02                ; $1AB665 |
  db $08, $F0, $0E, $00, $02                ; $1AB66A |
  db $F8, $E8, $3E, $00, $02                ; $1AB66F |
  db $E8, $E8, $3C, $00, $02                ; $1AB674 |
  db $D8, $E8, $3A, $00, $02                ; $1AB679 |
  db $08, $E0, $0C, $00, $02                ; $1AB67E |
  db $F8, $E0, $2E, $00, $02                ; $1AB683 |
  db $E8, $E0, $2C, $00, $02                ; $1AB688 |
  db $D8, $E0, $2A, $00, $02                ; $1AB68D |
  db $7F, $7F, $00, $00, $00                ; $1AB692 |
  db $7F, $7F, $00, $00, $00                ; $1AB697 |
  db $7F, $7F, $00, $00, $00                ; $1AB69C |
  db $06, $F0, $CE, $00, $02                ; $1AB6A1 |
  db $F6, $F0, $CC, $00, $02                ; $1AB6A6 |
  db $E6, $F0, $CA, $00, $02                ; $1AB6AB |
  db $D6, $F0, $C8, $00, $02                ; $1AB6B0 |
  db $06, $E0, $AE, $00, $02                ; $1AB6B5 |
  db $F6, $E0, $AC, $00, $02                ; $1AB6BA |
  db $E6, $E0, $AA, $00, $02                ; $1AB6BF |
  db $D6, $E0, $A8, $00, $02                ; $1AB6C4 |
  db $7F, $7F, $00, $00, $00                ; $1AB6C9 |
  db $7F, $7F, $00, $00, $00                ; $1AB6CE |
  db $7F, $7F, $00, $00, $00                ; $1AB6D3 |
  db $7F, $7F, $00, $00, $00                ; $1AB6D8 |
  db $10, $F8, $5A, $00, $02                ; $1AB6DD |
  db $00, $F8, $68, $00, $02                ; $1AB6E2 |
  db $F0, $F8, $66, $00, $02                ; $1AB6E7 |
  db $10, $08, $5C, $00, $02                ; $1AB6EC |
  db $00, $08, $88, $00, $02                ; $1AB6F1 |
  db $F0, $08, $86, $00, $02                ; $1AB6F6 |
  db $10, $F8, $E4, $00, $02                ; $1AB6FB |
  db $00, $F8, $E2, $00, $02                ; $1AB700 |
  db $F0, $F8, $E0, $00, $02                ; $1AB705 |
  db $10, $08, $EA, $00, $02                ; $1AB70A |
  db $00, $08, $E8, $00, $02                ; $1AB70F |
  db $F0, $08, $E6, $00, $02                ; $1AB714 |
  db $F8, $00, $EC, $01, $02                ; $1AB719 |
  db $08, $00, $EE, $01, $02                ; $1AB71E |
  db $F8, $00, $EC, $00, $02                ; $1AB723 |
  db $00, $00, $ED, $00, $02                ; $1AB728 |
  db $C8, $C8, $00, $01, $02                ; $1AB72D |
  db $E8, $C8, $04, $01, $02                ; $1AB732 |
  db $08, $C8, $08, $01, $02                ; $1AB737 |
  db $28, $C8, $0C, $01, $02                ; $1AB73C |
  db $C8, $E8, $40, $01, $02                ; $1AB741 |
  db $E8, $E8, $44, $01, $02                ; $1AB746 |
  db $08, $E8, $48, $01, $02                ; $1AB74B |
  db $28, $E8, $4C, $01, $02                ; $1AB750 |
  db $C8, $08, $80, $01, $02                ; $1AB755 |
  db $E8, $08, $84, $01, $02                ; $1AB75A |
  db $08, $08, $88, $01, $02                ; $1AB75F |
  db $28, $08, $8C, $01, $02                ; $1AB764 |
  db $C8, $28, $C0, $01, $02                ; $1AB769 |
  db $E8, $28, $C4, $01, $02                ; $1AB76E |
  db $08, $28, $C8, $01, $02                ; $1AB773 |
  db $28, $28, $CC, $01, $02                ; $1AB778 |
  db $00, $F8, $F6, $03, $00                ; $1AB77D |
  db $F8, $F8, $F5, $03, $00                ; $1AB782 |
  db $F0, $F8, $F4, $03, $00                ; $1AB787 |
  db $E8, $F8, $F3, $03, $00                ; $1AB78C |
  db $00, $00, $46, $02, $02                ; $1AB791 |
  db $F0, $00, $44, $02, $02                ; $1AB796 |
  db $E0, $00, $42, $02, $02                ; $1AB79B |
  db $7F, $7F, $00, $00, $00                ; $1AB7A0 |
  db $EA, $08, $AC, $01, $02                ; $1AB7A5 |
  db $00, $F8, $F6, $03, $00                ; $1AB7AA |
  db $F8, $F8, $F5, $03, $00                ; $1AB7AF |
  db $F0, $F8, $F4, $03, $00                ; $1AB7B4 |
  db $E8, $F8, $F3, $03, $00                ; $1AB7B9 |
  db $00, $00, $46, $02, $02                ; $1AB7BE |
  db $F0, $00, $44, $02, $02                ; $1AB7C3 |
  db $E0, $00, $42, $02, $02                ; $1AB7C8 |
  db $F0, $08, $AE, $41, $02                ; $1AB7CD |
  db $00, $F8, $F6, $03, $00                ; $1AB7D2 |
  db $F8, $F8, $F5, $03, $00                ; $1AB7D7 |
  db $F0, $F8, $F4, $03, $00                ; $1AB7DC |
  db $E8, $F8, $F3, $03, $00                ; $1AB7E1 |
  db $00, $00, $46, $02, $02                ; $1AB7E6 |
  db $F0, $00, $44, $02, $02                ; $1AB7EB |
  db $E0, $00, $42, $02, $02                ; $1AB7F0 |
  db $F4, $08, $CC, $41, $02                ; $1AB7F5 |
  db $00, $F8, $F6, $03, $00                ; $1AB7FA |
  db $F8, $F8, $F5, $03, $00                ; $1AB7FF |
  db $F0, $F8, $F4, $03, $00                ; $1AB804 |
  db $E8, $F8, $F3, $03, $00                ; $1AB809 |
  db $00, $00, $46, $02, $02                ; $1AB80E |
  db $F0, $00, $44, $02, $02                ; $1AB813 |
  db $E0, $00, $42, $02, $02                ; $1AB818 |
  db $08, $08, $35, $02, $00                ; $1AB81D |
  db $00, $08, $34, $02, $00                ; $1AB822 |
  db $08, $00, $25, $02, $00                ; $1AB827 |
  db $00, $00, $24, $02, $00                ; $1AB82C |
  db $08, $08, $FA, $03, $00                ; $1AB831 |
  db $00, $08, $F9, $03, $00                ; $1AB836 |
  db $08, $00, $F8, $03, $00                ; $1AB83B |
  db $00, $00, $F7, $03, $00                ; $1AB840 |
  db $FB, $06, $4C, $07, $02                ; $1AB845 |
  db $EC, $FC, $48, $09, $02                ; $1AB84A |
  db $E0, $F0, $44, $09, $02                ; $1AB84F |
  db $F0, $F0, $46, $09, $02                ; $1AB854 |
  db $FC, $FC, $4A, $09, $02                ; $1AB859 |
  db $E8, $01, $4E, $07, $02                ; $1AB85E |
  db $F0, $E8, $42, $09, $02                ; $1AB863 |
  db $E0, $E8, $40, $09, $02                ; $1AB868 |
  db $F9, $06, $4C, $07, $02                ; $1AB86D |
  db $FC, $FC, $4A, $09, $02                ; $1AB872 |
  db $EC, $FC, $48, $09, $02                ; $1AB877 |
  db $EE, $04, $4E, $07, $02                ; $1AB87C |
  db $E0, $F0, $44, $09, $02                ; $1AB881 |
  db $F0, $F0, $46, $09, $02                ; $1AB886 |
  db $F0, $E8, $42, $09, $02                ; $1AB88B |
  db $E0, $E8, $40, $09, $02                ; $1AB890 |
  db $FC, $FC, $4A, $09, $02                ; $1AB895 |
  db $EC, $FC, $48, $09, $02                ; $1AB89A |
  db $F2, $06, $4C, $07, $02                ; $1AB89F |
  db $F0, $03, $4E, $07, $02                ; $1AB8A4 |
  db $F0, $E8, $42, $09, $02                ; $1AB8A9 |
  db $E0, $E8, $40, $09, $02                ; $1AB8AE |
  db $F0, $F0, $46, $09, $02                ; $1AB8B3 |
  db $E0, $F0, $44, $09, $02                ; $1AB8B8 |
  db $EE, $06, $4C, $07, $02                ; $1AB8BD |
  db $EC, $FC, $48, $09, $02                ; $1AB8C2 |
  db $FC, $FC, $4A, $09, $02                ; $1AB8C7 |
  db $F8, $03, $4E, $07, $02                ; $1AB8CC |
  db $F0, $E8, $42, $09, $02                ; $1AB8D1 |
  db $E0, $E8, $40, $09, $02                ; $1AB8D6 |
  db $F0, $F0, $46, $09, $02                ; $1AB8DB |
  db $E0, $F0, $44, $09, $02                ; $1AB8E0 |
  db $FC, $FC, $4A, $09, $02                ; $1AB8E5 |
  db $FD, $01, $4C, $07, $02                ; $1AB8EA |
  db $E9, $06, $4E, $07, $02                ; $1AB8EF |
  db $EC, $FC, $48, $09, $02                ; $1AB8F4 |
  db $F0, $E8, $42, $09, $02                ; $1AB8F9 |
  db $E0, $E8, $40, $09, $02                ; $1AB8FE |
  db $F0, $F0, $46, $09, $02                ; $1AB903 |
  db $E0, $F0, $44, $09, $02                ; $1AB908 |
  db $EB, $07, $4C, $07, $02                ; $1AB90D |
  db $EC, $FC, $48, $09, $02                ; $1AB912 |
  db $FC, $FC, $4A, $09, $02                ; $1AB917 |
  db $F8, $03, $4E, $07, $02                ; $1AB91C |
  db $F0, $E8, $42, $09, $02                ; $1AB921 |
  db $E0, $E8, $40, $09, $02                ; $1AB926 |
  db $F0, $F0, $46, $09, $02                ; $1AB92B |
  db $E0, $F0, $44, $09, $02                ; $1AB930 |
  db $E0, $F0, $44, $09, $02                ; $1AB935 |
  db $F0, $F0, $46, $09, $02                ; $1AB93A |
  db $EC, $FC, $48, $09, $02                ; $1AB93F |
  db $FC, $FC, $4A, $09, $02                ; $1AB944 |
  db $F4, $07, $4C, $07, $02                ; $1AB949 |
  db $F3, $02, $4E, $07, $02                ; $1AB94E |
  db $F0, $E8, $42, $09, $02                ; $1AB953 |
  db $E0, $E8, $40, $09, $02                ; $1AB958 |
  db $E0, $F0, $44, $09, $02                ; $1AB95D |
  db $F0, $F0, $46, $09, $02                ; $1AB962 |
  db $F8, $06, $4C, $07, $02                ; $1AB967 |
  db $EC, $FC, $48, $09, $02                ; $1AB96C |
  db $EA, $01, $4E, $07, $02                ; $1AB971 |
  db $FC, $FC, $4A, $09, $02                ; $1AB976 |
  db $F0, $E8, $42, $09, $02                ; $1AB97B |
  db $E0, $E8, $40, $09, $02                ; $1AB980 |
  db $E0, $F0, $44, $09, $02                ; $1AB985 |
  db $F0, $F0, $46, $09, $02                ; $1AB98A |
  db $EC, $FC, $48, $09, $02                ; $1AB98F |
  db $FC, $FC, $4A, $09, $02                ; $1AB994 |
  db $F4, $07, $4C, $07, $02                ; $1AB999 |
  db $F3, $02, $4E, $07, $02                ; $1AB99E |
  db $F0, $E8, $42, $09, $02                ; $1AB9A3 |
  db $E0, $E8, $40, $09, $02                ; $1AB9A8 |
  db $F3, $E6, $42, $09, $02                ; $1AB9AD |
  db $E3, $E6, $40, $09, $02                ; $1AB9B2 |
  db $F3, $EE, $46, $09, $02                ; $1AB9B7 |
  db $E3, $EE, $44, $09, $02                ; $1AB9BC |
  db $FC, $FC, $4A, $09, $02                ; $1AB9C1 |
  db $EC, $FC, $48, $09, $02                ; $1AB9C6 |
  db $F4, $07, $4C, $07, $02                ; $1AB9CB |
  db $F3, $02, $4E, $07, $02                ; $1AB9D0 |
  db $EC, $04, $4C, $07, $02                ; $1AB9D5 |
  db $DC, $F0, $40, $09, $02                ; $1AB9DA |
  db $FC, $F0, $44, $09, $02                ; $1AB9DF |
  db $FC, $F0, $44, $09, $02                ; $1AB9E4 |
  db $EC, $F0, $42, $09, $02                ; $1AB9E9 |
  db $FC, $F8, $4A, $09, $02                ; $1AB9EE |
  db $EC, $F8, $48, $09, $02                ; $1AB9F3 |
  db $EA, $02, $4E, $07, $02                ; $1AB9F8 |
  db $EA, $FD, $4C, $07, $02                ; $1AB9FD |
  db $DD, $FA, $40, $09, $02                ; $1ABA02 |
  db $FD, $FA, $44, $09, $02                ; $1ABA07 |
  db $FD, $FA, $44, $09, $02                ; $1ABA0C |
  db $ED, $FA, $42, $09, $02                ; $1ABA11 |
  db $FC, $F8, $4A, $09, $02                ; $1ABA16 |
  db $EC, $F8, $48, $09, $02                ; $1ABA1B |
  db $E8, $FA, $4E, $07, $02                ; $1ABA20 |
  db $EA, $FE, $4C, $07, $02                ; $1ABA25 |
  db $DA, $F8, $40, $09, $02                ; $1ABA2A |
  db $FA, $F8, $44, $09, $02                ; $1ABA2F |
  db $FA, $F8, $44, $09, $02                ; $1ABA34 |
  db $EA, $F8, $42, $09, $02                ; $1ABA39 |
  db $FC, $FA, $4A, $09, $02                ; $1ABA3E |
  db $EC, $FA, $48, $09, $02                ; $1ABA43 |
  db $E8, $FB, $4E, $07, $02                ; $1ABA48 |
  db $EA, $03, $4C, $07, $02                ; $1ABA4D |
  db $DE, $F5, $40, $09, $02                ; $1ABA52 |
  db $EE, $FD, $46, $09, $02                ; $1ABA57 |
  db $DE, $FD, $44, $09, $02                ; $1ABA5C |
  db $FC, $FF, $4A, $09, $02                ; $1ABA61 |
  db $EC, $FF, $48, $09, $02                ; $1ABA66 |
  db $ED, $F5, $42, $09, $02                ; $1ABA6B |
  db $E8, $00, $4E, $07, $02                ; $1ABA70 |
  db $EA, $05, $4C, $07, $02                ; $1ABA75 |
  db $ED, $F3, $42, $09, $02                ; $1ABA7A |
  db $DD, $F3, $40, $09, $02                ; $1ABA7F |
  db $ED, $FB, $46, $09, $02                ; $1ABA84 |
  db $DD, $FB, $44, $09, $02                ; $1ABA89 |
  db $FB, $02, $4A, $09, $02                ; $1ABA8E |
  db $EB, $02, $48, $09, $02                ; $1ABA93 |
  db $E8, $02, $4E, $07, $02                ; $1ABA98 |
  db $EA, $06, $4C, $07, $02                ; $1ABA9D |
  db $DE, $F2, $40, $09, $02                ; $1ABAA2 |
  db $EE, $FA, $46, $09, $02                ; $1ABAA7 |
  db $DE, $FA, $44, $09, $02                ; $1ABAAC |
  db $FC, $04, $4A, $09, $02                ; $1ABAB1 |
  db $EC, $04, $48, $09, $02                ; $1ABAB6 |
  db $EE, $F3, $42, $09, $02                ; $1ABABB |
  db $E8, $04, $4E, $07, $02                ; $1ABAC0 |
  db $DE, $F0, $40, $09, $02                ; $1ABAC5 |
  db $DE, $F8, $44, $09, $02                ; $1ABACA |
  db $EE, $F0, $42, $09, $02                ; $1ABACF |
  db $EE, $F8, $46, $09, $02                ; $1ABAD4 |
  db $EA, $06, $4C, $07, $02                ; $1ABAD9 |
  db $FC, $05, $4A, $09, $02                ; $1ABADE |
  db $EC, $05, $48, $09, $02                ; $1ABAE3 |
  db $E8, $04, $4E, $07, $02                ; $1ABAE8 |
  db $EA, $05, $4C, $07, $02                ; $1ABAED |
  db $EF, $ED, $42, $09, $02                ; $1ABAF2 |
  db $DF, $ED, $40, $09, $02                ; $1ABAF7 |
  db $EF, $F5, $46, $09, $02                ; $1ABAFC |
  db $DF, $F5, $44, $09, $02                ; $1ABB01 |
  db $FC, $04, $4A, $09, $02                ; $1ABB06 |
  db $EC, $04, $48, $09, $02                ; $1ABB0B |
  db $E8, $02, $4E, $07, $02                ; $1ABB10 |
  db $EA, $05, $4C, $07, $02                ; $1ABB15 |
  db $F0, $EE, $42, $09, $02                ; $1ABB1A |
  db $E0, $EE, $40, $09, $02                ; $1ABB1F |
  db $F0, $F6, $46, $09, $02                ; $1ABB24 |
  db $E0, $F6, $44, $09, $02                ; $1ABB29 |
  db $FC, $03, $4A, $09, $02                ; $1ABB2E |
  db $EC, $03, $48, $09, $02                ; $1ABB33 |
  db $E8, $02, $4E, $07, $02                ; $1ABB38 |
  db $EA, $05, $4C, $07, $02                ; $1ABB3D |
  db $F1, $EF, $42, $09, $02                ; $1ABB42 |
  db $E1, $EF, $40, $09, $02                ; $1ABB47 |
  db $F1, $F7, $46, $09, $02                ; $1ABB4C |
  db $E1, $F7, $44, $09, $02                ; $1ABB51 |
  db $FC, $04, $4A, $09, $02                ; $1ABB56 |
  db $EC, $04, $48, $09, $02                ; $1ABB5B |
  db $E8, $02, $4E, $07, $02                ; $1ABB60 |
  db $EA, $04, $4C, $07, $02                ; $1ABB65 |
  db $F2, $EF, $42, $09, $02                ; $1ABB6A |
  db $E2, $EF, $40, $09, $02                ; $1ABB6F |
  db $F2, $F7, $46, $09, $02                ; $1ABB74 |
  db $E2, $F7, $44, $09, $02                ; $1ABB79 |
  db $FC, $05, $4A, $09, $02                ; $1ABB7E |
  db $EC, $05, $48, $09, $02                ; $1ABB83 |
  db $E8, $01, $4E, $07, $02                ; $1ABB88 |
  db $EA, $05, $4C, $07, $02                ; $1ABB8D |
  db $F2, $F1, $42, $09, $02                ; $1ABB92 |
  db $E2, $F1, $40, $09, $02                ; $1ABB97 |
  db $F2, $F9, $46, $09, $02                ; $1ABB9C |
  db $E2, $F9, $44, $09, $02                ; $1ABBA1 |
  db $FC, $04, $4A, $09, $02                ; $1ABBA6 |
  db $EC, $04, $48, $09, $02                ; $1ABBAB |
  db $E8, $02, $4E, $07, $02                ; $1ABBB0 |
  db $EA, $06, $4C, $07, $02                ; $1ABBB5 |
  db $F1, $F3, $42, $09, $02                ; $1ABBBA |
  db $E1, $F3, $40, $09, $02                ; $1ABBBF |
  db $F1, $FB, $46, $09, $02                ; $1ABBC4 |
  db $E1, $FB, $44, $09, $02                ; $1ABBC9 |
  db $FC, $03, $4A, $09, $02                ; $1ABBCE |
  db $EC, $03, $48, $09, $02                ; $1ABBD3 |
  db $E8, $03, $4E, $07, $02                ; $1ABBD8 |
  db $EA, $07, $4C, $07, $02                ; $1ABBDD |
  db $F1, $F3, $42, $09, $02                ; $1ABBE2 |
  db $E1, $F3, $40, $09, $02                ; $1ABBE7 |
  db $F1, $FB, $46, $09, $02                ; $1ABBEC |
  db $E1, $FB, $44, $09, $02                ; $1ABBF1 |
  db $FC, $04, $4A, $09, $02                ; $1ABBF6 |
  db $EC, $04, $48, $09, $02                ; $1ABBFB |
  db $E8, $04, $4E, $07, $02                ; $1ABC00 |
  db $EA, $07, $4C, $07, $02                ; $1ABC05 |
  db $F1, $F1, $42, $09, $02                ; $1ABC0A |
  db $E1, $F1, $40, $09, $02                ; $1ABC0F |
  db $F1, $F9, $46, $09, $02                ; $1ABC14 |
  db $E1, $F9, $44, $09, $02                ; $1ABC19 |
  db $FC, $04, $4A, $09, $02                ; $1ABC1E |
  db $EC, $04, $48, $09, $02                ; $1ABC23 |
  db $E8, $04, $4E, $07, $02                ; $1ABC28 |
  db $EA, $07, $4C, $07, $02                ; $1ABC2D |
  db $F1, $F0, $42, $09, $02                ; $1ABC32 |
  db $E1, $F0, $40, $09, $02                ; $1ABC37 |
  db $F1, $F8, $46, $09, $02                ; $1ABC3C |
  db $E1, $F8, $44, $09, $02                ; $1ABC41 |
  db $FC, $05, $4A, $09, $02                ; $1ABC46 |
  db $EC, $05, $48, $09, $02                ; $1ABC4B |
  db $E8, $04, $4E, $07, $02                ; $1ABC50 |
  db $EA, $07, $4C, $07, $02                ; $1ABC55 |
  db $F1, $F2, $42, $09, $02                ; $1ABC5A |
  db $E1, $F2, $40, $09, $02                ; $1ABC5F |
  db $F1, $FA, $46, $09, $02                ; $1ABC64 |
  db $E1, $FA, $44, $09, $02                ; $1ABC69 |
  db $FC, $05, $4A, $09, $02                ; $1ABC6E |
  db $EC, $05, $48, $09, $02                ; $1ABC73 |
  db $E8, $04, $4E, $07, $02                ; $1ABC78 |
  db $EA, $07, $4C, $07, $02                ; $1ABC7D |
  db $F1, $F2, $42, $09, $02                ; $1ABC82 |
  db $E1, $F2, $40, $09, $02                ; $1ABC87 |
  db $F1, $FA, $46, $09, $02                ; $1ABC8C |
  db $E1, $FA, $44, $09, $02                ; $1ABC91 |
  db $FC, $05, $4A, $09, $02                ; $1ABC96 |
  db $EC, $05, $48, $09, $02                ; $1ABC9B |
  db $E8, $04, $4E, $07, $02                ; $1ABCA0 |
  db $EB, $F2, $42, $09, $02                ; $1ABCA5 |
  db $EB, $FA, $46, $09, $02                ; $1ABCAA |
  db $E3, $F2, $40, $09, $02                ; $1ABCAF |
  db $E3, $FA, $44, $09, $02                ; $1ABCB4 |
  db $EA, $07, $4C, $07, $02                ; $1ABCB9 |
  db $FC, $05, $4A, $09, $02                ; $1ABCBE |
  db $EC, $05, $48, $09, $02                ; $1ABCC3 |
  db $E8, $04, $4E, $07, $02                ; $1ABCC8 |
  db $ED, $F2, $42, $09, $02                ; $1ABCCD |
  db $ED, $FA, $46, $09, $02                ; $1ABCD2 |
  db $E5, $F2, $40, $09, $02                ; $1ABCD7 |
  db $E5, $FA, $44, $09, $02                ; $1ABCDC |
  db $EA, $07, $4C, $07, $02                ; $1ABCE1 |
  db $FC, $05, $4A, $09, $02                ; $1ABCE6 |
  db $EC, $05, $48, $09, $02                ; $1ABCEB |
  db $E8, $04, $4E, $07, $02                ; $1ABCF0 |
  db $ED, $F2, $42, $09, $02                ; $1ABCF5 |
  db $ED, $FA, $46, $09, $02                ; $1ABCFA |
  db $E5, $F2, $40, $09, $02                ; $1ABCFF |
  db $E5, $FA, $44, $09, $02                ; $1ABD04 |
  db $EA, $07, $4C, $07, $02                ; $1ABD09 |
  db $FC, $05, $4A, $09, $02                ; $1ABD0E |
  db $EC, $05, $48, $09, $02                ; $1ABD13 |
  db $E8, $04, $4E, $07, $02                ; $1ABD18 |
  db $ED, $FA, $42, $09, $02                ; $1ABD1D |
  db $ED, $02, $46, $09, $02                ; $1ABD22 |
  db $E5, $FA, $40, $09, $02                ; $1ABD27 |
  db $E5, $02, $44, $09, $02                ; $1ABD2C |
  db $EA, $07, $4C, $07, $02                ; $1ABD31 |
  db $FC, $05, $4A, $09, $02                ; $1ABD36 |
  db $EC, $05, $48, $09, $02                ; $1ABD3B |
  db $E8, $04, $4E, $07, $02                ; $1ABD40 |
  db $ED, $FB, $42, $09, $02                ; $1ABD45 |
  db $ED, $03, $46, $09, $02                ; $1ABD4A |
  db $E5, $FB, $40, $09, $02                ; $1ABD4F |
  db $E5, $03, $44, $09, $02                ; $1ABD54 |
  db $EA, $07, $4C, $07, $02                ; $1ABD59 |
  db $FC, $05, $4A, $09, $02                ; $1ABD5E |
  db $EC, $05, $48, $09, $02                ; $1ABD63 |
  db $E8, $04, $4E, $07, $02                ; $1ABD68 |
  db $ED, $F3, $42, $09, $02                ; $1ABD6D |
  db $ED, $FB, $46, $09, $02                ; $1ABD72 |
  db $E5, $F3, $40, $09, $02                ; $1ABD77 |
  db $E5, $FB, $44, $09, $02                ; $1ABD7C |
  db $EA, $07, $4C, $07, $02                ; $1ABD81 |
  db $FC, $05, $4A, $09, $02                ; $1ABD86 |
  db $EC, $05, $48, $09, $02                ; $1ABD8B |
  db $E8, $04, $4E, $07, $02                ; $1ABD90 |
  db $ED, $F0, $42, $09, $02                ; $1ABD95 |
  db $ED, $F8, $46, $09, $02                ; $1ABD9A |
  db $E5, $F0, $40, $09, $02                ; $1ABD9F |
  db $E5, $F8, $44, $09, $02                ; $1ABDA4 |
  db $EA, $07, $4C, $07, $02                ; $1ABDA9 |
  db $FC, $05, $4A, $09, $02                ; $1ABDAE |
  db $EC, $05, $48, $09, $02                ; $1ABDB3 |
  db $E8, $04, $4E, $07, $02                ; $1ABDB8 |
  db $E7, $F6, $42, $09, $02                ; $1ABDBD |
  db $E7, $FE, $46, $09, $02                ; $1ABDC2 |
  db $DF, $F6, $40, $09, $02                ; $1ABDC7 |
  db $DF, $FE, $44, $09, $02                ; $1ABDCC |
  db $EA, $07, $4C, $07, $02                ; $1ABDD1 |
  db $FC, $05, $4A, $09, $02                ; $1ABDD6 |
  db $EC, $05, $48, $09, $02                ; $1ABDDB |
  db $E8, $04, $4E, $07, $02                ; $1ABDE0 |
  db $EB, $07, $4C, $07, $02                ; $1ABDE5 |
  db $EC, $F8, $42, $09, $02                ; $1ABDEA |
  db $EC, $00, $46, $09, $02                ; $1ABDEF |
  db $DC, $F8, $40, $09, $02                ; $1ABDF4 |
  db $DC, $00, $44, $09, $02                ; $1ABDF9 |
  db $FD, $05, $4A, $09, $02                ; $1ABDFE |
  db $ED, $05, $48, $09, $02                ; $1ABE03 |
  db $E9, $04, $4E, $07, $02                ; $1ABE08 |
  db $EC, $07, $4C, $07, $02                ; $1ABE0D |
  db $EC, $FB, $42, $09, $02                ; $1ABE12 |
  db $EC, $03, $46, $09, $02                ; $1ABE17 |
  db $DC, $FB, $40, $09, $02                ; $1ABE1C |
  db $DC, $03, $44, $09, $02                ; $1ABE21 |
  db $FE, $05, $4A, $09, $02                ; $1ABE26 |
  db $EE, $05, $48, $09, $02                ; $1ABE2B |
  db $EA, $04, $4E, $07, $02                ; $1ABE30 |
  db $F0, $F0, $00, $01, $02                ; $1ABE35 |
  db $00, $F0, $02, $01, $02                ; $1ABE3A |
  db $F0, $00, $20, $01, $02                ; $1ABE3F |
  db $00, $00, $22, $01, $02                ; $1ABE44 |
  db $F0, $F8, $04, $01, $02                ; $1ABE49 |
  db $00, $F8, $06, $01, $02                ; $1ABE4E |
  db $F0, $F8, $04, $01, $02                ; $1ABE53 |
  db $00, $F8, $06, $01, $02                ; $1ABE58 |
  db $F0, $F0, $04, $01, $02                ; $1ABE5D |
  db $00, $F0, $06, $01, $02                ; $1ABE62 |
  db $F0, $00, $24, $01, $02                ; $1ABE67 |
  db $00, $00, $26, $01, $02                ; $1ABE6C |
  db $EB, $F2, $42, $09, $02                ; $1ABE71 |
  db $EB, $FA, $46, $09, $02                ; $1ABE76 |
  db $E3, $F2, $40, $09, $02                ; $1ABE7B |
  db $E3, $FA, $44, $09, $02                ; $1ABE80 |
  db $ED, $F2, $42, $09, $02                ; $1ABE85 |
  db $ED, $FA, $46, $09, $02                ; $1ABE8A |
  db $E5, $F2, $40, $09, $02                ; $1ABE8F |
  db $E5, $FA, $44, $09, $02                ; $1ABE94 |
  db $ED, $F2, $42, $09, $02                ; $1ABE99 |
  db $ED, $FA, $46, $09, $02                ; $1ABE9E |
  db $E5, $F2, $40, $09, $02                ; $1ABEA3 |
  db $E5, $FA, $44, $09, $02                ; $1ABEA8 |
  db $ED, $FA, $42, $09, $02                ; $1ABEAD |
  db $ED, $02, $46, $09, $02                ; $1ABEB2 |
  db $E5, $FA, $40, $09, $02                ; $1ABEB7 |
  db $E5, $02, $44, $09, $02                ; $1ABEBC |
  db $ED, $FB, $42, $09, $02                ; $1ABEC1 |
  db $ED, $03, $46, $09, $02                ; $1ABEC6 |
  db $E5, $FB, $40, $09, $02                ; $1ABECB |
  db $E5, $03, $44, $09, $02                ; $1ABED0 |
  db $ED, $F3, $42, $09, $02                ; $1ABED5 |
  db $ED, $FB, $46, $09, $02                ; $1ABEDA |
  db $E5, $F3, $40, $09, $02                ; $1ABEDF |
  db $E5, $FB, $44, $09, $02                ; $1ABEE4 |
  db $ED, $F0, $42, $09, $02                ; $1ABEE9 |
  db $ED, $F8, $46, $09, $02                ; $1ABEEE |
  db $E5, $F0, $40, $09, $02                ; $1ABEF3 |
  db $E5, $F8, $44, $09, $02                ; $1ABEF8 |
  db $E7, $F6, $42, $09, $02                ; $1ABEFD |
  db $E7, $FE, $46, $09, $02                ; $1ABF02 |
  db $DF, $F6, $40, $09, $02                ; $1ABF07 |
  db $DF, $FE, $44, $09, $02                ; $1ABF0C |
  db $EC, $F8, $42, $09, $02                ; $1ABF11 |
  db $EC, $00, $46, $09, $02                ; $1ABF16 |
  db $DC, $F8, $40, $09, $02                ; $1ABF1B |
  db $DC, $00, $44, $09, $02                ; $1ABF20 |
  db $EC, $FB, $42, $09, $02                ; $1ABF25 |
  db $EC, $03, $46, $09, $02                ; $1ABF2A |
  db $DC, $FB, $40, $09, $02                ; $1ABF2F |
  db $DC, $03, $44, $09, $02                ; $1ABF34 |
  db $00, $E8, $B2, $0C, $02                ; $1ABF39 |
  db $00, $F8, $D2, $0C, $00                ; $1ABF3E |
  db $00, $D8, $92, $0C, $02                ; $1ABF43 |
  db $E8, $E0, $D3, $0C, $00                ; $1ABF48 |
  db $E8, $E8, $83, $0C, $00                ; $1ABF4D |
  db $E0, $E8, $82, $0C, $00                ; $1ABF52 |
  db $00, $E0, $A2, $0C, $02                ; $1ABF57 |
  db $F0, $F0, $C0, $0C, $02                ; $1ABF5C |
  db $F0, $E0, $A0, $0C, $02                ; $1ABF61 |
  db $F0, $D0, $80, $0C, $02                ; $1ABF66 |
  db $E8, $E8, $87, $0C, $00                ; $1ABF6B |
  db $E8, $E0, $D7, $0C, $00                ; $1ABF70 |
  db $E8, $D8, $C7, $0C, $00                ; $1ABF75 |
  db $00, $D8, $96, $0C, $02                ; $1ABF7A |
  db $00, $E0, $A6, $0C, $02                ; $1ABF7F |
  db $F8, $F0, $C5, $0C, $02                ; $1ABF84 |
  db $F0, $F0, $C4, $0C, $02                ; $1ABF89 |
  db $F0, $E0, $A4, $0C, $02                ; $1ABF8E |
  db $F0, $D0, $84, $0C, $02                ; $1ABF93 |
  db $F0, $D0, $84, $0C, $02                ; $1ABF98 |
  db $E8, $D8, $8B, $0C, $00                ; $1ABF9D |
  db $E8, $E8, $DB, $0C, $00                ; $1ABFA2 |
  db $E8, $E0, $CB, $0C, $00                ; $1ABFA7 |
  db $F8, $F0, $C9, $0C, $02                ; $1ABFAC |
  db $00, $D8, $9A, $0C, $02                ; $1ABFB1 |
  db $00, $E0, $AA, $0C, $02                ; $1ABFB6 |
  db $F0, $F0, $C8, $0C, $02                ; $1ABFBB |
  db $F0, $E0, $A8, $0C, $02                ; $1ABFC0 |
  db $F0, $D0, $88, $0C, $02                ; $1ABFC5 |
  db $F0, $D0, $88, $0C, $02                ; $1ABFCA |
  db $E8, $F0, $DF, $0C, $00                ; $1ABFCF |
  db $E8, $E8, $9F, $0C, $00                ; $1ABFD4 |
  db $E8, $E0, $8F, $0C, $00                ; $1ABFD9 |
  db $00, $F8, $DE, $0C, $00                ; $1ABFDE |
  db $00, $D8, $9E, $0C, $00                ; $1ABFE3 |
  db $00, $E0, $AE, $0C, $02                ; $1ABFE8 |
  db $00, $E8, $BE, $0C, $02                ; $1ABFED |
  db $F0, $F0, $CC, $0C, $02                ; $1ABFF2 |
  db $F0, $E0, $AC, $0C, $02                ; $1ABFF7 |
  db $F0, $D0, $8C, $0C, $02                ; $1ABFFC |
  db $02, $F9, $72, $0C, $00                ; $1AC001 |
  db $EA, $F9, $73, $0C, $00                ; $1AC006 |
  db $EA, $F1, $FF, $0C, $00                ; $1AC00B |
  db $EA, $E9, $EF, $0C, $00                ; $1AC010 |
  db $02, $D9, $FE, $0C, $00                ; $1AC015 |
  db $F2, $D1, $EC, $0C, $02                ; $1AC01A |
  db $02, $E1, $42, $0C, $02                ; $1AC01F |
  db $02, $E9, $52, $0C, $02                ; $1AC024 |
  db $F2, $F1, $60, $0C, $02                ; $1AC029 |
  db $F2, $E1, $40, $0C, $02                ; $1AC02E |
  db $02, $F9, $76, $0C, $00                ; $1AC033 |
  db $EA, $F9, $47, $0C, $00                ; $1AC038 |
  db $EA, $F1, $37, $0C, $00                ; $1AC03D |
  db $EA, $E9, $27, $0C, $00                ; $1AC042 |
  db $FA, $D9, $35, $0C, $02                ; $1AC047 |
  db $02, $E9, $56, $0C, $02                ; $1AC04C |
  db $F2, $F1, $64, $0C, $02                ; $1AC051 |
  db $F2, $E1, $44, $0C, $02                ; $1AC056 |
  db $F2, $D1, $24, $0C, $02                ; $1AC05B |
  db $F2, $D1, $24, $0C, $02                ; $1AC060 |
  db $02, $F9, $7A, $0C, $00                ; $1AC065 |
  db $EA, $F9, $4B, $0C, $00                ; $1AC06A |
  db $EA, $F1, $3B, $0C, $00                ; $1AC06F |
  db $EA, $E9, $2B, $0C, $00                ; $1AC074 |
  db $02, $E9, $5A, $0C, $02                ; $1AC079 |
  db $F2, $F1, $68, $0C, $02                ; $1AC07E |
  db $F2, $E1, $48, $0C, $02                ; $1AC083 |
  db $F2, $D1, $28, $0C, $02                ; $1AC088 |
  db $FA, $D9, $39, $0C, $02                ; $1AC08D |
  db $FA, $D9, $39, $0C, $02                ; $1AC092 |
  db $EA, $F9, $4F, $0C, $00                ; $1AC097 |
  db $EA, $F1, $3F, $0C, $00                ; $1AC09C |
  db $EA, $E9, $2F, $0C, $00                ; $1AC0A1 |
  db $02, $F9, $7E, $0C, $00                ; $1AC0A6 |
  db $02, $E9, $5E, $0C, $02                ; $1AC0AB |
  db $F2, $F1, $6C, $0C, $02                ; $1AC0B0 |
  db $F2, $E1, $4C, $0C, $02                ; $1AC0B5 |
  db $F2, $D1, $2C, $0C, $02                ; $1AC0BA |
  db $FA, $D9, $3D, $0C, $02                ; $1AC0BF |
  db $FA, $D9, $3D, $0C, $02                ; $1AC0C4 |
  db $F0, $F0, $00, $01, $02                ; $1AC0C9 |
  db $00, $F0, $02, $01, $02                ; $1AC0CE |
  db $F0, $00, $20, $01, $02                ; $1AC0D3 |
  db $00, $00, $22, $01, $02                ; $1AC0D8 |
  db $F0, $F0, $04, $01, $02                ; $1AC0DD |
  db $00, $F0, $06, $01, $02                ; $1AC0E2 |
  db $F0, $00, $24, $01, $02                ; $1AC0E7 |
  db $00, $00, $26, $01, $02                ; $1AC0EC |
  db $F0, $F0, $08, $01, $02                ; $1AC0F1 |
  db $00, $F0, $0A, $01, $02                ; $1AC0F6 |
  db $F0, $00, $28, $01, $02                ; $1AC0FB |
  db $00, $00, $2A, $01, $02                ; $1AC100 |
  db $F0, $F0, $0C, $01, $02                ; $1AC105 |
  db $00, $F0, $0E, $01, $02                ; $1AC10A |
  db $F0, $00, $2C, $01, $02                ; $1AC10F |
  db $00, $00, $2E, $01, $02                ; $1AC114 |
  db $08, $00, $A2, $05, $02                ; $1AC119 |
  db $F8, $00, $A0, $05, $02                ; $1AC11E |
  db $08, $F0, $82, $05, $02                ; $1AC123 |
  db $F8, $F0, $80, $05, $02                ; $1AC128 |
  db $08, $00, $A6, $05, $02                ; $1AC12D |
  db $F8, $00, $A4, $05, $02                ; $1AC132 |
  db $08, $F0, $86, $05, $02                ; $1AC137 |
  db $F8, $F0, $84, $05, $02                ; $1AC13C |
  db $08, $00, $AA, $05, $02                ; $1AC141 |
  db $F8, $00, $A8, $05, $02                ; $1AC146 |
  db $08, $F0, $8A, $05, $02                ; $1AC14B |
  db $F8, $F0, $88, $05, $02                ; $1AC150 |
  db $FF, $F6, $04, $0A, $02                ; $1AC155 |
  db $F7, $F6, $03, $0A, $02                ; $1AC15A |
  db $FF, $E6, $01, $0A, $02                ; $1AC15F |
  db $F7, $E6, $00, $0A, $02                ; $1AC164 |
  db $FB, $06, $4C, $07, $02                ; $1AC169 |
  db $EC, $FC, $48, $09, $02                ; $1AC16E |
  db $E0, $F0, $44, $09, $02                ; $1AC173 |
  db $F0, $F0, $46, $09, $02                ; $1AC178 |
  db $FC, $FC, $4A, $09, $02                ; $1AC17D |
  db $E8, $01, $4E, $07, $02                ; $1AC182 |
  db $F0, $E8, $42, $09, $02                ; $1AC187 |
  db $E0, $E8, $40, $09, $02                ; $1AC18C |
  db $FF, $F5, $0A, $0A, $02                ; $1AC191 |
  db $F7, $F5, $09, $0A, $02                ; $1AC196 |
  db $FF, $E5, $07, $0A, $02                ; $1AC19B |
  db $F7, $E5, $06, $0A, $02                ; $1AC1A0 |
  db $F9, $06, $4C, $07, $02                ; $1AC1A5 |
  db $FC, $FC, $4A, $09, $02                ; $1AC1AA |
  db $EC, $FC, $48, $09, $02                ; $1AC1AF |
  db $EE, $04, $4E, $07, $02                ; $1AC1B4 |
  db $E0, $F0, $44, $09, $02                ; $1AC1B9 |
  db $F0, $F0, $46, $09, $02                ; $1AC1BE |
  db $F0, $E8, $42, $09, $02                ; $1AC1C3 |
  db $E0, $E8, $40, $09, $02                ; $1AC1C8 |
  db $FF, $F5, $E4, $0A, $02                ; $1AC1CD |
  db $F7, $F5, $E3, $0A, $02                ; $1AC1D2 |
  db $FF, $E5, $E1, $0A, $02                ; $1AC1D7 |
  db $F7, $E5, $E0, $0A, $02                ; $1AC1DC |
  db $FC, $FC, $4A, $09, $02                ; $1AC1E1 |
  db $EC, $FC, $48, $09, $02                ; $1AC1E6 |
  db $F2, $06, $4C, $07, $02                ; $1AC1EB |
  db $F0, $03, $4E, $07, $02                ; $1AC1F0 |
  db $F0, $E8, $42, $09, $02                ; $1AC1F5 |
  db $E0, $E8, $40, $09, $02                ; $1AC1FA |
  db $F0, $F0, $46, $09, $02                ; $1AC1FF |
  db $E0, $F0, $44, $09, $02                ; $1AC204 |
  db $FF, $F6, $EA, $0A, $02                ; $1AC209 |
  db $F7, $F6, $E9, $0A, $02                ; $1AC20E |
  db $FF, $E6, $E7, $0A, $02                ; $1AC213 |
  db $F7, $E6, $E6, $0A, $02                ; $1AC218 |
  db $EE, $06, $4C, $07, $02                ; $1AC21D |
  db $EC, $FC, $48, $09, $02                ; $1AC222 |
  db $FC, $FC, $4A, $09, $02                ; $1AC227 |
  db $F8, $03, $4E, $07, $02                ; $1AC22C |
  db $F0, $E8, $42, $09, $02                ; $1AC231 |
  db $E0, $E8, $40, $09, $02                ; $1AC236 |
  db $F0, $F0, $46, $09, $02                ; $1AC23B |
  db $E0, $F0, $44, $09, $02                ; $1AC240 |
  db $00, $F7, $04, $0A, $02                ; $1AC245 |
  db $F8, $F7, $03, $0A, $02                ; $1AC24A |
  db $00, $E7, $01, $0A, $02                ; $1AC24F |
  db $F8, $E7, $00, $0A, $02                ; $1AC254 |
  db $FC, $FC, $4A, $09, $02                ; $1AC259 |
  db $FD, $01, $4C, $07, $02                ; $1AC25E |
  db $E9, $06, $4E, $07, $02                ; $1AC263 |
  db $EC, $FC, $48, $09, $02                ; $1AC268 |
  db $F0, $E8, $42, $09, $02                ; $1AC26D |
  db $E0, $E8, $40, $09, $02                ; $1AC272 |
  db $F0, $F0, $46, $09, $02                ; $1AC277 |
  db $E0, $F0, $44, $09, $02                ; $1AC27C |
  db $FF, $F6, $0A, $0A, $02                ; $1AC281 |
  db $F7, $F6, $09, $0A, $02                ; $1AC286 |
  db $FF, $E6, $07, $0A, $02                ; $1AC28B |
  db $F7, $E6, $06, $0A, $02                ; $1AC290 |
  db $EB, $07, $4C, $07, $02                ; $1AC295 |
  db $EC, $FC, $48, $09, $02                ; $1AC29A |
  db $FC, $FC, $4A, $09, $02                ; $1AC29F |
  db $F8, $03, $4E, $07, $02                ; $1AC2A4 |
  db $F0, $E8, $42, $09, $02                ; $1AC2A9 |
  db $E0, $E8, $40, $09, $02                ; $1AC2AE |
  db $F0, $F0, $46, $09, $02                ; $1AC2B3 |
  db $E0, $F0, $44, $09, $02                ; $1AC2B8 |
  db $00, $F6, $E4, $0A, $02                ; $1AC2BD |
  db $F8, $F6, $E3, $0A, $02                ; $1AC2C2 |
  db $00, $E6, $E1, $0A, $02                ; $1AC2C7 |
  db $F8, $E6, $E0, $0A, $02                ; $1AC2CC |
  db $E0, $F0, $44, $09, $02                ; $1AC2D1 |
  db $F0, $F0, $46, $09, $02                ; $1AC2D6 |
  db $EC, $FC, $48, $09, $02                ; $1AC2DB |
  db $FC, $FC, $4A, $09, $02                ; $1AC2E0 |
  db $F4, $07, $4C, $07, $02                ; $1AC2E5 |
  db $F3, $02, $4E, $07, $02                ; $1AC2EA |
  db $F0, $E8, $42, $09, $02                ; $1AC2EF |
  db $E0, $E8, $40, $09, $02                ; $1AC2F4 |
  db $00, $F6, $EA, $0A, $02                ; $1AC2F9 |
  db $F8, $F6, $E9, $0A, $02                ; $1AC2FE |
  db $00, $E6, $E7, $0A, $02                ; $1AC303 |
  db $F8, $E6, $E6, $0A, $02                ; $1AC308 |
  db $E0, $F0, $44, $09, $02                ; $1AC30D |
  db $F0, $F0, $46, $09, $02                ; $1AC312 |
  db $F8, $06, $4C, $07, $02                ; $1AC317 |
  db $EC, $FC, $48, $09, $02                ; $1AC31C |
  db $EA, $01, $4E, $07, $02                ; $1AC321 |
  db $FC, $FC, $4A, $09, $02                ; $1AC326 |
  db $F0, $E8, $42, $09, $02                ; $1AC32B |
  db $E0, $E8, $40, $09, $02                ; $1AC330 |
  db $14, $0B, $44, $00, $00                ; $1AC335 |
  db $09, $0D, $44, $00, $00                ; $1AC33A |
  db $F4, $0B, $44, $00, $00                ; $1AC33F |
  db $FF, $0D, $44, $00, $00                ; $1AC344 |
  db $13, $07, $44, $00, $00                ; $1AC349 |
  db $09, $08, $44, $00, $00                ; $1AC34E |
  db $F5, $07, $44, $00, $00                ; $1AC353 |
  db $FF, $08, $44, $00, $00                ; $1AC358 |
  db $12, $04, $44, $00, $00                ; $1AC35D |
  db $08, $04, $44, $00, $00                ; $1AC362 |
  db $F6, $04, $44, $00, $00                ; $1AC367 |
  db $00, $04, $44, $00, $00                ; $1AC36C |
  db $10, $02, $44, $00, $00                ; $1AC371 |
  db $08, $01, $44, $00, $00                ; $1AC376 |
  db $F8, $02, $44, $00, $00                ; $1AC37B |
  db $00, $01, $44, $00, $00                ; $1AC380 |
  db $0F, $01, $44, $00, $00                ; $1AC385 |
  db $07, $FF, $44, $00, $00                ; $1AC38A |
  db $F9, $01, $44, $00, $00                ; $1AC38F |
  db $01, $FF, $44, $00, $00                ; $1AC394 |
  db $0D, $01, $44, $00, $00                ; $1AC399 |
  db $07, $FE, $44, $00, $00                ; $1AC39E |
  db $FB, $01, $44, $00, $00                ; $1AC3A3 |
  db $01, $FE, $44, $00, $00                ; $1AC3A8 |
  db $0C, $01, $54, $00, $00                ; $1AC3AD |
  db $06, $FD, $54, $00, $00                ; $1AC3B2 |
  db $FC, $01, $54, $00, $00                ; $1AC3B7 |
  db $02, $FD, $54, $00, $00                ; $1AC3BC |
  db $0A, $01, $45, $00, $00                ; $1AC3C1 |
  db $06, $FD, $45, $00, $00                ; $1AC3C6 |
  db $FE, $01, $45, $00, $00                ; $1AC3CB |
  db $02, $FD, $45, $00, $00                ; $1AC3D0 |
  db $09, $01, $55, $00, $00                ; $1AC3D5 |
  db $05, $FE, $55, $00, $00                ; $1AC3DA |
  db $FF, $01, $55, $00, $00                ; $1AC3DF |
  db $03, $FE, $55, $00, $00                ; $1AC3E4 |
  db $06, $01, $45, $00, $00                ; $1AC3E9 |
  db $05, $FF, $45, $00, $00                ; $1AC3EE |
  db $01, $01, $45, $00, $00                ; $1AC3F3 |
  db $03, $FF, $45, $00, $00                ; $1AC3F8 |
  db $06, $02, $54, $00, $00                ; $1AC3FD |
  db $04, $01, $54, $00, $00                ; $1AC402 |
  db $02, $02, $54, $00, $00                ; $1AC407 |
  db $04, $01, $44, $00, $00                ; $1AC40C |
  db $04, $04, $44, $00, $00                ; $1AC411 |
  db $04, $04, $44, $00, $00                ; $1AC416 |
  db $04, $04, $44, $00, $00                ; $1AC41B |
  db $04, $04, $44, $00, $00                ; $1AC420 |
  db $00, $00, $D4, $02, $00                ; $1AC425 |
  db $07, $07, $D4, $C2, $00                ; $1AC42A |
  db $00, $07, $D4, $82, $00                ; $1AC42F |
  db $07, $00, $D4, $42, $00                ; $1AC434 |
  db $F8, $00, $00, $00, $00                ; $1AC439 |
  db $00, $00, $01, $00, $00                ; $1AC43E |
  db $08, $00, $02, $00, $00                ; $1AC443 |
  db $F8, $08, $10, $00, $00                ; $1AC448 |
  db $00, $08, $11, $00, $00                ; $1AC44D |
  db $08, $08, $12, $00, $00                ; $1AC452 |
  db $F8, $00, $03, $00, $00                ; $1AC457 |
  db $00, $00, $04, $00, $00                ; $1AC45C |
  db $08, $00, $05, $00, $00                ; $1AC461 |
  db $F8, $08, $13, $00, $00                ; $1AC466 |
  db $00, $08, $14, $00, $00                ; $1AC46B |
  db $08, $08, $15, $00, $00                ; $1AC470 |
  db $F8, $00, $06, $00, $00                ; $1AC475 |
  db $00, $00, $07, $00, $00                ; $1AC47A |
  db $08, $00, $08, $00, $00                ; $1AC47F |
  db $F8, $08, $16, $00, $00                ; $1AC484 |
  db $00, $08, $17, $00, $00                ; $1AC489 |
  db $08, $08, $18, $00, $00                ; $1AC48E |
  db $F8, $00, $03, $00, $00                ; $1AC493 |
  db $00, $00, $04, $00, $00                ; $1AC498 |
  db $08, $00, $05, $00, $00                ; $1AC49D |
  db $F8, $08, $13, $00, $00                ; $1AC4A2 |
  db $00, $08, $14, $00, $00                ; $1AC4A7 |
  db $08, $08, $15, $00, $00                ; $1AC4AC |
  db $F8, $F8, $09, $00, $02                ; $1AC4B1 |
  db $00, $F8, $0A, $00, $02                ; $1AC4B6 |
  db $F8, $00, $22, $00, $02                ; $1AC4BB |
  db $00, $00, $23, $00, $02                ; $1AC4C0 |
  db $F6, $F0, $0C, $00, $02                ; $1AC4C5 |
  db $00, $F0, $20, $00, $02                ; $1AC4CA |
  db $F8, $F4, $09, $00, $02                ; $1AC4CF |
  db $00, $F4, $0A, $00, $02                ; $1AC4D4 |
  db $F8, $00, $22, $00, $02                ; $1AC4D9 |
  db $00, $00, $23, $00, $02                ; $1AC4DE |
  db $00, $EA, $20, $00, $02                ; $1AC4E3 |
  db $F6, $EA, $0C, $00, $02                ; $1AC4E8 |
  db $F8, $F2, $09, $00, $02                ; $1AC4ED |
  db $00, $F2, $0A, $00, $02                ; $1AC4F2 |
  db $F8, $00, $22, $00, $02                ; $1AC4F7 |
  db $00, $00, $23, $00, $02                ; $1AC4FC |
  db $00, $E6, $20, $00, $02                ; $1AC501 |
  db $F6, $E6, $0C, $00, $02                ; $1AC506 |
  db $F8, $F1, $09, $00, $02                ; $1AC50B |
  db $00, $F1, $0A, $00, $02                ; $1AC510 |
  db $F8, $00, $25, $00, $02                ; $1AC515 |
  db $00, $00, $26, $00, $02                ; $1AC51A |
  db $00, $E3, $20, $00, $02                ; $1AC51F |
  db $F6, $E3, $0C, $00, $02                ; $1AC524 |
  db $F8, $F0, $09, $00, $02                ; $1AC529 |
  db $00, $F0, $0A, $00, $02                ; $1AC52E |
  db $F8, $00, $28, $00, $02                ; $1AC533 |
  db $00, $00, $29, $00, $02                ; $1AC538 |
  db $00, $E0, $20, $00, $02                ; $1AC53D |
  db $F6, $E0, $0C, $00, $02                ; $1AC542 |
  db $FE, $F7, $20, $00, $02                ; $1AC547 |
  db $F8, $00, $00, $00, $02                ; $1AC54C |
  db $00, $00, $01, $00, $02                ; $1AC551 |
  db $F4, $F7, $0C, $00, $02                ; $1AC556 |
  db $00, $00, $01, $00, $00                ; $1AC55B |
  db $F4, $F7, $0C, $00, $00                ; $1AC560 |
  db $F8, $F0, $09, $00, $02                ; $1AC565 |
  db $00, $F0, $0A, $00, $02                ; $1AC56A |
  db $F8, $00, $28, $00, $02                ; $1AC56F |
  db $00, $00, $29, $00, $02                ; $1AC574 |
  db $00, $E0, $20, $00, $02                ; $1AC579 |
  db $F6, $E0, $0E, $00, $02                ; $1AC57E |
  db $F8, $F0, $09, $00, $02                ; $1AC583 |
  db $00, $F0, $0A, $00, $02                ; $1AC588 |
  db $F8, $00, $28, $00, $02                ; $1AC58D |
  db $00, $00, $29, $00, $02                ; $1AC592 |
  db $00, $E0, $0C, $00, $02                ; $1AC597 |
  db $F6, $E0, $0C, $00, $02                ; $1AC59C |
  db $F8, $F0, $09, $00, $02                ; $1AC5A1 |
  db $00, $F0, $0A, $00, $02                ; $1AC5A6 |
  db $F8, $00, $28, $00, $02                ; $1AC5AB |
  db $00, $00, $29, $00, $02                ; $1AC5B0 |
  db $00, $E0, $0E, $00, $02                ; $1AC5B5 |
  db $F6, $E0, $20, $00, $02                ; $1AC5BA |
  db $FC, $00, $2B, $00, $00                ; $1AC5BF |
  db $04, $00, $2C, $00, $00                ; $1AC5C4 |
  db $FC, $08, $3B, $00, $00                ; $1AC5C9 |
  db $04, $08, $3C, $00, $00                ; $1AC5CE |
  db $04, $00, $2B, $40, $02                ; $1AC5D3 |
  db $0C, $00, $2B, $40, $00                ; $1AC5D8 |
  db $06, $00, $2B, $40, $02                ; $1AC5DD |
  db $FA, $00, $2B, $00, $00                ; $1AC5E2 |
  db $02, $00, $2C, $00, $00                ; $1AC5E7 |
  db $FA, $08, $3B, $00, $00                ; $1AC5EC |
  db $02, $08, $3C, $00, $00                ; $1AC5F1 |
  db $FA, $00, $2B, $00, $00                ; $1AC5F6 |
  db $06, $00, $2D, $40, $02                ; $1AC5FB |
  db $FA, $00, $2D, $00, $00                ; $1AC600 |
  db $02, $00, $2E, $00, $00                ; $1AC605 |
  db $FA, $08, $3D, $00, $00                ; $1AC60A |
  db $02, $08, $3E, $00, $00                ; $1AC60F |
  db $FA, $00, $2D, $00, $00                ; $1AC614 |
  db $08, $00, $2D, $40, $02                ; $1AC619 |
  db $F8, $00, $2D, $00, $00                ; $1AC61E |
  db $00, $00, $2E, $00, $00                ; $1AC623 |
  db $F8, $08, $3D, $00, $00                ; $1AC628 |
  db $00, $08, $3E, $00, $00                ; $1AC62D |
  db $F8, $00, $2D, $00, $00                ; $1AC632 |
  db $00, $00, $00, $00, $02                ; $1AC637 |
  db $00, $00, $00, $00, $00                ; $1AC63C |
  db $08, $08, $11, $00, $00                ; $1AC641 |
  db $00, $00, $02, $00, $02                ; $1AC646 |
  db $00, $F8, $04, $00, $00                ; $1AC64B |
  db $08, $F8, $05, $00, $00                ; $1AC650 |
  db $00, $00, $0E, $00, $02                ; $1AC655 |
  db $00, $F8, $14, $00, $00                ; $1AC65A |
  db $08, $F8, $15, $00, $00                ; $1AC65F |
  db $00, $00, $08, $00, $02                ; $1AC664 |
  db $00, $F0, $06, $00, $02                ; $1AC669 |
  db $00, $F0, $06, $00, $02                ; $1AC66E |
  db $00, $00, $0C, $00, $02                ; $1AC673 |
  db $00, $F0, $0A, $00, $02                ; $1AC678 |
  db $00, $F0, $0A, $00, $02                ; $1AC67D |
  db $08, $08, $18, $04, $00                ; $1AC682 |
  db $08, $00, $08, $04, $00                ; $1AC687 |
  db $10, $09, $19, $04, $00                ; $1AC68C |
  db $10, $01, $09, $04, $00                ; $1AC691 |
  db $F8, $FF, $06, $04, $02                ; $1AC696 |
  db $08, $07, $18, $04, $00                ; $1AC69B |
  db $08, $FF, $08, $04, $00                ; $1AC6A0 |
  db $10, $08, $1A, $04, $00                ; $1AC6A5 |
  db $10, $00, $0A, $04, $00                ; $1AC6AA |
  db $F8, $00, $06, $04, $02                ; $1AC6AF |
  db $08, $08, $18, $04, $00                ; $1AC6B4 |
  db $08, $00, $08, $04, $00                ; $1AC6B9 |
  db $10, $07, $1B, $04, $00                ; $1AC6BE |
  db $10, $FF, $0B, $04, $00                ; $1AC6C3 |
  db $F8, $01, $06, $04, $02                ; $1AC6C8 |
  db $08, $09, $18, $04, $00                ; $1AC6CD |
  db $08, $01, $08, $04, $00                ; $1AC6D2 |
  db $10, $08, $1C, $04, $00                ; $1AC6D7 |
  db $10, $00, $0C, $04, $00                ; $1AC6DC |
  db $F8, $00, $06, $04, $02                ; $1AC6E1 |
  db $00, $08, $00, $40, $00                ; $1AC6E6 |
  db $08, $08, $00, $00, $00                ; $1AC6EB |
  db $F8, $F0, $00, $00, $02                ; $1AC6F0 |
  db $08, $F0, $00, $00, $02                ; $1AC6F5 |
  db $F8, $00, $00, $00, $02                ; $1AC6FA |
  db $08, $00, $00, $00, $02                ; $1AC6FF |
  db $E8, $08, $E7, $00, $02                ; $1AC704 |
  db $08, $08, $E7, $00, $02                ; $1AC709 |
  db $08, $E8, $E7, $00, $02                ; $1AC70E |
  db $E8, $E8, $E7, $00, $02                ; $1AC713 |
  db $F8, $0D, $E7, $00, $02                ; $1AC718 |
  db $0D, $F8, $E7, $00, $02                ; $1AC71D |
  db $E3, $F8, $E7, $00, $02                ; $1AC722 |
  db $F8, $E3, $E7, $00, $02                ; $1AC727 |
  db $EB, $EB, $E5, $00, $02                ; $1AC72C |
  db $05, $EB, $E5, $00, $02                ; $1AC731 |
  db $05, $05, $E5, $00, $02                ; $1AC736 |
  db $EB, $05, $E5, $00, $02                ; $1AC73B |
  db $F8, $0A, $E5, $00, $02                ; $1AC740 |
  db $F8, $E6, $E5, $00, $02                ; $1AC745 |
  db $0A, $F8, $E5, $00, $02                ; $1AC74A |
  db $E6, $F8, $E5, $00, $02                ; $1AC74F |
  db $02, $02, $E3, $00, $02                ; $1AC754 |
  db $EE, $02, $E3, $00, $02                ; $1AC759 |
  db $02, $EE, $E3, $00, $02                ; $1AC75E |
  db $EE, $EE, $E3, $00, $02                ; $1AC763 |
  db $F8, $07, $E3, $00, $02                ; $1AC768 |
  db $07, $F8, $E3, $00, $02                ; $1AC76D |
  db $E9, $F8, $E3, $00, $02                ; $1AC772 |
  db $F8, $E9, $E3, $00, $02                ; $1AC777 |
  db $00, $00, $E3, $00, $02                ; $1AC77C |
  db $F0, $00, $E3, $00, $02                ; $1AC781 |
  db $F0, $F0, $E3, $00, $02                ; $1AC786 |
  db $00, $F0, $E3, $00, $02                ; $1AC78B |
  db $04, $F8, $E3, $00, $02                ; $1AC790 |
  db $ED, $F8, $E3, $00, $02                ; $1AC795 |
  db $F8, $04, $E3, $00, $02                ; $1AC79A |
  db $F8, $EC, $E3, $00, $02                ; $1AC79F |
  db $F8, $00, $E3, $00, $02                ; $1AC7A4 |
  db $F8, $F0, $E3, $00, $02                ; $1AC7A9 |
  db $00, $F8, $E3, $00, $02                ; $1AC7AE |
  db $F0, $F8, $E3, $00, $00                ; $1AC7B3 |
  db $F8, $F8, $E4, $00, $00                ; $1AC7B8 |
  db $F0, $00, $F3, $00, $00                ; $1AC7BD |
  db $F8, $00, $F4, $00, $00                ; $1AC7C2 |
  db $F8, $00, $F4, $00, $00                ; $1AC7C7 |
  db $F8, $FC, $E3, $00, $02                ; $1AC7CC |
  db $FC, $F8, $E3, $00, $02                ; $1AC7D1 |
  db $F8, $F4, $E3, $00, $02                ; $1AC7D6 |
  db $F4, $F8, $E3, $00, $00                ; $1AC7DB |
  db $FC, $F8, $E4, $00, $00                ; $1AC7E0 |
  db $F4, $00, $F3, $00, $00                ; $1AC7E5 |
  db $FC, $00, $F4, $00, $00                ; $1AC7EA |
  db $FC, $00, $F4, $00, $00                ; $1AC7EF |
  db $F8, $F8, $E3, $00, $00                ; $1AC7F4 |
  db $00, $F8, $E4, $00, $00                ; $1AC7F9 |
  db $F8, $00, $F3, $00, $00                ; $1AC7FE |
  db $00, $00, $F4, $00, $00                ; $1AC803 |
  db $F8, $F8, $E3, $00, $00                ; $1AC808 |
  db $00, $F8, $E4, $00, $00                ; $1AC80D |
  db $F8, $00, $F3, $00, $00                ; $1AC812 |
  db $00, $00, $F4, $00, $00                ; $1AC817 |
  db $00, $00, $42, $C4, $02                ; $1AC81C |
  db $F0, $00, $42, $84, $02                ; $1AC821 |
  db $00, $F0, $42, $44, $02                ; $1AC826 |
  db $F0, $F0, $42, $04, $02                ; $1AC82B |
  db $F0, $F0, $42, $04, $00                ; $1AC830 |
  db $F0, $F8, $52, $04, $00                ; $1AC835 |
  db $F0, $00, $52, $84, $00                ; $1AC83A |
  db $F0, $08, $42, $84, $00                ; $1AC83F |
  db $0B, $FF, $27, $04, $00                ; $1AC844 |
  db $0B, $EF, $25, $04, $02                ; $1AC849 |
  db $F8, $00, $00, $04, $02                ; $1AC84E |
  db $08, $00, $02, $04, $02                ; $1AC853 |
  db $FB, $EF, $25, $44, $02                ; $1AC858 |
  db $03, $FF, $27, $44, $00                ; $1AC85D |
  db $01, $E8, $2D, $44, $00                ; $1AC862 |
  db $0D, $E8, $2D, $04, $00                ; $1AC867 |
  db $0D, $E8, $2D, $04, $00                ; $1AC86C |
  db $0C, $F6, $28, $04, $02                ; $1AC871 |
  db $F8, $00, $00, $04, $02                ; $1AC876 |
  db $08, $00, $04, $04, $02                ; $1AC87B |
  db $08, $00, $04, $04, $00                ; $1AC880 |
  db $FA, $F6, $28, $44, $02                ; $1AC885 |
  db $FD, $F1, $2D, $44, $00                ; $1AC88A |
  db $11, $F1, $2D, $04, $00                ; $1AC88F |
  db $11, $F1, $2D, $04, $00                ; $1AC894 |
  db $11, $F1, $2D, $04, $00                ; $1AC899 |
  db $0E, $00, $2A, $04, $00                ; $1AC89E |
  db $16, $00, $2B, $04, $00                ; $1AC8A3 |
  db $0E, $08, $3A, $04, $00                ; $1AC8A8 |
  db $16, $08, $3B, $04, $00                ; $1AC8AD |
  db $08, $00, $06, $04, $02                ; $1AC8B2 |
  db $F8, $00, $00, $04, $02                ; $1AC8B7 |
  db $F8, $00, $00, $04, $00                ; $1AC8BC |
  db $F8, $00, $00, $04, $00                ; $1AC8C1 |
  db $F8, $00, $2A, $44, $02                ; $1AC8C6 |
  db $0D, $08, $2C, $04, $00                ; $1AC8CB |
  db $15, $08, $2D, $04, $00                ; $1AC8D0 |
  db $0D, $10, $3C, $04, $00                ; $1AC8D5 |
  db $15, $10, $3D, $04, $00                ; $1AC8DA |
  db $08, $00, $02, $04, $02                ; $1AC8DF |
  db $F8, $00, $00, $04, $02                ; $1AC8E4 |
  db $F8, $00, $00, $04, $00                ; $1AC8E9 |
  db $F8, $00, $00, $04, $00                ; $1AC8EE |
  db $F9, $08, $2C, $44, $02                ; $1AC8F3 |
  db $0C, $08, $37, $04, $00                ; $1AC8F8 |
  db $0C, $10, $2E, $04, $02                ; $1AC8FD |
  db $0C, $10, $2E, $04, $00                ; $1AC902 |
  db $F8, $00, $00, $04, $02                ; $1AC907 |
  db $F8, $00, $00, $04, $00                ; $1AC90C |
  db $08, $00, $04, $04, $02                ; $1AC911 |
  db $08, $00, $04, $04, $02                ; $1AC916 |
  db $02, $08, $37, $44, $00                ; $1AC91B |
  db $FA, $10, $2E, $44, $02                ; $1AC920 |
  db $0C, $0A, $28, $84, $02                ; $1AC925 |
  db $08, $00, $06, $04, $02                ; $1AC92A |
  db $F8, $00, $00, $04, $02                ; $1AC92F |
  db $F8, $00, $00, $04, $00                ; $1AC934 |
  db $F8, $00, $00, $04, $00                ; $1AC939 |
  db $FA, $0A, $28, $C4, $02                ; $1AC93E |
  db $11, $17, $2D, $84, $00                ; $1AC943 |
  db $11, $17, $2D, $84, $00                ; $1AC948 |
  db $FD, $17, $2D, $C4, $00                ; $1AC94D |
  db $0E, $00, $2A, $84, $02                ; $1AC952 |
  db $08, $00, $02, $04, $00                ; $1AC957 |
  db $10, $00, $03, $04, $00                ; $1AC95C |
  db $08, $08, $12, $04, $00                ; $1AC961 |
  db $10, $08, $13, $04, $00                ; $1AC966 |
  db $F8, $00, $00, $04, $02                ; $1AC96B |
  db $F8, $00, $00, $04, $00                ; $1AC970 |
  db $F8, $00, $00, $04, $00                ; $1AC975 |
  db $F8, $00, $2A, $C4, $02                ; $1AC97A |
  db $0D, $F8, $2C, $84, $02                ; $1AC97F |
  db $08, $00, $04, $04, $00                ; $1AC984 |
  db $10, $00, $04, $04, $00                ; $1AC989 |
  db $08, $08, $14, $04, $00                ; $1AC98E |
  db $10, $08, $15, $04, $00                ; $1AC993 |
  db $F8, $00, $00, $04, $02                ; $1AC998 |
  db $F8, $00, $00, $04, $00                ; $1AC99D |
  db $F8, $00, $00, $04, $00                ; $1AC9A2 |
  db $F9, $F8, $2C, $C4, $02                ; $1AC9A7 |
  db $0C, $00, $37, $84, $00                ; $1AC9AC |
  db $0C, $F0, $2E, $84, $02                ; $1AC9B1 |
  db $0C, $F0, $3E, $84, $00                ; $1AC9B6 |
  db $F8, $00, $00, $04, $02                ; $1AC9BB |
  db $F8, $00, $00, $04, $00                ; $1AC9C0 |
  db $08, $00, $06, $04, $02                ; $1AC9C5 |
  db $08, $00, $06, $04, $02                ; $1AC9CA |
  db $02, $00, $37, $C4, $00                ; $1AC9CF |
  db $FA, $F0, $2E, $C4, $02                ; $1AC9D4 |
  db $17, $00, $22, $04, $02                ; $1AC9D9 |
  db $0F, $04, $34, $04, $00                ; $1AC9DE |
  db $F8, $00, $00, $04, $02                ; $1AC9E3 |
  db $27, $00, $24, $04, $00                ; $1AC9E8 |
  db $27, $00, $24, $04, $00                ; $1AC9ED |
  db $00, $04, $34, $44, $00                ; $1AC9F2 |
  db $E8, $00, $24, $44, $00                ; $1AC9F7 |
  db $F0, $00, $22, $44, $02                ; $1AC9FC |
  db $08, $00, $02, $04, $02                ; $1ACA01 |
  db $17, $00, $22, $04, $02                ; $1ACA06 |
  db $0F, $04, $34, $04, $00                ; $1ACA0B |
  db $F8, $00, $00, $04, $02                ; $1ACA10 |
  db $27, $00, $24, $04, $00                ; $1ACA15 |
  db $00, $04, $34, $44, $00                ; $1ACA1A |
  db $E8, $00, $24, $44, $00                ; $1ACA1F |
  db $F0, $00, $22, $44, $02                ; $1ACA24 |
  db $08, $00, $04, $04, $02                ; $1ACA29 |
  db $08, $00, $04, $04, $02                ; $1ACA2E |
  db $17, $00, $22, $04, $02                ; $1ACA33 |
  db $0F, $04, $34, $04, $00                ; $1ACA38 |
  db $F8, $00, $00, $04, $02                ; $1ACA3D |
  db $27, $00, $24, $04, $00                ; $1ACA42 |
  db $00, $04, $34, $44, $00                ; $1ACA47 |
  db $E8, $00, $24, $44, $00                ; $1ACA4C |
  db $F0, $00, $22, $44, $02                ; $1ACA51 |
  db $08, $00, $06, $04, $02                ; $1ACA56 |
  db $08, $00, $06, $04, $02                ; $1ACA5B |
  db $03, $07, $08, $04, $02                ; $1ACA60 |
  db $03, $07, $08, $04, $00                ; $1ACA65 |
  db $08, $FF, $02, $04, $00                ; $1ACA6A |
  db $08, $FF, $02, $04, $00                ; $1ACA6F |
  db $F8, $FF, $00, $04, $00                ; $1ACA74 |
  db $00, $FF, $01, $04, $00                ; $1ACA79 |
  db $F8, $07, $10, $04, $00                ; $1ACA7E |
  db $00, $07, $11, $04, $00                ; $1ACA83 |
  db $00, $07, $11, $04, $00                ; $1ACA88 |
  db $03, $06, $0A, $04, $02                ; $1ACA8D |
  db $03, $06, $0A, $04, $00                ; $1ACA92 |
  db $08, $FE, $04, $04, $00                ; $1ACA97 |
  db $08, $FE, $04, $04, $00                ; $1ACA9C |
  db $F8, $FE, $00, $04, $00                ; $1ACAA1 |
  db $00, $FE, $01, $04, $00                ; $1ACAA6 |
  db $F8, $06, $10, $04, $00                ; $1ACAAB |
  db $00, $06, $11, $04, $00                ; $1ACAB0 |
  db $00, $06, $11, $04, $00                ; $1ACAB5 |
  db $03, $06, $0C, $04, $02                ; $1ACABA |
  db $03, $06, $0C, $04, $00                ; $1ACABF |
  db $08, $FE, $06, $04, $00                ; $1ACAC4 |
  db $08, $FE, $06, $04, $00                ; $1ACAC9 |
  db $F8, $FE, $00, $04, $00                ; $1ACACE |
  db $00, $FE, $01, $04, $00                ; $1ACAD3 |
  db $F8, $06, $10, $04, $00                ; $1ACAD8 |
  db $00, $06, $11, $04, $00                ; $1ACADD |
  db $00, $06, $11, $04, $00                ; $1ACAE2 |
  db $17, $00, $22, $04, $02                ; $1ACAE7 |
  db $0F, $04, $34, $04, $00                ; $1ACAEC |
  db $03, $08, $0C, $04, $02                ; $1ACAF1 |
  db $F8, $00, $00, $04, $02                ; $1ACAF6 |
  db $27, $00, $24, $04, $00                ; $1ACAFB |
  db $00, $04, $34, $44, $00                ; $1ACB00 |
  db $E8, $00, $24, $44, $00                ; $1ACB05 |
  db $F0, $00, $22, $44, $02                ; $1ACB0A |
  db $08, $00, $02, $04, $00                ; $1ACB0F |
  db $17, $00, $22, $04, $02                ; $1ACB14 |
  db $0F, $04, $34, $04, $00                ; $1ACB19 |
  db $03, $08, $0C, $04, $02                ; $1ACB1E |
  db $F8, $00, $00, $04, $02                ; $1ACB23 |
  db $27, $00, $24, $04, $00                ; $1ACB28 |
  db $00, $04, $34, $44, $00                ; $1ACB2D |
  db $E8, $00, $24, $44, $00                ; $1ACB32 |
  db $F0, $00, $22, $44, $02                ; $1ACB37 |
  db $08, $00, $04, $04, $00                ; $1ACB3C |
  db $17, $00, $22, $04, $02                ; $1ACB41 |
  db $0F, $04, $34, $04, $00                ; $1ACB46 |
  db $03, $08, $0C, $04, $02                ; $1ACB4B |
  db $F8, $00, $00, $04, $02                ; $1ACB50 |
  db $27, $00, $24, $04, $00                ; $1ACB55 |
  db $00, $04, $34, $44, $00                ; $1ACB5A |
  db $E8, $00, $24, $44, $00                ; $1ACB5F |
  db $F0, $00, $22, $44, $02                ; $1ACB64 |
  db $08, $00, $06, $04, $00                ; $1ACB69 |
  db $03, $01, $1C, $04, $00                ; $1ACB6E |
  db $04, $10, $0C, $04, $00                ; $1ACB73 |
  db $00, $00, $00, $04, $02                ; $1ACB78 |
  db $04, $FF, $1D, $04, $00                ; $1ACB7D |
  db $03, $0D, $0C, $04, $00                ; $1ACB82 |
  db $00, $00, $02, $04, $02                ; $1ACB87 |
  db $00, $08, $14, $04, $00                ; $1ACB8C |
  db $05, $FE, $1D, $04, $00                ; $1ACB91 |
  db $00, $00, $04, $04, $02                ; $1ACB96 |
  db $00, $08, $16, $04, $00                ; $1ACB9B |
  db $00, $00, $06, $04, $00                ; $1ACBA0 |
  db $00, $00, $06, $04, $02                ; $1ACBA5 |
  db $00, $00, $0A, $04, $00                ; $1ACBAA |
  db $05, $0A, $1D, $04, $00                ; $1ACBAF |
  db $00, $00, $0A, $04, $02                ; $1ACBB4 |
  db $04, $0C, $1D, $04, $00                ; $1ACBB9 |
  db $04, $FE, $0C, $C4, $00                ; $1ACBBE |
  db $00, $04, $02, $84, $02                ; $1ACBC3 |
  db $04, $10, $1C, $04, $00                ; $1ACBC8 |
  db $04, $00, $0C, $C4, $00                ; $1ACBCD |
  db $00, $08, $00, $84, $02                ; $1ACBD2 |
  db $04, $10, $1C, $04, $00                ; $1ACBD7 |
  db $04, $00, $0C, $C4, $00                ; $1ACBDC |
  db $00, $08, $00, $84, $02                ; $1ACBE1 |
  db $04, $10, $1D, $04, $00                ; $1ACBE6 |
  db $04, $02, $0C, $C4, $00                ; $1ACBEB |
  db $00, $08, $02, $84, $02                ; $1ACBF0 |
  db $00, $08, $15, $C4, $00                ; $1ACBF5 |
  db $03, $10, $1D, $04, $00                ; $1ACBFA |
  db $00, $08, $04, $C4, $02                ; $1ACBFF |
  db $03, $0D, $1C, $04, $00                ; $1ACC04 |
  db $08, $08, $09, $04, $00                ; $1ACC09 |
  db $00, $08, $08, $04, $02                ; $1ACC0E |
  db $03, $09, $1C, $04, $00                ; $1ACC13 |
  db $08, $10, $0A, $C4, $00                ; $1ACC18 |
  db $00, $08, $0A, $C4, $02                ; $1ACC1D |
  db $03, $05, $1C, $04, $00                ; $1ACC22 |
  db $04, $12, $0C, $04, $00                ; $1ACC27 |
  db $00, $04, $02, $44, $02                ; $1ACC2C |
  db $03, $01, $1C, $04, $00                ; $1ACC31 |
  db $04, $10, $0C, $04, $00                ; $1ACC36 |
  db $00, $00, $00, $04, $02                ; $1ACC3B |
  db $03, $10, $0D, $04, $00                ; $1ACC40 |
  db $04, $00, $0C, $84, $00                ; $1ACC45 |
  db $00, $08, $00, $84, $02                ; $1ACC4A |
  db $00, $10, $0D, $44, $00                ; $1ACC4F |
  db $03, $00, $0C, $84, $00                ; $1ACC54 |
  db $00, $08, $0E, $04, $02                ; $1ACC59 |
  db $00, $10, $1F, $44, $00                ; $1ACC5E |
  db $05, $00, $0C, $C4, $00                ; $1ACC63 |
  db $00, $08, $0E, $44, $02                ; $1ACC68 |
  db $00, $10, $01, $C4, $00                ; $1ACC6D |
  db $04, $00, $0C, $C4, $00                ; $1ACC72 |
  db $00, $08, $00, $C4, $02                ; $1ACC77 |
  db $00, $10, $00, $84, $00                ; $1ACC7C |
  db $04, $00, $0C, $84, $00                ; $1ACC81 |
  db $00, $08, $00, $84, $02                ; $1ACC86 |
  db $00, $10, $1E, $04, $00                ; $1ACC8B |
  db $03, $00, $0C, $84, $00                ; $1ACC90 |
  db $00, $08, $0E, $04, $02                ; $1ACC95 |
  db $08, $10, $0D, $04, $00                ; $1ACC9A |
  db $05, $00, $0C, $C4, $00                ; $1ACC9F |
  db $00, $08, $0E, $44, $02                ; $1ACCA4 |
  db $05, $10, $0D, $44, $00                ; $1ACCA9 |
  db $04, $00, $0C, $C4, $00                ; $1ACCAE |
  db $00, $08, $00, $C4, $02                ; $1ACCB3 |
  db $0C, $05, $1B, $04, $00                ; $1ACCB8 |
  db $FC, $00, $00, $04, $02                ; $1ACCBD |
  db $FC, $00, $02, $04, $02                ; $1ACCC2 |
  db $0A, $02, $1B, $84, $00                ; $1ACCC7 |
  db $FC, $00, $04, $04, $00                ; $1ACCCC |
  db $FC, $00, $04, $04, $02                ; $1ACCD1 |
  db $04, $00, $07, $04, $00                ; $1ACCD6 |
  db $FC, $00, $06, $04, $02                ; $1ACCDB |
  db $F8, $04, $1A, $04, $00                ; $1ACCE0 |
  db $00, $00, $08, $04, $02                ; $1ACCE5 |
  db $FC, $05, $1B, $44, $00                ; $1ACCEA |
  db $04, $00, $00, $44, $02                ; $1ACCEF |
  db $00, $00, $0C, $04, $00                ; $1ACCF4 |
  db $00, $00, $0C, $04, $02                ; $1ACCF9 |
  db $00, $08, $1E, $04, $00                ; $1ACCFE |
  db $00, $00, $0E, $04, $02                ; $1ACD03 |
  db $08, $08, $0C, $C4, $00                ; $1ACD08 |
  db $00, $00, $0C, $C4, $02                ; $1ACD0D |
  db $08, $00, $1E, $C4, $00                ; $1ACD12 |
  db $00, $00, $0E, $C4, $02                ; $1ACD17 |
  db $FC, $05, $1B, $44, $00                ; $1ACD1C |
  db $04, $00, $00, $44, $02                ; $1ACD21 |
  db $04, $00, $02, $44, $02                ; $1ACD26 |
  db $FE, $02, $1B, $C4, $00                ; $1ACD2B |
  db $0C, $00, $04, $44, $00                ; $1ACD30 |
  db $04, $00, $04, $44, $02                ; $1ACD35 |
  db $04, $00, $07, $44, $00                ; $1ACD3A |
  db $04, $00, $06, $44, $02                ; $1ACD3F |
  db $10, $04, $1A, $44, $00                ; $1ACD44 |
  db $00, $00, $08, $44, $02                ; $1ACD49 |
  db $0C, $05, $1B, $04, $00                ; $1ACD4E |
  db $FC, $00, $00, $04, $02                ; $1ACD53 |
  db $F8, $F8, $80, $01, $02                ; $1ACD58 |
  db $08, $F8, $82, $01, $02                ; $1ACD5D |
  db $F8, $08, $A0, $01, $02                ; $1ACD62 |
  db $08, $08, $A2, $01, $02                ; $1ACD67 |
  db $00, $00, $7C, $04, $00                ; $1ACD6C |
  db $00, $00, $7D, $02, $00                ; $1ACD71 |
  db $00, $00, $8C, $06, $00                ; $1ACD76 |
  db $00, $00, $00, $00, $00                ; $1ACD7B |
  db $00, $00, $00, $00, $00                ; $1ACD80 |
  db $00, $00, $00, $00, $00                ; $1ACD85 |
  db $00, $00, $CA, $00, $02                ; $1ACD8A |
  db $F9, $F9, $C6, $40, $00                ; $1ACD8F |
  db $F9, $01, $D6, $40, $00                ; $1ACD94 |
  db $0F, $F9, $C6, $00, $00                ; $1ACD99 |
  db $0F, $01, $D6, $00, $00                ; $1ACD9E |
  db $00, $FF, $CC, $00, $02                ; $1ACDA3 |
  db $F9, $01, $D7, $40, $00                ; $1ACDA8 |
  db $F6, $FE, $C7, $40, $00                ; $1ACDAD |
  db $0F, $01, $D7, $00, $00                ; $1ACDB2 |
  db $12, $FE, $C7, $00, $00                ; $1ACDB7 |
  db $00, $FE, $EA, $00, $02                ; $1ACDBC |
  db $F9, $04, $CE, $40, $00                ; $1ACDC1 |
  db $F1, $04, $DE, $40, $00                ; $1ACDC6 |
  db $17, $04, $DE, $00, $00                ; $1ACDCB |
  db $0F, $04, $CE, $00, $00                ; $1ACDD0 |
  db $00, $FD, $CC, $00, $02                ; $1ACDD5 |
  db $F9, $04, $CF, $40, $00                ; $1ACDDA |
  db $0F, $04, $CF, $00, $00                ; $1ACDDF |
  db $F7, $08, $DF, $40, $00                ; $1ACDE4 |
  db $11, $08, $DF, $00, $00                ; $1ACDE9 |
  db $07, $07, $7E, $80, $02                ; $1ACDEE |
  db $F9, $07, $7E, $C0, $02                ; $1ACDF3 |
  db $07, $F9, $7E, $00, $02                ; $1ACDF8 |
  db $F9, $F9, $9C, $00, $02                ; $1ACDFD |
  db $00, $00, $DD, $0B, $02                ; $1ACE02 |
  db $06, $08, $7E, $80, $02                ; $1ACE07 |
  db $FA, $08, $7E, $C0, $02                ; $1ACE0C |
  db $06, $F8, $7E, $00, $02                ; $1ACE11 |
  db $FA, $F8, $9C, $00, $02                ; $1ACE16 |
  db $00, $00, $DD, $0B, $02                ; $1ACE1B |
  db $08, $06, $7E, $80, $02                ; $1ACE20 |
  db $F8, $06, $7E, $C0, $02                ; $1ACE25 |
  db $08, $FA, $7E, $00, $02                ; $1ACE2A |
  db $F8, $FA, $9C, $00, $02                ; $1ACE2F |
  db $00, $00, $DD, $0B, $02                ; $1ACE34 |
  db $08, $08, $9E, $00, $00                ; $1ACE39 |
  db $00, $08, $9E, $00, $00                ; $1ACE3E |
  db $FF, $FB, $AE, $03, $02                ; $1ACE43 |
  db $08, $FC, $E2, $03, $02                ; $1ACE48 |
  db $F8, $FC, $E0, $03, $02                ; $1ACE4D |
  db $08, $EC, $C2, $03, $02                ; $1ACE52 |
  db $F8, $EC, $C0, $03, $02                ; $1ACE57 |
  db $08, $08, $9E, $00, $00                ; $1ACE5C |
  db $00, $08, $9E, $00, $00                ; $1ACE61 |
  db $FE, $FC, $AE, $03, $02                ; $1ACE66 |
  db $08, $FC, $E6, $03, $02                ; $1ACE6B |
  db $F8, $FC, $E4, $03, $02                ; $1ACE70 |
  db $08, $EC, $C6, $03, $02                ; $1ACE75 |
  db $F8, $EC, $C4, $03, $02                ; $1ACE7A |
  db $08, $08, $9E, $00, $00                ; $1ACE7F |
  db $00, $08, $9E, $00, $00                ; $1ACE84 |
  db $FE, $FD, $AE, $03, $02                ; $1ACE89 |
  db $F8, $FC, $E2, $03, $02                ; $1ACE8E |
  db $08, $FC, $E0, $03, $02                ; $1ACE93 |
  db $F8, $EC, $C2, $03, $02                ; $1ACE98 |
  db $08, $EC, $C0, $03, $02                ; $1ACE9D |
  db $08, $08, $9E, $00, $00                ; $1ACEA2 |
  db $00, $08, $9E, $00, $00                ; $1ACEA7 |
  db $FF, $FC, $AE, $03, $02                ; $1ACEAC |
  db $F8, $FC, $E6, $03, $02                ; $1ACEB1 |
  db $08, $FC, $E4, $03, $02                ; $1ACEB6 |
  db $F8, $EC, $C6, $03, $02                ; $1ACEBB |
  db $08, $EC, $C4, $03, $02                ; $1ACEC0 |
  db $0A, $09, $2F, $00, $00                ; $1ACEC5 |
  db $FA, $02, $2F, $40, $00                ; $1ACECA |
  db $FF, $FA, $AE, $03, $02                ; $1ACECF |
  db $08, $FB, $E2, $03, $02                ; $1ACED4 |
  db $F8, $FB, $E0, $03, $02                ; $1ACED9 |
  db $08, $EB, $C2, $03, $02                ; $1ACEDE |
  db $F8, $EB, $C0, $03, $02                ; $1ACEE3 |
  db $0C, $09, $2F, $00, $00                ; $1ACEE8 |
  db $FC, $05, $2F, $00, $00                ; $1ACEED |
  db $FF, $FA, $AE, $03, $02                ; $1ACEF2 |
  db $08, $FB, $E2, $03, $02                ; $1ACEF7 |
  db $F8, $FB, $E0, $03, $02                ; $1ACEFC |
  db $08, $EB, $C2, $03, $02                ; $1ACF01 |
  db $F8, $EB, $C0, $03, $02                ; $1ACF06 |
  db $0D, $07, $2F, $00, $00                ; $1ACF0B |
  db $FE, $08, $2E, $00, $00                ; $1ACF10 |
  db $FE, $FB, $AE, $03, $02                ; $1ACF15 |
  db $07, $FC, $E2, $03, $02                ; $1ACF1A |
  db $F7, $FC, $E0, $03, $02                ; $1ACF1F |
  db $07, $EC, $C2, $03, $02                ; $1ACF24 |
  db $F7, $EC, $C0, $03, $02                ; $1ACF29 |
  db $0B, $08, $2E, $C0, $00                ; $1ACF2E |
  db $00, $08, $9E, $00, $00                ; $1ACF33 |
  db $FE, $FC, $AE, $03, $02                ; $1ACF38 |
  db $07, $FD, $E2, $03, $02                ; $1ACF3D |
  db $F7, $FD, $E0, $03, $02                ; $1ACF42 |
  db $07, $ED, $C2, $03, $02                ; $1ACF47 |
  db $F7, $ED, $C0, $03, $02                ; $1ACF4C |
  db $09, $08, $2F, $00, $00                ; $1ACF51 |
  db $03, $08, $9E, $00, $00                ; $1ACF56 |
  db $FF, $FD, $AE, $03, $02                ; $1ACF5B |
  db $08, $FE, $E2, $03, $02                ; $1ACF60 |
  db $F8, $FE, $E0, $03, $02                ; $1ACF65 |
  db $08, $EE, $C2, $03, $02                ; $1ACF6A |
  db $F8, $EE, $C0, $03, $02                ; $1ACF6F |
  db $04, $08, $2F, $40, $00                ; $1ACF74 |
  db $05, $08, $9E, $00, $00                ; $1ACF79 |
  db $FF, $FC, $AE, $03, $02                ; $1ACF7E |
  db $08, $FD, $E2, $03, $02                ; $1ACF83 |
  db $F8, $FD, $E0, $03, $02                ; $1ACF88 |
  db $08, $ED, $C2, $03, $02                ; $1ACF8D |
  db $F8, $ED, $C0, $03, $02                ; $1ACF92 |
  db $01, $07, $2E, $40, $00                ; $1ACF97 |
  db $07, $08, $2E, $40, $00                ; $1ACF9C |
  db $FF, $FB, $AE, $03, $02                ; $1ACFA1 |
  db $08, $FC, $E2, $03, $02                ; $1ACFA6 |
  db $F8, $FC, $E0, $03, $02                ; $1ACFAB |
  db $08, $EC, $C2, $03, $02                ; $1ACFB0 |
  db $F8, $EC, $C0, $03, $02                ; $1ACFB5 |
  db $FD, $04, $2E, $00, $00                ; $1ACFBA |
  db $08, $08, $2E, $40, $00                ; $1ACFBF |
  db $FF, $FA, $AE, $03, $02                ; $1ACFC4 |
  db $08, $FB, $E2, $03, $02                ; $1ACFC9 |
  db $F8, $FB, $E0, $03, $02                ; $1ACFCE |
  db $08, $EB, $C2, $03, $02                ; $1ACFD3 |
  db $F8, $EB, $C0, $03, $02                ; $1ACFD8 |
  db $00, $09, $2F, $40, $00                ; $1ACFDD |
  db $08, $09, $2F, $00, $00                ; $1ACFE2 |
  db $FF, $F7, $AE, $03, $02                ; $1ACFE7 |
  db $08, $F8, $E2, $03, $02                ; $1ACFEC |
  db $F8, $F8, $E0, $03, $02                ; $1ACFF1 |
  db $08, $E8, $C2, $03, $02                ; $1ACFF6 |
  db $F8, $E8, $C0, $03, $02                ; $1ACFFB |
  db $FD, $05, $2E, $40, $00                ; $1AD000 |
  db $0B, $05, $2E, $00, $00                ; $1AD005 |
  db $FF, $F7, $AE, $03, $02                ; $1AD00A |
  db $08, $F8, $E2, $03, $02                ; $1AD00F |
  db $F8, $F8, $E0, $03, $02                ; $1AD014 |
  db $08, $E8, $C2, $03, $02                ; $1AD019 |
  db $F8, $E8, $C0, $03, $02                ; $1AD01E |
  db $FE, $02, $9E, $00, $00                ; $1AD023 |
  db $0B, $02, $9E, $00, $00                ; $1AD028 |
  db $FF, $F7, $AE, $03, $02                ; $1AD02D |
  db $08, $F8, $E2, $03, $02                ; $1AD032 |
  db $F8, $F8, $E0, $03, $02                ; $1AD037 |
  db $08, $E8, $C2, $03, $02                ; $1AD03C |
  db $F8, $E8, $C0, $03, $02                ; $1AD041 |
  db $FD, $01, $2E, $00, $00                ; $1AD046 |
  db $0B, $01, $2E, $40, $00                ; $1AD04B |
  db $FF, $F7, $AE, $03, $02                ; $1AD050 |
  db $08, $F8, $E2, $03, $02                ; $1AD055 |
  db $F8, $F8, $E0, $03, $02                ; $1AD05A |
  db $08, $E8, $C2, $03, $02                ; $1AD05F |
  db $F8, $E8, $C0, $03, $02                ; $1AD064 |
  db $FB, $01, $2F, $00, $00                ; $1AD069 |
  db $0D, $01, $2F, $40, $00                ; $1AD06E |
  db $FF, $F7, $AE, $03, $02                ; $1AD073 |
  db $08, $F8, $E2, $03, $02                ; $1AD078 |
  db $F8, $F8, $E0, $03, $02                ; $1AD07D |
  db $08, $E8, $C2, $03, $02                ; $1AD082 |
  db $F8, $E8, $C0, $03, $02                ; $1AD087 |
  db $00, $0D, $2E, $00, $00                ; $1AD08C |
  db $08, $0D, $2E, $40, $00                ; $1AD091 |
  db $00, $FD, $AE, $03, $02                ; $1AD096 |
  db $08, $F8, $E2, $03, $02                ; $1AD09B |
  db $F8, $F8, $E0, $03, $02                ; $1AD0A0 |
  db $08, $E8, $C2, $03, $02                ; $1AD0A5 |
  db $F8, $E8, $C0, $03, $02                ; $1AD0AA |
  db $F8, $00, $00, $00, $02                ; $1AD0AF |
  db $08, $00, $00, $40, $02                ; $1AD0B4 |
  db $F8, $00, $02, $00, $02                ; $1AD0B9 |
  db $08, $00, $04, $40, $02                ; $1AD0BE |
  db $F8, $00, $04, $00, $02                ; $1AD0C3 |
  db $08, $00, $02, $40, $02                ; $1AD0C8 |
  db $00, $F9, $06, $08, $02                ; $1AD0CD |
  db $08, $08, $0A, $02, $00                ; $1AD0D2 |
  db $00, $08, $1A, $02, $00                ; $1AD0D7 |
  db $00, $F9, $00, $08, $02                ; $1AD0DC |
  db $08, $08, $0A, $02, $00                ; $1AD0E1 |
  db $00, $08, $1A, $02, $00                ; $1AD0E6 |
  db $00, $F9, $02, $08, $02                ; $1AD0EB |
  db $08, $08, $0A, $02, $00                ; $1AD0F0 |
  db $00, $08, $1A, $02, $00                ; $1AD0F5 |
  db $00, $F8, $04, $08, $02                ; $1AD0FA |
  db $08, $08, $0A, $02, $00                ; $1AD0FF |
  db $00, $08, $1A, $02, $00                ; $1AD104 |
  db $00, $F9, $08, $08, $02                ; $1AD109 |
  db $08, $08, $0A, $02, $00                ; $1AD10E |
  db $00, $08, $1A, $02, $00                ; $1AD113 |
  db $00, $F9, $04, $08, $02                ; $1AD118 |
  db $08, $08, $0A, $02, $00                ; $1AD11D |
  db $00, $08, $1A, $02, $00                ; $1AD122 |
  db $00, $FA, $06, $08, $02                ; $1AD127 |
  db $08, $08, $0A, $02, $00                ; $1AD12C |
  db $00, $08, $1A, $02, $00                ; $1AD131 |
  db $00, $FA, $08, $08, $02                ; $1AD136 |
  db $08, $08, $0A, $02, $00                ; $1AD13B |
  db $00, $08, $1A, $02, $00                ; $1AD140 |
  db $00, $F8, $04, $08, $02                ; $1AD145 |
  db $08, $08, $0A, $02, $00                ; $1AD14A |
  db $00, $08, $1A, $02, $00                ; $1AD14F |
  db $00, $F9, $06, $08, $02                ; $1AD154 |
  db $08, $08, $0A, $02, $00                ; $1AD159 |
  db $00, $08, $1A, $02, $00                ; $1AD15E |
  db $00, $F9, $08, $08, $02                ; $1AD163 |
  db $08, $08, $0A, $02, $00                ; $1AD168 |
  db $00, $08, $1A, $02, $00                ; $1AD16D |
  db $FD, $08, $07, $00, $00                ; $1AD172 |
  db $0C, $EB, $06, $00, $00                ; $1AD177 |
  db $01, $DA, $0A, $00, $02                ; $1AD17C |
  db $01, $E9, $0A, $00, $02                ; $1AD181 |
  db $03, $E0, $00, $00, $02                ; $1AD186 |
  db $00, $EB, $06, $00, $00                ; $1AD18B |
  db $09, $08, $17, $00, $00                ; $1AD190 |
  db $FD, $08, $07, $00, $00                ; $1AD195 |
  db $01, $F8, $0A, $00, $02                ; $1AD19A |
  db $0B, $E9, $06, $00, $00                ; $1AD19F |
  db $09, $D7, $08, $00, $00                ; $1AD1A4 |
  db $01, $DA, $0D, $40, $02                ; $1AD1A9 |
  db $01, $E9, $0D, $40, $02                ; $1AD1AE |
  db $03, $DF, $00, $00, $02                ; $1AD1B3 |
  db $01, $EB, $06, $00, $00                ; $1AD1B8 |
  db $08, $05, $17, $00, $00                ; $1AD1BD |
  db $FE, $08, $07, $00, $00                ; $1AD1C2 |
  db $01, $F8, $0D, $40, $02                ; $1AD1C7 |
  db $09, $E8, $06, $00, $00                ; $1AD1CC |
  db $07, $D5, $08, $00, $00                ; $1AD1D1 |
  db $00, $DA, $0C, $00, $02                ; $1AD1D6 |
  db $00, $E9, $0C, $00, $02                ; $1AD1DB |
  db $03, $DE, $00, $00, $02                ; $1AD1E0 |
  db $01, $EB, $06, $00, $00                ; $1AD1E5 |
  db $06, $03, $17, $00, $00                ; $1AD1EA |
  db $FE, $08, $07, $00, $00                ; $1AD1EF |
  db $00, $F8, $0C, $00, $02                ; $1AD1F4 |
  db $08, $E7, $06, $00, $00                ; $1AD1F9 |
  db $06, $D4, $08, $00, $00                ; $1AD1FE |
  db $00, $DA, $0B, $40, $02                ; $1AD203 |
  db $00, $E9, $0B, $40, $02                ; $1AD208 |
  db $03, $DD, $02, $00, $02                ; $1AD20D |
  db $02, $EB, $06, $00, $00                ; $1AD212 |
  db $05, $02, $17, $00, $00                ; $1AD217 |
  db $FF, $08, $07, $00, $00                ; $1AD21C |
  db $00, $F8, $0B, $40, $02                ; $1AD221 |
  db $06, $E6, $06, $00, $00                ; $1AD226 |
  db $04, $D3, $08, $00, $00                ; $1AD22B |
  db $FF, $DA, $0E, $00, $02                ; $1AD230 |
  db $FF, $E9, $0E, $00, $02                ; $1AD235 |
  db $02, $EB, $06, $00, $00                ; $1AD23A |
  db $03, $DC, $02, $00, $02                ; $1AD23F |
  db $03, $01, $07, $00, $00                ; $1AD244 |
  db $FF, $08, $07, $00, $00                ; $1AD249 |
  db $FF, $F8, $0E, $00, $02                ; $1AD24E |
  db $05, $E6, $06, $00, $00                ; $1AD253 |
  db $03, $D3, $08, $00, $00                ; $1AD258 |
  db $FF, $DA, $09, $40, $02                ; $1AD25D |
  db $FF, $E9, $09, $40, $02                ; $1AD262 |
  db $03, $EB, $06, $00, $00                ; $1AD267 |
  db $03, $DC, $02, $00, $02                ; $1AD26C |
  db $02, $00, $07, $00, $00                ; $1AD271 |
  db $00, $08, $07, $00, $00                ; $1AD276 |
  db $FF, $F8, $09, $40, $02                ; $1AD27B |
  db $03, $E6, $06, $00, $00                ; $1AD280 |
  db $03, $DC, $04, $00, $02                ; $1AD285 |
  db $01, $D3, $08, $00, $00                ; $1AD28A |
  db $FF, $DA, $09, $40, $02                ; $1AD28F |
  db $FF, $E9, $09, $40, $02                ; $1AD294 |
  db $05, $EB, $06, $00, $00                ; $1AD299 |
  db $00, $00, $07, $00, $00                ; $1AD29E |
  db $02, $08, $07, $00, $00                ; $1AD2A3 |
  db $FF, $F8, $09, $40, $02                ; $1AD2A8 |
  db $02, $E6, $06, $00, $00                ; $1AD2AD |
  db $03, $DC, $04, $00, $02                ; $1AD2B2 |
  db $00, $D3, $08, $00, $00                ; $1AD2B7 |
  db $FF, $DA, $0E, $00, $02                ; $1AD2BC |
  db $FF, $E9, $0E, $00, $02                ; $1AD2C1 |
  db $06, $EB, $06, $00, $00                ; $1AD2C6 |
  db $FF, $01, $07, $00, $00                ; $1AD2CB |
  db $03, $08, $07, $00, $00                ; $1AD2D0 |
  db $FF, $F8, $0E, $00, $02                ; $1AD2D5 |
  db $02, $E7, $06, $00, $00                ; $1AD2DA |
  db $03, $DD, $04, $00, $02                ; $1AD2DF |
  db $00, $D4, $08, $00, $00                ; $1AD2E4 |
  db $00, $DA, $0B, $40, $02                ; $1AD2E9 |
  db $00, $E9, $0B, $40, $02                ; $1AD2EE |
  db $08, $EB, $06, $00, $00                ; $1AD2F3 |
  db $FF, $02, $18, $00, $00                ; $1AD2F8 |
  db $05, $08, $07, $00, $00                ; $1AD2FD |
  db $00, $F8, $0B, $40, $02                ; $1AD302 |
  db $01, $E8, $06, $00, $00                ; $1AD307 |
  db $03, $DE, $04, $00, $02                ; $1AD30C |
  db $FF, $D6, $08, $00, $00                ; $1AD311 |
  db $00, $DA, $0C, $00, $02                ; $1AD316 |
  db $00, $E9, $0C, $00, $02                ; $1AD31B |
  db $09, $EB, $06, $00, $00                ; $1AD320 |
  db $FE, $03, $18, $00, $00                ; $1AD325 |
  db $06, $08, $07, $00, $00                ; $1AD32A |
  db $00, $F8, $0C, $00, $02                ; $1AD32F |
  db $01, $E9, $06, $00, $00                ; $1AD334 |
  db $03, $DF, $04, $00, $02                ; $1AD339 |
  db $FF, $D7, $08, $00, $00                ; $1AD33E |
  db $01, $DA, $0D, $40, $02                ; $1AD343 |
  db $01, $E9, $0D, $40, $02                ; $1AD348 |
  db $0B, $EB, $06, $00, $00                ; $1AD34D |
  db $FE, $05, $18, $00, $00                ; $1AD352 |
  db $08, $08, $07, $00, $00                ; $1AD357 |
  db $01, $F8, $0D, $40, $02                ; $1AD35C |
  db $FD, $08, $18, $00, $00                ; $1AD361 |
  db $00, $EB, $06, $00, $00                ; $1AD366 |
  db $03, $E0, $04, $00, $02                ; $1AD36B |
  db $01, $DA, $0A, $00, $02                ; $1AD370 |
  db $01, $E9, $0A, $00, $02                ; $1AD375 |
  db $0C, $EB, $06, $00, $00                ; $1AD37A |
  db $09, $08, $07, $00, $00                ; $1AD37F |
  db $FD, $08, $18, $00, $00                ; $1AD384 |
  db $01, $F8, $0A, $00, $02                ; $1AD389 |
  db $FD, $08, $07, $00, $00                ; $1AD38E |
  db $00, $EB, $06, $00, $00                ; $1AD393 |
  db $03, $E0, $04, $00, $02                ; $1AD398 |
  db $01, $DA, $0A, $00, $02                ; $1AD39D |
  db $01, $E9, $0A, $00, $02                ; $1AD3A2 |
  db $0C, $EB, $06, $00, $00                ; $1AD3A7 |
  db $09, $08, $17, $00, $00                ; $1AD3AC |
  db $FD, $08, $07, $00, $00                ; $1AD3B1 |
  db $01, $F8, $0A, $00, $02                ; $1AD3B6 |
  db $01, $EB, $06, $00, $00                ; $1AD3BB |
  db $09, $D7, $08, $00, $00                ; $1AD3C0 |
  db $03, $DF, $04, $00, $02                ; $1AD3C5 |
  db $01, $DA, $0D, $40, $02                ; $1AD3CA |
  db $01, $E9, $0D, $40, $02                ; $1AD3CF |
  db $0B, $E9, $06, $00, $00                ; $1AD3D4 |
  db $08, $05, $17, $00, $00                ; $1AD3D9 |
  db $FE, $08, $07, $00, $00                ; $1AD3DE |
  db $01, $F8, $0D, $40, $02                ; $1AD3E3 |
  db $01, $EB, $06, $00, $00                ; $1AD3E8 |
  db $03, $DE, $04, $00, $02                ; $1AD3ED |
  db $07, $D5, $08, $00, $00                ; $1AD3F2 |
  db $00, $DA, $0C, $00, $02                ; $1AD3F7 |
  db $00, $E9, $0C, $00, $02                ; $1AD3FC |
  db $09, $E8, $06, $00, $00                ; $1AD401 |
  db $06, $03, $17, $00, $00                ; $1AD406 |
  db $FE, $08, $07, $00, $00                ; $1AD40B |
  db $00, $F8, $0C, $00, $02                ; $1AD410 |
  db $05, $02, $17, $00, $00                ; $1AD415 |
  db $02, $EB, $06, $00, $00                ; $1AD41A |
  db $03, $DD, $04, $00, $02                ; $1AD41F |
  db $06, $D4, $08, $00, $00                ; $1AD424 |
  db $00, $DA, $0B, $40, $02                ; $1AD429 |
  db $00, $E9, $0B, $40, $02                ; $1AD42E |
  db $05, $02, $17, $00, $00                ; $1AD433 |
  db $FF, $08, $07, $00, $00                ; $1AD438 |
  db $00, $F8, $0B, $40, $02                ; $1AD43D |
  db $03, $01, $07, $00, $00                ; $1AD442 |
  db $02, $EB, $06, $00, $00                ; $1AD447 |
  db $03, $DC, $04, $00, $02                ; $1AD44C |
  db $04, $D3, $08, $00, $00                ; $1AD451 |
  db $FF, $DA, $0E, $00, $02                ; $1AD456 |
  db $FF, $E9, $0E, $00, $02                ; $1AD45B |
  db $03, $01, $07, $00, $00                ; $1AD460 |
  db $FF, $08, $07, $00, $00                ; $1AD465 |
  db $FF, $F8, $0E, $00, $02                ; $1AD46A |
  db $01, $00, $07, $00, $00                ; $1AD46F |
  db $02, $EB, $06, $00, $00                ; $1AD474 |
  db $03, $DC, $04, $00, $02                ; $1AD479 |
  db $02, $D3, $08, $00, $00                ; $1AD47E |
  db $FE, $DA, $09, $40, $02                ; $1AD483 |
  db $FE, $E9, $09, $40, $02                ; $1AD488 |
  db $01, $00, $07, $00, $00                ; $1AD48D |
  db $FF, $08, $07, $00, $00                ; $1AD492 |
  db $FE, $F8, $09, $40, $02                ; $1AD497 |
  db $04, $EB, $06, $00, $00                ; $1AD49C |
  db $00, $D3, $08, $00, $00                ; $1AD4A1 |
  db $FE, $DA, $09, $40, $02                ; $1AD4A6 |
  db $FE, $E9, $09, $40, $02                ; $1AD4AB |
  db $FF, $00, $07, $00, $00                ; $1AD4B0 |
  db $FE, $F8, $09, $40, $02                ; $1AD4B5 |
  db $02, $DC, $02, $00, $02                ; $1AD4BA |
  db $02, $E6, $06, $00, $00                ; $1AD4BF |
  db $01, $08, $07, $00, $00                ; $1AD4C4 |
  db $06, $EB, $06, $00, $00                ; $1AD4C9 |
  db $00, $D3, $08, $00, $00                ; $1AD4CE |
  db $FF, $DA, $0E, $00, $02                ; $1AD4D3 |
  db $FF, $E9, $0E, $00, $02                ; $1AD4D8 |
  db $03, $DC, $02, $00, $02                ; $1AD4DD |
  db $02, $E6, $06, $00, $00                ; $1AD4E2 |
  db $FF, $01, $07, $00, $00                ; $1AD4E7 |
  db $03, $08, $07, $00, $00                ; $1AD4EC |
  db $FF, $F8, $0E, $00, $02                ; $1AD4F1 |
  db $08, $EB, $06, $00, $00                ; $1AD4F6 |
  db $00, $D4, $08, $00, $00                ; $1AD4FB |
  db $00, $DA, $0B, $40, $02                ; $1AD500 |
  db $00, $E9, $0B, $40, $02                ; $1AD505 |
  db $03, $DD, $02, $00, $02                ; $1AD50A |
  db $02, $E7, $06, $00, $00                ; $1AD50F |
  db $FF, $02, $18, $00, $00                ; $1AD514 |
  db $05, $08, $07, $00, $00                ; $1AD519 |
  db $00, $F8, $0B, $40, $02                ; $1AD51E |
  db $09, $EB, $06, $00, $00                ; $1AD523 |
  db $FF, $D6, $08, $00, $00                ; $1AD528 |
  db $00, $DA, $0C, $00, $02                ; $1AD52D |
  db $00, $E9, $0C, $00, $02                ; $1AD532 |
  db $03, $DE, $02, $00, $02                ; $1AD537 |
  db $01, $E8, $06, $00, $00                ; $1AD53C |
  db $FE, $03, $18, $00, $00                ; $1AD541 |
  db $06, $08, $07, $00, $00                ; $1AD546 |
  db $00, $F8, $0C, $00, $02                ; $1AD54B |
  db $0B, $EB, $06, $00, $00                ; $1AD550 |
  db $FF, $D7, $08, $00, $00                ; $1AD555 |
  db $01, $DA, $0D, $40, $02                ; $1AD55A |
  db $01, $E9, $0D, $40, $02                ; $1AD55F |
  db $03, $DF, $00, $00, $02                ; $1AD564 |
  db $01, $E9, $06, $00, $00                ; $1AD569 |
  db $FE, $05, $18, $00, $00                ; $1AD56E |
  db $08, $08, $07, $00, $00                ; $1AD573 |
  db $01, $F8, $0D, $40, $02                ; $1AD578 |
  db $09, $08, $07, $00, $00                ; $1AD57D |
  db $01, $DA, $0A, $00, $02                ; $1AD582 |
  db $0C, $EB, $06, $00, $00                ; $1AD587 |
  db $01, $E9, $0A, $00, $02                ; $1AD58C |
  db $03, $E0, $00, $00, $02                ; $1AD591 |
  db $00, $EB, $06, $00, $00                ; $1AD596 |
  db $09, $08, $07, $00, $00                ; $1AD59B |
  db $FD, $08, $18, $00, $00                ; $1AD5A0 |
  db $01, $F8, $0A, $00, $02                ; $1AD5A5 |
  db $00, $DA, $0C, $00, $00                ; $1AD5AA |
  db $FE, $08, $18, $00, $00                ; $1AD5AF |
  db $09, $EC, $06, $00, $00                ; $1AD5B4 |
  db $00, $DA, $0C, $00, $02                ; $1AD5B9 |
  db $00, $E9, $0C, $00, $02                ; $1AD5BE |
  db $01, $EC, $06, $00, $00                ; $1AD5C3 |
  db $06, $08, $18, $00, $00                ; $1AD5C8 |
  db $FE, $08, $18, $00, $00                ; $1AD5CD |
  db $00, $F8, $0C, $00, $02                ; $1AD5D2 |
  db $00, $00, $E3, $00, $00                ; $1AD5D7 |
  db $08, $00, $E4, $00, $00                ; $1AD5DC |
  db $00, $08, $F3, $00, $00                ; $1AD5E1 |
  db $08, $08, $F4, $00, $00                ; $1AD5E6 |
  db $00, $00, $E3, $00, $00                ; $1AD5EB |
  db $08, $00, $E4, $00, $00                ; $1AD5F0 |
  db $00, $08, $F3, $00, $00                ; $1AD5F5 |
  db $00, $00, $E5, $00, $00                ; $1AD5FA |
  db $08, $00, $E6, $00, $00                ; $1AD5FF |
  db $00, $08, $F5, $00, $00                ; $1AD604 |
  db $08, $08, $F6, $00, $00                ; $1AD609 |
  db $06, $F7, $77, $00, $00                ; $1AD60E |
  db $FA, $04, $77, $00, $00                ; $1AD613 |
  db $0C, $0C, $77, $00, $00                ; $1AD618 |
  db $00, $00, $46, $00, $00                ; $1AD61D |
  db $08, $00, $47, $00, $00                ; $1AD622 |
  db $00, $08, $56, $00, $00                ; $1AD627 |
  db $08, $08, $57, $00, $00                ; $1AD62C |
  db $07, $F6, $77, $00, $00                ; $1AD631 |
  db $F7, $09, $77, $00, $00                ; $1AD636 |
  db $0F, $0E, $77, $00, $00                ; $1AD63B |
  db $09, $F5, $44, $00, $00                ; $1AD640 |
  db $F3, $0C, $44, $00, $00                ; $1AD645 |
  db $13, $13, $44, $00, $00                ; $1AD64A |
  db $09, $F5, $44, $00, $00                ; $1AD64F |
  db $F3, $0C, $44, $00, $00                ; $1AD654 |
  db $13, $13, $44, $00, $00                ; $1AD659 |
  db $09, $F5, $44, $00, $00                ; $1AD65E |
  db $00, $00, $E7, $00, $00                ; $1AD663 |
  db $08, $00, $E8, $00, $00                ; $1AD668 |
  db $00, $08, $F7, $00, $00                ; $1AD66D |
  db $08, $08, $F8, $00, $00                ; $1AD672 |
  db $00, $00, $E5, $00, $00                ; $1AD677 |
  db $08, $00, $E6, $00, $00                ; $1AD67C |
  db $00, $08, $F5, $00, $00                ; $1AD681 |
  db $08, $08, $F6, $00, $00                ; $1AD686 |
  db $00, $00, $E3, $00, $00                ; $1AD68B |
  db $08, $00, $E4, $00, $00                ; $1AD690 |
  db $00, $08, $F3, $00, $00                ; $1AD695 |
  db $08, $08, $F4, $00, $00                ; $1AD69A |
  db $F8, $F8, $42, $04, $02                ; $1AD69F |
  db $08, $F8, $42, $44, $02                ; $1AD6A4 |
  db $F8, $08, $42, $84, $02                ; $1AD6A9 |
  db $08, $08, $42, $C4, $02                ; $1AD6AE |
  db $06, $FA, $48, $09, $02                ; $1AD6B3 |
  db $FD, $F8, $40, $05, $02                ; $1AD6B8 |
  db $FE, $08, $2E, $00, $00                ; $1AD6BD |
  db $07, $05, $55, $05, $00                ; $1AD6C2 |
  db $FF, $05, $54, $05, $00                ; $1AD6C7 |
  db $0B, $05, $2F, $00, $00                ; $1AD6CC |
  db $06, $F9, $48, $09, $02                ; $1AD6D1 |
  db $FE, $F7, $40, $05, $02                ; $1AD6D6 |
  db $FF, $04, $54, $05, $00                ; $1AD6DB |
  db $07, $04, $55, $05, $00                ; $1AD6E0 |
  db $01, $08, $9E, $00, $00                ; $1AD6E5 |
  db $01, $08, $9E, $00, $00                ; $1AD6EA |
  db $04, $08, $9E, $00, $00                ; $1AD6EF |
  db $06, $F8, $48, $09, $02                ; $1AD6F4 |
  db $04, $08, $9E, $00, $00                ; $1AD6F9 |
  db $07, $04, $55, $05, $00                ; $1AD6FE |
  db $FF, $04, $54, $05, $00                ; $1AD703 |
  db $FE, $F6, $40, $05, $02                ; $1AD708 |
  db $07, $F9, $48, $09, $02                ; $1AD70D |
  db $07, $08, $2E, $40, $00                ; $1AD712 |
  db $FD, $F7, $40, $05, $02                ; $1AD717 |
  db $07, $08, $2E, $40, $00                ; $1AD71C |
  db $06, $05, $55, $05, $00                ; $1AD721 |
  db $FE, $05, $54, $05, $00                ; $1AD726 |
  db $FC, $06, $2F, $00, $00                ; $1AD72B |
  db $0B, $08, $2F, $80, $00                ; $1AD730 |
  db $06, $FB, $48, $09, $02                ; $1AD735 |
  db $FD, $F8, $40, $05, $02                ; $1AD73A |
  db $06, $06, $55, $05, $00                ; $1AD73F |
  db $FE, $06, $54, $05, $00                ; $1AD744 |
  db $07, $F7, $46, $49, $02                ; $1AD749 |
  db $FE, $08, $9E, $00, $00                ; $1AD74E |
  db $0C, $08, $9E, $00, $00                ; $1AD753 |
  db $FE, $F8, $40, $05, $02                ; $1AD758 |
  db $08, $06, $55, $05, $00                ; $1AD75D |
  db $00, $06, $54, $05, $00                ; $1AD762 |
  db $0B, $F7, $46, $49, $02                ; $1AD767 |
  db $00, $F7, $40, $05, $02                ; $1AD76C |
  db $01, $07, $2E, $40, $00                ; $1AD771 |
  db $09, $05, $55, $05, $00                ; $1AD776 |
  db $01, $05, $54, $05, $00                ; $1AD77B |
  db $0C, $08, $9E, $00, $00                ; $1AD780 |
  db $0D, $F5, $46, $49, $02                ; $1AD785 |
  db $01, $F6, $40, $05, $02                ; $1AD78A |
  db $05, $05, $2E, $40, $00                ; $1AD78F |
  db $0B, $03, $55, $05, $00                ; $1AD794 |
  db $03, $03, $54, $05, $00                ; $1AD799 |
  db $0C, $08, $9E, $00, $00                ; $1AD79E |
  db $09, $04, $2E, $40, $00                ; $1AD7A3 |
  db $0C, $08, $9E, $00, $00                ; $1AD7A8 |
  db $0A, $F2, $46, $09, $02                ; $1AD7AD |
  db $02, $F5, $40, $05, $02                ; $1AD7B2 |
  db $0D, $02, $55, $05, $00                ; $1AD7B7 |
  db $05, $02, $54, $05, $00                ; $1AD7BC |
  db $FE, $F8, $40, $05, $02                ; $1AD7C1 |
  db $FE, $08, $9E, $00, $00                ; $1AD7C6 |
  db $0C, $08, $9E, $00, $00                ; $1AD7CB |
  db $0B, $FA, $48, $09, $02                ; $1AD7D0 |
  db $08, $06, $55, $05, $00                ; $1AD7D5 |
  db $00, $06, $54, $05, $00                ; $1AD7DA |
  db $04, $07, $48, $89, $02                ; $1AD7DF |
  db $FF, $F8, $40, $05, $02                ; $1AD7E4 |
  db $0C, $08, $2E, $40, $00                ; $1AD7E9 |
  db $FD, $08, $9E, $00, $00                ; $1AD7EE |
  db $06, $06, $55, $05, $00                ; $1AD7F3 |
  db $FE, $06, $54, $05, $00                ; $1AD7F8 |
  db $F1, $02, $48, $C9, $02                ; $1AD7FD |
  db $00, $F8, $42, $05, $02                ; $1AD802 |
  db $05, $06, $55, $05, $00                ; $1AD807 |
  db $FD, $06, $54, $05, $00                ; $1AD80C |
  db $0C, $08, $2F, $80, $00                ; $1AD811 |
  db $FC, $08, $2E, $00, $00                ; $1AD816 |
  db $01, $F7, $42, $05, $02                ; $1AD81B |
  db $F2, $F6, $48, $49, $02                ; $1AD820 |
  db $05, $06, $55, $05, $00                ; $1AD825 |
  db $FD, $06, $54, $05, $00                ; $1AD82A |
  db $0C, $08, $2F, $80, $00                ; $1AD82F |
  db $FB, $08, $2E, $00, $00                ; $1AD834 |
  db $FF, $F7, $42, $05, $02                ; $1AD839 |
  db $F9, $F1, $46, $49, $02                ; $1AD83E |
  db $0B, $08, $2F, $80, $00                ; $1AD843 |
  db $04, $05, $55, $05, $00                ; $1AD848 |
  db $FC, $05, $54, $05, $00                ; $1AD84D |
  db $FB, $08, $2E, $00, $00                ; $1AD852 |
  db $FD, $F6, $42, $05, $02                ; $1AD857 |
  db $04, $F1, $48, $09, $02                ; $1AD85C |
  db $09, $08, $2F, $80, $00                ; $1AD861 |
  db $03, $05, $55, $05, $00                ; $1AD866 |
  db $FB, $05, $54, $05, $00                ; $1AD86B |
  db $FB, $08, $2E, $00, $00                ; $1AD870 |
  db $FC, $F6, $42, $05, $02                ; $1AD875 |
  db $05, $F3, $48, $09, $02                ; $1AD87A |
  db $08, $08, $2F, $80, $00                ; $1AD87F |
  db $03, $05, $55, $05, $00                ; $1AD884 |
  db $FB, $05, $54, $05, $00                ; $1AD889 |
  db $FA, $08, $9E, $00, $00                ; $1AD88E |
  db $FC, $F6, $42, $05, $02                ; $1AD893 |
  db $01, $F0, $46, $49, $02                ; $1AD898 |
  db $09, $08, $2F, $80, $00                ; $1AD89D |
  db $03, $05, $55, $05, $00                ; $1AD8A2 |
  db $FB, $05, $54, $05, $00                ; $1AD8A7 |
  db $FA, $08, $9E, $00, $00                ; $1AD8AC |
  db $FC, $F7, $42, $05, $02                ; $1AD8B1 |
  db $0A, $08, $2F, $80, $00                ; $1AD8B6 |
  db $FB, $08, $9E, $00, $00                ; $1AD8BB |
  db $04, $05, $55, $05, $00                ; $1AD8C0 |
  db $FC, $05, $54, $05, $00                ; $1AD8C5 |
  db $F8, $F0, $46, $09, $02                ; $1AD8CA |
  db $FD, $F7, $42, $05, $02                ; $1AD8CF |
  db $F0, $FA, $48, $49, $02                ; $1AD8D4 |
  db $0A, $08, $2E, $40, $00                ; $1AD8D9 |
  db $FC, $08, $9E, $00, $00                ; $1AD8DE |
  db $05, $05, $55, $05, $00                ; $1AD8E3 |
  db $FD, $05, $54, $05, $00                ; $1AD8E8 |
  db $F2, $06, $48, $C9, $02                ; $1AD8ED |
  db $FD, $F8, $42, $05, $02                ; $1AD8F2 |
  db $0B, $08, $2E, $40, $00                ; $1AD8F7 |
  db $FD, $08, $9E, $00, $00                ; $1AD8FC |
  db $05, $06, $55, $05, $00                ; $1AD901 |
  db $FD, $06, $54, $05, $00                ; $1AD906 |
  db $00, $09, $46, $C9, $02                ; $1AD90B |
  db $0C, $08, $9E, $00, $00                ; $1AD910 |
  db $FD, $F8, $40, $05, $02                ; $1AD915 |
  db $FD, $08, $9E, $00, $00                ; $1AD91A |
  db $06, $06, $55, $05, $00                ; $1AD91F |
  db $FE, $06, $54, $05, $00                ; $1AD924 |
  db $0B, $04, $48, $89, $02                ; $1AD929 |
  db $0C, $08, $9E, $00, $00                ; $1AD92E |
  db $FE, $F8, $40, $05, $02                ; $1AD933 |
  db $FE, $08, $9E, $00, $00                ; $1AD938 |
  db $07, $06, $55, $05, $00                ; $1AD93D |
  db $FF, $06, $54, $05, $00                ; $1AD942 |
  db $03, $00, $48, $09, $02                ; $1AD947 |
  db $FD, $09, $2F, $00, $00                ; $1AD94C |
  db $F9, $09, $2F, $00, $00                ; $1AD951 |
  db $FB, $FD, $40, $05, $02                ; $1AD956 |
  db $04, $08, $55, $05, $00                ; $1AD95B |
  db $FC, $08, $54, $05, $00                ; $1AD960 |
  db $04, $FF, $48, $09, $02                ; $1AD965 |
  db $FC, $09, $2F, $00, $00                ; $1AD96A |
  db $F8, $09, $2F, $00, $00                ; $1AD96F |
  db $FC, $F9, $40, $05, $02                ; $1AD974 |
  db $04, $08, $55, $05, $00                ; $1AD979 |
  db $FC, $08, $54, $05, $00                ; $1AD97E |
  db $04, $FF, $48, $09, $02                ; $1AD983 |
  db $FC, $09, $2F, $00, $00                ; $1AD988 |
  db $F8, $09, $2F, $00, $00                ; $1AD98D |
  db $FA, $F9, $42, $05, $02                ; $1AD992 |
  db $04, $08, $55, $05, $00                ; $1AD997 |
  db $FC, $08, $54, $05, $00                ; $1AD99C |
  db $04, $FF, $48, $09, $02                ; $1AD9A1 |
  db $FC, $09, $2F, $00, $00                ; $1AD9A6 |
  db $F8, $09, $2F, $00, $00                ; $1AD9AB |
  db $FC, $F9, $40, $45, $02                ; $1AD9B0 |
  db $04, $08, $55, $05, $00                ; $1AD9B5 |
  db $FC, $08, $54, $05, $00                ; $1AD9BA |
  db $04, $FC, $48, $09, $02                ; $1AD9BF |
  db $04, $08, $9E, $00, $00                ; $1AD9C4 |
  db $00, $08, $9E, $00, $00                ; $1AD9C9 |
  db $FB, $FA, $40, $05, $02                ; $1AD9CE |
  db $07, $06, $55, $05, $00                ; $1AD9D3 |
  db $FF, $06, $54, $05, $00                ; $1AD9D8 |
  db $05, $F8, $48, $09, $02                ; $1AD9DD |
  db $FC, $F4, $40, $05, $02                ; $1AD9E2 |
  db $04, $02, $55, $05, $00                ; $1AD9E7 |
  db $FC, $02, $54, $05, $00                ; $1AD9EC |
  db $05, $08, $2F, $80, $00                ; $1AD9F1 |
  db $01, $08, $2F, $80, $00                ; $1AD9F6 |
  db $F8, $F1, $C0, $03, $02                ; $1AD9FB |
  db $08, $F1, $C2, $03, $02                ; $1ADA00 |
  db $F8, $01, $E0, $03, $02                ; $1ADA05 |
  db $08, $01, $E2, $03, $02                ; $1ADA0A |
  db $F6, $01, $2F, $02, $00                ; $1ADA0F |
  db $0C, $0C, $2E, $42, $00                ; $1ADA14 |
  db $12, $0E, $2F, $42, $00                ; $1ADA19 |
  db $F5, $07, $2F, $02, $00                ; $1ADA1E |
  db $F8, $F3, $C0, $03, $02                ; $1ADA23 |
  db $08, $F3, $C2, $03, $02                ; $1ADA28 |
  db $F8, $03, $E0, $03, $02                ; $1ADA2D |
  db $08, $03, $E2, $03, $02                ; $1ADA32 |
  db $F7, $0C, $2F, $02, $00                ; $1ADA37 |
  db $F8, $F4, $C4, $03, $02                ; $1ADA3C |
  db $08, $F4, $C6, $03, $02                ; $1ADA41 |
  db $F8, $04, $E4, $03, $02                ; $1ADA46 |
  db $08, $04, $E6, $03, $02                ; $1ADA4B |
  db $14, $0A, $2F, $02, $00                ; $1ADA50 |
  db $FB, $0C, $2E, $02, $00                ; $1ADA55 |
  db $FB, $0C, $2E, $02, $00                ; $1ADA5A |
  db $F8, $F3, $C4, $03, $02                ; $1ADA5F |
  db $08, $F3, $C6, $03, $02                ; $1ADA64 |
  db $F8, $03, $E4, $03, $02                ; $1ADA69 |
  db $08, $03, $E6, $03, $02                ; $1ADA6E |
  db $00, $0C, $9E, $02, $00                ; $1ADA73 |
  db $00, $0C, $9E, $02, $00                ; $1ADA78 |
  db $F8, $F1, $C4, $03, $02                ; $1ADA7D |
  db $08, $F1, $C6, $03, $02                ; $1ADA82 |
  db $F8, $01, $E4, $03, $02                ; $1ADA87 |
  db $08, $01, $E6, $03, $02                ; $1ADA8C |
  db $06, $0C, $9E, $02, $00                ; $1ADA91 |
  db $06, $0C, $9E, $02, $00                ; $1ADA96 |
  db $F8, $F0, $C0, $03, $02                ; $1ADA9B |
  db $08, $F0, $C2, $03, $02                ; $1ADAA0 |
  db $F8, $00, $E0, $03, $02                ; $1ADAA5 |
  db $08, $00, $E2, $03, $02                ; $1ADAAA |
  db $06, $09, $2F, $02, $00                ; $1ADAAF |
  db $05, $09, $2F, $02, $00                ; $1ADAB4 |
  db $F8, $F4, $C4, $03, $02                ; $1ADAB9 |
  db $08, $F4, $C6, $03, $02                ; $1ADABE |
  db $F8, $04, $E4, $03, $02                ; $1ADAC3 |
  db $08, $04, $E6, $03, $02                ; $1ADAC8 |
  db $06, $0C, $2E, $02, $00                ; $1ADACD |
  db $FB, $0C, $2E, $02, $00                ; $1ADAD2 |
  db $F8, $F4, $C8, $03, $02                ; $1ADAD7 |
  db $08, $F4, $CA, $03, $02                ; $1ADADC |
  db $F8, $04, $E8, $03, $02                ; $1ADAE1 |
  db $08, $04, $EA, $03, $02                ; $1ADAE6 |
  db $F8, $ED, $C0, $03, $02                ; $1ADAEB |
  db $08, $ED, $C2, $03, $02                ; $1ADAF0 |
  db $F8, $FD, $E0, $03, $02                ; $1ADAF5 |
  db $08, $FD, $E2, $03, $02                ; $1ADAFA |
  db $0B, $0C, $2F, $42, $00                ; $1ADAFF |
  db $05, $0C, $2F, $42, $00                ; $1ADB04 |
  db $00, $FE, $00, $03, $02                ; $1ADB09 |
  db $0D, $08, $2F, $82, $00                ; $1ADB0E |
  db $FC, $06, $2F, $02, $00                ; $1ADB13 |
  db $FC, $06, $2F, $02, $00                ; $1ADB18 |
  db $00, $FD, $02, $03, $02                ; $1ADB1D |
  db $0C, $04, $2F, $02, $00                ; $1ADB22 |
  db $FF, $08, $2E, $02, $00                ; $1ADB27 |
  db $FF, $08, $2E, $02, $00                ; $1ADB2C |
  db $04, $08, $9E, $02, $00                ; $1ADB31 |
  db $04, $08, $9E, $02, $00                ; $1ADB36 |
  db $04, $08, $9E, $02, $00                ; $1ADB3B |
  db $00, $FC, $02, $03, $02                ; $1ADB40 |
  db $00, $FD, $00, $03, $02                ; $1ADB45 |
  db $FD, $03, $2F, $02, $00                ; $1ADB4A |
  db $08, $08, $2E, $42, $00                ; $1ADB4F |
  db $08, $08, $2E, $42, $00                ; $1ADB54 |
  db $0B, $F8, $F7, $80, $00                ; $1ADB59 |
  db $04, $08, $9E, $02, $00                ; $1ADB5E |
  db $0D, $05, $2F, $42, $00                ; $1ADB63 |
  db $00, $FC, $02, $03, $02                ; $1ADB68 |
  db $FE, $08, $2E, $02, $00                ; $1ADB6D |
  db $0A, $08, $2E, $42, $00                ; $1ADB72 |
  db $00, $FE, $02, $03, $02                ; $1ADB77 |
  db $00, $FE, $02, $03, $02                ; $1ADB7C |
  db $00, $FB, $00, $03, $02                ; $1ADB81 |
  db $03, $09, $2F, $42, $00                ; $1ADB86 |
  db $08, $09, $2F, $42, $00                ; $1ADB8B |
  db $08, $09, $2F, $42, $00                ; $1ADB90 |
  db $0B, $0A, $9E, $00, $00                ; $1ADB95 |
  db $00, $FF, $4E, $09, $00                ; $1ADB9A |
  db $08, $FF, $4F, $09, $00                ; $1ADB9F |
  db $00, $07, $5E, $09, $00                ; $1ADBA4 |
  db $08, $07, $5F, $09, $00                ; $1ADBA9 |
  db $FD, $08, $2F, $00, $00                ; $1ADBAE |
  db $0C, $07, $2E, $40, $00                ; $1ADBB3 |
  db $00, $00, $4E, $09, $00                ; $1ADBB8 |
  db $08, $00, $4F, $09, $00                ; $1ADBBD |
  db $00, $08, $5E, $09, $00                ; $1ADBC2 |
  db $08, $08, $5F, $09, $00                ; $1ADBC7 |
  db $FE, $07, $2E, $00, $00                ; $1ADBCC |
  db $0B, $06, $2F, $40, $00                ; $1ADBD1 |
  db $FF, $00, $4E, $09, $00                ; $1ADBD6 |
  db $07, $00, $4F, $09, $00                ; $1ADBDB |
  db $FF, $08, $5E, $09, $00                ; $1ADBE0 |
  db $07, $08, $5F, $09, $00                ; $1ADBE5 |
  db $00, $0A, $9E, $00, $00                ; $1ADBEA |
  db $0A, $09, $9E, $00, $00                ; $1ADBEF |
  db $00, $00, $4E, $09, $00                ; $1ADBF4 |
  db $08, $00, $4F, $09, $00                ; $1ADBF9 |
  db $00, $08, $5E, $09, $00                ; $1ADBFE |
  db $08, $08, $5F, $09, $00                ; $1ADC03 |
  db $01, $09, $9E, $00, $00                ; $1ADC08 |
  db $0C, $08, $2E, $40, $00                ; $1ADC0D |
  db $F8, $F0, $00, $08, $02                ; $1ADC12 |
  db $08, $F0, $00, $08, $02                ; $1ADC17 |
  db $F8, $00, $00, $08, $02                ; $1ADC1C |
  db $08, $00, $00, $08, $02                ; $1ADC21 |
  db $FE, $08, $2E, $00, $00                ; $1ADC26 |
  db $F0, $F0, $42, $00, $02                ; $1ADC2B |
  db $00, $F0, $42, $40, $02                ; $1ADC30 |
  db $F0, $00, $42, $80, $02                ; $1ADC35 |
  db $00, $00, $42, $C0, $02                ; $1ADC3A |
  db $F8, $EF, $C0, $01, $02                ; $1ADC3F |
  db $08, $EF, $C2, $01, $02                ; $1ADC44 |
  db $F8, $FF, $E0, $01, $02                ; $1ADC49 |
  db $08, $FF, $E2, $01, $02                ; $1ADC4E |
  db $00, $09, $9E, $00, $00                ; $1ADC53 |
  db $08, $09, $9E, $00, $00                ; $1ADC58 |
  db $F8, $EE, $C0, $01, $02                ; $1ADC5D |
  db $08, $EE, $C2, $01, $02                ; $1ADC62 |
  db $F8, $FE, $E0, $01, $02                ; $1ADC67 |
  db $08, $FE, $E2, $01, $02                ; $1ADC6C |
  db $00, $07, $2E, $00, $00                ; $1ADC71 |
  db $08, $08, $9E, $00, $00                ; $1ADC76 |
  db $F8, $EF, $C0, $01, $02                ; $1ADC7B |
  db $08, $EF, $C2, $01, $02                ; $1ADC80 |
  db $F8, $FF, $E0, $01, $02                ; $1ADC85 |
  db $08, $FF, $E2, $01, $02                ; $1ADC8A |
  db $FE, $07, $2F, $00, $00                ; $1ADC8F |
  db $09, $08, $2E, $40, $00                ; $1ADC94 |
  db $F8, $F0, $C0, $01, $02                ; $1ADC99 |
  db $08, $F0, $C2, $01, $02                ; $1ADC9E |
  db $F8, $00, $E0, $01, $02                ; $1ADCA3 |
  db $08, $00, $E2, $01, $02                ; $1ADCA8 |
  db $FF, $08, $2E, $00, $00                ; $1ADCAD |
  db $0B, $09, $2F, $40, $00                ; $1ADCB2 |
  db $F8, $EF, $C0, $01, $02                ; $1ADCB7 |
  db $08, $EF, $C2, $01, $02                ; $1ADCBC |
  db $F8, $FF, $E0, $01, $02                ; $1ADCC1 |
  db $08, $FF, $E2, $01, $02                ; $1ADCC6 |
  db $02, $08, $9E, $00, $00                ; $1ADCCB |
  db $08, $08, $2F, $40, $00                ; $1ADCD0 |
  db $F8, $EE, $C0, $01, $02                ; $1ADCD5 |
  db $08, $EE, $C2, $01, $02                ; $1ADCDA |
  db $F8, $FE, $E0, $01, $02                ; $1ADCDF |
  db $08, $FE, $E2, $01, $02                ; $1ADCE4 |
  db $03, $08, $9E, $00, $00                ; $1ADCE9 |
  db $05, $08, $2F, $40, $00                ; $1ADCEE |
  db $F8, $EE, $C0, $01, $02                ; $1ADCF3 |
  db $08, $EE, $C2, $01, $02                ; $1ADCF8 |
  db $F8, $FE, $E0, $01, $02                ; $1ADCFD |
  db $08, $FE, $E2, $01, $02                ; $1ADD02 |
  db $02, $08, $2E, $80, $00                ; $1ADD07 |
  db $06, $08, $9E, $00, $00                ; $1ADD0C |
  db $EA, $00, $04, $00, $02                ; $1ADD11 |
  db $FA, $00, $06, $00, $02                ; $1ADD16 |
  db $FA, $00, $06, $00, $00                ; $1ADD1B |
  db $FA, $08, $16, $00, $00                ; $1ADD20 |
  db $F8, $00, $00, $00, $02                ; $1ADD25 |
  db $08, $00, $02, $00, $02                ; $1ADD2A |
  db $EE, $EA, $00, $00, $02                ; $1ADD2F |
  db $FE, $EA, $02, $00, $02                ; $1ADD34 |
  db $EE, $FA, $20, $00, $02                ; $1ADD39 |
  db $FE, $FA, $22, $00, $02                ; $1ADD3E |
  db $F8, $00, $00, $00, $02                ; $1ADD43 |
  db $08, $00, $02, $00, $02                ; $1ADD48 |
  db $F9, $F9, $9C, $00, $02                ; $1ADD4D |
  db $F9, $07, $7E, $C0, $02                ; $1ADD52 |
  db $07, $07, $7E, $80, $02                ; $1ADD57 |
  db $07, $F9, $7E, $00, $02                ; $1ADD5C |
  db $FF, $04, $49, $02, $00                ; $1ADD61 |
  db $01, $04, $6E, $02, $00                ; $1ADD66 |
  db $09, $04, $6F, $02, $00                ; $1ADD6B |
  db $FA, $F8, $9C, $00, $02                ; $1ADD70 |
  db $FA, $08, $7E, $C0, $02                ; $1ADD75 |
  db $06, $08, $7E, $80, $02                ; $1ADD7A |
  db $06, $F8, $7E, $00, $02                ; $1ADD7F |
  db $FF, $04, $49, $02, $00                ; $1ADD84 |
  db $01, $04, $6E, $02, $00                ; $1ADD89 |
  db $09, $04, $6F, $02, $00                ; $1ADD8E |
  db $F9, $F9, $9C, $00, $02                ; $1ADD93 |
  db $F9, $07, $7E, $C0, $02                ; $1ADD98 |
  db $07, $07, $7E, $80, $02                ; $1ADD9D |
  db $07, $F9, $7E, $00, $02                ; $1ADDA2 |
  db $FF, $04, $49, $02, $00                ; $1ADDA7 |
  db $01, $04, $6E, $02, $00                ; $1ADDAC |
  db $09, $04, $6F, $02, $00                ; $1ADDB1 |
  db $F8, $FA, $9C, $00, $02                ; $1ADDB6 |
  db $F8, $06, $7E, $C0, $02                ; $1ADDBB |
  db $08, $06, $7E, $80, $02                ; $1ADDC0 |
  db $08, $FA, $7E, $00, $02                ; $1ADDC5 |
  db $FF, $04, $49, $02, $00                ; $1ADDCA |
  db $01, $04, $6E, $02, $00                ; $1ADDCF |
  db $09, $04, $6F, $02, $00                ; $1ADDD4 |
  db $FC, $00, $08, $00, $02                ; $1ADDD9 |
  db $0C, $00, $00, $00, $02                ; $1ADDDE |
  db $F9, $00, $0A, $00, $02                ; $1ADDE3 |
  db $0A, $00, $02, $00, $02                ; $1ADDE8 |
  db $F6, $00, $0C, $00, $02                ; $1ADDED |
  db $07, $00, $04, $00, $02                ; $1ADDF2 |
  db $F4, $00, $0E, $00, $02                ; $1ADDF7 |
  db $04, $00, $06, $00, $02                ; $1ADDFC |
  db $00, $00, $06, $00, $02                ; $1ADE01 |
  db $00, $00, $06, $00, $00                ; $1ADE06 |
  db $00, $00, $00, $00, $02                ; $1ADE0B |
  db $00, $00, $00, $00, $02                ; $1ADE10 |
  db $00, $00, $00, $00, $02                ; $1ADE15 |
  db $00, $00, $00, $00, $02                ; $1ADE1A |
  db $00, $00, $00, $00, $02                ; $1ADE1F |
  db $00, $00, $00, $00, $02                ; $1ADE24 |
  db $00, $00, $00, $00, $02                ; $1ADE29 |
  db $00, $00, $00, $00, $02                ; $1ADE2E |
  db $00, $00, $00, $00, $02                ; $1ADE33 |
  db $00, $00, $00, $00, $02                ; $1ADE38 |
  db $00, $00, $00, $00, $02                ; $1ADE3D |
  db $00, $00, $00, $00, $02                ; $1ADE42 |
  db $00, $00, $00, $00, $02                ; $1ADE47 |
  db $00, $00, $00, $00, $02                ; $1ADE4C |
  db $00, $00, $00, $00, $02                ; $1ADE51 |
  db $00, $00, $00, $00, $02                ; $1ADE56 |
  db $00, $00, $00, $00, $02                ; $1ADE5B |
  db $00, $00, $00, $00, $02                ; $1ADE60 |
  db $00, $00, $00, $00, $02                ; $1ADE65 |
  db $00, $00, $00, $00, $02                ; $1ADE6A |
  db $00, $00, $00, $00, $02                ; $1ADE6F |
  db $00, $00, $00, $00, $02                ; $1ADE74 |
  db $00, $00, $00, $00, $02                ; $1ADE79 |
  db $00, $00, $00, $00, $02                ; $1ADE7E |
  db $05, $E5, $06, $02, $00                ; $1ADE83 |
  db $07, $ED, $16, $02, $00                ; $1ADE88 |
  db $05, $F5, $07, $02, $00                ; $1ADE8D |
  db $0A, $F5, $04, $02, $00                ; $1ADE92 |
  db $00, $FD, $00, $02, $02                ; $1ADE97 |
  db $FC, $06, $15, $02, $00                ; $1ADE9C |
  db $FB, $03, $17, $82, $00                ; $1ADEA1 |
  db $FB, $FB, $17, $02, $00                ; $1ADEA6 |
  db $08, $0B, $14, $42, $00                ; $1ADEAB |
  db $06, $E7, $06, $02, $00                ; $1ADEB0 |
  db $08, $EF, $16, $02, $00                ; $1ADEB5 |
  db $06, $F6, $07, $02, $00                ; $1ADEBA |
  db $0B, $F6, $04, $02, $00                ; $1ADEBF |
  db $00, $FE, $02, $02, $02                ; $1ADEC4 |
  db $FD, $0B, $14, $02, $00                ; $1ADEC9 |
  db $FB, $04, $17, $82, $00                ; $1ADECE |
  db $FB, $FC, $17, $02, $00                ; $1ADED3 |
  db $0B, $09, $15, $42, $00                ; $1ADED8 |
  db $06, $E6, $06, $02, $00                ; $1ADEDD |
  db $08, $EE, $16, $02, $00                ; $1ADEE2 |
  db $06, $F5, $07, $02, $00                ; $1ADEE7 |
  db $0A, $F5, $04, $02, $00                ; $1ADEEC |
  db $00, $FD, $02, $02, $02                ; $1ADEF1 |
  db $FC, $05, $17, $82, $00                ; $1ADEF6 |
  db $FC, $FD, $17, $02, $00                ; $1ADEFB |
  db $0D, $06, $15, $02, $00                ; $1ADF00 |
  db $FF, $0C, $05, $02, $00                ; $1ADF05 |
  db $05, $E5, $06, $02, $00                ; $1ADF0A |
  db $07, $ED, $16, $02, $00                ; $1ADF0F |
  db $05, $F5, $07, $02, $00                ; $1ADF14 |
  db $0A, $F4, $04, $02, $00                ; $1ADF19 |
  db $00, $FC, $00, $02, $02                ; $1ADF1E |
  db $FC, $04, $17, $82, $00                ; $1ADF23 |
  db $FC, $FC, $17, $02, $00                ; $1ADF28 |
  db $02, $0C, $05, $02, $00                ; $1ADF2D |
  db $08, $09, $14, $42, $00                ; $1ADF32 |
  db $05, $E4, $06, $02, $00                ; $1ADF37 |
  db $07, $EC, $16, $02, $00                ; $1ADF3C |
  db $05, $F4, $07, $02, $00                ; $1ADF41 |
  db $0A, $F4, $04, $02, $00                ; $1ADF46 |
  db $00, $FC, $00, $02, $02                ; $1ADF4B |
  db $FC, $03, $17, $82, $00                ; $1ADF50 |
  db $FC, $FB, $17, $02, $00                ; $1ADF55 |
  db $05, $0C, $05, $02, $00                ; $1ADF5A |
  db $02, $0A, $05, $02, $00                ; $1ADF5F |
  db $F8, $04, $17, $82, $00                ; $1ADF64 |
  db $F8, $FC, $17, $02, $00                ; $1ADF69 |
  db $06, $EC, $06, $02, $00                ; $1ADF6E |
  db $08, $F4, $16, $02, $00                ; $1ADF73 |
  db $06, $F7, $07, $02, $00                ; $1ADF78 |
  db $0A, $F7, $04, $02, $00                ; $1ADF7D |
  db $00, $FF, $02, $02, $02                ; $1ADF82 |
  db $0D, $08, $15, $C2, $00                ; $1ADF87 |
  db $FF, $0C, $05, $02, $00                ; $1ADF8C |
  db $05, $F1, $06, $02, $00                ; $1ADF91 |
  db $07, $F9, $16, $02, $00                ; $1ADF96 |
  db $0A, $F5, $04, $02, $00                ; $1ADF9B |
  db $00, $FD, $00, $02, $02                ; $1ADFA0 |
  db $FC, $06, $15, $02, $00                ; $1ADFA5 |
  db $FB, $03, $17, $82, $00                ; $1ADFAA |
  db $FB, $FB, $17, $02, $00                ; $1ADFAF |
  db $08, $0B, $14, $42, $00                ; $1ADFB4 |
  db $06, $F3, $06, $02, $00                ; $1ADFB9 |
  db $08, $FB, $16, $02, $00                ; $1ADFBE |
  db $0B, $F6, $04, $02, $00                ; $1ADFC3 |
  db $00, $FE, $02, $02, $02                ; $1ADFC8 |
  db $FD, $0B, $14, $02, $00                ; $1ADFCD |
  db $FB, $04, $17, $82, $00                ; $1ADFD2 |
  db $FB, $FC, $17, $02, $00                ; $1ADFD7 |
  db $0B, $09, $15, $42, $00                ; $1ADFDC |
  db $06, $F2, $06, $02, $00                ; $1ADFE1 |
  db $08, $FA, $16, $02, $00                ; $1ADFE6 |
  db $0A, $F5, $04, $02, $00                ; $1ADFEB |
  db $00, $FD, $02, $02, $02                ; $1ADFF0 |
  db $FC, $05, $17, $82, $00                ; $1ADFF5 |
  db $FC, $FD, $17, $02, $00                ; $1ADFFA |
  db $0D, $06, $15, $02, $00                ; $1ADFFF |
  db $FF, $0C, $05, $02, $00                ; $1AE004 |
  db $05, $F1, $06, $02, $00                ; $1AE009 |
  db $07, $F9, $16, $02, $00                ; $1AE00E |
  db $0A, $F4, $04, $02, $00                ; $1AE013 |
  db $00, $FC, $00, $02, $02                ; $1AE018 |
  db $FC, $04, $17, $82, $00                ; $1AE01D |
  db $FC, $FC, $17, $02, $00                ; $1AE022 |
  db $02, $0C, $05, $02, $00                ; $1AE027 |
  db $08, $09, $14, $42, $00                ; $1AE02C |
  db $05, $F0, $06, $02, $00                ; $1AE031 |
  db $07, $F8, $16, $02, $00                ; $1AE036 |
  db $0A, $F4, $04, $02, $00                ; $1AE03B |
  db $00, $FC, $00, $02, $02                ; $1AE040 |
  db $FC, $03, $17, $82, $00                ; $1AE045 |
  db $FC, $FB, $17, $02, $00                ; $1AE04A |
  db $05, $0C, $05, $02, $00                ; $1AE04F |
  db $02, $0A, $05, $02, $00                ; $1AE054 |
  db $F8, $04, $17, $82, $00                ; $1AE059 |
  db $F8, $FC, $17, $02, $00                ; $1AE05E |
  db $06, $F6, $06, $02, $00                ; $1AE063 |
  db $08, $FE, $16, $02, $00                ; $1AE068 |
  db $0A, $F7, $04, $02, $00                ; $1AE06D |
  db $00, $FF, $02, $02, $02                ; $1AE072 |
  db $0D, $08, $15, $C2, $00                ; $1AE077 |
  db $FF, $0C, $05, $02, $00                ; $1AE07C |
  db $04, $F0, $06, $02, $00                ; $1AE081 |
  db $06, $F8, $16, $02, $00                ; $1AE086 |
  db $03, $00, $07, $02, $00                ; $1AE08B |
  db $02, $08, $07, $02, $00                ; $1AE090 |
  db $04, $00, $17, $82, $00                ; $1AE095 |
  db $04, $F8, $17, $02, $00                ; $1AE09A |
  db $00, $F9, $20, $01, $00                ; $1AE09F |
  db $05, $04, $26, $05, $00                ; $1AE0A4 |
  db $FB, $03, $26, $05, $00                ; $1AE0A9 |
  db $00, $F9, $20, $01, $02                ; $1AE0AE |
  db $0B, $0C, $36, $03, $00                ; $1AE0B3 |
  db $00, $0C, $36, $03, $00                ; $1AE0B8 |
  db $02, $02, $24, $05, $02                ; $1AE0BD |
  db $FE, $F9, $20, $01, $00                ; $1AE0C2 |
  db $00, $02, $24, $05, $02                ; $1AE0C7 |
  db $FC, $03, $27, $05, $00                ; $1AE0CC |
  db $FE, $F9, $20, $01, $02                ; $1AE0D1 |
  db $00, $0C, $36, $03, $00                ; $1AE0D6 |
  db $0B, $0C, $36, $03, $00                ; $1AE0DB |
  db $FE, $07, $26, $85, $00                ; $1AE0E0 |
  db $FC, $F9, $22, $01, $00                ; $1AE0E5 |
  db $01, $03, $2C, $05, $00                ; $1AE0EA |
  db $F6, $03, $27, $05, $00                ; $1AE0EF |
  db $FC, $F9, $22, $01, $02                ; $1AE0F4 |
  db $FE, $02, $24, $05, $02                ; $1AE0F9 |
  db $00, $0C, $36, $03, $00                ; $1AE0FE |
  db $0B, $0C, $37, $03, $00                ; $1AE103 |
  db $F9, $F9, $22, $01, $00                ; $1AE108 |
  db $EE, $03, $27, $05, $00                ; $1AE10D |
  db $F4, $03, $44, $06, $00                ; $1AE112 |
  db $FD, $02, $2C, $05, $02                ; $1AE117 |
  db $F9, $F9, $22, $01, $02                ; $1AE11C |
  db $00, $0C, $36, $03, $00                ; $1AE121 |
  db $0B, $0C, $37, $03, $00                ; $1AE126 |
  db $03, $F7, $20, $01, $00                ; $1AE12B |
  db $06, $02, $26, $05, $00                ; $1AE130 |
  db $FD, $03, $26, $05, $00                ; $1AE135 |
  db $03, $F7, $20, $01, $02                ; $1AE13A |
  db $0A, $0C, $37, $03, $00                ; $1AE13F |
  db $FD, $0C, $37, $C3, $00                ; $1AE144 |
  db $04, $01, $24, $05, $02                ; $1AE149 |
  db $04, $F6, $20, $01, $00                ; $1AE14E |
  db $FD, $08, $37, $C3, $00                ; $1AE153 |
  db $08, $01, $26, $05, $00                ; $1AE158 |
  db $FE, $03, $26, $05, $00                ; $1AE15D |
  db $04, $F6, $20, $01, $02                ; $1AE162 |
  db $0A, $0C, $37, $03, $00                ; $1AE167 |
  db $05, $00, $24, $05, $02                ; $1AE16C |
  db $05, $F5, $20, $01, $00                ; $1AE171 |
  db $FB, $01, $39, $03, $00                ; $1AE176 |
  db $FF, $04, $27, $05, $00                ; $1AE17B |
  db $0C, $00, $26, $05, $00                ; $1AE180 |
  db $05, $F5, $20, $01, $02                ; $1AE185 |
  db $07, $0C, $37, $43, $00                ; $1AE18A |
  db $04, $01, $2A, $05, $02                ; $1AE18F |
  db $06, $F6, $20, $01, $00                ; $1AE194 |
  db $0D, $00, $26, $05, $00                ; $1AE199 |
  db $06, $F6, $20, $01, $02                ; $1AE19E |
  db $03, $01, $2A, $05, $02                ; $1AE1A3 |
  db $07, $0C, $37, $43, $00                ; $1AE1A8 |
  db $01, $05, $27, $05, $00                ; $1AE1AD |
  db $F9, $FE, $39, $03, $00                ; $1AE1B2 |
  db $07, $F7, $20, $01, $00                ; $1AE1B7 |
  db $FC, $00, $42, $CA, $00                ; $1AE1BC |
  db $0E, $01, $26, $05, $00                ; $1AE1C1 |
  db $07, $F7, $20, $01, $02                ; $1AE1C6 |
  db $02, $01, $2A, $05, $02                ; $1AE1CB |
  db $07, $0C, $37, $43, $00                ; $1AE1D0 |
  db $F7, $FB, $38, $03, $00                ; $1AE1D5 |
  db $08, $F8, $20, $01, $00                ; $1AE1DA |
  db $FA, $FE, $42, $CA, $00                ; $1AE1DF |
  db $0E, $03, $26, $05, $00                ; $1AE1E4 |
  db $08, $F8, $20, $01, $02                ; $1AE1E9 |
  db $01, $00, $2A, $05, $02                ; $1AE1EE |
  db $07, $0C, $37, $43, $00                ; $1AE1F3 |
  db $F4, $F8, $38, $03, $00                ; $1AE1F8 |
  db $06, $F9, $20, $41, $00                ; $1AE1FD |
  db $09, $07, $26, $45, $00                ; $1AE202 |
  db $FE, $03, $26, $45, $00                ; $1AE207 |
  db $FE, $F9, $20, $41, $02                ; $1AE20C |
  db $0B, $0C, $36, $03, $00                ; $1AE211 |
  db $00, $0C, $37, $03, $00                ; $1AE216 |
  db $FE, $02, $24, $45, $02                ; $1AE21B |
  db $04, $F9, $22, $41, $00                ; $1AE220 |
  db $08, $07, $26, $C5, $00                ; $1AE225 |
  db $00, $03, $26, $45, $00                ; $1AE22A |
  db $FC, $F9, $22, $41, $02                ; $1AE22F |
  db $0B, $0C, $36, $03, $00                ; $1AE234 |
  db $FD, $0C, $37, $43, $00                ; $1AE239 |
  db $FB, $02, $24, $45, $02                ; $1AE23E |
  db $FA, $F9, $2F, $41, $00                ; $1AE243 |
  db $02, $F9, $2E, $41, $00                ; $1AE248 |
  db $05, $08, $26, $C5, $00                ; $1AE24D |
  db $FA, $F9, $2E, $41, $02                ; $1AE252 |
  db $02, $0C, $37, $43, $00                ; $1AE257 |
  db $FD, $0C, $37, $43, $00                ; $1AE25C |
  db $F8, $03, $2C, $45, $02                ; $1AE261 |
  db $F8, $F8, $2E, $01, $00                ; $1AE266 |
  db $FA, $02, $2C, $05, $00                ; $1AE26B |
  db $F2, $03, $26, $05, $00                ; $1AE270 |
  db $F6, $02, $2A, $05, $02                ; $1AE275 |
  db $01, $05, $26, $05, $00                ; $1AE27A |
  db $F8, $F8, $2E, $01, $02                ; $1AE27F |
  db $FD, $0C, $37, $43, $00                ; $1AE284 |
  db $00, $F6, $23, $01, $00                ; $1AE289 |
  db $F8, $F6, $22, $01, $00                ; $1AE28E |
  db $F7, $04, $27, $05, $00                ; $1AE293 |
  db $F8, $F6, $22, $01, $02                ; $1AE298 |
  db $F6, $01, $2A, $05, $02                ; $1AE29D |
  db $FD, $0C, $37, $43, $00                ; $1AE2A2 |
  db $FD, $0C, $37, $43, $00                ; $1AE2A7 |
  db $00, $F6, $21, $01, $00                ; $1AE2AC |
  db $F8, $F6, $20, $01, $00                ; $1AE2B1 |
  db $FB, $07, $26, $85, $00                ; $1AE2B6 |
  db $F8, $F6, $20, $01, $02                ; $1AE2BB |
  db $F6, $01, $2A, $05, $02                ; $1AE2C0 |
  db $FD, $0C, $37, $43, $00                ; $1AE2C5 |
  db $FD, $0C, $37, $43, $00                ; $1AE2CA |
  db $02, $F6, $21, $01, $00                ; $1AE2CF |
  db $FA, $F6, $20, $01, $00                ; $1AE2D4 |
  db $F3, $FF, $39, $03, $00                ; $1AE2D9 |
  db $02, $07, $26, $85, $00                ; $1AE2DE |
  db $FA, $F6, $20, $01, $02                ; $1AE2E3 |
  db $F8, $01, $2A, $05, $02                ; $1AE2E8 |
  db $FD, $0C, $37, $43, $00                ; $1AE2ED |
  db $FA, $F6, $20, $01, $00                ; $1AE2F2 |
  db $F3, $FF, $42, $CA, $00                ; $1AE2F7 |
  db $EF, $FB, $38, $03, $00                ; $1AE2FC |
  db $02, $07, $26, $85, $00                ; $1AE301 |
  db $FA, $F6, $20, $01, $02                ; $1AE306 |
  db $FA, $01, $2A, $05, $02                ; $1AE30B |
  db $00, $0C, $37, $03, $00                ; $1AE310 |
  db $03, $F6, $21, $01, $00                ; $1AE315 |
  db $FB, $F6, $20, $01, $00                ; $1AE31A |
  db $EF, $F6, $38, $03, $00                ; $1AE31F |
  db $06, $06, $26, $C5, $00                ; $1AE324 |
  db $FB, $F6, $20, $01, $02                ; $1AE329 |
  db $FB, $01, $2A, $05, $02                ; $1AE32E |
  db $00, $0C, $37, $03, $00                ; $1AE333 |
  db $F5, $F6, $42, $0A, $00                ; $1AE338 |
  db $FB, $FA, $38, $03, $00                ; $1AE33D |
  db $04, $05, $26, $85, $00                ; $1AE342 |
  db $FC, $F6, $20, $01, $02                ; $1AE347 |
  db $FC, $01, $24, $05, $02                ; $1AE34C |
  db $00, $0C, $37, $03, $00                ; $1AE351 |
  db $F8, $01, $26, $05, $00                ; $1AE356 |
  db $FD, $F6, $20, $01, $00                ; $1AE35B |
  db $06, $04, $39, $03, $00                ; $1AE360 |
  db $03, $03, $26, $05, $00                ; $1AE365 |
  db $FD, $F6, $20, $01, $02                ; $1AE36A |
  db $FD, $01, $24, $05, $02                ; $1AE36F |
  db $00, $0C, $37, $03, $00                ; $1AE374 |
  db $F9, $01, $26, $05, $00                ; $1AE379 |
  db $FE, $F7, $20, $01, $00                ; $1AE37E |
  db $0A, $0C, $38, $C3, $00                ; $1AE383 |
  db $04, $03, $26, $05, $00                ; $1AE388 |
  db $FE, $F7, $20, $01, $02                ; $1AE38D |
  db $FE, $01, $24, $05, $02                ; $1AE392 |
  db $00, $0C, $37, $03, $00                ; $1AE397 |
  db $FA, $01, $26, $05, $00                ; $1AE39C |
  db $FF, $F9, $20, $01, $00                ; $1AE3A1 |
  db $0A, $0C, $37, $43, $00                ; $1AE3A6 |
  db $05, $05, $26, $05, $00                ; $1AE3AB |
  db $FF, $F9, $20, $01, $02                ; $1AE3B0 |
  db $FF, $02, $24, $05, $02                ; $1AE3B5 |
  db $00, $0C, $37, $03, $00                ; $1AE3BA |
  db $FB, $03, $26, $05, $00                ; $1AE3BF |
  db $00, $FB, $20, $01, $00                ; $1AE3C4 |
  db $0B, $0C, $36, $03, $00                ; $1AE3C9 |
  db $06, $06, $26, $05, $00                ; $1AE3CE |
  db $00, $FB, $20, $01, $02                ; $1AE3D3 |
  db $00, $04, $24, $05, $02                ; $1AE3D8 |
  db $00, $0C, $36, $03, $00                ; $1AE3DD |
  db $FC, $04, $26, $05, $00                ; $1AE3E2 |
  db $02, $FA, $20, $01, $00                ; $1AE3E7 |
  db $07, $07, $26, $05, $00                ; $1AE3EC |
  db $02, $07, $26, $45, $00                ; $1AE3F1 |
  db $02, $FA, $20, $01, $02                ; $1AE3F6 |
  db $0B, $0C, $36, $03, $00                ; $1AE3FB |
  db $00, $0C, $36, $03, $00                ; $1AE400 |
  db $04, $03, $24, $05, $02                ; $1AE405 |
  db $02, $FB, $20, $01, $00                ; $1AE40A |
  db $0A, $09, $28, $05, $00                ; $1AE40F |
  db $05, $09, $28, $45, $00                ; $1AE414 |
  db $02, $FB, $20, $01, $02                ; $1AE419 |
  db $0B, $0C, $36, $03, $00                ; $1AE41E |
  db $00, $0C, $36, $03, $00                ; $1AE423 |
  db $04, $04, $24, $05, $02                ; $1AE428 |
  db $03, $FC, $20, $01, $00                ; $1AE42D |
  db $0A, $0B, $28, $45, $00                ; $1AE432 |
  db $0F, $09, $28, $05, $00                ; $1AE437 |
  db $03, $FC, $20, $01, $02                ; $1AE43C |
  db $0B, $0C, $36, $03, $00                ; $1AE441 |
  db $00, $0C, $36, $03, $00                ; $1AE446 |
  db $05, $05, $24, $05, $02                ; $1AE44B |
  db $04, $FC, $20, $01, $00                ; $1AE450 |
  db $0D, $0B, $28, $45, $00                ; $1AE455 |
  db $11, $08, $28, $05, $00                ; $1AE45A |
  db $04, $FC, $20, $01, $02                ; $1AE45F |
  db $0B, $0C, $36, $03, $00                ; $1AE464 |
  db $00, $0C, $36, $03, $00                ; $1AE469 |
  db $06, $05, $24, $05, $02                ; $1AE46E |
  db $FB, $F9, $20, $01, $00                ; $1AE473 |
  db $F6, $07, $28, $05, $00                ; $1AE478 |
  db $F5, $02, $28, $85, $00                ; $1AE47D |
  db $FB, $F9, $20, $01, $02                ; $1AE482 |
  db $0B, $0C, $37, $03, $00                ; $1AE487 |
  db $00, $0C, $36, $03, $00                ; $1AE48C |
  db $FD, $03, $24, $05, $02                ; $1AE491 |
  db $FF, $F9, $20, $01, $00                ; $1AE496 |
  db $04, $04, $26, $05, $00                ; $1AE49B |
  db $FA, $03, $26, $05, $00                ; $1AE4A0 |
  db $FF, $F9, $20, $01, $02                ; $1AE4A5 |
  db $0B, $0C, $36, $03, $00                ; $1AE4AA |
  db $FC, $0C, $36, $03, $00                ; $1AE4AF |
  db $01, $02, $24, $05, $02                ; $1AE4B4 |
  db $FF, $F9, $20, $01, $00                ; $1AE4B9 |
  db $04, $04, $26, $05, $00                ; $1AE4BE |
  db $FA, $03, $26, $05, $00                ; $1AE4C3 |
  db $FF, $F9, $20, $01, $02                ; $1AE4C8 |
  db $0E, $0C, $36, $03, $00                ; $1AE4CD |
  db $FE, $0C, $36, $03, $00                ; $1AE4D2 |
  db $01, $02, $24, $05, $02                ; $1AE4D7 |
  db $FF, $F9, $20, $01, $00                ; $1AE4DC |
  db $04, $04, $26, $05, $00                ; $1AE4E1 |
  db $FA, $03, $26, $05, $00                ; $1AE4E6 |
  db $FF, $F9, $20, $01, $02                ; $1AE4EB |
  db $0C, $0C, $36, $03, $00                ; $1AE4F0 |
  db $FE, $0C, $36, $03, $00                ; $1AE4F5 |
  db $01, $02, $24, $05, $02                ; $1AE4FA |
  db $09, $0C, $38, $83, $00                ; $1AE4FF |
  db $00, $F4, $20, $01, $02                ; $1AE504 |
  db $09, $0C, $38, $83, $00                ; $1AE509 |
  db $FE, $04, $38, $03, $00                ; $1AE50E |
  db $02, $FE, $24, $05, $02                ; $1AE513 |
  db $0F, $F9, $26, $45, $00                ; $1AE518 |
  db $FC, $F8, $26, $05, $00                ; $1AE51D |
  db $00, $FB, $20, $01, $00                ; $1AE522 |
  db $05, $05, $26, $05, $00                ; $1AE527 |
  db $FB, $04, $26, $05, $00                ; $1AE52C |
  db $00, $FB, $20, $01, $02                ; $1AE531 |
  db $0B, $0C, $36, $03, $00                ; $1AE536 |
  db $00, $0C, $36, $03, $00                ; $1AE53B |
  db $02, $03, $24, $05, $02                ; $1AE540 |
  db $00, $F4, $20, $01, $00                ; $1AE545 |
  db $09, $0C, $38, $83, $00                ; $1AE54A |
  db $00, $F4, $20, $01, $02                ; $1AE54F |
  db $02, $0C, $38, $83, $00                ; $1AE554 |
  db $02, $FE, $24, $05, $02                ; $1AE559 |
  db $0F, $FE, $26, $C5, $00                ; $1AE55E |
  db $FC, $FE, $26, $85, $00                ; $1AE563 |
  db $FF, $F5, $20, $01, $00                ; $1AE568 |
  db $07, $0A, $36, $03, $00                ; $1AE56D |
  db $FF, $F5, $20, $01, $02                ; $1AE572 |
  db $00, $0A, $36, $03, $00                ; $1AE577 |
  db $02, $FE, $24, $05, $02                ; $1AE57C |
  db $0E, $FB, $26, $45, $00                ; $1AE581 |
  db $FC, $FA, $26, $05, $00                ; $1AE586 |
  db $FF, $F5, $20, $01, $00                ; $1AE58B |
  db $04, $05, $38, $03, $00                ; $1AE590 |
  db $FF, $F5, $20, $01, $02                ; $1AE595 |
  db $FD, $05, $38, $03, $00                ; $1AE59A |
  db $02, $FE, $24, $05, $02                ; $1AE59F |
  db $0D, $F7, $26, $45, $00                ; $1AE5A4 |
  db $FD, $F6, $26, $05, $00                ; $1AE5A9 |
  db $FF, $F5, $20, $01, $00                ; $1AE5AE |
  db $04, $03, $38, $03, $00                ; $1AE5B3 |
  db $FF, $F5, $20, $01, $02                ; $1AE5B8 |
  db $FD, $03, $38, $03, $00                ; $1AE5BD |
  db $02, $FE, $24, $05, $02                ; $1AE5C2 |
  db $0C, $F6, $26, $45, $00                ; $1AE5C7 |
  db $FE, $F5, $26, $05, $00                ; $1AE5CC |
  db $FC, $01, $20, $01, $00                ; $1AE5D1 |
  db $0C, $0C, $26, $C5, $00                ; $1AE5D6 |
  db $04, $0D, $38, $03, $00                ; $1AE5DB |
  db $FC, $01, $20, $01, $02                ; $1AE5E0 |
  db $FD, $0D, $38, $03, $00                ; $1AE5E5 |
  db $02, $05, $24, $05, $02                ; $1AE5EA |
  db $F9, $0B, $26, $85, $00                ; $1AE5EF |
  db $FC, $03, $20, $01, $00                ; $1AE5F4 |
  db $0C, $0C, $26, $C5, $00                ; $1AE5F9 |
  db $04, $0D, $38, $03, $00                ; $1AE5FE |
  db $FC, $03, $20, $01, $02                ; $1AE603 |
  db $FD, $0D, $38, $03, $00                ; $1AE608 |
  db $02, $05, $24, $05, $02                ; $1AE60D |
  db $F9, $0B, $26, $85, $00                ; $1AE612 |
  db $FD, $FF, $20, $01, $00                ; $1AE617 |
  db $0B, $0C, $26, $C5, $00                ; $1AE61C |
  db $04, $0D, $38, $03, $00                ; $1AE621 |
  db $FD, $FF, $20, $01, $02                ; $1AE626 |
  db $FD, $0D, $38, $03, $00                ; $1AE62B |
  db $02, $05, $24, $05, $02                ; $1AE630 |
  db $FA, $0C, $26, $85, $00                ; $1AE635 |
  db $FE, $FC, $20, $01, $00                ; $1AE63A |
  db $0B, $0B, $26, $C5, $00                ; $1AE63F |
  db $04, $0D, $38, $03, $00                ; $1AE644 |
  db $FE, $FC, $20, $01, $02                ; $1AE649 |
  db $FD, $0D, $38, $03, $00                ; $1AE64E |
  db $02, $05, $24, $05, $02                ; $1AE653 |
  db $FB, $0B, $26, $85, $00                ; $1AE658 |
  db $00, $FC, $20, $01, $00                ; $1AE65D |
  db $0B, $0A, $26, $C5, $00                ; $1AE662 |
  db $04, $0D, $38, $03, $00                ; $1AE667 |
  db $00, $FC, $20, $01, $02                ; $1AE66C |
  db $FD, $0D, $38, $03, $00                ; $1AE671 |
  db $02, $05, $24, $05, $02                ; $1AE676 |
  db $FC, $0A, $26, $85, $00                ; $1AE67B |
  db $08, $FC, $20, $41, $00                ; $1AE680 |
  db $0B, $09, $26, $C5, $00                ; $1AE685 |
  db $04, $0D, $38, $03, $00                ; $1AE68A |
  db $00, $FC, $20, $41, $02                ; $1AE68F |
  db $FD, $0D, $38, $03, $00                ; $1AE694 |
  db $02, $05, $24, $05, $02                ; $1AE699 |
  db $FC, $09, $26, $85, $00                ; $1AE69E |
  db $00, $00, $EC, $08, $02                ; $1AE6A3 |
  db $00, $00, $EC, $08, $02                ; $1AE6A8 |
  db $00, $00, $EC, $08, $02                ; $1AE6AD |
  db $00, $00, $EC, $08, $02                ; $1AE6B2 |
  db $00, $00, $EC, $08, $02                ; $1AE6B7 |
  db $00, $00, $EC, $08, $02                ; $1AE6BC |
  db $00, $00, $EC, $08, $02                ; $1AE6C1 |
  db $00, $00, $EC, $08, $02                ; $1AE6C6 |
  db $00, $00, $60, $01, $02                ; $1AE6CB |
  db $00, $00, $60, $01, $02                ; $1AE6D0 |
  db $00, $00, $60, $01, $02                ; $1AE6D5 |
  db $00, $00, $60, $01, $02                ; $1AE6DA |
  db $00, $00, $60, $01, $02                ; $1AE6DF |
  db $00, $00, $60, $01, $02                ; $1AE6E4 |
  db $00, $00, $60, $01, $02                ; $1AE6E9 |
  db $00, $00, $60, $01, $02                ; $1AE6EE |
  db $00, $00, $60, $01, $02                ; $1AE6F3 |
  db $00, $00, $60, $01, $02                ; $1AE6F8 |
  db $00, $00, $60, $01, $02                ; $1AE6FD |
  db $00, $00, $60, $01, $02                ; $1AE702 |
  db $00, $00, $60, $01, $02                ; $1AE707 |
  db $00, $00, $60, $01, $02                ; $1AE70C |
  db $00, $00, $60, $01, $02                ; $1AE711 |
  db $00, $00, $60, $01, $02                ; $1AE716 |
  db $00, $00, $60, $01, $02                ; $1AE71B |
  db $00, $00, $60, $01, $02                ; $1AE720 |
  db $00, $00, $60, $01, $02                ; $1AE725 |
  db $00, $00, $60, $01, $02                ; $1AE72A |
  db $08, $08, $20, $01, $00                ; $1AE72F |
  db $10, $08, $20, $41, $00                ; $1AE734 |
  db $08, $10, $21, $01, $00                ; $1AE739 |
  db $10, $10, $21, $41, $00                ; $1AE73E |
  db $00, $18, $30, $01, $00                ; $1AE743 |
  db $08, $18, $31, $01, $00                ; $1AE748 |
  db $10, $18, $31, $41, $00                ; $1AE74D |
  db $18, $18, $30, $41, $00                ; $1AE752 |
  db $00, $20, $22, $01, $02                ; $1AE757 |
  db $10, $20, $22, $C1, $02                ; $1AE75C |
  db $00, $00, $C0, $01, $02                ; $1AE761 |
  db $10, $00, $C2, $01, $02                ; $1AE766 |
  db $00, $10, $E0, $01, $02                ; $1AE76B |
  db $10, $10, $E2, $01, $02                ; $1AE770 |
  db $00, $00, $22, $01, $02                ; $1AE775 |
  db $10, $00, $22, $C1, $02                ; $1AE77A |
  db $00, $00, $C0, $01, $02                ; $1AE77F |
  db $10, $00, $C2, $01, $02                ; $1AE784 |
  db $00, $10, $E0, $01, $02                ; $1AE789 |
  db $10, $10, $E2, $01, $02                ; $1AE78E |
  db $F8, $F7, $0E, $0B, $02                ; $1AE793 |
  db $08, $F7, $2E, $0B, $02                ; $1AE798 |
  db $0B, $08, $9E, $00, $00                ; $1AE79D |
  db $FE, $08, $9E, $00, $00                ; $1AE7A2 |
  db $00, $05, $8A, $01, $00                ; $1AE7A7 |
  db $08, $05, $8B, $01, $00                ; $1AE7AC |
  db $08, $05, $8B, $01, $00                ; $1AE7B1 |
  db $0B, $08, $9E, $00, $00                ; $1AE7B6 |
  db $F2, $FB, $0E, $0B, $02                ; $1AE7BB |
  db $02, $FB, $2E, $0B, $02                ; $1AE7C0 |
  db $FD, $08, $9E, $00, $00                ; $1AE7C5 |
  db $FF, $06, $8A, $01, $00                ; $1AE7CA |
  db $07, $06, $8B, $01, $00                ; $1AE7CF |
  db $07, $06, $8B, $01, $00                ; $1AE7D4 |
  db $08, $F7, $2E, $0B, $02                ; $1AE7D9 |
  db $F8, $F7, $0E, $0B, $02                ; $1AE7DE |
  db $FD, $05, $2F, $00, $00                ; $1AE7E3 |
  db $0A, $09, $2F, $40, $00                ; $1AE7E8 |
  db $07, $05, $8B, $01, $00                ; $1AE7ED |
  db $FF, $05, $8A, $01, $00                ; $1AE7F2 |
  db $FF, $05, $8A, $01, $00                ; $1AE7F7 |
  db $08, $F8, $2E, $0B, $02                ; $1AE7FC |
  db $F8, $F8, $0E, $0B, $02                ; $1AE801 |
  db $FF, $07, $2E, $00, $00                ; $1AE806 |
  db $0C, $08, $2F, $00, $00                ; $1AE80B |
  db $07, $04, $8B, $01, $00                ; $1AE810 |
  db $FF, $04, $8A, $01, $00                ; $1AE815 |
  db $FF, $04, $8A, $01, $00                ; $1AE81A |
  db $08, $F9, $2E, $0B, $02                ; $1AE81F |
  db $F8, $F9, $0E, $0B, $02                ; $1AE824 |
  db $09, $07, $2F, $00, $00                ; $1AE829 |
  db $02, $08, $9E, $00, $00                ; $1AE82E |
  db $07, $05, $8B, $01, $00                ; $1AE833 |
  db $FF, $05, $8A, $01, $00                ; $1AE838 |
  db $FF, $05, $8A, $01, $00                ; $1AE83D |
  db $08, $F8, $2E, $0B, $02                ; $1AE842 |
  db $F8, $F8, $0E, $0B, $02                ; $1AE847 |
  db $06, $07, $2F, $40, $00                ; $1AE84C |
  db $04, $08, $9E, $00, $00                ; $1AE851 |
  db $08, $05, $8B, $01, $00                ; $1AE856 |
  db $00, $05, $8A, $01, $00                ; $1AE85B |
  db $00, $05, $8A, $01, $00                ; $1AE860 |
  db $08, $F6, $2E, $0B, $02                ; $1AE865 |
  db $F8, $F6, $0E, $0B, $02                ; $1AE86A |
  db $02, $08, $2E, $80, $00                ; $1AE86F |
  db $07, $07, $9E, $00, $00                ; $1AE874 |
  db $07, $05, $8B, $01, $00                ; $1AE879 |
  db $FF, $05, $8A, $01, $00                ; $1AE87E |
  db $FF, $05, $8A, $01, $00                ; $1AE883 |
  db $08, $F6, $2E, $0B, $02                ; $1AE888 |
  db $F8, $F6, $0E, $0B, $02                ; $1AE88D |
  db $00, $07, $2E, $00, $00                ; $1AE892 |
  db $09, $08, $2E, $40, $00                ; $1AE897 |
  db $07, $06, $8B, $01, $00                ; $1AE89C |
  db $FF, $06, $8A, $01, $00                ; $1AE8A1 |
  db $FF, $06, $8A, $01, $00                ; $1AE8A6 |
  db $08, $F6, $2E, $0B, $02                ; $1AE8AB |
  db $07, $05, $8B, $01, $00                ; $1AE8B0 |
  db $FF, $05, $8A, $01, $00                ; $1AE8B5 |
  db $F8, $F6, $0E, $0B, $02                ; $1AE8BA |
  db $04, $0A, $9E, $00, $00                ; $1AE8BF |
  db $0D, $07, $2F, $40, $00                ; $1AE8C4 |
  db $FC, $07, $2F, $00, $00                ; $1AE8C9 |
  db $08, $F5, $2E, $0B, $02                ; $1AE8CE |
  db $07, $04, $8B, $01, $00                ; $1AE8D3 |
  db $FF, $04, $8A, $01, $00                ; $1AE8D8 |
  db $F8, $F5, $0E, $0B, $02                ; $1AE8DD |
  db $FF, $08, $9E, $00, $00                ; $1AE8E2 |
  db $09, $08, $9E, $40, $00                ; $1AE8E7 |
  db $09, $08, $8E, $40, $00                ; $1AE8EC |
  db $08, $F6, $2E, $0B, $02                ; $1AE8F1 |
  db $F8, $F6, $0E, $0B, $02                ; $1AE8F6 |
  db $FF, $08, $9E, $00, $00                ; $1AE8FB |
  db $0A, $08, $9E, $00, $00                ; $1AE900 |
  db $07, $05, $8B, $01, $00                ; $1AE905 |
  db $FF, $05, $8A, $01, $00                ; $1AE90A |
  db $FF, $05, $8A, $01, $00                ; $1AE90F |
  db $F8, $F6, $2E, $4B, $02                ; $1AE914 |
  db $08, $F6, $0E, $4B, $02                ; $1AE919 |
  db $FE, $08, $9E, $00, $00                ; $1AE91E |
  db $09, $08, $9E, $00, $00                ; $1AE923 |
  db $06, $05, $8B, $01, $00                ; $1AE928 |
  db $FE, $05, $8A, $01, $00                ; $1AE92D |
  db $FE, $05, $8A, $01, $00                ; $1AE932 |
  db $08, $F2, $2E, $0B, $02                ; $1AE937 |
  db $07, $08, $2F, $40, $00                ; $1AE93C |
  db $02, $08, $2F, $40, $00                ; $1AE941 |
  db $06, $01, $8B, $01, $00                ; $1AE946 |
  db $FE, $01, $8A, $01, $00                ; $1AE94B |
  db $F8, $F2, $0E, $0B, $02                ; $1AE950 |
  db $F8, $F2, $0E, $0B, $02                ; $1AE955 |
  db $08, $F3, $2E, $0B, $02                ; $1AE95A |
  db $F8, $F3, $0E, $0B, $02                ; $1AE95F |
  db $08, $08, $2E, $80, $00                ; $1AE964 |
  db $03, $08, $2E, $80, $00                ; $1AE969 |
  db $08, $01, $8B, $01, $00                ; $1AE96E |
  db $00, $01, $8A, $01, $00                ; $1AE973 |
  db $00, $01, $8A, $01, $00                ; $1AE978 |
  db $08, $F2, $2E, $0B, $02                ; $1AE97D |
  db $05, $01, $9E, $00, $00                ; $1AE982 |
  db $00, $01, $9E, $00, $00                ; $1AE987 |
  db $F8, $F2, $0E, $0B, $02                ; $1AE98C |
  db $08, $FF, $8B, $01, $00                ; $1AE991 |
  db $00, $FF, $8A, $01, $00                ; $1AE996 |
  db $00, $FF, $8A, $01, $00                ; $1AE99B |
  db $08, $F2, $2E, $0B, $02                ; $1AE9A0 |
  db $05, $00, $2E, $00, $00                ; $1AE9A5 |
  db $00, $00, $2E, $00, $00                ; $1AE9AA |
  db $F8, $F2, $0E, $0B, $02                ; $1AE9AF |
  db $09, $FF, $8B, $01, $00                ; $1AE9B4 |
  db $01, $FF, $8A, $01, $00                ; $1AE9B9 |
  db $01, $FF, $8A, $01, $00                ; $1AE9BE |
  db $08, $F2, $2E, $0B, $02                ; $1AE9C3 |
  db $04, $FF, $2F, $00, $00                ; $1AE9C8 |
  db $FF, $FF, $2F, $00, $00                ; $1AE9CD |
  db $F8, $F2, $0E, $0B, $02                ; $1AE9D2 |
  db $09, $FF, $8B, $01, $00                ; $1AE9D7 |
  db $01, $FF, $8A, $01, $00                ; $1AE9DC |
  db $01, $FF, $8A, $01, $00                ; $1AE9E1 |
  db $05, $FC, $2E, $0B, $02                ; $1AE9E6 |
  db $F5, $FC, $0E, $0B, $02                ; $1AE9EB |
  db $FF, $08, $9E, $00, $00                ; $1AE9F0 |
  db $0A, $08, $9E, $00, $00                ; $1AE9F5 |
  db $07, $08, $8B, $01, $00                ; $1AE9FA |
  db $FF, $08, $8A, $01, $00                ; $1AE9FF |
  db $FF, $08, $8A, $01, $00                ; $1AEA04 |
  db $05, $FA, $2E, $0B, $02                ; $1AEA09 |
  db $F5, $FA, $0E, $0B, $02                ; $1AEA0E |
  db $FF, $08, $9E, $00, $00                ; $1AEA13 |
  db $0A, $08, $9E, $00, $00                ; $1AEA18 |
  db $07, $07, $8B, $01, $00                ; $1AEA1D |
  db $FF, $07, $8A, $01, $00                ; $1AEA22 |
  db $FF, $07, $8A, $01, $00                ; $1AEA27 |
  db $07, $F6, $2E, $0B, $02                ; $1AEA2C |
  db $F7, $F6, $0E, $0B, $02                ; $1AEA31 |
  db $FF, $08, $9E, $00, $00                ; $1AEA36 |
  db $0A, $08, $9E, $00, $00                ; $1AEA3B |
  db $07, $05, $8B, $01, $00                ; $1AEA40 |
  db $FF, $05, $8A, $01, $00                ; $1AEA45 |
  db $FF, $05, $8A, $01, $00                ; $1AEA4A |
  db $04, $F7, $2E, $0B, $02                ; $1AEA4F |
  db $F4, $F7, $0E, $0B, $02                ; $1AEA54 |
  db $FE, $08, $9E, $00, $00                ; $1AEA59 |
  db $0B, $08, $9E, $00, $00                ; $1AEA5E |
  db $07, $05, $8B, $01, $00                ; $1AEA63 |
  db $FF, $05, $8A, $01, $00                ; $1AEA68 |
  db $FF, $05, $8A, $01, $00                ; $1AEA6D |
  db $03, $F7, $2E, $0B, $02                ; $1AEA72 |
  db $F3, $F7, $0E, $0B, $02                ; $1AEA77 |
  db $FD, $08, $9E, $00, $00                ; $1AEA7C |
  db $0C, $08, $9E, $00, $00                ; $1AEA81 |
  db $06, $05, $8B, $01, $00                ; $1AEA86 |
  db $FE, $05, $8A, $01, $00                ; $1AEA8B |
  db $FE, $05, $8A, $01, $00                ; $1AEA90 |
  db $05, $F7, $2E, $0B, $02                ; $1AEA95 |
  db $F5, $F7, $0E, $0B, $02                ; $1AEA9A |
  db $FD, $08, $9E, $00, $00                ; $1AEA9F |
  db $0C, $08, $9E, $00, $00                ; $1AEAA4 |
  db $07, $05, $8B, $01, $00                ; $1AEAA9 |
  db $FF, $05, $8A, $01, $00                ; $1AEAAE |
  db $FF, $05, $8A, $01, $00                ; $1AEAB3 |
  db $06, $F7, $2E, $0B, $02                ; $1AEAB8 |
  db $F6, $F7, $0E, $0B, $02                ; $1AEABD |
  db $FD, $08, $9E, $00, $00                ; $1AEAC2 |
  db $0C, $08, $9E, $00, $00                ; $1AEAC7 |
  db $08, $05, $8B, $01, $00                ; $1AEACC |
  db $00, $05, $8A, $01, $00                ; $1AEAD1 |
  db $00, $05, $8A, $01, $00                ; $1AEAD6 |
  db $04, $F7, $2E, $0B, $02                ; $1AEADB |
  db $F4, $F7, $0E, $0B, $02                ; $1AEAE0 |
  db $FE, $08, $9E, $00, $00                ; $1AEAE5 |
  db $0A, $08, $9E, $00, $00                ; $1AEAEA |
  db $06, $05, $8B, $01, $00                ; $1AEAEF |
  db $FE, $05, $8A, $01, $00                ; $1AEAF4 |
  db $FE, $05, $8A, $01, $00                ; $1AEAF9 |
  db $0B, $08, $9E, $00, $00                ; $1AEAFE |
  db $FE, $08, $9E, $00, $00                ; $1AEB03 |
  db $09, $F7, $2E, $0B, $02                ; $1AEB08 |
  db $F9, $F7, $0E, $0B, $02                ; $1AEB0D |
  db $00, $05, $8A, $01, $00                ; $1AEB12 |
  db $08, $05, $8B, $01, $00                ; $1AEB17 |
  db $08, $05, $8B, $01, $00                ; $1AEB1C |
  db $FD, $08, $9E, $00, $00                ; $1AEB21 |
  db $05, $FA, $2E, $0B, $02                ; $1AEB26 |
  db $F5, $FA, $0E, $0B, $02                ; $1AEB2B |
  db $FF, $05, $8A, $01, $00                ; $1AEB30 |
  db $0B, $08, $9E, $00, $00                ; $1AEB35 |
  db $07, $05, $8B, $01, $00                ; $1AEB3A |
  db $07, $05, $8B, $01, $00                ; $1AEB3F |
  db $FD, $08, $9E, $00, $00                ; $1AEB44 |
  db $03, $FC, $2E, $0B, $02                ; $1AEB49 |
  db $F3, $FC, $0E, $0B, $02                ; $1AEB4E |
  db $FF, $06, $8A, $01, $00                ; $1AEB53 |
  db $0C, $08, $9E, $00, $00                ; $1AEB58 |
  db $07, $06, $8B, $01, $00                ; $1AEB5D |
  db $07, $06, $8B, $01, $00                ; $1AEB62 |
  db $03, $EE, $59, $06, $00                ; $1AEB67 |
  db $EE, $E8, $59, $06, $00                ; $1AEB6C |
  db $FC, $F7, $E7, $06, $02                ; $1AEB71 |
  db $0B, $F2, $E7, $06, $00                ; $1AEB76 |
  db $13, $F2, $E8, $06, $00                ; $1AEB7B |
  db $0B, $FA, $F7, $06, $00                ; $1AEB80 |
  db $13, $FA, $F8, $06, $00                ; $1AEB85 |
  db $13, $FA, $F8, $06, $00                ; $1AEB8A |
  db $00, $EB, $E7, $06, $02                ; $1AEB8F |
  db $F5, $DD, $F7, $86, $00                ; $1AEB94 |
  db $FC, $F9, $E7, $06, $02                ; $1AEB99 |
  db $0A, $F4, $E5, $06, $02                ; $1AEB9E |
  db $EA, $E6, $E7, $06, $00                ; $1AEBA3 |
  db $F2, $E6, $E8, $06, $00                ; $1AEBA8 |
  db $EA, $EE, $F7, $06, $00                ; $1AEBAD |
  db $F2, $EE, $F8, $06, $00                ; $1AEBB2 |
  db $00, $EE, $E5, $06, $02                ; $1AEBB7 |
  db $00, $F6, $59, $06, $00                ; $1AEBBC |
  db $0E, $E0, $59, $06, $00                ; $1AEBC1 |
  db $F6, $E1, $59, $06, $00                ; $1AEBC6 |
  db $FD, $FB, $E5, $06, $02                ; $1AEBCB |
  db $09, $F6, $E5, $06, $02                ; $1AEBD0 |
  db $EA, $E8, $E7, $06, $02                ; $1AEBD5 |
  db $EA, $E8, $E7, $06, $00                ; $1AEBDA |
  db $01, $F1, $E3, $06, $02                ; $1AEBDF |
  db $FD, $F3, $59, $06, $00                ; $1AEBE4 |
  db $0E, $E2, $59, $06, $00                ; $1AEBE9 |
  db $F6, $E3, $59, $06, $00                ; $1AEBEE |
  db $FE, $FD, $E5, $06, $02                ; $1AEBF3 |
  db $08, $F8, $E3, $06, $02                ; $1AEBF8 |
  db $EB, $EA, $E5, $06, $02                ; $1AEBFD |
  db $F3, $F6, $E7, $06, $02                ; $1AEC02 |
  db $02, $F4, $E3, $06, $02                ; $1AEC07 |
  db $FF, $FF, $E3, $06, $02                ; $1AEC0C |
  db $07, $FA, $E3, $06, $02                ; $1AEC11 |
  db $FB, $F3, $E7, $06, $02                ; $1AEC16 |
  db $EC, $EC, $E5, $06, $02                ; $1AEC1B |
  db $F1, $F8, $E7, $06, $02                ; $1AEC20 |
  db $0A, $E0, $E7, $06, $02                ; $1AEC25 |
  db $F2, $E1, $E7, $06, $02                ; $1AEC2A |
  db $0A, $06, $42, $C2, $02                ; $1AEC2F |
  db $FA, $06, $42, $82, $02                ; $1AEC34 |
  db $0A, $F6, $42, $42, $02                ; $1AEC39 |
  db $FA, $F6, $42, $02, $02                ; $1AEC3E |
  db $F2, $FA, $E5, $06, $02                ; $1AEC43 |
  db $ED, $EE, $E3, $06, $02                ; $1AEC48 |
  db $0A, $E2, $E7, $06, $02                ; $1AEC4D |
  db $F2, $E3, $E7, $06, $02                ; $1AEC52 |
  db $FB, $F9, $E5, $06, $02                ; $1AEC57 |
  db $F3, $FC, $E5, $06, $02                ; $1AEC5C |
  db $EE, $F0, $E3, $06, $02                ; $1AEC61 |
  db $0A, $E4, $E7, $06, $02                ; $1AEC66 |
  db $FA, $DF, $E7, $06, $02                ; $1AEC6B |
  db $F3, $E5, $E5, $06, $02                ; $1AEC70 |
  db $EB, $ED, $E7, $06, $02                ; $1AEC75 |
  db $EB, $ED, $E7, $06, $00                ; $1AEC7A |
  db $F6, $F8, $42, $C2, $02                ; $1AEC7F |
  db $E6, $F8, $42, $82, $02                ; $1AEC84 |
  db $F6, $E8, $42, $42, $02                ; $1AEC89 |
  db $E6, $E8, $42, $02, $02                ; $1AEC8E |
  db $FB, $FB, $E5, $06, $02                ; $1AEC93 |
  db $F3, $FF, $E3, $06, $02                ; $1AEC98 |
  db $09, $E6, $E5, $06, $02                ; $1AEC9D |
  db $FA, $E1, $E7, $06, $02                ; $1AECA2 |
  db $FB, $FD, $E3, $06, $02                ; $1AECA7 |
  db $F4, $01, $E3, $06, $02                ; $1AECAC |
  db $08, $E8, $E5, $06, $02                ; $1AECB1 |
  db $FB, $E3, $E5, $06, $02                ; $1AECB6 |
  db $FB, $F6, $E7, $06, $02                ; $1AECBB |
  db $03, $ED, $E7, $06, $02                ; $1AECC0 |
  db $F4, $E9, $E5, $06, $02                ; $1AECC5 |
  db $EC, $F1, $E5, $06, $02                ; $1AECCA |
  db $02, $0A, $42, $C2, $02                ; $1AECCF |
  db $F2, $0A, $42, $82, $02                ; $1AECD4 |
  db $02, $FA, $42, $42, $02                ; $1AECD9 |
  db $F2, $FA, $42, $02, $02                ; $1AECDE |
  db $08, $EA, $E3, $06, $02                ; $1AECE3 |
  db $FB, $E5, $E5, $06, $02                ; $1AECE8 |
  db $F4, $EB, $E3, $06, $02                ; $1AECED |
  db $EC, $F3, $E5, $06, $02                ; $1AECF2 |
  db $07, $EC, $E3, $06, $02                ; $1AECF7 |
  db $FC, $E7, $E3, $06, $02                ; $1AECFC |
  db $04, $00, $4F, $40, $00                ; $1AED01 |
  db $F4, $F8, $4F, $80, $00                ; $1AED06 |
  db $FB, $FA, $E5, $06, $02                ; $1AED0B |
  db $02, $F1, $E5, $06, $02                ; $1AED10 |
  db $F5, $ED, $E3, $06, $02                ; $1AED15 |
  db $ED, $F5, $E3, $06, $02                ; $1AED1A |
  db $08, $F2, $42, $C2, $02                ; $1AED1F |
  db $08, $E2, $42, $42, $02                ; $1AED24 |
  db $F8, $F2, $42, $82, $02                ; $1AED29 |
  db $F8, $E2, $42, $02, $02                ; $1AED2E |
  db $FB, $FC, $E5, $06, $02                ; $1AED33 |
  db $01, $F3, $E3, $06, $02                ; $1AED38 |
  db $F5, $F0, $E3, $06, $02                ; $1AED3D |
  db $EE, $F7, $E3, $06, $02                ; $1AED42 |
  db $F4, $F4, $4E, $80, $00                ; $1AED47 |
  db $04, $F4, $4F, $00, $00                ; $1AED4C |
  db $04, $04, $4E, $40, $00                ; $1AED51 |
  db $F4, $04, $4F, $C0, $00                ; $1AED56 |
  db $FA, $FE, $E3, $06, $02                ; $1AED5B |
  db $00, $F5, $E3, $06, $02                ; $1AED60 |
  db $F6, $F2, $E3, $06, $02                ; $1AED65 |
  db $EF, $F9, $E3, $06, $02                ; $1AED6A |
  db $F8, $00, $4E, $C0, $00                ; $1AED6F |
  db $F8, $F8, $4D, $80, $00                ; $1AED74 |
  db $00, $00, $4D, $40, $00                ; $1AED79 |
  db $00, $F8, $4E, $00, $00                ; $1AED7E |
  db $00, $00, $42, $C2, $02                ; $1AED83 |
  db $F0, $00, $42, $82, $02                ; $1AED88 |
  db $00, $F0, $42, $42, $02                ; $1AED8D |
  db $F0, $F0, $42, $02, $02                ; $1AED92 |
  db $18, $F8, $42, $C2, $02                ; $1AED97 |
  db $08, $F8, $42, $82, $02                ; $1AED9C |
  db $18, $E8, $42, $42, $02                ; $1AEDA1 |
  db $08, $E8, $42, $02, $02                ; $1AEDA6 |
  db $10, $1B, $44, $06, $00                ; $1AEDAB |
  db $E8, $1B, $44, $06, $00                ; $1AEDB0 |
  db $CC, $06, $44, $06, $00                ; $1AEDB5 |
  db $2C, $06, $44, $06, $00                ; $1AEDBA |
  db $2C, $F1, $44, $06, $00                ; $1AEDBF |
  db $10, $DE, $44, $06, $00                ; $1AEDC4 |
  db $E8, $DE, $44, $06, $00                ; $1AEDC9 |
  db $CC, $F1, $44, $06, $00                ; $1AEDCE |
  db $10, $10, $42, $C2, $02                ; $1AEDD3 |
  db $00, $10, $42, $82, $02                ; $1AEDD8 |
  db $10, $00, $42, $42, $02                ; $1AEDDD |
  db $00, $00, $42, $02, $02                ; $1AEDE2 |
  db $0D, $17, $54, $06, $00                ; $1AEDE7 |
  db $EA, $17, $54, $06, $00                ; $1AEDEC |
  db $D0, $05, $54, $06, $00                ; $1AEDF1 |
  db $29, $05, $54, $06, $00                ; $1AEDF6 |
  db $29, $F3, $54, $06, $00                ; $1AEDFB |
  db $0E, $E1, $54, $06, $00                ; $1AEE00 |
  db $EA, $E1, $54, $06, $00                ; $1AEE05 |
  db $D0, $F3, $54, $06, $00                ; $1AEE0A |
  db $EF, $0C, $42, $C2, $02                ; $1AEE0F |
  db $DF, $0C, $42, $82, $02                ; $1AEE14 |
  db $EF, $FC, $42, $42, $02                ; $1AEE19 |
  db $DF, $FC, $42, $02, $02                ; $1AEE1E |
  db $0B, $13, $45, $06, $00                ; $1AEE23 |
  db $EE, $13, $45, $06, $00                ; $1AEE28 |
  db $D5, $05, $45, $06, $00                ; $1AEE2D |
  db $27, $05, $45, $06, $00                ; $1AEE32 |
  db $27, $F3, $45, $06, $00                ; $1AEE37 |
  db $0B, $E5, $45, $06, $00                ; $1AEE3C |
  db $EE, $E5, $45, $06, $00                ; $1AEE41 |
  db $D5, $F3, $45, $06, $00                ; $1AEE46 |
  db $03, $F2, $42, $C2, $02                ; $1AEE4B |
  db $F3, $F2, $42, $82, $02                ; $1AEE50 |
  db $03, $E2, $42, $42, $02                ; $1AEE55 |
  db $F3, $E2, $42, $02, $02                ; $1AEE5A |
  db $09, $11, $55, $06, $00                ; $1AEE5F |
  db $ED, $11, $55, $06, $00                ; $1AEE64 |
  db $D9, $04, $55, $06, $00                ; $1AEE69 |
  db $1F, $04, $55, $06, $00                ; $1AEE6E |
  db $1F, $F4, $55, $06, $00                ; $1AEE73 |
  db $09, $E7, $55, $06, $00                ; $1AEE78 |
  db $EF, $E7, $55, $06, $00                ; $1AEE7D |
  db $D9, $F4, $55, $06, $00                ; $1AEE82 |
  db $FB, $F3, $42, $C2, $02                ; $1AEE87 |
  db $EB, $F3, $42, $82, $02                ; $1AEE8C |
  db $FB, $E3, $42, $42, $02                ; $1AEE91 |
  db $EB, $E3, $42, $02, $02                ; $1AEE96 |
  db $08, $0D, $55, $06, $00                ; $1AEE9B |
  db $F0, $0D, $55, $06, $00                ; $1AEEA0 |
  db $DD, $03, $55, $06, $00                ; $1AEEA5 |
  db $1B, $03, $55, $06, $00                ; $1AEEAA |
  db $1B, $F5, $55, $06, $00                ; $1AEEAF |
  db $08, $EB, $55, $06, $00                ; $1AEEB4 |
  db $F0, $EB, $55, $06, $00                ; $1AEEB9 |
  db $DD, $F5, $55, $06, $00                ; $1AEEBE |
  db $00, $00, $42, $C2, $02                ; $1AEEC3 |
  db $F0, $00, $42, $82, $02                ; $1AEEC8 |
  db $00, $F0, $42, $42, $02                ; $1AEECD |
  db $F0, $F0, $42, $02, $02                ; $1AEED2 |
  db $06, $0A, $55, $06, $00                ; $1AEED7 |
  db $F2, $0A, $55, $06, $00                ; $1AEEDC |
  db $E3, $02, $55, $06, $00                ; $1AEEE1 |
  db $15, $02, $55, $06, $00                ; $1AEEE6 |
  db $15, $F6, $55, $06, $00                ; $1AEEEB |
  db $06, $EE, $55, $06, $00                ; $1AEEF0 |
  db $F2, $EE, $55, $06, $00                ; $1AEEF5 |
  db $E3, $F6, $55, $06, $00                ; $1AEEFA |
  db $00, $00, $42, $C2, $02                ; $1AEEFF |
  db $F0, $00, $42, $82, $02                ; $1AEF04 |
  db $00, $F0, $42, $42, $02                ; $1AEF09 |
  db $F0, $F0, $42, $02, $02                ; $1AEF0E |
  db $04, $06, $55, $06, $00                ; $1AEF13 |
  db $F4, $06, $55, $06, $00                ; $1AEF18 |
  db $E9, $00, $55, $06, $00                ; $1AEF1D |
  db $0F, $00, $55, $06, $00                ; $1AEF22 |
  db $0F, $F8, $55, $06, $00                ; $1AEF27 |
  db $04, $F2, $55, $06, $00                ; $1AEF2C |
  db $F4, $F2, $55, $06, $00                ; $1AEF31 |
  db $E9, $F8, $55, $06, $00                ; $1AEF36 |
  db $01, $01, $55, $06, $00                ; $1AEF3B |
  db $F7, $01, $55, $06, $00                ; $1AEF40 |
  db $F7, $01, $55, $06, $00                ; $1AEF45 |
  db $F1, $FF, $55, $06, $00                ; $1AEF4A |
  db $07, $FF, $55, $06, $00                ; $1AEF4F |
  db $07, $FF, $55, $06, $00                ; $1AEF54 |
  db $07, $F9, $55, $06, $00                ; $1AEF59 |
  db $07, $F9, $55, $06, $00                ; $1AEF5E |
  db $01, $F7, $55, $06, $00                ; $1AEF63 |
  db $F7, $F7, $55, $06, $00                ; $1AEF68 |
  db $F7, $F7, $55, $06, $00                ; $1AEF6D |
  db $F1, $F9, $55, $06, $00                ; $1AEF72 |
  db $00, $00, $42, $C2, $02                ; $1AEF77 |
  db $00, $00, $42, $C2, $00                ; $1AEF7C |
  db $F0, $00, $52, $82, $00                ; $1AEF81 |
  db $F8, $00, $53, $82, $00                ; $1AEF86 |
  db $F0, $08, $42, $82, $00                ; $1AEF8B |
  db $F8, $08, $43, $82, $00                ; $1AEF90 |
  db $00, $F0, $42, $42, $02                ; $1AEF95 |
  db $00, $F0, $42, $42, $00                ; $1AEF9A |
  db $F0, $F0, $42, $02, $00                ; $1AEF9F |
  db $F8, $F0, $43, $02, $00                ; $1AEFA4 |
  db $F0, $F8, $52, $02, $00                ; $1AEFA9 |
  db $F8, $F8, $53, $02, $00                ; $1AEFAE |
  db $08, $08, $10, $48, $00                ; $1AEFB3 |
  db $08, $00, $00, $48, $00                ; $1AEFB8 |
  db $00, $08, $10, $08, $00                ; $1AEFBD |
  db $00, $00, $00, $08, $00                ; $1AEFC2 |
  db $08, $08, $13, $08, $00                ; $1AEFC7 |
  db $00, $08, $12, $08, $00                ; $1AEFCC |
  db $08, $00, $03, $08, $00                ; $1AEFD1 |
  db $00, $00, $02, $08, $00                ; $1AEFD6 |
  db $08, $08, $15, $08, $00                ; $1AEFDB |
  db $00, $08, $14, $08, $00                ; $1AEFE0 |
  db $08, $00, $05, $08, $00                ; $1AEFE5 |
  db $00, $00, $04, $08, $00                ; $1AEFEA |
  db $08, $00, $07, $08, $00                ; $1AEFEF |
  db $00, $00, $06, $08, $00                ; $1AEFF4 |
  db $08, $08, $13, $08, $00                ; $1AEFF9 |
  db $00, $08, $12, $08, $00                ; $1AEFFE |
  db $08, $00, $17, $08, $00                ; $1AF003 |
  db $00, $00, $16, $08, $00                ; $1AF008 |
  db $08, $08, $10, $48, $00                ; $1AF00D |
  db $00, $08, $10, $08, $00                ; $1AF012 |
  db $08, $08, $01, $08, $00                ; $1AF017 |
  db $00, $08, $01, $48, $00                ; $1AF01C |
  db $08, $08, $11, $08, $00                ; $1AF021 |
  db $00, $08, $11, $48, $00                ; $1AF026 |
  db $00, $00, $4E, $01, $02                ; $1AF02B |
  db $F8, $F8, $CC, $01, $02                ; $1AF030 |
  db $08, $F8, $CE, $01, $02                ; $1AF035 |
  db $F8, $08, $EC, $01, $02                ; $1AF03A |
  db $08, $08, $EE, $01, $02                ; $1AF03F |
  db $F8, $F8, $CC, $01, $02                ; $1AF044 |
  db $08, $F8, $CE, $01, $02                ; $1AF049 |
  db $F8, $08, $EC, $01, $02                ; $1AF04E |
  db $08, $08, $EE, $01, $02                ; $1AF053 |
  db $F8, $F8, $C8, $01, $02                ; $1AF058 |
  db $08, $F8, $CA, $01, $02                ; $1AF05D |
  db $F8, $08, $E8, $01, $02                ; $1AF062 |
  db $08, $08, $EA, $01, $02                ; $1AF067 |
  db $E8, $E8, $C0, $01, $02                ; $1AF06C |
  db $F8, $E8, $C2, $01, $02                ; $1AF071 |
  db $08, $E8, $C4, $01, $02                ; $1AF076 |
  db $18, $E8, $C6, $01, $02                ; $1AF07B |
  db $E8, $F8, $E0, $01, $02                ; $1AF080 |
  db $F8, $F8, $E2, $01, $02                ; $1AF085 |
  db $08, $F8, $E4, $01, $02                ; $1AF08A |
  db $18, $F8, $E6, $01, $02                ; $1AF08F |
  db $E8, $08, $E6, $C1, $02                ; $1AF094 |
  db $F8, $08, $E4, $C1, $02                ; $1AF099 |
  db $08, $08, $E2, $C1, $02                ; $1AF09E |
  db $18, $08, $E0, $C1, $02                ; $1AF0A3 |
  db $E8, $18, $C6, $C1, $02                ; $1AF0A8 |
  db $F8, $18, $C4, $C1, $02                ; $1AF0AD |
  db $08, $18, $C2, $C1, $02                ; $1AF0B2 |
  db $18, $18, $C0, $C1, $02                ; $1AF0B7 |
  db $00, $00, $00, $00, $00                ; $1AF0BC |
  db $0A, $08, $2E, $40, $00                ; $1AF0C1 |
  db $FB, $05, $2F, $00, $00                ; $1AF0C6 |
  db $00, $FE, $AB, $01, $00                ; $1AF0CB |
  db $00, $06, $BB, $01, $00                ; $1AF0D0 |
  db $00, $FE, $AB, $01, $02                ; $1AF0D5 |
  db $0D, $09, $2F, $00, $00                ; $1AF0DA |
  db $FD, $08, $2E, $00, $00                ; $1AF0DF |
  db $00, $00, $AB, $01, $00                ; $1AF0E4 |
  db $00, $08, $BB, $01, $00                ; $1AF0E9 |
  db $00, $00, $AB, $01, $02                ; $1AF0EE |
  db $0D, $09, $2F, $00, $00                ; $1AF0F3 |
  db $00, $08, $9E, $00, $00                ; $1AF0F8 |
  db $00, $FF, $AB, $01, $00                ; $1AF0FD |
  db $00, $07, $BB, $01, $00                ; $1AF102 |
  db $00, $FF, $AB, $01, $02                ; $1AF107 |
  db $0C, $09, $2F, $00, $00                ; $1AF10C |
  db $FF, $08, $9E, $00, $00                ; $1AF111 |
  db $00, $FE, $AB, $01, $00                ; $1AF116 |
  db $00, $06, $BB, $01, $00                ; $1AF11B |
  db $00, $FE, $AB, $01, $02                ; $1AF120 |
  db $0A, $08, $2F, $00, $00                ; $1AF125 |
  db $FF, $08, $9E, $00, $00                ; $1AF12A |
  db $00, $FE, $AB, $01, $00                ; $1AF12F |
  db $00, $06, $BB, $01, $00                ; $1AF134 |
  db $00, $FE, $AB, $01, $02                ; $1AF139 |
  db $07, $08, $2F, $00, $00                ; $1AF13E |
  db $03, $08, $9E, $00, $00                ; $1AF143 |
  db $00, $FD, $AB, $01, $00                ; $1AF148 |
  db $00, $05, $BB, $01, $00                ; $1AF14D |
  db $00, $FD, $AB, $01, $02                ; $1AF152 |
  db $01, $08, $2F, $40, $00                ; $1AF157 |
  db $06, $08, $2E, $40, $00                ; $1AF15C |
  db $00, $FD, $AB, $01, $00                ; $1AF161 |
  db $00, $05, $BB, $01, $00                ; $1AF166 |
  db $00, $FD, $AB, $01, $02                ; $1AF16B |
  db $00, $08, $2E, $80, $00                ; $1AF170 |
  db $07, $08, $2E, $40, $00                ; $1AF175 |
  db $00, $FD, $AB, $01, $00                ; $1AF17A |
  db $00, $05, $BB, $01, $00                ; $1AF17F |
  db $00, $FD, $AB, $01, $02                ; $1AF184 |
  db $FE, $04, $2E, $00, $00                ; $1AF189 |
  db $08, $08, $2E, $40, $00                ; $1AF18E |
  db $00, $FD, $AB, $01, $00                ; $1AF193 |
  db $00, $05, $BB, $01, $00                ; $1AF198 |
  db $00, $FD, $AB, $01, $02                ; $1AF19D |
  db $FE, $04, $2E, $00, $00                ; $1AF1A2 |
  db $08, $08, $2E, $40, $00                ; $1AF1A7 |
  db $00, $FD, $AB, $01, $00                ; $1AF1AC |
  db $00, $05, $BB, $01, $00                ; $1AF1B1 |
  db $00, $FD, $AB, $01, $02                ; $1AF1B6 |
  db $08, $09, $2F, $00, $00                ; $1AF1BB |
  db $FF, $09, $2F, $00, $00                ; $1AF1C0 |
  db $00, $01, $AD, $01, $00                ; $1AF1C5 |
  db $00, $09, $BD, $01, $00                ; $1AF1CA |
  db $00, $01, $AD, $01, $02                ; $1AF1CF |
  db $08, $09, $2F, $00, $00                ; $1AF1D4 |
  db $FF, $09, $2F, $00, $00                ; $1AF1D9 |
  db $04, $09, $BF, $01, $00                ; $1AF1DE |
  db $04, $01, $AF, $01, $00                ; $1AF1E3 |
  db $00, $01, $AD, $01, $02                ; $1AF1E8 |
  db $08, $08, $9E, $00, $00                ; $1AF1ED |
  db $00, $08, $9E, $00, $00                ; $1AF1F2 |
  db $00, $00, $AD, $01, $00                ; $1AF1F7 |
  db $00, $08, $BD, $01, $00                ; $1AF1FC |
  db $00, $00, $AD, $01, $02                ; $1AF201 |
  db $08, $08, $9E, $00, $00                ; $1AF206 |
  db $00, $08, $9E, $00, $00                ; $1AF20B |
  db $00, $FF, $AB, $01, $00                ; $1AF210 |
  db $00, $07, $BB, $01, $00                ; $1AF215 |
  db $00, $FF, $AB, $01, $02                ; $1AF21A |
  db $00, $00, $00, $00, $02                ; $1AF21F |
  db $00, $00, $00, $00, $02                ; $1AF224 |
  db $00, $00, $00, $00, $02                ; $1AF229 |
  db $00, $00, $00, $00, $02                ; $1AF22E |
  db $00, $00, $00, $00, $02                ; $1AF233 |
  db $07, $08, $9E, $00, $00                ; $1AF238 |
  db $02, $08, $9E, $00, $00                ; $1AF23D |
  db $00, $FE, $AB, $01, $00                ; $1AF242 |
  db $00, $06, $BB, $01, $00                ; $1AF247 |
  db $00, $FE, $AB, $01, $02                ; $1AF24C |
  db $01, $06, $2F, $40, $00                ; $1AF251 |
  db $06, $06, $2F, $40, $00                ; $1AF256 |
  db $00, $F8, $AB, $01, $00                ; $1AF25B |
  db $00, $00, $BB, $01, $00                ; $1AF260 |
  db $00, $F8, $AB, $01, $02                ; $1AF265 |
  db $07, $08, $9E, $00, $00                ; $1AF26A |
  db $02, $08, $9E, $00, $00                ; $1AF26F |
  db $00, $00, $AB, $01, $00                ; $1AF274 |
  db $00, $08, $BB, $01, $00                ; $1AF279 |
  db $00, $00, $AB, $01, $02                ; $1AF27E |
  db $0A, $0A, $44, $00, $00                ; $1AF283 |
  db $EE, $0A, $44, $00, $00                ; $1AF288 |
  db $0A, $EE, $44, $00, $00                ; $1AF28D |
  db $EE, $EE, $44, $00, $00                ; $1AF292 |
  db $08, $08, $54, $00, $00                ; $1AF297 |
  db $F0, $08, $54, $00, $00                ; $1AF29C |
  db $08, $F0, $54, $00, $00                ; $1AF2A1 |
  db $F0, $F0, $54, $00, $00                ; $1AF2A6 |
  db $06, $06, $45, $00, $00                ; $1AF2AB |
  db $F2, $06, $45, $00, $00                ; $1AF2B0 |
  db $06, $F2, $45, $00, $00                ; $1AF2B5 |
  db $F2, $F2, $45, $00, $00                ; $1AF2BA |
  db $03, $03, $55, $00, $00                ; $1AF2BF |
  db $F5, $03, $55, $00, $00                ; $1AF2C4 |
  db $03, $F5, $55, $00, $00                ; $1AF2C9 |
  db $F5, $F5, $55, $00, $00                ; $1AF2CE |
  db $00, $00, $55, $00, $00                ; $1AF2D3 |
  db $F8, $00, $55, $00, $00                ; $1AF2D8 |
  db $00, $F8, $55, $00, $00                ; $1AF2DD |
  db $F8, $F8, $55, $00, $00                ; $1AF2E2 |
  db $00, $00, $42, $C4, $02                ; $1AF2E7 |
  db $00, $F0, $42, $44, $02                ; $1AF2EC |
  db $F0, $00, $42, $84, $02                ; $1AF2F1 |
  db $F0, $F0, $42, $04, $02                ; $1AF2F6 |
  db $F8, $00, $C0, $20, $02                ; $1AF2FB |
  db $08, $00, $C0, $20, $02                ; $1AF300 |
  db $F8, $F8, $00, $00, $02                ; $1AF305 |
  db $08, $F8, $00, $00, $02                ; $1AF30A |
  db $F8, $08, $00, $00, $02                ; $1AF30F |
  db $08, $08, $00, $00, $02                ; $1AF314 |
  db $04, $00, $0B, $00, $00                ; $1AF319 |
  db $04, $00, $0B, $00, $00                ; $1AF31E |
  db $04, $00, $0B, $00, $00                ; $1AF323 |
  db $04, $00, $0B, $00, $00                ; $1AF328 |
  db $04, $00, $0B, $00, $00                ; $1AF32D |
  db $04, $00, $0B, $00, $00                ; $1AF332 |
  db $04, $00, $0B, $00, $00                ; $1AF337 |
  db $04, $00, $0B, $00, $00                ; $1AF33C |
  db $04, $00, $0B, $00, $00                ; $1AF341 |
  db $04, $00, $0B, $00, $00                ; $1AF346 |
  db $04, $00, $0B, $00, $00                ; $1AF34B |
  db $FC, $08, $1B, $00, $00                ; $1AF350 |
  db $F8, $00, $00, $00, $02                ; $1AF355 |
  db $00, $00, $0C, $00, $02                ; $1AF35A |
  db $FC, $08, $1B, $00, $00                ; $1AF35F |
  db $F6, $00, $00, $00, $02                ; $1AF364 |
  db $00, $00, $0E, $00, $02                ; $1AF369 |
  db $FC, $08, $1A, $00, $00                ; $1AF36E |
  db $F5, $00, $02, $00, $02                ; $1AF373 |
  db $00, $00, $0C, $80, $02                ; $1AF378 |
  db $FC, $08, $1A, $00, $00                ; $1AF37D |
  db $F4, $00, $02, $00, $02                ; $1AF382 |
  db $00, $00, $0E, $40, $02                ; $1AF387 |
  db $FC, $08, $1A, $00, $00                ; $1AF38C |
  db $F5, $00, $02, $00, $02                ; $1AF391 |
  db $00, $00, $0C, $00, $02                ; $1AF396 |
  db $FC, $08, $1A, $00, $00                ; $1AF39B |
  db $F6, $00, $04, $00, $02                ; $1AF3A0 |
  db $00, $00, $0E, $00, $02                ; $1AF3A5 |
  db $FC, $08, $1B, $00, $00                ; $1AF3AA |
  db $F8, $00, $04, $00, $02                ; $1AF3AF |
  db $00, $00, $0C, $80, $02                ; $1AF3B4 |
  db $FC, $08, $1B, $00, $00                ; $1AF3B9 |
  db $FA, $00, $04, $00, $02                ; $1AF3BE |
  db $00, $00, $0E, $40, $02                ; $1AF3C3 |
  db $FC, $08, $1A, $40, $00                ; $1AF3C8 |
  db $FB, $00, $04, $00, $02                ; $1AF3CD |
  db $00, $00, $0C, $00, $02                ; $1AF3D2 |
  db $FC, $08, $1A, $40, $00                ; $1AF3D7 |
  db $FC, $00, $02, $00, $02                ; $1AF3DC |
  db $00, $00, $0E, $00, $02                ; $1AF3E1 |
  db $FC, $08, $1A, $40, $00                ; $1AF3E6 |
  db $FB, $00, $02, $00, $02                ; $1AF3EB |
  db $00, $00, $0C, $80, $02                ; $1AF3F0 |
  db $FC, $08, $1B, $00, $00                ; $1AF3F5 |
  db $FA, $00, $00, $00, $02                ; $1AF3FA |
  db $00, $00, $0E, $40, $02                ; $1AF3FF |
  db $F6, $00, $06, $00, $02                ; $1AF404 |
  db $00, $00, $0C, $00, $02                ; $1AF409 |
  db $00, $00, $0C, $00, $00                ; $1AF40E |
  db $F6, $00, $06, $00, $02                ; $1AF413 |
  db $00, $00, $0E, $40, $02                ; $1AF418 |
  db $00, $00, $0F, $40, $00                ; $1AF41D |
  db $F6, $00, $06, $00, $02                ; $1AF422 |
  db $00, $00, $0E, $00, $02                ; $1AF427 |
  db $00, $00, $0E, $00, $00                ; $1AF42C |
  db $F6, $00, $06, $00, $02                ; $1AF431 |
  db $00, $00, $0C, $00, $02                ; $1AF436 |
  db $00, $00, $0C, $00, $00                ; $1AF43B |
  db $F6, $00, $08, $00, $02                ; $1AF440 |
  db $00, $00, $0E, $40, $02                ; $1AF445 |
  db $F6, $00, $08, $00, $00                ; $1AF44A |
  db $F6, $00, $08, $00, $02                ; $1AF44F |
  db $00, $00, $0C, $80, $02                ; $1AF454 |
  db $F6, $00, $08, $00, $00                ; $1AF459 |
  db $F6, $00, $08, $00, $02                ; $1AF45E |
  db $00, $00, $0E, $00, $02                ; $1AF463 |
  db $F6, $00, $08, $00, $00                ; $1AF468 |
  db $F6, $00, $08, $00, $02                ; $1AF46D |
  db $00, $00, $0C, $00, $02                ; $1AF472 |
  db $F6, $00, $08, $00, $00                ; $1AF477 |
  db $FB, $05, $0A, $00, $00                ; $1AF47C |
  db $F6, $00, $08, $00, $02                ; $1AF481 |
  db $00, $00, $0C, $00, $02                ; $1AF486 |
  db $08, $EC, $4F, $00, $00                ; $1AF48B |
  db $E5, $F3, $4F, $00, $00                ; $1AF490 |
  db $13, $F5, $4F, $00, $00                ; $1AF495 |
  db $13, $F5, $4F, $00, $00                ; $1AF49A |
  db $06, $EE, $4E, $00, $00                ; $1AF49F |
  db $F5, $EA, $4F, $40, $00                ; $1AF4A4 |
  db $E8, $F3, $4E, $00, $00                ; $1AF4A9 |
  db $10, $F5, $4E, $00, $00                ; $1AF4AE |
  db $04, $F1, $4D, $00, $00                ; $1AF4B3 |
  db $F6, $ED, $4E, $40, $00                ; $1AF4B8 |
  db $EB, $F4, $4D, $00, $00                ; $1AF4BD |
  db $0D, $F6, $4D, $00, $00                ; $1AF4C2 |
  db $02, $F4, $4C, $00, $00                ; $1AF4C7 |
  db $F7, $F1, $4D, $40, $00                ; $1AF4CC |
  db $EE, $F5, $4C, $00, $00                ; $1AF4D1 |
  db $0A, $F7, $4C, $00, $00                ; $1AF4D6 |
  db $00, $F8, $4C, $00, $00                ; $1AF4DB |
  db $F8, $F5, $4C, $00, $00                ; $1AF4E0 |
  db $F1, $F8, $4C, $00, $00                ; $1AF4E5 |
  db $07, $F9, $4C, $00, $00                ; $1AF4EA |
  db $FE, $FC, $4C, $00, $00                ; $1AF4EF |
  db $F9, $FA, $4C, $00, $00                ; $1AF4F4 |
  db $F4, $FB, $4C, $00, $00                ; $1AF4F9 |
  db $04, $FB, $4C, $00, $00                ; $1AF4FE |
  db $03, $0A, $09, $06, $00                ; $1AF503 |
  db $00, $FE, $0B, $06, $00                ; $1AF508 |
  db $04, $FC, $01, $06, $02                ; $1AF50D |
  db $FC, $FC, $00, $06, $02                ; $1AF512 |
  db $0C, $0C, $08, $06, $00                ; $1AF517 |
  db $04, $0C, $07, $06, $00                ; $1AF51C |
  db $FC, $0C, $06, $06, $00                ; $1AF521 |
  db $03, $FE, $1B, $06, $00                ; $1AF526 |
  db $FC, $FC, $03, $06, $02                ; $1AF52B |
  db $04, $FC, $04, $06, $02                ; $1AF530 |
  db $0C, $0C, $18, $06, $00                ; $1AF535 |
  db $FC, $0C, $16, $06, $00                ; $1AF53A |
  db $04, $0A, $0A, $06, $00                ; $1AF53F |
  db $04, $0C, $17, $06, $00                ; $1AF544 |
  db $03, $0A, $19, $06, $00                ; $1AF549 |
  db $FC, $0C, $06, $06, $00                ; $1AF54E |
  db $FF, $FF, $0C, $06, $00                ; $1AF553 |
  db $FC, $FC, $00, $06, $02                ; $1AF558 |
  db $04, $0C, $07, $06, $00                ; $1AF55D |
  db $0C, $0C, $08, $06, $00                ; $1AF562 |
  db $04, $FC, $01, $06, $02                ; $1AF567 |
  db $00, $FF, $1B, $06, $00                ; $1AF56C |
  db $03, $0A, $1C, $06, $00                ; $1AF571 |
  db $FC, $0C, $06, $06, $00                ; $1AF576 |
  db $04, $0C, $07, $06, $00                ; $1AF57B |
  db $0C, $0C, $08, $06, $00                ; $1AF580 |
  db $04, $FC, $01, $06, $02                ; $1AF585 |
  db $FC, $FC, $00, $06, $02                ; $1AF58A |
  db $00, $FF, $0B, $46, $00                ; $1AF58F |
  db $02, $0A, $0A, $06, $00                ; $1AF594 |
  db $FC, $0C, $06, $06, $00                ; $1AF599 |
  db $04, $0C, $07, $06, $00                ; $1AF59E |
  db $0C, $0C, $08, $06, $00                ; $1AF5A3 |
  db $04, $FC, $01, $06, $02                ; $1AF5A8 |
  db $FC, $FC, $00, $06, $02                ; $1AF5AD |
  db $04, $0A, $0A, $06, $00                ; $1AF5B2 |
  db $03, $FE, $0B, $46, $00                ; $1AF5B7 |
  db $FC, $0C, $16, $06, $00                ; $1AF5BC |
  db $04, $0C, $17, $06, $00                ; $1AF5C1 |
  db $0C, $0C, $18, $06, $00                ; $1AF5C6 |
  db $04, $FC, $04, $06, $02                ; $1AF5CB |
  db $FC, $FC, $03, $06, $02                ; $1AF5D0 |
  db $03, $0A, $1A, $06, $00                ; $1AF5D5 |
  db $03, $00, $0C, $06, $00                ; $1AF5DA |
  db $FC, $0C, $16, $06, $00                ; $1AF5DF |
  db $04, $0C, $17, $06, $00                ; $1AF5E4 |
  db $0C, $0C, $18, $06, $00                ; $1AF5E9 |
  db $04, $FC, $04, $06, $02                ; $1AF5EE |
  db $FC, $FC, $03, $06, $02                ; $1AF5F3 |
  db $02, $0A, $1A, $06, $00                ; $1AF5F8 |
  db $FF, $00, $0C, $06, $00                ; $1AF5FD |
  db $FC, $0C, $06, $06, $00                ; $1AF602 |
  db $04, $0C, $07, $06, $00                ; $1AF607 |
  db $0C, $0C, $08, $06, $00                ; $1AF60C |
  db $04, $FC, $01, $06, $02                ; $1AF611 |
  db $FC, $FC, $00, $06, $02                ; $1AF616 |
  db $FF, $FE, $0C, $06, $00                ; $1AF61B |
  db $FC, $FC, $00, $06, $02                ; $1AF620 |
  db $04, $FC, $01, $06, $02                ; $1AF625 |
  db $03, $0A, $1C, $06, $00                ; $1AF62A |
  db $0C, $0C, $08, $06, $00                ; $1AF62F |
  db $04, $0C, $07, $06, $00                ; $1AF634 |
  db $FC, $0C, $06, $06, $00                ; $1AF639 |
  db $04, $0A, $1C, $06, $00                ; $1AF63E |
  db $03, $FE, $0C, $06, $00                ; $1AF643 |
  db $FC, $0C, $16, $06, $00                ; $1AF648 |
  db $04, $0C, $17, $06, $00                ; $1AF64D |
  db $0C, $0C, $18, $06, $00                ; $1AF652 |
  db $04, $FC, $04, $06, $02                ; $1AF657 |
  db $FC, $FC, $03, $06, $02                ; $1AF65C |
  db $0F, $08, $14, $00, $00                ; $1AF661 |
  db $F9, $08, $04, $00, $00                ; $1AF666 |
  db $00, $00, $00, $00, $00                ; $1AF66B |
  db $00, $00, $00, $00, $00                ; $1AF670 |
  db $08, $00, $01, $00, $00                ; $1AF675 |
  db $00, $08, $10, $00, $00                ; $1AF67A |
  db $08, $08, $11, $00, $00                ; $1AF67F |
  db $10, $08, $14, $00, $00                ; $1AF684 |
  db $F8, $08, $04, $00, $00                ; $1AF689 |
  db $00, $00, $02, $00, $00                ; $1AF68E |
  db $00, $00, $02, $00, $00                ; $1AF693 |
  db $08, $00, $03, $00, $00                ; $1AF698 |
  db $00, $08, $12, $00, $00                ; $1AF69D |
  db $08, $08, $13, $00, $00                ; $1AF6A2 |
  db $00, $00, $05, $00, $00                ; $1AF6A7 |
  db $00, $00, $05, $00, $00                ; $1AF6AC |
  db $08, $00, $06, $00, $00                ; $1AF6B1 |
  db $00, $08, $15, $00, $00                ; $1AF6B6 |
  db $08, $08, $16, $00, $00                ; $1AF6BB |
  db $0E, $08, $18, $00, $00                ; $1AF6C0 |
  db $F9, $08, $07, $00, $00                ; $1AF6C5 |
  db $08, $08, $17, $00, $00                ; $1AF6CA |
  db $00, $08, $08, $00, $00                ; $1AF6CF |
  db $10, $08, $18, $00, $00                ; $1AF6D4 |
  db $F8, $08, $07, $00, $00                ; $1AF6D9 |
  db $00, $08, $08, $00, $00                ; $1AF6DE |
  db $10, $08, $18, $00, $00                ; $1AF6E3 |
  db $F8, $08, $07, $00, $00                ; $1AF6E8 |
  db $01, $00, $0D, $00, $00                ; $1AF6ED |
  db $00, $00, $0E, $00, $00                ; $1AF6F2 |
  db $08, $00, $0F, $00, $00                ; $1AF6F7 |
  db $00, $08, $1E, $00, $00                ; $1AF6FC |
  db $08, $08, $1F, $00, $00                ; $1AF701 |
  db $00, $08, $1E, $00, $00                ; $1AF706 |
  db $08, $08, $1F, $00, $00                ; $1AF70B |
  db $01, $01, $0D, $00, $00                ; $1AF710 |
  db $00, $00, $1E, $80, $00                ; $1AF715 |
  db $08, $00, $1F, $80, $00                ; $1AF71A |
  db $00, $08, $0E, $80, $00                ; $1AF71F |
  db $08, $08, $0F, $80, $00                ; $1AF724 |
  db $00, $08, $0E, $80, $00                ; $1AF729 |
  db $08, $08, $0F, $80, $00                ; $1AF72E |
  db $01, $00, $0D, $00, $00                ; $1AF733 |
  db $00, $00, $1F, $C0, $00                ; $1AF738 |
  db $08, $00, $1E, $C0, $00                ; $1AF73D |
  db $00, $08, $0F, $C0, $00                ; $1AF742 |
  db $08, $08, $0E, $C0, $00                ; $1AF747 |
  db $00, $08, $0F, $C0, $00                ; $1AF74C |
  db $08, $08, $0E, $C0, $00                ; $1AF751 |
  db $01, $01, $0D, $00, $00                ; $1AF756 |
  db $00, $00, $0F, $40, $00                ; $1AF75B |
  db $08, $00, $0E, $40, $00                ; $1AF760 |
  db $00, $08, $1F, $40, $00                ; $1AF765 |
  db $08, $08, $1E, $40, $00                ; $1AF76A |
  db $00, $08, $1F, $40, $00                ; $1AF76F |
  db $08, $08, $1E, $40, $00                ; $1AF774 |
  db $06, $08, $1D, $00, $00                ; $1AF779 |
  db $01, $08, $18, $00, $00                ; $1AF77E |
  db $F8, $08, $1D, $00, $00                ; $1AF783 |
  db $F9, $08, $09, $00, $00                ; $1AF788 |
  db $09, $08, $07, $00, $00                ; $1AF78D |
  db $11, $08, $0A, $00, $00                ; $1AF792 |
  db $11, $08, $0A, $00, $00                ; $1AF797 |
  db $F7, $08, $1D, $00, $00                ; $1AF79C |
  db $00, $08, $0A, $00, $00                ; $1AF7A1 |
  db $FA, $08, $09, $00, $00                ; $1AF7A6 |
  db $07, $08, $1D, $00, $00                ; $1AF7AB |
  db $0A, $08, $09, $00, $00                ; $1AF7B0 |
  db $10, $08, $0A, $00, $00                ; $1AF7B5 |
  db $10, $08, $0A, $00, $00                ; $1AF7BA |
  db $F6, $08, $1D, $00, $00                ; $1AF7BF |
  db $01, $08, $0A, $00, $00                ; $1AF7C4 |
  db $F9, $08, $07, $00, $00                ; $1AF7C9 |
  db $08, $08, $1D, $00, $00                ; $1AF7CE |
  db $09, $08, $09, $00, $00                ; $1AF7D3 |
  db $11, $08, $18, $00, $00                ; $1AF7D8 |
  db $11, $08, $18, $00, $00                ; $1AF7DD |
  db $03, $08, $0A, $00, $00                ; $1AF7E2 |
  db $07, $08, $09, $00, $00                ; $1AF7E7 |
  db $F9, $08, $1D, $00, $00                ; $1AF7EC |
  db $FD, $08, $09, $00, $00                ; $1AF7F1 |
  db $0F, $08, $18, $00, $00                ; $1AF7F6 |
  db $08, $08, $17, $00, $00                ; $1AF7FB |
  db $00, $08, $08, $00, $00                ; $1AF800 |
  db $02, $08, $0A, $00, $00                ; $1AF805 |
  db $FA, $08, $07, $00, $00                ; $1AF80A |
  db $0E, $08, $0A, $00, $00                ; $1AF80F |
  db $00, $00, $05, $00, $02                ; $1AF814 |
  db $08, $08, $19, $00, $00                ; $1AF819 |
  db $00, $08, $0A, $00, $00                ; $1AF81E |
  db $00, $08, $0A, $00, $00                ; $1AF823 |
  db $01, $08, $09, $00, $00                ; $1AF828 |
  db $07, $08, $0A, $00, $00                ; $1AF82D |
  db $01, $FC, $0D, $00, $00                ; $1AF832 |
  db $00, $FC, $0E, $00, $00                ; $1AF837 |
  db $08, $FC, $0F, $00, $00                ; $1AF83C |
  db $00, $04, $1E, $00, $00                ; $1AF841 |
  db $08, $04, $1F, $00, $00                ; $1AF846 |
  db $01, $08, $07, $00, $00                ; $1AF84B |
  db $07, $08, $18, $00, $00                ; $1AF850 |
  db $01, $FA, $0D, $00, $00                ; $1AF855 |
  db $00, $F9, $1E, $80, $00                ; $1AF85A |
  db $08, $F9, $1F, $80, $00                ; $1AF85F |
  db $00, $01, $0E, $80, $00                ; $1AF864 |
  db $08, $01, $0F, $80, $00                ; $1AF869 |
  db $08, $08, $14, $00, $00                ; $1AF86E |
  db $00, $08, $04, $00, $00                ; $1AF873 |
  db $01, $F7, $0D, $00, $00                ; $1AF878 |
  db $00, $F7, $1F, $C0, $00                ; $1AF87D |
  db $08, $F7, $1E, $C0, $00                ; $1AF882 |
  db $00, $FF, $0F, $C0, $00                ; $1AF887 |
  db $08, $FF, $0E, $C0, $00                ; $1AF88C |
  db $00, $08, $04, $00, $00                ; $1AF891 |
  db $08, $08, $14, $00, $00                ; $1AF896 |
  db $01, $F7, $0D, $00, $00                ; $1AF89B |
  db $00, $F6, $0F, $40, $00                ; $1AF8A0 |
  db $08, $F6, $0E, $40, $00                ; $1AF8A5 |
  db $00, $FE, $1F, $40, $00                ; $1AF8AA |
  db $08, $FE, $1E, $40, $00                ; $1AF8AF |
  db $19, $FD, $1B, $00, $00                ; $1AF8B4 |
  db $18, $F3, $1B, $00, $00                ; $1AF8B9 |
  db $DD, $FA, $1B, $00, $00                ; $1AF8BE |
  db $D0, $FF, $1B, $00, $00                ; $1AF8C3 |
  db $E4, $F2, $1B, $00, $00                ; $1AF8C8 |
  db $2B, $01, $1B, $00, $00                ; $1AF8CD |
  db $DD, $FA, $1B, $00, $00                ; $1AF8D2 |
  db $D0, $FF, $1B, $00, $00                ; $1AF8D7 |
  db $E4, $F2, $1B, $00, $00                ; $1AF8DC |
  db $2B, $01, $1B, $00, $00                ; $1AF8E1 |
  db $EE, $F6, $1B, $00, $00                ; $1AF8E6 |
  db $0C, $F8, $1B, $00, $00                ; $1AF8EB |
  db $0F, $FF, $1B, $00, $00                ; $1AF8F0 |
  db $E8, $FC, $1B, $00, $00                ; $1AF8F5 |
  db $18, $FC, $1B, $00, $00                ; $1AF8FA |
  db $17, $F3, $1A, $00, $00                ; $1AF8FF |
  db $DE, $FA, $1B, $00, $00                ; $1AF904 |
  db $D1, $FF, $1A, $00, $00                ; $1AF909 |
  db $E5, $F2, $1A, $00, $00                ; $1AF90E |
  db $2A, $00, $1B, $00, $00                ; $1AF913 |
  db $EF, $F6, $1B, $00, $00                ; $1AF918 |
  db $0B, $F7, $1A, $00, $00                ; $1AF91D |
  db $0E, $FF, $1B, $00, $00                ; $1AF922 |
  db $E9, $FC, $1B, $00, $00                ; $1AF927 |
  db $17, $FC, $1A, $00, $00                ; $1AF92C |
  db $16, $F4, $19, $00, $00                ; $1AF931 |
  db $DF, $FB, $1A, $00, $00                ; $1AF936 |
  db $D2, $01, $19, $00, $00                ; $1AF93B |
  db $E6, $F3, $19, $00, $00                ; $1AF940 |
  db $29, $00, $1A, $00, $00                ; $1AF945 |
  db $0A, $F6, $1A, $00, $00                ; $1AF94A |
  db $F0, $F6, $1B, $00, $00                ; $1AF94F |
  db $EA, $FC, $1A, $00, $00                ; $1AF954 |
  db $0D, $FE, $1A, $00, $00                ; $1AF959 |
  db $16, $FB, $1A, $00, $00                ; $1AF95E |
  db $15, $F4, $19, $00, $00                ; $1AF963 |
  db $E0, $FA, $1A, $00, $00                ; $1AF968 |
  db $D4, $00, $19, $00, $00                ; $1AF96D |
  db $E7, $F3, $19, $00, $00                ; $1AF972 |
  db $27, $FF, $1A, $00, $00                ; $1AF977 |
  db $09, $F7, $19, $00, $00                ; $1AF97C |
  db $F1, $F6, $1A, $00, $00                ; $1AF981 |
  db $EB, $FC, $1A, $00, $00                ; $1AF986 |
  db $0C, $FE, $1A, $00, $00                ; $1AF98B |
  db $14, $FB, $1A, $00, $00                ; $1AF990 |
  db $14, $F5, $19, $00, $00                ; $1AF995 |
  db $E2, $FA, $1A, $00, $00                ; $1AF99A |
  db $D7, $00, $19, $00, $00                ; $1AF99F |
  db $E8, $F4, $19, $00, $00                ; $1AF9A4 |
  db $24, $FE, $1A, $00, $00                ; $1AF9A9 |
  db $08, $F7, $19, $00, $00                ; $1AF9AE |
  db $0A, $FE, $1A, $00, $00                ; $1AF9B3 |
  db $ED, $FD, $1A, $00, $00                ; $1AF9B8 |
  db $F2, $F7, $1A, $00, $00                ; $1AF9BD |
  db $11, $FB, $1A, $00, $00                ; $1AF9C2 |
  db $12, $F6, $19, $00, $00                ; $1AF9C7 |
  db $E5, $FA, $1A, $00, $00                ; $1AF9CC |
  db $DB, $FF, $19, $00, $00                ; $1AF9D1 |
  db $EA, $F5, $19, $00, $00                ; $1AF9D6 |
  db $20, $FE, $1A, $00, $00                ; $1AF9DB |
  db $06, $F9, $19, $00, $00                ; $1AF9E0 |
  db $F0, $FE, $1A, $00, $00                ; $1AF9E5 |
  db $F4, $F9, $1A, $00, $00                ; $1AF9EA |
  db $07, $FF, $1A, $00, $00                ; $1AF9EF |
  db $0D, $FD, $1A, $00, $00                ; $1AF9F4 |
  db $0F, $F8, $19, $00, $00                ; $1AF9F9 |
  db $E9, $FC, $1A, $00, $00                ; $1AF9FE |
  db $E0, $FF, $19, $00, $00                ; $1AFA03 |
  db $ED, $F6, $19, $00, $00                ; $1AFA08 |
  db $1B, $FE, $1A, $00, $00                ; $1AFA0D |
  db $F4, $FF, $1A, $00, $00                ; $1AFA12 |
  db $F7, $FC, $1A, $00, $00                ; $1AFA17 |
  db $03, $FC, $19, $00, $00                ; $1AFA1C |
  db $03, $00, $1A, $00, $00                ; $1AFA21 |
  db $08, $FF, $1A, $00, $00                ; $1AFA26 |
  db $0B, $FB, $19, $00, $00                ; $1AFA2B |
  db $EE, $FE, $1A, $00, $00                ; $1AFA30 |
  db $E6, $00, $19, $00, $00                ; $1AFA35 |
  db $F1, $F9, $19, $00, $00                ; $1AFA3A |
  db $15, $FF, $1A, $00, $00                ; $1AFA3F |
  db $F9, $01, $1A, $00, $00                ; $1AFA44 |
  db $FB, $FF, $1A, $00, $00                ; $1AFA49 |
  db $FF, $FF, $19, $00, $00                ; $1AFA4E |
  db $02, $01, $1A, $00, $00                ; $1AFA53 |
  db $06, $FE, $19, $00, $00                ; $1AFA58 |
  db $F4, $00, $1A, $00, $00                ; $1AFA5D |
  db $ED, $01, $19, $00, $00                ; $1AFA62 |
  db $F6, $FC, $19, $00, $00                ; $1AFA67 |
  db $0E, $00, $1A, $00, $00                ; $1AFA6C |
  db $0E, $00, $1A, $00, $00                ; $1AFA71 |
  db $FC, $FE, $00, $04, $02                ; $1AFA76 |
  db $0C, $0E, $0C, $44, $00                ; $1AFA7B |
  db $FE, $0E, $0C, $04, $00                ; $1AFA80 |
  db $09, $0A, $0E, $80, $00                ; $1AFA85 |
  db $01, $0A, $1E, $00, $00                ; $1AFA8A |
  db $03, $FE, $06, $40, $02                ; $1AFA8F |
  db $FC, $FD, $00, $04, $02                ; $1AFA94 |
  db $0B, $0D, $0C, $44, $00                ; $1AFA99 |
  db $01, $10, $1C, $04, $00                ; $1AFA9E |
  db $09, $09, $0E, $80, $00                ; $1AFAA3 |
  db $01, $09, $1E, $00, $00                ; $1AFAA8 |
  db $03, $FD, $06, $00, $02                ; $1AFAAD |
  db $FC, $FC, $00, $04, $02                ; $1AFAB2 |
  db $04, $10, $1C, $04, $00                ; $1AFAB7 |
  db $09, $0C, $0C, $44, $00                ; $1AFABC |
  db $09, $08, $0E, $80, $00                ; $1AFAC1 |
  db $02, $08, $1E, $00, $00                ; $1AFAC6 |
  db $03, $FC, $06, $00, $02                ; $1AFACB |
  db $FC, $FC, $00, $04, $02                ; $1AFAD0 |
  db $07, $10, $1C, $04, $00                ; $1AFAD5 |
  db $02, $0C, $0C, $04, $00                ; $1AFADA |
  db $09, $08, $0E, $80, $00                ; $1AFADF |
  db $02, $08, $1E, $00, $00                ; $1AFAE4 |
  db $03, $FC, $06, $40, $02                ; $1AFAE9 |
  db $FC, $FD, $00, $04, $02                ; $1AFAEE |
  db $0A, $10, $1C, $04, $00                ; $1AFAF3 |
  db $FE, $0C, $0C, $04, $00                ; $1AFAF8 |
  db $09, $09, $0E, $80, $00                ; $1AFAFD |
  db $01, $08, $1E, $00, $00                ; $1AFB02 |
  db $03, $FD, $06, $40, $02                ; $1AFB07 |
  db $FC, $FD, $00, $04, $02                ; $1AFB0C |
  db $09, $10, $1C, $04, $00                ; $1AFB11 |
  db $01, $10, $1C, $04, $00                ; $1AFB16 |
  db $09, $09, $0E, $80, $00                ; $1AFB1B |
  db $01, $09, $1E, $00, $00                ; $1AFB20 |
  db $03, $FD, $06, $40, $02                ; $1AFB25 |
  db $FD, $FC, $02, $04, $02                ; $1AFB2A |
  db $09, $10, $1C, $04, $00                ; $1AFB2F |
  db $01, $10, $1C, $04, $00                ; $1AFB34 |
  db $09, $08, $0E, $80, $00                ; $1AFB39 |
  db $01, $08, $1E, $00, $00                ; $1AFB3E |
  db $04, $FC, $06, $00, $02                ; $1AFB43 |
  db $F8, $FD, $04, $04, $02                ; $1AFB48 |
  db $09, $0E, $0C, $44, $00                ; $1AFB4D |
  db $02, $0E, $0C, $44, $00                ; $1AFB52 |
  db $06, $08, $0E, $80, $00                ; $1AFB57 |
  db $FE, $08, $1E, $00, $00                ; $1AFB5C |
  db $FF, $FD, $0D, $40, $02                ; $1AFB61 |
  db $FC, $FD, $04, $04, $02                ; $1AFB66 |
  db $09, $10, $1C, $04, $00                ; $1AFB6B |
  db $02, $10, $1C, $04, $00                ; $1AFB70 |
  db $0A, $08, $0E, $80, $00                ; $1AFB75 |
  db $02, $08, $1E, $00, $00                ; $1AFB7A |
  db $03, $FD, $0D, $40, $02                ; $1AFB7F |
  db $FD, $FD, $04, $04, $02                ; $1AFB84 |
  db $05, $0D, $0C, $04, $00                ; $1AFB89 |
  db $FF, $0E, $0C, $04, $00                ; $1AFB8E |
  db $0A, $08, $0E, $80, $00                ; $1AFB93 |
  db $02, $08, $1E, $00, $00                ; $1AFB98 |
  db $04, $FD, $0D, $40, $02                ; $1AFB9D |
  db $FB, $01, $E2, $00, $00                ; $1AFBA2 |
  db $FE, $05, $F1, $00, $00                ; $1AFBA7 |
  db $00, $06, $44, $00, $00                ; $1AFBAC |
  db $F9, $05, $E2, $00, $00                ; $1AFBB1 |
  db $F8, $02, $E2, $00, $00                ; $1AFBB6 |
  db $F8, $09, $E2, $80, $00                ; $1AFBBB |
  db $F9, $05, $E2, $00, $00                ; $1AFBC0 |
  db $F8, $02, $E2, $00, $00                ; $1AFBC5 |
  db $F8, $09, $E2, $80, $00                ; $1AFBCA |
  db $FA, $05, $E2, $40, $00                ; $1AFBCF |
  db $F6, $03, $E2, $00, $00                ; $1AFBD4 |
  db $F6, $08, $E2, $80, $00                ; $1AFBD9 |
  db $F8, $00, $E2, $00, $00                ; $1AFBDE |
  db $F8, $0B, $E2, $C0, $00                ; $1AFBE3 |
  db $F8, $0B, $E2, $C0, $00                ; $1AFBE8 |
  db $FD, $09, $E2, $00, $00                ; $1AFBED |
  db $FD, $02, $E2, $80, $00                ; $1AFBF2 |
  db $F3, $09, $E2, $40, $00                ; $1AFBF7 |
  db $F8, $0D, $E2, $80, $00                ; $1AFBFC |
  db $F3, $02, $E2, $C0, $00                ; $1AFC01 |
  db $F8, $FD, $E2, $00, $00                ; $1AFC06 |
  db $FE, $01, $F0, $80, $00                ; $1AFC0B |
  db $FE, $0A, $F0, $00, $00                ; $1AFC10 |
  db $F2, $0A, $F0, $00, $00                ; $1AFC15 |
  db $F8, $0F, $F0, $80, $00                ; $1AFC1A |
  db $F2, $01, $F0, $80, $00                ; $1AFC1F |
  db $F8, $FB, $F0, $00, $00                ; $1AFC24 |
  db $FF, $00, $F1, $80, $00                ; $1AFC29 |
  db $FF, $0B, $F1, $00, $00                ; $1AFC2E |
  db $F1, $0B, $F1, $40, $00                ; $1AFC33 |
  db $F8, $11, $F1, $80, $00                ; $1AFC38 |
  db $F1, $00, $F1, $C0, $00                ; $1AFC3D |
  db $F8, $F9, $F1, $00, $00                ; $1AFC42 |
  db $00, $FF, $E1, $00, $00                ; $1AFC47 |
  db $00, $0C, $E1, $00, $00                ; $1AFC4C |
  db $F0, $0C, $E1, $00, $00                ; $1AFC51 |
  db $F8, $12, $E1, $00, $00                ; $1AFC56 |
  db $F0, $FF, $E1, $00, $00                ; $1AFC5B |
  db $F8, $F8, $E1, $00, $00                ; $1AFC60 |
  db $08, $04, $0F, $04, $00                ; $1AFC65 |
  db $00, $04, $1F, $04, $00                ; $1AFC6A |
  db $F6, $FA, $3F, $02, $00                ; $1AFC6F |
  db $0F, $FB, $3C, $42, $00                ; $1AFC74 |
  db $FA, $02, $04, $02, $02                ; $1AFC79 |
  db $FD, $0C, $0C, $02, $00                ; $1AFC7E |
  db $05, $04, $0A, $02, $02                ; $1AFC83 |
  db $00, $F9, $02, $02, $02                ; $1AFC88 |
  db $F0, $F9, $00, $02, $02                ; $1AFC8D |
  db $F6, $FB, $3F, $02, $00                ; $1AFC92 |
  db $0F, $FB, $3D, $02, $00                ; $1AFC97 |
  db $FA, $03, $06, $02, $02                ; $1AFC9C |
  db $FD, $0C, $0C, $02, $00                ; $1AFCA1 |
  db $05, $04, $0A, $02, $02                ; $1AFCA6 |
  db $00, $FA, $02, $02, $02                ; $1AFCAB |
  db $F0, $FA, $00, $02, $02                ; $1AFCB0 |
  db $F6, $FC, $3F, $02, $00                ; $1AFCB5 |
  db $0F, $FC, $3E, $02, $00                ; $1AFCBA |
  db $FA, $04, $08, $02, $02                ; $1AFCBF |
  db $FD, $0C, $0C, $02, $00                ; $1AFCC4 |
  db $05, $04, $0A, $02, $02                ; $1AFCC9 |
  db $00, $FB, $02, $02, $02                ; $1AFCCE |
  db $F0, $FB, $00, $02, $02                ; $1AFCD3 |
  db $0A, $0C, $31, $02, $00                ; $1AFCD8 |
  db $F5, $FB, $3F, $02, $00                ; $1AFCDD |
  db $0E, $FB, $3C, $42, $00                ; $1AFCE2 |
  db $02, $04, $20, $02, $02                ; $1AFCE7 |
  db $F9, $03, $06, $02, $02                ; $1AFCEC |
  db $FF, $FA, $02, $02, $02                ; $1AFCF1 |
  db $EF, $FA, $00, $02, $02                ; $1AFCF6 |
  db $F3, $FA, $3F, $02, $00                ; $1AFCFB |
  db $FE, $09, $1C, $02, $00                ; $1AFD00 |
  db $F7, $02, $04, $02, $02                ; $1AFD05 |
  db $0C, $FA, $3D, $02, $00                ; $1AFD0A |
  db $06, $02, $22, $02, $02                ; $1AFD0F |
  db $FD, $F9, $02, $02, $02                ; $1AFD14 |
  db $ED, $F9, $00, $02, $02                ; $1AFD19 |
  db $F6, $FB, $3F, $02, $00                ; $1AFD1E |
  db $0F, $FC, $3E, $02, $00                ; $1AFD23 |
  db $FA, $03, $06, $02, $02                ; $1AFD28 |
  db $FC, $0C, $0C, $02, $00                ; $1AFD2D |
  db $04, $04, $24, $02, $02                ; $1AFD32 |
  db $00, $FA, $02, $02, $02                ; $1AFD37 |
  db $F0, $FA, $00, $02, $02                ; $1AFD3C |
  db $09, $0D, $37, $02, $00                ; $1AFD41 |
  db $F5, $FC, $3F, $02, $00                ; $1AFD46 |
  db $0E, $FC, $3D, $02, $00                ; $1AFD4B |
  db $F9, $04, $08, $02, $02                ; $1AFD50 |
  db $01, $05, $26, $02, $02                ; $1AFD55 |
  db $FF, $FB, $02, $02, $02                ; $1AFD5A |
  db $EF, $FB, $00, $02, $02                ; $1AFD5F |
  db $F8, $0C, $1D, $02, $00                ; $1AFD64 |
  db $12, $FB, $3C, $42, $00                ; $1AFD69 |
  db $04, $04, $28, $02, $02                ; $1AFD6E |
  db $04, $FC, $02, $02, $02                ; $1AFD73 |
  db $F4, $FC, $00, $02, $02                ; $1AFD78 |
  db $F8, $0C, $1D, $02, $00                ; $1AFD7D |
  db $FC, $0A, $0D, $02, $00                ; $1AFD82 |
  db $F8, $0C, $1D, $02, $00                ; $1AFD87 |
  db $12, $FB, $3D, $02, $00                ; $1AFD8C |
  db $04, $04, $28, $02, $02                ; $1AFD91 |
  db $04, $FC, $02, $02, $02                ; $1AFD96 |
  db $F4, $FC, $00, $02, $02                ; $1AFD9B |
  db $F8, $0C, $1D, $02, $00                ; $1AFDA0 |
  db $FC, $0A, $0D, $02, $00                ; $1AFDA5 |
  db $F8, $0C, $1D, $02, $00                ; $1AFDAA |
  db $12, $FC, $3E, $02, $00                ; $1AFDAF |
  db $04, $04, $28, $02, $02                ; $1AFDB4 |
  db $04, $FC, $02, $02, $02                ; $1AFDB9 |
  db $F4, $FC, $00, $02, $02                ; $1AFDBE |
  db $F8, $0C, $1D, $02, $00                ; $1AFDC3 |
  db $FC, $0A, $0D, $02, $00                ; $1AFDC8 |
  db $04, $04, $28, $02, $02                ; $1AFDCD |
  db $12, $FB, $3C, $42, $00                ; $1AFDD2 |
  db $F4, $FC, $00, $02, $02                ; $1AFDD7 |
  db $F8, $07, $0D, $82, $00                ; $1AFDDC |
  db $04, $FC, $02, $02, $02                ; $1AFDE1 |
  db $FC, $0A, $0D, $02, $00                ; $1AFDE6 |
  db $F0, $02, $1C, $82, $00                ; $1AFDEB |
  db $04, $04, $28, $02, $02                ; $1AFDF0 |
  db $12, $FB, $3D, $02, $00                ; $1AFDF5 |
  db $F4, $FC, $00, $02, $02                ; $1AFDFA |
  db $F8, $07, $0D, $82, $00                ; $1AFDFF |
  db $04, $FC, $02, $02, $02                ; $1AFE04 |
  db $FC, $0A, $0D, $02, $00                ; $1AFE09 |
  db $F1, $07, $1C, $02, $00                ; $1AFE0E |
  db $F5, $0C, $0C, $02, $00                ; $1AFE13 |
  db $04, $04, $28, $02, $02                ; $1AFE18 |
  db $12, $FC, $3E, $02, $00                ; $1AFE1D |
  db $F5, $0C, $0C, $02, $00                ; $1AFE22 |
  db $F4, $FC, $00, $02, $02                ; $1AFE27 |
  db $04, $FC, $02, $02, $02                ; $1AFE2C |
  db $FC, $0A, $0D, $02, $00                ; $1AFE31 |
  db $08, $F5, $3D, $42, $00                ; $1AFE36 |
  db $03, $0D, $1C, $02, $00                ; $1AFE3B |
  db $07, $04, $2A, $02, $02                ; $1AFE40 |
  db $06, $FD, $2C, $02, $02                ; $1AFE45 |
  db $F7, $01, $00, $02, $02                ; $1AFE4A |
  db $F3, $0D, $1C, $02, $00                ; $1AFE4F |
  db $FB, $0C, $0D, $82, $00                ; $1AFE54 |
  db $08, $F5, $3C, $02, $00                ; $1AFE59 |
  db $03, $0D, $1C, $02, $00                ; $1AFE5E |
  db $07, $04, $2A, $02, $02                ; $1AFE63 |
  db $06, $FD, $2C, $02, $02                ; $1AFE68 |
  db $F7, $01, $00, $02, $02                ; $1AFE6D |
  db $F3, $0D, $1C, $02, $00                ; $1AFE72 |
  db $FB, $0C, $0D, $82, $00                ; $1AFE77 |
  db $11, $F5, $3C, $42, $00                ; $1AFE7C |
  db $03, $0D, $1C, $02, $00                ; $1AFE81 |
  db $07, $04, $2A, $02, $02                ; $1AFE86 |
  db $07, $FD, $2C, $02, $02                ; $1AFE8B |
  db $F7, $01, $00, $02, $02                ; $1AFE90 |
  db $F3, $0D, $1C, $02, $00                ; $1AFE95 |
  db $FB, $0C, $0D, $82, $00                ; $1AFE9A |
  db $11, $F5, $3D, $02, $00                ; $1AFE9F |
  db $03, $0D, $1C, $02, $00                ; $1AFEA4 |
  db $07, $04, $2A, $02, $02                ; $1AFEA9 |
  db $07, $FD, $2C, $02, $02                ; $1AFEAE |
  db $F7, $01, $00, $02, $02                ; $1AFEB3 |
  db $F3, $0D, $1C, $02, $00                ; $1AFEB8 |
  db $FB, $0C, $0D, $82, $00                ; $1AFEBD |
  db $00, $FF, $1E, $42, $02                ; $1AFEC2 |
  db $F8, $F7, $0E, $02, $02                ; $1AFEC7 |
  db $F8, $07, $2E, $02, $00                ; $1AFECC |
  db $04, $04, $0A, $02, $02                ; $1AFED1 |
  db $0F, $FC, $3C, $42, $00                ; $1AFED6 |
  db $08, $F7, $0E, $42, $00                ; $1AFEDB |
  db $FC, $0C, $0C, $02, $00                ; $1AFEE0 |
  db $09, $EC, $06, $00, $00                ; $1AFEE5 |
  db $00, $DA, $0C, $00, $02                ; $1AFEEA |
  db $00, $E9, $0C, $00, $02                ; $1AFEEF |
  db $01, $EC, $06, $00, $00                ; $1AFEF4 |
  db $06, $08, $18, $00, $00                ; $1AFEF9 |
  db $FE, $08, $18, $00, $00                ; $1AFEFE |
  db $00, $F8, $0C, $00, $02                ; $1AFF03 |
  db $F8, $F8, $00, $00, $02                ; $1AFF08 |
  db $08, $F8, $02, $00, $02                ; $1AFF0D |
  db $F8, $08, $04, $00, $02                ; $1AFF12 |
  db $08, $08, $06, $00, $02                ; $1AFF17 |
  db $F8, $F8, $0A, $00, $02                ; $1AFF1C |
  db $08, $F8, $0C, $00, $02                ; $1AFF21 |
  db $F8, $08, $0E, $00, $02                ; $1AFF26 |
  db $08, $08, $0E, $40, $02                ; $1AFF2B |
  db $F8, $F8, $00, $00, $02                ; $1AFF30 |
  db $08, $F8, $00, $00, $02                ; $1AFF35 |
  db $F8, $08, $00, $00, $02                ; $1AFF3A |
  db $08, $08, $00, $00, $02                ; $1AFF3F |
  db $08, $08, $00, $00, $02                ; $1AFF44 |
  db $FA, $F8, $06, $00, $02                ; $1AFF49 |
  db $08, $F8, $08, $00, $02                ; $1AFF4E |
  db $F3, $04, $00, $00, $02                ; $1AFF53 |
  db $FA, $06, $02, $00, $02                ; $1AFF58 |
  db $08, $08, $04, $00, $02                ; $1AFF5D |
  db $F8, $F9, $06, $00, $02                ; $1AFF62 |
  db $08, $F9, $08, $00, $02                ; $1AFF67 |
  db $E8, $04, $00, $00, $02                ; $1AFF6C |
  db $F8, $06, $02, $00, $02                ; $1AFF71 |
  db $08, $06, $04, $00, $02                ; $1AFF76 |
  db $F0, $04, $00, $00, $02                ; $1AFF7B |
  db $00, $04, $02, $00, $02                ; $1AFF80 |
  db $00, $04, $02, $00, $00                ; $1AFF85 |
  db $10, $04, $04, $00, $02                ; $1AFF8A |
  db $10, $04, $04, $00, $00                ; $1AFF8F |
  db $00, $04, $02, $00, $00                ; $1AFF94 |
  db $08, $04, $03, $00, $00                ; $1AFF99 |
  db $00, $0C, $12, $00, $00                ; $1AFF9E |
  db $08, $0C, $13, $00, $00                ; $1AFFA3 |
  db $10, $04, $04, $00, $02                ; $1AFFA8 |
  db $10, $04, $04, $00, $00                ; $1AFFAD |
  db $10, $04, $04, $00, $00                ; $1AFFB2 |
  db $18, $04, $05, $00, $00                ; $1AFFB7 |
  db $10, $0C, $14, $00, $00                ; $1AFFBC |
  db $18, $0C, $15, $00, $00                ; $1AFFC1 |
  db $05, $F8, $41, $01, $00                ; $1AFFC6 |
  db $FD, $F8, $40, $01, $00                ; $1AFFCB |
  db $03, $02, $4A, $C9, $02                ; $1AFFD0 |
  db $FD, $F8, $40, $01, $02                ; $1AFFD5 |
  db $FE, $08, $2E, $00, $00                ; $1AFFDA |
  db $07, $05, $55, $01, $00                ; $1AFFDF |
  db $FF, $05, $54, $01, $00                ; $1AFFE4 |
  db $06, $F7, $41, $01, $00                ; $1AFFE9 |
  db $FE, $F7, $40, $01, $00                ; $1AFFEE |
  db $03, $03, $4A, $C9, $02                ; $1AFFF3 |
  db $FE, $F7, $40, $01, $02                ; $1AFFF8 |
  db $07, $04, $55                          ; $1AFFFD |
; table continues in bank 1B
; $4D mirror allows seamless crossbank access
