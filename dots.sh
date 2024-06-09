#!/bin/sh

# ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
# ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
# ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
# ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
# ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
# ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
# ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗                 
# ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝                 
# ███████╗██║     ██████╔╝██║██████╔╝   ██║       from github.com/thecaprisun/dotfiles             
# ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║       add me on discord, _the.sun_
# ███████║╚██████╗██║  ██║██║██║        ██║       email me at sun@bleedingbox.dev
# ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝                    

# A simple shell script to update the configs in ~/dots.





clear

echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
echo "███████╗ ██████╗██████╗ ██╗██████╗ ████████╗                 "
echo "██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝                 " 
echo "███████╗██║     ██████╔╝██║██████╔╝   ██║                    "
echo "╚════██║██║     ██╔══██╗██║██╔═══╝    ██║                    "
echo "███████║╚██████╗██║  ██║██║██║        ██║                    "
echo "╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝                    "

echo Welcome $USER, what would you like to do today?
echo "a) Add, push and commit dotfiles"
echo "b) Update the dotfiles in ~/dots"
echo "c) Edit your config files"
echo "d) Edit the install script"
echo "e) Edit this script"
echo "q) Exit"

read answer

case $answer in

a) cd ~/dots 
   git add --all 
   git commit 
   git push 
   clear 
   exec sh "$0" "$@";;

b) rm -rf ~/dots/config/* 
   cp -r ~/.config/i3 ~/dots/config/ 
   cp -r ~/.config/alacritty ~/dots/config/ 
   cp -r ~/.config/picom.conf ~/dots/config/ 
   cp -r ~/.config/rofi ~/dots/config/ 
   cp -r ~/.config/polybar ~/dots/config/ 
   cp -r ~/.vimrc ~/dots/
   clear
   exec sh "$0" "$@";;

c)
   clear
   echo "What config file would you like to edit?"
   echo "a) I3"
   echo "b) Polybar"
   echo "c) Alacritty"
   echo "d) Rofi"
   echo "e) Vim"
   echo "f) Picom"
   echo "q) Exit"
   read config
	case $config in	
  	a) vim ~/.config/i3/config && clear && exec sh "$0" "$@";;
	b) vim ~/.config/polybar/config.ini && clear && exec sh "$0" "$@";;
	c) vim ~/.config/alacritty/alacritty.toml && clear && exec sh "$0" "$@";;
	d) vim ~/.config/rofi/config.rasi && clear && exec sh "$0" "$@";;
	e) vim ~/.vimrc && clear && exec sh "$0" "$@";;
	f) vim ~/.config/picom.conf && clear && exec sh "$0" "$@";;
	q) clear && exec sh "$0" "$@";;
	*) echo Not one of the choices && sleep 2 && clear && exec sh "$0" "$@";;
	esac
	;;
d) vim ~/dots/install.sh && clear && exec sh "$0" "$@";; 
e) vim ~/scripts/dots.sh && clear && exec sh "$0" "$@";;
q) clear && echo Goodbye!;;
*) echo Not one of the choices && sleep 2 && clear && exec sh "$0" "$@";;
esac
