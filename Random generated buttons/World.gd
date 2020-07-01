extends Node2D

# Varaiables for spawning
export(Vector2) var button_size = Vector2(76,70) # could be a mob
export(float) var time_btw_spawn = 1.5 # The timer's wait time
onready var screenSize = get_viewport().get_visible_rect().size
onready var button = preload("res://Button.tscn") # The scene, that you want to call
export(Vector2) var  minmax_nodes = Vector2(1,3)
# Varaiables for scoring
var score = 0

func _ready():
	$Timer.set_wait_time(time_btw_spawn)
	$Timer.start()

func _physics_process(delta):
	$RichTextLabel.set_text("Your score is: " + str(score))

# Spawning every time_btw_spawn seconds
func _on_Timer_timeout():
	randomize()
	var numb_of_nodes = rand_range(minmax_nodes.x, minmax_nodes.y)
	
	for i in numb_of_nodes:
		# get random spawn position
		var spawn_pos = Vector2()
		spawn_pos.x = rand_range(button_size.x, screenSize.x - button_size.x)
		spawn_pos.y = rand_range(button_size.y, screenSize.y - button_size.y)
		
		
		var node = button.instance()
		add_child(node)
		node.position = spawn_pos
