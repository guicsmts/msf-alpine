FROM alpine
MAINTAINER guicsmts

# update alpine
RUN apk update && apk upgrade
# install basic tools
RUN apk add --no-cache vim \
    gcc \
    make \
    sudo \
    cmake \
    tcpdump \
    iptables \
    net-tools \
    gnutls-c++ \
    ospd-netstat \
    netcat-openbsd \
    busybox-extras 
# create user
RUN adduser -D 7pine
# hacking tools
RUN apk update && apk upgrade
RUN apk add --no-cache python2 python3 \
    py-pip \
    perl \
    ruby-full \
    ruby-dev 

RUN apk update && apk upgrade
RUN apk add --no-cache --progress alpine-sdk libffi-dev\
	openssl-dev readline-dev sqlite-dev \
	autoconf bison libxml2-dev postgresql-dev \
	libpcap-dev yaml-dev subversion git sqlite \
	ncurses ncurses-dev nmap

# services install
RUN apk update && apk upgrade
RUN apk add --no-cache nginx \
    openssh \
    postgresql 

# exploit tools
# metasploit-framework
WORKDIR /opt/
RUN git clone https://github.com/rapid7/metasploit-framework.git
WORKDIR /opt/metasploit-framework/
RUN gem update --system
RUN gem install wirble sqlite bundler
RUN gem install bundler -v '1.17.3'
RUN mkdir /home/7pine/.msf4
RUN mkdir /home/7pine/.bundle
RUN bundle install

RUN for MSF in $(ls msf*); do \ 
	if ! [ -L /usr/local/bin/$MSF ]; then \
		ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF; \
	fi \
done