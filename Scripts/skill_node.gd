extends Button

@export var Requirements: Array

func CheckUnlock():
	var Unlock = true
	for i in Requirements:
		if !i.Unlocked:
			Unlock = false
	if Unlock:
		Unlock()

func Unlock():
	disabled = false
