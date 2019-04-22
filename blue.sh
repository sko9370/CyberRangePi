echo 'enter stack name for a blue range'
read name

docker stack deploy -c dc-blue.yml $name
