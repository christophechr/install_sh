clear
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

while getopts b: floag
do
    case "{flag}" in
        b) bash=$(OPTARG);;
    esac
done

#update package
pacman -Suy

#install base package
rpm
gcc
git

#install epitech package
pkg=(
    clang
    cmake
    ncurses
    sfml
    csfml
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
)

pacman --needed -S "${pkg[@]}"

#install criterion
rpm -ivh https://github.com/samber/criterion-rpm-package/releases/download/2.3.3/libcriterion-devel-2.3.3-2.el7.x86_64.rpm

#install gradle
wget https://services.gradle.org/distributions/gradle-7.0-bin.zip && mkdir /opt/gradle && unzip -d /opt/gradle gradle-7.0-bin.zip && rm -f gradle-7.0-bin.zip

#install stack
curl -sSL https://get.haskellstack.org/ | sh

#config emacs
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 278bb6a630e6474f99028a8ee1a5c763e943d9a3
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

#change alias emacs GUI to terminal emacs
if ["$bash" == "bash"]; then
    echo alias emacs="emacs -nw" >> ~/.bashrc
else if ["$bash" == "zsh"]; then
    echo alias emacs="emacs -nw" >> ~/.zshrc
fi