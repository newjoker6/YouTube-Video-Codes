extends Control

var Reverb_On : bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	## Method 1
#	AudioEchoOne()
	
	## Method 2
	AudioEchoTwo()


func AudioEchoOne():
	if Input.is_action_just_pressed("cavebutton"):
		var cb = $AudioStreamPlayer.bus
		if cb == "Sounds":
			$AudioStreamPlayer.bus = "CaveSounds"
			return
		
		$AudioStreamPlayer.bus = "Sounds"


func AudioEchoTwo():
	if Input.is_action_just_pressed("cavebutton"):
		if Reverb_On:
			Reverb_On = false
			var index = AudioServer.get_bus_index("Sounds")
			AudioServer.set_bus_effect_enabled(index, 0, Reverb_On)
			return

		Reverb_On = true
		var index = AudioServer.get_bus_index("Sounds")
		AudioServer.set_bus_effect_enabled(index, 0, Reverb_On)

