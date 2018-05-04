Docker container with nodejs app and ssh daemon
===============================================

This is an example of a container that has a nodejs app running inside it along with an ssh daemon.

You can run following to get started

> docker build . -t docker-app-ssh

> docker run -p 8022:22 -p 8080:8080 docker-app-ssh 

You can then access the nodejs app at localhost:8080

To login to the container using ssh you can use:

> ssh -p 8022 root@localhost