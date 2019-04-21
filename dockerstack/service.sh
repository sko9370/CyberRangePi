docker service create --replicas=2 \
--name testy \
--mount type=bind,source=/mnt/nfs/dockertesting,target=/app \
p00warmup_main:latest
