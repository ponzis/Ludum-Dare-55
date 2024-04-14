extends Node

@export var debug: bool



# this is a place to store all the game flags
var game_flags = {}
func set_game_flag(key, value):
	game_flags[key] = value
	trigger_game_flags_update()
 
signal game_flags_update()
func trigger_game_flags_update():
	game_flags_update.emit()

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

func show_debug():
	var debug_lable = get_node_or_null("ui/Clock")
	if debug_lable != null:
		debug_lable.show()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	if debug:
		show_debug()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(game_flags)
	pass
