extends Label




# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "this is my default text property"
	var CS = get_parent().Speed
	print(CS)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
