from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time
from bs4 import BeautifulSoup
import requests

chrome_options = webdriver.ChromeOptions()
# chrome_options.add_argument('--headless')
chrome_options.add_experimental_option("useAutomationExtension", False)
chrome_options.add_experimental_option("excludeSwitches",["enable-automation"])
user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.50 Safari/537.36'
chrome_options.add_argument(f'user-agent={user_agent}')
url = 'https://www.newegg.com/p/2WC-0065-00005?Item=9SIB9RSH4B9755'
driver = webdriver.Chrome(options=chrome_options)
# driver.set_window_size(1728, 1280) # set the size of the window
driver.get(url)
# time.sleep(10)
element = driver.find_element(By.XPATH, '//*[@id="product-details"]/div[1]').find_elements(By.CLASS_NAME, 'tab-nav')
for i in element:
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
    revpagecount = int(driver.find_element(By.XPATH, '//*[@id="product-details"]/div[2]/div[3]/div[7]/div/span[3]/strong').text)
except:
    revpagecount = 1
# print(revpagecount)
R= []
r = []
count= 0
for j in range(revpagecount):
    count += 1
    reviews = driver.find_element(By.XPATH,
            '//*[@id="product-details"]/div[2]/div[3]').find_element(By.CLASS_NAME,
             'comments').find_elements(By.CLASS_NAME,
             'comments-content')
    for k in reviews:
        ri= k.text
        r.append(ri)
    if count == (revpagecount):
        break
    else:
        # print(count)
        revpagebuttonfor.click()
        time.sleep(5)
print(len(r))
R.append(','.join(r))
print(len(R))






