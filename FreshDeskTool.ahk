#SingleInstance force ;Close currently running instance of this script

; Assign agent to Fresh Desk e-mail

; Check if window is a Fresh Desk e-mail

; Get name of Agent

Agent := {"Name": "Mikkel"}

; Assign e-mail to current agent, marks as "Løst" and update e-mail

	; When pressing CTRL + X
	s & a:: ;Press "s"upport and "a"ssign
	
		; Set Status to "Løst"; assign agent; update e-mail
		
		try {
			SendInput, {Tab 4} ; Hit tab 4 times to get to "Status"
			Sleep, 100 ;Wait 100ms - otherwise the browser might not react correctly to the input
			SendInput, l ;Type in "løst"
			Sleep, 100 ;Wait
			SendInput, {Enter} ;Hit enter
			Sleep, 100 
			SendInput, {Tab 2} ;Hit tabulator twice
			Sleep, 100
			SendInput, {Enter}
			Sleep, 100
			SendInput, % Agent.Name ;Type in agent's name
			Sleep, 500
			SendInput, {Enter} ;Hit enter again to confirm
			Sleep, 100
			SendInput {Tab} ;Tab to "Opdater" button
			Sleep, 100
			SendInput {Enter} ;Hit enter to update form
			Sleep, 100
			SendInput {r}
			Sleep, 500
			SendInput ^+{Home}
			Sleep, 100s
			SendInput {Delete}
			Sleep, 100
			SendInput {Enter}
			Sleep, 100
			SendInput {Up}
			Sleep, 100
			SendInput +7{c}
			sleep, 100
			SendInput {Enter}
			Sleep, 500
			SendInput {Betatester info}
			Sleep, 500
			SendInput {Enter}
		}
		catch e {
			MsgBox, Exception: %e% `nWhen trying to find fd-status.png `nErrorLevel %ErrorLevel% 
			Exit
		}
	
	return

; Suspend script
SC029::Suspend ;Press the "½" key just below the "Esc" key to suspend the script
return

; Exit the app
Esc::
ExitApp
return