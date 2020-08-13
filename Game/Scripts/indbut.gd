extends Node


var sprite
var col

var anim

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("but")
	col = get_node("CollisionShape2D")
	pass # Replace with function body.

	anim = get_node("but/AnimationPlayer")

func disableSprite():
	sprite.visible = false

func enableSprite():
	sprite.visible = true
	
func disableCollider():
	col.set_disabled(true)

func enableCollider():
	col.set_disabled(false)
	
func enableButton():
	enableCollider()
	enableSprite()
	
func disableButton():
	disableCollider()
	disableSprite()
