# Simple run

* docker run alpine echo "hello class"

## different distro

* docker run alpine cat /etc/os-release

* docker run debian:jessie cat /etc/os-release


## More complicated 

* docker build -t demo:latest .

* docker run -d demo:latest

* docker ps

* docker logs 

* docker stop

