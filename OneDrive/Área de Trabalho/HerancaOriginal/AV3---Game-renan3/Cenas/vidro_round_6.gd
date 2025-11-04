extends Node
var round_c=0
var round_j=0
var entrou_c=0
var entrou_j=0
var bug_c=0
var bug_j=0
var soma1_j=0
var soma1_c=0
var hud1=0
var hud2=0
var round3_j=0
var round3_c=0
var nome_j="0"
var repete=0
var repete_c=0
var nome_c="0"
var virou = 0
var jose
var carol
var salvo_c = false
var salvo_j = false
var tempo=0
var parou = 0
var lava = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jose = get_node_or_null("Jose")
	carol = get_node_or_null("carol")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	

	
	_DanoLava()
	if entrou_c==0 && entrou_j==0:
		$piso6/CollisionShape2D.disabled = true
		$piso7/CollisionShape2D.disabled = true
		$piso8/CollisionShape2D.disabled = true
		$piso9/CollisionShape2D.disabled = true
		$piso10/CollisionShape2D.disabled = true
		$piso11/CollisionShape2D.disabled = true
		$hud_vidro.hide()
		$hud_carol.hide()
	
	if entrou_c==1 && entrou_j==1:
		$round1_.hide()
		$round1_2.hide()
		$round1_3.hide()
		$round1_4.hide()
		if (bug_j<1):
			$Jose/Label.hide()
			
		if (bug_c<1):
			$carol/Label.hide()
		
		
		$round2/round2_.show()
		$round2/round2_4.show()
		$round2/round2_2.show()
		$round2/round2_3.show()
		
	if entrou_c==2 && entrou_j==2:
		
		$round2/round2_.hide()
		$round2/round2_4.hide()
		$round2/round2_2.hide()
		$round2/round2_3.hide()
		$Jose/Label2.hide()
		$carol/Label2.hide()
		
		
		$piso.hide()
		$piso2.hide()
		$piso3.hide()
		$piso4.hide()
		
		$piso6.show()
		$piso7.show()
		$piso8.show()
		$piso9.show()
		$piso10.show()
		$piso11.show()
		
		$piso/CollisionShape2D.disabled = true
		$piso2/CollisionShape2D.disabled = true
		$piso3/CollisionShape2D.disabled = true
		$piso4/CollisionShape2D.disabled = true
		
		
		
		$round3.show()
		$hud_vidro.show()
		$hud_carol.show()
		
		$piso6/CollisionShape2D.disabled = false
		$piso7/CollisionShape2D.disabled = false
		$piso8/CollisionShape2D.disabled = false
		$piso9/CollisionShape2D.disabled = false
		$piso10/CollisionShape2D.disabled = false
		$piso11/CollisionShape2D.disabled = false
		
		if (hud1>=3):
			if (soma1_j==35 && repete<1):
				$hud_vidro/num1.text=str("X")
				$hud_vidro/num2.text=str("X")
				$hud_vidro/num3.text=str("X")
				$hud_vidro/op1.text=str("+")
				$hud_vidro/op2.text=str("+")
				repete+=1
				soma1_j=0
				hud1=0
				print(repete)
				round3_j=0
				
			elif (soma1_j==35 && repete==1):
				$hud_vidro/num1.text=str("ACERTOU")
				$hud_vidro/num2.hide()
				$hud_vidro/num3.hide()
				$hud_vidro/op1.hide()
				$hud_vidro/op2.hide()
			
				
				
				
			else:
		
				$hud_vidro/num1.text=str(soma1_j)
				$hud_vidro/num2.hide()
				$hud_vidro/num3.hide()
				$hud_vidro/op1.hide()
				$hud_vidro/op2.hide()
				
		if (hud2>=3):
			if (soma1_c==40 && repete_c<1):
				$hud_carol/num1.text=str("X")
				$hud_carol/num2.text=str("X")
				$hud_carol/num3.text=str("X")
				$hud_carol/op1.text=str("+")
				$hud_carol/op2.text=str("+")
				repete_c+=1
				soma1_c=0
				hud2=0
				print(repete_c)
				round3_c=0
				
			elif (soma1_c==40 && repete_c==1):
				$hud_carol/num1.text=str("ACERTOU")
				$hud_carol/num2.hide()
				$hud_carol/num3.hide()
				$hud_carol/op1.hide()
				$hud_carol/op2.hide()
			
			# 10 + 13 + 17
			# 8 + 15 + 17
				
				
				
			else:
		
				$hud_carol/num1.text=str(soma1_c)
				$hud_carol/num2.hide()
				$hud_carol/num3.hide()
				$hud_carol/op1.hide()
				$hud_carol/op2.hide()
				
			
			
			
		
					
					
			
				
		
		
	
		
		
