/**************************************************************************

   Lunar Compress demonstration program (smw_example.exe)
   Created by FuSoYa, Defender of Relm
   http://fusoya.eludevisibility.org

   This is a simple program to demonstrate how to use the decompression
   function and do basic drawing of 8x8 tiles using Lunar Compress.
   All it does is allow the user to open a SMW ROM so that it can
   decompress Mario's GFX and display them on screen using a bitmap.

   Check the OpenROM() and RenderScreen() functions for the interesting
   bits dealing with Lunar Compress.  The rest of the source code is
   mostly plain old win32 API stuff, which you shouldn't have any
   trouble with.

   For documenation on the Lunar Compress function calls used here,
   look in LunarDLL.h.

**************************************************************************/


#include <windows.h>
//#include <commctrl.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
//The next #include is just used to find the ROM size when checking
// for a 0x200 byte header... if your compiler doesn't support it,
// just remove this and the StatBuffer lines in CheckTheROM().
#include <sys\stat.h>
#include "../DLLCode/LunarDLL.h"

#define CM_FILE_OPEN_ROM 9000
#define CM_FILE_EXIT 9001

HINSTANCE g_hInst = NULL;
HMENU hMenu, hSubMenu;

HWND WindowFramehwnd;
static char FrameClassName[] = "SMWExample";
char* AppName="SMW Example for Lunar Compress";

bool MapLoaded=false;

HBITMAP TheMapBitmap=NULL;
HDC hdcMemoryTheMap=NULL;
unsigned int* TheMapBits;
BITMAPINFO pBI;

SCROLLINFO si;
/* These variables are required for horizontal scrolling.       */
int xMinScroll;       /* minimum horizontal scroll value */
int xCurrentScroll;   /* current horizontal scroll value */
int xMaxScroll;       /* maximum horizontal scroll value */
int xPageScroll;
int xIncrementScroll;
int xPixelsPerIncrement;

/* These variables are required for vertical scrolling.         */
int yMinScroll;       /* minimum vertical scroll value   */
int yCurrentScroll;   /* current vertical scroll value   */
int yMaxScroll;       /* maximum vertical scroll value   */
int yPageScroll;
int yIncrementScroll;
int yPixelsPerIncrement;

RECT TheWindowRect;
int TheWindowWidth;
int TheWindowHeight;
int TheMapWidth=416;
int TheMapHeight=416;
int MapPositionX=0;
int MapPositionY=0;

int MaxXPixels=0x10*8;
int MaxYPixels=0x10*3*8;


OPENFILENAME ofn;
char NewFileName[MAX_PATH];
char ROMFileName[MAX_PATH];
char ROMFilePath[MAX_PATH];
FILE *TheROM=NULL;


unsigned char buffer[0x10000];
unsigned char PixelMap[0x10000];
unsigned int ThePalette[0x10*0x10];

unsigned int SNESPalette[0x10*0x10];


int DisplayErrorMessage(HWND hwnd, int ErrorNumber, char* MoreInfo)  {
   switch(ErrorNumber) {
       case -22:MessageBox(hwnd, MoreInfo, "Couldn't open ROM for reading!", MB_OK | MB_ICONEXCLAMATION);
          break;
       case -23:MessageBox(hwnd, MoreInfo, "Couldn't open ROM for writing!", MB_OK | MB_ICONEXCLAMATION);
          break;
       case -26:MessageBox(hwnd, "The ROM does not have a 0x200 byte header!", "This ROM is not supported!", MB_OK | MB_ICONSTOP);
          break;
       case -27:MessageBox(hwnd, "The ROM either has the wrong game title,\r\nor is in the wrong format.", "This ROM is not supported!", MB_OK | MB_ICONSTOP);
          break;
       case -28:MessageBox(hwnd, "This is not a version 1.0 ROM!", "This ROM is not supported!", MB_OK | MB_ICONSTOP);
          break;
       case -29:MessageBox(hwnd, "This ROM is from the wrong country...\r\nOnly the US ROM is supported.", "This ROM is not supported!", MB_OK | MB_ICONSTOP);
          break;
   }
   return false;
}


