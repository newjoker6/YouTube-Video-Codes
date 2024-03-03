extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var randomFrame = randi() %64
	self.frame = randomFrame

