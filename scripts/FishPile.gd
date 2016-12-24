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
	
	if c == Color(1, 1, 1):
		reset_colors()

func reset_colors():
	Globals.set("fish_pile_r", 0)
	Globals.set("fish_pile_g", 0)
	Globals.set("fish_pile_b", 0)



