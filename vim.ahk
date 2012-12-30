SendMode Input

; start menu
#IfWinActive ahk_class DV2ControlHost
 j::Send,{Down}
 k::Send,{UP}
 h::Send,{Left}
 l::Send,{Right}
#IfWinActive

; explorer
#IfWinActive ahk_class CabinetWClass 
 j::
    if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {Down}
	else
		Send, j
	return
 k::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
	    Send, {Up}
	else
		Send, k
	return
 h::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {Backspace}
	else
		Send, h
	return
 l::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {NumpadEnter}
	else
		Send, l
	return
 Space::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {AppsKey}
	else
		Send, {Space}
	return
 d::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {Del}
	else
		Send, d
	return
 y::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, ^c
	else
		Send, y
	return
 p::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, ^v
	else
		Send, p
	return
 u::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, ^z
	else
		Send, u
	return
 r::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {F2}
	else
		Send, r
	return
 f::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {F5}
	else
		Send, f
	return
 +k::
	if GetClassNameOnWindow(WinExist("A")) <> "Edit"
		Send, {Alt}fwf
	else
		Send, +k
	return
 ^l::
	Send, !d
	return
#IfWinActive

GetClassNameOnWindow(hWindow)
{
	max := VarSetCapacity(s, 256)
	ActiveThreadID := DllCall("GetWindowThreadProcessId", "UInt", hWindow, "UIntP",0)
	if(DllCall("AttachThreadInput", "UInt", DllCall("GetCurrentThreadId"), "UInt", ActiveThreadID, "Int", 1))
	{
		hFocus := DllCall("GetFocus")
		DllCall("GetClassName", "UInt", hFocus, "Str", s, "Int", max)
		DllCall("AttachThreadInput", "UInt", DllCall("GetCurrentThreadId"), "UInt", ActiveThreadID, "Int", 0)
	} 
    else
    {
		s := "Error"
    }
	return s
}

