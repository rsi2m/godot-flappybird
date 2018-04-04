extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const scn_ground = preload("res://scenes/ground.tscn")
const GROUND_WIDTH = 168
const AMOUNT_TO_FILL_VIEW = 2

func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()
	pass
	
func spawn_and_move():
	spawn_ground()
	go_next_position()
	pass
	
func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.position=position
	get_node("container").add_child(new_ground)
	new_ground.connect("tree_exited", self, "spawn_and_move")
	pass
	
func go_next_position():
	position = position + Vector2(GROUND_WIDTH,0)
	pass 

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
