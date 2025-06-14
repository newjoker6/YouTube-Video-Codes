class_name Player extends CharacterBody2D


class InputBuffer:
	var buffer: Array = []
	var timer: float = 0.0
	var interval: float = 0.3 # seconds

	func add_input(input: String):
		buffer.append(input)
		printt("Buffered inputs:",get_buffer())
		check_combos()

	func get_buffer() -> Array:
		return buffer.duplicate()

	func clear():
		buffer.clear()

	func update(delta: float):
		if buffer.is_empty():
			timer = 0.0
			return
		timer += delta
		if timer >= interval and buffer.size() > 0:
			#buffer.pop_front()
			clear()
			printt("Buffered inputs:",get_buffer())
			timer = 0.0
	
	func check_combos():
		var fireball_sequence = ["crouch", "right", "special"]
		if buffer.size() >= fireball_sequence.size():
			var recent = buffer.slice(-fireball_sequence.size(), buffer.size())
			if recent == fireball_sequence:
				print_rich("[img=400]res://fireball.jpg[/img]")
				clear()


var input_buffer = InputBuffer.new()

func _ready():
	print("Buffered inputs:", input_buffer.get_buffer())
	input_buffer.clear()


func _process(delta):
	input_buffer.update(delta)
	for action in InputMap.get_actions():
		if Input.is_action_just_pressed(action):
			input_buffer.add_input(action)
