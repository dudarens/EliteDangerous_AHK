/*

*/

;; JoystickNumber
joyNb = 1

;; Валидация на наличие джойстика
GetKeyState, joyName, %joyNb%joyName
if joyName =
{
	MsgBox Где джой?
	ExitApp
}

#Singleinstance force ;; чтобы не открывался несколько раз
#Persistent ;; Держать открытым пока пользователь сам не закроет скрипт из панели или горячей клавишей


;; Клавиши пипок
SYS = {Left}
ENG = {Up}
WEP = {Right}
RST = {Down}

;; задержка по 30 милисекунд между нажатиями
SetKeyDelay, 30

;; Таймер 100 милисекунд выполняющий функцию опроса Хатки
SetTimer, WatchPOV, 100

;;FUNCTIONS;;
WatchPOV() {
	GetKeyState, pOVState, %joyNb%JoyPOV  ; Get position of the POV control.
	
	;; Для дебага..
	;; ToolTip test:%pOVState%
	
	if previousPOVState = pOVState
	{
		return
	}
	
	;; Назначение функций на положенин Хатки ;;
	switch pOVState
	{
		case 27000:
			PIP420()

		case 0:   
			PIP042()

		case 9000: 
			PIP402()

		case 18000:
			ResetPIPs()
	}
	
	previousPOVState = pOVState
	return
}

;;FUNCTIONS;;
PIP420() {
Global RST, WEP, ENG, SYS
	send %RST%
	send %ENG%
	send %SYS%
	send %SYS%
	send %SYS%
}

PIP042() {
Global RST, WEP, ENG, SYS
	send %RST%
	send %WEP%
	send %ENG%
	send %ENG%
	send %ENG%
}

PIP402() {
Global RST, WEP, ENG, SYS
	send %RST%
	send %WEP%
	send %SYS%
	send %SYS%
	send %SYS%
}

ResetPIPs() {
Global RST, WEP, ENG, SYS
	send %RST%
}

;; CTRL+0 закрыть скрипт если напортачил и начала творится лютая дичь...
^0::exitapp

