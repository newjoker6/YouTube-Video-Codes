extends GridContainer;

@onready var player: CharacterBody2D = %Player;
var SwapItemIdx: int

func updateDisplay(slots: Array[Item]):
	for child in get_children():
		child.queue_free();
	var Slots = slots.filter(func(i): if i != null: return i);
	
	for s in Slots:
		var newitem = load("res://display_item.tscn").instantiate();
		add_child(newitem);
		newitem.connect("Move", Callable(self, "InitiateMove"));
		newitem.connect("Swap", Callable(self, "InitiateSwap"));
		newitem.get_child(0).texture = s.DisplayTexture;
		newitem.get_child(1).text = str(s.Amount);


func InitiateMove(idx: int):
	var ghost = load("res://ghost.tscn").instantiate();
	get_parent().add_child(ghost);
	ghost.texture = player.inventory.Slots[idx].DisplayTexture;
	SwapItemIdx = idx;


func InitiateSwap(idx: int):
	var TempItem: Item = player.inventory.Slots[SwapItemIdx];
	player.inventory.Slots[SwapItemIdx] = player.inventory.Slots[idx];
	player.inventory.Slots[idx] = TempItem;
	updateDisplay(player.inventory.Slots);
	get_child(0).Moving = false;
	get_parent().get_node_or_null("Ghost").queue_free();



