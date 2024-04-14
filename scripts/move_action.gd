extends "res://scripts/item.gd"

@export var next_room_id: int


#@onready var room_manager = get_node('/root/Main/rooms')
func _ready():
	super()
	grab= preload("res://Exit.svg")
	pressed.connect(_on_pressed)

func _on_pressed():
	game_manager.time_elapsed(action_cost)
	print("eleapsed: ", game_manager.action_counter)
	#Sets the flags for completeing the move
	set_flags(flags_on_completion)
	room_manager.set_next_scene(next_room_id, Vector2(0, 0))
