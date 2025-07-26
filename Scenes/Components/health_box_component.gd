extends Node2D
class_name HealthBoxComponent


@export var max_health:int=200
@export var current_health:int=200
@export var can_regen:bool=false
@export var shield_active:bool=false
@export var shield_value:int=50

var regen_timer:Timer


func _ready() -> void:
	regen_timer=Timer.new()
	regen_timer.timeout.connect(_on_regen_called)
	
func _on_regen_called():
	pass

func _take_damage(amount:int):
	
	if shield_active:
		take_shield_damage(amount)
	else:
		current_health-=amount


func take_shield_damage(amount:int):
	
	if shield_value<=0:
		shield_active=false
		return
	else:
		shield_active=true
	shield_value-=amount
