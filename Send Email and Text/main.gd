extends Control


var url = "https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send"


var header := [
	'content-type: application/json',
	'X-RapidAPI-Host: rapidprod-*************.rapidapi.com',
	'X-RapidAPI-Key: 025f181026******************p148ceajsnbdfe80d19a2b'
	]


var payload = '{\r\"personalizations\": [\r{\r\"to\": [\r{\r\"email\": \"%s\"\r}\r],' \
+ '\r\"subject\": \"%s\"\r}\r],\r\"from\": {\r\"email\": \"%s\"\r},'\
+ '\r\"content\": [\r{\r\"type\": \"text/plain\",\r\"value\": \"%s\"\r}\r]\r}'


#var payload = '{	"personalizations": [		{			"to": [{"email": "n******6@gmail.com"}],			"subject": "Hello, World!"		}	],	"from": {"email": "from_address@example.com"},	"content": [		{			"type": "text/plain",			"value": "Hello, World!"		}	]}'

var address: String = "n******6@gmail.com"
var subject: String = "Hello, World"
var from_email: String = 'n******6@gmail.com'
var value: String = "Hello World!!"


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 400:
		print('failed request')
	if response_code == 202:
		print('success request')


func _on_Button_pressed():
	value = $LineEdit.text
	$HTTPRequest.request(url, header, true, HTTPClient.METHOD_POST, payload %[address, subject, from_email, value] )
