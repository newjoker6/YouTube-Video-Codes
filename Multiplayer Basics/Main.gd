extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var playerScene: PackedScene
var PORT:int = 135
var SERVER: String = "127.0.0.1"

@export var chatDisplay: RichTextLabel
@export var textInput: LineEdit
var builtInColors: Array[String] = [
	"RED",
	"GREEN",
	"BLUE",
	"WHITE",
	"BLACK",
	"GRAY",
	"ORANGE",
	"YELLOW",
	"CYAN",
	"MAGENTA"
]
var myColour: String

func _ready() -> void:
	randomize()
	myColour = builtInColors.pick_random().to_lower()


func _on_send_button_pressed() -> void:
	var id:int = peer.get_unique_id()
	var message: String = textInput.text
	textInput.clear()
	rpc("sendMessage", id, message, myColour)


@rpc("any_peer", "call_local")
func sendMessage(id:int, msg: String, colour: String) -> void:
	chatDisplay.append_text("[bgcolor=black][color=%s]%s[/color]: %s[/bgcolor]" %[colour, id, msg])
	chatDisplay.newline()


func _on_host_button_pressed() -> void:
	hideButtons(true)
	print("pressed")
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(AddPlayer)
	multiplayer.peer_disconnected.connect(RemovePlayer)
	AddPlayer()


func RemovePlayer(id: int):
	get_node(str(id)).queue_free()


func AddPlayer(id:int = 1):
	var player: CharacterBody2D = playerScene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)


func _on_join_button_pressed() -> void:
	hideButtons(true)
	var ok = peer.create_client(SERVER, PORT)
	print(ok)
	print(OK)
	multiplayer.multiplayer_peer = peer


func hideButtons(vis: bool):
	if vis == true:
		$CanvasLayer/HostButton.hide()
		$CanvasLayer/JoinButton.hide()

