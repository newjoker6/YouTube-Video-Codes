extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("screenshot"):
		var capture
		var date
		var time
		var datetime = OS.get_datetime()
		date = "%s-%s-%s" %[datetime.day, datetime.month, datetime.year]
		time = "%s-%s-%s" %[datetime.hour, datetime.minute, datetime.second]
		capture = get_viewport().get_texture().get_data()
		capture.flip_y()
		capture.save_png("user://%s-%s.png" %[date, time])
		OS.shell_open(OS.get_user_data_dir())
