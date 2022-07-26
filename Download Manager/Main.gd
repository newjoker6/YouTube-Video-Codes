extends Control


var d_path := "E:/PCUSER/Downloads/"
var current_date := OS.get_datetime()

var music_path := "E:/PCUSER/Music/DownloadedMusic/"
var image_path := "E:/PCUSER/Pictures/DownloadedImages/"

var image_ext := ['png', 'jpg', 'jpeg', 'gif', 'psd']
var audio_ext := ['mp3', 'ogg', 'wav', 'm4a']
var video_ext := ['mp4', 'ogv', 'aav']


func _ready():
	$Timer.start()


func check_files(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			if dir.current_is_dir():
				pass
				
			else:
				var f = File.new()
				var file_time = OS.get_datetime_from_unix_time(f.get_modified_time("%s%s" %[path, file_name]))
				f.close()

				check_time()
#				if file_name == 'debug.png':
#					printt(file_time, current_date)
				if file_time.hour-7 == current_date.hour and file_time.minute == current_date.minute:
					if file_time.year == current_date.year and file_time.month == current_date.month and file_time.day == current_date.day:
						
						if file_name.get_extension() in image_ext:
							dir.copy("%s%s" %[path, file_name], "%s%s" %[image_path, file_name])
							dir.remove("%s%s" %[path, file_name])
							
						elif file_name.get_extension() in audio_ext:
							dir.copy("%s%s" %[path, file_name], "%s%s" %[music_path, file_name])
							dir.remove("%s%s" %[path, file_name])

			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func check_time():
	current_date = OS.get_datetime()


func _on_Timer_timeout():
#	print('checking')
	check_files(d_path)
	$Timer.start()


