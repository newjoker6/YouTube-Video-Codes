extends Control

@export var customShortcut := InputEventKey.new()


func _ready() -> void:
	
	customShortcut.keycode = KEY_A
	customShortcut.ctrl_pressed = true


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var keyEvent = event as InputEventKey
		if (keyEvent.keycode == customShortcut.keycode && 
		keyEvent.ctrl_pressed == customShortcut.ctrl_pressed):
			print("Match Found")


