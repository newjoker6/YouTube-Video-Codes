extends Node2D

@export var TurnQueue: Array[Sprite2D] = []
enum TURN {
	Player,
	NPC
}
@export var CurrentTurn: TURN = TURN.NPC


func endTurn():
	match CurrentTurn:
		TURN.Player:
			CurrentTurn = TURN.NPC
			$"../Node2D/Turn".text = "Current Turn: NPC"
			await get_tree().create_timer(3).timeout
			endTurn()
		TURN.NPC:
			CurrentTurn = TURN.Player
			$"../Node2D/Turn".text = "Current Turn: Player"
			TurnQueue.clear()
			get_tree().call_group("Players", "resetAP")
			get_tree().call_group("Players", "checkAP")
			get_tree().call_group("Players", "updateLabel")

	
