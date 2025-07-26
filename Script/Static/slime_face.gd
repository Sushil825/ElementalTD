extends Node

class_name SlimeFace
var faces:Array[Texture2D]=[]


func _ready() -> void:
	
	var dir=DirAccess.open("res://Assets/Enemies/Slimes/Faces/")
	
	if dir:
		
		for file_name in dir.get_files():
			
			if file_name.ends_with(".png"):
				var texture=load("res://Assets/Enemies/Slimes/Faces/"+file_name)
				
				if texture is Texture2D:
					faces.append(texture)
