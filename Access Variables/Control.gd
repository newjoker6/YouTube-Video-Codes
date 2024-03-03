extends Control

signal send_var(sent_var)

var myvar := "my variable"


func _ready():
#	$Accessor.print_var(myvar)
	emit_signal("send_var", myvar)






















# Pass variable down to it another object
#	$Accessor.print_var(myvar)

# Emit signal and send var with
#	emit_signal("send_var", myvar)


