extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	ProjectSettings.set_setting("input_devices/pointing/emulate_touch_from_mouse", false)
	
	var ToBu = TouchScreenButton.new()
	
	ToBu.normal = load("res://icon.png")
	ToBu.pressed = load("res://icon.png")
	
	ToBu.position = Vector2(100,100)
	
#	ToBu.connect("released", self, "_on_touch_pressed")
	ToBu.action = "ui_down"
	
	ToBu.name = "MyCustomTouchButton"
	ToBu.visibility_mode = 1
	
	add_child(ToBu)



func _on_touch_pressed():
	print("hello")


func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		print("ui_down has been pressed")
