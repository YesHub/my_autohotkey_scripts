#SingleInstance force
#NoTrayIcon

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


#IfWinActive ahk_class ExploreWClass|CabinetWClass
    ; create new folder
    ;
    ^!n::Send !fwf

    ; create new text file
    ;
    ^!t::Send !fw{Up}{Up}{Up}{Return}

    ; open 'cmd' in the current directory
    ;
    ^!c::
        OpenCmdInCurrent()
    return
#IfWinActive

; Opens the command shell 'cmd' in the directory browsed in Explorer.
; Note: expecting to be run when the active window is Explorer.
;
OpenCmdInCurrent()
{
    WinGetText, full_path, A  ; This is required to get the full path of the file from the address bar

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n
    full_path = %word_array1%   ; Take the first element from the array

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all

    IfInString full_path, \
    {
        Run, cmd /K cd /D "%full_path%"
    }
    else
    {
        Run, cmd /K cd /D "C:\ "
    }
}

;;;Ctrl+L ��λ�ڵ�ַ��
#IfWinActive ahk_class ExploreWClass|CabinetWClass
^l::Send {F4}{Escape}
#IfWinActive


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
;;��Ctrl+alt+h �󶨵� toggle_hide_file_in_explore
^!h::toggle_hide_file_in_explore()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
