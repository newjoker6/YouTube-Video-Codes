extends Control

var mods:Array
var mod_folder := "E:\\PCUSER\\Documents\\Youtube Videos\\Mod_Test\\"
export var texture :StreamTexture

func _ready():
	var packer = PCKPacker.new()
	packer.pck_start("test.pck")
	packer.add_file("res://icon.png", "icon.png")
	packer.flush()
	get_mods(mod_folder)
	load_mods()
	load_texture($TextureRect, "res://icon.png")


func load_mods():
	if mods:
		for m in mods:
			ProjectSettings.load_resource_pack(m)


func get_mods(path):
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
					mods.append(mod_folder + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")



func load_texture(obj, path):
	var img = Image.new()
	img.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(img)
	obj.texture = texture
