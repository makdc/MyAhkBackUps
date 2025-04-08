SetFormat, float, 0.0 ; we don't deal with any decimal numbers
clock1 = 0 ; clocks start at 0 and count up
clock2 = 0
turn = 1 ; it's white's turn first

; little outline boxes
Gui, Add, GroupBox, x106 y10 w110 h40,  
Gui, Add, GroupBox, x16 y60 w140 h50, 
Gui, Add, GroupBox, x166 y60 w140 h50, 

; buttons
Gui, Add, Button, x46 y130 w70 h30 gClockDone, Done! 
Gui, Add, Button, x206 y130 w70 h30 gClockDone, Done! 
Gui, Add, Button, x136 y170 w50 h30, Exit 
Gui Add, CheckBox, x10 y180 w50 h24 gOnTopCheck vCheckClock, OnTop
; text controls
Gui, Add, Text, x267 y2 w51 h45, Time`nClock`n1.0

Gui, Add, Text, x75 y20 w20 h38 vCounter1, |||`n|||`nV
Gui, Add, Text, x225 y20 w20 h38 vCounter2, 

Gui, Font, s16, Times New Roman   
Gui, Add, Text, x45 y73 w100 h30 vClock1,
Gui, Add, Text, x197 y73 w100 h30 vClock2,
Gui, Font, s14, Times New Roman    
Gui, Add, Text, x124 y23 w90 h20 vTotalClock,

;Gui Add, CheckBox, x10 y180 w50 h24 gOnTopCheck vCheckClock, OnTop
CheckClock = 1
Gui, Show, x484 y377 h208 w321, Time Clock 1.0

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
  else
    clock2++
  clockT := clock1 + clock2

  c1 := FormatSeconds(clock1)
  c2 := FormatSeconds(clock2)
  ct := FormatSeconds(clockT)
  
  GuiControl, , Clock1, %c1%
  GuiControl, , Clock2, %c2%
  GuiControl, , TotalClock, %ct%
}

ClockDone: ; change turns
turn := !turn
if turn = 1
{
  GuiControl, , Counter1, |||`n|||`nV
  GuiControl, , Counter2, 
}
else
{
  GuiControl, , Counter1, 
  GuiControl, , Counter2, |||`n|||`nV
}
return

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

F8:: 
GoSub ClockDone
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