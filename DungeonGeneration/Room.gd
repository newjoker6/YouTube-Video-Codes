extends StaticBody2D


export var opendoors: PoolStringArray


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(),"idle_frame")
#	randomize()

	
	
	for opening in opendoors:
		randomize()
		yield(get_tree().create_timer(0.1),"timeout")
		match opening:
			"Bottom":
				if not $BottomCollision.get_overlapping_bodies():
					var num = randi() %RC.top.size()

					var room_inst = RC.top[num].instance()
					get_parent().add_child(room_inst)
					var size = $Sprite.get_texture().get_size()
					room_inst.position.x = self.position.x
					room_inst.position.y = self.position.y + size.y

			"Top":
				if !$TopCollision.get_overlapping_bodies():
					var num = randi() %RC.bottom.size()
					var room_inst = RC.bottom[num].instance()
					get_parent().add_child(room_inst)
					var size = $Sprite.get_texture().get_size()
					room_inst.position.x = self.position.x
					room_inst.position.y = self.position.y - size.y

			"Left":
				if !$LeftCollision.get_overlapping_bodies():
					var num = randi() %RC.right.size()
					var room_inst = RC.right[num].instance()
					get_parent().add_child(room_inst)
					var size = $Sprite.get_texture().get_size()
					room_inst.position.y = self.position.y
					room_inst.position.x = self.position.x + size.x

			"Right":
				if !$RightCollision.get_overlapping_bodies():
					var num = randi() %RC.left.size()
					var room_inst = RC.left[num].instance()
					get_parent().add_child(room_inst)
					var size = $Sprite.get_texture().get_size()
					room_inst.position.y = self.position.y
					room_inst.position.x = self.position.x + size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_TopCollision_body_entered(body):
#	if body is StaticBody2D:
#		print("top collision")
#		skiptop = true
#
#
#func _on_RightCollision_body_entered(body):
#	if body is StaticBody2D:
#		print("right collision")
#		skipright = true
#
#
#func _on_LeftCollision_body_entered(body):
#	if body is StaticBody2D:
#		print("left collision")
#		skipleft = true
