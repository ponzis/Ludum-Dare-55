extends Node


@onready var game_manager = get_node('/root/Main')

@onready var room_manager = get_node('/root/Main/rooms')

@export var end_flag: String = "HAS_SUSSIE" 
@export var next_room_id: int

func _ready():
	game_manager.game_flags_update.connect(_on_game_flags_update)


func _on_game_flags_update():
	print("Check END")
	var flags = game_manager.game_flags
	if flags.has(end_flag) and flags[end_flag]:
		room_manager.set_next_scene(next_room_id, Vector2(0, 0))
		
	
	
