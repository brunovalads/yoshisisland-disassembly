______________________________________________________________________

 Lunar Compress : Unofficial Nintendo Compression DLL Module
 June 15, 2013
 Version 1.70

 FuSoYa's Niche
 http://fusoya.eludevisibility.org
______________________________________________________________________

 CONTENTS
______________________________________________________________________

 1. Introduction
 2. What's New
 3. Examples
 4. Legal Notice
 5. Contact Information

______________________________________________________________________

 1. Introduction
______________________________________________________________________


 Lunar Compress is a decompression and recompression DLL written in C
 for a few compression formats that have been known to show up in
 certain SNES/GB games.  It's intended primarily as a programmer's
 resource, so it even includes a few common functions that may be
 useful for SNES ROM editing (such as ROM/PC address conversion, ROM
 expansion, bpp/indexed GFX conversion, etc).

 The zip file contains the source code required for accessing the DLL,
 and two simple command line utilities that may prove useful if you
 just want to test or use the DLL's compression capabilities without
 having to code anything.  The source code for these two programs
 have been provided, as well as the source to a simple win32 GUI
 sample program for Super Mario World so you can examine how to use
 the DLL correctly.

 A small brute force tool called "sniff" that can occasionally be
 useful for locating compressed data offsets is also included (check
 the sniff.txt file).

 For documentation on the DLL function calls and the values used to
 represent each format, please read the files "LunarDLL.h" and
 "LunarDLL.def".  While the DLL and utilities have all been written in
 C/C++, other languages should be able to access the DLL just fine,
 including VB.

 Currently, the DLL supports formats found in Super Mario World,
 Super Mario World 2 / Yoshi's Island, Mario RPG, Zelda 3, Metroid 3,
 Mario Kart, Sim City, Secret of Mana, MegaMan X, Lufia 1, Lufia 2,
 RoboTrek, Harvest Moon, Gradius 3, Chrono Trigger, Famicom Tantei/
 Detective Club 2,  Radical Dreamers, Star Fox 1, Star Fox 2, Sailor
 Moon Another Story RPG, Sailor Moon R, Pokemon Gold & Silver (GB),
 Sailor Moon (GB), and Sailor Moon R (GB).

 In most of the test cases I've run on the data from the games, the
 level of recompression provided by the DLL has either matched or
 beaten the level of compression of the original data.  However,
 with a few games (such as Mario RPG and Mario Kart), the smaller
 sections of data were compressed pretty well to begin with, so YMMV.


______________________________________________________________________

 2. What's New
______________________________________________________________________


Version 1.70 June 15, 2013

-Added a new format used in the Sailor Moon Another Story RPG game
 (LC_LZ17).
-Added a new format used in the Sailor Moon R side-scroller fighting
 game (LC_LZ18).
-added 64 bit builds of the DLL and sample programs, which you can
 find in the x64 folder.
-slightly improved the recompression size for format LC_LZ3, with a
 tweak copied back from Lunar Magic.
-updated the IPS code with the latest code from Lunar IPS.


Version 1.61 October 12, 2009

-added RATF_NOWRITE, RATF_EXHIROM_RANGE, and RATF_EXLOROM_RANGE flags
 for the LunarWriteRatArea() function (taken from Lunar Magic 1.64).
-fixed a bug that could sometimes occur in decompressing format LC_LZ3
 (the pokemon Gold/Silver format), and improved the recompression size
 of the same format.  Thanks goes out to Tauwasser for reporting and
 submitting the data for this.


Version 1.60 November 13, 2004

-Added a new format used in Star Fox 1 and 2 for Gideon/d4s's
 translation project, decompressed by the SFX chip (LC_LZ15).
-Added a new format used in Yoshi's Island, decompressed by the
 SFX chip (LC_LZ16).
-Added a new format used in Radical Dreamers for Demi (LC_RLE4).
-fixed a few bugs in decompressing and recompressing format LC_LZ3
 (the pokemon Gold/Silver format).  Thanks goes out to HyperHacker
 for bringing this up.
-fixed a crash bug that would occur while trying to recompress in
 most formats if you passed a size value of 0 for the data.
-corrected a silly mistake where I set the new RATF_EXPANDROM flag
 added in version 1.50 to the same value as RATF_EXLOROM.  Both the
 .def file and the dll itself were affected.
-added scanning of the user supplied data for detection and removal
 of embedded RATs in LunarWriteRatArea().  You can use the new
 RATF_NOSCANDATA flag to turn this off.
-Updated the address conversion functions to accept LC_HIROM_2 as a
 ROM type, to allow forcing address conversion from PC to SNES to
 always use the 40:0000 memory map (up to 70:0000).


Version 1.51 October 23, 2003

-fixed a bug in LunarEraseRatArea(), where under certain circumstances
 the function would erase the RAT tag but not the data.


Version 1.50 July 4, 2003

-Added a new format used in Famicom Tantei/Detective Club 2 for Demi
 (LC_LZ14).
-Fixed a bug that could occasionally cause the DLL to crash while
 recompressing data in Mario RPG's format (LC_LZ4).  Thanks goes out
 to Dforce for pointing this out.
-Added an optional tweak to LC_LZ5 for Mario Kart, which compresses
 the data more like Nintendo did and may reduce the size slightly in
 a few cases.  In most other cases though it will increase the size,
 so usage isn't really recommended.  Use format2=1 to enable.
-Added the LunarSetFreeBytes() function.  This allows you to set up to
 2 different bytes to check for when scanning for free space, and the
 byte to use when expanding the ROM or erasing an area.
-Added the RATF_EXPANDROM flag for LunarWriteRatArea, to automatically
 expand a ROM when there isn't enough space to save something, up to
 32 mbits.
