extends KinematicBody2D

onready var jugador= $PanchoSprite
onready var sonidoSalto = $salto
onready var sonidoHurt = $hurt
onready var sonidoAtaque= $ataque

var velocidad = Vector2(0,0)
var salto = false
var caer = false
var hurt = false
var tiempoHurt = 0.3
var life = 3

const speed = 150
const gravedad = 30
const fuerzaSalto = -600
const caida = 1000
const laser = preload("res://Escenario/Laser/LaserJugador.tscn")



func _physics_process(delta):
	
	#Movimiento del personaje
	if Input.is_action_pressed("derecha"):
		velocidad.x = speed
		jugador.play("caminar")
		jugador.flip_h = false
	
	elif Input.is_action_pressed("izquierda"):
		velocidad.x = -speed
		jugador.play("caminar")
		jugador.flip_h = true
		
	else:
		jugador.play("quieto")
		
	#Salto del personaje
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		sonidoSalto.play()
		velocidad.y = fuerzaSalto
		salto = false
	
	if not is_on_floor():
		jugador.play("saltar")
		salto = true
	
	velocidad.y = velocidad.y + gravedad
		
		
	#Agachado del personaje
	if Input.is_action_pressed("agachar"):
		
		if caer == false:
			jugador.play("agachar")
			velocidad.x = 0
		
		if Input.is_action_just_pressed("saltar") and salto == false:
			set_collision_mask_bit(1, false)
			velocidad.y = caida
			caer = true
			
		else:
			set_collision_mask_bit(1, true)
			caer = false
		
	#Hacer que camine el personaje
	velocidad = move_and_slide(velocidad, Vector2.UP)
	velocidad.x = lerp(velocidad.x, 0, 0.1)
	_disparar()
	
#func _bounce():
	#velocidad.y = fuerzaSalto * 5

#func _reaccionDano():
	#_bounce()
	#jugador.play("daño")
	#sonidoHurt.play()
	#set_modulate(Color(1,0.17,0.17,0.35))
	#yield(get_tree().create_timer(tiempoHurt),"timeout")
	#hurt = false
	#set_modulate(Color(1.0,1.0,1.0,1.0))

func hurt():
	jugador.play("daño")
	life = life -1
	if life == 0:
		jugador.play("daño")
		yield(get_tree().create_timer(3),"timeout")
		get_tree().reload_current_scene()

#func _hurt(var posisionEnemigo):
	#hurt = true
	#life = life -1
	#if position.x < posisionEnemigo and hurt == true:
		#_reaccionDano()
		#jugador.flip_h = false
		#velocidad.x = -300
	#elif position.x > posisionEnemigo and hurt == false:
		#_reaccionDano()
		#jugador.flip_h= true
		#velocidad.x= 300
	

#func _reaccion():
	#_bounce()
	#jugador.play("daño")
	#set_modulate(Color(1,0.17,0.17,0.35))
	#yield(get_tree().create_timer(tiempoHurt), "timeout")
	#hurt = false
	#set_modulate(Color(1.0,1.0,1.0,1.0))
	

func _disparar():
	if Input.is_action_just_pressed("ataque"):
		sonidoAtaque.play()
		var direccion = 2 if not jugador.flip_h else -2
		var fuego = laser.instance()
		fuego.direccion = direccion
		get_parent().add_child(fuego)
		fuego.position.y = position.y + 3
		fuego.position.x = position.x + 20 * direccion


func _GameOver():
	get_tree().change_scene("res://Niveles/Menus/FindelJuego.tscn")
