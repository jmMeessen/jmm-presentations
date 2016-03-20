# User Name Space demo
The purpose is to demonstrate that files owned by root on the host can't be modified anymore by the (pseudo) root user in the container.
The demontration is done by mapping the host/etc directory as container/data directory and modifying (or trying to modify) the hosts file.

## Demo setup
* move to work directory `demo` and start Vagrant with `vagrant up`. It is an Ubuntu 14.04 (LTS).
* install Docker

````
$ sudo su
# apt-get install apt-transport-https ca-certificates
# apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
# apt-get update
# apt-get install docker-engine
# usermod -aG docker vagrant
# apt-get install vim
````

## Demo
### First part
* if the virtual machine is already running do a `vagrant resload`
* verify that docker is running with `docker ps`
* start an interactive container with `docker run -ti -v /etc:/demo centos:latest /bin/bash`
* cd to the `/demo`  and show that this directory is the host's `/etc` directory. Notice the ownership of the files.
* launch `vi hosts` and add a comment line with `Kill Roy was here" => the file can be saved
* exit the container


### Second part
* edit the docker configuration with `sudo vim /etc/default/docker`. Modify the DOCKER_OPTS so that it reads `DOCKER_OPTS="--userns-remap=default"`
* restart the Docker Daemon with `sudo service docker restart`
* start the container again with `docker run -ti -v /etc:/demo centos:latest /bin/bash`
* cd to the `/demo` directory and show the file owners
* edit the file hosts file and it will fail
