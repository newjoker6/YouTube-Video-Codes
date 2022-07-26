extends Control


var count:= 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_counter()



func _on_Button_pressed():
	count += 1
	update_counter()
	check_unlock()


func update_counter():
	$counter.text = str(count)



func check_unlock():
	if count == 1 and $Achievements.AchievementList["001"]["Unlocked"] == false:
		$Achievements.achievement_unlock("001")
		
	if count == 10 and $Achievements.AchievementList["002"]["Unlocked"] == false:
		$Achievements.achievement_unlock("002")
