!F2::
;~ run, C:\Windows\System32\DisplaySwitch.exe /external
run, C:\Windows\System32\DisplaySwitch.exe /internal
; run, C:\Windows\System32\DisplaySwitch.exe /clone
;~ run, C:\Windows\System32\DisplaySwitch.exe /extend
Return

XButton1::

send, ^c

return
;



XButton2::

send, ^v

return
;

#SingleInstance Force 

F1::



MouseGetPos, msX, msY, msWin, msCtrl
actWin := WinExist("A")

WinGetTitle, t1
WinGetClass, t2


PixelGetColor, mColor, %msX%, %msY%, RGB

/*

CoordMode, Mouse, Screen
MouseGetPos, msX, msY
CoordMode, Mouse, Relative
MouseGetPos, mrX, mrY
CoordMode, Mouse, Client
MouseGetPos, mcX, mcY


Clipboard = Screen: %msX%, %msY% (less often used)`nWindow: %mrX%, %mrY% (default)`nClient: %mcX%, %mcY% (recommended)`nColor: %mColor%

*/

mColor := SubStr(mColor,3)
Clipboard := mColor



return

;

F6::

CoordMode, Mouse, Screen
MouseGetPos, msX, msY

Clipboard = S.click, %msX%, %msY%


Return

;


F7::

CoordMode, Mouse, Relative
MouseGetPos, mrX, mrY

Clipboard = W.click, %mrX%, %mrY%

Return

;


F8::

CoordMode, Mouse, Client
MouseGetPos, mcX, mcY

Clipboard = C.click %mcX%, %mcY%


Return

;