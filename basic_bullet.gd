extends Area2D

func _ready():
	self.global_position.x = self.get_node("/root/Game/player/shooter").global_position.x

func _process(delta):
	
	self.move_local_y(-10)


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
	