unsigned int GetAddressFromPointer2(unsigned int ROMAddress,unsigned int ROMAddress2,bool SeekROM)  {
unsigned char Pointer[sizeof(int)];  //sizeof(int) must be >= 3 or you're toast...
unsigned int Address;

   *((unsigned int*)Pointer)=0;
   fseek(TheROM,ROMAddress,0);
   fread(Pointer,2,1,TheROM);
   fseek(TheROM,ROMAddress2,0);
   fread(&Pointer[2],1,1,TheROM);
   Address=LunarSNEStoPC((*(unsigned int*)Pointer),LC_LOROM,LC_HEADER);
//   Address=LoROMtoPC(*((unsigned int*)Pointer));
   if (SeekROM)
     fseek(TheROM,Address,0);
   return Address;
}


void RenderScreen(HWND hwnd,int Fromx,int Fromy,int Tox,int Toy)  {
int x,y;

   if ((!MapLoaded)||(!TheMapBitmap))  //Don't render the screen if it doesn't even exist!
     return;

   //erase the area in the bitmap first...
   for (y=Fromy;y<Toy;y++)
      for (x=Fromx;x<Tox;x++)
         TheMapBits[y*TheMapWidth+x]=0;

   //do not draw beyond the area we want...
   if ((Tox+MapPositionX*8)>MaxXPixels)
      Tox=MaxXPixels-MapPositionX*8;
   if ((Toy+MapPositionY*8)>MaxYPixels)
      Toy=MaxYPixels-MapPositionY*8;

   //Here we ask the DLL to draw the 8x8's in the requested area for us.
   //NOTE: LunarRender8x8 is technically supposed to be used for
   // drawing based on actual SNES tile reference data.  However,
   // in this case we're just going to feed it all the tile numbers
   // one by one so we can easily view the contents of the
   // PixelMap array we created.  This means that the flip X/Y,
   // layer priority, and palette flags will be zero unless we
   // set them manually (which we won't since we don't need those).
   for (y=Fromy;y<Toy;y+=8)
      for (x=Fromx;x<Tox;x+=8)
         LunarRender8x8(TheMapBits,TheMapWidth,TheMapHeight,x,y,PixelMap,ThePalette,(y/8)*0x10+x/8+MapPositionX+MapPositionY*0x10,LC_DRAW);

}


void ResetScrollBarX(HWND hwnd)  {
 xCurrentScroll=MapPositionX;
 /* Reset the scroll bar. */
 si.cbSize = sizeof(si);
 si.fMask  = SIF_POS;
 si.nPos   = xCurrentScroll;
 SetScrollInfo(hwnd, SB_HORZ, &si, TRUE);
}

void ResetScrollBarY(HWND hwnd)  {
 yCurrentScroll=MapPositionY;
 /* Reset the scroll bar. */
 si.cbSize = sizeof(si);
 si.fMask  = SIF_POS;
 si.nPos   = yCurrentScroll;
 SetScrollInfo(hwnd, SB_VERT, &si, TRUE);
}

void RenderFullScreen(HWND hwnd)  {

   if (!MapLoaded)
      return;
   RenderScreen(hwnd,0,0,TheMapWidth,TheMapHeight);
}

void DisplayFullScreen2(HDC hdcWindow)  {
   if ((MapLoaded)&&(hdcMemoryTheMap))
      BitBlt(hdcWindow, 0, 0, TheWindowWidth, TheWindowHeight, hdcMemoryTheMap, 0, 0, SRCCOPY);
}

void DisplayFullScreen(HWND hwnd)  {
HDC hdcWindow;

   hdcWindow = GetDC(hwnd);
   DisplayFullScreen2(hdcWindow);
   ReleaseDC(hwnd, hdcWindow);
}


