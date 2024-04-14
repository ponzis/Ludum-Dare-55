extends Node

# this is a place to store all the game flags
var game_flags = {} 

# this stores action counter
var action_counter: int = 0


signal time_update(time: int)



var uilock:bool
signal ui_lock(locked: bool)

func toggle_ui_lock():
	set_ui_lock(!uilock)

func set_ui_lock(lock):
	uilock = lock
	ui_lock.emit(lock)

func time_elapsed(cost: int):
	action_counter += cost
	time_update.emit(action_counter)

###flags
### TALK_TO_GLORBO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(game_flags)
	pass
