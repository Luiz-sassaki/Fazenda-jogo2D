extends Area2D
@onready var animacao = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animacao.frame = 0
	await get_tree().create_timer(3.0).timeout
	animacao.frame = 1
	
	await get_tree().create_timer(3.0).timeout
	animacao.frame = 2
	
	await get_tree().create_timer(3.0).timeout
	animacao.frame = 3
	
	await get_tree().create_timer(3.0).timeout
	animacao.frame = 4
	
	await get_tree().create_timer(3.0).timeout
	animacao.frame = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
