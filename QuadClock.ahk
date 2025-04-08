SetFormat, float, 0.0 ; we don't deal with any decimal numbers
clock1 = 0 ; clocks start at 0 and count up
clock2 = 0
clock3 = 0
clock4 = 0
turn = 1 ; it's white's turn first
Gui Font, s8
; little outline boxes
Gui, Add, GroupBox, x100 y10 w116 h40,  
Gui, Add, GroupBox, x5 y100 w75 h50 
Gui, Add, GroupBox, x85 y100 w75 h50 
Gui, Add, GroupBox, x165 y100 w75 h50 
Gui, Add, GroupBox, x245 y100 w75 h50


; buttons
Gui, Add, Button, x7 y160 w71 h30 gClockOne, W 
Gui, Add, Button, x87 y160 w71 h30 gClockTwo, H
Gui, Add, Button, x167 y160 w71 h30 gClockThree, B 
Gui, Add, Button, x247 y160 w71 h30 gClockFour, M
Gui, Add, Button, x135 y200 w50 h30, Exit 
Gui Add, CheckBox, x10 y200 w50 h24 gOnTopCheck vCheckClock, OnTop
; text controls
Gui, Add, Text, x267 y2 w51 h45, Time`nClock`n1.0

Gui, Add, Text, x40 y55 w20 h38 vCounter1, |||`n|||`nV
Gui, Add, Text, x120 y55 w20 h38 vCounter2,
Gui, Add, Text, x200 y55 w20 h38 vCounter3,
Gui, Add, Text, x280 y55 w20 h38 vCounter4,

Gui, Font, s12, Times New Roman   
Gui, Add, Text, x6 y115 w73 h28 vClock1,
Gui, Add, Text, x91 y115 w73 h28 vClock2,
Gui, Add, Text, x166 y115 w73 h28 vClock3,
Gui, Add, Text, x246 y115 w73 h28 vClock4,
Gui, Font, s16, Times New Roman    
Gui, Add, Text, x105 y23 w100 h20 vTotalClock,



;Gui Add, CheckBox, x10 y180 w50 h24 gOnTopCheck vCheckClock, OnTop
CheckClock = 1
Gui, Show, x484 y377 h250 w325, Time Clock 1.0

Gui, Submit, NoHide
    If CheckClock = 1
    {
        Gui, +AlwaysOnTop
    }
    else
    {
        Gui, -AlwaysOnTop
    }
; MAIN LOOP here:  one loop per second
Loop
{
  Loop ; wait one second here
  {
    t := n
    sleep 500
    formattime, n, , ss    
    if (t <> n)      
      break           
  }   
  
  ; increment and display all clocks
  if turn = 1
    clock1++
  else if turn = 2
    clock2++
  else if turn = 3
    clock3++
  else if turn = 4
    clock4++


  
  
  clockT := clock1 + clock2 + clock3 + clock4

  c1 := FormatSeconds(clock1)
  c2 := FormatSeconds(clock2)
  c3 := FormatSeconds(clock3)
  c4 := FormatSeconds(clock4)  
  ;Formattime, c4, clock4, hh:mm:ss
  
  ct := FormatSeconds(clockT)
  ;Formattime, ct, clockT, hh:mm:ss
  
  GuiControl, , Clock1, %c1%
  GuiControl, , Clock2, %c2%
  GuiControl, , clock3, %c3%
  GuiControl, , clock4, %c4%
  GuiControl, , TotalClock, %ct%
}

ClockDone: ; change turns
;turn := !turn
if turn = 1
{
  GuiControl, , Counter1, |||`n|||`nV
  GuiControl, , Counter2, 
  GuiControl, , Counter3,
  GuiControl, , Counter4,
}
else if turn = 2
{
  GuiControl, , Counter1,
  GuiControl, , Counter2, |||`n|||`nV 
  GuiControl, , Counter3,
  GuiControl, , Counter4,
}
else if turn = 3
{
  GuiControl, , Counter1,
  GuiControl, , Counter2, 
  GuiControl, , Counter3, |||`n|||`nV
  GuiControl, , Counter4,
}
else if turn = 4
{
  GuiControl, , Counter1,
  GuiControl, , Counter2, 
  GuiControl, , Counter3,
  GuiControl, , Counter4, |||`n|||`nV
}
return;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ClockOne: ; change turns
turn := 1
Gui, Show ,NoActivate, W
GoSub ClockDone
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ClockTwo: ; change turns
turn := 2
Gui, Show ,NoActivate, H
GoSub ClockDone
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ClockThree: ; change turns
turn := 3
Gui, Show , NoActivate, B
GoSub ClockDone
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ClockFour: ; change turns
turn := 4
Gui, Show , NoActivate, M
GoSub ClockDone
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;










OnTopCheck:
    Gui, Submit, NoHide
    If CheckClock = 1
    {
        Gui, +AlwaysOnTop
    }
    else
    {
        Gui, -AlwaysOnTop
    }
Return

F7:: 
GoSub ClockOne
Return

F8:: 
GoSub ClockTwo
Return

F9:: 
GoSub ClockThree
Return

F10:: 
GoSub ClockFour
Return


ButtonExit:
GuiClose:
ExitApp

; fuction to turn any amount of seconds into a clock
FormatSeconds(secs)
{
Transform, Seconds, mod, %secs%, 60 ; 0 gives the remainder of seconds 
secs := secs - Seconds
mins := secs/60
Transform, Minutes, mod, %mins%, 60 ; 0 gives the remainder of minutes
mins := mins - Minutes
Hours := mins/60
if Hours > 99
  Hours = 99
time = %Hours% : %Minutes% : %Seconds% ; formulates the time display
return time
}