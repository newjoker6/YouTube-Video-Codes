extends CharacterBody2D

var activePin: Sprite2D = null

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pickleft"):
		self.position.x = max(self.position.x - 50, 240)
	
	elif Input.is_action_just_pressed("pickright"):
		self.position.x = min(self.position.x + 50, 440)
	
	elif Input.is_action_just_pressed("pick"):
		var t: Tween = get_tree().create_tween()
		t.tween_property(self, "position", Vector2(position.x, 336), 0.05)
		
		await get_tree().create_timer(0.2).timeout
		t = get_tree().create_tween()
		t.tween_property(self, "position", Vector2(position.x, 360), 0.05)

	elif Input.is_action_just_pressed("setTumbler"):
		if activePin != null:
			if activePin.canLock == true:
				activePin.isLocked = true
				var unlock:bool = true
				for pin:Sprite2D in get_tree().get_nodes_in_group("UnlockedPins"):
					if pin.isLocked == false:
						unlock = false
						break
				if unlock == true:
					print("Unlocked Door")
		
		else:
			for pin: Sprite2D in get_tree().get_nodes_in_group("UnlockedPins"):
				pin.reset()
			setActivePin(null)



func setActivePin(pin: Sprite2D) -> void:
	activePin = pin
