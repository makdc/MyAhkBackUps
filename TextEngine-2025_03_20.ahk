﻿#Persistent
#SingleInstance, Force
#include TF.ahk
#MaxMem 128
;#Include CSV_Func.ahk
;#include SetCaretPosition.ahk
;#include Search.ahk

DetectHiddenWindows, On
SetWorkingDir %A_ScriptDir% 
SetTitleMatchMode, 1
 ; Menu Tray, Icon, %A_WorkingDir%\images\Blue-Fish.ico

; ------------------------------------------------------------------------------/ Create the sub-menus for the menu bar:


Menu, FileMenu, Add, Edit Checked , Edit
Menu, FileMenu, Add, Delete Checked , Delete
Menu, FileMenu, Add, Print Checked , Print
Menu, FileMenu, Add,
Menu, FileMenu, Add, Open Snippet Folder, Folder
Menu, FileMenu, Add,
Menu, FileMenu, Add, &Reset, ReloadEverything
Menu, FileMenu, Add,
Menu, FileMenu, Add, &Exit, FileExit
Menu, SettingsMenu, Add,   &Always on Top, AlwaysonTop
Menu, SettingsMenu, Add,   &Include Subfolders, Check
Menu, SettingsMenu, Add,   &Count of Occurrences, AltSearch
Menu, SettingsMenu, Add,   &Export Previous Line, PrevLine
;Menu, SettingsMenu, Add,   &Resize, Resizeable
Menu, HelpMenu, Add, &About, HelpAbout
; ------------------------------------------------------------------------------/ Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &File, :FileMenu
Menu, MyMenuBar, Add, &Settings, :SettingsMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu
; ------------------------------------------------------------------------------/ Attach the menu bar to the window:
;Gui, +resize
Gui, Menu, MyMenuBar

Gui, font, s8, Arial

Gui, Add, Text,     x11   y4   w100 h20, Snippet Title
Gui, Add, Edit,     x10   y20  w225 h20  vTitle,
Gui, Add, Text,     x250   y4   w100 h20, Current Directory
Gui, Add, Edit,     x250   y20  w225 h20  vCurrDirectory, %A_WorkingDir%
Gui, Add, Button,   x475  y20  w20 h20 gRefreshDirectory, ⟳
Gui, Add, Button,   x495  y20  w20 h20 gBrowseNewDirectory, ...
Gui, Add, Text,     x11   y44  w100 h20 , Snippet Content 
Gui, Add, Edit,     x10   y60  w495 h80  vContent, 
Gui, Add, GroupBox, x10   y140 w495 h38 , 
Gui, Add, Button,   x14   y152 w85  h21  gStore, Store Snippet


; Gui, Add, Picture,  x206  y154 w20  h19, 
;Gui, Add, Checkbox, x105  y157 

Gui, Add, Button,   x330  y305 w85  h21  gRefresh, Refresh List
Gui, Add, Button, Default    x416  y152 w85  h21  gUiSearch, Search
;Gui, font, s6, Arial
Gui, Add, Button,   x416  y335 w160  h21  gLineJumpSubmit, Go To Line/ Search in Text
;Gui, font, s8, Arial
Gui, Add, Edit,     x334  y335 w80 h20  vLineJumpTo
Gui, Add, Edit,     x254  y152 w160 h20  vSearchFor, 
Gui, Add, ListView, x10   y186 r5   w895 vMainLV gListMatches Checked Grid -Multi  , Snippet Title|Created|Row|Info|Location  
Gui, Add, GroupBox, x10   y293 w895 h38 , 
Gui, Add, Button,   x14  y335 w85  h21  gRefreshRead, Clear Display

