extends Control


var token = "OTQxNzM3MzY0NDUwMDc0NjU1.YgaTRA.N4kLAAe9MX8-98SURtOVuKgufN4"
var prefix = "!"



func _ready():
	var discord_bot = $DiscordBot
	discord_bot.TOKEN = token
	discord_bot.login()

	discord_bot.connect("bot_ready", self, "_on_bot_ready")
	discord_bot.connect("message_create", self, "_on_message_create")



func _on_bot_ready(bot: DiscordBot):
	print("connected")
	
	bot.set_presence({
		'activity': {
			'type': 'GAME',
			'name': 'Hail The Blue Overlord'
		}
	})


func _on_message_create(bot: DiscordBot, message: Message, channel: Dictionary):

	if message.author.bot:
		return

	if not message.content.begins_with(prefix):
		return

	var raw_content = message.content.lstrip(prefix)

	var tokens = []
	var regex = RegEx.new()
	regex.compile("\\S+")

	for token in regex.search_all(raw_content):
		tokens.append(token.get_string())


	print(tokens[0])
	var cmd = tokens[0]
	tokens.remove(0)
	var args = tokens
	print(cmd)
	
	handle_command(bot, message, channel, cmd, args)


func handle_command(bot, message, channel, cmd, args):
	match cmd:
		'test':
#			bot.send(message, "@here")
#			var msg = yield(bot.reply(message, "don't say that"), "completed")
#			bot.edit(msg, "")

			bot.send(message, "hello there <@%s>" %[message.author.id])
			print("attempt: ", message.author)
			print(message)

		'ping':
			var starttime = OS.get_ticks_msec()
			var msg = yield(bot.reply(message, 'Ping...'), "completed")

			var latency = str(OS.get_ticks_msec() - starttime)
			bot.edit(msg, "Pong! My latency is %sms" %latency)


		"hello":
			bot.reply(message, "Hello user!")









