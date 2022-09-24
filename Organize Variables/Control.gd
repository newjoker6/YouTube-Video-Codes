tool
extends Control

var move_speed:int
var run_speed:int
var attack_speed:int




func _get(property: String):
	if property == "movement/move_speed":
		return move_speed
	elif property == "movement/run_speed":
		return run_speed

func _set(property: String, value: int):
	if property == "movement/move_speed":
		move_speed = value
	elif property == "movement/run_speed":
		run_speed = value
	return true

func _get_property_list():
	var props: Array
	props.append({
		"name": "movement/move_speed",
		"type": TYPE_INT
	})
	props.append({
		"name": "movement/run_speed",
		"type": TYPE_REAL
	})
	props.append({
		"name": "attack_data/attack_speed",
		"type": TYPE_REAL
	})
	return props








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
		start =false
		mode_timer = 0.0
		gamemode = modes.Fly
		print("fly")
		
		
	elif Input.is_action_just_released("fly"):
		start=true
		gamemode = modes.Survival


func fly_timer(delta):
	if start:
		mode_timer += delta
		print(mode_timer)

	if mode_timer > double_tap:
		start = false
		mode_timer = 0.0







