extends Node2D
var texto1 = [ "Surpresos em me verem? "]
var texto2= ["Que caras são essas?
Não esperavam minha
presença aqui?"]

var texto3=["Sabe de uma coisa...
Eu sempre gosto de atrair
exploradores curiosos para
a pirâmide."]

var texto4=["A coragem de entrar em um lugar
perigoso e desconhecido é 
precioso... tão precioso como a 
Joia Idônea."]

var texto5=["Por isso, eu transformo todos esses
exploradores em tesouro, no 
meu tesouro."]

var texto6=["Eu não sou o Demétrio..."]

var texto7=["EU SOU CLEÓPATRA."]

var texto8=["Demétrio foi o segundo explorador
a entrar.

Ele estava em busca do filho."]

var texto9=["Os dois viraram tesouro.
E agora, vocês dois vão virar tesouro."]

var texto10=["BEM-VINDOS AO FINAL.
"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_escrever()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _escrever():
	var frase=texto1[0]
	var frase2=texto2[0]
	var frase3=texto3[0]
	var frase4=texto4[0]
	var frase5=texto5[0]
	var frase6=texto6[0]
	var frase7=texto7[0]
	var frase8=texto8[0]
	var frase9=texto9[0]
	var frase10=texto10[0]
	await get_tree().create_timer(0.5).timeout
	for i in range(frase.length()):
		$balao1.text += frase[i]
		await get_tree().create_timer(0.03).timeout
	
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase2.length()):
		$balao1.text += frase2[i]
		await get_tree().create_timer(0.03).timeout

	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase3.length()):
		$balao1.text += frase3[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase4.length()):
		$balao1.text += frase4[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase5.length()):
		$balao1.text += frase5[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase6.length()):
		$balao1.text += frase6[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(3).timeout
	$balao1.text = " "
	$Narrador2.hide()
	$AnimatedSprite2D.show()
	$Label3.text=" Cleópatra "
	$Label4.text= " Rainha da pirâmide "
	
	for i in range(frase7.length()):
		$balao1.text += frase7[i]
		await get_tree().create_timer(0.03).timeout
		
		
	await get_tree().create_timer(3).timeout
	$balao1.text = " "
	
	for i in range(frase8.length()):
		$balao1.text += frase8[i]
		await get_tree().create_timer(0.03).timeout
		
		
	await get_tree().create_timer(3).timeout
	$balao1.text = " "
	
	for i in range(frase9.length()):
		$balao1.text += frase9[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase10.length()):
		$balao1.text += frase10[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Cenas/boss_egito.tscn")
		
	
	
	
		
	
		
		
		
		
		
	
	
