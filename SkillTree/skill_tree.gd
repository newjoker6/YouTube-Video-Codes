extends Control


var Skills: Dictionary = {
	"Dash":{
		"unlock":false,
		"level": 0
	},
	"Fireball":{
		"unlock": false,
		"level": 0
	}
}


func setUnlock(skill: String, level: int):
	if skill in Skills.keys():
		Skills[skill]["unlock"] = true
		Skills[skill]["level"] = level


func checkSkill(skill: String) -> bool:
	return Skills[skill]["unlock"]
