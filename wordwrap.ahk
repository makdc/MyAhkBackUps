;TstStr := "A user has asked us to find all the transactions on their account from their grandma. We thought it would be fun to rename the note field to birthday_message because we noticed all the transactions from grandma are birthday messages. Return the amount and the note fields from the transactions table where the sender_id is 10 (grandma). The note field should be (renamed to birthday_message)."

WordWrapping(TstStr="", StrLineLimit=50) {

;MsgBox % TstStr

MyLongStr := StrSplit(TstStr, " ")  
;StrLineLimit := 50
WrappedStr := ""
NextLine := ""
LineCounter :=0
Loop {

HowLong := StrLen(NextLine)
;MsgBox % HowLong

If( HowLong > StrLineLimit) {
    WrappedStr := WrappedStr . chr(13) . NextLine
    NextLine := ""
    LineCounter +=1 ;keeps track of the chr(13) added for each line
}
NextLine := NextLine . chr(32) . MyLongStr[A_Index]

LenOfOutput := StrLen(WrappedStr)
LenOfInput := StrLen(TstStr) + LineCounter ;added here to lengthen the input accordingly

If ( LenOfInput < LenOfOutput) {
    Break
}

}

Return WrappedStr

}