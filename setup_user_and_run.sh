#!/bin/bash
echo userset starting

if [ -z "$user" ]
then
user=$(echo -n guest)
else
echo $user als Standard
fi

if [ -z "$password" ]
then
password=$(echo -n guest)
else
echo Passwort gesetzt
fi

useradd -m $user 
usermod -s /bin/bash $user 
usermod -s /bin/nologin root 
echo "$user:$password" | chpasswd

echo start ttyd

/sbin/tini ttyd login
