extends Control

var path = "res://demo.csv"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dataTable: Dictionary = getData(path)
	tableData(dataTable)


func getData(path: String) -> Dictionary:
	var mainData: Dictionary = {}
	var f = FileAccess.open(path, FileAccess.READ)
	while !f.eof_reached():
		var dataSet = Array(f.get_csv_line())
		mainData[mainData.size()] = dataSet
	f.close()
	mainData.erase(mainData.size()-1)
	return mainData


func tableData(newData: Dictionary) -> void:
	var Table = $GridContainer
	for row in newData.keys():
		for data in newData[row]:
			var l = Label.new()
			l.text = data
			Table.add_child(l)





