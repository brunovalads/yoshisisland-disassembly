#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys\stat.h>
#include <windows.h>
#include "../DLLcode/LunarDLL.h"

const unsigned int SniffVersion=113;

FILE  *TheFile=NULL;                          
FILE  *TheSplitFile=NULL;          
FILE  *LogFile=NULL;

unsigned int ROMPosition;
unsigned int ROMEndPosition;
unsigned int StructureNumber=0;           

unsigned char buffer[0x10000];

char* FileToDecompress;
char* DecompressedFile;

unsigned char* ROMData=NULL;

unsigned int size;
unsigned int LastROMPosition;
unsigned int Format;
unsigned int Format2;

unsigned int Flags;


char FileName[MAX_PATH];
char SplitFileName[MAX_PATH];

bool Match;
unsigned int MatchCount;
unsigned int MatchStart;
unsigned int MatchSizeCount;
unsigned int MatchSizeStart;
unsigned int MatchSize;

bool ComboFile=false;
bool SplitFile=false;
bool ExcludeArea=true;
bool LoadIntoRAM=false;
unsigned int TheFilter=0;
unsigned int ComboFilePosition=0;

unsigned int WriteDecompressedFile()  {

   if (ComboFile)
   {
      if (!TheFile)
      {
         sprintf(FileName,"%s ComboFile.bin",FileToDecompress);
         TheFile=fopen(FileName,"wb");
      }
      if (!TheFile)
         return false;
      fwrite(buffer,size,1,TheFile);
      ComboFilePosition+=size;
   }
   if (SplitFile)
   {
      sprintf(SplitFileName,"x%06X.bin",ROMPosition);
      TheSplitFile=fopen(SplitFileName,"wb");
      if (!TheSplitFile)
         return false;
      fseek(TheSplitFile,0,0);
      fwrite(buffer,size,1,TheSplitFile);
      fclose(TheSplitFile);
   }
   return true;
}


unsigned int WriteLogInfo()  {

   StructureNumber++;
   printf("(%i) x%X matched.\n",StructureNumber,ROMPosition);
   fprintf(LogFile,"\r\nCompressed Structure #%i Info...\r\n",StructureNumber);
   fprintf(LogFile,"  Start Address: %X\r\n  End Address: %X\r\n  Compressed Size: %X\r\n  Uncompressed Size: %X\r\n",ROMPosition,LastROMPosition,LastROMPosition-ROMPosition,size);
   if (ComboFile)
      fprintf(LogFile,"  Combo File Address: %X\r\n",ComboFilePosition);
   return 1;
}

unsigned int WriteMatchSummary()  {

   printf("$%X Consecutive Group summary of %X matches.\n",MatchStart,MatchCount);
   fprintf(LogFile,"\r\nCONSECUTIVE GROUP MATCH SUMMARY...\r\n");
   fprintf(LogFile,"  Start Address: %X\r\n  End Address: %X\r\n  Number of matches: %X\r\n",MatchStart,ROMPosition,MatchCount);
   return 1;
}

unsigned int WriteMatchSizeSummary()  {

   printf("$%X Group Size summary of %X matches.\n",MatchSizeStart,MatchSizeCount);
   fprintf(LogFile,"\r\nGROUP SIZE MATCH SUMMARY...\r\n");
   fprintf(LogFile,"  Start Address: %X\r\n  End Address: %X\r\n  Number of matches: %X\r\n",MatchSizeStart,ROMPosition,MatchSizeCount);
   return 1;
}

