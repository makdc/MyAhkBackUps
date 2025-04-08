#KeyHistory 100
#include UIAutomation-main\Lib\UIA_Interface.ahk
#include UIAutomation-main\Lib\UIA_Browser.ahk
#include NaviSN.ahk
#include TF.ahk
#include Notify.ahk
#Include ImagePut.ahk


Gui Font, s8
Gui Add, CheckBox, x60 y288 w50 h24 gKeepAwake vWakeCheck, Awake
Gui Add, Button, x110 y278 w25 h20 gBPoint, &•
Gui Add, Button, x110 y298 w25 h20 gSmChi, &ᵡ
Gui Add, Button, x135 y278 w50 h20 gAlphaNumeric, &AlNum
#SingleInstance Force
#NoEnv
#InstallKeybdHook
#InstallMouseHook
Gui Add, Button, x135 y298 w50 h20 gPlainTextCopy, &COPY
Gui Add, CheckBox, x10 y288 w50 h24 gOnTopCheck vCheck, OnTop
Gui Font, s25
Gui Add, Button, x185 y278 w50 h40 gClipbrdHistory, ≡
Check = 1
Wake = 1

Gui Font, s8
Gui Add, Tab3, x8 y0 w228 h280, Text|Clips|Tools|Dates|Processing
Gui Font, s10, Verdana
Gui Tab, Text
Gui Add, Button,  x16 y40 w100 h50 gPlainTextCopy, &Copy as plain text
Gui Add, Button,   x128 y40 w100 h50 gTitleCase, &Title Case
Gui Add, Button,  x16 y100 w100 h50 gUpperCase, &UPPERCASE
Gui Add, Button,  x128 y100 w100 h50 gLowerCase, &lowercase
Gui Add, Button, x16 y198 w100 h50 gRemoveExcessEnters, &Remove Excess Enters
Gui Add, Button, x128 y198 w100 h50 gDoubleSpaced, &Double Line Space
Gui Add, Text, x23 y158 w198 h2 +0x10
Gui Add, Text, x23 y262 w198 h2 +0x10
Gui Font
Gui Font, s8
Gui Add, Text, x16 y166 w210 h23 +0x200, Experimental, may not work everywhere:
Gui Font
Gui Tab, Clips
Gui Add, Button,  x16 y40 w100 h50 gClipbrdHistory, Clipboard &History
Gui Add, Button,  x16 y100 w100 h50 gClrRefresh, &Clear + Refresh
Gui Add, Text, x16 y258 w210 h24 +0x200, The symbol █ marks the current clipboard
Gui Add, Text,   x128 y40 w100 h24 +0x200, Max Historical Entries 
Gui Add, Edit, x128 y54 w50 h24
Gui Add, UpDown, x178 y54 w17 h24 vMAX_CLIPS Range1-85, 50
Gui Tab, Tools
Gui Add, Button,  x16 y40 w100 h50 gInputCodes, &Input Codes
Gui Add, Button,   x128 y40 w100 h50 gKeyHist, &Key History
Gui Add, Button,  x16 y100 w100 h50 gSoundCardAnalysis, &Sound Card Analysis
Gui Add, Button,  x128 y100 w100 h50 gWindowSpy, &Windows Details
Gui Add, Button,  x16 y160 w50 h50 gWebText, &All Text
Gui Add, Button,  x66 y160 w50 h50 gSpecWebText, &Part Text
Gui Add, Button,  x128 y160 w50 h50 gWebElements, &All Elements 
Gui Add, Button,   x178 y160 w50 h50 gSpecWebElements, &Part Elements
Gui Add, Button,  x16 y220 w100 h50 gConCor, &Toggle ConCor Folders
Gui Add, Button,   x128 y220 w50 h50 gSaveWin, &Save Win
Gui Add, Button,   x178 y220 w50 h50 gLoadWin, &Load Win
Gui Tab, Date
Gui Add, Button,  x16 y40 w50 h50 gToday, &Today
Gui Add, Button,  x66 y40 w50 h50 gYesterday, &Yesterday
Gui Add, Button,  x128 y40 w50 h50 gWeekAgo, &A Week Ago
Gui Add, Button,  x178 y40 w50 h50 g2WeeksAgo, &2 Weeks Ago

Gui Add, Button,  x16 y100 w50 h50 gPast1Months, &1 Month Ago
Gui Add, Button,  x66 y100 w50 h50 gPast3Months, &3 Months Ago
Gui Add, Button,  x128 y100 w50 h50 gPast12Months, &1 Year Ago
Gui Add, Button,  x178 y100 w50 h50 gPast36Months, &3 Years Ago

