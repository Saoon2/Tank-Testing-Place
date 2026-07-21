extends Node2D
@export var rotation_speed = 1
var rotation_direction = 0
var recharge = 1
@export var laser_scene : PackedScene
#gun turnin
func get_input():
	rotation_direction = Input.get_axis("gun_left", "gun_right")
	
func shoot():
	var b = laser_scene.instantiate()
	owner. owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _physics_process(delta):
	get_input()
	if rotation >= PI/6  && rotation_direction != 0:
		rotation = PI/6
		$RotationLimitSFX.play()
	if rotation <= -PI/6 && rotation_direction != 0:
		rotation = -PI/6
		$RotationLimitSFX.play()
	rotation += rotation_direction * rotation_speed * delta
	
	
	if Input.is_action_just_pressed("shoot") && recharge == 1:
		$ShootSFX.play()
		$Laser.play("firing")
		recharge = 0 	
		$Timer.start()
		shoot()
		
		
func _on_timer_timeout() -> void:
	recharge = 1 
#shoot
#new asset 4 tank
#limit turn buzzing sound to not overlap or change it
#screen shake on shoot
#camera settins?!
#tank scaled up
