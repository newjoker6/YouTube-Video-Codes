extends Control


onready var GenerateButton = $Button
onready var DesiredLength = $LineEdit
onready var DesiredAmount = $LineEdit2
onready var PasswordList = $RichTextLabel


var chars:Array = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
 "!", "@", "#", "$", "%", "^", "&", "*", ":", ":", "?"]

var length: int = 0
var gencount: int = 0
var genwant: int = 0

var password: String = ""



# Connect signals
func _ready():
	GenerateButton.connect("pressed", self, "generate_pressed")
	DesiredLength.connect("text_changed", self, "length_changed")
	DesiredAmount.connect("text_changed", self, "amount_changed")


# Generate password
func generate(length: int, amount: int):
	while gencount < amount:
		randomize()
		password = ""
		while password.length() < length:
			var select = randi() % chars.size()
			var UL = randi() % 2 + 1
			if UL == 1:
				password += chars[select].to_upper()
			elif UL == 2:
				password += chars[select].to_lower()
		PasswordList.add_text(password)
		PasswordList.newline()
		PasswordList.newline()
		gencount += 1
	gencount = 0

# Set password length
func length_changed(new_text:String):
	length = new_text.to_int()
	print(length)

# Set amount to generate
func amount_changed(new_text:String):
	genwant = int(new_text)
	print(genwant)


# Generate on button press
func generate_pressed():
	generate(length, genwant)
