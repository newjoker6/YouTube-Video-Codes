extends Skeleton3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_bone("chestbone")
	print(self.get_bone_count())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
