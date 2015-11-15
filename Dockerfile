FROM debian:wheezy
MAINTAINER Steven Bower <sbower@alcyon.net>

ENV LANG C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -q -y --no-install-recommends \
      tsocks \
      transmission-daemon \
    && apt-get clean -q -y \
    && rm -rf /var/lib/apt/lists/*

COPY ./tsocks.conf /etc/tsocks.conf
COPY ./settings.json /etc/transmission-daemon/settings.json
COPY ./start.sh /start.sh
RUN chmod 600 /etc/transmission-daemon/settings.json \
    && chmod 755 /start.sh \
    && chmod 600 /etc/tsocks.conf

VOLUME ["/data"]

#CMD ["/usr/bin/tsocks", "/usr/bin/transmission-daemon", "-f", "--no-portmap", "-g", "/etc/transmission-daemon"]
#CMD umask 002 && /usr/bin/tsocks /usr/bin/transmission-daemon -f --no-portmap -g /etc/transmission-daemon
CMD ["/start.sh"]
