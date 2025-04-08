artsleep :=100
Sleep, %artsleep%
FSCoIMS :=""


return
;


^Esc::
Suspend
Pause,, 1
Return

^[::reload
return

;




F9::


	

GoSub, ^t






CoordMode, Pixel, Screen
PixelSearch, cxPolNum, cyPolNum, 4073, 1445, 4242, 1746, 0xF0CF65, 0, Fast RGB

cxPolNum+=76
cyPolNum+=37

sleep, 150

CoordMode, Mouse, Screen
Click, %cxPolNum%, %cyPolNum%
Click, 1

send, ^c

sleep,500
click, 3465, 405
clipboard=https://hitadmin.havenlife.com/policyadmin/life/%clipboard%
sleep,750
send, ^l
sleep,1200
send, ^v
send,{enter}



CoordMode, Pixel, Screen

PixelSearch, cxSys, cySys, 4078, 1605, 4242, 1876, 0xD7816A, 0, Fast RGB
PixelSearch, cxSysNote, cySysNote, 4073, 1445, 4242, 1746, 0xF0CF65, 0, Fast RGB


CoordMode, Mouse, Screen

cySys+=1
cySysNote+=35


click, 1153, 587
sleep, 1250
send, ^{home}

sleep 500

click, 1
send, {del}
sleep, 2000


Click, 4263, 1218
Sleep, 750

Click, %cxSys%, %cySys%
sleep, 350
send +{click, %cxSysNote%, %cySysNote%}
send, ^c


Click, 1150, 606
Sleep, 1200
Click, 1
send, {F17}


Sleep, 1500
Click, 1230, 795
Send +{Click 1230 870}
Sleep, 250
send, ^c
Sleep, 250


sleep, 1000
Clipboard := StrReplace(Clipboard, chr(34))
sleep, 1000

clipboard := SubStr(clipboard,1,-4)
sleep, 250

Click, 4100, 1365
Sleep, 500
send, ^a
Sleep, 500
send, ^v

Click, 3725, 1360
Sleep, 500
Click, 2
send, ^c


Click, 4130, 1360
Sleep, 250
send, ^v



sleep, 2000




Click, 3043, 600
sleep,1000
send,+{click, 2416, 585}
sleep,500
send, ^c

sleep, 750

click, 1154, 962
sleep, 1250
click, 1
sleep,250
send, {F17}


sleep, 3000



	Sleep, %artsleep%



CoordMode, Pixel, Screen
sleep, 2500
PixelSearch, cxInv, cyInv, 3240, 780, 3280, 900, 0x8F8F8F, 0, Fast RGB


If (cxInv="") {
sleep, 5000

CoordMode, Pixel, Screen
sleep, 2500
PixelSearch, cxInv, cyInv, 3240, 780, 3280, 900, 0x8F8F8F, 0, Fast RGB

If (cxInv="") {
send, ^[
sleep, 1000
}
}

cxInv+=17
cyInv+=11


CoordMode, Mouse, Screen
click, 3537, 662
sleep, 150
Click, %cxInv%, %cyInv%

CoordMode, Pixel, Screen
sleep, 50
PixelSearch, cxFMS, cyFMS, 2600, 1420, 2700, 1650, 0x0CA1CA, 0, Fast RGB

CoordMode, Mouse, Screen
click, 3537, 662
sleep, 250
Click, %cxFMS%, %cyFMS%
sleep, 250
cxFMS+=100
cyFMS+=120
sleep, 250
send, +{Click, %cxFMS%, %cyFMS%}
sleep,500
send,^c
sleep, 250

click, 1295, 602
Sleep, 1000
Click, 1
sleep,500
send,{F17}

sleep, 1000



	
	Sleep, %artsleep%






CoordMode, Pixel, Screen
sleep, 500

PixelSearch, cxLapseCheck, cyLapseCheck, 2758, 689, 3128, 934, 0xFFE157, 0, Fast RGB

PixelSearch, cxLapseProc, cyLapseProc, 3308, 674, 3372, 859, 0x0CA1CA, 0, Fast RGB

PixelSearch, cxLapseSub, cyLapseSub, 2860, 1543, 2904, 1568, 0xCEEACE, 0, Fast RGB

PixelSearch, cxReinSt, cyReinSt, 2889, 672, 3090, 864, 0x0CA1CA, 0, Fast RGB

sleep,250
PixelGetColor, cFarLapse, 1885, 615, Fast RGB

sleep, 500


If (cFarLapse=0xFFC7CE) {
send, ^[
}


if else (cxLapseCheck !="") {
CoordMode, Mouse, Screen

click, %cxLapseProc%, %cyLapseProc%
cyLapseProc+=240
sleep,500
click, %cxLapseProc%, %cyLapseProc%
sleep, 2500


CoordMode, Pixel, Screen
PixelSearch, cxTermCheck, cyTermCheck, 2889, 672, 3173, 885, 0xFF571A, 0, Fast RGB

If (cxTermCheck !="") {
send, ^[
}

CoordMode, Pixel, Screen
PixelSearch, cxLapsePreSub, cyLapsePreSub, 2864, 1543, 2904, 1685, 0xD8EBB5, 0, Fast RGB
PixelSearch, cxReinSt, cyReinSt, 2889, 600, 3090, 864, 0x0CA1CA, 0, Fast RGB



If (cxLapsePreSub !="") {

CoordMode, Mouse, Screen

cxLapsePreSub-=31
cyLapsePreSub+=12

cxReinSt +=249
cyReinSt +=73

sleep, 1000
click, %cxLapsePreSub%, %cyLapsePreSub%

sleep, 6000
click, %cxReinSt%, %cyReinSt%
click,2
sleep,50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250


click, 1155, 996
sleep,1000
click, 1
sleep, 150
send,{F17}

sleep, 1000

CoordMode, Pixel, Screen
PixelGetColor, LapPayChk, 1817, 705, RGB

if (LapPayChk=0xC6EFCE) {

CoordMode, Pixel, Screen
PixelSearch, cxLapseSub, cyLapseSub, 2860, 1500, 2904, 1700, 0x7DBD05, 1, Fast RGB




cxLapseSub+=16
cyLapseSub+=11

CoordMode, Mouse, Screen
Click, %cxLapseSub%, %cyLapseSub%

sleep,1000

sleep, 5000

send, {tab}{tab}
sleep,100
send,{enter}



sleep, 15000

}


}


}









CoordMode, Pixel, Screen

sleep,1000
PixelSearch, cxFailCheck, cyFailCheck, 3210, 870, 3235, 1000, 0xFF571A, 0, Fast RGB

sleep,250
PixelSearch, cxPendCheck, cyPendCheck, 1882, 598, 2026, 623, 0xFFEB9C, 0, Fast RGB

sleep,250
PixelGetColor, LapPendCheck, 1821, 708, Fast RGB

If(cxFailCheck !="") {
PixelGetColor, CrPC, 1949, 702, Fast RGB

CoordMode, Mouse, Screen
cxFailCheck+=5
cyFailCheck+=17

sleep, 250









	
	Sleep, %artsleep%










if (CrPC=0xC6EFCE) { 
click, %cxFailCheck%, %cyFailCheck%
sleep 125
send, {F10}
 ;

}

;

}


else if (cxPendCheck !="") {

CoordMode, Pixel, Screen
PixelGetColor, CrPC, 1949, 702, Fast RGB
PixelSearch, cxMS, cyMS, 3210, 870, 3235, 1000, 0x0CA1CA, 0, Fast RGB

CoordMode, Mouse, Screen
cxMS+=5
cyMS+=27
sleep, 250

if (CrPC=0xC6EFCE) { 
click, %cxMS%, %cyMS%
sleep 125
send, {F10}
return
 ;

}

}

else if (LapPendCheck =0xC6EFCE) {

CoordMode, Mouse, Screen
click, 3537, 662
sleep,500
send,{F5}
sleep,7500



CoordMode, Pixel, Screen
sleep, 2500
PixelSearch, cxInv, cyInv, 3240, 780, 3280, 900, 0x8F8F8F, 0, Fast RGB


If (cxInv="") {
sleep, 5000

CoordMode, Pixel, Screen
sleep, 2500
PixelSearch, cxInv, cyInv, 3240, 780, 3280, 900, 0x8F8F8F, 0, Fast RGB

If (cxInv="") {
send, ^[
sleep, 1000
}
}


cxInv+=17
cyInv+=11

CoordMode, Mouse, Screen
click, 3537, 662
sleep, 150
Click, %cxInv%, %cyInv%


CoordMode, Pixel, Screen
PixelGetColor, CrPC, 1949, 702, Fast RGB
PixelSearch, cxMS, cyMS, 3210, 870, 3230, 1000, 0x0CA1CA, 0, Fast RGB

CoordMode, Mouse, Screen
cxMS+=5
cyMS+=27
sleep, 250

if (LapPendCheck=0xC6EFCE) { 
click, %cxMS%, %cyMS%
sleep 125
send, {F10}
return
 ;

}

}


return


;



F10::



GoSub, ^t


	


CoordMode, Pixel, Screen

sleep,1000

PixelGetColor, CrUnclean, 1949, 675, Fast RGB


CoordMode, Mouse, Screen
Click, 3725, 1360
Sleep, 250
Click, 2
send, ^c


click, 3465, 405

CoordMode, Pixel, Screen
PixelSearch, cxCancel, cyCancel, 2976, 713, 3032, 931, 0xFF571A, 0, Fast RGB

CoordMode, Mouse, Screen
MouseMove, %cxCancel%, %cyCancel%, 0


If (cxCancel="") {

send, ^[
sleep, 1000
}


cxCancel -=74
cyCancel -=34

Click, %cxCancel%, %cyCancel%

send, ^v
send,{tab}
send,{enter}
Sleep,750
send,{tab}{tab}
send,{enter}

If(CrUnclean =0xFFEB9C) {
send,{esc}
sleep,500
}
else {
Sleep, 6000
Send, {F5}
Sleep, 6000
Send, {F5}
Sleep, 9500
}

CoordMode, Mouse, Screen



Click, 3043, 584
Click, 2
sleep, 50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250


FSCCheck := SubStr(clipboard, 1, 3)

if (FSCCheck = "FSC") {
sleep, 2000
Click, 3043, 584
Click, 2
sleep, 50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250
}


if (clipboard = "") {
sleep, 2000
Click, 3043, 584
Click, 2
sleep, 50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250
}



if (FSCCheck = "FSC") {
send,{F5}
sleep, 6000
Click, 3043, 584
Click, 2
sleep, 50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250
}

if (clipboard = "") {
send,{F5}
sleep, 6000
Click, 3043, 584
Click, 2
sleep, 50
send, ^c
clipboard := SubStr(clipboard,1,-2)
sleep, 250
}



click, 1945, 645
sleep,1000
click, 1
sleep,1000
send, {F2}
send, ^a
sleep, 50
send, ^v
sleep, 100
send,{enter}

sleep,500

Click, 4245, 1415 

send, {down}{down}
sleep,50
send, ^v



If(CrUnclean =0xFFEB9C) {

CoordMode, Mouse, Screen
click, 1839, 672
Sleep, 1000
Click, 1
send, ^c
sleep, 250
clipboard := SubStr(clipboard,1,-2)
sleep, 500

click, 4409, 1375
send, ^v
sleep, 150
send, {down}{down}{down}{down}{down}{down}

}

Sleep, 250

send, +{up}+{up}+{up}+{up}+{up}+{up}

Sleep, 250

send, ^c

Sleep, 4500

CoordMode, Pixel, Screen

sleep, 500



	
	Sleep, %artsleep%





PixelSearch, cxNote, cyNote, 3330, 775, 3380, 900, 0x8F8F8F, 0, Fast RGB


If (cxNote="") {
sleep, 5000
CoordMode, Pixel, Screen
sleep, 2500
PixelSearch, cxNote, cyNote, 3240, 780, 3280, 900, 0x8F8F8F, 0, Fast RGB
If (cxNote="") {
send, ^[
sleep, 1000
}
}




cxNote+=20
cyNote+=10

CoordMode, Mouse, Screen

click, 3537, 662
sleep,500
Click, %cxNote%, %cyNote%
sleep,500
Send, {Tab}
Send, {Enter}
Send, {Tab}

send, ^v
Send, {Tab}




sleep, 250

CoordMode, Pixel, Screen


sleep,500

PixelGetColor, CrDC, 2013, 761, Fast RGB

CoordMode, Mouse, Screen

if (CrDC=0xC6EFCE) { 

send, {F11}

return
;

}


else if (CrUnclean=0xFFEB9C) { 

send, {F11}

return
;

}


Return




;


F11::


GoSub, ^t



CoordMode, Mouse, Screen

Send, {Enter}
Sleep,250
Click, 4150, 1375
Click, 1
send, ^c

Sleep, 250

click, 3767, 1702
Sleep, 500
Send, bbb
Sleep, 500
Send, {enter}
Sleep, 500
Send,{tab}{space}{tab}{tab}{tab}
Send,^v
Send,{tab}{tab}{tab}{tab}
Send,malik{space}warren
Sleep, 1500
send, {down}
sleep, 125
send, {enter}
sleep, 125

Send,{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}
Send,^a
Sleep,500
Send,^c
Send,{tab}{tab}{tab}{tab}{tab}{tab},{Enter}
Sleep,500
Send,o
Sleep, 500
Send,{Enter}
Sleep, 500
Send,{tab}{tab}{tab}{tab}{tab}
Send,^v

Sleep, 500
Click, 4460,1180
Sleep,5500
Click, 4580,1180




	
	Sleep, %artsleep%




CoordMode, Pixel, Screen
sleep,1000
PixelSearch, cxErrCheck, cyErrCheck, 3992, 1167, 4412, 1190, 0xF1CECD, 0, Fast RGB

If(cxErrCheck ="") {
CoordMode, Mouse, Screen

send, ^]


click, 1153, 587
sleep, 1250
click, 1
send, {del}
sleep, 1500


Click, 4263, 1218
Sleep, 2500

send {F16}

return

}
 else if (cxErrCheck !="") {

MsgBox Error in CEC Tracking.
return

}



Return














;




^t::

CoordMode, Pixel, Screen
PixelGetColor, cExcelCheck, 2189, 859, Fast RGB
PixelGetColor, cHitCheck, 2919, 503, Fast RGB
PixelGetColor, cServNowCheck, 3874, 1089, Fast RGB
sleep,500
clipboard = %cExcelCheck%, %cHitCheck%, %cServNowCheck%
sleep,500
if (cExcelCheck !=0xCCFFFF) {
send, ^[
sleep, 1000
}
sleep,500
if (cHitCheck !=0x252E36) {
send, ^[
sleep, 1000
}
sleep,500
if (cServNowCheck !=0x293E40) {
send, ^[
sleep, 1000
}

Return

;

