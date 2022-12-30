extends Node


class_name Enemy, "icon.png"

var hp: int
var Name: String


func _init(health: int) -> void:
	hp = health
