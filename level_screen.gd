extends Control
onready var tween = Tween.new()
func _ready():
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 2
	timer.connect("timeout",self,"hide_level_message",["yooo","ella"])
	self.add_child(timer)
	timer.start()
	self.add_child(tween)

func hide_level_message(message,message2):
	tween.interpolate_property($text_level,"rect_position",Vector2(482,144.5),Vector2(1460,144.5),2,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.start()
	#self.queue_free()
	pass
func pass_level(level):
	tween.interpolate_property($text_level,"rect_position",Vector2(1460,144.5),Vector2(482,144.5),2,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.start()
	$text_level.text = level
	#$text_level.rect_position = Vector2(482,144.5)
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 4
	timer.connect("timeout",self,"hide_level_message",["yooo","ella"])
	self.add_child(timer)
	timer.start()
	
