#!/usr/bin/env python3
import os
from datetime import datetime

year = str(datetime.now().year)

# create year folder
os.makedirs(year, exist_ok=True)

for month in range(1, 13):
    month_name = datetime(2022, month, 1).strftime('%B')
    month_folder = os.path.join(year, month_name)

    # create month folder
    os.makedirs(month_folder, exist_ok=True)

    # create files
    file_name = month_name.lower()
    files = ['index', 'future', 'next', 'collections']

    for f in files:
        file_path = os.path.join(month_folder, f'{file_name}_{f}.md')
        with open(file_path, 'w') as file:
            file.write(f'# {month_name} {f.capitalize()}')
