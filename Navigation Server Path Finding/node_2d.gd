extends Node2D

var current_path: PackedVector2Array

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var from_pos: Vector2 = $Sprite2D.position
		var to_pos: Vector2 = get_global_mouse_position()
		var nav_map: RID = get_world_2d().get_navigation_map()
		current_path = NavigationServer2D.map_get_path(nav_map, from_pos, to_pos, false)
		$Line2D.clear_points()
		move(current_path)


func move(path:PackedVector2Array):
	for p in path:
		$Line2D.add_point(p)
		$Line2D.default_color = Color.RED
		$Line2D.width = 5



