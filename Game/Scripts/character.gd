extends Node

var started = 0

#valori numerice atribute
var strength = 0
var intelligence = 0
var agility = 0

#referinta la sprite-ul fiecarui atribut
var stre
var inte 
var agi
var scrollSprite

#array-uri cu texturile pentru scroll
var albastru = []
var verde = []
var rosu = []



# Called when the node enters the scene tree for the first time.
func _ready():
	
	stre = get_node("scrollSprite/stre")	#referinte la prite-uri pentru scroll
	inte = get_node("scrollSprite/inte")
	agi = get_node("scrollSprite/agi")
	scrollSprite = get_node("scrollSprite")
	
	albastru.append(preload("res://Assets/Sprites/Scroll/ALBASTRU1.png"))	#incarca toate texturile necesare
	albastru.append(preload("res://Assets/Sprites/Scroll/ALBASTRU2.png"))
	albastru.append(preload("res://Assets/Sprites/Scroll/ALBASTRU3.png"))
	albastru.append(preload("res://Assets/Sprites/Scroll/ALBASTRU4.png"))
	
	rosu.append(preload("res://Assets/Sprites/Scroll/ROSU1.png"))
	rosu.append(preload("res://Assets/Sprites/Scroll/ROSU2.png"))
	rosu.append(preload("res://Assets/Sprites/Scroll/ROSU3.png"))
	rosu.append(preload("res://Assets/Sprites/Scroll/ROSU4.png"))
	
	verde.append(preload("res://Assets/Sprites/Scroll/VERDE1.png"))
	verde.append(preload("res://Assets/Sprites/Scroll/VERDE2.png"))
	verde.append(preload("res://Assets/Sprites/Scroll/VERDE3.png"))
	verde.append(preload("res://Assets/Sprites/Scroll/VERDE4.png"))
	
	#NewClient()
	#print(str(strength) + " " + str(intelligence) + " " + str(agility))


func generateNew():	#generates new values for character stats
	randomize()
	strength = int(rand_range(1, 5))
	intelligence = int(rand_range(1, 5))
	agility = int(rand_range(1, 5))
	
	stre.texture = rosu[strength - 1]	#atribuie texturile potrivite valorii
	inte.texture = albastru[intelligence - 1]
	agi.texture = verde[agility - 1]
	pass


func NewClient():	#functie apelata dupa terminarea clientului
	if(started == 1):
		scrollSprite.visible = true
		generateNew()
	
	
func ValidareClient(x, y ,z):	#calculare punctaj
	#	#strength intelligence agility
	
	var punctaj = 10
	var deficit = abs(x-strength) + abs(y-intelligence) + abs(z - agility)
	punctaj = punctaj - 2 * deficit
	if(punctaj == 10):
		 return 15
	else:
		 return punctaj