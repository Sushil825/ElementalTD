extends Area2D
class_name HitBoxComponent
@export var free_on_hit:bool=true
@export var damage:int=20
func _ready() -> void:
	
	self.area_entered.connect(_on_body_entered)
	
	
func _on_body_entered(area:Area2D):
	if area is HurtBoxComponent:
		if area.get_parent().has_method("handle_damage"):
			area.get_parent().handle_damage(damage)
			
			if free_on_hit:
				self.get_parent().queue_free()
		
	else:
		return
