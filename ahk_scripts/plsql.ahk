#SingleInstance force
#NoTrayIcon
^n::SendInput {Down}
^p::SendInput {Up}
LAlt & `::ShiftAltTab


;;���ã���plsql�н�F7Ӱ��Ϊִ�й�������е����
SetBatchLines -1 ;�ٶ����
#NoEnv  ; 
SendMode Input  
SetWorkingDir %A_ScriptDir%
#ifwinactive ahk_class TPLSQLDevForm
f7::
sleep,10
send,{esc}{end}+{home}{f8}
return


 
