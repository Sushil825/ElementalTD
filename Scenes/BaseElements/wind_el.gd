extends BaseElements


@export var wind_base_proj:PackedScene
@export var fire_rate_min:float=3.5
@export var fire_rate_max:float=4.0
@export var detection_radius:float=350
@export var max_targets:int=2
@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent
@onready var detection_area: Area2D = $DetectionArea

var fire_timer:Timer
var can_fire:bool=true
var detected_targets:Array[Area2D]=[]

func _ready() -> void:
	setup_fire_timer()
	setup_detection_area()
	
func setup_fire_timer():
	fire_timer=Timer.new()
	fire_timer.wait_time=randf_range(fire_rate_min,fire_rate_max)
	fire_timer.timeout.connect(_on_fire_timer_runout)
	add_child(fire_timer)
	fire_timer.start()
	
func setup_detection_area():
	
	detection_area.area_entered.connect(_on_target_entered)
	detection_area.area_exited.connect(_on_target_exited)
	
	var collision_shape=detection_area.get_child(0) as CollisionShape2D
	
	if collision_shape and collision_shape.shape is CircleShape2D:
		(collision_shape.shape as CircleShape2D).radius=detection_radius
		

func _on_target_entered(area:Area2D):
	
	if is_valid_target(area) and area not in detected_targets:
		detected_targets.append(area)
	
func _on_target_exited(area:Area2D):
	if area in detected_targets:
		detected_targets.erase(area)
	
func is_valid_target(target:Area2D)->bool:
	return target.get_parent().is_in_group("enemies")
	

func _on_fire_timer_runout():
	can_fire=true

func _physics_process(delta: float) -> void:
	if can_fire and has_valid_targets():
		spawn_fire_proj()
		can_fire=false


func has_valid_targets()->bool:
	
	detected_targets=detected_targets.filter(func(target):return is_instance_valid(target))
	return detected_targets.size()>0

func spawn_fire_proj():
	fire_timer.wait_time=randf_range(fire_rate_min,fire_rate_max)
	fire_timer.start()
	
	if detected_targets.is_empty():
		return
		
	var targets_to_shoot=choose_targets()
	for target in targets_to_shoot:
		create_projectile_toward_target(target)
	
	

func choose_targets()->Array[Area2D]:
	
	var targets:Array[Area2D]=[]
	
	if detected_targets.size()<=max_targets:
		targets=detected_targets.duplicate()
	else:
		targets=choose_targets_by_strategy()
		
	return targets


func choose_targets_by_strategy()->Array[Area2D]:
	
	var chosen_targets:Array[Area2D]=[]
	
	var sorted_by_distance=detected_targets.duplicate()
	sorted_by_distance.sort_custom(func(a,b):
		return global_position.distance_to(a.global_position)<global_position.distance_to(b.global_position))
		
		
	for i in range(min(max_targets,sorted_by_distance.size())):
		chosen_targets.append(sorted_by_distance[i])
		
	return chosen_targets
	
	
	
func create_projectile_toward_target(target:Area2D):
	
	if not wind_base_proj:
		push_error("Wind base proj is not set yet")
		return
		
	var projectile=wind_base_proj.instantiate()
	var direction=(target.global_position-global_position).normalized()
	projectile.global_position=global_position
	projectile.set_direction(direction)
	get_tree().current_scene.add_child(projectile)

func handle_damage(damage:int):
	
	hurt_box_component.take_damage(damage)
