extends Node2D


enum TURN {
	Player,
	Attack,
	NPC
}

@export var CurrentTurn: TURN = TURN.Player
var Attacker: Node2D = null
var Target: Node2D = null
@onready var Phaselabel: Label = $"../Main/PhaseLabel"


func endTurn():
	if CurrentTurn == TURN.NPC:
		await get_tree().create_timer(5).timeout
		CurrentTurn = TURN.Player
		for t:Node2D in $"../Main/PlayerTokens".get_children():
			t.Attacked = false
		return

	CurrentTurn = TURN.NPC
	endTurn()



func advanceTurn():
	if CurrentTurn == TURN.Player:
		CurrentTurn = TURN.Attack
		
	elif CurrentTurn == TURN.Attack:
		endTurn()

func clearTargetAttack():
	Attacker = null
	Target = null


func _process(_delta: float) -> void:
	Phaselabel.text = "Current Phase: %s" %str(TURN.keys()[CurrentTurn])
