extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.y += 500

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		velocity.y = 0
		body.CreateSplatterPoint(self.position)
		self.queue_free()
