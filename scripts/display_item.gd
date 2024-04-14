extends "res://scripts/item.gd"

@export var description: String
@export var overlay: Texture2D

@onready var ui_manager = get_node('/root/Main/ui')

func _ready():
	pressed.connect(_on_pressed)
	super()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_events():
	for conection in ui_manager.overlay_clicked.get_connections():
		ui_manager.overlay_clicked.disconnect(conection['callable'])
	ui_manager.overlay_clicked.connect(_on_overlay_clicked)


func _on_pressed():
	if uilock: 
		return
	set_events()
	ui_manager.show_display_image()
	ui_manager.display_image(overlay, description)
	#set flags here
	set_flags(flags_on_completion)
	game_manager.trigger_game_flags_update()

func _on_overlay_clicked():
	ui_manager.hide_display_image()
	#Add Completion code here
