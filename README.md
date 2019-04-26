# Docker Cyber Range

## 25 APR

[Link to Parts Readme](https://github.com/sko9370/CyberRangePi/blob/master/Parts.md)

# Screenshots

![redtest visualizer](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/redtest%20viz.PNG)
![dvwa login](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa.PNG)
![dvwa 01](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2001.PNG)
![dvwa 02](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2002.PNG)
![dvwa 03](https://github.com/sko9370/CyberRangePi/blob/master/Screenshots/dvwa%20command%20injection%2003.PNG)

## 24 APR

Pre-built images are uploaded to Docker Hub.
https://cloud.docker.com/repository/docker/sko9370/rpi/general

TODO: Describe setup steps in detail
Unable to manually verify that all containers are working as they are supposed to (CTF challenges are too difficult with no solution published in English).

Examples p02, p11 are not currently compatible because of extra security settings done in docker-compose that docker swarm does not recognize. Could be done in isolation using docker-compose, but that requires another installation. Example p07 does not work because it does not build properly, at least on ARM.

## 21 APR

Using Docker swarm and existing Docker CTF containers, I was able to demonstrate that Raspberry Pi clusters and, by consequence, other ARM single board computer clusters are a viable option for hosting cyber ranges.

Setup
1. setup each RPI with Docker and add default user 'pi' to group using 'nodesetup.sh'
2. build Docker images for all the containers used in this demo using 'build.sh'
3. choose a 'manager' node and run 'docker swarm init' (probably the one with all the images)
4. copy and paste the resulting token into all other nodes, sorry no script for this!
5. back to the 'manager' node, run either 'blue.sh' or 'red.sh' to start the relevant containers
	a. Docker swarm will automatically load-balance the containers
6. check the IP of the 'manager' node at port 8080 in the browser to view a "visualizer" of the range
7. run either 'red.sh' or 'blue.sh' to start the relevant containers

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

## TODO

1. only deploy range containers on worker nodes to keep student from accessing build files

## old log

I initially believed that I couldn't use any Docker images that were made in non-ARMv7 architectures.
While that is true, if I "build" the Docker images myself using the dockerfiles that are usually attached to those images that I want to use, then the images run perfectly fine.
It does take some time to build and uses up some data, but it is enough to be hosted.

Possible list of vulnerable environments, but these use docker-compose so more testing necessary.
https://github.com/vulhub/vulhub

The next step to take is to demonstrate networking capabilities across the different raspberry pi's.
This is in order to implement "blue team" functions.
I'm picturing vulnerable ubuntu images set up in a network spread across multiple raspberry pi's.
The blue team is responsible for going in the network and changing the configurations of individual hosts and servers on the network.
Then they will defend the network against a series of automated attacks.
These can be very targeted, based on the vulnerabilities that were implemented in the beginning.
They can also be random and comprehensive to stress the network and force the blue team to adapt to new exploits.

## 10 APR

I was attempting to manually follow the directions to build a vulnerable container from a clean Ubuntu image.
I happened upon "docker-vulnerable-dvwa" on github.
The directions suggested just pulling the image from dockerhub, but the image did not run because it was probably built on x64.
However, the github repo also contained a dockerfile.

Building this dockerfile with
	docker build -t debian:dvwa .
where "-t debian:dvwa" is the tag option and the name of the image you are making, usually contains a colon.
The period indicates that a dockerfile is located in the current working directory.

Running build like this on a raspberry pi took a very long time.
Thankfully, if an error occurs, docker saves intermediate containers, like checkpoints so resuming builds is quick and easy.

Running docker with the command they have on the github with some adjustments gives this...
	docker run --rm -it -p 80:80 debian:dvwa
We do not need to use the pre-made image "vulnerables/web-dvwa" because it doesn't work and we just made one ourselves.

Once it is running, that window will show a log of the web server.
Navigating to the IP of the raspberry pi at port 80 (as defined in the command) will show you the web site.

More details in this repo...
https://github.com/opsxcq/docker-vulnerable-dvwa
