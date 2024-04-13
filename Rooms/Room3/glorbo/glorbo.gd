extends TextureButton

@onready var game_manager = get_node('/root/Main')

var clickmask: BitMap = BitMap.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clickmask.create_from_image_alpha(self.texture_normal.get_image())
	self.texture_click_mask = clickmask


func _on_pressed():
	game_manager.game_flags['TALK_TO_GLORBO'] = true
