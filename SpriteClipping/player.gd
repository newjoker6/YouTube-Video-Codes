extends CharacterBody2D


var colours := [Color.CADET_BLUE, Color.HOT_PINK, Color.LIME, Color.DARK_SALMON, Color.CRIMSON, Color.BISQUE]


func CreateSplatterPoint(impact: Vector2):
	var splat = load("res://splat.tscn")
	var splat_inst = splat.instantiate()
	$PlayerSprite.add_child(splat_inst)
	
	splat_inst.modulate = colours.pick_random()
	var rand_scale = randf_range(0.05, 0.1)
	splat_inst.scale.x = rand_scale
	splat_inst.scale.y = rand_scale
	
	splat_inst.global_position = impact
	
