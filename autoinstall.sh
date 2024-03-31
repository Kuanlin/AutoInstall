echo "START"
cd ~;
echo "UPDATE_1"
sudo apt-get update;
sudo apt-get upgrade -y;
echo "INSTALL_1"
sudo apt-get -y install lsb-release gnupg2 apt-transport-https ca-certificates curl software-properties-common tmux;
echo "CURL"
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian.gpg;
echo "ADD Repo"
sudo add-apt-repository --yes "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable";
echo "UPDATE_2"
sudo apt-get update;
sudo apt-get upgrade -y;
echo "DOCKER"
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
sudo apt-cache policy docker-cel;
sudo apt install -y docker-ce;
echo "DOCKER ENV"
#sudo systemctl status docker;
sudo groupadd docker;
sudo gpasswd -a $USER docker;
echo "POSTGRESQL CLIENT"
sudo apt install -y postgresql-client;
echo "PYTHON VENV"
sudo apt install -y python3-venv;
echo "PYTHON CREATE VENV"
mkdir bot;
python3 -m venv ~/bot/.venv;
