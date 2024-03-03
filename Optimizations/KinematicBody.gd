extends KinematicBody


var tran = Transform.IDENTITY
var angle = 0.1
var Scale = Vector3(1, 1, 1)

func _ready() -> void:
#	$MeshInstance.transform.basis.scaled(Scale)
	tran.basis = Basis(Vector3(1, 0, 0).normalized(), angle)






#transform origin represents the translation
#func _ready() -> void:
#	transform.origin += Vector3(0, 0, 1)  # move 1 unit in the z-axis

#func _process(delta: float) -> void:
#	transform.origin += Vector3(0, 0, 1)  # move 1 unit in the z-axis
