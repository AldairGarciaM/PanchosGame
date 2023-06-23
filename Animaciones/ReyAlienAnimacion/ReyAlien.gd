extends KinematicBody2D

onready var ReyAlien= $AnimatedSprite
onready var suelo = $RayCast2D
onready var sonido =$AudioStreamPlayer2D

export var direccion = -1
var velocidad = Vector2()
var speed = 300
var tiempoMuerte = 0.3
var heridas = 0

const fuerzaCaida = 20
const fuerzaMovimiento = 30

func _ready():
	if direccion == 1:
		ReyAlien.flip_h = false
	else:
		ReyAlien.flip_h = true
		
func _physics_process(delta):
	if is_on_wall() or not suelo.is_colliding() and is_on_floor():
		direccion = direccion * -1
		ReyAlien.flip_h = not ReyAlien.flip_h
		
	velocidad.y += fuerzaCaida
	velocidad.x = speed * direccion
	velocidad = move_and_slide(velocidad, Vector2.UP)


func _on_zonaHurt_body_entered(body):
	ReyAlien.play("dead")
	sonido.play()
	yield(get_tree().create_timer(.5),"timeout")
	ReyAlien.play("dead")
	heridas = heridas +1
	if heridas == 10:
		queue_free()