func _on_area_2d_area_entered(area: Area2D) -> void:
	
	
	if area == $Jose/Area2D:
		round_j+=1
		if round_j==1:
			$Jose/Label.show()
		
		
		if round_j==2:
			$Jose/Label2.show()
			
		if round_j==3:
			$Jose/Label3.show()
			
		
	if area == $carol/Area2D:
		round_c+=1
			
		if round_c==1:
			$carol/Label.show()
	
		
		if round_c==2:
			$carol/Label2.show()
			
		if round_c==3:
			$carol/Label3.show()
		


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
			bug_c=1
		
			
			
			
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
			bug_j=1;
			
			
		if round_j==2 && body.has_method("_die"):
			body._die()


func _on_piso_4_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1 && body.has_method("_die"):
			body._die()
			
			
			
		if round_c==2 && body.has_method("_die"):
			body._die()
			
			
	if body.name=="Jose":
		if round_j==1 && body.has_method("_die"):
			body._die()
			
		if round_j==2:
				$Jose/Label2.hide()
				entrou_j=2;
				


func _on_piso_8_body_entered(body: Node2D) -> void:
	
	if body.name=="Jose":
		var limite=0
		if round_j==3:
			
			nome_j="10"
			limite=+1
			print("entrou")
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=10
				hud1+=1
				
				
				
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=10
				hud1+=1
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=10
				hud1+=1
			
				
	if body.name=="carol":
				
			if round_c==3:
				var limite=0
				limite+=1
		
				nome_c="10"
				
				round3_c+=1 
				
				if limite==1 && round3_c==1:
					$hud_carol/num1.text=str(nome_c)
					soma1_c+=10
					hud2+=1
					
				if limite==1 && round3_c==2:
					$hud_carol/num2.text=str(nome_c)
					soma1_c+=10
					hud2+=1
					
				if limite==1 && round3_c==3:
					$hud_carol/num3.text=str(nome_c)
					soma1_c+=10
					hud2+=1
					
		
		
	
	


func _on_piso_9_body_entered(body: Node2D) -> void:

	if body.name=="Jose":
		var limite=0
		if round_j==3:
			
			limite+=1
			print("entrou 2")
			nome_j="15"
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=15
				hud1+=1
				
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=15
				hud1+=1
				
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=15
				hud1+=1
				
	if body.name=="carol":
				
			if round_c==3:
				var limite=0
				limite+=1
		
				nome_c="15"
				
				round3_c+=1 
				
				if limite==1 && round3_c==1:
					$hud_carol/num1.text=str(nome_c)
					soma1_c+=15
					hud2+=1
					
				if limite==1 && round3_c==2:
					$hud_carol/num2.text=str(nome_c)
					soma1_c+=15
					hud2+=1
					
				if limite==1 && round3_c==3:
					$hud_carol/num3.text=str(nome_c)
					soma1_c+=15
					hud2+=1
					
				
				


func _on_button_pressed() -> void:
	round_j+=1
	round_c+=1
	entrou_c+=1
	entrou_j+=1


func _on_piso_6_body_entered(body: Node2D) -> void:
	
	
	if body.name=="Jose":
		var limite=0
		
		if round_j==3:
			
			limite+=1
			print("entrou 2")
			nome_j="13"
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=13
				hud1+=1
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=13
				hud1+=1
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=13
				hud1+=1
				
	if body.name=="carol":
				
			if round_c==3:
				var limite=0
				limite+=1
		
				nome_c="13"
				
				round3_c+=1 
				
				if limite==1 && round3_c==1:
					$hud_carol/num1.text=str(nome_c)
					soma1_c+=13
					hud2+=1
					
				if limite==1 && round3_c==2:
					$hud_carol/num2.text=str(nome_c)
					soma1_c+=13
					hud2+=1
					
				if limite==1 && round3_c==3:
					$hud_carol/num3.text=str(nome_c)
					soma1_c+=13
					hud2+=1
					
				
				