void StandardPBI(int Width,int Height,BITMAPINFO* pBI)  {
   pBI->bmiHeader.biSize          = sizeof(BITMAPINFOHEADER);
   pBI->bmiHeader.biWidth         = Width;
   pBI->bmiHeader.biHeight        = -Height;
   pBI->bmiHeader.biPlanes        = 1;      //  Must be 1
   pBI->bmiHeader.biBitCount      = 32;
   pBI->bmiHeader.biCompression   = BI_RGB; //  Uncompressed
   pBI->bmiHeader.biSizeImage     = 0;      //  Allowed for BI_RGB
   pBI->bmiHeader.biXPelsPerMeter = 0;      //  Not required
   pBI->bmiHeader.biYPelsPerMeter = 0;      //  Not required
   pBI->bmiHeader.biClrUsed       = 0;      //  Want all 256 colours
   pBI->bmiHeader.biClrImportant  = 0;      //  All are important
}

int CreateMainBitmap(HWND hwnd)  {
HDC hdcWindow;

   StandardPBI(TheMapWidth,TheMapHeight,&pBI);
   TheMapBitmap = CreateDIBSection((HDC)NULL, &pBI, DIB_RGB_COLORS, (void**)&TheMapBits, NULL, 0);
   if (!TheMapBitmap)
     return 0;
   hdcWindow = GetDC(hwnd);
   hdcMemoryTheMap = CreateCompatibleDC(hdcWindow);
   ReleaseDC(hwnd, hdcWindow);
   if ( (!hdcMemoryTheMap)||(!(SelectObject(hdcMemoryTheMap, TheMapBitmap))) )
   {
      DeleteObject(TheMapBitmap);
      TheMapBitmap=NULL;
      return 0;
   }
   return 1;
}




unsigned int CreateMainBitmapXZ(HWND hwnd, int Width, int Height)  {
bool InvalidateOld=false;
RECT ARect;
int NewWidth;
int NewHeight;

     //Set up new window variables, create temp copy of old ones
   memcpy(&ARect,&TheWindowRect,sizeof(RECT));
   TheWindowHeight=Height;
   TheWindowWidth=Width;
   TheWindowRect.top=0;
   TheWindowRect.left=0;
   TheWindowRect.bottom=TheWindowHeight;
   TheWindowRect.right=TheWindowWidth;

   //Set up horizontal window scroll variables
   xMinScroll=0;
   xPageScroll=TheWindowWidth/8;
   if (!MapLoaded)
      xMaxScroll=0;
   else
      xMaxScroll=MaxXPixels/8-xPageScroll;

   if (xMaxScroll<=0)
   {
     xMaxScroll=0;
     InvalidateOld=true;
     MapPositionX=0;
   }
   xCurrentScroll=MapPositionX;
   xIncrementScroll=1;
   xPixelsPerIncrement=8;

   //Set up horizontal scrollbar
   si.cbSize = sizeof(si);
   si.fMask  = SIF_RANGE | SIF_PAGE | SIF_POS;
   si.nMin   = xMinScroll;
   si.nMax   = xMaxScroll;
   si.nPage  = xIncrementScroll;
   si.nPos   = xCurrentScroll;
   SetScrollInfo(hwnd, SB_HORZ, &si, TRUE);

   //Set up vertical window scroll variables
   yMinScroll=0;
   yPageScroll=TheWindowHeight/8;
   if (!MapLoaded)
      yMaxScroll=0;
   else
      yMaxScroll=MaxYPixels/8-yPageScroll;
   if (yMaxScroll<=0)
   {
      yMaxScroll=0;
      InvalidateOld=true;
      MapPositionY=0;
   }
   yCurrentScroll=MapPositionY;
   yIncrementScroll=1;
   yPixelsPerIncrement=8;

   //Set up vertical scrollbar
   si.cbSize = sizeof(si);
   si.fMask  = SIF_RANGE | SIF_PAGE | SIF_POS;
   si.nMin   = yMinScroll;
   si.nMax   = yMaxScroll;
   si.nPage  = yIncrementScroll;
   si.nPos   = yCurrentScroll;
   SetScrollInfo(hwnd, SB_VERT, &si, TRUE);

   NewWidth=TheWindowWidth/8;
   NewHeight=TheWindowHeight/8;
   NewWidth=NewWidth*8;
   NewHeight=NewHeight*8;

   if (NewWidth<8)
     NewWidth=8;
   if (NewHeight<8)
     NewHeight=8;
   if (NewWidth<TheWindowWidth)
     NewWidth+=8;
   if (NewHeight<TheWindowHeight)
     NewHeight+=8;
   if (NewWidth>2048)
     NewWidth=2048;
   if (NewHeight>2048)
     NewHeight=2048;
   if (TheMapBitmap) //if we're recreating the bitmap...
     if ((NewWidth==TheMapWidth)&&(NewHeight==TheMapHeight))
         return false;
   if (hdcMemoryTheMap)
     DeleteDC(hdcMemoryTheMap);
   if (TheMapBitmap)
     DeleteObject(TheMapBitmap);
   hdcMemoryTheMap=NULL;
   TheMapBitmap=NULL;
   TheMapWidth=NewWidth;
   TheMapHeight=NewHeight;

   if (!(CreateMainBitmap(hwnd)))
      return false;

   if (InvalidateOld)
     InvalidateRect(hwnd,&ARect,false);   

   RenderScreen(hwnd,0,0,TheMapWidth,TheMapHeight);
   return true;
}


