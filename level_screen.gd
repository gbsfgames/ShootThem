extends Control
onready var tween = Tween.new()
onready var count = 0

func _ready():
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 2
	timer.connect("timeout",self,"hide_level_message",["initial_level"])
	self.add_child(timer)
	timer.start()
	self.add_child(tween)

func hide_level_message(message):
	if !tween.is_active() and (message != "Win" and message != "Lose"):
		tween.interpolate_property($text_level,"rect_position",Vector2(482,144.5),Vector2(1460,144.5),2,Tween.TRANS_BACK,Tween.EASE_IN)
		tween.start()
	else:
		#tween.interpolate_property($text_level,"custom_fonts/font:size",200,250,1,Tween.TRANS_LINEAR,Tween.EASE_IN)
		tween.interpolate_property($text_level,"modulate",Color(255,255,255,1),Color(255,255,255,0),2,Tween.TRANS_LINEAR,Tween.EASE_IN)
		tween.start()
	
func pass_level(level):
	if !tween.is_active():
		tween.interpolate_property($text_level,"rect_position",Vector2(1460,144.5),Vector2(482,144.5),0.8,Tween.TRANS_LINEAR,Tween.EASE_IN)
		tween.start()
		$text_level.text = level
		var timer = Timer.new()
		timer.one_shot = true
		timer.wait_time = 2
		var message
		match level:
			"You Won":
				message = "Win"
			"Level 2":
				message = "Level 2"
			"You Lose":
				message = "Lose"
			var vary:
				print("en el match : %s" % vary)
				
		timer.connect("timeout",self,"hide_level_message",[message])
		self.add_child(timer)
		timer.start()
	
