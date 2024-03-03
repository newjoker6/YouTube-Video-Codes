extends Resource

class_name Food

@export var Name: String
@export var Cal: int
@export var Description: String

func _init(newname: String, newcal: int, newdesc: String) -> void:
	Name = newname
	Cal = newcal
	Description = newdesc
