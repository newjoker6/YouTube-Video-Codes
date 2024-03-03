extends Control



# Bad example
func _physics_process(delta):
	var position = get_position()
	position.x += 1
	set_position(position)

# Good example
var position

func _ready():
	position = get_position()

func _physics_process(delta):
	position.x += 1
	set_position(position)

