echo 'enter stack name for a red range'
read name

docker stack deploy -c dc-red.yml $name
