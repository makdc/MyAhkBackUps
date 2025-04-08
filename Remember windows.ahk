; http://ahkscript.org/boards/viewtopic.php?f=6&t=5166

#Include TF.ahk
#Include Notify.ahk

; Settings: Saved to WindowList.txt
; Requires TF library to sort windows
; Save window profile (does not remember minimized windows):

!r::
RepositionWindows()
Notify("Saved layout",,5)

;DetectHiddenWindows On
 
Return
 
;Load window profile
#TAB::
DetectHiddenWindows Off

FileRead, WindowList, WindowList.txt
 
StringSplit,Rows,WindowList,"`n`r"
 
Loop, %Rows0%
{
        Win:=Rows%A_Index%
        StringSplit,Columns,Win,"|"
       
                        ;Restore if minimized
                       
                        Process, Exist, %Columns1%
                        IF errorlevel!=0
                        {
                                Minmax=
                                While (Minmax = "")
                                {
                                WinGet, MinMax, MinMax, ahk_exe %Columns1%
                                }
                               
                                If (MinMax = "-1")
                                {                      
                                        ;WinActivate, ahk_exe %Columns1%
                                        PostMessage, 0x112, 0xF120,,, ahk_exe %Columns1%
                                }
                        }
                       
                        ;Move to saved position
                        WinMove, ahk_exe %Columns1%,, %Columns2%, %Columns3%, %Columns4%, %Columns5%
                       
                        ;Maximize if saved as such
                        If (Columns6 = "1")
                        {
                                WinMaximize, ahk_exe %Columns1%
                        }
                       
                        ;Put the window at the top of other windows
                        WinSet, Top,, ahk_exe %Columns1%
}
 
DetectHiddenWindows On
Return