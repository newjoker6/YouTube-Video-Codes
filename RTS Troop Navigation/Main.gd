extends Node2D


func _process(_delta):
	if Input.is_action_just_released("leftclick"):
		$character.set_destination(get_global_mouse_position())
