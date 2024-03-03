extends Sprite2D

signal MaxSpeedUpdated

var speed : int = 5:
	get:
		return speed
	set(value):
		speed = value

var maxspeed : int = 5:
	get:
		return maxspeed
	set(value):
		emit_signal("MaxSpeedUpdated")
		maxspeed = value


func _ready() -> void:
	self.connect("MaxSpeedUpdated", Callable(self, "test"))
	set("speed", 2)
	print(speed)
	set("maxspeed", 4)
	print(maxspeed)

func test():
	print("max speed has changed")