unsigned int CreateMainBitmapX(HWND hwnd)  {
RECT ARect;
   GetClientRect(hwnd,&ARect);
   return CreateMainBitmapXZ(hwnd,ARect.right,ARect.bottom);
}


void AdjustScreenSize(HWND hwnd, int Width, int Height)  {
   if (CreateMainBitmapXZ(hwnd,Width,Height))
      RenderFullScreen(hwnd);
}



unsigned int CheckTheROM(HWND hwnd)  {
struct stat StatBuffer;
char ROMTitle[21+1];
const char* ROMRealTitle="SUPER MARIOWORLD     ";
unsigned char country,version;

   fseek(TheROM,0,0);
   fstat(fileno(TheROM), &StatBuffer);
   if (!(StatBuffer.st_size&0x200))
     return DisplayErrorMessage(hwnd,-26,NULL); //no 0x200 byte header
   fseek(TheROM,0x81C0,0);
   fread(ROMTitle,21,1,TheROM);
   ROMTitle[21]=0;
   fseek(TheROM,0x81D9,0); //country byte
   fread(&country,1,1,TheROM);
   fseek(TheROM,0x81DB,0); //version byte
   fread(&version,1,1,TheROM);

   if (strcmp(ROMRealTitle,ROMTitle))
      return DisplayErrorMessage(hwnd,-27,NULL); //wrong game title
   else
   { //Mario World
     if (version)
         return DisplayErrorMessage(hwnd,-28,NULL); //not version 1.00
     if (country!=1)
         return DisplayErrorMessage(hwnd,-29,NULL); //wrong country (US only)
   }

   return 1;
}


unsigned int GetROMFile(HWND hwnd)  {

   if (ROMFileName)
     strcpy(NewFileName,ROMFileName);
   else
     NewFileName[0]=0;

   memset(&ofn,0,sizeof(ofn));
   ofn.lStructSize = sizeof(ofn);
   ofn.hwndOwner = hwnd;
   ofn.lpstrFilter = "SNES ROM Image Files (*.smc)\0*.smc\0All Files (*.*)\0*.*\0\0";
   ofn.lpstrFile = NewFileName;
   ofn.nMaxFile = MAX_PATH;
   ofn.Flags = OFN_EXPLORER | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
   ofn.lpstrDefExt = "smc";

   if(!GetOpenFileName(&ofn))
     return false;
   return true;
}



