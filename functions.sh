function gitadduser(){
	echo "Please enter git_only users. Enter to end"
	read user_name
	while [ ! -z $user_name ]
	do
		git_shell = which git-shell
		in_shell = grep $git_shell /etc/shells
		if [ ! -z in_shell ]
		then
			cat $git_shell >> /etc/shells
		fi
		sudo chsh $user_name $git_shell
		echo "Please enter git_only users. Enter to end"
		read user_name
	done
}
