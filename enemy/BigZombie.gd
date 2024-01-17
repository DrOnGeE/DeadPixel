extends CharacterBody2D

var health = 10

@onready var player = get_node("/root/MainLevel/Player")


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 400.0
	move_and_slide()
	look_at(player.position)
	
func take_damage():
	health -= 1
	if health == 0:
		queue_free()
	%zombieSprite.modulate = Color.RED
	await get_tree().create_timer(0.2).timeout
	%zombieSprite.modulate = Color.WHITE



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
