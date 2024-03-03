extends Control
asd

# Bad example
var items = []

func add_item(item):
	items.append(item)

func remove_item(item):
	items.remove(item)

func _physics_process(delta):
	for item in items:
		# Do something with the item
		pass


# Good example
var items = {}

func add_item(key, item):
	items[key] = item

func remove_item(key):
	items.erase(key)

func _physics_process(delta):
	for item in items.values():
		# Do something with the item
		pass

