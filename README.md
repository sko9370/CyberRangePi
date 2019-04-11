# Docker Cyber Range

I initially believed that I couldn't use any docker images that were made in non-ARMv7 architectures.
While that is true, if I "build" the docker images myself using the dockerfiles that are usually attached to those images that I want to use, then the images run perfectly fine.
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
