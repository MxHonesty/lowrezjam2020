extends Node

#atributele numerice ilustrate pe noul scroll
var strength = 1
var intelligence = 1
var agility = 1

var stre
var inte
var agi

# Called when the node enters the scene tree for the first time.
func _ready():
	stre = get_node("newScroll/stre")	#referinte la prite-uri pentru scroll
	inte = get_node("newScroll/inte")
	agi = get_node("newScroll/agi")
	
	newEnchant()
	
	pass # Replace with function body.

func newEnchant():	#generates a new enchant scroll with new values
	randomize()
	strength = int(rand_range(1,3))   #generates the values
	intelligence = int(rand_range(1,3))
	agility = int(rand_range(1,3))
	
	updateScroll()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func updateScroll():
	stre.texture = get_parent().get_node("CharacterSystem").rosu[strength - 1]   #places the respective sprites
	inte.texture = get_parent().get_node("CharacterSystem").albastru[intelligence - 1]
	agi.texture = get_parent().get_node("CharacterSystem").verde[agility - 1]

func _on_b1_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		if(intelligence < 4):
			if(strength > 1):
				strength = strength - 1
			intelligence = intelligence + 1
			updateScroll()
		print("b1")

func _on_b2_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		if(agility < 4):
			strength = 1
			agility = agility + 1
			if(intelligence > 1):
				intelligence = intelligence - 1
			updateScroll()
		print("b2")

func _on_b3_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		if(strength < 4):
			strength = strength + 1
			updateScroll()
			
		print("b3")

func _on_b4_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		var redus = get_parent().get_node("CharacterSystem").max3(strength, intelligence, agility)
		if(redus == 1):
			strength = 1
			
		if(redus == 2):
			intelligence = 1
			
		if(redus == 3):
			agility = 1
			
		updateScroll()
		print("b4")

func _on_b6_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		newEnchant()
		print("b6")

func _on_b5_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		var redus = get_parent().get_node("CharacterSystem").max3(strength, intelligence, agility)
		if(redus == 1 and strength > 1):
			strength = strength - 1
			
		if(redus == 2 and intelligence > 1):
			intelligence = intelligence - 1
			
		if(redus == 3 and agility > 1):
			agility = agility - 1
		updateScroll()
		print("b5")
