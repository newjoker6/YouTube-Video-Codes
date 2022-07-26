extends Control

var path = "E:/PCUSER/Documents/demo.csv"
var rows

func _ready():
	rows = get_data(path)
	print(rows)
	save_csv()



func get_data(path):
	var maindata = {}
	var f = File.new()
	f.open(path, f.READ)
	while !f.eof_reached():
		var data_set = Array(f.get_csv_line())
		maindata[maindata.size()] = data_set
	f.close()

	maindata.erase(maindata.size()-1)
	return maindata


func save_csv():
	var f = File.new()
	f.open("E:/PCUSER/Documents/demo_changed.csv", f.WRITE)
	f.store_line($TextEdit.text)
	f.close()


