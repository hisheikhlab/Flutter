import requests

with open('valid proxies', 'r') as f:
    proxies = f.read().split("\n")

url = 'http://ipinfo.io/json'

counter = 0
for _ in range(len(proxies)):

    try:
        print(f"Using the proxy: {proxies[counter]}")
        res = requests.get(url,proxies={"http": proxies[counter],
                                          "https":proxies[counter]})
        print(res.status_code)
    except:
        # continue
        print("Failed")


    finally:
        counter += 1
        # counter % len(proxies)