#NoEnv
#SingleInstance force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

#include UIAutomation-main\Lib\UIA_Interface.ahk
#include UIAutomation-main\Lib\UIA_Browser.ahk
UIA := UIA_Interface() ; Initialize UIA interface
;cUIA := new UIA_Browser("ahk_exe Zoom.exe")

;Return
;.Click("Left",2)
;return
ExitApp
;F23::

If WinExist("Zoom Meeting")
{
Zoom := WinExist("Zoom Meeting ahk_exe Zoom.exe")
WinActivate, ahk_id %Zoom%
WinWaitActive, ahk_id %Zoom%
Zoom := UIA.ElementFromHandle(Zoom)


SoundGet, CompDefMic,, MUTE, 13
if ErrorLevel {
SoundGet, CompDefMic,, MUTE, 12
}


;CoordMode, Mouse, Screen
;sleep, 100	

;MouseGetPos, recallX, recallY

If  ( CompDefMic = "On")
 {
MuteMe := Zoom.WaitElementExist("ControlType=Button AND Name='Mute, currently unmuted, Alt+A'",,,,1000)
MuteMe.Click() ;"left")
;Zoom.WaitElementExist("ControlType=Window AND Name='Meeting Tools'",,,,5000)
;Zoom.WaitElementExist("ControlType=Button AND Name='Mute, currently unmuted, Alt+A'",,,,5000) ;.Click("left")
;pMuteMe :=  MuteMe.FindByPath("P1")
;Clipboard := pMuteMe.DumpAll()

 }
else if ( CompDefMic = "Off")
 {
UnMuteMe := Zoom.WaitElementExist("ControlType=Button AND Name='Unmute, currently muted, Alt+A'",,,,1000)
UnMuteMe.Click() ;"left")
;Zoom.WaitElementExist("ControlType=Window AND Name='Meeting Tools'",,,,5000)
;Zoom.WaitElementExist("ControlType=Button AND Name='Mute, currently muted, Alt+A'",,,,5000) ;.Click("left")
;pMuteMe :=  UnMuteMe.FindByPath("P1")
;Clipboard := pMuteMe.DumpAll()
 }
 }
;mousemove, %recallX%, %recallY%

;ToolTip , Done, 50, 50
;sleep 3000
;ToolTip


ExitApp



;sleep 2000

;GoSub PullVals



;GoSub PullVals

/*
sleep 1000

TCC.WaitElementExist("ControlType=Text AND Name='Participant:'").Click("Left")
sleep 100
send {tab}
sleep 100
send %edate%
*/

Return