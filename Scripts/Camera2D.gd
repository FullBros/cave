extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var Max_Shake = 3 
export var Max_Rotation = 2

var trauma = 0.0
var shake  = 0.0
var time = 0

var offsetPosition = 0
var offsetRotation = 0


var noise = OpenSimplexNoise.new()




# Called when the node enters the scene tree for the first time.
func _ready():
	
	noise.octaves = 1
	noise.period = .01
	noise.persistence = 0.8
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	time += delta

	if Input.is_action_pressed("ui_down") :  
		trauma = clamp (trauma + .1, 0, 1)

	if (trauma > 0) :
		shake = trauma * trauma
		trauma = clamp(trauma - .01, 0, 1) # reduce trauma over time	
		
	
	
	print(shake)
	
	noise.seed = 1
	var h = noise.get_noise_1d(time)
	
	noise.seed = 2
	var v = noise.get_noise_1d(time)

	set_offset(Vector2(
		h * Max_Shake * shake,
		v * Max_Shake * shake
	))
	
	
	noise.seed = 3
	var perlin = noise.get_noise_1d(time)
	rotation_degrees = Max_Rotation * shake * perlin
	

	pass
