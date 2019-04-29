# Docker Cyber Range

Using Docker swarm and existing Docker CTF containers, I was able to demonstrate that Raspberry Pi clusters and, by consequence, other ARM single board computer clusters are a viable option for hosting cyber ranges.

## Setup
1. setup each RPI with Docker and add default user 'pi' to group by running 'nodesetup.sh'
	- sh nodesetup.sh
2. designate a 'manager' node and on it run 'docker swarm init'
3. copy, paste, and execute the resulting output (should look like 'docker swarm join ...') into other nodes
4. back to the 'manager' node, run either 'blue.sh' or 'red.sh' to start the relevant containers
5. browse to the IP of the 'manager' node at port 8080 in the browser to view a "visualizer" of the range
	- <ip.address.of.manager>:<port number>
6. browse to the IP of the 'manager' node to view DVWA (try :80 if it doesn't work)

docker swarm visualizer
https://github.com/dockersamples/docker-swarm-visualizer

CTF examples
https://github.com/farisv/CJ2018-Final-CTF

DVWA
https://github.com/opsxcq/docker-vulnerable-dvwa

example cluster
https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm

more inspiration
https://ashishchaudhary.in/dockerizing-a-ctf

https://github.com/mfthomps/Labtainers

https://github.com/OJ/bsides-2017-ctf-docker

Pre-built images are uploaded to Docker Hub.
https://cloud.docker.com/repository/docker/sko9370/rpi/general

[Link to Parts Readme](https://github.com/sko9370/CyberRangePi/blob/master/Parts.md)

## Screenshots

![redtest visualizer](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/redtest%20viz.PNG)
![dvwa login](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa.PNG)
![dvwa 01](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2001.PNG)
![dvwa 02](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2002.PNG)
![dvwa 03](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2003.PNG)
