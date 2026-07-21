extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@export var rotation_speed = 1.5

var rotation_direction = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	direction.y = Input.get_axis("turn_left", "turn_right") * 100
