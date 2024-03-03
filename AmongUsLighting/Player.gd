extends Sprite2D

var speed: int = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		self.position.y -= speed
	if Input.is_action_pressed("ui_down"):
		self.position.y += speed
	if Input.is_action_pressed("ui_left"):
		self.position.x -= speed
	if Input.is_action_pressed("ui_right"):
		self.position.x += speed
	if Input.is_action_pressed("ui_accept"):
		self.rotation += deg_to_rad(1)
