import os
import random
dir="/home/tsgleeds2021/Experiments/vidya-environment/maskrcnn/osni"

count=0
images=[]
for i in os.listdir(dir):
    images.append(i)
shuffled=random.shuffle(images)
print(len(images))
"""for idx,name in enumerate(os.listdir(dir)):
    os.rename(idx,str(count)+'.'+i.split('.')[-1])
    count+=1"""
os.chdir(dir)
count=0
for i in images:
    os.rename(i,str(count)+'.'+i.split('.')[-1])
    count+=1