-Added a small fix to the LunarPCtoSNES() function for ExHiROM maps.
 The last halves of the last 2 banks are technically accessible from
 the 00:8000 map.


Version 1.40 December 25, 2002

-Added support for using any of the DLL's file related functions on 
 memory through the LunarOpenRAMFile() function.  This may be useful
 for decompressing from RAM, etc.  Also included LunarSaveRAMFile()
 for saving a memory array to a file.
-Updated the sniff.exe program to include an option for taking 
 advantage of decompressing from RAM, which speeds things up.
-Added support for SNES 48 & 64 Mbit ExLoROM and ExHiROM expansion
 to the LunarExpandROM() function.
-Changed the address conversion functions to accept LC_EXHIROM and
 LC_EXLOROM as ROM types.  The LC_EXROM constant is now depreciated,
 but it will still act the same as LC_EXHIROM.
-Changed the address conversion functions to accept LC_LOROM_2 as a
 ROM type, to allow forcing address conversion from PC to SNES to
 always use the 80:8000 memory map.
-Changed the LunarWriteRatArea() function slightly to accept data
 arrays of size 0, though it will be changed to a size of 1 by the
 DLL.
-Added the LunarIPSCreate() and LunarIPSApply() functions, which
 allows the DLL to create and apply IPS patches.


Version 1.30 July 20, 2002

-Added a format used in RoboTrek.
-Added a format used in Harvest Moon.
-Added a format used in Gradius 3.
-Added a format used in Chrono Trigger.
-Added the RAT functions based on Lunar Magic's code.
-moved the macros to a new file called "LunarDLL.def" to keep things
 organized.  It's already #included in the "LunarDLL.h" file , so you
 shouldn't need to change anything as far as compiling goes.
-Included the Sniff.exe program to scan a file for compressed data
 (read the sniff.txt file for more details).


Version 1.21 April 21, 2002

-Added a format used in Sailor Moon (GB) and Sailor Moon R (GB),
 originally done for EsperKnight's translation project.
-Added a small format used for SoM's title screen graphics, which 
 was done for Ombra's translation project several months ago.
-Added a simple format used by MegaMan X that I looked into for Fx3.
-Added a second format of Mario RPG which was used for some of the
 end game sequence graphics, done for another of Ombra's projects.
-Added a format used by Lufia 2 for graphics, because it was Friday
 and I felt like it.  ;)
-Included an updated form of decomp.exe and recomp.exe, which just 
 display a little more information than the old versions did.
-added LC_2BPP_GFX option to LunarRender8x8 function, to mimic how
 the SNES determines which colors in the palette to use with 2bpp
 graphics.
-added LC_TILE_16, LC_TILE_32, and LC_TILE_64 flags to the
 LunarRender8x8 function to allow drawing 16x16, 32x32, and 64x64
 tiles.


Version 1.12 July 25, 2001

-Ack, the palette conversion function still wasn't quite correct!
 Serves me right for trying to repair it when I'm half asleep... -_-


Version 1.11 July 24, 2001

-Fixed a bug in the LunarSNEStoPCRGB() function that was causing the
 palette conversion to give incorrect results.
-Added pointer conversion support for extended HiROM maps (48 mbit).
-Included a simple demo program for LunarRender8x8() using SMW.


Version 1.10 July 12, 2001

-Added support for a compression format variation used in Metroid 3,
 Mario Kart, and Sim City.  Thanks goes out to Skeud for sending me
 the ASM trace data for this.
-Added a function for rendering a standard 8x8 SNES tile, called 
 "LunarRender8x8".  It includes a fair number of extras such as 
 inverting, highlighting, translucency, etc that may be useful.


Version 1.00 June 23, 2001

-First Release.


______________________________________________________________________

 3. Examples
______________________________________________________________________


 These are just a few examples of how to use the sample decomp.exe
 and recomp.exe programs to use the DLL for compression.


 -->Decompress data and graphics for Mario RPG title screen.
    Note: This is for the US ROM with no header.
 decomp.exe marioRPG.smc title.bin 3F216F 3 0

 -->Compress the extracted Mario RPG title screen to a separate file.
 recomp.exe title.bin titlec.bin 0 3 0

 -->Compress the extracted Mario RPG title screen and insert it back
    into the ROM.  Don't do this if the size of the compressed data
    is going to be larger than the original unless you're sure 
    there's going to be room for it.
 recomp.exe title.bin marioRPG.smc 3F216F 3 0

 -->Decompress data and graphics for Lufia 2 "Natsume" intro screen.
 decomp.exe lufia2.smc natsume.bin 145A6F 8 0

 -->Decompress font graphics for MegaManX.
 decomp.exe MegaManX.smc mmx.bin E6BB4 102 3840


______________________________________________________________________

 4. Legal Notice
______________________________________________________________________

 The Lunar Compress DLL module and support programs (hereafter referred
 to as the "Software") are not official or supported by Nintendo or any
 other commercial entity.

 The Software is freeware thus it can be distributed freely provided
 the following conditions hold:(1) This document is supplied with the
 Software and both the document and Software are not modified in any
 way¹ (2) The Software is not distributed with or as part of any ROM
 image in any format, and (3) No goods, services, or money can be
 charged for the Software in any form, nor may it be included in
 conjunction with any other offer or monetary exchange.

 The Software is provided AS IS, and its use is at your own risk.
 Anyone mentioned in this document will not be held liable for any
 damages, direct or otherwise, arising from its use or presence.
 
 ¹Does not apply to any source code files that are included as part of
  the package, which you may modify, distribute, and use as needed.
  You may distribute the DLL file without including this document if it
  is part of a software package that uses it.

______________________________________________________________________

 5. Contact Information
______________________________________________________________________

 FuSoYa
   www:   http://fusoya.eludevisibility.org
   ???:   06942508
______________________________________________________________________
