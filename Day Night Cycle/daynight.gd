extends Node2D


enum DAYSTATE {
	DAY,
	NIGHT
}

var CurrentState: DAYSTATE = DAYSTATE.DAY

var StateLength: Dictionary = {
	"DAY": 15,
	"NIGHT": 8,
}

var Lighting: Dictionary = {
	"DAY": Color("ffef9f14"),
	"NIGHT": Color("05002395")
}

func _ready() -> void:
	$ColorRect.color = Lighting[DAYSTATE.keys()[CurrentState]]
	$Timer.wait_time = StateLength[DAYSTATE.keys()[CurrentState]]
	$Timer.start()


func _on_timer_timeout() -> void:
	match CurrentState:
		
		DAYSTATE.DAY:
			CurrentState = DAYSTATE.NIGHT
			transitionTime(Lighting[DAYSTATE.keys()[CurrentState]])
		
		DAYSTATE.NIGHT:
			CurrentState = DAYSTATE.DAY
			transitionTime(Lighting[DAYSTATE.keys()[CurrentState]])
	
	$Timer.wait_time = StateLength[DAYSTATE.keys()[CurrentState]]
	$Timer.start()


func transitionTime(newtime: Color):
	var t = create_tween()
	t.tween_property($ColorRect, "color", newtime, 3)



