SetTitleMatchMode Regex ;����ʹ��������ʽ�Ա������ƥ��
list=
#IfWinActive ahk_class ExploreWClass|CabinetWClass
~LButton::
MouseGetPos,,,,control
if  control=SysListView321
{
  address := getExplorerAddressPath()
  SetTimer, addressChangeTimer, 400

;  selection := FC("explorer","","selection")
;    if (selection.len()=1)
;    {
;      ToolTip % selection[1]
; ;;     MsgBox % getExplorerAddressPath()
;      address := getExplorerAddressPath()
;      SetTimer, addressChangeTimer, 1000
     
;    }
}
if  control=SysTreeView321
{
  address := getExplorerAddressPath()
    SetTimer, addressChangeTimer, 200
}
 
return

addressChangeTimer:
  SetTimer, addressChangeTimer ,off
  if WinActive(  "ahk_class ExploreWClass|CabinetWClass")
  {
     newAddr:= getExplorerAddressPath()
     if (address <> newAddr)
      {
        list= %list%`n%newAddr%
        ToolTip ,%list%
        ;;add to history list 
      }
}

return 
  

getExplorerAddressPath()
{
  WinGetText, full_path, A  ; ȡ����ַ�����·��
  StringSplit, word_array, full_path, `n     ;;��Ϊȡ����·�����л��з�����Ҫȴ����
  full_path = %word_array1%   ; Take the first element from the array
  StringReplace, full_path, full_path, `r, , all   ; �Է���һ������ȴ���س���returns (`r)
  return full_path
}
  
