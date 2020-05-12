#SingleInstance force

; Skift celle i Excel ark
NextCell() {
	Sleep, 100
	SendInput {Tab}
	Sleep, 100
}

; Kopier markeret indhold, og hvis det er tomt, spørg brugeren om indholdet
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
		Clipboard := StrReplace(Clipboard, "`r`n")
		Info := clipboard
	}
	
	return Info
}

; Liste af forsekllige typer indhold der kan kopieres, og variabler til at gemme indholdet i
	; TicketID

		; Grab
		v & 1::
		Ticket := GetInfo("Ticket ID")
		Sleep 300

		return 


	; Navn

		; Grab
		v & 2::
		Name := GetInfo("Kundens navn")
		Sleep 300
		return

	; Adresse

		; Grab
		v & 3::
		Adresse := GetInfo("Adresse")
		Sleep 300
		return
		
	; Postnummer

		; Grab
		v & 4::
		Postnummer := GetInfo("Postnummer")
		Sleep 300

		return

		
	; By

		; Grab
		v & 5::
		By := GetInfo("By")
		Sleep 300

		return

		
	; Telefonnummer

		; Grab
		b & 1::
		Telefonnummer := GetInfo("Telefonnummer")
		Sleep 300

		return
		
		
	;	E-mail

		; Grab
		b & 2::
		Email := GetInfo("E-mail")
		Sleep 300

		return

		
	; Telefon

		; Grab
		b & 3::
		Telefon := GetInfo("Telefon")
		Sleep 300

		return

		
	; Model

		; Grab
		b & 4::
		Model := GetInfo("Model")
		Sleep 300

		return

		
	; OS

		; Grab
		b & 5::
		Os := GetInfo("OS")
		Sleep 300

		return


; Insert info

	^Space::
	TicketLink = =HYPERLINK("https://sapheas.freshdesk.com/a/tickets/%Ticket%";"%Ticket%")
	Sleep, 500
	;SendInput =HYPERLINK(https://sapheas.freshdesk.com/a/tickets/%Ticket%;%Ticket%)
	SendInput %TicketLink%
	NextCell()
	SendInput %Name%
	NextCell()
	SendInput %Adresse%
	NextCell()
	SendInput %Postnummer%
	NextCell()
	SendInput %By%
	NextCell()
	SendInput %Telefonnummer%
	NextCell()
	SendInput %Email%
	NextCell()
	SendInput %Telefon%
	NextCell()
	SendInput %Model%
	NextCell()
	SendInput %OS%
	Sleep, 100
	SendInput {Enter}
	PastingInProgress := false
	
	return

; Suspend script
SC029::
Suspend
return

; Exit app
< & SC00E:: ; Press "<" and "backspace"
ExitApp
return