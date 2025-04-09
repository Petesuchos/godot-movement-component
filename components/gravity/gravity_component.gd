@icon("res://components/gravity/gravity_icon.svg") 
class_name GravityComponent
extends Node

@export_subgroup("Settings")
@export var gravity: float = 1000.0
@export var gravity_when_falling: float = 1500.00

var is_falling: bool = false

func handle_gravity(body: CharacterBody2D, delta: float) -> void:
    if not body.is_on_floor():
        var current_gravity := gravity if not is_falling else gravity_when_falling
        body.velocity.y += current_gravity * delta
    is_falling = body.velocity.y > 0 and not body.is_on_floor()
 
