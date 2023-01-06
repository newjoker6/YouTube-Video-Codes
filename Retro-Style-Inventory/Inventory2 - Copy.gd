extends Panel

var current_selected
var item_scene = preload("res://InventoryItem.tscn")
export var selected_colour: Color = Color.darksalmon
export var deselect_colour: Color = Color.transparent
export (String, "Items", "Key") var pouch_type



func add_item(item_name: String):
	var current_amount: int = 1
	
	if item_name in Inventory.PlayerBag[pouch_type].keys():
		
		#if item is already in our bag, update the quantity
		current_amount = Inventory.PlayerBag[pouch_type][item_name]
		Inventory.PlayerBag[pouch_type][item_name] += 1
		var item = get_node("ScrollContainer/VBoxContainer/%s" %item_name)
		item.get_node("Amount").text = "x%s" %str(current_amount + 1)

	else:
		
		#if item not already in bag, add a new item scene/object with a
		#quantity of 1
		Inventory.PlayerBag[pouch_type][item_name] = 1
		var i_inst = item_scene.instance()
		get_node("ScrollContainer/VBoxContainer").add_child(i_inst)
		i_inst.get_node("ItemText").text = item_name.to_upper()
		i_inst.get_node("Amount").text = "x%s" %str(Inventory.PlayerBag[pouch_type][item_name])
		i_inst.name = item_name



#when item clicked on, updates colour and description box
func item_selected(item: ColorRect) -> void:
	
	#checks if there was something selected and if it still exists
	if current_selected and is_instance_valid(current_selected):
		current_selected.color = deselect_colour
	current_selected = item
	current_selected.color = selected_colour
	
	#check if description box exists in the given path
	var desc_box = get_node_or_null("../../ColorRect/ItemDescription")
	if desc_box != null:
		desc_box.text = GameItems.game_items[item.name]


#sets item colour to transparent when deselected
func item_deselected(item:ColorRect) -> void:
	item.color = deselect_colour