Gui, Add, Edit,   x100  y335 w100  h21  vAddLines
Gui, Add, text,   x200  y335 w125  h21  , Split by Chars (#,#,#)

Gui, Add, Button,   x416   y305 w85  h21  gSearchExp, Export Search
Gui, Add, Text,     x15   y309 w300 h16  vFileName
Gui, font, s8, Consolas
Gui, Add, Edit,     x10   y360 w895 h145  vDisplay ReadOnly
Gui, Add, Edit,     x505   y305 w20  h21 vStartingChar, 1
Gui, Add, Edit,     x530   y305 w20  h21 vEndingChar
Gui, Add, Edit,     x560   y305 w20  h21 vStartingChar0, 1
Gui, Add, Edit,     x585   y305 w20  h21 vEndingChar0
;vDisplay, +resize
;Loop, %A_WorkingDir%\data\* ;*.txt*     ; -----------------------------------------/ Scan folder for txt files 
;Loop, %A_WorkingDir%\*.ahk*     ; -----------------------------------------/ Scan folder for txt files

Loop, %A_WorkingDir%\* ,, % IncRecurs

LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) )
      LV_ModifyCol(1,245)
      LV_ModifyCol(2,100)
      LV_ModifyCol(3,140)
      LV_ModifyCol(4,1000)
      LV_ModifyCol(5,140)

;Loop 100 {
;   Random, rnd, 1, 999999   
;   rw := Format("{:03}",A_Index)
;   LV_Add( "", "Row : " rw . "`nSubRow-" rw "-1`nSubRow-" rw "-2`nSubRow-" rw "-3", rnd )
;}


;Gui, Show, AutoSize, Text Engine 
Gui, +resize
Gui, Add, StatusBar,,
SB_SetParts(200, 150)

;global vStartingChar := 1
;global vEndingChar := ""
global Delimeter = "^"
global EscDelimeter = "`" . Delimeter

global UiDelimeter = ";"
global UiEscDelimeter = "`" . UiDelimeter
global PrevLineAppend = 0
;ControlSetText %A_WorkingDir%, edit2
;VarW = w515

Gui, Show, x370 y264 h530 w915, Text Engine
gosub Refresh
Return


ReloadEverything:
Reload
Return

BrowseNewDirectory:
FileSelectFolder Folder
;Gui, Submit, NoHide
if ( Folder = "" ) {
    ;SetWorkingDir %A_ScriptDir%
    Folder = %A_ScriptDir%
}
GuiControl,, CurrDirectory, %Folder%
gosub RefreshDirectory
Return

Return

GuiSize:
;SearchFor.CurrentValue() := "Hello"
	if !initSize {
		
        GuiControlGet, c1, Pos, Button1
		GuiControlGet, c2, Pos, Button2
		GuiControlGet, c3, Pos, SearchFor
        GuiControlGet, c4, Pos, MainLV
        GuiControlGet, c5, Pos, GBox
        GuiControlGet, c6, Pos, Button3
        GuiControlGet, c7, Pos, Text1
        
        GuiControlGet, c8, Pos, Display
		initSize := {  "gui"    : {w:A_GuiWidth, h:A_GuiHeight}
		            ;, "Button1"  : {x:c1X, y:c1Y, w:c1W, h:c1H }
		            ;, "Button2": {x:c2X, y:c2Y, w:c2W, h:c2H}
		            ;, "Edit1": {x:c3X, y:c3Y, w:c3W, h:c3H}
		            , "MainLV": {x:c4X, y:c4Y, w:c4W, h:c4H }
		            ;, "GBox": {x:c5X, y:c5Y, w:c5W, h:c5H}
		            ;, "Button3": {x:c6X, y:c6Y, w:c6W, h:c6H}                    
		            ;, "Text1"  : {x:c7X, y:c7Y, w:c7W, h:c7H }
		            , "Edit2": {x:c8X, y:c8Y, w:c8W, h:c8H} }
		lastGuiW := A_GuiWidth
		lastGuiH := A_GuiHeight
		return
	}

	if (A_EventInfo = 1)  ; The window has been minimized.
	|| (A_GuiWidth = lastGuiW && A_GuiHeight = lastGuiH) { ; The window has been restored (from minimized state)
		return
	}

	changedW := A_GuiWidth  - initSize.gui.w
	changedH := A_GuiHeight - initSize.gui.h

	
	;GuiControl, Move, Button1  , % ("y" initSize.Button1.y + changedH)
	;GuiControl, Move, Button2  , % ("y" initSize.Button2.y + changedH)
    ;GuiControl, Move, SearchFor, % ("y" initSize.Edit1.y + changedH)
    GuiControl, Move, MainLV, % ("w" initSize.MainLV.w   + changedW)
    ;GuiControl, Move, GBox, % ("w" initSize.GBox.w   + changedW) . (" h" initSize.GBox.h   + changedH)
    ;GuiControl, Move, Button3, % ("y" initSize.Button3.y + changedH)
    ;GuiControl, Move, Text1, % ("w" initSize.Text1.w   + changedW) . (" h" initSize.Text1.h   + changedH)
    GuiControl, Move, Display, % ("w" initSize.Edit2.w   + changedW) . (" h" initSize.Edit2.h   + changedH)

	lastGuiW := A_GuiWidth
	lastGuiH := A_GuiHeight
    Gui, Show
	Return


