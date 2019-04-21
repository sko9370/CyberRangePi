echo building images

cd p00-warmup
docker-compose build &

cd ../p01-firmware
docker-compose build &

cd ../p04-coderunner
docker-compose build

echo !!!!!!!!!!!!!! Please wait until the builds finish !!!!!!!!!!!!!!!
