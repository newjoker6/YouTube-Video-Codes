extends Control
asd



# Bad example
func _physics_process(delta):
	for node in get_tree().get_nodes_in_group("enemies"):
		node.rotate_x(delta * 10)
		node.rotate_y(delta * 15)
		node.rotate_z(delta * 20)



# Good example
var rotation = Vector3()

func _physics_process(delta):
	rotation.x += delta * 10
	rotation.y += delta * 15
	rotation.z += delta * 20

	for node in get_tree().get_nodes_in_group("enemies"):
		node.rotate(rotation)
