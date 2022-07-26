tool
extends Node


class_name Achievements, "res://addons/YT_Achievement_Plugin/Icon/AchievementIcon.svg"

var AchievementPopUp = preload("res://addons/YT_Achievement_Plugin/AchievementScene/AchievementPopUp.tscn")

export var ColourBack: Color

export var IconSize:= Vector2(40, 40)

export var AchievementList: Dictionary = {
	"001": {
		"Title": "Your First Click",
		"Image": load("res://addons/YT_Achievement_Plugin/AchievementImages/001.png"),
		"Description": "Clicked for the first time.",
		"Unlocked": false
	},
	"002": {
		"Title": "Ten Clicks",
		"Image": load("res://addons/YT_Achievement_Plugin/AchievementImages/002.png"),
		"Description": "Halfway there!",
		"Unlocked": false
	}
}


func achievement_unlock(id: String):
	var achievement = AchievementPopUp.instance()
	self.add_child(achievement)
	achievement.name = "Achievement"
	$Achievement/AchievementsInfo/AchievementBack.color = ColourBack
	$Achievement/AchievementsInfo/AchievementIcon.rect_size = IconSize
	$Achievement/AchievementsInfo/AchievementIcon.set_texture(AchievementList[id]["Image"])
	$Achievement/AchievementsInfo/AchievementTitle.text = AchievementList[id]["Title"]
	$Achievement/AchievementsInfo/AchievementDesc.text = AchievementList[id]["Description"]
	AchievementList[id]["Unlocked"] = true








