#include anything.ahk

action4source1(candidate)
{
  Msgbox, you have selected: %candidate%
}

source1 :=Object()
;;candidates can be an array
candidates:=Array("red","green")
source1["candidate"]:=candidates

source1["action"]:="action4source1"

f1::anything(source1)

