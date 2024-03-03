@tool
extends Label

@export var minFontSize: int
var uFont: Font
@export var FitFontBox: bool = false


func _process(delta: float) -> void:
	pass

func _on_resized() -> void:
	if FitFontBox:
		await get_tree().create_timer(0.5).timeout
		var iSize: int = self.label_settings.font_size
		printt("asdfasdfa", iSize)
		print(iSize)
		#label_settings.set_font_size(0)
		if(autowrap_mode != 0):
			while(get_visible_line_count() <= get_line_count()):
				self.label_settings.set_font_size(iSize - 1)
				if self.label_settings.get_font_size() <= minFontSize:
					self.label_settings.set_font_size(minFontSize)
					break
		else:
			if self.label_settings.font == null:
				return
			else:
				uFont = label_settings.font
			var textRect: Vector2 = uFont.get_string_size(self.text)
			
			while(textRect.y > self.size.y || textRect.x > self.size.x ):
				textRect = uFont.get_string_size(self.text)
				self.label_settings.set_font_size(self.label_settings.get_font_size() + 1)
				if self.label_settings.get_font_size() <= minFontSize:
					self.label_settings.set_font_size(minFontSize)
					break

	#self.label_settings.font_size = self.size
