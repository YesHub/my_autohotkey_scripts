#z::  ;����
msgbox % ClipCopy()
return

; Functions
;ClipCopy Function
;~ ѡ���ı����ݣ���win z���Կ������Ƶ�����������Ӱ�������
;~ ---------------------------------------------------------------------
;~ �������֮ǰ����mspaint����㻭�����������ƺ����֮��
;~ Ȼ�������ҵĴ���
;~ Ȼ��ճ��
ClipCopy()
{
   
   SavedClip := ClipboardAll
   Sleep, 50
   Clipboard =
   Sleep, 50
   Send ^c ;copy
   ClipWait
   Copied := Clipboard
   Sleep, 50
   Clipboard := SavedClip
   
Return Copied
}