Dataplicty is a wonderful service which allows remote access to your linux machine,
however one has to fiddle around with the section of viewing the remote desktop
and following the recommended steps in their FAQs isn't helpful.

Thus I created 2 simple shell scripts that will allow their remote desktop service
to work all the time.

"run_vnc_server.sh" 
This script will start a clean vnc session everytime and will force kill the previous one

"stop_vnc_server.sh" will stop the vnc session and clean the session files

These bash scripts require sudo privileges, ex: sudo bash run_vnc_server.sh. Dont
forget to do a sudo chmod 777 filename.sh before running them. 

Finally, you may choose to change the resolution of the VNC desktop by adjusting the 
parameter in the "run_vnc_server.sh" file, I have it set at 800x600 but you can choose
something else.
