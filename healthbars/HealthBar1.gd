extends TextureProgressBar


func _ready() -> void:
	self.value = self.max_value


func hurt(amount: int):
	if value == 0:
		return
	value -= amount

