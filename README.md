Dataplicty is a wonderful service which allows remote access to your linux machine,
however one has to fiddle around with the section of viewing the remote desktop
and following the recommended steps in their FAQs isn't helpful. I'm using ubuntu 
and the VNC only works with XFCE instead of gnome so that has to be installed as a
prerequisite step.

Thus I created 2 simple shell scripts that will allow their remote desktop service
to work all the time and to simplify the entire process. It will also stop these error messages: 

Can't find file /home/*/.vnc/*:1.pid

You'll have to kill the Xtightvnc process manually 

Failed to connect to server (code: 1011, reason: Failed to connect to downstream server)

PREREQUISITES:
1. download xfce4 using this command:    sudo apt-get install xfce4 -y
2. change desktop session manager and select "xfce4-session" using this command:    sudo update-alternatives --config x-session-manager
3. allow non-console users to startx "allowed_users=anybody" in this file:    sudo nano /etc/X11/Xwrapper.config

"run_vnc_server.sh" 
This script will start a clean vnc session everytime and will force kill the previous one

"stop_vnc_server.sh" will stop the vnc session and clean the session files

These bash scripts require sudo privileges, ex: sudo bash run_vnc_server.sh. Dont
forget to do a sudo chmod 777 filename.sh before running them. 

Finally, you may choose to change the resolution of the VNC desktop by adjusting the 
parameter in the "run_vnc_server.sh" file, I have it set at 800x600 but you can choose
something else.
