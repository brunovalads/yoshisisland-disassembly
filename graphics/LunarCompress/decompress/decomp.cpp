#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys\stat.h>
#include <windows.h>
#include "../DLLcode/LunarDLL.h"


FILE  *TheFile;

unsigned int ROMPosition;

unsigned char buffer[0x10000];

char* FileToDecompress;
char* DecompressedFile;

unsigned int size;
unsigned int LastROMPosition;
unsigned int Format;
unsigned int Format2;


unsigned int Decompress(int argc, char*argv[])  {

   //handle the command line stuff
   if ((argc<6)||(argc>6))
   {
      printf("To use this program, type:\n decomp.exe FileToDecompress FileToSaveAs OffsetToStart(h) Format Format2\n");
      return 0;
   }

   FileToDecompress=argv[1];
   DecompressedFile=argv[2];
   if (strcmp(FileToDecompress,DecompressedFile)==0)
   {
      printf("File names are identical...bad idea!\n");
      return 0;
   }
   sscanf(argv[3],"%X",&ROMPosition);
   sscanf(argv[4],"%i",&Format);
   sscanf(argv[5],"%i",&Format2);

   printf("Source File        %s\nDestination File   %s\n\n",FileToDecompress,DecompressedFile);

   //access DLL
   if (!LunarLoadDLL())
   {
      printf("Could not load Lunar Compress.dll...\n");
      return 0;
   }

   printf("DLL Version         %2i.%02i\n",LunarVersion()/100,LunarVersion()%100);
   printf("Data Format        %6i\n",Format);
   printf("Data Format 2      %6i\n",Format2);
   printf("Source Offset      %6X\n",ROMPosition);

   if (!LunarOpenFile(FileToDecompress,LC_READONLY))
   {
      printf("Could not open file %s for reading.\n",FileToDecompress);
      LunarUnloadDLL();
      return 0;
   }

   size=LunarDecompress(buffer,ROMPosition,0x10000,Format,Format2,&LastROMPosition);

   //we don't need the DLL anymore
   LunarCloseFile();
   LunarUnloadDLL();

   if (!size)
   {
      printf("\nEither decompression failed, the format isn't supported, or the compressed structure has a size of 0.\n");
      return 0;
   }
   printf("Compressed Size    %6X\nUncompressed Size  %6X\n",LastROMPosition-ROMPosition,size);
   TheFile=fopen(DecompressedFile,"wb");
   if (!TheFile)
   {
      printf("Could not open file %s for writing.\n",DecompressedFile);
      return 0;
   }

   fseek(TheFile,0,0);
   fwrite(buffer,size,1,TheFile);
   fclose(TheFile);

   printf("\nDone!\n");
   return 1;
}


void WaitForTerminate()  {
HANDLE ConsoleInput=GetStdHandle(STD_INPUT_HANDLE);
INPUT_RECORD record;
DWORD number;

   if (ConsoleInput==INVALID_HANDLE_VALUE)
      return;

	//turn off QuickEdit for WinNT so we get mouse click events correctly
	//(no effect on a pre-existing cmd.exe window)
	GetConsoleMode(ConsoleInput, &number);//ENABLE_MOUSE_INPUT |
	SetConsoleMode(ConsoleInput, (number | ENABLE_MOUSE_INPUT | 0x80) & ~0x40);  //enable mouse required for running from .bat files

   //If enter key has already been depressed, exit now.
   //This is to skip the "keep window open" code when
   //not running from a shortcut. Win9x only.
   if (PeekConsoleInput(ConsoleInput,&record,1,&number))
      if (number)
         if (record.EventType==KEY_EVENT)
            if (record.Event.KeyEvent.uChar.AsciiChar==VK_RETURN)
               return;

   printf("\nHit any key or click on the screen to exit.\n");
   while (true)
   {
      ReadConsoleInput(ConsoleInput,&record,1,&number);
      switch (record.EventType)  {
         case KEY_EVENT:  //any key pressed
            return;
         case MOUSE_EVENT: //any mouse button pressed
            if (record.Event.MouseEvent.dwButtonState)
               return;
      }
   }
}


void main(int argc, char *argv[])
{

   SetConsoleTitle("Decompress - Lunar Compress DLL Example");

   printf("Data Decompression Program Example Version 1.03\n");
   printf("Programmed by FuSoYa, Defender of Relm\n");
   printf("FuSoYa's Niche - http://fusoya.eludevisibility.org\n\n");

   Decompress(argc,argv);

   WaitForTerminate();

}

