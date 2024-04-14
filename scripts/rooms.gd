extends Node

@export var scenes: Array[PackedScene] = [] 

var current_room: Node2D

func _ready():
	#Moves into room 4
	set_next_scene(4, Vector2(0, 0))

signal room_update()


func set_next_scene(index: int, start_loc: Vector2):
	var room_node_name =  'Room%d' % index
	print('go to %s' % room_node_name)
	
	var next_room: Node2D = get_node_or_null(room_node_name)
	if next_room == null:
		var next_scene = scenes[index-1]
		next_room = next_scene.instantiate()
		next_room.name = room_node_name
		add_child(next_room)
		next_room.translate(start_loc)
	
	# Hides current room
	if current_room != null:
		current_room.hide()
	room_update.emit()
	next_room.show()
	current_room = next_room
	
