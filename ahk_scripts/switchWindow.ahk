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

;;ע�⣬eclipse���������Path ����������,
;;�����õ��ĳ��򣬳��˼��˾���·���ľ�����ˣ�
#1::
IfWinExist,ahk_class SWT_Window0
  IfWinActive ,ahk_class SWT_Window0
     WinMinimize ,ahk_class SWT_Window0
  else{
    WinMaximize,ahk_class SWT_Window0
    WinActivate ,ahk_class SWT_Window0
    }
else
  run eclipse
return  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;Win+f toggle Firefox
#f::
IfWinExist,ahk_class MozillaUIWindowClass
  IfWinActive ,ahk_class MozillaUIWindowClass
     WinMinimize ,ahk_class MozillaUIWindowClass
  else{
    WinMaximize,ahk_class MozillaUIWindowClass
    sleep 10
    WinSet, Style, -0xC00000, A ;;full screen
    WinActivate ,ahk_class MozillaUIWindowClass
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
    WinMaximize,ahk_class IEFrame
    sleep 10
    WinSet, Style, -0xC00000, A ;;full screen
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
    WinMaximize,ahk_class Emacs
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
    WinMaximize,ahk_class TPLSQLDevForm
    WinActivate ,ahk_class TPLSQLDevForm
    }
else
  Run, %A_ProgramFiles%\PLSQL Developer\plsqldev.exe
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
IfWinExist,ahk_class ahk_class (CabinetWClass|ExploreWClass)
  If WinActive("ahk_class (CabinetWClass|ExploreWClass)"){
      WinGetText, full_path, A  ; ȡ����ַ�����·��
      StringSplit, word_array, full_path, `n     ;;��Ϊȡ����·�����л��з�����Ҫȴ����
      full_path = %word_array1%   ; Take the first element from the array
    StringReplace, full_path, full_path, `r, , all   ; �Է���һ������ȴ���س���returns (`r)

      run, explorer.exe /n`, /e`, "%full_path%"
  }else{
    WinActivate ,ahk_class  (CabinetWClass|ExploreWClass)
  }
else
    run, explorer.exe  /n`, /e`, %MyFavorateDir%
return  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;Win+q  toggle Excel
#q::
IfWinExist,ahk_class XLMAIN
  IfWinActive ,ahk_class XLMAIN
     WinMinimize ,ahk_class XLMAIN
  else{
    WinMaximize,ahk_class XLMAIN
    WinActivate ,ahk_class XLMAIN
    }
else
  run excel
return  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
