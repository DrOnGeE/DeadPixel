extends Node2D

var phase = 0
func spawn_small_mob():
	var small_mob = preload("res://enemy/smallZombie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	small_mob.global_position = %PathFollow2D.global_position
	add_child(small_mob)
	
func spawn_mob():
	var new_mob = preload("res://enemy/zombie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_big_mob():
	var big_mob = preload("res://enemy/BigZombie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	big_mob.global_position = %PathFollow2D.global_position
	add_child(big_mob)

func spawn_objects():
	var new_object = preload("res://projectiles/box.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_object.global_position = %PathFollow2D.global_position
	add_child(new_object)

func _on_timer_timeout():
	if phase == 0:
		spawn_mob()
		spawn_objects()
	if phase == 1:
		spawn_big_mob()
		spawn_objects()
	if phase == 2:
		spawn_mob()
		spawn_big_mob()
		spawn_objects()
	if phase == 3:
		spawn_mob()
		spawn_small_mob()
		spawn_objects()
	if phase >= 4:
		spawn_mob()
		spawn_small_mob()
		spawn_big_mob()
		spawn_objects()
		spawn_objects()
	


func _on_player_health_depleted():
	%GameOver.visible = true
	


func _on_next_level_timer_timeout(): 
	phase += 1
	if phase == 1:
		$Timer.set_wait_time(0.7)
	if phase == 2:
		$Timer.set_wait_time(0.3)
	if phase == 3:
		$Timer.set_wait_time(0.2)
	if phase == 4:
		$Timer.set_wait_time(0.1)

func _on_button_pressed():
	%GameOver.visible = false
	get_tree().reload_current_scene()
