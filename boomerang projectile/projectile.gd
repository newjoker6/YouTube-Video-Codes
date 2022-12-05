extends KinematicBody2D

var speed = 500
var velocity = Vector2.ZERO
var goal
var returning = false
var player


func _ready():
	player = get_parent().get_node("Player")


func _process(_delta):
	if self.position.distance_to(goal) < 2:
		print("reached")
		returning = true
		retrn()
		
	if returning == true and self.position.distance_to(player.position) < 2:
		self.queue_free()
		
	move_and_slide(velocity)


func move(target):
	goal = target
	velocity = self.position.direction_to(target) * speed


func retrn():
	velocity = self.position.direction_to(player.position) * speed
