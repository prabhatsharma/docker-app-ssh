FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y

# install openssh server
RUN apt-get install -y openssh-server curl

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# setup sshd
RUN mkdir /var/run/sshd
RUN echo 'root:hello123' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

EXPOSE 8080 22

CMD /usr/src/app/entrypoint.sh