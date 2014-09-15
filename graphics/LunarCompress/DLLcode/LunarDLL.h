/**************************************************************************

   Lunar Compress C Dynamic DLL Access Header File
   Created by FuSoYa, Defender of Relm
   http://fusoya.eludevisibility.org

   To access the Lunar Compress DLL functions, #include this header file
   in your source code and add LunarDLL.cpp to your project.  Use
   LunarLoadDLL() to load the DLL at run-time, and use LunarUnloadDLL()
   when your program is finished.  An import library file is not required.

   You can find the macro definitions in the LunarDLL.def file.

   Take a look at decomp.cpp and recomp.cpp for sample code on how to use
   the DLL.

   Check the documentation below for information on specific DLL functions.
   Note that all integers are assumed to be 32 bit by default.

**************************************************************************/

#ifndef LUNAR_DLL_H
#define LUNAR_DLL_H

//Macros are in a separate file in LC version 1.22+
#include "..\DLLCode\LunarDLL.def"




/**************************************************************************

Loads the Lunar Compress DLL and assigns the function variables.  You must 
call this function before attempting to use any of the DLL functions.

Returns true on success, false on fail.

**************************************************************************/

bool LunarLoadDLL();




/**************************************************************************

Unloads the Lunar Compress DLL from memory.  You must call this function 
when you no longer need the DLL.

Returns true on success, false on fail.

**************************************************************************/

bool LunarUnloadDLL();




/**************************************************************************

Returns the current version of the DLL as an unsigned integer.
For example, version 1.30 of the DLL would return "130" (decimal).

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC1)();
extern LCPROC1 LunarVersion;
//extern "C" unsigned int WINAPI _export LunarVersion()




/**************************************************************************

Open file for access by the DLL.  Files of any size can be opened, since the 
DLL does not load the entire file into RAM for manipulations.
If another file is already open, LunarCloseFile() will be used to close it 
first.  

The DLL does not prevent other applications from reading/writing to the 
file at the same time, though of course that isn't recommended.

char* FileName        - Name of File
unsigned int FileMode - indicates the mode to open the file in.
 LC_READONLY        : Open existing file in read-only mode (default).
 LC_READWRITE       : Open existing file in read and write mode.
 LC_CREATEREADWRITE : Create a new file in read and write mode, erase the
                      existing file (if any).

Returns true on success, false on fail.

**************************************************************************/

typedef BOOL (WINAPI *LCPROC3)(char* FileName, unsigned int FileMode);
extern LCPROC3 LunarOpenFile;
//extern "C" BOOL WINAPI _export LunarOpenFile(char* FileName, unsigned int FileMode)




/**************************************************************************

"Open" a byte array in RAM for access by the DLL as though it were a file.  
If another file is already open, LunarCloseFile() will be used to close it 
first.  

This function causes all file related functions of the DLL to operate on
an array of data in RAM instead of an actual file.  This may be useful for 
decompressing structures from memory, or if your program loads an entire 
ROM into memory you can have the DLL operate on it instead of the file.
Working with a file loaded into RAM will speed up file operations, however
there's still the overhead of loading/saving the entire file.

You may still modify the array contents directly in your own application 
while it is "open" in the DLL, provided the array remains in the same 
memory location.

The file mode flags will be used to indicate whether or not the DLL is 
allowed to write to the array.  Even if you're using your own array, you
must still specify one of the file mode flags so the DLL knows if it should
treat the array as read-only or not.  Naturally, this does not prevent you
from modifying the array directly in your own program using the returned
pointer.

Take care not to call functions that would cause the DLL to write data past
the end of the array.  Alternatively, you can specify LC_LOCKARRAYSIZE to 
prevent the DLL from ever attempting to write past the reported array size.

If you wish, you can report the size of your array to be much smaller than 
it really is when you call the function.  This may be useful if you loaded
an entire ROM into an array that is much larger than the file, and you want 
to later use the DLL's ROM expansion functions on it.  To allow expansion
with LunarExpandROM() while still ensuring that the DLL doesn't otherwise
write past the end of the array, you can specify LC_LOCKARRAYSIZE_2.

The LC_CREATEARRAY option causes the DLL to create an array for itself in
RAM instead of using an array you provide.  In this case, it will use the
data variable as a pointer to a string specifying the path and name of the
file that you want the DLL to load into this array using whichever file
mode you specify.  The size variable will be used to indicate the minimum
size of the array to allocate... if the file size is larger than this, the
size variable is ignored.  This is only useful if you want to use the ROM 
expansion function later to increase the file size up to the size you 
requested.  Note that the file itself will be kept open in the mode 
specified until you call the LunarCloseFile() function.

If you want the contents of the array to be saved back to the file, you can
call LunarSaveRAMFile().  Or you can specify the LC_SAVEONCLOSE option
in LunarOpenRAMFile() to save the file automatically when LunarCloseFile()
is called (only applies if you used the LC_CREATEARRAY option).

void* data            - Pointer to array of bytes to use as file (or if the 
                        LC_CREATEARRAY option is used, this is the name of
                        the file to open).
unsigned int FileMode - indicates the mode to open the file in, plus optional
                        flags.  The modes and flags available are:
 LC_READONLY        : Open existing file in read-only mode (default).
 LC_READWRITE       : Open existing file in read and write mode.
 LC_CREATEREADWRITE : Create a new file in read and write mode, erase the
                      existing file (if any).
 LC_LOCKARRAYSIZE   : Prevent the DLL from ever reading/writing past the end
                      of the array.  ROM expansion functions will have no 
                      effect.
 LC_LOCKARRAYSIZE_2 : Prevent the DLL from reading/writing past the end of 
                      the array except for the LunarExpandROM function.
 LC_CREATEARRAY     : Instructs the DLL to create its own array and load a
                      file into it using the specified file mode.  The DLL 
                      assumes responsibility for freeing up the memory when 
                      you close the file, and will write the array's contents 
                      back to the file if the file wasn't opened in read-only
                      mode.  
 LC_SAVEONCLOSE     : Automatically save the contents of the byte array back 
                      to the file when LunarCloseFile() is called.  This has 
                      no effect if the file was opened in read-only mode, or
                      if you didn't use LC_CREATEARRAY.
unsigned int size   : Size of the user-supplied array.  When using the 
                      LC_CREATEARRAY option, it's the minimum size of the
                      array to be allocated.

Returns pointer to array on success, 0 on fail.

**************************************************************************/

