extends CharacterBody2D


const SPEED = 300.0


@onready var Map = $"../CanvasLayer/MapBG/SubViewportContainer/SubViewport/Camera2D"

@export_range(0, 1, 1, "hide_slider", "or_greater")
var UnassignedInt: int = 0

func _ready() -> void:
	pass
	QuestManager.addQuest("MQ001")
	QuestManager.advanceQuest("MQ001")
	var trigger = load("res://location_trigger.tscn")
	var ti = trigger.instantiate()
	ti.QuestID = "MQ001"
	$"../".add_child.call_deferred(ti)

func _physics_process(delta: float) -> void:
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
		Map.updateMap()
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
		Map.updateMap()
	if not directionx:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not directiony:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_F):
		Map.add_marker(Vector2(448, 220))
	
	if Input.is_key_pressed(KEY_L):
		$playerlight.visible = !$playerlight.visible
	
	if Input.is_action_just_pressed("ui_accept"):
		var journal = $"../CanvasLayer/Journal"
		if journal.visible:
			journal.visible = false
			return
		journal.visible = true
		journal.UpdateJournal()






