extends TextureButton

@export var Catalogue_Scene = "res://Scenes/catalogue_menu.tscn"


func _on_button_up():
	get_tree().change_scene_to_file(Catalogue_Scene)
