import os

def read_file(file):
    f = open(file,'r')
    map_data_string = f.read()
    map_data_list = map_data_string[1:len(map_data_string)-3].splitlines()
    proccessed_map_data_list = [line[:-1].replace('{','').replace('}','').strip().split(',') for line in map_data_list]
    map_data_points = [((int(line[0]),int(line[1])),float(line[2])) for line in proccessed_map_data_list]
    return map_data_points

def main():
    splits = size_factor
    map_data_points =  read_file(map_data)
    f = open("python_blender_template.py", 'r')
    py_blender = f.read()
    f.close()
    py_blender = py_blender.replace("<node_list>",map_data_points)
    new_py_blender = py_blender.replace("<times_to_be_split>",splits)
    f = open("py_blender.py",'w')
    f.write(new_py_blender)
    f.close()