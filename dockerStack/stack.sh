echo 'enter stack name'
read name

docker stack deploy -c docker-compose.yml $name
