@icon("res://common/icons/movement_icon.svg")
class_name MovementComponent 
extends Node

@export_subgroup("Settings")
@export var speed: float = 200.0

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
    body.velocity.x = direction * speed
