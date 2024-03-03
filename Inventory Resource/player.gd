extends CharacterBody2D

@export var mystuff: Array[Food]

func _ready() -> void:
	mystuff.append("asdfa")
	mystuff.append(324534)
	mystuff.append(Food.new("Apple", 30, "This is my apple."))


func _process(delta: float) -> void:
	pass






