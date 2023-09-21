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
html= requests.get(url, headers={'User-Agent': random.choice(user_agents)}, timeout= 5, )
for h in range(1):
    if not html.status_code == 200:
        print('get_requests FAILED')
        print('subcategory NOT done')
        break
    else:
        soup = BeautifulSoup(html.text, 'lxml')
        check = (soup.find('span', class_='list-tool-pagination-text'))
        if check == None:
            print('Are You Human ERROR')
            print('subcategory NOT done')
            break
        else:
            pass
        page_no = soup.find('span', class_ = 'list-tool-pagination-text').text.split('/')[1]
        url0 = url.split('Page-1')[0]
        url1 = url.split('Page-1')[1]
        page_num = url.split('Page-')[1].split('?')[0]
        links=[]
        for i in range(int(5)):
              if i < int(5):
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

            html = requests.get(url,headers={'User-Agent': random.choice(user_agents)}, timeout= 5)
            for h in range(1):
                if not html.status_code == 200:
                    print('get rquests FAILED')
                    print('This subcategory Not Done')
                    break
                else:
                    soup = BeautifulSoup(html.text, 'lxml')
                    check = (soup.find('ol', class_='breadcrumb'))
                    if check == None:
                        print('Are You Human ERROR')
                        print('subcategory NOT done')
                        break
                    else:
                        pass
                    #CATEGORIES
                    tags = soup.find('ol', class_='breadcrumb')
                    category = tags.find_all('li')[1].text
                    subcategory = tags.find_all('li')[2].text
                    try:
                        subcategory2 = tags.find_all('li')[3].text
                    except:
                        subcategory2 = subcategory
                    page_no = soup.find('span', class_='list-tool-pagination-text').text.split(' ')[1].split('/')[0]

                    pagelistings = []
                    # A = []
                    # B= []
                    C=[]
                    D = []
                    E = []
                    F = []
                    G = []
                    H = []
                    I = []
                    J = []
                    K = []
                    L = []
                    M = []
                    N = []
                    listwrap = soup.find("div", class_="item-cells-wrap")
                    for i in listwrap:
                        link = i.find("a", class_="item-title")["href"]
                        C.append(link)
                        #
                        # delay = 0
                        # print(f"waiting for...{delay} seconds")
                        # time.sleep(delay)
                        html = requests.get(link)

                        soup = BeautifulSoup(html.text, 'html.parser')
                        check = (soup.find('h1', class_='product-title'))
                        if check == None:
                            print('Are You Human ERROR')
                            print('subcategory NOT done')
                            break
                        else:
                            pass
                        # # CATEGORIES
                        # tags = soup.find('ol', class_='breadcrumb')
                        # category = tags.find_all('li')[1].text
                        # subcategory = tags.find_all('li')[2].text
                        # try:
                        #     subcategory2 = tags.find_all('li')[3].text
                        # except:
                        #     subcategory2 = subcategory

                        # print(category)
                        # print(subcategory)
                        # print(subcategory2)
                        # page_no = soup.find('span', class_='list-tool-pagination-text').text.split(' ')[1].split('/')[0]

                        # #DATA
                        # nam = []
                        try:
                            furniture = soup.find('h1', class_='product-title')
                            name = furniture.get_text()
                            # for name in furniture:
                            D.append(name)
                        except:
                            D.append('NA')
                            pass

                        # print(nam)
                        url = []
                        images = soup.find('div',
                                           class_='swiper-container product-view-gallery swiper-container-horizontal')
                        src = images.find_all('img')
                        for i in src:
                            url.append(i['src'])
                        M.append(', '.join(url))
                        # brnd = []
                        # mdl = []
                        text = 'Model'
                        try:
                            modeltable = soup.find(lambda tag: tag.name == "table" and text in tag.text)
                            brand = 'NA'
                            model = 'NA'
                            for i in modeltable.find_all("tr"):
                                if 'Brand' in i.text:
                                    brand = i.find('td').text
                                if 'Model' in i.text:
                                    model = i.find('td').text
                            E.append(brand)
                            F.append(model)

                        except:
                            E.append("NA")
                            F.append("NA")

                        # print(mdl)
                        # itm = []
                        try:
                            itemcont = soup.select_one('ol.breadcrumb')
                            item = itemcont.select_one('li.is-current')
                            itm = (item.find('em').text)
                            G.append(itm)
                        except:
                            G.append('NA')
                            pass

                        # print(itm)

                        # pr = []
                        price_c = soup.find('li', class_='price-current')
                        try:
                            pr = (price_c.text.split('$')[1])
                            H.append(pr)
                        except:
                            try:
                                pr = (price_c.text.split('–')[0])
                                H.append(pr)
                            except:
                                H.append('NA')
                                pass

                        # print(pr)

                        # #append Categories

                        # stk = []
                        try:
                            stock = soup.find('div', class_='product-inventory')
                            stk = (stock.text)
                            I.append(stk)
                        except:
                            I.append('NA')
                            pass
                        # print(stk)
                        try:
                            opts = []
                            options = soup.find('div', class_='product-options').find_all('ul')
                            for i in options:
                                a = []
                                for j in i.find_all('li'):
                                    a.append(j.text)
                                opts.append(','.join(a))
                            opts = '\n '.join(opts)
                            J.append(opts)
                        except:
                            J.append('NA')
                            pass

                        try:
                            des = []
                            rows = soup.find("div", class_="product-bullets").find_all('li')
                            for i in rows:
                                des.extend(i)
                            for i in range(len(des)):
                                des[i] = des[i].replace(u'\r', u'')
                            des = '\n'.join(des)
                            if des == '':
                                K.append('NA')
                            else:
                                K.append(des)
                            # K.append(des)
                        except:
                            K.append('NA')
                            pass

                        try:
                            lspecs = []
                            tables = soup.find_all('table', class_='table-horizontal')
                            for i in tables:
                                a = []
                                for j in i:
                                    # a.append(j.text)
                                    b = []
                                    for k in j:
                                        lspecs.append(k.text)
                                if lspecs == '':
                                    L.append('NA')
                                else:
                                    L.append('\n'.join(lspecs))

                        except:
                            L.append('NA')
                            pass


                        try:
                            ovrtable = soup.find('div', class_='tab-panes')
                            article = ovrtable.find_all('div', class_='article')
                            a = []
                            # text = 'NA'
                            for i in article:
                                text = i.text
                                if text == '':
                                    a.append('NA')
                                else:
                                    a.append(''.join(text).replace('\n', '').replace('\t', ''))
                            N.append(''.join(a))
                            # print(N)
                        except:
                            N.append('NA')
                            pass

                        # Write Images
                        try:
                            os.mkdir(os.path.join(os.getcwd(), 'images'))
                        except:
                            pass
                        os.chdir(os.path.join(os.getcwd(), 'images'))

                        image_name = name.replace('.', ' ').replace('?', '').replace('!', '').replace('>',
                                                                                                      ' ').replace(
                            '<',
                            ' ').replace(
                            '/', ' ').replace('"',
                                              '').replace(
                            '|', ' ').replace(':', ' ').replace('+', '-').replace('*',
                                                                                  '-').replace('\f', '-f').replace('\b',
                                                                                                                   '-b').replace(
                            '\\', '-').replace('\r', '-r').replace('\n', '-n').replace('\t',
                                                                                       '-t')

                        for i in range(len(url)):

                            if os.path.isfile(image_name + "-" + str(i) + '.jpg'):
                                pass
                                # print("File exists")
                            else:
                                try:
                                    delay = 1
                                    print(f"waiting for...{delay} seconds")
                                    time.sleep(delay)
                                    with open(image_name + "-" + str(i) + '.jpg', 'wb') as f:
                                        im = requests.get(url[i])
                                        f.write(im.content)
                                except:
                                    pass
                        os.chdir("..")
                    print('images pass')

                    #Write CSV
                    catgr = []
                    for i in range(len(D)):
                        catgr.append(category)
                    sub_ctg = []
                    for i in range(len(D)):
                        sub_ctg.append(subcategory)
                    sub_ctg_2 = []
                    for i in range(len(D)):
                        sub_ctg_2.append(subcategory2)
                    try:
                        os.mkdir(os.path.join(os.getcwd(), 'csv'))
                    except:
                        pass
                    os.chdir(os.path.join(os.getcwd(), 'csv'))
                    if os.path.isfile('Page' + page_no + '.csv'):
                        pass
                    else:
                        df = pd.DataFrame(zip(catgr, sub_ctg, sub_ctg_2, C, D, E, F, G, H, I, J, K, N, L, M),
                                          columns=['Category', 'Sub-Category', 'Sub-Category 2','Product Link', 'Name', 'Brand',
                                                   'Model', 'Item', 'Price', 'Stock', 'Options', 'Short Description',
                                                   'Long Description', 'Specs', 'images'])
                        df.to_csv('Page' + page_no + '.csv', index=False, encoding='utf-8-sig')


                    os.chdir("..")
                    print('csv_pass')
                    print(len(D), len(E), len(F), len(G), len(H), len(I), len(J), len(K), len(L), len(M), len(N))

        print(f'This subcategory is DONE with Pages {page_no}')
        source = os.path.join(r"D:\Newegg6", MAIN_CATEGORY, 'py')
        d = os.path.join(r"D:\Newegg6", MAIN_CATEGORY,'py', 'py done')
        pyfile = SUB_CATEGORY + '.py'
        shutil.move(source + '\\' + pyfile, d)






