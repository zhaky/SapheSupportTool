; BAUHAUS order robot
; Open the order in one window and the order form in another. Activate the window with the order and activate the robot

#SingleInstance force ;Close any previous instance of the script

; Toggle keys on/off


^<:: Suspend, Toggle ;Press CTRL + < to activate or deactivate hotkeys 

	;KeysActive := !KeysActive ;Toggles whether keys do AHK commands

/* 	#IF (KeysActive)
		MsgBox, KeysActive: %KeysActive%
	return

	#IF (!KeysActive)
		MsgBox, KeysActive: %KeysActive%
	return 
*/

return

/* 	; If keys are active, deactivate them and vice versa
	if (KeysActive = True) {
		KeysActive = False
		MsgBox, Keys active: %KeysActive%
		return
	}
	else {
		KeysActive = True
		MsgBox, Keys active: %KeysActive%
		return
	} 
*/

return

; Find point on order

s & o:: ;Press "s"upport and "o"rder

	; Look for BAUHAUS logo

	try {
		;CoordMode, Pixel, Screen ;Sets pixel coordinates relative to the screen's width and height
		WinGetPos, WinX, WinY, WinW, WinH, A
		MsgBox, Search from %WinX%, %WinY% to %WinW%, %WinH%
		ImageSearch, ImgX, ImgY, 0, 0, A_ScreenWidth, A_ScreenHeight, Img\bauhaus-logo.png ;Search for the BAUHAUS logo
		;ImageSearch, ImgX, ImgY, WinX, WinY, WinW, WinH, Img\bauhaus-logo.png ;Search for the BAUHAUS logo
		MsgBox, X: %ImgX% Y: %ImgY%
	}
	catch e {
		MsgBox, Exception: %e% `nI could not find bauhaus-logo.png anywhere on the screen `nErrorLevel: %ErrorLevel%
	}

	LogoX := ImgX ;Assign the top-left x coordinate of the logo to a variable, so that it later can be used in an expression before it is used in a command
	LogoY := ImgY



	; Ask for item number

	InputBox, ItemNr, Varenummer, Skriv varenummer
	MsgBox, Du har valgt varenummer: %ItemNr%

return

; Exit app
Esc::
ExitApp
return