unsigned int OpenROM(HWND hwnd)  {
unsigned int Pointer;
unsigned int size;
unsigned int i;

   //first, we get the filename from the user.
   if (!GetROMFile(hwnd))
      return false;

   TheROM=fopen(NewFileName,"rb");
   if (TheROM==NULL)
      return DisplayErrorMessage(hwnd,-22,NewFileName);

   if (!CheckTheROM(hwnd))
   {  //Hey, this isn't SMW!
     fclose(TheROM);
     return false;
   }

   //store the new file name now that we know it's okay.
   strcpy(ROMFileName,&NewFileName[ofn.nFileOffset]);
   strcpy(ROMFilePath,NewFileName);
   ROMFilePath[ofn.nFileOffset]=0;

   //Now we get the PC address for Mario's compressed GFX.
   Pointer=GetAddressFromPointer2(0x3AD8,0x3A90,false);

   //We don't need anything else from the ROM, so close the file.
   fclose(TheROM);

   //Open the ROM in the DLL.
   if (!LunarOpenFile(NewFileName,LC_READONLY))
      return false;  //couldn't open file...!

   //Decompress Mario's GFX from the PC address we got before, and
   // store the 4bpp SNES graphics into the buffer.
   size=LunarDecompress(buffer,Pointer,0x10000,1,0,NULL);

   //The DLL doesn't need anything else from the ROM, so close the file.
   LunarCloseFile();

   if (!size)
      return false;  //decompression failed...!
   if (size>0x10000)
      size=0x10000;  //just to be on the safe side...

   //Take the graphics we just decompressed from the ROM, and have
   // the DLL convert it into a PixelMap that we'll be using later
   // for drawing the tiles in a bitmap.
   LunarCreatePixelMap(buffer,PixelMap,size/32,LC_4BPP);

   //SMW has an icky way of creating palettes, so for the sake of
   // demonstration I'm just going to place Mario's SNES palette into
   // an array directly here rather than trying to read the actual data
   // from the ROM...
   SNESPalette[0]=0;
   SNESPalette[1]=0x7FFF;
   SNESPalette[2]=0;
   SNESPalette[3]=0x0D71;
   SNESPalette[4]=0x1E9B;
   SNESPalette[5]=0x3B7F;
   SNESPalette[6]=0x635F;
   SNESPalette[7]=0x581D;
   SNESPalette[8]=0x000A;
   SNESPalette[9]=0x391F;
   SNESPalette[0xA]=0x44C4;
   SNESPalette[0xB]=0x4E08;
   SNESPalette[0xC]=0x6770;
   SNESPalette[0xD]=0x30B6;
   SNESPalette[0xE]=0x35DF;
   SNESPalette[0xF]=0x03FF;

   //Now convert all the colors in the SNES palette to a PC palette
   // that we'll be using for drawing later...
   for (i=0;i<0x10*0x10;i++)
      ThePalette[i]=LunarSNEStoPCRGB(SNESPalette[i]);

   //Do some win32 API stuff...
   MapLoaded=true;
   CreateMainBitmapXZ(hwnd,TheWindowWidth,TheWindowHeight);
   RenderFullScreen(hwnd);
   InvalidateRect(hwnd,NULL,false);
   UpdateWindow(hwnd);
   return true;
}



unsigned int MainWindowCommand(HWND hwnd, int TheCommand)  {
   switch(TheCommand)
   {
     case CM_FILE_OPEN_ROM:
         OpenROM(hwnd);
         break;
     case CM_FILE_EXIT:
         PostMessage(hwnd, WM_CLOSE, 0, 0);
         break;
   }
   return 0;
}

void FreeAllData()  {

}

void CreateMainMenu(HWND hwnd)  {
     //Create our Menu
   hMenu = CreateMenu();

   hSubMenu = CreatePopupMenu();
   AppendMenu(hSubMenu, MF_STRING, CM_FILE_OPEN_ROM, "&Open ROM...");
   AppendMenu(hSubMenu, MF_STRING, CM_FILE_EXIT, "&Exit");
   AppendMenu(hMenu, MF_STRING | MF_POPUP, (UINT)hSubMenu, "&File");

   SetMenu(hwnd, hMenu);
}

