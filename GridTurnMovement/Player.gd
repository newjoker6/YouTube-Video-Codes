extends Sprite2D

@export var AP: int = 0
@export var MaxAP: int = 3
@export var Speed: int = 2
@export var FullBar: int = 100
@export var CurrentBar: int = 0
@export var Waiting : bool = false

func _ready() -> void:
	self.add_to_group("Players")
	resetAP()
	GM.endTurn()

func _process(delta: float) -> void:
	if GM.CurrentTurn == GM.TURN.Player and Waiting == false:
		if !CurrentBar == FullBar:
			CurrentBar += Speed
			CurrentBar = min(CurrentBar, FullBar)
			
		elif CurrentBar == FullBar:
			if !self in GM.TurnQueue:
				GM.TurnQueue.append(self)



func checkAP():
	if AP == 0:
		var idx:int = GM.TurnQueue.find(self)
		GM.TurnQueue.remove_at(idx)
		if GM.TurnQueue.size() == 0:
			GM.endTurn()
		Waiting = true
		
	else:
		if GM.TurnQueue.size() > 1:
			var idx:int = GM.TurnQueue.find(self)
			GM.TurnQueue.remove_at(idx)
			GM.TurnQueue.insert(GM.TurnQueue.size(), self)


func resetAP():
	AP = MaxAP
	Waiting = false
	CurrentBar = 0


func updateLabel():
	var n = get_parent().get_children()
	n = n.find(self)
	get_child(0).text = "P%s, AP:%s, Spd:%s" %[n, AP, Speed]
