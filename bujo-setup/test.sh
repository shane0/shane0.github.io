#!/bin/bash

# mkdir -p $(date +%Y/{01..12}/{index,future,next,collections}.md) $(date +%Y/{index.md,future.md,next.md,collections.md}) && echo "# $(date +%Y)" > $(date +%Y/%Y.md)


#!/bin/bash

YEAR=$(date +"%Y")

# Create the year directory
mkdir -p $YEAR

# Create the year markdown file
touch $YEAR/$YEAR.md

# Loop over the months
for i in {01..12}; do
    # Create the month directory
    mkdir -p $YEAR/$i
    
    # Create the month markdown file
    touch $YEAR/$i/$i.md
    
    # Create the additional markdown files
    touch $YEAR/$i/index.md
    touch $YEAR/$i/future.md
    touch $YEAR/$i/next.md
    touch $YEAR/$i/collections.md
done

# content with folder name
# find 2023 -type f -name "*.md" -exec sh -c 'echo "# $(basename "$(dirname "$0")")" > "$0"' {} \;
# or file name
# for month in {01..12}; do mkdir -p "${year}/${month}" && touch "${year}/${month}/${month}.md" "${year}/${month}/index.md" "${year}/${month}/future.md" "${year}/${month}/next.md" "${year}/${month}/collections.md"; done && touch "${year}/${year}.md"


# year=$(date +%Y)
# mkdir "$year"
# cd "$year"

# for month in {01..12}; do
#     mkdir "$month"
#     echo "# $month" > "$month/$month.md"
# done

# echo "# $year" > "$year.md"

# year=$(date +%Y)

# # Create year folder
# mkdir "$year"
# cd "$year"

# # Create month folders and files
# for month in {01..12}; do
#     mkdir "$month"
#     echo "# $year-$month" > "$month/$year-$month.md"
# done
