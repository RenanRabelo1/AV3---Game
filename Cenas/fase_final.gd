extends Node
var carol = 6
var jose = 6
var cena_flechas = preload("res://Cenas/flechas.tscn")
var pistas_esquerda_direita_y = [28, 103, -91]

# Pistas para carros da DIREITA → ESQUERDA  
var pistas_direita_esquerda_y = [160, 216, 324, 384, 438, 544, 600]

var pistas_cima_x = [200, 400, 600, 800, 1000]  # Ajustei para valores X mais realistas

var pistas_baixo_x = [200, 400, 600, 800, 1000]  # Ajustei para valores X mais realistas

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	morrer()
	life_animated_carol()
	life_animated_jose()



func _on_timer_timeout() -> void:
	var flechas = cena_flechas.instantiate()
	add_child(flechas)
	var pista_y = pistas_esquerda_direita_y[randi_range(0, pistas_esquerda_direita_y.size() - 1)]
	flechas.position = Vector2(-400, pista_y)
	flechas.set_linear_velocity(Vector2(randf_range(900.0, 920.0), 0))
	flechas.set_linear_damp(0.0)

func _on_timer_2_timeout() -> void:
	var flechas = cena_flechas.instantiate()
	add_child(flechas)
	var pista_y = pistas_direita_esquerda_y[randi_range(0, pistas_direita_esquerda_y.size() - 1)]
	flechas.position = Vector2(1530, pista_y)
	flechas.set_linear_velocity(Vector2(randf_range(-900.0, -920.0), 0))
	flechas.set_linear_damp(0.0)
	flechas.scale.x = -1


func _on_timer_baixo_timeout() -> void:
	var flechas = cena_flechas.instantiate()
	add_child(flechas)
	var pista_x = pistas_baixo_x[randi_range(0, pistas_baixo_x.size() - 1)]
	flechas.position = Vector2(pista_x, -1000)  # Começa de cima (fora da tela)
	flechas.set_linear_velocity(Vector2(0, randf_range(900.0, 920.0)))  # Velocidade positiva para ir de cima para baixo
	flechas.set_linear_damp(0.0)
	# Rotaciona 90 graus para baixo (sentido correto)
	flechas.rotation_degrees = 90


func _on_timer_cima_timeout() -> void:
	var flechas = cena_flechas.instantiate()
	add_child(flechas)
	var pista_x = pistas_cima_x[randi_range(0, pistas_cima_x.size() - 1)]
	flechas.position = Vector2(pista_x, 1000)  # Começa de baixo (fora da tela - ajuste conforme altura da tela)
	flechas.set_linear_velocity(Vector2(0, randf_range(-900.0, -920.0)))  # Velocidade negativa para ir de baixo para cima
	flechas.set_linear_damp(0.0)
	# Rotaciona 270 graus para cima (sentido correto)
	flechas.rotation_degrees = 270






func morrer():
	if carol == 0:
		$carol.queue_free()
	if jose == 0:
		$Jose.queue_free()
func life_animated_jose():
	if jose == 6:
		$Jose/AnimatedSprite2D2.play("6")
	if jose == 5:
		$Jose/AnimatedSprite2D2.play("5")
	if jose == 4:
		$Jose/AnimatedSprite2D2.play("4")
	if jose == 3:
		$Jose/AnimatedSprite2D2.play("3")
	if jose == 2:
		$Jose/AnimatedSprite2D2.play("2")
	if jose == 1:
		$Jose/AnimatedSprite2D2.play("1")

func life_animated_carol():
	if carol == 6:
		$carol/AnimatedSprite2D2.play("6")
	if carol == 5:
		$carol/AnimatedSprite2D2.play("5")
	if carol == 4:
		$carol/AnimatedSprite2D2.play("4")
	if carol == 3:
		$carol/AnimatedSprite2D2.play("3")
	if carol == 2:
		$carol/AnimatedSprite2D2.play("2")
	if carol == 1:
		$carol/AnimatedSprite2D2.play("1")

func _carol_die():
	carol -= 1
func _jose_die():
	jose -= 1


func _on_certa_body_entered(body: Node2D) -> void:
	$PortaChavePrateada.set_collision_layer_value(2, false)  


func _on_errada_body_entered(body: Node2D) -> void:
	if body.name == "Jose":
		_jose_die()
		body.global_position.y += 150
		print("gol")
	if body.name == "carol":
		_carol_die()
		body.global_position.y += 150
		print("gol")
	
	$Timer.start()
	await $Timer.timeout
	$Timer2.start()
	await $Timer2.timeout
	$TimerBaixo.start()
	await $TimerBaixo.timeout
	$TimerCima.start()

func _on_flechas_body_entered(body: Node) -> void:
	if body.name == "carol":
		_carol_die()
	if body.name == "Jose":
		_jose_die()
