;RunAndHide.ahk
; Run to hide or show the taskbar
;Skrommel @ 2008

; #NoEnv
; #SingleInstance,Force
; #NoTrayIcon
SetWinDelay,0
#z::
IfWinExist,ahk_class Shell_TrayWnd
{
  ; Send #d
  WinHide,ahk_class Shell_TrayWnd
  WinHide,Start ahk_class Button
}
Else
{
  ; Send #d
  WinShow,ahk_class Shell_TrayWnd
  WinShow,Start ahk_class Button
}
return


;;;�������������������
;;Ϊ�˸����������ռ�
;; �Ҽ���������ȡ��ѡ��"���������������������ڵ�ǰ��"
;;������������������֮���ⲿ�ֿռ���ܵ�������


AlwaysAtBottom(Child_ID)
 {
  WinGet, Desktop_ID, ID, ahk_class Progman
  Return DllCall("SetParent", "uint", Child_ID, "uint", Desktop_ID)
 }

;;WinSet:=AlwaysAtBottom(WinExist("A"))
;;��������ʼ������
AlwaysAtBottom(WinExist("ahk_class Shell_TrayWnd"))
