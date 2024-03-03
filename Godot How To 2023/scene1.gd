extends Node2D

var scene2: PackedScene = load("res://scene2.tscn")


@export var details : cardDetails = cardDetails.new()
var jim = 3
# Called when the node enters the scene tree for the first time.



func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	#var scene2inst = scene2.instantiate()
	#add_child(scene2inst)
	jim = 6
	myfunction()
	#print(jim)
	

	await ResourceLoader.load("res://scene2.tscn")
	#get_tree().change_scene_to_file("res://scene2.tscn")
	#get_tree().change_scene_to_packed(load("res://scene2.tscn"))

func myfunction():
	jim = 1
	#for i in 1_000_000:
		#print(i)

