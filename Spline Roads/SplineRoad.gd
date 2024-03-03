extends Node3D

var test: Array = [0, 1, 2]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(test[2])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
