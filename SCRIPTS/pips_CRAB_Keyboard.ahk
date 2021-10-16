/*

*/
#Singleinstance force ;; чтобы не открывался несколько раз
#Persistent ;; Держать открытым пока пользователь сам не закроет скрипт из панели или горячей клавишей


;; Клавиши пипок
SYS = {Left}
ENG = {Up}
WEP = {Right}
RST = {Down}

;; задержка по 30 милисекунд между нажатиями
SetKeyDelay, 30

;; ФУНКЦИИ ;;
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

;; Назначение функций на кнопки ;;
/*

^ - CTRL
+ - SHIFT
! - ALT

*/

r::PIP420()

t::PIP042()

y::PIP402()

;; CTRL+0 закрыть скрипт если напортачил и начала творится лютая дичь...
^0::exitapp
