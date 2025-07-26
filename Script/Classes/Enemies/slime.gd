extends Node2D
class_name Slime

@export var stats:EnemyStats
@onready var health_box_component: HealthBoxComponent = $HealthBoxComponent


func _ready() -> void:
	health_box_component.max_health=stats.health
	health_box_component.current_health=health_box_component.max_health
	health_box_component.can_regen=stats.can_regen
	health_box_component.shield_active=stats.can_shield
	if health_box_component.shield_active:
		health_box_component.shield_value=stats.shield_amount
	if health_box_component.can_regen:
		#Regen value here
		pass
