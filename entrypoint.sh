#!/bin/sh

echo "Starting node app"
node app.js &

echo "Starting ssh daemon"
/usr/sbin/sshd -D
