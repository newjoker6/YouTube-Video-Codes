extends RichTextLabel

@export var ScreenNotifier: VisibleOnScreenNotifier2D
var ScrollingSpeed: int = 150
var TickerLines: Array[String] = []
var CurrentLine: int = 0

func _ready() -> void:
	GetText()
	NextLine()
	SetNotifier()


func GetText():
	var f = FileAccess.open("res://info.txt", FileAccess.READ)
	while f.get_position() < f.get_length():
		TickerLines.append(f.get_line())


func NextLine():
	if CurrentLine <= TickerLines.size():
		self.text = TickerLines[CurrentLine]
		CurrentLine += 1


func SetNotifier() -> void:
	ScreenNotifier.rect.size.x = self.size.x
	ScreenNotifier.rect.size.y = self.size.y


func _process(delta: float) -> void:
	self.position.x -= ScrollingSpeed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	NextLine()
	SetNotifier()
	self.position.x = get_window().size.x




