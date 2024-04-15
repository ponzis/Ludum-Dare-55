extends "res://scripts/item.gd"

@export var next_room_id: int
@export var is_door :bool = false
#var default_door_sound = 

#@onready var room_manager = get_node('/root/Main/rooms')
func _ready():
	super()
	if is_door: #TODO make this an initialization function
		grab= preload("res://Exit.svg")
		if play_audio and audio_stream == null:
			audio_stream = AudioStreamRandomizer.new()
			audio_stream.add_stream(-1,preload("res://Audio/come in.wav"))
			init_audio_player()

	else:
		grab= preload("res://Exit.svg")
		if play_audio and audio_stream == null:
			audio_stream = AudioStreamRandomizer.new()
			audio_stream.add_stream(-1,preload("res://Audio/feet_crush.wav"))
			audio_stream.add_stream(-1,preload("res://Audio/feet_crush2.wav"))
			audio_stream.add_stream(-1,preload("res://Audio/feet_crush3.wav"))
			init_audio_player()
			
	pressed.connect(_on_pressed)

func _on_pressed():
	if uilock: 
		return
	play_audio_stream()
	game_manager.time_elapsed(action_cost)
	print("eleapsed: ", game_manager.action_counter)
	#Sets the flags for completeing the move
	set_flags(flags_on_completion)
	game_manager.trigger_game_flags_update()
	room_manager.set_next_scene(next_room_id, Vector2(0, 0))
