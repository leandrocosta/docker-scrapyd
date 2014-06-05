FROM ubuntu:14.04
MAINTAINER Leandro Costa <leandro.costa@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Add scrapy APT repository
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN echo "deb http://archive.scrapy.org/ubuntu scrapy main" > /etc/apt/sources.list.d/scrapy.list
RUN apt-get update

# Install scrapyd
RUN apt-get install -y scrapyd

# Expose scrapyd default port
EXPOSE 6800

# Set scrapyd as run entrypoint
ENTRYPOINT ["/usr/bin/scrapyd"]
