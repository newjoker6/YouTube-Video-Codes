extends Camera2D

@export_category("Camera Properties")
@export var speed: int = 5
@export var sensitivity:int = 20
@export var MaxZoom: float = 2
@export var MinZoom: float = 0.1

func _ready() -> void:
	position_smoothing_enabled = true

func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	var viewport_size: Vector2 = get_viewport().size
	
	var left_threshold:float = sensitivity
	var right_threshold:float = viewport_size.x - sensitivity
	var top_threshold:float = sensitivity
	var bottom_threshold:float = viewport_size.y - sensitivity

	var near_left_edge:bool = mouse_position.x < left_threshold
	var near_right_edge:bool = mouse_position.x > right_threshold
	var near_top_edge:bool = mouse_position.y < top_threshold
	var near_bottom_edge:bool = mouse_position.y > bottom_threshold

	if near_left_edge:
		var direction:Vector2 = Vector2(-1, 0)
		position += direction * speed
		
	elif near_right_edge:
		var direction:Vector2 = Vector2(1, 0)
		position += direction * speed
		
	elif near_top_edge:
		var direction:Vector2 = Vector2(0, -1)
		position += direction * speed
		
	elif near_bottom_edge:
		var direction:Vector2 = Vector2(0, 1)
		position += direction * speed


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Scroll Up"):
		zoom.x = minf(zoom.x + 0.1, MaxZoom)
		zoom.y = zoom.x
	elif Input.is_action_pressed("Scroll Down"):
		zoom.x = maxf(zoom.x - 0.1, MinZoom)
		zoom.y = zoom.x






