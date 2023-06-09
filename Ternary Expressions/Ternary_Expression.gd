extends Control

var player_name := ""

var discount := 0.8
var hasDiscount := true
var defaultPrice := 10.00

var age := 15
var oldEnough := true if age >= 18 else false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var purchasePrice = discount * defaultPrice if hasDiscount else defaultPrice
	print(purchasePrice)


func _on_line_edit_text_submitted(new_text: String) -> void:
	player_name = new_text if new_text != "" else "Ricardo"
	print(player_name)
