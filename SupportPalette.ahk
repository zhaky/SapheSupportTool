; The support palette - A tool that allows the user to easily grab, save and paste information related to cases, orders, technical claims etc.

#SingleInstance force

; GUI - shows the user what information is available on what buttons and hotstrings

; GUI Firmanavn
GUI, Font, W700 
GUI, Add, Text, W250, (F)irmaets navn - fnav: 
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUICompanyName, N/A

; GUI Navn
GUI, Font, W700 ; Changes the weight of GUI fonts to 700 (bold)
GUI, Add, Text, W250 XP-250 YP+30, Kundens (n)avn - nav: ; Adds a text with the width of 100 and the text "Navn: "
GUI, Font, W400 ; Change the weight of GUI fonts back to 400 (normal)
GUI, Add, Text, XP+250 W300 VGUIName, N/A ; Adds a text with the variable GUIName attached, so that the text will show the value of that variable

; GUI Adresse
GUI, Font, W700 
GUI, Add, Text, W250 XP-250 YP+30, (A)dresse - adr: 
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIUserAddress, N/A 

; GUI Postnummer
GUI, Font, W700 
GUI, Add, Text, W250 XP-250 YP+30, (z)Postnummer - pnr: 
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIZipCode, N/A 

; GUI By
GUI, Font, W700 
GUI, Add, Text, W250 XP-250 YP+30, (B)y - by: 
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUITown, N/A 

; GUI Telefonnummer
GUI, Font, W700 
GUI, Add, Text, W250 XP-250 YP+30, (m)Telefonnummer - tlf: 
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIPhoneNumber, N/A

; GUI E-mailadresse
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (E)-mailadresse - mail:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIEmail, N/A

; GUI Ticket
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, FreshDesk (T)icket-ID - tic:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUITicketNumber, N/A

; GUI RMAnummer
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (R)eklamationsnummer - rma:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIRMANumber, N/A

; GUI Vores ordrenummer
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, Vores (o)rdrenummer - onr:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIPurchaseOrderNumber, N/A

; GUI Deres ordrenummer
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (k)Deres ordrenummer - rekv:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIRequisitionNumber, N/A

; GUI Track and Trace nummer
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (x)Track-and-Trace nummer - tt:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUITandTNumber, N/A

; GUI Track and Trace nummer for returlabel
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (s)Retur-Track-and-Trace nummer - ttr:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUITandTNumberRL, N/A

; GUI Varer - Denne bliver udbygget senere, og skal kunne indeholde flere varer
GUI, Font, W700
GUI, Add, Text, W250 XP-250 YP+30, (V)arer - vnr:
GUI, Font, W400 
GUI, Add, Text, XP+250 W300 VGUIItemNumber, N/A

GUI, Show, AutoSize X10 Y10, Gemte informationer; Show the GUI, place it in the top left corner 10 pixels from the left side and top, and set the title

; Update information on GUI

UpdateInfo(GUIcontrolID, NewValue) {
	GuiControl,, %GUIcontrolID%, %NewValue% ; Gets the GUI control from the ID given and changes the value of that GUI control to the NewValue given
}


; Check if something is selected if so, copy it and return the value, if not ask for input

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

; Grab marked text
 
	; NAVN
	; Grab
	< & n::
	Name := GetInfo("Kundens navn")
	Sleep 300
	UpdateInfo("GUIName", Name)
	return

	; Send
	::nav::
	SendInput %Name%
	return

 	; TELEFONNUMMER
	; Grab
	< & m::
	PhoneNumber := GetInfo("Kundens telefonnummer")
	Sleep 300
	UpdateInfo("GUIPhoneNumber", PhoneNumber)
	return

	; Send
	::tlf::
	SendInput %PhoneNumber%
	return

 	; TICKET
	; Grab
	< & t::
	TicketNumber := GetInfo("Ticket nummer")
	Sleep 300
	UpdateInfo("GUITicketNumber", TicketNumber)
	return

	; Send
	::tic::
	SendInput %TicketNumber%
	return

 	; REKLAMATIONSNUMMER
	; Grab
	< & r::
	RMANumber := "RMA " GetInfo("Reklamationsnummer")
	Sleep 300
	UpdateInfo("GUIRMANumber", RMANumber)
	return

	; Send
	::rma::
	SendInput %RMANumber%
	return

 	; ADRESSE
	; Grab
	< & a::
	UserAddress := GetInfo("Adresse")
	Sleep 300
	UpdateInfo("GUIUserAddress", UserAddress)
	return

	; Send
	::adr::
	SendInput %UserAddress%
	return

 	; POSTNUMMER
	; Grab
	< & z::
	ZipCode := GetInfo("Postnummer")
	Sleep 300
	UpdateInfo("GUIZipCode", ZipCode)
	return

	; Send
	::pnr::
	SendInput %ZipCode%
	return

 	; BY
	; Grab
	< & b::
	Town := GetInfo("By")
	Sleep 300
	UpdateInfo("GUITown", Town)
	return

	; Send
	::by::
	SendInput %Town%
	return

 	; ORDRENUMMER
	; Grab
	< & o::
	PurchaseOrderNumber := GetInfo("Vores ordrenummer")
	Sleep 300
	UpdateInfo("GUIPurchaseOrderNumber", PurchaseOrderNumber)
	return

	; Send
	::onr::
	SendInput %PurchaseOrderNumber%
	return

 	; REKVISITIONSNUMMER
	; Grab
	< & k::
	RequisitionNumber := GetInfo("Kundens ordrenummer")
	Sleep 300
	UpdateInfo("GUIRequisitionNumber", RequisitionNumber)
	return

	; Send
	::rekv::
	SendInput %RequisitionNumber%
	return

 	; TRACK OG TRACE NUMMER
	; Grab
	< & x::
	TandTNumber := GetInfo("Track & Trace nummer")
	Sleep 300
	UpdateInfo("GUITandTNumber", TandTNumber)
	return

	; Send
	::tt::
	SendInput %TandTNumber%
	return

 	; TRACK OG TRACE NUMMER FOR RETURLABEL
	; Grab
	< & s::
	TandTNumberRL := GetInfo("Track & Trace nummer for returlabel")
	Sleep 300
	UpdateInfo("GUITandTNumberRL", TandTNumberRL)
	return

	; Send
	::ttr::
	SendInput %TandTNumber%
	return

 	; VARENUMMER
	; Grab
	< & v::
	ItemNumber := GetInfo("Varenummer")
	Sleep 300
	UpdateInfo("GUIItemNumber", ItemNumber)
	return

	; Send
	::vnr::
	SendInput %ItemNumber%
	return

 	; FIRMANAVN
	; Grab
	< & f::
	CompanyName := GetInfo("Firmanavn")
	Sleep 300
	UpdateInfo("GUICompanyName", CompanyName)
	return

	; Send
	::fnav::
	SendInput %CompanyName%
	return

 	; E-MAIL
	; Grab
	< & e::
	Email := GetInfo("E-mailadresse")
	Sleep 300
	UpdateInfo("GUIEmail", Email)
	return

	; Send
	::mail::
	SendInput %Email%
	return

; Put text in object

; Grab text from object and send it

; Suspend script
SC029::
Suspend
return

; Exit app
< & SC00E:: ; Press "<" and "backspace"
ExitApp
return
