extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _input(event: InputEvent) -> void:
#	if event != InputEventMouseMotion:
#		print(event.keycode)


func _on_button_pressed() -> void:
	print("pressed")
	print($Button.shortcut.events[0])


func _on_button_button_up() -> void:
	print("up")


func _on_button_toggled(button_pressed: bool) -> void:
	print(button_pressed)
