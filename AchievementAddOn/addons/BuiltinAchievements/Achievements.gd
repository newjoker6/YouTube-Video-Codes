tool
extends Node


class_name Achievements, "res://addons/BuiltinAchievements/Icon/AchievementIcon.svg"

var AchievementPopUp = preload("res://addons/BuiltinAchievements/AchievementScene/AchievementPopUp.tscn")

export var ColourBack: Color

export var IconSize: Vector2 = Vector2(40, 40)

export var AchievementList: Dictionary = {
	"000": {
		"Title": "PC Builder",
		"Image": load("res://icon.png"),
		"Description": "Built your first PC",
		"Unlocked": false
	},
	"001": {
		"Title": "Cell Killer",
		"Image": load("res://icon.png"),
		"Description": "I'm a test description",
		"Unlocked": false
	}
}

func achievement_unlock(id: String):
	var achievement = AchievementPopUp.instance()
	self.add_child(achievement)
	achievement.name = "Achievement"
	$Achievement/AchievementInfo/AchievementBack.color = ColourBack
	$Achievement/AchievementInfo/AchievementIcon.rect_size = IconSize
	$Achievement/AchievementInfo/AchievementIcon.set_texture(AchievementList[id]["Image"])
	$Achievement/AchievementInfo/AchievementTitle.text = AchievementList[id]["Title"]
	$Achievement/AchievementInfo/AchievementDesc.text = AchievementList[id]["Description"]
	AchievementList[id]["Unlocked"] = true

