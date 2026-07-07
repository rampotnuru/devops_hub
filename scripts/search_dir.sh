echo "Enter directory name/path"
read dir

if [ -d "$dir" ]
then
	echo "Directory exists!"
else
	echo "Directory not found!!!"
fi

