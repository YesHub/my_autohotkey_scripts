#SingleInstance Force
#NoTrayIcon
SetTitleMatchMode Regex ;����ʹ��������ʽ�Ա������ƥ��
; ����Ĵ���������Ϊ�����桢Win+D������桢�ҵĵ��ԡ���Դ�����������Ϊ��
#IfWinActive, ahk_class (Progman|WorkerW|CabinetWClass|ExploreWClass|#32770)
;;Alt+1 copy�ļ���
!1::
send ^c
sleep,200
clipboard = %clipboard%
SplitPath, clipboard, name
clipboard = %name%
return
;;alt+2 copy ���ļ����ڵ�·����
!2::
send ^c
sleep,200
clipboard = %clipboard%
SplitPath, clipboard, , dir
clipboard = %dir%
return
;;copy ���ļ���ȫ·����
!3::
send ^c
sleep,200
clipboard = %clipboard%
return