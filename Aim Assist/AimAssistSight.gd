extends TextureRect


func _ready() -> void:
	var screen = DisplayServer.window_get_size()
	self.position = Vector2(screen.x/2 - 32.5,screen.y/2 - 32.5 )

