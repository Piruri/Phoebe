#!/bin/bash


#############################	Description	######################################

#One- Step build
#This script should install and setup all dependencies in your raspberry pi



#############################	The script starts here	##############################

sudo apt-get update

echo "Checking if vlc is installed (and installing it if it''s not), since it would be used as the rtsp client" 
vlc --version || sudo apt-get install vlc

echo "Checking evdev library (gamepad input)" 
INSTALL_EVDEV=false
python -c "import evdev" || INSTALL_EVDEV = true
if [ "$INSTALL_EVDEV" = true ]; then 
	sudo apt-get install python
	sudo apt-get install python-dev python-pip gcc
	sudo apt-get install linux-headers-$(uname -r)
	pip install evdev		#sudo apt-get install python-evdev gcc
fi

echo "Checking socket library (used for TCP connection)"
python -c "import socket" || sudo apt-get install python-socket

echo "Actually you should install ffmpeg too, there is a different script for that in /ffmpegCAM/install_ffmpeg.sh"
echo "Yeah, I know, I could ask if you want to install it now and offer you the option to automatically do so right?"
sleep 1
echo "No, Im not doing that, fuck yourself"
echo "Said in a nice way :3" 
