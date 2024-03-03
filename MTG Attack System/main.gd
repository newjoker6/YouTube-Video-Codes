
extends Node2D


func _on_combat_button_pressed() -> void:
	GameManager.advanceTurn()


func _on_pass_button_pressed() -> void:
	GameManager.endTurn()

