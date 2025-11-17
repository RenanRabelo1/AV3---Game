extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal Stop

func _physics_process(delta: float) -> void:
	var direction_x = Input.get_axis("esquerda", "direita")
	var direction_y = Input.get_axis("cima", "baixo")
	
	# Reset velocity
	velocity = Vector2.ZERO
	
	# Movement logic
	if direction_x != 0 || direction_y != 0:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
		
		# Animation logic
		if direction_x > 0: # Moving right
			if direction_y < 0: # Right + Up
				$AnimatedSprite2D.play("walk_right_up")
				$AnimatedSprite2D.flip_h = false
			elif direction_y > 0: # Right + Down
				$AnimatedSprite2D.play("walk_right_down")
				$AnimatedSprite2D.flip_h = false
			else: # Only right
				$AnimatedSprite2D.play("walk_right_down")
				$AnimatedSprite2D.flip_h = false
				
		elif direction_x < 0: # Moving left
			if direction_y < 0: # Left + Up
				$AnimatedSprite2D.play("walk_right_up")
				$AnimatedSprite2D.flip_h = true
			elif direction_y > 0: # Left + Down
				$AnimatedSprite2D.play("walk_right_down")
				$AnimatedSprite2D.flip_h = true
			else: # Only left
				$AnimatedSprite2D.play("walk_right_down")
				$AnimatedSprite2D.flip_h = true
				
		else: # Only vertical movement
			if direction_y < 0: # Up
				$AnimatedSprite2D.play("walk_up")
			elif direction_y > 0: # Down
				$AnimatedSprite2D.play("walk_down")
	else:
		# Idle animation - você pode adicionar animações idle aqui
		$AnimatedSprite2D.play("idle_right_down") # Substitua pelo nome da sua animação idle

	move_and_slide()

func _die():
	queue_free()


func _on_stop() -> void:
	emit_signal("Stop")
	velocity.x = 0
	velocity.y = 0
	print("Oi")

@onready var progress_bar: ProgressBar = $ProgressBar

func take_damage():
	progress_bar.value -= 10
