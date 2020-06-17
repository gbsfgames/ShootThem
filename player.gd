extends KinematicBody2D

func _ready():
	print(VariablesGlobales.vida)

func _physics_process(delta):
	if !Input.is_action_pressed("click_left") and !Input.is_action_pressed("click_right") and !Input.is_key_pressed(VariablesGlobales.teclaD) and !Input.is_key_pressed(VariablesGlobales.teclaA):
		VariablesGlobales.velocidad.x = 0
	if Input.is_key_pressed(VariablesGlobales.teclaD) or Input.is_action_pressed("click_right"):
		VariablesGlobales.velocidad.x = 500
	if Input.is_key_pressed(VariablesGlobales.teclaA) or Input.is_action_pressed("click_left"):
		VariablesGlobales.velocidad.x = -500	#VariablesGlobales.velocidad = VariablesGlobales.velocidad.normalized() * VariablesGlobales.speed
	self.move_and_slide(VariablesGlobales.velocidad)
