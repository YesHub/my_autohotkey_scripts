; -*- coding:gbk-dos  -*-
 ; dropbox ���й���û����ȫ���
 ; ��Ҫ�����⣬���ڼ�ʱ���ظ����ϡ�A�����ϸ������ļ���B�������Ѿ�����Dropbox��
 ; ȴ���ἴʱ���£��ŵ������ļ�������ļ������������û���ʱ�ἴʱ���أ���ʱ��û
 ; ���κη�Ӧ��һ��ֻ�еȵ��´�����Dropboxʱ�����²ŻῪʼ�������Ҳһ��ֻ�е�
 ; ������ʱ�Żᷢ����������ǱʼǱ��û���ƽʱ�Ӳ��ػ�����ֻϰ�ߴ��������ܵ�����
 ; �˺ܾã�Ҳ��ȫ���ἰʱ���ԭ�����ļ����Ը����ˡ�
#Persistent
#NoTrayIcon
#SingleInstance force

; 60min ����һ��dropbox
SetTimer, auto_restart_dropbox, 360000
return


auto_restart_dropbox:
  Process,Close, Dropbox.exe
  Run, %A_AppData%\Dropbox\bin\Dropbox.exe,,UseErrorLevel
  RefreshTray()
return

 ; ˢ�����½�����
 RefreshTray() {
	WM_MOUSEMOVE := 0x200

	ControlGetPos, xTray,, wTray,, ToolbarWindow321, ahk_class Shell_TrayWnd
	endX := xTray + wTray
	x := 5
	y := 12

	Loop
	{
		if (x > endX)
			break
		point := (y << 16) + x
		PostMessage, %WM_MOUSEMOVE%, 0, %point%, ToolbarWindow321, ahk_class Shell_TrayWnd
		x += 18
	}
}
