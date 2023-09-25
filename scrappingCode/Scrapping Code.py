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

os.chdir("..")
print(os.getcwd())
with open('top headers.txt', 'r') as f:
    user_agents = f.read().split("\n")
#os.chdir(r'D:\Neweggtesting')
html= requests.get(url, headers={'User-Agent': random.choice(user_agents)})
for h in range(1):
    if not html.status_code == 200:
        print('get_requests FAILED')
        print('subcategory NOT done')
        break
    else:
        # print('fine')
        soup = BeautifulSoup(html.text, 'lxml')
        #     #url verification
        # # tags = soup.find('ol', class_='breadcrumb')
        # # category = tags.find_all('li')[1].text
        #
        # # print('Category Match')
        page_no = soup.find('span', class_ = 'list-tool-pagination-text').text.split('/')[1]
        url0 = url.split('Page-1')[0]
        url1 = url.split('Page-1')[1]
        page_num = url.split('Page-')[1].split('?')[0]
        links=[]
        for i in range(int(page_no)):
              if i < int(page_no):
                    page_num = i + 1
                    links.append(url0 + 'Page-'+str(page_num) + url1)
        link_iter = iter(links)

        # EXTRACT Category
        tags = soup.find('ol', class_='breadcrumb')
        category = tags.find_all('li')[1].text
        subcategory = tags.find_all('li')[2].text
        try:
            subcategory2 = tags.find_all('li')[3].text
        except:
            subcategory2 = subcategory
        # # page_no = soup.find('span', class_='list-tool-pagination-text').text.split(' ')[1].split('/')[0]

        try:
            os.mkdir(os.path.join(os.getcwd(), subcategory.replace('/','&')))
        except:
            pass
        os.chdir(os.path.join(os.getcwd(), subcategory.replace('/','&')))
        try:
            os.mkdir(os.path.join(os.getcwd(),subcategory2.replace('/','&')))
        except:
            pass
        os.chdir(os.path.join(os.getcwd(), subcategory2.replace('/','&')))
        # ##SOUPING
        while True:
            url = next(link_iter, "end")
            if url == "end":
                 break
            print("page:" + url)

            # delay = 0
            # print(f"waiting for...{delay} seconds")
            # time.sleep(delay)

            html = requests.get(url,headers={'User-Agent': random.choice(user_agents)})
            for h in range(1):
                if not html.status_code == 200:
                    print('get rquests FAILED')
                    print('This subcategory Not Done')
                    break
                else:
                    # print('fine2')
                    soup = BeautifulSoup(html.text, 'lxml')

                    #CATEGORIES
                    tags = soup.find('ol', class_='breadcrumb')
                    category = tags.find_all('li')[1].text
                    subcategory = tags.find_all('li')[2].text
                    try:
                        subcategory2 = tags.find_all('li')[3].text
                    except:
                        subcategory2 = subcategory
                    page_no = soup.find('span', class_='list-tool-pagination-text').text.split(' ')[1].split('/')[0]

                    # #DATA
                    nam = []
                    furniture = soup.find_all('a', class_='item-title')
                    for name in furniture:
                        nam.append(name.get_text())
                    url = []
                    images = soup.find_all('div', class_='item-container')
                    for i in images:
                        url.append(i.find('img')['src'])
                    l = []
                    mdl_n = []
                    features = soup.find_all('ul', class_='item-features')
                    for m in features:
                        li_s = (m.find_all('li'))
                        for li in li_s:
                            l.append(li.text.strip())
                        for mdl in l:
                            if (mdl.find('Model') == 0):
                                mdl_n.append(mdl)
                        l = []
                    pr = []
                    price_c = soup.find_all('li', class_='price-current')
                    for p in price_c:
                        pr.append(p.text)
                    for i in range(len(pr)):
                        pr[i] = pr[i].replace(u'\xa0', u' ')
                        pr[i] = pr[i].split(' ')[0].split('$')[-1]
                    for i in range(len(mdl_n)):
                        mdl_n[i] = mdl_n[i].split('#: ')[1]
                    #append Categories
                    catgr = []
                    for i in range(len(nam)):
                        catgr.append(category)
                    sub_ctg = []
                    for i in range(len(nam)):
                        sub_ctg.append(subcategory)
                    sub_ctg_2 = []
                    for i in range(len(nam)):
                        sub_ctg_2.append(subcategory2)

                    #Write CSV
                    try:
                        os.mkdir(os.path.join(os.getcwd(), 'csv'))
                    except:
                        pass
                    os.chdir(os.path.join(os.getcwd(), 'csv'))
                    if os.path.isfile('Page' + page_no + '.csv'):
                        pass
                        # print("File exists")
                    else:
                        # print("File does not exist")
                        df = pd.DataFrame(zip(catgr, sub_ctg, sub_ctg_2, nam, url, pr, mdl_n),
                                          columns=['Category', 'Sub-Category', 'Sub-Category 2', 'Name', 'Image url', 'Price',
                                                   'Model #'])
                        df.to_csv('Page' + page_no + '.csv', index=False, encoding='utf-8-sig')
                    os.chdir("..")
                    print('csv_pass')

                    # Write Images
                    try:
                        os.mkdir(os.path.join(os.getcwd(), 'images'))
                    except:
                        pass
                    os.chdir(os.path.join(os.getcwd(), 'images'))
                    for i in images:
                        nam = (i.find('img')['title'])
                        link = (i.find('img')['src'])
                        image_name = nam.replace('.', ' ').replace('?', '').replace('!', '').replace('>', ' ').replace('<',
                                                                                                                       ' ').replace(
                            '/', ' ').replace('"',
                                              '').replace(
                            '|', ' ').replace(':', ' ').replace('+', '-').replace('*',
                                                                                  '-').replace('\f', '-f').replace('\b',
                                                                                                                   '-b').replace(
                            '\\', '-').replace('\r', '-r').replace('\n', '-n').replace('\t',
                                                                                       '-t')
                        if os.path.isfile(image_name + '.jpg'):
                            pass
                            # print("File exists")
                        else:
                            try:
                                with open(image_name + '.jpg', 'wb') as f:
                                    # delay = 0
                                    # print(f"waiting for...{delay} seconds")
                                    # time.sleep(delay)
                                    im = requests.get(link,headers={'User-Agent': random.choice(user_agents)})
                                    f.write(im.content)
                            except:
                                pass
                    print('images_pass')
                    os.chdir("..")

        print(f'This subcategory is DONE with Pages {page_no}')
        source = os.path.join(r"D:\Newegg3", category.replace('/', '&'), 'py')
        d = os.path.join(r"D:\Newegg3", category.replace('/', '&'),'py', 'py done')
        pyfile = subcategory2.replace('/', '&') + '.py'
        shutil.move(source + '\\' + pyfile, d)






