extends Camera2D


var speed: int = 2



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.position.x += speed
	if Input.is_action_just_released("flash"):
			flashbang()
			get_parent().get_node("Camera2D/AnimationPlayer").seek(0, true)


func flashbang():
	var flash_path = screengrab()
	var texture = create_tex(flash_path)
	get_parent().get_node("Camera2D/Sprite").texture = texture
	get_parent().get_node("Camera2D/AnimationPlayer").play("flash")


func screengrab():
	var capture
	capture = get_viewport().get_texture().get_data()
	capture.flip_y()
	capture.save_png("user://flashbang.png")
	return "user://flashbang.png"


func create_tex(buffer):
	var image = Image.new()
	var tex = ImageTexture.new()
	image.load(buffer)
	tex.create_from_image(image)
	return tex