;Gui Add, Button,  x16 y160 w50 h50 gYTD, &WTD
Gui Add, Button,  x66 y160 w50 h50 gMTD, &MTD
;Gui Add, Button,  x128 y160 w50 h50 gMTD, &QTD
Gui Add, Button,  x178 y160 w50 h50 gYTD, &YTD
;Gui Add, Button,  x16 y220 w100 h50 gNPatch, &New Patch
;Gui Add, Button,  x128 y220 w100 h50 gOPatch, &Confirm Patch
Gui Tab, Processing
Gui Add, Button,  x16 y40 w100 h50 gLightWorldRecipeAdapter, &LW Recipe Adapt
Gui Add, Button,  x128 y40 w50 h50 gRemoveBoxes, &RemoveBoxes
Gui Add, Button,  x178 y40 w50 h50 gSaveClipImg, &SaveClipImg
Gui Add, Button,  x16 y100 w50 h50 gSendingRaw, &Send Raw
Gui Add, Button,  x66 y100 w50 h50 gAddFinNotes, &AddFinNotes
Gui Add, Button,  x128 y100 w50 h50 gRemoveExtraSpaces, &RemoveExtraSpaces
Gui Add, Button,  x178 y100 w50 h50 gReplaceReturns, &Replace Returns
;Gui Add, Button,  x128 y100 w50 h50 gACH2DB, &To DB
;Gui Add, Button,  x178 y100 w50 h50 gACH2ACH, &To ACH
;Gui Add, Button,  x128 y160 w50 h50 gAddChange, &Address Change
;Gui Add, Button,  x178 y160 w50 h50 gAllDet, &All Det
;Gui Add, Button,  x16 y160 w50 h50 gRefProc, &C486
;Gui Add, Button,  x66 y160 w50 h50 gRefProc0, &Z0O6
;Gui Add, Button,  x16 y220 w50 h50 gNPatch, &New Patch
;Gui Add, Button,  x66 y220 w50 h50 gOPatch, &Confirm Patch
;Gui Add, Button,   x128 y220 w50 h50 gBMRep, &BM Rep

