extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_timer_timeout() -> void:
	var ri = randi_range(10, 20)
	get_tree().call_group("Health", "hurt", ri)