/*
Search:
IfInString, SearchFor,  ?????????????????????????????
Return
*/











FileExit: ; --------------------------------------------------------------------/ User chose "Exit" [File menu]
ExitApp
Return

GuiClose:
ExitApp

ListMatches:
if A_GuiEvent = DoubleClick
{
    Gui, Submit, Nohide
    Sort Addlines , N U D,
    SortedAddLines := Addlines
    GuiControl,, Addlines, %SortedAddLines%
    ;MsgBox % Addlines
    
    ;Gui, Submit, Nohide
    LV_GetText(FileName, A_EventInfo, 1) ; -------------------------------------/Get the text of the first field.
    FileRead, messagebody, %A_WorkingDir%\%FileName% ;data\%FileName%
    ;String := StrSplit(messagebody, "`n")
    ;Sort, Addlines , N U
    ;StringPlaceMent = %AddLines%
    StringPlaceMent := StrSplit(SortedAddLines, ",")
    
    ;StringPlaceMent := [5,10,15,20]
    ;MsgBox % Addlines
    Loop
    {
    ColumnString := StringPlaceMent[StringPlaceMent.MaxIndex()]
    If ( ColumnString = "" ) {
        Break
    }
    
    
    messagebody := TF_ColPut(messagebody, 1, 0, ColumnString, " | ", 0)
    
    StringPlaceMent.Pop()
    
    }
    
    messagebody := TF_LineNumber(messagebody,1,,A_Space)  ; Add linenumbers, padding with spaces, linenumbers are aligned right because of space
    GuiControl,,Display, %messagebody%
    GuiControl,,FileName, %FileName%
;    Pos2 := ""x
    
   } 
    

return


AlwaysonTop: ; -----------------------------------------------------------------/ Always on Top  [File menu]
Gui, Submit, Nohide
WinSet, AlwaysOnTop, Toggle , Text Engine,,, 
Return

check:
;Menu, %A_ThisMenu%, % IncRecurs ? "Check" : "Uncheck", %A_ThisMenuItem%
;Menu, %A_ThisMenu%, togglecheck, %A_ThisMenuItem%
;IncRecurs := ToggleFlag(IncRecurs)
IncRecurs := !IncRecurs
Menu, %A_ThisMenu%, % IncRecurs ? "Check" : "Uncheck", %A_ThisMenuItem%

/*
IncRecurs := ToggleFlag(IncRecurs)

;MsgBox % IncRecurs

return



ToggleFlag(FlagVariable)
{	If !FlagVariable ;If FlagVariable is 0 (off)
	{	FlagVariable = 1 ;Set FlagVariable to 1 (on)
	} Else If FlagVariable ;Otherwise, if FlagVariable is 1 (on)
	{	FlagVariable = 0 ;Set FlagVariable to 0 (off)
	} 	Menu, %A_ThisMenu%, ToggleCheck, %A_ThisMenuItem% ;Toggle checkmark next to menu item
		return FlagVariable ; Return FlagVariable value to caller
}
;WinSet, AlwaysOnTop, Toggle , Text Engine,,,

*/
Return


AltSearch:
CountsOnly := !CountsOnly
Menu, %A_ThisMenu%, % CountsOnly ? "Check" : "Uncheck", %A_ThisMenuItem%
Return

PrevLine:
PrevLineAppend := !PrevLineAppend
;MsgBox % PrevLineAppend
Menu, %A_ThisMenu%, % PrevLineAppend ? "Check" : "Uncheck", %A_ThisMenuItem%
Return
/*
Resizeable: ; -----------------------------------------------------------------/ Always on Top  [File menu]
Gui, Submit, Nohide
WinSet, Resize, Toggle , Text Engine,,, 
Return
*/
Store:

