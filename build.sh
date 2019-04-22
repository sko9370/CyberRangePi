echo building images

cd examples/CJ2018-Final-CTF-master/p00-warmup
docker build -t p00 .

cd ../p01-firmware
docker build -t p01 .

#cd ../p02-sandbox
#docker build -t p02 .

cd ../p03-imagemanipulator
docker build -t p03 .

cd ../p04-coderunner
docker build -t p04 .

cd ../p05-crypto
docker build -t p05 .

cd ../p06-hades
docker build -t p06 .

#cd ../p07-exifreader
#docker build -t p07 .

cd ../p08-hackme
docker build -t p08 .

cd ../p09-poseidon
docker build -t p09 .

cd ../p10-assignment
docker build -t p10 .

#cd ../p11-zeus
#docker build -t p11 .

cd ../../docker-swarm-visualizer
docker build -t viz:latest .

cd ../docker-vulnerable-dvwa
docker build -t dvwa:latest .

echo !!!!!!!!!!!!!! Please wait until the builds finish !!!!!!!!!!!!!!!
