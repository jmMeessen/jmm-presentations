Simple run

docker run alpine echo "hello class"

docker run alpine cat /etc/os-release

docker run debian:jessie cat /etc/os-release

docker build -t demo:latest .

docker run -d demo:latest

docker ps

docker logs 

docker stop

