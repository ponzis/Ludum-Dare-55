extends Node

var button_count = 3

func set_person_name(person_name: String):
	print("Name: ", person_name)
	var name_node: Label = get_node_or_null('Dialogue/Name')
	name_node.text = person_name


func set_person_text(text: String):
	print("Text: ", text)
	var text_node: Label = get_node_or_null('Dialogue/Text')
	text_node.text = text



func set_person_resposnses(responses: Array):
	print("Responses: ", responses)
	
	for index in range(button_count):
		var option_node_name =  'Dialogue/Text/Option_%d' % (index + 1)
		
		if index < responses.size():
			var option = responses[index]
			
			print(option_node_name, option)
			var option_node: Button = get_node_or_null(option_node_name)
			if option_node == null: 
				continue
			option_node.show()
			option_node.text = option['text']
		else:
			var option_node: Button = get_node_or_null(option_node_name)
			if option_node == null: 
				continue
			option_node.hide()



signal dialogue_clicked(option: int)

func _on_option_3_pressed():
	dialogue_clicked.emit(2)
	pass # Replace with function body.


func _on_option_2_pressed():
	dialogue_clicked.emit(1)
	pass # Replace with function body.


func _on_option_1_button_up():
	dialogue_clicked.emit(0)
	pass # Replace with function body.
