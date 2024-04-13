extends "res://scripts/item.gd"


@export var peron_name: String

func dialog():
	pass

func _on_pressed():
	print("START CHAT with %s" % peron_name)
	dialog()
