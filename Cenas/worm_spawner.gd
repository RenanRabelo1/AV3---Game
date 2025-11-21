extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var carol = owner.get_parent().find_child("carol")
@onready var jose = owner.get_parent().find_child("Jose")
@export var mini_worm_node : PackedScene

func _on_timer_timeout() -> void:
	spawnc()
	spawnj()

func spawnc():
	var mini_worm = mini_worm_node.instantiate()
	# Ajuste fino com offset (experimente com valores diferentes)
	var offset = Vector2(15, 100)  # 10 pixels para direita, 5 para baixo
	mini_worm.global_position = carol.global_position + offset
	get_tree().current_scene.call_deferred("add_child", mini_worm)

func spawnj():
	var mini_worm = mini_worm_node.instantiate()
	var offset1 = Vector2(250, 160)
	mini_worm.global_position = jose.global_position + offset1
	get_tree().current_scene.call_deferred("add_child", mini_worm)
