extends Control

signal pause_to_you

func _ready():
	connect("pause_to_you",self.get_parent().get_parent(),"pause_you")

func _on_b_continue_pressed():
	if self.get_tree().paused == true:
		self.emit_signal("pause_to_you",false)

func _on_b_exit_title_pressed():
	self.emit_signal("pause_to_you",false)
	self.get_tree().change_scene("res://Menu.tscn")
	
	
	

