extends TextureButton
class_name SkillNode

@onready var SkillLevel = $SkillLevel
@onready var SkillBranch = $SkillBranch
@export var MaxLevel:int = 3

@export var SkillName: String


var level: int = 0:
	set(value):
		level = value
		SkillLevel.text = str(level) + "/" + str(MaxLevel)


func _ready() -> void:
	SkillLevel.text = str(level) + "/" + str(MaxLevel)
	if get_parent() is SkillNode:
		SkillBranch.add_point(self.global_position + self.size/2)
		SkillBranch.add_point(get_parent().global_position + get_parent().size/2)


func _on_pressed() -> void:
	level = min(level+1, MaxLevel)
	
	var SkillTree = get_tree().get_first_node_in_group("SkillTree")
	SkillTree.setUnlock(SkillName, level)
	self.self_modulate = Color(1, 1, 1)
	
	SkillBranch.default_color = Color(0.39215686917305, 1, 0.5137255191803)
	
	var skills = get_children()
	for skill in skills:
		if skill is SkillNode and level == MaxLevel:
			skill.disabled = false
	