{
   Gui, Submit, Nohide
   xToday := CurrTime(A_Now)
   TitleTail := SubStr( Title, -8, 9 )
   ExtCheck := InStr( TitleTail, ".")
   MsgBox %ExtCheck%
   If ( ExtCheck = 0 ) {
       TitleExt := ".txt"
   }
   Else {
   TitleExt := ""
   }
   
   
   ;FileAppend,%Content%,%A_WorkingDir%\data\%Title%.txt
   FileAppend,%Content%,%A_WorkingDir%\%Title%-%xToday%%TitleExt% ;data\%Title%.txt
   
   
}

GuiControl,, Title, ; ----------------------------------------------------------/ Clear Fields
GuiControl,, Content,
GuiControl,, Display,
GuiControl,, FileName,
LV_Delete()  ; -----------------------------------------------------------------/ Clear Fields
;Loop, %A_WorkingDir%\data\* ;*.txt* ; ---------------------------------------------/ Refresh List

Loop, %A_WorkingDir%\*

LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) )
LV_ModifyCol(1,345)
LV_ModifyCol(2,140)
LV_ModifyCol(3,140)
Return

Refresh: ; ---------------------------------------------------------------------/ Refresh List Button
LV_Delete()
;Loop, %A_WorkingDir%\data\* ;*.txt*

Loop, %A_WorkingDir%\* ,, R

LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) )
LV_ModifyCol(1,345)
LV_ModifyCol(2,140)
LV_ModifyCol(3,140)
LV_ModifyCol(4,140)
LV_ModifyCol(5,140)
Return

Delete: ; ----------------------------------------------------------------------/Delete Checked
RowNumber = 0  
Loop
{
    RowNumber := LV_GetNext(RowNumber, "Checked")  
    if not RowNumber 
    break
    LV_GetText(Text, RowNumber)
    FileDelete, %A_WorkingDir%\%Text%  ;data\%Text%
}
LV_Delete() ; ------------------------------------------------------------------/ Refresh List
;Loop, %A_WorkingDir%\data\* ;*.txt*

Loop, %A_WorkingDir%\*

LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) )
LV_ModifyCol(1,345)
LV_ModifyCol(2,140)
LV_ModifyCol(3,140)
Return

Edit: ; ------------------------------------------------------------------------/ Edit Selected
RowNumber = 0  
Loop
{
    RowNumber := LV_GetNext(RowNumber, "Checked")  
    if not RowNumber  
    break
    LV_GetText(Text, RowNumber)
    Run, %A_WorkingDir%\%Text%    ;data\%Text%
    LV_Modify(RowNumber, "-Check")
}
Return

Print: ; -----------------------------------------------------------------------/ Print Selected
RowNumber = 0  
Loop
{
    RowNumber := LV_GetNext(RowNumber, "Checked")  
    if not RowNumber  
    break
    LV_GetText(Text, RowNumber)
    Run, print %A_WorkingDir%\%Text%,,HIDE    ;data\%Text%,,HIDE 
    LV_Modify(RowNumber, "-Check")
}
Return

Folder:
Run, %A_WorkingDir%\ ;data\ ; ----------------------------------------------------/ Open root Dir.
Return

RefreshRead: ; -----------------------------------------------------------------/ Refresh Read
GuiControl,, Display,
GuiControl,, FileName,
Return

HelpAbout: ; -------------------------------------------------------------------/ About Dialog
Gui, 2:+owner1 
Gui +Disabled  
 ; Gui, 2:Add, Picture,  x15  y15 , %A_WorkingDir%\images\Blue-Fish-128x128.png
Gui, 2:Add, Text,x180 y10 h110 w200,
(
Snippet Engine.

Type or Paste in your Snippet Title and Snippet Content. Hit Store Snippet to save snippet for future reference.
View snippets by double-clicking in List View. Check snippets to Edit or Delete.

) 
Gui, 2:Add, Button, Default w85  h21 ,Close
Gui, 2:Show, x500 y500 h160 w400
return

