import csv
with open('urls of page#1.csv', mode='r') as urlcsv:
    csv_reader = csv.reader(urlcsv, delimiter=',')
    print(csv_reader)
