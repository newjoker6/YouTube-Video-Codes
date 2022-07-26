extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	self.z_index = -10
	position = get_parent().get_node("Player").position
	var mp = get_viewport().get_mouse_position()
	velocity = position.direction_to(mp) * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.distance_to(get_parent().get_node("Player").position) > 750:
		queue_free()
	move_and_slide(velocity)



func _on_Area2D_body_entered(body):
	if body.name == "Player" or body.name == "hook":
		return
	elif body.is_in_group("hook_point"):
		velocity = Vector2.ZERO
		get_parent().get_node("Player").velocity = get_parent().get_node("Player").position.direction_to(body.position) * speed
	else:
		queue_free()


func _on_Timer_timeout():
	queue_free()
