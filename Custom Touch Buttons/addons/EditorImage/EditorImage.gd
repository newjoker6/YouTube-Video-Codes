tool
extends EditorPlugin

var open_scripts:Array
var wait_time_between_script_checks := 3.0
const script_child_size_no_background := 7

var base
var tabContainer
var vbox630


func _enter_tree() -> void:
	print('SAVE ANY SCRIPT TO FIX ERROR')
	print('SAVE ANY SCRIPT TO FIX ERROR')
	print('SAVE ANY SCRIPT TO FIX ERROR')

	
	var timer = Timer.new()
	timer.wait_time = wait_time_between_script_checks
	timer.set_autostart(true)
	self.add_child(timer)
	timer.connect("timeout", self, 'on_timeout')




func match_rect(of: Control, to: Control) -> void:
	of.rect_min_size = to.rect_min_size
	of.rect_size = to.rect_size
	of.rect_global_position = to.rect_global_position
	
	
func _exit_tree() -> void:
	queue_free()


func on_timeout() -> void:
	check_scripts()
	open_scripts.clear()
	
	if not typeof(tabContainer) == 0:
		for s in tabContainer.get_children():
			if 'ScriptTextEditor' in s.name:
				var scriptedit = tabContainer.get_node(str(s.name)).get_child(0).get_child(0).get_child(0)
				open_scripts.append(scriptedit.name)

				if scriptedit.get_children().size() < script_child_size_no_background:
					add_image(scriptedit)


func add_image(code) -> void:
	var texture_rect := TextureRect.new()
	texture_rect.texture = preload("res://addons/EditorImage/Background.png")
	texture_rect.expand = true
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture_rect.modulate = Color('14ffffff')
	texture_rect.name = 'BackgroundImage'
	connect("tree_exiting", texture_rect, "queue_free")

	code.add_child(texture_rect)
	code.move_child(texture_rect, 0)
	code.connect("resized", self, "match_rect", [ texture_rect, code ])
	match_rect(texture_rect, code)


func check_scripts() -> void:
	base = get_editor_interface().get_base_control()
	vbox630= base.get_child(0).get_child(1).get_child(1).get_child(1).get_child(0).get_child(0).get_child(0).get_child(0)

	var ScriptTextEditor2 = vbox630.get_child(1).get_child(0).get_child(2).get_child(0).get_child(1).get_child(1).get_child(0)
	var ScriptText = ScriptTextEditor2.get_child(0).get_child(0).get_child(0)
	tabContainer = vbox630.get_child(1).get_child(0).get_child(2).get_child(0).get_child(1).get_child(1)




