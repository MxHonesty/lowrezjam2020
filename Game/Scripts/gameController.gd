extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass




func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		
		get_parent().get_node("CharacterSystem").started = 1 	#porneste jocul
		get_parent().get_node("CharacterSystem").NewClient()
		get_parent().get_node("SpriteController/Button").started = 1
		
		get_parent().get_node("CharacterSystem/characterSprite/RichTextLabel").visible = true
		get_node("Sprite").visible = false		#autoeliminare
		get_node("CollisionShape2D").disabled = true
		
