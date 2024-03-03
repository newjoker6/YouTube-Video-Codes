extends Node


func LethalTouch():
	GameManager.Target.queue_free()

func GenericAttack():
	print("I did the ouchies")
