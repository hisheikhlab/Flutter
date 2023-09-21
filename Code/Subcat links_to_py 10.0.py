##LIBRARIES
from bs4 import BeautifulSoup
import requests
import pandas as pd
import os
import glob
import bs4
import csv
import re
import time
import random

CATEGORY = 'Computer Peripherals'
csv_path = r"D:\Newegg6\Computer Peripherals.csv"
os.chdir(r'D:\Newegg6')
baseURL = 'https://www.newegg.com/category'
with open('top headers.txt', 'r') as f:
    user_agents = f.read().split("\n")
try:
    os.mkdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py'))
except:
    pass
os.chdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py'))
baseresponse = requests.get(baseURL, headers={'User-Agent': random.choice(user_agents)})
basesoup = bs4.BeautifulSoup(baseresponse.text, 'html.parser')
file = open(csv_path, "r")
data = list(csv.reader(file, delimiter=","))
file.close()
for i in range(len(data)):
    ctgnam= str(data[i]).rsplit('(',1)[0].split("'")[1]
    print(ctgnam)
    l = []
    check = (basesoup.find_all("a", text=re.compile('.*({}).*'.format(ctgnam))))
    if check == []:
        print('Are You Human ERROR')
        print('subcategory NOT done')
        break
    else:
        pass
    for a in basesoup.find_all("a", text=re.compile('.*({}).*'.format(ctgnam))):
        link = a.get('href')
        l.append(link)
    ran = False
    for i in l:
        if ('SubCategory' in i) and not ran:
            url = i
            ran = True
            if '?Tid' in url:
                url= 'https://' + url.split('//')[1].split('?')[0] + '/Page-1?' + url.split('?')[1] + "&PageSize=96"
            else:
                url= 'https://' + url.split('//')[1].split('?name=')[0] + '/Page-1' + '?PageSize=96'
            print('url:', url)
            subcategory2 = ctgnam
            with open('D:\Sub Code.txt','r') as f:
                Code = f.read()
            pyfile = [f"url = '{url}'", '\n', f"MAIN_CATEGORY = '{CATEGORY}'", '\n',f"SUB_CATEGORY = '{subcategory2. replace('/', '&')}'" '\n', Code]
            with open(subcategory2. replace('/', '&') + '.py', 'w') as fa:
                for item in pyfile:
                    fa.write(item)
            batcontent = ["@echo off",'\n', '"',r'C:\Python310\python.exe', '"', " ",'"', os.path.join(os.getcwd()+'\\'+ subcategory2. replace('/', '&') + '.py'),'"','\n', 'pause']
            with open(subcategory2. replace('/', '&') + '.bat', 'w') as fa:
                for item in batcontent:
                    fa.write(item)
print('Done')









