extends Node2D


var demoscene = preload("res://demosprite.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	yield(get_tree().create_timer(3),"timeout")
	get_tree().quit()
	
#	yield(get_tree().create_timer(3),"timeout")
#	get_tree().change_scene("res://demosprite.tscn")

#	var scene_inst = demoscene.instance()
#	scene_inst.position = Vector2(600, 300)
#	self.add_child(scene_inst)
	
#	yield(get_tree().create_timer(3),"timeout")
#	get_tree().paused = true
#	yield(get_tree().create_timer(3),"timeout")
#	get_tree().paused = false

#
#	yield(get_tree().create_timer(3),"timeout")
#	$KangerSheet.flip_h = true
#	yield(get_tree().create_timer(3),"timeout")
#	$KangerSheet.flip_v = true

