extends ScrollContainer

var ScrollDirection: int = 0
@onready var gc: GridContainer = get_child(0)

func _process(_delta: float) -> void:
	if CheckMoving():
		scroll_horizontal += ScrollDirection


func CheckMoving() -> bool:
	if gc.get_children():
		return gc.get_child(0).Moving
	return false

func ScrollRightEntered() -> void:
	ScrollDirection = 1

func ScrollLeftEntered() -> void:
	ScrollDirection = -1

func ScrollAreaExit() -> void:
	ScrollDirection = 0