LRESULT CALLBACK FrameProc(HWND hwnd, UINT Message, WPARAM wParam, LPARAM lParam)
{
   switch(Message)
   {
      case WM_HSCROLL:{
        int xDelta;
        int xNewPos;
        int yDelta = 0;

        switch (LOWORD(wParam)) {
            /* User clicked the shaft left of the scroll box. */
            case SB_PAGEUP:
                xNewPos = xCurrentScroll - xPageScroll;
                break;
            /* User clicked the shaft right of the scroll box. */
            case SB_PAGEDOWN:
                xNewPos = xCurrentScroll + xPageScroll;
                break;
            /* User clicked the left arrow. */
            case SB_LINEUP:
                xNewPos = xCurrentScroll - xIncrementScroll;
                break;
            /* User clicked the right arrow. */
            case SB_LINEDOWN:
                xNewPos = xCurrentScroll + xIncrementScroll;
                break;
            /* User dragged or is dragging the scroll box. */
            case SB_THUMBPOSITION:
            case SB_THUMBTRACK:
                xNewPos = HIWORD(wParam);
                break;
            default:
                xNewPos = xCurrentScroll;
        }
        /* New position must be between 0 and the screen width. */
        xNewPos = max(0, xNewPos);
        xNewPos = min(xMaxScroll, xNewPos);

        /* If the current position does not change, do not scroll.*/
        if (xNewPos == xCurrentScroll)
            break;

        /* Determine the amount scrolled (in pixels). */
        xDelta = (xNewPos - xCurrentScroll)*xPixelsPerIncrement;
                           //(-) is hit left, scroll right
        /* Reset the current scroll position. */
        xCurrentScroll = xNewPos;

        ScrollDC(hdcMemoryTheMap,-xDelta,-yDelta,NULL,NULL,NULL,NULL);
        MapPositionX=xCurrentScroll;
        if (xDelta>0)    //hit right, scroll left
          RenderScreen(hwnd,max(0,(TheMapWidth-xDelta)),0,TheMapWidth,TheMapHeight);
        else   //hit left, scroll right
          RenderScreen(hwnd,0,0,min(TheMapWidth,-xDelta),TheMapHeight);
        ScrollWindowEx(hwnd, -xDelta, -yDelta, &TheWindowRect,
            &TheWindowRect, (HRGN) NULL, (LPRECT) NULL,
            SW_INVALIDATE);
//             InvalidateRect(hwnd,&TheWindowRect,false);
        UpdateWindow(hwnd);
        ResetScrollBarX(hwnd);
      }
      break;

      case WM_VSCROLL:{
        int xDelta=0;
        int yNewPos;
        int yDelta;

        switch (LOWORD(wParam)) {
            /* User clicked the shaft above scroll box. */
            case SB_PAGEUP:
                yNewPos = yCurrentScroll - yPageScroll;
                break;
            /* User clicked the shaft below the scroll box. */
            case SB_PAGEDOWN:
                yNewPos = yCurrentScroll + yPageScroll;
                break;
            /* User clicked the up arrow. */
            case SB_LINEUP:
                yNewPos = yCurrentScroll - yIncrementScroll;
                break;
            /* User clicked the down arrow. */
            case SB_LINEDOWN:
                yNewPos = yCurrentScroll + yIncrementScroll;
                break;
            /* User dragged or is dragging the scroll box. */
            case SB_THUMBPOSITION:
            case SB_THUMBTRACK:
                yNewPos = HIWORD(wParam);
                break;
            default:
                yNewPos = yCurrentScroll;
        }
        /* New position must be between 0 and the screen height. */
        yNewPos = max(0, yNewPos);
        yNewPos = min(yMaxScroll, yNewPos);

        /* If the current position does not change, do not scroll.*/
        if (yNewPos == yCurrentScroll)
            break;

        /* Determine the amount scrolled (in pixels). */
        yDelta = (yNewPos - yCurrentScroll)*yPixelsPerIncrement;
                           //(-) is hit up, scroll down
        /* Reset the current scroll position. */
        yCurrentScroll = yNewPos;

        ScrollDC(hdcMemoryTheMap,-xDelta,-yDelta,NULL,NULL,NULL,NULL);
        MapPositionY=yCurrentScroll;
        if (yDelta>0)    //hit down, scroll up
          RenderScreen(hwnd,0,max(0,(TheMapHeight-yDelta)),TheMapWidth,TheMapHeight);
        else   //hit up, scroll down
          RenderScreen(hwnd,0,0,TheMapWidth,min(TheMapHeight,-yDelta));

        ScrollWindowEx(hwnd, -xDelta, -yDelta, &TheWindowRect,
            &TheWindowRect, (HRGN) NULL, (LPRECT) NULL,
            SW_INVALIDATE);
        UpdateWindow(hwnd);
        ResetScrollBarY(hwnd);
      }
      break;
      case WM_COMMAND:
          MainWindowCommand(hwnd,LOWORD(wParam));
          break;
      case WM_ERASEBKGND:
          if (MapLoaded)
               return 1;   //don't erase background if we have the map loaded
          return DefWindowProc(hwnd, Message, wParam, lParam);
      case WM_PAINT:
         PAINTSTRUCT ps;
         HDC hdcWindow;
         hdcWindow = BeginPaint(hwnd, &ps);

         if (!TheMapBitmap)
         {
            CreateMainBitmapX(hwnd);
            RenderFullScreen(hwnd);
         }
         DisplayFullScreen2(hdcWindow);

         EndPaint(hwnd, &ps);
         break;

      case WM_SIZE:
         //Adjust our bitmap to fit window
         if ((wParam==SIZE_MAXIMIZED)||(wParam==SIZE_RESTORED))
            AdjustScreenSize(hwnd,LOWORD(lParam),HIWORD(lParam));
         break;
      case WM_CREATE:
         CreateMainMenu(hwnd);
         break;
      case WM_CLOSE:
         DestroyWindow(hwnd);
         break;
      case WM_DESTROY:
         FreeAllData();
         if (hdcMemoryTheMap)
            DeleteDC(hdcMemoryTheMap);
         if (TheMapBitmap)
            DeleteObject(TheMapBitmap);
         PostQuitMessage(0);
         break;
      default: return DefWindowProc(hwnd, Message, wParam, lParam);
   }
   return 0;
}



