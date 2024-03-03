extends CharacterBody2D

var Speed:int = 200
var Health:int = 100

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	$Label.text = "Health: %s" %Health
	Ouchie()


func _process(_delta: float) -> void:
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * Speed
	move_and_slide()


func Ouchie():
	var rn = randi_range(1, 5)
	Health -= rn
	$Label.text = "Health: %s" %Health
	if Health > 0:
		await get_tree().create_timer(3).timeout
		Ouchie()









