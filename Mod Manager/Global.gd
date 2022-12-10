extends Node

var Mod_Data_Path := "user://Mod_Data.json"
var Mod_Data : Dictionary = {
}



# Called when the node enters the scene tree for the first time.
func _ready():
	OS.shell_open(OS.get_user_data_dir())
	load_Data()
	OS.window_position = Vector2(OS.get_screen_size()/2 - OS.window_size/2)
	get_tree().get_root().transparent_bg = true
	OS.window_borderless = true
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Main.tscn")
	OS.window_borderless = false


func check_file(path) -> bool:
	var f = File.new()
	if f.file_exists(path):
		return true
	else:
		return false


func save_data() -> void:
	var f = File.new()
	f.open(Mod_Data_Path, f.WRITE)
	f.store_line(to_json(Mod_Data))
	f.close()


func load_Data() -> void:
	if check_file(Mod_Data_Path):
		var f = File.new()
		f.open(Mod_Data_Path, f.READ)
		Mod_Data = parse_json(f.get_as_text())
		f.close()


func get_mods(game, path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				var ext = file_name.get_extension()
				if ext == "zip" or ext == "pck":
					if not file_name in Mod_Data[game]["Mods"]:
						Mod_Data[game]["Mods"].append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")





