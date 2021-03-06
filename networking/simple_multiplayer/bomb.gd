
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

var in_area = []
var owner
#called from the animation
func explode():
	if (not is_network_master()):
		#but will call explosion only on master
		return
	for p in in_area:
		if (p.has_method("exploded")):
			p.rpc("exploded",owner) #exploded has a master keyword, so it will only be received by the master
		
func done():
	queue_free()
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_bomb_body_enter( body ):
	if (not body in in_area):
		in_area.append(body)


func _on_bomb_body_exit( body ):
	in_area.erase(body)
	
