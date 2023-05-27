^+c::

origClipBoard := ClipBoardAll
Send, ^c
ClipWait, 1
selectedText := clipboard
ClipBoard := origClipBoard


username := %A_UserName%

ScriptPath := "C:\Users\" . username . "\AppData\Roaming\keyboard_queue.py"

If FileExist(ScriptPath)
{
	
	RunWait, pythonw "C:\Users\love\AppData\Roaming\keyboard_queue.py" %selectedText% -c,, Hide
}
Else
{
	MsgBox, The file does not exist!
}
