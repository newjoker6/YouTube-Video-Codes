class_name Players extends CharacterBody2D

var buffer: Array = []
var timer: float = 0.0
var interval: float = 0.3


func add_input(input: String):
	buffer.append(input)
	printt("Buffered inputs:",get_buffer())
	check_combos()


func get_buffer() -> Array:
	return buffer.duplicate()


func clear():
	buffer.clear()


func check_combos():
	var fireball_sequence = ["crouch", "right", "special"]
	if buffer.size() >= fireball_sequence.size():
		var recent = buffer.slice(-fireball_sequence.size(), buffer.size())
		if recent == fireball_sequence:
			print_rich("[img=400]res://fireball.jpg[/img]")
			clear()


func _ready():
	print("Buffered inputs:", get_buffer())
	clear()


func _process(delta):
	for action in InputMap.get_actions():
		if Input.is_action_just_pressed(action):
			add_input(action)
	if buffer.is_empty():
		timer = 0.0
		return
	timer += delta
	if timer >= interval and buffer.size() > 0:
		clear()
		printt("Buffered inputs:",get_buffer())
		timer = 0.0
		
