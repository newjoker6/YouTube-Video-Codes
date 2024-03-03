extends Node2D


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("leftclick"):
		if GM.CurrentTurn == GM.TURN.Player:
			#region movement tilemap
			var mouse_tile = get_viewport().get_mouse_position()
			var tilemap = $TileMap
			var map_pos = tilemap.local_to_map(mouse_tile)
			var co = tilemap.map_to_local(map_pos)
			var id = tilemap.get_cell_source_id(0, map_pos)
			GM.TurnQueue[0].position = co
			#endregion
			#region PC update
			GM.TurnQueue[0].AP -= 1
			GM.TurnQueue[0].updateLabel()
			GM.TurnQueue[0].checkAP()
			#endregion

