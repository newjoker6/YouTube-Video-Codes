extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Achievements.achievement_unlock("000")
	yield(get_tree().create_timer(4), "timeout")
	$Achievements.achievement_unlock("001")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
