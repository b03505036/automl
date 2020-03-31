import os, random, shutil


def copyFile(fileDir):
    #1 
    pathDir = os.listdir(fileDir)
    #2一定要絕對路徑
    train = random.sample(pathDir, 4500)
    # print (train)
    val = [ x for x in pathDir if x not in train]
    # print (val[:100])
	# 3
    print(fileDir)
    for name in train:
        shutil.copyfile(fileDir+name, trainDir+name)
    
    for name in val:
        shutil.copyfile(fileDir+name,valDir+name)

    print("Train samples is {}".format(len(train)))
    print("Val samples is {}".format(len(val)))
if __name__ == '__main__':
    fileDir = "/home/oym/mmdetection/data/coco/image/"
    trainDir = '/home/oym/mmdetection/data/coco/image_train/'
    if not os.path.exists(trainDir):
        os.makedirs(trainDir)
    valDir = '/home/oym/mmdetection/data/coco/image_val/'
    if not os.path.exists(valDir):
        os.makedirs(valDir)
    copyFile(fileDir)
