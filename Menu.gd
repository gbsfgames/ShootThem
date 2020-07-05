extends Control
onready var windows_theme = preload("res://resources/popup_theme.tres")
onready var windowpop = ConfirmationDialog.new()


func _ready():
	self.add_child(windowpop)
	windowpop.theme = windows_theme
	windowpop.dialog_text = "Do you want to exit?"
	windowpop.window_title = "Warning"
	windowpop.dialog_hide_on_ok = false
	windowpop.popup_exclusive = false
	windowpop.connect("confirmed",self,"exit")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		windowpop.call_deferred("popup_centered",Vector2(600,300))
		
func _on_Game_pressed():
	self.get_tree().change_scene("res://Ship_Selection.tscn")

func _on_Exit_pressed():
	_notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func exit():
	self.get_tree().quit()
