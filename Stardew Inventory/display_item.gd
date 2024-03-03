extends Control;

var MouseIn: bool = false;
static var Moving: bool = false;
signal Move(Index:int);
signal Swap(Index:int);


func _input(_event: InputEvent) -> void:

	if MouseIn and !Moving and Input.is_action_just_released("Left Click"):
		Moving = true;
		Move.emit(get_index());
		
	elif MouseIn and Moving and Input.is_action_just_released("Left Click"):
		Moving = false;
		Swap.emit(get_index());
		

func _on_mouse_entered() -> void:
	MouseIn = true;


func _on_mouse_exited() -> void:
	MouseIn = false;

