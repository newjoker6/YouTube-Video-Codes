extends TextureButton


signal object_select
onready var GUI = get_parent().get_parent().get_parent().get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "emit_object")
	self.connect("object_select", GUI, "TrayItemSelected")


func emit_object():
	emit_signal("object_select", self.name, self.texture_normal)

