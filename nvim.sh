clear
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ -f /etc/arch-release]; then
    pacman -S neovim
fi

if [ -f /etc/debian-version ]; then
    apt install neovim
fi

if [ -f /etc/fedora-release ]; then
    dnf install -y neovim python3-neovim
fi

cp -r nvim ~/.config