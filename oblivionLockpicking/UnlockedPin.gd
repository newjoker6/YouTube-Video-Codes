extends Sprite2D

var canLock:bool = false
var isLocked: bool = false
var DifficultyMultiplier: float = 0.0


func _ready() -> void:
	add_to_group("UnlockedPins")
	var dif: int = get_parent().LockDifficulty
	DifficultyMultiplier = get_parent().LockMultiplier[dif]
	$Area2D.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.setActivePin(self)
	var t: Tween = get_tree().create_tween()
	t.tween_property(self, "position", Vector2(position.x, 208), 0.02)
	canLock = true
	await get_tree().create_timer(randf_range(0.01, 0.5 * DifficultyMultiplier)).timeout
	
	if isLocked == false:
		canLock = false
		t = get_tree().create_tween()
		t.tween_property(self, "position", Vector2(position.x, 272), 0.5)
	
	body.call_deferred("setActivePin", null)


func reset() -> void:
	position = Vector2(position.x, 272)
	canLock = false
	isLocked = false