;Gui Add, Button, x128 y168 w100 h50 gWebElements, &All Text
Gui, Submit
;GuiControl,, HistEnt, New text line 1.`nNew text line 2.
Gui Show, w244 h324, OnTheFlyEditor

Gui, Submit, NoHide
    If Check = 1
    {
        Gui, +AlwaysOnTop
    }
    else
    {
        Gui, -AlwaysOnTop
    }


LastClip = 0
Menu TRAY, Icon, Shell32.dll, 22, 1
SetTimer WatchWait, -1000

#include Simple Window Manager.ahk

Return

sleep, 1000

;MaxHistEntries:
;MAX_CLIPS = 10
/*
+z::

WDTraining := WinExist("Getting started - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %WDTraining%
WinWaitActive, ahk_id %WDTraining%
WDTraining := UIA.ElementFromHandle(WDTraining)

WDTraining.WaitElementExist("ControlType=Group AND Name='Button Trigger this button to go to the next slide'").Click()

LastWindow()
*/
!s::
;lastwindow()
sleep 500
Send !{PrintScreen}
sleep 500
Gosub SaveClipImg

Return

!F2::
run, C:\Windows\System32\DisplaySwitch.exe /internal
Return

SaveClipImg:

ext := "hello"
filepath = "C:\Users\malik\Pictures\"
;/::
ImagePutFile(Clipboard, filepath)
ToolTip %filepath%
sleep 5000
ToolTip 
Return


^+!v::
Gosub SendingRaw
Return

SendingRaw:
;lastwindow()
sleep 500
send %clipboard%
Return


!z::
grocerylist := WinExist("iCloud Notes — Mozilla Firefox ahk_exe firefox.exe ahk_class MozillaWindowClass")
WinActivate, ahk_id %grocerylist%
WinWaitActive, ahk_id %grocerylist%
grocerylist := UIA.ElementFromHandle(grocerylist)

CoordMode Mouse Screen

MouseGetPos, strtX, strtY

click, 1290, 111
sleep 1000
click, 1241, 327
sleep 250
MouseMove, strtX, strtY

;grocerylist.WaitElementExist("ControlType=Custom",,1).Click("left")

;grocerylist.WaitElementExist("ControlType=Button AND Name='Choose a style to apply to text'",,1).Click("left")

;grocerylist.WaitElementExist("ControlType=Button AND Name='Choose a style to apply to text'",,1).Click("left")

;grocerylist.WaitElementExist("ControlType=Edit AND Name='Subheading'",,1).Click("left")
Return
;*/
^1::
gosub LightWorldRecipeAdapter
Return

PgDn::
Loop , 23 {
    Gosub AddFinNotes
}
return


PgUp::

    Gosub AddFinNotes

Return



LightWorldRecipeAdapter:


sleep 500
loop 15 {
send {Backspace}
send {space}
send -
send {space}
send {down}
send {left}
send {end}
send {right}
sleep 500

}
;*/
;exitapp
return


Pause::
Gosub StoreRecipe
Return

StoreRecipe:

CoordMode Mouse Screen

MouseGetPos, strtX, strtY
;cUIA := new UIA_Browser("ahk_exe firefox.exe")
PnchFrk := WinExist("Punchfork — Mozilla Firefox ahk_exe firefox.exe")
WinActivate, ahk_id %PnchFrk%
WinWaitActive, ahk_id %PnchFrk%
PnchFrk := UIA.ElementFromHandle(PnchFrk)

DirectionsBtn := PnchFrk.WaitElementExist("ControlType=Hyperlink AND Name='Directions'")
DirectionsBtnScroll := DirectionsBtn.GetCurrentPatternAs("ScrollItem")
DirectionsBtnScroll.ScrollIntoView()
sleep 250
sleep 150
aLink := DirectionsBtn.CurrentValue
sleep 150
;msgbox % alink

Clipboard = %aLink%

/*
Return

DirectionsBtnScroll := DirectionsBtn.GetCurrentPatternAs("ScrollItem")
DirectionsBtnScroll.ScrollIntoView("False")
sleep 250
DirectionsBtn.Click("Right")
sleep 1500
Send l
sleep 150
;cUIA := new UIA_Browser("ahk_exe Paprika.exe")
*/
pprka := WinExist("Paprika Recipe Manager 3")
WinActivate, ahk_id %pprka%
WinWaitActive, ahk_id %pprka%
pprka := UIA.ElementFromHandle(pprka)


sleep 150
pprka.WaitElementExist("ControlType=Text AND Name='Browser'").Click("Left")
sleep 150

send ^l
sleep 250
send ^v
sleep 150
send {enter}
sleep 3500
pprka.WaitElementExist("ControlType=Text AND Name='Download'").Click("Left")
sleep 2050
pprka.WaitElementExist("ControlType=Button AND Name='Save'").Click("Left") ;.Click()
;send ^s
sleep 2000
pprka.WaitElementExist("ControlType=Text AND Name='Recipes'").Click("Left")

MouseMove, strtX, strtY

Return


RemoveExtraSpaces:
lastwindow( )
sleep 500
send ^c
sleep 250
clipboard:= StrReplace(clipboard,"    ","") 
sleep 500
send ^v
Return

ReplaceReturns:
lastwindow( )
sleep 500
send ^c
sleep 250
varclipboard:= clipboard
varclipboard:= StrReplace(varclipboard, chr(13)," ")
varclipboard:= StrReplace(varclipboard, chr(10)," ")

sleep 500
clipboard:= varclipboard
;send ^v
Return

RemoveBoxes:
lastwindow()
sleep 500
send ^c
sleep 250
clipboard:= StrReplace(clipboard,chr(9744),"")
sleep 250
clipboard:= StrReplace(clipboard,"    ","") 
sleep 500
send ^v
Return


AddFinNotes:

If WinExist("Future Collins 2024 Budget.xlsx - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN") {
    
}
else {
Return
}


TranSort := WinExist("Transaction History Sorting v2.xlsx - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN")
WinActivate, ahk_id %TranSort%
WinWaitActive, ahk_id %TranSort%
TranSort := UIA.ElementFromHandle(TranSort)


sleep 150
send ^c
sleep 150



KMBudget := WinExist("Future Collins 2024 Budget.xlsx - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN")
WinActivate, ahk_id %KMBudget%
WinWaitActive, ahk_id %KMBudget%
KMBudget := UIA.ElementFromHandle(KMBudget)

TransNotes := clipboard
TransNotes := StrReplace(TransNotes, chr(34))
TransNotes := StrReplace(TransNotes, chr(35))

EmptyNote := SubStr(TransNotes, 1, -2)


If ( EmptyNote != "" ) {
    
send +{f2}
sleep 1500
send %TransNotes%
sleep 1000
send {Escape}
sleep 1000
;send ^q

;Return

sleep 1000
send {Escape}
}
sleep 1000
send {Down}

TranSort := WinExist("Transaction History Sorting v2.xlsx - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN")
WinActivate, ahk_id %TranSort%
WinWaitActive, ahk_id %TranSort%
TranSort := UIA.ElementFromHandle(TranSort)

send {Down}

return

`::
ExitApp
















SoundCardAnalysis:
Run Soundcard Analysis.ahk
Return

WindowSpy:
Run WindowSpy.exe 
Return


BPoint:
Lastwindow()
DotPoint := Chr(8226)
send %DotPoint%
Return

SmChi:
Lastwindow()
SmallChi := Chr(7521)
send %SmallChi%
Return




WebText:
LastWindow()
Sleep, 500
cUIA := new UIA_Browser("A")
currWin := cUIA.GetCurrentDocumentElement()
Sleep, 500
/*
UIA := UIA_Interface()
CurrWinEl := WinExist("A")
CurrWinEl := UIA.ElementFromHandle(CurrWinEl)
CurrWin := CurrWinEl.FindFirstBy("ControlType=Document")
*/
If (CurrWin = "") {
     MsgBox No element found
}

