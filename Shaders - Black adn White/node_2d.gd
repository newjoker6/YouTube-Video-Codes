extends Node2D
var timer:float
func _process(delta):
	timer += delta
	$Label.text = "%.4f"%timer
