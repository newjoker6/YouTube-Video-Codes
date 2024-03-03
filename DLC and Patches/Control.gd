extends Control


var wallpapers: Array
var wallpaper_path := "res://Wallpaper/"
var dlc_wallpaper_path := "res://DLCWallpaper/"


func _ready():
	setup()
	get_wallpaper(wallpaper_path)
	get_wallpaper(dlc_wallpaper_path)
	add_wallpaper()
	connect_signals()



func setup():
	$OptionButton.add_item("Select Wallpaper")
	$OptionButton.set_item_disabled(0, true)
	
	var err = ProjectSettings.load_resource_pack("E:\\PCUSER\\Documents\\DLCWallpaper.pck")
	if int(err) != OK:
		print("error loading file")

func connect_signals():
	$OptionButton.connect("item_selected", self, "wallpaper_selected")

func wallpaper_selected(idx):
	var bg = $OptionButton.get_item_text(idx)
	$TextureRect.texture = load(bg)


func add_wallpaper():
	for i in wallpapers:
		i = i.replace(wallpaper_path, "")
		$OptionButton.add_item(i)


func get_wallpaper(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if not '.import' in file_name:
					print("Found file: " + file_name)
					wallpapers.append(path + file_name)
			file_name = dir.get_next()
