;;;�������û�õ�
win2msysPath(winPath){
   msysPath:= RegExReplace(winPath, "^([a-zA-Z]):"  ,"$1" )
   StringReplace, msysPath2, msysPath, \ , /, All
   msysPath3 = /%msysPath2%
   return %msysPath3%
}


;;��cmd.exe �Ĵ�����Ctrl+Return ,������msys ,����·����λ����ͬ��Ŀ¼
;;ǰ����msys.bat ��Path ·���£���msys����Ӧbin ·��Ҳ��Path��
startMsysHere(){
send, pwd >%A_Temp%\pwd `n
sleep 100
send msys `n
FileReadLine,msysPath,%A_Temp%\pwd ,1
sleep 300
send cd %msysPath% `n
send clear`n
}

;;;;;;;;;;;;;;;;;;
#IfWinActive ,ahk_class ConsoleWindowClass
^Return::startMsysHere() 
