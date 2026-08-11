extends Area2D

var speed = 250
func _ready() -> void:
	await get_tree().create_timer(.7).timeout
	queue_free()
	#create animation for fizzle out and play it after a timer then dissapear

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("mobs"):
		#explosion animaton ? Instantiate explosition
		body.queue_free()
	
	queue_free()
