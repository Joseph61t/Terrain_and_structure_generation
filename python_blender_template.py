import bpy

node_positions = <node_list>

# Select all objects in the current scene
for obj in bpy.context.scene.objects:
    obj.select_set(True)

# Split the selected plane <times_to_be_split> times to create the correct number of nodes 
# to be varied.

# use node_positions to vary nodes as indicated.