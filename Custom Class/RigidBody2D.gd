extends RigidBody2D






func _on_Area2D_body_entered(body: Node) -> void:
	print($Area2D.get_overlapping_bodies())
	if body is KinematicBody2D:
			body.queue_free()