typedef unsigned char* (WINAPI *LCPROC22)(void* data, unsigned int FileMode, unsigned int size);
extern LCPROC22 LunarOpenRAMFile;
//extern "C" unsigned char* WINAPI _export LunarOpenRAMFile(void* data, unsigned int FileMode, unsigned int size)



/**************************************************************************

Saves the currently open byte array in RAM to a file (see LunarOpenRAMFile()
for how to open a byte array as a file).

If you used the LC_CREATEARRAY option in LunarOpenRAMFile(), the file name
is optional.  If you specify a file name, the old file will be closed and
a new file will be created with the contents of the RAM array.  Note that
the LC_SAVEONCLOSE option for LunarOpenRAMFile() will NOT cause the array
contents to be written to the old file in this case.  The new file will then 
remain open in the same mode used to open the old file until LunarCloseFile() 
is called.  If you do not specify a file name and the original file was opened 
in read-only mode, the function will not allow you to save the RAM array to 
the file!

If you did not use the LC_CREATEARRAY option in LunarOpenRAMFile(), a file
name is required.  Note however that if you used your own array, the DLL will 
not retain ownership of the created file. Ie, the file will immediately be 
closed once the save is complete and subsequent calls to this function will 
still require a file name.

If you specify the name of a file that already exists, it will be overwritten.

char* FileName        - Path and name of the file to save as.  You can 
                        set this to NULL if you used the LC_CREATEARRAY
                        flag in LunarOpenRAMFile and you wish to save to
                        the same file you opened, but only if it was not
                        opened in read-only mode.

Returns non-zero on success, 0 on fail.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC23)(char* FileName);
extern LCPROC23 LunarSaveRAMFile;
//extern "C" unsigned int WINAPI _export LunarSaveRAMFile(char* FileName)


/**************************************************************************

Closes the file or RAM byte array currently open in the DLL.

This function is also called automatically before the DLL is unloaded from
memory as a fail safe measure, though of course you shouldn't rely on that
when coding your application.

Returns true on success, false on fail.

**************************************************************************/

typedef BOOL (WINAPI *LCPROC2)();
extern LCPROC2 LunarCloseFile;
//extern "C" BOOL WINAPI _export LunarCloseFile()




