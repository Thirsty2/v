#!/bin/bash

cp /etc/skel/.bashrc ${HOME}/
cp /etc/skel/.profile ${HOME}/
cp /etc/skel/.bash_logout ${HOME}/

exec "$@"
