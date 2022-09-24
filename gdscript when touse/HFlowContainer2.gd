extends HFlowContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	self.rect_min_size.x = get_parent().rect_size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	


func _on_ScrollContainer_resized():
	self.rect_min_size.x = get_parent().rect_size.x
