extends WindowDialog

onready var Game_Path = $LineEdit
onready var Mod_Path = $LineEdit2


func _on_Button_pressed():
	if Game_Path.text != "" and Mod_Path.text != "":
		var game = Game_Path.text.get_file().get_basename()
		Global.Mod_Data[game] = {}
		Global.Mod_Data[game]["ModPath"] = Mod_Path.text
		Global.Mod_Data[game]["Mods"] = []
		Global.Mod_Data[game]["GamePath"] = Game_Path.text
		Global.Mod_Data[game]["LoadOrder"] = []
		Global.save_data()
		get_parent().add_game(game)
		self.queue_free()
