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
su git
cd ~
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod .ssh/authorized_keys
ssh-keygen -t rsa -b 4096
echo "Please enter the path to the git user public key"
read key_path
cat $key_path >> ~/.ssh/authorized_keys
cd /opt/git
echo "Please enter project name"
read proj_name
mkdir $proj_name
cd $proj_name
git init --bare

git_shell = which git-shell
in_shell = grep $git_shell /etc/shells
if [ ! -z in_shell ]
then
	cat $git_shell >> /etc/shells
fi

echo "Please enter git_only users. Enter to end"
read user_name
while [ ! -z $user_name ]
do
	sudo chsh $user_name $git_shell
	echo "Please enter git_only users. Enter to end"
	read user_name
done
