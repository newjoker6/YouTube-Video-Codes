extends Node2D

@export var Highlight : ColorRect
@export var NoColour: Color
@export var LightColour: Color
@export var TargetColour: Color
@export var LineColour: Color
@export var EffectList: Array[String]

@onready var AttackLine: Line2D = $"%AttackLine"

var mouseIn: bool = false
var Attacked: bool = false

func _ready() -> void:
	Highlight.color = NoColour


func _on_area_2d_mouse_entered() -> void:
	mouseIn = true
	if (GameManager.CurrentTurn == GameManager.TURN.Attack
	and GameManager.Attacker):
		Highlight.color = TargetColour
		return
	Highlight.color = LightColour


func _on_area_2d_mouse_exited() -> void:
	mouseIn = false
	Highlight.color = NoColour


func _process(_delta: float) -> void:
		if Input.is_action_just_pressed("leftclick") and mouseIn:
#region set Attacker
			if (GameManager.CurrentTurn == GameManager.TURN.Attack
		and !GameManager.Attacker and Attacked == false):
				if "Player" in self.get_parent().name:
					GameManager.Attacker = self
				
#endregion

#region set Target
			if (GameManager.CurrentTurn == GameManager.TURN.Attack
		and GameManager.Attacker):
				if (GameManager.Attacker != self and 
				GameManager.Attacker.get_parent().name != self.get_parent().name):
					GameManager.Target = self
#endregion

#region activate card effects
					await get_tree().create_timer(0.5).timeout
					for e:String in GameManager.Attacker.EffectList:
						Effects.call(e)
#endregion

#region reset line
					AttackLine.clear_points()
					GameManager.Attacker.Highlight.color = NoColour
					GameManager.Target.Highlight.color = NoColour
					GameManager.Attacker.Attacked = true
					GameManager.clearTargetAttack()
#endregion

#region highlight if attacker or target
		if GameManager.Attacker == self:
			Highlight.color = LightColour
		elif GameManager.Target == self:
			Highlight.color = TargetColour
#endregion

#region draw line
		if GameManager.Attacker and GameManager.Target:
			AttackLine.clear_points()
			AttackLine.default_color = LineColour
			AttackLine.add_point(GameManager.Attacker.global_position)
			AttackLine.add_point(GameManager.Target.global_position)
#endregion
