extends KinematicBody2D


var velocity := Vector2.ZERO



func _ready():
	print(Input.get_accelerometer())



func _process(delta):
	self.rotate(deg2rad(round(Input.get_accelerometer().x)))
	
	move_and_slide(velocity, Vector2.UP)
