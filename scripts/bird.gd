# script: bird

extends RigidBody2D

onready var state = FlyingState.new(self)

var speed = 50

const FLYING = 0
const FLAPPING=1
const HIT     =2
const GROUNDED=3

func _ready():
	pass

func _process(delta):
	state._update(delta)
	pass

func _input(event):
	state._input(event)
	pass
	
func set_state(new_state):
	state.exit()
	
	if new_state == FLYING:
		state = FlyingState.new(self)
	elif new_state == FLAPPING:
		state = FlappingState.new(self)
	elif new_state == HIT:
		state = HitState.new(self)
	elif new_state == GROUNDED:
		state = GroundedState.new(self)
	pass
	
func get_state():
	if state is FlyingState:
		return FLYING
	elif state is FlappingState:
		return FLAPPING
	elif state is HitState:
		return HIT
	elif state is GroundedState:
		return GROUNDED
	
	pass
	
class FlyingState:
	var bird
	var prev_gravity_scale
	
	func _init(bird):
		self.bird = bird
		bird.get_node("anim").play("flying")
		bird.set_linear_velocity(Vector2(bird.speed, bird.get_linear_velocity().y))
		
		prev_gravity_scale = bird.get_gravity_scale()
		bird.set_gravity_scale(0)
		pass
		
	func _update(delta):
		pass
		
	func _input(event):
		pass
				
	func exit():
		bird.set_gravity_scale(prev_gravity_scale)
		pass
		
		
class FlappingState:
	
	var bird
	
	func _init(bird):
		self.bird = bird
		
		bird.set_linear_velocity(Vector2(bird.speed, bird.get_linear_velocity().y))
		pass
		
	func _update(delta):
		if rad2deg(bird.rotation) < -30:
			bird.rotation = deg2rad(-30)
			bird.set_angular_velocity(0)
		
		if bird.get_linear_velocity().y > 0:
			bird.set_angular_velocity(3)
		pass
		
	func flap():
		bird.set_linear_velocity(Vector2(bird.get_linear_velocity().x, -150))
		bird.set_angular_velocity(-3)
		bird.get_node("anim").play("flap")
		pass
		
	func _input(event):
		if event.is_action_pressed("flap"):
			flap()
		pass
				
	func exit():
		pass
		
class HitState:
	
	var bird
	
	func _init(bird):
		self.bird = bird
		pass
		
	func _update(delta):
		pass
		
	func _input(event):
		pass
				
	func exit():
		pass
		
		
class GroundedState:
	
	var bird
	
	func _init(bird):
		self.bird = bird
		pass
		
	func _update(delta):
		pass
		
	func _input(event):
		pass
				
	func exit():
		pass