/**************************************************************************

Returns the size of the file in bytes that is currently open in the DLL.
It will return 0 on failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC4)();
extern LCPROC4 LunarGetFileSize;
//extern "C" unsigned int WINAPI _export LunarGetFileSize()




/**************************************************************************
 
Reads data from the currently open file into a byte array.

void* Destination          - destination byte array.
unsigned int Size          - number of bytes to read.
unsigned int Address       - file offset to get data from.
unsigned int Seek          - LC_NOSEEK or LC_SEEK. Not seeking to the 
     address can speed up file I/O if you're reading consecutive chunks 
     of data.

Returns non-zero on success, 0 on fail.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC5)(void* Destination, unsigned int Size, unsigned int Address, unsigned int Seek);
extern LCPROC5 LunarReadFile;
//extern "C" unsigned int WINAPI _export LunarReadFile(void* Destination, unsigned int Size, unsigned int Address, unsigned int Seek)




/**************************************************************************

Writes data from a byte array to the currently open file.

void* Source          - source byte array.
unsigned int Size     - number of bytes to write.
unsigned int Address  - file offset to write data at.
unsigned int Seek     - LC_NOSEEK or LC_SEEK. Not seeking to the address
     can speed up file I/O if you're writing consecutive chunks of data.

Returns non-zero on success, 0 on fail.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC6)(void* Source, unsigned int Size, unsigned int Address, unsigned int Seek);
extern LCPROC6 LunarWriteFile;
//extern "C" unsigned int WINAPI _export LunarWriteFile(void* Source, unsigned int Size, unsigned int Address, unsigned int Seek)




/**************************************************************************

Changes the bytes used for scanning for free space and erasing data.

unsigned int value    - lower 8 bits are for free space byte 1, 
                        next 8 bits are for free space byte 2,
                        and next 8 bits are for byte to use for erasing.

This function affects ROM expansion and erasing, even in RAT functions.
It allows you to set up to 2 different bytes to check for when scanning
for free space, and the byte to use when expanding the ROM or erasing an
area.  For example, if you wanted to use both 00 and FF to represent free
space and 00 to erase data, you would pass 0xFF.  To only use FF to
represent free space and to erase data, you would pass 0xFFFFFF.

You should set the byte to use for erasing to the same value as one of
the 2 free space bytes, for obvious reasons.

When the DLL is first loaded, all 3 bytes are set to 0 by default.

Returns non-zero on success, 0 on fail.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC26)(unsigned int value);
extern LCPROC26 LunarSetFreeBytes;
//extern "C" unsigned int WINAPI _export LunarSetFreeBytes(unsigned int value)




/**************************************************************************

Converts a SNES ROM Address to a PC file offset.

unsigned int Pointer - SNES address to convert.
unsigned int ROMType - One of the following values:
    LC_LOROM   : For LoROM games up to 32 Mbit ROM sizes.
    LC_LOROM_2 : Same effect as LC_LOROM.
    LC_HIROM   : For HiROM games up to 32 Mbit ROM sizes.
    LC_HIROM_2 : Same effect as LC_HIROM
    LC_EXLOROM : For LoROM games above 32 Mbit.
    LC_EXHIROM : For HiROM games above 32 Mbit.
unsigned int Header  - LC_NOHEADER or LC_HEADER (0x200 bytes).
     (the header will be included in the return value)

So the ROM type you should use based on the ROM size is:

LC_LOROM   : 00-32 Mbit ROMs (0-4 MB)
LC_LOROM_2 : 00-32 Mbit ROMs (0-4 MB)
LC_HIROM   : 00-32 Mbit ROMs (0-4 MB)
LC_HIROM_2 : 00-32 Mbit ROMs (0-4 MB)
LC_EXLOROM : 33-64 Mbit ROMs (4.x-8 MB)
LC_EXHIROM : 33-64 Mbit ROMs (4.x-8 MB)

Do NOT specify an ExROM type if your ROM is not larger than 32 Mbit!

A warning on 64 Mbit ROMs:  Since banks 7E and 7F are used for RAM instead
of ROM, the SNES cannot access the last 64 KB of a 64 Mbit ExLoROM file
or 64 KB from the second and fourth last 32K chunks in a 64 Mbit ExHiROM file.
Thus you should not store anything past $7F:01FF PC in an ExLoROM file with
a copier header, or in the ranges $7E:0200-7E:81FF and $7F:0200-7F:81FF PC 
in an ExHiROM file with a copier header.

Also note that for 64 Mbit ExHiROM files, the area from 0000-7FFF of banks
$70 - $77 is usually used by SRAM, so the corresponding areas in the ROM 
are not accessible.

Returns the PC file offset of the SNES ROM address.
It will return an undefined value for non-ROM addresses.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC7)(unsigned int Pointer, unsigned int ROMType, unsigned int Header);
extern LCPROC7 LunarSNEStoPC;
//extern "C" unsigned int WINAPI _export LunarSNEStoPC(unsigned int Pointer, unsigned int ROMType, unsigned int Header)




/**************************************************************************

Converts PC file offset to SNES ROM address.

unsigned int Pointer - PC file offset to convert.
unsigned int ROMType - One of the following values:
    LC_LOROM   : For LoROM games up to 32 Mbit ROM sizes.
    LC_LOROM_2 : Always uses 80:8000 map.
    LC_HIROM   : For HiROM games up to 32 Mbit ROM sizes.
    LC_HIROM_2 : Always uses 40:0000 map.
    LC_EXLOROM : For LoROM games above 32 Mbit.
    LC_EXHIROM : For HiROM games above 32 Mbit.
unsigned int Header  - LC_NOHEADER or LC_HEADER (0x200 bytes).
     The header is assumed to be included in the pointer value.

Note that LC_LOROM uses the 00:8000 memory map whenever possible, and
uses the 80:8000 map for offsets >= 0x38000.  If you want to always get
addresses from the 80:8000 map, use LC_LOROM_2.

LC_HIROM_2 uses the 40:0000 map up to 70:0000, then uses the C0:0000 map.

So the ROM type you should use based on the ROM size is:

LC_LOROM   : 00-32 Mbit ROMs (0-4 MB)
LC_LOROM_2 : 00-32 Mbit ROMs (0-4 MB)
LC_HIROM   : 00-32 Mbit ROMs (0-4 MB)
LC_HIROM_2 : 00-32 Mbit ROMs (0-4 MB)
LC_EXLOROM : 33-64 Mbit ROMs (4.x-8 MB)
LC_EXHIROM : 33-64 Mbit ROMs (4.x-8 MB)

Do NOT specify an ExROM type if your ROM is not larger than 32 Mbit!

A warning on 64 Mbit ROMs:  Since banks 7E and 7F are used for RAM instead
of ROM, the SNES cannot access the last 64 KB of a 64 Mbit ExLoROM file
or 64 KB from the second and fourth last 32K chunks in a 64 Mbit ExHiROM file.
Thus you should not store anything past $7F:01FF PC in an ExLoROM file with
a copier header, or in the ranges $7E:0200-7E:81FF and $7F:0200-7F:81FF PC 
in an ExHiROM file with a copier header.

Also note that for 64 Mbit ExHiROM files, the area from 0000-7FFF of banks
$70 - $77 is usually used by SRAM, so the corresponding areas in the ROM 
are not accessible.

Returns the SNES ROM address of the PC file offset.
It will return an undefined value for non-ROM addresses.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC8)(unsigned int Pointer, unsigned int ROMType, unsigned int Header);
extern LCPROC8 LunarPCtoSNES;
//extern "C" unsigned int WINAPI _export LunarPCtoSNES(unsigned int Pointer, unsigned int ROMType, unsigned int Header)




/**************************************************************************

Decompress data from the currently open file into an array.

void* Destination             - destination byte array for decompressed data.
unsigned int AddressToStart   - file offset to start at.
unsigned int MaxDataSize      - maximum number of bytes to copy into dest.
unsigned int Format           - compression format (see table below).
unsigned int Format2          - must be zero unless otherwise stated.
unsigned int* LastROMPosition - an optional pointer that the function will
   use to store the file offset of the next byte that comes after the 
   compressed data.  This could be used to calculate the size of the
   compressed data after calling the function, using the simple formula 
   LastROMPosition-AddressToStart.  You can pass NULL if you don't need
   this value.

Returns the size of the decompressed data.  A value of zero indicates either
failure or a decompressed structure of size 0.

If the size of the decompressed data is greater than MaxDataSize, the data 
will be truncated to fit into the array.  Note however that the size value 
returned by the function will not be the truncated size.  

If Destination=NULL and/or MaxDataSize=0, no data will be copied to the
array but the function will still decompress the data so it can return the 
size and store the LastROMPosition.

In general, a max limit of 0x10000 bytes is supported for the uncompressed
data, which is the size of a HiROM SNES bank.  A few formats may have lower 
limits depending on their design.


                         Compression Format Table
___________________________________________________________________________

 Format    Game & Usage    Description
___________________________________________________________________________

 LC_LZ1    Zelda3 [G]      You can use Format2=1 to auto-convert 3bpp to 
           SMWj [G]        4bpp graphics.
 LC_LZ2    SMW [G]         Almost identical to LZ1.  You can use Format2=1 
           SMW2 [G]        to auto-convert 3bpp to 4bpp graphics.
           Zelda3 [D]      
 LC_LZ3    Pokemon Gold &  A fairly enhanced form of LZ2.  Implemented 
           Silver (GB) [G] as documented by Necrosaro.
 LC_LZ4    MarioRPG [GD]   Not related to the other formats.          
 LC_LZ5    Metroid3 [GD]   A slightly enhanced form of LZ2.
           MarioKart [GD]  
           SimCity [GD]    
 LC_LZ6    SM (GB) [G]     A format used by Angel for a few Sailor Moon 
           SMR (GB) [G]    GameBoy games.
 LC_LZ7    SoM [GD]        A Squaresoft format for the title screen.
 LC_LZ8    MarioRPG [G]    A minor format used for storing the graphics 
                           in the credits sequence at the end of the game.
 LC_LZ9    Lufia1 [G]      Used for graphics.
           Lufia2 [G]      
 LC_LZ10   RoboTrek [G]    An Enix format that uses a bit stream.
 LC_LZ11   HarvestMoon [G] Just another format.
 LC_LZ12   Gradius3 [G]    Used for a few graphics.
 LC_LZ13   Chrono Trigger  Another Squaresoft format, used to store
           [GD]            quite a few things in CT.
 LC_LZ14   Famicom Tantei/ A Nintendo format that has more in common with
           Detective Club  CT's format than Nintendo's usual variants.
           2 [GD]          
 LC_LZ15   Star Fox [GD]   A format decompressed by the SFX chip.  Beware,
           Star Fox 2 [GD] the format is stored and read backwards!  Thus, 
                           the address to start at should be the next byte
                           past the END of the data structure!  If the 
                           starting address is set to 0, LC will use the 
                           file size as the address to start at.
                           LastROMPosition is set to a fake value so 
                           existing apps can use the standard formula to
                           get the compressed size.  If using sniff.exe,
                           set that program's "Don't exclude matched areas"
                           flag as sniff excludes areas going forwards.
 LC_LZ16   SMW2/YI [G]     A format decompressed by the SFX chip.  You must
                           set Format2 to the number of 8x8 tile rows that
                           you want... setting it higher than the number of
                           actual rows in the compressed structure may
                           cause decompression to fail.
 LC_LZ17   Sailor Moon     A format used by Angel for the Sailor Moon RPG
           Another Story   game.
           RPG [GD]        
 LC_LZ18   Sailor Moon R   A format used by Bandai for the Sailor Moon R
           [GD]            side-scroller fighting game.
 LC_RLE1   SMW [D]         Used in backgrounds.
 LC_RLE2   SMW [D]         Used in overworld.  Nearly dentical to RLE1, 
                           but uses a fixed size of MaxDataSize instead of 
                           a "FF FF" termination code.
 LC_RLE3   Mega Man X [G]  Not really RLE, but whatever.  You must specify 
                           the exact size of the decompressed data in 
                           advance with MaxDataSize.  If format2 is not 
                           zero, it will be used as the size instead.
 LC_RLE4   Radical         A format used for the title screen.  Must specify 
           Dreamers [G]    the exact size of the decompressed data in 
                           advance with MaxDataSize.  If format2 is not 
                           zero, it will be used as the size instead.

___________________________________________________________________________

 [G] = Graphics
 [D] = Data

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC9)(void* Destination,unsigned int AddressToStart,unsigned int MaxDataSize, unsigned int Format, unsigned int Format2, unsigned int* LastROMPosition);
extern LCPROC9 LunarDecompress;
//extern "C" unsigned int WINAPI _export LunarDecompress(void* Destination,unsigned int AddressToStart,unsigned int MaxDataSize, unsigned int Format, unsigned int Format2, unsigned int* LastROMPosition)




/**************************************************************************

Compress data from a byte array and place it into another array. 

void* Source               - source byte array of data to compress.
void* Destination          - destination byte array for compressed data.
unsigned int DataSize      - size of the data to compress in bytes.
unsigned int MaxDataSize   - maximum number of bytes to copy into dest.
unsigned int Format        - compression format (see LunarDecompress() table)
unsigned int Format2       - must be zero unless otherwise stated.

Returns the size of the compressed data.  A value of zero indicates
failure.

The Source and Destination variables can point to the same array.

If the size of the compressed data is greater than MaxDataSize, the data 
will be truncated to fit into the array.  Note however that the size value 
returned by the function will not be the truncated size.  

In general, a max limit of 0x10000 bytes is supported for the uncompressed
data, which is the size of a HiROM SNES bank.  A few formats may have lower 
limits depending on their design.

If Destination=NULL and/or MaxDataSize=0, no data will be copied to the
array but the function will still compress the data so it can return the
size of it.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC10)(void* Source, void* Destination,unsigned int DataSize, unsigned int MaxDataSize, unsigned int Format, unsigned int Format2);
extern LCPROC10 LunarRecompress;
//extern "C" unsigned int WINAPI _export LunarRecompress(void* Source, void* Destination,unsigned int DataSize, unsigned int MaxDataSize, unsigned int Format, unsigned int Format2)




/**************************************************************************

Erases an area in a file/ROM by overwriting it with 0's.  The 0 byte used 
to erase the area can be changed with the LunarSetFreeBytes() function.

unsigned int Address - file offset to start at.
unsigned int Size    - number of bytes to zero out.

Returns true on success, false on fail.
This function will not prevent you from erasing past the end of the file,
which will expand the file size.

**************************************************************************/