2ButtonClose:  
2GuiClose:
2GuiEscape:
Gui, 1:-Disabled  
Gui Destroy  
return

; ------------------------------------------------------------------------------/ Created date format function

CTime( tStr="" ) {
If tStr=
   Return tStr
FormatTime, otStr, %tStr%,  yyyy-MM-dd (HH:mm) 
Return otStr
}

CurrTime( tStr="" ) {
If tStr=
   Return tStr
FormatTime, otStr, %tStr%,  yyyy-MM-dd (HH-mm) 
Return otStr
}

MTime(tStr0="") {
If tStr0=
   Return tStr0
FormatTime, otStr0, %tStr%,  yyyy-MM-dd (HH:mm) 
Return otStr0
}

;FormatTime, CurrentDT, A_Now, yyyy-MM-dd_HH-mm
; ------------------------------------------------------------------------------/ end function
SearchExp:
;Filename :=  A_WorkingDir . "\EXPORT.csv"
;FileDelete % FileName
GoSub ExpSearch
FormatTime, CurrentDT, A_Now, yyyy-MM-dd-HH-mm
Filename :=  A_WorkingDir . "\Exports\" . CurrentDT . "-" . SearchFor . "-" . LineJumpTo . "-" . "EXPORT.csv"
ExpCheck = %A_WorkingDir%\Exports\
ExpCheck := FileExist( ExpCheck )

If ( ExpCheck = "" ) {
    FileCreateDir, %A_WorkingDir%\Exports\
}

;FileName = %A_WorkingDir%\%CurrentDT%-%SearchFor%-%LineJumpTo%-EXPORT.csv"
;Delimeter := ";"
FileAppend {Snippet Title; Created; Row; Info}, %FileName%
CSV_LVSave(FileName, Delimeter, 1)
/*
{
    ...
    FileAppend {Snippet Title, Created, Row, Info}, %FileName%
    FileAppend, %EntireFile%, %FileName%  ;-- This is the regular FileAppend command from the function
    }
/*
Filename :=  A_WorkingDir . "\EXPORT.csv"
FileDelete % FileName
Gui, ListView, MainLV       ;It's positioned in the desired Listview
LV_GetText(oCol1, 0, 1)
LV_GetText(oCol2, 0, 2)
LV_GetText(oCol3, 0, 3)
LV_GetText(oCol4, 0, 4)
Loop % LV_GetCount() {
  oLine := oCol1 ", " oCol2 ", " oCol3 ", " oCol4 ", `n"
 	FileAppend, % oLine, % FileName
  LV_GetText(oCol1, A_index, 1)
  LV_GetText(oCol2, A_index, 2)
  LV_GetText(oCol3, A_index, 3)
  LV_GetText(oCol4, A_index, 4)
}
*/
;Gosub AdjustExport
GoSub UiSearch
Msgbox 0x40000,, % "File " Filename " exported" 
Filename :=  A_WorkingDir
Return	
    
Return

AddLinesButton:




Return



UiSearch:
Gui, Submit, Nohide
LV_Delete()  ;------------------------------------------------------------------/ clear list before displaying search results 
;Loop, %A_WorkingDir%\data\* ;*.txt*
;Loop, %A_WorkingDir%\Adventure\Include\*.ahk*

Loop, %A_WorkingDir%\* ,, % IncRecurs

{
   FileRead, TMP_fileContent, %A_LoopFileFullPath%
   IfInString, TMP_fileContent, %SearchFor%
   ;IfInString, A_LoopReadLine, %SearchFor%
   ;Loop, read, TMP_fileContent
   ;IfInString, A_LoopReadLine, %strToFind%
   
;   Gui, -DPIScale        
;RowHeight   := 150
      LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) , UiRowSearch(SearchFor), UiRowContent(SearchFor), A_LoopFilePath)
      ;LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated))
      LV_ModifyCol(1,300)
      LV_ModifyCol(2,100)
      LV_ModifyCol(3,140)
      LV_ModifyCol(4,500)
      LV_ModifyCol(5,500)
}
TrayTip , "Search for " %SearchFor% , "Search Completed" , 10, NoIcon
return

