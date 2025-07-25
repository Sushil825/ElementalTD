extends BaseElements


@onready var fire_base_proj: Bullet = $FireBaseProj



var can_fire:bool=true

func _ready() -> void:
	pass
	


func _physics_process(delta: float) -> void:
	if can_fire:
		pass



func spawn_fire_proj():
	pass
