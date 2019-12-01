FROM debian:buster
MAINTAINER devnull

# Installs like 300 packages... *yey*
RUN echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list && \
		apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
		gcc make autoconf automake gettext git build-essential xsltproc pkgconf pep8 pyflakes \
		python3-configobj python3-lxml python3-magic python3-paramiko python3-yaml \
		python3-ldap spice-html5 novnc libvirt0 python3-libvirt python3-parted \
		python3-guestfs python3-pil python3-cherrypy3 python3-pampy sosreport python3-pip \
    python3-cheetah python3-psutil python3-websockify  \
		libguestfs-tools lvm2 nfs-common open-iscsi  \
    python3-setuptools python3-wheel python3-openssl python3-pip		

RUN pip3 install jsonschema && mkdir /run/user

RUN git clone https://github.com/kimchi-project/wok.git && \
    cd wok && \
    ./autogen.sh --system && \
    sed -i 's/127\.0\.0\.1/0\.0\.0\.0/' /wok/src/wok/server.py && \
    make -j2 && \
		make install 

RUN git clone https://github.com/kimchi-project/kimchi.git &&\
  	cd kimchi &&\
  	./autogen.sh --system &&\
  	make -j2 &&\
  	make install

CMD "/usr/bin/wokd" "--log_level=debug" "--proxy_port=8001"
