#!/bin/bash 

echo "enter your problemed user:- "

read name  

found_error=false 

user=$(whoami)  >> /dev/null

if  [ "$user"  !=  root ]
then   
     
     echo "please switch to root user " 
     exit 1 

fi  



 
if grep -q  "^$name"  /etc/passwd > /dev/null; then 
   echo "Please delete the entry from /etc/passwd file"   
   found_error=true 
fi

 
if  grep -q  "^$name"  /etc/shadow > /dev/null; then
   echo "Please delete the entry from /etc/shadow file " 
   found_error=true 
fi


if  grep -q  "^$name"  /etc/group > /dev/null; then
   echo "Please delete the entry from /etc/group file " 
   found_error=true 
fi


if  grep -q  "^$name"  /etc/gshadow > /dev/null; then
   echo "Please delete the entry from /etc/gshadow file " 
   found_error=true 
fi


if [[ -e "/var/log/spool/$name" ]]; then
    echo "Please delete the file from /etc/log/spool folder " 
    found_error=true 
fi



if [[ -e  "/home/$name" ]]; then 
    echo "please delete the home directory of the user"
    found_error=true 
fi  


if [[ $found_error == false ]]; then
   echo "Problem not found" 
fi

 
