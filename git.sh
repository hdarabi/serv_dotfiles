clear
git_path = which git
if [ -z $git_path ]
then
	echo "git exists"
else
	echo "installing git"
	sudo apt-get update
	sudo apt-get install git
fi

sudo adduser git
sudo -u git mkdir /home/git/.ssh 
sudo -u git chmod 700 /home/git/.ssh
sudo -u git touch /home/git/.ssh/authorized_keys 
sudo -u git chmod 600 /home/git/.ssh/authorized_keys
sudo cp ~/serv_dotfiles/git_user.sh /home/git/git_user.sh
sudo chown git:git /home/git/git_user.sh
sudo -u git /home/git/git_user.sh
sudo mkdir /opt/git
sudo chown git:git /opt/git
echo "Please enter project name"
read proj_name
sudo -H -u git mkdir /opt/git/$proj_name
sudo cp ~/serv_dotfiles/git_user2.sh /home/git/git_user2.sh
sudo chown git:git /home/git/git_user2.sh
sudo -u git /home/git/git_user2.sh $proj_name
git_shell = which git-shell
in_shell = grep $git_shell /etc/shells
if [ ! -z in_shell ]
then
	cat $git_shell >> /etc/shells
fi
