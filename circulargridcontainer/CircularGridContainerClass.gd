@tool
extends Container
class_name CircularGridContainer

@export var rings: int = 3:
	set(value):
		rings = max(1, value)
		_update_container()

@export var ring_spacing: float = 100.0:
	set(value):
		ring_spacing = max(10.0, value)
		_update_container()

@export var start_radius: float = 50.0:
	set(value):
		start_radius = max(0.0, value)
		_update_container()

@export var items_per_ring: int = 8:
	set(value):
		items_per_ring = max(1, value)
		_update_container()

@export_range(0.0, 360.0, 0.1, "suffix:°") var rotation_offset_degrees: float = 0.0:
	set(value):
		rotation_offset_degrees = value
		_update_container()

@export_group("Container Settings")
@export var auto_size: bool = false:
	set(value):
		auto_size = value
		_update_container()

@export_group("Arc Settings")
@export var use_half_ring: bool = false:
	set(value):
		use_half_ring = value
		_update_container()

@export_range(0.0, 360.0) var arc_angle: float = 180.0:
	set(value):
		arc_angle = clamp(value, 0.0, 360.0)
		_update_container()

@export_group("Editor Tools")
@export_tool_button("Clear All Children") var clear_all_button: Callable = _clear_all_children


func _ready() -> void:
	_update_container()


func _update_container() -> void:
	update_minimum_size()
	queue_sort()
	
	if auto_size and Engine.is_editor_hint():
		reset_size()


func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		_arrange_children()


func _arrange_children() -> void:
	var children_list: Array[Control] = []
	for child: Node in get_children():
		if child is Control and child.visible:
			children_list.append(child as Control)
	
	if children_list.is_empty():
		return
	
	var child_index: int = 0
	var center: Vector2 = size / 2.0
	
	# Calculate the angle range to use
	var angle_range: float = TAU if not use_half_ring else deg_to_rad(arc_angle)
	
	# Iterate through each ring
	for ring_idx: int in range(rings):
		if child_index >= children_list.size():
			break
		
		var current_radius: float = start_radius + (ring_idx * ring_spacing)
		var items_in_this_ring: int = items_per_ring * (ring_idx + 1) if ring_idx > 0 else items_per_ring
		
		# Calculate how many items to place in this ring
		var remaining_items: int = children_list.size() - child_index
		var items_to_place: int = min(items_in_this_ring, remaining_items)
		
		# Calculate angle between items
		var angle_step: float = angle_range / float(items_to_place) if use_half_ring else angle_range / float(items_to_place)
		
		# Place items in a circle/arc
		for i: int in range(items_to_place):
			if child_index >= children_list.size():
				break
			
			var child: Control = children_list[child_index]
			
			# For half rings, start from the beginning of the arc range
			var angle: float = 0.0
			if use_half_ring:
				angle = (i * angle_step) + deg_to_rad(rotation_offset_degrees)
			else:
				angle = (i * angle_step) + deg_to_rad(rotation_offset_degrees)
			
			# Calculate position
			var pos: Vector2 = Vector2(
				center.x + cos(angle) * current_radius,
				center.y + sin(angle) * current_radius
			)
			
			# Center the child on the calculated position
			var child_size: Vector2 = child.get_combined_minimum_size()
			pos -= child_size / 2.0
			
			fit_child_in_rect(child, Rect2(pos, child_size))
			child_index += 1


func _get_minimum_size() -> Vector2:
	if not auto_size:
		return Vector2.ZERO
	
	# Calculate minimum size based on the outermost ring
	var outer_radius: float = start_radius + ((rings - 1) * ring_spacing)
	var max_child_size: Vector2 = Vector2.ZERO
	
	for child: Node in get_children():
		if child is Control and child.visible:
			var child_min: Vector2 = (child as Control).get_combined_minimum_size()
			max_child_size = max_child_size.max(child_min)
	
	var diameter: float = (outer_radius * 2) + max_child_size.x
	return Vector2(diameter, diameter)


func get_total_capacity() -> int:
	var total: int = 0
	for ring_idx: int in range(rings):
		total += items_per_ring * (ring_idx + 1) if ring_idx > 0 else items_per_ring
	return total


func _clear_all_children() -> void:
	for child: Node in get_children():
		child.queue_free()
