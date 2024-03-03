extends PointLight2D

var bfollowMouse: bool = false
var bisTorch: bool = false


func _ready() -> void:
	bfollowMouse = false
	bisTorch = true
	torch()


func _process(delta: float) -> void:
	if bfollowMouse:
		self.position = get_global_mouse_position()
	


func torch() -> void:
	if !bisTorch:
		return
	var t = create_tween()
	t.connect("finished", Callable(self, "tweenFinished"))
	t.tween_property(self, "scale", Vector2(0.8, 0.8), 0.2)
	t.chain().tween_property(self, "scale", Vector2(1, 1), 0.2)
	

func tweenFinished() -> void:
	if bisTorch:
		torch()
