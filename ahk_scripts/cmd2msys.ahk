; #NoTrayIcon
; #SingleInstance force
; SetWorkingDir %A_ScriptDir%

;;��cmd.exe �Ĵ�����Ctrl+Return ,������msys ,����·����λ����ͬ��Ŀ¼
;;ǰ����msys.bat ��Path ·���£���msys����Ӧbin ·��Ҳ��Path��
startMsysHere(){
send, pwd >%A_Temp%\pwd `n
sleep 150
send msys `n
FileReadLine,msysPath,%A_Temp%\pwd ,1
sleep 300
send cd %msysPath% `n
send clear`n
}

;;;;;;;;;;;;;;;;;;
#IfWinActive ,ahk_class ConsoleWindowClass
^Return::startMsysHere()
#IfWinActive
