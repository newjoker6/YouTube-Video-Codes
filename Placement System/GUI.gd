extends CanvasLayer

onready var ObjectTray = $ColorRect/ScrollContainer/HBoxContainer
onready var GhostItem = $GhostItem
var selectedObject: String


func TrayItemSelected(item, texture) -> void:
	GhostItem.placing = false
	if GhostItem.placing == false:
		selectedObject = item
		GhostItem.texture = texture
		GhostItem.placing = true


func _input(event) -> void:
	if event.is_action_released("Left Click") and GhostItem.placing == true:
		GhostItem.placing = false
		place_item(GhostItem.texture, GhostItem.rect_position)


func place_item(texture, pos) -> void:
	var object = load("res://DemoBuilding.tscn")
	var obj_inst = object.instance()
	get_parent().add_child(obj_inst)
	obj_inst.texture = texture
	obj_inst.rect_position = pos












