extends KinematicBody2D

var boomer = preload("res://projectile.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("left click"):
		throw()


func throw():
	var click = get_global_mouse_position()
	var p = boomer.instance()
	get_parent().add_child(p)
	p.position = self.position
	p.move(click)
