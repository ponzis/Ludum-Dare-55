extends TextureButton

# We get a reference to game manager to handle persistent events
@onready var game_manager = get_node('/root/Main')

@onready var room_manager = get_node('/root/Main/rooms')

@export var crosshair:Resource = preload("res://crosshair_24.svg")
@export var grab:Resource = preload("res://InspectCursor.svg")

@export_range(0, 100) var action_cost: int = 5

@export_group("Visibility Flags")

@export var visibility_flags:= {}

@export var visible_without_flag := true

@export_group("Completion Flags")
@export var flags_on_completion:= {}

var uilock: bool

func check_conditions(flags:Dictionary,ignore_missing = true, return_if_met = true):#TODO: Rename to check flags?
	if flags.is_empty() and ignore_missing:
		print("No flags set.")
		return return_if_met
	else:
		for flag in flags.keys():
			print(flag)
			if game_manager.game_flags.has(flag):
				if game_manager.game_flags[flag] == flags[flag]:
					print("THISIS TRUE!")
					pass
				else:
					#Fail condition
					return not return_if_met
			else:
				if ignore_missing:
					pass #Skip if ignoring missing
				else:
					return not return_if_met #Else, autofail
	return return_if_met #since we got through the ladder we are confirmed.

func set_flags(flags:Dictionary):
	print("Setting Flags")
	for flag in flags.keys():
		print("	%s"%flag)
		game_manager.game_flags[flag]=flags[flag]


var clickmask: BitMap = BitMap.new()

# Called when the node enters the scene tree for the first time.
func _ready():#Onready overwrites the parents on ready
	print("Bepis")
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	
	game_manager.ui_lock.connect(_on_ui_lock)
	game_manager.game_flags_update.connect(_on_game_flags_update)
	room_manager.room_update.connect(_on_room_update)

	print("Item %s ready" % self.name)
	#Set loaded visibility
	set_visability()
	Input.set_custom_mouse_cursor(crosshair)
	make_clip_mask()

func set_visability():
	if check_conditions(visibility_flags,visible_without_flag):
		print("SHOWING!", self.name)
		self.show()
	else:
		print("HIDING", self.name)
		self.hide()

func make_clip_mask():
	if self.texture_normal == null:
		return
	var image = self.texture_normal.get_image()
	if image == null:
		return
	clickmask.create_from_image_alpha(image)
	self.texture_click_mask = clickmask

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_lock(lock: bool):
	uilock = lock

func _on_mouse_entered():
	if uilock: 
		return
	print("Enter")
	Input.set_custom_mouse_cursor(grab)
	

func _on_mouse_exited():
	print("Exited")
	Input.set_custom_mouse_cursor(crosshair)

func _on_game_flags_update():
	set_visability()

func _on_room_update():
	set_visability()

