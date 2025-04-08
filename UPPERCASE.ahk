SEND, !{TAB}
sleep, 300 
send, ^c
sleep, 200

StringUpper Clipboard, Clipboard

carriage:= chr(13) . chr(10)
clipboard:= StrReplace(clipboard,carriage, chr(13))
sleep, 200
send, ^v
sleep, 1000

ExitApp