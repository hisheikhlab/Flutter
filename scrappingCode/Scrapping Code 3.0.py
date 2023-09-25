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
import os
import shutil
import random

link = 'https://www.newegg.com/p/N82E16834156360'


#os.chdir(r'D:\Neweggtesting')
html= requests.get(link)

soup = BeautifulSoup(html.text, 'html.parser')



                    #CATEGORIES
tags = soup.find('ol', class_='breadcrumb')
category = tags.find_all('li')[1].text
subcategory = tags.find_all('li')[2].text
try:
    subcategory2 = tags.find_all('li')[3].text
except:
    subcategory2 = subcategory

# print(category)
# print(subcategory)
# print(subcategory2)
# page_no = soup.find('span', class_='list-tool-pagination-text').text.split(' ')[1].split('/')[0]

# #DATA
nam = []
furniture = soup.find_all('h1', class_='product-title')
for name in furniture:
    nam.append(name.get_text())
print(nam)
url = []
images = soup.find('div', class_='swiper-container product-view-gallery swiper-container-horizontal')
src = images.find_all('img')
for i in src:
    url.append(i['src'])
# print(len(url))

brnd = []
mdl = []
# features = soup.find_all('ul', class_='item-features')
modelnotable = soup.find_all('table', class_="table-horizontal")
for i in modelnotable:
    if 'Model' in i.text:
        j= i.find_all('tr')
        for k in j:
            # print(k)
            # print(k.find('td').text)
            if 'Brand' in k.text:
                brnd.append(k.find('td').text)
            if 'Model' in k.text:
                mdl.append(k.find('td').text)
# print(mdl)
itm = []
itemcont= soup.select_one('ol.breadcrumb')
item = itemcont.select_one('li.is-current')
itm.append(item.find('em').text)
# print(itm)

pr = []
price_c = soup.find('li', class_='price-current')
pr.append(price_c.text.split('$')[1])
# print(pr)

# #append Categories
catgr = []
for i in range(len(nam)):
    catgr.append(category)
sub_ctg = []
for i in range(len(nam)):
    sub_ctg.append(subcategory)
sub_ctg_2 = []
for i in range(len(nam)):
    sub_ctg_2.append(subcategory2)

stk = []
stock = soup.find('div',class_ = 'product-inventory')
print(stock.text)
# stk.append(stock.text)
# print(stock.text.replace(".", '.\n'))



# opts = []
# options = soup.find('div', class_ = 'product-options').find_all('ul')
# for i in options:
#     a = []
#     for j in i.find_all('li'):
#         a.append(j.text)
#     opts.append(','.join(a))
#
# opts = ['\n '.join(opts)]
#
#
# des=[]
# rows = soup.find("div", class_="product-bullets").find_all('li')
# for i in rows:
#     des.extend(i)
# for i in range(len(des)):
#     des[i] = des[i].replace(u'\r', u'')
# des = ['\n'.join(des)]
#
# # #Write CSV
#
# df = pd.DataFrame(zip(catgr, sub_ctg, sub_ctg_2, nam, brnd, mdl, itm,pr, stk,opts, des),
#   columns=['Category', 'Sub-Category', 'Sub-Category 2', 'Name', 'Brand','Model', 'Item', 'Price','Stock', 'Options', 'Description'])
# df.to_csv('Page' + '1' + '.csv', index=False, encoding='utf-8-sig')
#
# print('csv_pass')
#
# # # Write Images
#
# image_name = nam[0].replace('.', ' ').replace('?', '').replace('!', '').replace('>', ' ').replace('<',
#                                                                                ' ').replace(
# '/', ' ').replace('"',
#       '').replace(
# '|', ' ').replace(':', ' ').replace('+', '-').replace('*',
#                                           '-').replace('\f', '-f').replace('\b',
#                                                                            '-b').replace(
# '\\', '-').replace('\r', '-r').replace('\n', '-n').replace('\t',
#                                                '-t')
# for i in range(len(url)):
# # nam = (i.find('img')['title'])
# # link = (i.find('img')['src'])
#
#
#     with open(image_name + "-"+ str(i) + '.jpg', 'wb') as f:
#
#         im = requests.get(url[i])
#         f.write(im.content)
# print('images pass')