typedef BOOL (WINAPI *LCPROC11)(unsigned int Address,unsigned int Size);
extern LCPROC11 LunarEraseArea;
//extern "C" BOOL WINAPI _export LunarEraseArea(unsigned int Address,unsigned int Size)




/**************************************************************************

Expands a SNES ROM by appending 0's to the end of the file, and fixes the
size byte (if possible).  The function supports SNES ROMs with or without 
a 0x200 byte header (auto-detects), and supports up to 64 Mbit expansion.
The 0 byte used for expansion can be changed with the LunarSetFreeBytes() 
function.

unsigned int Mbits - MegaBits to expand the ROM to (0-32).
                     For sizes above 32 Mbit, use one of the predefined
                     values (see below).
   Some of the more common Mbit sizes are:
   8  : 1 meg file
   16 : 2 meg file
   24 : 3 meg file
   32 : 4 meg file
   LC_48_EXHIROM   : Standard expansion.
   LC_48_EXHIROM_1 : Higher compatibility, but uses up to 1 meg of the new
                     space.  Do not use this unless the ROM doesn't load or
                     has problems with the other options.
   LC_64_EXHIROM   : Standard expansion.
   LC_64_EXHIROM_1 : Higher compatibility, but uses up to 2 meg of the new
                     space.  Do not use this unless the ROM doesn't load or
                     has problems with the other options.
   LC_48_EXLOROM_1 : For LoROMs that use the 00:8000-6F:FFFF
   LC_48_EXLOROM_2 : For LoROMs that use the 80:8000-FF:FFFF map.
   LC_48_EXLOROM_3 : Higher compatibility, but uses up most of the new space.
                     Do not use this unless the ROM doesn't load or has
                     problems with the other options.
   LC_64_EXLOROM_1 : For LoROMs that use the 00:8000-6F:FFFF
   LC_64_EXLOROM_2 : For LoROMs that use the 80:8000-FF:FFFF map.
   LC_64_EXLOROM_3 : Higher compatibility, but uses up most of the new space.
                     Do not use this unless the ROM doesn't load or has
                     problems with the other options.

Be warned that the EXLOROM_1 type expansions will physically move the ROM's
original data banks to PC offset 40:0000, which may cause problems if your
code is set up to use hard coded PC file offsets.  Also note that not all
ROMs can be expanded to sizes above 32 Mbits -- check the documentation of 
the Lunar Expand utility for more details (you can get it from FuSoYa's
site).

If your emulator can play ToP, it supports 48 Mbit ExHiROM games.  For
64 Mbit HiROM and 32 & 64 MBit LoROM games, you must use Snes9x 1.39a 
(or 1.39mk3) or higher (zsnes does not yet support these).

Returns size of ROM in Mbits on success, 0 on fail.  If the current size
of the ROM is greater than or equal to the Mbits requested, the function
will simply return the current Mbits of the ROM.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC12)(unsigned int Mbits);
extern LCPROC12 LunarExpandROM;
//extern "C" unsigned int WINAPI _export LunarExpandROM(unsigned int Mbits)




/**************************************************************************

Verifies free space in the ROM available for inserting data (free space is
defined as an area filled with 0's).  The function supports SNES ROMs with 
or without a 0x200 byte header (auto-detects).  The 0 byte used to check 
for free space can be changed with the LunarSetFreeBytes() function.

unsigned int AddressStart - file offset to start searching for space.
unsigned int AddressEnd   - file offset to stop searching (exclusive).
unsigned int Size         - amount of free space you want to find, in bytes.
unsigned int BankType     - indicates if you want to avoid results that
   span SNES bank boundaries.
   LC_NOBANK    : Ignore bank boundaries and header.
   LC_LOROM     : LoROM
   LC_HIROM     : HiROM
   LC_EXHIROM   : Same as LC_HIROM
   LC_HIROM_2   : Same as LC_HIROM
   LC_EXLOROM   : Same as LC_LOROM
   LC_LOROM_2   : Same as LC_LOROM
   LC_EXROM     : Same as LC_HIROM (depreciated)

Returns the file offset of the first valid location in the specified range
that matches the size of the free space requested.  A value of zero indicates
failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC13)(unsigned int AddressStart, unsigned int AddressEnd, unsigned int Size,unsigned int BankType);
extern LCPROC13 LunarVerifyFreeSpace;
//extern "C" unsigned int WINAPI _export LunarVerifyFreeSpace(unsigned int AddressStart, unsigned int AddressEnd, unsigned int Size,unsigned int BankType)




/**************************************************************************

Creates an IPS patch file by measuring differences between two other files.
This is based off the code in the LunarIPS (LIPS) utility on FuSoYa's site.
The function ignores any use of the LunarOpenRAMFile() function.

---From the LIPS readme.txt file---
 As far as features go, LIPS has:

 -IPS patch creation/application support.
 -full RLE encoding/decoding support.
 -file expanding/truncating support.
 -the IPS encoder creates files that are the same size or smaller
  than files created with SNESTool.
 -the IPS encoder avoids the rare "0x454F46 (EOF) offset bug" that
  SNESTool's IPS encoder has.
 -logging feature for applying IPS patches (ROMFileName.log).
 -support for patches on files up to 16 MB in size, which is the limit
  of the IPS format.  The files can technically be larger than that,
  but the IPS format cannot record changes beyond the 16 MB mark due
  to 24-bit addressing.  The IPS file itself can be any size.
-----------------------------------

HWND hwnd           - handle to window (optional).  This is used only
                      to prevent user input in the window if a dialog
                      box is displayed by the function.  You can set
                      this to NULL if you want.
char* IPSFileName   - file name and path of the IPS file to create
                      (optional).  If you set this to NULL, the function
                      will prompt the user for a file name.
char* ROMFileName   - file name and path of UNMODIFIED ROM to use
                      (optional).  If you set this to NULL, the function
                      will prompt the user for a file name.
char* ROM2FileName  - file name and path of MODIFIED ROM to use
                      (optional).  If you set this to NULL, the function
                      will prompt the user for a file name.
unsigned int Flags  - optional flags.  This can be any combination of:
   LC_IPSQUIET  : Suppress all message boxes other than file name prompts.
	LC_IPSFORCEFILE_SAVEAS : Force bringing up the file "save as" dialog
                            even if a file name was provided.

Returns non-zero on sucess, 0 on failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC24)(HWND hwnd, char* IPSFileName, char* ROMFileName, char* ROM2FileName, unsigned int Flags);
extern LCPROC24 LunarIPSCreate;
//extern "C" unsigned int WINAPI _export LunarIPSCreate(HWND hwnd, char* IPSFileName, char* ROMFileName, char* ROM2FileName, unsigned int Flags);



/**************************************************************************

Apply an IPS patch file to another file.
This is based off the code in the LunarIPS (LIPS) utility on FuSoYa's site.
The function ignores any use of the LunarOpenRAMFile() function.

HWND hwnd           - handle to window (optional).  This is used only
                      to prevent user input in the window if a dialog
                      box is displayed by the function.  You can set
                      this to NULL if you want.
char* IPSFileName   - file name and path of the IPS file to use
                      (optional).  If you set this to NULL, the function
                      will prompt the user for a file name.
char* ROMFileName   - file name and path of ROM to apply patch to
                      (optional).  If you set this to NULL, the function
                      will prompt the user for a file name.
unsigned int Flags  - optional flags.  This can be any combination of:
   LC_IPSLOG    : Create a log file of the patch.
   LC_IPSQUIET  : Suppress all message boxes other than file name prompts.
   LC_IPSEXTRA_WARNINGS : Also display warnings for unusual but not fatal
                          issues.

Returns non-zero on sucess, 0 on failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC25)(HWND hwnd, char* IPSFileName, char* ROMFileName, unsigned int Flags);
extern LCPROC25 LunarIPSApply;
//extern "C" unsigned int WINAPI _export LunarIPSApply(HWND hwnd, char* IPSFileName, char* ROMFileName, unsigned int Flags);



/**************************************************************************

Converts standard 8x8 SNES tiles into an indexed pixel map, useful for
drawing to a bitmap when combined with a palette (see the LunarRender8x8
function).

Each 8x8 tile is converted into an array of 64 bytes.  Each byte represents 
the color number of a single pixel.  1bpp tiles use color numbers from 0-1, 
2bpp is 0-3, 3bpp is 0-7, 4bpp is 0-15, etc.  The bytes are in line order by 
tile (the first 8 bytes are for the 8 pixels on the top line of the first 
8x8 tile, the next 8 bytes are for the 8 pixels on the second line of the 
same 8x8 tile, and so on until you get to the next tile).

In other words, the format is basically like having a 256 color bitmap 
with a width of 8 and a height of 8*NumTiles, except there is no palette
included.

void* Source               - byte array of SNES source graphics.
void* Destination          - byte array of destination graphics.
unsigned int NumTiles      - number of 8x8 tiles to convert.
unsigned int GFXType       - format of SNES graphics:
   LC_1BPP : 1bpp (0-1)
   LC_2BPP : 2bpp (0-3)
   LC_3BPP : 3bpp (0-7)
   LC_4BPP : 4bpp (0-15)
   LC_5BPP : 5bpp (0-31)
   LC_6BPP : 6bpp (0-63)
   LC_7BPP : 7bpp (0-127)
   LC_8BPP : 8bpp (0-255)

Returns true on success, false on fail.
The destination array size must be at least NumTiles*64 bytes.
The Source and Destination variables must NOT point to the same array.

**************************************************************************/

