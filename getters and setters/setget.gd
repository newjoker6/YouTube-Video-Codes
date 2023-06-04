extends Node2D

signal speed_changed
var speed:int = 5:
	get:
		return speed
	
	set(value):
		emit_signal("speed_changed")
		speed = clamp(value, 0, 10)


func _ready() -> void:
	set("speed", 31)
	print(speed)
	


