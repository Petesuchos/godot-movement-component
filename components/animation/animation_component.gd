@tool
@icon("res://components/animation/animation_icon.svg")
class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: Sprite2D
@export var animation_player: AnimationPlayer

@export_subgroup("Animations")
@export var idle_animation_name: String = "idle"
@export var walk_animation_name: String = "walk"
@export var jump_animation_name: String = "jump"
@export var fall_animation_name: String = "fall"



func handle_horizontal_flip(move_direction: float) -> void:
    if move_direction == 0:
        return
    sprite.flip_h = false if move_direction > 0 else true


func handle_move_animation(move_direction: float) -> void:
    handle_horizontal_flip(move_direction)
    
    if move_direction != 0:
        animation_player.play(walk_animation_name)
    else:
        animation_player.play(idle_animation_name)
        

func handle_jump_animation(is_jumping: bool, is_falling: bool) -> void:
    if is_jumping:
        animation_player.play(jump_animation_name)
    elif is_falling:
        animation_player.play(fall_animation_name)

func _get_configuration_warnings() -> PackedStringArray:
    var warnings : PackedStringArray = []
    if not sprite:
        warnings.append("This node needs a Sprite2D.")
    if not animation_player:
        warnings.append("This node needs an AnimationPlayer.")
    return warnings
