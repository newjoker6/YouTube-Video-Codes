extends CanvasLayer




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("PopUp")
	yield($AnimationPlayer,"animation_finished")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play_backwards("PopUp")
	yield($AnimationPlayer,"animation_finished")
	self.queue_free()

