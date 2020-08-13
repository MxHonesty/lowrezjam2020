extends Node


# Declare member variables here. Examples:

var started = 0
var open = 1 #retine daca e inchis sau deschis
var pos1	#CollisionShape in pozitia intiala
var pos2	#CollisionShape in pozitia secundara
var shutternode #nodul cu sprite pozitie secundara

# Called when the node enters the scene tree for the first time.
func _ready():
	pos1 = self.get_node("CollisionShape2D")
	pos2 = self.get_node("CollisionShape2D2")
	
	shutternode = get_node("/root/Node2D/SpriteController/Desk2")
	pass # Replace with function body.

func _on_Button_input_event(viewport, event, shape_idx):	#event listener pentru buton
	if(started == 1):
		if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
			
			if(open == 1): #inchide
				
				pos1.set_disabled(true)	#detectoarele de coliziuni
				pos2.set_disabled(false)
				
				get_parent().get_parent().get_node("CharacterSystem/scrollSprite").visible = false #disparitie Scroll
				get_parent().get_parent().get_node("Wcreate/newScroll").visible = true
				get_parent().get_parent().get_node("Wcreate").newEnchant()
				get_parent().get_parent().get_node("Wcreate/Buttons").enableButtons()
				
				shutternode.visible = true	#sprite
				
				open = 0
	
			elif(open == 0): #deschide
				
				pos1.set_disabled(false) #detectoare de coliziuni
				pos2.set_disabled(true)
				
				get_parent().get_parent().get_node("Wcreate/newScroll").visible = false
				get_parent().get_parent().get_node("CharacterSystem").ValidareClient(get_parent().get_parent().get_node("Wcreate").strength, get_parent().get_parent().get_node("Wcreate").intelligence, get_parent().get_parent().get_node("Wcreate").agility)
				get_parent().get_parent().get_node("CharacterSystem").NewClient()
				get_parent().get_parent().get_node("Wcreate/Buttons").disableButtons()
				
				shutternode.visible = false	#sprite
				
				open = 1

