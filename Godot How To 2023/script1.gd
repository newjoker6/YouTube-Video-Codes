extends Node2D

@export var script2: GDScript
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello from default script")
	script2.call("greet", "hello")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
