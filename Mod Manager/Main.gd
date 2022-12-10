extends Control

var add_game_window = preload("res://AddGame.tscn")
onready var plugin_list = $TabContainer/Plugins/ScrollContainer2/ItemList


func _ready():
	if !Global.check_file(Global.Mod_Data_Path):
		var add_inst = add_game_window.instance()
		self.add_child(add_inst)
		add_inst.popup_centered()
	else:
		load_games()
		_on_OptionButton_item_selected($OptionButton.get_selected_id())


func load_games() -> void:
	for game in Global.Mod_Data.keys():
		add_game(game)


func add_game(gamename:String) -> void:
	$OptionButton.add_item(gamename)
	$OptionButton.selected = $OptionButton.get_item_count()-1


func _on_OptionButton_item_selected(index) -> void:
	var item_name = $OptionButton.get_item_text(index)
	match item_name:
		"Add New Game":
			var add_inst = add_game_window.instance()
			self.add_child(add_inst)
			add_inst.popup_centered()
		
		_:
			Global.get_mods(item_name, Global.Mod_Data[item_name]["ModPath"])
			for mod in Global.Mod_Data[item_name]["Mods"]:
				$ScrollContainer/ItemList.add_item(mod.get_basename())
			add_load_order(item_name)


func add_load_order(game:String) -> void:
	for mod in Global.Mod_Data[game]["LoadOrder"]:
		plugin_list.add_item(mod.get_basename())


func add_to_load_order(game:String) -> void:
	var pl = get_all_items(plugin_list)
	for p in pl:
		
		if "%s.zip" %p in Global.Mod_Data[game]["Mods"]:
			if not "%s.zip" %p in Global.Mod_Data[game]["LoadOrder"]:
				Global.Mod_Data[game]["LoadOrder"].append("%s.zip" %p)
		
		elif "%s.pck" %p in Global.Mod_Data[game]["Mods"]:
			if not "%s.pck" %p in Global.Mod_Data[game]["LoadOrder"]:
				Global.Mod_Data[game]["LoadOrder"].append("%s.pck" %p)
	print(Global.Mod_Data[game]["LoadOrder"])


func _on_EnableButton_pressed() -> void:
	var mod_indices = $ScrollContainer/ItemList.get_selected_items()
	for idx in mod_indices:
		var mod = $ScrollContainer/ItemList.get_item_text(idx)
		var active_mods = get_all_items(plugin_list)
		if not mod in active_mods:
			plugin_list.add_item(mod)


func get_all_items(list:ItemList) -> Array:
	var item_list = []
	for i in range(list.get_item_count()):
		item_list.append(list.get_item_text(i))
	return item_list


func _on_SaveLoadOrder_pressed() -> void:
	var game = $OptionButton.get_item_text($OptionButton.get_selected_id())
	add_to_load_order(game)
	Global.save_data()


func _on_PluginList_item_activated(index) -> void:
	var mod = plugin_list.get_item_text(index)
	var game = $OptionButton.get_item_text($OptionButton.get_selected_id())
	
	if "%s.zip" %mod in Global.Mod_Data[game]["LoadOrder"]:
		Global.Mod_Data[game]["LoadOrder"].erase("%s.zip" %mod)
		
	elif "%s.pck" %mod in Global.Mod_Data[game]["LoadOrder"]:
		Global.Mod_Data[game]["LoadOrder"].erase("%s.pck" %mod)
	
	plugin_list.remove_item(index)


func _on_Upbutton_pressed():
	var items = plugin_list.get_selected_items()
	var game = $OptionButton.get_item_text($OptionButton.get_selected_id())
	for i in items:
		plugin_list.move_item(i, i-1)
		var mod = Global.Mod_Data[game]["LoadOrder"].pop_at(i)
		Global.Mod_Data[game]["LoadOrder"].insert(i-1, mod)


func _on_DownButton_pressed():
	var items = plugin_list.get_selected_items()
	var game = $OptionButton.get_item_text($OptionButton.get_selected_id())
	for i in items:
		plugin_list.move_item(i, i+1)
		var mod = Global.Mod_Data[game]["LoadOrder"].pop_at(i)
		Global.Mod_Data[game]["LoadOrder"].insert(i+1, mod)


func _on_Button_pressed():
	var game = $OptionButton.get_item_text($OptionButton.get_selected_id())
	OS.shell_open(Global.Mod_Data[game]["GamePath"])












