extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	morrer()
	life_animated_carol()
	life_animated_jose()



func morrer():
	if $carol.progress_bar.value <= 0 || $Jose.progress_bar.value <= 0:
		file()

func file():
	get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")


func life_animated_jose():
	if $Jose.progress_bar.value == 100:
		$Jose/AnimatedSprite2D2.play("6")
	if $Jose.progress_bar.value >= 70 && $Jose.progress_bar.value < 100:
		$Jose/AnimatedSprite2D2.play("5")
	if $Jose.progress_bar.value >= 50 && $Jose.progress_bar.value < 70:
		$Jose/AnimatedSprite2D2.play("4")
	if $Jose.progress_bar.value >= 30 && $Jose.progress_bar.value < 50:
		$Jose/AnimatedSprite2D2.play("3")
	if $Jose.progress_bar.value >= 10 && $Jose.progress_bar.value < 30:
		$Jose/AnimatedSprite2D2.play("2")
	if $Jose.progress_bar.value >= 1 && $Jose.progress_bar.value < 10:
		$Jose/AnimatedSprite2D2.play("1")

func life_animated_carol():
	if $carol.progress_bar.value == 100:
		$carol/AnimatedSprite2D2.play("6")
	if $carol.progress_bar.value >= 70 && $carol.progress_bar.value < 100:
		$carol/AnimatedSprite2D2.play("5")
	if $carol.progress_bar.value >= 50 && $carol.progress_bar.value < 70:
		$carol/AnimatedSprite2D2.play("4")
	if $carol.progress_bar.value >= 30 && $carol.progress_bar.value < 50:
		$carol/AnimatedSprite2D2.play("3")
	if $carol.progress_bar.value >= 10 && $carol.progress_bar.value < 30:
		$carol/AnimatedSprite2D2.play("2")
	if $carol.progress_bar.value >= 1 && $carol.progress_bar.value < 10:
		$carol/AnimatedSprite2D2.play("1")



func _on_area_2d_body_entered(body: Node2D) -> void:
	$Label.hide()
	$Label4.hide()
	$Label2.hide()
	$Label3.hide()
	$Label2/Timer.start()
	print("Olá")


func _on_timer_timeout() -> void:
	$Label2/Area2D/CollisionShape2D.disabled = true
	$Label/Area2D/CollisionShape2D.disabled = true
	$Label4/Area2D/CollisionShape2D.disabled = true
	$Label3/Area2D/CollisionShape2D.disabled = true
	$Label8.show()
	$Label7.show()
	$Label6.show()
	$Label5.show()
	$Label7/Area2D.set_collision_mask_value(1, true)

func _on_area_2d2_body_entered(body: Node2D) -> void:
	$Label8.hide()
	$Label7.hide()
	$Label6.hide()
	$Label5.hide()
	get_tree().change_scene_to_file("res://Cenas/end.tscn")
	



func _on_area_2d8_body_entered(body: Node2D) -> void:
	body.take_damage()


func _on_area_2d6_body_entered(body: Node2D) -> void:
	body.take_damage()

func _on_area_2d5_body_entered(body: Node2D) -> void:
	body.take_damage()



func _on_area_2d3_body_entered(body: Node2D) -> void:
	body.take_damage()



func _on_area_2d4_body_entered(body: Node2D) -> void:
	body.take_damage()


func _on_area_2d1_body_entered(body: Node2D) -> void:
	body.take_damage()


func _on_timer2_timeout() -> void:
	$AnimatedSprite2D.hide()
	$Back.hide()
	$Label9.hide()
