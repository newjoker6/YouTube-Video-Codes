extends Camera2D

@onready var Player = $"../../../../../Player"
var marker = load("res://quest_marker.tscn")

func updateMap():
	updatePosition()

func updatePosition():
	self.position = Player.position
	$"../PlayerMarker".position = Player.position

func add_marker(location: Vector2):
	var mi = marker.instantiate()
	mi.position = location
	$"../".add_child(mi)