func _on_piso_7_body_entered(body: Node2D) -> void:
	
	
	if body.name=="Jose":
		var limite=0
		if round_j==3:
			
			limite+=1
			print("entrou 2")
			nome_j="12"
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=12
				hud1+=1
				
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=12
				hud1+=1
				
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=12
				hud1+=1
				
	if body.name=="carol":
		var limite=0
		if round_c==3:
			
			limite+=1
	
			nome_c="12"
			
			round3_c+=1 
			
			if limite==1 && round3_c==1:
				$hud_carol/num1.text=str(nome_c)
				soma1_c+=12
				hud2+=1
				
			if limite==1 && round3_c==2:
				$hud_carol/num2.text=str(nome_c)
				soma1_c+=12
				hud2+=1
				
			if limite==1 && round3_c==3:
				$hud_carol/num3.text=str(nome_c)
				soma1_c+=12
				hud2+=1


func _on_piso_10_body_entered(body: Node2D) -> void:

	
	if body.name=="Jose":
		var limite=0
		if round_j==3:
			
			limite+=1
			print("entrou 2")
			nome_j="8"
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=8
				hud1+=1
				
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=8
				hud1+=1
				
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=8
				hud1+=1
				
				
						
	if body.name=="carol":
		var limite=0
		if round_c==3:
			
			limite+=1
	
			nome_c="8"
			
			round3_c+=1 
			
			if limite==1 && round3_c==1:
				$hud_carol/num1.text=str(nome_c)
				soma1_c+=8
				hud2+=1
				
			if limite==1 && round3_c==2:
				$hud_carol/num2.text=str(nome_c)
				soma1_c+=8
				hud2+=1
				
			if limite==1 && round3_c==3:
				$hud_carol/num3.text=str(nome_c)
				soma1_c+=8
				hud2+=1



func _on_piso_11_body_entered(body: Node2D) -> void:
	

	if body.name=="Jose":
		var limite=0
		if round_j==3:
			
			limite+=1
			print("entrou 2")
			nome_j="17"
			
			round3_j+=1 
			
			if limite==1 && round3_j==1:
				$hud_vidro/num1.text=str(nome_j)
				soma1_j+=17
				hud1+=1
				
			if limite==1 && round3_j==2:
				$hud_vidro/num2.text=str(nome_j)
				soma1_j+=17
				hud1+=1
				
			if limite==1 && round3_j==3:
				$hud_vidro/num3.text=str(nome_j)
				soma1_j+=17
				hud1+=1
				
	if body.name=="carol":
		var limite=0
		if round_c==3:
			
			limite+=1
	
			nome_c="17"
			
			round3_c+=1 
			
			if limite==1 && round3_c==1:
				$hud_carol/num1.text=str(nome_c)
				soma1_c+=17
				hud2+=1
				
			if limite==1 && round3_c==2:
				$hud_carol/num2.text=str(nome_c)
				soma1_c+=17
				hud2+=1
				
			if limite==1 && round3_c==3:
				$hud_carol/num3.text=str(nome_c)
				soma1_c+=17
				hud2+=1


func _on_button_2_pressed() -> void:
	get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	
	
	if lava:
		
		$lava.hide()
		$lava/CollisionShape2D.disabled = true
		$Timer.wait_time = 5.0
		
		lava = false
		virou=0
		
		tempo=0
		$hudTempo/Label.text = str(tempo)
		
	else:
	
		$lava.show()
		$lava/CollisionShape2D.disabled = false
		$Timer.wait_time = 5.0
		
		lava = true
		virou = 1
		
		$hudTempo/Label.text = str("CUIDADO")
		
		

	$Timer.start()  

		

	
		
	
func _on_piso_lava_body_entered(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=true
		print("entrei")
		
		
	if body.name=="carol":
		salvo_c=true
		


func _on_piso_lava_2_body_entered(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=true
		
	if body.name=="carol":
		salvo_c=true
		


func _on_piso_lava_2_body_exited(body: Node2D) -> void:
	if body.name=="Jose" && virou==1:
		salvo_j=false
		
	if body.name=="carol":
		salvo_c=false
		


func _on_piso_lava_body_exited(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=false
		
	if body.name=="carol":
		salvo_c=false
		
		
		
func _DanoLava():
	if virou == 1:
		

		if jose and not salvo_j:
			jose.queue_free()
		
		if carol and not salvo_c:
			carol.queue_free()

	
	
		


func _on_timer_hud_timeout() -> void:
	if virou == 0:
		tempo += 1
		$hudTempo/Label.text = str(tempo)
