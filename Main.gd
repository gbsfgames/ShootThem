extends Node

onready var count = 0
onready var count_lose = 0
onready var actual_level = 1
onready var tweencito = Tween.new()
onready var tema = load("res://resources/Default_theme.tres")
onready var basic_enemy = load("res://basic_enemy.tscn")
onready var basic_enemy_1 = basic_enemy.instance() 
onready var total_enemies = []
onready var actual_life = VariablesGlobales.pj["life"]
onready var actual_score = VariablesGlobales.pj["score"]

signal level_pass

func _ready():
	$HUD/player_label.value = actual_life
	self.add_child(tweencito)
	self.add_child(basic_enemy_1)
	tweencito.connect("tween_completed",self,"letters_deleter")
	self.connect("level_pass",$level_screen,"pass_level")
	total_enemies.append(basic_enemy_1)
	basic_enemy_1.global_position = $enemy_positions/two.global_position
	
func animate_labels(position):
	# Subida de score
		actual_score +=1
		$HUD/label_score/score.text = str(actual_score)
	# Se agrega el indicador de daño com texto
		var text = Label.new()
		text.rect_global_position = position
		text.text = str(-2)
		text.theme = tema
		text.modulate = Color(0,255,0,1)
		get_parent().add_child(text)
	# Efecto de desaparicion del texto de nivel
		tweencito.interpolate_property(text,"modulate",Color(0,255,0,1),Color(0,255,0,0),1,Tween.TRANS_BOUNCE,Tween.EASE_IN)
		tweencito.start()

func letters_deleter(label,prop):
	var key1 = prop
	label.queue_free()
	
func enemy_eliminated(nodo):
	if nodo:
		nodo.queue_free()
		if nodo in total_enemies:
			total_enemies.erase(nodo)
	if total_enemies.size()==0:
		match actual_level:
			1:
				pass_level("Level 2")
			2:
				count = 0
				pass_level("Win")
				
func pass_level(level):
	
	if level == "Level 2" and count == 0:
		var basic_enemy_1 = basic_enemy.instance() 
		var basic_enemy_2 = basic_enemy.instance() 
		var basic_enemy_3 = basic_enemy.instance() 
		basic_enemy_1.global_position = $enemy_positions/two.global_position
		basic_enemy_2.global_position = $enemy_positions/one.global_position
		basic_enemy_3.global_position = $enemy_positions/tree.global_position
# Call_deferred ese llama para evitar el error de quereer llamar a una funcion varias veses al mismo tiempo
		self.call_deferred("add_child",basic_enemy_1)
		self.call_deferred("add_child",basic_enemy_2)
		self.call_deferred("add_child",basic_enemy_3)
		total_enemies.append(basic_enemy_1)
		total_enemies.append(basic_enemy_2)
		total_enemies.append(basic_enemy_3)
		count = 1
		self.emit_signal("level_pass","Level 2")
		actual_level = 2
		
	if level == "Win" and count == 0:
		self.emit_signal("level_pass","You Won")
		count = 1

	if level == "Lose" and count_lose == 0:
		print("You loseee")
		self.emit_signal("level_pass","You Lose")
		count_lose = 1
		
	print("Error no se pudo cargar el nivel %s count= %s" % [level,count])

func enemy_attack(bullet_target_position):
	var basic_enemy_bullet = load("res://basic_enemy_bullet.tscn").instance()
	self.add_child(basic_enemy_bullet)
	basic_enemy_bullet.global_position.x = bullet_target_position.x

func do_damage(damage):
	if actual_life >=1:
		actual_life -=  damage
		$HUD/player_label.value = actual_life
		if actual_life <=0:
			pass_level("Lose")
			$Shoot.queue_free()
			$player.queue_free()
			self.get_tree().change_scene("res://Ship_Selection.tscn")
	else:
		pass_level("Lose")
		$Shoot.queue_free()
		$player.queue_free()
		self.get_tree().change_scene("res://Ship_Selection.tscn")

func pause_you(estado):
	#print($Pause.name)
	self.get_node("contain_popups/Pause").visible = estado
	self.get_tree().paused = estado
