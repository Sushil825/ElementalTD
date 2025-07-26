extends BaseElements


@export var wind_base_proj:PackedScene
@export var fire_rate_min:float=3.5
@export var fire_rate_max:float=4.0

var fire_timer:Timer
var can_fire:bool=true

func _ready() -> void:
	fire_timer=Timer.new()
	fire_timer.wait_time=randf_range(fire_rate_min,fire_rate_max)
	fire_timer.timeout.connect(_on_fire_timer_runout)
	add_child(fire_timer)
func _on_fire_timer_runout():
	can_fire=true

func _physics_process(delta: float) -> void:
	if can_fire:
		spawn_fire_proj()
		can_fire=false

func spawn_fire_proj():
	fire_timer.wait_time=randf_range(fire_rate_min,fire_rate_max)
	fire_timer.start()
	
	var wind=wind_base_proj.instantiate()
	add_child(wind)
	
func handle_damage(area:Area2D):
	
	if area is HurtBoxComponent:
		area.take_damage(wind_base_proj.damage)
