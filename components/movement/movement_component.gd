@icon("res://components/movement/movement_icon.svg")
class_name MovementComponent 
extends Node

@export_subgroup("Settings")
@export var speed: float = 200.0
@export var ground_acceleration: float = 15.0
@export var ground_deceleration: float = 20.0
@export var air_acceleration: float = 25.0
@export var air_deceleration: float = 5.0


func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
    var acceleration: float = 0.0
    if body.is_on_floor():
        acceleration = ground_acceleration if direction !=0 else ground_deceleration
    else:
        acceleration = air_acceleration if direction !=0 else air_deceleration
    
    body.velocity.x = move_toward(body.velocity.x, direction * speed, acceleration)
