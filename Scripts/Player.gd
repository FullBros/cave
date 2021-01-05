extends KinematicBody2D

# parameters
export var walk  = 400
export var jump  = 2200
export var gravity  = 600
export var friction = .1
export var acceleration = .25

onready var sprite = $Sprite
onready var animation = $animate

var velocity = Vector2()
var direction = 0

func _ready():
  animation.play("Idle")
  pass # Replace with function body.

func _process(delta):
  pass
  #level limit
  #position.x = clamp(position.x, 0, 640)
  #position.y = clamp(position.y, 0, 480)


# like process but frame independant
func _physics_process(_delta):
	animation.play("Idle")
	gravity = 50 if is_on_wall() else 300

	# directions
	direction = 0

	if Input.is_action_pressed("ui_left") :  direction = -1
	if Input.is_action_pressed("ui_right") : direction = 1

	if direction != 0 :
		velocity.x = lerp(velocity.x, direction * walk, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)


	sprite.flip_h = (velocity.x < 0)

	# jumps & gravity

	velocity.y = lerp(velocity.y, gravity, acceleration)

	#if is_on_floor() : velocity.y = 0

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor() or is_on_wall() :  velocity.y -= jump
		#velocity.y = -jump

	velocity = move_and_slide(velocity, Vector2.UP)

