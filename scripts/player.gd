extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentState = "coloring"
export var color = "fish_pile_g"
var action_tint = Color(0, 0, 0)
var thermal = 10
var thermal_bar
var a_button
var b_button

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	thermal_bar = get_node("Thermal_Bar")
	if color == "fish_pile_r":
		a_button = "r_a_button"
		b_button = "r_b_button"
		action_tint = Color(1, 0, 0)
	else:
		if color == "fish_pile_g":
			a_button = "g_a_button"
			b_button = "g_b_button"
			action_tint = Color(0, 1, 0)
		else:
			if color == "fish_pile_b":
				a_button = "b_a_button"
				b_button = "b_b_button"
				action_tint = Color(0, 0, 1)
		
		
	set_process(true)
	pass

func _process(delta):
	
	
	if currentState == "coloring":
		process_in_coloring(delta)
	else: 
		if currentState == "dead":
			procces_in_dead()

func process_in_coloring(delta):
	var incr = .2
	if thermal > 75 and thermal < 99:
		incr = .05
	else:
		if thermal > 99:
			incr = 0
			explode()
	
	if Input.is_action_pressed(a_button) and Globals.get(color) < .99:
		Globals.set(color, Globals.get(color) + incr * delta)
#		print(Globals.get(color))
	else:
		if Input.is_action_pressed(b_button) and Globals.get(color) > 0:
			Globals.set(color, Globals.get(color) - incr * delta)
#			print(Globals.get(color))
	
	if Input.is_action_pressed(a_button) or Input.is_action_pressed(b_button):
		thermal = thermal + incr * delta * 100
		get_node("Sprite").set_modulate(action_tint)
	else:
		get_node("Sprite").set_modulate(Color(1, 1, 1))
		if thermal > 10:
			thermal = thermal - incr * delta * 100
#	print(color + ": ", thermal, "C")
	
	thermal_bar.set_value(thermal)
	

func explode():
	print("Player: " + color + " exploded")
	currentState = "dead"

func procces_in_dead():
#	print( color + " died and is still dead")
	get_node("Sprite").set_modulate(Color(0, 0, 0))
	get_node("Sprite").set_scale(Vector2(.2, .1))