typedef BOOL (WINAPI *LCPROC14)(void* Source, void* Destination, unsigned int NumTiles, unsigned int GFXType);
extern LCPROC14 LunarCreatePixelMap;
//extern "C" BOOL WINAPI _export LunarCreatePixelMap(void* Source, void* Destination, unsigned int NumTiles, unsigned int GFXType)




/**************************************************************************

Converts an indexed pixel map (such as one created with LunarCreatePixelMap)
into standard 8x8 SNES bpp tiles.

The function ignores extra bits that go beyond the specified bpp format.
For example, if the desired format is 4bpp and a byte has a value of 17
(0x11), it will be interpreted as 1.

void* Source               - byte array of source graphics.
void* Destination          - byte array of SNES destination graphics.
unsigned int NumTiles      - number of 8x8 tiles to convert.
unsigned int GFXType       - format of SNES graphics:
   LC_1BPP : 1bpp (0-1)
   LC_2BPP : 2bpp (0-3)
   LC_3BPP : 3bpp (0-7)
   LC_4BPP : 4bpp (0-15)
   LC_5BPP : 5bpp (0-31)
   LC_6BPP : 6bpp (0-63)
   LC_7BPP : 7bpp (0-127)
   LC_8BPP : 8bpp (0-255)

Returns true on success, false on fail.
The destination array size must be at least NumTiles*8*bpp bytes.
The Source and Destination variables must NOT point to the same array.

**************************************************************************/

