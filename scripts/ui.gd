extends Node


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
	
	for index in range(responses.size()):
		var option_node_name =  'Dialogue/Text/Option_%d' % (index + 1)
		var option = responses[index]
		
		print(option_node_name, option)
		var option_node: Label = get_node_or_null(option_node_name)
		if option_node == null: 
			continue
		option_node.text = option['text']

