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
	
	stre.texture = get_parent().get_node("CharacterSystem").rosu[strength - 1]   #places the respective sprites
	inte.texture = get_parent().get_node("CharacterSystem").albastru[intelligence - 1]
	agi.texture = get_parent().get_node("CharacterSystem").verde[agility - 1]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
