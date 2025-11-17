extends Node
var jose = 6
var carol = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	life_animated_carol()
	life_animated_jose()
	morrer()


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


func _on_errada_body_entered(body: Node2D) -> void:
	if body.name == "Jose":
		_jose_die()
		body.global_position.x -= 150
		print("gol")
	if body.name == "carol":
		_carol_die()
		body.global_position.x -= 150
		print("gol")




func morrer():
	if carol == 0:
		get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")
	if jose == 0:
		get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Jose":
		jose = 0
	if body.name == "carol":
		carol = 0



func _on_fim_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/boss_egito.tscn")


func _on_pergunta_body_entered(body: Node2D) -> void:
	$Label.show()
	$AnimatedSprite2D.show()
	$Back.show()
	$Label2.show()
	$Label3.show()
	$Label4.show()
	$Label5.show()
	$Label6.show()
	$Label7.show()
	
	


func _on_porta_certa_1_body_entered(body: Node2D) -> void:
	$"Props+door3".hide()


func _on_porta_certa_2_body_entered(body: Node2D) -> void:
	$"Props+door4".hide()


func _on_porta_certa_3_body_entered(body: Node2D) -> void:
	$"Props+door6".hide()
