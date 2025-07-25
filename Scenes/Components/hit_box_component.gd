extends Area2D
class_name HitBoxComponent

func _ready() -> void:
	
	self.area_entered.connect(_on_body_entered)
	
	
func _on_body_entered(area:Area2D):
	if area is HurtBoxComponent:
		if area.has_method("take_damage"):
			if self.get_parent().had_method("handle_damage"):
				self.get_parent().handle_damage(area)
				queue_free()
		
	else:
		return
