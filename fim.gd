extends Node

var p  = 0
var conferir = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_conversa()


func _conversa():
	if Input.is_action_just_pressed("Pular")&& conferir == 0:
		$Label6.show()
		$Label5.hide()
		$Timer.start()
		print("opa")
	if Input.is_action_just_pressed("Pular") && conferir == 1:
		$Label7.show()
		$Label6.hide()
		$Timer.start()
		print("ups")
	if Input.is_action_just_pressed("Pular") && conferir >= 2:
		get_tree().change_scene_to_file("res://Cenas/tela_de_vitória.tscn")

func _on_timer_timeout() -> void:
	conferir += 1
	print("oi")
