extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const PIPE_WIDTH = 26
const GROUND_HEIGHT = 55
const OFFSET_X = 65
const OFFSET_Y = 55
const AMOUNT_TO_FILL_VIEW = 3 
const scn_pipe = preload("res://scenes/pipe.tscn")

func _ready():
	go_init_position()
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func spawn_and_move():
	spawn_pipe()
	go_next_position()
	pass

func go_init_position():
	randomize()
	var init_pos = Vector2()
	init_pos.x = get_viewport_rect().size.x + PIPE_WIDTH/2
	init_pos.y = rand_range(OFFSET_Y,get_viewport_rect().size.y-GROUND_HEIGHT-OFFSET_Y)
	position = init_pos
	pass
	
func spawn_pipe():
	var new_pipe = scn_pipe.instance()
	new_pipe.position = position
	new_pipe.connect("tree_exited", self, "spawn_and_move")
	get_node("container").add_child(new_pipe)
	pass
	
func go_next_position():
	randomize()
	
	var next_pos = position
	next_pos.x += PIPE_WIDTH/2 + OFFSET_X + PIPE_WIDTH/2
	next_pos.y = rand_range(OFFSET_Y,get_viewport_rect().size.y-GROUND_HEIGHT-OFFSET_Y)
	position = next_pos
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
