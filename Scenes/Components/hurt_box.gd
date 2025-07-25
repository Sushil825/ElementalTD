extends Area2D
class_name HurtBoxComponent
@export var health:HealthBoxComponent


func _ready() -> void:
	
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area:Area2D):
	var parent=area.get_parent()
	
	print(parent.name)


func take_damage(amount:int):
	
	if health:
		health._take_damage(amount)
