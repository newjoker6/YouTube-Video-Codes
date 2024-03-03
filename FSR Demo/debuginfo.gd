extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var fps:String = str(Engine.get_frames_per_second())
	var mode = ProjectSettings.get_setting("rendering/scaling_3d/mode")
	match mode:
		0:
			mode = "Bilinear"
		1:
			mode = "FSR 1"
		2:
			mode = "FSR 2"
	var newtext:String = "FPS: " + fps + "\n" + "Mode: " + mode
	self.text = newtext
