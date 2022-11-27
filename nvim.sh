clear
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [grep "arch" /etc/*-release 0]; then
fi

if [grep "ubuntu" /etc/*-release 0]; then
    apt install neovim
fi

if [grep "fedora" /etc/*-release 0]; then
    dnf install -y neovim python3-neovim
fi

cp -r nvim ~/.config