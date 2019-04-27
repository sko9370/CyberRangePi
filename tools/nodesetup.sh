# install most recent revision of docker; sometimes need to run twice
sudo curl -sSL get.docker.com | sh
# set docker to start automatically
sudo systemctl enable docker && sudo systemctl start docker
# join docker group
sudo usermod -aG docker pi
# reset tty
reset
