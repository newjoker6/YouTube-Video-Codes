extends Node3D


#FSR OPTIONS
var FSR: Dictionary = {
	"Ultra Quality": 0.77,
	"Quality": 0.67,
	"Balanced": 0.59,
	"Performance": 0.5
}

func _ready() -> void:
	for o in FSR.keys():
		$CanvasLayer/OptionButton.add_item(o)

func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			get_viewport().set_scaling_3d_scale(FSR["Ultra Quality"])
		1:
			get_viewport().set_scaling_3d_scale(FSR["Quality"])
		2:
			get_viewport().set_scaling_3d_scale(FSR["Balanced"])
		3:
			get_viewport().set_scaling_3d_scale(FSR["Performance"])


func _on_check_box_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			ProjectSettings.set_setting("rendering/scaling_3d/mode", 2)
		false:
			ProjectSettings.set_setting("rendering/scaling_3d/mode", 0)
			get_viewport().set_scaling_3d_scale(1)







# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("ui_accept"):
		#get_viewport().set_scaling_3d_scale(0.5)
		#await get_tree().create_timer(3).timeout
		#get_viewport().set_scaling_3d_scale(0.77)
		#await get_tree().create_timer(3).timeout
		#get_viewport().set_scaling_3d_scale(1)
	#if Input.is_action_just_pressed("ui_down"):
		#var cs = ProjectSettings.get_setting("rendering/scaling_3d/mode")
		#match cs:
			##Bilinear
			#0:
				#pass
			##FSR 1
			#1:
				#ProjectSettings.set_setting("rendering/scaling_3d/mode", 2)
			##FSR 2
			#2:
				#ProjectSettings.set_setting("rendering/scaling_3d/mode", 1)










func _on_h_slider_value_changed(value: float) -> void:
	match value as int:
		0:
			get_viewport().set_scaling_3d_scale(FSR["Ultra Quality"])
		25:
			get_viewport().set_scaling_3d_scale(FSR["Quality"])
		50:
			get_viewport().set_scaling_3d_scale(FSR["Balanced"])
		75:
			get_viewport().set_scaling_3d_scale(FSR["Performance"])
