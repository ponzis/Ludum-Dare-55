extends Node

# this is a place to store all the game flags
var game_flags = {} 

# this stores action counter
var action_counter = 0


###flags
### TALK_TO_GLORBO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(game_flags)
	pass
