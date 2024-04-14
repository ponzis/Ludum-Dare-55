extends Label

@onready var game_manager = get_node('/root/Main')


func _ready():
	game_manager.time_update.connect(_on_time_update)


func _on_time_update(time: int):
	var time_string = 'Elapsed: %d' % time
	text = time_string
