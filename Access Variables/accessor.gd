extends Control



func _ready():
	pass
#	print(get_parent().myvar)


func print_var(v):
	print(v)


func _on_Control_send_var(sent_var):
	print(sent_var)
