import os
from glob import glob
import pandas as pd
from pathlib import Path
import chardet

category = 'All categories'
#MERGE CSVs TO ONE
os.chdir(fr"D:\Newegg6\{category}")
PATH = os.getcwd()
EXT = "*.csv"
all_csv_files = [file
                 for path, subdir, files in os.walk(PATH)
                 for file in glob(os.path.join(path, EXT))]
# for f in all_csv_files:
#     print(f)
#     detected = chardet.detect(Path(f).read_bytes())
#     print(detected)
# Initialize an empty DataFrame to store the merged data
merged_data = pd.DataFrame()
# Loop through all files in the folder
for f in all_csv_files:
    if f.endswith('.csv'):
        # Determine the encoding of the file
        # with open(os.path.join(folder_path, filename), 'rb') as f:
        print(f)
        result = chardet.detect(Path(f).read_bytes())
        encoding = result['encoding']
        print(encoding)
        # Read the file into a DataFrame with the determined encoding
        df = pd.read_csv(f, encoding=encoding)
        # Append the data to the merged_data DataFrame
        merged_data = pd.concat([merged_data, df], ignore_index=True)
#
# # Write the merged data to a CSV file
merged_data.to_csv(category + ".csv", index=False,  encoding='utf-8-sig')




# cs=[]
# for f in all_csv_files:
#     try:
#         df = pd.read_csv(f, encoding="utf-8-sig")
#     except:
#         df = pd.read_csv(f, encoding="Windows-1252")
#     cs.append(df)
# print(cs)
# cs.to_csv(category + ".csv", index=False, encoding='utf-8-sig')
# combined_csv = pd.concat([pd.read_csv(f,encoding = "utf-8-sig") for f in all_csv_files])
# combined_csv.to_csv(category + ".csv", index=False, encoding='utf-8-sig')



