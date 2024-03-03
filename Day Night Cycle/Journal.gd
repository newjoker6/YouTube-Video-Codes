extends Panel



func UpdateJournal():
	$ActiveQuests.clear()
	if QuestManager.ActiveQuests.keys().size() > 0:
		for i in QuestManager.ActiveQuests.keys():
			$ActiveQuests.add_item(QuestManager.ActiveQuests[i]["QuestName"])
	
	$RichTextLabel.text = ""
	if $ActiveQuests.item_count > 0:
		_on_active_quests_item_selected(0)
		$ActiveQuests.select(0)
	
	$CompletedQuests.clear()
	for i in QuestManager.CompletedQuests:
		$CompletedQuests.add_item(i)


func _on_active_quests_item_selected(index: int) -> void:
	$CompletedQuests.deselect_all()
	
	var QuestID = QuestManager.ActiveQuests.keys()[index]
	var Description = $RichTextLabel
	var currentStage: String = str(QuestManager.ActiveQuests[QuestID]["CurrentStage"])
	Description.text = QuestManager.ActiveQuests[QuestID]["QuestDescription"][currentStage]


func _on_completed_quests_item_selected(index: int) -> void:
	$ActiveQuests.deselect_all()
	$RichTextLabel.text = ""
