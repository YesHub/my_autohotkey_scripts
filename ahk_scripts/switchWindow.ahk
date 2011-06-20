;;;; switchWindow.ahk -- switch to your favourate window
;;;;@author jixiuf@gmail.com
;;;,�˽ű���Ϊ�������ģ������ڱ�����ı���ʱ����뱣��Ϊutf-8���룬
;;; ������gbk�ı���Ӧ�ò�����(δ����)
;;
;;;;����ű����ڿ��ٶ�λ���ض��Ĵ���
;;;��Win+1��Ϊ��
;;;���û������eclipse������Win+1���󣬻�����һ��eclipse,
;;;����Ѿ���һ��������eclipse,����Win+1�����������������
;; ���eclipse�Ѿ���ý��㣬����С��eclipse����
;; ���eclipseû�л�ý��㣬�����֮�����۽�


; #NoTrayIcon
; #SingleInstance force

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ע�⣬eclipse���������Path ����������,
;;�����õ��ĳ��򣬳��˼��˾���·���ľ�����ˣ�
#1::
IfWinExist,ahk_class SWT_Window0
  IfWinActive ,ahk_class SWT_Window0
     WinMinimize ,ahk_class SWT_Window0
  else{
;;    WinMaximize,ahk_class SWT_Window0
    WinActivate ,ahk_class SWT_Window0
    }
else
  run, eclipse -nl en_US
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;Win+f toggle Firefox
#f::
SetTitleMatchMode, RegEx
IfWinExist,ahk_class MozillaUIWindowClass|MozillaWindowClass
  IfWinActive ,ahk_class MozillaUIWindowClass|MozillaWindowClass
     WinMinimize ,ahk_class MozillaUIWindowClass|MozillaWindowClass
  else{
;;    WinMaximize,ahk_class MozillaUIWindowClass|MozillaWindowClass
;;    sleep 10
;;    WinSet, Style, -0xC00000, A ;;full screen
    WinActivate ,ahk_class MozillaUIWindowClass|MozillaWindowClass
    }
else
  run firefox
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;Win+x ,toggle IE
#x::
IfWinExist,ahk_class IEFrame
  IfWinActive ,ahk_class IEFrame
     WinMinimize ,ahk_class IEFrame
  else{
;;    WinMaximize,ahk_class IEFrame
;;    sleep 10
;;    WinSet, Style, -0xC00000, A ;;full screen
    WinActivate ,ahk_class IEFrame
    }
else
  Run, %A_ProgramFiles%\Internet Explorer\iexplore.exe
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;Win+A ,toggle.Eamcs
#a::
IfWinExist,ahk_class Emacs
  IfWinActive ,ahk_class Emacs
     WinMinimize ,ahk_class Emacs
  else{
;;    WinMaximize,ahk_class Emacs
    WinActivate ,ahk_class Emacs
    }
else
  run runemacs
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;Win+c ,toggle Pl/sql
#c::
IfWinExist,ahk_class TPLSQLDevForm
  IfWinActive ,ahk_class TPLSQLDevForm
     WinMinimize ,ahk_class TPLSQLDevForm
  else{
;;    WinMaximize,ahk_class TPLSQLDevForm
    WinActivate ,ahk_class TPLSQLDevForm
    }
else
  Run, C:\Prog\PLSQL\plsqldev.exe
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;Win+g ,toggle Gtalk
#g::
DetectHiddenWindows, On
IfWinExist,ahk_class Google Talk - Google Xmpp Client GUI Window
  IfWinActive ,ahk_class Google Talk - Google Xmpp Client GUI Window
     WinMinimize ,ahk_class Google Talk - Google Xmpp Client GUI Window
  else{
     WinRestore,ahk_class Chat View
     WinActivate ,ahk_class Google Talk - Google Xmpp Client GUI Window
    }
else
  Run, %A_ProgramFiles%\Google\Google Talk\googletalk.exe
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;Win+b ,toggle Gtalk
#b::
DetectHiddenWindows, On
  IfWinExist,ahk_class Chat View
  IfWinActive ,ahk_class Chat View
     WinMinimize ,ahk_class Chat View
  else{
     WinRestore,ahk_class Chat View
    WinActivate ,ahk_class Chat View
    }
else
  Run, %A_ProgramFiles%\Google\Google Talk\googletalk.exe
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;Win+e ������Դ��������

;;��Ĭ�ϵ�Win+e�Ĳ�֮ͬ������,����Ѿ���һ����������Դ����������������
;;û������Ļ���������������һ����ֻ�뼤��֮��
;;��ʱ��Դ����������Ҫ������������ԣ������ǰ�ۼ��Ĵ����Ѿ���һ����Դ��������
;;������Ϊ�û�����������һ����Դ��������Ϊ����ƣ���Ŀ¼��λ�������������ͬ��Ŀ¼
#e::
MyFavorateDir:="D:\"
SetTitleMatchMode, RegEx
IfWinExist,ahk_class (CabinetWClass|ExploreWClass)
{
  If WinActive("ahk_class (CabinetWClass|ExploreWClass)"){
     ControlGetText, ExplorePath, Edit1, A
;;֮���Բ��������������Ϊ����ַ����Ϊ���ҵĵ��ԡ��ĸ���ʱ��������������ʾ�Ҳ���·��     
    run, explorer.exe /n`, /e`, "%ExplorePath%" ,,
  }else{ 
    WinActivate ,ahk_class  (CabinetWClass|ExploreWClass)
    WinWaitActive
    ControlGetFocus, focusedControl,A
;;    Tooltip ,%focusedControl%
    if (focusedControl <> "SysListView321")
    {
     ;;ѡ�е�һ���ļ�
      ControlFocus, SysListView321,A
      Send {Home}
    }
  }
}else{
    run, explorer.exe  /n`, /e`, %MyFavorateDir%
    WinWait ahk_class (CabinetWClass|ExploreWClass) 
    WinActivate
    ;;ѡ�е�һ���ļ�
    sleep 50
    ControlFocus, SysListView321,A
    Send {Home}
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;Win+q  toggle Excel
#q::
IfWinExist,ahk_class XLMAIN
  IfWinActive ,ahk_class XLMAIN
     WinMinimize ,ahk_class XLMAIN
  else{
;;    WinMaximize,ahk_class XLMAIN
    WinActivate ,ahk_class XLMAIN
    }
else
  run excel
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;Win+q  toggle Excel
#3::
IfWinExist,ahk_class OpusApp
  IfWinActive ,ahk_class OpusApp 
     WinMinimize ,ahk_class OpusApp
  else{
;;    WinMaximize,ahk_class OpusApp
    WinActivate ,ahk_class OpusApp
    }
else
  run winword
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