unsigned int ScanForData()  {
unsigned int sizeC;

   MatchCount=0;
   MatchStart=0;
   MatchSizeCount=0;
   MatchSizeStart=0;
   while (ROMPosition<ROMEndPosition)
   {
      size=LunarDecompress(buffer,ROMPosition,0x10000,Format,Format2,&LastROMPosition);
      sizeC=LastROMPosition-ROMPosition;
      Match=false;
      switch (TheFilter)  {
         case 0x00:  //match most, size must be multiple of 0x10
            if ((!size)||(size&0xF)||(size<0x80)||(sizeC<0x40)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x01:  //match fewer, size must be multiple of 0x10
            if ((!size)||(size&0xF)||(size<0x100)||(sizeC<0x80)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x02:  //match even fewer, size must be multiple of 0x10
            if ((!size)||(size&0xF)||(size<0x200)||(sizeC<0x100)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x03:  //match almost anything, size must be multiple of 0x10
            if ((!size)||(size&0xF))
               break;
            Match=true;
            break;
         case 0x04: //match most, size must be even
            if ((!size)||(size&0x1)||(size<0x80)||(sizeC<0x40)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x05: //match fewer, size must be even
            if ((!size)||(size&0x1)||(size<0x100)||(sizeC<0x80)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x06: //match even fewer, size must be even
            if ((!size)||(size&0x1)||(size<0x200)||(sizeC<0x100)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x07:  //match almost anything, size must be even
            if ((!size)||(size&0xF))
               break;
            Match=true;
            break;
         case 0x08: //match most, but don't care about even or multiples
            if ((!size)||(size<0x80)||(sizeC<0x40)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x09: //match fewer, but don't care about even or multiples
            if ((!size)||(size<0x100)||(sizeC<0x80)||(sizeC>=size))
               break;
            Match=true;
            break;
         case 0x0A: //match even fewer, but don't care about even or multiples
            if ((!size)||(size<0x200)||(sizeC<0x100)||(sizeC>=size))
               break;
            Match=true;
            break;

         case 0x0B:  //match most, size must be multiple of 0x10, size!=0x10000
            if ((!size)||(size&0xF)||(size<0x80)||(sizeC<0x40)||(sizeC>=size)||(size>=0x10000))
               break;
            Match=true;
            break;
         case 0x0C:  //match almost anything, size must be multiple of 0x10, size!=0x10000
            if ((!size)||(size&0xF)||(size>=0x10000))
               break;
            Match=true;
            break;

         case 0x0D: //match most, size must be even, size!=0x10000
            if ((!size)||(size&0x1)||(size<0x80)||(sizeC<0x40)||(sizeC>=size)||(size>=0x10000))
               break;
            Match=true;
            break;
         case 0x0E:  //match almost anything, size must be even, size!=0x10000
            if ((!size)||(size&0xF)||(size>=0x10000))
               break;
            Match=true;
            break;

         case 0x0F:  //match anything  NOT RECOMMENDED EXCEPT FOR SMALL AREAS
            if (!size)
               break;
            Match=true;
            break;

         //If you want to include your own filters, please start at 0x80
         // to avoid conflicting with future versions of the program.

         default:
            printf("Filter %X is not supported.\n",TheFilter);
            fprintf(LogFile,"Filter %X is not supported.\r\n",TheFilter);
            return false;
      }

      if (Match)
      {
         if (!MatchSizeStart)
         {
            MatchSizeStart=ROMPosition;
            MatchSize=size;
         }
         if (size==MatchSize)
            MatchSizeCount++;
         else
         { //clear the size match, write out only if other match isn't true
            if ((MatchSizeCount>=4)&&(MatchCount<MatchSizeCount))
            {
               WriteMatchSizeSummary();
               if (MatchCount<=MatchSizeCount)
               {  //don't need a summary, it already matches the other one
                  MatchStart=0;
                  MatchCount=0;
               }
            }
            MatchSizeStart=0;
            MatchSizeCount=0;
         }
         if (!MatchStart)
            MatchStart=ROMPosition;
         MatchCount++;
         WriteLogInfo();
         WriteDecompressedFile();
         if (ExcludeArea)
            ROMPosition=LastROMPosition; //exclude matched area from further scans
         else
            ROMPosition++; //do not exclude matched area from further scans
      }
      else
      {
         if ((MatchCount>=4)&&(MatchCount>MatchSizeCount))
         {
            WriteMatchSummary();
            if (MatchCount>=MatchSizeCount)
            {  //don't need a summary, it already matches the other one
               MatchSizeStart=0;
               MatchSizeCount=0;
            }
         }
         MatchStart=0;
         MatchCount=0;
         ROMPosition++;
      }
   }

   //at the end of the ROM, so do one last check...

   if ((MatchSizeCount>=4)&&(MatchCount<MatchSizeCount))
      WriteMatchSizeSummary();
   else
   if (MatchCount>=4)
      WriteMatchSummary();

   return true;
}



unsigned int Sniff()  {
unsigned int FileSize;

   //make sure Address to end is not larger than the ROM itself
   FileSize=LunarGetFileSize();
   if (ROMEndPosition>FileSize)
      ROMEndPosition=FileSize;
   if (ROMPosition>=ROMEndPosition)
   {
      printf("Address Start is >= Address End!\n");
      return 0;
   }

   LogFile=fopen("Log.txt","wb");
   if (!LogFile)
   {
      printf("Unable to open Log.txt to write log information!\n");
      return 0;
   }
   fseek(LogFile,0,0);

   printf("Beginning compressed data scanning.\nNote: This could take quite a while...\n\n");

   fprintf(LogFile,"Data Compression Sniff Program Version %i.%02i\r\n",SniffVersion/100,SniffVersion%100);
   fprintf(LogFile,"DLL Interface for Lunar Compress.dll\r\n");
   fprintf(LogFile,"Programmed by FuSoYa, Defender of Relm\r\n");
   fprintf(LogFile,"FuSoYa's Niche - http://fusoya.eludevisibility.org\r\n\r\n");

   fprintf(LogFile,"Lunar Compress DLL Version %i.%02i\r\n\r\n",LunarVersion()/100,LunarVersion()%100);

   fprintf(LogFile,"File to Scan: %s\r\n",FileToDecompress);
   fprintf(LogFile,"Start Address: %X\r\nEnd Address: %X\r\n",ROMPosition,ROMEndPosition);
   fprintf(LogFile,"Flags: %X\r\n Filter: %X\r\n Combo File: %s\r\n Split Files: %s\r\n Exclude Matched Area: %s\r\n Decompress from RAM: %s\r\n",Flags,TheFilter,ComboFile ? "Yes" : "No",SplitFile ? "Yes" : "No",ExcludeArea ? "Yes" : "No", LoadIntoRAM ? "Yes" : "No");
   fprintf(LogFile,"Format 1: %i\r\nFormat 2: %i\r\n\r\n",Format,Format2);

   ScanForData();

   if (ComboFile)
      fclose(TheFile);
   fprintf(LogFile,"\r\nDone!\r\n");
   fclose(LogFile);
   printf("\nDone!\n");
   return 1;
}

unsigned int DoSniff(int argc, char*argv[])  {

   //handle the command line stuff
   if ((argc<7)||(argc>7))
   {
      printf("To use this program, type:\n sniff.exe FileToScan OffsetToStart OffsetToEnd Flags Format Format2\n");
      return false;
   }

   FileToDecompress=argv[1];

   sscanf(argv[2],"%X",&ROMPosition);
   sscanf(argv[3],"%X",&ROMEndPosition);
   sscanf(argv[4],"%X",&Flags);
   sscanf(argv[5],"%i",&Format);
   sscanf(argv[6],"%i",&Format2);

   TheFilter=Flags&0xFF;
   ComboFile=Flags&0x100;
   SplitFile=Flags&0x200;
   ExcludeArea=!(Flags&0x400);  //default is on
   LoadIntoRAM=Flags&0x800;
/*
   //can use this to test program without command line arguements
   FileToDecompress="som.smc";
   ROMPosition=0x200;
   ROMEndPosition=0xFF0000;
   TheFilter=0x00;
   Format=6;
   Format2=0;
   ComboFile=true;
   SplitFile=false;
   ExcludeArea=true;
   LoadIntoRAM=false;
*/
   //access DLL
   if (!LunarLoadDLL())
   {
      printf("Could not load Lunar Compress.dll...\n");
      return false;
   }

   printf("Lunar Compress DLL Version %i.%02i\n\n",LunarVersion()/100,LunarVersion()%100);

   if (LoadIntoRAM)
   {  //We could create our own array here and load the file into it, then
      //pass it to LC... but it's easier to let LC handle it all.
   	ROMData=LunarOpenRAMFile(FileToDecompress,LC_READONLY | LC_CREATEARRAY,0);
   	if (!ROMData)
   	{
        printf("Could not open file %s\n",FileToDecompress);
        LunarUnloadDLL();
        return false;
   	}
   }
   else
   if (!LunarOpenFile(FileToDecompress,LC_READONLY))
   {
      printf("Could not open file %s\n",FileToDecompress);
      LunarUnloadDLL();
      return false;
   }

   Sniff();

   //we don't need the DLL anymore
   LunarCloseFile();
   LunarUnloadDLL();
   return true;
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

   SetConsoleTitle("Sniff - Lunar Compress DLL");

   printf("Data Compression Sniff Program Version %i.%02i\n",SniffVersion/100,SniffVersion%100);
   printf("DLL Interface for Lunar Compress.dll\n");
   printf("Programmed by FuSoYa, Defender of Relm\n");
   printf("FuSoYa's Niche - http://fusoya.eludevisibility.org\n\n");

   DoSniff(argc,argv);

   WaitForTerminate();
}

