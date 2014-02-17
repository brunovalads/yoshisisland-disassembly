______________________________________________________________________

 Snes9x SFX Tracer
 March 2, 2005
 Version 1.43 FuSoYa SFX_B2

 FuSoYa's Niche
 http://fusoya.panicus.org
______________________________________________________________________

 CONTENTS
______________________________________________________________________

 1. Introduction
 2. What's New
 3. Legal Notice
 4. Contact Information


______________________________________________________________________

 1. Introduction
______________________________________________________________________


 This program is an unofficial build of Snes9x, intended for use in
 tracing instructions done by the SFX chip, for games that actually
 use it.  It is not for tracing the main SNES 65816 CPU instructions.
 This version is not in any way supported by the official snes9x
 developers.

 This build does not include several extras in the offical builds 
 (Zip, PNG, Fmod, Glide).

 Usage of the program is very simple.  Enable Num Lock during the game
 to begin tracing, and disable it to end.  When the trace begins, the
 instructions will be dumped to a file called sfx_trace.txt.  Also, a
 file called sfx_traceStart.srm will be created (the SFX uses SRAM for
 RAM).  When you end the trace, a file called sfx_traceEnd.srm will be
 created.  If you do another trace, these 3 files will be overwritten.

 Due to the number of registers that the chip has, only registers and
 flags that are changed by the current instruction are printed out on
 each line.

 While most of the SFX tracing code was already in Snes9x, I have made
 a few minor changes.  The most important one is the new "ROM=xx:xxxx"
 and "SRAM=xx:xxxx" indicators, which allows you to more easily figure
 out when the SFX is accessing ROM or RAM addresses.  However, RAM
 changes done by instructions like PLOT are not reported.

 And a thank you goes out to d4s, for providing some SFX info.

______________________________________________________________________

 2. What's New
______________________________________________________________________


Version 1.43 FuSoYa SFX_B2 March 2, 2005

-No changes (public release).


Version 1.43-WIP1 FuSoYa SFX_B2 October 4, 2004

-based on latest WIP of snes9x.
-private release.


Version 1.42 FuSoYa SFX_B1 August 5, 2004

-First Release (private).

______________________________________________________________________

 3. Legal Notice
______________________________________________________________________

 This Snes9x SFX Tracer program (hereafter referred to as the
 "Software") is not official or supported by the Snes9x developers,
 Nintendo, or any other commercial entity.

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
 
 You can also find additional license and copyright information in
 the original Snes9x license (see license.txt).

______________________________________________________________________

 4. Contact Information
______________________________________________________________________

 FuSoYa
   www:   http://fusoya.panicus.org (was http://fusoya.cjb.net)
   ???:   06942508
______________________________________________________________________
