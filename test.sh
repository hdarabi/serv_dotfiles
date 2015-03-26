git_path = which git
if [ -z $git_path ]
then
	echo "git exists"
else
	echo "git does not exists"
fi

if [ -z myfile_path ]
then
	echo "test exists"
else
	echo "test does not exists"
fi
