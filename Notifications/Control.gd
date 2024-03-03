extends Control

var cur_vol:int



func _notification(what):
	match what:
		NOTIFICATION_WM_FOCUS_IN:
			AudioServer.set_bus_volume_db(0, cur_vol)
			
		NOTIFICATION_WM_FOCUS_OUT:
			cur_vol = AudioServer.get_bus_volume_db(0)
			AudioServer.set_bus_volume_db(0, -80)

var mouse_x
var mouse_y

func _process(delta):
	mouse_y = get_global_mouse_position().y
	mouse_x = get_global_mouse_position().x
	if Input.is_key_pressed(KEY_D):
		get_viewport().warp_mouse(Vector2(mouse_x+10, mouse_y))
	if Input.is_key_pressed(KEY_A):
		get_viewport().warp_mouse(Vector2(mouse_x-10, mouse_y))
