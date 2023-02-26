#!/bin/bash

#!/bin/bash

# Get the current year
year=$(date +"%Y")

# Create the year folder
mkdir $year

# Loop through the months and create a folder for each one
for month in {01..12}; do
    mkdir "$year/$month"
    touch "$year/$month/$month.md"
done

# Create a file in the year folder
touch "$year/$year.md"

# fails
# Get the current year
# year=$(date +"%Y")

# # Create the year folder
# mkdir $year

# # Loop through the months and create the folder and file
# for month in {01..12}; do
#     month_name=$(date -d "$year-$month-01" +"%B")
#     mkdir "$year/$month_name"
#     touch "$year/$month_name/$month_name.md"
#     echo "# $month_name" >> "$year/$month_name/$month_name.md"
# done

# # Add file name as heading to year files
# for file in "$year"/*.md; do
#     echo "# ${file##*/}" >> "$file"
# done
