; #SingleInstance force
; #NoTrayIcon
; #NoEnv  ; 


;;���ã���plsql�н�F7Ӱ��Ϊִ�й�������е����
SetBatchLines -1 ;�ٶ����
SendMode Input  
SetWorkingDir %A_ScriptDir%

#ifwinactive ahk_class TPLSQLDevForm
f7::
Enter::
^;::
sleep,10
send,{esc}{end}+{home}{f8}{End}
return

^n::SendInput {Down}
^p::SendInput {Up}
^q::SendInput {Home}
^e::SendInput {End}
^j::SendInput {Return}
^/::Send ^z
^k::Send {esc}+{end}^c{del}
^y::Send ^v
^d::Send {Del}
^m::Send {Home}+{End}^c{End}{Enter}^v ; Duplicate the current line, like R#
^BS::Send ^+{Left}{Del}
!BS::Send ^+{Left}{Del}
^u::Send +{Home}^c{Del}
!d::Send ^+{Right}^c{Del}
^f::Send {Right}
!f::Send ^{Right}
^b::Send {Left}
!b::Send ^{Left}
+!<::Send ^{Home}
+!>::Send ^{End}
!<::Send ^{Home}
!>::Send ^{End}
!s::Send ^f
^h::Send {BackSpace}
#IfWinActive 
