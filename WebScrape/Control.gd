extends Control


var data
var url:= 'product url'


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request(url)




func _on_HTTPRequest_request_completed(_result, _response_code, _headers, body):
	var response = body.get_string_from_utf8()
	
	var re = RegEx.new()
	re.compile("(CA)\\$\\d+\\.\\d{2}")
	var price = re.search(response).get_string()
	
	$TextEdit.text = price
	
	
#	if 'etsy' in url:
#		var price
#		if "Price:" in response:
#			data = response.split('Price:')
#			price = str(data[1]).split('</p>')
#			price = str(price[0].replace("</span>", ""))
#			price = price.split(" ")
#			for space in price:
#				if "$" in space:
#					price = space
#		else:
#			data = response.split('<p class="wt-text-title-03 wt-mr-xs-2">')
#			price = str(data[1]).split('</p>')
#			price = str(price[0].replace(" ", ""))
			
			



#		$TextEdit.text = 'The current price is: %s' %price


















#	var re = RegEx.new()
#	re.compile("(?i)(CA|span> )\\$\\d+\\.\\d{2}")
#	var price = re.search_all(response)
#	print(price)
#	$TextEdit.text = response
