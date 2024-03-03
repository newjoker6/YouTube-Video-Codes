extends Node


# without guard clause
func get_element(array, index):
	if index >= 0 and index < len(array):
		return array[index]
	else:
		return "Error: Index out of bounds"


# with guard clause
func get_elements(array, index):
	if index < 0 or index >= len(array):
		return "Error: Index out of bounds"
	return array[index]








func process_employee_data(employee_data, departments):
	if employee_data.size() == 0 || departments.size() == 0:
		return "Error: Data is empty"

	var processed_employee_data = {}
	for department in departments:
		processed_employee_data[department] = []
		for employee in employee_data:
			if employee["department"] == department:
				processed_employee_data[department].append(employee)

	return processed_employee_data

