extends "res://scripts/item.gd"

@export var next_room_id: int

@onready var room_manager = get_node('/root/Main/rooms')


func _on_pressed():
	room_manager.set_next_scene(next_room_id, Vector2(0, 0))
