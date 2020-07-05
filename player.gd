extends KinematicBody2D

onready var blue_ship_frames = load("res://Sprite_Frames/blue_ship_frames.tres")
onready var red_ship_frames = load("res://Sprite_Frames/red_ship_frames.tres")

func _ready():
	match VariablesGlobales.pj["ship"]:
		"blue_ship":
			$sprite_nave.frames = blue_ship_frames
		"red_ship":
			$sprite_nave.frames = red_ship_frames

func _physics_process(delta):
	if !Input.is_action_pressed("click_left") and !Input.is_action_pressed("click_right") and !Input.is_key_pressed(VariablesGlobales.teclaD) and !Input.is_key_pressed(VariablesGlobales.teclaA):
		VariablesGlobales.velocidad.x = 0
		$sprite_nave.play("idle")
		
	if Input.is_key_pressed(VariablesGlobales.teclaD) or Input.is_action_pressed("click_right"):
		VariablesGlobales.velocidad.x = 500
		$sprite_nave.play("right")
		
	if Input.is_key_pressed(VariablesGlobales.teclaA) or Input.is_action_pressed("click_left"):
		VariablesGlobales.velocidad.x = -500	#VariablesGlobales.velocidad = VariablesGlobales.velocidad.normalized() * VariablesGlobales.speed
		$sprite_nave.play("left")
		
	self.move_and_slide(VariablesGlobales.velocidad)
	
