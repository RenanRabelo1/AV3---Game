extends Node

var p  = 0
var conferir = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_conversa()


func _on_area_esfinge_texto_body_entered(body: Node2D) -> void: 
	$Ballon/AnimatedSprite2D.show()
	$Ballon/Label.show()
	$Ballon/Label4.show()
	$Timer.start()
	print("Oi")
	

func _conversa():
	if Input.is_action_just_pressed("Pular")&& conferir == 1:
		$Ballon/Label2.show()
		$Ballon/Label.hide()
		$Timer.start()
		print("opa")
	if Input.is_action_just_pressed("Pular") && conferir == 2:
		$Ballon/Label3.show()
		$Ballon/Label2.hide()
		$Timer.start()
		print("ups")
	if Input.is_action_just_pressed("Pular") && conferir >= 3:
		$entrando/CollisionShape2D.disabled = false
		$RigidBody2D2.set_collision_layer_value(1, false)


func _on_timer_timeout() -> void:
	$AreaEsfingeTexto/CollisionShape2D.disabled = true
	conferir += 1
	print("oi")


func _on_entrando_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/vidro_round_6.tscn")
