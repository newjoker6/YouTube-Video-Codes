extends Control


onready var ResolutionOptions = $Res/ResolutionOptions
onready var MSAAOptions = $MSAA/MSAAoptions
onready var WindowOptions = $WindowMode/WindowOptions
onready var FPSOptions = $FPS/FPSoptions
onready var HDRBox = $HDR/HDRBox
onready var VSYNCBox = $Vsync/VsyncBox

var Resolutions = ["2160x1440", "1920x1080", "1280x720", "1024x600", "640x480"]
var WindowModes = ["Windowed", "Borderless", "Fullscreen"]
var MSAAOpt = ["off", "x2", "x4", "x8", "x16"]
var FPSOpt = ["Unlimited", "30", "60", "100", "120"]


func _ready():
	add_options()


func add_options():
	add_modes()
	add_resolutions()
	add_msaa()
	add_fps()


func add_modes():
	for mode in WindowModes:
		WindowOptions.add_item(mode)


func add_resolutions():
	for res in Resolutions:
		ResolutionOptions.add_item(res)


func add_msaa():
	for m in MSAAOpt:
		MSAAOptions.add_item(m)


func add_fps():
	for fps in FPSOpt:
		FPSOptions.add_item(fps)


func _on_ResolutionOptions_item_selected(index):
	var res_choice = ResolutionOptions.get_item_text(index)
	var window_size = res_choice.split("x", true, 1)
	OS.window_size = Vector2(window_size[0], window_size[1])
	


func _on_MSAAoptions_item_selected(index):
	var msaa_option = MSAAOptions.get_item_text(index)
	match msaa_option:
		"off":
			get_viewport().msaa = Viewport.MSAA_DISABLED
			
		"x2":
			get_viewport().msaa = Viewport.MSAA_2X
			
		"x4":
			get_viewport().msaa = Viewport.MSAA_4X
			
		"x8":
			get_viewport().msaa = Viewport.MSAA_8X
			
		"x16":
			get_viewport().msaa = Viewport.MSAA_16X


func _on_WindowOptions_item_selected(index):
	var Mode = WindowOptions.get_item_text(index)
	match Mode:
		"Windowed":
			OS.window_fullscreen = false
			OS.window_borderless = false
			
		"Borderless":
			OS.window_fullscreen = false
			OS.window_borderless = true
			
		"Fullscreen":
			OS.window_fullscreen = true
			OS.window_borderless = false


func _on_FPSoptions_item_selected(index):
	var fps = FPSOptions.get_item_text(index)
	match fps:
		"Unlimited":
			Engine.set_target_fps(0)
		
		_:
			Engine.set_target_fps(int(fps))


func _on_VsyncBox_pressed():
	OS.vsync_enabled = VSYNCBox.pressed


func _on_HDRBox_pressed():
	get_viewport().hdr = HDRBox.pressed
