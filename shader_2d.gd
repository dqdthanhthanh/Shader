extends Node2D

var time:float = 0
var size:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	size = Vector2($Icon.texture.get_width()*$Icon.scale.x,$Icon.texture.get_height()*$Icon.scale.y)
	$Icon.material.set('shader_parameter/u_resolution', size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Icon.material.set('shader_parameter/u_time', time)
	time += delta
