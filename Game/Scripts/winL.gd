extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("ui_click") && event.pressed):	#daca apasa click dreapta
		get_tree().reload_current_scene()
