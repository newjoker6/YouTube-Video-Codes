extends Control


# Code to profile
func _process(delta):
	for i in range(10000):
		perform_expensive_operation()

func perform_expensive_operation():
	var result = 0
	for i in range(1000):
		result += i * i

