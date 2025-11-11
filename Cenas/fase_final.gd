extends Node
var carol = 6
var jose = 6
var cena_flechas = preload("res://Cenas/flechas.tscn")
var pistas_esquerda_direita_y = [28, 103, -91]
var chave_prateada = 0

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
		get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")
	if jose == 0:
		get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")
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
		body.global_position = Vector2(96, 47)
		_jose_die()
		print("gol")
	if body.name == "carol":
		_carol_die()
		body.global_position = Vector2(361, 97)
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

func _on_chave_prateada_body_entered(body: Node2D) -> void:
	$PortaDesbloqueadaP.set_collision_layer_value(2, false)
	$Pergunta2/CollisionShape2D.disabled = false
	$ChavePrateada/AnimatedSprite2D.queue_free()
	$Pergunta2/AnimatedSprite2D2.show()
	$Pergunta2/Label2.show()
	$Pergunta2/AnimatedSprite2D3.show()
	
func _on_certa_2_body_entered(body: Node2D) -> void:
	$PortaChaveDourada.set_collision_layer_value(2, false)
	$Pergunta3/CollisionShape2D.disabled = false


func _on_chave_dourada_body_entered(body: Node2D) -> void:
	$PortaFinal.set_collision_layer_value(2, false)
	$ChaveDourada/AnimatedSprite2D.queue_free()
	$Pergunta2/AnimatedSprite2D2.hide()
	$Pergunta2/Label2.hide()
	$Pergunta3/Label.show()
	$Pergunta3/AnimatedSprite2D.show()
	$Pergunta3/AnimatedSprite2D2.show()
	$Pergunta2/AnimatedSprite2D3.hide()
	
func _on_certa_3_body_entered(body: Node2D) -> void:
	$PortaTesouro.set_collision_layer_value(2, false)

func _on_tesouro_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/esfinge_falando.tscn")


func _on_pergunta_1_body_entered(body: Node2D) -> void:
	$Pergunta1/Timer1.start()
	$Pergunta1/Label.show()
	$Pergunta1/AnimatedSprite2D.show()
	$Pergunta1/Timeracabar1.start()
	$Pergunta1/AnimatedSprite2D2.show()




func _on_timer_1_timeout() -> void:
	$Pergunta1/CollisionShape2D.disabled = true


func _on_timer_4_timeout() -> void:
	$Pergunta2/CollisionShape2D.disabled = true


func _on_pergunta_2_body_entered(body: Node2D) -> void:
	$Pergunta2/Timer4.start()
	$Pergunta2/Timeracabar2.start()


func _on_timeracabar_1_timeout() -> void:
	$Pergunta1/Label.hide()
	$Pergunta1/AnimatedSprite2D.hide()
	$Pergunta1/AnimatedSprite2D2.hide()


func _on_timeracabar_2_timeout() -> void:
	$Pergunta2/AnimatedSprite2D2.hide()
	$Pergunta2/Label2.hide()


func _on_pergunta_3_body_entered(body: Node2D) -> void:
	$Pergunta3/Timer6.start()
	$Pergunta3/Label.show()
	$Pergunta3/AnimatedSprite2D.show()
	$Pergunta3/Timeracabar3.start()


func _on_timer_6_timeout() -> void:
	$Pergunta3/CollisionShape2D.disabled = true
