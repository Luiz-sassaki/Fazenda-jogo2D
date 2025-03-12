extends CharacterBody2D



# speed in pixels/sec
var speed = 200
@onready var animacao = $AnimatedSprite2D
func _physics_process(_delta: float) -> void:
	
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
		animacao.play("parado")
	
#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	velocity = (direction * speed)
	move_and_slide()
	if Input.is_action_just_pressed("left"):
		animacao.flip_h = false
		animacao.play("andando")
	if Input.is_action_just_pressed("right"):
		animacao.flip_h = true
		animacao.play("andando")
	if Input.is_action_just_pressed("up"):
		animacao.flip_h = true
		animacao.play("andando")
	if Input.is_action_just_pressed("down"):
		animacao.flip_h = false
		animacao.play("andando")


func _on_porta_casa_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://dentro_casa.tscn").call.call_deferred()


func _on_porta_saida_casa_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://principal.tscn").call_deferred()
