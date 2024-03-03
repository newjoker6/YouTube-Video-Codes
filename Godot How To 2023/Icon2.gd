extends Sprite2D

var defaultColour = "#212532"
var image = Image.new()
var w
var h
var data

func _ready() -> void:
	data = self.texture.get_image()
	w = 128
	h = 128
	
	if data.get_data().size() == 0:
		printerr("Image data is empty.")
		return

	image.create_from_data(w, h, false, Image.FORMAT_RGBA8, data.get_data())
	print(image.get_width())
	if image.get_width() != w or image.get_height() != h:
		printerr("Image dimensions do not match expected values.")
		return
	
	print("Image dimensions: width =", w, "height =", h)

func _on_area_2d_mouse_entered() -> void:
	if not image:
		printerr("Image not initialized.")
		return

	for x in range(w):
		for y in range(h):
			var pixel_color = image.get_pixel(x, y)
			print(pixel_color)


func _on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