ExpSearch:
Gui, Submit, Nohide
LV_Delete()  ;------------------------------------------------------------------/ clear list before displaying search results 
;Loop, %A_WorkingDir%\data\* ;*.txt*
;Loop, %A_WorkingDir%\Adventure\Include\*.ahk*

Loop, %A_WorkingDir%\*

{
   FileRead, TMP_fileContent, %A_LoopFileFullPath%
   IfInString, TMP_fileContent, %SearchFor%
   ;IfInString, A_LoopReadLine, %SearchFor%
   ;Loop, read, TMP_fileContent
   ;IfInString, A_LoopReadLine, %strToFind%
   
;   Gui, -DPIScale        
;RowHeight   := 150
      LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated) , ExpRowSearch(SearchFor), ExpRowContent(SearchFor))
      ;LV_Add("", A_LoopFileName, CTime(A_LoopFileTimeCreated))
      LV_ModifyCol(1,215)
      LV_ModifyCol(2,100)
      LV_ModifyCol(3,140)
      LV_ModifyCol(4,1000)
}
return




RefreshDirectory:


Gui, Submit, NoHide
GuiControlGet, CurrDirectory
;MsgBox, %CurrDirectory%
SetWorkingDir %CurrDirectory%
ToolTip, %PrevLineAppend% %CurrDirectory%
sleep 2500
Tooltip
gosub Refresh
Return


/*
Add Separator Line options




*/


UiRowSearch(String)  {
  Gui, Submit, NoHide
  Loop, Read, %A_LoopFileFullPath%
    If InStr(A_LoopReadLine, String)
    {
     RowNum := RowNum  A_Index UiDelimeter
    
    ;FileReadLine, OutputVar, Filename, LineNum
    }
   RowNum := "`n" . UiEscDelimeter . UiEscDelimeter . RowNum
    /*
    {
      ;MsgBox, 4,, "%String%" found on the line %A_Index%.`nContinue?
      ;IfMsgBox, No
      RowNum := A_Index
        Return RowNum
    }
    */
    Return RowNum
  }
;MsgBox, The end of the file.
UiRowContent(String)  {
  Loop, Read, %A_LoopFileFullPath%
    If InStr(A_LoopReadLine, String)
    {
    FileReadLine, RowInfo, %A_LoopFileFullPath%, A_Index
    ;RowInfo := chr(34) chr(34) chr(34) chr(34) RowInfo chr(34) chr(34) chr(34) chr(34)
         
     ;GuiControlGet, PrevLineAppend    
     GuiControlGet, StartingChar
     GuiControlGet, EndingChar
     GuiControlGet, StartingChar0
     GuiControlGet, EndingChar0
     
     LastRowInfo := ""
     LRdelimeter := ""
            If(PrevLineAppend = 1) {
            LastLine := A_Index-1
            
            FileReadLine, LastRowInfo, %A_LoopFileFullPath%, LastLine

            If(StartingChar0 != 1 OR EndingChar0 != "") {
            LastRowInfo := SubStr(LastRowInfo, StartingChar0, EndingChar0)
            ;MsgBox % StartingChar0 . EndingChar0 . PrevLineAppend . LastRowInfo
            }
            
            LRdelimeter := "----"
            ;MsgBox, %PrevLineAppend%   %LastRowInfo%   %LastLine%
            ;MsgBox % StartingChar0 . EndingChar0
        }
     If(StartingChar != 1 OR EndingChar != "") {
         RowInfo := SubStr(RowInfo,StartingChar,EndingChar)
     }
     ;FullRowInfo := FullRowInfo RowInfo UiDelimeter
     FullRowInfo := FullRowInfo LastRowInfo LRdelimeter RowInfo UiDelimeter
     ;FileReadLine, OutputVar, Filename, LineNum
    }
 
   FullRowInfo := "`n" . UiEscDelimeter . UiEscDelimeter . FullRowInfo
    /*
    {
      ;MsgBox, 4,, "%String%" found on the line %A_Index%.`nContinue?
      ;IfMsgBox, No
      RowNum := A_Index
        Return RowNum
    }
    */
    Return FullRowInfo
  }
  

;Edit_SelectLine(1, false,"Display","")
;clipboard := FindNext(TMP_fileContent, SearchFor, Flags, RegEx, FromCurrentPos)
;tf_find()

