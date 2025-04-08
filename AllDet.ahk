#NoEnv
#SingleInstance force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

#include UIAutomation-main\Lib\UIA_Interface.ahk
#include UIAutomation-main\Lib\UIA_Browser.ahk
UIA := UIA_Interface() ; Initialize UIA interface
cUIA := new UIA_Browser("ahk_exe chrome.exe")
#include NaviSN.ahk
/*
Gui, Margin, 5, 5
Gui, Font, s14 Bold
Gui, Add, Progress, w200 h20  vMyProgress, 4
Gui, Show, AutoSize

CoordMode, Pixel, Screen

Gosub WinCheck

CoordMode, Mouse, Screen
GuiControl,, MyProgress, +16
PaDetail := WinExist("HIT Admin - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %PaDetail%
WinWaitActive, ahk_id %PaDetail%
PaDetail := UIA.ElementFromHandle(PaDetail)
cUIA := new UIA_Browser("HIT Admin - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")



VarProc := WinExist("VarProcessing.xlsm - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN")
WinActivate, ahk_id %VarProc%
WinWaitActive, ahk_id %VarProc%
VarProc := UIA.ElementFromHandle(VarProc)

send ^g
send A:F
send {Enter}
send, {del}
sleep, 1000


GuiControl,, MyProgress, +16

SeNowDet := WinExist("ServiceNow - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %SeNowDet%
WinWaitActive, ahk_id %SeNowDet%
SeNowDet := UIA.ElementFromHandle(SeNowDet)

caseNum := caseNum()
;caseNumEl := SeNowDet.WaitElementExist("ControlType=Edit AND Name='—'")
;caseNum := caseNumEl.CurrentValue

ResExist := ResExist()


sleep 500

;ResNotesEl.CurrentValue := ResNotes
policyNum := policyNumEl()
policyNum := policyNum.currentvalue

clipboard := policyNum
;ExitApp

;pErrCheck := CheckPolicy()

If ( pErrCheck != "") {
    Notify()
    msgbox Check Policy number in SeNow
    ExitApp
}


GuiControl,, MyProgress, +16
*/
PaDetail := WinExist("HIT Admin - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %PaDetail%
WinWaitActive, ahk_id %PaDetail%
PaDetail := UIA.ElementFromHandle(PaDetail)
cUIA := new UIA_Browser("HIT Admin - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")

/*
send, ^l
sleep 250
clipboard = https://hitadmin.havenlife.com/policyadmin/life/%policyNum%
sleep 500
send ^v
sleep 150
send {enter}
sleep 7000
*/
PaDetail.WaitElementExist("ControlType=ToolBar").Click()

Method := PaDetail.WaitElementExist("ControlType=Button AND  AutomationId='payment-method-section-0-accordion-header'",,,,60000)
Method := Method.GetCurrentPatternAs("ExpandCollapse")
;sleep 2000
Method.Expand()
;Sleep 2000
;Add := Add.GetCurrentPatternAs("ExpandCollapse")
;sleep 2000
;Add.Expand()

;PaDetail.WaitElementExist("ControlType=TabItem AND Name='DETAILS' AND AutomationId='pa-details-tab'",,,,60000).Click()
sleep, 1000
OAdd := PaDetail.WaitElementExist("ControlType=Button AND AutomationId='Owner-section-0-accordion-header'",,,,60000)
OAdd := OAdd.GetCurrentPatternAs("ExpandCollapse")
;sleep 2000
OAdd.Expand()
IAdd := PaDetail.WaitElementExist("ControlType=Button AND AutomationId='Insured-section-0-accordion-header'",,,,60000)
IAdd := IAdd.GetCurrentPatternAs("ExpandCollapse")
;sleep 2000
IAdd.Expand()
PAdd := PaDetail.WaitElementExist("ControlType=Button AND AutomationId='payment-payer-section-0-accordion-header'",,,,60000)
PAdd := PAdd.GetCurrentPatternAs("ExpandCollapse")
;sleep 2000
PAdd.Expand()
vclipboard := cUIA.GetAllText()
curPol := vclipboard
vclipboard := Consolidate(vclipboard)
vclip0 := PaDetail.WaitElementExist("ControlType=Document AND  AutomationId='pa-payments-card'",,,,60000)
vclip0 := vclip0.DumpAllText()
vclip0 := Consolidate(vclip0)
sleep 1000
clipboard := vclip0 Chr(13) vclipboard
;run RemoveExcessEnters.ahk
Gosub Done
/*
VarProc := WinExist("VarProcessing.xlsm - Excel ahk_exe EXCEL.EXE ahk_class XLMAIN")
WinActivate, ahk_id %VarProc%
WinWaitActive, ahk_id %VarProc%
VarProc := UIA.ElementFromHandle(VarProc)

sleep, 250

send ^g
send A1
send {Enter}

sleep, 250
Send, {F17}
sleep, 1000

send ^g
send F1
send {Enter}
sleep, 250
Send, %caseNum%
sleep, 150
Send, {enter}


send ^g
send I1:I11
send {Enter}
sleep, 750
send ^c
sleep 750


wNotes := clipboard
wNotes := StrReplace(wNotes, chr(34))
sleep, 250
wNotes := SubStr(wNotes,1,-2)

send ^g
send L9
send {Enter}
sleep 250
send ^c
sleep 250
resNotes := clipboard
resNotes := SubStr(resNotes,1,-2)

sleep 250
send {Escape}
sleep 250

GuiControl,, MyProgress, +16
SeNowDet := WinExist("ServiceNow - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %SeNowDet%
WinWaitActive, ahk_id %SeNowDet%
SeNowDet := UIA.ElementFromHandle(SeNowDet)
sleep 500

;SecChk := SeNowDet.WaitElementExist("ControlType=Edit AND Name='Correlation display'",,,,3000)

;SecChkV = SecChk.CurrentName

;If ( SecChkV != "" ) {
    
;SectionChk.Click()


;sleep 2000

;}

;ResExist := SubStr(caseNum, 1, 3)

if ( ResExist = "FSC" ) {

SeNowDet.WaitElementExist("ControlType=MenuItem AND Name='Jump to section navigation'").Click()

SeNowDet.WaitElementExist("ControlType=MenuItem AND Name='Resolution Information' AND AutomationId='2'").Click()

SeNowDet.WaitElementExist("ControlType=ComboBox AND Name='Resolution code'",,2).Click()
sleep 500
SeNowDet.WaitElementExist("ControlType=ListItem AND Name='Other' AND AutomationId='other'",,2).Click()
clipboard := resNotes
sleep 250
send {Tab}{Tab}{Tab}{Tab}{Tab}
;resNotesEl := SeNowDet.WaitElementExist("ControlType=Edit AND Name='Resolution notes'",,2)
sleep 250
send ^a
sleep 250
;resNotesEl.CurrentValue := resNotes
;send %resNotes%
send ^v
sleep 500

}


needAttnCB := SeNowDet.WaitElementExist("ControlType=CheckBox AND Name='Needs attention'",,3)
needAttnCB := needAttnCB.GetCurrentPatternAs("Toggle")
needAttnCB.CurrentToggleState := 0
;clipboard := togglePattern.CurrentToggleState

sleep 500


/*
GuiControl,, MyProgress, +16

PaDetail := WinExist("HIT Admin - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1")
WinActivate, ahk_id %PaDetail%
WinWaitActive, ahk_id %PaDetail%
PaDetail := UIA.ElementFromHandle(PaDetail)
sleep 1000
*/


ExitApp
Return

Done:
ToolTip , Done, 50, 50
sleep 3000
ToolTip
Return

WinCheck:
CoordMode, Pixel, Screen
PixelGetColor, cExcelCheck, 2068, 609, Fast RGB
PixelGetColor, cHitCheck, 2919, 503, Fast RGB
PixelGetColor, cServNowCheck, 4035, 1090, Fast RGB
PixelGetColor, Queue, 1194, 651, Fast RGB
sleep,500

if (cExcelCheck !=0xCCFFFF) {
ExitApp
}
sleep,500
if (cHitCheck !=0x252E36) {
ExitApp
}
sleep,500
if (cServNowCheck !=0x181826) {
ExitApp
}
if (Queue =0xFFC7CE) {
ExitApp
}

return
;