typedef BOOL (WINAPI *LCPROC15)(unsigned char* Source, unsigned char* Destination, unsigned int NumTiles, unsigned int GFXType);
extern LCPROC15 LunarCreateBppMap;
//extern "C" BOOL WINAPI _export LunarCreateBppMap(unsigned char* Source, unsigned char* Destination, unsigned int NumTiles, unsigned int GFXType)




/**************************************************************************

Converts a standard SNES 15-bit color into a PC 24-bit color.

unsigned int SNESColor - SNES RGB value.
                         (???????? ???????? ?bbbbbgg gggrrrrr)

Returns PC color value. (00000000 rrrrr000 ggggg000 bbbbb000)

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC16)(unsigned int SNESColor);
extern LCPROC16 LunarSNEStoPCRGB;
//extern "C" unsigned int WINAPI _export LunarSNEStoPCRGB(unsigned int SNESColor)




/**************************************************************************

Converts a standard PC 24-bit color into the nearest SNES 15-bit color, by
rounding each color component to the nearest 5-bit value.

unsigned int PCColor - PC RGB value. 
                       (???????? rrrrrrrr gggggggg bbbbbbbb)

Returns SNES color value. (00000000 00000000 0bbbbbgg gggrrrrr)

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC17)(unsigned int PCColor);
extern LCPROC17 LunarPCtoSNESRGB;
//extern "C" unsigned int WINAPI _export LunarPCtoSNESRGB(unsigned int PCColor)




/**************************************************************************

Draws an SNES tile to a PC bitmap, with optional effects.  Both the sprite
and BG tile data types are supported.

unsigned int* TheMapBits - pointer to 32-bit Device Independent Bitmap 
   (DIB) data.  Note that this is a pointer to the bitmap BITS, and not a 
   handle to a windows bitmap OBJECT.  In other words, it's essentially a 
   pointer to an array of 32-bit ints.  Look up CreateDIBSection() in the 
   Win32 API documentation for information on how to obtain such a pointer 
   when creating a bitmap object.
int TheWidth   - width of the bitmap you're drawing to.
int TheHeight  - height of the bitmap you're drawing to.
int DisplayAtX - x position in the bitmap to render the tile to.
int DisplayAtY - y position in the bitmap to render the tile to.
void* PixelMap - pointer to a pixel map of SNES tiles.  The byte array
   should have at least 0x400 8x8 tiles (0x400*64=0x10000 bytes) for BG 
   tiles, or 0x200 8x8 tiles (0x200*64=0x8000 bytes) for sprite tiles.  
   Look up the LunarCreatePixelMap function for information on the pixel 
   map data used by this function.
unsigned int* PCPalette - pointer to an array of 32-bit ints containing the 
   PC colors to use to render the tile.  The array should contain at least
   16 palettes of 16 colors each (16*16*4=0x400 bytes).
   Look up the LunarSNEStoPCRGB() function for information on how to convert
   SNES colors to PC colors.
unsigned int Map8Tile - SNES data that defines the tile number and flags 
   used to render the tile.  The format of this data is as follows:

   yxlppptt tttttttt (2 bytes only--upper 16 bits of 32-bit int are ignored)

   tt tttttttt = 8x8 tile number
   ppp = palette number
   l = layer priority flag (1=enable)
   x = flip x flag (1=enable)
   y = flip y flag (1=enable)

   However, if LC_SPRITE is specified for "Extra", the format becomes:

   yxllpppt tttttttt (2 bytes only--upper 16 bits of 32-bit int are ignored)

   t tttttttt = 8x8 tile number
   ppp = palette number
   ll = layer priority
   x = flip x flag (1=enable)
   y = flip y flag (1=enable)

unsigned int Extra - special flags for rendering, which can be a
  combination of:
 LC_INVERT_TRANSPARENT  Invert the transparent area of the tile
 LC_INVERT_OPAQUE       Invert the non-transparent area of the tile
 LC_INVERT              Invert the tile colors (combo of 2 above flags)
 LC_RED_TRANSPARENT     Highlight the transparent area of the tile red
 LC_RED_OPAQUE          Highlight the non-transparent area of the tile red
 LC_RED                 Highlight the tile red (combo of 2 above flags)
 LC_GREEN_TRANSPARENT   Highlight the transparent area of the tile green
 LC_GREEN_OPAQUE        Highlight the non-transparent area of the tile green
 LC_GREEN               Highlight the tile green (combo of 2 above flags)
 LC_BLUE_TRANSPARENT    Highlight the transparent area of the tile blue
 LC_BLUE_OPAQUE         Highlight the non-transparent area of the tile blue
 LC_BLUE                Highlight the tile blue (combo of 2 above flags)
 LC_TRANSLUCENT         Make the tile translucent
 LC_HALF_COLOR          Half-color mode
 LC_SCREEN_ADD          SNES sub-screen addition mode (sort of...)
 LC_SCREEN_SUB          SNES sub-screen subtraction mode (kind of...)
 LC_PRIORITY_0          Draw tile only if Priority==0
 LC_PRIORITY_1          Draw tile only if Priority==1
 LC_PRIORITY_2          Draw tile only if Priority==2  (LC_SPRITE only)
 LC_PRIORITY_3          Draw tile only if Priority==3  (LC_SPRITE only)
 LC_DRAW                Draw the tile (combo of above 4 flags)
 LC_OPAQUE              Draw transparent area of tile opaque
 LC_SPRITE              Uses sprite format for Map8Tile, adds 8 to palette #
 LC_SPRITE_TRANSLUCENT  Make tile translucent only if palette>=12
 LC_2BPP_GFX            Draw tile using 2bpp mode (default is 4bpp)
 LC_TILE_16             Draw 16x16 tile (default is 8x8)
 LC_TILE_32             Draw 32x32 tile (valid for LC_SPRITE only)
 LC_TILE_64             Draw 64x64 tile (valid for LC_SPRITE only)

   Notes: To simply display the tile regardless of priority, use LC_DRAW.
          Combining LC_SCREEN_ADD and LC_SCREEN_SUB is invalid.
          Combining LC_TILE_16, LC_TILE_32, and/or LC_TILE_64 is invalid.
          Combining LC_RED, LC_GREEN, and LC_BLUE creates a pure white tile.
          If LC_OPAQUE is used, the transparent area of the tile is treated as
            opaque in regards to the other flags.  It will use color 0 of the
            palette selected by the tile to draw the transparent area opaque.          
          The LC_2BPP_GFX option simply changes how the palette numbers are
           interpreted.  Normally the SNES 256 color table is split into 16 
           palettes of 16 colors each.  But with 2bpp, the first 4 colors 
           in the table are used as palette 0, then the next 4 colors in 
           the table are palette 1, etc.
          The function does not care about the original format that the pixel
           map data was created from, and thus will not restrict bytes in
           the array from accessing any color in (or beyond!) the palette
           data.  So if you set a byte in a tile of the pixel map array to 
           128 and draw it with the Map8 palette number set to 2, it will
           show color 128+16*2=160 (unless LC_2BPP_GFX is used, then it 
           would be 128+4*2=136).

You may draw the tile using any coordinates, even if a portion of the tile 
lies outside the bitmap dimensions.  This means it's not necessary to have 
bitmap dimensions that are a multiple of 8.  Negative coordinates are 
allowed.

The function returns true on success, false on fail.  If the entire tile 
is outside the bitmap dimensions, the function will return false.  The
function will also return false if the tile does not match the requested
layer priority setting(s).

LC_SCREEN_ADD and LC_SCREEN_SUB may be useful for simulating SNES screen
addition/subtraction in a few cases, but since you don't actually have a 
sub-screen to work with, it's not all that great if you're trying to do
the real thing.  

**************************************************************************/


