extends MeshInstance



var angle = 45
var Scale = Vector3(1, 2, 1)

func _ready() -> void:
	transform.basis.scaled(Scale)
#	transform.basis = Basis(Vector3(1, 1, 1).normalized(), deg2rad(angle))















#func _ready() -> void:
#	print(transform.basis.scaled(Scale))
#	transform.basis = Basis(Vector3(1, 3, 2).normalized(), deg2rad(angle))






#transform origin represents the translation
#func _ready() -> void:
#	transform.origin += Vector3(0, 0, 3)  # move 1 unit in the z-axis

#func _process(delta: float) -> void:
#	transform.origin += Vector3(0, 0, 1)  # move 1 unit in the z-axis
