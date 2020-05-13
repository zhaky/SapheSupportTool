; This tool should help me answer Fresh Desk tickets and transfer information from and to them

; Ensure that only one instance of this script is open at a time
#SingleInstance force

; -------------------------------------------------------------------------------

; CHANGE STATUS, PRIORITY AND AGENT ON A TICKET

; Find status field
< & 1::

	ImageSearch, statusX, statusY, 1300, 100, 1600, 1080, %A_ScriptDir%\Img\fd-status.png
	MouseClick, left, statusX + 5, statusY + 5

return

; -------------------------------------------------------------------------------

; STORED INFORMATION

; Copy w/e is selected and store it in a variable
GetInfo(NameOfValue) {
	clipboard := "" ; Empty the clipboard
	SendInput ^c ; Copy w/e is selected
	ClipWait 1 ; Wait till clipboard contains data or max 1 second
	Info := ""
	
	if (clipboard = "") { ; If nothing is selected
		InputBox, Answer, %NameOfValue%, Indtast %NameOfValue% ; Ask the user to type in the input
		Info := Answer
	}
	else { ; If clipboard contains something put w/e that is into the variable
		Info := clipboard
	}
	
	return Info
}

; Take selected info and ask for a variable to store it in


; Clear a variable


; Clear all variables

; Write info from a variable

; -------------------------------------------------------------------------------

; QUICK REPLIES

::_qsig::
SendInput, Venlig hilsen `nMikkel, Saphe
return

::_anmeldkontakt::
SendInput, Tak for anmeldelsen Allan. Du er velkommen til at kontakte os på support@saphe.dk eller 42 90 33 11, så vi kan hjælpe.
return

; -------------------------------------------------------------------------------

; CLOSE OR SUSPEND THE SCRIPT

; Suspend script
SC029::Suspend ;Press the "½" key just below the "Esc" key to suspend the script
return

; Exit the app
< & SC029::
ExitApp
return