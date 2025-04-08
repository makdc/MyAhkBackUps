q::

send, +^r
sleep 500
send ^v
send {enter}
sleep 250
LastWindow()
sleep 250
send {down}
sleep 250
send ^c
return




   
LastWindow(){
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