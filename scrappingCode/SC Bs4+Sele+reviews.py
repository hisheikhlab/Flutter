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
import csv
import os
import shutil
import random
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException

## go back on directory
os.chdir("..")
## open top headers
with open('top headers.txt', 'r') as f:
    user_agents = f.read().split("\n")
## make folder of subcategory and change to it
try:
    os.mkdir(os.path.join(os.getcwd(), SUB_CATEGORY.replace('/', '&')))
except:
    pass
os.chdir(os.path.join(os.getcwd(), SUB_CATEGORY.replace('/', '&')))
print(os.getcwd())
## generate paginated links
links = []
for i in range(int(pages_to_scrap)):
    page_num = i + 1
    links.append(url.replace('Page-1', f"Page-{page_num}"))
link_iter = iter(links)
## start with one page at a time
while True:
    url = next(link_iter, "end")
    if url == "end":
        break
    print("page:" + url)
    page_num = url.split('Page-')[1][0]
    ### check if csv already present
    if os.path.isfile('Page#' + str(page_num) + '.csv'):
        print('csv exists')
        pass
    else:
        # delay = 0
        # print(f"waiting for...{delay} seconds")
        # time.sleep(delay)
        ## soup page i
        chrome_options = webdriver.ChromeOptions()
        # chrome_options.add_argument('--headless')
        chrome_options.add_experimental_option("useAutomationExtension", False)
        chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
        user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.50 Safari/537.36'
        driver = webdriver.Chrome(options=chrome_options)
        driver.set_window_size(1920 , 1080)  # set the size of the window
        driver.get(url)
        # time.sleep(10)
        # html = requests.get(url, headers={'User-Agent': random.choice(user_agents)})
        soup = BeautifulSoup(driver.page_source, 'lxml')
        ## check human error status
        check = (soup.find("div", class_="item-cells-wrap"))
        if check == None:
            print('Are You Human ERROR')
            print('subcategory NOT done')
            break
        else:
            print('page ready')
            pass
        ## extract  category data
        # CATEGORIES
        tags = soup.find('ol', class_='breadcrumb')
        category = tags.find_all('li')[1].text
        subcategory = tags.find_all('li')[2].text
        try:
            subcategory2 = tags.find_all('li')[3].text
        except:
            subcategory2 = subcategory
        ## data extraction

        # Define the data to be written to the CSV file

        # Open a CSV file in write mode
        with open('Page#' + str(page_num) + '.csv', mode='w', newline='',  encoding='utf-8-sig') as file:

            # Create a CSV writer object
            writer = csv.writer(file)

            # Write the header row to the CSV file
            writer.writerow(['Category', 'Sub-Category', 'Sub-Category 2', 'Product Link', 'Name', 'Brand',
                                   'Model', 'Item', 'Price', 'Stock', 'Options', 'Short Description',
                                   'Long Description', 'Specs', 'Reviews', 'images'])

            # Write each row of data to the CSV file
            # for row in data:

            C = []
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
            R = []
            catgr = []
            sub_ctg = []
            sub_ctg_2 = []
            ## one by one for each product on page
            listwrap = soup.find("div", class_="item-cells-wrap")
            counto = 0
            chrome_options = webdriver.ChromeOptions()
            # chrome_options.add_argument('--headless')
            chrome_options.add_experimental_option("useAutomationExtension", False)
            chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
            # user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.50 Safari/537.36'
            # chrome_options.add_argument(f'user-agent={user_agent}')
            driver = webdriver.Chrome(options=chrome_options)
            driver.set_window_size(1920 , 1080)  # set the size of the window
            for i in listwrap:
                link = i.find("a", class_="item-title")["href"]
                # C.append(link)
                ## soup of ith product-page
                delay = 20
                print(f"(waiting for...{delay} seconds)")
                time.sleep(delay)
                url = link
                counto += 1
                print('#' + str(counto) + ' ' + url)
                print('page loading')
                try:
                    driver.get(url)
                except:
                    continue
                soup = BeautifulSoup(driver.page_source, 'html.parser')
                ## check human error
                check = (soup.find('h1', class_='product-title'))
                if check == None:

                    print('Are You Human ERROR')
                    print('subcategory NOT done')
                    break
                else:
                    pass

                ### Name of product
                try:
                    furniture = soup.find('h1', class_='product-title')
                    name = furniture.get_text()
                    # D.append(name)
                except:
                    name = 'NA'
                    # D.append(name)
                    pass
                ### Images url
                url = []
                images = soup.find('div',
                                   class_='swiper-container product-view-gallery swiper-container-horizontal')
                src = images.find_all('img')
                for i in src:
                    url.append(i['src'])
                imagelinks = ', '.join(url)
                # M.append(', '.join(url))
                ### Model & Brand
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
                    # E.append(brand)
                    # F.append(model)
                except:
                    brand = 'NA'
                    model = 'NA'
                    # E.append(brand)
                    # F.append(model)

                ### Item no
                try:
                    itemcont = soup.select_one('ol.breadcrumb')
                    item = itemcont.select_one('li.is-current')
                    itm = (item.find('em').text)
                    # G.append(itm)
                except:
                    itm = 'NA'
                    # G.append(itm)
                    pass
                ### current price
                price_c = soup.find('li', class_='price-current')
                try:
                    pr = (price_c.text.split('$')[1])
                    # H.append(pr)
                except:
                    try:
                        pr = (price_c.text.split('–')[0])
                        # H.append(pr)
                    except:
                        pr = 'NA'
                        # H.append(pr)
                        pass
                ### stock availibility
                try:
                    stock = soup.find('div', class_='product-inventory')
                    stk = (stock.text)
                    # I.append(stk)
                except:
                    stk = 'NA'
                    # I.append(stk)
                    pass
                ### options
                try:
                    opts = []
                    options = soup.find('div', class_='product-options').find_all('ul')
                    for i in options:
                        a = []
                        for j in i.find_all('li'):
                            a.append(j.text)
                        opts.append(','.join(a))
                    opts = '\n '.join(opts)
                    # J.append(opts)
                except:
                    opts ='NA'
                    # J.append(opts)
                    pass
                ### short description
                try:
                    des = []
                    rows = soup.find("div", class_="product-bullets").find_all('li')
                    for i in rows:
                        des.extend(i)
                    for i in range(len(des)):
                        des[i] = des[i].replace(u'\r', u'')

                    if des == '':
                        des ='NA'
                        # K.append(des)
                    else:
                        des = '\n'.join(des)
                        # K.append(des)
                except:
                    des ='NA'
                    # K.append(des)
                    pass
                ### Specs
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
                        lspecs='NA'
                        # L.append(lspecs)
                    else:
                        lspecs='\n'.join(lspecs)
                        # L.append('\n'.join(lspecs))
                except:
                    lspecs='NA'
                    # L.append(lspecs)
                    pass
                ### Long description
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
                    if a == '':
                        a='NA'
                        # N.append(a)
                    else:
                        a = ''.join(a)
                        # N.append(''.join(a))
                    # N.append(''.join(a))
                    # print(N)
                except:
                    a='NA'
                    # N.append(a)
                    pass

                ###reviews
                relement = driver.find_element(By.XPATH, '//*[@id="product-details"]/div[1]').find_elements(By.CLASS_NAME,
                                                                                                            'tab-nav')
                for i in relement:
                    if 'Reviews' in i.text:
                        driver.execute_script("arguments[0].click();", i)
                        # i.click()
                time.sleep(1)
                try:
                    revpagebuttonfor = driver.find_element(By.XPATH,
                                                           '//*[@id="product-details"]/div[2]/div[3]/div[7]/div/div/div[2]/button')
                except:
                    pass
                try:
                    revpagecount = int(driver.find_element(By.XPATH,
                                                           '//*[@id="product-details"]/div[2]/div[3]/div[7]/div/span[3]/strong').text)
                except:
                    revpagecount = 1
                count = 0
                r = []
                for j in range(revpagecount):
                    count += 1
                    try:
                        reviews = driver.find_element(By.XPATH,
                                                      '//*[@id="product-details"]/div[2]/div[3]').find_element(
                            By.CLASS_NAME,
                            'comments').find_elements(
                            By.CLASS_NAME,
                            'comments-content')
                        for k in reviews:
                            ri = k.text
                            if 'Dear' in ri.split()[0]:
                                pass
                            elif 'Hello' in ri.split()[0]:
                                pass
                            else:
                                r.append(ri)
                    except:
                        try:
                            reviews = driver.find_element(By.XPATH,
                                                          '//*[@id="product-details"]/div[2]/div[2]').find_element(
                                By.CLASS_NAME,
                                'comments').find_elements(
                                By.CLASS_NAME,
                                'comments-content')
                            for k in reviews:
                                ri = k.text
                                if 'Dear' in ri.split()[0]:
                                    pass
                                elif 'Hello' in ri.split()[0]:
                                    pass
                                else:
                                    r.append(ri)
                        except:
                            ri = ''
                            r.append(ri)
                    if count == (revpagecount):
                        break
                    else:
                        driver.execute_script("arguments[0].click();", revpagebuttonfor)
                        # revpagebuttonfor.click()
                        time.sleep(1)
                allreviews= ', next review: '.join(r)
                # R.append(', next review: '.join(r))

                ## Write Image
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
                ### move to images folder
                try:
                    os.mkdir(os.path.join(os.getcwd(), 'images'))
                except:
                    pass
                os.chdir(os.path.join(os.getcwd(), 'images'))
                ### selenium image code
                element = driver.find_element(By.XPATH, '//*[@id="side-swiper-container"]')
                # driver.execute_script("arguments[0].click();", element)
                element.click()
                images = driver.find_element(By.CLASS_NAME,
                                             'product-view-container').find_elements(By.CLASS_NAME,
                                                                                     'product-view-img-original')
                buttonfor = driver.find_element(By.XPATH,
                                                '//*[@id="app"]/div[3]/div/div/div/div[2]/div[1]/div[4]/div/div[2]/i[2]')
                count = 0
                if os.path.isfile((image_name + "-" + str(len(images)) + '.jpg')):
                    print(str(len(images)) + " images of this product exist")
                    pass
                else:
                    for i in range(len(images)):
                        count += 1
                        time.sleep(1)
                        try:
                            imgbytes = driver.find_element(By.CLASS_NAME,
                                                           'product-view-container').find_element(By.CLASS_NAME,
                                                                                                  'swiper-slide.swiper-slide-active').find_element(
                                By.CLASS_NAME,
                                'product-view-img-original').screenshot_as_png
                            print("image #" + str(count))
                            with open(image_name + "-" + str(count) + '.jpg', 'wb') as f:
                                f.write(imgbytes)
                        except:
                            pass
                        if count == len(images):
                            print(str(len(images)) + " images of procuct done")
                            break
                        else:
                            driver.execute_script("arguments[0].click();", buttonfor)
                            # buttonfor.click()
                os.chdir('..')
                writer.writerow(
                    [category, subcategory, subcategory2, link, name, brand, model, itm, pr, stk, opts, des, a, lspecs,
                     allreviews, imagelinks])
                file.flush()
                # driver.close()
        ## Write CSV
        # CATEGORIES
        # tags = soup.find('ol', class_='breadcrumb')
        # category = tags.find_all('li')[1].text
        # subcategory = tags.find_all('li')[2].text
        # try:
        #     subcategory2 = tags.find_all('li')[3].text
        # except:
        # #     subcategory2 = subcategory
        # ### category data append
        # for i in range(len(D)):
        #     catgr.append(category)
        # for i in range(len(D)):
        #     sub_ctg.append(subcategory)
        # for i in range(len(D)):
        #     sub_ctg_2.append(subcategory2)
        # df = pd.DataFrame(zip(catgr, sub_ctg, sub_ctg_2, C, D, E, F, G, H, I, J, K, N, L, R, M),
        #                   columns=['Category', 'Sub-Category', 'Sub-Category 2', 'Product Link', 'Name', 'Brand',
        #                            'Model', 'Item', 'Price', 'Stock', 'Options', 'Short Description',
        #                            'Long Description', 'Specs', 'Reviews', 'images'])
        # print(df)
        # df.to_csv('Page' + str(page_num) + '.csv', index=False, encoding='utf-8-sig')
        # print('csv_pass')
        # print(len(C), len(D), len(E), len(F), len(G), len(H), len(I), len(J), len(K), len(L), len(M), len(N), len(R))
        if i == (pages_to_scrap - 1):
            print(f'This subcategory is DONE with Pages {page_num}')
            source = os.path.join(r"D:\Newegg6", MAIN_CATEGORY, 'py')
            d = os.path.join(r"D:\Newegg6", MAIN_CATEGORY, 'py', 'py done')
            pyfile = SUB_CATEGORY + '.py'
            shutil.move(source + '\\' + pyfile, d)