unsigned int CreateAllWindows()  {
WNDCLASSEX WindowFrame;

   WindowFrame.cbSize        = sizeof(WNDCLASSEX);
   WindowFrame.style         = NULL;
   WindowFrame.lpfnWndProc   = FrameProc;
   WindowFrame.cbClsExtra    = 0;
   WindowFrame.cbWndExtra    = 0;
   WindowFrame.hInstance     = g_hInst;
   WindowFrame.hIcon         = LoadIcon(NULL, IDI_APPLICATION);//LoadIcon(g_hInst,MAKEINTRESOURCE(121));   //218
   WindowFrame.hCursor       = LoadCursor(NULL, IDC_ARROW);//NULL
   WindowFrame.hbrBackground = (HBRUSH)(COLOR_BTNFACE+1);
   WindowFrame.lpszMenuName  = NULL;
   WindowFrame.lpszClassName = FrameClassName;
   WindowFrame.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);//LoadIcon(g_hInst,MAKEINTRESOURCE(217));


   if ((!RegisterClassEx(&WindowFrame)))
   {
      MessageBox(0, "Window Registration Failed!", "Error!",
         MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);
      return 0;
   }


   WindowFramehwnd = CreateWindowEx( //WS_EX_STATICEDGE   WS_EX_CLIENTEDGE
      WS_EX_CLIENTEDGE,
      FrameClassName,
      AppName,
      WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, CW_USEDEFAULT, 300, 300,
      NULL, NULL, g_hInst, NULL);

   if (!WindowFramehwnd)
   {
      MessageBox(0, "Window Creation Failed!", "Error!",
         MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);
      return 0;
   }

   return 1;
}






int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
   LPSTR lpCmdLine, int nCmdShow)
{
MSG Msg;

   g_hInst = hInstance;

   //load the DLL
   if (!LunarLoadDLL())
   {
      MessageBox(0, "Could not load Lunar Compress DLL!", "Error!",
         MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);
      return 0;
   }

   if (!CreateAllWindows())
   {
      LunarUnloadDLL();
      return 0;
   }

   ShowWindow(WindowFramehwnd, nCmdShow);
   UpdateWindow(WindowFramehwnd);

   while(GetMessage(&Msg, NULL, 0, 0))
   {
      TranslateMessage(&Msg);
      DispatchMessage(&Msg);
   }

   //we don't need the DLL anymore
   LunarUnloadDLL();

   return Msg.wParam;
}