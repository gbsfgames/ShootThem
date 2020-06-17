extends KinematicBody2D

signal enemy_destroy
signal enemy_damage

#onready var tema = load("res://resources/Default_theme.tres")
onready var damage_tween = Tween.new()
onready var enemy_life = VariablesGlobales.basic_enemy_life
#onready var to_deleted_bullets = []

func _ready():
	self.add_child(damage_tween)
	#tweencito.connect("tween_completed",self,"letters_deleter")
	self.connect("enemy_destroy",self.get_node("/root/Game/level_screen"),"pass_level",["Level 2"])
	self.connect("enemy_destroy",self.get_parent(),"pass_level",["Level 2"])
	self.connect("enemy_damage",self.get_parent(),"animate_labels")
	
func _process(delta):
	$move.play("movement")

func _on_body_contact_area_entered(area):
	if "bullet" in area.name:
		enemy_life -= 2
		area.queue_free()
		self.emit_signal("enemy_damage",area.global_position)
		damage_tween.interpolate_property(self,"modulate",Color(255,255,255,1),Color(255,0,0,1),0.09,Tween.TRANS_BOUNCE,Tween.EASE_IN)
		damage_tween.start()
		if enemy_life <=0:
			self.emit_signal("enemy_destroy")
			#self.queue_free()



