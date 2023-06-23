extends KinematicBody2D

onready var laser= $Sprite
onready var sonido= $AudioStreamPlayer2D

var velocidad = Vector2(0,0)
var direccion = 1

const speed= 450
const gravedad = 10
const bounce = -300

func _ready():
	velocidad.x = speed * direccion

func _physics_process(delta):
	
	velocidad.x += gravedad
	
	if is_on_wall():
		queue_free()
		
	if is_on_floor():
		velocidad.y = bounce
		
	velocidad = move_and_slide(velocidad, Vector2.UP)
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	sonido.play()
