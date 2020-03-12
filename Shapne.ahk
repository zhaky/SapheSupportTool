; Support glue is the script that connects and administers all other suppor scripts.

#SingleInstance force

; Support Palette - This tool is a bunch of shortcuts to copy, paste and administer different informations

;#Include SupportPalette.ahk ; Loads the script into this script

; E-mail tool - This tool helps assign e-mails and automate other e-mail related processes

;#Include FreshDeskTool.ahk

; TESTING

MsgBox, Shapne is running!

; Suspend app
< & w::
Suspend
return

; Exit app
< & q::
ExitApp
return

; Type "<" - just in case it is needed in text
::lt::
SendInput <
return
