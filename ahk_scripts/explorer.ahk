; #SingleInstance force
; #NoTrayIcon

;;;��Explorer.exe �����ж������¿�ݼ�
;;Alt+1 ���� ѡ�е��ļ��������а�
;;Alt+2 ���Ƶ�ַ����·�������а�
;;Alt+3 ����ѡ���ļ���ȫ·�������а�
;;Ctrl+Alt+n  �½�һ���ļ���
;;Ctrl+Alt+t �½�һ���ı�
;;Ctrl+Alt+c �ڴ˴���Cmd.exe(����һ���ű�cmd2msys.ahk�У�
;;           ��������cmd.exe�����а���Ctrl+Return����ת���� msys.bat����)
;;
;;Ctrl+l ��λ����ַ��
SetTitleMatchMode Regex ;����ʹ��������ʽ�Ա������ƥ��
; ����Ĵ���������Ϊ�����桢Win+D������桢�ҵĵ��ԡ���Դ�����������Ϊ��
#IfWinActive ahk_class Progman|WorkerW|CabinetWClass|ExploreWClass|#32770
;;Alt+1 copy�ļ���
!1::
  send ^c
  sleep,300
  clipboard = %clipboard%
  SplitPath, clipboard, name
  clipboard = %name%
  return
;;alt+2 copy ���ļ����ڵ�·����
!2::
  send ^c
  sleep,300
  clipboard = %clipboard%
  SplitPath, clipboard, , dir
  clipboard = %dir%
  return
;;copy ���ļ���ȫ·����
!3::
  send ^c
  sleep,300
  clipboard = %clipboard%
  return
#IfWinActive

#IfWinActive ahk_class ExploreWClass|CabinetWClass
^n::Send {Down}
^p::Send {Up}
^j::
  ControlGetFocus, focusedControl,A 
    if(focusedControl="SysListView321")
  {
    ControlGetText, oldExplorePath, Edit1, A
    Send {Enter}
        sleep 250
        if WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")
        {
          ControlGetText, newExplorePath, Edit1, A
          ControlFocus, SysListView321,A
            Send {Home}
          ;;;�����仰�������ڸ���anything-explorer-history.ahk�еı�������
          ;;add to history list
          updateHistory(newExplorePath)
        }
  }else
  {
    Send {Enter}
  }
return

^f::
  ControlGetFocus, focusedControl,A 
      Send {Right}

    if(focusedControl="SysTreeView321")
  {
    ;;;�����仰�������ڸ���anything-explorer-history.ahk�еı�������
    ;;add to history list 
    sleep 400
    updateHistory(getExplorerAddressPath())
  }
return

^b::send {Left}
^h::
   ControlGetFocus, focusedControl,A 
    if(focusedControl="SysTreeView321")
  {

    send {Left}
    ;;;�����仰�������ڸ���anything-explorer-history.ahk�еı�������
    ;;add to history list 
    sleep 400
    updateHistory(getExplorerAddressPath())
  }else
  {
    Send ^h
  }
return
 
^u::
   ControlGetFocus, focusedControl,A 
    if(focusedControl="SysListView321")
  {
    send     {backspace}
    ControlGetText, newExplorePath, Edit1, A
    ControlFocus, SysListView321,A
      Send {Home}
    ;;;�����仰�������ڸ���anything-explorer-history.ahk�еı�������
    ;;add to history list 
    sleep 400
    updateHistory(newExplorePath)
  }
return

;;Ctrl+, ѡ�е�һ���ļ�
^,::
   ControlFocus, SysListView321,A
    Send {Home}
return
;;Ctrl+. ѡ�����һ���ļ�
^.::
  ControlFocus, SysListView321,A
  Send {End}
  return
  
;;ctrl+; ��λ��Ŀ¼��
^;::
  ControlFocus, SysTreeView321,A
return

 ;;ctrl+L ��λ�ڵ�ַ��
^l:: ControlFocus, Edit1,A
;"+"  like Emacs dired: create new folder 
+=::Send !fwf

; create new text file
;
!n::
InputBox, UserInput, New File Name?, Please enter a New File Name(.txt), , 280, 100,,,,,
if ErrorLevel
{
}else
{
  Send {Left}
ControlGetText, ExplorePath, Edit1, A
StringRight, isEndsWithPathSeaprator, ExplorePath, 1
if (isEndsWithPathSeaprator ="\")
{
  newFilePath=%ExplorePath%%UserInput%
}else
{
  newFilePath=%ExplorePath%\%UserInput%
}
FileAppend,, %newFilepath%
ControlFocus, SysListView321,A
; Switch the active window's keyboard layout/language to English:
PostMessage, 0x50, 0, 0x4090409,, A  ; 0x50 is WM_INPUTLANGCHANGEREQUEST.
SendInput {F5}%UserInput%  
}
return

;Ctrl-t TOGGLES FILE EXTENSIONS
!h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
If HiddenFiles_Status = 1
     RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
Else
   RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
WinGetClass, eh_Class,A
If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA")
   send, {F5}
Else PostMessage, 0x111, 28931,,, A
Return

; open 'cmd' in the current directory
;
^!c::OpenCmdInCurrent()
^!h::toggle_hide_file_in_explore()
#IfWinActive

; Opens the command shell 'cmd' in the directory browsed in Explorer.
; Note: expecting to be run when the active window is Explorer.
;
OpenCmdInCurrent()
{
 ControlGetText, full_path, Edit1, A
 IfInString full_path, \
  {
    Run, cmd /K cd /D "%full_path%"
  }
  else
  {
    Run, cmd /K cd /D "C:\ "
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;����Դ�������У������벻�����л��������ļ���
;;��Ҫͨ���޸�ע���
toggle_hide_file_in_explore(){

;------------------------------------------------------------------------
; Show hidden folders and files in Windows XP
;------------------------------------------------------------------------
; User Key: [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
; Value Name: Hidden
; Data Type: REG_DWORD (DWORD Value)
; Value Data: (1 = show hidden, 2 = do not show)
RegRead, ShowHidden_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
if ShowHidden_Status = 2
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
Else
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
WinGetClass, CabinetWClass
PostMessage, 0x111, 28931,,, A
Return
}

;;��Ҫ emacsclientw ��Path·����
openSelectedfileWithEamcs()
{
  ControlGetFocus, focusedControl,A
  if (focusedControl="SysListView321")
  {
    ClipSaved := ClipboardAll
    Send ^c
    sleep,300
    clipboard = %clipboard%
    fullPath=%clipboard%
    Clipboard := ClipSaved   
    run , emacsclientw %fullPath%
  }
}
#IfWinActive ahk_class ExploreWClass|CabinetWClass
^e:: openSelectedfileWithEamcs()
#IfWinActive

