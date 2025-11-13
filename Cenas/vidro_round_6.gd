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
var impedir_j=0
var impedir_c=0
var passar=0
var falha=0
var tempo0 = 0
var falha2=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jose = get_node_or_null("Jose")
	carol = get_node_or_null("carol")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if not lava:
		tempo0 += delta
		
		if tempo >= 25 and tempo <= 31:
			$alerta.show()
		else:
			$alerta.hide()
	else:
		$alerta.hide()

	_derrota()
	_DanoLava()
	
	if passar>=1:
		get_tree().change_scene_to_file("res://Cenas/esfinge_falando - Copia (3).tscn")
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
		
		
		$round2.show()
		
	if entrou_c==2 && entrou_j==2:
		
		$round2.hide()
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
				$hud_vidro/ponto.text=str("1")
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
				$hud_vidro/ponto.text=str("2")
				passar+=1
			
				
				
				
			else:
		
				$hud_vidro/num1.text=str("ERRADO")
				$hud_vidro/num2.hide()
				$hud_vidro/num3.hide()
				$hud_vidro/op1.hide()
				$hud_vidro/op2.hide()
				falha=1
				
		if (hud2>=3):
			if (soma1_c==40 && repete_c<1):
				$hud_carol/num1.text=str("X")
				$hud_carol/num2.text=str("X")
				$hud_carol/num3.text=str("X")
				$hud_carol/op1.text=str("+")
				$hud_carol/op2.text=str("+")
				$hud_carol/ponto.text=str("1")
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
				$hud_carol/ponto.text=str("2")
				passar+=1
			
			# 10 + 13 + 17
			# 8 + 15 + 17
				
				
				
			else:
		
				$hud_carol/num1.text=str("ERRADO")
				$hud_carol/num2.hide()
				$hud_carol/num3.hide()
				$hud_carol/op1.hide()
				$hud_carol/op2.hide()
				falha2=1
			
			
			
		
					
					
			
				
		
		
	
		
		

	


func _on_piso_body_entered(body: Node2D) -> void:
	if body.name=="carol":
		if round_c==1 && body.has_method("_die"):
			body._die()
			
			
		if round_c==2:
			entrou_c=2
			$carol/Label2.hide()
			$impedir_carol/c_c.call_deferred("set_disabled", true)
			
			
		
			
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
			$impedir_carol/c_c.call_deferred("set_disabled", true)
		
			
			
			
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
			$impedir_jose/CollisionShape2D.call_deferred("set_disabled", true)
			
			
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
				$impedir_jose/CollisionShape2D.call_deferred("set_disabled", true)
				


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
		$Timer.wait_time = 35.0
		$lava6.hide()
		$lava5.hide()
		$lava.hide()
		$lava2.hide()
		$lava3.hide()
		$lava4.hide()
		$lava/CollisionS
		$lava/CollisionShape2D.disabled = true
		$alerta.hide()
		
		lava = false
		virou = 0
		tempo = 0
		$hudTempo/Label.text = str(tempo)
		

		
	else:
		$lava.show()
		$lava2.show()
		$lava3.show()
		$lava4.show()
		$lava5.show()
		$lava6.show()
		$lava/CollisionShape2D.disabled = false
		$Timer.wait_time = 5.0
		lava = true
		virou = 1
		$hudTempo/Label.text = "CUIDADO"
		
	$Timer.start()

		

	
		
	
func _on_piso_lava_body_entered(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=true
		print("entrei")
		
		
	if body.name=="carol":
		salvo_c=true
		
var dentro_c=0
var dentro_j=0

func _on_piso_lava_2_body_entered(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=true
		
		
	if body.name=="carol":
		salvo_c=true
		
		


func _on_piso_lava_2_body_exited(body: Node2D) -> void:
	if body.name=="Jose" :
		salvo_j=false
		
		
	if body.name=="carol" :
		salvo_c=false
		


func _on_piso_lava_body_exited(body: Node2D) -> void:
	if body.name=="Jose":
		salvo_j=false
		
	if body.name=="carol":
		salvo_c=false
		
		
		
func _DanoLava():
	if virou == 1:
		if jose and not salvo_j:
			get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")
		
		elif carol and not salvo_c:
			get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")

func _on_timer_hud_timeout() -> void:
	if virou == 0:
		tempo += 1
		$hudTempo/Label.text = str("Tempo restante: ", 35 - tempo)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entrou")	
	$Node2D3.hide()
	
	if body.name=="Jose":
		round_j+=1
		if round_j==1:
			$Jose/Label.show()
			$impedir_jose/CollisionShape2D.call_deferred("set_disabled", false)
			
		
		
		if round_j==2:
			$Jose/Label2.show()
			$impedir_jose/CollisionShape2D.call_deferred("set_disabled", false)
			
		if round_j==3:
			$Jose/Label3.show()
			$impedir_jose/CollisionShape2D.call_deferred("set_disabled", false)
			
		
	if body.name=="carol":
		round_c+=1
			
		if round_c==1:
			$carol/Label.show()
			$impedir_carol/c_c.call_deferred("set_disabled", false)
	
		
		if round_c==2:
			$carol/Label2.show()
			$impedir_carol/c_c.call_deferred("set_disabled", false)
		if round_c==3:
			$carol/Label3.show()
			$impedir_carol/c_c.call_deferred("set_disabled", false)
			
	if round_j==1 && round_c==1:
		$Node2D4.show()
		
	elif round_j==2 && round_c==2:
		$Node2D4.hide()
		
	elif round_j==3 && round_c==3:
		$Node.show()
func _derrota():
		if !jose || !carol:
			get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")
			
		elif falha==1 && falha2==1:
			get_tree().change_scene_to_file("res://Cenas/TelaDeDerrota.tscn")


func _on_aviso_timeout() -> void:
	pass
