extends Control


#----------Variables----------

onready var Master_Slider = $Master_Slider
onready var SFX_Slider = $SFX_Slider
onready var Music_Slider = $Music_Slider


func _on_Master_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_SFX_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)


func _on_Music_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
