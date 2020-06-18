extends Node
onready var count = 0
onready var tweencito = Tween.new()
onready var tema = load("res://resources/Default_theme.tres")
onready var basic_enemy = load("res://basic_enemy.tscn")
onready var total_enemies = []

func _ready():
	self.add_child(tweencito)
	tweencito.connect("tween_completed",self,"letters_deleter")
	var basic_enemy_1 = basic_enemy.instance() 	
	basic_enemy_1.global_position = $enemy_positions/two.global_position
	self.add_child(basic_enemy_1)
	total_enemies.append(basic_enemy_1)

func animate_labels(position):
	#Se agrega el indicador de daño com texto
		var text = Label.new()
		text.rect_global_position = position
		text.text = str(-2)
		text.theme = tema 
		text.modulate = Color(0,255,0,1)
		get_parent().add_child(text)
	#efecto de desaparicion
		tweencito.interpolate_property(text,"modulate",Color(0,255,0,1),Color(0,255,0,0),1,Tween.TRANS_BOUNCE,Tween.EASE_IN)
		tweencito.start()

func letters_deleter(label,prop):
	#print("objeto %s , key %s" % [object,key])
	var key1 = prop
	label.queue_free()
func enemy_eliminated(nodo):
	print(total_enemies)
	print(nodo.name)
	if nodo:
		nodo.queue_free()
		total_enemies.pop_front().queue_free()
		
	if total_enemies.size()==0:
		pass_level("Level 2")
		
func pass_level(level):
	if level == "Level 2" and count == 0:
		#var basic_enemy = load("res://basic_enemy.tscn")
		var basic_enemy_1 = basic_enemy.instance() 
		var basic_enemy_2 = basic_enemy.instance() 
		var basic_enemy_3 = basic_enemy.instance() 
		basic_enemy_1.global_position = $enemy_positions/two.global_position
		basic_enemy_2.global_position = $enemy_positions/one.global_position
		basic_enemy_3.global_position = $enemy_positions/tree.global_position
#call deferred ese llama para evitar el error de quereer llamar a una funcion varias veses al mismo tiempo
		self.call_deferred("add_child",basic_enemy_1)
		self.call_deferred("add_child",basic_enemy_2)
		self.call_deferred("add_child",basic_enemy_3)
		total_enemies.append(basic_enemy_1)
		total_enemies.append(basic_enemy_2)
		total_enemies.append(basic_enemy_3)
		count = 1
	print("Error no se pudo cargar")
