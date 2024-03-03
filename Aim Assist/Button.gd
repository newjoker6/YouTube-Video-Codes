extends Button


func _on_pressed() -> void:
	print("pressed")


func _on_button_up() -> void:
	print("up")


func _on_button_down() -> void:
	print("down")


func _on_toggled(toggled_on: bool) -> void:
	print("toggled")
