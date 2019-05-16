
NB docker projects in eclipse need to have the "Properties / Resource / New test file line delimiter" set to "Other / Unix"

Source: https://wiki.alpinelinux.org/wiki/Install_Alpine_on_VirtualBox

Source: https://wiki.alpinelinux.org/wiki/VirtualBox_shared_folders
# Uncomment the "/edge/community" community repository in:
vi /etc/apk/repositories
apk update
apk add virtualbox-guest-additions virtualbox-guest-modules-virt

poweroff
#(in the VM) share as hosts_git the git folder (D:\utenti\andrea\W_DSK\dev\git)

mkdir ~/hosts_git
mount -t vboxsf git ~/hosts_git

Source https://wiki.alpinelinux.org/wiki/Screen_terminal_multiplexer
apk add screen

screen -S

