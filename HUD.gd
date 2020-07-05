extends Control
signal pause_to_you

func _ready():
	self.connect("pause_to_you",self.get_parent(),"pause_you")
	pass


func _on_b_Pause_pressed():
	self.emit_signal("pause_to_you",true)
	pass # Replace with function body.
