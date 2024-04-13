extends TextureButton

var test:TextureButton

@onready var game_manager = get_node('/root/Main')

# Called when the node enters the scene tree for the first time.
func _ready():
	
	test = get_node(".")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var clickmask: BitMap = BitMap.new()
	clickmask.create_from_image_alpha(test.texture_normal.get_image())
	test.texture_click_mask = clickmask
	#test.
	#test.texture_normal.get_image()


func _on_pressed():
	game_manager.game_flags['TALK_TO_GLORBO'] = true
