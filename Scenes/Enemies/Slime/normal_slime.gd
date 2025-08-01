extends Slime

@onready var face: Sprite2D = $Face
@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent
@onready var hit_box_component: HitBoxComponent = $HitBoxComponent
var center:Vector2
func _ready() -> void:
	super._ready()
	center=get_viewport_rect().size/2
	
	hit_box_component.damage=stats.base_dmg
	if StaticSlimeFace.faces.size()>0:
		face.texture=StaticSlimeFace.faces.pick_random()
		face.position.y-=5
	
	
func handle_damage(damage:int):
	hurt_box_component.take_damage(damage)


func _process(delta: float) -> void:
	global_position=position.move_toward(center,delta*stats.move_speed*stats.move_mult)
