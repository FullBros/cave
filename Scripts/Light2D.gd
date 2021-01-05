extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time += delta
	var variance = sin(time*20)
	self.energy = .7 + variance/10
	#self.energy = 1
	pass
