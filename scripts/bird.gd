# script: bird

extends RigidBody2D

onready var state = FlyingState.new(self)

var previous_state

var speed = 50

const FLYING = 0
const FLAPPING=1
const HIT     =2
const GROUNDED=3

signal state_changed

func _ready():
	add_to_group(game.GROUP_BIRD)
	set_process_unhandled_input(true)
	connect("body_entered",self, "on_body_entered")
	pass
	
func on_body_entered(other_body):
	if state.has_method("on_body_entered"):
		state.on_body_entered(other_body)
	pass

func _process(delta):
	state._update(delta)
	pass

func _input(event):
	state._input(event)
	pass
	
func _unhandled_input(event):
	if state.has_method("_unhandled_input"):
		state._unhandled_input(event)
	pass
	
func set_state(new_state):
	state.exit()
	previous_state = get_state()
	if new_state == FLYING:
		state = FlyingState.new(self)
	elif new_state == FLAPPING:
		state = FlappingState.new(self)
	elif new_state == HIT:
		state = HitState.new(self)
	elif new_state == GROUNDED:
		state = GroundedState.new(self)
	
	emit_signal("state_changed",self)
	
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
		bird.get_node("anim").stop()
		bird.get_node("anim_sprite").position = Vector2(0,0)
		pass
		
		
class FlappingState:
	
	var bird
	
	func _init(bird):
		self.bird = bird
		
		bird.set_linear_velocity(Vector2(bird.speed, bird.get_linear_velocity().y))
		flap()
		pass
		
	func _unhandled_input(event):
		if !(event is InputEventMouseButton) or !event.is_pressed() or event.is_echo():
			return
		
		if event.button_index == BUTTON_LEFT:
			flap()
		pass
		
	func _update(delta):
		if rad2deg(bird.rotation) < -30:
			bird.rotation = deg2rad(-30)
			bird.set_angular_velocity(0)
		
		if bird.get_linear_velocity().y > 0:
			bird.set_angular_velocity(3)
		pass
		
	func on_body_entered(other_body):
		if other_body.is_in_group(game.GROUP_PIPES):
			bird.set_state(bird.HIT)
		elif other_body.is_in_group(game.GROUP_GROUNDS):
			bird.set_state(bird.GROUNDED)
		pass
		
	func flap():
		bird.set_linear_velocity(Vector2(bird.get_linear_velocity().x, -150))
		bird.set_angular_velocity(-3)
		bird.get_node("anim").play("flap")
		
		audio_player.get_node("flap").play()
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
		bird.set_linear_velocity(Vector2(0,0))
		bird.set_angular_velocity(2)
		
		var other_body = bird.get_colliding_bodies()[0]
		bird.add_collision_exception_with(other_body)
		
		audio_player.get_node("hit").play()
		audio_player.get_node("die").play()
		pass
		
	func _update(delta):
		pass
		
	func on_body_entered(other_body):
		if other_body.is_in_group(game.GROUP_GROUNDS):
			bird.set_state(bird.GROUNDED)
		pass
		
	func _input(event):
		pass
				
	func exit():
		pass
		
		
class GroundedState:
	
	var bird
	
	func _init(bird):
		self.bird = bird
		bird.set_linear_velocity(Vector2(0,0))
		bird.set_angular_velocity(0)
		
		if bird.previous_state != HIT: audio_player.get_node("hit").play()
		pass
		
	func _update(delta):
		pass
		
	func _input(event):
		pass
				
	func exit():
		pass