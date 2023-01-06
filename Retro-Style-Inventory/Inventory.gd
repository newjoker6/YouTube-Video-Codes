extends Node

#our individual bags with organized items
var PlayerBag: Dictionary = {
	"Items" : {
		
	},
	"Key": {
		
	}
}

# Global add item access using
# Inventory.add_item("item name")
func add_item(item: String) -> void:
	$"../Control/Bag/ItemsPouch".add_item(item)


# Global add key item access using
# Inventory.add_key_item("item name")
func add_key_item(item: String) -> void:
	$"../Control/Bag/KeyItemsPouch".add_item(item)
