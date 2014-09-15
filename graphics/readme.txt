______________________________________________________________________

 Yoshi's Island Decompression/Recompression Program (SNES)
 September 27, 2004
 Version 1.00

 FuSoYa's Niche
 http://fusoya.cg-games.net
______________________________________________________________________

 CONTENTS
______________________________________________________________________

 1. Credits
 2. Instructions
 3. Legal Notice
 4. Contact Information

______________________________________________________________________

 1. Credits
______________________________________________________________________


 PROGRAMMING:           FuSoYa (Defender of Relm)

 THE USUAL SUSPECTS:    ZSNES debugger, Jeremy Gordon's 65816
                        assembler, SNES Professional ASM kit,
                        SNES9X tracer feature, Naga,
                        Borland's C++ 5.02 package.

______________________________________________________________________

 2. Instructions
______________________________________________________________________

 This is a graphics decompression/recompression program for SMW2 :
 Yoshi's Island (SNES).  It supports the US ROM version 1.0 or 1.1,
 with a standard 0x200 byte copier header.

 For decompression, the command line options are:
    ycompress 0 ROMFileName [FileToSaveAs]

 For recompression, the command line options are:
    ycompress 1 PCHexAddressToInsert ROMFileName [FileToInsert]

 Examples of valid command line arguments:
    ycompress 0 yisland.smc AllGFX.bin
    ycompress 0 yisland.smc
    ycompress 1 120200 yisland.smc AllGFX.bin
    ycompress 1 120200 yisland.smc


 The file name to insert/save as is optional.  If it isn't specified,
 the program will assume you want to deal with split files instead
 of a single file.  Considering that means you'd have about 473
 separate files to deal with, you probably shouldn't do that unless
 you really want to.

 When decompressing the ROM data, the program will also extract the
 non-compressed graphics for convenience.

 When reinserting, use address 0x120200 since that's the address of
 the original data.  Using a different address is not recommended, as
 some of the non-compressed graphics don't like crossing SNES bank
 boundaries.

 The program recompresses the data slightly better than Nintendo did,
 so you should be fairly safe as far as room goes.  However, if the
 program detects that inserting any further will go past 0x1F9580,
 it will abort without applying any changes to the ROM.

 When finished inserting, the program will report on the number of
 free bytes left over.

 Have fun! ^^


______________________________________________________________________

 3. Legal Notice
______________________________________________________________________

 The SMW2 decompression/recompression program (hereafter referred
 to as the "Software") is not official or supported by Nintendo or any
 other commercial entity.

 The Software is freeware thus it can be distributed freely provided
 the following conditions hold:(1) This document is supplied with the
 Software and both the document and Software are not modified in any
 way (2) The Software is not distributed with or as part of any ROM
 image in any format, and (3) No goods, services, or money can be
 charged for the Software in any form, nor may it be included in
 conjunction with any other offer or monetary exchange.

 The Software is provided AS IS, and its use is at your own risk.
 Anyone mentioned in this document will not be held liable for any
 damages, direct or otherwise, arising from its use or presence.
 

______________________________________________________________________

 4. Contact Information
______________________________________________________________________

 FuSoYa
   www:   http://fusoya.cg-games.net (was http://fusoya.cjb.net)
   ???:   06942508

______________________________________________________________________
