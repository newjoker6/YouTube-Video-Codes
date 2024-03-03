extends CharacterBody2D

var dir = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#global_position.x += 1 * dir
	#if global_position.x > 1000:
		#dir = -1
	#elif global_position.x < 10:
		#dir = 1
	velocity.x = 10
	velocity.y = 20
	move_and_slide()
