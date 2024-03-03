extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var m = $jam/Jar.get_mesh().surface_get_material(0).duplicate()
	var nm = m.duplicate()
	m.set_next_pass(load("res://outline_shader_material.material"))
	$jam/Jar.get_mesh().surface_set_material(0, m)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
