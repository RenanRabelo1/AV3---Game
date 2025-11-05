extends Node
var cena_flechas = preload("res://Cenas/flechas.tscn")
var pistas_esquerda_direita_y = [28, 103, -91]

# Pistas para carros da DIREITA → ESQUERDA  
var pistas_direita_esquerda_y = [160, 216, 324, 384, 438, 544, 600]

var pistas_cima_x = [200, 400, 600, 800, 1000]  # Ajustei para valores X mais realistas

var pistas_baixo_x = [200, 400, 600, 800, 1000]  # Ajustei para valores X mais realistas

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



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
	flechas.position = Vector2(pista_x, -100)  # Começa de cima (fora da tela)
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


func _on_button_pressed() -> void:
	$Timer.start()
	await $Timer.timeout
	$Timer2.start()
	await $Timer2.timeout
	$TimerBaixo.start()
	await $TimerBaixo.timeout
	$TimerCima.start()
