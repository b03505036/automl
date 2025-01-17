import os
import cv2
import json
import xml.dom.minidom
import xml.etree.ElementTree as ET

# data_dir = './trai

# image_file_dir = os.path.join(data_dir, 'image')
image_file_dir = '/home/kenny70037/automl/efficientdet/dataset/coco/image_val'
# xml_file_dir = os.path.join(data_dir, 'box')
xml_file_dir = '/home/kenny70037/automl/train/box'

annotations_info = {'images': [], 'annotations': [], 'categories': []}

categories_map = {'holothurian': 1, 'echinus': 2, 'scallop': 3, 'starfish': 4}
categories_count = {'holothurian': 0, 'echinus': 0, 'scallop': 0, 'starfish': 0}
target_range = {'small': 0,'middle': 0,'big': 0} # 3 3-8 8

for key in categories_map:
    categoriy_info = {"id":categories_map[key], "name":key}
    annotations_info['categories'].append(categoriy_info)

file_names = [image_file_name.split('.')[0]
              for image_file_name in os.listdir(image_file_dir)]


ann_id = 1
for i, file_name in enumerate(file_names):

    image_file_name = file_name + '.jpg'
    xml_file_name = file_name + '.xml'
    image_file_path = os.path.join(image_file_dir, image_file_name)
    xml_file_path = os.path.join(xml_file_dir, xml_file_name)

    image_info = dict()
    image = cv2.cvtColor(cv2.imread(image_file_path), cv2.COLOR_BGR2RGB)
    height, width, _ = image.shape
    image_info = {'file_name': image_file_name, 'id': i+1,
                  'height': height, 'width': width}
    annotations_info['images'].append(image_info)

    DOMTree = xml.dom.minidom.parse(xml_file_path)
    collection = DOMTree.documentElement

    names = collection.getElementsByTagName('name')
    names = [name.firstChild.data for name in names]

    xmins = collection.getElementsByTagName('xmin')
    xmins = [xmin.firstChild.data for xmin in xmins]
    ymins = collection.getElementsByTagName('ymin')
    ymins = [ymin.firstChild.data for ymin in ymins]
    xmaxs = collection.getElementsByTagName('xmax')
    xmaxs = [xmax.firstChild.data for xmax in xmaxs]
    ymaxs = collection.getElementsByTagName('ymax')
    ymaxs = [ymax.firstChild.data for ymax in ymaxs]

    object_num = len(names)

    for j in range(object_num):
        if names[j] in categories_map:
            image_id = i + 1
            x1,y1,x2,y2 = int(xmins[j]),int(ymins[j]),int(xmaxs[j]),int(ymaxs[j])
            x1,y1,x2,y2 = x1 - 1,y1 - 1,x2 - 1,y2 - 1

            if x2 == width:
                x2 -= 1
            if y2 == height:
                y2 -= 1

            x,y = x1,y1
            w,h = x2 - x1 + 1,y2 - y1 + 1
            category_id = categories_map[names[j]]
            categories_count[names[j]] = categories_count[names[j]]+1
            area = w * h
            
            sizep = area/(width*height)
            if sizep < 3/100:
                target_range['small'] += 1
            elif sizep < 8/100:
                target_range['middle'] += 1
            else:
                target_range['big'] +=1
                
            annotation_info = {"id": ann_id, "image_id":image_id, "bbox":[x, y, w, h], "category_id": category_id, "area": area,"iscrowd": 0}
            annotations_info['annotations'].append(annotation_info)
            ann_id += 1

with  open('/home/kenny70037/automl/efficientdet/dataset/coco/annotations/image_val.json', 'w')  as f:
    json.dump(annotations_info, f, indent=4)

print(categories_count)
print(target_range)
print('all_image number:',  len(annotations_info['images']))
print('annotations number:',  len(annotations_info['annotations']))
print('class number:',  len(annotations_info['categories']))
