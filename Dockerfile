FROM ubuntu:12.04
MAINTAINER Stewart Henderson <henderson.geoffrey@gmail.com>
RUN apt-get update && apt-get install -y curl supervisor openssh-server net-tools iputils-ping nano \
 make autoconf automake flex bison libtool libevent-dev pkg-config libssl-dev libboost-all-dev libbz2-dev build-essential g++ python-dev git
ENV thrift_src /usr/local/src/thrift
RUN git clone https://github.com/apache/thrift.git $thrift_src \
 && cd $thrift_src && git fetch && git checkout 0.9.1 \
 && ./bootstrap.sh && ./configure && make && make install
RUN cd $thrift_src/contrib/fb303 \
 && ./bootstrap.sh \
 && ./configure CPPFLAGS="-DHAVE_INTTYPES_H -DHAVE_NETINET_IN_H" \
 && make && make install
RUN cd $thrift_src/lib/py \
 && python setup.py install \
 && cd $thrift_src/contrib/fb303/py \
 && python setup.py install
ENV scribe_src /usr/local/src/scribe
ADD . scribe_src
RUN cd scribe_src && ./bootstrap.sh \
 && ./configure CPPFLAGS="-DHAVE_INTTYPES_H -DHAVE_NETINET_IN_H -DBOOST_FILESYSTEM_VERSION=2" LIBS="-lboost_system -lboost_filesystem" \
 && make && make install
ENV LD_LIBRARY_PATH /usr/local/lib
RUN echo "export LD_LIBRARY_PATH=/usr/local/lib" >> /etc/profile
RUN cd $scribe_src/lib/py && python setup.py install
RUN mkdir /usr/local/scribe
RUN cp $scribe_src/examples/example2client.conf /usr/local/scribe/scribe.conf
RUN mkdir -p /var/log/supervisor
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir /var/run/sshd
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN echo 'root:scribe' |chpasswd
EXPOSE 22 1463
CMD ["/usr/bin/supervisord"]