Return



LineJumpSubmit:
Gui, Submit, NoHide
 

If ( LineJumpTo != "" ) {
    SearchTerm := LineJumpTo
}
else {
    SearchTerm := SearchFor
}
sleep 500
ControlFocus, Edit7, A
ControlGetFocus, activeControlVar, A
ControlGetText, windowText, %activeControlVar%, A
	counter := 1
	dValue := []
	dPosition := []
	dLength := []
    RegSrchKey := "Oi)" . SearchTerm
Loop
{ 
	RegExMatch(windowText, RegSrchKey, delimiter, counter)
	counter := delimiter.Pos + delimiter.Len
    delimiterPos := delimiter.Pos
    delimiterLen := delimiter.Len
    delimiterValue := delimiter.Value
    ;MsgBox %RegSrchKey% | %counter% | %delimiterPos% | %delimiterLen% | %delimiterValue%
		if (delimiter.Value = "" )
			break
		dValue.Push(delimiter.Value)
		dPosition.Push(delimiter.Pos)
		dLength.Push(delimiter.Len)
}
	VarSetCapacity(Pos1, 20, 0), VarSetCapacity(Pos2, 20, 0)
	SendMessage, 0x00B0, &Pos1, &Pos2, %activeControlVar%, A
	Pos1 := NumGet(Pos1), Pos2 := NumGet(Pos2)
Loop
	{
	If(Pos2 < dPosition[A_Index])
	{
		Start := dPosition[A_Index] -1
		End := Start + dLength[A_Index]
		break
	}
	Else 
		If(dPosition[A_Index] = "")
		{
		Start := dPosition[1] -1
		End := Start + dLength[1]
		break
		}
	}
SendMessage, 0xB1,% Start, % End, %activeControlVar%, A
Send ^{Left}
sleep 50
send +^{right}
Return 



ExpRowSearch(String)  {
  Loop, Read, %A_LoopFileFullPath%
    If InStr(A_LoopReadLine, String)
    {
     RowNum := RowNum  A_Index delimeter
    
    ;FileReadLine, OutputVar, Filename, LineNum
    }
   RowNum := "`n" . EscDelimeter . EscDelimeter . RowNum
    /*
    {
      ;MsgBox, 4,, "%String%" found on the line %A_Index%.`nContinue?
      ;IfMsgBox, No
      RowNum := A_Index
        Return RowNum
    }
    */
    Return RowNum
  }
;MsgBox, The end of the file.
ExpRowContent(String)  {
  Loop, Read, %A_LoopFileFullPath%
    If InStr(A_LoopReadLine, String)
    {
    ;MsgBox, %PrevLineAppend%   %LastRowInfo%   %LastLine%
    LastRowInfo := ""
    LRdelimeter := ""
    FileReadLine, RowInfo, %A_LoopFileFullPath%, A_Index
    
        If(PrevLineAppend = 1) {
            LastLine := A_Index-1
            FileReadLine, LastRowInfo, %A_LoopFileFullPath%, LastLine
            GuiControlGet, StartingChar0
            GuiControlGet, EndingChar0
            If(StartingChar0 != 1 OR EndingChar0 != "") {
            LastRowInfo := SubStr(LastRowInfo, StartingChar0, EndingChar0)
            }
            
            LRdelimeter := "----"
            ;MsgBox, %PrevLineAppend%   %LastRowInfo%   %LastLine%
        }
    ;RowInfo := chr(34) chr(34) chr(34) chr(34) RowInfo chr(34) chr(34) chr(34) chr(34)
     GuiControlGet, StartingChar
     GuiControlGet, EndingChar
     
     If(StartingChar != 1 OR EndingChar != "") {
         RowInfo := SubStr(RowInfo,StartingChar,EndingChar)
     }
     
     FullRowInfo := FullRowInfo LastRowInfo LRdelimeter RowInfo delimeter
     ;FileReadLine, OutputVar, Filename, LineNum
    }
   FullRowInfo := "`n" . EscDelimeter . EscDelimeter . FullRowInfo
    /*
    {
      ;MsgBox, 4,, "%String%" found on the line %A_Index%.`nContinue?
      ;IfMsgBox, No
      RowNum := A_Index
        Return RowNum
    }
    */
    Return FullRowInfo
  }

