
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	reset_colors()
	pass

func reset_colors():
	Globals.set("fish_pile_r", 0)
	Globals.set("fish_pile_g", 0)
	Globals.set("fish_pile_b", 0)
