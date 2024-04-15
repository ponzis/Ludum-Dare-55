extends "res://scripts/item.gd"


@export_file("*.json")  var dialog_file: String

@onready var ui_manager = get_node('/root/Main/ui')

@onready var dialogue = get_dialogue()
var state = {}
#var dialogue = {}

func _ready():
	super()
	pass

func _on_dialogue_clicked(option):
	print("Hit log ", option, " from ", dialogue['name'])
	
	var resposnses = state['resposnses']
	var selected_response = resposnses[option]
	if selected_response.has('effect'):
		var effect = selected_response['effect']
		set_effect(effect)

	if !selected_response.has('tree'):
		ui_manager.hide_dialoge()
		game_manager.trigger_game_flags_update()
		return
		
	set_dialogue_tree(selected_response['tree'])

func set_effect(effect):
	if effect is Array:
		for e in effect:
			set_effect(e)
		print(game_manager.game_flags)
		return
	
	if effect.has('key') and effect.has('value'):	
		game_manager.game_flags[effect['key']] = effect['value']
		
	if effect.has('key'):	
		game_manager.game_flags[effect['key']] = true
		
	if effect.has('time_cost'):	
		game_manager.time_elapsed(effect['time_cost'])
		
	print(game_manager.game_flags)

func get_dialogue() -> Dictionary:
	if dialog_file == null or dialog_file == "":
		return {}
	
	var file = FileAccess.open(dialog_file, FileAccess.READ)
	var json_object = JSON.new()
	json_object.parse(file.get_as_text())
	return json_object.get_data()

func check_codnition(conditon):
	if conditon is Array:
		if conditon == []:
			return true
		for c in conditon:
			if !check_codnition(c):
				return false
		return true
	if conditon is String:
		if conditon == "":
			return true
		return self.game_manager.game_flags.has(conditon)
	if conditon is Dictionary:
		var key = conditon['key']
		var value = conditon['value']
		var flags = self.game_manager.game_flags
		if self.game_manager.game_flags.has(key):
			return flags[key] == value
	return false

func get_dialogue_tree(trees) -> Dictionary:
	for tree in trees:
		if not tree.has('condition'):
			return tree
		if check_codnition(tree['condition']):
			return tree
	return {}

func get_dialogue_responses(responses) -> Array:
	var returns = []
	for response in responses:
		if not response.has('condition'):
			returns.append(response)
			continue 
		if check_codnition(response['condition']):
			returns.append(response)
	return returns


func set_events():
	for conection in ui_manager.dialogue_clicked.get_connections():
		ui_manager.dialogue_clicked.disconnect(conection['callable'])
	ui_manager.dialogue_clicked.connect(_on_dialogue_clicked)


func set_dialogue_tree(dialogue_tree) -> bool:
	var tree = get_dialogue_tree(dialogue_tree)
	state['tree'] = tree
	
	if tree == {}:
		return false
	
	var resposnses = []
	if tree.has('response'):
		resposnses = get_dialogue_responses(tree['response'])
	state['resposnses'] = resposnses
	
	ui_manager.set_person_text(tree['text'])
	ui_manager.set_person_resposnses(resposnses)
	return true

func start_dialog():
	set_events()
	if(set_dialogue_tree(dialogue['tree'])):
		ui_manager.set_person_name(dialogue['name'])
		ui_manager.show_dialoge()


func _on_pressed():
	if uilock: 
		return
	print("START CHAT with %s" % dialogue['name'])
	start_dialog()
	pass
