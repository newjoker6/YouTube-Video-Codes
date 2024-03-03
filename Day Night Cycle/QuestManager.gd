extends Node


var Quests: Dictionary = {
	"MQ001":{
		"QuestName": "My quest name",
		"CurrentStage": 0,
		"QuestDescription":{
			"10": "Stage 10 description"
		}
	},
	"MQ002":{
		"QuestName": "My newer quest name",
		"CurrentStage": 0,
		"QuestDescription":{
			"10": "Stage 10 newer description",
			"20": "Stage 20 newer description",
			"30": "Stage 30 newer description"
		}
	}
}

var ActiveQuests: Dictionary = {}
var CompletedQuests: Array = []

func _ready():
	pass


func addQuest(questID: String):
	if questID in Quests.keys():
		ActiveQuests[questID] = Quests[questID]


func advanceQuest(questID: String):
	ActiveQuests[questID]["CurrentStage"] += 10
	var currentStage: String = str(ActiveQuests[questID]["CurrentStage"])
	if currentStage in ActiveQuests[questID]["QuestDescription"].keys():
		print(ActiveQuests[questID]["QuestDescription"][currentStage])
	else:
		completeQuest(questID)


func completeQuest(questID: String):
	CompletedQuests.append(Quests[questID]["QuestName"])
	ActiveQuests.erase(questID)
	printt("Quest Completed", CompletedQuests)



