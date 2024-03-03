extends CharacterBody2D

@export var inventory: Inventory;
@onready var gc: GridContainer = $"../CanvasLayer/ColorRect/ScrollContainer/GridContainer";


func _ready():
	inventory.connect("UpdateDisplay", Callable(gc, "updateDisplay"));
	for i in range(400):
		GetItem(load("res://Apple.res") as Item);

	GetItem(load("res://Banana.res") as Item);
	GetItem(load("res://Banana.res") as Item);
	GetItem(load("res://Banana.res") as Item);
	GetItem(load("res://GodotItem.res") as Item);
	GetItem(load("res://Banana.res") as Item);
	#await get_tree().create_timer(3).timeout
	#for c in gc.get_children():
		#c.queue_free()


func GetItem(item: Item):
	inventory.addItem(item);


