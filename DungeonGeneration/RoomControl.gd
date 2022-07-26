extends Node


var top = [preload("res://DownFloor.tscn")]
var bottom = [preload("res://StartingRoom.tscn")]
var left = [preload("res://StartingRoom.tscn"), preload("res://DownFloor.tscn"), preload("res://testroom.tscn")]
var right = []

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_maximized = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
