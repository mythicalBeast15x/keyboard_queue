^+c::

origClipBoard := ClipBoardAll
Send, ^c
ClipWait, 1
selectedText := clipboard
ClipBoard := origClipBoard


username := %A_UserName%

ScriptPath := "C:\Users\" . username . "\AppData\Roaming\keyboard_queue.py"
exec := "C:\Users\love\AppDatacd crosoft\WindowsApps\python.exe"
pythonCommand := pythonExecutable . " " . pythonScript . " " . selectedText
If FileExist(ScriptPath)
{
	
	RunWait, python "C:\Users\love\AppData\Roaming\keyboard_queue.py" %selectedText% -c
	
}
Else
{
	MsgBox, The file does not exist!
}
