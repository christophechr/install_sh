clear
if [ $1 == "-h" ]; then
    printf "./pkginstall.sh link"
    exit 1
fi

#get the link
firstarg=$1

#get the folder name
prefix="https://aur.archlinux.org/"
suffix=".git"
namepkg=$"{firstarg#"$prefix"}"
namepkg=$"{namepkg%"$suffix"}"

#hort script to install the package
if [ -f /etc/arch-release ]; then
    git clone "$firstarg"
    cd "$namepkg"
    makepkg -si
    cd ..
    rm -rf "$namepkg"
else
    printf "Arch based distro only"
    exit 1
fi