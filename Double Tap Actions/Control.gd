extends Control

var gamemode := 0
enum modes {
	Survival,
	Fly
}

var double_tap := 0.25
var mode_timer := 0.0
var start := false

func _process(delta):
	flymode_toggle()
	
	fly_timer(delta)


func flymode_toggle():
	if (Input.is_action_just_released("fly")
	and mode_timer <= double_tap
	and start == true):
		start = false
		mode_timer = 0.0
		gamemode = modes.Fly
		print("FLY")
	
	elif Input.is_action_just_released("fly"):
		start = true
		gamemode = modes.Survival


func fly_timer(delta):
	if start:
		mode_timer += delta
		print(mode_timer)
	
	if mode_timer > double_tap:
		start = false
		mode_timer = 0.0
		gamemode = modes.Survival
		print(mode_timer)
