#################################
#	INSTALL SCRIPT v3.26	#
#################################

echo "1) Am I executing this script inside the .dotfiles directory which itself is inside ~?\n
2)Did I install the catppuccin or whatever theme properly\n
3)Is Athena automounted?\n
(y/n)"

# move essential scripts
cp .bashrc ~/.bashrc
cp -r $(ls -d -1 */) ~/.config/

# Collect stuff
mkdir ./tmp
cd ./tmp
wget -o code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868  #vscode
wget -o https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz #nvim
# for the papirus repo
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'

#-------------------------------------------------------------------------------
# Remove Bloatware
sudo apt remove geary \
		pop-shop \

# Install Apps from apt
sudo apt update && sudo apt upgrade
sudo apt install ranger \
		 polybar \
		 curl \
		 p7zip-full \
		 dconf-editor \
		 vlc \
		 mpv \
		 nala \
		 papirus-icon-theme \
		 xclip \
		 feh \
		 fzf \
		 plocate \

# Install Apps from packages
sudo apt install ./code.deb

# Install scripts
cp ~/.config/scripts/desktoper.sh /usr/bin/desktoper

# nvim install
tar -xzvf ./nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/

# Install Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh |sudo sh /dev/stdin dest=/opt/
for dir in */; do
	sudo ln -s "$(realpath "$dir")" /usr/bin/
done 
#-------------------------------------------------------------------------------

# Dump dconf configs
dconf load / < ../dconf-settings

# Create desktop files
desktoper 

# ROS
locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale
sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt upgrade

sudo apt install ros-humble-desktop

source /opt/ros/humble/setup.bash

#-------------------------------------------------------------------------------
# Manipulate permissions
sudo usermod -a -G dialout $USER


# make symlinks to Resources
cd ~
rm -r Desktop Documents Downloads Music Pictures Public Templates Videos
cd Athena/
for dir in */; do
	ln -s "$(realpath "$dir")" ~/
done 

# Finishing
echo "Setting up finished. Consider installing these manually :\n
      1) matlab \n
      2) musikcube \n
      3) JetBrains Mono Font 
      4) Product Sans Font\n
      "
