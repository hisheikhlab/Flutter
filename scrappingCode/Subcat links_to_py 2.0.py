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



CATEGORY = 'Computer Systems'
csv_path = r"D:\Newegg6\Computer Systems.csv"
os.chdir(r'D:\Newegg6')
with open('top headers.txt', 'r') as f:
    user_agents = f.read().split("\n")
baseURL = 'https://www.newegg.com/category'
baseresponse = requests.get(baseURL, headers={'User-Agent': random.choice(user_agents)})
basesoup = bs4.BeautifulSoup(baseresponse.text, 'html.parser')
# try:
#     os.mkdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py2'))
# except:
#     pass
# os.chdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py2'))
try:
    os.mkdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py'))
except:
    pass
os.chdir(os.path.join(os.getcwd(), CATEGORY.replace('/', '&'), 'py'))

file = open(csv_path, "r")
data = list(csv.reader(file, delimiter=","))
file.close()
for i in range(len(data)):
    ctgnam= str(data[i]).rsplit('(',1)[0].split("'")[1]
    print(ctgnam)
    l = []
    print(basesoup.find_all("a", text=re.compile('.*({}).*'.format(ctgnam))))
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
    # l = l[]
    # print(l)
    # print(len(l))
    ran = False
    for i in l:
        # l = l[i]
        # print(i)
        if ('SubCategory' in i) and not ran:
            # print(i)
            url = i
            ran = True
            # print(url)
            if '?Tid' in url:
                url= 'https://' + url.split('//')[1].split('?')[0] + '/Page-1?' + url.split('?')[1]
            else:
                url= 'https://' + url.split('//')[1].split('?name=')[0] + '/Page-1'
            print('url:', url)

            # url= 'https://' + url.split('//')[1].split('?name=')[0] + '/Page-1'
            # delay = 0
            # print(f"waiting for...{delay} seconds")
            # time.sleep(delay)
            html_text = requests.get(url, headers={'User-Agent': random.choice(user_agents)}).text
            soup = BeautifulSoup(html_text, 'lxml')
            check = (soup.find('ol', class_='breadcrumb'))
            if check == None:
                print('Are You Human ERROR')
                print('subcategory NOT done')
                break
            else:
                pass
            # print("soup done")
            # url verification
            tags = soup.find('ol', class_='breadcrumb')
            category = tags.find_all('li')[1].text
            subcategory = tags.find_all('li')[2].text
            try:
                subcategory2 = tags.find_all('li')[3].text
            except:
                subcategory2 = subcategory
            # print(subcategory2)

            with open('D:\Sub Code.txt','r') as f:
                Code = f.read()
            pyfile = [f"url = '{url}'", '\n', f"MAIN_CATEGORY = '{CATEGORY}'", '\n',f"SUB_CATEGORY = '{subcategory2. replace('/', '&')}'" '\n', Code]
            # print(Code)
            with open(subcategory2. replace('/', '&') + '.py', 'w') as fa:
                # f.write(*data)
                for item in pyfile:
                    # write each item on a new line
                    fa.write(item)

            batcontent = ["@echo off",'\n', '"',r'C:\Python310\python.exe', '"', " ",'"', os.path.join(os.getcwd()+'\\'+ subcategory2. replace('/', '&') + '.py'),'"','\n', 'pause']

            with open(subcategory2. replace('/', '&') + '.bat', 'w') as fa:
                # f.write(*data)
                for item in batcontent:
                    # write each item on a new line
                    fa.write(item)

print('Done')









