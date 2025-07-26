extends Resource
class_name EnemyStats

@export var health:int=200
@export var can_regen:bool=false
@export var regen_amount:int=2
@export var shield_amount:int=50
@export var can_shield:bool=false
@export var move_speed:float=100
@export var base_dmg:float=20
@export var move_mult:float=1.0
@export var attack_mult:float=1.0

@export var burn_res:float=0.0
@export var freeze_res:float=0.0
@export var poison_res:float=0.0
@export var knockback_res:float=0.0
@export var shock_res:float=0.0

@export var fire_res:float=0.0
@export var water_res:float=0.0
@export var thunder_res:float=0.0
@export var light_res:float=0.0
@export var dark_res:float=0.0
@export var wind_res:float=0.0
