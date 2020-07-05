extends Control
onready var red_ship = load("res://resources/sprites/sprites_nave_jugador/ship_sprite_idle_red.png")
onready var blue_ship = load("res://resources/sprites/sprites_nave_jugador/ship_sprite_idle_blue.png")
onready var main_scene = load("res://Main.tscn")
onready var ship_selected
onready var avalaible_ships=["blue_ship","red_ship"]
onready var nuevo = {"blue_ship":{"name":"blue_ship","texture":blue_ship},"red_ship":{"name":"red_ship","texture":red_ship}}
onready var avalaible_ships_size = avalaible_ships.size() - 1 # ultimo indice del array
onready var numero_cambio = 0

func _ready():
	$"HBoxContainer/Right Container/ship_image".texture = nuevo[avalaible_ships[numero_cambio]].texture
	ship_selected = nuevo[avalaible_ships[numero_cambio]].name
	print(nuevo.keys())
	pass
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		print("Quiere salir??")

func _on_Play_button_pressed():
	VariablesGlobales.pj["ship"] = ship_selected
	self.get_tree().change_scene("res://Main.tscn")

func _on_right_change_pressed():
	if numero_cambio >= avalaible_ships_size:
		numero_cambio = 0
		$"HBoxContainer/Right Container/ship_image".texture = nuevo[avalaible_ships[numero_cambio]].texture
		ship_selected = nuevo[avalaible_ships[numero_cambio]].name
		print(ship_selected)
	else:
		numero_cambio +=1;
		$"HBoxContainer/Right Container/ship_image".texture = nuevo[avalaible_ships[numero_cambio]].texture
		ship_selected = nuevo[avalaible_ships[numero_cambio]].name
		print(ship_selected)
	pass # Replace with function body.

func _on_left_change_pressed():
	if numero_cambio <= 0:
		numero_cambio = avalaible_ships_size
		$"HBoxContainer/Right Container/ship_image".texture = nuevo[avalaible_ships[numero_cambio]].texture
		ship_selected = nuevo[avalaible_ships[numero_cambio]].name
		print(ship_selected)
	else:
		numero_cambio -=1;
		$"HBoxContainer/Right Container/ship_image".texture = nuevo[avalaible_ships[numero_cambio]].texture
		ship_selected = nuevo[avalaible_ships[numero_cambio]].name
		print(ship_selected)
	pass # Replace with function body.
