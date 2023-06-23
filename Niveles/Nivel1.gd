extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_reset_body_entered(body: KinematicBody2D):
	get_tree().reload_current_scene()
