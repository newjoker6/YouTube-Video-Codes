extends Sprite2D

@export var Card: CardData

@export_category("Card Elements")
@export var Background: Sprite2D
@export var Monster: Sprite2D
@export var Attack: Label
@export var Defense: Label
@export var Nameplate: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Background.texture = Card.Background
	Monster.texture = Card.Monster
	Attack.text = str(Card.Attack)
	Defense.text = str(Card.Defense)
	Nameplate.text = Card.name

