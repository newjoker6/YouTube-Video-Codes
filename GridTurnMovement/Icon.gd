extends Sprite2D

@onready var test: Sprite2D = $"%mynew sprite"
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(test.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
