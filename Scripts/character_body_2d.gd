extends CharacterBody2D
@export var speed = 50 # player speed
var screen_size # size of windooo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#hide()

@export var rotation_speed = 1.5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("turn_left", "turn_right")
	velocity = transform.y * Input.get_axis("forward", "backward") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	if Input.is_action_pressed("turn_right"):
		$AnimatedSprite2D.play("right")
	elif Input.is_action_pressed("turn_left"):
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("forward"):
		$AnimatedSprite2D.play("forward")
	elif Input.is_action_pressed("backward"):
		$AnimatedSprite2D.play("backwards")
	else: $AnimatedSprite2D.pause()
