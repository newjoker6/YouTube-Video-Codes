extends TextureRect


var placing: bool = false


func _process(delta):
	if placing == true:
		visible = true
		self.rect_position = get_global_mouse_position()
	else:
		visible = false
