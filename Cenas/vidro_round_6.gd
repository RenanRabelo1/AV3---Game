extends Node
var round_c=0
var round_j=0
var entrou_c=0
var entrou_j=0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entrou_c==1 && entrou_j==1:
		$round1_.hide()
		$round1_2.hide()
		$round1_3.hide()
		$round1_4.hide()
		$Jose/Label.hide()
		$carol/Label.hide()
		
		
		$round2/round2_.show()
		$round2/round2_4.show()
		$round2/round2_2.show()
		$round2/round2_3.show()
		
		
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area == $Jose/Area2D:
		$Jose/Label.show()
		round_j+=1
		
		if round_j==2:
			$Jose/Label2.show()
		
	if area == $carol/Area2D:
		$carol/Label.show()
		round_c+=1
		
		if round_c==2:
			$carol/Label2.show()
		


func _on_piso_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1 && body.has_method("_die"):
			body._die()
			
		if round_c==2:
			entrou_c=2
			$carol/Label2.hide()
			
		
			
	if body.name=="Jose":
		if round_j==1 && body.has_method("_die"):
			body._die()
			
		if round_j==2 && body.has_method("_die"):
			body._die()
		
		
		
func _on_piso_2_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1:
			$carol/Label.hide()
			entrou_c=1
			print("carol")
			print(entrou_c)
			
			
			
		if round_c==2 && body.has_method("_die"):
			body._die()
			
	if body.name=="Jose":
		if round_j==1 && body.has_method("_die"):
			body._die()
			
		if round_j==2 && body.has_method("_die"):
			body._die()


func _on_piso_3_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1 && body.has_method("_die"):
			body._die()
			
		if round_c==2 && body.has_method("_die"):
			body._die()
			
	if body.name=="Jose":
		if round_j==1:
			$Jose/Label.hide()
			entrou_j=1
			print(entrou_j)
			
			
		if round_j==2 && body.has_method("_die"):
			body._die()


func _on_piso_4_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1:
			$carol/Label.hide()
			
			
		if round_c==1 && body.has_method("_die"):
			body._die()
			
			
	if body.name=="Jose":
		if round_j==1 && body.has_method("_die"):
			body._die()
			
		if round_j==2:
				$Jose/Label2.hide()
