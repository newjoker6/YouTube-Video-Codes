extends CharacterBody2D


const speed = 300
@onready var SkillTree = get_tree().get_first_node_in_group("SkillTree")

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_left"):
		if Input.is_key_pressed(KEY_SHIFT):
			var unlock: bool = SkillTree.checkSkill("Dash")
			match unlock:
				true:
					var level = SkillTree["Skills"]["Dash"]["level"]
					self.velocity.x = -speed * level
				false:
					self.velocity.x = -speed
		else:
			self.velocity.x = -speed
		
		
	elif Input.is_action_pressed("ui_right"):
		if Input.is_key_pressed(KEY_SHIFT):
			var unlock: bool = SkillTree.checkSkill("Dash")
			match unlock:
				true:
					var level = SkillTree["Skills"]["Dash"]["level"]
					self.velocity.x = speed * level
				false:
					self.velocity.x = speed
		else:
			self.velocity.x = speed
	
	else:
		velocity.x = 0

	move_and_slide()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var unlock: bool = SkillTree.checkSkill("Fireball")
		match unlock:
				true:
					print("Fireball thrown")
				false:
					print("No fire for you")
