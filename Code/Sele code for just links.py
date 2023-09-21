url = 'https://www.newegg.com/Business-Desktops/SubCategory/ID-3921/Page-1?PageSize=96'
MAIN_CATEGORY = 'Computer Systems'
SUB_CATEGORY = 'Business Desktops'
pages_to_scrap = 2
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
# with open('top headers.txt', 'r'

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
        time.sleep(20)
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
        # Open a CSV file in write mode
        with open('urls of page#' + str(page_num) + '.csv', mode='w', newline='',  encoding='utf-8-sig') as file:

            # Create a CSV writer object
            writer = csv.writer(file)

            # Write the header row to the CSV file
            writer.writerow(['url'])

            # Write each row of data to the CSV file
            # for row in data:

            ## one by one for each product on page
            listwrap = soup.find("div", class_="item-cells-wrap")
            # counto = 0

            for i in listwrap:
                link = i.find("a", class_="item-title")["href"]
                writer.writerow(
                    [link])
                file.flush()