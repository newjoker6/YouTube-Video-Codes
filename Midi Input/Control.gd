extends Control



func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())



	# You can access the MIDI message data using the following properties:
func _input(event):
	if event is InputEventMIDI:
		if event.channel == 0:
			
			match event.pitch:
				# Match MIDI key for something like controls
				72:
					print("Pitch 72 found")
				
			print("MIDI button pressed")
			printt("channel", event.channel)# - the MIDI channel (0-15)
			printt("pitch", event.pitch)# - the MIDI note number (0-127)
			printt("velocity", event.velocity)# - the velocity of the note (0-127)
			printt("message", event.message)# - the MIDI signal. This is a member of the @GlobalScope.MidiMessageList enum.
			printt("instrument", event.instrument)# - The instrument of this input event from 0 to 127.
			printt("pressure", event.pressure)# -  pressure of the MIDI signal from 0 to 127
			print("-----------------")
