extends Node

#--------   PLAYER   -------------
onready var velocidad = Vector2()
onready var puntaje = 0
onready var puntaje_nueva_vida = 0
onready var vida = 100
const gravedad = 400
const speed = 200
onready var teclaA = 65
onready var teclaD = 68


#--------- BASIC_ENEMY ------------
onready var basic_enemy_life = 100
onready var basic_enemy_shield = 100
onready var basic_enemy_velocity = 0

func _ready():
	pass
