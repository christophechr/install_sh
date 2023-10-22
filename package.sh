clear
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#install epitech package
pkg=(
    clang
    cmake
    systemd
    docker
    zsh
    valgrind
    tar
    tmux
    ruby
    vim
    python-numpy
    python-pip
    rpm
    wget
    curl
    git
)

if [ -f /etc/arch-release ]; then
    pacman -S "${pkg[@]}"
    #install SFML & CSFML
    pacman -S sfml
    pacman -S csfml
    #install ncurses
    pacman -S ncurses
fi

if [ -f /etc/debian_version ]; then
    apt install "${pkg[@]}"
    #install SFML & CSFML
    apt-get install libsfml-dev
    #install ncurses
    apt-get install libncurses-dev
fi

if [ -f /etc/fedora-release ]; then
    dnf install -y "${pkg[@]}"
    #install SFML & CSFML
    dnf install -y SFML
    dnf install -y CSFML
    #install ncurses
    dnf install -y ncurses-devel
fi

#install norma2
pip install -U norma2
sudo norma2 --install-completion
elif ["$bash" == "zsh"]; then
    echo alias emacs="emacs -nw" >> ~/.zshrc
fi
