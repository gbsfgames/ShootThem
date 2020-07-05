extends Area2D
signal todo_damage

func _ready():
	self.connect("todo_damage",self.get_parent(),"do_damage")
	pass
	#self.global_position.x = self.get_parent().global_position.x

func _process(delta):
	self.move_local_y(10)

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()

func _on_enemy_bullet_body_entered(body):
	emit_signal("todo_damage",50)
