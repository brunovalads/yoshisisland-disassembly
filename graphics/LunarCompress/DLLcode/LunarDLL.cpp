/**************************************************************************

   Lunar Compress C Dynamic DLL Access Program
   Created by FuSoYa, Defender of Relm
   http://fusoya.eludevisibility.org

   Check "LunarDLL.h" for documentation on using this file.

**************************************************************************/

//#include "stdafx.h"  //use this if you get errors compiling under VC
#include <windows.h>
#include "..\DLLCode\LunarDLL.h"

LCPROC1 LunarVersion;
LCPROC2 LunarCloseFile;
LCPROC3 LunarOpenFile;
LCPROC4 LunarGetFileSize;
LCPROC5 LunarReadFile;
LCPROC6 LunarWriteFile;
LCPROC7 LunarSNEStoPC;
LCPROC8 LunarPCtoSNES;
LCPROC9 LunarDecompress;
LCPROC10 LunarRecompress;
LCPROC11 LunarEraseArea;
LCPROC12 LunarExpandROM;
LCPROC13 LunarVerifyFreeSpace;
LCPROC14 LunarCreatePixelMap;
LCPROC15 LunarCreateBppMap;
LCPROC16 LunarSNEStoPCRGB;
LCPROC17 LunarPCtoSNESRGB;
LCPROC18 LunarRender8x8;
LCPROC19 LunarWriteRatArea;
LCPROC20 LunarEraseRatArea;
LCPROC21 LunarGetRatAreaSize;
LCPROC22 LunarOpenRAMFile;
LCPROC23 LunarSaveRAMFile;
LCPROC24 LunarIPSCreate;
LCPROC25 LunarIPSApply;
LCPROC26 LunarSetFreeBytes;

HINSTANCE LunarLibInst=NULL;


bool LunarUnloadDLL()  {

   if (!LunarLibInst)
      return true;	//the library is already unloaded
   FreeLibrary(LunarLibInst);
   LunarLibInst=NULL;
   return true;   //library unloaded
}

bool LunarLoadDLL()  {
unsigned int i=0;

   if (LunarLibInst)
      return true;	//the library is already loaded
   LunarLibInst = LoadLibrary("Lunar Compress");
   if (!LunarLibInst) //hmm, try the other file name?
      LunarLibInst = LoadLibrary("Lunar_Compress");
   if (!LunarLibInst)
      return false;	//Couldn't load DLL...

   // If the handle is valid, try to get the function addresses.
   i+=(bool)( LunarVersion = (LCPROC1)GetProcAddress(LunarLibInst,"LunarVersion") );
   i+=(bool)( LunarCloseFile = (LCPROC2)GetProcAddress(LunarLibInst,"LunarCloseFile") );
   i+=(bool)( LunarOpenFile = (LCPROC3)GetProcAddress(LunarLibInst,"LunarOpenFile") );
   i+=(bool)( LunarGetFileSize = (LCPROC4)GetProcAddress(LunarLibInst,"LunarGetFileSize") );
   i+=(bool)( LunarReadFile = (LCPROC5)GetProcAddress(LunarLibInst,"LunarReadFile") );
   i+=(bool)( LunarWriteFile = (LCPROC6)GetProcAddress(LunarLibInst,"LunarWriteFile") );
   i+=(bool)( LunarSNEStoPC = (LCPROC7)GetProcAddress(LunarLibInst,"LunarSNEStoPC") );
   i+=(bool)( LunarPCtoSNES = (LCPROC8)GetProcAddress(LunarLibInst,"LunarPCtoSNES") );
   i+=(bool)( LunarDecompress = (LCPROC9)GetProcAddress(LunarLibInst,"LunarDecompress") );
   i+=(bool)( LunarRecompress = (LCPROC10)GetProcAddress(LunarLibInst,"LunarRecompress") );
   i+=(bool)( LunarEraseArea = (LCPROC11)GetProcAddress(LunarLibInst,"LunarEraseArea") );
   i+=(bool)( LunarExpandROM = (LCPROC12)GetProcAddress(LunarLibInst,"LunarExpandROM") );
   i+=(bool)( LunarVerifyFreeSpace = (LCPROC13)GetProcAddress(LunarLibInst,"LunarVerifyFreeSpace") );
   i+=(bool)( LunarCreatePixelMap = (LCPROC14)GetProcAddress(LunarLibInst,"LunarCreatePixelMap") );
   i+=(bool)( LunarCreateBppMap = (LCPROC15)GetProcAddress(LunarLibInst,"LunarCreateBppMap") );
   i+=(bool)( LunarSNEStoPCRGB = (LCPROC16)GetProcAddress(LunarLibInst,"LunarSNEStoPCRGB") );
   i+=(bool)( LunarPCtoSNESRGB = (LCPROC17)GetProcAddress(LunarLibInst,"LunarPCtoSNESRGB") );
   i+=(bool)( LunarRender8x8 = (LCPROC18)GetProcAddress(LunarLibInst,"LunarRender8x8") );
   i+=(bool)( LunarWriteRatArea = (LCPROC19)GetProcAddress(LunarLibInst,"LunarWriteRatArea") );
   i+=(bool)( LunarEraseRatArea = (LCPROC20)GetProcAddress(LunarLibInst,"LunarEraseRatArea") );
   i+=(bool)( LunarGetRatAreaSize = (LCPROC21)GetProcAddress(LunarLibInst,"LunarGetRatAreaSize") );
   i+=(bool)( LunarOpenRAMFile = (LCPROC22)GetProcAddress(LunarLibInst,"LunarOpenRAMFile") );
	i+=(bool)( LunarSaveRAMFile = (LCPROC23)GetProcAddress(LunarLibInst,"LunarSaveRAMFile") );
   i+=(bool)( LunarIPSCreate = (LCPROC24)GetProcAddress(LunarLibInst,"LunarIPSCreate") );
	i+=(bool)( LunarIPSApply = (LCPROC25)GetProcAddress(LunarLibInst,"LunarIPSApply") );
   i+=(bool)( LunarSetFreeBytes = (LCPROC26)GetProcAddress(LunarLibInst,"LunarSetFreeBytes") );

   if (i>=26)
       return true;	//load successful!

   LunarUnloadDLL();
   return false;	//we couldn't find all the functions...
}



