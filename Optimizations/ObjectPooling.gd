extends Control


class Bullet:
	pass

# Initialize the pool with a set number of bullets
const BULLET_POOL_SIZE = 100
var bullet_pool = []
# A flag to track if the bullet is in use
var bullet_in_use = []
func _ready() -> void:
	for i in range(BULLET_POOL_SIZE):
		bullet_pool.append(Bullet.new())


	for i in range(BULLET_POOL_SIZE):
		bullet_in_use.append(false)

# Function to retrieve a bullet from the pool
func get_bullet():
	for i in range(BULLET_POOL_SIZE):
		if not bullet_in_use[i]:
			bullet_in_use[i] = true
			return bullet_pool[i]
	return null

# Function to return a bullet to the pool
func return_bullet(bullet):
	for i in range(BULLET_POOL_SIZE):
		if bullet_pool[i] == bullet:
			bullet_in_use[i] = false
			break

func use_bullet() -> void:
	# Use the get_bullet function to get a bullet from the pool
	var bullet = get_bullet()
	if bullet != null:
		# Use the bullet in your game
		# ...
		# Return the bullet to the pool when done
		return_bullet(bullet)
