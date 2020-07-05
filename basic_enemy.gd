extends KinematicBody2D

signal enemy_destroy
signal enemy_damage
signal enemy_attack
#onready var tema = load("res://resources/Default_theme.tres")
onready var damage_tween = Tween.new()
onready var attack_timer = Timer.new()
onready var enemy_life = VariablesGlobales.basic_enemy_life
onready var enemy_fire_rate = 1
onready var ready_toAttack = true

func _ready():
	self.add_child(damage_tween)
	self.add_child(attack_timer)
	self.connect("enemy_destroy",self.get_parent(),"enemy_eliminated")
	self.connect("enemy_damage",self.get_parent(),"animate_labels")
	self.connect("enemy_attack",self.get_parent(),"enemy_attack")
	self.attack_timer.connect("timeout",self,"ready_to_attack")
	
func _process(delta):
	$move.play("movement")
	if $body_contact/look.is_colliding():
		_enemy_attack()
	
func _on_body_contact_area_entered(area):
	if "bullet" in area.name:
		enemy_life -= 2
		area.queue_free()
		self.emit_signal("enemy_damage",area.global_position)
		damage_tween.interpolate_property($body_contact/enemy_sprite,"self_modulate",Color(255,0,0,1),Color(1,1,1,1),0.09,Tween.TRANS_BOUNCE,Tween.EASE_IN)
		damage_tween.start()
		if enemy_life <=0:
			self.emit_signal("enemy_destroy",self)

func ready_to_attack():
	ready_toAttack = true

func _enemy_attack():
	if ready_toAttack == true:
		#Lanza la bala
		ready_toAttack = false
		attack_timer.wait_time = enemy_fire_rate
		attack_timer.one_shot = true
		attack_timer.start()
		self.emit_signal("enemy_attack",self.get_node("body_contact").global_position)
