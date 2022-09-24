extends KinematicBody2D


var velocity = Vector2.ZERO
var gravity = 98


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.target_fps = 5



func _process(delta):
	velocity.y += gravity * delta
	move_and_slide(velocity)
