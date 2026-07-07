#!/bin/bash

read -p "How many files do you want to create? " count

for ((i=1;i<=count;i++))
do
	touch file-$i.txt
done

echo "$count files created successfully!!"
