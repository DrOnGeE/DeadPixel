extends Node2D



func spawn_mob():
	var new_mob = preload("res://enemy/zombie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_objects():
	var new_object = preload("res://projectiles/box.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_object.global_position = %PathFollow2D.global_position
	add_child(new_object)

func _on_timer_timeout():
		spawn_mob()
		spawn_objects()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