;pCurrWin := CurrWin.FindByPath("P2")
aText := currWin.DumpAllText()
aText := Consolidate(aText)
Clipboard := aText
;Gosub RemoveExcessEntersInClip

GoSub Done
Return

SpecWebText:

LastWindow()
Sleep, 500
Test := UIA.GetfocusedElement()
aText := Test.Dumpalltext()
bText := Consolidate(aText)
Clipboard := bText
GoSub Done
Return
/*
WebText:

LastWindow()
Sleep, 500
cUIA := new UIA_Browser("A")
aText := cUIA.GetAllText()
Clipboard := aText

;Chr(13) Chr(13) aLinks
;aLinks := cUIA.GetAllLinks()
;aLinks := aLinks.DumpAll()
GoSub Done
Return
*/
WebElements:

LastWindow()
Sleep, 500
cUIA := new UIA_Browser("A")
Clipboard := aText
;Gosub RemoveExcessEntersInClip
GoSub Done
Return

SpecWebElements:
LastWindow()
Sleep, 500
cUIA := new UIA_Browser("A")
currWin := cUIA.GetfocusedElement()
Sleep, 500
/*
UIA := UIA_Interface()
CurrWinEl := WinExist("A")
CurrWinEl := UIA.ElementFromHandle(CurrWinEl)
CurrWin := CurrWinEl.FindFirstBy("ControlType=Document")
*/
If (CurrWin = "") {
     MsgBox No element found
}

;pCurrWin := CurrWin.FindByPath("P2")
aText := currWin.DumpAll()
Clipboard := aText
;Gosub RemoveExcessEntersInClip
GoSub Done
Return

Today:
LastWindow()
Sleep, 500
vDate := A_Now

Past12Months:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 12
vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate1%
return


Past36Months:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 36
vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate1%
return



YTD:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 0
vMonthStart := SubStr(vDate, 1, 4) "0101"
vDate1 := JEE_DateAddMonths(vMonthStart, -vNum, vFormat)
send %vDate1%
return

MTD:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 0
vMonthStart := SubStr(vDate, 1, 6) "01"
vDate1 := JEE_DateAddMonths(vMonthStart, -vNum, vFormat)
send %vDate1%
return



Done:
ToolTip , Done, 50, 50
sleep 3000
ToolTip
Return

KeyHist:
KeyHistory
return


ConCor:
Run ConCor.ahk
Return



