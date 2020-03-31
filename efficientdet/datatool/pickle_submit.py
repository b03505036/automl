file = open(“fileName.p”,“rb”)
backup_list = pickle.load(file)
file.close()
print(backup_list)