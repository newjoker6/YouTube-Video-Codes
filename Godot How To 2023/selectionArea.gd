extends Node2D
@onready var highlight: Sprite2D = $CharacterBody2D/highlight

var zone: ColorRect
var area: Area2D
var areacollide: CollisionShape2D
var selecting: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var selectionzone: ColorRect = ColorRect.new()
	var selectionarea: Area2D = Area2D.new()
	var collidearea: CollisionShape2D = CollisionShape2D.new()
	add_child(selectionzone)
	selectionzone.add_child(selectionarea)
	selectionarea.add_child(collidearea)
	selectionzone.name = "SelectionZone"
	selectionarea.name = "SelectionArea"
	collidearea.name = "CollideArea"
	zone = selectionzone
	area = selectionarea
	areacollide = collidearea
	zone.color = Color(0.5, 0, 0.5, 0.3)
	areacollide.shape = RectangleShape2D.new()

func _process(delta: float) -> void:
	if Input.is_action_pressed("left click"):
		if !selecting:
			zone.global_position = get_global_mouse_position()
			selecting = true
			zone.visible = true
		else:
			var newx: int = get_global_mouse_position().x - zone.global_position.x
			var newy: int = get_global_mouse_position().y - zone.global_position.y
			zone.size.x = newx
			zone.size.y = newy
	
	elif Input.is_action_just_released("left click"):
		selecting = false
		UpdateArea()
		SelectUnits()
		zone.visible = false
		zone.size = Vector2(0,0)

func UpdateArea():
	areacollide.shape.size = zone.size
	printt("Zone: %s" %[zone.size], "Area: %s" %[areacollide.shape.size])

func SelectUnits():
	var units = area.get_overlapping_bodies()
	print(units)
