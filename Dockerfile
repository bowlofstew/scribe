FROM bowlofstew/thrift:0.0.1
MAINTAINER Stewart Henderson<henderson.geoffrey@gmail.com>
RUN apt-get -y update
RUN apt-get -y upgrade
ADD . /tmp/scribe
RUN cd /tmp/scribe && \
	./bootstrap.sh && \
	./configure --enable-hdfs && \
	make