#!/bin/bash

# Add local user
# Either use the MY_UID if passed in at runtime or
# fallback

USER_ID=${MY_UID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m jenkins
export HOME=/home/jenkins
chown -R jenkins $HOME
chown -R jenkins /opt/vlang
usermod -a -G audio jenkins

# Execute user-entrypoint.sh as user jenkins, and pass the commandline to it
exec /usr/sbin/gosu jenkins user-entrypoint.sh "$@"
