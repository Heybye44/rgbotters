extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var sprite

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	sprite = get_node("Sprite")
	set_process(true)
	pass

func _process(delta):
	var c = Color(0, 0, 0)
	c.r = Globals.get("fish_pile_r")
	c.g = Globals.get("fish_pile_g")
	c.b = Globals.get("fish_pile_b")
	sprite.set_modulate(c)


