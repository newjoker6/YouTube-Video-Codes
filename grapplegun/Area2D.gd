extends Area2D


var mp
var hook = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	mp = get_viewport().get_mouse_position()
	move_toward(get_parent().position, mp, 4)




	