CSV_LVSave(FileName, Delimiter=",",OverWrite=1, Gui=1)
  {
	Gui, %Gui%:Default
	Rows := LV_GetCount()
	Cols := LV_GetCount("Col")

;Gui, ListView, MainLV

LV_GetText(oCol1, 0, 1)
LV_GetText(oCol2, 0, 2)
LV_GetText(oCol3, 0, 3)
LV_GetText(oCol4, 0, 4)
;Loop % LV_GetCount() {
  oLine := oCol1 Delimiter oCol2 Delimiter oCol3 Delimiter oCol4 Delimiter "`n"
 	
;  LV_GetText(oCol1, A_index, 1)
;  LV_GetText(oCol2, A_index, 2)
;  LV_GetText(oCol3, A_index, 3)
;  LV_GetText(oCol4, A_index, 4)
	
	IfExist, %FileName%
	  If OverWrite = 0
	    Return 0
	
	FileDelete, %FileName%
	
	Loop, %Rows%
	  {
		  FullRow =
		  Row := A_Index
		  
		  Loop, %Cols%
		    {
	          LV_GetText(CellData, Row, A_Index)
			  FullRow .= CellData
			  
			  If A_Index <> %Cols%
			    FullRow .= Delimiter
		    }
		
			If Row <> %Rows%
			  FullRow .= "`n"
			  
			EntireFile .= FullRow
		}
        
    
    String = %EntireFile%
CheckStr := StrSplit(String, "`n")

CheckStrFull := ""

;for k, v in CheckStr
    CheckStrFull.=v

OutLine := []
Outputline := ""

Loop 20000 ;Max Results per File
{

ResLine := CheckStr[CheckStr.MaxIndex()]
CheckStr.Pop()
ResLineNum := CheckStr[CheckStr.MaxIndex()]
CheckStr.Pop()
;ResLineFile := CheckStr[CheckStr.MaxIndex()]
;CheckStr.Pop()
;OutLine = `n`;`; %ReslineNum% `; %ResLine%
;If Not ReslineNumArr
;    Break

ReslineNumArr := StrSplit(ReslineNum, EscDelimeter)

;CheckStrFull := ""

;for k, v in CheckStr
;    CheckStrFull.=v
    
ResLineArr := StrSplit(Resline, EscDelimeter)

;ResLineFile := 

;OutLine.Insert(1,CheckStr[CheckStr.MaxIndex()])
OutLine.Push(CheckStr[CheckStr.MaxIndex()])
Loop 20000 ;Max Resulting Files
{
CountRes := ReslineNumArr.Count()

;If ( ReslineNumArr[A_Index] = "" ) {
;    Break
;    }

OutLine.Push(EscDelimeter,EscDelimeter,ReslineNumArr[A_Index],EscDelimeter,ReslineArr[A_Index],EscDelimeter,"`n")
;Col1 := ReslineNumArr[A_Index] 
;Col2 := ReslineArr[A_Index]
;OutLine := Col1 . Col2

;ResLine.Pop()

If ( A_Index = CountRes ) {
    Break
}


}
;VerifyStr := CheckStr[1]

;CheckStrFull := ""

CheckStr.Pop()




Outputline := ""

for k, v in OutLine
    Outputline .= v ;OutLine[A_Index]
    
    ;FinalEntry := StrGet(Outputline.MaxIndex())
;MsgBox %Outputline%

If ( CheckStr.Count() = 0) {
  Break  
}

/*

;MsgBox %OutLine% ;%ResLine% %ResLineNum%
For index, value in OutLine 
MsgBox % "Item " index " is '" value "'"
*/
}

;MsgBox %Outputline%
FileDelete, %FileName%

    SepNote := "sep=" . Delimiter . "`n"
    FileAppend, %SepNote%, %FileName%
    FileAppend, % oLine, % FileName
;    FileAppend, %EntireFile%, %FileName%
    FileAppend, % Outputline , % FileName
    

    
;    FileAppend, %SepNote%, %FileName%
;    FileAppend, % oLine, % FileName
;    FileAppend, %EntireFile%, %FileName%
    
    
  }

