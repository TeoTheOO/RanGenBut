extends Button

onready var world_node = get_parent().get_parent() 

func _on_Button_pressed():
	world_node.score += 1 # The parent is the "World" node
	# You can write here everything you want
	# To happen, when you click the button
	queue_free()
