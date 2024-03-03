extends TextureProgressBar


func _ready() -> void:
	self.value = self.max_value
	get_child(0).value = self.max_value


func hurt(amount: int):
	if value == 0:
		return
	get_child(0).value -= amount
#	await get_tree().create_timer(0.3).timeout
	var t = create_tween()
	t.tween_property(self, "value", get_child(0).value, 0.4)
	

