extends CharacterBody2D

const SPEED = 30.0
var accel = 7
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var player: Player = $"../Player"
@onready var look_area: Area2D = $lookArea

func _physics_process(delta: float) -> void:
	var direction = Vector3()
	
	navigation_agent_2d.target_position = player.position
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, accel * delta)
	
	if look_area.hola == false:
		move_and_slide()
