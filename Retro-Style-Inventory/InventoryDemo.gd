extends Control


var active_pouch: int
var pouches: Array


func _ready() -> void:
	pouches = $Bag.get_children()
	
	Inventory.add_item("Potion")
	Inventory.add_item("Potion")
	Inventory.add_item("Potion")
	Inventory.add_item("Hyper Potion")
	Inventory.add_item("Hyper Potion")
	Inventory.add_item("Full Heal")
	Inventory.add_key_item("Bicycle")
	Inventory.add_key_item("Lift Key")
	
#	$Bag/ItemsPouch.add_item("Potion")
#	$Bag/ItemsPouch.add_item("Potion")
#	$Bag/ItemsPouch.add_item("Full Heal")
#	$Bag/ItemsPouch.add_item("Full Heal")
#	$Bag/KeyItemsPouch.add_item("Bicycle")
#	$Bag/KeyItemsPouch.add_item("Lift Key")



func _input(_event: InputEvent) -> void:
	
	#if right arrow key pressed, change bag pouch
	if Input.is_action_just_released("ui_right"):
		get_node("Bag/%s" %pouches[active_pouch]).visible = false
		active_pouch += 1
		if active_pouch >= pouches.size():
			active_pouch = 0
		get_node("Bag/%s" %pouches[active_pouch]).visible = true
		$ColorRect2/PouchLabel.text = pouches[active_pouch].name
		$ColorRect/ItemDescription.text = ""
	
	#if left arrow key pressed, change bag pouch
	elif Input.is_action_just_released("ui_left"):
		get_node("Bag/%s" %pouches[active_pouch]).visible = false
		active_pouch -= 1
		if active_pouch < 0:
			active_pouch = pouches.size() - 1
		get_node("Bag/%s" %pouches[active_pouch]).visible = true
		$ColorRect2/PouchLabel.text = pouches[active_pouch].name
		$ColorRect/ItemDescription.text = ""