typedef BOOL (WINAPI *LCPROC18)(unsigned int* TheMapBits, int TheWidth, int TheHeight, int DisplayAtX, int DisplayAtY, void* PixelMap, unsigned int* PCPalette, unsigned int Map8Tile, unsigned int Extra);
extern LCPROC18 LunarRender8x8;
//extern "C" BOOL WINAPI _export LunarRender8x8(unsigned int* TheMapBits, int TheWidth, int TheHeight, int DisplayAtX, int DisplayAtY, unsigned char* PixelMap, unsigned int* PCPalette, unsigned int Map8Tile, unsigned int Extra)








/**************************************************************************

This next section deals with the RAT functions, which were implemented in
Lunar Magic 1.33+ as an improved method of verifying free space and storing
data compared to using a LunarVerifyFreeSpace() type of function.

RATS stands for ROM Allocation Tag System.  When you use a RAT function to
store a segment of data to the ROM, it has a tag prepended to it which 
indicates the size of the data stored after it.  This makes scanning for 
free space much safer, as the RAT functions will automatically scan and 
skip over the areas defined by the tags.  Erasing the data also becomes 
safer, as the RAT functions can simply examine the tag to find out how 
large the section of data is before deleting it.


***Implementation***
You don't really need to read this next section to use the functions, but 
it still might be nice to know.


The format of a RAT tag is as follows:

S T A R ssssssss SSSSSSSS cccccccc CCCCCCCC (8 bytes)

"STAR"             Tag identifier, which is the word "RATS" reversed in
                   all-caps.
SSSSSSSS ssssssss  Size-1 of data, 16 bit, little endian.  It does not 
                   include the size of the RAT tag itself.
CCCCCCCC cccccccc  Inverse of size-1, 16 bit, little endian.

Min/Max size allowed: 1-0x10000


When LC is searching for free space, it still checks for consecutive zeros 
but also checks for RATs.  When LC comes across the tag identifier, it 
first ensures that the size and inverse fields will give 0xFFFF when XORed. 
If they don't, the tag is considered invalid and is ignored.  If they do, 
LC automatically jumps over the area protected by the tag and continues 
scanning.

When LC tries to erase the data requested, it first checks for a RAT.  If 
it exists (and if the size and inverse fields check out), it will erase 
the tag, then erase the data based on the size that the tag contained.  
If the tag doesn't exist, then LC will optionally attempt to determine 
the size by decompressing the data using the specified format.  If that 
doesn't work, it will use the size value provided by the user to erase the 
data.  But if the size value is 0, then it will simply return 0 without 
trying to erase anything (this is useful if you have some segments of 
data that are protected by RATs and some that aren't, so you know when 
you have to use your own code to determine the size of the data).

Nested RATs are not allowed.  If LC detects that the area for a data 
segment that you're trying to erase overlaps an area allocated by a RAT, 
it will not erase the data in the overlapped area.  This is to ensure
that the other RAT data segments are protected from accidental erasure.
Also, the data you're trying to store is scanned for RATs, which are
removed if found.

If you want to use a byte other than 0 to scan for free space, use the
LunarSetFreeBytes() function to set up to two bytes to represent free
space.  You can also use this function to set the byte to use for erasing
areas and ROM expansion.

**************************************************************************/






