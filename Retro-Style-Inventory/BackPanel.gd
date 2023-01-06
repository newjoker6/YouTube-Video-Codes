extends ColorRect


signal selected
signal deselected
onready var inven = $"../../.."

var mouse_enter: bool = false
var start: bool = false

var double_click: float = 0.25
var mode_timer: float = 0.0


func _ready() -> void:
	
	#connects signals to emulate item selection
	connect_signals()


func connect_signals() -> void:
	self.connect("selected", inven, "item_selected")
	self.connect("deselected", inven, "item_deselected")


func _process(delta: float) -> void:
	double_click_timer(delta)


#check if the user double clicks within the given time
func double_click_timer(delta) -> void:
	if start:
		mode_timer += delta
		print(mode_timer)
	
	if mode_timer > double_click:
		start = false
		mode_timer = 0.0


# toggles variable when mouse enters clickable area
func _on_BackPanel_mouse_entered() -> void:
	mouse_enter = true


# toggles variable when mouse exits clickable area
func _on_BackPanel_mouse_exited() -> void:
	mouse_enter = false


func _input(_event: InputEvent) -> void:
	
	#click outside of clickable area sends deselect signal
	if Input.is_action_just_pressed("LeftClick") and not mouse_enter:
		emit_signal("deselected", self)

	#on double click, activate the item
	elif (Input.is_action_just_pressed("LeftClick")
	and mouse_enter
	and mode_timer > 0.0):
		activate()

	#single click in clickable area starts double click timer and
	#selects clicked item
	elif Input.is_action_just_pressed("LeftClick") and mouse_enter:
		emit_signal("selected", self)
		start = true


#activates the double clicked item
func activate() -> void:
	
	#matches the item you selected and executes the relavent code
	match self.name:
		"Potion":
			Inventory.PlayerBag["Items"][self.name] -= 1
			var current_amount: int = Inventory.PlayerBag["Items"][self.name]
			get_node("Amount").text = "x%s" %str(current_amount)
			
			# Whatever this item does
			# gets put here
			
			if Inventory.PlayerBag["Items"][self.name] == 0:
				Inventory.PlayerBag["Items"].erase(self.name)
				queue_free()
		
		"Hyper Potion":
			Inventory.PlayerBag["Items"][self.name] -= 1
			var current_amount: int = Inventory.PlayerBag["Items"][self.name]
			get_node("Amount").text = "x%s" %str(current_amount)
			
			# Whatever this item does
			# gets put here
			
			if Inventory.PlayerBag["Items"][self.name] == 0:
				Inventory.PlayerBag["Items"].erase(self.name)
				queue_free()
			
		"Full Heal":
			Inventory.PlayerBag["Items"][self.name] -= 1
			var current_amount: int = Inventory.PlayerBag["Items"][self.name]
			get_node("Amount").text = "x%s" %str(current_amount)
			
			# Whatever this item does
			# gets put here
			
			if Inventory.PlayerBag["Items"][self.name] == 0:
				Inventory.PlayerBag["Items"].erase(self.name)
				queue_free()
			
		"Bicycle":
			# Whatever this key item
			# does gets put here
			pass





