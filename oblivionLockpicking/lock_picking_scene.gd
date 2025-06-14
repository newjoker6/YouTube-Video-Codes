extends Node2D

@export var lockedPinScene: PackedScene
@export var unlockedPinScene: PackedScene

enum DIFFICULTIES {
	EASY,
	NORMAL,
	HARD,
	MASTER
}

var LockMultiplier: Dictionary[int, float] = {
	DIFFICULTIES.EASY: 1.0,
	DIFFICULTIES.NORMAL: 0.4,
	DIFFICULTIES.HARD: 0.3,
	DIFFICULTIES.MASTER: 0.2,
}

var LockDifficulty: DIFFICULTIES = DIFFICULTIES.values().pick_random()

var unlockedpositions: Array[Vector2] = [
	Vector2(484, 273),
	Vector2(535, 273),
	Vector2(585, 273),
	Vector2(635, 273),
	Vector2(687, 273)
	]

var lockedpositions: Array[Vector2] = [
	Vector2(484, 208),
	Vector2(535, 208),
	Vector2(585, 208),
	Vector2(635, 208),
	Vector2(687, 208)
	]


func _ready() -> void:
	printt("Lock Difficulty:", DIFFICULTIES.keys()[LockDifficulty])
	var lock:Array[int]
	var offset:int = [1,2].pick_random() as int
	for i:int in range(LockDifficulty + offset):
		lock.append(1)
	while lock.size() < 5:
		lock.append(2)
	print(lock)

	for i:int in range(lock.size()):
		match lock[i]:
			1:
				var ups = unlockedPinScene.instantiate()
				ups.position = unlockedpositions[i]
				add_child(ups)
			2:
				var lps = lockedPinScene.instantiate()
				lps.position = lockedpositions[i]
				add_child(lps)