/**************************************************************************

Scans the ROM in the user-defined range for free space to store the user
supplied data of the given size, and prepends a RAT to it.

void* TheData        - pointer to data to store.  If this is set to NULL,
                       the function will still search for the requested
                       space but it will be up to you to store the data 
                       at the returned address (the RAT is still written 
                       automatically unless you turn it off).
unsigned int Size    - size of the data to store, in bytes.  This must
                       not exceed the bank size of the ROM type you've
                       selected (if any).
unsigned int PreferredAddress - Address that you'd like the function to
                       start scanning at first.  If you don't care, set
                       it to 0 and the function will start at MinRange.
                       If the value is not between MinRange and MaxRange,
                       the function will start at MinRange.
unsigned int MinRange- min address to scan and store data at.
unsigned int MaxRange- max address to scan and store data at (exclusive).
unsigned int Flags   - Flags to specify additional functionality.


The flag values available are:

 RATF_LOROM       Avoid storing the data at positions that cross LoROM
                  bank boundaries.
 RATF_HIROM       Avoid storing the data at positions that cross HiROM
                  bank boundaries.
 RATF_EXLOROM     NOT quite the same as LoROM... also avoids writing
                  above 7F:0000.
 RATF_EXHIROM     NOT quite the same as HiROM... also avoids the 0-7FFF
                  area of banks $70-$77 (SRAM), or writing above 7E:0000.
 RATF_EXLOROM_RANGE Can still store data across bank boundaries, but 
                    avoids inaccessible EXLOROM areas.
 RATF_EXHIROM_RANGE Can still store data across bank boundaries, but 
                    avoids inaccessible EXHIROM areas.
 RATF_NOWRITERAT  Don't write a RAT for the data.
 RATF_NOWRITEDATA Don't write the supplied data (same effect as setting
                  TheData to NULL).  The RAT is still written unless 
                  turned off.  Returns address where data should be
                  stored.
 RATF_NOWRITE     Simulated write, is almost like using RATF_NOWRITEDATA
                  with RATF_NOWRITERAT, but unlike NOWRITERAT it looks
                  for enough space for the RAT as well.
 RATF_NOSCANDATA  Don't scan the supplied data and remove embedded RATs
                  within it (done by setting the bytes to 0).  Data is
                  not scanned if TheData is NULL.
 RATF_EXPANDROM   If there's no room left to save in the requested area,
                  this will cause the DLL to expand the ROM with 
                  LunarExpandROM() and store the data in the expanded
                  space.  The ROM will be expanded to 1,2,3, or 4 MB.

Note that the function auto-detects the SNES 0x200 byte ROM header.  
If you do not specify a bank type, bank boundaries are ignored.  
Specifying more than 1 bank type is invalid.

If you specify a size of 0, the function will automatically use a size
of 1 instead.

Returns the address where TheData was written.  It returns 0 on failure.
Remember that this is the address for YOUR data, not the RAT!

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC19)(void* TheData, unsigned int Size, unsigned int PreferredAddress, unsigned int MinRange, unsigned int MaxRange, unsigned int Flags);
extern LCPROC19 LunarWriteRatArea;
//extern "C" unsigned int WINAPI _export LunarWriteRatArea(void* TheData, unsigned int Size, unsigned int PreferredAddress, unsigned int MinRange, unsigned int MaxRange, unsigned int Flags)



/**************************************************************************

Erases the data as the specified location using the size specified by the
data's RAT (if it exists), or optionally decompress the data to get the
size, or use the supplied size as a last resort.  The function also erases 
the RAT for the data (if it exists).

unsigned int Address - address of the data to erase.  This is the address
                       of the data, not the RAT (if it exists)!
unsigned int Size    - default size to use for the data to erase, in bytes.
                       This is only used if there is no RAT for the data 
                       and the optional decompression fails.  If you don't
                       want the function to erase anything in this case,
                       set the value to 0.
unsigned int Flags   - Flags to specify additional functionality.


The flag values available are:

 RATF_COMPRESSED  Specifies that if the data has no RAT, the function
                  can attempt to get the size by decompressing the data 
                  using LunarDecompress().  If you use this flag, you
                  must also specify the format to use (LC_LZ1, etc).
                  Do not attempt to use a format that requires knowing 
                  the size of the decompressed data in advance, such as
                  LC_RLE3.
 *FORMAT FLAGS*   To be used with RATF_COMPRESSED.  See LunarDecompress()
                  for the actual compression format flags supported.
 RATF_NOERASERAT  Don't erase the RAT for the data (if it exists).
 RATF_NOERASEDATA Don't erase the data.  The RAT is still erased unless
                  turned off.  Will still return size of data.


Returns the size of the data erased, not including the RAT (if it exists).
It returns 0 on failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC20)(unsigned int Address,unsigned int Size,unsigned int Flags);
extern LCPROC20 LunarEraseRatArea;
//extern "C" unsigned int WINAPI _export LunarEraseRatArea(unsigned int Address,unsigned int Size,unsigned int Flags)



/**************************************************************************

Determines the size of a segment of data defined by a RAT.  This may be
useful in some cases if you want to know the size without actually erasing
anything, but otherwise it's not necessary.

unsigned int Address - address of the data to find the size of.  This is 
                       the address of the data, not the RAT (if it exists)!
unsigned int Flags   - Flags to specify additional functionality.


The flag values available are:

 RATF_COMPRESSED  See LunarEraseRatArea().
 *FORMAT FLAGS*   To be used with RATF_COMPRESSED.  See LunarDecompress()


Returns the size of the data, not including the RAT (if it exists).
It returns 0 on failure.

**************************************************************************/

typedef unsigned int (WINAPI *LCPROC21)(unsigned int Address, unsigned int Flags);
extern LCPROC21 LunarGetRatAreaSize;
//extern "C" unsigned int WINAPI _export LunarGetRatAreaSize(unsigned int Address, unsigned int Flags)




#endif

