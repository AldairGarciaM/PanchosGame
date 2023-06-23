extends KinematicBody2D

onready var enemigo = $AnimatedSprite
onready var sonido = $alienSonido
onready var suelo = $RayCast2D
onready var zona1= $zona1
onready var zona2= $zona2

export var direccion = -1


var velocidad = Vector2()
var speed = 50
var tiempoMuerte = 0.3
var heridas = 0

const fuerzaCaida = 20
const fuerzaMovimiento = 30
const laser = preload ("res://Escenario/Laser/LaserJugador.tscn")


func _ready():
	if direccion == 1:
		enemigo.flip_h = false
	else:
		enemigo.flip_h = true
	
	
	
func _physics_process(delta):
	if is_on_wall() or not suelo.is_colliding() and is_on_floor():
		direccion = direccion * -1
		enemigo.flip_h = not enemigo.flip_h
		
	velocidad.y += fuerzaCaida
	velocidad.x = speed * direccion
	velocidad = move_and_slide(velocidad, Vector2.UP)


func _on_zona1_body_entered(area):
	enemigo.play("hurt")
	sonido.play()
	yield(get_tree().create_timer(.5),"timeout")
	heridas=heridas +1
	if heridas == 1:
		queue_free()
