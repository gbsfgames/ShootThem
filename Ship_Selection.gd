extends Control
onready var red_ship = load("res://resources/sprites/sprites_nave_jugador/ship_sprite_idle_red.png")
onready var blue_ship = load("res://resources/sprites/sprites_nave_jugador/ship_sprite_idle_blue.png")
onready var main_scene = load("res://Main.tscn")
onready var ship_selected

func _ready():
	
	pass
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		print("Quiere salir??")
		
func _on_Classic_pressed():
	$"HBoxContainer/Right Container/ship_image".texture = blue_ship
	ship_selected = "blue_ship"

func _on_Basic_pressed():
	$"HBoxContainer/Right Container/ship_image".texture = red_ship
	ship_selected = "red_ship"
	
func _on_Play_button_pressed():
	VariablesGlobales.pj["ship"] = ship_selected
	self.get_tree().change_scene("res://Main.tscn")

