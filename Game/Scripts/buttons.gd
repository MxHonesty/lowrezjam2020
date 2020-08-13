extends Node

var b1
var b2
var b3
var b4
var b5
var b6


# Called when the node enters the scene tree for the first time.
func _ready():
	b1 = $b1   #referinte butoane
	b2 = $b2
	b3 = $b3
	b4 = $b4
	b5 = $b5
	b6 = $b6

func enableButtons():
	b1.enableButton()
	b2.enableButton()
	b3.enableButton()
	b4.enableButton()
	b5.enableButton()
	b6.enableButton()

func disableButtons():
	b1.disableButton()
	b2.disableButton()
	b3.disableButton()
	b4.disableButton()
	b5.disableButton()
	b6.disableButton()

