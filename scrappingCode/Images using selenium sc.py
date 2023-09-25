from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time

chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--headless')
user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.50 Safari/537.36'
chrome_options.add_argument(f'user-agent={user_agent}')
url = 'https://www.newegg.com/acer-po3-640-ua91-predator-orion-3000/p/N82E16883101887'
driver = webdriver.Chrome(options=chrome_options)
driver.set_window_size(1728, 1280) # set the size of the window
driver.get(url)
delay = 0 # seconds
driver.implicitly_wait(delay)
element = driver.find_element(By.XPATH, '//*[@id="side-swiper-container"]')
element.click()
### Method 2
images = driver.find_element(By.CLASS_NAME,
                        'product-view-container').find_elements(By.CLASS_NAME,
                        'product-view-img-original')
buttonfor = driver.find_element(By.XPATH, '//*[@id="app"]/div[3]/div/div/div/div[2]/div[1]/div[4]/div/div[2]/i[2]')
count = 0
for i in range(len(images)):
    time.sleep(1)
    count += 1
    print("Page is ready!")
    try:
        imgbytes = driver.find_element(By.CLASS_NAME,
                        'product-view-container').find_element(By.CLASS_NAME,
                        'swiper-slide.swiper-slide-active').find_element(By.CLASS_NAME,
                        'product-view-img-original').screenshot_as_png
        with open("image" + str(count) +'.png', 'wb') as f:
            f.write(imgbytes)
    except:
        pass
    try:
        buttonfor.click()
        pass
    except:
        print("done")
        break






