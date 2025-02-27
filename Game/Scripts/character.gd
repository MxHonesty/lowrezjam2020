extends Node

#sistem puncte
var coins = 15
var winCondition = 100
var loseCondition = -20

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

#referinta sprite-uri caractere
var caractere = []

#array-uri cu texturile pentru scroll
var albastru = []
var verde = []
var rosu = []

var player
var winmusic
var losemusic
var winplaying = 0
var loseplaying = 0

var musicPlaying = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	player = AudioStreamPlayer.new()
	self.add_child(player)
	
	winmusic = AudioStreamPlayer.new()
	self.add_child(winmusic)
	
	losemusic = AudioStreamPlayer.new()
	self.add_child(losemusic)
	
	player.stream = load("res://CHIPTUNE_Loop_Minstrel_Dance.wav")
	player.play()
	
	winmusic.stream = load("res://win music 1.wav")
	losemusic.stream = load("res://Retro_No hope.wav")
	
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
	
	caractere.append(preload("res://Assets/Sprites/Characters/Warrior.png"))	#incarcare 
	caractere.append(preload("res://Assets/Sprites/Characters/Wizard.png"))
	caractere.append(preload("res://Assets/Sprites/Characters/Rogue.png"))
	
	#NewClient()
	#print(str(strength) + " " + str(intelligence) + " " + str(agility))

func _process(delta):
	if(coins >= winCondition):
		player.stop()
		if(winplaying == 0):
			winmusic.play()
			winplaying = 1
		get_parent().get_node("winW").visible = true
	elif(coins <= loseCondition):
		player.stop()
		if(loseplaying==0):
			losemusic.play()
			loseplaying = 1
		get_parent().get_node("win").visible = true
		pass
	pass


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
		scrollSprite.visible = true		#deseneaza scrollul pe ecran
		generateNew()                   #genereaza noul set de valori si atribuie texturile scroll-ului
		
		var car = max3(strength, intelligence, agility)         #deteminam prima valoare maxima dintre atribute
		get_node("characterSprite").texture = caractere[car - 1] #desenam sprite-ul corespunzator
	
	
func ValidareClient(x, y ,z):	#calculare punctaj
	#	#strength intelligence agility
	#print(str(strength) + " " + str(intelligence) + " " + str(agility))
	#print(str(x) + " " + str(y) + " " + str(z))
	
	var punctaj = 10
	var deficit = abs(x-strength) + abs(y-intelligence) + abs(z - agility)
	punctaj = punctaj - 3 * deficit
	if(punctaj == 10):
		 coins = coins + 25
		 #print(coins)
	else:
		 coins = coins + punctaj
		 #print(coins)
		
	get_parent().get_node("CharacterSystem/characterSprite/RichTextLabel").text = "Coins: " + str(coins)
	get_parent().get_node("CharacterSystem/characterSprite/RichTextLabel").update()
func max3(x, y, z):
	var ret = max(x, y)
	ret = max(ret, z)
	
	if(ret == x):
		return 1
	elif(ret == y):
		return 2
	elif(ret == z):
		return 3


func _input(event):
	if(event.is_action_pressed("ui_muzic")):
		if(musicPlaying == 1):
			player.stop()
			musicPlaying = 0
			
		elif(musicPlaying == 0):
			#print("play")
			player.play()
			musicPlaying = 1
