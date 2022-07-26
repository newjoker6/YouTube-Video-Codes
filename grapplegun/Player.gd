extends KinematicBody2D


var velocity = Vector2.ZERO
var gravity = 80
var hook = preload("res://hook.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement()
	gravity()
	move_and_slide(velocity)



func movement():
	if Input.is_action_pressed("ui_right"):
		velocity.x = 500
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -500
	elif Input.is_action_pressed("grapple"):
		var hook_inst = hook.instance()
		get_parent().add_child(hook_inst)
	elif Input.is_action_just_pressed("jump"):
		velocity.y = 0
		velocity.y -= 1000
	else:
		velocity.x = 0


func gravity():
	velocity.y += gravity



