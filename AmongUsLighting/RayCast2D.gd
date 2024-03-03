extends RayCast2D



func _process(_delta: float) -> void:
	if self.is_colliding():
		if self.get_collider() as PhysicsBody2D is CharacterBody2D:
			var body: PhysicsBody2D = self.get_collider()
			printt(name, body.name)

