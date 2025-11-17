extends Node2D
var texto1 = ["Hahahaha, vocês são os exploradores 
que querem entrar na pirâmide da 
Cléopatra?"]

var texto2 = ["Nesses mais de 30 anos, já vi 
exploradores melhores que vocês."]

var texto3 = ["Enfim... dentro da pirâmide, existe a 
joia mais procurada do mundo:
Joia Idônea."]

var texto4=["TODOS os explorados querem ela.
Principalmente os melhores, como
eu."]

var texto5=["vocês, deveriam ficar longe. Vocês
não sabem o quão perigoso é."]

var texto6=["O meu filho entrou, mas não voltou..."]

var texto7=["Deve ser porque ele não é tão bom
como o pai, HAHAHAHA."]

var texto8=["Vocês me dão tédio, cansei de 
conversar com vocês. 
Boa sorte"]

var texto9=["E lembrem-se: cuidado por onde anda."]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_escrever()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _escrever():
	var frase = texto1[0]
	var frase2 = texto2[0]
	var frase3 = texto3[0]
	var frase4= texto4[0]
	var frase5= texto5[0]
	var frase6= texto6[0]
	var frase7=texto7[0]
	var frase8=texto8[0]
	var frase9=texto9[0]
	
	await get_tree().create_timer(0.5).timeout
	for i in range(frase.length()):
		$balao1.text += frase[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase2.length()):
		$balao1.text += frase2[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(2).timeout
	$balao1.text = " "
	
	for i in range(frase3.length()):
		$balao1.text += frase3[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(2).timeout
	$balao1.text = " "
	
	for i in range(frase4.length()):
		$balao1.text += frase4[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
		
	
	$Narradortriste.show()
	$Narrador.hide()
	$balao1.text = " "
	
	
	
	for i in range(frase6.length()):
		$balao1.text += frase6[i]
		await get_tree().create_timer(0.03).timeout
	
	await get_tree().create_timer(4).timeout
	$balao1.text = " "
	$Narrador.show()
	$Narradortriste.hide()
	
	for i in range(frase7.length()):
		$balao1.text += frase7[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	
	for i in range(frase8.length()):
		$balao1.text += frase8[i]
		await get_tree().create_timer(0.03).timeout
		
	await get_tree().create_timer(1).timeout
	$balao1.text = " "
	for i in range(frase9.length()):
		$balao1.text += frase9[i]
		await get_tree().create_timer(0.03).timeout
		
		
	await get_tree().create_timer(2).timeout	
	get_tree().change_scene_to_file("res://Cenas/main.tscn")
	
	
	
	
	
