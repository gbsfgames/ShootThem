extends Node2D
onready var over = false

func _ready():
	pass

func _process(delta):
	if !$left_button.is_pressed() and !$right_button.is_pressed():
		$palanca.position = $start_position.position
	if $left_button.is_pressed():
		$palanca.position = self.get_local_mouse_position()
		print("left")
	elif $right_button.is_pressed():
		$palanca.position = self.get_local_mouse_position()
		print("right")

func _on_palanca_mouse_entered():
	over = true

func _on_palanca_mouse_exited():
	over = false

func _on_shoot_pressed():
	if $"../Shoot" !=null:
		var bullet = load("res://basic_bullet.tscn").instance()
		$"../Shoot".add_child(bullet)
		self.get_parent().get_node("shoot").play()

