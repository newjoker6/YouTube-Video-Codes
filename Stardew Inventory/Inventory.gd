extends Resource;

class_name Inventory;

@export var Slots: Array[Item];
var MaxSlots: int = 36;
signal UpdateDisplay(slots: Array[Item]);



func addItem(item: Item):
	if Slots.size() >= MaxSlots:
		print("Inventory full");
		return;
	
	if item.Stackable:
		for i in Slots:
			if item.Name == i.Name:
				if i.Amount == i.MaxStack:
					return;
					
				i.Amount += 1;
				UpdateDisplay.emit(Slots);
				return;
				
		Slots.append(item);
		UpdateDisplay.emit(Slots);
		
	else:
		Slots.append(item);
		UpdateDisplay.emit(Slots);

