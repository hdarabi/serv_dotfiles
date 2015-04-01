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
sudo -H -u git ssh-keygen -t rsa -b 4096
echo "Please enter the path to the git user public key"
read key_path
sudo -H -u git cat $key_path >> ~/.ssh/authorized_keys
sudo -u git mkdir /opt/git
echo "Please enter project name"
read proj_name
sudo -H -u git mkdir /opt/git/$proj_name
sudo -H -u cd $proj_name
git init --bare

git_shell = which git-shell
in_shell = grep $git_shell /etc/shells
if [ ! -z in_shell ]
then
	cat $git_shell >> /etc/shells
fi
