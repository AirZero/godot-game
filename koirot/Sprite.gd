extends Sprite

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		rotate(0.1)
	pass

