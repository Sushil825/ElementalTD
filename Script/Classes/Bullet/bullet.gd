extends Node2D
class_name Bullet

@export var speed:float=100
@export var damage:float=50
@export var speed_mult:float=1.0
@export var damage_mult:float=1.0
@export var num_of_targets:int=1
@export var life_timer:float=5
var def_direction=Vector2.RIGHT

var life:Timer


func _ready() -> void:
	
	life=Timer.new()
	life.timeout.connect(_on_lifetime_expired)
	life.wait_time=life_timer
	life.one_shot=true
	add_child(life)
	life.start()
	

func _process(delta: float) -> void:
	position+=def_direction*speed*speed_mult*delta
	



func _on_lifetime_expired():
	
	queue_free()