InputCodes:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{

ogText = %Clipboard%
sleep, 500
varText:= ogText
charConvert:= chr(0)
uniConvert:= chr(0)
octConvert:= chr(0)
deciConvert:= chr(0)
ogTextVerify:= chr(0)

Loop {

charConvert:= charConvert . "{" . ord(varText) . "}"
uniConvert:= uniConvert . "{" . format("{:x}",ord(varText)) . "}"
octConvert:= octConvert . "{" . Format("{:o}", ord(varText)) . "}"
deciConvert:= deciConvert . "{" . Format("{:d}",ord(varText)) . "}"
ogTextVerify:= ogTextVerify . "{" . Format("{:c}",ord(varText)) . "}"


varText:= SubStr(varText,2)
sleep, 150
If ( SubStr(varText,1,1) = "" )
{
Break
}

Continue

}

msgbox %  "Original Text:  """ "" ogText """" chr(13) "Chars: " chr(32) chr(32) charConvert chr(13) "UniCodes: " chr(32) chr(32) uniConvert chr(13) "Octals: " chr(32) chr(32) octConvert chr(13) "Decimals: " chr(32) chr(32) deciConvert chr(13) "Verify Text: " chr(32) chr(32) ogTextVerify
*/
return
/*

=::
Gosub LightWorldRecipeAdapter

Return

/::
Gosub RemoveBoxes

return
*/

currWin := cUIA.GetCurrentDocumentElement()
Sleep, 500
/*
UIA := UIA_Interface()
CurrWinEl := WinExist("A")
CurrWinEl := UIA.ElementFromHandle(CurrWinEl)
CurrWin := CurrWinEl.FindFirstBy("ControlType=Document")
*/
If (CurrWin = "") {
     MsgBox No element found
}

;pCurrWin := CurrWin.FindByPath("P2")
aText := currWin.DumpAll()
vFormat := "MM/dd/yyyy"
vNum := 0
vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate1%
return

Yesterday:
LastWindow()
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := -1
;vDate := %A_Now% ; or whatever your starting date is 
EnvAdd, vDate, vNum, days
FormatTime, vDate, % vDate, % vFormat
;vDate += 1 , days
;MsgBox, %vDate%  ; The answer will be the date 31 days from now.
;vFormat := "MM/dd/yyyy"
;vNum := 0
;vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate%
return

WeekAgo:
LastWindow()
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := -7
EnvAdd, vDate, vNum, days
FormatTime, vDate, % vDate, % vFormat
send %vDate%
return

2WeeksAgo:
LastWindow()
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := -14
EnvAdd, vDate, vNum, days
FormatTime, vDate, % vDate, % vFormat
send %vDate%
return



Past1Months:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 1
vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate1%
return

Past3Months:
LastWindow()
Sleep, 500
vDate := A_Now
vFormat := "MM/dd/yyyy"
vNum := 3
vDate1 := JEE_DateAddMonths(vDate, -vNum, vFormat)
send %vDate1%
return

sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000

SaveWin:
;!r::
SaveAllWindows(mySavedWindowsFilePath)

Notify("Saved layout",,5)

;DetectHiddenWindows On
 
Return

LoadWin: 
;Load window profile
;#TAB::
RepositionWindows()
Notify("Loaded",,5)
;DetectHiddenWindows On
Return


ClrRefresh:
Gui, Submit, NoHide
Loop %MAX_CLIPS%
{
   SavedClip%A_Index% =
   SavedShortClip%A_Index% =
}
LastClip := 0
NewClip := 0
CurClip := 0
ToolTip Clipboard History Cleared.
SetTimer KillToolTip, % TIP_DELAY * -1000
Return


ClipbrdHistory:
Menu, ClipbrdHist, Add
Menu, ClipbrdHist, DeleteAll
Loop %LastClip%
{
  Menu, ClipbrdHist, Add, % ((A_Index = CurClip) ? " █ " : "") A_Index . ": " . SavedShortClip%A_Index%, ChangeClip
}
Menu, ClipbrdHist, show
return

ChangeClip:
CurClip := A_ThisMenuItemPos
Watch := 0
Clipboard := SavedClip%CurClip%
SetTimer WatchWait, -1000
return

AlphaNumeric:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{
   
Clipboard := RegExReplace(Clipboard, "[^[:alnum:]]")

}
Return
sleep, 1000



PlainTextCopy:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{
   
Clipboard = %Clipboard%

carriage:= chr(13) . chr(10)
clipboard:= StrReplace(clipboard,carriage, chr(13))
carriage:= chr(9)
clipboard:= StrReplace(clipboard,carriage, Chr(32) . Chr(32) . Chr(32))
sleep, 200
}
Return
sleep, 1000


KeepAwake:


;ControlGet, Wake,
;Gui, Submit, NoHide

Loop {
sleep 2000
ControlGet, WakeCheck, Checked
;MsgBox %WakeCheck%
If ( WakeCheck = 0 ) {
Break
}
MouseMove 1, 0,,R
sleep 10000
MouseMove 0, 1,,R
sleep 10000
MouseMove -1, 0,,R
sleep 10000
MouseMove 0, -1,,R
sleep 8000

If ( WakeCheck = 1 ) {
Continue
}



}
Return

OnTopCheck:
    Gui, Submit, NoHide
    If Check = 1
    {
        Gui, +AlwaysOnTop
    }
    else
    {
        Gui, -AlwaysOnTop
    }
Return



UpperCase:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{


StringUpper Clipboard, Clipboard

carriage:= chr(13) . chr(10)
clipboard:= StrReplace(clipboard,carriage, chr(13))
sleep, 200
send, ^v
sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000

LowerCase:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{

StringLower Clipboard, Clipboard

carriage:= chr(13) . chr(10)
clipboard:= StrReplace(clipboard,carriage, chr(13))
sleep, 200
send, ^v
sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000

RemoveExcessEnters:

clipsave := ClipboardAll

LastWindow()
sleep, 1000 
varClipboard = ""
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{
varClipboard = %Clipboard%


carriage6:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage5:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage4:= chr(10) . chr(10) . chr(10) . chr(10) 
carriage3:= chr(10) . chr(10) . chr(10) 
carriage2:= chr(10) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage6, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))

carriage6:= chr(13) . chr(13) . chr(13) . chr(13) . chr(13) . chr(13)
carriage5:= chr(13) . chr(13) . chr(13) . chr(13) . chr(13)
carriage4:= chr(13) . chr(13) . chr(13) . chr(13) 
carriage3:= chr(13) . chr(13) . chr(13) 
carriage2:= chr(13) . chr(13)

varClipboard:= StrReplace(varClipboard,carriage6, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage6:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage5:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage4:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(13) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage5:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage2:= chr(13) . chr(32) . chr(13) . chr(32)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10) . chr(32))


carriage5:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage4:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage2:= chr(13) . chr(32) . chr(13)

varClipboard:= StrReplace(varClipboard,carriage5, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(32) . chr(13) . chr(10))

sleep, 200
Clipboard = %varClipboard%
ClipWait,2
send, ^v
sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000

RemoveExcessEntersInClip:

/*
clipsave := ClipboardAll

;LastWindow()
sleep, 300 
varClipboard = ""
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{
varClipboard = %Clipboard%
*/
varClipboard = %Clipboard%
carriage6:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage5:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage4:= chr(10) . chr(10) . chr(10) . chr(10) 
carriage3:= chr(10) . chr(10) . chr(10) 
carriage2:= chr(10) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage6, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))

carriage6:= chr(13) . chr(13) . chr(13) . chr(13) . chr(13) . chr(13)
carriage5:= chr(13) . chr(13) . chr(13) . chr(13) . chr(13)
carriage4:= chr(13) . chr(13) . chr(13) . chr(13) 
carriage3:= chr(13) . chr(13) . chr(13) 
carriage2:= chr(13) . chr(13)

varClipboard:= StrReplace(varClipboard,carriage6, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage6:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage5:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage4:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(13) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage5:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage2:= chr(13) . chr(32) . chr(13) . chr(32)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10) . chr(32))


carriage5:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage4:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))


carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage2:= chr(13) . chr(32) . chr(13)

varClipboard:= StrReplace(varClipboard,carriage5, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(32) . chr(13) . chr(10))

sleep, 200
Clipboard = %varClipboard%
ClipWait,2
;send, ^v
sleep, 1000
;}
;Clipboard = %clipsave%
Return
sleep, 1000

DoubleSpaced:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
varClipboard = ""
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait, 1
if (ErrorLevel = 0)
{
varClipboard = %Clipboard%
ogVarClipboard = %varClipboard%
carriage4:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(13) . chr(10) . chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(13) . chr(10)


varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))

carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32)
carriage2:= chr(13) . chr(32) . chr(13) . chr(32)

varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10) . chr(32))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10) . chr(32))

carriage4:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage3:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)
carriage2:= chr(13) . chr(10) . chr(32) .  chr(13) . chr(10)

varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(13))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(13))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(13))

carriage4:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage3:= chr(13) . chr(32) . chr(13) . chr(32) . chr(13)
carriage2:= chr(13) . chr(32) . chr(13)

varClipboard:= StrReplace(varClipboard,carriage4, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(32) . chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(32) . chr(13) . chr(10))

carriage6:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage5:= chr(10) . chr(10) . chr(10) . chr(10) . chr(10)
carriage4:= chr(10) . chr(10) . chr(10) . chr(10) 
carriage3:= chr(10) . chr(10) . chr(10) 
carriage2:= chr(10) . chr(10)


varClipboard:= StrReplace(varClipboard,carriage6, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage5, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage4, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage3, chr(13) . chr(10))
varClipboard:= StrReplace(varClipboard,carriage2, chr(13) . chr(10))

carriage1:= chr(13) . chr(10) . chr(10)
varClipboard:= StrReplace(varClipboard,carriage1, chr(13) . chr(10))
carriage1:= chr(13) . chr(10)
varClipboard:= StrReplace(varClipboard,carriage1, chr(13) . chr(10) . chr(13) . chr(10))


sleep, 200
Clipboard = %varClipboard%
ClipWait,2
send, ^v
sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000


Return


TitleCase:

clipsave := ClipboardAll

LastWindow()
sleep, 300 
send, ^c
ClipWait, 1
if (ErrorLevel = 0)
{
sleep, 200
    
Text = %Clipboard% 
Text:=Titlecase(Text)
Clipboard = %Text%


carriage:= chr(13) . chr(10)
clipboard:= StrReplace(clipboard,carriage, chr(13))
sleep, 200
send, ^v
sleep, 1000
}
Clipboard = %clipsave%
Return
sleep, 1000


/*
TitleCase(Text,lang="en",ini="TitleCase.ini")
	{
	 settings:={}, pairs:=""
	 If !InStr(ini,"\")
		ini:=A_ScriptDir "\" ini
	 IfNotExist, %ini%
		TitleCase_Ini(ini)
	 IniRead, LangSection, %ini%, %lang%
	 Loop, parse, LangSection, `n, `r
		{
		 data:=StrSplit(A_LoopField,"=",2)
		 settings[data[1]]:=data[2]
		 if InStr(data[1],"_")
			{
			 pairdata:=StrSplit(A_LoopField,"_").1
			 If pairdata not in pairs
				pairs .= pairdata ","
			}
		}
	 StringLower, Text, Text, T
	 Text:=TitleCase_LowerCaseList(Text,settings.LowerCaseList)
	 Text:=TitleCase_UpperCaseList(Text,settings.UpperCaseList)
	 Text:=TitleCase_MixedCaseList(Text,settings.MixedCaseList)
	 Text:=TitleCase_ExceptionsList(Text,settings.ExceptionsList)
	 pairs:=trim(pairs,",")
	 loop, parse, pairs, CSV
		{
		 find:=settings[A_LoopField "_find"]
		 replace:=settings[A_LoopField "_replace"]
		 Text:=RegExReplace(Text,find,replace)
		}
	 Text:=TitleCase_AlwaysLowerCaseList(Text,settings.AlwaysLowerCaseList)

	 Text:=RegExReplace(Text,"^(.)","$U{1}") ; ensure first char is always upper case
	 Return Text
	}

TitleCase_LowerCaseList(Text,list)
	{
	 loop, parse, list, CSV
		Text:=RegExReplace(Text, "im)\b" A_LoopField "\b",A_LoopField)
	 Text:=RegExReplace(Text, "im)([’'`])s","$1s") ; to prevent grocer'S
	 Return Text
	}

TitleCase_UpperCaseList(Text,list)
	{
	 loop, parse, list, CSV
		Text:=RegExReplace(Text, "im)\b" A_LoopField "\b",A_LoopField)
	 Return Text
	}

TitleCase_MixedCaseList(Text,list)
	{
	 loop, parse, list, CSV
		Text:=RegExReplace(Text, "im)\b" A_LoopField "\b",A_LoopField)
	 Return Text
	}

TitleCase_ExceptionsList(Text,list)
	{
	 loop, parse, list, CSV
		Text:=RegExReplace(Text, "im)\b" A_LoopField "\b",A_LoopField)
	 Text:=RegExReplace(Text, "im)[\.:;] \K([a-z])","$U{1}") ; first letter after .:; uppercase
	 Return Text
	}
	
TitleCase_AlwaysLowerCaseList(Text,list)
	{
	 loop, parse, list, CSV
		Text:=RegExReplace(Text, "im)\b" A_LoopField "\b",A_LoopField)
	 Return Text
	}

; create ini if not present, that way we don't overwrite any user changes in future updates
TitleCase_Ini(ini)
	{
FileAppend,
(
; -------------------------------------------------------------------------------------------
; TitleCase - https://github.com/lintalist/TitleCase
; ------------------------------------------------------------------------------------------

[en]
LowerCaseList=a,an,and,amid,as,at,atop,be,but,by,for,from,if,in,into,is,it,its,nor,not,of,off,on,onto,or,out,over,past,per,plus,than,the,till,to,up,upon,v,vs,via,with
UpperCaseList=AHK,IBM,UK,USA
MixedCaseList=AutoHotkey,iPod,iPad,iPhone
ExceptionsList=
AlwaysLowerCaseList=
OrdinalIndicator_Find=im)\b(\d+)(st|nd|rd|th)\b
OrdinalIndicator_Replace=$1$L{2}
Hypen1_Find=im)-\K(.)
Hypen1_Replace=$U{1}
Hypen2_Find=im)-(and|but|for|nor|of|or|so|yet)-
Hypen2_Replace=-$L{1}-
)
, %ini%, UTF-16
	}
*/  
    
    
    
LastWindow() {
Global
    list := ""

    WinGet, id, list,,,Find	; "List" retrieves the Id of all the windows from top to bottom. I'm excluding "Find" window of notepad
    Loop, %id%
    {
        this_ID := id%A_Index%
		; Msgbox, % id%A_Index%
        IfWinActive, ahk_id %this_ID%
            continue	; "continue" returns to the beginning of the loop to start a new iteration. This skips the currently active window
        WinGetTitle, title, ahk_id %this_ID%
        If (title = "")	; this skips any windows with an empty title.
            continue
        If (!IsWindow(WinExist("ahk_id" . this_ID)))
            continue
        WinActivate, ahk_id %this_ID%, ,2
		DllCall("SetForegroundWindow", UInt, this_ID)	; required for a more reliable activation
            break
    }
return
}

;-----------------------------------------------------------------
; Check whether the target window is activation target
;-----------------------------------------------------------------
;;; https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles
IsWindow(hWnd){
    WinGet, dwStyle, Style, ahk_id %hWnd%
    if ((dwStyle&0x08000000) || !(dwStyle&0x10000000)) {	;; Window with a style that doesn't activate (WS_EX_NOACTIVATE 0x08000000L), or not visible (WS_VISIBLE 0x10000000 )
        return false
    }
    WinGet, dwExStyle, ExStyle, ahk_id %hWnd%
    if (dwExStyle & 0x00000080) {	; The window is a floating toolbar (WS_EX_TOOLWINDOW 0x00000080)
        return false
    }
    WinGet, dwExStyle, ExStyle, ahk_id %hWnd%
    if (dwExStyle & 0x00040000) {	; top-level windows that tend to be forced to the top
        return false
    }
    WinGet, dwExStyle, ExStyle, ahk_id %hWnd%
    if (dwExStyle & 0x00000008) {	; to exclude Always-On-top windows (WS_EX_TOPMOST 0x00000008)
        return false
    }
    WinGetClass, szClass, ahk_id %hWnd%	; this is an exception for TApplication Classes
    if (szClass = "TApplication") {
        return false
    }
	if IsWindowCloaked(hwnd){	; exclude "Cloaked" windows
		return false
	}
    return true
}
;; Cloaked windows exception
IsWindowCloaked(hwnd) {
    return DllCall("dwmapi\DwmGetWindowAttribute", "ptr", hwnd, "int", 14, "int*", cloaked, "int", 4) >= 0
        && cloaked
return
}



GuiEscape:
GuiClose:
    ExitApp









/*

;#a::
#Up::
   If (LastClip = 0)
      Return
   CurClip--
   If (CurClip < 1)
      CurClip := LastClip
   Temp := SavedShortClip%CurClip%
   ToolTip %Temp%
   SetTimer KillToolTip, % TIP_DELAY * -1000
   Watch := 0
   Clipboard := SavedClip%CurClip%
   SetTimer WatchWait, -1000
Return

;#z::
#Down::
   If (LastClip = 0)
      Return
   CurClip++
   If (CurClip > LastClip)
      CurClip := 1
   Temp := SavedShortClip%CurClip%
   ToolTip %Temp%
   SetTimer KillToolTip, % TIP_DELAY * -1000
   Watch := 0
   Clipboard := SavedClip%CurClip%
   SetTimer WatchWait, -1000
Return

;#x::
#Delete::
   If (LastClip = 0)
      Return
   SavedClip%CurClip% =
   SavedShortClip%CurClip% =
   Temp =
   Collapse(CurClip)
   ToolTip History Item Deleted.
   SetTimer KillToolTip, % TIP_DELAY * -1000
Return

;#+x::
#+Delete::
Loop %MAX_CLIPS%
{
   SavedClip%A_Index% =
   SavedShortClip%A_Index% =
}
LastClip := 0
NewClip := 0
CurClip := 0
ToolTip Clipboard History Cleared.
SetTimer KillToolTip, % TIP_DELAY * -1000
Return

*/




OnClipboardChange:
If (Watch = 0 OR A_EventInfo = 0 )
{
   Watch := 0                 ; For improved compatibility with
   SetTimer WatchWait, -1000  ; other AutoHotkey scripts that
   Return                     ; access the clipboard.
}
If (A_EventInfo = 1) ;Text
{
   NewClip++
   If ( NewClip > MAX_CLIPS)
      NewClip := 1
   If ( NewClip > LastClip)
      LastClip := NewClip
   CurClip := NewClip
   SavedClip%NewClip% := ClipboardAll
   Temp := Clipboard
   Temp := RegExReplace(Temp, "^\s*|\s*$", "")
   If (StrLen(Temp) > 100 OR InStr(Temp, "`n") )
      Temp := RegExReplace(Temp, "`as)^([^`r`n]{1,50}).*?([^`r`n]{1,50})$", "$1...`n...$2")
   SavedShortClip%NewClip% := SubStr(Temp,1, 250)
   Loop %LastClip%
   Temp =
}
Return

;#^x::
#^Delete::
Clipboard =
ToolTip Clipboard Cleared.
SetTimer KillToolTip, % TIP_DELAY * -1000
Return


Collapse(Position)
{
   Global
   If (CurClip > Position)
      CurClip--
   Loop ;While Position < LastClip
   {
      Temp := Position + 1
      SavedClip%Position% :=SavedClip%Temp%
      SavedShortClip%Position% :=SavedShortClip%Temp%
      Position++
      If (Position >= LastClip)
         Break
   }   
   SavedClip%LastClip% =
   SavedShortClip%LastClip% =
   LastClip--
   If (NewClip > LastClip)
      NewClip := LastClip
}

KillToolTip:
Tooltip
Return

WatchWait:
Watch := 1
Return




;==================================================

JEE_DateAddMonths(vDate, vNum, vFormat="")
{
vDate += 0, Seconds ;make date the standard 14-character format
vYear := SubStr(vDate, 1, 4)
vMonth := SubStr(vDate, 5, 2)
vDay := SubStr(vDate, 7, 2)
vTime := SubStr(vDate, 9)

vMonths := (vYear*12) + vMonth + vNum
vYear := Floor(vMonths/12)
vMonth := Mod(vMonths,12)
(!vMonth) ? (vYear -= 1, vMonth := 12) : ""

if (vMonth = 2) && (vDay > 28)
if !Mod(vYear,4) && (Mod(vYear,100) || !Mod(vYear,400)) ;4Y AND (100N OR 400Y)
vDay := 29
else
vDay := 28

if (vDay = 31)
if vMonth in 4,6,9,11
vDay := 30

(StrLen(vMonth)=1) ? (vMonth := "0" vMonth) : ""
(StrLen(vDay)=1) ? (vDay := "0" vDay) : ""
vDate := vYear vMonth vDay vTime
if !(vFormat = "")
FormatTime, vDate, % vDate, % vFormat
Return vDate

}