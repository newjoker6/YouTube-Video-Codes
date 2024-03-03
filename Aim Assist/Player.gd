extends CharacterBody2D

var slowdown: int = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $Sprite2D/AimAssistRay.is_colliding():
		var t = create_tween()
		var mouse_pos = get_global_mouse_position()
		var dir = self.position.direction_to(mouse_pos)
		var angle = dir.angle()
		t.tween_property(self, "rotation", angle, 0.1 * slowdown)

	else:
		#self.look_at(get_global_mouse_position())
		var t = create_tween()
		var mouse_pos = get_global_mouse_position()
		var dir = self.position.direction_to(mouse_pos)
		var angle = dir.angle()
		t.tween_property(self, "rotation", angle, 0.1)





