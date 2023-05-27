^+v::
username := %A_UserName%

ScriptPath := "C:\Users\" . username . "\AppData\Roaming\keyboard_queue.py"

paste_file := "C:\Users\" . username . "\Documents\clipboard_files\temp_clipboard.txt"
If FileExist(paste_file)
{
	RunWait, pythonw %ScriptPath% None -v,, Hide
	
	FileRead, pasted, %paste_file%
	
	Send, %pasted%
	
}
Else
{
	MsgBox, The file, %paste_file%, does not exist!
}