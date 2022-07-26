extends Control




# Called when the node enters the scene tree for the first time.
func _ready():
#	ProjectSettings.set_setting("input_devices/pointing/emulate_touch_from_mouse", true)
	var ToBu = TouchScreenButton.new()
	
	ToBu.normal = load("res://icon.png")
	ToBu.pressed = load("res://icon.png")
	
	ToBu.position = Vector2(100, 100)
	
#	ToBu.connect("released", self, "_on_release")
	ToBu.action = "ui_down"
	ToBu.name = "CustomTouchButton"
	
	ToBu.modulate = Color.coral
	ToBu.scale.x = 3
	ToBu.scale.y = 3
	
	add_child(ToBu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_down"):
		print("ui_down has been pressed")


func _on_release():
	print("button released")
