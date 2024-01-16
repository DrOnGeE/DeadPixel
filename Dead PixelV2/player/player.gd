extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		%playerSprite.modulate = Color.RED
		await get_tree().create_timer(0.2).timeout
		%playerSprite.modulate = Color.WHITE
		if health <= 0.0:
			health_depleted.emit()
	
