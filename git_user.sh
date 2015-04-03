ssh-keygen -t rsa -b 4096
echo "Please enter the file name of git user public key"
read key_path
cat "/home/git/$key_path.pub" >> /home/git/.ssh/authorized_keys
