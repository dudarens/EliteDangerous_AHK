/*

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Singleinstance force ;; чтобы не открывался несколько раз
#Persistent ;; Держать открытым пока пользователь сам не закроет скрипт из панели или горячей клавишей


;; Клавиши пипок
SYS = {Left}
ENG = {Up}
WEP = {Right}
RST = {Down}

;; задержка по 30 милисекунд между нажатиями
SetKeyDelay, 30

;; Назначение функций на кнопки ;;
/*

^ - CTRL
+ - SHIFT
! - ALT

Alt + A — 420
Alt + S — 402
Alt + D — 024
Alt + F — 204
Alt + Q — 240
Alt + W — 042
Alt + E — 303
Alt + R — 033
*/

!a::PIPCombinationGenerate(4, 2, 0)

!s::PIPCombinationGenerate(4, 0, 2)

!d::PIPCombinationGenerate(0, 2, 4)

!f::PIPCombinationGenerate(2, 0, 4)

!q::PIPCombinationGenerate(2, 4, 0)

!w::PIPCombinationGenerate(0, 4, 2)

!e::PIPCombinationGenerate(3, 0, 3)

!r::PIPCombinationGenerate(0, 3, 3)


;; CTRL+0 закрыть скрипт если напортачил и начала творится лютая дичь...
^0::exitapp


;; Функция генирирующяя нажатия пипок по комбинации, тут ничего менять не надо XD

PIPCombinationGenerate(sysCount, engCount, wepCount) {
Global RST, WEP, ENG, SYS

	;; НАЧАЛО Валидация параметров
	;; Если параметры не верны, ничего не делать
	PIPS_MAX = 4
	PIPS_TOTAL = 6
	
	if(sysCount is not number or engCount is not number or wepCount is not number) {
		return
	}
	
	if(sysCount < 0 or engCount < 0 or wepCount < 0) {
		return
	}
	
	if(sysCount > PIPS_MAX or engCount > PIPS_MAX or wepCount > PIPS_MAX) {
		return
	}
	
	if((sysCount + engCount + wepCount) != PIPS_TOTAL) {
		return
	}	
	;; КОНЕЦ Валидация параметров
	
	combination = %sysCount%%engCount%%wepCount%
	send %RST%
	
	switch combination
	{
		case "114":
			send %WEP%
			send %WEP%
			return
		case "141":
			send %ENG%
			send %ENG%
			return
		case "411":
			send %SYS%
			send %SYS%
			return
		case "204":
			send %SYS%
			send %WEP%
			send %WEP%
			send %WEP%
			return
		case "330":
			send %SYS%
			send %SYS%
			send %ENG%
			send %ENG%
			return
		case "240":
			send %SYS%
			send %ENG%
			send %ENG%
			send %ENG%
			return
		case "033":
			send %ENG%
			send %ENG%
			send %WEP%
			send %WEP%
			return
		case "042":
			send %ENG%
			send %ENG%
			send %WEP%
			send %ENG%
			return
		case "402":
			send %SYS%
			send %SYS%
			send %WEP%
			send %SYS%
			return
		case "303":
			send %SYS%
			send %SYS%
			send %WEP%
			send %WEP%
			return
		case "420":
			send %SYS%
			send %SYS%
			send %ENG%
			send %SYS%
			return
		case "024":
			send %ENG%
			send %WEP%
			send %WEP%
			send %WEP%
			return
		case "123":
			send %SYS%
			send %WEP%
			send %WEP%
			send %WEP%
			send %ENG%
			send %ENG%
			return
		case "132":
			send %SYS%
			send %ENG%
			send %ENG%
			send %ENG%
			send %WEP%
			send %WEP%
			return
		case "321":
			send %SYS%
			send %SYS%
			send %WEP%
			send %SYS%
			send %ENG%
			send %ENG%
			return
		case "213":
			send %ENG%
			send %WEP%
			send %WEP%
			send %WEP%
			send %SYS%
			send %SYS%
			return
		case "312":
			send %SYS%
			send %SYS%
			send %ENG%
			send %SYS%
			send %WEP%
			send %WEP%
			return
		case "231":
			send %ENG%
			send %ENG%
			send %WEP%
			send %ENG%
			send %SYS%
			send %SYS%
			return
		default:
			return
	}
	
	return
}
