#include UIAutomation-main\Lib\UIA_Interface.ahk
#include UIAutomation-main\Lib\UIA_Browser.ahk
#include NaviSN.ahk
#include TF.ahk
#include Notify.ahk
#Include ImagePut.ahk
#Include GetUrl_UIA.ahk
#include WordWrap.ahk
#SingleInstance, force

global SecondClip

insert::
SecondClip = ""
cUIA := new UIA_Browser("ahk_exe firefox.exe")
;cUIA := new UIA_Browser("A")

Bdev := WinExist("Boot.dev — Mozilla Firefox ahk_exe firefox.exe ahk_class MozillaWindowClass")
WinActivate, ahk_id %Bdev%
WinWaitActive, ahk_id %Bdev%
Bdev := UIA.ElementFromHandle(Bdev)
;url := GetUrl([WinTitle, WinText, ExcludeTitle, ExcludeText])

/*
send ^l
sleep 50
send ^c
sleep 50
url := Clipboard
send {Escape}
MsgBox % url
*/

AssignmentSection := Bdev.WaitElementExist("ControlType=Button AND Name='Assignment'")
asnotes1 := AssignmentSection.FindByPath("P1")
asnotes2 := asnotes1.DumpAllText()
asnotes2 = %asnotes2%
carriage := chr(10)
asnotes2 := StrReplace(asnotes2, carriage, " ")
carriage0 := chr(13)
asnotes2 := StrReplace(asnotes2, carriage0, " ")
carriage1 := chr(13)
asnotes2 := StrReplace(asnotes2, carriage1, " ")

spaces := "  "
asnotes2 := StrReplace(asnotes2, spaces," ")
;spaces := "  "
asnotes2 := StrReplace(asnotes2, spaces," ")


;Clipboard := asnotes2
;asnotes2:= StrReplace(asnotes2,carriage,"")
;Bdev.WaitElementExist("ControlType=Edit AND Name='Submit'") ;.Click()
asnotes2 := WordWrapping(asnotes2, 50)


;MsgBox % asnotes3
;*/
WinGetTitle, ClickedTitle
;MsgBox % ClickedTitle
Bdev := WinExist(ClickedTitle)
WinActivate, ahk_id %Bdev%
WinWaitActive, ahk_id %Bdev%
Bdev := UIA.ElementFromHandle(Bdev)

FileTitleEL := AssignmentSection.FindByPath("P6")  ;FindFirstBy("Type=MenuItem AND Name='Assignment'",,2,2000)
FileTitleEL0 := FileTitleEL.FindFirstByNameAndType("CH", "MenuItem",,1,2000)
FileTitleEL1 := FileTitleEL.FindFirstByNameAndType("L", "MenuItem",,1,2000)
;Test := FileTitleEL1.Dumpall()
ChapterTitle := FileTitleEL0.currentname
LessonTitle := FileTitleEL1.currentname

FileTitle := ChapterTitle "-" LessonTitle ".sql" 
FileTitle := StrReplace(FileTitle, ": ","_")
FileTitle := StrReplace(FileTitle, " ","_")
FileTitle := StrReplace(FileTitle, "__","_")

;troubleshoot below
;FileTitle := "0 " FileTitleEL.currentname Chr(13) "1 " FileTitleEL0.currentname Chr(13) "2 " FileTitleEL1.currentname Chr(13) "3 " Test
;MsgBox % FileTitle
;SubmitSection := Bdev.WaitElementExist("ControlType=Edit")

/*
SubmitButton := Bdev.WaitElementExist("ControlType=Edit AND Name='Submit'") ;.Click()
SubmitSection := SubmitButton.FindByPath("P1-1")
ssnotes := SubmitSection.Value
SubmitSection.name
MsgBox % ssnotes.name  .  SubmitSection.name
*/

Bdev := WinExist("Boot.dev — Mozilla Firefox ahk_exe firefox.exe ahk_class MozillaWindowClass")
WinActivate, ahk_id %Bdev%
WinWaitActive, ahk_id %Bdev%
Bdev := UIA.ElementFromHandle(Bdev)
sleep 50
;cUIA := new UIA_Browser("A")
;currWin := cUIA.GetCurrentDocumentElement()
;sleep 50
BDurl := GetUrl("A")
;cUIA := new UIA_Browser("A")


;MsgBox % BDurl
;Bdev.WaitElementExist("ControlType=Header AND Name='amount'")

FullInfo := "/*" chr(13) BDurl chr(13) "Assignment" chr(13) chr(13) asnotes2 chr(13) "*/" chr(13) chr(13) "/*" chr(13) chr(13) "*/"

SecondClip := FullInfo
clipboard  := FileTitleToolTip % FileTitle chr(13) FullInfo
Sleep 3000
ToolTip

Return

^+v::

clipboard := SecondClip

Return

